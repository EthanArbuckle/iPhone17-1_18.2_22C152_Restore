@interface UIButtonAccessibility__PosterKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation UIButtonAccessibility__PosterKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v5.receiver = self;
  v5.super_class = (Class)UIButtonAccessibility__PosterKit__UIKit;
  v2 = [(UIButtonAccessibility__PosterKit__UIKit *)&v5 accessibilityLabel];
  if (([v2 isEqualToString:@"square.2.stack.3d"] & 1) != 0
    || ([v2 isEqualToString:@"square.2.layers.3d"] & 1) != 0
    || [v2 isEqualToString:@"square.2.layers.3d.fill"])
  {
    uint64_t v3 = accessibilityLocalizedString(@"primary.action.button.depth.effect.label");

    v2 = (void *)v3;
  }

  return v2;
}

@end