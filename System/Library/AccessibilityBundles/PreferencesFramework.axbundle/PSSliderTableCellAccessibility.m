@interface PSSliderTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation PSSliderTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSSliderTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PSSliderTableCell" isKindOfClass:@"PSControlTableCell"];
  [v3 validateClass:@"PSControlTableCell" hasInstanceVariable:@"_control" withType:"UIControl"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PSSliderTableCellAccessibility *)self safeValueForKey:@"_control"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end