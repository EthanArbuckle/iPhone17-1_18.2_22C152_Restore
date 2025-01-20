@interface VUIScorecardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VUIScorecardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIScorecardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIScorecardView" hasProperty:@"delegate" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" conformsToProtocol:@"VUIScorecardViewDelegate"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"scoreboardViewModel" withSwiftType:"Optional<VUISportsScoreboardViewModel>"];
  [v3 validateClass:@"VUISportsScoreboardViewModel" hasProperty:@"scores" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(VUIScorecardViewAccessibility *)self safeValueForKey:@"delegate"];
  v4 = MEMORY[0x245669790](@"VUIScorecardViewDelegate");
  char v5 = [v3 conformsToProtocol:v4];

  if (v5)
  {
    v22 = v3;
    v6 = [v3 safeSwiftValueForKey:@"scoreboardViewModel"];
    v7 = [v6 safeDictionaryForKey:@"leagueContext"];
    v8 = [v7 safeStringForKey:@"leagueType"];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v21 = v6;
    id obj = [v6 safeArrayForKey:@"scores"];
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v11 = 0;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        v14 = v11;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
          if (objc_msgSend(v8, "isEqualToString:", @"baseball", v19, v20))
          {
            id v16 = [v15 axMapObjectsUsingBlock:&__block_literal_global_3];
          }
          else
          {
            id v16 = v15;
          }
          v17 = v16;
          v19 = AXLabelForElements();
          v20 = @"__AXStringForVariablesSentinel";
          v11 = __UIAXStringForVariables();

          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16, v19, @"__AXStringForVariablesSentinel");
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    id v3 = v22;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)VUIScorecardViewAccessibility;
    v11 = [(VUIScorecardViewAccessibility *)&v28 accessibilityLabel];
  }

  return v11;
}

id __51__VUIScorecardViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return accessibilityMLBScores(a2);
}

@end