@interface CKDThrottleManager
+ (id)_expirationDateForTTLSeconds:(unsigned int)a3;
+ (id)throttleFromPThrottlingConfig:(id)a3;
+ (id)throttleFromServerJSONDictionary:(id)a3;
- (BOOL)addThrottle:(id)a3;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDThrottleManager)initWithDeviceContext:(id)a3;
- (id)throttleTable:(BOOL)a3;
- (void)invalidateAdopterThrottles;
- (void)loadThrottlesFromDatabase;
- (void)noteDataChangeForThrottle:(id)a3;
- (void)throttleListBecameEmpty;
- (void)throttleWasAdded:(id)a3;
- (void)throttleWillBeRemoved:(id)a3;
@end

@implementation CKDThrottleManager

- (CKDThrottleManager)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDThrottleManager;
  v5 = [(CKThrottleManager *)&v10 initInternal];
  v6 = (CKDThrottleManager *)v5;
  if (v5)
  {
    objc_storeWeak(v5 + 13, v4);
    objc_msgSend_loadThrottlesFromDatabase(v6, v7, v8);
  }

  return v6;
}

- (id)throttleTable:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_throttleTableGroup)
  {
    BOOL v4 = a3;
    v5 = objc_msgSend_deviceContext(self, a2, a3);
    uint64_t v8 = objc_msgSend_deviceScopedDatabase(v5, v6, v7);

    v12 = objc_msgSend_groupName(CKDThrottleTableGroup, v9, v10);
    if (v4) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 0x10000;
    }
    id v23 = 0;
    objc_msgSend_tableGroupInDatabase_withName_options_error_(CKDThrottleTableGroup, v11, (uint64_t)v8, v12, v13, &v23);
    v14 = (CKDThrottleTableGroup *)objc_claimAutoreleasedReturnValue();
    id v15 = v23;
    throttleTableGroup = self->_throttleTableGroup;
    self->_throttleTableGroup = v14;

    if (v15)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v18 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v15;
        _os_log_fault_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_FAULT, "Failed to create the throttle table: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_tableWithName_(self->_throttleTableGroup, v17, @"Throttle");
      v19 = (CKThrottleTable *)objc_claimAutoreleasedReturnValue();
      throttleTable = self->_throttleTable;
      self->_throttleTable = v19;
    }
  }
  v21 = self->_throttleTable;
  return v21;
}

- (void)loadThrottlesFromDatabase
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_throttleTable_(self, a2, 0);
  id v39 = 0;
  v5 = objc_msgSend_fetchAllEntries_(v3, v4, (uint64_t)&v39);
  id v6 = v39;
  uint64_t v7 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  if (v6)
  {
    uint64_t v8 = v6;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v9 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = (uint64_t)v8;
    _os_log_fault_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_FAULT, "Failed to fetch the throttle list: %{public}@", buf, 0xCu);
    uint64_t v10 = 0;
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v34 = v5;
    id v11 = v5;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v35, v40, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v8 = 0;
      uint64_t v17 = *(void *)v36;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v11);
          }
          v19 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
          v20 = objc_msgSend_expirationDate(v19, v14, v15);
          if ((objc_msgSend_isExpired(v19, v21, v22) & 1) != 0
            || (objc_msgSend_timeIntervalSinceNow(v20, v23, v24), v25 > 172800.0))
          {
            uint64_t v26 = objc_msgSend_deleteObject_(v3, v23, (uint64_t)v19);

            if (v26)
            {
              if (*v7 != -1) {
                dispatch_once(v7, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v27 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v42 = v26;
                _os_log_fault_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_FAULT, "Failed to delete throttle: %{public}@", buf, 0xCu);
              }
              uint64_t v8 = (void *)v26;
            }
            else
            {
              uint64_t v8 = 0;
            }
          }
          else
          {
            objc_msgSend_addThrottle_(self, v23, (uint64_t)v19);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v35, v40, 16);
      }
      while (v16);
    }
    else
    {
      uint64_t v8 = 0;
    }

    v30 = objc_msgSend_allThrottles(self, v28, v29);
    uint64_t v10 = objc_msgSend_count(v30, v31, v32);

    v5 = v34;
  }
  if (*v7 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
LABEL_28:
  v33 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v42 = v10;
    _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "CKThrottle count at startup: %lu", buf, 0xCu);
  }
}

- (void)invalidateAdopterThrottles
{
  BOOL v4 = objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, a2, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4FCED08;
  v6[3] = &unk_1E64F8248;
  v6[4] = self;
  objc_msgSend_enumerateConnections_(v4, v5, (uint64_t)v6);
}

- (BOOL)addThrottle:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKDThrottleManager;
  BOOL v6 = [(CKThrottleManager *)&v8 addThrottle:a3];
  if (v6) {
    objc_msgSend_invalidateAdopterThrottles(self, v4, v5);
  }
  return v6;
}

- (void)throttleWasAdded:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend_isExpired(v4, v5, v6) & 1) == 0)
  {
    v9 = objc_msgSend_throttleID(v4, v7, v8);

    if (!v9)
    {
      id v11 = objc_msgSend_throttleTable_(self, v10, 1);
      uint64_t v13 = objc_msgSend_insertObject_(v11, v12, (uint64_t)v4);

      if (v13)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v14 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          int v15 = 138543362;
          uint64_t v16 = v13;
          _os_log_fault_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_FAULT, "Failed to save new throttle: %{public}@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
}

- (void)throttleWillBeRemoved:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = objc_msgSend_throttleTable_(self, v5, 1);
  uint64_t v8 = objc_msgSend_deleteObject_(v6, v7, (uint64_t)v4);

  if (v8)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      int v12 = 138543362;
      uint64_t v13 = v8;
      _os_log_fault_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_FAULT, "Failed to delete throttle: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend_invalidateAdopterThrottles(self, v9, v10);
}

- (void)throttleListBecameEmpty
{
  throttleTable = self->_throttleTable;
  self->_throttleTable = 0;

  throttleTableGroup = self->_throttleTableGroup;
  self->_throttleTableGroup = 0;

  uint64_t v7 = objc_msgSend_deviceContext(self, v5, v6);
  objc_msgSend_deviceScopedDatabase(v7, v8, v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  int v12 = objc_msgSend_groupName(CKDThrottleTableGroup, v10, v11);
  objc_msgSend_purgeGroupWithName_inDatabase_(MEMORY[0x1E4F1A378], v13, (uint64_t)v12, v14);
}

- (void)noteDataChangeForThrottle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = objc_msgSend_throttleTable_(self, v5, 1);
  uint64_t v8 = objc_msgSend_updateRequestCount_(v6, v7, (uint64_t)v4);

  if (v8)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_fault_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_FAULT, "Failed to save throttle changes: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (id)_expirationDateForTTLSeconds:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = 86400;
  if (a3 <= 0x15180)
  {
    unsigned int v4 = a3;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v5 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a3;
      _os_log_error_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_ERROR, "Received throttle config with large ttl (%d sec). Limiting to 24 hours.", (uint8_t *)v8, 8u);
    }
  }
  uint64_t v6 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], a2, *(uint64_t *)&a3, (double)v4);
  return v6;
}

+ (id)throttleFromServerJSONDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"label");
  uint64_t v8 = objc_msgSend_objectForKey_(v4, v7, @"criteria");
  int v10 = objc_msgSend_objectForKey_(v4, v9, @"rateLimit");
  uint64_t v12 = objc_msgSend_objectForKey_(v8, v11, @"containerName");
  uint64_t v13 = (void *)v12;
  BOOL v14 = v6 == 0;
  BOOL v15 = v8 != 0;
  if (v8) {
    BOOL v14 = 1;
  }
  if (!v12) {
    BOOL v15 = 0;
  }
  if (v10) {
    int v16 = 1;
  }
  else {
    int v16 = v14;
  }
  if (v10) {
    BOOL v17 = v15;
  }
  else {
    BOOL v17 = 0;
  }
  if (v16 != 1 || v17)
  {
    int v189 = v16;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1A460]);
    uint64_t v22 = v20;
    if (v6) {
      objc_msgSend_setLabel_(v20, v21, (uint64_t)v6);
    }
    v191 = v6;
    id v23 = objc_msgSend_objectForKey_(v8, v21, @"containerName");
    objc_msgSend_setContainerIdentifier_(v22, v24, (uint64_t)v23);

    uint64_t v26 = objc_msgSend_objectForKey_(v8, v25, @"databaseType");
    v28 = v26;
    if (v26)
    {
      id v29 = v26;
      if (objc_msgSend_isEqualToString_(v29, v30, @"privateDB"))
      {
        uint64_t v32 = 2;
      }
      else if (objc_msgSend_isEqualToString_(v29, v31, @"publicDB"))
      {
        uint64_t v32 = 1;
      }
      else if (objc_msgSend_isEqualToString_(v29, v33, @"sharedDB"))
      {
        uint64_t v32 = 3;
      }
      else if (objc_msgSend_isEqualToString_(v29, v34, @"orgDB"))
      {
        uint64_t v32 = 4;
      }
      else
      {
        uint64_t v32 = 2;
      }

      long long v36 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v35, v32);
      objc_msgSend_setDatabaseScope_(v22, v37, (uint64_t)v36);
    }
    v190 = v28;
    long long v38 = objc_msgSend_objectForKey_(v8, v27, @"zoneName");
    objc_msgSend_setZoneName_(v22, v39, (uint64_t)v38);

    v41 = objc_msgSend_objectForKey_(v8, v40, @"operationType");
    uint64_t v43 = v41;
    if (v41)
    {
      v44 = (void *)MEMORY[0x1E4F28ED0];
      id v45 = v41;
      v186 = v44;
      if (objc_msgSend_isEqualToString_(v45, v46, @"noneType"))
      {
        uint64_t v48 = 0;
      }
      else if (objc_msgSend_isEqualToString_(v45, v47, @"zoneSaveType"))
      {
        uint64_t v48 = 200;
      }
      else if (objc_msgSend_isEqualToString_(v45, v49, @"zoneRetrieveType"))
      {
        uint64_t v48 = 201;
      }
      else if (objc_msgSend_isEqualToString_(v45, v50, @"zoneDeleteType"))
      {
        uint64_t v48 = 202;
      }
      else if (objc_msgSend_isEqualToString_(v45, v51, @"zoneRetrieveChangesType"))
      {
        uint64_t v48 = 203;
      }
      else if (objc_msgSend_isEqualToString_(v45, v52, @"recordSaveType"))
      {
        uint64_t v48 = 210;
      }
      else if (objc_msgSend_isEqualToString_(v45, v53, @"recordRetrieveType"))
      {
        uint64_t v48 = 211;
      }
      else if (objc_msgSend_isEqualToString_(v45, v54, @"recordRetrieveVersionsType"))
      {
        uint64_t v48 = 212;
      }
      else if (objc_msgSend_isEqualToString_(v45, v55, @"recordRetrieveChangesType"))
      {
        uint64_t v48 = 213;
      }
      else if (objc_msgSend_isEqualToString_(v45, v56, @"recordDeleteType"))
      {
        uint64_t v48 = 214;
      }
      else if (objc_msgSend_isEqualToString_(v45, v57, @"recordResolveTokenType"))
      {
        uint64_t v48 = 216;
      }
      else if (objc_msgSend_isEqualToString_(v45, v58, @"fetchArchivedRecordsType"))
      {
        uint64_t v48 = 217;
      }
      else if (objc_msgSend_isEqualToString_(v45, v59, @"recordMoveType"))
      {
        uint64_t v48 = 218;
      }
      else if (objc_msgSend_isEqualToString_(v45, v60, @"shareAccessType"))
      {
        uint64_t v48 = 219;
      }
      else if (objc_msgSend_isEqualToString_(v45, v61, @"queryRetrieveType"))
      {
        uint64_t v48 = 220;
      }
      else if (objc_msgSend_isEqualToString_(v45, v62, @"shareDeclineType"))
      {
        uint64_t v48 = 221;
      }
      else if (objc_msgSend_isEqualToString_(v45, v63, @"assetUploadTokenRetrieveType"))
      {
        uint64_t v48 = 230;
      }
      else if (objc_msgSend_isEqualToString_(v45, v64, @"containerDeleteType"))
      {
        uint64_t v48 = 240;
      }
      else if (objc_msgSend_isEqualToString_(v45, v65, @"userAvailableQuotaType"))
      {
        uint64_t v48 = 243;
      }
      else if (objc_msgSend_isEqualToString_(v45, v66, @"containerGetBundlesType"))
      {
        uint64_t v48 = 244;
      }
      else if (objc_msgSend_isEqualToString_(v45, v67, @"webAuthTokenRetrieveType"))
      {
        uint64_t v48 = 250;
      }
      else if (objc_msgSend_isEqualToString_(v45, v68, @"dataRepairUpdateMissingAssetStatusType"))
      {
        uint64_t v48 = 260;
      }
      else if (objc_msgSend_isEqualToString_(v45, v69, @"addAnonymousShareType"))
      {
        uint64_t v48 = 270;
      }
      else if (objc_msgSend_isEqualToString_(v45, v70, @"removeAnonymousShareType"))
      {
        uint64_t v48 = 271;
      }
      else if (objc_msgSend_isEqualToString_(v45, v71, @"subscriptionCreateType"))
      {
        uint64_t v48 = 300;
      }
      else if (objc_msgSend_isEqualToString_(v45, v72, @"subscriptionRetrieveType"))
      {
        uint64_t v48 = 301;
      }
      else if (objc_msgSend_isEqualToString_(v45, v73, @"subscriptionDeleteType"))
      {
        uint64_t v48 = 302;
      }
      else if (objc_msgSend_isEqualToString_(v45, v74, @"mergeableDeltaSaveType"))
      {
        uint64_t v48 = 311;
      }
      else if (objc_msgSend_isEqualToString_(v45, v75, @"mergeableDeltaMetadataRetrieveType"))
      {
        uint64_t v48 = 312;
      }
      else if (objc_msgSend_isEqualToString_(v45, v76, @"mergeableDeltaReplaceType"))
      {
        uint64_t v48 = 313;
      }
      else if (objc_msgSend_isEqualToString_(v45, v77, @"mergeableDeltaRetrieveType"))
      {
        uint64_t v48 = 314;
      }
      else if (objc_msgSend_isEqualToString_(v45, v78, @"privateSearchSetType"))
      {
        uint64_t v48 = 320;
      }
      else if (objc_msgSend_isEqualToString_(v45, v79, @"privateSearchGetType"))
      {
        uint64_t v48 = 321;
      }
      else if (objc_msgSend_isEqualToString_(v45, v80, @"privateSearchDeleteType"))
      {
        uint64_t v48 = 322;
      }
      else if (objc_msgSend_isEqualToString_(v45, v81, @"userRetrieveType"))
      {
        uint64_t v48 = 400;
      }
      else if (objc_msgSend_isEqualToString_(v45, v82, @"userQueryType"))
      {
        uint64_t v48 = 401;
      }
      else if (objc_msgSend_isEqualToString_(v45, v83, @"userPrivacySettingsRetrieveType"))
      {
        uint64_t v48 = 402;
      }
      else if (objc_msgSend_isEqualToString_(v45, v84, @"userPrivacySettingsUpdateType"))
      {
        uint64_t v48 = 403;
      }
      else if (objc_msgSend_isEqualToString_(v45, v85, @"userPrivacySettingsResetType"))
      {
        uint64_t v48 = 404;
      }
      else if (objc_msgSend_isEqualToString_(v45, v86, @"userPrivacySettingsBatchLookup"))
      {
        uint64_t v48 = 405;
      }
      else if (objc_msgSend_isEqualToString_(v45, v87, @"sharePermissionSettingsUpdateType"))
      {
        uint64_t v48 = 406;
      }
      else if (objc_msgSend_isEqualToString_(v45, v88, @"adopterCapabilitiesSaveType"))
      {
        uint64_t v48 = 407;
      }
      else if (objc_msgSend_isEqualToString_(v45, v89, @"adopterCapabilitiesCheckType"))
      {
        uint64_t v48 = 408;
      }
      else if (objc_msgSend_isEqualToString_(v45, v90, @"zoneUsageSaveType"))
      {
        uint64_t v48 = 409;
      }
      else if (objc_msgSend_isEqualToString_(v45, v91, @"shareUsageSaveType"))
      {
        uint64_t v48 = 410;
      }
      else if (objc_msgSend_isEqualToString_(v45, v92, @"shareAcceptType"))
      {
        uint64_t v48 = 503;
      }
      else if (objc_msgSend_isEqualToString_(v45, v93, @"shareVettingInitiateType"))
      {
        uint64_t v48 = 513;
      }
      else if (objc_msgSend_isEqualToString_(v45, v94, @"pushRegisterType"))
      {
        uint64_t v48 = 800;
      }
      else if (objc_msgSend_isEqualToString_(v45, v95, @"pushUnregisterType"))
      {
        uint64_t v48 = 801;
      }
      else if (objc_msgSend_isEqualToString_(v45, v96, @"pushBadgeType"))
      {
        uint64_t v48 = 802;
      }
      else if (objc_msgSend_isEqualToString_(v45, v97, @"pushSyncType"))
      {
        uint64_t v48 = 803;
      }
      else if (objc_msgSend_isEqualToString_(v45, v98, @"pushReadType"))
      {
        uint64_t v48 = 804;
      }
      else if (objc_msgSend_isEqualToString_(v45, v99, @"archiveRecordsType"))
      {
        uint64_t v48 = 900;
      }
      else if (objc_msgSend_isEqualToString_(v45, v100, @"datarepairMarkAssetBrokenType"))
      {
        uint64_t v48 = 901;
      }
      else if (objc_msgSend_isEqualToString_(v45, v101, @"functionInvokeType"))
      {
        uint64_t v48 = 1101;
      }
      else
      {
        uint64_t v48 = 0;
      }

      v103 = objc_msgSend_numberWithInt_(v186, v102, v48);
      objc_msgSend_setOperationType_(v22, v104, (uint64_t)v103);
    }
    v188 = v43;
    v105 = objc_msgSend_objectForKey_(v8, v42, @"invernessServiceName");
    objc_msgSend_setServiceName_(v22, v106, (uint64_t)v105);

    v108 = objc_msgSend_objectForKey_(v8, v107, @"invernessFunctionName");
    objc_msgSend_setFunctionName_(v22, v109, (uint64_t)v108);

    v111 = objc_msgSend_objectForKey_(v8, v110, @"bundleID");
    objc_msgSend_setBundleID_(v22, v112, (uint64_t)v111);

    v114 = objc_msgSend_objectForKey_(v8, v113, @"operationGroupName");
    objc_msgSend_setOperationGroupNamePrefix_(v22, v115, (uint64_t)v114);

    v116 = (void *)MEMORY[0x1E4F28ED0];
    v118 = objc_msgSend_objectForKey_(v10, v117, @"intervalLengthSec");
    uint64_t v121 = objc_msgSend_integerValue(v118, v119, v120);
    v123 = objc_msgSend_numberWithInteger_(v116, v122, v121);
    objc_msgSend_setIntervalLengthSeconds_(v22, v124, (uint64_t)v123);

    v125 = (void *)MEMORY[0x1E4F28ED0];
    v127 = objc_msgSend_objectForKey_(v10, v126, @"allowedRequestCount");
    uint64_t v130 = objc_msgSend_integerValue(v127, v128, v129);
    v132 = objc_msgSend_numberWithInteger_(v125, v131, v130);
    objc_msgSend_setAllowedRequestCount_(v22, v133, (uint64_t)v132);

    v134 = (void *)MEMORY[0x1E4F28ED0];
    v136 = objc_msgSend_objectForKey_(v10, v135, @"repeatEverySec");
    uint64_t v139 = objc_msgSend_integerValue(v136, v137, v138);
    v141 = objc_msgSend_numberWithInteger_(v134, v140, v139);
    objc_msgSend_setRepeatEverySeconds_(v22, v142, (uint64_t)v141);

    v144 = objc_msgSend_objectForKey_(v10, v143, @"startTimeSecondsAfterUnixEpoch");
    v147 = v144;
    if (v144)
    {
      uint64_t v148 = objc_msgSend_integerValue(v144, v145, v146);
      v151 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v149, v150, (double)v148);
      objc_msgSend_setThrottleStartDate_(v22, v152, (uint64_t)v151);
    }
    v153 = objc_msgSend_objectForKey_(v10, v145, @"startTimeSecondsAfterLocalMidnight");
    v156 = v153;
    if (v153)
    {
      uint64_t v157 = objc_msgSend_integerValue(v153, v154, v155);
      objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v158, v159);
      v185 = v147;
      v161 = v160 = v22;
      objc_msgSend_date(MEMORY[0x1E4F1C9C8], v162, v163);
      id v187 = a1;
      v164 = v8;
      v165 = v10;
      id v166 = v4;
      v168 = v167 = v13;
      v170 = objc_msgSend_startOfDayForDate_(v161, v169, (uint64_t)v168);

      v173 = objc_msgSend_dateByAddingTimeInterval_(v170, v171, v172, (double)v157);
      objc_msgSend_setThrottleStartDate_(v160, v174, (uint64_t)v173);

      uint64_t v13 = v167;
      id v4 = v166;
      int v10 = v165;
      uint64_t v8 = v164;
      a1 = v187;

      uint64_t v22 = v160;
      v147 = v185;
    }
    v175 = objc_msgSend_objectForKey_(v4, v154, @"ttlSec");
    v178 = v175;
    if (v175) {
      int v179 = v189;
    }
    else {
      int v179 = 0;
    }
    if (v179 == 1)
    {
      uint64_t v180 = objc_msgSend_integerValue(v175, v176, v177);
      v182 = objc_msgSend__expirationDateForTTLSeconds_(a1, v181, v180);
      objc_msgSend_setExpirationDate_(v22, v183, (uint64_t)v182);
    }
    objc_msgSend_setFlag_(v22, v176, 1);
    id v19 = v22;

    uint64_t v6 = v191;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Received malformed throttling config. Discarding.", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

+ (id)throttleFromPThrottlingConfig:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_hasLabel(v4, v5, v6))
  {
    uint64_t v9 = objc_msgSend_label(v4, v7, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (objc_msgSend_hasCriteria(v4, v7, v8))
  {
    uint64_t v12 = objc_msgSend_criteria(v4, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (objc_msgSend_hasRateLimit(v4, v10, v11))
  {
    BOOL v15 = objc_msgSend_rateLimit(v4, v13, v14);
  }
  else
  {
    BOOL v15 = 0;
  }
  if (v9) {
    BOOL v16 = v12 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  LODWORD(v18) = v16 && v15 == 0;
  if (v12)
  {
    int hasContainerName = objc_msgSend_hasContainerName(v12, v13, v14);
    if (v15) {
      int v20 = hasContainerName;
    }
    else {
      int v20 = 0;
    }
  }
  else
  {
    int v20 = 0;
  }
  if ((v18 | v20))
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1A460]);
    uint64_t v24 = v21;
    if (v9) {
      objc_msgSend_setLabel_(v21, v22, (uint64_t)v9);
    }
    if (objc_msgSend_hasContainerName(v12, v22, v23))
    {
      v27 = objc_msgSend_containerName(v12, v25, v26);
      objc_msgSend_setContainerIdentifier_(v24, v28, (uint64_t)v27);
    }
    if (objc_msgSend_hasDatabaseType(v12, v25, v26))
    {
      unsigned int v32 = objc_msgSend_databaseType(v12, v29, v30) - 1;
      if (v32 >= 4)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v113 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          v115 = v113;
          *(_DWORD *)buf = 67109120;
          int v120 = objc_msgSend_databaseType(v12, v116, v117);
          _os_log_error_impl(&dword_1C4CFF000, v115, OS_LOG_TYPE_ERROR, "Received throttle with unknown database type: %d. Discarding.", buf, 8u);
        }
        id v111 = 0;
        goto LABEL_68;
      }
      v33 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v31, qword_1C5080850[v32]);
      objc_msgSend_setDatabaseScope_(v24, v34, (uint64_t)v33);
    }
    if (objc_msgSend_hasZoneName(v12, v29, v30))
    {
      long long v37 = objc_msgSend_zoneName(v12, v35, v36);
      objc_msgSend_setZoneName_(v24, v38, (uint64_t)v37);
    }
    if (objc_msgSend_hasOperationType(v12, v35, v36))
    {
      v41 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v42 = objc_msgSend_operationType(v12, v39, v40);
      v44 = objc_msgSend_numberWithInt_(v41, v43, v42);
      objc_msgSend_setOperationType_(v24, v45, (uint64_t)v44);
    }
    if (objc_msgSend_hasInvernessServiceName(v12, v39, v40))
    {
      uint64_t v48 = objc_msgSend_invernessServiceName(v12, v46, v47);
      objc_msgSend_setServiceName_(v24, v49, (uint64_t)v48);
    }
    if (objc_msgSend_hasInvernessFunctionName(v12, v46, v47))
    {
      v52 = objc_msgSend_invernessFunctionName(v12, v50, v51);
      objc_msgSend_setFunctionName_(v24, v53, (uint64_t)v52);
    }
    if (objc_msgSend_hasBundleID(v12, v50, v51))
    {
      v56 = objc_msgSend_bundleID(v12, v54, v55);
      objc_msgSend_setBundleID_(v24, v57, (uint64_t)v56);
    }
    if (objc_msgSend_hasOperationGroupName(v12, v54, v55))
    {
      v60 = objc_msgSend_operationGroupName(v12, v58, v59);
      objc_msgSend_setOperationGroupNamePrefix_(v24, v61, (uint64_t)v60);
    }
    if (objc_msgSend_hasIntervalLengthSec(v15, v58, v59))
    {
      v64 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v65 = objc_msgSend_intervalLengthSec(v15, v62, v63);
      v67 = objc_msgSend_numberWithInt_(v64, v66, v65);
      objc_msgSend_setIntervalLengthSeconds_(v24, v68, (uint64_t)v67);
    }
    if (objc_msgSend_hasAllowedRequestCount(v15, v62, v63))
    {
      v71 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v72 = objc_msgSend_allowedRequestCount(v15, v69, v70);
      v74 = objc_msgSend_numberWithInt_(v71, v73, v72);
      objc_msgSend_setAllowedRequestCount_(v24, v75, (uint64_t)v74);
    }
    if (objc_msgSend_hasRepeatEverySec(v15, v69, v70))
    {
      v78 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v79 = objc_msgSend_repeatEverySec(v15, v76, v77);
      v81 = objc_msgSend_numberWithInt_(v78, v80, v79);
      objc_msgSend_setRepeatEverySeconds_(v24, v82, (uint64_t)v81);
    }
    if (objc_msgSend_hasStartTimeSecondsAfterUnixEpoch(v15, v76, v77))
    {
      uint64_t started = objc_msgSend_startTimeSecondsAfterUnixEpoch(v15, v83, v84);
      v88 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v86, v87, (double)started);
      objc_msgSend_setThrottleStartDate_(v24, v89, (uint64_t)v88);
    }
    if (objc_msgSend_hasStartTimeSecondsAfterLocalMidnight(v15, v83, v84))
    {
      uint64_t v92 = objc_msgSend_startTimeSecondsAfterLocalMidnight(v15, v90, v91);
      v95 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v93, v94);
      v98 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v96, v97);
      objc_msgSend_startOfDayForDate_(v95, v99, (uint64_t)v98);
      v118 = v9;
      char v100 = (char)v18;
      v101 = id v18 = a1;

      v104 = objc_msgSend_dateByAddingTimeInterval_(v101, v102, v103, (double)v92);
      objc_msgSend_setThrottleStartDate_(v24, v105, (uint64_t)v104);

      a1 = v18;
      LOBYTE(v18) = v100;
      uint64_t v9 = v118;
    }
    if ((v18 & 1) == 0 && objc_msgSend_hasTtlSec(v4, v90, v91))
    {
      uint64_t v107 = objc_msgSend_ttlSec(v4, v90, v106);
      v109 = objc_msgSend__expirationDateForTTLSeconds_(a1, v108, v107);
      objc_msgSend_setExpirationDate_(v24, v110, (uint64_t)v109);
    }
    objc_msgSend_setFlag_(v24, v90, 2);
    id v111 = v24;
LABEL_68:

    goto LABEL_69;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v112 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C4CFF000, v112, OS_LOG_TYPE_ERROR, "Received malformed throttling config. Discarding.", buf, 2u);
  }
  id v111 = 0;
LABEL_69:

  return v111;
}

- (CKDLogicalDeviceContext)deviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceContext);
  return (CKDLogicalDeviceContext *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_throttleTable, 0);
  objc_storeStrong((id *)&self->_throttleTableGroup, 0);
}

@end