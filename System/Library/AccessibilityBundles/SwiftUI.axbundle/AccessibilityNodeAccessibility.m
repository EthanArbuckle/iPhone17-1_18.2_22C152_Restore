@interface AccessibilityNodeAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAutomationHitTestReverseOrder;
- (BOOL)_accessibilityFKAShouldIncludeViewsAsElements;
- (BOOL)_accessibilityHasOrderedChildren;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsMacVisualAppearance;
- (BOOL)_accessibilityIsSingleLeafItemInCell;
- (BOOL)_accessibilityIsSoftwareKeyboardMimic;
- (BOOL)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:(SEL)a3 nonAttributedSelector:(SEL)a4 attributedSelector:(SEL)a5;
- (BOOL)_accessibilityShouldExpandMathEquation;
- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor;
- (BOOL)_accessibilityShouldSpeakMathEquationTrait;
- (BOOL)_accessibilityUseElementAtPositionAfterActivation;
- (BOOL)_accessibilityUserTestingIsElementClassAcceptable;
- (BOOL)_axAreChildrenFocused;
- (BOOL)_prefersFocusContainment;
- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly;
- (BOOL)canBecomeFocused;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isTransparentFocusItem;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)accessibilityFrame;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (NSString)focusGroupIdentifier;
- (UIFocusEnvironment)parentFocusEnvironment;
- (id)_accessibilityAXAttributedLabel;
- (id)_accessibilityMediaAnalysisElement;
- (id)_accessibilitySoftwareMimicKeyboard;
- (id)_accessibilityVisualExpansionProxy;
- (id)_accessibilityWindow;
- (id)_preferredFocusRegionCoordinateSpace;
- (id)accessibilityMathEquation;
- (id)accessibilityPath;
- (id)automationElements;
- (id)focusItemsInRect:(CGRect)a3;
- (int64_t)accessibilityElementCount;
- (void)_axSetAreChildrenFocused:(BOOL)a3;
- (void)_destroyFocusLayer;
- (void)_updateFocusLayerFrame;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation AccessibilityNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SwiftUI.AccessibilityLazyLayoutNode" isKindOfClass:@"SwiftUI.AccessibilityNode"];
  [v3 validateClass:@"SwiftUI.AccessibilityNode" hasSwiftField:@"viewRendererHost" withSwiftType:"Optional<ViewRendererHost>"];
  [v3 validateClass:@"SwiftUI.AccessibilityNode" hasSwiftField:@"parent" withSwiftType:"Optional<AccessibilityNode>"];
  [v3 validateClass:@"SwiftUI.AccessibilityNode" hasSwiftField:@"children" withSwiftType:"Array<AccessibilityNode>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SwiftUI.AccessibilityNode", @"_accessibilityIsHostNode", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SwiftUI.AccessibilityNode", @"_accessibilityNodeRepresentedElement", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SwiftUI.AccessibilityNode", @"_accessibilityNodeChildrenUnsorted", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SwiftUI.AccessibilityNode", @"accessibilityCustomAttribute:", "@", "@", 0);
}

- (id)automationElements
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __52__AccessibilityNodeAccessibility_automationElements__block_invoke;
  v10 = &unk_26515BA48;
  v11 = self;
  v12 = &v13;
  AXPerformSafeBlock();
  int v3 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AccessibilityNodeAccessibility;
    v4 = [(AccessibilityNodeAccessibility *)&v6 automationElements];
  }

  return v4;
}

void __52__AccessibilityNodeAccessibility_automationElements__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"IgnoreAutomationChildren"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

- (BOOL)_accessibilityUserTestingIsElementClassAcceptable
{
  return 1;
}

- (BOOL)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:(SEL)a3 nonAttributedSelector:(SEL)a4 attributedSelector:(SEL)a5
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    return 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)AccessibilityNodeAccessibility;
  return [(AccessibilityNodeAccessibility *)&v10 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:a3 nonAttributedSelector:a4 attributedSelector:a5];
}

- (BOOL)_accessibilityAutomationHitTestReverseOrder
{
  return 1;
}

- (BOOL)_accessibilityIsSingleLeafItemInCell
{
  if (![(AccessibilityNodeAccessibility *)self isAccessibilityElement]) {
    return 0;
  }
  int v3 = [(AccessibilityNodeAccessibility *)self safeSwiftValueForKey:@"parent"];
  if ([v3 safeBoolForKey:@"_accessibilityIsHostNode"])
  {
    v4 = [v3 safeArrayForKey:@"_accessibilityNodeChildrenUnsorted"];
    BOOL IsSingleChildInArray = _accessibilityNodeIsSingleChildInArray(self, v4);
  }
  else
  {
    v4 = [v3 safeSwiftValueForKey:@"parent"];
    if ([v4 safeBoolForKey:@"_accessibilityIsHostNode"])
    {
      objc_super v6 = [v3 safeArrayForKey:@"_accessibilityNodeChildrenUnsorted"];
      if (_accessibilityNodeIsSingleChildInArray(self, v6))
      {
        uint64_t v7 = [v4 safeArrayForKey:@"_accessibilityNodeChildrenUnsorted"];
        BOOL IsSingleChildInArray = _accessibilityNodeIsSingleChildInArray(v3, v7);
      }
      else
      {
        BOOL IsSingleChildInArray = 0;
      }
    }
    else
    {
      BOOL IsSingleChildInArray = 0;
    }
  }

  return IsSingleChildInArray;
}

- (id)_accessibilityVisualExpansionProxy
{
  MEMORY[0x245665570](@"SwiftUI.AccessibilityLazyLayoutNode", a2);
  if (objc_opt_isKindOfClass())
  {
    int v3 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  v4 = [(AccessibilityNodeAccessibility *)self safeSwiftValueForKey:@"viewRendererHost"];
  v5 = __UIAccessibilityCastAsClass();

  if (v5
    && [(AccessibilityNodeAccessibility *)self safeBoolForKey:@"_accessibilityIsHostNode"])
  {
    id v6 = v5;
LABEL_6:
    int v3 = v6;
    goto LABEL_12;
  }
  if (![v5 safeBoolForKey:@"_accessibilityIsSwiftUIHostingCellView"]
    || ![(AccessibilityNodeAccessibility *)self _accessibilityIsSingleLeafItemInCell])
  {
    int v3 = 0;
    goto LABEL_12;
  }
  int v3 = [v5 _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (!v3)
  {
    id v6 = [v5 _accessibilityAncestorIsKindOf:objc_opt_class()];
    goto LABEL_6;
  }
LABEL_12:

LABEL_13:

  return v3;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AccessibilityNodeAccessibility;
  v4 = [(AccessibilityNodeAccessibility *)&v8 description];
  v5 = [(AccessibilityNodeAccessibility *)self accessibilityLabel];
  id v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  char v20 = 0;
  objc_opt_class();
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  objc_super v10 = __83__AccessibilityNodeAccessibility__accessibilityHitTestShouldFallbackToNearestChild__block_invoke;
  v11 = &unk_26515BA48;
  v12 = self;
  uint64_t v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  v4 = __UIAccessibilityCastAsClass();

  if (v20) {
    abort();
  }
  char v5 = [v4 BOOLValue];

  if (v5) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)AccessibilityNodeAccessibility;
  return [(AccessibilityNodeAccessibility *)&v7 _accessibilityHitTestShouldFallbackToNearestChild];
}

uint64_t __83__AccessibilityNodeAccessibility__accessibilityHitTestShouldFallbackToNearestChild__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXHitTestShouldFallbackToNearestChild"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __83__AccessibilityNodeAccessibility__accessibilityShouldIncludeMediaDescriptionsRotor__block_invoke;
  objc_super v10 = &unk_26515BA48;
  v11 = self;
  v12 = &v13;
  AXPerformSafeBlock();
  id v3 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  char v4 = [v3 BOOLValue];
  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityNodeAccessibility;
  return [(AccessibilityNodeAccessibility *)&v6 _accessibilityShouldIncludeMediaDescriptionsRotor];
}

uint64_t __83__AccessibilityNodeAccessibility__accessibilityShouldIncludeMediaDescriptionsRotor__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXShouldIncludeMediaDescriptionsRotor"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityUseElementAtPositionAfterActivation
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __83__AccessibilityNodeAccessibility__accessibilityUseElementAtPositionAfterActivation__block_invoke;
  objc_super v10 = &unk_26515BA48;
  v11 = self;
  v12 = &v13;
  AXPerformSafeBlock();
  id v3 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  char v4 = [v3 BOOLValue];
  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityNodeAccessibility;
  return [(AccessibilityNodeAccessibility *)&v6 _accessibilityUseElementAtPositionAfterActivation];
}

uint64_t __83__AccessibilityNodeAccessibility__accessibilityUseElementAtPositionAfterActivation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXUseElementAtPositionAfterActivationAttribute"];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityAXAttributedLabel
{
  v16.receiver = self;
  v16.super_class = (Class)AccessibilityNodeAccessibility;
  id v3 = [(AccessibilityNodeAccessibility *)&v16 _accessibilityAXAttributedLabel];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = self;
  AXPerformSafeBlock();
  id v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  if (objc_msgSend(v3, "isAXAttributedString", v8, 3221225472, __65__AccessibilityNodeAccessibility__accessibilityAXAttributedLabel__block_invoke, &unk_26515BA48, v9, &v10)&& objc_msgSend(v4, "length"))
  {
    id v5 = v3;
    objc_msgSend(v5, "addAttribute:forKey:withRange:", v4, *MEMORY[0x263F21700], 0, objc_msgSend(v5, "length"));
  }
  else
  {
    id v6 = v3;
  }

  return v3;
}

uint64_t __65__AccessibilityNodeAccessibility__accessibilityAXAttributedLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXLabelUIAccessibilityTokenBrailleOverride"];

  return MEMORY[0x270F9A758]();
}

- (id)accessibilityMathEquation
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __59__AccessibilityNodeAccessibility_accessibilityMathEquation__block_invoke;
  v11 = &unk_26515BA48;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    id v4 = [(AccessibilityNodeAccessibility *)&v7 accessibilityMathEquation];
  }
  id v5 = v4;

  return v5;
}

uint64_t __59__AccessibilityNodeAccessibility_accessibilityMathEquation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXMathEquation"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityShouldSpeakMathEquationTrait
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __76__AccessibilityNodeAccessibility__accessibilityShouldSpeakMathEquationTrait__block_invoke;
  v11 = &unk_26515BA48;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    unsigned __int8 v4 = [(AccessibilityNodeAccessibility *)&v7 _accessibilityShouldSpeakMathEquationTrait];
  }
  BOOL v5 = v4;

  return v5;
}

uint64_t __76__AccessibilityNodeAccessibility__accessibilityShouldSpeakMathEquationTrait__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXShouldSpeakMathEquationTrait"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityShouldExpandMathEquation
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __72__AccessibilityNodeAccessibility__accessibilityShouldExpandMathEquation__block_invoke;
  v11 = &unk_26515BA48;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    unsigned __int8 v4 = [(AccessibilityNodeAccessibility *)&v7 _accessibilityShouldExpandMathEquation];
  }
  BOOL v5 = v4;

  return v5;
}

uint64_t __72__AccessibilityNodeAccessibility__accessibilityShouldExpandMathEquation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXShouldExpandMathEquation"];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilitySoftwareMimicKeyboard
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __69__AccessibilityNodeAccessibility__accessibilitySoftwareMimicKeyboard__block_invoke;
  v11 = &unk_26515BA48;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3 && [v3 BOOLValue])
  {
    unsigned __int8 v4 = self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    unsigned __int8 v4 = [(AccessibilityNodeAccessibility *)&v7 _accessibilitySoftwareMimicKeyboard];
  }
  BOOL v5 = v4;

  return v5;
}

uint64_t __69__AccessibilityNodeAccessibility__accessibilitySoftwareMimicKeyboard__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXIsSoftwareMimicKeyboardAttribute"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __71__AccessibilityNodeAccessibility__accessibilityIsSoftwareKeyboardMimic__block_invoke;
  v11 = &unk_26515BA48;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    unsigned __int8 v4 = [(AccessibilityNodeAccessibility *)&v7 _accessibilityIsSoftwareKeyboardMimic];
  }
  BOOL v5 = v4;

  return v5;
}

uint64_t __71__AccessibilityNodeAccessibility__accessibilityIsSoftwareKeyboardMimic__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityCustomAttribute:@"AXIsSoftwareMimicKeyboardAttribute"];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly
{
  return 1;
}

- (int64_t)accessibilityElementCount
{
  id v2 = [(AccessibilityNodeAccessibility *)self safeArrayForKey:@"_accessibilityNodeChildrenUnsorted"];
  int64_t v3 = [v2 count];

  return v3;
}

- (BOOL)_accessibilityHasOrderedChildren
{
  return [(AccessibilityNodeAccessibility *)self isAccessibilityElement] ^ 1;
}

- (id)_accessibilityMediaAnalysisElement
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([(AccessibilityNodeAccessibility *)self _accessibilityCanBeConsideredMediaAnalysisElement] & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int64_t v3 = [(AccessibilityNodeAccessibility *)self safeSwiftArrayForKey:@"children", 0];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(AccessibilityNodeAccessibility **)(*((void *)&v11 + 1) + 8 * i);
          if (v8 != self
            && ([*(id *)(*((void *)&v11 + 1) + 8 * i) _accessibilityCanBeConsideredMediaAnalysisElement] & 1) != 0)
          {
            uint64_t v9 = v8;

            goto LABEL_14;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v9 = self;
LABEL_14:

  return v9;
}

- (id)_accessibilityWindow
{
  objc_opt_class();
  int64_t v3 = [(AccessibilityNodeAccessibility *)self safeSwiftValueForKey:@"viewRendererHost"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 window];

  return v5;
}

- (CGRect)accessibilityFrame
{
  int64_t v3 = [(AccessibilityNodeAccessibility *)self _accessibilityVisualExpansionProxy];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)AccessibilityNodeAccessibility;
    [(AccessibilityNodeAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityPath
{
  int64_t v3 = [(AccessibilityNodeAccessibility *)self _accessibilityVisualExpansionProxy];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityPath];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AccessibilityNodeAccessibility;
    uint64_t v5 = [(AccessibilityNodeAccessibility *)&v8 accessibilityPath];
  }
  double v6 = (void *)v5;

  return v6;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AccessibilityNodeAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F81418] & v3) == 0) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(AccessibilityNodeAccessibility *)self safeSwiftArrayForKey:@"children", 0];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(AccessibilityNodeAccessibility **)(*((void *)&v14 + 1) + 8 * i);
        if (v9 != self)
        {
          double v10 = [(AccessibilityNodeAccessibility *)v9 safeValueForKey:@"_accessibilityNodeRepresentedElement"];
          char v11 = [v10 _accessibilityIsMacVisualAppearance];

          if (v11)
          {
            BOOL v12 = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (void)dealloc
{
  [(AccessibilityNodeAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityNodeAccessibility;
  [(AccessibilityNodeAccessibility *)&v3 dealloc];
}

- (BOOL)_accessibilityFKAShouldIncludeViewsAsElements
{
  return 1;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_axAreChildrenFocused
{
  return MEMORY[0x270F0A438](self, &__AccessibilityNodeAccessibility___axAreChildrenFocused);
}

- (void)_axSetAreChildrenFocused:(BOOL)a3
{
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)[(AccessibilityNodeAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
}

uint64_t __76__AccessibilityNodeAccessibility_UIFocusConformance__parentFocusEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26F7FE050];
}

- (NSString)focusGroupIdentifier
{
  v9.receiver = self;
  v9.super_class = (Class)AccessibilityNodeAccessibility;
  objc_super v3 = [(AccessibilityNodeAccessibility *)&v9 focusGroupIdentifier];
  if (v3
    || ([(AccessibilityNodeAccessibility *)self _accessibilityParentView],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 safeValueForKey:@"_containingScrollView"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [(AccessibilityNodeAccessibility *)self _accessibilityDefaultFocusGroupIdentifier];
  }
  uint64_t v7 = v6;

  return (NSString *)v7;
}

- (void)setNeedsFocusUpdate
{
  id v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
  [(AccessibilityNodeAccessibility *)self _updateFocusLayerFrame];
}

- (void)updateFocusIfNeeded
{
  id v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  [v3 updateFocusIfNeeded];
  [(AccessibilityNodeAccessibility *)self _updateFocusLayerFrame];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __103__AccessibilityNodeAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v8[3] = &unk_26515BA90;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  [a4 addCoordinatedAnimations:v8 completion:0];
}

uint64_t __103__AccessibilityNodeAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextFocusedItem];
  id v3 = v2;
  if (v2 != *(void **)(a1 + 40))
  {

LABEL_7:
    id v9 = (void *)MEMORY[0x263F1C648];
    uint64_t v10 = *(void *)(a1 + 40);
    return [v9 removeRingFromFocusItem:v10];
  }
  uint64_t v4 = [v2 _accessibilityParentView];
  int v5 = [v4 _accessibilityIsFKARunningForFocusItem];

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = (void *)MEMORY[0x263F1C648];
  uint64_t v7 = *(void *)(a1 + 40);

  return [v6 moveRingToFocusItem:v7];
}

- (void)_destroyFocusLayer
{
}

- (void)_updateFocusLayerFrame
{
}

- (BOOL)canBecomeFocused
{
  int v3 = [(AccessibilityNodeAccessibility *)self isAccessibilityElement];
  if (v3)
  {
    LOBYTE(v3) = [(AccessibilityNodeAccessibility *)self accessibilityRespondsToUserInteraction];
  }
  return v3;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  id v2 = [(AccessibilityNodeAccessibility *)self _accessibilityParentView];
  int v3 = [v2 _screen];
  uint64_t v4 = [v3 coordinateSpace];

  return v4;
}

- (id)focusItemsInRect:(CGRect)a3
{
  uint64_t v4 = [(AccessibilityNodeAccessibility *)self accessibilityElements];
  if (v4)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__AccessibilityNodeAccessibility_UIFocusConformance__focusItemsInRect___block_invoke;
    v12[3] = &unk_26515BAB8;
    v12[4] = self;
    int v5 = [MEMORY[0x263F08A98] predicateWithBlock:v12];
    id v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else if ([(AccessibilityNodeAccessibility *)self accessibilityElementCount] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[AccessibilityNodeAccessibility accessibilityElementCount](self, "accessibilityElementCount"));
    if ([(AccessibilityNodeAccessibility *)self accessibilityElementCount])
    {
      unint64_t v7 = 0;
      do
      {
        objc_super v8 = [(AccessibilityNodeAccessibility *)self accessibilityElementAtIndex:v7];
        if ([v8 conformsToProtocol:&unk_26F7FE388])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || [(AccessibilityNodeAccessibility *)self _accessibilityFKAShouldIncludeViewsAsElements])
          {
            [v6 axSafelyAddObject:v8];
          }
        }

        ++v7;
      }
      while (v7 < [(AccessibilityNodeAccessibility *)self accessibilityElementCount]);
    }
  }
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;

  return v10;
}

uint64_t __71__AccessibilityNodeAccessibility_UIFocusConformance__focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26F7FE388])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = [*(id *)(a1 + 32) _accessibilityFKAShouldIncludeViewsAsElements];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_prefersFocusContainment
{
  if ([(AccessibilityNodeAccessibility *)self conformsToProtocol:&unk_26F7FF9F0]
    || ([(AccessibilityNodeAccessibility *)self _accessibilityIsTouchContainer] & 1) != 0)
  {
    return 1;
  }

  return [(AccessibilityNodeAccessibility *)self shouldGroupAccessibilityChildren];
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (&unk_26F7FE388 == a3 || &unk_26F7FE050 == a3 || &unk_26F7FE4E8 == a3 || &unk_26F7FE9D8 == a3) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)AccessibilityNodeAccessibility;
  return -[AccessibilityNodeAccessibility conformsToProtocol:](&v7, sel_conformsToProtocol_);
}

- (CGRect)frame
{
  [(AccessibilityNodeAccessibility *)self accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  char v11 = [(AccessibilityNodeAccessibility *)self coordinateSpace];
  BOOL v12 = [(AccessibilityNodeAccessibility *)self _accessibilityWindow];
  double v13 = [v12 coordinateSpace];

  if (v13)
  {
    objc_msgSend(v13, "convertRect:fromCoordinateSpace:", 0, v4, v6, v8, v10);
    objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v13);
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }

  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end