@interface CADStatsOccurrences
+ (id)eventName;
- (BOOL)wantsOccurrences;
- (id)desiredOccurrenceRange;
- (id)eventDictionaries;
- (void)prepareWithContext:(id)a3;
- (void)processOccurrences:(id)a3;
@end

@implementation CADStatsOccurrences

+ (id)eventName
{
  return @"cadstats.Occurrence";
}

- (void)prepareWithContext:(id)a3
{
  v4 = (NSMutableArray *)objc_opt_new();
  occurrenceInfos = self->_occurrenceInfos;
  self->_occurrenceInfos = v4;

  id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = (NSDate *)objc_opt_new();
  now = self->_now;
  self->_now = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F576D0]);
  v9 = [v13 dateByAddingUnit:16 value:-1 toDate:self->_now options:1024];
  v10 = [v13 dateByAddingUnit:16 value:365 toDate:self->_now options:1024];
  v11 = (CalDateRange *)[v8 initWithStartDate:v9 endDate:v10];
  desiredOccurrenceRange = self->_desiredOccurrenceRange;
  self->_desiredOccurrenceRange = v11;
}

- (BOOL)wantsOccurrences
{
  return 1;
}

- (id)desiredOccurrenceRange
{
  return self->_desiredOccurrenceRange;
}

- (void)processOccurrences:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_opt_new();
        [(NSMutableArray *)self->_occurrenceInfos addObject:v9];
        uint64_t Event = CalEventOccurrenceGetEvent();
        CalEventOccurrenceGetDate();
        double v12 = v11;
        [(NSDate *)self->_now timeIntervalSinceReferenceDate];
        double v14 = (v12 - v13) / 60.0;
        *(double *)(v9 + 72) = v14;
        *(double *)(v9 + 80) = v14 + (double)CalEventGetDuration() / 60.0;
        *(double *)(v9 + 64) = (double)CalEventGetDuration() / 60.0;
        *(unsigned char *)(v9 + 8) = CalEventIsAllDay();
        *(unsigned char *)(v9 + 11) = CalEventIsCandidateForTravelAdvisories();
        *(unsigned char *)(v9 + 12) = CalEventIsImmediatelyEligibleForTravelAdvisories();
        CFArrayRef v15 = (const __CFArray *)CalCalendarItemCopyAttendees();
        if (v15)
        {
          CFArrayRef v16 = v15;
          CFIndex Count = CFArrayGetCount(v15);
          *(void *)(v9 + 32) = Count;
          if (Count >= 1)
          {
            CFIndex v18 = Count;
            CFIndex v19 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v16, v19);
              v21 = (const void *)MEMORY[0x1C1864FC0](ValueAtIndex);
              if (v21) {
                break;
              }
              if (v18 == ++v19) {
                goto LABEL_13;
              }
            }
            *(unsigned char *)(v9 + 13) = 1;
            CFRelease(v21);
          }
LABEL_13:
          CFRelease(v16);
          if (*(void *)(v9 + 32))
          {
            uint64_t v22 = CalCalendarItemCopyOrganizer();
            if (v22)
            {
              v23 = (const void *)v22;
              *(unsigned char *)(v9 + 14) = CalOrganizerIsSelf();
              CFRelease(v23);
            }
          }
        }
        *(void *)(v9 + 56) = (int)CalEventGetParticipationStatus();
        *(void *)(v9 + 48) = CalCalendarItemGetStatus();
        CFArrayRef v24 = (const __CFArray *)MEMORY[0x1C1865E90](Event);
        if (v24)
        {
          CFArrayRef v25 = v24;
          CFIndex v26 = CFArrayGetCount(v24);
          if (v26 >= 1)
          {
            CFIndex v27 = v26;
            CFIndex v28 = 0;
            while (1)
            {
              CFArrayGetValueAtIndex(v25, v28);
              if ((CalAlarmIsDefaultAlarm() & 1) == 0) {
                break;
              }
              if (v27 == ++v28) {
                goto LABEL_23;
              }
            }
            *(unsigned char *)(v9 + 15) = 1;
          }
LABEL_23:
          CFRelease(v25);
        }
        v29 = (const void *)CalCalendarItemCopyPreferredLocation();
        *(unsigned char *)(v9 + 16) = v29 != 0;
        *(unsigned char *)(v9 + 17) = CalCalendarItemHasClientLocation();
        if (v29)
        {
          *(unsigned char *)(v9 + 18) = CalLocationHasKnownSpatialData();
          *(unsigned char *)(v9 + 19) = CalEventPreferredLocationIsAConferenceRoom();
          CFRelease(v29);
        }
        *(unsigned char *)(v9 + 20) = CalEventHasPredictedLocation();
        *(void *)(v9 + 40) = CalEventGetTravelAdvisoryBehavior();
        uint64_t v30 = CalCalendarItemCopyCalendar();
        if (v30)
        {
          v31 = (const void *)v30;
          *(unsigned char *)(v9 + 21) = CalCalendarIsIgnoringEventAlerts();
          *(unsigned char *)(v9 + 22) = CalCalendarGetSharingStatus() != 0;
          *(unsigned char *)(v9 + 9) = CalCalendarIsBirthdayCalendar();
          *(unsigned char *)(v9 + 10) = CalCalendarIsHolidaySubscribedCalendar();
          CFRelease(v31);
        }
        v32 = (const void *)CalCalendarItemCopyURL();
        *(unsigned char *)(v9 + 23) = v32 != 0;
        if (v32) {
          CFRelease(v32);
        }
        v33 = (const void *)CalCalendarItemCopyDescription();
        *(unsigned char *)(v9 + 24) = v33 != 0;
        if (v33) {
          CFRelease(v33);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v6);
  }
}

- (id)eventDictionaries
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_occurrenceInfos, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = self->_occurrenceInfos;
  uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v37;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v36 + 1) + 8 * v3);
        v41[0] = &unk_1F151D950;
        v40[0] = @"instance";
        v40[1] = @"minutesUntilStart";
        long long v34 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(v4 + 72)];
        v41[1] = v34;
        v40[2] = @"minutesUntilEnd";
        v33 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(v4 + 80)];
        v41[2] = v33;
        v40[3] = @"isAllDay";
        v32 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 8)];
        v41[3] = v32;
        v40[4] = @"isBirthday";
        v31 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 9)];
        v41[4] = v31;
        v40[5] = @"isHoliday";
        uint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 10)];
        v41[5] = v30;
        v40[6] = @"isCandidateForTravelAdvisories";
        v29 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 11)];
        v41[6] = v29;
        v40[7] = @"isImmediatelyEligibleForTravelAdvisories";
        CFIndex v28 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 12)];
        v41[7] = v28;
        v40[8] = @"hasResponseComment";
        CFIndex v27 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 13)];
        v41[8] = v27;
        v40[9] = @"organizerIsSelf";
        CFIndex v26 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 14)];
        v41[9] = v26;
        v40[10] = @"hasNonDefaultAlarm";
        CFArrayRef v25 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 15)];
        v41[10] = v25;
        v40[11] = @"hasLocation";
        CFArrayRef v24 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 16)];
        v41[11] = v24;
        v40[12] = @"hasClientLocation";
        v23 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 17)];
        v41[12] = v23;
        v40[13] = @"hasLocationWithKnownSpatialData";
        uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 18)];
        v41[13] = v22;
        v40[14] = @"hasConferenceRoomLocation";
        v21 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 19)];
        v41[14] = v21;
        v40[15] = @"hasPredictedLocation";
        v20 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 20)];
        v41[15] = v20;
        v40[16] = @"isOnCalendarThatSuppressesAlerts";
        CFIndex v19 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 21)];
        v41[16] = v19;
        v40[17] = @"isOnSharedCalendar";
        uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 22)];
        v41[17] = v5;
        v40[18] = @"hasURL";
        uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 23)];
        v41[18] = v6;
        v40[19] = @"hasNotes";
        [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 24)];
        uint64_t v7 = v35 = v3;
        v41[19] = v7;
        v40[20] = @"numAttendees";
        uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(v4 + 32)];
        v41[20] = v8;
        v40[21] = @"travelAdvisoryBehavior";
        uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v4 + 40)];
        v41[21] = v9;
        v40[22] = @"status";
        v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v4 + 48)];
        v41[22] = v10;
        v40[23] = @"participationStatus";
        double v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(v4 + 56)];
        v41[23] = v11;
        v40[24] = @"durationInMinutes";
        double v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(v4 + 64)];
        v41[24] = v12;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:25];
        [v17 addObject:v13];

        uint64_t v3 = v35 + 1;
      }
      while (v18 != v35 + 1);
      uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v18);
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredOccurrenceRange, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_occurrenceInfos, 0);
}

@end