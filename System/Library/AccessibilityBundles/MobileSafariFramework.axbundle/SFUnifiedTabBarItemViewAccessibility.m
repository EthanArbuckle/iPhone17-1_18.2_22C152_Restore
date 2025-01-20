@interface SFUnifiedTabBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axSearchFieldIsActive;
- (SFUnifiedTabBarItemViewAccessibility)initWithFrame:(CGRect)a3;
- (_NSRange)_accessibilityRowRange;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_accessibilityVisibleTextRange;
- (id)_accessibilityResponderElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_axScribbleOverlay;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_accessibilityUpdateWebExtensionLabels;
- (void)setExtensionButtonConfiguration:(id)a3;
- (void)setOverlayConfiguration:(id)a3;
@end

@implementation SFUnifiedTabBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedTabBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_titleContainer" withType:"SFUnifiedTabBarItemTitleContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"searchField", "@", 0);
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_voiceSearchButton" withType:"UIButton"];
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_closeButton" withType:"SFUnifiedTabBarItemViewCloseButton"];
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_accessoryButtonArrangement" withType:"SFUnifiedTabBarItemAccessoryButtonArrangement"];
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_active" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemAccessoryButtonArrangement", @"leadingButtonTypes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemAccessoryButtonArrangement", @"trailingButtonTypes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"_viewForAccessoryButtonOfType:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"showsCloseButton", "B", 0);
  [v3 validateClass:@"SFUnifiedTabBar"];
  [v3 validateClass:@"SFUnifiedTabBarItemView" isKindOfClass:@"SFUnifiedBarItemView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBarItemView", @"item", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBar", @"itemArrangement", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemArrangement", @"items", "@", 0);
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_extensionButtonConfiguration" withType:"SFWebExtensionButtonConfiguration"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFWebExtensionButtonConfiguration", @"buttons", "@", 0);
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_firstExtensionButton" withType:"UIButton"];
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_secondExtensionButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"setExtensionButtonConfiguration:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFWebExtensionButton", @"extension", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSWebExtensionData", @"displayShortName", "@", 0);
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_overlayView" withType:"SFURLFieldOverlayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBarItemView", @"setOverlayConfiguration:", "v", "@", 0);
  [v3 validateClass:@"SFURLFieldOverlayView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
  [v3 validateClass:@"SFURLFieldOverlayView" hasInstanceVariable:@"_secondaryTextLabel" withType:"UILabel"];
  [v3 validateClass:@"SFURLFieldOverlayView" hasInstanceVariable:@"_buttons" withType:"NSArray"];
  [v3 validateClass:@"SFUnifiedTabBarItemView" hasInstanceVariable:@"_hasHiddenElements" withType:"BOOL"];
}

- (BOOL)_axSearchFieldIsActive
{
  v2 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (id)_axScribbleOverlay
{
  v2 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_overlayView"];
  char v3 = v2;
  if (v2 && [v2 _accessibilityViewIsVisible]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  char v3 = [(SFUnifiedTabBarItemViewAccessibility *)self _axScribbleOverlay];
  if (v3)
  {
    objc_opt_class();
    id v4 = [v3 safeValueForKey:@"_textLabel"];
    v5 = __UIAccessibilityCastAsClass();

    v6 = [v5 text];

    char v14 = 0;
    objc_opt_class();
    v7 = [v3 safeValueForKey:@"_secondaryTextLabel"];
    v8 = __UIAccessibilityCastAsClass();

    v9 = [v8 text];

    if (v6) {
      v10 = v6;
    }
    else {
      v10 = v9;
    }
    id v11 = v10;

    goto LABEL_6;
  }
  v13.receiver = self;
  v13.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  id v11 = [(SFUnifiedTabBarItemViewAccessibility *)&v13 accessibilityLabel];
  if (!v11)
  {
    if ([(SFUnifiedTabBarItemViewAccessibility *)self safeBoolForKey:@"_active"])
    {
      v6 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_titleContainer"];
      id v11 = [v6 accessibilityLabel];
LABEL_6:

      goto LABEL_11;
    }
    id v11 = 0;
  }
LABEL_11:

  return v11;
}

- (_NSRange)_accessibilityVisibleTextRange
{
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    char v3 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
    uint64_t v4 = [v3 _accessibilityVisibleTextRange];
    NSUInteger v6 = v5;

    NSUInteger v7 = v4;
    NSUInteger v8 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    NSUInteger v7 = (NSUInteger)[(SFUnifiedTabBarItemViewAccessibility *)&v9 _accessibilityVisibleTextRange];
  }
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    id v6 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
    objc_msgSend(v6, "_accessibilitySetSelectedTextRange:", location, length);
  }
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v7 = a4;
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    id v6 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
    [v6 _accessibilityReplaceCharactersAtCursor:a3 withString:v7];
  }
}

- (unint64_t)accessibilityTraits
{
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    char v3 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
    unint64_t v4 = [v3 accessibilityTraits];

    return v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    unint64_t v6 = [(SFUnifiedTabBarItemViewAccessibility *)&v10 accessibilityTraits];
    id v7 = [(SFUnifiedTabBarItemViewAccessibility *)self _axScribbleOverlay];

    if (v7)
    {
      return *MEMORY[0x263F1CF18];
    }
    else
    {
      int v8 = [(SFUnifiedTabBarItemViewAccessibility *)self safeBoolForKey:@"_active"];
      uint64_t v9 = *MEMORY[0x263F813F8];
      if (v8) {
        uint64_t v9 = 0;
      }
      return v9 | v6;
    }
  }
}

- (_NSRange)_accessibilityRowRange
{
  if ([(SFUnifiedTabBarItemViewAccessibility *)self safeBoolForKey:@"_active"])
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0x7FFFFFFFLL;
  }
  else
  {
    NSUInteger v5 = [(SFUnifiedTabBarItemViewAccessibility *)self safeValueForKey:@"delegate"];
    MEMORY[0x245655C80](@"SFUnifiedTabBar");
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = [v5 safeValueForKey:@"itemArrangement"];
      id v7 = [v6 safeArrayForKey:@"items"];

      int v8 = [(SFUnifiedTabBarItemViewAccessibility *)self safeValueForKey:@"item"];
      uint64_t v9 = [v7 indexOfObject:v8];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v4 = 0;
        uint64_t v3 = 0;
      }
      else
      {
        uint64_t v4 = v9;
        uint64_t v3 = [v7 count];
      }
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v3 = 0;
    }
  }
  NSUInteger v10 = v4;
  NSUInteger v11 = v3;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (id)_accessibilityResponderElement
{
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    uint64_t v3 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    uint64_t v3 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
    uint64_t v4 = [v3 _accessibilitySelectedTextRange];
    NSUInteger v6 = v5;

    NSUInteger v7 = v4;
    NSUInteger v8 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    NSUInteger v7 = (NSUInteger)[(SFUnifiedTabBarItemViewAccessibility *)&v9 _accessibilitySelectedTextRange];
  }
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [(SFUnifiedTabBarItemViewAccessibility *)self _axScribbleOverlay];

  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v4 = self;
    if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      NSUInteger v5 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
      NSUInteger v6 = [v5 _accessibilitySupplementaryHeaderViews];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v6);
            }
            [v3 axSafelyAddObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v7);
      }

      uint64_t v4 = self;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    NSUInteger v10 = [(SFUnifiedTabBarItemViewAccessibility *)v4 safeValueForKey:@"_accessoryButtonArrangement"];
    obuint64_t j = [v10 safeArrayForKey:@"leadingButtonTypes"];

    uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = 0;
          v19 = &v18;
          uint64_t v20 = 0x3032000000;
          v21 = __Block_byref_object_copy__1;
          v22 = __Block_byref_object_dispose__1;
          id v23 = 0;
          AXPerformSafeBlock();
          id v14 = (id)v19[5];
          _Block_object_dispose(&v18, 8);

          [v3 axSafelyAddObject:v14];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v11);
    }
  }

  return v3;
}

uint64_t __78__SFUnifiedTabBarItemViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v21 = self;
  uint64_t v4 = [(SFUnifiedTabBarItemViewAccessibility *)self _axScribbleOverlay];
  uint64_t v20 = v4;
  if (v4)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    NSUInteger v5 = [v4 safeArrayForKey:@"_buttons"];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v37 != v7) {
            objc_enumerationMutation(v5);
          }
          [v3 axSafelyAddObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v6);
    }
  }
  else
  {
    if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      objc_super v9 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"searchField"];
      NSUInteger v10 = [v9 _accessibilitySupplementaryFooterViews];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v10);
            }
            [v3 axSafelyAddObject:*(void *)(*((void *)&v32 + 1) + 8 * j)];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v11);
      }

      self = v21;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = [(SFUnifiedTabBarItemViewAccessibility *)self safeValueForKey:@"_accessoryButtonArrangement"];
    NSUInteger v5 = [v14 safeArrayForKey:@"trailingButtonTypes"];

    uint64_t v15 = [v5 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v5);
          }
          uint64_t v22 = 0;
          id v23 = &v22;
          uint64_t v24 = 0x3032000000;
          long long v25 = __Block_byref_object_copy__1;
          long long v26 = __Block_byref_object_dispose__1;
          id v27 = 0;
          AXPerformSafeBlock();
          id v18 = (id)v23[5];
          _Block_object_dispose(&v22, 8);

          [v3 axSafelyAddObject:v18];
        }
        uint64_t v15 = [v5 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v15);
    }
  }

  return v3;
}

uint64_t __78__SFUnifiedTabBarItemViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));

  return MEMORY[0x270F9A758]();
}

- (void)_accessibilityUpdateWebExtensionLabels
{
  id v3 = [(SFUnifiedTabBarItemViewAccessibility *)self safeValueForKey:@"_extensionButtonConfiguration"];
  id v10 = [v3 safeArrayForKey:@"buttons"];

  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v4 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_secondExtensionButton"];
    NSUInteger v5 = [v10 objectAtIndexedSubscript:1];
    uint64_t v6 = [v5 safeValueForKeyPath:@"extension.displayShortName"];
    [v4 setAccessibilityLabel:v6];
  }
  if ([v10 count])
  {
    uint64_t v7 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_firstExtensionButton"];
    uint64_t v8 = [v10 objectAtIndexedSubscript:0];
    objc_super v9 = [v8 safeValueForKeyPath:@"extension.displayShortName"];
    [v7 setAccessibilityLabel:v9];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v22.receiver = self;
  v22.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  [(SFUnifiedTabBarItemViewAccessibility *)&v22 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilitySafariServicesLocalizedString(@"buttonbar.voicesearch");
  uint64_t v4 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_voiceSearchButton"];
  [v4 setAccessibilityLabel:v3];

  NSUInteger v5 = accessibilitySafariServicesLocalizedString(@"buttonbar.mediaStateMute");
  uint64_t v6 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_mediaStateMuteButton"];
  [v6 setAccessibilityLabel:v5];

  uint64_t v7 = accessibilitySafariServicesLocalizedString(@"buttonbar.moreMenu");
  uint64_t v8 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_moreMenuButtonContainer"];
  [v8 setAccessibilityLabel:v7];

  objc_super v9 = accessibilitySafariServicesLocalizedString(@"buttonbar.reload");
  id v10 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_reloadButton"];
  [v10 setAccessibilityLabel:v9];

  uint64_t v11 = accessibilitySafariServicesLocalizedString(@"buttonbar.stop");
  uint64_t v12 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_stopButton"];
  [v12 setAccessibilityLabel:v11];

  objc_super v13 = accessibilitySafariServicesLocalizedString(@"buttonbar.manageExtensions");
  id v14 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_multipleExtensionsButton"];
  [v14 setAccessibilityLabel:v13];

  objc_initWeak(&location, self);
  uint64_t v15 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_formatMenuButton"];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __82__SFUnifiedTabBarItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v19 = &unk_265135F40;
  objc_copyWeak(&v20, &location);
  [v15 setAccessibilityLabelBlock:&v16];

  [(SFUnifiedTabBarItemViewAccessibility *)self _accessibilityUpdateWebExtensionLabels];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

id __82__SFUnifiedTabBarItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeBoolForKey:@"_hasHiddenElements"];

  if (v2) {
    accessibilitySafariScribbleLocalizedString(@"buttonbar.formatMenu.distractions.hidden");
  }
  else {
  id v3 = accessibilitySafariServicesLocalizedString(@"buttonbar.formatMenu");
  }

  return v3;
}

- (SFUnifiedTabBarItemViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  id v3 = -[SFUnifiedTabBarItemViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SFUnifiedTabBarItemViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(SFUnifiedTabBarItemViewAccessibility *)self _axScribbleOverlay];
  if (v3)
  {
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  if ([(SFUnifiedTabBarItemViewAccessibility *)self _axSearchFieldIsActive])
  {
    objc_super v5 = @"searchField";
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    uint64_t v4 = [(SFUnifiedTabBarItemViewAccessibility *)&v8 accessibilityValue];
    if (v4) {
      goto LABEL_8;
    }
    objc_super v5 = @"_titleContainer";
  }
  uint64_t v6 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:v5];
  uint64_t v4 = [v6 accessibilityValue];

LABEL_8:

  return v4;
}

- (id)accessibilityHint
{
  v6.receiver = self;
  v6.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  id v3 = [(SFUnifiedTabBarItemViewAccessibility *)&v6 accessibilityHint];
  if (!v3)
  {
    uint64_t v4 = [(SFUnifiedTabBarItemViewAccessibility *)self safeUIViewForKey:@"_titleContainer"];
    id v3 = [v4 accessibilityHint];
  }

  return v3;
}

- (void)setExtensionButtonConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  [(SFUnifiedTabBarItemViewAccessibility *)&v4 setExtensionButtonConfiguration:a3];
  [(SFUnifiedTabBarItemViewAccessibility *)self _accessibilityUpdateWebExtensionLabels];
}

- (void)setOverlayConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  [(SFUnifiedTabBarItemViewAccessibility *)&v5 setOverlayConfiguration:a3];
  objc_super v4 = [(SFUnifiedTabBarItemViewAccessibility *)self _axScribbleOverlay];

  if (v4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
  }
}

@end