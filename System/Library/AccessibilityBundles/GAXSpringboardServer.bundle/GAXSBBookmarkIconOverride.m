@interface GAXSBBookmarkIconOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isUninstallSupported;
@end

@implementation GAXSBBookmarkIconOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBBookmarkIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isUninstallSupported
{
  char v7 = 0;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsSafeCategory();
  if ([v3 _gaxShouldAppearLaunchDisabled])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBBookmarkIconOverride;
    BOOL v4 = [(GAXSBBookmarkIconOverride *)&v6 isUninstallSupported];
  }

  return v4;
}

@end