@interface PUILockdownModeOnboardingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PUILockdownModeOnboardingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUILockdownModeOnboardingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

@end