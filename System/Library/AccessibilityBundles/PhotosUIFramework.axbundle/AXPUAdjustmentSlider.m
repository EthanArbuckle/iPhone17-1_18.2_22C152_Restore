@interface AXPUAdjustmentSlider
- (AXPUAdjustmentSlider)initWithAccessibilityContainer:(id)a3;
- (BOOL)_accessibilityOverridesInstructionsHint;
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
- (id)_accessibilityUserTestingElementBaseType;
- (id)_axAdjustmentInfo;
- (id)_axContainerCollectionView;
- (id)_axContainerViewController;
- (id)_axContainingSelectedIndexPath;
- (id)_axDataSource;
- (id)_axSelectedAdjustmentCell;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_axPreviousSelectedIndexPathSection;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustValue:(BOOL)a3;
- (void)_setAXPreviousSelectedIndexPathSection:(int64_t)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation AXPUAdjustmentSlider

- (AXPUAdjustmentSlider)initWithAccessibilityContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXPUAdjustmentSlider;
  v3 = [(AXPUAdjustmentSlider *)&v5 initWithAccessibilityContainer:a3];
  [(AXPUAdjustmentSlider *)v3 _setAXPreviousSelectedIndexPathSection:-1];

  return v3;
}

- (id)_axAdjustmentInfo
{
  [(AXPUAdjustmentSlider *)self _axContainingSelectedIndexPath];
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__AXPUAdjustmentSlider__axAdjustmentInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axDataSource];
  uint64_t v2 = [v5 infoForItemAtIndexPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_axSelectedAdjustmentCell
{
  uint64_t v3 = [(AXPUAdjustmentSlider *)self _axContainerCollectionView];
  id v4 = [(AXPUAdjustmentSlider *)self _axContainingSelectedIndexPath];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v7 = v3;
  id v8 = v4;
  AXPerformSafeBlock();
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __49__AXPUAdjustmentSlider__axSelectedAdjustmentCell__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) cellForItemAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axDataSource
{
  uint64_t v2 = [(AXPUAdjustmentSlider *)self _axContainerViewController];
  uint64_t v3 = [v2 safeValueForKey:@"dataSource"];

  return v3;
}

- (id)_axContainerViewController
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB68];
  uint64_t v3 = [(AXPUAdjustmentSlider *)self accessibilityContainer];
  id v4 = [v2 viewControllerForView:v3];

  return v4;
}

- (id)_axContainerCollectionView
{
  uint64_t v2 = [(AXPUAdjustmentSlider *)self _axContainerViewController];
  objc_opt_class();
  uint64_t v3 = [v2 safeValueForKey:@"collectionView"];
  id v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_axContainingSelectedIndexPath
{
  uint64_t v2 = [(AXPUAdjustmentSlider *)self _axContainerViewController];
  uint64_t v3 = [v2 safeValueForKey:@"selectedIndexPath"];

  return v3;
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AXPUAdjustmentSlider *)self _axContainerCollectionView];
  v6 = [(AXPUAdjustmentSlider *)self _axContainingSelectedIndexPath];
  uint64_t v7 = [v5 numberOfSections];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v6 section];
    if ((v9 & 0x8000000000000000) == 0)
    {
      uint64_t v10 = v9;
      if (v9 < v8)
      {
        [(AXPUAdjustmentSlider *)self _setAXPreviousSelectedIndexPathSection:v9];
        uint64_t v11 = [v6 row];
        if (v3)
        {
          if (v11 < [v5 numberOfItemsInSection:v10] - 1)
          {
            v12 = (void *)MEMORY[0x263F088C8];
            uint64_t v13 = [v6 row] + 1;
LABEL_14:
            v15 = v12;
            goto LABEL_15;
          }
          if (++v10 < (unint64_t)v8)
          {
            v15 = (void *)MEMORY[0x263F088C8];
            uint64_t v13 = 0;
LABEL_15:
            v16 = [v15 indexPathForItem:v13 inSection:v10];
            id v17 = v16;
            if (v16)
            {
              uint64_t v18 = [v16 item];
              if (v18 < [v5 numberOfItemsInSection:v10])
              {
                v19 = [(AXPUAdjustmentSlider *)self _axContainerViewController];
                if ([v19 safeIntegerForKey:@"layoutDirection"]) {
                  uint64_t v20 = 2;
                }
                else {
                  uint64_t v20 = 16;
                }
                [v5 selectItemAtIndexPath:v17 animated:0 scrollPosition:0];
                [v5 scrollToItemAtIndexPath:v17 atScrollPosition:v20 animated:0];
                v22 = v19;
                id v17 = v17;
                id v21 = v19;
                AXPerformSafeBlock();
              }
            }
            goto LABEL_22;
          }
LABEL_21:
          id v17 = 0;
LABEL_22:

          goto LABEL_23;
        }
        if (v11 < 1)
        {
          if (!v10) {
            goto LABEL_21;
          }
          --v10;
          v12 = (void *)MEMORY[0x263F088C8];
          uint64_t v14 = [v5 numberOfItemsInSection:v10];
        }
        else
        {
          v12 = (void *)MEMORY[0x263F088C8];
          uint64_t v14 = [v6 row];
        }
        uint64_t v13 = v14 - 1;
        goto LABEL_14;
      }
    }
  }
LABEL_23:
}

uint64_t __39__AXPUAdjustmentSlider__axAdjustValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _updateSliderForControlAtIndexPath:v3];
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(AXPUAdjustmentSlider *)self _axContainerCollectionView];
  uint64_t v4 = [v3 numberOfSections];
  id v5 = accessibilityPULocalizedString(@"adjustments.slider");
  if (v4 <= 1)
  {
    v6 = [(AXPUAdjustmentSlider *)self _axAdjustmentInfo];
    uint64_t v9 = [v6 safeValueForKey:@"localizedSectionName"];
    uint64_t v7 = __UIAXStringForVariables();

    id v5 = (void *)v7;
  }

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityPULocalizedString(@"adjustments.instructions");
}

- (int64_t)_axPreviousSelectedIndexPathSection
{
  return MEMORY[0x270F09640](self, &__AXPUAdjustmentSlider___axPreviousSelectedIndexPathSection);
}

- (void)_setAXPreviousSelectedIndexPathSection:(int64_t)a3
{
}

- (id)accessibilityValue
{
  uint64_t v3 = [(AXPUAdjustmentSlider *)self _axSelectedAdjustmentCell];
  uint64_t v4 = [(AXPUAdjustmentSlider *)self _axAdjustmentInfo];
  id v5 = [v4 safeStringForKey:@"localizedName"];
  int64_t v6 = [(AXPUAdjustmentSlider *)self _axPreviousSelectedIndexPathSection];
  uint64_t v7 = [(AXPUAdjustmentSlider *)self _axContainingSelectedIndexPath];
  if ([v7 section] == v6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(AXPUAdjustmentSlider *)self _axContainerCollectionView];
    if (objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v7, "section")) < 2)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [v4 safeValueForKey:@"localizedSectionName"];
    }
  }
  if ([v3 safeBoolForKey:@"isEnabled"])
  {
    uint64_t v10 = [v3 accessibilityLabel];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v3 accessibilityValue];
  v12 = [(AXPUAdjustmentSlider *)self _axContainerCollectionView];
  [v12 numberOfSections];
  uint64_t v13 = __UIAXStringForVariables();

  return v13;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(AXPUAdjustmentSlider *)self _axContainerCollectionView];
  uint64_t v4 = [(AXPUAdjustmentSlider *)self accessibilityContainer];
  [v3 frame];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)_accessibilityUserTestingElementBaseType
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 description];
}

- (BOOL)accessibilityActivate
{
  uint64_t v3 = [(AXPUAdjustmentSlider *)self _axSelectedAdjustmentCell];
  v11.receiver = self;
  v11.super_class = (Class)AXPUAdjustmentSlider;
  BOOL v4 = [(AXPUAdjustmentSlider *)&v11 accessibilityActivate];
  if ([v3 safeBoolForKey:@"isEnabled"]) {
    double v5 = @"adjustments.tool.off";
  }
  else {
    double v5 = @"adjustments.tool.on";
  }
  double v6 = accessibilityPULocalizedString(v5);
  double v7 = [MEMORY[0x263F21660] axAttributedStringWithString:v6];
  [v7 setAttribute:&unk_26F4384F8 forKey:*MEMORY[0x263F216D8]];
  double v10 = v7;
  id v8 = v7;
  AXPerformBlockOnMainThread();

  return v4;
}

void __45__AXPUAdjustmentSlider_accessibilityActivate__block_invoke(uint64_t a1)
{
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return 1;
}

@end