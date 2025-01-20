@interface CKDServerConfigurationManager
+ (id)sharedManager;
- (BOOL)shouldDropAllConfigurations;
- (BOOL)systemAvailabilityChanged:(unint64_t)a3;
- (CKDServerConfiguration)globalConfiguration;
- (CKDServerConfigurationManager)init;
- (NSMutableDictionary)containerSpecificInfoOperations;
- (NSMutableDictionary)containerSpecificInfos;
- (NSMutableSet)globalConfigurationOps;
- (NSOperationQueue)configurationQueue;
- (NSOperationQueue)containerSpecificInfoQueue;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)propertyQueue;
- (id)CKStatusReportArray;
- (id)lastKnownServerConfiguration;
- (int)iCloudEnvNotifToken;
- (void)_fetchContainerSpecificInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchGlobalConfigForOperation:(id)a3 completionHandler:(id)a4;
- (void)_reallyDropAllConfigurations;
- (void)_writeOutiCloudAppSiteAssociationData:(id)a3;
- (void)configurationForOperation:(id)a3 completionHandler:(id)a4;
- (void)containerServerInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)expireConfigurationForContainer:(id)a3;
- (void)expireGlobalConfiguration;
- (void)setContainerSpecificInfos:(id)a3;
- (void)setGlobalConfiguration:(id)a3;
- (void)setShouldDropAllConfigurations:(BOOL)a3;
- (void)wipeAllConfigurations;
@end

@implementation CKDServerConfigurationManager

- (BOOL)systemAvailabilityChanged:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 2) != 0 && objc_msgSend_shouldDropAllConfigurations(self, a2, a3)) {
    objc_msgSend__reallyDropAllConfigurations(self, v5, v6);
  }
  return (v3 & 2) == 0;
}

- (CKDServerConfigurationManager)init
{
  v38.receiver = self;
  v38.super_class = (Class)CKDServerConfigurationManager;
  v2 = [(CKDServerConfigurationManager *)&v38 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    configurationQueue = v2->_configurationQueue;
    v2->_configurationQueue = (NSOperationQueue *)v3;

    uint64_t v5 = objc_opt_new();
    globalConfigurationOps = v2->_globalConfigurationOps;
    v2->_globalConfigurationOps = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    containerSpecificInfoQueue = v2->_containerSpecificInfoQueue;
    v2->_containerSpecificInfoQueue = (NSOperationQueue *)v7;

    uint64_t v9 = objc_opt_new();
    containerSpecificInfos = v2->_containerSpecificInfos;
    v2->_containerSpecificInfos = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    containerSpecificInfoOperations = v2->_containerSpecificInfoOperations;
    v2->_containerSpecificInfoOperations = (NSMutableDictionary *)v11;

    v15 = (const char *)objc_msgSend_UTF8String(@"com.apple.cloudkit.CKDServerConfigurationManager.notificationQueue", v13, v14);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v17;

    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
    propertyQueue = v2->_propertyQueue;
    v2->_propertyQueue = (OS_dispatch_queue *)v25;

    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1C4F4B828;
    aBlock[3] = &unk_1E64F6A80;
    objc_copyWeak(&v36, &location);
    v27 = _Block_copy(aBlock);
    int out_token = -1;
    v30 = objc_msgSend_notificationQueue(v2, v28, v29);
    uint32_t v31 = notify_register_dispatch("com.apple.setmme.dnschanged", &out_token, v30, v27);

    int v32 = out_token;
    if (v31) {
      int v32 = -1;
    }
    v2->_iCloudEnvNotifToken = v32;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  int iCloudEnvNotifToken = self->_iCloudEnvNotifToken;
  if (iCloudEnvNotifToken != -1) {
    notify_cancel(iCloudEnvNotifToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDServerConfigurationManager;
  [(CKDServerConfigurationManager *)&v4 dealloc];
}

+ (id)sharedManager
{
  if (qword_1EBBCFFA0 != -1) {
    dispatch_once(&qword_1EBBCFFA0, &unk_1F20443B0);
  }
  v2 = (void *)qword_1EBBCFF98;
  return v2;
}

- (void)_fetchGlobalConfigForOperation:(id)a3 completionHandler:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v9 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Fetching Global Configuration for operation %p", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend_qualityOfService(v6, v10, v11);
  v12 = CKGetGlobalQueue();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v15 = objc_msgSend_globalConfigurationOps(self, v13, v14);
  id v18 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v49, v62, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v50;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v21, v17, (uint64_t)v6))
        {
          id v18 = v21;
          goto LABEL_15;
        }
      }
      id v18 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v49, v62, 16);
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v58 = 0x3032000000;
  v59 = sub_1C4F4BDB8;
  v60 = sub_1C4F4BDC8;
  id v22 = v18;
  id v61 = v22;
  if (!v22)
  {
    v23 = objc_opt_new();
    uint64_t v24 = objc_opt_class();
    v27 = objc_msgSend_configurationQueue(self, v25, v26);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = sub_1C4F4BDD0;
    v46[3] = &unk_1E64F6AA8;
    p_long long buf = &buf;
    v46[4] = self;
    id v47 = v12;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v6, v28, v24, v23, v27, v46);
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v29 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v39 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v53 = 134218240;
    uint64_t v54 = v39;
    __int16 v55 = 2048;
    id v56 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Waiting on global configuration operation %p for operation %p", v53, 0x16u);
  }
  int v32 = objc_msgSend_configurationFetchedGroup(*(void **)(*((void *)&buf + 1) + 40), v30, v31);
  v35 = objc_msgSend_propertyQueue(self, v33, v34);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1C4F4C470;
  v40[3] = &unk_1E64F6AD0;
  id v44 = v7;
  v45 = &buf;
  id v41 = v6;
  v42 = self;
  id v43 = v12;
  id v36 = v12;
  id v37 = v7;
  id v38 = v6;
  dispatch_group_notify(v32, v35, v40);

  _Block_object_dispose(&buf, 8);
}

- (void)_fetchContainerSpecificInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5
{
  SEL v41 = a2;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  objc_msgSend_qualityOfService(v7, v9, v10);
  CKGetGlobalQueue();
  dispatch_queue_t queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_container(v7, v11, v12);
  uint64_t v14 = v13;
  if (v13)
  {
    v15 = sub_1C4FC499C(v13);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v18 = objc_msgSend_containerSpecificInfoOperations(self, v16, v17);
    v20 = objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v15);

    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v63, v70, 16);
    if (v23)
    {
      uint64_t v24 = *(void *)v64;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v64 != v24) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if (objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v26, v22, (uint64_t)v7, v41))
          {
            id v27 = v26;
            goto LABEL_12;
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v63, v70, 16);
        if (v23) {
          continue;
        }
        break;
      }
    }
    id v27 = 0;
LABEL_12:

    uint64_t v57 = 0;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = sub_1C4F4BDB8;
    id v61 = sub_1C4F4BDC8;
    id v30 = v27;
    id v62 = v30;
    if (!v30)
    {
      uint64_t v31 = objc_opt_new();
      uint64_t v32 = objc_opt_class();
      v35 = objc_msgSend_containerSpecificInfoQueue(self, v33, v34);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = sub_1C4F4CB44;
      v50[3] = &unk_1E64F6B48;
      BOOL v56 = a4;
      uint64_t v54 = &v57;
      v50[4] = self;
      id v51 = v14;
      SEL v55 = v41;
      id v52 = v15;
      v53 = queue;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v7, v36, v32, v31, v35, v50);
    }
    if (v8)
    {
      id v37 = objc_msgSend_infoFetchedGroup((void *)v58[5], v28, v29);
      v40 = objc_msgSend_propertyQueue(self, v38, v39);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4F4D658;
      block[3] = &unk_1E64F6B98;
      block[4] = self;
      id v45 = v15;
      BOOL v49 = a4;
      v46 = queue;
      id v47 = v8;
      v48 = &v57;
      dispatch_group_notify(v37, v40, block);
    }
    _Block_object_dispose(&v57, 8);

    goto LABEL_19;
  }
  if (v8)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = sub_1C4F4CABC;
    v67[3] = &unk_1E64F0790;
    id v69 = v8;
    id v68 = v7;
    dispatch_async(queue, v67);

    v15 = v69;
LABEL_19:
  }
}

- (void)configurationForOperation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_qualityOfService(v6, v8, v9);
  uint64_t v10 = CKGetGlobalQueue();
  v13 = objc_msgSend_propertyQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F4D970;
  v17[3] = &unk_1E64F6BE8;
  id v18 = v6;
  uint64_t v19 = self;
  id v20 = v10;
  id v21 = v7;
  id v14 = v10;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(v13, v17);
}

- (void)containerServerInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_msgSend_qualityOfService(v8, v10, v11);
  uint64_t v12 = CKGetGlobalQueue();
  id v15 = objc_msgSend_container(v8, v13, v14);
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = sub_1C4FC499C(v15);
    id v20 = objc_msgSend_propertyQueue(self, v18, v19);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F4E188;
    block[3] = &unk_1E64F6C38;
    block[4] = self;
    id v24 = v17;
    id v25 = v16;
    id v26 = v8;
    BOOL v29 = a4;
    id v28 = v9;
    id v27 = v12;
    id v21 = v17;
    dispatch_async(v20, block);

LABEL_8:
    goto LABEL_9;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v22 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v34 = v8;
    _os_log_fault_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_FAULT, "Failed to get server info for container, operation unexpectedly missing container: %@ ", buf, 0xCu);
    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v9)
  {
LABEL_7:
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1C4F4E0E0;
    v30[3] = &unk_1E64F0E18;
    id v31 = v8;
    id v32 = v9;
    dispatch_async(v12, v30);

    id v21 = v31;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_reallyDropAllConfigurations
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Warn: Dropping all config bags and forcing a re-fetch of our config.", buf, 2u);
  }
  id v6 = objc_msgSend_propertyQueue(self, v4, v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F4E824;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (void)wipeAllConfigurations
{
  objc_msgSend_setShouldDropAllConfigurations_(self, a2, 1);
  objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v3, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerWatcher_(v6, v5, (uint64_t)self);
}

- (void)_writeOutiCloudAppSiteAssociationData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v37 = v3;
    id v7 = v3;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v38, v44, 16);
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v39;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
          id v15 = objc_msgSend_objectForKeyedSubscript_(v7, v10, v14);
          id v18 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v16, v17);
          id v20 = objc_msgSend_stringByTrimmingCharactersInSet_(v15, v19, (uint64_t)v18);

          id v21 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          id v24 = objc_msgSend_initWithBase64EncodedString_options_(v21, v22, (uint64_t)v20, 1);
          if (v24)
          {
            objc_msgSend_setObject_forKeyedSubscript_(v6, v23, (uint64_t)v24, v14);
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v25 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v43 = v14;
              _os_log_debug_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEBUG, "Could not get app site association data for hostname %@", buf, 0xCu);
            }
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v38, v44, 16);
      }
      while (v11);
    }

    if (objc_msgSend_count(v6, v26, v27)
      && (sub_1C4FC4754(),
          id v28 = objc_claimAutoreleasedReturnValue(),
          char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v6, v29, (uint64_t)v28),
          v28,
          (isEqualToDictionary & 1) == 0))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v3 = v37;
      id v32 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v43 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Registering valid app site association data with LS: %@", buf, 0xCu);
      }
      id v34 = (void *)MEMORY[0x1E4F9F400];
      uint64_t v35 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v33, @"com.apple.CloudKit.ShareBear");
      objc_msgSend_setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler_(v34, v36, (uint64_t)v35, v6, &unk_1F20443D0);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v3 = v37;
      id v31 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v43 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Found ineligible or unchanged app site association data, not registering with LS: %@", buf, 0xCu);
      }
    }
  }
}

- (void)setGlobalConfiguration:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_globalConfiguration, a3);
  id v7 = objc_msgSend_iCloudAppSiteAssociationData(v15, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_iCloudAppSiteAssociationData(v15, v11, v12);
    objc_msgSend__writeOutiCloudAppSiteAssociationData_(self, v14, (uint64_t)v13);
  }
}

- (void)expireGlobalConfiguration
{
  uint64_t v4 = objc_msgSend_propertyQueue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F4EF1C;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)expireConfigurationForContainer:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_propertyQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4F4EFDC;
  v9[3] = &unk_1E64F0948;
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (id)lastKnownServerConfiguration
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_1C4F4BDB8;
  uint64_t v12 = sub_1C4F4BDC8;
  id v13 = 0;
  id v4 = objc_msgSend_propertyQueue(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4F4F310;
  v7[3] = &unk_1E64F1BC0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)CKStatusReportArray
{
  id v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_propertyQueue(self, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4F4F42C;
  v11[3] = &unk_1E64F0948;
  v11[4] = self;
  id v7 = v3;
  id v12 = v7;
  dispatch_sync(v6, v11);

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

- (NSOperationQueue)configurationQueue
{
  return self->_configurationQueue;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (CKDServerConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (NSMutableSet)globalConfigurationOps
{
  return self->_globalConfigurationOps;
}

- (NSOperationQueue)containerSpecificInfoQueue
{
  return self->_containerSpecificInfoQueue;
}

- (NSMutableDictionary)containerSpecificInfos
{
  return self->_containerSpecificInfos;
}

- (void)setContainerSpecificInfos:(id)a3
{
}

- (NSMutableDictionary)containerSpecificInfoOperations
{
  return self->_containerSpecificInfoOperations;
}

- (OS_dispatch_queue)propertyQueue
{
  return self->_propertyQueue;
}

- (int)iCloudEnvNotifToken
{
  return self->_iCloudEnvNotifToken;
}

- (BOOL)shouldDropAllConfigurations
{
  return self->_shouldDropAllConfigurations;
}

- (void)setShouldDropAllConfigurations:(BOOL)a3
{
  self->_shouldDropAllConfigurations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_containerSpecificInfoOperations, 0);
  objc_storeStrong((id *)&self->_containerSpecificInfos, 0);
  objc_storeStrong((id *)&self->_containerSpecificInfoQueue, 0);
  objc_storeStrong((id *)&self->_globalConfigurationOps, 0);
  objc_storeStrong((id *)&self->_globalConfiguration, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_configurationQueue, 0);
}

@end