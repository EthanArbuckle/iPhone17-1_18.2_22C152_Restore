@interface ACSportsSoccerScoreboardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setMatchup:(id)a3;
@end

@implementation ACSportsSoccerScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsSoccerScoreboardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACSportsSoccerScoreboardView" isKindOfClass:@"ACSportsScoreboardView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsSoccerScoreboardView", @"setMatchup:", "v", "@", 0);
  [v3 validateClass:@"ACSportsScoreboardView" hasInstanceVariable:@"_headerLabel" withType:"SiriUIContentLabel"];
  [v3 validateClass:@"ACSportsScoreboardView" hasInstanceVariable:@"_subtitleLabel" withType:"SiriUIContentLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"homeEntity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"homeScore", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"awayEntity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"awayScore", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsEntity", @"name", "@", 0);
}

- (void)setMatchup:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ACSportsSoccerScoreboardViewAccessibility;
  id v4 = a3;
  [(ACSportsSoccerScoreboardViewAccessibility *)&v15 setMatchup:v4];
  v5 = [(ACSportsSoccerScoreboardViewAccessibility *)self safeValueForKey:@"_headerLabel"];
  v6 = [(ACSportsSoccerScoreboardViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  [v6 setIsAccessibilityElement:0];
  v7 = [v4 safeValueForKey:@"homeEntity"];
  v8 = [v7 safeValueForKey:@"name"];

  v9 = [v4 safeValueForKey:@"homeScore"];
  v10 = [v4 safeValueForKey:@"awayEntity"];
  v11 = [v10 safeValueForKey:@"name"];

  v12 = [v4 safeValueForKey:@"awayScore"];

  v14 = [v6 accessibilityLabel];
  v13 = __UIAXStringForVariables();

  objc_msgSend(v5, "setAccessibilityLabel:", v13, v9, v11, v12, v14, @"__AXStringForVariablesSentinel");
}

@end