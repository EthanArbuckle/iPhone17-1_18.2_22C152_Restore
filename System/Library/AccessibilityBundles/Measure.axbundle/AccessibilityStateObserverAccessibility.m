@interface AccessibilityStateObserverAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHasRectangleWithState:(int64_t)a3;
- (BOOL)_axNeedsAnnouncementForContinueMeasurement;
- (BOOL)axHasConfirmedRectangle;
- (BOOL)axHasSuggestedRectangle;
- (BOOL)axIsModeForMeasuring;
- (id)_axLastSnapDivisionsDescription;
- (id)_axLastSnapDivisionsLineID;
- (id)axDescriptionForNumberOfPointsAndLines;
- (id)axOrderedWorldLineIDs;
- (id)axWorldLines;
- (id)axWorldRectangles;
- (int64_t)_axLastWorldPointType;
- (void)_axSetLastSnapDivisionsDescription:(id)a3;
- (void)_axSetLastSnapDivisionsLineID:(id)a3;
- (void)_axSetLastWorldPointType:(int64_t)a3;
- (void)_axSetNeedsAnnouncementForContinueMeasurement:(BOOL)a3;
- (void)_axUpdateForState;
- (void)didUpdate;
@end

@implementation AccessibilityStateObserverAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.AccessibilityStateObserver";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"didUpdate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"snapWorldPointType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"worldLines", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"worldRectangles", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"worldPoints", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"orderedWorldLineIDs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"snapDivisionsDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"snapDivisionsLineID", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"isModeForMeasuring", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MeasureFoundation.MeasureObject", @"state", "q", 0);
  [v3 validateClass:@"MeasureFoundation.WorldPoint" isKindOfClass:@"MeasureFoundation.MeasureObject"];
  [v3 validateClass:@"MeasureFoundation.WorldRectangle" isKindOfClass:@"MeasureFoundation.MeasureObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MeasureFoundation.WorldPoint", @"lines", "@", 0);
  [v3 validateClass:@"MeasureFoundation.WorldLine" isKindOfClass:@"MeasureFoundation.MeasureObject"];
}

- (id)axDescriptionForNumberOfPointsAndLines
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v3 = [(AccessibilityStateObserverAccessibility *)self safeDictionaryForKey:@"worldLines"];
  v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = [*(id *)(*((void *)&v46 + 1) + 8 * i) safeIntegerForKey:@"state"];
        if (v11 == 9) {
          ++v7;
        }
        if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
          ++v8;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v12 = [(AccessibilityStateObserverAccessibility *)self safeDictionaryForKey:@"worldPoints"];
  v13 = [v12 allValues];

  obuint64_t j = v13;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        unint64_t v19 = [v18 safeIntegerForKey:@"state"];
        if (v19 <= 9 && ((1 << v19) & 0x245) != 0)
        {
          unint64_t v21 = v19;
          v22 = [v18 safeArrayForKey:@"lines"];
          uint64_t v23 = [v22 count];

          if (v23)
          {
            if (v21 == 9) {
              ++v40;
            }
            else {
              ++v39;
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
  }

  v24 = AXMeasureSpeakableDescriptionForLastSavedMeasurement();
  if (v24)
  {
    v25 = NSString;
    v26 = accessibilityLocalizedString(@"DID_UPDATE_POINTS");
    v27 = objc_msgSend(v25, "localizedStringWithFormat:", v26, v39 + v40, v8 + v7, v24);

    if (v40 > 0 || v7)
    {
      v28 = NSString;
      v29 = accessibilityLocalizedString(@"NUMBER_OF_POINTS");
      v30 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v40);

      v31 = NSString;
      v32 = accessibilityLocalizedString(@"NUMBER_OF_LINES");
      v33 = objc_msgSend(v31, "localizedStringWithFormat:", v32, v7);

      v34 = NSString;
      v35 = accessibilityLocalizedString(@"WILL_CLEAR_POINTS");
      v38 = objc_msgSend(v34, "localizedStringWithFormat:", v35, v30, v33);
      uint64_t v36 = __UIAXStringForVariables();

      v27 = (void *)v36;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)axWorldLines
{
  return (id)[(AccessibilityStateObserverAccessibility *)self safeDictionaryForKey:@"worldLines"];
}

- (id)axWorldRectangles
{
  return (id)[(AccessibilityStateObserverAccessibility *)self safeDictionaryForKey:@"worldRectangles"];
}

- (id)axOrderedWorldLineIDs
{
  return (id)[(AccessibilityStateObserverAccessibility *)self safeArrayForKey:@"orderedWorldLineIDs"];
}

- (BOOL)_axHasRectangleWithState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = [(AccessibilityStateObserverAccessibility *)self axWorldRectangles];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(v4, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) safeIntegerForKey:@"state"] == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)axHasConfirmedRectangle
{
  return [(AccessibilityStateObserverAccessibility *)self _axHasRectangleWithState:5];
}

- (BOOL)axHasSuggestedRectangle
{
  return [(AccessibilityStateObserverAccessibility *)self _axHasRectangleWithState:6];
}

- (BOOL)axIsModeForMeasuring
{
  return [(AccessibilityStateObserverAccessibility *)self safeBoolForKey:@"isModeForMeasuring"];
}

- (BOOL)_axNeedsAnnouncementForContinueMeasurement
{
  return MEMORY[0x270F0A438](self, &__AccessibilityStateObserverAccessibility___axNeedsAnnouncementForContinueMeasurement);
}

- (void)_axSetNeedsAnnouncementForContinueMeasurement:(BOOL)a3
{
}

- (int64_t)_axLastWorldPointType
{
  return MEMORY[0x270F0A458](self, &__AccessibilityStateObserverAccessibility___axLastWorldPointType);
}

- (void)_axSetLastWorldPointType:(int64_t)a3
{
}

- (id)_axLastSnapDivisionsLineID
{
}

- (void)_axSetLastSnapDivisionsLineID:(id)a3
{
}

- (id)_axLastSnapDivisionsDescription
{
}

- (void)_axSetLastSnapDivisionsDescription:(id)a3
{
}

- (void)didUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityStateObserverAccessibility;
  [(AccessibilityStateObserverAccessibility *)&v3 didUpdate];
  [(AccessibilityStateObserverAccessibility *)self _axUpdateForState];
}

- (void)_axUpdateForState
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24226B000, log, OS_LOG_TYPE_ERROR, "Unable to get ordered world line IDs even though snap divisions line ID was present.", v1, 2u);
}

@end