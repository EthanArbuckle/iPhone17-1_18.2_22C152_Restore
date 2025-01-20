@interface IXAppInstallCoordinator
+ (BOOL)_synchronouslyEnumerateCoordinatorsForIntent:(unint64_t)a3 error:(id *)a4 usingBlock:(id)a5;
+ (BOOL)addBundleIDs:(id)a3 toMappingsForPersona:(id)a4 error:(id *)a5;
+ (BOOL)associateMultiPersonaAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withError:(id *)a5;
+ (BOOL)cancelCoordinatorForAppWithBundleID:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6;
+ (BOOL)cancelCoordinatorForAppWithIdentity:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6;
+ (BOOL)cancelCoordinatorsForAppsWithApplicationIdentities:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6;
+ (BOOL)cancelCoordinatorsForAppsWithBundleIDs:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6;
+ (BOOL)demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 error:(id *)a7;
+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 error:(id *)a5;
+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6;
+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 error:(id *)a7;
+ (BOOL)enumerateCoordinatorsWithBlock:(id)a3 error:(id *)a4;
+ (BOOL)enumerateCoordinatorsWithError:(id *)a3 usingBlock:(id)a4;
+ (BOOL)killDaemonForTesting;
+ (BOOL)modifiesLocalLaunchServicesDatabase;
+ (BOOL)pauseCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)pauseCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4;
+ (BOOL)postNSCurrentLocaleDidChangeNotification;
+ (BOOL)prioritizeCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)prioritizeCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4;
+ (BOOL)purgeAllCoordinatorsAndPromisesForCreator:(unint64_t)a3;
+ (BOOL)refreshContainerTypes:(unint64_t)a3 forApplicationIdentity:(id)a4 reason:(id)a5 error:(id *)a6;
+ (BOOL)refreshContainerTypes:(unint64_t)a3 forBundleID:(id)a4 reason:(id)a5 error:(id *)a6;
+ (BOOL)refreshDataContainerForBundleID:(id)a3 reason:(id)a4 error:(id *)a5;
+ (BOOL)registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 withError:(id *)a5;
+ (BOOL)removeBundleIDs:(id)a3 fromMappingsForPersona:(id)a4 error:(id *)a5;
+ (BOOL)resumeCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)resumeCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4;
+ (BOOL)revertAppWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)revertAppWithBundleID:(id)a3 resultingApplicationRecord:(id *)a4 error:(id *)a5;
+ (BOOL)revertAppWithIdentity:(id)a3 resultingApplicationRecord:(id *)a4 error:(id *)a5;
+ (BOOL)setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4;
+ (BOOL)setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5;
+ (BOOL)setTestingEnabled:(BOOL)a3;
+ (BOOL)simulateClientDeath;
+ (BOOL)skipIntentValidation;
+ (BOOL)testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 error:(id *)a5;
+ (BOOL)uninstallAppWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)uninstallAppWithBundleID:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)uninstallAppWithBundleID:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6 legacyProgressBlock:(id)a7;
+ (BOOL)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 waitForDeletion:(BOOL)a5 error:(id *)a6;
+ (BOOL)uninstallAppWithIdentity:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)uninstallAppWithIdentity:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6 legacyProgressBlock:(id)a7;
+ (BOOL)unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 withError:(id *)a5;
+ (BOOL)updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 error:(id *)a6;
+ (BOOL)updateSINFForAppWithIdentity:(id)a3 wrapperURL:(id)a4 sinfData:(id)a5 error:(id *)a6;
+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 error:(id *)a5;
+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 wrapperURL:(id)a5 error:(id *)a6;
+ (BOOL)updateiTunesMetadataForAppWithIdentity:(id)a3 plistData:(id)a4 options:(id)a5 error:(id *)a6;
+ (BOOL)updateiTunesMetadataForAppWithIdentity:(id)a3 wrapperURL:(id)a4 plistData:(id)a5 error:(id *)a6;
+ (Class)classForIntent:(unint64_t)a3;
+ (id)_coordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 intent:(unint64_t)a6 createIfNotExisting:(BOOL)a7 requireMatchingIntent:(BOOL)a8 scopeRequirement:(unsigned __int8)a9 created:(BOOL *)a10 error:(id *)a11;
+ (id)_coordinatorForIdentity:(id)a3 created:(BOOL *)a4 error:(id *)a5;
+ (id)coordinatorForAppWithBundleID:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
+ (id)coordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 createIfNotExisting:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
+ (id)coordinatorForAppWithIdentity:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
+ (id)existingCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4;
+ (id)existingCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4;
+ (id)processScopedCoordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 createIfNotExisting:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
+ (id)processScopedCoordinatorForAppWithIdentity:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
+ (id)removabilityDataWithChangeClock:(id *)a3 error:(id *)a4;
+ (int)daemonPid;
+ (unint64_t)intent;
+ (unint64_t)removabilityForAppWithBundleID:(id)a3 error:(id *)a4;
+ (unint64_t)removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 error:(id *)a5;
+ (unint64_t)removabilityForAppWithIdentity:(id)a3 error:(id *)a4;
+ (void)_asynchronouslyEnumerateCoordinatorsForIntent:(unint64_t)a3 usingBlock:(id)a4;
+ (void)_beginInstallForURL:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 progressBlock:(id)a7 completion:(id)a8;
+ (void)_beginInstallForURL:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 progressBlock:(id)a7 completionWithIdentity:(id)a8;
+ (void)_demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 returnEarlyForTesting:(BOOL)a7 completion:(id)a8;
+ (void)_demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 completion:(id)a7;
+ (void)_validatePreconditionForIntent:(unint64_t)a3 matchesCurrentInstallStateForBundleID:(id)a4;
+ (void)cancelCoordinatorForAppWithBundleID:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
+ (void)cancelCoordinatorForAppWithIdentity:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
+ (void)cancelCoordinatorsForAppsWithApplicationIdentities:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
+ (void)cancelCoordinatorsForAppsWithBundleIDs:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
+ (void)demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 completion:(id)a7;
+ (void)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 completion:(id)a6;
+ (void)enumerateCoordinatorsUsingBlock:(id)a3;
+ (void)installApplication:(id)a3 consumeSource:(BOOL)a4 options:(id)a5 completion:(id)a6;
+ (void)installApplication:(id)a3 consumeSource:(BOOL)a4 options:(id)a5 legacyProgressBlock:(id)a6 completion:(id)a7;
+ (void)installApplication:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7;
+ (void)installApplication:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)installApplication:(id)a3 toTargetDirectory:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7;
+ (void)installApplication:(id)a3 toTargetDirectory:(id)a4 consumeSource:(BOOL)a5 shouldOverrideGatekeeper:(BOOL)a6 options:(id)a7 completion:(id)a8;
+ (void)installApplication:(id)a3 toURL:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7;
+ (void)installApplication:(id)a3 toURL:(id)a4 consumeSource:(BOOL)a5 shouldOverrideGatekeeper:(BOOL)a6 options:(id)a7 completion:(id)a8;
+ (void)pauseCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)pauseCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4;
+ (void)prioritizeCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4;
+ (void)removabilityDataWithCompletion:(id)a3;
+ (void)removabilityForAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 completion:(id)a5;
+ (void)removabilityForAppWithIdentity:(id)a3 completion:(id)a4;
+ (void)resumeCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)resumeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4;
+ (void)revertAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)revertAppWithBundleID:(id)a3 completionWithApplicationRecord:(id)a4;
+ (void)revertAppWithIdentity:(id)a3 completionWithApplicationRecord:(id)a4;
+ (void)setRemovability:(unint64_t)a3 forAppWithBundleID:(id)a4 byClient:(unint64_t)a5 completion:(id)a6;
+ (void)setRemovability:(unint64_t)a3 forAppWithBundleID:(id)a4 completion:(id)a5;
+ (void)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6;
+ (void)setSkipIntentValidation:(BOOL)a3;
+ (void)uninstallAppWithBundleID:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 completion:(id)a5;
+ (void)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 waitForDeletion:(BOOL)a5 completion:(id)a6;
+ (void)uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5;
- (BOOL)appAssetPromiseHasBegunFulfillment:(BOOL *)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)convertToGloballyScopedCoordinatorWithError:(id *)a3;
- (BOOL)getHasDeviceSecurityPromise:(BOOL *)a3 error:(id *)a4;
- (BOOL)getHasEssentialAssetPromises:(BOOL *)a3 error:(id *)a4;
- (BOOL)getNeedsPostProcessing:(BOOL *)a3 error:(id *)a4;
- (BOOL)getPostProcessingShouldBegin:(BOOL *)a3 error:(id *)a4;
- (BOOL)getShouldOverrideGatekeeperValue:(BOOL *)a3 error:(id *)a4;
- (BOOL)hasAppAssetPromise;
- (BOOL)hasInitialODRAssetPromises;
- (BOOL)hasInstallOptions;
- (BOOL)hasPlaceholderPromise;
- (BOOL)hasUserDataPromise;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaused:(BOOL *)a3 withError:(id *)a4;
- (BOOL)isRegisteredWithDaemon;
- (BOOL)pauseWithError:(id *)a3;
- (BOOL)prioritizeWithError:(id *)a3;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)setAppAssetPromise:(id)a3 error:(id *)a4;
- (BOOL)setAppAssetPromiseResponsibleClient:(unint64_t)a3 error:(id *)a4;
- (BOOL)setAppQuitPromise:(id)a3 error:(id *)a4;
- (BOOL)setDeviceSecurityPromise:(id)a3 error:(id *)a4;
- (BOOL)setEssentialAssetPromises:(id)a3 error:(id *)a4;
- (BOOL)setImportance:(unint64_t)a3 error:(id *)a4;
- (BOOL)setInitialODRAssetPromises:(id)a3 error:(id *)a4;
- (BOOL)setInstallOptions:(id)a3 error:(id *)a4;
- (BOOL)setInstallTargetDirectoryURL:(id)a3 error:(id *)a4;
- (BOOL)setManagedInstallUUID:(id)a3 error:(id *)a4;
- (BOOL)setNeedsPostProcessing:(BOOL)a3 error:(id *)a4;
- (BOOL)setPlaceholderDisposition:(unint64_t)a3 error:(id *)a4;
- (BOOL)setPlaceholderPromise:(id)a3 error:(id *)a4;
- (BOOL)setPreparationPromise:(id)a3 withError:(id *)a4;
- (BOOL)setProgressHint:(id)a3 withError:(id *)a4;
- (BOOL)setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 error:(id *)a5;
- (BOOL)setShouldOverrideGatekeeper:(BOOL)a3 error:(id *)a4;
- (BOOL)setTargetBundleURL:(id)a3 error:(id *)a4;
- (BOOL)setTargetBundleURL:(id)a3 preservingTargetBundleNameOnUpdate:(BOOL)a4 error:(id *)a5;
- (BOOL)setUserDataPromise:(id)a3 error:(id *)a4;
- (IXAppInstallCoordinator)initWithSeed:(id)a3;
- (IXAppInstallCoordinatorObserver)observer;
- (IXAppInstallCoordinatorSeed)seed;
- (IXApplicationIdentity)identity;
- (LSApplicationRecord)completedApplicationRecord;
- (NSError)error;
- (NSString)bundleID;
- (NSString)description;
- (NSString)descriptionWithRemoteState;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)observerCalloutQueue;
- (id)appAssetPromiseWithError:(id *)a3;
- (id)appQuitPromiseWithError:(id *)a3;
- (id)deviceSecurityPromiseWithError:(id *)a3;
- (id)essentialAssetPromisesWithError:(id *)a3;
- (id)initialODRAssetPromisesWithError:(id *)a3;
- (id)installOptionsWithError:(id *)a3;
- (id)installTargetDirectoryURLWithError:(id *)a3;
- (id)managedInstallUUIDWithError:(id *)a3;
- (id)placeholderPromiseWithError:(id *)a3;
- (id)preparationPromiseWithError:(id *)a3;
- (id)progressHintWithError:(id *)a3;
- (id)targetBundleURLWithError:(id *)a3;
- (id)userDataPromiseWithError:(id *)a3;
- (id)userDataRestoreShouldBegin:(BOOL *)a3;
- (unint64_t)appAssetPromiseResponsibleClientWithError:(id *)a3;
- (unint64_t)coordinationState;
- (unint64_t)creatorIdentifier;
- (unint64_t)errorSourceIdentifier;
- (unint64_t)hash;
- (unint64_t)importanceWithError:(id *)a3;
- (unint64_t)observersCalled;
- (unint64_t)placeholderDispositionWithError:(id *)a3;
- (unint64_t)removabilityWithError:(id *)a3;
- (unsigned)coordinatorScopeWithError:(id *)a3;
- (unsigned)creatorEUID;
- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4;
- (void)_clientDelegate_didCompleteForApplicationRecord:(id)a3;
- (void)_clientDelegate_didRegisterForObservation;
- (void)_clientDelegate_didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5;
- (void)_clientDelegate_placeholderDidInstallForApplicationRecord:(id)a3;
- (void)_clientDelegate_promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3;
- (void)_clientDelegate_shouldBeginPostProcessingForApplicationRecord:(id)a3;
- (void)_clientDelegate_shouldBeginRestoringUserData;
- (void)_clientDelegate_shouldPause;
- (void)_clientDelegate_shouldPrioritize;
- (void)_clientDelegate_shouldResume;
- (void)_conveyCurrentPriorityBoostReplacingExisting:(BOOL)a3;
- (void)_onObserverCalloutQueue_handleObserverForCompletedCoordinator:(id)a3 completedApplicationRecord:(id)a4 error:(id)a5 client:(unint64_t)a6;
- (void)_updateInitWithSeed:(id)a3 notifyDaemon:(BOOL)a4;
- (void)cancelForReason:(id)a3;
- (void)dealloc;
- (void)setComplete:(BOOL)a3;
- (void)setComplete:(BOOL)a3 forApplicationRecord:(id)a4;
- (void)setError:(id)a3;
- (void)setErrorSourceIdentifier:(unint64_t)a3;
- (void)setIsRegisteredWithDaemon:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setObserversCalled:(unint64_t)a3;
@end

@implementation IXAppInstallCoordinator

- (IXAppInstallCoordinator)initWithSeed:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXAppInstallCoordinator;
  v6 = [(IXAppInstallCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_seed, a3);
  }

  return v7;
}

- (OS_dispatch_queue)observerCalloutQueue
{
  if (observerCalloutQueue_onceToken != -1) {
    dispatch_once(&observerCalloutQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)observerCalloutQueue_sObserverCalloutQueue;

  return (OS_dispatch_queue *)v2;
}

void __47__IXAppInstallCoordinator_observerCalloutQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.installcoordination.coordinator_observer", v2);
  v1 = (void *)observerCalloutQueue_sObserverCalloutQueue;
  observerCalloutQueue_sObserverCalloutQueue = (uint64_t)v0;
}

- (OS_dispatch_queue)internalQueue
{
  if (internalQueue_onceToken != -1) {
    dispatch_once(&internalQueue_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)internalQueue_sInternalQueue;

  return (OS_dispatch_queue *)v2;
}

void __40__IXAppInstallCoordinator_internalQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.installcoordination.coordinator_internal", v2);
  v1 = (void *)internalQueue_sInternalQueue;
  internalQueue_sInternalQueue = (uint64_t)v0;
}

- (void)_conveyCurrentPriorityBoostReplacingExisting:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v5 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v6 = +[IXServerConnection sharedConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke;
  v13[3] = &unk_1E5D17118;
  objc_copyWeak(&v15, &location);
  id v7 = v5;
  id v14 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_7;
  v10[3] = &unk_1E5D17118;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:conveyPriorityReplacingExisting:withCompletion:", v9, v3, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315906;
    v8 = "-[IXAppInstallCoordinator _conveyCurrentPriorityBoostReplacingExisting:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = WeakRetained;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to convey priority boost for coordinator UUID %@ : %@ : %@", (uint8_t *)&v7, 0x2Au);
  }
}

void __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315906;
      __int16 v9 = "-[IXAppInstallCoordinator _conveyCurrentPriorityBoostReplacingExisting:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = WeakRetained;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_ERROR, "%s: Got error in priority boost conveyance completion block for coordinator UUID %@ : %@ : %@", (uint8_t *)&v8, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_7_cold_1();
  }
}

- (void)_updateInitWithSeed:(id)a3 notifyDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (IXAppInstallCoordinatorSeed *)a3;
  if (![(IXAppInstallCoordinatorSeed *)v6 creator]
    || ([(IXAppInstallCoordinatorSeed *)v6 uniqueIdentifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    int v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    uint64_t v10 = [(IXAppInstallCoordinatorSeed *)v6 creator];
    uint64_t v11 = [(IXAppInstallCoordinatorSeed *)v6 uniqueIdentifier];
    [v8 raise:v9, @"Expected client and uniqueID to be initialized but instead got %lu %@", v10, v11 format];
  }
  seed = self->_seed;
  self->_seed = v6;
  id v13 = v6;

  id v14 = +[IXServerConnection sharedConnection];

  [v14 registerAppInstallCoordinatorForUpdates:self notifyDaemon:v4];
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_DEBUG, "%s: %@: Skipping unregistering with daemon because not currently registered", (uint8_t *)v1, 0x16u);
}

+ (void)setSkipIntentValidation:(BOOL)a3
{
  gSkipIntentValidation = a3;
}

+ (BOOL)skipIntentValidation
{
  return gSkipIntentValidation;
}

+ (BOOL)modifiesLocalLaunchServicesDatabase
{
  return 1;
}

+ (unint64_t)intent
{
  return 0;
}

+ (void)_validatePreconditionForIntent:(unint64_t)a3 matchesCurrentInstallStateForBundleID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a4;
  if (![a1 skipIntentValidation])
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
    uint64_t v7 = v9;
    if (v9)
    {
      uint64_t v10 = NSString;
      uint64_t v11 = [v9 applicationState];
      int v12 = [v11 isInstalled];
      int v13 = [v7 isPlaceholder];
      int v14 = [v7 hasParallelPlaceholder];
      uint64_t v15 = 78;
      if (v14) {
        uint64_t v16 = 89;
      }
      else {
        uint64_t v16 = 78;
      }
      if (v13) {
        uint64_t v17 = 89;
      }
      else {
        uint64_t v17 = 78;
      }
      if (v12) {
        uint64_t v15 = 89;
      }
      objc_msgSend(v10, "stringWithFormat:", @"isInstalled:%c isPlaceholder:%c hasParallelPlaceholder:%c", v15, v17, v16);
      int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v8 = @"No record found";
    }
    switch(a3)
    {
      case 1uLL:
      case 3uLL:
      case 4uLL:
        if (v7 && ([v7 isPlaceholder] & 1) == 0)
        {
          v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
            goto LABEL_36;
          }
          _StringForIXCoordinatorIntent(a3);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v22 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
          __int16 v23 = 2112;
          v24 = v19;
          __int16 v25 = 2112;
          v26 = v6;
          __int16 v27 = 2112;
          v28 = v8;
          v20 = "%s: Warning: client is attempting to create a coordinator of type %@ for %@, but the app is already installed! (%@)";
          goto LABEL_27;
        }
        break;
      case 2uLL:
      case 6uLL:
        if (!v7 || [v7 isPlaceholder])
        {
          v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            _StringForIXCoordinatorIntent(a3);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v22 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
            __int16 v23 = 2112;
            v24 = v19;
            __int16 v25 = 2112;
            v26 = v6;
            __int16 v27 = 2112;
            v28 = v8;
            v20 = "%s: Warning: client is attempting to create a coordinator of type %@ for %@, but the app is not curren"
                  "tly installed! (%@)";
LABEL_27:
            _os_log_fault_impl(&dword_1A7B2D000, v18, OS_LOG_TYPE_FAULT, v20, buf, 0x2Au);
          }
          goto LABEL_36;
        }
        break;
      case 5uLL:
        if (!v7)
        {
          v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
            +[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]();
          }
          goto LABEL_36;
        }
        if (([v7 isPlaceholder] & 1) == 0)
        {
          v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
            +[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]((uint64_t)v6, (uint64_t)v8, v18);
          }
          goto LABEL_36;
        }
        break;
      case 7uLL:
        goto LABEL_37;
      default:
        v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          +[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:](a3, v18);
        }
LABEL_36:

        break;
    }
    goto LABEL_37;
  }
  uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", a3);
      int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v8 = off_1E5D17AB8[a3];
    }
    *(_DWORD *)buf = 136315650;
    v22 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
    __int16 v23 = 2112;
    v24 = v6;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Skipping intent validation for bundle ID %@ with intent %@", buf, 0x20u);
LABEL_37:
  }
}

+ (id)_coordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 intent:(unint64_t)a6 createIfNotExisting:(BOOL)a7 requireMatchingIntent:(BOOL)a8 scopeRequirement:(unsigned __int8)a9 created:(BOOL *)a10 error:(id *)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  if (!v17)
  {
    __int16 v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]();
    }

    uint64_t v27 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]", 273, @"IXErrorDomain", 4uLL, 0, 0, @"Expected a non-nil application identity", v26, v37);
    v19 = 0;
    v20 = 0;
    v28 = (void *)v43[5];
    v43[5] = v27;
    goto LABEL_13;
  }
  v18 = +[IXServerConnection sharedConnection];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke;
  v41[3] = &unk_1E5D17140;
  v41[4] = &v48;
  v41[5] = &v42;
  v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v41];

  if (!v19)
  {
    v20 = 0;
    goto LABEL_15;
  }
  v20 = objc_opt_new();
  [v20 setCreator:a5];
  [v20 setIntent:a6];
  [v20 setIdentity:v17];
  [v20 setInstallationDomain:a4];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_24;
  v39[3] = &unk_1E5D17168;
  v39[4] = &v42;
  v39[5] = &v48;
  BOOL v40 = v11;
  v39[6] = &v56;
  v39[7] = &v52;
  v39[8] = a6;
  objc_msgSend(v19, "_remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:", v20, v12, v11, a9, v39);
  if (*((unsigned char *)v49 + 24)) {
    goto LABEL_15;
  }
  if (*((unsigned char *)v53 + 24))
  {
    v21 = [v17 bundleID];
    [a1 _validatePreconditionForIntent:a6 matchesCurrentInstallStateForBundleID:v21];
  }
  v22 = (objc_class *)objc_msgSend(a1, "classForIntent:", objc_msgSend((id)v57[5], "intent"));
  if (!v22)
  {
    v30 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      _StringForIXCoordinatorIntent([(id)v57[5] intent]);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = [(id)v57[5] identity];
      +[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:](v31, v32, v62);
    }

    unint64_t v33 = [(id)v57[5] intent];
    if (v33 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E5D17AB8[v33];
    }
    v38 = [(id)v57[5] identity];
    uint64_t v36 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]", 321, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to find class for coordinator intent %@ for coordinator %@", v35, (uint64_t)v34);

    v28 = (void *)v43[5];
    v43[5] = v36;
LABEL_13:

    goto LABEL_15;
  }
  id v23 = objc_alloc_init(v22);
  v24 = v23;
  if (v23)
  {
    [v23 _updateInitWithSeed:v57[5] notifyDaemon:0];
    [v24 _conveyCurrentPriorityBoostReplacingExisting:*((unsigned __int8 *)v53 + 24)];
    [v24 setIsRegisteredWithDaemon:1];
    if (a10) {
      *a10 = *((unsigned char *)v53 + 24);
    }
    goto LABEL_17;
  }
LABEL_15:
  v24 = 0;
  if (a11) {
    *a11 = (id) v43[5];
  }
LABEL_17:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v24;
}

void __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:create"
         "IfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_24(uint64_t a1, void *a2, char a3, void *a4)
{
  id v8 = a2;
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (*(unsigned char *)(a1 + 72) && (uint64_t v10 = *(void *)(a1 + 64), v10 != [v8 intent]))
  {
    uint64_t v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_24_cold_1(a1 + 64, v8);
    }

    uint64_t v12 = *(void *)(a1 + 64);
    [v8 intent];
    uint64_t v14 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]_block_invoke", 299, @"IXErrorDomain", 1uLL, 0, 0, @"Expected to create coordinator with intent %lu but created object had intent %lu", v13, v12);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  }
}

+ (id)coordinatorForAppWithBundleID:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v13 = [(id)objc_opt_class() intent];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v12];
    LOBYTE(v22) = 2;
    uint64_t v16 = [a1 _coordinatorForAppWithIdentity:v15 targetingInstallationDomain:1 withClientID:a4 intent:v14 createIfNotExisting:v9 requireMatchingIntent:1 scopeRequirement:v22 created:a6 error:a7];
  }
  else
  {
    id v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]();
    }

    v19 = _CreateError((uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]", 354, @"IXErrorDomain", 4uLL, 0, 0, @"%s must be called on a concrete subclass, not the abstract superclass", v18, (uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]");
    v20 = v19;
    if (a7) {
      *a7 = v19;
    }

    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)existingCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v6];

  id v8 = [a1 existingCoordinatorForAppWithIdentity:v7 error:a4];

  return v8;
}

+ (id)coordinatorForAppWithIdentity:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return (id)[a1 coordinatorForAppWithIdentity:a3 targetingInstallationDomain:1 withClientID:a4 createIfNotExisting:a5 created:a6 error:a7];
}

+ (id)coordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 createIfNotExisting:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  uint64_t v15 = [(id)objc_opt_class() intent];
  if (v15)
  {
    LOBYTE(v22) = 2;
    uint64_t v16 = [a1 _coordinatorForAppWithIdentity:v14 targetingInstallationDomain:a4 withClientID:a5 intent:v15 createIfNotExisting:v10 requireMatchingIntent:1 scopeRequirement:v22 created:a7 error:a8];
  }
  else
  {
    id v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]();
    }

    v19 = _CreateError((uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]", 380, @"IXErrorDomain", 4uLL, 0, 0, @"%s must be called on concrete subclasses, not the abstract superclass", v18, (uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]");
    v20 = v19;
    if (a8) {
      *a8 = v19;
    }

    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)processScopedCoordinatorForAppWithIdentity:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return (id)[a1 processScopedCoordinatorForAppWithIdentity:a3 targetingInstallationDomain:1 withClientID:a4 createIfNotExisting:a5 created:a6 error:a7];
}

+ (id)processScopedCoordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 createIfNotExisting:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  uint64_t v15 = [(id)objc_opt_class() intent];
  if (v15)
  {
    LOBYTE(v22) = 1;
    uint64_t v16 = [a1 _coordinatorForAppWithIdentity:v14 targetingInstallationDomain:a4 withClientID:a5 intent:v15 createIfNotExisting:v10 requireMatchingIntent:1 scopeRequirement:v22 created:a7 error:a8];
  }
  else
  {
    id v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]();
    }

    v19 = _CreateError((uint64_t)"+[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]", 399, @"IXErrorDomain", 4uLL, 0, 0, @"%s must be called on a concrete subclass, not the abstract superclass", v18, (uint64_t)"+[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]");
    v20 = v19;
    if (a8) {
      *a8 = v19;
    }

    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)existingCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(id)objc_opt_class() intent] != 0;
  LOBYTE(v10) = 0;
  id v8 = objc_msgSend(a1, "_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:", v6, 1, 0, objc_msgSend((id)objc_opt_class(), "intent"), 0, v7, v10, 0, a4);

  return v8;
}

+ (BOOL)enumerateCoordinatorsWithBlock:(id)a3 error:(id *)a4
{
  return [a1 enumerateCoordinatorsWithError:a4 usingBlock:a3];
}

+ (BOOL)enumerateCoordinatorsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = objc_msgSend(a1, "_synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:", objc_msgSend((id)objc_opt_class(), "intent"), a3, v6);

  return (char)a3;
}

+ (void)enumerateCoordinatorsUsingBlock:(id)a3
{
  id v4 = a3;
  objc_msgSend(a1, "_asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:", objc_msgSend((id)objc_opt_class(), "intent"), v4);
}

+ (Class)classForIntent:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      uint64_t v5 = objc_opt_class();
      break;
    default:
      id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        id v8 = "+[IXAppInstallCoordinator classForIntent:]";
        __int16 v9 = 2048;
        unint64_t v10 = a3;
        _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: No class for intent %lu", (uint8_t *)&v7, 0x16u);
      }

      uint64_t v5 = 0;
      break;
  }

  return (Class)v5;
}

+ (void)_asynchronouslyEnumerateCoordinatorsForIntent:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  int v7 = IXQueueForConcurrentOperations();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke;
  v9[3] = &unk_1E5D17280;
  id v10 = v6;
  unint64_t v11 = a3;
  id v12 = a1;
  id v8 = v6;
  IXDispatchAsyncWithAutoreleasePool(v7, v9);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2;
  v11[3] = &unk_1E5D171B8;
  id v12 = *(id *)(a1 + 32);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v11];

  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_47;
    v7[3] = &unk_1E5D17258;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    id v8 = v3;
    objc_msgSend(v8, "_remote_fetchSeedsForCoordinatorsWithIntent:completion:", v4, v7);
  }
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke_2";
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", buf, 0x16u);
  }

  id v5 = IXQueueForConcurrentOperations();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_46;
  v8[3] = &unk_1E5D17190;
  id v6 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  IXDispatchAsyncWithAutoreleasePool(v5, v8);
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_47(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = IXQueueForConcurrentOperations();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3;
    v28[3] = &unk_1E5D17190;
    id v30 = *(id *)(a1 + 40);
    id v29 = v6;
    IXDispatchAsyncWithAutoreleasePool(v7, v28);

    id v8 = v30;
  }
  else if ([v5 count])
  {
    id v9 = (void *)[v5 mutableCopy];
    uint64_t v20 = 0;
    v21 = (id *)&v20;
    uint64_t v22 = 0x3042000000;
    id v23 = __Block_byref_object_copy__48;
    v24 = __Block_byref_object_dispose__49;
    id v25 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50;
    v14[3] = &unk_1E5D17230;
    uint64_t v18 = &v20;
    id v17 = *(id *)(a1 + 40);
    id v8 = v9;
    uint64_t v10 = *(void *)(a1 + 48);
    id v15 = v8;
    uint64_t v19 = v10;
    id v16 = *(id *)(a1 + 32);
    unint64_t v11 = (void *)[v14 copy];
    objc_storeWeak(v21 + 5, v11);
    id v12 = IXQueueForConcurrentOperations();
    IXDispatchAsyncWithAutoreleasePool(v12, v11);

    _Block_object_dispose(&v20, 8);
    objc_destroyWeak(&v25);
  }
  else
  {
    __int16 v13 = IXQueueForConcurrentOperations();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4;
    v26[3] = &unk_1E5D16FA0;
    id v27 = *(id *)(a1 + 40);
    IXDispatchAsyncWithAutoreleasePool(v13, v26);

    id v8 = v27;
  }
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) lastObject];
    if (v3)
    {
      [*(id *)(a1 + 32) removeLastObject];
      uint64_t v4 = (objc_class *)objc_msgSend(*(id *)(a1 + 64), "classForIntent:", objc_msgSend(v3, "intent"));
      if (v4)
      {
        id v5 = (id)[[v4 alloc] initWithSeed:v3];
        if (v5)
        {
          id v6 = *(void **)(a1 + 40);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3_64;
          v34[3] = &unk_1E5D17208;
          id v35 = v3;
          id v7 = *(id *)(a1 + 48);
          uint64_t v8 = *(void *)(a1 + 64);
          id v38 = v7;
          uint64_t v40 = v8;
          id v5 = v5;
          id v36 = v5;
          id v37 = *(id *)(a1 + 32);
          id v39 = WeakRetained;
          objc_msgSend(v6, "_remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:", v35, 0, 1, 0, v34);

          id v9 = v35;
        }
        else
        {
          id v23 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_4();
          }

          id v25 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 534, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create coordinator object", v24, v32);
          uint64_t v26 = IXQueueForConcurrentOperations();
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_63;
          v41[3] = &unk_1E5D17190;
          id v27 = *(id *)(a1 + 48);
          id v42 = v25;
          id v43 = v27;
          id v9 = v25;
          IXDispatchAsyncWithAutoreleasePool(v26, v41);
        }
      }
      else
      {
        uint64_t v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_3(v3);
        }

        unint64_t v21 = [v3 intent];
        if (v21 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v21);
          uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v22 = off_1E5D17AB8[v21];
        }
        unint64_t v33 = [v3 identity];
        id v29 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 525, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to find class for coordinator intent %@ for coordinator %@", v28, (uint64_t)v22);

        id v30 = IXQueueForConcurrentOperations();
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_59;
        v44[3] = &unk_1E5D17190;
        id v31 = *(id *)(a1 + 48);
        id v45 = v29;
        id v46 = v31;
        id v5 = v29;
        IXDispatchAsyncWithAutoreleasePool(v30, v44);

        id v9 = v46;
      }
    }
    else
    {
      id v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_2();
      }

      id v17 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 514, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to get next seed while enumerating install coordinators", v16, v32);
      uint64_t v18 = IXQueueForConcurrentOperations();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_58;
      v47[3] = &unk_1E5D17190;
      id v19 = *(id *)(a1 + 48);
      id v48 = v17;
      id v49 = v19;
      id v5 = v17;
      IXDispatchAsyncWithAutoreleasePool(v18, v47);

      id v9 = v49;
    }
  }
  else
  {
    uint64_t v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_1();
    }

    id v12 = _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 505, @"IXErrorDomain", 1uLL, 0, 0, @"Async enumeration block reference somehow became nil while enumerating install coordinators", v11, v32);
    __int16 v13 = IXQueueForConcurrentOperations();
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_54;
    v50[3] = &unk_1E5D17190;
    id v14 = *(id *)(a1 + 48);
    id v51 = v12;
    id v52 = v14;
    id v3 = v12;
    IXDispatchAsyncWithAutoreleasePool(v13, v50);

    id v5 = v52;
  }
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3_64(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = IXQueueForConcurrentOperations();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_65;
  v13[3] = &unk_1E5D171E0;
  id v14 = v8;
  id v15 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 56);
  char v22 = a3;
  uint64_t v21 = *(void *)(a1 + 72);
  id v19 = v10;
  id v16 = v7;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 64);
  id v11 = v7;
  id v12 = v8;
  IXDispatchAsyncWithAutoreleasePool(v9, v13);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_65(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 domain];
    if ([v3 isEqualToString:@"IXErrorDomain"])
    {
      uint64_t v4 = [*(id *)(a1 + 32) code];

      if (v4 == 5)
      {
        id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = [*(id *)(a1 + 40) identity];
          *(_DWORD *)buf = 136315394;
          id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke_4";
          __int16 v31 = 2112;
          uint64_t v32 = v6;
          id v7 = "%s: When enumerating coordinators, existing coordinator for %@ had a different intent than expected (likely recreated)";
LABEL_15:
          _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);
LABEL_26:

          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else
    {
    }
    __int16 v13 = [*(id *)(a1 + 32) domain];
    if ([v13 isEqualToString:@"IXErrorDomain"])
    {
      uint64_t v14 = [*(id *)(a1 + 32) code];

      if (v14 == 6)
      {
        id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = [*(id *)(a1 + 40) identity];
          *(_DWORD *)buf = 136315394;
          id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
          __int16 v31 = 2112;
          uint64_t v32 = v6;
          id v7 = "%s: When enumerating coordinators, coordinator for %@ no longer existed when we tried to fetch it";
          goto LABEL_15;
        }
LABEL_27:

LABEL_28:
        if ([*(id *)(a1 + 64) count])
        {
          id v27 = IXQueueForConcurrentOperations();
          IXDispatchAsyncWithAutoreleasePool(v27, *(void **)(a1 + 80));

          return;
        }
        id v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
          _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, "%s: Enumeration complete; calling client block to signal",
            buf,
            0xCu);
        }
        goto LABEL_32;
      }
    }
    else
    {
    }
    id v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [*(id *)(a1 + 40) identity];
      id v17 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, got unexpected error when trying to fetch coordinator for %@ : %@", buf, 0x20u);
    }
LABEL_32:

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    return;
  }
  if (*(unsigned char *)(a1 + 96))
  {
    id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_65_cold_1(a1, v8);
    }

    id v9 = [*(id *)(a1 + 40) identity];
    _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 560, @"IXErrorDomain", 1uLL, 0, 0, @"Unexpectedly created coordinator for %@ while enumerating; canceling it",
      v10,
    id v5 = (uint64_t)v9);

    id v11 = objc_opt_class();
    id v12 = [*(id *)(a1 + 40) identity];
    [v11 cancelCoordinatorForAppWithIdentity:v12 withReason:v5 client:15 error:0];

    goto LABEL_27;
  }
  id v18 = [*(id *)(a1 + 48) uniqueIdentifier];
  id v19 = [*(id *)(a1 + 40) uniqueIdentifier];
  char v20 = [v18 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) identity];
      id v25 = [*(id *)(a1 + 48) uniqueIdentifier];
      uint64_t v26 = [*(id *)(a1 + 40) uniqueIdentifier];
      *(_DWORD *)buf = 136315906;
      id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v6;
      __int16 v33 = 2112;
      v34 = v25;
      __int16 v35 = 2112;
      id v36 = v26;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Got back a different coordinator for %@ than fetched originally; got %@ expected %@ (likely recreated in the meantime)",
        buf,
        0x2Au);

      goto LABEL_26;
    }
    goto LABEL_27;
  }
  [*(id *)(a1 + 56) _updateInitWithSeed:*(void *)(a1 + 48) notifyDaemon:0];
  uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    char v22 = [*(id *)(a1 + 56) bundleID];
    unint64_t v23 = [*(id *)(a1 + 48) intent];
    if (v23 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v23);
      uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = off_1E5D17AB8[v23];
    }
    *(_DWORD *)buf = 136315650;
    id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1A7B2D000, v21, OS_LOG_TYPE_DEFAULT, "%s: Enumeration is calling client block with coordinator for %@ intent %@", buf, 0x20u);
  }
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))()) {
    goto LABEL_28;
  }
  uint64_t v28 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
    _os_log_impl(&dword_1A7B2D000, v28, OS_LOG_TYPE_DEFAULT, "%s: Client returned NO from enumeration block so we're stopping", buf, 0xCu);
  }
}

+ (BOOL)_synchronouslyEnumerateCoordinatorsForIntent:(unint64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v45 = (uint64_t (**)(id, void *))a5;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy_;
  v66 = __Block_byref_object_dispose_;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  id v6 = +[IXServerConnection sharedConnection];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke;
  v55[3] = &unk_1E5D172A8;
  v55[4] = &v62;
  id v46 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v55];

  if (!v46
    || (v54[0] = MEMORY[0x1E4F143A8],
        v54[1] = 3221225472,
        v54[2] = __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke_70,
        v54[3] = &unk_1E5D172D0,
        v54[4] = &v62,
        v54[5] = &v56,
        objc_msgSend(v46, "_remote_fetchSeedsForCoordinatorsWithIntent:completion:", a3, v54),
        v63[5]))
  {
LABEL_3:
    LOBYTE(v7) = 0;
    if (a4) {
      *a4 = (id) v63[5];
    }
    goto LABEL_49;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)v57[5];
  uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v76 count:16];
  if (!v8)
  {
LABEL_43:

    goto LABEL_46;
  }
  uint64_t v47 = *(void *)v51;
LABEL_8:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v51 != v47) {
      objc_enumerationMutation(obj);
    }
    id v9 = *(void **)(*((void *)&v50 + 1) + 8 * v7);
    uint64_t v10 = (void *)MEMORY[0x1AD0D4670]();
    id v11 = [v9 identity];
    uint64_t v12 = [v9 installationDomain];
    uint64_t v13 = [v9 creator];
    uint64_t v14 = [v9 intent];
    id v49 = 0;
    LOBYTE(v42) = 0;
    id v15 = [a1 _coordinatorForAppWithIdentity:v11 targetingInstallationDomain:v12 withClientID:v13 intent:v14 createIfNotExisting:0 requireMatchingIntent:1 scopeRequirement:v42 created:0 error:&v49];
    id v16 = (__CFString *)v49;

    if (!v15)
    {
      id v25 = [(__CFString *)v16 domain];
      if ([v25 isEqualToString:@"IXErrorDomain"])
      {
        BOOL v26 = [(__CFString *)v16 code] == 5;

        if (v26)
        {
          char v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v9 identity];
            *(_DWORD *)buf = 136315394;
            v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
            __int16 v70 = 2112;
            v71 = v27;
            _os_log_impl(&dword_1A7B2D000, v20, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, existing coordinator for %@ had a different intent than expected (likely recreated)", buf, 0x16u);
          }
          goto LABEL_22;
        }
      }
      else
      {
      }
      __int16 v33 = [(__CFString *)v16 domain];
      if (![v33 isEqualToString:@"IXErrorDomain"])
      {

LABEL_29:
        id v36 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = [v9 identity];
          *(_DWORD *)buf = 136315650;
          v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
          __int16 v70 = 2112;
          v71 = v37;
          __int16 v72 = 2112;
          v73 = v16;
          _os_log_impl(&dword_1A7B2D000, v36, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, got unexpected error when trying to fetch coordinator for %@ : %@", buf, 0x20u);
        }
        id v38 = v63;
        id v39 = v16;
        int v32 = 0;
        char v20 = v38[5];
        v38[5] = (uint64_t)v39;
        int v31 = 2;
        goto LABEL_39;
      }
      BOOL v34 = [(__CFString *)v16 code] == 6;

      if (!v34) {
        goto LABEL_29;
      }
      char v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = [v9 identity];
        *(_DWORD *)buf = 136315394;
        v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
        __int16 v70 = 2112;
        v71 = v35;
        _os_log_impl(&dword_1A7B2D000, v20, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, coordinator for %@ no longer existed when we tried to fetch it", buf, 0x16u);
      }
      goto LABEL_22;
    }
    id v17 = [v15 uniqueIdentifier];
    id v18 = [v9 uniqueIdentifier];
    int v19 = [v17 isEqual:v18];

    char v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (!v19)
    {
      if (v21)
      {
        uint64_t v28 = [v9 identity];
        id v29 = [v15 uniqueIdentifier];
        id v30 = [v9 uniqueIdentifier];
        *(_DWORD *)buf = 136315906;
        v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
        __int16 v70 = 2112;
        v71 = v28;
        __int16 v72 = 2112;
        v73 = v29;
        __int16 v74 = 2112;
        v75 = v30;
        _os_log_impl(&dword_1A7B2D000, v20, OS_LOG_TYPE_DEFAULT, "%s: Got back a different coordinator for %@ than fetched originally; got %@ expected %@ (likely recreated in the meantime)",
          buf,
          0x2Au);
      }
LABEL_22:
      int v31 = 0;
      int v32 = 1;
      goto LABEL_39;
    }
    if (v21)
    {
      char v22 = [v15 bundleID];
      unint64_t v23 = [v9 intent];
      if (v23 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown intent value %lu", v23);
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v24 = off_1E5D17AB8[v23];
      }
      *(_DWORD *)buf = 136315650;
      v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
      __int16 v70 = 2112;
      v71 = v22;
      __int16 v72 = 2112;
      v73 = v24;
      _os_log_impl(&dword_1A7B2D000, v20, OS_LOG_TYPE_DEFAULT, "%s: Enumeration is calling client block with coordinator for %@ intent %@", buf, 0x20u);
    }
    if (v45[2](v45, v15))
    {
      int v31 = 0;
      int v32 = 1;
      goto LABEL_40;
    }
    char v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
      _os_log_impl(&dword_1A7B2D000, v20, OS_LOG_TYPE_DEFAULT, "%s: Client returned NO from enumeration block so we're stopping", buf, 0xCu);
    }
    int v32 = 0;
    int v31 = 3;
LABEL_39:

LABEL_40:
    if (!v32) {
      break;
    }
    if (v8 == ++v7)
    {
      uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v76 count:16];
      if (v8) {
        goto LABEL_8;
      }
      goto LABEL_43;
    }
  }

  if (v31 == 2) {
    goto LABEL_3;
  }
  if (v31 == 3)
  {
LABEL_46:
    uint64_t v40 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
      _os_log_impl(&dword_1A7B2D000, v40, OS_LOG_TYPE_DEFAULT, "%s: Enumeration complete", buf, 0xCu);
    }

    LOBYTE(v7) = 1;
  }
LABEL_49:

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v7 & 1;
}

void __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    int v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    int v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  const char *v7 = v9;
}

+ (BOOL)cancelCoordinatorForAppWithBundleID:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v11];

  LOBYTE(a6) = [a1 cancelCoordinatorForAppWithIdentity:v12 withReason:v10 client:a5 error:a6];
  return (char)a6;
}

+ (void)cancelCoordinatorForAppWithBundleID:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v12];

  [a1 cancelCoordinatorForAppWithIdentity:v13 withReason:v11 client:a5 completion:v10];
}

+ (BOOL)cancelCoordinatorForAppWithIdentity:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v11 = _CheckCancelRequestSanity(v10, a5);
  id v12 = (void *)v21[5];
  v21[5] = v11;

  uint64_t v13 = (void *)v21[5];
  if (v13)
  {
    BOOL v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = +[IXServerConnection sharedConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke;
    v19[3] = &unk_1E5D172A8;
    v19[4] = &v20;
    id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v19];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke_71;
    v18[3] = &unk_1E5D172F8;
    v18[4] = &v20;
    objc_msgSend(v16, "_remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:", v9, v10, a5, v18);

    uint64_t v13 = (void *)v21[5];
    BOOL v14 = v13 == 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if (!v14) {
    *a6 = v13;
  }
LABEL_7:
  _Block_object_dispose(&v20, 8);

  return v14;
}

void __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "+[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:withReason:client:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke_71(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2)
  {
    id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v6 acquireDatabase];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

+ (void)cancelCoordinatorForAppWithIdentity:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void *))a6;
  id v12 = _CheckCancelRequestSanity(v10, a5);
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    uint64_t v13 = +[IXServerConnection sharedConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke;
    v18[3] = &unk_1E5D171B8;
    BOOL v14 = v11;
    int v19 = v14;
    id v15 = [v13 remoteObjectProxyWithErrorHandler:v18];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke_74;
    v16[3] = &unk_1E5D17320;
    id v17 = v14;
    objc_msgSend(v15, "_remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:", v9, v10, a5, v16);
  }
}

void __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:withReason:client:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke_74(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (!v6 && a2)
  {
    int v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 acquireDatabase];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)cancelCoordinatorsForAppsWithBundleIDs:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v11 = +[IXApplicationIdentity identitiesForBundleIdentifiers:a3];
  LOBYTE(a6) = [a1 cancelCoordinatorsForAppsWithApplicationIdentities:v11 withReason:v10 client:a5 error:a6];

  return (char)a6;
}

+ (void)cancelCoordinatorsForAppsWithBundleIDs:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = +[IXApplicationIdentity identitiesForBundleIdentifiers:a3];
  [a1 cancelCoordinatorsForAppsWithApplicationIdentities:v12 withReason:v11 client:a5 completion:v10];
}

+ (BOOL)cancelCoordinatorsForAppsWithApplicationIdentities:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v11 = _CheckCancelRequestSanity(v10, a5);
  id v12 = (void *)v21[5];
  v21[5] = v11;

  uint64_t v13 = (void *)v21[5];
  if (v13)
  {
    BOOL v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = +[IXServerConnection sharedConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke;
    v19[3] = &unk_1E5D172A8;
    v19[4] = &v20;
    id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v19];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke_75;
    v18[3] = &unk_1E5D172F8;
    void v18[4] = &v20;
    objc_msgSend(v16, "_remote_cancelCoordinatorsForAppsWithIdentities:reason:client:completion:", v9, v10, a5, v18);

    uint64_t v13 = (void *)v21[5];
    BOOL v14 = v13 == 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if (!v14) {
    *a6 = v13;
  }
LABEL_7:
  _Block_object_dispose(&v20, 8);

  return v14;
}

void __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator cancelCoordinatorsForAppsWithApplicationIdentities:withReason:client:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke_75(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2)
  {
    id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v6 acquireDatabase];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

+ (void)cancelCoordinatorsForAppsWithApplicationIdentities:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void *))a6;
  id v12 = _CheckCancelRequestSanity(v10, a5);
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    uint64_t v13 = +[IXServerConnection sharedConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke;
    v18[3] = &unk_1E5D171B8;
    BOOL v14 = v11;
    int v19 = v14;
    id v15 = [v13 remoteObjectProxyWithErrorHandler:v18];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke_76;
    v16[3] = &unk_1E5D17320;
    id v17 = v14;
    objc_msgSend(v15, "_remote_cancelCoordinatorsForAppsWithIdentities:reason:client:completion:", v9, v10, a5, v16);
  }
}

void __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator cancelCoordinatorsForAppsWithApplicationIdentities:withReason:client:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke_76(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (!v6 && a2)
  {
    int v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 acquireDatabase];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)pauseCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int16 v7 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v6];

  LOBYTE(a4) = [a1 pauseCoordinatorForAppWithIdentity:v7 error:a4];
  return (char)a4;
}

+ (void)pauseCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v7];

  [a1 pauseCoordinatorForAppWithIdentity:v8 completion:v6];
}

+ (BOOL)pauseCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v6 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke;
  v12[3] = &unk_1E5D172A8;
  v12[4] = &v13;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke_77;
  v11[3] = &unk_1E5D172A8;
  void v11[4] = &v13;
  objc_msgSend(v7, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 1, v5, v11);
  id v8 = (void *)v14[5];
  if (a4 && v8)
  {
    *a4 = v8;
    id v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator pauseCoordinatorForAppWithIdentity:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke_77(uint64_t a1, void *a2)
{
}

+ (void)pauseCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[IXServerConnection sharedConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_completion___block_invoke;
  v10[3] = &unk_1E5D171B8;
  id v11 = v5;
  id v8 = v5;
  __int16 v9 = [v7 remoteObjectProxyWithErrorHandler:v10];

  objc_msgSend(v9, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 1, v6, v8);
}

void __73__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator pauseCoordinatorForAppWithIdentity:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)resumeCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int16 v7 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v6];

  LOBYTE(a4) = [a1 resumeCoordinatorForAppWithIdentity:v7 error:a4];
  return (char)a4;
}

+ (void)resumeCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v7];

  [a1 resumeCoordinatorForAppWithIdentity:v8 completion:v6];
}

+ (BOOL)resumeCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v6 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke;
  v12[3] = &unk_1E5D172A8;
  v12[4] = &v13;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke_78;
  v11[3] = &unk_1E5D172A8;
  void v11[4] = &v13;
  objc_msgSend(v7, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 0, v5, v11);
  id v8 = (void *)v14[5];
  if (a4 && v8)
  {
    *a4 = v8;
    id v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator resumeCoordinatorForAppWithIdentity:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke_78(uint64_t a1, void *a2)
{
}

+ (void)resumeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[IXServerConnection sharedConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_completion___block_invoke;
  v10[3] = &unk_1E5D171B8;
  id v11 = v5;
  id v8 = v5;
  __int16 v9 = [v7 remoteObjectProxyWithErrorHandler:v10];

  objc_msgSend(v9, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 0, v6, v8);
}

void __74__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator resumeCoordinatorForAppWithIdentity:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)prioritizeCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int16 v7 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v6];

  LOBYTE(a4) = [a1 prioritizeCoordinatorForAppWithIdentity:v7 error:a4];
  return (char)a4;
}

+ (void)prioritizeCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v7];

  [a1 prioritizeCoordinatorForAppWithIdentity:v8 completion:v6];
}

+ (BOOL)prioritizeCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v6 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke;
  v12[3] = &unk_1E5D172A8;
  v12[4] = &v13;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke_79;
  v11[3] = &unk_1E5D172F8;
  void v11[4] = &v13;
  objc_msgSend(v7, "_remote_prioritizeCoordinatorForAppWithIdentity:completion:", v5, v11);
  id v8 = (void *)v14[5];
  if (a4 && v8)
  {
    *a4 = v8;
    id v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator prioritizeCoordinatorForAppWithIdentity:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke_79(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2)
  {
    id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v6 acquireDatabase];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

+ (void)prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke;
  v13[3] = &unk_1E5D171B8;
  id v8 = v5;
  id v14 = v8;
  __int16 v9 = [v7 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke_80;
  v11[3] = &unk_1E5D17320;
  id v12 = v8;
  id v10 = v8;
  objc_msgSend(v9, "_remote_prioritizeCoordinatorForAppWithIdentity:completion:", v6, v11);
}

void __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator prioritizeCoordinatorForAppWithIdentity:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke_80(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (!v6 && a2)
  {
    int v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 acquireDatabase];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)uninstallAppWithBundleID:(id)a3 error:(id *)a4
{
  return [a1 uninstallAppWithBundleID:a3 requestUserConfirmation:0 waitForDeletion:0 error:a4];
}

+ (void)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 completion:(id)a5
{
}

+ (BOOL)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v15 = 0;
  uint64_t v11 = objc_opt_new();
  [v11 setRequestUserConfirmation:v8];
  [v11 setWaitForDeletion:v7];
  [v11 setShowArchiveOption:0];
  BOOL v13 = 0;
  if ([a1 uninstallAppWithBundleID:v10 options:v11 disposition:&v15 error:a6])
  {
    if (v15 == 1)
    {
      if (a6)
      {
        _CreateError((uint64_t)"+[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:waitForDeletion:error:]", 978, @"IXErrorDomain", 0x15uLL, 0, 0, @"User canceled the uninstall of the app with bundle ID %@", v12, (uint64_t)v10);
        BOOL v13 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 1;
    }
  }

  return v13;
}

+ (void)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 waitForDeletion:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = objc_opt_new();
  [v12 setRequestUserConfirmation:v8];
  [v12 setWaitForDeletion:v7];
  [v12 setShowArchiveOption:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__IXAppInstallCoordinator_uninstallAppWithBundleID_requestUserConfirmation_waitForDeletion_completion___block_invoke;
  v15[3] = &unk_1E5D17348;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  [a1 uninstallAppWithBundleID:v14 options:v12 completion:v15];
}

void __103__IXAppInstallCoordinator_uninstallAppWithBundleID_requestUserConfirmation_waitForDeletion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v6 = v7;
  if (a2 == 1)
  {
    id v6 = _CreateError((uint64_t)"+[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:waitForDeletion:completion:]_block_invoke", 998, @"IXErrorDomain", 0x15uLL, 0, 0, @"User canceled the uninstall of the app with bundle ID %@", v5, *(void *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)uninstallAppWithBundleID:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6 legacyProgressBlock:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v14];

  LOBYTE(a6) = [a1 uninstallAppWithIdentity:v15 options:v13 disposition:a5 error:a6 legacyProgressBlock:v12];
  return (char)a6;
}

+ (BOOL)uninstallAppWithBundleID:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6
{
  return [a1 uninstallAppWithBundleID:a3 options:a4 disposition:a5 error:a6 legacyProgressBlock:0];
}

+ (void)uninstallAppWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v10];

  [a1 uninstallAppWithIdentity:v11 options:v9 completion:v8];
}

+ (BOOL)uninstallAppWithIdentity:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6 legacyProgressBlock:(id)a7
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void *))a7;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy_;
  id v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  if (v14)
  {
    v58[1] = @"Status";
    v59[0] = &unk_1EFE06AF8;
    v58[0] = @"PercentComplete";
    uint64_t v15 = IXStatusForUninstallationProgress(50);
    v59[1] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
    v14[2](v14, v16);
  }
  id v17 = +[IXServerConnection sharedConnection];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke;
  v39[3] = &unk_1E5D172A8;
  v39[4] = &v44;
  id v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v39];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke_94;
  v35[3] = &unk_1E5D17370;
  uint64_t v37 = &v44;
  id v19 = v12;
  id v36 = v19;
  id v38 = &v40;
  objc_msgSend(v18, "_remote_uninstallAppWithIdentity:options:completion:", v19, v13, v35);

  uint64_t v20 = v41[3];
  if (v20 != 4)
  {
LABEL_6:
    if ((unint64_t)(v20 - 3) <= 1)
    {
      uint64_t v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (v41[3] == 3) {
          id v25 = @"uninstall";
        }
        else {
          id v25 = @"demotion";
        }
        *(_DWORD *)buf = 136315650;
        long long v53 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]";
        __int16 v54 = 2112;
        id v55 = v19;
        __int16 v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_1A7B2D000, v24, OS_LOG_TYPE_DEFAULT, "%s: Resyncing local LS database to ensure it knows about %@ of %@", buf, 0x20u);
      }

      BOOL v26 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v26 acquireDatabase];

      id v27 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        if (v41[3] == 3) {
          uint64_t v28 = @"uninstall";
        }
        else {
          uint64_t v28 = @"demotion";
        }
        *(_DWORD *)buf = 136315650;
        long long v53 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]";
        __int16 v54 = 2112;
        id v55 = v19;
        __int16 v56 = 2112;
        v57 = v28;
        _os_log_impl(&dword_1A7B2D000, v27, OS_LOG_TYPE_DEFAULT, "%s: Resync of local LS database complete after %@ of %@", buf, 0x20u);
      }
    }
    if (a5) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v21 = [v13 waitForDeletion];
  uint64_t v22 = (id *)(v45 + 5);
  id obj = (id)v45[5];
  int v23 = [a1 demoteAppToPlaceholderWithApplicationIdentity:v19 forReason:2 waitForDeletion:v21 ignoreRemovability:0 error:&obj];
  objc_storeStrong(v22, obj);
  if (v23)
  {
    uint64_t v20 = v41[3];
    goto LABEL_6;
  }
  v41[3] = 0;
  if (a5) {
LABEL_19:
  }
    *a5 = v41[3];
LABEL_20:
  if (v14)
  {
    v50[1] = @"Status";
    v51[0] = &unk_1EFE06B10;
    v50[0] = @"PercentComplete";
    id v29 = IXStatusForUninstallationProgress(90);
    v51[1] = v29;
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    v14[2](v14, v30);
  }
  int v31 = (void *)v45[5];
  if (a6 && v31)
  {
    *a6 = v31;
    int v31 = (void *)v45[5];
  }
  BOOL v32 = v31 == 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v32;
}

void __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke_94(void *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = (void *)a1[4];
      uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 40);
      int v12 = 136315650;
      id v13 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to uninstall bundleID:%@ with:%@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = IXStringForUninstallDisposition(*(void *)(*(void *)(a1[6] + 8) + 24));
      uint64_t v11 = a1[4];
      int v12 = 136315650;
      id v13 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from installcoordinationd for bundleID %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

+ (BOOL)uninstallAppWithIdentity:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6
{
  return [a1 uninstallAppWithIdentity:a3 options:a4 disposition:a5 error:a6 legacyProgressBlock:0];
}

+ (void)uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke;
  v20[3] = &unk_1E5D173C0;
  id v21 = v8;
  id v11 = v10;
  id v23 = v11;
  id v24 = a1;
  id v22 = v9;
  id v12 = v9;
  id v13 = v8;
  __int16 v14 = (void *)MEMORY[0x1AD0D48B0](v20);
  uint64_t v15 = +[IXServerConnection sharedConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_104;
  v18[3] = &unk_1E5D171B8;
  id v19 = v11;
  id v16 = v11;
  uint64_t v17 = [v15 remoteObjectProxyWithErrorHandler:v18];
  objc_msgSend(v17, "_remote_uninstallAppWithIdentity:options:completion:", v13, v12, v14);
}

void __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = IXStringForUninstallDisposition(a2);
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v23 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from installcoordinationd for %@", buf, 0x20u);
  }
  if (v5)
  {
    id v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_cold_1();
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  if (a2 == 3)
  {
    __int16 v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v23 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_1A7B2D000, v14, OS_LOG_TYPE_DEFAULT, "%s: Resyncing local LS database to ensure it knows about uninstall of %@", buf, 0x16u);
    }

    id v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v16 acquireDatabase];

    uint64_t v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v23 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v18;
      _os_log_impl(&dword_1A7B2D000, v17, OS_LOG_TYPE_DEFAULT, "%s: Resync of local LS database complete after uninstall of %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if (a2 != 4)
  {
LABEL_15:
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
    v10();
    goto LABEL_17;
  }
  id v11 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = [*(id *)(a1 + 40) waitForDeletion];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_103;
  v19[3] = &unk_1E5D17398;
  id v21 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 32);
  [v11 demoteAppToPlaceholderWithApplicationIdentity:v12 forReason:2 waitForDeletion:v13 ignoreRemovability:0 completion:v19];

LABEL_17:
}

uint64_t __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_103(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 136315394;
      id v11 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Resyncing local LS database to ensure it knows about demotion of %@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v7 acquireDatabase];

    uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315394;
      id v11 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Resync of local LS database complete after demotion of %@", (uint8_t *)&v10, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (BOOL)revertAppWithBundleID:(id)a3 error:(id *)a4
{
  return [a1 revertAppWithBundleID:a3 resultingApplicationRecord:0 error:a4];
}

+ (BOOL)revertAppWithBundleID:(id)a3 resultingApplicationRecord:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v8];

  LOBYTE(a5) = [a1 revertAppWithIdentity:v9 resultingApplicationRecord:a4 error:a5];
  return (char)a5;
}

+ (void)revertAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__IXAppInstallCoordinator_revertAppWithBundleID_completion___block_invoke;
  v8[3] = &unk_1E5D173E8;
  id v9 = v6;
  id v7 = v6;
  [a1 revertAppWithBundleID:a3 completionWithApplicationRecord:v8];
}

uint64_t __60__IXAppInstallCoordinator_revertAppWithBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)revertAppWithBundleID:(id)a3 completionWithApplicationRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v7];

  [a1 revertAppWithIdentity:v8 completionWithApplicationRecord:v6];
}

+ (BOOL)revertAppWithIdentity:(id)a3 resultingApplicationRecord:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v8 = +[IXServerConnection sharedConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke;
  v17[3] = &unk_1E5D172A8;
  v17[4] = &v24;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_106;
  v16[3] = &unk_1E5D17410;
  void v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v9, "_remote_revertAppWithIdentity:completion:", v7, v16);

  int v10 = (void *)v25[5];
  if (!v10)
  {
    id v11 = (void *)v19[5];
    __int16 v12 = [v7 bundleID];
    uint64_t v13 = IXApplicationRecordForRecordPromise(v11, v12);

    if (a4) {
      *a4 = v13;
    }

    int v10 = (void *)v25[5];
  }
  if (a5 && v10)
  {
    *a5 = v10;
    int v10 = (void *)v25[5];
  }
  BOOL v14 = v10 == 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_cold_1();
    }
  }
}

void __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  int v10 = *v7;
  void *v7 = v9;
}

+ (void)revertAppWithIdentity:(id)a3 completionWithApplicationRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IXServerConnection sharedConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke;
  v15[3] = &unk_1E5D171B8;
  id v8 = v6;
  id v16 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke_108;
  v12[3] = &unk_1E5D17438;
  id v13 = v5;
  id v14 = v8;
  id v10 = v5;
  id v11 = v8;
  objc_msgSend(v9, "_remote_revertAppWithIdentity:completion:", v10, v12);
}

void __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "+[IXAppInstallCoordinator revertAppWithIdentity:completionWithApplicationRecord:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke_108(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) bundleID];
    id v6 = IXApplicationRecordForRecordPromise(v7, v5);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (unint64_t)removabilityForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v6];

  unint64_t v8 = [a1 removabilityForAppWithIdentity:v7 error:a4];
  return v8;
}

+ (unint64_t)removabilityForAppWithIdentity:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v6 = IXGetUncachedRemovabilityMetadataForApp(v5, 1, 1, 0);
  unint64_t v7 = [v6 removability];
  if (v7)
  {
    unint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = IXStringForAppRemovability(v7);
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:error:]";
      __int16 v27 = 2112;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Returning locally read removability, %@, for identity:%@", buf, 0x20u);
    }
    v16[3] = v7;
  }
  else
  {
    unint64_t v7 = v16[3];
    if (!v7)
    {
      id v10 = +[IXServerConnection sharedConnection];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke;
      v14[3] = &unk_1E5D172A8;
      void v14[4] = &v19;
      id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke_109;
      v13[3] = &unk_1E5D17460;
      void v13[4] = &v19;
      v13[5] = &v15;
      objc_msgSend(v11, "_remote_removabilityForAppWithIdentity:completion:", v5, v13);

      unint64_t v7 = v16[3];
      if (a4)
      {
        if (!v7)
        {
          *a4 = (id) v20[5];
          unint64_t v7 = v16[3];
        }
      }
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unint64_t v8 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke_109(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  else
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

+ (unint64_t)removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  unint64_t v8 = IXGetUncachedRemovabilityMetadataForAppByClient(v7, a4, 1, 0);
  if (v8)
  {
    __int16 v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForAppRemovability(v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = IXStringForAppRemovabilityClient(a4);
      *(_DWORD *)buf = 136315906;
      uint64_t v28 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:byClient:error:]";
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      BOOL v32 = v11;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Returning locally read removability, %@ set by client %@, for identity:%@", buf, 0x2Au);
    }
    v18[3] = v8;
  }
  else
  {
    unint64_t v8 = v18[3];
    if (!v8)
    {
      __int16 v12 = +[IXServerConnection sharedConnection];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __73__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_error___block_invoke;
      v16[3] = &unk_1E5D172A8;
      void v16[4] = &v21;
      id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v16];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __73__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_error___block_invoke_110;
      v15[3] = &unk_1E5D17460;
      void v15[4] = &v21;
      v15[5] = &v17;
      objc_msgSend(v13, "_remote_removabilityForAppWithIdentity:byClient:completion:", v7, a4, v15);

      unint64_t v8 = v18[3];
      if (a5)
      {
        if (!v8)
        {
          *a5 = (id) v22[5];
          unint64_t v8 = v18[3];
        }
      }
    }
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __73__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unint64_t v8 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:byClient:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __73__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_error___block_invoke_110(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  else
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

+ (void)removabilityForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v7];

  [a1 removabilityForAppWithIdentity:v8 completion:v6];
}

+ (void)removabilityForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = IXQueueForConcurrentOperations();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke;
  v10[3] = &unk_1E5D17488;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  IXDispatchAsyncWithAutoreleasePool(v7, v10);
}

void __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXGetUncachedRemovabilityMetadataForApp(*(void **)(a1 + 32), 1, 1, 0);
  uint64_t v3 = [v2 removability];
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = IXStringForAppRemovability(v4);
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v13 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Returning locally read removability, %@, for %@.", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = +[IXServerConnection sharedConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke_111;
    v10[3] = &unk_1E5D171B8;
    id v11 = *(id *)(a1 + 40);
    id v9 = [v8 remoteObjectProxyWithErrorHandler:v10];

    objc_msgSend(v9, "_remote_removabilityForAppWithIdentity:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

void __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = IXQueueForConcurrentOperations();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_completion___block_invoke;
  v12[3] = &unk_1E5D174B0;
  id v14 = v8;
  unint64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  IXDispatchAsyncWithAutoreleasePool(v9, v12);
}

void __78__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXGetUncachedRemovabilityMetadataForAppByClient(*(void **)(a1 + 32), *(void *)(a1 + 48), 1, 0);
  if (v2)
  {
    unint64_t v3 = v2;
    unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = IXStringForAppRemovability(v3);
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v12 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:byClient:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Returning locally read removability, %@, for %@.", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = +[IXServerConnection sharedConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_completion___block_invoke_112;
    v9[3] = &unk_1E5D171B8;
    id v10 = *(id *)(a1 + 40);
    id v8 = [v7 remoteObjectProxyWithErrorHandler:v9];

    objc_msgSend(v8, "_remote_removabilityForAppWithIdentity:byClient:completion:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
}

void __78__IXAppInstallCoordinator_removabilityForAppWithIdentity_byClient_completion___block_invoke_112(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:byClient:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)setRemovability:(unint64_t)a3 forAppWithBundleID:(id)a4 completion:(id)a5
{
}

+ (void)setRemovability:(unint64_t)a3 forAppWithBundleID:(id)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v11];

  [a1 setRemovability:a3 forAppWithIdentity:v12 byClient:a5 completion:v10];
}

+ (void)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = IXQueueForConcurrentOperations();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke;
  v14[3] = &unk_1E5D174D8;
  unint64_t v17 = a5;
  unint64_t v18 = a3;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  IXDispatchAsyncWithAutoreleasePool(v11, v14);
}

void __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXGetUncachedRemovabilityMetadataForAppByClient(*(void **)(a1 + 32), *(void *)(a1 + 48), 1, 0);
  if (v2 && *(void *)(a1 + 56) == v2)
  {
    id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = IXStringForAppRemovability(*(void *)(a1 + 56));
      *(_DWORD *)buf = 136315650;
      id v11 = "+[IXAppInstallCoordinator setRemovability:forAppWithIdentity:byClient:completion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Removability requested to be set for %@ is unchanged: %@; skipping write.",
        buf,
        0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = +[IXServerConnection sharedConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke_113;
    v8[3] = &unk_1E5D171B8;
    id v9 = *(id *)(a1 + 40);
    __int16 v7 = [v6 remoteObjectProxyWithErrorHandler:v8];

    objc_msgSend(v7, "_remote_setRemovability:forAppWithIdentity:byClient:completion:", *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
}

void __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "+[IXAppInstallCoordinator setRemovability:forAppWithIdentity:byClient:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)removabilityDataWithChangeClock:(id *)a3 error:(id *)a4
{
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy_;
  BOOL v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id obj = 0;
  uint64_t v6 = IXGetUncachedRemovabilityDataStore(&obj);
  objc_storeStrong(&v21, obj);
  if (v6)
  {
    uint64_t v7 = _ProcessRemovabilityMetadataListMap(v6);
    id v8 = (void *)v23[5];
    v23[5] = v7;
  }
  else
  {
    id v8 = +[IXServerConnection sharedConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke;
    v14[3] = &unk_1E5D172A8;
    void v14[4] = &v28;
    uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke_114;
    v13[3] = &unk_1E5D17500;
    void v13[4] = &v28;
    v13[5] = &v22;
    void v13[6] = &v16;
    objc_msgSend(v9, "_remote_removabilityDataWithCompletion:", v13);
  }
  id v10 = (void *)v23[5];
  if (a4 && !v10)
  {
    *a4 = (id) v29[5];
    id v10 = (void *)v23[5];
  }
  if (a3 && v10)
  {
    *a3 = (id) v17[5];
    id v10 = (void *)v23[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

void __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator removabilityDataWithChangeClock:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke_114(void *a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = (void **)(*(void *)(a1[4] + 8) + 40);
    __int16 v12 = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    uint64_t v11 = (void **)(*(void *)(a1[6] + 8) + 40);
    __int16 v12 = v8;
  }
  id v13 = v12;
  __int16 v14 = *v11;
  *uint64_t v11 = v13;
}

+ (void)removabilityDataWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = IXQueueForConcurrentOperations();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke;
  v6[3] = &unk_1E5D16FA0;
  id v7 = v3;
  id v5 = v3;
  IXDispatchAsyncWithAutoreleasePool(v4, v6);
}

void __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke(uint64_t a1)
{
  id v13 = 0;
  uint64_t v2 = IXGetUncachedRemovabilityDataStore(&v13);
  id v3 = v13;
  if (v2)
  {
    uint64_t v4 = _ProcessRemovabilityMetadataListMap(v2);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v3;
    id v3 = (id)v4;
  }
  else
  {
    uint64_t v6 = +[IXServerConnection sharedConnection];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke_2;
    uint64_t v11 = &unk_1E5D171B8;
    id v12 = *(id *)(a1 + 32);
    id v7 = [v6 remoteObjectProxyWithErrorHandler:&v8];

    objc_msgSend(v7, "_remote_removabilityDataWithCompletion:", *(void *)(a1 + 32), v8, v9, v10, v11);
    id v5 = v12;
  }
}

void __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "+[IXAppInstallCoordinator removabilityDataWithCompletion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)updateSINFForAppWithIdentity:(id)a3 wrapperURL:(id)a4 sinfData:(id)a5 error:(id *)a6
{
  __int16 v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator updateSINFForAppWithIdentity:wrapperURL:sinfData:error:]();
  }

  uint64_t v9 = _CreateError((uint64_t)"+[IXAppInstallCoordinator updateSINFForAppWithIdentity:wrapperURL:sinfData:error:]", 1483, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v8, (uint64_t)"+[IXAppInstallCoordinator updateSINFForAppWithIdentity:wrapperURL:sinfData:error:]");
  id v10 = v9;
  if (a6) {
    *a6 = v9;
  }

  return 0;
}

+ (BOOL)updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v12 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke;
  v22[3] = &unk_1E5D172A8;
  v22[4] = &v23;
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v22];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke_119;
  v18[3] = &unk_1E5D17528;
  uint64_t v20 = &v23;
  id v14 = v9;
  id v19 = v14;
  id v21 = &v29;
  objc_msgSend(v13, "_remote_updateSINFForAppWithIdentity:sinfData:options:completion:", v14, v10, v11, v18);

  int v15 = *((unsigned __int8 *)v30 + 24);
  if (a6 && !*((unsigned char *)v30 + 24))
  {
    *a6 = (id) v24[5];
    int v15 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

void __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      __int16 v7 = "+[IXAppInstallCoordinator updateSINFForAppWithIdentity:sinfData:options:error:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke_119(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 40);
      int v8 = 136315650;
      id v9 = "+[IXAppInstallCoordinator updateSINFForAppWithIdentity:sinfData:options:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update SINF for identity:%@ with:%@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

+ (BOOL)updateiTunesMetadataForAppWithIdentity:(id)a3 wrapperURL:(id)a4 plistData:(id)a5 error:(id *)a6
{
  uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:]();
  }

  id v9 = _CreateError((uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:]", 1535, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v8, (uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:]");
  __int16 v10 = v9;
  if (a6) {
    *a6 = v9;
  }

  return 0;
}

+ (BOOL)updateiTunesMetadataForAppWithIdentity:(id)a3 plistData:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v18 = 0;
  __int16 v10 = [MEMORY[0x1E4F6F5C8] metadataFromPlistData:a4 error:&v18];
  id v11 = v18;
  if (v10)
  {
    char v12 = [a1 updateiTunesMetadata:v10 forAppWithIdentity:v9 error:a6];
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:plistData:options:error:]();
    }

    _CreateError((uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:plistData:options:error:]", 1548, @"IXErrorDomain", 0x35uLL, v11, 0, @"Unable to decode supplied plist data", v15, v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      id v13 = v13;
      char v12 = 0;
      *a6 = v13;
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 wrapperURL:(id)a5 error:(id *)a6
{
  uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:]();
  }

  id v9 = _CreateError((uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:]", 1580, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v8, (uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:]");
  __int16 v10 = v9;
  if (a6) {
    *a6 = v9;
  }

  return 0;
}

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  id v9 = +[IXServerConnection sharedConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke;
  v19[3] = &unk_1E5D172A8;
  void v19[4] = &v20;
  __int16 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke_124;
  v15[3] = &unk_1E5D17528;
  uint64_t v17 = &v20;
  id v11 = v8;
  id v16 = v11;
  id v18 = &v26;
  objc_msgSend(v10, "_remote_updateiTunesMetadata:forAppWithIdentity:completion:", v7, v11, v15);

  int v12 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v12 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:error:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update iTunesMetadata: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke_124(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 40);
      int v8 = 136315650;
      id v9 = "+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update iTunesMetadata for identity %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

+ (BOOL)refreshDataContainerForBundleID:(id)a3 reason:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v40 = 1;
  id v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  __int16 v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]();
    }

    id v27 = _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1630, @"IXErrorDomain", 4uLL, 0, 0, @"Reason passed to %s was nil!", v28, (uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]");
    id v18 = 0;
    id v16 = 0;
    uint64_t v13 = 0;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v42 = "+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]";
    __int16 v43 = 2112;
    id v44 = v7;
    __int16 v45 = 2112;
    id v46 = v8;
    _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: Request to refresh data container for identifier %@ with reason %@", buf, 0x20u);
  }

  id v11 = objc_alloc(MEMORY[0x1E4F96488]);
  __int16 v12 = [NSString stringWithFormat:@"Refreshing data container: %@", v8];
  uint64_t v13 = (void *)[v11 initWithExplanation:v12];

  [v13 setMaximumTerminationResistance:40];
  id v14 = objc_alloc(MEMORY[0x1E4F96490]);
  uint64_t v15 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v7];
  id v16 = (void *)[v14 initWithPredicate:v15 context:v13];

  if (!v16)
  {
    char v29 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]();
    }

    id v27 = _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1642, @"IXErrorDomain", 0x13uLL, 0, 0, @"Failed to create termination request for identifier %@", v30, (uint64_t)v7);
    id v18 = 0;
    id v16 = 0;
    goto LABEL_33;
  }
  id v38 = 0;
  id v39 = 0;
  char v17 = [v16 execute:&v39 error:&v38];
  id v18 = v39;
  id v19 = v38;
  uint64_t v20 = v19;
  if (v17)
  {
    if (v18) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
  uint64_t v31 = [v19 domain];
  if (![v31 isEqualToString:*MEMORY[0x1E4F964C8]] || objc_msgSend(v20, "code") != 3)
  {

    goto LABEL_25;
  }

  if (!v18)
  {
LABEL_25:
    char v32 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v42 = "+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]";
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      id v46 = v18;
      __int16 v47 = 2112;
      id v48 = v20;
      _os_log_error_impl(&dword_1A7B2D000, v32, OS_LOG_TYPE_ERROR, "%s: Failed to execute termination request for identifier %@: assertion = %@ : %@", buf, 0x2Au);
    }

    id v27 = _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1647, @"IXErrorDomain", 0x13uLL, v20, 0, @"Failed to execute termination request for identifier %@: assertion = %@", v33, (uint64_t)v7);

    if (v18) {
      goto LABEL_32;
    }
LABEL_33:
    BOOL v23 = 0;
    if (!a5) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }
LABEL_7:
  id v37 = v7;
  [v37 UTF8String];
  uint64_t v21 = container_create_or_lookup_for_current_user();
  if (!v21)
  {
    id v34 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]();
    }

    id v27 = _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1653, @"IXErrorDomain", 0x23uLL, 0, 0, @"Failed to look up container for identifier %@: container error = %llu", v35, (uint64_t)v37);

LABEL_32:
    [v18 invalidate];
    goto LABEL_33;
  }
  uint64_t v22 = v21;
  uint64_t v40 = container_delete_all_container_content();
  BOOL v23 = v40 == 1;
  if (v40 != 1)
  {
    uint64_t v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:].cold.4();
    }

    uint64_t v26 = _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1658, @"IXErrorDomain", 0x23uLL, 0, 0, @"Failed to refresh data container for identifier %@: container error = %llu", v25, (uint64_t)v37);

    uint64_t v20 = (void *)v26;
  }
  [v18 invalidate];
  MEMORY[0x1AD0D4430](v22);
  id v27 = v20;
  if (a5)
  {
LABEL_34:
    if (!v23) {
      *a5 = v27;
    }
  }
LABEL_36:

  return v23;
}

+ (BOOL)refreshContainerTypes:(unint64_t)a3 forBundleID:(id)a4 reason:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  __int16 v12 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v11];

  LOBYTE(a6) = [a1 refreshContainerTypes:a3 forApplicationIdentity:v12 reason:v10 error:a6];
  return (char)a6;
}

+ (BOOL)refreshContainerTypes:(unint64_t)a3 forApplicationIdentity:(id)a4 reason:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  char v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (v10)
  {
    id v11 = +[IXServerConnection sharedConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke;
    v20[3] = &unk_1E5D172A8;
    void v20[4] = &v25;
    __int16 v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_149;
    v19[3] = &unk_1E5D17140;
    void v19[4] = &v25;
    void v19[5] = &v21;
    objc_msgSend(v12, "_remote_refreshContainerTypes:forAppWithIdentity:reason:completion:", a3, v9, v10, v19);
  }
  else
  {
    uint64_t v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[IXAppInstallCoordinator refreshContainerTypes:forApplicationIdentity:reason:error:]();
    }

    uint64_t v15 = _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshContainerTypes:forApplicationIdentity:reason:error:]", 1697, @"IXErrorDomain", 4uLL, 0, 0, @"Reason passed to %s was nil", v14, (uint64_t)"+[IXAppInstallCoordinator refreshContainerTypes:forApplicationIdentity:reason:error:]");
    id v11 = (void *)v26[5];
    v26[5] = v15;
  }

  int v16 = *((unsigned __int8 *)v22 + 24);
  if (a6 && !*((unsigned char *)v22 + 24))
  {
    *a6 = (id) v26[5];
    int v16 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

void __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_cold_1();
    }
  }
}

void __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_149(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)cancelForReason:(id)a3
{
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  id v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  if (!v8)
  {
    BOOL v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[IXAppInstallCoordinator cancelForReason:client:error:]();
    }

    uint64_t v19 = _CreateError((uint64_t)"-[IXAppInstallCoordinator cancelForReason:client:error:]", 1738, @"IXErrorDomain", 4uLL, 0, 0, @"Reason passed to -[IXAppInstallCoordinator cancelForReason:client:error:] was nil!", v18, v25[0]);
    id v9 = 0;
    goto LABEL_13;
  }
  id v9 = v8;
  if (!a4)
  {
    uint64_t v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[IXAppInstallCoordinator cancelForReason:client:error:]();
    }

    uint64_t v19 = _CreateError((uint64_t)"-[IXAppInstallCoordinator cancelForReason:client:error:]", 1743, @"IXErrorDomain", 4uLL, 0, 0, @"-[IXAppInstallCoordinator cancelForReason:client:error:] was called with client of IXClientNone which is invalid", v21, v25[0]);
LABEL_13:
    uint64_t v14 = (void *)v31[5];
    v31[5] = v19;
LABEL_14:

    goto LABEL_15;
  }
  id v10 = +[IXServerConnection sharedConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke;
  v29[3] = &unk_1E5D17550;
  v29[4] = self;
  v29[5] = &v30;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v29];
  __int16 v12 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_156;
  v28[3] = &unk_1E5D17578;
  void v28[4] = self;
  v28[5] = &v30;
  v28[6] = &v36;
  objc_msgSend(v11, "_remote_IXSCoordinatedAppInstall:cancelForReason:client:completion:", v12, v9, a4, v28);

  if (*((unsigned char *)v37 + 24))
  {
    uint64_t v13 = IXUserPresentableErrorForInsufficientSpaceError(v9);
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;

      id v9 = v15;
    }
    int v16 = [(IXAppInstallCoordinator *)self internalQueue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = (uint64_t)__56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_157;
    v25[3] = (uint64_t)&unk_1E5D16FF0;
    v25[4] = (uint64_t)self;
    id v9 = v9;
    id v26 = v9;
    unint64_t v27 = a4;
    dispatch_sync(v16, v25);

    goto LABEL_14;
  }
LABEL_15:
  int v22 = *((unsigned __int8 *)v37 + 24);
  if (a5 && !*((unsigned char *)v37 + 24))
  {
    *a5 = (id) v31[5];
    int v22 = *((unsigned __int8 *)v37 + 24);
  }
  BOOL v23 = v22 != 0;
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v23;
}

void __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    id v9 = "-[IXAppInstallCoordinator cancelForReason:client:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_156(void *a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v10 = 136315650;
      uint64_t v11 = "-[IXAppInstallCoordinator cancelForReason:client:error:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    if (a2)
    {
      id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v9 acquireDatabase];
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_157(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
}

- (BOOL)setPlaceholderPromise:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  long long v50 = __Block_byref_object_copy_;
  long long v51 = __Block_byref_object_dispose_;
  id v52 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  id v7 = [(IXAppInstallCoordinator *)self validInstallTypes];
  if (!v6)
  {
    uint64_t v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[IXAppInstallCoordinator setPlaceholderPromise:error:]();
    }

    uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]", 1795, @"IXErrorDomain", 4uLL, 0, 0, @"placeholderPromise argument to %s was nil", v17, (uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]");
    goto LABEL_13;
  }
  if ([v6 placeholderType] != 1)
  {
    uint64_t v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[IXAppInstallCoordinator setPlaceholderPromise:error:]();
    }

    uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]", 1800, @"IXErrorDomain", 4uLL, 0, 0, @"App extension placeholder promise passed to %s instead of app placeholder promise", v20, (uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]");
LABEL_13:
    uint64_t v21 = (void *)v48[5];
    v48[5] = v18;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "installType"));
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v21 = [v7 componentsJoinedByString:@", "];
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [v6 installType];
      *(_DWORD *)buf = 136316418;
      __int16 v54 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]";
      __int16 v55 = 2080;
      __int16 v56 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]";
      __int16 v57 = 2112;
      id v58 = v32;
      __int16 v59 = 2048;
      uint64_t v60 = v33;
      __int16 v61 = 2112;
      uint64_t v62 = v21;
      __int16 v63 = 2112;
      uint64_t v64 = 0;
      _os_log_error_impl(&dword_1A7B2D000, v25, OS_LOG_TYPE_ERROR, "%s: Placeholder promise passed to %s for %@ has unpermitted install type %lu (permitted types %@) : %@", buf, 0x3Eu);
    }
    id v26 = (objc_class *)objc_opt_class();
    unint64_t v27 = NSStringFromClass(v26);
    [v6 installType];
    uint64_t v29 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]", 1806, @"IXErrorDomain", 4uLL, 0, 0, @"Placeholder promise passed to %s for %@ has unpermitted install type %lu (permitted types %@)", v28, (uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]");

    uint64_t v30 = (void *)v48[5];
    v48[5] = v29;

    goto LABEL_14;
  }
  int v10 = +[IXServerConnection sharedConnection];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke;
  v39[3] = &unk_1E5D175A0;
  id v11 = v6;
  id v40 = v11;
  v41 = self;
  uint64_t v42 = &v47;
  __int16 v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v39];
  uint64_t v13 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  __int16 v14 = [v11 uniqueIdentifier];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke_171;
  v34[3] = &unk_1E5D175C8;
  id v35 = v11;
  uint64_t v36 = self;
  id v37 = &v47;
  uint64_t v38 = &v43;
  objc_msgSend(v12, "_remote_IXSCoordinatedAppInstall:setPlaceholderPromiseUUID:completion:", v13, v14, v34);

  if (!*((unsigned char *)v44 + 24))
  {
    uint64_t v15 = v48[5];
    if (v15) {
      [(IXAppInstallCoordinator *)self cancelForReason:v15 client:15 error:0];
    }
  }
LABEL_15:
  int v22 = *((unsigned __int8 *)v44 + 24);
  if (a4 && !*((unsigned char *)v44 + 24))
  {
    *a4 = (id) v48[5];
    int v22 = *((unsigned __int8 *)v44 + 24);
  }
  BOOL v23 = v22 != 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v23;
}

void __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    int v10 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke_171(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)placeholderPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy_;
  BOOL v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v19;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_172;
  v11[3] = &unk_1E5D175F0;
  void v11[4] = &v19;
  void v11[5] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getPlaceholderPromise:", v7, v11);

  int v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    int v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder promise: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      __int16 v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_172_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke", 1856, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for a placeholder data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_172_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke", 1853, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke", 1848, @"IXErrorDomain", 0x17uLL, 0, 0, @"A placeholder promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v27 = "-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)hasPlaceholderPromise
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  void v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke_184;
  v7[3] = &unk_1E5D17640;
  void v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSCoordinatedAppInstall:hasPlaceholderPromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXAppInstallCoordinator hasPlaceholderPromise]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a placeholder promise: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke_184(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator hasPlaceholderPromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a placeholder promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setAppAssetPromise:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  id v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke;
  v22[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v23 = v8;
  uint64_t v24 = self;
  uint64_t v25 = &v30;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v22];
  __int16 v10 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  uint64_t v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke_185;
  v17[3] = &unk_1E5D175C8;
  id v12 = v8;
  id v18 = v12;
  uint64_t v19 = self;
  uint64_t v20 = &v30;
  uint64_t v21 = &v26;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setAppAssetPromiseUUID:completion:", v10, v11, v17);

  if (*((unsigned char *)v27 + 24))
  {
    int v13 = 1;
  }
  else
  {
    uint64_t v14 = v31[5];
    if (v14)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v14 client:15 error:0];
      int v13 = *((unsigned __int8 *)v27 + 24);
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      int v13 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    if (!v13)
    {
      *a4 = (id) v31[5];
      int v13 = *((unsigned __int8 *)v27 + 24);
    }
  }
LABEL_9:
  BOOL v15 = v13 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    __int16 v10 = "-[IXAppInstallCoordinator setAppAssetPromise:error:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app asset promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke_185(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setAppAssetPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app asset promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)appAssetPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v19;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_186;
  v11[3] = &unk_1E5D175F0;
  void v11[4] = &v19;
  void v11[5] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getAppAssetPromise:", v7, v11);

  int v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    int v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app asset promise: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      __int16 v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_186_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke", 1930, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an owned data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_186_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke", 1927, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke", 1922, @"IXErrorDomain", 0x17uLL, 0, 0, @"An app asset promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v27 = "-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app asset promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)hasAppAssetPromise
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  void v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke_194;
  v7[3] = &unk_1E5D17640;
  void v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSCoordinatedAppInstall:hasAppAssetPromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXAppInstallCoordinator hasAppAssetPromise]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an app asset promise: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke_194(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator hasAppAssetPromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an app asset promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)appAssetPromiseHasBegunFulfillment:(BOOL *)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke;
  v14[3] = &unk_1E5D17550;
  void v14[4] = self;
  void v14[5] = &v15;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  uint64_t v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke_195;
  v13[3] = &unk_1E5D17668;
  void v13[4] = &v15;
  v13[5] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:appAssetPromiseHasBegunFulfillment:", v9, v13);

  __int16 v10 = (void *)v16[5];
  if (a4 && v10)
  {
    *a4 = v10;
    __int16 v10 = (void *)v16[5];
  }
  BOOL v11 = v10 == 0;
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXAppInstallCoordinator appAssetPromiseHasBegunFulfillment:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if app asset promise for %@ has begun fulfillment : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke_195(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    **(unsigned char **)(a1 + 40) = a2;
  }
}

- (BOOL)setAppAssetPromiseResponsibleClient:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  unint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (a3)
  {
    id v7 = +[IXServerConnection sharedConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke;
    v18[3] = &unk_1E5D172A8;
    void v18[4] = &v23;
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v18];
    uint64_t v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke_199;
    v17[3] = &unk_1E5D17140;
    void v17[4] = &v23;
    void v17[5] = &v19;
    objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:setAppAssetPromiseDRI:completion:", v9, a3, v17);
  }
  else
  {
    __int16 v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IXAppInstallCoordinator setAppAssetPromiseResponsibleClient:error:]();
    }

    uint64_t v12 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setAppAssetPromiseResponsibleClient:error:]", 1984, @"IXErrorDomain", 4uLL, 0, 0, @"Client IXClientNone was passed to -setAppAssetPromiseResponsibleClient:error:, but that doesn't make sense", v11, v16);
    id v7 = (void *)v24[5];
    v24[5] = v12;
  }

  int v13 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    *a4 = (id) v24[5];
    int v13 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

void __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator setAppAssetPromiseResponsibleClient:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app asset promise responsible client: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke_199(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (unint64_t)appAssetPromiseResponsibleClientWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke;
  v11[3] = &unk_1E5D172A8;
  void v11[4] = &v16;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  int v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke_200;
  v10[3] = &unk_1E5D17460;
  void v10[4] = &v12;
  v10[5] = &v16;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getAppAssetPromiseDRI:", v7, v10);

  unint64_t v8 = v13[3];
  if (a3 && !v8)
  {
    *a3 = (id) v17[5];
    unint64_t v8 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    unint64_t v8 = "-[IXAppInstallCoordinator appAssetPromiseResponsibleClientWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app asset promise responsible client: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke_200(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setInstallOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = v6;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  id v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  if (v6)
  {
    id obj = 0;
    unint64_t v8 = IXEncodeRootObject(v6, &obj);
    objc_storeStrong(&v38, obj);
    if (v8)
    {
      __int16 v9 = [[IXPromisedInMemoryData alloc] initWithName:@"MIInstallOptions data" client:15 data:v8];
      if (v9)
      {
        id v10 = +[IXServerConnection sharedConnection];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke;
        v27[3] = &unk_1E5D17550;
        v27[4] = self;
        v27[5] = &v33;
        uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v27];
        uint64_t v12 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
        int v13 = [(IXDataPromise *)v9 uniqueIdentifier];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = (uint64_t)__51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke_211;
        v26[3] = (uint64_t)&unk_1E5D17690;
        void v26[4] = (uint64_t)self;
        v26[5] = (uint64_t)&v33;
        v26[6] = (uint64_t)&v29;
        objc_msgSend(v11, "_remote_IXSCoordinatedAppInstall:setInstallOptionsPromiseUUID:completion:", v12, v13, v26);

        goto LABEL_13;
      }
      uint64_t v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[IXAppInstallCoordinator setInstallOptions:error:]();
      }

      uint64_t v21 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setInstallOptions:error:]", 2050, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create data promise for serialized install options", v20, v26[0]);
      char v22 = (void *)v34[5];
      v34[5] = v21;
    }
    __int16 v9 = 0;
LABEL_13:
    if (*((unsigned char *)v30 + 24))
    {
      int v23 = 1;
LABEL_22:
      BOOL v18 = v23 != 0;

      goto LABEL_23;
    }
    uint64_t v24 = v34[5];
    if (v24)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v24 client:15 error:0];
      int v23 = *((unsigned __int8 *)v30 + 24);
      if (!a4) {
        goto LABEL_22;
      }
    }
    else
    {
      int v23 = 0;
      if (!a4) {
        goto LABEL_22;
      }
    }
    if (!v23)
    {
      *a4 = (id) v34[5];
      int v23 = *((unsigned __int8 *)v30 + 24);
    }
    goto LABEL_22;
  }
  uint64_t v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator setInstallOptions:error:]();
  }

  uint64_t v16 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setInstallOptions:error:]", 2033, @"IXErrorDomain", 4uLL, 0, 0, @"Options argument to -setInstallOptions:error: was nil", v15, v26[0]);
  uint64_t v17 = (void *)v34[5];
  v34[5] = v16;

  BOOL v18 = 0;
  if (a4) {
    *a4 = (id) v34[5];
  }
LABEL_23:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

void __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXAppInstallCoordinator setInstallOptions:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set install options on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke_211(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v7 = 136315650;
      int v8 = "-[IXAppInstallCoordinator setInstallOptions:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set install options on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)hasInstallOptions
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke;
  v8[3] = &unk_1E5D17618;
  void v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke_212;
  v7[3] = &unk_1E5D17640;
  void v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSCoordinatedAppInstall:hasInstallOptions:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    int v7 = "-[IXAppInstallCoordinator hasInstallOptions]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has install options: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke_212(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator hasInstallOptions]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has install options: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (id)installOptionsWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy_;
  int v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  void v12[4] = self;
  void v12[5] = &v19;
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke_213;
  v11[3] = &unk_1E5D176B8;
  void v11[4] = &v13;
  void v11[5] = &v19;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getInstallOptions:", v7, v11);

  int v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    int v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    id v9 = "-[IXAppInstallCoordinator installOptionsWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has install options: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v7 = v10;
  }
  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  void *v6 = v8;
}

- (BOOL)setImportance:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__IXAppInstallCoordinator_setImportance_error___block_invoke;
  v14[3] = &unk_1E5D176E0;
  void v14[5] = &v15;
  void v14[6] = a3;
  void v14[4] = self;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  id v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__IXAppInstallCoordinator_setImportance_error___block_invoke_215;
  v13[3] = &unk_1E5D17708;
  void v13[4] = self;
  v13[5] = &v15;
  void v13[6] = &v21;
  void v13[7] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:setImportance:completion:", v9, a3, v13);

  [(IXAppInstallCoordinator *)self _conveyCurrentPriorityBoostReplacingExisting:1];
  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __47__IXAppInstallCoordinator_setImportance_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = IXStringForCoordinatorImportance(a1[6]);
    uint64_t v6 = a1[4];
    int v9 = 136315906;
    int v10 = "-[IXAppInstallCoordinator setImportance:error:]_block_invoke";
    __int16 v11 = 2112;
    __int16 v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set importance to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __47__IXAppInstallCoordinator_setImportance_error___block_invoke_215(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = IXStringForCoordinatorImportance(a1[7]);
      uint64_t v7 = a1[4];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setImportance:error:]_block_invoke";
      __int16 v10 = 2112;
      __int16 v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set importance to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (unint64_t)importanceWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__IXAppInstallCoordinator_importanceWithError___block_invoke;
  v11[3] = &unk_1E5D17550;
  void v11[4] = self;
  void v11[5] = &v12;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__IXAppInstallCoordinator_importanceWithError___block_invoke_216;
  v10[3] = &unk_1E5D17730;
  void v10[4] = self;
  v10[5] = &v12;
  void v10[6] = &v18;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:importanceWithCompletion:", v7, v10);

  unint64_t v8 = v19[3];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    unint64_t v8 = v19[3];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __47__IXAppInstallCoordinator_importanceWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    int v9 = "-[IXAppInstallCoordinator importanceWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get importance from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __47__IXAppInstallCoordinator_importanceWithError___block_invoke_216(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v9 = 136315650;
      __int16 v10 = "-[IXAppInstallCoordinator importanceWithError:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get importance from %@ : %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
}

- (BOOL)setInitialODRAssetPromises:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  uint64_t v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v7 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) uniqueIdentifier];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v36 count:16];
    }
    while (v9);
  }

  __int16 v13 = +[IXServerConnection sharedConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke;
  v21[3] = &unk_1E5D17550;
  v21[4] = self;
  v21[5] = &v26;
  id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v15 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke_218;
  v20[3] = &unk_1E5D17690;
  void v20[4] = self;
  void v20[5] = &v26;
  v20[6] = &v32;
  objc_msgSend(v14, "_remote_IXSCoordinatedAppInstall:setInitialODRAssetPromiseUUIDs:completion:", v15, v7, v20);

  if (*((unsigned char *)v33 + 24))
  {
    int v16 = 1;
  }
  else
  {
    uint64_t v17 = v27[5];
    if (v17)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v17 client:15 error:0];
      int v16 = *((unsigned __int8 *)v33 + 24);
      if (!a4) {
        goto LABEL_16;
      }
    }
    else
    {
      int v16 = 0;
      if (!a4) {
        goto LABEL_16;
      }
    }
    if (!v16)
    {
      *a4 = (id) v27[5];
      int v16 = *((unsigned __int8 *)v33 + 24);
    }
  }
LABEL_16:
  BOOL v18 = v16 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXAppInstallCoordinator setInitialODRAssetPromises:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set initial ODR asset promises on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke_218(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v7 = 136315650;
      int v8 = "-[IXAppInstallCoordinator setInitialODRAssetPromises:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set initial ODR asset promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (id)initialODRAssetPromisesWithError:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  long long v51 = __Block_byref_object_copy_;
  id v52 = __Block_byref_object_dispose_;
  id v53 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy_;
  char v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  id v4 = +[IXServerConnection sharedConnection];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke;
  v41[3] = &unk_1E5D172A8;
  void v41[4] = &v48;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v41];
  uint64_t v6 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke_219;
  v40[3] = &unk_1E5D172D0;
  v40[4] = &v48;
  v40[5] = &v42;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:getInitialODRAssetPromises:", v6, v40);

  if (v49[5])
  {
    int v7 = 0;
    int v8 = 0;
    goto LABEL_25;
  }
  int v8 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = (id)v43[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v55 count:16];
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator initialODRAssetPromisesWithError:]();
        }

        BOOL v18 = (objc_class *)objc_opt_class();
        uint64_t v33 = NSStringFromClass(v18);
        uint64_t v20 = _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]", 2228, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@", v19, (uint64_t)v13);

        uint64_t v15 = (void *)v49[5];
        v49[5] = v20;
        goto LABEL_24;
      }
      uint64_t v14 = (objc_class *)[v13 clientPromiseClass];
      uint64_t v15 = (void *)[[v14 alloc] initWithSeed:v13];
      if (!v15)
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          long long v22 = NSStringFromClass(v14);
          [(IXAppInstallCoordinator *)v22 initialODRAssetPromisesWithError:v54];
        }

        long long v23 = NSStringFromClass(v14);
        uint64_t v25 = _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]", 2234, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ from seed %@", v24, (uint64_t)v23);

        uint64_t v26 = (void *)v49[5];
        v49[5] = v25;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v27 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator initialODRAssetPromisesWithError:]();
        }

        uint64_t v29 = (objc_class *)objc_opt_class();
        uint64_t v34 = NSStringFromClass(v29);
        uint64_t v31 = _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]", 2237, @"IXErrorDomain", 1uLL, 0, 0, @"Object %@ should have been for an opaque data promise subclass but was instead for class %@", v30, (uint64_t)v15);

        uint64_t v26 = (void *)v49[5];
        v49[5] = v31;
LABEL_23:

LABEL_24:
        int v7 = 0;
        goto LABEL_25;
      }
      [v8 addObject:v15];
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v55 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_13:

  int v7 = (void *)[v8 copy];
LABEL_25:
  if (a3 && !v7) {
    *a3 = (id) v49[5];
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v7;
}

void __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get initial ODR asset promises: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v8 = a3;
  if (v8)
  {
    __int16 v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)&void v15[4] = "-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get initial ODR asset promises: %@", v15, 0x16u);
    }

    id v10 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v11 = a3;
  }
  else
  {
    if (!v6)
    {
      uint64_t v12 = _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]_block_invoke", 2215, @"IXErrorDomain", 0x17uLL, 0, 0, @"No Initial ODR asset promises are currently set.", v7, *(uint64_t *)v15);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      goto LABEL_8;
    }
    id v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = a2;
  }
  objc_storeStrong(v10, v11);
LABEL_8:
}

- (BOOL)hasInitialODRAssetPromises
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke;
  v8[3] = &unk_1E5D17618;
  void v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke_234;
  v7[3] = &unk_1E5D17640;
  void v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSCoordinatedAppInstall:hasInitialODRAssetPromises:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[IXAppInstallCoordinator hasInitialODRAssetPromises]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has initial ODR asset promises: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke_234(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator hasInitialODRAssetPromises]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has initial ODR asset promises: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)setUserDataPromise:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke;
  v22[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v23 = v8;
  uint64_t v24 = self;
  uint64_t v25 = &v30;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v22];
  __int16 v10 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  uint64_t v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke_235;
  v17[3] = &unk_1E5D175C8;
  id v12 = v8;
  id v18 = v12;
  uint64_t v19 = self;
  uint64_t v20 = &v30;
  uint64_t v21 = &v26;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setUserDataPromiseUUID:completion:", v10, v11, v17);

  if (*((unsigned char *)v27 + 24))
  {
    int v13 = 1;
  }
  else
  {
    uint64_t v14 = v31[5];
    if (v14)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v14 client:15 error:0];
      int v13 = *((unsigned __int8 *)v27 + 24);
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      int v13 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    if (!v13)
    {
      *a4 = (id) v31[5];
      int v13 = *((unsigned __int8 *)v27 + 24);
    }
  }
LABEL_9:
  BOOL v15 = v13 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    __int16 v10 = "-[IXAppInstallCoordinator setUserDataPromise:error:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set user data promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke_235(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setUserDataPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set user data promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)userDataPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v19;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_236;
  v11[3] = &unk_1E5D175F0;
  void v11[4] = &v19;
  void v11[5] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getUserDataPromise:", v7, v11);

  int v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    int v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get user data promise: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      __int16 v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_236_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke", 2315, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_236_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke", 2312, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke", 2307, @"IXErrorDomain", 0x17uLL, 0, 0, @"A user data promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v27 = "-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get user data promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)hasUserDataPromise
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke;
  v8[3] = &unk_1E5D17618;
  void v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v5 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke_244;
  v7[3] = &unk_1E5D17640;
  void v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "_remote_IXSCoordinatedAppInstall:hasUserDataPromise:", v5, v7);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXAppInstallCoordinator hasUserDataPromise]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a user data promise: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke_244(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator hasUserDataPromise]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a user data promise: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (id)userDataRestoreShouldBegin:(BOOL *)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke;
  v11[3] = &unk_1E5D17550;
  void v11[4] = self;
  void v11[5] = &v12;
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke_245;
  v10[3] = &unk_1E5D17758;
  void v10[4] = self;
  v10[5] = &v12;
  void v10[6] = a3;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getUserDataRestoreShouldBegin:", v7, v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXAppInstallCoordinator userDataRestoreShouldBegin:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin user data restore: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke_245(void *a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v12 = 136315650;
      id v13 = "-[IXAppInstallCoordinator userDataRestoreShouldBegin:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin user data restore: %@", (uint8_t *)&v12, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    uint64_t v9 = (unsigned char *)a1[6];
    if (v9) {
      *uint64_t v9 = a2;
    }
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

- (id)preparationPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v19;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_246;
  v11[3] = &unk_1E5D175F0;
  void v11[4] = &v19;
  void v11[5] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getPreparationPromise:", v7, v11);

  uint64_t v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    uint64_t v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get user data promise: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_246(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      __int16 v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      int v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_246_cold_2();
        }

        __int16 v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke", 2383, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_246_cold_1();
        }

        __int16 v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke", 2380, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke", 2375, @"IXErrorDomain", 0x17uLL, 0, 0, @"A preparation promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v27 = "-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get preparation promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)setPreparationPromise:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v7 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke;
  v22[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v23 = v8;
  uint64_t v24 = self;
  uint64_t v25 = &v30;
  __int16 v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v10 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  uint64_t v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke_250;
  v17[3] = &unk_1E5D175C8;
  id v12 = v8;
  id v18 = v12;
  uint64_t v19 = self;
  uint64_t v20 = &v30;
  uint64_t v21 = &v26;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setPreparationPromiseUUID:completion:", v10, v11, v17);

  if (*((unsigned char *)v27 + 24))
  {
    int v13 = 1;
  }
  else
  {
    uint64_t v14 = v31[5];
    if (v14)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v14 client:15 error:0];
      int v13 = *((unsigned __int8 *)v27 + 24);
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      int v13 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    if (!v13)
    {
      *a4 = (id) v31[5];
      int v13 = *((unsigned __int8 *)v27 + 24);
    }
  }
LABEL_9:
  BOOL v15 = v13 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    uint64_t v10 = "-[IXAppInstallCoordinator setPreparationPromise:withError:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set preparation promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke_250(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setPreparationPromise:withError:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set preparation promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (BOOL)setDeviceSecurityPromise:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke;
  v22[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v23 = v8;
  uint64_t v24 = self;
  uint64_t v25 = &v30;
  int v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v22];
  __int16 v10 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  uint64_t v11 = [v8 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke_251;
  v17[3] = &unk_1E5D175C8;
  id v12 = v8;
  id v18 = v12;
  uint64_t v19 = self;
  uint64_t v20 = &v30;
  uint64_t v21 = &v26;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setDeviceSecurityPromiseUUID:completion:", v10, v11, v17);

  if (*((unsigned char *)v27 + 24))
  {
    int v13 = 1;
  }
  else
  {
    uint64_t v14 = v31[5];
    if (v14)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v14 client:15 error:0];
      int v13 = *((unsigned __int8 *)v27 + 24);
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      int v13 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    if (!v13)
    {
      *a4 = (id) v31[5];
      int v13 = *((unsigned __int8 *)v27 + 24);
    }
  }
LABEL_9:
  BOOL v15 = v13 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    __int16 v10 = "-[IXAppInstallCoordinator setDeviceSecurityPromise:error:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set device security promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke_251(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setDeviceSecurityPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set device security promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)deviceSecurityPromiseWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v19;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_252;
  v11[3] = &unk_1E5D175F0;
  void v11[4] = &v19;
  void v11[5] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getDeviceSecurityPromise:", v7, v11);

  int v8 = (void *)v14[5];
  if (a3 && !v8)
  {
    *a3 = (id) v20[5];
    int v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get device security promise: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      __int16 v9 = (objc_class *)[v5 clientPromiseClass];
      uint64_t v10 = [[v9 alloc] initWithSeed:v5];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_17;
        }
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

        uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_252_cold_2();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke", 2469, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@", v17, (uint64_t)v5);
      }
      else
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_252_cold_1();
        }

        uint64_t v16 = NSStringFromClass(v9);
        _CreateError((uint64_t)"-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke", 2466, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ with seed %@", v22, (uint64_t)v16);
      uint64_t v23 = };

      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      uint64_t v18 = _CreateError((uint64_t)"-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke", 2461, @"IXErrorDomain", 0x17uLL, 0, 0, @"A device security promise is not currently set.", v6, v25);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v27 = "-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get device security promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_17:
}

- (BOOL)getHasDeviceSecurityPromise:(BOOL *)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke;
  v14[3] = &unk_1E5D17550;
  void v14[4] = self;
  void v14[5] = &v15;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  __int16 v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke_256;
  v13[3] = &unk_1E5D17780;
  void v13[4] = self;
  v13[5] = &v15;
  void v13[6] = &v21;
  void v13[7] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:getHasDeviceSecurityPromise:", v9, v13);

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXAppInstallCoordinator getHasDeviceSecurityPromise:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a device security promise: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke_256(void *a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v10 = 136315650;
      uint64_t v11 = "-[IXAppInstallCoordinator getHasDeviceSecurityPromise:error:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a device security promise: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    __int16 v9 = (unsigned char *)a1[7];
    if (v9) {
      *__int16 v9 = a2;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)setNeedsPostProcessing:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  char v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v7 = +[IXServerConnection sharedConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke;
  v15[3] = &unk_1E5D17550;
  void v15[4] = self;
  v15[5] = &v20;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
  __int16 v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke_257;
  v14[3] = &unk_1E5D17690;
  void v14[4] = self;
  void v14[5] = &v20;
  void v14[6] = &v16;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:setNeedsPostProcessing:completion:", v9, v5, v14);

  if (*((unsigned char *)v17 + 24))
  {
    int v10 = 1;
  }
  else
  {
    uint64_t v11 = v21[5];
    if (v11)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v11 client:15 error:0];
      int v10 = *((unsigned __int8 *)v17 + 24);
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      int v10 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    if (!v10)
    {
      *a4 = (id) v21[5];
      int v10 = *((unsigned __int8 *)v17 + 24);
    }
  }
LABEL_9:
  BOOL v12 = v10 != 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXAppInstallCoordinator setNeedsPostProcessing:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set needs post processing on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke_257(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v7 = 136315650;
      int v8 = "-[IXAppInstallCoordinator setNeedsPostProcessing:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set needs post processing on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)getNeedsPostProcessing:(BOOL *)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  char v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke;
  v14[3] = &unk_1E5D17550;
  void v14[4] = self;
  void v14[5] = &v15;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  __int16 v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke_258;
  v13[3] = &unk_1E5D17780;
  void v13[4] = self;
  v13[5] = &v15;
  void v13[6] = &v21;
  void v13[7] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:getNeedsPostProcessing:", v9, v13);

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXAppInstallCoordinator getNeedsPostProcessing:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ needs post processing: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke_258(void *a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v10 = 136315650;
      uint64_t v11 = "-[IXAppInstallCoordinator getNeedsPostProcessing:error:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ needs post processing: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    __int16 v9 = (unsigned char *)a1[7];
    if (v9) {
      *__int16 v9 = a2;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)getPostProcessingShouldBegin:(BOOL *)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  char v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke;
  v14[3] = &unk_1E5D17550;
  void v14[4] = self;
  void v14[5] = &v15;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  __int16 v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke_259;
  v13[3] = &unk_1E5D17780;
  void v13[4] = self;
  v13[5] = &v15;
  void v13[6] = &v21;
  void v13[7] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:getPostProcessingShouldBegin:", v9, v13);

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXAppInstallCoordinator getPostProcessingShouldBegin:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin post processing: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke_259(void *a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v10 = 136315650;
      uint64_t v11 = "-[IXAppInstallCoordinator getPostProcessingShouldBegin:error:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin post processing: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    __int16 v9 = (unsigned char *)a1[7];
    if (v9) {
      *__int16 v9 = a2;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)setEssentialAssetPromises:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  int v7 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        __int16 v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) uniqueIdentifier];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v9);
  }

  uint64_t v13 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke;
  v22[3] = &unk_1E5D17550;
  void v22[4] = self;
  void v22[5] = &v27;
  __int16 v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v22];
  id v15 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  uint64_t v16 = (void *)[v7 copy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke_260;
  v21[3] = &unk_1E5D17690;
  v21[4] = self;
  v21[5] = &v27;
  void v21[6] = &v33;
  objc_msgSend(v14, "_remote_IXSCoordinatedAppInstall:setEssentialAssetPromiseUUIDs:completion:", v15, v16, v21);

  if (*((unsigned char *)v34 + 24))
  {
    int v17 = 1;
  }
  else
  {
    uint64_t v18 = v28[5];
    if (v18)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v18 client:15 error:0];
      int v17 = *((unsigned __int8 *)v34 + 24);
      if (!a4) {
        goto LABEL_16;
      }
    }
    else
    {
      int v17 = 0;
      if (!a4) {
        goto LABEL_16;
      }
    }
    if (!v17)
    {
      *a4 = (id) v28[5];
      int v17 = *((unsigned __int8 *)v34 + 24);
    }
  }
LABEL_16:
  BOOL v19 = v17 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

void __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXAppInstallCoordinator setEssentialAssetPromises:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set essential asset promises on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke_260(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v7 = 136315650;
      int v8 = "-[IXAppInstallCoordinator setEssentialAssetPromises:error:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set essential asset promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (id)essentialAssetPromisesWithError:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  long long v51 = __Block_byref_object_copy_;
  id v52 = __Block_byref_object_dispose_;
  id v53 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy_;
  char v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  id v4 = +[IXServerConnection sharedConnection];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke;
  v41[3] = &unk_1E5D172A8;
  void v41[4] = &v48;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v41];
  uint64_t v6 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke_261;
  v40[3] = &unk_1E5D172D0;
  v40[4] = &v48;
  v40[5] = &v42;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:getEssentialAssetPromises:", v6, v40);

  if (v49[5])
  {
    int v7 = 0;
    int v8 = 0;
    goto LABEL_25;
  }
  int v8 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = (id)v43[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v55 count:16];
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator essentialAssetPromisesWithError:]();
        }

        uint64_t v18 = (objc_class *)objc_opt_class();
        uint64_t v33 = NSStringFromClass(v18);
        uint64_t v20 = _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]", 2649, @"IXErrorDomain", 1uLL, 0, 0, @"Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@", v19, (uint64_t)v13);

        id v15 = (void *)v49[5];
        v49[5] = v20;
        goto LABEL_24;
      }
      uint64_t v14 = (objc_class *)[v13 clientPromiseClass];
      id v15 = (void *)[[v14 alloc] initWithSeed:v13];
      if (!v15)
      {
        uint64_t v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = NSStringFromClass(v14);
          [(IXAppInstallCoordinator *)v22 essentialAssetPromisesWithError:v54];
        }

        long long v23 = NSStringFromClass(v14);
        uint64_t v25 = _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]", 2655, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to initialize promise class %@ from seed %@", v24, (uint64_t)v23);

        long long v26 = (void *)v49[5];
        v49[5] = v25;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v27 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int16 v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator essentialAssetPromisesWithError:]();
        }

        uint64_t v29 = (objc_class *)objc_opt_class();
        uint64_t v34 = NSStringFromClass(v29);
        uint64_t v31 = _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]", 2658, @"IXErrorDomain", 1uLL, 0, 0, @"Object %@ should have been for an opaque data promise subclass but was instead for class %@", v30, (uint64_t)v15);

        long long v26 = (void *)v49[5];
        v49[5] = v31;
LABEL_23:

LABEL_24:
        int v7 = 0;
        goto LABEL_25;
      }
      [v8 addObject:v15];
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v55 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_13:

  int v7 = (void *)[v8 copy];
LABEL_25:
  if (a3 && !v7) {
    *a3 = (id) v49[5];
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v7;
}

void __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator essentialAssetPromisesWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get essential asset promises: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke_261(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v8 = a3;
  if (v8)
  {
    __int16 v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v15 = 136315394;
      *(void *)&void v15[4] = "-[IXAppInstallCoordinator essentialAssetPromisesWithError:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get essential asset promises: %@", v15, 0x16u);
    }

    id v10 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v11 = a3;
  }
  else
  {
    if (!v6)
    {
      uint64_t v12 = _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]_block_invoke", 2636, @"IXErrorDomain", 0x17uLL, 0, 0, @"No essential asset promises are currently set.", v7, *(uint64_t *)v15);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      goto LABEL_8;
    }
    id v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = a2;
  }
  objc_storeStrong(v10, v11);
LABEL_8:
}

- (BOOL)getHasEssentialAssetPromises:(BOOL *)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke;
  v14[3] = &unk_1E5D17550;
  void v14[4] = self;
  void v14[5] = &v15;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  __int16 v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke_265;
  v13[3] = &unk_1E5D17780;
  void v13[4] = self;
  v13[5] = &v15;
  void v13[6] = &v21;
  void v13[7] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:hasEssentialAssetPromises:", v9, v13);

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    __int16 v9 = "-[IXAppInstallCoordinator getHasEssentialAssetPromises:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has essential asset promises: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke_265(void *a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v10 = 136315650;
      uint64_t v11 = "-[IXAppInstallCoordinator getHasEssentialAssetPromises:error:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has essential asset promises: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    __int16 v9 = (unsigned char *)a1[7];
    if (v9) {
      *__int16 v9 = a2;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)setInstallTargetDirectoryURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator setInstallTargetDirectoryURL:error:]();
  }

  uint64_t v7 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setInstallTargetDirectoryURL:error:]", 2727, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v6, (uint64_t)"-[IXAppInstallCoordinator setInstallTargetDirectoryURL:error:]");
  uint64_t v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (id)installTargetDirectoryURLWithError:(id *)a3
{
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator installTargetDirectoryURLWithError:]();
  }

  uint64_t v6 = _CreateError((uint64_t)"-[IXAppInstallCoordinator installTargetDirectoryURLWithError:]", 2758, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v5, (uint64_t)"-[IXAppInstallCoordinator installTargetDirectoryURLWithError:]");
  uint64_t v7 = v6;
  if (a3) {
    *a3 = v6;
  }

  return 0;
}

- (BOOL)setTargetBundleURL:(id)a3 preservingTargetBundleNameOnUpdate:(BOOL)a4 error:(id *)a5
{
  uint64_t v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:]();
  }

  uint64_t v8 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:]", 2793, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v7, (uint64_t)"-[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:]");
  __int16 v9 = v8;
  if (a5) {
    *a5 = v8;
  }

  return 0;
}

- (BOOL)setTargetBundleURL:(id)a3 error:(id *)a4
{
  return [(IXAppInstallCoordinator *)self setTargetBundleURL:a3 preservingTargetBundleNameOnUpdate:0 error:a4];
}

- (id)targetBundleURLWithError:(id *)a3
{
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator targetBundleURLWithError:]();
  }

  uint64_t v6 = _CreateError((uint64_t)"-[IXAppInstallCoordinator targetBundleURLWithError:]", 2831, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v5, (uint64_t)"-[IXAppInstallCoordinator targetBundleURLWithError:]");
  uint64_t v7 = v6;
  if (a3) {
    *a3 = v6;
  }

  return 0;
}

- (BOOL)setAppQuitPromise:(id)a3 error:(id *)a4
{
  uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator setAppQuitPromise:error:]();
  }

  uint64_t v7 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setAppQuitPromise:error:]", 2860, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v6, (uint64_t)"-[IXAppInstallCoordinator setAppQuitPromise:error:]");
  uint64_t v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (id)appQuitPromiseWithError:(id *)a3
{
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator appQuitPromiseWithError:]();
  }

  uint64_t v6 = _CreateError((uint64_t)"-[IXAppInstallCoordinator appQuitPromiseWithError:]", 2897, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v5, (uint64_t)"-[IXAppInstallCoordinator appQuitPromiseWithError:]");
  uint64_t v7 = v6;
  if (a3) {
    *a3 = v6;
  }

  return 0;
}

- (BOOL)setManagedInstallUUID:(id)a3 error:(id *)a4
{
  uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator setManagedInstallUUID:error:]();
  }

  uint64_t v7 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setManagedInstallUUID:error:]", 2928, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v6, (uint64_t)"-[IXAppInstallCoordinator setManagedInstallUUID:error:]");
  uint64_t v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (id)managedInstallUUIDWithError:(id *)a3
{
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator managedInstallUUIDWithError:]();
  }

  uint64_t v6 = _CreateError((uint64_t)"-[IXAppInstallCoordinator managedInstallUUIDWithError:]", 2956, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v5, (uint64_t)"-[IXAppInstallCoordinator managedInstallUUIDWithError:]");
  uint64_t v7 = v6;
  if (a3) {
    *a3 = v6;
  }

  return 0;
}

- (BOOL)setShouldOverrideGatekeeper:(BOOL)a3 error:(id *)a4
{
  uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator setShouldOverrideGatekeeper:error:]();
  }

  uint64_t v7 = _CreateError((uint64_t)"-[IXAppInstallCoordinator setShouldOverrideGatekeeper:error:]", 2987, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v6, (uint64_t)"-[IXAppInstallCoordinator setShouldOverrideGatekeeper:error:]");
  uint64_t v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (BOOL)getShouldOverrideGatekeeperValue:(BOOL *)a3 error:(id *)a4
{
  uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXAppInstallCoordinator getShouldOverrideGatekeeperValue:error:]();
  }

  uint64_t v7 = _CreateError((uint64_t)"-[IXAppInstallCoordinator getShouldOverrideGatekeeperValue:error:]", 3017, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is unsupported on this platform.", v6, (uint64_t)"-[IXAppInstallCoordinator getShouldOverrideGatekeeperValue:error:]");
  uint64_t v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (BOOL)setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  __int16 v9 = +[IXServerConnection sharedConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke;
  v16[3] = &unk_1E5D176E0;
  void v16[5] = &v17;
  void v16[6] = a3;
  void v16[4] = self;
  int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
  uint64_t v11 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke_266;
  v15[3] = &unk_1E5D17708;
  void v15[4] = self;
  v15[5] = &v17;
  void v15[6] = &v23;
  v15[7] = a3;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setRemovability:byClient:completion:", v11, a3, a4, v15);

  int v12 = *((unsigned __int8 *)v24 + 24);
  if (a5 && !*((unsigned char *)v24 + 24))
  {
    *a5 = (id) v18[5];
    int v12 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v13 = v12 != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = IXStringForAppRemovability(a1[6]);
    uint64_t v6 = a1[4];
    int v9 = 136315906;
    int v10 = "-[IXAppInstallCoordinator setRemovability:byClient:error:]_block_invoke";
    __int16 v11 = 2112;
    int v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set removability state to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke_266(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = IXStringForAppRemovability(a1[7]);
      uint64_t v7 = a1[4];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setRemovability:byClient:error:]_block_invoke";
      __int16 v10 = 2112;
      __int16 v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set removability state to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (unint64_t)removabilityWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__IXAppInstallCoordinator_removabilityWithError___block_invoke;
  v11[3] = &unk_1E5D17550;
  void v11[4] = self;
  void v11[5] = &v12;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__IXAppInstallCoordinator_removabilityWithError___block_invoke_267;
  v10[3] = &unk_1E5D17730;
  void v10[4] = self;
  v10[5] = &v12;
  void v10[6] = &v18;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:removabilityWithCompletion:", v7, v10);

  unint64_t v8 = v19[3];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    unint64_t v8 = v19[3];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __49__IXAppInstallCoordinator_removabilityWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    int v9 = "-[IXAppInstallCoordinator removabilityWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get removability state from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __49__IXAppInstallCoordinator_removabilityWithError___block_invoke_267(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v9 = 136315650;
      __int16 v10 = "-[IXAppInstallCoordinator removabilityWithError:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get removability state from %@ : %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
}

- (BOOL)setPlaceholderDisposition:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke;
  v14[3] = &unk_1E5D176E0;
  void v14[5] = &v15;
  void v14[6] = a3;
  void v14[4] = self;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  int v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke_268;
  v13[3] = &unk_1E5D17708;
  void v13[4] = self;
  v13[5] = &v15;
  void v13[6] = &v21;
  void v13[7] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:setPlaceholderDisposition:completion:", v9, a3, v13);

  int v10 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v10 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v11 = v10 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = IXStringForPlaceholderDisposition(a1[6]);
    uint64_t v6 = a1[4];
    int v9 = 136315906;
    int v10 = "-[IXAppInstallCoordinator setPlaceholderDisposition:error:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder disposition to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke_268(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = IXStringForPlaceholderDisposition(a1[7]);
      uint64_t v7 = a1[4];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setPlaceholderDisposition:error:]_block_invoke";
      __int16 v10 = 2112;
      __int16 v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder disposition to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (unint64_t)placeholderDispositionWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke;
  v11[3] = &unk_1E5D17550;
  void v11[4] = self;
  void v11[5] = &v12;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke_269;
  v10[3] = &unk_1E5D17730;
  void v10[4] = self;
  v10[5] = &v12;
  void v10[6] = &v18;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getPlaceholderDispositionWithCompletion:", v7, v10);

  unint64_t v8 = v19[3];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    unint64_t v8 = v19[3];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    int v9 = "-[IXAppInstallCoordinator placeholderDispositionWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder disposition from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke_269(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v9 = 136315650;
      __int16 v10 = "-[IXAppInstallCoordinator placeholderDispositionWithError:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder disposition from %@ : %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
}

- (unsigned)coordinatorScopeWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke;
  v11[3] = &unk_1E5D17550;
  void v11[4] = self;
  void v11[5] = &v12;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke_270;
  v10[3] = &unk_1E5D177A8;
  void v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getCoordinatorScopeWithCompletion:", v7, v10);

  unsigned __int8 v8 = *((unsigned char *)v19 + 24);
  if (a3 && !*((unsigned char *)v19 + 24))
  {
    *a3 = (id) v13[5];
    unsigned __int8 v8 = *((unsigned char *)v19 + 24);
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    int v9 = "-[IXAppInstallCoordinator coordinatorScopeWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordinator scope from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke_270(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)convertToGloballyScopedCoordinatorWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  char v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  void v12[4] = self;
  void v12[5] = &v17;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke_272;
  v11[3] = &unk_1E5D17140;
  void v11[4] = &v17;
  void v11[5] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:convertToGloballyScopedWithCompletion:", v7, v11);

  int v8 = *((unsigned __int8 *)v14 + 24);
  if (a3 && !*((unsigned char *)v14 + 24))
  {
    *a3 = (id) v18[5];
    int v8 = *((unsigned __int8 *)v14 + 24);
  }
  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    BOOL v9 = "-[IXAppInstallCoordinator convertToGloballyScopedCoordinatorWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to convert to global scope for %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke_272(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)progressHintWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__IXAppInstallCoordinator_progressHintWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__IXAppInstallCoordinator_progressHintWithError___block_invoke_273;
  v11[3] = &unk_1E5D177D0;
  void v11[4] = self;
  void v11[5] = &v13;
  void v11[6] = &v19;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getProgressHintWithCompletion:", v7, v11);

  int v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    int v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __49__IXAppInstallCoordinator_progressHintWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[IXAppInstallCoordinator progressHintWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __49__IXAppInstallCoordinator_progressHintWithError___block_invoke_273(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v12 = 136315650;
      uint64_t v13 = "-[IXAppInstallCoordinator progressHintWithError:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get progress hint for %@ : %@", (uint8_t *)&v12, 0x20u);
    }

    id v10 = (id *)(*(void *)(a1[5] + 8) + 40);
    uint64_t v11 = a3;
  }
  else
  {
    id v10 = (id *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v11 = a2;
  }
  objc_storeStrong(v10, v11);
}

- (BOOL)setProgressHint:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v7 = +[IXServerConnection sharedConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke;
  v21[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v22 = v8;
  uint64_t v23 = self;
  id v24 = &v29;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];
  id v10 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke_275;
  v16[3] = &unk_1E5D175C8;
  id v11 = v8;
  id v17 = v11;
  uint64_t v18 = self;
  uint64_t v19 = &v29;
  uint64_t v20 = &v25;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setProgressHint:completion:", v10, v11, v16);

  if (*((unsigned char *)v26 + 24))
  {
    int v12 = 1;
  }
  else
  {
    uint64_t v13 = v30[5];
    if (v13)
    {
      [(IXAppInstallCoordinator *)self cancelForReason:v13 client:15 error:0];
      int v12 = *((unsigned __int8 *)v26 + 24);
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      int v12 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    if (!v12)
    {
      *a4 = (id) v30[5];
      int v12 = *((unsigned __int8 *)v26 + 24);
    }
  }
LABEL_9:
  BOOL v14 = v12 != 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    id v10 = "-[IXAppInstallCoordinator setProgressHint:withError:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set progress hint %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke_275(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXAppInstallCoordinator setProgressHint:withError:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set progress hint %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (NSError)error
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v3 = [(IXAppInstallCoordinator *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__IXAppInstallCoordinator_error__block_invoke;
  block[3] = &unk_1E5D177F8;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v12;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v13 + 24))
  {
    id v4 = +[IXServerConnection sharedConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__IXAppInstallCoordinator_error__block_invoke_2;
    v10[3] = &unk_1E5D17550;
    void v10[4] = self;
    v10[5] = &v16;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__IXAppInstallCoordinator_error__block_invoke_276;
    v9[3] = &unk_1E5D17820;
    void v9[4] = self;
    v9[5] = &v16;
    objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:getErrorInfo:", v6, v9);
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return (NSError *)v7;
}

void __32__IXAppInstallCoordinator_error__block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 16);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v2);
  }
  else if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v3 = *(void *)(a1[5] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __32__IXAppInstallCoordinator_error__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    int v9 = "-[IXAppInstallCoordinator error]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error property for %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __32__IXAppInstallCoordinator_error__block_invoke_276(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (a2 && v6)
  {
    int v8 = [*(id *)(a1 + 32) internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__IXAppInstallCoordinator_error__block_invoke_2_277;
    block[3] = &unk_1E5D16FF0;
    block[4] = *(void *)(a1 + 32);
    id v12 = v7;
    uint64_t v13 = a2;
    dispatch_sync(v8, block);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else if (v6)
  {
    int v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      char v15 = "-[IXAppInstallCoordinator error]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error property for %@ : %@", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __32__IXAppInstallCoordinator_error__block_invoke_2_277(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
}

- (void)setError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IXUserPresentableErrorForInsufficientSpaceError(v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;

    id v4 = v7;
  }
  int v8 = [(IXAppInstallCoordinator *)self internalQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__IXAppInstallCoordinator_setError___block_invoke;
  v10[3] = &unk_1E5D17848;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

void __36__IXAppInstallCoordinator_setError___block_invoke(uint64_t a1)
{
}

- (unint64_t)errorSourceIdentifier
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v3 = [(IXAppInstallCoordinator *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke;
  block[3] = &unk_1E5D17870;
  block[4] = self;
  void block[5] = &v12;
  dispatch_sync(v3, block);

  unint64_t v4 = v13[3];
  if (!v4)
  {
    uint64_t v5 = +[IXServerConnection sharedConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2;
    v10[3] = &unk_1E5D17618;
    void v10[4] = self;
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_278;
    v9[3] = &unk_1E5D17820;
    void v9[4] = self;
    v9[5] = &v12;
    objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getErrorInfo:", v7, v9);

    unint64_t v4 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

void __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXAppInstallCoordinator errorSourceIdentifier]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error source for %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_278(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (a2 && v5)
  {
    id v7 = [*(id *)(a1 + 32) internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2_279;
    block[3] = &unk_1E5D16FF0;
    block[4] = *(void *)(a1 + 32);
    id v11 = v6;
    uint64_t v12 = a2;
    dispatch_sync(v7, block);

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  else if (v5)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[IXAppInstallCoordinator errorSourceIdentifier]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error source for %@ : %@", buf, 0x20u);
    }
  }
}

void __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2_279(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  id v5 = [(IXAppInstallCoordinator *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__IXAppInstallCoordinator_setErrorSourceIdentifier___block_invoke;
  v6[3] = &unk_1E5D17898;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __52__IXAppInstallCoordinator_setErrorSourceIdentifier___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = *(void *)(result + 40);
  return result;
}

- (BOOL)isComplete
{
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v3 = [(IXAppInstallCoordinator *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke;
  block[3] = &unk_1E5D17870;
  block[4] = self;
  void block[5] = &v14;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v15 + 24))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = +[IXServerConnection sharedConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke_2;
    v12[3] = &unk_1E5D17618;
    void v12[4] = self;
    int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke_280;
    v11[3] = &unk_1E5D17640;
    void v11[4] = self;
    void v11[5] = &v14;
    objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getIsComplete:", v7, v11);

    if (*((unsigned char *)v15 + 24))
    {
      __int16 v8 = [(IXAppInstallCoordinator *)self internalQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke_281;
      v10[3] = &unk_1E5D178C0;
      void v10[4] = self;
      void v10[5] = &v14;
      dispatch_sync(v8, v10);
    }
    BOOL v4 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);
  return v4;
}

uint64_t __37__IXAppInstallCoordinator_isComplete__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void __37__IXAppInstallCoordinator_isComplete__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXAppInstallCoordinator isComplete]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get isComplete property for %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __37__IXAppInstallCoordinator_isComplete__block_invoke_280(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator isComplete]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get isComplete property for %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

uint64_t __37__IXAppInstallCoordinator_isComplete__block_invoke_281(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

- (void)setComplete:(BOOL)a3 forApplicationRecord:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(IXAppInstallCoordinator *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__IXAppInstallCoordinator_setComplete_forApplicationRecord___block_invoke;
  block[3] = &unk_1E5D178E8;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __60__IXAppInstallCoordinator_setComplete_forApplicationRecord___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)setComplete:(BOOL)a3
{
  id v5 = [(IXAppInstallCoordinator *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__IXAppInstallCoordinator_setComplete___block_invoke;
  v6[3] = &unk_1E5D17910;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __39__IXAppInstallCoordinator_setComplete___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_onObserverCalloutQueue_handleObserverForCompletedCoordinator:(id)a3 completedApplicationRecord:(id)a4 error:(id)a5 client:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  dispatch_assert_queue_V2(v12);

  [(IXAppInstallCoordinator *)self setObserversCalled:[(IXAppInstallCoordinator *)self observersCalled] | 0x800];
  if (objc_opt_respondsToSelector()) {
    [v14 coordinatorDidRegisterForObservation:self];
  }
  unint64_t v13 = [(IXAppInstallCoordinator *)self observersCalled];
  if (v11)
  {
    [(IXAppInstallCoordinator *)self setObserversCalled:v13 | 1];
    if (objc_opt_respondsToSelector()) {
      [v14 coordinator:self canceledWithReason:v11];
    }
    if (objc_opt_respondsToSelector()) {
      [v14 coordinator:self canceledWithReason:v11 client:a6];
    }
  }
  else
  {
    [(IXAppInstallCoordinator *)self setObserversCalled:v13 | 2];
    if (objc_opt_respondsToSelector()) {
      [v14 coordinatorDidCompleteSuccessfully:self];
    }
    if (objc_opt_respondsToSelector()) {
      [v14 coordinatorDidCompleteSuccessfully:self forApplicationRecord:v10];
    }
  }
}

- (unint64_t)observersCalled
{
  id v3 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  dispatch_assert_queue_V2(v3);

  return self->_observersCalled;
}

- (void)setObserversCalled:(unint64_t)a3
{
  id v5 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  dispatch_assert_queue_V2(v5);

  self->_observersCalled = a3;
}

- (IXAppInstallCoordinatorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (IXAppInstallCoordinatorObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke;
  v7[3] = &unk_1E5D17848;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) setObserversCalled:0];
    if (*(void *)(a1 + 40))
    {
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x2020000000;
      char v32 = 0;
      uint64_t v25 = 0;
      char v26 = &v25;
      uint64_t v27 = 0x2020000000;
      uint64_t v28 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x3032000000;
      id v22 = __Block_byref_object_copy_;
      uint64_t v23 = __Block_byref_object_dispose_;
      id v24 = 0;
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy_;
      char v17 = __Block_byref_object_dispose_;
      id v18 = 0;
      id v4 = [*(id *)(a1 + 32) internalQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_2;
      block[3] = &unk_1E5D17938;
      block[4] = *(void *)(a1 + 32);
      void block[5] = &v29;
      void block[6] = &v25;
      void block[7] = &v19;
      block[8] = &v13;
      dispatch_sync(v4, block);

      if (*((unsigned char *)v30 + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "_onObserverCalloutQueue_handleObserverForCompletedCoordinator:completedApplicationRecord:error:client:", *(void *)(a1 + 40), v14[5], v20[5], v26[3]);
      }
      else
      {
        id v5 = +[IXServerConnection sharedConnection];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_3;
        v11[3] = &unk_1E5D17618;
        void v11[4] = *(void *)(a1 + 32);
        id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
        BOOL v7 = [*(id *)(a1 + 32) uniqueIdentifier];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_292;
        v9[3] = &unk_1E5D17988;
        id v8 = *(void **)(a1 + 40);
        void v9[4] = *(void *)(a1 + 32);
        id v10 = v8;
        objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:fireObserversWithCompletion:", v7, v9);
      }
      _Block_object_dispose(&v13, 8);

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
    }
  }
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 8);
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 24);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 16));
  uint64_t v2 = *(void **)(a1[4] + 56);
  id v3 = (id *)(*(void *)(a1[8] + 8) + 40);

  objc_storeStrong(v3, v2);
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    BOOL v7 = "-[IXAppInstallCoordinator setObserver:]_block_invoke_3";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to fire observer methods for newly added observer to %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_292(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) observerCalloutQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[IXAppInstallCoordinator setObserver:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      char v26 = v3;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to fire observers for %@ : %@", buf, 0x20u);
    }
  }
  BOOL v7 = [v3 domain];
  if ([v7 isEqualToString:@"IXErrorDomain"])
  {
    BOOL v8 = [v3 code] == 6;

    if (v8 && ([*(id *)(a1 + 32) observersCalled] & 1) == 0)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      char v26 = __Block_byref_object_copy_;
      uint64_t v27 = __Block_byref_object_dispose_;
      id v28 = 0;
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = &v15;
      uint64_t v17 = 0x3032000000;
      id v18 = __Block_byref_object_copy_;
      uint64_t v19 = __Block_byref_object_dispose_;
      id v20 = 0;
      uint64_t v9 = [*(id *)(a1 + 32) internalQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_293;
      block[3] = &unk_1E5D17960;
      block[4] = *(void *)(a1 + 32);
      uint64_t v12 = buf;
      uint64_t v13 = &v21;
      id v14 = &v15;
      id v11 = v3;
      dispatch_sync(v9, block);

      objc_msgSend(*(id *)(a1 + 32), "_onObserverCalloutQueue_handleObserverForCompletedCoordinator:completedApplicationRecord:error:client:", *(void *)(a1 + 40), v16[5], *(void *)(*(void *)&buf[8] + 40), v22[3]);
      _Block_object_dispose(&v15, 8);

      _Block_object_dispose(&v21, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
  }
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_293(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 1;
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v8 = *(void **)(v6 + 16);
    BOOL v7 = (id *)(v6 + 16);
    id v3 = v8;
    if (!v8)
    {
      objc_storeStrong(v7, *(id *)(a1 + 40));
      *(void *)(*(void *)(a1 + 32) + 24) = 15;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 15;
      return;
    }
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 24);
    return;
  }
  id v3 = *(void **)(v2 + 16);
  if (v3) {
    goto LABEL_7;
  }
  id v4 = *(void **)(v2 + 56);
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  objc_storeStrong(v5, v4);
}

- (BOOL)pauseWithError:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__IXAppInstallCoordinator_pauseWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  void v12[4] = self;
  void v12[5] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  BOOL v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__IXAppInstallCoordinator_pauseWithError___block_invoke_294;
  v11[3] = &unk_1E5D172A8;
  void v11[4] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:setIsPaused:completion:", v7, 1, v11);

  BOOL v8 = (void *)v14[5];
  if (a3 && v8)
  {
    *a3 = v8;
    BOOL v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __42__IXAppInstallCoordinator_pauseWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    BOOL v9 = "-[IXAppInstallCoordinator pauseWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send pause message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __42__IXAppInstallCoordinator_pauseWithError___block_invoke_294(uint64_t a1, void *a2)
{
}

- (BOOL)resumeWithError:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__IXAppInstallCoordinator_resumeWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  void v12[4] = self;
  void v12[5] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  BOOL v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__IXAppInstallCoordinator_resumeWithError___block_invoke_295;
  v11[3] = &unk_1E5D172A8;
  void v11[4] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:setIsPaused:completion:", v7, 0, v11);

  int v8 = (void *)v14[5];
  if (a3 && v8)
  {
    *a3 = v8;
    int v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __43__IXAppInstallCoordinator_resumeWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    BOOL v9 = "-[IXAppInstallCoordinator resumeWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send resume message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __43__IXAppInstallCoordinator_resumeWithError___block_invoke_295(uint64_t a1, void *a2)
{
}

- (BOOL)isPaused:(BOOL *)a3 withError:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  BOOL v7 = +[IXServerConnection sharedConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__IXAppInstallCoordinator_isPaused_withError___block_invoke;
  v14[3] = &unk_1E5D17550;
  void v14[4] = self;
  void v14[5] = &v15;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  BOOL v9 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__IXAppInstallCoordinator_isPaused_withError___block_invoke_296;
  v13[3] = &unk_1E5D17668;
  void v13[4] = &v15;
  v13[5] = a3;
  objc_msgSend(v8, "_remote_IXSCoordinatedAppInstall:getIsPausedWithCompletion:", v9, v13);

  __int16 v10 = (void *)v16[5];
  if (a4 && v10)
  {
    *a4 = v10;
    __int16 v10 = (void *)v16[5];
  }
  BOOL v11 = v10 == 0;
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __46__IXAppInstallCoordinator_isPaused_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    BOOL v9 = "-[IXAppInstallCoordinator isPaused:withError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send resume message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __46__IXAppInstallCoordinator_isPaused_withError___block_invoke_296(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    **(unsigned char **)(a1 + 40) = a2;
  }
}

- (BOOL)prioritizeWithError:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  void v12[4] = self;
  void v12[5] = &v13;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke_297;
  v11[3] = &unk_1E5D172A8;
  void v11[4] = &v13;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:prioritizeWithCompletion:", v7, v11);

  int v8 = (void *)v14[5];
  if (a3 && v8)
  {
    *a3 = v8;
    int v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    BOOL v9 = "-[IXAppInstallCoordinator prioritizeWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send resume message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke_297(uint64_t a1, void *a2)
{
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(IXAppInstallCoordinator *)self identity];
  id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  int v8 = IXStringForClientID([(IXAppInstallCoordinator *)self creatorIdentifier]);
  BOOL v9 = [v3 stringWithFormat:@"<%@<%p> identity:%@ uuid:%@ creator:%@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)descriptionWithRemoteState
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(IXAppInstallCoordinator *)self identity];
  id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  int v8 = IXStringForClientID([(IXAppInstallCoordinator *)self creatorIdentifier]);
  unint64_t v9 = [(IXAppInstallCoordinator *)self coordinationState];
  if (v9 > 0x1C) {
    __int16 v10 = 0;
  }
  else {
    __int16 v10 = off_1E5D17AF8[v9];
  }
  uint64_t v11 = [v3 stringWithFormat:@"<%@<%p> identity:%@ uuid:%@ creator:%@ state:%@>", v5, self, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (unint64_t)hash
{
  uint64_t v2 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 uniqueIdentifier];

    if (v6)
    {
      id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
      int v8 = [v5 uniqueIdentifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)coordinationState
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  unint64_t v3 = [(IXAppInstallCoordinator *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__IXAppInstallCoordinator_coordinationState__block_invoke;
  block[3] = &unk_1E5D178C0;
  block[4] = self;
  void block[5] = &v12;
  dispatch_sync(v3, block);

  unint64_t v4 = v13[3];
  if (!v4)
  {
    id v5 = +[IXServerConnection sharedConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__IXAppInstallCoordinator_coordinationState__block_invoke_2;
    v10[3] = &unk_1E5D17618;
    void v10[4] = self;
    uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    id v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__IXAppInstallCoordinator_coordinationState__block_invoke_304;
    v9[3] = &unk_1E5D17820;
    void v9[4] = self;
    void v9[5] = &v12;
    objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getCoordinationState:", v7, v9);

    unint64_t v4 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __44__IXAppInstallCoordinator_coordinationState__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = 1;
  }
  else
  {
    if (!*(unsigned char *)(v1 + 8)) {
      return result;
    }
    uint64_t v2 = 28;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __44__IXAppInstallCoordinator_coordinationState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[IXAppInstallCoordinator coordinationState]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordination state for %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __44__IXAppInstallCoordinator_coordinationState__block_invoke_304(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXAppInstallCoordinator coordinationState]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordination state for %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (NSString)bundleID
{
  uint64_t v2 = [(IXAppInstallCoordinator *)self identity];
  id v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (IXApplicationIdentity)identity
{
  uint64_t v2 = [(IXAppInstallCoordinator *)self seed];
  id v3 = [v2 identity];

  return (IXApplicationIdentity *)v3;
}

- (NSUUID)uniqueIdentifier
{
  uint64_t v2 = [(IXAppInstallCoordinator *)self seed];
  id v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (unint64_t)creatorIdentifier
{
  uint64_t v2 = [(IXAppInstallCoordinator *)self seed];
  unint64_t v3 = [v2 creator];

  return v3;
}

- (unsigned)creatorEUID
{
  uint64_t v2 = [(IXAppInstallCoordinator *)self seed];
  unsigned int v3 = [v2 creatorEUID];

  return v3;
}

- (void)_clientDelegate_didRegisterForObservation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got observer registration delegate", buf, 0x16u);
  }

  unint64_t v4 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__IXAppInstallCoordinator__clientDelegate_didRegisterForObservation__block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __68__IXAppInstallCoordinator__clientDelegate_didRegisterForObservation__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 136315394;
      id v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      uint64_t v11 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_11:
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) observersCalled] & 0x800) != 0)
  {
    unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v17 = 136315394;
      id v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      uint64_t v11 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x800);
  char v3 = objc_opt_respondsToSelector();
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(sel_coordinatorDidRegisterForObservation_);
      int v17 = 136316162;
      id v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v2;
      __int16 v25 = 2112;
      char v26 = v16;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v17, 0x34u);
    }
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = NSStringFromSelector(sel_coordinatorDidRegisterForObservation_);
    __int16 v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v17 = 136316162;
    id v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    char v26 = v2;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v17, 0x34u);
  }
  [v2 coordinatorDidRegisterForObservation:*(void *)(a1 + 32)];
LABEL_13:
}

- (void)_clientDelegate_shouldPrioritize
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should prioritize delegate", buf, 0x16u);
  }

  unint64_t v4 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__IXAppInstallCoordinator__clientDelegate_shouldPrioritize__block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __59__IXAppInstallCoordinator__clientDelegate_shouldPrioritize__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 136315394;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
    goto LABEL_10;
  }
  char v3 = objc_opt_respondsToSelector();
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(sel_coordinatorShouldPrioritize_);
      int v15 = 136316162;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      id v22 = v2;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = NSStringFromSelector(sel_coordinatorShouldPrioritize_);
    __int16 v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v15 = 136316162;
    uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v2;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);
  }
  [v2 coordinatorShouldPrioritize:*(void *)(a1 + 32)];
LABEL_11:
}

- (void)_clientDelegate_shouldResume
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should resume delegate", buf, 0x16u);
  }

  unint64_t v4 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__IXAppInstallCoordinator__clientDelegate_shouldResume__block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __55__IXAppInstallCoordinator__clientDelegate_shouldResume__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 136315394;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
    goto LABEL_10;
  }
  char v3 = objc_opt_respondsToSelector();
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(sel_coordinatorShouldResume_);
      int v15 = 136316162;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      id v22 = v2;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = NSStringFromSelector(sel_coordinatorShouldResume_);
    __int16 v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v15 = 136316162;
    uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v2;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);
  }
  [v2 coordinatorShouldResume:*(void *)(a1 + 32)];
LABEL_11:
}

- (void)_clientDelegate_shouldPause
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should pause delegate", buf, 0x16u);
  }

  unint64_t v4 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__IXAppInstallCoordinator__clientDelegate_shouldPause__block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __54__IXAppInstallCoordinator__clientDelegate_shouldPause__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 136315394;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
    goto LABEL_10;
  }
  char v3 = objc_opt_respondsToSelector();
  unint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(sel_coordinatorShouldPause_);
      int v15 = 136316162;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      id v22 = v2;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = NSStringFromSelector(sel_coordinatorShouldPause_);
    __int16 v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v15 = 136316162;
    uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = v2;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);
  }
  [v2 coordinatorShouldPause:*(void *)(a1 + 32)];
LABEL_11:
}

- (void)_clientDelegate_promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v9 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got promise did begin fulfillment for identifier %lu", buf, 0x20u);
  }

  uint64_t v6 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__IXAppInstallCoordinator__clientDelegate_promiseDidBeginFulfillmentWithIdentifier___block_invoke;
  v7[3] = &unk_1E5D17898;
  void v7[4] = self;
  void v7[5] = a3;
  dispatch_async(v6, v7);
}

void __84__IXAppInstallCoordinator__clientDelegate_promiseDidBeginFulfillmentWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v29 = 136315394;
      uint64_t v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v6;
      uint64_t v7 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_10:
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v29, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v3 = *(void *)(a1 + 40) - 1;
  if (v3 > 7) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1A7B95A68[v3];
  }
  if (([*(id *)(a1 + 32) observersCalled] & v4) != 0)
  {
    BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v29 = 136315394;
      uint64_t v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      uint64_t v7 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | v4);
  char v9 = objc_opt_respondsToSelector();
  if (v9)
  {
    __int16 v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      __int16 v12 = NSStringFromSelector(sel_promiseDidBeginFulfillmentWithIdentifier_);
      unint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v29 = 136316162;
      uint64_t v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      id v34 = v12;
      __int16 v35 = 2112;
      long long v36 = v14;
      __int16 v37 = 2048;
      long long v38 = v2;
      _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v29, 0x34u);
    }
    [v2 promiseDidBeginFulfillmentWithIdentifier:*(void *)(a1 + 40)];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v9) {
        goto LABEL_12;
      }
      BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        char v26 = (objc_class *)objc_opt_class();
        uint64_t v27 = NSStringFromClass(v26);
        id v28 = NSStringFromSelector(sel_coordinator_configuredPromiseDidBeginFulfillment_);
        int v29 = 136316162;
        uint64_t v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
        __int16 v31 = 2112;
        uint64_t v32 = v25;
        __int16 v33 = 2112;
        id v34 = v27;
        __int16 v35 = 2048;
        long long v36 = v2;
        __int16 v37 = 2112;
        long long v38 = v28;
        _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v29, 0x34u);
      }
      goto LABEL_11;
    }
    goto LABEL_23;
  }
  int v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    __int16 v17 = NSStringFromSelector(sel_coordinator_configuredPromisePromiseDidBeginFulfillment_);
    uint64_t v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    int v29 = 136316162;
    uint64_t v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
    __int16 v31 = 2112;
    uint64_t v32 = v16;
    __int16 v33 = 2112;
    id v34 = v17;
    __int16 v35 = 2112;
    long long v36 = v19;
    __int16 v37 = 2048;
    long long v38 = v2;
    _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v29, 0x34u);
  }
  [v2 coordinator:*(void *)(a1 + 32) configuredPromisePromiseDidBeginFulfillment:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
LABEL_23:
    uint64_t v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = NSStringFromSelector(sel_coordinator_configuredPromiseDidBeginFulfillment_);
      __int16 v23 = (objc_class *)objc_opt_class();
      uint64_t v24 = NSStringFromClass(v23);
      int v29 = 136316162;
      uint64_t v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      id v34 = v22;
      __int16 v35 = 2112;
      long long v36 = v24;
      __int16 v37 = 2048;
      long long v38 = v2;
      _os_log_impl(&dword_1A7B2D000, v20, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v29, 0x34u);
    }
    [v2 coordinator:*(void *)(a1 + 32) configuredPromiseDidBeginFulfillment:*(void *)(a1 + 40)];
  }
LABEL_12:
}

- (void)_clientDelegate_shouldBeginRestoringUserData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]";
    __int16 v8 = 2112;
    char v9 = self;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should begin restoring user data delegate", buf, 0x16u);
  }

  uint64_t v4 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__IXAppInstallCoordinator__clientDelegate_shouldBeginRestoringUserData__block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __71__IXAppInstallCoordinator__clientDelegate_shouldBeginRestoringUserData__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 136315394;
      uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      uint64_t v11 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_11:
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) observersCalled] & 0x80) != 0)
  {
    uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v17 = 136315394;
      uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      uint64_t v11 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x80);
  char v3 = objc_opt_respondsToSelector();
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(sel_coordinatorShouldBeginRestoringUserData_);
      int v17 = 136316162;
      uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v2;
      __int16 v25 = 2112;
      char v26 = v16;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v17, 0x34u);
    }
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = NSStringFromSelector(sel_coordinatorShouldBeginRestoringUserData_);
    __int16 v8 = (objc_class *)objc_opt_class();
    char v9 = NSStringFromClass(v8);
    int v17 = 136316162;
    uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    char v26 = v2;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v17, 0x34u);
  }
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
LABEL_13:
}

- (void)_clientDelegate_shouldBeginPostProcessingForApplicationRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should begin post processing delegate for app record %@", buf, 0x20u);
  }

  uint64_t v6 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__IXAppInstallCoordinator__clientDelegate_shouldBeginPostProcessingForApplicationRecord___block_invoke;
  v8[3] = &unk_1E5D17848;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __89__IXAppInstallCoordinator__clientDelegate_shouldBeginPostProcessingForApplicationRecord___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 136315394;
      uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      uint64_t v11 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_11:
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) observersCalled] & 0x2000) != 0)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v17 = 136315394;
      uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      uint64_t v11 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x2000);
  char v3 = objc_opt_respondsToSelector();
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      __int16 v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
      int v17 = 136316162;
      uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v2;
      __int16 v25 = 2112;
      char v26 = v16;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v17, 0x34u);
    }
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
    __int16 v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v17 = 136316162;
    uint64_t v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    char v26 = v2;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v17, 0x34u);
  }
  [v2 coordinatorShouldBeginPostProcessing:*(void *)(a1 + 32) forApplicationRecord:*(void *)(a1 + 40)];
LABEL_13:
}

- (void)_clientDelegate_placeholderDidInstallForApplicationRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got placeholder did install delegate for app record %@", buf, 0x20u);
  }

  uint64_t v6 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__IXAppInstallCoordinator__clientDelegate_placeholderDidInstallForApplicationRecord___block_invoke;
  v8[3] = &unk_1E5D17848;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __85__IXAppInstallCoordinator__clientDelegate_placeholderDidInstallForApplicationRecord___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v22 = 136315394;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      uint64_t v10 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_12:
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) observersCalled] & 4) != 0)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 136315394;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      uint64_t v10 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 4);
  if (objc_opt_respondsToSelector())
  {
    char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      BOOL v5 = NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_);
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v22 = 136316162;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      int v29 = v7;
      __int16 v30 = 2048;
      __int16 v31 = v2;
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);
    }
    [v2 coordinatorDidInstallPlaceholder:*(void *)(a1 + 32)];
    if (objc_opt_respondsToSelector()) {
      goto LABEL_16;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
LABEL_16:
      __int16 v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_forApplicationRecord_);
        id v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        int v22 = 136316162;
        __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2112;
        int v29 = v16;
        __int16 v30 = 2048;
        __int16 v31 = v2;
        _os_log_impl(&dword_1A7B2D000, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);
      }
      [v2 coordinatorDidInstallPlaceholder:*(void *)(a1 + 32) forApplicationRecord:*(void *)(a1 + 40)];
      goto LABEL_14;
    }
    int v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      __int16 v21 = NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_forApplicationRecord_);
      int v22 = 136316162;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2048;
      int v29 = v2;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_1A7B2D000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v22, 0x34u);
    }
  }
LABEL_14:
}

- (void)_clientDelegate_didCompleteForApplicationRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got completion delegate for app record %@", buf, 0x20u);
  }

  [(IXAppInstallCoordinator *)self setComplete:1 forApplicationRecord:v4];
  uint64_t v6 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__IXAppInstallCoordinator__clientDelegate_didCompleteForApplicationRecord___block_invoke;
  v8[3] = &unk_1E5D17848;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __75__IXAppInstallCoordinator__clientDelegate_didCompleteForApplicationRecord___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v22 = 136315394;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      uint64_t v10 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_12:
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) observersCalled] & 2) != 0)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 136315394;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      uint64_t v10 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 2);
  if (objc_opt_respondsToSelector())
  {
    char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      BOOL v5 = NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_);
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v22 = 136316162;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      int v29 = v7;
      __int16 v30 = 2048;
      __int16 v31 = v2;
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);
    }
    [v2 coordinatorDidCompleteSuccessfully:*(void *)(a1 + 32)];
    if (objc_opt_respondsToSelector()) {
      goto LABEL_16;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
LABEL_16:
      __int16 v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        __int16 v14 = NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_);
        id v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        int v22 = 136316162;
        __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2112;
        int v29 = v16;
        __int16 v30 = 2048;
        __int16 v31 = v2;
        _os_log_impl(&dword_1A7B2D000, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);
      }
      [v2 coordinatorDidCompleteSuccessfully:*(void *)(a1 + 32) forApplicationRecord:*(void *)(a1 + 40)];
      goto LABEL_14;
    }
    int v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      __int16 v21 = NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_);
      int v22 = 136316162;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2048;
      int v29 = v2;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_1A7B2D000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v22, 0x34u);
    }
  }
LABEL_14:
}

- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = IXStringForClientID(a4);
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]";
    __int16 v21 = 2112;
    int v22 = self;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    __int16 v26 = v8;
    _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: Got cancel delegate with reason %@ client %@", buf, 0x2Au);
  }
  uint64_t v9 = [(IXAppInstallCoordinator *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke;
  block[3] = &unk_1E5D16FF0;
  block[4] = self;
  id v10 = v6;
  id v17 = v10;
  unint64_t v18 = a4;
  dispatch_sync(v9, block);

  uint64_t v11 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke_2;
  v13[3] = &unk_1E5D16FF0;
  void v13[4] = self;
  id v14 = v10;
  unint64_t v15 = a4;
  id v12 = v10;
  dispatch_async(v11, v13);
}

void __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
}

void __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (!v2)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v22 = 136315394;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke_2";
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      id v10 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_12:
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) observersCalled])
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 136315394;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      id v10 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 1);
  if (objc_opt_respondsToSelector())
  {
    char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      BOOL v5 = NSStringFromSelector(sel_coordinator_canceledWithReason_);
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v22 = 136316162;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      int v29 = v7;
      __int16 v30 = 2048;
      __int16 v31 = v2;
      _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);
    }
    [v2 coordinator:*(void *)(a1 + 32) canceledWithReason:*(void *)(a1 + 40)];
    if (objc_opt_respondsToSelector()) {
      goto LABEL_16;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
LABEL_16:
      id v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        id v14 = NSStringFromSelector(sel_coordinator_canceledWithReason_client_);
        unint64_t v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        int v22 = 136316162;
        __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2112;
        int v29 = v16;
        __int16 v30 = 2048;
        __int16 v31 = v2;
        _os_log_impl(&dword_1A7B2D000, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);
      }
      [v2 coordinator:*(void *)(a1 + 32) canceledWithReason:*(void *)(a1 + 40) client:*(void *)(a1 + 48)];
      goto LABEL_14;
    }
    id v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      __int16 v21 = NSStringFromSelector(sel_coordinator_canceledWithReason_client_);
      int v22 = 136316162;
      __int16 v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2048;
      int v29 = v2;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_1A7B2D000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v22, 0x34u);
    }
  }
LABEL_14:
}

- (void)_clientDelegate_didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown progress value %lu", a4);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = off_1E5D17BE0[a4];
    }
    *(_DWORD *)buf = 136316162;
    id v14 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]";
    __int16 v15 = 2112;
    uint64_t v16 = self;
    __int16 v17 = 2048;
    double v18 = a3;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = a5;
    _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: Got did update progress delegate with percentComplete %f phase %@ overallProgress %f", buf, 0x34u);
  }
  uint64_t v11 = [(IXAppInstallCoordinator *)self observerCalloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__IXAppInstallCoordinator__clientDelegate_didUpdateProgress_forPhase_overallProgress___block_invoke;
  block[3] = &unk_1E5D179D8;
  block[4] = self;
  *(double *)&void block[5] = a3;
  void block[6] = a4;
  *(double *)&void block[7] = a5;
  dispatch_async(v11, block);
}

void __86__IXAppInstallCoordinator__clientDelegate_didUpdateProgress_forPhase_overallProgress___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  if (v2)
  {
    if (objc_opt_respondsToSelector())
    {
      char v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        BOOL v5 = NSStringFromSelector(sel_coordinator_didUpdateProgress_forPhase_overallProgress_);
        id v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        int v15 = 136316162;
        uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        __int16 v19 = 2112;
        uint64_t v20 = v5;
        __int16 v21 = 2112;
        double v22 = v7;
        __int16 v23 = 2048;
        __int16 v24 = v2;
        _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);
      }
      [v2 coordinator:*(void *)(a1 + 32) didUpdateProgress:*(void *)(a1 + 48) forPhase:*(double *)(a1 + 40) overallProgress:*(double *)(a1 + 56)];
    }
    else if (([*(id *)(a1 + 32) observersCalled] & 0x1000) == 0)
    {
      id v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        id v14 = NSStringFromSelector(sel_coordinator_didUpdateProgress_forPhase_overallProgress_);
        int v15 = 136316162;
        uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v13;
        __int16 v21 = 2048;
        double v22 = v2;
        __int16 v23 = 2112;
        __int16 v24 = v14;
        _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x1000);
    }
  }
  else
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 136315394;
      uint64_t v16 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
  }
}

- (IXAppInstallCoordinatorSeed)seed
{
  return self->_seed;
}

- (LSApplicationRecord)completedApplicationRecord
{
  return self->_completedApplicationRecord;
}

- (BOOL)isRegisteredWithDaemon
{
  return self->_isRegisteredWithDaemon;
}

- (void)setIsRegisteredWithDaemon:(BOOL)a3
{
  self->_isRegisteredWithDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedApplicationRecord, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)purgeAllCoordinatorsAndPromisesForCreator:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v4 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke;
  v8[3] = &unk_1E5D172A8;
  void v8[4] = &v9;
  BOOL v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke_662;
  v7[3] = &unk_1E5D172A8;
  void v7[4] = &v9;
  objc_msgSend(v5, "_remote_purgeRegisteredCoordinatorsAndPromisesForCreator:completion:", a3, v7);

  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

void __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator(IXTesting) purgeAllCoordinatorsAndPromisesForCreator:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke_662(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "+[IXAppInstallCoordinator(IXTesting) purgeAllCoordinatorsAndPromisesForCreator:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to purge registered coordinators and promises: %@", (uint8_t *)&v5, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

+ (BOOL)killDaemonForTesting
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = -1;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = -2;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v2 = +[IXServerConnection sharedConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke;
  v15[3] = &unk_1E5D172A8;
  void v15[4] = &v16;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_663;
  v14[3] = &unk_1E5D17A00;
  void v14[4] = &v16;
  void v14[5] = &v24;
  objc_msgSend(v3, "_remote_pingDaemonWithCompletion:", v14);

  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v4 = +[IXServerConnection sharedConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_665;
    v13[3] = &unk_1E5D172A8;
    void v13[4] = &v16;
    int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v13];
    objc_msgSend(v5, "_remote_killDaemonForTestingWithCompletion:", &__block_literal_global_668);

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_669;
    v12[3] = &unk_1E5D17A48;
    void v12[4] = &v20;
    id v6 = +[IXServerConnection retrySynchronousIPC:v12];
    if (*((_DWORD *)v25 + 6) == *((_DWORD *)v21 + 6))
    {
      __int16 v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *((_DWORD *)v25 + 6);
        int v9 = *((_DWORD *)v21 + 6);
        *(_DWORD *)buf = 136315650;
        int v29 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]";
        __int16 v30 = 1024;
        int v31 = v8;
        __int16 v32 = 1024;
        int v33 = v9;
        _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Daemon restart didn't work - before PID equal to after PID (%d == %d)", buf, 0x18u);
      }

      BOOL v10 = 0;
      *((unsigned char *)v17 + 24) = 0;
    }
    else
    {
      BOOL v10 = *((unsigned char *)v17 + 24) != 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v10;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_663(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v7, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_665(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 4097) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_8:
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_666(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 136315394;
      __int16 v9 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v2;
      uint64_t v5 = "%s: Got completion error: %@";
      id v6 = v3;
      uint32_t v7 = 22;
LABEL_6:
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    int v8 = 136315138;
    __int16 v9 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
    uint64_t v5 = "%s: Got completion";
    id v6 = v3;
    uint32_t v7 = 12;
    goto LABEL_6;
  }
}

id __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_669(uint64_t a1)
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v2 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_2;
  v8[3] = &unk_1E5D172A8;
  void v8[4] = &v9;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_670;
  v7[3] = &unk_1E5D17A00;
  uint64_t v4 = *(void *)(a1 + 32);
  void v7[4] = &v9;
  void v7[5] = v4;
  objc_msgSend(v3, "_remote_pingDaemonWithCompletion:", v7);

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke_2";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_670(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

+ (int)daemonPid
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke;
  v5[3] = &unk_1E5D17A48;
  v5[4] = &v6;
  id v2 = +[IXServerConnection retrySynchronousIPC:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v2 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_2;
  v8[3] = &unk_1E5D172A8;
  void v8[4] = &v9;
  int v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_672;
  v7[3] = &unk_1E5D17A00;
  uint64_t v4 = *(void *)(a1 + 32);
  void v7[4] = &v9;
  void v7[5] = v4;
  objc_msgSend(v3, "_remote_pingDaemonWithCompletion:", v7);

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "+[IXAppInstallCoordinator(IXTesting) daemonPid]_block_invoke_2";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_672(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "+[IXAppInstallCoordinator(IXTesting) daemonPid]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

+ (BOOL)postNSCurrentLocaleDidChangeNotification
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  id v2 = +[IXServerConnection sharedConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke;
  v6[3] = &unk_1E5D172A8;
  void v6[4] = &v7;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke_673;
  v5[3] = &unk_1E5D172A8;
  v5[4] = &v7;
  objc_msgSend(v3, "_remote_postNSCurrentLocaleDidChangeNotification:", v5);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 4097) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "+[IXAppInstallCoordinator(IXTesting) postNSCurrentLocaleDidChangeNotification]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_8:
}

void __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke_673(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "+[IXAppInstallCoordinator(IXTesting) postNSCurrentLocaleDidChangeNotification]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Posting NSCurrentLocaleDidChange got completion error: %@", (uint8_t *)&v5, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

+ (BOOL)setTestingEnabled:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = +[IXServerConnection sharedConnection];
  int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_675];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__IXAppInstallCoordinator_IXTesting__setTestingEnabled___block_invoke_676;
  v7[3] = &unk_1E5D172A8;
  void v7[4] = &v8;
  objc_msgSend(v5, "_remote_setTestingEnabled:completion:", v3, v7);

  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __56__IXAppInstallCoordinator_IXTesting__setTestingEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "+[IXAppInstallCoordinator(IXTesting) setTestingEnabled:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __56__IXAppInstallCoordinator_IXTesting__setTestingEnabled___block_invoke_676(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "+[IXAppInstallCoordinator(IXTesting) setTestingEnabled:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      int v5 = "%s: Got completion error: %@";
      __int16 v6 = v4;
      uint32_t v7 = 22;
LABEL_6:
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[IXAppInstallCoordinator(IXTesting) setTestingEnabled:]_block_invoke";
      int v5 = "%s: Got completion";
      __int16 v6 = v4;
      uint32_t v7 = 12;
      goto LABEL_6;
    }
  }
}

+ (BOOL)setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = +[IXServerConnection sharedConnection];
  __int16 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_678];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__IXAppInstallCoordinator_IXTesting__setTestModeForIdentifierPrefix_testMode_testSpecificValidationData___block_invoke_679;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v13;
  objc_msgSend(v10, "_remote_setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:completion:", v7, a4, v8, v12);

  LOBYTE(a4) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return a4;
}

void __105__IXAppInstallCoordinator_IXTesting__setTestModeForIdentifierPrefix_testMode_testSpecificValidationData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "+[IXAppInstallCoordinator(IXTesting) setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __105__IXAppInstallCoordinator_IXTesting__setTestModeForIdentifierPrefix_testMode_testSpecificValidationData___block_invoke_679(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "+[IXAppInstallCoordinator(IXTesting) setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      int v5 = "%s: Got completion error: %@";
      __int16 v6 = v4;
      uint32_t v7 = 22;
LABEL_6:
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[IXAppInstallCoordinator(IXTesting) setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:]_block_invoke";
      int v5 = "%s: Got completion";
      __int16 v6 = v4;
      uint32_t v7 = 12;
      goto LABEL_6;
    }
  }
}

+ (BOOL)setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4
{
  return [a1 setTestModeForIdentifierPrefix:a3 testMode:a4 testSpecificValidationData:0];
}

+ (BOOL)simulateClientDeath
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = -1;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = -2;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v2 = +[IXServerConnection sharedConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke;
  v15[3] = &unk_1E5D172A8;
  void v15[4] = &v16;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_680;
  v14[3] = &unk_1E5D17A00;
  void v14[4] = &v16;
  void v14[5] = &v24;
  objc_msgSend(v3, "_remote_pingDaemonWithCompletion:", v14);

  if (*((unsigned char *)v17 + 24))
  {
    int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v29 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]";
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Simulating client death by resetting daemon connection", buf, 0xCu);
    }

    [v2 resetDaemonConnection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_681;
    v11[3] = &unk_1E5D17A70;
    id v12 = v2;
    uint64_t v13 = &v20;
    id v5 = +[IXServerConnection retrySynchronousIPC:v11];
    if (*((_DWORD *)v25 + 6) == *((_DWORD *)v21 + 6))
    {
      BOOL v6 = *((unsigned char *)v17 + 24) != 0;
    }
    else
    {
      uint32_t v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *((_DWORD *)v25 + 6);
        int v9 = *((_DWORD *)v21 + 6);
        *(_DWORD *)buf = 136315650;
        int v29 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]";
        __int16 v30 = 1024;
        int v31 = v8;
        __int16 v32 = 1024;
        int v33 = v9;
        _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Daemon died when we reset our connection to it (%d != %d)", buf, 0x18u);
      }

      BOOL v6 = 0;
      *((unsigned char *)v17 + 24) = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    BOOL v6 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_680(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v7, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

id __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_681(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_2;
  v8[3] = &unk_1E5D172A8;
  void v8[4] = &v9;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_682;
  v7[3] = &unk_1E5D17A00;
  uint64_t v4 = *(void *)(a1 + 40);
  void v7[4] = &v9;
  void v7[5] = v4;
  objc_msgSend(v3, "_remote_pingDaemonWithCompletion:", v7);

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke_2";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_682(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

+ (BOOL)associateMultiPersonaAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withError:(id *)a5
{
  id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]();
  }

  int v8 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]", 34, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not available on this platform.", v7, (uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]");
  __int16 v9 = v8;
  if (a5) {
    *a5 = v8;
  }

  return 0;
}

+ (BOOL)addBundleIDs:(id)a3 toMappingsForPersona:(id)a4 error:(id *)a5
{
  id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXPersonaBasedMultiUser) addBundleIDs:toMappingsForPersona:error:]();
  }

  int v8 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) addBundleIDs:toMappingsForPersona:error:]", 65, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not available on this platform.", v7, (uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) addBundleIDs:toMappingsForPersona:error:]");
  __int16 v9 = v8;
  if (a5) {
    *a5 = v8;
  }

  return 0;
}

+ (BOOL)removeBundleIDs:(id)a3 fromMappingsForPersona:(id)a4 error:(id *)a5
{
  id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXPersonaBasedMultiUser) removeBundleIDs:fromMappingsForPersona:error:]();
  }

  int v8 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) removeBundleIDs:fromMappingsForPersona:error:]", 96, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not available on this platform.", v7, (uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) removeBundleIDs:fromMappingsForPersona:error:]");
  __int16 v9 = v8;
  if (a5) {
    *a5 = v8;
  }

  return 0;
}

+ (BOOL)registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  __int16 v9 = +[IXServerConnection sharedConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke;
  v19[3] = &unk_1E5D17140;
  void v19[4] = &v20;
  void v19[5] = &v26;
  __int16 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1;
  v15[3] = &unk_1E5D17578;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = &v20;
  uint64_t v18 = &v26;
  objc_msgSend(v10, "_remote_registerContentsForDiskImageAtURL:options:completion:", v11, v8, v15);

  int v12 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v12 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1_cold_1(a1);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
}

+ (BOOL)unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  __int16 v9 = +[IXServerConnection sharedConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke;
  v19[3] = &unk_1E5D17140;
  void v19[4] = &v20;
  void v19[5] = &v26;
  __int16 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3;
  v15[3] = &unk_1E5D17578;
  id v11 = v7;
  id v16 = v11;
  __int16 v17 = &v20;
  uint64_t v18 = &v26;
  objc_msgSend(v10, "_remote_unregisterContentsForDiskImageAtURL:options:completion:", v11, v8, v15);

  int v12 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v12 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3_cold_1(a1);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
}

+ (id)_coordinatorForIdentity:(id)a3 created:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc(MEMORY[0x1E4F223C8]);
  __int16 v9 = [v7 bundleID];
  __int16 v10 = (void *)[v8 initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];

  if (v10 && ([v10 isPlaceholder] & 1) == 0)
  {
    id v11 = IXUpdatingAppInstallCoordinator;
    uint64_t v19 = 0;
    int v12 = (id *)&v19;
    BOOL v13 = &v19;
  }
  else
  {
    id v11 = IXInitiatingAppInstallCoordinator;
    uint64_t v18 = 0;
    int v12 = (id *)&v18;
    BOOL v13 = &v18;
  }
  id v14 = -[__objc2_class processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:](v11, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v7, 12, 1, a4, v13, v18, v19);
  id v15 = *v12;
  id v16 = v15;
  if (a5 && !v14) {
    *a5 = v15;
  }

  return v14;
}

+ (void)installApplication:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7
{
}

+ (void)_beginInstallForURL:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 progressBlock:(id)a7 completion:(id)a8
{
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __136__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completion___block_invoke;
  v20[3] = &unk_1E5D17FC8;
  id v21 = v13;
  id v19 = v13;
  [v18 _beginInstallForURL:v17 forPersonaUniqueString:v16 consumeSource:v10 options:v15 progressBlock:v14 completionWithIdentity:v20];
}

void __136__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 bundleID];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)_beginInstallForURL:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 progressBlock:(id)a7 completionWithIdentity:(id)a8
{
  BOOL v11 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (sAppInstallCoordinatorQueueOnce != -1) {
    dispatch_once(&sAppInstallCoordinatorQueueOnce, &__block_literal_global_3);
  }
  id v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v14 path];
    id v21 = (void *)v20;
    *(_DWORD *)buf = 136315906;
    long long v38 = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:"
          "progressBlock:completionWithIdentity:]";
    __int16 v39 = 2112;
    if (v11) {
      int v22 = 89;
    }
    else {
      int v22 = 78;
    }
    uint64_t v40 = v20;
    __int16 v41 = 1024;
    int v42 = v22;
    __int16 v43 = 2112;
    id v44 = v16;
    _os_log_impl(&dword_1A7B2D000, v19, OS_LOG_TYPE_DEFAULT, "%s: Beginning install for %@ consuming source:%c options:%@", buf, 0x26u);
  }
  int v23 = sAppInstallCoordinatorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119;
  block[3] = &unk_1E5D18018;
  BOOL v36 = v11;
  id v30 = v14;
  id v31 = v16;
  id v32 = v15;
  id v33 = v18;
  id v34 = v17;
  id v35 = a1;
  id v24 = v17;
  id v25 = v15;
  id v26 = v16;
  id v27 = v18;
  id v28 = v14;
  dispatch_async(v23, block);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)sOutstandingDelegates;
  sOutstandingDelegates = v0;

  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.installcoordination.simple_install_coordinator", v4);
  id v3 = (void *)sAppInstallCoordinatorQueue;
  sAppInstallCoordinatorQueue = (uint64_t)v2;
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119(uint64_t a1)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  char v106 = 0;
  dispatch_queue_t v2 = +[IXFileManager defaultManager];
  char v105 = 1;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__6;
  v103 = __Block_byref_object_dispose__6;
  id v104 = 0;
  id v78 = *(id *)(a1 + 32);
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_121;
  v93[3] = &unk_1E5D17FF0;
  char v98 = *(unsigned char *)(a1 + 80);
  id v3 = v2;
  id v94 = v3;
  id v95 = *(id *)(a1 + 32);
  v97 = &v99;
  id v96 = *(id *)(a1 + 56);
  uint64_t v4 = (void (**)(void, void, void))MEMORY[0x1AD0D48B0](v93);
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v79 = v5;
    if ([v79 installTargetType] != 1)
    {
      id v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_8();
      }

      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 303, @"IXErrorDomain", 4uLL, 0, 0, @"This SPI can only install apps", v7, v72);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    id v79 = (id)objc_opt_new();
    [v79 setInstallTargetType:1];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v92 = 0;
  int v10 = [v3 itemExistsAtURL:v9 isDirectory:&v105 error:&v92];
  id v11 = v92;
  id v8 = v11;
  if (!v10)
  {
LABEL_13:
    id v15 = 0;
    id v14 = 0;
LABEL_14:
    id v16 = 0;
    id v17 = 0;
    v76 = 0;
    uint64_t v77 = 0;
    goto LABEL_15;
  }
  if (v105)
  {
    id v12 = v11;
  }
  else
  {
    id v91 = v11;
    uint64_t v29 = [v3 createTemporaryExtractionDirectoryWithError:&v91];
    id v30 = v91;

    id v31 = (void *)v100[5];
    v100[5] = v29;

    uint64_t v32 = v100[5];
    if (!v32)
    {
      uint64_t v49 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_3((uint64_t)v30, v49, v50, v51, v52, v53, v54, v55);
      }

      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 318, @"IXErrorDomain", 0x2AuLL, v30, 0, @"Failed to create directory for extraction", v56, v72);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = 0;
      id v17 = 0;
      v76 = 0;
      uint64_t v77 = 0;
      goto LABEL_65;
    }
    uint64_t v33 = *(void *)(a1 + 32);
    id v90 = v30;
    char v34 = [MEMORY[0x1E4F78068] extractZipArchiveAtURL:v33 toURL:v32 withError:&v90];
    id v12 = v90;

    if ((v34 & 1) == 0)
    {
      __int16 v57 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v68 = [*(id *)(a1 + 32) path];
        v69 = [(id)v100[5] path];
        *(_DWORD *)buf = 136315906;
        v109 = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:opt"
               "ions:progressBlock:completionWithIdentity:]_block_invoke";
        __int16 v110 = 2112;
        v111 = v68;
        __int16 v112 = 2112;
        v113 = v69;
        __int16 v114 = 2112;
        id v115 = v12;
        _os_log_error_impl(&dword_1A7B2D000, v57, OS_LOG_TYPE_ERROR, "%s: Failed to extract %@ to %@ : %@", buf, 0x2Au);
      }
      id v30 = [*(id *)(a1 + 32) path];
      __int16 v74 = [(id)v100[5] path];
      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 323, @"IXErrorDomain", 0x2AuLL, v12, 0, @"Failed to extract %@ to %@", v58, (uint64_t)v30);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      id v14 = 0;
      id v17 = 0;
      v76 = 0;
      uint64_t v77 = 0;
      goto LABEL_63;
    }
    id v35 = (id)v100[5];

    id v78 = v35;
  }
  id v13 = [v79 iTunesMetadata];
  id v89 = v12;
  id v14 = +[IXPlaceholder placeholderForInstallable:v78 client:12 installType:1 metadata:v13 error:&v89];
  id v8 = v89;

  if (!v14)
  {
    id v15 = 0;
    goto LABEL_14;
  }
  uint64_t v77 = [v14 bundleID];
  if (*(void *)(a1 + 48)) {
    v76 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v77 personaUniqueString:*(void *)(a1 + 48)];
  }
  else {
    v76 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v77];
  }
  BOOL v36 = [IXPromisedTransferToPath alloc];
  __int16 v37 = [NSString stringWithFormat:@"App Asset: %@"];
  id v17 = [(IXPromisedTransferToPath *)v36 initWithName:v37 client:12 transferPath:v78 diskSpaceNeeded:0];

  if (!v17)
  {
    char v46 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_4();
    }

    uint64_t v48 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 344, @"IXErrorDomain", 2uLL, 0, 0, @"Failed to create app asset promise", v47, (uint64_t)v77);
    id v17 = 0;
    id v30 = v8;
    goto LABEL_56;
  }
  if (!*(unsigned char *)(a1 + 80) && !v100[5]) {
    [(IXPromisedTransferToPath *)v17 setShouldCopy:1];
  }
  long long v38 = *(void **)(a1 + 72);
  id v88 = v8;
  __int16 v39 = [v38 _coordinatorForIdentity:v76 created:&v106 error:&v88];
  id v30 = v88;

  if (!v39)
  {
    id v15 = 0;
    id v16 = 0;
    id v8 = v30;
    goto LABEL_15;
  }
  if (v106)
  {
    id v15 = v39;
    goto LABEL_46;
  }
  if ([v39 creatorIdentifier] != 12)
  {

    __int16 v63 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_7();
    }

    uint64_t v48 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 397, @"IXErrorDomain", 0x1DuLL, 0, 0, @"A coordinated install for %@ (not initiated by IXClientSimpleSPI) is already pending.", v64, (uint64_t)v77);
LABEL_56:
    id v8 = (id)v48;
LABEL_65:

    id v15 = 0;
    id v16 = 0;
    goto LABEL_15;
  }
  __int16 v59 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v109 = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options"
           ":progressBlock:completionWithIdentity:]_block_invoke";
    __int16 v110 = 2112;
    v111 = v77;
    _os_log_impl(&dword_1A7B2D000, v59, OS_LOG_TYPE_DEFAULT, "%s: A coordinated install for %@ is already pending. Trying to cancel the existing one to create a new one.", buf, 0x16u);
  }

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 370, @"IXErrorDomain", 0x20uLL, 0, 0, @"IXSimpleInstaller canceling existing coordinator", v60, (uint64_t)v77);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v87 = v30;
  int v61 = [v39 cancelForReason:v12 client:12 error:&v87];
  id v75 = v87;

  if (!v61)
  {

    uint64_t v65 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_6();
    }

    uint64_t v67 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 392, @"IXErrorDomain", 0x1DuLL, 0, 0, @"Failed to cancel an already existing coordinator.", v66, v73);
    id v30 = v75;
    goto LABEL_83;
  }
  char v106 = 0;
  uint64_t v62 = *(void **)(a1 + 72);
  id v86 = v75;
  id v15 = [v62 _coordinatorForIdentity:v76 created:&v106 error:&v86];
  id v30 = v86;

  if (!v15)
  {
    id v8 = v30;
    goto LABEL_64;
  }
  if (!v106)
  {

    __int16 v70 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_5();
    }

    uint64_t v67 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 387, @"IXErrorDomain", 0x1DuLL, 0, 0, @"Failed to re-create a coordinator for %@.", v71, (uint64_t)v77);
LABEL_83:
    id v8 = (id)v67;
LABEL_63:

LABEL_64:
    id v30 = v12;
    goto LABEL_65;
  }

LABEL_46:
  id v16 = objc_opt_new();
  [v16 setBundleID:v77];
  [v16 setCoordinator:v15];
  [v16 setCompletion:v4];
  [v16 setProgressBlock:*(void *)(a1 + 64)];
  [v15 setObserver:v16];
  if ([v79 isUserInitiated])
  {
    id v85 = v30;
    int v40 = [v15 setImportance:3 error:&v85];
    id v8 = v85;

    id v30 = v8;
    if (!v40) {
      goto LABEL_78;
    }
  }
  id v84 = v30;
  int v41 = [v15 setInstallOptions:v79 error:&v84];
  id v8 = v84;

  if (!v41)
  {
LABEL_78:
    if (!v16) {
      goto LABEL_15;
    }
LABEL_79:
    [v16 setCompletion:0];
    goto LABEL_15;
  }
  id v83 = v8;
  int v42 = [v15 setAppAssetPromise:v17 error:&v83];
  id v43 = v83;

  if (!v42)
  {
    id v8 = v43;
    goto LABEL_78;
  }
  id v82 = v43;
  int v44 = [v15 setInitialODRAssetPromises:MEMORY[0x1E4F1CBF0] error:&v82];
  id v8 = v82;

  if (!v44) {
    goto LABEL_78;
  }
  [(IXPromisedTransferToPath *)v17 setComplete:1];
  id v81 = v8;
  int v45 = [v15 setPlaceholderPromise:v14 error:&v81];
  id v18 = v81;

  if (v45)
  {
    _AddDelegateToMap(v16);
    goto LABEL_33;
  }
  id v8 = v18;
  if (v16) {
    goto LABEL_79;
  }
LABEL_15:
  id v18 = v8;
  if (!v8)
  {
    id v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [*(id *)(a1 + 32) path];
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_2(v20, (uint64_t)buf, v19);
    }

    id v21 = [*(id *)(a1 + 32) path];
    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 463, @"IXErrorDomain", 1uLL, 0, 0, @"An unknown error occured while installing %@", v22, (uint64_t)v21);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v15)
  {
    [v15 setObserver:0];
    [v15 cancelForReason:v18 client:12 error:0];
  }
  if (v14) {
    [v14 cancelForReason:v18 client:12 error:0];
  }
  if (v17) {
    [(IXDataPromise *)v17 cancelForReason:v18 client:12 error:0];
  }
  uint64_t v23 = v100[5];
  if (v23)
  {
    id v80 = 0;
    char v24 = [v3 removeItemAtURL:v23 error:&v80];
    id v25 = v80;
    if ((v24 & 1) == 0)
    {
      id v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = [(id)v100[5] path];
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_1(v27, (uint64_t)v25, (uint64_t)v107, v26);
      }
    }
    id v28 = (void *)v100[5];
    v100[5] = 0;
  }
  if (*(void *)(a1 + 56)) {
    ((void (**)(void, void, id))v4)[2](v4, 0, v18);
  }
LABEL_33:

  _Block_object_dispose(&v99, 8);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 32);
    id v20 = 0;
    char v9 = [v8 removeItemAtURL:v7 error:&v20];
    id v10 = v20;
    if ((v9 & 1) == 0)
    {
      id v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_121_cold_2((id *)(a1 + 40), (uint64_t)v10, v11);
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v12)
  {
    id v13 = *(void **)(a1 + 32);
    id v19 = v10;
    char v14 = [v13 removeItemAtURL:v12 error:&v19];
    id v15 = v19;

    if ((v14 & 1) == 0)
    {
      id v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_121_cold_1(a1 + 56, (uint64_t)v15, v16);
      }
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
  }
  else
  {
    id v15 = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)installApplication:(id)a3 consumeSource:(BOOL)a4 options:(id)a5 completion:(id)a6
{
}

+ (void)installApplication:(id)a3 options:(id)a4 completion:(id)a5
{
}

+ (void)installApplication:(id)a3 toURL:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7
{
  id v7 = a7;
  id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:options:completion:]();
  }

  id v10 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:options:completion:]", 512, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not supported on this platform.", v9, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:options:completion:]");
  if (v7)
  {
    id v11 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_options_completion___block_invoke;
    block[3] = &unk_1E5D17190;
    id v14 = v7;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

uint64_t __104__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

+ (void)installApplication:(id)a3 toTargetDirectory:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7
{
  id v7 = a7;
  id v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:options:completion:]();
  }

  id v10 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:options:completion:]", 526, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not supported on this platform.", v9, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:options:completion:]");
  if (v7)
  {
    id v11 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_options_completion___block_invoke;
    block[3] = &unk_1E5D17190;
    id v14 = v7;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

uint64_t __116__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

+ (void)installApplication:(id)a3 toURL:(id)a4 consumeSource:(BOOL)a5 shouldOverrideGatekeeper:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  id v8 = a8;
  uint64_t v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:shouldOverrideGatekeeper:options:completion:]();
  }

  id v11 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:shouldOverrideGatekeeper:options:completion:]", 540, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not supported on this platform.", v10, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:shouldOverrideGatekeeper:options:completion:]");
  if (v8)
  {
    uint64_t v12 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke;
    block[3] = &unk_1E5D17190;
    id v15 = v8;
    id v14 = v11;
    dispatch_async(v12, block);
  }
}

uint64_t __129__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

+ (void)installApplication:(id)a3 toTargetDirectory:(id)a4 consumeSource:(BOOL)a5 shouldOverrideGatekeeper:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  id v8 = a8;
  uint64_t v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:]();
  }

  id v11 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:]", 554, @"IXErrorDomain", 0x22uLL, 0, 0, @"%s is not supported on this platform.", v10, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:]");
  if (v8)
  {
    uint64_t v12 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __141__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke;
    block[3] = &unk_1E5D17190;
    id v15 = v8;
    id v14 = v11;
    dispatch_async(v12, block);
  }
}

uint64_t __141__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

+ (void)installApplication:(id)a3 consumeSource:(BOOL)a4 options:(id)a5 legacyProgressBlock:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke;
  uint64_t v22 = &unk_1E5D18040;
  id v23 = v12;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = a5;
  id v17 = a3;
  id v18 = (void *)MEMORY[0x1AD0D48B0](&v19);
  objc_msgSend(a1, "_beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completion:", v17, 0, v9, v16, v15, v18, v19, v20, v21, v22);
}

void __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      uint64_t v26 = a1;
      id v9 = v6;
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
      id v25 = v32;
      uint64_t v31 = 0;
      v32[0] = &v31;
      v32[1] = 0x3032000000;
      v32[2] = __Block_byref_object_copy__6;
      v32[3] = __Block_byref_object_dispose__6;
      id v33 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      id v28 = ___CreateLegacyCallbackErrorDict_block_invoke;
      uint64_t v29 = &unk_1E5D18068;
      id v30 = &v31;
      id v11 = v9;
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      id v13 = v11;
      do
      {
        if (!v28((uint64_t)v27, v13)) {
          break;
        }
        id v14 = objc_msgSend(v13, "userInfo", v25);
        uint64_t v15 = [v14 objectForKeyedSubscript:v12];

        id v13 = (void *)v15;
      }
      while (v15);

      id v16 = *(void **)(v32[0] + 40);
      if (v16)
      {
        id v17 = [v16 userInfo];
        id v18 = [v17 objectForKeyedSubscript:@"LegacyErrorString"];

        uint64_t v19 = v18;
        if (!v18)
        {
          uint64_t v20 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke_cold_1((uint64_t)v25, v20);
          }

          uint64_t v19 = @"APIInternalError";
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, @"Error", v25);
        id v21 = [*(id *)(v32[0] + 40) userInfo];
        uint64_t v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F6F550]];

        if (v22) {
          [v10 setObject:v22 forKeyedSubscript:@"ErrorDetail"];
        }
        id v23 = [*(id *)(v32[0] + 40) userInfo];
        id v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

        if (v24) {
          [v10 setObject:v24 forKeyedSubscript:@"ErrorDescription"];
        }
      }
      else
      {
        [v10 setObject:@"APIInternalError" forKeyedSubscript:@"Error"];
        id v18 = [v11 description];
        [v10 setObject:v18 forKeyedSubscript:@"ErrorDescription"];
      }

      _Block_object_dispose(&v31, 8);
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

      a1 = v26;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a3;
  id v14 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v13];

  [a1 demoteAppToPlaceholderWithApplicationIdentity:v14 forReason:a4 waitForDeletion:v8 ignoreRemovability:v7 completion:v12];
}

+ (void)_demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 returnEarlyForTesting:(BOOL)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  if (sAppInstallCoordinatorQueueOnce_0 != -1) {
    dispatch_once(&sAppInstallCoordinatorQueueOnce_0, &__block_literal_global_8);
  }
  if (a4 - 1 >= 3)
  {
    uint64_t v20 = sAppInstallCoordinatorQueue_0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2;
    block[3] = &unk_1E5D183B0;
    id v17 = (id *)v30;
    v30[0] = v14;
    v30[1] = a4;
    id v21 = v14;
    dispatch_async(v20, block);
  }
  else
  {
    unint64_t v15 = a4 + 6;
    id v16 = sAppInstallCoordinatorQueue_0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101;
    v22[3] = &unk_1E5D183D8;
    BOOL v26 = a5;
    id v17 = &v23;
    id v18 = v13;
    BOOL v27 = a7;
    id v23 = v18;
    id v24 = v14;
    BOOL v28 = a6;
    unint64_t v25 = v15;
    id v19 = v14;
    dispatch_async(v16, v22);
  }
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)sOutstandingDelegates_0;
  sOutstandingDelegates_0 = v0;

  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.installcoordination.downgrade_to_placeholder_coordinator", v4);
  id v3 = (void *)sAppInstallCoordinatorQueue_0;
  sAppInstallCoordinatorQueue_0 = (uint64_t)v2;
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2(uint64_t a1)
{
  dispatch_queue_t v2 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_cold_1(a1, v2);
  }

  uint64_t v4 = _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 108, @"IXErrorDomain", 4uLL, 0, 0, @"Invalid IXAppInstallCoordinatorDemotionReason %lu passed to %s", v3, *(void *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  char v55 = 0;
  dispatch_queue_t v2 = objc_opt_new();
  [v2 setWaitForDeletion:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  id v54 = 0;
  uint64_t v5 = +[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:v3 withClientID:12 createIfNotExisting:1 created:&v55 error:&v54];
  id v6 = v54;
  if (!v5) {
    goto LABEL_32;
  }
  if (v55)
  {
    if (IXBuildHasInternalDiagnostics() && *(unsigned char *)(a1 + 57))
    {
      BOOL v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_7(v7);
      }

      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 147, @"IXErrorDomain", 0x36uLL, 0, 0, @"Triggered early return intended for testing.", v8, v44);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = *(void *)(a1 + 40);
      if (v10) {
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
      }
      id v11 = 0;
      id v12 = 0;
      id v13 = 0;
      id v14 = 0;
      goto LABEL_44;
    }
    id v53 = v6;
    int v15 = [v5 setImportance:3 error:&v53];
    id v16 = v53;

    if (v15)
    {
      if (*(unsigned char *)(a1 + 58))
      {
        id v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = *v4;
          *(_DWORD *)buf = 136315394;
          __int16 v57 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReaso"
                "n:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
          __int16 v58 = 2112;
          id v59 = v18;
          _os_log_impl(&dword_1A7B2D000, v17, OS_LOG_TYPE_DEFAULT, "%s: Client requested to ignore removability while demoting %@", buf, 0x16u);
        }

        goto LABEL_15;
      }
      id v26 = *v4;
      id v52 = v16;
      unint64_t v27 = +[IXAppInstallCoordinator removabilityForAppWithIdentity:v26 error:&v52];
      id v6 = v52;

      if (v27 == 1)
      {
        id v16 = v6;
LABEL_15:
        id v19 = objc_alloc(MEMORY[0x1E4F223C8]);
        uint64_t v20 = [*v4 bundleID];
        id v51 = v16;
        id v13 = (void *)[v19 initWithBundleIdentifier:v20 allowPlaceholder:1 error:&v51];
        id v21 = v51;

        if (v13)
        {
          if ([v13 isPlaceholder])
          {
            uint64_t v22 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_5();
            }

            _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 180, @"IXErrorDomain", 4uLL, 0, 0, @"Cannot demote app with identity %@ because it is a placeholder", v23, (uint64_t)*v4);
          }
          else
          {
            uint64_t v35 = [v13 URL];
            if (v35)
            {
              id v12 = (void *)v35;
              uint64_t v36 = *(void *)(a1 + 48);
              id v50 = v21;
              id v11 = +[IXPlaceholder placeholderForInstallable:v35 client:12 installType:v36 metadata:0 error:&v50];
              id v6 = v50;

              if (v11)
              {
                id v14 = objc_opt_new();
                __int16 v37 = [*v4 bundleID];
                [v14 setBundleID:v37];

                [v14 setCoordinator:v5];
                [v5 setObserver:v14];
                id v49 = v6;
                int v46 = [v5 setInstallOptions:v2 error:&v49];
                id v9 = v49;

                if (v46)
                {
                  long long v38 = v9;
                  id v48 = v9;
                  int v47 = [v5 setPlaceholderPromise:v11 error:&v48];
                  id v9 = v48;

                  if (v47)
                  {
                    _AddDelegateToMap_0(v14);
                    [v14 setCompletion:*(void *)(a1 + 40)];
                    goto LABEL_44;
                  }
                }
                id v6 = v9;
                if (v14) {
                  [v14 setCompletion:0];
                }
              }
              else
              {
                id v14 = 0;
              }
              goto LABEL_34;
            }
            int v42 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_6();
            }

            _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 186, @"IXErrorDomain", 4uLL, 0, 0, @"LSApplicationProxy for %@ did not contain a bundleURL during demotion", v43, (uint64_t)*v4);
          }
          id v6 = (id)objc_claimAutoreleasedReturnValue();

          id v14 = 0;
          goto LABEL_33;
        }
        id v30 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_4();
        }

        _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 175, @"IXErrorDomain", 1uLL, v21, 0, @"No LSApplicationRecord found for %@ during demotion", v31, (uint64_t)*v4);
        id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
        id v14 = 0;
        id v13 = 0;
LABEL_33:
        id v12 = 0;
        id v11 = 0;
        goto LABEL_34;
      }
      if (!v27)
      {
        BOOL v28 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = *v4;
          *(_DWORD *)buf = 136315650;
          __int16 v57 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReaso"
                "n:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
          __int16 v58 = 2112;
          id v59 = v29;
          __int16 v60 = 2112;
          id v61 = v6;
          _os_log_impl(&dword_1A7B2D000, v28, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch removability for app with identity %@: %@", buf, 0x20u);
        }

        goto LABEL_32;
      }
      __int16 v39 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_3((uint64_t *)(a1 + 32), v27, v39);
      }

      id v40 = *v4;
      int v45 = IXStringForAppRemovability(v27);
      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 166, @"IXErrorDomain", 0x25uLL, 0, 0, @"Cannot demote app with identity %@ because removability is %@", v41, (uint64_t)v40);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {

    id v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_2();
    }

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 140, @"IXErrorDomain", 0x1DuLL, 0, 0, @"A demotion for %@ is already pending.", v25, (uint64_t)*v4);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = 0;
  }
  id v14 = 0;
  id v13 = 0;
  id v12 = 0;
  id v11 = 0;
  id v6 = v16;
LABEL_34:
  id v9 = v6;
  if (!v6)
  {
    uint64_t v32 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_1();
    }

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 222, @"IXErrorDomain", 1uLL, 0, 0, @"An unknown error occured while demoting %@", v33, (uint64_t)*v4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    [v5 setObserver:0];
    [v5 cancelForReason:v9 client:12 error:0];
  }
  if (v11) {
    [v11 cancelForReason:v9 client:12 error:0];
  }
  uint64_t v34 = *(void *)(a1 + 40);
  if (v34) {
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v9);
  }
LABEL_44:
}

+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 error:(id *)a5
{
  return [a1 demoteAppToPlaceholderWithBundleID:a3 forReason:a4 waitForDeletion:0 error:a5];
}

+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v10];

  LOBYTE(a6) = [a1 demoteAppToPlaceholderWithApplicationIdentity:v11 forReason:a4 waitForDeletion:v7 ignoreRemovability:0 error:a6];
  return (char)a6;
}

+ (void)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 completion:(id)a6
{
}

+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v12];

  LOBYTE(a7) = [a1 demoteAppToPlaceholderWithApplicationIdentity:v13 forReason:a4 waitForDeletion:v9 ignoreRemovability:v8 error:a7];
  return (char)a7;
}

+ (void)demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 completion:(id)a7
{
  [a1 _demoteAppToPlaceholderWithApplicationIdentity:a3 forReason:a4 waitForDeletion:a5 ignoreRemovability:a6 returnEarlyForTesting:0 completion:a7];
}

+ (BOOL)demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__9;
  unint64_t v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __147__IXAppInstallCoordinator_IXDemoteToPlaceholder__demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_error___block_invoke;
  v19[3] = &unk_1E5D18400;
  id v21 = &v23;
  uint64_t v22 = &v29;
  id v14 = v13;
  uint64_t v20 = v14;
  int v15 = (void *)MEMORY[0x1AD0D48B0](v19);
  [a1 demoteAppToPlaceholderWithApplicationIdentity:v12 forReason:a4 waitForDeletion:v9 ignoreRemovability:v8 completion:v15];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  int v16 = *((unsigned __int8 *)v30 + 24);
  if (a7 && !*((unsigned char *)v30 + 24))
  {
    *a7 = (id) v24[5];
    int v16 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __147__IXAppInstallCoordinator_IXDemoteToPlaceholder__demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__9;
  uint64_t v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __134__IXAppInstallCoordinator_IXDemoteToPlaceholderTesting__testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity_forReason_error___block_invoke;
  v15[3] = &unk_1E5D18400;
  BOOL v17 = &v19;
  id v18 = &v25;
  id v10 = v9;
  int v16 = v10;
  id v11 = (void *)MEMORY[0x1AD0D48B0](v15);
  [a1 _demoteAppToPlaceholderWithApplicationIdentity:v8 forReason:a4 waitForDeletion:0 ignoreRemovability:0 returnEarlyForTesting:1 completion:v11];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  int v12 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((unsigned char *)v26 + 24))
  {
    *a5 = (id) v20[5];
    int v12 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __134__IXAppInstallCoordinator_IXDemoteToPlaceholderTesting__testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity_forReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_7_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_DEBUG, "%s: Completion block called in client for priority boost conveyance for coordinator UUID %@ : %@", (uint8_t *)v1, 0x20u);
}

+ (void)_validatePreconditionForIntent:(unint64_t)a1 matchesCurrentInstallStateForBundleID:(NSObject *)a2 .cold.1(unint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _StringForIXCoordinatorIntent(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_FAULT, "%s: Unknown intent: %@", (uint8_t *)v4, 0x16u);
}

+ (void)_validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_FAULT, "%s: Warning: client is attempting to create a promoting coordinator for %@, which is not currently installed at all.", (uint8_t *)v1, 0x16u);
}

+ (void)_validatePreconditionForIntent:(os_log_t)log matchesCurrentInstallStateForBundleID:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_FAULT, "%s: Warning: client is attempting to create a promoting coordinator for %@, which is not currently a placeholder (%@).", (uint8_t *)&v3, 0x20u);
}

+ (void)_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Expected a non-nil application identity : %@", v2, v3, v4, v5, 2u);
}

+ (void)_coordinatorForAppWithIdentity:(_DWORD *)a3 targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:.cold.2(void *a1, void *a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_10((uint64_t)a1, (uint64_t)a2, (uint64_t)a3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v7, v5, "%s: Failed to find class for coordinator intent %@ for coordinator %@ : %@", v6);
}

void __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_24_cold_1(uint64_t a1, void *a2)
{
  [a2 intent];
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Expected to create coordinator with intent %lu but created object had intent %lu : %@", v4, v5, v6, v7, 2u);
}

+ (void)coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s must be called on a concrete subclass, not the abstract superclass : %@", v2, v3, v4, v5, 2u);
}

+ (void)coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s must be called on concrete subclasses, not the abstract superclass : %@", v2, v3, v4, v5, 2u);
}

+ (void)processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s must be called on a concrete subclass, not the abstract superclass : %@", v2, v3, v4, v5, 2u);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Async enumeration block reference somehow became nil while enumerating install coordinators : %@", v2, v3, v4, v5, 2u);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to get next seed while enumerating install coordinators : %@", v2, v3, v4, v5, 2u);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_3(void *a1)
{
  uint64_t v2 = _StringForIXCoordinatorIntent([a1 intent]);
  uint64_t v9 = [a1 identity];
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Failed to find class for coordinator intent %@ for coordinator %@ : %@", v5, v6, v7, v8, 2u);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_50_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create coordinator object : %@", v2, v3, v4, v5, 2u);
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_65_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 40) identity];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_ERROR, "%s: Unexpectedly created coordinator for %@ while enumerating; canceling it : %@",
    (uint8_t *)v4,
    0x20u);
}

void __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to uninstall identity:%@ with error:%@", (uint8_t *)v1, 0x20u);
}

void __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to contact daemon : %@", v2, v3, v4, v5, 2u);
}

+ (void)updateSINFForAppWithIdentity:wrapperURL:sinfData:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)updateiTunesMetadataForAppWithIdentity:plistData:options:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Unable to decode supplied plist data : %@", v2, v3, v4, v5, 2u);
}

+ (void)updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: Reason passed to %s was nil! : %@", v2, v3, v4, v5, 2u);
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: Failed to create termination request for identifier %@ : %@", v2, v3, v4, v5, 2u);
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v0, (uint64_t)v0, "%s: Failed to look up container for identifier %@: container error = %llu : %@", (uint8_t *)v1);
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v0, (uint64_t)v0, "%s: Failed to refresh data container for identifier %@: container error = %llu : %@", (uint8_t *)v1);
}

+ (void)refreshContainerTypes:forApplicationIdentity:reason:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: Reason passed to %s was nil : %@", v2, v3, v4, v5, 2u);
}

void __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to contact daemon : %@", v2, v3, v4, v5, 2u);
}

- (void)cancelForReason:client:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Reason passed to -[IXAppInstallCoordinator cancelForReason:client:error:] was nil! : %@", v2, v3, v4, v5, 2u);
}

- (void)cancelForReason:client:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -[IXAppInstallCoordinator cancelForReason:client:error:] was called with client of IXClientNone which is invalid : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderPromise:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: placeholderPromise argument to %s was nil : %@", v2, v3, v4, v5, 2u);
}

- (void)setPlaceholderPromise:error:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: App extension placeholder promise passed to %s instead of app placeholder promise : %@", v2, v3, v4, v5, 2u);
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_172_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_172_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for a placeholder data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_186_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

- (void)setAppAssetPromiseResponsibleClient:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Client IXClientNone was passed to -setAppAssetPromiseResponsibleClient:error:, but that doesn't make sense : %@", v2, v3, v4, v5, 2u);
}

- (void)setInstallOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Options argument to -setInstallOptions:error: was nil : %@", v2, v3, v4, v5, 2u);
}

- (void)setInstallOptions:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create data promise for serialized install options : %@", v2, v3, v4, v5, 2u);
}

- (void)initialODRAssetPromisesWithError:(_DWORD *)a3 .cold.1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_10((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Failed to initialize promise class %@ from seed %@ : %@", v5);
}

- (void)initialODRAssetPromisesWithError:.cold.2()
{
  OUTLINED_FUNCTION_12();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_7(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Object %@ should have been for an opaque data promise subclass but was instead for class %@ : %@", v5);
}

- (void)initialODRAssetPromisesWithError:.cold.3()
{
  OUTLINED_FUNCTION_12();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_7(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@ : %@", v5);
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_236_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_236_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_246_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_246_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_252_cold_1()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_252_cold_2()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_17(v0, *MEMORY[0x1E4F143B8]);
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A7B2D000, v3, v4, "%s: Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);
}

- (void)essentialAssetPromisesWithError:(_DWORD *)a3 .cold.1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_10((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Failed to initialize promise class %@ from seed %@ : %@", v5);
}

- (void)essentialAssetPromisesWithError:.cold.2()
{
  OUTLINED_FUNCTION_12();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_7(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Object %@ should have been for an opaque data promise subclass but was instead for class %@ : %@", v5);
}

- (void)essentialAssetPromisesWithError:.cold.3()
{
  OUTLINED_FUNCTION_12();
  _DWORD *v1 = 136315906;
  OUTLINED_FUNCTION_7(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_8(&dword_1A7B2D000, v6, v4, "%s: Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@ : %@", v5);
}

- (void)setInstallTargetDirectoryURL:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)installTargetDirectoryURLWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)targetBundleURLWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)setAppQuitPromise:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)appQuitPromiseWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)setManagedInstallUUID:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)managedInstallUUIDWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)setShouldOverrideGatekeeper:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

- (void)getShouldOverrideGatekeeperValue:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to contact daemon: %@", (uint8_t *)v1, 0x16u);
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_2(&dword_1A7B2D000, v2, v3, "%s: Failed to register contents on disk image at %@ : %@", v4, v5, v6, v7, 2u);
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to contact daemon: %@", (uint8_t *)v1, 0x16u);
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_2(&dword_1A7B2D000, v2, v3, "%s: Failed to unregister contents on disk image at %@ : %@", v4, v5, v6, v7, 2u);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315650;
  *(void *)(a3 + 4) = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeS"
                        "ource:options:progressBlock:completionWithIdentity:]_block_invoke";
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a4, a3, "%s: Failed to clean up extracted content at %@ : %@", (uint8_t *)a3);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315650;
  *(void *)(a2 + 4) = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeS"
                        "ource:options:progressBlock:completionWithIdentity:]_block_invoke";
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  *(_WORD *)(a2 + 22) = 2112;
  *(void *)(a2 + 24) = 0;
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a3, (uint64_t)a3, "%s: An unknown error occured while installing %@ : %@", (uint8_t *)a2);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to create app asset promise : %@", v2, v3, v4, v5, 2u);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_5()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: Failed to re-create a coordinator for %@. : %@", v2, v3, v4, v5, 2u);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to cancel an already existing coordinator. : %@", v2, v3, v4, v5, 2u);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_7()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: A coordinated install for %@ (not initiated by IXClientSimpleSPI) is already pending. : %@", v2, v3, v4, v5, 2u);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: This SPI can only install apps : %@", v2, v3, v4, v5, 2u);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_121_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) path];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a3, v5, "%s: Failed to remove extracted content at %@ : %@", (uint8_t *)v6);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_121_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 path];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, a3, v5, "%s: Failed to remove installable at %@ : %@", (uint8_t *)v6);
}

void __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  uint64_t v4 = "_CreateLegacyCallbackErrorDict";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_DEBUG, "%s: Failed to get legacy error string from NSError %@", (uint8_t *)&v3, 0x16u);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 136315906;
  uint64_t v4 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke_2";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  __int16 v7 = 2080;
  uint64_t v8 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke_2";
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_ERROR, "%s: Invalid IXAppInstallCoordinatorDemotionReason %lu passed to %s : %@", (uint8_t *)&v3, 0x2Au);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: An unknown error occured while demoting %@ : %@", v2, v3, v4, v5, 2u);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_2()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: A demotion for %@ is already pending. : %@", v2, v3, v4, v5, 2u);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_3(uint64_t *a1, unint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = IXStringForAppRemovability(a2);
  int v6 = 136315906;
  __int16 v7 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = 0;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: Cannot demote app with identity %@ because removability is %@ : %@", (uint8_t *)&v6, 0x2Au);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_4()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  int v3 = 136315650;
  uint64_t v4 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_error_impl(&dword_1A7B2D000, v2, OS_LOG_TYPE_ERROR, "%s: No LSApplicationRecord found for %@ during demotion : %@", (uint8_t *)&v3, 0x20u);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_5()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: Cannot demote app with identity %@ because it is a placeholder : %@", v2, v3, v4, v5, 2u);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_6()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: LSApplicationProxy for %@ did not contain a bundleURL during demotion : %@", v2, v3, v4, v5, 2u);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_101_cold_7(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Triggered early return intended for testing. : %@", (uint8_t *)&v1, 0x16u);
}

@end