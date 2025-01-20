@interface HKElectrocardiogramChartTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (HKElectrocardiogramChartTableViewCellAccessibility)initWithGridSize:(CGSize)a3 reuseIdentifier:(id)a4;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HKElectrocardiogramChartTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKElectrocardiogramChartTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKElectrocardiogramChartTableViewCell" isKindOfClass:@"UITableViewCell"];
  [v3 validateClass:@"HKElectrocardiogramChartTableViewCell" hasInstanceVariable:@"_scrollView" withType:"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKElectrocardiogramChartTableViewCell", @"initWithGridSize:reuseIdentifier:", "{CGSize=dd}", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramChartTableViewCellAccessibility;
  [(HKElectrocardiogramChartTableViewCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HKElectrocardiogramChartTableViewCellAccessibility *)self safeValueForKey:@"_scrollView"];
  [v3 setAccessibilityElementsHidden:1];
}

- (id)accessibilityElements
{
  char v9 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  objc_super v4 = [v3 contentView];

  if (v4)
  {
    v5 = [v3 contentView];
    v6 = [v5 _accessibleSubviews];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HKElectrocardiogramChartTableViewCellAccessibility;
    v6 = [(HKElectrocardiogramChartTableViewCellAccessibility *)&v8 accessibilityElements];
  }

  return v6;
}

- (HKElectrocardiogramChartTableViewCellAccessibility)initWithGridSize:(CGSize)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HKElectrocardiogramChartTableViewCellAccessibility;
  objc_super v4 = -[HKElectrocardiogramChartTableViewCellAccessibility initWithGridSize:reuseIdentifier:](&v6, sel_initWithGridSize_reuseIdentifier_, a4, a3.width, a3.height);
  [(HKElectrocardiogramChartTableViewCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end