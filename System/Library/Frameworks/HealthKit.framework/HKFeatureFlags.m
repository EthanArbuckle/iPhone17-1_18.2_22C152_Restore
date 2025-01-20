@interface HKFeatureFlags
@end

@implementation HKFeatureFlags

uint64_t __29___HKFeatureFlags_pauseRings__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __33___HKFeatureFlags_scheduledGoals__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __38___HKFeatureFlags_bloodPressureTrends__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __28___HKFeatureFlags_chamomile__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __45___HKFeatureFlags_conceptAPIAndAuthorization__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __54___HKFeatureFlags_databaseStateCacheTransactionScoped__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __41___HKFeatureFlags_extendedLocalWatchData__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __52___HKFeatureFlags_experimentalOrchestrationAdoption__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __42___HKFeatureFlags_orchestrationCategories__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __40___HKFeatureFlags_orchestrationProfiles__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __27___HKFeatureFlags_harmonia__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __27___HKFeatureFlags_lavender__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __43___HKFeatureFlags_lavender_hld_writes_data__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __62___HKFeatureFlags_maskRestingHeartRateSamplesWithSleepSamples__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __30___HKFeatureFlags_medicalIDV2__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __32___HKFeatureFlags_heartRatePush__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __25___HKFeatureFlags_nebula__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __33___HKFeatureFlags_percentInRange__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __24___HKFeatureFlags_pulse__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __30___HKFeatureFlags_sharingPlus__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __34___HKFeatureFlags_shardedOntology__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __39___HKFeatureFlags_sleepCloudKitManatee__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __36___HKFeatureFlags_sleepCloudKitSync__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __30___HKFeatureFlags_sleepOnIpad__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __29___HKFeatureFlags_sleepOnMac__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __26___HKFeatureFlags_stanley__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __27___HKFeatureFlags_snidgets__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __33___HKFeatureFlags_snidgetsTinker__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __36___HKFeatureFlags_snidgetAnimations__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __34___HKFeatureFlags_summaryGradient__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __39___HKFeatureFlags_summaryOrchestration__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __44___HKFeatureFlags_urgentNotificationDismiss__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __36___HKFeatureFlags_timeInBedTracking__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __22___HKFeatureFlags_vrx__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __40___HKFeatureFlags_workoutCondenseOnLock__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __43___HKFeatureFlags_workoutSeriesAggregation__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __30___HKFeatureFlags_stringCache__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __48___HKFeatureFlags_xpcGatedSecondaryJournalMerge__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __24___HKFeatureFlags_yodel__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v1 = [v0 BOOLForKey:@"YodelMarketingReviewers"];

  if (v1) {
    return 1;
  }

  return _os_feature_enabled_impl();
}

uint64_t __27___HKFeatureFlags_maritime__block_invoke()
{
  return _os_feature_enabled_impl();
}

@end