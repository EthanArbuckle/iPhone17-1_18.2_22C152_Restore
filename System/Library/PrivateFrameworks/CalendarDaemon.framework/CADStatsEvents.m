@interface CADStatsEvents
+ (id)eventName;
- (BOOL)wantsEvents;
- (id)eventDictionaries;
- (void)prepareWithContext:(id)a3;
- (void)processEvents:(id)a3;
@end

@implementation CADStatsEvents

+ (id)eventName
{
  return @"cadstats.Event";
}

- (void)prepareWithContext:(id)a3
{
  v4 = (NSMutableArray *)objc_opt_new();
  self->_eventInfos = v4;
  MEMORY[0x1F41817F8](v4);
}

- (BOOL)wantsEvents
{
  return 1;
}

- (void)processEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_opt_new();
        [(NSMutableArray *)self->_eventInfos addObject:v9];
        *(unsigned char *)(v9 + 8) = CalEventIsDetached();
        *(unsigned char *)(v9 + 9) = CalCalendarItemHasRecurrenceRules();
        *(unsigned char *)(v9 + 10) = CalCalendarItemIsAllDay();
        *(void *)(v9 + 32) = (int)CalEventGetParticipationStatus();
        uint64_t v10 = CalCalendarItemCopyPreferredLocation();
        *(unsigned char *)(v9 + 13) = v10 != 0;
        if (v10)
        {
          v11 = (const void *)v10;
          *(unsigned char *)(v9 + 14) = CalLocationHasKnownSpatialData();
          CFRelease(v11);
        }
        *(unsigned char *)(v9 + 15) = CalCalendarItemHasClientLocation();
        *(unsigned char *)(v9 + 16) = CalEventPreferredLocationIsAConferenceRoom();
        *(void *)(v9 + 24) = CalEventGetTravelAdvisoryBehavior();
        *(unsigned char *)(v9 + 17) = CalEventIsCandidateForTravelAdvisories();
        *(unsigned char *)(v9 + 18) = CalEventIsImmediatelyEligibleForTravelAdvisories();
        *(unsigned char *)(v9 + 19) = CalEventHasPredictedLocation();
        uint64_t v12 = CalCalendarItemCopyCalendar();
        if (v12)
        {
          v13 = (const void *)v12;
          *(unsigned char *)(v9 + 20) = CalCalendarIsIgnoringEventAlerts();
          *(unsigned char *)(v9 + 21) = CalCalendarGetSharingStatus() != 0;
          *(unsigned char *)(v9 + 11) = CalCalendarIsBirthdayCalendar();
          *(unsigned char *)(v9 + 12) = CalCalendarIsHolidaySubscribedCalendar();
          CFRelease(v13);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)eventDictionaries
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_eventInfos, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_eventInfos;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v32[0] = &unk_1F151D938;
        v31[0] = @"instance";
        v31[1] = @"isDetached";
        v26 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 8)];
        v32[1] = v26;
        v31[2] = @"hasRecurrenceRules";
        v25 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 9)];
        v32[2] = v25;
        v31[3] = @"isAllDay";
        v24 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 10)];
        v32[3] = v24;
        v31[4] = @"isBirthday";
        v23 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 11)];
        v32[4] = v23;
        v31[5] = @"isHoliday";
        v22 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 12)];
        v32[5] = v22;
        v31[6] = @"hasLocation";
        v21 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 13)];
        v32[6] = v21;
        v31[7] = @"locationHasKnownSpatialData";
        v20 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 14)];
        v32[7] = v20;
        v31[8] = @"hasClientLocation";
        uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 15)];
        v32[8] = v19;
        v31[9] = @"preferredLocationIsAConferenceRoom";
        v18 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 16)];
        v32[9] = v18;
        v31[10] = @"isCandidateForTravelAdvisories";
        uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 17)];
        v32[10] = v5;
        v31[11] = @"isImmediatelyEligibleForTravelAdvisories";
        uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 18)];
        v32[11] = v6;
        v31[12] = @"travelAdvisoryBehavior";
        uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v4 + 24)];
        v32[12] = v7;
        v31[13] = @"participationStatus";
        uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v4 + 32)];
        v32[13] = v8;
        v31[14] = @"hasPredictedLocation";
        uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 19)];
        v32[14] = v9;
        v31[15] = @"isOnCalendarIgnoringEventAlerts";
        uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 20)];
        v32[15] = v10;
        v31[16] = @"isOnSharedCalendar";
        v11 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 21)];
        v32[16] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:17];
        [v16 addObject:v12];
      }
      uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v17);
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end