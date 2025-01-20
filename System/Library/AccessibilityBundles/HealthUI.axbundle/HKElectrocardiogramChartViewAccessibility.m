@interface HKElectrocardiogramChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation HKElectrocardiogramChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKElectrocardiogramChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end