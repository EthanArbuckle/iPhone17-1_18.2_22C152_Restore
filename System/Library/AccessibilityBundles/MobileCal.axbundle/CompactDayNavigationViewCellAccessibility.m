@interface CompactDayNavigationViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityUserInputLabels;
@end

@implementation CompactDayNavigationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CompactDayNavigationViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CompactDayNavigationViewCellAccessibility *)self safeStringForKey:@"_displayString"];
  v3 = MEMORY[0x245654990]();

  return v3;
}

@end