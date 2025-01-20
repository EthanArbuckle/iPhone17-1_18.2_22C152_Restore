@interface AXSBServerUIApplication
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)alertInterfaceOrientation;
- (int64_t)interfaceOrientation;
@end

@implementation AXSBServerUIApplication

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)alertInterfaceOrientation
{
  if ([(id)SBServerHelper shouldOverrideInterfaceOrientation])
  {
    v3 = (void *)*MEMORY[0x263F83300];
    return [v3 activeInterfaceOrientation];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXSBServerUIApplication;
    return [(AXSBServerUIApplication *)&v5 alertInterfaceOrientation];
  }
}

- (int64_t)interfaceOrientation
{
  if ([(id)SBServerHelper shouldOverrideInterfaceOrientation])
  {
    v3 = (void *)*MEMORY[0x263F83300];
    return [v3 activeInterfaceOrientation];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXSBServerUIApplication;
    return [(AXSBServerUIApplication *)&v5 interfaceOrientation];
  }
}

@end