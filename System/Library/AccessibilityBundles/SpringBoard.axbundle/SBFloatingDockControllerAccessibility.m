@interface SBFloatingDockControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SBFloatingDockControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFloatingDockController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"isFloatingDockFullyPresented", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"presentFloatingDockIfDismissedAnimated:completionHandler:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"dismissFloatingDockIfPresentedAnimated:completionHandler:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"isFloatingDockFullyPresented", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"isPresentingFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"_allowGestureRecognizers", "B", 0);
}

- (void)presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [(SBFloatingDockControllerAccessibility *)self safeBoolForKey:@"isFloatingDockFullyPresented"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __98__SBFloatingDockControllerAccessibility_presentFloatingDockIfDismissedAnimated_completionHandler___block_invoke;
  v11[3] = &unk_265154070;
  char v13 = v7;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = (void *)MEMORY[0x2456635C0](v11);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21938]);
  v10.receiver = self;
  v10.super_class = (Class)SBFloatingDockControllerAccessibility;
  [(SBFloatingDockControllerAccessibility *)&v10 presentFloatingDockIfDismissedAnimated:v4 completionHandler:v9];
}

void __98__SBFloatingDockControllerAccessibility_presentFloatingDockIfDismissedAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) safeBoolForKey:@"isFloatingDockFullyPresented"])
    {
      objc_opt_class();
      id v3 = [*(id *)(a1 + 32) safeValueForKey:@"_viewController"];
      BOOL v4 = __UIAccessibilityCastAsClass();

      v5 = [v4 view];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v5);
    }
  }
}

- (void)dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [(SBFloatingDockControllerAccessibility *)self safeBoolForKey:@"isFloatingDockFullyPresented"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98__SBFloatingDockControllerAccessibility_dismissFloatingDockIfPresentedAnimated_completionHandler___block_invoke;
  v12[3] = &unk_265154070;
  char v14 = v7;
  v12[4] = self;
  id v13 = v6;
  id v8 = v6;
  v9 = (void *)MEMORY[0x2456635C0](v12);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21930]);
  v11.receiver = self;
  v11.super_class = (Class)SBFloatingDockControllerAccessibility;
  [(SBFloatingDockControllerAccessibility *)&v11 dismissFloatingDockIfPresentedAnimated:v4 completionHandler:v9];
  objc_super v10 = [MEMORY[0x263F22968] server];
  [v10 didPotentiallyDismissNonExclusiveSystemUI];
}

void __98__SBFloatingDockControllerAccessibility_dismissFloatingDockIfPresentedAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(unsigned char *)(a1 + 48)
    && ([*(id *)(a1 + 32) safeBoolForKey:@"isFloatingDockFullyPresented"] & 1) == 0)
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v3, 0);
  }
}

@end