@interface UIToolbarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityFuzzyHitTestElements;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIToolbar", @"items", "@", 0);
  objc_storeStrong(v4, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 24;
}

- (id)accessibilityIdentifier
{
  location[2] = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIToolbarAccessibility;
  location[0] = [(UIToolbarAccessibility *)&v4 accessibilityIdentifier];
  if (location[0]) {
    id v6 = location[0];
  }
  else {
    id v6 = AXNoLoc_0(@"Toolbar");
  }
  objc_storeStrong(location, 0);
  v2 = v6;

  return v2;
}

- (id)accessibilityLabel
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIToolbarAccessibility *)self accessibilityUserDefinedLabel];
  if (location[0]) {
    id v5 = location[0];
  }
  else {
    id v5 = accessibilityLocalizedString(@"toolbar.label");
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[UIToolbarAccessibility _accessibleSubviews:](self, "_accessibleSubviews:", 1, a2, self);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  id v2 = (id)[(UIToolbarAccessibility *)self accessibilityUserDefinedShouldGroupChildren];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(UIToolbarAccessibility *)self accessibilityUserDefinedShouldGroupChildren];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)UIToolbarAccessibility;
  [(UIToolbarAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(UIToolbarAccessibility *)v13 safeValueForKey:@"items"];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    uint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v10, "_accessibilityLoadAccessibilityInformation", v6);
      ++v5;
      uint64_t v6 = v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0;
        uint64_t v6 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = [location[0] isEqual:*MEMORY[0x263F1D180]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end