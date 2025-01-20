@interface PRXCardContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setInfoButtonAction:(id)a3;
- (void)viewDidAppear;
- (void)viewDidLoad;
@end

@implementation PRXCardContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRXCardContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardContentViewController", @"infoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardContentViewController", @"setInfoButtonAction:", "v", "@", 0);
  [v3 validateClass:@"PRXCardContentViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PRXCardContentViewController" hasInstanceVariable:@"_contentView" withType:"PRXCardContentView"];
  [v3 validateClass:@"PRXCardContentView" hasInstanceVariable:@"_titleView" withType:"UIView<PRXTextContainer>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PRXCardContentViewControllerAccessibility;
  [(PRXCardContentViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"info.button");
  v4 = [(PRXCardContentViewControllerAccessibility *)self safeUIViewForKey:@"infoButton"];
  [v4 setAccessibilityLabel:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentViewControllerAccessibility;
  [(PRXCardContentViewControllerAccessibility *)&v3 viewDidLoad];
  [(PRXCardContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear
{
  v2.receiver = self;
  v2.super_class = (Class)PRXCardContentViewControllerAccessibility;
  [(PRXCardContentViewControllerAccessibility *)&v2 viewDidAppear];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __58__PRXCardContentViewControllerAccessibility_viewDidAppear__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"_contentView"];
  objc_super v2 = [v3 safeValueForKey:@"_titleView"];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)setInfoButtonAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRXCardContentViewControllerAccessibility;
  [(PRXCardContentViewControllerAccessibility *)&v4 setInfoButtonAction:a3];
  [(PRXCardContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end