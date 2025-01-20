@interface _UIStatusBarLockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)animateUnlockWithCompletionBlock:(id)a3;
@end

@implementation _UIStatusBarLockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarLockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarLockView", @"animateUnlockWithCompletionBlock:", "v", "@?", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"status.icon.lock");
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarLockViewAccessibility;
  return [(_UIStatusBarLockViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
}

- (void)animateUnlockWithCompletionBlock:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = v12;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __70___UIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke;
  v9 = &unk_2650AFB70;
  id v10 = location[0];
  v4.receiver = v3;
  v4.super_class = (Class)_UIStatusBarLockViewAccessibility;
  -[_UIStatusBarLockViewAccessibility animateUnlockWithCompletionBlock:](&v4, sel_animateUnlockWithCompletionBlock_);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

@end