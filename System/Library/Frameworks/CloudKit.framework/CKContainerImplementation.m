@interface CKContainerImplementation
+ (void)initialize;
- (BOOL)__preflightAccountAccessAuthorization:(int64_t *)a3;
- (BOOL)beginContentAccess;
- (BOOL)hasCachedSetupInfo;
- (BOOL)isContentDiscarded;
- (BOOL)isPersonaOverrideSet;
- (CKContainer)unconfiguredWrappingContainer;
- (CKContainerID)containerID;
- (CKContainerImplementation)initWithContainerID:(id)a3 options:(id)a4 unconfiguredWrappingContainer:(id)a5;
- (CKContainerOptions)options;
- (CKContainerSetupInfo)cachedSetupInfo;
- (CKDatabaseImplementation)organizationCloudDatabaseImplementation;
- (CKDatabaseImplementation)privateCloudDatabaseImplementation;
- (CKDatabaseImplementation)publicCloudDatabaseImplementation;
- (CKDatabaseImplementation)sharedCloudDatabaseImplementation;
- (CKEntitlements)resolvedEntitlements;
- (CKRecordID)containerScopedUserID;
- (CKRecordID)orgAdminUserID;
- (CKXPCConnection)connection;
- (NSMutableArray)codeServiceImplementations;
- (NSNumber)fakeDeviceToDeviceEncryptionAvailability;
- (NSOperationQueue)backgroundThrottlingOperationQueue;
- (NSOperationQueue)discretionaryThrottlingOperationQueue;
- (NSOperationQueue)throttlingOperationQueue;
- (NSString)containerIdentifier;
- (NSString)personaIdentifier;
- (NSString)pushEnvironment;
- (NSXPCConnection)discretionaryXPCConnection;
- (OS_dispatch_queue)underlyingDispatchQueue;
- (id)CKPropertiesDescription;
- (id)CKStatusReportArray;
- (id)_discretionaryDaemonMachServiceConnection;
- (id)accountInfoFetchQueue;
- (id)applicationBundleIdentifierForPush;
- (id)codeServiceImplementationWithName:(id)a3;
- (id)codeServiceImplementationWithName:(id)a3 databaseScope:(int64_t)a4;
- (id)codeServiceImplementationWithName:(id)a3 databaseScope:(int64_t)a4 serviceInstanceURL:(id)a5;
- (id)codeServiceImplementationWithName:(id)a3 serviceInstanceURL:(id)a4;
- (id)description;
- (id)deviceContext;
- (id)networkTransferEndpointWithError:(id *)a3;
- (id)primaryIdentifier;
- (id)recordChangeProvider;
- (id)serverPreferredPushEnvironmentWithError:(id *)a3;
- (id)setupInfo;
- (id)sourceApplicationBundleIdentifier;
- (id)sourceApplicationSecondaryIdentifier;
- (id)untrustedEntitlements;
- (int)statusReportToken;
- (int64_t)lastKnownDeviceCount;
- (void)_addPreparedConvenienceOperation:(id)a3;
- (void)_refreshAccountAccessAuthorizationWithCompletionHandler:(id)a3;
- (void)_scheduleConvenienceOperation:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5;
- (void)_submitEventMetric:(id)a3 completionHandler:(id)a4;
- (void)acceptShareMetadata:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)accountInfoWithCompletionHandler:(id)a3;
- (void)accountStatusWithCompletionHandler:(id)a3;
- (void)addOperation:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5;
- (void)addPreparedOperationToBackgroundThrottlingOperationQueue:(id)a3;
- (void)addPreparedOperationToDiscretionaryThrottlingOperationQueue:(id)a3;
- (void)addPreparedOperationToThrottlingOperationQueue:(id)a3;
- (void)cancelUploadRequests;
- (void)clearContainerFromMetadataCache;
- (void)clearPILSCacheForLookupInfos:(id)a3;
- (void)consumeSandboxExtensions:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)decryptPersonalInfoOnShare:(id)a3 completionHandler:(id)a4;
- (void)discardContentIfPossible;
- (void)discoverAllIdentitiesWithWrappingContainer:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5;
- (void)discoverUserIdentityWithEmailAddress:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)discoverUserIdentityWithPhoneNumber:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)discoverUserIdentityWithUserRecordID:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)dropDetachedContainersWithCompletionHandler:(id)a3;
- (void)dumpDaemonStatusReport;
- (void)dumpDaemonStatusReportToFileHandle:(id)a3 completionHandler:(id)a4;
- (void)endContentAccess;
- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(id)a3;
- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3;
- (void)fetchFrameworkCachesDirectoryWithCompletionHandler:(id)a3;
- (void)fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:(id)a3;
- (void)fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:(id)a3;
- (void)fetchGlobalPerUserBoundaryKeyWithCompletionHandler:(id)a3;
- (void)fetchLongLivedOperationWithID:(id)a3 wrappingContainer:(id)a4 completionHandler:(id)a5;
- (void)fetchOrgAdminUserRecordIDWithCompletionHandler:(id)a3;
- (void)fetchServerEnvironment:(id)a3;
- (void)fetchShareMetadataWithURL:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchShareParticipantWithEmailAddress:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchShareParticipantWithLookupInfo:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchShareParticipantWithPhoneNumber:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchShareParticipantWithUserRecordID:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6;
- (void)fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler:(id)a3;
- (void)fetchUserRecordIDWithCompletionHandler:(id)a3;
- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3;
- (void)getOutstandingOperationCountWithCompletionHandler:(id)a3;
- (void)getRegisteredItemCountWithCompletionHandler:(id)a3;
- (void)handleRecordChanged:(id)a3 changeType:(int64_t)a4 record:(id)a5 error:(id)a6;
- (void)handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6 reply:(id)a7;
- (void)manuallyTriggerUploadRequests;
- (void)pushEnvironmentWithCompletionHandler:(id)a3;
- (void)registerForAssetRequests:(id)a3 packageRequests:(id)a4 machServiceName:(id)a5;
- (void)registerForAssetUploadRequests:(id)a3;
- (void)registerForAssetUploadRequests:(id)a3 machServiceName:(id)a4;
- (void)registerForPackageUploadRequests:(id)a3;
- (void)registerForPackageUploadRequests:(id)a3 machServiceName:(id)a4;
- (void)reloadAccountWithCompletionHandler:(id)a3;
- (void)representativeDataclassEnabledWithCompletionHandler:(id)a3;
- (void)requestApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)resetAllApplicationPermissionsWithCompletionHandler:(id)a3;
- (void)serverPreferredPushEnvironmentSynchronous:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3;
- (void)setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
- (void)setContainerScopedUserID:(id)a3;
- (void)setFakeDeviceToDeviceEncryptionAvailability:(id)a3;
- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4;
- (void)setFakeResponseOperationResult:(id)a3 forNextRequestOfClassName:(id)a4 forItemID:(id)a5 withLifetime:(int)a6;
- (void)setHasCachedSetupInfo:(BOOL)a3;
- (void)setIsPersonaOverrideSet:(BOOL)a3;
- (void)setOrgAdminUserID:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setPushEnvironment:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSourceApplicationSecondaryIdentifier:(id)a3;
- (void)simulateMemoryPressure:(int64_t)a3 completionHandler:(id)a4;
- (void)statusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)submitEventMetric:(id)a3;
- (void)submitEventMetric:(id)a3 completionHandler:(id)a4;
- (void)tossConfigWithCompletionHandler:(id)a3;
- (void)unregisterFromUploadRequests;
- (void)unregisterFromUploadRequestsWithMachServiceName:(id)a3;
- (void)wipeAllCachesAndDie;
- (void)withUploadManager:(int)a3 performBlock:(id)a4;
@end

@implementation CKContainerImplementation

- (CKRecordID)containerScopedUserID
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1EB279A98);
  containerScopedUserID_locked = self->_containerScopedUserID_locked;

  return containerScopedUserID_locked;
}

- (id)description
{
  return (id)((uint64_t (*)(CKContainerImplementation *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void)setOrgAdminUserID:(id)a3
{
  v4 = qword_1EB279A98;
  id v5 = a3;
  dispatch_assert_queue_V2(v4);
  v9 = (CKRecordID *)objc_msgSend_copy(v5, v6, v7, v8);

  orgAdminUserID_locked = self->_orgAdminUserID_locked;
  self->_orgAdminUserID_locked = v9;
}

- (void)setContainerScopedUserID:(id)a3
{
  v4 = qword_1EB279A98;
  id v5 = a3;
  dispatch_assert_queue_V2(v4);
  v9 = (CKRecordID *)objc_msgSend_copy(v5, v6, v7, v8);

  containerScopedUserID_locked = self->_containerScopedUserID_locked;
  self->_containerScopedUserID_locked = v9;
}

- (id)deviceContext
{
  return (id)objc_msgSend_defaultContext(CKLogicalDeviceContext, a2, v2, v3);
}

- (id)setupInfo
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!objc_msgSend_hasCachedSetupInfo(v2, v3, v4, v5))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v6 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      containerID = v2->_containerID;
      int v21 = 138412290;
      v22 = containerID;
      _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "Creating cached setup info for %@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v7 = [CKContainerSetupInfo alloc];
    uint64_t v8 = (uint64_t)v2->_containerID;
    v12 = objc_msgSend_options(v2, v9, v10, v11);
    uint64_t v14 = objc_msgSend_initWithContainerID_options_(v7, v13, v8, (uint64_t)v12);
    cachedSetupInfo = v2->_cachedSetupInfo;
    v2->_cachedSetupInfo = (CKContainerSetupInfo *)v14;

    objc_msgSend_setHasCachedSetupInfo_(v2, v16, 1, v17);
  }
  v18 = v2->_cachedSetupInfo;
  objc_sync_exit(v2);

  return v18;
}

- (BOOL)hasCachedSetupInfo
{
  return self->_hasCachedSetupInfo;
}

- (NSNumber)fakeDeviceToDeviceEncryptionAvailability
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)consumeSandboxExtensions:(id)a3 reply:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (objc_msgSend_count(v6, v8, v9, v10))
  {
    if (self) {
      sandboxExtensionHandles = self->_sandboxExtensionHandles;
    }
    else {
      sandboxExtensionHandles = 0;
    }
    obj = sandboxExtensionHandles;
    objc_sync_enter(obj);
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(v6, v13, v14, v15);
    v19 = objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v20 = v6;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v57, (uint64_t)v65, 16);
    if (v24)
    {
      uint64_t v25 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v58 != v25) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend_cStringUsingEncoding_(*(void **)(*((void *)&v57 + 1) + 8 * i), v22, 4, v23);
          uint64_t v27 = sandbox_extension_consume();
          if ((v27 & 0x8000000000000000) == 0)
          {
            v28 = objc_msgSend_numberWithLongLong_(NSNumber, v22, v27, v23);
            objc_msgSend_addObject_(v19, v29, (uint64_t)v28, v30);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v57, (uint64_t)v65, 16);
      }
      while (v24);
    }

    if (self) {
      v31 = self->_sandboxExtensionHandles;
    }
    else {
      v31 = 0;
    }
    v32 = v31;
    v36 = objc_msgSend_copy(v32, v33, v34, v35);

    if (self) {
      v37 = self->_sandboxExtensionHandles;
    }
    else {
      v37 = 0;
    }
    v38 = v37;
    objc_msgSend_removeAllObjects(v38, v39, v40, v41);

    if (self) {
      v42 = self->_sandboxExtensionHandles;
    }
    else {
      v42 = 0;
    }
    v43 = v42;
    objc_msgSend_addObjectsFromArray_(v43, v44, (uint64_t)v19, v45);

    objc_sync_exit(obj);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v46 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v47 = v46;
      uint64_t v51 = objc_msgSend_count(v20, v48, v49, v50);
      v55 = objc_msgSend_containerID(self, v52, v53, v54);
      *(_DWORD *)buf = 134218242;
      uint64_t v62 = v51;
      __int16 v63 = 2112;
      v64 = v55;
      _os_log_debug_impl(&dword_18AF10000, v47, OS_LOG_TYPE_DEBUG, "Consumed %lu sandbox extensions for container %@", buf, 0x16u);
    }
    sub_18AF2909C(self, v36);
    v7[2](v7, 0);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_signpost(CKSignpost, v5, v6, v7);
  id v12 = v8;
  if (v8)
  {
    v13 = objc_msgSend_log(v8, v9, v10, v11);
    uint64_t v17 = objc_msgSend_identifier(v12, v14, v15, v16);
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v18 = v17;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v18, "accountStatus", "", buf, 2u);
      }
    }
  }
  v19 = _os_activity_create(&dword_18AF10000, "client/account-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v19, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v20 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = objc_msgSend_containerID(self, v21, v22, v23);
    objc_msgSend_accountInfoFetchQueue(self, v31, v32, v33);
    uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_options(self, v35, v36, v37);
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    v48 = v34;
    LOWORD(v49) = 2112;
    *(void *)((char *)&v49 + 2) = v38;
    _os_log_debug_impl(&dword_18AF10000, v20, OS_LOG_TYPE_DEBUG, "Fetching full account info for CKContainerImplementation %p, containerID %@ on queue %@. Container options: %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v48 = sub_18AF13B10;
  *(void *)&long long v49 = sub_18AF13848;
  *((void *)&v49 + 1) = objc_opt_new();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3020000000;
  char v45 = 0;
  uint64_t v27 = objc_msgSend_accountInfoFetchQueue(self, v24, v25, v26);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18AF24780;
  block[3] = &unk_1E5461788;
  v42 = buf;
  v43 = v44;
  id v40 = v12;
  id v41 = v4;
  block[4] = self;
  id v28 = v12;
  id v29 = v4;
  dispatch_async(v27, block);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
}

- (void)fetchUserRecordIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-user-record-id", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  sub_18AF39EEC(self, 0, v4);
  os_activity_scope_leave(&v6);
}

- (id)CKPropertiesDescription
{
  id v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 3, v2);
  uint64_t v5 = NSString;
  uint64_t v9 = objc_msgSend_containerID(self, v6, v7, v8);
  id v12 = objc_msgSend_stringWithFormat_(v5, v10, @"containerID=%@", v11, v9);
  objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

  os_signpost_id_t v18 = objc_msgSend_options(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_testDeviceReferenceProtocol(v18, v19, v20, v21);

  if (v22)
  {
    uint64_t v26 = NSString;
    uint64_t v27 = objc_msgSend_options(self, v23, v24, v25);
    v31 = objc_msgSend_testDeviceReferenceProtocol(v27, v28, v29, v30);
    uint64_t v35 = objc_msgSend_deviceID(v31, v32, v33, v34);
    v38 = objc_msgSend_stringWithFormat_(v26, v36, @"testDeviceID=%@", v37, v35);
    objc_msgSend_addObject_(v4, v39, (uint64_t)v38, v40);
  }
  id v41 = objc_msgSend_options(self, v23, v24, v25);
  char v45 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v41, v42, v43, v44);

  if (v45)
  {
    long long v49 = NSString;
    uint64_t v50 = objc_msgSend_options(self, v46, v47, v48);
    uint64_t v54 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v50, v51, v52, v53);
    long long v57 = objc_msgSend_stringWithFormat_(v49, v55, @"applicationBundleIdentifierOverrideForContainerAccess=\"%@\"", v56, v54);
    objc_msgSend_addObject_(v4, v58, (uint64_t)v57, v59);
  }
  long long v60 = objc_msgSend_options(self, v46, v47, v48);
  v64 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v60, v61, v62, v63);

  if (v64)
  {
    v68 = NSString;
    v69 = objc_msgSend_options(self, v65, v66, v67);
    v73 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v69, v70, v71, v72);
    v76 = objc_msgSend_stringWithFormat_(v68, v74, @"applicationBundleIdentifierOverrideForNetworkAttribution=\"%@\"", v75, v73);
    objc_msgSend_addObject_(v4, v77, (uint64_t)v76, v78);
  }
  v79 = objc_msgSend_options(self, v65, v66, v67);
  v83 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v79, v80, v81, v82);

  if (v83)
  {
    v87 = NSString;
    v88 = objc_msgSend_options(self, v84, v85, v86);
    v92 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v88, v89, v90, v91);
    v95 = objc_msgSend_stringWithFormat_(v87, v93, @"applicationBundleIdentifierOverrideForPushTopicGeneration=\"%@\"", v94, v92);
    objc_msgSend_addObject_(v4, v96, (uint64_t)v95, v97);
  }
  v98 = objc_msgSend_options(self, v84, v85, v86);
  v102 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v98, v99, v100, v101);

  if (v102)
  {
    v106 = NSString;
    v107 = objc_msgSend_options(self, v103, v104, v105);
    v111 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v107, v108, v109, v110);
    v114 = objc_msgSend_stringWithFormat_(v106, v112, @"applicationBundleIdentifierOverrideForTCC=\"%@\"", v113, v111);
    objc_msgSend_addObject_(v4, v115, (uint64_t)v114, v116);
  }
  v117 = objc_msgSend_options(self, v103, v104, v105);
  int v121 = objc_msgSend_bypassPCSEncryption(v117, v118, v119, v120);

  if (v121)
  {
    v125 = objc_msgSend_stringWithFormat_(NSString, v122, @"bypassPCS", v124);
    objc_msgSend_addObject_(v4, v126, (uint64_t)v125, v127);
  }
  v128 = objc_msgSend_sourceApplicationBundleIdentifier(self, v122, v123, v124);
  v134 = objc_msgSend_sourceApplicationSecondaryIdentifier(self, v129, v130, v131);
  if (v128)
  {
    v135 = objc_msgSend_stringWithFormat_(NSString, v132, @"sourceApplicationBundleIdentifier=\"%@\"", v133, v128);
    objc_msgSend_addObject_(v4, v136, (uint64_t)v135, v137);
  }
  if (v134)
  {
    v138 = objc_msgSend_stringWithFormat_(NSString, v132, @"applicationSecondaryID=\"%@\"", v133, v134);
    objc_msgSend_addObject_(v4, v139, (uint64_t)v138, v140);
  }
  v141 = objc_msgSend_componentsJoinedByString_(v4, v132, @", ", v133);

  return v141;
}

- (CKContainerOptions)options
{
  return self->_options;
}

- (id)accountInfoFetchQueue
{
  id v4 = objc_msgSend_options(self, a2, v2, v3);
  int v8 = objc_msgSend_bypassPCSEncryption(v4, v5, v6, v7);

  if (v8)
  {
    uint64_t v9 = &qword_1EB279AA0;
    if (qword_1EB279AC0 != -1) {
      dispatch_once(&qword_1EB279AC0, &unk_1ED7F5398);
    }
  }
  else
  {
    uint64_t v9 = &qword_1EB279AA8;
  }
  uint64_t v10 = (void *)*v9;

  return v10;
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)sourceApplicationSecondaryIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_sourceApplicationSecondaryIdentifier_locked;
  objc_sync_exit(v2);

  return v3;
}

- (id)sourceApplicationBundleIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_sourceApplicationBundleIdentifier_locked;
  objc_sync_exit(v2);

  return v3;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKDatabaseImplementation)privateCloudDatabaseImplementation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_privateCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_msgSend_containerID(v2, v4, v5, v6);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Creating private database implementation for container %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = [CKDatabaseImplementation alloc];
    uint64_t inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 2);
    privateCloudDatabaseImplementation = v2->_privateCloudDatabaseImplementation;
    v2->_privateCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;
  }
  objc_sync_exit(v2);

  uint64_t v11 = v2->_privateCloudDatabaseImplementation;

  return v11;
}

+ (void)initialize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedOptions(CKBehaviorOptions, a2, v2, v3);
  int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v4, v5, v6, v7);

  if (isAppleInternalInstall)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v9 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      uint64_t v17 = "Wed Dec 31 16:00:00 1969";
      _os_log_impl(&dword_18AF10000, v9, OS_LOG_TYPE_INFO, "CloudKit.framework was built at %s", (uint8_t *)&v16, 0xCu);
    }
  }
  if (!qword_1EB279A98)
  {
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.cloudkit.importantUserRecordAccess", v10);
    id v12 = (void *)qword_1EB279A98;
    qword_1EB279A98 = (uint64_t)v11;
  }
  if (!qword_1EB279AA8)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.cloudkit.accountInfoFetchQueue.usesPCS", v13);
    uint64_t v15 = (void *)qword_1EB279AA8;
    qword_1EB279AA8 = (uint64_t)v14;
  }
  CKOncePerBoot(@"CKAccountInfoCacheReset", &unk_1ED7EEF18);
}

- (CKContainerImplementation)initWithContainerID:(id)a3 options:(id)a4 unconfiguredWrappingContainer:(id)a5
{
  uint64_t v347 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id obj = a5;
  if (!v10)
  {
    v309 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v309, v310, (uint64_t)a2, (uint64_t)self, @"CKContainer.m", 359, @"Invalid parameter not satisfying: %@", @"containerID != nil");
  }
  v341.receiver = self;
  v341.super_class = (Class)CKContainerImplementation;
  uint64_t v15 = [(CKContainerImplementation *)&v341 init];
  int v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_unconfiguredWrappingContainer, obj);
    if (!v11) {
      id v11 = (id)objc_opt_new();
    }
    uint64_t v20 = objc_msgSend_copy(v11, v17, v18, v19);
    options = v16->_options;
    v16->_options = (CKContainerOptions *)v20;

    uint64_t v25 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v22, v23, v24);
    uint64_t v29 = objc_msgSend_untrustedEntitlements(v25, v26, v27, v28);

    uint64_t v33 = objc_msgSend_fakeEntitlements(v16->_options, v30, v31, v32);
    uint64_t v37 = objc_msgSend_count(v33, v34, v35, v36);

    if (v37)
    {
      id v41 = objc_msgSend_fakeEntitlements(v16->_options, v38, v39, v40);
      uint64_t v44 = objc_msgSend_entitlementsByAddingOverlay_(v29, v42, (uint64_t)v41, v43);
      resolvedEntitlements = v16->_resolvedEntitlements;
      v16->_resolvedEntitlements = (CKEntitlements *)v44;
    }
    else
    {
      v46 = v29;
      id v41 = v16->_resolvedEntitlements;
      v16->_resolvedEntitlements = v46;
    }

    uint64_t v47 = v16->_resolvedEntitlements;
    uint64_t v48 = CKSDKVersion();
    *(void *)buf = 0;
    LOBYTE(v47) = objc_msgSend_validateEntitlementsWithSDKVersion_error_(v47, v49, v48, (uint64_t)buf);
    id v50 = *(id *)buf;
    uint64_t v51 = v50;
    if ((v47 & 1) == 0)
    {
      v311 = [CKException alloc];
      uint64_t v315 = objc_msgSend_code(v51, v312, v313, v314);
      v319 = objc_msgSend_localizedDescription(v51, v316, v317, v318);
      id v321 = (id)objc_msgSend_initWithCode_format_(v311, v320, v315, @"%@", v319);

      objc_exception_throw(v321);
    }

    v55 = objc_msgSend_untrustedEntitlements(v16, v52, v53, v54);
    int hasMasqueradingEntitlement = objc_msgSend_hasMasqueradingEntitlement(v55, v56, v57, v58);
    uint64_t v63 = objc_msgSend_cloudServices(v55, v60, v61, v62);
    uint64_t hasTemporaryDeviceCapabilitiesEntitlement = @"CloudKit";
    if (objc_msgSend_containsObject_(v63, v65, @"CloudKit", v66))
    {
    }
    else
    {
      v73 = objc_msgSend_cloudServices(v55, v67, v68, v69);
      uint64_t v5 = @"CloudKit-Anonymous";
      int v76 = objc_msgSend_containsObject_(v73, v74, @"CloudKit-Anonymous", v75);

      if (((v76 | hasMasqueradingEntitlement) & 1) == 0)
      {
        if (ck_log_initialization_predicate == -1) {
          goto LABEL_86;
        }
        goto LABEL_94;
      }
    }
    v80 = objc_msgSend_supportedDeviceCapabilities(v16->_options, v70, v71, v72);
    if (v80)
    {
      uint64_t hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v55, v77, v78, v79);

      if ((hasTemporaryDeviceCapabilitiesEntitlement & 1) == 0)
      {
        uint64_t v81 = ck_log_initialization_block;
        BOOL v82 = ck_log_initialization_predicate == -1;
        if ((hasMasqueradingEntitlement & 1) == 0)
        {
          while (1)
          {
            if (!v82) {
              dispatch_once(&ck_log_initialization_predicate, v81);
            }
            v329 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = @"com.apple.private.cloudkit.temporary.deviceCapabilities";
              _os_log_error_impl(&dword_18AF10000, v329, OS_LOG_TYPE_ERROR, "Early adopters of device capabilities must have the %@ entitlement.", buf, 0xCu);
            }
            v332 = objc_msgSend_stringWithFormat_(NSString, v330, @"Early adopters of device capabilities must have the %@ entitlement.", v331, @"com.apple.private.cloudkit.temporary.deviceCapabilities");
            objc_msgSend_UTF8String(v332, v333, v334, v335);
            _os_crash();
            __break(1u);
LABEL_94:
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
LABEL_86:
            v322 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = @"com.apple.developer.icloud-services";
              __int16 v343 = 2112;
              uint64_t v344 = hasTemporaryDeviceCapabilitiesEntitlement;
              __int16 v345 = 2112;
              v346 = v5;
              _os_log_error_impl(&dword_18AF10000, v322, OS_LOG_TYPE_ERROR, "In order to use CloudKit, your process must have a %@ entitlement. The value of this entitlement must be an array that includes the string \"%@\" or \"%@\".", buf, 0x20u);
            }
            v325 = objc_msgSend_stringWithFormat_(NSString, v323, @"In order to use CloudKit, your process must have a %@ entitlement. The value of this entitlement must be an array that includes the string \"%@\" or \"%@\".", v324, @"com.apple.developer.icloud-services", hasTemporaryDeviceCapabilitiesEntitlement, v5);
            objc_msgSend_UTF8String(v325, v326, v327, v328);
            _os_crash();
            __break(1u);
          }
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v83 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"com.apple.private.cloudkit.temporary.deviceCapabilities";
          _os_log_error_impl(&dword_18AF10000, v83, OS_LOG_TYPE_ERROR, "Use of CKContainerOptions.supportedDeviceCapabilities currently requires the %@ entitlement.", buf, 0xCu);
        }
      }
    }

    uint64_t v87 = objc_msgSend_copy(v10, v84, v85, v86);
    containerID = v16->_containerID;
    v16->_containerID = (CKContainerID *)v87;

    v89 = NSString;
    v93 = objc_msgSend_containerIdentifier(v16->_containerID, v90, v91, v92);
    objc_msgSend_stringWithFormat_(v89, v94, @"%@.%@", v95, @"com.apple.cloudkit.container-queue", v93);
    id v96 = objc_claimAutoreleasedReturnValue();
    uint64_t v100 = (const char *)objc_msgSend_UTF8String(v96, v97, v98, v99);
    uint64_t v101 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v102 = dispatch_queue_create(v100, v101);
    underlyingDispatchQueue = v16->_underlyingDispatchQueue;
    v16->_underlyingDispatchQueue = (OS_dispatch_queue *)v102;

    uint64_t v104 = objc_opt_new();
    convenienceOperationQueue = v16->_convenienceOperationQueue;
    v16->_convenienceOperationQueue = (NSOperationQueue *)v104;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_convenienceOperationQueue, v106, 6, v107);
    objc_msgSend_setUnderlyingQueue_(v16->_convenienceOperationQueue, v108, (uint64_t)v16->_underlyingDispatchQueue, v109);
    uint64_t v110 = objc_opt_new();
    throttlingOperationQueue = v16->_throttlingOperationQueue;
    v16->_throttlingOperationQueue = (NSOperationQueue *)v110;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_throttlingOperationQueue, v112, 6, v113);
    objc_msgSend_setUnderlyingQueue_(v16->_throttlingOperationQueue, v114, (uint64_t)v16->_underlyingDispatchQueue, v115);
    uint64_t v116 = objc_opt_new();
    backgroundThrottlingOperationQueue = v16->_backgroundThrottlingOperationQueue;
    v16->_backgroundThrottlingOperationQueue = (NSOperationQueue *)v116;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_backgroundThrottlingOperationQueue, v118, 4, v119);
    objc_msgSend_setUnderlyingQueue_(v16->_backgroundThrottlingOperationQueue, v120, (uint64_t)v16->_underlyingDispatchQueue, v121);
    uint64_t v122 = objc_opt_new();
    discretionaryThrottlingOperationQueue = v16->_discretionaryThrottlingOperationQueue;
    v16->_discretionaryThrottlingOperationQueue = (NSOperationQueue *)v122;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_discretionaryThrottlingOperationQueue, v124, 4, v125);
    objc_msgSend_setUnderlyingQueue_(v16->_discretionaryThrottlingOperationQueue, v126, (uint64_t)v16->_underlyingDispatchQueue, v127);
    v128 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sandboxExtensionHandles = v16->_sandboxExtensionHandles;
    v16->_sandboxExtensionHandles = v128;

    v16->_uploadRequestManagerLock._os_unfair_lock_opaque = 0;
    uint64_t v133 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v130, v131, v132);
    sharingUIObservers = v16->_sharingUIObservers;
    v16->_sharingUIObservers = (NSHashTable *)v133;

    v16->_isPersonaOverrideSet = 0;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v135 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl(&dword_18AF10000, v135, OS_LOG_TYPE_INFO, "Determining the persona identifier for CKContainer %{public}@", buf, 0xCu);
    }
    v139 = objc_msgSend_accountOverrideInfo(v11, v136, v137, v138);
    v143 = objc_msgSend_accountID(v139, v140, v141, v142);
    if (v143)
    {
    }
    else
    {
      v150 = objc_msgSend_accountOverrideInfo(v11, v144, v145, v146);
      v154 = objc_msgSend_altDSID(v150, v151, v152, v153);
      BOOL v155 = v154 == 0;

      if (v155)
      {
        if (__sTestOverridesAvailable)
        {
          v231 = objc_msgSend_accountOverrideInfo(v11, v147, v148, v149);
          v238 = objc_msgSend_email(v231, v232, v233, v234);
          if (v238)
          {
            v239 = objc_msgSend_accountOverrideInfo(v11, v235, v236, v237);
            v243 = objc_msgSend_accountPropertyOverrides(v239, v240, v241, v242);
            uint64_t v244 = *MEMORY[0x1E4F176E8];
            v247 = objc_msgSend_objectForKeyedSubscript_(v243, v245, *MEMORY[0x1E4F176E8], v246);
            BOOL v248 = v247 == 0;

            if (!v248)
            {
              v249 = objc_msgSend_accountOverrideInfo(v11, v147, v148, v149);
              v253 = objc_msgSend_accountPropertyOverrides(v249, v250, v251, v252);
              v256 = objc_msgSend_objectForKeyedSubscript_(v253, v254, v244, v255);
              v260 = objc_msgSend_copy(v256, v257, v258, v259);
              v173 = objc_msgSend_CKNilIfEmpty(v260, v261, v262, v263);

              objc_storeStrong((id *)&v16->_personaIdentifier, v173);
              v16->_isPersonaOverrideSet = 1;
              if (ck_log_initialization_predicate != -1) {
                dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
              }
              v264 = ck_log_facility_ck;
              if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
              {
                personaIdentifier = v16->_personaIdentifier;
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = personaIdentifier;
                _os_log_impl(&dword_18AF10000, v264, OS_LOG_TYPE_INFO, "Found persona identifier %@ from account info for unit-tests", buf, 0xCu);
              }
              goto LABEL_47;
            }
          }
          else
          {
          }
        }
        v266 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v147, v148, v149);
        v270 = objc_msgSend_currentPersona(v266, v267, v268, v269);
        v214 = objc_msgSend_userPersonaUniqueString(v270, v271, v272, v273);

        v277 = objc_msgSend_personaIdentifier(v11, v274, v275, v276);

        if (v277)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v278 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v282 = v278;
            v286 = objc_msgSend_personaIdentifier(v11, v283, v284, v285);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v286;
            _os_log_impl(&dword_18AF10000, v282, OS_LOG_TYPE_INFO, "Found persona identifier %@ on container options", buf, 0xCu);
          }
          v287 = objc_msgSend_personaIdentifier(v11, v279, v280, v281);
          char isEqualToString = objc_msgSend_isEqualToString_(v287, v288, (uint64_t)v214, v289);

          if ((isEqualToString & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v294 = (void *)ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              v295 = v294;
              v299 = objc_msgSend_personaIdentifier(v11, v296, v297, v298);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v299;
              __int16 v343 = 2112;
              uint64_t v344 = (uint64_t)v214;
              _os_log_impl(&dword_18AF10000, v295, OS_LOG_TYPE_INFO, "Requested persona identifier %@ does not match current persona %@. Will adopt requested persona when calling daemon.", buf, 0x16u);
            }
          }
          v300 = objc_msgSend_personaIdentifier(v11, v291, v292, v293);
          uint64_t v304 = objc_msgSend_copy(v300, v301, v302, v303);
          v305 = v16->_personaIdentifier;
          v16->_personaIdentifier = (NSString *)v304;

          v16->_isPersonaOverrideSet = 1;
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v306 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v214;
            _os_log_impl(&dword_18AF10000, v306, OS_LOG_TYPE_INFO, "Writing down current persona %@ in container options", buf, 0xCu);
          }
          objc_msgSend_setPersonaIdentifier_(v16->_options, v307, (uint64_t)v214, v308);
        }
        goto LABEL_48;
      }
    }
    v156 = objc_msgSend_accountOverrideInfo(v11, v147, v148, v149);
    v160 = objc_msgSend_accountID(v156, v157, v158, v159);

    self;
    if (qword_1EB279AB8 != -1) {
      dispatch_once(&qword_1EB279AB8, &unk_1ED7EC208);
    }
    id v161 = (id)qword_1EB279AB0;
    v165 = objc_msgSend_accountOverrideInfo(v11, v162, v163, v164);
    v169 = v165;
    if (v160)
    {
      v170 = objc_msgSend_accountID(v165, v166, v167, v168);
      v173 = objc_msgSend_accountWithIdentifier_(v161, v171, (uint64_t)v170, v172);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v174 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v177 = v174;
        v181 = objc_msgSend_accountOverrideInfo(v11, v178, v179, v180);
        v185 = objc_msgSend_accountID(v181, v182, v183, v184);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v173;
        __int16 v343 = 2112;
        uint64_t v344 = (uint64_t)v185;
        _os_log_impl(&dword_18AF10000, v177, OS_LOG_TYPE_INFO, "Instantiated account %@ using account ID %@", buf, 0x16u);
      }
    }
    else
    {
      v186 = objc_msgSend_altDSID(v165, v166, v167, v168);
      v173 = objc_msgSend_aa_appleAccountWithAltDSID_(v161, v187, (uint64_t)v186, v188);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v189 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v190 = v189;
        v194 = objc_msgSend_accountOverrideInfo(v11, v191, v192, v193);
        v198 = objc_msgSend_altDSID(v194, v195, v196, v197);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v173;
        __int16 v343 = 2112;
        uint64_t v344 = (uint64_t)v198;
        _os_log_impl(&dword_18AF10000, v190, OS_LOG_TYPE_INFO, "Instantiated account %@ using account altDSID %@", buf, 0x16u);
      }
    }
    if (v173)
    {
      v199 = objc_msgSend_accountPropertyForKey_(v173, v175, *MEMORY[0x1E4F176E8], v176);
      v203 = objc_msgSend_copy(v199, v200, v201, v202);
      uint64_t v207 = objc_msgSend_CKNilIfEmpty(v203, v204, v205, v206);
      v208 = v16->_personaIdentifier;
      v16->_personaIdentifier = (NSString *)v207;

      v16->_isPersonaOverrideSet = 1;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v209 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v210 = v16->_personaIdentifier;
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v210;
        __int16 v343 = 2112;
        uint64_t v344 = (uint64_t)v173;
        __int16 v345 = 2114;
        v346 = (__CFString *)v16;
        _os_log_impl(&dword_18AF10000, v209, OS_LOG_TYPE_INFO, "Found persona identifier %@ on account %@. Setting this identifier on this container %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v211 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AF10000, v211, OS_LOG_TYPE_ERROR, "Found nil account instance, which indicates the adopter probably has neither com.apple.accounts.appleaccount.fullaccess entitlement or com.apple.private.accounts.allaccounts entitlement", buf, 2u);
      }
    }
LABEL_47:

    v214 = 0;
LABEL_48:
    uint64_t v215 = (uint64_t)v16->_personaIdentifier;
    if (v215) {
      objc_msgSend_setPersonaIdentifier_(v16->_options, v212, v215, v213);
    }
    *(void *)buf = -1;
    if ((objc_msgSend___preflightAccountAccessAuthorization_(v16, v212, (uint64_t)buf, v213) & 1) == 0)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v216 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_debug_impl(&dword_18AF10000, v216, OS_LOG_TYPE_DEBUG, "Deferring initial account access authorization, unable to preflight", (uint8_t *)location, 2u);
      }
    }
    v16->_accountAccessAuthorization = *(void *)buf;
    objc_initWeak(location, v16);
    int out_token = -1;
    v217 = NSString;
    v218 = CKTestNotificationPrefix();
    v221 = objc_msgSend_stringWithFormat_(v217, v219, @"%@%@", v220, v218, @"CKStatusReport");

    v225 = (const char *)objc_msgSend_UTF8String(v221, v222, v223, v224);
    v226 = CKGetGlobalQueue(17);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_18B02E248;
    handler[3] = &unk_1E5460FE8;
    objc_copyWeak(&v338, location);
    LODWORD(v217) = notify_register_dispatch(v225, &out_token, v226, handler);

    int v227 = out_token;
    if (v217) {
      int v227 = -1;
    }
    v16->_statusReportToken = v227;
    uint64_t v228 = objc_opt_new();
    daemonConnectionLock = v16->_daemonConnectionLock;
    v16->_daemonConnectionLock = (NSLock *)v228;

    objc_destroyWeak(&v338);
    objc_destroyWeak(location);
  }
  return v16;
}

- (CKDatabaseImplementation)publicCloudDatabaseImplementation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_publicCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_msgSend_containerID(v2, v4, v5, v6);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Creating public database implementation for container %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = [CKDatabaseImplementation alloc];
    uint64_t inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 1);
    publicCloudDatabaseImplementation = v2->_publicCloudDatabaseImplementation;
    v2->_publicCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;
  }
  objc_sync_exit(v2);

  id v11 = v2->_publicCloudDatabaseImplementation;

  return v11;
}

- (CKDatabaseImplementation)sharedCloudDatabaseImplementation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sharedCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_msgSend_containerID(v2, v4, v5, v6);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Creating shared database implementation for container %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = [CKDatabaseImplementation alloc];
    uint64_t inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 3);
    sharedCloudDatabaseImplementation = v2->_sharedCloudDatabaseImplementation;
    v2->_sharedCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;
  }
  objc_sync_exit(v2);

  id v11 = v2->_sharedCloudDatabaseImplementation;

  return v11;
}

- (CKDatabaseImplementation)organizationCloudDatabaseImplementation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_organizationCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_msgSend_containerID(v2, v4, v5, v6);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Creating organization database implementation for container %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = [CKDatabaseImplementation alloc];
    uint64_t inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 4);
    organizationCloudDatabaseImplementation = v2->_organizationCloudDatabaseImplementation;
    v2->_organizationCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;
  }
  objc_sync_exit(v2);

  id v11 = v2->_organizationCloudDatabaseImplementation;

  return v11;
}

- (id)codeServiceImplementationWithName:(id)a3
{
  return sub_18B02EA1C(self, a3, 0, 0);
}

- (id)codeServiceImplementationWithName:(id)a3 databaseScope:(int64_t)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v10 = objc_msgSend_numberWithInteger_(v6, v8, a4, v9);
  id v11 = sub_18B02EA1C(self, v7, v10, 0);

  return v11;
}

- (id)codeServiceImplementationWithName:(id)a3 serviceInstanceURL:(id)a4
{
  return sub_18B02EA1C(self, a3, 0, a4);
}

- (id)codeServiceImplementationWithName:(id)a3 databaseScope:(int64_t)a4 serviceInstanceURL:(id)a5
{
  int v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  uint64_t v13 = objc_msgSend_numberWithInteger_(v8, v11, a4, v12);
  int v14 = sub_18B02EA1C(self, v10, v13, v9);

  return v14;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  int v8 = v5;
  if (self) {
    objc_msgSend_removeObserver_(v5, v6, (uint64_t)self->_connectionInterruptedObserver, v7);
  }
  else {
    objc_msgSend_removeObserver_(v5, v6, 0, v7);
  }

  objc_msgSend_invalidate(self->_discretionaryXPCConnection, v9, v10, v11);
  int statusReportToken = self->_statusReportToken;
  if (statusReportToken != -1) {
    notify_cancel(statusReportToken);
  }
  sub_18AF2909C(self, self->_sandboxExtensionHandles);
  v13.receiver = self;
  v13.super_class = (Class)CKContainerImplementation;
  [(CKContainerImplementation *)&v13 dealloc];
}

- (CKXPCConnection)connection
{
  id v4 = objc_msgSend_deviceContext(self, a2, v2, v3);
  int v8 = objc_msgSend_connection(v4, v5, v6, v7);

  return (CKXPCConnection *)v8;
}

- (NSString)containerIdentifier
{
  id v4 = objc_msgSend_containerID(self, a2, v2, v3);
  int v8 = objc_msgSend_containerIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)_discretionaryDaemonMachServiceConnection
{
  id v4 = @"com.apple.ckdiscretionaryd";
  if (_sCKUseSystemInstalledBinariesPredicate != -1) {
    dispatch_once(&_sCKUseSystemInstalledBinariesPredicate, &unk_1ED7EC1A8);
  }
  if (!_sCKUseSystemInstalledBinaries)
  {
    uint64_t v9 = objc_msgSend_stringByAppendingString_(v4, v2, @".debug", v3);

    id v4 = (__CFString *)v9;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F29268]);
  uint64_t v7 = objc_msgSend_initWithMachServiceName_options_(v5, v6, (uint64_t)v4, 0);

  return v7;
}

- (NSXPCConnection)discretionaryXPCConnection
{
  id v4 = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (CKContainerImplementation *)self->_daemonConnectionLock;
  }
  objc_msgSend_lock(self, a2, v2, v3);
  id v5 = v4->_discretionaryXPCConnection;
  uint64_t v9 = v5;
  if (!v4->_hasValidDiscretionaryXPCConnection || v5 == 0)
  {
    objc_initWeak(&location, v4);
    uint64_t v34 = objc_msgSend__discretionaryDaemonMachServiceConnection(v4, v11, v12, v13);

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_18B02FBFC;
    v38[3] = &unk_1E54610B0;
    objc_copyWeak(&v39, &location);
    objc_msgSend_setInterruptionHandler_(v34, v14, (uint64_t)v38, v15);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_18B02FCDC;
    v36[3] = &unk_1E54610B0;
    objc_copyWeak(&v37, &location);
    objc_msgSend_setInvalidationHandler_(v34, v16, (uint64_t)v36, v17);
    uint64_t v21 = objc_msgSend__CKXPCClientToDiscretionaryDaemonInterface(CKContainer, v18, v19, v20);
    objc_msgSend_setRemoteObjectInterface_(v34, v22, (uint64_t)v21, v23);

    id v24 = sub_18B11AB1C([CKContainerCallbackProxy alloc], (uint64_t)v4);
    objc_msgSend_setExportedObject_(v34, v25, (uint64_t)v24, v26);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v27 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v34;
      _os_log_impl(&dword_18AF10000, v27, OS_LOG_TYPE_INFO, "Created a new connection: %@", buf, 0xCu);
    }
    objc_msgSend_invalidate(v4->_discretionaryXPCConnection, v28, v29, v30);
    objc_storeStrong((id *)&v4->_discretionaryXPCConnection, v34);
    v4->_hasValidDiscretionaryXPCConnection = v34 != 0;
    objc_msgSend_resume(v34, v31, v32, v33);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v34 = v5;
  }
  objc_msgSend_unlock(v4->_daemonConnectionLock, v6, v7, v8);

  return (NSXPCConnection *)v34;
}

- (void)handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6 reply:(id)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void))a7;
  uint64_t v16 = self;
  objc_sync_enter(v16);
  if (v16) {
    sharingUIObservers = v16->_sharingUIObservers;
  }
  else {
    sharingUIObservers = 0;
  }
  uint64_t v18 = sharingUIObservers;
  uint64_t v22 = objc_msgSend_allObjects(v18, v19, v20, v21);

  objc_sync_exit(v16);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v23 = v22;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend_handleSharingUIUpdatedShare_recordID_isDeleted_error_(*(void **)(*((void *)&v30 + 1) + 8 * i), v25, (uint64_t)v12, (uint64_t)v13, v9, v14, (void)v30);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v26);
  }

  if (v9) {
    objc_msgSend_handleRecordChanged_changeType_record_error_(v16, v29, (uint64_t)v13, 3, v12, v14, (void)v30);
  }
  else {
    objc_msgSend_handleRecordChanged_changeType_record_error_(v16, v29, (uint64_t)v13, 2, v12, v14, (void)v30);
  }
  v15[2](v15, 0);
}

- (void)_addPreparedConvenienceOperation:(id)a3
{
  if (self) {
    self = (CKContainerImplementation *)self->_convenienceOperationQueue;
  }
  objc_msgSend_addOperation_(self, a2, (uint64_t)a3, v3);
}

- (void)addOperation:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [CKException alloc];
    id v22 = (id)objc_msgSend_initWithCode_format_(v20, v21, 12, @"CKDatabaseOperations must be submitted to a CKDatabase");
    objc_exception_throw(v22);
  }
  id v13 = objc_msgSend_configuration(v23, v10, v11, v12);
  objc_msgSend_setContainer_(v13, v14, (uint64_t)v8, v15);

  objc_msgSend_applyConvenienceConfiguration_(v23, v16, (uint64_t)v9, v17);
  objc_msgSend__addPreparedConvenienceOperation_(self, v18, (uint64_t)v23, v19);
}

- (void)_scheduleConvenienceOperation:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v13 = a3;
  objc_msgSend_configureConvenience_(v13, v10, (uint64_t)v8, v11);
  objc_msgSend_addOperation_wrappingContainer_convenienceConfiguration_(self, v12, (uint64_t)v13, (uint64_t)v9, v8);
}

- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_18AF10000, "client/status-groups-for-application-permission", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B0302C8;
  v13[3] = &unk_1E54610D8;
  id v14 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B030340;
  v10[3] = &unk_1E5461128;
  unint64_t v12 = a3;
  id v8 = v14;
  id v11 = v8;
  id v9 = v8;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v13, v10);
    id v9 = v11;
  }

  os_activity_scope_leave(&state);
}

- (void)setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = _os_activity_create(&dword_18AF10000, "client/set-application-permission-enabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B0305C0;
  v16[3] = &unk_1E54610D8;
  id v17 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B030638;
  v12[3] = &unk_1E5461178;
  unint64_t v14 = a3;
  BOOL v15 = a4;
  id v10 = v17;
  id v13 = v10;
  id v11 = v10;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v16, v12);
    id v11 = v13;
  }

  os_activity_scope_leave(&state);
}

- (void)resetAllApplicationPermissionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/reset-all-application-permissions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0308B0;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B030924;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  uint64_t v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    uint64_t v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)tossConfigWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/toss-config", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B030B80;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B030BF4;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  uint64_t v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    uint64_t v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (NSString)pushEnvironment
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279A60);
  uint64_t v3 = self->_pushEnvironment;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279A60);

  return v3;
}

- (void)setPushEnvironment:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB279A60);
  pushEnvironment = self->_pushEnvironment;
  self->_pushEnvironment = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB279A60);
}

- (void)pushEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/push-environment", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  unint64_t v12 = objc_msgSend_pushEnvironment(self, v6, v7, v8);
  if (v12)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v13 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_18AF10000, v13, OS_LOG_TYPE_DEBUG, "Using cached server preferred push environment", (uint8_t *)location, 2u);
    }
    v4[2](v4, v12, 0);
  }
  else
  {
    unint64_t v14 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v9, v10, v11);
    uint64_t v18 = objc_msgSend_untrustedEntitlements(v14, v15, v16, v17);
    id v22 = objc_msgSend_apsEnvironmentEntitlement(v18, v19, v20, v21);

    if (objc_msgSend_caseInsensitiveCompare_(v22, v23, @"serverpreferred", v24))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v25 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_debug_impl(&dword_18AF10000, v25, OS_LOG_TYPE_DEBUG, "Using adopter override push environment", (uint8_t *)location, 2u);
      }
      v4[2](v4, v22, 0);
    }
    else
    {
      objc_initWeak(location, self);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_18B031080;
      v28[3] = &unk_1E54611C8;
      objc_copyWeak(&v30, location);
      uint64_t v29 = v4;
      objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(self, v26, (uint64_t)v28, v27);

      objc_destroyWeak(&v30);
      objc_destroyWeak(location);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "Fetching server preferred push environment asynchronously", v7, 2u);
  }
  objc_msgSend_serverPreferredPushEnvironmentSynchronous_withCompletionHandler_(self, v6, 0, (uint64_t)v4);
}

- (id)serverPreferredPushEnvironmentWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_18AF13B10;
  id v22 = sub_18AF13848;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = sub_18AF13B10;
  uint64_t v16 = sub_18AF13848;
  id v17 = 0;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "Fetching server preferred push environment synchronously", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0314E0;
  v10[3] = &unk_1E54611F0;
  void v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend_serverPreferredPushEnvironmentSynchronous_withCompletionHandler_(self, v6, 1, (uint64_t)v10);
  if (a3)
  {
    uint64_t v7 = (void *)v13[5];
    if (v7) {
      *a3 = v7;
    }
  }
  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

- (void)serverPreferredPushEnvironmentSynchronous:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_18AF10000, "client/server-preferred-push-environment", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B0316C8;
  v12[3] = &unk_1E54610D8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B031740;
  v10[3] = &unk_1E54611A0;
  id v8 = v13;
  id v11 = v8;
  id v9 = v8;
  if (self)
  {
    sub_18AF3C510(self, v4, (void *)1, 0, v12, v10);
    id v9 = v11;
  }

  os_activity_scope_leave(&state);
}

- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18AF10000, "client/set-fake-error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B0319CC;
  v15[3] = &unk_1E5460240;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B031ABC;
  v12[3] = &unk_1E5461240;
  id v9 = v6;
  id v13 = v9;
  id v10 = v16;
  id v14 = v10;
  id v11 = v10;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v15, v12);
    id v11 = v14;
  }

  os_activity_scope_leave(&state);
}

- (void)setFakeResponseOperationResult:(id)a3 forNextRequestOfClassName:(id)a4 forItemID:(id)a5 withLifetime:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _os_activity_create(&dword_18AF10000, "client/set-fake-response-operation-result", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_18B031C8C;
  v23[3] = &unk_1E5460240;
  id v24 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B031D7C;
  v18[3] = &unk_1E5461268;
  id v14 = v10;
  id v19 = v14;
  id v15 = v24;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  int v22 = a6;
  id v17 = v16;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v23, v18);
    id v17 = v21;
  }

  os_activity_scope_leave(&state);
}

- (void)getOutstandingOperationCountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/get-num-outstanding-operations", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B031EF8;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B031F70;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)getRegisteredItemCountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/get-num-registered-item-count", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0321C0;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B032238;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)dropDetachedContainersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/drop-detached-containers", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B032488;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0324FC;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B03267C;
  v8[3] = &unk_1E54612B8;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_fetchGlobalPerUserBoundaryKeyWithCompletionHandler_(self, v6, (uint64_t)v8, v7);
}

- (void)fetchGlobalPerUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18AF10000, "client/fetch-current-user-boundary-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "Fetching boundary key", buf, 2u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0328E8;
  v11[3] = &unk_1E54610D8;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B032A08;
  v9[3] = &unk_1E54611A0;
  id v7 = v12;
  id v10 = v7;
  id v8 = v7;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v11, v9);
    id v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (id)untrustedEntitlements
{
  return (id)((uint64_t (*)(CKContainerImplementation *, char *))MEMORY[0x1F4181798])(self, sel_resolvedEntitlements);
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138543362;
    id v17 = v5;
    _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "setSourceApplicationBundleIdentifier:%{public}@", (uint8_t *)&v16, 0xCu);
  }
  id v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_sourceApplicationBundleIdentifier_locked, a3);
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v7->_options, v8, (uint64_t)v5, v9);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v7->_options, v10, (uint64_t)v5, v11);
  objc_msgSend_setApplicationBundleIdentifierOverrideForPushTopicGeneration_(v7->_options, v12, (uint64_t)v5, v13);
  objc_msgSend_setHasCachedSetupInfo_(v7, v14, 0, v15);
  objc_sync_exit(v7);
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138543362;
    id v13 = v4;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "setSourceApplicationSecondaryIdentifier:%{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_copy(v4, v7, v8, v9);
  sourceApplicationSecondaryIdentifier_locked = v6->_sourceApplicationSecondaryIdentifier_locked;
  v6->_sourceApplicationSecondaryIdentifier_locked = (NSString *)v10;

  objc_sync_exit(v6);
}

- (void)wipeAllCachesAndDie
{
  objc_msgSend_connection(self, a2, v2, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend_processScopedDaemonProxy(v11, v4, v5, v6);
  objc_msgSend_wipeAllCachesAndDie(v7, v8, v9, v10);
}

- (void)clearContainerFromMetadataCache
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/clear-container-from-metadata-cache", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  if (self) {
    sub_18AF3C510(self, 0, (void *)1, 0, &unk_1ED7F5358, &unk_1ED7EFB38);
  }
  os_activity_scope_leave(&v4);
}

- (void)clearPILSCacheForLookupInfos:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/clear-PILS-cache-for-lookup-infos", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B033230;
  v8[3] = &unk_1E5461300;
  id v6 = v4;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, &unk_1ED7EFB98, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)representativeDataclassEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/dataclass-enabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B033398;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B033480;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchServerEnvironment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-server-environment", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0336D0;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B033748;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-current-device-id", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B033998;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B033A10;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-full-name-and-primary-email-on-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B033C74;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B033CF0;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-full-name-and-formatted-username-on-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B033F80;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B033FFC;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)submitEventMetric:(id)a3
{
  id v4 = a3;
  if (byte_1E912FED0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8.opaque[0]) = 0;
      _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "Not submitting event metric for test host", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    id v6 = _os_activity_create(&dword_18AF10000, "client/submit-event-metric", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(v6, &v8);
    objc_msgSend__submitEventMetric_completionHandler_(self, v7, (uint64_t)v4, 0);
    os_activity_scope_leave(&v8);
  }
}

- (void)submitEventMetric:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (byte_1E912FED0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    os_activity_scope_state_s v8 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11.opaque[0]) = 0;
      _os_log_debug_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEBUG, "Not submitting event metric for test host", (uint8_t *)&v11, 2u);
    }
    v7[2](v7);
  }
  else
  {
    id v9 = _os_activity_create(&dword_18AF10000, "client/submit-event-metric-with-completion-handler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v9, &v11);
    objc_msgSend__submitEventMetric_completionHandler_(self, v10, (uint64_t)v6, (uint64_t)v7);
    os_activity_scope_leave(&v11);
  }
}

- (void)_submitEventMetric:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  uint64_t v10 = objc_msgSend_generateEventMetricInfo(a3, v7, v8, v9);
  if (!v10)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v17 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "Failed to create CKEventMetricInfo", buf, 2u);
      if (!v6) {
        goto LABEL_14;
      }
    }
    else if (!v6)
    {
      goto LABEL_14;
    }
    v6[2](v6);
    goto LABEL_14;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  os_activity_scope_state_s v11 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    int v12 = v11;
    int v16 = objc_msgSend_metricUUID(v10, v13, v14, v15);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v16;
    _os_log_impl(&dword_18AF10000, v12, OS_LOG_TYPE_INFO, "Client submitting CKEventMetric %{public}@.", buf, 0xCu);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B034628;
  v22[3] = &unk_1E5461378;
  id v23 = v10;
  id v24 = v6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B03475C;
  v18[3] = &unk_1E54613A0;
  id v19 = v23;
  id v20 = self;
  id v21 = v24;
  if (self) {
    sub_18AF3C510(self, 0, (void *)1, 0, v22, v18);
  }

LABEL_14:
}

- (int64_t)lastKnownDeviceCount
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Retrieving device count for %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B034A8C;
  v5[3] = &unk_1E54613F0;
  v5[4] = &buf;
  if (self)
  {
    sub_18AF3C510(self, 1, (void *)1, 0, &unk_1ED7F5378, v5);
    self = *(CKContainerImplementation **)(*((void *)&buf + 1) + 24);
  }
  _Block_object_dispose(&buf, 8);
  return (int64_t)self;
}

- (id)networkTransferEndpointWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "Getting network transfer endpoint for %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_18AF13B10;
  uint64_t v27 = sub_18AF13848;
  id v28 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_18AF13B10;
  int v22 = sub_18AF13848;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B034EE0;
  v17[3] = &unk_1E5461418;
  v17[4] = &buf;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B034FDC;
  v16[3] = &unk_1E5461468;
  void v16[4] = &buf;
  v16[5] = &v18;
  if (self)
  {
    sub_18AF3C510(self, 1, (void *)1, 0, v17, v16);
    objc_msgSend_CKClientSuitableError(*(void **)(*((void *)&buf + 1) + 40), v9, v10, v11);
  }
  else
  {
    objc_msgSend_CKClientSuitableError(0, v6, v7, v8);
  uint64_t v12 = };
  id v13 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v12;

  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&buf, 8);

  return v14;
}

- (id)recordChangeProvider
{
  return (id)objc_msgSend_sharedManager(CKRecordObserverManager, a2, v2, v3);
}

- (void)handleRecordChanged:(id)a3 changeType:(int64_t)a4 record:(id)a5 error:(id)a6
{
  if (!a6)
  {
    id v10 = a5;
    id v11 = a3;
    uint64_t v12 = [CKRecordChange alloc];
    id v23 = (id)objc_msgSend_initWithChangeType_recordID_record_(v12, v13, a4, (uint64_t)v11, v10);

    id v17 = objc_msgSend_sharedManager(CKRecordObserverManager, v14, v15, v16);
    id v21 = objc_msgSend_unconfiguredWrappingContainer(self, v18, v19, v20);
    objc_msgSend_handleRecordChange_container_completionHandler_(v17, v22, (uint64_t)v23, (uint64_t)v21, 0);
  }
}

- (void)fetchFrameworkCachesDirectoryWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = self;
    _os_log_debug_impl(&dword_18AF10000, v5, OS_LOG_TYPE_DEBUG, "Retrieving client-accessible caches directory for %@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B035528;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B0355A0;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  uint64_t v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    uint64_t v7 = v9;
  }
}

- (id)CKStatusReportArray
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = NSString;
  uint64_t v8 = objc_msgSend_containerID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_ckShortDescription(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v13, v14, v15);
  uint64_t v20 = objc_msgSend_processName(v16, v17, v18, v19);
  id v23 = objc_msgSend_stringWithFormat_(v4, v21, @"\n----- Client Status Report For %@ (client:\"%@\")", v22, v12, v20);
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

  uint64_t v26 = NSString;
  id v30 = objc_msgSend_throttlingOperationQueue(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_operationCount(v30, v31, v32, v33);
  v38 = objc_msgSend_throttlingOperationQueue(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_maxConcurrentOperationCount(v38, v39, v40, v41);
  char v45 = objc_msgSend_stringWithFormat_(v26, v43, @"%@, %lu/%ld operations", v44, self, v34, v42);
  objc_msgSend_addObject_(v3, v46, (uint64_t)v45, v47);

  objc_msgSend_addObject_(v3, v48, @"\n%%%%% Operations %%%%%", v49);
  uint64_t v53 = objc_msgSend_throttlingOperationQueue(self, v50, v51, v52);
  uint64_t v57 = objc_msgSend_operationCount(v53, v54, v55, v56);

  if (v57)
  {
    objc_msgSend_addObject_(v3, v58, @"\nOperations on throttling queue: {", v59);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    uint64_t v63 = objc_msgSend_throttlingOperationQueue(self, v60, v61, v62);
    uint64_t v67 = objc_msgSend_operations(v63, v64, v65, v66);

    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v111, (uint64_t)v116, 16);
    if (v69)
    {
      uint64_t v72 = v69;
      uint64_t v73 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v72; ++i)
        {
          if (*(void *)v112 != v73) {
            objc_enumerationMutation(v67);
          }
          uint64_t v75 = objc_msgSend_stringWithFormat_(NSString, v70, @"\t%@", v71, *(void *)(*((void *)&v111 + 1) + 8 * i));
          objc_msgSend_addObject_(v3, v76, (uint64_t)v75, v77);
        }
        uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v111, (uint64_t)v116, 16);
      }
      while (v72);
    }

    objc_msgSend_addObject_(v3, v78, @"}", v79);
  }
  else
  {
    objc_msgSend_addObject_(v3, v58, @"No regular operations.", v59);
  }
  if (self) {
    uint64_t v83 = objc_msgSend_operationCount(self->_convenienceOperationQueue, v80, v81, v82);
  }
  else {
    uint64_t v83 = objc_msgSend_operationCount(0, v80, v81, v82);
  }
  if (v83)
  {
    objc_msgSend_addObject_(v3, v84, @"\nOperations on convenience queue: {", v85);
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    if (self) {
      objc_msgSend_operations(self->_convenienceOperationQueue, v86, v87, v88);
    }
    else {
    v89 = objc_msgSend_operations(0, v86, v87, v88);
    }
    uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v107, (uint64_t)v115, 16);
    if (v91)
    {
      uint64_t v94 = v91;
      uint64_t v95 = *(void *)v108;
      do
      {
        for (uint64_t j = 0; j != v94; ++j)
        {
          if (*(void *)v108 != v95) {
            objc_enumerationMutation(v89);
          }
          uint64_t v97 = objc_msgSend_stringWithFormat_(NSString, v92, @"\t%@", v93, *(void *)(*((void *)&v107 + 1) + 8 * j));
          objc_msgSend_addObject_(v3, v98, (uint64_t)v97, v99);
        }
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v92, (uint64_t)&v107, (uint64_t)v115, 16);
      }
      while (v94);
    }

    objc_msgSend_addObject_(v3, v100, @"}", v101);
  }
  else
  {
    objc_msgSend_addObject_(v3, v84, @"No convenience operations.", v85);
  }
  objc_msgSend_addObject_(v3, v102, @"%%%%%%%%%%%%%%%%%%%%%%%%", v103);
  objc_msgSend_addObject_(v3, v104, @"\n------------------------------", v105);

  return v3;
}

- (void)dumpDaemonStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/dump-daemon-status-report", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B035C1C;
  v15[3] = &unk_1E54610D8;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B035C7C;
  v12[3] = &unk_1E5461490;
  id v9 = v6;
  id v13 = v9;
  id v10 = v16;
  id v14 = v10;
  uint64_t v11 = v10;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v15, v12);
    uint64_t v11 = v14;
  }

  os_activity_scope_leave(&state);
}

- (void)dumpDaemonStatusReport
{
}

- (id)primaryIdentifier
{
  id v4 = objc_msgSend_options(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6, v7);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    sub_18B035DF8();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)applicationBundleIdentifierForPush
{
  uint64_t v5 = objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E4F223F8], a2, v2, v3);
  objc_opt_class();
  char v45 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v9 = objc_msgSend_containingBundleRecord(v5, v6, v7, v8);
    id v13 = objc_msgSend_bundleIdentifier(v9, v10, v11, v12);
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v6, v7, v8);
  uint64_t v18 = objc_msgSend_untrustedEntitlements(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_applicationBundleID(v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v23, v24, v25);
  id v30 = objc_msgSend_untrustedEntitlements(v26, v27, v28, v29);
  uint64_t v34 = objc_msgSend_associatedApplicationBundleID(v30, v31, v32, v33);
  v38 = objc_msgSend_options(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v38, v39, v40, v41);
  uint64_t v43 = CKApplicationBundleIDForPush(v22, v34, v42, v13);

  return v43;
}

- (void)addPreparedOperationToThrottlingOperationQueue:(id)a3
{
  objc_msgSend_addOperation_(self->_throttlingOperationQueue, a2, (uint64_t)a3, v3);
}

- (void)addPreparedOperationToBackgroundThrottlingOperationQueue:(id)a3
{
  objc_msgSend_addOperation_(self->_backgroundThrottlingOperationQueue, a2, (uint64_t)a3, v3);
}

- (void)addPreparedOperationToDiscretionaryThrottlingOperationQueue:(id)a3
{
  objc_msgSend_addOperation_(self->_discretionaryThrottlingOperationQueue, a2, (uint64_t)a3, v3);
}

- (void)simulateMemoryPressure:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v7 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18AF10000, v7, OS_LOG_TYPE_INFO, "Simulating memory pressure", buf, 2u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B0361AC;
  v13[3] = &unk_1E54610D8;
  id v14 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0362B0;
  v10[3] = &unk_1E5461128;
  int64_t v12 = a3;
  id v8 = v14;
  id v11 = v8;
  id v9 = v8;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v13, v10);
    id v9 = v11;
  }
}

- (CKRecordID)orgAdminUserID
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1EB279A98);
  orgAdminUserID_locked = self->_orgAdminUserID_locked;

  return orgAdminUserID_locked;
}

- (void)fetchOrgAdminUserRecordIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-org-admin-user-record-id", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  sub_18AF39EEC(self, (void *)1, v4);
  os_activity_scope_leave(&v6);
}

- (void)discoverAllIdentitiesWithWrappingContainer:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_18B036788;
  v27[3] = &unk_1E5461558;
  id v16 = v15;
  id v28 = v16;
  objc_msgSend_setUserIdentityDiscoveredBlock_(v11, v17, (uint64_t)v27, v18);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_18B036794;
  v24[3] = &unk_1E5461580;
  id v25 = v16;
  id v26 = v8;
  id v19 = v16;
  id v20 = v8;
  objc_msgSend_setDiscoverAllUserIdentitiesCompletionBlock_(v11, v21, (uint64_t)v24, v22);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v23, (uint64_t)v11, (uint64_t)v10, v9);
}

- (void)discoverUserIdentityWithEmailAddress:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [CKUserIdentityLookupInfo alloc];
  id v17 = (id)objc_msgSend_initWithEmailAddress_(v14, v15, (uint64_t)v13, v16);

  sub_18B0367B8(self, v17, v12, v11, v10);
}

- (void)discoverUserIdentityWithPhoneNumber:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [CKUserIdentityLookupInfo alloc];
  id v17 = (id)objc_msgSend_initWithPhoneNumber_(v14, v15, (uint64_t)v13, v16);

  sub_18B0367B8(self, v17, v12, v11, v10);
}

- (void)discoverUserIdentityWithUserRecordID:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [CKUserIdentityLookupInfo alloc];
  id v17 = (id)objc_msgSend_initWithUserRecordID_(v14, v15, (uint64_t)v13, v16);

  sub_18B0367B8(self, v17, v12, v11, v10);
}

- (void)fetchShareParticipantWithLookupInfo:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [CKFetchShareParticipantsOperation alloc];
  v37[0] = v10;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v37, 1);
  id v19 = objc_msgSend_initWithUserIdentityLookupInfos_(v14, v17, (uint64_t)v16, v18);

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_18AF13B10;
  v35[4] = sub_18AF13848;
  id v36 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_18B036F30;
  v34[3] = &unk_1E54615F8;
  v34[4] = v35;
  objc_msgSend_setPerShareParticipantCompletionBlock_(v19, v20, (uint64_t)v34, v21);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_18B036F44;
  id v30 = &unk_1E54615D0;
  id v22 = v13;
  id v32 = v22;
  uint64_t v33 = v35;
  id v23 = v10;
  id v31 = v23;
  objc_msgSend_setFetchShareParticipantsCompletionBlock_(v19, v24, (uint64_t)&v27, v25);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v26, (uint64_t)v19, (uint64_t)v11, v12, v27, v28, v29, v30);

  _Block_object_dispose(v35, 8);
}

- (void)fetchShareParticipantWithEmailAddress:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v33 = 0;
  char v14 = _CKCheckArgument((uint64_t)"emailAddress", v10, 0, 0, 0, &v33);
  id v15 = v33;
  if ((v14 & 1) == 0)
  {
    uint64_t v21 = v15;
    id v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    id v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  uint64_t v16 = [CKUserIdentityLookupInfo alloc];
  id v19 = objc_msgSend_initWithEmailAddress_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(self, v20, (uint64_t)v19, (uint64_t)v11, v12, v13);
}

- (void)fetchShareParticipantWithPhoneNumber:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v33 = 0;
  char v14 = _CKCheckArgument((uint64_t)"phoneNumber", v10, 0, 0, 0, &v33);
  id v15 = v33;
  if ((v14 & 1) == 0)
  {
    uint64_t v21 = v15;
    id v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    id v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  uint64_t v16 = [CKUserIdentityLookupInfo alloc];
  id v19 = objc_msgSend_initWithPhoneNumber_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(self, v20, (uint64_t)v19, (uint64_t)v11, v12, v13);
}

- (void)fetchShareParticipantWithUserRecordID:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v33 = 0;
  char v14 = _CKCheckArgument((uint64_t)"userRecordID", v10, 0, 1, 0, &v33);
  id v15 = v33;
  if ((v14 & 1) == 0)
  {
    uint64_t v21 = v15;
    id v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    id v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  uint64_t v16 = [CKUserIdentityLookupInfo alloc];
  id v19 = objc_msgSend_initWithUserRecordID_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(self, v20, (uint64_t)v19, (uint64_t)v11, v12, v13);
}

- (void)fetchShareMetadataWithURL:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v51 = 0;
  char v14 = _CKCheckArgument((uint64_t)"shareURL", v10, 0, 0, 0, &v51);
  id v15 = v51;
  uint64_t v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v31 = [CKException alloc];
    uint64_t v35 = objc_msgSend_code(v16, v32, v33, v34);
    id v39 = objc_msgSend_localizedDescription(v16, v36, v37, v38);
    id v41 = (id)objc_msgSend_initWithCode_format_(v31, v40, v35, @"%@", v39);

    objc_exception_throw(v41);
  }

  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_18AF13B10;
  v49[4] = sub_18AF13848;
  id v50 = 0;
  id v17 = [CKFetchShareMetadataOperation alloc];
  v52[0] = v10;
  id v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v52, 1);
  id v22 = objc_msgSend_initWithShareURLs_(v17, v20, (uint64_t)v19, v21);

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_18B037680;
  v46[3] = &unk_1E5461620;
  id v23 = v10;
  id v47 = v23;
  uint64_t v48 = v49;
  objc_msgSend_setPerShareMetadataBlock_(v22, v24, (uint64_t)v46, v25);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_18B0376F8;
  v42[3] = &unk_1E54615D0;
  id v26 = v13;
  id v44 = v26;
  char v45 = v49;
  id v27 = v23;
  id v43 = v27;
  objc_msgSend_setFetchShareMetadataCompletionBlock_(v22, v28, (uint64_t)v42, v29);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v30, (uint64_t)v22, (uint64_t)v11, v12);

  _Block_object_dispose(v49, 8);
}

- (void)acceptShareMetadata:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v51 = 0;
  char v14 = _CKCheckArgument((uint64_t)"metadata", v10, 0, 0, 0, &v51);
  id v15 = v51;
  uint64_t v16 = v15;
  if ((v14 & 1) == 0)
  {
    id v31 = [CKException alloc];
    uint64_t v35 = objc_msgSend_code(v16, v32, v33, v34);
    id v39 = objc_msgSend_localizedDescription(v16, v36, v37, v38);
    id v41 = (id)objc_msgSend_initWithCode_format_(v31, v40, v35, @"%@", v39);

    objc_exception_throw(v41);
  }

  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_18AF13B10;
  v49[4] = sub_18AF13848;
  id v50 = 0;
  id v17 = [CKAcceptSharesOperation alloc];
  v52[0] = v10;
  id v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v52, 1);
  id v22 = objc_msgSend_initWithShareMetadatas_(v17, v20, (uint64_t)v19, v21);

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_18B037A74;
  v46[3] = &unk_1E5461648;
  id v23 = v10;
  id v47 = v23;
  uint64_t v48 = v49;
  objc_msgSend_setPerShareCompletionBlock_(v22, v24, (uint64_t)v46, v25);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_18B037AEC;
  v42[3] = &unk_1E54615D0;
  id v26 = v13;
  id v44 = v26;
  char v45 = v49;
  id v27 = v23;
  id v43 = v27;
  objc_msgSend_setAcceptSharesCompletionBlock_(v22, v28, (uint64_t)v42, v29);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v30, (uint64_t)v22, (uint64_t)v11, v12);

  _Block_object_dispose(v49, 8);
}

- (void)decryptPersonalInfoOnShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18AF10000, "client/decrypt-personal-info-on-share", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B037D44;
  v15[3] = &unk_1E54610D8;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B037DBC;
  v12[3] = &unk_1E5461490;
  id v9 = v6;
  id v13 = v9;
  id v10 = v16;
  id v14 = v10;
  id v11 = v10;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v15, v12);
    id v11 = v14;
  }

  os_activity_scope_leave(&state);
}

- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/get-new-web-sharing-identity-data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B038024;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B03809C;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)_refreshAccountAccessAuthorizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/refresh-account-access-authorization", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v9 = objc_msgSend_accountInfoFetchQueue(self, v6, v7, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B03830C;
  v11[3] = &unk_1E5460058;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);

  os_activity_scope_leave(&state);
}

- (BOOL)__preflightAccountAccessAuthorization:(int64_t *)a3
{
  if (CKIsRunningInSyncBubble()) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_options(self, v5, v6, v7);
  id v12 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v8, v9, v10, v11);

  if (v12) {
    return 0;
  }
  int v14 = TCCAccessPreflight();
  if (a3)
  {
    if (v14 == 1) {
      int64_t v15 = 0;
    }
    else {
      int64_t v15 = -1;
    }
    if (!v14) {
      int64_t v15 = 1;
    }
    *a3 = v15;
  }
  return 1;
}

- (void)accountStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/account-status", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "Fetching account status", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B039004;
  v10[3] = &unk_1E54616E8;
  id v7 = v4;
  id v11 = v7;
  objc_msgSend_accountInfoWithCompletionHandler_(self, v8, (uint64_t)v10, v9);

  os_activity_scope_leave(&state);
}

- (void)reloadAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/reload-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18AF10000, v6, OS_LOG_TYPE_INFO, "Reloading account", buf, 2u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0397CC;
  v11[3] = &unk_1E54610D8;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B0398E8;
  v9[3] = &unk_1E54611A0;
  id v7 = v12;
  id v10 = v7;
  uint64_t v8 = v7;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v11, v9);
    uint64_t v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)statusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v10 = objc_msgSend_signpost(CKSignpost, v7, v8, v9);
  int v14 = v10;
  if (v10)
  {
    int64_t v15 = objc_msgSend_log(v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_identifier(v14, v16, v17, v18);
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v15))
      {
        LOWORD(buf.opaque[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v20, "statusForApplicationPermission", "", (uint8_t *)&buf, 2u);
      }
    }
  }
  uint64_t v21 = _os_activity_create(&dword_18AF10000, "client/status-for-application-permission", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v21, &buf);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v22 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v34 = 134217984;
    unint64_t v35 = a3;
    _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "Fetching application permissions for %lu", v34, 0xCu);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_18B039DD4;
  v30[3] = &unk_1E5461580;
  id v32 = v6;
  id v31 = v14;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_18B039F48;
  v26[3] = &unk_1E54617D8;
  unint64_t v29 = a3;
  id v23 = v32;
  id v28 = v23;
  id v24 = v31;
  id v27 = v24;
  uint64_t v25 = v24;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v30, v26);
    uint64_t v25 = v27;
  }

  os_activity_scope_leave(&buf);
}

- (void)requestApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v10 = objc_msgSend_signpost(CKSignpost, v7, v8, v9);
  int v14 = v10;
  if (v10)
  {
    int64_t v15 = objc_msgSend_log(v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_identifier(v14, v16, v17, v18);
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v15))
      {
        LOWORD(buf.opaque[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v20, "requestApplicationPermission", "", (uint8_t *)&buf, 2u);
      }
    }
  }
  uint64_t v21 = _os_activity_create(&dword_18AF10000, "client/request-application-permission", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v21, &buf);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v22 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v34 = 134217984;
    unint64_t v35 = a3;
    _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "Requesting application permissions: %lu", v34, 0xCu);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_18B03A538;
  v30[3] = &unk_1E5461580;
  id v32 = v6;
  id v31 = v14;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_18B03A6AC;
  v26[3] = &unk_1E54617D8;
  unint64_t v29 = a3;
  id v23 = v32;
  id v28 = v23;
  id v24 = v31;
  id v27 = v24;
  uint64_t v25 = v24;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v30, v26);
    uint64_t v25 = v27;
  }

  os_activity_scope_leave(&buf);
}

- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/fetch-all-long-lived-operation-ids", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B03AD2C;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B03ADA4;
  v8[3] = &unk_1E54611A0;
  id v6 = v11;
  id v9 = v6;
  id v7 = v6;
  if (self)
  {
    sub_18AF3C510(self, 0, (void *)1, 0, v10, v8);
    id v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchLongLivedOperationWithID:(id)a3 wrappingContainer:(id)a4 completionHandler:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18AF10000, "client/fetch-long-lived-operation-with-id", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (v8)
  {
    v28[0] = v8;
    uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v28, 1);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_18B03B160;
    v19[3] = &unk_1E5461850;
    id v20 = v10;
    id v14 = v13;
    id v15 = v9;
    id v16 = v19;
    uint64_t v17 = v16;
    if (self)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_18B03A8D4;
      v26[3] = &unk_1E54610D8;
      uint64_t v18 = v16;
      id v27 = v18;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_18B03A94C;
      v22[3] = &unk_1E5461828;
      id v23 = v14;
      id v24 = v15;
      uint64_t v25 = v18;
      sub_18AF3C510(self, 0, (void *)1, 0, v26, v22);
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)registerForAssetUploadRequests:(id)a3
{
}

- (void)registerForAssetUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = [CKException alloc];
    id v13 = (id)objc_msgSend_initWithName_format_(v11, v12, *MEMORY[0x1E4F1C3C8], @"The asset request callback must not be null");
    objc_exception_throw(v13);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B03B2FC;
  v14[3] = &unk_1E5461878;
  id v15 = v7;
  id v16 = v6;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_withUploadManager_performBlock_(self, v10, 0, (uint64_t)v14);
}

- (void)registerForPackageUploadRequests:(id)a3
{
}

- (void)registerForPackageUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = [CKException alloc];
    id v13 = (id)objc_msgSend_initWithName_format_(v11, v12, *MEMORY[0x1E4F1C3C8], @"The package request callback must not be null");
    objc_exception_throw(v13);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B03B44C;
  v14[3] = &unk_1E5461878;
  id v15 = v7;
  id v16 = v6;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_withUploadManager_performBlock_(self, v10, 0, (uint64_t)v14);
}

- (void)withUploadManager:(int)a3 performBlock:(id)a4
{
  id v31 = (unsigned int (**)(void))a4;
  os_unfair_lock_lock(&self->_uploadRequestManagerLock);
  uploadRequestManager_locked = self->_uploadRequestManager_locked;
  if (!a3 && !uploadRequestManager_locked)
  {
    id v9 = objc_msgSend_sharedOptions(CKBehaviorOptions, 0, v6, v7);
    uint64_t v10 = sub_18B0D5C50((uint64_t)v9);

    id v11 = [CKUploadRequestManager alloc];
    id v15 = objc_msgSend_unconfiguredWrappingContainer(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_options(self, v16, v17, v18);
    id v23 = objc_msgSend_uploadRequestConfiguration(v19, v20, v21, v22);
    uint64_t v25 = (CKUploadRequestManager *)objc_msgSend_initWithContainer_repairContainerOverrides_ignoringSystemConditions_(v11, v24, (uint64_t)v15, (uint64_t)v23, v10);
    id v26 = self->_uploadRequestManager_locked;
    self->_uploadRequestManager_locked = v25;

    uploadRequestManager_locked = self->_uploadRequestManager_locked;
  }
  if (uploadRequestManager_locked && v31[2]() == 1)
  {
    objc_msgSend_unregister(self->_uploadRequestManager_locked, v27, v28, v29);
    id v30 = self->_uploadRequestManager_locked;
    self->_uploadRequestManager_locked = 0;
  }
  os_unfair_lock_unlock(&self->_uploadRequestManagerLock);
}

- (void)unregisterFromUploadRequests
{
}

- (void)unregisterFromUploadRequestsWithMachServiceName:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B03B6A8;
  v7[3] = &unk_1E54618C0;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_withUploadManager_performBlock_(self, v6, 1, (uint64_t)v7);
}

- (void)manuallyTriggerUploadRequests
{
}

- (void)cancelUploadRequests
{
}

- (void)registerForAssetRequests:(id)a3 packageRequests:(id)a4 machServiceName:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (!(v8 | v9))
  {
    uint64_t v21 = [CKException alloc];
    id v23 = (id)objc_msgSend_initWithName_format_(v21, v22, *MEMORY[0x1E4F1C3C8], @"One of the callbacks must not be null");
    objc_exception_throw(v23);
  }
  id v11 = v10;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v12 = ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = &stru_1ED7F5C98;
    uint64_t v14 = @"package";
    if (v9)
    {
      BOOL v15 = v8 == 0;
    }
    else
    {
      uint64_t v14 = &stru_1ED7F5C98;
      BOOL v15 = 1;
    }
    id v16 = @" and ";
    if (v15) {
      id v16 = &stru_1ED7F5C98;
    }
    *(_DWORD *)os_activity_scope_state_s buf = 138543874;
    if (v8) {
      uint64_t v13 = @"asset";
    }
    uint64_t v29 = v13;
    __int16 v30 = 2114;
    id v31 = v16;
    __int16 v32 = 2114;
    uint64_t v33 = v14;
    _os_log_impl(&dword_18AF10000, v12, OS_LOG_TYPE_INFO, "Registering for %{public}@%{public}@%{public}@ upload requests", buf, 0x20u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_18B03B948;
  v24[3] = &unk_1E54618E8;
  id v26 = (id)v8;
  id v27 = (id)v9;
  id v25 = v11;
  id v17 = v11;
  id v18 = (id)v9;
  id v19 = (id)v8;
  objc_msgSend_withUploadManager_performBlock_(self, v20, 0, (uint64_t)v24);
}

- (BOOL)beginContentAccess
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl(&dword_18AF10000, v3, OS_LOG_TYPE_INFO, "Beginning content access", buf, 2u);
  }
  *(void *)os_activity_scope_state_s buf = 0;
  uint64_t v7 = buf;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_18B03BC34;
  v5[3] = &unk_1E54613F0;
  v5[4] = buf;
  if (self)
  {
    sub_18AF3C510(self, 1, (void *)1, 0, &unk_1ED7F5418, v5);
    LOBYTE(self) = v7[24] != 0;
  }
  _Block_object_dispose(buf, 8);
  return (char)self;
}

- (void)endContentAccess
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18AF10000, v3, OS_LOG_TYPE_INFO, "Ending content access", v4, 2u);
  }
  if (self) {
    sub_18AF3C510(self, 0, (void *)1, 0, &unk_1ED7F5438, &unk_1ED7F5458);
  }
}

- (void)discardContentIfPossible
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18AF10000, v3, OS_LOG_TYPE_INFO, "Discarding content if possible", v4, 2u);
  }
  if (self) {
    sub_18AF3C510(self, 0, (void *)1, 0, &unk_1ED7F5478, &unk_1ED7F5498);
  }
}

- (BOOL)isContentDiscarded
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B03C4CC;
  v4[3] = &unk_1E54613F0;
  v4[4] = &v5;
  if (self)
  {
    sub_18AF3C510(self, 1, (void *)1, 0, &unk_1ED7F54B8, v4);
    BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isPersonaOverrideSet
{
  return self->_isPersonaOverrideSet;
}

- (void)setIsPersonaOverrideSet:(BOOL)a3
{
  self->_isPersonaOverrideSet = a3;
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (CKContainer)unconfiguredWrappingContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unconfiguredWrappingContainer);

  return (CKContainer *)WeakRetained;
}

- (NSMutableArray)codeServiceImplementations
{
  return self->_codeServiceImplementations;
}

- (NSOperationQueue)throttlingOperationQueue
{
  return self->_throttlingOperationQueue;
}

- (NSOperationQueue)backgroundThrottlingOperationQueue
{
  return self->_backgroundThrottlingOperationQueue;
}

- (NSOperationQueue)discretionaryThrottlingOperationQueue
{
  return self->_discretionaryThrottlingOperationQueue;
}

- (int)statusReportToken
{
  return self->_statusReportToken;
}

- (CKContainerSetupInfo)cachedSetupInfo
{
  return self->_cachedSetupInfo;
}

- (void)setHasCachedSetupInfo:(BOOL)a3
{
  self->_hasCachedSetupInfo = a3;
}

- (CKEntitlements)resolvedEntitlements
{
  return self->_resolvedEntitlements;
}

- (void)setFakeDeviceToDeviceEncryptionAvailability:(id)a3
{
}

- (OS_dispatch_queue)underlyingDispatchQueue
{
  return self->_underlyingDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingUIObservers, 0);
  objc_storeStrong((id *)&self->_daemonConnectionLock, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_convenienceOperationQueue, 0);
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, 0);
  objc_storeStrong((id *)&self->_containerScopedDaemonProxyCreator, 0);
  objc_storeStrong((id *)&self->_underlyingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_fakeDeviceToDeviceEncryptionAvailability, 0);
  objc_storeStrong((id *)&self->_resolvedEntitlements, 0);
  objc_storeStrong((id *)&self->_cachedSetupInfo, 0);
  objc_storeStrong((id *)&self->_discretionaryThrottlingOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundThrottlingOperationQueue, 0);
  objc_storeStrong((id *)&self->_throttlingOperationQueue, 0);
  objc_storeStrong((id *)&self->_codeServiceImplementations, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_destroyWeak((id *)&self->_unconfiguredWrappingContainer);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_storeStrong((id *)&self->_discretionaryXPCConnection, 0);
  objc_storeStrong((id *)&self->_organizationCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_sharedCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_publicCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier_locked, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier_locked, 0);
  objc_storeStrong((id *)&self->_orgAdminUserID_locked, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID_locked, 0);

  objc_storeStrong((id *)&self->_uploadRequestManager_locked, 0);
}

@end