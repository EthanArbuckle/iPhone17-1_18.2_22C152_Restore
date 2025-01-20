@interface _DKTombstoneMetadataKey
+ (id)eventSourceDeviceID;
+ (id)eventStreamName;
@end

@implementation _DKTombstoneMetadataKey

+ (id)eventStreamName
{
  return @"_DKTombstoneMetadataKey-eventStreamName";
}

+ (id)eventSourceDeviceID
{
  return @"_DKTombstoneMetadataKey-eventSourceDeviceID";
}

@end