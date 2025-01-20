@interface ACUIAccountSummaryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation ACUIAccountSummaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACUIAccountSummaryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACUIAccountSummaryCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"valueLabel", "@", 0);
  [v3 validateClass:@"ACUIAccountSummaryCell" hasInstanceVariable:@"_dataclassesLabel" withType:"UILabel"];
  [v3 validateClass:@"ACUIAccountSummaryCell" hasInstanceVariable:@"_style" withType:"q"];
}

- (id)accessibilityLabel
{
  id v3 = [(ACUIAccountSummaryCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(ACUIAccountSummaryCellAccessibility *)self safeValueForKey:@"_dataclassesLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end