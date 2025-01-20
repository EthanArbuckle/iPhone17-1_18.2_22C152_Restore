@interface PSTimeRangeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PSTimeRangeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSTimeRangeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PSTimeRangeCell" hasInstanceVariable:@"_fromTitle" withType:"UILabel"];
  [v3 validateClass:@"PSTimeRangeCell" hasInstanceVariable:@"_fromTime" withType:"UILabel"];
  [v3 validateClass:@"PSTimeRangeCell" hasInstanceVariable:@"_toTitle" withType:"UILabel"];
  [v3 validateClass:@"PSTimeRangeCell" hasInstanceVariable:@"_toTime" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PSTimeRangeCellAccessibility;
  [(PSTimeRangeCellAccessibility *)&v3 accessibilityTraits];
  return _AXTraitsRemoveTrait();
}

- (id)accessibilityLabel
{
  objc_super v3 = [(PSTimeRangeCellAccessibility *)self safeValueForKey:@"_fromTitle"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PSTimeRangeCellAccessibility *)self safeValueForKey:@"_fromTime"];
  v6 = [v5 accessibilityLabel];
  v7 = [(PSTimeRangeCellAccessibility *)self safeValueForKey:@"_toTitle"];
  v8 = [v7 accessibilityLabel];
  v9 = [(PSTimeRangeCellAccessibility *)self safeValueForKey:@"_toTime"];
  v12 = [v9 accessibilityLabel];
  v10 = __UIAXStringForVariables();

  return v10;
}

@end