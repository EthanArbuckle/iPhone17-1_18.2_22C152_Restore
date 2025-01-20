@interface HKWeekdayHeaderPaletteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation HKWeekdayHeaderPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKWeekdayHeaderPaletteView";
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