@interface GAXSBAppSwitcherModelOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxShouldLimitAppLayoutsToCurrentApp;
- (id)appLayoutsIncludingHiddenAppLayouts:(BOOL)a3;
- (void)_gaxSetShouldLimitAppLayoutsToCurrentApp:(BOOL)a3;
@end

@implementation GAXSBAppSwitcherModelOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_gaxShouldLimitAppLayoutsToCurrentApp
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_37A40);
}

- (void)_gaxSetShouldLimitAppLayoutsToCurrentApp:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)appLayoutsIncludingHiddenAppLayouts:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GAXSBAppSwitcherModelOverride;
  v4 = [(GAXSBAppSwitcherModelOverride *)&v8 appLayoutsIncludingHiddenAppLayouts:a3];
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 count]
    && [(GAXSBAppSwitcherModelOverride *)self _gaxShouldLimitAppLayoutsToCurrentApp])
  {
    v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &stru_28F20);

    id v5 = v6;
    v4 = v5;
  }

  return v4;
}

@end