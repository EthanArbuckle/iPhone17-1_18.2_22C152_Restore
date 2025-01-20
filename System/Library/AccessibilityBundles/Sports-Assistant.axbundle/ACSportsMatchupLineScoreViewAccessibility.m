@interface ACSportsMatchupLineScoreViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axPeriodNameForPeriod:(id)a3 withValue:(id)a4;
- (id)_axSportType;
- (id)accessibilityLabel;
@end

@implementation ACSportsMatchupLineScoreViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsMatchupLineScoreView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsMatchupLineScoreView", @"periodNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsMatchupLineScoreView", @"firstScoreLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsMatchupLineScoreView", @"secondScoreLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"homeEntity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"awayEntity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsEntity", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsEntity", @"league", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsLeague", @"sport", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(ACSportsMatchupLineScoreViewAccessibility *)self safeValueForKey:@"periodNameLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(ACSportsMatchupLineScoreViewAccessibility *)self _accessibilityValueForKey:@"AXSportsScorePeriodType"];
  v6 = [(ACSportsMatchupLineScoreViewAccessibility *)self _axPeriodNameForPeriod:v5 withValue:v4];

  v7 = [(ACSportsMatchupLineScoreViewAccessibility *)self safeValueForKey:@"firstScoreLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [(ACSportsMatchupLineScoreViewAccessibility *)self safeValueForKey:@"secondScoreLabel"];
  v10 = [v9 accessibilityLabel];

  v11 = __UIAXStringForVariables();
  v12 = [(ACSportsMatchupLineScoreViewAccessibility *)self _accessibilityValueForKey:@"AXSportsMatchup", v8, v10, @"__AXStringForVariablesSentinel"];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 safeValueForKey:@"homeEntity"];
    [v14 safeValueForKey:@"name"];
    v15 = v22 = v4;

    v16 = [v13 safeValueForKey:@"awayEntity"];
    v17 = [v16 safeValueForKey:@"name"];

    [v13 safeBoolForKey:@"ACSportsHomeIsFirst"];
    uint64_t v18 = __UIAXStringForVariables();

    uint64_t v19 = __UIAXStringForVariables();

    uint64_t v20 = __UIAXStringForVariables();

    v4 = v22;
    v11 = (void *)v20;
    v10 = (void *)v19;
    v8 = (void *)v18;
  }

  return v11;
}

- (id)_axPeriodNameForPeriod:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_axPeriodNameForPeriod_withValue__onceToken != -1) {
    dispatch_once(&_axPeriodNameForPeriod_withValue__onceToken, &__block_literal_global);
  }
  uint64_t v8 = [v7 integerValue];
  v9 = (void *)_axPeriodNameForPeriod_withValue__OrdinalNumberFormatter;
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
  v11 = [v9 stringFromNumber:v10];

  v12 = [(ACSportsMatchupLineScoreViewAccessibility *)self _axSportType];
  if (([v12 isEqualToString:@"Baseball"] & 1) != 0
    || ![v6 isEqualToString:@"total"])
  {
    if ([v12 isEqualToString:@"Baseball"])
    {
      if (v6 && !v8)
      {
        if ([v6 isEqualToString:@"total"])
        {
          v13 = @"sport.baseball.runs";
          goto LABEL_27;
        }
        if ([v6 isEqualToString:@"hits"])
        {
          v13 = @"sport.baseball.hits";
          goto LABEL_27;
        }
        if ([v6 isEqualToString:@"errors"])
        {
          v13 = @"sport.baseball.errors";
          goto LABEL_27;
        }
LABEL_18:
        v17 = 0;
        goto LABEL_28;
      }
      v14 = NSString;
      v15 = @"sport.baseball.inning";
    }
    else if ([v12 isEqualToString:@"Football"])
    {
      if (v6 && !v8) {
        goto LABEL_18;
      }
      v14 = NSString;
      v15 = @"sport.football.half";
    }
    else
    {
      if ([v12 isEqualToString:@"Soccer"]) {
        goto LABEL_18;
      }
      if ([v12 isEqualToString:@"Hockey"])
      {
        if (v6 && !v8) {
          goto LABEL_18;
        }
        v14 = NSString;
        v15 = @"sport.hockey.period";
      }
      else
      {
        int v19 = [v12 isEqualToString:@"Basketball"];
        v17 = 0;
        if (v6) {
          BOOL v20 = v8 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        int v21 = !v20;
        if (!v19 || !v21) {
          goto LABEL_28;
        }
        v14 = NSString;
        v15 = @"sport.basketball.quarter";
      }
    }
    v16 = accessibilityLocalizedString(v15);
    v17 = objc_msgSend(v14, "stringWithFormat:", v16, v11);

    goto LABEL_28;
  }
  v13 = @"sport.score.total";
LABEL_27:
  v17 = accessibilityLocalizedString(v13);
LABEL_28:

  return v17;
}

uint64_t __78__ACSportsMatchupLineScoreViewAccessibility__axPeriodNameForPeriod_withValue___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_axPeriodNameForPeriod_withValue__OrdinalNumberFormatter;
  _axPeriodNameForPeriod_withValue__OrdinalNumberFormatter = (uint64_t)v0;

  v2 = (void *)_axPeriodNameForPeriod_withValue__OrdinalNumberFormatter;

  return [v2 setNumberStyle:6];
}

- (id)_axSportType
{
  v2 = [(ACSportsMatchupLineScoreViewAccessibility *)self _accessibilityValueForKey:@"AXSportsMatchup"];
  id v3 = [v2 safeValueForKey:@"awayEntity"];
  v4 = [v3 safeValueForKey:@"league"];
  v5 = [v4 safeValueForKey:@"sport"];

  objc_opt_class();
  id v6 = __UIAccessibilityCastAsClass();

  return v6;
}

@end