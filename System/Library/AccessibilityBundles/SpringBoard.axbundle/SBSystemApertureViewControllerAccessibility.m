@interface SBSystemApertureViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsJindo;
- (BOOL)_collapseExpandedElementIfPossible;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityContainerView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityPath;
@end

@implementation SBSystemApertureViewControllerAccessibility

void __81__SBSystemApertureViewControllerAccessibility__collapseExpandedElementIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained safeArrayForKey:@"_orderedContainerViews"];

  if (*(unsigned char *)(a1 + 40) && [v5 count])
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
    v4 = [v5 firstObject];
    UIAccessibilityPostNotification(v3, v4);
  }
}

- (BOOL)_collapseExpandedElementIfPossible
{
  v8.receiver = self;
  v8.super_class = (Class)SBSystemApertureViewControllerAccessibility;
  BOOL v3 = [(SBSystemApertureViewControllerAccessibility *)&v8 _collapseExpandedElementIfPossible];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BOOL v6 = v3;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v3;
}

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemApertureViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_systemApertureContainsAnyContent" withType:"BOOL"];
  [v3 validateClass:@"SBSystemApertureViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemApertureViewController", @"_axRevealHiddenElementIfPossible", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSystemApertureViewController", @"_collapseExpandedElementIfPossible", "B", 0);
  [v3 validateClass:@"SBSystemApertureContainerView"];
  [v3 validateClass:@"SBLockElementViewProvider"];
  [v3 validateClass:@"SBFlashlightActivityElement"];
}

- (BOOL)isAccessibilityElement
{
  return [(SBSystemApertureViewControllerAccessibility *)self safeBoolForKey:@"_systemApertureContainsAnyContent"] ^ 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"empty.pill");
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)accessibilityPath
{
  id v3 = [(SBSystemApertureViewControllerAccessibility *)self _accessibilityContainerView];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    CGRect v27 = CGRectInset(v26, -5.0, -5.0);
    double v21 = v27.size.height;
    CGFloat v9 = v27.origin.x;
    double v23 = v27.origin.x;
    double v10 = v27.origin.y;
    double v11 = v27.size.width;
    double v12 = CGRectGetWidth(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v22 = v12 / CGRectGetWidth(v28);
    v29.origin.CGFloat x = v9;
    v29.origin.CGFloat y = v10;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v21;
    double v13 = CGRectGetHeight(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v14 = v13 / CGRectGetHeight(v30);
    v15 = [v4 layer];
    [v15 cornerRadius];
    double v17 = fmax(v22, v14) * v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x263F1C478], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBSystemApertureViewControllerAccessibility;
    uint64_t v18 = [(SBSystemApertureViewControllerAccessibility *)&v24 accessibilityPath];
  }
  v19 = (void *)v18;

  return v19;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(SBSystemApertureViewControllerAccessibility *)self _accessibilityContainerView];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBSystemApertureViewControllerAccessibility;
    [(SBSystemApertureViewControllerAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)accessibilityCustomActions
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = [(SBSystemApertureViewControllerAccessibility *)self safeArrayForKey:@"childViewControllers"];
  v4 = v3;
  if (v3
    && [v3 count]
    && ([v4 firstObject],
        double v5 = objc_claimAutoreleasedReturnValue(),
        NSClassFromString(&cfstr_Sbflashlightac_0.isa),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    double v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    double v9 = accessibilityLocalizedString(@"window.expand");
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__SBSystemApertureViewControllerAccessibility_accessibilityCustomActions__block_invoke;
    v12[3] = &unk_265153D78;
    v12[4] = self;
    double v10 = (void *)[v8 initWithName:v9 actionHandler:v12];

    v13[0] = v10;
    double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }

  return v7;
}

uint64_t __73__SBSystemApertureViewControllerAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

uint64_t __73__SBSystemApertureViewControllerAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axRevealHiddenElementIfPossible];
}

- (id)_accessibilityContainerView
{
  v2 = [(SBSystemApertureViewControllerAccessibility *)self safeArrayForKey:@"_orderedContainerViews"];
  if ([v2 count])
  {
    id v3 = [v2 firstObject];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityIsJindo
{
  return 1;
}

@end