@interface ANDevice
+ (BOOL)isAudioAccessory;
+ (BOOL)isPad;
+ (BOOL)isPhone;
+ (int)deviceClass;
@end

@implementation ANDevice

+ (BOOL)isAudioAccessory
{
  return MGGetSInt32Answer() == 7;
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