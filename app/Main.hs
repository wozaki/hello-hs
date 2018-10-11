module Main where

--import Lib
import Network.HTTP.Client
import Data.Aeson

data Foo = Foo { id :: Int, content :: String } deriving Show

main :: IO ()
--main = putStrLn "Hello, world!"

main = do
  manager <- newManager defaultManagerSettings
  request <- parseRequest "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"
  response <- httpLbs request manager
  print $ responseBody response