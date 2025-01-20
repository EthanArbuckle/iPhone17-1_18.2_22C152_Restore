@interface PKPassGroupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDismissModalGroup;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_axIsBackFacing;
- (BOOL)_axIsCardFirstInPile;
- (BOOL)_axIsOnlyCardInPile;
- (BOOL)_axMoveCard:(id)a3 up:(BOOL)a4;
- (BOOL)_axMoveCardDown:(id)a3;
- (BOOL)_axMoveCardUp:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_axSuperAccessibilityFrame;
- (CGRect)accessibilityFrame;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPassGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassGroupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"PKPassGroupStackViewDatasource" hasMethod:@"indexOfGroup:" isInstanceMethod:1 isRequired:1];
  [v3 validateProtocol:@"PKPassGroupStackViewDatasource" hasMethod:@"numberOfGroups" isInstanceMethod:1 isRequired:1];
  [v3 validateProtocol:@"PKPassGroupStackViewDatasource" hasMethod:@"indexOfSeparationGroup" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"PKPassGroupStackView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"groupViewPanDidBegin:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"groupViewPanDidEnd:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"reloadData", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKGroup", @"passAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupView", @"pageControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"_groupCellHeight", "d", 0);
  [v3 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_passPileViews" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"datasource", "@", 0);
  [v3 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_headerContainerView" withType:"PKPassthroughView"];
  [v3 validateClass:@"PKPassGroupStackView" isKindOfClass:@"UIScrollView"];
}

- (BOOL)_axIsCardFirstInPile
{
  id v3 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"presentationState"];
  int v4 = [v3 intValue];

  if (v4 != 2) {
    return 0;
  }
  objc_opt_class();
  v5 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkpassgroupsta.isa)];
  v6 = [v5 safeValueForKey:@"_passPileViews"];
  v7 = __UIAccessibilityCastAsClass();

  uint64_t v8 = [v7 indexOfObject:self];
  BOOL v9 = v8 == [v7 count] - 1;

  return v9;
}

- (BOOL)_axIsOnlyCardInPile
{
  objc_opt_class();
  id v3 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkpassgroupsta.isa)];
  int v4 = [v3 safeValueForKey:@"_passPileViews"];
  v5 = __UIAccessibilityCastAsClass();

  BOOL v6 = [v5 count] == 1;
  return v6;
}

- (BOOL)isAccessibilityElement
{
  if ([(PKPassGroupViewAccessibility *)self _axIsOnlyCardInPile]) {
    return 0;
  }
  int v4 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"presentationState"];
  int v5 = [v4 intValue];

  if (v5 == 1) {
    return 1;
  }

  return [(PKPassGroupViewAccessibility *)self _axIsCardFirstInPile];
}

- (BOOL)accessibilityElementsHidden
{
  if ([(PKPassGroupViewAccessibility *)self _axIsOnlyCardInPile]) {
    return 0;
  }
  id v3 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"presentationState"];
  int v4 = [v3 intValue];

  if (v4 == 3) {
    return 0;
  }
  else {
    return ![(PKPassGroupViewAccessibility *)self isAccessibilityElement];
  }
}

- (BOOL)_accessibilityScrollToVisible
{
  id v3 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"presentationState"];
  int v4 = [v3 intValue];

  if (v4 == 1)
  {
    char v23 = 0;
    objc_opt_class();
    int v5 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
    BOOL v6 = __UIAccessibilityCastAsClass();

    if (v6)
    {
      v7 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkpassgroupsta.isa)];
      BOOL v8 = v7 != 0;
      if (v7)
      {
        [(PKPassGroupViewAccessibility *)self frame];
        double v10 = v9;
        [v6 contentOffset];
        double v12 = v11;
        double v14 = v13;
        v15 = [v7 safeValueForKey:@"_groupCellHeight"];
        [v15 doubleValue];
        double v17 = v16;

        double v18 = fmax(v17, 120.0);
        if (v10 < v14 || v10 > v14 - v18)
        {
          double v19 = v10 + v18 * -1.5;
          double v20 = 0.0;
          if (v19 >= 0.0) {
            double v20 = v19;
          }
          objc_msgSend(v6, "setContentOffset:animated:", 0, v12, v20);
          UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)PKPassGroupViewAccessibility;
    return [(PKPassGroupViewAccessibility *)&v22 _accessibilityScrollToVisible];
  }
  return v8;
}

- (CGRect)_axSuperAccessibilityFrame
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupViewAccessibility;
  [(PKPassGroupViewAccessibility *)&v6 accessibilityFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  v28.receiver = self;
  v28.super_class = (Class)PKPassGroupViewAccessibility;
  [(PKPassGroupViewAccessibility *)&v28 accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v11 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"superview"];
  double v12 = [v11 safeValueForKey:@"subviews"];
  double v13 = [v12 indexesOfObjectsPassingTest:&__block_literal_global_4];
  double v14 = [v12 objectsAtIndexes:v13];
  v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_345];

  unint64_t v16 = [v15 indexOfObject:self] + 1;
  if ([v15 count] > v16)
  {
    v29.origin.CGFloat x = v4;
    v29.origin.CGFloat y = v6;
    v29.size.CGFloat width = v8;
    v29.size.CGFloat height = v10;
    if (CGRectGetMaxY(v29) > 0.0)
    {
      double v17 = [v15 objectAtIndex:v16];
      [v17 accessibilityFrame];
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
      if (CGRectGetMaxY(v30) > 0.0)
      {
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v31);
        v32.origin.CGFloat x = v4;
        v32.origin.CGFloat y = v6;
        v32.size.CGFloat width = v8;
        v32.size.CGFloat height = v10;
        double v23 = MinY - CGRectGetMinY(v32);
        if (v23 < v10) {
          double v10 = v23;
        }
      }
    }
  }

  double v24 = v4;
  double v25 = v6;
  double v26 = v8;
  double v27 = v10;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Pkpassgroupvie.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityFrame__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if (objc_opt_respondsToSelector()) {
    [v5 _axSuperAccessibilityFrame];
  }
  else {
    [v5 accessibilityFrame];
  }
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;

  if (objc_opt_respondsToSelector()) {
    [v4 _axSuperAccessibilityFrame];
  }
  else {
    [v4 accessibilityFrame];
  }
  CGFloat rect = v14;
  CGFloat v18 = v15;
  CGFloat v19 = v16;
  CGFloat v20 = v17;
  v29.origin.CGFloat x = v10;
  v29.origin.CGFloat y = v11;
  v29.size.CGFloat width = v12;
  v29.size.CGFloat height = v13;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  CGFloat v23 = v10;
  double MinY = CGRectGetMinY(v29);
  v30.origin.CGFloat x = rect;
  v30.origin.CGFloat y = v18;
  v30.size.CGFloat width = v19;
  v30.size.CGFloat height = v20;
  if (MinY >= CGRectGetMinY(v30))
  {
    v31.origin.CGFloat x = v23;
    v31.origin.CGFloat y = v22;
    v31.size.CGFloat width = v21;
    v31.size.CGFloat height = v13;
    double v26 = CGRectGetMinY(v31);
    v32.origin.CGFloat x = rect;
    v32.origin.CGFloat y = v18;
    v32.size.CGFloat width = v19;
    v32.size.CGFloat height = v20;
    uint64_t v25 = v26 != CGRectGetMinY(v32);
  }
  else
  {
    uint64_t v25 = -1;
  }

  return v25;
}

- (unint64_t)accessibilityTraits
{
  if ([(PKPassGroupViewAccessibility *)self _axIsCardFirstInPile]
    && ![(PKPassGroupViewAccessibility *)self _axIsOnlyCardInPile])
  {
    return *MEMORY[0x263F1CEE8];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupViewAccessibility;
  return [(PKPassGroupViewAccessibility *)&v4 accessibilityTraits];
}

- (id)accessibilityHint
{
  if ([(PKPassGroupViewAccessibility *)self _axIsCardFirstInPile]
    && ![(PKPassGroupViewAccessibility *)self _axIsOnlyCardInPile])
  {
    double v3 = @"other.cards.pile.hint";
  }
  else
  {
    double v3 = @"stacked.card.hint";
  }
  objc_super v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (id)accessibilityLabel
{
  double v3 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"group"];
  objc_super v4 = [v3 safeValueForKey:@"passCount"];
  uint64_t v5 = [v4 integerValue];

  if (v5)
  {
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x3032000000;
    double v16 = __Block_byref_object_copy__0;
    double v17 = __Block_byref_object_dispose__0;
    id v18 = 0;
    uint64_t v11 = MEMORY[0x263EF8330];
    id v12 = v3;
    AXPerformSafeBlock();
    if ([(PKPassGroupViewAccessibility *)self _axIsCardFirstInPile]&& ![(PKPassGroupViewAccessibility *)self _axIsOnlyCardInPile])
    {
      double v9 = accessibilityLocalizedString(@"other.cards.piled.together");
    }
    else
    {
      double v6 = [(PKPassGroupViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_368];
      double v7 = [v6 accessibilityLabel];
      uint64_t v8 = [v7 length];

      if (v8) {
        [v6 accessibilityLabel];
      }
      else {
      double v9 = [(id)v14[5] safeValueForKey:@"organizationName"];
      }
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) passAtIndex:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Pkpasspaymentc_1.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityCustomActions
{
  double v3 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"group"];
  objc_super v4 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkpassgroupsta.isa)];
  [v4 safeValueForKey:@"datasource"];
  uint64_t v22 = 0;
  CGFloat v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  AXPerformSafeBlock();
  unint64_t v6 = v23[3];

  _Block_object_dispose(&v22, 8);
  uint64_t v22 = 0;
  CGFloat v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v20 = v21;
  AXPerformSafeBlock();
  uint64_t v7 = v23[3];

  _Block_object_dispose(&v22, 8);
  uint64_t v22 = 0;
  CGFloat v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  id v8 = v20;
  AXPerformSafeBlock();
  uint64_t v9 = v23[3];

  _Block_object_dispose(&v22, 8);
  id v10 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v11 = accessibilityLocalizedString(@"move.card.up.action");
  id v12 = objc_msgSend(v10, "initWithName:target:selector:", v11, self, sel__axMoveCardUp_, v19, 3221225472, __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke_3, &unk_265140F38);

  id v13 = objc_alloc(MEMORY[0x263F1C390]);
  double v14 = accessibilityLocalizedString(@"move.card.down.action");
  uint64_t v15 = (void *)[v13 initWithName:v14 target:self selector:sel__axMoveCardDown_];

  double v16 = [MEMORY[0x263EFF980] array];
  double v17 = v16;
  if (v6 && v6 != v9 + 1) {
    [v16 addObject:v12];
  }
  if (v6 < v7 - 1 && v6 != v9) {
    [v17 addObject:v15];
  }

  return v17;
}

uint64_t __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfGroup:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfGroups];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfSeparationGroup];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_axMoveCard:(id)a3 up:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"group"];
  uint64_t v7 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkpassgroupsta.isa)];
  [v7 safeValueForKey:@"datasource"];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v6;
  AXPerformSafeBlock();

  _Block_object_dispose(v12, 8);
  id v8 = v7;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __47__PKPassGroupViewAccessibility__axMoveCard_up___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfGroup:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __47__PKPassGroupViewAccessibility__axMoveCard_up___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) groupViewPanDidBegin:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  double v3 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v5 = v4 - 1;
  }
  else {
    uint64_t v5 = v4 + 1;
  }
  [v2 groupStackView:*(void *)(a1 + 32) groupDidMoveFromIndex:v4 toIndex:v5];

  [*(id *)(a1 + 32) reloadData];
  unint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);

  return [v6 groupViewPanDidEnd:v7];
}

- (BOOL)_axMoveCardUp:(id)a3
{
  return [(PKPassGroupViewAccessibility *)self _axMoveCard:a3 up:1];
}

- (BOOL)_axMoveCardDown:(id)a3
{
  return [(PKPassGroupViewAccessibility *)self _axMoveCard:a3 up:0];
}

- (id)accessibilityValue
{
  double v3 = [(PKPassGroupViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_388];
  uint64_t v4 = [v3 accessibilityLabel];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    unint64_t v6 = [v3 accessibilityLabel];
    id v11 = [v3 accessibilityValue];
    uint64_t v7 = __AXStringForVariables();
  }
  else
  {
    unint64_t v6 = [(PKPassGroupViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_396];
    id v8 = [v6 accessibilityValue];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v7 = [v6 accessibilityValue];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Pkpassfieldvie.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Pkpasspaymentc_1.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityDismissModalGroup
{
  double v3 = [(PKPassGroupViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkpassgroupsta.isa)];
  uint64_t v4 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"group"];
  uint64_t v5 = [v4 safeValueForKey:@"groupID"];

  unint64_t v6 = [v3 safeValueForKey:@"_animatorsByGroupID"];
  uint64_t v7 = [v6 objectForKey:v5];

  if (v7)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"allowCardSwiping", @"com.apple.wallet", 0);
    id v9 = v3;
    AXPerformSafeBlock();
    if (AppBooleanValue)
    {
      id v11 = v9;
      AXPerformSafeBlock();
    }
  }

  return v7 != 0;
}

void __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) safeValueForKey:@"datasource"];
    double v3 = [v2 safeValueForKey:@"numberOfGroups"];
    int v4 = [v3 intValue];

    if (v4 == 2)
    {
      uint64_t v5 = [*(id *)(a1 + 32) safeValueForKey:@"_modalGroupIndex"];
      int v6 = [v5 intValue];

      if (v6)
      {
        uint64_t v7 = v9;
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_3;
        v9[3] = &unk_265140F10;
      }
      else
      {
        uint64_t v7 = v10;
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_2;
        v10[3] = &unk_265140F10;
      }
    }
    else
    {
      uint64_t v7 = v8;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_4;
      v8[3] = &unk_265140F10;
    }
    v7[4] = *(id *)(a1 + 32);
    AXPerformSafeBlock();
  }
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalGroupIndex:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 setPresentationState:5 animated:1];
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalGroupIndex:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setPresentationState:5 animated:1];
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPresentationState:4 animated:1];
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [v2 safeValueForKey:@"_modallyPresentedGroupView"];
  uint64_t v4 = [v2 _indexOfGroupView:v3];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 setModalGroupIndex:v4 - 1];
}

- (BOOL)accessibilityPerformEscape
{
  if ([(PKPassGroupViewAccessibility *)self isAccessibilityElement])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(PKPassGroupViewAccessibility *)self _accessibilityDismissModalGroup];
    if (v3)
    {
      AXPerformBlockOnMainThreadAfterDelay();
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

void __58__PKPassGroupViewAccessibility_accessibilityPerformEscape__block_invoke()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CE68];
  accessibilityLocalizedString(@"card.dismissed");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

- (BOOL)_axIsBackFacing
{
  id v2 = [(PKPassGroupViewAccessibility *)self safeValueForKey:@"frontmostPassView"];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 safeValueForKey:@"showingFront"];
    int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if ([(PKPassGroupViewAccessibility *)self _axIsBackFacing]
    || [(PKPassGroupViewAccessibility *)self isAccessibilityElement])
  {
    return 0;
  }
  if (a3 == 3)
  {
    int v5 = 0;
    goto LABEL_8;
  }
  if (a3 != 4) {
    return 0;
  }
  [(PKPassGroupViewAccessibility *)self _accessibilityDismissModalGroup];
  int v5 = accessibilityLocalizedString(@"card.dismissed");
LABEL_8:
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v5);

  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  [v2 bounds];
  double MidX = CGRectGetMidX(v14);
  [v2 bounds];
  double MidY = CGRectGetMidY(v15);
  if (MidY <= 10.0) {
    double v5 = MidY;
  }
  else {
    double v5 = 10.0;
  }
  int v6 = [v2 window];
  objc_msgSend(v2, "convertPoint:toView:", 0, MidX, v5);
  objc_msgSend(v6, "convertPoint:toWindow:", 0);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

@end