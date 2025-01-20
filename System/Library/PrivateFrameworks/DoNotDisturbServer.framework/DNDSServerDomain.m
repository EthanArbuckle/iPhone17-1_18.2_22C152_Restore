@interface DNDSServerDomain
+ (Class)rootSettingsClass;
+ (id)domainGroupName;
+ (id)domainName;
+ (id)rootSettings;
@end

@implementation DNDSServerDomain

+ (id)rootSettings
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___DNDSServerDomain;
  v2 = objc_msgSendSuper2(&v4, sel_rootSettings);
  return v2;
}

+ (id)domainGroupName
{
  return @"Focus";
}

+ (id)domainName
{
  return @"Server";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end