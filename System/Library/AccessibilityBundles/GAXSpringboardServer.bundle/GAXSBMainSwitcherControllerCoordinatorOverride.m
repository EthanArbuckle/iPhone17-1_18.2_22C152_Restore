@interface GAXSBMainSwitcherControllerCoordinatorOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_buildAppLayoutCache;
@end

@implementation GAXSBMainSwitcherControllerCoordinatorOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBMainSwitcherControllerCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_buildAppLayoutCache", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"enumerateSwitcherControllersWithBlock:", "v", "@?", 0);
  [v3 validateClass:@"SBMainSwitcherControllerCoordinator" hasInstanceVariable:@"_mainSwitcherModel" withType:"SBAppSwitcherModel"];
}

- (void)_buildAppLayoutCache
{
  char v14 = 0;
  objc_opt_class();
  id v3 = [(GAXSBMainSwitcherControllerCoordinatorOverride *)self safeValueForKey:@"_mainSwitcherModel"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  v5 = +[GAXSpringboard sharedInstance];
  if ([v5 isActive])
  {
    v6 = +[AXSettings sharedInstance];
    unsigned int v7 = [v6 guidedAccessAllowsMultipleWindows];

    if (v7)
    {
      v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      v11 = sub_12830;
      v12 = &unk_28670;
      v13 = self;
      AXPerformSafeBlock();
      [v4 _gaxSetShouldLimitAppLayoutsToCurrentApp:1];
    }
  }
  else
  {
  }
  v8.receiver = self;
  v8.super_class = (Class)GAXSBMainSwitcherControllerCoordinatorOverride;
  [(GAXSBMainSwitcherControllerCoordinatorOverride *)&v8 _buildAppLayoutCache];
  AXPerformSafeBlock();
  [v4 _gaxSetShouldLimitAppLayoutsToCurrentApp:0];
}

@end