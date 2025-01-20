@interface CKDMapShareURLsToInstalledBundleIDsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDMapShareURLsToInstalledBundleIDsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSMutableArray)shareURLs;
- (NSMutableDictionary)shareMetadatasByURL;
- (id)activityCreate;
- (id)bundleIDsFetchedBlock;
- (int)operationType;
- (void)_fetchRegisteredBundleIDs;
- (void)_fetchShareMetadata;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_performCallbackForURL:(id)a3 withAppBundleIDs:(id)a4 daemonBundleIDs:(id)a5 error:(id)a6;
- (void)main;
- (void)setBundleIDsFetchedBlock:(id)a3;
- (void)setShareMetadatasByURL:(id)a3;
- (void)setShareURLs:(id)a3;
@end

@implementation CKDMapShareURLsToInstalledBundleIDsOperation

- (CKDMapShareURLsToInstalledBundleIDsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKDMapShareURLsToInstalledBundleIDsOperation;
  v9 = [(CKDOperation *)&v18 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_shareURLs(v6, v7, v8);
    uint64_t v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    shareURLs = v9->_shareURLs;
    v9->_shareURLs = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    shareMetadatasByURL = v9->_shareMetadatasByURL;
    v9->_shareMetadatasByURL = (NSMutableDictionary *)v15;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/map-share-urls-to-bundle-IDs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 244;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      v10 = objc_msgSend_error(self, v8, v9);
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__fetchRegisteredBundleIDs(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__fetchShareMetadata(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetch Share Metadata";
  }
  else if (a3 == 3)
  {
    v5 = @"Fetch Registered bundleIDs";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDMapShareURLsToInstalledBundleIDsOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 withAppBundleIDs:(id)a4 daemonBundleIDs:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16 = objc_msgSend_shareURLs(self, v14, v15);
  objc_sync_enter(v16);
  v19 = objc_msgSend_shareURLs(self, v17, v18);
  objc_msgSend_removeObject_(v19, v20, (uint64_t)v10);

  objc_sync_exit(v16);
  v23 = objc_msgSend_bundleIDsFetchedBlock(self, v21, v22);

  if (v23)
  {
    v26 = objc_msgSend_callbackQueue(self, v24, v25);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4D457CC;
    block[3] = &unk_1E64F0198;
    block[4] = self;
    id v28 = v10;
    id v29 = v11;
    id v30 = v12;
    id v31 = v13;
    dispatch_async(v26, block);
  }
}

- (void)_fetchShareMetadata
{
  uint64_t v4 = objc_msgSend_container(self, a2, v2);
  v55 = objc_msgSend_processScopedClientProxy(v4, v5, v6);

  uint64_t v9 = objc_msgSend_container(self, v7, v8);
  v57 = objc_msgSend_logicalDeviceScopedClientProxy(v9, v10, v11);

  id v12 = objc_alloc(MEMORY[0x1E4F19ED8]);
  v56 = objc_msgSend_initWithContainerIdentifier_environment_(v12, v13, @"com.apple.cloudkit", 1);
  v14 = [CKDAppContainerTuple alloc];
  uint64_t v15 = [CKDApplicationID alloc];
  v17 = objc_msgSend_initWithApplicationBundleIdentifier_(v15, v16, @"com.apple.cloudd");
  v20 = objc_msgSend_container(self, v18, v19);
  v23 = objc_msgSend_personaID(v20, v21, v22);
  uint64_t v25 = objc_msgSend_initWithApplicationID_containerID_personaID_(v14, v24, (uint64_t)v17, v56, v23);

  id v28 = objc_msgSend_container(self, v26, v27);
  id v31 = objc_msgSend_entitlements(v28, v29, v30);
  v34 = objc_msgSend_container(self, v32, v33);
  v37 = objc_msgSend_options(v34, v35, v36);
  v40 = objc_msgSend_clientConnection(v55, v38, v39);
  v43 = objc_msgSend_sharedContainers(v40, v41, v42);
  v45 = objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v44, (uint64_t)v25, v55, v57, v31, v37, v43);

  v46 = objc_opt_new();
  objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(v46, v47, 1);
  objc_msgSend_setSkipShareDecryption_(v46, v48, 1);
  v51 = objc_msgSend_shareURLs(self, v49, v50);
  objc_msgSend_setShareURLsToFetch_(v46, v52, (uint64_t)v51);

  uint64_t v53 = objc_opt_class();
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = sub_1C4D45AB4;
  v58[3] = &unk_1E64F0210;
  v58[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v54, v53, v46, 0, v45, v58);
}

- (void)_fetchRegisteredBundleIDs
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_container(self, a2, v2);
  v66 = objc_msgSend_processScopedClientProxy(v4, v5, v6);

  uint64_t v9 = objc_msgSend_container(self, v7, v8);
  v65 = objc_msgSend_logicalDeviceScopedClientProxy(v9, v10, v11);

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v64 = self;
  objc_msgSend_shareURLs(self, v12, v13);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v72, v76, 16);
  if (v67)
  {
    uint64_t v63 = *(void *)v73;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v73 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v72 + 1) + 8 * v17);
        uint64_t v69 = v18;
        uint64_t v19 = objc_msgSend_shareMetadatasByURL(v64, v15, v16);
        v70 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v18);

        v21 = [CKDAppContainerTuple alloc];
        uint64_t v22 = [CKDApplicationID alloc];
        v24 = objc_msgSend_initWithApplicationBundleIdentifier_(v22, v23, @"com.apple.cloudd");
        uint64_t v27 = objc_msgSend_containerID(v70, v25, v26);
        uint64_t v30 = objc_msgSend_container(v64, v28, v29);
        uint64_t v33 = objc_msgSend_personaID(v30, v31, v32);
        uint64_t v68 = v17;
        v35 = objc_msgSend_initWithApplicationID_containerID_personaID_(v21, v34, (uint64_t)v24, v27, v33);

        v38 = objc_msgSend_container(v64, v36, v37);
        v41 = objc_msgSend_entitlements(v38, v39, v40);
        v44 = objc_msgSend_container(v64, v42, v43);
        v47 = objc_msgSend_options(v44, v45, v46);
        uint64_t v50 = objc_msgSend_clientConnection(v66, v48, v49);
        uint64_t v53 = objc_msgSend_sharedContainers(v50, v51, v52);
        v55 = objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v54, (uint64_t)v35, v66, v65, v41, v47, v53);

        uint64_t v56 = objc_opt_class();
        v57 = objc_opt_new();
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = sub_1C4D46270;
        v71[3] = &unk_1E64F0260;
        v71[4] = v69;
        v71[5] = v64;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(v64, v58, v56, v57, 0, v55, v71);

        v61 = objc_msgSend_stateTransitionGroup(v64, v59, v60);
        dispatch_group_enter(v61);

        uint64_t v17 = v68 + 1;
      }
      while (v67 != v68 + 1);
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v72, v76, 16);
    }
    while (v67);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setBundleIDsFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDMapShareURLsToInstalledBundleIDsOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (void)main
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = v3;
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    uint64_t v15 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v14, 1, 0, 0);
    uint64_t v18 = objc_msgSend_CKPropertiesStyleString(v15, v16, v17);
    v20 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 0, 1, 0);
    v23 = objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    int v24 = 138544130;
    uint64_t v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    id v31 = v23;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Starting mapping share urls to bundleIDs operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v24,
      0x2Au);
  }
  objc_super v6 = objc_msgSend_shareURLs(self, v4, v5);
  BOOL v9 = objc_msgSend_count(v6, v7, v8) == 0;

  objc_msgSend_makeStateTransition_(self, v10, v9);
}

- (id)bundleIDsFetchedBlock
{
  return self->_bundleIDsFetchedBlock;
}

- (void)setBundleIDsFetchedBlock:(id)a3
{
}

- (NSMutableArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(id)a3
{
}

- (NSMutableDictionary)shareMetadatasByURL
{
  return self->_shareMetadatasByURL;
}

- (void)setShareMetadatasByURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadatasByURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_bundleIDsFetchedBlock, 0);
}

@end