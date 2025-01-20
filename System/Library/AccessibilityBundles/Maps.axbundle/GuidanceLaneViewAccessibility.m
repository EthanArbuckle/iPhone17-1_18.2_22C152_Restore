@interface GuidanceLaneViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateLanePaths;
@end

@implementation GuidanceLaneViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GuidanceLaneView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GuidanceLaneView", @"_updateLanePaths", "v", 0);
  [v3 validateClass:@"GEOComposedRouteLaneInfo"];
  [v3 validateClass:@"GuidanceLaneView" hasInstanceVariable:@"_laneInfo" withType:"GEOComposedRouteLaneInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOComposedRouteLaneInfo", @"hasDirections", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOComposedRouteLaneInfo", @"isPreferredLaneForManeuver", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOComposedRouteLaneInfo", @"directions", "@", 0);
  [v3 validateClass:@"GEOComposedRouteLaneInfo"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOComposedRouteLaneDirectionInfo", @"direction", "i", 0);
}

- (void)_updateLanePaths
{
  v3.receiver = self;
  v3.super_class = (Class)GuidanceLaneViewAccessibility;
  [(GuidanceLaneViewAccessibility *)&v3 _updateLanePaths];
  [(GuidanceLaneViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)GuidanceLaneViewAccessibility;
  [(GuidanceLaneViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(GuidanceLaneViewAccessibility *)self safeValueForKey:@"_laneInfo"];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v3 safeBoolForKey:@"hasDirections"])
    {
      v5 = [v3 safeValueForKey:@"directions"];
      if ([v5 count])
      {
        for (unint64_t i = 0; i < [v5 count]; ++i)
        {
          v7 = [v5 objectAtIndexedSubscript:i];
          uint64_t v8 = [v7 direction];
          if ((int)v8 <= 15)
          {
            v9 = @"NO_DIRECTIONS_INDICATED";
            switch((int)v8)
            {
              case 0:
                goto LABEL_23;
              case 1:
                v9 = @"STRAIGHT";
                break;
              case 2:
                v9 = @"SLIGHT_RIGHT";
                break;
              case 4:
                v9 = @"RIGHT";
                break;
              case 8:
                v9 = @"SHARP_RIGHT";
                break;
              default:
                goto LABEL_22;
            }
            goto LABEL_23;
          }
          if ((int)v8 <= 63)
          {
            if (v8 == 16)
            {
              v9 = @"U_TURN_LEFT";
              goto LABEL_23;
            }
            if (v8 == 32)
            {
              v9 = @"SHARP_LEFT";
              goto LABEL_23;
            }
          }
          else
          {
            switch(v8)
            {
              case 0x40:
                v9 = @"LEFT";
                goto LABEL_23;
              case 0x80:
                v9 = @"SLIGHT_LEFT";
                goto LABEL_23;
              case 0x100:
                v9 = @"U_TURN_RIGHT";
                goto LABEL_23;
            }
          }
LABEL_22:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:
          [v4 appendString:v9];

          if ([v3 safeBoolForKey:@"isPreferredLaneForManeuver"] && !i) {
            [v4 appendString:@", preferred"];
          }
          [v4 appendString:@"; "];
        }
      }
    }
    [(GuidanceLaneViewAccessibility *)self setAccessibilityLabel:v4];
  }
}

@end