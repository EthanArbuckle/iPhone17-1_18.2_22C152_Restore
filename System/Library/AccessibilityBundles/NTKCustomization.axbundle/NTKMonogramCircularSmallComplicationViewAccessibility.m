@interface NTKMonogramCircularSmallComplicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation NTKMonogramCircularSmallComplicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKMonogramCircularSmallComplicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(NTKMonogramCircularSmallComplicationViewAccessibility *)self safeValueForKey:@"_label"];
  v3 = __UIAXStringForVariables();

  return v3;
}

@end