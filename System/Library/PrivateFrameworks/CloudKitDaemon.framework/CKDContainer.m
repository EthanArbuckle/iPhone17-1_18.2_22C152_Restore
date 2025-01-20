@interface CKDContainer
+ (CKDContainer)containerWithAppContainerAccountTuple:(id)a3 deviceContext:(id)a4 sharedContainerTable:(id)a5;
+ (CKDContainer)containerWithAppContainerTuple:(id)a3 processScopedClientProxy:(id)a4 logicalDeviceScopedClientProxy:(id)a5 containerEntitlements:(id)a6 containerOptions:(id)a7 sharedContainerTable:(id)a8;
+ (id)applicationDataContainerDirectoryForBundleID:(id)a3 outApplicationBinaryBundleURL:(id *)a4 outAdopterProcessType:(int64_t *)a5;
+ (id)operationStatusReport:(id)a3;
+ (id)sharedClientThrottlingOperationQueue;
+ (id)sharedDetachedContainers;
+ (id)sharedInternalUseContainers;
+ (void)initialize;
- (BOOL)_cloudKitEnabledForCurrentClient;
- (BOOL)_isAdopterAppleInternal;
- (BOOL)_isContainerAuthorizedForOperation:(id)a3 error:(id *)a4;
- (BOOL)allowsCellularAccess;
- (BOOL)beginContentAccess;
- (BOOL)canAccessAccount;
- (BOOL)canAuthWithCloudKit;
- (BOOL)canOpenFileAtURL:(id)a3;
- (BOOL)hasDataContainer;
- (BOOL)hasTCCAuthorization;
- (BOOL)hasValidatedEntitlements;
- (BOOL)isClientMainBundleAppleExecutable;
- (BOOL)isContentAccessed;
- (BOOL)isContentDiscarded;
- (BOOL)isEligibleForBroadcastingToContainer:(id)a3;
- (BOOL)isForClouddInternalUse;
- (BOOL)preferAnonymousRequests;
- (BOOL)setupAssetTransfers:(id *)a3;
- (BOOL)setupMMCSWrapper:(id *)a3;
- (BOOL)shouldUsePCSEncryption;
- (CKAccountOverrideInfo)accountOverrideInfo;
- (CKContainerID)containerID;
- (CKContainerOptions)options;
- (CKDAccount)account;
- (CKDAnonymousSharingManager)anonymousSharingManager;
- (CKDAppContainerAccountTuple)appContainerAccountTuple;
- (CKDAppContainerTuple)appContainerTuple;
- (CKDApplicationID)applicationID;
- (CKDDirectoryContext)directoryContext;
- (CKDIdentityCache)publicIdentitiesDiskCache;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDLogicalDeviceScopedClientProxy)logicalDeviceScopedClientProxy;
- (CKDMMCS)MMCS;
- (CKDPCSCache)pcsCache;
- (CKDPCSFetchAggregator)fetchAggregator;
- (CKDPCSManager)pcsManager;
- (CKDProcessScopedClientProxy)processScopedClientProxy;
- (CKDPublicIdentityLookupService)backgroundPublicIdentityLookupService;
- (CKDPublicIdentityLookupService)foregroundPublicIdentityLookupService;
- (CKDRecordCache)recordCache;
- (CKDServerConfiguration)serverConfig;
- (CKDTestServerProtocol)testServer;
- (CKDZoneGatekeeper)gatekeeper;
- (CKEntitlements)entitlements;
- (NSArray)cachedSandboxExtensions;
- (NSHashTable)clientContainers;
- (NSMutableDictionary)fakeErrorsByClassName;
- (NSMutableDictionary)fakeResponseOperationLifetimeByClassName;
- (NSMutableDictionary)fakeResponseOperationResultByClassNameByItemID;
- (NSMutableDictionary)operationStatisticsByClassName;
- (NSMutableSet)pendingOperationIDs;
- (NSObject)authorizationChangedRegistration;
- (NSOperationQueue)backgroundOperationThrottleQueue;
- (NSOperationQueue)cleanupOperationQueue;
- (NSOperationQueue)cloudKitSupportOperationThrottleQueue;
- (NSOperationQueue)operationQueue;
- (NSOperationQueue)uncancellableOperationQueue;
- (NSRecursiveLock)anonymousSharingManagerLock;
- (NSRecursiveLock)deviceContextLock;
- (NSRecursiveLock)fetchAggregatorLock;
- (NSRecursiveLock)mmcsLock;
- (NSRecursiveLock)pcsManagerLock;
- (NSRecursiveLock)publicIdentityServiceLock;
- (NSRecursiveLock)sandboxExtensionsLock;
- (NSRecursiveLock)serverConfigLock;
- (NSString)applicationBundleID;
- (NSString)applicationBundleIdentifierForContainerAccess;
- (NSString)applicationBundleIdentifierForNetworkAttribution;
- (NSString)applicationBundleIdentifierForPush;
- (NSString)applicationDisplayName;
- (NSString)applicationVersion;
- (NSString)apsEnvironmentString;
- (NSString)associatedApplicationBundleID;
- (NSString)containerScopedUserID;
- (NSString)containingBundleID;
- (NSString)description;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)encryptionServiceName;
- (NSString)hardwareID;
- (NSString)languageCode;
- (NSString)orgAdminUserID;
- (NSString)personaID;
- (NSString)processName;
- (NSString)regionCode;
- (NSString)resolvedAPSEnvironmentString;
- (NSURL)applicationIcon;
- (NSURL)publicCloudDBURL;
- (NSURL)publicCodeServiceURL;
- (NSURL)publicDeviceServiceURL;
- (NSURL)publicMetricsServiceURL;
- (NSURL)publicShareServiceURL;
- (OS_dispatch_queue)cancellationQueue;
- (OS_dispatch_queue)statusQueue;
- (OS_dispatch_queue)tccAuthQueue;
- (OS_dispatch_workloop)accountStatusWorkloop;
- (id)CKPropertiesDescription;
- (id)CKShortDescriptionRedact:(BOOL)a3;
- (id)CKStatusReportArray;
- (id)CKStatusReportArrayIncludingSharedOperations:(BOOL)a3;
- (id)_initWithAppContainerTuple:(id)a3 processScopedClientProxy:(id)a4 logicalDeviceScopedClientProxy:(id)a5 containerEntitlements:(id)a6 containerOptions:(id)a7;
- (id)_urlBySettingCustomBaseURL:(id)a3 onURL:(id)a4;
- (id)accountOrNil;
- (id)applicationBundleIdentifierForTCC;
- (id)baseURLForServerType:(int64_t)a3 partitionType:(int64_t)a4;
- (id)ckShortDescription;
- (id)containerForOperationInfo:(id)a3;
- (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4;
- (id)pcsCacheAssertion;
- (id)pcsCacheIfExists;
- (id)pcsManagerIfExists;
- (id)possiblyWrappedAuthTokenErrorGivenError:(id)a3;
- (id)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (id)sandboxExtensions;
- (int64_t)_accountStatus;
- (int64_t)_applicationPermissionStatusFromUserPrivacySetting:(int64_t)a3;
- (int64_t)_lockedHasTCCAuthorization:(BOOL)a3;
- (int64_t)adopterProcessType;
- (int64_t)cachedEnvironment;
- (int64_t)hasTCCAuthorization:(BOOL)a3;
- (int64_t)hasTCCAuthorizationTernary;
- (int64_t)hasValidatedEntitlementsTernary;
- (unint64_t)accessCount;
- (unint64_t)countAssetCacheItems;
- (unsigned)clientSDKVersion;
- (void)_broadcastUpdateIfNeededForRecord:(id)a3 recordXPCMetadata:(id)a4 recordID:(id)a5 isDeleted:(BOOL)a6 error:(id)a7;
- (void)_clearCaches;
- (void)_determineHardwareInfo;
- (void)_dumpStatusReportArrayToOsTrace:(id)a3;
- (void)_enumerateEligibleConnectedContainersForOOPUIContainer:(id)a3;
- (void)_evictRecordCache;
- (void)_fetchContainerServerInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5;
- (void)_globalStatusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)_handleCompletionForOperation:(id)a3 initialMessageReplyBlock:(id)a4;
- (void)_handleCompletionForOperation:(id)a3 initialMessageReplyBlock:(id)a4 customCompletionBlock:(id)a5;
- (void)_loadApplicationContainerPathAndType;
- (void)_lockedHandleTCCAuthorizationChangedEvent:(int64_t)a3;
- (void)_lockedSetHasTCCAuthorizationTernary:(int64_t)a3;
- (void)_performCodeFunctionInvokeOperation:(id)a3 block:(id)a4;
- (void)_performFetchCurrentUserRecordOperation:(id)a3 withBlock:(id)a4;
- (void)_reallyPerformFetchRecordsOperation:(id)a3 withBlock:(id)a4;
- (void)_registerForTCCAuthorizationEvents;
- (void)_reloadAccount:(BOOL)a3;
- (void)_setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
- (void)_setupOperationQueues;
- (void)_unregisterForTCCAuthorizationEvents;
- (void)_writeAdopterMetadataToCache:(id)a3;
- (void)accountAccessAuthorizationWithCompletionHandler:(id)a3;
- (void)accountInfoWithCompletionHandler:(id)a3;
- (void)addOperation:(id)a3;
- (void)addThrottle:(id)a3;
- (void)cancelAllOperations;
- (void)cancelOperationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)clearAssetCache;
- (void)clearRecordCache;
- (void)dealloc;
- (void)discardContentIfPossible;
- (void)displayInfoOnAccountWithCompletionHandler:(id)a3;
- (void)dropMMCS;
- (void)dumpDaemonStatusReportToFileHandle:(id)a3 completionHandler:(id)a4;
- (void)endContentAccess;
- (void)enumerateClientContainers:(id)a3;
- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(id)a3;
- (void)fetchConfigurationForOperation:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchImportantUserIDsForOperation:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchLongLivedOperationsWithIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchPrivateURLForServerType:(int64_t)a3 operation:(id)a4 completionHandler:(id)a5;
- (void)fetchPublicURLForServerType:(int64_t)a3 operation:(id)a4 completionHandler:(id)a5;
- (void)fetchServerEnvironmentForOperation:(id)a3 withCompletionHandler:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4;
- (void)importantUserIDsWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)linkWithClientContainer:(id)a3;
- (void)networkTransferEndpointWithCompletionHandler:(id)a3;
- (void)performAcceptSharesOperation:(id)a3 withBlock:(id)a4;
- (void)performCheckSupportedDeviceCapabilitiesOperation:(id)a3 withBlock:(id)a4;
- (void)performCodeFunctionInvokeOperation:(id)a3 withBlock:(id)a4;
- (void)performCodeOperation:(id)a3 withBlock:(id)a4;
- (void)performDeclineSharesOperation:(id)a3 withBlock:(id)a4;
- (void)performDiscoverAllUserIdentitiesOperation:(id)a3 withBlock:(id)a4;
- (void)performDiscoverUserIdentitiesOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchDatabaseChangesOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchRecordChangesOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchRecordZoneChangesOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchRecordZonesOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchRecordsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchShareMetadataOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchShareParticipantsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchSubscriptionsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchWebAuthTokenOperation:(id)a3 withBlock:(id)a4;
- (void)performMapShareURLsToInstalledBundleIDsOperation:(id)a3 withBlock:(id)a4;
- (void)performModifyRecordZonesOperation:(id)a3 withBlock:(id)a4;
- (void)performModifyRecordsOperation:(id)a3 withBlock:(id)a4;
- (void)performModifySubscriptionsOperation:(id)a3 withBlock:(id)a4;
- (void)performMovePhotosOperation:(id)a3 withBlock:(id)a4;
- (void)performOperation:(id)a3 initialMessageReplyBlock:(id)a4;
- (void)performOperation:(id)a3 initialMessageReplyBlock:(id)a4 customCompletionBlock:(id)a5;
- (void)performQueryOperation:(id)a3 withBlock:(id)a4;
- (void)performRequest:(id)a3;
- (void)performShareAccessRequestOperation:(id)a3 withBlock:(id)a4;
- (void)reloadAccountWithCompletionHandler:(id)a3;
- (void)requestApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)resetThrottles;
- (void)setAccessCount:(unint64_t)a3;
- (void)setAnonymousSharingManager:(id)a3;
- (void)setAnonymousSharingManagerLock:(id)a3;
- (void)setApplicationDisplayName:(id)a3;
- (void)setApplicationIcon:(id)a3;
- (void)setBackgroundOperationThrottleQueue:(id)a3;
- (void)setBackgroundPublicIdentityLookupService:(id)a3;
- (void)setCachedEnvironment:(int64_t)a3;
- (void)setCachedSandboxExtensions:(id)a3;
- (void)setCancellationQueue:(id)a3;
- (void)setCleanupOperationQueue:(id)a3;
- (void)setClientContainers:(id)a3;
- (void)setClientSDKVersion:(unsigned int)a3;
- (void)setCloudKitSupportOperationThrottleQueue:(id)a3;
- (void)setContainerAvailable:(BOOL)a3;
- (void)setContainerScopedUserID:(id)a3;
- (void)setContainingBundleID:(id)a3;
- (void)setDirectoryContext:(id)a3;
- (void)setFakeErrorsByClassName:(id)a3;
- (void)setFakeResponseOperationLifetimeByClassName:(id)a3;
- (void)setFakeResponseOperationResultByClassNameByItemID:(id)a3;
- (void)setFetchAggregator:(id)a3;
- (void)setFetchAggregatorLock:(id)a3;
- (void)setForegroundPublicIdentityLookupService:(id)a3;
- (void)setGatekeeper:(id)a3;
- (void)setHardwareID:(id)a3;
- (void)setHasDataContainer:(BOOL)a3;
- (void)setHasTCCAuthorizationTernary:(int64_t)a3;
- (void)setHasValidatedEntitlementsTernary:(int64_t)a3;
- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3;
- (void)setIsForClouddInternalUse:(BOOL)a3;
- (void)setMMCS:(id)a3;
- (void)setMmcsLock:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOperationStatisticsByClassName:(id)a3;
- (void)setOrgAdminUserID:(id)a3;
- (void)setPcsCache:(id)a3;
- (void)setPcsCacheAssertion:(id)a3;
- (void)setPcsManager:(id)a3;
- (void)setPcsManagerLock:(id)a3;
- (void)setPendingOperationIDs:(id)a3;
- (void)setPublicCloudDBURL:(id)a3;
- (void)setPublicCodeServiceURL:(id)a3;
- (void)setPublicDeviceServiceURL:(id)a3;
- (void)setPublicIdentitiesDiskCache:(id)a3;
- (void)setPublicIdentityServiceLock:(id)a3;
- (void)setPublicMetricsServiceURL:(id)a3;
- (void)setPublicShareServiceURL:(id)a3;
- (void)setResolvedAPSEnvironmentString:(id)a3;
- (void)setSandboxExtensionsLock:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setServerConfigLock:(id)a3;
- (void)setStatusQueue:(id)a3;
- (void)setTccAuthQueue:(id)a3;
- (void)setUncancellableOperationQueue:(id)a3;
- (void)showAssetCache;
- (void)statusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)submitClientEventMetric:(id)a3 completeWhenQueued:(BOOL)a4 completionHandler:(id)a5;
- (void)suggestedMergeableDeltaSizeWithCompletionHandler:(id)a3;
- (void)tearDownAssetTransfers;
@end

@implementation CKDContainer

- (int64_t)_lockedHasTCCAuthorization:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_tccAuthQueue);
  if (CKIsRunningInSyncBubble()) {
    return 1;
  }
  int64_t hasTCCAuthorizationTernary = self->_hasTCCAuthorizationTernary;
  if (hasTCCAuthorizationTernary == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v31 = objc_msgSend_ckShortDescription(self, v29, v30);
      *(_DWORD *)buf = 138543362;
      uint64_t v67 = (uint64_t)v31;
      _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEFAULT, "Found cached TCC approval for container %{public}@", buf, 0xCu);
    }
    return 1;
  }
  if (hasTCCAuthorizationTernary)
  {
    if (hasTCCAuthorizationTernary != -1) {
      return hasTCCAuthorizationTernary;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v7 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v7;
      v13 = objc_msgSend_ckShortDescription(self, v11, v12);
      *(_DWORD *)buf = 138412290;
      uint64_t v67 = (uint64_t)v13;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEFAULT, "Consulting TCC for access for container %@...", buf, 0xCu);
    }
    uint64_t v60 = objc_msgSend_applicationBundleIdentifierForTCC(self, v8, v9);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v14 = (id)TCCAccessCopyInformationForBundleId();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v61, v65, 16);
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v62;
      v20 = (uint64_t *)MEMORY[0x1E4FA9A00];
      v21 = (uint64_t *)MEMORY[0x1E4FA9A90];
LABEL_13:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v14);
        }
        v23 = *(void **)(*((void *)&v61 + 1) + 8 * v22);
        v24 = objc_msgSend_objectForKeyedSubscript_(v23, v17, *v20);
        if (objc_msgSend_isEqualToString_(v24, v25, *v21)) {
          break;
        }

        if (v18 == ++v22)
        {
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v61, v65, 16);
          if (v18) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
      v37 = objc_msgSend_objectForKeyedSubscript_(v23, v26, *MEMORY[0x1E4FA99E8]);

      if (!v37) {
        goto LABEL_34;
      }
      objc_msgSend_BOOLValue(v37, v38, v39);
      uint64_t v40 = CKTernaryFromBOOL();
      v41 = (NSObject **)MEMORY[0x1E4F1A500];
      v42 = (void *)MEMORY[0x1E4F1A550];
      if (v40 == -1)
      {
        v43 = (void *)v60;
        goto LABEL_47;
      }
      int64_t hasTCCAuthorizationTernary = v40;
      v43 = (void *)v60;
      if (v40)
      {
        if (v40 == 1) {
          goto LABEL_40;
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v55 = *v41;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = v55;
          v59 = objc_msgSend_ckShortDescription(self, v57, v58);
          *(_DWORD *)buf = 138543362;
          uint64_t v67 = (uint64_t)v59;
          _os_log_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_DEFAULT, "TCC REJECTED access for container %{public}@", buf, 0xCu);
        }
        int64_t hasTCCAuthorizationTernary = 0;
      }
      goto LABEL_52;
    }
LABEL_19:

LABEL_34:
    v42 = (void *)MEMORY[0x1E4F1A550];
    if (v3)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v43 = (void *)v60;
      v41 = (NSObject **)MEMORY[0x1E4F1A500];
      v44 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v67 = v60;
        _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "Setting un-initialized TCC access for bundle identifier override '%{public}@'", buf, 0xCu);
      }
      v37 = 0;
      if (TCCAccessSetForBundleId())
      {
LABEL_40:
        if (*v42 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v45 = *v41;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v45;
          v49 = objc_msgSend_ckShortDescription(self, v47, v48);
          *(_DWORD *)buf = 138543362;
          uint64_t v67 = (uint64_t)v49;
          _os_log_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEFAULT, "TCC approved access for container %{public}@", buf, 0xCu);
        }
        int64_t hasTCCAuthorizationTernary = 1;
LABEL_52:
        self->_int64_t hasTCCAuthorizationTernary = hasTCCAuthorizationTernary;

        return hasTCCAuthorizationTernary;
      }
    }
    else
    {
      v37 = 0;
      v43 = (void *)v60;
      v41 = (NSObject **)MEMORY[0x1E4F1A500];
    }
LABEL_47:
    if (*v42 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v50 = *v41;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      v54 = objc_msgSend_ckShortDescription(self, v52, v53);
      *(_DWORD *)buf = 138543362;
      uint64_t v67 = (uint64_t)v54;
      _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEFAULT, "TCC has no entry for container %{public}@", buf, 0xCu);
    }
    int64_t hasTCCAuthorizationTernary = -1;
    goto LABEL_52;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v32 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    v36 = objc_msgSend_ckShortDescription(self, v34, v35);
    *(_DWORD *)buf = 138543362;
    uint64_t v67 = (uint64_t)v36;
    _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEFAULT, "Found cached TCC rejection for container %{public}@", buf, 0xCu);
  }
  return 0;
}

- (id)ckShortDescription
{
  return (id)MEMORY[0x1F4181798](self, sel_CKShortDescriptionRedact_, 0);
}

- (id)applicationBundleIdentifierForTCC
{
  v4 = objc_msgSend_applicationID(self, a2, v2);
  v7 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v4, v5, v6);
  v10 = v7;
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    uint64_t v12 = objc_msgSend_applicationID(self, v8, v9);
    objc_msgSend_applicationBundleIdentifier(v12, v13, v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  v4 = NSString;
  v5 = objc_msgSend_containerID(self, a2, a3);
  v8 = objc_msgSend_ckShortDescription(v5, v6, v7);
  id v11 = objc_msgSend_applicationID(self, v9, v10);
  v13 = objc_msgSend_stringWithFormat_(v4, v12, @"containerID=%@, applicationID=%@", v8, v11);

  return v13;
}

- (CKContainerID)containerID
{
  BOOL v3 = objc_msgSend_appContainerTuple(self, a2, v2);
  uint64_t v6 = objc_msgSend_containerID(v3, v4, v5);

  return (CKContainerID *)v6;
}

- (NSString)applicationBundleID
{
  BOOL v3 = objc_msgSend_applicationID(self, a2, v2);
  uint64_t v6 = objc_msgSend_applicationBundleIdentifier(v3, v4, v5);

  return (NSString *)v6;
}

- (CKDApplicationID)applicationID
{
  BOOL v3 = objc_msgSend_appContainerTuple(self, a2, v2);
  uint64_t v6 = objc_msgSend_applicationID(v3, v4, v5);

  return (CKDApplicationID *)v6;
}

- (CKDAppContainerTuple)appContainerTuple
{
  return (CKDAppContainerTuple *)objc_getProperty(self, a2, 304, 1);
}

- (void)_writeAdopterMetadataToCache:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_processScopedClientProxy(self, v5, v6);
  if (objc_msgSend_processIsAttached(v7, v8, v9))
  {
    objc_msgSend_hasTCCAuthorization(self, v10, v11);
    objc_msgSend_hasValidatedEntitlements(self, v12, v13);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v64 = v4;
    uint64_t v14 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v7;
      __int16 v67 = 2112;
      uint64_t v68 = self;
      _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Echoing proxy %@ info into metadata cache for container %@", buf, 0x16u);
    }
    v15 = [CKDApplicationMetadata alloc];
    uint64_t v18 = objc_msgSend_adopterProcessType(self, v16, v17);
    v21 = objc_msgSend_containingBundleID(self, v19, v20);
    v24 = objc_msgSend_directoryContext(self, v22, v23);
    v27 = objc_msgSend_containerDirectory(v24, v25, v26);
    uint64_t v30 = objc_msgSend_path(v27, v28, v29);
    v33 = objc_msgSend_clientEntitlements(v7, v31, v32);
    uint64_t v36 = objc_msgSend_clientSDKVersion(v7, v34, v35);
    uint64_t isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v7, v37, v38);
    v41 = objc_msgSend_initWithAdopterProcessType_containingBundleID_applicationContainerPath_entitlements_clientSDKVersion_isClientMainBundleAppleExecutable_(v15, v40, v18, v21, v30, v33, v36, isClientMainBundleAppleExecutable);

    v44 = objc_msgSend_deviceContext(self, v42, v43);
    v47 = objc_msgSend_metadataCache(v44, v45, v46);
    v50 = objc_msgSend_applicationID(self, v48, v49);
    objc_msgSend_setApplicationMetadata_forApplicationID_(v47, v51, (uint64_t)v41, v50);

    v52 = objc_opt_new();
    v55 = objc_msgSend_options(self, v53, v54);
    objc_msgSend_setContainerOptions_(v52, v56, (uint64_t)v55);

    v59 = objc_msgSend_deviceContext(self, v57, v58);
    long long v62 = objc_msgSend_metadataCache(v59, v60, v61);
    id v4 = v64;
    objc_msgSend_setAppContainerAccountMetadata_forAppContainerAccountTuple_(v62, v63, (uint64_t)v52, v64);
  }
}

- (id)sandboxExtensions
{
  v133[3] = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self->_sandboxExtensionsLock, a2, v2);
  uint64_t v6 = objc_msgSend_cachedSandboxExtensions(self, v4, v5);

  if (!v6)
  {
    uint64_t v12 = objc_msgSend_processScopedClientProxy(self, v7, v8);
    uint64_t v13 = objc_opt_new();
    uint64_t v16 = objc_msgSend_directoryContext(self, v14, v15);
    uint64_t v19 = objc_msgSend_containerDirectory(v16, v17, v18);

    v121 = (void *)v12;
    if (v12) {
      BOOL v22 = v19 == 0;
    }
    else {
      BOOL v22 = 0;
    }
    int v23 = v22;
    v24 = objc_msgSend_directoryContext(self, v20, v21);
    v27 = objc_msgSend_temporaryDirectory(v24, v25, v26);
    v133[0] = v27;
    uint64_t v30 = objc_msgSend_directoryContext(self, v28, v29);
    v33 = objc_msgSend_fileDownloadDirectory(v30, v31, v32);
    v133[1] = v33;
    uint64_t v36 = objc_msgSend_directoryContext(self, v34, v35);
    uint64_t v39 = objc_msgSend_frameworkCachesDirectory(v36, v37, v38);
    v133[2] = v39;
    v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v40, (uint64_t)v133, 3);

    int v120 = v23;
    if (v23 == 1)
    {
      v44 = objc_msgSend_directoryContext(self, v42, v43);
      v47 = objc_msgSend_packageStagingDirectory(v44, v45, v46);
      uint64_t v49 = objc_msgSend_arrayByAddingObject_(v41, v48, (uint64_t)v47);

      v41 = (void *)v49;
    }
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v50 = v41;
    uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v122, v132, 16);
    if (v52)
    {
      uint64_t v55 = v52;
      uint64_t v56 = *(void *)v123;
      while (2)
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v123 != v56) {
            objc_enumerationMutation(v50);
          }
          uint64_t v58 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          v59 = objc_msgSend_path(v58, v53, v54);
          char v60 = CKCreateDirectoryAtPath();
          uint64_t v61 = (__CFString *)0;
          long long v62 = v61;
          if ((v60 & 1) == 0)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v79 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              v99 = v79;
              v102 = objc_msgSend_applicationBundleID(self, v100, v101);
              objc_msgSend_CKSanitizedPath(v58, v103, v104);
              v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v127 = v102;
              __int16 v128 = 2112;
              v129 = v105;
              __int16 v130 = 2112;
              v131 = v62;
              _os_log_error_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_ERROR, "Failed to create directory for \"%@\" at %@: %@", buf, 0x20u);
            }
            objc_msgSend_unlock(self->_sandboxExtensionsLock, v80, v81);

            uint64_t v9 = 0;
            goto LABEL_31;
          }
        }
        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v122, v132, 16);
        if (v55) {
          continue;
        }
        break;
      }
    }

    long long v63 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v64 = *MEMORY[0x1E4F1A550];
    if (v121)
    {
      v65 = v13;
      if (v64 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v63);
      }
      int v66 = v120;
      __int16 v67 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v106 = v67;
        v109 = objc_msgSend_ckShortDescription(self, v107, v108);
        if (objc_msgSend_isSandboxed(v121, v110, v111)) {
          v114 = @"YES";
        }
        else {
          v114 = @"NO";
        }
        int hasDataContainer = objc_msgSend_hasDataContainer(self, v112, v113);
        *(_DWORD *)buf = 138412802;
        if (hasDataContainer) {
          v116 = @"YES";
        }
        else {
          v116 = @"NO";
        }
        v127 = v109;
        __int16 v128 = 2112;
        v129 = v114;
        __int16 v130 = 2112;
        v131 = v116;
        _os_log_debug_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_DEBUG, "Sandbox extensions needed for %@, proxy sandboxed: %@, hasDataContainer: %@", buf, 0x20u);
      }
      v70 = objc_msgSend_directoryContext(self, v68, v69);
      v73 = objc_msgSend_fileDownloadDirectory(v70, v71, v72);
      v75 = objc_msgSend_issueSandboxExtensionForItem_error_(v121, v74, (uint64_t)v73, 0);

      if (v75) {
        objc_msgSend_addObject_(v65, v76, (uint64_t)v75);
      }
    }
    else
    {
      v65 = v13;
      if (v64 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v63);
      }
      int v66 = v120;
      v83 = (void *)*MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_37;
      }
      v75 = v83;
      v119 = objc_msgSend_ckShortDescription(self, v117, v118);
      *(_DWORD *)buf = 138412290;
      v127 = v119;
      _os_log_debug_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_DEBUG, "Sandbox extensions not needed for %@", buf, 0xCu);
    }
LABEL_37:
    if (v66)
    {
      v84 = objc_msgSend_directoryContext(self, v77, v78);
      v87 = objc_msgSend_frameworkCachesDirectory(v84, v85, v86);
      v89 = objc_msgSend_issueSandboxExtensionForItem_error_(v121, v88, (uint64_t)v87, 0);

      v92 = objc_msgSend_directoryContext(self, v90, v91);
      v95 = objc_msgSend_packageStagingDirectory(v92, v93, v94);
      v97 = objc_msgSend_issueSandboxExtensionForItem_error_(v121, v96, (uint64_t)v95, 0);

      if (v89) {
        objc_msgSend_addObject_(v65, v98, (uint64_t)v89);
      }
      if (v97) {
        objc_msgSend_addObject_(v65, v98, (uint64_t)v97);
      }
    }
    objc_msgSend_setCachedSandboxExtensions_(self, v77, (uint64_t)v65);
  }
  uint64_t v9 = objc_msgSend_cachedSandboxExtensions(self, v7, v8);
  objc_msgSend_unlock(self->_sandboxExtensionsLock, v10, v11);
LABEL_31:
  return v9;
}

- (CKDDirectoryContext)directoryContext
{
  return self->_directoryContext;
}

- (NSArray)cachedSandboxExtensions
{
  return self->_cachedSandboxExtensions;
}

- (void)setCachedSandboxExtensions:(id)a3
{
}

- (NSString)personaID
{
  BOOL v3 = objc_msgSend_appContainerTuple(self, a2, v2);
  uint64_t v6 = objc_msgSend_personaID(v3, v4, v5);

  return (NSString *)v6;
}

- (BOOL)hasTCCAuthorization
{
  return objc_msgSend_hasTCCAuthorization_(self, a2, 1) == 1;
}

- (NSString)containingBundleID
{
  return self->_containingBundleID;
}

- (int64_t)adopterProcessType
{
  return self->_adopterProcessType;
}

- (void)_reloadAccount:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_wrlock(&self->rwAccountLock);
  objc_msgSend_setCachedEnvironment_(self, v6, -1);
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F1A500];
  BOOL v184 = v3;
  if (v3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      account = self->_account;
      *(_DWORD *)buf = 134218242;
      v189 = self;
      __int16 v190 = 2112;
      v191 = (CKDContainer *)account;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Reloading the account for container %p - the previous account was %@", buf, 0x16u);
    }
  }
  p_account = &self->_account;
  objc_msgSend_accountID(self->_account, v7, v8);
  uint64_t v13 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = self->_pcsCache;
  uint64_t v17 = objc_msgSend_deviceContext(self, v15, v16);
  uint64_t v20 = objc_msgSend_testServer(v17, v18, v19);

  v185 = v20;
  if (v20) {
    LODWORD(v20) = objc_msgSend_useLiveServer(v20, v21, v22) ^ 1;
  }
  int v23 = objc_msgSend_accountOverrideInfo(self, v21, v22);
  uint64_t v26 = objc_msgSend_email(v23, v24, v25);
  int isEqualToString = objc_msgSend_isEqualToString_(v26, v27, *MEMORY[0x1E4F1A570]);

  if (isEqualToString)
  {
    v31 = [CKDAccount alloc];
    uint64_t inited = objc_msgSend_initAnonymousAccount(v31, v32, v33);
    goto LABEL_12;
  }
  uint64_t v35 = objc_msgSend_accountOverrideInfo(self, v29, v30);
  uint64_t v38 = objc_msgSend_email(v35, v36, v37);
  int v40 = objc_msgSend_isEqualToString_(v38, v39, *MEMORY[0x1E4F1A5F0]);

  if (v40)
  {
    uint64_t v43 = [CKDAccount alloc];
    uint64_t inited = objc_msgSend_initPrimaryAccount(v43, v44, v45);
LABEL_12:
    uint64_t v46 = (CKDContainer *)inited;
    if (inited) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!v20)
  {
    v132 = objc_msgSend_accountOverrideInfo(self, v41, v42);
    uint64_t v135 = objc_msgSend_email(v132, v133, v134);
    if (v135)
    {
      v138 = (void *)v135;
      v139 = objc_msgSend_accountOverrideInfo(self, v136, v137);
      v142 = objc_msgSend_password(v139, v140, v141);

      if (v142)
      {
        v145 = [CKDAccount alloc];
        v148 = objc_msgSend_accountOverrideInfo(self, v146, v147);
        uint64_t v46 = (CKDContainer *)objc_msgSend_initExplicitCredentialsAccountWithAccountOverrideInfo_(v145, v149, (uint64_t)v148);

        if (!v46) {
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    else
    {
    }
    v150 = v9;
    v151 = objc_msgSend_accountOverrideInfo(self, v143, v144);
    v154 = objc_msgSend_accountID(v151, v152, v153);

    if (v154)
    {
      v157 = [CKDAccount alloc];
      v160 = objc_msgSend_accountOverrideInfo(self, v158, v159);
      v163 = objc_msgSend_accountID(v160, v161, v162);
      uint64_t v46 = (CKDContainer *)objc_msgSend_initWithAccountID_(v157, v164, (uint64_t)v163);
    }
    else
    {
      v165 = objc_msgSend_accountOverrideInfo(self, v155, v156);
      v168 = objc_msgSend_altDSID(v165, v166, v167);

      v169 = [CKDAccount alloc];
      v172 = v169;
      if (v168)
      {
        v173 = objc_msgSend_accountOverrideInfo(self, v170, v171);
        v176 = objc_msgSend_altDSID(v173, v174, v175);
        uint64_t v46 = (CKDContainer *)objc_msgSend_initWithAltDSID_(v172, v177, (uint64_t)v176);
      }
      else
      {
        uint64_t v46 = (CKDContainer *)objc_msgSend_initPrimaryAccount(v169, v170, v171);
      }
    }
    uint64_t v9 = v150;
    if (!v46) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v79 = [CKDAccount alloc];
  v82 = objc_msgSend_deviceContext(self, v80, v81);
  objc_msgSend_testDevice(v82, v83, v84);
  v85 = v183 = p_rwAccountLock;
  v88 = objc_msgSend_daemonAccount(v85, v86, v87);
  objc_msgSend_deviceContext(self, v89, v90);
  v92 = uint64_t v91 = v14;
  v95 = objc_msgSend_testDevice(v92, v93, v94);
  uint64_t v46 = (CKDContainer *)objc_msgSend_initMockAccountWithTestAccount_testDevice_(v79, v96, (uint64_t)v88, v95);

  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v14 = v91;

  p_rwAccountLock = v183;
  if (!v46)
  {
LABEL_13:
    v47 = [CKDAccount alloc];
    uint64_t v46 = (CKDContainer *)objc_msgSend_initAnonymousAccount(v47, v48, v49);
  }
LABEL_14:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v50 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v51 = v50;
    uint64_t v54 = objc_msgSend_containerID(self, v52, v53);
    objc_msgSend_accountOverrideInfo(self, v55, v56);
    v57 = v13;
    uint64_t v58 = v14;
    char v60 = v59 = v9;
    *(_DWORD *)buf = 138413058;
    v189 = v46;
    __int16 v190 = 2048;
    v191 = self;
    __int16 v192 = 2112;
    v193 = v54;
    __int16 v194 = 2112;
    v195 = v60;
    _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_INFO, "Loaded account %@ for CKDContainer %p, containerID %@ with account override info:%@", buf, 0x2Au);

    uint64_t v9 = v59;
    uint64_t v14 = v58;
    uint64_t v13 = v57;
    p_account = &self->_account;
  }
  objc_storeStrong((id *)p_account, v46);
  if (self->_pcsManager && objc_msgSend_shouldUsePCSEncryption(self, v61, v62))
  {
    pcsManager = self->_pcsManager;
    v186[0] = MEMORY[0x1E4F143A8];
    v186[1] = 3221225472;
    v186[2] = sub_1C4D61614;
    v186[3] = &unk_1E64F05C8;
    v187 = v14;
    objc_msgSend_updateAccount_clearPCSCacheHandler_(pcsManager, v64, (uint64_t)v46, v186);
  }
  uint64_t v65 = objc_msgSend_accountID(v46, v61, v62);
  id pcsCacheAssertion = v13;
  if (v13 == (CKDContainer *)v65) {
    goto LABEL_38;
  }
  uint64_t v69 = (void *)v65;
  if (v13)
  {
    v182 = p_account;
    v70 = v14;
    v71 = v9;
    uint64_t v72 = p_rwAccountLock;
    v75 = objc_msgSend_accountID(v46, v66, v67);
    if (v75)
    {
      v76 = objc_msgSend_accountID(v46, v73, v74);
      char v78 = objc_msgSend_isEqualToString_(v13, v77, (uint64_t)v76);
    }
    else
    {
      char v78 = 0;
    }

    p_rwAccountLock = v72;
    uint64_t v9 = v71;
    uint64_t v14 = v70;
    p_account = v182;
  }
  else
  {
    char v78 = 0;
  }

  if ((v78 & 1) == 0 && v184)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v99 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v178 = v99;
      objc_msgSend_accountID(v46, v179, v180);
      v181 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v189 = v13;
      __int16 v190 = 2112;
      v191 = v181;
      _os_log_debug_impl(&dword_1C4CFF000, v178, OS_LOG_TYPE_DEBUG, "The account identifier changed from %@ to %@ - posting an account changed notification and cancelling all outstanding operations", buf, 0x16u);
    }
    objc_msgSend_cancelAllOperations(self, v100, v101);
    pcsCache = self->_pcsCache;
    self->_pcsCache = 0;

    id pcsCacheAssertion = self->_pcsCacheAssertion;
    self->_id pcsCacheAssertion = 0;
LABEL_38:
  }
  v103 = v14;
  uint64_t v104 = objc_msgSend_entitlements(self, v97, v98);
  objc_msgSend_apsEnvironmentEntitlement(v104, v105, v106);
  id v107 = (id)objc_claimAutoreleasedReturnValue();

  if (!v107
    || !objc_msgSend_compare_options_(v107, v108, *MEMORY[0x1E4F19CE0], 1)
    && (objc_msgSend_serverPreferredPushEnvironment(*p_account, v109, v110),
        uint64_t v111 = objc_claimAutoreleasedReturnValue(),
        v107,
        (id v107 = (id)v111) == 0))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v112 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v112, OS_LOG_TYPE_DEBUG, "No APS environment set. Falling back to production.", buf, 2u);
    }
    id v107 = (id)*MEMORY[0x1E4F4E1D0];
  }
  objc_msgSend_setResolvedAPSEnvironmentString_(self, v109, (uint64_t)v107);
  v115 = objc_msgSend_containerID(self, v113, v114);
  uint64_t v118 = objc_msgSend_accountID(self->_account, v116, v117);
  int v120 = objc_msgSend_gatekeeperForContainerID_accountID_(CKDZoneGatekeeper, v119, (uint64_t)v115, v118);
  objc_msgSend_setGatekeeper_(self, v121, (uint64_t)v120);

  long long v122 = [CKDAppContainerAccountTuple alloc];
  long long v125 = objc_msgSend_appContainerTuple(self, v123, v124);
  __int16 v128 = objc_msgSend_accountID(self->_account, v126, v127);
  __int16 v130 = objc_msgSend_initWithAppContainerTuple_accountID_(v122, v129, (uint64_t)v125, v128);

  objc_msgSend__writeAdopterMetadataToCache_(self, v131, (uint64_t)v130);
  pthread_rwlock_unlock(p_rwAccountLock);
}

- (void)setResolvedAPSEnvironmentString:(id)a3
{
}

- (void)setGatekeeper:(id)a3
{
}

- (void)setCachedEnvironment:(int64_t)a3
{
  self->_cachedEnvironment = a3;
}

- (id)_initWithAppContainerTuple:(id)a3 processScopedClientProxy:(id)a4 logicalDeviceScopedClientProxy:(id)a5 containerEntitlements:(id)a6 containerOptions:(id)a7
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  id v214 = a3;
  id v13 = a4;
  id obj = a5;
  id v213 = a6;
  id v14 = a7;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v188 = v15;
    v191 = objc_msgSend_applicationID(v214, v189, v190);
    __int16 v194 = objc_msgSend_containerID(v214, v192, v193);
    *(_DWORD *)buf = 134219010;
    v222 = self;
    __int16 v223 = 2112;
    id v224 = v13;
    __int16 v225 = 2112;
    id v226 = obj;
    __int16 v227 = 2114;
    v228 = v191;
    __int16 v229 = 2114;
    v230 = v194;
    _os_log_debug_impl(&dword_1C4CFF000, v188, OS_LOG_TYPE_DEBUG, "Setting up container %p for proxies %@ / %@, applicationID:%{public}@, containerID:%{public}@", buf, 0x34u);
  }
  v220.receiver = self;
  v220.super_class = (Class)CKDContainer;
  uint64_t v16 = [(CKDContainer *)&v220 init];
  uint64_t v17 = (uint64_t)v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_appContainerTuple, a3);
    objc_storeStrong((id *)(v17 + 320), a7);
    objc_storeStrong((id *)(v17 + 312), a6);
    uint64_t v18 = objc_opt_new();
    uint64_t v19 = *(void **)(v17 + 552);
    *(void *)(v17 + 552) = v18;

    if (pthread_rwlock_init((pthread_rwlock_t *)(v17 + 8), 0))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v195 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        v198 = v195;
        objc_msgSend_containerID((void *)v17, v199, v200);
        v201 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v222 = v201;
        _os_log_error_impl(&dword_1C4CFF000, v198, OS_LOG_TYPE_ERROR, "Failed to initialize account lock in container: %@", buf, 0xCu);
      }
      v202 = NSString;
      v100 = objc_msgSend_containerID((void *)v17, v196, v197);
      objc_msgSend_stringWithFormat_(v202, v203, @"Failed to initialize account lock in container: %@", v100);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_UTF8String(v13, v204, v205);
      _os_crash();
      __break(1u);
    }
    else
    {
      uint64_t v20 = objc_opt_new();
      uint64_t v21 = *(void **)(v17 + 496);
      *(void *)(v17 + 496) = v20;

      uint64_t v22 = objc_opt_new();
      int v23 = *(void **)(v17 + 504);
      *(void *)(v17 + 504) = v22;

      uint64_t v24 = objc_opt_new();
      uint64_t v25 = *(void **)(v17 + 512);
      *(void *)(v17 + 512) = v24;

      uint64_t v26 = objc_opt_new();
      v27 = *(void **)(v17 + 520);
      *(void *)(v17 + 520) = v26;

      uint64_t v28 = objc_opt_new();
      uint64_t v29 = *(void **)(v17 + 528);
      *(void *)(v17 + 528) = v28;

      uint64_t v30 = objc_opt_new();
      v31 = *(void **)(v17 + 536);
      *(void *)(v17 + 536) = v30;

      uint64_t v32 = objc_opt_new();
      uint64_t v33 = *(void **)(v17 + 544);
      *(void *)(v17 + 544) = v32;

      objc_storeWeak((id *)(v17 + 248), v13);
      objc_storeWeak((id *)(v17 + 256), obj);
      objc_msgSend_processName((void *)v17, v34, v35);
      a6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(NSString, v36, @"%@.%@", @"com.apple.cloudkit.cancellation", a6, v213);
      id v37 = objc_claimAutoreleasedReturnValue();
      int v40 = (const char *)objc_msgSend_UTF8String(v37, v38, v39);
      v41 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v42 = dispatch_queue_create(v40, v41);
      uint64_t v43 = *(void **)(v17 + 616);
      *(void *)(v17 + 616) = v42;

      objc_msgSend_stringWithFormat_(NSString, v44, @"%@.%@", @"com.apple.cloudkit.status", a6);
      id v45 = objc_claimAutoreleasedReturnValue();
      uint64_t v48 = (const char *)objc_msgSend_UTF8String(v45, v46, v47);
      uint64_t v49 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      os_log_t v50 = dispatch_queue_attr_make_with_qos_class(v49, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v51 = dispatch_queue_create(v48, v50);
      uint64_t v52 = *(void **)(v17 + 624);
      *(void *)(v17 + 624) = v51;

      if (objc_msgSend_bypassPCSEncryption(v14, v53, v54))
      {
        objc_msgSend_stringWithFormat_(NSString, v55, @"%@.%@", @"com.apple.cloudkit.accountStatus", a6);
        id v56 = objc_claimAutoreleasedReturnValue();
        v59 = (const char *)objc_msgSend_UTF8String(v56, v57, v58);
        dispatch_workloop_t v60 = dispatch_workloop_create(v59);
        uint64_t v61 = *(void **)(v17 + 696);
        *(void *)(v17 + 696) = v60;
      }
      else
      {
        if (qword_1EBBCFB68 != -1) {
          dispatch_once(&qword_1EBBCFB68, &unk_1F2042A10);
        }
        id v62 = (id)qword_1EBBCFB60;
        id v56 = *(id *)(v17 + 696);
        *(void *)(v17 + 696) = v62;
      }

      objc_msgSend_stringWithFormat_(NSString, v63, @"%@.%@", @"com.apple.cloudkit.tccauth", a6);
      id v64 = objc_claimAutoreleasedReturnValue();
      uint64_t v67 = (const char *)objc_msgSend_UTF8String(v64, v65, v66);
      uint64_t v68 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v69 = dispatch_queue_create(v67, v68);
      v70 = *(void **)(v17 + 688);
      *(void *)(v17 + 688) = v69;

      dispatch_queue_set_specific(*(dispatch_queue_t *)(v17 + 688), "com.apple.cloudkit.containerTCCQueue", (void *)1, 0);
      uint64_t v71 = objc_opt_new();
      uint64_t v72 = *(void **)(v17 + 704);
      *(void *)(v17 + 704) = v71;

      uint64_t v75 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v73, v74);
      v76 = *(void **)(v17 + 720);
      *(void *)(v17 + 720) = v75;

      v79 = objc_msgSend_currentProcess(CKDDaemonProcess, v77, v78);
      unint64_t v82 = objc_msgSend_processType(v79, v80, v81);

      if (v82 <= 2) {
        *(void *)(v17 + 664) = qword_1C5080480[v82];
      }
      objc_msgSend__setupOperationQueues((void *)v17, v83, v84);
      id v85 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v86 = *(void **)(v17 + 656);
      *(void *)(v17 + 656) = v85;

      objc_msgSend__registerForTCCAuthorizationEvents((void *)v17, v87, v88);
      objc_msgSend_hasTCCAuthorization_((void *)v17, v89, 0);
      v92 = objc_msgSend_processScopedClientProxy((void *)v17, v90, v91);
      int IsAttached = objc_msgSend_processIsAttached(v92, v93, v94);

      if (IsAttached) {
        objc_msgSend_hasValidatedEntitlements((void *)v17, v96, v97);
      }
      if (!objc_msgSend_holdAllOperations(v14, v96, v97)) {
        goto LABEL_20;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v100 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v100, OS_LOG_TYPE_DEBUG, "This client requested that we hold all its operations.", buf, 2u);
LABEL_20:
    int v101 = objc_msgSend_holdAllOperations(v14, v98, v99);
    objc_msgSend_setContainerAvailable_((void *)v17, v102, v101 ^ 1u);
    *(void *)(v17 + 264) = -1;
    if (objc_msgSend_forceEnableReadOnlyManatee(v14, v103, v104))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v107 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v206 = v107;
        v209 = objc_msgSend_containerID(v214, v207, v208);
        v212 = objc_msgSend_procName(v13, v210, v211);
        *(_DWORD *)buf = 134218498;
        v222 = (CKDContainer *)v17;
        __int16 v223 = 2112;
        id v224 = v209;
        __int16 v225 = 2112;
        id v226 = v212;
        _os_log_debug_impl(&dword_1C4CFF000, v206, OS_LOG_TYPE_DEBUG, "CKDContainer (%p) for container %@ (%@) is forcing manatee to be enabled. Weird stuff might happen- you've been warned!", buf, 0x20u);
      }
    }
    objc_msgSend__loadApplicationContainerPathAndType((void *)v17, v105, v106);
    if (v13)
    {
      id v110 = objc_alloc(MEMORY[0x1E4F223A0]);
      uint64_t v113 = objc_msgSend_applicationBundleID((void *)v17, v111, v112);
      id v219 = 0;
      v115 = objc_msgSend_initWithBundleIdentifier_error_(v110, v114, (uint64_t)v113, &v219);
      id v116 = v219;

      if (v116)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v119 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          int v120 = v119;
          objc_msgSend_applicationBundleID((void *)v17, v121, v122);
          long long v123 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v222 = v123;
          __int16 v223 = 2112;
          id v224 = v116;
          _os_log_impl(&dword_1C4CFF000, v120, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an application: %@", buf, 0x16u);
        }
      }
      else if (v115)
      {
        uint64_t v124 = objc_msgSend_containingBundleRecord(v115, v117, v118);
        uint64_t v127 = objc_msgSend_bundleIdentifier(v124, v125, v126);
        objc_msgSend_setContainingBundleID_((void *)v17, v128, (uint64_t)v127);
      }
      uint64_t v129 = objc_msgSend_clientSDKVersion(v13, v117, v118);
      objc_msgSend_setClientSDKVersion_((void *)v17, v130, v129);
      uint64_t isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v13, v131, v132);
      objc_msgSend_setIsClientMainBundleAppleExecutable_((void *)v17, v134, isClientMainBundleAppleExecutable);
    }
    objc_msgSend__determineHardwareInfo((void *)v17, v108, v109);
    if (qword_1EBBCFB70 != -1) {
      dispatch_once(&qword_1EBBCFB70, &unk_1F2042A30);
    }
    id v135 = (id)qword_1EBBCFB78;
    objc_sync_enter(v135);
    v136 = (void *)qword_1EBBCFB78;
    v139 = objc_msgSend_directoryContext((void *)v17, v137, v138);
    v142 = objc_msgSend_temporaryDirectory(v139, v140, v141);
    uint64_t v144 = objc_msgSend_objectForKeyedSubscript_(v136, v143, (uint64_t)v142);

    if (v144)
    {
      objc_sync_exit(v135);

      dispatch_group_wait(v144, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v144 = dispatch_group_create();
      v145 = (void *)qword_1EBBCFB78;
      v148 = objc_msgSend_directoryContext((void *)v17, v146, v147);
      v151 = objc_msgSend_temporaryDirectory(v148, v149, v150);
      objc_msgSend_setObject_forKeyedSubscript_(v145, v152, (uint64_t)v144, v151);

      dispatch_group_enter(v144);
      objc_sync_exit(v135);

      v155 = objc_msgSend_directoryContext((void *)v17, v153, v154);
      v158 = objc_msgSend_temporaryDirectory(v155, v156, v157);
      objc_msgSend_lastPathComponent(v158, v159, v160);
      v161 = (CKDContainer *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v162 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v165 = v162;
        v168 = objc_msgSend_directoryContext((void *)v17, v166, v167);
        uint64_t v171 = objc_msgSend_temporaryDirectory(v168, v169, v170);
        v174 = objc_msgSend_CKSanitizedPath(v171, v172, v173);
        *(_DWORD *)buf = 138412546;
        v222 = v161;
        __int16 v223 = 2112;
        id v224 = v174;
        _os_log_impl(&dword_1C4CFF000, v165, OS_LOG_TYPE_INFO, "Purging %@ directory at %@", buf, 0x16u);
      }
      uint64_t v175 = (void *)MEMORY[0x1E4F19F70];
      v176 = objc_msgSend_directoryContext((void *)v17, v163, v164);
      v179 = objc_msgSend_temporaryDirectory(v176, v177, v178);
      objc_msgSend_purgeDirectoryAtURL_(v175, v180, (uint64_t)v179);

      dispatch_group_leave(v144);
    }
    objc_initWeak(&location, (id)v17);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v181 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v222 = (CKDContainer *)v17;
      _os_log_impl(&dword_1C4CFF000, v181, OS_LOG_TYPE_INFO, "Registering container %p for account-change-notification", buf, 0xCu);
    }
    BOOL v184 = objc_msgSend_sharedNotifier(CKDAccountNotifier, v182, v183);
    v216[0] = MEMORY[0x1E4F143A8];
    v216[1] = 3221225472;
    v216[2] = sub_1C4D60A10;
    v216[3] = &unk_1E64F0BC8;
    objc_copyWeak(&v217, &location);
    objc_msgSend_registerObserver_forAccountChangeNotification_(v184, v185, v17, v216);

    objc_msgSend__reloadAccount_((void *)v17, v186, 0);
    objc_destroyWeak(&v217);
    objc_destroyWeak(&location);
  }
  return (id)v17;
}

- (BOOL)hasValidatedEntitlements
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_processScopedClientProxy(self, a2, v2);
  if (objc_msgSend_processIsAttached(v4, v5, v6) && self->_hasValidatedEntitlementsTernary == -1)
  {
    uint64_t v9 = objc_msgSend_clientConnection(v4, v7, v8);
    uint64_t v12 = objc_msgSend_xpcConnection(v9, v10, v11);
    uint64_t v15 = v12;
    if (v12) {
      objc_msgSend_auditToken(v12, v13, v14);
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }
    uint64_t v16 = SecTaskCreateWithAuditToken(0, &v21);

    if (v16)
    {
      self->_hasValidatedEntitlementsTernary = SecTaskEntitlementsValidated();
      if (!CKBoolFromCKTernary()) {
        self->_hasValidatedEntitlementsTernary = (~SecTaskGetCodeSignStatus(v16) & 0x24000001) == 0;
      }
      if ((CKBoolFromCKTernary() & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v18 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v23 = self;
          _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Binary has invalid entitlements for %@", buf, 0xCu);
        }
      }
      CFRelease(v16);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v17 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "Unable to get SecTask for connection to determine entitlement validity", buf, 2u);
      }
    }
  }
  char v19 = CKBoolFromCKTernary();

  return v19;
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_uint64_t isClientMainBundleAppleExecutable = a3;
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (void)_setupOperationQueues
{
  BOOL v3 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v3;

  uint64_t v5 = NSString;
  uint64_t v8 = objc_msgSend_processName(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v5, v9, @"com.apple.cloudkit.operation.%@", v8);
  objc_msgSend_setName_(self->_operationQueue, v11, (uint64_t)v10);

  objc_msgSend_setSuspended_(self->_operationQueue, v12, 1);
  id v13 = (NSOperationQueue *)objc_opt_new();
  cleanupOperationQueue = self->_cleanupOperationQueue;
  self->_cleanupOperationQueue = v13;

  uint64_t v15 = NSString;
  uint64_t v18 = objc_msgSend_processName(self, v16, v17);
  uint64_t v20 = objc_msgSend_stringWithFormat_(v15, v19, @"com.apple.cloudkit.cleanup.%@", v18);
  objc_msgSend_setName_(self->_cleanupOperationQueue, v21, (uint64_t)v20);

  objc_msgSend_setSuspended_(self->_cleanupOperationQueue, v22, 1);
  int v23 = (NSOperationQueue *)objc_opt_new();
  uncancellableOperationQueue = self->_uncancellableOperationQueue;
  self->_uncancellableOperationQueue = v23;

  uint64_t v25 = NSString;
  uint64_t v28 = objc_msgSend_processName(self, v26, v27);
  uint64_t v30 = objc_msgSend_stringWithFormat_(v25, v29, @"com.apple.cloudkit.uncancellable.%@", v28);
  objc_msgSend_setName_(self->_uncancellableOperationQueue, v31, (uint64_t)v30);

  objc_msgSend_setMaxConcurrentOperationCount_(self->_uncancellableOperationQueue, v32, 4);
  objc_msgSend_setSuspended_(self->_uncancellableOperationQueue, v33, 1);
  v34 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  backgroundOperationThrottleQueue = self->_backgroundOperationThrottleQueue;
  self->_backgroundOperationThrottleQueue = v34;

  uint64_t v36 = NSString;
  uint64_t v39 = objc_msgSend_processName(self, v37, v38);
  v41 = objc_msgSend_stringWithFormat_(v36, v40, @"com.apple.cloudkit.background.%@", v39);
  objc_msgSend_setName_(self->_backgroundOperationThrottleQueue, v42, (uint64_t)v41);

  objc_msgSend_setMaxConcurrentOperationCount_(self->_backgroundOperationThrottleQueue, v43, 4);
  objc_msgSend_setSuspended_(self->_backgroundOperationThrottleQueue, v44, 1);
  id v45 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  cloudKitSupportOperationThrottleQueue = self->_cloudKitSupportOperationThrottleQueue;
  self->_cloudKitSupportOperationThrottleQueue = v45;

  uint64_t v47 = NSString;
  os_log_t v50 = objc_msgSend_processName(self, v48, v49);
  uint64_t v52 = objc_msgSend_stringWithFormat_(v47, v51, @"com.apple.cloudkit.support.%@", v50);
  objc_msgSend_setName_(self->_cloudKitSupportOperationThrottleQueue, v53, (uint64_t)v52);

  uint64_t v55 = self->_cloudKitSupportOperationThrottleQueue;
  objc_msgSend_setSuspended_(v55, v54, 1);
}

- (NSString)processName
{
  BOOL v3 = objc_msgSend_processScopedClientProxy(self, a2, v2);
  objc_msgSend_procName(v3, v4, v5);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (!v6) {
    uint64_t v6 = @"(unknown)";
  }
  uint64_t v8 = v6;

  return v8;
}

- (CKDProcessScopedClientProxy)processScopedClientProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processScopedClientProxy);
  return (CKDProcessScopedClientProxy *)WeakRetained;
}

- (void)setContainerAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A548];
  if (a3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    uint64_t v6 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = self;
      uint64_t v9 = "System is available. Starting work queue for %@";
LABEL_18:
      _os_log_debug_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_DEBUG, v9, buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    uint64_t v6 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = self;
      uint64_t v9 = "System is unavailable. Stopping work queue for %@";
      goto LABEL_18;
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = objc_msgSend_operationQueue(self, v7, v8, 0);
  v36[0] = v10;
  id v13 = objc_msgSend_cleanupOperationQueue(self, v11, v12);
  v36[1] = v13;
  uint64_t v16 = objc_msgSend_uncancellableOperationQueue(self, v14, v15);
  v36[2] = v16;
  char v19 = objc_msgSend_backgroundOperationThrottleQueue(self, v17, v18);
  v36[3] = v19;
  uint64_t v22 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v20, v21);
  v36[4] = v22;
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v36, 5);

  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v32, v37, 16);
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v33;
    uint64_t v30 = !v3;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend_setSuspended_(*(void **)(*((void *)&v32 + 1) + 8 * i), v27, v30);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v32, v37, 16);
    }
    while (v28);
  }
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)linkWithClientContainer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_clientContainers(self, v5, v6);
  objc_sync_enter(v7);
  uint64_t v10 = objc_msgSend_clientContainers(self, v8, v9);
  char v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  if (v12)
  {
    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v15 = objc_msgSend_clientContainers(self, v13, v14);
    objc_msgSend_addObject_(v15, v16, (uint64_t)v4);

    objc_sync_exit(v7);
    char v19 = objc_msgSend_uncancellableOperationQueue(self, v17, v18);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1C4D04D44;
    v21[3] = &unk_1E64F0948;
    v21[4] = self;
    id v22 = v4;
    objc_msgSend_addOperationWithBlock_(v19, v20, (uint64_t)v21);
  }
}

- (NSHashTable)clientContainers
{
  return self->_clientContainers;
}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v4, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1C4D0B670;
    v9[3] = &unk_1E64F0E18;
    v9[4] = self;
    id v10 = v6;
    objc_msgSend_addOperationWithBlock_(v7, v8, (uint64_t)v9);
  }
}

- (void)importantUserIDsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D0D5F8;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (NSOperationQueue)uncancellableOperationQueue
{
  return self->_uncancellableOperationQueue;
}

- (NSOperationQueue)cloudKitSupportOperationThrottleQueue
{
  return self->_cloudKitSupportOperationThrottleQueue;
}

- (NSOperationQueue)cleanupOperationQueue
{
  return self->_cleanupOperationQueue;
}

- (NSOperationQueue)backgroundOperationThrottleQueue
{
  return self->_backgroundOperationThrottleQueue;
}

- (void)_registerForTCCAuthorizationEvents
{
  objc_initWeak(&location, self);
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4);
  id v8 = objc_msgSend_defaultObserver(CKDAuthorizationObserver, v6, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D65564;
  v12[3] = &unk_1E64F0D00;
  objc_copyWeak(&v13, &location);
  id v10 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v5, v9, @"CKDAuthorizationChangedNotification", v8, 0, v12);
  authorizationChangedRegistration = self->_authorizationChangedRegistration;
  self->_authorizationChangedRegistration = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_loadApplicationContainerPathAndType
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [CKDDirectoryContext alloc];
  uint64_t v5 = objc_msgSend_initWithContainer_(v3, v4, (uint64_t)self);
  objc_msgSend_setDirectoryContext_(self, v6, (uint64_t)v5);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v42 = v7;
    id v45 = objc_msgSend_ckShortDescription(self, v43, v44);
    uint64_t v48 = objc_msgSend_directoryContext(self, v46, v47);
    *(_DWORD *)buf = 138543618;
    dispatch_queue_t v51 = v45;
    __int16 v52 = 2112;
    uint64_t v53 = v48;
    _os_log_debug_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_DEBUG, "Container %{public}@ using directories %@", buf, 0x16u);
  }
  id v10 = objc_msgSend_applicationBundleID(self, v8, v9);
  id v49 = 0;
  id v12 = (id)objc_msgSend_applicationDataContainerDirectoryForBundleID_outApplicationBinaryBundleURL_outAdopterProcessType_(CKDContainer, v11, (uint64_t)v10, &v49, &self->_adopterProcessType);
  id v13 = v49;

  if (!v13)
  {
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  uint64_t v17 = Unique;
  if (!Unique)
  {
LABEL_15:
    char v36 = 1;
    goto LABEL_19;
  }
  uint64_t v18 = CFBundleGetValueForInfoDictionaryKey(Unique, (CFStringRef)*MEMORY[0x1E4F1CC48]);
  uint64_t v19 = CFBundleGetValueForInfoDictionaryKey(v17, (CFStringRef)*MEMORY[0x1E4F1D008]);
  uint64_t v20 = (void *)v19;
  if (v18) {
    uint64_t v21 = v18;
  }
  else {
    uint64_t v21 = (void *)v19;
  }
  objc_storeStrong((id *)&self->_applicationDisplayName, v21);
  CFBundleGetValueForInfoDictionaryKey(v17, (CFStringRef)*MEMORY[0x1E4F1D020]);
  id v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  applicationVersion = self->_applicationVersion;
  self->_applicationVersion = v22;

  CFBundleGetValueForInfoDictionaryKey(v17, (CFStringRef)*MEMORY[0x1E4F1CC58]);
  uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    uint64_t v27 = v24;
    objc_msgSend_pathExtension(v24, v25, v26);
    uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    if (v28 && objc_msgSend_length(v28, v29, v30))
    {
      uint64_t v34 = objc_msgSend_stringByDeletingPathExtension(v27, v32, v33);
      long long v35 = v27;
      uint64_t v27 = (__CFString *)v34;
    }
    else
    {
      long long v35 = v31;
      v31 = @"icns";
    }

    id v37 = (NSURL *)CFBundleCopyResourceURL(v17, v27, v31, 0);
    applicationIcon = self->_applicationIcon;
    self->_applicationIcon = v37;
  }
  char v36 = 0;
LABEL_19:
  applicationDisplayName = self->_applicationDisplayName;
  if (applicationDisplayName)
  {
    uint64_t v40 = applicationDisplayName;
  }
  else
  {
    objc_msgSend_applicationBundleID(self, v14, v15);
    uint64_t v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v41 = self->_applicationDisplayName;
  self->_applicationDisplayName = v40;

  if ((v36 & 1) == 0) {
    CFRelease(v17);
  }
}

- (void)setDirectoryContext:(id)a3
{
}

- (void)_determineHardwareInfo
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_containerID(self, a2, v2);
  id v8 = objc_msgSend_containerIdentifier(v5, v6, v7);
  uint64_t v9 = CKDeviceUDID();
  id v11 = objc_msgSend_stringWithFormat_(v4, v10, @"%@-%@", v8, v9);

  *(_OWORD *)md = 0u;
  long long v24 = 0u;
  id v13 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v12, (uint64_t)md, 32, 0);
  uint64_t v16 = (const void *)objc_msgSend_UTF8String(v11, v14, v15);
  CC_LONG v18 = objc_msgSend_lengthOfBytesUsingEncoding_(v11, v17, 4);
  CC_SHA256(v16, v18, md);
  objc_msgSend_CKUppercaseHexStringWithoutSpaces(v13, v19, v20);
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  hardwareID = self->_hardwareID;
  self->_hardwareID = v21;
}

+ (id)applicationDataContainerDirectoryForBundleID:(id)a3 outApplicationBinaryBundleURL:(id *)a4 outAdopterProcessType:(int64_t *)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v77 = 0;
  uint64_t v9 = objc_msgSend_initWithBundleIdentifier_error_(v7, v8, (uint64_t)v6, &v77);
  id v10 = (__CFString *)v77;
  id v11 = (void *)MEMORY[0x1E4F1A550];
  id v12 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v75 = a5;
  if (v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v13 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v13;
      uint64_t v19 = objc_msgSend_containingBundleRecord(v9, v17, v18);
      objc_msgSend_bundleIdentifier(v19, v20, v21);
      id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v79 = v6;
      __int16 v80 = 2112;
      uint64_t v81 = v22;
      _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Launch Services reports that bundle ID %@ belongs to an application extension with containing bundle id: %@", buf, 0x16u);
    }
    int v23 = objc_msgSend_containingBundleRecord(v9, v14, v15);
    uint64_t v26 = objc_msgSend_bundleIdentifier(v23, v24, v25);

    id v6 = (id)v26;
  }
  id v27 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v76 = 0;
  uint64_t v29 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v27, v28, (uint64_t)v6, 0, &v76);
  id v30 = v76;
  if (v29)
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v31 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v79 = v6;
      _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Launch Services reports that bundle ID %@ belongs to an application.", buf, 0xCu);
    }
  }
  if (v10 && v30)
  {
    if (*v11 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v32 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v79 = v6;
      __int16 v80 = 2112;
      uint64_t v81 = v10;
      __int16 v82 = 2112;
      id v83 = v30;
      _os_log_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an application or extension. extensionError=%@ applicationError=%@", buf, 0x20u);
    }
  }
  uint64_t v72 = v30;
  uint64_t v74 = v10;
  if (v9) {
    uint64_t v33 = v9;
  }
  else {
    uint64_t v33 = v29;
  }
  id v34 = v33;
  id v37 = objc_msgSend_dataContainerURL(v34, v35, v36);
  uint64_t v40 = objc_msgSend_applicationState(v29, v38, v39);
  int isInstalled = objc_msgSend_isInstalled(v40, v41, v42);

  uint64_t v46 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v44, v45);
  id v49 = objc_msgSend_currentPersona(v46, v47, v48);
  __int16 v52 = objc_msgSend_userPersonaUniqueString(v49, v50, v51);

  if (*v11 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v53 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    dispatch_workloop_t v60 = @"NO";
    if (isInstalled) {
      dispatch_workloop_t v60 = @"YES";
    }
    uint64_t v71 = v60;
    uint64_t v61 = v53;
    id v64 = objc_msgSend_CKSanitizedPath(v37, v62, v63);
    uint64_t v67 = objc_msgSend_URL(v34, v65, v66);
    v70 = objc_msgSend_CKSanitizedPath(v67, v68, v69);
    *(_DWORD *)buf = 138413314;
    id v79 = v6;
    __int16 v80 = 2112;
    uint64_t v81 = v71;
    __int16 v82 = 2112;
    id v83 = v64;
    __int16 v84 = 2112;
    id v85 = v70;
    __int16 v86 = 2112;
    uint64_t v87 = v52;
    _os_log_debug_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_DEBUG, "applicationBundleID:%@, installed:%@, containerPath:%@, callingBundlePath:%@, currentPersona:%@", buf, 0x34u);
  }
  if (a4)
  {
    objc_msgSend_URL(v34, v54, v55);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v75)
  {
    int v56 = objc_msgSend_developerType(v29, v54, v55);
    uint64_t v57 = 3;
    if (v56 == 1) {
      uint64_t v57 = 1;
    }
    uint64_t v58 = 2 * (v56 != 1);
    if (!v29) {
      uint64_t v58 = 4;
    }
    if (v9) {
      uint64_t v58 = v57;
    }
    int64_t *v75 = v58;
  }

  return v37;
}

+ (CKDContainer)containerWithAppContainerTuple:(id)a3 processScopedClientProxy:(id)a4 logicalDeviceScopedClientProxy:(id)a5 containerEntitlements:(id)a6 containerOptions:(id)a7 sharedContainerTable:(id)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v51 = a4;
  id v52 = a5;
  id v55 = a6;
  id v54 = a7;
  id v15 = a8;
  uint64_t v53 = v15;
  id v50 = a1;
  if (v15)
  {
    id v16 = v15;
    objc_sync_enter(v16);
    uint64_t v19 = objc_msgSend_allObjects(v16, v17, v18);
    objc_sync_exit(v16);
  }
  else
  {
    uint64_t v19 = 0;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v20 = v19;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v56, v60, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v57 != v25) {
          objc_enumerationMutation(v20);
        }
        id v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v28 = objc_msgSend_appContainerTuple(v27, v22, v23, v50);
        if (!objc_msgSend_isEqual_(v28, v29, (uint64_t)v14)) {
          goto LABEL_14;
        }
        long long v32 = objc_msgSend_entitlements(v27, v30, v31);
        if ((objc_msgSend_isEqual_(v32, v33, (uint64_t)v55) & 1) == 0)
        {

LABEL_14:
          continue;
        }
        uint64_t v36 = objc_msgSend_options(v27, v34, v35);
        char isEqual = objc_msgSend_isEqual_(v36, v37, (uint64_t)v54);

        if (isEqual)
        {
          id v47 = v27;
          id v48 = v20;
          goto LABEL_21;
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v56, v60, 16);
    }
    while (v24);
  }

  uint64_t v39 = [CKDContainer alloc];
  id v47 = (id)objc_msgSend__initWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_(v39, v40, (uint64_t)v14, v51, v52, v55, v54);
  uint64_t v43 = objc_msgSend_sharedInternalUseContainers(v50, v41, v42);
  BOOL v44 = v43 == v53;

  if (v44) {
    objc_msgSend_setIsForClouddInternalUse_(v47, v45, 1);
  }
  if (v53)
  {
    id v48 = v53;
    objc_sync_enter(v48);
    objc_msgSend_addObject_(v48, v46, (uint64_t)v47);
    objc_sync_exit(v48);
LABEL_21:
  }
  return (CKDContainer *)v47;
}

+ (id)sharedInternalUseContainers
{
  if (qword_1EBBCFB48 != -1) {
    dispatch_once(&qword_1EBBCFB48, &unk_1F20429D0);
  }
  uint64_t v2 = (void *)qword_1EBBCFB40;
  return v2;
}

- (BOOL)shouldUsePCSEncryption
{
  uint64_t v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  if (objc_msgSend_useEncryption(v4, v5, v6))
  {
    uint64_t v9 = objc_msgSend_options(self, v7, v8);
    int v12 = objc_msgSend_bypassPCSEncryption(v9, v10, v11) ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (CKDAccount)account
{
  id v7 = objc_msgSend_accountOrNil(self, a2, v2);
  if (!v7)
  {
    uint64_t v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CKDContainer.m", 625, @"Container %@ had an unexpectedly-nil account ivar", self);
  }
  return (CKDAccount *)v7;
}

- (id)accountOrNil
{
  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_rdlock(&self->rwAccountLock);
  uint64_t v4 = self->_account;
  pthread_rwlock_unlock(p_rwAccountLock);
  return v4;
}

- (BOOL)beginContentAccess
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v5 = objc_msgSend_accessCount(v2, v3, v4);
  objc_msgSend_setAccessCount_(v2, v6, v5 + 1);
  v2->_contentDiscarded = 0;
  uint64_t v9 = objc_msgSend_pcsCacheAssertion(v2, v7, v8);

  if (!v9)
  {
    int v12 = objc_msgSend_pcsCacheIfExists(v2, v10, v11);
    id v15 = objc_msgSend_autoContentAccessingProxy(v12, v13, v14);
    objc_msgSend_setPcsCacheAssertion_(v2, v16, (uint64_t)v15);
  }
  objc_sync_exit(v2);

  return 1;
}

- (void)setPcsCacheAssertion:(id)a3
{
}

- (id)pcsCacheIfExists
{
  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_rdlock(&self->rwAccountLock);
  uint64_t v4 = self->_pcsCache;
  pthread_rwlock_unlock(p_rwAccountLock);
  return v4;
}

- (id)pcsCacheAssertion
{
  return objc_getProperty(self, a2, 568, 1);
}

- (void)endContentAccess
{
  id obj = self;
  objc_sync_enter(obj);
  if (objc_msgSend_accessCount(obj, v2, v3))
  {
    uint64_t v6 = objc_msgSend_accessCount(obj, v4, v5);
    objc_msgSend_setAccessCount_(obj, v7, v6 - 1);
  }
  if (!objc_msgSend_accessCount(obj, v4, v5)) {
    objc_msgSend_setPcsCacheAssertion_(obj, v8, 0);
  }
  objc_sync_exit(obj);
}

- (unint64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(unint64_t)a3
{
  self->_accessCount = a3;
}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  uint64_t v4 = objc_msgSend_options(self, a2, v2);
  id v7 = objc_msgSend_accountOverrideInfo(v4, v5, v6);
  id v10 = v7;
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    int v12 = objc_msgSend_deviceContext(self, v8, v9);
    id v15 = objc_msgSend_testDevice(v12, v13, v14);
    objc_msgSend_accountOverrideInfo(v15, v16, v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (CKAccountOverrideInfo *)v11;
}

- (CKDLogicalDeviceContext)deviceContext
{
  objc_msgSend_lock(self->_deviceContextLock, a2, v2);
  deviceContext = self->_deviceContext;
  if (!deviceContext)
  {
    if (*MEMORY[0x1E4F1A4E0])
    {
      id v7 = objc_msgSend_options(self, v4, v5);
      id v10 = objc_msgSend_testDeviceReferenceProtocol(v7, v8, v9);
      objc_msgSend_deviceContextForTestDeviceReference_(CKDLogicalDeviceContext, v11, (uint64_t)v10);
      int v12 = (CKDLogicalDeviceContext *)objc_claimAutoreleasedReturnValue();
      os_log_t v13 = self->_deviceContext;
      self->_deviceContext = v12;
    }
    else
    {
      objc_msgSend_defaultContext(CKDLogicalDeviceContext, v4, v5);
      uint64_t v14 = (CKDLogicalDeviceContext *)objc_claimAutoreleasedReturnValue();
      id v7 = self->_deviceContext;
      self->_deviceContext = v14;
    }

    objc_msgSend_testServer(self->_deviceContext, v15, v16);
    uint64_t v17 = (CKDTestServerProtocol *)objc_claimAutoreleasedReturnValue();
    testServer = self->_testServer;
    self->_testServer = v17;

    deviceContext = self->_deviceContext;
  }
  uint64_t v19 = deviceContext;
  objc_msgSend_unlock(self->_deviceContextLock, v20, v21);
  return v19;
}

- (CKContainerOptions)options
{
  return (CKContainerOptions *)objc_getProperty(self, a2, 320, 1);
}

- (int64_t)_accountStatus
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_accountStatusWorkloop(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  id v7 = objc_msgSend_applicationBundleID(self, v5, v6);
  char v8 = sub_1C4D0D89C(v7, self);

  if (v8)
  {
    int64_t v11 = 2;
  }
  else
  {
    int v12 = objc_msgSend_account(self, v9, v10);
    uint64_t v15 = objc_msgSend_accountType(v12, v13, v14);

    if (v15 == 1)
    {
      int64_t v11 = 3;
    }
    else if (objc_msgSend_canAccessAccount(self, v16, v17))
    {
      int64_t v11 = 1;
    }
    else
    {
      int64_t v11 = 3;
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v18 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v20 = v18;
    uint64_t v21 = CKStringFromAccountStatus();
    int v22 = 138543362;
    uint64_t v23 = v21;
    _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Account status is %{public}@", (uint8_t *)&v22, 0xCu);
  }
  return v11;
}

- (OS_dispatch_workloop)accountStatusWorkloop
{
  return self->_accountStatusWorkloop;
}

- (CKEntitlements)entitlements
{
  return (CKEntitlements *)objc_getProperty(self, a2, 312, 1);
}

- (int64_t)hasTCCAuthorization:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = 0;
  os_log_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  if (dispatch_get_specific("com.apple.cloudkit.containerTCCQueue"))
  {
    int64_t HasTCCAuthorization = objc_msgSend__lockedHasTCCAuthorization_(self, v5, v3);
    v13[3] = HasTCCAuthorization;
  }
  else
  {
    char v8 = objc_msgSend_tccAuthQueue(self, v5, v6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4D033B8;
    block[3] = &unk_1E64F0D28;
    block[4] = self;
    block[5] = &v12;
    BOOL v11 = v3;
    dispatch_sync(v8, block);

    int64_t HasTCCAuthorization = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return HasTCCAuthorization;
}

- (OS_dispatch_queue)tccAuthQueue
{
  return self->_tccAuthQueue;
}

- (CKDPCSManager)pcsManager
{
  objc_msgSend_lock(self->_pcsManagerLock, a2, v2);
  pthread_rwlock_rdlock(&self->rwAccountLock);
  pcsManager = self->_pcsManager;
  if (!pcsManager)
  {
    if (objc_msgSend_shouldUsePCSEncryption(self, v4, v5))
    {
      id v7 = [CKDPCSManager alloc];
      uint64_t v9 = (CKDProxyPCSManager *)objc_msgSend_initWithContainer_account_(v7, v8, (uint64_t)self, self->_account);
    }
    else
    {
      uint64_t v9 = objc_alloc_init(CKDProxyPCSManager);
    }
    uint64_t v10 = self->_pcsManager;
    self->_pcsManager = (CKDPCSManager *)v9;

    pcsManager = self->_pcsManager;
  }
  BOOL v11 = pcsManager;
  pthread_rwlock_unlock(&self->rwAccountLock);
  objc_msgSend_unlock(self->_pcsManagerLock, v12, v13);
  return v11;
}

+ (id)sharedDetachedContainers
{
  if (qword_1EBBCFB58 != -1) {
    dispatch_once(&qword_1EBBCFB58, &unk_1F20429F0);
  }
  uint64_t v2 = (void *)qword_1EBBCFB50;
  return v2;
}

+ (CKDContainer)containerWithAppContainerAccountTuple:(id)a3 deviceContext:(id)a4 sharedContainerTable:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v13 = objc_msgSend_appContainerTuple(v10, v11, v12);
  uint64_t v16 = objc_msgSend_metadataCache(v9, v14, v15);
  uint64_t v19 = objc_msgSend_applicationID(v13, v17, v18);
  uint64_t v21 = objc_msgSend_applicationMetadataForApplicationID_(v16, v20, (uint64_t)v19);

  uint64_t v24 = objc_msgSend_metadataCache(v9, v22, v23);

  uint64_t v26 = objc_msgSend_appContainerAccountMetadataForAppContainerAccountTuple_(v24, v25, (uint64_t)v10);

  uint64_t v29 = objc_msgSend_entitlements(v21, v27, v28);
  long long v32 = objc_msgSend_containerOptions(v26, v30, v31);
  if (objc_msgSend_hasAllowFakeEntitlementsEntitlement(v29, v33, v34))
  {
    id v37 = objc_msgSend_fakeEntitlements(v32, v35, v36);
    uint64_t v40 = objc_msgSend_count(v37, v38, v39);

    if (v40)
    {
      uint64_t v42 = objc_msgSend_fakeEntitlements(v32, v35, v41);
      uint64_t v44 = objc_msgSend_entitlementsByAddingOverlay_(v29, v43, (uint64_t)v42);

      uint64_t v29 = (void *)v44;
    }
  }
  uint64_t v45 = objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(a1, v35, (uint64_t)v13, 0, 0, v29, v32, v8);
  id v48 = objc_msgSend_containingBundleID(v21, v46, v47);
  objc_msgSend_setContainingBundleID_(v45, v49, (uint64_t)v48);

  uint64_t v52 = objc_msgSend_clientSDKVersion(v21, v50, v51);
  objc_msgSend_setClientSDKVersion_(v45, v53, v52);
  uint64_t isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v21, v54, v55);
  objc_msgSend_setIsClientMainBundleAppleExecutable_(v45, v57, isClientMainBundleAppleExecutable);

  return (CKDContainer *)v45;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "%@ in dealloc", buf, 0xCu);
  }
  objc_msgSend_dropMMCS(self, v4, v5);
  id v8 = objc_msgSend_sharedNotifier(CKDAccountNotifier, v6, v7);
  objc_msgSend_unregisterObserverForAccountChangeNotification_(v8, v9, (uint64_t)self);

  objc_msgSend__unregisterForTCCAuthorizationEvents(self, v10, v11);
  pthread_rwlock_destroy(&self->rwAccountLock);
  v12.receiver = self;
  v12.super_class = (Class)CKDContainer;
  [(CKDContainer *)&v12 dealloc];
}

- (void)invalidate
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v121 = self;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_INFO, "Invalidating %@", buf, 0xCu);
  }
  id v8 = objc_msgSend_operationQueue(self, v6, v7);
  int isSuspended = objc_msgSend_isSuspended(v8, v9, v10);

  if (isSuspended)
  {
    objc_msgSend__setupOperationQueues(self, v12, v13);
  }
  else
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v14 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v121 = self;
      _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Cancelling all operations for %@", buf, 0xCu);
    }
    uint64_t v17 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v15, v16);
    objc_msgSend_cancelAllOperations(v17, v18, v19);

    int v22 = objc_msgSend_backgroundOperationThrottleQueue(self, v20, v21);
    objc_msgSend_cancelAllOperations(v22, v23, v24);

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v27 = objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v25, v26, 0);
    id v30 = objc_msgSend_operations(v27, v28, v29);

    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v116, v128, 16);
    if (v32)
    {
      uint64_t v35 = v32;
      uint64_t v36 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v117 != v36) {
            objc_enumerationMutation(v30);
          }
          uint64_t v38 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          objc_msgSend_container(v38, v33, v34);
          uint64_t v39 = (CKDContainer *)objc_claimAutoreleasedReturnValue();

          if (v39 == self) {
            objc_msgSend_cancel(v38, v33, v34);
          }
        }
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v116, v128, 16);
      }
      while (v35);
    }

    uint64_t v42 = objc_msgSend_operationQueue(self, v40, v41);
    objc_msgSend_cancelAllOperations(v42, v43, v44);

    objc_msgSend_cancelAllOperations(self->_fetchAggregator, v45, v46);
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v47 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      id v83 = v47;
      __int16 v86 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v84, v85);
      v89 = objc_msgSend_operations(v86, v87, v88);
      *(_DWORD *)buf = 138412546;
      v121 = self;
      __int16 v122 = 2112;
      long long v123 = v89;
      _os_log_debug_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_DEBUG, "Waiting for all operations on the cloudkit service queue to finish for %@: %@", buf, 0x16u);
    }
    id v50 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v48, v49);
    objc_msgSend_waitUntilAllOperationsAreFinished(v50, v51, v52);

    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v53 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v90 = v53;
      v93 = objc_msgSend_backgroundOperationThrottleQueue(self, v91, v92);
      v96 = objc_msgSend_operations(v93, v94, v95);
      *(_DWORD *)buf = 138412546;
      v121 = self;
      __int16 v122 = 2112;
      long long v123 = v96;
      _os_log_debug_impl(&dword_1C4CFF000, v90, OS_LOG_TYPE_DEBUG, "Waiting for all operations on the background more operations queue to finish for %@: %@", buf, 0x16u);
    }
    long long v56 = objc_msgSend_backgroundOperationThrottleQueue(self, v54, v55);
    objc_msgSend_waitUntilAllOperationsAreFinished(v56, v57, v58);

    uint64_t v61 = objc_msgSend_operationQueue(self, v59, v60);
    objc_msgSend_cancelAllOperations(v61, v62, v63);

    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v64 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v97 = v64;
      v100 = objc_msgSend_operationQueue(self, v98, v99);
      v103 = objc_msgSend_operations(v100, v101, v102);
      uint64_t v106 = objc_msgSend_cleanupOperationQueue(self, v104, v105);
      uint64_t v109 = objc_msgSend_operations(v106, v107, v108);
      uint64_t v112 = objc_msgSend_uncancellableOperationQueue(self, v110, v111);
      v115 = objc_msgSend_operations(v112, v113, v114);
      *(_DWORD *)buf = 138413058;
      v121 = self;
      __int16 v122 = 2112;
      long long v123 = v103;
      __int16 v124 = 2112;
      long long v125 = v109;
      __int16 v126 = 2112;
      uint64_t v127 = v115;
      _os_log_debug_impl(&dword_1C4CFF000, v97, OS_LOG_TYPE_DEBUG, "Waiting for all operations to finish for %@. operationQueue=%@ cleanupOperationQueue=%@ uncancellableOperationQueue=%@", buf, 0x2Au);
    }
    uint64_t v67 = objc_msgSend_operationQueue(self, v65, v66);
    objc_msgSend_waitUntilAllOperationsAreFinished(v67, v68, v69);

    uint64_t v72 = objc_msgSend_cleanupOperationQueue(self, v70, v71);
    objc_msgSend_waitUntilAllOperationsAreFinished(v72, v73, v74);

    id v77 = objc_msgSend_uncancellableOperationQueue(self, v75, v76);
    objc_msgSend_waitUntilAllOperationsAreFinished(v77, v78, v79);
  }
  if (*v3 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  __int16 v80 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v121 = self;
    _os_log_impl(&dword_1C4CFF000, v80, OS_LOG_TYPE_INFO, "Finished flushing operation queue for %@", buf, 0xCu);
  }
  objc_msgSend_tearDownAssetTransfers(self, v81, v82);
}

- (void)_clearCaches
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134217984;
    uint64_t v29 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Clearing the asset cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_clearAssetCache(self, v6, v7);
  if (*v3 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134217984;
    uint64_t v29 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Clearing the record cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_clearRecordCache(self, v9, v10);
  if (*v3 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134217984;
    uint64_t v29 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Clearing the persisted PCS cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  uint64_t v14 = objc_msgSend_pcsCache(self, v12, v13);
  objc_msgSend_clearPCSCaches(v14, v15, v16);

  if (*v3 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v17 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134217984;
    uint64_t v29 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Clearing the in-memory PCS cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  id v20 = objc_msgSend_pcsCache(self, v18, v19);
  objc_msgSend_clearPCSMemoryCaches(v20, v21, v22);

  if (*v3 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v23 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134217984;
    uint64_t v29 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Clearing the container info cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  uint64_t v26 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v24, v25);
  objc_msgSend_expireConfigurationForContainer_(v26, v27, (uint64_t)self);
}

- (void)dropMMCS
{
  objc_msgSend_drop(self->_MMCS, a2, v2);
  MMCS = self->_MMCS;
  self->_MMCS = 0;
}

- (BOOL)_cloudKitEnabledForCurrentClient
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_entitlements(self, a2, v2);
  if (objc_msgSend_hasCloudKitSystemServiceEntitlement(v4, v5, v6))
  {

    return 1;
  }
  id v9 = objc_msgSend_deviceContext(self, v7, v8);
  objc_super v12 = objc_msgSend_testDeviceReference(v9, v10, v11);

  if (v12) {
    return 1;
  }
  uint64_t v17 = objc_msgSend_containerID(self, v13, v14);
  id v20 = objc_msgSend_representativeDataclass(v17, v18, v19);

  if (v20
    && (objc_msgSend_account(self, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        char isDataclassEnabled = objc_msgSend_isDataclassEnabled_(v23, v24, (uint64_t)v20),
        v23,
        (isDataclassEnabled & 1) == 0))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      int v28 = v20;
      _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "%@ dataclass disabled, denying access", (uint8_t *)&v27, 0xCu);
    }
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)canAccessAccount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isForClouddInternalUse(self, a2, v2))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v7 = objc_msgSend_applicationBundleID(self, v4, v5);
    char v8 = sub_1C4FC2808(v7, self);

    if (v8)
    {
      LOBYTE(v6) = MEMORY[0x1F4181798](self, sel__cloudKitEnabledForCurrentClient, v9);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v10 = (void *)*MEMORY[0x1E4F1A500];
      int v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO);
      if (v6)
      {
        uint64_t v11 = v10;
        uint64_t v14 = objc_msgSend_applicationBundleID(self, v12, v13);
        int v16 = 138412290;
        uint64_t v17 = v14;
        _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Bundle %@ isn't authorized for CloudKit, denying access", (uint8_t *)&v16, 0xCu);

        LOBYTE(v6) = 0;
      }
    }
  }
  return v6;
}

- (BOOL)canAuthWithCloudKit
{
  uint64_t v4 = objc_msgSend_entitlements(self, a2, v2);
  if (objc_msgSend_hasAllowUnverifiedAccountEntitlement(v4, v5, v6))
  {
    char isPrimaryEmailVerified = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend_account(self, v7, v8);
    char isPrimaryEmailVerified = objc_msgSend_isPrimaryEmailVerified(v10, v11, v12);
  }
  return isPrimaryEmailVerified;
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v4 = objc_msgSend_account(self, a2, v2);
  if (objc_msgSend_accountType(v4, v5, v6) == 1 || !objc_msgSend_canAuthWithCloudKit(self, v7, v8)) {
    LOBYTE(v11) = 1;
  }
  else {
    int v11 = objc_msgSend_canAccessAccount(self, v9, v10) ^ 1;
  }

  return v11;
}

- (BOOL)allowsCellularAccess
{
  uint64_t v4 = objc_msgSend_containerID(self, a2, v2);
  uint64_t v7 = objc_msgSend_specialContainerType(v4, v5, v6);

  if (!v7) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_containerID(self, v8, v9);
  uint64_t v13 = objc_msgSend_representativeDataclass(v10, v11, v12);

  if (v13)
  {
    int v16 = objc_msgSend_account(self, v14, v15);
    char isDataclassEnabledForCellular = objc_msgSend_isDataclassEnabledForCellular_(v16, v17, (uint64_t)v13);
  }
  else
  {
    char isDataclassEnabledForCellular = 1;
  }

  return isDataclassEnabledForCellular;
}

- (BOOL)setupMMCSWrapper:(id *)a3
{
  v66[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self->_mmcsLock, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_MMCS(self, v6, v7);

  if (!v8)
  {
    int v11 = objc_msgSend_applicationBundleID(self, v9, v10);
    uint64_t v14 = objc_msgSend_directoryContext(self, v12, v13);
    uint64_t v17 = objc_msgSend_deviceContext(self, v15, v16);
    id v20 = objc_msgSend_deviceScopedDatabase(v17, v18, v19);
    id v65 = 0;
    uint64_t v22 = objc_msgSend_MMCSWrapperForApplicationBundleID_directoryContext_database_error_(CKDMMCS, v21, (uint64_t)v11, v14, v20, &v65);
    id v23 = v65;

    if (v22)
    {
      objc_msgSend_setMMCS_(self, v24, (uint64_t)v22);
      int v28 = objc_msgSend_MMCS(self, v26, v27);

      if (!v28)
      {
        uint64_t v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CKDContainer.m", 858, @"Expected non-nil MMCS wrapper for %@", self);
      }
    }
    else if (a3)
    {
      *a3 = v23;
    }
    uint64_t v31 = objc_msgSend_MMCS(self, v24, v25);
    uint64_t v34 = objc_msgSend_assetCache(v31, v32, v33);
    int isNewEmptyCache = objc_msgSend_isNewEmptyCache(v34, v35, v36);

    if (isNewEmptyCache)
    {
      uint64_t v40 = objc_msgSend_containerID(self, v38, v39);
      uint64_t v43 = objc_msgSend_specialContainerType(v40, v41, v42);

      if (v43 == 4)
      {
        uint64_t v46 = objc_msgSend_containerCloudKitDirectory(v14, v44, v45);
        uint64_t v49 = objc_msgSend_URLByDeletingLastPathComponent(v46, v47, v48);
        uint64_t v52 = objc_msgSend_defaultManager(MEMORY[0x1E4FA56E8], v50, v51);
        id v54 = objc_msgSend_pathInfoWithURL_(MEMORY[0x1E4FA56E0], v53, (uint64_t)v49);
        v66[0] = v54;
        long long v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v55, (uint64_t)v66, 1);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = sub_1C4D61D80;
        v63[3] = &unk_1E64F08D0;
        id v64 = v11;
        objc_msgSend_registerPaths_forBundleID_completionHandler_(v52, v57, (uint64_t)v56, v64, v63);
      }
    }
  }
  uint64_t v58 = objc_msgSend_MMCS(self, v9, v10);
  BOOL v59 = v58 != 0;

  objc_msgSend_unlock(self->_mmcsLock, v60, v61);
  return v59;
}

- (BOOL)setupAssetTransfers:(id *)a3
{
  return MEMORY[0x1F4181798](self, sel_setupMMCSWrapper_, a3);
}

- (void)tearDownAssetTransfers
{
  objc_msgSend_MMCS(self, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_assetCache(v8, v3, v4);
  id v7 = (id)objc_msgSend_evictAllFilesForced_(v5, v6, 0);
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D62008;
  v10[3] = &unk_1E64F0948;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (CKDServerConfiguration)serverConfig
{
  objc_msgSend_lock(self->_serverConfigLock, a2, v2);
  id v4 = self->_serverConfig;
  objc_msgSend_unlock(self->_serverConfigLock, v5, v6);
  return v4;
}

- (void)setServerConfig:(id)a3
{
  uint64_t v9 = (CKDServerConfiguration *)a3;
  objc_msgSend_lock(self->_serverConfigLock, v5, v6);
  id v8 = (const char *)v9;
  if (self->_serverConfig != v9) {
    objc_storeStrong((id *)&self->_serverConfig, a3);
  }
  objc_msgSend_unlock(self->_serverConfigLock, v8, v7);
}

- (id)CKPropertiesDescription
{
  BOOL v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 2);
  id v4 = NSString;
  uint64_t v7 = objc_msgSend_containerID(self, v5, v6);
  uint64_t v10 = objc_msgSend_applicationID(self, v8, v9);
  uint64_t v13 = objc_msgSend_personaID(self, v11, v12);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v4, v14, @"containerID=%@, applicationID=%@, personaID=%@", v7, v10, v13);
  objc_msgSend_addObject_(v3, v16, (uint64_t)v15);

  uint64_t v18 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v17, 2);
  uint64_t v21 = objc_msgSend_processScopedClientProxy(self, v19, v20);
  LODWORD(v10) = objc_msgSend_isSandboxed(v21, v22, v23);

  if (v10) {
    objc_msgSend_addObject_(v18, v24, @"sandboxed");
  }
  if (objc_msgSend_isForClouddInternalUse(self, v24, v25)) {
    objc_msgSend_addObject_(v18, v26, @"internal");
  }
  if (objc_msgSend_isClientMainBundleAppleExecutable(self, v26, v27)) {
    objc_msgSend_addObject_(v18, v28, @"clientBundleIsAppleExecutable");
  }
  uint64_t v30 = objc_msgSend_options(self, v28, v29);
  int v33 = objc_msgSend_useZoneWidePCS(v30, v31, v32);

  if (v33) {
    objc_msgSend_addObject_(v18, v34, @"zoneish");
  }
  uint64_t v36 = objc_msgSend_options(self, v34, v35);
  uint64_t v39 = objc_msgSend_mmcsEncryptionSupport(v36, v37, v38);

  if (v39 == 3)
  {
    objc_msgSend_addObject_(v18, v40, @"mmcsv1-v2");
  }
  else if (v39 == 2)
  {
    objc_msgSend_addObject_(v18, v40, @"mmcsv2");
  }
  uint64_t v42 = objc_msgSend_options(self, v40, v41);
  int v45 = objc_msgSend_bypassPCSEncryption(v42, v43, v44);

  if (v45) {
    objc_msgSend_addObject_(v18, v46, @"nopcs");
  }
  uint64_t v48 = objc_msgSend_options(self, v46, v47);
  int OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v48, v49, v50);

  if (OnlyManatee) {
    objc_msgSend_addObject_(v18, v52, @"forceManatee");
  }
  id v54 = objc_msgSend_options(self, v52, v53);
  int v57 = objc_msgSend_useAnonymousToServerShareParticipants(v54, v55, v56);

  if (v57) {
    objc_msgSend_addObject_(v18, v58, @"anonymousToServerShareParticipants");
  }
  if (objc_msgSend_count(v18, v58, v59))
  {
    uint64_t v61 = NSString;
    id v62 = objc_msgSend_componentsJoinedByString_(v18, v60, @"|");
    id v64 = objc_msgSend_stringWithFormat_(v61, v63, @"flags=%@", v62);
    objc_msgSend_addObject_(v3, v65, (uint64_t)v64);
  }
  uint64_t v66 = objc_msgSend_componentsJoinedByString_(v3, v60, @", ");

  return v66;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDContainer *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)_urlBySettingCustomBaseURL:(id)a3 onURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v8 = v6;
  if (v5 && v6)
  {
    uint64_t v9 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E4F29088], v7, (uint64_t)v6, 1);
    uint64_t v12 = objc_msgSend_scheme(v5, v10, v11);
    objc_msgSend_setScheme_(v9, v13, (uint64_t)v12);

    uint64_t v16 = objc_msgSend_host(v5, v14, v15);
    objc_msgSend_setHost_(v9, v17, (uint64_t)v16);

    uint64_t v20 = objc_msgSend_port(v5, v18, v19);
    objc_msgSend_setPort_(v9, v21, (uint64_t)v20);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v27 = 138412290;
      id v28 = v5;
      _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "Using custom url override of %@", (uint8_t *)&v27, 0xCu);
    }
    objc_msgSend_URL(v9, v23, v24);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v25 = v6;
  }

  return v25;
}

- (id)baseURLForServerType:(int64_t)a3 partitionType:(int64_t)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      if (a4 == 2)
      {
        uint64_t v7 = objc_msgSend_publicShareServiceURL(self, a2, a3);
      }
      else
      {
        uint64_t v16 = objc_msgSend_account(self, a2, a3);
        uint64_t v7 = objc_msgSend_privateShareServiceURL(v16, v17, v18);
      }
      uint64_t v19 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v5, v6);
      uint64_t v22 = objc_msgSend_customShareServiceBaseURL(v19, v20, v21);
      break;
    case 2:
      if (a4 == 2)
      {
        uint64_t v7 = objc_msgSend_publicDeviceServiceURL(self, a2, a3);
      }
      else
      {
        uint64_t v29 = objc_msgSend_account(self, a2, a3);
        uint64_t v7 = objc_msgSend_privateDeviceServiceURL(v29, v30, v31);
      }
      uint64_t v19 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v10, v11);
      uint64_t v22 = objc_msgSend_customDeviceServiceBaseURL(v19, v32, v33);
      break;
    case 3:
      if (a4 == 2)
      {
        uint64_t v7 = objc_msgSend_publicCodeServiceURL(self, a2, a3);
      }
      else
      {
        uint64_t v34 = objc_msgSend_account(self, a2, a3);
        uint64_t v7 = objc_msgSend_privateCodeServiceURL(v34, v35, v36);
      }
      uint64_t v19 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v12, v13);
      uint64_t v22 = objc_msgSend_customCodeServiceBaseURL(v19, v37, v38);
      break;
    case 4:
      if (a4 == 2)
      {
        uint64_t v7 = objc_msgSend_publicMetricsServiceURL(self, a2, a3);
      }
      else
      {
        uint64_t v39 = objc_msgSend_account(self, a2, a3);
        uint64_t v7 = objc_msgSend_privateMetricsServiceURL(v39, v40, v41);
      }
      uint64_t v19 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v14, v15);
      uint64_t v22 = objc_msgSend_customMetricsServiceBaseURL(v19, v42, v43);
      break;
    default:
      if (a4 == 2)
      {
        uint64_t v7 = objc_msgSend_publicCloudDBURL(self, a2, a3);
      }
      else
      {
        uint64_t v24 = objc_msgSend_account(self, a2, a3);
        uint64_t v7 = objc_msgSend_privateCloudDBURL(v24, v25, v26);
      }
      uint64_t v19 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v8, v9);
      uint64_t v22 = objc_msgSend_customCloudDBBaseURL(v19, v27, v28);
      break;
  }
  uint64_t v44 = (void *)v22;
  int v45 = objc_msgSend__urlBySettingCustomBaseURL_onURL_(self, v23, v22, v7);

  if (!v45)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v46 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = v46;
      uint64_t v51 = objc_msgSend_account(self, v49, v50);
      int v52 = 138412546;
      uint64_t v53 = v51;
      __int16 v54 = 2112;
      uint64_t v55 = self;
      _os_log_error_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_ERROR, "Couldn't pull url from backing account %@ or container %@", (uint8_t *)&v52, 0x16u);
    }
  }
  return v45;
}

- (void)fetchConfigurationForOperation:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v8, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4D6309C;
  v13[3] = &unk_1E64F0C10;
  objc_copyWeak(&v15, &location);
  id v11 = v7;
  id v14 = v11;
  objc_msgSend_configurationForOperation_completionHandler_(v10, v12, (uint64_t)v6, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_fetchContainerServerInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v12 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v10, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4D6320C;
  v15[3] = &unk_1E64F0C38;
  v15[4] = self;
  id v16 = v8;
  id v13 = v8;
  objc_msgSend_containerServerInfoForOperation_requireUserIDs_completionHandler_(v12, v14, (uint64_t)v9, v5, v15);
}

- (void)fetchPublicURLForServerType:(int64_t)a3 operation:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4D634E0;
  v11[3] = &unk_1E64F0C60;
  id v12 = v8;
  int64_t v13 = a3;
  id v9 = v8;
  objc_msgSend__fetchContainerServerInfoForOperation_requireUserIDs_completionHandler_(self, v10, (uint64_t)a4, 0, v11);
}

- (void)fetchImportantUserIDsForOperation:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D636A0;
  v9[3] = &unk_1E64F0C38;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend__fetchContainerServerInfoForOperation_requireUserIDs_completionHandler_(self, v8, (uint64_t)a3, 1, v9);
}

- (void)fetchServerEnvironmentForOperation:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D638F0;
  v9[3] = &unk_1E64F0C88;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend__fetchContainerServerInfoForOperation_requireUserIDs_completionHandler_(self, v8, (uint64_t)a3, 0, v9);
}

- (NSString)deviceID
{
  if (*MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_options(self, a2, v2),
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_testDeviceReferenceProtocol(v4, v5, v6),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v4,
        v7))
  {
    id v8 = objc_msgSend_options(self, a2, v2);
    uint64_t v11 = objc_msgSend_testDeviceReferenceProtocol(v8, v9, v10);
    id v14 = objc_msgSend_deviceID(v11, v12, v13);
  }
  else
  {
    id v8 = objc_msgSend_sharedManager(CKDDeviceIDManager, a2, v2);
    id v14 = objc_msgSend_deviceIdentifierForContainer_(v8, v15, (uint64_t)self);
  }

  return (NSString *)v14;
}

- (NSString)hardwareID
{
  if (*MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_options(self, a2, v2),
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_testDeviceReferenceProtocol(v4, v5, v6),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v4,
        v7))
  {
    uint64_t v10 = objc_msgSend_options(self, v8, v9);
    uint64_t v13 = objc_msgSend_testDeviceReferenceProtocol(v10, v11, v12);
    objc_msgSend_deviceID(v13, v14, v15);
    id v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = self->_hardwareID;
  }
  return v16;
}

- (void)fetchPrivateURLForServerType:(int64_t)a3 operation:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  uint64_t v11 = objc_msgSend_baseURLForServerType_partitionType_(self, v10, a3, 1);
  objc_initWeak(&location, self);
  if (v11)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Couldn't get a private URL. Fetching updated account properties", buf, 2u);
    }
    uint64_t v15 = objc_msgSend_account(self, v13, v14);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1C4D63CBC;
    v17[3] = &unk_1E64F0CB0;
    objc_copyWeak(v19, &location);
    uint64_t v18 = v9;
    v19[1] = (id)a3;
    objc_msgSend_updateAccountPropertiesAndSaveAccountWithCompletionHandler_(v15, v16, (uint64_t)v17);

    objc_destroyWeak(v19);
  }
  objc_destroyWeak(&location);
}

- (NSString)deviceName
{
  BOOL v3 = objc_msgSend_sharedClientInfo(CKDClientInfo, a2, v2);
  uint64_t v6 = objc_msgSend_hostname(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)languageCode
{
  BOOL v3 = objc_msgSend_preferredLanguages(MEMORY[0x1E4F1CA20], a2, v2);
  uint64_t v6 = objc_msgSend_firstObject(v3, v4, v5);
  uint64_t v9 = v6;
  if (v6)
  {
    id v10 = v6;
  }
  else
  {
    uint64_t v11 = objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], v7, v8);
    objc_msgSend_objectForKey_(v11, v12, *MEMORY[0x1E4F1C438]);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v10;
}

- (NSString)regionCode
{
  BOOL v3 = objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], a2, v2);
  uint64_t v5 = objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E4F1C400]);

  return (NSString *)v5;
}

- (NSString)apsEnvironmentString
{
  return (NSString *)((uint64_t (*)(CKDContainer *, char *))MEMORY[0x1F4181798])(self, sel_resolvedAPSEnvironmentString);
}

- (id)pcsManagerIfExists
{
  objc_msgSend_lock(self->_pcsManagerLock, a2, v2);
  pthread_rwlock_rdlock(&self->rwAccountLock);
  id v4 = self->_pcsManager;
  pthread_rwlock_unlock(&self->rwAccountLock);
  objc_msgSend_unlock(self->_pcsManagerLock, v5, v6);
  return v4;
}

- (CKDPCSCache)pcsCache
{
  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_rdlock(&self->rwAccountLock);
  uint64_t v5 = self->_pcsCache;
  pthread_rwlock_unlock(p_rwAccountLock);
  if (!v5)
  {
    pthread_rwlock_wrlock(p_rwAccountLock);
    pcsCache = self->_pcsCache;
    if (!pcsCache)
    {
      if (!self->_account)
      {
        uint64_t v35 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, self, @"CKDContainer.m", 1313, @"Container %@ had an unexpectedly-nil account ivar when creating a pcs cache", self);
      }
      uint64_t v9 = objc_msgSend_deviceContext(self, v6, v7);
      uint64_t v12 = objc_msgSend_containerID(self, v10, v11);
      uint64_t v15 = objc_msgSend_accountOverrideInfo(self, v13, v14);
      uint64_t v18 = objc_msgSend_accountID(self->_account, v16, v17);
      uint64_t v21 = objc_msgSend_encryptionServiceName(self, v19, v20);
      objc_msgSend_pcsCacheForContainerID_accountOverrideInfo_accountID_encryptionServiceName_(v9, v22, (uint64_t)v12, v15, v18, v21);
      uint64_t v23 = (CKDPCSCache *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = self->_pcsCache;
      self->_pcsCache = v23;

      pcsCache = self->_pcsCache;
    }
    uint64_t v5 = pcsCache;
    pthread_rwlock_unlock(p_rwAccountLock);
    id v25 = self;
    objc_sync_enter(v25);
    if (objc_msgSend_isContentAccessed(v25, v26, v27))
    {
      uint64_t v30 = objc_msgSend_autoContentAccessingProxy(v5, v28, v29);
      objc_msgSend_setPcsCacheAssertion_(v25, v31, (uint64_t)v30);
    }
    objc_sync_exit(v25);

    objc_msgSend_endContentAccess(v5, v32, v33);
  }
  return v5;
}

- (CKDRecordCache)recordCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA3D1020);
  recordCache = self->_recordCache;
  if (!recordCache)
  {
    objc_msgSend_recordCacheForContainer_(CKDRecordCache, v3, (uint64_t)self);
    uint64_t v5 = (CKDRecordCache *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_recordCache;
    self->_recordCache = v5;

    recordCache = self->_recordCache;
  }
  uint64_t v7 = recordCache;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA3D1020);
  return v7;
}

- (void)_evictRecordCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA3D1020);
  recordCache = self->_recordCache;
  self->_recordCache = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA3D1020);
}

- (CKDAnonymousSharingManager)anonymousSharingManager
{
  objc_msgSend_lock(self->_anonymousSharingManagerLock, a2, v2);
  anonymousSharingManager = self->_anonymousSharingManager;
  if (!anonymousSharingManager)
  {
    uint64_t v5 = [CKDAnonymousSharingManager alloc];
    uint64_t v7 = (CKDAnonymousSharingManager *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    uint64_t v8 = self->_anonymousSharingManager;
    self->_anonymousSharingManager = v7;

    anonymousSharingManager = self->_anonymousSharingManager;
  }
  uint64_t v9 = anonymousSharingManager;
  objc_msgSend_unlock(self->_anonymousSharingManagerLock, v10, v11);
  return v9;
}

- (NSString)associatedApplicationBundleID
{
  BOOL v3 = objc_msgSend_entitlements(self, a2, v2);
  uint64_t v6 = objc_msgSend_associatedApplicationBundleID(v3, v4, v5);

  return (NSString *)v6;
}

- (CKDAppContainerAccountTuple)appContainerAccountTuple
{
  BOOL v3 = [CKDAppContainerAccountTuple alloc];
  uint64_t v6 = objc_msgSend_appContainerTuple(self, v4, v5);
  uint64_t v9 = objc_msgSend_account(self, v7, v8);
  uint64_t v12 = objc_msgSend_accountID(v9, v10, v11);
  uint64_t v14 = objc_msgSend_initWithAppContainerTuple_accountID_(v3, v13, (uint64_t)v6, v12);

  return (CKDAppContainerAccountTuple *)v14;
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  id v4 = objc_msgSend_applicationID(self, a2, v2);
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6);

  if (!v7)
  {
    uint64_t v7 = objc_msgSend_associatedApplicationBundleID(self, v8, v9);
    if (!v7)
    {
      uint64_t v7 = objc_msgSend_applicationBundleID(self, v10, v11);
    }
  }
  return (NSString *)v7;
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  id v4 = objc_msgSend_applicationID(self, a2, v2);
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v5, v6);

  if (!v7)
  {
    uint64_t v7 = objc_msgSend_associatedApplicationBundleID(self, v8, v9);
    if (!v7)
    {
      uint64_t v7 = objc_msgSend_applicationBundleID(self, v10, v11);
    }
  }
  return (NSString *)v7;
}

- (NSString)applicationBundleIdentifierForPush
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_applicationID(self, a2, v2);
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v4, v5, v6);

  id v10 = objc_msgSend_containingBundleID(self, v8, v9);

  if (v10 && !v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = v13;
      uint64_t v31 = objc_msgSend_containingBundleID(self, v29, v30);
      uint64_t v34 = objc_msgSend_applicationBundleID(self, v32, v33);
      int v35 = 138543618;
      uint64_t v36 = v31;
      __int16 v37 = 2114;
      uint64_t v38 = v34;
      _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Using wrapping app bundle id %{public}@ for extension %{public}@ when registering push tokens", (uint8_t *)&v35, 0x16u);
    }
  }
  uint64_t v14 = objc_msgSend_applicationBundleID(self, v11, v12);
  uint64_t v17 = objc_msgSend_associatedApplicationBundleID(self, v15, v16);
  uint64_t v20 = objc_msgSend_containingBundleID(self, v18, v19);
  uint64_t v21 = CKApplicationBundleIDForPush();

  uint64_t v24 = objc_msgSend_deviceContext(self, v22, v23);
  uint64_t v26 = objc_msgSend_deviceScopedPushTopic_(v24, v25, (uint64_t)v21);

  return (NSString *)v26;
}

- (NSString)encryptionServiceName
{
  id v4 = objc_msgSend_options(self, a2, v2);
  uint64_t v7 = objc_msgSend_encryptionServiceName(v4, v5, v6);

  if (v7)
  {
    id v10 = objc_msgSend_options(self, v8, v9);
    uint64_t v13 = objc_msgSend_encryptionServiceName(v10, v11, v12);
  }
  else
  {
    uint64_t v14 = objc_msgSend_entitlements(self, v8, v9);
    id v10 = objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v14, v15, v16);

    uint64_t v19 = objc_msgSend_containerID(self, v17, v18);
    uint64_t v22 = objc_msgSend_containerIdentifier(v19, v20, v21);
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v23, (uint64_t)v22);
  }
  return (NSString *)v13;
}

- (BOOL)_isAdopterAppleInternal
{
  id v4 = objc_msgSend_deviceContext(self, a2, v2);
  uint64_t v7 = objc_msgSend_testDeviceReference(v4, v5, v6);
  id v10 = objc_msgSend_deviceID(v7, v8, v9);
  char hasSuffix = objc_msgSend_hasSuffix_(v10, v11, @"MasqueradeAsNonAppleAdopter");

  if (hasSuffix) {
    return 0;
  }
  if ((objc_msgSend_isClientMainBundleAppleExecutable(self, v13, v14) & 1) == 0)
  {
    uint64_t v17 = objc_msgSend_containerID(self, v15, v16);
    int isAppleInternal = objc_msgSend_isAppleInternal(v17, v18, v19);

    if (!isAppleInternal) {
      return 0;
    }
  }
  uint64_t v21 = objc_msgSend_containerID(self, v15, v16);
  BOOL v24 = objc_msgSend_specialContainerType(v21, v22, v23) != 6;

  return v24;
}

- (id)possiblyWrappedAuthTokenErrorGivenError:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    if ((objc_msgSend__isAdopterAppleInternal(self, v4, v5) & 1) != 0
      || (objc_msgSend_clientSDKVersion(self, v7, v8),
          !CKLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24())
      || objc_msgSend_code(v6, v9, v10) == 1028)
    {
      id v12 = v6;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1028, 0, v6, @"Account temporarily unavailable due to bad or missing auth token");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)_isContainerAuthorizedForOperation:(id)a3 error:(id *)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v61 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v61, v62, (uint64_t)a2, self, @"CKDContainer.m", 1470, @"Expected non-nil operation for proxy %@", self);
  }
  uint64_t v10 = objc_msgSend_operationInfo(v9, v7, v8);
  uint64_t v13 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v10, v11, v12);
  uint64_t v16 = v13;
  if (v13)
  {
    id v17 = v13;
  }
  else
  {
    uint64_t v18 = objc_msgSend_applicationID(self, v14, v15);
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v18, v19, v20);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v23 = objc_msgSend_operationInfo(v9, v21, v22);
  uint64_t v26 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v23, v24, v25);
  uint64_t v29 = v26;
  if (v26)
  {
    id v30 = v26;
  }
  else
  {
    uint64_t v31 = objc_msgSend_applicationID(self, v27, v28);
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v31, v32, v33);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v36 = objc_msgSend_sourceApplicationSecondaryIdentifier(v9, v34, v35);
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = sub_1C4D64D4C;
  uint64_t v72 = sub_1C4D64D5C;
  id v73 = 0;
  uint64_t v39 = objc_msgSend_entitlements(self, v37, v38);
  int hasMasqueradingEntitlement = objc_msgSend_hasMasqueradingEntitlement(v39, v40, v41);

  if (hasMasqueradingEntitlement)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    int v45 = *MEMORY[0x1E4F1A500];
    BOOL v46 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v75 = self;
      _os_log_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_INFO, "Giving %@ blanket access to any container", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v47 = objc_msgSend_entitlements(self, v43, v44);
    uint64_t v50 = objc_msgSend_clientPrefixEntitlement(v47, v48, v49);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1C4D64D64;
    aBlock[3] = &unk_1E64F0CD8;
    aBlock[4] = self;
    id v51 = v50;
    id v66 = v51;
    uint64_t v67 = &v68;
    int v52 = _Block_copy(aBlock);
    uint64_t v53 = (unsigned int (**)(void, void))v52;
    if (!v17 || ((*((uint64_t (**)(void *, id))v52 + 2))(v52, v17))
      && (!v30 || ((unsigned int (**)(void, id))v53)[2](v53, v30)))
    {
      if (!v36)
      {

        BOOL v46 = 1;
        goto LABEL_30;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      __int16 v54 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v75 = self;
        __int16 v76 = 2112;
        id v77 = v36;
        _os_log_error_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_ERROR, "Container %@ is not allowed to set an operation sourceApplicationSecondaryIdentifier to %@", buf, 0x16u);
      }
      uint64_t v56 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v55, *MEMORY[0x1E4F19C40], 8, @"Container %@ is not allowed to set an operation sourceApplicationSecondaryIdentifier to %@ without an entitlement", self, v36);
      int v57 = (void *)v69[5];
      v69[5] = v56;
    }
    if (!v69[5])
    {
      uint64_t v63 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v58, v59);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v63, v64, (uint64_t)a2, self, @"CKDContainer.m", 1524, @"Expected non-nil error for operation %@", v9);
    }
    BOOL v46 = 0;
    if (a4) {
      *a4 = (id) v69[5];
    }
  }
LABEL_30:
  _Block_object_dispose(&v68, 8);

  return v46;
}

- (CKDIdentityCache)publicIdentitiesDiskCache
{
  objc_msgSend_lock(self->_publicIdentityServiceLock, a2, v2);
  publicIdentitiesDiskCache = self->_publicIdentitiesDiskCache;
  if (!publicIdentitiesDiskCache)
  {
    uint64_t v7 = objc_msgSend_deviceContext(self, v4, v5);
    objc_msgSend_cacheWithDeviceContext_(CKDIdentityCache, v8, (uint64_t)v7);
    id v9 = (CKDIdentityCache *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_publicIdentitiesDiskCache;
    self->_publicIdentitiesDiskCache = v9;

    publicIdentitiesDiskCache = self->_publicIdentitiesDiskCache;
  }
  uint64_t v11 = publicIdentitiesDiskCache;
  objc_msgSend_unlock(self->_publicIdentityServiceLock, v12, v13);
  return v11;
}

- (CKDPublicIdentityLookupService)foregroundPublicIdentityLookupService
{
  objc_msgSend_lock(self->_publicIdentityServiceLock, a2, v2);
  foregroundPublicIdentityLookupService = self->_foregroundPublicIdentityLookupService;
  if (!foregroundPublicIdentityLookupService)
  {
    uint64_t v5 = [CKDPublicIdentityLookupService alloc];
    uint64_t v7 = (CKDPublicIdentityLookupService *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    uint64_t v8 = self->_foregroundPublicIdentityLookupService;
    self->_foregroundPublicIdentityLookupService = v7;

    foregroundPublicIdentityLookupService = self->_foregroundPublicIdentityLookupService;
  }
  id v9 = foregroundPublicIdentityLookupService;
  objc_msgSend_unlock(self->_publicIdentityServiceLock, v10, v11);
  return v9;
}

- (CKDPublicIdentityLookupService)backgroundPublicIdentityLookupService
{
  objc_msgSend_lock(self->_publicIdentityServiceLock, a2, v2);
  backgroundPublicIdentityLookupService = self->_backgroundPublicIdentityLookupService;
  if (!backgroundPublicIdentityLookupService)
  {
    uint64_t v5 = [CKDPublicIdentityLookupService alloc];
    uint64_t v7 = (CKDPublicIdentityLookupService *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    uint64_t v8 = self->_backgroundPublicIdentityLookupService;
    self->_backgroundPublicIdentityLookupService = v7;

    backgroundPublicIdentityLookupService = self->_backgroundPublicIdentityLookupService;
  }
  id v9 = backgroundPublicIdentityLookupService;
  objc_msgSend_unlock(self->_publicIdentityServiceLock, v10, v11);
  return v9;
}

+ (void)initialize
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v3, v4, v5);

  if (isAppleInternalInstall)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v7 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "Wed Dec 31 16:00:00 1969";
      _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "CloudKitDaemon.framework was built at %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1F20C0338, a3, 1, 1);
  if (MethodDescription.name)
  {
    id v6 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], MethodDescription.types, (uint64_t)MethodDescription.types);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKDContainer;
    id v6 = [(CKDContainer *)&v8 methodSignatureForSelector:a3];
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = (const char *)objc_msgSend_selector(v4, v5, v6);
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1F20C0338, v7, 1, 1);
  if (MethodDescription.name)
  {
    uint64_t v10 = objc_msgSend_entitlements(self, MethodDescription.types, v8);
    char hasSPIEntitlement = objc_msgSend_hasSPIEntitlement(v10, v11, v12);

    if ((hasSPIEntitlement & 1) == 0)
    {
      uint64_t v14 = NSString;
      uint64_t v15 = NSStringFromSelector(MethodDescription.name);
      id v17 = objc_msgSend_stringWithFormat_(v14, v16, @"%@ is CloudKit SPI and requires an entitlement. Please add the com.apple.private.cloudkit.spi entitlement to this process. This will become a hard failure.", v15);

      objc_msgSend_handleSignificantIssueBehavior_reason_(self, v18, 1, v17);
    }
    uint64_t v19 = (objc_class *)objc_opt_class();
    object_setClass(self, v19);
    objc_msgSend_setTarget_(v4, v20, (uint64_t)self);
    objc_msgSend_invoke(v4, v21, v22);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CKDContainer;
    [(CKDContainer *)&v23 forwardInvocation:v4];
  }
}

+ (id)sharedClientThrottlingOperationQueue
{
  if (qword_1EBBCFB80 != -1) {
    dispatch_once(&qword_1EBBCFB80, &unk_1F2042A70);
  }
  uint64_t v2 = (void *)qword_1EBBCFB88;
  return v2;
}

- (void)_unregisterForTCCAuthorizationEvents
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v4, (uint64_t)self->_authorizationChangedRegistration);
}

- (void)_lockedHandleTCCAuthorizationChangedEvent:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_tccAuthQueue);
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierForTCC(self, v5, v6);
  int64_t hasTCCAuthorizationTernary = self->_hasTCCAuthorizationTernary;
  if (a3 == -1 && hasTCCAuthorizationTernary != -1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Received TCC access reset, resetting TCC access for bundle identifier '%{public}@'", (uint8_t *)&v12, 0xCu);
    }
    if (TCCAccessSetForBundleId()) {
      a3 = 1;
    }
    else {
      a3 = -1;
    }
    int64_t hasTCCAuthorizationTernary = self->_hasTCCAuthorizationTernary;
  }
  if (hasTCCAuthorizationTernary != a3)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v10 = *MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        int v12 = 138543362;
        uint64_t v13 = v7;
        uint64_t v11 = "Updated authorization on TCC event to: ALLOWED for bundle identifier '%{public}@'";
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v10 = *MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        int v12 = 138543362;
        uint64_t v13 = v7;
        uint64_t v11 = "Updated authorization on TCC event to: UNKNOWN for bundle identifier '%{public}@'";
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v10 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v12 = 138543362;
      uint64_t v13 = v7;
      uint64_t v11 = "Updated authorization on TCC event to: DENY for bundle identifier '%{public}@'";
    }
    _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
LABEL_27:
    self->_int64_t hasTCCAuthorizationTernary = a3;
  }
}

- (void)accountAccessAuthorizationWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (void *)*MEMORY[0x1E4F1A548];
  if (v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      uint64_t v11 = objc_msgSend_ckShortDescription(self, v9, v10);
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEFAULT, "Checking TCC authorization for container %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t hasTCCAuthorization = objc_msgSend_hasTCCAuthorization_(self, v7, 0);
    v4[2](v4, hasTCCAuthorization, 0);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v5);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "No completion handler", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_lockedSetHasTCCAuthorizationTernary:(int64_t)a3
{
  self->_int64_t hasTCCAuthorizationTernary = a3;
}

- (id)containerForOperationInfo:(id)a3
{
  if (objc_msgSend_isLongLived(a3, a2, (uint64_t)a3)
    && (objc_msgSend_processScopedClientProxy(self, v4, v5),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v9 = objc_msgSend_appContainerAccountTuple(self, v7, v8);
    int v12 = objc_msgSend_deviceContext(self, v10, v11);
    uint64_t v15 = objc_msgSend_sharedDetachedContainers(CKDContainer, v13, v14);
    objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v16, (uint64_t)v9, v12, v15);
    id v17 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = self;
  }
  return v17;
}

- (void)performOperation:(id)a3 initialMessageReplyBlock:(id)a4
{
}

- (void)performOperation:(id)a3 initialMessageReplyBlock:(id)a4 customCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v96 = a5;
  int v12 = objc_msgSend_operationInfo(v8, v10, v11);
  uint64_t v15 = objc_msgSend_processScopedClientProxy(self, v13, v14);
  uint64_t v18 = objc_msgSend_operationInfo(v8, v16, v17);
  uint64_t v21 = objc_msgSend_callbackProxyEndpoint(v18, v19, v20);
  BOOL v24 = objc_msgSend_interface(v21, v22, v23);
  uint64_t v27 = objc_msgSend_protocol(v24, v25, v26);
  uint64_t v28 = (void *)v27;
  uint64_t v29 = &unk_1F20EA2B0;
  if (v27) {
    uint64_t v29 = (void *)v27;
  }
  id v30 = v29;

  uint64_t v33 = objc_msgSend_operationInfo(v8, v31, v32);
  uint64_t v36 = objc_msgSend_requestOriginator(v33, v34, v35);

  if (!v36)
  {
    uint64_t v39 = objc_msgSend_currentConnection(MEMORY[0x1E4F29268], v37, v38);

    uint64_t v42 = objc_msgSend_operationInfo(v8, v40, v41);
    uint64_t v44 = v42;
    if (v39) {
      objc_msgSend_setRequestOriginator_(v42, v43, 4);
    }
    else {
      objc_msgSend_setRequestOriginator_(v42, v43, 1);
    }
  }
  if (objc_msgSend_processIsAttached(v15, v37, v38))
  {
    id v104 = 0;
    objc_msgSend_validateAgainstLiveContainer_error_(v8, v45, (uint64_t)self, &v104);
    id v49 = v104;
  }
  else
  {
    uint64_t v50 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v51 = *MEMORY[0x1E4F19DD8];
    int v52 = objc_msgSend_operationID(v8, v45, v46);
    objc_msgSend_errorWithDomain_code_format_(v50, v53, v51, 2005, @"Client went away before operation %@ could be validated; failing",
      v52);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v49)
  {
    objc_msgSend_setError_(v8, v47, (uint64_t)v49);
    uint64_t v56 = objc_msgSend_clientOperationCallbackProxy(v8, v54, v55);
    objc_msgSend_activate(v56, v57, v58);

    objc_msgSend__handleCompletionForOperation_initialMessageReplyBlock_(self, v59, (uint64_t)v8, v9);
    uint64_t v60 = v96;
  }
  else
  {
    uint64_t v61 = objc_msgSend_operationInfo(v8, v47, v48);
    objc_msgSend_ckOperationClassName(v61, v62, v63);
    id v64 = (NSString *)objc_claimAutoreleasedReturnValue();
    Class v65 = NSClassFromString(v64);

    if (objc_msgSend_isLongLived(v8, v66, v67)
      && (objc_msgSend_isLongLivedCallbackRelayOperation(v8, v68, v69) & 1) == 0)
    {
      v93 = [CKDLongLivedOperationPersistedCallbackProxy alloc];
      uint64_t v95 = objc_msgSend_operationInfo(v8, v70, v71);
      uint64_t v74 = objc_msgSend_operationID(v95, v72, v73);
      uint64_t v77 = objc_msgSend_daemonCallbackCompletionSelector(v65, v75, v76);
      uint64_t v94 = objc_msgSend_deviceContext(self, v78, v79);
      uint64_t v82 = objc_msgSend_operationInfoCache(v94, v80, v81);
      __int16 v84 = objc_msgSend_initWithOperationID_callbackProtocol_completionSelector_operationInfoCache_(v93, v83, (uint64_t)v74, v30, v77, v82);
      objc_msgSend_setClientOperationCallbackProxy_(v8, v85, (uint64_t)v84);
    }
    __int16 v86 = objc_msgSend_clientOperationCallbackProxy(v8, v68, v69);
    objc_msgSend_activate(v86, v87, v88);

    uint64_t v91 = objc_msgSend_clientOperationCallbackProxy(v8, v89, v90);
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = sub_1C4D66064;
    v97[3] = &unk_1E64F0DA0;
    id v98 = v8;
    id v102 = v96;
    id v103 = v9;
    uint64_t v99 = self;
    id v100 = v12;
    id v101 = v30;
    objc_msgSend_handleWillStart_(v91, v92, (uint64_t)v97);

    uint64_t v60 = v96;
  }
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_operationID(v4, v5, v6);
  uint64_t v10 = objc_msgSend_operationInfo(v4, v8, v9);
  uint64_t v13 = objc_msgSend_pendingOperationIDs(self, v11, v12);
  objc_sync_enter(v13);
  uint64_t v16 = objc_msgSend_pendingOperationIDs(self, v14, v15);
  objc_msgSend_addObject_(v16, v17, (uint64_t)v7);

  objc_sync_exit(v13);
  uint64_t v20 = objc_msgSend_cancellationQueue(self, v18, v19);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4D668A8;
  v24[3] = &unk_1E64F0DF0;
  id v25 = v4;
  id v26 = v10;
  uint64_t v27 = self;
  id v28 = v7;
  id v21 = v7;
  id v22 = v10;
  id v23 = v4;
  dispatch_async(v20, v24);
}

- (int64_t)_applicationPermissionStatusFromUserPrivacySetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 1;
  }
  else {
    return qword_1C5080498[a3];
  }
}

- (void)reloadAccountWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_INFO, "Will reload the account for %@", buf, 0xCu);
  }
  id v8 = objc_msgSend_uncancellableOperationQueue(self, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4D66F04;
  v11[3] = &unk_1E64F0E18;
  void v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);
}

- (void)statusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v9 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v7, v8);
  uint64_t v10 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v10, v11, (uint64_t)v9);
  id v12 = [CKDFetchUserPrivacySettingsOperation alloc];
  uint64_t v14 = objc_msgSend_containerForOperationInfo_(self, v13, (uint64_t)v10);
  uint64_t v16 = objc_msgSend_initWithOperationInfo_container_(v12, v15, (uint64_t)v10, v14);

  objc_initWeak(&location, v16);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4D67248;
  v20[3] = &unk_1E64F0E40;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a3;
  v20[4] = self;
  id v17 = v6;
  id v21 = v17;
  objc_msgSend_setCompletionBlock_(v16, v18, (uint64_t)v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v16, 0);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

- (void)_globalStatusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v9 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v7, v8);
  uint64_t v10 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v10, v11, (uint64_t)v9);
  id v12 = [CKDBatchFetchUserPrivacySettingsOperation alloc];
  uint64_t v14 = objc_msgSend_containerForOperationInfo_(self, v13, (uint64_t)v10);
  uint64_t v16 = objc_msgSend_initWithOperationInfo_container_(v12, v15, (uint64_t)v10, v14);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v16);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4D674E0;
  v20[3] = &unk_1E64F0E68;
  objc_copyWeak(&v22, &from);
  id v17 = v6;
  id v21 = v17;
  objc_copyWeak(v23, &location);
  v23[1] = (id)a3;
  v20[4] = self;
  objc_msgSend_setCompletionBlock_(v16, v18, (uint64_t)v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v16, 0);
  objc_destroyWeak(v23);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  char v6 = a3;
  id v8 = a5;
  uint64_t v11 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v9, v10);
  id v12 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v12, v13, (uint64_t)v11);
  if (v6)
  {
    if (v5) {
      objc_msgSend_setDiscoverable_(v12, v14, 1);
    }
    else {
      objc_msgSend_setDiscoverable_(v12, v14, 2);
    }
  }
  uint64_t v15 = [CKDSaveUserPrivacySettingsOperation alloc];
  id v17 = objc_msgSend_containerForOperationInfo_(self, v16, (uint64_t)v12);
  uint64_t v19 = objc_msgSend_initWithOperationInfo_container_(v15, v18, (uint64_t)v12, v17);

  objc_initWeak(&location, v19);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = sub_1C4D678B4;
  id v26 = &unk_1E64F0E90;
  objc_copyWeak(&v28, &location);
  id v20 = v8;
  id v27 = v20;
  BOOL v29 = v5;
  objc_msgSend_setCompletionBlock_(v19, v21, (uint64_t)&v23);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v22, (uint64_t)v19, 0, v23, v24, v25, v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)requestApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D67A0C;
  v9[3] = &unk_1E64F0F50;
  id v10 = v6;
  unint64_t v11 = a3;
  void v9[4] = self;
  id v7 = v6;
  objc_msgSend_statusForApplicationPermission_completionHandler_(self, v8, a3, v9);
}

- (void)_handleCompletionForOperation:(id)a3 initialMessageReplyBlock:(id)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D683EC;
  v9[3] = &unk_1E64F05C8;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend__handleCompletionForOperation_initialMessageReplyBlock_customCompletionBlock_(self, v8, (uint64_t)v7, a4, v9);
}

- (void)_handleCompletionForOperation:(id)a3 initialMessageReplyBlock:(id)a4 customCompletionBlock:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  unint64_t v11 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v12 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = v13;
    uint64_t v46 = objc_msgSend_operationID(v8, v44, v45);
    id v49 = objc_msgSend_error(v8, v47, v48);
    uint64_t v50 = @" with error";
    if (!v49) {
      uint64_t v50 = &stru_1F2044F30;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = v46;
    __int16 v61 = 2112;
    id v62 = v50;
    _os_log_debug_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_DEBUG, "Operation %{public}@ completed%@", buf, 0x16u);
  }
  v10[2](v10);
  uint64_t v18 = objc_msgSend_processScopedClientProxy(self, v14, v15);
  if (v18)
  {
    id v21 = objc_msgSend_operationID(v8, v16, v17);
    if (*MEMORY[0x1E4F1A4E0])
    {
      id v22 = objc_msgSend_unitTestOverrides(v8, v19, v20);
      uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"PreserveCachedLongLivedOperationMetadata");

      BOOL v25 = v24 != 0;
    }
    else
    {
      BOOL v25 = 0;
    }
    if (objc_msgSend_isLongLived(v8, v19, v20)
      && ((v25 | objc_msgSend_processIsAttached(v18, v26, v27) ^ 1) & 1) == 0)
    {
      if (*v11 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v28 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v21;
        _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Deleting all cached info for operation %{public}@", buf, 0xCu);
      }
      uint64_t v31 = objc_msgSend_deviceContext(self, v29, v30);
      uint64_t v34 = objc_msgSend_operationInfoCache(v31, v32, v33);
      objc_msgSend_deleteAllInfoForOperationWithID_(v34, v35, (uint64_t)v21);
    }
  }
  uint64_t v36 = objc_msgSend_clientOperationCallbackProxy(v8, v16, v17);
  uint64_t v51 = MEMORY[0x1E4F143A8];
  uint64_t v52 = 3221225472;
  uint64_t v53 = sub_1C4D687F8;
  __int16 v54 = &unk_1E64F0F78;
  id v58 = v9;
  id v37 = v36;
  id v55 = v37;
  uint64_t v56 = self;
  id v57 = v8;
  id v38 = v8;
  id v39 = v9;
  uint64_t v40 = _Block_copy(&v51);
  uint64_t v42 = v40;
  if (v37) {
    objc_msgSend_addBarrierBlock_(v37, v41, (uint64_t)v40, v51, v52, v53, v54, v55, v56, v57, v58);
  }
  else {
    (*((void (**)(void *))v40 + 2))(v40);
  }
}

- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v9 = objc_msgSend_logicalDeviceScopedClientProxy(self, v7, v8);
  if (objc_msgSend_processIsAttached(v9, v10, v11))
  {
    uint64_t v13 = objc_msgSend_openFileWithOpenInfo_error_(v9, v12, (uint64_t)v6, a4);
  }
  else
  {
    uint64_t v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 1000, @"nil connection");
    uint64_t v15 = v14;
    if (a4) {
      *a4 = v14;
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_processScopedClientProxy(self, v10, v11);
  if (objc_msgSend_processIsAttached(v12, v13, v14))
  {
    uint64_t v16 = objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v12, v15, (uint64_t)v8, v9, a5);
  }
  else
  {
    uint64_t v17 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 1000, @"nil connection");
    uint64_t v18 = v17;
    if (a5) {
      *a5 = v17;
    }

    uint64_t v16 = 0;
  }

  return v16;
}

- (id)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v13 = objc_msgSend_logicalDeviceScopedClientProxy(self, v11, v12);
  if (objc_msgSend_processIsAttached(v13, v14, v15))
  {
    uint64_t v17 = objc_msgSend_readBytesOfInMemoryAssetContentWithUUID_offset_length_error_(v13, v16, (uint64_t)v10, a4, a5, a6);
  }
  else
  {
    uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 1000, @"nil connection");
    uint64_t v19 = v18;
    if (a6) {
      *a6 = v18;
    }

    uint64_t v17 = 0;
  }

  return v17;
}

- (void)fetchLongLivedOperationsWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_uncancellableOperationQueue(self, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D68CA8;
  v14[3] = &unk_1E64F0FA0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  objc_msgSend_addOperationWithBlock_(v10, v13, (uint64_t)v14);
}

- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D68DF0;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)performDiscoverUserIdentitiesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDDiscoverUserIdentitiesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D68FF0;
  v16[3] = &unk_1E64F0FC8;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setDiscoverUserIdentitiesProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performDiscoverAllUserIdentitiesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDDiscoverAllUserIdentitiesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D692A4;
  v16[3] = &unk_1E64F0FC8;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setDiscoverUserIdentitiesProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchShareParticipantsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchShareParticipantsOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D69554;
  v16[3] = &unk_1E64F0FF0;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setShareParticipantFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performModifyRecordZonesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDModifyRecordZonesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D698A8;
  v21[3] = &unk_1E64F1018;
  objc_copyWeak(&v23, &location);
  id v13 = v6;
  id v22 = v13;
  objc_msgSend_setSaveCompletionBlock_(v12, v14, (uint64_t)v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D69A78;
  v18[3] = &unk_1E64F1040;
  id v15 = v13;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  objc_msgSend_setDeleteCompletionBlock_(v12, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v12, v7);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)performFetchRecordZonesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchRecordZonesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D69D2C;
  v16[3] = &unk_1E64F1068;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  objc_msgSend_setRecordZoneFetchedProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)performFetchDatabaseChangesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchDatabaseChangesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1C4D6A260;
  v36[3] = &unk_1E64F1090;
  id v13 = v6;
  id v37 = v13;
  objc_copyWeak(&v38, &location);
  objc_msgSend_setRecordZoneWithIDChangedBlock_(v12, v14, (uint64_t)v36);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4D6A3A4;
  v33[3] = &unk_1E64F1090;
  id v15 = v13;
  id v34 = v15;
  objc_copyWeak(&v35, &location);
  objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(v12, v16, (uint64_t)v33);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C4D6A4E8;
  v30[3] = &unk_1E64F1090;
  id v17 = v15;
  id v31 = v17;
  objc_copyWeak(&v32, &location);
  objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(v12, v18, (uint64_t)v30);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4D6A62C;
  v27[3] = &unk_1E64F1090;
  id v19 = v17;
  id v28 = v19;
  objc_copyWeak(&v29, &location);
  objc_msgSend_setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock_(v12, v20, (uint64_t)v27);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4D6A770;
  v24[3] = &unk_1E64F10B8;
  id v21 = v19;
  id v25 = v21;
  objc_copyWeak(&v26, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v22, (uint64_t)v24);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v23, (uint64_t)v12, v7);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

- (void)performCheckSupportedDeviceCapabilitiesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDCheckSupportedDeviceCapabilitiesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D6AA48;
  v16[3] = &unk_1E64F10E0;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  objc_msgSend_setCheckSupportedDeviceCapabilitiesProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)enumerateClientContainers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v7 = objc_msgSend_clientContainers(self, v5, v6);
  objc_sync_enter(v7);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = objc_msgSend_clientContainers(self, v8, v9, 0);
  id v13 = objc_msgSend_allObjects(v10, v11, v12);

  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v19, v23, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v18, (uint64_t)&v19, v23, 16);
    }
    while (v15);
  }

  objc_sync_exit(v7);
}

- (BOOL)isEligibleForBroadcastingToContainer:(id)a3
{
  id v4 = (CKDContainer *)a3;
  id v7 = v4;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    id v8 = objc_msgSend_containerID(v4, v5, v6);
    id v11 = objc_msgSend_containerID(self, v9, v10);
    if (objc_msgSend_isEqual_(v8, v12, (uint64_t)v11))
    {
      uint64_t v15 = objc_msgSend_account(v7, v13, v14);
      id v18 = objc_msgSend_accountID(v15, v16, v17);
      long long v21 = objc_msgSend_account(self, v19, v20);
      uint64_t v24 = objc_msgSend_accountID(v21, v22, v23);
      if (objc_msgSend_isEqualToString_(v18, v25, (uint64_t)v24))
      {
        id v28 = objc_msgSend_personaID(v7, v26, v27);
        uint64_t v33 = objc_msgSend_personaID(self, v29, v30);
        if (v28 == v33)
        {
          char isEqual = 1;
        }
        else
        {
          objc_msgSend_personaID(v7, v31, v32);
          id v34 = v41 = v15;
          objc_msgSend_personaID(self, v35, v36);
          id v37 = v42 = v28;
          char isEqual = objc_msgSend_isEqual_(v34, v38, (uint64_t)v37);

          id v28 = v42;
          uint64_t v15 = v41;
        }
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {
      char isEqual = 0;
    }
  }
  return isEqual;
}

- (void)_enumerateEligibleConnectedContainersForOOPUIContainer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDContainer.m", 2705, @"Invalid parameter not satisfying: %@", @"block");
  }
  id v8 = objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, v5, v6);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v9 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Checking eligible containers for OOP-UI container %@", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D6B0BC;
  v14[3] = &unk_1E64F1130;
  v14[4] = self;
  id v15 = v7;
  id v10 = v7;
  objc_msgSend_enumerateConnections_(v8, v11, (uint64_t)v14);
}

- (void)_broadcastUpdateIfNeededForRecord:(id)a3 recordXPCMetadata:(id)a4 recordID:(id)a5 isDeleted:(BOOL)a6 error:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v18 = objc_msgSend_entitlements(self, v16, v17);
  int hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v18, v19, v20);

  if (hasOutOfProcessUIEntitlement)
  {
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v30 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v12;
        _os_log_debug_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_DEBUG, "Not informing Sharing UI observers about unknown update for record in OOP UI container: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v24 = objc_msgSend_copy(v12, v22, v23);
      if (v24)
      {
        id v26 = v24;
        objc_msgSend_updateWithSavedRecordXPCMetadata_shouldOnlySaveAssetContent_(v24, v25, (uint64_t)v13, 0);
        id v29 = objc_msgSend__copyWithoutPersonalInfo(v26, v27, v28);
      }
      else
      {
        id v29 = 0;
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1C4D6B494;
      v33[3] = &unk_1E64F1180;
      id v34 = v29;
      id v35 = v14;
      BOOL v37 = a6;
      id v36 = v15;
      id v31 = v29;
      objc_msgSend__enumerateEligibleConnectedContainersForOOPUIContainer_(self, v32, (uint64_t)v33);
    }
  }
}

- (void)performModifyRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDModifyRecordsOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1C4D6BB6C;
  v38[3] = &unk_1E64F11A8;
  id v13 = v6;
  id v39 = v13;
  objc_copyWeak(&v40, &location);
  objc_msgSend_setSaveProgressBlock_(v12, v14, (uint64_t)v38);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1C4D6BCC0;
  v35[3] = &unk_1E64F11D0;
  id v15 = v13;
  id v36 = v15;
  objc_copyWeak(&v37, &location);
  objc_msgSend_setRecordsInFlightBlock_(v12, v16, (uint64_t)v35);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4D6BE20;
  v31[3] = &unk_1E64F11F8;
  objc_copyWeak(&v34, &location);
  id v17 = v15;
  id v32 = v17;
  uint64_t v33 = self;
  objc_msgSend_setSaveCompletionBlock_(v12, v18, (uint64_t)v31);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4D6C1CC;
  v27[3] = &unk_1E64F1220;
  id v19 = v17;
  id v28 = v19;
  objc_copyWeak(&v30, &location);
  id v29 = self;
  objc_msgSend_setDeleteCompletionBlock_(v12, v20, (uint64_t)v27);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4D6C348;
  v24[3] = &unk_1E64F1248;
  id v21 = v19;
  id v25 = v21;
  objc_copyWeak(&v26, &location);
  objc_msgSend_setUploadCompletionBlock_(v12, v22, (uint64_t)v24);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v23, (uint64_t)v12, v7);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

- (void)_performFetchCurrentUserRecordOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchUserRecordOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D6C6A4;
  v16[3] = &unk_1E64F01E8;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  objc_msgSend_setCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_reallyPerformFetchRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchRecordsOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4D6CADC;
  v28[3] = &unk_1E64F1270;
  objc_copyWeak(&v29, &location);
  objc_msgSend_setRecordFetchProgressBlock_(v12, v13, (uint64_t)v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4D6CB58;
  v25[3] = &unk_1E64F1298;
  id v14 = v6;
  id v26 = v14;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setRecordFetchCommandBlock_(v12, v15, (uint64_t)v25);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = sub_1C4D6CD64;
  long long v22 = &unk_1E64F12C0;
  objc_copyWeak(&v24, &location);
  id v16 = v14;
  id v23 = v16;
  objc_msgSend_setRecordFetchCompletionBlock_(v12, v17, (uint64_t)&v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7, v19, v20, v21, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)performFetchRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  if (objc_msgSend_isFetchCurrentUserOperation(v10, v7, v8)) {
    objc_msgSend__performFetchCurrentUserRecordOperation_withBlock_(self, v9, (uint64_t)v10, v6);
  }
  else {
    objc_msgSend__reallyPerformFetchRecordsOperation_withBlock_(self, v9, (uint64_t)v10, v6);
  }
}

- (void)performFetchRecordZoneChangesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDFetchRecordZoneChangesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1C4D6D32C;
  v37[3] = &unk_1E64F1388;
  objc_copyWeak(&v39, &location);
  id v13 = v6;
  id v38 = v13;
  objc_msgSend_setRecordChangedBlock_(v12, v14, (uint64_t)v37);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4D6D510;
  v34[3] = &unk_1E64F12E8;
  id v15 = v13;
  id v35 = v15;
  objc_copyWeak(&v36, &location);
  objc_msgSend_setRecordDeletedBlock_(v12, v16, (uint64_t)v34);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4D6D670;
  v31[3] = &unk_1E64F1310;
  id v17 = v15;
  id v32 = v17;
  objc_copyWeak(&v33, &location);
  objc_msgSend_setZoneAttributesChangedBlock_(v12, v18, (uint64_t)v31);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4D6D7D0;
  v28[3] = &unk_1E64F1338;
  id v19 = v17;
  id v29 = v19;
  objc_copyWeak(&v30, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v20, (uint64_t)v28);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = sub_1C4D6D9A4;
  id v26 = &unk_1E64F09E0;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setCompletionBlock_(v12, v21, (uint64_t)&v23);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v22, (uint64_t)v12, v7, v23, v24, v25, v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)performFetchRecordChangesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDFetchRecordZoneChangesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4D6DD40;
  v31[3] = &unk_1E64F1388;
  objc_copyWeak(&v33, &location);
  id v13 = v6;
  id v32 = v13;
  objc_msgSend_setRecordChangedBlock_(v12, v14, (uint64_t)v31);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4D6DF24;
  v28[3] = &unk_1E64F12E8;
  id v15 = v13;
  id v29 = v15;
  objc_copyWeak(&v30, &location);
  objc_msgSend_setRecordDeletedBlock_(v12, v16, (uint64_t)v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4D6E080;
  v25[3] = &unk_1E64F1338;
  id v17 = v15;
  id v26 = v17;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v18, (uint64_t)v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  id v23[2] = sub_1C4D6E258;
  v23[3] = &unk_1E64F09E0;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setCompletionBlock_(v12, v19, (uint64_t)v23);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D6E2B4;
  v21[3] = &unk_1E64F09E0;
  objc_copyWeak(&v22, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v20, (uint64_t)v12, v7, v21);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)performMovePhotosOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDMovePhotosOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4D6E718;
  v26[3] = &unk_1E64F11A8;
  id v13 = v6;
  id v27 = v13;
  objc_copyWeak(&v28, &location);
  objc_msgSend_setSaveProgressBlock_(v12, v14, (uint64_t)v26);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  id v23[2] = sub_1C4D6E860;
  v23[3] = &unk_1E64F1360;
  objc_copyWeak(&v25, &location);
  id v15 = v13;
  id v24 = v15;
  objc_msgSend_setMoveCompletionBlock_(v12, v16, (uint64_t)v23);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4D6EC98;
  v20[3] = &unk_1E64F1248;
  id v17 = v15;
  id v21 = v17;
  objc_copyWeak(&v22, &location);
  objc_msgSend_setUploadCompletionBlock_(v12, v18, (uint64_t)v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v12, v7);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
}

- (void)performQueryOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDQueryOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  id v23[2] = sub_1C4D6F0EC;
  v23[3] = &unk_1E64F1388;
  id v13 = v6;
  id v24 = v13;
  objc_copyWeak(&v25, &location);
  objc_msgSend_setRecordFetchCompletionBlock_(v12, v14, (uint64_t)v23);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4D6F27C;
  v20[3] = &unk_1E64F13B0;
  id v15 = v13;
  id v21 = v15;
  objc_copyWeak(&v22, &location);
  objc_msgSend_setQueryCursorUpdatedBlock_(v12, v16, (uint64_t)v20);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D6F3DC;
  v18[3] = &unk_1E64F09E0;
  objc_copyWeak(&v19, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v17, (uint64_t)v12, v7, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)performModifySubscriptionsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDModifySubscriptionsOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D6F754;
  v21[3] = &unk_1E64F13D8;
  id v13 = v6;
  id v22 = v13;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setSaveCompletionBlock_(v12, v14, (uint64_t)v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D6F8B4;
  v18[3] = &unk_1E64F13D8;
  id v15 = v13;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  objc_msgSend_setDeleteCompletionBlock_(v12, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v12, v7);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)performFetchSubscriptionsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDFetchSubscriptionsOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D6FB68;
  v16[3] = &unk_1E64F1400;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setSubscriptionFetchedProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performAcceptSharesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDAcceptSharesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D6FE30;
  v16[3] = &unk_1E64F1428;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAcceptCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performDeclineSharesOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDDeclineSharesOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D700F8;
  v16[3] = &unk_1E64F1450;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setDeclineCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performShareAccessRequestOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDShareAccessRequestOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D703AC;
  v16[3] = &unk_1E64F1450;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setShareAccessRequestCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchShareMetadataOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDFetchShareMetadataOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_msgSend_setErrorOnOON_(v12, v13, 1);
  objc_initWeak(&location, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4D7066C;
  v17[3] = &unk_1E64F1478;
  id v14 = v6;
  id v18 = v14;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setShareMetadataFetchedBlock_(v12, v15, (uint64_t)v17);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v16, (uint64_t)v12, v7);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (void)performMapShareURLsToInstalledBundleIDsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDMapShareURLsToInstalledBundleIDsOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D70934;
  v16[3] = &unk_1E64F14A0;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setBundleIDsFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchWebAuthTokenOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDFetchWebAuthTokenOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D70BF8;
  v14[3] = &unk_1E64F09E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v13, (uint64_t)v12, v7, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)displayInfoOnAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D70E44;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)cancelAllOperations
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Scheduling a cancel of all operations for %@", buf, 0xCu);
  }
  uint64_t v6 = objc_msgSend_cancellationQueue(self, v4, v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D71274;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_barrier_async(v6, block);
}

- (void)cancelOperationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_cancellationQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D7164C;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_barrier_async(v10, block);
}

- (void)resetThrottles
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend_logicalDeviceScopedClientProxy(self, a2, v2);
  if (v3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v4 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      id v7 = v4;
      v10[0] = 67109120;
      v10[1] = objc_msgSend_pid(v3, v8, v9);
      _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "Resetting throttles in pid %d", (uint8_t *)v10, 8u);
    }
    objc_msgSend_resetThrottles(v3, v5, v6);
  }
}

- (void)addThrottle:(id)a3
{
  id v4 = a3;
  objc_msgSend_logicalDeviceScopedClientProxy(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addThrottle_(v8, v7, (uint64_t)v4);
}

- (CKDPCSFetchAggregator)fetchAggregator
{
  objc_msgSend_lock(self->_fetchAggregatorLock, a2, v2);
  fetchAggregator = self->_fetchAggregator;
  if (!fetchAggregator)
  {
    uint64_t v5 = [CKDPCSFetchAggregator alloc];
    id v7 = (CKDPCSFetchAggregator *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    id v8 = self->_fetchAggregator;
    self->_fetchAggregator = v7;

    fetchAggregator = self->_fetchAggregator;
  }
  uint64_t v9 = fetchAggregator;
  objc_msgSend_unlock(self->_fetchAggregatorLock, v10, v11);
  return v9;
}

+ (id)operationStatusReport:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend_parentOperation(v3, v5, v6),
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      id v8 = 0;
    }
    else
    {
      uint64_t v9 = NSString;
      uint64_t v10 = objc_msgSend_statusReportWithIndent_(v3, v5, 1);
      id v8 = objc_msgSend_stringWithFormat_(v9, v11, @"%@", v10);
    }
  }
  else
  {
    id v8 = objc_msgSend_stringWithFormat_(NSString, v4, @"%@", v3);
  }

  return v8;
}

- (id)CKStatusReportArrayIncludingSharedOperations:(BOOL)a3
{
  BOOL v252 = a3;
  uint64_t v258 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  uint64_t v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v10 = objc_msgSend_applicationID(self, v8, v9);
  id v15 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v10, v11, v12);
  id v16 = v15;
  if (!v15)
  {
    v251 = objc_msgSend_applicationID(self, v13, v14);
    id v16 = objc_msgSend_applicationBundleIdentifier(v251, v17, v18);
  }
  id v19 = objc_msgSend_containerID(self, v13, v14);
  id v22 = objc_msgSend_containerIdentifier(v19, v20, v21);
  id v24 = objc_msgSend_stringWithFormat_(v5, v23, @"\n____ %@ Daemon Status Report: \"%@\" (\"%@\")", v7, v16, v22);
  objc_msgSend_addObject_(v4, v25, (uint64_t)v24);

  if (!v15)
  {
  }
  objc_msgSend_addObject_(v4, v26, @"\n%%%%% Operations %%%%%");
  id v29 = objc_msgSend_operationQueue(self, v27, v28);
  uint64_t v32 = objc_msgSend_operationCount(v29, v30, v31);

  if (v32)
  {
    id v35 = NSString;
    id v36 = objc_msgSend_operationQueue(self, v33, v34);
    uint64_t v39 = objc_msgSend_operationCount(v36, v37, v38);
    uint64_t v42 = objc_msgSend_operationQueue(self, v40, v41);
    uint64_t v45 = objc_msgSend_maxConcurrentOperationCount(v42, v43, v44);
    uint64_t v47 = objc_msgSend_stringWithFormat_(v35, v46, @"Queued operations %lu/%ld {", v39, v45);
    objc_msgSend_addObject_(v4, v48, (uint64_t)v47);

    uint64_t v51 = objc_msgSend_operationQueue(self, v49, v50);
    __int16 v54 = objc_msgSend_operations(v51, v52, v53);
    uint64_t v56 = objc_msgSend_CKCompactMap_(v54, v55, (uint64_t)&unk_1F2042AF0);
    objc_msgSend_addObjectsFromArray_(v4, v57, (uint64_t)v56);

    objc_msgSend_addObject_(v4, v58, @"}");
  }
  else
  {
    objc_msgSend_addObject_(v4, v33, @"No queued operations.");
  }
  __int16 v61 = objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v59, v60);
  id v64 = objc_msgSend_operations(v61, v62, v63);

  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  id v67 = v64;
  uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v253, v257, 16);
  if (v71)
  {
    uint64_t v72 = *(void *)v254;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v254 != v72) {
          objc_enumerationMutation(v67);
        }
        uint64_t v74 = *(void **)(*((void *)&v253 + 1) + 8 * i);
        objc_msgSend_container(v74, v69, v70);
        uint64_t v75 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
        BOOL v76 = v75 == self;

        if (v76) {
          objc_msgSend_addObject_(v65, v77, (uint64_t)v74);
        }
        else {
          objc_msgSend_addObject_(v66, v77, (uint64_t)v74);
        }
      }
      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v69, (uint64_t)&v253, v257, 16);
    }
    while (v71);
  }

  if (objc_msgSend_count(v65, v78, v79))
  {
    uint64_t v82 = NSString;
    uint64_t v83 = objc_msgSend_count(v65, v80, v81);
    uint64_t v86 = objc_msgSend_count(v67, v84, v85);
    v89 = objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v87, v88);
    uint64_t v92 = objc_msgSend_maxConcurrentOperationCount(v89, v90, v91);
    uint64_t v94 = objc_msgSend_stringWithFormat_(v82, v93, @"More Operations %lu/%lu/%ld {", v83, v86, v92);
    objc_msgSend_addObject_(v4, v95, (uint64_t)v94);

    uint64_t v97 = objc_msgSend_CKCompactMap_(v65, v96, (uint64_t)&unk_1F2042B10);
    objc_msgSend_addObjectsFromArray_(v4, v98, (uint64_t)v97);

    objc_msgSend_addObject_(v4, v99, @"}");
  }
  else
  {
    objc_msgSend_addObject_(v4, v80, @"No more operations.");
  }
  if (objc_msgSend_count(v66, v100, v101) && v252)
  {
    id v104 = NSString;
    uint64_t v105 = objc_msgSend_count(v66, v102, v103);
    uint64_t v108 = objc_msgSend_count(v67, v106, v107);
    uint64_t v111 = objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v109, v110);
    uint64_t v114 = objc_msgSend_maxConcurrentOperationCount(v111, v112, v113);
    long long v116 = objc_msgSend_stringWithFormat_(v104, v115, @"Other Proxy Operations On Shared Throttling Queue %lu/%lu/%ld {", v105, v108, v114);
    objc_msgSend_addObject_(v4, v117, (uint64_t)v116);

    long long v119 = objc_msgSend_CKCompactMap_(v66, v118, (uint64_t)&unk_1F2042B30);
    objc_msgSend_addObjectsFromArray_(v4, v120, (uint64_t)v119);

    objc_msgSend_addObject_(v4, v121, @"}");
  }
  __int16 v122 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v102, v103);
  uint64_t v125 = objc_msgSend_operationCount(v122, v123, v124);

  if (v125)
  {
    __int16 v128 = NSString;
    uint64_t v129 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v126, v127);
    uint64_t v132 = objc_msgSend_operationCount(v129, v130, v131);
    id v135 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v133, v134);
    uint64_t v138 = objc_msgSend_maxConcurrentOperationCount(v135, v136, v137);
    v140 = objc_msgSend_stringWithFormat_(v128, v139, @"CloudKit Support Operations %lu/%ld {", v132, v138);
    objc_msgSend_addObject_(v4, v141, (uint64_t)v140);

    uint64_t v144 = objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v142, v143);
    uint64_t v147 = objc_msgSend_operations(v144, v145, v146);
    v149 = objc_msgSend_CKCompactMap_(v147, v148, (uint64_t)&unk_1F2042B50);
    objc_msgSend_addObjectsFromArray_(v4, v150, (uint64_t)v149);

    objc_msgSend_addObject_(v4, v151, @"}");
  }
  v152 = objc_msgSend_backgroundOperationThrottleQueue(self, v126, v127);
  uint64_t v155 = objc_msgSend_operationCount(v152, v153, v154);

  if (v155)
  {
    v158 = NSString;
    uint64_t v159 = objc_msgSend_backgroundOperationThrottleQueue(self, v156, v157);
    uint64_t v162 = objc_msgSend_operationCount(v159, v160, v161);
    v165 = objc_msgSend_backgroundOperationThrottleQueue(self, v163, v164);
    uint64_t v168 = objc_msgSend_maxConcurrentOperationCount(v165, v166, v167);
    uint64_t v170 = objc_msgSend_stringWithFormat_(v158, v169, @"More background operations %lu/%ld {", v162, v168);
    objc_msgSend_addObject_(v4, v171, (uint64_t)v170);

    v174 = objc_msgSend_backgroundOperationThrottleQueue(self, v172, v173);
    v177 = objc_msgSend_operations(v174, v175, v176);
    v179 = objc_msgSend_CKCompactMap_(v177, v178, (uint64_t)&unk_1F2042B70);
    objc_msgSend_addObjectsFromArray_(v4, v180, (uint64_t)v179);

    objc_msgSend_addObject_(v4, v181, @"}");
  }
  else
  {
    objc_msgSend_addObject_(v4, v156, @"No background operations.");
  }
  BOOL v184 = objc_msgSend_gatekeeper(self, v182, v183);
  int hasStatusToReport = objc_msgSend_hasStatusToReport(v184, v185, v186);

  if (hasStatusToReport)
  {
    v189 = objc_msgSend_stringWithFormat_(NSString, v188, @"gatekeeper {");
    objc_msgSend_addObject_(v4, v190, (uint64_t)v189);

    uint64_t v193 = objc_msgSend_gatekeeper(self, v191, v192);
    uint64_t v196 = objc_msgSend_CKStatusReportArray(v193, v194, v195);
    objc_msgSend_addObject_(v4, v197, (uint64_t)v196);

    objc_msgSend_addObject_(v4, v198, @"}");
  }
  objc_msgSend_addObject_(v4, v188, @"%%%%%%%%%%%%%%%%%%%%%%%%");
  v201 = objc_msgSend_operationStatisticsByClassName(self, v199, v200);
  uint64_t v204 = objc_msgSend_count(v201, v202, v203);

  if (v204)
  {
    objc_msgSend_addObject_(v4, v205, @"\n%%%% Operation Statistics %%%%");
    v209 = objc_msgSend_operationStatisticsByClassName(self, v207, v208);
    objc_sync_enter(v209);
    v212 = objc_msgSend_operationStatisticsByClassName(self, v210, v211);
    v215 = objc_msgSend_allValues(v212, v213, v214);
    id v217 = objc_msgSend_CKStatusReportForStatistics_(CKDOperationStatistics, v216, (uint64_t)v215);

    objc_msgSend_addObjectsFromArray_(v4, v218, (uint64_t)v217);
    objc_sync_exit(v209);

    objc_msgSend_addObject_(v4, v219, @"%%%%%%%%%%%%%%%%%%%%%%%%");
  }
  objc_super v220 = objc_msgSend_MMCS(self, v205, v206);

  if (v220)
  {
    objc_msgSend_addObject_(v4, v221, @"\n----- MMCS Engine  -----");
    __int16 v227 = objc_msgSend_MMCS(self, v223, v224);
    if (v227)
    {
      v228 = objc_msgSend_MMCS(self, v225, v226);
      uint64_t v231 = objc_msgSend_CKStatusReportArray(v228, v229, v230);
      objc_msgSend_addObject_(v4, v232, (uint64_t)v231);
    }
    else
    {
      objc_msgSend_addObject_(v4, v225, @"(No MMCS Engine)");
    }

    objc_msgSend_addObject_(v4, v233, @"\n------------------------");
  }
  v234 = objc_msgSend_pcsCache(self, v221, v222);
  int v237 = objc_msgSend_hasStatusToReport(v234, v235, v236);

  if (v237)
  {
    objc_msgSend_addObject_(v4, v238, @"\n~~~~~ PCS Cache ~~~~~");
    v243 = objc_msgSend_pcsCache(self, v239, v240);
    if (v243)
    {
      v244 = objc_msgSend_pcsCache(self, v241, v242);
      v247 = objc_msgSend_CKStatusReportArray(v244, v245, v246);
      objc_msgSend_addObject_(v4, v248, (uint64_t)v247);
    }
    else
    {
      objc_msgSend_addObject_(v4, v241, @"\n(No PCS Cache)");
    }

    objc_msgSend_addObject_(v4, v249, @"~~~~~~~~~~~~~~~~~~~~~~~~");
  }
  objc_msgSend_addObject_(v4, v238, @"\n\n_____________________________\n\n");

  return v4;
}

- (id)CKStatusReportArray
{
  return (id)objc_msgSend_CKStatusReportArrayIncludingSharedOperations_(self, a2, 0);
}

- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  objc_msgSend_processScopedClientProxy(self, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleSignificantIssueBehavior_reason_(v10, v9, a3, v6);
}

- (BOOL)canOpenFileAtURL:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_processScopedClientProxy(self, v5, v6);
  char canOpenFileAtURL = objc_msgSend_canOpenFileAtURL_(v7, v8, (uint64_t)v4);

  return canOpenFileAtURL;
}

- (void)_performCodeFunctionInvokeOperation:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CKDCodeFunctionInvokeOperation alloc];
  id v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  uint64_t v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(location, v12);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1C4D72F38;
  v32[3] = &unk_1E64F1538;
  objc_copyWeak(&v33, location);
  objc_msgSend_setReplaceLocalSerializationsBlobs_(v12, v13, (uint64_t)v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C4D73184;
  v30[3] = &unk_1E64F1588;
  objc_copyWeak(&v31, location);
  objc_msgSend_setInitialResponseReceivedCallback_(v12, v14, (uint64_t)v30);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4D7341C;
  v28[3] = &unk_1E64F15B0;
  objc_copyWeak(&v29, location);
  objc_msgSend_setReplaceWireSerializations_(v12, v15, (uint64_t)v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4D7353C;
  v26[3] = &unk_1E64F1270;
  objc_copyWeak(&v27, location);
  objc_msgSend_setRecordFetchProgressBlock_(v12, v16, (uint64_t)v26);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4D735B8;
  v24[3] = &unk_1E64F15D8;
  objc_copyWeak(&v25, location);
  objc_msgSend_setRecordFetchCommandBlock_(v12, v17, (uint64_t)v24);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D736F0;
  v21[3] = &unk_1E64F12C0;
  objc_copyWeak(&v23, location);
  id v18 = v6;
  id v22 = v18;
  objc_msgSend_setRecordFetchCompletionBlock_(v12, v19, (uint64_t)v21);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v20, (uint64_t)v12, v7);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

- (void)performCodeOperation:(id)a3 withBlock:(id)a4
{
}

- (void)performCodeFunctionInvokeOperation:(id)a3 withBlock:(id)a4
{
}

- (void)_dumpStatusReportArrayToOsTrace:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v22, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    id v10 = (os_log_t *)MEMORY[0x1E4F1A540];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend__dumpStatusReportArrayToOsTrace_(self, v13, v12);
        }
        else
        {
          if (*v9 != -1) {
            dispatch_once(v9, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v15 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v12;
            _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Proxy status report: %@", buf, 0xCu);
          }
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v14, (uint64_t)&v16, v22, 16);
    }
    while (v7);
  }
}

- (void)dumpDaemonStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_statusQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D73B54;
  block[3] = &unk_1E64F0FA0;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)submitClientEventMetric:(id)a3 completeWhenQueued:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  id v12 = objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  uint64_t v15 = objc_msgSend_processType(v12, v13, v14);

  if (v15 == 2)
  {
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    if (v6) {
      id v16 = 0;
    }
    else {
      id v16 = v9;
    }
    long long v17 = _Block_copy(v16);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = sub_1C4D64D4C;
    void v30[4] = sub_1C4D64D5C;
    id v31 = (id)os_transaction_create();
    id v20 = objc_msgSend_metricUUID(v8, v18, v19);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v20;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Daemon submitting CKEventMetric %@.", buf, 0xCu);
    }
    id v22 = (void *)MEMORY[0x1E4F50D68];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1C4D73F00;
    v26[3] = &unk_1E64F1600;
    id v23 = v20;
    id v27 = v23;
    id v29 = v30;
    id v24 = v17;
    id v28 = v24;
    objc_msgSend_reportCKEventMetric_container_completionHandler_(v22, v25, (uint64_t)v8, self, v26);
    if (v9 && !v24) {
      v9[2](v9);
    }

    _Block_object_dispose(v30, 8);
  }
}

- (void)networkTransferEndpointWithCompletionHandler:(id)a3
{
  uint64_t v38 = (void (**)(id, void *, void *))a3;
  id v7 = objc_msgSend_baseURLForServerType_partitionType_(self, v4, 0, 1);
  if (v7
    || (objc_msgSend_baseURLForServerType_partitionType_(self, v5, 0, 2),
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = objc_msgSend_host(v7, v5, v6);
    uint64_t v11 = objc_msgSend_port(v7, v9, v10);
    uint64_t v14 = objc_msgSend_stringValue(v11, v12, v13);

    if (v8 && v14)
    {
      id v16 = v8;
      uint64_t v19 = (const char *)objc_msgSend_UTF8String(v16, v17, v18);
      id v20 = v14;
      id v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);
      nw_endpoint_t host = nw_endpoint_create_host(v19, v23);
      nw_endpoint_t v27 = host;
      if (host)
      {
        id v29 = (void *)MEMORY[0x1C8789E00](host);
        if (v29)
        {
          id v30 = 0;
        }
        else
        {
          id v30 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 1000, @"Failed to copy nw_endpoint.");
        }
      }
      else
      {
        id v31 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v32 = *MEMORY[0x1E4F19DD8];
        id v33 = objc_msgSend_host(v7, v25, v26);
        id v36 = objc_msgSend_port(v7, v34, v35);
        id v30 = objc_msgSend_errorWithDomain_code_format_(v31, v37, v32, 1000, @"Failed to create nw_endpoint for host %@ with port %@.", v33, v36);

        id v29 = 0;
      }
    }
    else
    {
      id v30 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 1000, @"Failed to retrieve host and port from %@.", v7);
      id v29 = 0;
    }
  }
  else
  {
    id v30 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v5, *MEMORY[0x1E4F19DD8], 1000, @"Failed to get base URL");
    id v29 = 0;
  }
  if (v38) {
    v38[2](v38, v29, v30);
  }
}

- (void)suggestedMergeableDeltaSizeWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  id v7 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v5, v6);
  uint64_t v10 = objc_msgSend_lastKnownServerConfiguration(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_containerID(self, v11, v12);
    uint64_t v15 = objc_msgSend_suggestedMergeableDeltaSize_(v10, v14, (uint64_t)v13);

    if (v15)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v16 = *MEMORY[0x1E4F1A510];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
      {
        int v21 = 134217984;
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Found suggested mergeable delta size: %ld", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v19 = objc_msgSend_integerValue(v15, v17, v18);
    }
    else
    {
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v20 = *MEMORY[0x1E4F1A510];
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      int v21 = 134217984;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "No cached configuration for suggested mergeable delta size, returning default: %ld", (uint8_t *)&v21, 0xCu);
    }
  }
  v4[2](v4, v19);
}

- (unint64_t)countAssetCacheItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  char v3 = objc_msgSend_setupAssetTransfers_(self, a2, (uint64_t)&v20);
  id v6 = v20;
  if ((v3 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v19 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "MMCS setup failed:%@", buf, 0xCu);
    }
    __assert_rtn("-[CKDContainer countAssetCacheItems]", "CKDContainer.m", 3710, "0 && \"no MMCS\"");
  }
  id v7 = objc_msgSend_MMCS(self, v4, v5);

  if (!v7)
  {
    uint64_t v10 = objc_msgSend_MMCS(self, v8, v9);
    if (!v10) {
      __assert_rtn("-[CKDContainer countAssetCacheItems]", "CKDContainer.m", 3712, "self.MMCS && \"no MMCS\"");
    }
  }
  uint64_t v11 = objc_msgSend_MMCS(self, v8, v9);
  uint64_t v14 = objc_msgSend_assetCache(v11, v12, v13);

  unint64_t v17 = objc_msgSend_countAssetCacheItems(v14, v15, v16);
  return v17;
}

- (void)clearAssetCache
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v27 = 0;
  char v3 = objc_msgSend_setupAssetTransfers_(self, a2, (uint64_t)&v27);
  id v6 = (CKDContainer *)v27;
  if (v3)
  {
    id v7 = objc_msgSend_MMCS(self, v4, v5);

    if (v7)
    {
      uint64_t v10 = objc_msgSend_MMCS(self, v8, v9);
      uint64_t v13 = objc_msgSend_assetCache(v10, v11, v12);

      if (v13)
      {
        uint64_t v16 = objc_msgSend_MMCS(self, v14, v15);
        uint64_t v19 = objc_msgSend_assetCache(v16, v17, v18);

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v20 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = self;
          _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Clearing asset cache for %@", buf, 0xCu);
        }
        objc_msgSend_clearAssetCache(v19, v21, v22);

        goto LABEL_23;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v26 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = self;
        id v24 = "No assetCache MMCS for %@";
        goto LABEL_21;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v26 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = self;
        id v24 = "No MMCS for %@";
LABEL_21:
        id v25 = v26;
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v23 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      id v24 = "MMCS setup failed:%@";
      id v25 = v23;
LABEL_22:
      _os_log_error_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    }
  }
LABEL_23:
}

- (void)showAssetCache
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Showing all known asset caches", buf, 2u);
  }
  id v6 = objc_msgSend_deviceContext(self, v4, v5);
  uint64_t v9 = objc_msgSend_metadataCache(v6, v7, v8);
  uint64_t v12 = objc_msgSend_account(self, v10, v11);
  uint64_t v15 = objc_msgSend_accountID(v12, v13, v14);
  unint64_t v17 = objc_msgSend_knownAppContainerAccountTuplesForAccountID_(v9, v16, (uint64_t)v15);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  id v19[2] = sub_1C4D74A38;
  v19[3] = &unk_1E64F0948;
  id v20 = v17;
  int v21 = self;
  id v18 = v17;
  CKMuckingWithPersonas(v19);
}

- (void)clearRecordCache
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v6 = v3;
    uint64_t v9 = objc_msgSend_applicationBundleID(self, v7, v8);
    int v13 = 138412290;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "Clearing record cache for %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v10 = objc_msgSend_recordCache(self, v4, v5);
  objc_msgSend_clearAllRecords(v10, v11, v12);
}

- (BOOL)isContentAccessed
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v5 = objc_msgSend_accessCount(v2, v3, v4) != 0;
  objc_sync_exit(v2);

  return v5;
}

- (void)discardContentIfPossible
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!objc_msgSend_accessCount(v2, v3, v4))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    BOOL v5 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134217984;
      uint64_t v19 = v2;
      _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Discarding container %p", (uint8_t *)&v18, 0xCu);
    }
    v2->_contentDiscarded = 1;
    uint64_t v8 = objc_msgSend_pcsCacheIfExists(v2, v6, v7);
    objc_msgSend_discardContentIfPossible(v8, v9, v10);

    objc_msgSend__evictRecordCache(v2, v11, v12);
    uint64_t v15 = objc_msgSend_sharedManager(CKDDeviceCapabilityManager, v13, v14);
    objc_msgSend_dropCacheConnectionForContainer_(v15, v16, (uint64_t)v2);

    objc_msgSend_dropCacheConnectionForContainer_(CKDShareIDCache, v17, (uint64_t)v2);
  }
  objc_sync_exit(v2);
}

- (BOOL)isContentDiscarded
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL contentDiscarded = v2->_contentDiscarded;
  objc_sync_exit(v2);

  return contentDiscarded;
}

- (BOOL)isForClouddInternalUse
{
  return self->_isForClouddInternalUse;
}

- (void)setIsForClouddInternalUse:(BOOL)a3
{
  self->_isForClouddInternalUse = a3;
}

- (CKDLogicalDeviceScopedClientProxy)logicalDeviceScopedClientProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logicalDeviceScopedClientProxy);
  return (CKDLogicalDeviceScopedClientProxy *)WeakRetained;
}

- (int64_t)cachedEnvironment
{
  return self->_cachedEnvironment;
}

- (void)setHardwareID:(id)a3
{
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (CKDMMCS)MMCS
{
  return self->_MMCS;
}

- (void)setMMCS:(id)a3
{
}

- (void)setPcsManager:(id)a3
{
}

- (void)setPcsCache:(id)a3
{
}

- (void)setAnonymousSharingManager:(id)a3
{
}

- (void)setPublicIdentitiesDiskCache:(id)a3
{
}

- (void)setForegroundPublicIdentityLookupService:(id)a3
{
}

- (void)setBackgroundPublicIdentityLookupService:(id)a3
{
}

- (CKDZoneGatekeeper)gatekeeper
{
  return self->_gatekeeper;
}

- (void)setFetchAggregator:(id)a3
{
}

- (NSURL)publicCloudDBURL
{
  return (NSURL *)objc_getProperty(self, a2, 400, 1);
}

- (void)setPublicCloudDBURL:(id)a3
{
}

- (NSURL)publicShareServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 408, 1);
}

- (void)setPublicShareServiceURL:(id)a3
{
}

- (NSURL)publicDeviceServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 416, 1);
}

- (void)setPublicDeviceServiceURL:(id)a3
{
}

- (NSURL)publicCodeServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 424, 1);
}

- (void)setPublicCodeServiceURL:(id)a3
{
}

- (NSURL)publicMetricsServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPublicMetricsServiceURL:(id)a3
{
}

- (NSString)containerScopedUserID
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (void)setContainerScopedUserID:(id)a3
{
}

- (NSString)orgAdminUserID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setOrgAdminUserID:(id)a3
{
}

- (void)setOperationQueue:(id)a3
{
}

- (void)setCleanupOperationQueue:(id)a3
{
}

- (NSMutableDictionary)fakeErrorsByClassName
{
  return self->_fakeErrorsByClassName;
}

- (void)setFakeErrorsByClassName:(id)a3
{
}

- (NSMutableDictionary)fakeResponseOperationLifetimeByClassName
{
  return self->_fakeResponseOperationLifetimeByClassName;
}

- (void)setFakeResponseOperationLifetimeByClassName:(id)a3
{
}

- (NSMutableDictionary)fakeResponseOperationResultByClassNameByItemID
{
  return self->_fakeResponseOperationResultByClassNameByItemID;
}

- (void)setFakeResponseOperationResultByClassNameByItemID:(id)a3
{
}

- (NSRecursiveLock)serverConfigLock
{
  return self->_serverConfigLock;
}

- (void)setServerConfigLock:(id)a3
{
}

- (NSRecursiveLock)mmcsLock
{
  return self->_mmcsLock;
}

- (void)setMmcsLock:(id)a3
{
}

- (NSRecursiveLock)deviceContextLock
{
  return self->_deviceContextLock;
}

- (NSRecursiveLock)anonymousSharingManagerLock
{
  return self->_anonymousSharingManagerLock;
}

- (void)setAnonymousSharingManagerLock:(id)a3
{
}

- (NSRecursiveLock)sandboxExtensionsLock
{
  return self->_sandboxExtensionsLock;
}

- (void)setSandboxExtensionsLock:(id)a3
{
}

- (NSRecursiveLock)fetchAggregatorLock
{
  return self->_fetchAggregatorLock;
}

- (void)setFetchAggregatorLock:(id)a3
{
}

- (NSRecursiveLock)publicIdentityServiceLock
{
  return self->_publicIdentityServiceLock;
}

- (void)setPublicIdentityServiceLock:(id)a3
{
}

- (NSRecursiveLock)pcsManagerLock
{
  return self->_pcsManagerLock;
}

- (void)setPcsManagerLock:(id)a3
{
}

- (NSURL)applicationIcon
{
  return self->_applicationIcon;
}

- (void)setApplicationIcon:(id)a3
{
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationDisplayName:(id)a3
{
}

- (NSObject)authorizationChangedRegistration
{
  return self->_authorizationChangedRegistration;
}

- (NSString)resolvedAPSEnvironmentString
{
  return self->_resolvedAPSEnvironmentString;
}

- (void)setContainingBundleID:(id)a3
{
}

- (OS_dispatch_queue)cancellationQueue
{
  return self->_cancellationQueue;
}

- (void)setCancellationQueue:(id)a3
{
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (void)setStatusQueue:(id)a3
{
}

- (void)setUncancellableOperationQueue:(id)a3
{
}

- (void)setBackgroundOperationThrottleQueue:(id)a3
{
}

- (void)setCloudKitSupportOperationThrottleQueue:(id)a3
{
}

- (NSMutableSet)pendingOperationIDs
{
  return self->_pendingOperationIDs;
}

- (void)setPendingOperationIDs:(id)a3
{
}

- (int64_t)hasTCCAuthorizationTernary
{
  return self->_hasTCCAuthorizationTernary;
}

- (void)setHasTCCAuthorizationTernary:(int64_t)a3
{
  self->_int64_t hasTCCAuthorizationTernary = a3;
}

- (int64_t)hasValidatedEntitlementsTernary
{
  return self->_hasValidatedEntitlementsTernary;
}

- (void)setHasValidatedEntitlementsTernary:(int64_t)a3
{
  self->_hasValidatedEntitlementsTernary = a3;
}

- (CKDTestServerProtocol)testServer
{
  return self->_testServer;
}

- (void)setTccAuthQueue:(id)a3
{
}

- (NSMutableDictionary)operationStatisticsByClassName
{
  return self->_operationStatisticsByClassName;
}

- (void)setOperationStatisticsByClassName:(id)a3
{
}

- (BOOL)hasDataContainer
{
  return self->_hasDataContainer;
}

- (void)setHasDataContainer:(BOOL)a3
{
  self->_int hasDataContainer = a3;
}

- (void)setClientContainers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContainers, 0);
  objc_storeStrong((id *)&self->_cachedSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_operationStatisticsByClassName, 0);
  objc_storeStrong((id *)&self->_accountStatusWorkloop, 0);
  objc_storeStrong((id *)&self->_tccAuthQueue, 0);
  objc_storeStrong((id *)&self->_testServer, 0);
  objc_storeStrong((id *)&self->_pendingOperationIDs, 0);
  objc_storeStrong((id *)&self->_cloudKitSupportOperationThrottleQueue, 0);
  objc_storeStrong((id *)&self->_backgroundOperationThrottleQueue, 0);
  objc_storeStrong((id *)&self->_uncancellableOperationQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_cancellationQueue, 0);
  objc_storeStrong((id *)&self->_containingBundleID, 0);
  objc_storeStrong((id *)&self->_resolvedAPSEnvironmentString, 0);
  objc_storeStrong((id *)&self->_authorizationChangedRegistration, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationIcon, 0);
  objc_storeStrong(&self->_pcsCacheAssertion, 0);
  objc_storeStrong((id *)&self->_pcsManagerLock, 0);
  objc_storeStrong((id *)&self->_publicIdentityServiceLock, 0);
  objc_storeStrong((id *)&self->_fetchAggregatorLock, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionsLock, 0);
  objc_storeStrong((id *)&self->_anonymousSharingManagerLock, 0);
  objc_storeStrong((id *)&self->_deviceContextLock, 0);
  objc_storeStrong((id *)&self->_mmcsLock, 0);
  objc_storeStrong((id *)&self->_serverConfigLock, 0);
  objc_storeStrong((id *)&self->_fakeResponseOperationResultByClassNameByItemID, 0);
  objc_storeStrong((id *)&self->_fakeResponseOperationLifetimeByClassName, 0);
  objc_storeStrong((id *)&self->_fakeErrorsByClassName, 0);
  objc_storeStrong((id *)&self->_cleanupOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_orgAdminUserID, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID, 0);
  objc_storeStrong((id *)&self->_publicMetricsServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCodeServiceURL, 0);
  objc_storeStrong((id *)&self->_publicDeviceServiceURL, 0);
  objc_storeStrong((id *)&self->_publicShareServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCloudDBURL, 0);
  objc_storeStrong((id *)&self->_fetchAggregator, 0);
  objc_storeStrong((id *)&self->_gatekeeper, 0);
  objc_storeStrong((id *)&self->_backgroundPublicIdentityLookupService, 0);
  objc_storeStrong((id *)&self->_foregroundPublicIdentityLookupService, 0);
  objc_storeStrong((id *)&self->_publicIdentitiesDiskCache, 0);
  objc_storeStrong((id *)&self->_anonymousSharingManager, 0);
  objc_storeStrong((id *)&self->_pcsCache, 0);
  objc_storeStrong((id *)&self->_pcsManager, 0);
  objc_storeStrong((id *)&self->_MMCS, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_appContainerTuple, 0);
  objc_storeStrong((id *)&self->_directoryContext, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_hardwareID, 0);
  objc_destroyWeak((id *)&self->_logicalDeviceScopedClientProxy);
  objc_destroyWeak((id *)&self->_processScopedClientProxy);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_recordCache, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end