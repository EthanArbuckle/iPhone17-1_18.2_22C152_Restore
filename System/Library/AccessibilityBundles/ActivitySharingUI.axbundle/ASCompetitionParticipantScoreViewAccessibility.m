@interface ASCompetitionParticipantScoreViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityPointsLabel;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation ASCompetitionParticipantScoreViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASCompetitionParticipantScoreView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ASCompetitionParticipantScoreView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v3 validateClass:@"ASCompetitionParticipantScoreView" hasInstanceVariable:@"_primaryScoreLabel" withType:"UILabel"];
  [v3 validateClass:@"ASCompetitionParticipantScoreView" hasInstanceVariable:@"_secondaryScoreLabel" withType:"UILabel"];
  [v3 validateClass:@"ASCompetitionParticipantScoreView" hasInstanceVariable:@"_configuration" withType:"ASCompetitionScoreViewConfiguration"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCompetitionScoreViewConfiguration", @"primaryScoreSource", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ASCompetitionParticipantScoreViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_nameLabel"];
  id v3 = [v2 localizedLowercaseString];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(ASCompetitionParticipantScoreViewAccessibility *)self _accessibilityPointsLabel];
  v4 = [(ASCompetitionParticipantScoreViewAccessibility *)self safeValueForKey:@"_secondaryScoreLabel"];
  v7 = [v4 accessibilityLabel];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)_accessibilityPointsLabel
{
  objc_opt_class();
  id v3 = [(ASCompetitionParticipantScoreViewAccessibility *)self safeValueForKey:@"_primaryScoreLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];
  uint64_t v6 = AXIntegerValueFromString();

  v7 = [(ASCompetitionParticipantScoreViewAccessibility *)self safeValueForKey:@"_configuration"];
  v8 = v7;
  if (v7)
  {
    v9 = (char *)[v7 safeIntegerForKey:@"primaryScoreSource"];
    if ((unint64_t)v9 < 2)
    {
      v10 = @"competition.points.count";
LABEL_6:
      v11 = accessibilityLocalizedString(v10);
      v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v6);

      goto LABEL_8;
    }
    if (v9 == (unsigned char *)&dword_0 + 2)
    {
      v10 = @"competition.wins.count";
      goto LABEL_6;
    }
  }
  v12 = [v4 accessibilityLabel];
LABEL_8:

  return v12;
}

@end