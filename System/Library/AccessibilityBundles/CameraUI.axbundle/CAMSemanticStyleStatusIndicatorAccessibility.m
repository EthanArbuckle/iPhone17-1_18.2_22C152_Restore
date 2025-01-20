@interface CAMSemanticStyleStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMSemanticStyleStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSemanticStyleStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyleStatusIndicator", @"semanticStyle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyle", @"displayName", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUID6xLocalizedString(@"semantic.style");
}

- (id)accessibilityValue
{
  v2 = [(CAMSemanticStyleStatusIndicatorAccessibility *)self safeValueForKey:@"semanticStyle"];
  id v3 = [v2 safeStringForKey:@"displayName"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMSemanticStyleStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMSemanticStyleStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end