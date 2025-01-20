@interface ConversationHUDViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLayoutSubviews;
@end

@implementation ConversationHUDViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ConversationHUDViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHUDViewControllerInvertColorsAccessibility;
  [(ConversationHUDViewControllerInvertColorsAccessibility *)&v3 viewDidLayoutSubviews];
  [(ConversationHUDViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  BOOL v4 = [v3 overrideUserInterfaceStyle] == (char *)&dword_0 + 2;
  v5 = [(ConversationHUDViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v5 setAccessibilityIgnoresInvertColors:v4];
}

@end