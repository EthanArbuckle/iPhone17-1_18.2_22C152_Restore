@interface LiveActivitiesHostingControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation LiveActivitiesHostingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TtGC9AirDropUI31LiveActivitiesHostingControllerVS_14AirDropPlatter_";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TtGC9AirDropUI31LiveActivitiesHostingControllerVS_14AirDropPlatter_" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidAppear:", "v", "B", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LiveActivitiesHostingControllerAccessibility;
  [(LiveActivitiesHostingControllerAccessibility *)&v6 viewDidAppear:a3];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  v5 = [v3 view];
  UIAccessibilityPostNotification(v4, v5);
}

@end