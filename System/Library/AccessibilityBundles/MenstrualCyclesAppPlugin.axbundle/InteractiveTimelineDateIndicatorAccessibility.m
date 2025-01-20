@interface InteractiveTimelineDateIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation InteractiveTimelineDateIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.InteractiveTimelineDateIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)InteractiveTimelineDateIndicatorAccessibility;
  [(InteractiveTimelineDateIndicatorAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(InteractiveTimelineDateIndicatorAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  [v3 setIsAccessibilityElement:0];
}

uint64_t __91__InteractiveTimelineDateIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end