@interface MSDeviceInfo
+ (BOOL)deviceCanManageMultiUser;
+ (BOOL)deviceSupportsMultipleUsers;
+ (BOOL)isDeviceAppleTV;
+ (BOOL)isDeviceAudioAccessory;
+ (BOOL)isDeviceiPad;
+ (BOOL)isDeviceiPhone;
@end

@implementation MSDeviceInfo

+ (BOOL)isDeviceiPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (BOOL)isDeviceiPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)isDeviceAppleTV
{
  return MGGetSInt32Answer() == 4;
}

+ (BOOL)isDeviceAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

+ (BOOL)deviceSupportsMultipleUsers
{
  if ([(id)objc_opt_class() isDeviceAppleTV]) {
    return 1;
  }
  v3 = objc_opt_class();

  return [v3 isDeviceAudioAccessory];
}

+ (BOOL)deviceCanManageMultiUser
{
  if (([(id)objc_opt_class() deviceSupportsMultipleUsers] & 1) != 0
    || ([(id)objc_opt_class() isDeviceiPhone] & 1) != 0)
  {
    return 1;
  }
  v3 = objc_opt_class();

  return [v3 isDeviceiPad];
}

@end