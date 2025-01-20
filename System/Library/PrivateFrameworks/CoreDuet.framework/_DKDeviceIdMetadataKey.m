@interface _DKDeviceIdMetadataKey
+ (id)deviceIdentifier;
@end

@implementation _DKDeviceIdMetadataKey

+ (id)deviceIdentifier
{
  return @"_DKWatchActive-deviceId";
}

@end