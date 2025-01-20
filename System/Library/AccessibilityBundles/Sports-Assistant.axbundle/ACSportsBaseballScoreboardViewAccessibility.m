@interface ACSportsBaseballScoreboardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation ACSportsBaseballScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsBaseballScoreboardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACSportsBaseballScoreboardView" isKindOfClass:@"ACSportsPeriodicScoreboardView"];
  [v3 validateClass:@"ACSportsBaseballScoreboardView" hasInstanceVariable:@"_hitsLineScoreView" withType:"ACSportsMatchupLineScoreView"];
  [v3 validateClass:@"ACSportsBaseballScoreboardView" hasInstanceVariable:@"_errorsLineScoreView" withType:"ACSportsMatchupLineScoreView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsBaseballScoreboardView", @"matchup", "@", 0);
}

- (id)accessibilityElements
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)ACSportsBaseballScoreboardViewAccessibility;
  id v3 = [(ACSportsBaseballScoreboardViewAccessibility *)&v18 accessibilityElements];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(ACSportsBaseballScoreboardViewAccessibility *)self safeValueForKey:@"_hitsLineScoreView"];
  v6 = [(ACSportsBaseballScoreboardViewAccessibility *)self safeValueForKey:@"_errorsLineScoreView"];
  [v5 _accessibilitySetRetainedValue:@"hits" forKey:@"AXSportsScorePeriodType"];
  [v6 _accessibilitySetRetainedValue:@"errors" forKey:@"AXSportsScorePeriodType"];
  [v4 axSafelyAddObject:v5];
  [v4 axSafelyAddObject:v6];
  v7 = [(ACSportsBaseballScoreboardViewAccessibility *)self safeValueForKey:@"matchup"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_accessibilitySetRetainedValue:forKey:", v7, @"AXSportsMatchup", (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }

  return v8;
}

@end