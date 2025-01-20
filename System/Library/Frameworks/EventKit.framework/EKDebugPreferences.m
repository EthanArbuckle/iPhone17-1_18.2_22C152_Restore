@interface EKDebugPreferences
+ (id)shared;
- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses;
- (BOOL)overriddenTravelAdvisoryHypothesisSupportsLiveTraffic;
- (BOOL)overrideTravelAdvisoryHypothesis;
- (BOOL)performAgendaEntryEqualityChecksInTravelEngine;
- (BOOL)preventMarkingTravelAdvisoryEntriesAsDismissed;
- (BOOL)saveGeocodedLocationsInTravelEngine;
- (BOOL)shouldBypassTravelEngineThrottle;
- (BOOL)showDepartureDateForTransitTimeToLeave;
- (BOOL)syntheticTravelAdvisoriesEnabled;
- (BOOL)verifyIntegrityOfAvailabilityTimeSearchTimelines;
- (EKDebugPreferences)init;
- (NSString)overriddenTravelAdvisoryHypothesisCurrentTrafficDensity;
- (NSString)overriddenTravelAdvisoryHypothesisRouteName;
- (NSString)overriddenTravelAdvisoryHypothesisTransportType;
- (NSString)overriddenTravelAdvisoryHypothesisTravelState;
- (double)availabilityFreshnessWindow;
- (double)overriddenTravelAdvisoryHypothesisAggressiveTravelTime;
- (double)overriddenTravelAdvisoryHypothesisConservativeTravelTime;
- (double)overriddenTravelAdvisoryHypothesisEstimatedTravelTime;
- (void)setAvailabilityFreshnessWindow:(double)a3;
- (void)setForceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a3;
- (void)setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:(double)a3;
- (void)setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:(double)a3;
- (void)setOverriddenTravelAdvisoryHypothesisCurrentTrafficDensity:(id)a3;
- (void)setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:(double)a3;
- (void)setOverriddenTravelAdvisoryHypothesisRouteName:(id)a3;
- (void)setOverriddenTravelAdvisoryHypothesisSupportsLiveTraffic:(BOOL)a3;
- (void)setOverriddenTravelAdvisoryHypothesisTransportType:(id)a3;
- (void)setOverriddenTravelAdvisoryHypothesisTravelState:(id)a3;
- (void)setOverrideTravelAdvisoryHypothesis:(BOOL)a3;
- (void)setPerformAgendaEntryEqualityChecksInTravelEngine:(BOOL)a3;
- (void)setPreventMarkingTravelAdvisoryEntriesAsDismissed:(BOOL)a3;
- (void)setSaveGeocodedLocationsInTravelEngine:(BOOL)a3;
- (void)setShouldBypassTravelEngineThrottle:(BOOL)a3;
- (void)setShowDepartureDateForTransitTimeToLeave:(BOOL)a3;
- (void)setSyntheticTravelAdvisoriesEnabled:(BOOL)a3;
- (void)setVerifyIntegrityOfAvailabilityTimeSearchTimelines:(BOOL)a3;
@end

@implementation EKDebugPreferences

+ (id)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_47);
  }
  v2 = (void *)shared_sharedPreferences_0;

  return v2;
}

uint64_t __28__EKDebugPreferences_shared__block_invoke()
{
  v0 = objc_alloc_init(EKDebugPreferences);
  uint64_t v1 = shared_sharedPreferences_0;
  shared_sharedPreferences_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (EKDebugPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKDebugPreferences;
  v2 = [(EKDebugPreferences *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F57780]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x1E4F57900]];
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overrideTravelAdvisoryHypothesis"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisTransportType"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisConservativeTravelTime"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisEstimatedTravelTime"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisAggressiveTravelTime"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisSupportsLiveTraffic"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisCurrentTrafficDensity"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisRouteName"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisTravelState"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.preventMarkingTravelAdvisoryEntriesAsDismissed"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.forceDisplayOfNewTravelAdvisoryHypotheses"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.saveGeocodedLocationsInTravelEngine"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.performAgendaEntryEqualityChecksInTravelEngine"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.verifyIntegrityOfAvailabilityTimeSearchTimelines"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.showDepartureDateForTransitTimeToLeave"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.shouldBypassTravelEngineThrottle"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkit.debug.preference.notification.syntheticTravelAdvisoriesEnabled"];
  }
  return v2;
}

- (double)availabilityFreshnessWindow
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"availabilityFreshnessWindow" expectedClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 120.0;
  }

  return v5;
}

- (void)setAvailabilityFreshnessWindow:(double)a3
{
  if (a3 >= 0.0)
  {
    id v4 = [NSNumber numberWithDouble:a3];
    [(CalPreferences *)self->_preferences setValueForPreference:@"availabilityFreshnessWindow" value:v4 notificationName:@"com.apple.eventkit.debug.preference.notification.availabilityFreshnessWindow"];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setAvailabilityFreshnessWindow:]();
  }
}

- (BOOL)saveGeocodedLocationsInTravelEngine
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"saveGeocodedLocationsInTravelEngine" defaultValue:0];
}

- (void)setSaveGeocodedLocationsInTravelEngine:(BOOL)a3
{
}

- (BOOL)overrideTravelAdvisoryHypothesis
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"overrideTravelAdvisoryHypothesis" defaultValue:0];
}

- (void)setOverrideTravelAdvisoryHypothesis:(BOOL)a3
{
}

- (NSString)overriddenTravelAdvisoryHypothesisTransportType
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisTransportType" expectedClass:v3];
}

- (void)setOverriddenTravelAdvisoryHypothesisTransportType:(id)a3
{
}

- (double)overriddenTravelAdvisoryHypothesisConservativeTravelTime
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisConservativeTravelTime" expectedClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:(double)a3
{
  if (a3 >= 0.0)
  {
    id v4 = [NSNumber numberWithDouble:a3];
    [(CalPreferences *)self->_preferences setValueForPreference:@"overriddenTravelAdvisoryHypothesisConservativeTravelTime" value:v4 notificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisConservativeTravelTime"];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:]();
  }
}

- (double)overriddenTravelAdvisoryHypothesisEstimatedTravelTime
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisEstimatedTravelTime" expectedClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:(double)a3
{
  if (a3 >= 0.0)
  {
    id v4 = [NSNumber numberWithDouble:a3];
    [(CalPreferences *)self->_preferences setValueForPreference:@"overriddenTravelAdvisoryHypothesisEstimatedTravelTime" value:v4 notificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisEstimatedTravelTime"];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:]();
  }
}

- (double)overriddenTravelAdvisoryHypothesisAggressiveTravelTime
{
  v2 = [(CalPreferences *)self->_preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisAggressiveTravelTime" expectedClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:(double)a3
{
  if (a3 >= 0.0)
  {
    id v4 = [NSNumber numberWithDouble:a3];
    [(CalPreferences *)self->_preferences setValueForPreference:@"overriddenTravelAdvisoryHypothesisAggressiveTravelTime" value:v4 notificationName:@"com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisAggressiveTravelTime"];
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:]();
  }
}

- (BOOL)overriddenTravelAdvisoryHypothesisSupportsLiveTraffic
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"overriddenTravelAdvisoryHypothesisSupportsLiveTraffic" defaultValue:0];
}

- (void)setOverriddenTravelAdvisoryHypothesisSupportsLiveTraffic:(BOOL)a3
{
}

- (NSString)overriddenTravelAdvisoryHypothesisCurrentTrafficDensity
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisCurrentTrafficDensity" expectedClass:v3];
}

- (void)setOverriddenTravelAdvisoryHypothesisCurrentTrafficDensity:(id)a3
{
}

- (NSString)overriddenTravelAdvisoryHypothesisRouteName
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisRouteName" expectedClass:v3];
}

- (void)setOverriddenTravelAdvisoryHypothesisRouteName:(id)a3
{
}

- (NSString)overriddenTravelAdvisoryHypothesisTravelState
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(CalPreferences *)preferences getValueForPreference:@"overriddenTravelAdvisoryHypothesisTravelState" expectedClass:v3];
}

- (void)setOverriddenTravelAdvisoryHypothesisTravelState:(id)a3
{
}

- (BOOL)preventMarkingTravelAdvisoryEntriesAsDismissed
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"preventMarkingTravelAdvisoryEntriesAsDismissed" defaultValue:0];
}

- (void)setPreventMarkingTravelAdvisoryEntriesAsDismissed:(BOOL)a3
{
}

- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"forceDisplayOfNewTravelAdvisoryHypotheses" defaultValue:0];
}

- (void)setForceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a3
{
}

- (BOOL)performAgendaEntryEqualityChecksInTravelEngine
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"performAgendaEntryEqualityChecksInTravelEngine" defaultValue:1];
}

- (void)setPerformAgendaEntryEqualityChecksInTravelEngine:(BOOL)a3
{
}

- (BOOL)verifyIntegrityOfAvailabilityTimeSearchTimelines
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"verifyIntegrityOfAvailabilityTimeSearchTimelines" defaultValue:0];
}

- (void)setVerifyIntegrityOfAvailabilityTimeSearchTimelines:(BOOL)a3
{
}

- (BOOL)showDepartureDateForTransitTimeToLeave
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"showDepartureDateForTransitTimeToLeave" defaultValue:1];
}

- (void)setShowDepartureDateForTransitTimeToLeave:(BOOL)a3
{
}

- (BOOL)shouldBypassTravelEngineThrottle
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"shouldBypassTravelEngineThrottle" defaultValue:0];
}

- (void)setShouldBypassTravelEngineThrottle:(BOOL)a3
{
}

- (BOOL)syntheticTravelAdvisoriesEnabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"syntheticTravelAdvisoriesEnabled" defaultValue:0];
}

- (void)setSyntheticTravelAdvisoriesEnabled:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

- (void)setAvailabilityFreshnessWindow:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Will not set an availability freshness window of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
}

- (void)setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Will not set an overridden travel advisory hypothesis conservative travel time of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
}

- (void)setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Will not set an overridden travel advisory hypothesis estimated travel time of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
}

- (void)setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Will not set an overridden travel advisory hypothesis aggressive travel time of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
}

@end