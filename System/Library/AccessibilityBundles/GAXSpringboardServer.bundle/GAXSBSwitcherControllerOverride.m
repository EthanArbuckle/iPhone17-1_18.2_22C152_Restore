@interface GAXSBSwitcherControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxShouldLimitActiveAppLayoutToCurrentApp;
- (id)_currentFloatingAppLayout;
- (void)_gaxSetShouldLimitActiveAppLayoutToCurrentApp:(BOOL)a3;
@end

@implementation GAXSBSwitcherControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitcherController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_gaxShouldLimitActiveAppLayoutToCurrentApp
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_37A60);
}

- (void)_gaxSetShouldLimitActiveAppLayoutToCurrentApp:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_currentFloatingAppLayout
{
  v7.receiver = self;
  v7.super_class = (Class)GAXSBSwitcherControllerOverride;
  v3 = [(GAXSBSwitcherControllerOverride *)&v7 _currentFloatingAppLayout];
  v4 = +[GAXSpringboard sharedInstance];
  if (-[GAXSBSwitcherControllerOverride _gaxShouldLimitActiveAppLayoutToCurrentApp](self, "_gaxShouldLimitActiveAppLayoutToCurrentApp")&& ([v4 isFrontmostAppLayout:v3] & 1) == 0)
  {
    v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_15F08((uint64_t)v3, v5);
    }

    v3 = 0;
  }

  return v3;
}

@end