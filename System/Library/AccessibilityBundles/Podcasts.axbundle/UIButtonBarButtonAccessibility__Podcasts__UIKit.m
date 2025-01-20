@interface UIButtonBarButtonAccessibility__Podcasts__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation UIButtonBarButtonAccessibility__Podcasts__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"_UIButtonBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(UIButtonBarButtonAccessibility__Podcasts__UIKit *)self accessibilityLabel];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButtonBarButtonAccessibility__Podcasts__UIKit;
    BOOL v4 = [(UIButtonBarButtonAccessibility__Podcasts__UIKit *)&v6 isAccessibilityElement];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end