@interface COSSetupControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)blockGoingBackFromCurrentController;
- (void)buddyControllerHold:(id)a3 beforePresentingBuddyController:(id)a4;
@end

@implementation COSSetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSSetupController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSSetupController", @"buddyControllerHold: beforePresentingBuddyController:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSSetupController", @"blockGoingBackFromCurrentController", "v", 0);
}

- (void)buddyControllerHold:(id)a3 beforePresentingBuddyController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)COSSetupControllerAccessibility;
  [(COSSetupControllerAccessibility *)&v13 buddyControllerHold:v6 beforePresentingBuddyController:v7];
  objc_opt_class();
  v8 = [(COSSetupControllerAccessibility *)self safeValueForKey:@"_navigationController"];
  v9 = __UIAccessibilityCastAsClass();

  v10 = [v9 navigationBar];
  v11 = [v10 topItem];

  LODWORD(v10) = *MEMORY[0x263F1CE68];
  v12 = [v11 rightBarButtonItem];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v10, v12);
}

- (void)blockGoingBackFromCurrentController
{
  v9.receiver = self;
  v9.super_class = (Class)COSSetupControllerAccessibility;
  [(COSSetupControllerAccessibility *)&v9 blockGoingBackFromCurrentController];
  objc_opt_class();
  id v3 = [(COSSetupControllerAccessibility *)self safeValueForKey:@"_navigationController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 viewControllers];
  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = [v5 lastObject];
    id v7 = [v6 navigationItem];
    v8 = [v7 leftBarButtonItem];
    [v8 setIsAccessibilityElement:1];
    [v8 setAccessibilityTraits:*MEMORY[0x263F81370] | *MEMORY[0x263F1CEE8]];
  }
}

@end