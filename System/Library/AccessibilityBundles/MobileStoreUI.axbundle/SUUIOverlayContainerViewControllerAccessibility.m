@interface SUUIOverlayContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)backstopControl;
- (void)dismissWithFadeTransitionCompletionBlock:(id)a3;
- (void)dismissWithFlipTransition:(id)a3 completionBlock:(id)a4;
- (void)showViewController:(id)a3 withCompletionBlock:(id)a4;
- (void)showViewController:(id)a3 withFlipTransition:(id)a4 completionBlock:(id)a5;
- (void)showViewControllers:(id)a3;
@end

@implementation SUUIOverlayContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIOverlayContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOverlayContainerViewController", @"dismissWithFlipTransition: completionBlock:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOverlayContainerViewController", @"dismissWithFadeTransitionCompletionBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOverlayContainerViewController", @"showViewController: withFlipTransition: completionBlock:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOverlayContainerViewController", @"showViewController: withCompletionBlock:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOverlayContainerViewController", @"showViewControllers:", "v", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

void __77__SUUIOverlayContainerViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _AXAssert();
  }
  [v1 sendActionsForControlEvents:64];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)backstopControl
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  v2 = [(SUUIOverlayContainerViewControllerAccessibility *)&v4 backstopControl];
  [v2 setAccessibilityViewIsModal:1];
  [v2 setAccessibilityIdentifier:@"OverlayCaptureView"];

  return v2;
}

- (void)dismissWithFlipTransition:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93__SUUIOverlayContainerViewControllerAccessibility_dismissWithFlipTransition_completionBlock___block_invoke;
  v11[3] = &unk_265138378;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = (void *)MEMORY[0x245656EE0](v11);
  v10.receiver = self;
  v10.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  [(SUUIOverlayContainerViewControllerAccessibility *)&v10 dismissWithFlipTransition:v8 completionBlock:v9];
}

void __93__SUUIOverlayContainerViewControllerAccessibility_dismissWithFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v2, 0);
}

- (void)dismissWithFadeTransitionCompletionBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__SUUIOverlayContainerViewControllerAccessibility_dismissWithFadeTransitionCompletionBlock___block_invoke;
  v8[3] = &unk_265138378;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x245656EE0](v8);
  v7.receiver = self;
  v7.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  [(SUUIOverlayContainerViewControllerAccessibility *)&v7 dismissWithFadeTransitionCompletionBlock:v6];
}

void __92__SUUIOverlayContainerViewControllerAccessibility_dismissWithFadeTransitionCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v2, 0);
}

- (void)showViewController:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__SUUIOverlayContainerViewControllerAccessibility_showViewController_withCompletionBlock___block_invoke;
  v11[3] = &unk_265138378;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x245656EE0](v11);
  v10.receiver = self;
  v10.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  [(SUUIOverlayContainerViewControllerAccessibility *)&v10 showViewController:v8 withCompletionBlock:v9];
}

void __90__SUUIOverlayContainerViewControllerAccessibility_showViewController_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v2, 0);
}

- (void)showViewController:(id)a3 withFlipTransition:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__SUUIOverlayContainerViewControllerAccessibility_showViewController_withFlipTransition_completionBlock___block_invoke;
  v14[3] = &unk_265138378;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)MEMORY[0x245656EE0](v14);
  v13.receiver = self;
  v13.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  [(SUUIOverlayContainerViewControllerAccessibility *)&v13 showViewController:v11 withFlipTransition:v10 completionBlock:v12];
}

void __105__SUUIOverlayContainerViewControllerAccessibility_showViewController_withFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v2, 0);
}

- (void)showViewControllers:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIOverlayContainerViewControllerAccessibility;
  [(SUUIOverlayContainerViewControllerAccessibility *)&v3 showViewControllers:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end