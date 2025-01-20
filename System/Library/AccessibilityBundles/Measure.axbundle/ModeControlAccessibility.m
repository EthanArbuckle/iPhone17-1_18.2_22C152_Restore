@interface ModeControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_axButtons;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateSelectedButton;
- (void)updateHighlightState;
@end

@implementation ModeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.ModeControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ModeControl", @"selectedSegmentIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ModeControl", @"buttons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ModeControl", @"updateHighlightState", "v", 0);
}

- (id)_axButtons
{
  return (id)[(ModeControlAccessibility *)self safeArrayForKey:@"buttons"];
}

- (void)_axAnnotateSelectedButton
{
  uint64_t v3 = [(ModeControlAccessibility *)self safeIntegerForKey:@"selectedSegmentIndex"];
  v4 = [(ModeControlAccessibility *)self _axButtons];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ModeControlAccessibility__axAnnotateSelectedButton__block_invoke;
  v5[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v5[4] = v3;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __53__ModeControlAccessibility__axAnnotateSelectedButton__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  objc_opt_class();
  v7 = __UIAccessibilityCastAsSafeCategory();
  [v7 axSetIsActuallySelected:v6 == a3];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)ModeControlAccessibility;
  [(ModeControlAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  [(ModeControlAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF58]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(ModeControlAccessibility *)self _axButtons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _accessibilityDidMoveToTabBar];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  [(ModeControlAccessibility *)self _axAnnotateSelectedButton];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)updateHighlightState
{
  v3.receiver = self;
  v3.super_class = (Class)ModeControlAccessibility;
  [(ModeControlAccessibility *)&v3 updateHighlightState];
  [(ModeControlAccessibility *)self _axAnnotateSelectedButton];
}

@end