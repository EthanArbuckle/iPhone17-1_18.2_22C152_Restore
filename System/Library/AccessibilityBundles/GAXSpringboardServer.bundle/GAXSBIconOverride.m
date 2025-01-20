@interface GAXSBIconOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxNeedsLaunchEnabledAppearance;
- (BOOL)_gaxShouldAppearLaunchDisabled;
- (BOOL)isLaunchEnabled;
- (BOOL)isUninstallSupported;
- (void)_gaxSetNeedsLaunchEnabledAppearance:(BOOL)a3;
@end

@implementation GAXSBIconOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_gaxNeedsLaunchEnabledAppearance
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_37A41);
}

- (void)_gaxSetNeedsLaunchEnabledAppearance:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isUninstallSupported", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isLaunchEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"contextMenuInteraction:configurationForMenuAtLocation:", "@", "{CGPoint=dd}", 0);
}

- (BOOL)_gaxShouldAppearLaunchDisabled
{
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 isActive]) {
    unsigned int v4 = ![(GAXSBIconOverride *)self _gaxNeedsLaunchEnabledAppearance];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isUninstallSupported
{
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 isActive])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBIconOverride;
    BOOL v4 = [(GAXSBIconOverride *)&v6 isUninstallSupported];
  }

  return v4;
}

- (BOOL)isLaunchEnabled
{
  if ([(GAXSBIconOverride *)self _gaxShouldAppearLaunchDisabled]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GAXSBIconOverride;
  return [(GAXSBIconOverride *)&v4 isLaunchEnabled];
}

@end