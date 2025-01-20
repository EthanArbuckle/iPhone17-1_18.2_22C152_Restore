@interface SGNLEventSuggestionsMetrics
+ (SGMEventDateAdj_)diffEventStartDateChangedFrom:(id)a3 oldTimeZone:(id)a4 to:(id)a5 newTimeZone:(id)a6;
+ (SGMEventDurationAdj_)diffEventDurationChangedFrom:(double)a3 to:(double)a4;
+ (SGMEventLocationAdj_)diffEventLocationFrom:(id)a3 to:(id)a4;
+ (SGMEventStringAdj_)diffEventTitleChangedFrom:(id)a3 to:(id)a4;
+ (double)round:(double)a3 toSignificantFigures:(int64_t)a4;
+ (id)getAddedAttendeesCountFromEKEvent:(id)a3;
+ (id)instance;
+ (unint64_t)bucketizeInteger:(unint64_t)a3 withBucketSize:(unint64_t)a4 limit:(unint64_t)a5;
+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 eventType:(id)a5 extractionLevel:(SGMNLEventExtractionLevel_)a6 harvestedEKEvent:(id)a7 curatedEKEvent:(id)a8;
+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 eventType:(id)a5 languageID:(id)a6 startDate:(id)a7 confidenceScore:(float)a8 participantCount:(char)a9 significantSender:(SGMBoolOption_)a10 extractionLevel:(SGMNLEventExtractionLevel_)a11 usedBubblesCount:(char)a12 titleSource:(SGMEventTitleSource_)a13 titleAdj:(SGMEventStringAdj_)a14 dateAdj:(SGMEventDateAdj_)a15 duraAdj:(SGMEventDurationAdj_)a16 locationAdj:(SGMEventLocationAdj_)a17 addedAttendeesCount:(id)a18 calendarAppUsageLevel:(float)a19 mailAppUsageLevel:(char)a20 messagesAppUsageLevel:(char)a21;
+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 harvestedEKEvent:(id)a5 curatedEKEvent:(id)a6;
+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 harvestedSGEvent:(id)a5 curatedEKEvent:(id)a6;
+ (void)recordUserInteraction:(unint64_t)a3 withLinkInApplication:(int64_t)a4 eventPrefillMode:(unint64_t)a5 eventTypeClassification:(id)a6 proposedEvent:(id)a7 confirmedEvent:(id)a8;
+ (void)shownViaDataDetectorsLinkInApp:(int64_t)a3;
- (SGMDDLinkShown)ddLinkShown;
- (SGMNLEventInBanner)nlEvent;
- (SGNLEventSuggestionsMetrics)init;
- (void)setDdLinkShown:(id)a3;
- (void)setNlEvent:(id)a3;
@end

@implementation SGNLEventSuggestionsMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlEvent, 0);

  objc_storeStrong((id *)&self->_ddLinkShown, 0);
}

- (void)setNlEvent:(id)a3
{
}

- (SGMNLEventInBanner)nlEvent
{
  return self->_nlEvent;
}

- (void)setDdLinkShown:(id)a3
{
}

- (SGMDDLinkShown)ddLinkShown
{
  return self->_ddLinkShown;
}

- (SGNLEventSuggestionsMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGNLEventSuggestionsMetrics;
  v2 = [(SGNLEventSuggestionsMetrics *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SGNLEventSuggestionsMetrics *)v2 setDdLinkShown:v3];

    v4 = objc_opt_new();
    [(SGNLEventSuggestionsMetrics *)v2 setNlEvent:v4];
  }
  return v2;
}

+ (SGMEventLocationAdj_)diffEventLocationFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    if (!v5)
    {
      if (!v6 || ![v6 length]) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_9:
    uint64_t v10 = [v5 length];
    if (!v7 || v10 || ![v7 length])
    {
      if ([v5 length] && (!v7 || !objc_msgSend(v7, "length")))
      {
        v9 = &SGMEventLocationAdjRemoved;
        goto LABEL_20;
      }
LABEL_19:
      v9 = &SGMEventLocationAdjNA;
      goto LABEL_20;
    }
LABEL_18:
    v9 = &SGMEventLocationAdjAdded;
    goto LABEL_20;
  }
  if (![v5 length] || !objc_msgSend(v7, "length")) {
    goto LABEL_9;
  }
  int v8 = [v5 isEqualToString:v7];
  v9 = (uint64_t *)&SGMEventLocationAdjModified;
  if (v8) {
    v9 = (uint64_t *)&SGMEventLocationAdjConfirmed;
  }
LABEL_20:
  v11.var0 = *v9;

  return v11;
}

+ (SGMEventDurationAdj_)diffEventDurationChangedFrom:(double)a3 to:(double)a4
{
  unint64_t v4 = (unint64_t)vabdd_f64(a3, a4);
  if (v4)
  {
    if (v4 >= 0x708)
    {
      if (v4 >= 0xE10)
      {
        if (v4 >> 5 >= 0xE1) {
          id v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdjMoreThan2Hours;
        }
        else {
          id v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdj1To2Hours;
        }
      }
      else
      {
        id v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdj30To60Min;
      }
    }
    else
    {
      id v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdjLessThan30Min;
    }
  }
  else
  {
    id v5 = (SGMEventDurationAdj_ *)&SGMEventDurationAdjConfirmed;
  }
  return (SGMEventDurationAdj_)v5->var0;
}

+ (SGMEventDateAdj_)diffEventStartDateChangedFrom:(id)a3 oldTimeZone:(id)a4 to:(id)a5 newTimeZone:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"SGSuggestionsMetrics.m", 583, @"Invalid parameter not satisfying: %@", @"oldDate" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_39:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"SGSuggestionsMetrics.m", 584, @"Invalid parameter not satisfying: %@", @"newDate" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_39;
  }
LABEL_3:
  if (![v11 isEqualToDate:v13]
    || ([v12 isEqualToTimeZone:v14] & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1A6265250]();
    v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v18 = v17;
    if (v12)
    {
      [v17 setTimeZone:v12];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
      [v18 setTimeZone:v19];
    }
    v20 = [v18 components:252 fromDate:v11];
    if (v14)
    {
      [v18 setTimeZone:v14];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
      [v18 setTimeZone:v21];
    }
    v22 = [v18 components:252 fromDate:v13];
    uint64_t v23 = [v20 year];
    if (v23 == [v22 year] && (uint64_t v24 = objc_msgSend(v20, "month"), v24 == objc_msgSend(v22, "month")))
    {
      uint64_t v25 = [v20 day];
      BOOL v26 = v25 != [v22 day];
    }
    else
    {
      BOOL v26 = 1;
    }
    uint64_t v27 = [v20 hour];
    if (v27 == [v22 hour] && (uint64_t v28 = objc_msgSend(v20, "minute"), v28 == objc_msgSend(v22, "minute")))
    {
      uint64_t v29 = [v20 second];
      BOOL v30 = v29 != [v22 second];
      if (!v26) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v30 = 1;
      if (!v26)
      {
LABEL_19:
        if (v30)
        {
          [v13 timeIntervalSinceDate:v11];
          if (v31 <= -7200.0)
          {
            v32 = &SGMEventDateAdjSubTime2hPlus;
          }
          else if (v31 <= -3600.0)
          {
            v32 = &SGMEventDateAdjSubTime2h;
          }
          else if (v31 >= 0.0)
          {
            if (v31 >= 3600.0)
            {
              v32 = (uint64_t *)&SGMEventDateAdjAddTime2hPlus;
              if (v31 < 7200.0) {
                v32 = (uint64_t *)&SGMEventDateAdjAddTime2h;
              }
            }
            else
            {
              v32 = &SGMEventDateAdjAddTime1h;
            }
          }
          else
          {
            v32 = &SGMEventDateAdjSubTime1h;
          }
        }
        else
        {
          v32 = &SGMEventDateAdjConfirmed;
        }
        goto LABEL_31;
      }
    }
    if (v30) {
      v32 = (uint64_t *)&SGMEventDateAdjChangedDayAndTime;
    }
    else {
      v32 = (uint64_t *)&SGMEventDateAdjChangedDay;
    }
LABEL_31:
    v15.var0 = *v32;

    goto LABEL_32;
  }
  v15.var0 = 1;
LABEL_32:

  return v15;
}

+ (SGMEventStringAdj_)diffEventTitleChangedFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    int v8 = &SGMEventStringAdjConfirmed;
    v7 = v5;
  }
  else
  {
    v7 = v6;
    if ([v5 isEqualToString:v6])
    {
      int v8 = &SGMEventStringAdjConfirmed;
    }
    else if ([v5 length])
    {
      int v8 = &SGMEventStringAdjReplaced;
      if ([v7 length])
      {
        v9 = (void *)MEMORY[0x1A6265250]();
        uint64_t v10 = [v5 lowercaseString];

        id v11 = (void *)MEMORY[0x1A6265250]();
        id v12 = [v7 lowercaseString];

        if ([v10 isEqualToString:v12])
        {
          int v8 = &SGMEventStringAdjConfirmed;
        }
        else if ([v12 hasSuffix:v10])
        {
          int v8 = &SGMEventStringAdjPrefixAdded;
        }
        else if ([v12 hasPrefix:v10])
        {
          int v8 = (uint64_t *)&SGMEventStringAdjSuffixAdded;
        }
        v7 = v12;
        id v5 = v10;
      }
    }
    else
    {
      int v8 = &SGMEventStringAdjReplaced;
    }
  }
  v13.var0 = *v8;

  return v13;
}

+ (double)round:(double)a3 toSignificantFigures:(int64_t)a4
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    double v7 = -a3;
    if (a3 >= 0.0) {
      double v7 = a3;
    }
    double v8 = log10(v7);
    double v9 = __exp10((double)(uint64_t)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)llround(v9 * a3) / v9;
  }
  return result;
}

+ (unint64_t)bucketizeInteger:(unint64_t)a3 withBucketSize:(unint64_t)a4 limit:(unint64_t)a5
{
  if (!a4)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"SGSuggestionsMetrics.m" lineNumber:544 description:@"bucketSize must be > 0"];
  }
  if (a3 <= a5) {
    return (a3 + a4 - 1) / a4 * a4;
  }
  return a5;
}

+ (void)recordUserInteraction:(unint64_t)a3 withLinkInApplication:(int64_t)a4 eventPrefillMode:(unint64_t)a5 eventTypeClassification:(id)a6 proposedEvent:(id)a7 confirmedEvent:(id)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  if (a3 >= 4)
  {
    v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 134217984;
      unint64_t v21 = a3;
      _os_log_error_impl(&dword_1A4D8C000, v16, OS_LOG_TYPE_ERROR, "unhandled SGDDEventInteraction: %lu", (uint8_t *)&v20, 0xCu);
    }

    LOWORD(v16) = 8;
  }
  else
  {
    v16 = (0x8000800070006uLL >> (16 * a3));
  }
  if (a5 >= 5)
  {
    v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 134217984;
      unint64_t v21 = a5;
      _os_log_error_impl(&dword_1A4D8C000, v18, OS_LOG_TYPE_ERROR, "unhandled SGDDEventPrefillMode: %lu", (uint8_t *)&v20, 0xCu);
    }

    v17 = &SGMNLEventExtractionLevelNA;
  }
  else
  {
    v17 = (uint64_t *)*(&off_1E5B900D8 + a5);
  }
  if (a4 == 3) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 6;
  }
  +[SGNLEventSuggestionsMetrics recordInteractionForEventWithInterface:v19 actionType:(unsigned __int16)v16 eventType:v13 extractionLevel:*v17 harvestedEKEvent:v14 curatedEKEvent:v15];
}

+ (void)shownViaDataDetectorsLinkInApp:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v5 = [a1 instance];
    id v6 = [v5 ddLinkShown];
    double v7 = v6;
    if (a3 == 3) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 6;
    }
    if (a3 == 3) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 4;
    }
    [v6 trackEventWithScalar:1 interface:v8];

    id v15 = (id)objc_opt_new();
    [v15 setInterface:v9];
    uint64_t v10 = [MEMORY[0x1E4F93728] sharedInstance];
    [v10 trackScalarForMessage:v15];

    id v11 = [NSString alloc];
    id v12 = [v15 key];
    id v13 = (void *)[v11 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v12];

    id v14 = [v15 dictionaryRepresentation];
    AnalyticsSendEvent();
  }
  else
  {
    unint64_t v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v17 = a3;
      _os_log_error_impl(&dword_1A4D8C000, v4, OS_LOG_TYPE_ERROR, "trying to log DD link engagement from unexpected app: %lu", buf, 0xCu);
    }
  }
}

+ (id)getAddedAttendeesCountFromEKEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasAttendees])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v4 = objc_msgSend(v3, "attendees", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) participantType] == 1) {
            ++v7;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7];
  }
  else
  {
    uint64_t v10 = &unk_1EF92F718;
  }

  return v10;
}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 eventType:(id)a5 languageID:(id)a6 startDate:(id)a7 confidenceScore:(float)a8 participantCount:(char)a9 significantSender:(SGMBoolOption_)a10 extractionLevel:(SGMNLEventExtractionLevel_)a11 usedBubblesCount:(char)a12 titleSource:(SGMEventTitleSource_)a13 titleAdj:(SGMEventStringAdj_)a14 dateAdj:(SGMEventDateAdj_)a15 duraAdj:(SGMEventDurationAdj_)a16 locationAdj:(SGMEventLocationAdj_)a17 addedAttendeesCount:(id)a18 calendarAppUsageLevel:(float)a19 mailAppUsageLevel:(char)a20 messagesAppUsageLevel:(char)a21
{
  int v23 = a4;
  int v26 = a3;
  uint64_t v59 = a9;
  id v60 = a5;
  id v58 = a6;
  id v28 = a7;
  id v29 = a18;
  v57 = v28;
  if (v28 && ([v28 timeIntervalSinceNow], v30 > 0.0))
  {
    [v28 timeIntervalSinceNow];
    uint64_t v56 = [a1 bucketizeInteger:(unint64_t)(v31 / 86400.0) withBucketSize:7 limit:56];
  }
  else
  {
    uint64_t v56 = 0;
  }
  uint64_t v32 = [a1 bucketizeInteger:(unint64_t)(float)(a8 * 100.0) withBucketSize:5 limit:100];
  v55 = [a1 instance];
  v33 = [v55 nlEvent];
  if ((v26 - 1) > 0x13) {
    uint64_t v54 = 0;
  }
  else {
    uint64_t v54 = qword_1A4E19F18[(__int16)(v26 - 1)];
  }
  if ((v23 - 1) < 0xB) {
    uint64_t v34 = (unsigned __int16)(v23 - 1) + 1;
  }
  else {
    uint64_t v34 = 0;
  }
  double v35 = a19;
  uint64_t v36 = mapCalendarUsageLevel(v35);
  v37 = (void *)v36;
  if (a20 == 255)
  {
    v38 = &SGMAppUsageLevelNA;
  }
  else if (a20 - 1 >= 4)
  {
    if (a20 <= 4) {
      v38 = (uint64_t *)&SGMAppUsageLevelLow;
    }
    else {
      v38 = (uint64_t *)&SGMAppUsageLevelHigh;
    }
  }
  else
  {
    v38 = &SGMAppUsageLevelMedium;
  }
  uint64_t v39 = *v38;
  if (a21 == 255)
  {
    v40 = &SGMAppUsageLevelNA;
  }
  else if (a21 - 1 >= 4)
  {
    if (a21 <= 4) {
      v40 = (uint64_t *)&SGMAppUsageLevelLow;
    }
    else {
      v40 = (uint64_t *)&SGMAppUsageLevelHigh;
    }
  }
  else
  {
    v40 = &SGMAppUsageLevelMedium;
  }
  objc_msgSend(v33, "trackEventWithScalar:interface:actionType:eventType:languageID:daysFromStartDate:confidenceScore:significantSender:participantCount:extractionLevel:usedBubblesCount:titleSource:titleAdj:dateAdj:duraAdj:locationAdj:addedAttendeesCount:calendarAppUsageLevel:mailAppUsageLevel:messagesAppUsageLevel:", 1, v54, v34, v60, v58, v56, v32, a10.var0, (int)v59, a11.var0, a12, a13.var0, a14.var0, a15.var0, a16.var0,
    a17.var0,
    v29,
    v36,
    v39,
    *v40);

  v41 = objc_opt_new();
  [v41 setInterface:v54];
  [v41 setActionType:v34];
  [v41 setEventType:v60];
  [v41 setLanguageID:v58];
  [v41 setDaysFromStartDate:v56];
  [v41 setConfidenceScore:v32];
  [v41 setSignificantSender:a10.var0];
  [v41 setParticipantCount:v59];
  [v41 setExtractionLevel:a11.var0];
  [v41 setUsedBubblesCount:a12];
  [v41 setTitleSource:a13.var0];
  [v41 setTitleAdj:a14.var0];
  [v41 setDateAdj:a15.var0];
  [v41 setDuraAdj:a16.var0];
  [v41 setLocationAdj:a17.var0];
  [v41 setAddedAttendeesCount:v29];
  v42 = mapCalendarUsageLevel(v35);
  [v41 setCalendarAppUsageLevel:v42];

  v43 = (unsigned int *)&SGMAppUsageLevelNA;
  if (a20 <= 4) {
    v44 = (uint64_t *)&SGMAppUsageLevelLow;
  }
  else {
    v44 = (uint64_t *)&SGMAppUsageLevelHigh;
  }
  if (a20 - 1 >= 4) {
    v45 = v44;
  }
  else {
    v45 = &SGMAppUsageLevelMedium;
  }
  if (a20 != 255) {
    v43 = (unsigned int *)v45;
  }
  [v41 setMailAppUsageLevel:*v43];
  v46 = (unsigned int *)&SGMAppUsageLevelNA;
  if (a21 <= 4) {
    v47 = (uint64_t *)&SGMAppUsageLevelLow;
  }
  else {
    v47 = (uint64_t *)&SGMAppUsageLevelHigh;
  }
  if (a21 - 1 >= 4) {
    v48 = v47;
  }
  else {
    v48 = &SGMAppUsageLevelMedium;
  }
  if (a21 != 255) {
    v46 = (unsigned int *)v48;
  }
  [v41 setMessagesAppUsageLevel:*v46];
  v49 = [MEMORY[0x1E4F93728] sharedInstance];
  [v49 trackScalarForMessage:v41];

  id v50 = [NSString alloc];
  v51 = [v41 key];
  v52 = (void *)[v50 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v51];

  v53 = [v41 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 eventType:(id)a5 extractionLevel:(SGMNLEventExtractionLevel_)a6 harvestedEKEvent:(id)a7 curatedEKEvent:(id)a8
{
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  id v14 = a7;
  id v15 = a8;
  if (a5) {
    v16 = (__CFString *)a5;
  }
  else {
    v16 = @"NA";
  }
  v84 = v16;
  if (v14) {
    uint64_t v17 = v14;
  }
  else {
    uint64_t v17 = v15;
  }
  id v82 = v17;
  if (v82)
  {
    unsigned int v80 = v12;
    context = (void *)MEMORY[0x1A6265250]();
    uint64_t v18 = [v14 customObjectForKey:@"SuggestionsNLEventDictionaryKey"];
    uint64_t v19 = [v14 localCustomObjectForKey:@"SuggestionsNLEventDictionaryKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v83 = v15;
      id v20 = a1;
      if (v84 == @"NA")
      {
        uint64_t v21 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventTypeKey"];
        uint64_t v22 = (void *)v21;
        if (v21) {
          int v23 = (__CFString *)v21;
        }
        else {
          int v23 = @"NA";
        }
        a5 = v23;
      }
      uint64_t v24 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventLanguageIDKey"];
      uint64_t v25 = (void *)v24;
      if (v24) {
        int v26 = (__CFString *)v24;
      }
      else {
        int v26 = @"NA";
      }
      v78 = v26;

      uint64_t v27 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventConfidenceScoreKey"];
      [v27 floatValue];
      int v29 = v28;

      double v30 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventSignificantSenderKey"];
      uint64_t v77 = v30 != 0;

      double v31 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventParticipantCountKey"];
      char v76 = [v31 integerValue];

      uint64_t v32 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventTitleSourceKey"];
      char v33 = [v32 isEqualToString:@"SuggestionsNLEventDictionaryEventTitleSourceTemplateValue"];

      if (v33)
      {
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v36 = [v18 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventTitleSourceKey"];
        unsigned int v37 = [v36 isEqualToString:@"SuggestionsNLEventDictionaryEventTitleSourceSubjectValue"];

        uint64_t v34 = v37;
      }
      v84 = (__CFString *)a5;
      a1 = v20;
      id v15 = v83;
    }
    else
    {
      v78 = @"NA";
      uint64_t v34 = 0;
      int v29 = 0;
      char v76 = 0;
      uint64_t v77 = 2;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [v19 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryCalendarAppUsageLevelKey"];
      [v38 floatValue];
      float v35 = v39;

      v40 = [v19 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryMailAppUsageLevelKey"];
      char v75 = [v40 integerValue];

      v41 = [v19 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryMessagesAppUsageLevelKey"];
      char v74 = [v41 integerValue];
    }
    else
    {
      char v75 = -1;
      float v35 = -1.0;
      char v74 = -1;
    }

    uint64_t v12 = v80;
  }
  else
  {
    uint64_t v34 = 0;
    int v29 = 0;
    char v75 = -1;
    char v76 = 0;
    float v35 = -1.0;
    uint64_t v77 = 2;
    v78 = @"NA";
    char v74 = -1;
  }
  if (a6.var0 == 4)
  {
    a6.unint64_t var0 = 1;
    goto LABEL_31;
  }
  if (a6.var0 == 5)
  {
    a6.unint64_t var0 = 2;
LABEL_31:
    uint64_t v34 = 3;
  }
  v79 = v14;
  uint64_t v81 = v34;
  if (v14 && v15)
  {
    v42 = [v14 title];
    v43 = [v15 title];
    contexta = (void *)[a1 diffEventTitleChangedFrom:v42 to:v43];

    v44 = [v14 startDate];
    v45 = [v14 timeZone];
    v46 = [v15 startDate];
    [v15 timeZone];
    v48 = id v47 = a1;
    uint64_t v71 = [v47 diffEventStartDateChangedFrom:v44 oldTimeZone:v45 to:v46 newTimeZone:v48];

    [v14 duration];
    double v50 = v49;
    [v15 duration];
    v52 = v14;
    uint64_t v53 = [v47 diffEventDurationChangedFrom:v50 to:v51];
    uint64_t v54 = [v52 locations];
    uint64_t v55 = [v54 count];
    unint64_t var0 = a6.var0;
    if (v55)
    {
      uint64_t v56 = [v52 location];
    }
    else
    {
      uint64_t v56 = 0;
    }
    id v58 = [v15 locations];
    if ([v58 count])
    {
      [v15 location];
      uint64_t v59 = v12;
      v61 = uint64_t v60 = v11;
      uint64_t v57 = [v47 diffEventLocationFrom:v56 to:v61];

      uint64_t v11 = v60;
      uint64_t v12 = v59;
    }
    else
    {
      uint64_t v57 = [v47 diffEventLocationFrom:v56 to:0];
    }

    if (v55) {
    a6.unint64_t var0 = var0;
    }
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v53 = 0;
    if (!v15)
    {
      uint64_t v71 = 0;
      contexta = 0;
      v62 = @"NA";
      goto LABEL_47;
    }
    uint64_t v71 = 0;
    contexta = 0;
  }
  v63 = [(id)objc_opt_class() getAddedAttendeesCountFromEKEvent:v15];
  v62 = [v63 stringValue];

LABEL_47:
  v64 = objc_opt_class();
  v65 = [v82 startDate];
  BYTE1(v69) = v74;
  LOBYTE(v69) = v75;
  LOBYTE(v68) = 0;
  LODWORD(v66) = v29;
  *(float *)&double v67 = v35;
  objc_msgSend(v64, "recordInteractionForEventWithInterface:actionType:eventType:languageID:startDate:confidenceScore:participantCount:significantSender:extractionLevel:usedBubblesCount:titleSource:titleAdj:dateAdj:duraAdj:locationAdj:addedAttendeesCount:calendarAppUsageLevel:mailAppUsageLevel:messagesAppUsageLevel:", v12, v11, v84, v78, v65, v76, v66, v67, v77, a6.var0, v68, v81, contexta, v71, v53,
    v57,
    v62,
    v69);
}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 harvestedEKEvent:(id)a5 curatedEKEvent:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  id v9 = a6;
  id v10 = a5;
  [(id)objc_opt_class() recordInteractionForEventWithInterface:v8 actionType:v7 eventType:@"NA" extractionLevel:0 harvestedEKEvent:v10 curatedEKEvent:v9];
}

+ (void)recordInteractionForEventWithInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4 harvestedSGEvent:(id)a5 curatedEKEvent:(id)a6
{
  unsigned int v82 = a3;
  unsigned int v83 = a4;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v84 = a5;
  id v85 = a6;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v8 = [v84 tags];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v91 objects:v95 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    SEL v80 = a2;
    uint64_t v11 = @"NA";
    uint64_t v12 = *(void *)v92;
    int v13 = 0;
    float v14 = -1.0;
    char v89 = -1;
    char v90 = 0;
    char v87 = 0;
    char v88 = -1;
    id v15 = @"NA";
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v92 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = +[SGEntityTag resolveName:*(void *)(*((void *)&v91 + 1) + 8 * v16)];
        if ([v17 isNaturalLanguageEventTypeIdentifier])
        {
          uint64_t v18 = [v17 value];

          if (v18)
          {
            id v15 = (__CFString *)v18;
            goto LABEL_25;
          }
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:v80, a1, @"SGSuggestionsMetrics.m", 235, @"Invalid parameter not satisfying: %@", @"eventType" object file lineNumber description];
          id v15 = 0;
        }
        else if ([v17 isConfidenceScore])
        {
          uint64_t v19 = [v17 value];
          [v19 floatValue];
          int v13 = v20;
        }
        else if ([v17 isParticipantCount])
        {
          uint64_t v19 = [v17 value];
          char v90 = [v19 integerValue];
        }
        else if ([v17 isNaturalLanguageEventLanguageID])
        {
          uint64_t v21 = [v17 value];

          if (v21)
          {
            uint64_t v11 = (__CFString *)v21;
            goto LABEL_25;
          }
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:v80, a1, @"SGSuggestionsMetrics.m", 242, @"Invalid parameter not satisfying: %@", @"languageID" object file lineNumber description];
          uint64_t v11 = 0;
        }
        else if ([v17 isCalendarAppUsageLevel])
        {
          uint64_t v19 = [v17 value];
          [v19 floatValue];
          float v14 = v22;
        }
        else if ([v17 isMailAppUsageLevel])
        {
          uint64_t v19 = [v17 value];
          char v89 = [v19 integerValue];
        }
        else if ([v17 isMessagesAppUsageLevel])
        {
          uint64_t v19 = [v17 value];
          char v88 = [v19 integerValue];
        }
        else
        {
          if (![v17 isUsedBubblesCount]) {
            goto LABEL_25;
          }
          uint64_t v19 = [v17 value];
          char v87 = [v19 integerValue];
        }

LABEL_25:
        ++v16;
      }
      while (v10 != v16);
      uint64_t v23 = [v8 countByEnumeratingWithState:&v91 objects:v95 count:16];
      uint64_t v10 = v23;
      if (!v23) {
        goto LABEL_32;
      }
    }
  }
  uint64_t v11 = @"NA";
  int v13 = 0;
  float v14 = -1.0;
  char v89 = -1;
  char v90 = 0;
  char v87 = 0;
  char v88 = -1;
  id v15 = @"NA";
LABEL_32:

  uint64_t v24 = [v84 tags];
  uint64_t v25 = +[SGEntityTag significantSender];
  int v26 = [v25 name];
  unsigned int v27 = [v24 containsObject:v26];

  int v28 = [v84 tags];
  int v29 = +[SGEntityTag titleGeneratedFromTemplate];
  double v30 = [v29 name];
  char v31 = [v28 containsObject:v30];

  if (v31)
  {
    uint64_t v32 = 2;
  }
  else
  {
    char v33 = [v84 tags];
    uint64_t v34 = +[SGEntityTag titleGeneratedFromSubject];
    float v35 = [v34 name];
    unsigned int v36 = [v33 containsObject:v35];

    uint64_t v32 = v36;
  }
  uint64_t v79 = v32;
  unsigned int v37 = v27;
  if (v85)
  {
    unsigned int v78 = v27;
    v38 = [v84 title];
    float v39 = [v85 title];
    id v40 = a1;
    uint64_t v81 = [a1 diffEventTitleChangedFrom:v38 to:v39];

    v41 = [v84 start];
    v42 = [v84 startTimeZone];
    v43 = [v85 startDate];
    v44 = [v85 timeZone];
    uint64_t v76 = [a1 diffEventStartDateChangedFrom:v41 oldTimeZone:v42 to:v43 newTimeZone:v44];

    [v84 duration];
    double v46 = v45;
    [v85 duration];
    uint64_t v48 = [a1 diffEventDurationChangedFrom:v46 to:v47];
    double v49 = [(id)objc_opt_class() getAddedAttendeesCountFromEKEvent:v85];
    uint64_t v50 = [v49 stringValue];

    char v75 = [v84 locations];
    uint64_t v51 = [v75 count];
    if (v51)
    {
      char v74 = [v84 locations];
      v73 = [v74 firstObject];
      uint64_t v52 = [v73 address];
      id v40 = (id)v52;
      if (v52)
      {
        int v53 = 0;
        uint64_t v54 = (void *)v52;
      }
      else
      {
        v72 = [v84 locations];
        uint64_t v71 = [v72 firstObject];
        uint64_t v54 = [v71 label];
        int v53 = 1;
      }
    }
    else
    {
      int v53 = 0;
      uint64_t v54 = 0;
    }
    uint64_t v77 = (__CFString *)v50;
    uint64_t v60 = [v85 locationsWithoutPrediction];
    if ([v60 count])
    {
      v61 = [v85 locationWithoutPrediction];
      uint64_t v62 = [a1 diffEventLocationFrom:v54 to:v61];
    }
    else
    {
      uint64_t v62 = [a1 diffEventLocationFrom:v54 to:0];
    }
    uint64_t v63 = v48;

    if (v53)
    {
    }
    uint64_t v58 = v62;
    uint64_t v55 = v76;
    if (v51)
    {
    }
    uint64_t v57 = v84;
    unsigned int v37 = v78;
    uint64_t v59 = v77;
    uint64_t v56 = v63;
  }
  else
  {
    uint64_t v81 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = v84;
    uint64_t v58 = 0;
    uint64_t v59 = @"NA";
  }
  uint64_t v64 = v37;
  v65 = objc_opt_class();
  double v66 = [v57 start];
  BYTE1(v70) = v88;
  LOBYTE(v70) = v89;
  LOBYTE(v69) = v87;
  LODWORD(v67) = v13;
  *(float *)&double v68 = v14;
  objc_msgSend(v65, "recordInteractionForEventWithInterface:actionType:eventType:languageID:startDate:confidenceScore:participantCount:significantSender:extractionLevel:usedBubblesCount:titleSource:titleAdj:dateAdj:duraAdj:locationAdj:addedAttendeesCount:calendarAppUsageLevel:mailAppUsageLevel:messagesAppUsageLevel:", v82, v83, v15, v11, v66, v90, v67, v68, v64, 0, v69, v79, v81, v55, v56,
    v58,
    v59,
    v70);
}

+ (id)instance
{
  if (instance_onceToken != -1) {
    dispatch_once(&instance_onceToken, &__block_literal_global_7189);
  }
  v2 = (void *)instance__instance;

  return v2;
}

uint64_t __39__SGNLEventSuggestionsMetrics_instance__block_invoke()
{
  instance__instance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end