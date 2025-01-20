@interface AMUIPosterSwitcherDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation AMUIPosterSwitcherDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AMUIPosterSwitcherDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);

  return v2;
}

+ (id)domainGroupName
{
  return @"Domino";
}

+ (id)domainName
{
  return @"Quick Switching";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end