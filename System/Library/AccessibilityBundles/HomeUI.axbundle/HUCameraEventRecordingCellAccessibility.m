@interface HUCameraEventRecordingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_axStringForSignificantEvents;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityValue;
@end

@implementation HUCameraEventRecordingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCameraEventRecordingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(@"camera.clip.scrub.to.start");
}

- (id)accessibilityValue
{
  objc_opt_class();
  v3 = [(HUCameraEventRecordingCellAccessibility *)self safeValueForKey:@"recordingEvent"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 duration];
  v5 = AXDurationStringForDuration();

  return v5;
}

- (id)accessibilityCustomActions
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1C390]);
  v3 = accessibilityHomeUILocalizedString(@"scrubber.timescale.toggle");
  v4 = (void *)[v2 initWithName:v3 actionHandler:&__block_literal_global_3];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v5;
}

uint64_t __69__HUCameraEventRecordingCellAccessibility_accessibilityCustomActions__block_invoke()
{
  v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:AXToggleClipTimescaleNotification object:0];

  return 1;
}

- (id)_axStringForSignificantEvents
{
  objc_opt_class();
  v3 = [(HUCameraEventRecordingCellAccessibility *)self safeValueForKey:@"recordingEvent"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = objc_msgSend(v4, "hf_sortedSignificantEvents");

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = (id)[&stru_26F6C69B8 mutableCopy];
  v6 = [MEMORY[0x263EFF910] date];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HUCameraEventRecordingCellAccessibility__axStringForSignificantEvents__block_invoke;
  v10[3] = &unk_265128168;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __72__HUCameraEventRecordingCellAccessibility__axStringForSignificantEvents__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v29 = v5;
  if (a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@", "];
    id v5 = v29;
  }
  v6 = (void *)MEMORY[0x263F47B08];
  id v7 = [v5 dateOfOccurrence];
  id v8 = [v6 attributedShortTimeStringFromDate:v7];
  v9 = [v8 string];

  v10 = (void *)MEMORY[0x263F47B08];
  id v11 = [v29 dateOfOccurrence];
  v12 = [v10 localizerKeyDayNameFromDate:v11];

  uint64_t v13 = *(void **)(a1 + 32);
  v14 = [v29 dateOfOccurrence];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 > 604800.0)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Last%@", v12];

    v12 = (void *)v17;
  }
  id v18 = [NSString stringWithFormat:@"HUCameraEventRecordingCellAccessibilityLabelSignificantEventTimeOn%@Format", v12];
  v19 = NSString;
  v20 = accessibilityHomeUILocalizedString(v18);
  v21 = objc_msgSend(v19, "stringWithFormat:", v20, v9);

  v22 = objc_msgSend(v29, "hf_faceClassificationName");
  if (v22)
  {
    v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v24 = accessibilityHomeUILocalizedString(@"HFCameraSignificantEventReasonFamiliarFace");
    objc_msgSend(v23, "appendFormat:", v24, v22, v21);
  }
  else
  {
    v25 = NSString;
    v26 = objc_msgSend(v29, "hf_reasonKey");
    v24 = [v25 stringWithFormat:@"HFCameraSignificantEventReason%@", v26];

    v27 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v28 = accessibilityHomeUILocalizedString(v24);
    objc_msgSend(v27, "appendFormat:", v28, v21);
  }
}

@end