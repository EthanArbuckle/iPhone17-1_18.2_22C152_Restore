@interface SearchUICardDetailsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (SearchUICardDetailsViewAccessibility)initWithTitle:(id)a3 details:(id)a4 controller:(id)a5;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SearchUICardDetailsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUICardDetailsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardDetailsView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardDetailsView", @"detailsTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardDetailsView", @"initWithTitle: details: controller:", "@", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICardDetailsViewAccessibility;
  [(SearchUICardDetailsViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SearchUICardDetailsViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(SearchUICardDetailsViewAccessibility *)self safeValueForKey:@"detailsTextView"];
  [v4 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUICardDetailsViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(SearchUICardDetailsViewAccessibility *)self safeValueForKey:@"detailsTextView"];
  objc_super v5 = [v3 accessibilityLabel];
  v8 = [v4 safeValueForKey:@"attributedText"];
  v6 = __AXStringForVariables();

  return v6;
}

- (SearchUICardDetailsViewAccessibility)initWithTitle:(id)a3 details:(id)a4 controller:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICardDetailsViewAccessibility;
  objc_super v5 = [(SearchUICardDetailsViewAccessibility *)&v7 initWithTitle:a3 details:a4 controller:a5];
  [(SearchUICardDetailsViewAccessibility *)v5 _accessibilityLoadAccessibilityInformation];

  return v5;
}

@end