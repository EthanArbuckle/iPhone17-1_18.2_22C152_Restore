@interface BTSSPPairingRequestAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)show;
@end

@implementation BTSSPPairingRequestAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BTSSPPairingRequest";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BTSSPPairingRequest" hasInstanceVariable:@"_alert" withType:"UIAlertController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BTSSPPairingRequest", @"show", "v", 0);
}

- (void)show
{
  v7.receiver = self;
  v7.super_class = (Class)BTSSPPairingRequestAccessibility;
  [(BTSSPPairingRequestAccessibility *)&v7 show];
  objc_opt_class();
  id v3 = [(BTSSPPairingRequestAccessibility *)self safeValueForKey:@"_alert"];
  v4 = __UIAccessibilityCastAsClass();

  v6 = v4;
  id v5 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __40__BTSSPPairingRequestAccessibility_show__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CDC8];
  id v2 = [*(id *)(a1 + 32) message];
  UIAccessibilityPostNotification(v1, v2);
}

@end