@interface TiltedTabViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tiltedTabView:(id)a3 contentViewForItemAtIndex:(unint64_t)a4;
- (id)tiltedTabView:(id)a3 snapshotViewForItemAtIndex:(unint64_t)a4;
- (void)_accessibilityUpdateDraftLabelForBorrowedView:(id)a3 withActorAtIndex:(int64_t)a4;
- (void)_axPrepareDockedLabelForIndex:(int64_t)a3;
- (void)dismiss;
- (void)tiltedTabViewDidDismiss:(id)a3;
- (void)tiltedTabViewDidPresent:(id)a3;
@end

@implementation TiltedTabViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TiltedTabViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TiltedTabViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"tiltedTabView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"dockedStates", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"tiltedTabViewDidPresent:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"tiltedTabViewDidDismiss:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"tiltedTabView:contentViewForItemAtIndex:", "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"tiltedTabView:snapshotViewForItemAtIndex:", "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TiltedTabViewController", @"dismiss", "v", 0);
  [v3 validateClass:@"MFTiltedTabView" hasInstanceVariable:@"_visibleItems" withType:"NSMutableArray"];
  [v3 validateClass:@"_MFTiltedTabItemView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MFTiltedTabItemView", @"borrowedContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MFTiltedTabItemView", @"contentShadowView", "@", 0);
  [v3 validateClass:@"DockedViewControllerState" isKindOfClass:@"RestorableViewControllerState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RestorableViewControllerState", @"storedUserActivity", "@", 0);
}

- (void)_axPrepareDockedLabelForIndex:(int64_t)a3
{
  v5 = [(TiltedTabViewControllerAccessibility *)self safeValueForKey:@"tiltedTabView"];
  v6 = [v5 safeArrayForKey:@"_visibleItems"];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  id v9 = v6;
  AXPerformSafeBlock();
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  v8 = [v7 safeValueForKey:@"borrowedContentView"];

  [(TiltedTabViewControllerAccessibility *)self _accessibilityUpdateDraftLabelForBorrowedView:v8 withActorAtIndex:a3];
}

uint64_t __70__TiltedTabViewControllerAccessibility__axPrepareDockedLabelForIndex___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (void)tiltedTabViewDidPresent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TiltedTabViewControllerAccessibility;
  [(TiltedTabViewControllerAccessibility *)&v8 tiltedTabViewDidPresent:v4];
  v5 = [v4 safeArrayForKey:@"_visibleItems"];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
      [(TiltedTabViewControllerAccessibility *)self _axPrepareDockedLabelForIndex:v6++];
    while ([v5 count] > v6);
  }
  [v4 _accessibilityLoadAccessibilityInformation];
  id v7 = [(TiltedTabViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v7 setAccessibilityViewIsModal:1];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)dismiss
{
  v2.receiver = self;
  v2.super_class = (Class)TiltedTabViewControllerAccessibility;
  [(TiltedTabViewControllerAccessibility *)&v2 dismiss];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __47__TiltedTabViewControllerAccessibility_dismiss__block_invoke()
{
}

- (void)tiltedTabViewDidDismiss:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TiltedTabViewControllerAccessibility;
  [(TiltedTabViewControllerAccessibility *)&v3 tiltedTabViewDidDismiss:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__TiltedTabViewControllerAccessibility_tiltedTabViewDidDismiss___block_invoke()
{
}

- (id)tiltedTabView:(id)a3 contentViewForItemAtIndex:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TiltedTabViewControllerAccessibility;
  unint64_t v6 = -[TiltedTabViewControllerAccessibility tiltedTabView:contentViewForItemAtIndex:](&v8, sel_tiltedTabView_contentViewForItemAtIndex_, a3);
  [(TiltedTabViewControllerAccessibility *)self _accessibilityUpdateDraftLabelForBorrowedView:v6 withActorAtIndex:a4];

  return v6;
}

- (id)tiltedTabView:(id)a3 snapshotViewForItemAtIndex:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TiltedTabViewControllerAccessibility;
  unint64_t v6 = -[TiltedTabViewControllerAccessibility tiltedTabView:snapshotViewForItemAtIndex:](&v8, sel_tiltedTabView_snapshotViewForItemAtIndex_, a3);
  [(TiltedTabViewControllerAccessibility *)self _accessibilityUpdateDraftLabelForBorrowedView:v6 withActorAtIndex:a4];

  return v6;
}

- (void)_accessibilityUpdateDraftLabelForBorrowedView:(id)a3 withActorAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TiltedTabViewControllerAccessibility *)self safeValueForKey:@"tiltedTabView"];
  objc_super v8 = [v7 safeArrayForKey:@"_visibleItems"];

  id v9 = [(TiltedTabViewControllerAccessibility *)self safeArrayForKey:@"dockedStates"];
  uint64_t v10 = v9;
  if (a4 >= 1 && [v9 count] >= (unint64_t)a4)
  {
    uint64_t v12 = accessibilityLocalizedString(@"draft.label");
    [v6 setAccessibilityLabel:v12];

    v11 = [v10 objectAtIndex:a4 - 1];
    LOBYTE(location) = 0;
    objc_opt_class();
    v13 = [v11 safeValueForKey:@"storedUserActivity"];
    v14 = __UIAccessibilityCastAsClass();

    id v15 = [v14 userInfo];
    v16 = [v15 objectForKey:@"ComposeNavTitle"];
    [v6 setAccessibilityValue:v16];
  }
  else
  {
    v11 = accessibilityLocalizedString(@"dismiss.draft.picker");
    [v6 setAccessibilityLabel:v11];
  }

  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_initWeak(&location, v6);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke;
  v21[3] = &unk_265133790;
  objc_copyWeak(&v22, &location);
  [v6 _setAccessibilityActivationPointBlock:v21];
  if ((a4 & 0x8000000000000000) == 0 && [v8 count] > (unint64_t)a4)
  {
    v17 = [v8 objectAtIndex:a4];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke_2;
    v19[3] = &unk_2651337B8;
    id v18 = v17;
    id v20 = v18;
    [v6 _setAccessibilityPathBlock:v19];
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

double __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  double MidX = CGRectGetMidX(v12);
  v13.origin.x = v3;
  v13.origin.y = v5;
  v13.size.width = v7;
  v13.size.height = v9;
  CGRectGetMinY(v13);
  return MidX;
}

id __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeUIViewForKey:@"contentShadowView"];
  double v2 = [v1 layer];
  CGFloat v3 = v2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  if (v2) {
    [v2 affineTransform];
  }
  LOBYTE(v9[0]) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  double v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  CGFloat v5 = (void *)MEMORY[0x263F1C478];
  [(UIView *)v4 bounds];
  objc_msgSend(v5, "bezierPathWithRect:");
  double v6 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  [(UIBezierPath *)v6 applyTransform:v9];
  CGFloat v7 = UIAccessibilityConvertPathToScreenCoordinates(v6, v4);

  return v7;
}

@end