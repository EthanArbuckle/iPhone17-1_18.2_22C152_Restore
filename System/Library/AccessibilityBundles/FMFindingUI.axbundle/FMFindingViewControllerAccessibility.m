@interface FMFindingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLabelForModernItemViewWithMode:(unsigned int)a3;
- (id)_accessibilityValueForModernItemViewWithMode:(unsigned int)a3;
- (id)_axCachedAccessibilityElements;
- (id)_axCachedAggregateHeaderElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLoadHeaderElement;
- (void)_axSetCachedAccessibilityElements:(id)a3;
- (void)_axSetCachedAggregateHeaderElement:(id)a3;
- (void)accessibilityDidUpdateWithTopLabelMessage:(id)a3 instruction:(id)a4;
- (void)accessibilityDistanceAndDirectionUpdated;
- (void)accessibilityShowViewHandler;
- (void)viewDidLoad;
@end

@implementation FMFindingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FMFindingUI.FMFindingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCachedAccessibilityElements
{
}

- (void)_axSetCachedAccessibilityElements:(id)a3
{
}

- (id)_axCachedAggregateHeaderElement
{
}

- (void)_axSetCachedAggregateHeaderElement:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FMFindingUI.FMFindingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"foundPlayerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityR1DistanceView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityModeRawValue", "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityDistanceAndDirectionUpdated", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityDidUpdateWithTopLabelMessage:instruction:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMFindingViewController", @"accessibilityShowViewHandler", "v", 0);
}

- (void)_axLoadHeaderElement
{
  id v3 = [(FMFindingViewControllerAccessibility *)self _axCachedAggregateHeaderElement];

  if (!v3)
  {
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    v5 = [v4 view];

    v6 = [(FMFindingViewControllerAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
    v7 = [(FMFindingViewControllerAccessibility *)self safeValueForKey:@"accessibilityNameLabel"];
    id v8 = objc_alloc(MEMORY[0x263F81178]);
    v9 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v6, v7);
    v10 = (void *)[v8 initWithAccessibilityContainer:v5 representedElements:v9];

    [v10 _setAccessibilityServesAsFirstElement:1];
    [v10 _setAccessibilityTraitsBlock:&__block_literal_global_0];
    [(FMFindingViewControllerAccessibility *)self _axSetCachedAggregateHeaderElement:v10];
  }
}

uint64_t __60__FMFindingViewControllerAccessibility__axLoadHeaderElement__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)FMFindingViewControllerAccessibility;
  [(FMFindingViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  [(FMFindingViewControllerAccessibility *)self _axLoadHeaderElement];
  objc_initWeak(&location, self);
  char v7 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__FMFindingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_26511F8C8;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityElementsBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __82__FMFindingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained _axCachedAccessibilityElements];

  if (!v3)
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    v5 = [v4 view];

    if (v5)
    {
      id v6 = [WeakRetained _axCachedAggregateHeaderElement];
      char v7 = [v5 subviews];
      id v8 = (void *)[v7 mutableCopy];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      objc_super v9 = [v6 representedElements];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v9);
            }
            [v8 removeObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v10);
      }

      [v8 axSafelyAddObject:v6];
      v13 = [WeakRetained safeUIViewForKey:@"foundPlayerView"];
      objc_initWeak(&location, v13);

      id v14 = objc_loadWeakRetained(&location);
      char v15 = [v14 _accessibilityViewIsVisible];

      if ((v15 & 1) == 0)
      {
        v16 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v5];
        id v17 = objc_loadWeakRetained(&location);
        [v17 accessibilityFrame];
        objc_msgSend(v16, "setAccessibilityFrame:");

        uint64_t v18 = [WeakRetained safeUnsignedIntForKey:@"accessibilityModeRawValue"];
        id v19 = objc_loadWeakRetained(v1);
        v20 = [v19 _accessibilityLabelForModernItemViewWithMode:v18];
        [v16 setAccessibilityLabel:v20];

        id v21 = objc_loadWeakRetained(v1);
        v22 = [v21 _accessibilityValueForModernItemViewWithMode:v18];
        [v16 setAccessibilityValue:v22];

        [v8 axSafelyAddObject:v16];
      }
      [v8 axFilterObjectsUsingBlock:&__block_literal_global_312];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v23);
            }
            objc_msgSend(v8, "removeObject:", *(void *)(*((void *)&v30 + 1) + 8 * j), (void)v30);
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v24);
      }

      v27 = [v8 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
      [WeakRetained _axSetCachedAccessibilityElements:v27];

      objc_destroyWeak(&location);
    }
  }
  v28 = objc_msgSend(WeakRetained, "_axCachedAccessibilityElements", (void)v30);

  return v28;
}

uint64_t __82__FMFindingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _accessibilityViewIsVisible] ^ 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FMFindingViewControllerAccessibility;
  [(FMFindingViewControllerAccessibility *)&v3 viewDidLoad];
  [(FMFindingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)accessibilityShowViewHandler
{
  v3.receiver = self;
  v3.super_class = (Class)FMFindingViewControllerAccessibility;
  [(FMFindingViewControllerAccessibility *)&v3 accessibilityShowViewHandler];
  [(FMFindingViewControllerAccessibility *)self _axSetCachedAccessibilityElements:0];
}

- (void)accessibilityDidUpdateWithTopLabelMessage:(id)a3 instruction:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FMFindingViewControllerAccessibility;
  id v5 = a4;
  [(FMFindingViewControllerAccessibility *)&v6 accessibilityDidUpdateWithTopLabelMessage:a3 instruction:v5];
  UIAccessibilitySpeakIfNotSpeaking();
}

- (void)accessibilityDistanceAndDirectionUpdated
{
  v6.receiver = self;
  v6.super_class = (Class)FMFindingViewControllerAccessibility;
  [(FMFindingViewControllerAccessibility *)&v6 accessibilityDistanceAndDirectionUpdated];
  objc_super v3 = [(FMFindingViewControllerAccessibility *)self safeValueForKey:@"accessibilityR1DistanceView"];
  v4 = [v3 accessibilityLabel];
  id v5 = v4;
  if (v4
    && [v4 length]
    && ([(id)accessibilityDistanceAndDirectionUpdated_previousDistance isEqualToString:v5] & 1) == 0)
  {
    UIAccessibilitySpeakIfNotSpeaking();
    objc_storeStrong((id *)&accessibilityDistanceAndDirectionUpdated_previousDistance, v5);
  }
}

- (id)_accessibilityLabelForModernItemViewWithMode:(unsigned int)a3
{
  unsigned int v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    id v5 = accessibilityLocalizedString(off_26511F8E8[v4]);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_accessibilityValueForModernItemViewWithMode:(unsigned int)a3
{
  if (a3 == 4)
  {
    unsigned int v4 = @"item.in.field.of.vision.mode";
LABEL_5:
    id v5 = accessibilityLocalizedString(v4);
    return v5;
  }
  if (a3 == 2)
  {
    unsigned int v4 = @"item.out.field.of.vision.mode";
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

@end