@interface HUCameraEventReachabilityCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axReachabilityEvent;
- (id)accessibilityLabel;
@end

@implementation HUCameraEventReachabilityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCameraEventReachabilityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(HUCameraEventReachabilityCellAccessibility *)self _axReachabilityEvent];
  v4 = [MEMORY[0x263EFF910] date];
  v5 = [v3 startEvent];
  v6 = (void *)MEMORY[0x263F47B08];
  v7 = [v5 dateOfOccurrence];
  v8 = [v6 attributedShortTimeStringFromDate:v7];
  v9 = [v8 string];

  v10 = (void *)MEMORY[0x263F47B08];
  v11 = [v5 dateOfOccurrence];
  v12 = [v10 localizerKeyDayNameFromDate:v11];

  v13 = [v5 dateOfOccurrence];
  [v4 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 > 604800.0)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Last%@", v12];

    v12 = (void *)v16;
  }
  v17 = [NSString stringWithFormat:@"HUCameraEventRecordingCellAccessibilityLabelSignificantEventTimeOn%@Format", v12];
  v18 = NSString;
  v19 = accessibilityHomeUILocalizedString(v17);
  v20 = objc_msgSend(v18, "stringWithFormat:", v19, v9);

  v21 = [(HUCameraEventReachabilityCellAccessibility *)self _axReachabilityEvent];
  [v21 duration];
  v22 = AXDurationStringForDuration();

  v23 = accessibilityHomeUILocalizedString(@"camera.clip.offline.event");
  v24 = __AXStringForVariables();

  return v24;
}

- (id)_axReachabilityEvent
{
  objc_opt_class();
  v3 = [(HUCameraEventReachabilityCellAccessibility *)self safeValueForKey:@"reachabilityEvent"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end