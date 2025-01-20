@interface CKDDecryptRecordsOperation
- (BOOL)forcePCSDecrypt;
- (BOOL)isMarkedToFinish;
- (BOOL)isStarted;
- (BOOL)shouldCheckAppVersion;
- (BOOL)supportsClearAssetEncryption;
- (CKDDecryptRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSDictionary)webSharingIdentityDataByRecordID;
- (NSMutableArray)outstandingDecryptions;
- (OS_dispatch_group)recordDecryptGroup;
- (OS_dispatch_queue)recordDecryptQueue;
- (id)_decryptRecordPCSForRecord:(id)a3 usingChainPCS:(id)a4;
- (id)_decryptRecordPCSForRecord:(id)a3 usingSharePCS:(id)a4;
- (id)_decryptRecordPCSForRecord:(id)a3 usingZonePCS:(id)a4;
- (id)_possiblyWrapError:(id)a3 forRecordWithID:(id)a4 withCode:(int64_t)a5 format:(id)a6;
- (id)_unwrapAssetKeyForAsset:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6;
- (id)_unwrapEncryptedPropertiesForRecordValueStore:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4;
- (id)_unwrapEncryptedPropertiesOnRecord:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4;
- (id)_unwrapMergeableRecordValue:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6;
- (id)_unwrapPackageAssets:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6;
- (id)activityCreate;
- (unint64_t)maxUnwrapAttempts;
- (void)_clearProtectionDataForRecordInfo:(id)a3;
- (void)_decryptRecordInfo:(id)a3;
- (void)_decryptRecordInfo:(id)a3 usingWebSharingIdentityData:(id)a4;
- (void)_finishDecryptOperation;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleProtectionDataForRecordInfo:(id)a3;
- (void)_handleShareProtectionDataForRecordInfo:(id)a3;
- (void)_handleZoneProtectionDataForRecordInfo:(id)a3;
- (void)_recordInfoWasDecrypted:(id)a3 nextSteps:(id)a4;
- (void)decryptRecord:(id)a3 withCompletion:(id)a4;
- (void)finishDecryption;
- (void)main;
- (void)setForcePCSDecrypt:(BOOL)a3;
- (void)setMarkedToFinish:(BOOL)a3;
- (void)setMaxUnwrapAttempts:(unint64_t)a3;
- (void)setOutstandingDecryptions:(id)a3;
- (void)setRecordDecryptGroup:(id)a3;
- (void)setRecordDecryptQueue:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setWebSharingIdentityDataByRecordID:(id)a3;
@end

@implementation CKDDecryptRecordsOperation

- (CKDDecryptRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDDecryptRecordsOperation;
  v9 = [(CKDDatabaseOperation *)&v26 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_webSharingIdentityDataByRecordID(v6, v7, v8);
    objc_msgSend_setWebSharingIdentityDataByRecordID_(v9, v11, (uint64_t)v10);

    dispatch_group_t v12 = dispatch_group_create();
    recordDecryptGroup = v9->_recordDecryptGroup;
    v9->_recordDecryptGroup = (OS_dispatch_group *)v12;

    uint64_t v16 = objc_msgSend_createInactiveSerialQueue(v9, v14, v15);
    recordDecryptQueue = v9->_recordDecryptQueue;
    v9->_recordDecryptQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = objc_opt_new();
    outstandingDecryptions = v9->_outstandingDecryptions;
    v9->_outstandingDecryptions = (NSMutableArray *)v18;

    v22 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v20, v21);
    v9->_maxUnwrapAttempts = (int)objc_msgSend_PCSRetryCount(v22, v23, v24);
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/decrypt-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)decryptRecord:(id)a3 withCompletion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_isMarkedToFinish(self, v9, v10))
  {
    v38 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, self, @"CKDDecryptRecordsOperation.m", 117, @"Operation %@ has already been marked to finished. You can't enqueue any more decrypts", self);
  }
  v13 = objc_msgSend_recordDecryptGroup(self, v11, v12);
  dispatch_group_enter(v13);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v14 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    uint64_t v18 = objc_msgSend_recordID(v7, v16, v17);
    *(_DWORD *)buf = 138412290;
    v46 = v18;
    _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Enqueuing decryption for record %@", buf, 0xCu);
  }
  v19 = [CKRecordDecryptInfo alloc];
  v22 = objc_msgSend_callbackQueue(self, v20, v21);
  uint64_t v24 = objc_msgSend_initWithRecord_callbackQueue_(v19, v23, (uint64_t)v7, v22);

  objc_initWeak((id *)buf, v24);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C4FE0C68;
  v42[3] = &unk_1E64F84C0;
  v42[4] = self;
  objc_copyWeak(&v44, (id *)buf);
  id v25 = v8;
  id v43 = v25;
  objc_msgSend_setCallback_(v24, v26, (uint64_t)v42);
  v29 = objc_msgSend_outstandingDecryptions(self, v27, v28);
  objc_sync_enter(v29);
  v32 = objc_msgSend_outstandingDecryptions(self, v30, v31);
  objc_msgSend_addObject_(v32, v33, (uint64_t)v24);

  objc_sync_exit(v29);
  v36 = objc_msgSend_recordDecryptQueue(self, v34, v35);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FE0CC4;
  block[3] = &unk_1E64F0948;
  block[4] = self;
  id v41 = v24;
  id v37 = v24;
  dispatch_async(v36, block);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);
}

- (void)_recordInfoWasDecrypted:(id)a3 nextSteps:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  uint64_t v10 = objc_msgSend_callbackQueue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v11 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    v14 = v11;
    uint64_t v17 = objc_msgSend_record(v6, v15, v16);
    v20 = objc_msgSend_recordID(v17, v18, v19);
    id v25 = objc_msgSend_error(v6, v21, v22);
    if (v25) {
      objc_super v26 = @" with error: ";
    }
    else {
      objc_super v26 = &stru_1F2044F30;
    }
    uint64_t v27 = objc_msgSend_error(v6, v23, v24);
    uint64_t v28 = (void *)v27;
    if (v27) {
      v29 = (__CFString *)v27;
    }
    else {
      v29 = &stru_1F2044F30;
    }
    int v76 = 138412802;
    v77 = v20;
    __int16 v78 = 2114;
    v79 = v26;
    __int16 v80 = 2112;
    v81 = v29;
    _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Record %@ was decrypted%{public}@%@", (uint8_t *)&v76, 0x20u);
  }
  v32 = objc_msgSend_error(v6, v12, v13);
  if (v32)
  {
    v33 = objc_msgSend_error(v6, v30, v31);
    int v34 = CKIsPCSError();

    if (v34)
    {
      unint64_t v35 = objc_msgSend_numUnwrapAttempts(v6, v30, v31);
      unint64_t v38 = objc_msgSend_maxUnwrapAttempts(self, v36, v37);
      v39 = (void *)*MEMORY[0x1E4F1A548];
      uint64_t v40 = *MEMORY[0x1E4F1A550];
      if (v35 < v38)
      {
        if (v40 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v39);
        }
        id v41 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          id v43 = v41;
          v46 = objc_msgSend_record(v6, v44, v45);
          v49 = objc_msgSend_recordID(v46, v47, v48);
          int v76 = 138412290;
          v77 = v49;
          _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "Clearing protection data for record %@ and retrying decryption", (uint8_t *)&v76, 0xCu);
        }
        objc_msgSend_setError_(v6, v42, 0);
        v52 = objc_msgSend_callbackQueue(self, v50, v51);
        objc_msgSend__setupDecryptCallbackForQueue_(v6, v53, (uint64_t)v52);

        objc_msgSend__clearProtectionDataForRecordInfo_(self, v54, (uint64_t)v6);
        objc_msgSend__decryptRecordInfo_(self, v55, (uint64_t)v6);
        goto LABEL_26;
      }
      if (v40 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v39);
      }
      v56 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v57 = v56;
        v60 = objc_msgSend_record(v6, v58, v59);
        v63 = objc_msgSend_recordID(v60, v61, v62);
        int v76 = 138412290;
        v77 = v63;
        _os_log_impl(&dword_1C4CFF000, v57, OS_LOG_TYPE_INFO, "Decryption has failed for record %@ too many times. Giving up", (uint8_t *)&v76, 0xCu);
      }
    }
  }
  if (v7)
  {
    v64 = objc_msgSend_record(v6, v30, v31);
    v67 = objc_msgSend_error(v6, v65, v66);
    v7[2](v7, v64, v67);
  }
  v68 = objc_msgSend_outstandingDecryptions(self, v30, v31);
  objc_sync_enter(v68);
  v71 = objc_msgSend_outstandingDecryptions(self, v69, v70);
  objc_msgSend_removeObject_(v71, v72, (uint64_t)v6);

  objc_sync_exit(v68);
  v75 = objc_msgSend_recordDecryptGroup(self, v73, v74);
  dispatch_group_leave(v75);

LABEL_26:
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)_clearProtectionDataForRecordInfo:(id)a3
{
  objc_msgSend_record(a3, a2, (uint64_t)a3);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend_recordID(v43, v4, v5);
  objc_msgSend_setPCSData_forFetchedRecordID_(self, v7, 0, v6);

  uint64_t v10 = objc_msgSend_recordID(v43, v8, v9);
  uint64_t v13 = objc_msgSend_zoneID(v10, v11, v12);
  objc_msgSend_setPCSData_forFetchedZoneID_(self, v14, 0, v13);

  uint64_t v17 = objc_msgSend_share(v43, v15, v16);
  v20 = objc_msgSend_recordID(v17, v18, v19);
  objc_msgSend_setPCSData_forFetchedShareID_(self, v21, 0, v20);

  uint64_t v24 = objc_msgSend_parent(v43, v22, v23);
  uint64_t v27 = objc_msgSend_recordID(v24, v25, v26);
  objc_msgSend_setPCSData_forFetchedRecordID_(self, v28, 0, v27);

  id v29 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v30 = *MEMORY[0x1E4F19D48];
  v33 = objc_msgSend_recordID(v43, v31, v32);
  v36 = objc_msgSend_zoneID(v33, v34, v35);
  unint64_t v38 = objc_msgSend_initWithRecordName_zoneID_(v29, v37, v30, v36);

  objc_msgSend_setPCSData_forFetchedShareID_(self, v39, 0, v38);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v43;
    objc_msgSend_setPrivatePCS_(v40, v41, 0);
    objc_msgSend_setPublicPCS_(v40, v42, 0);
  }
}

- (void)_decryptRecordInfo:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_record(v4, v5, v6);
  uint64_t v10 = objc_msgSend_numUnwrapAttempts(v4, v8, v9);
  objc_msgSend_setNumUnwrapAttempts_(v4, v11, v10 + 1);
  v14 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v12, v13);
  if (objc_msgSend_isAppleInternalInstall(v14, v15, v16))
  {
    uint64_t v19 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v17, v18);
    uint64_t v22 = objc_msgSend_recordNamesForFakingDecryptionFailure(v19, v20, v21);
    id v25 = objc_msgSend_recordID(v7, v23, v24);
    uint64_t v28 = objc_msgSend_recordName(v25, v26, v27);
    int v30 = objc_msgSend_containsObject_(v22, v29, (uint64_t)v28);

    if (v30)
    {
      v33 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 5004, 0, @"Faking decryption failure on record because you asked for it");
      objc_msgSend_setError_(v4, v34, (uint64_t)v33);
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
  }
  int hasPropertiesRequiringDecryption = objc_msgSend_hasPropertiesRequiringDecryption(v7, v31, v32);
  if (objc_msgSend_isCancelled(self, v36, v37))
  {
    id v40 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v41 = *MEMORY[0x1E4F19DD8];
    v42 = objc_msgSend_operationID(self, v38, v39);
    v33 = objc_msgSend_errorWithDomain_code_format_(v40, v43, v41, 1, @"Decrypt operation %@ was cancelled", v42);

    if (!v33) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if ((hasPropertiesRequiringDecryption & 1) != 0 || objc_msgSend_forcePCSDecrypt(self, v38, v39))
  {
    if (objc_msgSend_useEncryption(self, v38, v39))
    {
      v46 = objc_msgSend_protectionData(v7, v44, v45);
      if (v46)
      {

LABEL_22:
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v59 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          __int16 v78 = v59;
          v81 = objc_msgSend_recordID(v7, v79, v80);
          *(_DWORD *)buf = 138412290;
          v83 = v81;
          _os_log_debug_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_DEBUG, "We need to decrypt properties on record %@. Fetching PCS data for that record", buf, 0xCu);
        }
        objc_msgSend__handleProtectionDataForRecordInfo_(self, v60, (uint64_t)v4);
        goto LABEL_20;
      }
      v56 = objc_msgSend_zoneishKeyID(v7, v47, v48);

      if (v56) {
        goto LABEL_22;
      }
      int v61 = objc_msgSend_forcePCSDecrypt(self, v57, v58);
      uint64_t v62 = (void *)*MEMORY[0x1E4F1A548];
      if ((v61 ^ 1 | hasPropertiesRequiringDecryption))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v62);
        }
        v63 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          uint64_t v66 = v63;
          v69 = objc_msgSend_recordID(v7, v67, v68);
          *(_DWORD *)buf = 138412290;
          v83 = v69;
          _os_log_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_INFO, "Record %@ has items that require encryption but no protection data was found on the record", buf, 0xCu);
        }
        uint64_t v70 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v71 = *MEMORY[0x1E4F19DD8];
        v72 = objc_msgSend_recordID(v7, v64, v65);
        v33 = objc_msgSend_errorWithDomain_code_format_(v70, v73, v71, 5001, @"Record %@ has items that require encryption but no protection data was found on the record", v72);

        if (!v33) {
          goto LABEL_20;
        }
LABEL_18:
        objc_msgSend_setError_(v4, v38, (uint64_t)v33);
        goto LABEL_19;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v62);
      }
      uint64_t v74 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v33 = v74;
        v77 = objc_msgSend_recordID(v7, v75, v76);
        *(_DWORD *)buf = 138412290;
        v83 = v77;
        _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "Suppressing error for record %@ because no protection data was found on the record while forcing decryption and it has no properties requiring decryption", buf, 0xCu);

        goto LABEL_19;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v49 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v51 = v49;
        v54 = objc_msgSend_recordID(v7, v52, v53);
        *(_DWORD *)buf = 138412290;
        v83 = v54;
        _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_INFO, "Encryption is disabled, so we're only going to pretend to unwrap the data on record %@. You asked for it!", buf, 0xCu);
      }
      v33 = objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v50, (uint64_t)v7, 0);
      if (v33) {
        goto LABEL_18;
      }
    }
  }
LABEL_20:
  v55 = objc_msgSend_decryptGroup(v4, v38, v39);
  dispatch_group_leave(v55);
}

- (void)_decryptRecordInfo:(id)a3 usingWebSharingIdentityData:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_record(v6, v8, v9);
  uint64_t v13 = objc_msgSend_container(self, v11, v12);
  uint64_t v16 = objc_msgSend_pcsManager(v13, v14, v15);
  id v45 = 0;
  uint64_t v18 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v16, v17, (uint64_t)v7, &v45);

  id v19 = v45;
  if (v19 || !v18)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v36 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v19;
      _os_log_error_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_ERROR, "Couldn't create a sharing identity from sharing identity data: %@", buf, 0xCu);
      if (v19)
      {
LABEL_15:
        if (!v18) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
    }
    else if (v19)
    {
      goto LABEL_15;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 5003, @"Couldn't create a sharing identity");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v22 = objc_msgSend_container(self, v20, v21);
  id v25 = objc_msgSend_pcsManager(v22, v23, v24);
  uint64_t v28 = objc_msgSend_protectionData(v10, v26, v27);
  id v44 = 0;
  int v30 = (const void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(v25, v29, (uint64_t)v28, v18, &v44);
  id v19 = v44;

  uint64_t v31 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v32 = *MEMORY[0x1E4F1A550];
  if (!v19 && v30)
  {
    if (v32 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v31);
    }
    v33 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      id v40 = v33;
      id v43 = objc_msgSend_recordID(v10, v41, v42);
      *(_DWORD *)buf = 138412546;
      id v47 = v43;
      __int16 v48 = 2112;
      v49 = v30;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);
    }
    objc_msgSend_setRecordPCS_(v10, v34, (uint64_t)v30);
    objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v35, (uint64_t)v10, v30);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (v32 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v31);
  }
  unint64_t v38 = *MEMORY[0x1E4F1A500];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    if (v19) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  *(_DWORD *)buf = 138412290;
  id v47 = v19;
  _os_log_error_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_ERROR, "Couldn't create a sharing identity from sharing identity data: %@", buf, 0xCu);
  if (!v19)
  {
LABEL_21:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v39, *MEMORY[0x1E4F19DD8], 5003, @"Couldn't unwrap record PCS with web sharing PCS");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:
  if (v30) {
LABEL_23:
  }
    CFRelease(v30);
LABEL_24:
  CFRelease(v18);
LABEL_25:
  objc_msgSend_setError_(v6, v37, (uint64_t)v19);
}

- (void)_handleZoneProtectionDataForRecordInfo:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_record(v4, v5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_isZoneWideShare(v7, v8, v9) & 1) == 0
    && objc_msgSend_privatePCS(v7, v8, v9)
    && objc_msgSend_publicPCS(v7, v8, v9))
  {
    uint64_t v10 = objc_msgSend_decryptGroup(v4, v8, v9);
    dispatch_group_enter(v10);

    uint64_t v13 = objc_msgSend_container(self, v11, v12);
    uint64_t v16 = objc_msgSend_pcsManager(v13, v14, v15);
    id v19 = objc_msgSend_topmostParentOperation(self, v17, v18);
    uint64_t v22 = objc_msgSend_operationID(v19, v20, v21);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = sub_1C4FE1E5C;
    v51[3] = &unk_1E64F84E8;
    v52 = v7;
    uint64_t v53 = self;
    id v54 = v4;
    id v23 = v4;
    id v24 = v7;
    objc_msgSend_pcsDataFromFetchedShare_requestorOperationID_completionHandler_(v16, v25, (uint64_t)v24, v22, v51);

    id v26 = v52;
  }
  else
  {
    uint64_t v27 = objc_msgSend_container(self, v8, v9);
    objc_msgSend_pcsCache(v27, v28, v29);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v32 = objc_msgSend_record(v4, v30, v31);
    uint64_t v35 = objc_msgSend_zoneishKeyID(v32, v33, v34);
    BOOL v36 = v35 != 0;

    uint64_t v39 = objc_msgSend_decryptGroup(v4, v37, v38);
    dispatch_group_enter(v39);

    uint64_t v42 = objc_msgSend_recordID(v7, v40, v41);
    id v45 = objc_msgSend_zoneID(v42, v43, v44);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1C4FE2100;
    v47[3] = &unk_1E64F8510;
    id v48 = v7;
    v49 = self;
    id v50 = v4;
    id v26 = v4;
    id v23 = v7;
    objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v24, v46, (uint64_t)v45, self, 8 * v36, v47);
  }
}

- (id)_decryptRecordPCSForRecord:(id)a3 usingZonePCS:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_zoneishKeyID(v6, v8, v9);

  if (v10)
  {
    if (objc_msgSend_zoneishPCS(v7, v11, v12))
    {
      uint64_t v15 = (__CFString *)objc_msgSend_zoneishPCS(v7, v13, v14);
      if (v15)
      {
        uint64_t v16 = v15;
        CFRetain(v15);
        uint64_t v18 = 0;
LABEL_24:
        uint64_t v84 = objc_msgSend_dataWithRecord_(CKDRecordPCSData, v17, (uint64_t)v6);
        objc_msgSend_setPcs_(v84, v85, (uint64_t)v16);
        objc_msgSend_setZonePCSData_(v84, v86, (uint64_t)v7);
        v89 = objc_msgSend_recordID(v6, v87, v88);
        objc_msgSend_setPCSData_forFetchedRecordID_(self, v90, (uint64_t)v84, v89);

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v91 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v106 = v91;
          v109 = objc_msgSend_recordID(v6, v107, v108);
          *(_DWORD *)buf = 138412546;
          v114 = v109;
          __int16 v115 = 2112;
          v116 = v16;
          _os_log_debug_impl(&dword_1C4CFF000, v106, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);
        }
        objc_msgSend_setRecordPCS_(v6, v92, (uint64_t)v16);
        v83 = objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v93, (uint64_t)v6, v16);

        CFRelease(v16);
        goto LABEL_34;
      }
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v19 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      id v23 = objc_msgSend_recordID(v6, v21, v22);
      id v26 = objc_msgSend_zoneID(v23, v24, v25);
      *(_DWORD *)buf = 138412290;
      v114 = v26;
      _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Couldn't get a zoneish PCS for zone %@. We'll try the record PCS if it exists, just in case.", buf, 0xCu);
    }
  }
  if (objc_msgSend_pcs(v7, v11, v12)
    && (objc_msgSend_protectionData(v6, v27, v28),
        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
        v29,
        v29))
  {
    uint64_t v32 = objc_msgSend_container(self, v30, v31);
    uint64_t v35 = objc_msgSend_options(v32, v33, v34);
    int v38 = objc_msgSend_acceptServerSignedRecords(v35, v36, v37);

    uint64_t v41 = objc_msgSend_container(self, v39, v40);
    uint64_t v44 = objc_msgSend_pcsManager(v41, v42, v43);
    id v47 = objc_msgSend_protectionData(v6, v45, v46);
    uint64_t v52 = objc_msgSend_pcs(v7, v48, v49);
    if (v38)
    {
      uint64_t v53 = objc_msgSend_validatedTrusts(CKDServerTrustCache, v50, v51);
      id v112 = 0;
      uint64_t v16 = (__CFString *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_trusts_error_(v44, v54, (uint64_t)v47, 1, v52, v53, &v112);
      uint64_t v18 = (__CFString *)v112;

      if (!v18)
      {
        v56 = objc_msgSend_container(self, v17, v55);
        uint64_t v59 = objc_msgSend_pcsManager(v56, v57, v58);
        uint64_t v62 = objc_msgSend_protectionData(v6, v60, v61);
        id v111 = 0;
        int v64 = objc_msgSend_recordProtectionDataNeedsCounterSign_error_(v59, v63, (uint64_t)v62, &v111);
        uint64_t v18 = (__CFString *)v111;

        if (v64) {
          objc_msgSend_setNeedsRollAndCounterSign_(v6, v17, 1);
        }
      }
    }
    else
    {
      id v110 = 0;
      uint64_t v16 = (__CFString *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v44, v50, (uint64_t)v47, 1, v52, &v110);
      uint64_t v18 = (__CFString *)v110;
    }
    if (v16) {
      goto LABEL_24;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v94 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v97 = v94;
      v100 = objc_msgSend_recordID(v6, v98, v99);
      *(_DWORD *)buf = 138412546;
      v114 = v100;
      __int16 v115 = 2112;
      v116 = v18;
      _os_log_impl(&dword_1C4CFF000, v97, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@: %@", buf, 0x16u);
    }
    v101 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v102 = *MEMORY[0x1E4F19DD8];
    v103 = objc_msgSend_recordID(v6, v95, v96);
    v83 = objc_msgSend_errorWithDomain_code_format_(v101, v104, v102, 5001, @"Record %@ has items that require encryption but no protection data was found: %@", v103, v18);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v65 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v68 = v65;
      uint64_t v71 = objc_msgSend_recordID(v6, v69, v70);
      uint64_t v74 = objc_msgSend_zoneID(v71, v72, v73);
      v77 = objc_msgSend_protectionData(v6, v75, v76);
      __int16 v78 = &stru_1F2044F30;
      if (!v77) {
        __int16 v78 = @" - record has no protection data";
      }
      *(_DWORD *)buf = 138412546;
      v114 = v74;
      __int16 v115 = 2114;
      v116 = v78;
      _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Couldn't fetch a PCS for zone %@%{public}@", buf, 0x16u);
    }
    v79 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v80 = *MEMORY[0x1E4F19DD8];
    v81 = objc_msgSend_recordID(v6, v66, v67);
    v83 = objc_msgSend_errorWithDomain_code_format_(v79, v82, v80, 5001, @"Record %@ has items that require encryption but no zone protection data was found", v81);
  }
LABEL_34:

  return v83;
}

- (id)_decryptRecordPCSForRecord:(id)a3 usingSharePCS:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_container(self, v8, v9);
  uint64_t v13 = objc_msgSend_pcsManager(v10, v11, v12);
  uint64_t v16 = objc_msgSend_protectionData(v6, v14, v15);
  uint64_t v19 = objc_msgSend_pcs(v7, v17, v18);
  id v51 = 0;
  uint64_t v21 = objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v13, v20, (uint64_t)v16, 1, v19, &v51);
  id v22 = v51;

  if (v21)
  {
    id v24 = objc_msgSend_dataWithRecord_(CKDRecordPCSData, v23, (uint64_t)v6);
    objc_msgSend_setPcs_(v24, v25, (uint64_t)v21);
    objc_msgSend_setSharePCSData_(v24, v26, (uint64_t)v7);
    uint64_t v29 = objc_msgSend_recordID(v6, v27, v28);
    objc_msgSend_setPCSData_forFetchedRecordID_(self, v30, (uint64_t)v24, v29);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v31 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      id v47 = v31;
      id v50 = objc_msgSend_recordID(v6, v48, v49);
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = v50;
      __int16 v54 = 2112;
      id v55 = v21;
      _os_log_debug_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);
    }
    objc_msgSend_setRecordPCS_(v6, v32, (uint64_t)v21);
    uint64_t v34 = objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v33, (uint64_t)v6, v21);

    CFRelease(v21);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v35 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v38 = v35;
      uint64_t v41 = objc_msgSend_recordID(v6, v39, v40);
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = v41;
      __int16 v54 = 2112;
      id v55 = v22;
      _os_log_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@ from share: %@", buf, 0x16u);
    }
    id v24 = objc_msgSend_recordID(v6, v36, v37);
    uint64_t v44 = objc_msgSend_recordID(v6, v42, v43);
    uint64_t v34 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v45, (uint64_t)v22, v24, 5001, @"Record %@ has items that require encryption but no protection data was found", v44);
  }
  return v34;
}

- (id)_decryptRecordPCSForRecord:(id)a3 usingChainPCS:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_container(self, v8, v9);
  uint64_t v13 = objc_msgSend_pcsManager(v10, v11, v12);
  uint64_t v15 = objc_msgSend_decryptChainPCSForRecordPCS_(v13, v14, (uint64_t)v7);

  if (v15
    || (objc_msgSend_chainPCSData(v7, v16, v17),
        int v38 = objc_claimAutoreleasedReturnValue(),
        uint64_t v41 = objc_msgSend_pcs(v38, v39, v40),
        v38,
        !v41))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = v18;
      id v24 = objc_msgSend_recordID(v6, v22, v23);
      *(_DWORD *)buf = 138412546;
      v89 = v24;
      __int16 v90 = 2112;
      v91 = v15;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@ from parent PCS: %@", buf, 0x16u);
    }
    uint64_t v25 = objc_msgSend_parent(v6, v19, v20);
    uint64_t v28 = objc_msgSend_recordID(v25, v26, v27);
    uint64_t v31 = objc_msgSend_parent(v6, v29, v30);
    uint64_t v34 = objc_msgSend_recordID(v31, v32, v33);
    BOOL v36 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v35, (uint64_t)v15, v28, 5001, @"Couldn't unwrap chain PCS on parent %@", v34);
  }
  else
  {
    uint64_t v44 = objc_msgSend_container(self, v42, v43);
    id v47 = objc_msgSend_pcsManager(v44, v45, v46);
    id v50 = objc_msgSend_protectionData(v6, v48, v49);
    uint64_t v53 = objc_msgSend_chainPCSData(v7, v51, v52);
    uint64_t v56 = objc_msgSend_pcs(v53, v54, v55);
    id v87 = 0;
    uint64_t v58 = objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v47, v57, (uint64_t)v50, 1, v56, &v87);
    id v59 = v87;

    if (!v59 && v58)
    {
      uint64_t v61 = objc_msgSend_dataWithRecord_(CKDRecordPCSData, v60, (uint64_t)v6);
      objc_msgSend_setPcs_(v61, v62, (uint64_t)v58);
      objc_msgSend_setParentPCSData_(v61, v63, (uint64_t)v7);
      uint64_t v66 = objc_msgSend_recordID(v6, v64, v65);
      objc_msgSend_setPCSData_forFetchedRecordID_(self, v67, (uint64_t)v61, v66);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v68 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v83 = v68;
        v86 = objc_msgSend_recordID(v6, v84, v85);
        *(_DWORD *)buf = 138412546;
        v89 = v86;
        __int16 v90 = 2112;
        v91 = v58;
        _os_log_debug_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_DEBUG, "Setting CKRecordPCS on record %@: %@", buf, 0x16u);
      }
      objc_msgSend_setRecordPCS_(v6, v69, (uint64_t)v58);
      BOOL v36 = objc_msgSend__unwrapEncryptedPropertiesOnRecord_withPCS_(self, v70, (uint64_t)v6, v58);

LABEL_23:
      CFRelease(v58);
      goto LABEL_7;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v71 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v74 = v71;
      v77 = objc_msgSend_recordID(v6, v75, v76);
      *(_DWORD *)buf = 138412546;
      v89 = v77;
      __int16 v90 = 2112;
      v91 = 0;
      _os_log_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_INFO, "Couldn't create record PCS for record %@ from parent PCS: %@", buf, 0x16u);
    }
    __int16 v78 = objc_msgSend_recordID(v6, v72, v73);
    v81 = objc_msgSend_recordID(v6, v79, v80);
    BOOL v36 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v82, (uint64_t)v59, v78, 5001, @"Record %@ has items that require encryption but no protection data was found", v81);

    if (v58) {
      goto LABEL_23;
    }
  }
LABEL_7:

  return v36;
}

- (void)_handleShareProtectionDataForRecordInfo:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_msgSend_record(v4, v5, v6);
  uint64_t v10 = objc_msgSend_share(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_decryptGroup(v4, v11, v12);
    dispatch_group_enter(v13);

    uint64_t v16 = objc_msgSend_container(self, v14, v15);
    objc_msgSend_pcsCache(v16, v17, v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    id v22 = objc_msgSend_share(v7, v20, v21);
    uint64_t v25 = objc_msgSend_recordID(v22, v23, v24);
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = sub_1C4FE370C;
    v86[3] = &unk_1E64F84E8;
    id v87 = v7;
    uint64_t v88 = self;
    id v89 = v4;
    objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v19, v26, (uint64_t)v25, self, 0, v86);

    uint64_t v27 = v87;
  }
  else
  {
    uint64_t v28 = objc_msgSend_parent(v7, v11, v12);

    if (v28)
    {
      uint64_t v31 = objc_msgSend_decryptGroup(v4, v29, v30);
      dispatch_group_enter(v31);

      uint64_t v34 = objc_msgSend_container(self, v32, v33);
      objc_msgSend_pcsCache(v34, v35, v36);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v39 = objc_msgSend_parent(v7, v37, v38);
      uint64_t v42 = objc_msgSend_recordID(v39, v40, v41);
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = sub_1C4FE39E8;
      v81[3] = &unk_1E64F8538;
      id v82 = v7;
      objc_copyWeak(&v85, &location);
      v83 = self;
      id v84 = v4;
      objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v19, v43, (uint64_t)v42, self, 4, v81);

      objc_destroyWeak(&v85);
      uint64_t v27 = v82;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isZoneWideShare(v7, v44, v45) & 1) == 0)
      {
        id v59 = objc_msgSend_decryptGroup(v4, v44, v45);
        dispatch_group_enter(v59);

        uint64_t v62 = objc_msgSend_container(self, v60, v61);
        uint64_t v65 = objc_msgSend_pcsManager(v62, v63, v64);
        uint64_t v68 = objc_msgSend_topmostParentOperation(self, v66, v67);
        uint64_t v71 = objc_msgSend_operationID(v68, v69, v70);
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = sub_1C4FE3CC4;
        v77[3] = &unk_1E64F84E8;
        id v78 = v7;
        v79 = self;
        id v80 = v4;
        objc_msgSend_pcsDataFromFetchedShare_requestorOperationID_completionHandler_(v65, v72, (uint64_t)v78, v71, v77);

        id v19 = v78;
        goto LABEL_9;
      }
      uint64_t v46 = objc_msgSend_decryptGroup(v4, v44, v45);
      dispatch_group_enter(v46);

      uint64_t v49 = objc_msgSend_container(self, v47, v48);
      objc_msgSend_pcsCache(v49, v50, v51);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      __int16 v54 = objc_msgSend_recordID(v7, v52, v53);
      v57 = objc_msgSend_zoneID(v54, v55, v56);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = sub_1C4FE3F68;
      v73[3] = &unk_1E64F8510;
      id v74 = v7;
      v75 = self;
      id v76 = v4;
      objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v19, v58, (uint64_t)v57, self, 0, v73);

      uint64_t v27 = v74;
    }
  }

LABEL_9:
  objc_destroyWeak(&location);
}

- (void)_handleProtectionDataForRecordInfo:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v8 = objc_msgSend_record(v5, v6, v7);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = v9;
    uint64_t v46 = objc_msgSend_recordID(v8, v44, v45);
    uint64_t v49 = objc_msgSend_recordID(v8, v47, v48);
    uint64_t v52 = objc_msgSend_zoneID(v49, v50, v51);
    int v53 = 134218498;
    __int16 v54 = v8;
    __int16 v55 = 2112;
    uint64_t v56 = v46;
    __int16 v57 = 2112;
    uint64_t v58 = v52;
    _os_log_debug_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_DEBUG, "Fetching PCS data. Record %p recordID %@ zoneID %@", (uint8_t *)&v53, 0x20u);
  }
  uint64_t v12 = objc_msgSend_container(self, v10, v11);
  uint64_t v15 = objc_msgSend_deviceContext(v12, v13, v14);
  uint64_t v18 = objc_msgSend_testDeviceReference(v15, v16, v17);
  if (v18)
  {
    uint64_t v21 = (void *)v18;
    id v22 = objc_msgSend_webSharingIdentityDataByRecordID(self, v19, v20);
    uint64_t v25 = objc_msgSend_recordID(v8, v23, v24);
    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v22, v26, (uint64_t)v25);

    if (v27)
    {
      uint64_t v30 = objc_msgSend_webSharingIdentityDataByRecordID(self, v28, v29);
      uint64_t v33 = objc_msgSend_recordID(v8, v31, v32);
      uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v30, v34, (uint64_t)v33);
      objc_msgSend__decryptRecordInfo_usingWebSharingIdentityData_(self, v36, (uint64_t)v5, v35);

      goto LABEL_14;
    }
  }
  else
  {
  }
  if (objc_msgSend_databaseScope(self, v28, v29) == 2)
  {
    objc_msgSend__handleZoneProtectionDataForRecordInfo_(self, v37, (uint64_t)v5);
  }
  else if (objc_msgSend_databaseScope(self, v37, v38) == 3)
  {
    objc_msgSend__handleShareProtectionDataForRecordInfo_(self, v39, (uint64_t)v5);
  }
  else
  {
    uint64_t v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v39, v40);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, @"CKDDecryptRecordsOperation.m", 501, @"You can't decrypt a record in the public database");
  }
LABEL_14:
}

- (id)_unwrapAssetKeyForAsset:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v15 = objc_msgSend_useEncryption(self, v13, v14);
  uint64_t v18 = objc_msgSend_mergeableDeltaID(v10, v16, v17);
  if (v18)
  {
    uint64_t v21 = (void *)v18;
    id v22 = objc_msgSend_mergeableDeltaID(v10, v19, v20);
    uint64_t v25 = objc_msgSend_valueID(v22, v23, v24);
    int isEncrypted = objc_msgSend_isEncrypted(v25, v26, v27);

    if ((isEncrypted & v15) == 1) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v51 = 0;
    id v52 = 0;
    __int16 v54 = 0;
    goto LABEL_15;
  }
  if ((v15 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (a6)
  {
    uint64_t v29 = [CKDWrappingContext alloc];
    uint64_t v32 = objc_msgSend_mergeableDeltaID(v10, v30, v31);
    uint64_t v35 = objc_msgSend_signature(v10, v33, v34);
    uint64_t v38 = objc_msgSend_referenceSignature(v10, v36, v37);
    id v59 = v12;
    uint64_t v40 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v29, v39, (uint64_t)v11, v12, v32, v35, v38);

    uint64_t v43 = objc_msgSend_container(self, v41, v42);
    uint64_t v46 = objc_msgSend_pcsManager(v43, v44, v45);
    uint64_t v49 = objc_msgSend_wrappedAssetKey(v10, v47, v48);
    id v60 = 0;
    uint64_t v51 = objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v46, v50, (uint64_t)v49, a6, v40, &v60);
    id v52 = v60;

    if (v51)
    {
      objc_msgSend_setAssetKey_(v10, v53, (uint64_t)v51);
      __int16 v54 = 0;
    }
    else
    {
      __int16 v54 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(self, v53, (uint64_t)v52, v11, 5004, @"Error unwrapping asset key with PCS %@ for record %@", a6, v11);
    }

    id v12 = v59;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v55 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v11;
      _os_log_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_INFO, "Couldn't get a PCS object for record %@", buf, 0xCu);
    }
    __int16 v54 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v56, *MEMORY[0x1E4F19DD8], 5001, @"Couldn't get a PCS object for record %@", v11);
    uint64_t v51 = 0;
    id v52 = 0;
  }
LABEL_15:
  id v57 = v54;

  return v57;
}

- (id)_unwrapPackageAssets:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = objc_msgSend_assets(a3, v12, v13, 0);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend__unwrapAssetKeyForAsset_inRecordWithID_forField_withPCS_(self, v17, *(void *)(*((void *)&v24 + 1) + 8 * i), v10, v11, a6);
        if (v21)
        {
          id v22 = (void *)v21;
          goto LABEL_11;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
      if (v18) {
        continue;
      }
      break;
    }
  }
  id v22 = 0;
LABEL_11:

  return v22;
}

- (id)_unwrapMergeableRecordValue:(id)a3 inRecordWithID:(id)a4 forField:(id)a5 withPCS:(_OpaquePCSShareProtection *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v11 = objc_msgSend_useEncryption(self, v9, v10);
  id v12 = 0;
  if (a6 && v11)
  {
    uint64_t v13 = objc_alloc_init(CKDKeyEnvelopeContext);
    objc_msgSend_setShareProtection_(v13, v14, (uint64_t)a6);
    uint64_t v17 = objc_msgSend_container(self, v15, v16);
    uint64_t v20 = objc_msgSend_pcsManager(v17, v18, v19);
    objc_msgSend_setPcsManager_(v13, v21, (uint64_t)v20);

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v24 = objc_msgSend_unmergedDeltas(v8, v22, v23);
    id v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v37, v43, 16);
    if (v12)
    {
      uint64_t v27 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v36 = 0;
          char v30 = objc_msgSend_decryptWithContext_error_(v29, v26, (uint64_t)v13, &v36);
          id v31 = v36;
          uint64_t v32 = v31;
          if ((v30 & 1) == 0)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v33 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = v32;
              _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Failed to decrypt mergeable delta with error: %@", buf, 0xCu);
            }
            id v12 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v34, *MEMORY[0x1E4F19DD8], 5004, v32, @"Failed to decrypt mergeable delta");

            goto LABEL_17;
          }
        }
        id v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v37, v43, 16);
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  return v12;
}

- (id)_unwrapEncryptedPropertiesForRecordValueStore:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  objc_msgSend_allKeys(v5, v6, v7);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v121, v129, 16);
  if (!v9) {
    goto LABEL_65;
  }
  uint64_t v11 = v9;
  unint64_t v12 = 0x1E4F19000uLL;
  uint64_t v103 = *(void *)v122;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v122 != v103) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v121 + 1) + 8 * v13);
      int v15 = objc_msgSend_rawValueForKey_(v5, v10, v14, v91);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v16 = v12;
        uint64_t v17 = [CKDWrappingContext alloc];
        uint64_t v20 = objc_msgSend_recordID(v5, v18, v19);
        id v22 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v17, v21, (uint64_t)v20, v14, 0, 0, 0);

        long long v25 = objc_msgSend_container(self, v23, v24);
        uint64_t v28 = objc_msgSend_pcsManager(v25, v26, v27);
        char v30 = objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v28, v29, (uint64_t)v15, a4, v22);

        unint64_t v12 = v16;
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = objc_msgSend_recordID(v5, v31, v32);
        uint64_t v34 = objc_msgSend__unwrapAssetKeyForAsset_inRecordWithID_forField_withPCS_(self, v33, (uint64_t)v15, v22, v14, a4);
LABEL_14:
        char v30 = (void *)v34;
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = objc_msgSend_recordID(v5, v35, v36);
        uint64_t v34 = objc_msgSend__unwrapPackageAssets_inRecordWithID_forField_withPCS_(self, v37, (uint64_t)v15, v22, v14, a4);
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = objc_msgSend_recordID(v5, v38, v39);
        uint64_t v34 = objc_msgSend__unwrapMergeableRecordValue_inRecordWithID_forField_withPCS_(self, v40, (uint64_t)v15, v22, v14, a4);
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_count(v15, v41, v42)) {
        goto LABEL_63;
      }
      id v22 = objc_msgSend_firstObject(v15, v43, v44);
      objc_opt_class();
      v101 = self;
      uint64_t v91 = v11;
      if (objc_opt_isKindOfClass())
      {
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v92 = v15;
        uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v45, (uint64_t)&v117, v128, 16);
        if (v97)
        {
          id v93 = *(id *)v118;
LABEL_23:
          uint64_t v46 = 0;
          while (1)
          {
            if (*(id *)v118 != v93) {
              objc_enumerationMutation(v92);
            }
            uint64_t v47 = *(void *)(*((void *)&v117 + 1) + 8 * v46);
            uint64_t v48 = [CKDWrappingContext alloc];
            uint64_t v51 = objc_msgSend_recordID(v5, v49, v50);
            int v53 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v48, v52, (uint64_t)v51, v14, 0, 0, 0);

            uint64_t v56 = objc_msgSend_container(v101, v54, v55);
            id v59 = objc_msgSend_pcsManager(v56, v57, v58);
            char v30 = objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v59, v60, v47, a4, v53);

            if (v30) {
              goto LABEL_61;
            }
            if (v97 == ++v46)
            {
              char v30 = 0;
              uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v61, (uint64_t)&v117, v128, 16);
              if (v97) {
                goto LABEL_23;
              }
              goto LABEL_61;
            }
          }
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v94 = v15;
          uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v62, (uint64_t)&v113, v127, 16);
          if (v63)
          {
            uint64_t v66 = v63;
            uint64_t v98 = *(void *)v114;
LABEL_33:
            uint64_t v67 = 0;
            while (1)
            {
              if (*(void *)v114 != v98) {
                objc_enumerationMutation(v94);
              }
              uint64_t v68 = *(void *)(*((void *)&v113 + 1) + 8 * v67);
              v69 = objc_msgSend_recordID(v5, v64, v65, v91);
              char v30 = objc_msgSend__unwrapAssetKeyForAsset_inRecordWithID_forField_withPCS_(v101, v70, v68, v69, v14, a4);

              if (v30) {
                goto LABEL_61;
              }
              if (v66 == ++v67)
              {
                uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v64, (uint64_t)&v113, v127, 16);
                char v30 = 0;
                if (v66) {
                  goto LABEL_33;
                }
                goto LABEL_61;
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            id v95 = v15;
            uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v71, (uint64_t)&v109, v126, 16);
            if (v72)
            {
              uint64_t v75 = v72;
              uint64_t v99 = *(void *)v110;
LABEL_43:
              uint64_t v76 = 0;
              while (1)
              {
                if (*(void *)v110 != v99) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v77 = *(void *)(*((void *)&v109 + 1) + 8 * v76);
                id v78 = objc_msgSend_recordID(v5, v73, v74, v91);
                char v30 = objc_msgSend__unwrapPackageAssets_inRecordWithID_forField_withPCS_(v101, v79, v77, v78, v14, a4);

                if (v30) {
                  goto LABEL_61;
                }
                if (v75 == ++v76)
                {
                  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v73, (uint64_t)&v109, v126, 16);
                  char v30 = 0;
                  if (v75) {
                    goto LABEL_43;
                  }
                  goto LABEL_61;
                }
              }
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_63:
              goto LABEL_16;
            }
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v96 = v15;
            uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v80, (uint64_t)&v105, v125, 16);
            if (v81)
            {
              uint64_t v84 = v81;
              uint64_t v100 = *(void *)v106;
LABEL_53:
              uint64_t v85 = 0;
              while (1)
              {
                if (*(void *)v106 != v100) {
                  objc_enumerationMutation(v96);
                }
                uint64_t v86 = *(void *)(*((void *)&v105 + 1) + 8 * v85);
                id v87 = objc_msgSend_recordID(v5, v82, v83, v91);
                char v30 = objc_msgSend__unwrapMergeableRecordValue_inRecordWithID_forField_withPCS_(v101, v88, v86, v87, v14, a4);

                if (v30) {
                  goto LABEL_61;
                }
                if (v84 == ++v85)
                {
                  uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v82, (uint64_t)&v105, v125, 16);
                  char v30 = 0;
                  if (v84) {
                    goto LABEL_53;
                  }
                  goto LABEL_61;
                }
              }
            }
          }
        }
      }
      char v30 = 0;
LABEL_61:

      self = v101;
      unint64_t v12 = 0x1E4F19000;
      uint64_t v11 = v91;
LABEL_15:

      if (v30) {
        goto LABEL_66;
      }
LABEL_16:
      ++v13;
    }
    while (v13 != v11);
    uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v121, v129, 16);
    uint64_t v11 = v89;
  }
  while (v89);
LABEL_65:
  char v30 = 0;
LABEL_66:

  return v30;
}

- (id)_unwrapEncryptedPropertiesOnRecord:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a4 && objc_msgSend_useEncryption(self, v6, v7))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      unint64_t v12 = v9;
      int v15 = objc_msgSend_recordID(v8, v13, v14);
      *(_DWORD *)buf = 138412290;
      v139 = v15;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Couldn't get a PCS object for the record %@", buf, 0xCu);
    }
    unint64_t v16 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v17 = *MEMORY[0x1E4F19DD8];
    objc_msgSend_recordID(v8, v10, v11);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend_errorWithDomain_code_format_(v16, v19, v17, 5001, @"Couldn't get a PCS object for the record %@. ", v18);
LABEL_8:

    goto LABEL_11;
  }
  uint64_t v21 = objc_msgSend_valueStore(v8, v6, v7);
  uint64_t v20 = objc_msgSend__unwrapEncryptedPropertiesForRecordValueStore_withPCS_(self, v22, (uint64_t)v21, a4);

  if (!v20)
  {
    long long v25 = objc_msgSend_encryptedValueStore(v8, v23, v24);
    uint64_t v20 = objc_msgSend__unwrapEncryptedPropertiesForRecordValueStore_withPCS_(self, v26, (uint64_t)v25, a4);

    if (!v20)
    {
      char v30 = objc_msgSend_chainPrivateKey(v8, v27, v28);
      uint64_t v33 = objc_msgSend_encryptedData(v30, v31, v32);

      if (!v33) {
        goto LABEL_16;
      }
      uint64_t v36 = [CKDWrappingContext alloc];
      uint64_t v39 = objc_msgSend_recordID(v8, v37, v38);
      uint64_t v41 = objc_msgSend_initWithRecordID_fieldName_(v36, v40, (uint64_t)v39, *MEMORY[0x1E4F1A580]);

      uint64_t v44 = objc_msgSend_container(self, v42, v43);
      uint64_t v47 = objc_msgSend_pcsManager(v44, v45, v46);
      uint64_t v50 = objc_msgSend_chainPrivateKey(v8, v48, v49);
      uint64_t v20 = objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v47, v51, (uint64_t)v50, a4, v41);

      if (!v20)
      {
LABEL_16:
        id v52 = objc_msgSend_mutableEncryptedPSK(v8, v34, v35);
        uint64_t v55 = objc_msgSend_encryptedData(v52, v53, v54);

        if (v55)
        {
          uint64_t v58 = [CKDWrappingContext alloc];
          uint64_t v61 = objc_msgSend_recordID(v8, v59, v60);
          id v18 = (id)objc_msgSend_initWithRecordID_fieldName_(v58, v62, (uint64_t)v61, *MEMORY[0x1E4F1A5D0]);

          uint64_t v65 = objc_msgSend_container(self, v63, v64);
          uint64_t v68 = objc_msgSend_pcsManager(v65, v66, v67);
          uint64_t v71 = objc_msgSend_mutableEncryptedPSK(v8, v69, v70);
          uint64_t v20 = objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v68, v72, (uint64_t)v71, a4, v18);

          if (v20)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v73 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              long long v116 = v73;
              long long v119 = objc_msgSend_recordID(v8, v117, v118);
              *(_DWORD *)buf = 138412290;
              v139 = v119;
              _os_log_debug_impl(&dword_1C4CFF000, v116, OS_LOG_TYPE_DEBUG, "Record %@ is unable to decrypt its mutableEncryptedPSK.  Dropping the value", buf, 0xCu);
            }
            objc_msgSend_setMutableEncryptedPSK_(v8, v74, 0);
            goto LABEL_8;
          }
        }
        uint64_t v75 = objc_msgSend_recordID(v8, v56, v57);
        id v78 = objc_msgSend_recordName(v75, v76, v77);
        int isEqualToString = objc_msgSend_isEqualToString_(v78, v79, *MEMORY[0x1E4F19D48]);

        if (isEqualToString)
        {
          v131 = self;
          id v127 = v8;
          id v18 = v8;
          objc_msgSend_oneTimeURLMetadatasByParticipantID(v18, v81, v82);
          long long v134 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          v128 = long long v137 = 0u;
          objc_msgSend_allValues(v128, v83, v84);
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v85, (uint64_t)&v134, v142, 16);
          if (v133)
          {
            uint64_t v132 = *(void *)v135;
            uint64_t v130 = *MEMORY[0x1E4F1A5C8];
            while (2)
            {
              for (uint64_t i = 0; i != v133; ++i)
              {
                if (*(void *)v135 != v132) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v89 = *(void **)(*((void *)&v134 + 1) + 8 * i);
                __int16 v90 = objc_msgSend_encryptedOneTimeFullToken(v89, v86, v87);
                id v93 = objc_msgSend_encryptedData(v90, v91, v92);

                if (v93)
                {
                  id v94 = [CKDWrappingContext alloc];
                  id v95 = v18;
                  uint64_t v98 = objc_msgSend_recordID(v18, v96, v97);
                  uint64_t v100 = objc_msgSend_initWithRecordID_fieldName_(v94, v99, (uint64_t)v98, v130);

                  uint64_t v103 = objc_msgSend_container(v131, v101, v102);
                  long long v106 = objc_msgSend_pcsManager(v103, v104, v105);
                  long long v109 = objc_msgSend_encryptedOneTimeFullToken(v89, v107, v108);
                  uint64_t v20 = objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v106, v110, (uint64_t)v109, a4, v100);

                  if (v20)
                  {
                    if (*MEMORY[0x1E4F1A550] != -1) {
                      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                    }
                    id v18 = v95;
                    id v8 = v127;
                    long long v115 = (void *)*MEMORY[0x1E4F1A500];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
                    {
                      long long v120 = v115;
                      long long v123 = objc_msgSend_recordID(v95, v121, v122);
                      v126 = objc_msgSend_participantID(v89, v124, v125);
                      *(_DWORD *)buf = 138412546;
                      v139 = v123;
                      __int16 v140 = 2112;
                      v141 = v126;
                      _os_log_debug_impl(&dword_1C4CFF000, v120, OS_LOG_TYPE_DEBUG, "Record %@ is unable to decrypt its encryptedOneTimeFullToken for participant %@. Bailing.", buf, 0x16u);

                      id v18 = v95;
                    }

                    long long v111 = v128;
                    goto LABEL_44;
                  }

                  id v18 = v95;
                }
              }
              uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v86, (uint64_t)&v134, v142, 16);
              if (v133) {
                continue;
              }
              break;
            }
          }

          long long v111 = v128;
          if (objc_msgSend_count(v128, v112, v113)) {
            objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v18, v114, (uint64_t)v128);
          }
          uint64_t v20 = 0;
          id v8 = v127;
LABEL_44:

          goto LABEL_8;
        }
        uint64_t v20 = 0;
      }
    }
  }
LABEL_11:

  return v20;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F1A500];
  id v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v22 = v8;
    long long v25 = objc_msgSend_operationID(self, v23, v24);
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v25;
    _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "Finished decrypt operation %{public}@", buf, 0xCu);
  }
  if (objc_msgSend_isFinished(self, v9, v10))
  {
    char v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    uint64_t v33 = objc_msgSend_operationID(self, v31, v32);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v34, (uint64_t)a2, self, @"CKDDecryptRecordsOperation.m", 672, @"Operation %@ was already marked as finished", v33);
  }
  uint64_t v13 = objc_msgSend_recordDecryptQueue(self, v11, v12);
  dispatch_activate(v13);

  if (*v6 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
  {
    long long v26 = v14;
    uint64_t v29 = objc_msgSend_operationID(self, v27, v28);
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v29;
    _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Decrypt operation %{public}@ is finishing. Waiting for all records to finish decrypting in case it never started", buf, 0xCu);
  }
  uint64_t v17 = objc_msgSend_recordDecryptGroup(self, v15, v16);
  uint64_t v20 = objc_msgSend_callbackQueue(self, v18, v19);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FE5CD0;
  block[3] = &unk_1E64F19C0;
  id v36 = v5;
  SEL v37 = a2;
  block[4] = self;
  id v21 = v5;
  dispatch_group_notify(v17, v20, block);
}

- (void)finishDecryption
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = v3;
    uint64_t v13 = objc_msgSend_operationID(self, v11, v12);
    int v14 = 138543362;
    int v15 = v13;
    _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "Finishing decryption operation %{public}@", (uint8_t *)&v14, 0xCu);
  }
  id v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend_isStarted(v4, v5, v6))
  {
    objc_sync_exit(v4);

    objc_msgSend__finishDecryptOperation(v4, v8, v9);
  }
  else
  {
    objc_msgSend_setMarkedToFinish_(v4, v7, 1);
    objc_sync_exit(v4);
  }
}

- (void)_finishDecryptOperation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isFinished(self, a2, v2))
  {
    uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKDDecryptRecordsOperation.m", 703, @"You can't finish a decrypt operation twice");
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v9;
    uint64_t v23 = objc_msgSend_operationID(self, v21, v22);
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v23;
    _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Finishing decrypt records operation %{public}@", buf, 0xCu);
  }
  uint64_t v12 = objc_msgSend_recordDecryptQueue(self, v10, v11);
  dispatch_activate(v12);

  if (*v7 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = v13;
    uint64_t v27 = objc_msgSend_operationID(self, v25, v26);
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v27;
    _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "Decrypt operation %{public}@ is finishing. Waiting for all records to finish decrypting first...", buf, 0xCu);
  }
  uint64_t v16 = objc_msgSend_recordDecryptGroup(self, v14, v15);
  uint64_t v19 = objc_msgSend_callbackQueue(self, v17, v18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FE6194;
  block[3] = &unk_1E64F05C8;
  block[4] = self;
  dispatch_group_notify(v16, v19, block);
}

- (id)_possiblyWrapError:(id)a3 forRecordWithID:(id)a4 withCode:(int64_t)a5 format:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((CKShouldWrapErrorFetchingRecords() & 1) == 0)
  {
    id v18 = v9;
    goto LABEL_5;
  }
  if (CKCanRetryForError())
  {
    int v14 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v15 = *MEMORY[0x1E4F19DD8];
    uint64_t v16 = objc_msgSend_code(v9, v12, v13);
    objc_msgSend_errorWithDomain_code_error_format_(v14, v17, v15, v16, v9, @"Encountered a transient error fetching protection data for record %@. Please try again.", v10);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    uint64_t v19 = v18;
    goto LABEL_9;
  }
  id v20 = [NSString alloc];
  uint64_t v23 = objc_msgSend_initWithFormat_arguments_(v20, v21, (uint64_t)v11, &v27);
  if (v9)
  {
    uint64_t v24 = objc_msgSend_stringWithFormat_(NSString, v22, @"%@: %@", v23, v9);

    uint64_t v23 = (void *)v24;
  }
  uint64_t v19 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], a5, v9, @"%@", v23);

LABEL_9:
  return v19;
}

- (void)main
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_isMarkedToFinish(v2, v3, v4))
  {
    objc_sync_exit(v2);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v6;
      uint64_t v16 = objc_msgSend_operationID(v2, v14, v15);
      int v21 = 138543362;
      uint64_t v22 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Record decrypt operation %{public}@ was asked to finish before it started", (uint8_t *)&v21, 0xCu);
    }
    objc_msgSend__finishDecryptOperation(v2, v7, v8);
  }
  else
  {
    objc_msgSend_setStarted_(v2, v5, 1);
    objc_sync_exit(v2);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v9;
      id v20 = objc_msgSend_operationID(v2, v18, v19);
      int v21 = 138543362;
      uint64_t v22 = v20;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Starting decrypt records operation %{public}@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v12 = objc_msgSend_recordDecryptQueue(v2, v10, v11);
    dispatch_activate(v12);
  }
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)forcePCSDecrypt
{
  return self->_forcePCSDecrypt;
}

- (void)setForcePCSDecrypt:(BOOL)a3
{
  self->_forcePCSDecrypt = a3;
}

- (NSMutableArray)outstandingDecryptions
{
  return self->_outstandingDecryptions;
}

- (void)setOutstandingDecryptions:(id)a3
{
}

- (OS_dispatch_group)recordDecryptGroup
{
  return self->_recordDecryptGroup;
}

- (void)setRecordDecryptGroup:(id)a3
{
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isMarkedToFinish
{
  return self->_markedToFinish;
}

- (void)setMarkedToFinish:(BOOL)a3
{
  self->_markedToFinish = a3;
}

- (OS_dispatch_queue)recordDecryptQueue
{
  return self->_recordDecryptQueue;
}

- (void)setRecordDecryptQueue:(id)a3
{
}

- (unint64_t)maxUnwrapAttempts
{
  return self->_maxUnwrapAttempts;
}

- (void)setMaxUnwrapAttempts:(unint64_t)a3
{
  self->_maxUnwrapAttempts = a3;
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_recordDecryptQueue, 0);
  objc_storeStrong((id *)&self->_recordDecryptGroup, 0);
  objc_storeStrong((id *)&self->_outstandingDecryptions, 0);
}

@end