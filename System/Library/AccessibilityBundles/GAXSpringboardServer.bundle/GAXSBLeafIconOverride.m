@interface GAXSBLeafIconOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isLaunchEnabled;
@end

@implementation GAXSBLeafIconOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBLeafIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isLaunchEnabled
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
    v6.super_class = (Class)GAXSBLeafIconOverride;
    BOOL v4 = [(GAXSBLeafIconOverride *)&v6 isLaunchEnabled];
  }

  return v4;
}

@end