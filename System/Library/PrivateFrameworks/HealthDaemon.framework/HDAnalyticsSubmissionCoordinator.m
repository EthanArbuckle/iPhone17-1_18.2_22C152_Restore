@interface HDAnalyticsSubmissionCoordinator
- (BOOL)isEventUsed:(id)a3;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDAnalyticsSubmissionCoordinator)initWithDaemon:(id)a3;
- (HDAnalyticsSubmissionCoordinatorDelegate)unitTest_dailyAnalyticsObservers;
- (id)_createHealthStoreForProfileIdentifier:(id)a3;
- (void)_locked_sendDailyAnalyticsWithTimeout:(uint64_t)a1;
- (void)_logFaultForTimedOutObservers:(id)a3 timeoutSeconds:(double)a4;
- (void)_sendTinkerSyncEventWithLatency:(void *)a3 timeSinceLastSuccessfullPull:(void *)a4 configuration:(char)a5 success:(void *)a6 error:;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)attachments_reportDailyAnalytics:(id)a3;
- (void)attachments_reportDailyCloudAnalytics:(id)a3;
- (void)authorization_reportAuthRequestPromptedForBundleIdentifer:(id)a3 profileType:(int64_t)a4;
- (void)authorization_reportAuthRequestsFromBundleIdentifier:(id)a3 isExtension:(BOOL)a4 isAppleWatch:(BOOL)a5 shouldPrompt:(BOOL)a6;
- (void)cloudCache_reportCacheDiscrepancyForOperation:(id)a3 reason:(id)a4 containerIdentifier:(id)a5 databaseScope:(id)a6 error:(id)a7;
- (void)cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline:(id)a3 changedZonesCount:(int64_t)a4 deletedZonesCount:(int64_t)a5 changedRecordsCount:(int64_t)a6 deletedRecordsCount:(int64_t)a7;
- (void)cloudCache_reportCacheSyncAnalyticsForPipeline:(id)a3 operationCount:(int64_t)a4;
- (void)cloudCache_reportDailyCacheAnalyticsWithPushTargets:(int64_t)a3 pullTargets:(int64_t)a4 sharedDBSummarySharingZones:(int64_t)a5 privateDBSummarySharingZones:(int64_t)a6 unifiedZoneInSharedDB:(BOOL)a7 unifiedZoneInPrivateDB:(BOOL)a8 deviceContexts:(unint64_t)a9 deviceKeys:(unint64_t)a10 nilSyncIdentities:(unint64_t)a11;
- (void)cloudCache_reportWeeklyAnalyticsWithCacheValidation:(id)a3;
- (void)cloudSync_newChildAdded:(BOOL)a3;
- (void)cloudSync_operationFailed:(id)a3 error:(id)a4;
- (void)cloudSync_operationFinished:(id)a3;
- (void)cloudSync_operationStarted:(id)a3;
- (void)cloudSync_reportDailyAnalyticForProfileType:(int64_t)a3 syncEnabled:(BOOL)a4 syncDisabledError:(id)a5 primaryContainer:(id)a6 restoreComplete:(BOOL)a7 timeSinceRestoreStart:(id)a8 journalSize:(id)a9 oldestJournalAge:(id)a10 timeSinceLastSuccessfulPull:(id)a11 timeSinceLastSuccessfulPush:(id)a12 timeSinceLastSuccessfulLitePush:(id)a13 timeSinceLastPushForwardProgress:(id)a14 storeCount:(int64_t)a15 zoneCount:(int64_t)a16 hasUnifiedZone:(BOOL)a17 hasMasterZone:(BOOL)a18 hasMedicalID:(BOOL)a19 errorRequiringUserAction:(id)a20 childSyncIdentityCount:(int64_t)a21 canUpgradeToSyncIdentity:(BOOL)a22 startedUpgradeToSyncIdentity:(BOOL)a23 completedUpgradeToSyncIdentity:(BOOL)a24 iPhoneCount:(id)a25 iPadCount:(id)a26 watchCount:(id)a27 visionProCount:(id)a28 totalSyncsCount:(id)a29 successfulSyncPercentageCount:(id)a30;
- (void)cloudSync_reportFullSyncMetricsWithReason:(id)a3 shard:(id)a4 daysSincePreviousFullSync:(id)a5 totalDuration:(double)a6 activeDuration:(double)a7 numberOfRuns:(id)a8 incomplete:(BOOL)a9;
- (void)cloudSync_reportMissingManateeIdentityDuringFetchInContainer:(id)a3 zoneName:(id)a4 databaseScope:(int64_t)a5;
- (void)cloudSync_reportOwnershipChangeForMissingManateeIdentityDuringPush;
- (void)cloudSync_reportOwnershipChangeForProfile:(id)a3 reason:(id)a4;
- (void)cloudSync_reportPeriodicSyncFailureWithError:(id)a3 duration:(double)a4 type:(int64_t)a5;
- (void)cloudSync_reportPeriodicSyncStartForType:(int64_t)a3;
- (void)cloudSync_reportPeriodicSyncSuccessAfterDuration:(double)a3 type:(int64_t)a4;
- (void)cloudSync_reportPipelineFailed:(id)a3 error:(id)a4;
- (void)cloudSync_reportPipelineFinished:(id)a3;
- (void)cloudSync_reportPipelineStarted:(id)a3;
- (void)cloudSync_reportRebaseTriggeredByDeletionByUser:(BOOL)a3;
- (void)cloudSync_reportRestoreForProfile:(id)a3 startDate:(id)a4 endDate:(id)a5 duration:(double)a6 finishedJournalMerge:(BOOL)a7;
- (void)contextSync_operationSucceeded:(id)a3;
- (void)contextSync_triggerDuration:(double)a3;
- (void)database_reportCachedQueryEvent:(id)a3 cacheHits:(int64_t)a4 cacheMisses:(int64_t)a5 estimatedTotalBuckets:(unint64_t)a6;
- (void)database_reportDatabaseMigrationStatus:(int64_t)a3 database:(id)a4 schemaVersion:(int64_t)a5 error:(id)a6 profileType:(int64_t)a7;
- (void)database_reportJournalEntryInsertedForJournal:(int64_t)a3 entryClass:(id)a4 entrySize:(id)a5;
- (void)database_reportJournalMergeActivityResult:(int64_t)a3 duration:(double)a4 interruptions:(id)a5 error:(id)a6;
- (void)database_reportSQLiteCorruptionWithExtendedErrorCode:(int)a3 type:(int64_t)a4 profile:(id)a5 description:(id)a6 sqlStatement:(id)a7 failedObliterationAttempt:(BOOL)a8;
- (void)database_reportUnprotectedDatabaseIdentifier:(id)a3 doesNotMatchProtectedDatabaseIdentifier:(id)a4;
- (void)healthService_reportCountForAllServices:(id)a3 profileType:(int64_t)a4;
- (void)healthService_reportServiceType:(id)a3 duration:(double)a4 profileType:(int64_t)a5;
- (void)healthService_reportServiceTypeAdded:(id)a3 profileType:(int64_t)a4;
- (void)healthService_reportServiceTypeRemoved:(id)a3 profileType:(int64_t)a4;
- (void)heartDaily_reportHeartDailyAnalytics:(id)a3;
- (void)heartRate_reportDailyRestingHeartRate:(double)a3 sedentaryHeartRateCount:(int)a4 filteredSedentaryHeartRateCount:(int)a5 profileType:(int64_t)a6;
- (void)medicalID_dailyReport:(id)a3 sosContactStatus:(BOOL)a4 profileType:(int64_t)a5;
- (void)medicalID_reportHasBeenDeletedForProfileType:(int64_t)a3;
- (void)medicalID_reportHasBeenSetForProfileType:(int64_t)a3;
- (void)nanoSync_reportResponseStatusCode:(int)a3 profileType:(int64_t)a4;
- (void)nanoSync_reportSyncFailureWithReason:(id)a3 options:(unint64_t)a4 duration:(double)a5 profileType:(int64_t)a6 error:(id)a7;
- (void)nanoSync_reportSyncSuccessWithReason:(id)a3 options:(unint64_t)a4 duration:(double)a5 profileType:(int64_t)a6;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sendDailyAnalyticsWithTimeout:(double)a3 completion:(id)a4;
- (void)sendEvent:(id)a3 block:(id)a4;
- (void)stateSync_operationFailed:(id)a3 error:(id)a4;
- (void)stateSync_operationSucceeded:(id)a3;
- (void)stateSync_recordSize:(unint64_t)a3;
- (void)stateSync_subscriptionTriggeredDomain:(id)a3;
- (void)stateSync_triggerDuration:(double)a3;
- (void)summarySharing_reportDailyAnalytics:(id)a3 activeWatchProductType:(id)a4 age:(int64_t)a5 sex:(id)a6;
- (void)summarySharing_reportSetupOperation:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)tinker_pairingDidFailWithError:(id)a3 configuration:(id)a4 duration:(double)a5 stage:(int64_t)a6;
- (void)tinker_pairingDidFinishForConfiguration:(id)a3 duration:(double)a4;
- (void)tinker_syncFailedWithError:(id)a3 configuration:(id)a4;
- (void)tinker_syncFinishedWithLatency:(id)a3 timeSinceLastSuccessfullPull:(id)a4 configuration:(id)a5;
- (void)workout_reportGymKitWorkoutWithFitnessMachineType:(id)a3 manufacturer:(id)a4 timeToBeginExperience:(int64_t)a5 workoutEndError:(int64_t)a6;
- (void)workout_reportMirroringEventWithStartDuration:(double)a3 stopDuration:(double)a4 mirroringDuration:(double)a5 numOfSendDataRequests:(int64_t)a6 maxTimeToSendData:(double)a7 minTimeToSendData:(double)a8 avgTimeToSendData:(double)a9 isFirstParty:(BOOL)a10;
- (void)workout_reportWorkoutCondenserEventWithReason:(int64_t)a3 batchSize:(int64_t)a4 hasWatchSource:(BOOL)a5 duration:(double)a6 success:(BOOL)a7 error:(id)a8 workoutsToCondense:(int64_t)a9 workoutsToRecondense:(int64_t)a10 condensedWorkouts:(int64_t)a11 processedWorkouts:(int64_t)a12 createdSeries:(int64_t)a13 deletedSamples:(int64_t)a14;
- (void)workout_reportWorkoutEventWithHeartBeatFailures:(int64_t)a3 workoutDuration:(double)a4 isFirstParty:(BOOL)a5;
@end

@implementation HDAnalyticsSubmissionCoordinator

- (void)tinker_pairingDidFinishForConfiguration:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v7 = [NSString stringWithFormat:@"com.apple.healthd.tinker.%@", @"pairing"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFinishForConfiguration_duration___block_invoke;
  v9[3] = &unk_1E62F3258;
  double v11 = a4;
  id v10 = v6;
  id v8 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v7 block:v9];
}

id __93__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFinishForConfiguration_duration___block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F1CC38];
  v6[0] = @"success";
  v6[1] = @"duration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v2;
  v6[2] = @"setupType";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "setupType"));
  v7[2] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)tinker_pairingDidFailWithError:(id)a3 configuration:(id)a4 duration:(double)a5 stage:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  double v11 = [NSString stringWithFormat:@"com.apple.healthd.tinker.%@", @"pairing"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFailWithError_configuration_duration_stage___block_invoke;
  v14[3] = &unk_1E62F3280;
  double v17 = a5;
  id v15 = v10;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v11 block:v14];
}

id __104__HDAnalyticsSubmissionCoordinator_Tinker__tinker_pairingDidFailWithError_configuration_duration_stage___block_invoke(uint64_t a1)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v11[0] = MEMORY[0x1E4F1CC28];
  v10[0] = @"success";
  v10[1] = @"duration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v11[1] = v2;
  v10[2] = @"setupType";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "setupType"));
  v11[2] = v3;
  v10[3] = @"errorDomain";
  uint64_t v4 = [*(id *)(a1 + 40) domain];
  v5 = (void *)v4;
  id v6 = @"<null>";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v11[3] = v6;
  v10[4] = @"errorCode";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (void)tinker_syncFinishedWithLatency:(id)a3 timeSinceLastSuccessfullPull:(id)a4 configuration:(id)a5
{
}

- (void)_sendTinkerSyncEventWithLatency:(void *)a3 timeSinceLastSuccessfullPull:(void *)a4 configuration:(char)a5 success:(void *)a6 error:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a1)
  {
    id v15 = [NSString stringWithFormat:@"com.apple.healthd.tinker.%@", @"sync"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __133__HDAnalyticsSubmissionCoordinator_Tinker___sendTinkerSyncEventWithLatency_timeSinceLastSuccessfullPull_configuration_success_error___block_invoke;
    v16[3] = &unk_1E62F32A8;
    id v17 = v13;
    char v21 = a5;
    id v18 = v11;
    id v19 = v12;
    id v20 = v14;
    [a1 sendEvent:v15 block:v16];
  }
}

- (void)tinker_syncFailedWithError:(id)a3 configuration:(id)a4
{
}

id __133__HDAnalyticsSubmissionCoordinator_Tinker___sendTinkerSyncEventWithLatency_timeSinceLastSuccessfullPull_configuration_success_error___block_invoke(uint64_t a1)
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) repository];
  v3 = [v2 primaryCKContainer];
  uint64_t v4 = [*(id *)(a1 + 32) repository];
  v5 = [v4 profileIdentifier];
  id v6 = HDDatabaseForContainer(v3, v5);

  v27 = v6;
  uint64_t v7 = HDCKDatabaseScopeToString([v6 databaseScope]);
  v28[0] = @"container";
  v25 = [*(id *)(a1 + 32) analyticsDictionary];
  v24 = [v25 objectForKeyedSubscript:@"primaryContainer"];
  v29[0] = v24;
  v29[1] = v7;
  v26 = (void *)v7;
  v28[1] = @"database";
  v28[2] = @"reason";
  id v8 = [*(id *)(a1 + 32) analyticsDictionary];
  id v9 = [v8 objectForKeyedSubscript:@"reason"];
  v29[2] = v9;
  v28[3] = @"options";
  id v10 = [*(id *)(a1 + 32) analyticsDictionary];
  id v11 = [v10 objectForKeyedSubscript:@"options"];
  v29[3] = v11;
  v28[4] = @"group";
  id v12 = [*(id *)(a1 + 32) analyticsDictionary];
  id v13 = [v12 objectForKeyedSubscript:@"group"];
  v29[4] = v13;
  v28[5] = @"success";
  id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v29[5] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:6];
  id v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    [v16 setObject:v17 forKeyedSubscript:@"latency"];
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    [v16 setObject:v18 forKeyedSubscript:@"timeSinceLastSuccessfullPull"];
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v19 = [*(id *)(a1 + 56) domain];
    id v20 = (void *)v19;
    if (v19) {
      char v21 = (__CFString *)v19;
    }
    else {
      char v21 = @"<null>";
    }
    [v16 setObject:v21 forKeyedSubscript:@"errorDomain"];

    v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "code"));
    [v16 setObject:v22 forKeyedSubscript:@"errorCode"];
  }

  return v16;
}

- (void)medicalID_dailyReport:(id)a3 sosContactStatus:(BOOL)a4 profileType:(int64_t)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_dailyReport_sosContactStatus_profileType___block_invoke;
  v10[3] = &unk_1E62F5640;
  BOOL v13 = a4;
  id v11 = v8;
  int64_t v12 = a5;
  id v9 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.HealthApp.MedicalID.Daily" block:v10];
}

id __98__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_dailyReport_sosContactStatus_profileType___block_invoke(uint64_t a1)
{
  v49[23] = *MEMORY[0x1E4F143B8];
  v48[0] = @"allergyInfo";
  v47 = [*(id *)(a1 + 32) allergyInfo];
  if ([v47 length]) {
    v2 = &unk_1F17EAFC8;
  }
  else {
    v2 = &unk_1F17EAFE0;
  }
  v49[0] = v2;
  v48[1] = @"bloodType";
  if ([*(id *)(a1 + 32) bloodType]) {
    v3 = &unk_1F17EAFC8;
  }
  else {
    v3 = &unk_1F17EAFE0;
  }
  v49[1] = v3;
  v48[2] = @"clinicalContacts";
  v46 = [*(id *)(a1 + 32) clinicalContacts];
  if ([v46 count]) {
    uint64_t v4 = &unk_1F17EAFC8;
  }
  else {
    uint64_t v4 = &unk_1F17EAFE0;
  }
  v49[2] = v4;
  v48[3] = @"emergencyContacts";
  v45 = [*(id *)(a1 + 32) emergencyContacts];
  if ([v45 count]) {
    v5 = &unk_1F17EAFC8;
  }
  else {
    v5 = &unk_1F17EAFE0;
  }
  v49[3] = v5;
  v48[4] = @"gregorianBirthdate";
  v44 = [*(id *)(a1 + 32) gregorianBirthday];
  if (v44) {
    id v6 = &unk_1F17EAFC8;
  }
  else {
    id v6 = &unk_1F17EAFE0;
  }
  v49[4] = v6;
  v48[5] = @"height";
  v43 = [*(id *)(a1 + 32) height];
  if (v43) {
    uint64_t v7 = &unk_1F17EAFC8;
  }
  else {
    uint64_t v7 = &unk_1F17EAFE0;
  }
  v49[5] = v7;
  v48[6] = @"isShownOnLockScreen";
  if ([*(id *)(a1 + 32) isDisabled]) {
    id v8 = &unk_1F17EAFE0;
  }
  else {
    id v8 = &unk_1F17EAFC8;
  }
  v49[6] = v8;
  v48[7] = @"medicalConditions";
  v42 = [*(id *)(a1 + 32) medicalConditions];
  if ([v42 length]) {
    id v9 = &unk_1F17EAFC8;
  }
  else {
    id v9 = &unk_1F17EAFE0;
  }
  v49[7] = v9;
  v48[8] = @"medicalNotes";
  v41 = [*(id *)(a1 + 32) medicalNotes];
  if ([v41 length]) {
    id v10 = &unk_1F17EAFC8;
  }
  else {
    id v10 = &unk_1F17EAFE0;
  }
  v49[8] = v10;
  v48[9] = @"medicationInfo";
  v40 = [*(id *)(a1 + 32) medicationInfo];
  if ([v40 length]) {
    id v11 = &unk_1F17EAFC8;
  }
  else {
    id v11 = &unk_1F17EAFE0;
  }
  v49[9] = v11;
  v48[10] = @"name";
  v39 = [*(id *)(a1 + 32) name];
  if (v39) {
    int64_t v12 = &unk_1F17EAFC8;
  }
  else {
    int64_t v12 = &unk_1F17EAFE0;
  }
  v49[10] = v12;
  v48[11] = @"organDonorStatus";
  v38 = [*(id *)(a1 + 32) isOrganDonor];
  if (v38) {
    BOOL v13 = &unk_1F17EAFC8;
  }
  else {
    BOOL v13 = &unk_1F17EAFE0;
  }
  v49[11] = v13;
  v48[12] = @"picture";
  v37 = [*(id *)(a1 + 32) pictureData];
  if (v37) {
    id v14 = &unk_1F17EAFC8;
  }
  else {
    id v14 = &unk_1F17EAFE0;
  }
  v49[12] = v14;
  v48[13] = @"primaryLanguageCode";
  uint64_t v35 = [*(id *)(a1 + 32) primaryLanguageCode];
  if (v35) {
    id v15 = &unk_1F17EAFC8;
  }
  else {
    id v15 = &unk_1F17EAFE0;
  }
  v49[13] = v15;
  v48[14] = @"shareDuringEmergency";
  if (objc_msgSend(*(id *)(a1 + 32), "shareDuringEmergency", v35)) {
    id v16 = &unk_1F17EAFC8;
  }
  else {
    id v16 = &unk_1F17EAFE0;
  }
  v49[14] = v16;
  v48[15] = @"weight";
  uint64_t v17 = [*(id *)(a1 + 32) weight];
  if (v17) {
    uint64_t v18 = &unk_1F17EAFC8;
  }
  else {
    uint64_t v18 = &unk_1F17EAFE0;
  }
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v19 = &unk_1F17EAFE0;
  }
  else {
    uint64_t v19 = &unk_1F17EAFC8;
  }
  v49[15] = v18;
  v49[16] = v19;
  v48[16] = @"sosContactBug";
  v48[17] = @"profileType";
  id v20 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v49[17] = v20;
  v48[18] = @"medicationsList";
  char v21 = [*(id *)(a1 + 32) medicationsList];
  if ([v21 count]) {
    v22 = &unk_1F17EAFC8;
  }
  else {
    v22 = &unk_1F17EAFE0;
  }
  v49[18] = v22;
  v48[19] = @"allergiesList";
  v23 = [*(id *)(a1 + 32) allergiesList];
  if ([v23 count]) {
    v24 = &unk_1F17EAFC8;
  }
  else {
    v24 = &unk_1F17EAFE0;
  }
  v49[19] = v24;
  v48[20] = @"conditionsList";
  v25 = [*(id *)(a1 + 32) conditionsList];
  if ([v25 count]) {
    v26 = &unk_1F17EAFC8;
  }
  else {
    v26 = &unk_1F17EAFE0;
  }
  v49[20] = v26;
  v48[21] = @"pregnancyStartDate";
  v27 = [*(id *)(a1 + 32) pregnancyStartDate];
  if (v27) {
    v28 = &unk_1F17EAFC8;
  }
  else {
    v28 = &unk_1F17EAFE0;
  }
  v49[21] = v28;
  v48[22] = @"pregnancyEstimatedDueDate";
  v29 = [*(id *)(a1 + 32) pregnancyEstimatedDueDate];
  if (v29) {
    v30 = &unk_1F17EAFC8;
  }
  else {
    v30 = &unk_1F17EAFE0;
  }
  v49[22] = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:23];
  v32 = (void *)[v31 mutableCopy];

  if (*(void *)(a1 + 40) == 3) {
    [v32 removeObjectForKey:@"sosContactBug"];
  }
  v33 = (void *)[v32 copy];

  return v33;
}

- (void)medicalID_reportHasBeenSetForProfileType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenSetForProfileType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.MedicalID.hasBeenSet" block:v3];
}

id __88__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenSetForProfileType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"profileType";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)medicalID_reportHasBeenDeletedForProfileType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenDeletedForProfileType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.MedicalID.hasBeenDeleted" block:v3];
}

id __92__HDAnalyticsSubmissionCoordinator_MedicalID__medicalID_reportHasBeenDeletedForProfileType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"profileType";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)heartDaily_reportHeartDailyAnalytics:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 payload];
  _HKInitializeLogging();
  v5 = HKLogAnalytics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Submitting CoreAnalytics heart daily analytics: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__HDAnalyticsSubmissionCoordinator_HeartDaily__heartDaily_reportHeartDailyAnalytics___block_invoke;
  v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.health.HeartRhythm.HeartDailyAnalytics" block:v7];
}

id __85__HDAnalyticsSubmissionCoordinator_HeartDaily__heartDaily_reportHeartDailyAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)healthService_reportServiceTypeAdded:(id)a3 profileType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeAdded_profileType___block_invoke;
  v8[3] = &unk_1E62F3258;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.services" block:v8];
}

id __100__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeAdded_profileType___block_invoke(uint64_t a1)
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"serviceType";
  v5[1] = @"added";
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = MEMORY[0x1E4F1CC38];
  void v5[2] = @"profileType";
  v2 = [NSNumber numberWithInteger:v1];
  v6[2] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)healthService_reportServiceTypeRemoved:(id)a3 profileType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeRemoved_profileType___block_invoke;
  v8[3] = &unk_1E62F3258;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.services" block:v8];
}

id __102__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceTypeRemoved_profileType___block_invoke(uint64_t a1)
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"serviceType";
  v5[1] = @"removed";
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = MEMORY[0x1E4F1CC38];
  void v5[2] = @"profileType";
  v2 = [NSNumber numberWithInteger:v1];
  v6[2] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)healthService_reportCountForAllServices:(id)a3 profileType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportCountForAllServices_profileType___block_invoke;
  v8[3] = &unk_1E62F3258;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.services" block:v8];
}

id __103__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportCountForAllServices_profileType___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = @"servicesCount";
  v6[1] = @"profileType";
  v7[0] = v2;
  v3 = [NSNumber numberWithInteger:v1];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)healthService_reportServiceType:(id)a3 duration:(double)a4 profileType:(int64_t)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceType_duration_profileType___block_invoke;
  v10[3] = &unk_1E62F7018;
  id v11 = v8;
  double v12 = a4;
  int64_t v13 = a5;
  id v9 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.services.connection-duration" block:v10];
}

id __104__HDAnalyticsSubmissionCoordinator_HealthService__healthService_reportServiceType_duration_profileType___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = *(void *)(a1 + 32);
  v6[0] = @"serviceType";
  v6[1] = @"duration";
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v2;
  void v6[2] = @"profileType";
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v7[2] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)authorization_reportAuthRequestsFromBundleIdentifier:(id)a3 isExtension:(BOOL)a4 isAppleWatch:(BOOL)a5 shouldPrompt:(BOOL)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __142__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestsFromBundleIdentifier_isExtension_isAppleWatch_shouldPrompt___block_invoke;
  v12[3] = &unk_1E62F80A0;
  id v13 = v10;
  BOOL v14 = a4;
  BOOL v15 = a5;
  BOOL v16 = a6;
  id v11 = v10;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.authorization.request" block:v12];
}

id __142__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestsFromBundleIdentifier_isExtension_isAppleWatch_shouldPrompt___block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(__CFString **)(a1 + 32);
  if (!v2) {
    uint64_t v2 = @"Unknown";
  }
  v9[0] = v2;
  v8[0] = @"bundleIdentifier";
  v8[1] = @"isExtension";
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v9[1] = v3;
  v8[2] = @"isAppleWatch";
  uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v9[2] = v4;
  v8[3] = @"shouldPrompt";
  v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)authorization_reportAuthRequestPromptedForBundleIdentifer:(id)a3 profileType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestPromptedForBundleIdentifer_profileType___block_invoke;
  v8[3] = &unk_1E62F3258;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.authorization.prompt" block:v8];
}

id __121__HDAnalyticsSubmissionCoordinator_Authorization__authorization_reportAuthRequestPromptedForBundleIdentifer_profileType___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = *(__CFString **)(a1 + 32);
  }
  else {
    uint64_t v2 = @"Unknown";
  }
  v6[0] = @"bundleIdentifier";
  v6[1] = @"profileType";
  v7[0] = v2;
  v3 = [NSNumber numberWithInteger:v1];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)attachments_reportDailyAnalytics:(id)a3
{
  id v4 = a3;
  if ([(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __82__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyAnalytics___block_invoke;
    void v5[3] = &unk_1E62FEA38;
    id v6 = v4;
    [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.health.attachments.daily" block:v5];
  }
}

id __82__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyAnalytics___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachments"));
  [v2 setObject:v3 forKeyedSubscript:@"numberOfAttachments"];

  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfReferences"));
  [v2 setObject:v4 forKeyedSubscript:@"numberOfReferences"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfTombstones"));
  [v2 setObject:v5 forKeyedSubscript:@"numberOfTombstones"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalSizeOfFiles"));
  [v2 setObject:v6 forKeyedSubscript:@"totalSizeOfFiles"];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfUnconfirmedFiles"));
  [v2 setObject:v7 forKeyedSubscript:@"numberOfUnconfirmedFiles"];

  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedAttachments"));
  [v2 setObject:v8 forKeyedSubscript:@"numberOfOrphanedAttachments"];

  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedReferences"));
  [v2 setObject:v9 forKeyedSubscript:@"numberOfOrphanedReferences"];

  int64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfReferencesCreatedLast24Hours"));
  [v2 setObject:v10 forKeyedSubscript:@"numberOfReferencesCreatedLast24Hours"];

  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentsCreatedLast24Hours"));
  [v2 setObject:v11 forKeyedSubscript:@"numberOfAttachmentsCreatedLast24Hours"];

  double v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfTombstonesCreatedLast24Hours"));
  [v2 setObject:v12 forKeyedSubscript:@"numberOfTombstonesCreatedLast24Hours"];

  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentsWithMultipleReferences"));
  [v2 setObject:v13 forKeyedSubscript:@"numberOfAttachmentsWithMultipleReferences"];

  return v2;
}

- (void)attachments_reportDailyCloudAnalytics:(id)a3
{
  id v4 = a3;
  if ([(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __87__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyCloudAnalytics___block_invoke;
    void v5[3] = &unk_1E62FEA38;
    id v6 = v4;
    [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.health.sync.cloud.cache.attachments.daily" block:v5];
  }
}

id __87__HDAnalyticsSubmissionCoordinator_Attachments__attachments_reportDailyCloudAnalytics___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfAttachmentRecords"));
  [v2 setObject:v3 forKeyedSubscript:@"numberOfAttachmentRecords"];

  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfReferenceRecords"));
  [v2 setObject:v4 forKeyedSubscript:@"numberOfReferenceRecords"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfTombstoneRecords"));
  [v2 setObject:v5 forKeyedSubscript:@"numberOfTombstoneRecords"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedAttachmentRecords"));
  [v2 setObject:v6 forKeyedSubscript:@"numberOfOrphanedAttachmentRecords"];

  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "numberOfOrphanedReferenceRecords"));
  [v2 setObject:v7 forKeyedSubscript:@"numberOfOrphanedReferenceRecords"];

  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "percentageOfAttachmentsWithAssetData"));
  [v2 setObject:v8 forKeyedSubscript:@"percentageOfAttachmentsWithAssetData"];

  return v2;
}

- (void)heartRate_reportDailyRestingHeartRate:(double)a3 sedentaryHeartRateCount:(int)a4 filteredSedentaryHeartRateCount:(int)a5 profileType:(int64_t)a6
{
  if (a4 < 1) {
    float v8 = -1.0;
  }
  else {
    float v8 = (float)a5 / (float)a4;
  }
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __153__HDAnalyticsSubmissionCoordinator_HeartRate__heartRate_reportDailyRestingHeartRate_sedentaryHeartRateCount_filteredSedentaryHeartRateCount_profileType___block_invoke;
  v9[3] = &unk_1E6300D98;
  void v9[4] = self;
  void v9[5] = a6;
  *(double *)&v9[6] = a3;
  int v10 = a4;
  int v11 = a5;
  float v12 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.hid.bghr_rhr_eod" block:v9];
}

id __153__HDAnalyticsSubmissionCoordinator_HeartRate__heartRate_reportDailyRestingHeartRate_sedentaryHeartRateCount_filteredSedentaryHeartRateCount_profileType___block_invoke(uint64_t a1)
{
  v19[5] = *MEMORY[0x1E4F143B8];
  v18[0] = @"pop";
  if (*(void *)(a1 + 32)) {
    BOOL v2 = *(void *)(a1 + 40) == 3;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = v2;
  id v4 = [NSNumber numberWithInt:v3];
  v19[0] = v4;
  v18[1] = @"output_value";
  v5 = NSNumber;
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 48);
    if (v6 < 30.0)
    {
LABEL_9:
      uint64_t v7 = 1;
      goto LABEL_20;
    }
    if (v6 <= 189.0)
    {
      if (![&unk_1F17E98D0 count]) {
        goto LABEL_9;
      }
      float v8 = [&unk_1F17E98D0 objectAtIndexedSubscript:0];
      if (v6 >= (double)(int)[v8 intValue])
      {
        uint64_t v9 = -1;
        while (1)
        {

          if ([&unk_1F17E98D0 count] <= (unint64_t)(v9 + 2)) {
            goto LABEL_9;
          }
          float v8 = [&unk_1F17E98D0 objectAtIndexedSubscript:v9 + 2];
          ++v9;
          if (v6 < (double)(int)[v8 intValue]) {
            goto LABEL_19;
          }
        }
      }
      LODWORD(v9) = 0x80000000;
LABEL_19:
      int v10 = [&unk_1F17E98E8 objectAtIndexedSubscript:(int)v9];
      uint64_t v7 = [v10 intValue];
    }
    else
    {
      uint64_t v7 = 3;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_20:
  int v11 = [v5 numberWithInt:v7];
  v19[1] = v11;
  v18[2] = @"raw_count";
  float v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v19[2] = v12;
  v18[3] = @"filtered_count";
  uint64_t v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v19[3] = v13;
  v18[4] = @"filtered_frac";
  LODWORD(v14) = *(_DWORD *)(a1 + 64);
  BOOL v15 = [NSNumber numberWithFloat:v14];
  v19[4] = v15;
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  return v16;
}

- (void)nanoSync_reportResponseStatusCode:(int)a3 profileType:(int64_t)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"com.apple.healthd.sync.nano.%@", @"reponse-status"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportResponseStatusCode_profileType___block_invoke;
  v8[3] = &__block_descriptor_44_e19___NSDictionary_8__0l;
  int v9 = a3;
  void v8[4] = a4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v7 block:v8];
}

id __92__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportResponseStatusCode_profileType___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"statusCode";
  BOOL v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v6[1] = @"profileType";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)nanoSync_reportSyncSuccessWithReason:(id)a3 options:(unint64_t)a4 duration:(double)a5 profileType:(int64_t)a6
{
  id v10 = a3;
  int v11 = [NSString stringWithFormat:@"com.apple.healthd.sync.nano.%@", @"sync.finished"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncSuccessWithReason_options_duration_profileType___block_invoke;
  v13[3] = &unk_1E6303760;
  id v14 = v10;
  unint64_t v15 = a4;
  double v16 = a5;
  int64_t v17 = a6;
  id v12 = v10;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v11 block:v13];
}

id __112__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncSuccessWithReason_options_duration_profileType___block_invoke(uint64_t a1)
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F1CC38];
  v14[0] = @"success";
  v14[1] = @"reason";
  BOOL v2 = *(void **)(a1 + 32);
  unint64_t v3 = [v2 length];
  if (v3 >= 0x400) {
    uint64_t v4 = 1024;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = [v2 substringToIndex:v4];
  v15[1] = v5;
  v14[2] = @"optionPullRequest";
  double v6 = [NSNumber numberWithInt:*(_DWORD *)(a1 + 40) & 1];
  v15[2] = v6;
  v14[3] = @"optionsLastChange";
  uint64_t v7 = [NSNumber numberWithInt:(*(_DWORD *)(a1 + 40) >> 1) & 1];
  v15[3] = v7;
  void v14[4] = @"optionsActiveOnly";
  float v8 = [NSNumber numberWithInt:(*(_DWORD *)(a1 + 40) >> 2) & 1];
  v15[4] = v8;
  v14[5] = @"optionsRequestedByRemote";
  int v9 = [NSNumber numberWithInt:(*(_DWORD *)(a1 + 40) >> 3) & 1];
  v15[5] = v9;
  v14[6] = @"duration";
  id v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v15[6] = v10;
  v14[7] = @"profileType";
  int v11 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v15[7] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];

  return v12;
}

- (void)nanoSync_reportSyncFailureWithReason:(id)a3 options:(unint64_t)a4 duration:(double)a5 profileType:(int64_t)a6 error:(id)a7
{
  unsigned int v9 = a4;
  id v12 = a7;
  uint64_t v13 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
  unint64_t v16 = [v14 length];
  if (v16 >= 0x400) {
    uint64_t v17 = 1024;
  }
  else {
    uint64_t v17 = v16;
  }
  uint64_t v18 = [v14 substringToIndex:v17];

  [v15 setObject:v18 forKeyedSubscript:@"reason"];
  uint64_t v19 = [NSNumber numberWithInt:v9 & 1];
  [v15 setObject:v19 forKeyedSubscript:@"optionPullRequest"];

  id v20 = [NSNumber numberWithInt:(v9 >> 1) & 1];
  [v15 setObject:v20 forKeyedSubscript:@"optionsLastChange"];

  char v21 = [NSNumber numberWithInt:(v9 >> 2) & 1];
  [v15 setObject:v21 forKeyedSubscript:@"optionsActiveOnly"];

  v22 = [NSNumber numberWithInt:(v9 >> 3) & 1];
  [v15 setObject:v22 forKeyedSubscript:@"optionsRequestedByRemote"];

  v23 = [NSNumber numberWithDouble:a5];
  [v15 setObject:v23 forKeyedSubscript:@"duration"];

  v24 = [NSNumber numberWithInteger:a6];
  [v15 setObject:v24 forKeyedSubscript:@"profileType"];

  if (v12)
  {
    v25 = [v12 domain];
    [v15 setObject:v25 forKeyedSubscript:@"errorDomain"];

    v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
    [v15 setObject:v26 forKeyedSubscript:@"errorCode"];
  }
  v27 = [NSString stringWithFormat:@"com.apple.healthd.sync.nano.%@", @"sync.finished"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __118__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncFailureWithReason_options_duration_profileType_error___block_invoke;
  v29[3] = &unk_1E62FEA38;
  id v30 = v15;
  id v28 = v15;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v27 block:v29];
}

id __118__HDAnalyticsSubmissionCoordinator_NanoSync__nanoSync_reportSyncFailureWithReason_options_duration_profileType_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HDAnalyticsSubmissionCoordinator)initWithDaemon:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDAnalyticsSubmissionCoordinator;
  v5 = [(HDAnalyticsSubmissionCoordinator *)&v18 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    timeoutQueue = v6->_timeoutQueue;
    v6->_timeoutQueue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    id v12 = HKLogAnalytics();
    uint64_t v13 = [v11 initWithName:@"DailyAnalyticEventObservers" loggingCategory:v12];
    observers = v6->_observers;
    v6->_observers = (HDAnalyticsSubmissionCoordinatorDelegate *)v13;

    v6->_dailyAnalyticsObserversLock._os_unfair_lock_opaque = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    unint64_t v16 = [WeakRetained primaryProfile];
    [v16 registerProfileReadyObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = [HDPeriodicActivity alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  v5 = [WeakRetained primaryProfile];
  double v6 = (double)(uint64_t)*MEMORY[0x1E4F141E8];
  uint64_t v7 = HKLogAnalytics();
  float v8 = [(HDPeriodicActivity *)v4 initWithProfile:v5 name:@"com.apple.healthd.daily-report" interval:self delegate:v7 loggingCategory:v6];
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v8;
}

- (void)sendEvent:(id)a3 block:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  float v8 = HKLogAnalytics();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    id v10 = HKLogAnalytics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Event sent: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  AnalyticsSendEventLazy();
}

- (BOOL)isEventUsed:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogAnalytics();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    id v7 = HKLogAnalytics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138543618;
      int v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Checked whether event is used: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  char IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_logFaultForTimedOutObservers:(id)a3 timeoutSeconds:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (objc_class *)MEMORY[0x1E4F28E78];
  id v7 = a3;
  float v8 = (void *)[[v6 alloc] initWithString:@"["];
  objc_msgSend(v8, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v7, &__block_literal_global_157);

  [v8 appendString:@"]"];
  _HKInitializeLogging();
  BOOL v9 = HKLogInfrastructure();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    int v10 = 138543874;
    int v11 = self;
    __int16 v12 = 2048;
    double v13 = a4;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Timeout (%0.1f) waiting for %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

id __81__HDAnalyticsSubmissionCoordinator__logFaultForTimedOutObservers_timeoutSeconds___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  id v7 = (void *)[v4 initWithFormat:@"%@:%p", v6, v3];

  return v7;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v24 = 0;
  if (self)
  {
    BOOL v6 = NSString;
    id v7 = [MEMORY[0x1E4F29128] UUID];
    float v8 = [v7 UUIDString];
    BOOL v9 = [v6 stringWithFormat:@"dailyAnalytics-%@", v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    int v11 = [WeakRetained primaryProfile];
    __int16 v12 = [v11 database];
    double v13 = [v12 takeAccessibilityAssertionWithOwnerIdentifier:v9 timeout:&v24 error:300.0];

    if (!v13)
    {
      _HKInitializeLogging();
      __int16 v14 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        __int16 v27 = 2114;
        id v28 = v24;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Daily analytics failed to take database accessibility assertion: %{public}@", buf, 0x16u);
      }
    }

    uint64_t v15 = v24;
  }
  else
  {
    uint64_t v15 = 0;
    double v13 = 0;
  }
  id v16 = v15;
  if (v13)
  {
    uint64_t v17 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"com.apple.healthd.daily-report"];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__HDAnalyticsSubmissionCoordinator_performPeriodicActivity_completion___block_invoke;
    aBlock[3] = &unk_1E6304A98;
    id v23 = v5;
    id v21 = v13;
    id v22 = v17;
    id v18 = v17;
    uint64_t v19 = _Block_copy(aBlock);
    [(HDAnalyticsSubmissionCoordinator *)self sendDailyAnalyticsWithTimeout:v19 completion:30.0];
  }
  else
  {
    (*((void (**)(id, uint64_t, id, double))v5 + 2))(v5, 2, v16, 0.0);
  }
}

uint64_t __71__HDAnalyticsSubmissionCoordinator_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) invalidate];
  BOOL v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

- (void)_locked_sendDailyAnalyticsWithTimeout:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 48));
    id v4 = [*(id *)(a1 + 72) anyObject];
    if (!v4) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v6 = [WeakRetained primaryProfile];
    id v7 = [v6 database];
    int v8 = [v7 isProtectedDataAvailable];

    if (v8)
    {
      BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F2B8E0]) initWithQueue:*(void *)(a1 + 32) completion:&__block_literal_global_308_0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_2;
      v33[3] = &unk_1E62F4978;
      v33[4] = a1;
      id v10 = v4;
      id v34 = v10;
      double v35 = a2;
      [v9 startWithTimeoutInterval:v33 handler:a2];
      int v11 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_3;
      v29[3] = &unk_1E6304AE8;
      void v29[4] = a1;
      id v30 = v9;
      id v31 = v10;
      double v32 = a2;
      id v12 = v9;
      [v11 notifyObserver:v31 handler:v29];

      double v13 = v34;
    }
    else
    {
LABEL_5:
      [*(id *)(a1 + 56) timeIntervalSinceNow];
      double v15 = -v14;
      id v16 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      uint64_t v17 = (void *)[*(id *)(a1 + 64) copy];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_5;
      v27[3] = &unk_1E62F6070;
      id v28 = v17;
      id v12 = v17;
      [(id)a1 sendEvent:@"com.apple.healthd.daily-report" block:v27];
      id v18 = _Block_copy(*(const void **)(a1 + 80));
      uint64_t v19 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;

      id v20 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      id v21 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      id v22 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_6;
      block[3] = &unk_1E6304B10;
      block[4] = a1;
      id v25 = v18;
      double v26 = v15;
      id v23 = v18;
      dispatch_async(v22, block);

      double v13 = v28;
    }
  }
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 72) containsObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  [v3 _logFaultForTimedOutObservers:v4 timeoutSeconds:*(double *)(a1 + 48)];

  if (v2) {
    -[HDAnalyticsSubmissionCoordinator _locked_sendDailyAnalyticsWithTimeout:](*(void *)(a1 + 32), *(double *)(a1 + 48));
  }
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 48);

  os_unfair_lock_unlock(v5);
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_3(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_4;
  void v7[3] = &unk_1E6304AC0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  [a2 reportDailyAnalyticsWithCoordinator:v4 completion:v7];
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) invalidate];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 48));
  if (v4) {
    [*(id *)(*(void *)(a1 + 40) + 64) addEntriesFromDictionary:v4];
  }
  int v3 = [*(id *)(*(void *)(a1 + 40) + 72) containsObject:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 72) removeObject:*(void *)(a1 + 48)];
  if (v3) {
    -[HDAnalyticsSubmissionCoordinator _locked_sendDailyAnalyticsWithTimeout:](*(void *)(a1 + 40), *(double *)(a1 + 56));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 48));
}

id __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __74__HDAnalyticsSubmissionCoordinator__locked_sendDailyAnalyticsWithTimeout___block_invoke_6(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  (*(void (**)(double))(a1[5] + 16))(0.0);
  _HKInitializeLogging();
  int v2 = HKLogAnalytics();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    id v4 = HKLogAnalytics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[6];
      uint64_t v7 = [*(id *)(v5 + 40) count];
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2050;
      uint64_t v11 = v6;
      __int16 v12 = 2050;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "%{public}@: DailyAnalytics took %{public}f seconds with %{public}ld observers", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)sendDailyAnalyticsWithTimeout:(double)a3 completion:(id)a4
{
  p_dailyAnalyticsObserversLock = &self->_dailyAnalyticsObserversLock;
  id v7 = a4;
  os_unfair_lock_lock(p_dailyAnalyticsObserversLock);
  int v8 = [MEMORY[0x1E4F1C9C8] date];
  dailyAnalyticsStartTime = self->_dailyAnalyticsStartTime;
  self->_dailyAnalyticsStartTime = v8;

  __int16 v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dailyAnalyticsPayload = self->_dailyAnalyticsPayload;
  self->_dailyAnalyticsPayload = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v13 = [(HDAnalyticsSubmissionCoordinatorDelegate *)self->_observers allObservers];
  uint64_t v14 = (NSMutableSet *)[v12 initWithArray:v13];
  dailyAnalyticsPendingObservers = self->_dailyAnalyticsPendingObservers;
  self->_dailyAnalyticsPendingObservers = v14;

  id v16 = (void *)[v7 copy];
  id dailyAnalyticsCompletionHandler = self->_dailyAnalyticsCompletionHandler;
  self->_id dailyAnalyticsCompletionHandler = v16;

  -[HDAnalyticsSubmissionCoordinator _locked_sendDailyAnalyticsWithTimeout:]((uint64_t)self, a3);

  os_unfair_lock_unlock(p_dailyAnalyticsObserversLock);
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v4 = (const char *)*MEMORY[0x1E4F142C8];
  uint64_t v5 = (const char *)*MEMORY[0x1E4F142D0];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_string(xdict, v4, v5);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14310], 1);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (HDAnalyticsSubmissionCoordinatorDelegate)unitTest_dailyAnalyticsObservers
{
  return self->_observers;
}

- (id)_createHealthStoreForProfileIdentifier:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F2B0B8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setProfileIdentifier:v4];

  [v5 resume];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dailyAnalyticsCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsPendingObservers, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsPayload, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsStartTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

- (void)summarySharing_reportSetupOperation:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportSetupOperation_success_error___block_invoke;
  v12[3] = &unk_1E63052C8;
  BOOL v15 = a4;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.health.sharing.setup.operational.event" block:v12];
}

id __102__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportSetupOperation_success_error___block_invoke(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v24[0] = @"operation";
    v24[1] = @"success";
    v25[0] = v2;
    v25[1] = MEMORY[0x1E4F1CC38];
    BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  }
  else
  {
    v22[0] = @"operation";
    v22[1] = @"success";
    id v4 = *(void **)(a1 + 40);
    v23[0] = *(void *)(a1 + 32);
    v23[1] = MEMORY[0x1E4F1CC28];
    uint64_t v5 = objc_msgSend(v4, "domain", @"operation", @"success", @"errorDomain");
    uint64_t v6 = (void *)v5;
    id v7 = @"<null>";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    v23[2] = v7;
    v22[3] = @"errorCode";
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v23[3] = v8;
    v22[4] = @"errorClass";
    id v9 = [*(id *)(a1 + 40) userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F29B50]];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    else {
      id v12 = @"<unknown>";
    }
    v23[4] = v12;
    v22[5] = @"errorMethod";
    id v13 = [*(id *)(a1 + 40) userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F29B80]];
    BOOL v15 = (void *)v14;
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    else {
      id v16 = @"<unknown>";
    }
    v23[5] = v16;
    v22[6] = @"errorParameter";
    uint64_t v17 = [*(id *)(a1 + 40) userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F29B78]];
    uint64_t v19 = (void *)v18;
    if (v18) {
      id v20 = (__CFString *)v18;
    }
    else {
      id v20 = @"<unknown>";
    }
    v23[6] = v20;
    BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  }

  return v3;
}

- (void)summarySharing_reportDailyAnalytics:(id)a3 activeWatchProductType:(id)a4 age:(int64_t)a5 sex:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = [(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled];
  BOOL v14 = [v10 numberPeopleSharingOut] > 0;
  uint64_t v15 = [v10 numberPeopleSharingIn];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportDailyAnalytics_activeWatchProductType_age_sex___block_invoke;
  v19[3] = &unk_1E63052F0;
  BOOL v25 = v14;
  BOOL v26 = v15 > 0;
  BOOL v27 = v13;
  id v20 = v11;
  id v21 = v10;
  long long v23 = xmmword_1BD32D960;
  int64_t v24 = a5;
  id v22 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.health.sharing.daily" block:v19];
}

id __119__HDAnalyticsSubmissionCoordinator_SummarySharing__summarySharing_reportDailyAnalytics_activeWatchProductType_age_sex___block_invoke(uint64_t a1)
{
  v79[4] = *MEMORY[0x1E4F143B8];
  v78[0] = @"isSharingOutEnabled";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  v79[0] = v2;
  v78[1] = @"isSharingInEnabled";
  BOOL v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  v79[1] = v3;
  v78[2] = @"isImproveHealthAndActivityAllowed";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 82)];
  v78[3] = @"activeWatchProductType";
  uint64_t v5 = *(void *)(a1 + 32);
  v79[2] = v4;
  v79[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:4];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [*(id *)(a1 + 40) askSomeoneToShareLastSelectedDate];

  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v10 = [*(id *)(a1 + 40) askSomeoneToShareLastSelectedDate];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = Current - v11;

    BOOL v13 = v12 < *(double *)(a1 + 56);
    uint64_t v8 = v12 < *(double *)(a1 + 64);
  }
  else
  {
    BOOL v13 = 0;
  }
  v76[0] = @"hasInvitedToShareInPastMonth";
  BOOL v14 = [NSNumber numberWithBool:v13];
  v76[1] = @"hasInvitedToShareInPast6Months";
  v77[0] = v14;
  uint64_t v15 = [NSNumber numberWithBool:v8];
  v77[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
  [v7 addEntriesFromDictionary:v16];

  if (*(unsigned char *)(a1 + 81))
  {
    BOOL v17 = [*(id *)(a1 + 40) numberOfAlertNotificationsEnabled] > 0;
    BOOL v18 = [*(id *)(a1 + 40) numberOfTrendNotificationsEnabled] > 0;
    BOOL v19 = [*(id *)(a1 + 40) numberOfUpdateNotificationsEnabled] > 0;
    v74[0] = @"hasAlertsEnabled";
    id v20 = [NSNumber numberWithBool:v17];
    v75[0] = v20;
    v74[1] = @"hasTrendsEnabled";
    id v21 = [NSNumber numberWithBool:v18];
    v75[1] = v21;
    v74[2] = @"hasUpdatesEnabled";
    id v22 = [NSNumber numberWithBool:v19];
    v75[2] = v22;
    long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
    [v7 addEntriesFromDictionary:v23];

    uint64_t v24 = [*(id *)(a1 + 40) sharingContactOptionLastSelectedDate];

    if (v24)
    {
      double v25 = CFAbsoluteTimeGetCurrent();
      BOOL v26 = [*(id *)(a1 + 40) sharingContactOptionLastSelectedDate];
      [v26 timeIntervalSinceReferenceDate];
      double v28 = v25 - v27;

      BOOL v29 = v28 < *(double *)(a1 + 56);
      uint64_t v24 = v28 < *(double *)(a1 + 64);
    }
    else
    {
      BOOL v29 = 0;
    }
    v72[0] = @"hasClickedToTextOrCallFromSharingInPastMonth";
    id v30 = [NSNumber numberWithBool:v29];
    v72[1] = @"hasClickedToTextOrCallFromSharingInPast6Months";
    v73[0] = v30;
    id v31 = [NSNumber numberWithBool:v24];
    v73[1] = v31;
    double v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
    [v7 addEntriesFromDictionary:v32];

    v33 = [*(id *)(a1 + 40) mostRecentIncomingTransactionDate];

    if (v33)
    {
      double v34 = CFAbsoluteTimeGetCurrent();
      double v35 = [*(id *)(a1 + 40) mostRecentIncomingTransactionDate];
      [v35 timeIntervalSinceReferenceDate];
      double v37 = v34 - v36;

      BOOL v38 = v37 < *(double *)(a1 + 64);
      BOOL v39 = v37 < *(double *)(a1 + 56);
      v70[0] = @"hasReceivedNewDataOnSharedAccountInPast6Months";
      v40 = [NSNumber numberWithBool:v38];
      v70[1] = @"hasReceivedNewDataOnSharedAccountInPastMonth";
      v71[0] = v40;
      v41 = [NSNumber numberWithBool:v39];
      v71[1] = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
      [v7 addEntriesFromDictionary:v42];
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    v68[0] = @"numberAuthorizationsSharingOut";
    v43 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberAuthorizationsSharingOut"));
    v69[0] = v43;
    v68[1] = @"averageNumberAuthorizationsSharedOutPerPerson";
    v44 = NSNumber;
    [*(id *)(a1 + 40) averageNumberAuthorizationsSharedOutPerPerson];
    v45 = objc_msgSend(v44, "numberWithDouble:");
    v69[1] = v45;
    v68[2] = @"maxAuthorizationsSharedOutPerPerson";
    v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "maxAuthorizationsSharedOutPerPerson"));
    v69[2] = v46;
    v68[3] = @"minAuthorizationsSharedOutPerPerson";
    v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "minAuthorizationsSharedOutPerPerson"));
    v69[3] = v47;
    v68[4] = @"numberPeopleSharingOut";
    v48 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberPeopleSharingOut"));
    v69[4] = v48;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:5];
    [v7 addEntriesFromDictionary:v49];

    uint64_t v50 = [*(id *)(a1 + 40) anySharingWithYouLastViewedDate];

    if (v50)
    {
      double v51 = CFAbsoluteTimeGetCurrent();
      v52 = [*(id *)(a1 + 40) anySharingWithYouLastViewedDate];
      [v52 timeIntervalSinceReferenceDate];
      double v54 = v51 - v53;

      BOOL v55 = v54 < *(double *)(a1 + 56);
      uint64_t v50 = v54 < *(double *)(a1 + 64);
    }
    else
    {
      BOOL v55 = 0;
    }
    v66[0] = @"hasClickedSharingInAccountInPastMonth";
    v56 = [NSNumber numberWithBool:v55];
    v66[1] = @"hasClickedSharingInAccountInPast6Months";
    v67[0] = v56;
    v57 = [NSNumber numberWithBool:v50];
    v67[1] = v57;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    [v7 addEntriesFromDictionary:v58];
  }
  if (*(unsigned char *)(a1 + 82))
  {
    v59 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "numberPeopleSharingIn", @"numberPeopleSharingIn"));
    v65[0] = v59;
    v64[1] = @"age";
    v60 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
    v64[2] = @"sex";
    uint64_t v61 = *(void *)(a1 + 48);
    v65[1] = v60;
    v65[2] = v61;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
    [v7 addEntriesFromDictionary:v62];
  }

  return v7;
}

- (void)cloudCache_reportWeeklyAnalyticsWithCacheValidation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.cache.%@", @"weekly-validation"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportWeeklyAnalyticsWithCacheValidation___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

id __103__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportWeeklyAnalyticsWithCacheValidation___block_invoke(uint64_t a1)
{
  v53[48] = *MEMORY[0x1E4F143B8];
  v52[0] = @"individualSyncZonesInCloud";
  double v51 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCloud"));
  v53[0] = v51;
  v52[1] = @"masterZonesInCloud";
  uint64_t v50 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterZonesInCloud"));
  v53[1] = v50;
  v52[2] = @"unifiedZonesInCloud";
  v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCloud"));
  v53[2] = v49;
  v52[3] = @"sharedSummaryZonesInCloud";
  v48 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCloud"));
  v53[3] = v48;
  v52[4] = @"individualSyncZonesInCache";
  v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCache"));
  v53[4] = v47;
  v52[5] = @"masterZonesInCache";
  v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterZonesInCache"));
  v53[5] = v46;
  v52[6] = @"unifiedZonesInCache";
  v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCache"));
  v53[6] = v45;
  v52[7] = @"sharedSummaryZonesInCache";
  v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCache"));
  v53[7] = v44;
  v52[8] = @"storeRecordsInCloud";
  v43 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCloud"));
  v53[8] = v43;
  v52[9] = @"sequenceRecordsInCloud";
  v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCloud"));
  v53[9] = v42;
  v52[10] = @"medicalIDRecordsInCloud";
  v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCloud"));
  v53[10] = v41;
  v52[11] = @"changeRecordsInCloud";
  v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCloud"));
  v53[11] = v40;
  v52[12] = @"registryRecordsInCloud";
  BOOL v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCloud"));
  v53[12] = v39;
  v52[13] = @"masterRecordsInCloud";
  BOOL v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCloud"));
  v53[13] = v38;
  v52[14] = @"dataUploadRequestRecordInCloud";
  double v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCloud"));
  v53[14] = v37;
  v52[15] = @"sharedSummaryAuthRecordInCloud";
  double v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCloud"));
  v53[15] = v36;
  v52[16] = @"sharedSummaryParticipantRecordInCloud";
  double v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCloud"));
  v53[16] = v35;
  v52[17] = @"sharedSummaryRelationshipRecordInCloud";
  double v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCloud"));
  v53[17] = v34;
  v52[18] = @"sharedSummaryRecordInCloud";
  v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCloud"));
  v53[18] = v33;
  v52[19] = @"sharedSummaryTransactionRecordInCloud";
  double v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCloud"));
  v53[19] = v32;
  v52[20] = @"storeRecordsInCache";
  id v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCache"));
  v53[20] = v31;
  v52[21] = @"sequenceRecordsInCache";
  id v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCache"));
  v53[21] = v30;
  v52[22] = @"medicalIDRecordsInCache";
  BOOL v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCache"));
  v53[22] = v29;
  v52[23] = @"changeRecordsInCache";
  double v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCache"));
  v53[23] = v28;
  v52[24] = @"registryRecordsInCache";
  double v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCache"));
  v53[24] = v27;
  v52[25] = @"masterRecordsInCache";
  BOOL v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCache"));
  v53[25] = v26;
  v52[26] = @"dataUploadRequestRecordInCache";
  double v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCache"));
  v53[26] = v25;
  v52[27] = @"sharedSummaryAuthRecordInCache";
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCache"));
  v53[27] = v24;
  v52[28] = @"sharedSummaryParticipantRecordInCache";
  long long v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCache"));
  v53[28] = v23;
  v52[29] = @"sharedSummaryRelationshipRecordInCache";
  id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCache"));
  v53[29] = v22;
  v52[30] = @"sharedSummaryRecordInCache";
  id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCache"));
  v53[30] = v21;
  v52[31] = @"sharedSummaryTransactionRecordInCache";
  id v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCache"));
  v53[31] = v20;
  v52[32] = @"deltaIndividualSyncZonesInCloudCache";
  BOOL v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCloud")- objc_msgSend(*(id *)(a1 + 32), "individualSyncZonesInCache"));
  v53[32] = v19;
  v52[33] = @"deltaMasterZonesInCloudCache";
  BOOL v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterZonesInCloud") - objc_msgSend(*(id *)(a1 + 32), "masterZonesInCache"));
  v53[33] = v18;
  v52[34] = @"deltaUnifiedZonesInCloudCache";
  BOOL v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCloud") - objc_msgSend(*(id *)(a1 + 32), "unifiedZonesInCache"));
  v53[34] = v17;
  v52[35] = @"deltaSharedSummaryZonesInCloudCache";
  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryZonesInCache"));
  v53[35] = v16;
  v52[36] = @"deltaStoreRecordsInCloudCache";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "storeRecordsInCache"));
  v53[36] = v15;
  v52[37] = @"deltaSequenceRecordsInCloudCache";
  BOOL v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "sequenceRecordsInCache"));
  v53[37] = v14;
  v52[38] = @"deltaMedicalIDRecordsInCloudCache";
  BOOL v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCloud")- objc_msgSend(*(id *)(a1 + 32), "medicalIDRecordsInCache"));
  v53[38] = v13;
  v52[39] = @"deltaChangeRecordsInCloudCache";
  double v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "changeRecordsInCache"));
  v53[39] = v12;
  v52[40] = @"deltaRegistryRecordsInCloudCache";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "registryRecordsInCache"));
  v53[40] = v2;
  v52[41] = @"deltaMasterRecordsInCloudCache";
  BOOL v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCloud") - objc_msgSend(*(id *)(a1 + 32), "masterRecordsInCache"));
  v53[41] = v3;
  v52[42] = @"deltaDataUploadRequestRecordInCloudCache";
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "dataUploadRequestRecordInCache"));
  v53[42] = v4;
  v52[43] = @"deltaSharedSummaryAuthRecordInCloudCache";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryAuthRecordInCache"));
  v53[43] = v5;
  v52[44] = @"deltaSharedSummaryParticipantRecordInCloudCache";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryParticipantRecordInCache"));
  v53[44] = v6;
  v52[45] = @"deltaSharedSummaryRelationshipRecordInCloudCache";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRelationshipRecordInCache"));
  v53[45] = v7;
  v52[46] = @"deltaSharedSummaryRecordInCloudCache";
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryRecordInCache"));
  v53[46] = v8;
  v52[47] = @"deltaSharedSummaryTransactionRecordInCloudCache";
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCloud")- objc_msgSend(*(id *)(a1 + 32), "sharedSummaryTransactionRecordInCache"));
  v53[47] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:48];

  return v10;
}

- (void)cloudCache_reportDailyCacheAnalyticsWithPushTargets:(int64_t)a3 pullTargets:(int64_t)a4 sharedDBSummarySharingZones:(int64_t)a5 privateDBSummarySharingZones:(int64_t)a6 unifiedZoneInSharedDB:(BOOL)a7 unifiedZoneInPrivateDB:(BOOL)a8 deviceContexts:(unint64_t)a9 deviceKeys:(unint64_t)a10 nilSyncIdentities:(unint64_t)a11
{
  BOOL v18 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.cache.%@", @"daily-analytics"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __261__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportDailyCacheAnalyticsWithPushTargets_pullTargets_sharedDBSummarySharingZones_privateDBSummarySharingZones_unifiedZoneInSharedDB_unifiedZoneInPrivateDB_deviceContexts_deviceKeys_nilSyncIdentities___block_invoke;
  v19[3] = &__block_descriptor_90_e19___NSDictionary_8__0l;
  void v19[4] = a3;
  v19[5] = a4;
  void v19[6] = a5;
  v19[7] = a6;
  BOOL v22 = a7;
  BOOL v23 = a8;
  long long v20 = *(_OWORD *)&a9;
  unint64_t v21 = a11;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v18 block:v19];
}

id __261__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportDailyCacheAnalyticsWithPushTargets_pullTargets_sharedDBSummarySharingZones_privateDBSummarySharingZones_unifiedZoneInSharedDB_unifiedZoneInPrivateDB_deviceContexts_deviceKeys_nilSyncIdentities___block_invoke(uint64_t a1)
{
  void v15[9] = *MEMORY[0x1E4F143B8];
  v14[0] = @"pushTargets";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v15[0] = v2;
  v14[1] = @"pullTargets";
  BOOL v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v15[1] = v3;
  v14[2] = @"sharedDBSummarySharingZones";
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v15[2] = v4;
  v14[3] = @"privateDBSummarySharingZones";
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  id v6 = (void *)v5;
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
  }
  v15[3] = v5;
  v15[4] = v7;
  void v14[4] = @"unifiedZoneInSharedDB";
  v14[5] = @"unifiedZoneInPrivateDB";
  if (*(unsigned char *)(a1 + 89)) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC28];
  }
  v15[5] = v8;
  v14[6] = @"contextCount";
  id v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v15[6] = v9;
  v14[7] = @"keyCount";
  id v10 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v15[7] = v10;
  void v14[8] = @"nilSyncIdentities";
  double v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  v15[8] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (void)cloudCache_reportCacheDiscrepancyForOperation:(id)a3 reason:(id)a4 containerIdentifier:(id)a5 databaseScope:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.cache.%@", @"discrepancy"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __144__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheDiscrepancyForOperation_reason_containerIdentifier_databaseScope_error___block_invoke;
  v23[3] = &unk_1E6305908;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = v12;
  id v18 = v12;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v17 block:v23];
}

id __144__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheDiscrepancyForOperation_reason_containerIdentifier_databaseScope_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10[0] = @"discrepancyReason";
  v10[1] = @"container";
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v12 = v3;
  v10[2] = @"database";
  v10[3] = @"errorDomain";
  long long v11 = *(_OWORD *)(a1 + 32);
  id v4 = [v2 domain];
  id v13 = v4;
  void v10[4] = @"errorCode";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "code"));
  id v14 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:v10 count:5];
  uint64_t v7 = [*(id *)(a1 + 64) analyticsDictionary];
  uint64_t v8 = objc_msgSend(v6, "hk_dictionaryByAddingEntriesFromDictionary:", v7);

  return v8;
}

- (void)cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline:(id)a3 changedZonesCount:(int64_t)a4 deletedZonesCount:(int64_t)a5 changedRecordsCount:(int64_t)a6 deletedRecordsCount:(int64_t)a7
{
  id v12 = a3;
  id v13 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.cache.%@", @"fetch"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __184__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline_changedZonesCount_deletedZonesCount_changedRecordsCount_deletedRecordsCount___block_invoke;
  v15[3] = &unk_1E6305930;
  int64_t v18 = a5;
  int64_t v19 = a6;
  int64_t v20 = a7;
  id v16 = v12;
  int64_t v17 = a4;
  id v14 = v12;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v13 block:v15];
}

id __184__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline_changedZonesCount_deletedZonesCount_changedRecordsCount_deletedRecordsCount___block_invoke(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"changedZonesCount";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v11[0] = v2;
  v10[1] = @"deletedZonesCount";
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v11[1] = v3;
  v10[2] = @"changedRecordsCount";
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v11[2] = v4;
  v10[3] = @"deletedRecordsCount";
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v11[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v7 = [*(id *)(a1 + 32) analyticsDictionary];
  uint64_t v8 = objc_msgSend(v6, "hk_dictionaryByAddingEntriesFromDictionary:", v7);

  return v8;
}

- (void)cloudCache_reportCacheSyncAnalyticsForPipeline:(id)a3 operationCount:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.cache.%@", @"sync"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheSyncAnalyticsForPipeline_operationCount___block_invoke;
  v9[3] = &unk_1E62F3258;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v7 block:v9];
}

id __113__HDAnalyticsSubmissionCoordinator_CloudKitCache__cloudCache_reportCacheSyncAnalyticsForPipeline_operationCount___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"cloudKitOperationsCount";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v4 = [*(id *)(a1 + 32) analyticsDictionary];
  uint64_t v5 = objc_msgSend(v3, "hk_dictionaryByAddingEntriesFromDictionary:", v4);

  return v5;
}

- (void)cloudSync_reportDailyAnalyticForProfileType:(int64_t)a3 syncEnabled:(BOOL)a4 syncDisabledError:(id)a5 primaryContainer:(id)a6 restoreComplete:(BOOL)a7 timeSinceRestoreStart:(id)a8 journalSize:(id)a9 oldestJournalAge:(id)a10 timeSinceLastSuccessfulPull:(id)a11 timeSinceLastSuccessfulPush:(id)a12 timeSinceLastSuccessfulLitePush:(id)a13 timeSinceLastPushForwardProgress:(id)a14 storeCount:(int64_t)a15 zoneCount:(int64_t)a16 hasUnifiedZone:(BOOL)a17 hasMasterZone:(BOOL)a18 hasMedicalID:(BOOL)a19 errorRequiringUserAction:(id)a20 childSyncIdentityCount:(int64_t)a21 canUpgradeToSyncIdentity:(BOOL)a22 startedUpgradeToSyncIdentity:(BOOL)a23 completedUpgradeToSyncIdentity:(BOOL)a24 iPhoneCount:(id)a25 iPadCount:(id)a26 watchCount:(id)a27 visionProCount:(id)a28 totalSyncsCount:(id)a29 successfulSyncPercentageCount:(id)a30
{
  id v68 = a5;
  id v67 = a6;
  id v66 = a8;
  id v65 = a9;
  id v64 = a10;
  id v63 = a11;
  id v32 = a12;
  id v33 = a13;
  id v34 = a14;
  id v35 = a20;
  id v36 = a25;
  id v37 = a26;
  id v38 = a27;
  id v48 = a28;
  id v39 = a29;
  id v40 = a30;
  v49 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"daily-report"];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __616__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportDailyAnalyticForProfileType_syncEnabled_syncDisabledError_primaryContainer_restoreComplete_timeSinceRestoreStart_journalSize_oldestJournalAge_timeSinceLastSuccessfulPull_timeSinceLastSuccessfulPush_timeSinceLastSuccessfulLitePush_timeSinceLastPushForwardProgress_storeCount_zoneCount_hasUnifiedZone_hasMasterZone_hasMedicalID_errorRequiringUserAction_childSyncIdentityCount_canUpgradeToSyncIdentity_startedUpgradeToSyncIdentity_completedUpgradeToSyncIdentity_iPhoneCount_iPadCount_watchCount_visionProCount_totalSyncsCount_successfulSyncPercentageCount___block_invoke;
  v69[3] = &unk_1E6308730;
  BOOL v90 = a4;
  id v70 = v68;
  id v71 = v67;
  BOOL v91 = a7;
  id v72 = v66;
  id v73 = v65;
  id v74 = v64;
  id v75 = v63;
  id v76 = v32;
  id v77 = v33;
  int64_t v86 = a3;
  int64_t v87 = a15;
  id v78 = v34;
  id v79 = v35;
  int64_t v88 = a16;
  int64_t v89 = a21;
  BOOL v92 = a22;
  BOOL v93 = a23;
  BOOL v94 = a24;
  id v80 = v36;
  id v81 = v37;
  id v82 = v38;
  id v83 = v48;
  id v84 = v39;
  id v85 = v40;
  id v61 = v40;
  id v60 = v39;
  id v59 = v48;
  id v58 = v38;
  id v56 = v37;
  id v55 = v36;
  id v53 = v35;
  id v52 = v34;
  id v50 = v33;
  id v41 = v32;
  id v42 = v63;
  id v43 = v64;
  id v44 = v65;
  id v45 = v66;
  id v46 = v67;
  id v47 = v68;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v49 block:v69];
}

id __616__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportDailyAnalyticForProfileType_syncEnabled_syncDisabledError_primaryContainer_restoreComplete_timeSinceRestoreStart_journalSize_oldestJournalAge_timeSinceLastSuccessfulPull_timeSinceLastSuccessfulPush_timeSinceLastSuccessfulLitePush_timeSinceLastPushForwardProgress_storeCount_zoneCount_hasUnifiedZone_hasMasterZone_hasMedicalID_errorRequiringUserAction_childSyncIdentityCount_canUpgradeToSyncIdentity_startedUpgradeToSyncIdentity_completedUpgradeToSyncIdentity_iPhoneCount_iPadCount_watchCount_visionProCount_totalSyncsCount_successfulSyncPercentageCount___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 160)];
  [v2 setObject:v3 forKeyedSubscript:@"profileType"];

  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 192)];
  [v2 setObject:v4 forKeyedSubscript:@"syncEnabled"];

  if (!*(unsigned char *)(a1 + 192))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = [v5 domain];
      [v2 setObject:v6 forKeyedSubscript:@"syncDisabledErrorDomain"];

      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
      [v2 setObject:v7 forKeyedSubscript:@"syncDisabledErrorCode"];
    }
  }
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"primaryContainer"];
  id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 193)];
  [v2 setObject:v8 forKeyedSubscript:@"restoreComplete"];

  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"timeSinceRestoreStart"];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"journalSize"];
  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"oldestJournalAge"];
  [v2 setObject:*(void *)(a1 + 72) forKeyedSubscript:@"timeSinceLastSuccessfulPull"];
  [v2 setObject:*(void *)(a1 + 80) forKeyedSubscript:@"timeSinceLastSuccessfulPush"];
  [v2 setObject:*(void *)(a1 + 88) forKeyedSubscript:@"timeSinceLastSuccessfulLitePush"];
  [v2 setObject:*(void *)(a1 + 96) forKeyedSubscript:@"timeSinceLastPushForwardProgress"];
  id v9 = [NSNumber numberWithLongLong:*(void *)(a1 + 168)];
  [v2 setObject:v9 forKeyedSubscript:@"storeCount"];

  id v10 = [NSNumber numberWithLongLong:*(void *)(a1 + 176)];
  [v2 setObject:v10 forKeyedSubscript:@"zoneCount"];

  int64_t v11 = *(void **)(a1 + 104);
  if (v11)
  {
    id v12 = [v11 domain];
    [v2 setObject:v12 forKeyedSubscript:@"errorRequiringUserActionDomain"];

    id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 104), "code"));
    [v2 setObject:v13 forKeyedSubscript:@"errorRequiringUserActionCode"];
  }
  id v14 = [NSNumber numberWithLongLong:*(void *)(a1 + 184)];
  [v2 setObject:v14 forKeyedSubscript:@"childSyncIdentities"];

  uint64_t v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 194)];
  [v2 setObject:v15 forKeyedSubscript:@"canUpgradeToSyncIdentity"];

  id v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 195)];
  [v2 setObject:v16 forKeyedSubscript:@"startedUpgradeToSyncIdentity"];

  int64_t v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 196)];
  [v2 setObject:v17 forKeyedSubscript:@"completedUpgradeToSyncIdentity"];

  [v2 setObject:*(void *)(a1 + 112) forKeyedSubscript:@"countPairediPhone"];
  [v2 setObject:*(void *)(a1 + 120) forKeyedSubscript:@"countPairediPad"];
  [v2 setObject:*(void *)(a1 + 128) forKeyedSubscript:@"countPairedWatch"];
  [v2 setObject:*(void *)(a1 + 136) forKeyedSubscript:@"countPairedVisionPro"];
  [v2 setObject:*(void *)(a1 + 144) forKeyedSubscript:@"numberOfSyncs"];
  [v2 setObject:*(void *)(a1 + 152) forKeyedSubscript:@"percentOfSuccessfulSyncs"];

  return v2;
}

- (void)cloudSync_reportMissingManateeIdentityDuringFetchInContainer:(id)a3 zoneName:(id)a4 databaseScope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"FetchMissingManateeIdentity"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __131__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportMissingManateeIdentityDuringFetchInContainer_zoneName_databaseScope___block_invoke;
  v13[3] = &unk_1E62F3280;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v10 block:v13];
}

id __131__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportMissingManateeIdentityDuringFetchInContainer_zoneName_databaseScope___block_invoke(void *a1)
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"container";
  v5[1] = @"zone";
  uint64_t v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = v1;
  void v5[2] = @"scope";
  id v2 = [NSNumber numberWithInteger:a1[6]];
  void v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)cloudSync_reportOwnershipChangeForMissingManateeIdentityDuringPush
{
  id v3 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"OwnershipChangePushMissingManateeIdentity"];
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v3 block:&__block_literal_global_193];
}

uint64_t __113__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportOwnershipChangeForMissingManateeIdentityDuringPush__block_invoke()
{
  return MEMORY[0x1E4F1CC08];
}

- (void)cloudSync_reportOwnershipChangeForProfile:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"ownership-change"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportOwnershipChangeForProfile_reason___block_invoke;
  v11[3] = &unk_1E6308758;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v8 block:v11];
}

id __96__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportOwnershipChangeForProfile_reason___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"profileType";
  id v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "profileType"));
  v9[1] = @"reason";
  v10[0] = v2;
  id v3 = *(void **)(a1 + 40);
  unint64_t v4 = [v3 length];
  if (v4 >= 0x400) {
    uint64_t v5 = 1024;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = [v3 substringToIndex:v5];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)cloudSync_reportPeriodicSyncStartForType:(int64_t)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"periodic.start"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __88__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncStartForType___block_invoke;
  void v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v6[4] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
}

id __88__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncStartForType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = @"type";
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)cloudSync_reportPeriodicSyncSuccessAfterDuration:(double)a3 type:(int64_t)a4
{
  id v7 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"periodic.success"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __101__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncSuccessAfterDuration_type___block_invoke;
  v8[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  *(double *)&void v8[4] = a3;
  void v8[5] = a4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v7 block:v8];
}

id __101__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncSuccessAfterDuration_type___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"duration";
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v6[1] = @"type";
  v7[0] = v2;
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)cloudSync_reportPeriodicSyncFailureWithError:(id)a3 duration:(double)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"periodic.failure"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncFailureWithError_duration_type___block_invoke;
  v11[3] = &unk_1E62F7018;
  id v12 = v8;
  double v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v9 block:v11];
}

id __106__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPeriodicSyncFailureWithError_duration_type___block_invoke(uint64_t a1)
{
  v21[7] = *MEMORY[0x1E4F143B8];
  v20[0] = @"errorDomain";
  int64_t v19 = [*(id *)(a1 + 32) domain];
  v21[0] = v19;
  v20[1] = @"errorCode";
  id v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v21[1] = v2;
  v20[2] = @"errorClass";
  id v3 = [*(id *)(a1 + 32) userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F29B50]];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<unknown>";
  }
  v21[2] = v6;
  v20[3] = @"errorMethod";
  id v7 = [*(id *)(a1 + 32) userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29B80]];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"<unknown>";
  }
  v21[3] = v10;
  v20[4] = @"errorParameter";
  id v11 = [*(id *)(a1 + 32) userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F29B78]];
  double v13 = (void *)v12;
  if (v12) {
    int64_t v14 = (__CFString *)v12;
  }
  else {
    int64_t v14 = @"<unknown>";
  }
  v21[4] = v14;
  v20[5] = @"duration";
  id v15 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v21[5] = v15;
  v20[6] = @"type";
  int64_t v16 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v21[6] = v16;
  int64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];

  return v17;
}

- (void)cloudSync_reportRebaseTriggeredByDeletionByUser:(BOOL)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"rebase-trigger.deletion"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __95__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRebaseTriggeredByDeletionByUser___block_invoke;
  void v6[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v7 = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
}

id __95__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRebaseTriggeredByDeletionByUser___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"byUser";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)cloudSync_reportRestoreForProfile:(id)a3 startDate:(id)a4 endDate:(id)a5 duration:(double)a6 finishedJournalMerge:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"restore.complete"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __129__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRestoreForProfile_startDate_endDate_duration_finishedJournalMerge___block_invoke;
  v19[3] = &unk_1E63087C0;
  id v20 = v14;
  id v21 = v13;
  double v23 = a6;
  BOOL v24 = a7;
  id v22 = v12;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v15 block:v19];
}

id __129__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportRestoreForProfile_startDate_endDate_duration_finishedJournalMerge___block_invoke(uint64_t a1)
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v16[0] = @"pullCompleteDate";
  id v2 = NSNumber;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  id v3 = objc_msgSend(v2, "numberWithDouble:");
  v17[0] = v3;
  v16[1] = @"pullStartDate";
  uint64_t v4 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  v17[1] = v5;
  v16[2] = @"duration";
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v17[2] = v6;
  v16[3] = @"finishedJournalMerge";
  BOOL v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v17[3] = v7;
  void v16[4] = @"dbSize";
  uint64_t v8 = NSNumber;
  uint64_t v9 = HDDatabaseSizeInMB(*(void **)(a1 + 48));
  id v10 = [v8 numberWithInteger:HDBucketedDatabaseSizeInMB(v9)];
  v17[4] = v10;
  v16[5] = @"journalCount";
  id v11 = NSNumber;
  id v12 = [*(id *)(a1 + 48) database];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "journalChapterCountForType:", 2));
  v17[5] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (void)cloudSync_reportPipelineStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"pipeline.started"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineStarted___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

uint64_t __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineStarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) analyticsDictionary];
}

- (void)cloudSync_reportPipelineFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"pipeline.finished"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFinished___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

id __80__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFinished___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) analyticsDictionary];
  id v2 = objc_msgSend(&unk_1F17EF738, "hk_dictionaryByAddingEntriesFromDictionary:", v1);

  return v2;
}

- (void)cloudSync_reportPipelineFailed:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"pipeline.finished"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFailed_error___block_invoke;
  v11[3] = &unk_1E6308758;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v8 block:v11];
}

id __84__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportPipelineFailed_error___block_invoke(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v21[0] = MEMORY[0x1E4F1CC28];
  v20[0] = @"success";
  v20[1] = @"errorCode";
  int64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v21[1] = v19;
  v20[2] = @"errorDomain";
  id v2 = [*(id *)(a1 + 32) domain];
  v21[2] = v2;
  v20[3] = @"errorClass";
  id v3 = [*(id *)(a1 + 32) userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F29B50]];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<unknown>";
  }
  v21[3] = v6;
  v20[4] = @"errorMethod";
  id v7 = [*(id *)(a1 + 32) userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29B80]];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"<unknown>";
  }
  v21[4] = v10;
  v20[5] = @"errorParameter";
  id v11 = [*(id *)(a1 + 32) userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F29B78]];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"<unknown>";
  }
  v21[5] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  id v16 = [*(id *)(a1 + 40) analyticsDictionary];
  id v17 = objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v16);

  return v17;
}

- (void)cloudSync_operationStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"operation.started"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationStarted___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

uint64_t __74__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationStarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) analyticsDictionary];
}

- (void)cloudSync_operationFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"operation.finished"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFinished___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

id __75__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFinished___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) analyticsDictionary];
  id v2 = objc_msgSend(&unk_1F17EF760, "hk_dictionaryByAddingEntriesFromDictionary:", v1);

  return v2;
}

- (void)cloudSync_operationFailed:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"operation.finished"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFailed_error___block_invoke;
  v11[3] = &unk_1E6308758;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v8 block:v11];
}

id __79__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_operationFailed_error___block_invoke(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v21[0] = MEMORY[0x1E4F1CC28];
  v20[0] = @"success";
  v20[1] = @"errorCode";
  int64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v21[1] = v19;
  v20[2] = @"errorDomain";
  id v2 = [*(id *)(a1 + 32) domain];
  v21[2] = v2;
  v20[3] = @"errorClass";
  id v3 = [*(id *)(a1 + 32) userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F29B50]];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<unknown>";
  }
  v21[3] = v6;
  v20[4] = @"errorMethod";
  id v7 = [*(id *)(a1 + 32) userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29B80]];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"<unknown>";
  }
  v21[4] = v10;
  v20[5] = @"errorParameter";
  id v11 = [*(id *)(a1 + 32) userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F29B78]];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"<unknown>";
  }
  v21[5] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  id v16 = [*(id *)(a1 + 40) analyticsDictionary];
  id v17 = objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v16);

  return v17;
}

- (void)cloudSync_newChildAdded:(BOOL)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"newChildAdded"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __71__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_newChildAdded___block_invoke;
  void v6[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v7 = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
}

id __71__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_newChildAdded___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"newChildAdded";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)cloudSync_reportFullSyncMetricsWithReason:(id)a3 shard:(id)a4 daysSincePreviousFullSync:(id)a5 totalDuration:(double)a6 activeDuration:(double)a7 numberOfRuns:(id)a8 incomplete:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"fullsync-metrics"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __174__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportFullSyncMetricsWithReason_shard_daysSincePreviousFullSync_totalDuration_activeDuration_numberOfRuns_incomplete___block_invoke;
  v25[3] = &unk_1E63087E8;
  id v26 = v16;
  id v27 = v17;
  double v30 = a6;
  double v31 = a7;
  id v28 = v18;
  id v29 = v19;
  BOOL v32 = a9;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v20 block:v25];
}

id __174__HDAnalyticsSubmissionCoordinator_CloudSync__cloudSync_reportFullSyncMetricsWithReason_shard_daysSincePreviousFullSync_totalDuration_activeDuration_numberOfRuns_incomplete___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)(a1 + 32);
  v9[0] = @"reason";
  v9[1] = @"shard";
  uint64_t v11 = *(void *)(a1 + 48);
  long long v10 = v2;
  void v9[2] = @"daysSincePreviousFullSync";
  v9[3] = @"totalDuration";
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  uint64_t v12 = v3;
  void v9[4] = @"activeDuration";
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  uint64_t v5 = *(void *)(a1 + 56);
  id v13 = v4;
  uint64_t v14 = v5;
  void v9[5] = @"numberOfRuns";
  v9[6] = @"incomplete";
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  id v15 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:v9 count:7];

  return v7;
}

- (void)stateSync_recordSize:(unint64_t)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"state.push"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __68__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_recordSize___block_invoke;
  void v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v6[4] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
}

id __68__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_recordSize___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"recordSize";
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  long long v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)stateSync_operationSucceeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"state.push"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationSucceeded___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

id __76__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationSucceeded___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) analyticsDictionary];
  long long v2 = objc_msgSend(&unk_1F17EF788, "hk_dictionaryByAddingEntriesFromDictionary:", v1);

  return v2;
}

- (void)stateSync_operationFailed:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"state.push"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationFailed_error___block_invoke;
  v11[3] = &unk_1E6308758;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v8 block:v11];
}

id __79__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_operationFailed_error___block_invoke(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v21[0] = MEMORY[0x1E4F1CC28];
  v20[0] = @"success";
  v20[1] = @"errorCode";
  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v21[1] = v19;
  v20[2] = @"errorDomain";
  long long v2 = [*(id *)(a1 + 32) domain];
  v21[2] = v2;
  v20[3] = @"errorClass";
  id v3 = [*(id *)(a1 + 32) userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F29B50]];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<unknown>";
  }
  v21[3] = v6;
  v20[4] = @"errorMethod";
  id v7 = [*(id *)(a1 + 32) userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29B80]];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"<unknown>";
  }
  v21[4] = v10;
  v20[5] = @"errorParameter";
  uint64_t v11 = [*(id *)(a1 + 32) userInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F29B78]];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = @"<unknown>";
  }
  v21[5] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  uint64_t v16 = [*(id *)(a1 + 40) analyticsDictionary];
  id v17 = objc_msgSend(v15, "hk_dictionaryByAddingEntriesFromDictionary:", v16);

  return v17;
}

- (void)stateSync_subscriptionTriggeredDomain:(id)a3
{
  id v4 = a3;
  if ([(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled])
  {
    uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"state.subscription"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __85__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_subscriptionTriggeredDomain___block_invoke;
    void v6[3] = &unk_1E62F6070;
    id v7 = v4;
    [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
  }
}

id __85__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_subscriptionTriggeredDomain___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"domain";
  v5[0] = v1;
  long long v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)stateSync_triggerDuration:(double)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"state.trigger-gated"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __73__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_triggerDuration___block_invoke;
  void v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  *(double *)&void v6[4] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
}

id __73__HDAnalyticsSubmissionCoordinator_CloudSync__stateSync_triggerDuration___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"duration";
  uint64_t v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  long long v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)contextSync_operationSucceeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"context.push"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_operationSucceeded___block_invoke;
  void v7[3] = &unk_1E62F6070;
  id v8 = v4;
  id v6 = v4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v7];
}

id __78__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_operationSucceeded___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) analyticsDictionary];
  long long v2 = objc_msgSend(&unk_1F17EF7B0, "hk_dictionaryByAddingEntriesFromDictionary:", v1);

  return v2;
}

- (void)contextSync_triggerDuration:(double)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"com.apple.healthd.sync.cloud.%@", @"context.trigger-gated"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __75__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_triggerDuration___block_invoke;
  void v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  *(double *)&void v6[4] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v5 block:v6];
}

id __75__HDAnalyticsSubmissionCoordinator_CloudSync__contextSync_triggerDuration___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"duration";
  uint64_t v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  long long v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)workout_reportWorkoutCondenserEventWithReason:(int64_t)a3 batchSize:(int64_t)a4 hasWatchSource:(BOOL)a5 duration:(double)a6 success:(BOOL)a7 error:(id)a8 workoutsToCondense:(int64_t)a9 workoutsToRecondense:(int64_t)a10 condensedWorkouts:(int64_t)a11 processedWorkouts:(int64_t)a12 createdSeries:(int64_t)a13 deletedSamples:(int64_t)a14
{
  id v21 = a8;
  id v22 = [NSString stringWithFormat:@"com.apple.healthd.workout.%@", @"workout-condenser"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __244__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutCondenserEventWithReason_batchSize_hasWatchSource_duration_success_error_workoutsToCondense_workoutsToRecondense_condensedWorkouts_processedWorkouts_createdSeries_deletedSamples___block_invoke;
  v24[3] = &unk_1E6308D08;
  int64_t v26 = a3;
  int64_t v27 = a4;
  BOOL v33 = a5;
  double v28 = a6;
  BOOL v34 = a7;
  id v25 = v21;
  int64_t v29 = a9;
  long long v30 = *(_OWORD *)&a10;
  long long v31 = *(_OWORD *)&a12;
  int64_t v32 = a14;
  id v23 = v21;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v22 block:v24];
}

id __244__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutCondenserEventWithReason_batchSize_hasWatchSource_duration_success_error_workoutsToCondense_workoutsToRecondense_condensedWorkouts_processedWorkouts_createdSeries_deletedSamples___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v22[0] = @"reason";
  id v21 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v30[0] = v21;
  v22[1] = @"batchSize";
  id v20 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v30[1] = v20;
  v22[2] = @"hasWatchSource";
  id v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
  v30[2] = v19;
  v22[3] = @"duration";
  id v18 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v30[3] = v18;
  v22[4] = @"success";
  long long v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 113)];
  v30[4] = v2;
  v22[5] = @"errorDomain";
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) domain];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v15 = v4;
    long long v31 = (void *)v4;
    id v23 = @"errorCode";
    if (v5)
    {
      id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code", v4));
      char v17 = 0;
    }
    else
    {
      id v6 = &unk_1F17EEDD8;
      char v17 = 1;
    }
  }
  else
  {
    id v6 = &unk_1F17EEDD8;
    long long v31 = &unk_1F17EEDD8;
    id v23 = @"errorCode";
    char v17 = 1;
  }
  int64_t v32 = v6;
  id v24 = @"workoutsToCondense";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 64), v15);
  BOOL v33 = v7;
  id v25 = @"workoutsToRecondense";
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  BOOL v34 = v8;
  int64_t v26 = @"condensedWorkouts";
  id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
  id v35 = v9;
  int64_t v27 = @"processedWorkouts";
  id v10 = [NSNumber numberWithInteger:*(void *)(a1 + 88)];
  id v36 = v10;
  double v28 = @"createdSeries";
  uint64_t v11 = [NSNumber numberWithInteger:*(void *)(a1 + 96)];
  id v37 = v11;
  int64_t v29 = @"deletedSamples";
  uint64_t v12 = [NSNumber numberWithInteger:*(void *)(a1 + 104)];
  id v38 = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v22 count:13];

  if ((v17 & 1) == 0) {
  if (v3)
  }

  return v13;
}

- (void)workout_reportGymKitWorkoutWithFitnessMachineType:(id)a3 manufacturer:(id)a4 timeToBeginExperience:(int64_t)a5 workoutEndError:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [NSString stringWithFormat:@"com.apple.healthd.workout.%@", @"gymkit-workout"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __146__HDAnalyticsSubmissionCoordinator_Workout__workout_reportGymKitWorkoutWithFitnessMachineType_manufacturer_timeToBeginExperience_workoutEndError___block_invoke;
  v15[3] = &unk_1E6308D30;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a5;
  int64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v12 block:v15];
}

id __146__HDAnalyticsSubmissionCoordinator_Workout__workout_reportGymKitWorkoutWithFitnessMachineType_manufacturer_timeToBeginExperience_workoutEndError___block_invoke(void *a1)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"fitnessMachineType";
  v7[1] = @"manufacturer";
  uint64_t v2 = a1[5];
  v8[0] = a1[4];
  v8[1] = v2;
  v7[2] = @"timeToBeginExperience";
  uint64_t v3 = [NSNumber numberWithLongLong:a1[6]];
  void v8[2] = v3;
  void v7[3] = @"errorReason";
  uint64_t v4 = [NSNumber numberWithLongLong:a1[7]];
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

- (void)workout_reportMirroringEventWithStartDuration:(double)a3 stopDuration:(double)a4 mirroringDuration:(double)a5 numOfSendDataRequests:(int64_t)a6 maxTimeToSendData:(double)a7 minTimeToSendData:(double)a8 avgTimeToSendData:(double)a9 isFirstParty:(BOOL)a10
{
  BOOL v19 = [(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled];
  id v20 = [NSString stringWithFormat:@"com.apple.healthd.workout.%@", @"mirroring"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __211__HDAnalyticsSubmissionCoordinator_Workout__workout_reportMirroringEventWithStartDuration_stopDuration_mirroringDuration_numOfSendDataRequests_maxTimeToSendData_minTimeToSendData_avgTimeToSendData_isFirstParty___block_invoke;
  v21[3] = &__block_descriptor_90_e26___NSMutableDictionary_8__0l;
  *(double *)&v21[4] = a3;
  *(double *)&v21[5] = a4;
  v21[6] = a6;
  *(double *)&void v21[7] = a7;
  *(double *)&void v21[8] = a8;
  BOOL v22 = a10;
  BOOL v23 = v19;
  *(double *)&v21[9] = a9;
  *(double *)&v21[10] = a5;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v20 block:v21];
}

id __211__HDAnalyticsSubmissionCoordinator_Workout__workout_reportMirroringEventWithStartDuration_stopDuration_mirroringDuration_numOfSendDataRequests_maxTimeToSendData_minTimeToSendData_avgTimeToSendData_isFirstParty___block_invoke(uint64_t a1)
{
  void v17[7] = *MEMORY[0x1E4F143B8];
  v16[0] = @"timeToStartMirroring";
  id v13 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v17[0] = v13;
  v16[1] = @"timeToStopMirroring";
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v17[1] = v2;
  v16[2] = @"countArbitraryDataRequests";
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v17[2] = v3;
  v16[3] = @"timeToSendArbitraryDataMax";
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v17[3] = v4;
  void v16[4] = @"timeToSendArbitraryDataMin";
  uint64_t v5 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v17[4] = v5;
  v16[5] = @"timeToSendArbitraryDataMean";
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v17[5] = v6;
  void v16[6] = @"isFirstParty";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
  v17[6] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];
  id v9 = (void *)[v8 mutableCopy];

  if (*(unsigned char *)(a1 + 89))
  {
    id v14 = @"mirroringSessionDuration";
    id v10 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
    uint64_t v15 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v9 addEntriesFromDictionary:v11];
  }

  return v9;
}

- (void)workout_reportWorkoutEventWithHeartBeatFailures:(int64_t)a3 workoutDuration:(double)a4 isFirstParty:(BOOL)a5
{
  BOOL v9 = [(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __122__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutEventWithHeartBeatFailures_workoutDuration_isFirstParty___block_invoke;
  void v10[3] = &__block_descriptor_50_e26___NSMutableDictionary_8__0l;
  void v10[4] = a3;
  BOOL v11 = a5;
  BOOL v12 = v9;
  *(double *)&void v10[5] = a4;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:@"com.apple.healthd.workout" block:v10];
}

id __122__HDAnalyticsSubmissionCoordinator_Workout__workout_reportWorkoutEventWithHeartBeatFailures_workoutDuration_isFirstParty___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"countDataLinkFailures";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v11[1] = @"isFirstParty";
  v12[0] = v2;
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if (*(unsigned char *)(a1 + 49))
  {
    BOOL v9 = @"workoutDuration";
    id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    id v10 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 addEntriesFromDictionary:v7];
  }

  return v5;
}

- (void)database_reportSQLiteCorruptionWithExtendedErrorCode:(int)a3 type:(int64_t)a4 profile:(id)a5 description:(id)a6 sqlStatement:(id)a7 failedObliterationAttempt:(BOOL)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [NSString stringWithFormat:@"com.apple.healthd.database.%@", @"corruption.sqlite"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __163__HDAnalyticsSubmissionCoordinator_Database__database_reportSQLiteCorruptionWithExtendedErrorCode_type_profile_description_sqlStatement_failedObliterationAttempt___block_invoke;
  v21[3] = &unk_1E630CDD8;
  int v26 = a3;
  id v22 = v15;
  id v23 = v14;
  id v24 = v16;
  int64_t v25 = a4;
  BOOL v27 = a8;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v17 block:v21];
}

id __163__HDAnalyticsSubmissionCoordinator_Database__database_reportSQLiteCorruptionWithExtendedErrorCode_type_profile_description_sqlStatement_failedObliterationAttempt___block_invoke(uint64_t a1)
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v12[0] = @"code";
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v13[0] = v2;
  v12[1] = @"databaseType";
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v13[1] = v3;
  v12[2] = @"description";
  unint64_t v4 = [*(id *)(a1 + 32) length];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4 >= 0x401)
  {
    uint64_t v5 = [*(id *)(a1 + 32) substringToIndex:1024];
  }
  v13[2] = v5;
  void v12[3] = @"profileType";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "profileType"));
  v13[3] = v6;
  void v12[4] = @"sqlStatement";
  unint64_t v7 = [*(id *)(a1 + 48) length];
  id v8 = *(void **)(a1 + 48);
  if (v7 >= 0x401)
  {
    id v8 = [*(id *)(a1 + 48) substringToIndex:1024];
  }
  void v13[4] = v8;
  v12[5] = @"failedObliteration";
  BOOL v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
  v13[5] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  if (v7 >= 0x401) {
  if (v4 >= 0x401)
  }

  return v10;
}

- (void)database_reportUnprotectedDatabaseIdentifier:(id)a3 doesNotMatchProtectedDatabaseIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"com.apple.healthd.database.%@", @"identifier-mismatch"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __131__HDAnalyticsSubmissionCoordinator_Database__database_reportUnprotectedDatabaseIdentifier_doesNotMatchProtectedDatabaseIdentifier___block_invoke;
  v11[3] = &unk_1E6308758;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v8 block:v11];
}

id __131__HDAnalyticsSubmissionCoordinator_Database__database_reportUnprotectedDatabaseIdentifier_doesNotMatchProtectedDatabaseIdentifier___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"has-unprotected-identifier";
  uint64_t v2 = [NSNumber numberWithInt:*(void *)(a1 + 32) != 0];
  v6[1] = @"has-protected-identifier";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithInt:*(void *)(a1 + 40) != 0];
  v7[1] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)database_reportJournalEntryInsertedForJournal:(int64_t)a3 entryClass:(id)a4 entrySize:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [NSString stringWithFormat:@"com.apple.healthd.database.%@", @"journal-inserted"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalEntryInsertedForJournal_entryClass_entrySize___block_invoke;
  v13[3] = &unk_1E62F3280;
  id v15 = v9;
  int64_t v16 = a3;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v10 block:v13];
}

id __113__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalEntryInsertedForJournal_entryClass_entrySize___block_invoke(void *a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"type";
  uint64_t v2 = [NSNumber numberWithInteger:a1[6]];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = @"class";
  v7[2] = @"size";
  void v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)database_reportDatabaseMigrationStatus:(int64_t)a3 database:(id)a4 schemaVersion:(int64_t)a5 error:(id)a6 profileType:(int64_t)a7
{
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v14 = a4;
  id v15 = objc_alloc_init(v13);
  int64_t v16 = [NSNumber numberWithInteger:a3];
  [v15 setObject:v16 forKeyedSubscript:@"databaseStatus"];

  [v15 setObject:v14 forKeyedSubscript:@"databaseName"];
  id v17 = [NSNumber numberWithInteger:a5];
  [v15 setObject:v17 forKeyedSubscript:@"schemaVersion"];

  id v18 = [NSNumber numberWithInteger:a7];
  [v15 setObject:v18 forKeyedSubscript:@"profileType"];

  if (v12)
  {
    id v19 = objc_msgSend(v12, "hd_errorForAnalytics");

    id v20 = [v19 domain];
    [v15 setObject:v20 forKeyedSubscript:@"errorDomain"];

    id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "code"));
    [v15 setObject:v21 forKeyedSubscript:@"errorCode"];

    id v22 = [v19 localizedDescription];
    [v15 setObject:v22 forKeyedSubscript:@"errorDescription"];
  }
  id v23 = [NSString stringWithFormat:@"com.apple.healthd.database.%@", @"migration-status"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __126__HDAnalyticsSubmissionCoordinator_Database__database_reportDatabaseMigrationStatus_database_schemaVersion_error_profileType___block_invoke;
  v25[3] = &unk_1E62FEA38;
  id v26 = v15;
  id v24 = v15;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v23 block:v25];
}

id __126__HDAnalyticsSubmissionCoordinator_Database__database_reportDatabaseMigrationStatus_database_schemaVersion_error_profileType___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)database_reportCachedQueryEvent:(id)a3 cacheHits:(int64_t)a4 cacheMisses:(int64_t)a5 estimatedTotalBuckets:(unint64_t)a6
{
  id v10 = a3;
  if ([(HDAnalyticsSubmissionCoordinator *)self isImprovedHealthAndActivityEnabled])
  {
    id v11 = [NSString stringWithFormat:@"com.apple.healthd.database.%@", @"resumable-query"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __122__HDAnalyticsSubmissionCoordinator_Database__database_reportCachedQueryEvent_cacheHits_cacheMisses_estimatedTotalBuckets___block_invoke;
    void v12[3] = &unk_1E6303760;
    id v13 = v10;
    int64_t v14 = a4;
    int64_t v15 = a5;
    unint64_t v16 = a6;
    [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v11 block:v12];
  }
}

id __122__HDAnalyticsSubmissionCoordinator_Database__database_reportCachedQueryEvent_cacheHits_cacheMisses_estimatedTotalBuckets___block_invoke(void *a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  v9[0] = a1[4];
  v8[0] = @"identifier";
  v8[1] = @"cacheHits";
  uint64_t v3 = [NSNumber numberWithInteger:v2];
  v9[1] = v3;
  void v8[2] = @"cacheMisses";
  uint64_t v4 = [NSNumber numberWithInteger:a1[6]];
  void v9[2] = v4;
  v8[3] = @"totalBuckets";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)database_reportJournalMergeActivityResult:(int64_t)a3 duration:(double)a4 interruptions:(id)a5 error:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__193;
  void v16[4] = __Block_byref_object_dispose__193;
  id v17 = @"nil";
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke;
  v14[3] = &unk_1E630CE00;
  void v14[4] = v18;
  v14[5] = v15;
  v14[6] = v16;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
  id v12 = [NSString stringWithFormat:@"com.apple.healthd.database.%@", @"secondary-journal-merge-activity"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke_2;
  v13[3] = &unk_1E630CE28;
  *(double *)&v13[8] = a4;
  void v13[4] = v18;
  v13[5] = v16;
  v13[6] = v15;
  void v13[7] = a3;
  [(HDAnalyticsSubmissionCoordinator *)self sendEvent:v12 block:v13];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
}

void __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  *(void *)(*(void *)(a1[4] + 8) + 24) += [v6 unsignedIntValue];
  if (*(void *)(*(void *)(a1[5] + 8) + 24) < (unint64_t)[v6 unsignedIntValue])
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v6 unsignedIntValue];
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

id __117__HDAnalyticsSubmissionCoordinator_Database__database_reportJournalMergeActivityResult_duration_interruptions_error___block_invoke_2(uint64_t a1)
{
  void v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"result";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v10[0] = v2;
  v9[1] = @"duration";
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v10[1] = v3;
  void v9[2] = @"totalInterruptionCount";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  v10[2] = v4;
  v9[3] = @"topInterruptor";
  uint64_t v5 = *(void *)(a1 + 48);
  void v10[3] = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  void v9[4] = @"topInterruptionCount";
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(v5 + 8) + 24)];
  void v10[4] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

@end