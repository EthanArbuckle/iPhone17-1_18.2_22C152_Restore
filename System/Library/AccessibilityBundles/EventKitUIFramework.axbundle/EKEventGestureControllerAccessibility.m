@interface EKEventGestureControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_createTemporaryView:(id)a3 animated:(BOOL)a4;
- (void)_commit;
- (void)_longPress:(id)a3;
- (void)_speakNotificationIfNecessary:(id)a3 shouldSpeakWithoutInterruption:(BOOL)a4 shouldSpeakOnlyIfNotSpeaking:(BOOL)a5;
- (void)_update;
@end

@implementation EKEventGestureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventGestureController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventGestureController", @"_createTemporaryView:animated:", "@", "@", "B", 0);
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_isNewEvent" withType:"B"];
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_delegate" withType:"<EKEventGestureControllerDelegate>"];
  objc_opt_class();
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_latestTouchPoint" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  objc_opt_class();
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_touchOffset" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_currentDragType" withType:"i"];
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_draggingView" withType:"EKDayOccurrenceView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventGestureController", @"_longPress:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventGestureController", @"_update", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventGestureController", @"_commit", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"occurrence", "@", 0);
  [v3 validateProtocol:@"EKEventGestureControllerDelegate" hasRequiredInstanceMethod:@"eventGestureController:dateAtPoint:"];
}

- (void)_longPress:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventGestureControllerAccessibility;
  id v4 = a3;
  [(EKEventGestureControllerAccessibility *)&v8 _longPress:v4];
  uint64_t v5 = objc_msgSend(v4, "state", v8.receiver, v8.super_class);

  if (v5 == 1)
  {
    unsigned int v6 = [(EKEventGestureControllerAccessibility *)self safeIntForKey:@"_currentDragType"];
    if (v6 > 2)
    {
      v7 = 0;
    }
    else
    {
      v7 = accessibilityLocalizedString(off_26511E648[v6]);
    }
    UIAccessibilitySpeak();
  }
}

- (void)_update
{
  v50.receiver = self;
  v50.super_class = (Class)EKEventGestureControllerAccessibility;
  [(EKEventGestureControllerAccessibility *)&v50 _update];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(EKEventGestureControllerAccessibility *)self safeValueForKey:@"_delegate"];
    if (!v3)
    {
LABEL_12:

      return;
    }
    int v4 = [(EKEventGestureControllerAccessibility *)self safeIntForKey:@"_currentDragType"];
    uint64_t v5 = [(EKEventGestureControllerAccessibility *)self safeValueForKey:@"_latestTouchPoint"];
    [v5 pointValue];
    double v7 = v6;
    double v9 = v8;

    v10 = [(EKEventGestureControllerAccessibility *)self safeValueForKey:@"_touchOffset"];
    [v10 pointValue];
    double v12 = v11;
    double v14 = v13;

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3010000000;
    v49[3] = "";
    *(double *)&v49[4] = v7 - v12;
    *(double *)&v49[5] = v9 - v14;
    objc_opt_class();
    v15 = [(EKEventGestureControllerAccessibility *)self safeValueForKeyPath:@"_draggingView.occurrence"];
    v16 = __UIAccessibilityCastAsClass();

    if (v4 == 2)
    {
      [v16 duration];
      uint64_t v18 = v17;
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __48__EKEventGestureControllerAccessibility__update__block_invoke;
      v44 = &unk_26511E600;
      v47 = v49;
      id v45 = v3;
      v46 = self;
      uint64_t v48 = v18;
      AXPerformSafeBlock();
    }
    v19 = (void *)MEMORY[0x263EFF910];
    uint64_t v37 = 0;
    v38 = (double *)&v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    uint64_t v35 = MEMORY[0x263EF8330];
    id v36 = v3;
    AXPerformSafeBlock();
    double v20 = v38[3];

    _Block_object_dispose(&v37, 8);
    v21 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:", v20, v35, 3221225472, __48__EKEventGestureControllerAccessibility__update__block_invoke_2, &unk_26511E628);
    v22 = [MEMORY[0x263EFF8F0] currentCalendar];
    v23 = [v22 components:254 fromDate:v21];
    objc_msgSend(v23, "setMinute:", (int)(floor(((double)objc_msgSend(v23, "minute") + 7.5) / 15.0) * 15.0));
    v24 = [v22 dateFromComponents:v23];
    v25 = v24;
    if (v4 == 2)
    {
      v31 = [v16 startDate];
      [v31 timeIntervalSince1970];
      double v27 = v32;

      [v25 timeIntervalSince1970];
      double v30 = v33;
    }
    else
    {
      if (v4) {
        goto LABEL_10;
      }
      [v24 timeIntervalSince1970];
      double v27 = v26;
      v28 = [v16 endDate];
      [v28 timeIntervalSince1970];
      double v30 = v29;
    }
    if (v30 - v27 < 1800.0)
    {
LABEL_11:

      _Block_object_dispose(v49, 8);
      goto LABEL_12;
    }
LABEL_10:
    v34 = [v25 _accessibilityTimeString];
    [(EKEventGestureControllerAccessibility *)self _speakNotificationIfNecessary:v34 shouldSpeakWithoutInterruption:0 shouldSpeakOnlyIfNotSpeaking:1];

    goto LABEL_11;
  }
}

double __48__EKEventGestureControllerAccessibility__update__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) eventGestureController:*(void *)(a1 + 40) heightForOccurrenceViewOfDuration:*(double *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = round(v2) + *(double *)(v3 + 40);
  *(double *)(v3 + 40) = result;
  return result;
}

uint64_t __48__EKEventGestureControllerAccessibility__update__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "eventGestureController:dateAtPoint:", *(void *)(a1 + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (void)_commit
{
  int v3 = [(EKEventGestureControllerAccessibility *)self safeIntForKey:@"_currentDragType"];
  v12.receiver = self;
  v12.super_class = (Class)EKEventGestureControllerAccessibility;
  [(EKEventGestureControllerAccessibility *)&v12 _commit];
  objc_opt_class();
  int v4 = [(EKEventGestureControllerAccessibility *)self safeValueForKeyPath:@"_draggingView.occurrence"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  double v6 = [v5 startDate];
  if (v3 == 2)
  {
    uint64_t v7 = [v5 endDate];

    double v8 = AXDateStringForFormat();
    double v9 = @"ended.end.time.adjust";
    double v6 = (void *)v7;
  }
  else
  {
    double v8 = AXDateStringForFormat();
    if (v3 == 1)
    {
      double v9 = @"ended.time.adjust";
    }
    else
    {
      if (v3)
      {
        v10 = 0;
        goto LABEL_8;
      }
      double v9 = @"ended.start.time.adjust";
    }
  }
  v10 = accessibilityLocalizedString(v9);
LABEL_8:
  double v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v8);
  [(EKEventGestureControllerAccessibility *)self _speakNotificationIfNecessary:v11 shouldSpeakWithoutInterruption:1 shouldSpeakOnlyIfNotSpeaking:0];
}

- (void)_speakNotificationIfNecessary:(id)a3 shouldSpeakWithoutInterruption:(BOOL)a4 shouldSpeakOnlyIfNotSpeaking:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  double v8 = [(EKEventGestureControllerAccessibility *)self _accessibilityValueForKey:@"lastNotificationString"];
  if (([v9 isEqualToString:v8] & 1) == 0)
  {
    if (v6)
    {
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
    else if (v5)
    {
      UIAccessibilitySpeakIfNotSpeaking();
    }
    else
    {
      UIAccessibilitySpeak();
    }
  }
  [(EKEventGestureControllerAccessibility *)self _accessibilitySetRetainedValue:v9 forKey:@"lastNotificationString"];
}

- (id)_createTemporaryView:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventGestureControllerAccessibility;
  int v4 = [(EKEventGestureControllerAccessibility *)&v6 _createTemporaryView:a3 animated:a4];
  [v4 setIsAccessibilityElement:0];

  return v4;
}

@end