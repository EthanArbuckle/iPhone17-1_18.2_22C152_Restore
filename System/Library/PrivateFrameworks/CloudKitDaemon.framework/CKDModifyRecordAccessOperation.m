@interface CKDModifyRecordAccessOperation
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)makeStateTransition;
- (CKDModifyRecordAccessOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)recordIDsToGrant;
- (NSArray)recordIDsToRevoke;
- (NSMutableDictionary)recordsToSaveByID;
- (NSMutableSet)fetchedRecordIDs;
- (_PCSIdentityData)_copyShareProtectionFromRecord:(id)a3 error:(id *)a4;
- (id)accessWasGrantedBlock;
- (id)accessWasRevokedBlock;
- (id)activityCreate;
- (id)relevantZoneIDs;
- (int)numSaveAttempts;
- (void)_fetchRecords;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordFetched:(id)a3 recordID:(id)a4 error:(id)a5;
- (void)_handleRecordSaved:(id)a3 error:(id)a4;
- (void)_saveRecords;
- (void)main;
- (void)setAccessWasGrantedBlock:(id)a3;
- (void)setAccessWasRevokedBlock:(id)a3;
- (void)setFetchedRecordIDs:(id)a3;
- (void)setNumSaveAttempts:(int)a3;
- (void)setRecordIDsToGrant:(id)a3;
- (void)setRecordIDsToRevoke:(id)a3;
- (void)setRecordsToSaveByID:(id)a3;
@end

@implementation CKDModifyRecordAccessOperation

- (CKDModifyRecordAccessOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDModifyRecordAccessOperation;
  v9 = [(CKDDatabaseOperation *)&v21 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordIDsToGrant(v6, v7, v8);
    recordIDsToGrant = v9->_recordIDsToGrant;
    v9->_recordIDsToGrant = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_recordIDsToRevoke(v6, v12, v13);
    recordIDsToRevoke = v9->_recordIDsToRevoke;
    v9->_recordIDsToRevoke = (NSArray *)v14;

    uint64_t v16 = objc_opt_new();
    recordsToSaveByID = v9->_recordsToSaveByID;
    v9->_recordsToSaveByID = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    fetchedRecordIDs = v9->_fetchedRecordIDs;
    v9->_fetchedRecordIDs = (NSMutableSet *)v18;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/modify-record-access", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (id)relevantZoneIDs
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordIDsToGrant(self, a2, v2);
  v7 = objc_msgSend_recordIDsToRevoke(self, v5, v6);
  if (!objc_msgSend_count(v4, v8, v9))
  {
    if (!objc_msgSend_count(v7, v10, v11))
    {
      v12 = 0;
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  v12 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v4;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, v45, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v13);
        }
        v22 = objc_msgSend_zoneID(*(void **)(*((void *)&v40 + 1) + 8 * i), v16, v17);
        if (v22) {
          objc_msgSend_addObject_(v12, v21, (uint64_t)v22);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v40, v45, 16);
    }
    while (v18);
  }

  if (objc_msgSend_count(v7, v23, v24))
  {
    if (v12)
    {
LABEL_16:
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v25 = v7;
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v36, v44, 16);
      if (v27)
      {
        uint64_t v30 = v27;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v25);
            }
            v34 = objc_msgSend_zoneID(*(void **)(*((void *)&v36 + 1) + 8 * j), v28, v29, (void)v36);
            if (v34) {
              objc_msgSend_addObject_(v12, v33, (uint64_t)v34);
            }
          }
          uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v36, v44, 16);
        }
        while (v30);
      }

      goto LABEL_26;
    }
LABEL_15:
    v12 = objc_opt_new();
    goto LABEL_16;
  }
LABEL_26:

  return v12;
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
      uint64_t v15 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v13, v14);
      int v18 = objc_msgSend_PCSRetryCount(v15, v16, v17);

      if (v12 < v18) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    id v25 = objc_msgSend_error(self, v23, v24);
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
    v7.super_class = (Class)&OBJC_METACLASS___CKDModifyRecordAccessOperation;
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
  uint64_t v10 = objc_msgSend_recordIDsToGrant(self, v8, v9);
  int v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v6);

  id v13 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v14 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v15 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v50 = @"revocation";
    if (v12) {
      v50 = @"grant";
    }
    v51 = @" with error ";
    *(_DWORD *)buf = 138544130;
    v67 = v50;
    __int16 v68 = 2112;
    id v69 = v6;
    if (!v7) {
      v51 = &stru_1F2044F30;
    }
    __int16 v70 = 2114;
    v71 = v51;
    if (v7) {
      v52 = v7;
    }
    else {
      v52 = &stru_1F2044F30;
    }
    __int16 v72 = 2112;
    v73 = v52;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Record for access %{public}@ (%@) was saved%{public}@%@", buf, 0x2Au);
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
      v53 = @"revoke";
      if (v12) {
        v53 = @"grant";
      }
      *(_DWORD *)buf = 138543618;
      v67 = v53;
      __int16 v68 = 2112;
      id v69 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Oplock failure while trying to %{public}@ access on record %@. Retrying.", buf, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      uint64_t v27 = objc_msgSend_recordsToSaveByID(self, v18, v19);
      uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v6);

      v32 = objc_msgSend_encryptedValues(v29, v30, v31);
      v34 = objc_msgSend_objectForKeyedSubscript_(v32, v33, *MEMORY[0x1E4F19CF8]);

      long long v36 = objc_msgSend_objectForKeyedSubscript_(v29, v35, *MEMORY[0x1E4F19DF0]);
      long long v39 = objc_msgSend_accessWasGrantedBlock(self, v37, v38);

      if (v39)
      {
        long long v42 = objc_msgSend_callbackQueue(self, v40, v41);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4DF1E4C;
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
      v45 = objc_msgSend_accessWasRevokedBlock(self, v18, v19);

      if (v45)
      {
        uint64_t v46 = objc_msgSend_callbackQueue(self, v43, v44);
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = sub_1C4DF1ED4;
        v57 = &unk_1E64F0120;
        v58 = self;
        id v59 = v6;
        v60 = v7;
        dispatch_async(v46, &v54);
      }
    }
    v47 = objc_msgSend_recordsToSaveByID(self, v43, v44, v54, v55, v56, v57, v58);
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
    id v13 = (void *)*MEMORY[0x1E4F1A500];
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
      long long v43 = v38;
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
    v39[2] = sub_1C4DF21E0;
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
      goto LABEL_24;
    }
LABEL_5:
    uint64_t v11 = objc_msgSend_encryptedValues(v6, v7, v8);
    id v13 = objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x1E4F19CF8]);

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
        uint64_t v28 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = v28;
          uint64_t v34 = objc_msgSend_recordID(v9, v32, v33);
          *(_DWORD *)buf = 138412802;
          uint64_t v46 = v34;
          __int16 v47 = 2112;
          id v48 = v21;
          __int16 v49 = 2112;
          v50 = v13;
          _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Warn: Couldn't deserialize access token protection data on record %@: %@.\nData was %@", buf, 0x20u);
        }
        if (a4)
        {
          v35 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v36 = *MEMORY[0x1E4F19DD8];
          uint64_t v37 = objc_msgSend_recordID(v9, v29, v30);
          objc_msgSend_errorWithDomain_code_error_format_(v35, v38, v36, 5001, v21, @"Couldn't deserialize access token protection data on record %@", v37);
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
      goto LABEL_22;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      long long v40 = v22;
      long long v43 = objc_msgSend_recordID(v9, v41, v42);
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v43;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Record %@ didn't have any access token protection data on it", buf, 0xCu);

      if (a4) {
        goto LABEL_13;
      }
    }
    else if (a4)
    {
LABEL_13:
      uint64_t v25 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v26 = *MEMORY[0x1E4F19DD8];
      objc_msgSend_recordID(v9, v23, v24);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v25, v27, v26, 5001, @"Record %@ didn't contain any access token protection data", v21);
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  *a4 = 0;
  if (v6) {
    goto LABEL_5;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't fetch record from the server");
  uint64_t v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v10;
}

- (void)_handleRecordFetched:(id)a3 recordID:(id)a4 error:(id)a5
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  uint64_t v10 = (__CFString *)a5;
  v118 = objc_msgSend_container(self, v11, v12);
  if (v8)
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v8, v13, *MEMORY[0x1E4F19DF0]);
    objc_msgSend_setBaseToken_(v8, v16, (uint64_t)v15);
  }
  uint64_t v17 = objc_msgSend_recordIDsToGrant(self, v13, v14);
  uint64_t v19 = objc_msgSend_containsObject_(v17, v18, (uint64_t)v9);

  if (v19)
  {
    uint64_t v22 = v125;
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    uint64_t v23 = sub_1C4DF3850;
    goto LABEL_7;
  }
  uint64_t v24 = objc_msgSend_recordIDsToRevoke(self, v20, v21);
  int v26 = objc_msgSend_containsObject_(v24, v25, (uint64_t)v9);

  if (v26)
  {
    uint64_t v22 = aBlock;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    uint64_t v23 = sub_1C4DF39CC;
LABEL_7:
    v22[2] = v23;
    v22[3] = &unk_1E64F33E8;
    v22[4] = self;
    uint64_t v27 = (void (**)(void *, id, id))_Block_copy(v22);
    uint64_t v28 = (void *)*MEMORY[0x1E4F1A548];
    if (((v10 == 0) & ~(v8 == 0)) == 0)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v28);
      }
      uint64_t v29 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v127 = v9;
        __int16 v128 = 2112;
        v129 = v10;
        _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Couldn't fetch record %@ from the server: %@", buf, 0x16u);
        if (v10) {
          goto LABEL_13;
        }
      }
      else if (v10)
      {
LABEL_13:
        v27[2](v27, v9, v10);

        goto LABEL_85;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v30, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't find record %@ on the server", v9);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v28);
    }
    uint64_t v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v97 = @"revoking";
      if (v19) {
        v97 = @"granting";
      }
      *(_DWORD *)buf = 138412546;
      v127 = v9;
      __int16 v128 = 2114;
      v129 = v97;
      _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Fetched record with ID %@ from the server. Unwrapping access token and %{public}@ access to the record", buf, 0x16u);
    }
    id v123 = 0;
    RandomSharingIdentityWithError = (const void *)objc_msgSend__copyShareProtectionFromRecord_error_(self, v32, (uint64_t)v8, &v123);
    uint64_t v34 = (__CFString *)v123;
    uint64_t v37 = v34;
    if (v34 || !RandomSharingIdentityWithError)
    {
      if (!v19)
      {
        if (!v34)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v35, *MEMORY[0x1E4F19DD8], 2003, @"Record %@ didn't have an access token so it can't be revoked", v9);
          uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v27[2](v27, v9, v37);
        if (RandomSharingIdentityWithError) {
          CFRelease(RandomSharingIdentityWithError);
        }
        goto LABEL_84;
      }
      if (RandomSharingIdentityWithError) {
        CFRelease(RandomSharingIdentityWithError);
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      __int16 v49 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v127 = v9;
        __int16 v128 = 2112;
        v129 = v37;
        _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Record %@ had no access token on it. Creating a new one. (%@)", buf, 0x16u);
      }

      v52 = objc_msgSend_pcsManager(v118, v50, v51);
      id v122 = 0;
      RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(v52, v53, (uint64_t)&v122);
      uint64_t v37 = (__CFString *)v122;

      if (v37 || !RandomSharingIdentityWithError)
      {
        if (!v37)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v35, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't create an access token identity for record %@", v9);
          uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v27[2](v27, v9, v37);
        if (RandomSharingIdentityWithError) {
          CFRelease(RandomSharingIdentityWithError);
        }
        goto LABEL_84;
      }
    }
    else if (!v19)
    {
      uint64_t v38 = objc_msgSend_encryptedValues(v8, v35, v36);
      objc_msgSend_setObject_forKeyedSubscript_(v38, v39, 0, *MEMORY[0x1E4F19CF8]);

      uint64_t v44 = objc_msgSend_recordPCS(v8, v40, v41);
      if (v44)
      {
        v45 = objc_msgSend_pcsManager(v118, v42, v43);
        uint64_t v47 = objc_msgSend_removeSharingIdentity_fromSharePCS_(v45, v46, (uint64_t)RandomSharingIdentityWithError, v44);
        goto LABEL_39;
      }
      goto LABEL_54;
    }
    uint64_t v54 = objc_msgSend_pcsManager(v118, v35, v36);
    id v121 = 0;
    v56 = objc_msgSend_dataFromSharingIdentity_error_(v54, v55, (uint64_t)RandomSharingIdentityWithError, &v121);
    uint64_t v37 = (__CFString *)v121;

    if (v37 || !v56)
    {
      if (!v37)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v57, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't create access token data for record %@", v9);
        uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v27[2](v27, v9, v37);
      CFRelease(RandomSharingIdentityWithError);

      goto LABEL_84;
    }
    id v59 = objc_msgSend_encryptedValues(v8, v57, v58);
    objc_msgSend_setObject_forKeyedSubscript_(v59, v60, (uint64_t)v56, *MEMORY[0x1E4F19CF8]);

    uint64_t v44 = objc_msgSend_recordPCS(v8, v61, v62);
    if (v44)
    {
      v45 = objc_msgSend_pcsManager(v118, v63, v64);
      uint64_t v47 = objc_msgSend_addSharingIdentity_toSharePCS_permission_(v45, v65, (uint64_t)RandomSharingIdentityWithError, v44, 0);
LABEL_39:
      uint64_t v37 = (__CFString *)v47;

      CFRelease(RandomSharingIdentityWithError);
      if (v37)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        __int16 v68 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          id v69 = @"revoking";
          *(_DWORD *)buf = 138543874;
          if (v19) {
            id v69 = @"granting";
          }
          v127 = v69;
          __int16 v128 = 2112;
          v129 = v9;
          __int16 v130 = 2112;
          v131 = v37;
          _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Warn: Error %{public}@ access to record %@: %@", buf, 0x20u);
        }
        v27[2](v27, v9, v37);
      }
      else
      {
        __int16 v72 = objc_msgSend_pcsManager(v118, v66, v67);
        v75 = objc_msgSend_pcsKeysToRemove(v8, v73, v74);
        v78 = objc_msgSend_protectionEtag(v8, v76, v77);
        uint64_t v80 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v72, v79, (uint64_t)v75, v44, v78, self);

        if (v80)
        {
          v120[0] = MEMORY[0x1E4F143A8];
          v120[1] = 3221225472;
          v120[2] = sub_1C4DF3B40;
          v120[3] = &unk_1E64F2E00;
          v120[4] = v80;
          objc_msgSend_updateCloudKitMetrics_(self, v81, (uint64_t)v120);
        }
        v83 = objc_msgSend_protectionData(v8, v81, v82);
        v85 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v84, (uint64_t)v83);
        objc_msgSend_setPreviousProtectionEtag_(v8, v86, (uint64_t)v85);

        v89 = objc_msgSend_pcsManager(v118, v87, v88);
        id v119 = 0;
        v91 = objc_msgSend_dataFromRecordPCS_error_(v89, v90, v44, &v119);
        uint64_t v37 = (__CFString *)v119;
        objc_msgSend_setProtectionData_(v8, v92, (uint64_t)v91);

        if (v37
          || (objc_msgSend_protectionData(v8, v93, v94),
              v98 = objc_claimAutoreleasedReturnValue(),
              BOOL v99 = v98 == 0,
              v98,
              v99))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v95 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            v96 = @"revocation";
            *(_DWORD *)buf = 138543874;
            if (v19) {
              v96 = @"grant";
            }
            v127 = v96;
            __int16 v128 = 2112;
            v129 = v9;
            __int16 v130 = 2112;
            v131 = v37;
            _os_log_impl(&dword_1C4CFF000, v95, OS_LOG_TYPE_INFO, "Warn: Error serializing record PCS data for access %{public}@ of record %@: %@", buf, 0x20u);
          }
          v27[2](v27, v9, v37);
        }
        else
        {
          v101 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v100, v19);
          objc_msgSend_setObject_forKeyedSubscript_(v8, v102, (uint64_t)v101, *MEMORY[0x1E4F19CF0]);

          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v103 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v112 = v19 ? @"granting" : @"revoking";
            v113 = v103;
            objc_msgSend_protectionData(v8, v114, v115);
            v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v127 = v9;
            __int16 v128 = 2114;
            v129 = v112;
            __int16 v130 = 2112;
            v131 = v116;
            _os_log_debug_impl(&dword_1C4CFF000, v113, OS_LOG_TYPE_DEBUG, "New protection data for record %@ after %{public}@ access is %@", buf, 0x20u);

            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
          }
          v104 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v117 = @"removed";
            if (v19) {
              v117 = @"added";
            }
            *(_DWORD *)buf = 138543618;
            v127 = v117;
            __int16 v128 = 2112;
            v129 = v9;
            _os_log_debug_impl(&dword_1C4CFF000, v104, OS_LOG_TYPE_DEBUG, "Successfully %{public}@ sharing info to record %@. Preparing to save the record back to the server", buf, 0x16u);
          }
          v107 = objc_msgSend_recordsToSaveByID(self, v105, v106);
          objc_sync_enter(v107);
          v110 = objc_msgSend_recordsToSaveByID(self, v108, v109);
          objc_msgSend_setObject_forKeyedSubscript_(v110, v111, (uint64_t)v8, v9);

          objc_sync_exit(v107);
          uint64_t v37 = 0;
        }
      }
LABEL_84:

      uint64_t v10 = (__CFString *)v27;
      goto LABEL_85;
    }
LABEL_54:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v70 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v127 = v9;
      _os_log_debug_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_DEBUG, "Fetched record %@ had no PCS data", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v71, *MEMORY[0x1E4F19DD8], 5001, @"Fetched record %@ had no PCS data", v9);
    uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v27[2](v27, v9, v37);
    CFRelease(RandomSharingIdentityWithError);
    goto LABEL_84;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v48 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v127 = v9;
    _os_log_error_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_ERROR, "Received a record ID that we don't know anything about: %@", buf, 0xCu);
  }
LABEL_85:
}

- (void)_fetchRecords
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  int v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_recordIDsToGrant(self, v5, v6);
  objc_msgSend_addObjectsFromArray_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_recordIDsToRevoke(self, v9, v10);
  objc_msgSend_addObjectsFromArray_(v4, v12, (uint64_t)v11);

  objc_msgSend_setRecordIDs_(v3, v13, (uint64_t)v4);
  uint64_t v14 = *MEMORY[0x1E4F19DF0];
  v23[0] = *MEMORY[0x1E4F19CF8];
  v23[1] = v14;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v23, 2);
  objc_msgSend_setDesiredKeys_(v3, v17, (uint64_t)v16);

  uint64_t v18 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4DF3D2C;
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
    _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Starting web access modification operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v29,
      0x2Au);
  }
  uint64_t v6 = objc_msgSend_recordIDsToGrant(self, v4, v5);
  if (objc_msgSend_count(v6, v7, v8))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_recordIDsToRevoke(self, v9, v10);
    BOOL v11 = objc_msgSend_count(v12, v13, v14) == 0;
  }
  objc_msgSend_makeStateTransition_(self, v15, v11);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = objc_msgSend_recordIDsToGrant(self, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, v47, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v43;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v42 + 1) + 8 * v15), v11, v12);
        objc_msgSend_addObject_(v5, v17, (uint64_t)v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, v47, 16);
    }
    while (v13);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  int v20 = objc_msgSend_recordIDsToRevoke(self, v18, v19);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, v46, 16);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = *(void *)v39;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v20);
        }
        uint64_t v28 = objc_msgSend_zoneID(*(void **)(*((void *)&v38 + 1) + 8 * v27), v23, v24);
        objc_msgSend_addObject_(v5, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v38, v46, 16);
    }
    while (v25);
  }

  if (objc_msgSend_count(v5, v30, v31))
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1C4DF46C4;
    v36[3] = &unk_1E64F1D18;
    id v37 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v33, (uint64_t)v36);
  }
  objc_msgSend_setAccessWasGrantedBlock_(self, v32, 0);
  objc_msgSend_setAccessWasRevokedBlock_(self, v34, 0);
  v35.receiver = self;
  v35.super_class = (Class)CKDModifyRecordAccessOperation;
  [(CKDOperation *)&v35 _finishOnCallbackQueueWithError:v4];
}

- (id)accessWasGrantedBlock
{
  return self->_accessWasGrantedBlock;
}

- (void)setAccessWasGrantedBlock:(id)a3
{
}

- (id)accessWasRevokedBlock
{
  return self->_accessWasRevokedBlock;
}

- (void)setAccessWasRevokedBlock:(id)a3
{
}

- (NSArray)recordIDsToGrant
{
  return self->_recordIDsToGrant;
}

- (void)setRecordIDsToGrant:(id)a3
{
}

- (NSArray)recordIDsToRevoke
{
  return self->_recordIDsToRevoke;
}

- (void)setRecordIDsToRevoke:(id)a3
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
  objc_storeStrong((id *)&self->_recordIDsToRevoke, 0);
  objc_storeStrong((id *)&self->_recordIDsToGrant, 0);
  objc_storeStrong(&self->_accessWasRevokedBlock, 0);
  objc_storeStrong(&self->_accessWasGrantedBlock, 0);
}

@end