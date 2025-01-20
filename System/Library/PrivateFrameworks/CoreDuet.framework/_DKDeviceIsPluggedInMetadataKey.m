@interface _DKDeviceIsPluggedInMetadataKey
+ (id)adapterIsWireless;
+ (id)adapterType;
@end

@implementation _DKDeviceIsPluggedInMetadataKey

+ (id)adapterType
{
  return @"_DKDeviceIsPluggedInMetadataKey-adapterType";
}

+ (id)adapterIsWireless
{
  return @"_DKDeviceIsPluggedInMetadataKey-adapterIsWireless";
}

@end