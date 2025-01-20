@interface InCallBannerHostViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation InCallBannerHostViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallBannerHostViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.InCallBannerHostViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallBannerHostViewController", @"menuPresented", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_initWeak(&location, self);
  v6.receiver = self;
  v6.super_class = (Class)InCallBannerHostViewControllerAccessibility;
  [(InCallBannerHostViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(InCallBannerHostViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__InCallBannerHostViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265119F78;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityViewIsModalBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __89__InCallBannerHostViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"menuPresented"];

  return v2;
}

@end