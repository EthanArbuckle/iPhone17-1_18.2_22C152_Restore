@interface CODeviceClass
+ (BOOL)isAppleTV;
+ (BOOL)isAudioAccessory;
+ (BOOL)isPad;
+ (BOOL)isPhone;
+ (int)deviceClass;
@end

@implementation CODeviceClass

+ (BOOL)isAudioAccessory
{
  return [a1 deviceClass] == 7;
}

+ (BOOL)isPad
{
  return [a1 deviceClass] == 3;
}

+ (BOOL)isPhone
{
  return [a1 deviceClass] == 1;
}

+ (BOOL)isAppleTV
{
  return [a1 deviceClass] == 4;
}

+ (int)deviceClass
{
  if (deviceClass_onceToken != -1) {
    dispatch_once(&deviceClass_onceToken, &__block_literal_global_7);
  }
  return deviceClass_result;
}

uint64_t __28__CODeviceClass_deviceClass__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceClass_uint64_t result = result;
  return result;
}

@end