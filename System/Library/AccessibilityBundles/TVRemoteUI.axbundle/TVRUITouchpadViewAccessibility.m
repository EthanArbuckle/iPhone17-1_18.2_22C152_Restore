@interface TVRUITouchpadViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsDirectTouching;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityFocusChanged:(id)a3;
- (void)_accessibilitySetIsDirectTouching:(BOOL)a3;
@end

@implementation TVRUITouchpadViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUITouchpadView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  [(TVRUITouchpadViewAccessibility *)self _accessibilitySetIsDirectTouching:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__accessibilityFocusChanged_ name:*MEMORY[0x263F1CDF8] object:0];

  id v4 = objc_alloc(MEMORY[0x263F21660]);
  v5 = accessibilityLocalizedString(@"tv.remote.touchpad.start.interaction");
  v6 = (void *)[v4 initWithStringOrAttributedString:v5];

  [v6 setAttribute:&unk_26F80D628 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);

  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3 = (unint64_t *)MEMORY[0x263F1CF18];
  if (!UIAccessibilityIsSwitchControlRunning()
    && [(TVRUITouchpadViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    v3 = (unint64_t *)MEMORY[0x263F1CEE0];
  }
  return *v3;
}

- (id)accessibilityLabel
{
  if ([(TVRUITouchpadViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRUITouchpadViewAccessibility;
    v3 = [(TVRUITouchpadViewAccessibility *)&v5 accessibilityLabel];
  }
  else
  {
    v3 = accessibilityLocalizedString(@"tv.remote.touchpad.view");
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(TVRUITouchpadViewAccessibility *)self _accessibilityIsDirectTouching])
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRUITouchpadViewAccessibility;
    v3 = [(TVRUITouchpadViewAccessibility *)&v5 accessibilityHint];
  }
  else
  {
    v3 = accessibilityLocalizedString(@"tv.remote.touchpad.hint");
  }

  return v3;
}

- (void)_accessibilityFocusChanged:(id)a3
{
  [(TVRUITouchpadViewAccessibility *)self _accessibilitySetIsDirectTouching:0];
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
  v2 = objc_getAssociatedObject(self, &isDirectTouching_0);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_accessibilitySetIsDirectTouching:(BOOL)a3
{
  BOOL v3 = a3;
  NSLog(&cfstr_SettingDirectT.isa, a2, a3);
  id v5 = [NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, &isDirectTouching_0, v5, (void *)1);
}

@end