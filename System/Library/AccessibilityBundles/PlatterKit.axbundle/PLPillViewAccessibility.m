@interface PLPillViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation PLPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLPillView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPillView", @"centerContentItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPillView", @"leadingAccessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPillView", @"trailingAccessoryView", "@", 0);
  [v3 validateClass:@"PLPillView" hasInstanceVariable:@"_materialView" withType:"MTMaterialView"];
  [v3 validateClass:@"PLPillView" hasInstanceVariable:@"_contentView" withType:"PLPillContentView"];
  [v3 validateClass:@"PLPillContentView" hasInstanceVariable:@"_leadingAccessoryView" withType:"UIView"];
  [v3 validateClass:@"PLPillContentView" hasInstanceVariable:@"_trailingAccessoryView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPillContentItem", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPillContentItem", @"attributedText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [(PLPillViewAccessibility *)self safeArrayForKey:@"centerContentItems"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      v8 = v5;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        v10 = objc_msgSend(v9, "safeStringForKey:", @"text", v14, v15);
        if (!v10)
        {
          objc_opt_class();
          v11 = [v9 safeValueForKey:@"attributedText"];
          v12 = __UIAccessibilityCastAsClass();

          v10 = [v12 string];
        }
        v14 = v10;
        v15 = @"__AXStringForVariablesSentinel";
        v5 = __UIAXStringForVariables();

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v10, @"__AXStringForVariablesSentinel");
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v9[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  uint64_t v3 = [(PLPillViewAccessibility *)self safeValueForKey:@"leadingAccessoryView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLPillViewAccessibility;
    uint64_t v5 = [(PLPillViewAccessibility *)&v8 _accessibilitySupplementaryHeaderViews];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v9[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  uint64_t v3 = [(PLPillViewAccessibility *)self safeValueForKey:@"trailingAccessoryView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLPillViewAccessibility;
    uint64_t v5 = [(PLPillViewAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityPath
{
  v2 = [(PLPillViewAccessibility *)self safeValueForKey:@"_materialView"];
  uint64_t v3 = [v2 accessibilityPath];

  return v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)automationElements
{
  v2 = [(PLPillViewAccessibility *)self safeValueForKey:@"_contentView"];
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [v2 safeValueForKey:@"_leadingAccessoryView"];
  uint64_t v5 = [v2 safeValueForKey:@"_trailingAccessoryView"];
  uint64_t v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

@end