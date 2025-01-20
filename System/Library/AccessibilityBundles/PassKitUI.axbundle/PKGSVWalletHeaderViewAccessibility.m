@interface PKGSVWalletHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
- (void)setShowActivityIndicator:(BOOL)a3;
@end

@implementation PKGSVWalletHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKGSVWalletHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKGSVWalletHeaderView" hasInstanceVariable:@"_titleView" withType:"UILabel"];
  [v3 validateClass:@"PKGSVWalletHeaderView" hasInstanceVariable:@"_actionButton" withType:"PKContinuousButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGSVWalletHeaderView", @"setShowActivityIndicator:", "v", "B", 0);
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKGSVWalletHeaderViewAccessibility;
  -[PKGSVWalletHeaderViewAccessibility setShowActivityIndicator:](&v6, sel_setShowActivityIndicator_);
  if (v3)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
    v5 = accessibilityLocalizedString(@"loading");
    UIAccessibilityPostNotification(v4, v5);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)PKGSVWalletHeaderViewAccessibility;
  [(PKGSVWalletHeaderViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  BOOL v3 = [(PKGSVWalletHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
  UIAccessibilityNotifications v4 = accessibilityLocalizedString(@"add.card.button");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = *MEMORY[0x263F1CEF8];
  objc_super v6 = [(PKGSVWalletHeaderViewAccessibility *)self safeUIViewForKey:@"_titleView"];
  [v6 setAccessibilityTraits:v5];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PKGSVWalletHeaderViewAccessibility;
  [(PKGSVWalletHeaderViewAccessibility *)&v3 didMoveToWindow];
  [(PKGSVWalletHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end