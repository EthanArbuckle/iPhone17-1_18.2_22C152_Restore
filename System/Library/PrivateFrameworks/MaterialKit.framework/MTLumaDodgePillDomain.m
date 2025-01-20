@interface MTLumaDodgePillDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation MTLumaDodgePillDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTLumaDodgePillDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);

  return v2;
}

+ (id)domainGroupName
{
  return @"Materials";
}

+ (id)domainName
{
  return @"Luma Dodge Pill";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end