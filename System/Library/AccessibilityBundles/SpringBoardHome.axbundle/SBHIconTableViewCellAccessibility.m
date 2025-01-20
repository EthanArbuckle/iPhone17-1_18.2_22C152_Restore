@interface SBHIconTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityLabel;
@end

@implementation SBHIconTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHIconTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconTableViewCell", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconTableViewCell", @"iconNameLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(SBHIconTableViewCellAccessibility *)self safeValueForKey:@"iconView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  return (id)[(SBHIconTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"iconNameLabel"];
}

- (id)accessibilityDragSourceDescriptors
{
  v2 = [(SBHIconTableViewCellAccessibility *)self safeValueForKey:@"iconView"];
  double v3 = [v2 accessibilityDragSourceDescriptors];

  return v3;
}

@end