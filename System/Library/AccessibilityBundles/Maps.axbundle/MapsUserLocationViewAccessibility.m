@interface MapsUserLocationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsShowingVLFCallout;
- (BOOL)_axIsShowingVLFUI;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axPuck;
- (id)_axVLFElements;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)vlfPuckModeCircleView;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotatePuck;
- (void)_axVLFElements;
@end

@implementation MapsUserLocationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsUserLocationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MapsUserLocationView" isKindOfClass:@"MKAnnotationView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsUserLocationView", @"isVLFBannerVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsUserLocationView", @"vlfPuckModeCircleView", "@", 0);
  [v3 validateClass:@"MapsUserLocationView" hasInstanceVariable:@"_vlfPuckModeCircleView" withType:"VLFPuckModeCircleView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsUserLocationView", @"isVLFPuckVisible", "B", 0);
  [v3 validateClass:@"VLFPuckModeCircleView" isKindOfClass:@"UIView"];
}

- (void)_axAnnotatePuck
{
  id v3 = [(MapsUserLocationViewAccessibility *)self _axPuck];
  [v3 setIsAccessibilityElement:1];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke;
  v6[3] = &unk_26512D610;
  objc_copyWeak(&v7, &location);
  [v3 _setAccessibilityLabelBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke_2;
  v4[3] = &unk_26512D728;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityTraitsBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained accessibilityLabel];

  return v2;
}

uint64_t __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained accessibilityTraits];

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MapsUserLocationViewAccessibility;
  [(MapsUserLocationViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MapsUserLocationViewAccessibility *)self _axAnnotatePuck];
}

- (id)_axPuck
{
  return (id)[(MapsUserLocationViewAccessibility *)self safeValueForKey:@"_vlfPuckModeCircleView"];
}

- (BOOL)_axIsShowingVLFCallout
{
  return [(MapsUserLocationViewAccessibility *)self safeBoolForKey:@"isVLFBannerVisible"];
}

- (BOOL)_axIsShowingVLFUI
{
  return [(MapsUserLocationViewAccessibility *)self safeBoolForKey:@"isVLFPuckVisible"];
}

- (BOOL)isAccessibilityElement
{
  if ([(MapsUserLocationViewAccessibility *)self _axIsShowingVLFCallout]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationViewAccessibility;
  return [(MapsUserLocationViewAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  if ([(MapsUserLocationViewAccessibility *)self _axIsShowingVLFUI])
  {
    objc_super v3 = AXMapsLocString(@"REFINE_MY_LOCATION");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationViewAccessibility;
    objc_super v3 = [(MapsUserLocationViewAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(MapsUserLocationViewAccessibility *)self _axIsShowingVLFUI])
  {
    objc_super v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationViewAccessibility;
    objc_super v3 = [(MapsUserLocationViewAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MapsUserLocationViewAccessibility;
  unint64_t v3 = [(MapsUserLocationViewAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(MapsUserLocationViewAccessibility *)self _axIsShowingVLFUI];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)_axVLFElements
{
  v11[2] = *MEMORY[0x263EF8340];
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  BOOL v4 = [v3 _calloutView];

  if (!v4)
  {
    uint64_t v5 = AXLogAppAccessibility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[MapsUserLocationViewAccessibility _axVLFElements](v5);
    }
  }
  uint64_t v6 = [(MapsUserLocationViewAccessibility *)self _axPuck];
  objc_super v7 = (void *)v6;
  if (v6)
  {
    if (v4)
    {
      v11[0] = v6;
      v11[1] = v4;
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
      goto LABEL_12;
    }
  }
  else
  {
    v9 = AXLogAppAccessibility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[MapsUserLocationViewAccessibility _axVLFElements](v9);
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)accessibilityElements
{
  if (![(MapsUserLocationViewAccessibility *)self _axIsShowingVLFCallout]
    || ([(MapsUserLocationViewAccessibility *)self _axVLFElements],
        (unint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationViewAccessibility;
    unint64_t v3 = [(MapsUserLocationViewAccessibility *)&v5 accessibilityElements];
  }

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if ([(MapsUserLocationViewAccessibility *)self _axIsShowingVLFCallout])
  {
    v8 = [(MapsUserLocationViewAccessibility *)self _axVLFElements];
    if (v8)
    {
      char v24 = 0;
      objc_opt_class();
      v9 = __UIAccessibilityCastAsClass();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            objc_msgSend(v15, "convertPoint:fromView:", v9, x, y);
            uint64_t v16 = objc_msgSend(v15, "_accessibilityHitTest:withEvent:", v7);
            if (v16)
            {
              v17 = (void *)v16;

              goto LABEL_14;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)MapsUserLocationViewAccessibility;
  v17 = -[MapsUserLocationViewAccessibility _accessibilityHitTest:withEvent:](&v19, sel__accessibilityHitTest_withEvent_, v7, x, y);
LABEL_14:

  return v17;
}

- (id)vlfPuckModeCircleView
{
  v5.receiver = self;
  v5.super_class = (Class)MapsUserLocationViewAccessibility;
  unint64_t v3 = [(MapsUserLocationViewAccessibility *)&v5 vlfPuckModeCircleView];
  [(MapsUserLocationViewAccessibility *)self _axAnnotatePuck];

  return v3;
}

- (void)_axVLFElements
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24223A000, log, OS_LOG_TYPE_FAULT, "VLF callout was supposed to be visible, but could not find callout.", v1, 2u);
}

@end