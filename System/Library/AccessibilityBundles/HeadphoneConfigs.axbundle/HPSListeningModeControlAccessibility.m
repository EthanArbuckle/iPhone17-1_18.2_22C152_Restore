@interface HPSListeningModeControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForBTListeningMode:(int)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetSegmentLabels;
- (void)addModeOptions;
@end

@implementation HPSListeningModeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HPSListeningModeControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HPSListeningModeControl" hasInstanceVariable:@"_segmentedControl" withType:"UISegmentedControl"];
  [v3 validateClass:@"UISegmentedControl" hasInstanceVariable:@"_segments" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HPSListeningModeControl", @"addModeOptions", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HPSListeningModeControl", @"getListeningModeFromIndex:", "i", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)HPSListeningModeControlAccessibility;
  [(HPSListeningModeControlAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(HPSListeningModeControlAccessibility *)self _axSetSegmentLabels];
}

- (id)accessibilityElements
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HPSListeningModeControlAccessibility *)self safeUIViewForKey:@"_segmentedControl"];
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HPSListeningModeControlAccessibility;
    uint64_t v5 = [(HPSListeningModeControlAccessibility *)&v8 accessibilityElements];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)addModeOptions
{
  v3.receiver = self;
  v3.super_class = (Class)HPSListeningModeControlAccessibility;
  [(HPSListeningModeControlAccessibility *)&v3 addModeOptions];
  [(HPSListeningModeControlAccessibility *)self _axSetSegmentLabels];
}

- (void)_axSetSegmentLabels
{
  LOBYTE(v10) = 0;
  objc_opt_class();
  objc_super v3 = [(HPSListeningModeControlAccessibility *)self safeValueForKey:@"_segmentedControl"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 safeArrayForKey:@"_segments"];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      int v13 = 0;
      AXPerformSafeBlock();
      uint64_t v7 = *((unsigned int *)v11 + 6);
      _Block_object_dispose(&v10, 8);
      objc_super v8 = [v5 objectAtIndex:v6];
      v9 = [(HPSListeningModeControlAccessibility *)self _axLabelForBTListeningMode:v7];
      [v8 setAccessibilityLabel:v9];

      ++v6;
    }
    while (v6 < [v5 count]);
  }
}

uint64_t __59__HPSListeningModeControlAccessibility__axSetSegmentLabels__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) getListeningModeFromIndex:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_axLabelForBTListeningMode:(int)a3
{
  if ((a3 - 1) > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_2651240A8[a3 - 1]);
  }
  return v4;
}

@end