@interface SearchUIMultiResultAppCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation SearchUIMultiResultAppCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIMultiResultAppCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIHomeScreenAppIconView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIMultiResultAppCollectionCell", @"appIconView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SearchUIMultiResultAppCollectionCellAccessibility *)self safeValueForKey:@"appIconView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(SearchUIMultiResultAppCollectionCellAccessibility *)self safeValueForKey:@"appIconView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end