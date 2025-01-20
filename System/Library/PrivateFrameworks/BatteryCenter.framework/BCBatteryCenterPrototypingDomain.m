@interface BCBatteryCenterPrototypingDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation BCBatteryCenterPrototypingDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___BCBatteryCenterPrototypingDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"BatteryCenter";
}

+ (id)domainName
{
  return @"BatteryDeviceController";
}

+ (Class)rootSettingsClass
{
  return 0;
}

@end