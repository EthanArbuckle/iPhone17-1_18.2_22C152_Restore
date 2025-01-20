@interface PRComplicationContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PRComplicationContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRComplicationContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PRComplicationContainerViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PRWidgetGridViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationContainerViewController", @"widgetGridViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRComplicationContainerViewController", @"sidebarWidgetGridViewController", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)PRComplicationContainerViewControllerAccessibility;
  [(PRComplicationContainerViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];

  objc_opt_class();
  v5 = [(PRComplicationContainerViewControllerAccessibility *)self safeValueForKey:@"widgetGridViewController"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [(PRComplicationContainerViewControllerAccessibility *)self safeValueForKey:@"sidebarWidgetGridViewController"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v6 view];
  v10 = [v8 view];
  v11 = [MEMORY[0x263EFF980] array];
  [v11 axSafelyAddObject:v9];
  [v11 axSafelyAddObject:v10];
  [v4 setAccessibilityElements:v11];
}

@end