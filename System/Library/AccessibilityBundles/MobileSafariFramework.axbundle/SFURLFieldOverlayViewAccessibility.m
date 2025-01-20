@interface SFURLFieldOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFURLFieldOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFURLFieldOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SFURLFieldOverlayViewAccessibility;
  [(SFURLFieldOverlayViewAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = [(SFURLFieldOverlayViewAccessibility *)self safeArrayForKey:@"_buttons"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        LOBYTE(location) = 0;
        objc_opt_class();
        v7 = __UIAccessibilityCastAsClass();
        if ((_BYTE)location) {
          abort();
        }
        v8 = v7;
        objc_initWeak(&location, v7);
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __80__SFURLFieldOverlayViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v10[3] = &unk_265135D58;
        objc_copyWeak(&v11, &location);
        [v8 setAccessibilityTraitsBlock:v10];
        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v3);
  }
}

uint64_t __80__SFURLFieldOverlayViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained configuration];
  uint64_t v4 = [v3 baseBackgroundColor];
  [v4 alphaComponent];
  double v6 = v5;

  uint64_t v7 = *MEMORY[0x263F1CF20];
  if (v6 >= 0.1) {
    uint64_t v7 = 0;
  }
  return v7 | v1;
}

@end