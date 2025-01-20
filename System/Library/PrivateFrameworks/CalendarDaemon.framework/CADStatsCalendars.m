@interface CADStatsCalendars
+ (id)eventName;
- (BOOL)calendarUsesAuthentication:(void *)a3;
- (BOOL)wantsCalendars;
- (id)eventDictionaries;
- (void)prepareWithContext:(id)a3;
- (void)processCalendars:(id)a3 inStore:(void *)a4;
@end

@implementation CADStatsCalendars

+ (id)eventName
{
  return @"cadstats.Calendar";
}

- (void)prepareWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  id v7 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  calendarInfos = self->_calendarInfos;
  self->_calendarInfos = v5;
}

- (BOOL)wantsCalendars
{
  return 1;
}

- (void)processCalendars:(id)a3 inStore:(void *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CalGetDatabaseForRecord();
  v6 = CalDatabaseGetPreferences();
  id v7 = [v6 preferences];

  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v23 = v7;
  v9 = [v7 getValueForPreference:@"LastDeselectedCalendars" expectedClass:objc_opt_class()];
  v10 = (void *)[v8 initWithArray:v9];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * v14);
        uint64_t v16 = objc_opt_new();
        [(NSMutableArray *)self->_calendarInfos addObject:v16];
        v17 = (void *)CalCalendarCopyUUID();
        *(unsigned char *)(v16 + 8) = [v10 containsObject:v17] ^ 1;

        *(unsigned char *)(v16 + 9) = CalCalendarIsHolidaySubscribedCalendar();
        *(unsigned char *)(v16 + 10) = CalCalendarIsSubscribed();
        *(unsigned char *)(v16 + 11) = CalStoreGetType() == 2;
        *(unsigned char *)(v16 + 12) = [(CADStatsCalendars *)self calendarUsesAuthentication:v15];
        *(unsigned char *)(v16 + 16) = CalCalendarIsBirthdayCalendar();
        *(unsigned char *)(v16 + 17) = CalCalendarIsFacebookBirthdayCalendar();
        *(unsigned char *)(v16 + 18) = CalCalendarIsFamilyCalendar();
        *(unsigned char *)(v16 + 19) = CalCalendarIsFoundInMailCalendar();
        *(unsigned char *)(v16 + 20) = CalCalendarIsNaturalLanguageSuggestedEventsCalendar();
        *(unsigned char *)(v16 + 15) = CalCalendarIsHidden();
        *(unsigned char *)(v16 + 13) = CalCalendarGetSharingStatus() != 0;
        *(unsigned char *)(v16 + 21) = CalCalendarGetSharingStatus() == 1;
        *(unsigned char *)(v16 + 22) = CalCalendarIsHolidaySyncedCalendar();
        *(unsigned char *)(v16 + 14) = CalCalendarCanContainEntityTypeAndStoreAllowsIt();
        *(void *)(v16 + 24) = 0;
        v18 = (unint64_t *)(v16 + 24);
        *(void *)(v16 + 32) = 0;
        CFArrayRef v19 = (const __CFArray *)CalCalendarCopySharees();
        if (v19)
        {
          CFArrayRef v20 = v19;
          CFIndex Count = CFArrayGetCount(v19);
          unint64_t *v18 = Count;
          if (Count)
          {
            unint64_t v22 = 0;
            do
            {
              CFArrayGetValueAtIndex(v20, v22);
              if ((int)CalShareeGetAccessLevel() <= 1) {
                ++*(void *)(v16 + 32);
              }
              ++v22;
            }
            while (v22 < *v18);
          }
          CFRelease(v20);
        }
        *(void *)(v16 + 40) = *(void *)(v16 + 24) - *(void *)(v16 + 32);

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
}

- (BOOL)calendarUsesAuthentication:(void *)a3
{
  v4 = (void *)CalCalendarCopySubscriptionURL();
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  v6 = [v5 user];
  if ([v6 length]) {
    goto LABEL_2;
  }
  id v8 = [v5 password];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    BOOL v7 = 1;
    goto LABEL_6;
  }
  v6 = (void *)CalCalendarCopySubCalAccountID();
  if (!v6)
  {
LABEL_12:
    BOOL v7 = 0;
    goto LABEL_3;
  }
  uint64_t v11 = [(CADStatCollectionContext *)self->_context accountStore];
  uint64_t v12 = [v11 accountWithIdentifier:v6];
  if (!v12)
  {

    goto LABEL_12;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [v12 username];
  uint64_t v15 = [v14 length];

  if (!v15) {
    goto LABEL_12;
  }
LABEL_2:
  BOOL v7 = 1;
LABEL_3:

LABEL_6:
  return v7;
}

- (id)eventDictionaries
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_calendarInfos, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = self->_calendarInfos;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v34[0] = &unk_1F151D698;
        v33[0] = @"instance";
        v33[1] = @"isSelected";
        long long v28 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 8)];
        v34[1] = v28;
        v33[2] = @"isHoliday";
        long long v27 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 9)];
        v34[2] = v27;
        v33[3] = @"isSubscribed";
        long long v26 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 10)];
        v34[3] = v26;
        v33[4] = @"isCalDAV";
        long long v25 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 11)];
        v34[4] = v25;
        v33[5] = @"isAuthenticated";
        v24 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 12)];
        v34[5] = v24;
        v33[6] = @"isShared";
        v23 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 13)];
        v34[6] = v23;
        v33[7] = @"allowsEvents";
        unint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 14)];
        v34[7] = v22;
        v33[8] = @"isHidden";
        v21 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 15)];
        v34[8] = v21;
        v33[9] = @"isBirthday";
        CFArrayRef v20 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 16)];
        v34[9] = v20;
        v33[10] = @"isFacebookBirthday";
        CFArrayRef v19 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 17)];
        v34[10] = v19;
        v33[11] = @"isFamily";
        v18 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 18)];
        v34[11] = v18;
        v33[12] = @"isFoundInMail";
        id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 19)];
        v34[12] = v5;
        v33[13] = @"isNaturalLanguageSuggestedEvents";
        v6 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 20)];
        v34[13] = v6;
        v33[14] = @"isSharedByMe";
        BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 21)];
        v34[14] = v7;
        v33[15] = @"isSyncedHolidayCalendar";
        id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v4 + 22)];
        v34[15] = v8;
        v33[16] = @"numSharees";
        uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(v4 + 24)];
        v34[16] = v9;
        v33[17] = @"readOnlySharees";
        v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(v4 + 32)];
        v34[17] = v10;
        v33[18] = @"readWriteSharees";
        uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(v4 + 40)];
        v34[18] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:19];
        [v16 addObject:v12];
      }
      uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v17);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarInfos, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end