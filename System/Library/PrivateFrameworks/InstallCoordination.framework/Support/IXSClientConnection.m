@interface IXSClientConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)clientProcessExists;
- (BOOL)fakeClientProcessDeath;
- (BOOL)interestedInCoordinatorUUID:(id)a3;
- (BOOL)interestedInPromiseUUID:(id)a3;
- (BOOL)invalidated;
- (IXSClientConnection)initWithConnection:(id)a3;
- (NSCountedSet)interestedCoordinatorUUIDs;
- (NSCountedSet)interestedPromiseUUIDs;
- (NSString)clientName;
- (NSString)description;
- (NSUUID)connectionUUID;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalQueue;
- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3;
- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4;
- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3;
- (void)_client_coordinatorShouldPauseWithUUID:(id)a3;
- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3;
- (void)_client_coordinatorShouldResumeWithUUID:(id)a3;
- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4;
- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3;
- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5;
- (void)_fetchDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchIXSCoordinatedAppInstallForUUID:(id)a3 method:(const char *)a4 andRunWithCoordinator:(id)a5 error:(id)a6;
- (void)_fetchOwnedDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPlaceholderForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPromisedOutOfBandStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPromisedStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_fetchPromisedTransferToPathForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 appAssetPromiseHasBegunFulfillment:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 convertToGloballyScopedWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 conveyPriorityReplacingExisting:(BOOL)a4 withCompletion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 fireObserversWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromiseDRI:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinationState:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinatorScopeWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getDeviceSecurityPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getErrorInfo:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getEssentialAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getHasDeviceSecurityPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInitialODRAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInstallOptions:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsComplete:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsPausedWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getNeedsPostProcessing:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderDispositionWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPostProcessingShouldBegin:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPreparationPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getProgressHintWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataRestoreShouldBegin:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasAppAssetPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasEssentialAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInitialODRAssetPromises:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInstallOptions:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasPlaceholderPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasUserDataPromise:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 importanceWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 prioritizeWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 removabilityWithCompletion:(id)a4;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseDRI:(unint64_t)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setDeviceSecurityPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setEssentialAssetPromiseUUIDs:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setImportance:(unint64_t)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInitialODRAssetPromiseUUIDs:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInstallOptionsPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setIsPaused:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setNeedsPostProcessing:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderDisposition:(unint64_t)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPreparationPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setProgressHint:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setRemovability:(unint64_t)a4 byClient:(unint64_t)a5 completion:(id)a6;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setTargetGizmoPairingID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setUserDataPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSCoordinatedAppInstall:(id)a3 targetGizmoPairingIDWithCompletion:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_IXSDataPromise:(id)a3 getErrorInfo:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 getIsComplete:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 getPercentComplete:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 preflightWithCompletion:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 resetWithCompletion:(id)a4;
- (void)_remote_IXSDataPromise:(id)a3 setIsComplete:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSDataPromise:(id)a3 setPercentComplete:(double)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 getStagedPath:(id)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 getTargetLastPathComponent:(id)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 setStagedPath:(id)a4;
- (void)_remote_IXSOwnedDataPromise:(id)a3 setTargetLastPathComponent:(id)a4 withCompletion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 getAppExtensionPlaceholderPromises:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getAttributesWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getEntitlementsPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getIconPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getIconResourcesPromiseAndInfoPlistContentPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getInfoPlistLoctablePromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getLaunchProhibitedWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getLocalizationDictionary:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getMetadataWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 getSinfDataWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasAppExtensionPlaceholderPromises:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasEntitlementsPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasIconPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasIconResourcesPromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 hasInfoPlistLoctablePromise:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 setAppExtensionPlaceholderPromiseUUIDs:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setAttributes:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setConfigurationCompleteWithCompletion:(id)a4;
- (void)_remote_IXSPlaceholder:(id)a3 setEntitlementsPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setIconPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setIconResourcesPromiseUUID:(id)a4 withInfoPlistIconContentPromiseUUID:(id)a5 completion:(id)a6;
- (void)_remote_IXSPlaceholder:(id)a3 setInfoPlistLoctablePromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setLaunchProhibited:(BOOL)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setLocalizationPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setMetadataPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPlaceholder:(id)a3 setSinfPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_IXSPromisedOutOfBandStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4;
- (void)_remote_IXSPromisedStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4;
- (void)_remote_IXSPromisedTransferToPath:(id)a3 setShouldCopy:(BOOL)a4;
- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTransferPath:(id)a4;
- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTryDeltaCopy:(BOOL)a4;
- (void)_remote_addObserversForCoordinatorsWithUUIDs:(id)a3 fireObserverMethods:(BOOL)a4;
- (void)_remote_addObserversForDataPromisesWithUUIDs:(id)a3;
- (void)_remote_cancelCoordinatorForAppWithIdentity:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_cancelCoordinatorsForAppsWithIdentities:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6;
- (void)_remote_checkIfDataPromiseExistsForUUID:(id)a3 completion:(id)a4;
- (void)_remote_createAppInstallCoordinatorWithSeed:(id)a3 createIfNotExisting:(BOOL)a4 requireMatchingIntent:(BOOL)a5 scopeRequirement:(unsigned __int8)a6 completion:(id)a7;
- (void)_remote_createAppReferenceDataPromiseWithSeed:(id)a3 ifMatchingPredicate:(id)a4 completion:(id)a5;
- (void)_remote_createInMemoryDataPromiseWithSeed:(id)a3 data:(id)a4 completion:(id)a5;
- (void)_remote_createInMemoryDictionaryPromiseWithSeed:(id)a3 dictionary:(id)a4 completion:(id)a5;
- (void)_remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createOutOfBandTransferPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createPlaceholderDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_createTransferToPathDataPromiseWithSeed:(id)a3 completion:(id)a4;
- (void)_remote_displayUserPresentableErrorForApp:(id)a3 code:(int64_t)a4;
- (void)_remote_displayUserPresentableErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4;
- (void)_remote_displayUserPresentableErrorForApps:(id)a3 code:(int64_t)a4;
- (void)_remote_fakeClientDeathWithCompletion:(id)a3;
- (void)_remote_fetchRegisteredDataPromiseInfoForCreator:(unint64_t)a3 completion:(id)a4;
- (void)_remote_fetchSeedsForCoordinatorsWithIntent:(unint64_t)a3 completion:(id)a4;
- (void)_remote_killDaemonForTestingWithCompletion:(id)a3;
- (void)_remote_pingDaemonWithCompletion:(id)a3;
- (void)_remote_postNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)_remote_prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4;
- (void)_remote_purgeRegisteredCoordinatorsAndPromisesForCreator:(unint64_t)a3 completion:(id)a4;
- (void)_remote_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)_remote_registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_remote_registerObserverMachServiceName:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)_remote_registerTransientObserver:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)_remote_removabilityDataWithCompletion:(id)a3;
- (void)_remote_removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 completion:(id)a5;
- (void)_remote_removabilityForAppWithIdentity:(id)a3 completion:(id)a4;
- (void)_remote_removeObserverForCoordinatorWithUUID:(id)a3;
- (void)_remote_removeObserverForDataPromiseWithUUID:(id)a3;
- (void)_remote_revertAppWithIdentity:(id)a3 completion:(id)a4;
- (void)_remote_setIsPaused:(BOOL)a3 forCoordinatorForAppWithIdentity:(id)a4 completion:(id)a5;
- (void)_remote_setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6;
- (void)_remote_setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5 completion:(id)a6;
- (void)_remote_setTestingEnabled:(BOOL)a3 completion:(id)a4;
- (void)_remote_uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_remote_unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_remote_updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_remote_updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 completion:(id)a5;
- (void)addInterestedCoordinatorUUID:(id)a3;
- (void)addInterestedCoordinatorUUIDs:(id)a3;
- (void)addInterestedPromiseUUID:(id)a3;
- (void)addInterestedPromiseUUIDs:(id)a3;
- (void)cancelOrphanedPromisesAndRemovePromiseReferences;
- (void)connectionInvalidated;
- (void)removeInterestedCoordinatorUUID:(id)a3;
- (void)removeInterestedCoordinatorUUIDs:(id)a3;
- (void)removeInterestedPromiseUUID:(id)a3;
- (void)removeInterestedPromiseUUIDs:(id)a3;
- (void)setFakeClientProcessDeath:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation IXSClientConnection

- (IXSClientConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IXSClientConnection;
  v5 = [(IXSClientConnection *)&v21 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.installcoordinationd.IXSClientConnection.internal", v6);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    interestedCoordinatorUUIDs = v5->_interestedCoordinatorUUIDs;
    v5->_interestedCoordinatorUUIDs = (NSCountedSet *)v9;

    uint64_t v11 = objc_opt_new();
    interestedPromiseUUIDs = v5->_interestedPromiseUUIDs;
    v5->_interestedPromiseUUIDs = (NSCountedSet *)v11;

    uint64_t v13 = sub_10000D3CC(v4);
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v13;

    *(_WORD *)&v5->_invalidated = 0;
    uint64_t v15 = +[NSUUID UUID];
    connectionUUID = v5->_connectionUUID;
    v5->_connectionUUID = (NSUUID *)v15;

    [(IXSClientConnection *)v5 setXpcConnection:v4];
    if (v4)
    {
      [v4 auditToken];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    *(_OWORD *)v5->_clientAuditToken.val = v19;
    *(_OWORD *)&v5->_clientAuditToken.val[4] = v20;
    v17 = +[IXSAppInstallObserverManager sharedInstance];
    [v17 registerClientConnection:v5];
  }
  return v5;
}

- (BOOL)clientProcessExists
{
  if ([(IXSClientConnection *)self fakeClientProcessDeath]) {
    return 0;
  }
  [(IXSClientConnection *)self clientAuditToken];
  return proc_pidpath_audittoken(&v4, buffer, 0x1000u) > 0;
}

- (void)connectionInvalidated
{
  if (![(IXSClientConnection *)self invalidated])
  {
    [(IXSClientConnection *)self setInvalidated:1];
    v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      dispatch_queue_t v7 = "-[IXSClientConnection connectionInvalidated]";
      __int16 v8 = 2112;
      uint64_t v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Connection Invalidated", (uint8_t *)&v6, 0x16u);
    }

    audit_token_t v4 = +[IXSAppInstallObserverManager sharedInstance];
    [v4 unregisterClientConnection:self];

    v5 = +[IXSCoordinatorManager sharedInstance];
    [v5 connectionInvalidated:self];

    [(IXSClientConnection *)self cancelOrphanedPromisesAndRemovePromiseReferences];
  }
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  audit_token_t v4 = NSStringFromClass(v3);
  v5 = [(IXSClientConnection *)self clientName];
  int v6 = [(IXSClientConnection *)self connectionUUID];
  dispatch_queue_t v7 = +[NSString stringWithFormat:@"<%@<%p> client:%@ uuid:%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)addInterestedCoordinatorUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [(IXSClientConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006AB4C;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addInterestedCoordinatorUUID:(id)a3
{
  id v4 = a3;
  v5 = [(IXSClientConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006ACEC;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeInterestedCoordinatorUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [(IXSClientConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006AE8C;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeInterestedCoordinatorUUID:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  [(IXSClientConnection *)self removeInterestedCoordinatorUUIDs:v4];
}

- (BOOL)interestedInCoordinatorUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B3E4;
  block[3] = &unk_1000E90F0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)cancelOrphanedPromisesAndRemovePromiseReferences
{
  v3 = +[IXSDataPromiseManager sharedInstance];
  id v4 = [(IXSClientConnection *)self clientName];
  id v6 = sub_10003DAE4((uint64_t)"-[IXSClientConnection cancelOrphanedPromisesAndRemovePromiseReferences]", 255, @"IXErrorDomain", 0x12uLL, 0, 0, @"Promise was not attached to a coordinator and is no longer referenced by client %@", v5, (uint64_t)v4);

  dispatch_queue_t v7 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B570;
  block[3] = &unk_1000E9140;
  block[4] = self;
  id v11 = v3;
  id v12 = v6;
  id v8 = v6;
  id v9 = v3;
  dispatch_sync(v7, block);
}

- (void)addInterestedPromiseUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXSClientConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B738;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addInterestedPromiseUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXSClientConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B8D8;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeInterestedPromiseUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXSClientConnection *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006BA78;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeInterestedPromiseUUID:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  [(IXSClientConnection *)self removeInterestedPromiseUUIDs:v4];
}

- (BOOL)interestedInPromiseUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006BE44;
  block[3] = &unk_1000E90F0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_remote_createPlaceholderDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v8 = [IXSPlaceholder alloc];
  id v9 = [(IXSClientConnection *)self xpcConnection];
  id v37 = 0;
  v10 = [(IXSPlaceholder *)v8 initWithSeed:v6 fromConnection:v9 error:&v37];
  id v11 = v37;

  if (v10)
  {
    id v12 = +[IXSDataPromiseManager sharedInstance];
    [v12 registerPromise:v10];

    uint64_t v13 = [(IXSDataPromise *)v10 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v13];

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_10006C1D8;
    v35 = sub_10006C1E8;
    id v36 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = sub_10006C1D8;
    v29 = sub_10006C1E8;
    id v30 = 0;
    char v14 = [(IXSDataPromise *)v10 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C1F0;
    block[3] = &unk_1000E9828;
    v22 = v10;
    v23 = &v25;
    v24 = &v31;
    dispatch_sync(v14, block);

    v7[2](v7, v32[5], v26[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000966A0(v6, (uint64_t)v11, v15);
    }

    v16 = [v6 name];
    v17 = [v6 bundleName];
    long long v20 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v19 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createPlaceholderDataPromiseWithSeed:completion:]", 337, @"IXErrorDomain", 2uLL, v11, 0, @"Failed to create placeholder data promise with name: %@ bundleName: %@ client: %@", v18, (uint64_t)v16);

    v7[2](v7, 0, v19);
    id v11 = (id)v19;
  }
}

- (void)_remote_createTransferToPathDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v36 = 0;
  id v8 = [(IXSOwnedDataPromise *)[IXSPromisedTransferToPath alloc] initWithSeed:v6 error:&v36];
  id v9 = v36;
  if (v8)
  {
    v10 = +[IXSDataPromiseManager sharedInstance];
    [v10 registerPromise:v8];

    id v11 = [(IXSDataPromise *)v8 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v11];

    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = sub_10006C1D8;
    v34 = sub_10006C1E8;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_10006C1D8;
    v28 = sub_10006C1E8;
    id v29 = 0;
    id v12 = [(IXSDataPromise *)v8 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C594;
    block[3] = &unk_1000E9828;
    objc_super v21 = v8;
    v22 = &v24;
    v23 = &v30;
    dispatch_sync(v12, block);

    v7[2](v7, v31[5], v25[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096794(v6, (uint64_t)v9, v13);
    }

    char v14 = [v6 name];
    uint64_t v15 = [v6 transferPath];
    v16 = [v15 path];
    uint64_t v19 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createTransferToPathDataPromiseWithSeed:completion:]", 363, @"IXErrorDomain", 2uLL, v9, 0, @"Failed to create promised transfer to path data promise with name: %@ path: %@ client: %@", v17, (uint64_t)v14);

    v7[2](v7, 0, v18);
    id v9 = (id)v18;
  }
}

- (void)_remote_createStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v34 = 0;
  id v8 = [[IXSPromisedStreamingZipTransfer alloc] initWithSeed:v6 error:&v34];
  id v9 = v34;
  if (v8)
  {
    v10 = +[IXSDataPromiseManager sharedInstance];
    [v10 registerPromise:v8];

    id v11 = [(IXSDataPromise *)v8 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v11];

    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = sub_10006C1D8;
    uint64_t v32 = sub_10006C1E8;
    id v33 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = sub_10006C1D8;
    uint64_t v26 = sub_10006C1E8;
    id v27 = 0;
    id v12 = [(IXSDataPromise *)v8 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C908;
    block[3] = &unk_1000E9828;
    uint64_t v19 = v8;
    long long v20 = &v22;
    objc_super v21 = &v28;
    dispatch_sync(v12, block);

    v7[2](v7, v29[5], v23[5]);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096898();
    }

    char v14 = [v6 name];
    uint64_t v17 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createStreamingZipTransferDataPromiseWithSeed:completion:]", 389, @"IXErrorDomain", 2uLL, v9, 0, @"Failed to create streaming zip transfer data promise with name: %@ client: %@", v15, (uint64_t)v14);

    v7[2](v7, 0, v16);
    id v9 = (id)v16;
  }
}

- (void)_remote_createInMemoryDataPromiseWithSeed:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  id v30 = 0;
  id v11 = [[IXSPromisedInMemoryData alloc] initWithSeed:v8 data:v9 error:&v30];
  id v12 = v30;
  if (v11)
  {
    uint64_t v13 = +[IXSDataPromiseManager sharedInstance];
    [v13 registerPromise:v11];

    char v14 = [(IXSDataPromise *)v11 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v14];

    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_10006C1D8;
    uint64_t v28 = sub_10006C1E8;
    id v29 = 0;
    uint64_t v15 = [(IXSDataPromise *)v11 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CC38;
    block[3] = &unk_1000E90A8;
    v23 = &v24;
    uint64_t v22 = v11;
    dispatch_sync(v15, block);

    v10[2](v10, v25[5], 0);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    uint64_t v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100096944();
    }

    uint64_t v17 = [v8 name];
    long long v20 = IXStringForClientID((unint64_t)[v8 creatorIdentifier]);
    uint64_t v19 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createInMemoryDataPromiseWithSeed:data:completion:]", 416, @"IXErrorDomain", 2uLL, v12, 0, @"Failed to create in memory data promise with name: %@ client: %@", v18, (uint64_t)v17);

    v10[2](v10, 0, v19);
    id v12 = (id)v19;
  }
}

- (void)_remote_createInMemoryDictionaryPromiseWithSeed:(id)a3 dictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  id v30 = 0;
  id v11 = [[IXSPromisedInMemoryDictionary alloc] initWithSeed:v8 dictionary:v9 error:&v30];
  id v12 = v30;
  if (v11)
  {
    uint64_t v13 = +[IXSDataPromiseManager sharedInstance];
    [v13 registerPromise:v11];

    char v14 = [(IXSDataPromise *)v11 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v14];

    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_10006C1D8;
    uint64_t v28 = sub_10006C1E8;
    id v29 = 0;
    uint64_t v15 = [(IXSDataPromise *)v11 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CF34;
    block[3] = &unk_1000E90A8;
    v23 = &v24;
    uint64_t v22 = v11;
    dispatch_sync(v15, block);

    v10[2](v10, v25[5], 0);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    uint64_t v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000969F0();
    }

    uint64_t v17 = [v8 name];
    long long v20 = IXStringForClientID((unint64_t)[v8 creatorIdentifier]);
    uint64_t v19 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createInMemoryDictionaryPromiseWithSeed:dictionary:completion:]", 438, @"IXErrorDomain", 2uLL, v12, 0, @"Failed to create in memory dictionary promise with name: %@ client: %@", v18, (uint64_t)v17);

    v10[2](v10, 0, v19);
    id v12 = (id)v19;
  }
}

- (void)_remote_createOutOfBandTransferPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(id, uint64_t, void))a4;
  id v27 = 0;
  id v8 = [(IXSDataPromise *)[IXSPromisedOutOfBandTransfer alloc] initWithSeed:v6 error:&v27];
  id v9 = v27;
  if (v8)
  {
    v10 = +[IXSDataPromiseManager sharedInstance];
    [v10 registerPromise:v8];

    id v11 = [(IXSDataPromise *)v8 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v11];

    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = sub_10006C1D8;
    uint64_t v25 = sub_10006C1E8;
    id v26 = 0;
    id v12 = [(IXSDataPromise *)v8 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006D21C;
    block[3] = &unk_1000E90A8;
    long long v20 = &v21;
    uint64_t v19 = v8;
    dispatch_sync(v12, block);

    v7[2](v7, v22[5], 0);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096A9C();
    }

    char v14 = [v6 name];
    uint64_t v17 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createOutOfBandTransferPromiseWithSeed:completion:]", 460, @"IXErrorDomain", 2uLL, v9, 0, @"Failed to create out of band transfer promise with name: %@ client: %@", v15, (uint64_t)v14);

    v7[2](v7, 0, v16);
    id v9 = (id)v16;
  }
}

- (void)_remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(id, uint64_t, void))a4;
  id v27 = 0;
  id v8 = [[IXSPromisedOutOfBandStreamingZipTransfer alloc] initWithSeed:v6 error:&v27];
  id v9 = v27;
  if (v8)
  {
    v10 = +[IXSDataPromiseManager sharedInstance];
    [v10 registerPromise:v8];

    id v11 = [(IXSDataPromise *)v8 uniqueIdentifier];
    [(IXSClientConnection *)self addInterestedPromiseUUID:v11];

    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = sub_10006C1D8;
    uint64_t v25 = sub_10006C1E8;
    id v26 = 0;
    id v12 = [(IXSDataPromise *)v8 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006D504;
    block[3] = &unk_1000E90A8;
    long long v20 = &v21;
    uint64_t v19 = v8;
    dispatch_sync(v12, block);

    v7[2](v7, v22[5], 0);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100096B48();
    }

    char v14 = [v6 name];
    uint64_t v17 = IXStringForClientID((unint64_t)[v6 creatorIdentifier]);
    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:completion:]", 482, @"IXErrorDomain", 2uLL, v9, 0, @"Failed to create out of band streaming zip transfer promise with name: %@ client: %@", v15, (uint64_t)v14);

    v7[2](v7, 0, v16);
    id v9 = (id)v16;
  }
}

- (void)_remote_createAppReferenceDataPromiseWithSeed:(id)a3 ifMatchingPredicate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identity];
  id v28 = 0;
  unsigned __int8 v12 = [v11 resolvePersonaWithError:&v28];
  id v13 = v28;

  if (v12)
  {
    id v27 = v13;
    char v14 = [[IXSPromisedAppReference alloc] initWithSeed:v8 ifMatchingPredicate:v9 error:&v27];
    id v15 = v27;

    if (v14)
    {
      uint64_t v16 = +[IXSDataPromiseManager sharedInstance];
      [v16 registerPromise:v14];

      uint64_t v17 = [(IXSDataPromise *)v14 uniqueIdentifier];
      [(IXSClientConnection *)self addInterestedPromiseUUID:v17];

      uint64_t v18 = [(IXSDataPromise *)v14 accessQueue];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10006D7E0;
      v24[3] = &unk_1000EA670;
      id v26 = v10;
      uint64_t v25 = v14;
      sub_100066F24(v18, v24);
    }
    else
    {
      uint64_t v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100096BF4();
      }

      long long v20 = [v8 name];
      uint64_t v23 = IXStringForClientID((unint64_t)[v8 creatorIdentifier]);
      uint64_t v22 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppReferenceDataPromiseWithSeed:ifMatchingPredicate:completion:]", 511, @"IXErrorDomain", 2uLL, v15, 0, @"Failed to create promised app reference with name: %@ client: %@", v21, (uint64_t)v20);

      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v22);
      id v15 = (id)v22;
    }

    id v13 = v15;
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

- (void)_remote_createAppInstallCoordinatorWithSeed:(id)a3 createIfNotExisting:(BOOL)a4 requireMatchingIntent:(BOOL)a5 scopeRequirement:(unsigned __int8)a6 completion:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  char v14 = [v12 identity];
  id v15 = v14;
  if (v14)
  {
    id v82 = 0;
    unsigned __int8 v16 = [v14 resolvePersonaWithError:&v82];
    id v17 = v82;
    if (v16)
    {
      uint64_t v18 = [v15 bundleID];
      v76 = v18;
      if (!v18)
      {
        id v27 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v28 = [(IXSClientConnection *)self clientName];
          sub_100096D1C(v28, buf);
        }

        id v29 = [(IXSClientConnection *)self clientName];
        sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 572, @"IXErrorDomain", 0xDuLL, 0, 0, @"Expected a non-nil bundleID from client: %@", v30, (uint64_t)v29);
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
        uint64_t v22 = 0;
        goto LABEL_53;
      }
      if ([v18 containsString:@"/"])
      {
        uint64_t v19 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100096D74();
        }

        sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 578, @"IXErrorDomain", 0x2CuLL, 0, 0, @"Bundle identifier %@ contains \"/\", which is not allowed", v20, (uint64_t)v76);
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
        uint64_t v22 = 0;
        goto LABEL_53;
      }
      if (![v76 length])
      {
        uint64_t v32 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_100096DEC();
        }

        sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 584, @"IXErrorDomain", 0x2CuLL, 0, 0, @"Bundle identifier is an empty string, which is not allowed", v33, v69);
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
        uint64_t v22 = 0;
        goto LABEL_53;
      }
      if (!sub_100038E70(v8))
      {
        id v34 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          sub_100096F00(v8, v34, buf);
          uint64_t v8 = *(unsigned int *)buf;
        }

        sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 590, @"IXErrorDomain", 4uLL, 0, 0, @"Scope requirement parameter value was not a known value: %hhu", v35, v8);
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
        uint64_t v22 = 0;
        goto LABEL_53;
      }
      id v31 = [v12 installationDomain];
      if ((MIIsValidInstallationDomain() & 1) == 0)
      {
        id v36 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_100096E70((uint64_t)v31, v36, v37);
        }

        sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 597, @"IXErrorDomain", 4uLL, 0, 0, @"Installation domain in seed was not a known value: %lu", v38, (uint64_t)v31);
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
        uint64_t v22 = 0;
        goto LABEL_53;
      }
      if (v10)
      {
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = sub_10006E610;
        v78[3] = &unk_1000EADA8;
        char v81 = v8;
        v78[4] = self;
        id v79 = v12;
        v80 = &v83;
        uint64_t v22 = objc_retainBlock(v78);
      }
      else
      {
        uint64_t v22 = 0;
      }
      v39 = +[IXSCoordinatorManager sharedInstance];
      id v77 = v17;
      v75 = [v39 coordinatorForIdentity:v15 connection:self error:&v77 creatingIfNotExisting:v22];
      id v21 = v77;

      if (!v75)
      {
        v44 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v88 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingInt"
                "ent:scopeRequirement:completion:]";
          __int16 v89 = 2112;
          v90 = v15;
          __int16 v91 = 2112;
          id v92 = v21;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: Failed to create/get coordinator for %@ : %@", buf, 0x20u);
        }

        (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
        goto LABEL_52;
      }

      if (sub_10006E69C(v75, v8))
      {
        if (!v9) {
          goto LABEL_51;
        }
        id v40 = [v12 intent];
        if (v40 == [v75 originalIntent]) {
          goto LABEL_51;
        }
        if (*((unsigned char *)v84 + 24))
        {
          v41 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            sub_10006E6F8((unint64_t)[v12 intent]);
            id v64 = (id)objc_claimAutoreleasedReturnValue();
            v65 = sub_10006E6F8((unint64_t)[v75 originalIntent]);
            *(_DWORD *)buf = 136316162;
            v88 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingI"
                  "ntent:scopeRequirement:completion:]";
            __int16 v89 = 2112;
            v90 = v15;
            __int16 v91 = 2112;
            id v92 = v64;
            __int16 v93 = 2112;
            id v94 = v65;
            __int16 v95 = 2112;
            v96 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s: Created an IXCoordinatedAppInstall object for %@ expecting it to have intent %@ but it had %@ : %@", buf, 0x34u);
          }
          v42 = sub_10006E6F8((unint64_t)[v12 intent]);
          v70 = sub_10006E6F8((unint64_t)[v75 originalIntent]);
          sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 635, @"IXErrorDomain", 1uLL, 0, 0, @"Created an IXCoordinatedAppInstall object for %@ expecting it to have intent %@ but it had %@", v43, (uint64_t)v15);
          id v21 = (id)objc_claimAutoreleasedReturnValue();

          [v75 cancelForReason:v21 client:15 error:0];
          goto LABEL_49;
        }
        v57 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          sub_10006E6F8((unint64_t)[v75 originalIntent]);
          id v74 = (id)objc_claimAutoreleasedReturnValue();
          IXStringForClientID((unint64_t)[v75 creator]);
          id v66 = (id)objc_claimAutoreleasedReturnValue();
          v67 = [(IXSClientConnection *)self clientName];
          v68 = sub_10006E6F8((unint64_t)[v12 intent]);
          *(_DWORD *)buf = 136316674;
          v88 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingInt"
                "ent:scopeRequirement:completion:]";
          __int16 v89 = 2112;
          v90 = v15;
          __int16 v91 = 2112;
          id v92 = v74;
          __int16 v93 = 2112;
          id v94 = v66;
          __int16 v95 = 2112;
          v96 = v67;
          __int16 v97 = 2112;
          uint64_t v98 = (uint64_t)v68;
          __int16 v99 = 2112;
          uint64_t v100 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s: A coordinated app install already exists for %@ with intent %@ (creator %@) but request by %@ was for intent %@ : %@", buf, 0x48u);
        }
        v49 = sub_10006E6F8((unint64_t)[v75 originalIntent]);
        v50 = IXStringForClientID((unint64_t)[v75 creator]);
        v51 = [(IXSClientConnection *)self clientName];
        v52 = sub_10006E6F8((unint64_t)[v12 intent]);
        uint64_t v54 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 639, @"IXErrorDomain", 5uLL, 0, 0, @"A coordinated app install already exists for %@ with intent %@ (creator %@) but request by %@ was for intent %@", v58, (uint64_t)v15);
      }
      else
      {
        if (*((unsigned char *)v84 + 24))
        {
          v45 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            sub_100038E04(v8);
            id v59 = (id)objc_claimAutoreleasedReturnValue();
            v60 = IXStringForCoordinatorScope([v75 coordinatorScope]);
            *(_DWORD *)buf = 136316162;
            v88 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingI"
                  "ntent:scopeRequirement:completion:]";
            __int16 v89 = 2112;
            v90 = v15;
            __int16 v91 = 2112;
            id v92 = v59;
            __int16 v93 = 2112;
            id v94 = v60;
            __int16 v95 = 2112;
            v96 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s: Created an IXCoordinatedAppInstall object for %@ expecting it to have scope requirement %@ but it had scope %@ : %@", buf, 0x34u);
          }
          v46 = sub_100038E04(v8);
          v71 = IXStringForCoordinatorScope([v75 coordinatorScope]);
          sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 626, @"IXErrorDomain", 1uLL, 0, 0, @"Created an IXCoordinatedAppInstall object for %@ expecting it to have scope requirement %@ but it had scope %@", v47, (uint64_t)v15);
          id v21 = (id)objc_claimAutoreleasedReturnValue();

          [v75 cancelForReason:v21 client:15 error:0];
LABEL_49:
          if (v21)
          {
            (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v21);
LABEL_52:

LABEL_53:
            id v17 = v21;
            goto LABEL_54;
          }
LABEL_51:
          v55 = [v75 uniqueIdentifier];
          [(IXSClientConnection *)self addInterestedCoordinatorUUID:v55];

          v56 = [v75 seed];
          (*((void (**)(id, void *, void, void))v13 + 2))(v13, v56, *((unsigned __int8 *)v84 + 24), 0);

          id v21 = 0;
          goto LABEL_52;
        }
        v48 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          IXStringForCoordinatorScope([v75 coordinatorScope]);
          id v73 = (id)objc_claimAutoreleasedReturnValue();
          IXStringForClientID((unint64_t)[v75 creator]);
          id v61 = (id)objc_claimAutoreleasedReturnValue();
          v62 = [(IXSClientConnection *)self clientName];
          uint64_t v63 = sub_100038E04(v8);
          *(_DWORD *)buf = 136316674;
          v88 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingInt"
                "ent:scopeRequirement:completion:]";
          __int16 v89 = 2112;
          v90 = v15;
          __int16 v91 = 2112;
          id v92 = v73;
          __int16 v93 = 2112;
          id v94 = v61;
          __int16 v95 = 2112;
          v96 = v62;
          __int16 v97 = 2112;
          v72 = (void *)v63;
          uint64_t v98 = v63;
          __int16 v99 = 2112;
          uint64_t v100 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s: A coordinated app install already exists for %@ with scope %@ (creator %@) but request by %@ had scope requirement %@ : %@", buf, 0x48u);
        }
        v49 = IXStringForCoordinatorScope([v75 coordinatorScope]);
        v50 = IXStringForClientID((unint64_t)[v75 creator]);
        v51 = [(IXSClientConnection *)self clientName];
        v52 = sub_100038E04(v8);
        uint64_t v54 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 630, @"IXErrorDomain", 0x2EuLL, 0, 0, @"A coordinated app install already exists for %@ with scope %@ (creator %@) but request by %@ had scope requirement %@", v53, (uint64_t)v15);
      }
      id v21 = (id)v54;

      goto LABEL_49;
    }
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v17);
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [(IXSClientConnection *)self clientName];
      sub_100096CC4(v24, buf);
    }

    uint64_t v25 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]", 559, @"IXErrorDomain", 0x2DuLL, 0, 0, @"Expected a non-nil identity from client: %@", v26, (uint64_t)v25);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v17);
    uint64_t v22 = 0;
  }
LABEL_54:

  _Block_object_dispose(&v83, 8);
}

- (void)_remote_fetchSeedsForCoordinatorsWithIntent:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  dispatch_queue_t v7 = objc_opt_new();
  uint64_t v8 = +[IXSCoordinatorManager sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006E964;
  v14[3] = &unk_1000EADD0;
  unint64_t v16 = a3;
  id v9 = v7;
  id v15 = v9;
  [v8 enumerateCoordinatorsApplicableToConnection:self usingBlock:v14];

  BOOL v10 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IXSClientConnection *)self clientName];
    id v12 = [v9 count];
    if (a3 >= 8)
    {
      id v13 = +[NSString stringWithFormat:@"Unknown intent value %lu", a3];
    }
    else
    {
      id v13 = off_1000EB3A0[a3];
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "-[IXSClientConnection _remote_fetchSeedsForCoordinatorsWithIntent:completion:]";
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    id v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Client %@ fetched %lu coordinators for enumeration with intent %@", buf, 0x2Au);
  }
  v6[2](v6, v9, 0);
}

- (void)_remote_fetchRegisteredDataPromiseInfoForCreator:(unint64_t)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, id, void))a4;
  id v6 = objc_opt_new();
  dispatch_queue_t v7 = +[IXSDataPromiseManager sharedInstance];
  BOOL v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10006EACC;
  id v13 = &unk_1000EADF8;
  id v14 = v6;
  unint64_t v15 = a3;
  id v8 = v6;
  [v7 enumeratePromises:&v10];

  id v9 = objc_msgSend(v8, "copy", v10, v11, v12, v13);
  v5[2](v5, v9, 0);
}

- (void)_remote_checkIfDataPromiseExistsForUUID:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  dispatch_queue_t v7 = +[IXSDataPromiseManager sharedInstance];
  id v8 = [v7 promiseForUUID:v6];

  v5[2](v5, v8 != 0, 0);
}

- (void)_remote_cancelCoordinatorForAppWithIdentity:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, id))a6;
  id v33 = 0;
  unsigned __int8 v13 = [v10 resolvePersonaWithError:&v33];
  id v14 = v33;
  if (v13)
  {
    unint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = IXStringForClientID(a5);
      id v17 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = "-[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]";
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      v39 = v16;
      __int16 v40 = 2112;
      v41 = v17;
      __int16 v42 = 2112;
      id v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Cancellation for %@ (client %@) requested by %@ for reason %@", buf, 0x34u);
    }
    uint64_t v18 = +[IXSCoordinatorManager sharedInstance];
    __int16 v19 = [v18 coordinatorForIdentity:v10];

    if (v19)
    {
      buf[0] = 0;
      id v32 = 0;
      unsigned __int8 v20 = [v19 cancelForReason:v11 client:a5 needsLSDatabaseSync:buf error:&v32];
      id v21 = v32;
      id v22 = v21;
      id v23 = 0;
      if ((v20 & 1) == 0) {
        id v23 = v21;
      }
      v12[2](v12, buf[0], v23);

LABEL_15:
LABEL_16:

      goto LABEL_17;
    }
    if (a5 != 8)
    {
      uint64_t v24 = [v11 domain];
      if ([v24 isEqualToString:@"IXUserPresentableErrorDomain"])
      {
        id v25 = [v11 code];

        if (v25 == (id)3) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v27 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100096FA0();
      }

      id v29 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]", 740, @"IXErrorDomain", 6uLL, 0, 0, @"Coordinator did not exist for bundle ID %@", v28, (uint64_t)v10);
      v12[2](v12, 0, v29);

      goto LABEL_16;
    }
LABEL_12:
    uint64_t v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]";
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: No coordinator existed for %@, but SpringBoard is canceling so transforming into an uninstall", buf, 0x16u);
    }

    id v23 = (id)objc_opt_new();
    [v23 setRequestUserConfirmation:0];
    [v23 setWaitForDeletion:0];
    [v23 setShowArchiveOption:0];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10006EFE8;
    v30[3] = &unk_1000EAE20;
    id v31 = v12;
    [(IXSClientConnection *)self _remote_uninstallAppWithIdentity:v10 options:v23 completion:v30];

    goto LABEL_15;
  }
  v12[2](v12, 0, v14);
LABEL_17:
}

- (void)_remote_cancelCoordinatorsForAppsWithIdentities:(id)a3 reason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v8 = a3;
  id v33 = a4;
  id v34 = a6;
  id v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v8 count];
    id v11 = IXStringForClientID(a5);
    id v12 = [(IXSClientConnection *)self clientName];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[IXSClientConnection _remote_cancelCoordinatorsForAppsWithIdentities:reason:client:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v11;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v12;
    *(_WORD *)&buf[38] = 2112;
    id v66 = v33;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Bulk cancellation of %d coordinators (client %@) requested by %@ for reason %@", buf, 0x30u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_10006C1D8;
  *(void *)&buf[32] = sub_10006C1E8;
  id v66 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v8;
  id v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v60;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v17 = *(void *)&buf[8];
        id v58 = *(id *)(*(void *)&buf[8] + 40);
        unsigned __int8 v18 = [v16 resolvePersonaWithError:&v58];
        objc_storeStrong((id *)(v17 + 40), v58);
        if ((v18 & 1) == 0)
        {
          (*((void (**)(id, void, void))v34 + 2))(v34, 0, *(void *)(*(void *)&buf[8] + 40));

          goto LABEL_26;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 0;
  id v19 = v33;
  id v20 = [v19 domain];
  id v32 = v19;
  if ([v20 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    id v21 = [v19 userInfo];
    id v22 = [v21 objectForKeyedSubscript:@"AlertUser"];
    unsigned int v23 = sub_100082F48(v22, 0);

    if (!v23)
    {
      char v31 = 0;
      id v37 = v19;
      goto LABEL_18;
    }
    uint64_t v24 = [v19 userInfo];
    id v20 = [v24 mutableCopy];

    [v20 removeObjectForKey:@"AlertUser"];
    id v25 = [v19 domain];
    id v37 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, [v19 code], v20);

    char v31 = 1;
  }
  else
  {
    char v31 = 0;
    id v37 = v19;
  }

LABEL_18:
  uint64_t v26 = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v36 = obj;
  id v27 = [v36 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v53;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v53 != v28) {
          objc_enumerationMutation(v36);
        }
        uint64_t v30 = *(void *)(*((void *)&v52 + 1) + 8 * (void)j);
        dispatch_group_enter(v26);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10006F5F4;
        v48[3] = &unk_1000E9390;
        v50 = buf;
        v51 = v56;
        v49 = v26;
        [(IXSClientConnection *)self _remote_cancelCoordinatorForAppWithIdentity:v30 reason:v37 client:a5 completion:v48];
      }
      id v27 = [v36 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v27);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F684;
  block[3] = &unk_1000EAE48;
  char v47 = v31;
  id v41 = v32;
  id v42 = v36;
  unint64_t v46 = a5;
  id v43 = v34;
  v44 = v56;
  v45 = buf;
  dispatch_group_notify(v26, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v56, 8);
LABEL_26:
  _Block_object_dispose(buf, 8);
}

- (void)_remote_setIsPaused:(BOOL)a3 forCoordinatorForAppWithIdentity:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id v20 = 0;
  unsigned __int8 v10 = [v8 resolvePersonaWithError:&v20];
  id v11 = v20;
  if (v10)
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        int v13 = 89;
      }
      else {
        int v13 = 78;
      }
      uint64_t v14 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315906;
      id v22 = "-[IXSClientConnection _remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:]";
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Setting isPaused to %c for %@ requested by %@", buf, 0x26u);
    }
    unint64_t v15 = +[IXSCoordinatorManager sharedInstance];
    unint64_t v16 = [v15 coordinatorForIdentity:v8];

    if (v16)
    {
      [v16 externalSetIsPaused:v6 completion:v9];
    }
    else
    {
      uint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100097018();
      }

      uint64_t v19 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:]", 813, @"IXErrorDomain", 6uLL, 0, 0, @"Coordinator did not exist for bundle ID %@", v18, (uint64_t)v8);

      v9[2](v9, v19);
      id v11 = (id)v19;
    }
  }
  else
  {
    v9[2](v9, (uint64_t)v11);
  }
}

- (void)_remote_prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v73 = 0;
  unsigned __int8 v8 = [v6 resolvePersonaWithError:&v73];
  id v9 = v73;
  if (v8)
  {
    unsigned __int8 v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
      __int16 v76 = 2112;
      id v77 = v6;
      __int16 v78 = 2112;
      id v79 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Prioritizing coordinator for %@ as requested by %@", buf, 0x20u);
    }
    id v12 = +[IXSCoordinatorManager sharedInstance];
    int v13 = [v12 coordinatorForIdentity:v6];

    if (v13)
    {
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_10007031C;
      v71[3] = &unk_1000EAE70;
      id v72 = v7;
      [v13 prioritizeWithCompletion:v71];
      uint64_t v14 = v72;
LABEL_69:

      goto LABEL_70;
    }
    int v66 = sub_10006706C();
    uint64_t v14 = [v6 bundleID];
    id v70 = v9;
    id v15 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v70];
    id v16 = v70;

    if (v15)
    {
      if ([v15 hasParallelPlaceholder])
      {
        uint64_t v17 = [(IXSClientConnection *)self clientName];
        id v18 = +[NSString stringWithFormat:@"Uninstalling orphaned parallel placeholder for %@ when %@ sent us a prioritize message", v6, v17];

        uint64_t v19 = +[IXSAppUninstaller sharedUninstaller];
        [v19 uninstallParallelPlaceholderForIdentity:v6 reason:v18];

        uint64_t v20 = 1;
LABEL_67:

        goto LABEL_68;
      }
      id v43 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
        __int16 v76 = 2112;
        id v77 = v6;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s: Discovered that app %@ is fully installed when trying to prioritize; this doesn't make sense.",
          buf,
          0x16u);
      }

      if (!v66)
      {
        uint64_t v20 = 0;
LABEL_68:
        (*((void (**)(id, uint64_t, id))v7 + 2))(v7, v20, v16);

        id v9 = v16;
        goto LABEL_69;
      }
      id v18 = +[NSString stringWithFormat:@"Attempted to prioritize app %@ but it was fully installed!", v6];
      sub_10001329C(v18, 0);
LABEL_66:
      uint64_t v20 = 0;
      goto LABEL_67;
    }
    id v21 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
      __int16 v76 = 2112;
      id v77 = v14;
      __int16 v78 = 2112;
      id v79 = v16;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch LSApplicationRecord for application with identifier %@: %@", buf, 0x20u);
    }

    id v69 = 0;
    id v18 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v14 allowPlaceholder:1 error:&v69];
    id v22 = v69;
    __int16 v23 = v22;
    if (!v18)
    {
      v44 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_100097090();
      }

      sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]", 882, @"IXErrorDomain", 1uLL, v23, 0, @"Failed to get a placeholder app record for %@; it does not appear to be installed.",
        v45,
        (uint64_t)v6);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!v66)
      {
        uint64_t v20 = 0;
        id v15 = 0;
        goto LABEL_67;
      }
      unint64_t v46 = +[NSString stringWithFormat:@"Got prioritize for app %@ but it's not installed nor is it a placeholder!", v6];
      sub_10001329C(v46, 0);
      id v15 = 0;
      goto LABEL_65;
    }
    v68 = v22;
    int v24 = MobileInstallationCopyAppMetadata();
    id v16 = v68;

    if (!v24)
    {
      char v47 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_10009710C();
      }

      id v15 = 0;
      if (!v66)
      {
        unint64_t v46 = 0;
LABEL_65:

        goto LABEL_66;
      }
      v48 = +[NSString stringWithFormat:@"Failed to get bundle metadata for %@", v6];
      sub_10001329C(v48, v16);
      unint64_t v46 = 0;
LABEL_64:

      goto LABEL_65;
    }
    id v61 = v16;
    id v64 = [v24 placeholderFailureReason];
    v67 = v24;
    id v62 = [v24 placeholderFailureUnderlyingErrorSource];
    __int16 v25 = [v18 iTunesMetadata];
    id v26 = [v25 distributorInfo];

    v65 = v26;
    unsigned int v27 = [v26 distributorIsThirdParty];
    BOOL v59 = sub_1000392E4(v14, 13);
    BOOL v58 = sub_1000392E4(v14, 2);
    unsigned int v28 = [v18 isAppStoreVendable];
    id v29 = [v18 iTunesMetadata];
    uint64_t v30 = [v29 managementDeclarationIdentifier];

    uint64_t v31 = (uint64_t)v62;
    unsigned int v57 = v27;
    if (v30) {
      int v32 = 1;
    }
    else {
      int v32 = v27;
    }
    if (v28) {
      uint64_t v31 = 1;
    }
    if (v32) {
      unint64_t v33 = 28;
    }
    else {
      unint64_t v33 = v31;
    }
    int IsHardError = IXUserPresentableErrorCodeIsHardError((unint64_t)v64, v33);
    int v35 = IsHardError;
    if (v64 && (IsHardError & 1) != 0)
    {
LABEL_24:
      unint64_t v60 = v33;
      uint64_t v63 = [v67 placeholderFailureUnderlyingError];
      uint64_t v36 = 8;
      if (v28) {
        uint64_t v36 = 0;
      }
      if (v64) {
        id v37 = v64;
      }
      else {
        id v37 = (id)v36;
      }
      __int16 v38 = sub_100004B28((uint64_t)off_100109BB8);
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        id v16 = v61;
        if (v39)
        {
          *(_DWORD *)buf = 136315650;
          v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
          __int16 v76 = 2112;
          id v77 = v6;
          __int16 v78 = 2048;
          id v79 = v37;
          __int16 v40 = "%s: No coordinator found for %@ and error is a hard error (%ld) so showing alert";
          id v41 = v38;
          uint32_t v42 = 32;
LABEL_61:
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
        }
LABEL_62:

        long long v54 = +[IXSErrorPresenter sharedPresenter];
        long long v53 = (void *)v63;
        [v54 presentErrorForIdentity:v6 code:v37 underlyingError:v63 errorSource:v60];
        goto LABEL_63;
      }
      if (v28)
      {
        id v16 = v61;
        if (!v39) {
          goto LABEL_62;
        }
        *(_DWORD *)buf = 136315394;
        v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
        __int16 v76 = 2112;
        id v77 = v6;
        __int16 v40 = "%s: No coordinator found for %@ and prioritize is otherwise unhandled; showing alert";
      }
      else
      {
        id v16 = v61;
        if (!v39) {
          goto LABEL_62;
        }
        *(_DWORD *)buf = 136315394;
        v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
        __int16 v76 = 2112;
        id v77 = v6;
        __int16 v40 = "%s: No coordinator found for %@ and app is not vendable by App Store so showing alert";
      }
      id v41 = v38;
      uint32_t v42 = 22;
      goto LABEL_61;
    }
    if (v59 || v58)
    {
      id v16 = v61;
      unint64_t v49 = 13;
    }
    else
    {
      if (v33 == 23)
      {
        v50 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
          __int16 v76 = 2112;
          id v77 = v6;
          __int16 v78 = 2048;
          id v79 = v64;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s: No coordinator found for %@ and app is vendable by MDM (error %ld); sending message to prioritize by identity.",
            buf,
            0x20u);
        }
        unint64_t v49 = 23;
      }
      else
      {
        if (!v28) {
          goto LABEL_24;
        }
        if (v57) {
          unint64_t v49 = 28;
        }
        else {
          unint64_t v49 = 1;
        }
        v50 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v56 = IXStringForClientID(v49);
          *(_DWORD *)buf = 136315906;
          v75 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
          __int16 v76 = 2112;
          id v77 = v6;
          __int16 v78 = 2048;
          id v79 = v64;
          __int16 v80 = 2112;
          char v81 = v56;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s: No coordinator found for %@ and app is vendable by App Store (error %ld); sending message to prioritize "
            "by identity to %@.",
            buf,
            0x2Au);
        }
      }
      id v16 = v61;
    }
    uint64_t v51 = +[IXSAppInstallObserverManager sharedInstance];
    unint64_t v52 = v49;
    long long v53 = (void *)v51;
    long long v54 = +[NSNumber numberWithUnsignedInteger:v52];
    long long v55 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v54, 0);
    [v53 shouldPrioritizeAppWithIdentity:v6 forClientIDs:v55];

LABEL_63:
    id v15 = 0;

    unint64_t v46 = v67;
    v48 = v65;
    goto LABEL_64;
  }
  (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
LABEL_70:
}

- (void)_remote_purgeRegisteredCoordinatorsAndPromisesForCreator:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v8 = sub_10000D448(v7, @"com.apple.private.InstallCoordination.unitTestRunner");

  id v9 = sub_100004B28((uint64_t)off_100109BB8);
  unsigned __int8 v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = IXStringForClientID(a3);
      id v12 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[IXSClientConnection _remote_purgeRegisteredCoordinatorsAndPromisesForCreator:completion:]";
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      int v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Purging all registered coordinators and promises for creator %@ as requested by %@", buf, 0x20u);
    }
    int v13 = +[IXSCoordinatorManager sharedInstance];
    [v13 clearAllCoordinatorsForCreator:a3];

    uint64_t v14 = +[IXSDataPromiseManager sharedInstance];
    [v14 clearAllPromisesForCreator:a3];

    id v15 = +[IXSPendingOperationsTracker sharedInstance];
    [v15 clearAllPendingOperations];

    v6[2](v6, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100097188(self);
    }

    id v16 = [(IXSClientConnection *)self clientName];
    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_purgeRegisteredCoordinatorsAndPromisesForCreator:completion:]", 980, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v17, (uint64_t)v16);

    v6[2](v6, v18);
    id v6 = (void (**)(id, void))v18;
  }
}

- (void)_remote_killDaemonForTestingWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v6 = sub_10000D448(v5, @"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  unsigned __int8 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[IXSClientConnection _remote_killDaemonForTestingWithCompletion:]";
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Exiting because testing client %@ told us to", buf, 0x16u);
    }
    exit(1);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100097218(self);
  }

  id v9 = [(IXSClientConnection *)self clientName];
  id v11 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_killDaemonForTestingWithCompletion:]", 1000, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v10, (uint64_t)v9);

  v4[2](v4, v11);
}

- (void)_remote_pingDaemonWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v6 = sub_10000D448(v5, @"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  unsigned __int8 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[IXSClientConnection _remote_pingDaemonWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Ping", buf, 0xCu);
    }

    uint64_t v9 = getpid();
    v4[2](v4, v9, 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000972A8(self);
    }

    uint64_t v10 = [(IXSClientConnection *)self clientName];
    uint64_t v12 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_pingDaemonWithCompletion:]", 1017, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v11, (uint64_t)v10);

    v4[2](v4, 0xFFFFFFFFLL, v12);
    id v4 = (void (**)(id, uint64_t, void))v12;
  }
}

- (void)_remote_fakeClientDeathWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v6 = sub_10000D448(v5, @"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  unsigned __int8 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[IXSClientConnection _remote_fakeClientDeathWithCompletion:]";
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Faking death of client %@", buf, 0x16u);
    }
    [(IXSClientConnection *)self setFakeClientProcessDeath:1];
    [(IXSClientConnection *)self cancelOrphanedPromisesAndRemovePromiseReferences];
    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100097338(self);
    }

    uint64_t v10 = [(IXSClientConnection *)self clientName];
    uint64_t v12 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_fakeClientDeathWithCompletion:]", 1033, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v11, (uint64_t)v10);

    v4[2](v4, v12);
    id v4 = (void (**)(id, void))v12;
  }
}

- (void)_remote_postNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v6 = sub_10000D448(v5, @"com.apple.private.InstallCoordination.unitTestRunner");

  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  unsigned __int8 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[IXSClientConnection _remote_postNSCurrentLocaleDidChangeNotification:]";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Posting NSCurrentLocaleDidChangeNotification because testing client %@ told us to", buf, 0x16u);
    }
    uint64_t v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:NSCurrentLocaleDidChangeNotification object:0];

    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000973C8(self);
    }

    uint64_t v11 = [(IXSClientConnection *)self clientName];
    uint64_t v13 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_postNSCurrentLocaleDidChangeNotification:]", 1059, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v12, (uint64_t)v11);

    v4[2](v4, v13);
    id v4 = (void (**)(id, void))v13;
  }
}

- (void)_remote_setTestingEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  unsigned __int8 v6 = (void (**)(id, void))a4;
  id v7 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v8 = sub_10000D448(v7, @"com.apple.private.InstallCoordination.unitTestRunner");

  uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        int v11 = 89;
      }
      else {
        int v11 = 78;
      }
      uint64_t v12 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSClientConnection _remote_setTestingEnabled:completion:]";
      __int16 v18 = 1024;
      int v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Setting testing enabled to %c by client %@", buf, 0x1Cu);
    }
    if (v4) {
      sub_100039494();
    }
    else {
      sub_1000394A8();
    }
    v6[2](v6, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100097458(self);
    }

    uint64_t v13 = [(IXSClientConnection *)self clientName];
    uint64_t v15 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_setTestingEnabled:completion:]", 1077, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v14, (uint64_t)v13);

    v6[2](v6, v15);
    unsigned __int8 v6 = (void (**)(id, void))v15;
  }
}

- (void)_remote_setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void))a6;
  uint64_t v13 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v14 = sub_10000D448(v13, @"com.apple.private.InstallCoordination.unitTestRunner");

  uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
  __int16 v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315906;
      id v22 = "-[IXSClientConnection _remote_setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:completion:]";
      __int16 v23 = 2048;
      unint64_t v24 = a4;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      unsigned int v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Setting test mode %lu for bundle prefix %@ by client %@", buf, 0x2Au);
    }
    sub_1000392EC(v10, a4, v11);
    v12[2](v12, 0);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000974E8(self);
    }

    __int16 v18 = [(IXSClientConnection *)self clientName];
    uint64_t v20 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:completion:]", 1099, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing test runner entitlement.", v19, (uint64_t)v18);

    v12[2](v12, v20);
    uint64_t v12 = (void (**)(id, void))v20;
  }
}

- (void)_remote_registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  id v10 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v11 = sub_10000D448(v10, @"com.apple.private.InstallCoordination.diskImageContentRegistration");

  if ((v11 & 1) == 0)
  {
    __int16 v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100097608(self);
    }

    unsigned __int8 v14 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_registerContentsForDiskImageAtURL:options:completion:]", 1139, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing disk image (client registration/unregistration) operation entitlement.", v17, (uint64_t)v14);
    goto LABEL_9;
  }
  uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
  uint64_t v13 = v12;
  if (a4)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100097578(self);
    }

    unsigned __int8 v14 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_registerContentsForDiskImageAtURL:options:completion:]", 1145, @"IXErrorDomain", 0x35uLL, 0, 0, @"Client %@ has passed non-nil options.", v15, (uint64_t)v14);
LABEL_9:
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v18);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v8 path];
    uint64_t v20 = [(IXSClientConnection *)self clientName];
    *(_DWORD *)buf = 136315650;
    __int16 v23 = "-[IXSClientConnection _remote_registerContentsForDiskImageAtURL:options:completion:]";
    __int16 v24 = 2112;
    __int16 v25 = v19;
    __int16 v26 = 2112;
    __int16 v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Registering contents for disk image mounted at %@ by client %@", buf, 0x20u);
  }
  uint64_t v21 = MobileInstallationRegisterContentsForDiskImageAtURL();
  id v18 = 0;
  v9[2](v9, v21, v18);
LABEL_10:
}

- (void)_remote_unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  id v10 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v11 = sub_10000D448(v10, @"com.apple.private.InstallCoordination.diskImageContentRegistration");

  if ((v11 & 1) == 0)
  {
    uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000977A4(self);
    }

    uint64_t v13 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]", 1163, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing disk image (contents registration/unregistration) operation entitlement.", v16, (uint64_t)v13);
    goto LABEL_9;
  }
  if (a4)
  {
    uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100097714(self);
    }

    uint64_t v13 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]", 1169, @"IXErrorDomain", 0x35uLL, 0, 0, @"Client %@ has passed non-nil options.", v14, (uint64_t)v13);
LABEL_9:
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v17);
    goto LABEL_10;
  }
  id v18 = [v8 path];
  uint64_t v19 = realpath_DARWIN_EXTSN((const char *)[v18 fileSystemRepresentation], 0);
  if (v19)
  {
    uint64_t v20 = +[NSString stringWithFileSystemRepresentation:v19];
    uint64_t v21 = 0;
  }
  else
  {
    id v22 = __error();
    unint64_t v51 = *v22;
    strerror(*v22);
    uint64_t v21 = sub_10003DAE4((uint64_t)"_SanitizedRealPath", 1119, NSPOSIXErrorDomain, v51, 0, 0, @"Failed to retrieve realpath for %@ : %d (%s)", v23, (uint64_t)v18);
    uint64_t v20 = 0;
  }
  free(v19);
  if (v20) {
    id v24 = 0;
  }
  else {
    id v24 = v21;
  }

  id v56 = v24;
  if (!v20)
  {
    id v43 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v50 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315906;
      v65 = "-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]";
      __int16 v66 = 2112;
      v67 = v50;
      __int16 v68 = 2112;
      id v69 = v18;
      __int16 v70 = 2112;
      id v71 = v56;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s: Client %@ has passed an invalid disk image path %@ : %@", buf, 0x2Au);
    }
    v44 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]", 1180, @"IXErrorDomain", 0x35uLL, v56, 0, @"Client %@ has passed an invalid disk image path %@", v45, (uint64_t)v44);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v17);
    goto LABEL_47;
  }
  unint64_t v52 = self;
  id v53 = v18;
  long long v54 = v9;
  id v55 = v8;
  __int16 v25 = +[LSApplicationRecord enumeratorWithOptions:0];
  __int16 v26 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v27 = v25;
  id v28 = [v27 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (!v28) {
    goto LABEL_30;
  }
  id v29 = v28;
  uint64_t v30 = *(void *)v60;
  do
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v60 != v30) {
        objc_enumerationMutation(v27);
      }
      int v32 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      unint64_t v33 = [v32 URL];
      id v34 = [v33 path];
      if ([v34 hasPrefix:v20])
      {
        unsigned __int8 v35 = [v32 isPlaceholder];

        if (v35) {
          continue;
        }
        unint64_t v33 = [v32 bundleIdentifier];
        [v26 addObject:v33];
      }
      else
      {
      }
    }
    id v29 = [v27 countByEnumeratingWithState:&v59 objects:v63 count:16];
  }
  while (v29);
LABEL_30:

  if (![v26 count])
  {
    id v39 = 0;
    id v41 = v56;
    goto LABEL_38;
  }
  uint64_t v36 = [IXSTerminationAssertion alloc];
  id v37 = [v26 copy];
  __int16 v38 = +[NSString stringWithFormat:@"Unregistering %@ for unmounting disk image at %@", v26, v20];
  id v58 = v56;
  id v39 = [(IXSTerminationAssertion *)v36 initForBundleIDs:v37 description:v38 terminationResistance:40 error:&v58];
  id v17 = v58;

  if (v39)
  {
    id v57 = v17;
    unsigned int v40 = [v39 acquireAssertion:&v57];
    id v41 = v57;

    if (!v40)
    {
      uint64_t v42 = 0;
      id v17 = v41;
      goto LABEL_46;
    }
LABEL_38:
    unint64_t v46 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      char v47 = [(IXSClientConnection *)v52 clientName];
      *(_DWORD *)buf = 136315650;
      v65 = "-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]";
      __int16 v66 = 2112;
      v67 = v20;
      __int16 v68 = 2112;
      id v69 = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s: Unregistering contents on disk image mounted at %@ by client %@", buf, 0x20u);
    }
    char v48 = MobileInstallationUnregisterContentsForDiskImageAtURL();
    id v17 = v41;

    if (v48)
    {
      uint64_t v42 = 1;
      goto LABEL_46;
    }
    unint64_t v49 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_100097698();
    }
  }
  uint64_t v42 = 0;
LABEL_46:
  uint64_t v9 = v54;
  [v39 invalidate];
  v9[2](v9, v42, v17);

  id v8 = v55;
  id v18 = v53;
LABEL_47:

LABEL_10:
}

- (void)_remote_removabilityForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v17 = 0;
  unsigned __int8 v8 = [v6 resolvePersonaWithError:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = [v6 bundleID];
    unsigned __int8 v11 = +[IXSAppRemovabilityManager sharedInstance];
    uint64_t v12 = [v11 removabilityMetadataForAppWithIdentity:v6];

    id v13 = [v12 removability];
    uint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = IXStringForAppRemovability((unint64_t)v13);
      uint64_t v16 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = "-[IXSClientConnection _remote_removabilityForAppWithIdentity:completion:]";
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      __int16 v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Returning removability %@ for %@ to client %@", buf, 0x2Au);
    }
    v7[2](v7, v13, 0);
  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }
}

- (void)_remote_removabilityForAppWithIdentity:(id)a3 byClient:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id, void))a5;
  id v19 = 0;
  unsigned __int8 v10 = [v8 resolvePersonaWithError:&v19];
  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = [v8 bundleID];
    id v13 = +[IXSAppRemovabilityManager sharedInstance];
    id v14 = [v13 removabilityForAppWithIdentity:v8 client:a4];

    uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = IXStringForAppRemovability((unint64_t)v14);
      id v17 = IXStringForAppRemovabilityClient(a4);
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = "-[IXSClientConnection _remote_removabilityForAppWithIdentity:byClient:completion:]";
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v17;
      __int16 v28 = 2112;
      id v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Returning removability %@ set for %@ by client %@ to caller %@", buf, 0x34u);
    }
    v9[2](v9, v14, 0);
  }
  else
  {
    ((void (**)(id, id, id))v9)[2](v9, 0, v11);
  }
}

- (void)_remote_setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t))a6;
  id v31 = 0;
  unsigned __int8 v12 = [v10 resolvePersonaWithError:&v31];
  id v13 = v31;
  if (v12)
  {
    id v29 = [v10 bundleID];
    id v14 = [(IXSClientConnection *)self xpcConnection];
    unsigned __int8 v15 = sub_10000D448(v14, @"com.apple.springboard.application-removability.proxy");
    uint64_t v16 = sub_100004B28((uint64_t)off_100109BB8);
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = IXStringForAppRemovability(a3);
        id v19 = [(IXSClientConnection *)self clientName];
        __int16 v20 = IXStringForAppRemovabilityClient(a5);
        *(_DWORD *)buf = 136316162;
        unint64_t v33 = "-[IXSClientConnection _remote_setRemovability:forAppWithIdentity:byClient:completion:]";
        __int16 v34 = 2112;
        unsigned __int8 v35 = v29;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = v19;
        __int16 v40 = 2112;
        id v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Setting removability for %@ to %@ for client %@ with type %@", buf, 0x34u);
      }
      uint64_t v21 = +[IXSAppRemovabilityManager sharedInstance];
      id v30 = v13;
      unsigned __int8 v22 = [v21 setRemovability:a3 forAppWithIdentity:v10 byClient:a5 error:&v30];
      id v23 = v30;

      if (v22)
      {
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v24 = (uint64_t)v23;
        if (!v23)
        {
          id v27 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100097834();
          }

          uint64_t v24 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_setRemovability:forAppWithIdentity:byClient:completion:]", 1374, @"IXErrorDomain", 0xEuLL, 0, 0, @"-[IXSAppRemovabilityManager setRemovability:] for %@ returned NO but did not set an error.", v28, (uint64_t)v29);
          id v23 = (id)v24;
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000978AC(self);
      }

      id v25 = [(IXSClientConnection *)self clientName];
      uint64_t v24 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_setRemovability:forAppWithIdentity:byClient:completion:]", 1360, @"IXErrorDomain", 4uLL, 0, 0, @"Client %@ is missing %@ entitlement, rejecting attempt to set app removability.", v26, (uint64_t)v25);

      id v23 = (id)v24;
    }
    v11[2](v11, v24);

    id v13 = v23;
  }
  else
  {
    v11[2](v11, (uint64_t)v13);
  }
}

- (void)_remote_removabilityDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id, id, void))a3;
  uint64_t v5 = [(IXSClientConnection *)self xpcConnection];
  unsigned __int8 v6 = sub_10000D448(v5, @"com.apple.springboard.application-removability.proxy");
  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000979CC(self, v8);
    }

    id v9 = +[IXSAppRemovabilityManager sharedInstance];
    id v22 = 0;
    id v10 = [v9 removabilityDataWithChangeClock:&v22];
    id v11 = v22;

    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000723C0;
      v20[3] = &unk_1000E9E10;
      id v21 = (id)objc_opt_new();
      id v12 = v21;
      [v10 enumerateKeysAndObjectsUsingBlock:v20];
      id v13 = [v12 copy];
      v4[2](v4, v13, v11, 0);

      id v14 = 0;
    }
    else
    {
      id v17 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100097948();
      }

      id v14 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_removabilityDataWithCompletion:]", 1401, @"IXErrorDomain", 1uLL, 0, 0, @"Unexpectedly received nil value for app removability data", v18, v19);
      ((void (**)(id, id, id, void *))v4)[2](v4, 0, 0, v14);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100097A78(self);
    }

    unsigned __int8 v15 = [(IXSClientConnection *)self clientName];
    id v14 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_removabilityDataWithCompletion:]", 1389, @"IXErrorDomain", 4uLL, 0, 0, @"Client %@ is missing %@ entitlement, rejecting attempt to read app removability data.", v16, (uint64_t)v15);

    ((void (**)(id, id, id, void *))v4)[2](v4, 0, 0, v14);
  }
}

- (void)_remote_uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = [(IXSClientConnection *)self xpcConnection];
  if ((sub_10000D448(v11, @"com.apple.private.InstallCoordination.uninstall") & 1) == 0)
  {
    id v12 = sub_10000D560(v11, @"UninstallForLaunchServices");

    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14) {
        sub_100097D88(self);
      }

      unsigned __int8 v15 = [(IXSClientConnection *)self clientName];
      sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]", 1428, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing entitlement \"%@\" : TRUE (BOOLean) to uninstall applications", v16, (uint64_t)v15);
LABEL_46:
      id v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_47:
      v10[2](v10, 0, v20);
      goto LABEL_48;
    }
    if (v14) {
      sub_100097CC4(self, v13);
    }
  }
  if ([v9 ignoreRemovability]
    && (sub_10000D448(v11, @"com.apple.private.InstallCoordination.ignoreRemovability") & 1) == 0)
  {
    uint64_t v24 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100097C34(self);
    }

    unsigned __int8 v15 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]", 1436, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing ignore removability operation entitlement.", v25, (uint64_t)v15);
    goto LABEL_46;
  }
  if ([v9 ignoreRestrictions]
    && (sub_10000D448(v11, @"com.apple.private.InstallCoordination.ignoreRestrictions") & 1) == 0)
  {
    uint64_t v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100097BA4(self);
    }

    unsigned __int8 v15 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]", 1444, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing ignore restrictions operation entitlement.", v27, (uint64_t)v15);
    goto LABEL_46;
  }
  if ([v9 ignoreAppProtection]
    && (sub_10000D448(v11, @"com.apple.private.InstallCoordination.ignoreAppProtection") & 1) == 0)
  {
    uint64_t v28 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100097B14(self);
    }

    unsigned __int8 v15 = [(IXSClientConnection *)self clientName];
    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]", 1452, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing ignore app protection operation entitlement.", v29, (uint64_t)v15);
    goto LABEL_46;
  }
  id v17 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(IXSClientConnection *)self clientName];
    *(_DWORD *)buf = 136315906;
    __int16 v34 = "-[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]";
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    __int16 v38 = v18;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Uninstall of %@ requested by client %@ with uninstall options %@", buf, 0x2Au);
  }
  id v32 = 0;
  unsigned __int8 v19 = [v8 resolvePersonaWithError:&v32];
  id v20 = v32;
  if ((v19 & 1) == 0) {
    goto LABEL_47;
  }
  if ([v9 requestUserConfirmation]) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 0;
  }
  if ([v9 waitForDeletion]) {
    v21 |= 4uLL;
  }
  if ([v9 showArchiveOption]) {
    v21 |= 8uLL;
  }
  if ([v9 systemAppNotAllowed]) {
    v21 |= 0x10uLL;
  }
  if ([v9 showDemotionOption]) {
    v21 |= 0x20uLL;
  }
  if ([v9 ignoreRemovability]) {
    v21 |= 0x40uLL;
  }
  if ([v9 ignoreRestrictions]) {
    v21 |= 0x80uLL;
  }
  if ([v9 ignoreAppProtection]) {
    v21 |= 0x100uLL;
  }
  id v22 = +[IXSAppUninstaller sharedUninstaller];
  id v23 = [(IXSClientConnection *)self clientName];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10007296C;
  v30[3] = &unk_1000EAE20;
  id v31 = v10;
  [v22 uninstallAppWithIdentity:v8 clientName:v23 options:v21 completion:v30];

LABEL_48:
}

- (void)_remote_revertAppWithIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v13 = 0;
  unsigned __int8 v8 = [v6 resolvePersonaWithError:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v15 = "-[IXSClientConnection _remote_revertAppWithIdentity:completion:]";
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      unsigned __int8 v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Revert of %@ requested by client %@", buf, 0x20u);
    }
    id v12 = [(IXSClientConnection *)self clientName];
    +[IXSRevertManager revertAppWithIdentity:v6 forClientWithName:v12 completion:v7];
  }
  else
  {
    v7[2](v7, 0, v9);
  }
}

- (void)_remote_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t))a6;
  id v31 = 0;
  unsigned __int8 v13 = [v10 resolvePersonaWithError:&v31];
  id v14 = v31;
  if (v13)
  {
    unsigned __int8 v15 = [(IXSClientConnection *)self xpcConnection];
    if ((sub_10000D448(v15, @"com.apple.private.InstallCoordination.refreshContainerTypes") & 1) == 0)
    {
      id v30 = v15;
      __int16 v16 = sub_10000D560(v15, @"UninstallForLaunchServices");

      id v17 = sub_100004B28((uint64_t)off_100109BB8);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v18) {
          sub_100097F7C(self);
        }

        unsigned __int8 v19 = [(IXSClientConnection *)self clientName];
        uint64_t v21 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]", 1528, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing entitlement \"%@\" = TRUE (BOOLean) to refresh containers", v20, (uint64_t)v19);

        v12[2](v12, v21);
        id v14 = (id)v21;
        unsigned __int8 v15 = v30;
LABEL_18:

        goto LABEL_19;
      }
      if (v18) {
        sub_100097EB8(self, v17);
      }

      unsigned __int8 v15 = v30;
    }
    id v22 = sub_100004B28((uint64_t)off_100109BB8);
    id v23 = v22;
    if (v11)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(IXSClientConnection *)self clientName];
        *(_DWORD *)buf = 136315906;
        unint64_t v33 = "-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]";
        __int16 v34 = 2048;
        unint64_t v35 = a3;
        __int16 v36 = 2112;
        id v37 = v10;
        __int16 v38 = 2112;
        __int16 v39 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Refreshing container types 0x%lx of %@ requested by client %@", buf, 0x2Au);
      }
      uint64_t v25 = +[IXSContainerRefreshManager sharedInstance];
      [v25 refreshContainerTypes:a3 forAppWithIdentity:v10 reason:v11 completion:v12];
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100097E24(v23, v26, v27);
      }

      uint64_t v29 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]", 1534, @"IXErrorDomain", 4uLL, 0, 0, @"Reason passed to %s was nil!", v28, (uint64_t)"-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]");

      v12[2](v12, v29);
      id v14 = (id)v29;
    }
    goto LABEL_18;
  }
  v12[2](v12, (uint64_t)v14);
LABEL_19:
}

- (void)_remote_registerObserverMachServiceName:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IXSClientConnection *)self clientName];
    int v13 = 136316162;
    id v14 = "-[IXSClientConnection _remote_registerObserverMachServiceName:forClientIdentifiers:respondingToSelectors:]";
    __int16 v15 = 2112;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Client %@ registered mach service name %@ for client identifiers %@ responding to selectors %lu", (uint8_t *)&v13, 0x34u);
  }
  id v12 = +[IXSAppInstallObserverManager sharedInstance];
  [v12 registerMachServiceName:v8 forClientIDs:v9 respondingToSelectors:a5];
}

- (void)_remote_registerTransientObserver:(id)a3 forClientIdentifiers:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(IXSClientConnection *)self clientName];
    int v13 = 136316162;
    id v14 = "-[IXSClientConnection _remote_registerTransientObserver:forClientIdentifiers:respondingToSelectors:]";
    __int16 v15 = 2112;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Client %@ registered transient observer %@ for client identifiers %@ responding to selectors %lu", (uint8_t *)&v13, 0x34u);
  }
  id v12 = +[IXSAppInstallObserverManager sharedInstance];
  [v12 registerListenerEndpoint:v8 forClientIDs:v9 respondingToSelectors:a5];
}

- (void)_remote_displayUserPresentableErrorForApp:(id)a3 code:(int64_t)a4
{
  id v6 = (char *)a3;
  id v7 = v6;
  if (!v6)
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(IXSClientConnection *)self clientName];
      int v11 = 136315650;
      id v12 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApp:code:]";
      __int16 v13 = 2080;
      id v14 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApp:code:]";
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Got nil identity in call to %s from client %@", (uint8_t *)&v11, 0x20u);
    }
    goto LABEL_8;
  }
  if (([v6 resolvePersonaWithError:0] & 1) == 0)
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApp:code:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to resolve persona for %@", (uint8_t *)&v11, 0x16u);
    }
LABEL_8:

    goto LABEL_9;
  }
  id v8 = +[IXSErrorPresenter sharedPresenter];
  [v8 presentErrorForIdentity:v7 code:a4 underlyingError:0 errorSource:0];

LABEL_9:
}

- (void)_remote_displayUserPresentableErrorForApps:(id)a3 code:(int64_t)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "resolvePersonaWithError:", 0, (void)v13) & 1) == 0)
        {
          id v12 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v18 = "-[IXSClientConnection _remote_displayUserPresentableErrorForApps:code:]";
            __int16 v19 = 2112;
            id v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to resolve persona for %@", buf, 0x16u);
          }

          int v11 = v5;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v11 = +[IXSErrorPresenter sharedPresenter];
  [v11 presentErrorForIdentities:v5 code:a4 underlyingError:0 errorSource:0];
LABEL_13:
}

- (void)_remote_displayUserPresentableErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IXSErrorPresenter sharedPresenter];
  [v6 presentErrorForAppWithLocalizedName:v5 code:a4 underlyingError:0 errorSource:0];
}

- (void)_remote_addObserversForCoordinatorsWithUUIDs:(id)a3 fireObserverMethods:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(IXSClientConnection *)self addInterestedCoordinatorUUIDs:v6];
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        int v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v11);
          long long v14 = +[IXSCoordinatorManager sharedInstance];
          long long v15 = [v14 coordinatorForUUID:v12];

          if (v15)
          {
            objc_msgSend(v15, "_remote_fireObserversForClient:completion:", self, &stru_1000EAEB0);
          }
          else
          {
            long long v16 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v25 = "-[IXSClientConnection _remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:]";
              __int16 v26 = 2112;
              uint64_t v27 = v12;
              __int16 v28 = 2112;
              uint64_t v29 = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to locate coordinator with UUID %@ when trying to add observer for it : %@", buf, 0x20u);
            }

            id v18 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:]", 1623, @"IXErrorDomain", 6uLL, 0, 0, @"Failed to locate coordinator with UUID %@ when trying to add observer for it", v17, v12);
            [(IXSClientConnection *)self _client_coordinatorWithUUID:v12 didCancelWithReason:v18 client:15];
          }
          int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v9);
    }

    id v6 = v19;
  }
}

- (void)_remote_removeObserverForCoordinatorWithUUID:(id)a3
{
}

- (void)_remote_addObserversForDataPromisesWithUUIDs:(id)a3
{
}

- (void)_remote_removeObserverForDataPromiseWithUUID:(id)a3
{
}

- (void)_remote_updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v25 = 0;
  unsigned __int8 v14 = [v10 resolvePersonaWithError:&v25];
  id v15 = v25;
  if (v14)
  {
    long long v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      uint64_t v27 = "-[IXSClientConnection _remote_updateSINFForAppWithIdentity:sinfData:options:completion:]";
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: \"%@\" wants to update the SINF of %@", buf, 0x20u);
    }
    +[IXSCoordinatorManager sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100073990;
    v19[3] = &unk_1000EAED8;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = v10;
    id v22 = v12;
    id v23 = v11;
    id v24 = v13;
    id v18 = v20;
    [v18 performCreationBlockingOperation:v19];
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }
}

- (void)_remote_updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v25 = 0;
  unsigned __int8 v11 = [v9 resolvePersonaWithError:&v25];
  id v12 = v25;
  if (v11)
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v14 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      uint64_t v27 = "-[IXSClientConnection _remote_updateiTunesMetadata:forAppWithIdentity:completion:]";
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: \"%@\" wants to update the iTunesMetadata of %@", buf, 0x20u);
    }
    id v15 = [(IXSClientConnection *)self xpcConnection];
    id v24 = v12;
    sub_10000D83C(v8, v15, @"updated metadata", &v24);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v24;

    if (v16)
    {
      +[IXSCoordinatorManager sharedInstance];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100073DD0;
      v19[3] = &unk_1000E8FD0;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = v9;
      id v16 = v16;
      id v22 = v16;
      id v23 = v10;
      id v18 = v20;
      [v18 performCreationBlockingOperation:v19];
    }
    else
    {
      (*((void (**)(id, id))v10 + 2))(v10, v17);
    }
    id v12 = v17;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
    id v16 = 0;
  }
}

- (void)_fetchIXSCoordinatedAppInstallForUUID:(id)a3 method:(const char *)a4 andRunWithCoordinator:(id)a5 error:(id)a6
{
  id v10 = a3;
  unsigned __int8 v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSCoordinatorManager sharedInstance];
  unsigned __int8 v14 = [v13 coordinatorForUUID:v10];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Coordinator did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    id v19 = [(IXSClientConnection *)self clientName];
    id v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:]", 1769, @"IXErrorDomain", 6uLL, 0, 0, @"Coordinator did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 appAssetPromiseHasBegunFulfillment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074314;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000743A0;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000743AC;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:appAssetPromiseHasBegunFulfillment:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074584;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v24 = v10;
  id v14 = v10;
  dispatch_sync(v13, block);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100074610;
  v19[3] = &unk_1000EAF28;
  id v20 = v11;
  unint64_t v22 = a5;
  id v21 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100074620;
  v17[3] = &unk_1000EAE70;
  id v18 = v21;
  id v15 = v21;
  id v16 = v11;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v14, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:cancelForReason:client:completion:]", v19, v17);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 fireObserversWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000747C8;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100074854;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100074860;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:fireObserversWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074A00;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100074A8C;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100074BBC;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getAppAssetPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getAppAssetPromiseDRI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074D60;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100074DEC;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100074DF8;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getAppAssetPromiseDRI:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074F9C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100075028;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075034;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getCoordinationState:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getErrorInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000751D8;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100075264;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075270;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getErrorInfo:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInitialODRAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075418;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000754A4;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075678;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getInitialODRAssetPromises:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007581C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000758A8;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000758B4;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getIsComplete:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getIsPausedWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075A58;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100075AE4;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075AF0;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getIsPausedWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075C98;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100075D24;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075E54;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPlaceholderPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPreparationPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075FFC;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076088;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000761B8;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPreparationPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076360;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000763EC;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007651C;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getUserDataPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getDeviceSecurityPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000766C4;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076750;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100076880;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getDeviceSecurityPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getHasDeviceSecurityPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076A24;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076AB0;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100076ABC;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getHasDeviceSecurityPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setNeedsPostProcessing:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076C68;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100076CF4;
  v15[3] = &unk_1000EAFC8;
  BOOL v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076D04;
  v13[3] = &unk_1000EAE70;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v11, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setNeedsPostProcessing:completion:]", v15, v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getNeedsPostProcessing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076EA0;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076F2C;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100076F38;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getNeedsPostProcessing:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPostProcessingShouldBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000770DC;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100077168;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077174;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPostProcessingShouldBegin:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setEssentialAssetPromiseUUIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007733C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000773C8;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000773D4;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setEssentialAssetPromiseUUIDs:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getEssentialAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077574;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100077600;
  v13[3] = &unk_1000EAF50;
  void v13[4] = self;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000777D4;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getEssentialAssetPromises:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasEssentialAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077978;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100077A04;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077A10;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasEssentialAssetPromises:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getUserDataRestoreShouldBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077BB4;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100077C40;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077C4C;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getUserDataRestoreShouldBegin:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasAppAssetPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077DF0;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100077E7C;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100077E88;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasAppAssetPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInitialODRAssetPromises:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007802C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000780B8;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000780C4;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasInitialODRAssetPromises:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasInstallOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078268;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000782F4;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100078300;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasInstallOptions:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getInstallOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000784A4;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100078530;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007853C;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getInstallOptions:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasPlaceholderPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000786E0;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007876C;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100078778;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasPlaceholderPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 hasUserDataPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007891C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000789A8;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000789B4;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:hasUserDataPromise:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setImportance:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078B60;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100078BEC;
  v15[3] = &unk_1000EAFF0;
  unint64_t v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100078BF8;
  v13[3] = &unk_1000EAE70;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v11, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setImportance:completion:]", v15, v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 importanceWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078D94;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100078E20;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100078E2C;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:importanceWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 conveyPriorityReplacingExisting:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078FDC;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079068;
  v15[3] = &unk_1000EB018;
  BOOL v17 = a4;
  void v15[4] = self;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000790E4;
  v13[3] = &unk_1000EAE70;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v11, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:conveyPriorityReplacingExisting:withCompletion:]", v15, v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 prioritizeWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079280;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007930C;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100079318;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:prioritizeWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setTargetGizmoPairingID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000794D8;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100079564;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079570;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setTargetGizmoPairingID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 targetGizmoPairingIDWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007970C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100079798;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000797A4;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:targetGizmoPairingIDWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseDRI:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079950;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000799DC;
  v15[3] = &unk_1000EAFF0;
  unint64_t v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000799E8;
  v13[3] = &unk_1000EAE70;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v11, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setAppAssetPromiseDRI:completion:]", v15, v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setAppAssetPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079BA8;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v22 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100079C34;
  v17[3] = &unk_1000EB040;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079CAC;
  v15[3] = &unk_1000EAE70;
  id v16 = v20;
  id v13 = v20;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setAppAssetPromiseUUID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInitialODRAssetPromiseUUIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079E6C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100079EF8;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079F04;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setInitialODRAssetPromiseUUIDs:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setInstallOptionsPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A0C4;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v22 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007A150;
  v17[3] = &unk_1000EB040;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007A1C8;
  v15[3] = &unk_1000EAE70;
  id v16 = v20;
  id v13 = v20;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setInstallOptionsPromiseUUID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setIsPaused:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A36C;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v19 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007A3F8;
  v15[3] = &unk_1000EAFC8;
  BOOL v17 = a4;
  id v16 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007A408;
  v13[3] = &unk_1000EAE70;
  id v14 = v16;
  id v12 = v16;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v11, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setIsPaused:completion:]", v15, v13);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A5C8;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007A654;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007A660;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPlaceholderPromiseUUID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPreparationPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A820;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007A8AC;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007A8B8;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPreparationPromiseUUID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setUserDataPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007AA78;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007AB04;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007AB10;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setUserDataPromiseUUID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setDeviceSecurityPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007ACD0;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007AD5C;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007AD68;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setDeviceSecurityPromiseUUID:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getCoordinatorScopeWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007AF04;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007AF90;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007AF9C;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getCoordinatorScopeWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 convertToGloballyScopedWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B140;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007B1CC;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007B1D8;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:convertToGloballyScopedWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setPlaceholderDisposition:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSClientConnection *)self xpcConnection];
  if (sub_10000D448(v10, @"com.apple.private.InstallCoordination.overridePlaceholderDisposition"))
  {
    id v11 = [(IXSClientConnection *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007B450;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v12 = v8;
    id v23 = v12;
    dispatch_sync(v11, block);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10007B4DC;
    v19[3] = &unk_1000EAFF0;
    unint64_t v21 = a4;
    id v20 = v9;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007B4E8;
    v17[3] = &unk_1000EAE70;
    id v18 = v20;
    -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPlaceholderDisposition:completion:]", v19, v17);
  }
  else
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100099CA8(self);
    }

    id v14 = [(IXSClientConnection *)self clientName];
    id v16 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setPlaceholderDisposition:completion:]", 2079, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ is missing entitlement to set placeholder disposition.", v15, (uint64_t)v14);

    (*((void (**)(id, void *))v9 + 2))(v9, v16);
  }
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getPlaceholderDispositionWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B684;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007B710;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007B71C;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getPlaceholderDispositionWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setProgressHint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B8E4;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v21 = v8;
  id v12 = v8;
  dispatch_sync(v11, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007B970;
  v17[3] = &unk_1000EAF50;
  id v18 = v9;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007B97C;
  v15[3] = &unk_1000EAE70;
  id v16 = v19;
  id v13 = v19;
  id v14 = v9;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v12, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setProgressHint:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 getProgressHintWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BB18;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007BBA4;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007BBB0;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:getProgressHintWithCompletion:]", v13, v11);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 setRemovability:(unint64_t)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BD68;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v22 = v10;
  id v13 = v10;
  dispatch_sync(v12, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007BDF4;
  v17[3] = &unk_1000EB068;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v18 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007BE04;
  v15[3] = &unk_1000EAE70;
  id v16 = v18;
  id v14 = v18;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v13, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:setRemovability:byClient:completion:]", v17, v15);
}

- (void)_remote_IXSCoordinatedAppInstall:(id)a3 removabilityWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IXSClientConnection *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BFA0;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v16 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007C02C;
  v13[3] = &unk_1000EAF00;
  id v14 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007C038;
  v11[3] = &unk_1000EAE70;
  id v12 = v14;
  id v10 = v14;
  -[IXSClientConnection _fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:](self, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:", v9, "-[IXSClientConnection _remote_IXSCoordinatedAppInstall:removabilityWithCompletion:]", v13, v11);
}

- (void)_fetchDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSDataPromiseManager sharedInstance];
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class()];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: DataPromise did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    unint64_t v19 = [(IXSClientConnection *)self clientName];
    BOOL v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:]", 2190, @"IXErrorDomain", 3uLL, 0, 0, @"DataPromise did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSDataPromise:(id)a3 getPercentComplete:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007C368;
  v9[3] = &unk_1000EB090;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007C374;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:getPercentComplete:]", v9, v7);
}

- (void)_remote_IXSDataPromise:(id)a3 setPercentComplete:(double)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007C404;
  v4[3] = &unk_1000EB0B0;
  *(double *)&v4[4] = a4;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:setPercentComplete:]", v4, &stru_1000EB0D0);
}

- (void)_remote_IXSDataPromise:(id)a3 getIsComplete:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007C518;
  v9[3] = &unk_1000EB090;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007C524;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:getIsComplete:]", v9, v7);
}

- (void)_remote_IXSDataPromise:(id)a3 setIsComplete:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007C648;
  v10[3] = &unk_1000EB0F8;
  BOOL v12 = a4;
  id v11 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007C660;
  v8[3] = &unk_1000EAE70;
  id v9 = v11;
  id v7 = v11;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:setIsComplete:completion:]", v10, v8);
}

- (void)_remote_IXSDataPromise:(id)a3 cancelForReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007C7A8;
  v14[3] = &unk_1000EB120;
  id v15 = a4;
  unint64_t v17 = a5;
  id v16 = a6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007C7B8;
  v12[3] = &unk_1000EAE70;
  id v13 = v16;
  id v10 = v16;
  id v11 = v15;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:cancelForReason:client:completion:]", v14, v12);
}

- (void)_remote_IXSDataPromise:(id)a3 resetWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007C8CC;
  v9[3] = &unk_1000EB090;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007C8D8;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:resetWithCompletion:]", v9, v7);
}

- (void)_remote_IXSDataPromise:(id)a3 getErrorInfo:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007C9EC;
  v9[3] = &unk_1000EB090;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007C9F8;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:getErrorInfo:]", v9, v7);
}

- (void)_remote_IXSDataPromise:(id)a3 preflightWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007CB14;
  v9[3] = &unk_1000EB090;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CB20;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSDataPromise:preflightWithCompletion:]", v9, v7);
}

- (void)_fetchOwnedDataPromiseForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  BOOL v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSDataPromiseManager sharedInstance];
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class()];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: OwnedDataPromise did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    unint64_t v19 = [(IXSClientConnection *)self clientName];
    unint64_t v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:]", 2234, @"IXErrorDomain", 3uLL, 0, 0, @"OwnedDataPromise did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 setStagedPath:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CDF8;
  v7[3] = &unk_1000EB148;
  id v8 = a4;
  id v6 = v8;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSOwnedDataPromise:setStagedPath:]", v7, &stru_1000EB168);
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 getStagedPath:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007CF0C;
  v9[3] = &unk_1000EB190;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007CF18;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSOwnedDataPromise:getStagedPath:]", v9, v7);
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 setTargetLastPathComponent:(id)a4 withCompletion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007D058;
  v12[3] = &unk_1000EB1B8;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007D064;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSOwnedDataPromise:setTargetLastPathComponent:withCompletion:]", v12, v10);
}

- (void)_remote_IXSOwnedDataPromise:(id)a3 getTargetLastPathComponent:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D178;
  v9[3] = &unk_1000EB190;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007D184;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:](self, "_fetchOwnedDataPromiseForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSOwnedDataPromise:getTargetLastPathComponent:]", v9, v7);
}

- (void)_fetchPlaceholderForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  BOOL v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSDataPromiseManager sharedInstance];
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class()];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Placeholder did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    unint64_t v19 = [(IXSClientConnection *)self clientName];
    unint64_t v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:]", 2258, @"IXErrorDomain", 3uLL, 0, 0, @"Placeholder did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSPlaceholder:(id)a3 setMetadataPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007D4D8;
  v12[3] = &unk_1000EB1E0;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007D550;
  v10[3] = &unk_1000EAE70;
  id v11 = v15;
  id v8 = v15;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setMetadataPromiseUUID:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getMetadataWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D664;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007D670;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getMetadataWithCompletion:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setSinfPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007D7B0;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007D7BC;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setSinfPromiseUUID:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getSinfDataWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D8D0;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007D8DC;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getSinfDataWithCompletion:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setLaunchProhibited:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007DA00;
  v10[3] = &unk_1000EB258;
  BOOL v12 = a4;
  id v11 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007DA10;
  v8[3] = &unk_1000EAE70;
  id v9 = v11;
  id v7 = v11;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setLaunchProhibited:completion:]", v10, v8);
}

- (void)_remote_IXSPlaceholder:(id)a3 getLaunchProhibitedWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007DB24;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007DB30;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getLaunchProhibitedWithCompletion:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setAttributes:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007DC70;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007DC7C;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setAttributes:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getAttributesWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007DD90;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007DD9C;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getAttributesWithCompletion:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setIconPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007DEDC;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007DEE8;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setIconPromiseUUID:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasIconPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007DFFC;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007E008;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:hasIconPromise:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getIconPromise:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007E128;
  v8[3] = &unk_1000EB230;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007E258;
  v6[3] = &unk_1000EAE70;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](v9, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getIconPromise:]", v8, v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setIconResourcesPromiseUUID:(id)a4 withInfoPlistIconContentPromiseUUID:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007E3C0;
  v15[3] = &unk_1000EB1E0;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007E3D0;
  v13[3] = &unk_1000EAE70;
  id v14 = v18;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setIconResourcesPromiseUUID:withInfoPlistIconContentPromiseUUID:completion:]", v15, v13);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasIconResourcesPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007E4E4;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007E4F0;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:hasIconResourcesPromise:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getIconResourcesPromiseAndInfoPlistContentPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007E60C;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007E618;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getIconResourcesPromiseAndInfoPlistContentPromise:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setLocalizationPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007E75C;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E768;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setLocalizationPromiseUUID:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 getLocalizationDictionary:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007E87C;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007E888;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getLocalizationDictionary:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 setEntitlementsPromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007E9C8;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E9D4;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setEntitlementsPromiseUUID:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasEntitlementsPromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007EAE8;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007EAF4;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:hasEntitlementsPromise:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getEntitlementsPromise:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007EC14;
  v8[3] = &unk_1000EB230;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007ED44;
  v6[3] = &unk_1000EAE70;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](v9, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getEntitlementsPromise:]", v8, v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setInfoPlistLoctablePromiseUUID:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007EE84;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007EE90;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setInfoPlistLoctablePromiseUUID:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasInfoPlistLoctablePromise:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007EFA4;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007EFB0;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:hasInfoPlistLoctablePromise:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getInfoPlistLoctablePromise:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007F0D0;
  v8[3] = &unk_1000EB230;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F200;
  v6[3] = &unk_1000EAE70;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](v9, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getInfoPlistLoctablePromise:]", v8, v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setAppExtensionPlaceholderPromiseUUIDs:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007F340;
  v12[3] = &unk_1000EB230;
  id v13 = a4;
  id v14 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007F34C;
  v10[3] = &unk_1000EAE70;
  id v11 = v14;
  id v8 = v14;
  id v9 = v13;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setAppExtensionPlaceholderPromiseUUIDs:completion:]", v12, v10);
}

- (void)_remote_IXSPlaceholder:(id)a3 hasAppExtensionPlaceholderPromises:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007F460;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F46C;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:hasAppExtensionPlaceholderPromises:]", v9, v7);
}

- (void)_remote_IXSPlaceholder:(id)a3 getAppExtensionPlaceholderPromises:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007F58C;
  v8[3] = &unk_1000EB230;
  id v9 = self;
  id v10 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F760;
  v6[3] = &unk_1000EAE70;
  id v7 = v10;
  id v5 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](v9, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:getAppExtensionPlaceholderPromises:]", v8, v6);
}

- (void)_remote_IXSPlaceholder:(id)a3 setConfigurationCompleteWithCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007F87C;
  v9[3] = &unk_1000EB208;
  id v10 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F888;
  v7[3] = &unk_1000EAE70;
  id v8 = v10;
  id v6 = v10;
  -[IXSClientConnection _fetchPlaceholderForUUID:method:andRunWithPromise:error:](self, "_fetchPlaceholderForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPlaceholder:setConfigurationCompleteWithCompletion:]", v9, v7);
}

- (void)_fetchPromisedTransferToPathForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSDataPromiseManager sharedInstance];
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class()];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: PromisedTransferToPath did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    unint64_t v19 = [(IXSClientConnection *)self clientName];
    id v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:]", 2417, @"IXErrorDomain", 3uLL, 0, 0, @"PromisedTransferToPath did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTransferPath:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007FB60;
  v7[3] = &unk_1000EB280;
  id v8 = a4;
  id v6 = v8;
  -[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:](self, "_fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPromisedTransferToPath:setTransferPath:]", v7, &stru_1000EB2A0);
}

- (void)_remote_IXSPromisedTransferToPath:(id)a3 setShouldCopy:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007FBEC;
  v4[3] = &unk_1000EB2C0;
  BOOL v5 = a4;
  -[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:](self, "_fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPromisedTransferToPath:setShouldCopy:]", v4, &stru_1000EB2E0);
}

- (void)_remote_IXSPromisedTransferToPath:(id)a3 setTryDeltaCopy:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007FC78;
  v4[3] = &unk_1000EB2C0;
  BOOL v5 = a4;
  -[IXSClientConnection _fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:](self, "_fetchPromisedTransferToPathForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPromisedTransferToPath:setTryDeltaCopy:]", v4, &stru_1000EB300);
}

- (void)_fetchPromisedStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSDataPromiseManager sharedInstance];
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class()];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: PromisedStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    unint64_t v19 = [(IXSClientConnection *)self clientName];
    id v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:]", 2437, @"IXErrorDomain", 3uLL, 0, 0, @"PromisedStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSPromisedStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007FF18;
  v4[3] = &unk_1000EB320;
  void v4[4] = a4;
  -[IXSClientConnection _fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:](self, "_fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPromisedStreamingZipTransfer:setArchiveBytesConsumed:]", v4, &stru_1000EB340);
}

- (void)_fetchPromisedOutOfBandStreamingZipTransferForUUID:(id)a3 method:(const char *)a4 andRunWithPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = +[IXSDataPromiseManager sharedInstance];
  id v14 = [v13 promiseForUUID:v10 ofType:objc_opt_class()];

  if (v14)
  {
    v11[2](v11, v14);
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136316162;
      id v21 = "-[IXSClientConnection _fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: PromisedOutOfBandStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@ : %@", buf, 0x34u);
    }
    unint64_t v19 = [(IXSClientConnection *)self clientName];
    id v17 = sub_10003DAE4((uint64_t)"-[IXSClientConnection _fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:]", 2446, @"IXErrorDomain", 3uLL, 0, 0, @"PromisedOutOfBandStreamingZipTransfer did not exist for UUID %@ when called for %s by client %@", v16, (uint64_t)v10);

    v12[2](v12, v17);
  }
}

- (void)_remote_IXSPromisedOutOfBandStreamingZipTransfer:(id)a3 setArchiveBytesConsumed:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000801B8;
  v4[3] = &unk_1000EB360;
  void v4[4] = a4;
  -[IXSClientConnection _fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:](self, "_fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:", a3, "-[IXSClientConnection _remote_IXSPromisedOutOfBandStreamingZipTransfer:setArchiveBytesConsumed:]", v4, &stru_1000EB380);
}

- (void)_client_coordinatorDidRegisterForObservationWithUUID:(id)a3
{
  id v4 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v4])
  {
    BOOL v5 = [(IXSClientConnection *)self xpcConnection];
    if (v5)
    {
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]";
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorDidRegisterForObservationWithUUID:uuid to %@", buf, 0x16u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000803B8;
      v8[3] = &unk_1000E9670;
      void v8[4] = self;
      id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
      [(IXSClientConnection *)v7 _client_coordinatorDidRegisterForObservationWithUUID:v4];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v10 = "-[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldPrioritizeWithUUID:(id)a3
{
  id v4 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v4])
  {
    BOOL v5 = [(IXSClientConnection *)self xpcConnection];
    if (v5)
    {
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]";
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorShouldPrioritizeWithUUID:uuid to %@", buf, 0x16u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10008069C;
      v8[3] = &unk_1000E9670;
      void v8[4] = self;
      id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
      [(IXSClientConnection *)v7 _client_coordinatorShouldPrioritizeWithUUID:v4];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v10 = "-[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldResumeWithUUID:(id)a3
{
  id v4 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v4])
  {
    BOOL v5 = [(IXSClientConnection *)self xpcConnection];
    if (v5)
    {
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]";
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorShouldResumeWithUUID:uuid to %@", buf, 0x16u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100080980;
      v8[3] = &unk_1000E9670;
      void v8[4] = self;
      id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
      [(IXSClientConnection *)v7 _client_coordinatorShouldResumeWithUUID:v4];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v10 = "-[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldPauseWithUUID:(id)a3
{
  id v4 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v4])
  {
    BOOL v5 = [(IXSClientConnection *)self xpcConnection];
    if (v5)
    {
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[IXSClientConnection _client_coordinatorShouldPauseWithUUID:]";
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorShouldPauseWithUUID:uuid to %@", buf, 0x16u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100080C64;
      v8[3] = &unk_1000E9670;
      void v8[4] = self;
      id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
      [(IXSClientConnection *)v7 _client_coordinatorShouldPauseWithUUID:v4];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v10 = "-[IXSClientConnection _client_coordinatorShouldPauseWithUUID:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v6])
  {
    id v7 = [(IXSClientConnection *)self xpcConnection];
    if (v7)
    {
      id v8 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]";
        __int16 v13 = 2112;
        id v14 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorWithUUID:uuid configuredPromiseDidBeginFulfillment:ident to %@", buf, 0x16u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100080F58;
      v10[3] = &unk_1000E9670;
      void v10[4] = self;
      id v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
      [(IXSClientConnection *)v9 _client_coordinatorWithUUID:v6 configuredPromiseDidBeginFulfillment:a4];
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]";
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldBeginRestoringUserDataWithUUID:(id)a3
{
  id v4 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v4])
  {
    BOOL v5 = [(IXSClientConnection *)self xpcConnection];
    if (v5)
    {
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]";
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorShouldBeginRestoringUserDataWithUUID:uuid to %@", buf, 0x16u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10008123C;
      v8[3] = &unk_1000E9670;
      void v8[4] = self;
      id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
      [(IXSClientConnection *)v7 _client_coordinatorShouldBeginRestoringUserDataWithUUID:v4];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v10 = "-[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorShouldBeginPostProcessingWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v6])
  {
    id v8 = [(IXSClientConnection *)self xpcConnection];
    if (v8)
    {
      id v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]";
        __int16 v14 = 2112;
        __int16 v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorShouldBeginPostProcessingWithUUID:uuid forRecordPromise:recordPromise to %@", buf, 0x16u);
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10008153C;
      v11[3] = &unk_1000E9670;
      void v11[4] = self;
      id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
      [(IXSClientConnection *)v10 _client_coordinatorShouldBeginPostProcessingWithUUID:v6 forRecordPromise:v7];
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]";
      __int16 v14 = 2112;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorDidInstallPlaceholderWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v6])
  {
    id v8 = [(IXSClientConnection *)self xpcConnection];
    if (v8)
    {
      id v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]";
        __int16 v14 = 2112;
        __int16 v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorDidInstallPlaceholderWithUUID:uuid forRecordPromise:recordPromise to %@", buf, 0x16u);
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10008183C;
      v11[3] = &unk_1000E9670;
      void v11[4] = self;
      id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
      [(IXSClientConnection *)v10 _client_coordinatorDidInstallPlaceholderWithUUID:v6 forRecordPromise:v7];
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]";
      __int16 v14 = 2112;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorDidCompleteSuccessfullyWithUUID:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v6])
  {
    id v8 = [(IXSClientConnection *)self xpcConnection];
    if (v8)
    {
      id v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]";
        __int16 v14 = 2112;
        __int16 v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorDidCompleteSuccessfullyWithUUID:uuid forRecordPromise:recordPromise to %@", buf, 0x16u);
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100081B3C;
      v11[3] = &unk_1000E9670;
      void v11[4] = self;
      id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
      [(IXSClientConnection *)v10 _client_coordinatorDidCompleteSuccessfullyWithUUID:v6 forRecordPromise:v7];
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]";
      __int16 v14 = 2112;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v8])
  {
    id v10 = [(IXSClientConnection *)self xpcConnection];
    if (v10)
    {
      __int16 v11 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]";
        __int16 v16 = 2112;
        id v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorWithUUID:uuid didCancelWithReason:cancelReason client:client to %@", buf, 0x16u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100081E44;
      v13[3] = &unk_1000E9670;
      void v13[4] = self;
      id v12 = [v10 remoteObjectProxyWithErrorHandler:v13];
      [(IXSClientConnection *)v12 _client_coordinatorWithUUID:v8 didCancelWithReason:v9 client:a5];
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]";
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_coordinatorWithUUID:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v10 = a3;
  if ([(IXSClientConnection *)self interestedInCoordinatorUUID:v10])
  {
    __int16 v11 = [(IXSClientConnection *)self xpcConnection];
    if (v11)
    {
      id v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v16 = "-[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]";
        __int16 v17 = 2112;
        __int16 v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_coordinatorWithUUID:uuid didUpdateProgress:percentComplete forPhase:phase overallProgress:overallProgress to %@", buf, 0x16u);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100082150;
      v14[3] = &unk_1000E9670;
      void v14[4] = self;
      __int16 v13 = [v11 remoteObjectProxyWithErrorHandler:v14];
      [(IXSClientConnection *)v13 _client_coordinatorWithUUID:v10 didUpdateProgress:a5 forPhase:a4 overallProgress:a6];
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "-[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]";
      __int16 v17 = 2112;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in coordinator UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_promiseDidCompleteSuccessfullyWithUUID:(id)a3
{
  id v4 = a3;
  if ([(IXSClientConnection *)self interestedInPromiseUUID:v4])
  {
    BOOL v5 = [(IXSClientConnection *)self xpcConnection];
    if (v5)
    {
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]";
        __int16 v11 = 2112;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_promiseDidCompleteSuccessfullyWithUUID:uuid to %@", buf, 0x16u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100082434;
      v8[3] = &unk_1000E9670;
      void v8[4] = self;
      id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
      [(IXSClientConnection *)v7 _client_promiseDidCompleteSuccessfullyWithUUID:v4];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      id v10 = "-[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in promise UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (void)_client_promiseWithUUID:(id)a3 didCancelWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(IXSClientConnection *)self interestedInPromiseUUID:v8])
  {
    id v10 = [(IXSClientConnection *)self xpcConnection];
    if (v10)
    {
      __int16 v11 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v15 = "-[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]";
        __int16 v16 = 2112;
        __int16 v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Dispatching _client_promiseWithUUID:uuid didCancelWithReason:cancelReason client:client to %@", buf, 0x16u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10008273C;
      v13[3] = &unk_1000E9670;
      void v13[4] = self;
      id v12 = [v10 remoteObjectProxyWithErrorHandler:v13];
      [(IXSClientConnection *)v12 _client_promiseWithUUID:v8 didCancelWithReason:v9 client:a5];
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(IXSClientConnection *)self clientName];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]";
      __int16 v16 = 2112;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Client %@ was not interested in promise UUID %@", buf, 0x20u);
LABEL_8:
    }
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)fakeClientProcessDeath
{
  return self->_fakeClientProcessDeath;
}

- (void)setFakeClientProcessDeath:(BOOL)a3
{
  self->_fakeClientProcessDeath = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[2].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSCountedSet)interestedCoordinatorUUIDs
{
  return self->_interestedCoordinatorUUIDs;
}

- (NSCountedSet)interestedPromiseUUIDs
{
  return self->_interestedPromiseUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedPromiseUUIDs, 0);
  objc_storeStrong((id *)&self->_interestedCoordinatorUUIDs, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_connectionUUID, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

@end