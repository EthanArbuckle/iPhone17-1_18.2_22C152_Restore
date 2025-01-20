@interface HMUDevice
+ (BOOL)isAccessory;
+ (BOOL)isAppleTV;
+ (BOOL)isAudioAccessory;
+ (BOOL)isPad;
+ (BOOL)isPhone;
+ (int)deviceClass;
@end

@implementation HMUDevice

+ (BOOL)isAccessory
{
  if (+[HMUDevice isAudioAccessory]) {
    return 1;
  }
  return +[HMUDevice isAppleTV];
}

+ (BOOL)isAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

+ (BOOL)isAppleTV
{
  return MGGetSInt32Answer() == 4;
}

+ (BOOL)isPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)isPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (int)deviceClass
{
  return MGGetSInt32Answer();
}

@end