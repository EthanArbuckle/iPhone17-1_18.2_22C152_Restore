@interface SBFluidSwitcherTouchPassThroughScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_forwardsToParentScroller;
- (id)focusGroupIdentifier;
@end

@implementation SBFluidSwitcherTouchPassThroughScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherTouchPassThroughScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFluidSwitcherTouchPassThroughScrollView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_forwardsToParentScroller", "B", 0);
}

- (id)focusGroupIdentifier
{
  if ([(SBFluidSwitcherTouchPassThroughScrollViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollViewAccessibility;
    id v3 = [(SBFluidSwitcherTouchPassThroughScrollViewAccessibility *)&v5 focusGroupIdentifier];
  }

  return v3;
}

- (BOOL)_forwardsToParentScroller
{
  if ([(SBFluidSwitcherTouchPassThroughScrollViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollViewAccessibility;
  return [(SBFluidSwitcherTouchPassThroughScrollViewAccessibility *)&v4 _forwardsToParentScroller];
}

@end