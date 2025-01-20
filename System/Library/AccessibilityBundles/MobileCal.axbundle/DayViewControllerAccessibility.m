@interface DayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySpeakThisElementsAndStrings;
@end

@implementation DayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)DayViewControllerAccessibility;
  v2 = [(DayViewControllerAccessibility *)&v6 _accessibilitySpeakThisElementsAndStrings];
  if (![v2 count])
  {
    v3 = accessibilityLocalizedString(@"event.count.none");
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

    v2 = (void *)v4;
  }

  return v2;
}

@end