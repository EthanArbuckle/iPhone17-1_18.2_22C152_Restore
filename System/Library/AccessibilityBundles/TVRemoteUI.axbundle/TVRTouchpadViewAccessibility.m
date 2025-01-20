@interface TVRTouchpadViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsDirectTouching;
- (BOOL)_accessibilityIsMatchPoint;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (int64_t)accessibilityNavigationStyle;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityFocusChanged:(id)a3;
- (void)_accessibilitySetIsDirectTouching:(BOOL)a3;
@end

@implementation TVRTouchpadViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRTouchpadView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRTouchpadView", @"touchProcessor", "@", 0);
  [v3 validateClass:@"TVRMatchPointTouchProcessor"];
}

- (BOOL)isAccessibilityElement
{
  if (UIAccessibilityIsSwitchControlRunning()) {
    return 0;
  }
  else {
    return ![(TVRTouchpadViewAccessibility *)self _accessibilityIsMatchPoint];
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  [(TVRTouchpadViewAccessibility *)self _accessibilitySetIsDirectTouching:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__accessibilityFocusChanged_ name:*MEMORY[0x263F1CDF8] object:0];

  id v4 = objc_alloc(MEMORY[0x263F21660]);
  v5 = accessibilityLocalizedString(@"tv.remote.touchpad.start.interaction");
  v6 = (void *)[v4 initWithStringOrAttributedString:v5];

  [v6 setAttribute:&unk_26F80D610 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);

  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v3 = (unint64_t *)MEMORY[0x263F1CF18];
  if (!UIAccessibilityIsSwitchControlRunning()
    && [(TVRTouchpadViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    id v3 = (unint64_t *)MEMORY[0x263F1CEE0];
  }
  return *v3;
}

- (id)accessibilityLabel
{
  if ([(TVRTouchpadViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRTouchpadViewAccessibility;
    id v3 = [(TVRTouchpadViewAccessibility *)&v5 accessibilityLabel];
  }
  else
  {
    id v3 = accessibilityLocalizedString(@"tv.remote.touchpad.view");
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(TVRTouchpadViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRTouchpadViewAccessibility;
    id v3 = [(TVRTouchpadViewAccessibility *)&v5 accessibilityHint];
  }
  else
  {
    id v3 = accessibilityLocalizedString(@"tv.remote.touchpad.hint");
  }

  return v3;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (BOOL)_accessibilityIsMatchPoint
{
  v2 = [(TVRTouchpadViewAccessibility *)self safeValueForKey:@"touchProcessor"];
  NSClassFromString(&cfstr_Tvrmatchpointt.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_accessibilityFocusChanged:(id)a3
{
  [(TVRTouchpadViewAccessibility *)self _accessibilitySetIsDirectTouching:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  id v4 = (void *)MEMORY[0x263F21660];
  objc_super v5 = accessibilityLocalizedString(@"tv.remote.touchpad.stopped.interaction");
  id argument = [v4 axAttributedStringWithString:v5];

  [argument setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1CDF8] object:0];
}

- (BOOL)_accessibilityIsDirectTouching
{
  v2 = objc_getAssociatedObject(self, &isDirectTouching);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_accessibilitySetIsDirectTouching:(BOOL)a3
{
  BOOL v3 = a3;
  NSLog(&cfstr_SettingDirectT.isa, a2, a3);
  id v5 = [NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, &isDirectTouching, v5, (void *)1);
}

@end