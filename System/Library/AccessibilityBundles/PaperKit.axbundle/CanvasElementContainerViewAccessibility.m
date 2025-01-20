@interface CanvasElementContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (id)markupController;
- (unint64_t)accessibilityDirectTouchOptions;
- (unint64_t)accessibilityTraits;
@end

@implementation CanvasElementContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PaperKit.CanvasElementContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PPKMarkupContainerViewController"];
  [v3 validateClass:@"PaperKit.MarkupContainerViewController" hasSwiftField:@"editingMode" withSwiftType:"CanvasEditingMode"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"canvas");
}

- (unint64_t)accessibilityDirectTouchOptions
{
  return 2;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(CanvasElementContainerViewAccessibility *)self markupController];
  v4 = [v3 safeSwiftValueForKey:@"editingMode"];
  v5 = [v4 description];

  if ([v5 isEqualToString:@"PaperKit.CanvasEditingMode.allowsAll"])
  {
    id v6 = (id)*MEMORY[0x263F1CEE0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CanvasElementContainerViewAccessibility;
    id v6 = [(CanvasElementContainerViewAccessibility *)&v8 accessibilityTraits];
  }

  return (unint64_t)v6;
}

- (id)markupController
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__CanvasElementContainerViewAccessibility_markupController__block_invoke;
  v5[3] = &unk_2651408A0;
  v5[4] = &v6;
  id v2 = (id)[(CanvasElementContainerViewAccessibility *)self _accessibilityFindViewAncestor:v5 startWithSelf:0];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __59__CanvasElementContainerViewAccessibility_markupController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Ppkmarkupconta.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
  }

  return isKindOfClass & 1;
}

- (id)automationElements
{
  char v9 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 subviews];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CanvasElementContainerViewAccessibility;
    id v5 = [(CanvasElementContainerViewAccessibility *)&v8 automationElements];
  }
  uint64_t v6 = v5;

  return v6;
}

@end