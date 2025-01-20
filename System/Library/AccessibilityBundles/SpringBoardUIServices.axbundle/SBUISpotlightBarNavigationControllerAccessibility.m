@interface SBUISpotlightBarNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityNavigationControllerShouldSendScreenChange;
@end

@implementation SBUISpotlightBarNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUISpotlightBarNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBUISpotlightBarNavigationController" isKindOfClass:@"UINavigationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationControllerAccessibility", @"_accessibilityNavigationControllerShouldSendScreenChange", "B", 0);
}

- (BOOL)_accessibilityNavigationControllerShouldSendScreenChange
{
  v6.receiver = self;
  v6.super_class = (Class)SBUISpotlightBarNavigationControllerAccessibility;
  if ([(SBUISpotlightBarNavigationControllerAccessibility *)&v6 _accessibilityNavigationControllerShouldSendScreenChange])
  {
    objc_opt_class();
    v2 = __UIAccessibilityCastAsClass();
    id v3 = [v2 parentViewController];
    NSClassFromString(&cfstr_Sbtodayviewcon.isa);
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

@end