@interface AWDProactiveAppPredictionSession
+ (Class)appSequenceType;
- (BOOL)hasABGroup;
- (BOOL)hasAPREngagementType;
- (BOOL)hasAPRFeedbackSource;
- (BOOL)hasAPRSiriExperience;
- (BOOL)hasConsumerSubType;
- (BOOL)hasConsumerType;
- (BOOL)hasCoreMotionCurrentMotionLaunches;
- (BOOL)hasCoreMotionLaunches;
- (BOOL)hasCurrentLOIType;
- (BOOL)hasDayOfWeek;
- (BOOL)hasEngagedApp;
- (BOOL)hasInAirplaneMode;
- (BOOL)hasIntentType;
- (BOOL)hasIsInternalBuild;
- (BOOL)hasLocationDistanceFromGym;
- (BOOL)hasLocationDistanceFromHome;
- (BOOL)hasLocationDistanceFromSchool;
- (BOOL)hasLocationDistanceFromWork;
- (BOOL)hasOutcome;
- (BOOL)hasPredictionCacheAge;
- (BOOL)hasSessionId;
- (BOOL)hasSessionLogVersion;
- (BOOL)hasTimeOfDayInterval;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalAirplaneModeLaunches;
- (BOOL)hasTotalCurrentDayOfWeekLaunches;
- (BOOL)hasTotalDayOfWeekLaunches;
- (BOOL)hasTotalLaunchSequences;
- (BOOL)hasTotalLaunches;
- (BOOL)hasTotalSSIDLaunches;
- (BOOL)hasTotalSpotlightLaunches;
- (BOOL)hasTotalSpotlightTimeOfDayLaunches;
- (BOOL)hasTotalTimeOfDayLaunches;
- (BOOL)hasTotalTrendingLaunches;
- (BOOL)hasTotalWifiLaunches;
- (BOOL)inAirplaneMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalBuild;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appSequences;
- (NSString)aBGroup;
- (NSString)aPREngagementType;
- (NSString)aPRFeedbackSource;
- (NSString)aPRSiriExperience;
- (NSString)consumerType;
- (NSString)intentType;
- (NSString)sessionId;
- (id)appSequenceAtIndex:(unint64_t)a3;
- (id)consumerSubTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentLOITypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outcomeAsString:(int)a3;
- (int)StringAsConsumerSubType:(id)a3;
- (int)StringAsCurrentLOIType:(id)a3;
- (int)StringAsOutcome:(id)a3;
- (int)consumerSubType;
- (int)coreMotionCurrentMotionLaunches;
- (int)coreMotionLaunches;
- (int)currentLOIType;
- (int)dayOfWeek;
- (int)engagedApp;
- (int)locationDistanceFromGym;
- (int)locationDistanceFromHome;
- (int)locationDistanceFromSchool;
- (int)locationDistanceFromWork;
- (int)outcome;
- (int)predictionCacheAge;
- (int)sessionLogVersion;
- (int)timeOfDayInterval;
- (int)totalAirplaneModeLaunches;
- (int)totalCurrentDayOfWeekLaunches;
- (int)totalDayOfWeekLaunches;
- (int)totalLaunchSequences;
- (int)totalLaunches;
- (int)totalSSIDLaunches;
- (int)totalSpotlightLaunches;
- (int)totalSpotlightTimeOfDayLaunches;
- (int)totalTimeOfDayLaunches;
- (int)totalTrendingLaunches;
- (int)totalWifiLaunches;
- (unint64_t)appSequencesCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addAppSequence:(id)a3;
- (void)clearAppSequences;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setABGroup:(id)a3;
- (void)setAPREngagementType:(id)a3;
- (void)setAPRFeedbackSource:(id)a3;
- (void)setAPRSiriExperience:(id)a3;
- (void)setAppSequences:(id)a3;
- (void)setConsumerSubType:(int)a3;
- (void)setConsumerType:(id)a3;
- (void)setCoreMotionCurrentMotionLaunches:(int)a3;
- (void)setCoreMotionLaunches:(int)a3;
- (void)setCurrentLOIType:(int)a3;
- (void)setDayOfWeek:(int)a3;
- (void)setEngagedApp:(int)a3;
- (void)setHasConsumerSubType:(BOOL)a3;
- (void)setHasCoreMotionCurrentMotionLaunches:(BOOL)a3;
- (void)setHasCoreMotionLaunches:(BOOL)a3;
- (void)setHasCurrentLOIType:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasEngagedApp:(BOOL)a3;
- (void)setHasInAirplaneMode:(BOOL)a3;
- (void)setHasIsInternalBuild:(BOOL)a3;
- (void)setHasLocationDistanceFromGym:(BOOL)a3;
- (void)setHasLocationDistanceFromHome:(BOOL)a3;
- (void)setHasLocationDistanceFromSchool:(BOOL)a3;
- (void)setHasLocationDistanceFromWork:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setHasPredictionCacheAge:(BOOL)a3;
- (void)setHasSessionLogVersion:(BOOL)a3;
- (void)setHasTimeOfDayInterval:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalAirplaneModeLaunches:(BOOL)a3;
- (void)setHasTotalCurrentDayOfWeekLaunches:(BOOL)a3;
- (void)setHasTotalDayOfWeekLaunches:(BOOL)a3;
- (void)setHasTotalLaunchSequences:(BOOL)a3;
- (void)setHasTotalLaunches:(BOOL)a3;
- (void)setHasTotalSSIDLaunches:(BOOL)a3;
- (void)setHasTotalSpotlightLaunches:(BOOL)a3;
- (void)setHasTotalSpotlightTimeOfDayLaunches:(BOOL)a3;
- (void)setHasTotalTimeOfDayLaunches:(BOOL)a3;
- (void)setHasTotalTrendingLaunches:(BOOL)a3;
- (void)setHasTotalWifiLaunches:(BOOL)a3;
- (void)setInAirplaneMode:(BOOL)a3;
- (void)setIntentType:(id)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setLocationDistanceFromGym:(int)a3;
- (void)setLocationDistanceFromHome:(int)a3;
- (void)setLocationDistanceFromSchool:(int)a3;
- (void)setLocationDistanceFromWork:(int)a3;
- (void)setOutcome:(int)a3;
- (void)setPredictionCacheAge:(int)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionLogVersion:(int)a3;
- (void)setTimeOfDayInterval:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalAirplaneModeLaunches:(int)a3;
- (void)setTotalCurrentDayOfWeekLaunches:(int)a3;
- (void)setTotalDayOfWeekLaunches:(int)a3;
- (void)setTotalLaunchSequences:(int)a3;
- (void)setTotalLaunches:(int)a3;
- (void)setTotalSSIDLaunches:(int)a3;
- (void)setTotalSpotlightLaunches:(int)a3;
- (void)setTotalSpotlightTimeOfDayLaunches:(int)a3;
- (void)setTotalTimeOfDayLaunches:(int)a3;
- (void)setTotalTrendingLaunches:(int)a3;
- (void)setTotalWifiLaunches:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveAppPredictionSession

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCoreMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_coreMotionLaunches = a3;
}

- (void)setHasCoreMotionLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCoreMotionLaunches
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalAirplaneModeLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_totalAirplaneModeLaunches = a3;
}

- (void)setHasTotalAirplaneModeLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTotalAirplaneModeLaunches
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_inAirplaneMode = a3;
}

- (void)setHasInAirplaneMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasInAirplaneMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCoreMotionCurrentMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_coreMotionCurrentMotionLaunches = a3;
}

- (void)setHasCoreMotionCurrentMotionLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCoreMotionCurrentMotionLaunches
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalSpotlightLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_totalSpotlightLaunches = a3;
}

- (void)setHasTotalSpotlightLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTotalSpotlightLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTotalLaunchSequences:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalLaunchSequences = a3;
}

- (void)setHasTotalLaunchSequences:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalLaunchSequences
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTotalCurrentDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_totalCurrentDayOfWeekLaunches = a3;
}

- (void)setHasTotalCurrentDayOfWeekLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTotalCurrentDayOfWeekLaunches
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTotalWifiLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_totalWifiLaunches = a3;
}

- (void)setHasTotalWifiLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTotalWifiLaunches
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTimeOfDayInterval:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timeOfDayInterval = a3;
}

- (void)setHasTimeOfDayInterval:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimeOfDayInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)consumerSubType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_consumerSubType;
  }
  else {
    return 0;
  }
}

- (void)setConsumerSubType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_consumerSubType = a3;
}

- (void)setHasConsumerSubType:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConsumerSubType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)consumerSubTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E68ADD98[a3];
  }
  return v3;
}

- (int)StringAsConsumerSubType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATXConsumerSubTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeWidgetUnknown"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeWidgetToday"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeWidgetLockScreen"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSpotlightPullDownHomeScreen"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSpotlightNotificationCenterOverApp"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSpotlightNotificationCenterHomeScreen"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSpotlightTodayLockScreen"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSpotlightTodayHomeScreen"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSpotlightUnknown"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypePreferenceSiriKit"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypePreferenceShadowLog"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypePreferenceUnknown"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeAppConnectionExpertSpringBoard"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSuperGreen"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeShadowLogging"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionUnknown"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionShadowLog"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionSpotlightPullDownHomeScreen"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionSpotlightTodayLockScreen"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionSpotlightTodayHomeScreen"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionSpotlightUnknown"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionLockScreen"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionVoiceShortcuts"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSlotResolution"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSlotResolutionShadowLog"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionValuation"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionValuationShadowLog"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionValuationLockscreen"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeDock"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeMax"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionCarPlayDashboard"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeShortcutsGallery"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSuggestionHomeScreen"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeAppDirectory"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeAppSuggestionHomeScreen"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeActionSuggestionHomeScreen"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSuggestionsWidgetHomeScreen"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeSuggestionsWidgetTodayHomeScreen"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"ATXConsumerSubTypeAppSuggestionTodayHomeScreen"])
  {
    int v4 = 39;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)currentLOIType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_currentLOIType;
  }
  else {
    return 0;
  }
}

- (void)setCurrentLOIType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_currentLOIType = a3;
}

- (void)setHasCurrentLOIType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCurrentLOIType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)currentLOITypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E68ADED8[a3];
  }
  return v3;
}

- (int)StringAsCurrentLOIType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ProactiveAppPredictionLOITypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLOITypeWork"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLOITypeHome"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLOITypeGym"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTotalLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_totalLaunches = a3;
}

- (void)setHasTotalLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTotalLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)outcome
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_outcome;
  }
  else {
    return 0;
  }
}

- (void)setOutcome:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_outcome = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasOutcome
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)outcomeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E68ADEF8[a3];
  }
  return v3;
}

- (int)StringAsOutcome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATXPredictionOutcomeConversionAppExpert"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeConversionUnknown"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomePseudoconversion"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeDiversion"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeSearchAbandonment"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeAbandonment"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeError"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeMax"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ATXPredictionOutcomeDeduplicated"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEngagedApp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_engagedApp = a3;
}

- (void)setHasEngagedApp:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEngagedApp
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTotalTrendingLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_totalTrendingLaunches = a3;
}

- (void)setHasTotalTrendingLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTotalTrendingLaunches
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setTotalTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_totalTimeOfDayLaunches = a3;
}

- (void)setHasTotalTimeOfDayLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTotalTimeOfDayLaunches
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTotalSSIDLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalSSIDLaunches = a3;
}

- (void)setHasTotalSSIDLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalSSIDLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLocationDistanceFromHome:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_locationDistanceFromHome = a3;
}

- (void)setHasLocationDistanceFromHome:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocationDistanceFromHome
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLocationDistanceFromWork:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_locationDistanceFromWork = a3;
}

- (void)setHasLocationDistanceFromWork:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLocationDistanceFromWork
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLocationDistanceFromSchool:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_locationDistanceFromSchool = a3;
}

- (void)setHasLocationDistanceFromSchool:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLocationDistanceFromSchool
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLocationDistanceFromGym:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_locationDistanceFromGym = a3;
}

- (void)setHasLocationDistanceFromGym:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLocationDistanceFromGym
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isInternalBuild = a3;
}

- (void)setHasIsInternalBuild:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsInternalBuild
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setPredictionCacheAge:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_predictionCacheAge = a3;
}

- (void)setHasPredictionCacheAge:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPredictionCacheAge
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSessionLogVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sessionLogVersion = a3;
}

- (void)setHasSessionLogVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSessionLogVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTotalSpotlightTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_totalSpotlightTimeOfDayLaunches = a3;
}

- (void)setHasTotalSpotlightTimeOfDayLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTotalSpotlightTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setDayOfWeek:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTotalDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_totalDayOfWeekLaunches = a3;
}

- (void)setHasTotalDayOfWeekLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTotalDayOfWeekLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)clearAppSequences
{
}

- (void)addAppSequence:(id)a3
{
  id v4 = a3;
  appSequences = self->_appSequences;
  id v8 = v4;
  if (!appSequences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_appSequences;
    self->_appSequences = v6;

    id v4 = v8;
    appSequences = self->_appSequences;
  }
  [(NSMutableArray *)appSequences addObject:v4];
}

- (unint64_t)appSequencesCount
{
  return [(NSMutableArray *)self->_appSequences count];
}

- (id)appSequenceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appSequences objectAtIndex:a3];
}

+ (Class)appSequenceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAPRFeedbackSource
{
  return self->_aPRFeedbackSource != 0;
}

- (BOOL)hasAPREngagementType
{
  return self->_aPREngagementType != 0;
}

- (BOOL)hasAPRSiriExperience
{
  return self->_aPRSiriExperience != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (BOOL)hasConsumerType
{
  return self->_consumerType != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasABGroup
{
  return self->_aBGroup != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveAppPredictionSession;
  id v4 = [(AWDProactiveAppPredictionSession *)&v8 description];
  v5 = [(AWDProactiveAppPredictionSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if (*(unsigned char *)&has)
  {
    v16 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v16 forKey:@"timestamp"];

    $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v17 = [NSNumber numberWithInt:self->_coreMotionLaunches];
  [v3 setObject:v17 forKey:@"CoreMotionLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  v18 = [NSNumber numberWithInt:self->_totalAirplaneModeLaunches];
  [v3 setObject:v18 forKey:@"TotalAirplaneModeLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  v19 = [NSNumber numberWithBool:self->_inAirplaneMode];
  [v3 setObject:v19 forKey:@"InAirplaneMode"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  v20 = [NSNumber numberWithInt:self->_coreMotionCurrentMotionLaunches];
  [v3 setObject:v20 forKey:@"CoreMotionCurrentMotionLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  v21 = [NSNumber numberWithInt:self->_totalSpotlightLaunches];
  [v3 setObject:v21 forKey:@"TotalSpotlightLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  v22 = [NSNumber numberWithInt:self->_totalLaunchSequences];
  [v3 setObject:v22 forKey:@"TotalLaunchSequences"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  v23 = [NSNumber numberWithInt:self->_totalCurrentDayOfWeekLaunches];
  [v3 setObject:v23 forKey:@"TotalCurrentDayOfWeekLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  v24 = [NSNumber numberWithInt:self->_totalWifiLaunches];
  [v3 setObject:v24 forKey:@"TotalWifiLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  v25 = [NSNumber numberWithInt:self->_timeOfDayInterval];
  [v3 setObject:v25 forKey:@"TimeOfDayInterval"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_61;
  }
LABEL_57:
  uint64_t consumerSubType = self->_consumerSubType;
  if (consumerSubType >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_consumerSubType);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = off_1E68ADD98[consumerSubType];
  }
  [v3 setObject:v27 forKey:@"ConsumerSubType"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_65;
  }
LABEL_61:
  uint64_t currentLOIType = self->_currentLOIType;
  if (currentLOIType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_currentLOIType);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E68ADED8[currentLOIType];
  }
  [v3 setObject:v29 forKey:@"CurrentLOIType"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_66;
  }
LABEL_65:
  v30 = [NSNumber numberWithInt:self->_totalLaunches];
  [v3 setObject:v30 forKey:@"TotalLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_66:
  uint64_t outcome = self->_outcome;
  if (outcome >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outcome);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = off_1E68ADEF8[outcome];
  }
  [v3 setObject:v32 forKey:@"Outcome"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  v33 = [NSNumber numberWithInt:self->_engagedApp];
  [v3 setObject:v33 forKey:@"EngagedApp"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  v34 = [NSNumber numberWithInt:self->_totalTrendingLaunches];
  [v3 setObject:v34 forKey:@"TotalTrendingLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  v35 = [NSNumber numberWithInt:self->_totalTimeOfDayLaunches];
  [v3 setObject:v35 forKey:@"TotalTimeOfDayLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  v36 = [NSNumber numberWithInt:self->_totalSSIDLaunches];
  [v3 setObject:v36 forKey:@"TotalSSIDLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  v37 = [NSNumber numberWithInt:self->_locationDistanceFromHome];
  [v3 setObject:v37 forKey:@"LocationDistanceFromHome"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  v38 = [NSNumber numberWithInt:self->_locationDistanceFromWork];
  [v3 setObject:v38 forKey:@"LocationDistanceFromWork"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  v39 = [NSNumber numberWithInt:self->_locationDistanceFromSchool];
  [v3 setObject:v39 forKey:@"LocationDistanceFromSchool"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  v40 = [NSNumber numberWithInt:self->_locationDistanceFromGym];
  [v3 setObject:v40 forKey:@"LocationDistanceFromGym"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  v41 = [NSNumber numberWithBool:self->_isInternalBuild];
  [v3 setObject:v41 forKey:@"IsInternalBuild"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  v42 = [NSNumber numberWithInt:self->_predictionCacheAge];
  [v3 setObject:v42 forKey:@"PredictionCacheAge"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  v43 = [NSNumber numberWithInt:self->_sessionLogVersion];
  [v3 setObject:v43 forKey:@"session_log_version"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  v44 = [NSNumber numberWithInt:self->_totalSpotlightTimeOfDayLaunches];
  [v3 setObject:v44 forKey:@"TotalSpotlightTimeOfDayLaunches"];

  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_82:
  v45 = [NSNumber numberWithInt:self->_dayOfWeek];
  [v3 setObject:v45 forKey:@"DayOfWeek"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_29:
    v5 = [NSNumber numberWithInt:self->_totalDayOfWeekLaunches];
    [v3 setObject:v5 forKey:@"TotalDayOfWeekLaunches"];
  }
LABEL_30:
  appSequences = self->_appSequences;
  if (appSequences) {
    [v3 setObject:appSequences forKey:@"AppSequence"];
  }
  aPRFeedbackSource = self->_aPRFeedbackSource;
  if (aPRFeedbackSource) {
    [v3 setObject:aPRFeedbackSource forKey:@"APRFeedbackSource"];
  }
  aPREngagementType = self->_aPREngagementType;
  if (aPREngagementType) {
    [v3 setObject:aPREngagementType forKey:@"APREngagementType"];
  }
  aPRSiriExperience = self->_aPRSiriExperience;
  if (aPRSiriExperience) {
    [v3 setObject:aPRSiriExperience forKey:@"APRSiriExperience"];
  }
  intentType = self->_intentType;
  if (intentType) {
    [v3 setObject:intentType forKey:@"IntentType"];
  }
  consumerType = self->_consumerType;
  if (consumerType) {
    [v3 setObject:consumerType forKey:@"ConsumerType"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"SessionId"];
  }
  aBGroup = self->_aBGroup;
  if (aBGroup) {
    [v3 setObject:aBGroup forKey:@"ABGroup"];
  }
  id v14 = v3;

  return v14;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteInt32Field();
LABEL_30:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_appSequences;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_aPRFeedbackSource) {
    PBDataWriterWriteStringField();
  }
  if (self->_aPREngagementType) {
    PBDataWriterWriteStringField();
  }
  if (self->_aPRSiriExperience) {
    PBDataWriterWriteStringField();
  }
  if (self->_intentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_consumerType) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_aBGroup) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 48) |= 1u;
    $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 19) = self->_coreMotionLaunches;
  *((_DWORD *)v4 + 48) |= 8u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 36) = self->_totalAirplaneModeLaunches;
  *((_DWORD *)v4 + 48) |= 0x8000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((unsigned char *)v4 + 188) = self->_inAirplaneMode;
  *((_DWORD *)v4 + 48) |= 0x4000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 18) = self->_coreMotionCurrentMotionLaunches;
  *((_DWORD *)v4 + 48) |= 4u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 42) = self->_totalSpotlightLaunches;
  *((_DWORD *)v4 + 48) |= 0x200000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 39) = self->_totalLaunchSequences;
  *((_DWORD *)v4 + 48) |= 0x40000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 37) = self->_totalCurrentDayOfWeekLaunches;
  *((_DWORD *)v4 + 48) |= 0x10000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 46) = self->_totalWifiLaunches;
  *((_DWORD *)v4 + 48) |= 0x2000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 35) = self->_timeOfDayInterval;
  *((_DWORD *)v4 + 48) |= 0x4000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 14) = self->_consumerSubType;
  *((_DWORD *)v4 + 48) |= 2u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 20) = self->_currentLOIType;
  *((_DWORD *)v4 + 48) |= 0x10u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 40) = self->_totalLaunches;
  *((_DWORD *)v4 + 48) |= 0x80000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 30) = self->_outcome;
  *((_DWORD *)v4 + 48) |= 0x800u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 22) = self->_engagedApp;
  *((_DWORD *)v4 + 48) |= 0x40u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 45) = self->_totalTrendingLaunches;
  *((_DWORD *)v4 + 48) |= 0x1000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 44) = self->_totalTimeOfDayLaunches;
  *((_DWORD *)v4 + 48) |= 0x800000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 41) = self->_totalSSIDLaunches;
  *((_DWORD *)v4 + 48) |= 0x100000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 27) = self->_locationDistanceFromHome;
  *((_DWORD *)v4 + 48) |= 0x100u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v4 + 29) = self->_locationDistanceFromWork;
  *((_DWORD *)v4 + 48) |= 0x400u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v4 + 28) = self->_locationDistanceFromSchool;
  *((_DWORD *)v4 + 48) |= 0x200u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v4 + 26) = self->_locationDistanceFromGym;
  *((_DWORD *)v4 + 48) |= 0x80u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((unsigned char *)v4 + 189) = self->_isInternalBuild;
  *((_DWORD *)v4 + 48) |= 0x8000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)v4 + 31) = self->_predictionCacheAge;
  *((_DWORD *)v4 + 48) |= 0x1000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)v4 + 34) = self->_sessionLogVersion;
  *((_DWORD *)v4 + 48) |= 0x2000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
LABEL_77:
    *((_DWORD *)v4 + 21) = self->_dayOfWeek;
    *((_DWORD *)v4 + 48) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_76:
  *((_DWORD *)v4 + 43) = self->_totalSpotlightTimeOfDayLaunches;
  *((_DWORD *)v4 + 48) |= 0x400000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0) {
    goto LABEL_77;
  }
LABEL_28:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 38) = self->_totalDayOfWeekLaunches;
    *((_DWORD *)v4 + 48) |= 0x20000u;
  }
LABEL_30:
  id v11 = v4;
  if ([(AWDProactiveAppPredictionSession *)self appSequencesCount])
  {
    [v11 clearAppSequences];
    unint64_t v6 = [(AWDProactiveAppPredictionSession *)self appSequencesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(AWDProactiveAppPredictionSession *)self appSequenceAtIndex:i];
        [v11 addAppSequence:v9];
      }
    }
  }
  if (self->_aPRFeedbackSource) {
    objc_msgSend(v11, "setAPRFeedbackSource:");
  }
  uint64_t v10 = v11;
  if (self->_aPREngagementType)
  {
    objc_msgSend(v11, "setAPREngagementType:");
    uint64_t v10 = v11;
  }
  if (self->_aPRSiriExperience)
  {
    objc_msgSend(v11, "setAPRSiriExperience:");
    uint64_t v10 = v11;
  }
  if (self->_intentType)
  {
    objc_msgSend(v11, "setIntentType:");
    uint64_t v10 = v11;
  }
  if (self->_consumerType)
  {
    objc_msgSend(v11, "setConsumerType:");
    uint64_t v10 = v11;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v11, "setSessionId:");
    uint64_t v10 = v11;
  }
  if (self->_aBGroup)
  {
    objc_msgSend(v11, "setABGroup:");
    uint64_t v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 192) |= 1u;
    $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 76) = self->_coreMotionLaunches;
  *(_DWORD *)(v5 + 192) |= 8u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 144) = self->_totalAirplaneModeLaunches;
  *(_DWORD *)(v5 + 192) |= 0x8000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(unsigned char *)(v5 + 188) = self->_inAirplaneMode;
  *(_DWORD *)(v5 + 192) |= 0x4000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 72) = self->_coreMotionCurrentMotionLaunches;
  *(_DWORD *)(v5 + 192) |= 4u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 168) = self->_totalSpotlightLaunches;
  *(_DWORD *)(v5 + 192) |= 0x200000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 156) = self->_totalLaunchSequences;
  *(_DWORD *)(v5 + 192) |= 0x40000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 148) = self->_totalCurrentDayOfWeekLaunches;
  *(_DWORD *)(v5 + 192) |= 0x10000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 184) = self->_totalWifiLaunches;
  *(_DWORD *)(v5 + 192) |= 0x2000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 140) = self->_timeOfDayInterval;
  *(_DWORD *)(v5 + 192) |= 0x4000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 56) = self->_consumerSubType;
  *(_DWORD *)(v5 + 192) |= 2u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 80) = self->_currentLOIType;
  *(_DWORD *)(v5 + 192) |= 0x10u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 160) = self->_totalLaunches;
  *(_DWORD *)(v5 + 192) |= 0x80000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 120) = self->_outcome;
  *(_DWORD *)(v5 + 192) |= 0x800u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 88) = self->_engagedApp;
  *(_DWORD *)(v5 + 192) |= 0x40u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 180) = self->_totalTrendingLaunches;
  *(_DWORD *)(v5 + 192) |= 0x1000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 176) = self->_totalTimeOfDayLaunches;
  *(_DWORD *)(v5 + 192) |= 0x800000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 164) = self->_totalSSIDLaunches;
  *(_DWORD *)(v5 + 192) |= 0x100000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 108) = self->_locationDistanceFromHome;
  *(_DWORD *)(v5 + 192) |= 0x100u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 116) = self->_locationDistanceFromWork;
  *(_DWORD *)(v5 + 192) |= 0x400u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 112) = self->_locationDistanceFromSchool;
  *(_DWORD *)(v5 + 192) |= 0x200u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 104) = self->_locationDistanceFromGym;
  *(_DWORD *)(v5 + 192) |= 0x80u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(unsigned char *)(v5 + 189) = self->_isInternalBuild;
  *(_DWORD *)(v5 + 192) |= 0x8000000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 124) = self->_predictionCacheAge;
  *(_DWORD *)(v5 + 192) |= 0x1000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 136) = self->_sessionLogVersion;
  *(_DWORD *)(v5 + 192) |= 0x2000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 172) = self->_totalSpotlightTimeOfDayLaunches;
  *(_DWORD *)(v5 + 192) |= 0x400000u;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_64:
  *(_DWORD *)(v5 + 84) = self->_dayOfWeek;
  *(_DWORD *)(v5 + 192) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_29:
    *(_DWORD *)(v5 + 152) = self->_totalDayOfWeekLaunches;
    *(_DWORD *)(v5 + 192) |= 0x20000u;
  }
LABEL_30:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = self->_appSequences;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v12), "copyWithZone:", a3, (void)v29);
        [v6 addAppSequence:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_aPRFeedbackSource copyWithZone:a3];
  v15 = (void *)v6[4];
  v6[4] = v14;

  uint64_t v16 = [(NSString *)self->_aPREngagementType copyWithZone:a3];
  v17 = (void *)v6[3];
  v6[3] = v16;

  uint64_t v18 = [(NSString *)self->_aPRSiriExperience copyWithZone:a3];
  v19 = (void *)v6[5];
  v6[5] = v18;

  uint64_t v20 = [(NSString *)self->_intentType copyWithZone:a3];
  v21 = (void *)v6[12];
  v6[12] = v20;

  uint64_t v22 = [(NSString *)self->_consumerType copyWithZone:a3];
  v23 = (void *)v6[8];
  v6[8] = v22;

  uint64_t v24 = [(NSString *)self->_sessionId copyWithZone:a3];
  v25 = (void *)v6[16];
  v6[16] = v24;

  uint64_t v26 = [(NSString *)self->_aBGroup copyWithZone:a3];
  v27 = (void *)v6[2];
  v6[2] = v26;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_164;
  }
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  int v6 = *((_DWORD *)v4 + 48);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_164;
    }
  }
  else if (v6)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_coreMotionLaunches != *((_DWORD *)v4 + 19)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_totalAirplaneModeLaunches != *((_DWORD *)v4 + 36)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_164;
    }
    if (self->_inAirplaneMode)
    {
      if (!*((unsigned char *)v4 + 188)) {
        goto LABEL_164;
      }
    }
    else if (*((unsigned char *)v4 + 188))
    {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_coreMotionCurrentMotionLaunches != *((_DWORD *)v4 + 18)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_totalSpotlightLaunches != *((_DWORD *)v4 + 42)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_totalLaunchSequences != *((_DWORD *)v4 + 39)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_totalCurrentDayOfWeekLaunches != *((_DWORD *)v4 + 37)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_totalWifiLaunches != *((_DWORD *)v4 + 46)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_timeOfDayInterval != *((_DWORD *)v4 + 35)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_consumerSubType != *((_DWORD *)v4 + 14)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_currentLOIType != *((_DWORD *)v4 + 20)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_totalLaunches != *((_DWORD *)v4 + 40)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_outcome != *((_DWORD *)v4 + 30)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_engagedApp != *((_DWORD *)v4 + 22)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_totalTrendingLaunches != *((_DWORD *)v4 + 45)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_totalTimeOfDayLaunches != *((_DWORD *)v4 + 44)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_totalSSIDLaunches != *((_DWORD *)v4 + 41)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_locationDistanceFromHome != *((_DWORD *)v4 + 27)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_locationDistanceFromWork != *((_DWORD *)v4 + 29)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_locationDistanceFromSchool != *((_DWORD *)v4 + 28)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_locationDistanceFromGym != *((_DWORD *)v4 + 26)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) != 0)
    {
      if (self->_isInternalBuild)
      {
        if (!*((unsigned char *)v4 + 189)) {
          goto LABEL_164;
        }
        goto LABEL_123;
      }
      if (!*((unsigned char *)v4 + 189)) {
        goto LABEL_123;
      }
    }
LABEL_164:
    char v15 = 0;
    goto LABEL_165;
  }
  if ((v6 & 0x8000000) != 0) {
    goto LABEL_164;
  }
LABEL_123:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_predictionCacheAge != *((_DWORD *)v4 + 31)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sessionLogVersion != *((_DWORD *)v4 + 34)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_totalSpotlightTimeOfDayLaunches != *((_DWORD *)v4 + 43)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 21)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_totalDayOfWeekLaunches != *((_DWORD *)v4 + 38)) {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_164;
  }
  appSequences = self->_appSequences;
  if ((unint64_t)appSequences | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](appSequences, "isEqual:"))
  {
    goto LABEL_164;
  }
  aPRFeedbackSource = self->_aPRFeedbackSource;
  if ((unint64_t)aPRFeedbackSource | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](aPRFeedbackSource, "isEqual:")) {
      goto LABEL_164;
    }
  }
  aPREngagementType = self->_aPREngagementType;
  if ((unint64_t)aPREngagementType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](aPREngagementType, "isEqual:")) {
      goto LABEL_164;
    }
  }
  aPRSiriExperience = self->_aPRSiriExperience;
  if ((unint64_t)aPRSiriExperience | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](aPRSiriExperience, "isEqual:")) {
      goto LABEL_164;
    }
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:")) {
      goto LABEL_164;
    }
  }
  consumerType = self->_consumerType;
  if ((unint64_t)consumerType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](consumerType, "isEqual:")) {
      goto LABEL_164;
    }
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_164;
    }
  }
  aBGroup = self->_aBGroup;
  if ((unint64_t)aBGroup | *((void *)v4 + 2)) {
    char v15 = -[NSString isEqual:](aBGroup, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_165:

  return v15;
}

- (unint64_t)hash
{
  $90EB1F1D4E1646A95ACA41F0AF266E7E has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v39 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_coreMotionLaunches;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else
  {
    unint64_t v39 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_totalAirplaneModeLaunches;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_inAirplaneMode;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_coreMotionCurrentMotionLaunches;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_totalSpotlightLaunches;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_totalLaunchSequences;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_totalCurrentDayOfWeekLaunches;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_totalWifiLaunches;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_timeOfDayInterval;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_consumerSubType;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_currentLOIType;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_totalLaunches;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_outcome;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_engagedApp;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_totalTrendingLaunches;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_totalTimeOfDayLaunches;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_19:
    uint64_t v20 = 2654435761 * self->_totalSSIDLaunches;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v20 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_locationDistanceFromHome;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_21:
    uint64_t v22 = 2654435761 * self->_locationDistanceFromWork;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_22:
    uint64_t v23 = 2654435761 * self->_locationDistanceFromSchool;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_23:
    uint64_t v24 = 2654435761 * self->_locationDistanceFromGym;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_24:
    uint64_t v25 = 2654435761 * self->_isInternalBuild;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_25:
    uint64_t v26 = 2654435761 * self->_predictionCacheAge;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_26:
    uint64_t v27 = 2654435761 * self->_sessionLogVersion;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_27:
    uint64_t v28 = 2654435761 * self->_totalSpotlightTimeOfDayLaunches;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_28;
    }
LABEL_56:
    uint64_t v29 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_29;
    }
LABEL_57:
    uint64_t v30 = 0;
    goto LABEL_58;
  }
LABEL_55:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_56;
  }
LABEL_28:
  uint64_t v29 = 2654435761 * self->_dayOfWeek;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_57;
  }
LABEL_29:
  uint64_t v30 = 2654435761 * self->_totalDayOfWeekLaunches;
LABEL_58:
  uint64_t v31 = v4 ^ v39 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ [(NSMutableArray *)self->_appSequences hash];
  NSUInteger v32 = [(NSString *)self->_aPRFeedbackSource hash];
  NSUInteger v33 = v31 ^ v32 ^ [(NSString *)self->_aPREngagementType hash];
  NSUInteger v34 = [(NSString *)self->_aPRSiriExperience hash];
  NSUInteger v35 = v34 ^ [(NSString *)self->_intentType hash];
  NSUInteger v36 = v33 ^ v35 ^ [(NSString *)self->_consumerType hash];
  NSUInteger v37 = [(NSString *)self->_sessionId hash];
  return v36 ^ v37 ^ [(NSString *)self->_aBGroup hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  int v6 = *((_DWORD *)v4 + 48);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v6 = *((_DWORD *)v4 + 48);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_coreMotionLaunches = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x8000) == 0)
  {
LABEL_4:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_totalAirplaneModeLaunches = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_inAirplaneMode = *((unsigned char *)v4 + 188);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_coreMotionCurrentMotionLaunches = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x200000) == 0)
  {
LABEL_7:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_totalSpotlightLaunches = *((_DWORD *)v4 + 42);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x40000) == 0)
  {
LABEL_8:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_totalLaunchSequences = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x10000) == 0)
  {
LABEL_9:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_totalCurrentDayOfWeekLaunches = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_totalWifiLaunches = *((_DWORD *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x4000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_timeOfDayInterval = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v6 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_uint64_t consumerSubType = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 2u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x10) == 0)
  {
LABEL_13:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_uint64_t currentLOIType = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x80000) == 0)
  {
LABEL_14:
    if ((v6 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_totalLaunches = *((_DWORD *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x800) == 0)
  {
LABEL_15:
    if ((v6 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_uint64_t outcome = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_engagedApp = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_17:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_totalTrendingLaunches = *((_DWORD *)v4 + 45);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x800000) == 0)
  {
LABEL_18:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_totalTimeOfDayLaunches = *((_DWORD *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x100000) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_totalSSIDLaunches = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x100) == 0)
  {
LABEL_20:
    if ((v6 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_locationDistanceFromHome = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x400) == 0)
  {
LABEL_21:
    if ((v6 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_locationDistanceFromWork = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x200) == 0)
  {
LABEL_22:
    if ((v6 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_locationDistanceFromSchool = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x80) == 0)
  {
LABEL_23:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_locationDistanceFromGym = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_isInternalBuild = *((unsigned char *)v4 + 189);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_predictionCacheAge = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_sessionLogVersion = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x400000) == 0)
  {
LABEL_27:
    if ((v6 & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_totalSpotlightTimeOfDayLaunches = *((_DWORD *)v4 + 43);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x20) == 0)
  {
LABEL_28:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_78:
  self->_dayOfWeek = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 48) & 0x20000) != 0)
  {
LABEL_29:
    self->_totalDayOfWeekLaunches = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_30:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[AWDProactiveAppPredictionSession addAppSequence:](self, "addAppSequence:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (v5[4]) {
    -[AWDProactiveAppPredictionSession setAPRFeedbackSource:](self, "setAPRFeedbackSource:");
  }
  if (v5[3]) {
    -[AWDProactiveAppPredictionSession setAPREngagementType:](self, "setAPREngagementType:");
  }
  if (v5[5]) {
    -[AWDProactiveAppPredictionSession setAPRSiriExperience:](self, "setAPRSiriExperience:");
  }
  if (v5[12]) {
    -[AWDProactiveAppPredictionSession setIntentType:](self, "setIntentType:");
  }
  if (v5[8]) {
    -[AWDProactiveAppPredictionSession setConsumerType:](self, "setConsumerType:");
  }
  if (v5[16]) {
    -[AWDProactiveAppPredictionSession setSessionId:](self, "setSessionId:");
  }
  if (v5[2]) {
    -[AWDProactiveAppPredictionSession setABGroup:](self, "setABGroup:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)coreMotionLaunches
{
  return self->_coreMotionLaunches;
}

- (int)totalAirplaneModeLaunches
{
  return self->_totalAirplaneModeLaunches;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (int)coreMotionCurrentMotionLaunches
{
  return self->_coreMotionCurrentMotionLaunches;
}

- (int)totalSpotlightLaunches
{
  return self->_totalSpotlightLaunches;
}

- (int)totalLaunchSequences
{
  return self->_totalLaunchSequences;
}

- (int)totalCurrentDayOfWeekLaunches
{
  return self->_totalCurrentDayOfWeekLaunches;
}

- (int)totalWifiLaunches
{
  return self->_totalWifiLaunches;
}

- (int)timeOfDayInterval
{
  return self->_timeOfDayInterval;
}

- (int)totalLaunches
{
  return self->_totalLaunches;
}

- (int)engagedApp
{
  return self->_engagedApp;
}

- (int)totalTrendingLaunches
{
  return self->_totalTrendingLaunches;
}

- (int)totalTimeOfDayLaunches
{
  return self->_totalTimeOfDayLaunches;
}

- (int)totalSSIDLaunches
{
  return self->_totalSSIDLaunches;
}

- (int)locationDistanceFromHome
{
  return self->_locationDistanceFromHome;
}

- (int)locationDistanceFromWork
{
  return self->_locationDistanceFromWork;
}

- (int)locationDistanceFromSchool
{
  return self->_locationDistanceFromSchool;
}

- (int)locationDistanceFromGym
{
  return self->_locationDistanceFromGym;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (int)predictionCacheAge
{
  return self->_predictionCacheAge;
}

- (int)sessionLogVersion
{
  return self->_sessionLogVersion;
}

- (int)totalSpotlightTimeOfDayLaunches
{
  return self->_totalSpotlightTimeOfDayLaunches;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int)totalDayOfWeekLaunches
{
  return self->_totalDayOfWeekLaunches;
}

- (NSMutableArray)appSequences
{
  return self->_appSequences;
}

- (void)setAppSequences:(id)a3
{
}

- (NSString)aPRFeedbackSource
{
  return self->_aPRFeedbackSource;
}

- (void)setAPRFeedbackSource:(id)a3
{
}

- (NSString)aPREngagementType
{
  return self->_aPREngagementType;
}

- (void)setAPREngagementType:(id)a3
{
}

- (NSString)aPRSiriExperience
{
  return self->_aPRSiriExperience;
}

- (void)setAPRSiriExperience:(id)a3
{
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
}

- (NSString)consumerType
{
  return self->_consumerType;
}

- (void)setConsumerType:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)aBGroup
{
  return self->_aBGroup;
}

- (void)setABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_consumerType, 0);
  objc_storeStrong((id *)&self->_appSequences, 0);
  objc_storeStrong((id *)&self->_aPRSiriExperience, 0);
  objc_storeStrong((id *)&self->_aPRFeedbackSource, 0);
  objc_storeStrong((id *)&self->_aPREngagementType, 0);
  objc_storeStrong((id *)&self->_aBGroup, 0);
}

@end