@interface CADStateDumpModule
- (id)_storeTypeStringFromType:(int)a3;
- (void)activate;
- (void)registerForStateCapture;
@end

@implementation CADStateDumpModule

- (void)activate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CADStateDumpModule_activate__block_invoke;
  block[3] = &unk_1E624E508;
  block[4] = self;
  if (activate_onceToken != -1) {
    dispatch_once(&activate_onceToken, block);
  }
}

uint64_t __30__CADStateDumpModule_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerForStateCapture];
}

- (void)registerForStateCapture
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.calendar.eventstore.stateCaptureQ", v2);

  CalAddStateCaptureBlock();
  CalAddStateCaptureBlock();
}

id __45__CADStateDumpModule_registerForStateCapture__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v20 = (id)objc_opt_new();
  CFTypeRef cf = (CFTypeRef)CalDatabaseCreateWithOptions();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  uint64_t v1 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        v4 = (void *)CalCalendarCopyUUID();
        v5 = (__CFString *)CalCalendarCopyType();
        v6 = (__CFString *)CalCalendarCopyColorString();
        v7 = (const void *)CalCalendarCopyStore();
        v8 = (__CFString *)CalStoreCopyUUID();
        v9 = [*(id *)(a1 + 32) _storeTypeStringFromType:CalStoreGetType()];
        int IsIgnoringEventAlerts = CalCalendarIsIgnoringEventAlerts();
        if (v4)
        {
          v27[0] = @"calendarUUID";
          v27[1] = @"calendarType";
          if (v5) {
            v11 = v5;
          }
          else {
            v11 = &stru_1F1509B08;
          }
          v28[0] = v4;
          v28[1] = v11;
          if (v6) {
            v12 = v6;
          }
          else {
            v12 = &stru_1F1509B08;
          }
          v27[2] = @"colorString";
          v27[3] = @"storeUUID";
          if (v8) {
            v13 = v8;
          }
          else {
            v13 = &stru_1F1509B08;
          }
          v28[2] = v12;
          v28[3] = v13;
          if (v9) {
            v14 = v9;
          }
          else {
            v14 = &stru_1F1509B08;
          }
          v27[4] = @"storeType";
          v27[5] = @"ignoreAlerts";
          v15 = @"No";
          if (IsIgnoringEventAlerts) {
            v15 = @"Yes";
          }
          v28[4] = v14;
          v28[5] = v15;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
          [v20 setObject:v16 forKeyedSubscript:v4];
        }
        if (v7) {
          CFRelease(v7);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v2);
  }

  if (cf) {
    CFRelease(cf);
  }

  return v20;
}

id __45__CADStateDumpModule_registerForStateCapture__block_invoke_2()
{
  v0 = objc_opt_new();
  uint64_t v1 = (__CFString *)CalAlarmCopyDefaultTimedAlarmOffset();
  uint64_t v2 = (__CFString *)CalAlarmCopyDefaultAllDayAlarmOffset();
  dispatch_queue_t v3 = (const void *)CalDatabaseCreateWithOptions();
  v4 = (const void *)CalDatabaseCopyStoreForBirthdayCalendar();
  v5 = (__CFString *)CalStoreCopyDefaultAlarmOffset();
  v6 = [MEMORY[0x1E4F57440] shared];
  int v7 = objc_msgSend(v6, "get_enableTravelAdvisoriesForAutomaticBehavior");

  uint64_t v8 = [MEMORY[0x1E4F57748] ttlLocationStatus];
  if (v1) {
    v9 = v1;
  }
  else {
    v9 = @"None";
  }
  [v0 setObject:v9 forKeyedSubscript:@"defaultTimedAlarm"];
  if (v2) {
    v10 = v2;
  }
  else {
    v10 = @"None";
  }
  [v0 setObject:v10 forKeyedSubscript:@"defaultAllDayAlarm"];
  if (v5) {
    v11 = v5;
  }
  else {
    v11 = @"None";
  }
  [v0 setObject:v11 forKeyedSubscript:@"defaultBirthdayAlarm"];
  if (v7) {
    v12 = @"Yes";
  }
  else {
    v12 = @"No";
  }
  [v0 setObject:v12 forKeyedSubscript:@"timeToLeave"];
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
    v13 = @"Yes";
  }
  else {
    v13 = @"No";
  }
  [v0 setObject:v13 forKeyedSubscript:@"ttlLocationDisabled"];
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    CFRelease(v3);
  }

  return v0;
}

- (id)_storeTypeStringFromType:(int)a3
{
  if ((a3 - 1) > 5) {
    return @"Local";
  }
  else {
    return off_1E624F778[a3 - 1];
  }
}

@end