@interface CNVisualIdentityAvatarViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation CNVisualIdentityAvatarViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNVisualIdentityAvatarViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNVisualIdentityAvatarViewControllerInvertColorsAccessibility;
  [(CNVisualIdentityAvatarViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(CNVisualIdentityAvatarViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(CNVisualIdentityAvatarViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"contentView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end