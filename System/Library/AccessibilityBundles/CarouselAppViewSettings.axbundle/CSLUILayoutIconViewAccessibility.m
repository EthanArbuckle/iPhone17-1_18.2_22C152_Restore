@interface CSLUILayoutIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityPath;
@end

@implementation CSLUILayoutIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLUILayoutIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"hint.app.moving");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  v3 = [(CSLUILayoutIconViewAccessibility *)self safeValueForKey:@"bounds"];
  [v3 rectValue];

  v4 = (void *)MEMORY[0x263F1C478];
  AX_CGRectGetCenter();
  objc_msgSend(v4, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  v5 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v6 = UIAccessibilityConvertPathToScreenCoordinates(v5, (UIView *)self);

  return v6;
}

@end