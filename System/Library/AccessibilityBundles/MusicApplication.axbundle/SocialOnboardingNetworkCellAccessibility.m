@interface SocialOnboardingNetworkCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SocialOnboardingNetworkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SocialOnboardingNetworkCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SocialOnboardingNetworkCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"title"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SocialOnboardingNetworkCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SocialOnboardingNetworkCellAccessibility *)&v3 accessibilityTraits];
}

@end