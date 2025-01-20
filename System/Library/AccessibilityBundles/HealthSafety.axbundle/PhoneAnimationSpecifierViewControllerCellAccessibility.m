@interface PhoneAnimationSpecifierViewControllerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PhoneAnimationSpecifierViewControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Safety.PhoneAnimationSpecifierViewControllerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"TRIGGER_ANIMATION");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end