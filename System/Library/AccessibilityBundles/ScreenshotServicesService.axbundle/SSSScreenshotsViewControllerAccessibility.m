@interface SSSScreenshotsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDidPostNotification;
- (void)_accessibilityAnnotateItems;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityPostLayoutChangeIfNecessary;
- (void)_axSetDidPostNotification:(BOOL)a3;
- (void)_configureBarsIfNecessary;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SSSScreenshotsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSScreenshotsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axDidPostNotification
{
  return MEMORY[0x270F0A438](self, &__SSSScreenshotsViewControllerAccessibility___axDidPostNotification);
}

- (void)_axSetDidPostNotification:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SSSScreenshotsViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSScreenshotsViewController", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSScreenshotsViewController", @"_configureBarsIfNecessary", "v", 0);
  [v3 validateClass:@"SSSScreenshotsViewController" hasInstanceVariable:@"_undoItem" withType:"UIBarButtonItem"];
  [v3 validateClass:@"SSSScreenshotsViewController" hasInstanceVariable:@"_redoItem" withType:"UIBarButtonItem"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotsViewControllerAccessibility;
  [(SSSScreenshotsViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(SSSScreenshotsViewControllerAccessibility *)self _axSetDidPostNotification:0];
  [(SSSScreenshotsViewControllerAccessibility *)self _accessibilityPostLayoutChangeIfNecessary];
}

- (void)_configureBarsIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotsViewControllerAccessibility;
  [(SSSScreenshotsViewControllerAccessibility *)&v3 _configureBarsIfNecessary];
  [(SSSScreenshotsViewControllerAccessibility *)self _accessibilityAnnotateItems];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotsViewControllerAccessibility;
  [(SSSScreenshotsViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SSSScreenshotsViewControllerAccessibility *)self _accessibilityAnnotateItems];
  [(SSSScreenshotsViewControllerAccessibility *)self _accessibilityPostLayoutChangeIfNecessary];
}

- (void)_accessibilityAnnotateItems
{
  objc_super v3 = [(SSSScreenshotsViewControllerAccessibility *)self safeValueForKey:@"_undoItem"];
  objc_super v4 = accessibilityLocalizedString(@"undo.button");
  [v3 setAccessibilityLabel:v4];

  id v6 = [(SSSScreenshotsViewControllerAccessibility *)self safeValueForKey:@"_redoItem"];
  v5 = accessibilityLocalizedString(@"redo.button");
  [v6 setAccessibilityLabel:v5];
}

- (void)_accessibilityPostLayoutChangeIfNecessary
{
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  if ([v3 _appearState] == 2
    && ![(SSSScreenshotsViewControllerAccessibility *)self _axDidPostNotification])
  {
    uint64_t v4 = [(SSSScreenshotsViewControllerAccessibility *)self safeIntegerForKey:@"state"];

    if (!v4)
    {
      UIAccessibilityNotifications v5 = *MEMORY[0x263F1CE18];
      id v6 = [(SSSScreenshotsViewControllerAccessibility *)self safeValueForKey:@"view"];
      UIAccessibilityPostNotification(v5, v6);

      [(SSSScreenshotsViewControllerAccessibility *)self _axSetDidPostNotification:1];
    }
  }
  else
  {
  }
}

@end