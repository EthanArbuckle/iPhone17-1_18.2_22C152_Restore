@interface EKPreferences
+ (id)shared;
- (BOOL)_array:(id)a3 hasSameElementAsArray:(id)a4;
- (BOOL)alertInviteeDeclines;
- (BOOL)alwaysSetArrivedAndSettledForReminders;
- (BOOL)bypassSplashScreen;
- (BOOL)refiringReminderAlarmsEnabled;
- (BOOL)showCompletedReminders;
- (BOOL)showDeclinedEvents;
- (BOOL)useShortReminderRefireInterval;
- (BOOL)useShortReminderSnoozeInterval;
- (EKPreferences)init;
- (NSArray)collapsedSectionIdentifiers;
- (NSArray)customDeselectedCalendarSyncHashes;
- (NSArray)customDeselectedCalendarSyncIdentifiers;
- (NSArray)deselectedCalendarIdentifiers;
- (NSArray)deselectedCalendarSyncHashes;
- (NSArray)deselectedCalendarSyncIdentifiers;
- (NSArray)selectedCalendarIdentifiers;
- (NSArray)unselectedCalendarIdentifiersForFocusMode;
- (NSDictionary)conferenceRoomTypeIdentifiersByMRU;
- (double)travelEngineThrottlePeriod;
- (unint64_t)lastConfirmedSplashScreenVersion;
- (void)_setDeselectedCalendarIdentifiers:(id)a3;
- (void)_setDeselectedCalendarSyncHashes:(id)a3;
- (void)_setDeselectedCalendarSyncIdentifiers:(id)a3;
- (void)_setDeselectedCalendars_iOS:(id)a3;
- (void)setAlertInviteeDeclines:(BOOL)a3;
- (void)setAlwaysSetArrivedAndSettledForReminders:(BOOL)a3;
- (void)setCollapsedSectionIdentifiers:(id)a3;
- (void)setConferenceRoomTypeIdentifiersByMRU:(id)a3;
- (void)setDeselectedCalendars:(id)a3 reason:(id)a4;
- (void)setLastConfirmedSplashScreenVersion:(unint64_t)a3;
- (void)setRefiringReminderAlarmsEnabled:(BOOL)a3;
- (void)setSelectedCalendarIdentifiers:(id)a3;
- (void)setShowCompletedReminders:(BOOL)a3;
- (void)setShowDeclinedEvents:(BOOL)a3;
- (void)setTravelEngineThrottlePeriod:(double)a3;
- (void)setUnselectedCalendarIdentifiersForFocusMode:(id)a3;
- (void)setUseShortReminderRefireInterval:(BOOL)a3;
- (void)setUseShortReminderSnoozeInterval:(BOOL)a3;
@end

@implementation EKPreferences

- (NSArray)collapsedSectionIdentifiers
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"CollapsedSectionIdentifiers" expectedClass:objc_opt_class()];
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v2;
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(CalPreferences *)self->_preferences getValueForPreference:@"CollapsedSectionIdentifiers" expectedClass:objc_opt_class()];
  if ([(EKPreferences *)self _array:v5 hasSameElementAsArray:v4])
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKPreferences setCollapsedSectionIdentifiers:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    [(CalPreferences *)self->_preferences setValueForPreference:@"CollapsedSectionIdentifiers" value:v4 notificationName:0];
  }
}

- (void)_setDeselectedCalendarIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(CalPreferences *)self->_preferences getValueForPreference:@"LastDeselectedCalendars" expectedClass:objc_opt_class()];
  if ([(EKPreferences *)self _array:v5 hasSameElementAsArray:v4])
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKPreferences _setDeselectedCalendarIdentifiers:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    CalAnalyticsSendEvent();
    [(CalPreferences *)self->_preferences setValueForPreference:@"LastDeselectedCalendars" value:v4 notificationName:@"com.apple.eventkit.preference.notification.deselectedCalendarIdentifiers"];
  }
}

- (BOOL)_array:(id)a3 hasSameElementAsArray:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            if (!objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
            {
              BOOL v14 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      BOOL v14 = 1;
LABEL_14:
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSArray)unselectedCalendarIdentifiersForFocusMode
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(CalPreferences *)self->_preferences getValueForPreference:@"UnselectedCalendarIdentifiersForFocusMode" expectedClass:objc_opt_class()];
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (unint64_t)lastConfirmedSplashScreenVersion
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"LastConfirmedSplashScreenVersionViewed" defaultValue:0];
}

- (BOOL)bypassSplashScreen
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"privacyPaneBypass" defaultValue:0];
}

- (void)setDeselectedCalendars:(id)a3 reason:(id)a4
{
  v27 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    *(_DWORD *)buf = 134218242;
    uint64_t v35 = [v5 count];
    __int16 v36 = 2114;
    id v37 = v6;
    _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_DEFAULT, "Saving of %lu invisible calendars commencing: %{public}@", buf, 0x16u);
  }
  v28 = v6;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "calendarIdentifier", v27, v28);
        long long v17 = EKLogHandle;
        if (v16)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = (uint64_t)v16;
            _os_log_debug_impl(&dword_1A4E47000, v17, OS_LOG_TYPE_DEBUG, "Saving calendar identifier [%@] of invisible calendar", buf, 0xCu);
          }
          [v9 addObject:v16];
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = (uint64_t)v15;
          _os_log_error_impl(&dword_1A4E47000, v17, OS_LOG_TYPE_ERROR, "No calendar identifier found.  Will not be able to save all invisible calendars.  Calendar: [%@]", buf, 0xCu);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  [(EKPreferences *)v27 _setDeselectedCalendars_iOS:v10];
  long long v18 = +[EKPreferences shared];
  [v18 _setDeselectedCalendarIdentifiers:v9];

  long long v19 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKPreferences setDeselectedCalendars:reason:](v19, v20, v21, v22, v23, v24, v25, v26);
  }
}

- (void)_setDeselectedCalendars_iOS:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 138412290;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "calendarIdentifier", v18);
        uint64_t v12 = [v10 syncHash];
        uint64_t v13 = EKLogHandle;
        if (v12)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v12;
            __int16 v27 = 2112;
            v28 = v11;
            _os_log_debug_impl(&dword_1A4E47000, v13, OS_LOG_TYPE_DEBUG, "Saving sync hash [%@] of invisible calendar with identifier [%@]", buf, 0x16u);
          }
          [v20 addObject:v12];
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          uint64_t v26 = v10;
          _os_log_error_impl(&dword_1A4E47000, v13, OS_LOG_TYPE_ERROR, "No calendar sync hash found.  Will not be able to save all calendar sync hashes.  Calendar: [%@]", buf, 0xCu);
        }
        BOOL v14 = [v10 selectionSyncIdentifier];
        v15 = EKLogHandle;
        if (v14)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v14;
            __int16 v27 = 2112;
            v28 = v11;
            _os_log_debug_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_DEBUG, "Saving sync identifier [%@] of invisible calendar with identifier [%@]", buf, 0x16u);
          }
          [v4 addObject:v14];
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          uint64_t v26 = v10;
          _os_log_error_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_ERROR, "No calendar sync identifier found.  Will not be able to save all calendar sync identifiers.  Calendar: [%@]", buf, 0xCu);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }

  long long v16 = +[EKPreferences shared];
  [v16 _setDeselectedCalendarSyncIdentifiers:v4];

  long long v17 = +[EKPreferences shared];
  [v17 _setDeselectedCalendarSyncHashes:v20];
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)shared_sharedPreferences;

  return v2;
}

- (NSArray)deselectedCalendarIdentifiers
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"LastDeselectedCalendars" expectedClass:objc_opt_class()];
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v2;
}

- (void)_setDeselectedCalendarSyncIdentifiers:(id)a3
{
}

- (void)_setDeselectedCalendarSyncHashes:(id)a3
{
}

uint64_t __23__EKPreferences_shared__block_invoke()
{
  shared_sharedPreferences = objc_alloc_init(EKPreferences);

  return MEMORY[0x1F41817F8]();
}

- (EKPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKPreferences;
  v2 = [(EKPreferences *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F57780]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x1E4F57900]];
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.travelEngineThrottlePeriod"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.preference.notification.refiringReminderAlarmsEnabled"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.preference.notification.deselectedCalendarIdentifiers"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.preference.notification.selectedCalendarSyncHashesChanged"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.preference.notification.selectedCalendarIdentifiers"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.mobilecal.showdeclinedchanged"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.preference.notification.AlertInviteeDeclines"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"];
  }
  return v2;
}

- (double)travelEngineThrottlePeriod
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"TravelEngineThrottlePeriod" expectedClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 900.0;
  }

  return v5;
}

- (void)setTravelEngineThrottlePeriod:(double)a3
{
  if (a3 >= 0.0)
  {
    id v6 = [NSNumber numberWithDouble:a3];
    [(CalPreferences *)self->_preferences setValueForPreference:@"TravelEngineThrottlePeriod" value:v6 notificationName:@"com.apple.eventkit.debug.preference.notification.travelEngineThrottlePeriod"];
  }
  else
  {
    double v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKPreferences setTravelEngineThrottlePeriod:](v4, a3);
    }
  }
}

- (BOOL)refiringReminderAlarmsEnabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"refiringReminderAlarmsEnabled" defaultValue:1];
}

- (void)setRefiringReminderAlarmsEnabled:(BOOL)a3
{
}

- (BOOL)useShortReminderSnoozeInterval
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"useShortReminderSnoozeInterval" defaultValue:0];
}

- (void)setUseShortReminderSnoozeInterval:(BOOL)a3
{
}

- (BOOL)useShortReminderRefireInterval
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"useShortReminderRefireInterval" defaultValue:0];
}

- (void)setUseShortReminderRefireInterval:(BOOL)a3
{
}

- (BOOL)alwaysSetArrivedAndSettledForReminders
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"alwaysSetArrivedAndSettledForReminders" defaultValue:0];
}

- (void)setAlwaysSetArrivedAndSettledForReminders:(BOOL)a3
{
}

- (void)setLastConfirmedSplashScreenVersion:(unint64_t)a3
{
}

- (NSArray)deselectedCalendarSyncHashes
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(CalPreferences *)preferences getValueForPreference:@"LastDeselectedCalendarSyncHashes" expectedClass:v3];
}

- (NSArray)deselectedCalendarSyncIdentifiers
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(CalPreferences *)preferences getValueForPreference:@"LastDeselectedCalendarSyncIdentifiers" expectedClass:v3];
}

- (NSArray)selectedCalendarIdentifiers
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(CalPreferences *)preferences getValueForPreference:@"LastViewedCalendars" expectedClass:v3];
}

- (void)setSelectedCalendarIdentifiers:(id)a3
{
}

- (NSArray)customDeselectedCalendarSyncIdentifiers
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(CalPreferences *)preferences getValueForPreference:@"CustomDeselectedCalendarIdentifiers" expectedClass:v3];
}

- (NSArray)customDeselectedCalendarSyncHashes
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(CalPreferences *)preferences getValueForPreference:@"CustomDeselectedCalendarHashes" expectedClass:v3];
}

- (void)setUnselectedCalendarIdentifiersForFocusMode:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    preferences = self->_preferences;
    if (v5) {
      [(CalPreferences *)preferences setValueForPreference:@"UnselectedCalendarIdentifiersForFocusMode" value:v5 notificationName:@"com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"];
    }
    else {
      [(CalPreferences *)preferences removePreference:@"UnselectedCalendarIdentifiersForFocusMode" notificationName:@"com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"];
    }
  }
}

- (BOOL)showDeclinedEvents
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ShowDeclinedEvents" defaultValue:0];
}

- (void)setShowDeclinedEvents:(BOOL)a3
{
}

- (BOOL)showCompletedReminders
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"ShowCompletedReminders" defaultValue:1];
}

- (void)setShowCompletedReminders:(BOOL)a3
{
}

- (BOOL)alertInviteeDeclines
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"InviteeDeclineAlerts" defaultValue:1];
}

- (void)setAlertInviteeDeclines:(BOOL)a3
{
}

- (NSDictionary)conferenceRoomTypeIdentifiersByMRU
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSDictionary *)[(CalPreferences *)preferences getValueForPreference:@"conferenceRoomTypeIdentifiersByMRU" expectedClass:v3];
}

- (void)setConferenceRoomTypeIdentifiersByMRU:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setTravelEngineThrottlePeriod:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Will not set a travel lookahead interval of less than 0.  Given value: [%f]", (uint8_t *)&v2, 0xCu);
}

- (void)setCollapsedSectionIdentifiers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDeselectedCalendars:(uint64_t)a3 reason:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setDeselectedCalendarIdentifiers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end