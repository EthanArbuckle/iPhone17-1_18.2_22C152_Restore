@interface PKPaymentSetupFieldsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4;
@end

@implementation PKPaymentSetupFieldsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentSetupFieldsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentSetupFieldsViewController" hasInstanceVariable:@"_headerView" withType:"PKTableHeaderView"];
  [v3 validateClass:@"PKTableHeaderView"];
  [v3 validateClass:@"PKTableHeaderView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupFieldsViewController", @"setHeaderViewTitle:subtitle:", "v", "@", "@", 0);
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v15 = 0;
  objc_opt_class();
  v8 = [(PKPaymentSetupFieldsViewControllerAccessibility *)self safeValueForKey:@"_headerView"];
  v9 = [v8 safeValueForKey:@"_subtitleLabel"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 text];

  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupFieldsViewControllerAccessibility;
  [(PKPaymentSetupFieldsViewControllerAccessibility *)&v14 setHeaderViewTitle:v6 subtitle:v7];
  char v15 = 0;
  objc_opt_class();
  uint64_t v12 = __UIAccessibilityCastAsClass();
  if (v15) {
    abort();
  }
  v13 = (void *)v12;
  if (([v11 isEqualToString:v12] & 1) == 0 && objc_msgSend(v13, "length")) {
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

@end