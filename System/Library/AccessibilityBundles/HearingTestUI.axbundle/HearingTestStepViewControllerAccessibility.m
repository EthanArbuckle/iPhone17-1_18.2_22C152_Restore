@interface HearingTestStepViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HearingTestStepViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.HearingTestStepViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HearingTestUI.HearingTestStepViewController" isKindOfClass:@"OBWelcomeController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"headerView", "@", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HearingTestStepViewControllerAccessibility;
  [(HearingTestStepViewControllerAccessibility *)&v7 viewDidAppear:a3];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__HearingTestStepViewControllerAccessibility_viewDidAppear___block_invoke;
  v4[3] = &unk_265126D40;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__HearingTestStepViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id argument = [WeakRetained safeValueForKey:@"headerView"];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], argument);
}

@end