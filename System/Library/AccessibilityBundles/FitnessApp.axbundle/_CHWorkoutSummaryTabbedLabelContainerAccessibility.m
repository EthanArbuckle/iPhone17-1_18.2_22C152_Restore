@interface _CHWorkoutSummaryTabbedLabelContainerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelAttribute;
- (id)accessibilityLabel;
- (void)_accessibilitySetLabelAttribute:(id)a3;
@end

@implementation _CHWorkoutSummaryTabbedLabelContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CHWorkoutSummaryTabbedLabelContainer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelAttribute
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &___CHWorkoutSummaryTabbedLabelContainerAccessibility___accessibilityLabelAttribute);
}

- (void)_accessibilitySetLabelAttribute:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_CHWorkoutSummaryTabbedLabelContainer" hasInstanceVariable:@"_titleText" withType:"NSString"];
  [v3 validateClass:@"_CHWorkoutSummaryTabbedLabelContainer" hasInstanceVariable:@"_totalText" withType:"NSString"];
  [v3 validateClass:@"_CHWorkoutSummaryTabbedLabelContainer" hasInstanceVariable:@"_averageText" withType:"NSString"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = +[NSMutableArray array];
  v4 = [(_CHWorkoutSummaryTabbedLabelContainerAccessibility *)self safeValueForKey:@"_titleText"];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  v5 = [(_CHWorkoutSummaryTabbedLabelContainerAccessibility *)self _accessibilityLabelAttribute];
  objc_opt_class();
  v6 = [(_CHWorkoutSummaryTabbedLabelContainerAccessibility *)self safeValueForKey:@"_totalText"];
  v7 = __UIAccessibilityCastAsClass();

  if ([v7 length])
  {
    v8 = accessibilityLocalizedString(@"summary.cell.header.total");
    [v3 addObject:v8];

    if (v5)
    {
      id v9 = [objc_alloc((Class)AXAttributedString) initWithString:v7];
      [v9 setAttribute:&__kCFBooleanTrue forKey:v5];
      [v3 addObject:v9];
    }
    else
    {
      [v3 addObject:v7];
    }
  }
  objc_opt_class();
  v10 = [(_CHWorkoutSummaryTabbedLabelContainerAccessibility *)self safeValueForKey:@"_averageText"];
  v11 = __UIAccessibilityCastAsClass();

  if ([v11 length])
  {
    v12 = accessibilityLocalizedString(@"summary.cell.header.average");
    [v3 addObject:v12];

    if (v5)
    {
      id v13 = [objc_alloc((Class)AXAttributedString) initWithString:v11];
      [v13 setAttribute:&__kCFBooleanTrue forKey:v5];
      [v3 addObject:v13];
    }
    else
    {
      [v3 addObject:v11];
    }
  }
  v14 = UIAXLabelForElements();

  return v14;
}

@end