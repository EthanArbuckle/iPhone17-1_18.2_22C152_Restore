@interface SKUIVerticalLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_playAction:(id)a3;
- (BOOL)hasOnlyStringViews;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityFindPlayButton;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryFooterViewsForThisCell:(BOOL)a3 includeText:(BOOL)a4;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIVerticalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIVerticalLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIViewReuseCollectionViewCell", @"allExistingViews", "@", 0);
  [v3 validateClass:@"SKUIVerticalLockupCollectionViewCell" hasInstanceVariable:@"_lockupView" withType:"SKUIVerticalLockupView"];
  [v3 validateClass:@"SKUIVerticalLockupCollectionViewCell" isKindOfClass:@"SKUICollectionViewCell"];
  [v3 validateClass:@"SKUIImageView"];
  [v3 validateClass:@"SKUIAdornedImageView" hasInstanceVariable:@"_reuseView" withType:"SKUIAdornedImageViewReuseView"];
  [v3 validateClass:@"SKUIAdornedImageViewReuseView" hasInstanceVariable:@"_playButton" withType:"SKUIPlayButton"];
}

- (BOOL)isAccessibilityElement
{
  return ![(SKUIVerticalLockupCollectionViewCellAccessibility *)self hasOnlyStringViews];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)hasOnlyStringViews
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"_lockupView"];
  id v3 = __UIAccessibilitySafeClass();

  char v17 = 0;
  v4 = [v3 safeValueForKey:@"subviews"];
  v5 = __UIAccessibilitySafeClass();

  NSClassFromString(&cfstr_Skuiattributed_0.isa);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (id)accessibilityCustomActions
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilityFindPlayButton];
  v4 = v3;
  if (v3 && ([v3 accessibilityLabel], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v5 target:self selector:sel__playAction_];
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_accessibilityFindPlayButton
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilitySupplementaryFooterViewsForThisCell:1 includeText:0];
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
        uint64_t v8 = objc_msgSend(v7, "accessibilityIdentification", (void)v12);
        char v9 = [v8 isEqualToString:@"PlayButton"];

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

- (BOOL)_playAction:(id)a3
{
  uint64_t v3 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilityFindPlayButton];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 accessibilityActivate];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"_lockupView"];
  uint64_t v3 = __UIAccessibilitySafeClass();

  char v29 = 0;
  uint64_t v4 = [v3 safeValueForKey:@"subviews"];
  char v5 = __UIAccessibilitySafeClass();

  v23 = v3;
  NSClassFromString(&cfstr_Skuiimageview.isa);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v7)
  {
    char v9 = 0;
    v24 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  v24 = 0;
  uint64_t v10 = *(void *)v26;
  unint64_t v11 = 0x263F1C000uLL;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
      {
        objc_msgSend(v13, "accessibilityLabel", v21, v22);
        char v9 = v14 = v9;
LABEL_9:

        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && [v13 _accessibilityViewIsVisible])
      {
        long long v14 = [v13 accessibilityLabel];
        v21 = v14;
        v22 = @"__AXStringForVariablesSentinel";
        __UIAXStringForVariables();
        v16 = unint64_t v15 = v11;

        v24 = (void *)v16;
        unint64_t v11 = v15;
        goto LABEL_9;
      }
LABEL_10:
      ++v12;
    }
    while (v8 != v12);
    uint64_t v17 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    uint64_t v8 = v17;
  }
  while (v17);
LABEL_18:

  v18 = v24;
  if (![v24 length])
  {
    id v19 = v9;

    v18 = v19;
  }

  return v18;
}

- (id)accessibilityValue
{
  id v2 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilityFindPlayButton];
  uint64_t v3 = [v2 safeValueForKey:@"_indeterminate"];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    char v5 = accessibilitySKUILocalizedString(@"indeterminate.playback");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViewsForThisCell:(BOOL)a3 includeText:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"_lockupView"];
    char v9 = __UIAccessibilitySafeClass();

    char v29 = v9;
    v30 = self;
    char v36 = 0;
    uint64_t v10 = [v9 safeValueForKey:@"subviews"];
    unint64_t v11 = __UIAccessibilitySafeClass();

    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v15 = 0x263F1C000uLL;
      uint64_t v16 = @"SKUIAttributedStringView";
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        uint64_t v31 = v14;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v12);
          }
          id v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v7 axSafelyAddObject:v19];
          }
          if (v4)
          {
            NSClassFromString(&v16->isa);
            if (objc_opt_isKindOfClass()) {
              [v7 axSafelyAddObject:v19];
            }
          }
          if (v5)
          {
            NSClassFromString(&cfstr_Skuiadornedima.isa);
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = v17;
              BOOL v21 = v5;
              BOOL v22 = v4;
              unint64_t v23 = v15;
              id v24 = v12;
              long long v25 = v16;
              long long v26 = [v19 safeValueForKey:@"_reuseView"];
              long long v27 = [v26 safeValueForKey:@"_playButton"];

              if ([v27 _accessibilityViewIsVisible])
              {
                [v27 accessibilitySetIdentification:@"PlayButton"];
                [v7 axSafelyAddObject:v27];
              }

              uint64_t v16 = v25;
              id v12 = v24;
              unint64_t v15 = v23;
              BOOL v4 = v22;
              BOOL v5 = v21;
              uint64_t v17 = v20;
              uint64_t v14 = v31;
            }
          }
          ++v18;
        }
        while (v14 != v18);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v14);
    }

    [(SKUIVerticalLockupCollectionViewCellAccessibility *)v30 _accessibilitySetRetainedValue:v7 forKey:*MEMORY[0x263F81490]];
  }

  return v7;
}

- (id)accessibilityElements
{
  if ([(SKUIVerticalLockupCollectionViewCellAccessibility *)self isAccessibilityElement])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilitySupplementaryFooterViewsForThisCell:0 includeText:1];
  }

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(SKUIVerticalLockupCollectionViewCellAccessibility *)self isAccessibilityElement]
    && ([(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilityFindPlayButton], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    BOOL v4 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilitySupplementaryFooterViewsForThisCell:0 includeText:0];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)automationElements
{
  return [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilitySupplementaryFooterViewsForThisCell:1 includeText:1];
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3 = [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilityFindPlayButton];
  if (v3)
  {
    [(SKUIVerticalLockupCollectionViewCellAccessibility *)self accessibilityFrame];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIVerticalLockupCollectionViewCellAccessibility;
    [(SKUIVerticalLockupCollectionViewCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (_AXSAutomationEnabled())
  {
    [(SKUIVerticalLockupCollectionViewCellAccessibility *)self _accessibilitySupplementaryFooterViewsForThisCell:1 includeText:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          -[SKUIVerticalLockupCollectionViewCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          uint64_t v14 = objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
          if ([v14 isAccessibilityElement])
          {
            unint64_t v15 = [v14 accessibilityIdentification];
            char v16 = [v15 isEqualToString:@"PlayButton"];

            if (v16)
            {
              uint64_t v17 = [v14 accessibilityLabel];
              [v14 setAccessibilityIdentifier:v17];

              goto LABEL_14;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIVerticalLockupCollectionViewCellAccessibility;
  uint64_t v14 = -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v19, sel__accessibilityHitTest_withEvent_, v7, x, y);
LABEL_14:

  return v14;
}

@end