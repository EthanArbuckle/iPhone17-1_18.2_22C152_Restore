@interface FUDatePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (FUDatePickerAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FUDatePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FUDatePicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FUDatePicker" hasInstanceVariable:@"_dayWheel" withType:"FUScrollWheel"];
  [v3 validateClass:@"FUDatePicker" hasInstanceVariable:@"_monthWheel" withType:"FUScrollWheel"];
  [v3 validateClass:@"FUDatePicker" hasInstanceVariable:@"_yearWheel" withType:"FUScrollWheel"];
  [v3 validateClass:@"FUDatePicker" hasInstanceVariable:@"_dayLabel" withType:"UILabel"];
  [v3 validateClass:@"FUDatePicker" hasInstanceVariable:@"_monthLabel" withType:"UILabel"];
  [v3 validateClass:@"FUDatePicker" hasInstanceVariable:@"_yearLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_dayWheel"];
  v4 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_dayLabel"];
  v5 = [v4 safeValueForKey:@"text"];
  [v3 setAccessibilityLabel:v5];

  v6 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_monthWheel"];
  v7 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_monthLabel"];
  v8 = [v7 safeValueForKey:@"text"];
  [v6 setAccessibilityLabel:v8];

  v9 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_yearWheel"];
  v10 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_yearLabel"];
  v11 = [v10 safeValueForKey:@"text"];
  [v9 setAccessibilityLabel:v11];

  v12 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_dayLabel"];
  [v12 setIsAccessibilityElement:0];

  v13 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_monthLabel"];
  [v13 setIsAccessibilityElement:0];

  v14 = [(FUDatePickerAccessibility *)self safeValueForKey:@"_yearLabel"];
  [v14 setIsAccessibilityElement:0];

  v15.receiver = self;
  v15.super_class = (Class)FUDatePickerAccessibility;
  [(FUDatePickerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
}

- (FUDatePickerAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FUDatePickerAccessibility;
  id v3 = -[FUDatePickerAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(FUDatePickerAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end