@interface CKDFetchShareParticipantKeyOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)hasAttemptedShareUpdate;
- (BOOL)makeStateTransition;
- (CKDFetchShareParticipantKeyOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSDictionary)baseTokensByShareID;
- (NSDictionary)childRecordIDsByShareID;
- (NSMutableArray)shareIDs;
- (NSMutableDictionary)sharesNeedingUpdateByID;
- (id)activityCreate;
- (id)relevantZoneIDs;
- (id)shareParticipantKeyFetchedBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleFetchedShare:(id)a3 withID:(id)a4 error:(id)a5;
- (void)_participantKeyFromShare:(id)a3 completionHandler:(id)a4;
- (void)_performCallbackForShareID:(id)a3 withParticipantKey:(id)a4 error:(id)a5;
- (void)_sendErrorForFailedShares;
- (void)fetchSharesFromServer;
- (void)main;
- (void)setBaseTokensByShareID:(id)a3;
- (void)setChildRecordIDsByShareID:(id)a3;
- (void)setHasAttemptedShareUpdate:(BOOL)a3;
- (void)setShareIDs:(id)a3;
- (void)setShareParticipantKeyFetchedBlock:(id)a3;
- (void)setSharesNeedingUpdateByID:(id)a3;
- (void)updateShares;
@end

@implementation CKDFetchShareParticipantKeyOperation

- (CKDFetchShareParticipantKeyOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchShareParticipantKeyOperation;
  v9 = [(CKDDatabaseOperation *)&v26 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_shareIDs(v6, v7, v8);
    uint64_t v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    shareIDs = v9->_shareIDs;
    v9->_shareIDs = (NSMutableArray *)v13;

    uint64_t v17 = objc_msgSend_baseTokensByShareID(v6, v15, v16);
    baseTokensByShareID = v9->_baseTokensByShareID;
    v9->_baseTokensByShareID = (NSDictionary *)v17;

    uint64_t v21 = objc_msgSend_childRecordIDsByShareID(v6, v19, v20);
    childRecordIDsByShareID = v9->_childRecordIDsByShareID;
    v9->_childRecordIDsByShareID = (NSDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    sharesNeedingUpdateByID = v9->_sharesNeedingUpdateByID;
    v9->_sharesNeedingUpdateByID = (NSMutableDictionary *)v23;
  }
  return v9;
}

- (id)relevantZoneIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_shareIDs(self, a2, v2);
  if (objc_msgSend_count(v3, v4, v5))
  {
    id v6 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v18 + 1) + 8 * i), v10, v11, (void)v18);
          if (v16) {
            objc_msgSend_addObject_(v6, v15, (uint64_t)v16);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
      }
      while (v12);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      goto LABEL_4;
    case 2:
      uint64_t v9 = objc_msgSend_sharesNeedingUpdateByID(self, v5, v6);
      if (objc_msgSend_count(v9, v10, v11))
      {
        char hasAttemptedShareUpdate = objc_msgSend_hasAttemptedShareUpdate(self, v12, v13);

        if ((hasAttemptedShareUpdate & 1) == 0)
        {
          objc_msgSend_setState_(self, v15, 3);
          objc_msgSend_setHasAttemptedShareUpdate_(self, v17, 1);
          objc_msgSend_updateShares(self, v18, v19);
          return 1;
        }
      }
      else
      {
      }
      objc_msgSend__sendErrorForFailedShares(self, v15, v16);
      objc_msgSend_setState_(self, v20, 0xFFFFFFFFLL);
      uint64_t v23 = objc_msgSend_error(self, v21, v22);
      objc_msgSend_finishWithError_(self, v24, (uint64_t)v23);

      return 1;
    case 1:
LABEL_4:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend_fetchSharesFromServer(self, v7, v8);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = @"Fetching Shares";
  }
  else if (a3 == 3)
  {
    uint64_t v5 = @"Updating Shares";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchShareParticipantKeyOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-share-participant-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_performCallbackForShareID:(id)a3 withParticipantKey:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_shareParticipantKeyFetchedBlock(self, v11, v12);

  if (v13)
  {
    v14 = (void *)*MEMORY[0x1E4F1A548];
    if (v9)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v14);
      }
      v15 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      long long v18 = "Returning participant key for share %@";
      uint64_t v19 = v15;
      uint32_t v20 = 12;
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v14);
      }
      long long v21 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v10;
      long long v18 = "Returning error for share %@: %@";
      uint64_t v19 = v21;
      uint32_t v20 = 22;
    }
    _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
LABEL_10:
    uint64_t v22 = objc_msgSend_callbackQueue(self, v16, v17);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1C4F98860;
    v23[3] = &unk_1E64F0DF0;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    id v26 = v10;
    dispatch_async(v22, v23);
  }
}

- (void)_sendErrorForFailedShares
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = objc_msgSend_sharesNeedingUpdateByID(self, a2, v2);
  objc_super v7 = objc_msgSend_allKeys(v4, v5, v6);

  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    uint64_t v13 = *MEMORY[0x1E4F19DD8];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, v13, 2043, @"Share %@ couldn't be upgraded", v15);
        objc_msgSend__performCallbackForShareID_withParticipantKey_error_(self, v17, v15, 0, v16);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
    }
    while (v11);
  }
}

- (void)_participantKeyFromShare:(id)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = sub_1C4F98FBC;
  v92 = sub_1C4F98FCC;
  id v93 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_1C4F98FBC;
  v86 = sub_1C4F98FCC;
  id v87 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_1C4F98FBC;
  v80 = sub_1C4F98FCC;
  id v81 = 0;
  id v10 = objc_msgSend_childRecordIDsByShareID(self, v8, v9);
  uint64_t v13 = objc_msgSend_recordID(v6, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v10, v14, (uint64_t)v13);

  long long v18 = objc_msgSend_container(self, v16, v17);
  uint64_t v23 = objc_msgSend_shortToken(v6, v19, v20);
  if (!v23)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v36 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v66 = objc_msgSend_recordID(v6, v37, v38);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v66;
      _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Couldn't get a short token for share %@", (uint8_t *)location, 0xCu);
    }
    v39 = (void *)MEMORY[0x1E4F1A280];
    v42 = objc_msgSend_recordID(v6, v40, v41);
    uint64_t v44 = objc_msgSend_errorWithDomain_code_format_(v39, v43, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't get a short token for share %@", v42);
    v45 = (void *)v83[5];
    v83[5] = v44;

    uint64_t v46 = 0;
    uint64_t v47 = v83[5];
    goto LABEL_13;
  }
  if (objc_msgSend_publicPermission(v6, v21, v22) != 1)
  {
    v48 = NSString;
    v51 = objc_msgSend_containerScopedUserID(v18, v24, v25);
    if (v15)
    {
      v52 = objc_msgSend_recordName(v15, v49, v50);
      v55 = objc_msgSend_CKBase64EncodedURLSafeString(v52, v53, v54);
      uint64_t v57 = objc_msgSend_stringWithFormat_(v48, v56, @"v3:%@:%@:%@", v23, v51, v55);
      v58 = (void *)v89[5];
      v89[5] = v57;
    }
    else
    {
      uint64_t v59 = objc_msgSend_stringWithFormat_(v48, v49, @"v1:%@:%@", v23, v51);
      v52 = (void *)v89[5];
      v89[5] = v59;
    }

    v61 = objc_msgSend_dataUsingEncoding_((void *)v89[5], v60, 4);
    uint64_t v64 = objc_msgSend_CKBase64URLSafeString(v61, v62, v63);
    v65 = (void *)v77[5];
    v77[5] = v64;

    uint64_t v47 = 0;
    uint64_t v46 = v77[5];
LABEL_13:
    v7[2](v7, v46, v47);
    goto LABEL_14;
  }
  objc_initWeak(location, v18);
  id v28 = objc_msgSend_pcsManager(v18, v26, v27);
  uint64_t v31 = objc_msgSend_currentUserParticipant(v6, v29, v30);
  v34 = objc_msgSend_protectionInfo(v31, v32, v33);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1C4F98FD4;
  v67[3] = &unk_1E64F7938;
  objc_copyWeak(&v75, location);
  v71 = v7;
  v72 = &v82;
  id v68 = v15;
  v73 = &v88;
  id v69 = v23;
  id v70 = v6;
  v74 = &v76;
  objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v28, v35, (uint64_t)v34, 4, 2, v67);

  objc_destroyWeak(&v75);
  objc_destroyWeak(location);
LABEL_14:

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
}

- (void)_handleFetchedShare:(id)a3 withID:(id)a4 error:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    goto LABEL_15;
  }
  if (!v8)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't fetch a share with ID %@", v9);
LABEL_14:
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v35 = v10;
    objc_msgSend__performCallbackForShareID_withParticipantKey_error_(self, v11, (uint64_t)v9, 0, v10);

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 2020, @"Item with ID %@ was not a share", v9);
    goto LABEL_14;
  }
  v14 = objc_msgSend_baseTokensByShareID(self, v12, v13);
  uint64_t v17 = objc_msgSend_recordID(v8, v15, v16);
  long long v19 = objc_msgSend_objectForKeyedSubscript_(v14, v18, (uint64_t)v17);
  objc_msgSend_setBaseToken_(v8, v20, (uint64_t)v19);

  uint64_t v23 = objc_msgSend_baseToken(v8, v21, v22);

  if (v23)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v26 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v50 = v26;
      v53 = objc_msgSend_baseToken(v8, v51, v52);
      v56 = objc_msgSend_recordID(v8, v54, v55);
      *(_DWORD *)buf = 138543618;
      id v60 = v53;
      __int16 v61 = 2112;
      v62 = v56;
      _os_log_debug_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_DEBUG, "Using base token \"%{public}@\" on share %@", buf, 0x16u);
    }
  }
  if (objc_msgSend_publicPermission(v8, v24, v25) != 1) {
    goto LABEL_23;
  }
  __int16 v29 = objc_msgSend_currentUserParticipant(v8, v27, v28);
  v32 = objc_msgSend_protectionInfo(v29, v30, v31);
  if (v32)
  {

LABEL_23:
    v48 = objc_msgSend_stateTransitionGroup(self, v27, v28);
    dispatch_group_enter(v48);

    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = sub_1C4F99A78;
    v57[3] = &unk_1E64F7960;
    v57[4] = self;
    id v58 = v9;
    objc_msgSend__participantKeyFromShare_completionHandler_(self, v49, (uint64_t)v8, v57);

    goto LABEL_16;
  }
  v36 = objc_msgSend_currentUserParticipant(v8, v33, v34);
  uint64_t v39 = objc_msgSend_role(v36, v37, v38);

  if (v39 != 1) {
    goto LABEL_23;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v40 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v9;
    _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Share %@ needs to be updated on the server so that it gets a PPPCS for the owner", buf, 0xCu);
  }
  v43 = objc_msgSend_sharesNeedingUpdateByID(self, v41, v42);
  uint64_t v46 = objc_msgSend_recordID(v8, v44, v45);
  objc_msgSend_setObject_forKeyedSubscript_(v43, v47, (uint64_t)v8, v46);

LABEL_16:
}

- (void)fetchSharesFromServer
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_shareIDs(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    id v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      long long v21 = v11;
      id v24 = objc_msgSend_shareIDs(self, v22, v23);
      uint64_t v27 = objc_msgSend_count(v24, v25, v26);
      uint64_t v30 = objc_msgSend_operationID(self, v28, v29);
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v27;
      __int16 v34 = 2114;
      v35 = v30;
      _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Fetching %lu shares from the server for operation %{public}@", buf, 0x16u);
    }
    uint64_t v12 = objc_opt_new();
    uint64_t v15 = objc_msgSend_shareIDs(self, v13, v14);
    objc_msgSend_setRecordIDs_(v12, v16, (uint64_t)v15);

    objc_msgSend_setDesiredKeys_(v12, v17, MEMORY[0x1E4F1CBF0]);
    uint64_t v18 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1C4F99D68;
    v31[3] = &unk_1E64F0210;
    v31[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v19, v18, v12, v31);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v20 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "No shares to fetch from the server. Returning early", buf, 2u);
    }
  }
}

- (void)updateShares
{
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v7 = objc_msgSend_shareIDs(self, v5, v6);
  objc_msgSend_removeAllObjects(v7, v8, v9);

  uint64_t v12 = objc_opt_new();
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v13 = objc_msgSend_unitTestOverrides(self, v10, v11);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"NoProtectectionInfoTagOnShareUpgrade");

    if (v15)
    {
      uint64_t v16 = objc_msgSend_sharesNeedingUpdateByID(self, v10, v11);
      long long v19 = objc_msgSend_allValues(v16, v17, v18);
      uint64_t v22 = objc_msgSend_firstObject(v19, v20, v21);

      objc_msgSend_setPreviousProtectionEtagFromUnitTest_(v22, v23, (uint64_t)&stru_1F2044F30);
    }
  }
  id v24 = objc_msgSend_sharesNeedingUpdateByID(self, v10, v11);
  uint64_t v27 = objc_msgSend_allValues(v24, v25, v26);
  objc_msgSend_setRecordsToSave_(v12, v28, (uint64_t)v27);

  uint64_t v29 = objc_opt_class();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4F9A2E0;
  v31[3] = &unk_1E64F0210;
  v31[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v30, v29, v12, v31);
}

- (void)main
{
  uint64_t v4 = objc_msgSend_shareIDs(self, a2, v2);
  BOOL v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setShareParticipantKeyFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareParticipantKeyOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)shareParticipantKeyFetchedBlock
{
  return self->_shareParticipantKeyFetchedBlock;
}

- (void)setShareParticipantKeyFetchedBlock:(id)a3
{
}

- (NSMutableArray)shareIDs
{
  return self->_shareIDs;
}

- (void)setShareIDs:(id)a3
{
}

- (NSDictionary)baseTokensByShareID
{
  return self->_baseTokensByShareID;
}

- (void)setBaseTokensByShareID:(id)a3
{
}

- (NSDictionary)childRecordIDsByShareID
{
  return self->_childRecordIDsByShareID;
}

- (void)setChildRecordIDsByShareID:(id)a3
{
}

- (NSMutableDictionary)sharesNeedingUpdateByID
{
  return self->_sharesNeedingUpdateByID;
}

- (void)setSharesNeedingUpdateByID:(id)a3
{
}

- (BOOL)hasAttemptedShareUpdate
{
  return self->_hasAttemptedShareUpdate;
}

- (void)setHasAttemptedShareUpdate:(BOOL)a3
{
  self->_char hasAttemptedShareUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharesNeedingUpdateByID, 0);
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, 0);
  objc_storeStrong((id *)&self->_baseTokensByShareID, 0);
  objc_storeStrong((id *)&self->_shareIDs, 0);
  objc_storeStrong(&self->_shareParticipantKeyFetchedBlock, 0);
}

@end