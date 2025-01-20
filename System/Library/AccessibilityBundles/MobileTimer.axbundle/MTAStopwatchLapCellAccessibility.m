@interface MTAStopwatchLapCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MTAStopwatchLapCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAStopwatchLapCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchLapCell", @"timeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchLapCell", @"runningTotalLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchLapCell", @"lap", "q", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MTAStopwatchLapCellAccessibility *)self safeValueForKey:@"lap"];
  v4 = [v3 stringValue];

  v5 = [(MTAStopwatchLapCellAccessibility *)self safeValueForKey:@"timeLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = AXLocalizeDurationTime();

  v8 = [(MTAStopwatchLapCellAccessibility *)self safeValueForKey:@"runningTotalLabel"];
  v9 = [v8 accessibilityLabel];
  v10 = AXLocalizeDurationTime();

  uint64_t v11 = [v10 length];
  v12 = NSString;
  if (v11)
  {
    v13 = accessibilityLocalizedString(@"lap.cell.long.text");
    objc_msgSend(v12, "stringWithFormat:", v13, v4, v7, v10);
  }
  else
  {
    v13 = accessibilityLocalizedString(@"lap.cell.short.text");
    objc_msgSend(v12, "stringWithFormat:", v13, v4, v7, v16);
  v14 = };

  return v14;
}

- (id)accessibilityValue
{
  char v14 = 0;
  objc_opt_class();
  id v3 = [(MTAStopwatchLapCellAccessibility *)self safeValueForKey:@"color"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263F1C550] systemGreenColor];
  int v6 = UIAccessibilityColorEqualToColor();

  if (v6)
  {
    v7 = @"stopwatch.fastest";
LABEL_5:
    uint64_t v10 = accessibilityLocalizedString(v7);
    goto LABEL_7;
  }
  v8 = [MEMORY[0x263F1C550] systemRedColor];
  int v9 = UIAccessibilityColorEqualToColor();

  if (v9)
  {
    v7 = @"stopwatch.slowest";
    goto LABEL_5;
  }
  v13.receiver = self;
  v13.super_class = (Class)MTAStopwatchLapCellAccessibility;
  uint64_t v10 = [(MTAStopwatchLapCellAccessibility *)&v13 accessibilityValue];
LABEL_7:
  uint64_t v11 = (void *)v10;

  return v11;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(MTAStopwatchLapCellAccessibility *)self safeValueForKey:@"lap"];
  uint64_t v4 = [v3 integerValue];

  if (v4 == -1)
  {
    unint64_t v5 = *MEMORY[0x263F813E8];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTAStopwatchLapCellAccessibility;
    unint64_t v5 = [(MTAStopwatchLapCellAccessibility *)&v7 accessibilityTraits];
  }
  return *MEMORY[0x263F1CF68] | v5;
}

@end