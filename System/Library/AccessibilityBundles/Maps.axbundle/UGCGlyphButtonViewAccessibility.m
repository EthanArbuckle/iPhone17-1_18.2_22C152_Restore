@interface UGCGlyphButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UGCGlyphButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UGCGlyphButtonView";
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
  v6.receiver = self;
  v6.super_class = (Class)UGCGlyphButtonViewAccessibility;
  [(UGCGlyphButtonViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__UGCGlyphButtonViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v3[3] = &unk_26512D728;
  objc_copyWeak(&v4, &location);
  [(UGCGlyphButtonViewAccessibility *)self _setAccessibilityAdditionalTraitsBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __77__UGCGlyphButtonViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = *MEMORY[0x263F1CF18];
  int v3 = [WeakRetained safeBoolForKey:@"isSelected"];
  uint64_t v4 = *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 | v2;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end