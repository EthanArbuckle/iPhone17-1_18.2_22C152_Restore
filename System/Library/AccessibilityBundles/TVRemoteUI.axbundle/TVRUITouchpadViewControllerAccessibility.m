@interface TVRUITouchpadViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)touchpadMode;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateTouchpad:(id)a3;
- (void)dealloc;
- (void)setDevice:(id)a3;
@end

@implementation TVRUITouchpadViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUITouchpadViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  [(TVRUITouchpadViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__accessibilityUpdateTouchpad_ name:*MEMORY[0x263F1CEB8] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  [(TVRUITouchpadViewControllerAccessibility *)&v4 dealloc];
}

- (int64_t)touchpadMode
{
  if (UIAccessibilityIsSwitchControlRunning()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  return [(TVRUITouchpadViewControllerAccessibility *)&v4 touchpadMode];
}

- (void)setDevice:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  [(TVRUITouchpadViewControllerAccessibility *)&v3 setDevice:a3];
  if (UIAccessibilityIsSwitchControlRunning()) {
    AXPerformSafeBlock();
  }
}

uint64_t __54__TVRUITouchpadViewControllerAccessibility_setDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToDirectionalControlView];
}

- (void)_accessibilityUpdateTouchpad:(id)a3
{
  id v4 = [(TVRUITouchpadViewControllerAccessibility *)self safeValueForKey:@"remoteDevice"];
  [(TVRUITouchpadViewControllerAccessibility *)self setDevice:v4];
}

@end