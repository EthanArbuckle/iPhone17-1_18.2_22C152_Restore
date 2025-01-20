@interface SBFluidSwitcherContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanDrag;
- (BOOL)_axScrollToAppElement:(id)a3;
- (BOOL)_axSwitcherIsVisible;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (NSArray)_axAppElements;
- (NSMutableDictionary)_axAppElementsDictionary;
- (SBFluidSwitcherViewControllerAccessibility)_axSwitcherViewController;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityParentForFindingScrollParent;
- (id)_axElementForAppLayout:(id)a3;
- (id)_axElements:(BOOL)a3;
- (id)_axMainSwitcher;
- (id)accessibilityElements;
- (id)automationElements;
- (int64_t)_accessibilityPageCount;
- (void)_axAddVisibleItemContainer:(id)a3 forAppLayout:(id)a4;
- (void)_axRemoveVisibleItemContainerForAppLayout:(id)a3;
- (void)_axSetElementsArray:(id)a3 dictionary:(id)a4;
@end

@implementation SBFluidSwitcherContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherContentView";
}

- (void)_axAddVisibleItemContainer:(id)a3 forAppLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElementsDictionary];
  v8 = [v9 objectForKeyedSubscript:v6];

  [v8 setItemContainer:v7];
}

- (NSMutableDictionary)_axAppElementsDictionary
{
  v3 = [(SBFluidSwitcherContentViewAccessibility *)self _accessibilityValueForKey:@"AppSwitcherElementsDictionary"];
  if (![v3 count])
  {
    v4 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
    [v4 _axCreateAppElements];

    uint64_t v5 = [(SBFluidSwitcherContentViewAccessibility *)self _accessibilityValueForKey:@"AppSwitcherElementsDictionary"];

    v3 = (void *)v5;
  }

  return (NSMutableDictionary *)v3;
}

- (void)_axSetElementsArray:(id)a3 dictionary:(id)a4
{
  id v6 = a4;
  [(SBFluidSwitcherContentViewAccessibility *)self _accessibilitySetRetainedValue:a3 forKey:@"AppSwitcherElements"];
  [(SBFluidSwitcherContentViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"AppSwitcherElementsDictionary"];
}

- (SBFluidSwitcherViewControllerAccessibility)_axSwitcherViewController
{
  v2 = [(SBFluidSwitcherContentViewAccessibility *)self _accessibilityValueForKey:@"AppSwitcherViewController"];
  objc_opt_class();
  v3 = __UIAccessibilityCastAsSafeCategory();

  return (SBFluidSwitcherViewControllerAccessibility *)v3;
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityHasVisibleFrame", "B", 0);
  [v3 validateClass:@"SBFluidSwitcherViewController"];
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_plusButton" withType:"SBFluidSwitcherButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"appLayouts", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"scrollView", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_reopenClosedWindowsButton" withType:"SBFluidSwitcherTitledButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleUnderlayAccessoryViews", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherContentView" hasInstanceVariable:@"_delegate" withType:"<SBFluidSwitcherContentViewDelegate>"];
}

- (id)accessibilityElements
{
  id v3 = [(SBFluidSwitcherContentViewAccessibility *)self _axElements:0];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
    id v5 = [(SBFluidSwitcherContentViewAccessibility *)&v8 accessibilityElements];
  }
  id v6 = v5;

  return v6;
}

- (id)automationElements
{
  id v3 = [(SBFluidSwitcherContentViewAccessibility *)self _axElements:1];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
    id v5 = [(SBFluidSwitcherContentViewAccessibility *)&v8 automationElements];
  }
  id v6 = v5;

  return v6;
}

- (id)_axElements:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherIsVisible])
  {
    id v5 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = [v5 safeUIViewForKey:@"_reopenClosedWindowsButton"];
    if ([v7 _accessibilityViewIsVisible]) {
      [v6 axSafelyAddObject:v7];
    }
    objc_super v8 = [v5 safeUIViewForKey:@"_plusButton"];
    [v6 axSafelyAddObject:v8];
    if (v3)
    {
      id v9 = [(SBFluidSwitcherContentViewAccessibility *)self safeValueForKey:@"_delegate"];
      v10 = [v9 safeDictionaryForKey:@"visibleUnderlayAccessoryViews"];
      v11 = [v10 allValues];

      [v6 axSafelyAddObjectsFromArray:v11];
    }
    v12 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElements];
    if (UIAccessibilityIsSwitchControlRunning() && AXDeviceIsPhoneIdiom())
    {
      char v13 = [(SBFluidSwitcherContentViewAccessibility *)self _accessibilityApplicationIsRTL];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __55__SBFluidSwitcherContentViewAccessibility__axElements___block_invoke;
      v19[3] = &__block_descriptor_33_e49_B24__0__SBAppSwitcherAppAccessibilityElement_8Q16l;
      char v20 = v13;
      uint64_t v14 = [v12 axFilterObjectsUsingBlock:v19];

      v12 = (void *)v14;
    }
    v15 = [(SBFluidSwitcherContentViewAccessibility *)self _axMainSwitcher];
    int v16 = [v15 _axIsChamoisSwitcherVisible];

    if (v16)
    {
      v17 = [v5 _axChamoisActiveApps];
      [v6 axSafelyAddObjectsFromArray:v17];
    }
    [v6 axSafelyAddObjectsFromArray:v12];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL __55__SBFluidSwitcherContentViewAccessibility__axElements___block_invoke(uint64_t a1, void *a2)
{
  [a2 accessibilityFrame];
  double v7 = v5;
  double v8 = v6;
  double v10 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (*(unsigned char *)(a1 + 32))
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v3);
    v12 = [MEMORY[0x263F1C920] mainScreen];
    [v12 bounds];
    BOOL v13 = MaxX > CGRectGetMaxX(v16);
  }
  else
  {
    BOOL v13 = CGRectGetMinX(*(CGRect *)&v3) < 0.0;
  }
  BOOL v14 = v7 == v10;
  if (v8 != v9) {
    BOOL v14 = 0;
  }
  return !v14 && !v13;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if ([(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherIsVisible])
  {
    double v5 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
    char v6 = [v5 accessibilityScroll:a3];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
    return [(SBFluidSwitcherContentViewAccessibility *)&v8 accessibilityScroll:a3];
  }
}

- (int64_t)_accessibilityPageCount
{
  v2 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElements];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (![(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherIsVisible]) {
    goto LABEL_17;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_super v8 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElements];
  double v9 = [v8 reverseObjectEnumerator];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v31;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v9);
      }
      BOOL v14 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_accessibilityHitTest:withEvent:", v7, x, y);
      v15 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
      CGRect v16 = [v15 _axChamoisActiveApps];

      v17 = [(SBFluidSwitcherContentViewAccessibility *)self _axMainSwitcher];
      if ([v17 _axIsChamoisSwitcherVisible])
      {
        uint64_t v18 = [v16 count];

        if (v18 == 1)
        {
          v19 = [v16 objectAtIndex:0];
          [v19 _accessibilityBounds];
          UIAccessibilityFrameForBounds();
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;

          v38.origin.double x = v21;
          v38.origin.double y = v23;
          v38.size.width = v25;
          v38.size.height = v27;
          v37.double x = x;
          v37.double y = y;
          if (CGRectContainsPoint(v38, v37))
          {

            goto LABEL_14;
          }
        }
      }
      else
      {
      }
      if (v14)
      {

        goto LABEL_19;
      }
      BOOL v14 = v16;
LABEL_14:
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_16:

LABEL_17:
  v29.receiver = self;
  v29.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
  BOOL v14 = -[SBFluidSwitcherContentViewAccessibility _accessibilityHitTest:withEvent:](&v29, sel__accessibilityHitTest_withEvent_, v7, x, y);
LABEL_19:

  return v14;
}

- (void)_axRemoveVisibleItemContainerForAppLayout:(id)a3
{
  id v4 = a3;
  id v6 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElementsDictionary];
  double v5 = [v6 objectForKeyedSubscript:v4];

  [v5 setItemContainer:0];
}

- (id)_axElementForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElementsDictionary];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)_axScrollToAppElement:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherContentViewAccessibility *)self _axAppElements];
  uint64_t v6 = [v5 indexOfObject:v4];

  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = [v5 count] + ~v6;
  }
  objc_super v8 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__SBFluidSwitcherContentViewAccessibility__axScrollToAppElement___block_invoke;
  v11[3] = &unk_265153D50;
  v11[4] = self;
  char v9 = [v8 _axPerformScrollToIndex:v7 completion:v11];

  return v9;
}

void __65__SBFluidSwitcherContentViewAccessibility__axScrollToAppElement___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axSwitcherViewController];
  [v1 _axUpdateElementOrderingIfNecessary];
}

- (id)_axMainSwitcher
{
  objc_opt_class();
  v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  int64_t v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

- (NSArray)_axAppElements
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v3 = [(SBFluidSwitcherContentViewAccessibility *)self _accessibilityValueForKey:@"AppSwitcherElements"];
  id v4 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
  if (![v3 count])
  {
    [v4 _axCreateAppElements];
    uint64_t v5 = [(SBFluidSwitcherContentViewAccessibility *)self _accessibilityValueForKey:@"AppSwitcherElements"];

    int64_t v3 = (void *)v5;
  }
  uint64_t v6 = [(SBFluidSwitcherContentViewAccessibility *)self _axMainSwitcher];
  if ([v6 _axIsChamoisSwitcherVisible])
  {
    v19 = v6;
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    double v20 = v4;
    objc_super v8 = [v4 _axChamoisActiveAppLayouts];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v14 appLayout];
          char v16 = [v8 containsObject:v15];

          if ((v16 & 1) == 0) {
            [v7 axSafelyAddObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v17 = [v7 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

    uint64_t v6 = v19;
    id v4 = v20;
  }
  else
  {
    id v17 = v3;
  }

  return (NSArray *)v17;
}

- (BOOL)_accessibilityCanDrag
{
  return 1;
}

- (BOOL)_axSwitcherIsVisible
{
  v2 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
  char v3 = [v2 _axIsVisible];

  return v3;
}

- (id)_accessibilityParentForFindingScrollParent
{
  v2 = [(SBFluidSwitcherContentViewAccessibility *)self _axSwitcherViewController];
  char v3 = [v2 safeValueForKey:@"scrollView"];

  return v3;
}

@end