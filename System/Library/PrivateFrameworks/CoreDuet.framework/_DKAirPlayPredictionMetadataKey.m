@interface _DKAirPlayPredictionMetadataKey
+ (id)outputDeviceID;
+ (id)subtype;
@end

@implementation _DKAirPlayPredictionMetadataKey

+ (id)outputDeviceID
{
  return @"_DKAirPlayPredictionMetadataKey-outputDeviceID";
}

+ (id)subtype
{
  return @"_DKAirPlayPredictionMetadataKey-subtype";
}

@end