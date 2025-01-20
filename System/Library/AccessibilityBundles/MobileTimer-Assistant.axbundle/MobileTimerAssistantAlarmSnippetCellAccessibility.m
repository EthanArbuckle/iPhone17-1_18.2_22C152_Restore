@interface MobileTimerAssistantAlarmSnippetCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (MobileTimerAssistantAlarmSnippetCellAccessibility)init;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MobileTimerAssistantAlarmSnippetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MobileTimerAssistantAlarmSnippetCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)self safeValueForKey:@"_alarmView"];
  v4 = [v3 safeValueForKey:@"repeatText"];

  v5 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)self safeValueForKey:@"alarm"];
  v6 = [v5 safeValueForKey:@"hour"];
  uint64_t v7 = [v6 integerValue];

  v8 = [v5 safeValueForKey:@"minute"];
  uint64_t v9 = [v8 integerValue];

  v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  v11 = [MEMORY[0x263EFF910] date];
  v12 = [v10 components:28 fromDate:v11];

  [v12 setHour:v7];
  [v12 setMinute:v9];
  v13 = [v10 dateFromComponents:v12];
  v14 = [MEMORY[0x263F08790] localizedStringFromDate:v13 dateStyle:0 timeStyle:1];
  v15 = [MEMORY[0x263F21660] axAttributedStringWithString:v14];
  [v15 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21708]];
  if ([v4 length])
  {
    v16 = NSString;
    v17 = accessibilityLocalizedString(@"alarm.cell.repeat.text");
    v20 = objc_msgSend(v16, "stringWithFormat:", v17, v4);
    __UIAXStringForVariables();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v15;
  }

  return v18;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)MobileTimerAssistantAlarmSnippetCellAccessibility;
  unint64_t v3 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)&v8 accessibilityTraits];
  v4 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)self safeValueForKey:@"_alarmView"];
  v5 = [v4 safeValueForKey:@"enabledSwitch"];
  uint64_t v6 = [v5 accessibilityTraits] | v3;

  return *MEMORY[0x263F1CEE8] ^ v6;
}

- (id)accessibilityValue
{
  v2 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)self safeValueForKey:@"_alarmView"];
  unint64_t v3 = [v2 safeValueForKey:@"enabledSwitch"];
  v4 = [v3 accessibilityValue];

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)self safeValueForKey:@"_alarmView"];
  unint64_t v3 = [v2 safeValueForKey:@"enabledSwitch"];
  [v3 accessibilityActivationPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (MobileTimerAssistantAlarmSnippetCellAccessibility)init
{
  v7.receiver = self;
  v7.super_class = (Class)MobileTimerAssistantAlarmSnippetCellAccessibility;
  v2 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)&v7 init];
  unint64_t v3 = v2;
  if (v2)
  {
    double v4 = [(MobileTimerAssistantAlarmSnippetCellAccessibility *)v2 safeValueForKey:@"_alarmView"];
    double v5 = [v4 safeValueForKey:@"enabledSwitch"];
    [v5 setIsAccessibilityElement:0];
  }
  return v3;
}

@end