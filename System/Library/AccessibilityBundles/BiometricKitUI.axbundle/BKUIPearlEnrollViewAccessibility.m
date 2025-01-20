@interface BKUIPearlEnrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BKUIPearlEnrollViewAccessibility)init;
- (id)_axSpokenGuidance;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXSpokenGuidance:(id)a3;
- (void)_updateRaiseLowerGuidanceLabelIfNeededForPitch:(double)a3;
@end

@implementation BKUIPearlEnrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlEnrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BKUIPearlEnrollView" hasInstanceVariable:@"_tutorialMovieView" withType:"BKUIPearlMovieLoopView"];
  [v3 validateClass:@"BKUIPearlEnrollView" hasInstanceVariable:@"_repositionPhoneLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollView", @"state", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollView", @"_updateRaiseLowerGuidanceLabelIfNeededForPitch:", "v", "d", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewAccessibility;
  [(BKUIPearlEnrollViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BKUIPearlEnrollViewAccessibility *)self safeValueForKey:@"_tutorialMovieView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"pearl.tutorial.movie.description");
  [v3 setAccessibilityLabel:v4];
}

- (BKUIPearlEnrollViewAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewAccessibility;
  v2 = [(BKUIPearlEnrollViewAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(BKUIPearlEnrollViewAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

- (id)_axSpokenGuidance
{
}

- (void)_setAXSpokenGuidance:(id)a3
{
}

- (void)_updateRaiseLowerGuidanceLabelIfNeededForPitch:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlEnrollViewAccessibility;
  [(BKUIPearlEnrollViewAccessibility *)&v7 _updateRaiseLowerGuidanceLabelIfNeededForPitch:a3];
  if ([(BKUIPearlEnrollViewAccessibility *)self safeIntForKey:@"_state"] == 4)
  {
    v4 = [(BKUIPearlEnrollViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_repositionPhoneLabel"];
    if ([v4 length])
    {
      objc_super v5 = [(BKUIPearlEnrollViewAccessibility *)self _axSpokenGuidance];
      char v6 = [v4 isEqualToString:v5];

      if ((v6 & 1) == 0)
      {
        [(BKUIPearlEnrollViewAccessibility *)self _setAXSpokenGuidance:v4];
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v4);
      }
    }
  }
  else
  {
    [(BKUIPearlEnrollViewAccessibility *)self _setAXSpokenGuidance:0];
  }
}

@end