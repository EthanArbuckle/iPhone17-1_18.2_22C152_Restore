@interface WatchAnimationSpecifierViewControllerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation WatchAnimationSpecifierViewControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Safety.WatchAnimationSpecifierViewControllerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"TRIGGER_ANIMATION_WATCH");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end