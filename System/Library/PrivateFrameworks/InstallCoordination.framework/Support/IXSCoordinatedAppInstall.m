@interface IXSCoordinatedAppInstall
+ (BOOL)supportsSecureCoding;
+ (id)_fetchInstallOptionsFromPromise:(id)a3 error:(id *)a4;
- (BOOL)_eligibleToScheduleUpdate;
- (BOOL)_limitedConcurrency_doRetryingInstallOperationForPlaceholder:(BOOL)a3 installTargetURL:(id)a4 retries:(unint64_t)a5 error:(id *)a6 installAttemptBlock:(id)a7;
- (BOOL)_onQueue_acquireTerminationAssertionWithPredicate:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 allowLaunchPredicate:(id)a6 error:(id *)a7;
- (BOOL)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6;
- (BOOL)_onQueue_isPlaceholderUnnecessary;
- (BOOL)_onQueue_scheduleUpdate;
- (BOOL)_onQueue_shouldDeletePlaceholderOnCancelationForReason:(id)a3 client:(unint64_t)a4;
- (BOOL)_placeholderOrParallelPlaceholderIsInstalledWithRecord:(id *)a3;
- (BOOL)_shouldRemovePlaceholderForReason:(id)a3;
- (BOOL)_validateParentLinkageForInstallOptions:(id)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)appAssetPromiseSetterCanInstallLocalProvisionedContent;
- (BOOL)awakeFromSerializationWithError:(id *)a3;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6;
- (BOOL)currentProgressPhaseIsComplete;
- (BOOL)expectTermAssertionCallback;
- (BOOL)externalGetIsPaused;
- (BOOL)isComplete;
- (BOOL)isPaused;
- (BOOL)isTracked;
- (BOOL)needsPostProcessing;
- (BOOL)placeholderIsInstalled;
- (BOOL)sentBeginPostProcessing;
- (BOOL)sentBeginRestoringUserData;
- (BOOL)shouldBeginPostProcessing;
- (BOOL)shouldBeginRestoringUserData;
- (IPPublishedIdentityProgress)publishedInstallProgress;
- (IXAppInstallCoordinatorSeed)seed;
- (IXApplicationIdentity)identity;
- (IXProgressHint)progressHint;
- (IXProgressHint)progressHintWithDefault;
- (IXSClientConnection)scopedToConnection;
- (IXSCoordinatedAppInstall)initWithCoder:(id)a3;
- (IXSCoordinatedAppInstall)initWithSeed:(id)a3 scopedToConnection:(id)a4;
- (IXSCoordinatorProgress)coordinatorProgress;
- (IXSOwnedDataPromise)appAssetPromise;
- (IXSOwnedDataPromise)installOptionsPromise;
- (IXSPlaceholder)placeholderPromise;
- (IXSPlaceholderFailureInfo)placeholderFailureInfo;
- (IXSPowerAssertion)appInstallPowerAssertion;
- (IXSPromisedOutOfBandTransfer)deviceSecurityPromise;
- (IXSPromisedOutOfBandTransfer)preparationPromise;
- (IXSPromisedOutOfBandTransfer)userDataPromise;
- (LSRecordPromise)completedRecordPromise;
- (NSArray)essentialAssetPromiseUUIDs;
- (NSArray)essentialAssetPromises;
- (NSArray)initialODRAssetPromiseUUIDs;
- (NSArray)initialODRAssetPromises;
- (NSDate)firstAppExtensionBusyTime;
- (NSError)error;
- (NSMutableArray)pendingProgressRequests;
- (NSProgress)cachedCurrentPhaseProgress;
- (NSSet)promiseUUIDs;
- (NSString)description;
- (NSString)priorityBoostSourceInfo;
- (NSUUID)appAssetPromiseUUID;
- (NSUUID)deviceSecurityPromiseUUID;
- (NSUUID)installOptionsPromiseUUID;
- (NSUUID)placeholderPromiseUUID;
- (NSUUID)preparationPromiseUUID;
- (NSUUID)targetGizmoPairingID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)userDataPromiseUUID;
- (OS_dispatch_group)outstandingInstallOperationsGroup;
- (OS_dispatch_queue)assertionQueue;
- (OS_dispatch_queue)delegateCallQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_source)assertionRetryTimer;
- (OS_os_transaction)assertionTransaction;
- (OS_os_transaction)transaction;
- (RBSTerminationAssertion)termAssertion;
- (id)_createPowerAssertion;
- (id)_limitedConcurrency_fetchInstallingProgress;
- (id)_limitedConcurrency_fetchLSProgressForPhase:(unint64_t)a3 appRecord:(id)a4;
- (id)_limitedConcurrency_installApplication:(id)a3 isPlaceholder:(BOOL)a4 options:(id)a5 retries:(unint64_t)a6 error:(id *)a7;
- (id)_onQueue_fetchInstallOptionsWithError:(id *)a3;
- (id)_onQueue_fetchMetadataFromInstalledAppForOffloadWithError:(id *)a3;
- (id)_onQueue_localizedAppName;
- (id)priorityBoostCompletion;
- (id)promiseStateDescription;
- (id)schedulerCallback;
- (int64_t)_onQueue_assertionRetrySeconds;
- (os_unfair_lock_s)externalPropertyLock;
- (unint64_t)appAssetPromiseDRI;
- (unint64_t)appInstallState;
- (unint64_t)assertionRetryCount;
- (unint64_t)creator;
- (unint64_t)effectiveIntent;
- (unint64_t)errorSourceIdentifier;
- (unint64_t)importance;
- (unint64_t)installationDomain;
- (unint64_t)newRemovability;
- (unint64_t)newRemovabilityClient;
- (unint64_t)originalInstallType;
- (unint64_t)originalIntent;
- (unint64_t)placeholderDisposition;
- (unint64_t)placeholderInstallState;
- (unint64_t)postProcessingAssertionState;
- (unint64_t)savedRemovability;
- (unint64_t)savedRemovabilityClient;
- (unint64_t)state;
- (unint64_t)transactionStepForPromise:(id)a3;
- (unint64_t)updateScheduleState;
- (unsigned)coordinatorScope;
- (void)_asyncUpdatePlaceholderMetadataWithInstallType:(unint64_t)a3 reason:(int64_t)a4 underlyingError:(id)a5 client:(unint64_t)a6;
- (void)_finishAppInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6;
- (void)_finishPlaceholderInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6;
- (void)_initInternalState;
- (void)_internalInitWithSeed:(id)a3 scopedToConnection:(id)a4;
- (void)_internal_setAppAssetPromise:(id)a3;
- (void)_internal_setInstallOptionsPromise:(id)a3;
- (void)_limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:(unint64_t)a3 progressHint:(id)a4 andRun:(id)a5;
- (void)_limitedConcurrency_fetchPostProcessingProgressAndRun:(id)a3;
- (void)_limitedConcurrency_saveOriginalInstallTypeForAppRecord:(id)a3;
- (void)_limitedConcurrency_setUpLSProgressForInstallType:(unint64_t)a3 progressHint:(id)a4;
- (void)_onAssertionQueue_setTermAssertion:(id)a3;
- (void)_onQueue_acquireAssertionAndDoInstall;
- (void)_onQueue_acquireAssertionAndInstallPlaceholder;
- (void)_onQueue_acquireAssertionForPlaceholder:(BOOL)a3;
- (void)_onQueue_cancelPlaceholderIfNeededForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5;
- (void)_onQueue_cancelProgress;
- (void)_onQueue_cancelProgress:(id)a3;
- (void)_onQueue_checkState;
- (void)_onQueue_configureTotalUnitCountsForInstallProgress:(id)a3;
- (void)_onQueue_convertTerminationAssertionToAllowExtensionLaunch;
- (void)_onQueue_doAddReference:(id)a3;
- (void)_onQueue_doInstall;
- (void)_onQueue_fetchProgressAndRun:(id)a3;
- (void)_onQueue_fetchProgressForPhase:(unint64_t)a3 andRun:(id)a4;
- (void)_onQueue_finishProgress;
- (void)_onQueue_finishProgress:(id)a3;
- (void)_onQueue_fireObserversForClient:(id)a3;
- (void)_onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:(id)a3 client:(unint64_t)a4;
- (void)_onQueue_handleAssertionAcquisitionFailureForPlaceholder:(BOOL)a3 withError:(id)a4;
- (void)_onQueue_handleCancelForInstallFailure:(id)a3;
- (void)_onQueue_installPlaceholder;
- (void)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4;
- (void)_onQueue_internal_saveState;
- (void)_onQueue_pauseProgress;
- (void)_onQueue_prioritizeWithCompletion:(id)a3;
- (void)_onQueue_removeParallelPlaceholder:(BOOL *)a3;
- (void)_onQueue_resumeProgress;
- (void)_onQueue_runAssertionHandlerForPlaceholder:(BOOL)a3;
- (void)_onQueue_runPostProcessingAssertionHandler;
- (void)_onQueue_saveState;
- (void)_onQueue_setInstallProgressPercentComplete:(double)a3 forPhase:(unint64_t)a4;
- (void)_onQueue_unregister;
- (void)_onQueue_updateLoadingProgress;
- (void)_onQueue_updatePlaceholderForFailureReason:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5;
- (void)_onQueue_updatePostProcessingProgress;
- (void)_pauseProgressObject:(id)a3;
- (void)_remote_appAssetPromiseHasBegunFulfillment:(id)a3;
- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5;
- (void)_remote_convertToGloballyScopedWithCompletion:(id)a3;
- (void)_remote_conveyPriorityReplacingExisting:(BOOL)a3 forConnection:(id)a4 withCompletion:(id)a5;
- (void)_remote_fireObserversForClient:(id)a3 completion:(id)a4;
- (void)_remote_getAppAssetPromise:(id)a3;
- (void)_remote_getAppAssetPromiseDRI:(id)a3;
- (void)_remote_getCoordinationState:(id)a3;
- (void)_remote_getCoordinatorScopeWithCompletion:(id)a3;
- (void)_remote_getDeviceSecurityPromise:(id)a3;
- (void)_remote_getErrorInfo:(id)a3;
- (void)_remote_getEssentialAssetPromises:(id)a3;
- (void)_remote_getHasDeviceSecurityPromise:(id)a3;
- (void)_remote_getInitialODRAssetPromises:(id)a3;
- (void)_remote_getInstallOptions:(id)a3;
- (void)_remote_getIsComplete:(id)a3;
- (void)_remote_getIsPausedWithCompletion:(id)a3;
- (void)_remote_getNeedsPostProcessing:(id)a3;
- (void)_remote_getPlaceholderDispositionWithCompletion:(id)a3;
- (void)_remote_getPlaceholderPromise:(id)a3;
- (void)_remote_getPostProcessingShouldBegin:(id)a3;
- (void)_remote_getPreparationPromise:(id)a3;
- (void)_remote_getProgressHintWithCompletion:(id)a3;
- (void)_remote_getUserDataPromise:(id)a3;
- (void)_remote_getUserDataRestoreShouldBegin:(id)a3;
- (void)_remote_hasAppAssetPromise:(id)a3;
- (void)_remote_hasEssentialAssetPromises:(id)a3;
- (void)_remote_hasInitialODRAssetPromises:(id)a3;
- (void)_remote_hasInstallOptions:(id)a3;
- (void)_remote_hasPlaceholderPromise:(id)a3;
- (void)_remote_hasUserDataPromise:(id)a3;
- (void)_remote_importanceWithCompletion:(id)a3;
- (void)_remote_prioritizeWithCompletion:(id)a3;
- (void)_remote_removabilityWithCompletion:(id)a3;
- (void)_remote_setAppAssetPromiseDRI:(unint64_t)a3 completion:(id)a4;
- (void)_remote_setAppAssetPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5;
- (void)_remote_setDeviceSecurityPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setEssentialAssetPromiseUUIDs:(id)a3 completion:(id)a4;
- (void)_remote_setImportance:(unint64_t)a3 completion:(id)a4;
- (void)_remote_setInitialODRAssetPromiseUUIDs:(id)a3 completion:(id)a4;
- (void)_remote_setInstallOptionsPromiseUUID:(id)a3 forConnection:(id)a4 completion:(id)a5;
- (void)_remote_setIsPaused:(BOOL)a3 completion:(id)a4;
- (void)_remote_setNeedsPostProcessing:(BOOL)a3 completion:(id)a4;
- (void)_remote_setPlaceholderDisposition:(unint64_t)a3 completion:(id)a4;
- (void)_remote_setPlaceholderPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setPreparationPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setProgressHint:(id)a3 completion:(id)a4;
- (void)_remote_setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 completion:(id)a5;
- (void)_remote_setTargetGizmoPairingID:(id)a3 completion:(id)a4;
- (void)_remote_setUserDataPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_targetGizmoPairingIDWithCompletion:(id)a3;
- (void)_runAsyncBlockWithDescription:(id)a3 onLaunchServicesQueue:(id)a4;
- (void)_runAsyncBlockWithDescription:(id)a3 onUninstallQueue:(id)a4;
- (void)_runWithProgress:(id)a3 block:(id)a4;
- (void)_updatePendingOperationsForChangeFromPreviousState:(unint64_t)a3 toNewState:(unint64_t)a4;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
- (void)didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5;
- (void)encodeWithCoder:(id)a3;
- (void)externalSetIsPaused:(BOOL)a3 completion:(id)a4;
- (void)handleFirstUnlockNotification;
- (void)prioritizeWithCompletion:(id)a3;
- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5;
- (void)promise:(id)a3 didUpdateProgress:(double)a4;
- (void)promiseDidBegin:(id)a3;
- (void)promiseDidComplete:(id)a3;
- (void)scheduledAppUpdateReadyToExecuteAndRunBlockWhenComplete:(id)a3;
- (void)setAppAssetPromise:(id)a3;
- (void)setAppAssetPromiseDRI:(unint64_t)a3;
- (void)setAppAssetPromiseSetterCanInstallLocalProvisionedContent:(BOOL)a3;
- (void)setAppAssetPromiseUUID:(id)a3;
- (void)setAppInstallPowerAssertion:(id)a3;
- (void)setAppInstallState:(unint64_t)a3;
- (void)setAssertionQueue:(id)a3;
- (void)setAssertionRetryCount:(unint64_t)a3;
- (void)setAssertionRetryTimer:(id)a3;
- (void)setAssertionTransaction:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setCompletedRecordPromise:(id)a3;
- (void)setCoordinatorProgress:(id)a3;
- (void)setCoordinatorScope:(unsigned __int8)a3;
- (void)setCurrentProgressPhaseIsComplete:(BOOL)a3;
- (void)setDelegateCallQueue:(id)a3;
- (void)setDeviceSecurityPromise:(id)a3;
- (void)setDeviceSecurityPromiseUUID:(id)a3;
- (void)setEffectiveIntent:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setErrorSourceIdentifier:(unint64_t)a3;
- (void)setEssentialAssetPromiseUUIDs:(id)a3;
- (void)setEssentialAssetPromises:(id)a3;
- (void)setExpectTermAssertionCallback:(BOOL)a3;
- (void)setFirstAppExtensionBusyTime:(id)a3;
- (void)setImportance:(unint64_t)a3;
- (void)setInitialODRAssetPromiseUUIDs:(id)a3;
- (void)setInitialODRAssetPromises:(id)a3;
- (void)setInstallOptionsPromise:(id)a3;
- (void)setInstallOptionsPromiseUUID:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3 completion:(id)a4;
- (void)setIsTracked:(BOOL)a3;
- (void)setNeedsPostProcessing:(BOOL)a3;
- (void)setNewRemovability:(unint64_t)a3;
- (void)setNewRemovabilityClient:(unint64_t)a3;
- (void)setNewRemovabilityState:(unint64_t)a3 removabilityClient:(unint64_t)a4;
- (void)setOriginalInstallType:(unint64_t)a3;
- (void)setOutstandingInstallOperationsGroup:(id)a3;
- (void)setPendingProgressRequests:(id)a3;
- (void)setPlaceholderDisposition:(unint64_t)a3;
- (void)setPlaceholderFailureInfo:(id)a3;
- (void)setPlaceholderInstallState:(unint64_t)a3;
- (void)setPlaceholderInstallState:(unint64_t)a3 withLSRecordPromiseForCompletion:(id)a4;
- (void)setPlaceholderPromise:(id)a3;
- (void)setPlaceholderPromiseUUID:(id)a3;
- (void)setPostProcessingAssertionState:(unint64_t)a3;
- (void)setPreparationPromise:(id)a3;
- (void)setPreparationPromiseUUID:(id)a3;
- (void)setPriorityBoostCompletion:(id)a3;
- (void)setPriorityBoostCompletion:(id)a3 withSourceInfo:(id)a4;
- (void)setPriorityBoostSourceInfo:(id)a3;
- (void)setProgressHint:(id)a3;
- (void)setPublishedInstallProgress:(id)a3;
- (void)setSavedRemovability:(unint64_t)a3;
- (void)setSavedRemovabilityClient:(unint64_t)a3;
- (void)setSchedulerCallback:(id)a3;
- (void)setScopedToConnection:(id)a3;
- (void)setSentBeginPostProcessing:(BOOL)a3;
- (void)setSentBeginRestoringUserData:(BOOL)a3;
- (void)setTargetGizmoPairingID:(id)a3;
- (void)setTermAssertion:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdateScheduleState:(unint64_t)a3;
- (void)setUserDataPromise:(id)a3;
- (void)setUserDataPromiseUUID:(id)a3;
@end

@implementation IXSCoordinatedAppInstall

- (void)_initInternalState
{
  v3 = [(IXSCoordinatedAppInstall *)self identity];
  id v28 = [v3 uniqueIdentifier];

  id v4 = +[NSString stringWithFormat:@"com.apple.installcoordinationd.IXSCoordinatedAppInstall.%@", v28];
  v5 = (const char *)[v4 UTF8String];
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v7;

  v9 = +[NSString stringWithFormat:@"com.apple.installcoordinationd.IXSCoordinatedAppInstall.assertion.%@", v28];

  id v10 = v9;
  v11 = (const char *)[v10 UTF8String];
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (OS_dispatch_queue *)dispatch_queue_create(v11, v12);
  assertionQueue = self->_assertionQueue;
  self->_assertionQueue = v13;

  v15 = +[NSString stringWithFormat:@"com.apple.installcoordinationd.IXSCoordinatedAppInstall.delegate.%@", v28];

  id v16 = v15;
  v17 = (const char *)[v16 UTF8String];
  v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = (OS_dispatch_queue *)dispatch_queue_create(v17, v18);
  delegateCallQueue = self->_delegateCallQueue;
  self->_delegateCallQueue = v19;

  self->_externalPropertyLock._os_unfair_lock_opaque = 0;
  v21 = (OS_dispatch_group *)dispatch_group_create();
  outstandingInstallOperationsGroup = self->_outstandingInstallOperationsGroup;
  self->_outstandingInstallOperationsGroup = v21;

  v23 = +[NSString stringWithFormat:@"com.apple.InstallCoordination.coordinator.%@", v28];

  id v24 = v23;
  [v24 UTF8String];
  v25 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v25;

  assertionTransaction = self->_assertionTransaction;
  self->_assertionTransaction = 0;
}

- (IXSCoordinatedAppInstall)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)IXSCoordinatedAppInstall;
  v5 = [(IXSCoordinatedAppInstall *)&v58 init];
  if (!v5)
  {
LABEL_37:
    v35 = v5;
    goto LABEL_38;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seed"];
  seed = v5->_seed;
  v5->_seed = (IXAppInstallCoordinatorSeed *)v6;

  v8 = [(IXSCoordinatedAppInstall *)v5 seed];

  if (v8)
  {
    v5->_complete = [v4 decodeBoolForKey:@"complete"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorSourceIdentifier"];
    v5->_errorSourceIdentifier = (unint64_t)[v11 unsignedLongLongValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderPromiseUUID"];
    placeholderPromiseUUID = v5->_placeholderPromiseUUID;
    v5->_placeholderPromiseUUID = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appAssetPromiseUUID"];
    appAssetPromiseUUID = v5->_appAssetPromiseUUID;
    v5->_appAssetPromiseUUID = (NSUUID *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appAssetPromiseDRI"];
    v5->_appAssetPromiseDRI = (unint64_t)[v16 unsignedLongLongValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installOptionsPromiseUUID"];
    installOptionsPromiseUUID = v5->_installOptionsPromiseUUID;
    v5->_installOptionsPromiseUUID = (NSUUID *)v17;

    uint64_t v19 = objc_opt_class();
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"initialODRAssetPromiseUUIDs"];
    initialODRAssetPromiseUUIDs = v5->_initialODRAssetPromiseUUIDs;
    v5->_initialODRAssetPromiseUUIDs = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDataPromiseUUID"];
    userDataPromiseUUID = v5->_userDataPromiseUUID;
    v5->_userDataPromiseUUID = (NSUUID *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preparationPromiseUUID"];
    preparationPromiseUUID = v5->_preparationPromiseUUID;
    v5->_preparationPromiseUUID = (NSUUID *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSecurityPromiseUUID"];
    deviceSecurityPromiseUUID = v5->_deviceSecurityPromiseUUID;
    v5->_deviceSecurityPromiseUUID = (NSUUID *)v27;

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newRemovability"];
    v5->_newRemovability = (unint64_t)[v29 unsignedLongLongValue];

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savedRemovability"];
    v5->_savedRemovability = (unint64_t)[v30 unsignedLongLongValue];

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newRemovabilityClient"];
    v5->_newRemovabilityClient = (unint64_t)[v31 unsignedLongLongValue];

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savedRemovabilityClient"];
    v5->_savedRemovabilityClient = (unint64_t)[v32 unsignedLongLongValue];

    if ([v4 containsValueForKey:@"placeholderInstalled"])
    {
      if (![v4 decodeBoolForKey:@"placeholderInstalled"])
      {
        v5->_uint64_t placeholderInstallState = 0;
LABEL_13:
        if ([v4 containsValueForKey:@"appInstalled"])
        {
          if (![v4 decodeBoolForKey:@"appInstalled"])
          {
            v5->_uint64_t appInstallState = 0;
            goto LABEL_20;
          }
          uint64_t appInstallState = 4;
        }
        else
        {
          v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appInstallState"];
          v5->_uint64_t appInstallState = (unint64_t)[v38 unsignedLongLongValue];

          uint64_t appInstallState = v5->_appInstallState;
          if ((unint64_t)(appInstallState - 1) < 3) {
            uint64_t appInstallState = 0;
          }
        }
        v5->_uint64_t appInstallState = appInstallState;
LABEL_20:
        v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postProcessingAssertionState"];
        v5->_unint64_t postProcessingAssertionState = (unint64_t)[v39 unsignedLongLongValue];

        unint64_t postProcessingAssertionState = v5->_postProcessingAssertionState;
        if (postProcessingAssertionState - 1 < 3) {
          unint64_t postProcessingAssertionState = 0;
        }
        v5->_unint64_t postProcessingAssertionState = postProcessingAssertionState;
        v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalInstallType"];
        v5->_originalInstallType = (unint64_t)[v41 unsignedLongLongValue];

        v5->_isPaused = [v4 decodeBoolForKey:@"isPaused"];
        v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveIntent"];
        v5->_effectiveIntent = (unint64_t)[v42 unsignedLongLongValue];

        v5->_sentBeginRestoringUserData = [v4 decodeBoolForKey:@"sentBeginRestoringUserData"];
        uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderFailureInfo"];
        placeholderFailureInfo = v5->_placeholderFailureInfo;
        v5->_placeholderFailureInfo = (IXSPlaceholderFailureInfo *)v43;

        v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assertionRetryCount"];
        v5->_assertionRetryCount = (unint64_t)[v45 unsignedLongLongValue];

        uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetGizmoPairingID"];
        targetGizmoPairingID = v5->_targetGizmoPairingID;
        v5->_targetGizmoPairingID = (NSUUID *)v46;

        if ([v4 containsValueForKey:@"isUserInitiated"])
        {
          if ([v4 decodeBoolForKey:@"isUserInitiated"]) {
            uint64_t v48 = 3;
          }
          else {
            uint64_t v48 = 1;
          }
          v5->_importance = v48;
        }
        else
        {
          v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"importance"];
          v5->_importance = (unint64_t)[v49 unsignedLongLongValue];
        }
        if (!v5->_effectiveIntent)
        {
          v50 = [(IXSCoordinatedAppInstall *)v5 seed];
          v5->_effectiveIntent = (unint64_t)[v50 intent];
        }
        v5->_appAssetPromiseSetterCanInstallLocalProvisionedContent = [v4 decodeBoolForKey:@"appAssetPromiseSetterCanInstallLocalProvisionedContent"];
        if ([v4 containsValueForKey:@"coordinatorScope"])
        {
          v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coordinatorScope"];
          v5->_coordinatorScope = [v51 unsignedCharValue];
        }
        else
        {
          v5->_coordinatorScope = 2;
        }
        if ([v4 containsValueForKey:@"placeholderDisposition"])
        {
          v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderDisposition"];
          v5->_placeholderDisposition = (unint64_t)[v52 unsignedLongLongValue];
        }
        else
        {
          v5->_placeholderDisposition = 1;
        }
        v5->_needsPostProcessing = [v4 decodeBoolForKey:@"needsPostProcessing"];
        v5->_sentBeginPostProcessing = [v4 decodeBoolForKey:@"sentBeginPostProcessing"];
        uint64_t v53 = objc_opt_class();
        v54 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v53, objc_opt_class(), 0);
        uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"essentialAssetPromiseUUIDs"];
        essentialAssetPromiseUUIDs = v5->_essentialAssetPromiseUUIDs;
        v5->_essentialAssetPromiseUUIDs = (NSArray *)v55;

        [(IXSCoordinatedAppInstall *)v5 _initInternalState];
        goto LABEL_37;
      }
      uint64_t placeholderInstallState = 4;
    }
    else
    {
      v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderInstallState"];
      v5->_uint64_t placeholderInstallState = (unint64_t)[v36 unsignedLongLongValue];

      uint64_t placeholderInstallState = v5->_placeholderInstallState;
      if ((unint64_t)(placeholderInstallState - 1) < 3) {
        uint64_t placeholderInstallState = 0;
      }
    }
    v5->_uint64_t placeholderInstallState = placeholderInstallState;
    goto LABEL_13;
  }
  v34 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
    sub_100092EA4(v34);
  }

  v35 = 0;
LABEL_38:

  return v35;
}

- (void)_internalInitWithSeed:(id)a3 scopedToConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_seed, a3);
  uint64_t v9 = +[NSUUID UUID];
  [v7 setUniqueIdentifier:v9];

  [(IXSCoordinatedAppInstall *)self _initInternalState];
  self->_appAssetPromiseDRI = (unint64_t)[v7 creator];
  self->_effectiveIntent = (unint64_t)[v7 intent];
  self->_importance = 1;
  if (v8)
  {
    self->_coordinatorScope = 1;
    objc_storeWeak((id *)&self->_scopedToConnection, v8);
  }
  else
  {
    self->_coordinatorScope = 2;
  }
  id v10 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047510;
  block[3] = &unk_1000E8FA8;
  block[4] = self;
  dispatch_sync(v10, block);
}

- (IXSCoordinatedAppInstall)initWithSeed:(id)a3 scopedToConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IXSCoordinatedAppInstall;
  id v8 = [(IXSCoordinatedAppInstall *)&v11 init];
  uint64_t v9 = v8;
  if (v8) {
    [(IXSCoordinatedAppInstall *)v8 _internalInitWithSeed:v6 scopedToConnection:v7];
  }

  return v9;
}

- (void)dealloc
{
  if (+[IXFeatureFlags scheduledUpdatesEnabled]
    && self->_updateScheduleState)
  {
    self->_updateScheduleState = 0;
    v3 = +[IXSAppUpdateScheduler sharedInstance];
    id v4 = [(IXSCoordinatedAppInstall *)self uniqueIdentifier];
    [v3 removeUpdateRequestForCoordinatorUUID:v4];
  }
  v5 = (void (**)(id, void))objc_retainBlock(self->_priorityBoostCompletion);
  if (v5)
  {
    id v6 = self->_priorityBoostSourceInfo;
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[IXSCoordinatedAppInstall dealloc]";
      __int16 v15 = 2112;
      id v16 = self;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: Disposing of %@", buf, 0x20u);
    }

    v5[2](v5, 0);
    id priorityBoostCompletion = self->_priorityBoostCompletion;
    self->_id priorityBoostCompletion = 0;

    priorityBoostSourceInfo = self->_priorityBoostSourceInfo;
    self->_priorityBoostSourceInfo = 0;
  }
  [(RBSTerminationAssertion *)self->_termAssertion invalidate];
  termAssertion = self->_termAssertion;
  self->_termAssertion = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

  v12.receiver = self;
  v12.super_class = (Class)IXSCoordinatedAppInstall;
  [(IXSCoordinatedAppInstall *)&v12 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXSCoordinatedAppInstall *)self seed];
  [v4 encodeObject:v5 forKey:@"seed"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall isComplete](self, "isComplete"), @"complete");
  id v6 = [(IXSCoordinatedAppInstall *)self error];
  [v4 encodeObject:v6 forKey:@"error"];

  id v7 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self errorSourceIdentifier]];
  [v4 encodeObject:v7 forKey:@"errorSourceIdentifier"];

  id v8 = [(IXSCoordinatedAppInstall *)self placeholderPromiseUUID];
  [v4 encodeObject:v8 forKey:@"placeholderPromiseUUID"];

  uint64_t v9 = [(IXSCoordinatedAppInstall *)self appAssetPromiseUUID];
  [v4 encodeObject:v9 forKey:@"appAssetPromiseUUID"];

  id v10 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self appAssetPromiseDRI]];
  [v4 encodeObject:v10 forKey:@"appAssetPromiseDRI"];

  objc_super v11 = [(IXSCoordinatedAppInstall *)self installOptionsPromiseUUID];
  [v4 encodeObject:v11 forKey:@"installOptionsPromiseUUID"];

  objc_super v12 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self importance]];
  [v4 encodeObject:v12 forKey:@"importance"];

  v13 = [(IXSCoordinatedAppInstall *)self initialODRAssetPromiseUUIDs];
  [v4 encodeObject:v13 forKey:@"initialODRAssetPromiseUUIDs"];

  uint64_t v14 = [(IXSCoordinatedAppInstall *)self userDataPromiseUUID];
  [v4 encodeObject:v14 forKey:@"userDataPromiseUUID"];

  __int16 v15 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self placeholderInstallState]];
  [v4 encodeObject:v15 forKey:@"placeholderInstallState"];

  id v16 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self appInstallState]];
  [v4 encodeObject:v16 forKey:@"appInstallState"];

  __int16 v17 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self postProcessingAssertionState]];
  [v4 encodeObject:v17 forKey:@"postProcessingAssertionState"];

  v18 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self originalInstallType]];
  [v4 encodeObject:v18 forKey:@"originalInstallType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall isPaused](self, "isPaused"), @"isPaused");
  uint64_t v19 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self effectiveIntent]];
  [v4 encodeObject:v19 forKey:@"effectiveIntent"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall sentBeginRestoringUserData](self, "sentBeginRestoringUserData"), @"sentBeginRestoringUserData");
  v20 = [(IXSCoordinatedAppInstall *)self placeholderFailureInfo];
  [v4 encodeObject:v20 forKey:@"placeholderFailureInfo"];

  uint64_t v21 = [(IXSCoordinatedAppInstall *)self preparationPromiseUUID];
  [v4 encodeObject:v21 forKey:@"preparationPromiseUUID"];

  v22 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromiseUUID];
  [v4 encodeObject:v22 forKey:@"deviceSecurityPromiseUUID"];

  uint64_t v23 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self newRemovability]];
  [v4 encodeObject:v23 forKey:@"newRemovability"];

  id v24 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self savedRemovability]];
  [v4 encodeObject:v24 forKey:@"savedRemovability"];

  uint64_t v25 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self newRemovabilityClient]];
  [v4 encodeObject:v25 forKey:@"newRemovabilityClient"];

  v26 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self savedRemovabilityClient]];
  [v4 encodeObject:v26 forKey:@"savedRemovabilityClient"];

  uint64_t v27 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self assertionRetryCount]];
  [v4 encodeObject:v27 forKey:@"assertionRetryCount"];

  id v28 = [(IXSCoordinatedAppInstall *)self targetGizmoPairingID];
  [v4 encodeObject:v28 forKey:@"targetGizmoPairingID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall appAssetPromiseSetterCanInstallLocalProvisionedContent](self, "appAssetPromiseSetterCanInstallLocalProvisionedContent"), @"appAssetPromiseSetterCanInstallLocalProvisionedContent");
  v29 = +[NSNumber numberWithUnsignedChar:[(IXSCoordinatedAppInstall *)self coordinatorScope]];
  [v4 encodeObject:v29 forKey:@"coordinatorScope"];

  v30 = +[NSNumber numberWithUnsignedInteger:[(IXSCoordinatedAppInstall *)self placeholderDisposition]];
  [v4 encodeObject:v30 forKey:@"placeholderDisposition"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing"), @"needsPostProcessing");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall sentBeginPostProcessing](self, "sentBeginPostProcessing"), @"sentBeginPostProcessing");
  id v31 = [(IXSCoordinatedAppInstall *)self essentialAssetPromiseUUIDs];
  [v4 encodeObject:v31 forKey:@"essentialAssetPromiseUUIDs"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)awakeFromSerializationWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100047F68;
  uint64_t v21 = sub_100047F78;
  id v22 = 0;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100047F68;
  __int16 v15 = sub_100047F78;
  id v16 = 0;
  v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047F80;
  block[3] = &unk_1000E9828;
  block[4] = self;
  void block[5] = &v11;
  block[6] = &v17;
  dispatch_sync(v6, block);

  if (v18[5])
  {
    if (a3)
    {
      if (v12[5]) {
        id v7 = (void *)v12[5];
      }
      else {
        id v7 = (void *)v18[5];
      }
LABEL_8:
      *a3 = v7;
    }
  }
  else if (a3)
  {
    id v7 = (void *)v12[5];
    if (v7) {
      goto LABEL_8;
    }
  }
  BOOL v8 = v18[5] == 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)_createPowerAssertion
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  if (v3 == 3 || ([(IXSCoordinatedAppInstall *)self importance] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v4 = [(IXSCoordinatedAppInstall *)self identity];
    v5 = +[NSString stringWithFormat:@"IXPowerAssertion-%lu-%@", [(IXSCoordinatedAppInstall *)self creator], v4];
    if (v3 >= 8)
    {
      id v6 = +[NSString stringWithFormat:@"Unknown intent value %lu", v3];
    }
    else
    {
      id v6 = *(&off_1000EAC40 + v3);
    }
    id v7 = +[NSString stringWithFormat:@"Power assertion for %@ with intent %@", v4, v6];

    BOOL v8 = [[IXSPowerAssertion alloc] initWithAssertionName:v5 details:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_onAssertionQueue_setTermAssertion:(id)a3
{
  v5 = (RBSTerminationAssertion *)a3;
  id v6 = [(IXSCoordinatedAppInstall *)self assertionQueue];
  dispatch_assert_queue_V2(v6);

  termAssertion = self->_termAssertion;
  if (v5 && termAssertion == v5)
  {
    BOOL v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100093318();
    }
  }
  else
  {
    p_termAssertion = &self->_termAssertion;
    if (termAssertion) {
      [(RBSTerminationAssertion *)termAssertion invalidate];
    }
    objc_storeStrong((id *)p_termAssertion, a3);
  }
}

- (void)setTermAssertion:(id)a3
{
  id v4 = a3;
  v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(IXSCoordinatedAppInstall *)self assertionQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000494F8;
  v8[3] = &unk_1000E8E08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)handleFirstUnlockNotification
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004958C;
  block[3] = &unk_1000E8FA8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (unint64_t)state
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self error];

  if (v3) {
    return 1;
  }
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self placeholderInstallState];
  unint64_t v7 = [(IXSCoordinatedAppInstall *)self appInstallState];
  unint64_t v8 = [(IXSCoordinatedAppInstall *)self postProcessingAssertionState];
  unint64_t v9 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  unint64_t v4 = 1;
  if (v6 != 5 && v7 != 5 && v8 != 5)
  {
    unint64_t v10 = v9;
    if (MKBDeviceUnlockedSinceBoot() != 1
      || ([(IXSCoordinatedAppInstall *)self identity],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 bundleID],
          objc_super v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = sub_1000392E4(v12, 5),
          v12,
          v11,
          v13))
    {
      uint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100093398(self);
      }

      return 2;
    }
    if ((v6 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    {
      if (v10 == 6) {
        return 28;
      }
      if (v10 - 5 < 0xFFFFFFFFFFFFFFFELL)
      {
        if (v10 - 1 > 1)
        {
          BOOL v53 = 0;
          goto LABEL_46;
        }
        BOOL v53 = v10 - 5 < 0xFFFFFFFFFFFFFFFELL;
        v18 = [(IXSCoordinatedAppInstall *)self initialODRAssetPromises];
        v52 = v18;
        uint64_t v19 = v18;
        if (!v18)
        {
          unint64_t v4 = 11;
          goto LABEL_60;
        }
        uint64_t v78 = 0;
        v79 = &v78;
        uint64_t v80 = 0x2020000000;
        char v81 = 1;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id obj = v18;
        id v20 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v69;
LABEL_24:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v69 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v68 + 1) + 8 * v22);
            id v24 = [v23 accessQueue];
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_10004A078;
            v67[3] = &unk_1000E9230;
            v67[4] = v23;
            v67[5] = &v78;
            dispatch_sync(v24, v67);

            if (!*((unsigned char *)v79 + 24)) {
              break;
            }
            if (v20 == (id)++v22)
            {
              id v20 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
              if (v20) {
                goto LABEL_24;
              }
              break;
            }
          }
        }

        int v25 = *((unsigned __int8 *)v79 + 24);
        _Block_object_dispose(&v78, 8);
        if (!v25)
        {
          unint64_t v4 = 12;
          uint64_t v19 = v52;
LABEL_60:

          return v4;
        }
LABEL_35:

        if (v10 == 4)
        {
LABEL_36:
          if ([(IXSCoordinatedAppInstall *)self needsPostProcessing])
          {
            if (v8 - 1 < 3) {
              return 25;
            }
            if (!v8) {
              return 24;
            }
            if (v8 != 4)
            {
              v50 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                sub_10009342C();
              }

              return 1;
            }
            v41 = [(IXSCoordinatedAppInstall *)self essentialAssetPromises];
            id obja = v41;
            v42 = v41;
            if (v41)
            {
              uint64_t v78 = 0;
              v79 = &v78;
              uint64_t v80 = 0x2020000000;
              char v81 = 1;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v43 = v41;
              id v44 = [v43 countByEnumeratingWithState:&v57 objects:v82 count:16];
              if (v44)
              {
                uint64_t v45 = *(void *)v58;
LABEL_71:
                uint64_t v46 = 0;
                while (1)
                {
                  if (*(void *)v58 != v45) {
                    objc_enumerationMutation(v43);
                  }
                  v47 = *(void **)(*((void *)&v57 + 1) + 8 * v46);
                  uint64_t v48 = [v47 accessQueue];
                  v56[0] = _NSConcreteStackBlock;
                  v56[1] = 3221225472;
                  v56[2] = sub_10004A118;
                  v56[3] = &unk_1000E9230;
                  v56[4] = v47;
                  v56[5] = &v78;
                  dispatch_sync(v48, v56);

                  if (!*((unsigned char *)v79 + 24)) {
                    break;
                  }
                  if (v44 == (id)++v46)
                  {
                    id v44 = [v43 countByEnumeratingWithState:&v57 objects:v82 count:16];
                    if (v44) {
                      goto LABEL_71;
                    }
                    break;
                  }
                }
              }

              int v49 = *((unsigned __int8 *)v79 + 24);
              _Block_object_dispose(&v78, 8);
              if (v49)
              {

                return 28;
              }
              unint64_t v4 = 27;
              v42 = obja;
            }
            else
            {
              unint64_t v4 = 26;
            }

            return v4;
          }
          return 28;
        }
LABEL_46:
        id v31 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
        v32 = v31;
        if (v31)
        {
          uint64_t v78 = 0;
          v79 = &v78;
          uint64_t v80 = 0x2020000000;
          char v81 = 0;
          uint64_t v33 = [v31 accessQueue];
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_10004A0B0;
          v64[3] = &unk_1000E90A8;
          v66 = &v78;
          id v34 = v32;
          id v65 = v34;
          dispatch_sync((dispatch_queue_t)v33, v64);

          LOBYTE(v33) = *((unsigned char *)v79 + 24) == 0;
          _Block_object_dispose(&v78, 8);
          if (v33)
          {
            unint64_t v4 = 14;
          }
          else
          {
            v35 = [(IXSCoordinatedAppInstall *)self installOptionsPromise];
            BOOL v36 = v35 == 0;

            if (v36)
            {
              unint64_t v4 = 15;
            }
            else
            {
              if (!v53)
              {
LABEL_53:
                if ((id)[(IXSCoordinatedAppInstall *)self updateScheduleState] != (id)1)
                {
                  unint64_t v4 = 17;
                  switch(v7)
                  {
                    case 0uLL:
                      goto LABEL_63;
                    case 1uLL:
                    case 2uLL:
                      unint64_t v4 = 19;
                      goto LABEL_63;
                    case 3uLL:
                      unint64_t v4 = 21;
                      goto LABEL_63;
                    case 4uLL:

                      goto LABEL_36;
                    default:
                      v51 = sub_100004B28((uint64_t)off_100109BB8);
                      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                        sub_1000934A8();
                      }

                      unint64_t v4 = 1;
                      goto LABEL_63;
                  }
                }
                unint64_t v4 = 18;
                goto LABEL_63;
              }
              v37 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromise];
              v38 = v37;
              if (!v37) {
                goto LABEL_52;
              }
              uint64_t v78 = 0;
              v79 = &v78;
              uint64_t v80 = 0x2020000000;
              char v81 = 0;
              uint64_t v39 = [v37 accessQueue];
              v61[0] = _NSConcreteStackBlock;
              v61[1] = 3221225472;
              v61[2] = sub_10004A0E4;
              v61[3] = &unk_1000E90A8;
              v63 = &v78;
              id v40 = v38;
              id v62 = v40;
              dispatch_sync((dispatch_queue_t)v39, v61);

              LOBYTE(v39) = *((unsigned char *)v79 + 24) == 0;
              _Block_object_dispose(&v78, 8);
              if ((v39 & 1) == 0)
              {
LABEL_52:

                goto LABEL_53;
              }

              unint64_t v4 = 16;
            }
          }
        }
        else
        {
          unint64_t v4 = 13;
        }
LABEL_63:

        return v4;
      }
      BOOL v53 = 0;
      v26 = [(IXSCoordinatedAppInstall *)self userDataPromise];
      uint64_t v27 = v26;
      if (v26)
      {
        uint64_t v78 = 0;
        v79 = &v78;
        uint64_t v80 = 0x2020000000;
        char v81 = 0;
        id v28 = [v26 accessQueue];
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_10004A044;
        v72[3] = &unk_1000E90A8;
        v74 = &v78;
        id obj = v27;
        id v73 = obj;
        dispatch_sync(v28, v72);

        BOOL v29 = *((unsigned char *)v79 + 24) == 0;
        _Block_object_dispose(&v78, 8);
        if (!v29) {
          goto LABEL_35;
        }
        unint64_t v4 = 10;
      }
      else
      {
        unint64_t v4 = 9;
      }

      return v4;
    }
    __int16 v15 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
    id v16 = v15;
    if (v15)
    {
      uint64_t v78 = 0;
      v79 = &v78;
      uint64_t v80 = 0x2020000000;
      char v81 = 0;
      uint64_t v17 = [v15 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004A010;
      block[3] = &unk_1000E90A8;
      v77 = &v78;
      id v76 = v16;
      dispatch_sync(v17, block);

      if (*((unsigned char *)v79 + 24))
      {
        if (v6 >= 4)
        {
          v30 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_100093524();
          }

          unint64_t v4 = 1;
        }
        else
        {
          unint64_t v4 = qword_1000AAFB0[v6];
        }
      }
      else
      {
        unint64_t v4 = 5;
      }

      _Block_object_dispose(&v78, 8);
    }
    else
    {
      unint64_t v4 = 4;
    }
  }
  return v4;
}

- (BOOL)_onQueue_isPlaceholderUnnecessary
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)5
    || [(IXSCoordinatedAppInstall *)self placeholderIsInstalled])
  {
    char isKindOfClass = 1;
  }
  else
  {
    if ((id)[(IXSCoordinatedAppInstall *)self creator] == (id)10
      && ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)1
       || (id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)2))
    {
      v5 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Skipping placeholder install for %@ because this coordinator was created by SystemAppMigrator", buf, 0x16u);
      }
      char isKindOfClass = 1;
    }
    else
    {
      unint64_t v7 = [(IXSCoordinatedAppInstall *)self identity];
      v5 = [v7 bundleID];

      unint64_t v8 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unint64_t v9 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v27 = sub_100047F68;
        id v28 = sub_100047F78;
        id v29 = 0;
        unint64_t v10 = [v9 accessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10004A58C;
        block[3] = &unk_1000E90A8;
        uint64_t v21 = buf;
        id v11 = v9;
        id v20 = v11;
        dispatch_sync(v10, block);

        objc_super v12 = +[LSApplicationWorkspace defaultWorkspace];
        unsigned __int8 v13 = [v12 applicationIsInstalled:v5];

        if (v13)
        {
          uint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v22 = 136315394;
            uint64_t v23 = "-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary]";
            __int16 v24 = 2112;
            int v25 = v5;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Not installing placeholder because the app %@ is already installed for the current user for some persona", v22, 0x16u);
          }
        }
        else
        {
          __int16 v15 = MobileInstallationRegisterPlaceholderForReference();
          uint64_t v14 = 0;

          if (v15)
          {
            id v16 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = *(NSObject **)(*(void *)&buf[8] + 40);
              *(_DWORD *)uint64_t v22 = 136315394;
              uint64_t v23 = "-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary]";
              __int16 v24 = 2112;
              int v25 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Successfully registered placeholder for %@", v22, 0x16u);
            }
          }
          else
          {
            id v16 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_1000935A0();
            }
          }
        }
        _Block_object_dispose(buf, 8);
      }
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)_eligibleToScheduleUpdate
{
  if (+[IXFeatureFlags scheduledUpdatesEnabled]) {
    return (id)[(IXSCoordinatedAppInstall *)self importance] == (id)4;
  }
  unint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100093620(v4);
  }

  return 0;
}

- (BOOL)_onQueue_scheduleUpdate
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if (![(IXSCoordinatedAppInstall *)self _eligibleToScheduleUpdate]) {
    return 0;
  }
  unint64_t v4 = +[IXSAppUpdateScheduler sharedInstance];
  v5 = [(IXSCoordinatedAppInstall *)self uniqueIdentifier];
  id v10 = 0;
  unsigned __int8 v6 = [v4 scheduleUpdateInstallForCoordinatorUUID:v5 error:&v10];
  id v7 = v10;

  if (v6)
  {
    [(IXSCoordinatedAppInstall *)self setUpdateScheduleState:1];
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  }
  else
  {
    unint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000936A4();
    }
  }
  return v6;
}

- (void)_onQueue_checkState
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self state];
  if (v5 > 23)
  {
    if (v5 == 24)
    {
      [(IXSCoordinatedAppInstall *)self _onQueue_convertTerminationAssertionToAllowExtensionLaunch];
    }
    else if (v5 == 28)
    {
      if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4)
      {
        unsigned __int8 v6 = [(IXSCoordinatedAppInstall *)self preparationPromise];
        id v7 = v6;
        if (v6)
        {
          unint64_t v8 = [v6 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10004AB40;
          block[3] = &unk_1000E8FA8;
          id v20 = v7;
          dispatch_sync(v8, block);
        }
      }
      if ([(IXSCoordinatedAppInstall *)self needsPostProcessing]) {
        [(IXSCoordinatedAppInstall *)self _onQueue_finishProgress];
      }
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 6) {
        [(IXSCoordinatedAppInstall *)self _onQueue_cancelProgress];
      }
      [(IXSCoordinatedAppInstall *)self setComplete:1];
    }
  }
  else if (v5 == 6)
  {
    if ([(IXSCoordinatedAppInstall *)self _onQueue_isPlaceholderUnnecessary])
    {
      [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:4];
      [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
    }
    else
    {
      if (v4 != 2
        || (unint64_t v12 = [(IXSCoordinatedAppInstall *)self importance], v12 > 4)
        || ((1 << v12) & 0x13) == 0)
      {
LABEL_36:
        [(IXSCoordinatedAppInstall *)self _onQueue_acquireAssertionAndInstallPlaceholder];
        return;
      }
      unsigned __int8 v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v22 = "-[IXSCoordinatedAppInstall _onQueue_checkState]";
        __int16 v23 = 2112;
        __int16 v24 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@: Skipping placeholder install because this is a background updating coordinator.", buf, 0x16u);
      }

      [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:6];
      [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
    }
  }
  else
  {
    if (v5 != 17) {
      return;
    }
    if ((id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)6)
    {
      if ((id)[(IXSCoordinatedAppInstall *)self updateScheduleState] != (id)2
        && [(IXSCoordinatedAppInstall *)self _onQueue_scheduleUpdate])
      {
        return;
      }
      [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:0];
      goto LABEL_36;
    }
    unint64_t v9 = [(IXSCoordinatedAppInstall *)self preparationPromise];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 accessQueue];
      uint64_t v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      id v16 = sub_10004AB4C;
      uint64_t v17 = &unk_1000E8FA8;
      id v18 = v10;
      dispatch_sync(v11, &v14);
    }
    [(IXSCoordinatedAppInstall *)self _onQueue_finishProgress];
    [(IXSCoordinatedAppInstall *)self _onQueue_acquireAssertionAndDoInstall];
  }
}

- (void)_runAsyncBlockWithDescription:(id)a3 onUninstallQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100047F68;
  id v18 = sub_100047F78;
  id v19 = [(IXSCoordinatedAppInstall *)self outstandingInstallOperationsGroup];
  dispatch_group_wait((dispatch_group_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)v15[5]);
  unint64_t v8 = +[IXSLimitedConcurrencyQueue uninstallConcurrencyQueue];
  unint64_t v9 = [(IXSCoordinatedAppInstall *)self identity];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004ACD4;
  v11[3] = &unk_1000EA648;
  id v10 = v7;
  id v12 = v10;
  unsigned __int8 v13 = &v14;
  [v8 runAsyncForIdentity:v9 description:v6 operation:v11];

  _Block_object_dispose(&v14, 8);
}

- (void)_runAsyncBlockWithDescription:(id)a3 onLaunchServicesQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(IXSCoordinatedAppInstall *)self outstandingInstallOperationsGroup];
  dispatch_group_enter(v8);

  unint64_t v9 = +[IXSLimitedConcurrencyQueue launchServicesQueue];
  id v10 = [(IXSCoordinatedAppInstall *)self identity];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004AE24;
  v12[3] = &unk_1000EA670;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 runAsyncForIdentity:v10 description:v7 operation:v12];
}

- (BOOL)_onQueue_acquireTerminationAssertionWithPredicate:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 allowLaunchPredicate:(id)a6 error:(id *)a7
{
  uint64_t v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v15);

  id v16 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:v13];
  [v16 setMaximumTerminationResistance:v8];
  id v17 = objc_alloc((Class)RBSTerminationAssertion);
  if (v12) {
    id v18 = [v17 initWithPredicate:v14 context:v16 allowLaunch:v12];
  }
  else {
    id v18 = [v17 initWithPredicate:v14 context:v16];
  }
  id v19 = v18;

  if (v8 == 50
    || ([(IXSCoordinatedAppInstall *)self identity],
        id v20 = objc_claimAutoreleasedReturnValue(),
        [v20 bundleID],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        BOOL v22 = sub_1000392E4(v21, 1),
        v21,
        v20,
        !v22))
  {
    [v19 addObserver:self];
    [(IXSCoordinatedAppInstall *)self setTermAssertion:v19];
    id v30 = 0;
    unsigned __int8 v27 = [v19 acquireWithError:&v30];
    id v26 = v30;
    if (v27)
    {
      BOOL v28 = 1;
      [(IXSCoordinatedAppInstall *)self setExpectTermAssertionCallback:1];
      goto LABEL_14;
    }
    __int16 v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100093718();
    }
  }
  else
  {
    __int16 v23 = +[NSError errorWithDomain:PKPlugInKitErrorDomain code:14 userInfo:0];
    uint64_t v24 = RBSRequestErrorDomain;
    NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
    v32 = v23;
    int v25 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v26 = +[NSError errorWithDomain:v24 code:5 userInfo:v25];
  }
  if (a7)
  {
    id v26 = v26;
    BOOL v28 = 0;
    *a7 = v26;
  }
  else
  {
    BOOL v28 = 0;
  }
LABEL_14:

  return v28;
}

- (void)_onQueue_convertTerminationAssertionToAllowExtensionLaunch
{
  unint64_t v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSCoordinatedAppInstall *)self setPostProcessingAssertionState:1];
  unint64_t v4 = [(IXSCoordinatedAppInstall *)self identity];
  uint64_t v5 = +[NSString stringWithFormat:@"installcoordinationd app:%@ post-processing phase", v4];

  id v6 = [(IXSCoordinatedAppInstall *)self identity];
  id v7 = [v6 bundleID];
  uint64_t v8 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v7];

  unint64_t v9 = +[RBSProcessPredicate predicateMatchingExtensionPoint:@"com.apple.background-asset-downloader-extension"];
  id v13 = 0;
  unsigned __int8 v10 = [(IXSCoordinatedAppInstall *)self _onQueue_acquireTerminationAssertionWithPredicate:v8 description:v5 terminationResistance:50 allowLaunchPredicate:v9 error:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0)
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10009378C();
    }

    [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
  }
}

- (int64_t)_onQueue_assertionRetrySeconds
{
  if ([(IXSCoordinatedAppInstall *)self assertionRetryCount] < 0xC) {
    return 5;
  }
  if ([(IXSCoordinatedAppInstall *)self assertionRetryCount] < 0x20) {
    return 15;
  }
  if ([(IXSCoordinatedAppInstall *)self assertionRetryCount] < 0x3E) {
    return 60;
  }
  if ([(IXSCoordinatedAppInstall *)self assertionRetryCount] >= 0xFE) {
    return -1;
  }
  return 900;
}

- (void)_onQueue_runAssertionHandlerForPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  [(IXSCoordinatedAppInstall *)self setAssertionRetryCount:0];
  [(IXSCoordinatedAppInstall *)self setFirstAppExtensionBusyTime:0];
  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  if (v3)
  {
    [(IXSCoordinatedAppInstall *)self _onQueue_installPlaceholder];
  }
  else
  {
    [(IXSCoordinatedAppInstall *)self _onQueue_doInstall];
  }
}

- (void)_onQueue_handleAssertionAcquisitionFailureForPlaceholder:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if ((id)[(IXSCoordinatedAppInstall *)self importance] == (id)3)
  {
    [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100093808();
    }

    unsigned __int8 v10 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]", 1631, @"IXErrorDomain", 0x13uLL, v6, 0, @"Cancelling %@ because we failed to acquire a termination assertion even after retrying", v9, (uint64_t)self);
    [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v10 client:15];
    goto LABEL_36;
  }
  id v11 = [(IXSCoordinatedAppInstall *)self identity];
  id v12 = [v11 bundleID];
  BOOL v13 = 1;
  BOOL v14 = sub_1000392E4(v12, 1);

  if (v14) {
    int v15 = 20;
  }
  else {
    int v15 = 900;
  }
  id v16 = [v6 userInfo];
  unsigned __int8 v10 = [v16 objectForKeyedSubscript:NSUnderlyingErrorKey];

  id v17 = [v6 domain];
  if ([v17 isEqualToString:RBSRequestErrorDomain]) {
    BOOL v13 = [v6 code] != (id)5;
  }

  if (!v10) {
    goto LABEL_22;
  }
  id v18 = [v10 domain];
  if (([v18 isEqualToString:PKPlugInKitErrorDomain] & 1) == 0)
  {

LABEL_22:
    [(IXSCoordinatedAppInstall *)self setFirstAppExtensionBusyTime:0];
    goto LABEL_23;
  }
  id v19 = [v10 code];

  char v20 = v19 != (id)14 || v13;
  if (v20) {
    goto LABEL_22;
  }
  uint64_t v21 = [(IXSCoordinatedAppInstall *)self firstAppExtensionBusyTime];

  if (v21)
  {
    BOOL v22 = [(IXSCoordinatedAppInstall *)self firstAppExtensionBusyTime];
    [v22 timeIntervalSinceNow];
    double v24 = v23;

    if (v24 <= -(double)v15)
    {
      int v25 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        BOOL v53 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]";
        __int16 v54 = 2112;
        uint64_t v55 = self;
        __int16 v56 = 2048;
        *(void *)long long v57 = fabs(v24);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Failed to get termination assertion for %@ because an app extension was busy for %f seconds; skipping assertion",
          buf,
          0x20u);
      }

      [(IXSCoordinatedAppInstall *)self _onQueue_runAssertionHandlerForPlaceholder:v4];
      goto LABEL_36;
    }
  }
  else
  {
    v42 = +[NSDate date];
    [(IXSCoordinatedAppInstall *)self setFirstAppExtensionBusyTime:v42];

    id v43 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      BOOL v53 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]";
      __int16 v54 = 2112;
      uint64_t v55 = self;
      __int16 v56 = 1024;
      *(_DWORD *)long long v57 = v15;
      *(_WORD *)&v57[4] = 2112;
      *(void *)&v57[6] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: Failed to get termination assertion for %@ because an app extension was busy; will continue with installatio"
        "n anyway if this happens for over %d seconds : %@",
        buf,
        0x26u);
    }

    id v44 = [(IXSCoordinatedAppInstall *)self identity];
    uint64_t v45 = [v44 description];
    sub_100013BB0(@"IXErrorDomain", @"TerminationAssertionError", @"TerminationAssertionErrorPluginBusyTimeout", v45);
  }
LABEL_23:
  [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
  int64_t v26 = [(IXSCoordinatedAppInstall *)self _onQueue_assertionRetrySeconds];
  if (v26 == -1)
  {
    BOOL v28 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100093884();
    }

    id v30 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]", 1679, @"IXErrorDomain", 0x13uLL, v6, 0, @"Cancelling %@ because we failed to acquire a termination assertion", v29, (uint64_t)self);
    [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v30 client:15];
  }
  else
  {
    int64_t v27 = v26;
    [(IXSCoordinatedAppInstall *)self setAssertionRetryCount:(char *)[(IXSCoordinatedAppInstall *)self assertionRetryCount] + 1];
    if (v4) {
      [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:2];
    }
    else {
      [(IXSCoordinatedAppInstall *)self setAppInstallState:2];
    }
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
    NSErrorUserInfoKey v31 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      BOOL v53 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]";
      __int16 v54 = 2112;
      uint64_t v55 = self;
      __int16 v56 = 2048;
      *(void *)long long v57 = v27;
      *(_WORD *)&v57[8] = 2112;
      *(void *)&v57[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: Failed to get assertion for %@; will retry in %lld seconds (%@)",
        buf,
        0x2Au);
    }

    v32 = [(IXSCoordinatedAppInstall *)self internalQueue];
    uint64_t v33 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v32);

    dispatch_time_t v34 = dispatch_time(0, 1000000000 * v27);
    dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004BAC4;
    handler[3] = &unk_1000EA698;
    int v49 = v33;
    v50 = self;
    BOOL v51 = v4;
    v35 = v33;
    dispatch_source_set_event_handler(v35, handler);
    if (v4) {
      CFStringRef v36 = @"-for-placeholder";
    }
    else {
      CFStringRef v36 = &stru_1000ED390;
    }
    v37 = [(IXSCoordinatedAppInstall *)self identity];
    v38 = [v37 uniqueIdentifier];
    uint64_t v39 = +[NSString stringWithFormat:@"com.apple.InstallCoordination.retry-acquire-assertion%@.%@", v36, v38];

    id v40 = v39;
    [v40 UTF8String];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = nullsub_12;
    v46[3] = &unk_1000E8FA8;
    id v47 = (id)os_transaction_create();
    id v41 = v47;
    dispatch_source_set_cancel_handler(v35, v46);
    [(IXSCoordinatedAppInstall *)self setAssertionRetryTimer:v35];
    dispatch_resume(v35);
  }
LABEL_36:
}

- (void)_onQueue_acquireAssertionForPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if (v3) {
    CFStringRef v6 = @"-for-placeholder";
  }
  else {
    CFStringRef v6 = &stru_1000ED390;
  }
  id v7 = [(IXSCoordinatedAppInstall *)self identity];
  uint64_t v8 = [v7 uniqueIdentifier];
  uint64_t v9 = +[NSString stringWithFormat:@"com.apple.InstallCoordination.acquire-assertion%@.%@", v6, v8];

  id v10 = v9;
  [v10 UTF8String];
  id v11 = (void *)os_transaction_create();
  id v12 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];

  if (v12)
  {
    BOOL v13 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];
    dispatch_source_cancel(v13);

    [(IXSCoordinatedAppInstall *)self setAssertionRetryTimer:0];
  }
  if (v3) {
    [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:1];
  }
  else {
    [(IXSCoordinatedAppInstall *)self setAppInstallState:1];
  }
  BOOL v14 = [(IXSCoordinatedAppInstall *)self _onQueue_fetchInstallOptionsWithError:0];
  int v15 = v14;
  if (v14 && ([v14 isDeveloperInstall] & 1) != 0)
  {
    uint64_t v16 = 50;
  }
  else if ((id)[(IXSCoordinatedAppInstall *)self importance] == (id)3)
  {
    uint64_t v16 = 50;
  }
  else
  {
    uint64_t v16 = 30;
  }
  id v17 = [(IXSCoordinatedAppInstall *)self identity];
  uint64_t v18 = [(IXSCoordinatedAppInstall *)self uniqueIdentifier];
  id v19 = (void *)v18;
  uint64_t v20 = 78;
  if (v3) {
    uint64_t v20 = 89;
  }
  uint64_t v21 = +[NSString stringWithFormat:@"installcoordinationd app:%@ uuid:%@ isPlaceholder:%c", v17, v18, v20];

  uint64_t v22 = [(IXSCoordinatedAppInstall *)self identity];
  double v23 = [(id)v22 bundleID];
  double v24 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v23];

  id v32 = 0;
  LOBYTE(v22) = [(IXSCoordinatedAppInstall *)self _onQueue_acquireTerminationAssertionWithPredicate:v24 description:v21 terminationResistance:v16 allowLaunchPredicate:0 error:&v32];
  id v25 = v32;
  if ((v22 & 1) == 0)
  {
    int64_t v26 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004BE88;
    v27[3] = &unk_1000EA6C0;
    id v28 = v11;
    uint64_t v29 = self;
    BOOL v31 = v3;
    id v30 = v25;
    sub_100066F24(v26, v27);
  }
}

- (BOOL)_limitedConcurrency_doRetryingInstallOperationForPlaceholder:(BOOL)a3 installTargetURL:(id)a4 retries:(unint64_t)a5 error:(id *)a6 installAttemptBlock:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  BOOL v13 = (uint64_t (**)(id, void *, id, id *))a7;
  int v52 = v10;
  v50 = a6;
  if (v10)
  {
    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = [(IXSCoordinatedAppInstall *)self _limitedConcurrency_fetchInstallingProgress];
  }
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10004C6F8;
  v62[3] = &unk_1000EA6E8;
  BOOL v65 = v10;
  id v51 = v14;
  id v63 = v51;
  v64 = self;
  BOOL v53 = self;
  unint64_t v15 = 0;
  uint64_t v55 = objc_retainBlock(v62);
  __int16 v54 = v12;
  while (1)
  {
    id v61 = 0;
    int v16 = v13[2](v13, v55, v12, &v61);
    id v17 = v61;
    if (v16)
    {
      uint64_t v18 = [(IXSCoordinatedAppInstall *)v53 identity];
      id v19 = [v18 bundleID];
      BOOL v20 = sub_1000392E4(v19, 6);

      if (!v20 || v15)
      {
        int64_t v26 = [(IXSCoordinatedAppInstall *)v53 identity];
        int64_t v27 = [v26 bundleID];
        BOOL v28 = sub_1000392E4(v27, 7);

        if (!v28)
        {
          dispatch_time_t v34 = [(IXSCoordinatedAppInstall *)v53 identity];
          v35 = [v34 bundleID];
          id v60 = 0;
          BOOL v36 = sub_100038F14(v35, 12, &v60);
          id v25 = v60;

          if (!v36)
          {
            LOBYTE(v40) = 1;
            goto LABEL_40;
          }
          if (v25
            && ([v25 objectForKeyedSubscript:@"TEST_MODE_DATA_SIMULATE_REBOOT"],
                v37 = objc_claimAutoreleasedReturnValue(),
                v37,
                v37))
          {
            v38 = [v25 objectForKeyedSubscript:@"TEST_MODE_DATA_SIMULATE_REBOOT"];
            unsigned int v39 = [v38 isEqualToString:@"TEST_MODE_DATA_REMOVE_PLACEHOLDER"];

            BOOL v40 = 1;
            if (v39 != v52) {
              goto LABEL_40;
            }
          }
          else
          {
            if (v52)
            {

              LOBYTE(v40) = 1;
              uint64_t v45 = v51;
              goto LABEL_52;
            }
            BOOL v40 = 0;
          }
          id v41 = +[IXFileManager defaultManager];
          id v59 = v17;
          unsigned __int8 v42 = [v41 removeItemAtURL:v54 error:&v59];
          id v43 = v59;

          if ((v42 & 1) == 0)
          {
            uint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_100093900();
            }
            LOBYTE(v40) = 1;
            id v17 = v43;
            goto LABEL_44;
          }
          if (v40)
          {
            int v49 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v67 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTarge"
                    "tURL:retries:error:installAttemptBlock:]";
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%s: Exiting for testing (TEST_MODE_DATA_SIMULATE_REBOOT)...", buf, 0xCu);
            }

            exit(1);
          }
          uint64_t v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4097 userInfo:0];

          uint64_t v22 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v67 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetU"
                  "RL:retries:error:installAttemptBlock:]";
            __int16 v68 = 2112;
            uint64_t v69 = v21;
            __int16 v70 = 2048;
            *(void *)long long v71 = v15;
            *(_WORD *)&v71[8] = 2048;
            *(void *)&v71[10] = a5;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: For testing, faking install SPI returning error %@ even after consuming the asset (retry count %lu/%lu)", buf, 0x2Au);
          }
          goto LABEL_16;
        }
        uint64_t v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4097 userInfo:0];

        uint64_t v22 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v67 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL"
                ":retries:error:installAttemptBlock:]";
          __int16 v68 = 2112;
          uint64_t v69 = v21;
          __int16 v70 = 2048;
          *(void *)long long v71 = v15;
          *(_WORD *)&v71[8] = 2048;
          *(void *)&v71[10] = a5;
          double v23 = v22;
          double v24 = "%s: For testing, always faking install SPI returning error %@ (retry count %lu/%lu)";
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4097 userInfo:0];

        uint64_t v22 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v67 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL"
                ":retries:error:installAttemptBlock:]";
          __int16 v68 = 2112;
          uint64_t v69 = v21;
          __int16 v70 = 2048;
          *(void *)long long v71 = 0;
          *(_WORD *)&v71[8] = 2048;
          *(void *)&v71[10] = a5;
          double v23 = v22;
          double v24 = "%s: For testing, faking install SPI returning error %@ (retry count %lu/%lu)";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x2Au);
        }
      }
      id v25 = 0;
LABEL_16:

      id v17 = (id)v21;
      id v12 = v54;
      goto LABEL_17;
    }
    id v25 = 0;
LABEL_17:
    uint64_t v29 = objc_msgSend(v17, "domain", v50);
    if (![v29 isEqualToString:NSCocoaErrorDomain]
      || [v17 code] != (id)4097)
    {
      break;
    }
LABEL_22:

    if (v15 >= a5)
    {
      LOBYTE(v40) = 0;
LABEL_40:
      id v44 = v50;
      uint64_t v45 = v51;
      goto LABEL_45;
    }
    BOOL v31 = +[IXFileManager defaultManager];
    unsigned int v32 = [v31 itemDoesNotExistAtURL:v12];

    if (v32)
    {
      uint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v67 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:r"
              "etries:error:installAttemptBlock:]";
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v53;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: %@: installable no longer present, skipping retry", buf, 0x16u);
      }
      goto LABEL_43;
    }
    ++v15;
    uint64_t v33 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v67 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:ret"
            "ries:error:installAttemptBlock:]";
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v17;
      __int16 v70 = 1024;
      *(_DWORD *)long long v71 = 5;
      *(_WORD *)&v71[4] = 2048;
      *(void *)&v71[6] = v15;
      *(_WORD *)&v71[14] = 2048;
      *(void *)&v71[16] = a5;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: Call to install SPI returned retryable error %@; retrying in %d seconds (%lu/%lu tries)",
        buf,
        0x30u);
    }

    sleep(5u);
  }
  id v30 = [v17 domain];
  if ([v30 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v17, "code") == (id)4099)
  {

    goto LABEL_22;
  }

LABEL_43:
  LOBYTE(v40) = 0;
LABEL_44:
  id v44 = v50;
  uint64_t v45 = v51;

LABEL_45:
  if ((v52 & 1) == 0)
  {
    uint64_t v46 = [(IXSCoordinatedAppInstall *)v53 internalQueue];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10004C868;
    v56[3] = &unk_1000EA698;
    BOOL v58 = v40;
    v56[4] = v53;
    id v57 = v45;
    sub_100066F24(v46, v56);
  }
  if (v44) {
    char v47 = v40;
  }
  else {
    char v47 = 1;
  }
  if ((v47 & 1) == 0)
  {
    id v17 = v17;
    *id v44 = v17;
  }
LABEL_52:

  return v40;
}

- (id)_limitedConcurrency_installApplication:(id)a3 isPlaceholder:(BOOL)a4 options:(id)a5 retries:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v29 = a3;
  id v11 = a5;
  uint64_t v39 = 0;
  BOOL v40 = &v39;
  uint64_t v41 = 0x3032000000;
  unsigned __int8 v42 = sub_100047F68;
  id v43 = sub_100047F78;
  id v44 = 0;
  id v12 = +[LSApplicationWorkspace defaultWorkspace];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10004CC64;
  v38[3] = &unk_1000E8FA8;
  v38[4] = self;
  BOOL v13 = objc_retainBlock(v38);
  id v37 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004CD44;
  v31[3] = &unk_1000EA710;
  BOOL v36 = v9;
  v31[4] = self;
  id v14 = v12;
  id v32 = v14;
  id v15 = v11;
  id v33 = v15;
  int v16 = v13;
  id v34 = v16;
  v35 = &v39;
  LODWORD(a5) = [(IXSCoordinatedAppInstall *)self _limitedConcurrency_doRetryingInstallOperationForPlaceholder:v9 installTargetURL:v29 retries:a6 error:&v37 installAttemptBlock:v31];
  id v17 = v37;
  if (a5)
  {
    id v18 = (id)v40[5];
  }
  else
  {
    id v19 = objc_alloc_init((Class)LSOperationRequestContext);
    uint64_t v20 = +[NSNumber numberWithUnsignedInt:geteuid()];
    [v19 setTargetUserID:v20];

    uint64_t v21 = [(IXSCoordinatedAppInstall *)self identity];
    uint64_t v22 = [v21 bundleID];
    id v30 = 0;
    LOBYTE(v20) = [v14 sendNotificationOfType:3 forApplicationWithBundleIdentifier:v22 requestContext:v19 error:&v30];
    id v23 = v30;

    if ((v20 & 1) == 0)
    {
      double v24 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int64_t v26 = [(IXSCoordinatedAppInstall *)self identity];
        int64_t v27 = [v26 bundleID];
        *(_DWORD *)buf = 136315650;
        uint64_t v46 = "-[IXSCoordinatedAppInstall _limitedConcurrency_installApplication:isPlaceholder:options:retries:error:]";
        __int16 v47 = 2112;
        uint64_t v48 = v27;
        __int16 v49 = 2112;
        id v50 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to send LSApplicationNotificationTypeInstallDidFail notification for %@ : %@", buf, 0x20u);
      }
      id v23 = 0;
    }
    if (a7) {
      *a7 = v17;
    }

    id v18 = 0;
  }

  _Block_object_dispose(&v39, 8);

  return v18;
}

- (void)_finishPlaceholderInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = [(IXSCoordinatedAppInstall *)self identity];
  id v14 = [v13 bundleID];
  BOOL v15 = sub_1000392E4(v14, 3);

  if (v15)
  {
    uint64_t v39 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v50 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s: Exiting because testing client requested termination after placeholder install.", buf, 0xCu);
    }

    exit(1);
  }
  if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)6 && v8)
  {
    id v40 = v11;
    id v41 = v10;
    int v16 = [(IXSCoordinatedAppInstall *)self identity];
    v58[0] = @"CACHE_DELETE_PURGE_APP_CACHES";
    id v17 = [v16 bundleID];
    id v57 = v17;
    id v18 = +[NSArray arrayWithObjects:&v57 count:1];
    v58[1] = @"CACHE_DELETE_VOLUME";
    v59[0] = v18;
    id v19 = +[IXGlobalConfiguration sharedInstance];
    uint64_t v20 = [v19 userVolumeURL];
    uint64_t v21 = [v20 path];
    v59[1] = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    v46[5] = _NSConcreteStackBlock;
    v46[6] = 3221225472;
    v46[7] = sub_10004D6BC;
    v46[8] = &unk_1000EA738;
    id v24 = v16;
    id v47 = v24;
    id v25 = v23;
    uint64_t v48 = v25;
    int64_t v26 = (const void *)CacheDeletePurgeSpaceWithInfo();
    dispatch_time_t v27 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v25, v27))
    {
      BOOL v28 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        sub_100093BA0((uint64_t)v24, v28, v29);
      }
    }
    if (v26) {
      CFRelease(v26);
    }

    id v11 = v40;
    id v10 = v41;
  }
  id v30 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10004D7DC;
  v46[3] = &unk_1000E8FA8;
  void v46[4] = self;
  sub_100066F24(v30, v46);

  if (v8)
  {
    BOOL v31 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10004D7F4;
    v42[3] = &unk_1000E8E08;
    v42[4] = self;
    id v32 = &v43;
    id v43 = v11;
    id v33 = v42;
  }
  else
  {
    if (!v12)
    {
      id v34 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100093B08(self, v34);
      }

      v35 = [(IXSCoordinatedAppInstall *)self identity];
      sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]", 2062, @"IXErrorDomain", 0xEuLL, 0, 0, @"Placeholder installation failed but we received a nil error object when installing %@", v36, (uint64_t)v35);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v37 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = [v10 path];
      *(_DWORD *)buf = 136315906;
      id v50 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]";
      __int16 v51 = 2112;
      int v52 = self;
      __int16 v53 = 2112;
      __int16 v54 = v38;
      __int16 v55 = 2112;
      id v56 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s: %@: Failed to install placeholder at path %@ : %@", buf, 0x2Au);
    }
    BOOL v31 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10004D7E8;
    v44[3] = &unk_1000E8E08;
    v44[4] = self;
    id v32 = &v45;
    id v12 = v12;
    id v45 = v12;
    id v33 = v44;
  }
  sub_100066F24(v31, v33);
}

- (id)_onQueue_fetchMetadataFromInstalledAppForOffloadWithError:(id *)a3
{
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  CFStringRef v6 = [(IXSCoordinatedAppInstall *)self identity];
  id v7 = objc_alloc((Class)LSApplicationRecord);
  BOOL v8 = [v6 bundleID];
  id v35 = 0;
  id v9 = [v7 initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v35];
  id v10 = v35;

  if (!v9)
  {
    BOOL v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100093CB4();
    }

    sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]", 2163, @"IXErrorDomain", 1uLL, v10, 0, @"No LSApplicationRecord found for %@ during demotion", v16, (uint64_t)v6);
    goto LABEL_18;
  }
  if ([v9 isPlaceholder])
  {
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100093D30();
    }

    uint64_t v33 = (uint64_t)v6;
    BOOL v13 = @"Cannot demote app with identity %@ because it is a placeholder";
    uint64_t v14 = 2168;
LABEL_17:
    sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]", v14, @"IXErrorDomain", 4uLL, 0, 0, v13, v12, v33);
LABEL_18:
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = 0;
    id v18 = 0;
    goto LABEL_19;
  }
  id v17 = [v9 bundleContainerURL];
  if (!v17)
  {
    dispatch_time_t v27 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100093DA4();
    }

    uint64_t v33 = (uint64_t)v6;
    BOOL v13 = @"LSApplicationRecord for %@ did not contain a bundleContainerURL during demotion";
    uint64_t v14 = 2174;
    goto LABEL_17;
  }
  id v18 = v17;
  id v19 = [v17 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];
  id v34 = v10;
  uint64_t v20 = +[MIStoreMetadata metadataFromPlistAtURL:v19 error:&v34];
  id v21 = v34;

  if (v20) {
    goto LABEL_22;
  }
  uint64_t v22 = [v21 userInfo];
  id v10 = [v22 objectForKeyedSubscript:NSUnderlyingErrorKey];

  dispatch_semaphore_t v23 = [v10 domain];
  if (![v23 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_26;
  }
  id v24 = [v10 code];

  if (v24 != (id)260)
  {
LABEL_26:
    uint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v32 = [v19 path];
      *(_DWORD *)buf = 136315906;
      id v37 = "-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]";
      __int16 v38 = 2112;
      uint64_t v39 = v32;
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      id v43 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: Failed to read iTunesMetadata.plist from %@ when demoting %@ : %@", buf, 0x2Au);
    }
    id v30 = [v19 path];
    uint64_t v26 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]", 2186, @"IXErrorDomain", 1uLL, v21, 0, @"Failed to read iTunesMetadata.plist from %@ when demoting %@", v31, (uint64_t)v30);

    goto LABEL_29;
  }
  uint64_t v26 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]", 2184, @"IXErrorDomain", 0x17uLL, 0, 0, @"No metadata found for app %@", v25, (uint64_t)v6);
LABEL_29:

  id v21 = (id)v26;
LABEL_19:

  if (a3)
  {
    id v21 = v21;
    uint64_t v20 = 0;
    *a3 = v21;
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_22:

  return v20;
}

- (void)_onQueue_installPlaceholder
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self error];

  if (v5)
  {
    CFStringRef v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring placeholder install because coordinator canceled while waiting for assertion", buf, 0x16u);
    }

    goto LABEL_68;
  }
  id v7 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];

  if (v7)
  {
    BOOL v8 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];
    dispatch_source_cancel(v8);

    [(IXSCoordinatedAppInstall *)self setAssertionRetryTimer:0];
  }
  id v9 = [(IXSCoordinatedAppInstall *)self termAssertion];

  BOOL v10 = v9 == 0;
  id v11 = sub_100004B28((uint64_t)off_100109BB8);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      uint64_t v14 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: No termination assertion acquired for placeholder %@; proceeding with install.",
        buf,
        0x16u);
    }
  }
  else if (v12)
  {
    BOOL v13 = [(IXSCoordinatedAppInstall *)self identity];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Acquired termination assertion for placeholder %@; proceeding with install.",
      buf,
      0x16u);
  }
  unint64_t v15 = [(IXSCoordinatedAppInstall *)self newRemovability];
  if (v15)
  {
    uint64_t v16 = +[IXSAppRemovabilityManager sharedInstance];
    id v17 = [(IXSCoordinatedAppInstall *)self identity];
    id v18 = [v16 removabilityMetadataForAppWithIdentity:v17];

    -[IXSCoordinatedAppInstall setSavedRemovability:](self, "setSavedRemovability:", [v18 removability]);
    -[IXSCoordinatedAppInstall setSavedRemovabilityClient:](self, "setSavedRemovabilityClient:", [v18 client]);
    id v19 = +[IXSAppRemovabilityManager sharedInstance];
    uint64_t v20 = [(IXSCoordinatedAppInstall *)self identity];
    id v106 = 0;
    unsigned __int8 v21 = objc_msgSend(v19, "setRemovability:forAppWithIdentity:byClient:error:", v15, v20, -[IXSCoordinatedAppInstall newRemovabilityClient](self, "newRemovabilityClient"), &v106);
    id v22 = v106;

    if ((v21 & 1) == 0)
    {
      uint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(IXSCoordinatedAppInstall *)self identity];
        uint64_t v31 = [v30 bundleID];
        IXStringForAppRemovability(v15);
        id v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2112;
        v112 = v32;
        LOWORD(v113) = 2112;
        *(void *)((char *)&v113 + 2) = v22;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Failed to set removability for %@ to %@ with error: %@", buf, 0x2Au);
      }
      [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v22 client:15];

      goto LABEL_68;
    }
  }
  if (v4)
  {
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x2020000000;
    char v105 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v112 = sub_100047F68;
    *(void *)&long long v113 = sub_100047F78;
    *((void *)&v113 + 1) = 0;
    uint64_t v98 = 0;
    v99 = &v98;
    uint64_t v100 = 0x2020000000;
    uint64_t v101 = 0;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x3032000000;
    v95 = sub_100047F68;
    v96 = sub_100047F78;
    id v97 = 0;
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x3032000000;
    v89 = sub_100047F68;
    v90 = sub_100047F78;
    id v91 = 0;
    dispatch_semaphore_t v23 = [v4 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004ED28;
    block[3] = &unk_1000EA760;
    char v81 = &v102;
    id v80 = v4;
    v82 = buf;
    v83 = &v92;
    v84 = &v98;
    v85 = &v86;
    dispatch_sync(v23, block);

    if (!*((unsigned char *)v103 + 24))
    {
      uint64_t v36 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_100093E8C();
      }

      sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]", 2259, @"IXErrorDomain", 1uLL, 0, 0, @"Placeholder promise was not complete when we went to install it for %@", v37, (uint64_t)self);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v24 client:15];
      goto LABEL_67;
    }
    if (!*(void *)(*(void *)&buf[8] + 40))
    {
      __int16 v38 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100093F00();
      }

      __int16 v40 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]", 2265, @"IXErrorDomain", 1uLL, 0, 0, @"Placeholder promise was nil when we went to install it for %@", v39, (uint64_t)self);
      id v41 = [(IXSCoordinatedAppInstall *)self internalQueue];
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10004EDDC;
      v77[3] = &unk_1000E8E08;
      v77[4] = self;
      id v24 = v40;
      id v78 = v24;
      sub_100066F24(v41, v77);

      goto LABEL_67;
    }
    id v24 = objc_alloc_init((Class)MIInstallOptions);
    id v76 = 0;
    uint64_t v25 = [(IXSCoordinatedAppInstall *)self _onQueue_fetchInstallOptionsWithError:&v76];
    id v26 = v76;
    dispatch_time_t v27 = v26;
    if (v25)
    {
      BOOL v28 = [v25 linkedParentBundleID];
      [v24 setLinkedParentBundleID:v28];
    }
    else
    {
      BOOL v58 = [v26 domain];
      if ([v58 isEqualToString:@"IXErrorDomain"])
      {
        BOOL v59 = [v27 code] == (id)23;

        if (v59)
        {
LABEL_21:
          if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)6)
          {
            [v24 setInstallTargetType:3];
            if (v25) {
              objc_msgSend(v24, "setWaitForDeletion:", objc_msgSend(v25, "waitForDeletion"));
            }
          }
          else
          {
            [v24 setInstallTargetType:2];
          }
          [v24 setUserInitiated:1];
          [v24 setLsInstallType:v99[3]];
          [v24 setSinfData:v87[5]];
          if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] != (id)6)
          {
            [v24 setITunesMetadata:v93[5]];
LABEL_42:
            [v24 setPerformAPFSClone:1];
            id v45 = [(IXSCoordinatedAppInstall *)self identity];
            uint64_t v46 = [v45 bundleID];
            [v24 setBundleIdentifier:v46];

            id v47 = [(IXSCoordinatedAppInstall *)self identity];
            uint64_t v48 = [v47 personaUniqueString];
            [v24 setPersonaUniqueString:v48];

            unint64_t v49 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
            if (v49 - 1 >= 6) {
              unint64_t v50 = 0;
            }
            else {
              unint64_t v50 = v49;
            }
            [v24 setInstallIntent:v50];
            [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:3];
            id v44 = [(IXSCoordinatedAppInstall *)self _createPowerAssertion];
            if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)7)
            {
              if (objc_opt_class() && objc_opt_class())
              {
                __int16 v51 = [(IXSCoordinatedAppInstall *)self targetGizmoPairingID];
                if (v51) {
                  goto LABEL_50;
                }
                int v52 = +[NRPairedDeviceRegistry sharedInstance];
                __int16 v53 = [v52 getActivePairedDevice];
                __int16 v51 = [v53 valueForProperty:NRDevicePropertyPairingID];

                if (v51)
                {
LABEL_50:
                  __int16 v54 = +[IXFileManager defaultManager];
                  id v55 = [v54 diskUsageForURL:*(void *)(*(void *)&buf[8] + 40)];

                  id v56 = +[ACXDeviceConnection sharedDeviceConnection];
                  uint64_t v57 = *(void *)(*(void *)&buf[8] + 40);
                  v72[0] = _NSConcreteStackBlock;
                  v72[1] = 3221225472;
                  v72[2] = sub_10004EDEC;
                  v72[3] = &unk_1000EA788;
                  void v72[4] = self;
                  v74 = buf;
                  id v44 = v44;
                  id v73 = v44;
                  [v56 installApplicationAtURL:v57 onDeviceWithPairingID:v51 installOptions:v24 size:v55 completion:v72];
                }
                else
                {
                  BOOL v65 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                    sub_100093FE8();
                  }

                  v67 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]", 2349, @"IXErrorDomain", 0x1FuLL, 0, 0, @"Canceling placeholder installation for %@ because IXGizmoInstallingAppInstallCoordinator failed to find gizmo pairing ID.", v66, (uint64_t)self);
                  [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v67 client:15];
                  [v44 invalidate];
                }
              }
              else
              {
                id v60 = sub_100004B28((uint64_t)off_100109BB8);
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                  sub_100093F74();
                }

                id v62 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]", 2363, @"IXErrorDomain", 0x1EuLL, 0, 0, @"Canceling placeholder installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on this device.", v61, (uint64_t)self);
                [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v62 client:15];
                [v44 invalidate];
              }
            }
            else
            {
              v68[0] = _NSConcreteStackBlock;
              v68[1] = 3221225472;
              v68[2] = sub_10004EE44;
              v68[3] = &unk_1000EA7B0;
              v68[4] = self;
              long long v71 = buf;
              id v69 = v24;
              id v44 = v44;
              id v70 = v44;
              [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"Placeholder install" onLaunchServicesQueue:v68];
            }
            goto LABEL_66;
          }
          id v75 = 0;
          __int16 v42 = [(IXSCoordinatedAppInstall *)self _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:&v75];
          id v43 = v75;
          id v44 = v43;
          if (v42)
          {
            [v24 setITunesMetadata:v42];
LABEL_40:

            goto LABEL_42;
          }
          id v63 = [v43 domain];
          if ([v63 isEqualToString:@"IXErrorDomain"])
          {
            BOOL v64 = [v44 code] == (id)23;

            if (v64) {
              goto LABEL_40;
            }
          }
          else
          {
          }
          [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v44 client:15];
LABEL_66:

LABEL_67:
          _Block_object_dispose(&v86, 8);

          _Block_object_dispose(&v92, 8);
          _Block_object_dispose(&v98, 8);
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v102, 8);
          goto LABEL_68;
        }
      }
      else
      {
      }
      BOOL v28 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v107 = 136315394;
        v108 = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
        __int16 v109 = 2112;
        v110 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: Error occurred when fetching optional placeholder install options: %@", v107, 0x16u);
      }
    }

    goto LABEL_21;
  }
  uint64_t v33 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_100093E18();
  }

  id v35 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]", 2240, @"IXErrorDomain", 1uLL, 0, 0, @"Placeholder was nil when we went to install it for %@", v34, (uint64_t)self);
  [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v35 client:15];

LABEL_68:
}

- (void)_onQueue_acquireAssertionAndInstallPlaceholder
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if (![(IXSCoordinatedAppInstall *)self placeholderInstallState]
    || (id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)2
    || (id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)1)
  {
    unint64_t v4 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
    uint64_t v5 = sub_100004B28((uint64_t)off_100109BB8);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4 == 7)
    {
      if (v6)
      {
        id v7 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]";
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Gizmo app install - not acquiring termination assertion to install placeholder for %@", buf, 0x16u);
      }
      [(IXSCoordinatedAppInstall *)self _onQueue_installPlaceholder];
    }
    else
    {
      if (v6)
      {
        BOOL v8 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]";
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Acquiring termination assertion to install placeholder for %@", buf, 0x16u);
      }
      [(IXSCoordinatedAppInstall *)self _onQueue_acquireAssertionForPlaceholder:1];
    }
  }
  else
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009405C(self, v9);
    }

    uint64_t v10 = [(IXSCoordinatedAppInstall *)self placeholderInstallState];
    BOOL v12 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]", 2394, @"IXErrorDomain", 1uLL, 0, 0, @"Expected to have not yet begun placeholder install or waiting/pending assertion acquisition but state was %lu", v11, v10);
    [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v12 client:15];
  }
}

+ (id)_fetchInstallOptionsFromPromise:(id)a3 error:(id *)a4
{
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = sub_100047F68;
  uint64_t v39 = sub_100047F78;
  id v40 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10004F5C0;
  v32[3] = &unk_1000E90A8;
  uint64_t v34 = &v35;
  id v5 = a3;
  id v33 = v5;
  BOOL v6 = objc_retainBlock(v32);
  id v7 = [v5 accessQueue];
  dispatch_sync(v7, v6);

  uint64_t v8 = v36[5];
  if (v8)
  {
    id v31 = 0;
    id v9 = +[NSData dataWithContentsOfURL:v8 options:3 error:&v31];
    id v10 = v31;
    if (v9)
    {
      id v30 = v10;
      id v11 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:&v30];
      id v12 = v30;

      if (v11)
      {
        BOOL v13 = [v11 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
        if (v13)
        {
          uint64_t v14 = v12;
LABEL_20:
          [v11 finishDecoding];
          goto LABEL_21;
        }
        dispatch_semaphore_t v23 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = [v11 error];
          sub_100094244(v24, v41);
        }

        uint64_t v25 = [v11 error];
        uint64_t v14 = sub_10003DAE4((uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]", 2448, @"IXErrorDomain", 1uLL, v25, 0, @"Failed to unarchive install options data", v26, v29);
      }
      else
      {
        unsigned __int8 v21 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000941D0();
        }

        uint64_t v14 = sub_10003DAE4((uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]", 2442, @"IXErrorDomain", 1uLL, v12, 0, @"Failed to create unarchiver for install options data", v22, v29);
      }

      BOOL v13 = 0;
      goto LABEL_20;
    }
    id v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(id)v36[5] path];
      sub_100094160(v18, (uint64_t)v10, (uint64_t)v41, v17);
    }

    id v19 = [(id)v36[5] path];
    uint64_t v14 = sub_10003DAE4((uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]", 2436, @"IXErrorDomain", 1uLL, v10, 0, @"Unable to read install options serialized data from %@", v20, (uint64_t)v19);
  }
  else
  {
    __int16 v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000940E8();
    }

    uint64_t v14 = sub_10003DAE4((uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]", 2430, @"IXErrorDomain", 1uLL, 0, 0, @"Install options promise unexpectedly returned nil staged path.", v16, v29);
  }
  id v11 = 0;
  id v9 = 0;
  BOOL v13 = 0;
LABEL_21:
  if (a4 && !v13) {
    *a4 = v14;
  }
  id v27 = v13;

  _Block_object_dispose(&v35, 8);

  return v27;
}

- (id)_onQueue_fetchInstallOptionsWithError:(id *)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(IXSCoordinatedAppInstall *)self installOptionsPromise];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() _fetchInstallOptionsFromPromise:v7 error:a3];
  }
  else
  {
    id v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchInstallOptionsWithError:]", 2471, @"IXErrorDomain", 0x17uLL, 0, 0, @"Install options promise was not set.", v6, v12);
    id v10 = v9;
    if (a3) {
      *a3 = v9;
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_onQueue_handleCancelForInstallFailure:(id)a3
{
  id v21 = a3;
  unint64_t v4 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v21 domain];
  unsigned int v6 = [v5 isEqualToString:MIInstallerErrorDomain];

  if (v6)
  {
    id v7 = [v21 code];
    switch((unint64_t)v7)
    {
      case 7uLL:
        unint64_t v8 = 13;
        goto LABEL_29;
      case 8uLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xEuLL:
        goto LABEL_14;
      case 9uLL:
        unint64_t v8 = 16;
        goto LABEL_29;
      case 0xAuLL:
        unint64_t v8 = 6;
        goto LABEL_29;
      case 0xDuLL:
        uint64_t v16 = [v21 userInfo];
        id v17 = [v16 objectForKeyedSubscript:MILibMISErrorNumberKey];
        objc_opt_class();
        id v18 = v17;
        if (objc_opt_isKindOfClass()) {
          id v19 = v18;
        }
        else {
          id v19 = 0;
        }

        if (v19 && [v19 intValue] == -402620375) {
          unint64_t v20 = 17;
        }
        else {
          unint64_t v20 = 14;
        }
        IXCreateUserPresentableError(v20, 0, v21);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      case 0xFuLL:
        unint64_t v8 = 4;
        goto LABEL_29;
      default:
        if (v7 == (id)159)
        {
          unint64_t v8 = 15;
        }
        else if (v7 == (id)208)
        {
          unint64_t v8 = 18;
        }
        else
        {
LABEL_14:
          uint64_t v15 = sub_10000AC14(v21);
          if (v15)
          {
            id v11 = (id)v15;
            uint64_t v12 = 17;
            goto LABEL_33;
          }
          unint64_t v8 = 1;
        }
LABEL_29:
        IXCreateUserPresentableError(v8, 0, v21);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
        uint64_t v12 = 17;
        break;
    }
LABEL_31:
    if (v11) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  id v9 = [v21 domain];
  unsigned int v10 = [v9 isEqualToString:LSApplicationWorkspaceErrorDomain];

  if (v10)
  {
    IXCreateUserPresentableError(1uLL, 0, v21);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 16;
    goto LABEL_31;
  }
  BOOL v13 = [v21 domain];
  if ([v13 isEqualToString:NSCocoaErrorDomain])
  {
    id v14 = [v21 code];

    if (v14 == (id)4097)
    {
      IXCreateUserPresentableError(1uLL, 0, v21);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = 15;
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v12 = 15;
LABEL_32:
  id v11 = v21;
LABEL_33:
  [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v11 client:v12];
}

- (void)_finishAppInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = [(IXSCoordinatedAppInstall *)self identity];
  id v14 = [v13 bundleID];
  BOOL v15 = sub_1000392E4(v14, 4);

  if (v15)
  {
    id v24 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v30 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Exiting because testing client requested termination after app install.", buf, 0xCu);
    }

    exit(1);
  }
  if (a4)
  {
    uint64_t v16 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v25[0] = (uint64_t)_NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = (uint64_t)sub_10004FD9C;
    v25[3] = (uint64_t)&unk_1000E8E08;
    v25[4] = (uint64_t)self;
    id v17 = &v26;
    id v26 = v11;
    id v18 = v25;
  }
  else
  {
    if (!v12)
    {
      id v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000942A4();
      }

      sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]", 2574, @"IXErrorDomain", 0xEuLL, 0, 0, @"Installation failed but we received a nil error error object", v20, v25[0]);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v21 = sub_100004B28((uint64_t)off_100109BB8);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v22)
      {
        dispatch_semaphore_t v23 = [v10 path];
        *(_DWORD *)buf = 136315906;
        id v30 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]";
        __int16 v31 = 2112;
        id v32 = self;
        __int16 v33 = 2112;
        id v34 = v23;
        __int16 v35 = 2112;
        id v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Installation for %@ at path %@ failed: %@", buf, 0x2Au);
      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 136315650;
      id v30 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]";
      __int16 v31 = 2112;
      id v32 = self;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Installation for %@ failed: %@", buf, 0x20u);
    }

    uint64_t v16 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004FD5C;
    v27[3] = &unk_1000E8E08;
    void v27[4] = self;
    id v17 = &v28;
    id v12 = v12;
    id v28 = v12;
    id v18 = v27;
  }
  sub_100066F24(v16, v18);
}

- (void)_onQueue_doAddReference:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [(IXSCoordinatedAppInstall *)self _createPowerAssertion];
  [(IXSCoordinatedAppInstall *)self setAppInstallState:3];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100047F68;
  uint8_t v22[4] = sub_100047F78;
  id v23 = 0;
  id v7 = [v4 accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050104;
  block[3] = &unk_1000E90A8;
  id v21 = v22;
  id v8 = v4;
  id v20 = v8;
  dispatch_sync(v7, block);

  uint64_t v18 = 0;
  id v9 = MIFinalizeReferenceForInstalledAppWithError();
  id v10 = 0;
  id v11 = [v8 accessQueue];
  BOOL v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  BOOL v15 = sub_100050150;
  uint64_t v16 = &unk_1000E8FA8;
  id v12 = v8;
  id v17 = v12;
  dispatch_sync(v11, &v13);

  -[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:](self, "_finishAppInstallAtURL:result:recordPromise:error:", 0, v9 != 0, v9, v10, v13, v14, v15, v16);
  [v6 invalidate];

  _Block_object_dispose(v22, 8);
}

- (void)_onQueue_doInstall
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSCoordinatedAppInstall *)self error];

  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_doInstall]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring install request because coordinator canceled while waiting for assertion", buf, 0x16u);
    }
  }
  else
  {
    unsigned int v6 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];

    if (v6)
    {
      id v7 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];
      dispatch_source_cancel(v7);

      [(IXSCoordinatedAppInstall *)self setAssertionRetryTimer:0];
    }
    id v5 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(IXSCoordinatedAppInstall *)self _onQueue_doAddReference:v5];
      }
      else
      {
        id v51 = 0;
        id v11 = [(IXSCoordinatedAppInstall *)self _onQueue_fetchInstallOptionsWithError:&v51];
        id v12 = v51;
        if (v11)
        {
          objc_msgSend(v11, "setUserInitiated:", (id)-[IXSCoordinatedAppInstall importance](self, "importance") == (id)3);
          [v11 setInstallTargetType:1];
          if (!-[IXSCoordinatedAppInstall appAssetPromiseSetterCanInstallLocalProvisionedContent](self, "appAssetPromiseSetterCanInstallLocalProvisionedContent"))[v11 setAllowLocalProvisioned:0]; {
          BOOL v13 = [(IXSCoordinatedAppInstall *)self identity];
          }
          uint64_t v14 = [v13 bundleID];
          [v11 setBundleIdentifier:v14];

          BOOL v15 = [(IXSCoordinatedAppInstall *)self identity];
          uint64_t v16 = [v15 personaUniqueString];
          [v11 setPersonaUniqueString:v16];

          if ([(IXSCoordinatedAppInstall *)self needsPostProcessing]) {
            [v11 setPreservePlaceholderAsParallel:1];
          }
          unint64_t v17 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
          if (v17 - 1 >= 6) {
            unint64_t v18 = 0;
          }
          else {
            unint64_t v18 = v17;
          }
          [v11 setInstallIntent:v18];
          [(IXSCoordinatedAppInstall *)self setAppInstallState:3];
          id v19 = [(IXSCoordinatedAppInstall *)self termAssertion];

          BOOL v20 = v19 == 0;
          id v21 = sub_100004B28((uint64_t)off_100109BB8);
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20)
          {
            if (v22)
            {
              id v24 = [(IXSCoordinatedAppInstall *)self identity];
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_doInstall]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v24;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: No termination assertion acquired for %@; proceeding with install.",
                buf,
                0x16u);
            }
          }
          else if (v22)
          {
            id v23 = [(IXSCoordinatedAppInstall *)self identity];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_doInstall]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Acquired termination assertion for %@; proceeding with install.",
              buf,
              0x16u);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          __int16 v53 = sub_100047F68;
          __int16 v54 = sub_100047F78;
          id v55 = 0;
          uint64_t v25 = [v5 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000509A0;
          block[3] = &unk_1000E90A8;
          unint64_t v50 = buf;
          unint64_t v49 = v5;
          dispatch_sync(v25, block);

          id v26 = [(IXSCoordinatedAppInstall *)self _createPowerAssertion];
          if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)7)
          {
            if (objc_opt_class() && objc_opt_class())
            {
              id v27 = [(IXSCoordinatedAppInstall *)self targetGizmoPairingID];
              if (v27) {
                goto LABEL_31;
              }
              id v28 = +[NRPairedDeviceRegistry sharedInstance];
              uint64_t v29 = [v28 getActivePairedDevice];
              id v27 = [v29 valueForProperty:NRDevicePropertyPairingID];

              if (v27)
              {
LABEL_31:
                id v30 = +[IXFileManager defaultManager];
                id v31 = [v30 diskUsageForURL:*(void *)(*(void *)&buf[8] + 40)];

                id v32 = +[ACXDeviceConnection sharedDeviceConnection];
                uint64_t v33 = *(void *)(*(void *)&buf[8] + 40);
                v45[0] = _NSConcreteStackBlock;
                v45[1] = 3221225472;
                v45[2] = sub_100050AF8;
                v45[3] = &unk_1000EA788;
                v45[4] = self;
                id v47 = buf;
                id v46 = v26;
                [v32 installApplicationAtURL:v33 onDeviceWithPairingID:v27 installOptions:v11 size:v31 completion:v45];
              }
              else
              {
                __int16 v38 = sub_100004B28((uint64_t)off_100109BB8);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  sub_100094404();
                }

                id v40 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_doInstall]", 2733, @"IXErrorDomain", 0x1FuLL, 0, 0, @"Canceling installation for %@ because IXGizmoInstallingAppInstallCoordinator failed to find gizmo pairing ID.", v39, (uint64_t)self);
                [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v40 client:15];
                [v26 invalidate];
              }
            }
            else
            {
              __int16 v35 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                sub_100094390();
              }

              uint64_t v37 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_doInstall]", 2747, @"IXErrorDomain", 0x1EuLL, 0, 0, @"Canceling installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on this device.", v36, (uint64_t)self);
              [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v37 client:15];
              [v26 invalidate];
            }
          }
          else
          {
            [(IXSCoordinatedAppInstall *)self setAppInstallPowerAssertion:v26];
            unsigned __int8 v34 = [(IXSCoordinatedAppInstall *)self needsPostProcessing];
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_100050B50;
            v41[3] = &unk_1000EA7D8;
            v41[4] = self;
            id v43 = buf;
            id v42 = v11;
            unsigned __int8 v44 = v34;
            [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"App install" onLaunchServicesQueue:v41];
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v12 client:15];
        }
      }
    }
    else
    {
      id v8 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009431C();
      }

      id v10 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_doInstall]", 2656, @"IXErrorDomain", 1uLL, 0, 0, @"App asset was nil when we went to install it for %@", v9, (uint64_t)self);
      [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v10 client:15];
    }
  }
}

- (void)_onQueue_acquireAssertionAndDoInstall
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if (![(IXSCoordinatedAppInstall *)self appInstallState]
    || (id)[(IXSCoordinatedAppInstall *)self appInstallState] == (id)2
    || (id)[(IXSCoordinatedAppInstall *)self appInstallState] == (id)1)
  {
    id v4 = [(IXSCoordinatedAppInstall *)self publishedInstallProgress];
    [v4 setInstallPhase:1];

    id v5 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)buf = 136315394;
        unint64_t v18 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]";
        __int16 v19 = 2112;
        BOOL v20 = v8;
        uint64_t v9 = "%s: Adding reference for %@; no termination assertion required";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    unint64_t v10 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v10 == 7)
    {
      if (v11)
      {
        id v8 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)buf = 136315394;
        unint64_t v18 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]";
        __int16 v19 = 2112;
        BOOL v20 = v8;
        uint64_t v9 = "%s: Gizmo app install - not acquiring termination assertion to install %@";
        goto LABEL_10;
      }
LABEL_11:

      [(IXSCoordinatedAppInstall *)self _onQueue_doInstall];
      return;
    }
    if (v11)
    {
      id v12 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315394;
      unint64_t v18 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]";
      __int16 v19 = 2112;
      BOOL v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Acquiring termination assertion to install %@", buf, 0x16u);
    }
    [(IXSCoordinatedAppInstall *)self _onQueue_acquireAssertionForPlaceholder:0];
  }
  else
  {
    BOOL v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000944F4(self, v13);
    }

    uint64_t v14 = [(IXSCoordinatedAppInstall *)self appInstallState];
    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]", 2790, @"IXErrorDomain", 1uLL, 0, 0, @"Expected to have not yet begun app install or waiting/pending assertion acquisition but state was %lu", v15, v14);
    [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v16 client:15];
  }
}

- (void)_onQueue_fireObserversForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
  id v7 = [(IXSCoordinatedAppInstall *)self uniqueIdentifier];
  id v8 = [(IXSCoordinatedAppInstall *)self completedRecordPromise];
  uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v96 = "-[IXSCoordinatedAppInstall _onQueue_fireObserversForClient:]";
    __int16 v97 = 2112;
    uint64_t v98 = self;
    __int16 v99 = 2112;
    id v100 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: Firing applicable observers for client %@", buf, 0x20u);
  }

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100051940;
  v90[3] = &unk_1000E8E08;
  id v10 = v4;
  id v91 = v10;
  id v11 = v7;
  id v92 = v11;
  sub_100066F24(v6, v90);
  id v12 = [(IXSCoordinatedAppInstall *)self error];

  if (v12)
  {
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10005194C;
    v87[3] = &unk_1000E9140;
    BOOL v13 = &v88;
    id v88 = v10;
    uint64_t v14 = (id *)v89;
    v89[0] = v11;
    v89[1] = self;
    uint64_t v15 = v87;
  }
  else
  {
    if ([(IXSCoordinatedAppInstall *)self isComplete])
    {
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_1000519C0;
      v83[3] = &unk_1000E9140;
      BOOL v13 = &v84;
      id v84 = v10;
      uint64_t v14 = &v85;
      id v85 = v11;
      id v86 = v8;
      sub_100066F24(v6, v83);

      goto LABEL_6;
    }
    uint64_t v16 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
    BOOL v17 = sub_1000519D0(v16);

    if (v17)
    {
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_100051ADC;
      v80[3] = &unk_1000E8E08;
      id v81 = v10;
      id v82 = v11;
      sub_100066F24(v6, v80);
    }
    unint64_t v18 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
    BOOL v19 = sub_1000519D0(v18);

    if (v19)
    {
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100051AEC;
      v77[3] = &unk_1000E8E08;
      id v78 = v10;
      id v79 = v11;
      sub_100066F24(v6, v77);
    }
    if ([(IXSCoordinatedAppInstall *)self shouldBeginRestoringUserData])
    {
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100051AFC;
      v74[3] = &unk_1000E8E08;
      id v75 = v10;
      id v76 = v11;
      sub_100066F24(v6, v74);
    }
    if ([(IXSCoordinatedAppInstall *)self shouldBeginPostProcessing])
    {
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100051B08;
      v70[3] = &unk_1000E9140;
      id v71 = v10;
      id v72 = v11;
      id v73 = v8;
      sub_100066F24(v6, v70);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    BOOL v20 = [(IXSCoordinatedAppInstall *)self initialODRAssetPromises];
    id v21 = [v20 countByEnumeratingWithState:&v66 objects:v94 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v67;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v67 != v23) {
            objc_enumerationMutation(v20);
          }
          if (sub_1000519D0(*(void **)(*((void *)&v66 + 1) + 8 * i)))
          {
            int v25 = 1;
            goto LABEL_27;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v66 objects:v94 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    int v25 = 0;
LABEL_27:

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v26 = [(IXSCoordinatedAppInstall *)self essentialAssetPromises];
    id v27 = [v26 countByEnumeratingWithState:&v62 objects:v93 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v63;
      while (2)
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v63 != v29) {
            objc_enumerationMutation(v26);
          }
          if (sub_1000519D0(*(void **)(*((void *)&v62 + 1) + 8 * (void)j)))
          {
            int v31 = 1;
            goto LABEL_39;
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v62 objects:v93 count:16];
        if (v28) {
          continue;
        }
        break;
      }
      int v31 = 0;
    }
    else
    {
      int v31 = 0;
    }
LABEL_39:

    if (v25)
    {
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      void v59[2] = sub_100051B18;
      v59[3] = &unk_1000E8E08;
      id v60 = v10;
      id v61 = v11;
      sub_100066F24(v6, v59);
    }
    id v32 = [(IXSCoordinatedAppInstall *)self userDataPromise];
    BOOL v33 = sub_1000519D0(v32);

    if (v33)
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100051B28;
      v56[3] = &unk_1000E8E08;
      id v57 = v10;
      id v58 = v11;
      sub_100066F24(v6, v56);
    }
    unsigned __int8 v34 = [(IXSCoordinatedAppInstall *)self preparationPromise];
    BOOL v35 = sub_1000519D0(v34);

    if (v35)
    {
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100051B38;
      v53[3] = &unk_1000E8E08;
      id v54 = v10;
      id v55 = v11;
      sub_100066F24(v6, v53);
    }
    uint64_t v36 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromise];
    BOOL v37 = sub_1000519D0(v36);

    if (v37)
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100051B48;
      v50[3] = &unk_1000E8E08;
      id v51 = v10;
      id v52 = v11;
      sub_100066F24(v6, v50);
    }
    if (v31)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100051B58;
      v47[3] = &unk_1000E8E08;
      id v48 = v10;
      id v49 = v11;
      sub_100066F24(v6, v47);
    }
    if ((id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)4)
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100051B68;
      v44[3] = &unk_1000E8E08;
      id v45 = v10;
      id v46 = v11;
      sub_100066F24(v6, v44);
    }
    if ([(IXSCoordinatedAppInstall *)self isPaused])
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100051B78;
      v41[3] = &unk_1000E8E08;
      BOOL v13 = &v42;
      id v42 = v10;
      uint64_t v14 = &v43;
      id v43 = v11;
      uint64_t v15 = v41;
    }
    else
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100051B84;
      v38[3] = &unk_1000E8E08;
      BOOL v13 = &v39;
      id v39 = v10;
      uint64_t v14 = &v40;
      id v40 = v11;
      uint64_t v15 = v38;
    }
  }
  sub_100066F24(v6, v15);
LABEL_6:
}

- (IXSPlaceholder)placeholderPromise
{
  return self->_placeholderPromise;
}

- (void)setPlaceholderPromise:(id)a3
{
  id v5 = (IXSPlaceholder *)a3;
  unsigned int v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  p_placeholderPromise = &self->_placeholderPromise;
  if (self->_placeholderPromise != v5)
  {
    if ([(IXSCoordinatedAppInstall *)self state] >= 6)
    {
      uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setPlaceholderPromise:]", 3346, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Placeholder promise not needed because existing placeholder promise was already used.", v8, v23);
LABEL_15:
      sub_100051EEC(v5, v9, 15);

      goto LABEL_16;
    }
    id v10 = [(IXSCoordinatedAppInstall *)self identity];
    id v11 = [v10 bundleID];
    id v12 = [(IXSPlaceholder *)v5 bundleID];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      BOOL v20 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100094580();
      }

      id v21 = [(IXSPlaceholder *)v5 bundleID];
      uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setPlaceholderPromise:]", 3353, @"IXErrorDomain", 8uLL, 0, 0, @"Ignoring attempt to set a placeholder promise with bundle ID %@ on coordinator with different bundle id %@", v22, (uint64_t)v21);

      goto LABEL_15;
    }
    if (*p_placeholderPromise)
    {
      uint64_t v14 = [(IXSDataPromise *)*p_placeholderPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100051FC0;
      block[3] = &unk_1000E8FA8;
      void block[4] = self;
      dispatch_sync(v14, block);
    }
    objc_storeStrong((id *)&self->_placeholderPromise, a3);
    uint64_t v15 = [(IXSDataPromise *)v5 uniqueIdentifier];
    placeholderPromiseUUID = self->_placeholderPromiseUUID;
    self->_placeholderPromiseUUID = v15;

    placeholderPromise = self->_placeholderPromise;
    if (placeholderPromise)
    {
      unint64_t v18 = [(IXSDataPromise *)placeholderPromise accessQueue];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100051FCC;
      v24[3] = &unk_1000E8FA8;
      v24[4] = self;
      dispatch_sync(v18, v24);
    }
    BOOL v19 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v27 = "-[IXSCoordinatedAppInstall setPlaceholderPromise:]";
      __int16 v28 = 2112;
      uint64_t v29 = self;
      __int16 v30 = 2112;
      int v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: %@ : Placeholder Promise set: %@", buf, 0x20u);
    }

    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
    [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
  }
LABEL_16:
}

- (IXSOwnedDataPromise)appAssetPromise
{
  return self->_appAssetPromise;
}

- (void)_internal_setAppAssetPromise:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  unsigned int v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  appAssetPromise = self->_appAssetPromise;
  if (appAssetPromise != v5)
  {
    if (appAssetPromise)
    {
      uint64_t v8 = [(IXSDataPromise *)appAssetPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005213C;
      block[3] = &unk_1000E8FA8;
      void block[4] = self;
      dispatch_sync(v8, block);
    }
    objc_storeStrong((id *)&self->_appAssetPromise, a3);
    uint64_t v9 = [(IXSDataPromise *)v5 uniqueIdentifier];
    appAssetPromiseUUID = self->_appAssetPromiseUUID;
    self->_appAssetPromiseUUID = v9;

    id v11 = self->_appAssetPromise;
    if (v11)
    {
      id v12 = [(IXSDataPromise *)v11 accessQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100052148;
      v13[3] = &unk_1000E8FA8;
      v13[4] = self;
      dispatch_sync(v12, v13);
    }
  }
}

- (void)setAppAssetPromise:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)4
    || (id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)6)
  {
    unint64_t v6 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
    if (v6 >= 8)
    {
      uint64_t v8 = +[NSString stringWithFormat:@"Unknown intent value %lu", v6];
    }
    else
    {
      uint64_t v8 = *(&off_1000EAC40 + v6);
    }
    uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setAppAssetPromise:]", 3416, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Ignoring attempt to set app asset promise on %@: %@ : %@", v7, (uint64_t)v8);

    goto LABEL_7;
  }
  if ([(IXSCoordinatedAppInstall *)self state] >= 0x11)
  {
    uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setAppAssetPromise:]", 3423, @"IXErrorDomain", 0x1AuLL, 0, 0, @"App asset promise not needed because existing app asset promise was already used.", v10, v12);
LABEL_7:
    sub_100051EEC(v4, v9, 15);

    goto LABEL_8;
  }
  [(IXSCoordinatedAppInstall *)self _internal_setAppAssetPromise:v4];
  id v11 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[IXSCoordinatedAppInstall setAppAssetPromise:]";
    __int16 v15 = 2112;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ : App Asset Promise set: %@", buf, 0x20u);
  }

  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
LABEL_8:
}

- (unint64_t)appAssetPromiseDRI
{
  return self->_appAssetPromiseDRI;
}

- (void)setAppAssetPromiseDRI:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = IXStringForClientID(a3);
    int v8 = 136315650;
    uint64_t v9 = "-[IXSCoordinatedAppInstall setAppAssetPromiseDRI:]";
    __int16 v10 = 2112;
    id v11 = self;
    __int16 v12 = 2112;
    unsigned __int8 v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@ : App Asset Promise DRI set: %@", (uint8_t *)&v8, 0x20u);
  }
  self->_appAssetPromiseDRI = a3;
  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
}

- (NSArray)initialODRAssetPromises
{
  return self->_initialODRAssetPromises;
}

- (void)setInitialODRAssetPromises:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  if ([(IXSCoordinatedAppInstall *)self state] < 0xD)
  {
    uint64_t v9 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v38 = v5;
    id obj = v5;
    id v18 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v23 = [v22 uniqueIdentifier];
          [v9 addObject:v23];

          id v24 = [v22 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100052920;
          block[3] = &unk_1000E8E08;
          void block[4] = v22;
          void block[5] = self;
          dispatch_sync(v24, block);
        }
        id v19 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
      }
      while (v19);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    BOOL v37 = self;
    p_initialODRAssetPromises = &self->_initialODRAssetPromises;
    int v25 = self->_initialODRAssetPromises;
    id v26 = [(NSArray *)v25 countByEnumeratingWithState:&v43 objects:v62 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v25);
          }
          __int16 v30 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          int v31 = [v30 accessQueue];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100052928;
          v40[3] = &unk_1000E8E08;
          id v41 = v9;
          id v42 = v30;
          dispatch_sync(v31, v40);
        }
        id v27 = [(NSArray *)v25 countByEnumeratingWithState:&v43 objects:v62 count:16];
      }
      while (v27);
    }

    objc_storeStrong((id *)p_initialODRAssetPromises, a3);
    id v32 = (NSArray *)[v9 copy];
    initialODRAssetPromiseUUIDs = v37->_initialODRAssetPromiseUUIDs;
    v37->_initialODRAssetPromiseUUIDs = v32;

    unsigned __int8 v34 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v57 = "-[IXSCoordinatedAppInstall setInitialODRAssetPromises:]";
      __int16 v58 = 2112;
      BOOL v59 = v37;
      __int16 v60 = 2112;
      id v61 = obj;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: %@ : Initial ODR Asset Promises set: %@", buf, 0x20u);
    }

    [(IXSCoordinatedAppInstall *)v37 _onQueue_saveState];
    [(IXSCoordinatedAppInstall *)v37 _onQueue_checkState];
    id v5 = v38;
  }
  else
  {
    int v8 = self;
    uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setInitialODRAssetPromises:]", 3466, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Not processing attempt to set initial ODR asset promises because those that were set were already complete and this coordinator is past the point of waiting for them.", v7, v35);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (k = 0; k != v12; k = (char *)k + 1)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
          uint64_t v16 = v8->_initialODRAssetPromiseUUIDs;
          __int16 v17 = [v15 uniqueIdentifier];
          LOBYTE(v16) = [(NSArray *)v16 containsObject:v17];

          if ((v16 & 1) == 0) {
            sub_100051EEC(v15, v9, 15);
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
      }
      while (v12);
    }
  }
}

- (IXSPromisedOutOfBandTransfer)userDataPromise
{
  return self->_userDataPromise;
}

- (void)setUserDataPromise:(id)a3
{
  id v5 = (IXSPromisedOutOfBandTransfer *)a3;
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  p_userDataPromise = &self->_userDataPromise;
  if (self->_userDataPromise != v5)
  {
    if ([(IXSCoordinatedAppInstall *)self state] < 0xB)
    {
      if (*p_userDataPromise)
      {
        id v10 = [(IXSDataPromise *)*p_userDataPromise accessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100052C18;
        block[3] = &unk_1000E8FA8;
        void block[4] = self;
        dispatch_sync(v10, block);
      }
      objc_storeStrong((id *)&self->_userDataPromise, a3);
      id v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
      userDataPromiseUUID = self->_userDataPromiseUUID;
      self->_userDataPromiseUUID = v11;

      userDataPromise = self->_userDataPromise;
      if (userDataPromise)
      {
        uint64_t v14 = [(IXSDataPromise *)userDataPromise accessQueue];
        v16[0] = (uint64_t)_NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = (uint64_t)sub_100052C24;
        v16[3] = (uint64_t)&unk_1000E8FA8;
        v16[4] = (uint64_t)self;
        dispatch_sync(v14, v16);
      }
      __int16 v15 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "-[IXSCoordinatedAppInstall setUserDataPromise:]";
        __int16 v20 = 2112;
        id v21 = self;
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ : User Data Promise set: %@", buf, 0x20u);
      }

      [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
      [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
    }
    else
    {
      uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setUserDataPromise:]", 3521, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Not processing attempt to set user data promise because it was already complete and this coordinator is past the point of waiting for it.", v8, v16[0]);
      sub_100051EEC(v5, v9, 15);
    }
  }
}

- (IXSPromisedOutOfBandTransfer)deviceSecurityPromise
{
  return self->_deviceSecurityPromise;
}

- (void)setDeviceSecurityPromise:(id)a3
{
  id v5 = (IXSPromisedOutOfBandTransfer *)a3;
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  p_deviceSecurityPromise = &self->_deviceSecurityPromise;
  if (self->_deviceSecurityPromise != v5)
  {
    if ([(IXSCoordinatedAppInstall *)self state] < 0x11)
    {
      if (*p_deviceSecurityPromise)
      {
        id v10 = [(IXSDataPromise *)*p_deviceSecurityPromise accessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100052EAC;
        block[3] = &unk_1000E8FA8;
        void block[4] = self;
        dispatch_sync(v10, block);
      }
      objc_storeStrong((id *)&self->_deviceSecurityPromise, a3);
      id v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
      deviceSecurityPromiseUUID = self->_deviceSecurityPromiseUUID;
      self->_deviceSecurityPromiseUUID = v11;

      deviceSecurityPromise = self->_deviceSecurityPromise;
      if (deviceSecurityPromise)
      {
        uint64_t v14 = [(IXSDataPromise *)deviceSecurityPromise accessQueue];
        v16[0] = (uint64_t)_NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = (uint64_t)sub_100052EB8;
        v16[3] = (uint64_t)&unk_1000E8FA8;
        v16[4] = (uint64_t)self;
        dispatch_sync(v14, v16);
      }
      __int16 v15 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "-[IXSCoordinatedAppInstall setDeviceSecurityPromise:]";
        __int16 v20 = 2112;
        id v21 = self;
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ : Device Security Promise set: %@", buf, 0x20u);
      }

      [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
      [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
    }
    else
    {
      uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setDeviceSecurityPromise:]", 3565, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Not processing attempt to set device security promise because it was already complete and this coordinator is past the point of waiting for it.", v8, v16[0]);
      sub_100051EEC(v5, v9, 15);
    }
  }
}

- (IXSPromisedOutOfBandTransfer)preparationPromise
{
  return self->_preparationPromise;
}

- (void)setPreparationPromise:(id)a3
{
  id v5 = (IXSPromisedOutOfBandTransfer *)a3;
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  preparationPromise = self->_preparationPromise;
  if (preparationPromise != v5)
  {
    if (preparationPromise)
    {
      uint64_t v8 = [(IXSDataPromise *)preparationPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000530DC;
      block[3] = &unk_1000E8FA8;
      void block[4] = self;
      dispatch_sync(v8, block);
    }
    objc_storeStrong((id *)&self->_preparationPromise, a3);
    uint64_t v9 = [(IXSDataPromise *)v5 uniqueIdentifier];
    preparationPromiseUUID = self->_preparationPromiseUUID;
    self->_preparationPromiseUUID = v9;

    id v11 = self->_preparationPromise;
    if (v11)
    {
      id v12 = [(IXSDataPromise *)v11 accessQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000530E8;
      v14[3] = &unk_1000E8FA8;
      v14[4] = self;
      dispatch_sync(v12, v14);
    }
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[IXSCoordinatedAppInstall setPreparationPromise:]";
      __int16 v18 = 2112;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@ : Preparation Promise set: %@", buf, 0x20u);
    }

    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
    [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
  }
}

- (IXSOwnedDataPromise)installOptionsPromise
{
  return self->_installOptionsPromise;
}

- (void)_internal_setInstallOptionsPromise:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  installOptionsPromise = self->_installOptionsPromise;
  if (installOptionsPromise != v5)
  {
    if (installOptionsPromise)
    {
      uint64_t v8 = [(IXSDataPromise *)installOptionsPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100053258;
      block[3] = &unk_1000E8FA8;
      void block[4] = self;
      dispatch_sync(v8, block);
    }
    objc_storeStrong((id *)&self->_installOptionsPromise, a3);
    uint64_t v9 = [(IXSDataPromise *)v5 uniqueIdentifier];
    installOptionsPromiseUUID = self->_installOptionsPromiseUUID;
    self->_installOptionsPromiseUUID = v9;

    id v11 = self->_installOptionsPromise;
    if (v11)
    {
      id v12 = [(IXSDataPromise *)v11 accessQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100053264;
      v13[3] = &unk_1000E8FA8;
      v13[4] = self;
      dispatch_sync(v12, v13);
    }
  }
}

- (void)setInstallOptionsPromise:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)4)
  {
    sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setInstallOptionsPromise:]", 3665, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Ignoring attempt to set install options on restoring demoted coordinator: %@ : %@", v6, (uint64_t)self);
    uint64_t v8 = LABEL_5:;
    sub_100051EEC(v4, v8, 15);

    goto LABEL_9;
  }
  if ([(IXSCoordinatedAppInstall *)self state] >= 0x10)
  {
    sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setInstallOptionsPromise:]", 3672, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Not processing attempt to set install options because this coordinator is past the point of needing them: %@", v7, (uint64_t)self);
    goto LABEL_5;
  }
  [(IXSCoordinatedAppInstall *)self _internal_setInstallOptionsPromise:v4];
  uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v11 = "-[IXSCoordinatedAppInstall setInstallOptionsPromise:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ : install options set: %@", buf, 0x20u);
  }

  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
LABEL_9:
}

- (BOOL)needsPostProcessing
{
  return self->_needsPostProcessing;
}

- (void)setNeedsPostProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[IXSCoordinatedAppInstall setNeedsPostProcessing:]";
    if (v3) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    __int16 v10 = 2112;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@ : needs post processing set to %c", (uint8_t *)&v8, 0x1Cu);
  }

  if (self->_needsPostProcessing != v3)
  {
    self->_needsPostProcessing = v3;
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  }
}

- (BOOL)shouldBeginPostProcessing
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ((char *)[(IXSCoordinatedAppInstall *)self effectiveIntent] - 1 > (char *)1)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = [(IXSCoordinatedAppInstall *)self needsPostProcessing];
    if (v4) {
      LOBYTE(v4) = (id)[(IXSCoordinatedAppInstall *)self appInstallState] == (id)4;
    }
  }
  return v4;
}

- (NSArray)essentialAssetPromises
{
  return self->_essentialAssetPromises;
}

- (void)setEssentialAssetPromises:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  if ([(IXSCoordinatedAppInstall *)self state] < 0x1C)
  {
    uint64_t v9 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v38 = v5;
    id obj = v5;
    id v18 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(obj);
          }
          __int16 v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v23 = [v22 uniqueIdentifier];
          [v9 addObject:v23];

          id v24 = [v22 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100053A40;
          block[3] = &unk_1000E8E08;
          void block[4] = v22;
          void block[5] = self;
          dispatch_sync(v24, block);
        }
        id v19 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
      }
      while (v19);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    BOOL v37 = self;
    p_essentialAssetPromises = &self->_essentialAssetPromises;
    int v25 = self->_essentialAssetPromises;
    id v26 = [(NSArray *)v25 countByEnumeratingWithState:&v43 objects:v62 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v25);
          }
          __int16 v30 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          int v31 = [v30 accessQueue];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100053A48;
          v40[3] = &unk_1000E8E08;
          id v41 = v9;
          id v42 = v30;
          dispatch_sync(v31, v40);
        }
        id v27 = [(NSArray *)v25 countByEnumeratingWithState:&v43 objects:v62 count:16];
      }
      while (v27);
    }

    objc_storeStrong((id *)p_essentialAssetPromises, a3);
    id v32 = (NSArray *)[v9 copy];
    essentialAssetPromiseUUIDs = v37->_essentialAssetPromiseUUIDs;
    v37->_essentialAssetPromiseUUIDs = v32;

    unsigned __int8 v34 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v57 = "-[IXSCoordinatedAppInstall setEssentialAssetPromises:]";
      __int16 v58 = 2112;
      BOOL v59 = v37;
      __int16 v60 = 2112;
      id v61 = obj;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s: %@ : Essential Asset Promises set: %@", buf, 0x20u);
    }

    [(IXSCoordinatedAppInstall *)v37 _onQueue_saveState];
    [(IXSCoordinatedAppInstall *)v37 _onQueue_checkState];
    id v5 = v38;
  }
  else
  {
    int v8 = self;
    uint64_t v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall setEssentialAssetPromises:]", 3746, @"IXErrorDomain", 0x1AuLL, 0, 0, @"Not processing attempt to set essential asset promises because those that were set were already complete and this coordinator is past the point of waiting for them.", v7, v35);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (k = 0; k != v12; k = (char *)k + 1)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
          uint64_t v16 = v8->_essentialAssetPromiseUUIDs;
          __int16 v17 = [v15 uniqueIdentifier];
          LOBYTE(v16) = [(NSArray *)v16 containsObject:v17];

          if ((v16 & 1) == 0) {
            sub_100051EEC(v15, v9, 15);
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
      }
      while (v12);
    }
  }
}

- (NSUUID)targetGizmoPairingID
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  targetGizmoPairingID = self->_targetGizmoPairingID;

  return targetGizmoPairingID;
}

- (void)setTargetGizmoPairingID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  if (([(NSUUID *)self->_targetGizmoPairingID isEqual:v5] & 1) == 0)
  {
    uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "-[IXSCoordinatedAppInstall setTargetGizmoPairingID:]";
      __int16 v10 = 2112;
      id v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@ : target gizmo pairing ID set: %@", (uint8_t *)&v8, 0x20u);
    }

    objc_storeStrong((id *)&self->_targetGizmoPairingID, a3);
  }
}

- (BOOL)isPaused
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
}

- (void)setIsPaused:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if (self->_isPaused != v4)
  {
    __int16 v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v19 = "-[IXSCoordinatedAppInstall setIsPaused:completion:]";
      if (v4) {
        int v11 = 89;
      }
      else {
        int v11 = 78;
      }
      __int16 v20 = 2112;
      id v21 = self;
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: setting isPaused to %c", buf, 0x1Cu);
    }

    self->_isPaused = v4;
    if (v4) {
      [(IXSCoordinatedAppInstall *)self _onQueue_pauseProgress];
    }
    else {
      [(IXSCoordinatedAppInstall *)self _onQueue_resumeProgress];
    }
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
    __int16 v12 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100053EAC;
    v13[3] = &unk_1000EA800;
    BOOL v15 = v4;
    v13[4] = self;
    id v14 = v6;
    sub_100066F24(v12, v13);

    uint64_t v9 = v14;
    goto LABEL_13;
  }
  if (v6)
  {
    int v8 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100053E98;
    v16[3] = &unk_1000E91E0;
    id v17 = v6;
    sub_100066F24(v8, v16);

    uint64_t v9 = v17;
LABEL_13:
  }
}

- (void)externalSetIsPaused:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053FF4;
  block[3] = &unk_1000EA800;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (BOOL)externalGetIsPaused
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000540DC;
  v5[3] = &unk_1000E90A8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setImportance:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if (a3 - 5 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    unint64_t importance = self->_importance;
    if (importance != a3)
    {
      uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = IXStringForCoordinatorImportance(a3);
        int v13 = 136315650;
        id v14 = "-[IXSCoordinatedAppInstall setImportance:]";
        __int16 v15 = 2112;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: setting importance to %@", (uint8_t *)&v13, 0x20u);
      }
      self->_unint64_t importance = a3;
      unsigned int v9 = +[IXFeatureFlags scheduledUpdatesEnabled];
      if (a3 != 4 && v9 && (id)[(IXSCoordinatedAppInstall *)self updateScheduleState] == (id)1)
      {
        id v10 = +[IXSAppUpdateScheduler sharedInstance];
        BOOL v11 = [(IXSCoordinatedAppInstall *)self uniqueIdentifier];
        [v10 removeUpdateRequestForCoordinatorUUID:v11];

        [(IXSCoordinatedAppInstall *)self setUpdateScheduleState:0];
      }
      if (a3 != 1
        && a3 != 4
        && importance <= 4
        && ((1 << importance) & 0x13) != 0
        && (id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)2
        && (id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)6)
      {
        __int16 v12 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315394;
          id v14 = "-[IXSCoordinatedAppInstall setImportance:]";
          __int16 v15 = 2112;
          uint64_t v16 = self;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Converting coordinator to user-initiated: %@", (uint8_t *)&v13, 0x16u);
        }

        [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:0];
      }
      [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
      [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
    }
  }
}

- (unint64_t)importance
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_importance;
}

- (unint64_t)newRemovability
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_newRemovability;
}

- (void)setNewRemovability:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_newRemovability = a3;

  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
}

- (unint64_t)newRemovabilityClient
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_newRemovabilityClient;
}

- (void)setNewRemovabilityClient:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_newRemovabilityClient = a3;

  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
}

- (unint64_t)savedRemovability
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_savedRemovability;
}

- (void)setSavedRemovability:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_savedRemovability = a3;

  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
}

- (unint64_t)savedRemovabilityClient
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_savedRemovabilityClient;
}

- (void)setSavedRemovabilityClient:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_savedRemovabilityClient = a3;

  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
}

- (void)setNewRemovabilityState:(unint64_t)a3 removabilityClient:(unint64_t)a4
{
  uint64_t v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if (*(_OWORD *)&self->_newRemovability != __PAIR128__(a4, a3))
  {
    self->_newRemovability = a3;
    self->_newRemovabilityClient = a4;
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  }
}

- (void)setPriorityBoostCompletion:(id)a3 withSourceInfo:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (NSString *)a4;
  uint64_t v8 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id priorityBoostCompletion = self->_priorityBoostCompletion;
  if (priorityBoostCompletion != v6)
  {
    id v10 = objc_retainBlock(priorityBoostCompletion);
    if (v10)
    {
      BOOL v11 = self->_priorityBoostSourceInfo;
      __int16 v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v20 = "-[IXSCoordinatedAppInstall setPriorityBoostCompletion:withSourceInfo:]";
        __int16 v21 = 2112;
        __int16 v22 = self;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Disposing of %@", buf, 0x20u);
      }

      int v13 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000548B8;
      v17[3] = &unk_1000E91E0;
      id v18 = v10;
      sub_100066F24(v13, v17);
    }
    if (v6)
    {
      id v14 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v20 = "-[IXSCoordinatedAppInstall setPriorityBoostCompletion:withSourceInfo:]";
        __int16 v21 = 2112;
        __int16 v22 = self;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: %@: Retaining %@", buf, 0x20u);
      }
    }
    id v15 = objc_retainBlock(v6);
    id v16 = self->_priorityBoostCompletion;
    self->_id priorityBoostCompletion = v15;

    objc_storeStrong((id *)&self->_priorityBoostSourceInfo, a4);
  }
}

- (id)priorityBoostCompletion
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_retainBlock(self->_priorityBoostCompletion);

  return v4;
}

- (NSString)priorityBoostSourceInfo
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  priorityBoostSourceInfo = self->_priorityBoostSourceInfo;

  return priorityBoostSourceInfo;
}

- (BOOL)shouldBeginRestoringUserData
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ((id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] != (id)4) {
    return 0;
  }
  id v4 = [(IXSCoordinatedAppInstall *)self userDataPromise];
  if (v4)
  {
    id v5 = v4;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    id v6 = [v4 accessQueue];
    __int16 v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10006453C;
    id v15 = &unk_1000E90A8;
    id v16 = v5;
    __int16 v17 = &v18;
    id v7 = v5;
    dispatch_sync(v6, &v12);

    LODWORD(v6) = *((unsigned __int8 *)v19 + 24);
    _Block_object_dispose(&v18, 8);

    if (v6) {
      return 0;
    }
  }
  unint64_t v8 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  if (v8 == 4) {
    return 1;
  }
  if (v8 != 3) {
    return 0;
  }
  unsigned int v9 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
  BOOL v10 = sub_1000519D0(v9);

  return v10;
}

- (void)prioritizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054B8C;
  v7[3] = &unk_1000E9948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onQueue_prioritizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(IXSCoordinatedAppInstall *)self state];
  if (v6 != 28 && v6 != 1)
  {
    unsigned int v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "-[IXSCoordinatedAppInstall _onQueue_prioritizeWithCompletion:]";
      __int16 v18 = 2112;
      id v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: prioritizing", buf, 0x16u);
    }

    [(IXSCoordinatedAppInstall *)self setIsPaused:0];
    [(IXSCoordinatedAppInstall *)self setImportance:3];
    if ((id)[(IXSCoordinatedAppInstall *)self appInstallState] == (id)2
      || (id)[(IXSCoordinatedAppInstall *)self appInstallState] == (id)1)
    {
      [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
      [(IXSCoordinatedAppInstall *)self _onQueue_acquireAssertionAndDoInstall];
    }
    else if ((id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)2 {
           || (id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)1)
    }
    {
      [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
      [(IXSCoordinatedAppInstall *)self _onQueue_acquireAssertionAndInstallPlaceholder];
    }
    BOOL v10 = +[IXSCoordinatorManager sharedInstance];
    [v10 prioritizeCoordinator:self];

    BOOL v11 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100054E48;
    v12[3] = &unk_1000E9948;
    v12[4] = self;
    id v13 = v4;
    sub_100066F24(v11, v12);

    id v8 = v13;
    goto LABEL_11;
  }
  if (v4)
  {
    id v7 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100054E34;
    v14[3] = &unk_1000E91E0;
    id v15 = v4;
    sub_100066F24(v7, v14);

    id v8 = v15;
LABEL_11:
  }
}

- (void)_onQueue_unregister
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ([(IXSCoordinatedAppInstall *)self isTracked])
  {
    id v4 = +[IXSCoordinatorManager sharedInstance];
    [v4 unregisterCoordinator:self];
  }
}

- (BOOL)isComplete
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_complete)
  {
    unint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall setComplete:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@ complete!", buf, 0x16u);
    }

    if ([(IXSCoordinatedAppInstall *)self needsPostProcessing])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v58 = sub_100047F68;
      BOOL v59 = sub_100047F78;
      id v60 = 0;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100055624;
      v50[3] = &unk_1000E9230;
      void v50[4] = self;
      v50[5] = buf;
      [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"Parallel placeholder cleanup after post processing" onUninstallQueue:v50];
      id v7 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)long long v53 = 136315394;
        long long v54 = "-[IXSCoordinatedAppInstall setComplete:]";
        __int16 v55 = 2112;
        id v56 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: Waiting for pending parallel placeholder uninstall to complete", v53, 0x16u);
      }
      unsigned int v9 = [(IXSCoordinatedAppInstall *)self outstandingInstallOperationsGroup];
      dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

      BOOL v10 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)long long v53 = 136315394;
        long long v54 = "-[IXSCoordinatedAppInstall setComplete:]";
        __int16 v55 = 2112;
        id v56 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: Pending parallel placeholder uninstall completed on group", v53, 0x16u);
      }
      [(IXSCoordinatedAppInstall *)self setCompletedRecordPromise:*(void *)(*(void *)&buf[8] + 40)];
      _Block_object_dispose(buf, 8);
    }
    [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
    __int16 v12 = [(IXSCoordinatedAppInstall *)self appInstallPowerAssertion];
    [v12 invalidate];

    [(IXSCoordinatedAppInstall *)self setAppInstallPowerAssertion:0];
    uint64_t v13 = [(IXSCoordinatedAppInstall *)self schedulerCallback];
    id v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    [(IXSCoordinatedAppInstall *)self setSchedulerCallback:0];
    self->_complete = a3;
    id v15 = [(IXSCoordinatedAppInstall *)self error];
    BOOL v16 = v15 == 0;

    __int16 v17 = [(IXSCoordinatedAppInstall *)self publishedInstallProgress];
    id v18 = v17;
    if (v16)
    {
      [v17 finishProgressWithState:5];

      id v19 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
      sub_100055870(v19);

      uint64_t v20 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
      sub_100055870(v20);

      char v21 = [(IXSCoordinatedAppInstall *)self userDataPromise];
      sub_100055870(v21);

      __int16 v22 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromise];
      sub_100055870(v22);

      __int16 v23 = [(IXSCoordinatedAppInstall *)self preparationPromise];
      sub_100055870(v23);

      id v24 = [(IXSCoordinatedAppInstall *)self installOptionsPromise];
      sub_100055870(v24);

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      int v25 = [(IXSCoordinatedAppInstall *)self initialODRAssetPromises];
      id v26 = [v25 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v47;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v47 != v27) {
              objc_enumerationMutation(v25);
            }
            sub_100055870(*(void **)(*((void *)&v46 + 1) + 8 * (void)v28));
            uint64_t v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          id v26 = [v25 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v26);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v29 = [(IXSCoordinatedAppInstall *)self essentialAssetPromises];
      id v30 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v43;
        do
        {
          id v32 = 0;
          do
          {
            if (*(void *)v43 != v31) {
              objc_enumerationMutation(v29);
            }
            sub_100055870(*(void **)(*((void *)&v42 + 1) + 8 * (void)v32));
            id v32 = (char *)v32 + 1;
          }
          while (v30 != v32);
          id v30 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v30);
      }

      BOOL v33 = [(IXSCoordinatedAppInstall *)self seed];
      unint64_t v34 = (unint64_t)[v33 intent] - 1;
      if (v34 > 6) {
        uint64_t v35 = 17;
      }
      else {
        uint64_t v35 = qword_1000AAFD0[v34];
      }
      uint64_t v36 = [(IXSCoordinatedAppInstall *)self identity];
      BOOL v37 = [v36 bundleID];
      +[AITransactionLog logStep:v35 byParty:4 phase:2 success:1 forBundleID:v37 description:@"Coordinator completed successfully."];

      [(IXSCoordinatedAppInstall *)self _onQueue_unregister];
      id v38 = [(IXSCoordinatedAppInstall *)self completedRecordPromise];
      id v39 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100055918;
      v40[3] = &unk_1000E8E08;
      void v40[4] = self;
      id v41 = v38;
      id v18 = v38;
      sub_100066F24(v39, v40);
    }
    else
    {
      [v17 finishProgressWithState:4];
    }

    [(IXSCoordinatedAppInstall *)self setPriorityBoostCompletion:0 withSourceInfo:0];
    [(IXSCoordinatedAppInstall *)self setCompletedRecordPromise:0];
  }
}

- (BOOL)placeholderIsInstalled
{
  return [(IXSCoordinatedAppInstall *)self _placeholderOrParallelPlaceholderIsInstalledWithRecord:0];
}

- (BOOL)_placeholderOrParallelPlaceholderIsInstalledWithRecord:(id *)a3
{
  id v5 = objc_alloc((Class)LSApplicationRecord);
  unint64_t v6 = [(IXSCoordinatedAppInstall *)self identity];
  id v7 = [v6 bundleID];
  id v13 = 0;
  id v8 = [v5 initForInstallMachineryWithBundleIdentifier:v7 placeholder:1 error:&v13];
  id v9 = v13;

  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    unsigned __int8 v10 = [v8 isPlaceholder];
  }
  else
  {
    BOOL v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10009469C();
    }

    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)_asyncUpdatePlaceholderMetadataWithInstallType:(unint64_t)a3 reason:(int64_t)a4 underlyingError:(id)a5 client:(unint64_t)a6
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100055B34;
  v8[3] = &unk_1000EA828;
  unint64_t v11 = a3;
  int64_t v12 = a4;
  id v9 = self;
  id v10 = a5;
  unint64_t v13 = a6;
  id v7 = v10;
  [(IXSCoordinatedAppInstall *)v9 _runAsyncBlockWithDescription:@"placeholder metadata update" onLaunchServicesQueue:v8];
}

- (void)_onQueue_updatePlaceholderForFailureReason:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v9);

  id v20 = v8;
  id v10 = [v20 domain];
  LODWORD(v9) = [v10 isEqualToString:@"IXUserPresentableErrorDomain"];

  if (v9)
  {
    uint64_t v11 = (uint64_t)[v20 code];
    int64_t v12 = [v20 userInfo];
    unint64_t v13 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];
  }
  else
  {
    uint64_t v11 = 1;
    unint64_t v13 = v20;
  }
  unint64_t v14 = [(IXSCoordinatedAppInstall *)self placeholderInstallState];
  if (v14 - 1 >= 2)
  {
    if (v14 == 3 || [(IXSCoordinatedAppInstall *)self placeholderIsInstalled]) {
      [(IXSCoordinatedAppInstall *)self _asyncUpdatePlaceholderMetadataWithInstallType:a5 reason:v11 underlyingError:v13 client:a4];
    }
  }
  else
  {
    id v15 = objc_opt_new();
    [(IXSCoordinatedAppInstall *)self setPlaceholderFailureInfo:v15];

    BOOL v16 = [(IXSCoordinatedAppInstall *)self placeholderFailureInfo];
    [v16 setInstallType:a5];

    __int16 v17 = [(IXSCoordinatedAppInstall *)self placeholderFailureInfo];
    [v17 setReason:v11];

    id v18 = [(IXSCoordinatedAppInstall *)self placeholderFailureInfo];
    [v18 setUnderlyingError:v13];

    id v19 = [(IXSCoordinatedAppInstall *)self placeholderFailureInfo];
    [v19 setClient:a4];
  }
}

- (void)setCompletedRecordPromise:(id)a3
{
  id v8 = (LSRecordPromise *)a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  completedRecordPromise = self->_completedRecordPromise;
  p_completedRecordPromise = &self->_completedRecordPromise;
  if (completedRecordPromise != v8) {
    objc_storeStrong((id *)p_completedRecordPromise, a3);
  }
}

- (LSRecordPromise)completedRecordPromise
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  completedRecordPromise = self->_completedRecordPromise;

  return completedRecordPromise;
}

- (BOOL)_shouldRemovePlaceholderForReason:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"IXUserPresentableErrorDomain"]
    && [v3 code] == (id)3)
  {
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v6 = [v3 domain];
    if ([v6 isEqualToString:@"IXUserPresentableErrorDomain"]
      && [v3 code] == (id)5)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = [v3 domain];
      if ([v7 isEqualToString:@"IXUserPresentableErrorDomain"]
        && [v3 code] == (id)6)
      {
        BOOL v5 = 1;
      }
      else
      {
        id v8 = [v3 domain];
        if ([v8 isEqualToString:@"IXUserPresentableErrorDomain"]
          && [v3 code] == (id)13)
        {
          BOOL v5 = 1;
        }
        else
        {
          id v9 = [v3 domain];
          if ([v9 isEqualToString:@"IXUserPresentableErrorDomain"]) {
            BOOL v5 = [v3 code] == (id)15;
          }
          else {
            BOOL v5 = 0;
          }
        }
      }
    }
  }

  return v5;
}

- (void)_onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if ([(IXSCoordinatedAppInstall *)self _shouldRemovePlaceholderForReason:v6])
  {
    [(IXSCoordinatedAppInstall *)self _onQueue_internal_cancelForReason:v6 client:a4];
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v12 = "-[IXSCoordinatedAppInstall _onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:client:]";
      __int16 v13 = 2112;
      unint64_t v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: Converting restoring to restoring demoted after app asset promise cancelation", buf, 0x16u);
    }

    [(IXSCoordinatedAppInstall *)self setEffectiveIntent:4];
    self->_appAssetPromiseDRI = [(IXSCoordinatedAppInstall *)self creator];
    [(IXSCoordinatedAppInstall *)self _internal_setAppAssetPromise:0];
    [(IXSCoordinatedAppInstall *)self _internal_setInstallOptionsPromise:0];
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
    [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
    if (![(IXSCoordinatedAppInstall *)self sentBeginRestoringUserData]
      && [(IXSCoordinatedAppInstall *)self shouldBeginRestoringUserData])
    {
      [(IXSCoordinatedAppInstall *)self setSentBeginRestoringUserData:1];
      id v9 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100056248;
      v10[3] = &unk_1000E8FA8;
      v10[4] = self;
      sub_100066F24(v9, v10);
    }
    [(IXSCoordinatedAppInstall *)self _onQueue_updatePlaceholderForFailureReason:v6 client:a4 installType:7];
  }
}

- (void)_onQueue_removeParallelPlaceholder:(BOOL *)a3
{
  BOOL v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if ((char *)[(IXSCoordinatedAppInstall *)self placeholderInstallState] - 3 <= (char *)1)
  {
    id v6 = [(IXSCoordinatedAppInstall *)self identity];
    id v7 = IXStringForClientID([(IXSCoordinatedAppInstall *)self creator]);
    id v8 = +[NSString stringWithFormat:@"Cleaning up parallel placeholder for %@ after failure (coordinator creator: %@)", v6, v7];

    if (a3) {
      *a3 = 1;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000563D0;
    v10[3] = &unk_1000E8E08;
    v10[4] = self;
    id v11 = v8;
    id v9 = v8;
    [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"Parallel placeholder cleanup after failure" onUninstallQueue:v10];
  }
}

- (BOOL)_onQueue_shouldDeletePlaceholderOnCancelationForReason:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = [(IXSCoordinatedAppInstall *)self placeholderDisposition];
  if (v8 == 3)
  {
    BOOL v9 = 0;
  }
  else if (v8 == 2 {
         || a4 == 8
  }
         || [(IXSCoordinatedAppInstall *)self _shouldRemovePlaceholderForReason:v6])
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)1)
    {
      id v11 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
      int64_t v12 = v11;
      if (v11)
      {
        __int16 v13 = [v11 accessQueue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000566CC;
        v14[3] = &unk_1000E9230;
        id v15 = v12;
        BOOL v16 = &v17;
        dispatch_sync(v13, v14);
      }
    }
    BOOL v9 = *((unsigned char *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

- (void)_onQueue_cancelPlaceholderIfNeededForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5
{
  id v8 = a3;
  BOOL v9 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v9);

  unint64_t v10 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  switch(v10)
  {
    case 1uLL:
    case 3uLL:
      unint64_t v15 = [(IXSCoordinatedAppInstall *)self placeholderDisposition];
      unsigned int v16 = [(IXSCoordinatedAppInstall *)self needsPostProcessing];
      unint64_t v17 = [(IXSCoordinatedAppInstall *)self appInstallState];
      if (![(IXSCoordinatedAppInstall *)self _onQueue_shouldDeletePlaceholderOnCancelationForReason:v8 client:a4])
      {
        if (v17 == 4) {
          unsigned int v25 = v16;
        }
        else {
          unsigned int v25 = 0;
        }
        if (v10 == 1 || v25) {
          [(IXSCoordinatedAppInstall *)self _onQueue_removeParallelPlaceholder:a5];
        }
        int64_t v12 = self;
        id v13 = v8;
        unint64_t v14 = a4;
        unint64_t v11 = 7;
        goto LABEL_17;
      }
      char v29 = v16;
      id v18 = [(IXSCoordinatedAppInstall *)self identity];
      uint64_t v19 = [v18 bundleID];
      uint64_t v20 = IXStringForClientID(a4);
      char v21 = (void *)v20;
      if (v15 == 1)
      {
        __int16 v22 = +[NSString stringWithFormat:@"Cleaning up placeholder for %@ after cancelation with reason %@ client %@", v19, v8, v20];
      }
      else
      {
        id v26 = IXStringForPlaceholderDisposition(v15);
        __int16 v22 = +[NSString stringWithFormat:@"Cleaning up placeholder for %@ after cancelation with reason %@ client %@ placeholder disposition %@", v19, v8, v21, v26];
      }
      if (a5) {
        *a5 = 1;
      }
      char v27 = v29 ^ 1;
      if (v10 != 1) {
        char v27 = 1;
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100056AB8;
      v30[3] = &unk_1000EA698;
      if (v17 != 4) {
        char v27 = 1;
      }
      char v32 = v27;
      v30[4] = self;
      id v31 = v22;
      id v28 = v22;
      [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"placeholder cleanup after cancel" onUninstallQueue:v30];

      break;
    case 2uLL:
      [(IXSCoordinatedAppInstall *)self _onQueue_removeParallelPlaceholder:a5];
      break;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      unint64_t v11 = [(IXSCoordinatedAppInstall *)self originalInstallType];
      int64_t v12 = self;
      id v13 = v8;
      unint64_t v14 = a4;
LABEL_17:
      [(IXSCoordinatedAppInstall *)v12 _onQueue_updatePlaceholderForFailureReason:v13 client:v14 installType:v11];
      break;
    case 7uLL:
      break;
    default:
      __int16 v23 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        if (v10 < 8 && ((0xE3u >> v10) & 1) != 0)
        {
          id v24 = *(&off_1000EAA40 + v10);
        }
        else
        {
          id v24 = +[NSString stringWithFormat:@"Unknown intent value %lu", v10];
        }
        *(_DWORD *)buf = 136315394;
        unint64_t v34 = "-[IXSCoordinatedAppInstall _onQueue_cancelPlaceholderIfNeededForReason:client:needsLSDatabaseSync:]";
        __int16 v35 = 2112;
        uint64_t v36 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Unexpected intent: %@", buf, 0x16u);
      }
      break;
  }
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  unint64_t v11 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_not_V2(v11);

  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  int64_t v12 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100056D80;
  v15[3] = &unk_1000EA850;
  v15[4] = self;
  id v16 = v10;
  unint64_t v17 = &v21;
  unint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  id v13 = v10;
  dispatch_sync(v12, v15);

  LOBYTE(a5) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return (char)a5;
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  return [(IXSCoordinatedAppInstall *)self cancelForReason:a3 client:a4 needsLSDatabaseSync:0 error:a5];
}

- (id)_onQueue_localizedAppName
{
  id v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSCoordinatedAppInstall *)self identity];
  BOOL v5 = [v4 bundleID];

  id v11 = 0;
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:1 error:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = [v6 localizedName];
  }
  else
  {
    BOOL v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v13 = "-[IXSCoordinatedAppInstall _onQueue_localizedAppName]";
      __int16 v14 = 2112;
      unint64_t v15 = v5;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app record for bundleID %@ due to %@", buf, 0x20u);
    }

    id v8 = 0;
  }

  return v8;
}

- (BOOL)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6
{
  BOOL v9 = (IXSCoordinatedAppInstall *)a3;
  id v10 = v9;
  id v11 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v11);

  unint64_t v12 = [(IXSCoordinatedAppInstall *)self savedRemovability];
  id v13 = [(IXSCoordinatedAppInstall *)self seed];
  id v14 = [v13 intent];

  if (!v9)
  {
    uint64_t v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100094710();
    }

    sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]", 4847, @"IXErrorDomain", 0x35uLL, 0, 0, @"Reason passed to -[IXSCoordinatedAppInstall cancelForReason:] was nil", v24, v80);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v22 = 0;
    uint64_t v21 = 0;
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    unint64_t v18 = 0;
    unsigned int v25 = 0;
    if (a6)
    {
      id v17 = v17;
      *a6 = v17;
    }
    goto LABEL_58;
  }
  unint64_t v85 = (unint64_t)v14;
  unint64_t v15 = [(IXSCoordinatedAppInstall *)self error];

  if (!v15)
  {
    id v26 = sub_10000AC14(v9);
    char v27 = v26;
    id v28 = v9;
    if (v26)
    {
      id v28 = v26;
    }
    v83 = v27;
    char v29 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForClientID(a4);
      id v30 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      __int16 v99 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
      __int16 v100 = 2112;
      uint64_t v101 = self;
      __int16 v102 = 2112;
      v103 = v30;
      __int16 v104 = 2112;
      char v105 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: %@ : canceled by client %@ for reason %@", buf, 0x2Au);
    }
    if (v12)
    {
      id v31 = +[IXSAppRemovabilityManager sharedInstance];
      char v32 = [(IXSCoordinatedAppInstall *)self identity];
      id v96 = 0;
      unsigned __int8 v33 = objc_msgSend(v31, "setRemovability:forAppWithIdentity:byClient:error:", v12, v32, -[IXSCoordinatedAppInstall savedRemovabilityClient](self, "savedRemovabilityClient"), &v96);
      unint64_t v34 = (IXSCoordinatedAppInstall *)v96;

      if ((v33 & 1) == 0)
      {
        __int16 v35 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [(IXSCoordinatedAppInstall *)self identity];
          BOOL v37 = [v36 bundleID];
          IXStringForAppRemovability(v12);
          id v38 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          __int16 v99 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
          __int16 v100 = 2112;
          uint64_t v101 = v37;
          __int16 v102 = 2112;
          v103 = v38;
          __int16 v104 = 2112;
          char v105 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: Failed to restore removability for %@ to %@ with error: %@", buf, 0x2Au);
        }
      }
    }
    uint64_t v84 = [(IXSCoordinatedAppInstall *)self _onQueue_localizedAppName];
    id v39 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];

    if (v39)
    {
      id v40 = [(IXSCoordinatedAppInstall *)self assertionRetryTimer];
      dispatch_source_cancel(v40);

      [(IXSCoordinatedAppInstall *)self setAssertionRetryTimer:0];
    }
    [(IXSCoordinatedAppInstall *)self _onQueue_cancelProgress];
    [(IXSCoordinatedAppInstall *)self _onQueue_cancelPlaceholderIfNeededForReason:v28 client:a4 needsLSDatabaseSync:a5];
    id v41 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      long long v42 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315394;
      __int16 v99 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
      __int16 v100 = 2112;
      uint64_t v101 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: %@: Waiting for pending installs to complete", buf, 0x16u);
    }
    long long v43 = [(IXSCoordinatedAppInstall *)self outstandingInstallOperationsGroup];
    dispatch_group_wait(v43, 0xFFFFFFFFFFFFFFFFLL);

    long long v44 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      long long v45 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315394;
      __int16 v99 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
      __int16 v100 = 2112;
      uint64_t v101 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: %@: Pending installs completed on group", buf, 0x16u);
    }
    [(IXSCoordinatedAppInstall *)self setError:v28];
    [(IXSCoordinatedAppInstall *)self setErrorSourceIdentifier:a4];
    [(IXSCoordinatedAppInstall *)self setPlaceholderInstallState:5];
    [(IXSCoordinatedAppInstall *)self setAppInstallState:5];
    [(IXSCoordinatedAppInstall *)self setPostProcessingAssertionState:5];
    [(IXSCoordinatedAppInstall *)self setAppInstallPowerAssertion:0];
    [(IXSCoordinatedAppInstall *)self setTermAssertion:0];
    long long v46 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
    sub_100051EEC(v46, v28, a4);

    long long v47 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
    sub_100051EEC(v47, v28, a4);

    long long v48 = [(IXSCoordinatedAppInstall *)self userDataPromise];
    sub_100051EEC(v48, v28, a4);

    long long v49 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromise];
    sub_100051EEC(v49, v28, a4);

    long long v50 = [(IXSCoordinatedAppInstall *)self preparationPromise];
    sub_100051EEC(v50, v28, a4);

    long long v51 = [(IXSCoordinatedAppInstall *)self installOptionsPromise];
    sub_100051EEC(v51, v28, a4);

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v52 = [(IXSCoordinatedAppInstall *)self initialODRAssetPromises];
    id v53 = [v52 countByEnumeratingWithState:&v92 objects:v97 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v93;
      do
      {
        for (i = 0; i != v54; i = (char *)i + 1)
        {
          if (*(void *)v93 != v55) {
            objc_enumerationMutation(v52);
          }
          sub_100051EEC(*(void **)(*((void *)&v92 + 1) + 8 * i), v28, a4);
        }
        id v54 = [v52 countByEnumeratingWithState:&v92 objects:v97 count:16];
      }
      while (v54);
    }

    if (v85 >= 8)
    {
      id v57 = +[NSString stringWithFormat:@"Unknown intent value %lu", v85];
    }
    else
    {
      id v57 = *(&off_1000EAC40 + v85);
    }
    __int16 v58 = IXStringForClientID(a4);
    uint64_t v19 = +[NSString stringWithFormat:@"Canceled coordinator with intent %@ by client %@ for reason %@", v57, v58, v28];

    if (v85 - 1 > 6) {
      uint64_t v59 = 17;
    }
    else {
      uint64_t v59 = qword_1000AAFD0[v85 - 1];
    }
    id v60 = [(IXSCoordinatedAppInstall *)self identity];
    id v61 = [v60 bundleID];
    +[AITransactionLog logStep:v59 byParty:4 phase:2 success:0 forBundleID:v61 description:v19];

    [(IXSCoordinatedAppInstall *)self _onQueue_unregister];
    long long v62 = [(IXSCoordinatedAppInstall *)v28 domain];
    unsigned int v63 = [v62 isEqualToString:@"IXUserPresentableErrorDomain"];

    id v82 = v9;
    if (v63)
    {
      long long v64 = +[IXSErrorPresenter sharedPresenter];
      long long v65 = (void *)v84;
      if (!v84)
      {
        id v81 = [(IXSCoordinatedAppInstall *)self identity];
        long long v65 = [v81 bundleID];
      }
      id v90 = 0;
      id v91 = 0;
      unsigned int v66 = [v64 localizedErrorForAppName:v65 unlocalizedError:v28 localizedError:&v91 withError:&v90];
      uint64_t v21 = (IXSCoordinatedAppInstall *)v91;
      __int16 v22 = (IXSCoordinatedAppInstall *)v90;
      if (!v84)
      {
      }
      if (v66)
      {
        uint64_t v21 = v21;
        long long v67 = v28;
        id v28 = v21;
        BOOL v9 = v82;
      }
      else
      {
        long long v68 = sub_100004B28((uint64_t)off_100109BB8);
        BOOL v9 = v82;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v99 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
          __int16 v100 = 2112;
          uint64_t v101 = v22;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%s: Failed to create a localized cancel reason, proceeding with calling out to delegates with the un-localized reason : %@", buf, 0x16u);
        }

        long long v67 = v22;
        __int16 v22 = 0;
      }
    }
    else
    {
      __int16 v22 = 0;
      uint64_t v21 = 0;
    }
    long long v69 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_100057AA0;
    v87[3] = &unk_1000E9738;
    void v87[4] = self;
    unsigned int v25 = v28;
    id v88 = v25;
    unint64_t v89 = a4;
    sub_100066F24(v69, v87);

    [(IXSCoordinatedAppInstall *)self setComplete:1];
    id v70 = [(IXSCoordinatedAppInstall *)v25 domain];
    unsigned int v71 = [v70 isEqualToString:@"IXUserPresentableErrorDomain"];

    if (v71)
    {
      id v72 = [(IXSCoordinatedAppInstall *)v25 userInfo];
      id v73 = [v72 objectForKeyedSubscript:NSUnderlyingErrorKey];

      v74 = [(IXSCoordinatedAppInstall *)v25 userInfo];
      id v75 = [v74 objectForKeyedSubscript:@"AlertUser"];
      unsigned int v76 = sub_100082F48(v75, 0);

      if (v76)
      {
        v77 = +[IXSErrorPresenter sharedPresenter];
        id v78 = [(IXSCoordinatedAppInstall *)self identity];
        objc_msgSend(v77, "presentErrorForIdentity:code:underlyingError:errorSource:", v78, -[IXSCoordinatedAppInstall code](v25, "code"), v73, a4);
      }
      id v17 = 0;
      unint64_t v18 = (void *)v84;
      BOOL v9 = v82;
      uint64_t v20 = v83;
    }
    else
    {
      id v17 = 0;
      uint64_t v20 = v83;
      unint64_t v18 = (void *)v84;
    }
LABEL_58:
    id v10 = v25;
    goto LABEL_59;
  }
  __int16 v16 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v99 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
    __int16 v100 = 2112;
    uint64_t v101 = v9;
    __int16 v102 = 2112;
    v103 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Ignoring cancel request with reason %@ for coordinator that was already canceled: %@", buf, 0x20u);
  }

  id v17 = 0;
  unint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __int16 v22 = 0;
LABEL_59:

  return v9 != 0;
}

- (void)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4
{
}

- (void)_onQueue_internal_saveState
{
  id v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:self forKey:NSKeyedArchiveRootObjectKey];
  BOOL v5 = [v4 encodedData];

  id v6 = +[IXSCoordinatorManager savePathForCoordinator:self];
  id v11 = 0;
  unsigned __int8 v7 = [v5 writeToURL:v6 options:268435457 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    BOOL v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 path];
      *(_DWORD *)buf = 136315906;
      id v13 = "-[IXSCoordinatedAppInstall _onQueue_internal_saveState]";
      __int16 v14 = 2112;
      unint64_t v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to write coordinator %@ to disk at %@: %@", buf, 0x2Au);
    }
  }
}

- (void)_onQueue_saveState
{
  id v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if ([(IXSCoordinatedAppInstall *)self isTracked])
  {
    [(IXSCoordinatedAppInstall *)self _onQueue_internal_saveState];
  }
  else
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXSCoordinatedAppInstall _onQueue_saveState]";
      __int16 v7 = 2112;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Not saving %@ because it's not tracked", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (BOOL)isTracked
{
  v2 = self;
  p_externalPropertyLock = &self->_externalPropertyLock;
  os_unfair_lock_lock(&self->_externalPropertyLock);
  LOBYTE(v2) = v2->_isTracked;
  os_unfair_lock_unlock(p_externalPropertyLock);
  return (char)v2;
}

- (void)setIsTracked:(BOOL)a3
{
  if (a3)
  {
    p_externalPropertyLock = &self->_externalPropertyLock;
    os_unfair_lock_lock(&self->_externalPropertyLock);
  }
  else
  {
    id v6 = +[IXSCoordinatorManager savePathForCoordinator:self];
    p_externalPropertyLock = &self->_externalPropertyLock;
    os_unfair_lock_lock(&self->_externalPropertyLock);
    __int16 v7 = +[IXFileManager defaultManager];
    id v12 = 0;
    unsigned __int8 v8 = [v7 removeItemAtURL:v6 error:&v12];
    id v9 = v12;

    if ((v8 & 1) == 0)
    {
      id v10 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v6 path];
        *(_DWORD *)buf = 136315906;
        __int16 v14 = "-[IXSCoordinatedAppInstall setIsTracked:]";
        __int16 v15 = 2112;
        __int16 v16 = self;
        __int16 v17 = 2112;
        __int16 v18 = v11;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to remove saved coordinator %@ at %@ : %@", buf, 0x2Au);
      }
    }
  }
  self->_isTracked = a3;
  os_unfair_lock_unlock(p_externalPropertyLock);
}

- (void)_updatePendingOperationsForChangeFromPreviousState:(unint64_t)a3 toNewState:(unint64_t)a4
{
  if (a3 || !sub_100058138(a4))
  {
    if (!sub_100058138(a3) || (sub_100058138(a4) & 1) != 0) {
      return;
    }
    id v8 = +[IXSPendingOperationsTracker sharedInstance];
    __int16 v7 = [(IXSCoordinatedAppInstall *)self identity];
    [v8 endPendingOperationForIdentity:v7];
  }
  else
  {
    id v8 = +[IXSPendingOperationsTracker sharedInstance];
    __int16 v7 = [(IXSCoordinatedAppInstall *)self identity];
    [v8 beginPendingOperationForIdentity:v7];
  }
}

- (void)setPlaceholderInstallState:(unint64_t)a3
{
}

- (void)setPlaceholderInstallState:(unint64_t)a3 withLSRecordPromiseForCompletion:(id)a4
{
  id v6 = a4;
  __int16 v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  unint64_t placeholderInstallState = self->_placeholderInstallState;
  if (placeholderInstallState != a3)
  {
    self->_unint64_t placeholderInstallState = a3;
    [(IXSCoordinatedAppInstall *)self _updatePendingOperationsForChangeFromPreviousState:placeholderInstallState toNewState:a3];
    if (a3 == 4)
    {
      id v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v16 = "-[IXSCoordinatedAppInstall setPlaceholderInstallState:withLSRecordPromiseForCompletion:]";
        __int16 v17 = 2112;
        __int16 v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: Placeholder install completed.", buf, 0x16u);
      }

      [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
      if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] != (id)6
        && (id)[(IXSCoordinatedAppInstall *)self effectiveIntent] != (id)7)
      {
        [(IXSCoordinatedAppInstall *)self _onQueue_updateLoadingProgress];
      }
      id v10 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100058468;
      v13[3] = &unk_1000E8E08;
      v13[4] = self;
      id v14 = v6;
      sub_100066F24(v10, v13);

      if (![(IXSCoordinatedAppInstall *)self sentBeginRestoringUserData]
        && [(IXSCoordinatedAppInstall *)self shouldBeginRestoringUserData])
      {
        [(IXSCoordinatedAppInstall *)self setSentBeginRestoringUserData:1];
        id v11 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000584C0;
        v12[3] = &unk_1000E8FA8;
        v12[4] = self;
        sub_100066F24(v11, v12);
      }
    }
  }
}

- (void)setAppInstallState:(unint64_t)a3
{
  int v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_appInstallState != a3)
  {
    self->_uint64_t appInstallState = a3;
    -[IXSCoordinatedAppInstall _updatePendingOperationsForChangeFromPreviousState:toNewState:](self, "_updatePendingOperationsForChangeFromPreviousState:toNewState:");
  }
}

- (id)promiseStateDescription
{
  id v3 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
  int v4 = sub_1000586C0(v3, 80, 112, 48);

  int v5 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
  LODWORD(v3) = sub_1000586C0(v5, 65, 97, 49);

  id v6 = [(IXSCoordinatedAppInstall *)self userDataPromise];
  int v7 = sub_1000586C0(v6, 85, 117, 50);

  id v8 = [(IXSCoordinatedAppInstall *)self installOptionsPromise];
  int v9 = sub_1000586C0(v8, 73, 105, 51);

  id v10 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromise];
  LODWORD(v8) = sub_1000586C0(v10, 83, 115, 52);

  return +[NSString stringWithFormat:@"%c%c%c%c%c", v4, (int)v3, v7, v9, (int)v8];
}

- (NSString)description
{
  id v3 = [(IXSCoordinatedAppInstall *)self originalIntent];
  if (v3 == (void *)[(IXSCoordinatedAppInstall *)self effectiveIntent])
  {
    unint64_t v4 = [(IXSCoordinatedAppInstall *)self originalIntent];
    if (v4 >= 8)
    {
      int v5 = +[NSString stringWithFormat:@"Unknown intent value %lu", v4];
    }
    else
    {
      int v5 = *(&off_1000EAC40 + v4);
    }
  }
  else
  {
    unint64_t v6 = [(IXSCoordinatedAppInstall *)self originalIntent];
    if (v6 >= 8)
    {
      int v7 = +[NSString stringWithFormat:@"Unknown intent value %lu", v6];
    }
    else
    {
      int v7 = *(&off_1000EAC40 + v6);
    }
    unint64_t v8 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
    if (v8 >= 8)
    {
      int v9 = +[NSString stringWithFormat:@"Unknown intent value %lu", v8];
    }
    else
    {
      int v9 = *(&off_1000EAC40 + v8);
    }
    uint64_t v10 = +[NSString stringWithFormat:@"%@/%@", v7, v9];

    int v5 = (void *)v10;
  }
  int coordinatorScope = self->_coordinatorScope;
  if (coordinatorScope == 2)
  {
    id v14 = @"[G]";
  }
  else if (coordinatorScope == 1)
  {
    id v12 = [(IXSCoordinatedAppInstall *)self scopedToConnection];
    id v13 = [v12 clientName];
    +[NSString stringWithFormat:@"[P=%@]", v13];
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NSString stringWithFormat:@"[U=%hhu]", self->_coordinatorScope];
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v15 = [(IXSCoordinatedAppInstall *)self appAssetPromiseDRI];
  unint64_t v16 = [(IXSCoordinatedAppInstall *)self creator];
  __int16 v17 = (objc_class *)objc_opt_class();
  __int16 v18 = NSStringFromClass(v17);
  __int16 v19 = [(IXSCoordinatedAppInstall *)self identity];
  id v20 = [(IXSCoordinatedAppInstall *)self uniqueIdentifier];
  uint64_t v21 = IXStringForClientID([(IXSCoordinatedAppInstall *)self creator]);
  if (v15 == v16)
  {
    __int16 v22 = IXStringForCoordinatorImportance(self->_importance);
    unint64_t v23 = [(IXSCoordinatedAppInstall *)self state];
    if (v23 > 0x1C) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = (uint64_t)*(&off_1000EAA98 + v23);
    }
    id v26 = [(IXSCoordinatedAppInstall *)self promiseStateDescription];
    char v29 = +[NSString stringWithFormat:@"<%@<%p> %@ identifier:%@ uuid:%@ intent:%@ creator/appDRI:%@ importance:%@ state:%@ promise-state:%@>", v18, self, v14, v19, v20, v5, v21, v22, v24, v26];
  }
  else
  {
    unint64_t v34 = v14;
    unsigned int v25 = v5;
    __int16 v22 = IXStringForClientID([(IXSCoordinatedAppInstall *)self appAssetPromiseDRI]);
    id v26 = IXStringForCoordinatorImportance(self->_importance);
    unint64_t v27 = [(IXSCoordinatedAppInstall *)self state];
    if (v27 > 0x1C) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = (uint64_t)*(&off_1000EAA98 + v27);
    }
    id v30 = [(IXSCoordinatedAppInstall *)self promiseStateDescription];
    uint64_t v33 = v28;
    char v32 = v25;
    int v5 = v25;
    id v14 = v34;
    char v29 = +[NSString stringWithFormat:@"<%@<%p> %@ identifier:%@ uuid:%@ intent:%@ creator:%@ appDRI:%@ importance:%@ state:%@ promise-state:%@>", v18, self, v34, v19, v20, v32, v21, v22, v26, v33, v30];
  }

  return (NSString *)v29;
}

- (IXApplicationIdentity)identity
{
  v2 = [(IXSCoordinatedAppInstall *)self seed];
  id v3 = [v2 identity];

  return (IXApplicationIdentity *)v3;
}

- (unint64_t)installationDomain
{
  v2 = [(IXSCoordinatedAppInstall *)self seed];
  id v3 = [v2 installationDomain];

  return (unint64_t)v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(IXSCoordinatedAppInstall *)self seed];
  id v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (unint64_t)creator
{
  v2 = [(IXSCoordinatedAppInstall *)self seed];
  id v3 = [v2 creator];

  return (unint64_t)v3;
}

- (unint64_t)originalIntent
{
  v2 = [(IXSCoordinatedAppInstall *)self seed];
  id v3 = [v2 intent];

  return (unint64_t)v3;
}

- (unint64_t)effectiveIntent
{
  return self->_effectiveIntent;
}

- (void)setEffectiveIntent:(unint64_t)a3
{
  int v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_effectiveIntent = a3;
}

- (unsigned)coordinatorScope
{
  v2 = self;
  p_externalPropertyLock = &self->_externalPropertyLock;
  os_unfair_lock_lock(&self->_externalPropertyLock);
  LOBYTE(v2) = v2->_coordinatorScope;
  os_unfair_lock_unlock(p_externalPropertyLock);
  return v2;
}

- (void)setCoordinatorScope:(unsigned __int8)a3
{
  int v3 = a3;
  int v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock(&self->_externalPropertyLock);
  if (self->_coordinatorScope == v3)
  {
    os_unfair_lock_unlock(&self->_externalPropertyLock);
  }
  else
  {
    self->_int coordinatorScope = v3;
    os_unfair_lock_unlock(&self->_externalPropertyLock);
    [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  }
}

- (IXSClientConnection)scopedToConnection
{
  p_externalPropertyLock = &self->_externalPropertyLock;
  os_unfair_lock_lock(&self->_externalPropertyLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scopedToConnection);
  os_unfair_lock_unlock(p_externalPropertyLock);

  return (IXSClientConnection *)WeakRetained;
}

- (void)setScopedToConnection:(id)a3
{
  p_externalPropertyLock = &self->_externalPropertyLock;
  id v5 = a3;
  os_unfair_lock_lock(p_externalPropertyLock);
  objc_storeWeak((id *)&self->_scopedToConnection, v5);

  os_unfair_lock_unlock(p_externalPropertyLock);
}

- (NSSet)promiseUUIDs
{
  int v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_not_V2(v3);

  unint64_t v4 = objc_opt_new();
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100058F6C;
  id v12 = &unk_1000E8E08;
  id v13 = self;
  id v14 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v9);

  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return (NSSet *)v7;
}

- (IXProgressHint)progressHintWithDefault
{
  int v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = self->_progressHint;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    unsigned int v6 = [(IXSCoordinatedAppInstall *)self needsPostProcessing];
    if (v6) {
      id v7 = &off_1000F4C10;
    }
    else {
      id v7 = &off_1000F4C40;
    }
    if (v6) {
      unint64_t v8 = &off_1000F4C28;
    }
    else {
      unint64_t v8 = &off_1000F4C58;
    }
    int v9 = objc_opt_new();
    id v14 = 0;
    unsigned __int8 v10 = [v9 setPhaseProportionsForLoadingPhase:&off_1000F4BF8 installingPhase:v7 postProcessingPhase:v8 error:&v14];
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      id v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v16 = "-[IXSCoordinatedAppInstall progressHintWithDefault]";
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to set default installation phase proportions: %@", buf, 0x16u);
      }
    }
    id v5 = v9;
  }

  return v5;
}

- (IXProgressHint)progressHint
{
  int v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  progressHint = self->_progressHint;

  return progressHint;
}

- (void)setProgressHint:(id)a3
{
  unint64_t v4 = (IXProgressHint *)a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "-[IXSCoordinatedAppInstall setProgressHint:]";
    __int16 v10 = 2112;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: setting progress hint to %@", (uint8_t *)&v8, 0x20u);
  }

  progressHint = self->_progressHint;
  self->_progressHint = v4;
}

- (BOOL)currentProgressPhaseIsComplete
{
  int v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_currentProgressPhaseIsComplete;
}

- (void)setCurrentProgressPhaseIsComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_currentProgressPhaseIsComplete = v3;
  if (v3)
  {
    cachedCurrentPhaseProgress = self->_cachedCurrentPhaseProgress;
    self->_cachedCurrentPhaseProgress = 0;
  }
}

- (void)_pauseProgressObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100059CFC;
    v6[3] = &unk_1000E8FA8;
    id v7 = v4;
    [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"Pause progress" onLaunchServicesQueue:v6];
  }
}

- (void)_onQueue_pauseProgress
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059DCC;
  v4[3] = &unk_1000EA878;
  v4[4] = self;
  [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressAndRun:v4];
}

- (void)_onQueue_resumeProgress
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressAndRun:&stru_1000EA8B8];
}

- (void)_onQueue_cancelProgress:(id)a3
{
  id v6 = a3;
  id v4 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  if (v6)
  {
    [v6 setInstallState:4];
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 installPhaseFinishedForProgress:v6];
  }
  [(IXSCoordinatedAppInstall *)self setCoordinatorProgress:0];
  [(IXSCoordinatedAppInstall *)self setCurrentProgressPhaseIsComplete:1];
}

- (void)_onQueue_cancelProgress
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059FB0;
  v4[3] = &unk_1000EA878;
  v4[4] = self;
  [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressAndRun:v4];
}

- (void)_onQueue_finishProgress:(id)a3
{
  id v9 = a3;
  id v4 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  if (v9)
  {
    [v9 setInstallState:5];
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 installPhaseFinishedForProgress:v9];
  }
  id v6 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
  [v6 finishPostProcessing];

  id v7 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
  [v7 finishInstalling];

  int v8 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
  [v8 finishLoading];

  [(IXSCoordinatedAppInstall *)self setCurrentProgressPhaseIsComplete:1];
}

- (void)_onQueue_finishProgress
{
  BOOL v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005A130;
  v4[3] = &unk_1000EA878;
  v4[4] = self;
  [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressAndRun:v4];
}

- (void)_onQueue_fetchProgressAndRun:(id)a3
{
  id v6 = a3;
  id v4 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v4);

  if ([(IXSCoordinatedAppInstall *)self needsPostProcessing]
    && [(IXSCoordinatedAppInstall *)self sentBeginPostProcessing])
  {
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressForPhase:v5 andRun:v6];
}

- (void)_onQueue_fetchProgressForPhase:(unint64_t)a3 andRun:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if ([(IXSCoordinatedAppInstall *)self currentProgressPhaseIsComplete])
  {
    v6[2](v6, 0);
    goto LABEL_8;
  }
  int v8 = [(IXSCoordinatedAppInstall *)self cachedCurrentPhaseProgress];

  if (v8)
  {
    id v9 = [(IXSCoordinatedAppInstall *)self cachedCurrentPhaseProgress];
    ((void (**)(id, void *))v6)[2](v6, v9);
LABEL_7:

    goto LABEL_8;
  }
  __int16 v10 = [(IXSCoordinatedAppInstall *)self pendingProgressRequests];

  if (v10)
  {
    id v9 = [(IXSCoordinatedAppInstall *)self pendingProgressRequests];
    id v11 = objc_retainBlock(v6);
    [v9 addObject:v11];

    goto LABEL_7;
  }
  __int16 v12 = objc_opt_new();
  [(IXSCoordinatedAppInstall *)self setPendingProgressRequests:v12];

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)5)
  {
    v24[3] = 10;
  }
  else
  {
    id v13 = [(IXSCoordinatedAppInstall *)self placeholderPromise];

    if (v13)
    {
      id v14 = [(IXSCoordinatedAppInstall *)self placeholderPromise];
      unint64_t v15 = [v14 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005A47C;
      block[3] = &unk_1000E90A8;
      void block[4] = self;
      void block[5] = &v23;
      dispatch_sync(v15, block);
    }
  }
  [(IXSCoordinatedAppInstall *)self progressHintWithDefault];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005A4D8;
  v17[3] = &unk_1000EA8E0;
  void v17[4] = self;
  id v20 = &v23;
  unint64_t v21 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v16;
  __int16 v19 = v6;
  [(IXSCoordinatedAppInstall *)self _runAsyncBlockWithDescription:@"Initiate and fetch progress" onLaunchServicesQueue:v17];

  _Block_object_dispose(&v23, 8);
LABEL_8:
}

- (void)_runWithProgress:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005A6F8;
  v11[3] = &unk_1000EA908;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100066F24(v8, v11);
}

- (void)_limitedConcurrency_setUpLSProgressForInstallType:(unint64_t)a3 progressHint:(id)a4
{
  id v6 = a4;
  id v7 = [(IXSCoordinatedAppInstall *)self identity];
  int v8 = [v7 bundleID];

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  [v9 initiateProgressForApp:v8 withType:a3];
  id v10 = [v6 progressProportionsDictionaryForLaunchServices];

  id v15 = 0;
  unsigned __int8 v11 = [v9 setProgressProportionsByPhase:v10 forInstallOfApplicationWithIdentifier:v8 error:&v15];
  id v12 = v15;
  id v13 = sub_100004B28((uint64_t)off_100109BB8);
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[IXSCoordinatedAppInstall _limitedConcurrency_setUpLSProgressForInstallType:progressHint:]";
      __int16 v18 = 2112;
      __int16 v19 = self;
      __int16 v20 = 2112;
      unint64_t v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: %@: Set progress proportions to %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "-[IXSCoordinatedAppInstall _limitedConcurrency_setUpLSProgressForInstallType:progressHint:]";
    __int16 v18 = 2112;
    __int16 v19 = v8;
    __int16 v20 = 2112;
    unint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to set install phase progress proportions on LS for bundleID %@ to %@: %@", buf, 0x2Au);
  }
}

- (id)_limitedConcurrency_fetchLSProgressForPhase:(unint64_t)a3 appRecord:(id)a4
{
  uint64_t v5 = [a4 compatibilityObject];
  id v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v7 = [v6 installProgressForApplication:v5 withPhase:a3];

  if (v7)
  {
    [v7 setInstallState:1];
    id v8 = v7;
  }
  else
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100094830();
    }
  }

  return v7;
}

- (void)_limitedConcurrency_saveOriginalInstallTypeForAppRecord:(id)a3
{
  id v4 = [a3 installType];
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005ABD0;
  v6[3] = &unk_1000E8D28;
  void v6[4] = self;
  v6[5] = v4;
  sub_100066F24(v5, v6);
}

- (void)_onQueue_configureTotalUnitCountsForInstallProgress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXSCoordinatedAppInstall *)self progressHintWithDefault];
  id v6 = [v5 progressProportionsDictionaryForLaunchServices];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005ACE0;
  v8[3] = &unk_1000EA930;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)_onQueue_setInstallProgressPercentComplete:(double)a3 forPhase:(unint64_t)a4
{
  id v6 = [(IXSCoordinatedAppInstall *)self publishedInstallProgress];
  objc_msgSend(v6, "setCompletedUnitCount:forPhase:", (unint64_t)((double)(unint64_t)objc_msgSend(v6, "totalUnitCountForPhase:", a4) * a3), a4);
}

- (void)_limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:(unint64_t)a3 progressHint:(id)a4 andRun:(id)a5
{
  id v8 = a4;
  id v15 = 0;
  id v9 = a5;
  unsigned __int8 v10 = [(IXSCoordinatedAppInstall *)self _placeholderOrParallelPlaceholderIsInstalledWithRecord:&v15];
  id v11 = v15;
  id v12 = sub_100004B28((uint64_t)off_100109BB8);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[IXSCoordinatedAppInstall _limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:progressHint:andRun:]";
      __int16 v18 = 2112;
      __int16 v19 = self;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@: initiating loading progress with install type %lu", buf, 0x20u);
    }

    [(IXSCoordinatedAppInstall *)self _limitedConcurrency_saveOriginalInstallTypeForAppRecord:v11];
    [(IXSCoordinatedAppInstall *)self _limitedConcurrency_setUpLSProgressForInstallType:a3 progressHint:v8];
    id v14 = [(IXSCoordinatedAppInstall *)self _limitedConcurrency_fetchLSProgressForPhase:0 appRecord:v11];
    [v14 setCancellable:1];
    [v14 setPausable:1];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000948F0(self);
    }

    id v14 = 0;
  }
  [(IXSCoordinatedAppInstall *)self _runWithProgress:v14 block:v9];
}

- (void)_onQueue_updateLoadingProgress
{
  v2 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v2);

  if ([(IXSCoordinatedAppInstall *)self currentProgressPhaseIsComplete])
  {
    BOOL v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Not updating loading progress because %@ has completed loading phase", buf, 0x16u);
    }
  }
  else if ([(IXSCoordinatedAppInstall *)self isPaused])
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    BOOL v3 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Not updating loading progress because %@ is paused", buf, 0x16u);

      BOOL v3 = v4;
    }
  }
  else
  {
    id v6 = [(IXSCoordinatedAppInstall *)self appAssetPromise];
    long long v64 = v6;
    id v7 = v6;
    if (v6)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      unint64_t v95 = 0;
      uint64_t v90 = 0;
      id v91 = (double *)&v90;
      uint64_t v92 = 0x2020000000;
      uint64_t v93 = 0;
      id v8 = [v6 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005BB08;
      block[3] = &unk_1000E9710;
      id v88 = buf;
      v87 = v7;
      unint64_t v89 = &v90;
      dispatch_sync(v8, block);

      unint64_t v9 = *((void *)v91 + 3);
      uint64_t v10 = v9 == 0;
      double v11 = *(double *)(*(void *)&buf[8] + 24);
      double v12 = v11 + 0.0;
      double v13 = v11 * (double)v9;
      if (v9) {
        double v14 = 0.0;
      }
      else {
        double v14 = v12;
      }
      if (v9) {
        unint64_t v15 = (unint64_t)v13;
      }
      else {
        unint64_t v15 = 0;
      }

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(buf, 8);
      uint64_t v66 = 1;
    }
    else
    {
      unint64_t v15 = 0;
      uint64_t v66 = 0;
      uint64_t v10 = 0;
      unint64_t v9 = 0;
      double v14 = 0.0;
    }
    id v16 = [(IXSCoordinatedAppInstall *)self userDataPromise];
    unsigned int v63 = v16;
    if (v16)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v95) = 0;
      uint64_t v90 = 0;
      id v91 = (double *)&v90;
      uint64_t v92 = 0x2020000000;
      uint64_t v93 = 0;
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x2020000000;
      uint64_t v85 = 0;
      __int16 v17 = [v16 accessQueue];
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10005BB50;
      v77[3] = &unk_1000EA958;
      id v79 = buf;
      id v78 = v63;
      uint64_t v80 = &v90;
      id v81 = &v82;
      dispatch_sync(v17, v77);

      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        BOOL v18 = v64 != 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18 || (id)[(IXSCoordinatedAppInstall *)self effectiveIntent] != (id)3)
      {
        unint64_t v21 = v83[3];
        double v22 = v91[3];
        unint64_t v23 = v15 + (unint64_t)(v22 * (double)v21);
        double v24 = v14 + v22;
        if (v21) {
          unint64_t v15 = v23;
        }
        else {
          double v14 = v24;
        }
        if (v21) {
          v9 += v21;
        }
        else {
          ++v10;
        }
        ++v66;
      }
      else
      {
        __int16 v19 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = [(IXSCoordinatedAppInstall *)self identity];
          *(_DWORD *)__int16 v99 = 136315394;
          __int16 v100 = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
          __int16 v101 = 2112;
          __int16 v102 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: %@: Not updating loading progress: user data promise is complete, but we have no app asset yet for this restoring coordinator.", v99, 0x16u);
        }
      }

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(buf, 8);
    }
    uint64_t v25 = [(IXSCoordinatedAppInstall *)self initialODRAssetPromises];
    BOOL v26 = [v25 count] == 0;

    if (!v26)
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id obj = [(IXSCoordinatedAppInstall *)self initialODRAssetPromises];
      id v27 = [obj countByEnumeratingWithState:&v73 objects:v98 count:16];
      if (v27)
      {
        uint64_t v68 = *(void *)v74;
        do
        {
          uint64_t v28 = 0;
          v66 += (uint64_t)v27;
          do
          {
            if (*(void *)v74 != v68) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = v10;
            unint64_t v30 = v15;
            unint64_t v31 = v9;
            char v32 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v28);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            unint64_t v95 = 0;
            uint64_t v90 = 0;
            id v91 = (double *)&v90;
            uint64_t v92 = 0x2020000000;
            uint64_t v93 = 0;
            uint64_t v33 = [v32 accessQueue];
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_10005BBAC;
            v72[3] = &unk_1000E9710;
            void v72[4] = v32;
            void v72[5] = buf;
            v72[6] = &v90;
            dispatch_sync(v33, v72);

            unint64_t v15 = v30;
            unint64_t v34 = *((void *)v91 + 3);
            double v35 = *(double *)(*(void *)&buf[8] + 24);
            double v36 = v35 * (double)v34;
            double v37 = v14 + v35;
            if (v34) {
              unint64_t v15 = v30 + (unint64_t)v36;
            }
            else {
              double v14 = v37;
            }
            if (v34) {
              uint64_t v10 = v29;
            }
            else {
              uint64_t v10 = v29 + 1;
            }
            if (v34) {
              unint64_t v9 = v34 + v31;
            }
            else {
              unint64_t v9 = v31;
            }
            _Block_object_dispose(&v90, 8);
            _Block_object_dispose(buf, 8);
            uint64_t v28 = (char *)v28 + 1;
          }
          while (v27 != v28);
          id v27 = [obj countByEnumeratingWithState:&v73 objects:v98 count:16];
        }
        while (v27);
      }
    }
    if (v10)
    {
      id v38 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        sub_1000949FC(self, v10, v38);
      }

      if (v9)
      {
        unint64_t v39 = v9 / (v66 - v10) * v10;
        v9 += v39;
        v15 += (unint64_t)(v14 / (double)(unint64_t)v10 * (double)v39);
      }
      else
      {
        id v40 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          sub_100094980();
        }

        unint64_t v9 = 100 * v10;
        unint64_t v15 = (unint64_t)(v14 / (double)(unint64_t)v10 * (double)(unint64_t)(100 * v10));
      }
    }
    id v41 = [(IXSCoordinatedAppInstall *)self preparationPromise];

    if (v41)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      unint64_t v95 = 0;
      long long v42 = [(IXSCoordinatedAppInstall *)self preparationPromise];
      long long v43 = [v42 accessQueue];
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_10005BBF4;
      v71[3] = &unk_1000E90A8;
      v71[4] = self;
      v71[5] = buf;
      dispatch_sync(v43, v71);

      unint64_t v44 = 100;
      if (v9) {
        unint64_t v44 = v9;
      }
      unint64_t v9 = v44 + (unint64_t)((double)v44 * 0.0299999993);
      v15 += (unint64_t)(*(double *)(*(void *)&buf[8] + 24)
                              * (double)(unint64_t)((double)v44 * 0.0299999993));
      uint64_t v45 = v66 + 1;
      _Block_object_dispose(buf, 8);
      long long v46 = self;
    }
    else
    {
      long long v46 = self;
      uint64_t v45 = v66;
    }
    uint64_t v47 = v45;
    BOOL v48 = v45 != 0;
    long long v49 = [(IXSCoordinatedAppInstall *)v46 coordinatorProgress];
    BOOL v50 = v49 == 0;

    if (v50)
    {
      long long v51 = [IXSCoordinatorProgress alloc];
      long long v52 = [(IXSCoordinatedAppInstall *)self identity];
      id v53 = [(IXSCoordinatedAppInstall *)self progressHintWithDefault];
      id v54 = [(IXSCoordinatorProgress *)v51 initForCoordinatorWithIdentity:v52 totalUnits:v9 progressHint:v53 needsPostProcessing:[(IXSCoordinatedAppInstall *)self needsPostProcessing] delegate:self];
      [(IXSCoordinatedAppInstall *)self setCoordinatorProgress:v54];
    }
    uint64_t v55 = [(IXSCoordinatedAppInstall *)self publishedInstallProgress];
    if (!v55)
    {
      if ((id)[(IXSCoordinatedAppInstall *)self placeholderInstallState] == (id)4)
      {
        id v56 = sub_10003D008();
        id v57 = [(IXSCoordinatedAppInstall *)self identity];
        uint64_t v55 = [v56 initiateProgressForIdentity:v57];

        if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)4)
        {
          [v55 setInstallPhase:2];
          uint64_t v58 = 2;
        }
        else
        {
          [v55 setInstallPhase:0];
          if ([(IXSCoordinatedAppInstall *)self needsPostProcessing]) {
            uint64_t v58 = 4;
          }
          else {
            uint64_t v58 = 1;
          }
        }
        [v55 setFinalPhase:v58];
        [(IXSCoordinatedAppInstall *)self _onQueue_configureTotalUnitCountsForInstallProgress:v55];
        [(IXSCoordinatedAppInstall *)self setPublishedInstallProgress:v55];
      }
      else
      {
        uint64_t v55 = 0;
      }
    }
    if (v47)
    {
      uint64_t v59 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        long long v62 = [(IXSCoordinatedAppInstall *)self identity];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v62;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v95 = v15;
        __int16 v96 = 2048;
        unint64_t v97 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%s: %@: Setting progress to %llu / %llu", buf, 0x2Au);
      }
      id v60 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
      [v60 setTotalUnits:v9];

      id v61 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
      [v61 setTotalUnitsCompleted:v15];

      [(IXSCoordinatedAppInstall *)self _onQueue_setInstallProgressPercentComplete:0 forPhase:(double)v15 / (double)v9];
    }
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10005BC50;
    v69[3] = &unk_1000EA980;
    BOOL v70 = v48;
    v69[4] = self;
    v69[5] = v9;
    v69[6] = v15;
    [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressForPhase:0 andRun:v69];

    BOOL v3 = v64;
  }
}

- (id)_limitedConcurrency_fetchInstallingProgress
{
  id v8 = 0;
  unsigned __int8 v3 = [(IXSCoordinatedAppInstall *)self _placeholderOrParallelPlaceholderIsInstalledWithRecord:&v8];
  id v4 = v8;
  if (v3)
  {
    uint64_t v5 = [(IXSCoordinatedAppInstall *)self _limitedConcurrency_fetchLSProgressForPhase:1 appRecord:v4];
    [v5 setCancellable:0];
    [v5 setPausable:0];
  }
  else
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100094B4C(self);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_limitedConcurrency_fetchPostProcessingProgressAndRun:(id)a3
{
  id v9 = 0;
  id v4 = a3;
  unsigned __int8 v5 = [(IXSCoordinatedAppInstall *)self _placeholderOrParallelPlaceholderIsInstalledWithRecord:&v9];
  id v6 = v9;
  if (v5)
  {
    id v7 = [(IXSCoordinatedAppInstall *)self _limitedConcurrency_fetchLSProgressForPhase:4 appRecord:v6];
    [v7 setCancellable:1];
    [v7 setPausable:1];
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100094BDC(self);
    }

    id v7 = 0;
  }
  [(IXSCoordinatedAppInstall *)self _runWithProgress:v7 block:v4];
}

- (void)_onQueue_updatePostProcessingProgress
{
  v2 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v2);

  if ([(IXSCoordinatedAppInstall *)self currentProgressPhaseIsComplete])
  {
    unsigned __int8 v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updatePostProcessingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Not updating post processing progress because %@ has completed post processing phase", buf, 0x16u);
    }
  }
  else if ([(IXSCoordinatedAppInstall *)self isPaused])
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    unsigned __int8 v3 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v5 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updatePostProcessingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Not updating post processing progress because %@ is paused", buf, 0x16u);

      unsigned __int8 v3 = v4;
    }
  }
  else
  {
    [(IXSCoordinatedAppInstall *)self essentialAssetPromises];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    if (v6)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          unint64_t v32 = 0;
          uint64_t v23 = 0;
          double v24 = &v23;
          uint64_t v25 = 0x2020000000;
          uint64_t v26 = 0;
          double v12 = [v11 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10005C414;
          block[3] = &unk_1000E9710;
          void block[4] = v11;
          void block[5] = buf;
          void block[6] = &v23;
          dispatch_sync(v12, block);

          unint64_t v13 = v24[3];
          v8 += v13;
          v7 += (unint64_t)(*(double *)(*(void *)&buf[8] + 24) * (double)v13);
          _Block_object_dispose(&v23, 8);
          _Block_object_dispose(buf, 8);
        }
        id v6 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v6);
    }

    if (v8 >= v7) {
      unint64_t v14 = v7;
    }
    else {
      unint64_t v14 = v8;
    }
    unint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      BOOL v18 = [(IXSCoordinatedAppInstall *)self identity];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updatePostProcessingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2048;
      unint64_t v32 = v14;
      __int16 v33 = 2048;
      unint64_t v34 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s: %@: Setting post processing progress to %llu / %llu", buf, 0x2Au);
    }
    id v16 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
    [v16 setTotalUnits:v8];

    __int16 v17 = [(IXSCoordinatedAppInstall *)self coordinatorProgress];
    [v17 setTotalUnitsCompleted:v14];

    [(IXSCoordinatedAppInstall *)self _onQueue_setInstallProgressPercentComplete:4 forPhase:(double)v14 / (double)v8];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005C45C;
    v21[3] = &unk_1000EA9A8;
    v21[4] = self;
    v21[5] = v8;
    v21[6] = v14;
    [(IXSCoordinatedAppInstall *)self _onQueue_fetchProgressForPhase:2 andRun:v21];
    unsigned __int8 v3 = obj;
  }
}

- (void)didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5
{
  uint64_t v9 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005C5A8;
  v10[3] = &unk_1000EA9D0;
  v10[4] = self;
  *(double *)&void v10[5] = a3;
  v10[6] = a4;
  *(double *)&v10[7] = a5;
  sub_100066F24(v9, v10);
}

- (unint64_t)transactionStepForPromise:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self placeholderPromise];

  if (v5 == v4)
  {
    unint64_t v12 = 8;
  }
  else
  {
    id v6 = [(IXSCoordinatedAppInstall *)self appAssetPromise];

    if (v6 == v4)
    {
      unint64_t v12 = 9;
    }
    else
    {
      id v7 = [(IXSCoordinatedAppInstall *)self userDataPromise];

      if (v7 == v4)
      {
        unint64_t v12 = 11;
      }
      else
      {
        id v8 = [(IXSCoordinatedAppInstall *)self deviceSecurityPromise];

        if (v8 == v4)
        {
          unint64_t v12 = 13;
        }
        else
        {
          id v9 = [(IXSCoordinatedAppInstall *)self preparationPromise];

          if (v9 == v4)
          {
            unint64_t v12 = 14;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ([(IXSCoordinatedAppInstall *)self initialODRAssetPromises],
                  uint64_t v10 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v11 = [v10 containsObject:v4],
                  v10,
                  (v11 & 1) != 0))
            {
              unint64_t v12 = 10;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([(IXSCoordinatedAppInstall *)self essentialAssetPromises],
                    unint64_t v13 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v14 = [v13 containsObject:v4],
                    v13,
                    (v14 & 1) != 0))
              {
                unint64_t v12 = 16;
              }
              else
              {
                id v15 = [(IXSCoordinatedAppInstall *)self installOptionsPromise];

                if (v15 == v4) {
                  unint64_t v12 = 12;
                }
                else {
                  unint64_t v12 = 17;
                }
              }
            }
          }
        }
      }
    }
  }

  return v12;
}

- (void)promiseDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C864;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100066F24(v5, v7);
}

- (void)promiseDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unsigned __int8 v11 = "-[IXSCoordinatedAppInstall promiseDidComplete:]";
    __int16 v12 = 2112;
    unint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@ : Promise completed: %@", buf, 0x20u);
  }

  id v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005CE88;
  v8[3] = &unk_1000E8E08;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_100066F24(v6, v8);
}

- (void)promise:(id)a3 didUpdateProgress:(double)a4
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D030;
  v6[3] = &unk_1000E8FA8;
  void v6[4] = self;
  sub_100066F24(v5, v6);
}

- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    double v24 = "-[IXSCoordinatedAppInstall promise:didCancelForReason:client:]";
    __int16 v25 = 2112;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@ : Promise canceled: %@ for reason %@ client %lu", buf, 0x34u);
  }

  unsigned __int8 v11 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005D2F4;
  v19[3] = &unk_1000E9408;
  v19[4] = self;
  id v12 = v8;
  id v20 = v12;
  unint64_t v22 = a5;
  id v13 = v9;
  id v21 = v13;
  sub_100066F24(v11, v19);

  if ((id)[(IXSCoordinatedAppInstall *)self effectiveIntent] == (id)3
    && ([(IXSCoordinatedAppInstall *)self appAssetPromise],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 == v12))
  {
    id v15 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005D41C;
    v16[3] = &unk_1000E9738;
    void v16[4] = self;
    id v17 = v13;
    unint64_t v18 = a5;
    sub_100066F24(v15, v16);
  }
  else
  {
    [(IXSCoordinatedAppInstall *)self cancelForReason:v13 client:a5 error:0];
  }
}

- (unint64_t)placeholderDisposition
{
  unsigned __int8 v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_placeholderDisposition;
}

- (void)setPlaceholderDisposition:(unint64_t)a3
{
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  self->_placeholderDisposition = a3;
}

- (void)_onQueue_runPostProcessingAssertionHandler
{
  unsigned __int8 v3 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSCoordinatedAppInstall *)self setCurrentProgressPhaseIsComplete:0];
  [(IXSCoordinatedAppInstall *)self setPendingProgressRequests:0];
  [(IXSCoordinatedAppInstall *)self setSentBeginPostProcessing:1];
  id v4 = [(IXSCoordinatedAppInstall *)self publishedInstallProgress];
  [v4 setInstallPhase:4];

  id v5 = [(IXSCoordinatedAppInstall *)self completedRecordPromise];
  id v6 = [(IXSCoordinatedAppInstall *)self delegateCallQueue];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_10005D5D4;
  unsigned __int8 v11 = &unk_1000E8E08;
  id v12 = self;
  id v13 = v5;
  id v7 = v5;
  sub_100066F24(v6, &v8);

  -[IXSCoordinatedAppInstall setPostProcessingAssertionState:](self, "setPostProcessingAssertionState:", 4, v8, v9, v10, v11, v12);
  [(IXSCoordinatedAppInstall *)self _onQueue_saveState];
  [(IXSCoordinatedAppInstall *)self _onQueue_checkState];
}

- (void)scheduledAppUpdateReadyToExecuteAndRunBlockWhenComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005D6E0;
  v7[3] = &unk_1000E9948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100066F24(v5, v7);
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]";
    __int16 v9 = 2112;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: RBS termination assertion observer called for %@", buf, 0x16u);
  }

  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D850;
  v6[3] = &unk_1000E8FA8;
  void v6[4] = self;
  sub_100066F24(v5, v6);
}

- (void)setPriorityBoostCompletion:(id)a3
{
}

- (void)setPriorityBoostSourceInfo:(id)a3
{
}

- (IXAppInstallCoordinatorSeed)seed
{
  return self->_seed;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateCallQueue
{
  return self->_delegateCallQueue;
}

- (void)setDelegateCallQueue:(id)a3
{
}

- (OS_dispatch_group)outstandingInstallOperationsGroup
{
  return self->_outstandingInstallOperationsGroup;
}

- (void)setOutstandingInstallOperationsGroup:(id)a3
{
}

- (os_unfair_lock_s)externalPropertyLock
{
  return self->_externalPropertyLock;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)errorSourceIdentifier
{
  return self->_errorSourceIdentifier;
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  self->_errorSourceIdentifier = a3;
}

- (NSUUID)installOptionsPromiseUUID
{
  return self->_installOptionsPromiseUUID;
}

- (void)setInstallOptionsPromiseUUID:(id)a3
{
}

- (NSUUID)placeholderPromiseUUID
{
  return self->_placeholderPromiseUUID;
}

- (void)setPlaceholderPromiseUUID:(id)a3
{
}

- (NSUUID)appAssetPromiseUUID
{
  return self->_appAssetPromiseUUID;
}

- (void)setAppAssetPromiseUUID:(id)a3
{
}

- (NSArray)initialODRAssetPromiseUUIDs
{
  return self->_initialODRAssetPromiseUUIDs;
}

- (void)setInitialODRAssetPromiseUUIDs:(id)a3
{
}

- (NSUUID)userDataPromiseUUID
{
  return self->_userDataPromiseUUID;
}

- (void)setUserDataPromiseUUID:(id)a3
{
}

- (NSUUID)deviceSecurityPromiseUUID
{
  return self->_deviceSecurityPromiseUUID;
}

- (void)setDeviceSecurityPromiseUUID:(id)a3
{
}

- (NSUUID)preparationPromiseUUID
{
  return self->_preparationPromiseUUID;
}

- (void)setPreparationPromiseUUID:(id)a3
{
}

- (NSProgress)cachedCurrentPhaseProgress
{
  return self->_cachedCurrentPhaseProgress;
}

- (NSMutableArray)pendingProgressRequests
{
  return self->_pendingProgressRequests;
}

- (void)setPendingProgressRequests:(id)a3
{
}

- (unint64_t)placeholderInstallState
{
  return self->_placeholderInstallState;
}

- (unint64_t)appInstallState
{
  return self->_appInstallState;
}

- (IXSPlaceholderFailureInfo)placeholderFailureInfo
{
  return self->_placeholderFailureInfo;
}

- (void)setPlaceholderFailureInfo:(id)a3
{
}

- (unint64_t)originalInstallType
{
  return self->_originalInstallType;
}

- (void)setOriginalInstallType:(unint64_t)a3
{
  self->_originalInstallType = a3;
}

- (BOOL)sentBeginRestoringUserData
{
  return self->_sentBeginRestoringUserData;
}

- (void)setSentBeginRestoringUserData:(BOOL)a3
{
  self->_sentBeginRestoringUserData = a3;
}

- (IXSPowerAssertion)appInstallPowerAssertion
{
  return self->_appInstallPowerAssertion;
}

- (void)setAppInstallPowerAssertion:(id)a3
{
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (BOOL)expectTermAssertionCallback
{
  return self->_expectTermAssertionCallback;
}

- (void)setExpectTermAssertionCallback:(BOOL)a3
{
  self->_expectTermAssertionCallback = a3;
}

- (OS_dispatch_source)assertionRetryTimer
{
  return self->_assertionRetryTimer;
}

- (void)setAssertionRetryTimer:(id)a3
{
}

- (unint64_t)assertionRetryCount
{
  return self->_assertionRetryCount;
}

- (void)setAssertionRetryCount:(unint64_t)a3
{
  self->_assertionRetryCount = a3;
}

- (NSDate)firstAppExtensionBusyTime
{
  return self->_firstAppExtensionBusyTime;
}

- (void)setFirstAppExtensionBusyTime:(id)a3
{
}

- (IXSCoordinatorProgress)coordinatorProgress
{
  return self->_coordinatorProgress;
}

- (void)setCoordinatorProgress:(id)a3
{
}

- (IPPublishedIdentityProgress)publishedInstallProgress
{
  return self->_publishedInstallProgress;
}

- (void)setPublishedInstallProgress:(id)a3
{
}

- (BOOL)appAssetPromiseSetterCanInstallLocalProvisionedContent
{
  return self->_appAssetPromiseSetterCanInstallLocalProvisionedContent;
}

- (void)setAppAssetPromiseSetterCanInstallLocalProvisionedContent:(BOOL)a3
{
  self->_appAssetPromiseSetterCanInstallLocalProvisionedContent = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)assertionTransaction
{
  return self->_assertionTransaction;
}

- (void)setAssertionTransaction:(id)a3
{
}

- (BOOL)sentBeginPostProcessing
{
  return self->_sentBeginPostProcessing;
}

- (void)setSentBeginPostProcessing:(BOOL)a3
{
  self->_sentBeginPostProcessing = a3;
}

- (NSArray)essentialAssetPromiseUUIDs
{
  return self->_essentialAssetPromiseUUIDs;
}

- (void)setEssentialAssetPromiseUUIDs:(id)a3
{
}

- (unint64_t)postProcessingAssertionState
{
  return self->_postProcessingAssertionState;
}

- (void)setPostProcessingAssertionState:(unint64_t)a3
{
  self->_unint64_t postProcessingAssertionState = a3;
}

- (unint64_t)updateScheduleState
{
  return self->_updateScheduleState;
}

- (void)setUpdateScheduleState:(unint64_t)a3
{
  self->_updateScheduleState = a3;
}

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (void)setAssertionQueue:(id)a3
{
}

- (id)schedulerCallback
{
  return self->_schedulerCallback;
}

- (void)setSchedulerCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_schedulerCallback, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
  objc_storeStrong((id *)&self->_essentialAssetPromiseUUIDs, 0);
  objc_storeStrong((id *)&self->_assertionTransaction, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_publishedInstallProgress, 0);
  objc_storeStrong((id *)&self->_coordinatorProgress, 0);
  objc_storeStrong((id *)&self->_firstAppExtensionBusyTime, 0);
  objc_storeStrong((id *)&self->_assertionRetryTimer, 0);
  objc_storeStrong((id *)&self->_termAssertion, 0);
  objc_storeStrong((id *)&self->_appInstallPowerAssertion, 0);
  objc_storeStrong((id *)&self->_placeholderFailureInfo, 0);
  objc_storeStrong((id *)&self->_pendingProgressRequests, 0);
  objc_storeStrong((id *)&self->_cachedCurrentPhaseProgress, 0);
  objc_storeStrong((id *)&self->_preparationPromiseUUID, 0);
  objc_storeStrong((id *)&self->_deviceSecurityPromiseUUID, 0);
  objc_storeStrong((id *)&self->_userDataPromiseUUID, 0);
  objc_storeStrong((id *)&self->_initialODRAssetPromiseUUIDs, 0);
  objc_storeStrong((id *)&self->_appAssetPromiseUUID, 0);
  objc_storeStrong((id *)&self->_placeholderPromiseUUID, 0);
  objc_storeStrong((id *)&self->_installOptionsPromiseUUID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outstandingInstallOperationsGroup, 0);
  objc_storeStrong((id *)&self->_delegateCallQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_progressHint, 0);
  objc_destroyWeak((id *)&self->_scopedToConnection);
  objc_storeStrong((id *)&self->_completedRecordPromise, 0);
  objc_storeStrong((id *)&self->_priorityBoostSourceInfo, 0);
  objc_storeStrong(&self->_priorityBoostCompletion, 0);
  objc_storeStrong((id *)&self->_targetGizmoPairingID, 0);
  objc_storeStrong((id *)&self->_essentialAssetPromises, 0);
  objc_storeStrong((id *)&self->_installOptionsPromise, 0);
  objc_storeStrong((id *)&self->_preparationPromise, 0);
  objc_storeStrong((id *)&self->_deviceSecurityPromise, 0);
  objc_storeStrong((id *)&self->_userDataPromise, 0);
  objc_storeStrong((id *)&self->_initialODRAssetPromises, 0);
  objc_storeStrong((id *)&self->_appAssetPromise, 0);

  objc_storeStrong((id *)&self->_placeholderPromise, 0);
}

- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5
{
  unsigned __int8 v13 = 0;
  id v12 = 0;
  id v8 = (void (**)(id, void, id))a5;
  LOBYTE(self) = [(IXSCoordinatedAppInstall *)self cancelForReason:a3 client:a4 needsLSDatabaseSync:&v13 error:&v12];
  id v9 = v12;
  uint64_t v10 = v9;
  id v11 = 0;
  if ((self & 1) == 0) {
    id v11 = v9;
  }
  v8[2](v8, v13, v11);
}

- (void)_remote_setPlaceholderPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IXSDataPromiseManager sharedInstance];
  id v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v9)
  {
    uint64_t v10 = [(IXSCoordinatedAppInstall *)self identity];
    id v11 = [v10 bundleID];
    id v12 = [v9 bundleID];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v14 = [(IXSCoordinatedAppInstall *)self internalQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005E224;
      block[3] = &unk_1000E8E08;
      void block[4] = self;
      id v24 = v9;
      dispatch_sync(v14, block);

      v7[2](v7, 0);
    }
    else
    {
      unint64_t v18 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100094E04();
      }

      __int16 v19 = [v9 bundleID];
      unint64_t v22 = [(IXSCoordinatedAppInstall *)self identity];
      id v21 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderPromiseUUID:completion:]", 6287, @"IXErrorDomain", 8uLL, 0, 0, @"Attempted to set placeholder promise with bundle ID %@ that does not match coordinator's identity %@", v20, (uint64_t)v19);

      ((void (**)(id, void *))v7)[2](v7, v21);
    }
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100094D90();
    }

    id v17 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderPromiseUUID:completion:]", 6296, @"IXErrorDomain", 3uLL, 0, 0, @"Failed to locate placeholder data promise with UUID %@", v16, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v17);
  }
}

- (void)_remote_getPlaceholderPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005E350;
  v6[3] = &unk_1000E9230;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasPlaceholderPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005E558;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setAppAssetPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(void))a5;
  char v11 = sub_10000D4A0(v9, @"InstallLocalProvisioned");
  id v12 = +[IXSDataPromiseManager sharedInstance];
  unsigned __int8 v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class()];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      uint64_t v28 = 0;
      __int16 v29 = &v28;
      uint64_t v30 = 0x3032000000;
      __int16 v31 = sub_100047F68;
      unint64_t v32 = sub_100047F78;
      id v33 = 0;
      id v15 = [v14 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005E8D8;
      block[3] = &unk_1000E9208;
      id v16 = v14;
      id v25 = v16;
      uint64_t v26 = self;
      __int16 v27 = &v28;
      dispatch_sync(v15, block);

      if (v29[5])
      {
        v10[2](v10);

        _Block_object_dispose(&v28, 8);
        goto LABEL_10;
      }

      _Block_object_dispose(&v28, 8);
    }
    uint64_t v20 = [(IXSCoordinatedAppInstall *)self internalQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005EB78;
    v21[3] = &unk_1000EA698;
    v21[4] = self;
    id v22 = v13;
    char v23 = v11;
    dispatch_sync(v20, v21);

    ((void (*)(void (**)(void), void))v10[2])(v10, 0);
    goto LABEL_10;
  }
  id v17 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100094EB0();
  }

  __int16 v19 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]", 6378, @"IXErrorDomain", 3uLL, 0, 0, @"Failed to locate app asset data promise with UUID %@", v18, (uint64_t)v8);
  ((void (*)(void (**)(void), void *))v10[2])(v10, v19);

LABEL_10:
}

- (void)_remote_getAppAssetPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100047F68;
  char v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005ECDC;
  v6[3] = &unk_1000E9230;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasAppAssetPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005EEE4;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_appAssetPromiseHasBegunFulfillment:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F0C8;
  block[3] = &unk_1000E9828;
  void block[4] = self;
  void block[5] = &v14;
  void block[6] = &v10;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v15 + 24))
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v11 + 24), 0);
  }
  else
  {
    uint64_t v7 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_appAssetPromiseHasBegunFulfillment:]", 6424, @"IXErrorDomain", 0x17uLL, 0, 0, @"App asset promise is not set", v6, v8);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)_remote_getAppAssetPromiseDRI:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005F2C8;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setAppAssetPromiseDRI:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005F3B4;
  v8[3] = &unk_1000E8D28;
  void v8[4] = self;
  void v8[5] = a3;
  dispatch_sync(v7, v8);

  v6[2](v6, 0);
}

- (BOOL)_validateParentLinkageForInstallOptions:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = sub_10000D670(v7);
  uint64_t v10 = [v8 linkedParentBundleID];

  if (v10 && ([v9 containsObject:v10] & 1) == 0)
  {
    char v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v17 = sub_10000D3CC(v7);
      *(_DWORD *)buf = 136316162;
      __int16 v19 = "-[IXSCoordinatedAppInstall(IPCMethods) _validateParentLinkageForInstallOptions:connection:error:]";
      __int16 v20 = 2112;
      id v21 = v17;
      __int16 v22 = 2112;
      char v23 = v10;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Client %@ setting the install options did not have the required entitlement to allow the linkedParentBundleID property of the supplied MIInstallOptions to be set to '%@' (found \"com.apple.private.mobileinstall.allowed-linked-parents\" = %@) : %@", buf, 0x34u);
    }
    uint64_t v14 = sub_10000D3CC(v7);
    sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _validateParentLinkageForInstallOptions:connection:error:]", 6455, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ setting the install options did not have the required entitlement to allow the linkedParentBundleID property of the supplied MIInstallOptions to be set to '%@' (found \"com.apple.private.mobileinstall.allowed-linked-parents\" = %@)", v15, (uint64_t)v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v11 = v11;
      BOOL v12 = 0;
      *a5 = v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    id v11 = 0;
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_remote_setInstallOptionsPromiseUUID:(id)a3 forConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  id v11 = [(IXSCoordinatedAppInstall *)self internalQueue];
  dispatch_assert_queue_not_V2(v11);

  if (v8)
  {
    uint64_t v55 = 0;
    id v56 = &v55;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    BOOL v12 = +[IXSDataPromiseManager sharedInstance];
    char v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class()];

    if (v13)
    {
      uint64_t v14 = [v13 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005FCF4;
      block[3] = &unk_1000E90A8;
      id v54 = &v55;
      id v15 = v13;
      id v53 = v15;
      dispatch_sync(v14, block);

      if (*((unsigned char *)v56 + 24))
      {
        id v51 = 0;
        id v16 = [(id)objc_opt_class() _fetchInstallOptionsFromPromise:v15 error:&v51];
        id v17 = v51;
        uint64_t v18 = v17;
        if (v16)
        {
          id v50 = v17;
          unsigned int v19 = [(IXSCoordinatedAppInstall *)self _validateParentLinkageForInstallOptions:v16 connection:v9 error:&v50];
          id v20 = v50;

          if (v19)
          {
            id v16 = v16;
            if ([v16 installationRequestorAuditToken]
              && (sub_10000D448(v9, @"com.apple.private.install.can-set-install-requestor") & 1) == 0)
            {
              __int16 v31 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                unint64_t v32 = sub_10000D3CC(v9);
                sub_100095114(v32, v60);
              }

              id v33 = sub_10000D3CC(v9);
              uint64_t v35 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]", 6516, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ attempted to set MIInstallOptions with the installationRequestorAuditToken property set, but did not have the required entitlement.", v34, (uint64_t)v33);

              __int16 v22 = 0;
              id v20 = (id)v35;
              goto LABEL_24;
            }
            id v21 = [v16 iTunesMetadata];
            __int16 v22 = v21;
            if (!v21) {
              goto LABEL_34;
            }
            id v49 = v20;
            long long v42 = sub_10000D83C(v21, v9, @"install options", &v49);
            id v23 = v49;

            if (v42)
            {
              if (objc_msgSend(v22, "isEqual:"))
              {
                id v20 = v23;
LABEL_33:

LABEL_34:
                unint64_t v39 = [(IXSCoordinatedAppInstall *)self internalQueue];
                v43[0] = _NSConcreteStackBlock;
                v43[1] = 3221225472;
                v43[2] = sub_10005FD30;
                v43[3] = &unk_1000E8E08;
                v43[4] = self;
                id v15 = v15;
                id v44 = v15;
                dispatch_sync(v39, v43);

                goto LABEL_24;
              }
              [v16 setITunesMetadata:v42];
              id v48 = v23;
              id v41 = sub_10003D560(v16, &v48);
              id v20 = v48;

              double v36 = v20;
              if (v41)
              {
                double v37 = [v15 accessQueue];
                v46[0] = _NSConcreteStackBlock;
                v46[1] = 3221225472;
                v46[2] = sub_10005FD28;
                v46[3] = &unk_1000E8FA8;
                id v40 = v15;
                id v47 = v40;
                dispatch_sync(v37, v46);

                id v38 = [IXSPromisedInMemoryData alloc];
                id v45 = v36;
                id v15 = [(IXSPromisedInMemoryData *)v38 updatedPromiseWithData:v41 error:&v45];
                id v20 = v45;

                if (v15)
                {

                  goto LABEL_33;
                }
                id v15 = 0;
              }
            }
            else
            {
              id v20 = v23;
            }

            goto LABEL_24;
          }
LABEL_23:
          __int16 v22 = 0;
LABEL_24:
          v10[2](v10, v20);

          _Block_object_dispose(&v55, 8);
          goto LABEL_25;
        }
        __int16 v29 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100095098();
        }

        sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]", 6505, @"IXErrorDomain", 1uLL, v18, 0, @"Failed to decode MIInstallOptions from promise %@", v30, (uint64_t)v15);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v27 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100095024();
        }

        sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]", 6499, @"IXErrorDomain", 3uLL, 0, 0, @"Client attempted to set install options promise that was not complete: %@", v28, (uint64_t)v15);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v25 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100094FB0();
      }

      sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]", 6488, @"IXErrorDomain", 3uLL, 0, 0, @"Failed to locate install options promise with UUID %@", v26, (uint64_t)v8);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = 0;
    }
    id v16 = 0;
    goto LABEL_23;
  }
  __int16 v24 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  void v59[2] = sub_10005FCE8;
  v59[3] = &unk_1000E8FA8;
  void v59[4] = self;
  dispatch_sync(v24, v59);

  v10[2](v10, 0);
LABEL_25:
}

- (void)_remote_hasInstallOptions:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005FE30;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getInstallOptions:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100047F68;
  id v17 = sub_100047F78;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060008;
  block[3] = &unk_1000E9710;
  void block[4] = self;
  void block[5] = &v7;
  void block[6] = &v13;
  dispatch_sync(v5, block);

  v4[2](v4, v8[5], v14[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (void)_remote_setImportance:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  unint64_t v7 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  if (a3 != 4 || (unint64_t v8 = v7, v7 == 2))
  {
    uint64_t v13 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100060254;
    block[3] = &unk_1000E8D28;
    void block[4] = self;
    void block[5] = a3;
    dispatch_sync(v13, block);

    v6[2](v6, 0);
  }
  else
  {
    uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100095174(v8, v9);
    }

    id v11 = IXStringForCoordinatorImportance(4uLL);
    if (v8 >= 8)
    {
      id v12 = +[NSString stringWithFormat:@"Unknown intent value %lu", v8];
    }
    else
    {
      id v12 = *(&off_1000EAC40 + v8);
    }
    uint64_t v14 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setImportance:completion:]", 6588, @"IXErrorDomain", 4uLL, 0, 0, @"Importance %@ isn't applicable to this coordinator with intent %@", v10, (uint64_t)v11);

    ((void (**)(id, void *))v6)[2](v6, v14);
  }
}

- (void)_remote_importanceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100060354;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_conveyPriorityReplacingExisting:(BOOL)a3 forConnection:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_10006064C;
  double v36 = sub_100060678;
  id v37 = objc_retainBlock(v9);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = sub_100047F68;
  uint64_t v30 = sub_100047F78;
  id v31 = 0;
  uint64_t v10 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100060680;
  v20[3] = &unk_1000EA9F8;
  v20[4] = self;
  BOOL v25 = a3;
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v23 = &v32;
  __int16 v24 = &v26;
  dispatch_sync(v10, v20);

  if (v33[5])
  {
    uint64_t v13 = sub_10006074C(v11);
    uint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v27[5];
      *(_DWORD *)buf = 136315650;
      unint64_t v39 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_conveyPriorityReplacingExisting:forConnection:withCompletion:]";
      __int16 v40 = 2112;
      uint64_t v41 = v15;
      __int16 v42 = 2112;
      long long v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Existing priority boost already retained: %@; not retaining %@",
        buf,
        0x20u);
    }

    (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(v33[5] + 16))(v33[5], 0, v16, v17, v18, v19);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

- (void)_remote_setTargetGizmoPairingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000608CC;
  v10[3] = &unk_1000E8E08;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, v10);

  v7[2](v7, 0);
}

- (void)_remote_targetGizmoPairingIDWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000609F8;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setInitialODRAssetPromiseUUIDs:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  id v6 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      id v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v11);
        uint64_t v13 = +[IXSDataPromiseManager sharedInstance];
        uint64_t v14 = [v13 promiseForUUID:v12 ofType:objc_opt_class()];

        if (!v14)
        {
          uint64_t v19 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_100095290();
          }

          id v21 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInitialODRAssetPromiseUUIDs:completion:]", 6668, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find ODR promise with UUID %@", v20, v12);
          uint64_t v18 = v23;
          (*((void (**)(id, void *))v23 + 2))(v23, v21);

          id v17 = v7;
          goto LABEL_13;
        }
        [v6 addObject:v14];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = [v6 copy];
  uint64_t v16 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060CF8;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v25 = v15;
  id v17 = v15;
  dispatch_sync(v16, block);

  uint64_t v18 = v23;
  (*((void (**)(id, void))v23 + 2))(v23, 0);

LABEL_13:
}

- (void)_remote_getInitialODRAssetPromises:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100060E24;
  v6[3] = &unk_1000E9230;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasInitialODRAssetPromises:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061120;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setUserDataPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v9)
  {
    char v10 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006132C;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v15 = v9;
    dispatch_sync(v10, block);

    v7[2](v7, 0);
  }
  else
  {
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100095304();
    }

    uint64_t v13 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setUserDataPromiseUUID:completion:]", 6717, @"IXErrorDomain", 3uLL, 0, 0, @"Failed to locate user data promise with UUID %@", v12, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v13);
  }
}

- (void)_remote_getUserDataPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061458;
  v6[3] = &unk_1000E9230;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasUserDataPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061660;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getUserDataRestoreShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000617A8;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setPreparationPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v9)
  {
    char v10 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100061998;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v15 = v9;
    dispatch_sync(v10, block);

    v7[2](v7, 0);
  }
  else
  {
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100095378();
    }

    uint64_t v13 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPreparationPromiseUUID:completion:]", 6763, @"IXErrorDomain", 3uLL, 0, 0, @"Failed to locate preparation promise with UUID %@", v12, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v13);
  }
}

- (void)_remote_getPreparationPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061AC4;
  v6[3] = &unk_1000E9230;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setDeviceSecurityPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v9)
  {
    char v10 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100061D90;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v15 = v9;
    dispatch_sync(v10, block);

    v7[2](v7, 0);
  }
  else
  {
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000953EC();
    }

    uint64_t v13 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setDeviceSecurityPromiseUUID:completion:]", 6791, @"IXErrorDomain", 3uLL, 0, 0, @"Failed to locate device security promise with UUID %@", v12, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v13);
  }
}

- (void)_remote_getDeviceSecurityPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061EBC;
  v6[3] = &unk_1000E9230;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getHasDeviceSecurityPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000620C4;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setNeedsPostProcessing:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if ((char *)[(IXSCoordinatedAppInstall *)self effectiveIntent] - 1 >= (char *)2)
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100095460(self, v8);
    }

    unint64_t v9 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
    if (v9 >= 8)
    {
      id v11 = +[NSString stringWithFormat:@"Unknown intent value %lu", v9];
    }
    else
    {
      id v11 = *(&off_1000EAC40 + v9);
    }
    id v12 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setNeedsPostProcessing:completion:]", 6822, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator with intent %@ does not support post processing.", v10, (uint64_t)v11);

    v6[2](v6, v12);
  }
  else
  {
    uint64_t v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000622C4;
    block[3] = &unk_1000E9800;
    void block[4] = self;
    BOOL v14 = a3;
    dispatch_sync(v7, block);

    v6[2](v6, 0);
  }
}

- (void)_remote_getNeedsPostProcessing:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((char *)[(IXSCoordinatedAppInstall *)self effectiveIntent] - 1 >= (char *)2)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009552C(self, v6);
    }

    unint64_t v7 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
    if (v7 >= 8)
    {
      unint64_t v9 = +[NSString stringWithFormat:@"Unknown intent value %lu", v7];
    }
    else
    {
      unint64_t v9 = *(&off_1000EAC40 + v7);
    }
    uint64_t v10 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_getNeedsPostProcessing:]", 6836, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator with intent %@ does not support post processing.", v8, (uint64_t)v9);

    v4[2](v4, 0, v10);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000624BC;
    block[3] = &unk_1000E90A8;
    void block[4] = self;
    void block[5] = &v12;
    dispatch_sync(v5, block);

    v4[2](v4, *((unsigned __int8 *)v13 + 24), 0);
    _Block_object_dispose(&v12, 8);
  }
}

- (void)_remote_getPostProcessingShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000625E8;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setEssentialAssetPromiseUUIDs:(id)a3 completion:(id)a4
{
  id v26 = a3;
  long long v27 = (void (**)(id, void *))a4;
  if ((char *)[(IXSCoordinatedAppInstall *)self effectiveIntent] - 1 >= (char *)2)
  {
    id v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000956E4();
    }

    uint64_t v19 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setEssentialAssetPromiseUUIDs:completion:]", 6863, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator %@ does not support post processing.", v18, (uint64_t)self);
    v27[2](v27, v19);
  }
  else
  {
    uint64_t v35 = 0;
    double v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    id v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062ADC;
    block[3] = &unk_1000E90A8;
    void block[4] = self;
    void block[5] = &v35;
    id v25 = self;
    dispatch_sync(v6, block);

    if (*((unsigned char *)v36 + 24))
    {
      uint64_t v7 = objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = v26;
      id v9 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v31;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v13 = +[IXSDataPromiseManager sharedInstance];
            uint64_t v14 = [v13 promiseForUUID:v12 ofType:objc_opt_class()];

            if (!v14)
            {
              uint64_t v20 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                sub_100095670();
              }

              id v22 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setEssentialAssetPromiseUUIDs:completion:]", 6884, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find essential asset promise with UUID %@", v21, v12);
              v27[2](v27, v22);

              goto LABEL_18;
            }
            [v7 addObject:v14];
          }
          id v9 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v15 = [v7 copy];
      uint64_t v16 = [(IXSCoordinatedAppInstall *)v25 internalQueue];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100062B10;
      v28[3] = &unk_1000E8E08;
      v28[4] = v25;
      id v8 = v15;
      id v29 = v8;
      dispatch_sync(v16, v28);

      v27[2](v27, 0);
LABEL_18:
    }
    else
    {
      id v23 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000955FC();
      }

      uint64_t v7 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setEssentialAssetPromiseUUIDs:completion:]", 6874, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator %@ does not have post processing enabled.", v24, (uint64_t)self);
      v27[2](v27, v7);
    }

    _Block_object_dispose(&v35, 8);
  }
}

- (void)_remote_getEssentialAssetPromises:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((char *)[(IXSCoordinatedAppInstall *)self effectiveIntent] - 1 >= (char *)2)
  {
    uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000957CC();
    }

    id v9 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_getEssentialAssetPromises:]", 6901, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator %@ does not support post processing.", v8, (uint64_t)self);
    v4[2](v4, 0, v9);
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = sub_100047F68;
    id v17 = sub_100047F78;
    id v18 = 0;
    id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062DD4;
    block[3] = &unk_1000E9710;
    void block[4] = self;
    void block[5] = &v19;
    void block[6] = &v13;
    dispatch_sync(v5, block);

    if (*((unsigned char *)v20 + 24))
    {
      id v6 = [(id)v14[5] copy];
      ((void (**)(id, id, void *))v4)[2](v4, v6, 0);
    }
    else
    {
      uint64_t v10 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100095758();
      }

      sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_getEssentialAssetPromises:]", 6926, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator %@ does not have post processing enabled.", v11, (uint64_t)self);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v6);
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
}

- (void)_remote_hasEssentialAssetPromises:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((char *)[(IXSCoordinatedAppInstall *)self effectiveIntent] - 1 >= (char *)2)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000958B4();
    }

    uint64_t v8 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_hasEssentialAssetPromises:]", 6936, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator %@ does not support post processing.", v7, (uint64_t)self);
    v4[2](v4, 0, v8);
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063278;
    block[3] = &unk_1000E9710;
    void block[4] = self;
    void block[5] = &v17;
    void block[6] = &v13;
    dispatch_sync(v5, block);

    if (*((unsigned char *)v18 + 24))
    {
      v4[2](v4, *((unsigned __int8 *)v14 + 24), 0);
    }
    else
    {
      id v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100095840();
      }

      uint64_t v11 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_hasEssentialAssetPromises:]", 6953, @"IXErrorDomain", 4uLL, 0, 0, @"Coordinator %@ does not have post processing enabled.", v10, (uint64_t)self);
      v4[2](v4, 0, v11);
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
}

- (void)_remote_getIsComplete:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000633F0;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getErrorInfo:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100047F68;
  uint64_t v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063588;
  block[3] = &unk_1000E9710;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v7;
  dispatch_sync(v5, block);

  v4[2](v4, v14[3], v8[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (void)_remote_fireObserversForClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000636C0;
  v10[3] = &unk_1000E8E08;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, v10);

  v7[2](v7, 0);
}

- (void)_remote_setIsPaused:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100063788;
  v9[3] = &unk_1000EA800;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  sub_100066F24(v7, v9);
}

- (void)_remote_getIsPausedWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100063890;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_prioritizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100063978;
  v7[3] = &unk_1000E9948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100066F24(v5, v7);
}

- (void)_remote_getCoordinationState:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSCoordinatedAppInstall *)self outstandingInstallOperationsGroup];
  id v6 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063A50;
  v8[3] = &unk_1000E9948;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, v6, v8);
}

- (void)_remote_getCoordinatorScopeWithCompletion:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, void, void))v4 + 2))(v4, [(IXSCoordinatedAppInstall *)self coordinatorScope], 0);
}

- (void)_remote_convertToGloballyScopedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063C34;
  block[3] = &unk_1000E8FA8;
  void block[4] = self;
  dispatch_sync(v5, block);

  v4[2](v4, 0);
}

- (void)_remote_setPlaceholderDisposition:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  unint64_t v7 = [(IXSCoordinatedAppInstall *)self effectiveIntent];
  id v8 = sub_100004B28((uint64_t)off_100109BB8);
  id v9 = v8;
  if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = IXStringForPlaceholderDisposition(a3);
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderDisposition:completion:]";
      __int16 v18 = 2112;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: setting placeholderDisposition to %@", buf, 0x20u);
    }
    BOOL v11 = [(IXSCoordinatedAppInstall *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063F7C;
    block[3] = &unk_1000E8D28;
    void block[4] = self;
    void block[5] = a3;
    dispatch_sync(v11, block);

    id v12 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100095928(v7, v9);
    }

    if (v7 >= 8)
    {
      uint64_t v14 = +[NSString stringWithFormat:@"Unknown intent value %lu", v7];
    }
    else
    {
      uint64_t v14 = *(&off_1000EAC40 + v7);
    }
    id v12 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderDisposition:completion:]", 7052, @"IXErrorDomain", 4uLL, 0, 0, @"Placeholder disposition is not applicable to coordinator type %@.", v13, (uint64_t)v14);
  }
  v6[2](v6, v12);
}

- (void)_remote_getPlaceholderDispositionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100064080;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setProgressHint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006418C;
  v10[3] = &unk_1000E8E08;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, v10);

  v7[2](v7, 0);
}

- (void)_remote_getProgressHintWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100047F68;
  id v11 = sub_100047F78;
  id v12 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000642B8;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = [(IXSCoordinatedAppInstall *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000643CC;
  block[3] = &unk_1000E8D00;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_sync(v9, block);

  v8[2](v8, 0);
}

- (void)_remote_removabilityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v5 = [(IXSCoordinatedAppInstall *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000644D4;
  v6[3] = &unk_1000E90A8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0);
  _Block_object_dispose(&v7, 8);
}

@end