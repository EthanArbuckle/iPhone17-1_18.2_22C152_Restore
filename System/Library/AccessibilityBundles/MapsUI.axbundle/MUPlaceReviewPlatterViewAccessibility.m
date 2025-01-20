@interface MUPlaceReviewPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MUPlaceReviewPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceReviewPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUPlaceReviewPlatterView" hasInstanceVariable:@"_reviewTextView" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUPlaceReviewPlatterView" hasInstanceVariable:@"_userLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUPlaceReviewPlatterView" hasInstanceVariable:@"_viewModel" withType:"MUPlaceReviewViewModel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MUPlaceReviewPlatterViewAccessibility *)self safeValueForKey:@"_viewModel"];
  [v3 safeFloatForKey:@"normalizedScore"];
  double v5 = round(v4 + v4) * 0.5;
  v6 = NSString;
  v7 = accessibilityLocalizedString(@"stars.rating");
  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, *(void *)&v5);

  v9 = [(MUPlaceReviewPlatterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_userLabel"];
  v12 = [(MUPlaceReviewPlatterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_reviewTextView"];
  v10 = __UIAXStringForVariables();

  return v10;
}

@end