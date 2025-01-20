@interface TwoLineCollectionViewListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TwoLineCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TwoLineCollectionViewListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(TwoLineCollectionViewListCellAccessibility *)self safeValueForKey:@"_twoLinesContentView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end