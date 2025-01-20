@interface HKHealthStore
+ (BOOL)_applicationHasRunningWorkout;
+ (BOOL)isHealthDataAvailable;
+ (BOOL)requireExplicitSystemMachServiceEnablement;
+ (void)disallowHKHealthStoreCreation;
+ (void)setRequireExplicitSystemMachServiceEnablement:(BOOL)a3;
- (BOOL)_prepareObjectsForSaving:(id)a3 errorOut:(id *)a4;
- (BOOL)_setActivityMoveMode:(int64_t)a3 error:(id *)a4;
- (BOOL)_setBiologicalSex:(int64_t)a3 error:(id *)a4;
- (BOOL)_setBloodType:(int64_t)a3 error:(id *)a4;
- (BOOL)_setBodyMassCharacteristicQuantity:(id)a3 error:(id *)a4;
- (BOOL)_setCardioFitnessMedicationsUse:(unint64_t)a3 error:(id *)a4;
- (BOOL)_setCharacteristic:(id)a3 forDataType:(id)a4 error:(id *)a5;
- (BOOL)_setDateOfBirthComponents:(id)a3 error:(id *)a4;
- (BOOL)_setFitzpatrickSkinType:(int64_t)a3 error:(id *)a4;
- (BOOL)_setHeightCharacteristicQuantity:(id)a3 error:(id *)a4;
- (BOOL)_setLeanBodyMassCharacteristicQuantity:(id)a3 error:(id *)a4;
- (BOOL)_setUserEnteredMenstrualCycleLengthCharacteristicQuantity:(id)a3 error:(id *)a4;
- (BOOL)_setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:(id)a3 error:(id *)a4;
- (BOOL)_setWheelchairUse:(int64_t)a3 error:(id *)a4;
- (BOOL)_supportsFeature:(unint64_t)a3;
- (BOOL)canConnectToSystemMachService;
- (BOOL)requiresWeakRetention;
- (BOOL)supportsHealthRecords;
- (HKActivityMoveModeObject)activityMoveModeWithError:(NSError *)error;
- (HKAuthorizationStatus)authorizationStatusForType:(HKObjectType *)type;
- (HKBiologicalSexObject)biologicalSexWithError:(NSError *)error;
- (HKBloodTypeObject)bloodTypeWithError:(NSError *)error;
- (HKFitzpatrickSkinTypeObject)fitzpatrickSkinTypeWithError:(NSError *)error;
- (HKHealthServicesManager)healthServicesManager;
- (HKHealthStore)init;
- (HKHealthStore)initWithIdentifier:(id)a3;
- (HKHealthStore)initWithListenerEndpoint:(id)a3;
- (HKHealthStore)initWithListenerEndpoint:(id)a3 debugIdentifier:(id)a4;
- (HKHealthStoreIdentifier)identifier;
- (HKProfileIdentifier)profileIdentifier;
- (HKWheelchairUseObject)wheelchairUseWithError:(NSError *)error;
- (NSBundle)sourceBundle;
- (NSDate)dateOfBirthWithError:(NSError *)error;
- (NSDate)earliestPermittedSampleDate;
- (NSDateComponents)dateOfBirthComponentsWithError:(NSError *)error;
- (NSSet)_queries;
- (NSString)clinicalReadAuthorizationUsageDescriptionOverride;
- (NSString)daemonLaunchDarwinNotificationName;
- (NSString)debugIdentifier;
- (NSString)firstName;
- (NSString)readAuthorizationUsageDescriptionOverride;
- (NSString)researchStudyUsageDescriptionOverride;
- (NSString)sourceBundleIdentifier;
- (NSString)writeAuthorizationUsageDescriptionOverride;
- (OS_dispatch_queue)clientQueue;
- (id)_actionCompletionOnClientQueue:(id)a3;
- (id)_activityMoveModeWithError:(id *)a3;
- (id)_bodyMassCharacteristicQuantityWithError:(id *)a3;
- (id)_cardioFitnessMedicationsUseWithError:(id *)a3;
- (id)_characteristicForDataType:(id)a3 error:(id *)a4;
- (id)_clientClinicalReadAuthorizationUsageDescription;
- (id)_clientReadAuthorizationUsageDescription;
- (id)_clientWriteAuthorizationUsageDescription;
- (id)_clinicalAuthorizationPresentationRequestForRecord:(id)a3;
- (id)_getDatabaseAccessibilityAssertionStoreKeeper;
- (id)_healthDataAuthorizationPresentationRequestForRecord:(id)a3;
- (id)_heightCharacteristicQuantityWithError:(id *)a3;
- (id)_hkui_authorizationViewControllerPresenter;
- (id)_initWithIdentifier:(id)a3;
- (id)_leanBodyMassCharacteristicQuantityWithError:(id *)a3;
- (id)_lock_connectionWithError:(id *)a3;
- (id)_modificationDateForCharacteristicWithType:(id)a3 error:(id *)a4;
- (id)_multiActionCompletionOnClientQueue:(id)a3;
- (id)_objectCompletionOnClientQueue:(id)a3;
- (id)_researchStudyUsageDescription;
- (id)_sourceBundleOrDefaultBundle;
- (id)_synchronousServerProxyWithErrorHandler:(id)a3;
- (id)_userEnteredMenstrualCycleLengthCharacteristicQuantityWithError:(id *)a3;
- (id)_userEnteredMenstrualPeriodLengthCharacteristicQuantityWithError:(id *)a3;
- (id)_wrappedErrorHandler:(id)a3 proxy:(id)a4;
- (id)ageWithCurrentDate:(id)a3 error:(id *)a4;
- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3;
- (id)featureStatusProviderForIdentifier:(id)a3;
- (id)healthDataRequirementEvaluationProvider;
- (id)healthStoreConfiguration;
- (id)pluginServiceEndpointForIdentifier:(id)a3 error:(id *)a4;
- (id)requirementSatisfactionOverridesDataSource;
- (id)sharedRequirementEvaluationDataSource;
- (id)taskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 error:(id *)a8;
- (id)unitTest_handleExecuteQuery;
- (id)unitTest_replaceListenerEndpoint:(id)a3;
- (id)watchLowPowerModeDataSource;
- (id)wristDetectionSettingManager;
- (unint64_t)applicationSDKVersionToken;
- (void)_activeWorkoutApplicationIdentifierWithCompletion:(id)a3;
- (void)_activityMoveModeObjectWithCompletion:(id)a3;
- (void)_addQuery:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_biologicalSexWithCompletion:(id)a3;
- (void)_bloodTypeWithCompletion:(id)a3;
- (void)_characteristicForDataType:(id)a3 withCompletion:(id)a4;
- (void)_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:(id)a3;
- (void)_closeTransactionWithTypes:(id)a3 anchor:(id)a4 ackTime:(id)a5;
- (void)_connectionQueue_setUpWithEndpoint:(id)a3;
- (void)_currentWorkoutSnapshotWithCompletion:(id)a3;
- (void)_dateOfBirthWithCompletion:(id)a3;
- (void)_deleteObjects:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_discardServerProxiesForServer:(id)a3;
- (void)_faultIfInnappropriateHost;
- (void)_fetchBoolDaemonPreferenceForKey:(id)a3 completion:(id)a4;
- (void)_fetchDaemonPreferenceForKey:(id)a3 completion:(id)a4;
- (void)_firstPartyWorkoutSnapshotWithCompletion:(id)a3;
- (void)_fitzpatrickSkinTypeWithCompletion:(id)a3;
- (void)_ratingOfExertionSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)_relateReplaceRatingOfExertionSample:(id)a3 toWorkout:(id)a4 forActivity:(id)a5 completion:(id)a6;
- (void)_removePreferredUnitForType:(id)a3 completion:(id)a4;
- (void)_removeQuery:(id)a3;
- (void)_replaceWorkout:(id)a3 withWorkout:(id)a4 completion:(id)a5;
- (void)_safeFetchDaemonPreferenceForKey:(id)a3 expectedReturnClass:(Class)a4 completion:(id)a5;
- (void)_saveObjects:(id)a3 atomically:(BOOL)a4 skipInsertionFilter:(BOOL)a5 completion:(id)a6;
- (void)_sendNextObjectBatch:(id)a3 skipInsertionFilter:(BOOL)a4 lastRange:(_NSRange)a5 server:(id)a6 transaction:(id)a7 completion:(id)a8;
- (void)_serverProxyWithHandler:(id)a3 errorHandler:(id)a4;
- (void)_setBackgroundDeliveryFrequencyDataType:(id)a3 frequency:(int64_t)a4 withCompletion:(id)a5;
- (void)_setConfigurationPropertyUsingBlock:(id)a3 resumeRequired:(BOOL)a4;
- (void)_setDaemonPreferenceValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)_setMirroredWorkoutSessionObserverStateToEnabled:(BOOL)a3 handler:(id)a4;
- (void)_setPreferredUnit:(id)a3 forType:(id)a4 completion:(id)a5;
- (void)_shouldGenerateDemoDataPreferenceIsSet:(id)a3;
- (void)_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5;
- (void)_throwIfAuthorizationDisallowedForSharing:(BOOL)a3 types:(id)a4;
- (void)_throwIfClinicalTypesRequestedToShare:(id)a3;
- (void)_throwIfParentTypeNotRequestedForSharing:(BOOL)a3 types:(id)a4;
- (void)_throwIfPerObjectReadAuthorizationNotSupportedForType:(id)a3;
- (void)_throwIfUsingIncorrectAuthorizationRequestType:(id)a3;
- (void)_validateAuthorizationRequestWithShareTypes:(id)a3 readTypes:(id)a4;
- (void)_validateAuthorizationRequiredTypes;
- (void)_validateClinicalHealthRecordsPurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4;
- (void)_validateHealthDataPurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4 isResearchStudy:(BOOL)a5;
- (void)_validatePurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4;
- (void)_wheelchairUseWithCompletion:(id)a3;
- (void)addHealthServicePairing:(id)a3 withCompletion:(id)a4;
- (void)addSamples:(NSArray *)samples toWorkout:(HKWorkout *)workout completion:(void *)completion;
- (void)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 completion:(id)a5;
- (void)beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 sourceHandler:(id)a4 errorHandler:(id)a5;
- (void)clientRemote_conceptIndexManagerDidBecomeQuiescentWithSamplesProcessedCount:(int64_t)a3;
- (void)clientRemote_didCreateRemoteSessionWithConfiguration:(id)a3;
- (void)clientRemote_presentAuthorizationWithRequestRecord:(id)a3 completion:(id)a4;
- (void)clientRemote_presentAuthorizationWithSession:(id)a3 completion:(id)a4;
- (void)clientRemote_presentRecalibrateEstimatesRequestWithRecord:(id)a3 completion:(id)a4;
- (void)clientRemote_unitPreferencesDidUpdate;
- (void)connectionConfigured;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)deleteAllSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)deleteClientSourceWithCompletion:(id)a3;
- (void)deleteMedicalIDData;
- (void)deleteMedicalIDDataWithCompletion:(id)a3;
- (void)deleteObject:(HKObject *)object withCompletion:(void *)completion;
- (void)deleteObject:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)deleteObjects:(NSArray *)objects withCompletion:(void *)completion;
- (void)deleteObjectsOfType:(HKObjectType *)objectType predicate:(NSPredicate *)predicate withCompletion:(void *)completion;
- (void)deleteObjectsOfType:(id)a3 predicate:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)deleteObjectsWithUUIDs:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)disableAllBackgroundDeliveryWithCompletion:(void *)completion;
- (void)disableBackgroundDeliveryForType:(HKObjectType *)type withCompletion:(void *)completion;
- (void)disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3;
- (void)dropEntitlement:(id)a3;
- (void)endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4;
- (void)endHealthServiceDiscovery:(id)a3;
- (void)endHealthServiceSession:(id)a3;
- (void)endWorkoutSession:(HKWorkoutSession *)workoutSession;
- (void)executeQuery:(HKQuery *)query;
- (void)executeQuery:(id)a3 activationHandler:(id)a4;
- (void)fetchCloudSyncRequiredWithCompletion:(id)a3;
- (void)fetchMedicalIDDataCreateIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchMedicalIDDataWithCompletion:(id)a3;
- (void)fetchMedicalIDEmergencyContactsWithCompletion:(id)a3;
- (void)fetchPluginServiceEndpointForIdentifier:(id)a3 endpointHandler:(id)a4 errorHandler:(id)a5;
- (void)fetchServerURLForAssetType:(id)a3 completion:(id)a4;
- (void)fetchTaskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 endpointHandler:(id)a8 errorHandler:(id)a9;
- (void)forceCloudSyncDataUploadForProfileWithCompletion:(id)a3;
- (void)forceCloudSyncWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5;
- (void)getAllHealthDataAccessForSiriWithCompletion:(id)a3;
- (void)getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4;
- (void)getHealthLiteValueForKey:(id)a3 completion:(id)a4;
- (void)getRequestStatusForAuthorizationToShareTypes:(NSSet *)typesToShare readTypes:(NSSet *)typesToRead completion:(void *)completion;
- (void)handleAuthorizationForExtensionWithCompletion:(void *)completion;
- (void)healthPeripheralsWithCustomProperties:(id)a3 withCompletion:(id)a4;
- (void)healthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4;
- (void)healthServicePairingsWithHandler:(id)a3;
- (void)invalidateAllDatabaseAccessibilityAssertions;
- (void)invalidateDatabaseAccessibilityAssertion:(id)a3;
- (void)isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:(id)a3;
- (void)isProtectedDataAvailableWithCompletion:(id)a3;
- (void)pauseWorkoutSession:(HKWorkoutSession *)workoutSession;
- (void)preferredUnitsForQuantityTypes:(NSSet *)quantityTypes completion:(void *)completion;
- (void)preferredUnitsForQuantityTypes:(id)a3 version:(int64_t)a4 completion:(id)a5;
- (void)profileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4;
- (void)recalibrateEstimatesForSampleType:(HKSampleType *)sampleType atDate:(NSDate *)date completion:(void *)completion;
- (void)recoverActiveWorkoutSessionWithCompletion:(void *)completion;
- (void)registerPeripheralIdentifier:(id)a3 name:(id)a4 services:(id)a5 withCompletion:(id)a6;
- (void)relateWorkoutEffortSample:(id)a3 withWorkout:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)removeHealthServicePairing:(id)a3 withCompletion:(id)a4;
- (void)requestAuthorizationToShareTypes:(NSSet *)typesToShare readTypes:(NSSet *)typesToRead completion:(void *)completion;
- (void)requestAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 shouldPrompt:(BOOL)a5 completion:(id)a6;
- (void)requestDatabaseAccessibilityAssertion:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)requestPerObjectReadAuthorizationForType:(HKObjectType *)objectType predicate:(NSPredicate *)predicate completion:(void *)completion;
- (void)restoreEntitlement:(id)a3;
- (void)resume;
- (void)resumeWorkoutSession:(HKWorkoutSession *)workoutSession;
- (void)saveObject:(HKObject *)object withCompletion:(void *)completion;
- (void)saveObjects:(NSArray *)objects withCompletion:(void *)completion;
- (void)saveObjects:(id)a3 associations:(id)a4 completion:(id)a5;
- (void)saveObjects:(id)a3 deleteObjects:(id)a4 associations:(id)a5 completion:(id)a6;
- (void)saveObjects:(id)a3 skipInsertionFilter:(BOOL)a4 completion:(id)a5;
- (void)setAllHealthDataAccessForSiri:(int64_t)a3 completion:(id)a4;
- (void)setCanConnectToSystemMachService:(BOOL)a3;
- (void)setClinicalReadAuthorizationUsageDescriptionOverride:(id)a3;
- (void)setDaemonLaunchDarwinNotificationName:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setHealthLiteValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setProfileIdentifier:(id)a3;
- (void)setReadAuthorizationUsageDescriptionOverride:(id)a3;
- (void)setResearchStudyUsageDescriptionOverride:(id)a3;
- (void)setServerURL:(id)a3 forAssetType:(id)a4 completion:(id)a5;
- (void)setSourceBundle:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setUnitTest_handleExecuteQuery:(id)a3;
- (void)setWorkoutSessionMirroringStartHandler:(void *)workoutSessionMirroringStartHandler;
- (void)setWriteAuthorizationUsageDescriptionOverride:(id)a3;
- (void)set_hkui_authorizationViewControllerPresenter:(id)a3;
- (void)splitTotalEnergy:(HKQuantity *)totalEnergy startDate:(NSDate *)startDate endDate:(NSDate *)endDate resultsHandler:(void *)resultsHandler;
- (void)startHealthServiceDiscovery:(id)a3 withHandler:(id)a4;
- (void)startHealthServiceSession:(id)a3 withHandler:(id)a4;
- (void)startWatchAppWithWorkoutConfiguration:(HKWorkoutConfiguration *)workoutConfiguration completion:(void *)completion;
- (void)startWorkoutSession:(HKWorkoutSession *)workoutSession;
- (void)stopQuery:(HKQuery *)query;
- (void)unitTest_setApplicationSDKVersionToken:(unint64_t)a3;
- (void)unregisterPeripheralIdentifier:(id)a3 withCompletion:(id)a4;
- (void)unrelateWorkoutEffortSample:(id)a3 fromWorkout:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)updateMedicalIDData:(id)a3;
- (void)updateMedicalIDData:(id)a3 completion:(id)a4;
@end

@implementation HKHealthStore

- (void)startHealthServiceDiscovery:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 startHealthServiceDiscovery:v7 withHandler:v6];
}

- (void)endHealthServiceDiscovery:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthStore *)self healthServicesManager];
  [v5 endHealthServiceDiscovery:v4];
}

- (void)startHealthServiceSession:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 startHealthServiceSession:v7 withHandler:v6];
}

- (void)endHealthServiceSession:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthStore *)self healthServicesManager];
  [v5 endHealthServiceSession:v4];
}

- (void)registerPeripheralIdentifier:(id)a3 name:(id)a4 services:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(HKHealthStore *)self healthServicesManager];
  [v14 registerPeripheralIdentifier:v13 name:v12 services:v11 withCompletion:v10];
}

- (void)unregisterPeripheralIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 unregisterPeripheralIdentifier:v7 withCompletion:v6];
}

- (void)healthServicePairingsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthStore *)self healthServicesManager];
  [v5 healthServicePairingsWithHandler:v4];
}

- (void)healthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = [(HKHealthStore *)self healthServicesManager];
  [v7 healthPeripheralsWithFilter:a3 handler:v6];
}

- (void)addHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 addHealthServicePairing:v7 withCompletion:v6];
}

- (void)removeHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 removeHealthServicePairing:v7 withCompletion:v6];
}

- (void)healthPeripheralsWithCustomProperties:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 healthPeripheralsWithCustomProperties:v7 withCompletion:v6];
}

- (void)getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKHealthStore *)self healthServicesManager];
  [v8 getEnabledStatusForPeripheral:v7 withCompletion:v6];
}

+ (BOOL)isHealthDataAvailable
{
  v2 = +[_HKBehavior sharedBehavior];
  if ([v2 isiPad])
  {
    char v3 = HKProgramSDKAtLeast();

    if ((v3 & 1) == 0) {
      return 0;
    }
  }
  else
  {
  }

  return +[_HKBehavior isDeviceSupported];
}

+ (void)setRequireExplicitSystemMachServiceEnablement:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_classPropertyLock);
  _requireExplicitSystemMachServiceEndpoint = a3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classPropertyLock);
}

+ (BOOL)requireExplicitSystemMachServiceEnablement
{
  os_unfair_lock_lock((os_unfair_lock_t)&_classPropertyLock);
  char v2 = _requireExplicitSystemMachServiceEndpoint;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classPropertyLock);
  return v2;
}

+ (void)disallowHKHealthStoreCreation
{
  _allowHKHealthStoreCreation = 1;
}

- (HKHealthStore)init
{
  return [(HKHealthStore *)self initWithListenerEndpoint:0 debugIdentifier:0];
}

- (id)_initWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthStore *)self init];
  if (v5)
  {
    id v6 = [v4 profileIdentifier];
    [(HKHealthStore *)v5 setProfileIdentifier:v6];
  }
  return v5;
}

- (HKHealthStore)initWithIdentifier:(id)a3
{
  return [(HKHealthStore *)self initWithListenerEndpoint:0 debugIdentifier:a3];
}

- (HKHealthStore)initWithListenerEndpoint:(id)a3
{
  return [(HKHealthStore *)self initWithListenerEndpoint:a3 debugIdentifier:0];
}

- (HKHealthStore)initWithListenerEndpoint:(id)a3 debugIdentifier:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() isHealthDataAvailable] & 1) == 0)
  {
    _HKInitializeLogging();
    id v8 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "Health data is not available on this device", buf, 2u);
    }
  }
  if (_allowHKHealthStoreCreation == 1)
  {
    _HKInitializeLogging();
    v9 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT)) {
      -[HKHealthStore initWithListenerEndpoint:debugIdentifier:](v9);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v10 = objc_msgSend(MEMORY[0x1E4F29060], "callStackSymbols", v7, v6);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * v14);
          _HKInitializeLogging();
          v16 = HKLogDefault;
          if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = v15;
            _os_log_error_impl(&dword_19C023000, v16, OS_LOG_TYPE_ERROR, "    %@", buf, 0xCu);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v12);
    }

    id v7 = v34;
    id v6 = v35;
  }
  v39.receiver = self;
  v39.super_class = (Class)HKHealthStore;
  v17 = [(HKHealthStore *)&v39 init];
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = HKCreateSerialDispatchQueue(v17, @"connection");
    connectionQueue = v18->_connectionQueue;
    v18->_connectionQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = HKCreateSerialDispatchQueue(v18, @"client");
    clientQueue = v18->_clientQueue;
    v18->_clientQueue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v18->_daemonLaunchDarwinNotificationName, @"kHKHealthDaemonDidFinishLaunchingNotification");
    uint64_t v23 = [v7 copy];
    debugIdentifier = v18->_debugIdentifier;
    v18->_debugIdentifier = (NSString *)v23;

    uint64_t v25 = +[HKProfileIdentifier primaryProfile];
    profileIdentifier = v18->_profileIdentifier;
    v18->_profileIdentifier = (HKProfileIdentifier *)v25;

    uint64_t v27 = +[HKHealthStoreIdentifier primaryStoreIdentifier];
    identifier = v18->_identifier;
    v18->_identifier = (HKHealthStoreIdentifier *)v27;

    uint64_t v29 = HKApplicationSDKVersionToken();
    BOOL v30 = 0;
    v18->_applicationSDKVersionToken = v29;
    if (!v6) {
      BOOL v30 = !+[HKHealthStore requireExplicitSystemMachServiceEnablement];
    }
    v18->_canConnectToSystemMachService = v30;
    v18->_isUsingSystemEndpoint = v6 == 0;
    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v18 selector:sel__applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];
    [v31 addObserver:v18 selector:sel__applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
    [(HKHealthStore *)v18 _faultIfInnappropriateHost];
    v32 = v18->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HKHealthStore_initWithListenerEndpoint_debugIdentifier___block_invoke;
    block[3] = &unk_1E58BBBD0;
    v37 = v18;
    id v38 = v6;
    dispatch_async(v32, block);
  }
  return v18;
}

uint64_t __58__HKHealthStore_initWithListenerEndpoint_debugIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_setUpWithEndpoint:", *(void *)(a1 + 40));
}

- (void)_faultIfInnappropriateHost
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Attempt to instantiate HKHealthStore in healthd", v1, 2u);
}

void __43__HKHealthStore__faultIfInnappropriateHost__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v1 processName];
  _faultIfInnappropriateHost_isHealthd = [v0 isEqualToString:@"healthd"];
}

- (void)_connectionQueue_setUpWithEndpoint:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (+[_HKBehavior isDeviceSupported])
  {
    id v5 = [_HKXPCConnection alloc];
    if (v4) {
      uint64_t v6 = [(_HKXPCConnection *)v5 initWithListenerEndpoint:v4];
    }
    else {
      uint64_t v6 = [(_HKXPCConnection *)v5 initWithMachServiceName:@"com.apple.healthd.server" options:4096];
    }
    id v7 = (_HKXPCConnection *)v6;
    if (!v6)
    {
      _HKInitializeLogging();
      id v8 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        -[HKHealthStore _connectionQueue_setUpWithEndpoint:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    healthdConnection = self->_healthdConnection;
    self->_healthdConnection = v7;
    v17 = v7;

    [(_HKXPCConnection *)self->_healthdConnection setExportedObject:self];
    [(_HKXPCConnection *)self->_healthdConnection resume];
  }
}

- (id)unitTest_replaceListenerEndpoint:(id)a3
{
  id v4 = a3;
  self->_isUsingSystemEndpoint = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKHealthStore_unitTest_replaceListenerEndpoint___block_invoke;
  block[3] = &unk_1E58BBAC8;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(connectionQueue, block);
  [(HKHealthStore *)self connectionInterrupted];
  [(id)v13[5] invalidate];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __50__HKHealthStore_unitTest_replaceListenerEndpoint___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_setUpWithEndpoint:", *(void *)(a1 + 40));
  char v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v2 setExportedObject:0];
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_HKXPCConnection *)self->_healthdConnection invalidate];
  os_unfair_lock_unlock(p_lock);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HKHealthStore;
  [(HKHealthStore *)&v5 dealloc];
}

- (void)_setConfigurationPropertyUsingBlock:(id)a3 resumeRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_resumed)
  {
    os_unfair_lock_unlock(&self->_lock);
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot configure HKHealthStore after it has been resumed"];
  }
  else
  {
    if (v4) {
      self->_resumeRequired = 1;
    }
    v6[2]();
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)unitTest_setApplicationSDKVersionToken:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__HKHealthStore_unitTest_setApplicationSDKVersionToken___block_invoke;
  v3[3] = &unk_1E58BD9D0;
  v3[4] = self;
  v3[5] = a3;
  [(HKHealthStore *)self _setConfigurationPropertyUsingBlock:v3 resumeRequired:1];
}

uint64_t __56__HKHealthStore_unitTest_setApplicationSDKVersionToken___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64) = *(void *)(result + 40);
  return result;
}

- (unint64_t)applicationSDKVersionToken
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t applicationSDKVersionToken = self->_applicationSDKVersionToken;
  os_unfair_lock_unlock(p_lock);
  return applicationSDKVersionToken;
}

- (void)setProfileIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__HKHealthStore_setProfileIdentifier___block_invoke;
  v6[3] = &unk_1E58BBBD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKHealthStore *)self _setConfigurationPropertyUsingBlock:v6 resumeRequired:1];
}

uint64_t __38__HKHealthStore_setProfileIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 232) = +[HKHealthStoreIdentifier identifierFromProfileIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (HKProfileIdentifier)profileIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_profileIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__HKHealthStore_setSourceBundleIdentifier___block_invoke;
  v6[3] = &unk_1E58BD9F8;
  v6[4] = self;
  id v8 = &v9;
  id v5 = v4;
  id v7 = v5;
  [(HKHealthStore *)self _setConfigurationPropertyUsingBlock:v6 resumeRequired:1];
  if (*((unsigned char *)v10 + 24)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Do not set both sourceBundleIdentifier and sourceBundle"];
  }

  _Block_object_dispose(&v9, 8);
}

void __43__HKHealthStore_setSourceBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 32)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else {
    objc_storeStrong((id *)(v1 + 40), *(id *)(a1 + 40));
  }
}

- (NSString)sourceBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sourceBundleIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSourceBundle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__HKHealthStore_setSourceBundle___block_invoke;
  v6[3] = &unk_1E58BBBD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKHealthStore *)self _setConfigurationPropertyUsingBlock:v6 resumeRequired:1];
}

void __33__HKHealthStore_setSourceBundle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 40);
  id v6 = (id *)(*(void *)(a1 + 32) + 32);

  objc_storeStrong(v6, v5);
}

- (NSBundle)sourceBundle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sourceBundle;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)_sourceBundleOrDefaultBundle
{
  uint64_t v2 = [(HKHealthStore *)self sourceBundle];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  id v5 = v4;

  return v5;
}

- (void)setDebugIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__HKHealthStore_setDebugIdentifier___block_invoke;
  v6[3] = &unk_1E58BBBD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKHealthStore *)self _setConfigurationPropertyUsingBlock:v6 resumeRequired:1];
}

void __36__HKHealthStore_setDebugIdentifier___block_invoke(uint64_t a1)
{
}

- (NSString)debugIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_debugIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCanConnectToSystemMachService:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__HKHealthStore_setCanConnectToSystemMachService___block_invoke;
  v3[3] = &unk_1E58BDA20;
  v3[4] = self;
  BOOL v4 = a3;
  [(HKHealthStore *)self _setConfigurationPropertyUsingBlock:v3 resumeRequired:0];
}

uint64_t __50__HKHealthStore_setCanConnectToSystemMachService___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)canConnectToSystemMachService
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canConnectToSystemMachService;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HKHealthServicesManager)healthServicesManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  healthServicesManager = self->_healthServicesManager;
  if (!healthServicesManager)
  {
    id v5 = [[HKHealthServicesManager alloc] initWithWeakHealthStore:self];
    id v6 = self->_healthServicesManager;
    self->_healthServicesManager = v5;

    healthServicesManager = self->_healthServicesManager;
  }
  id v7 = healthServicesManager;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)resume
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_resumed = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)_discardServerProxiesForServer:(id)a3
{
  BOOL v4 = (HKHealthStoreServerInterface *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serverProxy == v4)
  {
    self->_serverProxy = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_lock_connectionWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_resumed)
  {
    if (self->_resumeRequired)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Missing call to -[HKHealthStore resume]"");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = v9;
      if (v9)
      {
        if (a3) {
          *a3 = v9;
        }
        else {
          _HKLogDroppedError(v9);
        }
      }

      goto LABEL_19;
    }
    self->_resumed = 1;
  }
  if (self->_isUsingSystemEndpoint && !self->_canConnectToSystemMachService)
  {
LABEL_19:
    id v7 = 0;
    goto LABEL_23;
  }
  id v6 = self->_healthdConnection;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else if (+[_HKBehavior isDeviceSupported])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"invalid connection to %@", @"com.apple.healthd.server");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthDataUnavailableError");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    char v12 = v11;
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        _HKLogDroppedError(v11);
      }
    }
  }
LABEL_23:

  return v7;
}

- (id)_wrappedErrorHandler:(id)a3 proxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__HKHealthStore__wrappedErrorHandler_proxy___block_invoke;
  aBlock[3] = &unk_1E58BDA48;
  aBlock[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = _Block_copy(aBlock);

  return v10;
}

void __44__HKHealthStore__wrappedErrorHandler_proxy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hk_isXPCConnectionError")) {
    [*(id *)(a1 + 32) _discardServerProxiesForServer:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)healthStoreConfiguration
{
  id v3 = [HKHealthStoreConfiguration alloc];
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  id v7 = [(HKHealthStoreConfiguration *)v3 initWithSourceBundleIdentifier:sourceBundleIdentifier sourceVersion:v6 debugIdentifier:self->_debugIdentifier profileIdentifier:self->_profileIdentifier applicationSDKVersionToken:self->_applicationSDKVersionToken];

  return v7;
}

- (void)_serverProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKHealthStore.m", 515, @"Invalid parameter not satisfying: %@", @"proxyHandler" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKHealthStore.m", 516, @"Invalid parameter not satisfying: %@", @"originalErrorHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke;
  block[3] = &unk_1E58BDA98;
  void block[4] = self;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(connectionQueue, block);
}

void __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 32);
  id v13 = 0;
  id v3 = objc_msgSend(v2, "_lock_connectionWithError:", &v13);
  id v4 = v13;
  id v5 = *(id *)(*(void *)(a1 + 32) + 80);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v6 = [*(id *)(a1 + 32) _wrappedErrorHandler:*(void *)(a1 + 40) proxy:v5];
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [v5 remoteObjectProxyWithErrorHandler:v6];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    if (!v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    id v8 = [v3 remoteObjectProxyWithErrorHandler:v6];
    id v9 = [*(id *)(a1 + 32) healthStoreConfiguration];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke_2;
    v10[3] = &unk_1E58BDA70;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "remote_serverForConfiguration:completion:", v9, v10);
  }
LABEL_6:
}

void __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;
    id v7 = v4;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
    id v9 = [v7 remoteObjectProxyWithErrorHandler:a1[5]];

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v8 = *(void (**)(void))(a1[5] + 16);
    v8();
  }
}

- (id)_synchronousServerProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v29 = 0;
  BOOL v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  uint64_t v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E58BDAC0;
  void block[4] = self;
  void block[5] = &v23;
  block[6] = &v29;
  block[7] = &v17;
  dispatch_sync(connectionQueue, block);
  id v6 = [(HKHealthStore *)self _wrappedErrorHandler:v4 proxy:v18[5]];
  id v7 = (void *)v18[5];
  if (v7)
  {
    id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v6];
  }
  else
  {
    id v9 = (void *)v24[5];
    if (v9)
    {
      id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v6];
      id v11 = [(HKHealthStore *)self healthStoreConfiguration];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke_2;
      v13[3] = &unk_1E58BDAE8;
      v13[4] = self;
      uint64_t v15 = &v17;
      id v14 = v6;
      objc_msgSend(v10, "remote_serverForConfiguration:completion:", v11, v13);
      id v8 = (id)v18[5];
    }
    else
    {
      v4[2](v4, v30[5]);
      id v8 = 0;
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v8;
}

void __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  uint64_t v2 = (void *)a1[4];
  id v10 = 0;
  uint64_t v3 = objc_msgSend(v2, "_lock_connectionWithError:", &v10);
  id v4 = v10;
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
  id v9 = v4;

  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 80));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
}

void __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke_2(void *a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
    objc_storeStrong((id *)(a1[4] + 80), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
    uint64_t v4 = [v7 synchronousRemoteObjectProxyWithErrorHandler:a1[5]];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)fetchPluginServiceEndpointForIdentifier:(id)a3 endpointHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "endpointHandler");
    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "errorHandler");
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "pluginIdentifier");
  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke;
  aBlock[3] = &unk_1E58BDA48;
  id v11 = v8;
  id v22 = v11;
  uint64_t v23 = self;
  id v24 = v10;
  id v12 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_2;
  v16[3] = &unk_1E58BDB38;
  id v17 = v11;
  v18 = self;
  id v19 = v9;
  id v20 = v12;
  id v13 = v12;
  id v14 = v9;
  id v15 = v11;
  [(HKHealthStore *)self _serverProxyWithHandler:v16 errorHandler:v13];
}

void __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin service \"%{public}@\": %{public}@", buf, 0x16u);
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 40) + 216);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_359;
  v9[3] = &unk_1E58BBF10;
  id v7 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

uint64_t __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_359(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_3;
  v7[3] = &unk_1E58BDB10;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  objc_msgSend(v6, "remote_fetchPluginServiceEndpointWithIdentifier:completion:", v4, v7);
}

void __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 216);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_4;
    v16[3] = &unk_1E58BBF10;
    id v8 = &v18;
    id v18 = *(id *)(a1 + 56);
    id v9 = &v17;
    id v17 = v5;
    id v10 = v16;
  }
  else
  {
    _HKInitializeLogging();
    id v11 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin \"%{public}@\": %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v6, "hk_isXPCConnectionError")) {
      [*(id *)(a1 + 32) _discardServerProxiesForServer:*(void *)(a1 + 48)];
    }
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 216);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_360;
    v13[3] = &unk_1E58BBF10;
    id v8 = &v15;
    id v15 = *(id *)(a1 + 64);
    id v9 = &v14;
    id v14 = v6;
    id v10 = v13;
  }
  dispatch_async(v7, v10);
}

uint64_t __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_360(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)pluginServiceEndpointForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "pluginIdentifier");
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  id v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  id v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke;
  v21[3] = &unk_1E58BDB60;
  id v7 = v6;
  id v22 = v7;
  uint64_t v23 = &v24;
  id v8 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v21];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke_363;
  v15[3] = &unk_1E58BDB88;
  id v19 = &v30;
  id v9 = v7;
  id v16 = v9;
  id v17 = self;
  id v10 = v8;
  id v18 = v10;
  uint64_t v20 = &v24;
  objc_msgSend(v10, "remote_fetchPluginServiceEndpointWithIdentifier:completion:", v9, v15);
  id v11 = (id)v25[5];
  uint64_t v12 = v11;
  if (v11)
  {
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError(v11);
    }
  }

  id v13 = (id)v31[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);

  return v13;
}

void __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin service \"%{public}@\": %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke_363(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    int v8 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = a2;
  }
  else
  {
    _HKInitializeLogging();
    __int16 v10 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin \"%{public}@\": %{public}@", (uint8_t *)&v12, 0x16u);
    }
    if (objc_msgSend(v7, "hk_isXPCConnectionError")) {
      [*(id *)(a1 + 40) _discardServerProxiesForServer:*(void *)(a1 + 48)];
    }
    int v8 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v9 = a3;
  }
  objc_storeStrong(v8, v9);
}

- (void)fetchTaskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 endpointHandler:(id)a8 errorHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v15)
  {
    if (v20) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "endpointHandler");
    if (v21) {
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "errorHandler");
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "taskIdentifier");
  if (!v20) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v21) {
    goto LABEL_7;
  }
LABEL_4:
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke;
  v29[3] = &unk_1E58BDBB0;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v35 = self;
  id v36 = v20;
  id v37 = v21;
  id v22 = v21;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  [(HKHealthStore *)self _serverProxyWithHandler:v29 errorHandler:v22];
}

void __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_2;
  v11[3] = &unk_1E58BDB10;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 80);
  v11[4] = *(void *)(a1 + 72);
  id v14 = v9;
  id v12 = *(id *)(a1 + 32);
  id v13 = v3;
  id v15 = *(id *)(a1 + 88);
  id v10 = v3;
  objc_msgSend(v10, "remote_createTaskServerEndpointForIdentifier:pluginURL:taskUUID:instanceUUID:configuration:completion:", v4, v5, v6, v7, v8, v11);
}

void __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 216);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_3;
    v16[3] = &unk_1E58BBF10;
    uint64_t v8 = &v18;
    id v18 = *(id *)(a1 + 56);
    uint64_t v9 = &v17;
    id v17 = v5;
    id v10 = v16;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for task server \"%{public}@\": %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v6, "hk_isXPCConnectionError")) {
      [*(id *)(a1 + 32) _discardServerProxiesForServer:*(void *)(a1 + 48)];
    }
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 216);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_365;
    v13[3] = &unk_1E58BBF10;
    uint64_t v8 = &v15;
    id v15 = *(id *)(a1 + 64);
    uint64_t v9 = &v14;
    id v14 = v6;
    id v10 = v13;
  }
  dispatch_async(v7, v10);
}

uint64_t __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_365(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)taskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "taskIdentifier");
  }
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = __Block_byref_object_copy__3;
  long long v43 = __Block_byref_object_dispose__3;
  id v44 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__3;
  id v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke;
  v32[3] = &unk_1E58BDBD8;
  v32[4] = &v33;
  id v19 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v32];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke_2;
  v26[3] = &unk_1E58BDB88;
  id v30 = &v39;
  id v20 = v14;
  id v27 = v20;
  id v28 = self;
  id v21 = v19;
  id v29 = v21;
  id v31 = &v33;
  objc_msgSend(v21, "remote_createTaskServerEndpointForIdentifier:pluginURL:taskUUID:instanceUUID:configuration:completion:", v20, v15, v16, v17, v18, v26);
  id v22 = (id)v34[5];
  uint64_t v23 = v22;
  if (v22)
  {
    if (a8) {
      *a8 = v22;
    }
    else {
      _HKLogDroppedError(v22);
    }
  }

  id v24 = (id)v40[5];
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);

  return v24;
}

void __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke(uint64_t a1, void *a2)
{
}

void __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = a2;
  }
  else
  {
    _HKInitializeLogging();
    id v10 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for task server \"%{public}@\": %{public}@", (uint8_t *)&v12, 0x16u);
    }
    if (objc_msgSend(v7, "hk_isXPCConnectionError")) {
      [*(id *)(a1 + 40) _discardServerProxiesForServer:*(void *)(a1 + 48)];
    }
    uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v9 = a3;
  }
  objc_storeStrong(v8, v9);
}

- (void)deleteAllSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "sampleTypes");
  }
  if (![v11 count])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKHealthStore.m", 740, @"Invalid parameter not satisfying: %@", @"[sampleTypes count] > 0" object file lineNumber description];
  }
  __int16 v14 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v13];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke;
  v21[3] = &unk_1E58BDC00;
  id v22 = v11;
  id v23 = v12;
  unint64_t v25 = a5;
  id v24 = v14;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2;
  v19[3] = &unk_1E58BBD88;
  id v20 = v24;
  id v15 = v24;
  id v16 = v12;
  id v17 = v11;
  [(HKHealthStore *)self _serverProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", a1[4], a1[5], a1[7], a1[6]);
}

uint64_t __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteObjectsWithUUIDs:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "uuids");
  }
  id v10 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v9];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke;
  v15[3] = &unk_1E58BDC28;
  id v16 = v8;
  unint64_t v18 = a4;
  id v17 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteObjectsWithUUIDs:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteClientSourceWithCompletion:(id)a3
{
  uint64_t v4 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke;
  v8[3] = &unk_1E58BDC50;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthStore *)self _serverProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteClientSourceWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = [v8 count];
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_INFO, "Associating %llu samples to sample %{public}@", buf, 0x16u);
  }
  id v13 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v10];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke;
  v19[3] = &unk_1E58BDC78;
  id v20 = v8;
  id v21 = v9;
  id v22 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2;
  v17[3] = &unk_1E58BBD88;
  id v18 = v22;
  id v14 = v22;
  id v15 = v9;
  id v16 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v19 errorHandler:v17];
}

uint64_t __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_associateSampleUUIDs:withSampleUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveObjects:(id)a3 deleteObjects:(id)a4 associations:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a6];
  if ((unint64_t)[v11 count] <= 0xC8
    && (unint64_t)[v12 count] <= 0xC8
    && (unint64_t)[v13 count] < 0xC9)
  {
    id v25 = 0;
    BOOL v16 = [(HKHealthStore *)self _prepareObjectsForSaving:v11 errorOut:&v25];
    id v17 = v25;
    if (v16)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke;
      v20[3] = &unk_1E58BDCA0;
      id v21 = v11;
      id v22 = v12;
      id v23 = v13;
      uint64_t v24 = v14;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke_2;
      v18[3] = &unk_1E58BBD88;
      id v19 = v24;
      [(HKHealthStore *)self _serverProxyWithHandler:v20 errorHandler:v18];
    }
    else
    {
      ((void (**)(void, void, id))v14)[2](v14, 0, v17);
    }
  }
  else
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Current support only valid for saving, deleting and associating for %d objects or less"", 200);
    ((void (**)(void, void, void *))v14)[2](v14, 0, v15);
  }
}

uint64_t __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_saveObjects:deleteObjects:associations:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveObjects:(id)a3 associations:(id)a4 completion:(id)a5
{
}

- (void)recalibrateEstimatesForSampleType:(HKSampleType *)sampleType atDate:(NSDate *)date completion:(void *)completion
{
  id v8 = sampleType;
  id v9 = date;
  id v10 = completion;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "sampleType");
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "date");
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke;
  v23[3] = &unk_1E58BDCC8;
  id v11 = v8;
  uint64_t v24 = v11;
  id v12 = v9;
  id v25 = v12;
  id v26 = v10;
  id v13 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v23];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_377;
  v19[3] = &unk_1E58BDC78;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2;
  v17[3] = &unk_1E58BBD88;
  id v18 = v22;
  id v14 = v22;
  id v15 = v12;
  BOOL v16 = v11;
  [(HKHealthStore *)self _serverProxyWithHandler:v19 errorHandler:v17];
}

void __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogAuthorization;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Finished recalibrate estimates request for %@ effective %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
  {
    __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_377(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_recalibrateEstimatesForSampleType:atDate:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_presentRecalibrateEstimatesRequestWithRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = +[_HKBehavior sharedBehavior];
  int v9 = [v8 isiPad];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2, @"Estimate recalibration is not supported on this device.");
    v7[2](v7, 0, v10);
  }
  else
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HKHealthStore_clientRemote_presentRecalibrateEstimatesRequestWithRecord_completion___block_invoke;
    block[3] = &unk_1E58BB9A0;
    id v14 = v7;
    void block[4] = self;
    id v13 = v6;
    dispatch_async(clientQueue, block);
  }
}

void __86__HKHealthStore_clientRemote_presentRecalibrateEstimatesRequestWithRecord_completion___block_invoke(void *a1)
{
  if (_HKCurrentTaskIsAppExtension())
  {
    uint64_t v2 = a1[6];
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = @"Cannot present recalibrate estimates prompt from an app extension.";
    uint64_t v5 = 3;
LABEL_3:
    objc_msgSend(v3, "hk_error:description:", v5, v4);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, WeakRetained);
    goto LABEL_7;
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(v6 + 104);
  if (!v7)
  {
    uint64_t v8 = _HKCreateRecalibrateEstimatesPresentationController();
    uint64_t v9 = a1[4];
    uint64_t v10 = *(void **)(v9 + 104);
    *(void *)(v9 + 104) = v8;

    uint64_t v6 = a1[4];
    uint64_t v7 = *(void **)(v6 + 104);
    if (!v7)
    {
      uint64_t v2 = a1[6];
      id v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = @"Failed to create recalibrate estimates presentation controller.";
      uint64_t v5 = 100;
      goto LABEL_3;
    }
  }
  uint64_t v11 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(v6 + 208));
  [v7 presentWithRequestRecord:v11 authorizationViewControllerPresenter:WeakRetained completion:a1[6]];
LABEL_7:
}

- (HKAuthorizationStatus)authorizationStatusForType:(HKObjectType *)type
{
  uint64_t v5 = type;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKHealthStore.m", 891, @"Invalid parameter not satisfying: %@", @"[type isKindOfClass:[HKObjectType class]]" object file lineNumber description];
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__HKHealthStore_authorizationStatusForType___block_invoke;
  aBlock[3] = &unk_1E58BDCF0;
  void aBlock[4] = &v18;
  uint64_t v6 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__HKHealthStore_authorizationStatusForType___block_invoke_392;
  v15[3] = &unk_1E58BBD88;
  id v7 = v6;
  id v16 = v7;
  uint64_t v8 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HKHealthStore_authorizationStatusForType___block_invoke_2;
  v13[3] = &unk_1E58BDD18;
  id v9 = v7;
  id v14 = v9;
  objc_msgSend(v8, "remote_authorizationStatusForType:completion:", v5, v13);
  HKAuthorizationStatus v10 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __44__HKHealthStore_authorizationStatusForType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 integerValue];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR)) {
      __44__HKHealthStore_authorizationStatusForType___block_invoke_cold_1();
    }
  }
}

uint64_t __44__HKHealthStore_authorizationStatusForType___block_invoke_392(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__HKHealthStore_authorizationStatusForType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRequestStatusForAuthorizationToShareTypes:(NSSet *)typesToShare readTypes:(NSSet *)typesToRead completion:(void *)completion
{
  uint64_t v8 = typesToShare;
  id v9 = typesToRead;
  HKAuthorizationStatus v10 = completion;
  [(HKHealthStore *)self _validateAuthorizationRequestWithShareTypes:v8 readTypes:v9];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke;
  aBlock[3] = &unk_1E58BDD68;
  void aBlock[4] = self;
  id v22 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_3;
  v17[3] = &unk_1E58BDC78;
  uint64_t v18 = v8;
  id v19 = v9;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_4;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v17 errorHandler:v15];
}

void __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_2;
  block[3] = &unk_1E58BDD40;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[4]);
  }
  return result;
}

uint64_t __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_3(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_getRequestStatusForAuthorizationToShareTypes:readTypes:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationToShareTypes:(NSSet *)typesToShare readTypes:(NSSet *)typesToRead completion:(void *)completion
{
}

- (void)requestPerObjectReadAuthorizationForType:(HKObjectType *)objectType predicate:(NSPredicate *)predicate completion:(void *)completion
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objectType;
  id v9 = predicate;
  id v10 = completion;
  _HKInitializeLogging();
  uint64_t v11 = HKLogAuthorization;
  if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v8;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "Requesting per-object authorization to read %@", buf, 0xCu);
  }
  [(HKHealthStore *)self _throwIfPerObjectReadAuthorizationNotSupportedForType:v8];
  id v12 = +[_HKBehavior sharedBehavior];
  int v13 = [v12 isAppleWatch];

  if (v13)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2, @"Per-object authorization presentation is not supported on this device");
    v10[2](v10, 0, v14);
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke;
    v26[3] = &unk_1E58BDCC8;
    id v15 = v8;
    uint64_t v27 = v15;
    id v28 = self;
    id v29 = v10;
    id v16 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v26];
    id v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
    uint64_t v18 = [(NSPredicate *)v9 hk_filterRepresentationForDataTypes:v17];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_398;
    v22[3] = &unk_1E58BDC78;
    id v23 = v15;
    id v24 = v18;
    id v25 = v16;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_2;
    v20[3] = &unk_1E58BBD88;
    id v10 = (void (**)(id, void, void *))v25;
    id v21 = v10;
    id v19 = v18;
    [(HKHealthStore *)self _serverProxyWithHandler:v22 errorHandler:v20];

    id v14 = v27;
  }
}

void __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogAuthorization;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      int v17 = 138412290;
      uint64_t v18 = v7;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Finished authorization request to read %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
  {
    __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_cold_1((uint64_t)a1, v6, v8, v9, v10, v11, v12, v13);
  }
  [*(id *)(a1[5] + 88) cancelPresentation];
  uint64_t v14 = a1[5];
  id v15 = *(void **)(v14 + 88);
  *(void *)(v14 + 88) = 0;

  uint64_t v16 = a1[6];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

uint64_t __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_398(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestPerObjectReadAuthorizationForType:filter:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_validateAuthorizationRequestWithShareTypes:(id)a3 readTypes:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  if (![v6 count] && !objc_msgSend(v7, "count")) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must request authorization for at least one data type"];
  }
  [(HKHealthStore *)self _throwIfClinicalTypesRequestedToShare:v6];
  [(HKHealthStore *)self _throwIfParentTypeNotRequestedForSharing:1 types:v6];
  [(HKHealthStore *)self _throwIfParentTypeNotRequestedForSharing:0 types:v7];
  [(HKHealthStore *)self _throwIfAuthorizationDisallowedForSharing:1 types:v6];

  [(HKHealthStore *)self _throwIfAuthorizationDisallowedForSharing:0 types:v7];
  [(HKHealthStore *)self _throwIfUsingIncorrectAuthorizationRequestType:v7];
  [(HKHealthStore *)self _validateAuthorizationRequiredTypes];
}

- (void)requestAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 shouldPrompt:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  _HKInitializeLogging();
  uint64_t v13 = (void *)HKLogAuthorization;
  if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      uint64_t v14 = "prompting";
    }
    else {
      uint64_t v14 = "silent";
    }
    id v15 = v13;
    uint64_t v16 = [v10 allObjects];
    int v17 = [v11 allObjects];
    *(_DWORD *)buf = 136315650;
    id v38 = v14;
    __int16 v39 = 2112;
    long long v40 = v16;
    __int16 v41 = 2112;
    long long v42 = v17;
    _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "Requesting %s authorization to share %@, read %@", buf, 0x20u);
  }
  [(HKHealthStore *)self _validateAuthorizationRequestWithShareTypes:v10 readTypes:v11];
  [(HKHealthStore *)self _validatePurposeStringsForSharingTypes:v10 readingTypes:v11];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke;
  v31[3] = &unk_1E58BDD90;
  BOOL v36 = v7;
  id v18 = v10;
  id v32 = v18;
  id v19 = v11;
  id v33 = v19;
  id v34 = self;
  id v35 = v12;
  id v20 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v31];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_404;
  v26[3] = &unk_1E58BDDB8;
  id v27 = v18;
  id v28 = v19;
  BOOL v30 = v7;
  id v29 = v20;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2;
  v24[3] = &unk_1E58BBD88;
  id v25 = v29;
  id v21 = v29;
  id v22 = v19;
  id v23 = v18;
  [(HKHealthStore *)self _serverProxyWithHandler:v26 errorHandler:v24];
}

void __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)HKLogAuthorization;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 64)) {
        BOOL v7 = "prompting";
      }
      else {
        BOOL v7 = "silent";
      }
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = v6;
      id v10 = [v8 allObjects];
      id v11 = [*(id *)(a1 + 40) allObjects];
      int v15 = 136315650;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "Finished %s authorization request to share %@, read %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
  {
    __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_cold_1(a1, v6, v5);
  }
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(*(void *)(a1 + 48) + 88) cancelPresentation];
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void **)(v12 + 88);
    *(void *)(v12 + 88) = 0;
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
}

uint64_t __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_404(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

uint64_t __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_validateAuthorizationRequiredTypes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = +[HKClinicalType allTypes];
  uint64_t v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_408);

  id v5 = [(HKHealthStore *)self _sourceBundleOrDefaultBundle];
  id v6 = [v5 objectForInfoDictionaryKey:@"NSHealthRequiredReadAuthorizationTypeIdentifiers"];

  if ([v6 count] && (unint64_t)objc_msgSend(v6, "count") < 3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Apps that specify required read authorization types (NSHealthRequiredReadAuthorizationTypeIdentifiers) must specify at least three clinical record types."];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (([v4 containsObject:v13] & 1) == 0)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
          int v15 = [v4 componentsJoinedByString:@", "];
          [v14 raise:v11, @"%@ is not a valid required clinical record type. Must be one of: %@", v13, v15, (void)v16 format];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __52__HKHealthStore__validateAuthorizationRequiredTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_validatePurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  uint64_t v8 = +[_HKEntitlements entitlementsForCurrentTaskWithError:&v17];
  id v9 = v17;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore _validatePurposeStringsForSharingTypes:readingTypes:]();
    }
  }
  char v10 = [v8 hasEntitlement:@"com.apple.private.healthkit.authorization_bypass"];
  uint64_t v11 = [v8 typesForWriteAuthorizationOverride];
  uint64_t v12 = [v11 count];

  uint64_t v13 = [v8 typesForReadAuthorizationOverride];
  uint64_t v14 = [v13 count];

  uint64_t v15 = [v8 hasEntitlement:@"com.apple.private.healthkit.source.research-study"];
  if ((v10 & 1) == 0 && !v12 && !v14)
  {
    uint64_t v16 = v15;
    [(HKHealthStore *)self _validateClinicalHealthRecordsPurposeStringsForSharingTypes:v6 readingTypes:v7];
    [(HKHealthStore *)self _validateHealthDataPurposeStringsForSharingTypes:v6 readingTypes:v7 isResearchStudy:v16];
  }
}

- (id)_clientWriteAuthorizationUsageDescription
{
  writeAuthorizationUsageDescriptionOverride = self->_writeAuthorizationUsageDescriptionOverride;
  if (writeAuthorizationUsageDescriptionOverride)
  {
    id v3 = writeAuthorizationUsageDescriptionOverride;
  }
  else
  {
    uint64_t v4 = [(HKHealthStore *)self _sourceBundleOrDefaultBundle];
    objc_msgSend(v4, "hk_localizedWriteAuthorizationUsageDescription");
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_clientReadAuthorizationUsageDescription
{
  readAuthorizationUsageDescriptionOverride = self->_readAuthorizationUsageDescriptionOverride;
  if (readAuthorizationUsageDescriptionOverride)
  {
    id v3 = readAuthorizationUsageDescriptionOverride;
  }
  else
  {
    uint64_t v4 = [(HKHealthStore *)self _sourceBundleOrDefaultBundle];
    objc_msgSend(v4, "hk_localizedReadAuthorizationUsageDescription");
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_clientClinicalReadAuthorizationUsageDescription
{
  clinicalReadAuthorizationUsageDescriptionOverride = self->_clinicalReadAuthorizationUsageDescriptionOverride;
  if (clinicalReadAuthorizationUsageDescriptionOverride)
  {
    id v3 = clinicalReadAuthorizationUsageDescriptionOverride;
  }
  else
  {
    uint64_t v4 = [(HKHealthStore *)self _sourceBundleOrDefaultBundle];
    objc_msgSend(v4, "hk_localizedClinicalReadAuthorizationUsageDescription");
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_researchStudyUsageDescription
{
  researchStudyUsageDescriptionOverride = self->_researchStudyUsageDescriptionOverride;
  if (researchStudyUsageDescriptionOverride)
  {
    id v3 = researchStudyUsageDescriptionOverride;
  }
  else
  {
    uint64_t v4 = [(HKHealthStore *)self _sourceBundleOrDefaultBundle];
    objc_msgSend(v4, "hk_localizedResearchStudyUsageDescription");
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_validateClinicalHealthRecordsPurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4
{
  id v10 = +[HKObjectType _clinicalTypesFromTypes:a4];
  id v5 = [(HKHealthStore *)self _clientClinicalReadAuthorizationUsageDescription];

  if (!v5 && [v10 count])
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = [v10 allObjects];
    id v9 = [v8 componentsJoinedByString:@", "];
    [v6 raise:v7, @"NSHealthClinicalHealthRecordsShareUsageDescription must be set in the app's Info.plist in order to request read authorization for the following types: %@", v9 format];
  }
}

- (void)_validateHealthDataPurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4 isResearchStudy:(BOOL)a5
{
  BOOL v5 = a5;
  id v23 = a3;
  id v8 = a4;
  if (HKProgramSDKAtLeast())
  {
    id v9 = +[_HKBehavior sharedBehavior];
    if ([v9 isAppleWatch])
    {
      char v10 = HKProgramSDKAtLeast();

      if ((v10 & 1) == 0) {
        goto LABEL_27;
      }
      if (!v5) {
        goto LABEL_12;
      }
    }
    else
    {

      if (!v5) {
        goto LABEL_12;
      }
    }
    uint64_t v11 = [(HKHealthStore *)self _researchStudyUsageDescription];
    if (objc_msgSend(v11, "hk_isValidPurposeString"))
    {
      uint64_t v12 = v8;
      uint64_t v13 = v23;
      goto LABEL_25;
    }
    if (v11) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The string \"%@\" is an invalid value for NSHealthResearchStudyUsageDescription", v11 format];
    }

LABEL_12:
    uint64_t v13 = +[HKObjectType _nonClinicalTypesFromTypes:v23];

    if ([v13 count])
    {
      uint64_t v14 = [(HKHealthStore *)self _clientWriteAuthorizationUsageDescription];
      if (!v14)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        id v17 = [v13 allObjects];
        long long v18 = [v17 componentsJoinedByString:@", "];
        [v15 raise:v16, @"NSHealthUpdateUsageDescription must be set in the app's Info.plist in order to request write authorization for the following types: %@", v18 format];
      }
      if (HKProgramSDKAtLeast() && (objc_msgSend(v14, "hk_isValidPurposeString") & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The string \"%@\" is an invalid value for NSHealthUpdateUsageDescription", v14 format];
      }
    }
    uint64_t v12 = +[HKObjectType _nonClinicalTypesFromTypes:v8];

    if (![v12 count]) {
      goto LABEL_26;
    }
    uint64_t v11 = [(HKHealthStore *)self _clientReadAuthorizationUsageDescription];
    if (!v11)
    {
      long long v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      uint64_t v21 = [v12 allObjects];
      id v22 = [v21 componentsJoinedByString:@", "];
      [v19 raise:v20, @"NSHealthShareUsageDescription must be set in the app's Info.plist in order to request read authorization for the following types: %@", v22 format];
    }
    if (HKProgramSDKAtLeast() && (objc_msgSend(v11, "hk_isValidPurposeString") & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The string \"%@\" is an invalid value for NSHealthShareUsageDescription", v11 format];
    }
LABEL_25:

LABEL_26:
    id v8 = v12;
    id v23 = v13;
  }
LABEL_27:
}

- (void)handleAuthorizationForExtensionWithCompletion:(void *)completion
{
  uint64_t v4 = completion;
  _HKInitializeLogging();
  BOOL v5 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "Handling authorization for extension", buf, 2u);
  }
  id v6 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke;
  v10[3] = &unk_1E58BDC50;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke_2;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKHealthStore *)self _serverProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_handleAuthorizationForExtensionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_throwIfAuthorizationDisallowedForSharing:(BOOL)a3 types:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v19 = 0;
    id v7 = +[_HKEntitlements entitlementsForCurrentTaskWithError:&v19];
    id v8 = v19;
    if (!v7)
    {
      id v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      if (v4) {
        id v11 = "share";
      }
      else {
        id v11 = "read";
      }
      uint64_t v12 = [v6 allObjects];
      uint64_t v13 = [v12 componentsJoinedByString:@", "];
      [v9 raise:v10, @"Failed to retrieve local task entitlements when determining authorization access for %s for %@ : %@", v11, v13, v8 format];
    }
    if (v4)
    {
      if (!+[HKObjectType _allowAuthorizationForSharingWithTypes:v5 entitlements:v7 disallowedTypes:v6])
      {
        uint64_t v14 = "share";
LABEL_12:
        uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        id v17 = [v6 allObjects];
        long long v18 = [v17 componentsJoinedByString:@", "];
        [v15 raise:v16, @"Authorization to %s the following types is disallowed: %@", v14, v18 format];
      }
    }
    else if (!+[HKObjectType _allowAuthorizationForReadingWithTypes:v5 entitlements:v7 disallowedTypes:v6])
    {
      uint64_t v14 = "read";
      goto LABEL_12;
    }
  }
}

- (void)_throwIfClinicalTypesRequestedToShare:(id)a3
{
  id v7 = +[HKObjectType _clinicalTypesFromTypes:a3];
  if ([v7 count])
  {
    id v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    id v5 = [v7 allObjects];
    id v6 = [v5 componentsJoinedByString:@", "];
    [v3 raise:v4, @"Authorization to share the following types is disallowed: %@", v6 format];
  }
}

- (void)_throwIfParentTypeNotRequestedForSharing:(BOOL)a3 types:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    if (v4) {
      uint64_t v10 = "share";
    }
    else {
      uint64_t v10 = "read";
    }
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 parentType];
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = [v12 parentType];
          char v16 = [v5 containsObject:v15];

          if ((v16 & 1) == 0)
          {
            id v17 = (void *)MEMORY[0x1E4F1CA00];
            long long v18 = [v12 parentType];
            [v17 raise:v9, @"Authorization for %@ should also be requested when requesting authorization to %s %@", v18, v10, v12 format];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)_throwIfPerObjectReadAuthorizationNotSupportedForType:(id)a3
{
  id v3 = a3;
  if (!HKDataTypeAllowsPerObjectAuthorizationAPI([v3 code])) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Per-Object authorization to read %@ is disallowed", v3 format];
  }
}

- (void)_throwIfUsingIncorrectAuthorizationRequestType:(id)a3
{
  objc_msgSend(a3, "hk_filter:", &__block_literal_global_457);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 count])
  {
    id v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    id v5 = [v6 allObjects];
    [v3 raise:v4, @"Authorization to read the following type(s) using this API is disallowed: %@", v5 format];
  }
}

BOOL __64__HKHealthStore__throwIfUsingIncorrectAuthorizationRequestType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 code];

  return HKDataTypeAllowsPerObjectAuthorizationAPI(v2);
}

- (void)beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 sourceHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "sourceHandler");
    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "errorHandler");
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "sessionIdentifier");
  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke;
  block[3] = &unk_1E58BDE98;
  id v17 = v10;
  id v18 = v9;
  void block[4] = self;
  id v16 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(clientQueue, block);
}

void __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_2;
  aBlock[3] = &unk_1E58BDE48;
  void aBlock[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 56);
  id v5 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_4;
  v9[3] = &unk_1E58BDE70;
  id v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_5;
  v8[3] = &unk_1E58BBCC0;
  void v8[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v6 _serverProxyWithHandler:v9 errorHandler:v8];
}

void __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 216);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_3;
  v12[3] = &unk_1E58BDE20;
  id v13 = v6;
  uint64_t v14 = v7;
  id v9 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

uint64_t __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(*(id *)(a1 + 40), "_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:");
  }
  else {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48));
  }
}

uint64_t __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_beginAuthorizationDelegateTransactionWithSessionIdentifier:handler:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:", a2);
}

- (void)endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_2;
  v5[3] = &unk_1E58BDEC0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 _serverProxyWithHandler:v5 errorHandler:&__block_literal_global_465];
}

uint64_t __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endAuthorizationDelegateTransactionWithSessionIdentifier:error:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
    __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_3_cold_1();
  }
}

- (void)_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:(id)a3
{
  authorizationDelegateTransactionErrorHandler = (void (**)(id, id))self->_authorizationDelegateTransactionErrorHandler;
  if (authorizationDelegateTransactionErrorHandler)
  {
    authorizationDelegateTransactionErrorHandler[2](authorizationDelegateTransactionErrorHandler, a3);
    id v5 = self->_authorizationDelegateTransactionErrorHandler;
    self->_authorizationDelegateTransactionErrorHandler = 0;
  }
}

- (id)_clinicalAuthorizationPresentationRequestForRecord:(id)a3
{
  uint64_t v4 = [a3 typesRequiringReadAuthorization];
  id v5 = +[HKObjectType _clinicalTypesFromTypes:v4];

  if ([v5 count])
  {
    id v6 = objc_alloc_init(HKAuthorizationPresentationRequest);
    [(HKAuthorizationPresentationRequest *)v6 setType:0];
    id v7 = [(HKHealthStore *)self _clientClinicalReadAuthorizationUsageDescription];
    [(HKAuthorizationPresentationRequest *)v6 setReadUsageDescription:v7];

    id v8 = [(HKHealthStore *)self _researchStudyUsageDescription];
    [(HKAuthorizationPresentationRequest *)v6 setResearchStudyUsageDescription:v8];

    [(HKAuthorizationPresentationRequest *)v6 setTypesRequiringReadAuthorization:v5];
    [(HKAuthorizationPresentationRequest *)v6 setDismissWhenBackgrounded:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_healthDataAuthorizationPresentationRequestForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 typesRequiringReadAuthorization];
  id v6 = +[HKObjectType _nonClinicalTypesFromTypes:v5];

  id v7 = [v4 typesRequiringShareAuthorization];

  id v8 = +[HKObjectType _nonClinicalTypesFromTypes:v7];

  if ([v6 count] || objc_msgSend(v8, "count"))
  {
    id v9 = objc_alloc_init(HKAuthorizationPresentationRequest);
    [(HKAuthorizationPresentationRequest *)v9 setType:1];
    id v10 = [(HKHealthStore *)self _clientReadAuthorizationUsageDescription];
    [(HKAuthorizationPresentationRequest *)v9 setReadUsageDescription:v10];

    id v11 = [(HKHealthStore *)self _clientWriteAuthorizationUsageDescription];
    [(HKAuthorizationPresentationRequest *)v9 setShareUsageDescription:v11];

    id v12 = [(HKHealthStore *)self _researchStudyUsageDescription];
    [(HKAuthorizationPresentationRequest *)v9 setResearchStudyUsageDescription:v12];

    [(HKAuthorizationPresentationRequest *)v9 setTypesRequiringReadAuthorization:v6];
    [(HKAuthorizationPresentationRequest *)v9 setTypesRequiringShareAuthorization:v8];
    [(HKAuthorizationPresentationRequest *)v9 setDismissWhenBackgrounded:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)clientRemote_presentAuthorizationWithRequestRecord:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke;
  aBlock[3] = &unk_1E58BBD38;
  id v21 = v8;
  id v9 = _Block_copy(aBlock);
  if (v7)
  {
    id v10 = +[_HKBehavior sharedBehavior];
    char v11 = [v10 isAppleWatch];

    if (!_HKCurrentTaskIsAppExtension() || (v11 & 1) != 0)
    {
      clientQueue = self->_clientQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke_2;
      v17[3] = &unk_1E58BBA78;
      void v17[4] = self;
      id v18 = v7;
      id v19 = v9;
      dispatch_async(clientQueue, v17);

      goto LABEL_8;
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = @"Cannot present authorization prompt from a non-Watch app extension.";
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = @"Invalid authorization request record.";
  }
  id v15 = objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v13, a2, v14);
  (*((void (**)(void *, void, void *))v9 + 2))(v9, 0, v15);

LABEL_8:
}

uint64_t __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 88)
    || (_HKCreateAuthorizationPresentationController(),
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = *(void *)(a1 + 32),
        id v4 = *(void **)(v3 + 88),
        *(void *)(v3 + 88) = v2,
        v4,
        *(void *)(*(void *)(a1 + 32) + 88)))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [*(id *)(a1 + 32) _clinicalAuthorizationPresentationRequestForRecord:*(void *)(a1 + 40)];
    if (v5) {
      [v13 addObject:v5];
    }
    id v6 = [*(id *)(a1 + 32) _healthDataAuthorizationPresentationRequestForRecord:*(void *)(a1 + 40)];
    if (v6) {
      [v13 addObject:v6];
    }
    if ([v13 count])
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v7 + 88);
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 208));
      [v9 presentWithPresentationRequests:v13 authorizationRequestRecord:v8 authorizationViewControllerPresenter:WeakRetained completion:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id WeakRetained = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to create authorization presentation requests");
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, WeakRetained);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to create authorization presentation controller");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
  }
}

- (void)clientRemote_presentAuthorizationWithSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HKHealthStore_clientRemote_presentAuthorizationWithSession_completion___block_invoke;
  v12[3] = &unk_1E58BDEE8;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(clientQueue, v12);
}

uint64_t __73__HKHealthStore_clientRemote_presentAuthorizationWithSession_completion___block_invoke(void *a1)
{
  if (_HKCurrentTaskIsAppExtension())
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Cannot present document authorization prompt from app extension."");
  }
  else
  {
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 96);
    if (v5) {
      goto LABEL_8;
    }
    uint64_t v6 = _HKCreateObjectPickerPresentationController();
    uint64_t v7 = a1[4];
    id v8 = *(void **)(v7 + 96);
    *(void *)(v7 + 96) = v6;

    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 96);
    if (v5)
    {
LABEL_8:
      uint64_t v9 = a1[5];
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 208));
      [v5 presentWithSession:v9 authorizationViewControllerPresenter:WeakRetained completion:a1[6]];

      goto LABEL_10;
    }
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to create document authorization presentation controller");
  }
  uint64_t v3 = a1[6];
  if (v3)
  {
    if (v2)
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
    else
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unknown error");
      (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v11);
    }
  }
LABEL_10:

  return MEMORY[0x1F4181820]();
}

- (NSDate)earliestPermittedSampleDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] distantPast];
}

- (void)saveObject:(HKObject *)object withCompletion:(void *)completion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = object;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v7 = completion;
  id v8 = object;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[HKHealthStore saveObjects:withCompletion:](self, "saveObjects:withCompletion:", v9, v7, v10, v11);
}

- (void)saveObjects:(NSArray *)objects withCompletion:(void *)completion
{
  uint64_t v6 = completion;
  uint64_t v7 = objects;
  [(HKHealthStore *)self _saveObjects:v7 atomically:[(NSArray *)v7 count] < 0x5DC skipInsertionFilter:0 completion:v6];
}

- (void)_saveObjects:(id)a3 atomically:(BOOL)a4 skipInsertionFilter:(BOOL)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  _HKInitializeLogging();
  uint64_t v12 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = [v10 count];
    _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "Saving %lu objects", buf, 0xCu);
  }
  id v14 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v11];

  id v25 = 0;
  BOOL v15 = [(HKHealthStore *)self _prepareObjectsForSaving:v10 errorOut:&v25];
  id v16 = v25;
  if (v15)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke;
    v19[3] = &unk_1E58BDF10;
    BOOL v23 = a4;
    id v20 = v10;
    BOOL v24 = a5;
    id v21 = self;
    long long v22 = v14;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke_2;
    v17[3] = &unk_1E58BBD88;
    id v18 = v22;
    [(HKHealthStore *)self _serverProxyWithHandler:v19 errorHandler:v17];
  }
  else
  {
    ((void (**)(void, void, id))v14)[2](v14, 0, v16);
  }
}

uint64_t __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 56)) {
    return objc_msgSend(*(id *)(a1 + 40), "_sendNextObjectBatch:skipInsertionFilter:lastRange:server:transaction:completion:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 57), 0, 0, a2, 0, *(void *)(a1 + 48));
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v4 = *(void *)(a1 + 48);

  return objc_msgSend(a2, "remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:", v2, v3, 0, v4);
}

uint64_t __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveObjects:(id)a3 skipInsertionFilter:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  -[HKHealthStore _saveObjects:atomically:skipInsertionFilter:completion:](self, "_saveObjects:atomically:skipInsertionFilter:completion:", v9, (unint64_t)[v9 count] < 0x5DC, v5, v8);
}

- (void)_sendNextObjectBatch:(id)a3 skipInsertionFilter:(BOOL)a4 lastRange:(_NSRange)a5 server:(id)a6 transaction:(id)a7 completion:(id)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  uint64_t v18 = [v14 count];
  uint64_t v19 = v18;
  NSUInteger v20 = location + length;
  if (v18 - v20 >= 0x5DC) {
    uint64_t v21 = 1500;
  }
  else {
    uint64_t v21 = v18 - v20;
  }
  long long v22 = objc_msgSend(v14, "subarrayWithRange:", v20, v21);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__HKHealthStore__sendNextObjectBatch_skipInsertionFilter_lastRange_server_transaction_completion___block_invoke;
  v27[3] = &unk_1E58BDF38;
  BOOL v23 = v21 + v20 == v19;
  v27[4] = self;
  id v28 = v14;
  BOOL v33 = v12;
  BOOL v34 = v23;
  NSUInteger v31 = v20;
  uint64_t v32 = v21;
  id v29 = v15;
  id v30 = v16;
  id v24 = v15;
  id v25 = v16;
  id v26 = v14;
  objc_msgSend(v24, "remote_saveDataObjects:skipInsertionFilter:transactionIdentifier:final:handler:", v22, v12, v17, v23, v27);
}

void __98__HKHealthStore__sendNextObjectBatch_skipInsertionFilter_lastRange_server_transaction_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v8 = a2;
  id v7 = a4;
  if (a3)
  {
    [*(id *)(a1 + 32) _saveObjects:*(void *)(a1 + 40) atomically:1 skipInsertionFilter:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 56)];
  }
  else if (v8 && !*(unsigned char *)(a1 + 81))
  {
    [*(id *)(a1 + 32) _sendNextObjectBatch:*(void *)(a1 + 40) skipInsertionFilter:*(unsigned __int8 *)(a1 + 80) lastRange:*(void *)(a1 + 64) server:*(void *)(a1 + 72) transaction:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void, BOOL, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7 == 0, v7);
  }
}

- (void)deleteObject:(HKObject *)object withCompletion:(void *)completion
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = object;
  id v7 = completion;
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "dataObject");
  }
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(HKHealthStore *)self _deleteObjects:v8 options:0 completion:v7];
}

- (void)deleteObjects:(NSArray *)objects withCompletion:(void *)completion
{
}

- (void)_deleteObjects:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  id v10 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 134218240;
    uint64_t v22 = [v8 count];
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "Deleting %lu objects, options %lu", buf, 0x16u);
  }
  BOOL v12 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__HKHealthStore__deleteObjects_options_completion___block_invoke;
  v17[3] = &unk_1E58BDC28;
  id v18 = v8;
  unint64_t v20 = a4;
  id v19 = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HKHealthStore__deleteObjects_options_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __51__HKHealthStore__deleteObjects_options_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDataObjects:options:handler:", a1[4], a1[6], a1[5]);
}

uint64_t __51__HKHealthStore__deleteObjects_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteObjectsOfType:(HKObjectType *)objectType predicate:(NSPredicate *)predicate withCompletion:(void *)completion
{
}

- (void)deleteObject:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v12 count:1];

  -[HKHealthStore _deleteObjects:options:completion:](self, "_deleteObjects:options:completion:", v11, a4, v9, v12, v13);
}

- (void)deleteObjectsOfType:(id)a3 predicate:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  _HKInitializeLogging();
  uint64_t v13 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v10;
    __int16 v29 = 2048;
    unint64_t v30 = a5;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "Deleting objects of type %@ with options %lu, predicate %@", buf, 0x20u);
  }
  if (HKProgramSDKAtLeast())
  {
    if (v10)
    {
      if (v11) {
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "objectType");
      if (v11) {
        goto LABEL_6;
      }
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "predicate");
  }
LABEL_6:
  id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
  id v15 = objc_msgSend(v11, "hk_filterRepresentationForDataTypes:", v14);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke;
  v21[3] = &unk_1E58BDFB0;
  id v22 = v10;
  id v23 = v15;
  unint64_t v26 = a5;
  unint64_t v24 = self;
  id v25 = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_4;
  v19[3] = &unk_1E58BBC48;
  void v19[4] = self;
  id v20 = v25;
  id v16 = v25;
  id v17 = v15;
  id v18 = v10;
  [(HKHealthStore *)self _serverProxyWithHandler:v21 errorHandler:v19];
}

void __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_2;
  v7[3] = &unk_1E58BDF88;
  BOOL v5 = (void *)a1[7];
  uint64_t v6 = a1[8];
  v7[4] = a1[6];
  id v8 = v5;
  objc_msgSend(a2, "remote_deleteDataObjectsOfType:matchingFilter:options:handler:", v3, v4, v6, v7);
}

void __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_2(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_3;
  v11[3] = &unk_1E58BDF60;
  id v9 = *(id *)(a1 + 40);
  char v15 = a2;
  id v13 = v9;
  uint64_t v14 = a3;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v8, v11);
}

uint64_t __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_5;
  v7[3] = &unk_1E58BBF10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_addQuery:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  queries = self->_queries;
  if (!queries)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    id v6 = self->_queries;
    self->_queries = v5;

    queries = self->_queries;
  }
  [(NSMutableSet *)queries addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removeQuery:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_queries removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)executeQuery:(HKQuery *)query
{
}

- (void)executeQuery:(id)a3 activationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "query");
  }
  double Current = CFAbsoluteTimeGetCurrent();
  unitTest_handleExecuteQuery = (void (**)(id, id))self->_unitTest_handleExecuteQuery;
  if (unitTest_handleExecuteQuery) {
    unitTest_handleExecuteQuery[2](unitTest_handleExecuteQuery, v6);
  }
  [(HKHealthStore *)self _addQuery:v6];
  clientQueue = self->_clientQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__HKHealthStore_executeQuery_activationHandler___block_invoke;
  v13[3] = &unk_1E58BDCC8;
  void v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v11 activateWithClientQueue:clientQueue healthStore:self delegate:self time:v13 completion:Current];
}

uint64_t __48__HKHealthStore_executeQuery_activationHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _removeQuery:*(void *)(a1 + 40)];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }

  return MEMORY[0x1F4181820]();
}

- (void)stopQuery:(HKQuery *)query
{
  if (query)
  {
    uint64_t v4 = query;
    [(HKHealthStore *)self _removeQuery:v4];
    [(HKQuery *)v4 deactivate];
  }
}

- (NSSet)_queries
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_queries copy];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v6 = v5;

  return (NSSet *)v6;
}

- (void)_dateOfBirthWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierDateOfBirth"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HKHealthStore__dateOfBirthWithCompletion___block_invoke;
  v7[3] = &unk_1E58BDFD8;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)self _characteristicForDataType:v5 withCompletion:v7];
}

uint64_t __44__HKHealthStore__dateOfBirthWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDate)dateOfBirthWithError:(NSError *)error
{
  id v3 = [(HKHealthStore *)self dateOfBirthComponentsWithError:error];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    id v5 = [v4 dateFromComponents:v3];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSDateComponents)dateOfBirthComponentsWithError:(NSError *)error
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierDateOfBirth"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:error];

  return (NSDateComponents *)v6;
}

- (BOOL)_setDateOfBirthComponents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierDateOfBirth"];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v6 forDataType:v7 error:a4];

  return (char)a4;
}

- (void)_biologicalSexWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBiologicalSex"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HKHealthStore__biologicalSexWithCompletion___block_invoke;
  v7[3] = &unk_1E58BDD18;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)self _characteristicForDataType:v5 withCompletion:v7];
}

void __46__HKHealthStore__biologicalSexWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    if (v8) {
      uint64_t v7 = [v8 integerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    id v6 = [[HKBiologicalSexObject alloc] _initWithBiologicalSex:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKBiologicalSexObject)biologicalSexWithError:(NSError *)error
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBiologicalSex"];
  id v13 = 0;
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (error)
    {
      id v10 = 0;
      *error = (NSError *)v9;
    }
    else
    {
      _HKLogDroppedError(v9);
      id v10 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = [v6 integerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    id v10 = [[HKBiologicalSexObject alloc] _initWithBiologicalSex:v11];
  }

  return (HKBiologicalSexObject *)v10;
}

- (BOOL)_setBiologicalSex:(int64_t)a3 error:(id *)a4
{
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBiologicalSex"];
  id v8 = [NSNumber numberWithInteger:a3];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v8 forDataType:v7 error:a4];

  return (char)a4;
}

- (void)_bloodTypeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBloodType"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HKHealthStore__bloodTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E58BDD18;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)self _characteristicForDataType:v5 withCompletion:v7];
}

void __42__HKHealthStore__bloodTypeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    if (v8) {
      uint64_t v7 = [v8 integerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    id v6 = [[HKBloodTypeObject alloc] _initWithBloodType:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKBloodTypeObject)bloodTypeWithError:(NSError *)error
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBloodType"];
  id v13 = 0;
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (error)
    {
      id v10 = 0;
      *error = (NSError *)v9;
    }
    else
    {
      _HKLogDroppedError(v9);
      id v10 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = [v6 integerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    id v10 = [[HKBloodTypeObject alloc] _initWithBloodType:v11];
  }

  return (HKBloodTypeObject *)v10;
}

- (BOOL)_setBloodType:(int64_t)a3 error:(id *)a4
{
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBloodType"];
  id v8 = [NSNumber numberWithInteger:a3];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v8 forDataType:v7 error:a4];

  return (char)a4;
}

- (void)_fitzpatrickSkinTypeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierFitzpatrickSkinType"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HKHealthStore__fitzpatrickSkinTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E58BDD18;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)self _characteristicForDataType:v5 withCompletion:v7];
}

void __52__HKHealthStore__fitzpatrickSkinTypeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    if (v8) {
      uint64_t v7 = [v8 integerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    id v6 = [[HKFitzpatrickSkinTypeObject alloc] _initWithSkinType:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKFitzpatrickSkinTypeObject)fitzpatrickSkinTypeWithError:(NSError *)error
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierFitzpatrickSkinType"];
  id v13 = 0;
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (error)
    {
      id v10 = 0;
      *error = (NSError *)v9;
    }
    else
    {
      _HKLogDroppedError(v9);
      id v10 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = [v6 integerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    id v10 = [[HKFitzpatrickSkinTypeObject alloc] _initWithSkinType:v11];
  }

  return (HKFitzpatrickSkinTypeObject *)v10;
}

- (BOOL)_setFitzpatrickSkinType:(int64_t)a3 error:(id *)a4
{
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierFitzpatrickSkinType"];
  id v8 = [NSNumber numberWithInteger:a3];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v8 forDataType:v7 error:a4];

  return (char)a4;
}

- (void)_wheelchairUseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierWheelchairUse"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HKHealthStore__wheelchairUseWithCompletion___block_invoke;
  v7[3] = &unk_1E58BDD18;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)self _characteristicForDataType:v5 withCompletion:v7];
}

void __46__HKHealthStore__wheelchairUseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    if (v8) {
      uint64_t v7 = [v8 integerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    id v6 = [[HKWheelchairUseObject alloc] _initWithWheelchairUse:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKWheelchairUseObject)wheelchairUseWithError:(NSError *)error
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierWheelchairUse"];
  id v13 = 0;
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (error)
    {
      id v10 = 0;
      *error = (NSError *)v9;
    }
    else
    {
      _HKLogDroppedError(v9);
      id v10 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = [v6 integerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    id v10 = [[HKWheelchairUseObject alloc] _initWithWheelchairUse:v11];
  }

  return (HKWheelchairUseObject *)v10;
}

- (BOOL)_setWheelchairUse:(int64_t)a3 error:(id *)a4
{
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierWheelchairUse"];
  id v8 = [NSNumber numberWithInteger:a3];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v8 forDataType:v7 error:a4];

  return (char)a4;
}

- (id)_cardioFitnessMedicationsUseWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"];
  id v13 = 0;
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (a3)
    {
      id v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError(v9);
      id v10 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = [v6 unsignedIntValue];
    }
    else {
      uint64_t v11 = 0;
    }
    id v10 = [[HKCardioFitnessMedicationsUseObject alloc] _initWithCardioFitnessMedicationsUseOptions:v11];
  }

  return v10;
}

- (BOOL)_setCardioFitnessMedicationsUse:(unint64_t)a3 error:(id *)a4
{
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v8 forDataType:v7 error:a4];

  return (char)a4;
}

- (id)_bodyMassCharacteristicQuantityWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBodyMass"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:a3];

  return v6;
}

- (BOOL)_setBodyMassCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBodyMass"];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v6 forDataType:v7 error:a4];

  return (char)a4;
}

- (id)_leanBodyMassCharacteristicQuantityWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierLeanBodyMass"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:a3];

  return v6;
}

- (BOOL)_setLeanBodyMassCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierLeanBodyMass"];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v6 forDataType:v7 error:a4];

  return (char)a4;
}

- (id)_heightCharacteristicQuantityWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierHeight"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:a3];

  return v6;
}

- (BOOL)_setHeightCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierHeight"];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v6 forDataType:v7 error:a4];

  return (char)a4;
}

- (id)_userEnteredMenstrualCycleLengthCharacteristicQuantityWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierUserEnteredMenstrualCycleLength"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:a3];

  return v6;
}

- (BOOL)_setUserEnteredMenstrualCycleLengthCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierUserEnteredMenstrualCycleLength"];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v6 forDataType:v7 error:a4];

  return (char)a4;
}

- (id)_userEnteredMenstrualPeriodLengthCharacteristicQuantityWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierUserEnteredMenstrualPeriodLength"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:a3];

  return v6;
}

- (BOOL)_setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierUserEnteredMenstrualPeriodLength"];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v6 forDataType:v7 error:a4];

  return (char)a4;
}

- (void)_activityMoveModeObjectWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierActivityMoveMode"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HKHealthStore__activityMoveModeObjectWithCompletion___block_invoke;
  v7[3] = &unk_1E58BDD18;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)self _characteristicForDataType:v5 withCompletion:v7];
}

void __55__HKHealthStore__activityMoveModeObjectWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    if (v8) {
      uint64_t v7 = [v8 integerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    id v6 = [[HKActivityMoveModeObject alloc] _initWithActivityMoveMode:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKActivityMoveModeObject)activityMoveModeWithError:(NSError *)error
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierActivityMoveMode"];
  id v13 = 0;
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (error)
    {
      id v10 = 0;
      *error = (NSError *)v9;
    }
    else
    {
      _HKLogDroppedError(v9);
      id v10 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v11 = [v6 integerValue];
    }
    else {
      uint64_t v11 = 1;
    }
    id v10 = [[HKActivityMoveModeObject alloc] _initWithActivityMoveMode:v11];
  }

  return (HKActivityMoveModeObject *)v10;
}

- (id)_activityMoveModeWithError:(id *)a3
{
  id v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierActivityMoveMode"];
  id v6 = [(HKHealthStore *)self _characteristicForDataType:v5 error:a3];

  return v6;
}

- (BOOL)_setActivityMoveMode:(int64_t)a3 error:(id *)a4
{
  id v7 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierActivityMoveMode"];
  id v8 = [NSNumber numberWithInteger:a3];
  LOBYTE(a4) = [(HKHealthStore *)self _setCharacteristic:v8 forDataType:v7 error:a4];

  return (char)a4;
}

- (void)_characteristicForDataType:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = NSStringFromSelector(a2);
    [v9 raise:v10, @"%@: Invalid data type %@, expected data type of class %@ in %@", v11, v7, v12, v13 format];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke;
  v18[3] = &unk_1E58BDE70;
  id v19 = v7;
  id v20 = v8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke_2;
  v16[3] = &unk_1E58BBD88;
  id v17 = v20;
  id v14 = v20;
  id v15 = v7;
  [(HKHealthStore *)self _serverProxyWithHandler:v18 errorHandler:v16];
}

uint64_t __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCharacteristicWithDataType:handler:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_characteristicForDataType:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(a2);
    [v8 raise:v9, @"%@: Invalid data type %@, expected data type of class %@ in %@", v10, v7, v11, v12 format];
  }
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__3;
  BOOL v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  id v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HKHealthStore__characteristicForDataType_error___block_invoke;
  aBlock[3] = &unk_1E58BE000;
  void aBlock[4] = &v30;
  void aBlock[5] = &v24;
  id v13 = _Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__HKHealthStore__characteristicForDataType_error___block_invoke_2;
  v21[3] = &unk_1E58BBD88;
  id v14 = v13;
  id v22 = v14;
  id v15 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v21];
  objc_msgSend(v15, "remote_fetchCharacteristicWithDataType:handler:", v7, v14);
  id v16 = (void *)v31[5];
  if (!v16)
  {
    id v17 = (id)v25[5];
    id v18 = v17;
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
      else {
        _HKLogDroppedError(v17);
      }
    }

    id v16 = (void *)v31[5];
  }
  id v19 = v16;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __50__HKHealthStore__characteristicForDataType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __50__HKHealthStore__characteristicForDataType_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_setCharacteristic:(id)a3 forDataType:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = NSStringFromSelector(a2);
    [v11 raise:v12, @"%@: Invalid data type %@, expected data type of class %@ in %@", v13, v10, v14, v15 format];
  }
  if ([v10 _validateCharacteristic:v9 error:a5])
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__3;
    __int16 v31 = __Block_byref_object_dispose__3;
    id v32 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke;
    v22[3] = &unk_1E58BE028;
    void v22[4] = &v27;
    v22[5] = &v23;
    id v16 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke_2;
    v21[3] = &unk_1E58BE050;
    void v21[4] = &v23;
    v21[5] = &v27;
    objc_msgSend(v16, "remote_setCharacteristic:forDataType:handler:", v9, v10, v21);
    id v17 = (id)v28[5];
    id v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError(v17);
      }
    }

    BOOL v19 = *((unsigned char *)v24 + 24) != 0;
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

void __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)_modificationDateForCharacteristicWithType:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(a2);
    [v8 raise:v9, @"%@: Invalid data type %@, expected data type of class %@ in %@", v10, v7, v11, v12 format];
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__3;
  uint64_t v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke;
  v19[3] = &unk_1E58BE028;
  void v19[4] = &v26;
  void v19[5] = &v20;
  uint64_t v13 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke_2;
  v18[3] = &unk_1E58BE078;
  void v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v13, "remote_fetchModificationDateForCharacteristicWithDataType:handler:", v7, v18);
  id v14 = (id)v27[5];
  id v15 = v14;
  if (v14)
  {
    if (a4) {
      *a4 = v14;
    }
    else {
      _HKLogDroppedError(v14);
    }
  }

  id v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);

  return v16;
}

void __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)supportsHealthRecords
{
  return [(HKHealthStore *)self _supportsFeature:1];
}

- (BOOL)_supportsFeature:(unint64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__HKHealthStore__supportsFeature___block_invoke;
  v7[3] = &unk_1E58BE0A0;
  void v7[4] = &v8;
  void v7[5] = a3;
  uint64_t v4 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HKHealthStore__supportsFeature___block_invoke_512;
  v6[3] = &unk_1E58BE0C8;
  void v6[4] = &v8;
  void v6[5] = v3;
  objc_msgSend(v4, "remote_getIsFeatureSetAvailable:completion:", v3, v6);
  LOBYTE(v3) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v3;
}

void __34__HKHealthStore__supportsFeature___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    __34__HKHealthStore__supportsFeature___block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __34__HKHealthStore__supportsFeature___block_invoke_512(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 1;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      __34__HKHealthStore__supportsFeature___block_invoke_cold_1();
    }
  }
}

- (void)addSamples:(NSArray *)samples toWorkout:(HKWorkout *)workout completion:(void *)completion
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = samples;
  uint64_t v9 = workout;
  uint64_t v10 = completion;
  _HKInitializeLogging();
  char v11 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [(NSArray *)v8 count];
    id v14 = [(HKObject *)v9 UUID];
    id v15 = [v14 UUIDString];
    *(_DWORD *)buf = 134218242;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    uint64_t v29 = v15;
    _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "Adding %lu samples to workout %{public}@", buf, 0x16u);
  }
  id v16 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v10];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke;
  v22[3] = &unk_1E58BDC78;
  uint64_t v23 = v8;
  uint64_t v24 = v9;
  id v25 = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke_2;
  v20[3] = &unk_1E58BBD88;
  id v21 = v25;
  id v17 = v25;
  id v18 = v9;
  BOOL v19 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v22 errorHandler:v20];
}

uint64_t __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addSamples:toWorkout:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_replaceWorkout:(id)a3 withWorkout:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke;
  v16[3] = &unk_1E58BDC78;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_replaceWorkout:withWorkout:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startWorkoutSession:(HKWorkoutSession *)workoutSession
{
  uint64_t v4 = workoutSession;
  [(HKWorkoutSession *)v4 _setupWithHealthStore:self];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(HKWorkoutSession *)v4 startActivityWithDate:v5 completion:&__block_literal_global_514];
}

void __37__HKHealthStore_startWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __37__HKHealthStore_startWorkoutSession___block_invoke_cold_1();
    }
  }
}

- (void)endWorkoutSession:(HKWorkoutSession *)workoutSession
{
  id v4 = workoutSession;
  [(HKWorkoutSession *)v4 _setupWithHealthStore:self];
  [(HKWorkoutSession *)v4 endWithCompletion:&__block_literal_global_516];
}

void __35__HKHealthStore_endWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1();
    }
  }
}

- (void)pauseWorkoutSession:(HKWorkoutSession *)workoutSession
{
  id v4 = workoutSession;
  [(HKWorkoutSession *)v4 _setupWithHealthStore:self];
  [(HKWorkoutSession *)v4 pauseWithCompletion:&__block_literal_global_518];
}

void __37__HKHealthStore_pauseWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1();
    }
  }
}

- (void)resumeWorkoutSession:(HKWorkoutSession *)workoutSession
{
  id v4 = workoutSession;
  [(HKWorkoutSession *)v4 _setupWithHealthStore:self];
  [(HKWorkoutSession *)v4 resumeWithCompletion:&__block_literal_global_520];
}

void __38__HKHealthStore_resumeWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1();
    }
  }
}

- (void)startWatchAppWithWorkoutConfiguration:(HKWorkoutConfiguration *)workoutConfiguration completion:(void *)completion
{
  id v6 = workoutConfiguration;
  id v7 = completion;
  _HKInitializeLogging();
  id v8 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "Requesting watch workout app launch with configuration", buf, 2u);
  }
  id v9 = +[_HKBehavior sharedBehavior];
  if ([v9 isiPad])
  {
  }
  else
  {
    uint64_t v10 = +[_HKBehavior sharedBehavior];
    int v11 = [v10 isRealityDevice];

    if (!v11)
    {
      id v13 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v7];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke;
      v16[3] = &unk_1E58BDE70;
      id v17 = v6;
      id v18 = v13;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke_2;
      v14[3] = &unk_1E58BBD88;
      id v7 = v18;
      id v15 = v7;
      [(HKHealthStore *)self _serverProxyWithHandler:v16 errorHandler:v14];

      id v12 = v17;
      goto LABEL_8;
    }
  }
  id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2, @"Starting a workout from this device is not supported.");
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
LABEL_8:
}

uint64_t __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWatchAppWithWorkoutConfiguration:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  uint64_t v10 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "Requesting Apple watch workout app launch with configuration", buf, 2u);
  }
  int v11 = +[_HKBehavior sharedBehavior];
  if ([v11 isiPad])
  {
  }
  else
  {
    id v12 = +[_HKBehavior sharedBehavior];
    int v13 = [v12 isRealityDevice];

    if (!v13)
    {
      id v15 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v9];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke;
      v18[3] = &unk_1E58BE0F0;
      id v19 = v8;
      int v21 = a4;
      id v20 = v15;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke_2;
      v16[3] = &unk_1E58BBD88;
      id v9 = v20;
      id v17 = v9;
      [(HKHealthStore *)self _serverProxyWithHandler:v18 errorHandler:v16];

      id v14 = v19;
      goto LABEL_8;
    }
  }
  id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2, @"Starting a workout from this device is not supported.");
  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
LABEL_8:
}

uint64_t __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWatchAppWithWorkoutPlanData:processIdentifier:completion:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recoverActiveWorkoutSessionWithCompletion:(void *)completion
{
  id v4 = [(HKHealthStore *)self _objectCompletionOnClientQueue:completion];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke;
  v8[3] = &unk_1E58BE168;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_5;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthStore *)self _serverProxyWithHandler:v8 errorHandler:v6];
}

void __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_2;
  v5[3] = &unk_1E58BE140;
  id v4 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(a2, "remote_recoverActiveWorkoutSessionWithCompletion:", v5);
}

void __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    [v7 setRequiresRecovery:1];
    uint64_t v10 = [HKWorkoutSession alloc];
    uint64_t v11 = *(void *)(a1 + 32);
    id v22 = 0;
    id v12 = [(HKWorkoutSession *)v10 _initWithHealthStore:v11 taskConfiguration:v7 error:&v22];
    id v13 = v22;
    if (v12)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_3;
      v16[3] = &unk_1E58BE118;
      id v21 = *(id *)(a1 + 40);
      id v17 = v8;
      id v14 = v12;
      uint64_t v15 = *(void *)(a1 + 32);
      id v18 = v14;
      uint64_t v19 = v15;
      id v20 = v9;
      [v14 _recoverWithCompletion:v16];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_7:
    v8();
    goto LABEL_10;
  }
  id v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_7;
  }
  [v6 setRequiresRecovery:1];
  id v7 = [[HKLiveWorkoutBuilder alloc] initWithHealthStore:*(void *)(a1 + 48) session:*(void *)(a1 + 40) builderConfiguration:*(void *)(a1 + 32) builderIdentifier:*(void *)(a1 + 56)];
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_4;
    v9[3] = &unk_1E58BDCC8;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = v7;
    id v12 = *(id *)(a1 + 64);
    [(HKWorkoutBuilder *)v11 _recoverWithCompletion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

LABEL_10:
}

uint64_t __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _setAssociatedWorkoutBuilder:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

uint64_t __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setWorkoutSessionMirroringStartHandler:(void *)workoutSessionMirroringStartHandler
{
  id v4 = workoutSessionMirroringStartHandler;
  _HKInitializeLogging();
  id v5 = HKLogWorkouts;
  BOOL v6 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[mirroring] Client setting mirrored session handler.", buf, 2u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_530;
    aBlock[3] = &unk_1E58BE1B0;
    id v12 = v4;
    id v7 = _Block_copy(aBlock);
    os_unfair_lock_lock(&self->_lock);
    id v8 = _Block_copy(v7);
    id mirroredSessionHandler = self->_mirroredSessionHandler;
    self->_id mirroredSessionHandler = v8;

    os_unfair_lock_unlock(&self->_lock);
    [(HKHealthStore *)self _setMirroredWorkoutSessionObserverStateToEnabled:1 handler:v7];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[mirroring] Mirrored session handler set to nil by the client.", buf, 2u);
    }
    os_unfair_lock_lock(&self->_lock);
    id v10 = self->_mirroredSessionHandler;
    self->_id mirroredSessionHandler = 0;

    os_unfair_lock_unlock(&self->_lock);
    [(HKHealthStore *)self _setMirroredWorkoutSessionObserverStateToEnabled:0 handler:&__block_literal_global_529];
  }
}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_cold_1();
    }
  }
}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_530(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogWorkouts;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[mirroring] Client received remote session", v10, 2u);
    }
    uint64_t v8 = [*(id *)(a1 + 32) copy];
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_530_cold_1();
  }
}

- (void)_setMirroredWorkoutSessionObserverStateToEnabled:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke;
  v10[3] = &unk_1E58BE1D8;
  BOOL v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_3;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKHealthStore *)self _serverProxyWithHandler:v10 errorHandler:v8];
}

void __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_2;
  v4[3] = &unk_1E58BBD38;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_setMirroredWorkoutSessionObserverStateToEnabled:completion:", v3, v4);
}

uint64_t __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)_applicationHasRunningWorkout
{
  return +[HKWorkoutSession _applicationHasRunningWorkout];
}

- (void)_ratingOfExertionSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  id v11 = [(HKHealthStore *)self _objectCompletionOnClientQueue:v10];
  id v31 = 0;
  BOOL v12 = +[_HKEntitlements entitlementsForCurrentTaskWithError:&v31];
  id v13 = v31;
  if (v12)
  {
    if ([v12 hasEntitlement:@"com.apple.private.healthkit"])
    {
      if (v9)
      {
        id v14 = [v8 workoutActivities];
        int v15 = [v14 containsObject:v9];

        if (v15)
        {
          [v8 workoutActivityType];
LABEL_12:
          uint64_t v19 = [v8 UUID];
          id v20 = +[HKQuery predicateForObjectWithUUID:v19];

          id v21 = [HKWorkoutEffortRelationshipQuery alloc];
          uint64_t v24 = MEMORY[0x1E4F143A8];
          uint64_t v25 = 3221225472;
          uint64_t v26 = __79__HKHealthStore__ratingOfExertionSamplesForWorkout_workoutActivity_completion___block_invoke;
          uint64_t v27 = &unk_1E58BE200;
          __int16 v28 = self;
          id v30 = v11;
          id v29 = v9;
          id v22 = [(HKWorkoutEffortRelationshipQuery *)v21 initWithPredicate:v20 anchor:0 options:0 resultsHandler:&v24];
          -[HKHealthStore executeQuery:](self, "executeQuery:", v22, v24, v25, v26, v27, v28);

          goto LABEL_16;
        }
        id v17 = (void *)MEMORY[0x1E4F28C58];
        id v18 = @"Activity must be inside workout activities.";
      }
      else
      {
        if ([v8 workoutActivityType] != 82) {
          goto LABEL_12;
        }
        id v17 = (void *)MEMORY[0x1E4F28C58];
        id v18 = @"Activity must be set for HKWorkoutActivityTypeSwimBikeRun workouts.";
      }
      uint64_t v16 = objc_msgSend(v17, "hk_error:description:", 3, v18);
    }
    else
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Missing private entitlement.");
    }
    uint64_t v23 = (void *)v16;
    v10[2](v10, 0, v16);

    goto LABEL_16;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR)) {
    -[HKHealthStore _ratingOfExertionSamplesForWorkout:workoutActivity:completion:]();
  }
  v10[2](v10, 0, (uint64_t)v13);
LABEL_16:
}

void __79__HKHealthStore__ratingOfExertionSamplesForWorkout_workoutActivity_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [*(id *)(a1 + 32) stopQuery:a2];
  if (v8)
  {
    id v23 = v9;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v17 = [v16 samples];
          if (!v17 || (uint64_t v18 = *(void *)(a1 + 40), v17, v18))
          {
            uint64_t v19 = *(void **)(a1 + 40);
            if (!v19) {
              continue;
            }
            id v20 = [v16 activity];
            int v21 = [v19 isEqual:v20];

            if (!v21) {
              continue;
            }
          }
          id v22 = [v16 samples];
          [v10 addObjectsFromArray:v22];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v9 = v23;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_relateReplaceRatingOfExertionSample:(id)a3 toWorkout:(id)a4 forActivity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a6];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke;
  v18[3] = &unk_1E58BE250;
  id v21 = v12;
  id v22 = v13;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  [(HKHealthStore *)self _ratingOfExertionSamplesForWorkout:v15 workoutActivity:v14 completion:v18];
}

void __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_2;
    v7[3] = &unk_1E58BE228;
    id v4 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = v3;
    id v12 = *(id *)(a1 + 64);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_3;
    v5[3] = &unk_1E58BBD88;
    id v6 = *(id *)(a1 + 64);
    [v4 _serverProxyWithHandler:v7 errorHandler:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_2(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_relateReplaceRatingOfExertionSample:toWorkout:workoutActivity:samples:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

uint64_t __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)relateWorkoutEffortSample:(id)a3 withWorkout:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  if (v12
    && ([v11 workoutActivities],
        id v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 containsObject:v12],
        v14,
        (v15 & 1) == 0))
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Activity must be inside workout activities.");
    v13[2](v13, 0, v18);
  }
  else
  {
    id v16 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke;
    v21[3] = &unk_1E58BDCA0;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v25 = v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke_2;
    v19[3] = &unk_1E58BBD88;
    id v20 = v25;
    id v17 = v25;
    [(HKHealthStore *)self _serverProxyWithHandler:v21 errorHandler:v19];
  }
}

void __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "remote_relateSamples:withObject:subObject:type:completion:", v5, a1[5], a1[6], 1, a1[7], v6, v7);
}

uint64_t __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unrelateWorkoutEffortSample:(id)a3 fromWorkout:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  if (v12
    && ([v11 workoutActivities],
        id v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 containsObject:v12],
        v14,
        (v15 & 1) == 0))
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Activity must be inside workout activities.");
    v13[2](v13, 0, v18);
  }
  else
  {
    id v16 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke;
    v21[3] = &unk_1E58BDCA0;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v25 = v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke_2;
    v19[3] = &unk_1E58BBD88;
    id v20 = v25;
    id v17 = v25;
    [(HKHealthStore *)self _serverProxyWithHandler:v21 errorHandler:v19];
  }
}

void __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "remote_unrelateSamples:withObject:subObject:type:completion:", v5, a1[5], a1[6], 1, a1[7], v6, v7);
}

uint64_t __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setBackgroundDeliveryFrequencyDataType:(id)a3 frequency:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke;
  v14[3] = &unk_1E58BDC28;
  int64_t v17 = a4;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke_2;
  v12[3] = &unk_1E58BBD88;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setBackgroundDeliveryFrequency:forDataType:handler:", a1[6], a1[4], a1[5]);
}

uint64_t __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableBackgroundDeliveryForType:(HKObjectType *)type withCompletion:(void *)completion
{
}

- (void)disableAllBackgroundDeliveryWithCompletion:(void *)completion
{
}

- (void)_closeTransactionWithTypes:(id)a3 anchor:(id)a4 ackTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke;
  v14[3] = &unk_1E58BE278;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v14 errorHandler:&__block_literal_global_548];
}

uint64_t __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_closeTransactionWithDataTypes:anchor:ackTime:completion:", a1[4], a1[5], a1[6], &__block_literal_global_545);
}

void __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2_cold_1();
    }
  }
}

void __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_546(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
    __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2_cold_1();
  }
}

- (void)preferredUnitsForQuantityTypes:(NSSet *)quantityTypes completion:(void *)completion
{
  uint64_t v6 = completion;
  uint64_t v7 = quantityTypes;
  [(HKHealthStore *)self preferredUnitsForQuantityTypes:v7 version:HKSupportedUnitPreferencesVersion() completion:v6];
}

- (void)preferredUnitsForQuantityTypes:(id)a3 version:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = [(HKHealthStore *)self _objectCompletionOnClientQueue:a5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke;
  v14[3] = &unk_1E58BDC28;
  id v15 = v8;
  int64_t v17 = a4;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke_2;
  v12[3] = &unk_1E58BBD88;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v14 errorHandler:v12];
}

uint64_t __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchUnitPreferencesForTypes:version:withCompletion:", a1[4], a1[6], a1[5]);
}

uint64_t __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setPreferredUnit:(id)a3 forType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke;
  v16[3] = &unk_1E58BDC78;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setPreferredUnit:forType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removePreferredUnitForType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke;
  v12[3] = &unk_1E58BDE70;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKHealthStore *)self _serverProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removePreferredUnitForType:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)splitTotalEnergy:(HKQuantity *)totalEnergy startDate:(NSDate *)startDate endDate:(NSDate *)endDate resultsHandler:(void *)resultsHandler
{
  id v11 = totalEnergy;
  id v12 = startDate;
  id v13 = endDate;
  id v14 = resultsHandler;
  [(NSDate *)v12 timeIntervalSinceDate:v13];
  if (v15 <= 0.00000011920929)
  {
    id v16 = 0;
  }
  else
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"startDate (%@) cannot occur after endDate (%@)"", v12, v13);
  }
  id v17 = +[HKUnit kilocalorieUnit];
  BOOL v18 = [(HKQuantity *)v11 isCompatibleWithUnit:v17];

  if (!v18)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"totalEnergy (%@) quantity unit is not compatible with kilocalories"", v11);

    id v16 = (void *)v19;
  }
  if (v16)
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke;
    block[3] = &unk_1E58BBF10;
    id v21 = &v33;
    id v33 = v14;
    id v32 = v16;
    dispatch_async(clientQueue, block);
    id v22 = v32;
  }
  else
  {
    id v23 = +[HKUnit kilocalorieUnit];
    [(HKQuantity *)v11 doubleValueForUnit:v23];
    id v25 = v24;

    [(NSDate *)v13 timeIntervalSinceDate:v12];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_2;
    v29[3] = &unk_1E58BE2C8;
    v30[1] = v25;
    v30[2] = v26;
    id v21 = v30;
    v30[0] = v14;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4;
    v27[3] = &unk_1E58BBC48;
    v27[4] = self;
    id v28 = v30[0];
    [(HKHealthStore *)self _serverProxyWithHandler:v29 errorHandler:v27];
    id v22 = v28;
  }
}

uint64_t __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_3;
  v5[3] = &unk_1E58BE2A0;
  double v7 = v3;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_splitTotalCalories:timeInterval:withCompletion:", v5, v3, v4);
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_3(uint64_t a1, double a2)
{
  if (*(double *)(a1 + 40) >= a2) {
    double v3 = a2;
  }
  else {
    double v3 = *(double *)(a1 + 40);
  }
  double v4 = +[HKUnit kilocalorieUnit];
  id v7 = +[HKQuantity quantityWithUnit:v4 doubleValue:v3];

  id v5 = +[HKUnit kilocalorieUnit];
  id v6 = +[HKQuantity quantityWithUnit:v5 doubleValue:*(double *)(a1 + 40) - v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1();
    }
  }
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_558;
  v7[3] = &unk_1E58BBF10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_558(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)connectionInterrupted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = (void *)[(NSMutableSet *)self->_queries copy];
  serverProxy = self->_serverProxy;
  self->_serverProxy = 0;

  id v6 = (void *)[self->_mirroredSessionHandler copy];
  [(HKHealthStore *)self invalidateAllDatabaseAccessibilityAssertions];
  os_unfair_lock_unlock(p_lock);
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"connection interrupted");
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__HKHealthStore_connectionInterrupted__block_invoke;
  v12[3] = &unk_1E58BBB10;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v4;
  id v15 = v6;
  id v9 = v6;
  id v10 = v4;
  id v11 = v7;
  dispatch_async(clientQueue, v12);
}

void __38__HKHealthStore_connectionInterrupted__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:", *(void *)(a1 + 40));
  if ([*(id *)(a1 + 48) count])
  {
    id v2 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__HKHealthStore_connectionInterrupted__block_invoke_2;
    v5[3] = &unk_1E58BDEC0;
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = v3;
    uint64_t v7 = v4;
    [v2 _serverProxyWithHandler:v5 errorHandler:&__block_literal_global_563];
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 32), "_setMirroredWorkoutSessionObserverStateToEnabled:handler:", 1);
  }
}

void __38__HKHealthStore_connectionInterrupted__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "reactivateWithHealthStore:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)connectionConfigured
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_databaseAccessibilityAssertionStoreKeeper;
  os_unfair_lock_unlock(p_lock);
  [(HKDatabaseAccessibilityAssertionStoreKeeper *)v4 connectionConfigured];
}

- (void)_applicationWillResignActive:(id)a3
{
  _HKInitializeLogging();
  uint64_t v4 = HKLogProcessState;
  if (os_log_type_enabled((os_log_t)HKLogProcessState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "App will resign active", v5, 2u);
  }
  [(HKHealthStore *)self _serverProxyWithHandler:&__block_literal_global_565 errorHandler:&__block_literal_global_569];
}

uint64_t __46__HKHealthStore__applicationWillResignActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_clientWillSuspendWithCompletion:", &__block_literal_global_567);
}

void __46__HKHealthStore__applicationWillResignActive___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
    __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1();
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  _HKInitializeLogging();
  uint64_t v4 = HKLogProcessState;
  if (os_log_type_enabled((os_log_t)HKLogProcessState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "App did become active", v5, 2u);
  }
  [(HKHealthStore *)self _serverProxyWithHandler:&__block_literal_global_571 errorHandler:&__block_literal_global_575];
}

uint64_t __45__HKHealthStore__applicationDidBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_clientResumedWithCompletion:", &__block_literal_global_573);
}

void __45__HKHealthStore__applicationDidBecomeActive___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
    __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1();
  }
}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E58BBA50;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)[v8 copy];

  return v6;
}

void __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (id)_multiActionCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E58BE338;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)[v8 copy];

  return v6;
}

void __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E58BE310;
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  char v15 = a3;
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
  }
  return result;
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E58BE360;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)[v8 copy];

  return v6;
}

void __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E58BB9A0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (BOOL)_prepareObjectsForSaving:(id)a3 errorOut:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "prepareForSaving:", a4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)setHealthLiteValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "key");
  }
  id v11 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke;
  v17[3] = &unk_1E58BDC78;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setHealthLiteValue:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getHealthLiteValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "key");
  }
  id v8 = [(HKHealthStore *)self _objectCompletionOnClientQueue:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke;
  v13[3] = &unk_1E58BDE70;
  id v14 = v6;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKHealthStore *)self _serverProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthLiteValueForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAllHealthDataAccessForSiri:(int64_t)a3 completion:(id)a4
{
  id v6 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke;
  v10[3] = &unk_1E58BE388;
  int64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke_2;
  v8[3] = &unk_1E58BBD88;
  id v9 = v11;
  id v7 = v11;
  [(HKHealthStore *)self _serverProxyWithHandler:v10 errorHandler:v8];
}

uint64_t __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setAllHealthDataAccessForSiri:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllHealthDataAccessForSiriWithCompletion:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke;
  v11[3] = &unk_1E58BDD68;
  void v11[4] = self;
  id v12 = v4;
  id v5 = (void *)[v11 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_3;
  v9[3] = &unk_1E58BDC50;
  id v10 = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_4;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKHealthStore *)self _serverProxyWithHandler:v9 errorHandler:v7];
}

void __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BDD40;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_2(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[4]);
  }
  return result;
}

uint64_t __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getAllHealthDataAccessForSiriWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchServerURLForAssetType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKHealthStore *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke;
  v12[3] = &unk_1E58BDE70;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke_2;
  v10[3] = &unk_1E58BBD88;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(HKHealthStore *)self _serverProxyWithHandler:v12 errorHandler:v10];
}

uint64_t __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchServerURLForAssetType:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setServerURL:(id)a3 forAssetType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKHealthStore *)self _actionCompletionOnClientQueue:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke;
  v16[3] = &unk_1E58BDC78;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke_2;
  v14[3] = &unk_1E58BBD88;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v16 errorHandler:v14];
}

uint64_t __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setServerURL:forAssetType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_unitPreferencesDidUpdate
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"HKUserPreferencesDidChangeNotification" object:self];
}

- (void)clientRemote_conceptIndexManagerDidBecomeQuiescentWithSamplesProcessedCount:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = @"processedSampleCount";
  id v6 = [NSNumber numberWithInteger:a3];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 postNotificationName:@"HKConceptIndexManagerDidBecomeQuiescentNotification" object:self userInfo:v7];
}

- (void)clientRemote_didCreateRemoteSessionWithConfiguration:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 144));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v2)
  {
    id v3 = [HKWorkoutSession alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v13 = 0;
    id v6 = [(HKWorkoutSession *)v3 _initWithHealthStore:v4 taskConfiguration:v5 error:&v13];
    id v7 = v13;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_579;
    v10[3] = &unk_1E58BE3B0;
    id v11 = v6;
    id v12 = v2;
    id v8 = v6;
    [v8 _setupMirroredSessionTaskServerWithCompletion:v10];
  }
  else
  {
    _HKInitializeLogging();
    id v9 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_cold_1(v9);
    }
  }
}

uint64_t __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_579(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)fetchMedicalIDDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HKMedicalIDStore alloc] initWithHealthStore:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HKHealthStore_fetchMedicalIDDataWithCompletion___block_invoke;
  v7[3] = &unk_1E58BE3D8;
  id v8 = v4;
  id v6 = v4;
  [(HKMedicalIDStore *)v5 fetchMedicalIDDataWithCompletion:v7];
}

uint64_t __50__HKHealthStore_fetchMedicalIDDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDDataCreateIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [[HKMedicalIDStore alloc] initWithHealthStore:self];
  id v8 = v7;
  if (v4) {
    [(HKMedicalIDStore *)v7 fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:v6];
  }
  else {
    [(HKMedicalIDStore *)v7 fetchMedicalIDDataWithCompletion:v6];
  }
}

- (void)fetchMedicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HKMedicalIDStore alloc] initWithHealthStore:self];
  [(HKMedicalIDStore *)v5 fetchMedicalIDEmergencyContactsWithCompletion:v4];
}

- (void)updateMedicalIDData:(id)a3
{
}

- (void)updateMedicalIDData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HKMedicalIDStore alloc] initWithHealthStore:self];
  [(HKMedicalIDStore *)v8 updateMedicalIDData:v7 completion:v6];
}

- (void)deleteMedicalIDData
{
}

- (void)deleteMedicalIDDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HKMedicalIDStore alloc] initWithHealthStore:self];
  [(HKMedicalIDStore *)v5 deleteMedicalIDDataWithCompletion:v4];
}

- (id)_getDatabaseAccessibilityAssertionStoreKeeper
{
  int64_t databaseAccessibilityAssertionStoreKeeperDispatchOnceToken = self->_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken;
  p_int64_t databaseAccessibilityAssertionStoreKeeperDispatchOnceToken = &self->_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HKHealthStore__getDatabaseAccessibilityAssertionStoreKeeper__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  if (databaseAccessibilityAssertionStoreKeeperDispatchOnceToken != -1) {
    dispatch_once(p_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken, block);
  }
  return self->_databaseAccessibilityAssertionStoreKeeper;
}

uint64_t __62__HKHealthStore__getDatabaseAccessibilityAssertionStoreKeeper__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 160) = [[HKDatabaseAccessibilityAssertionStoreKeeper alloc] initWithHealthStore:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

- (void)requestDatabaseAccessibilityAssertion:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(HKHealthStore *)self _getDatabaseAccessibilityAssertionStoreKeeper];
  [v10 fetchDatabaseAccessibilityAssertionForOwnerIdentifier:v9 timeout:v8 completion:a4];
}

- (void)invalidateDatabaseAccessibilityAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHealthStore *)self _getDatabaseAccessibilityAssertionStoreKeeper];
  [v5 invalidateDatabaseAccessibilityAssertionWithAssertion:v4];
}

- (void)invalidateAllDatabaseAccessibilityAssertions
{
  id v2 = [(HKHealthStore *)self _getDatabaseAccessibilityAssertionStoreKeeper];
  [v2 invalidateAllDatabaseAccessibilityAssertions];
}

- (void)isProtectedDataAvailableWithCompletion:(id)a3
{
  id v4 = [(HKHealthStore *)self _multiActionCompletionOnClientQueue:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke;
  v8[3] = &unk_1E58BDC50;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke_2;
  v6[3] = &unk_1E58BBD88;
  id v7 = v9;
  id v5 = v9;
  [(HKHealthStore *)self _serverProxyWithHandler:v8 errorHandler:v6];
}

uint64_t __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_isProtectedDataAvailable:", *(void *)(a1 + 32));
}

uint64_t __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dropEntitlement:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__HKHealthStore_dropEntitlement___block_invoke;
  v10[3] = &unk_1E58BBCC0;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__HKHealthStore_dropEntitlement___block_invoke_583;
  v8[3] = &unk_1E58BBE28;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "remote_dropEntitlement:completion:", v7, v8);
}

void __33__HKHealthStore_dropEntitlement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogTesting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "Failed to drop '%{public}@' entitlement: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __33__HKHealthStore_dropEntitlement___block_invoke_583(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    int v6 = HKLogTesting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Failed to drop '%{public}@' entitlement: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)restoreEntitlement:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__HKHealthStore_restoreEntitlement___block_invoke;
  v10[3] = &unk_1E58BBCC0;
  id v5 = v4;
  id v11 = v5;
  int v6 = [(HKHealthStore *)self _synchronousServerProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__HKHealthStore_restoreEntitlement___block_invoke_584;
  v8[3] = &unk_1E58BBE28;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "remote_restoreEntitlement:completion:", v7, v8);
}

void __36__HKHealthStore_restoreEntitlement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogTesting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "Failed to restore '%{public}@' entitlement: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __36__HKHealthStore_restoreEntitlement___block_invoke_584(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    int v6 = HKLogTesting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Failed to restore '%{public}@' entitlement: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (NSString)writeAuthorizationUsageDescriptionOverride
{
  return self->_writeAuthorizationUsageDescriptionOverride;
}

- (void)setWriteAuthorizationUsageDescriptionOverride:(id)a3
{
}

- (NSString)readAuthorizationUsageDescriptionOverride
{
  return self->_readAuthorizationUsageDescriptionOverride;
}

- (void)setReadAuthorizationUsageDescriptionOverride:(id)a3
{
}

- (NSString)clinicalReadAuthorizationUsageDescriptionOverride
{
  return self->_clinicalReadAuthorizationUsageDescriptionOverride;
}

- (void)setClinicalReadAuthorizationUsageDescriptionOverride:(id)a3
{
}

- (NSString)researchStudyUsageDescriptionOverride
{
  return self->_researchStudyUsageDescriptionOverride;
}

- (void)setResearchStudyUsageDescriptionOverride:(id)a3
{
}

- (NSString)daemonLaunchDarwinNotificationName
{
  return self->_daemonLaunchDarwinNotificationName;
}

- (void)setDaemonLaunchDarwinNotificationName:(id)a3
{
}

- (id)_hkui_authorizationViewControllerPresenter
{
  id WeakRetained = objc_loadWeakRetained(&self->__hkui_authorizationViewControllerPresenter);

  return WeakRetained;
}

- (void)set_hkui_authorizationViewControllerPresenter:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (id)unitTest_handleExecuteQuery
{
  return self->_unitTest_handleExecuteQuery;
}

- (void)setUnitTest_handleExecuteQuery:(id)a3
{
}

- (HKHealthStoreIdentifier)identifier
{
  return (HKHealthStoreIdentifier *)objc_getProperty(self, a2, 232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_unitTest_handleExecuteQuery, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak(&self->__hkui_authorizationViewControllerPresenter);
  objc_storeStrong((id *)&self->_daemonLaunchDarwinNotificationName, 0);
  objc_storeStrong((id *)&self->_researchStudyUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_clinicalReadAuthorizationUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_readAuthorizationUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_writeAuthorizationUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertionStoreKeeper, 0);
  objc_storeStrong(&self->_mirroredSessionHandler, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_healthServicesManager, 0);
  objc_storeStrong(&self->_authorizationDelegateTransactionErrorHandler, 0);
  objc_storeStrong((id *)&self->_recalibrateEstimatesPresentationController, 0);
  objc_storeStrong((id *)&self->_objectPickerPresentationController, 0);
  objc_storeStrong((id *)&self->_authorizationPresentationController, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundle, 0);
  objc_storeStrong((id *)&self->_healthdConnection, 0);

  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (NSString)firstName
{
  id v2 = [[HKProfileStore alloc] initWithHealthStore:self];
  id v3 = [(HKProfileStore *)v2 synchronouslyFetchFirstName];

  return (NSString *)v3;
}

- (void)profileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[HKProfileStore alloc] initWithHealthStore:self];
  [(HKProfileStore *)v8 fetchProfileIdentifierForNRDeviceUUID:v7 completion:v6];
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [[HKCloudSyncControl alloc] initWithHealthStore:self];
  [(HKCloudSyncControl *)v9 forceCloudSyncWithOptions:a3 reason:a4 completion:v8];
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [[HKCloudSyncControl alloc] initWithHealthStore:self];
  [(HKCloudSyncControl *)v7 forceCloudSyncWithOptions:a3 completion:v6];
}

- (void)forceCloudSyncDataUploadForProfileWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HKCloudSyncControl alloc] initWithHealthStore:self];
  [(HKCloudSyncControl *)v5 forceCloudSyncDataUploadForProfileWithCompletion:v4];
}

- (void)fetchCloudSyncRequiredWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HKCloudSyncControl alloc] initWithHealthStore:self];
  [(HKCloudSyncControl *)v5 fetchCloudSyncRequiredWithCompletion:v4];
}

- (void)disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HKCloudSyncControl alloc] initWithHealthStore:self];
  [(HKCloudSyncControl *)v5 disableCloudSyncAndDeleteAllCloudDataWithCompletion:v4];
}

- (BOOL)requiresWeakRetention
{
  return 0;
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  if (HKFeatureIdentifierIsProvidedBySleepDaemon(v4))
  {
    if (SleepLibraryCore() && getgetSleepFeatureAvailabilityProvidingSymbolLoc())
    {
      id v5 = [NSString stringWithFormat:@"HKHealthStore<HKFeatureAvailabilityHealthDataSource> (%@)", v4];
      id v6 = self;
      id v7 = v4;
      id v8 = (void (*)(id, HKHealthStore *, id))getgetSleepFeatureAvailabilityProvidingSymbolLoc();
      if (!v8) {
        -[HKHealthStore(HKFeatureAvailabilityHealthDataSource) featureAvailabilityProvidingForFeatureIdentifier:]();
      }
      v8(v5, v6, v7);
      uint64_t v9 = (HKFeatureAvailabilityStore *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      __int16 v10 = (void *)HKLogSleep;
      if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_ERROR)) {
        -[HKHealthStore(HKFeatureAvailabilityHealthDataSource) featureAvailabilityProvidingForFeatureIdentifier:](v10);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = [[HKFeatureAvailabilityStore alloc] initWithFeatureIdentifier:v4 healthStore:self];
  }

  return v9;
}

- (id)sharedRequirementEvaluationDataSource
{
  return 0;
}

- (id)healthDataRequirementEvaluationProvider
{
  id v2 = [[HKFeatureAvailabilityHealthDataRequirementStore alloc] initWithHealthStore:self];

  return v2;
}

- (id)requirementSatisfactionOverridesDataSource
{
  return +[HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource requirementSatisfactionOverridesDataSource];
}

- (id)watchLowPowerModeDataSource
{
  return 0;
}

- (id)wristDetectionSettingManager
{
  id v2 = objc_alloc_init(HKWristDetectionSettingManager);

  return v2;
}

- (id)ageWithCurrentDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HKHealthStore *)self dateOfBirthComponentsWithError:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "hk_ageWithCurrentDate:", v6));
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)featureStatusProviderForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[HKFeatureStatusManager alloc] initWithFeatureIdentifier:v4 healthStore:self countryCodeSource:0];

  return v5;
}

- (void)isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HKHealthRecordsStore alloc] initWithHealthStore:self];
  [(HKHealthRecordsStore *)v5 fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:v4];
}

- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [[HKWorkoutControl alloc] initWithHealthStore:self];
  [(HKWorkoutControl *)v9 generateFakeDataForActivityType:a3 minutes:v8 completion:a4];
}

- (void)_activeWorkoutApplicationIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__HKHealthStore_Deprecated___activeWorkoutApplicationIdentifierWithCompletion___block_invoke;
  v6[3] = &unk_1E58C2758;
  id v7 = v4;
  id v5 = v4;
  [(HKHealthStore *)self _currentWorkoutSnapshotWithCompletion:v6];
}

void __79__HKHealthStore_Deprecated___activeWorkoutApplicationIdentifierWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 applicationIdentifier];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_firstPartyWorkoutSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HKHealthStore_Deprecated___firstPartyWorkoutSnapshotWithCompletion___block_invoke;
  v6[3] = &unk_1E58C2758;
  id v7 = v4;
  id v5 = v4;
  [(HKHealthStore *)self _currentWorkoutSnapshotWithCompletion:v6];
}

void __70__HKHealthStore_Deprecated___firstPartyWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isFirstPartyWorkout])
  {
    id v6 = +[_HKFirstPartyWorkoutSnapshot firstPartyWorkoutSnapshotWithCurrentWorkoutSnapshot:v7];
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_currentWorkoutSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__21;
  id v14 = __Block_byref_object_dispose__21;
  id v15 = [[_HKWorkoutObserver alloc] initWithHealthStore:self];
  id v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKHealthStore_Deprecated___currentWorkoutSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E58C2780;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  [v5 currentWorkoutSnapshotWithCompletion:v7];

  _Block_object_dispose(&v10, 8);
}

void __67__HKHealthStore_Deprecated___currentWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_shouldGenerateDemoDataPreferenceIsSet:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke;
  v6[3] = &unk_1E58BE3B0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKHealthStore *)self _fetchBoolDaemonPreferenceForKey:@"HealthUseDemoDataDatabaseKey" completion:v6];
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_cold_1((uint64_t)v5, v6);
      if (a2) {
        goto LABEL_4;
      }
LABEL_6:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_7;
    }
  }
  if ((a2 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_34;
  v8[3] = &unk_1E58BBD38;
  id v7 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v7 _fetchBoolDaemonPreferenceForKey:@"HealthDemoDataGenerateKey" completion:v8];

LABEL_7:
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_34_cold_1((uint64_t)v4, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchBoolDaemonPreferenceForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HKHealthStore__HKDaemonPreferences___fetchBoolDaemonPreferenceForKey_completion___block_invoke;
  v10[3] = &unk_1E58BDD18;
  id v11 = v6;
  id v9 = v6;
  [(HKHealthStore *)self _safeFetchDaemonPreferenceForKey:v7 expectedReturnClass:v8 completion:v10];
}

void __83__HKHealthStore__HKDaemonPreferences___fetchBoolDaemonPreferenceForKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [a2 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_safeFetchDaemonPreferenceForKey:(id)a3 expectedReturnClass:(Class)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__HKHealthStore__HKDaemonPreferences___safeFetchDaemonPreferenceForKey_expectedReturnClass_completion___block_invoke;
  v10[3] = &unk_1E58C9760;
  id v11 = v8;
  Class v12 = a4;
  id v9 = v8;
  [(HKHealthStore *)self _fetchDaemonPreferenceForKey:a3 completion:v10];
}

void __103__HKHealthStore__HKDaemonPreferences___safeFetchDaemonPreferenceForKey_expectedReturnClass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v6 = v7;
  }
  else
  {

    id v6 = 0;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchDaemonPreferenceForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "key");
    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  id v8 = [(HKHealthStore *)self _objectCompletionOnClientQueue:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke;
  v13[3] = &unk_1E58BDE70;
  id v14 = v6;
  id v15 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKHealthStore *)self _serverProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDaemonPreferenceForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setDaemonPreferenceValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "completion");
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "key");
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  id v11 = [(HKHealthStore *)self _actionCompletionOnClientQueue:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke;
  v17[3] = &unk_1E58BDC78;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKHealthStore *)self _serverProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDaemonPreferenceValue:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initWithListenerEndpoint:(os_log_t)log debugIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "HKHealthStore creation is blocked inside healthd", v1, 2u);
}

- (void)_connectionQueue_setUpWithEndpoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "FAILED recalibrate estimates request for %@ effective %@: %{public}@", (uint8_t *)&v5, 0x20u);
}

void __44__HKHealthStore_authorizationStatusForType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to determine authorization status: %{public}@", v2, v3, v4, v5, v6);
}

void __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v5 = "prompting";
  }
  else {
    uint64_t v5 = "silent";
  }
  uint8_t v6 = *(void **)(a1 + 32);
  __int16 v7 = a2;
  uint64_t v8 = [v6 allObjects];
  __int16 v9 = [*(id *)(a1 + 40) allObjects];
  uint64_t v10 = [a3 localizedDescription];
  int v11 = 136315906;
  id v12 = v5;
  __int16 v13 = 2112;
  id v14 = v8;
  __int16 v15 = 2112;
  id v16 = v9;
  __int16 v17 = 2112;
  id v18 = v10;
  _os_log_error_impl(&dword_19C023000, v7, OS_LOG_TYPE_ERROR, "FAILED %s authorization request to share %@, read %@, error %@", (uint8_t *)&v11, 0x2Au);
}

- (void)_validatePurposeStringsForSharingTypes:readingTypes:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to fetch entitlements when validating purpose strings: %{public}@", v2, v3, v4, v5, v6);
}

void __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to end delegate transaction: %{public}@", v2, v3, v4, v5, v6);
}

void __34__HKHealthStore__supportsFeature___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Failed to determine availability of feature %lu with error: %{public}@");
}

void __37__HKHealthStore_startWorkoutSession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to start workout session: %{public}@", v2, v3, v4, v5, v6);
}

void __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to end workout session: %{public}@", v2, v3, v4, v5, v6);
}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "[mirroring] Failed to disable remote session observer with error: %{public}@", v2, v3, v4, v5, v6);
}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_530_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "[mirroring] Failed to set remote session observer with XPC error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_ratingOfExertionSamplesForWorkout:workoutActivity:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to fetch entitlements: %{public}@", v2, v3, v4, v5, v6);
}

void __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to close observer query transaction: %{public}@", v2, v3, v4, v5, v6);
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "connection error: %{public}@", v2, v3, v4, v5, v6);
}

void __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "[mirroring] Client received a new mirrored session but the handler is not set up.", v1, 2u);
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error fetching demo data database preferences: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_34_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error fetching demo data generation preferences: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end