@interface MOSuggestionInterstitialExpandableListViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MOSuggestionInterstitialExpandableListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionInterstitialExpandableListViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MomentsUIService.MOSuggestionInterstitialExpandableListViewCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionInterstitialExpandableListViewCell" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MOSuggestionInterstitialExpandableListViewCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = [(MOSuggestionInterstitialExpandableListViewCellAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v5 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end