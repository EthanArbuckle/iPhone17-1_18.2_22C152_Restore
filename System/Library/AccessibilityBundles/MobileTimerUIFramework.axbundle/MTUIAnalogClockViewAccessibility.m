@interface MTUIAnalogClockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MTUIAnalogClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUIAnalogClockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(MTUIAnalogClockViewAccessibility *)self safeValueForKey:@"isNighttime"];
  if ([v2 BOOLValue]) {
    v3 = @"clock.nighttime";
  }
  else {
    v3 = @"clock.daytime";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (id)accessibilityValue
{
  v3 = [(MTUIAnalogClockViewAccessibility *)self safeValueForKey:@"hour"];
  uint64_t v4 = [v3 integerValue];

  v5 = [(MTUIAnalogClockViewAccessibility *)self safeValueForKey:@"minute"];
  uint64_t v6 = [v5 integerValue];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", v4, v6);
  v8 = AXDateFromStringWithFormat();

  v9 = [MEMORY[0x263F08790] localizedStringFromDate:v8 dateStyle:0 timeStyle:1];
  v10 = [MEMORY[0x263F21660] axAttributedStringWithString:v9];
  [v10 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21708]];

  return v10;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

- (BOOL)isAccessibilityElement
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] != 0;

  return v3;
}

@end