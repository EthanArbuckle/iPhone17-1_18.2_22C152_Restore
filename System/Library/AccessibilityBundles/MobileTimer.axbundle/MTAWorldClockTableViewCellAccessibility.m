@interface MTAWorldClockTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityCityName;
- (id)accessibilityLabel;
@end

@implementation MTAWorldClockTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAWorldClockTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockTableViewCell", @"city", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WorldClockCity", @"alCity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WorldClockCity", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ALCity", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"digitalClock", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"combinedLabel", "@", 0);
  [v3 validateClass:@"MTAWorldClockTableViewCell" hasInstanceVariable:@"_clockCellView" withType:"MTUIWorldClockCellView"];
  [v3 validateClass:@"MTUIAnalogClockView" hasInstanceVariable:@"_nighttime" withType:"c"];
  [v3 validateClass:@"MTUIWorldClockCellView" hasInstanceVariable:@"_timeZone" withType:"NSTimeZone"];
}

- (id)_accessibilityCityName
{
  v2 = [(MTAWorldClockTableViewCellAccessibility *)self safeValueForKey:@"city"];
  id v3 = [v2 safeValueForKey:@"alCity"];
  v4 = [v3 safeValueForKey:@"name"];
  if (!v4)
  {
    v4 = [v2 safeValueForKey:@"name"];
  }

  return v4;
}

- (id)accessibilityLabel
{
  id v3 = [(MTAWorldClockTableViewCellAccessibility *)self safeValueForKey:@"_clockCellView"];
  v4 = [v3 safeValueForKey:@"combinedLabel"];
  v5 = [v4 accessibilityLabel];

  v6 = [(MTAWorldClockTableViewCellAccessibility *)self _accessibilityCityName];
  v7 = [v3 safeValueForKey:@"_timeZone"];
  uint64_t v8 = [v7 secondsFromGMT];
  v9 = [MEMORY[0x263EFFA18] systemTimeZone];
  uint64_t v10 = v8 - [v9 secondsFromGMT];

  v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)v10];
  v14 = AXDateStringForFormat();
  v12 = __UIAXStringForVariables();

  return v12;
}

@end