@interface WLLockScreenViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (void)didAppear;
- (void)willDisappear;
@end

@implementation WLLockScreenViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WLLockScreenView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WLLockScreenCardsViewController", @"dismissAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WLLockScreenView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WLLockScreenView", @"didAppear", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WLLockScreenView", @"willDisappear", "v", 0);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __59__WLLockScreenViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 dismissAnimated:1];
  AXPerformBlockOnMainThreadAfterDelay();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __59__WLLockScreenViewAccessibility_accessibilityPerformEscape__block_invoke_2()
{
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)didAppear
{
  v2.receiver = self;
  v2.super_class = (Class)WLLockScreenViewAccessibility;
  [(WLLockScreenViewAccessibility *)&v2 didAppear];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)willDisappear
{
  v2.receiver = self;
  v2.super_class = (Class)WLLockScreenViewAccessibility;
  [(WLLockScreenViewAccessibility *)&v2 willDisappear];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end