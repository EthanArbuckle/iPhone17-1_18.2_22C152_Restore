@interface WFBannerPrototypeSettingsDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation WFBannerPrototypeSettingsDomain

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

+ (id)domainName
{
  return @"Runtime UI";
}

+ (id)domainGroupName
{
  return @"Shortcuts";
}

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFBannerPrototypeSettingsDomain;
  v2 = [super rootSettings];

  return v2;
}

@end