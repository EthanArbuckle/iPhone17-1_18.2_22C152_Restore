@interface TrendingDownTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TrendingDownTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrendingDownTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendingDownTableViewCell", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendingDownTableViewCell", @"detailLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(TrendingDownTableViewCellAccessibility *)self safeValueForKey:@"view"];
  v4 = [(TrendingDownTableViewCellAccessibility *)self safeValueForKey:@"detailLabel"];
  v5 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  v6 = AXLabelForElements();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TrendingDownTableViewCellAccessibility;
  return UIAccessibilityTraitButton | [(TrendingDownTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end