@interface TVImageProxyAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TVImageProxyAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVImageProxy";
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
  objc_opt_class();
  v3 = [(TVImageProxyAccessibility *)self safeValueForKey:@"object"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityRetrieveLabelForSource(v4);

  return v5;
}

@end