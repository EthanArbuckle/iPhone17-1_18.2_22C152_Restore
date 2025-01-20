@interface NTKComplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityComplicationAppName;
@end

@implementation NTKComplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKComplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityComplicationAppName
{
  return [(NTKComplicationAccessibility *)self safeValueForKey:@"localizedKeylineLabelText"];
}

@end