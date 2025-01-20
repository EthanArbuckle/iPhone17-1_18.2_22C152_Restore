@interface HKElectrocardiogramAxisViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation HKElectrocardiogramAxisViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKElectrocardiogramAxisView";
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