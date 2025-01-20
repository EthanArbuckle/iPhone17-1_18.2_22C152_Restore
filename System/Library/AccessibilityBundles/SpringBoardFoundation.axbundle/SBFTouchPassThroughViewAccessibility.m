@interface SBFTouchPassThroughViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)accessibilityActivate;
@end

@implementation SBFTouchPassThroughViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFTouchPassThroughView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFTouchPassThroughView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isTransparentFocusRegion", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(SBFTouchPassThroughViewAccessibility *)self _accessibilityWindow];
  v4 = [v3 accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"PIP-SBInteractionPassThroughView"];

  if (v5)
  {
    v6 = [(SBFTouchPassThroughViewAccessibility *)self safeValueForKey:@"_viewDelegate"];
    char v7 = [v6 accessibilityActivate];

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFTouchPassThroughViewAccessibility;
    return [(SBFTouchPassThroughViewAccessibility *)&v9 accessibilityActivate];
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v3 = [(SBFTouchPassThroughViewAccessibility *)self _accessibilityWindow];
  v4 = [v3 accessibilityIdentifier];
  char v5 = [v4 isEqualToString:@"PIP-SBInteractionPassThroughView"];

  if (v5) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)SBFTouchPassThroughViewAccessibility;
  return [(SBFTouchPassThroughViewAccessibility *)&v7 _accessibilitySupportsActivateAction];
}

- (BOOL)_isTransparentFocusRegion
{
  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughViewAccessibility;
  LOBYTE(v3) = [(SBFTouchPassThroughViewAccessibility *)&v5 _isTransparentFocusRegion];
  if ([(SBFTouchPassThroughViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return [(SBFTouchPassThroughViewAccessibility *)self safeBoolForKey:@"canBecomeFocused"] ^ 1; {
  return v3;
  }
}

@end