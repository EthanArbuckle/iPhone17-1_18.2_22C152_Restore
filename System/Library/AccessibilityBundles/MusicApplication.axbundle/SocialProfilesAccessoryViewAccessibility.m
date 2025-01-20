@interface SocialProfilesAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isTransparentFocusRegion;
@end

@implementation SocialProfilesAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SocialProfilesAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicApplication.PromotionalImageryView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isTransparentFocusRegion", "B", 0);
}

- (BOOL)_isTransparentFocusRegion
{
  if ([(SocialProfilesAccessoryViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SocialProfilesAccessoryViewAccessibility;
  return [(SocialProfilesAccessoryViewAccessibility *)&v4 _isTransparentFocusRegion];
}

@end