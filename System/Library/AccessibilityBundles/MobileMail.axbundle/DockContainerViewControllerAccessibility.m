@interface DockContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldAttemptToAddDismissalElement;
- (CGRect)_axFrameForDismissDraftsElement;
- (DockContainerViewControllerAccessibility)initWithPersistence:(id)a3 scene:(id)a4 rootViewController:(id)a5;
- (double)_axGetDraftsElementHeight;
- (id)_accessibilitySpeakThisViewController;
- (id)_axDismissDraftElement;
- (id)_axViewContainingDraftsElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateDraftElements;
- (void)_axAddDraftsElementIfNecessaryUsingVC:(id)a3;
- (void)_axSetDraftsElementHeight:(double)a3;
- (void)_axSetViewContainingDraftsElement:(id)a3;
- (void)_configureNewDockedView:(id)a3;
- (void)_setDockVisible:(BOOL)a3;
- (void)activateExposeModeAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setActiveTiltedTabViewController:(id)a3;
@end

@implementation DockContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DockContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"_accessibilitySpeakThisViewController", "@", 0);
  [v3 validateClass:@"DockContainerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"activeViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"dockedViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"isExposeModeActivated", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"activateExposeModeAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"setActiveTiltedTabViewController:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"presentViewController:animated:completion:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"_configureNewDockedView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"initWithPersistence:scene:rootViewController:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"_minimizeKeyCommandPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DockContainerViewController", @"_setDockVisible:", "v", "B", 0);
  [v3 validateClass:@"ComposeNavigationController"];
}

- (id)_axViewContainingDraftsElement
{
}

- (void)_axSetViewContainingDraftsElement:(id)a3
{
}

- (double)_axGetDraftsElementHeight
{
  MEMORY[0x270F09628](self, &__DockContainerViewControllerAccessibility___axGetDraftsElementHeight);
  return result;
}

- (void)_axSetDraftsElementHeight:(double)a3
{
}

- (DockContainerViewControllerAccessibility)initWithPersistence:(id)a3 scene:(id)a4 rootViewController:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)DockContainerViewControllerAccessibility;
  v5 = [(DockContainerViewControllerAccessibility *)&v7 initWithPersistence:a3 scene:a4 rootViewController:a5];
  [(DockContainerViewControllerAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)DockContainerViewControllerAccessibility;
  [(DockContainerViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(DockContainerViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityIdentifier:@"kAXApplicationSceneViewIdentifier"];
  [v3 _accessibilitySetAssignedValue:self forKey:@"kAXApplicationSceneKey"];
  [(DockContainerViewControllerAccessibility *)self _accessibilityUpdateDraftElements];
  objc_opt_class();
  v4 = [(DockContainerViewControllerAccessibility *)self safeValueForKey:@"activeViewController"];
  v5 = __UIAccessibilityCastAsClass();

  [(DockContainerViewControllerAccessibility *)self _axAddDraftsElementIfNecessaryUsingVC:v5];
}

- (id)_accessibilitySpeakThisViewController
{
  v2 = [(DockContainerViewControllerAccessibility *)self safeValueForKey:@"activeViewController"];
  id v3 = [v2 _accessibilitySpeakThisViewController];

  return v3;
}

- (void)_axAddDraftsElementIfNecessaryUsingVC:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSClassFromString(&cfstr_Composenavigat_0.isa);
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 view];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__DockContainerViewControllerAccessibility__axAddDraftsElementIfNecessaryUsingVC___block_invoke;
    v22[3] = &unk_265133380;
    v22[4] = self;
    objc_super v6 = [v5 _accessibilityFindAncestor:v22 startWithSelf:1];

    objc_super v7 = [(DockContainerViewControllerAccessibility *)self _axDismissDraftElement];
    [v7 setAccessibilityContainer:v6];

    v8 = [(DockContainerViewControllerAccessibility *)self _axDismissDraftElement];
    v23[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    [v6 _accessibilitySetAdditionalElements:v9];

    [(DockContainerViewControllerAccessibility *)self _axSetViewContainingDraftsElement:v6];
    objc_opt_class();
    v10 = __UIAccessibilityCastAsClass();
    v11 = [v10 view];

    v12 = [v11 window];
    v13 = [v12 windowScene];
    v14 = [v13 statusBarManager];
    [v14 statusBarFrame];
    double MaxY = CGRectGetMaxY(v24);

    v16 = [v4 view];
    v17 = [v16 superview];
    v18 = [v4 view];
    [v18 frame];
    objc_msgSend(v17, "convertRect:toView:", 0);
    double v20 = v19;

    [(DockContainerViewControllerAccessibility *)self _axSetDraftsElementHeight:v20 - MaxY];
  }
  else
  {
    v21 = [(DockContainerViewControllerAccessibility *)self _axViewContainingDraftsElement];
    [v21 _accessibilitySetAdditionalElements:0];

    [(DockContainerViewControllerAccessibility *)self _axSetDraftsElementHeight:0.0];
  }
}

BOOL __82__DockContainerViewControllerAccessibility__axAddDraftsElementIfNecessaryUsingVC___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsClass();
  [v4 accessibilityFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = [*(id *)(a1 + 32) _axDismissDraftElement];
  [v13 accessibilityFrame];
  v18.x = v14;
  v18.y = v15;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  BOOL v16 = CGRectContainsPoint(v19, v18);

  return v16;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  CGFloat v10 = [v8 view];
  [v10 setAccessibilityViewIsModal:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__DockContainerViewControllerAccessibility_presentViewController_animated_completion___block_invoke;
  v14[3] = &unk_2651333A8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  v13.receiver = self;
  v13.super_class = (Class)DockContainerViewControllerAccessibility;
  id v11 = v9;
  id v12 = v8;
  [(DockContainerViewControllerAccessibility *)&v13 presentViewController:v12 animated:v6 completion:v14];
}

uint64_t __86__DockContainerViewControllerAccessibility_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _axAddDraftsElementIfNecessaryUsingVC:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_configureNewDockedView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  [(DockContainerViewControllerAccessibility *)&v4 _configureNewDockedView:a3];
  [(DockContainerViewControllerAccessibility *)self _accessibilityUpdateDraftElements];
}

- (void)activateExposeModeAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  [(DockContainerViewControllerAccessibility *)&v4 activateExposeModeAnimated:a3];
  [(DockContainerViewControllerAccessibility *)self _accessibilityUpdateDraftElements];
}

- (void)setActiveTiltedTabViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  [(DockContainerViewControllerAccessibility *)&v4 setActiveTiltedTabViewController:a3];
  [(DockContainerViewControllerAccessibility *)self _accessibilityUpdateDraftElements];
}

- (void)_accessibilityUpdateDraftElements
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(DockContainerViewControllerAccessibility *)self safeDictionaryForKey:@"dockedViews"];
  objc_super v4 = [v3 allValues];

  int v5 = [(DockContainerViewControllerAccessibility *)self safeBoolForKey:@"isExposeModeActivated"];
  uint64_t v6 = [v4 count];
  objc_opt_class();
  double v7 = __UIAccessibilityCastAsClass();
  id v8 = [v7 view];

  char v29 = 0;
  objc_opt_class();
  id v9 = [v4 firstObject];
  CGFloat v10 = __UIAccessibilityCastAsClass();

  LODWORD(v9) = v6 != 0;
  id v11 = [v8 superview];
  [v8 frame];
  objc_msgSend(v11, "convertRect:toView:", 0);
  double v13 = v12;

  CGFloat v14 = [v10 superview];
  [v10 frame];
  objc_msgSend(v14, "convertRect:toView:", 0);
  double v16 = v15;

  v17 = [NSNumber numberWithInt:v9 & ~v5];
  [v8 _accessibilitySetRetainedValue:v17 forKey:@"kAXShowDraftsKey"];

  CGPoint v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  [v8 _accessibilitySetRetainedValue:v18 forKey:@"kAXNumberOfDraftsKey"];

  CGRect v19 = [NSNumber numberWithDouble:v13 - v16];
  [v8 _accessibilitySetRetainedValue:v19 forKey:@"kAXDraftHeightKey"];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v4;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "setAccessibilityElementsHidden:", 1, (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v22);
  }
}

- (CGRect)_axFrameForDismissDraftsElement
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  objc_super v4 = [v3 view];

  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  id v9 = [v4 window];
  CGFloat v10 = [v9 windowScene];
  id v11 = [v10 statusBarManager];
  [v11 statusBarFrame];
  double v13 = v12;

  [(DockContainerViewControllerAccessibility *)self _axGetDraftsElementHeight];
  double v15 = v14;

  double v16 = v6;
  double v17 = v13;
  double v18 = v8;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_axDismissDraftElement
{
  id v3 = [(DockContainerViewControllerAccessibility *)self _accessibilityValueForKey:@"AXDismissDraftElement"];
  if (!v3)
  {
    objc_super v4 = [UIAccessibilityDismissDraftElement alloc];
    double v5 = [(DockContainerViewControllerAccessibility *)self safeUIViewForKey:@"view"];
    id v3 = [(UIAccessibilityDismissDraftElement *)v4 initWithAccessibilityContainer:v5];

    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    CGFloat v10 = __66__DockContainerViewControllerAccessibility__axDismissDraftElement__block_invoke;
    id v11 = &unk_2651333D0;
    objc_copyWeak(&v12, &location);
    [(UIAccessibilityDismissDraftElement *)v3 _setAccessibilityFrameBlock:&v8];
    -[UIAccessibilityDismissDraftElement setIsAccessibilityElement:](v3, "setIsAccessibilityElement:", 1, v8, v9, v10, v11);
    double v6 = accessibilityLocalizedString(@"minimize.draft");
    [(UIAccessibilityDismissDraftElement *)v3 setAccessibilityLabel:v6];

    [(UIAccessibilityDismissDraftElement *)v3 setMailApplicationScene:self];
    [(UIAccessibilityDismissDraftElement *)v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    [(DockContainerViewControllerAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"AXDismissDraftElement"];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

double __66__DockContainerViewControllerAccessibility__axDismissDraftElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axFrameForDismissDraftsElement];
  double v3 = v2;

  return v3;
}

- (void)_setDockVisible:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  [(DockContainerViewControllerAccessibility *)&v4 _setDockVisible:a3];
  [(DockContainerViewControllerAccessibility *)self _accessibilityUpdateDraftElements];
}

- (BOOL)_accessibilityShouldAttemptToAddDismissalElement
{
  return 0;
}

@end