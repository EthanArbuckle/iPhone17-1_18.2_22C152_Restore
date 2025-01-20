@interface NanoCalendarPreferences
+ (NSUserDefaults)mobileCalDefaults;
+ (id)_calendarsThatAreVisible:(BOOL)a3 source:(id)a4;
+ (id)_selectedCalendarsFromAllCalendars:(id)a3 deselectedCalendarIdentifier:(id)a4 deselectedCalendarSyncIdentifiers:(id)a5 deselectedCalendarSyncHashes:(id)a6;
+ (id)appDefaults;
+ (id)calendarSyncIdentifiersFrom:(id)a3;
+ (id)currentSelectedCalendarsForEventStore:(id)a3;
+ (id)currentSelectedCalendarsForEventStore:(id)a3 filteredForFocus:(BOOL)a4;
+ (id)hiddenCalendarsInSource:(id)a3;
+ (id)overlayCalendarLocaleDisplayNames;
+ (id)overlayCalendarLocaleIDs;
+ (id)sharedPreferences;
+ (id)visibleCalendarsInSource:(id)a3;
- (BOOL)chineseOverlayCalendarIsEnabled;
- (BOOL)overlayCalendarIsEnabled;
- (NSArray)customDeselectedCalendarHashes;
- (NSArray)customDeselectedCalendarIdentifiers;
- (NSString)customOverlayCalendarID;
- (NanoCalendarPreferences)init;
- (double)defaultEventDurationInSeconds;
- (id)customDeselectedCalendarSyncIdentifiers;
- (id)lastSuspendTime;
- (id)lastViewedDate;
- (id)overlayCalendar;
- (id)overlayCalendarID;
- (void)_handleDidUnpair;
- (void)_handlePairedDeviceChanged;
- (void)_reportOverlayCalendarID:(id)a3 mirroringCompanion:(BOOL)a4;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_updateOverlayCalendarCache;
- (void)dealloc;
- (void)setCustomDeselectedCalendarHashes:(id)a3;
- (void)setCustomDeselectedCalendarIdentifiers:(id)a3;
- (void)setCustomOverlayCalendarID:(id)a3;
- (void)setLastSuspendTime:(id)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setOverlayCalendarID:(id)a3 deviceHasCompanion:(BOOL)a4;
@end

@implementation NanoCalendarPreferences

+ (id)sharedPreferences
{
  if (qword_156A8 != -1) {
    dispatch_once(&qword_156A8, &stru_10700);
  }
  v2 = (void *)qword_156A0;

  return v2;
}

- (NanoCalendarPreferences)init
{
  v9.receiver = self;
  v9.super_class = (Class)NanoCalendarPreferences;
  v2 = [(NanoCalendarPreferences *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v3;

    v5 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.mobilecal"];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v5;

    id v7 = +[EKPreferences shared];
    [(NanoCalendarPreferences *)v2 _startObserving];
  }
  return v2;
}

- (void)dealloc
{
  [(NanoCalendarPreferences *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)NanoCalendarPreferences;
  [(NanoCalendarPreferences *)&v3 dealloc];
}

- (void)_startObserving
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_updateOverlayCalendarCache" name:CUIKPreferencesNotification_OverlayCalendarID object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleDidUnpair" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handlePairedDeviceChanged" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];
}

- (void)_stopObserving
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CUIKPreferencesNotification_OverlayCalendarID object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];
}

- (id)lastViewedDate
{
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  domainAccessor = self->_domainAccessor;

  return [(NPSDomainAccessor *)domainAccessor objectForKey:@"LastViewedDate"];
}

- (void)setLastViewedDate:(id)a3
{
  [(NPSDomainAccessor *)self->_domainAccessor setObject:a3 forKey:@"LastViewedDate"];
  id v4 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (id)lastSuspendTime
{
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  domainAccessor = self->_domainAccessor;

  return [(NPSDomainAccessor *)domainAccessor objectForKey:@"LastSuspendTime"];
}

- (void)setLastSuspendTime:(id)a3
{
  [(NPSDomainAccessor *)self->_domainAccessor setObject:a3 forKey:@"LastSuspendTime"];
  id v4 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (id)customDeselectedCalendarSyncIdentifiers
{
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  domainAccessor = self->_domainAccessor;

  return [(NPSDomainAccessor *)domainAccessor objectForKey:@"CustomDeselectedCalendarIdentifiers"];
}

- (void)setCustomDeselectedCalendarIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "NanoCalendarPreferences: Set Custom Deselected Identifiers = %{public}@", (uint8_t *)&v13, 0xCu);
  }

  [(NPSDomainAccessor *)self->_domainAccessor setObject:v4 forKey:@"CustomDeselectedCalendarIdentifiers"];
  id v6 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  npsManager = self->_npsManager;
  v8 = +[NSSet setWithObject:@"CustomDeselectedCalendarIdentifiers"];
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.mobilecal" keys:v8];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, EKPreferences_Notification_DeselectedCalendarSyncHashes, 0, 0, 1u);
  id v10 = objc_alloc((Class)NSNotification);
  id v11 = [v10 initWithName:EKPreferences_Notification_DeselectedCalendarIdentifiers object:0 userInfo:0];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotification:v11];
}

- (NSArray)customDeselectedCalendarHashes
{
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  domainAccessor = self->_domainAccessor;

  return (NSArray *)[(NPSDomainAccessor *)domainAccessor objectForKey:@"CustomDeselectedCalendarHashes"];
}

- (void)setCustomDeselectedCalendarHashes:(id)a3
{
  id v4 = a3;
  id v5 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "NanoCalendarPreferences: Set Custom Deselected Hashes = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(NPSDomainAccessor *)self->_domainAccessor setObject:v4 forKey:@"CustomDeselectedCalendarHashes"];
  id v6 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  npsManager = self->_npsManager;
  v8 = +[NSSet setWithObject:@"CustomDeselectedCalendarHashes"];
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.mobilecal" keys:v8];
}

+ (id)calendarSyncIdentifiersFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "selectionSyncIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)overlayCalendarIsEnabled
{
  v2 = [(NanoCalendarPreferences *)self overlayCalendarID];
  unsigned int v3 = [v2 isEqualToString:&stru_10A50] ^ 1;
  if (v2) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)overlayCalendarID
{
  cachedOverlayCalendarID = self->_cachedOverlayCalendarID;
  if (!cachedOverlayCalendarID)
  {
    [(NanoCalendarPreferences *)self _updateOverlayCalendarCache];
    cachedOverlayCalendarID = self->_cachedOverlayCalendarID;
  }

  return cachedOverlayCalendarID;
}

- (BOOL)chineseOverlayCalendarIsEnabled
{
  v2 = [(NanoCalendarPreferences *)self overlayCalendarID];
  unsigned __int8 v3 = [v2 isEqualToString:@"chinese"];

  return v3;
}

- (id)overlayCalendar
{
  v2 = +[NanoCalendarPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 overlayCalendarID];

  BOOL v4 = +[CalChronometry activeTimeZone];
  id v5 = +[CUIKOverlayCalendar overlayCalendarForCalendarIdentifier:v3 timezone:v4];

  return v5;
}

- (NSString)customOverlayCalendarID
{
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  domainAccessor = self->_domainAccessor;

  return (NSString *)[(NPSDomainAccessor *)domainAccessor objectForKey:@"CustomOverlayCalendarID"];
}

- (void)setOverlayCalendarID:(id)a3 deviceHasCompanion:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  -[NanoCalendarPreferences _reportOverlayCalendarID:mirroringCompanion:](self, "_reportOverlayCalendarID:mirroringCompanion:");
  if (v4)
  {
    [(NPSDomainAccessor *)self->_domainAccessor setObject:v9 forKey:@"CustomOverlayCalendarID"];
    id v6 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
    npsManager = self->_npsManager;
    uint64_t v8 = +[NSSet setWithObject:@"CustomOverlayCalendarID"];
    [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.mobilecal" keys:v8];
  }
  else
  {
    uint64_t v8 = +[CUIKPreferences sharedPreferences];
    [v8 setOverlayCalendarID:v9];
  }

  [(NanoCalendarPreferences *)self _updateOverlayCalendarCache];
  +[CalWidgetUtils refreshDateWidgets];
}

- (void)_updateOverlayCalendarCache
{
  id v3 = [(NanoCalendarPreferences *)self customOverlayCalendarID];

  if (v3)
  {
    self->_cachedOverlayCalendarID = [(NanoCalendarPreferences *)self customOverlayCalendarID];
  }
  else
  {
    +[CUIKPreferences sharedPreferences];
    BOOL v4 = [(id)objc_claimAutoreleasedReturnValue() overlayCalendarID];
    cachedOverlayCalendarID = self->_cachedOverlayCalendarID;
    self->_cachedOverlayCalendarID = v4;
  }

  _objc_release_x1();
}

- (void)_reportOverlayCalendarID:(id)a3 mirroringCompanion:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[NanoCalendarPreferences sharedPreferences];
  id v7 = [v6 overlayCalendarID];

  uint64_t v8 = +[CUIKPreferences sharedPreferences];
  id v9 = [v8 overlayCalendarID];

  if (v4) {
    id v10 = v9;
  }
  else {
    id v10 = v5;
  }
  id v11 = v10;
  if ([(__CFString *)v7 isEqualToString:&stru_10A50]) {
    long long v12 = @"off";
  }
  else {
    long long v12 = v7;
  }
  long long v13 = v12;

  if ([(__CFString *)v11 isEqualToString:&stru_10A50]) {
    long long v14 = @"off";
  }
  else {
    long long v14 = v11;
  }
  long long v15 = v14;

  v16 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    int v18 = 138412802;
    v19 = v13;
    __int16 v20 = 2112;
    if (v4) {
      CFStringRef v17 = @"YES";
    }
    v21 = v15;
    __int16 v22 = 2112;
    CFStringRef v23 = v17;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "NanoCalendarPreferences: Overlay Calendar updated from \"%@\" to \"%@\", mirroringCompanion: %@", (uint8_t *)&v18, 0x20u);
  }

  +[NCSAnalyticsShared reportOverlayCalendarSet:v15 mirroringCompanion:v4];
}

+ (id)overlayCalendarLocaleIDs
{
  v2 = +[NSLocale currentLocale];
  id v3 = [v2 localeIdentifier];
  BOOL v4 = +[IntlUtility lunarCalendarsForLocaleID:v3];

  id v5 = +[NSMutableArray arrayWithArray:v4];

  return v5;
}

+ (id)overlayCalendarLocaleDisplayNames
{
  v2 = +[NanoCalendarPreferences overlayCalendarLocaleIDs];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_79E0;
  v5[3] = &unk_10728;
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v2, "count"));
  id v6 = v3;
  [v2 enumerateObjectsUsingBlock:v5];

  return v3;
}

+ (id)currentSelectedCalendarsForEventStore:(id)a3
{
  return [a1 currentSelectedCalendarsForEventStore:a3 filteredForFocus:0];
}

+ (id)currentSelectedCalendarsForEventStore:(id)a3 filteredForFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 calendarsForEntityType:0];
  if (v4)
  {
    id v6 = +[EKPreferences shared];
    id v7 = [v6 unselectedCalendarIdentifiersForFocusMode];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }
  uint64_t v8 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v24 = 138543362;
    v25 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "NanoCalendarPreferences: unselectedCalendarIdentifiersForFocusMode = %{public}@", (uint8_t *)&v24, 0xCu);
  }

  id v9 = [(id)objc_opt_class() sharedPreferences];
  id v10 = [v9 customDeselectedCalendarSyncIdentifiers];

  id v11 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v24 = 138543362;
    v25 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "NanoCalendarPreferences: customDeselectedCalendarSyncIdentifiers = %{public}@", (uint8_t *)&v24, 0xCu);
  }

  if (v10) {
    goto LABEL_9;
  }
  long long v13 = [(id)objc_opt_class() sharedPreferences];
  long long v12 = [v13 customDeselectedCalendarHashes];

  long long v14 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v24 = 138543362;
    v25 = v12;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "NanoCalendarPreferences: customDeselectedCalendarHashes = %{public}@", (uint8_t *)&v24, 0xCu);
  }

  if (!v12)
  {
    __int16 v20 = +[EKPreferences shared];
    id v10 = [v20 deselectedCalendarSyncIdentifiers];

    v21 = ncs_log_selected_calendars();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v24 = 138543362;
      v25 = v10;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "NanoCalendarPreferences: deselectedCalendarSyncIdentifiers = %{public}@", (uint8_t *)&v24, 0xCu);
    }

    if (v10)
    {
LABEL_9:
      long long v12 = 0;
      goto LABEL_14;
    }
    __int16 v22 = +[EKPreferences shared];
    long long v12 = [v22 deselectedCalendarSyncHashes];

    CFStringRef v23 = ncs_log_selected_calendars();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138543362;
      v25 = v12;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "NanoCalendarPreferences: deselectedCalendarSyncHashes = %{public}@", (uint8_t *)&v24, 0xCu);
    }
  }
  id v10 = 0;
LABEL_14:
  long long v15 = [(id)objc_opt_class() _selectedCalendarsFromAllCalendars:v5 deselectedCalendarIdentifier:v7 deselectedCalendarSyncIdentifiers:v10 deselectedCalendarSyncHashes:v12];
  v16 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = [v5 nanoPrivacyAwareDescriptionForCalendars];
    int v18 = [v15 nanoPrivacyAwareDescriptionForCalendars];
    int v24 = 138544386;
    v25 = v17;
    __int16 v26 = 2114;
    v27 = v18;
    __int16 v28 = 2114;
    v29 = v7;
    __int16 v30 = 2114;
    v31 = v10;
    __int16 v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "NanoCalendarPreferences: Computed selected calendars (All Calendars = %{public}@; Selected Calendars = %{public}@;"
      " Deselected for Focus IDs = %{public}@; Deselected Identifiers = %{public}@);  Deselected Hashes = %{public}@)",
      (uint8_t *)&v24,
      0x34u);
  }

  return v15;
}

+ (id)_selectedCalendarsFromAllCalendars:(id)a3 deselectedCalendarIdentifier:(id)a4 deselectedCalendarSyncIdentifiers:(id)a5 deselectedCalendarSyncHashes:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v28 = a6;
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
    id v26 = v11;
    id obj = v12;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v18 = [v17 calendarIdentifier];
        v19 = [v17 selectionSyncIdentifier];
        __int16 v20 = [v17 syncHash];
        v21 = ncs_log_selected_calendars();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          __int16 v22 = [v17 nanoPrivacyAwareDescription];
          *(_DWORD *)buf = 138544130;
          v35 = v22;
          __int16 v36 = 2114;
          v37 = v18;
          __int16 v38 = 2114;
          v39 = v20;
          __int16 v40 = 2114;
          v41 = v19;
          _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "Calendar: %{public}@, calendarIdentifier: %{public}@, calendarSyncHash: %{public}@, selectionSyncIdentifier: %{public}@", buf, 0x2Au);

          id v11 = v26;
        }

        if (([v10 containsObject:v18] & 1) == 0
          && ([v11 containsObject:v19] & 1) == 0
          && ([v28 containsObject:v20] & 1) == 0)
        {
          [v27 addObject:v17];
        }
      }
      id v12 = obj;
      id v14 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v14);
  }

  CFStringRef v23 = ncs_log_selected_calendars();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_B488((uint64_t)a1, v27, v23);
  }

  return v27;
}

+ (id)visibleCalendarsInSource:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() _calendarsThatAreVisible:1 source:v3];

  return v4;
}

+ (id)hiddenCalendarsInSource:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() _calendarsThatAreVisible:0 source:v3];

  return v4;
}

+ (id)_calendarsThatAreVisible:(BOOL)a3 source:(id)a4
{
  int v4 = a3;
  id v5 = [a4 allCalendars];
  id v6 = [(id)objc_opt_class() sharedPreferences];
  uint64_t v7 = [v6 customDeselectedCalendarSyncIdentifiers];

  v21 = (void *)v7;
  id v8 = [objc_alloc((Class)NSSet) initWithArray:v7];
  id v9 = [v5 allObjects];
  __int16 v22 = v5;
  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        CFStringRef v17 = [v16 selectionSyncIdentifier];
        if (v17)
        {
          if ([v8 containsObject:v17] != v4) {
            [v10 addObject:v16];
          }
        }
        else
        {
          int v18 = ncs_log_selected_calendars();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v16 calendarIdentifier];
            *(_DWORD *)buf = 138543362;
            id v28 = v19;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Calendar has no sync identifier: %{public}@", buf, 0xCu);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)_handleDidUnpair
{
  self->_domainAccessor = 0;
  _objc_release_x1();
}

- (void)_handlePairedDeviceChanged
{
  self->_domainAccessor = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.mobilecal"];

  _objc_release_x1();
}

+ (NSUserDefaults)mobileCalDefaults
{
  if (qword_156B8 != -1) {
    dispatch_once(&qword_156B8, &stru_10748);
  }
  v2 = (void *)qword_156B0;

  return (NSUserDefaults *)v2;
}

+ (id)appDefaults
{
  if (qword_156C8 != -1) {
    dispatch_once(&qword_156C8, &stru_10768);
  }
  v2 = (void *)qword_156C0;

  return v2;
}

- (double)defaultEventDurationInSeconds
{
  v2 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"defaultEventDuration"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3600.0;
  }

  return v5;
}

- (NSArray)customDeselectedCalendarIdentifiers
{
  return self->_customDeselectedCalendarIdentifiers;
}

- (void)setCustomOverlayCalendarID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOverlayCalendarID, 0);
  objc_storeStrong((id *)&self->_customDeselectedCalendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedOverlayCalendarID, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);

  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end