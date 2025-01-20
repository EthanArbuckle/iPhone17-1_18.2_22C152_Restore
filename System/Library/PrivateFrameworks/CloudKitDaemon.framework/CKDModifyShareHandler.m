@interface CKDModifyShareHandler
+ (id)modifyHandlerForDeleteWithShareID:(id)a3 operation:(id)a4;
+ (id)modifyHandlerWithShare:(id)a3 operation:(id)a4;
- (BOOL)_addedPrivateParticipantNeedsAManateeInvitation:(id)a3;
- (BOOL)_cleanPublicPCSforShareWithError:(id *)a3;
- (BOOL)_modifyRoleForParticipant:(id)a3 invitedPCS:(_OpaquePCSShareProtection *)a4 shareeIdentities:(id)a5 error:(id *)a6;
- (BOOL)_removePrivateParticipantsFromInvitedPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4;
- (BOOL)_serializePCSDataForShareWithError:(id *)a3;
- (BOOL)_setupParticipantsProtectionInfos:(id *)a3;
- (BOOL)_updateSharePublicPCSWithError:(id *)a3;
- (BOOL)haveAddedOwnerToShare;
- (BOOL)isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade;
- (BOOL)isCloudDocsContainer;
- (BOOL)isShare;
- (CKRecordID)shareID;
- (_PCSPublicIdentityData)createPublicIdentityFromPublicKeyForParticipant:(id)a3 error:(id *)a4;
- (id)_createNewSharePCSDataWithError:(id *)a3;
- (id)_ensurePrivateParticipant:(id)a3 isInInvitedSharePCS:(_OpaquePCSShareProtection *)a4;
- (id)_handleSharePCSData:(id)a3 zonePCSData:(id)a4;
- (id)_publicKeyForParticipant:(id)a3 error:(id *)a4;
- (id)_removePrivateParticipant:(id)a3 fromInvitedSharePCS:(_OpaquePCSShareProtection *)a4;
- (id)_removePublicKey:(id)a3 fromInvitedPCS:(_OpaquePCSShareProtection *)a4;
- (id)_rollShareAndZonePCSIfNeededForSharePCS:(id)a3 zonePCSData:(id)a4;
- (id)sideEffectRecordIDs;
- (unint64_t)invitedPCSPermissionForParticipant:(id)a3;
- (unint64_t)serviceType;
- (void)_addPublicKeyToSelfParticipantWithCompletionHandler:(id)a3;
- (void)_alignParticipantPermissions;
- (void)_fetchRootRecordPublicSharingIdentityWithCompletionHandler:(id)a3;
- (void)_fetchSharePCSData;
- (void)_prepareDependentPCSUpdateIfNeededForShareWithSharePCS:(id)a3 error:(id)a4;
- (void)clearProtectionDataForRecord;
- (void)dealloc;
- (void)decryptSelfParticipantPCSWithCompletionHandler:(id)a3;
- (void)fetchSharePCSData;
- (void)noteSideEffectRecordPendingDelete:(id)a3;
- (void)noteSideEffectRecordPendingModify:(id)a3;
- (void)prepareForSaveWithCompletionHandler:(id)a3;
- (void)savePCSDataToCache;
- (void)setHaveAddedOwnerToShare:(BOOL)a3;
- (void)setIsALegacyPublicShareThatNeedsOwnerPPPCSUpgrade:(BOOL)a3;
- (void)setServerRecord:(id)a3;
- (void)updateParticipantsForFetchedShare:(id)a3 error:(id)a4;
@end

@implementation CKDModifyShareHandler

+ (id)modifyHandlerWithShare:(id)a3 operation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend__initWithRecord_operation_(v7, v8, (uint64_t)v6, v5);

  objc_msgSend_setState_(v9, v10, 0);
  return v9;
}

+ (id)modifyHandlerForDeleteWithShareID:(id)a3 operation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend__initForDeleteWithRecordID_operation_(v7, v8, (uint64_t)v6, v5);

  objc_msgSend_setState_(v9, v10, 0);
  return v9;
}

- (CKRecordID)shareID
{
  v4 = objc_msgSend_recordID(self, a2, v2);
  id v7 = v4;
  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    v9 = objc_msgSend_share(self, v5, v6);
    objc_msgSend_recordID(v9, v10, v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (CKRecordID *)v8;
}

- (BOOL)isShare
{
  return 1;
}

- (BOOL)isCloudDocsContainer
{
  v3 = objc_msgSend_operation(self, a2, v2);
  uint64_t v6 = objc_msgSend_container(v3, v4, v5);
  v9 = objc_msgSend_containerID(v6, v7, v8);
  BOOL v12 = objc_msgSend_specialContainerType(v9, v10, v11) == 4;

  return v12;
}

- (unint64_t)serviceType
{
  v3 = objc_msgSend_operation(self, a2, v2);
  uint64_t v6 = objc_msgSend_container(v3, v4, v5);
  v9 = objc_msgSend_pcsManager(v6, v7, v8);
  unint64_t v12 = objc_msgSend_serviceTypeForSharing(v9, v10, v11);

  return v12;
}

- (id)sideEffectRecordIDs
{
  if (objc_msgSend_state(self, a2, v2))
  {
    v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKDModifyShareHandler.m", 106, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyShareHandler sideEffectRecordIDs]", self, "CKDModifyRecordHandlerStateNeedRecordSideEffects");
  }
  id v7 = objc_msgSend_share(self, v5, v6);
  uint64_t v10 = objc_msgSend_rootRecordID(v7, v8, v9);
  if (v10)
  {
    v13 = (void *)v10;
    v14 = objc_msgSend_share(self, v11, v12);
    char isKnownToServer = objc_msgSend_isKnownToServer(v14, v15, v16);

    if (isKnownToServer)
    {
      v20 = 0;
      goto LABEL_9;
    }
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = objc_msgSend_share(self, v18, v19);
    v24 = objc_msgSend_rootRecordID(v7, v22, v23);
    v20 = objc_msgSend_setWithObject_(v21, v25, (uint64_t)v24);
  }
  else
  {
    v20 = 0;
  }

LABEL_9:
  return v20;
}

- (void)noteSideEffectRecordPendingModify:(id)a3
{
  id v22 = a3;
  uint64_t v6 = objc_msgSend_recordID(v22, v4, v5);
  uint64_t v9 = objc_msgSend_share(self, v7, v8);
  uint64_t v12 = objc_msgSend_rootRecordID(v9, v10, v11);
  int isEqual = objc_msgSend_isEqual_(v6, v13, (uint64_t)v12);

  if (isEqual)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1A348]);
    v18 = objc_msgSend_share(self, v16, v17);
    v20 = objc_msgSend_initWithRecord_action_(v15, v19, (uint64_t)v18, 0);
    objc_msgSend_setShare_(v22, v21, (uint64_t)v20);
  }
}

- (void)noteSideEffectRecordPendingDelete:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_record(self, v5, v6);
  uint64_t v10 = objc_msgSend_share(v7, v8, v9);
  v13 = objc_msgSend_recordID(v10, v11, v12);
  int isEqual = objc_msgSend_isEqual_(v13, v14, (uint64_t)v4);

  if (isEqual)
  {
    objc_msgSend_record(self, v16, v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShare_(v19, v18, 0);
  }
}

- (void)fetchSharePCSData
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, v2) != 1)
  {
    v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, @"CKDModifyShareHandler.m", 132, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyShareHandler fetchSharePCSData]", self, "CKDModifyRecordHandlerStateNeedSharePCSData");
  }
  id v7 = objc_msgSend_operation(self, v5, v6);
  uint64_t v10 = objc_msgSend_stateTransitionGroup(v7, v8, v9);
  dispatch_group_enter(v10);

  objc_initWeak(&location, self);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_1C4EA8654;
  v53[4] = sub_1C4EA8664;
  id v54 = 0;
  v13 = objc_msgSend_share(self, v11, v12);
  v14 = dispatch_group_create();
  id v19 = objc_msgSend_invitedProtectionData(v13, v15, v16);
  if (v19)
  {
    v20 = objc_msgSend_publicProtectionData(v13, v17, v18);
    BOOL v21 = v20 == 0;

    if (!v21)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v22 = (id)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend_shareID(self, v23, v24);
        *(_DWORD *)buf = 138412290;
        v59 = v25;
        _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Share %@ already has PCS data. Decrypting it.", buf, 0xCu);
      }
      dispatch_group_enter(v14);
      v28 = objc_msgSend_pcsManager(self, v26, v27);
      v31 = objc_msgSend_share(self, v29, v30);
      v34 = objc_msgSend_topmostParentOperation(v7, v32, v33);
      v37 = objc_msgSend_operationID(v34, v35, v36);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = sub_1C4EA866C;
      v48[3] = &unk_1E64F4B60;
      objc_copyWeak(&v52, &location);
      v51 = v55;
      v50 = v53;
      v48[4] = self;
      v49 = v14;
      objc_msgSend_pcsDataFromFetchedShare_requestorOperationID_completionHandler_(v28, v38, (uint64_t)v31, v37, v48);

      objc_destroyWeak(&v52);
    }
  }
  v39 = objc_msgSend_modifyRecordsQueue(v7, v17, v18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EA88A8;
  block[3] = &unk_1E64F4C50;
  objc_copyWeak(&v47, &location);
  v46 = v53;
  id v44 = v7;
  v45 = v55;
  id v40 = v7;
  dispatch_group_notify(v14, v39, block);

  objc_destroyWeak(&v47);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(v55, 8);
  objc_destroyWeak(&location);
}

- (void)_fetchSharePCSData
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_operation(self, a2, v2);
  id v7 = objc_msgSend_stateTransitionGroup(v4, v5, v6);
  dispatch_group_enter(v7);

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1C4EA8654;
  v34[4] = sub_1C4EA8664;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_1C4EA8654;
  v32[4] = sub_1C4EA8664;
  id v33 = 0;
  objc_initWeak(&location, self);
  uint64_t v8 = dispatch_group_create();
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v9 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_msgSend_shareID(self, v10, v11);
    *(_DWORD *)buf = 138412290;
    v37 = v12;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Fetching PCS data for share %@", buf, 0xCu);
  }
  dispatch_group_enter(v8);
  id v15 = objc_msgSend_pcsCache(self, v13, v14);
  uint64_t v18 = objc_msgSend_shareID(self, v16, v17);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4EA8CB8;
  v26[3] = &unk_1E64F4BB0;
  objc_copyWeak(&v30, &location);
  id v19 = v8;
  uint64_t v27 = v19;
  v28 = v34;
  v29 = v32;
  objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v15, v20, (uint64_t)v18, v4, 0, v26);

  uint64_t v23 = objc_msgSend_modifyRecordsQueue(v4, v21, v22);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4EA981C;
  v24[3] = &unk_1E64F4BD8;
  objc_copyWeak(&v25, &location);
  v24[4] = v34;
  v24[5] = v32;
  dispatch_group_notify(v19, v23, v24);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

- (void)_fetchRootRecordPublicSharingIdentityWithCompletionHandler:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_share(self, v5, v6);
  uint64_t v10 = objc_msgSend_rootRecordID(v7, v8, v9);

  uint64_t v11 = (void *)*MEMORY[0x1E4F1A548];
  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = v12;
      id v30 = objc_msgSend_share(self, v28, v29);
      id v33 = objc_msgSend_rootRecordID(v30, v31, v32);
      *(_DWORD *)buf = 138412290;
      v41 = v33;
      _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Fetching public sharing identity for root record %@", buf, 0xCu);
    }
    id v15 = objc_msgSend_pcsCache(self, v13, v14);
    uint64_t v18 = objc_msgSend_share(self, v16, v17);
    BOOL v21 = objc_msgSend_rootRecordID(v18, v19, v20);
    uint64_t v24 = objc_msgSend_operation(self, v22, v23);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1C4EA9B4C;
    v38[3] = &unk_1E64F4C00;
    id v39 = v4;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v15, v25, (uint64_t)v21, v24, 0, v38);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    v26 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v34 = v26;
      v37 = objc_msgSend_shareID(self, v35, v36);
      *(_DWORD *)buf = 138412290;
      v41 = v37;
      _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "Share %@ has no root record ID, so we'll generate a new PSI for the share", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (id)_createNewSharePCSDataWithError:(id *)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v6 = objc_msgSend_operation(self, a2, (uint64_t)a3);
    uint64_t v9 = objc_msgSend_unitTestOverrides(v6, v7, v8);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"DisallowSharePCSToBeCreated");

    if (v11)
    {
      v78 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v78, v79, (uint64_t)a2, self, @"CKDModifyShareHandler.m", 274, @"Share PCS creation not allowed by unit test");
    }
  }
  uint64_t v12 = objc_msgSend_share(self, a2, (uint64_t)a3);
  id v15 = objc_msgSend_operation(self, v13, v14);
  if (objc_msgSend_databaseScope(v15, v16, v17) != 2 && objc_msgSend_databaseScope(v15, v18, v19) != 3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v54 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_ERROR, "Someone is trying to save a share in the public database. That's not going to go very well.", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v55, *MEMORY[0x1E4F19DD8], 5005, @"Can't save a share in the public database");
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = 0;
    goto LABEL_30;
  }
  uint64_t v20 = objc_msgSend_container(v15, v18, v19);
  uint64_t v23 = objc_msgSend_cachedEnvironment(v20, v21, v22);

  v26 = objc_msgSend_mutableEncryptedPSK(v12, v24, v25);
  uint64_t v29 = objc_msgSend_data(v26, v27, v28);

  id v30 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  v31 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v32 = (void *)MEMORY[0x1E4F1A550];
  if (v29)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v31);
    }
    id v33 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = v33;
      id v39 = objc_msgSend_recordID(v12, v37, v38);
      *(_DWORD *)buf = 138412546;
      v84 = v39;
      __int16 v85 = 2112;
      id v86 = v29;
      _os_log_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_INFO, "Using passed in data to create a public sharing identity for %@: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v31);
  }
  id v40 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    v43 = v40;
    v46 = objc_msgSend_recordID(v12, v44, v45);
    *(_DWORD *)buf = 138412290;
    v84 = v46;
    _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "Creating a new random sharing identity for share %@", buf, 0xCu);
  }
  id v47 = objc_msgSend_pcsManager(self, v41, v42);
  id v82 = 0;
  RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(v47, v48, (uint64_t)&v82);
  id v50 = v82;

  if (RandomSharingIdentityWithError)
  {
    v51 = objc_msgSend_pcsManager(self, v34, v35);
    id v81 = v50;
    uint64_t v29 = objc_msgSend_dataFromSharingIdentity_error_(v51, v52, (uint64_t)RandomSharingIdentityWithError, &v81);
    id v53 = v81;

    id v30 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    CFRelease(RandomSharingIdentityWithError);
    id v50 = v53;
    uint64_t v32 = (void *)MEMORY[0x1E4F1A550];
  }
  else
  {
    uint64_t v29 = 0;
  }
  if (v50)
  {
LABEL_30:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v68 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      v69 = v68;
      v72 = objc_msgSend_recordID(v12, v70, v71);
      *(_DWORD *)buf = 138412546;
      v84 = v72;
      __int16 v85 = 2112;
      id v86 = v50;
      _os_log_error_impl(&dword_1C4CFF000, v69, OS_LOG_TYPE_ERROR, "Error creating PCS data for share %@: %@", buf, 0x16u);

      if (a3) {
        goto LABEL_34;
      }
    }
    else if (a3)
    {
LABEL_34:
      id v50 = v50;
      v62 = 0;
      *a3 = v50;
      goto LABEL_37;
    }
    v62 = 0;
    goto LABEL_37;
  }
LABEL_24:
  BOOL v56 = v23 > 0;
  v57 = objc_msgSend_pcsManager(self, v34, v35);
  uint64_t v60 = objc_msgSend_recordID(v12, v58, v59);
  id v80 = 0;
  v62 = objc_msgSend_createNewSharePCSDataForShareWithID_withPublicSharingKey_addDebugIdentity_error_(v57, v61, (uint64_t)v60, v29, v56, &v80);
  id v50 = v80;

  if (!v62) {
    goto LABEL_30;
  }
  if (*v32 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], *v30);
  }
  v63 = (void *)*MEMORY[0x1E4F1A528];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    if (!v29) {
      goto LABEL_37;
    }
    goto LABEL_29;
  }
  v74 = v63;
  v77 = objc_msgSend_recordID(v12, v75, v76);
  *(_DWORD *)buf = 138412290;
  v84 = v77;
  _os_log_debug_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_DEBUG, "Successfully created PCS data for share %@", buf, 0xCu);

  if (v29)
  {
LABEL_29:
    id v64 = objc_alloc(MEMORY[0x1E4F19FA0]);
    v66 = objc_msgSend_initWithData_(v64, v65, (uint64_t)v29);
    objc_msgSend_setMutableEncryptedPSK_(v12, v67, (uint64_t)v66);
  }
LABEL_37:

  return v62;
}

- (id)_handleSharePCSData:(id)a3 zonePCSData:(id)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_pcs(v6, v8, v9) && objc_msgSend_publicPCS(v6, v10, v11))
  {
    uint64_t v14 = objc_msgSend_pcsManager(self, v12, v13);
    uint64_t v17 = objc_msgSend_publicPCS(v6, v15, v16);
    id v133 = 0;
    objc_msgSend_sharingIdentityDataFromPCS_error_(v14, v18, v17, &v133);
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v20 = v133;

    if (!v19 || v20)
    {
      if (!v20)
      {
        id v86 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v87 = *MEMORY[0x1E4F19DD8];
        v88 = objc_msgSend_shareID(self, v21, v22);
        objc_msgSend_errorWithDomain_code_format_(v86, v89, v87, 5000, @"Couldn't create a public sharing identity for share %@", v88);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v53 = v20;
      id v52 = v53;
      goto LABEL_36;
    }
    uint64_t v23 = objc_msgSend_share(self, v21, v22);
    uint64_t v26 = objc_msgSend_publicSharingIdentity(v23, v24, v25);
    if (v26)
    {
      uint64_t v29 = (void *)v26;
      id v30 = objc_msgSend_share(self, v27, v28);
      id v33 = objc_msgSend_publicSharingIdentity(v30, v31, v32);
      char isEqual = objc_msgSend_isEqual_(v33, v34, (uint64_t)v19);

      if ((isEqual & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v36 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          v123 = v36;
          v126 = objc_msgSend_shareID(self, v124, v125);
          v129 = objc_msgSend_share(self, v127, v128);
          objc_msgSend_publicSharingIdentity(v129, v130, v131);
          v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v135 = v126;
          __int16 v136 = 2114;
          v137 = v132;
          __int16 v138 = 2114;
          v139 = v19;
          _os_log_error_impl(&dword_1C4CFF000, v123, OS_LOG_TYPE_ERROR, "Public sharing identity on share %@ is different. Expected %{public}@, got %{public}@", buf, 0x20u);
        }
        id v39 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v40 = *MEMORY[0x1E4F19DD8];
        v41 = objc_msgSend_shareID(self, v37, v38);
        id v44 = objc_msgSend_share(self, v42, v43);
        id v47 = objc_msgSend_mutableEncryptedPSK(v44, v45, v46);
        id v50 = objc_msgSend_data(v47, v48, v49);
        id v52 = objc_msgSend_errorWithDomain_code_format_(v39, v51, v40, 5000, @"Public sharing identity on share %@ is different. Expected %@, got %@", v41, v50, v19);

        id v53 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v90 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      v91 = v90;
      v94 = objc_msgSend_shareID(self, v92, v93);
      *(_DWORD *)buf = 138412290;
      v135 = v94;
      _os_log_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_INFO, "Fetched pcs info for share %@", buf, 0xCu);
    }
    id v95 = objc_alloc(MEMORY[0x1E4F19FA0]);
    v97 = objc_msgSend_initWithData_(v95, v96, (uint64_t)v19);
    v100 = objc_msgSend_share(self, v98, v99);
    objc_msgSend_setMutableEncryptedPSK_(v100, v101, (uint64_t)v97);

    v104 = objc_msgSend_share(self, v102, v103);
    v107 = objc_msgSend_operation(self, v105, v106);
    v110 = objc_msgSend_container(v107, v108, v109);
    v113 = objc_msgSend_deviceContext(v110, v111, v112);
    v116 = objc_msgSend_testDeviceReference(v113, v114, v115);
    objc_msgSend_setSharePCSData_isUnitTestAccount_(v104, v117, (uint64_t)v6, v116 != 0);

    objc_msgSend_setSharePCSData_(self, v118, (uint64_t)v6);
    id v53 = 0;
    id v52 = 0;
    goto LABEL_36;
  }
  id v54 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v55 = (os_log_t *)MEMORY[0x1E4F1A528];
  BOOL v56 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v59 = v56;
    v62 = objc_msgSend_shareID(self, v60, v61);
    *(_DWORD *)buf = 138412802;
    v135 = v62;
    __int16 v136 = 2114;
    v137 = &stru_1F2044F30;
    __int16 v138 = 2112;
    v139 = &stru_1F2044F30;
    _os_log_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_INFO, "Warn: Can't save share %@ if we have no PCS data for it%{public}@%@", buf, 0x20u);
  }
  if (!objc_msgSend_pcs(v6, v57, v58))
  {
    if (*v54 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v65 = *v55;
    if (os_log_type_enabled(*v55, OS_LOG_TYPE_INFO))
    {
      v66 = v65;
      v69 = objc_msgSend_shareID(self, v67, v68);
      *(_DWORD *)buf = 138412290;
      v135 = v69;
      _os_log_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_INFO, "Warn: Private PCS data for share %@ is nil", buf, 0xCu);
    }
  }
  if (!objc_msgSend_publicPCS(v6, v63, v64))
  {
    if (*v54 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v72 = *v55;
    if (os_log_type_enabled(*v55, OS_LOG_TYPE_INFO))
    {
      v73 = v72;
      uint64_t v76 = objc_msgSend_shareID(self, v74, v75);
      *(_DWORD *)buf = 138412290;
      v135 = v76;
      _os_log_impl(&dword_1C4CFF000, v73, OS_LOG_TYPE_INFO, "Warn: Public PCS data for share %@ is nil", buf, 0xCu);
    }
  }
  v77 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v78 = *MEMORY[0x1E4F19DD8];
  objc_msgSend_shareID(self, v70, v71);
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v81 = objc_msgSend_publicPCS(v6, v79, v80);
  uint64_t v84 = objc_msgSend_pcs(v6, v82, v83);
  id v52 = objc_msgSend_errorWithDomain_code_format_(v77, v85, v78, 5005, @"Can't save share %@ because we're missing PCS data. Public PCS: %@, Private PCS: %@", v53, v81, v84);
LABEL_37:

  if (!v52 && objc_msgSend_pcs(v7, v119, v120)) {
    objc_msgSend_setSharedZonePCSData_(self, v121, (uint64_t)v7);
  }

  return v52;
}

- (void)_prepareDependentPCSUpdateIfNeededForShareWithSharePCS:(id)a3 error:(id)a4
{
  id v6 = a3;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000;
  id v52 = sub_1C4EA8654;
  id v53 = sub_1C4EA8664;
  id v7 = a4;
  id v54 = v7;
  uint64_t v10 = objc_msgSend_shareID(self, v8, v9);
  uint64_t v13 = objc_msgSend_zoneID(v10, v11, v12);

  uint64_t v16 = objc_msgSend_operation(self, v14, v15);
  objc_initWeak(&location, self);
  uint64_t v17 = dispatch_group_create();
  id v20 = objc_msgSend_stateTransitionGroup(v16, v18, v19);
  dispatch_group_enter(v20);

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_1C4EA8654;
  v46[4] = sub_1C4EA8664;
  id v47 = 0;
  if (!v50[5])
  {
    uint64_t v23 = objc_msgSend_share(self, v21, v22);
    int isZoneWideShare = objc_msgSend_isZoneWideShare(v23, v24, v25);

    if (isZoneWideShare)
    {
      dispatch_group_enter(v17);
      uint64_t v29 = objc_msgSend_pcsCache(self, v27, v28);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1C4EAAC54;
      v38[3] = &unk_1E64F4C28;
      objc_copyWeak(&v45, &location);
      id v39 = v13;
      uint64_t v40 = self;
      id v41 = v6;
      uint64_t v43 = v46;
      id v44 = &v49;
      uint64_t v42 = v17;
      objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v29, v30, (uint64_t)v39, v16, 0, v38);

      objc_destroyWeak(&v45);
    }
  }
  v31 = objc_msgSend_modifyRecordsQueue(v16, v21, v22);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EAB014;
  block[3] = &unk_1E64F4C50;
  objc_copyWeak(&v37, &location);
  id v34 = v6;
  uint64_t v35 = &v49;
  uint64_t v36 = v46;
  id v32 = v6;
  dispatch_group_notify(v17, v31, block);

  objc_destroyWeak(&v37);
  _Block_object_dispose(v46, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v49, 8);
}

- (void)prepareForSaveWithCompletionHandler:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if (objc_msgSend_state(self, v6, v7) != 5)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKDModifyShareHandler.m", 431, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyShareHandler prepareForSaveWithCompletionHandler:]", self, "CKDModifyRecordHandlerStateNeedRecordPrepareForUpload");
  }
  if (objc_msgSend_isDelete(self, v8, v9))
  {
    if (objc_msgSend_state(self, v10, v11) == 5)
    {
      v15.receiver = self;
      v15.super_class = (Class)CKDModifyShareHandler;
      [(CKDModifyRecordHandler *)&v15 prepareForSaveWithCompletionHandler:v5];
    }
    else
    {
      v5[2](v5);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1C4EAB3EC;
    v16[3] = &unk_1E64F4CA0;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    uint64_t v17 = v5;
    objc_msgSend_decryptSelfParticipantPCSWithCompletionHandler_(self, v12, (uint64_t)v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)decryptSelfParticipantPCSWithCompletionHandler:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_share(self, v5, v6);
  uint64_t v10 = objc_msgSend_currentUserParticipant(v7, v8, v9);

  if (objc_msgSend_role(v10, v11, v12) == 1 || objc_msgSend_role(v10, v13, v14) == 2)
  {
    objc_super v15 = objc_msgSend_protectionInfo(v10, v13, v14);
    uint64_t v18 = objc_msgSend_length(v15, v16, v17);

    if (v18)
    {
      objc_initWeak((id *)location, self);
      BOOL v21 = objc_msgSend_userIdentity(v10, v19, v20);
      unint64_t v24 = objc_msgSend_publicKeyVersion(v21, v22, v23);

      BOOL v25 = v24 < 3;
      uint64_t v28 = objc_msgSend_pcsManager(self, v26, v27);
      v31 = objc_msgSend_protectionInfo(v10, v29, v30);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1C4EABCBC;
      v41[3] = &unk_1E64F4CC8;
      objc_copyWeak(&v44, (id *)location);
      id v42 = v10;
      id v43 = v4;
      objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v28, v32, (uint64_t)v31, 4, 2 * v25, v41);

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)location);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v33 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        id v34 = v33;
        id v37 = objc_msgSend_participantID(v10, v35, v36);
        uint64_t v40 = objc_msgSend_shareID(self, v38, v39);
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v37;
        __int16 v46 = 2114;
        id v47 = v40;
        _os_log_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_INFO, "Current participant %{public}@ does not have a protection info on share %{public}@, possibly due to owner adding themselves for the first time", location, 0x16u);
      }
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)_rollShareAndZonePCSIfNeededForSharePCS:(id)a3 zonePCSData:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_share(self, v8, v9);
  uint64_t v13 = objc_msgSend_operation(self, v11, v12);
  uint64_t v16 = v13;
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v17 = objc_msgSend_unitTestOverrides(v13, v14, v15);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"ShouldRollSharePCSOnFetch");

    BOOL v20 = v19 != 0;
  }
  else
  {
    BOOL v20 = 0;
  }
  BOOL v21 = objc_msgSend_invitedKeysToRemove(v10, v14, v15);
  uint64_t v24 = objc_msgSend_count(v21, v22, v23);

  uint64_t v27 = objc_msgSend_removedParticipants(v10, v25, v26);
  uint64_t v30 = objc_msgSend_count(v27, v28, v29);

  if (!v20 && !v24 && !v30) {
    goto LABEL_23;
  }
  id v33 = objc_msgSend_share(self, v31, v32);
  if ((objc_msgSend_isZoneWideShare(v33, v34, v35) & 1) == 0)
  {

LABEL_23:
    v55 = 0;
    goto LABEL_24;
  }
  uint64_t v38 = objc_msgSend_currentUserParticipant(v10, v36, v37);
  uint64_t v41 = objc_msgSend_role(v38, v39, v40);

  if (v41 != 1) {
    goto LABEL_23;
  }
  id v42 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v43 = (os_log_t *)MEMORY[0x1E4F1A500];
  id v44 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    log = v44;
    v74 = objc_msgSend_operationID(v16, v69, v70);
    objc_msgSend_recordID(v10, v71, v72);
    *(_DWORD *)buf = 138544130;
    v77 = v74;
    v79 = __int16 v78 = 2112;
    v73 = (void *)v79;
    __int16 v80 = 2048;
    uint64_t v81 = v24;
    __int16 v82 = 2048;
    uint64_t v83 = v30;
    _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "Operation %{public}@ needs to key roll for zone-wide share %@ due to %tu invited keys to remove and %tu removed participants", buf, 0x2Au);
  }
  id v47 = objc_msgSend_pcsManager(self, v45, v46);
  int canRollShareKeys = objc_msgSend_canRollShareKeys(v47, v48, v49);

  if (!canRollShareKeys) {
    goto LABEL_23;
  }
  id v53 = objc_msgSend_pcsManager(self, v51, v52);
  objc_msgSend_keyRollForZoneWideShareWithZonePCS_sharePCS_forOperation_(v53, v54, (uint64_t)v7, v6, v16);
  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDidAttemptZoneWideShareKeyRoll_(self, v56, 1);
  if (*v42 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v57 = *v43;
  if (os_log_type_enabled(*v43, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v58 = v57;
    uint64_t v61 = objc_msgSend_operationID(v16, v59, v60);
    uint64_t v64 = objc_msgSend_recordID(v10, v62, v63);
    os_log_t v65 = (void *)v64;
    v66 = @" error: ";
    *(_DWORD *)buf = 138413058;
    v67 = &stru_1F2044F30;
    v77 = v61;
    __int16 v78 = 2112;
    if (!v55) {
      v66 = &stru_1F2044F30;
    }
    uint64_t v79 = v64;
    if (v55) {
      v67 = v55;
    }
    __int16 v80 = 2114;
    uint64_t v81 = (uint64_t)v66;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v67;
    _os_log_debug_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_DEBUG, "Operation %@ did attempt a key roll for zone-wide share %@%{public}@%@", buf, 0x2Au);
  }
LABEL_24:

  return v55;
}

- (void)_alignParticipantPermissions
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v58 = objc_msgSend_share(self, a2, v2);
  uint64_t v5 = objc_msgSend_currentUserParticipant(v58, v3, v4);
  if (objc_msgSend_role(v5, v6, v7) == 1)
  {
  }
  else
  {
    uint64_t v12 = objc_msgSend_currentUserParticipant(v58, v8, v9);
    uint64_t v15 = objc_msgSend_role(v12, v13, v14);

    if (v15 != 2) {
      goto LABEL_20;
    }
  }
  if (objc_msgSend_publicPermission(v58, v10, v11) >= 2)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    objc_msgSend_participants(v58, v16, v17);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v59, v73, 16);
    if (v19)
    {
      uint64_t v23 = v19;
      uint64_t v24 = *(void *)v60;
      BOOL v25 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
      uint64_t v26 = (os_log_t *)MEMORY[0x1E4F1A500];
      *(void *)&long long v22 = 138413314;
      long long v53 = v22;
      do
      {
        uint64_t v27 = 0;
        uint64_t v55 = v23;
        do
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v59 + 1) + 8 * v27);
          if (objc_msgSend_role(v28, v20, v21, v53) == 3 || objc_msgSend_role(v28, v29, v30) == 2)
          {
            if (*v25 != -1) {
              dispatch_once(v25, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            os_log_t v31 = *v26;
            if (os_log_type_enabled(*v26, OS_LOG_TYPE_INFO))
            {
              log = v31;
              objc_msgSend_role(v28, v34, v35);
              uint64_t v36 = CKStringFromParticipantRole();
              uint64_t v39 = objc_msgSend_participantID(v28, v37, v38);
              objc_msgSend_permission(v28, v40, v41);
              id v42 = CKStringFromParticipantPermission();
              objc_msgSend_publicPermission(v58, v43, v44);
              CKStringFromParticipantPermission();
              v46 = uint64_t v45 = v24;
              objc_msgSend_shareID(self, v47, v48);
              id v50 = v49 = v25;
              *(_DWORD *)buf = v53;
              uint64_t v64 = v36;
              __int16 v65 = 2112;
              v66 = v39;
              __int16 v67 = 2114;
              uint64_t v68 = v42;
              __int16 v69 = 2114;
              uint64_t v70 = v46;
              __int16 v71 = 2112;
              uint64_t v72 = v50;
              _os_log_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_INFO, "Updating permission for %@ participant %@ from %{public}@ -> %{public}@ to match the public permission on share %@", buf, 0x34u);

              BOOL v25 = v49;
              uint64_t v23 = v55;

              uint64_t v24 = v45;
              uint64_t v26 = (os_log_t *)MEMORY[0x1E4F1A500];
            }
            uint64_t v51 = objc_msgSend_publicPermission(v58, v32, v33);
            objc_msgSend_setPermission_(v28, v52, v51);
          }
          ++v27;
        }
        while (v23 != v27);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v59, v73, 16);
      }
      while (v23);
    }
  }
LABEL_20:
}

- (BOOL)_serializePCSDataForShareWithError:(id *)a3
{
  uint64_t v275 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_share(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_currentUserParticipant(v5, v6, v7);

  if (objc_msgSend_role(v8, v9, v10) == 1 || objc_msgSend_role(v8, v11, v12) == 2)
  {
    uint64_t v13 = objc_msgSend_pcsManager(self, v11, v12);
    uint64_t v16 = objc_msgSend_share(self, v14, v15);
    uint64_t v19 = objc_msgSend_privatePCS(v16, v17, v18);
    id v270 = 0;
    uint64_t v21 = objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v13, v20, v19, 5, &v270);
    id v22 = v270;

    if (!v21 || v22)
    {
      if (!v22)
      {
        os_log_t v31 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v32 = *MEMORY[0x1E4F19DD8];
        uint64_t v33 = objc_msgSend_shareID(self, v23, v24);
        objc_msgSend_errorWithDomain_code_format_(v31, v34, v32, 5002, @"Couldn't serialize private share PCS for share %@: %@", v33, 0);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v35 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = v35;
        uint64_t v39 = objc_msgSend_shareID(self, v37, v38);
        *(_DWORD *)buf = 138412546;
        id v272 = v39;
        __int16 v273 = 2112;
        id v274 = v22;
        _os_log_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_INFO, "Warn: Couldn't serialize private share PCS for share %@: %@", buf, 0x16u);
      }
      uint64_t v40 = 0;
      uint64_t v41 = 0;
LABEL_49:
      __int16 v78 = 0;
      if (!a3) {
        goto LABEL_75;
      }
LABEL_66:
      if (v22)
      {
        *a3 = v22;
LABEL_76:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v165 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          v168 = v165;
          v171 = objc_msgSend_shareID(self, v169, v170);
          *(_DWORD *)buf = 138412546;
          id v272 = v171;
          __int16 v273 = 2112;
          id v274 = v22;
          _os_log_error_impl(&dword_1C4CFF000, v168, OS_LOG_TYPE_ERROR, "Failed to serialize PCS data for share %@: %@", buf, 0x16u);
        }
        BOOL v166 = 0;
        goto LABEL_81;
      }
      goto LABEL_75;
    }
    BOOL v25 = objc_msgSend_share(self, v23, v24);
    objc_msgSend_setInvitedProtectionData_(v25, v26, (uint64_t)v21);

    uint64_t v29 = objc_msgSend_sharePCSData(self, v27, v28);
    objc_msgSend_setPcsData_(v29, v30, (uint64_t)v21);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v42 = objc_msgSend_pcsManager(self, v11, v12);
  uint64_t v45 = objc_msgSend_share(self, v43, v44);
  uint64_t v48 = objc_msgSend_privatePCS(v45, v46, v47);
  id v269 = 0;
  uint64_t v41 = objc_msgSend_etagFromSharePCS_error_(v42, v49, v48, &v269);
  id v22 = v269;

  if (!v41 || v22)
  {
    if (!v22)
    {
      id v133 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v134 = *MEMORY[0x1E4F19DD8];
      v135 = objc_msgSend_shareID(self, v50, v51);
      objc_msgSend_errorWithDomain_code_format_(v133, v136, v134, 5002, @"Couldn't create a PCS etag for share %@: %@", v135, 0);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v137 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      __int16 v138 = v137;
      v141 = objc_msgSend_shareID(self, v139, v140);
      *(_DWORD *)buf = 138412546;
      id v272 = v141;
      __int16 v273 = 2112;
      id v274 = v22;
      _os_log_impl(&dword_1C4CFF000, v138, OS_LOG_TYPE_INFO, "Warn: Couldn't create a PCS etag for share %@: %@", buf, 0x16u);
    }
    uint64_t v40 = 0;
    goto LABEL_49;
  }
  uint64_t v52 = objc_msgSend_share(self, v50, v51);
  objc_msgSend_setInvitedProtectionEtag_(v52, v53, (uint64_t)v41);

  BOOL v56 = objc_msgSend_sharePCSData(self, v54, v55);
  objc_msgSend_setEtag_(v56, v57, (uint64_t)v41);

  long long v60 = objc_msgSend_share(self, v58, v59);
  uint64_t v63 = objc_msgSend_privatePCS(v60, v61, v62);
  v66 = objc_msgSend_sharePCSData(self, v64, v65);
  objc_msgSend_setInvitedPCS_(v66, v67, v63);

  uint64_t v70 = objc_msgSend_pcsManager(self, v68, v69);
  v73 = objc_msgSend_share(self, v71, v72);
  uint64_t v76 = objc_msgSend_publicPCS(v73, v74, v75);
  id v268 = 0;
  __int16 v78 = objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v70, v77, v76, 0, &v268);
  id v22 = v268;

  if (!v78 || v22)
  {
    if (!v22)
    {
      v142 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v143 = *MEMORY[0x1E4F19DD8];
      v144 = objc_msgSend_shareID(self, v79, v80);
      objc_msgSend_errorWithDomain_code_format_(v142, v145, v143, 5002, @"Couldn't serialize public share PCS for share %@: %@", v144, 0);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v146 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      v147 = v146;
      v150 = objc_msgSend_shareID(self, v148, v149);
      *(_DWORD *)buf = 138412546;
      id v272 = v150;
      __int16 v273 = 2112;
      id v274 = v22;
      _os_log_impl(&dword_1C4CFF000, v147, OS_LOG_TYPE_INFO, "Warn: Couldn't serialize public share PCS for share %@: %@", buf, 0x16u);
    }
    uint64_t v40 = 0;
    if (!a3) {
      goto LABEL_75;
    }
    goto LABEL_66;
  }
  uint64_t v81 = objc_msgSend_pcsManager(self, v79, v80);
  uint64_t v84 = objc_msgSend_share(self, v82, v83);
  uint64_t v87 = objc_msgSend_publicPCS(v84, v85, v86);
  id v267 = 0;
  uint64_t v40 = objc_msgSend_etagFromSharePCS_error_(v81, v88, v87, &v267);
  id v22 = v267;

  if (!v40 || v22)
  {
    if (!v22)
    {
      v151 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v152 = *MEMORY[0x1E4F19DD8];
      v153 = objc_msgSend_shareID(self, v89, v90);
      objc_msgSend_errorWithDomain_code_format_(v151, v154, v152, 5002, @"Couldn't create a public PCS etag for share %@: %@", v153, 0);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v155 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
    {
      v156 = v155;
      v159 = objc_msgSend_shareID(self, v157, v158);
      *(_DWORD *)buf = 138412546;
      id v272 = v159;
      __int16 v273 = 2112;
      id v274 = v22;
      _os_log_impl(&dword_1C4CFF000, v156, OS_LOG_TYPE_INFO, "Warn: Couldn't create a public PCS etag for share %@: %@", buf, 0x16u);
    }
    if (!a3) {
      goto LABEL_75;
    }
    goto LABEL_66;
  }
  v91 = objc_msgSend_sharedZonePCSData(self, v89, v90);
  if (!objc_msgSend_pcs(v91, v92, v93))
  {
LABEL_90:

    goto LABEL_91;
  }
  uint64_t v96 = objc_msgSend_role(v8, v94, v95);

  if (v96 != 1)
  {
LABEL_91:
    v218 = objc_msgSend_share(self, v97, v98);
    objc_msgSend_setPublicProtectionData_(v218, v219, (uint64_t)v78);

    v222 = objc_msgSend_share(self, v220, v221);
    objc_msgSend_setPublicProtectionEtag_(v222, v223, (uint64_t)v40);

    v226 = objc_msgSend_share(self, v224, v225);
    uint64_t v229 = objc_msgSend_publicPCS(v226, v227, v228);
    v232 = objc_msgSend_sharePCSData(self, v230, v231);
    objc_msgSend_setPublicPCS_(v232, v233, v229);

    v236 = objc_msgSend_sharePCSData(self, v234, v235);
    objc_msgSend_setPublicPCSData_(v236, v237, (uint64_t)v78);

    v240 = objc_msgSend_sharePCSData(self, v238, v239);
    objc_msgSend_setPublicPCSEtag_(v240, v241, (uint64_t)v40);

    BOOL v166 = 1;
    goto LABEL_92;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v99 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v247 = v99;
    v250 = objc_msgSend_shareID(self, v248, v249);
    *(_DWORD *)buf = 138412290;
    id v272 = v250;
    _os_log_debug_impl(&dword_1C4CFF000, v247, OS_LOG_TYPE_DEBUG, "Serializing zone PCS for plugin-field update to create zone-wide share %@", buf, 0xCu);
  }
  v259 = objc_msgSend_pcsManager(self, v100, v101);
  v104 = objc_msgSend_sharedZonePCSData(self, v102, v103);
  uint64_t v107 = objc_msgSend_pcs(v104, v105, v106);
  id v266 = 0;
  uint64_t v109 = objc_msgSend_dataFromZonePCS_error_(v259, v108, v107, &v266);
  id v22 = v266;

  v110 = (void *)v109;
  if (v109 && !v22)
  {
    v113 = objc_msgSend_sharedZonePCSData(self, v111, v112);
    uint64_t v116 = objc_msgSend_zoneishPCS(v113, v114, v115);

    v263 = v110;
    if (v116)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v117 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v251 = v117;
        v254 = objc_msgSend_shareID(self, v252, v253);
        *(_DWORD *)buf = 138412290;
        id v272 = v254;
        _os_log_debug_impl(&dword_1C4CFF000, v251, OS_LOG_TYPE_DEBUG, "Serializing zoneish PCS for plugin-field update to create zone-wide share %@", buf, 0xCu);
      }
      v260 = objc_msgSend_pcsManager(self, v118, v119);
      v122 = objc_msgSend_sharedZonePCSData(self, v120, v121);
      uint64_t v125 = objc_msgSend_zoneishPCS(v122, v123, v124);
      id v265 = 0;
      v91 = objc_msgSend_dataFromRecordPCS_error_(v260, v126, v125, &v265);
      id v22 = v265;

      if (!v91 || v22)
      {
        if (!v22)
        {
          v261 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v129 = *MEMORY[0x1E4F19DD8];
          v130 = objc_msgSend_shareID(self, v127, v128);
          objc_msgSend_errorWithDomain_code_format_(v261, v131, v129, 5002, @"Couldn't serialize zoneish update PCS for share %@: %@", v130, 0);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v132 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v272 = v22;
          _os_log_error_impl(&dword_1C4CFF000, v132, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS trying to create zone-wide share: %@", buf, 0xCu);
        }

        v110 = v263;
        goto LABEL_74;
      }
    }
    else
    {
      v91 = 0;
    }
    id v172 = objc_alloc(MEMORY[0x1E4F1A310]);
    v175 = objc_msgSend_shareID(self, v173, v174);
    v178 = objc_msgSend_zoneID(v175, v176, v177);
    v180 = objc_msgSend_initWithZoneID_(v172, v179, (uint64_t)v178);

    uint64_t v182 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v181, (uint64_t)v263);
    objc_msgSend_setProtectionData_(v180, v183, (uint64_t)v263);
    v257 = (void *)v182;
    objc_msgSend_setProtectionEtag_(v180, v184, v182);
    objc_msgSend_setZoneishProtectionData_(v180, v185, (uint64_t)v91);
    v188 = objc_msgSend_operation(self, v186, v187);
    v191 = objc_msgSend_translator(v188, v189, v190);
    v258 = v180;
    v262 = objc_msgSend_pRecordZoneFromRecordZone_(v191, v192, (uint64_t)v180);

    v195 = objc_msgSend_share(self, v193, v194);
    v200 = objc_msgSend_pluginFields(v195, v196, v197);
    if (v200)
    {
      objc_msgSend_share(self, v198, v199);
      v201 = v255 = v200;
      objc_msgSend_pluginFields(v201, v202, v203);
      v204 = v256 = v195;
      v207 = objc_msgSend_mutableCopy(v204, v205, v206);

      v195 = v256;
      v200 = v255;
    }
    else
    {
      v207 = objc_opt_new();
    }

    v210 = objc_msgSend_data(v262, v208, v209);
    objc_msgSend_setObject_forKeyedSubscript_(v207, v211, (uint64_t)v210, @"___zoneUpdateData");

    if (*MEMORY[0x1E4F1A4E0])
    {
      objc_msgSend_setObject_forKeyedSubscript_(v207, v212, (uint64_t)v263, @"_rawZonePCSUpdateByes");
      objc_msgSend_setObject_forKeyedSubscript_(v207, v214, (uint64_t)v257, @"_rawZonePCSUpdateEtag");
      objc_msgSend_setObject_forKeyedSubscript_(v207, v215, (uint64_t)v91, @"_rawZoneishPCSUpdateByes");
    }
    v216 = objc_msgSend_share(self, v212, v213);
    objc_msgSend_setPluginFields_(v216, v217, (uint64_t)v207);

    goto LABEL_90;
  }
  if (!v22)
  {
    v160 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v161 = *MEMORY[0x1E4F19DD8];
    objc_msgSend_shareID(self, v111, v112);
    v162 = v264 = v110;
    objc_msgSend_errorWithDomain_code_format_(v160, v163, v161, 5002, @"Couldn't serialize zone update PCS for share %@: %@", v162, 0);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    v110 = v264;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v164 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v272 = v22;
    _os_log_error_impl(&dword_1C4CFF000, v164, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS trying to create zone-wide share: %@", buf, 0xCu);
  }
LABEL_74:

  if (a3) {
    goto LABEL_66;
  }
LABEL_75:
  if (v22) {
    goto LABEL_76;
  }
  BOOL v166 = 0;
LABEL_92:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v242 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    v243 = v242;
    v246 = objc_msgSend_shareID(self, v244, v245);
    *(_DWORD *)buf = 138412290;
    id v272 = v246;
    _os_log_impl(&dword_1C4CFF000, v243, OS_LOG_TYPE_INFO, "Successfully serialized PCS data for share %@", buf, 0xCu);
  }
LABEL_81:

  return v166;
}

- (BOOL)_updateSharePublicPCSWithError:(id *)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_pcsManager(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_share(self, v6, v7);
  uint64_t v11 = objc_msgSend_privatePCS(v8, v9, v10);
  uint64_t v14 = objc_msgSend_share(self, v12, v13);
  uint64_t v17 = objc_msgSend_publicPCS(v14, v15, v16);
  id v127 = 0;
  char v19 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(v5, v18, v11, v17, 0, &v127);
  id v20 = v127;

  if (v19)
  {
    uint64_t v23 = objc_msgSend_share(self, v21, v22);
    uint64_t v26 = objc_msgSend_currentUserParticipant(v23, v24, v25);

    if (objc_msgSend_role(v26, v27, v28) == 1 || objc_msgSend_role(v26, v29, v30) == 2)
    {
      os_log_t v31 = objc_msgSend_share(self, v29, v30);
      if (objc_msgSend_publicPermission(v31, v32, v33) == 2)
      {
LABEL_7:

LABEL_8:
        id v43 = objc_msgSend_pcsManager(self, v41, v42);
        uint64_t v46 = objc_msgSend_share(self, v44, v45);
        uint64_t v49 = objc_msgSend_publicPCS(v46, v47, v48);
        uint64_t v52 = objc_msgSend_share(self, v50, v51);
        uint64_t v55 = objc_msgSend_privatePCS(v52, v53, v54);
        id v126 = v20;
        BOOL v56 = 1;
        char v58 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(v43, v57, v49, v55, 1, &v126);
        id v59 = v126;

        if (v58)
        {
LABEL_36:
          id v20 = v59;
          goto LABEL_37;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        long long v60 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          uint64_t v63 = v60;
          v66 = objc_msgSend_shareID(self, v64, v65);
          *(_DWORD *)buf = 138412546;
          uint64_t v129 = v66;
          __int16 v130 = 2112;
          id v131 = v59;
          _os_log_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_INFO, "Error adding public sharing PCS to private sharing PCS for share %@: %@", buf, 0x16u);
        }
        if (a3)
        {
          __int16 v67 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v68 = *MEMORY[0x1E4F19DD8];
          uint64_t v69 = objc_msgSend_shareID(self, v61, v62);
          objc_msgSend_errorWithDomain_code_format_(v67, v70, v68, 5004, @"Error adding public sharing PCS to private sharing PCS for share %@: %@", v69, v59);
          __int16 v71 = LABEL_15:;
          id v20 = v59;
          goto LABEL_22;
        }
LABEL_35:
        BOOL v56 = 0;
        goto LABEL_36;
      }
      uint64_t v36 = objc_msgSend_share(self, v34, v35);
      if (objc_msgSend_publicPermission(v36, v37, v38) == 3)
      {

        goto LABEL_7;
      }
      __int16 v82 = objc_msgSend_share(self, v39, v40);
      uint64_t v85 = objc_msgSend_publicPermission(v82, v83, v84);

      if (v85 == 4) {
        goto LABEL_8;
      }
      uint64_t v86 = objc_msgSend_pcsManager(self, v41, v42);
      v89 = objc_msgSend_share(self, v87, v88);
      uint64_t v92 = objc_msgSend_publicPCS(v89, v90, v91);
      uint64_t v95 = objc_msgSend_share(self, v93, v94);
      uint64_t v98 = objc_msgSend_privatePCS(v95, v96, v97);
      id v125 = v20;
      char v100 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(v86, v99, v92, v98, &v125);
      id v59 = v125;

      if ((v100 & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v103 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          uint64_t v106 = v103;
          uint64_t v109 = objc_msgSend_shareID(self, v107, v108);
          *(_DWORD *)buf = 138412546;
          uint64_t v129 = v109;
          __int16 v130 = 2112;
          id v131 = v59;
          _os_log_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_INFO, "Error removing public sharing PCS from private sharing PCS for share %@: %@", buf, 0x16u);
        }
        if (a3)
        {
          v110 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v111 = *MEMORY[0x1E4F19DD8];
          uint64_t v69 = objc_msgSend_shareID(self, v104, v105);
          objc_msgSend_errorWithDomain_code_format_(v110, v112, v111, 5004, @"Error removing public sharing PCS from private sharing PCS for share %@: %@", v69, v59);
          goto LABEL_15;
        }
        goto LABEL_35;
      }
      id v124 = v59;
      char v102 = objc_msgSend__cleanPublicPCSforShareWithError_(self, v101, (uint64_t)&v124);
      id v20 = v124;

      if ((v102 & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v114 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          v117 = v114;
          uint64_t v120 = objc_msgSend_shareID(self, v118, v119);
          *(_DWORD *)buf = 138412546;
          uint64_t v129 = v120;
          __int16 v130 = 2112;
          id v131 = v20;
          _os_log_impl(&dword_1C4CFF000, v117, OS_LOG_TYPE_INFO, "Error cleaning up public PCS for share %@: %@", buf, 0x16u);
        }
        if (!a3) {
          goto LABEL_24;
        }
        uint64_t v121 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v122 = *MEMORY[0x1E4F19DD8];
        uint64_t v69 = objc_msgSend_shareID(self, v115, v116);
        __int16 v71 = objc_msgSend_errorWithDomain_code_format_(v121, v123, v122, 5004, @"Error cleaning up public PCS for share %@: %@", v69, v20);
        goto LABEL_22;
      }
    }
    BOOL v56 = 1;
    goto LABEL_37;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v72 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v75 = v72;
    __int16 v78 = objc_msgSend_shareID(self, v76, v77);
    *(_DWORD *)buf = 138412546;
    uint64_t v129 = v78;
    __int16 v130 = 2112;
    id v131 = v20;
    _os_log_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_INFO, "Error adding private sharing PCS to public sharing PCS for share %@: %@", buf, 0x16u);
  }
  if (!a3)
  {
    uint64_t v26 = 0;
    goto LABEL_24;
  }
  uint64_t v79 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v80 = *MEMORY[0x1E4F19DD8];
  uint64_t v69 = objc_msgSend_shareID(self, v73, v74);
  __int16 v71 = objc_msgSend_errorWithDomain_code_format_(v79, v81, v80, 5004, @"Error adding private sharing PCS to public sharing PCS for share %@: %@", v69, v20);
  uint64_t v26 = 0;
LABEL_22:
  *a3 = v71;

LABEL_24:
  BOOL v56 = 0;
LABEL_37:

  return v56;
}

- (BOOL)_cleanPublicPCSforShareWithError:(id *)a3
{
  v3 = self;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_share(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_publicPermission(v4, v5, v6);

  if (v7 <= 1)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v10 = objc_msgSend_share(v3, v8, v9);
    uint64_t v13 = objc_msgSend_participants(v10, v11, v12);
    uint64_t v16 = objc_msgSend_copy(v13, v14, v15);

    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v45, v53, 16);
    if (v18)
    {
      uint64_t v22 = v18;
      uint64_t v23 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
      uint64_t v24 = *(void *)v46;
      uint64_t v25 = (os_log_t *)MEMORY[0x1E4F1A500];
      *(void *)&long long v21 = 138412546;
      long long v43 = v21;
      do
      {
        uint64_t v26 = 0;
        uint64_t v44 = v22;
        do
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v16);
          }
          uint64_t v27 = *(void **)(*((void *)&v45 + 1) + 8 * v26);
          if (objc_msgSend_role(v27, v19, v20, v43) == 4)
          {
            if (*v23 != -1) {
              dispatch_once(v23, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            os_log_t v28 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v30 = v28;
              uint64_t v33 = objc_msgSend_participantID(v27, v31, v32);
              objc_msgSend_shareID(v3, v34, v35);
              uint64_t v36 = v24;
              uint64_t v37 = v16;
              uint64_t v38 = v23;
              uint64_t v39 = v25;
              v41 = uint64_t v40 = v3;
              *(_DWORD *)buf = v43;
              id v50 = v33;
              __int16 v51 = 2112;
              uint64_t v52 = v41;
              _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Removing public participant %@ from share %@.", buf, 0x16u);

              v3 = v40;
              uint64_t v25 = v39;
              uint64_t v23 = v38;
              uint64_t v16 = v37;
              uint64_t v24 = v36;
              uint64_t v22 = v44;
            }
            objc_msgSend_setAcceptanceStatus_(v27, v29, 3);
          }
          ++v26;
        }
        while (v22 != v26);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v45, v53, 16);
      }
      while (v22);
    }
  }
  return 1;
}

- (void)_addPublicKeyToSelfParticipantWithCompletionHandler:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  if (!objc_msgSend_haveAddedOwnerToShare(self, v5, v6)
    || !objc_msgSend_isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade(self, v7, v8))
  {
    if ((objc_msgSend_haveAddedOwnerToShare(self, v7, v8) & 1) != 0
      || (objc_msgSend_share(self, v27, v28),
          uint64_t v29 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_currentUserParticipant(v29, v30, v31),
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          uint64_t v35 = objc_msgSend_role(v32, v33, v34),
          v32,
          v29,
          v35 != 1))
    {
      v4[2](v4, 0);
      goto LABEL_45;
    }
    objc_msgSend_setHaveAddedOwnerToShare_(self, v36, 1);
    uint64_t v39 = objc_msgSend_share(self, v37, v38);
    uint64_t v42 = objc_msgSend_currentUserParticipant(v39, v40, v41);

    long long v45 = objc_msgSend_operation(self, v43, v44);
    if (objc_msgSend_isCloudDocsContainer(self, v46, v47))
    {
      uint64_t v50 = 1;
    }
    else
    {
      uint64_t v52 = objc_msgSend_container(v45, v48, v49);
      uint64_t v55 = objc_msgSend_pcsManager(v52, v53, v54);
      int IsManatee = objc_msgSend_currentServiceIsManatee(v55, v56, v57);

      if (IsManatee) {
        uint64_t v50 = 0;
      }
      else {
        uint64_t v50 = 2;
      }
    }
    id v59 = objc_msgSend_pcsManager(self, v48, v49);
    uint64_t v61 = objc_msgSend_publicKeyVersionForServiceType_(v59, v60, v50);
    uint64_t v64 = objc_msgSend_userIdentity(v42, v62, v63);
    objc_msgSend_setPublicKeyVersion_(v64, v65, v61);

    uint64_t v68 = objc_msgSend_pcsManager(self, v66, v67);
    id v146 = 0;
    v141 = objc_msgSend_participantPublicKeyForServiceType_error_(v68, v69, v50, &v146);
    id v70 = v146;

    if (*MEMORY[0x1E4F1A4E0])
    {
      v73 = objc_msgSend_unitTestOverrides(v45, v71, v72);
      uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v73, v74, @"NoOwnerPublicKey");
      BOOL v76 = v75 == 0;

      if (!v76)
      {

        v141 = 0;
LABEL_30:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v87 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          v118 = v87;
          uint64_t v121 = objc_msgSend_shareID(self, v119, v120);
          *(_DWORD *)id location = 138412546;
          *(void *)&location[4] = v121;
          __int16 v148 = 2112;
          id v149 = v70;
          _os_log_error_impl(&dword_1C4CFF000, v118, OS_LOG_TYPE_ERROR, "Couldn't get a current public sharing identity for the owner on share %@. Error: %@. Synchronizing key chain and retrying...", location, 0x16u);
        }
        objc_initWeak((id *)location, self);
        uint64_t v90 = objc_msgSend_container(v45, v88, v89);
        uint64_t v93 = objc_msgSend_pcsManager(v90, v91, v92);
        uint64_t v96 = objc_msgSend_operationID(v45, v94, v95);
        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = sub_1C4EAE67C;
        v142[3] = &unk_1E64F4CF0;
        objc_copyWeak(v145, (id *)location);
        id v143 = v42;
        v145[1] = (id)v50;
        v144 = v4;
        objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v93, v97, v50, 1, 0x1F2058770, v96, v142);

        objc_destroyWeak(v145);
        objc_destroyWeak((id *)location);
        goto LABEL_44;
      }
    }
    if (!v141 || v70) {
      goto LABEL_30;
    }
    uint64_t v77 = objc_msgSend_userIdentity(v42, v71, v72);
    objc_msgSend_setPublicSharingKey_(v77, v78, (uint64_t)v141);

    uint64_t v79 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v80 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v81 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      id v127 = v81;
      __int16 v130 = objc_msgSend_userIdentity(v42, v128, v129);
      id v133 = objc_msgSend_publicSharingKey(v130, v131, v132);
      __int16 v136 = objc_msgSend_shareID(self, v134, v135);
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v133;
      __int16 v148 = 2112;
      id v149 = v136;
      _os_log_debug_impl(&dword_1C4CFF000, v127, OS_LOG_TYPE_DEBUG, "Added public sharing identity %{public}@ to our self owner user on share %@", location, 0x16u);
    }
    uint64_t v84 = objc_msgSend_protectionInfo(v42, v82, v83, v141);
    if (v84)
    {
    }
    else
    {
      uint64_t v98 = objc_msgSend_share(self, v85, v86);
      uint64_t v101 = objc_msgSend_addedParticipants(v98, v99, v100);
      char v103 = objc_msgSend_containsObject_(v101, v102, (uint64_t)v42);

      if ((v103 & 1) == 0)
      {
        objc_msgSend_setIsALegacyPublicShareThatNeedsOwnerPPPCSUpgrade_(self, v104, 1);
        uint64_t v107 = objc_msgSend_share(self, v105, v106);
        uint64_t v110 = objc_msgSend_privatePCS(v107, v108, v109);

        if (v110)
        {
          v113 = objc_msgSend_share(self, v111, v112);
          uint64_t v116 = objc_msgSend_privatePCS(v113, v114, v115);
          objc_msgSend__ensurePrivateParticipant_isInInvitedSharePCS_(self, v117, (uint64_t)v42, v116);
          id v70 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
          ((void (**)(id, id))v4)[2](v4, v70);
LABEL_44:

          goto LABEL_45;
        }
        if (*v79 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v126 = *v80;
        if (os_log_type_enabled(*v80, OS_LOG_TYPE_DEBUG))
        {
          v137 = v126;
          uint64_t v140 = objc_msgSend_shareID(self, v138, v139);
          *(_DWORD *)id location = 138412290;
          *(void *)&location[4] = v140;
          _os_log_debug_impl(&dword_1C4CFF000, v137, OS_LOG_TYPE_DEBUG, "Couldn't get a private PCS for the share %@, so we can't upgrade our owner's PPPCS", location, 0xCu);
        }
      }
    }
    id v70 = 0;
    goto LABEL_43;
  }
  uint64_t v9 = objc_msgSend_share(self, v7, v8);
  uint64_t v12 = objc_msgSend_privatePCS(v9, v10, v11);

  if (v12)
  {
    uint64_t v15 = objc_msgSend_share(self, v13, v14);
    uint64_t v18 = objc_msgSend_currentUserParticipant(v15, v16, v17);

    long long v21 = objc_msgSend_share(self, v19, v20);
    uint64_t v24 = objc_msgSend_privatePCS(v21, v22, v23);
    uint64_t v26 = objc_msgSend__ensurePrivateParticipant_isInInvitedSharePCS_(self, v25, (uint64_t)v18, v24);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v51 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v122 = v51;
      id v125 = objc_msgSend_shareID(self, v123, v124);
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v125;
      _os_log_debug_impl(&dword_1C4CFF000, v122, OS_LOG_TYPE_DEBUG, "Couldn't get a private PCS for the share %@, so we can't upgrade our owner's PPPCS", location, 0xCu);
    }
    uint64_t v26 = 0;
  }
  ((void (**)(id, void *))v4)[2](v4, v26);

LABEL_45:
}

- (BOOL)_setupParticipantsProtectionInfos:(id *)a3
{
  uint64_t v384 = *MEMORY[0x1E4F143B8];
  id v5 = (id)*MEMORY[0x1E4F1A548];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v5);
  }

  uint64_t v6 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v267 = objc_msgSend_shareID(self, v7, v8);
    *(_DWORD *)buf = 138412290;
    uint64_t v370 = (uint64_t)v267;
    _os_log_debug_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_DEBUG, "Checking participants on share %@", buf, 0xCu);
  }
  uint64_t v11 = objc_msgSend_share(self, v9, v10);
  uint64_t v14 = objc_msgSend_allParticipants(v11, v12, v13);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);

  if (!v17) {
    return 1;
  }
  uint64_t v20 = objc_msgSend_share(self, v18, v19);
  uint64_t v23 = objc_msgSend_privatePCS(v20, v21, v22);

  uint64_t v332 = v23;
  if (!v23)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v35 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v298 = v35;
      v301 = objc_msgSend_shareID(self, v299, v300);
      *(_DWORD *)buf = 138412290;
      uint64_t v370 = (uint64_t)v301;
      _os_log_error_impl(&dword_1C4CFF000, v298, OS_LOG_TYPE_ERROR, "Couldn't get invitedPCS for share %@", buf, 0xCu);
    }
    uint64_t v38 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v39 = *MEMORY[0x1E4F19DD8];
    uint64_t v40 = objc_msgSend_shareID(self, v36, v37);
    objc_msgSend_errorWithDomain_code_format_(v38, v41, v39, 5004, @"Couldn't create invited PCS for share %@", v40);
    id v42 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v42 = v42;
      BOOL v34 = 0;
      *a3 = v42;
      goto LABEL_169;
    }
    goto LABEL_168;
  }
  uint64_t v26 = objc_msgSend_share(self, v24, v25);
  uint64_t v29 = objc_msgSend_currentUserParticipant(v26, v27, v28);
  v331 = self;
  if (objc_msgSend_role(v29, v30, v31) == 2)
  {
  }
  else
  {
    long long v43 = objc_msgSend_share(self, v32, v33);
    long long v46 = objc_msgSend_currentUserParticipant(v43, v44, v45);
    uint64_t v49 = objc_msgSend_role(v46, v47, v48);

    if (v49 != 1)
    {
      v200 = 0;
      goto LABEL_111;
    }
  }
  v321 = a3;
  uint64_t v52 = objc_opt_new();
  uint64_t v55 = objc_msgSend_share(self, v53, v54);
  char v58 = objc_msgSend_addedParticipants(v55, v56, v57);
  objc_msgSend_addObjectsFromArray_(v52, v59, (uint64_t)v58);

  long long v367 = 0u;
  long long v368 = 0u;
  long long v365 = 0u;
  long long v366 = 0u;
  uint64_t v62 = objc_msgSend_share(self, v60, v61);
  uint64_t v65 = objc_msgSend_allParticipants(v62, v63, v64);

  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v365, v383, 16);
  if (v67)
  {
    uint64_t v70 = v67;
    uint64_t v71 = *(void *)v366;
    do
    {
      uint64_t v72 = 0;
      do
      {
        if (*(void *)v366 != v71) {
          objc_enumerationMutation(v65);
        }
        v73 = *(void **)(*((void *)&v365 + 1) + 8 * v72);
        if (objc_msgSend_wantsNewInvitationToken(v73, v68, v69))
        {
          id v74 = (id)*MEMORY[0x1E4F1A548];
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v74);
          }

          uint64_t v75 = (id)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v79 = objc_msgSend_shareID(v331, v76, v77);
            *(_DWORD *)buf = 138412546;
            uint64_t v370 = (uint64_t)v73;
            __int16 v371 = 2112;
            id v372 = v79;
            _os_log_debug_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_DEBUG, "Participant %@ wants a new invitation token on share %@", buf, 0x16u);
          }
          objc_msgSend_addObject_(v52, v78, (uint64_t)v73);
        }
        ++v72;
      }
      while (v70 != v72);
      uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v365, v383, 16);
    }
    while (v70);
  }

  __int16 v82 = objc_msgSend_share(v331, v80, v81);
  uint64_t v85 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v82, v83, v84);
  uint64_t v86 = v85;
  if (v85)
  {
    id v325 = v85;
  }
  else
  {
    id v325 = (id)objc_opt_new();
  }
  long long v363 = 0u;
  long long v364 = 0u;
  long long v361 = 0u;
  long long v362 = 0u;
  id v87 = v52;
  uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v361, v382, 16);
  uint64_t v92 = v331;
  uint64_t v93 = v325;
  if (v89)
  {
    uint64_t v94 = v89;
    uint64_t v95 = *(void *)v362;
    uint64_t v323 = *(void *)v362;
    do
    {
      uint64_t v96 = 0;
      uint64_t v326 = v94;
      do
      {
        if (*(void *)v362 != v95) {
          objc_enumerationMutation(v87);
        }
        uint64_t v97 = *(void **)(*((void *)&v361 + 1) + 8 * v96);
        if (objc_msgSend_usesOneTimeURL(v97, v90, v91))
        {
          uint64_t v98 = objc_msgSend_participantID(v97, v90, v91);
          uint64_t v100 = objc_msgSend_objectForKeyedSubscript_(v93, v99, (uint64_t)v98);

          if (!v100)
          {
            uint64_t v101 = objc_msgSend_operation(v92, v90, v91);
            v104 = objc_msgSend_container(v101, v102, v103);
            uint64_t v107 = objc_msgSend_pcsManager(v104, v105, v106);
            id v360 = 0;
            uint64_t v109 = objc_msgSend_generateOONPrivateKeyWithError_(v107, v108, (uint64_t)&v360);
            id v42 = v360;

            if (v42 || !v109)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v180 = v325;
              uint64_t v239 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                v302 = v239;
                objc_msgSend_shareID(v331, v303, v304);
                v306 = id v305 = v42;
                *(_DWORD *)buf = 138412546;
                uint64_t v370 = (uint64_t)v306;
                __int16 v371 = 2112;
                id v372 = v305;
                _os_log_error_impl(&dword_1C4CFF000, v302, OS_LOG_TYPE_ERROR, "Couldn't configure new one-time URL participant on share %@: %@", buf, 0x16u);

                id v42 = v305;
                if (v321)
                {
LABEL_108:
                  v242 = (void *)MEMORY[0x1E4F1A280];
                  id v243 = v42;
                  uint64_t v244 = *MEMORY[0x1E4F19DD8];
                  uint64_t v245 = objc_msgSend_shareID(v331, v240, v241);
                  uint64_t v246 = v244;
                  id v42 = v243;
                  objc_msgSend_errorWithDomain_code_error_format_(v242, v247, v246, 5005, v243, @"Couldn't configure new participant on share %@", v245);
                  id *v321 = (id)objc_claimAutoreleasedReturnValue();
                }
              }
              else if (v321)
              {
                goto LABEL_108;
              }

              v175 = v87;
              goto LABEL_167;
            }
            uint64_t v112 = objc_msgSend_userIdentity(v97, v110, v111);
            objc_msgSend_setOutOfNetworkPrivateKey_(v112, v113, (uint64_t)v109);

            id v114 = objc_alloc(MEMORY[0x1E4F1A1F8]);
            obja = v109;
            uint64_t v92 = v331;
            v117 = objc_msgSend_share(v331, v115, v116);
            uint64_t v120 = objc_msgSend_mutableEncryptedPSK(v117, v118, v119);
            objc_msgSend_data(v120, v121, v122);
            uint64_t v124 = v123 = v87;
            id v127 = objc_msgSend_oneTimeURLSharingKeySeed(v97, v125, v126);
            __int16 v130 = objc_msgSend_participantID(v97, v128, v129);
            uint64_t v132 = objc_msgSend_initWithSharingKeyBytes_sharingKeySeed_participantID_(v114, v131, (uint64_t)v124, v127, v130);

            id v87 = v123;
            uint64_t v94 = v326;

            uint64_t v135 = objc_msgSend_participantID(v97, v133, v134);
            uint64_t v93 = v325;
            objc_msgSend_setObject_forKeyedSubscript_(v325, v136, (uint64_t)v132, v135);

            uint64_t v95 = v323;
          }
        }
        ++v96;
      }
      while (v94 != v96);
      uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v361, v382, 16);
    }
    while (v94);
  }

  if (objc_msgSend_count(v93, v137, v138))
  {
    v141 = objc_msgSend_share(v92, v139, v140);
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v141, v142, (uint64_t)v93);
  }
  long long v358 = 0u;
  long long v359 = 0u;
  long long v356 = 0u;
  long long v357 = 0u;
  id v143 = v87;
  uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v356, v381, 16);
  v322 = v143;
  if (v145)
  {
    uint64_t v148 = v145;
    uint64_t v149 = *(void *)v357;
    do
    {
      uint64_t v150 = 0;
      do
      {
        if (*(void *)v357 != v149) {
          objc_enumerationMutation(v143);
        }
        v151 = *(void **)(*((void *)&v356 + 1) + 8 * v150);
        if (objc_msgSend_role(v151, v146, v147) == 3
          || objc_msgSend_role(v151, v152, v153) == 2
          || objc_msgSend_role(v151, v154, v155) == 1)
        {
          id v156 = (id)*MEMORY[0x1E4F1A548];
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v156);
          }

          v157 = (id)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
          {
            v169 = objc_msgSend_shareID(v331, v158, v159);
            *(_DWORD *)buf = 138412546;
            uint64_t v370 = (uint64_t)v151;
            __int16 v371 = 2112;
            id v372 = v169;
            _os_log_debug_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_DEBUG, "Setting up private participant %@ on share %@", buf, 0x16u);
          }
          uint64_t v161 = objc_msgSend__ensurePrivateParticipant_isInInvitedSharePCS_(v331, v160, (uint64_t)v151, v332);
          if (v161)
          {
            v264 = (void *)v161;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v180 = v325;
            id v265 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              v307 = v265;
              v310 = objc_msgSend_shareID(v331, v308, v309);
              *(_DWORD *)buf = 138412546;
              uint64_t v370 = (uint64_t)v310;
              __int16 v371 = 2112;
              id v372 = v264;
              _os_log_error_impl(&dword_1C4CFF000, v307, OS_LOG_TYPE_ERROR, "Couldn't configure new participant on share %@: %@", buf, 0x16u);

              if (!v321) {
                goto LABEL_165;
              }
LABEL_131:
              id v266 = v264;
              id *v321 = v266;
              id v42 = v266;
            }
            else
            {
              if (v321) {
                goto LABEL_131;
              }
LABEL_165:
              id v42 = v264;
            }
            v175 = v322;
            goto LABEL_167;
          }
          if (objc_msgSend_isCurrentUser(v151, v162, v163))
          {
            v164 = objc_msgSend_protectionInfo(v151, v146, v147);
            v167 = objc_msgSend_sharePCSData(v331, v165, v166);
            objc_msgSend_setMyParticipantPCSData_(v167, v168, (uint64_t)v164);

            id v143 = v322;
          }
        }
        ++v150;
      }
      while (v148 != v150);
      uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v356, v381, 16);
    }
    while (v148);
  }

  long long v354 = 0u;
  long long v355 = 0u;
  long long v352 = 0u;
  long long v353 = 0u;
  id v172 = objc_msgSend_share(v331, v170, v171);
  v175 = objc_msgSend_removedParticipants(v172, v173, v174);

  uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v176, (uint64_t)&v352, v380, 16);
  v180 = v325;
  if (!v177) {
    goto LABEL_74;
  }
  uint64_t v181 = v177;
  uint64_t v182 = *(void *)v353;
  do
  {
    for (uint64_t i = 0; i != v181; ++i)
    {
      if (*(void *)v353 != v182) {
        objc_enumerationMutation(v175);
      }
      v184 = *(void **)(*((void *)&v352 + 1) + 8 * i);
      if (objc_msgSend_role(v184, v178, v179) == 3 || objc_msgSend_role(v184, v178, v185) == 2)
      {
        id v351 = 0;
        objc_msgSend__removePrivateParticipantsFromInvitedPCS_error_(v331, v178, v332, &v351);
        id v186 = v351;
        if (v186)
        {
          v289 = v186;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v290 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            v316 = v290;
            v319 = objc_msgSend_shareID(v331, v317, v318);
            *(_DWORD *)buf = 138412546;
            uint64_t v370 = (uint64_t)v319;
            __int16 v371 = 2112;
            id v372 = v289;
            _os_log_error_impl(&dword_1C4CFF000, v316, OS_LOG_TYPE_ERROR, "Couldn't remove participant participant PCS for share %@: %@", buf, 0x16u);

            if (!v321) {
              goto LABEL_172;
            }
LABEL_147:
            id v42 = v289;
            id *v321 = v42;
          }
          else
          {
            if (v321) {
              goto LABEL_147;
            }
LABEL_172:
            id v42 = v289;
          }
LABEL_167:

LABEL_168:
          BOOL v34 = 0;
          goto LABEL_169;
        }
      }
    }
    uint64_t v181 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v178, (uint64_t)&v352, v380, 16);
  }
  while (v181);
LABEL_74:

  uint64_t v187 = PCSFPCopyPublicIdentities();
  v188 = objc_opt_new();
  uint64_t v346 = MEMORY[0x1E4F143A8];
  uint64_t v347 = 3221225472;
  v348 = sub_1C4EAFF4C;
  v349 = &unk_1E64F29B8;
  id v324 = v188;
  id v350 = v324;
  v320 = (void *)v187;
  CKCFArrayForEach();
  long long v344 = 0u;
  long long v345 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  v191 = objc_msgSend_share(v331, v189, v190);
  uint64_t v194 = objc_msgSend_allParticipants(v191, v192, v193);

  id obj = v194;
  uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v342, v379, 16);
  if (!v196)
  {
    v200 = 0;
    goto LABEL_163;
  }
  uint64_t v199 = v196;
  v200 = 0;
  uint64_t v201 = *(void *)v343;
  uint64_t v327 = *(void *)v343;
  while (2)
  {
    uint64_t v202 = 0;
    while (2)
    {
      if (*(void *)v343 != v201) {
        objc_enumerationMutation(obj);
      }
      uint64_t v203 = *(void **)(*((void *)&v342 + 1) + 8 * v202);
      v204 = objc_msgSend_share(v331, v197, v198);
      v207 = objc_msgSend_addedParticipants(v204, v205, v206);
      if (objc_msgSend_containsObject_(v207, v208, (uint64_t)v203))
      {
LABEL_82:

        goto LABEL_83;
      }
      v211 = objc_msgSend_share(v331, v209, v210);
      v214 = objc_msgSend_removedParticipants(v211, v212, v213);
      if (objc_msgSend_containsObject_(v214, v215, (uint64_t)v203))
      {

        goto LABEL_82;
      }
      if (objc_msgSend_role(v203, v216, v217) == 3)
      {

        goto LABEL_90;
      }
      uint64_t v220 = objc_msgSend_role(v203, v218, v219);

      BOOL v221 = v220 == 2;
      uint64_t v201 = v327;
      if (v221)
      {
LABEL_90:
        id v222 = (id)*MEMORY[0x1E4F1A548];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v222);
        }

        v223 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v223, OS_LOG_TYPE_DEBUG))
        {
          v236 = objc_msgSend_shareID(v331, v224, v225);
          *(_DWORD *)buf = 138412546;
          uint64_t v370 = (uint64_t)v203;
          __int16 v371 = 2112;
          id v372 = v236;
          _os_log_debug_impl(&dword_1C4CFF000, v223, OS_LOG_TYPE_DEBUG, "Modifying per participant PCS permission for participant %@ on share %@", buf, 0x16u);
        }
        uint64_t v228 = objc_msgSend_copy(v324, v226, v227);
        id v341 = v200;
        v230 = v200;
        int v231 = objc_msgSend__modifyRoleForParticipant_invitedPCS_shareeIdentities_error_(v331, v229, (uint64_t)v203, v332, v228, &v341);
        id v232 = v341;

        if (v231 && !v232)
        {
          v200 = 0;
          uint64_t v201 = v327;
          goto LABEL_84;
        }
        id v233 = (id)*MEMORY[0x1E4F1A548];
        uint64_t v201 = v327;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v233);
        }

        v204 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
        {
          v237 = objc_msgSend_shareID(v331, v234, v235);
          *(_DWORD *)buf = 138412546;
          uint64_t v370 = (uint64_t)v237;
          __int16 v371 = 2112;
          id v372 = v232;
          _os_log_error_impl(&dword_1C4CFF000, v204, OS_LOG_TYPE_ERROR, "Couldn't update participant PCS for participant's role on share %@: %@", buf, 0x16u);

          uint64_t v201 = v327;
        }
        v200 = v232;
LABEL_83:
      }
LABEL_84:
      if (v199 != ++v202) {
        continue;
      }
      break;
    }
    uint64_t v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v197, (uint64_t)&v342, v379, 16);
    uint64_t v199 = v238;
    if (v238) {
      continue;
    }
    break;
  }
LABEL_163:

LABEL_111:
  v328 = v200;
  long long v339 = 0u;
  long long v340 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  v248 = v331;
  uint64_t v249 = objc_msgSend_share(v331, v50, v51);
  v252 = objc_msgSend_invitedKeysToRemove(v249, v250, v251);

  uint64_t v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(v252, v253, (uint64_t)&v337, v378, 16);
  if (!v254)
  {

    goto LABEL_133;
  }
  uint64_t v256 = v254;
  uint64_t v257 = 0;
  uint64_t v258 = *(void *)v338;
  do
  {
    uint64_t v259 = 0;
    do
    {
      if (*(void *)v338 != v258) {
        objc_enumerationMutation(v252);
      }
      uint64_t v260 = *(void *)(*((void *)&v337 + 1) + 8 * v259);
      v261 = objc_msgSend__removePublicKey_fromInvitedPCS_(v248, v255, v260, v332);
      if (v261)
      {
        id v262 = (id)*MEMORY[0x1E4F1A548];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v262);
        }

        v263 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v370 = v260;
          __int16 v371 = 2112;
          id v372 = v261;
          _os_log_impl(&dword_1C4CFF000, v263, OS_LOG_TYPE_INFO, "Error removing public key %{public}@ from the invited PCS blob: %@", buf, 0x16u);
        }

        v248 = v331;
      }
      else
      {
        ++v257;
      }

      ++v259;
    }
    while (v256 != v259);
    uint64_t v256 = objc_msgSend_countByEnumeratingWithState_objects_count_(v252, v255, (uint64_t)&v337, v378, 16);
  }
  while (v256);

  if (!v257)
  {
LABEL_133:
    id v268 = (void *)PCSFPCopyPublicIdentities();
    v271 = objc_msgSend_share(v248, v269, v270);
    uint64_t v274 = objc_msgSend_publicPermission(v271, v272, v273);

    long long v335 = 0u;
    long long v336 = 0u;
    long long v333 = 0u;
    long long v334 = 0u;
    v277 = objc_msgSend_share(v248, v275, v276);
    v280 = objc_msgSend_participants(v277, v278, v279);

    uint64_t v282 = objc_msgSend_countByEnumeratingWithState_objects_count_(v280, v281, (uint64_t)&v333, v377, 16);
    if (v282)
    {
      uint64_t v285 = v282;
      uint64_t v286 = 0;
      uint64_t v287 = *(void *)v334;
      do
      {
        for (uint64_t j = 0; j != v285; ++j)
        {
          if (*(void *)v334 != v287) {
            objc_enumerationMutation(v280);
          }
          if (objc_msgSend_role(*(void **)(*((void *)&v333 + 1) + 8 * j), v283, v284) != 4) {
            ++v286;
          }
        }
        uint64_t v285 = objc_msgSend_countByEnumeratingWithState_objects_count_(v280, v283, (uint64_t)&v333, v377, 16);
      }
      while (v285);
    }
    else
    {
      uint64_t v286 = 0;
    }

    if (v274 <= 1) {
      v293 = (void *)v286;
    }
    else {
      v293 = (void *)(v286 + 1);
    }
    if (objc_msgSend_count(v268, v291, v292) != v293)
    {
      id v294 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v294);
      }

      v295 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
      {
        uint64_t v312 = objc_msgSend_count(v268, v296, v297);
        v315 = objc_msgSend_shareID(v331, v313, v314);
        *(_DWORD *)buf = 134218754;
        uint64_t v370 = v312;
        __int16 v371 = 2048;
        id v372 = v293;
        __int16 v373 = 2112;
        v374 = v315;
        __int16 v375 = 2112;
        v376 = v268;
        _os_log_error_impl(&dword_1C4CFF000, v295, OS_LOG_TYPE_ERROR, "Unexpected: The invitedPCS has a different number of public identities than expected (%tu vs. %tu) on the share %@: %@", buf, 0x2Au);
      }
    }
  }
  BOOL v34 = 1;
  id v42 = v328;
LABEL_169:

  return v34;
}

- (BOOL)_modifyRoleForParticipant:(id)a3 invitedPCS:(_OpaquePCSShareProtection *)a4 shareeIdentities:(id)a5 error:(id *)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (_OpaquePCSShareProtection *)a3;
  id v11 = a5;
  uint64_t v13 = objc_msgSend_invitedPCSPermissionForParticipant_(self, v12, (uint64_t)v10);
  uint64_t v16 = objc_msgSend_protectionInfo(v10, v14, v15);

  if (!v16)
  {
    uint64_t v26 = objc_msgSend_protectionInfoPublicKey(v10, v17, v18);

    if (!v26) {
      goto LABEL_57;
    }
    v73 = a6;
    uint64_t v35 = objc_msgSend_pcsManager(self, v33, v34);
    uint64_t v38 = objc_msgSend_protectionInfoPublicKey(v10, v36, v37);
    id v74 = 0;
    uint64_t v32 = objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v35, v39, (uint64_t)v38, &v74);
    uint64_t v25 = (_OpaquePCSShareProtection *)v74;

    if (v32 && !v25)
    {
      uint64_t v24 = 0;
      uint64_t v26 = 0;
      goto LABEL_21;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v49 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      uint64_t v63 = v49;
      v66 = objc_msgSend_protectionInfoPublicKey(v10, v64, v65);
      *(_DWORD *)buf = 138412802;
      uint64_t v77 = v66;
      __int16 v78 = 2112;
      uint64_t v79 = v10;
      __int16 v80 = 2112;
      uint64_t v81 = v25;
      _os_log_error_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_ERROR, "Error deserializing protectionInfoPublicKey %@ on participant %@: %@", buf, 0x20u);

      if (!v32) {
        goto LABEL_33;
      }
    }
    else if (!v32)
    {
LABEL_33:
      uint64_t v26 = 0;
      goto LABEL_56;
    }
    CFRelease(v32);
    goto LABEL_33;
  }
  v73 = a6;
  uint64_t v19 = objc_msgSend_pcsManager(self, v17, v18);
  uint64_t v22 = objc_msgSend_protectionInfo(v10, v20, v21);
  id v75 = 0;
  uint64_t v24 = objc_msgSend_createSharePCSFromEncryptedData_error_(v19, v23, (uint64_t)v22, &v75);
  uint64_t v25 = (_OpaquePCSShareProtection *)v75;

  if (v24 && !v25)
  {
    uint64_t v26 = (void *)PCSShareProtectionCopyPublicKeys();
    if ((unint64_t)objc_msgSend_count(v26, v27, v28) >= 2)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v31 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v77 = v24;
        _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Found more than one public identity on per-participant PCS %@. Which one will be returned is undefined.", buf, 0xCu);
      }
      uint64_t v25 = 0;
      uint64_t v32 = 0;
      goto LABEL_40;
    }
    uint64_t v32 = objc_msgSend_firstObject(v26, v29, v30);

    CFRetain(v32);
    if (!v32)
    {
      uint64_t v25 = 0;
LABEL_40:
      char v41 = 0;
      goto LABEL_48;
    }
LABEL_21:
    uint64_t v72 = PCSPublicIdentityGetPublicID();
    if (objc_msgSend_containsObject_(v11, v42, v72))
    {
      uint64_t v45 = objc_msgSend_pcsManager(self, v43, v44);
      objc_msgSend_addPublicIdentity_toSharePCS_permission_(v45, v46, (uint64_t)v32, a4, v13);
      uint64_t v25 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

      uint64_t v47 = (void *)*MEMORY[0x1E4F1A548];
      if (v25)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v47);
        }
        uint64_t v48 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v77 = v32;
          __int16 v78 = 2112;
          uint64_t v79 = a4;
          _os_log_debug_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_DEBUG, "Cannot add public identity %@ to invitedPCS %@ for per participant PCS permission update", buf, 0x16u);
        }
        char v41 = 0;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v47);
        }
        uint64_t v52 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v67 = v52;
          uint64_t v68 = CKStringFromSharePermission(v13);
          objc_msgSend_shareID(self, v69, v70);
          uint64_t v71 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          uint64_t v77 = v68;
          __int16 v78 = 2112;
          uint64_t v79 = v10;
          __int16 v80 = 2112;
          uint64_t v81 = v71;
          _os_log_debug_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_DEBUG, "Successfully modified per participant PCS permission to %@ on invitedPCS for participant %@ on share %@", buf, 0x20u);
        }
        uint64_t v25 = 0;
        char v41 = 1;
      }
      uint64_t v50 = (void *)v72;
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v50 = (void *)v72;
      uint64_t v51 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v77 = v32;
        _os_log_error_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_ERROR, "Public identity %@ can be found on participant, but invitedPCS is not shared to it", buf, 0xCu);
      }
      char v41 = 0;
      uint64_t v25 = 0;
    }

    if (v24) {
      goto LABEL_48;
    }
LABEL_53:
    if (!v32)
    {
LABEL_49:
      a6 = v73;
      if ((v41 & 1) == 0)
      {
        if (v25) {
          goto LABEL_51;
        }
LABEL_57:
        uint64_t v54 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v55 = *MEMORY[0x1E4F19DD8];
        BOOL v56 = objc_msgSend_shareID(self, v33, v34);
        objc_msgSend_errorWithDomain_code_format_(v54, v57, v55, 5005, @"Couldn't change per participant PCS permission on share %@", v56);
        uint64_t v25 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

        if (a6) {
          goto LABEL_52;
        }
LABEL_58:
        BOOL v53 = 0;
        goto LABEL_59;
      }
LABEL_55:
      BOOL v53 = 1;
      goto LABEL_59;
    }
    goto LABEL_54;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v40 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    id v59 = v40;
    uint64_t v62 = objc_msgSend_protectionInfo(v10, v60, v61);
    *(_DWORD *)buf = 138412546;
    uint64_t v77 = v62;
    __int16 v78 = 2112;
    uint64_t v79 = v25;
    _os_log_error_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_ERROR, "Error creating PCS from encrypted data %@: %@", buf, 0x16u);
  }
  char v41 = 0;
  uint64_t v26 = 0;
  uint64_t v32 = 0;
  if (!v24) {
    goto LABEL_53;
  }
LABEL_48:
  CFRelease(v24);
  if (!v32) {
    goto LABEL_49;
  }
LABEL_54:
  CFRelease(v32);
  if (v41) {
    goto LABEL_55;
  }
LABEL_56:
  a6 = v73;
  if (!v25) {
    goto LABEL_57;
  }
LABEL_51:
  if (!a6) {
    goto LABEL_58;
  }
LABEL_52:
  uint64_t v25 = v25;
  BOOL v53 = 0;
  *a6 = v25;
LABEL_59:

  return v53;
}

- (BOOL)_removePrivateParticipantsFromInvitedPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = objc_msgSend_share(self, a2, (uint64_t)a3, 0);
  uint64_t v10 = objc_msgSend_removedParticipants(v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, v37, 16);
  if (!v12)
  {
    id v22 = 0;
    goto LABEL_19;
  }
  uint64_t v15 = v12;
  char v16 = 0;
  uint64_t v17 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v30 != v17) {
        objc_enumerationMutation(v10);
      }
      uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (objc_msgSend_role(v19, v13, v14) == 3 || objc_msgSend_role(v19, v13, v20) == 2)
      {
        uint64_t v21 = objc_msgSend__removePrivateParticipant_fromInvitedSharePCS_(self, v13, (uint64_t)v19, a3);
        if (!v21)
        {
          char v16 = 1;
          continue;
        }
        id v22 = (id)v21;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          if (!a4) {
            goto LABEL_19;
          }
          goto LABEL_17;
        }
        uint64_t v25 = v23;
        uint64_t v28 = objc_msgSend_shareID(self, v26, v27);
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v28;
        __int16 v35 = 2112;
        id v36 = v22;
        _os_log_error_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_ERROR, "Couldn't remove participant from share %@: %@", buf, 0x16u);

        if (a4)
        {
LABEL_17:
          id v22 = v22;
          char v16 = 0;
          *a4 = v22;
          goto LABEL_20;
        }
LABEL_19:
        char v16 = 0;
        goto LABEL_20;
      }
    }
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, v37, 16);
    if (v15) {
      continue;
    }
    break;
  }
  id v22 = 0;
LABEL_20:

  return v16 & 1;
}

- (id)_removePrivateParticipant:(id)a3 fromInvitedSharePCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_operation(self, v7, v8);
  uint64_t v12 = objc_msgSend_container(v9, v10, v11);
  uint64_t v15 = objc_msgSend_deviceContext(v12, v13, v14);
  uint64_t v18 = objc_msgSend_testDeviceReference(v15, v16, v17);
  if (v18)
  {
    uint64_t v21 = (void *)v18;
    id v22 = objc_msgSend_participantID(v6, v19, v20);
    char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, @"DONT-REMOVE-MY-KEY");

    if (isEqualToString)
    {
LABEL_38:
      uint64_t v68 = 0;
      goto LABEL_39;
    }
  }
  else
  {
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v26 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v27 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v81 = v27;
    uint64_t v84 = objc_msgSend_userIdentity(v6, v82, v83);
    id v87 = objc_msgSend_userIdentity(v6, v85, v86);
    uint64_t v90 = objc_msgSend_publicSharingKey(v87, v88, v89);
    uint64_t v93 = objc_msgSend_protectionInfoPublicKey(v6, v91, v92);
    *(_DWORD *)buf = 138412802;
    id v104 = v84;
    __int16 v105 = 2114;
    uint64_t v106 = v90;
    __int16 v107 = 2114;
    uint64_t v108 = v93;
    _os_log_debug_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_DEBUG, "Removing share participant with identity %@ and public key %{public}@, PPPCS public key: %{public}@", buf, 0x20u);
  }
  long long v30 = objc_msgSend_protectionInfo(v6, v28, v29);

  if (v30)
  {
    uint64_t v33 = objc_msgSend_pcsManager(self, v31, v32);
    id v36 = objc_msgSend_protectionInfo(v6, v34, v35);
    uint64_t v38 = objc_msgSend_removeEncryptedPCS_fromSharePCS_(v33, v37, (uint64_t)v36, a4);
  }
  else
  {
    uint64_t v39 = objc_msgSend_protectionInfoPublicKey(v6, v31, v32);

    if (v39)
    {
      id v42 = objc_msgSend_pcsManager(self, v40, v41);
      uint64_t v45 = objc_msgSend_protectionInfoPublicKey(v6, v43, v44);
      char v102 = v45;
      uint64_t v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v46, (uint64_t)&v102, 1);
      char v49 = objc_msgSend_removePublicKeys_fromPCS_(v42, v48, (uint64_t)v47, a4);

      if (v49)
      {
LABEL_30:
        if (*v25 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v74 = *v26;
        if (!os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_36;
        }
        id v75 = v74;
        __int16 v78 = objc_msgSend_participantID(v6, v76, v77);
        *(_DWORD *)buf = 138412290;
        id v104 = v78;
        _os_log_debug_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_DEBUG, "Removed per-participant PCS from invited PCS for participant %@", buf, 0xCu);

LABEL_34:
        if (*v25 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
LABEL_36:
        os_log_t v79 = *v26;
        if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v94 = v79;
          uint64_t v97 = objc_msgSend_participantID(v6, v95, v96);
          *(_DWORD *)buf = 138412290;
          id v104 = v97;
          _os_log_debug_impl(&dword_1C4CFF000, v94, OS_LOG_TYPE_DEBUG, "Successfully configured PCS data for removed participant %@", buf, 0xCu);
        }
        goto LABEL_38;
      }
      uint64_t v52 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v53 = *MEMORY[0x1E4F19DD8];
      uint64_t v33 = objc_msgSend_participantID(v6, v50, v51);
      objc_msgSend_errorWithDomain_code_format_(v52, v54, v53, 5001, @"Could not remove PPPCS public key from invited PCS for participant %@", v33);
    }
    else
    {
      if (*v25 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v55 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v104 = v6;
        _os_log_error_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_ERROR, "No participant PCS nor public key found for participant %@. We can't remove them from the share", buf, 0xCu);
      }
      char v58 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v59 = *MEMORY[0x1E4F19DD8];
      uint64_t v33 = objc_msgSend_participantID(v6, v56, v57);
      objc_msgSend_errorWithDomain_code_format_(v58, v60, v59, 5001, @"No participant PCS or PPPCS public key exists for participant %@", v33);
    uint64_t v38 = };
  }

  if (!v38) {
    goto LABEL_30;
  }
  if (*v25 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v61 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v98 = v61;
    uint64_t v101 = objc_msgSend_participantID(v6, v99, v100);
    *(_DWORD *)buf = 138412546;
    id v104 = v101;
    __int16 v105 = 2112;
    uint64_t v106 = v38;
    _os_log_error_impl(&dword_1C4CFF000, v98, OS_LOG_TYPE_ERROR, "Couldn't remove per-participant PCS from invited PCS for participant %@: %@", buf, 0x16u);
  }
  uint64_t v64 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v65 = *MEMORY[0x1E4F19DD8];
  v66 = objc_msgSend_participantID(v6, v62, v63);
  uint64_t v68 = objc_msgSend_errorWithDomain_code_format_(v64, v67, v65, 5005, @"Couldn't remove per-participant PCS from invited PCS for participant %@: %@", v66, v38);

  if (!v68) {
    goto LABEL_34;
  }
  if (*v25 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v69 = *v26;
  if (os_log_type_enabled(*v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v70 = v69;
    v73 = objc_msgSend_participantID(v6, v71, v72);
    *(_DWORD *)buf = 138412546;
    id v104 = v73;
    __int16 v105 = 2112;
    uint64_t v106 = v68;
    _os_log_error_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_ERROR, "Couldn't configure PCS data for removed participant %@: %@", buf, 0x16u);
  }
LABEL_39:

  return v68;
}

- (id)_publicKeyForParticipant:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend_role(v6, v7, v8) != 1 || !objc_msgSend_isCurrentUser(v6, v9, v10))
  {
    uint64_t v28 = objc_msgSend_userIdentity(v6, v9, v10);
    int isOutOfNetwork = objc_msgSend_isOutOfNetwork(v28, v29, v30);

    uint64_t v34 = objc_msgSend_userIdentity(v6, v32, v33);
    uint64_t v37 = v34;
    if (!isOutOfNetwork)
    {
      uint64_t v59 = objc_msgSend_publicSharingKey(v34, v35, v36);

      goto LABEL_19;
    }
    uint64_t v38 = objc_msgSend_outOfNetworkPrivateKey(v34, v35, v36);

    if (v38)
    {
      uint64_t v41 = objc_msgSend_pcsManager(self, v39, v40);
      uint64_t v44 = objc_msgSend_userIdentity(v6, v42, v43);
      uint64_t v47 = objc_msgSend_outOfNetworkPrivateKey(v44, v45, v46);
      uint64_t v50 = objc_msgSend_share(self, v48, v49);
      uint64_t v53 = objc_msgSend_mutableEncryptedPSK(v50, v51, v52);
      BOOL v56 = objc_msgSend_data(v53, v54, v55);
      CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = (const void *)objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v41, v57, (uint64_t)v47, v56);

      if (CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity)
      {
        uint64_t v59 = (void *)PCSIdentityCopyExportedPublicKey();
        CFRelease(CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity);
LABEL_19:
        id v67 = 0;
        goto LABEL_20;
      }
LABEL_15:
      uint64_t v59 = 0;
      goto LABEL_19;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v60 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v83 = v6;
      _os_log_error_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_ERROR, "No private OON key exists for participant %@. We can't add them to the share", buf, 0xCu);
      if (!a4) {
        goto LABEL_15;
      }
    }
    else if (!a4)
    {
      goto LABEL_15;
    }
    uint64_t v63 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v64 = *MEMORY[0x1E4F19DD8];
    uint64_t v65 = objc_msgSend_participantID(v6, v61, v62);
    objc_msgSend_errorWithDomain_code_format_(v63, v66, v64, 5005, @"No private OON key exists for participant %@", v65);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  uint64_t v11 = objc_msgSend_operation(self, v9, v10);
  uint64_t v14 = objc_msgSend_container(v11, v12, v13);
  uint64_t v17 = objc_msgSend_pcsManager(v14, v15, v16);
  int IsManatee = objc_msgSend_currentServiceIsManatee(v17, v18, v19);

  uint64_t v23 = objc_msgSend_pcsManager(self, v21, v22);
  uint64_t v25 = v23;
  if (IsManatee)
  {
    uint64_t v81 = 0;
    uint64_t v26 = (id *)&v81;
    uint64_t v27 = objc_msgSend_copyPublicKeyForService_withError_(v23, v24, 0, &v81);
  }
  else
  {
    uint64_t v80 = 0;
    uint64_t v26 = (id *)&v80;
    uint64_t v27 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(v23, v24, 2, &v80);
  }
  uint64_t v59 = (void *)v27;
  id v67 = *v26;

  if (!v67 && v59) {
    goto LABEL_19;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v69 = (void *)*MEMORY[0x1E4F1A500];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
  BOOL v76 = v69;
  os_log_t v79 = objc_msgSend_shareID(self, v77, v78);
  *(_DWORD *)buf = 138412546;
  id v83 = v79;
  __int16 v84 = 2112;
  id v85 = v67;
  _os_log_error_impl(&dword_1C4CFF000, v76, OS_LOG_TYPE_ERROR, "Couldn't create a public key for the owner participant on share %@: %@", buf, 0x16u);

  if (a4)
  {
LABEL_27:
    uint64_t v72 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v73 = *MEMORY[0x1E4F19DD8];
    os_log_t v74 = objc_msgSend_shareID(self, v70, v71);
    objc_msgSend_errorWithDomain_code_format_(v72, v75, v73, 5000, @"Couldn't create a public key for the owner participant on share %@", v74);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

  return v59;
}

- (BOOL)_addedPrivateParticipantNeedsAManateeInvitation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_pcsManager(self, v5, v6);
  if (objc_msgSend_currentServiceIsManatee(v7, v8, v9)) {
    BOOL v12 = objc_msgSend_role(v4, v10, v11) != 1;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (_PCSPublicIdentityData)createPublicIdentityFromPublicKeyForParticipant:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = 0;
  uint64_t v8 = objc_msgSend__publicKeyForParticipant_error_(self, v7, (uint64_t)v6, &v35);
  id v9 = v35;
  id v12 = v9;
  if (!v8 || v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v16 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v6;
      _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "No public sharing key exists for participant %@. We can't add them to the share", buf, 0xCu);
      if (v12)
      {
LABEL_10:
        uint64_t v15 = 0;
        if (!a4) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
    else if (v12)
    {
      goto LABEL_10;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v23 = *MEMORY[0x1E4F19DD8];
    uint64_t v24 = objc_msgSend_participantID(v6, v17, v18);
    objc_msgSend_errorWithDomain_code_format_(v22, v25, v23, 5000, @"No public sharing key exists for participant %@", v24);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  uint64_t v13 = objc_msgSend_pcsManager(self, v10, v11);
  id v34 = 0;
  uint64_t v15 = (_PCSPublicIdentityData *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v13, v14, (uint64_t)v8, &v34);
  id v12 = v34;

  if (!v12 && v15)
  {
    id v12 = 0;
    goto LABEL_25;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v19 = (void *)*MEMORY[0x1E4F1A500];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    if (v12) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  uint64_t v26 = v19;
  uint64_t v29 = objc_msgSend_participantID(v6, v27, v28);
  *(_DWORD *)buf = 138412802;
  id v37 = v29;
  __int16 v38 = 2112;
  id v39 = v12;
  __int16 v40 = 2114;
  uint64_t v41 = v8;
  _os_log_error_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_ERROR, "Couldn't create an identity from the public sharing key for participant %@: %@ (key was %{public}@)", buf, 0x20u);

  if (!v12)
  {
LABEL_21:
    uint64_t v30 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v31 = *MEMORY[0x1E4F19DD8];
    uint64_t v24 = objc_msgSend_participantID(v6, v20, v21);
    objc_msgSend_errorWithDomain_code_format_(v30, v32, v31, 5000, @"Couldn't create an identity from the public sharing key for participant %@: %@ (key was %@)", v24, 0, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
LABEL_16:
  if (!a4) {
    goto LABEL_25;
  }
LABEL_23:
  if (v12)
  {
    id v12 = v12;
    *a4 = v12;
  }
LABEL_25:

  return v15;
}

- (unint64_t)invitedPCSPermissionForParticipant:(id)a3
{
  id v3 = a3;
  unint64_t v8 = objc_msgSend_role(v3, v4, v5) != 1 && objc_msgSend_role(v3, v6, v7) != 2;

  return v8;
}

- (id)_ensurePrivateParticipant:(id)a3 isInInvitedSharePCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v368 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  SEL v345 = a2;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v73 = v7;
    BOOL v76 = objc_msgSend_userIdentity(v6, v74, v75);
    if (objc_msgSend_isOutOfNetwork(v76, v77, v78)) {
      uint64_t v81 = @"OON ";
    }
    else {
      uint64_t v81 = &stru_1F2044F30;
    }
    objc_msgSend_userIdentity(v6, v79, v80);
    uint64_t v82 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    id v85 = objc_msgSend_userIdentity(v6, v83, v84);
    objc_msgSend_publicSharingKey(v85, v86, v87);
    uint64_t v88 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    long long v361 = v81;
    __int16 v362 = 2112;
    long long v363 = v82;
    __int16 v364 = 2114;
    long long v365 = v88;
    _os_log_debug_impl(&dword_1C4CFF000, v73, OS_LOG_TYPE_DEBUG, "Ensuring %{public}@share participant with identity %@ and public key %{public}@ is in invitedPCS", buf, 0x20u);
  }
  uint64_t v10 = objc_msgSend_protectionInfo(v6, v8, v9);
  uint64_t v13 = objc_msgSend_operation(self, v11, v12);
  uint64_t v346 = objc_msgSend_invitedPCSPermissionForParticipant_(self, v14, (uint64_t)v6);
  uint64_t v17 = objc_msgSend_userIdentity(v6, v15, v16);
  if (objc_msgSend_isOutOfNetwork(v17, v18, v19)) {
    int v20 = 2;
  }
  else {
    int v20 = 1;
  }

  uint64_t v23 = objc_msgSend_container(v13, v21, v22);
  uint64_t v26 = objc_msgSend_options(v23, v24, v25);
  if (objc_msgSend_useAnonymousToServerShareParticipants(v26, v27, v28))
  {
    uint64_t v31 = objc_msgSend_share(self, v29, v30);
    id v34 = objc_msgSend_currentUserParticipant(v31, v32, v33);
    BOOL v39 = objc_msgSend_role(v34, v35, v36) == 1 && objc_msgSend_role(v6, v37, v38) != 1;

    if (v39) {
      int v41 = 4;
    }
    else {
      int v41 = 0;
    }
  }
  else
  {

    int v41 = 0;
  }
  id v359 = 0;
  uint64_t v42 = (_OpaquePCSShareProtection *)objc_msgSend_createPublicIdentityFromPublicKeyForParticipant_error_(self, v40, (uint64_t)v6, &v359);
  uint64_t v43 = (_OpaquePCSShareProtection *)v359;
  uint64_t v44 = (os_log_t *)MEMORY[0x1E4F1A500];
  long long v353 = v13;
  if (v43 || !v42)
  {
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    uint64_t v68 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    if (v42) {
      goto LABEL_164;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    int v343 = v20;
    os_log_t v45 = *v44;
    if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v219 = v45;
      objc_msgSend_participantID(v6, v220, v221);
      id v222 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      long long v361 = v222;
      __int16 v362 = 2112;
      long long v363 = v42;
      _os_log_debug_impl(&dword_1C4CFF000, v219, OS_LOG_TYPE_DEBUG, "Created public identity for participant %@: %@", buf, 0x16u);
    }
    cf = v42;
    if (*MEMORY[0x1E4F1A4E0] && objc_msgSend_role(v6, v46, v47) == 1)
    {
      uint64_t v48 = objc_msgSend_container(v13, v46, v47);
      uint64_t v51 = objc_msgSend_deviceContext(v48, v49, v50);
      uint64_t v54 = objc_msgSend_testDeviceReference(v51, v52, v53);
      if (v54)
      {
        uint64_t v57 = v13;
        char v58 = (void *)v54;
        objc_msgSend_unitTestOverrides(v57, v55, v56);
        int v59 = v41;
        v61 = long long v60 = v10;
        uint64_t v63 = objc_msgSend_objectForKeyedSubscript_(v61, v62, @"NoOwnerPPPCS");

        uint64_t v10 = v60;
        int v41 = v59;

        uint64_t v44 = (os_log_t *)MEMORY[0x1E4F1A500];
        if (v63)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          os_log_t v64 = *v44;
          BOOL v65 = os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG);
          uint64_t v68 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
          uint64_t v42 = cf;
          if (v65)
          {
            uint64_t v282 = v64;
            objc_msgSend_shareID(self, v283, v284);
            uint64_t v285 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            long long v361 = v285;
            _os_log_debug_impl(&dword_1C4CFF000, v282, OS_LOG_TYPE_DEBUG, "Skipping PPPCS for the owner on share %@ because the unit tests told us to do it.", buf, 0xCu);
          }
          if (objc_msgSend_isCloudDocsContainer(self, v66, v67))
          {
            uint64_t v43 = 0;
          }
          else
          {
            v160 = objc_msgSend_pcsManager(self, v69, v70);
            objc_msgSend_addPublicIdentity_toSharePCS_permission_(v160, v161, (uint64_t)cf, a4, v346);
            v162 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

            if (v162)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], *v68);
              }
              os_log_t v163 = *v44;
              if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
              {
                v311 = v163;
                objc_msgSend_participantID(v6, v312, v313);
                uint64_t v314 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                long long v361 = v314;
                __int16 v362 = 2112;
                long long v363 = v162;
                _os_log_error_impl(&dword_1C4CFF000, v311, OS_LOG_TYPE_ERROR, "Couldn't add per-participant PCS to invited PCS for participant %@: %@", buf, 0x16u);
              }
              uint64_t v166 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v167 = *MEMORY[0x1E4F19DD8];
              v168 = objc_msgSend_participantID(v6, v164, v165);
              objc_msgSend_errorWithDomain_code_format_(v166, v169, v167, 5005, @"Couldn't add per-participant PCS to invited PCS for participant %@: %@", v168, v162);
              uint64_t v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

              uint64_t v42 = cf;
            }
            else
            {
              uint64_t v43 = 0;
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], *v68);
            }
            os_log_t v250 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
            {
              id v294 = v250;
              objc_msgSend_participantID(v6, v295, v296);
              uint64_t v297 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              long long v361 = v297;
              _os_log_debug_impl(&dword_1C4CFF000, v294, OS_LOG_TYPE_DEBUG, "Added owner public key to invited PCS for participant %@", buf, 0xCu);
            }
          }
          uint64_t v71 = 0;
          uint64_t v72 = 0;
          goto LABEL_164;
        }
      }
      else
      {
      }
    }
    uint64_t v68 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    if (v10 && objc_msgSend_isCurrentUser(v6, v46, v47))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v68);
      }
      uint64_t v89 = *v44;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_DEBUG, "Using the self participant PCS...", buf, 2u);
      }
      selfParticipantPCS = self->_selfParticipantPCS;
      if (selfParticipantPCS)
      {
        CFRetain(self->_selfParticipantPCS);
        int v93 = 0;
        uint64_t v72 = 0;
        long long v342 = 0;
        goto LABEL_100;
      }
    }
    uint64_t v94 = objc_msgSend_pcsManager(self, v46, v47);
    id v358 = 0;
    selfParticipantPCS = (_OpaquePCSShareProtection *)objc_msgSend_createEmptySharePCSOfType_error_(v94, v95, 4, &v358);
    uint64_t v96 = (_OpaquePCSShareProtection *)v358;

    dispatch_block_t v97 = *v68;
    uint64_t v98 = *MEMORY[0x1E4F1A550];
    if (!v96 && selfParticipantPCS)
    {
      if (v98 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v97);
      }
      uint64_t v99 = *v44;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        long long v361 = v6;
        __int16 v362 = 2112;
        long long v363 = selfParticipantPCS;
        _os_log_debug_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_DEBUG, "Created a new per-participant PCS blob for participant %@: %@", buf, 0x16u);
      }
      unsigned int v341 = v41;
      if (objc_msgSend_role(v6, v100, v101) == 1
        && (objc_msgSend_pcsManager(self, v102, v103),
            id v104 = objc_claimAutoreleasedReturnValue(),
            int IsManatee = objc_msgSend_currentServiceIsManatee(v104, v105, v106),
            v104,
            IsManatee))
      {
        uint64_t v109 = objc_msgSend_pcsManager(self, v102, v108);
        selfPPPCSOwnerIdentity = (_OpaquePCSShareProtection *)objc_msgSend_copyPublicAuthorshipIdentityFromPCS_(v109, v110, (uint64_t)a4);

        if (!selfPPPCSOwnerIdentity)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], *v68);
          }
          os_log_t v249 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
          {
            v331 = v249;
            objc_msgSend_participantID(v6, v332, v333);
            long long v334 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            long long v361 = v334;
            _os_log_debug_impl(&dword_1C4CFF000, v331, OS_LOG_TYPE_DEBUG, "Couldn't get the share authorship identity for participant %@", buf, 0xCu);
          }
          uint64_t v43 = 0;
          uint64_t v71 = 0;
          uint64_t v72 = 0;
          v240 = cf;
          goto LABEL_163;
        }
        id v114 = objc_msgSend_pcsManager(self, v112, v113);
        objc_msgSend_setOwnerIdentity_onPCS_(v114, v115, (uint64_t)selfPPPCSOwnerIdentity, selfParticipantPCS);
      }
      else
      {
        selfPPPCSOwnerIdentity = 0;
      }
      if (!objc_msgSend__addedPrivateParticipantNeedsAManateeInvitation_(self, v102, (uint64_t)v6))
      {
        uint64_t v134 = objc_msgSend_pcsManager(self, v123, v124);
        objc_msgSend_addPublicIdentity_toSharePCS_permission_(v134, v135, (uint64_t)cf, selfParticipantPCS, v341 | v343);
        __int16 v136 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

        dispatch_block_t v137 = *v68;
        uint64_t v138 = *MEMORY[0x1E4F1A550];
        long long v342 = selfPPPCSOwnerIdentity;
        if (v136)
        {
          if (v138 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v137);
          }
          os_log_t v139 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            uint64_t v286 = v139;
            objc_msgSend_participantID(v6, v287, v288);
            v289 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            long long v361 = v289;
            __int16 v362 = 2112;
            long long v363 = v136;
            _os_log_error_impl(&dword_1C4CFF000, v286, OS_LOG_TYPE_ERROR, "Couldn't add public identity to per-participant PCS for participant %@: %@", buf, 0x16u);
          }
          v142 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v143 = *MEMORY[0x1E4F19DD8];
          v144 = objc_msgSend_participantID(v6, v140, v141);
          objc_msgSend_errorWithDomain_code_format_(v142, v145, v143, 5005, @"Couldn't add public identity to per-participant PCS for participant %@: %@", v144, v136);
          uint64_t v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

          uint64_t v72 = 0;
          uint64_t v71 = 0;
          goto LABEL_158;
        }
        if (v138 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v137);
        }
        os_log_t v170 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
        {
          v298 = v170;
          objc_msgSend_participantID(v6, v299, v300);
          v301 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CKStringFromSharePermission(v343 | v341);
          v302 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          long long v361 = v301;
          __int16 v362 = 2114;
          long long v363 = v302;
          _os_log_debug_impl(&dword_1C4CFF000, v298, OS_LOG_TYPE_DEBUG, "Added participant's public identity to their per-participant blob for participant %@ with permission %{public}@", buf, 0x16u);
        }
        uint64_t v72 = 0;
        goto LABEL_99;
      }
      id v125 = objc_msgSend_share(self, v123, v124);
      uint64_t v128 = objc_msgSend_currentUserParticipant(v125, v126, v127);

      if (objc_msgSend_role(v128, v129, v130) != 2)
      {
        if (!selfPPPCSOwnerIdentity)
        {
          id v146 = objc_msgSend_pcsManager(self, v131, v132);
          selfPPPCSOwnerIdentity = (_OpaquePCSShareProtection *)objc_msgSend_copyPublicAuthorshipIdentityFromPCS_(v146, v147, (uint64_t)a4);

          if (!selfPPPCSOwnerIdentity) {
            goto LABEL_123;
          }
        }
LABEL_80:
        uint64_t v148 = objc_msgSend_userIdentity(v6, v131, v132);
        v151 = objc_msgSend_publicSharingKey(v148, v149, v150);

        long long v342 = selfPPPCSOwnerIdentity;
        if (!v151)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], *v68);
          }
          os_log_t v223 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            v303 = v223;
            objc_msgSend_participantID(v6, v304, v305);
            v306 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            long long v361 = v306;
            _os_log_error_impl(&dword_1C4CFF000, v303, OS_LOG_TYPE_ERROR, "Cannot add participant %@ with missing public key to share", buf, 0xCu);
          }
          v226 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v227 = *MEMORY[0x1E4F19DD8];
          uint64_t v228 = objc_msgSend_participantID(v6, v224, v225);
          objc_msgSend_errorWithDomain_code_format_(v226, v229, v227, 8014, @"Cannot add participant %@ with missing public key to share", v228);
          uint64_t v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

          v175 = cf;
          goto LABEL_128;
        }
        long long v344 = v128;
        id v152 = objc_alloc(MEMORY[0x1E4F93E78]);
        v154 = objc_msgSend_initWithShareProtectionRef_(v152, v153, (uint64_t)selfParticipantPCS);
        id v357 = 0;
        objc_msgSend_sharingRequestDataForIdentity_owner_flags_error_(v154, v155, (uint64_t)cf, selfPPPCSOwnerIdentity, v341, &v357);
        uint64_t v72 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
        id v156 = (_OpaquePCSShareProtection *)v357;
        dispatch_block_t v157 = *v68;
        uint64_t v158 = *MEMORY[0x1E4F1A550];
        if (v156 || !v72)
        {
          if (v158 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v157);
          }
          id v351 = v154;
          os_log_t v231 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            uint64_t v318 = v231;
            objc_msgSend_participantID(v6, v319, v320);
            v321 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            long long v361 = v321;
            __int16 v362 = 2112;
            long long v363 = v156;
            _os_log_error_impl(&dword_1C4CFF000, v318, OS_LOG_TYPE_ERROR, "Couldn't create manatee sharing invitation data for participant %@: %@", buf, 0x16u);
          }
          v234 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v235 = *MEMORY[0x1E4F19DD8];
          v236 = objc_msgSend_participantID(v6, v232, v233);
          uint64_t v238 = objc_msgSend_errorWithDomain_code_format_(v234, v237, v235, 5005, @"Couldn't create a manatee sharing invitation data for participant %@: %@", v236, v156);
          uint64_t v239 = v156;
          uint64_t v43 = (_OpaquePCSShareProtection *)v238;

          CFRelease(cf);
          uint64_t v71 = 0;
          v240 = v342;
          goto LABEL_163;
        }
        if (v158 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v157);
        }
        os_log_t v159 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
        {
          v315 = v154;
          v316 = v159;
          CKStringFromSharePermission(v341);
          v317 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          long long v361 = v6;
          __int16 v362 = 2114;
          long long v363 = v317;
          __int16 v364 = 2112;
          long long v365 = v72;
          _os_log_debug_impl(&dword_1C4CFF000, v316, OS_LOG_TYPE_DEBUG, "Created a new manatee sharing invitation blob for participant %@ with permission %{public}@: %@", buf, 0x20u);

          v154 = v315;
        }

LABEL_99:
        int v93 = 1;
LABEL_100:
        uint64_t v171 = objc_msgSend_pcsManager(self, v91, v92);
        id v356 = 0;
        char v173 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(v171, v172, (uint64_t)selfParticipantPCS, a4, v346, &v356);
        uint64_t v43 = (_OpaquePCSShareProtection *)v356;

        uint64_t v174 = (void *)*MEMORY[0x1E4F1A548];
        if ((v173 & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v174);
          }
          uint64_t v68 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
          os_log_t v211 = *v44;
          if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
          {
            v278 = v211;
            objc_msgSend_participantID(v6, v279, v280);
            v281 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            long long v361 = v281;
            __int16 v362 = 2112;
            long long v363 = v43;
            _os_log_error_impl(&dword_1C4CFF000, v278, OS_LOG_TYPE_ERROR, "Couldn't add per-participant PCS to invited PCS for participant %@: %@", buf, 0x16u);
          }
          v214 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v215 = *MEMORY[0x1E4F19DD8];
          v216 = objc_msgSend_participantID(v6, v212, v213);
          uint64_t v218 = objc_msgSend_errorWithDomain_code_format_(v214, v217, v215, 5005, @"Couldn't add per-participant PCS to invited PCS for participant %@: %@", v216, v43);

          uint64_t v71 = 0;
          uint64_t v43 = (_OpaquePCSShareProtection *)v218;
          goto LABEL_158;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v174);
        }
        v175 = cf;
        os_log_t v176 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
        {
          id v262 = v176;
          objc_msgSend_participantID(v6, v263, v264);
          id v265 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CKStringFromSharePermission(v346);
          long long v352 = v10;
          id v266 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          long long v361 = v265;
          __int16 v362 = 2114;
          long long v363 = v266;
          _os_log_debug_impl(&dword_1C4CFF000, v262, OS_LOG_TYPE_DEBUG, "Added per-participant PCS to invited PCS for participant %@ with permission %{public}@", buf, 0x16u);

          v175 = cf;
          uint64_t v10 = v352;

          if (v93) {
            goto LABEL_105;
          }
        }
        else if (v93)
        {
LABEL_105:
          if (objc_msgSend__addedPrivateParticipantNeedsAManateeInvitation_(self, v177, (uint64_t)v6))
          {
            if (!v72)
            {
              long long v339 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v178, v179);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v339, v340, (uint64_t)v345, self, @"CKDModifyShareHandler.m", 1333, @"Should never get here with a nil manateeInvitationData");
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v350 = v10;
            os_log_t v180 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
            {
              v322 = v180;
              uint64_t v347 = objc_msgSend_share(self, v323, v324);
              objc_msgSend_URL(v347, v325, v326);
              uint64_t v327 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
              v330 = objc_msgSend_participantID(v6, v328, v329);
              *(_DWORD *)buf = 138413058;
              long long v361 = v6;
              __int16 v362 = 2112;
              long long v363 = v72;
              __int16 v364 = 2112;
              long long v365 = v327;
              __int16 v366 = 2112;
              long long v367 = v330;
              _os_log_debug_impl(&dword_1C4CFF000, v322, OS_LOG_TYPE_DEBUG, "Creating invitation token for participant %@. Invitation data: %@, shareURL %@, participantID: %@", buf, 0x2Au);
            }
            id v181 = objc_alloc(MEMORY[0x1E4F19F68]);
            v184 = objc_msgSend_share(self, v182, v183);
            uint64_t v187 = objc_msgSend_URL(v184, v185, v186);
            uint64_t v190 = objc_msgSend_participantID(v6, v188, v189);
            v192 = objc_msgSend_initWithSharingInvitationData_shareURL_participantID_(v181, v191, (uint64_t)v72, v187, v190);
            objc_msgSend_setInvitationToken_(v6, v193, (uint64_t)v192);

            uint64_t v196 = objc_msgSend_pcsManager(self, v194, v195);
            long long v355 = v43;
            uint64_t v198 = objc_msgSend_publicKeyDataFromPCS_error_(v196, v197, (uint64_t)selfParticipantPCS, &v355);
            uint64_t v199 = v355;

            objc_msgSend_setProtectionInfoPublicKey_(v6, v200, (uint64_t)v198);
            uint64_t v203 = objc_msgSend_pcsManager(self, v201, v202);
            uint64_t v205 = objc_msgSend_publicKeyVersionForServiceType_(v203, v204, 0);
            v208 = objc_msgSend_userIdentity(v6, v206, v207);
            objc_msgSend_setPublicKeyVersion_(v208, v209, v205);

            objc_msgSend_setMutableInvitationTokenStatus_(v6, v210, 1);
            uint64_t v71 = 0;
            uint64_t v43 = v199;
            uint64_t v10 = v350;
            goto LABEL_157;
          }
          uint64_t v241 = v10;
          v242 = objc_msgSend_pcsManager(self, v178, v179);
          long long v354 = v43;
          uint64_t v71 = objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v242, v243, (uint64_t)selfParticipantPCS, 4, &v354);
          uint64_t v244 = v354;

          if (v244 || !v71)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            os_log_t v255 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
            {
              long long v335 = v255;
              objc_msgSend_participantID(v6, v336, v337);
              long long v338 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              long long v361 = v338;
              __int16 v362 = 2112;
              long long v363 = v244;
              _os_log_error_impl(&dword_1C4CFF000, v335, OS_LOG_TYPE_ERROR, "Couldn't serialize per-participant PCS for participant %@: %@", buf, 0x16u);
            }
            uint64_t v258 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v259 = *MEMORY[0x1E4F19DD8];
            uint64_t v260 = objc_msgSend_participantID(v6, v256, v257);
            objc_msgSend_errorWithDomain_code_format_(v258, v261, v259, 5005, @"Couldn't serialize per-participant PCS for participant %@: %@", v260, v244);
            uint64_t v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

            uint64_t v10 = v241;
            goto LABEL_157;
          }
          objc_msgSend_setProtectionInfo_(v6, v245, (uint64_t)v71);
          uint64_t v10 = v241;
          if (!objc_msgSend_isCurrentUser(v6, v246, v247))
          {
            uint64_t v43 = 0;
LABEL_157:
            uint64_t v68 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
LABEL_158:
            v175 = cf;
            goto LABEL_162;
          }
          v248 = self->_selfParticipantPCS;
          v175 = cf;
          if (v248) {
            CFRelease(v248);
          }
          self->_selfParticipantPCS = selfParticipantPCS;
          CFRetain(selfParticipantPCS);
          uint64_t v43 = 0;
LABEL_161:
          uint64_t v68 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
LABEL_162:
          CFRelease(v175);
          uint64_t v42 = selfParticipantPCS;
          v240 = v342;
          if (v342)
          {
LABEL_163:
            CFRelease(v240);
            uint64_t v42 = selfParticipantPCS;
          }
LABEL_164:
          CFRelease(v42);
          goto LABEL_165;
        }
        uint64_t v71 = 0;
        goto LABEL_161;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v68);
      }
      os_log_t v133 = *v44;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
      {
        v290 = v133;
        objc_msgSend_participantID(v128, v291, v292);
        v293 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        long long v361 = v293;
        _os_log_debug_impl(&dword_1C4CFF000, v290, OS_LOG_TYPE_DEBUG, "Admin %@ using the owner identity of self PPPCS to setup new participant", buf, 0xCu);

        if (selfPPPCSOwnerIdentity)
        {
LABEL_70:
          CFRetain(selfPPPCSOwnerIdentity);
          if (!selfPPPCSOwnerIdentity)
          {
LABEL_123:
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], *v68);
            }
            v175 = cf;
            os_log_t v230 = *v44;
            if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEBUG))
            {
              v307 = v230;
              objc_msgSend_participantID(v6, v308, v309);
              v310 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              long long v361 = v310;
              _os_log_debug_impl(&dword_1C4CFF000, v307, OS_LOG_TYPE_DEBUG, "Couldn't get the share authorship identity for participant %@", buf, 0xCu);
            }
            long long v342 = 0;
            uint64_t v43 = 0;
LABEL_128:

            uint64_t v72 = 0;
            uint64_t v71 = 0;
            goto LABEL_162;
          }
          goto LABEL_80;
        }
      }
      else if (selfPPPCSOwnerIdentity)
      {
        goto LABEL_70;
      }
      selfPPPCSOwnerIdentity = (_OpaquePCSShareProtection *)self->_selfPPPCSOwnerIdentity;
      goto LABEL_70;
    }
    if (v98 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v97);
    }
    os_log_t v116 = *v44;
    if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v251 = v116;
      objc_msgSend_participantID(v6, v252, v253);
      uint64_t v254 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      long long v361 = v254;
      __int16 v362 = 2112;
      long long v363 = v96;
      _os_log_error_impl(&dword_1C4CFF000, v251, OS_LOG_TYPE_ERROR, "Couldn't create a per-participant PCS for participant %@: %@", buf, 0x16u);
    }
    uint64_t v119 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v120 = *MEMORY[0x1E4F19DD8];
    uint64_t v121 = objc_msgSend_participantID(v6, v117, v118);
    objc_msgSend_errorWithDomain_code_format_(v119, v122, v120, 5005, @"Couldn't create a per-participant PCS for participant %@: %@", v121, v96);
    uint64_t v43 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

    CFRelease(cf);
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    uint64_t v42 = selfParticipantPCS;
    if (selfParticipantPCS) {
      goto LABEL_164;
    }
  }
LABEL_165:
  dispatch_block_t v267 = *v68;
  if (v43)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v267);
    }
    id v268 = *v44;
    if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
    {
      id v269 = v268;
      objc_msgSend_participantID(v6, v270, v271);
      id v272 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      long long v361 = v272;
      __int16 v362 = 2112;
      long long v363 = v43;
      _os_log_error_impl(&dword_1C4CFF000, v269, OS_LOG_TYPE_ERROR, "Couldn't set up PCS data for new participant %@: %@", buf, 0x16u);
LABEL_175:
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v267);
    }
    uint64_t v273 = *v44;
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEBUG))
    {
      id v269 = v273;
      objc_msgSend_participantID(v6, v276, v277);
      id v272 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      long long v361 = v272;
      _os_log_debug_impl(&dword_1C4CFF000, v269, OS_LOG_TYPE_DEBUG, "Successfully set up PCS data for new participant %@", buf, 0xCu);
      goto LABEL_175;
    }
  }
  uint64_t v274 = v43;

  return v274;
}

- (id)_removePublicKey:(id)a3 fromInvitedPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_pcsManager(self, v7, v8);
  id v22 = 0;
  uint64_t v11 = (const void *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v9, v10, (uint64_t)v6, &v22);
  id v12 = v22;

  if (v12) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v11 == 0;
  }
  if (!v15)
  {
    uint64_t v18 = objc_msgSend_pcsManager(self, v13, v14);
    objc_msgSend_removePublicIdentity_fromSharePCS_(v18, v19, (uint64_t)v11, a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      int v20 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Couldn't remove public key %{public}@ from the invited pcs: %@", buf, 0x16u);
      }
    }
LABEL_19:
    CFRelease(v11);
    goto LABEL_20;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v16 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Couldn't create an identity from the public sharing key %{public}@: %@", buf, 0x16u);
  }
  if (!v12)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create an identity from the public sharing key %@", v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11) {
    goto LABEL_19;
  }
LABEL_20:

  return v12;
}

- (void)clearProtectionDataForRecord
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)CKDModifyShareHandler;
  [(CKDModifyRecordHandler *)&v71 clearProtectionDataForRecord];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v6 = v3;
    uint64_t v9 = objc_msgSend_shareID(self, v7, v8);
    *(_DWORD *)buf = 138412290;
    uint64_t v73 = v9;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "Clearing share protection data for share %@", buf, 0xCu);
  }
  uint64_t v10 = objc_msgSend_share(self, v4, v5);
  objc_msgSend_setPrivatePCS_(v10, v11, 0);

  uint64_t v14 = objc_msgSend_share(self, v12, v13);
  objc_msgSend_setInvitedProtectionData_(v14, v15, 0);

  uint64_t v18 = objc_msgSend_share(self, v16, v17);
  objc_msgSend_setInvitedProtectionEtag_(v18, v19, 0);

  id v22 = objc_msgSend_share(self, v20, v21);
  objc_msgSend_setPublicPCS_(v22, v23, 0);

  id v26 = objc_msgSend_share(self, v24, v25);
  objc_msgSend_setPublicProtectionData_(v26, v27, 0);

  uint64_t v30 = objc_msgSend_share(self, v28, v29);
  objc_msgSend_setPublicProtectionEtag_(v30, v31, 0);

  id v34 = objc_msgSend_share(self, v32, v33);
  objc_msgSend_setPreviousProtectionEtag_(v34, v35, 0);

  uint64_t v38 = objc_msgSend_share(self, v36, v37);
  objc_msgSend_setPreviousPublicProtectionEtag_(v38, v39, 0);

  objc_msgSend_setSharePCSData_(self, v40, 0);
  objc_msgSend_setSharedZonePCSData_(self, v41, 0);
  uint64_t v44 = objc_msgSend_operation(self, v42, v43);
  uint64_t v47 = objc_msgSend_shareID(self, v45, v46);
  objc_msgSend_setPCSData_forFetchedShareID_(v44, v48, 0, v47);

  uint64_t v51 = objc_msgSend_share(self, v49, v50);
  uint64_t v54 = objc_msgSend_participants(v51, v52, v53);
  uint64_t v56 = objc_msgSend_CKCompactMap_(v54, v55, (uint64_t)&unk_1F20439B0);

  int v59 = objc_msgSend_container(v44, v57, v58);
  uint64_t v62 = objc_msgSend_backgroundPublicIdentityLookupService(v59, v60, v61);

  objc_msgSend_removeCacheForLookupInfos_(v62, v63, (uint64_t)v56);
  v66 = objc_msgSend_container(v44, v64, v65);
  os_log_t v69 = objc_msgSend_foregroundPublicIdentityLookupService(v66, v67, v68);

  objc_msgSend_removeCacheForLookupInfos_(v69, v70, (uint64_t)v56);
}

- (void)setServerRecord:(id)a3
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_operation(self, v6, v7);
  if (!v5) {
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v162 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v162, v163, (uint64_t)a2, self, @"CKDModifyShareHandler.m", 1434, @"Share handler called back with a CKRecord instead of a CKShare");
  }
  id v11 = v5;
  uint64_t v14 = objc_msgSend_mutableEncryptedPSK(v11, v12, v13);

  if (v14)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F19FA0]);
    int v20 = objc_msgSend_mutableEncryptedPSK(v11, v18, v19);
    uint64_t v23 = objc_msgSend_data(v20, v21, v22);
    uint64_t v25 = objc_msgSend_initWithData_(v17, v24, (uint64_t)v23);
    uint64_t v28 = objc_msgSend_share(self, v26, v27);
    objc_msgSend_setMutableEncryptedPSK_(v28, v29, (uint64_t)v25);
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v30 = objc_msgSend_share(self, v15, v16);
  uint64_t v33 = objc_msgSend_mutableEncryptedPSK(v30, v31, v32);

  if (v33)
  {
    id v36 = objc_alloc(MEMORY[0x1E4F19FA0]);
    int v20 = objc_msgSend_share(self, v37, v38);
    uint64_t v23 = objc_msgSend_mutableEncryptedPSK(v20, v39, v40);
    uint64_t v25 = objc_msgSend_data(v23, v41, v42);
    uint64_t v28 = objc_msgSend_initWithData_(v36, v43, (uint64_t)v25);
    objc_msgSend_setMutableEncryptedPSK_(v11, v44, (uint64_t)v28);
    goto LABEL_8;
  }
LABEL_9:
  os_log_t v45 = objc_msgSend_share(self, v34, v35);
  int isZoneWideShare = objc_msgSend_isZoneWideShare(v45, v46, v47);

  uint64_t v167 = v11;
  if (!isZoneWideShare) {
    goto LABEL_32;
  }
  uint64_t v165 = v8;
  id v166 = v5;
  uint64_t v51 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v11, v49, v50);
  v164 = self;
  uint64_t v54 = objc_msgSend_share(self, v52, v53);
  uint64_t v57 = objc_msgSend_oneTimeURLMetadatasByParticipantID(v54, v55, v56);

  uint64_t v58 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v61 = objc_msgSend_allKeys(v51, v59, v60);
  os_log_t v64 = objc_msgSend_allKeys(v57, v62, v63);
  v66 = objc_msgSend_arrayByAddingObjectsFromArray_(v61, v65, (uint64_t)v64);
  uint64_t v68 = objc_msgSend_setWithArray_(v58, v67, (uint64_t)v66);

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = v68;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v174, v179, 16);
  if (!v70) {
    goto LABEL_27;
  }
  uint64_t v72 = v70;
  uint64_t v73 = *(void *)v175;
  do
  {
    for (uint64_t i = 0; i != v72; ++i)
    {
      if (*(void *)v175 != v73) {
        objc_enumerationMutation(obj);
      }
      uint64_t v75 = *(void *)(*((void *)&v174 + 1) + 8 * i);
      BOOL v76 = objc_msgSend_objectForKeyedSubscript_(v51, v71, v75);
      uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v57, v77, v75);
      uint64_t v81 = v78;
      if (v78)
      {
        if (v76)
        {
          uint64_t v82 = objc_msgSend_encryptedOneTimeFullToken(v76, v79, v80);
          id v85 = objc_msgSend_data(v82, v83, v84);

          if (v85)
          {
            id v88 = objc_alloc(MEMORY[0x1E4F19FA0]);
            uint64_t v91 = objc_msgSend_encryptedOneTimeFullToken(v76, v89, v90);
            uint64_t v94 = objc_msgSend_data(v91, v92, v93);
            uint64_t v96 = objc_msgSend_initWithData_(v88, v95, (uint64_t)v94);
            objc_msgSend_setEncryptedOneTimeFullToken_(v81, v97, (uint64_t)v96);
          }
          else
          {
            uint64_t v100 = objc_msgSend_encryptedOneTimeFullToken(v81, v86, v87);
            uint64_t v103 = objc_msgSend_data(v100, v101, v102);

            if (!v103) {
              goto LABEL_25;
            }
            id v104 = objc_alloc(MEMORY[0x1E4F19FA0]);
            uint64_t v91 = objc_msgSend_encryptedOneTimeFullToken(v81, v105, v106);
            uint64_t v94 = objc_msgSend_data(v91, v107, v108);
            uint64_t v96 = objc_msgSend_initWithData_(v104, v109, (uint64_t)v94);
            objc_msgSend_setEncryptedOneTimeFullToken_(v76, v110, (uint64_t)v96);
          }
        }
        else
        {
          uint64_t v91 = objc_msgSend_copy(v78, v79, v80);
          objc_msgSend_setObject_forKeyedSubscript_(v51, v99, (uint64_t)v91, v75);
        }
      }
      else
      {
        uint64_t v91 = objc_msgSend_copy(v76, v79, v80);
        objc_msgSend_setObject_forKeyedSubscript_(v57, v98, (uint64_t)v91, v75);
      }

LABEL_25:
    }
    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v174, v179, 16);
  }
  while (v72);
LABEL_27:

  id v11 = v167;
  if (objc_msgSend_count(v51, v111, v112)) {
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v167, v113, (uint64_t)v51);
  }
  uint64_t v8 = v165;
  id v5 = v166;
  self = v164;
  if (objc_msgSend_count(v57, v113, v114))
  {
    v117 = objc_msgSend_share(v164, v115, v116);
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v117, v118, (uint64_t)v57);
  }
LABEL_32:
  uint64_t v119 = objc_msgSend_etag(v11, v49, v50);

  if (v119)
  {
    uint64_t v122 = objc_msgSend_etag(v11, v120, v121);
    id v125 = objc_msgSend_share(self, v123, v124);
    objc_msgSend_setEtag_(v125, v126, (uint64_t)v122);
    goto LABEL_36;
  }
  uint64_t v127 = objc_msgSend_share(self, v120, v121);
  uint64_t v130 = objc_msgSend_etag(v127, v128, v129);

  if (v130)
  {
    uint64_t v122 = objc_msgSend_share(self, v131, v132);
    id v125 = objc_msgSend_etag(v122, v133, v134);
    objc_msgSend_setEtag_(v11, v135, (uint64_t)v125);
LABEL_36:
  }
  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  __int16 v136 = objc_msgSend_participants(v11, v131, v132);
  uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v137, (uint64_t)&v170, v178, 16);
  if (v138)
  {
    uint64_t v141 = v138;
    uint64_t v142 = *(void *)v171;
    do
    {
      for (uint64_t j = 0; j != v141; ++j)
      {
        if (*(void *)v171 != v142) {
          objc_enumerationMutation(v136);
        }
        v144 = *(void **)(*((void *)&v170 + 1) + 8 * j);
        uint64_t v145 = objc_msgSend_share(self, v139, v140);
        uint64_t v147 = objc_msgSend__knownParticipantEqualToParticipant_(v145, v146, (uint64_t)v144);

        uint64_t v150 = objc_msgSend_invitationToken(v147, v148, v149);

        if (v150)
        {
          uint64_t v153 = objc_msgSend_invitationToken(v147, v151, v152);
          objc_msgSend_setInvitationToken_(v144, v154, (uint64_t)v153);
        }
      }
      uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v139, (uint64_t)&v170, v178, 16);
    }
    while (v141);
  }

  dispatch_block_t v157 = objc_msgSend_container(v8, v155, v156);
  uint64_t v160 = objc_msgSend_databaseScope(v8, v158, v159);
  objc_msgSend__prepPCSDataUsingPreDecryptedPCSOnlyWithContainer_databaseScope_(v167, v161, (uint64_t)v157, v160);

LABEL_47:
  v169.receiver = self;
  v169.super_class = (Class)CKDModifyShareHandler;
  [(CKDModifyRecordHandler *)&v169 setServerRecord:v5];
}

- (void)savePCSDataToCache
{
  id v4 = objc_msgSend_operation(self, a2, v2);
  uint64_t v7 = objc_msgSend_record(self, v5, v6);
  uint64_t v10 = objc_msgSend_etag(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_record(self, v11, v12);
    uint64_t v16 = objc_msgSend_etag(v13, v14, v15);
    uint64_t v19 = objc_msgSend_sharePCSData(self, v17, v18);
    objc_msgSend_setShareEtag_(v19, v20, (uint64_t)v16);
  }
  uint64_t v21 = objc_msgSend_sharePCSData(self, v11, v12);
  id v24 = objc_msgSend_shareID(self, v22, v23);
  objc_msgSend_setPCSData_forFetchedShareID_(v4, v25, (uint64_t)v21, v24);

  uint64_t v28 = objc_msgSend_sharedZonePCSData(self, v26, v27);

  if (v28)
  {
    uint64_t v31 = objc_msgSend_sharedZonePCSData(self, v29, v30);
    id v34 = objc_msgSend_shareID(self, v32, v33);
    uint64_t v37 = objc_msgSend_zoneID(v34, v35, v36);
    objc_msgSend_setPCSData_forFetchedZoneID_(v4, v38, (uint64_t)v31, v37);
  }
  v39.receiver = self;
  v39.super_class = (Class)CKDModifyShareHandler;
  [(CKDModifyRecordHandler *)&v39 savePCSDataToCache];
}

- (void)updateParticipantsForFetchedShare:(id)a3 error:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v11 = v8;
  if (v8)
  {
    if (objc_msgSend_CKIsObjectNotFoundError(v8, v9, v10))
    {
      objc_msgSend_clearProtectionDataForRecord(self, v12, v13);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v16 = objc_msgSend_share(self, v14, v15, 0);
      uint64_t v19 = objc_msgSend_addedParticipants(v16, v17, v18);

      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v38, v42, 16);
      if (v21)
      {
        uint64_t v23 = v21;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend_setProtectionInfo_(*(void **)(*((void *)&v38 + 1) + 8 * i), v22, 0);
          }
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v38, v42, 16);
        }
        while (v23);
      }

      objc_msgSend_setState_(self, v26, 1);
      objc_msgSend_setError_(self, v27, 0);
    }
    else
    {
      objc_msgSend_setState_(self, v12, 12);
      objc_msgSend_setError_(self, v35, (uint64_t)v11);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v28, v29);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, @"CKDModifyShareHandler.m", 1521, @"Share handler called back with a CKRecord instead of a CKShare");
    }
    uint64_t v30 = objc_msgSend_share(self, v28, v29);
    uint64_t v32 = objc_msgSend_updateFromServerShare_(v30, v31, (uint64_t)v7);

    if (v32)
    {
      objc_msgSend_setState_(self, v33, 12);
      objc_msgSend_setError_(self, v34, (uint64_t)v32);
    }
    else
    {
      objc_msgSend_setState_(self, v33, 1);
    }
  }
}

- (void)dealloc
{
  selfPPPCSOwnerIdentity = self->_selfPPPCSOwnerIdentity;
  if (selfPPPCSOwnerIdentity)
  {
    CFRelease(selfPPPCSOwnerIdentity);
    self->_selfPPPCSOwnerIdentity = 0;
  }
  selfParticipantPCS = self->_selfParticipantPCS;
  if (selfParticipantPCS)
  {
    CFRelease(selfParticipantPCS);
    self->_selfParticipantPCS = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CKDModifyShareHandler;
  [(CKDModifyShareHandler *)&v5 dealloc];
}

- (BOOL)haveAddedOwnerToShare
{
  return self->_haveAddedOwnerToShare;
}

- (void)setHaveAddedOwnerToShare:(BOOL)a3
{
  self->_haveAddedOwnerToShare = a3;
}

- (BOOL)isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade
{
  return self->_isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade;
}

- (void)setIsALegacyPublicShareThatNeedsOwnerPPPCSUpgrade:(BOOL)a3
{
  self->_isALegacyPublicShareThatNeedsOwnerPPPCSUpgrade = a3;
}

@end