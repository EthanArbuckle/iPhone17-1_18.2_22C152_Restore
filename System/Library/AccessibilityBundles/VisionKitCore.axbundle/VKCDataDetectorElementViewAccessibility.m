@interface VKCDataDetectorElementViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsDataDetectorOfType:(unint64_t)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityLabel;
@end

@implementation VKCDataDetectorElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCDataDetectorElementView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCDataDetectorElementView", @"dataDetectorElement", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCDataDetectorElementView", @"allowLongPressDDActivationOnly", "B", 0);
  [v3 validateClass:@"VKCTextDataDetectorElement" isKindOfClass:@"VKCBaseDataDetectorElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCBaseDataDetectorElement", @"scannerResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCTextDataDetectorElement", @"dataDetectorTypes", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DDScannerResult", @"value", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(VKCDataDetectorElementViewAccessibility *)self safeBoolForKey:@"allowLongPressDDActivationOnly"] ^ 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityValue
{
  v2 = [(VKCDataDetectorElementViewAccessibility *)self safeValueForKeyPath:@"dataDetectorElement.scannerResult"];
  id v3 = [v2 safeStringForKey:@"value"];

  return v3;
}

- (id)accessibilityLabel
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = accessibilityLocalizedString(@"detected.data.element");
  [v3 axSafelyAddObject:v4];

  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:1])
  {
    v5 = @"phone.number";
LABEL_28:
    v6 = accessibilityLocalizedString(v5);
    [v3 axSafelyAddObject:v6];

    goto LABEL_29;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:2])
  {
    v5 = @"address";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:4])
  {
    v5 = @"calendar.event";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:8])
  {
    v5 = @"shipment.tracking";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:16])
  {
    v5 = @"flight.number";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:32])
  {
    v5 = @"lookup.suggestion";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:64])
  {
    v5 = @"web.url";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:128])
  {
    v5 = @"mail.url";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:256])
  {
    v5 = @"url";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:512])
  {
    v5 = @"email";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:0x200000])
  {
    v5 = @"mr.code";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:0x400000])
  {
    v5 = @"app.code";
    goto LABEL_28;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:1024]) {
    goto LABEL_29;
  }
  if ([(VKCDataDetectorElementViewAccessibility *)self _axIsDataDetectorOfType:2048])
  {
    v5 = @"money";
    goto LABEL_28;
  }
  v9 = AXLogAppAccessibility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(VKCDataDetectorElementViewAccessibility *)self accessibilityLabel];
  }

LABEL_29:
  v7 = MEMORY[0x245669BF0](v3);

  return v7;
}

- (BOOL)_axIsDataDetectorOfType:(unint64_t)a3
{
  v4 = [(VKCDataDetectorElementViewAccessibility *)self safeValueForKey:@"dataDetectorElement"];
  uint64_t v5 = [v4 safeUnsignedIntegerForKey:@"dataDetectorTypes"];

  return (a3 & ~v5) == 0;
}

- (void)accessibilityLabel
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 safeValueForKey:@"dataDetectorElement"];
  int v4 = 134217984;
  uint64_t v5 = [v3 safeUnsignedIntegerForKey:@"dataDetectorTypes"];
  _os_log_error_impl(&dword_242713000, a2, OS_LOG_TYPE_ERROR, "Detector type : %lu should be included in accessibility label", (uint8_t *)&v4, 0xCu);
}

@end