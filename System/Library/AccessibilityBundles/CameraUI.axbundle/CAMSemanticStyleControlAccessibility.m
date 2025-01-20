@interface CAMSemanticStyleControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateResetButtonImage;
@end

@implementation CAMSemanticStyleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSemanticStyleControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyleControl", @"_resetButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyleControl", @"_updateResetButtonImage", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CAMSemanticStyleControlAccessibility;
  [(CAMSemanticStyleControlAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CAMSemanticStyleControlAccessibility *)self safeValueForKey:@"_resetButton"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_5];
}

id __82__CAMSemanticStyleControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityCameraUID6xLocalizedString(@"semantic.style.reset.button");
}

- (void)_updateResetButtonImage
{
  v3.receiver = self;
  v3.super_class = (Class)CAMSemanticStyleControlAccessibility;
  [(CAMSemanticStyleControlAccessibility *)&v3 _updateResetButtonImage];
  [(CAMSemanticStyleControlAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end