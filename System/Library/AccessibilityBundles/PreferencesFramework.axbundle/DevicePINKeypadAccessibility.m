@interface DevicePINKeypadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScannerGroup;
- (CGRect)accessibilityFrame;
- (unint64_t)_accessibilityScannerGroupTraits;
@end

@implementation DevicePINKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DevicePINKeypad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 1;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  [(DevicePINKeypadAccessibility *)self bounds];
  UIAccessibilityFrameForBounds();
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(DevicePINKeypadAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Devicepinpane.isa)];
  v12 = v11;
  if (v11)
  {
    [v11 accessibilityFrame];
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v18 = CGRectIntersection(v17, v20);
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

@end