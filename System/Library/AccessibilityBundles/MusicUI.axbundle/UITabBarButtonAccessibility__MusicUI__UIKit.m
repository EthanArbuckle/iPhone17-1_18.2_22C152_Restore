@interface UITabBarButtonAccessibility__MusicUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation UITabBarButtonAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)UITabBarButtonAccessibility__MusicUI__UIKit;
  unint64_t v3 = [(UITabBarButtonAccessibility__MusicUI__UIKit *)&v6 accessibilityTraits];
  v4 = [(UITabBarButtonAccessibility__MusicUI__UIKit *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uitabbarcustom.isa)];

  if (v4
    && ([(UITabBarButtonAccessibility__MusicUI__UIKit *)self safeBoolForKey:@"_isSelected"] & 1) == 0)
  {
    return (*MEMORY[0x263F1CF20] | v3) & ~*MEMORY[0x263F81380];
  }
  return v3;
}

@end