@interface SleepOnboardingItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SleepOnboardingItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthAppPlugin.SleepOnboardingItemCell";
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
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(SleepOnboardingItemCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __68__SleepOnboardingItemCellAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245661AB0](@"HealthExperienceUI.MultilineButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end