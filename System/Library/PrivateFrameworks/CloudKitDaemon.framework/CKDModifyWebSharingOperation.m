@interface CKDModifyWebSharingOperation
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)makeStateTransition;
- (CKDModifyWebSharingOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)recordIDsToShare;
- (NSArray)recordIDsToShareReadWrite;
- (NSArray)recordIDsToUnshare;
- (NSMutableDictionary)recordsToSaveByID;
- (NSMutableSet)fetchedRecordIDs;
- (_PCSIdentityData)_copyShareProtectionFromRecord:(id)a3 error:(id *)a4;
- (id)activityCreate;
- (id)recordWebSharedBlock;
- (id)recordWebUnsharedBlock;
- (id)relevantZoneIDs;
- (int)numSaveAttempts;
- (void)_fetchRecords;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordFetched:(id)a3 recordID:(id)a4 error:(id)a5;
- (void)_handleRecordSaved:(id)a3 error:(id)a4;
- (void)_saveRecords;
- (void)main;
- (void)setFetchedRecordIDs:(id)a3;
- (void)setNumSaveAttempts:(int)a3;
- (void)setRecordIDsToShare:(id)a3;
- (void)setRecordIDsToShareReadWrite:(id)a3;
- (void)setRecordIDsToUnshare:(id)a3;
- (void)setRecordWebSharedBlock:(id)a3;
- (void)setRecordWebUnsharedBlock:(id)a3;
- (void)setRecordsToSaveByID:(id)a3;
@end

@implementation CKDModifyWebSharingOperation

- (CKDModifyWebSharingOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDModifyWebSharingOperation;
  v9 = [(CKDDatabaseOperation *)&v25 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordIDsToShare(v6, v7, v8);
    recordIDsToShare = v9->_recordIDsToShare;
    v9->_recordIDsToShare = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_recordIDsToUnshare(v6, v12, v13);
    recordIDsToUnshare = v9->_recordIDsToUnshare;
    v9->_recordIDsToUnshare = (NSArray *)v14;

    uint64_t v18 = objc_msgSend_recordIDsToShareReadWrite(v6, v16, v17);
    recordIDsToShareReadWrite = v9->_recordIDsToShareReadWrite;
    v9->_recordIDsToShareReadWrite = (NSArray *)v18;

    uint64_t v20 = objc_opt_new();
    recordsToSaveByID = v9->_recordsToSaveByID;
    v9->_recordsToSaveByID = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    fetchedRecordIDs = v9->_fetchedRecordIDs;
    v9->_fetchedRecordIDs = (NSMutableSet *)v22;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/modify-web-sharing", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (id)relevantZoneIDs
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordIDsToShare(self, a2, v2);
  v7 = objc_msgSend_recordIDsToUnshare(self, v5, v6);
  uint64_t v10 = objc_msgSend_recordIDsToShareReadWrite(self, v8, v9);
  if (objc_msgSend_count(v4, v11, v12))
  {
    v15 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v16 = v4;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v61, v67, 16);
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v22 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(v16);
          }
          objc_super v25 = objc_msgSend_zoneID(*(void **)(*((void *)&v61 + 1) + 8 * i), v19, v20);
          if (v25) {
            objc_msgSend_addObject_(v15, v24, (uint64_t)v25);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v61, v67, 16);
      }
      while (v21);
    }

    if (!objc_msgSend_count(v7, v26, v27))
    {
LABEL_26:
      if (!objc_msgSend_count(v10, v28, v29)) {
        goto LABEL_41;
      }
      if (v15) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    if (v15)
    {
LABEL_16:
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v32 = v7;
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v57, v66, 16);
      if (v34)
      {
        uint64_t v37 = v34;
        uint64_t v38 = *(void *)v58;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v58 != v38) {
              objc_enumerationMutation(v32);
            }
            v41 = objc_msgSend_zoneID(*(void **)(*((void *)&v57 + 1) + 8 * j), v35, v36);
            if (v41) {
              objc_msgSend_addObject_(v15, v40, (uint64_t)v41);
            }
          }
          uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v57, v66, 16);
        }
        while (v37);
      }

      goto LABEL_26;
    }
LABEL_15:
    v15 = objc_opt_new();
    goto LABEL_16;
  }
  if (objc_msgSend_count(v7, v13, v14)) {
    goto LABEL_15;
  }
  if (!objc_msgSend_count(v10, v30, v31))
  {
    v15 = 0;
    goto LABEL_41;
  }
LABEL_30:
  v15 = objc_opt_new();
LABEL_31:
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v42 = v10;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v53, v65, 16);
  if (v44)
  {
    uint64_t v47 = v44;
    uint64_t v48 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v54 != v48) {
          objc_enumerationMutation(v42);
        }
        v51 = objc_msgSend_zoneID(*(void **)(*((void *)&v53 + 1) + 8 * k), v45, v46, (void)v53);
        if (v51) {
          objc_msgSend_addObject_(v15, v50, (uint64_t)v51);
        }
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v53, v65, 16);
    }
    while (v47);
  }

LABEL_41:
  return v15;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 3)
  {
    v7 = objc_msgSend_recordsToSaveByID(self, v5, v6);
    if (objc_msgSend_count(v7, v8, v9))
    {
      int v12 = objc_msgSend_numSaveAttempts(self, v10, v11);
      v15 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v13, v14);
      int v18 = objc_msgSend_PCSRetryCount(v15, v16, v17);

      if (v12 < v18) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_super v25 = objc_msgSend_error(self, v23, v24);
    objc_msgSend_finishWithError_(self, v26, (uint64_t)v25);

    return 1;
  }
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 3);
    objc_msgSend__saveRecords(self, v21, v22);
    return 1;
  }
  if (v4 != 1) {
    return 1;
  }
LABEL_7:
  objc_msgSend_setState_(self, v5, 2);
  objc_msgSend__fetchRecords(self, v19, v20);
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetching Records";
  }
  else if (a3 == 3)
  {
    v5 = @"Saving Records";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDModifyWebSharingOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_handleRecordSaved:(id)a3 error:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (__CFString *)a4;
  uint64_t v10 = objc_msgSend_recordIDsToShare(self, v8, v9);
  int v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v6);

  uint64_t v13 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v14 = (os_log_t *)MEMORY[0x1E4F1A500];
  v15 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v50 = @"un";
    v51 = &stru_1F2044F30;
    if (v12) {
      v50 = &stru_1F2044F30;
    }
    *(_DWORD *)buf = 138544130;
    v52 = @" with error ";
    v67 = v50;
    __int16 v68 = 2112;
    id v69 = v6;
    if (!v7) {
      v52 = &stru_1F2044F30;
    }
    __int16 v70 = 2114;
    v71 = v52;
    if (v7) {
      v51 = v7;
    }
    __int16 v72 = 2112;
    v73 = v51;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Record for %{public}@share (%@) was saved%{public}@%@", buf, 0x2Au);
  }
  if (objc_msgSend_code(v7, v16, v17) == 2037
    && (int v20 = objc_msgSend_numSaveAttempts(self, v18, v19),
        objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v21, v22),
        v23 = objc_claimAutoreleasedReturnValue(),
        int v26 = objc_msgSend_PCSRetryCount(v23, v24, v25),
        v23,
        v20 <= v26))
  {
    if (*v13 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v49 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
    {
      long long v53 = @"un";
      if (v12) {
        long long v53 = &stru_1F2044F30;
      }
      *(_DWORD *)buf = 138543618;
      v67 = v53;
      __int16 v68 = 2112;
      id v69 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Oplock failure while trying to %{public}@share record %@. Retrying.", buf, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      uint64_t v27 = objc_msgSend_recordsToSaveByID(self, v18, v19);
      uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v6);

      id v32 = objc_msgSend_encryptedValues(v29, v30, v31);
      uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v32, v33, *MEMORY[0x1E4F19E08]);

      uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v29, v35, *MEMORY[0x1E4F19DF0]);
      v39 = objc_msgSend_recordWebSharedBlock(self, v37, v38);

      if (v39)
      {
        id v42 = objc_msgSend_callbackQueue(self, v40, v41);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4DEE37C;
        block[3] = &unk_1E64F0198;
        block[4] = self;
        id v62 = v6;
        id v63 = v34;
        id v64 = v36;
        v65 = v7;
        dispatch_async(v42, block);
      }
    }
    else
    {
      v45 = objc_msgSend_recordWebUnsharedBlock(self, v18, v19);

      if (v45)
      {
        uint64_t v46 = objc_msgSend_callbackQueue(self, v43, v44);
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        long long v56 = sub_1C4DEE404;
        long long v57 = &unk_1E64F0120;
        long long v58 = self;
        id v59 = v6;
        long long v60 = v7;
        dispatch_async(v46, &v54);
      }
    }
    uint64_t v47 = objc_msgSend_recordsToSaveByID(self, v43, v44, v54, v55, v56, v57, v58);
    objc_msgSend_removeObjectForKey_(v47, v48, (uint64_t)v6);
  }
}

- (void)_saveRecords
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_numSaveAttempts(self, a2, v2);
  objc_msgSend_setNumSaveAttempts_(self, v5, (v4 + 1));
  uint64_t v8 = objc_msgSend_recordsToSaveByID(self, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);

  int v12 = (void *)*MEMORY[0x1E4F1A548];
  if (v11)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v12);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v26 = v13;
      uint64_t v29 = objc_msgSend_recordsToSaveByID(self, v27, v28);
      uint64_t v32 = objc_msgSend_count(v29, v30, v31);
      v35 = objc_msgSend_recordsToSaveByID(self, v33, v34);
      uint64_t v38 = objc_msgSend_allKeys(v35, v36, v37);
      *(_DWORD *)buf = 134218242;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      v43 = v38;
      _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Saving %ld records: %@", buf, 0x16u);
    }
    uint64_t v14 = objc_opt_new();
    uint64_t v17 = objc_msgSend_recordsToSaveByID(self, v15, v16);
    int v20 = objc_msgSend_allValues(v17, v18, v19);
    objc_msgSend_setRecordsToSave_(v14, v21, (uint64_t)v20);

    objc_msgSend_setSavePolicy_(v14, v22, 1);
    uint64_t v23 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1C4DEE710;
    v39[3] = &unk_1E64F0210;
    v39[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v24, v23, v14, v39);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v12);
    }
    uint64_t v25 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEBUG, "We don't have any records to save, so bailing now.", buf, 2u);
    }
  }
}

- (_PCSIdentityData)_copyShareProtectionFromRecord:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = v6;
  if (!a4)
  {
    if (!v6)
    {
      uint64_t v10 = 0;
      goto LABEL_25;
    }
LABEL_5:
    uint64_t v11 = objc_msgSend_encryptedValues(v6, v7, v8);
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x1E4F19E08]);

    if (v13)
    {
      uint64_t v16 = objc_msgSend_container(self, v14, v15);
      uint64_t v19 = objc_msgSend_pcsManager(v16, v17, v18);
      id v44 = 0;
      uint64_t v10 = (_PCSIdentityData *)objc_msgSend_createSharingIdentityFromData_error_(v19, v20, (uint64_t)v13, &v44);
      id v21 = v44;

      if (v21 || !v10)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v32 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          v35 = v32;
          uint64_t v38 = objc_msgSend_recordID(v9, v36, v37);
          *(_DWORD *)buf = 138412802;
          uint64_t v46 = v38;
          __int16 v47 = 2112;
          id v48 = v21;
          __int16 v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_INFO, "Warn: Couldn't deserialize share protection data on record %@: %@.\nData was %@", buf, 0x20u);
        }
        if (a4)
        {
          v39 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v40 = *MEMORY[0x1E4F19DD8];
          uint64_t v41 = objc_msgSend_recordID(v9, v33, v34);
          objc_msgSend_errorWithDomain_code_error_format_(v39, v42, v40, 5001, v21, @"Couldn't deserialize share protection data on record %@", v41);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v10)
        {
          CFRelease(v10);
          uint64_t v10 = 0;
        }
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = v22;
        uint64_t v28 = objc_msgSend_recordID(v9, v26, v27);
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v28;
        _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_INFO, "Warn: Record %@ didn't have any share protection data on it", buf, 0xCu);
      }
      if (!a4)
      {
        uint64_t v10 = 0;
        goto LABEL_24;
      }
      uint64_t v29 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v30 = *MEMORY[0x1E4F19DD8];
      objc_msgSend_recordID(v9, v23, v24);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v29, v31, v30, 5001, @"Record %@ didn't contain any share protection data", v21);
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_24:
    goto LABEL_25;
  }
  *a4 = 0;
  if (v6) {
    goto LABEL_5;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't fetch record from the server");
  uint64_t v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v10;
}

- (void)_handleRecordFetched:(id)a3 recordID:(id)a4 error:(id)a5
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  uint64_t v10 = (__CFString *)a5;
  uint64_t v13 = objc_msgSend_recordIDsToShare(self, v11, v12);
  uint64_t v15 = objc_msgSend_containsObject_(v13, v14, (uint64_t)v9);

  if (v15)
  {
    uint64_t v18 = v111;
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    uint64_t v19 = sub_1C4DEFBDC;
LABEL_5:
    v18[2] = v19;
    v18[3] = &unk_1E64F33E8;
    v18[4] = self;
    uint64_t v23 = (void (**)(void *, id, id))_Block_copy(v18);
    uint64_t v24 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v25 = *MEMORY[0x1E4F1A550];
    if (v8 && !v10)
    {
      if (v25 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v24);
      }
      int v26 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v76 = @"un";
        if (v15) {
          v76 = &stru_1F2044F30;
        }
        *(_DWORD *)buf = 138412546;
        v113 = v9;
        __int16 v114 = 2114;
        v115 = v76;
        _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Fetched record with ID %@ from the server. Unwrapping sharing identity and %{public}@sharing the record", buf, 0x16u);
      }
      id v109 = 0;
      uint64_t v28 = (const void *)objc_msgSend__copyShareProtectionFromRecord_error_(self, v27, (uint64_t)v8, &v109);
      uint64_t v31 = (__CFString *)v109;
      if (!v31 && v28)
      {
        uint64_t v34 = objc_msgSend_recordPCS(v8, v29, v30);
        if (v34)
        {
          v106 = objc_msgSend_container(self, v32, v33);
          uint64_t v37 = objc_msgSend_pcsManager(v106, v35, v36);
          v39 = v37;
          if (v15) {
            objc_msgSend_addSharingIdentity_toSharePCS_permission_(v37, v38, (uint64_t)v28, v34, 0);
          }
          else {
            objc_msgSend_removeSharingIdentity_fromSharePCS_(v37, v38, (uint64_t)v28, v34);
          }
          uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

          CFRelease(v28);
          if (v31)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            __int16 v49 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              v50 = @"un";
              *(_DWORD *)buf = 138543874;
              if (v15) {
                v50 = &stru_1F2044F30;
              }
              v113 = v50;
              __int16 v114 = 2112;
              v115 = v9;
              __int16 v116 = 2112;
              v117 = v31;
              _os_log_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_INFO, "Warn: Error %{public}@sharing record %@: %@", buf, 0x20u);
            }
            v23[2](v23, v9, v31);
          }
          else
          {
            uint64_t v51 = objc_msgSend_pcsManager(v106, v47, v48);
            uint64_t v54 = objc_msgSend_pcsKeysToRemove(v8, v52, v53);
            long long v57 = objc_msgSend_protectionEtag(v8, v55, v56);
            uint64_t v59 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v51, v58, (uint64_t)v54, v34, v57, self);

            if (v59)
            {
              v108[0] = MEMORY[0x1E4F143A8];
              v108[1] = 3221225472;
              v108[2] = sub_1C4DEFECC;
              v108[3] = &unk_1E64F2E00;
              v108[4] = v59;
              objc_msgSend_updateCloudKitMetrics_(self, v60, (uint64_t)v108);
            }
            id v62 = objc_msgSend_protectionData(v8, v60, v61);
            id v64 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v63, (uint64_t)v62);
            objc_msgSend_setPreviousProtectionEtag_(v8, v65, (uint64_t)v64);

            __int16 v68 = objc_msgSend_pcsManager(v106, v66, v67);
            id v107 = 0;
            __int16 v70 = objc_msgSend_dataFromRecordPCS_error_(v68, v69, v34, &v107);
            uint64_t v31 = (__CFString *)v107;
            objc_msgSend_setProtectionData_(v8, v71, (uint64_t)v70);

            if (v31
              || (objc_msgSend_protectionData(v8, v72, v73),
                  v77 = objc_claimAutoreleasedReturnValue(),
                  BOOL v78 = v77 == 0,
                  v77,
                  v78))
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v74 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
              {
                v75 = @"un";
                *(_DWORD *)buf = 138543874;
                if (v15) {
                  v75 = &stru_1F2044F30;
                }
                v113 = v75;
                __int16 v114 = 2112;
                v115 = v9;
                __int16 v116 = 2112;
                v117 = v31;
                _os_log_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_INFO, "Warn: Error serializing record PCS data for %{public}@share of record %@: %@", buf, 0x20u);
              }
              v23[2](v23, v9, v31);
            }
            else
            {
              v80 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v79, v15);
              objc_msgSend_setObject_forKeyedSubscript_(v8, v81, (uint64_t)v80, *MEMORY[0x1E4F19E00]);

              v84 = objc_msgSend_recordIDsToShareReadWrite(self, v82, v83);
              int v86 = objc_msgSend_containsObject_(v84, v85, (uint64_t)v9);

              v88 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v87, v86 ^ 1u);
              objc_msgSend_setObject_forKeyedSubscript_(v8, v89, (uint64_t)v88, *MEMORY[0x1E4F19DF8]);

              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v90 = (NSObject **)MEMORY[0x1E4F1A500];
              v91 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                v100 = v15 ? &stru_1F2044F30 : @"un";
                v101 = v91;
                objc_msgSend_protectionData(v8, v102, v103);
                v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v113 = v9;
                __int16 v114 = 2114;
                v115 = v100;
                __int16 v116 = 2112;
                v117 = v104;
                _os_log_debug_impl(&dword_1C4CFF000, v101, OS_LOG_TYPE_DEBUG, "New protection data for record %@ after %{public}@sharing is %@", buf, 0x20u);

                v90 = (NSObject **)MEMORY[0x1E4F1A500];
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
              }
              v92 = *v90;
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                v105 = @"removed";
                if (v15) {
                  v105 = @"added";
                }
                *(_DWORD *)buf = 138543618;
                v113 = v105;
                __int16 v114 = 2112;
                v115 = v9;
                _os_log_debug_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_DEBUG, "Successfully %{public}@ sharing info to record %@. Preparing to save the record back to the server", buf, 0x16u);
              }
              v95 = objc_msgSend_recordsToSaveByID(self, v93, v94);
              objc_sync_enter(v95);
              v98 = objc_msgSend_recordsToSaveByID(self, v96, v97);
              objc_msgSend_setObject_forKeyedSubscript_(v98, v99, (uint64_t)v8, v9);

              objc_sync_exit(v95);
              uint64_t v31 = 0;
            }
          }
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v45 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v113 = v9;
            _os_log_debug_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_DEBUG, "Fetched record %@ had no PCS data", buf, 0xCu);
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v46, *MEMORY[0x1E4F19DD8], 5001, @"Fetched record %@ had no PCS data", v9);
          uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v23[2](v23, v9, v31);
          CFRelease(v28);
        }
LABEL_68:

        uint64_t v10 = (__CFString *)v23;
        goto LABEL_69;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v43 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v113 = v9;
        __int16 v114 = 2112;
        v115 = v31;
        _os_log_debug_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_DEBUG, "Error getting share identity from record %@: %@", buf, 0x16u);
        if (v31)
        {
LABEL_30:
          v23[2](v23, v9, v31);
          if (v28) {
            CFRelease(v28);
          }
          goto LABEL_68;
        }
      }
      else if (v31)
      {
        goto LABEL_30;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v44, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't get a web sharing identity from record %@", v9);
      uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (v25 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v24);
    }
    uint64_t v40 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v113 = v9;
      __int16 v114 = 2112;
      v115 = v10;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Couldn't fetch record %@ from the server: %@", buf, 0x16u);
      if (v10) {
        goto LABEL_20;
      }
    }
    else if (v10)
    {
LABEL_20:
      v23[2](v23, v9, v10);

      goto LABEL_69;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v41, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't find record %@ on the server", v9);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  int v20 = objc_msgSend_recordIDsToUnshare(self, v16, v17);
  int v22 = objc_msgSend_containsObject_(v20, v21, (uint64_t)v9);

  if (v22)
  {
    uint64_t v18 = aBlock;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    uint64_t v19 = sub_1C4DEFD58;
    goto LABEL_5;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  __int16 v42 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v113 = v9;
    _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Received a record ID that we don't know anything about: %@", buf, 0xCu);
  }
LABEL_69:
}

- (void)_fetchRecords
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  int v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_recordIDsToShare(self, v5, v6);
  objc_msgSend_addObjectsFromArray_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_recordIDsToUnshare(self, v9, v10);
  objc_msgSend_addObjectsFromArray_(v4, v12, (uint64_t)v11);

  objc_msgSend_setRecordIDs_(v3, v13, (uint64_t)v4);
  uint64_t v14 = *MEMORY[0x1E4F19DF0];
  v23[0] = *MEMORY[0x1E4F19E08];
  v23[1] = v14;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v23, 2);
  objc_msgSend_setDesiredKeys_(v3, v17, (uint64_t)v16);

  uint64_t v18 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4DF00B8;
  v21[3] = &unk_1E64F0260;
  v21[4] = self;
  id v22 = v4;
  id v19 = v4;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v20, v18, v3, v21);
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v3;
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    int v20 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 1, 0, 0);
    uint64_t v23 = objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    uint64_t v25 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v24, 0, 1, 0);
    uint64_t v28 = objc_msgSend_CKPropertiesStyleString(v25, v26, v27);
    int v29 = 138544130;
    uint64_t v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = self;
    __int16 v33 = 2114;
    uint64_t v34 = v23;
    __int16 v35 = 2112;
    uint64_t v36 = v28;
    _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Starting web share operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v29,
      0x2Au);
  }
  uint64_t v6 = objc_msgSend_recordIDsToShare(self, v4, v5);
  if (objc_msgSend_count(v6, v7, v8))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_recordIDsToUnshare(self, v9, v10);
    BOOL v11 = objc_msgSend_count(v12, v13, v14) == 0;
  }
  objc_msgSend_makeStateTransition_(self, v15, v11);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v8 = objc_msgSend_recordIDsToShare(self, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v58, v64, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v59;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v58 + 1) + 8 * v15), v11, v12);
        objc_msgSend_addObject_(v5, v17, (uint64_t)v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v58, v64, 16);
    }
    while (v13);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  int v20 = objc_msgSend_recordIDsToUnshare(self, v18, v19);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v54, v63, 16);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = *(void *)v55;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v55 != v26) {
          objc_enumerationMutation(v20);
        }
        uint64_t v28 = objc_msgSend_zoneID(*(void **)(*((void *)&v54 + 1) + 8 * v27), v23, v24);
        objc_msgSend_addObject_(v5, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v54, v63, 16);
    }
    while (v25);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v32 = objc_msgSend_recordIDsToShareReadWrite(self, v30, v31);
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v50, v62, 16);
  if (v34)
  {
    uint64_t v37 = v34;
    uint64_t v38 = *(void *)v51;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v51 != v38) {
          objc_enumerationMutation(v32);
        }
        uint64_t v40 = objc_msgSend_zoneID(*(void **)(*((void *)&v50 + 1) + 8 * v39), v35, v36);
        objc_msgSend_addObject_(v5, v41, (uint64_t)v40);

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v50, v62, 16);
    }
    while (v37);
  }

  if (objc_msgSend_count(v5, v42, v43))
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_1C4DF0AF8;
    v48[3] = &unk_1E64F1D18;
    id v49 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v45, (uint64_t)v48);
  }
  objc_msgSend_setRecordWebSharedBlock_(self, v44, 0);
  objc_msgSend_setRecordWebUnsharedBlock_(self, v46, 0);
  v47.receiver = self;
  v47.super_class = (Class)CKDModifyWebSharingOperation;
  [(CKDOperation *)&v47 _finishOnCallbackQueueWithError:v4];
}

- (id)recordWebSharedBlock
{
  return self->_recordWebSharedBlock;
}

- (void)setRecordWebSharedBlock:(id)a3
{
}

- (id)recordWebUnsharedBlock
{
  return self->_recordWebUnsharedBlock;
}

- (void)setRecordWebUnsharedBlock:(id)a3
{
}

- (NSArray)recordIDsToShare
{
  return self->_recordIDsToShare;
}

- (void)setRecordIDsToShare:(id)a3
{
}

- (NSArray)recordIDsToUnshare
{
  return self->_recordIDsToUnshare;
}

- (void)setRecordIDsToUnshare:(id)a3
{
}

- (NSArray)recordIDsToShareReadWrite
{
  return self->_recordIDsToShareReadWrite;
}

- (void)setRecordIDsToShareReadWrite:(id)a3
{
}

- (NSMutableSet)fetchedRecordIDs
{
  return self->_fetchedRecordIDs;
}

- (void)setFetchedRecordIDs:(id)a3
{
}

- (NSMutableDictionary)recordsToSaveByID
{
  return self->_recordsToSaveByID;
}

- (void)setRecordsToSaveByID:(id)a3
{
}

- (int)numSaveAttempts
{
  return self->_numSaveAttempts;
}

- (void)setNumSaveAttempts:(int)a3
{
  self->_numSaveAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsToSaveByID, 0);
  objc_storeStrong((id *)&self->_fetchedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIDsToShareReadWrite, 0);
  objc_storeStrong((id *)&self->_recordIDsToUnshare, 0);
  objc_storeStrong((id *)&self->_recordIDsToShare, 0);
  objc_storeStrong(&self->_recordWebUnsharedBlock, 0);
  objc_storeStrong(&self->_recordWebSharedBlock, 0);
}

@end