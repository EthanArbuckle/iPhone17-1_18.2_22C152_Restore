@interface SKUIHorizontalLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_playAction:(id)a3;
- (BOOL)_styledImageButtonAction:(id)a3;
- (BOOL)_toggleButtonAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isAdvertisementView:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_accessibilityFindPlayButton;
- (id)_accessibilityFindStyledImageButton;
- (id)_accessibilityFindToggleButton;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryFooterViewsIncludePlayButton:(BOOL)a3 includeStyledImageButton:(BOOL)a4;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3;
@end

@implementation SKUIHorizontalLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIHorizontalLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIHorizontalLockupView" hasInstanceVariable:@"_layout" withType:"SKUIHorizontalLockupLayout"];
  [v3 validateClass:@"SKUIHorizontalLockupView" hasInstanceVariable:@"_viewElementViews" withType:"NSMapTable"];
  [v3 validateClass:@"SKUIHorizontalLockupView" hasInstanceVariable:@"_lockupElement" withType:"SKUILockupViewElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalLockupLayout", @"columns", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalLockupColumn", @"childViewElements", "@", 0);
  [v3 validateClass:@"SKUIImageView"];
  [v3 validateClass:@"SKUISectionHeaderView"];
  [v3 validateClass:@"SKUITextBoxView"];
  [v3 validateClass:@"SKUIStyledImageButton"];
  [v3 validateClass:@"SKUIToggleButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalLockupView", @"_previewMediaURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalLockupView", @"_resolvePreviewStateAfterTransitionForFlipView:", "v", "@", 0);
  [v3 validateClass:@"SKUIHorizontalLockupView" hasInstanceVariable:@"_previewState" withType:"NSInteger"];
  [v3 validateClass:@"SKUIHorizontalLockupView" hasInstanceVariable:@"_previewProgressIndicator" withType:"SKUIPreviewProgressIndicator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIHorizontalLockupView", @"_previewFrontView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILockupViewElement", @"isSelectable", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SKUIHorizontalLockupViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isAdvertisementView:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Skuistyledimag_0.isa);
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([v3 conformsToProtocol:&unk_26F4569A0] & 1) != 0;

  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  __int16 v64 = 0;
  v2 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_layout"];
  id v3 = __UIAccessibilitySafeClass();

  BOOL v4 = [v3 safeValueForKey:@"columns"];
  v5 = __UIAccessibilitySafeClass();

  HIBYTE(v64) = 0;
  v6 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_viewElementViews"];
  v43 = __UIAccessibilitySafeClass();

  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v7 = v5;
  uint64_t v40 = [v7 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v40)
  {
    int v8 = 0;
    v9 = 0;
    id obj = v7;
    uint64_t v39 = *(void *)v61;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v61 != v39)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }
        uint64_t v41 = v10;
        __int16 v64 = 0;
        v12 = __UIAccessibilitySafeClass();
        if ((_BYTE)v64
          || (v13 = v12,
              [v12 safeValueForKey:@"childViewElements"],
              v14 = objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v15 = objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              HIBYTE(v64)))
        {
          abort();
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v42 = v15;
        uint64_t v46 = [v42 countByEnumeratingWithState:&v56 objects:v67 count:16];
        if (v46)
        {
          uint64_t v45 = *(void *)v57;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v57 != v45) {
                objc_enumerationMutation(v42);
              }
              v17 = [v43 objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * v16)];
              v47 = v17;
              uint64_t v48 = v16;
              if (shouldIncludeElement(v17))
              {
                v66 = v17;
                uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
LABEL_23:
                id v20 = (id)v18;
                goto LABEL_24;
              }
              NSClassFromString(&cfstr_Skuiadornedima.isa);
              if (objc_opt_isKindOfClass())
              {
                v19 = [v17 safeValueForKey:@"_reuseView"];
                id v20 = [v19 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];

                goto LABEL_24;
              }
              NSClassFromString(&cfstr_Skuisectionhea_0.isa);
              if (objc_opt_isKindOfClass())
              {
                v21 = v17;
                v22 = &__block_literal_global_398;
                goto LABEL_22;
              }
              NSClassFromString(&cfstr_Skuitextboxvie_0.isa);
              if (objc_opt_isKindOfClass())
              {
                v31 = [MEMORY[0x263EFF980] array];
                v54[0] = MEMORY[0x263EF8330];
                v54[1] = 3221225472;
                v54[2] = __59__SKUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_3;
                v54[3] = &unk_2650AB738;
                id v20 = v31;
                id v55 = v20;
                [v17 accessibilityEnumerateContainerElementsUsingBlock:v54];
              }
              else
              {
                NSClassFromString(&cfstr_Skuiattributed_2.isa);
                if (objc_opt_isKindOfClass())
                {
                  v21 = v17;
                  v22 = &__block_literal_global_405;
LABEL_22:
                  uint64_t v18 = [v21 _accessibilityFindSubviewDescendantsPassingTest:v22];
                  goto LABEL_23;
                }
                NSClassFromString(&cfstr_Skuihorizontal_3.isa);
                if (objc_opt_isKindOfClass())
                {
                  v21 = v17;
                  v22 = &__block_literal_global_410;
                  goto LABEL_22;
                }
                id v20 = 0;
              }
LABEL_24:
              int v49 = v8;
              long long v52 = 0u;
              long long v53 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              id v23 = v20;
              uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v65 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v51;
                do
                {
                  uint64_t v27 = 0;
                  v28 = v9;
                  do
                  {
                    if (*(void *)v51 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    v29 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * v27), "accessibilityLabel", v36, v37);
                    v30 = [v29 stringByReplacingOccurrencesOfString:@"•" withString:@","];

                    v36 = v30;
                    v37 = @"__AXStringForVariablesSentinel";
                    v9 = __UIAXStringForVariables();

                    ++v27;
                    v28 = v9;
                  }
                  while (v25 != v27);
                  uint64_t v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v65, 16, v30, @"__AXStringForVariablesSentinel");
                }
                while (v25);
              }

              int v8 = [(SKUIHorizontalLockupViewAccessibility *)self isAdvertisementView:v47] | v49;
              uint64_t v16 = v48 + 1;
            }
            while (v48 + 1 != v46);
            uint64_t v32 = [v42 countByEnumeratingWithState:&v56 objects:v67 count:16];
            uint64_t v46 = v32;
          }
          while (v32);
        }

        uint64_t v10 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (!v40)
      {
        id v7 = obj;

        if (v8)
        {
          v33 = accessibilitySKUILocalizedString(@"Ad");
          uint64_t v34 = __UIAXStringForVariables();

          v9 = (void *)v34;
          goto LABEL_46;
        }
        goto LABEL_47;
      }
    }
  }
  v9 = 0;
  v33 = v7;
LABEL_46:

LABEL_47:

  return v9;
}

uint64_t __59__SKUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

uint64_t __59__SKUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

void __59__SKUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (shouldIncludeElement(v3)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __59__SKUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_4(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

uint64_t __59__SKUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_5(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryHeaderViews];
  v9 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViews];
  if (v8)
  {
    uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

    v9 = (void *)v10;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        -[SKUIHorizontalLockupViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
        v17 = objc_msgSend(v16, "_accessibilityHitTest:withEvent:", v7);
        if ([v17 isAccessibilityElement])
        {

          goto LABEL_13;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)SKUIHorizontalLockupViewAccessibility;
  v17 = -[SKUIHorizontalLockupViewAccessibility _accessibilityHitTest:withEvent:](&v19, sel__accessibilityHitTest_withEvent_, v7, x, y);
LABEL_13:

  return v17;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v35 = [MEMORY[0x263EFF980] array];
  __int16 v46 = 0;
  id v3 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_layout"];
  BOOL v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"columns"];
  v6 = __UIAccessibilitySafeClass();

  HIBYTE(v46) = 0;
  id v7 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_viewElementViews"];
  int v8 = __UIAccessibilitySafeClass();

  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v32)
  {
    v9 = @"_previewMediaURL";
    uint64_t v31 = *(void *)v43;
    uint64_t v10 = @"SKUIImageView";
    uint64_t v34 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(obj);
        }
        __int16 v46 = 0;
        uint64_t v12 = __UIAccessibilitySafeClass();
        if ((_BYTE)v46
          || (uint64_t v13 = v12,
              [v12 safeValueForKey:@"childViewElements"],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v15 = objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              HIBYTE(v46)))
        {
          abort();
        }
        uint64_t v33 = v11;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v37 = v15;
        uint64_t v16 = [v37 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v39;
          uint64_t v36 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v37);
              }
              long long v20 = [v8 objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * i)];
              long long v21 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:v9];
              NSClassFromString(&v10->isa);
              if ((objc_opt_isKindOfClass() & 1) != 0 && v21)
              {
                [v35 addObject:v20];
                [v20 setIsAccessibilityElement:1];
                long long v22 = v10;
                long long v23 = v9;
                uint64_t v24 = NSString;
                uint64_t v25 = accessibilitySKUILocalizedString(@"preview.button");
                [(SKUIHorizontalLockupViewAccessibility *)self accessibilityLabel];
                v27 = uint64_t v26 = self;
                v28 = objc_msgSend(v24, "stringWithFormat:", v25, v27);
                [v20 setAccessibilityLabel:v28];

                v9 = v23;
                uint64_t v10 = v22;

                self = v26;
                int v8 = v34;
                uint64_t v18 = v36;
              }
            }
            uint64_t v17 = [v37 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v17);
        }

        uint64_t v11 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v32);
  }

  return v35;
}

- (CGRect)accessibilityFrame
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(SKUIHorizontalLockupViewAccessibility *)self bounds];
  double v4 = v3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v9) bounds];
        double v4 = v4 - v10;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  UIAccessibilityFrameForBounds();
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)_accessibilitySupplementaryFooterViewsIncludePlayButton:(BOOL)a3 includeStyledImageButton:(BOOL)a4
{
  BOOL v34 = a4;
  BOOL v4 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  __int16 v44 = 0;
  uint64_t v7 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_layout"];
  uint64_t v8 = __UIAccessibilitySafeClass();

  uint64_t v9 = [v8 safeValueForKey:@"columns"];
  double v10 = __UIAccessibilitySafeClass();

  double v11 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_viewElementViews"];
  double v12 = __UIAccessibilitySafeClass();

  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v10;
  uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        __int16 v44 = 0;
        double v14 = __UIAccessibilitySafeClass();
        if ((_BYTE)v44
          || (long long v15 = v14,
              [v14 safeValueForKey:@"childViewElements"],
              long long v16 = objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              long long v17 = objc_claimAutoreleasedReturnValue(),
              v16,
              v15,
              HIBYTE(v44)))
        {
          abort();
        }
        uint64_t v33 = v13;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v35 = v17;
        uint64_t v18 = [v35 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(v35);
              }
              long long v22 = [v12 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
              if ([v22 isAccessibilityElement]
                && (NSClassFromString(&cfstr_Skuistyledimag_0.isa), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if ([v22 _accessibilityViewIsVisible])
                {
                  if (![(SKUIHorizontalLockupViewAccessibility *)self isAdvertisementView:v22]
                    || (int v23 = _AXSAutomationEnabled(), v24 = @"Ad", !v23))
                  {
                    uint64_t v24 = @"StyledImageButton";
                  }
                  [v22 setAccessibilityIdentifier:v24];
                  if (v34) {
LABEL_27:
                  }
                    [v6 axSafelyAddObject:v22];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && ([v22 isAccessibilityElement] & 1) != 0
                  || (NSClassFromString(&cfstr_Skuiofferview.isa), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  [v6 addObject:v22];
                }
                else
                {
                  NSClassFromString(&cfstr_Skuivideothumb_0.isa);
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && [v22 _accessibilityViewIsVisible])
                  {
                    goto LABEL_27;
                  }
                }
              }
              NSClassFromString(&cfstr_Skuitogglebutt_0.isa);
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v22 _accessibilityViewIsVisible]) {
                [v6 axSafelyAddObject:v22];
              }
              if (v4)
              {
                NSClassFromString(&cfstr_Skuiplaybutton_0.isa);
                if (objc_opt_isKindOfClass())
                {
                  if ([v22 _accessibilityViewIsVisible])
                  {
                    [v22 setAccessibilityIdentifier:@"PlayButton"];
                    [v6 axSafelyAddObject:v22];
                  }
                }
                else
                {
                  NSClassFromString(&cfstr_Skuiadornedima.isa);
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v25 = self;
                    uint64_t v26 = [v22 safeValueForKey:@"_reuseView"];
                    uint64_t v27 = [v26 safeValueForKey:@"_playButton"];

                    if ([v27 _accessibilityViewIsVisible])
                    {
                      [v27 setAccessibilityIdentifier:@"PlayButtonImage"];
                      [v6 axSafelyAddObject:v27];
                    }

                    self = v25;
                  }
                }
              }
            }
            uint64_t v19 = [v35 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v19);
        }

        uint64_t v13 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v32);
  }

  if ([(SKUIHorizontalLockupViewAccessibility *)self safeIntegerForKey:@"_previewState"] == 2)
  {
    v28 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_previewProgressIndicator"];
    if (v28) {
      [v6 axSafelyAddObject:v28];
    }
  }

  return v6;
}

- (id)accessibilityElements
{
  if ([(SKUIHorizontalLockupViewAccessibility *)self isAccessibilityElement])
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViewsIncludePlayButton:0 includeStyledImageButton:1];
  }

  return v3;
}

- (id)_accessibilityFindPlayButton
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViewsIncludePlayButton:1 includeStyledImageButton:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "accessibilityIdentifier", (void)v13);
        if ([v8 isEqualToString:@"PlayButton"])
        {

LABEL_13:
          id v11 = v7;
          goto LABEL_14;
        }
        uint64_t v9 = [v7 accessibilityIdentifier];
        char v10 = [v9 isEqualToString:@"PlayButtonImage"];

        if (v10) {
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v11 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)_accessibilityFindStyledImageButton
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViewsIncludePlayButton:0 includeStyledImageButton:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "accessibilityIdentifier", (void)v12);
        char v9 = [v8 isEqualToString:@"StyledImageButton"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)_accessibilityFindToggleButton
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViewsIncludePlayButton:0 includeStyledImageButton:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        NSClassFromString(&cfstr_Skuitogglebutt_0.isa);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)_toggleButtonAction:(id)a3
{
  uint64_t v3 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindToggleButton];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityLabel];
    uint64_t v10 = MEMORY[0x263EF8330];
    id v11 = v4;
    AXPerformSafeBlock();
    uint64_t v6 = NSString;
    uint64_t v7 = accessibilitySKUILocalizedString(@"activated.toggle");
    id v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5, v10, 3221225472, __61__SKUIHorizontalLockupViewAccessibility__toggleButtonAction___block_invoke, &unk_2650AB650);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v8);
  }

  return v4 != 0;
}

uint64_t __61__SKUIHorizontalLockupViewAccessibility__toggleButtonAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityActivate];
}

- (BOOL)_styledImageButtonAction:(id)a3
{
  uint64_t v3 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindStyledImageButton];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 accessibilityActivate];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_playAction:(id)a3
{
  uint64_t v3 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindPlayButton];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 accessibilityActivate];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)accessibilityCustomActions
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindPlayButton];
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 accessibilityLabel];
    if (!v6)
    {
      uint64_t v6 = accessibilitySKUILocalizedString(@"play.button");
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v6 target:self selector:sel__playAction_];
    [v3 axSafelyAddObject:v7];
  }
  id v8 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindStyledImageButton];
  char v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 accessibilityLabel];
    if (!v10)
    {
      uint64_t v10 = accessibilitySKUILocalizedString(@"more.button");
    }
    if ([(SKUIHorizontalLockupViewAccessibility *)self isAdvertisementView:v9])
    {
      uint64_t v11 = accessibilitySKUILocalizedString(@"about.Ad");

      uint64_t v10 = (void *)v11;
    }
    long long v12 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v10 target:self selector:sel__styledImageButtonAction_];
    [v3 axSafelyAddObject:v12];
  }
  long long v13 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindToggleButton];
  long long v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 accessibilityLabel];
    long long v16 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v15 target:self selector:sel__toggleButtonAction_];
    [v3 axSafelyAddObject:v16];
  }

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(SKUIHorizontalLockupViewAccessibility *)self isAccessibilityElement]
    && ([(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindPlayButton],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v4 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViewsIncludePlayButton:0 includeStyledImageButton:_AXSAutomationEnabled() != 0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)automationElements
{
  return [(SKUIHorizontalLockupViewAccessibility *)self _accessibilitySupplementaryFooterViewsIncludePlayButton:1 includeStyledImageButton:1];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v14 = 0;
  v10.receiver = self;
  v10.super_class = (Class)SKUIHorizontalLockupViewAccessibility;
  id v14 = [(SKUIHorizontalLockupViewAccessibility *)&v10 accessibilityTraits];
  uint64_t v3 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_lockupElement"];
  int v4 = [v3 safeBoolForKey:@"isSelectable"];

  if (v4)
  {
    char v5 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindStyledImageButton];

    if (!v5) {
      v12[3] |= *MEMORY[0x263F1CEE8];
    }
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SKUIHorizontalLockupViewAccessibility_accessibilityTraits__block_invoke;
  v9[3] = &unk_2650AB760;
  v9[4] = &v11;
  id v6 = (id)[(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindSubviewDescendant:v9];
  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __60__SKUIHorizontalLockupViewAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Skuiimageview.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 accessibilityIdentifier],
        int v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"UIPreferencesBlueCheck"],
        v4,
        v5))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= *MEMORY[0x263F1CF38];
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)accessibilityValue
{
  id v2 = [(SKUIHorizontalLockupViewAccessibility *)self _accessibilityFindPlayButton];
  id v3 = [v2 safeValueForKey:@"_indeterminate"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    int v5 = accessibilitySKUILocalizedString(@"indeterminate.playback");
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIHorizontalLockupViewAccessibility;
  [(SKUIHorizontalLockupViewAccessibility *)&v9 _resolvePreviewStateAfterTransitionForFlipView:a3];
  uint64_t v4 = [(SKUIHorizontalLockupViewAccessibility *)self safeIntegerForKey:@"_previewState"];
  if (v4)
  {
    if (v4 == 2)
    {
      uint64_t v5 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_previewProgressIndicator"];
      uint64_t v6 = (void *)currentProgressIndicator;
      currentProgressIndicator = v5;

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)currentProgressIndicator);
    }
  }
  else
  {
    if ([(id)currentProgressIndicator accessibilityElementIsFocused])
    {
      unint64_t v7 = [(SKUIHorizontalLockupViewAccessibility *)self safeValueForKey:@"_previewFrontView"];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v7);
    }
    id v8 = (void *)currentProgressIndicator;
    currentProgressIndicator = 0;
  }
}

@end