@interface _DKBluetoothMetadataKey
+ (id)address;
+ (id)batteryLevelHeadphoneCase;
+ (id)batteryLevelHeadphoneLeft;
+ (id)batteryLevelHeadphoneRight;
+ (id)deviceType;
+ (id)isAppleAudioDevice;
+ (id)isUserWearing;
+ (id)name;
+ (id)productID;
@end

@implementation _DKBluetoothMetadataKey

+ (id)address
{
  return @"_DKBluetoothMetadataKey-address";
}

+ (id)name
{
  return @"_DKBluetoothMetadataKey-name";
}

+ (id)deviceType
{
  return @"_DKBluetoothMetadataKey-deviceType";
}

+ (id)isAppleAudioDevice
{
  return @"_DKBluetoothMetadataKey-isAppleAudioDevice";
}

+ (id)isUserWearing
{
  return @"_DKBluetoothMetadataKey-isUserWearing";
}

+ (id)productID
{
  return @"_DKBluetoothMetadataKey-productID";
}

+ (id)batteryLevelHeadphoneLeft
{
  return @"_DKBluetoothMetadataKey-batteryLevelHeadphoneLeft";
}

+ (id)batteryLevelHeadphoneRight
{
  return @"_DKBluetoothMetadataKey-batteryLevelHeadphoneRight";
}

+ (id)batteryLevelHeadphoneCase
{
  return @"_DKBluetoothMetadataKey-batteryLevelHeadphoneCase";
}

@end