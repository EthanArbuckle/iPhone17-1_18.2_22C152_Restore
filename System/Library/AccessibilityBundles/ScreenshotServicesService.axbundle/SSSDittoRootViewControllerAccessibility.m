@interface SSSDittoRootViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)containerViewControllerDidEndDismissAnimation:(id)a3;
- (void)dittoDismissTimerFired:(id)a3;
@end

@implementation SSSDittoRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSDittoRootViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSDittoRootViewController", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSDittoRootViewController", @"dittoDismissTimerFired:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSDittoRootViewController", @"containerViewControllerDidEndDismissAnimation:", "v", "@", 0);
}

- (void)dittoDismissTimerFired:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SSSDittoRootViewControllerAccessibility_dittoDismissTimerFired___block_invoke;
  v8[3] = &unk_26514CF18;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  v6 = (void (**)(void))MEMORY[0x24565F6C0](v8);
  if (_AXSAssistiveTouchScannerEnabled())
  {
    v7 = v6;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v6[2](v6);
  }
}

id __66__SSSDittoRootViewControllerAccessibility_dittoDismissTimerFired___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SSSDittoRootViewControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_dittoDismissTimerFired_, v1);
}

uint64_t __66__SSSDittoRootViewControllerAccessibility_dittoDismissTimerFired___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) safeIntegerForKey:@"state"];
  if (!result)
  {
    objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)containerViewControllerDidEndDismissAnimation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SSSDittoRootViewControllerAccessibility;
  [(SSSDittoRootViewControllerAccessibility *)&v3 containerViewControllerDidEndDismissAnimation:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end