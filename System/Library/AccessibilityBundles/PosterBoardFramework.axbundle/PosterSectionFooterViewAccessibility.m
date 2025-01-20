@interface PosterSectionFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PosterSectionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterSectionFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.PosterSectionFooterView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PosterBoard.PosterSectionFooterView" hasSwiftField:@"text" withSwiftType:"Optional<String>"];
  [v3 validateClass:@"PosterBoard.PosterSectionFooterView" hasSwiftField:@"titleLabel" withSwiftType:"Optional<UILabel>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PosterSectionFooterViewAccessibility *)self safeSwiftStringForKey:@"text"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)PosterSectionFooterViewAccessibility;
  [(PosterSectionFooterViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (CGRect)accessibilityFrame
{
  objc_super v2 = [(PosterSectionFooterViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
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

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PosterSectionFooterViewAccessibility;
  [(PosterSectionFooterViewAccessibility *)&v3 layoutSubviews];
  [(PosterSectionFooterViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end