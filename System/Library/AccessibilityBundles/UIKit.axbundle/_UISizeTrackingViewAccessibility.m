@interface _UISizeTrackingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandlesRemoteFocusMovement;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)canBecomeFocused;
- (id)_viewToAddFocusLayer;
- (int)_accessibilityRemotePid;
- (void)_accessibilitySetFocusOnElement:(BOOL)a3;
@end

@implementation _UISizeTrackingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISizeTrackingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UISizeTrackingView";
  v6 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v5 = "@";
  [location[0] validateClass:@"_UISizeTrackingView" hasInstanceMethod:@"remoteViewController" withFullSignature:0];
  v4 = @"_UIRemoteViewController";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"serviceProcessIdentifier", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"didUpdateFocusInContext: withAnimationCoordinator:", v7, v5, v5, 0);
  objc_storeStrong(v9, v8);
}

- (BOOL)canBecomeFocused
{
  v5 = self;
  SEL v4 = a2;
  if ([(_UISizeTrackingViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v3.receiver = v5;
  }
  v3.super_class = (Class)_UISizeTrackingViewAccessibility;
  return [(_UISizeTrackingViewAccessibility *)&v3 canBecomeFocused];
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (void)_accessibilitySetFocusOnElement:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  if (a3)
  {
    v3[1] = (id)MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    v6 = __68___UISizeTrackingViewAccessibility__accessibilitySetFocusOnElement___block_invoke;
    v7 = &unk_2650ADF18;
    id v8 = v11;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v8, 0);
  }
  else
  {
    v3[0] = v11;
    AXPerformSafeBlock();
    objc_storeStrong(v3, 0);
  }
}

- (int)_accessibilityRemotePid
{
  id v4 = (id)[(_UISizeTrackingViewAccessibility *)self safeValueForKey:@"remoteViewController"];
  id v3 = (id)[v4 safeValueForKey:@"serviceProcessIdentifier"];
  int v5 = [v3 intValue];

  return v5;
}

- (BOOL)_accessibilityHandlesRemoteFocusMovement
{
  return 1;
}

@end