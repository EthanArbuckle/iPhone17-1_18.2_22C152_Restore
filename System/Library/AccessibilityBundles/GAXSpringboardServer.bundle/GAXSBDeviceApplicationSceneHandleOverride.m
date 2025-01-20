@interface GAXSBDeviceApplicationSceneHandleOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)overlayStatusBarData;
@end

@implementation GAXSBDeviceApplicationSceneHandleOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBDeviceApplicationSceneHandle";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)overlayStatusBarData
{
  v7.receiver = self;
  v7.super_class = (Class)GAXSBDeviceApplicationSceneHandleOverride;
  v2 = [(GAXSBDeviceApplicationSceneHandleOverride *)&v7 overlayStatusBarData];
  v3 = +[GAXSpringboard sharedInstance];
  unsigned int v4 = [v3 isActive];

  if (v4)
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    [v5 setBackNavigationEntry:0];
    [v5 setForwardNavigationEntry:0];

    v2 = v5;
  }

  return v2;
}

@end