@interface MOSuggestionActivityRouteAssetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MOSuggestionActivityRouteAssetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionActivityRouteAssetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MOSuggestionActivityRouteAssetViewAccessibility;
  [(MOSuggestionActivityRouteAssetViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(MOSuggestionActivityRouteAssetViewAccessibility *)self safeValueForKey:@"subviews"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_282];
}

uint64_t __93__MOSuggestionActivityRouteAssetViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456578B0](@"UIImageView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __93__MOSuggestionActivityRouteAssetViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
}

- (id)accessibilityLabel
{
  id v2 = UIAXStringForAllChildren();
  v4 = _accessibilityReplaceStylsticBulletsForSpeaking(v2, v3);

  return v4;
}

@end