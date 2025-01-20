@interface SKUICardViewElementCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityFindPlayButton;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axAdornedImageElement;
- (id)_axLockupElements;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUICardViewElementCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUICardViewElementCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axLockupElements
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_opt_class();
  v3 = [(SKUICardViewElementCollectionViewCellAccessibility *)self safeValueForKey:@"allExistingViews"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        NSClassFromString(&cfstr_Skuihorizontal_2.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(&cfstr_Skuihorizontal_3.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(&cfstr_Skuiattributed_0.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSClassFromString(&cfstr_Skuistyledbutt_0.isa);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                NSClassFromString(&cfstr_Skuistacklistc_0.isa);
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }
          }
        }
        objc_msgSend(v5, "addObject:", v11, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_axAdornedImageElement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_opt_class();
  v3 = [(SKUICardViewElementCollectionViewCellAccessibility *)self safeValueForKey:@"allExistingViews"];
  v4 = __UIAccessibilityCastAsClass();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        NSClassFromString(&cfstr_Skuiadornedima.isa);
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)accessibilityLabel
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axLockupElements];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v8), "accessibilityLabel", v16, v17);
        v17 = @"__AXStringForVariablesSentinel";
        uint64_t v6 = __UIAXStringForVariables();

        ++v8;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v16, @"__AXStringForVariablesSentinel");
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (![v6 length])
  {
    objc_opt_class();
    v10 = [(SKUICardViewElementCollectionViewCellAccessibility *)self safeValueForKey:@"allExistingViews"];
    id v11 = __UIAccessibilityCastAsClass();
    uint64_t v12 = MEMORY[0x2455E57F0]();

    uint64_t v6 = (void *)v12;
  }
  if (![v6 length])
  {
    long long v13 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axAdornedImageElement];

    if (v13)
    {
      uint64_t v14 = accessibilitySKUILocalizedString(@"play");

      uint64_t v6 = (void *)v14;
    }
  }

  return v6;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (-[SKUICardViewElementCollectionViewCellAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _accessibilitySupplementaryFooterViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          -[SKUICardViewElementCollectionViewCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          uint64_t v14 = objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
          if ([v14 isAccessibilityElement])
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v16.receiver = self;
    v16.super_class = (Class)SKUICardViewElementCollectionViewCellAccessibility;
    uint64_t v14 = -[SKUICardViewElementCollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v16, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_13:

  return v14;
}

- (id)_accessibilityFindPlayButton
{
  v2 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axAdornedImageElement];
  v3 = [v2 safeValueForKey:@"_reuseView"];
  uint64_t v4 = [v3 safeValueForKey:@"_playButton"];

  if ([v4 _accessibilityViewIsVisible]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)accessibilityActivate
{
  v3 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axAdornedImageElement];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _accessibilityFindPlayButton];
  char v5 = [v4 accessibilityActivate];

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v20 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axLockupElements];
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      uint64_t v18 = v4;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * v6);
        NSClassFromString(&cfstr_Skuistyledbutt_0.isa);
        if (objc_opt_isKindOfClass())
        {
          [v20 addObject:v7];
        }
        else
        {
          uint64_t v8 = [v7 _accessibilitySupplementaryFooterViews];
          uint64_t v9 = [MEMORY[0x263EFF980] array];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
                NSClassFromString(&cfstr_Skuihorizontal_3.isa);
                if (objc_opt_isKindOfClass())
                {
                  NSClassFromString(&cfstr_Skuiimageview.isa);
                  if (objc_opt_isKindOfClass()) {
                    continue;
                  }
                }
                objc_msgSend(v9, "addObject:", v15, v17);
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v12);
          }

          if ([v9 count]) {
            [v20 addObjectsFromArray:v9];
          }

          uint64_t v5 = v17;
          uint64_t v4 = v18;
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }

  return v20;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axAdornedImageElement];

  if (v3)
  {
    uint64_t v4 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _accessibilityFindPlayButton];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUICardViewElementCollectionViewCellAccessibility;
    [(SKUICardViewElementCollectionViewCellAccessibility *)&v11 accessibilityActivationPoint];
  }
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SKUICardViewElementCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SKUICardViewElementCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomActions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(SKUICardViewElementCollectionViewCellAccessibility *)self _axLockupElements];
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
        double v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        NSClassFromString(&cfstr_Skuihorizontal_2.isa);
        if (objc_opt_isKindOfClass())
        {
          double v8 = [v7 accessibilityCustomActions];
          uint64_t v9 = [v8 count];

          if (v9)
          {
            double v10 = [v7 accessibilityCustomActions];
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  double v10 = 0;
LABEL_12:

  return v10;
}

@end