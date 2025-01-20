@interface _UITextEffectsRemoteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (int64_t)_accessibilitySortPriority;
@end

@implementation _UITextEffectsRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITextEffectsRemoteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UITextEffectsRemoteView" isKindOfClass:@"_UIRemoteView"];
  v3 = "@";
  [location[0] validateClass:@"UIPeripheralHost" hasInstanceMethod:@"containerRootController" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputWindowController", @"inputViewSet", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputViewSet", @"inputView", v3, 0);
  [location[0] validateClass:@"UITextEffectsWindow" hasInstanceVariable:@"_activeEffectsCount" withType:"Q"];
  objc_storeStrong(v5, obj);
}

- (CGPoint)accessibilityActivationPoint
{
  v9[2] = self;
  v9[1] = (id)a2;
  id v8 = (id)[MEMORY[0x263F1C850] sharedInstance];
  id v7 = (id)[v8 safeValueForKey:@"containerRootController"];
  id v6 = (id)[v7 safeValueForKey:@"inputViewSet"];
  v9[0] = (id)[v6 safeUIViewForKey:@"inputView"];

  [v9[0] bounds];
  UIAccessibilityConvertFrameToScreenCoordinates(v13, (UIView *)v9[0]);
  AX_CGRectGetCenter();
  double v10 = v2;
  double v11 = v3;
  objc_storeStrong(v9, 0);
  double v4 = v10;
  double v5 = v11;
  result.y = v5;
  result.x = v4;
  return result;
}

- (int64_t)_accessibilitySortPriority
{
  double v10 = self;
  location[1] = (id)a2;
  id v7 = (id)[(_UITextEffectsRemoteViewAccessibility *)self window];
  id v2 = (id)AXUIKeyboardWindow();
  BOOL v8 = v7 != v2;

  if (v8) {
    return -1;
  }
  location[0] = (id)[(_UITextEffectsRemoteViewAccessibility *)v10 accessibilityContainer];
  while (location[0])
  {
    uint64_t v3 = [location[0] _accessibilitySortPriority];
    if (v3 == *MEMORY[0x263F81288]) {
      [location[0] _accessibilitySetSortPriority:-2];
    }
    id v4 = (id)[location[0] accessibilityContainer];
    id v5 = location[0];
    location[0] = v4;
  }
  int64_t v11 = -2;
  objc_storeStrong(location, 0);
  return v11;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v6 = a3;
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)accessibilityElements
{
  double v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)[(_UITextEffectsRemoteViewAccessibility *)self window];
  id v4 = (id)[v9[0] windowScene];
  id v8 = (id)[v4 safeValueForKey:@"_FBSScene"];

  id location = (id)[v8 identifier];
  if ((AXUIKeyboardIsOOP() & 1) != 0
    && ((axIsAutomaticArbiterClientKeyboardActive() & 1) == 0 && (axKeyboardInSeparateProcessAndScene(v9[0]) & 1) != 0
     || ([location isEqualToString:*MEMORY[0x263F21350]] & 1) != 0))
  {
    id v11 = 0;
    int v6 = 1;
  }
  else
  {
    v5.receiver = v10;
    v5.super_class = (Class)_UITextEffectsRemoteViewAccessibility;
    id v11 = [(_UITextEffectsRemoteViewAccessibility *)&v5 accessibilityElements];
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  id v2 = v11;

  return v2;
}

@end