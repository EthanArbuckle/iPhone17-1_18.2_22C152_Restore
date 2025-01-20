@interface CEKLightingControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)_accessibilityIsVerticalAdjustableElement;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axChangeToLightingEffectAtIndex:(int64_t)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CEKLightingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKLightingControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CEKLightingControlItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"selectedLightingType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"_effectItemsForType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"_effectTypes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"_selectionIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"orientation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControlItem", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:", "v", "q", "Q", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKLightingControl", @"_enabledItemCount", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityCameraEditKitD2xLocalizedString(@"lighting.control.label");
}

- (id)accessibilityValue
{
  v11.receiver = self;
  v11.super_class = (Class)CEKLightingControlAccessibility;
  id v3 = [(CEKLightingControlAccessibility *)&v11 accessibilityValue];
  uint64_t v4 = [(CEKLightingControlAccessibility *)self safeIntegerForKey:@"selectedLightingType"];
  objc_opt_class();
  v5 = [(CEKLightingControlAccessibility *)self safeValueForKey:@"_effectItemsForType"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [NSNumber numberWithInteger:v4];
  v8 = [v6 objectForKey:v7];

  MEMORY[0x2455E1420](@"CEKLightingControlItem");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 safeValueForKey:@"displayName"];

    id v3 = (void *)v9;
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CEKLightingControlAccessibility;
  return *MEMORY[0x263F1CED8] | [(CEKLightingControlAccessibility *)&v3 accessibilityTraits];
}

- (void)_axChangeToLightingEffectAtIndex:(int64_t)a3
{
  objc_opt_class();
  v5 = [(CEKLightingControlAccessibility *)self safeValueForKey:@"_effectTypes"];
  v6 = __UIAccessibilityCastAsClass();

  unint64_t v7 = [(CEKLightingControlAccessibility *)self safeUnsignedIntegerForKey:@"_enabledItemCount"];
  if ((a3 & 0x8000000000000000) == 0 && v7 > a3 && [v6 count] > (unint64_t)a3)
  {
    v8 = [v6 objectAtIndexedSubscript:a3];
    [v8 integerValue];

    AXPerformSafeBlock();
  }
}

uint64_t __68__CEKLightingControlAccessibility__axChangeToLightingEffectAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSelectedLightingType:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48) shouldNotify:1 shouldSuppressHaptic:0 animated:1];
}

- (void)accessibilityIncrement
{
  uint64_t v3 = [(CEKLightingControlAccessibility *)self safeUnsignedIntegerForKey:@"_selectionIndex"]+ 1;

  [(CEKLightingControlAccessibility *)self _axChangeToLightingEffectAtIndex:v3];
}

- (void)accessibilityDecrement
{
  uint64_t v3 = [(CEKLightingControlAccessibility *)self safeUnsignedIntegerForKey:@"_selectionIndex"]- 1;

  [(CEKLightingControlAccessibility *)self _axChangeToLightingEffectAtIndex:v3];
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return (unint64_t)([(CEKLightingControlAccessibility *)self safeIntegerForKey:@"orientation"]- 3) < 2;
}

@end