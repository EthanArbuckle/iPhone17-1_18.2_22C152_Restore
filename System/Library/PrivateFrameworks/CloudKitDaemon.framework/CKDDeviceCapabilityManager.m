@interface CKDDeviceCapabilityManager
+ (id)sharedManager;
- (BOOL)isObsoleteCapabilities:(id)a3 operation:(id)a4;
- (BOOL)isObsoleteUsage:(id)a3 operation:(id)a4;
- (CKDDeviceCapabilityManager)init;
- (NSMutableDictionary)capabilitiesAndUsagesCachePerContainer;
- (NSMutableDictionary)updateOperationsPerContainer;
- (OS_dispatch_queue)queue;
- (double)failureBackoffDelay;
- (double)lastTrackedFailureTime;
- (id)_deviceAndCapabilityCacheForContainer:(id)a3;
- (id)_lastSentCapabilityAndUsageForContainer:(id)a3;
- (id)_prepareShareUsageSendForContainer:(id)a3 maxCount:(unint64_t)a4 triggerOperation:(id)a5;
- (id)_prepareZoneUsageSendForContainer:(id)a3 maxCount:(unint64_t)a4 triggerOperation:(id)a5;
- (id)_recordWithUnknownShareUsagesInContainer:(id)a3 maxCount:(unint64_t)a4;
- (id)_shareUsageForShareID:(id)a3 inContainer:(id)a4;
- (id)_shareUsagesInContainer:(id)a3 maxCount:(unint64_t)a4;
- (id)_zoneUsageForZoneID:(id)a3 inContainer:(id)a4;
- (id)_zoneUsagesInContainer:(id)a3 maxCount:(unint64_t)a4;
- (id)initInternal;
- (id)lookupStringForContainer:(id)a3;
- (void)_deleteLastSentCapabilitiesAndUsageDataForContainer:(id)a3;
- (void)_deleteRecordWithUnknownShareUsage:(id)a3 inContainer:(id)a4;
- (void)_deleteShareUsageForShareID:(id)a3 inContainer:(id)a4;
- (void)_deleteZoneUsageForZoneID:(id)a3 inContainer:(id)a4;
- (void)_handleDeviceCapabilitiesResultForContainer:(id)a3 savedCapabilities:(id)a4 skipErrorMitigation:(BOOL)a5 withError:(id)a6;
- (void)_handleOperationCompletedForContainerLookupName:(id)a3 containerID:(id)a4;
- (void)_handleShareUsageResultForContainer:(id)a3 shareID:(id)a4 date:(id)a5 skipErrorMitigation:(BOOL)a6 withError:(id)a7;
- (void)_handleZoneUsageResultForContainer:(id)a3 zoneID:(id)a4 date:(id)a5 skipErrorMitigation:(BOOL)a6 withError:(id)a7;
- (void)_setRecordWithUnknownShareUsage:(id)a3 forRecordID:(id)a4 inContainer:(id)a5;
- (void)_setShareUsage:(id)a3 forShareID:(id)a4 inContainer:(id)a5;
- (void)_setZoneUsage:(id)a3 forZoneID:(id)a4 inContainer:(id)a5;
- (void)_updateLastSentCapabilities:(id)a3 capabilitySetSavedDate:(id)a4 forContainer:(id)a5;
- (void)_updateUsageSavedDate:(id)a3 forContainer:(id)a4;
- (void)dropCacheConnectionForContainer:(id)a3;
- (void)recordShareUsageForDeletedRecordID:(id)a3 at:(id)a4 container:(id)a5 operation:(id)a6;
- (void)recordShareUsageForRecordID:(id)a3 at:(id)a4 container:(id)a5 operation:(id)a6;
- (void)recordShareUsageForRequest:(id)a3 container:(id)a4;
- (void)recordShareUsageForShareID:(id)a3 at:(id)a4 container:(id)a5 operation:(id)a6;
- (void)recordShareUsageForShareID:(id)a3 container:(id)a4 date:(id)a5;
- (void)recordWithUnknownShareUsageForRecordID:(id)a3 container:(id)a4 date:(id)a5;
- (void)recordZoneUsageForOperation:(id)a3 container:(id)a4;
- (void)sendToServerForContainer:(id)a3 operation:(id)a4;
- (void)setCapabilitiesAndUsagesCachePerContainer:(id)a3;
- (void)setFailureBackoffDelay:(double)a3;
- (void)setLastTrackedFailureTime:(double)a3;
- (void)setQueue:(id)a3;
- (void)setUpdateOperationsPerContainer:(id)a3;
@end

@implementation CKDDeviceCapabilityManager

+ (id)sharedManager
{
  if (qword_1EBBCFF30 != -1) {
    dispatch_once(&qword_1EBBCFF30, &unk_1F2043F10);
  }
  v2 = (void *)qword_1EBBCFF28;
  return v2;
}

- (CKDDeviceCapabilityManager)init
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A018]);
  id v4 = (id)objc_msgSend_initWithCode_format_(v2, v3, 12, @"Use +[CKDDeviceCapabilityManager sharedManager] instead");
  objc_exception_throw(v4);
}

- (id)initInternal
{
  v12.receiver = self;
  v12.super_class = (Class)CKDDeviceCapabilityManager;
  id v2 = [(CKDDeviceCapabilityManager *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cloudkit.deviceCapabilityManagerQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    updateOperationsPerContainer = v2->_updateOperationsPerContainer;
    v2->_updateOperationsPerContainer = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    capabilitiesAndUsagesCachePerContainer = v2->_capabilitiesAndUsagesCachePerContainer;
    v2->_capabilitiesAndUsagesCachePerContainer = (NSMutableDictionary *)v9;

    v2->_lastTrackedFailureTime = 0.0;
    v2->_failureBackoffDelay = 0.0;
  }
  return v2;
}

- (id)lookupStringForContainer:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  dispatch_queue_t v5 = sub_1C4FC499C(v4);
  v8 = objc_msgSend_deviceID(v4, v6, v7);

  v10 = objc_msgSend_stringWithFormat_(v3, v9, @"%@-%@", v5, v8);

  return v10;
}

- (void)dropCacheConnectionForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend_entitlements(v4, v5, v6);
    int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v8, v9, v10);

    if (hasTemporaryDeviceCapabilitiesEntitlement)
    {
      v13 = objc_msgSend_lookupStringForContainer_(self, v12, (uint64_t)v7);
      v16 = objc_msgSend_containerID(v7, v14, v15);
      v19 = objc_msgSend_queue(self, v17, v18);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4EF319C;
      block[3] = &unk_1E64F0120;
      block[4] = self;
      id v23 = v13;
      id v24 = v16;
      id v20 = v16;
      id v21 = v13;
      dispatch_async(v19, block);
    }
  }
}

- (id)_deviceAndCapabilityCacheForContainer:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_queue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  uint64_t v9 = objc_msgSend_lookupStringForContainer_(self, v8, (uint64_t)v4);
  objc_super v12 = objc_msgSend_capabilitiesAndUsagesCachePerContainer(self, v10, v11);
  v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);

  if (!v14)
  {
    uint64_t v15 = [CKDDeviceCapabilityUsageSQLCache alloc];
    uint64_t v17 = objc_msgSend_initWithContainer_(v15, v16, (uint64_t)v4);
    uint64_t v18 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v19 = *MEMORY[0x1E4F1A550];
    if (v17)
    {
      v14 = (void *)v17;
      if (v19 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v18);
      }
      id v20 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v27 = v20;
        v30 = objc_msgSend_containerID(v4, v28, v29);
        int v35 = 138412290;
        v36 = v30;
        _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Initialized device capability cache for container with ID: %@", (uint8_t *)&v35, 0xCu);
      }
      id v23 = objc_msgSend_capabilitiesAndUsagesCachePerContainer(self, v21, v22);
      objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v14, v9);
    }
    else
    {
      if (v19 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v18);
      }
      v25 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        v31 = v25;
        v34 = objc_msgSend_containerID(v4, v32, v33);
        int v35 = 138412290;
        v36 = v34;
        _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "Failed to initialize the device capability cache for container with ID: %@", (uint8_t *)&v35, 0xCu);
      }
      v14 = 0;
    }
  }

  return v14;
}

- (id)_zoneUsagesInContainer:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11)
  {
    v13 = objc_msgSend_zoneUsagesWithMaxCount_(v11, v12, a4);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_setZoneUsage:(id)a3 forZoneID:(id)a4 inContainer:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v12 = objc_msgSend_queue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  v14 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v13, (uint64_t)v9);

  if (v14) {
    objc_msgSend_setZoneUsage_forZoneID_(v14, v15, (uint64_t)v16, v8);
  }
}

- (id)_zoneUsageForZoneID:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_queue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  objc_super v12 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v11, (uint64_t)v7);

  if (v12)
  {
    v14 = objc_msgSend_zoneUsageForZoneID_(v12, v13, (uint64_t)v6);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_deleteZoneUsageForZoneID:(id)a3 inContainer:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11) {
    objc_msgSend_deleteZoneUsageForZoneID_(v11, v12, (uint64_t)v13);
  }
}

- (id)_shareUsagesInContainer:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11)
  {
    id v13 = objc_msgSend_shareUsagesWithMaxCount_(v11, v12, a4);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)_setShareUsage:(id)a3 forShareID:(id)a4 inContainer:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v12 = objc_msgSend_queue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  v14 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v13, (uint64_t)v9);

  if (v14) {
    objc_msgSend_setShareUsage_forShareID_(v14, v15, (uint64_t)v16, v8);
  }
}

- (id)_shareUsageForShareID:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_queue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  objc_super v12 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v11, (uint64_t)v7);

  if (v12)
  {
    v14 = objc_msgSend_shareUsageForShareID_(v12, v13, (uint64_t)v6);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_deleteShareUsageForShareID:(id)a3 inContainer:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11) {
    objc_msgSend_deleteShareUsageForShareID_(v11, v12, (uint64_t)v13);
  }
}

- (void)_setRecordWithUnknownShareUsage:(id)a3 forRecordID:(id)a4 inContainer:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v12 = objc_msgSend_queue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  v14 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v13, (uint64_t)v9);

  if (v14) {
    objc_msgSend_setRecordWithUnknownShareUsage_forRecordID_(v14, v15, (uint64_t)v16, v8);
  }
}

- (id)_recordWithUnknownShareUsagesInContainer:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  id v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11)
  {
    id v13 = objc_msgSend_recordWithUnknownShareUsagesWithMaxCount_(v11, v12, a4);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)_deleteRecordWithUnknownShareUsage:(id)a3 inContainer:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11) {
    objc_msgSend_deleteRecordWithUnknownShareUsageForRecordID_(v11, v12, (uint64_t)v13);
  }
}

- (id)_lastSentCapabilityAndUsageForContainer:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_queue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  id v9 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v8, (uint64_t)v4);

  if (v9)
  {
    objc_super v12 = objc_msgSend_lastSentCapabilitiesAndUsage(v9, v10, v11);
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (void)_updateLastSentCapabilities:(id)a3 capabilitySetSavedDate:(id)a4 forContainer:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v12 = objc_msgSend_queue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  v14 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v13, (uint64_t)v9);

  if (v14) {
    objc_msgSend_updateCapabilitySet_capabilitySetSavedDate_(v14, v15, (uint64_t)v16, v8);
  }
}

- (void)_updateUsageSavedDate:(id)a3 forContainer:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_queue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v11 = objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v10, (uint64_t)v6);

  if (v11) {
    objc_msgSend_updateUsageSavedDate_(v11, v12, (uint64_t)v13);
  }
}

- (void)_deleteLastSentCapabilitiesAndUsageDataForContainer:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_queue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  objc_msgSend__deviceAndCapabilityCacheForContainer_(self, v8, (uint64_t)v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = v12;
  if (v12)
  {
    objc_msgSend_deleteLastSentCapabilitiesAndUsageEntry(v12, v9, v10);
    uint64_t v11 = v12;
  }
}

- (void)sendToServerForContainer:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  uint64_t v11 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (!*MEMORY[0x1E4F1A4E0])
  {
    int v17 = 0;
LABEL_9:
    char v24 = 0;
    goto LABEL_10;
  }
  id v12 = objc_msgSend_unitTestOverrides(v7, v8, v9);
  v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"UpdateCapabilitiesAsChildOperation");
  int v17 = objc_msgSend_BOOLValue(v14, v15, v16);

  if (*v11) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18) {
    goto LABEL_21;
  }
  if (!*v11) {
    goto LABEL_9;
  }
  uint64_t v19 = objc_msgSend_unitTestOverrides(v10, v8, v9);
  id v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"doErrorRateMitigationInUnitTests");
  char v24 = objc_msgSend_BOOLValue(v21, v22, v23) ^ 1;

LABEL_10:
  v25 = objc_msgSend_options(v6, v8, v9);
  v28 = objc_msgSend_supportedDeviceCapabilities(v25, v26, v27);

  v30 = objc_msgSend_lookupStringForContainer_(self, v29, (uint64_t)v6);
  uint64_t v33 = objc_msgSend_containerID(v6, v31, v32);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4EF4210;
  aBlock[3] = &unk_1E64F5808;
  objc_copyWeak(&v54, &location);
  aBlock[4] = self;
  char v55 = v24;
  id v34 = v30;
  id v49 = v34;
  id v50 = v6;
  id v51 = v10;
  id v35 = v28;
  id v52 = v35;
  id v36 = v33;
  id v53 = v36;
  char v56 = v17;
  v39 = _Block_copy(aBlock);
  if (v17)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v40 = (os_log_t *)MEMORY[0x1E4F1A500];
    v41 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v47 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_DEBUG, "Waiting for child operation to update device capabilities to be created.", v47, 2u);
    }
    v44 = objc_msgSend_queue(self, v42, v43);
    dispatch_sync(v44, v39);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v45 = *v40;
    if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v47 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_DEBUG, "Finished waiting for child operation to update device capabilities be created.", v47, 2u);
    }
  }
  else
  {
    v46 = objc_msgSend_queue(self, v37, v38);
    dispatch_async(v46, v39);
  }
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);

LABEL_21:
}

- (BOOL)isObsoleteCapabilities:(id)a3 operation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = v6;
  if (!v5
    || *MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_unitTestOverrides(v6, v7, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v10, v11, @"DeviceCapabilitiesObsolete"),
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_msgSend_BOOLValue(v12, v13, v14),
        v12,
        v10,
        (v15 & 1) != 0))
  {
    BOOL v16 = 1;
  }
  else
  {
    int v17 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v7, v8);
    objc_msgSend_timeIntervalSinceDate_(v17, v18, (uint64_t)v5);
    BOOL v16 = v19 > 7776000.0;
  }
  return v16;
}

- (BOOL)isObsoleteUsage:(id)a3 operation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = v6;
  if (!v5
    || *MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_unitTestOverrides(v6, v7, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v10, v11, @"ZoneAndShareUsageObsolete"),
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_msgSend_BOOLValue(v12, v13, v14),
        v12,
        v10,
        (v15 & 1) != 0))
  {
    BOOL v16 = 1;
  }
  else
  {
    int v17 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v7, v8);
    objc_msgSend_timeIntervalSinceDate_(v17, v18, (uint64_t)v5);
    BOOL v16 = v19 > 86400.0;
  }
  return v16;
}

- (id)_prepareZoneUsageSendForContainer:(id)a3 maxCount:(unint64_t)a4 triggerOperation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_queue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = sub_1C4EF5238;
  v44 = sub_1C4EF5248;
  id v45 = 0;
  if ((!*MEMORY[0x1E4F1A4E0]
     || (objc_msgSend_unitTestOverrides(v9, v13, v14),
         char v15 = objc_claimAutoreleasedReturnValue(),
         objc_msgSend_objectForKeyedSubscript_(v15, v16, @"UpdateCapabilitiesAsChildOperation"),
         int v17 = objc_claimAutoreleasedReturnValue(),
         char v20 = objc_msgSend_BOOLValue(v17, v18, v19),
         v17,
         v15,
         (v20 & 1) != 0))
    && a4)
  {
    id v21 = objc_msgSend__zoneUsagesInContainer_maxCount_(self, v13, (uint64_t)v8, a4);
    char v24 = objc_msgSend_mutableCopy(v21, v22, v23);

    uint64_t v27 = objc_msgSend_allKeys(v24, v25, v26);
    uint64_t v30 = objc_msgSend_count(v27, v28, v29);

    if (v30)
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      v39[3] = 0;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_1C4EF5710;
      v34[3] = &unk_1E64F5830;
      v34[4] = self;
      id v35 = v8;
      id v36 = &v40;
      uint64_t v37 = v39;
      unint64_t v38 = a4;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v24, v31, (uint64_t)v34);
      id v32 = (id)v41[5];

      _Block_object_dispose(v39, 8);
    }
    else
    {
      id v32 = (id)v41[5];
    }
  }
  else
  {
    id v32 = (id)v41[5];
  }
  _Block_object_dispose(&v40, 8);

  return v32;
}

- (id)_prepareShareUsageSendForContainer:(id)a3 maxCount:(unint64_t)a4 triggerOperation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_queue(self, v10, v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  char v56 = sub_1C4EF5238;
  v57 = sub_1C4EF5248;
  id v58 = 0;
  if ((!*MEMORY[0x1E4F1A4E0]
     || (objc_msgSend_unitTestOverrides(v9, v13, v14),
         char v15 = objc_claimAutoreleasedReturnValue(),
         objc_msgSend_objectForKeyedSubscript_(v15, v16, @"UpdateCapabilitiesAsChildOperation"),
         int v17 = objc_claimAutoreleasedReturnValue(),
         char v20 = objc_msgSend_BOOLValue(v17, v18, v19),
         v17,
         v15,
         (v20 & 1) != 0))
    && a4)
  {
    uint64_t v49 = 0;
    id v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1C4EF5CA8;
    aBlock[3] = &unk_1E64F5858;
    v46 = &v53;
    id v21 = v8;
    id v45 = v21;
    v47 = &v49;
    unint64_t v48 = a4;
    uint64_t v22 = _Block_copy(aBlock);
    char v24 = objc_msgSend__shareUsagesInContainer_maxCount_(self, v23, (uint64_t)v21, a4);
    uint64_t v27 = v24;
    if (v24 && objc_msgSend_count(v24, v25, v26))
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1C4EF5E74;
      v41[3] = &unk_1E64F5880;
      id v43 = v22;
      v41[4] = self;
      id v42 = v21;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v27, v28, (uint64_t)v41);
    }
    if (v50[3] < a4)
    {
      uint64_t v30 = objc_msgSend__recordWithUnknownShareUsagesInContainer_maxCount_(self, v25, (uint64_t)v21, a4);
      if (v30)
      {
        v31 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v29, (uint64_t)v21);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = sub_1C4EF5F30;
        v36[3] = &unk_1E64F58A8;
        id v32 = v31;
        id v37 = v32;
        id v40 = v22;
        unint64_t v38 = self;
        id v39 = v21;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v30, v33, (uint64_t)v36);
      }
    }
    id v34 = (id)v54[5];

    _Block_object_dispose(&v49, 8);
  }
  else
  {
    id v34 = (id)v54[5];
  }
  _Block_object_dispose(&v53, 8);

  return v34;
}

- (void)_handleOperationCompletedForContainerLookupName:(id)a3 containerID:(id)a4
{
  id v5 = a3;
  id v8 = objc_msgSend_queue(self, v6, v7);
  dispatch_assert_queue_V2(v8);

  objc_msgSend_updateOperationsPerContainer(self, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v12, v11, (uint64_t)v5);
}

- (void)_handleZoneUsageResultForContainer:(id)a3 zoneID:(id)a4 date:(id)a5 skipErrorMitigation:(BOOL)a6 withError:(id)a7
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  int v17 = objc_msgSend_queue(self, v15, v16);
  dispatch_assert_queue_V2(v17);

  uint64_t v19 = objc_msgSend__zoneUsageForZoneID_inContainer_(self, v18, (uint64_t)v12, v11);
  id v21 = v19;
  if (v19)
  {
    objc_msgSend_completeSendingForDate_withSuccess_(v19, v20, (uint64_t)v13, v14 == 0);
    objc_msgSend__setZoneUsage_forZoneID_inContainer_(self, v22, (uint64_t)v21, v12, v11);
    uint64_t v23 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    char v24 = (void *)*MEMORY[0x1E4F1A548];
    v25 = (void *)MEMORY[0x1E4F1A550];
    if (v14)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v24);
      }
      uint64_t v26 = (os_log_t *)MEMORY[0x1E4F1A500];
      uint64_t v27 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        v46 = v27;
        uint64_t v53 = objc_msgSend_containerID(v11, v47, v48);
        *(_DWORD *)buf = 138413058;
        id v55 = v14;
        __int16 v56 = 2114;
        uint64_t v57 = (uint64_t)v53;
        __int16 v58 = 2112;
        id v59 = v13;
        __int16 v60 = 2114;
        id v61 = v12;
        _os_log_error_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_ERROR, "Failed to send zone usage to the server: %@ \n\tcontainerID: %{public}@ \n\tdate: %@ \n\tzoneID: %{public}@", buf, 0x2Au);
      }
      if ((unint64_t)objc_msgSend_failureCount(v21, v28, v29) >= 4)
      {
        if (*v25 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v23);
        }
        os_log_t v30 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_INFO))
        {
          id v32 = v30;
          uint64_t v35 = objc_msgSend_failureCount(v21, v33, v34);
          *(_DWORD *)buf = 138412546;
          id v55 = v12;
          __int16 v56 = 2048;
          uint64_t v57 = v35;
          _os_log_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_INFO, "Sending usage for zone %@ has failed %zu times, will not resend.", buf, 0x16u);
        }
        objc_msgSend__deleteZoneUsageForZoneID_inContainer_(self, v31, (uint64_t)v12, v11);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v24);
      }
      v41 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v49 = v41;
        uint64_t v52 = objc_msgSend_containerID(v11, v50, v51);
        *(_DWORD *)buf = 138543874;
        id v55 = v52;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)v13;
        __int16 v58 = 2114;
        id v59 = v12;
        _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Sent zone usage to the server. \n\tcontainerID: %{public}@ \n\tdate: %@ \n\tzoneID: %{public}@", buf, 0x20u);
      }
      v44 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v42, v43);
      objc_msgSend__updateUsageSavedDate_forContainer_(self, v45, (uint64_t)v44, v11);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v36 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v37 = v36;
      id v40 = objc_msgSend_containerID(v11, v38, v39);
      *(_DWORD *)buf = 138412546;
      id v55 = v40;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v12;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "_handleZoneUsageResultForContainer called with unrecognized containerID %@ and zoneID %@", buf, 0x16u);
    }
  }
}

- (void)_handleShareUsageResultForContainer:(id)a3 shareID:(id)a4 date:(id)a5 skipErrorMitigation:(BOOL)a6 withError:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v16 = objc_msgSend_queue(self, v14, v15);
  dispatch_assert_queue_V2(v16);

  BOOL v18 = objc_msgSend__shareUsageForShareID_inContainer_(self, v17, (uint64_t)v12, v11);
  char v20 = v18;
  if (v18)
  {
    objc_msgSend_completeSendingForDate_withSuccess_(v18, v19, (uint64_t)v13, a7 == 0);
    objc_msgSend__setShareUsage_forShareID_inContainer_(self, v21, (uint64_t)v20, v12, v11);
    uint64_t v22 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    uint64_t v23 = (void *)*MEMORY[0x1E4F1A548];
    char v24 = (void *)MEMORY[0x1E4F1A550];
    if (a7)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      v25 = (os_log_t *)MEMORY[0x1E4F1A500];
      uint64_t v26 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        id v37 = v26;
        id v40 = objc_msgSend_containerID(v11, v38, v39);
        int v49 = 138543874;
        id v50 = v40;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v13;
        __int16 v53 = 2114;
        id v54 = v12;
        _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Failed to send share usage to the server. \n\tcontainerID: %{public}@ \n\tdate: %@ \n\tshareID: %{public}@", (uint8_t *)&v49, 0x20u);
      }
      if ((unint64_t)objc_msgSend_failureCount(v20, v27, v28) >= 4)
      {
        if (*v24 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v22);
        }
        os_log_t v29 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEBUG))
        {
          id v45 = v29;
          uint64_t v48 = objc_msgSend_failureCount(v20, v46, v47);
          int v49 = 138412546;
          id v50 = v12;
          __int16 v51 = 2048;
          uint64_t v52 = v48;
          _os_log_debug_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_DEBUG, "Sending usage for share %@ has failed %zu times, will not resend.", (uint8_t *)&v49, 0x16u);
        }
        objc_msgSend__deleteShareUsageForShareID_inContainer_(self, v30, (uint64_t)v12, v11);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      id v32 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v41 = v32;
        v44 = objc_msgSend_containerID(v11, v42, v43);
        int v49 = 138543874;
        id v50 = v44;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v13;
        __int16 v53 = 2114;
        id v54 = v12;
        _os_log_debug_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_DEBUG, "Sent share usage to the server. \n\tcontainerID: %{public}@ \n\tdate: %@ \n\tshareID: %{public}@", (uint8_t *)&v49, 0x20u);
      }
      uint64_t v35 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v33, v34);
      objc_msgSend__updateUsageSavedDate_forContainer_(self, v36, (uint64_t)v35, v11);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v49 = 138412290;
      id v50 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "_handleShareUsageResultForContainer called with unrecognized share ID: %@", (uint8_t *)&v49, 0xCu);
    }
  }
}

- (void)_handleDeviceCapabilitiesResultForContainer:(id)a3 savedCapabilities:(id)a4 skipErrorMitigation:(BOOL)a5 withError:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_queue(self, v13, v14);
  dispatch_assert_queue_V2(v15);

  uint64_t v16 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  int v17 = (void *)*MEMORY[0x1E4F1A548];
  BOOL v18 = (void *)MEMORY[0x1E4F1A550];
  if (!v12)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v17);
    }
    int v49 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v52 = v49;
      uint64_t v55 = objc_msgSend_containerID(v10, v53, v54);
      int v61 = 138543618;
      uint64_t v62 = v55;
      __int16 v63 = 2114;
      id v64 = v11;
      _os_log_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_INFO, "Successfully saved updated device capabilties to the server for containerID %{public}@: %{public}@", (uint8_t *)&v61, 0x16u);
    }
    objc_msgSend_setLastTrackedFailureTime_(self, v50, v51, 0.0);
    objc_msgSend_setFailureBackoffDelay_(self, v56, v57, 0.0);
    uint64_t v47 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v58, v59);
    objc_msgSend__updateLastSentCapabilities_capabilitySetSavedDate_forContainer_(self, v60, (uint64_t)v11, v47, v10);
    goto LABEL_20;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v17);
  }
  uint64_t v19 = (os_log_t *)MEMORY[0x1E4F1A500];
  char v20 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = v20;
    uint64_t v26 = objc_msgSend_containerID(v10, v24, v25);
    int v61 = 138543618;
    uint64_t v62 = v26;
    __int16 v63 = 2112;
    id v64 = v12;
    _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Failed to save device capabilities and/or share/zone usage to the server for container ID %{public}@, error: %@", (uint8_t *)&v61, 0x16u);
  }
  if (!a5)
  {
    uint64_t v27 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v21, v22);
    objc_msgSend_timeIntervalSinceReferenceDate(v27, v28, v29);
    objc_msgSend_setLastTrackedFailureTime_(self, v30, v31);

    objc_msgSend_failureBackoffDelay(self, v32, v33);
    double v37 = v36;
    double v38 = 1.0;
    if (v37 != 0.0)
    {
      objc_msgSend_failureBackoffDelay(self, v34, v35, 1.0);
      double v38 = fmin(v39 + v39, 14400.0);
    }
    objc_msgSend_setFailureBackoffDelay_(self, v34, v35, v38);
    CKRetryAfterSecondsForError();
    double v41 = v40;
    objc_msgSend_failureBackoffDelay(self, v42, v43);
    if (v46 < v41) {
      objc_msgSend_setFailureBackoffDelay_(self, v44, v45, v41);
    }
    objc_msgSend_failureBackoffDelay(self, v44, v45);
    uint64_t v47 = CKDescriptionForTimeInterval();
    if (*v18 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v16);
    }
    uint64_t v48 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
    {
      int v61 = 138543362;
      uint64_t v62 = v47;
      _os_log_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_INFO, "Next earliest attempt at sending device capabilities or share/zone usage to the server will be in %{public}@.", (uint8_t *)&v61, 0xCu);
    }
LABEL_20:
  }
}

- (void)recordZoneUsageForOperation:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_entitlements(v7, v8, v9);
  int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v10, v11, v12);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    uint64_t v16 = objc_msgSend_options(v7, v14, v15);
    char v19 = objc_msgSend_bypassPCSEncryption(v16, v17, v18);

    if ((v19 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_databaseScope(v6, v20, v21) == 2)
    {
      if (!*MEMORY[0x1E4F1A4E0]
        || (objc_msgSend_unitTestOverrides(v6, v22, v23),
            char v24 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_objectForKeyedSubscript_(v24, v25, @"UpdateCapabilitiesAsChildOperation"),
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            int v29 = objc_msgSend_BOOLValue(v26, v27, v28),
            v26,
            v24,
            v29))
      {
        id v32 = objc_msgSend_zoneIDsUsed(v6, v22, v23);
        if (v32)
        {
          uint64_t v33 = objc_msgSend_queue(self, v30, v31);
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          double v39 = sub_1C4EF6D60;
          double v40 = &unk_1E64F0DF0;
          id v34 = v6;
          id v41 = v34;
          id v42 = v32;
          uint64_t v43 = self;
          id v35 = v7;
          id v44 = v35;
          dispatch_sync(v33, &v37);

          objc_msgSend_sendToServerForContainer_operation_(self, v36, (uint64_t)v35, v34, v37, v38, v39, v40);
        }
      }
    }
  }
}

- (void)recordShareUsageForRequest:(id)a3 container:(id)a4
{
  v152[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_entitlements(v6, v7, v8);
  int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v9, v10, v11);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    uint64_t v15 = objc_msgSend_options(v6, v13, v14);
    char v18 = objc_msgSend_bypassPCSEncryption(v15, v16, v17);

    if ((v18 & 1) == 0)
    {
      v152[0] = objc_opt_class();
      v152[1] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v152, 2);
      long long v143 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v143, v151, 16);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v144;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v144 != v24) {
              objc_enumerationMutation(v20);
            }
            if (objc_opt_isKindOfClass())
            {
              int v29 = v20;
              goto LABEL_19;
            }
          }
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v26, (uint64_t)&v143, v151, 16);
          if (v23) {
            continue;
          }
          break;
        }
      }

      int v29 = objc_msgSend_operation(v5, v27, v28);
      if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend_databaseScope(v29, v30, v31) != 3) {
        goto LABEL_19;
      }
      v118 = v29;
      id v34 = (unsigned char *)MEMORY[0x1E4F1A4E0];
      if (*MEMORY[0x1E4F1A4E0])
      {
        id v35 = objc_msgSend_unitTestOverrides(v118, v32, v33);
        uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v35, v36, @"UpdateCapabilitiesAsChildOperation");
        int v40 = objc_msgSend_BOOLValue(v37, v38, v39);

        if (!v40)
        {
          int v29 = v118;
LABEL_19:

          goto LABEL_20;
        }
      }
      id v116 = v20;
      id v41 = v6;
      v125 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v32, v33);
      if (*v34)
      {
        id v44 = objc_msgSend_unitTestOverrides(v118, v42, v43);
        double v46 = objc_msgSend_objectForKeyedSubscript_(v44, v45, @"InvalidUsageTimestamp");
        int v49 = objc_msgSend_BOOLValue(v46, v47, v48);

        if (v49)
        {
          uint64_t v51 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v52 = v125;
          objc_msgSend_timeIntervalSince1970(v125, v42, v50);
          uint64_t v56 = objc_msgSend_dateWithTimeIntervalSince1970_(v51, v54, v55, v53 + -2764800.0);
          int v29 = v118;
LABEL_25:

          v125 = (void *)v56;
          goto LABEL_27;
        }
        if (*v34)
        {
          int v29 = v118;
          uint64_t v57 = objc_msgSend_unitTestOverrides(v118, v42, v50);
          uint64_t v59 = objc_msgSend_objectForKey_(v57, v58, @"ZoneAndShareUsageDate");

          if (!v59) {
            goto LABEL_27;
          }
          uint64_t v52 = objc_msgSend_unitTestOverrides(v118, v42, v60);
          uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v52, v61, @"ZoneAndShareUsageDate");

          goto LABEL_25;
        }
      }
      int v29 = v118;
LABEL_27:
      v124 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v42, (uint64_t)v6);
      id v64 = objc_msgSend_zoneIDsUsed(v29, v62, v63);
      if (!v64)
      {
LABEL_75:

        id v20 = v116;
        goto LABEL_19;
      }
      v117 = v5;
      v122 = objc_opt_new();
      long long v139 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      v115 = v64;
      id v65 = v64;
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v139, v150, 16);
      if (v67)
      {
        uint64_t v69 = v67;
        char v70 = 0;
        uint64_t v71 = *(void *)v140;
        do
        {
          for (uint64_t j = 0; j != v69; ++j)
          {
            if (*(void *)v140 != v71) {
              objc_enumerationMutation(v65);
            }
            uint64_t v73 = *(void *)(*((void *)&v139 + 1) + 8 * j);
            v75 = objc_msgSend_zoneShareIDForZoneID_(v124, v68, v73, v115);
            if (v75)
            {
              objc_msgSend_recordShareUsageForShareID_container_date_(self, v74, (uint64_t)v75, v6, v125);
              char v70 = 1;
            }
            else
            {
              objc_msgSend_addObject_(v122, v74, v73);
            }
          }
          uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v139, v150, 16);
        }
        while (v69);
      }
      else
      {
        char v70 = 0;
      }

      if (objc_msgSend_isFullZoneRequest(v117, v76, v77))
      {
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        obuint64_t j = v122;
        uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v80, (uint64_t)&v135, v149, 16);
        if (v121)
        {
          uint64_t v120 = *(void *)v136;
          do
          {
            uint64_t v82 = 0;
            do
            {
              if (*(void *)v136 != v120) {
                objc_enumerationMutation(obj);
              }
              uint64_t v123 = v82;
              v83 = objc_msgSend_knownShareIDsForZoneID_(v124, v81, *(void *)(*((void *)&v135 + 1) + 8 * v82), v115);
              long long v131 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v131, v148, 16);
              if (v85)
              {
                uint64_t v88 = v85;
                uint64_t v89 = *(void *)v132;
                do
                {
                  for (uint64_t k = 0; k != v88; ++k)
                  {
                    if (*(void *)v132 != v89) {
                      objc_enumerationMutation(v83);
                    }
                    v91 = *(void **)(*((void *)&v131 + 1) + 8 * k);
                    v92 = objc_msgSend_zoneID(v91, v86, v87);
                    v95 = objc_msgSend_anonymousCKUserID(v92, v93, v94);
                    uint64_t v98 = objc_msgSend_length(v95, v96, v97);

                    if (!v98)
                    {
                      objc_msgSend_recordShareUsageForShareID_container_date_(self, v86, (uint64_t)v91, v41, v125);
                      char v70 = 1;
                    }
                  }
                  uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v131, v148, 16);
                }
                while (v88);
              }

              uint64_t v82 = v123 + 1;
            }
            while (v123 + 1 != v121);
            id v6 = v41;
            uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v135, v149, 16);
          }
          while (v121);
        }
      }
      else
      {
        v100 = v122;
        if (!objc_msgSend_count(v122, v78, v79))
        {
          int v29 = v118;
          if ((v70 & 1) == 0) {
            goto LABEL_74;
          }
          goto LABEL_73;
        }
        v101 = objc_msgSend_recordIDsUsedInZones_(v117, v99, (uint64_t)v122);
        long long v127 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v102, (uint64_t)&v127, v147, 16);
        if (v103)
        {
          uint64_t v106 = v103;
          uint64_t v107 = *(void *)v128;
          do
          {
            for (uint64_t m = 0; m != v106; ++m)
            {
              if (*(void *)v128 != v107) {
                objc_enumerationMutation(v101);
              }
              v109 = *(void **)(*((void *)&v127 + 1) + 8 * m);
              v110 = objc_msgSend_zoneID(v109, v104, v105, v115);
              int v112 = objc_msgSend_containsObject_(v122, v111, (uint64_t)v110);

              if (v112)
              {
                v114 = objc_msgSend_shareIDForRecordID_(v124, v104, (uint64_t)v109);
                if (v114)
                {
                  objc_msgSend_recordShareUsageForShareID_container_date_(self, v113, (uint64_t)v114, v6, v125);
                  char v70 = 1;
                }
                else
                {
                  objc_msgSend_recordWithUnknownShareUsageForRecordID_container_date_(self, v113, (uint64_t)v109, v6, v125);
                }
              }
            }
            uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v104, (uint64_t)&v127, v147, 16);
          }
          while (v106);
        }
      }
      int v29 = v118;
      v100 = v122;
      if ((v70 & 1) == 0)
      {
LABEL_74:

        id v5 = v117;
        id v64 = v115;
        goto LABEL_75;
      }
LABEL_73:
      objc_msgSend_sendToServerForContainer_operation_(self, v99, (uint64_t)v6, v29, v115);
      goto LABEL_74;
    }
  }
LABEL_20:
}

- (void)recordShareUsageForDeletedRecordID:(id)a3 at:(id)a4 container:(id)a5 operation:(id)a6
{
  id v51 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_entitlements(v11, v13, v14);
  int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v15, v16, v17);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    uint64_t v21 = objc_msgSend_options(v11, v19, v20);
    char v24 = objc_msgSend_bypassPCSEncryption(v21, v22, v23);

    if (v51)
    {
      if ((v24 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_databaseScope(v12, v25, v26) == 3)
      {
        if (!*MEMORY[0x1E4F1A4E0]
          || (objc_msgSend_unitTestOverrides(v12, v27, v28),
              int v29 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_objectForKeyedSubscript_(v29, v30, @"UpdateCapabilitiesAsChildOperation"),
              uint64_t v31 = objc_claimAutoreleasedReturnValue(),
              int v34 = objc_msgSend_BOOLValue(v31, v32, v33),
              v31,
              v29,
              v34))
        {
          id v35 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v27, (uint64_t)v11);
          uint64_t v37 = objc_msgSend_shareIDForRecordID_(v35, v36, (uint64_t)v51);
          int v40 = v37;
          if (v37)
          {
            id v41 = objc_msgSend_zoneID(v37, v38, v39);
            id v44 = objc_msgSend_anonymousCKUserID(v41, v42, v43);
            uint64_t v47 = objc_msgSend_length(v44, v45, v46);

            if (!v47 && (objc_msgSend_isEqual_(v51, v48, (uint64_t)v40) & 1) == 0)
            {
              objc_msgSend_recordShareUsageForShareID_container_date_(self, v49, (uint64_t)v40, v11, v10);
              objc_msgSend_sendToServerForContainer_operation_(self, v50, (uint64_t)v11, v12);
            }
          }
        }
      }
    }
  }
}

- (void)recordShareUsageForRecordID:(id)a3 at:(id)a4 container:(id)a5 operation:(id)a6
{
  id v50 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_entitlements(v11, v13, v14);
  int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v15, v16, v17);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    uint64_t v21 = objc_msgSend_options(v11, v19, v20);
    char v24 = objc_msgSend_bypassPCSEncryption(v21, v22, v23);

    if (v50)
    {
      if ((v24 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_databaseScope(v12, v25, v26) == 3)
      {
        if (!*MEMORY[0x1E4F1A4E0]
          || (objc_msgSend_unitTestOverrides(v12, v27, v28),
              int v29 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_objectForKeyedSubscript_(v29, v30, @"UpdateCapabilitiesAsChildOperation"),
              uint64_t v31 = objc_claimAutoreleasedReturnValue(),
              int v34 = objc_msgSend_BOOLValue(v31, v32, v33),
              v31,
              v29,
              v34))
        {
          id v35 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v27, (uint64_t)v11);
          uint64_t v37 = objc_msgSend_shareIDForRecordID_(v35, v36, (uint64_t)v50);
          int v40 = v37;
          if (v37)
          {
            id v41 = objc_msgSend_zoneID(v37, v38, v39);
            id v44 = objc_msgSend_anonymousCKUserID(v41, v42, v43);
            uint64_t v47 = objc_msgSend_length(v44, v45, v46);

            if (!v47)
            {
              objc_msgSend_recordShareUsageForShareID_container_date_(self, v48, (uint64_t)v40, v11, v10);
              objc_msgSend_sendToServerForContainer_operation_(self, v49, (uint64_t)v11, v12);
            }
          }
          else
          {
            objc_msgSend_recordWithUnknownShareUsageForRecordID_container_date_(self, v38, (uint64_t)v50, v11, v10);
          }
        }
      }
    }
  }
}

- (void)recordShareUsageForShareID:(id)a3 at:(id)a4 container:(id)a5 operation:(id)a6
{
  id v45 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_entitlements(v11, v13, v14);
  int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v15, v16, v17);

  if (hasTemporaryDeviceCapabilitiesEntitlement)
  {
    uint64_t v21 = objc_msgSend_options(v11, v19, v20);
    char v24 = objc_msgSend_bypassPCSEncryption(v21, v22, v23);

    if (v45)
    {
      if ((v24 & 1) == 0)
      {
        uint64_t v27 = objc_msgSend_zoneID(v45, v25, v26);
        os_log_t v30 = objc_msgSend_anonymousCKUserID(v27, v28, v29);
        uint64_t v33 = objc_msgSend_length(v30, v31, v32);

        if (!v33 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_databaseScope(v12, v34, v35) == 3)
        {
          if (!*MEMORY[0x1E4F1A4E0]
            || (objc_msgSend_unitTestOverrides(v12, v36, v37),
                uint64_t v38 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend_objectForKeyedSubscript_(v38, v39, @"UpdateCapabilitiesAsChildOperation"),
                int v40 = objc_claimAutoreleasedReturnValue(),
                int v43 = objc_msgSend_BOOLValue(v40, v41, v42),
                v40,
                v38,
                v43))
          {
            objc_msgSend_recordShareUsageForShareID_container_date_(self, v36, (uint64_t)v45, v11, v10);
            objc_msgSend_sendToServerForContainer_operation_(self, v44, (uint64_t)v11, v12);
          }
        }
      }
    }
  }
}

- (void)recordWithUnknownShareUsageForRecordID:(id)a3 container:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_1C4EF7DBC;
  uint64_t v21 = &unk_1E64F3280;
  objc_copyWeak(&v26, &location);
  id v11 = v10;
  id v22 = v11;
  uint64_t v23 = self;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  uint64_t v16 = _Block_copy(&v18);
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v17 = objc_msgSend_queue(self, v14, v15, v18, v19, v20, v21, v22, v23, v24);
    dispatch_sync(v17, v16);
  }
  else
  {
    uint64_t v17 = objc_msgSend_queue(self, v14, v15, v18, v19, v20, v21, v22, v23, v24);
    dispatch_async(v17, v16);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)recordShareUsageForShareID:(id)a3 container:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v13 = objc_msgSend_zoneID(v8, v11, v12);
  uint64_t v16 = objc_msgSend_anonymousCKUserID(v13, v14, v15);
  uint64_t v19 = objc_msgSend_length(v16, v17, v18);

  if (!v19)
  {
    id v22 = objc_msgSend_queue(self, v20, v21);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1C4EF7F68;
    v23[3] = &unk_1E64F0DF0;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    id v26 = v10;
    dispatch_sync(v22, v23);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)updateOperationsPerContainer
{
  return self->_updateOperationsPerContainer;
}

- (void)setUpdateOperationsPerContainer:(id)a3
{
}

- (double)lastTrackedFailureTime
{
  return self->_lastTrackedFailureTime;
}

- (void)setLastTrackedFailureTime:(double)a3
{
  self->_lastTrackedFailureTime = a3;
}

- (double)failureBackoffDelay
{
  return self->_failureBackoffDelay;
}

- (void)setFailureBackoffDelay:(double)a3
{
  self->_failureBackoffDelay = a3;
}

- (NSMutableDictionary)capabilitiesAndUsagesCachePerContainer
{
  return self->_capabilitiesAndUsagesCachePerContainer;
}

- (void)setCapabilitiesAndUsagesCachePerContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesAndUsagesCachePerContainer, 0);
  objc_storeStrong((id *)&self->_updateOperationsPerContainer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end