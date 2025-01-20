@interface SUUIStandardInteractiveSegmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIStandardInteractiveSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIStandardInteractiveSegment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIInteractiveSegmentedControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIInteractiveSegmentedControl", @"segments", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIInteractiveSegmentedControl", @"selectedSegmentIndexForSelectionProgress:", "q", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStandardInteractiveSegment", @"attributedTitle", "@", 0);
  [v3 validateClass:@"SUUIInteractiveSegmentedControl" hasInstanceVariable:@"_selectionProgress" withType:"d"];
}

- (_NSRange)accessibilityRowRange
{
  id v3 = [(SUUIStandardInteractiveSegmentAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Suuiinteractiv.isa)];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 safeValueForKey:@"segments"];
    v6 = __UIAccessibilitySafeClass();

    uint64_t v7 = [v6 indexOfObject:self];
    uint64_t v8 = [v6 count];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0x7FFFFFFFLL;
  }

  NSUInteger v9 = v7;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SUUIStandardInteractiveSegmentAccessibility *)self safeValueForKey:@"attributedTitle"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 string];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3 = *MEMORY[0x263F1CEE8];
  v4 = [(SUUIStandardInteractiveSegmentAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Suuiinteractiv.isa)];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 safeValueForKey:@"segments"];
    uint64_t v7 = __UIAccessibilitySafeClass();

    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    uint64_t v12 = MEMORY[0x263EF8330];
    id v13 = v5;
    AXPerformSafeBlock();
    uint64_t v8 = v15[3];

    _Block_object_dispose(&v14, 8);
    uint64_t v9 = objc_msgSend(v7, "indexOfObject:", self, v12, 3221225472, __66__SUUIStandardInteractiveSegmentAccessibility_accessibilityTraits__block_invoke, &unk_265138300);
    uint64_t v10 = *MEMORY[0x263F1CF38];
    if (v8 != v9) {
      uint64_t v10 = 0;
    }
    v3 |= v10;
  }
  return v3;
}

uint64_t __66__SUUIStandardInteractiveSegmentAccessibility_accessibilityTraits__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 safeDoubleForKey:@"_selectionProgress"];
  uint64_t result = objc_msgSend(v2, "selectedSegmentIndexForSelectionProgress:");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end