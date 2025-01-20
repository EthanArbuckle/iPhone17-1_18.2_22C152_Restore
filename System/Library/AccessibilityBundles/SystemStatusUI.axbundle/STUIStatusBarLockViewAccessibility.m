@interface STUIStatusBarLockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)animateUnlockWithCompletionBlock:(id)a3;
@end

@implementation STUIStatusBarLockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarLockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
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
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarLockViewAccessibility;
  return *MEMORY[0x263F813F0] | [(STUIStatusBarLockViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F81368];
}

- (void)animateUnlockWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__STUIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke;
  v7[3] = &unk_26515CA08;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarLockViewAccessibility;
  id v5 = v4;
  [(STUIStatusBarLockViewAccessibility *)&v6 animateUnlockWithCompletionBlock:v7];
}

void __71__STUIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  if (v2)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v4, 0);
  }
}

@end