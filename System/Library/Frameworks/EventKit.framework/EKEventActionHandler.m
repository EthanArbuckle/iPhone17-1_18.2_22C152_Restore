@interface EKEventActionHandler
+ (id)_displayStringForDate:(id)a3;
+ (id)_logHandle;
+ (id)sharedInstance;
- (id)_intentForAction:(id)a3 onEvent:(id)a4;
- (id)createEventIntentForEvent:(id)a3;
- (id)createEventIntentForEvent:(id)a3 withSuggestionsInfoUniqueKey:(id)a4;
- (void)donateInteractionForAction:(id)a3 onEvent:(id)a4;
- (void)donatePredictiveAction:(id)a3 forEvent:(id)a4;
- (void)handleEventCreation:(id)a3;
- (void)handleEventDeletion:(id)a3;
- (void)handleEventUpdate:(id)a3;
- (void)prepareForEventUpdate:(id)a3;
- (void)removeInteractionsForCalendar:(id)a3;
@end

@implementation EKEventActionHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_58);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __38__EKEventActionHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(EKEventActionHandler);
  uint64_t v1 = sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_logHandle
{
  if (_logHandle_onceToken != -1) {
    dispatch_once(&_logHandle_onceToken, &__block_literal_global_9_5);
  }
  v2 = (void *)_logHandle_handle;

  return v2;
}

uint64_t __34__EKEventActionHandler__logHandle__block_invoke()
{
  os_log_t v0 = os_log_create("EventKit", "EKEventActionHandler");
  uint64_t v1 = _logHandle_handle;
  _logHandle_handle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)handleEventCreation:(id)a3
{
  id v4 = a3;
  [(EKEventActionHandler *)self donateInteractionForAction:@"createEvent" onEvent:v4];
  [(EKEventActionHandler *)self donatePredictiveAction:@"createEvent" forEvent:v4];
}

- (void)prepareForEventUpdate:(id)a3
{
}

- (void)handleEventUpdate:(id)a3
{
}

- (void)handleEventDeletion:(id)a3
{
}

- (void)removeInteractionsForCalendar:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F30508];
  v5 = [v3 calendarIdentifier];
  [v4 deleteInteractionsWithGroupIdentifier:v5 completion:0];

  v6 = [(id)objc_opt_class() _logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v3 calendarIdentifier];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_INFO, "Deleting previous interactions on calendar %@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_intentForAction:(id)a3 onEvent:(id)a4
{
  id v5 = a3;
  v6 = +[EKDuetSignalEventSerializer serializedEventWithEvent:a4];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F304D0]) initWithDomain:@"Calendar" verb:v5 parametersByName:v6];

  return v7;
}

- (void)donateInteractionForAction:(id)a3 onEvent:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(EKEventActionHandler *)self _intentForAction:a3 onEvent:v6];
  if (v7)
  {
    int v8 = [v6 calendarItemIdentifier];
    v9 = [v7 verb];
    int v10 = [v9 isEqualToString:@"deleteEvent"];

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F30508];
      v23[0] = v8;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [v11 deleteInteractionsWithIdentifiers:v12 completion:0];

      v13 = [(id)objc_opt_class() _logHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1A4E47000, v13, OS_LOG_TYPE_INFO, "Deleting previous interactions on event %@", (uint8_t *)&v19, 0xCu);
      }
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v7 response:0];
    [v14 setIdentifier:v8];
    v15 = [v6 calendar];
    v16 = [v15 calendarIdentifier];
    [v14 setGroupIdentifier:v16];

    [v14 donateInteractionWithCompletion:0];
    v17 = [(id)objc_opt_class() _logHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v7 verb];
      int v19 = 138412546;
      v20 = v18;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1A4E47000, v17, OS_LOG_TYPE_INFO, "Donated interaction for action %@ on event %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)donatePredictiveAction:(id)a3 forEvent:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  int v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.mobilecal"];

  if (v9 && [v15 isEqualToString:@"createEvent"])
  {
    int v10 = [(EKEventActionHandler *)self createEventIntentForEvent:v6];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v10 response:0];
    v12 = [v6 calendarItemIdentifier];
    [v11 setIdentifier:v12];

    v13 = [v6 calendar];
    v14 = [v13 calendarIdentifier];
    [v11 setGroupIdentifier:v14];

    [v11 donateInteractionWithCompletion:0];
  }
}

- (id)createEventIntentForEvent:(id)a3
{
  return [(EKEventActionHandler *)self createEventIntentForEvent:a3 withSuggestionsInfoUniqueKey:0];
}

+ (id)_displayStringForDate:(id)a3
{
  id v4 = a3;
  if (_displayStringForDate__onceToken != -1) {
    dispatch_once(&_displayStringForDate__onceToken, &__block_literal_global_36);
  }
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = a1;
  objc_sync_enter(v6);
  v7 = [v5 localeIdentifier];
  int v8 = [(id)_displayStringForDate__cachedLocale localeIdentifier];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    int v10 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEMMMdjmm" options:0 locale:v5];
    [(id)_displayStringForDate__dateFormatter setDateFormat:v10];

    objc_storeStrong((id *)&_displayStringForDate__cachedLocale, v5);
  }
  v11 = [(id)_displayStringForDate__dateFormatter stringFromDate:v4];
  objc_sync_exit(v6);

  return v11;
}

uint64_t __46__EKEventActionHandler__displayStringForDate___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _displayStringForDate__dateFormatter;
  _displayStringForDate__dateFormatter = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)createEventIntentForEvent:(id)a3 withSuggestionsInfoUniqueKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = NSString;
  int v8 = [v5 startDate];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;
  v11 = [v5 startTimeZone];
  v12 = [v11 name];
  v13 = [v7 stringWithFormat:@"%f#%@", v10, v12];

  v14 = NSString;
  id v15 = [v5 endDateUnadjustedForLegacyClients];
  [v15 timeIntervalSinceReferenceDate];
  uint64_t v17 = v16;
  v18 = [v5 endTimeZone];
  int v19 = [v18 name];
  v20 = [v14 stringWithFormat:@"%f#%@", v17, v19];

  if (v6)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%@#%@", v13, v6];

    v13 = (void *)v21;
  }
  v22 = objc_alloc_init(EKUICreateEventIntent);
  id v23 = objc_alloc(MEMORY[0x1E4F30568]);
  v24 = objc_opt_class();
  v25 = [v5 startDate];
  v26 = [v24 _displayStringForDate:v25];
  v27 = (void *)[v23 initWithIdentifier:v13 displayString:v26];

  id v28 = objc_alloc(MEMORY[0x1E4F30568]);
  v29 = objc_opt_class();
  v30 = [v5 endDateUnadjustedForLegacyClients];
  v31 = [v29 _displayStringForDate:v30];
  v32 = (void *)[v28 initWithIdentifier:v20 displayString:v31];

  v33 = [v5 title];
  [(EKUICreateEventIntent *)v22 setTitle:v33];

  [(EKUICreateEventIntent *)v22 setStartDate:v27];
  [(EKUICreateEventIntent *)v22 setEndDate:v32];
  v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isAllDay"));
  [(EKUICreateEventIntent *)v22 setAllDay:v34];

  [(EKUICreateEventIntent *)v22 _setLaunchId:@"com.apple.mobilecal"];
  v35 = EKBundle();
  v36 = [v35 localizedStringForKey:@"Create event" value:&stru_1EF932508 table:0];
  [(EKUICreateEventIntent *)v22 setSuggestedInvocationPhrase:v36];

  v37 = [v5 structuredLocation];

  if (v37)
  {
    v38 = [v5 structuredLocation];
    v39 = [v38 title];
    [(EKUICreateEventIntent *)v22 setLocationName:v39];

    v40 = [v5 structuredLocation];
    v41 = [v40 address];
    [(EKUICreateEventIntent *)v22 setLocationAddress:v41];

    v42 = [v5 structuredLocation];
    v43 = [v42 geoLocation];

    if (v43)
    {
      id v44 = objc_alloc((Class)EKWeakLinkClass());
      v45 = [v5 structuredLocation];
      v46 = [v45 geoLocation];
      v47 = (void *)[v44 initWithLocation:v46 addressDictionary:0 region:0 areasOfInterest:0];
      [(EKUICreateEventIntent *)v22 setGeolocation:v47];
    }
  }

  return v22;
}

@end