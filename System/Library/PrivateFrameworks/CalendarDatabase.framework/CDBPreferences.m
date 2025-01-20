@interface CDBPreferences
+ (id)preferencesForDirectory:(id)a3;
+ (id)sharedReadOnly;
+ (id)sharedReadWrite;
- (BOOL)get_allowUnlimitedMigrationAttempts;
- (BOOL)get_enableTravelAdvisoriesForAutomaticBehavior;
- (BOOL)get_overrideParticipantRoleConstraint;
- (BOOL)get_sqlProfileLoggingEnabled;
- (BOOL)get_suggestEventLocations;
- (BOOL)get_suggestedLocationsTestMode;
- (BOOL)has_DefaultAllDayAlarmOffset;
- (BOOL)has_DefaultTimedAlarmOffset;
- (BOOL)has_LastConfirmedSplashScreenVersionViewed;
- (BOOL)has_allowUnlimitedMigrationAttempts;
- (BOOL)has_defaultCalendarChangedReason;
- (BOOL)has_defaultCalendarChangedTimestamp;
- (BOOL)has_defaultCalendarDatabaseID;
- (BOOL)has_defaultCalendarID;
- (BOOL)has_defaultCalendarStoreUID;
- (BOOL)has_enableTravelAdvisoriesForAutomaticBehavior;
- (BOOL)has_kCalPreferredDaysToSyncKey;
- (BOOL)has_kCalRemindersPreferredDaysToSyncKey;
- (BOOL)has_migrationAttempts;
- (BOOL)has_overrideParticipantRoleConstraint;
- (BOOL)has_privacyPaneHasBeenAcknowledgedVersion;
- (BOOL)has_sqlProfileLoggingEnabled;
- (BOOL)has_suggestEventLocations;
- (BOOL)has_suggestedLocationsTestMode;
- (CDBPreferences)initWithPreferences:(id)a3;
- (CDBPreferences)initWithReadOnly:(BOOL)a3;
- (CalPreferences)preferences;
- (NSNumber)get_DefaultAllDayAlarmOffset;
- (NSNumber)get_DefaultTimedAlarmOffset;
- (NSString)get_defaultCalendarChangedReason;
- (NSString)get_defaultCalendarID;
- (int64_t)get_LastConfirmedSplashScreenVersionViewed;
- (int64_t)get_defaultCalendarChangedTimestamp;
- (int64_t)get_defaultCalendarDatabaseID;
- (int64_t)get_defaultCalendarStoreUID;
- (int64_t)get_kCalPreferredDaysToSyncKey;
- (int64_t)get_kCalRemindersPreferredDaysToSyncKey;
- (int64_t)get_migrationAttempts;
- (int64_t)get_privacyPaneHasBeenAcknowledgedVersion;
- (void)set_DefaultAllDayAlarmOffset:(id)a3;
- (void)set_DefaultTimedAlarmOffset:(id)a3;
- (void)set_LastConfirmedSplashScreenVersionViewed:(int64_t)a3;
- (void)set_allowUnlimitedMigrationAttempts:(BOOL)a3;
- (void)set_defaultCalendarChangedReason:(id)a3;
- (void)set_defaultCalendarChangedTimestamp:(int64_t)a3;
- (void)set_defaultCalendarDatabaseID:(int64_t)a3;
- (void)set_defaultCalendarID:(id)a3;
- (void)set_defaultCalendarStoreUID:(int64_t)a3;
- (void)set_enableTravelAdvisoriesForAutomaticBehavior:(BOOL)a3;
- (void)set_kCalPreferredDaysToSyncKey:(int64_t)a3;
- (void)set_kCalRemindersPreferredDaysToSyncKey:(int64_t)a3;
- (void)set_migrationAttempts:(int64_t)a3;
- (void)set_overrideParticipantRoleConstraint:(BOOL)a3;
- (void)set_privacyPaneHasBeenAcknowledgedVersion:(int64_t)a3;
- (void)set_sqlProfileLoggingEnabled:(BOOL)a3;
- (void)set_suggestEventLocations:(BOOL)a3;
- (void)set_suggestedLocationsTestMode:(BOOL)a3;
@end

@implementation CDBPreferences

+ (id)sharedReadWrite
{
  if (sharedReadWrite_onceToken != -1) {
    dispatch_once(&sharedReadWrite_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedReadWrite_sharedPreferences;
  return v2;
}

- (int64_t)get_defaultCalendarStoreUID
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"defaultCalendarStoreUID" defaultValue:0];
}

- (NSString)get_defaultCalendarID
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarID" expectedClass:objc_opt_class()];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return (NSString *)v3;
}

- (BOOL)get_sqlProfileLoggingEnabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"sqlProfileLoggingEnabled" defaultValue:0];
}

- (BOOL)get_suggestEventLocations
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"suggestEventLocations" defaultValue:1];
}

- (BOOL)get_suggestedLocationsTestMode
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"suggestedLocationsTestMode" defaultValue:0];
}

uint64_t __33__CDBPreferences_sharedReadWrite__block_invoke()
{
  sharedReadWrite_sharedPreferences = [[CDBPreferences alloc] initWithReadOnly:0];
  return MEMORY[0x1F41817F8]();
}

- (CDBPreferences)initWithReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F57780]);
  v6 = (void *)[v5 initWithDomain:*MEMORY[0x1E4F57900] readOnly:v3];
  v7 = [(CDBPreferences *)self initWithPreferences:v6];

  return v7;
}

- (CDBPreferences)initWithPreferences:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDBPreferences;
  v6 = [(CDBPreferences *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferences, a3);
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.enableTravelAdvisoriesForAutomaticBehavior"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.suggestEventLocations"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.sqlProfileLoggingEnabled"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.suggestedLocationsTestMode"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.overrideParticipantRoleConstraint"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.allowUnlimitedMigrationAttempts"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.kCalPreferredDaysToSyncKey"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.kCalRemindersPreferredDaysToSyncKey"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.LastConfirmedSplashScreenVersionViewed"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.privacyPaneHasBeenAcknowledgedVersion"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarStoreUID"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarDatabaseID"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarChangedTimestamp"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.migrationAttempts"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarID"];
    [(CalPreferences *)v7->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarChangedReason"];
  }

  return v7;
}

- (BOOL)get_overrideParticipantRoleConstraint
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"overrideParticipantRoleConstraint" defaultValue:0];
}

- (int64_t)get_kCalPreferredDaysToSyncKey
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"kCalPreferredDaysToSyncKey" defaultValue:0];
}

- (int64_t)get_defaultCalendarDatabaseID
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"defaultCalendarDatabaseID" defaultValue:0];
}

+ (id)sharedReadOnly
{
  if (sharedReadOnly_onceToken != -1) {
    dispatch_once(&sharedReadOnly_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedReadOnly_sharedPreferences;
  return v2;
}

uint64_t __32__CDBPreferences_sharedReadOnly__block_invoke()
{
  v0 = [[CDBPreferences alloc] initWithReadOnly:1];
  uint64_t v1 = sharedReadOnly_sharedPreferences;
  sharedReadOnly_sharedPreferences = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)preferencesForDirectory:(id)a3
{
  BOOL v3 = [MEMORY[0x1E4F57768] preferencesStoreForPath:a3];
  id v4 = objc_alloc(MEMORY[0x1E4F57780]);
  id v5 = (void *)[v4 initWithDomain:*MEMORY[0x1E4F57900] store:v3];
  v6 = [[CDBPreferences alloc] initWithPreferences:v5];

  return v6;
}

- (BOOL)get_enableTravelAdvisoriesForAutomaticBehavior
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"enableTravelAdvisoriesForAutomaticBehavior" defaultValue:1];
}

- (void)set_enableTravelAdvisoriesForAutomaticBehavior:(BOOL)a3
{
}

- (BOOL)has_enableTravelAdvisoriesForAutomaticBehavior
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"enableTravelAdvisoriesForAutomaticBehavior" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_suggestEventLocations:(BOOL)a3
{
}

- (BOOL)has_suggestEventLocations
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"suggestEventLocations" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_sqlProfileLoggingEnabled:(BOOL)a3
{
}

- (BOOL)has_sqlProfileLoggingEnabled
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"sqlProfileLoggingEnabled" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_suggestedLocationsTestMode:(BOOL)a3
{
}

- (BOOL)has_suggestedLocationsTestMode
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"suggestedLocationsTestMode" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_overrideParticipantRoleConstraint:(BOOL)a3
{
}

- (BOOL)has_overrideParticipantRoleConstraint
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"overrideParticipantRoleConstraint" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)get_allowUnlimitedMigrationAttempts
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"allowUnlimitedMigrationAttempts" defaultValue:0];
}

- (void)set_allowUnlimitedMigrationAttempts:(BOOL)a3
{
}

- (BOOL)has_allowUnlimitedMigrationAttempts
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"allowUnlimitedMigrationAttempts" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_kCalPreferredDaysToSyncKey:(int64_t)a3
{
}

- (BOOL)has_kCalPreferredDaysToSyncKey
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"kCalPreferredDaysToSyncKey" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)get_kCalRemindersPreferredDaysToSyncKey
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"kCalRemindersPreferredDaysToSyncKey" defaultValue:31];
}

- (void)set_kCalRemindersPreferredDaysToSyncKey:(int64_t)a3
{
}

- (BOOL)has_kCalRemindersPreferredDaysToSyncKey
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"kCalRemindersPreferredDaysToSyncKey" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)get_LastConfirmedSplashScreenVersionViewed
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"LastConfirmedSplashScreenVersionViewed" defaultValue:0];
}

- (void)set_LastConfirmedSplashScreenVersionViewed:(int64_t)a3
{
}

- (BOOL)has_LastConfirmedSplashScreenVersionViewed
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"LastConfirmedSplashScreenVersionViewed" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)get_privacyPaneHasBeenAcknowledgedVersion
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"privacyPaneHasBeenAcknowledgedVersion" defaultValue:0];
}

- (void)set_privacyPaneHasBeenAcknowledgedVersion:(int64_t)a3
{
}

- (BOOL)has_privacyPaneHasBeenAcknowledgedVersion
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"privacyPaneHasBeenAcknowledgedVersion" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_defaultCalendarStoreUID:(int64_t)a3
{
}

- (BOOL)has_defaultCalendarStoreUID
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarStoreUID" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_defaultCalendarDatabaseID:(int64_t)a3
{
}

- (BOOL)has_defaultCalendarDatabaseID
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarDatabaseID" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)get_defaultCalendarChangedTimestamp
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"defaultCalendarChangedTimestamp" defaultValue:0];
}

- (void)set_defaultCalendarChangedTimestamp:(int64_t)a3
{
}

- (BOOL)has_defaultCalendarChangedTimestamp
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarChangedTimestamp" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)get_migrationAttempts
{
  return [(CalPreferences *)self->_preferences getIntegerPreference:@"migrationAttempts" defaultValue:0];
}

- (void)set_migrationAttempts:(int64_t)a3
{
}

- (BOOL)has_migrationAttempts
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"migrationAttempts" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_defaultCalendarID:(id)a3
{
  preferences = self->_preferences;
  id v4 = (id)[a3 copy];
  [(CalPreferences *)preferences setValueForPreference:@"defaultCalendarID" value:v4 notificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarID"];
}

- (BOOL)has_defaultCalendarID
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarID" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)get_defaultCalendarChangedReason
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarChangedReason" expectedClass:objc_opt_class()];
  BOOL v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return (NSString *)v3;
}

- (void)set_defaultCalendarChangedReason:(id)a3
{
  preferences = self->_preferences;
  id v4 = (id)[a3 copy];
  [(CalPreferences *)preferences setValueForPreference:@"defaultCalendarChangedReason" value:v4 notificationName:@"com.apple.calendar.database.preference.notification.defaultCalendarChangedReason"];
}

- (BOOL)has_defaultCalendarChangedReason
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"defaultCalendarChangedReason" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSNumber)get_DefaultTimedAlarmOffset
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();
  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"DefaultTimedAlarmOffset" expectedClass:v3];
}

- (void)set_DefaultTimedAlarmOffset:(id)a3
{
  preferences = self->_preferences;
  id v4 = (id)[a3 copy];
  [(CalPreferences *)preferences setValueForPreference:@"DefaultTimedAlarmOffset" value:v4 notificationName:@"com.apple.calendar.database.preference.notification.DefaultTimedAlarmOffset"];
}

- (BOOL)has_DefaultTimedAlarmOffset
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"DefaultTimedAlarmOffset" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSNumber)get_DefaultAllDayAlarmOffset
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();
  return (NSNumber *)[(CalPreferences *)preferences getValueForPreference:@"DefaultAllDayAlarmOffset" expectedClass:v3];
}

- (void)set_DefaultAllDayAlarmOffset:(id)a3
{
  preferences = self->_preferences;
  id v4 = (id)[a3 copy];
  [(CalPreferences *)preferences setValueForPreference:@"DefaultAllDayAlarmOffset" value:v4 notificationName:@"com.apple.calendar.database.preference.notification.DefaultAllDayAlarmOffset"];
}

- (BOOL)has_DefaultAllDayAlarmOffset
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"DefaultAllDayAlarmOffset" expectedClass:objc_opt_class()];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CalPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
}

@end