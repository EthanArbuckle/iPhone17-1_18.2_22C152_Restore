@interface IMBTimeslotsContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation IMBTimeslotsContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Business.IMBTimeslotsContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  objc_opt_class();
  v3 = [(IMBTimeslotsContainerViewAccessibility *)self safeValueForKey:@"timeslotViews"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end