@interface MUOverallRatingPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MUOverallRatingPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUOverallRatingPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUOverallRatingPlatterView" hasInstanceVariable:@"_attributionLabel" withType:"UILabel"];
  [v3 validateClass:@"MUOverallRatingPlatterView" hasInstanceVariable:@"_viewModel" withType:"<MUOverallRatingPlatterViewModel>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MUOverallRatingPlatterViewAccessibility *)self safeValueForKey:@"_viewModel"];
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"attributionText"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 length])
  {
    v5 = [v4 attribute:@"AXAttributeDisplayName" atIndex:0 effectiveRange:0];
  }
  else
  {
    v5 = &stru_26F6F4CD0;
  }
  [v2 safeFloatForKey:@"rating"];
  double v7 = round(v6 + v6) * 0.5;
  v8 = NSString;
  v9 = accessibilityLocalizedString(@"stars.rating");
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, *(void *)&v7);

  uint64_t v11 = [v2 safeUnsignedIntegerForKey:@"numberOfVotes"];
  v12 = NSString;
  v13 = accessibilityLocalizedString(@"total.reviews");
  v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v11);

  v15 = __UIAXStringForVariables();

  return v15;
}

@end