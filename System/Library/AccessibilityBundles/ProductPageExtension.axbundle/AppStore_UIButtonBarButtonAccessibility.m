@interface AppStore_UIButtonBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation AppStore_UIButtonBarButtonAccessibility

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
  v3 = [(AppStore_UIButtonBarButtonAccessibility *)self accessibilityLabel];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AppStore_UIButtonBarButtonAccessibility;
    BOOL v4 = [(AppStore_UIButtonBarButtonAccessibility *)&v6 isAccessibilityElement];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end