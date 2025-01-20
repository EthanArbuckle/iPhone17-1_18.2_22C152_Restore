@interface InteractiveTimelineCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityCenterCellFromCollectionView:(id)a3;
- (id)_accessibilitySafeCollectionView;
- (void)_accessibilityAdjustTimelineCollectionViewIncrement:(BOOL)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation InteractiveTimelineCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MedicationsHealthAppPlugin.InteractiveTimelineCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilitySafeCollectionView
{
  objc_opt_class();
  v3 = [(InteractiveTimelineCollectionViewControllerAccessibility *)self safeUIViewForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)InteractiveTimelineCollectionViewControllerAccessibility;
  [(InteractiveTimelineCollectionViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  v3 = [(InteractiveTimelineCollectionViewControllerAccessibility *)self _accessibilitySafeCollectionView];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CED8]];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_2651310C8;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [v3 setAccessibilityLabelBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8[3] = &unk_2651310C8;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [v3 setAccessibilityValueBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v6[3] = &unk_2651310F0;
  objc_copyWeak(&v7, &location);
  [v3 _setAccessibilityIncrementBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v4[3] = &unk_2651310F0;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityDecrementBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained _accessibilitySafeCollectionView];
  v4 = [v1 _accessibilityCenterCellFromCollectionView:v3];

  if (v4)
  {
    id v5 = [v4 accessibilityLabel];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained _accessibilitySafeCollectionView];
  v4 = [v1 _accessibilityCenterCellFromCollectionView:v3];

  if (v4)
  {
    id v5 = [v4 accessibilityValue];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityAdjustTimelineCollectionViewIncrement:1];
}

void __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityAdjustTimelineCollectionViewIncrement:0];
}

- (void)_accessibilityAdjustTimelineCollectionViewIncrement:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = [(InteractiveTimelineCollectionViewControllerAccessibility *)self _accessibilitySafeCollectionView];
  id v5 = -[InteractiveTimelineCollectionViewControllerAccessibility _accessibilityCenterCellFromCollectionView:](self, "_accessibilityCenterCellFromCollectionView:");
  if (v5)
  {
    v6 = [v17 indexPathForCell:v5];
    id v7 = (void *)MEMORY[0x263F088C8];
    uint64_t v8 = [v6 item];
    uint64_t v9 = [v6 section];
    if (v3) {
      uint64_t v10 = v8 + 1;
    }
    else {
      uint64_t v10 = v8 - 1;
    }
    id v11 = [v7 indexPathForItem:v10 inSection:v9];
    v12 = [v17 cellForItemAtIndexPath:v11];

    if (v12)
    {
      [v12 center];
      double v14 = v13;
      [v17 bounds];
      double v16 = v14 + v15 * -0.5;
      [v17 contentOffset];
      [v17 setContentOffset:1 animated:v16];
    }
  }
}

- (id)_accessibilityCenterCellFromCollectionView:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 bounds];
  AX_CGRectGetCenter();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(v3, "indexPathsForVisibleItems", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = [v3 cellForItemAtIndexPath:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
      [v13 bounds];
      objc_msgSend(v3, "convertRect:fromView:", v13);
      v22.x = v5;
      v22.y = v7;
      if (CGRectContainsPoint(v23, v22)) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    double v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)InteractiveTimelineCollectionViewControllerAccessibility;
  [(InteractiveTimelineCollectionViewControllerAccessibility *)&v3 viewDidLoad];
  [(InteractiveTimelineCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end