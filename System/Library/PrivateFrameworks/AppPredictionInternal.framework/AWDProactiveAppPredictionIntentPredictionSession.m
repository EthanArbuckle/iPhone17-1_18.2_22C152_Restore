@interface AWDProactiveAppPredictionIntentPredictionSession
+ (Class)actionDataType;
- (AWDProactiveAppPredictionAppActionSequence)appActionSequence;
- (AWDProactiveAppPredictionAppLaunchSequence)appSequence;
- (BOOL)hasAbGroup;
- (BOOL)hasAppActionCoreMotionCurrentMotionLaunches;
- (BOOL)hasAppActionSequence;
- (BOOL)hasAppForAllActionsCoreMotionCurrentMotionLaunches;
- (BOOL)hasAppSequence;
- (BOOL)hasConsumerSubType;
- (BOOL)hasCurrentLOIType;
- (BOOL)hasDayOfWeek;
- (BOOL)hasEngagementType;
- (BOOL)hasInAirplaneMode;
- (BOOL)hasIntentDonationDelay;
- (BOOL)hasIsInternalBuild;
- (BOOL)hasLocationDistanceFromHome;
- (BOOL)hasLocationDistanceFromWork;
- (BOOL)hasLogType;
- (BOOL)hasPredictionAge;
- (BOOL)hasSessionId;
- (BOOL)hasSessionLogVersion;
- (BOOL)hasTimeOfDayInterval;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalAppActionAirplaneModeLaunches;
- (BOOL)hasTotalAppActionCoarseTimeOfDayLaunches;
- (BOOL)hasTotalAppActionCurrentDayOfWeekLaunches;
- (BOOL)hasTotalAppActionTimeOfDayLaunches;
- (BOOL)hasTotalAppForAllActionTimeOfDayLaunches;
- (BOOL)hasTotalAppForAllActionsAirplaneModeLaunches;
- (BOOL)hasTotalAppForAllActionsCoarseTimeOfDayLaunches;
- (BOOL)hasTotalAppForAllActionsCurrentDayOfWeekLaunches;
- (BOOL)hasUiFeedbackDelay;
- (BOOL)inAirplaneMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalBuild;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)actionDatas;
- (NSString)abGroup;
- (NSString)sessionId;
- (id)actionDataAtIndex:(unint64_t)a3;
- (id)consumerSubTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentLOITypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (int)StringAsConsumerSubType:(id)a3;
- (int)StringAsCurrentLOIType:(id)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)appActionCoreMotionCurrentMotionLaunches;
- (int)appForAllActionsCoreMotionCurrentMotionLaunches;
- (int)consumerSubType;
- (int)currentLOIType;
- (int)dayOfWeek;
- (int)engagedActionCacheIndices;
- (int)engagedActionCacheIndicesAtIndex:(unint64_t)a3;
- (int)engagementType;
- (int)intentDonationDelay;
- (int)locationDistanceFromHome;
- (int)locationDistanceFromWork;
- (int)logType;
- (int)predictionAge;
- (int)sessionLogVersion;
- (int)timeOfDayInterval;
- (int)totalAppActionAirplaneModeLaunches;
- (int)totalAppActionCoarseTimeOfDayLaunches;
- (int)totalAppActionCurrentDayOfWeekLaunches;
- (int)totalAppActionTimeOfDayLaunches;
- (int)totalAppForAllActionTimeOfDayLaunches;
- (int)totalAppForAllActionsAirplaneModeLaunches;
- (int)totalAppForAllActionsCoarseTimeOfDayLaunches;
- (int)totalAppForAllActionsCurrentDayOfWeekLaunches;
- (int)uiFeedbackDelay;
- (unint64_t)actionDatasCount;
- (unint64_t)engagedActionCacheIndicesCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addActionData:(id)a3;
- (void)addEngagedActionCacheIndices:(int)a3;
- (void)clearActionDatas;
- (void)clearEngagedActionCacheIndices;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setActionDatas:(id)a3;
- (void)setAppActionCoreMotionCurrentMotionLaunches:(int)a3;
- (void)setAppActionSequence:(id)a3;
- (void)setAppForAllActionsCoreMotionCurrentMotionLaunches:(int)a3;
- (void)setAppSequence:(id)a3;
- (void)setConsumerSubType:(int)a3;
- (void)setCurrentLOIType:(int)a3;
- (void)setDayOfWeek:(int)a3;
- (void)setEngagedActionCacheIndices:(int *)a3 count:(unint64_t)a4;
- (void)setEngagementType:(int)a3;
- (void)setHasAppActionCoreMotionCurrentMotionLaunches:(BOOL)a3;
- (void)setHasAppForAllActionsCoreMotionCurrentMotionLaunches:(BOOL)a3;
- (void)setHasConsumerSubType:(BOOL)a3;
- (void)setHasCurrentLOIType:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)setHasInAirplaneMode:(BOOL)a3;
- (void)setHasIntentDonationDelay:(BOOL)a3;
- (void)setHasIsInternalBuild:(BOOL)a3;
- (void)setHasLocationDistanceFromHome:(BOOL)a3;
- (void)setHasLocationDistanceFromWork:(BOOL)a3;
- (void)setHasLogType:(BOOL)a3;
- (void)setHasPredictionAge:(BOOL)a3;
- (void)setHasSessionLogVersion:(BOOL)a3;
- (void)setHasTimeOfDayInterval:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalAppActionAirplaneModeLaunches:(BOOL)a3;
- (void)setHasTotalAppActionCoarseTimeOfDayLaunches:(BOOL)a3;
- (void)setHasTotalAppActionCurrentDayOfWeekLaunches:(BOOL)a3;
- (void)setHasTotalAppActionTimeOfDayLaunches:(BOOL)a3;
- (void)setHasTotalAppForAllActionTimeOfDayLaunches:(BOOL)a3;
- (void)setHasTotalAppForAllActionsAirplaneModeLaunches:(BOOL)a3;
- (void)setHasTotalAppForAllActionsCoarseTimeOfDayLaunches:(BOOL)a3;
- (void)setHasTotalAppForAllActionsCurrentDayOfWeekLaunches:(BOOL)a3;
- (void)setHasUiFeedbackDelay:(BOOL)a3;
- (void)setInAirplaneMode:(BOOL)a3;
- (void)setIntentDonationDelay:(int)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setLocationDistanceFromHome:(int)a3;
- (void)setLocationDistanceFromWork:(int)a3;
- (void)setLogType:(int)a3;
- (void)setPredictionAge:(int)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionLogVersion:(int)a3;
- (void)setTimeOfDayInterval:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalAppActionAirplaneModeLaunches:(int)a3;
- (void)setTotalAppActionCoarseTimeOfDayLaunches:(int)a3;
- (void)setTotalAppActionCurrentDayOfWeekLaunches:(int)a3;
- (void)setTotalAppActionTimeOfDayLaunches:(int)a3;
- (void)setTotalAppForAllActionTimeOfDayLaunches:(int)a3;
- (void)setTotalAppForAllActionsAirplaneModeLaunches:(int)a3;
- (void)setTotalAppForAllActionsCoarseTimeOfDayLaunches:(int)a3;
- (void)setTotalAppForAllActionsCurrentDayOfWeekLaunches:(int)a3;
- (void)setUiFeedbackDelay:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveAppPredictionIntentPredictionSession

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveAppPredictionIntentPredictionSession;
  [(AWDProactiveAppPredictionIntentPredictionSession *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)clearActionDatas
{
}

- (void)addActionData:(id)a3
{
  id v4 = a3;
  actionDatas = self->_actionDatas;
  id v8 = v4;
  if (!actionDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_actionDatas;
    self->_actionDatas = v6;

    id v4 = v8;
    actionDatas = self->_actionDatas;
  }
  [(NSMutableArray *)actionDatas addObject:v4];
}

- (unint64_t)actionDatasCount
{
  return [(NSMutableArray *)self->_actionDatas count];
}

- (id)actionDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_actionDatas objectAtIndex:a3];
}

+ (Class)actionDataType
{
  return (Class)objc_opt_class();
}

- (void)setAppActionCoreMotionCurrentMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appActionCoreMotionCurrentMotionLaunches = a3;
}

- (void)setHasAppActionCoreMotionCurrentMotionLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppActionCoreMotionCurrentMotionLaunches
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAppSequence
{
  return self->_appSequence != 0;
}

- (int)consumerSubType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_consumerSubType;
  }
  else {
    return 0;
  }
}

- (void)setConsumerSubType:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_consumerSubType = a3;
}

- (void)setHasConsumerSubType:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConsumerSubType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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
    int v3 = off_1E68B69A8[a3];
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
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
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
    int v3 = off_1E68B6AE8[a3];
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
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (unint64_t)engagedActionCacheIndicesCount
{
  return self->_engagedActionCacheIndices.count;
}

- (int)engagedActionCacheIndices
{
  return self->_engagedActionCacheIndices.list;
}

- (void)clearEngagedActionCacheIndices
{
}

- (void)addEngagedActionCacheIndices:(int)a3
{
}

- (int)engagedActionCacheIndicesAtIndex:(unint64_t)a3
{
  p_engagedActionCacheIndices = &self->_engagedActionCacheIndices;
  unint64_t count = self->_engagedActionCacheIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_engagedActionCacheIndices->list[a3];
}

- (void)setEngagedActionCacheIndices:(int *)a3 count:(unint64_t)a4
{
}

- (int)engagementType
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_engagementType;
  }
  else {
    return 0;
  }
}

- (void)setEngagementType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEngagementType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E68B6B08[a3];
  }
  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATXActionEngagementTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeEngagedInitial"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeEngagedFinalComplete"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeEngagedFinalPartial"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeEngagedDirectComplete"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeAbandonedDirect"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeAbandonedFinal"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeFoundComplete"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeFoundPartial"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeFoundNone"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ATXActionEngagementTypeMax"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_inAirplaneMode = a3;
}

- (void)setHasInAirplaneMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasInAirplaneMode
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIntentDonationDelay:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_intentDonationDelay = a3;
}

- (void)setHasIntentDonationDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasIntentDonationDelay
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isInternalBuild = a3;
}

- (void)setHasIsInternalBuild:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsInternalBuild
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setLogType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_logType = a3;
}

- (void)setHasLogType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLogType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setPredictionAge:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_predictionAge = a3;
}

- (void)setHasPredictionAge:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPredictionAge
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTimeOfDayInterval:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timeOfDayInterval = a3;
}

- (void)setHasTimeOfDayInterval:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTimeOfDayInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTotalAppActionAirplaneModeLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_totalAppActionAirplaneModeLaunches = a3;
}

- (void)setHasTotalAppActionAirplaneModeLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTotalAppActionAirplaneModeLaunches
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTotalAppActionCurrentDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_totalAppActionCurrentDayOfWeekLaunches = a3;
}

- (void)setHasTotalAppActionCurrentDayOfWeekLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTotalAppActionCurrentDayOfWeekLaunches
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTotalAppForAllActionsAirplaneModeLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_totalAppForAllActionsAirplaneModeLaunches = a3;
}

- (void)setHasTotalAppForAllActionsAirplaneModeLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTotalAppForAllActionsAirplaneModeLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTotalAppForAllActionsCurrentDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_totalAppForAllActionsCurrentDayOfWeekLaunches = a3;
}

- (void)setHasTotalAppForAllActionsCurrentDayOfWeekLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTotalAppForAllActionsCurrentDayOfWeekLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setUiFeedbackDelay:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_uiFeedbackDelay = a3;
}

- (void)setHasUiFeedbackDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUiFeedbackDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSessionLogVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sessionLogVersion = a3;
}

- (void)setHasSessionLogVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSessionLogVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (void)setAppForAllActionsCoreMotionCurrentMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_appForAllActionsCoreMotionCurrentMotionLaunches = a3;
}

- (void)setHasAppForAllActionsCoreMotionCurrentMotionLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAppForAllActionsCoreMotionCurrentMotionLaunches
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocationDistanceFromHome
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLocationDistanceFromWork:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_locationDistanceFromWork = a3;
}

- (void)setHasLocationDistanceFromWork:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLocationDistanceFromWork
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTotalAppActionTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_totalAppActionTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppActionTimeOfDayLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTotalAppActionTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTotalAppForAllActionTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalAppForAllActionTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppForAllActionTimeOfDayLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalAppForAllActionTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTotalAppActionCoarseTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_totalAppActionCoarseTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppActionCoarseTimeOfDayLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTotalAppActionCoarseTimeOfDayLaunches
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTotalAppForAllActionsCoarseTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalAppForAllActionsCoarseTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppForAllActionsCoarseTimeOfDayLaunches:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalAppForAllActionsCoarseTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasAppActionSequence
{
  return self->_appActionSequence != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveAppPredictionIntentPredictionSession;
  int v4 = [(AWDProactiveAppPredictionIntentPredictionSession *)&v8 description];
  v5 = [(AWDProactiveAppPredictionIntentPredictionSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_actionDatas count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_actionDatas, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v6 = self->_actionDatas;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v51 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"actionData"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_appActionCoreMotionCurrentMotionLaunches];
    [v3 setObject:v12 forKey:@"appActionCoreMotionCurrentMotionLaunches"];
  }
  appSequence = self->_appSequence;
  if (appSequence)
  {
    v14 = [(AWDProactiveAppPredictionAppLaunchSequence *)appSequence dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"appSequence"];
  }
  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    uint64_t consumerSubType = self->_consumerSubType;
    if (consumerSubType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_consumerSubType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E68B69A8[consumerSubType];
    }
    [v3 setObject:v29 forKey:@"consumerSubType"];

    $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_18:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_18;
  }
  uint64_t currentLOIType = self->_currentLOIType;
  if (currentLOIType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_currentLOIType);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_1E68B6AE8[currentLOIType];
  }
  [v3 setObject:v39 forKey:@"currentLOIType"];

  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    v16 = [NSNumber numberWithInt:self->_dayOfWeek];
    [v3 setObject:v16 forKey:@"dayOfWeek"];
  }
LABEL_20:
  v17 = PBRepeatedInt32NSArray();
  [v3 setObject:v17 forKey:@"engagedActionCacheIndices"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x40) != 0)
  {
    uint64_t engagementType = self->_engagementType;
    if (engagementType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E68B6B08[engagementType];
    }
    [v3 setObject:v31 forKey:@"engagementType"];

    $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x800000) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&v18 & 0x80) == 0) {
        goto LABEL_23;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
    goto LABEL_22;
  }
  v40 = [NSNumber numberWithBool:self->_inAirplaneMode];
  [v3 setObject:v40 forKey:@"inAirplaneMode"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  v41 = [NSNumber numberWithInt:self->_intentDonationDelay];
  [v3 setObject:v41 forKey:@"intentDonationDelay"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v18 & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  v42 = [NSNumber numberWithBool:self->_isInternalBuild];
  [v3 setObject:v42 forKey:@"isInternalBuild"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v18 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  v43 = [NSNumber numberWithInt:self->_logType];
  [v3 setObject:v43 forKey:@"logType"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v18 & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  v44 = [NSNumber numberWithInt:self->_predictionAge];
  [v3 setObject:v44 forKey:@"predictionAge"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v18 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  v45 = [NSNumber numberWithInt:self->_timeOfDayInterval];
  [v3 setObject:v45 forKey:@"timeOfDayInterval"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v18 & 0x10000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  v46 = [NSNumber numberWithInt:self->_totalAppActionAirplaneModeLaunches];
  [v3 setObject:v46 forKey:@"totalAppActionAirplaneModeLaunches"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v18 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  v47 = [NSNumber numberWithInt:self->_totalAppActionCurrentDayOfWeekLaunches];
  [v3 setObject:v47 forKey:@"totalAppActionCurrentDayOfWeekLaunches"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v18 & 0x200000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  v48 = [NSNumber numberWithInt:self->_totalAppForAllActionsAirplaneModeLaunches];
  [v3 setObject:v48 forKey:@"totalAppForAllActionsAirplaneModeLaunches"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v18 & 0x400000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  v49 = [NSNumber numberWithInt:self->_totalAppForAllActionsCurrentDayOfWeekLaunches];
  [v3 setObject:v49 forKey:@"totalAppForAllActionsCurrentDayOfWeekLaunches"];

  $5CAA899F79A00F8F7A1746E0416806BD v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v18 & 0x1000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_76:
  v50 = [NSNumber numberWithInt:self->_uiFeedbackDelay];
  [v3 setObject:v50 forKey:@"uiFeedbackDelay"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_33:
    v19 = [NSNumber numberWithInt:self->_sessionLogVersion];
    [v3 setObject:v19 forKey:@"session_log_version"];
  }
LABEL_34:
  abGroup = self->_abGroup;
  if (abGroup) {
    [v3 setObject:abGroup forKey:@"abGroup"];
  }
  $5CAA899F79A00F8F7A1746E0416806BD v21 = self->_has;
  if ((*(unsigned char *)&v21 & 4) != 0)
  {
    v32 = [NSNumber numberWithInt:self->_appForAllActionsCoreMotionCurrentMotionLaunches];
    [v3 setObject:v32 forKey:@"appForAllActionsCoreMotionCurrentMotionLaunches"];

    $5CAA899F79A00F8F7A1746E0416806BD v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x100) == 0)
    {
LABEL_38:
      if ((*(_WORD *)&v21 & 0x200) == 0) {
        goto LABEL_39;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v21 & 0x100) == 0)
  {
    goto LABEL_38;
  }
  v33 = [NSNumber numberWithInt:self->_locationDistanceFromHome];
  [v3 setObject:v33 forKey:@"locationDistanceFromHome"];

  $5CAA899F79A00F8F7A1746E0416806BD v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v21 & 0x20000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_56;
  }
LABEL_55:
  v34 = [NSNumber numberWithInt:self->_locationDistanceFromWork];
  [v3 setObject:v34 forKey:@"locationDistanceFromWork"];

  $5CAA899F79A00F8F7A1746E0416806BD v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v21 & 0x40000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_57;
  }
LABEL_56:
  v35 = [NSNumber numberWithInt:self->_totalAppActionTimeOfDayLaunches];
  [v3 setObject:v35 forKey:@"totalAppActionTimeOfDayLaunches"];

  $5CAA899F79A00F8F7A1746E0416806BD v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x40000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v21 & 0x8000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_58;
  }
LABEL_57:
  v36 = [NSNumber numberWithInt:self->_totalAppForAllActionTimeOfDayLaunches];
  [v3 setObject:v36 forKey:@"totalAppForAllActionTimeOfDayLaunches"];

  $5CAA899F79A00F8F7A1746E0416806BD v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v21 & 0x100000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_58:
  v37 = [NSNumber numberWithInt:self->_totalAppActionCoarseTimeOfDayLaunches];
  [v3 setObject:v37 forKey:@"totalAppActionCoarseTimeOfDayLaunches"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_43:
    v22 = [NSNumber numberWithInt:self->_totalAppForAllActionsCoarseTimeOfDayLaunches];
    [v3 setObject:v22 forKey:@"totalAppForAllActionsCoarseTimeOfDayLaunches"];
  }
LABEL_44:
  appActionSequence = self->_appActionSequence;
  if (appActionSequence)
  {
    v24 = [(AWDProactiveAppPredictionAppActionSequence *)appActionSequence dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"appActionSequence"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  id v26 = v3;

  return v26;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionIntentPredictionSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_actionDatas;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_appSequence) {
    PBDataWriterWriteSubmessage();
  }
  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
  if (self->_engagedActionCacheIndices.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_engagedActionCacheIndices.count);
  }
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&v12 & 0x80) == 0) {
        goto LABEL_24;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v12 & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v12 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v12 & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v12 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v12 & 0x4000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v12 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v12 & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v12 & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v12 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_34:
  }
    PBDataWriterWriteInt32Field();
LABEL_35:
  if (self->_abGroup) {
    PBDataWriterWriteStringField();
  }
  $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x100) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&v13 & 0x200) == 0) {
        goto LABEL_40;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v13 & 0x100) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x20000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v13 & 0x100000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_44:
  }
    PBDataWriterWriteInt32Field();
LABEL_45:
  if (self->_appActionSequence) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_timestamp;
    *((_DWORD *)v4 + 46) |= 1u;
  }
  id v17 = v4;
  if ([(AWDProactiveAppPredictionIntentPredictionSession *)self actionDatasCount])
  {
    [v17 clearActionDatas];
    unint64_t v5 = [(AWDProactiveAppPredictionIntentPredictionSession *)self actionDatasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(AWDProactiveAppPredictionIntentPredictionSession *)self actionDataAtIndex:i];
        [v17 addActionData:v8];
      }
    }
  }
  uint64_t v9 = v17;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 14) = self->_appActionCoreMotionCurrentMotionLaunches;
    *((_DWORD *)v17 + 46) |= 2u;
  }
  if (self->_appSequence)
  {
    objc_msgSend(v17, "setAppSequence:");
    uint64_t v9 = v17;
  }
  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_51:
    v9[23] = self->_currentLOIType;
    v9[46] |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v9[22] = self->_consumerSubType;
  v9[46] |= 8u;
  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0) {
    goto LABEL_51;
  }
LABEL_13:
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_14:
    v9[24] = self->_dayOfWeek;
    v9[46] |= 0x20u;
  }
LABEL_15:
  if ([(AWDProactiveAppPredictionIntentPredictionSession *)self engagedActionCacheIndicesCount])
  {
    [v17 clearEngagedActionCacheIndices];
    unint64_t v11 = [(AWDProactiveAppPredictionIntentPredictionSession *)self engagedActionCacheIndicesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
        objc_msgSend(v17, "addEngagedActionCacheIndices:", -[AWDProactiveAppPredictionIntentPredictionSession engagedActionCacheIndicesAtIndex:](self, "engagedActionCacheIndicesAtIndex:", j));
    }
  }
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  long long v15 = v17;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    *((_DWORD *)v17 + 25) = self->_engagementType;
    *((_DWORD *)v17 + 46) |= 0x40u;
    $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v14 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
    goto LABEL_21;
  }
  *((unsigned char *)v17 + 180) = self->_inAirplaneMode;
  *((_DWORD *)v17 + 46) |= 0x800000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v17 + 26) = self->_intentDonationDelay;
  *((_DWORD *)v17 + 46) |= 0x80u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)v17 + 181) = self->_isInternalBuild;
  *((_DWORD *)v17 + 46) |= 0x1000000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v17 + 29) = self->_logType;
  *((_DWORD *)v17 + 46) |= 0x400u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v17 + 30) = self->_predictionAge;
  *((_DWORD *)v17 + 46) |= 0x800u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v17 + 35) = self->_timeOfDayInterval;
  *((_DWORD *)v17 + 46) |= 0x2000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v17 + 36) = self->_totalAppActionAirplaneModeLaunches;
  *((_DWORD *)v17 + 46) |= 0x4000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v17 + 38) = self->_totalAppActionCurrentDayOfWeekLaunches;
  *((_DWORD *)v17 + 46) |= 0x10000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v14 & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v17 + 41) = self->_totalAppForAllActionsAirplaneModeLaunches;
  *((_DWORD *)v17 + 46) |= 0x80000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v14 & 0x400000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v17 + 43) = self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
  *((_DWORD *)v17 + 46) |= 0x200000u;
  $5CAA899F79A00F8F7A1746E0416806BD v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v14 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_64:
  *((_DWORD *)v17 + 44) = self->_uiFeedbackDelay;
  *((_DWORD *)v17 + 46) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_32:
    *((_DWORD *)v17 + 34) = self->_sessionLogVersion;
    *((_DWORD *)v17 + 46) |= 0x1000u;
  }
LABEL_33:
  if (self->_abGroup)
  {
    objc_msgSend(v17, "setAbGroup:");
    long long v15 = v17;
  }
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    v15[18] = self->_appForAllActionsCoreMotionCurrentMotionLaunches;
    v15[46] |= 4u;
    $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x100) == 0)
    {
LABEL_37:
      if ((*(_WORD *)&v16 & 0x200) == 0) {
        goto LABEL_38;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v16 & 0x100) == 0)
  {
    goto LABEL_37;
  }
  v15[27] = self->_locationDistanceFromHome;
  v15[46] |= 0x100u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v16 & 0x20000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_69;
  }
LABEL_68:
  v15[28] = self->_locationDistanceFromWork;
  v15[46] |= 0x200u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v16 & 0x40000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_70;
  }
LABEL_69:
  v15[39] = self->_totalAppActionTimeOfDayLaunches;
  v15[46] |= 0x20000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v16 & 0x8000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_71;
  }
LABEL_70:
  v15[40] = self->_totalAppForAllActionTimeOfDayLaunches;
  v15[46] |= 0x40000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v16 & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_71:
  v15[37] = self->_totalAppActionCoarseTimeOfDayLaunches;
  v15[46] |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_42:
    v15[42] = self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
    v15[46] |= 0x100000u;
  }
LABEL_43:
  if (self->_appActionSequence)
  {
    objc_msgSend(v17, "setAppActionSequence:");
    long long v15 = v17;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v17, "setSessionId:");
    long long v15 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = self->_actionDatas;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v11), "copyWithZone:", a3, (void)v25);
        [(id)v6 addActionData:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_appActionCoreMotionCurrentMotionLaunches;
    *(_DWORD *)(v6 + 184) |= 2u;
  }
  id v13 = -[AWDProactiveAppPredictionAppLaunchSequence copyWithZone:](self->_appSequence, "copyWithZone:", a3, (void)v25);
  $5CAA899F79A00F8F7A1746E0416806BD v14 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v13;

  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_consumerSubType;
    *(_DWORD *)(v6 + 184) |= 8u;
    $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_14:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 92) = self->_currentLOIType;
  *(_DWORD *)(v6 + 184) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 96) = self->_dayOfWeek;
    *(_DWORD *)(v6 + 184) |= 0x20u;
  }
LABEL_16:
  PBRepeatedInt32Copy();
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_engagementType;
    *(_DWORD *)(v6 + 184) |= 0x40u;
    $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x800000) == 0)
    {
LABEL_18:
      if ((*(unsigned char *)&v16 & 0x80) == 0) {
        goto LABEL_19;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x800000) == 0)
  {
    goto LABEL_18;
  }
  *(unsigned char *)(v6 + 180) = self->_inAirplaneMode;
  *(_DWORD *)(v6 + 184) |= 0x800000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v16 & 0x1000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 104) = self->_intentDonationDelay;
  *(_DWORD *)(v6 + 184) |= 0x80u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v16 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v6 + 181) = self->_isInternalBuild;
  *(_DWORD *)(v6 + 184) |= 0x1000000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v16 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 116) = self->_logType;
  *(_DWORD *)(v6 + 184) |= 0x400u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v16 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 120) = self->_predictionAge;
  *(_DWORD *)(v6 + 184) |= 0x800u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v16 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 140) = self->_timeOfDayInterval;
  *(_DWORD *)(v6 + 184) |= 0x2000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v16 & 0x10000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 144) = self->_totalAppActionAirplaneModeLaunches;
  *(_DWORD *)(v6 + 184) |= 0x4000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v16 & 0x80000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 152) = self->_totalAppActionCurrentDayOfWeekLaunches;
  *(_DWORD *)(v6 + 184) |= 0x10000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v16 & 0x200000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 164) = self->_totalAppForAllActionsAirplaneModeLaunches;
  *(_DWORD *)(v6 + 184) |= 0x80000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v16 & 0x400000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 172) = self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
  *(_DWORD *)(v6 + 184) |= 0x200000u;
  $5CAA899F79A00F8F7A1746E0416806BD v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v16 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_53:
  *(_DWORD *)(v6 + 176) = self->_uiFeedbackDelay;
  *(_DWORD *)(v6 + 184) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_29:
    *(_DWORD *)(v6 + 136) = self->_sessionLogVersion;
    *(_DWORD *)(v6 + 184) |= 0x1000u;
  }
LABEL_30:
  uint64_t v17 = [(NSString *)self->_abGroup copyWithZone:a3];
  $5CAA899F79A00F8F7A1746E0416806BD v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  $5CAA899F79A00F8F7A1746E0416806BD v19 = self->_has;
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_appForAllActionsCoreMotionCurrentMotionLaunches;
    *(_DWORD *)(v6 + 184) |= 4u;
    $5CAA899F79A00F8F7A1746E0416806BD v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x100) == 0)
    {
LABEL_32:
      if ((*(_WORD *)&v19 & 0x200) == 0) {
        goto LABEL_33;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v19 & 0x100) == 0)
  {
    goto LABEL_32;
  }
  *(_DWORD *)(v6 + 108) = self->_locationDistanceFromHome;
  *(_DWORD *)(v6 + 184) |= 0x100u;
  $5CAA899F79A00F8F7A1746E0416806BD v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v19 & 0x20000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 112) = self->_locationDistanceFromWork;
  *(_DWORD *)(v6 + 184) |= 0x200u;
  $5CAA899F79A00F8F7A1746E0416806BD v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x20000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v19 & 0x40000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 156) = self->_totalAppActionTimeOfDayLaunches;
  *(_DWORD *)(v6 + 184) |= 0x20000u;
  $5CAA899F79A00F8F7A1746E0416806BD v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x40000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v19 & 0x8000) == 0) {
      goto LABEL_36;
    }
LABEL_60:
    *(_DWORD *)(v6 + 148) = self->_totalAppActionCoarseTimeOfDayLaunches;
    *(_DWORD *)(v6 + 184) |= 0x8000u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_59:
  *(_DWORD *)(v6 + 160) = self->_totalAppForAllActionTimeOfDayLaunches;
  *(_DWORD *)(v6 + 184) |= 0x40000u;
  $5CAA899F79A00F8F7A1746E0416806BD v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x8000) != 0) {
    goto LABEL_60;
  }
LABEL_36:
  if ((*(_DWORD *)&v19 & 0x100000) != 0)
  {
LABEL_37:
    *(_DWORD *)(v6 + 168) = self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
    *(_DWORD *)(v6 + 184) |= 0x100000u;
  }
LABEL_38:
  id v20 = [(AWDProactiveAppPredictionAppActionSequence *)self->_appActionSequence copyWithZone:a3];
  $5CAA899F79A00F8F7A1746E0416806BD v21 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v20;

  uint64_t v22 = [(NSString *)self->_sessionId copyWithZone:a3];
  v23 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_147;
  }
  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  int v6 = *((_DWORD *)v4 + 46);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_147;
    }
  }
  else if (v6)
  {
    goto LABEL_147;
  }
  actionDatas = self->_actionDatas;
  if ((unint64_t)actionDatas | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](actionDatas, "isEqual:")) {
      goto LABEL_147;
    }
    $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_appActionCoreMotionCurrentMotionLaunches != *((_DWORD *)v4 + 14)) {
      goto LABEL_147;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_147;
  }
  appSequence = self->_appSequence;
  if ((unint64_t)appSequence | *((void *)v4 + 10))
  {
    if (!-[AWDProactiveAppPredictionAppLaunchSequence isEqual:](appSequence, "isEqual:")) {
      goto LABEL_147;
    }
    $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  }
  int v10 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_consumerSubType != *((_DWORD *)v4 + 22)) {
      goto LABEL_147;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_currentLOIType != *((_DWORD *)v4 + 23)) {
      goto LABEL_147;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 24)) {
      goto LABEL_147;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_147;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_147:
    char v17 = 0;
    goto LABEL_148;
  }
  $5CAA899F79A00F8F7A1746E0416806BD v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_engagementType != *((_DWORD *)v4 + 25)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0) {
      goto LABEL_147;
    }
    if (self->_inAirplaneMode)
    {
      if (!*((unsigned char *)v4 + 180)) {
        goto LABEL_147;
      }
    }
    else if (*((unsigned char *)v4 + 180))
    {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_intentDonationDelay != *((_DWORD *)v4 + 26)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_147;
    }
    if (self->_isInternalBuild)
    {
      if (!*((unsigned char *)v4 + 181)) {
        goto LABEL_147;
      }
    }
    else if (*((unsigned char *)v4 + 181))
    {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_logType != *((_DWORD *)v4 + 29)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_predictionAge != *((_DWORD *)v4 + 30)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_timeOfDayInterval != *((_DWORD *)v4 + 35)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_totalAppActionAirplaneModeLaunches != *((_DWORD *)v4 + 36)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_totalAppActionCurrentDayOfWeekLaunches != *((_DWORD *)v4 + 38)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_totalAppForAllActionsAirplaneModeLaunches != *((_DWORD *)v4 + 41)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x80000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0 || self->_totalAppForAllActionsCurrentDayOfWeekLaunches != *((_DWORD *)v4 + 43)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_uiFeedbackDelay != *((_DWORD *)v4 + 44)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_sessionLogVersion != *((_DWORD *)v4 + 34)) {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_147;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 5))
  {
    if (-[NSString isEqual:](abGroup, "isEqual:"))
    {
      $5CAA899F79A00F8F7A1746E0416806BD v11 = self->_has;
      goto LABEL_108;
    }
    goto LABEL_147;
  }
LABEL_108:
  int v14 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_appForAllActionsCoreMotionCurrentMotionLaunches != *((_DWORD *)v4 + 18)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_locationDistanceFromHome != *((_DWORD *)v4 + 27)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_locationDistanceFromWork != *((_DWORD *)v4 + 28)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v14 & 0x20000) == 0 || self->_totalAppActionTimeOfDayLaunches != *((_DWORD *)v4 + 39)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 0x20000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    if ((v14 & 0x40000) == 0 || self->_totalAppForAllActionTimeOfDayLaunches != *((_DWORD *)v4 + 40)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 0x40000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    if ((v14 & 0x8000) == 0 || self->_totalAppActionCoarseTimeOfDayLaunches != *((_DWORD *)v4 + 37)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 0x8000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0 || self->_totalAppForAllActionsCoarseTimeOfDayLaunches != *((_DWORD *)v4 + 42)) {
      goto LABEL_147;
    }
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_147;
  }
  appActionSequence = self->_appActionSequence;
  if ((unint64_t)appActionSequence | *((void *)v4 + 8)
    && !-[AWDProactiveAppPredictionAppActionSequence isEqual:](appActionSequence, "isEqual:"))
  {
    goto LABEL_147;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 16)) {
    char v17 = -[NSString isEqual:](sessionId, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_148:

  return v17;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v38 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v38 = 0;
  }
  uint64_t v37 = [(NSMutableArray *)self->_actionDatas hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v36 = 2654435761 * self->_appActionCoreMotionCurrentMotionLaunches;
  }
  else {
    uint64_t v36 = 0;
  }
  unint64_t v35 = [(AWDProactiveAppPredictionAppLaunchSequence *)self->_appSequence hash];
  $5CAA899F79A00F8F7A1746E0416806BD has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
    uint64_t v34 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v33 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  uint64_t v34 = 2654435761 * self->_consumerSubType;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v33 = 2654435761 * self->_currentLOIType;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_10:
    uint64_t v32 = 2654435761 * self->_dayOfWeek;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v32 = 0;
LABEL_14:
  uint64_t v31 = PBRepeatedInt32Hash();
  $5CAA899F79A00F8F7A1746E0416806BD v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
    uint64_t v30 = 2654435761 * self->_engagementType;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
    {
LABEL_16:
      uint64_t v29 = 2654435761 * self->_inAirplaneMode;
      if ((*(unsigned char *)&v4 & 0x80) != 0) {
        goto LABEL_17;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v29 = 0;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
LABEL_17:
    uint64_t v28 = 2654435761 * self->_intentDonationDelay;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_18:
    uint64_t v27 = 2654435761 * self->_isInternalBuild;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_19;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v27 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_19:
    uint64_t v26 = 2654435761 * self->_logType;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v26 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_20:
    uint64_t v24 = 2654435761 * self->_predictionAge;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v24 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_21:
    uint64_t v5 = 2654435761 * self->_timeOfDayInterval;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v5 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_22:
    uint64_t v6 = 2654435761 * self->_totalAppActionAirplaneModeLaunches;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_23:
    uint64_t v7 = 2654435761 * self->_totalAppActionCurrentDayOfWeekLaunches;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_24:
    uint64_t v8 = 2654435761 * self->_totalAppForAllActionsAirplaneModeLaunches;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_25:
    uint64_t v9 = 2654435761 * self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_26;
    }
LABEL_39:
    uint64_t v10 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_40;
  }
LABEL_38:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) == 0) {
    goto LABEL_39;
  }
LABEL_26:
  uint64_t v10 = 2654435761 * self->_uiFeedbackDelay;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_27:
    uint64_t v11 = 2654435761 * self->_sessionLogVersion;
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v11 = 0;
LABEL_41:
  NSUInteger v12 = [(NSString *)self->_abGroup hash];
  $5CAA899F79A00F8F7A1746E0416806BD v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    uint64_t v14 = 2654435761 * self->_appForAllActionsCoreMotionCurrentMotionLaunches;
    if ((*(_WORD *)&v13 & 0x100) != 0)
    {
LABEL_43:
      uint64_t v15 = 2654435761 * self->_locationDistanceFromHome;
      if ((*(_WORD *)&v13 & 0x200) != 0) {
        goto LABEL_44;
      }
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&v13 & 0x100) != 0) {
      goto LABEL_43;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
LABEL_44:
    uint64_t v16 = 2654435761 * self->_locationDistanceFromWork;
    if ((*(_DWORD *)&v13 & 0x20000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
LABEL_45:
    uint64_t v17 = 2654435761 * self->_totalAppActionTimeOfDayLaunches;
    if ((*(_DWORD *)&v13 & 0x40000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
LABEL_46:
    uint64_t v18 = 2654435761 * self->_totalAppForAllActionTimeOfDayLaunches;
    if ((*(_WORD *)&v13 & 0x8000) != 0) {
      goto LABEL_47;
    }
LABEL_54:
    uint64_t v19 = 0;
    if ((*(_DWORD *)&v13 & 0x100000) != 0) {
      goto LABEL_48;
    }
LABEL_55:
    uint64_t v20 = 0;
    goto LABEL_56;
  }
LABEL_53:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v13 & 0x8000) == 0) {
    goto LABEL_54;
  }
LABEL_47:
  uint64_t v19 = 2654435761 * self->_totalAppActionCoarseTimeOfDayLaunches;
  if ((*(_DWORD *)&v13 & 0x100000) == 0) {
    goto LABEL_55;
  }
LABEL_48:
  uint64_t v20 = 2654435761 * self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
LABEL_56:
  unint64_t v21 = v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  unint64_t v22 = v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(AWDProactiveAppPredictionAppActionSequence *)self->_appActionSequence hash];
  return v21 ^ v22 ^ [(NSString *)self->_sessionId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 184))
  {
    self->_timestamp = *((void *)v4 + 4);
    *(_DWORD *)&self->_has |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        -[AWDProactiveAppPredictionIntentPredictionSession addActionData:](self, "addActionData:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v5 + 184) & 2) != 0)
  {
    self->_appActionCoreMotionCurrentMotionLaunches = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 2u;
  }
  appSequence = self->_appSequence;
  uint64_t v12 = *((void *)v5 + 10);
  if (appSequence)
  {
    if (v12) {
      -[AWDProactiveAppPredictionAppLaunchSequence mergeFrom:](appSequence, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[AWDProactiveAppPredictionIntentPredictionSession setAppSequence:](self, "setAppSequence:");
  }
  int v13 = *((_DWORD *)v5 + 46);
  if ((v13 & 8) != 0)
  {
    self->_uint64_t consumerSubType = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 8u;
    int v13 = *((_DWORD *)v5 + 46);
    if ((v13 & 0x10) == 0)
    {
LABEL_19:
      if ((v13 & 0x20) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_19;
  }
  self->_uint64_t currentLOIType = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v5 + 46) & 0x20) != 0)
  {
LABEL_20:
    self->_dayOfWeek = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_21:
  uint64_t v14 = objc_msgSend(v5, "engagedActionCacheIndicesCount", (void)v21);
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t j = 0; j != v15; ++j)
      -[AWDProactiveAppPredictionIntentPredictionSession addEngagedActionCacheIndices:](self, "addEngagedActionCacheIndices:", [v5 engagedActionCacheIndicesAtIndex:j]);
  }
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x40) != 0)
  {
    self->_uint64_t engagementType = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x40u;
    int v17 = *((_DWORD *)v5 + 46);
    if ((v17 & 0x800000) == 0)
    {
LABEL_26:
      if ((v17 & 0x80) == 0) {
        goto LABEL_27;
      }
      goto LABEL_56;
    }
  }
  else if ((v17 & 0x800000) == 0)
  {
    goto LABEL_26;
  }
  self->_inAirplaneMode = *((unsigned char *)v5 + 180);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x80) == 0)
  {
LABEL_27:
    if ((v17 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_intentDonationDelay = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x80u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x1000000) == 0)
  {
LABEL_28:
    if ((v17 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_isInternalBuild = *((unsigned char *)v5 + 181);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x400) == 0)
  {
LABEL_29:
    if ((v17 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_logType = *((_DWORD *)v5 + 29);
  *(_DWORD *)&self->_has |= 0x400u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x800) == 0)
  {
LABEL_30:
    if ((v17 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_predictionAge = *((_DWORD *)v5 + 30);
  *(_DWORD *)&self->_has |= 0x800u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x2000) == 0)
  {
LABEL_31:
    if ((v17 & 0x4000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_timeOfDayInterval = *((_DWORD *)v5 + 35);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x4000) == 0)
  {
LABEL_32:
    if ((v17 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_totalAppActionAirplaneModeLaunches = *((_DWORD *)v5 + 36);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x10000) == 0)
  {
LABEL_33:
    if ((v17 & 0x80000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_totalAppActionCurrentDayOfWeekLaunches = *((_DWORD *)v5 + 38);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x80000) == 0)
  {
LABEL_34:
    if ((v17 & 0x200000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_totalAppForAllActionsAirplaneModeLaunches = *((_DWORD *)v5 + 41);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x200000) == 0)
  {
LABEL_35:
    if ((v17 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_totalAppForAllActionsCurrentDayOfWeekLaunches = *((_DWORD *)v5 + 43);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x400000) == 0)
  {
LABEL_36:
    if ((v17 & 0x1000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_65:
  self->_uiFeedbackDelay = *((_DWORD *)v5 + 44);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v5 + 46) & 0x1000) != 0)
  {
LABEL_37:
    self->_sessionLogVersion = *((_DWORD *)v5 + 34);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_38:
  if (*((void *)v5 + 5)) {
    -[AWDProactiveAppPredictionIntentPredictionSession setAbGroup:](self, "setAbGroup:");
  }
  int v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 4) != 0)
  {
    self->_appForAllActionsCoreMotionCurrentMotionLaunches = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 4u;
    int v18 = *((_DWORD *)v5 + 46);
    if ((v18 & 0x100) == 0)
    {
LABEL_42:
      if ((v18 & 0x200) == 0) {
        goto LABEL_43;
      }
      goto LABEL_69;
    }
  }
  else if ((v18 & 0x100) == 0)
  {
    goto LABEL_42;
  }
  self->_locationDistanceFromHome = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_has |= 0x100u;
  int v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x200) == 0)
  {
LABEL_43:
    if ((v18 & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_locationDistanceFromWork = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_has |= 0x200u;
  int v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x20000) == 0)
  {
LABEL_44:
    if ((v18 & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_totalAppActionTimeOfDayLaunches = *((_DWORD *)v5 + 39);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x40000) == 0)
  {
LABEL_45:
    if ((v18 & 0x8000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_totalAppForAllActionTimeOfDayLaunches = *((_DWORD *)v5 + 40);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x8000) == 0)
  {
LABEL_46:
    if ((v18 & 0x100000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_72:
  self->_totalAppActionCoarseTimeOfDayLaunches = *((_DWORD *)v5 + 37);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 46) & 0x100000) != 0)
  {
LABEL_47:
    self->_totalAppForAllActionsCoarseTimeOfDayLaunches = *((_DWORD *)v5 + 42);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_48:
  appActionSequence = self->_appActionSequence;
  uint64_t v20 = *((void *)v5 + 8);
  if (appActionSequence)
  {
    if (v20) {
      -[AWDProactiveAppPredictionAppActionSequence mergeFrom:](appActionSequence, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[AWDProactiveAppPredictionIntentPredictionSession setAppActionSequence:](self, "setAppActionSequence:");
  }
  if (*((void *)v5 + 16)) {
    -[AWDProactiveAppPredictionIntentPredictionSession setSessionId:](self, "setSessionId:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)actionDatas
{
  return self->_actionDatas;
}

- (void)setActionDatas:(id)a3
{
}

- (int)appActionCoreMotionCurrentMotionLaunches
{
  return self->_appActionCoreMotionCurrentMotionLaunches;
}

- (AWDProactiveAppPredictionAppLaunchSequence)appSequence
{
  return self->_appSequence;
}

- (void)setAppSequence:(id)a3
{
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (int)intentDonationDelay
{
  return self->_intentDonationDelay;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (int)logType
{
  return self->_logType;
}

- (int)predictionAge
{
  return self->_predictionAge;
}

- (int)timeOfDayInterval
{
  return self->_timeOfDayInterval;
}

- (int)totalAppActionAirplaneModeLaunches
{
  return self->_totalAppActionAirplaneModeLaunches;
}

- (int)totalAppActionCurrentDayOfWeekLaunches
{
  return self->_totalAppActionCurrentDayOfWeekLaunches;
}

- (int)totalAppForAllActionsAirplaneModeLaunches
{
  return self->_totalAppForAllActionsAirplaneModeLaunches;
}

- (int)totalAppForAllActionsCurrentDayOfWeekLaunches
{
  return self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
}

- (int)uiFeedbackDelay
{
  return self->_uiFeedbackDelay;
}

- (int)sessionLogVersion
{
  return self->_sessionLogVersion;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (int)appForAllActionsCoreMotionCurrentMotionLaunches
{
  return self->_appForAllActionsCoreMotionCurrentMotionLaunches;
}

- (int)locationDistanceFromHome
{
  return self->_locationDistanceFromHome;
}

- (int)locationDistanceFromWork
{
  return self->_locationDistanceFromWork;
}

- (int)totalAppActionTimeOfDayLaunches
{
  return self->_totalAppActionTimeOfDayLaunches;
}

- (int)totalAppForAllActionTimeOfDayLaunches
{
  return self->_totalAppForAllActionTimeOfDayLaunches;
}

- (int)totalAppActionCoarseTimeOfDayLaunches
{
  return self->_totalAppActionCoarseTimeOfDayLaunches;
}

- (int)totalAppForAllActionsCoarseTimeOfDayLaunches
{
  return self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
}

- (AWDProactiveAppPredictionAppActionSequence)appActionSequence
{
  return self->_appActionSequence;
}

- (void)setAppActionSequence:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_appSequence, 0);
  objc_storeStrong((id *)&self->_appActionSequence, 0);
  objc_storeStrong((id *)&self->_actionDatas, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end