@interface _HKFeatureFlags
- (BOOL)beryllium;
- (BOOL)bloodPressureTrends;
- (BOOL)chamomile;
- (BOOL)conceptAPIAndAuthorization;
- (BOOL)databaseStateCacheTransactionScoped;
- (BOOL)experimentalOrchestrationAdoption;
- (BOOL)expirementalOrchestrationAdoption;
- (BOOL)extendedLocalWatchData;
- (BOOL)harmonia;
- (BOOL)heartRatePush;
- (BOOL)lavender;
- (BOOL)lavender_hld_writes_data;
- (BOOL)maritime;
- (BOOL)maskRestingHeartRateSamplesWithSleepSamples;
- (BOOL)medicalIDV2;
- (BOOL)nebula;
- (BOOL)orchestrationCategories;
- (BOOL)orchestrationProfiles;
- (BOOL)pauseRings;
- (BOOL)percentInRange;
- (BOOL)pulse;
- (BOOL)regulatoryDomain;
- (BOOL)scheduledGoals;
- (BOOL)seahorse;
- (BOOL)shardedOntology;
- (BOOL)sharingPlus;
- (BOOL)sleepCloudKitManatee;
- (BOOL)sleepCloudKitSync;
- (BOOL)sleepOnIpad;
- (BOOL)sleepOnMac;
- (BOOL)snidgetAnimations;
- (BOOL)snidgets;
- (BOOL)snidgetsTinker;
- (BOOL)stanley;
- (BOOL)stringCache;
- (BOOL)summaryGradient;
- (BOOL)summaryOrchestration;
- (BOOL)timeInBedTracking;
- (BOOL)urgentNotificationDismiss;
- (BOOL)vrx;
- (BOOL)workoutCondenseOnLock;
- (BOOL)workoutSeriesAggregation;
- (BOOL)xpcGatedSecondaryJournalMerge;
- (BOOL)yodel;
- (id).cxx_construct;
- (void)setBeryllium:(BOOL)a3;
- (void)setBloodPressureTrends:(BOOL)a3;
- (void)setChamomile:(BOOL)a3;
- (void)setDatabaseStateCacheTransactionScoped:(BOOL)a3;
- (void)setExperimentalOrchestrationAdoption:(BOOL)a3;
- (void)setExtendedLocalWatchData:(BOOL)a3;
- (void)setHarmonia:(BOOL)a3;
- (void)setHeartRatePush:(BOOL)a3;
- (void)setLavender:(BOOL)a3;
- (void)setLavender_hld_writes_data:(BOOL)a3;
- (void)setMaritime:(BOOL)a3;
- (void)setMaskRestingHeartRateSamplesWithSleepSamples:(BOOL)a3;
- (void)setMedicalIDV2:(BOOL)a3;
- (void)setNebula:(BOOL)a3;
- (void)setOrchestrationCategories:(BOOL)a3;
- (void)setOrchestrationProfiles:(BOOL)a3;
- (void)setPauseRings:(BOOL)a3;
- (void)setPercentInRange:(BOOL)a3;
- (void)setPulse:(BOOL)a3;
- (void)setScheduledGoals:(BOOL)a3;
- (void)setShardedOntology:(BOOL)a3;
- (void)setSleepCloudKitManatee:(BOOL)a3;
- (void)setSleepCloudKitSync:(BOOL)a3;
- (void)setSleepOnIpad:(BOOL)a3;
- (void)setSleepOnMac:(BOOL)a3;
- (void)setSnidgetAnimations:(BOOL)a3;
- (void)setSnidgets:(BOOL)a3;
- (void)setSnidgetsTinker:(BOOL)a3;
- (void)setStanley:(BOOL)a3;
- (void)setStringCache:(BOOL)a3;
- (void)setSummaryGradient:(BOOL)a3;
- (void)setSummaryOrchestration:(BOOL)a3;
- (void)setTimeInBedTracking:(BOOL)a3;
- (void)setVrx:(BOOL)a3;
- (void)setWorkoutSeriesAggregation:(BOOL)a3;
- (void)setYodel:(BOOL)a3;
@end

@implementation _HKFeatureFlags

- (BOOL)pauseRings
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_121;
  v7 = v6;
  p_loadLock = &self->_pauseRings._loadLock;
  os_unfair_lock_lock(&self->_pauseRings._loadLock);
  if (self->_pauseRings._hasLoaded)
  {
    char value = self->_pauseRings._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_pauseRings._char value = value;
    self->_pauseRings._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setPauseRings:(BOOL)a3
{
  p_loadLock = &self->_pauseRings._loadLock;
  os_unfair_lock_lock(&self->_pauseRings._loadLock);
  self->_pauseRings._hasLoaded = 1;
  self->_pauseRings._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)scheduledGoals
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_8_0;
  v7 = v6;
  p_loadLock = &self->_scheduledGoals._loadLock;
  os_unfair_lock_lock(&self->_scheduledGoals._loadLock);
  if (self->_scheduledGoals._hasLoaded)
  {
    char value = self->_scheduledGoals._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_scheduledGoals._char value = value;
    self->_scheduledGoals._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setScheduledGoals:(BOOL)a3
{
  p_loadLock = &self->_scheduledGoals._loadLock;
  os_unfair_lock_lock(&self->_scheduledGoals._loadLock);
  self->_scheduledGoals._hasLoaded = 1;
  self->_scheduledGoals._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)bloodPressureTrends
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_11_0;
  v7 = v6;
  p_loadLock = &self->_bloodPressureTrends._loadLock;
  os_unfair_lock_lock(&self->_bloodPressureTrends._loadLock);
  if (self->_bloodPressureTrends._hasLoaded)
  {
    char value = self->_bloodPressureTrends._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_bloodPressureTrends._char value = value;
    self->_bloodPressureTrends._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setBloodPressureTrends:(BOOL)a3
{
  p_loadLock = &self->_bloodPressureTrends._loadLock;
  os_unfair_lock_lock(&self->_bloodPressureTrends._loadLock);
  self->_bloodPressureTrends._hasLoaded = 1;
  self->_bloodPressureTrends._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)chamomile
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_15_0;
  v7 = v6;
  p_loadLock = &self->_chamomile._loadLock;
  os_unfair_lock_lock(&self->_chamomile._loadLock);
  if (self->_chamomile._hasLoaded)
  {
    char value = self->_chamomile._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_chamomile._char value = value;
    self->_chamomile._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setChamomile:(BOOL)a3
{
  p_loadLock = &self->_chamomile._loadLock;
  os_unfair_lock_lock(&self->_chamomile._loadLock);
  self->_chamomile._hasLoaded = 1;
  self->_chamomile._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)conceptAPIAndAuthorization
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_18_0;
  v7 = v6;
  p_loadLock = &self->_conceptAPIAndAuthorization._loadLock;
  os_unfair_lock_lock(&self->_conceptAPIAndAuthorization._loadLock);
  if (self->_conceptAPIAndAuthorization._hasLoaded)
  {
    char value = self->_conceptAPIAndAuthorization._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_conceptAPIAndAuthorization._char value = value;
    self->_conceptAPIAndAuthorization._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (BOOL)databaseStateCacheTransactionScoped
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_21_4;
  v7 = v6;
  p_loadLock = &self->_databaseStateCacheTransactionScoped._loadLock;
  os_unfair_lock_lock(&self->_databaseStateCacheTransactionScoped._loadLock);
  if (self->_databaseStateCacheTransactionScoped._hasLoaded)
  {
    char value = self->_databaseStateCacheTransactionScoped._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_databaseStateCacheTransactionScoped._char value = value;
    self->_databaseStateCacheTransactionScoped._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setDatabaseStateCacheTransactionScoped:(BOOL)a3
{
  p_loadLock = &self->_databaseStateCacheTransactionScoped._loadLock;
  os_unfair_lock_lock(&self->_databaseStateCacheTransactionScoped._loadLock);
  self->_databaseStateCacheTransactionScoped._hasLoaded = 1;
  self->_databaseStateCacheTransactionScoped._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)extendedLocalWatchData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_25_2;
  v7 = v6;
  p_loadLock = &self->_extendedLocalWatchData._loadLock;
  os_unfair_lock_lock(&self->_extendedLocalWatchData._loadLock);
  if (self->_extendedLocalWatchData._hasLoaded)
  {
    char value = self->_extendedLocalWatchData._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_extendedLocalWatchData._char value = value;
    self->_extendedLocalWatchData._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setExtendedLocalWatchData:(BOOL)a3
{
  p_loadLock = &self->_extendedLocalWatchData._loadLock;
  os_unfair_lock_lock(&self->_extendedLocalWatchData._loadLock);
  self->_extendedLocalWatchData._hasLoaded = 1;
  self->_extendedLocalWatchData._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)experimentalOrchestrationAdoption
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_28;
  v7 = v6;
  p_loadLock = &self->_experimentalOrchestrationAdoption._loadLock;
  os_unfair_lock_lock(&self->_experimentalOrchestrationAdoption._loadLock);
  if (self->_experimentalOrchestrationAdoption._hasLoaded)
  {
    char value = self->_experimentalOrchestrationAdoption._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_experimentalOrchestrationAdoption._char value = value;
    self->_experimentalOrchestrationAdoption._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setExperimentalOrchestrationAdoption:(BOOL)a3
{
  p_loadLock = &self->_experimentalOrchestrationAdoption._loadLock;
  os_unfair_lock_lock(&self->_experimentalOrchestrationAdoption._loadLock);
  self->_experimentalOrchestrationAdoption._hasLoaded = 1;
  self->_experimentalOrchestrationAdoption._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)orchestrationCategories
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_31_0;
  v7 = v6;
  p_loadLock = &self->_orchestrationCategories._loadLock;
  os_unfair_lock_lock(&self->_orchestrationCategories._loadLock);
  if (self->_orchestrationCategories._hasLoaded)
  {
    char value = self->_orchestrationCategories._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_orchestrationCategories._char value = value;
    self->_orchestrationCategories._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setOrchestrationCategories:(BOOL)a3
{
  p_loadLock = &self->_orchestrationCategories._loadLock;
  os_unfair_lock_lock(&self->_orchestrationCategories._loadLock);
  self->_orchestrationCategories._hasLoaded = 1;
  self->_orchestrationCategories._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)orchestrationProfiles
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_34;
  v7 = v6;
  p_loadLock = &self->_orchestrationProfiles._loadLock;
  os_unfair_lock_lock(&self->_orchestrationProfiles._loadLock);
  if (self->_orchestrationProfiles._hasLoaded)
  {
    char value = self->_orchestrationProfiles._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_orchestrationProfiles._char value = value;
    self->_orchestrationProfiles._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setOrchestrationProfiles:(BOOL)a3
{
  p_loadLock = &self->_orchestrationProfiles._loadLock;
  os_unfair_lock_lock(&self->_orchestrationProfiles._loadLock);
  self->_orchestrationProfiles._hasLoaded = 1;
  self->_orchestrationProfiles._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)harmonia
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_37_3;
  v7 = v6;
  p_loadLock = &self->_harmonia._loadLock;
  os_unfair_lock_lock(&self->_harmonia._loadLock);
  if (self->_harmonia._hasLoaded)
  {
    char value = self->_harmonia._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_harmonia._char value = value;
    self->_harmonia._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setHarmonia:(BOOL)a3
{
  p_loadLock = &self->_harmonia._loadLock;
  os_unfair_lock_lock(&self->_harmonia._loadLock);
  self->_harmonia._hasLoaded = 1;
  self->_harmonia._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)lavender
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_40;
  v7 = v6;
  p_loadLock = &self->_lavender._loadLock;
  os_unfair_lock_lock(&self->_lavender._loadLock);
  if (self->_lavender._hasLoaded)
  {
    char value = self->_lavender._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_lavender._char value = value;
    self->_lavender._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setLavender:(BOOL)a3
{
  p_loadLock = &self->_lavender._loadLock;
  os_unfair_lock_lock(&self->_lavender._loadLock);
  self->_lavender._hasLoaded = 1;
  self->_lavender._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)lavender_hld_writes_data
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_43;
  v7 = v6;
  p_loadLock = &self->_lavender_hld_writes_data._loadLock;
  os_unfair_lock_lock(&self->_lavender_hld_writes_data._loadLock);
  if (self->_lavender_hld_writes_data._hasLoaded)
  {
    char value = self->_lavender_hld_writes_data._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_lavender_hld_writes_data._char value = value;
    self->_lavender_hld_writes_data._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setLavender_hld_writes_data:(BOOL)a3
{
  p_loadLock = &self->_lavender_hld_writes_data._loadLock;
  os_unfair_lock_lock(&self->_lavender_hld_writes_data._loadLock);
  self->_lavender_hld_writes_data._hasLoaded = 1;
  self->_lavender_hld_writes_data._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)maskRestingHeartRateSamplesWithSleepSamples
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_46_1;
  v7 = v6;
  p_loadLock = &self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock;
  os_unfair_lock_lock(&self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock);
  if (self->_maskRestingHeartRateSamplesWithSleepSamples._hasLoaded)
  {
    char value = self->_maskRestingHeartRateSamplesWithSleepSamples._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_maskRestingHeartRateSamplesWithSleepSamples._char value = value;
    self->_maskRestingHeartRateSamplesWithSleepSamples._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setMaskRestingHeartRateSamplesWithSleepSamples:(BOOL)a3
{
  p_loadLock = &self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock;
  os_unfair_lock_lock(&self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock);
  self->_maskRestingHeartRateSamplesWithSleepSamples._hasLoaded = 1;
  self->_maskRestingHeartRateSamplesWithSleepSamples._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)medicalIDV2
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_49;
  v7 = v6;
  p_loadLock = &self->_medicalIDV2._loadLock;
  os_unfair_lock_lock(&self->_medicalIDV2._loadLock);
  if (self->_medicalIDV2._hasLoaded)
  {
    char value = self->_medicalIDV2._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_medicalIDV2._char value = value;
    self->_medicalIDV2._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setMedicalIDV2:(BOOL)a3
{
  p_loadLock = &self->_medicalIDV2._loadLock;
  os_unfair_lock_lock(&self->_medicalIDV2._loadLock);
  self->_medicalIDV2._hasLoaded = 1;
  self->_medicalIDV2._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)heartRatePush
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_52_0;
  v7 = v6;
  p_loadLock = &self->_heartRatePush._loadLock;
  os_unfair_lock_lock(&self->_heartRatePush._loadLock);
  if (self->_heartRatePush._hasLoaded)
  {
    char value = self->_heartRatePush._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_heartRatePush._char value = value;
    self->_heartRatePush._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setHeartRatePush:(BOOL)a3
{
  p_loadLock = &self->_heartRatePush._loadLock;
  os_unfair_lock_lock(&self->_heartRatePush._loadLock);
  self->_heartRatePush._hasLoaded = 1;
  self->_heartRatePush._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)nebula
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_55;
  v7 = v6;
  p_loadLock = &self->_nebula._loadLock;
  os_unfair_lock_lock(&self->_nebula._loadLock);
  if (self->_nebula._hasLoaded)
  {
    char value = self->_nebula._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_nebula._char value = value;
    self->_nebula._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setNebula:(BOOL)a3
{
  p_loadLock = &self->_nebula._loadLock;
  os_unfair_lock_lock(&self->_nebula._loadLock);
  self->_nebula._hasLoaded = 1;
  self->_nebula._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)percentInRange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_58_0;
  v7 = v6;
  p_loadLock = &self->_percentInRange._loadLock;
  os_unfair_lock_lock(&self->_percentInRange._loadLock);
  if (self->_percentInRange._hasLoaded)
  {
    char value = self->_percentInRange._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_percentInRange._char value = value;
    self->_percentInRange._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setPercentInRange:(BOOL)a3
{
  p_loadLock = &self->_percentInRange._loadLock;
  os_unfair_lock_lock(&self->_percentInRange._loadLock);
  self->_percentInRange._hasLoaded = 1;
  self->_percentInRange._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)pulse
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_61;
  v7 = v6;
  p_loadLock = &self->_pulse._loadLock;
  os_unfair_lock_lock(&self->_pulse._loadLock);
  if (self->_pulse._hasLoaded)
  {
    char value = self->_pulse._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_pulse._char value = value;
    self->_pulse._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setPulse:(BOOL)a3
{
  p_loadLock = &self->_pulse._loadLock;
  os_unfair_lock_lock(&self->_pulse._loadLock);
  self->_pulse._hasLoaded = 1;
  self->_pulse._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)regulatoryDomain
{
  return _os_feature_enabled_impl();
}

- (BOOL)seahorse
{
  return 1;
}

- (BOOL)sharingPlus
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_65;
  v7 = v6;
  p_loadLock = &self->_sharingPlus._loadLock;
  os_unfair_lock_lock(&self->_sharingPlus._loadLock);
  if (self->_sharingPlus._hasLoaded)
  {
    char value = self->_sharingPlus._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_sharingPlus._char value = value;
    self->_sharingPlus._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (BOOL)shardedOntology
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_68;
  v7 = v6;
  p_loadLock = &self->_shardedOntology._loadLock;
  os_unfair_lock_lock(&self->_shardedOntology._loadLock);
  if (self->_shardedOntology._hasLoaded)
  {
    char value = self->_shardedOntology._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_shardedOntology._char value = value;
    self->_shardedOntology._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setShardedOntology:(BOOL)a3
{
  p_loadLock = &self->_shardedOntology._loadLock;
  os_unfair_lock_lock(&self->_shardedOntology._loadLock);
  self->_shardedOntology._hasLoaded = 1;
  self->_shardedOntology._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepCloudKitManatee
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_71;
  v7 = v6;
  p_loadLock = &self->_sleepCloudKitManatee._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitManatee._loadLock);
  if (self->_sleepCloudKitManatee._hasLoaded)
  {
    char value = self->_sleepCloudKitManatee._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_sleepCloudKitManatee._char value = value;
    self->_sleepCloudKitManatee._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSleepCloudKitManatee:(BOOL)a3
{
  p_loadLock = &self->_sleepCloudKitManatee._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitManatee._loadLock);
  self->_sleepCloudKitManatee._hasLoaded = 1;
  self->_sleepCloudKitManatee._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepCloudKitSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_74_1;
  v7 = v6;
  p_loadLock = &self->_sleepCloudKitSync._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitSync._loadLock);
  if (self->_sleepCloudKitSync._hasLoaded)
  {
    char value = self->_sleepCloudKitSync._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_sleepCloudKitSync._char value = value;
    self->_sleepCloudKitSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSleepCloudKitSync:(BOOL)a3
{
  p_loadLock = &self->_sleepCloudKitSync._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitSync._loadLock);
  self->_sleepCloudKitSync._hasLoaded = 1;
  self->_sleepCloudKitSync._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepOnIpad
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_77_0;
  v7 = v6;
  p_loadLock = &self->_sleepOnIpad._loadLock;
  os_unfair_lock_lock(&self->_sleepOnIpad._loadLock);
  if (self->_sleepOnIpad._hasLoaded)
  {
    char value = self->_sleepOnIpad._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_sleepOnIpad._char value = value;
    self->_sleepOnIpad._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSleepOnIpad:(BOOL)a3
{
  p_loadLock = &self->_sleepOnIpad._loadLock;
  os_unfair_lock_lock(&self->_sleepOnIpad._loadLock);
  self->_sleepOnIpad._hasLoaded = 1;
  self->_sleepOnIpad._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepOnMac
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_80_1;
  v7 = v6;
  p_loadLock = &self->_sleepOnMac._loadLock;
  os_unfair_lock_lock(&self->_sleepOnMac._loadLock);
  if (self->_sleepOnMac._hasLoaded)
  {
    char value = self->_sleepOnMac._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_sleepOnMac._char value = value;
    self->_sleepOnMac._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSleepOnMac:(BOOL)a3
{
  p_loadLock = &self->_sleepOnMac._loadLock;
  os_unfair_lock_lock(&self->_sleepOnMac._loadLock);
  self->_sleepOnMac._hasLoaded = 1;
  self->_sleepOnMac._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)stanley
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_83_0;
  v7 = v6;
  p_loadLock = &self->_stanley._loadLock;
  os_unfair_lock_lock(&self->_stanley._loadLock);
  if (self->_stanley._hasLoaded)
  {
    char value = self->_stanley._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_stanley._char value = value;
    self->_stanley._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setStanley:(BOOL)a3
{
  p_loadLock = &self->_stanley._loadLock;
  os_unfair_lock_lock(&self->_stanley._loadLock);
  self->_stanley._hasLoaded = 1;
  self->_stanley._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)snidgets
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_86_0;
  v7 = v6;
  p_loadLock = &self->_snidgets._loadLock;
  os_unfair_lock_lock(&self->_snidgets._loadLock);
  if (self->_snidgets._hasLoaded)
  {
    char value = self->_snidgets._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_snidgets._char value = value;
    self->_snidgets._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSnidgets:(BOOL)a3
{
  p_loadLock = &self->_snidgets._loadLock;
  os_unfair_lock_lock(&self->_snidgets._loadLock);
  self->_snidgets._hasLoaded = 1;
  self->_snidgets._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)snidgetsTinker
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_89_0;
  v7 = v6;
  p_loadLock = &self->_snidgetsTinker._loadLock;
  os_unfair_lock_lock(&self->_snidgetsTinker._loadLock);
  if (self->_snidgetsTinker._hasLoaded)
  {
    char value = self->_snidgetsTinker._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_snidgetsTinker._char value = value;
    self->_snidgetsTinker._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSnidgetsTinker:(BOOL)a3
{
  p_loadLock = &self->_snidgetsTinker._loadLock;
  os_unfair_lock_lock(&self->_snidgetsTinker._loadLock);
  self->_snidgetsTinker._hasLoaded = 1;
  self->_snidgetsTinker._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)snidgetAnimations
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_92;
  v7 = v6;
  p_loadLock = &self->_snidgetAnimations._loadLock;
  os_unfair_lock_lock(&self->_snidgetAnimations._loadLock);
  if (self->_snidgetAnimations._hasLoaded)
  {
    char value = self->_snidgetAnimations._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_snidgetAnimations._char value = value;
    self->_snidgetAnimations._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSnidgetAnimations:(BOOL)a3
{
  p_loadLock = &self->_snidgetAnimations._loadLock;
  os_unfair_lock_lock(&self->_snidgetAnimations._loadLock);
  self->_snidgetAnimations._hasLoaded = 1;
  self->_snidgetAnimations._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)summaryGradient
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_95;
  v7 = v6;
  p_loadLock = &self->_summaryGradient._loadLock;
  os_unfair_lock_lock(&self->_summaryGradient._loadLock);
  if (self->_summaryGradient._hasLoaded)
  {
    char value = self->_summaryGradient._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_summaryGradient._char value = value;
    self->_summaryGradient._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSummaryGradient:(BOOL)a3
{
  p_loadLock = &self->_summaryGradient._loadLock;
  os_unfair_lock_lock(&self->_summaryGradient._loadLock);
  self->_summaryGradient._hasLoaded = 1;
  self->_summaryGradient._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)summaryOrchestration
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_98_1;
  v7 = v6;
  p_loadLock = &self->_summaryOrchestration._loadLock;
  os_unfair_lock_lock(&self->_summaryOrchestration._loadLock);
  if (self->_summaryOrchestration._hasLoaded)
  {
    char value = self->_summaryOrchestration._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_summaryOrchestration._char value = value;
    self->_summaryOrchestration._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setSummaryOrchestration:(BOOL)a3
{
  p_loadLock = &self->_summaryOrchestration._loadLock;
  os_unfair_lock_lock(&self->_summaryOrchestration._loadLock);
  self->_summaryOrchestration._hasLoaded = 1;
  self->_summaryOrchestration._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)urgentNotificationDismiss
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_101;
  v7 = v6;
  p_loadLock = &self->_urgentNotificationDismiss._loadLock;
  os_unfair_lock_lock(&self->_urgentNotificationDismiss._loadLock);
  if (self->_urgentNotificationDismiss._hasLoaded)
  {
    char value = self->_urgentNotificationDismiss._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_urgentNotificationDismiss._char value = value;
    self->_urgentNotificationDismiss._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (BOOL)timeInBedTracking
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_104;
  v7 = v6;
  p_loadLock = &self->_timeInBedTracking._loadLock;
  os_unfair_lock_lock(&self->_timeInBedTracking._loadLock);
  if (self->_timeInBedTracking._hasLoaded)
  {
    char value = self->_timeInBedTracking._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_timeInBedTracking._char value = value;
    self->_timeInBedTracking._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  p_loadLock = &self->_timeInBedTracking._loadLock;
  os_unfair_lock_lock(&self->_timeInBedTracking._loadLock);
  self->_timeInBedTracking._hasLoaded = 1;
  self->_timeInBedTracking._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)vrx
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_107;
  v7 = v6;
  p_loadLock = &self->_vrx._loadLock;
  os_unfair_lock_lock(&self->_vrx._loadLock);
  if (self->_vrx._hasLoaded)
  {
    char value = self->_vrx._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_vrx._char value = value;
    self->_vrx._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setVrx:(BOOL)a3
{
  p_loadLock = &self->_vrx._loadLock;
  os_unfair_lock_lock(&self->_vrx._loadLock);
  self->_vrx._hasLoaded = 1;
  self->_vrx._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)workoutCondenseOnLock
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_110;
  v7 = v6;
  p_loadLock = &self->_workoutCondenseOnLock._loadLock;
  os_unfair_lock_lock(&self->_workoutCondenseOnLock._loadLock);
  if (self->_workoutCondenseOnLock._hasLoaded)
  {
    char value = self->_workoutCondenseOnLock._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_workoutCondenseOnLock._char value = value;
    self->_workoutCondenseOnLock._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (BOOL)workoutSeriesAggregation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_113;
  v7 = v6;
  p_loadLock = &self->_workoutSeriesAggregation._loadLock;
  os_unfair_lock_lock(&self->_workoutSeriesAggregation._loadLock);
  if (self->_workoutSeriesAggregation._hasLoaded)
  {
    char value = self->_workoutSeriesAggregation._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_workoutSeriesAggregation._char value = value;
    self->_workoutSeriesAggregation._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setWorkoutSeriesAggregation:(BOOL)a3
{
  p_loadLock = &self->_workoutSeriesAggregation._loadLock;
  os_unfair_lock_lock(&self->_workoutSeriesAggregation._loadLock);
  self->_workoutSeriesAggregation._hasLoaded = 1;
  self->_workoutSeriesAggregation._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)stringCache
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_116;
  v7 = v6;
  p_loadLock = &self->_stringCache._loadLock;
  os_unfair_lock_lock(&self->_stringCache._loadLock);
  if (self->_stringCache._hasLoaded)
  {
    char value = self->_stringCache._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_stringCache._char value = value;
    self->_stringCache._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setStringCache:(BOOL)a3
{
  p_loadLock = &self->_stringCache._loadLock;
  os_unfair_lock_lock(&self->_stringCache._loadLock);
  self->_stringCache._hasLoaded = 1;
  self->_stringCache._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)xpcGatedSecondaryJournalMerge
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_119;
  v7 = v6;
  p_loadLock = &self->_xpcGatedSecondaryJournalMerge._loadLock;
  os_unfair_lock_lock(&self->_xpcGatedSecondaryJournalMerge._loadLock);
  if (self->_xpcGatedSecondaryJournalMerge._hasLoaded)
  {
    char value = self->_xpcGatedSecondaryJournalMerge._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_xpcGatedSecondaryJournalMerge._char value = value;
    self->_xpcGatedSecondaryJournalMerge._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (BOOL)yodel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_122_0;
  v7 = v6;
  p_loadLock = &self->_yodel._loadLock;
  os_unfair_lock_lock(&self->_yodel._loadLock);
  if (self->_yodel._hasLoaded)
  {
    char value = self->_yodel._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_yodel._char value = value;
    self->_yodel._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setYodel:(BOOL)a3
{
  p_loadLock = &self->_yodel._loadLock;
  os_unfair_lock_lock(&self->_yodel._loadLock);
  self->_yodel._hasLoaded = 1;
  self->_yodel._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)maritime
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EEC5B8B0;
  v6[1] = &__block_literal_global_128_1;
  v7 = v6;
  p_loadLock = &self->_maritime._loadLock;
  os_unfair_lock_lock(&self->_maritime._loadLock);
  if (self->_maritime._hasLoaded)
  {
    char value = self->_maritime._value;
  }
  else
  {
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char value = (*(uint64_t (**)(void *))(*v7 + 48))(v7);
    self->_maritime._char value = value;
    self->_maritime._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v6);
  return value;
}

- (void)setMaritime:(BOOL)a3
{
  p_loadLock = &self->_maritime._loadLock;
  os_unfair_lock_lock(&self->_maritime._loadLock);
  self->_maritime._hasLoaded = 1;
  self->_maritime._char value = a3;

  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)expirementalOrchestrationAdoption
{
  return self->_expirementalOrchestrationAdoption;
}

- (BOOL)beryllium
{
  return self->_beryllium;
}

- (void)setBeryllium:(BOOL)a3
{
  self->_beryllium = a3;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  *((_DWORD *)self + 5) = 0;
  *((_DWORD *)self + 7) = 0;
  *((_DWORD *)self + 9) = 0;
  *((_DWORD *)self + 11) = 0;
  *((_DWORD *)self + 13) = 0;
  *((_DWORD *)self + 15) = 0;
  *((_DWORD *)self + 17) = 0;
  *((_DWORD *)self + 19) = 0;
  *((_DWORD *)self + 21) = 0;
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 25) = 0;
  *((_DWORD *)self + 27) = 0;
  *((_DWORD *)self + 29) = 0;
  *((_DWORD *)self + 31) = 0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 35) = 0;
  *((_DWORD *)self + 37) = 0;
  *((_DWORD *)self + 39) = 0;
  *((_DWORD *)self + 41) = 0;
  *((_DWORD *)self + 43) = 0;
  *((_DWORD *)self + 45) = 0;
  *((_DWORD *)self + 47) = 0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 51) = 0;
  *((_DWORD *)self + 53) = 0;
  *((_DWORD *)self + 55) = 0;
  *((_DWORD *)self + 57) = 0;
  *((_DWORD *)self + 59) = 0;
  *((_DWORD *)self + 61) = 0;
  *((_DWORD *)self + 63) = 0;
  *((_DWORD *)self + 65) = 0;
  *((_DWORD *)self + 67) = 0;
  *((_DWORD *)self + 69) = 0;
  *((_DWORD *)self + 71) = 0;
  *((_DWORD *)self + 73) = 0;
  *((_DWORD *)self + 75) = 0;
  *((_DWORD *)self + 77) = 0;
  *((_DWORD *)self + 79) = 0;
  *((_DWORD *)self + 81) = 0;
  *((_DWORD *)self + 83) = 0;
  *((_DWORD *)self + 85) = 0;
  *((_DWORD *)self + 87) = 0;
  return self;
}

@end