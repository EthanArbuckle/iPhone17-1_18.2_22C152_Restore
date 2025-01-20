@interface HDProfile
+ (unint64_t)_concurrentDatabaseReaderLimitForProfileType:(int64_t)a3;
- (BOOL)fetchDisplayFirstName:(id *)a3 lastName:(id *)a4 error:(id *)a5;
- (BOOL)hasNotifiedProfileReadyObservers;
- (BOOL)requiresWeakRetention;
- (BOOL)setDisplayFirstName:(id)a3 lastName:(id)a4 error:(id *)a5;
- (BOOL)setDisplayImageData:(id)a3 error:(id *)a4;
- (BOOL)setPairedGuardianParticipant:(id)a3 error:(id *)a4;
- (BOOL)setPairedGuardianUserInfo:(id)a3 error:(id *)a4;
- (BOOL)testModeEnabled;
- (HDAWDSubmissionManager)awdSubmissionManager;
- (HDActivityCacheManagerInterface)activityCacheInterface;
- (HDAgeGatingManager)ageGatingManager;
- (HDAppSubscriptionManager)appSubscriptionManager;
- (HDAssertionManager)sessionAssertionManager;
- (HDAssociationManager)associationManager;
- (HDAttachmentManager)attachmentManager;
- (HDAuthorizationManager)authorizationManager;
- (HDCloudSyncManager)cloudSyncManager;
- (HDConceptIndexManager)conceptIndexManager;
- (HDContributorManager)contributorManager;
- (HDCurrentActivitySummaryHelper)currentActivitySummaryHelper;
- (HDDaemon)daemon;
- (HDDataCollectionManager)dataCollectionManager;
- (HDDataManager)dataManager;
- (HDDataProvenanceManager)dataProvenanceManager;
- (HDDatabase)database;
- (HDDatabaseDailyAnalytics)dailyAnalytics;
- (HDDeviceContextStoreManager)deviceContextManager;
- (HDDeviceKeyValueStoreManager)deviceKeyValueStoreManager;
- (HDDeviceManager)deviceManager;
- (HDFeatureAvailabilityHealthDataRequirementEvaluationManager)healthDataRequirementEvaluationManager;
- (HDFeatureSettingsManager)featureSettingsManager;
- (HDFitnessMachineManager)fitnessMachineManager;
- (HDHealthRecordsAccountExistenceNotifier)healthRecordsAccountExistenceNotifier;
- (HDHealthServiceManager)serviceManager;
- (HDKeyValueDomainManager)keyValueDomainManager;
- (HDMedicalIDDataManager)medicalIDDataManager;
- (HDMetadataManager)metadataManager;
- (HDNanoSyncManager)nanoSyncManager;
- (HDNotificationManager)notificationManager;
- (HDNotificationSyncManager)notificationSyncManager;
- (HDOnboardingCompletionManager)onboardingCompletionManager;
- (HDOntologyConceptManager)ontologyConceptManager;
- (HDOntologyDatabase)ontologyDatabase;
- (HDPeriodicCountryMonitor)periodicCountryMonitor;
- (HDProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6;
- (HDProtectedDataOperationScheduler)protectedDataOperationScheduler;
- (HDRapportMessenger)rapportMessenger;
- (HDRestorableAlarmScheduler)alarmScheduler;
- (HDServiceConnectionManager)serviceConnectionManager;
- (HDSharedSummaryManager)sharedSummaryManager;
- (HDSharingAuthorizationManager)sharingAuthorizationManager;
- (HDSourceManager)sourceManager;
- (HDSourceOrderManager)sourceOrderManager;
- (HDSummarySharingEntryIDSManager)summarySharingEntryIDSManager;
- (HDSummarySharingEntryManager)sharingEntryManager;
- (HDSyncEngine)syncEngine;
- (HDSyncIdentityManager)syncIdentityManager;
- (HDTinkerPrivacyAlertCoordinator)tinkerPrivacyAlertCoordinator;
- (HDUnitPreferencesManager)unitPreferencesManager;
- (HDUserCharacteristicsManager)userCharacteristicsManager;
- (HDUserDomainConceptManager)userDomainConceptManager;
- (HDWorkoutCondenser)workoutCondenser;
- (HDWorkoutManager)workoutManager;
- (HKFeatureAvailabilityRequirementEvaluationDataSource)requirementEvaluationDataSource;
- (HKProfileIdentifier)profileIdentifier;
- (NSString)description;
- (NSString)directoryPath;
- (NSString)medicalIDDirectoryPath;
- (NSURL)directoryURL;
- (id)_newAWDSubmissionManager;
- (id)_newCloudSyncManager;
- (id)_newContributorManager;
- (id)_newDatabase;
- (id)_newUserCharacteristicsManager;
- (id)_newWorkoutManager;
- (id)ageWithCurrentDate:(id)a3 error:(id *)a4;
- (id)allProfileExtensions;
- (id)biologicalSexWithError:(id *)a3;
- (id)featureAvailabilityProviderForIdentifier:(id)a3;
- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3;
- (id)featureStatusProviderForIdentifier:(id)a3;
- (id)fetchDisplayImageDataWithError:(id *)a3;
- (id)pairedGuardianParticipantWithError:(id *)a3;
- (id)pairedGuardianUserInfoWithError:(id *)a3;
- (id)profileExtensionWithIdentifier:(id)a3;
- (id)profileExtensionsConformingToProtocol:(id)a3;
- (id)requirementSatisfactionOverridesDataSource;
- (id)userCharacteristicForDataType:(id)a3 error:(id *)a4;
- (id)watchLowPowerModeDataSource;
- (id)wristDetectionSettingManager;
- (int64_t)currentSyncIdentityPersistentID;
- (int64_t)profileType;
- (void)_createExtensionsIfNeeded;
- (void)_notifyProfileReadyObservers;
- (void)_setOnboardingCompletionManager:(id)a3;
- (void)awakeFromDisk;
- (void)daemonReady:(id)a3;
- (void)executeBlockAfterProfileReady:(id)a3;
- (void)invalidateAndWaitWithReason:(id)a3;
- (void)isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:(id)a3;
- (void)notifyProfileInitializedObservers;
- (void)obliterateAndTerminateWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5;
- (void)obliterateWithOptions:(unint64_t)a3 reason:(id)a4;
- (void)prepareForObliterationWithReason:(id)a3;
- (void)registerProfileInitializedObserver:(id)a3 queue:(id)a4;
- (void)registerProfileReadyObserver:(id)a3 queue:(id)a4;
- (void)setTestModeEnabled:(BOOL)a3;
- (void)triggerDeletion;
@end

@implementation HDProfile

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (HDDatabase)database
{
  return self->_database;
}

- (HDDataManager)dataManager
{
  return self->_dataManager;
}

- (HDUnitPreferencesManager)unitPreferencesManager
{
  return self->_unitPreferencesManager;
}

- (HDSourceManager)sourceManager
{
  return self->_sourceManager;
}

- (HDSourceOrderManager)sourceOrderManager
{
  return self->_sourceOrderManager;
}

- (HDDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (HDDataProvenanceManager)dataProvenanceManager
{
  return self->_dataProvenanceManager;
}

- (HDSyncEngine)syncEngine
{
  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDProfile.m", 249, @"Invalid parameter not satisfying: %@", @"_syncEngine != nil" object file lineNumber description];

    syncEngine = self->_syncEngine;
  }

  return (HDSyncEngine *)syncEngine;
}

- (HDUserCharacteristicsManager)userCharacteristicsManager
{
  return self->_userCharacteristicsManager;
}

- (HDMetadataManager)metadataManager
{
  return self->_metadataManager;
}

- (HDAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (NSURL)directoryURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:self->_directoryPath isDirectory:1];
}

- (BOOL)requiresWeakRetention
{
  return 1;
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!HKFeatureIdentifierIsProvidedBySleepDaemon())
  {
    [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F180B2D8];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) featureAvailabilityExtensionForFeatureIdentifier:v4];
          if (v13)
          {
            v8 = (void *)v13;
            goto LABEL_19;
          }
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    v8 = 0;
    goto LABEL_19;
  }
  if (SleepLibraryCore() && getgetSleepFeatureAvailabilityProvidingSymbolLoc())
  {
    id v5 = [NSString stringWithFormat:@"HDProfile<HKFeatureAvailabilityHealthDataSource> (%@)", v4];
    id v6 = v4;
    v7 = (void (*)(id, void, id))getgetSleepFeatureAvailabilityProvidingSymbolLoc();
    if (!v7)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id<HKFeatureAvailabilityProviding>  _Nullable getSleepFeatureAvailabilityProviding(NSString *__strong, HKHealthStore *__strong, __strong HKFeatureIdentifier)");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"HDProfile+HKFeatureAvailabilityHealthDataSource.m", 31, @"%s", dlerror());

      __break(1u);
    }
    v8 = v7(v5, 0, v6);

LABEL_19:
    goto LABEL_20;
  }
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR))
  {
    v16 = v14;
    *(_DWORD *)buf = 138543362;
    id v26 = (id)objc_opt_class();
    id v17 = v26;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] HK_TARGET_OS_HAS_SLEEP_DAEMON true but missing getSleepFeatureAvailabilityProviding()", buf, 0xCu);
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (id)requirementSatisfactionOverridesDataSource
{
  v2 = [(HDProfile *)self daemon];
  v3 = [v2 featureAvailabilityRequirementSatisfactionOverridesDataSource];

  return v3;
}

- (id)watchLowPowerModeDataSource
{
  v2 = [(HDProfile *)self daemon];
  v3 = [v2 watchLowPowerModeDataSource];

  return v3;
}

- (id)wristDetectionSettingManager
{
  v2 = [(HDProfile *)self daemon];
  v3 = [v2 wristDetectionSettingManager];

  return v3;
}

- (id)userCharacteristicForDataType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDProfile *)self userCharacteristicsManager];
  v8 = [v7 userCharacteristicForType:v6 error:a4];

  return v8;
}

- (id)ageWithCurrentDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  v8 = [(HDProfile *)self userCharacteristicsManager];
  id v15 = 0;
  uint64_t v9 = [v8 userCharacteristicForType:v7 error:&v15];
  id v10 = v15;

  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "hk_ageWithCurrentDate:", v6));
    goto LABEL_11;
  }
  id v12 = v10;
  if (v10)
  {
    if (a4)
    {
      uint64_t v13 = 0;
      *a4 = v12;
      goto LABEL_11;
    }
    _HKLogDroppedError();
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)biologicalSexWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A8]];
  id v6 = [(HDProfile *)self userCharacteristicsManager];
  id v13 = 0;
  v7 = [v6 userCharacteristicForType:v5 error:&v13];
  id v8 = v13;

  if (v8)
  {
    id v9 = v8;
    if (a3)
    {
      id v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      id v10 = 0;
    }
  }
  else
  {
    if (v7) {
      uint64_t v11 = [v7 integerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F2AC80]) _initWithBiologicalSex:v11];
  }

  return v10;
}

- (id)featureStatusProviderForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HDProfile *)self featureAvailabilityProviderForIdentifier:v4];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F2B068]) initWithFeatureAvailabilityProviding:v5 healthDataSource:self countryCodeSource:0];
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogAnalytics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138543618;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_fault_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to find feature availability provider for feature identifier %{public}@", (uint8_t *)&v9, 0x16u);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)featureAvailabilityProviderForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F180B2D8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "featureAvailabilityExtensionForFeatureIdentifier:", v4, (void)v13);
        if (v10)
        {
          __int16 v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  __int16 v11 = 0;
LABEL_11:

  return v11;
}

- (void)isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F18A8528];
  id v8 = [v5 firstObject];

  if (v8)
  {
    uint64_t v6 = [v8 isImproveHealthRecordsDataSubmissionAllowed];
    uint64_t v7 = [NSNumber numberWithBool:v6];
    v4[2](v4, v7, 0);
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"HDProfile does not have a health records profile extension, cannot determine IHR status");
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v7);
  }
}

+ (unint64_t)_concurrentDatabaseReaderLimitForProfileType:(int64_t)a3
{
  unint64_t result = 2;
  switch(a3)
  {
    case 1:
      goto LABEL_4;
    case 2:
    case 4:
      unint64_t result = 1;
      break;
    case 3:
      return result;
    default:
      if (a3 == 100)
      {
LABEL_4:
        id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", v4, v3, v5, v6);
        unint64_t v9 = [v8 integerForKey:@"HDHealthDaemonConcurrentDatabaseReadersKey"];

        if (v9 - 2 >= 7) {
          unint64_t result = 3;
        }
        else {
          unint64_t result = v9;
        }
      }
      else
      {
        unint64_t result = 3;
      }
      break;
  }
  return result;
}

- (HDProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v98.receiver = self;
  v98.super_class = (Class)HDProfile;
  long long v14 = [(HDProfile *)&v98 init];
  long long v15 = v14;
  if (v14)
  {
    v14->_profileLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v14->_daemon, v12);
    uint64_t v16 = [v10 copy];
    directoryPath = v15->_directoryPath;
    v15->_directoryPath = (NSString *)v16;

    uint64_t v18 = [v11 copy];
    medicalIDDirectoryPath = v15->_medicalIDDirectoryPath;
    v15->_medicalIDDirectoryPath = (NSString *)v18;

    objc_storeStrong((id *)&v15->_profileIdentifier, a6);
    long long v20 = [v10 stringByAppendingPathComponent:@"TEST_PROFILE"];
    id v21 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v15->_testModeEnabled = [v21 fileExistsAtPath:v20];
    v15->_profileObserverLock._os_unfair_lock_opaque = 0;
    id v22 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    long long v23 = HKLogInfrastructure();
    uint64_t v24 = [v22 initWithName:@"Profile Initialized" loggingCategory:v23];
    profileInitializedObservers = v15->_profileInitializedObservers;
    v15->_profileInitializedObservers = (HKSynchronousObserverSet *)v24;

    dispatch_group_t v26 = dispatch_group_create();
    profileObserverGroup = v15->_profileObserverGroup;
    v15->_profileObserverGroup = (OS_dispatch_group *)v26;

    dispatch_group_enter((dispatch_group_t)v15->_profileObserverGroup);
    id v28 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v29 = HKLogInfrastructure();
    uint64_t v30 = [v28 initWithName:@"Profile Ready" loggingCategory:v29];
    profileReadyObservers = v15->_profileReadyObservers;
    v15->_profileReadyObservers = (HKObserverSet *)v30;

    uint64_t v32 = [(HDProfile *)v15 _newDatabase];
    database = v15->_database;
    v15->_database = (HDDatabase *)v32;

    v34 = [[HDSourceManager alloc] initWithProfile:v15];
    sourceManager = v15->_sourceManager;
    v15->_sourceManager = v34;

    v36 = [[HDSourceOrderManager alloc] initWithProfile:v15];
    sourceOrderManager = v15->_sourceOrderManager;
    v15->_sourceOrderManager = v36;

    v38 = [[HDDeviceManager alloc] initWithProfile:v15];
    deviceManager = v15->_deviceManager;
    v15->_deviceManager = v38;

    uint64_t v40 = [(HDProfile *)v15 _newContributorManager];
    contributorManager = v15->_contributorManager;
    v15->_contributorManager = (HDContributorManager *)v40;

    v42 = [[HDAuthorizationManager alloc] initWithProfile:v15];
    authorizationManager = v15->_authorizationManager;
    v15->_authorizationManager = v42;

    v44 = [[HDDataManager alloc] initWithProfile:v15];
    dataManager = v15->_dataManager;
    v15->_dataManager = v44;

    v46 = [[HDUnitPreferencesManager alloc] initWithProfile:v15];
    unitPreferencesManager = v15->_unitPreferencesManager;
    v15->_unitPreferencesManager = v46;

    uint64_t v48 = [(HDProfile *)v15 _newUserCharacteristicsManager];
    userCharacteristicsManager = v15->_userCharacteristicsManager;
    v15->_userCharacteristicsManager = (HDUserCharacteristicsManager *)v48;

    v50 = [[HDDataProvenanceManager alloc] initWithProfile:v15];
    dataProvenanceManager = v15->_dataProvenanceManager;
    v15->_dataProvenanceManager = v50;

    v52 = [[HDDaemonSyncEngine alloc] initWithProfile:v15];
    syncEngine = v15->_syncEngine;
    v15->_syncEngine = v52;

    v54 = [[HDSyncIdentityManager alloc] initWithProfile:v15];
    syncIdentityManager = v15->_syncIdentityManager;
    v15->_syncIdentityManager = v54;

    v56 = [[HDMetadataManager alloc] initWithProfile:v15];
    metadataManager = v15->_metadataManager;
    v15->_metadataManager = v56;

    v58 = [[HDSharedSummaryManager alloc] initWithProfile:v15];
    sharedSummaryManager = v15->_sharedSummaryManager;
    v15->_sharedSummaryManager = v58;

    v60 = [[HDSharingAuthorizationManager alloc] initWithProfile:v15];
    sharingAuthorizationManager = v15->_sharingAuthorizationManager;
    v15->_sharingAuthorizationManager = v60;

    v62 = [[HDFeatureSettingsManager alloc] initWithProfile:v15];
    featureSettingsManager = v15->_featureSettingsManager;
    v15->_featureSettingsManager = v62;

    v64 = [[HDOnboardingCompletionManager alloc] initWithProfile:v15];
    onboardingCompletionManager = v15->_onboardingCompletionManager;
    v15->_onboardingCompletionManager = v64;

    v66 = [[HDFeatureAvailabilityHealthDataRequirementEvaluationManager alloc] initWithProfile:v15];
    healthDataRequirementEvaluationManager = v15->_healthDataRequirementEvaluationManager;
    v15->_healthDataRequirementEvaluationManager = v66;

    uint64_t v68 = [MEMORY[0x1E4F2B010] dataSourceWithHealthDataSource:v15];
    requirementEvaluationDataSource = v15->_requirementEvaluationDataSource;
    v15->_requirementEvaluationDataSource = (HKFeatureAvailabilityRequirementEvaluationDataSource *)v68;

    v70 = [[HDDeviceContextStoreManager alloc] initWithProfile:v15];
    deviceContextManager = v15->_deviceContextManager;
    v15->_deviceContextManager = v70;

    v72 = [[HDDeviceKeyValueStoreManager alloc] initWithProfile:v15];
    deviceKeyValueStoreManager = v15->_deviceKeyValueStoreManager;
    v15->_deviceKeyValueStoreManager = v72;

    v74 = [[HDKeyValueDomainManager alloc] initWithProfile:v15];
    keyValueDomainManager = v15->_keyValueDomainManager;
    v15->_keyValueDomainManager = v74;

    v76 = [[HDDatabaseDailyAnalytics alloc] initWithProfile:v15];
    dailyAnalytics = v15->_dailyAnalytics;
    v15->_dailyAnalytics = v76;

    uint64_t v78 = [(HDProfile *)v15 _newCloudSyncManager];
    cloudSyncManager = v15->_cloudSyncManager;
    v15->_cloudSyncManager = (HDCloudSyncManager *)v78;

    if ([(HKProfileIdentifier *)v15->_profileIdentifier type] != 2)
    {
      v80 = [[HDUserDomainConceptManager alloc] initWithProfile:v15];
      userDomainConceptManager = v15->_userDomainConceptManager;
      v15->_userDomainConceptManager = v80;

      id WeakRetained = objc_loadWeakRetained((id *)&v15->_daemon);
      v83 = [WeakRetained behavior];
      int v84 = [v83 supportsOntology];

      if (v84)
      {
        v85 = [[HDHealthRecordsAccountExistenceNotifier alloc] initWithProfile:v15];
        healthRecordsAccountExistenceNotifier = v15->_healthRecordsAccountExistenceNotifier;
        v15->_healthRecordsAccountExistenceNotifier = v85;

        v87 = [[HDOntologyDatabase alloc] initWithProfile:v15];
        ontologyDatabase = v15->_ontologyDatabase;
        v15->_ontologyDatabase = v87;

        v89 = [[HDOntologyConceptManager alloc] initWithProfile:v15];
        ontologyManager = v15->_ontologyManager;
        v15->_ontologyManager = v89;

        v91 = [[HDConceptIndexManager alloc] initWithProfile:v15];
        conceptIndexManager = v15->_conceptIndexManager;
        v15->_conceptIndexManager = v91;
      }
      if (v15->_medicalIDDirectoryPath)
      {
        v93 = [[HDMedicalIDDataManager alloc] initWithProfile:v15];
        medicalIDDataManager = v15->_medicalIDDataManager;
        v15->_medicalIDDataManager = v93;
      }
    }
    uint64_t v95 = [(HKProfileIdentifier *)v15->_profileIdentifier type];
    self;
    double v96 = 0.0;
    if ((unint64_t)(v95 - 2) < 3) {
      double v96 = 30.0;
    }
    [(HDDatabase *)v15->_database setInactivityFlushInterval:v96];
    [(HDDatabase *)v15->_database enterStateInitialized];
  }
  return v15;
}

- (int64_t)profileType
{
  return [(HKProfileIdentifier *)self->_profileIdentifier type];
}

- (HDActivityCacheManagerInterface)activityCacheInterface
{
  return 0;
}

- (HDAgeGatingManager)ageGatingManager
{
  return 0;
}

- (HDAppSubscriptionManager)appSubscriptionManager
{
  return 0;
}

- (HDAssociationManager)associationManager
{
  return 0;
}

- (HDAttachmentManager)attachmentManager
{
  return 0;
}

- (HDCurrentActivitySummaryHelper)currentActivitySummaryHelper
{
  return 0;
}

- (HDProtectedDataOperationScheduler)protectedDataOperationScheduler
{
  return 0;
}

- (HDDataCollectionManager)dataCollectionManager
{
  return 0;
}

- (HDNanoSyncManager)nanoSyncManager
{
  return 0;
}

- (HDNotificationManager)notificationManager
{
  return 0;
}

- (HDNotificationSyncManager)notificationSyncManager
{
  return 0;
}

- (HDRapportMessenger)rapportMessenger
{
  return 0;
}

- (HDServiceConnectionManager)serviceConnectionManager
{
  return 0;
}

- (HDHealthServiceManager)serviceManager
{
  return 0;
}

- (HDAssertionManager)sessionAssertionManager
{
  return 0;
}

- (HDWorkoutManager)workoutManager
{
  return 0;
}

- (HDWorkoutCondenser)workoutCondenser
{
  return 0;
}

- (HDFitnessMachineManager)fitnessMachineManager
{
  return 0;
}

- (HDOntologyDatabase)ontologyDatabase
{
  return self->_ontologyDatabase;
}

- (HDOntologyConceptManager)ontologyConceptManager
{
  return self->_ontologyManager;
}

- (HDConceptIndexManager)conceptIndexManager
{
  return self->_conceptIndexManager;
}

- (HDTinkerPrivacyAlertCoordinator)tinkerPrivacyAlertCoordinator
{
  return 0;
}

- (HDSummarySharingEntryManager)sharingEntryManager
{
  return 0;
}

- (HDSummarySharingEntryIDSManager)summarySharingEntryIDSManager
{
  return 0;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (int64_t)currentSyncIdentityPersistentID
{
  v2 = [(HDSyncIdentityManager *)self->_syncIdentityManager currentSyncIdentity];
  uint64_t v3 = [v2 entity];
  int64_t v4 = [v3 persistentID];

  return v4;
}

- (void)daemonReady:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_profileLock = &self->_profileLock;
  os_unfair_lock_lock(&self->_profileLock);
  -[HDProfile _createExtensionsIfNeeded]((uint64_t)self);
  os_unfair_lock_unlock(p_profileLock);
  [(HDDatabase *)self->_database enterStateAddResources];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(HDProfile *)self daemon];
  uint64_t v7 = [v6 protectedResourceStoreProviders];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "protectedResourceStoreForProfile:", self, (void)v14);
        if (v13) {
          [v5 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if ([v5 count]) {
    [(HDDatabase *)self->_database addProtectedResourceStores:v5];
  }
  [(HDDatabase *)self->_database enterStateRun];
  [(HDProfile *)self _notifyProfileReadyObservers];
}

- (void)_createExtensionsIfNeeded
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
    if (!*(void *)(a1 + 104))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
      v2 = [WeakRetained pluginManager];
      uint64_t v3 = [v2 createExtensionsForProfile:a1];
      int64_t v4 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v3;
    }
  }
}

- (void)registerProfileInitializedObserver:(id)a3 queue:(id)a4
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_profileObserverLock);
  [(HKSynchronousObserverSet *)self->_profileInitializedObservers registerObserver:v5];
  if (self->_hasNotifiedProfileInitializedObservers)
  {
    profileInitializedObservers = self->_profileInitializedObservers;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__HDProfile_registerProfileInitializedObserver_queue___block_invoke;
    v7[3] = &unk_1E630B258;
    v7[4] = self;
    [(HKSynchronousObserverSet *)profileInitializedObservers notifyObservers:v7];
    [(HKSynchronousObserverSet *)self->_profileInitializedObservers unregisterObserver:v5];
  }
  os_unfair_lock_unlock(&self->_profileObserverLock);
}

uint64_t __54__HDProfile_registerProfileInitializedObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 profileDidInitialize:*(void *)(a1 + 32)];
}

- (void)notifyProfileInitializedObservers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_profileObserverLock = &self->_profileObserverLock;
  os_unfair_lock_lock(&self->_profileObserverLock);
  self->_hasNotifiedProfileInitializedObservers = 1;
  _HKInitializeLogging();
  int64_t v4 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
  {
    profileInitializedObservers = self->_profileInitializedObservers;
    uint64_t v6 = v4;
    *(_DWORD *)buf = 134218242;
    uint64_t v22 = [(HKSynchronousObserverSet *)profileInitializedObservers count];
    __int16 v23 = 2112;
    uint64_t v24 = self;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Notify (%lu) profile initialized observers for profile %@", buf, 0x16u);
  }
  uint64_t v7 = self->_profileInitializedObservers;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__HDProfile_notifyProfileInitializedObservers__block_invoke;
  v19[3] = &unk_1E630B258;
  v19[4] = self;
  [(HKSynchronousObserverSet *)v7 notifyObservers:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(HKSynchronousObserverSet *)self->_profileInitializedObservers allObservers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [(HKSynchronousObserverSet *)self->_profileInitializedObservers unregisterObserver:*(void *)(*((void *)&v15 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_profileObserverLock);
  dispatch_group_leave((dispatch_group_t)self->_profileObserverGroup);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  long long v14 = HKCreateSerialDispatchQueue();
  [WeakRetained registerDaemonReadyObserver:self queue:v14];
}

uint64_t __46__HDProfile_notifyProfileInitializedObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 profileDidInitialize:*(void *)(a1 + 32)];
}

- (void)registerProfileReadyObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_profileObserverLock);
  [(HKObserverSet *)self->_profileReadyObservers registerObserver:v6 queue:v7];

  if (self->_hasNotifiedProfileReadyObservers)
  {
    profileReadyObservers = self->_profileReadyObservers;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__HDProfile_registerProfileReadyObserver_queue___block_invoke;
    v9[3] = &unk_1E630B280;
    v9[4] = self;
    [(HKObserverSet *)profileReadyObservers notifyObserver:v6 handler:v9];
    [(HKObserverSet *)self->_profileReadyObservers unregisterObserver:v6];
  }
  os_unfair_lock_unlock(&self->_profileObserverLock);
}

uint64_t __48__HDProfile_registerProfileReadyObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 profileDidBecomeReady:*(void *)(a1 + 32)];
}

- (void)_notifyProfileReadyObservers
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  profileObserverGroup = self->_profileObserverGroup;
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(profileObserverGroup, v4))
  {
    _HKInitializeLogging();
    id v5 = HKLogInfrastructure();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v34 = 0x403E000000000000;
      __int16 v35 = 2112;
      v36 = self;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "Timeout (%0.1f) waiting on profile initialized observers for profile %@", buf, 0x16u);
    }
  }
  os_unfair_lock_lock(&self->_profileObserverLock);
  self->_hasNotifiedProfileReadyObservers = 1;
  _HKInitializeLogging();
  id v6 = (os_log_t *)MEMORY[0x1E4F29F28];
  id v7 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
  {
    profileReadyObservers = self->_profileReadyObservers;
    uint64_t v9 = v7;
    uint64_t v10 = [(HKObserverSet *)profileReadyObservers count];
    *(_DWORD *)buf = 134218242;
    uint64_t v34 = v10;
    __int16 v35 = 2112;
    v36 = self;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "Notify (%lu) profile ready observers for profile %@", buf, 0x16u);
  }
  uint64_t v11 = self->_profileReadyObservers;
  uint64_t v12 = self->_profileObserverGroup;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __41__HDProfile__notifyProfileReadyObservers__block_invoke;
  v31[3] = &unk_1E630B280;
  v31[4] = self;
  [(HKObserverSet *)v11 notifyObserversInGroup:v12 handler:v31];
  [(HKObserverSet *)self->_profileReadyObservers unregisterAllObservers];
  id v13 = self->_postProfileReadyBlocks;
  postProfileReadyBlocks = self->_postProfileReadyBlocks;
  self->_postProfileReadyBlocks = 0;

  os_unfair_lock_unlock(&self->_profileObserverLock);
  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    os_log_t v15 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      long long v16 = v15;
      uint64_t v17 = [(NSMutableArray *)v13 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      v36 = self;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Notify (%lu) profile ready blocks for profile %@", buf, 0x16u);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v18 = v13;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v22++) + 16))();
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    __int16 v23 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = (uint64_t)self;
      _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_INFO, "Adding unitTest_didReadyProfile for profile %@", buf, 0xCu);
    }
    uint64_t v24 = self->_profileObserverGroup;
    uint64_t v25 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HDProfile__notifyProfileReadyObservers__block_invoke_342;
    block[3] = &unk_1E62F3208;
    block[4] = self;
    dispatch_group_notify(v24, v25, block);
  }
}

void __41__HDProfile__notifyProfileReadyObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_time_t v4 = (os_log_t *)MEMORY[0x1E4F29F28];
  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    os_log_t v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)os_log_t v15 = 138412546;
      *(void *)&v15[4] = v7;
      *(_WORD *)&v15[12] = 2112;
      *(void *)&v15[14] = v8;
      id v9 = v7;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Notifying observer (%@) profile ready for profile %@", v15, 0x16u);
    }
  }
  objc_msgSend(v3, "profileDidBecomeReady:", *(void *)(a1 + 32), *(_OWORD *)v15, *(void *)&v15[16], v16);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 120));
  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    os_log_t v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v10;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)os_log_t v15 = 138412546;
      *(void *)&v15[4] = v12;
      *(_WORD *)&v15[12] = 2112;
      *(void *)&v15[14] = v13;
      id v14 = v12;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Notified observer (%@) profile ready for profile %@", v15, 0x16u);
    }
  }
}

void __41__HDProfile__notifyProfileReadyObservers__block_invoke_342(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_INFO, "Calling unitTest_didReadyProfile for profile %@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_time_t v4 = [*(id *)(a1 + 32) daemon];
  objc_msgSend(v4, "unitTest_didReadyProfile:", *(void *)(a1 + 32));
}

- (BOOL)hasNotifiedProfileReadyObservers
{
  v2 = self;
  p_profileObserverLock = &self->_profileObserverLock;
  os_unfair_lock_lock(&self->_profileObserverLock);
  LOBYTE(v2) = v2->_hasNotifiedProfileReadyObservers;
  os_unfair_lock_unlock(p_profileObserverLock);
  return (char)v2;
}

- (void)awakeFromDisk
{
  if ([(HDProfile *)self profileType] != 1)
  {
    uint64_t v3 = [(HDProfile *)self daemon];
    dispatch_time_t v4 = [v3 behavior];
    char v5 = [v4 supportsSecondaryProfiles];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [(HDProfile *)self database];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __26__HDProfile_awakeFromDisk__block_invoke;
      v7[3] = &unk_1E62F3208;
      v7[4] = self;
      [v6 performWhenDataProtectedByFirstUnlockIsAvailable:v7];
    }
  }
}

uint64_t __26__HDProfile_awakeFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 profileType];
    dispatch_time_t v4 = HKStringFromProfileType();
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Device ineligible for loading profile of type %{public}@. Deleting.", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) triggerDeletion];
}

- (void)prepareForObliterationWithReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  char v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Preparing for obliteration (%{public}@).", buf, 0x16u);
  }

  int v6 = [(HDProfile *)self allProfileExtensions];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 prepareForObliteration];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)invalidateAndWaitWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  char v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    long long v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating (%{public}@).", (uint8_t *)&v11, 0x16u);
  }

  int v6 = [(HDProfile *)self nanoSyncManager];
  [v6 invalidateAndWait];

  uint64_t v7 = [(HDProfile *)self database];
  [v7 invalidateAndWait];

  uint64_t v8 = [(HDProfile *)self conceptIndexManager];
  [v8 invalidateAndWait];

  uint64_t v9 = [(HDProfile *)self ontologyDatabase];
  [v9 invalidateAndWait];

  uint64_t v10 = [(HDProfile *)self summarySharingEntryIDSManager];
  [v10 invalidateAndWait];
}

- (void)obliterateAndTerminateWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(HDProfile *)self daemon];
  int v11 = [(HDProfile *)self profileIdentifier];
  v13[0] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v10 obliterateAndTerminateProfiles:v12 options:a3 reason:v9 completion:v8];
}

- (void)obliterateWithOptions:(unint64_t)a3 reason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HDProfile *)self daemon];
  id v8 = [v7 behavior];
  int v9 = [v8 isAppleInternalInstall];

  if (a3)
  {
    if ((a3 & 4) == 0)
    {
      uint64_t v10 = [(HDProfile *)self medicalIDDataManager];

      if (v10)
      {
        int v11 = [(HDProfile *)self medicalIDDataManager];
        id v18 = 0;
        char v12 = [v11 obliterateMedicalIDDataWithReason:v6 error:&v18];
        id v13 = v18;

        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          id v14 = HKLogInfrastructure();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v20 = v13;
            _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to obliterate Medical ID: %{public}@", buf, 0xCu);
          }
        }
      }
    }
    uint64_t v15 = [(HDProfile *)self nanoSyncManager];
    uint64_t v16 = v15;
    if (v15) {
      [v15 obliterateWithOptions:a3 reason:v6];
    }
  }
  uint64_t v17 = [(HDProfile *)self database];
  [v17 obliterateWithReason:v6 preserveCopy:v9 & (a3 >> 1)];
}

- (void)executeBlockAfterProfileReady:(id)a3
{
  aBlock = (void (**)(void))a3;
  p_profileObserverLock = &self->_profileObserverLock;
  os_unfair_lock_lock(&self->_profileObserverLock);
  if (self->_hasNotifiedProfileReadyObservers)
  {
    os_unfair_lock_unlock(&self->_profileObserverLock);
    aBlock[2]();
  }
  else
  {
    postProfileReadyBlocks = self->_postProfileReadyBlocks;
    if (!postProfileReadyBlocks)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = self->_postProfileReadyBlocks;
      self->_postProfileReadyBlocks = v6;

      postProfileReadyBlocks = self->_postProfileReadyBlocks;
    }
    id v8 = _Block_copy(aBlock);
    [(NSMutableArray *)postProfileReadyBlocks addObject:v8];

    os_unfair_lock_unlock(p_profileObserverLock);
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %@>", objc_opt_class(), self->_directoryPath];
}

- (BOOL)fetchDisplayFirstName:(id *)a3 lastName:(id *)a4 error:(id *)a5
{
  id v8 = self;
  if (self)
  {
    int v9 = [[HDKeyValueDomain alloc] initWithCategory:0 domainName:@"profile" profile:self];
    uint64_t v10 = [(HDKeyValueDomain *)v9 stringForKey:@"displayName" error:a5];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (*a5)
  {
    BOOL v11 = 0;
  }
  else
  {
    if (a3 && v10) {
      *a3 = v10;
    }
    if (v8)
    {
      char v12 = [[HDKeyValueDomain alloc] initWithCategory:0 domainName:@"profile" profile:v8];
      id v8 = [(HDKeyValueDomain *)v12 stringForKey:@"displayLastName" error:a5];
    }
    id v13 = *a5;
    BOOL v11 = *a5 == 0;
    if (!v13 && a4 && v8) {
      *a4 = v8;
    }
  }
  return v11;
}

- (BOOL)setDisplayFirstName:(id)a3 lastName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [[HDKeyValueDomain alloc] initWithCategory:0 domainName:@"profile" profile:self];
  database = self->_database;
  char v12 = +[HDDatabaseTransactionContext contextForWriting];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__HDProfile_setDisplayFirstName_lastName_error___block_invoke;
  v20[3] = &unk_1E62F5A88;
  uint64_t v21 = v10;
  id v22 = v8;
  id v23 = v9;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = v10;
  BOOL v16 = [(HDDatabase *)database performTransactionWithContext:v12 error:a5 block:v20 inaccessibilityHandler:0];

  if (v16)
  {
    uint64_t v17 = [(HDProfile *)self daemon];
    id v18 = [v17 profileManager];
    [v18 dispatchProfileListDidChange];
  }
  return v16;
}

uint64_t __48__HDProfile_setDisplayFirstName_lastName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) setString:*(void *)(a1 + 40) forKey:@"displayName" error:a3];
  if (result)
  {
    if (*(void *)(a1 + 48))
    {
      char v5 = *(void **)(a1 + 32);
      return objc_msgSend(v5, "setString:forKey:error:");
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (id)profileExtensionWithIdentifier:(id)a3
{
  p_profileLock = &self->_profileLock;
  id v5 = a3;
  os_unfair_lock_lock(p_profileLock);
  -[HDProfile _createExtensionsIfNeeded]((uint64_t)self);
  id v6 = [(NSDictionary *)self->_profileExtensionsByIdentifier objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_profileLock);

  return v6;
}

- (id)profileExtensionsConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = [(HDProfile *)self allProfileExtensions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HDProfile_profileExtensionsConformingToProtocol___block_invoke;
  v9[3] = &unk_1E630B2A8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "hk_filter:", v9);

  return v7;
}

uint64_t __51__HDProfile_profileExtensionsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

- (id)allProfileExtensions
{
  p_profileLock = &self->_profileLock;
  os_unfair_lock_lock(&self->_profileLock);
  -[HDProfile _createExtensionsIfNeeded]((uint64_t)self);
  id v4 = [(NSDictionary *)self->_profileExtensionsByIdentifier allValues];
  os_unfair_lock_unlock(p_profileLock);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

- (id)fetchDisplayImageDataWithError:(id *)a3
{
  id v4 = [[HDKeyValueDomain alloc] initWithCategory:101 domainName:@"profile" profile:self];
  id v5 = [(HDKeyValueDomain *)v4 dataForKey:@"displayImageData" error:a3];

  return v5;
}

- (BOOL)setDisplayImageData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [[HDKeyValueDomain alloc] initWithCategory:101 domainName:@"profile" profile:self];
  BOOL v8 = [(HDKeyValueDomain *)v7 setData:v6 forKey:@"displayImageData" error:a4];

  if (v8)
  {
    id v9 = [(HDProfile *)self daemon];
    id v10 = [v9 profileManager];
    [v10 dispatchProfileListDidChange];
  }
  return v8;
}

- (void)setTestModeEnabled:(BOOL)a3
{
  int v3 = a3;
  *(void *)&v23[5] = *MEMORY[0x1E4F143B8];
  p_profileLock = &self->_profileLock;
  os_unfair_lock_lock(&self->_profileLock);
  _HKInitializeLogging();
  id v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL testModeEnabled = self->_testModeEnabled;
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = self;
    __int16 v22 = 1024;
    *(_DWORD *)id v23 = testModeEnabled;
    v23[2] = 1024;
    *(_DWORD *)&v23[3] = v3;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating test mode %{BOOL}d -> %{BOOL}d", buf, 0x18u);
  }

  int v8 = self->_testModeEnabled;
  self->_BOOL testModeEnabled = v3;
  os_unfair_lock_unlock(p_profileLock);
  if (v8 != v3)
  {
    id v9 = [(HDProfile *)self directoryURL];
    id v10 = [v9 URLByAppendingPathComponent:@"TEST_PROFILE"];

    _HKInitializeLogging();
    BOOL v11 = HKLogInfrastructure();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      *(void *)id v23 = v10;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Test mode indicator URL: %{public}@", buf, 0x16u);
    }

    if (v3)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
      id v19 = 0;
      char v13 = [v12 writeToURL:v10 options:0x10000000 error:&v19];
      id v14 = v19;

      if (v13)
      {
LABEL_15:

        return;
      }
      _HKInitializeLogging();
      uint64_t v15 = HKLogInfrastructure();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = self;
        __int16 v22 = 2114;
        *(void *)id v23 = v14;
        _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to enable testing mode: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      id v18 = 0;
      char v16 = [v14 removeItemAtURL:v10 error:&v18];
      uint64_t v15 = v18;
      if ((v16 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v17 = HKLogInfrastructure();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v21 = self;
          __int16 v22 = 2114;
          *(void *)id v23 = v15;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to disable testing mode: %{public}@", buf, 0x16u);
        }
      }
    }

    goto LABEL_15;
  }
}

- (void)triggerDeletion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(HDProfile *)self daemon];
  id v4 = [v3 profileManager];
  id v5 = [(HDProfile *)self profileIdentifier];
  id v11 = 0;
  char v6 = [v4 deleteProfile:v5 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    int v8 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v9 = v8;
      id v10 = [(HDProfile *)self profileIdentifier];
      *(_DWORD *)buf = 138543618;
      char v13 = v10;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Error deleting profile %{public}@, error: %{public}@ (#t0)", buf, 0x16u);
    }
  }
}

- (id)_newDatabase
{
  unint64_t v3 = +[HDProfile _concurrentDatabaseReaderLimitForProfileType:[(HDProfile *)self profileType]];
  id v4 = objc_alloc(MEMORY[0x1E4F65CE8]);
  id v5 = [(HDProfile *)self daemon];
  char v6 = [v5 behavior];
  id v7 = [(HDProfile *)self daemon];
  int v8 = [v7 contentProtectionManager];
  id v9 = (void *)[v4 initWithBehavior:v6 concurrentReaderLimit:v3 contentProtectionManager:v8];

  id v10 = [[HDDatabase alloc] initWithConfiguration:v9 profile:self];
  return v10;
}

- (id)_newAWDSubmissionManager
{
  return 0;
}

- (id)_newWorkoutManager
{
  return 0;
}

- (id)_newUserCharacteristicsManager
{
  unint64_t v3 = [HDUserCharacteristicsManager alloc];

  return [(HDUserCharacteristicsManager *)v3 initWithProfile:self];
}

- (id)_newCloudSyncManager
{
  unint64_t v3 = [HDCloudSyncManager alloc];

  return [(HDCloudSyncManager *)v3 initWithProfile:self];
}

- (id)_newContributorManager
{
  unint64_t v3 = [HDContributorManager alloc];

  return [(HDContributorManager *)v3 initWithProfile:self];
}

- (void)_setOnboardingCompletionManager:(id)a3
{
}

- (HDRestorableAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (HDCloudSyncManager)cloudSyncManager
{
  return self->_cloudSyncManager;
}

- (HDContributorManager)contributorManager
{
  return self->_contributorManager;
}

- (HDDeviceContextStoreManager)deviceContextManager
{
  return self->_deviceContextManager;
}

- (HDDeviceKeyValueStoreManager)deviceKeyValueStoreManager
{
  return self->_deviceKeyValueStoreManager;
}

- (HDFeatureSettingsManager)featureSettingsManager
{
  return self->_featureSettingsManager;
}

- (HDHealthRecordsAccountExistenceNotifier)healthRecordsAccountExistenceNotifier
{
  return self->_healthRecordsAccountExistenceNotifier;
}

- (HDMedicalIDDataManager)medicalIDDataManager
{
  return self->_medicalIDDataManager;
}

- (HDOnboardingCompletionManager)onboardingCompletionManager
{
  return self->_onboardingCompletionManager;
}

- (HDPeriodicCountryMonitor)periodicCountryMonitor
{
  return self->_periodicCountryMonitor;
}

- (HDSharedSummaryManager)sharedSummaryManager
{
  return self->_sharedSummaryManager;
}

- (HDSharingAuthorizationManager)sharingAuthorizationManager
{
  return self->_sharingAuthorizationManager;
}

- (HDSyncIdentityManager)syncIdentityManager
{
  return self->_syncIdentityManager;
}

- (HDUserDomainConceptManager)userDomainConceptManager
{
  return self->_userDomainConceptManager;
}

- (HDDatabaseDailyAnalytics)dailyAnalytics
{
  return self->_dailyAnalytics;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSString)medicalIDDirectoryPath
{
  return self->_medicalIDDirectoryPath;
}

- (BOOL)testModeEnabled
{
  return self->_testModeEnabled;
}

- (HDAWDSubmissionManager)awdSubmissionManager
{
  return self->_awdSubmissionManager;
}

- (HDFeatureAvailabilityHealthDataRequirementEvaluationManager)healthDataRequirementEvaluationManager
{
  return self->_healthDataRequirementEvaluationManager;
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)requirementEvaluationDataSource
{
  return self->_requirementEvaluationDataSource;
}

- (HDKeyValueDomainManager)keyValueDomainManager
{
  return self->_keyValueDomainManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomainManager, 0);
  objc_storeStrong((id *)&self->_requirementEvaluationDataSource, 0);
  objc_storeStrong((id *)&self->_healthDataRequirementEvaluationManager, 0);
  objc_storeStrong((id *)&self->_awdSubmissionManager, 0);
  objc_storeStrong((id *)&self->_unitPreferencesManager, 0);
  objc_storeStrong((id *)&self->_medicalIDDirectoryPath, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_userDomainConceptManager, 0);
  objc_storeStrong((id *)&self->_userCharacteristicsManager, 0);
  objc_storeStrong((id *)&self->_sourceOrderManager, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_sharedSummaryManager, 0);
  objc_storeStrong((id *)&self->_periodicCountryMonitor, 0);
  objc_storeStrong((id *)&self->_onboardingCompletionManager, 0);
  objc_storeStrong((id *)&self->_metadataManager, 0);
  objc_storeStrong((id *)&self->_medicalIDDataManager, 0);
  objc_storeStrong((id *)&self->_healthRecordsAccountExistenceNotifier, 0);
  objc_storeStrong((id *)&self->_featureSettingsManager, 0);
  objc_storeStrong((id *)&self->_deviceKeyValueStoreManager, 0);
  objc_storeStrong((id *)&self->_deviceContextManager, 0);
  objc_storeStrong((id *)&self->_dataProvenanceManager, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_contributorManager, 0);
  objc_storeStrong((id *)&self->_cloudSyncManager, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_postProfileReadyBlocks, 0);
  objc_storeStrong((id *)&self->_profileReadyObservers, 0);
  objc_storeStrong((id *)&self->_profileInitializedObservers, 0);
  objc_storeStrong((id *)&self->_profileObserverGroup, 0);
  objc_storeStrong((id *)&self->_profileExtensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalytics, 0);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_storeStrong((id *)&self->_conceptIndexManager, 0);
  objc_storeStrong((id *)&self->_ontologyManager, 0);
  objc_storeStrong((id *)&self->_ontologyDatabase, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_sourceManager, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)setPairedGuardianParticipant:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = HDTinkerKeyValueDomainWithProfile(self);
  int v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a4];

  if (v8) {
    char v9 = [v7 setData:v8 forKey:@"TinkerPairedGuardianParticipantKey" error:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (id)pairedGuardianParticipantWithError:(id *)a3
{
  id v4 = HDTinkerKeyValueDomainWithProfile(self);
  id v5 = [v4 dataForKey:@"TinkerPairedGuardianParticipantKey" error:a3];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)setPairedGuardianUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = HDTinkerProtectedKeyValueDomainWithProfile(self);
  int v8 = [v6 firstName];
  int v9 = [v7 setString:v8 forKey:@"TinkerSharedUserFirstName" error:a4];

  if (!v9) {
    goto LABEL_8;
  }
  id v10 = [v6 lastName];
  char v11 = [v7 setString:v10 forKey:@"TinkerSharedUserLastName" error:a4];

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TinkerSharedUserFirstName", 0, v17);
    id v15 = LABEL_7:;
    [v7 removeValuesForKeys:v15 error:a4];

LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  id v12 = [v6 dsid];
  char v13 = [v7 setNumber:v12 forKey:@"TinkerSharedUserDSID" error:a4];

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TinkerSharedUserFirstName", @"TinkerSharedUserLastName", 0);
    goto LABEL_7;
  }
  BOOL v14 = 1;
LABEL_9:

  return v14;
}

- (id)pairedGuardianUserInfoWithError:(id *)a3
{
  id v4 = HDTinkerProtectedKeyValueDomainWithProfile(self);
  id v5 = objc_alloc_init(HDTinkerPairedUserInfo);
  id v6 = [v4 stringForKey:@"TinkerSharedUserFirstName" error:a3];
  [(HDTinkerPairedUserInfo *)v5 setFirstName:v6];

  id v7 = [(HDTinkerPairedUserInfo *)v5 firstName];
  if (v7)
  {
  }
  else if (*a3)
  {
    goto LABEL_12;
  }
  int v8 = [v4 stringForKey:@"TinkerSharedUserLastName" error:a3];
  [(HDTinkerPairedUserInfo *)v5 setLastName:v8];

  int v9 = [(HDTinkerPairedUserInfo *)v5 lastName];
  if (v9)
  {
  }
  else if (*a3)
  {
    goto LABEL_12;
  }
  id v10 = [v4 numberForKey:@"TinkerSharedUserDSID" error:a3];
  [(HDTinkerPairedUserInfo *)v5 setDsid:v10];

  char v11 = [(HDTinkerPairedUserInfo *)v5 dsid];
  if (!v11)
  {
    if (!*a3) {
      goto LABEL_13;
    }
LABEL_12:
    id v12 = 0;
    goto LABEL_14;
  }

LABEL_13:
  id v12 = v5;
LABEL_14:

  return v12;
}

@end