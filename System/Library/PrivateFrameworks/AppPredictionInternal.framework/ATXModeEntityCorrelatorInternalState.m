@interface ATXModeEntityCorrelatorInternalState
- (ATXModeEntityCorrelatorInternalState)init;
- (ATXModeEvent)mostRecentModeEvent;
- (BOOL)seenAtLeastOneEntityEvent;
- (NSCountedSet)globalEntityOccurrences;
- (NSCountedSet)modeLocalEntityOccurrences;
- (NSCountedSet)uniqueModeOccurrences;
- (NSDate)today;
- (NSMutableDictionary)entityToEntityFeaturesDict;
- (NSMutableDictionary)localDeviceGlobalAppLaunchesHistogramPerEntity;
- (NSMutableDictionary)localDeviceModeAppLaunchesHistogramPerEntity;
- (NSMutableDictionary)macDesktopGlobalAppLaunchesHistogramPerEntity;
- (NSMutableDictionary)macDesktopModeAppLaunchesHistogramPerEntity;
- (NSMutableDictionary)macPortableGlobalAppLaunchesHistogramPerEntity;
- (NSMutableDictionary)macPortableModeAppLaunchesHistogramPerEntity;
- (NSMutableDictionary)totalGlobalLaunchesHistogramPerEntity;
- (NSMutableDictionary)totalModeLaunchesHistogramPerEntity;
- (NSMutableSet)entitiesSeenForMostRecentModeEvent;
- (unint64_t)modeOccurrences;
- (void)setEntitiesSeenForMostRecentModeEvent:(id)a3;
- (void)setEntityToEntityFeaturesDict:(id)a3;
- (void)setGlobalEntityOccurrences:(id)a3;
- (void)setLocalDeviceGlobalAppLaunchesHistogramPerEntity:(id)a3;
- (void)setLocalDeviceModeAppLaunchesHistogramPerEntity:(id)a3;
- (void)setMacDesktopGlobalAppLaunchesHistogramPerEntity:(id)a3;
- (void)setMacDesktopModeAppLaunchesHistogramPerEntity:(id)a3;
- (void)setMacPortableGlobalAppLaunchesHistogramPerEntity:(id)a3;
- (void)setMacPortableModeAppLaunchesHistogramPerEntity:(id)a3;
- (void)setModeLocalEntityOccurrences:(id)a3;
- (void)setModeOccurrences:(unint64_t)a3;
- (void)setMostRecentModeEvent:(id)a3;
- (void)setSeenAtLeastOneEntityEvent:(BOOL)a3;
- (void)setTotalGlobalLaunchesHistogramPerEntity:(id)a3;
- (void)setTotalModeLaunchesHistogramPerEntity:(id)a3;
- (void)setUniqueModeOccurrences:(id)a3;
@end

@implementation ATXModeEntityCorrelatorInternalState

- (ATXModeEntityCorrelatorInternalState)init
{
  v32.receiver = self;
  v32.super_class = (Class)ATXModeEntityCorrelatorInternalState;
  v2 = [(ATXModeEntityCorrelatorInternalState *)&v32 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    globalEntityOccurrences = v2->_globalEntityOccurrences;
    v2->_globalEntityOccurrences = (NSCountedSet *)v3;

    uint64_t v5 = objc_opt_new();
    modeLocalEntityOccurrences = v2->_modeLocalEntityOccurrences;
    v2->_modeLocalEntityOccurrences = (NSCountedSet *)v5;

    uint64_t v7 = objc_opt_new();
    totalGlobalLaunchesHistogramPerEntity = v2->_totalGlobalLaunchesHistogramPerEntity;
    v2->_totalGlobalLaunchesHistogramPerEntity = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    totalModeLaunchesHistogramPerEntity = v2->_totalModeLaunchesHistogramPerEntity;
    v2->_totalModeLaunchesHistogramPerEntity = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    localDeviceGlobalAppLaunchesHistogramPerEntity = v2->_localDeviceGlobalAppLaunchesHistogramPerEntity;
    v2->_localDeviceGlobalAppLaunchesHistogramPerEntity = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    localDeviceModeAppLaunchesHistogramPerEntity = v2->_localDeviceModeAppLaunchesHistogramPerEntity;
    v2->_localDeviceModeAppLaunchesHistogramPerEntity = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    macPortableGlobalAppLaunchesHistogramPerEntity = v2->_macPortableGlobalAppLaunchesHistogramPerEntity;
    v2->_macPortableGlobalAppLaunchesHistogramPerEntity = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    macPortableModeAppLaunchesHistogramPerEntity = v2->_macPortableModeAppLaunchesHistogramPerEntity;
    v2->_macPortableModeAppLaunchesHistogramPerEntity = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    macDesktopGlobalAppLaunchesHistogramPerEntity = v2->_macDesktopGlobalAppLaunchesHistogramPerEntity;
    v2->_macDesktopGlobalAppLaunchesHistogramPerEntity = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    macDesktopModeAppLaunchesHistogramPerEntity = v2->_macDesktopModeAppLaunchesHistogramPerEntity;
    v2->_macDesktopModeAppLaunchesHistogramPerEntity = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    entitiesSeenForMostRecentModeEvent = v2->_entitiesSeenForMostRecentModeEvent;
    v2->_entitiesSeenForMostRecentModeEvent = (NSMutableSet *)v23;

    uint64_t v25 = objc_opt_new();
    uniqueModeOccurrences = v2->_uniqueModeOccurrences;
    v2->_uniqueModeOccurrences = (NSCountedSet *)v25;

    uint64_t v27 = objc_opt_new();
    entityToEntityFeaturesDict = v2->_entityToEntityFeaturesDict;
    v2->_entityToEntityFeaturesDict = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    today = v2->_today;
    v2->_today = (NSDate *)v29;
  }
  return v2;
}

- (NSCountedSet)globalEntityOccurrences
{
  return self->_globalEntityOccurrences;
}

- (void)setGlobalEntityOccurrences:(id)a3
{
}

- (NSCountedSet)modeLocalEntityOccurrences
{
  return self->_modeLocalEntityOccurrences;
}

- (void)setModeLocalEntityOccurrences:(id)a3
{
}

- (NSMutableDictionary)totalGlobalLaunchesHistogramPerEntity
{
  return self->_totalGlobalLaunchesHistogramPerEntity;
}

- (void)setTotalGlobalLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)totalModeLaunchesHistogramPerEntity
{
  return self->_totalModeLaunchesHistogramPerEntity;
}

- (void)setTotalModeLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)localDeviceGlobalAppLaunchesHistogramPerEntity
{
  return self->_localDeviceGlobalAppLaunchesHistogramPerEntity;
}

- (void)setLocalDeviceGlobalAppLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)localDeviceModeAppLaunchesHistogramPerEntity
{
  return self->_localDeviceModeAppLaunchesHistogramPerEntity;
}

- (void)setLocalDeviceModeAppLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)macPortableGlobalAppLaunchesHistogramPerEntity
{
  return self->_macPortableGlobalAppLaunchesHistogramPerEntity;
}

- (void)setMacPortableGlobalAppLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)macPortableModeAppLaunchesHistogramPerEntity
{
  return self->_macPortableModeAppLaunchesHistogramPerEntity;
}

- (void)setMacPortableModeAppLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)macDesktopGlobalAppLaunchesHistogramPerEntity
{
  return self->_macDesktopGlobalAppLaunchesHistogramPerEntity;
}

- (void)setMacDesktopGlobalAppLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableDictionary)macDesktopModeAppLaunchesHistogramPerEntity
{
  return self->_macDesktopModeAppLaunchesHistogramPerEntity;
}

- (void)setMacDesktopModeAppLaunchesHistogramPerEntity:(id)a3
{
}

- (NSMutableSet)entitiesSeenForMostRecentModeEvent
{
  return self->_entitiesSeenForMostRecentModeEvent;
}

- (void)setEntitiesSeenForMostRecentModeEvent:(id)a3
{
}

- (NSCountedSet)uniqueModeOccurrences
{
  return self->_uniqueModeOccurrences;
}

- (void)setUniqueModeOccurrences:(id)a3
{
}

- (NSMutableDictionary)entityToEntityFeaturesDict
{
  return self->_entityToEntityFeaturesDict;
}

- (void)setEntityToEntityFeaturesDict:(id)a3
{
}

- (ATXModeEvent)mostRecentModeEvent
{
  return self->_mostRecentModeEvent;
}

- (void)setMostRecentModeEvent:(id)a3
{
}

- (unint64_t)modeOccurrences
{
  return self->_modeOccurrences;
}

- (void)setModeOccurrences:(unint64_t)a3
{
  self->_modeOccurrences = a3;
}

- (BOOL)seenAtLeastOneEntityEvent
{
  return self->_seenAtLeastOneEntityEvent;
}

- (void)setSeenAtLeastOneEntityEvent:(BOOL)a3
{
  self->_seenAtLeastOneEntityEvent = a3;
}

- (NSDate)today
{
  return self->_today;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_mostRecentModeEvent, 0);
  objc_storeStrong((id *)&self->_entityToEntityFeaturesDict, 0);
  objc_storeStrong((id *)&self->_uniqueModeOccurrences, 0);
  objc_storeStrong((id *)&self->_entitiesSeenForMostRecentModeEvent, 0);
  objc_storeStrong((id *)&self->_macDesktopModeAppLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_macDesktopGlobalAppLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_macPortableModeAppLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_macPortableGlobalAppLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_localDeviceModeAppLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_localDeviceGlobalAppLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_totalModeLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_totalGlobalLaunchesHistogramPerEntity, 0);
  objc_storeStrong((id *)&self->_modeLocalEntityOccurrences, 0);
  objc_storeStrong((id *)&self->_globalEntityOccurrences, 0);
}

@end