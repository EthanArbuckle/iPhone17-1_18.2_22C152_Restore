@interface PKAccountAutomaticPaymentsDateFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation PKAccountAutomaticPaymentsDateFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKAccountAutomaticPaymentsDateFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKAccountAutomaticPaymentsDateFooterView" isKindOfClass:@"UITableViewHeaderFooterView"];
  [v3 validateClass:@"PKAccountAutomaticPaymentsDateFooterView" hasInstanceVariable:@"_collectionViewController" withType:"PKMonthDayCollectionViewController"];
  [v3 validateClass:@"PKMonthDayCollectionViewController" isKindOfClass:@"UICollectionViewController"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(PKAccountAutomaticPaymentsDateFooterViewAccessibility *)self safeValueForKey:@"_collectionViewController"];
  v5 = [v4 safeValueForKey:@"collectionView"];
  v6 = [(PKAccountAutomaticPaymentsDateFooterViewAccessibility *)self safeValueForKey:@"textLabel"];
  v7 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);

  return v7;
}

@end