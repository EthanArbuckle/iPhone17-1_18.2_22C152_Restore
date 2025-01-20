@interface SBHWidgetStackViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollToNextWidget;
- (BOOL)_accessibilityScrollToPreviousWidget;
- (BOOL)_accessibilityScrollToWidgetNext:(BOOL)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityScrollStatusForScrollView:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBHWidgetStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHWidgetStackViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"pageControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"icon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"scrollViewDidEndScrolling:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"_updateActiveWidgetIndexAndScrollViewContentOffset", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLeafIcon", @"iconDataSources", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLeafIcon", @"activeDataSource", "@", 0);
  [v3 validateClass:@"SBWidgetIcon" isKindOfClass:@"SBLeafIcon"];
  [v3 validateClass:@"_UIScenePresentationView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidget", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHSiriSuggestionsElement", @"displayName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetStackViewControllerAccessibility;
  [(SBHWidgetStackViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBHWidgetStackViewControllerAccessibility *)self safeValueForKey:@"pageControl"];
  [v3 setIsAccessibilityElement:0];
}

- (id)accessibilityCustomActions
{
  v14[2] = *MEMORY[0x263EF8340];
  id v3 = [(SBHWidgetStackViewControllerAccessibility *)self safeValueForKey:@"icon"];
  objc_super v4 = [v3 safeArrayForKey:@"iconDataSources"];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityLocalizedString(@"widget.icon.action.next");
    v9 = (void *)[v7 initWithName:v8 target:self selector:sel__accessibilityScrollToNextWidget];

    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v11 = accessibilityLocalizedString(@"widget.icon.action.previous");
    v12 = (void *)[v10 initWithName:v11 target:self selector:sel__accessibilityScrollToPreviousWidget];

    v14[0] = v9;
    v14[1] = v12;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_accessibilityScrollToPreviousWidget
{
  return [(SBHWidgetStackViewControllerAccessibility *)self _accessibilityScrollToWidgetNext:0];
}

- (BOOL)_accessibilityScrollToNextWidget
{
  return [(SBHWidgetStackViewControllerAccessibility *)self _accessibilityScrollToWidgetNext:1];
}

- (BOOL)_accessibilityScrollToWidgetNext:(BOOL)a3
{
  BOOL v3 = a3;
  AXPerformSafeBlock();
  objc_opt_class();
  unint64_t v5 = [(SBHWidgetStackViewControllerAccessibility *)self safeUIViewForKey:@"scrollView"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 setIsAccessibilityElement:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v6);
  if (v3) {
    [v6 accessibilityScrollDownPage];
  }
  else {
    [v6 accessibilityScrollUpPage];
  }
  id v7 = v6;
  AXPerformBlockOnMainThreadAfterDelay();

  return 1;
}

uint64_t __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveWidgetIndexAndScrollViewContentOffset];
}

void __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
  objc_msgSend(*(id *)(a1 + 40), "setIsAccessibilityElement:", 0, v3, 3221225472, __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke_3, &unk_265157E90, v4);
  v2 = [*(id *)(a1 + 40) _accessibilityDescendantOfType:NSClassFromString(&cfstr_Uiscenepresent.isa)];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v2);
}

uint64_t __78__SBHWidgetStackViewControllerAccessibility__accessibilityScrollToWidgetNext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) scrollViewDidEndScrolling:*(void *)(a1 + 40)];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  id v5 = [(SBHWidgetStackViewControllerAccessibility *)self safeValueForKey:@"icon"];
  v6 = [v5 safeArrayForKey:@"iconDataSources"];
  unint64_t v7 = [v6 count];

  if (v7 < 2) {
    goto LABEL_7;
  }
  if (a3 != 4)
  {
    if (a3 == 3)
    {
      return [(SBHWidgetStackViewControllerAccessibility *)self _accessibilityScrollToPreviousWidget];
    }
LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)SBHWidgetStackViewControllerAccessibility;
    return [(SBHWidgetStackViewControllerAccessibility *)&v9 accessibilityScroll:a3];
  }

  return [(SBHWidgetStackViewControllerAccessibility *)self _accessibilityScrollToNextWidget];
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  uint64_t v3 = [(SBHWidgetStackViewControllerAccessibility *)self safeValueForKey:@"icon"];
  uint64_t v4 = [v3 safeArrayForKey:@"iconDataSources"];
  id v5 = [v3 safeValueForKey:@"activeDataSource"];
  uint64_t v6 = [v4 indexOfObject:v5];

  unint64_t v7 = [v4 objectAtIndexedSubscript:v6];
  v8 = [v7 safeStringForKey:@"displayName"];

  objc_super v9 = NSString;
  id v10 = accessibilityLocalizedString(@"widget.stack.scroll.status");
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = &stru_26F7E8EF8;
  }
  v12 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11, v6 + 1, objc_msgSend(v4, "count"));

  return v12;
}

@end