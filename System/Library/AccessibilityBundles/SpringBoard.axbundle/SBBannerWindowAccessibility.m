@interface SBBannerWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SBBannerWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBBannerWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBBannerWindow" hasInstanceVariable:@"_keyWindowStack" withType:"_SBFKeyWindowStack"];
  [v3 validateClass:@"_SBFKeyWindowStack" hasInstanceVariable:@"_expectedKeyWindow" withType:"SBFWindow"];
  [v3 validateClass:@"SBTransientOverlayWindow"];
}

- (BOOL)accessibilityViewIsModal
{
  v2 = [(SBBannerWindowAccessibility *)self safeValueForKey:@"_keyWindowStack"];
  id v3 = [v2 safeValueForKey:@"_expectedKeyWindow"];
  NSClassFromString(&cfstr_Sbtransientove_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end