@interface SUUICrossFadingTabBarAcccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTestSubviews;
- (int64_t)accessibilityContainerType;
@end

@implementation SUUICrossFadingTabBarAcccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUICrossFadingTabBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)_accessibilityHitTestSubviews
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 _accessibleSubviews];

  return v3;
}

@end