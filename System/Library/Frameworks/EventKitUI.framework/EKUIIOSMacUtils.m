@interface EKUIIOSMacUtils
+ (void)createNewEventInCalendarWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 allDay:(BOOL)a7 location:(id)a8 notes:(id)a9 url:(id)a10;
@end

@implementation EKUIIOSMacUtils

+ (void)createNewEventInCalendarWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 allDay:(BOOL)a7 location:(id)a8 notes:(id)a9 url:(id)a10
{
  BOOL v38 = a7;
  v42[6] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v39 = a8;
  id v16 = a9;
  id v17 = a10;
  v18 = (objc_class *)MEMORY[0x1E4F29230];
  id v19 = a5;
  id v20 = a4;
  v21 = (void *)[[v18 alloc] initWithActivityType:@"com.apple.calendar.event_creation"];
  [v21 setTitle:@"Creating event"];
  v22 = objc_opt_new();
  v41[0] = @"com.apple.calendarUIKit.userActivity.version";
  v41[1] = @"com.apple.calendarUIKit.userActivity.type";
  v42[0] = &unk_1F0D035B0;
  v42[1] = &unk_1F0D035C8;
  v40 = v14;
  v42[2] = v14;
  v41[2] = @"com.apple.calendarUIKit.userActivity.title";
  v41[3] = @"com.apple.calendarUIKit.userActivity.startDate";
  v23 = NSNumber;
  [v20 timeIntervalSinceReferenceDate];
  double v25 = v24;

  v26 = [v23 numberWithDouble:v25];
  v42[3] = v26;
  v41[4] = @"com.apple.calendarUIKit.userActivity.endDate";
  v27 = NSNumber;
  [v19 timeIntervalSinceReferenceDate];
  double v29 = v28;

  v30 = [v27 numberWithDouble:v29];
  v42[4] = v30;
  v41[5] = @"com.apple.calendarUIKit.userActivity.allDay";
  v31 = [NSNumber numberWithBool:v38];
  v42[5] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:6];
  [v22 addEntriesFromDictionary:v32];

  v33 = [v15 name];

  if (v33)
  {
    v34 = [v15 name];
    [v22 setObject:v34 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.timeZone"];
  }
  if (v39) {
    [v22 setObject:v39 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.location"];
  }
  if (v16) {
    [v22 setObject:v16 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.notes"];
  }
  v35 = [v17 absoluteString];

  if (v35)
  {
    v36 = [v17 absoluteString];
    [v22 setObject:v36 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.url"];
  }
  [v21 setUserInfo:v22];
  v37 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v37 openUserActivity:v21 usingApplicationRecord:0 configuration:0 completionHandler:&__block_literal_global_7];
}

void __106__EKUIIOSMacUtils_createNewEventInCalendarWithTitle_startDate_endDate_timeZone_allDay_location_notes_url___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  v5 = EKUIIOSMacLogHandle();
  v6 = v5;
  if (v4 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __106__EKUIIOSMacUtils_createNewEventInCalendarWithTitle_startDate_endDate_timeZone_allDay_location_notes_url___block_invoke_cold_1(a2, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_INFO, "Sent useractivity to create new event in Calendar!", v7, 2u);
  }
}

void __106__EKUIIOSMacUtils_createNewEventInCalendarWithTitle_startDate_endDate_timeZone_allDay_location_notes_url___block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1B3F4C000, log, OS_LOG_TYPE_ERROR, "Failed to launch useractivity, success: %d, error: %@", (uint8_t *)v3, 0x12u);
}

@end