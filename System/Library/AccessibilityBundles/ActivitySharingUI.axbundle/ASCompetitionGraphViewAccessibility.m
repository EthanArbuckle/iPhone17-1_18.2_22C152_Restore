@interface ASCompetitionGraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateGraphElements;
- (void)drawRect:(CGRect)a3;
@end

@implementation ASCompetitionGraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASCompetitionGraphView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ASCompetitionGraphView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"ASCompetitionGraphView" hasInstanceVariable:@"_competition" withType:"ASCompetition"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCompetitionGraphView", @"drawRect:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCompetition", @"startDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCompetition", @"durationDateComponents", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCompetition", @"scores", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCompetition", @"opponentScores", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ASCompetitionGraphViewAccessibility;
  [(ASCompetitionGraphViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ASCompetitionGraphViewAccessibility *)self _axAnnotateGraphElements];
}

- (void)drawRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionGraphViewAccessibility;
  -[ASCompetitionGraphViewAccessibility drawRect:](&v4, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ASCompetitionGraphViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axAnnotateGraphElements
{
  objc_opt_class();
  v36 = __UIAccessibilityCastAsClass();
  objc_super v3 = [(ASCompetitionGraphViewAccessibility *)self safeValueForKey:@"_competition"];
  objc_opt_class();
  objc_super v4 = [v3 safeValueForKey:@"startDate"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v6 = [v3 safeValueForKey:@"durationDateComponents"];
  v7 = __UIAccessibilityCastAsClass();

  id v8 = [v7 day];
  [v36 bounds];
  double Width = CGRectGetWidth(v37);
  [v36 bounds];
  double Height = CGRectGetHeight(v38);
  if (v36 && v3 && v5 && v8 && Width > 0.0 && (double v11 = Height, Height > 0.0))
  {
    v35 = accessibilityLocalizedString(@"competition.opponent.generic.name");
    objc_opt_class();
    v12 = [v3 _accessibilityValueForKey:@"kAXFriendDisplayNameForCompetition"];
    v13 = __UIAccessibilityCastAsClass();

    v30 = v13;
    if ([v13 length])
    {
      id v14 = v13;

      v35 = v14;
    }
    v34 = self;
    v33 = +[NSMutableArray array];
    v15 = [v3 safeArrayForKey:@"scores"];
    v31 = v3;
    v16 = [v3 safeArrayForKey:@"opponentScores"];
    if ((uint64_t)v8 < 1)
    {
      uint64_t v29 = (uint64_t)v5;
    }
    else
    {
      unint64_t v17 = 0;
      double v18 = Width / (double)(uint64_t)v8;
      id v32 = v8;
      do
      {
        if (v17 < (unint64_t)[v15 count])
        {
          v19 = [v15 objectAtIndexedSubscript:v17];
          [v19 unsignedIntegerValue];
        }
        if (v17 < (unint64_t)[v16 count])
        {
          v20 = [v16 objectAtIndexedSubscript:v17];
          [v20 unsignedIntegerValue];
        }
        id v21 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:v34];
        v22 = AXDateStringForFormat();
        [v21 setAccessibilityLabel:v22];

        v23 = accessibilityLocalizedString(@"competition.opponentscore.vs.myscore");
        v24 = AXFormatInteger();
        v25 = AXFormatInteger();
        v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v35, v24, v25);

        [v21 setAccessibilityValue:v26];
        [v36 frame];
        objc_msgSend(v21, "setBounds:", v27 + v18 * (double)(uint64_t)v17, 0.0, v18, v11);
        [v33 addObject:v21];
        v28 = +[NSCalendar currentCalendar];
        uint64_t v29 = [v28 dateByAddingUnit:16 value:1 toDate:v5 options:0];

        ++v17;
        v5 = (void *)v29;
      }
      while (v32 != (id)v17);
    }
    [(ASCompetitionGraphViewAccessibility *)v34 setAccessibilityElements:v33];

    v5 = (void *)v29;
    objc_super v3 = v31;
  }
  else
  {
    -[ASCompetitionGraphViewAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", 0, Height);
  }
}

@end