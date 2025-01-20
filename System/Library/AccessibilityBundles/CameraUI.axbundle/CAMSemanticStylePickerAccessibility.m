@interface CAMSemanticStylePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (id)_axAnnouncementValue;
- (id)_axSemanticStyle;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axChangeValueInDirection:(int64_t)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CAMSemanticStylePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSemanticStylePicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMViewfinderViewController"];
  [v3 validateClass:@"CAMViewfinderViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_semanticStyleForPreview", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStylePicker", @"numberOfStyles", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStylePicker", @"selectedStyleIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyle", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStylePicker", @"_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", "v", "Q", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStylePicker", @"pageControl", "@", 0);
  [v3 validateClass:@"CAMSemanticStyleSettingsView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyleSettingsView", @"_semanticStyleDetailView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyleDetailView", @"semanticStyle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUID6xLocalizedString(@"semantic.style.picker");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMSemanticStylePickerAccessibility;
  return *MEMORY[0x263F1CED8] | [(CAMSemanticStylePickerAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 1)
  {
    -[CAMSemanticStylePickerAccessibility _axChangeValueInDirection:](self, "_axChangeValueInDirection:");
    v5 = [(CAMSemanticStylePickerAccessibility *)self _axAnnouncementValue];
    UIAccessibilitySpeak();
  }
  return v3 < 2;
}

- (id)_axAnnouncementValue
{
  unint64_t v3 = [(CAMSemanticStylePickerAccessibility *)self _axSemanticStyle];
  v4 = [v3 safeStringForKey:@"displayName"];
  v5 = [(CAMSemanticStylePickerAccessibility *)self safeValueForKey:@"pageControl"];
  v8 = [v5 accessibilityValue];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (void)_axChangeValueInDirection:(int64_t)a3
{
}

uint64_t __65__CAMSemanticStylePickerAccessibility__axChangeValueInDirection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSelectedStyleIndex:*(void *)(a1 + 40) shouldDelegate:1 shouldUpdateLayout:1 animated:0];
}

- (id)_axSemanticStyle
{
  unint64_t v3 = [(CAMSemanticStylePickerAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_4 startWithSelf:1];
  v4 = [v3 _accessibilityViewController];
  v5 = [v4 safeValueForKey:@"_semanticStyleForPreview"];

  if (!v5)
  {
    v6 = [(CAMSemanticStylePickerAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMSemanticStyleSettingsView")];
    v7 = [v6 safeValueForKey:@"_semanticStyleDetailView"];
    v5 = [v7 safeValueForKey:@"semanticStyle"];
  }

  return v5;
}

uint64_t __55__CAMSemanticStylePickerAccessibility__axSemanticStyle__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end