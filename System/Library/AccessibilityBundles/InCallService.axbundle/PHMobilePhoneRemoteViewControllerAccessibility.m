@interface PHMobilePhoneRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHMobilePhoneRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHMobilePhoneRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHMobilePhoneRemoteViewController" isKindOfClass:@"PHPhoneRemoteViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHPhoneRemoteViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHPhoneRemoteViewController", @"viewWillDisappear:", "v", "B", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHMobilePhoneRemoteViewControllerAccessibility;
  [(PHMobilePhoneRemoteViewControllerAccessibility *)&v3 viewDidAppear:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__PHMobilePhoneRemoteViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE68];
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
  UIAccessibilityPostNotification(v1, v2);

  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"add.call.hint");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHMobilePhoneRemoteViewControllerAccessibility;
  [(PHMobilePhoneRemoteViewControllerAccessibility *)&v3 viewWillDisappear:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __68__PHMobilePhoneRemoteViewControllerAccessibility_viewWillDisappear___block_invoke()
{
}

@end