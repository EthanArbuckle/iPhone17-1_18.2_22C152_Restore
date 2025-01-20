@interface SBAppSwitcherScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)_ax_adjustedContentOffsetForDifferentialScrollingToShowFocusItemWithInfo:(id)a3 proposedContentOffset:(CGPoint)a4;
@end

@implementation SBAppSwitcherScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFluidSwitcherItemContainer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherItemContainer", @"appLayout", "@", 0);
  [v3 validateClass:@"SBAppSwitcherScrollView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_adjustFocusContentOffset:toShowFocusItemWithInfo:", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusItemInfo", @"item", "@", 0);
  [v3 validateClass:@"SBAppSwitcherScrollView" isKindOfClass:@"BSUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BSUIScrollView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"appLayouts", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
  [v3 validateClass:@"SBSwitcherModifier" conformsToProtocol:@"SBSwitcherMultitaskingQueryProviding"];
  [v3 validateProtocol:@"SBSwitcherMultitaskingQueryProviding" hasRequiredInstanceMethod:@"contentOffsetForIndex:alignment:"];
}

- (CGPoint)_ax_adjustedContentOffsetForDifferentialScrollingToShowFocusItemWithInfo:(id)a3 proposedContentOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  v8 = [(SBAppSwitcherScrollViewAccessibility *)self safeValueForKey:@"delegate"];
  v9 = [v7 safeValueForKey:@"item"];
  v10 = [v9 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfluidswitche_6.isa)];

  v11 = [v8 safeArrayForKey:@"appLayouts"];
  v12 = [v10 safeValueForKey:@"appLayout"];
  uint64_t v13 = [v11 indexOfObject:v12];

  LOBYTE(v19) = 0;
  v14 = [v8 safeValueForKey:@"rootModifier"];
  v15 = __UIAccessibilitySafeClass();

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = 0;
    v20 = (double *)&v19;
    uint64_t v21 = 0x3010000000;
    v22 = &unk_2425A78AD;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    id v18 = v15;
    AXPerformSafeBlock();
    CGFloat x = v20[4];
    CGFloat y = v20[5];

    _Block_object_dispose(&v19, 8);
  }

  double v16 = x;
  double v17 = y;
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

uint64_t __135__SBAppSwitcherScrollViewAccessibility__ax_adjustedContentOffsetForDifferentialScrollingToShowFocusItemWithInfo_proposedContentOffset___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) contentOffsetForIndex:*(void *)(a1 + 48) alignment:2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

@end