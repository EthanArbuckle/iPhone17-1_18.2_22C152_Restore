@interface WDClinicalOnboardingLocationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation WDClinicalOnboardingLocationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDClinicalOnboardingLocationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

@end