@interface VKCVisualSearchCornerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsNotObscuredItemsContainer;
- (id)_axVisualSearchCornerButtons;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_showCornerLookupButtonsForResults:(id)a3;
@end

@implementation VKCVisualSearchCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCVisualSearchCornerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchCornerView", @"_showCornerLookupButtonsForResults:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchCornerView", @"cornerButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchCornerView", @"analysis", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKImageAnalysis", @"imageAnalysisResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageAnalysisResult", @"visualSearchResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResult", @"resultItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCVisualSearchResultItem", @"shouldPlaceInCorner", "B", 0);
}

- (int64_t)accessibilityContainerType
{
  if ([(VKCVisualSearchCornerViewAccessibility *)self _axIsNotObscuredItemsContainer]) {
    return 0;
  }
  else {
    return 4;
  }
}

- (id)accessibilityLabel
{
  if ([(VKCVisualSearchCornerViewAccessibility *)self _axIsNotObscuredItemsContainer])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(@"out.of.focus.items");
  }

  return v2;
}

- (id)accessibilityValue
{
  id v3 = NSString;
  v4 = accessibilityLocalizedString(@"items.count");
  v5 = [(VKCVisualSearchCornerViewAccessibility *)self _axVisualSearchCornerButtons];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count"));

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)VKCVisualSearchCornerViewAccessibility;
  [(VKCVisualSearchCornerViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VKCVisualSearchCornerViewAccessibility *)self _axVisualSearchCornerButtons];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    do
    {
      objc_opt_class();
      v7 = [v3 objectAtIndexedSubscript:v6];
      v8 = __UIAccessibilityCastAsSafeCategory();

      v9 = NSString;
      v10 = accessibilityLocalizedString(@"lookup.button.position");
      v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, ++v6, v5);
      [v8 _axSetPositionInButtonsList:v11];
    }
    while (v5 != v6);
  }
}

- (void)_showCornerLookupButtonsForResults:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCVisualSearchCornerViewAccessibility;
  [(VKCVisualSearchCornerViewAccessibility *)&v4 _showCornerLookupButtonsForResults:a3];
  [(VKCVisualSearchCornerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axVisualSearchCornerButtons
{
  return (id)[(VKCVisualSearchCornerViewAccessibility *)self safeArrayForKey:@"cornerButtons"];
}

- (BOOL)_axIsNotObscuredItemsContainer
{
  v2 = [(VKCVisualSearchCornerViewAccessibility *)self safeValueForKeyPath:@"analysis.imageAnalysisResult.visualSearchResult"];
  id v3 = [v2 safeArrayForKey:@"resultItems"];

  if ([v3 count] == 1)
  {
    objc_super v4 = [v3 objectAtIndexedSubscript:0];
    char v5 = [v4 safeBoolForKey:@"shouldPlaceInCorner"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

@end