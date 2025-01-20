@interface PKTransactionHistoryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_barButtonItems;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKTransactionHistoryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKTransactionHistoryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKTransactionHistoryViewController" hasInstanceVariable:@"_detailsButton" withType:"UIButton"];
  [v3 validateClass:@"PKTransactionHistoryViewController" hasInstanceVariable:@"_phoneButton" withType:"UIButton"];
  [v3 validateClass:@"PKTransactionHistoryViewController" hasInstanceVariable:@"_messageButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKTransactionHistoryViewController", @"_barButtonItems", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionHistoryViewControllerAccessibility;
  [(PKTransactionHistoryViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKTransactionHistoryViewControllerAccessibility *)self safeValueForKey:@"_detailsButton"];
  v4 = accessibilityLocalizedString(@"details.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(PKTransactionHistoryViewControllerAccessibility *)self safeValueForKey:@"_phoneButton"];
  v6 = accessibilityLocalizedString(@"phone.contact.button");
  [v5 setAccessibilityLabel:v6];

  v7 = [(PKTransactionHistoryViewControllerAccessibility *)self safeValueForKey:@"_messageButton"];
  v8 = accessibilityLocalizedString(@"message.contact.button");
  [v7 setAccessibilityLabel:v8];
}

- (id)_barButtonItems
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryViewControllerAccessibility;
  id v3 = [(PKTransactionHistoryViewControllerAccessibility *)&v5 _barButtonItems];
  [(PKTransactionHistoryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end