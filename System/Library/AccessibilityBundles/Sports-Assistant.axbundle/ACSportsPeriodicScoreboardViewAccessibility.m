@interface ACSportsPeriodicScoreboardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (void)didChangeMatchupFromMatchup:(id)a3;
@end

@implementation ACSportsPeriodicScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsPeriodicScoreboardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACSportsPeriodicScoreboardView" isKindOfClass:@"ACSportsScoreboardView"];
  [v3 validateClass:@"ACSportsScoreboardView" hasInstanceVariable:@"_headerLabel" withType:"SiriUIContentLabel"];
  [v3 validateClass:@"ACSportsScoreboardView" hasInstanceVariable:@"_subtitleLabel" withType:"SiriUIContentLabel"];
  [v3 validateClass:@"ACSportsScoreboardView" hasInstanceVariable:@"_venueNameLabel" withType:"UILabel"];
  [v3 validateClass:@"ACSportsPeriodicScoreboardView" hasInstanceVariable:@"_lineScoreViews" withType:"NSMutableArray"];
  [v3 validateClass:@"ACSportsPeriodicScoreboardView" hasInstanceVariable:@"_totalLineScoreView" withType:"ACSportsMatchupLineScoreView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsScoreboardView", @"matchup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"homeEntity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"homeScore", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"awayEntity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"awayScore", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsEntity", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsPeriodicScoreboardView", @"didChangeMatchupFromMatchup:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [(ACSportsPeriodicScoreboardViewAccessibility *)self _accessibilityValueForKey:@"AXScoreboardElements"];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v4 = [(ACSportsPeriodicScoreboardViewAccessibility *)self safeValueForKey:@"_headerLabel"];
    v5 = [(ACSportsPeriodicScoreboardViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
    v6 = [(ACSportsPeriodicScoreboardViewAccessibility *)self safeValueForKey:@"matchup"];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 safeValueForKey:@"homeEntity"];
      uint64_t v9 = [v8 safeValueForKey:@"name"];

      uint64_t v10 = [v7 safeValueForKey:@"homeScore"];
      v11 = [v7 safeValueForKey:@"awayEntity"];
      uint64_t v12 = [v11 safeValueForKey:@"name"];

      uint64_t v13 = [v7 safeValueForKey:@"awayScore"];
      v32 = v5;
      v26 = [v5 accessibilityLabel];
      v28 = (void *)v13;
      v29 = (void *)v12;
      v30 = (void *)v10;
      v31 = (void *)v9;
      uint64_t v14 = __UIAXStringForVariables();

      v27 = (void *)v14;
      objc_msgSend(v4, "setAccessibilityLabel:", v14, v10, v12, v13, v26, @"__AXStringForVariablesSentinel");
      [v3 axSafelyAddObject:v4];
      char v37 = 0;
      objc_opt_class();
      v15 = [(ACSportsPeriodicScoreboardViewAccessibility *)self safeValueForKey:@"_lineScoreViews"];
      v16 = __UIAccessibilityCastAsClass();

      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            [v22 _accessibilitySetRetainedValue:v7 forKey:@"AXSportsMatchup"];
            [v3 addObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v19);
      }

      v23 = [(ACSportsPeriodicScoreboardViewAccessibility *)self safeValueForKey:@"_totalLineScoreView"];
      [v23 _accessibilitySetRetainedValue:@"total" forKey:@"AXSportsScorePeriodType"];
      [v23 _accessibilitySetRetainedValue:v7 forKey:@"AXSportsMatchup"];
      [v3 axSafelyAddObject:v23];
      v24 = [(ACSportsPeriodicScoreboardViewAccessibility *)self safeValueForKey:@"_venueNameLabel"];
      [v24 _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:@"AXIsSportsPeriodVenueLabel"];
      [v3 axSafelyAddObject:v24];

      v5 = v32;
    }
    [(ACSportsPeriodicScoreboardViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"AXScoreboardElements"];
  }

  return v3;
}

- (void)didChangeMatchupFromMatchup:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACSportsPeriodicScoreboardViewAccessibility;
  [(ACSportsPeriodicScoreboardViewAccessibility *)&v4 didChangeMatchupFromMatchup:a3];
  [(ACSportsPeriodicScoreboardViewAccessibility *)self _accessibilityRemoveValueForKey:@"AXScoreboardElements"];
}

@end