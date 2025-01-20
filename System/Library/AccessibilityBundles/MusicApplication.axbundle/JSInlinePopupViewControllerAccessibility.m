@interface JSInlinePopupViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation JSInlinePopupViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.JSInlinePopupViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSInlinePopupViewController", @"accessibilityContainerView", "@", 0);
  [v3 validateClass:@"MusicApplication.JSInlinePopupViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSInlinePopupViewController", @"accessibilityCloseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.JSInlinePopupViewController", @"viewDidLoad", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)JSInlinePopupViewControllerAccessibility;
  [(JSInlinePopupViewControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(JSInlinePopupViewControllerAccessibility *)self safeValueForKey:@"accessibilityContainerView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _accessibilityDescendantOfType:MEMORY[0x2456584B0](@"MusicApplication.InformativeView")];
  v6 = [(JSInlinePopupViewControllerAccessibility *)self safeValueForKey:@"accessibilityCloseButton"];
  v7 = accessibilityMusicLocalizedString(@"close.button");
  [v6 setAccessibilityLabel:v7];

  v8 = [MEMORY[0x263EFF980] array];
  [v8 axSafelyAddObject:v5];
  [v8 axSafelyAddObject:v6];
  objc_opt_class();
  v9 = [(JSInlinePopupViewControllerAccessibility *)self safeValueForKey:@"view"];
  v10 = __UIAccessibilityCastAsClass();

  [v10 setAccessibilityElements:v8];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)JSInlinePopupViewControllerAccessibility;
  [(JSInlinePopupViewControllerAccessibility *)&v3 viewDidLoad];
  [(JSInlinePopupViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end