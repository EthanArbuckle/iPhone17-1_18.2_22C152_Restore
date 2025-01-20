@interface VKCImageVisualSearchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeParentCustomContent;
- (BOOL)_axIsItemsInFocusContainer;
- (id)_axVisualSearchResultViews;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateUIForVisualSearchResultsClearExistingResults:(BOOL)a3 includeNotVisibleItems:(BOOL)a4;
@end

@implementation VKCImageVisualSearchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCImageVisualSearchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageVisualSearchView", @"resultViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCImageVisualSearchView", @"updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", "v", "B", "B", 0);
}

- (int64_t)accessibilityContainerType
{
  if ([(VKCImageVisualSearchViewAccessibility *)self _axIsItemsInFocusContainer]) {
    return 4;
  }
  else {
    return 0;
  }
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"in.focus.items");
}

- (id)accessibilityValue
{
  id v3 = NSString;
  v4 = accessibilityLocalizedString(@"items.count");
  v5 = [(VKCImageVisualSearchViewAccessibility *)self _axVisualSearchResultViews];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count"));

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)VKCImageVisualSearchViewAccessibility;
  [(VKCImageVisualSearchViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VKCImageVisualSearchViewAccessibility *)self _axVisualSearchResultViews];
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

- (BOOL)_accessibilityShouldIncludeParentCustomContent
{
  return 0;
}

- (void)updateUIForVisualSearchResultsClearExistingResults:(BOOL)a3 includeNotVisibleItems:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VKCImageVisualSearchViewAccessibility;
  [(VKCImageVisualSearchViewAccessibility *)&v5 updateUIForVisualSearchResultsClearExistingResults:a3 includeNotVisibleItems:a4];
  [(VKCImageVisualSearchViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axVisualSearchResultViews
{
  return (id)[(VKCImageVisualSearchViewAccessibility *)self safeArrayForKey:@"resultViews"];
}

- (BOOL)_axIsItemsInFocusContainer
{
  v2 = [(VKCImageVisualSearchViewAccessibility *)self _axVisualSearchResultViews];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

@end