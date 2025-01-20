@interface ACUIAppInstallCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation ACUIAppInstallCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACUIAppInstallCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(ACUIAppInstallCellAccessibility *)self safeValueForKey:@"_installButton"];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ACUIAppInstallCellAccessibility;
    [(ACUIAppInstallCellAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end