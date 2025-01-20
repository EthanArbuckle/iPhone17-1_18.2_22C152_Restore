@interface ACSportsAttributionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setAttributionPunchOut:(id)a3;
- (void)setLeagueAppPunchOut:(id)a3;
@end

@implementation ACSportsAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsAttributionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsAttributionView", @"setAttributionPunchOut:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsAttributionView", @"setLeagueAppPunchOut:", "v", "@", 0);
  [v3 validateClass:@"ACSportsAttributionView" hasInstanceVariable:@"_attributionButton" withType:"UIButton"];
  [v3 validateClass:@"ACSportsAttributionView" hasInstanceVariable:@"_leagueAppButton" withType:"UIButton"];
}

- (void)setAttributionPunchOut:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ACSportsAttributionViewAccessibility;
  [(ACSportsAttributionViewAccessibility *)&v8 setAttributionPunchOut:a3];
  v4 = [(ACSportsAttributionViewAccessibility *)self safeValueForKey:@"_attributionButton"];
  v5 = accessibilityLocalizedString(@"scores.source");
  [v4 setAccessibilityLabel:v5];

  v6 = [(ACSportsAttributionViewAccessibility *)self safeValueForKey:@"_attributionButton"];
  v7 = accessibilityLocalizedString(@"scores.source.hint");
  [v6 setAccessibilityHint:v7];
}

- (void)setLeagueAppPunchOut:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ACSportsAttributionViewAccessibility;
  id v4 = a3;
  [(ACSportsAttributionViewAccessibility *)&v9 setLeagueAppPunchOut:v4];
  v5 = objc_msgSend(v4, "safeValueForKey:", @"appDisplayName", v9.receiver, v9.super_class);

  v6 = [(ACSportsAttributionViewAccessibility *)self safeValueForKey:@"_leagueAppButton"];
  [v6 setAccessibilityLabel:v5];

  v7 = [(ACSportsAttributionViewAccessibility *)self safeValueForKey:@"_leagueAppButton"];
  objc_super v8 = accessibilityLocalizedString(@"open.league.app.hint");
  [v7 setAccessibilityHint:v8];
}

@end