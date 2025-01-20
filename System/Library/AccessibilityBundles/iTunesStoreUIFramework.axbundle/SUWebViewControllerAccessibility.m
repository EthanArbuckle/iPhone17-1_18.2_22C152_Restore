@interface SUWebViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)accessibilityContainerType;
- (void)_removePlaceholderBackgroundView;
@end

@implementation SUWebViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUWebViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_removePlaceholderBackgroundView
{
  v2.receiver = self;
  v2.super_class = (Class)SUWebViewControllerAccessibility;
  [(SUWebViewControllerAccessibility *)&v2 _removePlaceholderBackgroundView];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end