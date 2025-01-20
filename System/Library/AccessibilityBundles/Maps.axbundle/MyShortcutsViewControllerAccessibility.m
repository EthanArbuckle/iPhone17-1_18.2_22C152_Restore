@interface MyShortcutsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MyShortcutsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MyShortcutsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MyShortcutsViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"MyShortcutsViewController" hasInstanceVariable:@"_titleLabelButton" withType:"UIBarButtonItem"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(MyShortcutsViewControllerAccessibility *)self safeValueForKey:@"_titleLabelButton"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewControllerAccessibility;
  [(MyShortcutsViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MyShortcutsViewControllerAccessibility;
  [(MyShortcutsViewControllerAccessibility *)&v3 viewDidLoad];
  [(MyShortcutsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end