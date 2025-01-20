@interface SiriRestaurantsLogoButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SiriRestaurantsLogoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriRestaurantsLogoButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriRestaurantsLogoButton", @"punchOut", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUIAppPunchOut", @"appDisplayName", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SiriRestaurantsLogoButtonAccessibility *)self safeValueForKey:@"punchOut"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"appDisplayName"];

  return v4;
}

@end