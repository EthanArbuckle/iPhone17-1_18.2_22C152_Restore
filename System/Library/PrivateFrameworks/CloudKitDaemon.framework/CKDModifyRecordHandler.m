@interface CKDModifyRecordHandler
+ (id)_stringForState:(unint64_t)a3;
+ (id)modifyHandlerForDeleteWithRecordID:(id)a3 operation:(id)a4;
+ (id)modifyHandlerWithRecord:(id)a3 operation:(id)a4;
- (BOOL)_canSetPreviousProtectionEtag;
- (BOOL)_createPublicSharingKeyWithError:(id *)a3;
- (BOOL)_encryptMergeableDeltasInRecordValueStore:(id)a3 shareProtection:(_OpaquePCSShareProtection *)a4;
- (BOOL)_needsSigningPCS;
- (BOOL)_prepareAsset:(id)a3 recordKey:(id)a4 mergeableDeltaID:(id)a5 record:(id)a6 error:(id *)a7;
- (BOOL)_useZoneishPCS;
- (BOOL)_wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 forField:(id)a5 recordID:(id)a6;
- (BOOL)_wrapEncryptedDataForRecordValueStore:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4;
- (BOOL)_wrapEncryptedDataOnRecord:(id)a3;
- (BOOL)didAttemptZoneWideShareKeyRoll;
- (BOOL)didRollRecordPCSMasterKey;
- (BOOL)isDelete;
- (BOOL)isShare;
- (BOOL)needsRefetch;
- (BOOL)saveCompletionBlockCalled;
- (CKDModifyRecordsOperation)operation;
- (CKDPCSCache)pcsCache;
- (CKDPCSManager)pcsManager;
- (CKDProgressTracker)progressTracker;
- (CKDRecordPCSData)recordPCSData;
- (CKDSharePCSData)sharePCSData;
- (CKDZonePCSData)sharedZonePCSData;
- (CKRecord)record;
- (CKRecord)serverRecord;
- (CKRecordID)recordID;
- (NSDictionary)assetUUIDToExpectedProperties;
- (NSError)error;
- (NSMutableDictionary)rereferencedAssetArrayByFieldname;
- (NSString)etag;
- (OS_dispatch_group)pcsGroup;
- (id)_addParentPCS:(id)a3 toRecordPCS:(id)a4;
- (id)_initCommonWithOperation:(id)a3;
- (id)_initForDeleteWithRecordID:(id)a3 operation:(id)a4;
- (id)_initWithRecord:(id)a3 operation:(id)a4;
- (id)assetsWhichNeedRecordFetch;
- (id)description;
- (id)prepareAssetsForUploadWithError:(id *)a3;
- (id)sideEffectRecordIDs;
- (int)saveAttempts;
- (int64_t)batchRank;
- (unint64_t)state;
- (void)_addShareToPCSData:(id)a3 withError:(id)a4;
- (void)_clearRecordProtectionDataForRecord;
- (void)_continueCreateAndSavePCSWithZonePCS:(id)a3 sharePCS:(id)a4;
- (void)_createAndSavePCS;
- (void)_fetchExistingPCSForProvidedPCSData:(id)a3;
- (void)_fetchPCSData;
- (void)_fetchParentPCSForData:(id)a3 withError:(id)a4;
- (void)_fetchParentPCSForID:(id)a3 withCompletionHandler:(id)a4;
- (void)_fetchSharePCSForID:(id)a3 withCompletionHandler:(id)a4;
- (void)_fetchSigningPCSForRecordToDelete;
- (void)_handlePCSData:(id)a3 withError:(id)a4;
- (void)_keyRollIfNeededForRecordPCSData:(id)a3 withError:(id)a4;
- (void)_loadPCSData;
- (void)_pretendToWrapEncryptedDataForRecordValueStore:(id)a3;
- (void)_reallyAddShareToPCSData:(id)a3 withError:(id)a4;
- (void)_reallyFetchPCSDataWithOptions:(unint64_t)a3;
- (void)_setSigningPCSIdentity:(id)a3;
- (void)_unwrapRecordPCSForParent;
- (void)_unwrapRecordPCSForZone;
- (void)_unwrapRecordPCSWithShareID:(id)a3;
- (void)fetchRecordPCSData;
- (void)fetchSharePCSData;
- (void)noteSideEffectRecordPendingDelete:(id)a3;
- (void)prepareForSaveWithCompletionHandler:(id)a3;
- (void)prepareStreamingAsset:(id)a3 forUploadWithRecord:(id)a4;
- (void)savePCSDataToCache;
- (void)setAssetUUIDToExpectedProperties:(id)a3;
- (void)setBatchRank:(int64_t)a3;
- (void)setDidAttemptZoneWideShareKeyRoll:(BOOL)a3;
- (void)setDidRollRecordPCSMasterKey:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setEtag:(id)a3;
- (void)setIsDelete:(BOOL)a3;
- (void)setNeedsRefetch:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)setPcsGroup:(id)a3;
- (void)setProgressTracker:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordPCSData:(id)a3;
- (void)setRereferencedAssetArrayByFieldname:(id)a3;
- (void)setSaveAttempts:(int)a3;
- (void)setSaveCompletionBlockCalled:(BOOL)a3;
- (void)setServerRecord:(id)a3;
- (void)setSharePCSData:(id)a3;
- (void)setSharedZonePCSData:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CKDModifyRecordHandler

- (id)_initCommonWithOperation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDModifyRecordHandler;
  v5 = [(CKDModifyRecordHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_operation, v4);
    dispatch_group_t v7 = dispatch_group_create();
    pcsGroup = v6->_pcsGroup;
    v6->_pcsGroup = (OS_dispatch_group *)v7;

    v6->_saveCompletionBlockCalled = 0;
  }

  return v6;
}

- (id)_initWithRecord:(id)a3 operation:(id)a4
{
  id v7 = a3;
  uint64_t inited = objc_msgSend__initCommonWithOperation_(self, v8, (uint64_t)a4);
  uint64_t v10 = inited;
  if (inited)
  {
    objc_storeStrong((id *)(inited + 32), a3);
    *(unsigned char *)(v10 + 8) = 0;
    *(void *)(v10 + 88) = 0;
  }

  return (id)v10;
}

- (id)_initForDeleteWithRecordID:(id)a3 operation:(id)a4
{
  id v7 = a3;
  uint64_t inited = objc_msgSend__initCommonWithOperation_(self, v8, (uint64_t)a4);
  uint64_t v10 = inited;
  if (inited)
  {
    objc_storeStrong((id *)(inited + 40), a3);
    *(unsigned char *)(v10 + 8) = 1;
    int v13 = objc_msgSend__needsSigningPCS((void *)v10, v11, v12);
    uint64_t v14 = 5;
    if (v13) {
      uint64_t v14 = 2;
    }
    *(void *)(v10 + 88) = v14;
  }

  return (id)v10;
}

+ (id)modifyHandlerWithRecord:(id)a3 operation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend__initWithRecord_operation_(v7, v8, (uint64_t)v6, v5);

  return v9;
}

+ (id)modifyHandlerForDeleteWithRecordID:(id)a3 operation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v9 = objc_msgSend__initForDeleteWithRecordID_operation_(v7, v8, (uint64_t)v6, v5);

  return v9;
}

- (CKRecordID)recordID
{
  recordID = self->_recordID;
  if (recordID)
  {
    id v4 = recordID;
  }
  else
  {
    id v5 = objc_msgSend_record(self, a2, v2);
    objc_msgSend_recordID(v5, v6, v7);
    id v4 = (CKRecordID *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)etag
{
  etag = self->_etag;
  if (etag)
  {
    id v4 = etag;
  }
  else
  {
    id v5 = objc_msgSend_record(self, a2, v2);
    objc_msgSend_etag(v5, v6, v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isShare
{
  return 0;
}

- (CKDPCSManager)pcsManager
{
  v3 = objc_msgSend_operation(self, a2, v2);
  id v6 = objc_msgSend_container(v3, v4, v5);
  v9 = objc_msgSend_pcsManager(v6, v7, v8);

  return (CKDPCSManager *)v9;
}

- (CKDPCSCache)pcsCache
{
  v3 = objc_msgSend_operation(self, a2, v2);
  id v6 = objc_msgSend_container(v3, v4, v5);
  v9 = objc_msgSend_pcsCache(v6, v7, v8);

  return (CKDPCSCache *)v9;
}

+ (id)_stringForState:(unint64_t)a3
{
  if (a3 > 0xE) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E64F5368 + a3);
  }
}

- (id)description
{
  int isShare = objc_msgSend_isShare(self, a2, v2);
  int v7 = objc_msgSend_isDelete(self, v5, v6);
  uint64_t v8 = @"Share";
  if (v7)
  {
    uint64_t v8 = @"ShareID";
    v9 = @"RecordID";
  }
  else
  {
    v9 = @"Record";
  }
  if (isShare) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  int v13 = NSStringFromClass(v12);
  v16 = objc_msgSend_recordID(self, v14, v15);
  if (objc_msgSend_isDelete(self, v17, v18)) {
    v21 = @" (isDelete)";
  }
  else {
    v21 = &stru_1F2044F30;
  }
  uint64_t v22 = objc_msgSend_state(self, v19, v20);
  v24 = objc_msgSend__stringForState_(CKDModifyRecordHandler, v23, v22);
  v26 = objc_msgSend_stringWithFormat_(v11, v25, @"<%@ %p> (%@: %@ %@%@)", v13, self, v10, v16, v21, v24);

  return v26;
}

- (id)sideEffectRecordIDs
{
  if (objc_msgSend_state(self, a2, v2))
  {
    v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 184, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyRecordHandler sideEffectRecordIDs]", self, "CKDModifyRecordHandlerStateNeedRecordSideEffects");
  }
  int v7 = objc_msgSend_record(self, v5, v6);
  uint64_t v10 = objc_msgSend_share(v7, v8, v9);

  if (v10)
  {
    int v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_msgSend_record(self, v11, v12);
    v17 = objc_msgSend_share(v14, v15, v16);
    uint64_t v20 = objc_msgSend_recordID(v17, v18, v19);
    uint64_t v22 = objc_msgSend_setWithObject_(v13, v21, (uint64_t)v20);
  }
  else
  {
    uint64_t v22 = 0;
  }
  return v22;
}

- (void)noteSideEffectRecordPendingDelete:(id)a3
{
  id v4 = a3;
  int v7 = objc_msgSend_record(self, v5, v6);
  uint64_t v10 = objc_msgSend_share(v7, v8, v9);
  int v13 = objc_msgSend_recordID(v10, v11, v12);
  int isEqual = objc_msgSend_isEqual_(v13, v14, (uint64_t)v4);

  if (isEqual)
  {
    objc_msgSend_record(self, v16, v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShare_(v19, v18, 0);
  }
}

- (BOOL)_needsSigningPCS
{
  v3 = objc_msgSend_operation(self, a2, v2);
  uint64_t v6 = objc_msgSend_container(v3, v4, v5);
  uint64_t v9 = objc_msgSend_options(v6, v7, v8);
  if (objc_msgSend_useAnonymousToServerShareParticipants(v9, v10, v11)) {
    BOOL v14 = objc_msgSend_databaseScope(v3, v12, v13) == 3;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)fetchRecordPCSData
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, v2) != 2)
  {
    v76 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 211, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyRecordHandler fetchRecordPCSData]", self, "CKDModifyRecordHandlerStateNeedRecordPCSData");
  }
  if (!objc_msgSend_isDelete(self, v5, v6))
  {
    uint64_t v9 = objc_msgSend_record(self, v7, v8);
    BOOL v14 = objc_msgSend_operation(self, v10, v11);
    if (!v9)
    {
      v78 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v78, v79, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 221, @"Lost a record: %@", self);
    }
    if (objc_msgSend_savePolicy(v14, v12, v13) == 2) {
      char hasPropertiesRequiringEncryption = objc_msgSend_hasPropertiesRequiringEncryption(v9, v15, v16);
    }
    else {
      char hasPropertiesRequiringEncryption = objc_msgSend_hasModifiedPropertiesRequiringEncryption(v9, v15, v16);
    }
    char v20 = hasPropertiesRequiringEncryption;
    v21 = objc_msgSend_share(v9, v18, v19);
    if (v21) {
      goto LABEL_20;
    }
    if (objc_msgSend_hasUpdatedParent(v9, v22, v23)) {
      goto LABEL_14;
    }
    v26 = objc_msgSend_parentsByRecordID(v14, v24, v25);
    v29 = objc_msgSend_recordID(self, v27, v28);
    v31 = objc_msgSend_objectForKeyedSubscript_(v26, v30, (uint64_t)v29);

    if (v31) {
      char v34 = 1;
    }
    else {
      char v34 = v20;
    }
    if ((v34 & 1) == 0)
    {
      v21 = objc_msgSend_protectionData(v9, v32, v33);
      if (v21) {
        goto LABEL_20;
      }
      if ((objc_msgSend_wantsChainPCS(v9, v35, v36) & 1) != 0
        || (objc_msgSend_wantsPublicSharingKey(v9, v54, v55) & 1) != 0
        || (objc_msgSend__needsSigningPCS(self, v56, v57) & 1) != 0)
      {
LABEL_14:
        v21 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v60 = objc_msgSend_container(v14, v58, v59);
      v63 = objc_msgSend_options(v60, v61, v62);
      if ((objc_msgSend_acceptServerSignedRecords(v63, v64, v65) & 1) == 0)
      {

LABEL_40:
        v74 = objc_msgSend_pcsGroup(self, v32, v69);
        dispatch_group_leave(v74);

        objc_msgSend_setState_(self, v75, 3);
LABEL_32:

        return;
      }
      char v68 = objc_msgSend_needsRollAndCounterSign(v9, v66, v67);

      if ((v68 & 1) == 0) {
        goto LABEL_40;
      }
    }
LABEL_21:
    objc_msgSend_setRecordPCS_(v9, v32, 0);
    v39 = objc_msgSend_stateTransitionGroup(v14, v37, v38);
    dispatch_group_enter(v39);

    v42 = objc_msgSend_protectionData(v9, v40, v41);

    v43 = (void *)*MEMORY[0x1E4F1A548];
    if (v42)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v43);
      }
      v44 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        v47 = v44;
        v50 = objc_msgSend_recordID(v9, v48, v49);
        *(_DWORD *)buf = 138412290;
        v81 = v50;
        _os_log_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_INFO, "Record %@ already has protection info", buf, 0xCu);
      }
      objc_msgSend__loadPCSData(self, v45, v46);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v43);
      }
      v51 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        v70 = v51;
        v73 = objc_msgSend_recordID(v9, v71, v72);
        *(_DWORD *)buf = 138412290;
        v81 = v73;
        _os_log_debug_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_DEBUG, "Fetching protection info for record %@", buf, 0xCu);
      }
      objc_msgSend__fetchPCSData(self, v52, v53);
    }
    goto LABEL_32;
  }
  MEMORY[0x1F4181798](self, sel__fetchSigningPCSForRecordToDelete, v8);
}

- (void)_fetchSigningPCSForRecordToDelete
{
  if ((objc_msgSend__needsSigningPCS(self, a2, v2) & 1) == 0)
  {
    uint64_t v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 255, @"Fetching signing PCS for records to delete when not needed");
  }
  int v7 = objc_msgSend_operation(self, v5, v6);
  uint64_t v10 = objc_msgSend_recordID(self, v8, v9);
  uint64_t v13 = objc_msgSend_container(v7, v11, v12);
  uint64_t v16 = objc_msgSend_options(v13, v14, v15);
  int v19 = objc_msgSend_useZoneWidePCS(v16, v17, v18);

  v56[0] = 0;
  v56[1] = v56;
  if (v19) {
    uint64_t v20 = 24;
  }
  else {
    uint64_t v20 = 16;
  }
  v56[2] = 0x2020000000;
  v56[3] = 0;
  v21 = dispatch_group_create();
  v24 = objc_msgSend_stateTransitionGroup(v7, v22, v23);
  dispatch_group_enter(v24);

  objc_initWeak(&location, self);
  dispatch_group_enter(v21);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v25 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEBUG, "Beginning signing PCS fetch. Fetching zone PCS and checking if there is a share PCS on it", buf, 2u);
  }
  uint64_t v28 = objc_msgSend_pcsCache(self, v26, v27);
  v31 = objc_msgSend_zoneID(v10, v29, v30);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = sub_1C4ED3C08;
  v48[3] = &unk_1E64F5168;
  objc_copyWeak(v53, &location);
  v32 = v21;
  uint64_t v49 = v32;
  id v33 = v10;
  id v50 = v33;
  v52 = v56;
  id v34 = v7;
  id v51 = v34;
  v53[1] = (id)v20;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v28, v35, (uint64_t)v31, v34, v20, v48);

  uint64_t v38 = objc_msgSend_modifyRecordsQueue(v34, v36, v37);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1C4ED3FD4;
  v43[3] = &unk_1E64F5190;
  id v44 = v33;
  v45 = self;
  id v46 = v34;
  v47 = v56;
  id v39 = v34;
  id v40 = v33;
  dispatch_group_notify(v32, v38, v43);

  objc_destroyWeak(v53);
  objc_destroyWeak(&location);

  _Block_object_dispose(v56, 8);
}

- (void)_setSigningPCSIdentity:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((objc_msgSend__needsSigningPCS(self, v6, v7) & 1) == 0)
  {
    uint64_t v82 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v82, v83, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 312, @"Unexpectedly setting signing PCS");
  }
  uint64_t v10 = objc_msgSend_record(self, v8, v9);
  if (objc_msgSend_signingPCSIdentity(v10, v11, v12)) {
    goto LABEL_4;
  }
  uint64_t v15 = objc_msgSend_share(v10, v13, v14);
  uint64_t v16 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v17 = (os_log_t *)MEMORY[0x1E4F1A528];
  if (v15)
  {

LABEL_8:
    uint64_t v22 = objc_msgSend_share(v10, v18, v19);
    if (v22)
    {
      uint64_t v23 = objc_msgSend_share(v10, v20, v21);
      v26 = objc_msgSend_recordID(v23, v24, v25);
    }
    else
    {
      v26 = objc_msgSend_recordID(v10, v20, v21);
    }

    if (*v16 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v27 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
    {
      v64 = v27;
      uint64_t v67 = objc_msgSend_recordID(v10, v65, v66);
      int v84 = 138412546;
      uint64_t v85 = (uint64_t)v67;
      __int16 v86 = 2112;
      v87 = v26;
      _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "Setting signing PCS for record %@ to be the current user's per participant PCS in share: %@", (uint8_t *)&v84, 0x16u);
    }
    uint64_t v30 = v5;
LABEL_16:
    v31 = objc_msgSend_sharePCSData(v30, v28, v29);
    uint64_t v34 = objc_msgSend_myParticipantPCS(v31, v32, v33);

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  id v46 = objc_msgSend_zonePCSData(v5, v18, v19);
  uint64_t v49 = objc_msgSend_sharePCSData(v46, v47, v48);

  if (v49)
  {
    if (*v16 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v52 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
    {
      char v68 = v52;
      v71 = objc_msgSend_recordID(v10, v69, v70);
      int v84 = 138412290;
      uint64_t v85 = (uint64_t)v71;
      _os_log_debug_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_DEBUG, "Setting signing PCS for record %@ to be current user's per participant PCS of zone share", (uint8_t *)&v84, 0xCu);
    }
    uint64_t v30 = objc_msgSend_zonePCSData(v5, v53, v54);
    v26 = v30;
    goto LABEL_16;
  }
  uint64_t v55 = objc_msgSend_parent(v10, v50, v51);

  if (!v55) {
    goto LABEL_36;
  }
  if (*v16 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v56 = *v17;
  if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v72 = v56;
    v75 = objc_msgSend_recordID(v10, v73, v74);
    v78 = objc_msgSend_parent(v10, v76, v77);
    v81 = objc_msgSend_recordID(v78, v79, v80);
    int v84 = 138412546;
    uint64_t v85 = (uint64_t)v75;
    __int16 v86 = 2112;
    v87 = v81;
    _os_log_debug_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_DEBUG, "Setting signing PCS for record %@ to be that of parent: %@", (uint8_t *)&v84, 0x16u);
  }
  v26 = objc_msgSend_parentPCSData(v5, v57, v58);
  uint64_t v34 = objc_msgSend_signingPCS(v26, v59, v60);
LABEL_17:

  if (!v34)
  {
LABEL_36:
    if (*v16 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v61 = *v17;
    if (!os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    id v39 = v61;
    v42 = objc_msgSend_recordID(self, v62, v63);
    int v84 = 138412290;
    uint64_t v85 = (uint64_t)v42;
    v43 = "Couldn't fetch signing PCS to create a signature for record %@";
    id v44 = v39;
    uint32_t v45 = 12;
LABEL_40:
    _os_log_error_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_ERROR, v43, (uint8_t *)&v84, v45);

    goto LABEL_4;
  }
  uint64_t v35 = PCSFPCopyCurrentPrivateKey();
  if (v35)
  {
    uint64_t v37 = (const void *)v35;
    objc_msgSend_setSigningPCSIdentity_(v10, v36, v35);
    CFRelease(v37);
    goto LABEL_4;
  }
  if (*v16 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v38 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    id v39 = v38;
    v42 = objc_msgSend_recordID(self, v40, v41);
    int v84 = 138412546;
    uint64_t v85 = v34;
    __int16 v86 = 2112;
    v87 = v42;
    v43 = "Couldn't get a private identity from the signing PCS %@ for record %@";
    id v44 = v39;
    uint32_t v45 = 22;
    goto LABEL_40;
  }
LABEL_4:
}

- (BOOL)_canSetPreviousProtectionEtag
{
  v3 = objc_msgSend_operation(self, a2, v2);
  char canSetPreviousProtectionEtag = objc_msgSend_canSetPreviousProtectionEtag(v3, v4, v5);

  return canSetPreviousProtectionEtag;
}

- (BOOL)_createPublicSharingKeyWithError:(id *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_record(self, a2, (uint64_t)a3);
  uint64_t v6 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v59 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F1A528];
  uint64_t v8 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v8;
    uint64_t v14 = objc_msgSend_recordID(v5, v12, v13);
    *(_DWORD *)buf = 138412290;
    id v63 = v14;
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Creating a new random sharing identity for record %@", buf, 0xCu);
  }
  uint64_t v15 = objc_msgSend_pcsManager(self, v9, v10);
  id v61 = 0;
  RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(v15, v16, (uint64_t)&v61);
  id v18 = v61;

  if (v18)
  {
    if (*v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v19 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v54 = v19;
      uint64_t v57 = objc_msgSend_recordID(v5, v55, v56);
      *(_DWORD *)buf = 138412546;
      id v63 = v57;
      __int16 v64 = 2112;
      id v65 = v18;
      _os_log_error_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_ERROR, "Couldn't create a new sharing identity for record %@: %@", buf, 0x16u);
    }
  }
  v60[1] = 0;
  uint64_t v20 = (void *)PCSIdentityCopyExternalForm();
  if (v20)
  {
    if (*v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = v21;
      uint64_t v25 = objc_msgSend_recordID(v5, v23, v24);
      PublicKey = (void *)PCSIdentityGetPublicKey();
      os_log_t v27 = (objc_class *)NSString;
      id v58 = PublicKey;
      id v28 = [v27 alloc];
      uint64_t v30 = objc_msgSend_initWithData_encoding_(v28, v29, (uint64_t)v20, 4);
      *(_DWORD *)buf = 138412802;
      id v63 = v25;
      __int16 v64 = 2112;
      id v65 = PublicKey;
      __int16 v66 = 2112;
      uint64_t v67 = v30;
      _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Using identity for public PCS on record %@: %@: %@", buf, 0x20u);
    }
  }
  id v31 = objc_alloc(MEMORY[0x1E4F19FA0]);
  uint64_t v34 = objc_msgSend_pcsManager(self, v32, v33);
  v60[0] = 0;
  uint64_t v36 = objc_msgSend_dataFromSharingIdentity_error_(v34, v35, (uint64_t)RandomSharingIdentityWithError, v60);
  id v37 = v60[0];
  id v39 = objc_msgSend_initWithData_(v31, v38, (uint64_t)v36);
  objc_msgSend_setMutableEncryptedPSK_(v5, v40, (uint64_t)v39);

  if (v37)
  {
    if (*v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v41 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v37;
      _os_log_error_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_ERROR, "Couldn't create data from our public sharing identity: %@", buf, 0xCu);
    }
    if (v59)
    {
      id v44 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v45 = *MEMORY[0x1E4F19DD8];
      id v46 = objc_msgSend_recordID(self, v42, v43);
      objc_msgSend_errorWithDomain_code_format_(v44, v47, v45, 5005, @"Couldn't create public sharing identity for record %@", v46);
      *uint64_t v59 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*v6 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v48 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = v48;
      os_log_t v52 = objc_msgSend_recordID(self, v50, v51);
      *(_DWORD *)buf = 138412546;
      id v63 = v52;
      __int16 v64 = 2112;
      id v65 = v37;
      _os_log_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_INFO, "Couldn't create a public sharing identity for record %@: %@", buf, 0x16u);
    }
  }
  if (RandomSharingIdentityWithError) {
    CFRelease(RandomSharingIdentityWithError);
  }

  return v37 == 0;
}

- (void)_loadPCSData
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_pcsManager(self, a2, v2);
  uint64_t v10 = objc_msgSend_operation(self, v6, v7);
  if (!v5)
  {
    uint64_t v59 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    uint64_t v62 = objc_msgSend_container(v10, v60, v61);
    id v65 = objc_msgSend_pcsManager(self, v63, v64);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v66, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 391, @"Need a PCS Manager (%@, %@, %@)", self, v62, v65);
  }
  if ((objc_msgSend__useZoneishPCS(self, v8, v9) & 1) != 0 || objc_msgSend_databaseScope(v10, v11, v12) == 2)
  {
    objc_msgSend__unwrapRecordPCSForZone(self, v11, v12);
    goto LABEL_6;
  }
  if (objc_msgSend_databaseScope(v10, v11, v12) == 3)
  {
    uint64_t v15 = objc_msgSend_record(self, v13, v14);
    id v18 = objc_msgSend_share(v15, v16, v17);

    if (v18)
    {
      os_log_t v19 = objc_msgSend_record(self, v13, v14);
      uint64_t v22 = objc_msgSend_share(v19, v20, v21);
      uint64_t v25 = objc_msgSend_recordID(v22, v23, v24);
      objc_msgSend__unwrapRecordPCSWithShareID_(self, v26, (uint64_t)v25);

LABEL_15:
      goto LABEL_6;
    }
  }
  if (objc_msgSend_databaseScope(v10, v13, v14) == 3)
  {
    uint64_t v29 = objc_msgSend_record(self, v27, v28);
    v32 = objc_msgSend_parent(v29, v30, v31);

    if (v32)
    {
      objc_msgSend__unwrapRecordPCSForParent(self, v27, v28);
      goto LABEL_6;
    }
  }
  uint64_t v33 = objc_msgSend_record(self, v27, v28);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    os_log_t v19 = objc_msgSend_record(self, v35, v36);
    uint64_t v22 = objc_msgSend_recordID(v19, v37, v38);
    objc_msgSend__unwrapRecordPCSWithShareID_(self, v39, (uint64_t)v22);
    goto LABEL_15;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v40 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v43 = v40;
    id v46 = objc_msgSend_record(self, v44, v45);
    uint64_t v49 = objc_msgSend_recordID(v46, v47, v48);
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = v49;
    _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "Warn: Record %@ isn't in the private database, doesn't have a share or parent set and isn't a share", buf, 0xCu);
  }
  id v50 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v51 = *MEMORY[0x1E4F19DD8];
  os_log_t v52 = objc_msgSend_record(self, v41, v42);
  uint64_t v55 = objc_msgSend_recordID(v52, v53, v54);
  uint64_t v57 = objc_msgSend_errorWithDomain_code_format_(v50, v56, v51, 5001, @"Record %@ isn't in the private database, doesn't have a share or parent set and isn't a share", v55);
  objc_msgSend__addShareToPCSData_withError_(self, v58, 0, v57);

LABEL_6:
}

- (void)_reallyFetchPCSDataWithOptions:(unint64_t)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_record(self, a2, a3);
  objc_initWeak(&location, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend_isZoneWideShare(v5, v6, v7)
    && objc_msgSend__useZoneishPCS(self, v6, v7)
    && (objc_msgSend_sharePCSData(self, v6, v7), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_msgSend_sharedZonePCSData(self, v6, v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = v9 == 0,
        v9,
        v8,
        !v10))
  {
    uint64_t v11 = objc_msgSend_sharedZonePCSData(self, v6, v7);
    uint64_t v14 = objc_msgSend_zoneishPublicKeyID(v11, v12, v13);
    objc_msgSend_setZoneishKeyID_(v5, v15, (uint64_t)v14);

    uint64_t v17 = objc_msgSend_dataWithRecord_(CKDRecordPCSData, v16, (uint64_t)v5);
    uint64_t v20 = objc_msgSend_sharedZonePCSData(self, v18, v19);
    uint64_t v23 = objc_msgSend_zoneishPCS(v20, v21, v22);
    objc_msgSend_setPcs_(v17, v24, v23);

    os_log_t v27 = objc_msgSend_sharedZonePCSData(self, v25, v26);
    objc_msgSend_setZonePCSData_(v17, v28, (uint64_t)v27);

    uint64_t v31 = objc_msgSend_sharePCSData(self, v29, v30);
    objc_msgSend_setSharePCSData_(v17, v32, (uint64_t)v31);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v33 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = objc_msgSend_recordID(v5, v34, v35);
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = v48;
      _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "Using prepared share pcs and shared zone pcs data for share %@", buf, 0xCu);
    }
    objc_msgSend__addShareToPCSData_withError_(self, v36, (uint64_t)v17, 0);
  }
  else
  {
    if (objc_msgSend__needsSigningPCS(self, v6, v7)) {
      id v39 = (void *)(a3 | 0x10);
    }
    else {
      id v39 = (void *)a3;
    }
    id v40 = objc_msgSend_pcsCache(self, v37, v38);
    uint64_t v43 = objc_msgSend_recordID(v5, v41, v42);
    id v46 = objc_msgSend_operation(self, v44, v45);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1C4ED53E8;
    v49[3] = &unk_1E64F51B8;
    objc_copyWeak(v51, &location);
    v51[1] = v39;
    id v50 = v5;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v40, v47, (uint64_t)v43, v46, v39, v49);

    objc_destroyWeak(v51);
  }
  objc_destroyWeak(&location);
}

- (void)_fetchPCSData
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = v3;
    id v37 = objc_msgSend_record(self, v35, v36);
    id v40 = objc_msgSend_recordID(v37, v38, v39);
    int v41 = 138412290;
    uint64_t v42 = v40;
    _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "Getting ready to fetch PCS Data for record %@", (uint8_t *)&v41, 0xCu);
  }
  uint64_t v6 = objc_msgSend_operation(self, v4, v5);
  uint64_t v9 = objc_msgSend_etag(self, v7, v8);
  if (objc_msgSend_length(v9, v10, v11)) {
    goto LABEL_6;
  }
  uint64_t v16 = objc_msgSend_record(self, v12, v13);
  char isKnownToServer = objc_msgSend_isKnownToServer(v16, v17, v18);

  if (isKnownToServer & 1) != 0 || (objc_msgSend_alwaysFetchPCSFromServer(v6, v14, v15)) {
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend_record(self, v14, v15);
  if (objc_msgSend_wantsPublicSharingKey(v9, v29, v30))
  {
LABEL_6:

LABEL_9:
    uint64_t v20 = 0;
    goto LABEL_10;
  }
  BOOL v33 = objc_msgSend_saveAttempts(self, v31, v32) == 0;

  uint64_t v20 = 2 * v33;
LABEL_10:
  uint64_t v21 = objc_msgSend_container(v6, v14, v15);
  uint64_t v24 = objc_msgSend_options(v21, v22, v23);
  int v27 = objc_msgSend_useZoneWidePCS(v24, v25, v26);

  if (v27) {
    objc_msgSend__reallyFetchPCSDataWithOptions_(self, v28, v20 | 8);
  }
  else {
    objc_msgSend__reallyFetchPCSDataWithOptions_(self, v28, v20);
  }
}

- (void)_fetchParentPCSForID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = objc_msgSend_operation(self, v8, v9);
  uint64_t v13 = objc_msgSend_parentsByRecordID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v6);

  if (v15)
  {
    uint64_t v18 = objc_msgSend_pcsGroup(v15, v16, v17);
    uint64_t v21 = objc_msgSend_modifyRecordsQueue(v10, v19, v20);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4ED5B74;
    block[3] = &unk_1E64F1B98;
    uint64_t v22 = &v33;
    id v33 = v15;
    id v34 = v6;
    uint64_t v35 = self;
    id v36 = v7;
    id v23 = v7;
    dispatch_group_notify(v18, v21, block);

    uint64_t v24 = v34;
  }
  else
  {
    if (objc_msgSend__needsSigningPCS(self, v16, v17)) {
      uint64_t v27 = 20;
    }
    else {
      uint64_t v27 = 4;
    }
    uint64_t v24 = objc_msgSend_pcsCache(self, v25, v26);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1C4ED5DB8;
    v30[3] = &unk_1E64F4C00;
    uint64_t v22 = &v31;
    id v31 = v7;
    id v28 = v7;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v24, v29, (uint64_t)v6, v10, v27, v30);
  }
}

- (void)_fetchSharePCSForID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BOOL v10 = objc_msgSend_operation(self, v8, v9);
  uint64_t v13 = objc_msgSend_handlersByRecordID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v6);

  uint64_t v18 = objc_msgSend_sharePCSData(self, v16, v17);

  if (!v18)
  {
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v31 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v32 = *MEMORY[0x1E4F19DD8];
        uint64_t v21 = objc_msgSend_recordID(self, v22, v23);
        id v34 = objc_msgSend_errorWithDomain_code_format_(v31, v33, v32, 1017, @"Record %@ refers to share %@ but that item is a record, not a share", v21, v6);
        v7[2](v7, 0, v34);

        goto LABEL_3;
      }
      uint64_t v24 = objc_msgSend_pcsGroup(v15, v22, v23);
      uint64_t v27 = objc_msgSend_modifyRecordsQueue(v10, v25, v26);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4ED606C;
      block[3] = &unk_1E64F1B98;
      id v40 = v15;
      id v41 = v6;
      uint64_t v42 = self;
      uint64_t v43 = v7;
      dispatch_group_notify(v24, v27, block);

      id v28 = v40;
    }
    else
    {
      uint64_t v29 = objc_msgSend_pcsCache(self, v19, v20);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = sub_1C4ED615C;
      v35[3] = &unk_1E64F2F68;
      id v36 = v6;
      id v37 = self;
      uint64_t v38 = v7;
      objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v29, v30, (uint64_t)v36, v10, 0, v35);

      id v28 = v36;
    }

    goto LABEL_9;
  }
  uint64_t v21 = objc_msgSend_sharePCSData(self, v19, v20);
  ((void (**)(id, void *, void *))v7)[2](v7, v21, 0);
LABEL_3:

LABEL_9:
}

- (void)_addShareToPCSData:(id)a3 withError:(id)a4
{
}

- (void)_keyRollIfNeededForRecordPCSData:(id)a3 withError:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = objc_msgSend_operation(self, v8, v9);
  uint64_t v13 = objc_msgSend_record(self, v11, v12);
  id v16 = v7;
  uint64_t v17 = v16;
  if (v16) {
    goto LABEL_2;
  }
  if (!objc_msgSend_pcs(v6, v14, v15)) {
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend_isZoneWideShare(v13, v24, v25)
    && objc_msgSend_didAttemptZoneWideShareKeyRoll(self, v26, v27)
    && (objc_msgSend__useZoneishPCS(self, v28, v29) & 1) == 0
    && objc_msgSend_databaseScope(v10, v30, v31) == 2)
  {
    uint64_t v34 = objc_msgSend_sharePCSData(self, v32, v33);
    if (v34
      && (id v37 = (void *)v34,
          objc_msgSend_sharedZonePCSData(self, v35, v36),
          uint64_t v38 = objc_claimAutoreleasedReturnValue(),
          v38,
          v37,
          v38))
    {
      id v41 = objc_msgSend_pcsManager(self, v39, v40);
      id v44 = objc_msgSend_sharedZonePCSData(self, v42, v43);
      v47 = objc_msgSend_sharePCSData(self, v45, v46);
      uint64_t v17 = objc_msgSend_keyRollForZoneWideShareRecordPCS_sharedZonePCS_sharePCS_forOperation_(v41, v48, (uint64_t)v6, v44, v47, v10);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v75 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v82 = v75;
        uint64_t v85 = objc_msgSend_recordID(v13, v83, v84);
        uint64_t v88 = objc_msgSend_sharedZonePCSData(self, v86, v87);
        v91 = objc_msgSend_sharePCSData(self, v89, v90);
        *(_DWORD *)buf = 138412802;
        v93 = v85;
        __int16 v94 = 2112;
        v95 = v88;
        __int16 v96 = 2112;
        v97 = v91;
        _os_log_error_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_ERROR, "Failed to get share or zone PCS data to roll record PCS for zone-wide share record %@, shared zone PCS: %@, share PCS: %@", buf, 0x20u);
      }
      v78 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v79 = *MEMORY[0x1E4F19DD8];
      uint64_t v80 = objc_msgSend_recordID(self, v76, v77);
      uint64_t v17 = objc_msgSend_errorWithDomain_code_format_(v78, v81, v79, 5001, @"Didn't get dependent PCS data to roll record PCS for %@", v80);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (objc_msgSend__useZoneishPCS(self, v49, v50) & 1) == 0
    && objc_msgSend_databaseScope(v10, v51, v52) == 2)
  {
    buf[0] = 0;
    uint64_t v55 = objc_msgSend_container(v10, v53, v54);
    id v58 = objc_msgSend_options(v55, v56, v57);
    uint64_t v63 = 0;
    if (objc_msgSend_acceptServerSignedRecords(v58, v59, v60)) {
      uint64_t v63 = objc_msgSend_needsRollAndCounterSign(v13, v61, v62);
    }

    __int16 v66 = objc_msgSend_pcsManager(self, v64, v65);
    uint64_t v68 = objc_msgSend_keyRollIfNeededForPerRecordPCS_needsRollAndCounterSign_forOperation_didRoll_(v66, v67, (uint64_t)v6, v63, v10, buf);

    if (buf[0]) {
      objc_msgSend_setRequiresRecordSaveForMergeableDeltas_(v13, v69, 1);
    }
    uint64_t v17 = (void *)v68;
  }
  if (v17)
  {
LABEL_2:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = v18;
      uint64_t v23 = objc_msgSend_recordID(self, v21, v22);
      *(_DWORD *)buf = 138412546;
      v93 = v23;
      __int16 v94 = 2112;
      v95 = v17;
      _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Error key-rolling for record %@: %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_25:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v70 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v71 = v70;
      uint64_t v74 = objc_msgSend_recordID(self, v72, v73);
      *(_DWORD *)buf = 138412290;
      v93 = v74;
      _os_log_debug_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_DEBUG, "Successfully checked key-rolling requirements for record %@. May have rolled keys as well.", buf, 0xCu);
    }
    uint64_t v17 = 0;
  }
  objc_msgSend__reallyAddShareToPCSData_withError_(self, v19, (uint64_t)v6, v17);
}

- (void)_reallyAddShareToPCSData:(id)a3 withError:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = objc_msgSend_record(self, v8, v9);
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_1C4ED6E2C;
  v62[4] = sub_1C4ED6E3C;
  id v11 = v7;
  id v63 = v11;
  uint64_t v14 = dispatch_group_create();
  if (!v11 && objc_msgSend_pcs(v6, v12, v13))
  {
    if (objc_msgSend_hasUpdatedShare(v10, v12, v13))
    {
      uint64_t v17 = objc_msgSend_share(v10, v15, v16);
      uint64_t v20 = objc_msgSend_recordID(v17, v18, v19);

      uint64_t v23 = objc_msgSend_previousShare(v10, v21, v22);
      uint64_t v26 = objc_msgSend_recordID(v23, v24, v25);
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v20 = 0;
    }
    if (v20 | v26)
    {
      objc_initWeak(&location, self);
      uint64_t v27 = (void *)MEMORY[0x1E4F1A550];
      if (v20)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v28 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v42 = objc_msgSend_recordID(v10, v29, v30);
          *(_DWORD *)buf = 138412546;
          uint64_t v65 = v20;
          __int16 v66 = 2112;
          uint64_t v67 = v42;
          _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Adding share with ID %@ to record %@", buf, 0x16u);
        }
        dispatch_group_enter(v14);
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = sub_1C4ED6E44;
        v54[3] = &unk_1E64F51E0;
        objc_copyWeak(&v60, &location);
        id v55 = v6;
        uint64_t v59 = v62;
        id v56 = (id)v20;
        uint64_t v57 = self;
        id v58 = v14;
        objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v31, (uint64_t)v56, v54);

        objc_destroyWeak(&v60);
        uint64_t v27 = (void *)MEMORY[0x1E4F1A550];
      }
      if (v26)
      {
        if (*v27 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v32 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v43 = objc_msgSend_recordID(v10, v33, v34);
          *(_DWORD *)buf = 138412546;
          uint64_t v65 = v26;
          __int16 v66 = 2112;
          uint64_t v67 = v43;
          _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Removing share with ID %@ from record %@", buf, 0x16u);
        }
        dispatch_group_enter(v14);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = sub_1C4ED7158;
        v47[3] = &unk_1E64F51E0;
        objc_copyWeak(&v53, &location);
        id v48 = v6;
        uint64_t v52 = v62;
        id v49 = v10;
        id v50 = (id)v26;
        uint64_t v51 = v14;
        objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v35, (uint64_t)v50, v47);

        objc_destroyWeak(&v53);
        uint64_t v27 = (void *)MEMORY[0x1E4F1A550];
      }
      if (*v27 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v36 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Waiting on share fetches so we can update the record PCS", buf, 2u);
      }
      objc_destroyWeak(&location);
    }
  }
  id v37 = objc_msgSend_operation(self, v12, v13);
  uint64_t v40 = objc_msgSend_modifyRecordsQueue(v37, v38, v39);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1C4ED7500;
  v44[3] = &unk_1E64F30F0;
  id v45 = v6;
  uint64_t v46 = v62;
  v44[4] = self;
  id v41 = v6;
  dispatch_group_notify(v14, v40, v44);

  _Block_object_dispose(v62, 8);
}

- (void)_fetchParentPCSForData:(id)a3 withError:(id)a4
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v162 = 0;
  v163 = &v162;
  uint64_t v164 = 0x3032000000;
  v165 = sub_1C4ED6E2C;
  v166 = sub_1C4ED6E3C;
  id v8 = a4;
  id v167 = v8;
  uint64_t v9 = dispatch_group_create();
  uint64_t v14 = objc_msgSend_operation(self, v10, v11);
  if (!v8)
  {
    if (objc_msgSend_pcs(v7, v12, v13))
    {
      uint64_t v17 = objc_msgSend_record(self, v12, v13);
      int hasUpdatedParent = objc_msgSend_hasUpdatedParent(v17, v18, v19);

      if (hasUpdatedParent)
      {
        uint64_t v21 = objc_msgSend_record(self, v12, v13);
        uint64_t v24 = objc_msgSend_previousParent(v21, v22, v23);
        v142 = objc_msgSend_recordID(v24, v25, v26);

        if (!v142)
        {
          uint64_t v29 = objc_msgSend_parentID(v7, v27, v28);
          if (!v29) {
            goto LABEL_8;
          }
          v143 = objc_msgSend_parentID(v7, v27, v28);
          uint64_t v32 = objc_msgSend_record(self, v30, v31);
          uint64_t v35 = objc_msgSend_parent(v32, v33, v34);
          uint64_t v38 = objc_msgSend_recordID(v35, v36, v37);
          char groupa = objc_msgSend_isEqual_(v143, v39, (uint64_t)v38);

          if ((groupa & 1) == 0)
          {
            v142 = objc_msgSend_parentID(v7, v27, v28);
          }
          else
          {
LABEL_8:
            v142 = 0;
          }
        }
        uint64_t v40 = objc_msgSend_record(self, v27, v28);
        uint64_t v43 = objc_msgSend_parent(v40, v41, v42);
        uint64_t v46 = objc_msgSend_recordID(v43, v44, v45);
        int isEqual = objc_msgSend_isEqual_(v46, v47, (uint64_t)v142);

        if (isEqual)
        {
          v133 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v49, v50);
          v136 = objc_msgSend_recordID(self, v134, v135);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v133, v137, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 685, @"Got the same parent and previous parent on record %@", v136);
        }
        if (v142)
        {
          uint64_t v51 = objc_msgSend_record(self, v49, v50);
          uint64_t v54 = objc_msgSend_chainParentPublicKeyID(v51, v52, v53);

          if (!v54)
          {
            uint64_t v57 = objc_msgSend_parentID(v7, v55, v56);
            int v59 = objc_msgSend_isEqual_(v57, v58, (uint64_t)v142);

            if (v59)
            {
              uint64_t v54 = objc_msgSend_chainParentPublicKeyID(v7, v60, v61);
            }
            else
            {
              uint64_t v54 = 0;
            }
          }
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v62 = (id)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_recordID(self, v63, v64);
            v123 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v142;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v54;
            *(_WORD *)&buf[22] = 2112;
            v173 = v123;
            _os_log_debug_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_DEBUG, "Removing previous parent %@ with public key ID %{public}@ from record PCS for %@", buf, 0x20u);
          }
          uint64_t v67 = objc_msgSend_pcsManager(self, v65, v66);
          uint64_t v70 = objc_msgSend_pcs(v7, v68, v69);
          uint64_t v72 = objc_msgSend_removePublicKeyID_fromPCS_(v67, v71, (uint64_t)v54, v70);

          if (v72 && !v163[5])
          {
            uint64_t v74 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v73, *MEMORY[0x1E4F19DD8], 5001, v72, @"Couldn't remove previous parent PCS data for previous parent %@", v142);
            v75 = (void *)v163[5];
            v163[5] = v74;
          }
        }
        v76 = objc_msgSend_record(self, v49, v50);
        uint64_t v79 = objc_msgSend_parent(v76, v77, v78);

        if (v79)
        {
          group = dispatch_group_create();
          dispatch_group_enter(v9);
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v173 = sub_1C4ED6E2C;
          v174 = sub_1C4ED6E3C;
          id v175 = 0;
          uint64_t v82 = objc_msgSend_parentsByRecordID(v14, v80, v81);
          uint64_t v85 = objc_msgSend_record(self, v83, v84);
          uint64_t v88 = objc_msgSend_parent(v85, v86, v87);
          v91 = objc_msgSend_recordID(v88, v89, v90);
          v93 = objc_msgSend_objectForKeyedSubscript_(v82, v92, (uint64_t)v91);

          if (v93)
          {
            dispatch_group_enter(group);
            __int16 v96 = objc_msgSend_pcsGroup(v93, v94, v95);
            v99 = objc_msgSend_modifyRecordsQueue(v14, v97, v98);
            v156[0] = MEMORY[0x1E4F143A8];
            v156[1] = 3221225472;
            v156[2] = sub_1C4ED8010;
            v156[3] = &unk_1E64F5230;
            v160 = buf;
            id v157 = v93;
            v158 = self;
            v161 = &v162;
            v159 = group;
            dispatch_group_notify(v96, v99, v156);
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v102 = (id)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
            {
              v139 = objc_msgSend_record(self, v103, v104);
              v126 = objc_msgSend_parent(v139, v124, v125);
              v129 = objc_msgSend_recordID(v126, v127, v128);
              v132 = objc_msgSend_recordID(self, v130, v131);
              *(_DWORD *)v168 = 138412546;
              v169 = v129;
              __int16 v170 = 2112;
              v171 = v132;
              _os_log_debug_impl(&dword_1C4CFF000, v102, OS_LOG_TYPE_DEBUG, "Fetching parent PCS data with record ID %@ for record %@", v168, 0x16u);
            }
            dispatch_group_enter(group);
            int v107 = objc_msgSend__needsSigningPCS(self, v105, v106);
            uint64_t v110 = 4;
            if (v107) {
              uint64_t v110 = 20;
            }
            uint64_t v138 = v110;
            v111 = objc_msgSend_pcsCache(self, v108, v109);
            v114 = objc_msgSend_record(self, v112, v113);
            v117 = objc_msgSend_parent(v114, v115, v116);
            v120 = objc_msgSend_recordID(v117, v118, v119);
            v152[0] = MEMORY[0x1E4F143A8];
            v152[1] = 3221225472;
            v152[2] = sub_1C4ED8260;
            v152[3] = &unk_1E64F5208;
            v152[4] = self;
            v154 = buf;
            v155 = &v162;
            v153 = group;
            objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v111, v121, (uint64_t)v120, v14, v138, v152);
          }
          v122 = objc_msgSend_modifyRecordsQueue(v14, v100, v101);
          v147[0] = MEMORY[0x1E4F143A8];
          v147[1] = 3221225472;
          v147[2] = sub_1C4ED84E4;
          v147[3] = &unk_1E64F5230;
          v150 = buf;
          v151 = &v162;
          v147[4] = self;
          id v148 = v7;
          v149 = v9;
          dispatch_group_notify(group, v122, v147);

          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
  uint64_t v15 = objc_msgSend_modifyRecordsQueue(v14, v12, v13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4ED8664;
  block[3] = &unk_1E64F30F0;
  id v145 = v7;
  v146 = &v162;
  void block[4] = self;
  id v16 = v7;
  dispatch_group_notify(v9, v15, block);

  _Block_object_dispose(&v162, 8);
}

- (id)_addParentPCS:(id)a3 toRecordPCS:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F1A500];
  BOOL v10 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v75 = v10;
    uint64_t v78 = objc_msgSend_recordID(self, v76, v77);
    *(_DWORD *)buf = 138412546;
    id v104 = v6;
    __int16 v105 = 2112;
    id v106 = v78;
    _os_log_debug_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_DEBUG, "Adding parent PCS data %@ to PCS for record %@", buf, 0x16u);
  }
  uint64_t v13 = objc_msgSend_pcsManager(self, v11, v12);
  objc_msgSend_decryptChainPCSForRecordPCS_(v13, v14, (uint64_t)v6);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15
    || (objc_msgSend_chainPCSData(v6, v16, v17),
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        uint64_t v34 = objc_msgSend_pcs(v31, v32, v33),
        v31,
        !v34))
  {
    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v79 = v18;
      uint64_t v82 = objc_msgSend_record(self, v80, v81);
      uint64_t v85 = objc_msgSend_parent(v82, v83, v84);
      uint64_t v88 = objc_msgSend_recordID(v85, v86, v87);
      *(_DWORD *)buf = 138412546;
      id v104 = v88;
      __int16 v105 = 2112;
      id v106 = v15;
      _os_log_debug_impl(&dword_1C4CFF000, v79, OS_LOG_TYPE_DEBUG, "Couldn't decrypt the chain PCS blob on parent record %@: %@", buf, 0x16u);

      if (v15) {
        goto LABEL_24;
      }
    }
    else if (v15)
    {
      goto LABEL_24;
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v22 = *MEMORY[0x1E4F19DD8];
    uint64_t v23 = objc_msgSend_record(self, v19, v20);
    uint64_t v26 = objc_msgSend_parent(v23, v24, v25);
    uint64_t v29 = objc_msgSend_recordID(v26, v27, v28);
    objc_msgSend_errorWithDomain_code_format_(v21, v30, v22, 5004, @"Couldn't decrypt the chain PCS blob on parent record %@", v29);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
    goto LABEL_24;
  }
  uint64_t v37 = objc_msgSend_pcsManager(self, v35, v36);
  uint64_t v40 = objc_msgSend_chainPCSData(v6, v38, v39);
  uint64_t v43 = objc_msgSend_pcs(v40, v41, v42);
  uint64_t v46 = objc_msgSend_pcs(v7, v44, v45);
  id v102 = 0;
  char v48 = objc_msgSend_addSharePCS_toRecordPCS_error_(v37, v47, v43, v46, &v102);
  id v15 = v102;

  if (v48)
  {
    uint64_t v51 = objc_msgSend_chainPCSData(v6, v49, v50);
    uint64_t v54 = objc_msgSend_pcs(v51, v52, v53);
    uint64_t v23 = objc_msgSend_publicKeyIDFromIdentity_(CKDPCSManager, v55, v54);

    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v56 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v89 = v56;
      v92 = objc_msgSend_record(self, v90, v91);
      uint64_t v95 = objc_msgSend_parent(v92, v93, v94);
      uint64_t v98 = objc_msgSend_recordID(v95, v96, v97);
      uint64_t v101 = objc_msgSend_recordID(self, v99, v100);
      *(_DWORD *)buf = 138412802;
      id v104 = v98;
      __int16 v105 = 2112;
      id v106 = v101;
      __int16 v107 = 2114;
      id v108 = v23;
      _os_log_debug_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_DEBUG, "Successfully added parent PCS data from record %@ to record %@. Public key ID is %{public}@", buf, 0x20u);
    }
    uint64_t v26 = objc_msgSend_record(self, v57, v58);
    objc_msgSend_setChainParentPublicKeyID_(v26, v59, (uint64_t)v23);
    goto LABEL_23;
  }
  if (*v8 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v60 = *v9;
  if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
  {
    if (v15) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  *(_DWORD *)buf = 138412802;
  id v104 = v6;
  __int16 v105 = 2112;
  id v106 = v7;
  __int16 v107 = 2112;
  id v108 = v15;
  _os_log_debug_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_DEBUG, "Error adding parent PCS %@ to record PCS %@: %@", buf, 0x20u);
  if (!v15)
  {
LABEL_22:
    id v63 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v64 = *MEMORY[0x1E4F19DD8];
    uint64_t v23 = objc_msgSend_record(self, v61, v62);
    uint64_t v26 = objc_msgSend_parent(v23, v65, v66);
    uint64_t v69 = objc_msgSend_recordID(v26, v67, v68);
    uint64_t v72 = objc_msgSend_recordID(self, v70, v71);
    objc_msgSend_errorWithDomain_code_format_(v63, v73, v64, 5005, @"Couldn't add parent PCS data from record %@ to record %@", v69, v72);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
LABEL_24:

  return v15;
}

- (void)_createAndSavePCS
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v5 = objc_msgSend_operation(self, a2, v2);
    id v8 = objc_msgSend_unitTestOverrides(v5, v6, v7);
    BOOL v10 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"DisallowRecordPCSToBeCreated");

    if (v10)
    {
      uint64_t v67 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v67, v68, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 789, @"Record PCS creation not allowed by unit test");
    }
  }
  uint64_t v11 = objc_msgSend_record(self, a2, v2);
  uint64_t v14 = objc_msgSend_operation(self, v12, v13);
  id v15 = dispatch_group_create();
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x3032000000;
  v91[3] = sub_1C4ED6E2C;
  v91[4] = sub_1C4ED6E3C;
  id v92 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = sub_1C4ED6E2C;
  v89[4] = sub_1C4ED6E3C;
  id v90 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = sub_1C4ED6E2C;
  v87[4] = sub_1C4ED6E3C;
  id v88 = 0;
  os_log_t v18 = objc_msgSend_share(v11, v16, v17);
  objc_msgSend_recordID(v18, v19, v20);
  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v15);
  uint64_t v24 = objc_msgSend_container(v14, v22, v23);
  uint64_t v27 = objc_msgSend_options(v24, v25, v26);
  int v30 = objc_msgSend_useZoneWidePCS(v27, v28, v29);

  int v33 = objc_msgSend__needsSigningPCS(self, v31, v32);
  uint64_t v34 = 8;
  if (!v30) {
    uint64_t v34 = 0;
  }
  if (v33) {
    uint64_t v35 = v34 | 0x10;
  }
  else {
    uint64_t v35 = v34;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v36 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    if (v30) {
      uint64_t v62 = @"zoneish ";
    }
    else {
      uint64_t v62 = &stru_1F2044F30;
    }
    id v63 = objc_msgSend_recordID(v11, v37, v38);
    uint64_t v66 = objc_msgSend_zoneID(v63, v64, v65);
    *(_DWORD *)buf = 138543618;
    uint64_t v94 = v62;
    __int16 v95 = 2112;
    __int16 v96 = v66;
    _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Fetching %{public}@PCS data for zone %@", buf, 0x16u);
  }
  id v41 = objc_msgSend_pcsCache(self, v39, v40);
  id v44 = objc_msgSend_recordID(v11, v42, v43);
  v47 = objc_msgSend_zoneID(v44, v45, v46);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = sub_1C4ED93E8;
  v81[3] = &unk_1E64F5258;
  id v48 = v14;
  id v82 = v48;
  uint64_t v85 = v91;
  id v49 = v11;
  id v83 = v49;
  __int16 v86 = v87;
  uint64_t v50 = v15;
  uint64_t v84 = v50;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v41, v51, (uint64_t)v47, v48, v35, v81);

  if (v21
    || (objc_msgSend_record(self, v52, v53),
        uint64_t v54 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v54,
        (isKindOfClass & 1) != 0))
  {
    dispatch_group_enter(v50);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v58 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v94 = v21;
      _os_log_debug_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_DEBUG, "Fetching PCS data for share %@", buf, 0xCu);
    }
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = sub_1C4ED95A4;
    v76[3] = &unk_1E64F5280;
    uint64_t v79 = v89;
    uint64_t v77 = v21;
    uint64_t v80 = v87;
    uint64_t v78 = v50;
    objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v59, (uint64_t)v77, v76);
  }
  id v60 = objc_msgSend_modifyRecordsQueue(v48, v56, v57);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4ED96F4;
  block[3] = &unk_1E64F52A8;
  id v70 = v49;
  uint64_t v71 = self;
  uint64_t v72 = v87;
  uint64_t v73 = v91;
  uint64_t v74 = v89;
  BOOL v75 = v21 != 0;
  id v61 = v49;
  dispatch_group_notify(v50, v60, block);

  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v89, 8);

  _Block_object_dispose(v91, 8);
}

- (BOOL)_useZoneishPCS
{
  id v4 = objc_msgSend_record(self, a2, v2);
  uint64_t v7 = objc_msgSend_operation(self, v5, v6);
  BOOL v12 = objc_msgSend_databaseScope(v7, v8, v9) != 2 && objc_msgSend_databaseScope(v7, v10, v11) != 3;
  uint64_t v13 = objc_msgSend_container(v7, v10, v11);
  id v16 = objc_msgSend_options(v13, v14, v15);
  BOOL v21 = 0;
  if (objc_msgSend_useZoneWidePCS(v16, v17, v18) && !v12)
  {
    uint64_t v24 = objc_msgSend_share(v4, v19, v20);
    if (v24)
    {
      BOOL v21 = 0;
    }
    else
    {
      uint64_t v25 = objc_msgSend_parent(v4, v22, v23);
      BOOL v21 = v25 == 0;
    }
  }

  return v21;
}

- (void)_continueCreateAndSavePCSWithZonePCS:(id)a3 sharePCS:(id)a4
{
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = objc_msgSend_record(self, v8, v9);
  uint64_t v13 = objc_msgSend_operation(self, v11, v12);
  uint64_t v14 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v15 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = v15;
    BOOL v21 = objc_msgSend_recordID(v10, v19, v20);
    *(_DWORD *)buf = 138412290;
    v204 = v21;
    _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Creating new PCS object for record %@", buf, 0xCu);
  }
  v199 = v7;
  if (objc_msgSend__useZoneishPCS(self, v16, v17))
  {
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v24 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v152 = v24;
      v155 = objc_msgSend_zoneishPublicKeyID(v6, v153, v154);
      v158 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v155, v156, v157);
      v161 = objc_msgSend_recordID(v10, v159, v160);
      *(_DWORD *)buf = 138543618;
      v204 = v158;
      __int16 v205 = 2112;
      id v206 = v161;
      _os_log_debug_impl(&dword_1C4CFF000, v152, OS_LOG_TYPE_DEBUG, "Using zoneish PCS with key %{public}@ for record %@", buf, 0x16u);
    }
    if (objc_msgSend_zoneishPCS(v6, v25, v26))
    {
      uint64_t v29 = (const void *)objc_msgSend_zoneishPCS(v6, v27, v28);
      uint64_t v32 = objc_msgSend_zoneishPublicKeyID(v6, v30, v31);
      objc_msgSend_setZoneishKeyID_(v10, v33, (uint64_t)v32);

      if (*MEMORY[0x1E4F1A4E0])
      {
        uint64_t v36 = objc_msgSend_unitTestOverrides(v13, v34, v35);
        uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v36, v37, @"TwoByteZoneishKeyIDs");

        if (v38)
        {
          id v41 = objc_msgSend_zoneishKeyID(v10, v39, v40);
          uint64_t v43 = objc_msgSend_subdataWithRange_(v41, v42, 0, 2);
          objc_msgSend_setZoneishKeyID_(v10, v44, (uint64_t)v43);
        }
        else
        {
          v122 = objc_msgSend_unitTestOverrides(v13, v39, v40);
          v124 = objc_msgSend_objectForKeyedSubscript_(v122, v123, @"ZoneishKeyIDWithOnlyTwoValidBytes");

          if (v124)
          {
            v127 = objc_msgSend_zoneishKeyID(v10, v125, v126);
            v129 = objc_msgSend_subdataWithRange_(v127, v128, 0, 2);
            v132 = objc_msgSend_mutableCopy(v129, v130, v131);

            *(_WORD *)buf = -21846;
            objc_msgSend_appendBytes_length_(v132, v133, (uint64_t)buf, 2);
            objc_msgSend_setZoneishKeyID_(v10, v134, (uint64_t)v132);

            goto LABEL_30;
          }
          v189 = objc_msgSend_unitTestOverrides(v13, v125, v126);
          v191 = objc_msgSend_objectForKeyedSubscript_(v189, v190, @"RandomZoneishKeyID");

          if (!v191) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = -1515870811;
          id v41 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v192, (uint64_t)buf, 4);
          objc_msgSend_setZoneishKeyID_(v10, v193, (uint64_t)v41);
        }
      }
LABEL_30:
      if (v29)
      {
        CFRetain(v29);
        id v89 = 0;
        goto LABEL_49;
      }
      id v89 = 0;
LABEL_44:
      BOOL v150 = 0;
      uint64_t v29 = 0;
      BOOL v151 = v89 == 0;
      goto LABEL_53;
    }
    uint64_t v72 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v73 = *MEMORY[0x1E4F19DD8];
    uint64_t v74 = objc_msgSend_recordID(v10, v27, v28);
    uint64_t v77 = objc_msgSend_zoneID(v74, v75, v76);
    uint64_t v80 = objc_msgSend_recordID(v10, v78, v79);
    objc_msgSend_recordName(v80, v81, v82);
    id v83 = v6;
    uint64_t v84 = self;
    uint64_t v85 = v13;
    v87 = __int16 v86 = v10;
    objc_msgSend_errorWithDomain_code_format_(v72, v88, v73, 5001, @"Couldn't fetch a zoneish PCS from zone %@ for record %@", v77, v87);
    id v89 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v10 = v86;
    uint64_t v13 = v85;
    self = v84;
    id v6 = v83;

LABEL_43:
    goto LABEL_44;
  }
  if (objc_msgSend_pcs(v6, v22, v23))
  {
    v197 = v10;
    v47 = objc_msgSend_container(v13, v45, v46);
    uint64_t v50 = objc_msgSend_pcsManager(v47, v48, v49);
    uint64_t v53 = objc_msgSend_pcs(v6, v51, v52);
    uint64_t v56 = objc_msgSend_pcs(v7, v54, v55);
    v195 = self;
    objc_msgSend_record(self, v57, v58);
    v60 = int v59 = v13;
    int v65 = objc_msgSend_useLightweightPCS(v60, v61, v62);
    uint64_t v66 = v59;
    if (v65)
    {
      uint64_t v14 = objc_msgSend_container(v59, v63, v64);
      int v59 = objc_msgSend_entitlements(v14, v67, v68);
      uint64_t hasLightweightPCSEntitlement = objc_msgSend_hasLightweightPCSEntitlement(v59, v69, v70);
    }
    else
    {
      uint64_t hasLightweightPCSEntitlement = 0;
    }
    id v202 = 0;
    uint64_t v29 = (const void *)objc_msgSend_createRecordPCSWithZonePCS_sharePCS_createLite_error_(v50, v63, v53, v56, hasLightweightPCSEntitlement, &v202);
    id v89 = v202;
    if (v65)
    {
    }
    BOOL v10 = v197;
    uint64_t v13 = v66;
    self = v195;
  }
  else
  {
    if (objc_msgSend_databaseScope(v13, v45, v46) != 3)
    {
      uint64_t v119 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v120 = *MEMORY[0x1E4F19DD8];
      uint64_t v74 = objc_msgSend_recordID(v10, v90, v91);
      objc_msgSend_errorWithDomain_code_format_(v119, v121, v120, 5001, @"We couldn't decrypt the zone PCS and this isn't a share, so we can't create a new record PCS for %@", v74);
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    v198 = v10;
    id v92 = objc_msgSend_pcsData(v6, v90, v91);

    v194 = v13;
    if (!v92)
    {
      uint64_t v135 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v136 = *MEMORY[0x1E4F19DD8];
      uint64_t v74 = objc_msgSend_recordID(v198, v93, v94);
      v141 = objc_msgSend_pcsData(v6, v137, v138);
      if (v141) {
        v142 = &stru_1F2044F30;
      }
      else {
        v142 = @"zone PCS data ";
      }
      id v145 = objc_msgSend_pcsData(v6, v139, v140);
      v146 = &stru_1F2044F30;
      if (!v145)
      {
        if (objc_msgSend_pcs(v7, v143, v144)) {
          v146 = &stru_1F2044F30;
        }
        else {
          v146 = @" and no ";
        }
      }
      uint64_t v147 = objc_msgSend_pcs(v7, v143, v144);
      v149 = @"share PCS";
      if (v147) {
        v149 = &stru_1F2044F30;
      }
      objc_msgSend_errorWithDomain_code_format_(v135, v148, v136, 5001, @"Can't create a record PCS for %@ because there is no %@%@%@", v74, v142, v146, v149);
      id v89 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v10 = v198;
      uint64_t v13 = v194;
      goto LABEL_43;
    }
    v196 = objc_msgSend_container(v13, v93, v94);
    uint64_t v97 = objc_msgSend_pcsManager(v196, v95, v96);
    objc_msgSend_pcsData(v6, v98, v99);
    uint64_t v101 = v100 = v13;
    uint64_t v104 = objc_msgSend_pcs(v7, v102, v103);
    __int16 v107 = objc_msgSend_record(self, v105, v106);
    int v112 = objc_msgSend_useLightweightPCS(v107, v108, v109);
    if (v112)
    {
      uint64_t v14 = objc_msgSend_container(v100, v110, v111);
      uint64_t v100 = objc_msgSend_entitlements(v14, v113, v114);
      uint64_t v117 = objc_msgSend_hasLightweightPCSEntitlement(v100, v115, v116);
    }
    else
    {
      uint64_t v117 = 0;
    }
    id v201 = 0;
    uint64_t v29 = (const void *)objc_msgSend_createRecordPCSWithEncryptedZonePCS_sharePCS_createLite_error_(v97, v110, (uint64_t)v101, v104, v117, &v201);
    id v89 = v201;
    if (v112)
    {
    }
    BOOL v10 = v198;
    uint64_t v13 = v194;
  }
LABEL_49:
  BOOL v151 = v89 == 0;
  BOOL v150 = v29 != 0;
  if (!v89 && v29)
  {
    uint64_t v162 = objc_msgSend_dataWithRecord_(CKDRecordPCSData, v118, (uint64_t)v10);
    if (objc_msgSend__useZoneishPCS(self, v163, v164))
    {
      id v89 = 0;
    }
    else
    {
      id v175 = objc_msgSend_container(v13, v165, v166);
      v178 = objc_msgSend_pcsManager(v175, v176, v177);
      id v200 = 0;
      v180 = objc_msgSend_dataFromRecordPCS_error_(v178, v179, (uint64_t)v29, &v200);
      id v89 = v200;

      objc_msgSend_setPcsData_(v162, v181, (uint64_t)v180);
    }
    objc_msgSend_setPcs_(v162, v165, (uint64_t)v29);
    objc_msgSend_setZonePCSData_(v162, v182, (uint64_t)v6);
    objc_msgSend_setSharePCSData_(v162, v183, (uint64_t)v199);
    objc_msgSend__addShareToPCSData_withError_(self, v184, (uint64_t)v162, v89);

    goto LABEL_63;
  }
LABEL_53:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v167 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    v185 = v167;
    v188 = objc_msgSend_recordID(v10, v186, v187);
    *(_DWORD *)buf = 138412546;
    v204 = v188;
    __int16 v205 = 2112;
    id v206 = v89;
    _os_log_error_impl(&dword_1C4CFF000, v185, OS_LOG_TYPE_ERROR, "Couldn't create a new record PCS for %@: %@", buf, 0x16u);

    if (v151)
    {
LABEL_57:
      __int16 v170 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v171 = *MEMORY[0x1E4F19DD8];
      v172 = objc_msgSend_recordID(v10, v168, v169);
      objc_msgSend_errorWithDomain_code_format_(v170, v173, v171, 5001, @"Couldn't create a new record PCS for %@", v172);
      id v89 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend__addShareToPCSData_withError_(self, v174, 0, v89);
      if (!v150) {
        goto LABEL_64;
      }
      goto LABEL_63;
    }
  }
  else if (v151)
  {
    goto LABEL_57;
  }
  objc_msgSend__addShareToPCSData_withError_(self, v168, 0, v89);
  if (v150) {
LABEL_63:
  }
    CFRelease(v29);
LABEL_64:
}

- (void)_unwrapRecordPCSForZone
{
  id v4 = objc_msgSend_record(self, a2, v2);
  objc_initWeak(&location, self);
  id v7 = objc_msgSend_pcsCache(self, v5, v6);
  BOOL v10 = objc_msgSend_recordID(v4, v8, v9);
  uint64_t v13 = objc_msgSend_zoneID(v10, v11, v12);
  id v16 = objc_msgSend_operation(self, v14, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4EDA544;
  v19[3] = &unk_1E64F52D0;
  objc_copyWeak(&v21, &location);
  id v17 = v4;
  id v20 = v17;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v7, v18, (uint64_t)v13, v16, 0, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_unwrapRecordPCSWithShareID:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_record(self, v5, v6);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4EDAB58;
  v11[3] = &unk_1E64F52F8;
  objc_copyWeak(&v14, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v4;
  id v13 = v9;
  objc_msgSend__fetchSharePCSForID_withCompletionHandler_(self, v10, (uint64_t)v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_unwrapRecordPCSForParent
{
  id v4 = objc_msgSend_record(self, a2, v2);
  objc_initWeak(&location, self);
  id v7 = objc_msgSend_parent(v4, v5, v6);
  BOOL v10 = objc_msgSend_recordID(v7, v8, v9);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4EDB130;
  v14[3] = &unk_1E64F5320;
  objc_copyWeak(&v17, &location);
  id v11 = v4;
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  objc_msgSend__fetchParentPCSForID_withCompletionHandler_(self, v13, (uint64_t)v12, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_fetchExistingPCSForProvidedPCSData:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_record(self, v5, v6);
  objc_initWeak(&location, self);
  BOOL v10 = objc_msgSend_pcsCache(self, v8, v9);
  id v13 = objc_msgSend_recordID(v7, v11, v12);
  id v16 = objc_msgSend_operation(self, v14, v15);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4EDB764;
  v20[3] = &unk_1E64F5320;
  objc_copyWeak(&v23, &location);
  id v17 = v4;
  id v21 = v17;
  id v18 = v7;
  id v22 = v18;
  objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v10, v19, (uint64_t)v13, v16, 0, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)_handlePCSData:(id)a3 withError:(id)a4
{
  uint64_t v479 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = objc_msgSend_record(self, v8, v9);
  uint64_t v15 = objc_msgSend_operation(self, v11, v12);
  id v16 = (id *)MEMORY[0x1E4F1A548];
  id v17 = (void *)MEMORY[0x1E4F1A550];
  id v18 = (id *)MEMORY[0x1E4F1A500];
  if (v7) {
    goto LABEL_2;
  }
  if (!objc_msgSend_pcs(v6, v13, v14)) {
    goto LABEL_167;
  }
  id v34 = *v16;
  uint64_t v35 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v34);
  }

  uint64_t v36 = *v18;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v134 = objc_msgSend_recordID(v10, v37, v38);
    v137 = objc_msgSend_etag(v6, v135, v136);
    *(_DWORD *)buf = 138543618;
    uint64_t v473 = (uint64_t)v134;
    __int16 v474 = 2114;
    id v475 = v137;
    _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Got PCS data for record=%{public}@, protectionInfoTag=%{public}@", buf, 0x16u);

    uint64_t v35 = (void *)MEMORY[0x1E4F1A550];
  }

  v460 = self;
  if (!objc_msgSend_wantsChainPCS(v10, v39, v40))
  {
    id v7 = 0;
    goto LABEL_52;
  }
  uint64_t v43 = objc_msgSend_chainPCSData(v6, v41, v42);

  if (v43)
  {
    uint64_t v46 = objc_msgSend_pcsManager(self, v44, v45);
    objc_msgSend_decryptChainPCSForRecordPCS_(v46, v47, (uint64_t)v6);
    id v48 = (id)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      uint64_t v51 = objc_msgSend_chainPCSData(v6, v49, v50);
      id v48 = (id)objc_msgSend_pcs(v51, v52, v53);

      if (v48)
      {
        uint64_t v56 = objc_msgSend_chainPCSData(v6, v54, v55);
        ChainPCSWithError = (const void *)objc_msgSend_pcs(v56, v57, v58);

        if (ChainPCSWithError)
        {
          CFRetain(ChainPCSWithError);
          id v48 = 0;
LABEL_25:
          uint64_t v70 = objc_msgSend_pcsManager(self, v60, v61);
          uint64_t v72 = objc_msgSend_addIdentityBackToPCS_(v70, v71, (uint64_t)ChainPCSWithError);

          if (v72)
          {
            id v75 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v75);
            }
            uint64_t v76 = (id *)MEMORY[0x1E4F1A500];

            uint64_t v77 = *v76;
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              uint64_t v80 = objc_msgSend_recordID(self, v78, v79);
              *(_DWORD *)buf = 138412546;
              uint64_t v473 = (uint64_t)v80;
              __int16 v474 = 2112;
              id v475 = v72;
              _os_log_impl(&dword_1C4CFF000, v77, OS_LOG_TYPE_INFO, "Warn: Couldn't create protection data from chain PCS for record %@: %@", buf, 0x16u);
            }
          }
          uint64_t v81 = objc_msgSend_pcsManager(self, v73, v74);
          id v470 = 0;
          id v83 = objc_msgSend_dataFromZonePCS_error_(v81, v82, (uint64_t)ChainPCSWithError, &v470);
          id v84 = v470;
          uint64_t v87 = objc_msgSend_record(self, v85, v86);
          objc_msgSend_setChainProtectionInfo_(v87, v88, (uint64_t)v83);

          if (v84)
          {
            id v89 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v89);
            }
            id v90 = (id *)MEMORY[0x1E4F1A500];

            uint64_t v91 = *v90;
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              uint64_t v94 = objc_msgSend_recordID(self, v92, v93);
              *(_DWORD *)buf = 138412546;
              uint64_t v473 = (uint64_t)v94;
              __int16 v474 = 2112;
              id v475 = v84;
              _os_log_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_INFO, "Warn: Couldn't create protection data from chain PCS for record %@: %@", buf, 0x16u);
            }
          }
          id v95 = objc_alloc(MEMORY[0x1E4F19FA0]);
          uint64_t v98 = objc_msgSend_pcsManager(self, v96, v97);
          id v469 = 0;
          uint64_t v100 = objc_msgSend_sharingIdentityDataFromPCS_error_(v98, v99, (uint64_t)ChainPCSWithError, &v469);
          id v101 = v469;
          uint64_t v103 = objc_msgSend_initWithData_(v95, v102, (uint64_t)v100);
          uint64_t v106 = objc_msgSend_record(self, v104, v105);
          objc_msgSend_setChainPrivateKey_(v106, v107, (uint64_t)v103);

          if (v101)
          {
            id v108 = (id)*MEMORY[0x1E4F1A548];
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v108);
            }
            uint64_t v109 = (id *)MEMORY[0x1E4F1A500];

            uint64_t v110 = *v109;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              uint64_t v113 = objc_msgSend_recordID(v460, v111, v112);
              *(_DWORD *)buf = 138412546;
              uint64_t v473 = (uint64_t)v113;
              __int16 v474 = 2112;
              id v475 = v101;
              _os_log_impl(&dword_1C4CFF000, v110, OS_LOG_TYPE_INFO, "Warn: Couldn't create private chaining key from chain PCS for record %@: %@", buf, 0x16u);
            }
          }
          uint64_t v114 = [CKDChainPCSData alloc];
          uint64_t v117 = objc_msgSend_record(v460, v115, v116);
          uint64_t v120 = objc_msgSend_chainProtectionInfo(v117, v118, v119);
          v123 = objc_msgSend_record(v460, v121, v122);
          uint64_t v126 = objc_msgSend_chainPrivateKey(v123, v124, v125);
          uint64_t v128 = objc_msgSend_initWithPCSData_encryptedPrivateKey_(v114, v127, (uint64_t)v120, v126);
          objc_msgSend_setChainPCSData_(v6, v129, (uint64_t)v128);

          self = v460;
          v132 = objc_msgSend_chainPCSData(v6, v130, v131);
          objc_msgSend_setPcs_(v132, v133, (uint64_t)ChainPCSWithError);

          CFRelease(ChainPCSWithError);
          id v7 = 0;
          goto LABEL_52;
        }
        id v48 = 0;
      }
    }
  }
  else
  {
    id v62 = (id)*MEMORY[0x1E4F1A548];
    if (*v35 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v62);
    }

    id v63 = *v18;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      v442 = objc_msgSend_recordID(self, v64, v65);
      *(_DWORD *)buf = 138412290;
      uint64_t v473 = (uint64_t)v442;
      _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Record %@ is a parent in this save group but it has no chain PCS data yet. Creating chain PCS data", buf, 0xCu);
    }
    uint64_t v68 = objc_msgSend_pcsManager(self, v66, v67);
    id v471 = 0;
    ChainPCSWithError = (const void *)objc_msgSend_createChainPCSWithError_(v68, v69, (uint64_t)&v471);
    id v48 = v471;

    uint64_t v35 = (void *)MEMORY[0x1E4F1A550];
    if (ChainPCSWithError) {
      goto LABEL_25;
    }
  }
  id v138 = (id)*MEMORY[0x1E4F1A548];
  if (*v35 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v138);
  }

  v139 = *v18;
  if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
  {
    v142 = objc_msgSend_recordID(self, v140, v141);
    *(_DWORD *)buf = 138412546;
    uint64_t v473 = (uint64_t)v142;
    __int16 v474 = 2112;
    id v475 = v48;
    _os_log_impl(&dword_1C4CFF000, v139, OS_LOG_TYPE_INFO, "Couldn't create a chaining PCS for %@: %@", buf, 0x16u);
  }
  if (!v48)
  {
    id v145 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v146 = *MEMORY[0x1E4F19DD8];
    uint64_t v147 = objc_msgSend_recordID(self, v143, v144);
    objc_msgSend_errorWithDomain_code_format_(v145, v148, v146, 5005, @"Couldn't create a parent PCS for record %@", v147);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v48;
LABEL_52:
  v149 = objc_msgSend_tombstonedPublicKeyIDs(v10, v41, v42);
  uint64_t v152 = objc_msgSend_count(v149, v150, v151);

  v459 = v7;
  if (v152)
  {
    id v155 = (id)*MEMORY[0x1E4F1A548];
    v156 = (id *)MEMORY[0x1E4F1A500];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v155);
    }

    uint64_t v157 = *v156;
    if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
    {
      uint64_t v160 = objc_msgSend_tombstonedPublicKeyIDs(v10, v158, v159);
      uint64_t v163 = objc_msgSend_count(v160, v161, v162);
      uint64_t v166 = objc_msgSend_recordID(self, v164, v165);
      *(_DWORD *)buf = 134218242;
      uint64_t v473 = v163;
      __int16 v474 = 2112;
      id v475 = v166;
      _os_log_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_INFO, "Found %lu tombstoned key(s) on record %@", buf, 0x16u);
    }
    v457 = v10;
    v458 = v15;
    id v167 = v6;

    v168 = objc_opt_new();
    long long v465 = 0u;
    long long v466 = 0u;
    long long v467 = 0u;
    long long v468 = 0u;
    uint64_t v171 = objc_msgSend_record(self, v169, v170);
    v174 = objc_msgSend_tombstonedPublicKeyIDs(v171, v172, v173);

    uint64_t v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v175, (uint64_t)&v465, v478, 16);
    if (v176)
    {
      uint64_t v179 = v176;
      char v180 = 0;
      uint64_t v181 = *(void *)v466;
      do
      {
        for (uint64_t i = 0; i != v179; ++i)
        {
          if (*(void *)v466 != v181) {
            objc_enumerationMutation(v174);
          }
          uint64_t v183 = *(void *)(*((void *)&v465 + 1) + 8 * i);
          v184 = objc_msgSend_pcsManager(self, v177, v178);
          uint64_t v187 = objc_msgSend_pcs(v167, v185, v186);
          v189 = objc_msgSend_removePublicKeyID_fromPCS_(v184, v188, v183, v187);

          if (v189) {
            objc_msgSend_addObject_(v168, v190, v183);
          }
          else {
            char v180 = 1;
          }

          self = v460;
        }
        uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v177, (uint64_t)&v465, v478, 16);
      }
      while (v179);
    }
    else
    {
      char v180 = 0;
    }

    BOOL v10 = v457;
    objc_msgSend_setTombstonedPublicKeyIDs_(v457, v191, (uint64_t)v168);
    id v7 = v459;
    id v6 = v167;
    if ((objc_msgSend_didRollRecordPCSMasterKey(self, v192, v193) & 1) == 0)
    {
      id v7 = v459;
      if (v180)
      {
        v196 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v194, v195);
        int v199 = objc_msgSend_rollRecordMasterKeysOnUnshare(v196, v197, v198);

        id v7 = v459;
        if (v199)
        {
          id v200 = (id)*MEMORY[0x1E4F1A548];
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v200);
          }
          id v201 = (id *)MEMORY[0x1E4F1A500];

          id v202 = *v201;
          if (os_log_type_enabled(v202, OS_LOG_TYPE_DEBUG))
          {
            v450 = objc_msgSend_recordID(self, v203, v204);
            *(_DWORD *)buf = 138412290;
            uint64_t v473 = (uint64_t)v450;
            _os_log_debug_impl(&dword_1C4CFF000, v202, OS_LOG_TYPE_DEBUG, "Rolling record PCS master key since we cleaned up tombstoned key(s) on record %@", buf, 0xCu);
          }
          uint64_t v207 = objc_msgSend_pcsManager(self, v205, v206);
          uint64_t v210 = objc_msgSend_pcs(v6, v208, v209);
          objc_msgSend_rollMasterKeyForRecordPCS_forOperation_(v207, v211, v210, v458);
          id v7 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setDidRollRecordPCSMasterKey_(self, v212, 1);
        }
      }
    }

    uint64_t v15 = v458;
  }
  v213 = objc_msgSend_record(self, v153, v154);
  v216 = objc_msgSend_share(v213, v214, v215);
  v219 = objc_msgSend_recordID(v216, v217, v218);

  if (v219)
  {
    v222 = objc_msgSend_handlersByRecordID(v15, v220, v221);
    v225 = objc_msgSend_record(self, v223, v224);
    v228 = objc_msgSend_share(v225, v226, v227);
    v231 = objc_msgSend_recordID(v228, v229, v230);
    v233 = objc_msgSend_objectForKeyedSubscript_(v222, v232, (uint64_t)v231);
    uint64_t v236 = objc_msgSend_record(v233, v234, v235);

    v237 = (void *)v236;
    if (v236) {
      objc_msgSend_setWantsPublicSharingKey_(v10, v220, 1);
    }
    self = v460;
  }
  else
  {
    v237 = 0;
  }
  uint64_t v238 = objc_msgSend_mutableEncryptedPSK(v10, v220, v221);
  if (v238)
  {
    v241 = (void *)v238;
  }
  else
  {
    if (!objc_msgSend_wantsPublicSharingKey(v10, v239, v240)) {
      goto LABEL_106;
    }
    v244 = objc_msgSend_mutableEncryptedPSK(v237, v242, v243);

    if (v244)
    {
      id v247 = (id)*MEMORY[0x1E4F1A548];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v247);
      }

      v248 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEBUG))
      {
        v452 = objc_msgSend_recordID(v237, v249, v250);
        v455 = objc_msgSend_recordID(self, v453, v454);
        *(_DWORD *)buf = 138412546;
        uint64_t v473 = (uint64_t)v452;
        __int16 v474 = 2112;
        id v475 = v455;
        _os_log_debug_impl(&dword_1C4CFF000, v248, OS_LOG_TYPE_DEBUG, "Using publicSharingIdentity from share %@ for record %@", buf, 0x16u);
      }
      id v251 = objc_alloc(MEMORY[0x1E4F19FA0]);
      v254 = objc_msgSend_mutableEncryptedPSK(v237, v252, v253);
      v257 = objc_msgSend_data(v254, v255, v256);
      v259 = objc_msgSend_initWithData_(v251, v258, (uint64_t)v257);
      objc_msgSend_setMutableEncryptedPSK_(v10, v260, (uint64_t)v259);
    }
    v261 = objc_msgSend_mutableEncryptedPSK(v10, v245, v246);

    if (!v261)
    {
      v264 = objc_msgSend_encryptedPublicSharingKey(v6, v262, v263);
      objc_msgSend_setMutableEncryptedPSK_(v10, v265, (uint64_t)v264);
    }
    v266 = objc_msgSend_mutableEncryptedPSK(v10, v262, v263);

    if (!v266)
    {
      id v464 = v459;
      uint64_t PublicSharingKeyWithError = objc_msgSend__createPublicSharingKeyWithError_(self, v267, (uint64_t)&v464);
      id v270 = v464;

      if (PublicSharingKeyWithError)
      {
        v459 = v270;
      }
      else
      {
        id v271 = (id)*MEMORY[0x1E4F1A548];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v271);
        }

        v272 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
        {
          v456 = objc_msgSend_recordID(v10, v273, v274);
          *(_DWORD *)buf = 138412546;
          uint64_t v473 = (uint64_t)v456;
          __int16 v474 = 2112;
          id v475 = v270;
          _os_log_error_impl(&dword_1C4CFF000, v272, OS_LOG_TYPE_ERROR, "Failed to prepare public sharing key for record %@: %@", buf, 0x16u);
        }
        if (!v270)
        {
          v277 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v278 = *MEMORY[0x1E4F19DD8];
          objc_msgSend_recordID(self, v275, v276);
          v280 = v279 = v237;
          objc_msgSend_errorWithDomain_code_format_(v277, v281, v278, 5005, @"Couldn't create a public sharing key for record %@", v280);
          id v270 = (id)objc_claimAutoreleasedReturnValue();

          v237 = v279;
        }
        id v282 = v270;

        v459 = v282;
        id v7 = v282;
      }
    }
    v241 = objc_msgSend_mutableEncryptedPSK(v10, v267, v268);
    objc_msgSend_setEncryptedPublicSharingKey_(v6, v283, (uint64_t)v241);
  }

LABEL_106:
  v286 = objc_msgSend_baseToken(v10, v242, v243);
  if (v286)
  {
LABEL_107:

    goto LABEL_111;
  }
  if (objc_msgSend_wantsPublicSharingKey(v10, v284, v285))
  {
    v289 = objc_msgSend_baseToken(v237, v287, v288);

    if (v289)
    {
      v286 = objc_msgSend_baseToken(v237, v287, v288);
      objc_msgSend_setBaseToken_(v10, v290, (uint64_t)v286);
      goto LABEL_107;
    }
  }
LABEL_111:
  int v291 = objc_msgSend__needsSigningPCS(self, v287, v288);
  id v16 = (id *)MEMORY[0x1E4F1A548];
  if (v291)
  {
    id v294 = (id)*MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v294);
    }

    v295 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v295, OS_LOG_TYPE_DEBUG))
    {
      v426 = objc_msgSend_recordID(v10, v296, v297);
      *(_DWORD *)buf = 138412290;
      uint64_t v473 = (uint64_t)v426;
      _os_log_debug_impl(&dword_1C4CFF000, v295, OS_LOG_TYPE_DEBUG, "Should set signing PCS for record %@", buf, 0xCu);

      id v16 = (id *)MEMORY[0x1E4F1A548];
    }

    objc_msgSend__setSigningPCSIdentity_(self, v298, (uint64_t)v6);
  }
  if (v7)
  {

    id v18 = (id *)MEMORY[0x1E4F1A500];
    id v17 = (void *)MEMORY[0x1E4F1A550];
    goto LABEL_2;
  }
  v299 = v237;
  v300 = objc_msgSend_container(v15, v292, v293);
  v303 = objc_msgSend_pcsManager(v300, v301, v302);
  v306 = objc_msgSend_pcsKeysToRemove(v6, v304, v305);
  uint64_t v309 = objc_msgSend_pcs(v6, v307, v308);
  v312 = objc_msgSend_protectionEtag(v10, v310, v311);
  uint64_t v314 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v303, v313, (uint64_t)v306, v309, v312, v15);

  if (v314)
  {
    v463[0] = MEMORY[0x1E4F143A8];
    v463[1] = 3221225472;
    v463[2] = sub_1C4EDD8C0;
    v463[3] = &unk_1E64F2E00;
    v463[4] = v314;
    objc_msgSend_updateCloudKitMetrics_(v15, v315, (uint64_t)v463);
  }
  uint64_t v317 = objc_msgSend_pcs(v6, v315, v316);
  objc_msgSend_setRecordPCS_(v10, v318, v317);
  v321 = objc_msgSend_container(v15, v319, v320);
  v324 = objc_msgSend_pcsManager(v321, v322, v323);
  uint64_t v327 = objc_msgSend_pcs(v6, v325, v326);
  id v462 = v459;
  v329 = objc_msgSend_dataFromRecordPCS_error_(v324, v328, v327, &v462);
  id v330 = v462;

  if (!v329)
  {
    id v361 = (id)*MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v361);
    }

    v362 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v362, OS_LOG_TYPE_ERROR))
    {
      v451 = objc_msgSend_recordID(v10, v363, v364);
      *(_DWORD *)buf = 138412546;
      uint64_t v473 = (uint64_t)v451;
      __int16 v474 = 2112;
      id v475 = v330;
      _os_log_error_impl(&dword_1C4CFF000, v362, OS_LOG_TYPE_ERROR, "Couldn't create PCS data for record %@: %@", buf, 0x16u);
    }
    goto LABEL_166;
  }
  objc_msgSend_setProtectionData_(v10, v331, (uint64_t)v329);
  v333 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v332, (uint64_t)v329);
  objc_msgSend_setProtectionEtag_(v10, v334, (uint64_t)v333);

  if (!objc_msgSend__canSetPreviousProtectionEtag(self, v335, v336)
    || (objc_msgSend_previousProtectionEtag(v10, v337, v338),
        v339 = objc_claimAutoreleasedReturnValue(),
        v339,
        !v339))
  {
    v340 = objc_msgSend_etag(v6, v337, v338);
    objc_msgSend_setPreviousProtectionEtag_(v10, v341, (uint64_t)v340);
  }
  v342 = objc_msgSend_previousProtectionEtagFromUnitTest(v10, v337, v338);

  if (v342)
  {
    v345 = objc_msgSend_previousProtectionEtagFromUnitTest(v10, v343, v344);
    objc_msgSend_setPreviousProtectionEtag_(v10, v346, (uint64_t)v345);

    objc_msgSend_setPreviousProtectionEtagFromUnitTest_(v10, v347, 0);
  }
  v348 = objc_msgSend_container(v15, v343, v344);
  v351 = objc_msgSend_deviceContext(v348, v349, v350);
  uint64_t v354 = objc_msgSend_testDeviceReference(v351, v352, v353);
  if (v354)
  {
    v357 = (void *)v354;
    v358 = objc_msgSend_zoneProtectionEtag(v10, v355, v356);

    if (v358) {
      goto LABEL_137;
    }
  }
  else
  {
  }
  v365 = objc_msgSend_zonePCSData(v6, v359, v360);
  v368 = objc_msgSend_etag(v365, v366, v367);
  objc_msgSend_setZoneProtectionEtag_(v10, v369, (uint64_t)v368);

LABEL_137:
  v370 = objc_msgSend_container(v15, v359, v360);
  v373 = objc_msgSend_deviceContext(v370, v371, v372);
  uint64_t v376 = objc_msgSend_testDeviceReference(v373, v374, v375);
  if (!v376)
  {

    self = v460;
LABEL_141:
    v383 = objc_msgSend_sharePCSData(v6, v381, v382);
    v386 = objc_msgSend_shareEtag(v383, v384, v385);
    objc_msgSend_setShareEtag_(v10, v387, (uint64_t)v386);

    goto LABEL_142;
  }
  v379 = (void *)v376;
  v380 = objc_msgSend_shareEtag(v10, v377, v378);

  self = v460;
  if (!v380) {
    goto LABEL_141;
  }
LABEL_142:
  v388 = objc_msgSend_container(v15, v381, v382);
  v391 = objc_msgSend_options(v388, v389, v390);
  int v394 = objc_msgSend_useZoneWidePCS(v391, v392, v393);

  if (!v394) {
    goto LABEL_165;
  }
  id v396 = (id)*MEMORY[0x1E4F1A548];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v396);
  }

  v397 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v397, OS_LOG_TYPE_INFO))
  {
    v400 = objc_msgSend_recordID(v10, v398, v399);
    v403 = objc_msgSend_zoneishKeyID(v10, v401, v402);
    v406 = objc_msgSend_zoneishPublicKeyID(v6, v404, v405);
    *(_DWORD *)buf = 138412802;
    uint64_t v473 = (uint64_t)v400;
    __int16 v474 = 2112;
    id v475 = v403;
    __int16 v476 = 2112;
    v477 = v406;
    _os_log_impl(&dword_1C4CFF000, v397, OS_LOG_TYPE_INFO, "Setting zoneishKeyID on record %@ from %@ to %@", buf, 0x20u);

    self = v460;
  }

  v409 = objc_msgSend_zoneishPublicKeyID(v6, v407, v408);
  objc_msgSend_setZoneishKeyID_(v10, v410, (uint64_t)v409);

  if (!*MEMORY[0x1E4F1A4E0]) {
    goto LABEL_165;
  }
  v412 = objc_msgSend_unitTestOverrides(v15, v395, v411);
  v414 = objc_msgSend_objectForKeyedSubscript_(v412, v413, @"TwoByteZoneishKeyIDs");

  if (v414)
  {
    v417 = objc_msgSend_zoneishKeyID(v10, v415, v416);
    v419 = objc_msgSend_subdataWithRange_(v417, v418, 0, 2);

    objc_msgSend_setZoneishKeyID_(v10, v420, (uint64_t)v419);
    id v421 = (id)*MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v421);
    }

    v422 = (id)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled(v422, OS_LOG_TYPE_INFO)) {
      goto LABEL_164;
    }
    v425 = objc_msgSend_recordID(v10, v423, v424);
    *(_DWORD *)buf = 138412546;
    uint64_t v473 = (uint64_t)v425;
    __int16 v474 = 2112;
    id v475 = v419;
LABEL_163:
    _os_log_impl(&dword_1C4CFF000, v422, OS_LOG_TYPE_INFO, "Setting zoneishKeyID on record %@ to %@", buf, 0x16u);

LABEL_164:
    goto LABEL_165;
  }
  v427 = objc_msgSend_unitTestOverrides(v15, v415, v416);
  v429 = objc_msgSend_objectForKeyedSubscript_(v427, v428, @"ZoneishKeyIDWithOnlyTwoValidBytes");

  if (v429)
  {
    v432 = objc_msgSend_zoneishKeyID(v10, v430, v431);
    v434 = objc_msgSend_subdataWithRange_(v432, v433, 0, 2);
    v419 = objc_msgSend_mutableCopy(v434, v435, v436);

    LOWORD(v461) = -21846;
    objc_msgSend_appendBytes_length_(v419, v437, (uint64_t)&v461, 2);
    objc_msgSend_setZoneishKeyID_(v10, v438, (uint64_t)v419);
    id v439 = (id)*MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v439);
    }

    v422 = (id)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled(v422, OS_LOG_TYPE_INFO)) {
      goto LABEL_164;
    }
    goto LABEL_162;
  }
  v443 = objc_msgSend_unitTestOverrides(v15, v430, v431);
  v445 = objc_msgSend_objectForKeyedSubscript_(v443, v444, @"RandomZoneishKeyID");

  if (v445)
  {
    int v461 = -1515870811;
    v419 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v395, (uint64_t)&v461, 4);
    objc_msgSend_setZoneishKeyID_(v10, v446, (uint64_t)v419);
    id v447 = (id)*MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v447);
    }

    v422 = (id)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled(v422, OS_LOG_TYPE_INFO)) {
      goto LABEL_164;
    }
LABEL_162:
    v425 = objc_msgSend_recordID(v10, v440, v441);
    *(_DWORD *)buf = 138412546;
    uint64_t v473 = (uint64_t)v425;
    __int16 v474 = 2112;
    id v475 = v419;
    goto LABEL_163;
  }
LABEL_165:
  objc_msgSend_setRecordPCSData_(self, v395, (uint64_t)v6);
LABEL_166:

  id v18 = (id *)MEMORY[0x1E4F1A500];
LABEL_167:
  v448 = objc_msgSend_protectionData(v10, v32, v33);

  if (v448)
  {
    objc_msgSend_setState_(self, v449, 3);
    goto LABEL_7;
  }
  id v7 = 0;
  id v17 = (void *)MEMORY[0x1E4F1A550];
  id v16 = (id *)MEMORY[0x1E4F1A548];
LABEL_2:
  id v19 = *v16;
  if (*v17 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v19);
  }

  id v20 = *v18;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v23 = objc_msgSend_recordID(v10, v21, v22);
    *(_DWORD *)buf = 138412546;
    uint64_t v473 = (uint64_t)v23;
    __int16 v474 = 2112;
    id v475 = v7;
    _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Warn: Couldn't get PCS data for record %@: %@", buf, 0x16u);
  }
  objc_msgSend_setState_(self, v24, 12);
  objc_msgSend_setError_(self, v25, (uint64_t)v7);

LABEL_7:
  uint64_t v28 = objc_msgSend_pcsGroup(self, v26, v27);
  dispatch_group_leave(v28);

  uint64_t v31 = objc_msgSend_stateTransitionGroup(v15, v29, v30);
  dispatch_group_leave(v31);
}

- (void)fetchSharePCSData
{
  if (objc_msgSend_state(self, a2, v2) != 1)
  {
    id v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1334, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyRecordHandler fetchSharePCSData]", self, "CKDModifyRecordHandlerStateNeedSharePCSData");
  }
  objc_msgSend_setState_(self, v5, 3);
}

- (id)assetsWhichNeedRecordFetch
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_record(self, a2, v2);
  if (v6)
  {
    id v7 = objc_msgSend_record(self, v4, v5);
    BOOL v10 = objc_msgSend_recordID(v7, v8, v9);

    if (v10)
    {
      uint64_t v6 = objc_opt_new();
      id v13 = objc_msgSend_record(self, v11, v12);
      id v60 = objc_msgSend_operation(self, v14, v15);
      if (objc_msgSend_savePolicy(v60, v16, v17) == 2) {
        objc_msgSend_allKeys(v13, v18, v19);
      }
      else {
        objc_msgSend_changedKeys(v13, v18, v19);
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v72, v77, 16);
      if (v64)
      {
        uint64_t v23 = *(void *)v73;
        id v62 = v13;
        uint64_t v63 = *(void *)v73;
        id v61 = v20;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v73 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v72 + 1) + 8 * v24);
            uint64_t v26 = objc_msgSend_objectForKey_(v13, v22, v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v65 = v26;
              uint64_t v66 = v24;
              id v27 = v26;
              if (objc_msgSend_isReference(v27, v28, v29))
              {
                uint64_t v32 = objc_msgSend_assetRereferenceInfo(v27, v30, v31);
                objc_msgSend_setDestinationFieldName_(v32, v33, v25);

                uint64_t v23 = v63;
                goto LABEL_17;
              }
              goto LABEL_18;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v65 = v26;
              uint64_t v66 = v24;
              id v27 = v26;
              if (objc_msgSend_isReference(v27, v35, v36)) {
LABEL_17:
              }
                objc_msgSend_addObject_(v6, v34, (uint64_t)v27);
LABEL_18:
              uint64_t v26 = v65;

              uint64_t v24 = v66;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v65 = v26;
              uint64_t v66 = v24;
              id v37 = v26;
              uint64_t v40 = objc_msgSend_firstObject(v37, v38, v39);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              uint64_t v23 = v63;
              if (isKindOfClass)
              {
                long long v70 = 0u;
                long long v71 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                id v42 = v37;
                uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v68, v76, 16);
                if (v44)
                {
                  uint64_t v45 = v44;
                  uint64_t v46 = *(void *)v69;
                  do
                  {
                    for (uint64_t i = 0; i != v45; ++i)
                    {
                      if (*(void *)v69 != v46) {
                        objc_enumerationMutation(v42);
                      }
                      id v48 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        uint64_t v51 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v49, v50);
                        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v51, v52, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1368, @"first element of asset array is not a CKAsset");
                      }
                      if (objc_msgSend_isReference(v48, v49, v50))
                      {
                        uint64_t v55 = objc_msgSend_assetRereferenceInfo(v48, v53, v54);
                        objc_msgSend_setDestinationFieldName_(v55, v56, v25);

                        objc_msgSend_addObject_(v6, v57, (uint64_t)v48);
                      }
                    }
                    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v53, (uint64_t)&v68, v76, 16);
                  }
                  while (v45);
                }

                id v20 = v61;
                id v13 = v62;
                uint64_t v23 = v63;
              }
              goto LABEL_18;
            }
LABEL_19:

            ++v24;
          }
          while (v24 != v64);
          uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v72, v77, 16);
          uint64_t v64 = v58;
        }
        while (v58);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)prepareAssetsForUploadWithError:(id *)a3
{
  v3 = a3;
  uint64_t v287 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, (uint64_t)a3) != 4)
  {
    v189 = v3;
    v190 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v190, v191, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1385, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyRecordHandler prepareAssetsForUploadWithError:]", self, "CKDModifyRecordHandlerStateNeedAssetUpload");

    v3 = v189;
  }
  if (objc_msgSend_isDelete(self, v6, v7))
  {
    objc_msgSend_setState_(self, v8, 5);
    id v9 = 0;
    goto LABEL_144;
  }
  id v201 = v3;
  BOOL v10 = objc_opt_new();
  uint64_t v209 = self;
  id v13 = objc_msgSend_record(self, v11, v12);
  id v16 = objc_msgSend_record(v209, v14, v15);

  if (!v16)
  {
    v192 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v192, v193, (uint64_t)a2, v209);
  }
  id v202 = objc_msgSend_recordID(v13, v17, v18);
  if (!v202)
  {
    v194 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v194, v195, (uint64_t)a2, v209, @"CKDModifyRecordHandler.m", 1395, @"Expected non-nil recordID for %@", v13);
  }
  id v21 = objc_msgSend_operation(v209, v19, v20);
  uint64_t v272 = 0;
  v273 = &v272;
  uint64_t v274 = 0x2020000000;
  char v275 = 0;
  uint64_t v268 = 0;
  v269 = &v268;
  uint64_t v270 = 0x2020000000;
  char v271 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4EDEDB0;
  aBlock[3] = &unk_1E64F5348;
  aBlock[4] = v209;
  id v210 = v13;
  id v263 = v210;
  id v203 = v21;
  id v264 = v203;
  v266 = &v268;
  id v200 = v10;
  id v265 = v200;
  v267 = &v272;
  uint64_t v22 = (uint64_t (**)(void *, id, uint64_t, void))_Block_copy(aBlock);
  if (objc_msgSend_savePolicy(v203, v23, v24) == 2) {
    objc_msgSend_allKeys(v210, v25, v26);
  }
  else {
    objc_msgSend_changedKeys(v210, v25, v26);
  }
  long long v260 = 0u;
  long long v261 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v258, v286, 16);
  if (v205)
  {
    uint64_t v206 = *(void *)v259;
    uint64_t v199 = *MEMORY[0x1E4F19DD8];
    do
    {
      uint64_t v207 = 0;
      do
      {
        if (*(void *)v259 != v206) {
          objc_enumerationMutation(obj);
        }
        uint64_t v217 = *(void *)(*((void *)&v258 + 1) + 8 * v207);
        uint64_t v29 = objc_msgSend_objectForKey_(v210, v28, v217);
        uint64_t v32 = v29;
        if (v29)
        {
          id v208 = v29;
        }
        else
        {
          uint64_t v33 = objc_msgSend_encryptedValues(v210, v30, v31);
          objc_msgSend_objectForKeyedSubscript_(v33, v34, v217);
          id v208 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((v22[2](v22, v208, v217, 0) & 1) == 0) {
            goto LABEL_130;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v35 = v208;
            if (objc_msgSend_isReference(v35, v36, v37))
            {
              long long v256 = 0u;
              long long v257 = 0u;
              long long v254 = 0u;
              long long v255 = 0u;
              uint64_t v40 = objc_msgSend_assets(v35, v38, v39);
              uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v254, v285, 16);
              id v212 = v40;
              if (v42)
              {
                uint64_t v43 = *(void *)v255;
                while (2)
                {
                  for (uint64_t i = 0; i != v42; ++i)
                  {
                    if (*(void *)v255 != v43) {
                      objc_enumerationMutation(v212);
                    }
                    if ((v22[2](v22, *(id *)(*((void *)&v254 + 1) + 8 * i), v217, 0) & 1) == 0)
                    {

                      goto LABEL_129;
                    }
                  }
                  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v45, (uint64_t)&v254, v285, 16);
                  if (v42) {
                    continue;
                  }
                  break;
                }
              }
              goto LABEL_64;
            }
            if ((v22[2](v22, v35, v217, 0) & 1) == 0) {
              goto LABEL_129;
            }
            goto LABEL_65;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_prepareStreamingAsset_forUploadWithRecord_(v209, v46, (uint64_t)v208, v210);
            goto LABEL_66;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v47 = v208;
            long long v250 = 0u;
            long long v251 = 0u;
            long long v252 = 0u;
            long long v253 = 0u;
            uint64_t v50 = objc_msgSend_deltasToSave(v47, v48, v49);
            uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v250, v284, 16);
            if (v54)
            {
              uint64_t v55 = *(void *)v251;
LABEL_41:
              uint64_t v56 = 0;
              while (1)
              {
                if (*(void *)v251 != v55) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v57 = *(void **)(*((void *)&v250 + 1) + 8 * v56);
                uint64_t v58 = objc_msgSend_asset(v57, v52, v53);
                if (v58)
                {
                  int v59 = objc_msgSend_asset(v57, v52, v53);
                  id v62 = objc_msgSend_deltaID(v57, v60, v61);
                  char v63 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v59, v217, v62);

                  if ((v63 & 1) == 0) {
                    break;
                  }
                }
                if (v54 == ++v56)
                {
                  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v52, (uint64_t)&v250, v284, 16);
                  if (v54) {
                    goto LABEL_41;
                  }
                  break;
                }
              }
            }

            long long v248 = 0u;
            long long v249 = 0u;
            long long v246 = 0u;
            long long v247 = 0u;
            uint64_t v66 = objc_msgSend_pendingReplacementRequests(v47, v64, v65);
            uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v246, v283, 16);
            id v212 = v66;
            if (v68)
            {
              uint64_t v213 = *(void *)v247;
              do
              {
                uint64_t v215 = v68;
                for (uint64_t j = 0; j != v215; ++j)
                {
                  if (*(void *)v247 != v213) {
                    objc_enumerationMutation(v212);
                  }
                  long long v72 = *(void **)(*((void *)&v246 + 1) + 8 * j);
                  long long v242 = 0u;
                  long long v243 = 0u;
                  long long v244 = 0u;
                  long long v245 = 0u;
                  long long v73 = objc_msgSend_replacementDeltas(v72, v69, v70);
                  uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v242, v282, 16);
                  if (v77)
                  {
                    uint64_t v78 = *(void *)v243;
LABEL_55:
                    uint64_t v79 = 0;
                    while (1)
                    {
                      if (*(void *)v243 != v78) {
                        objc_enumerationMutation(v73);
                      }
                      uint64_t v80 = *(void **)(*((void *)&v242 + 1) + 8 * v79);
                      uint64_t v81 = objc_msgSend_asset(v80, v75, v76);
                      if (v81)
                      {
                        uint64_t v82 = objc_msgSend_asset(v80, v75, v76);
                        uint64_t v85 = objc_msgSend_deltaID(v80, v83, v84);
                        char v86 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v82, v217, v85);

                        if ((v86 & 1) == 0) {
                          break;
                        }
                      }
                      if (v77 == ++v79)
                      {
                        uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v75, (uint64_t)&v242, v282, 16);
                        if (v77) {
                          goto LABEL_55;
                        }
                        break;
                      }
                    }
                  }
                }
                uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v69, (uint64_t)&v246, v283, 16);
              }
              while (v68);
            }
            goto LABEL_64;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v87 = v208;
            id v90 = objc_msgSend_firstObject(v87, v88, v89);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              long long v240 = 0u;
              long long v241 = 0u;
              long long v238 = 0u;
              long long v239 = 0u;
              id v94 = v87;
              uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v238, v281, 16);
              if (v96)
              {
                uint64_t v97 = 0;
                uint64_t v98 = *(void *)v239;
                while (2)
                {
                  for (uint64_t k = 0; k != v96; ++k)
                  {
                    if (*(void *)v239 != v98) {
                      objc_enumerationMutation(v94);
                    }
                    uint64_t v100 = *(void **)(*((void *)&v238 + 1) + 8 * k);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_msgSend_setState_(v209, v101, 12);
                      v156 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v155, v199, 1007, @"Invalid list of heterogenous values for field name %@ in recordID %@", v217, v202);
                      objc_msgSend_setError_(v209, v157, (uint64_t)v156);

                      *((unsigned char *)v273 + 24) = 1;
                      goto LABEL_124;
                    }
                    objc_msgSend_setArrayIndex_(v100, v101, v97 + k);
                    if (!v22[2](v22, v100, v217, 0)) {
                      goto LABEL_124;
                    }
                  }
                  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v102, (uint64_t)&v238, v281, 16);
                  v97 += k;
                  if (v96) {
                    continue;
                  }
                  break;
                }
              }
LABEL_124:

              uint64_t v160 = objc_msgSend_error(v209, v158, v159);

              if (v160)
              {
LABEL_129:

LABEL_130:
                goto LABEL_131;
              }
            }
            else
            {
              uint64_t v103 = objc_msgSend_firstObject(v87, v92, v93);
              objc_opt_class();
              char v104 = objc_opt_isKindOfClass();

              if (v104)
              {
                long long v236 = 0u;
                long long v237 = 0u;
                long long v234 = 0u;
                long long v235 = 0u;
                id v212 = v87;
                uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v107, (uint64_t)&v234, v280, 16);
                if (v109)
                {
                  uint64_t v110 = *(void *)v235;
                  do
                  {
                    for (uint64_t m = 0; m != v109; ++m)
                    {
                      if (*(void *)v235 != v110) {
                        objc_enumerationMutation(v212);
                      }
                      objc_msgSend_prepareStreamingAsset_forUploadWithRecord_(v209, v108, *(void *)(*((void *)&v234 + 1) + 8 * m), v210);
                    }
                    uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v108, (uint64_t)&v234, v280, 16);
                  }
                  while (v109);
                }
                goto LABEL_64;
              }
              uint64_t v112 = objc_msgSend_firstObject(v87, v105, v106);
              objc_opt_class();
              char v113 = objc_opt_isKindOfClass();

              if (v113)
              {
                long long v232 = 0u;
                long long v233 = 0u;
                long long v230 = 0u;
                long long v231 = 0u;
                id v212 = v87;
                uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v114, (uint64_t)&v230, v279, 16);
                if (v196)
                {
                  uint64_t v197 = *(void *)v231;
                  do
                  {
                    for (uint64_t n = 0; n != v196; ++n)
                    {
                      if (*(void *)v231 != v197) {
                        objc_enumerationMutation(v212);
                      }
                      uint64_t v117 = *(void **)(*((void *)&v230 + 1) + 8 * n);
                      long long v226 = 0u;
                      long long v227 = 0u;
                      long long v228 = 0u;
                      long long v229 = 0u;
                      v118 = objc_msgSend_deltasToSave(v117, v115, v116);
                      uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v119, (uint64_t)&v226, v278, 16);
                      if (v122)
                      {
                        uint64_t v123 = *(void *)v227;
LABEL_97:
                        uint64_t v124 = 0;
                        while (1)
                        {
                          if (*(void *)v227 != v123) {
                            objc_enumerationMutation(v118);
                          }
                          uint64_t v125 = *(void **)(*((void *)&v226 + 1) + 8 * v124);
                          uint64_t v126 = objc_msgSend_asset(v125, v120, v121);
                          if (v126)
                          {
                            v127 = objc_msgSend_asset(v125, v120, v121);
                            v130 = objc_msgSend_deltaID(v125, v128, v129);
                            char v131 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v127, v217, v130);

                            if ((v131 & 1) == 0) {
                              break;
                            }
                          }
                          if (v122 == ++v124)
                          {
                            uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v120, (uint64_t)&v226, v278, 16);
                            if (v122) {
                              goto LABEL_97;
                            }
                            break;
                          }
                        }
                      }

                      long long v224 = 0u;
                      long long v225 = 0u;
                      long long v222 = 0u;
                      long long v223 = 0u;
                      v134 = objc_msgSend_pendingReplacementRequests(v117, v132, v133);
                      uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v222, v277, 16);
                      if (v136)
                      {
                        uint64_t v214 = *(void *)v223;
                        id v211 = v134;
                        do
                        {
                          uint64_t v216 = v136;
                          for (iuint64_t i = 0; ii != v216; ++ii)
                          {
                            if (*(void *)v223 != v214) {
                              objc_enumerationMutation(v211);
                            }
                            uint64_t v140 = *(void **)(*((void *)&v222 + 1) + 8 * ii);
                            long long v218 = 0u;
                            long long v219 = 0u;
                            long long v220 = 0u;
                            long long v221 = 0u;
                            uint64_t v141 = objc_msgSend_replacementDeltas(v140, v137, v138);
                            uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v142, (uint64_t)&v218, v276, 16);
                            if (v145)
                            {
                              uint64_t v146 = *(void *)v219;
LABEL_111:
                              uint64_t v147 = 0;
                              while (1)
                              {
                                if (*(void *)v219 != v146) {
                                  objc_enumerationMutation(v141);
                                }
                                id v148 = *(void **)(*((void *)&v218 + 1) + 8 * v147);
                                v149 = objc_msgSend_asset(v148, v143, v144);
                                if (v149)
                                {
                                  BOOL v150 = objc_msgSend_asset(v148, v143, v144);
                                  v153 = objc_msgSend_deltaID(v148, v151, v152);
                                  char v154 = ((uint64_t (**)(void *, id, uint64_t, void *))v22)[2](v22, v150, v217, v153);

                                  if ((v154 & 1) == 0) {
                                    break;
                                  }
                                }
                                if (v145 == ++v147)
                                {
                                  uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v143, (uint64_t)&v218, v276, 16);
                                  if (v145) {
                                    goto LABEL_111;
                                  }
                                  break;
                                }
                              }
                            }
                          }
                          v134 = v211;
                          uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v211, v137, (uint64_t)&v222, v277, 16);
                        }
                        while (v136);
                      }
                    }
                    uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v212, v115, (uint64_t)&v230, v279, 16);
                  }
                  while (v196);
                }
LABEL_64:
              }
            }
LABEL_65:
          }
        }
LABEL_66:

        ++v207;
      }
      while (v207 != v205);
      uint64_t v161 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v258, v286, 16);
      uint64_t v205 = v161;
    }
    while (v161);
  }
LABEL_131:

  if (!*((unsigned char *)v269 + 24))
  {
    v185 = objc_msgSend_error(v209, v162, v163);
    BOOL v186 = v185 == 0;

    if (v186) {
      objc_msgSend_setState_(v209, v169, 5);
    }
    goto LABEL_138;
  }
  uint64_t v166 = objc_msgSend_progressTracker(v209, v162, v163);
  if (v166) {
    goto LABEL_135;
  }
  id v167 = objc_msgSend_saveProgressBlock(v203, v164, v165);
  BOOL v168 = v167 == 0;

  if (!v168)
  {
    id v171 = [NSString alloc];
    v174 = objc_msgSend_recordID(v209, v172, v173);
    uint64_t v177 = objc_msgSend_recordName(v174, v175, v176);
    uint64_t v166 = objc_msgSend_initWithFormat_(v171, v178, @"up|%@", v177);

    uint64_t v179 = [CKDProgressTracker alloc];
    uint64_t v181 = objc_msgSend_initWithTrackingID_(v179, v180, (uint64_t)v166);
    objc_msgSend_setLastItemPercentage_(v181, v182, v183, 0.01);
    objc_msgSend_setProgressTracker_(v209, v184, (uint64_t)v181);

LABEL_135:
  }
LABEL_138:
  if (*((unsigned char *)v273 + 24))
  {
    if (v201)
    {
      objc_msgSend_error(v209, v169, v170);
      *id v201 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v187 = 0;
  }
  else
  {
    uint64_t v187 = v200;
  }
  id v9 = v187;

  _Block_object_dispose(&v268, 8);
  _Block_object_dispose(&v272, 8);

LABEL_144:
  return v9;
}

- (BOOL)_prepareAsset:(id)a3 recordKey:(id)a4 mergeableDeltaID:(id)a5 record:(id)a6 error:(id *)a7
{
  uint64_t v245 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v18 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v198 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v198, v199, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1534, @"Expected non-nil recordKey for %@", 0);

    if (v14) {
      goto LABEL_3;
    }
  }
  id v200 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v200, v201, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1535, @"Expected non-nil recordKey for %@", v13);

LABEL_3:
  uint64_t v19 = objc_msgSend_operation(self, v16, v17);
  int v22 = objc_msgSend_useEncryption(v19, v20, v21);
  int v25 = objc_msgSend_useClearAssetEncryption(v19, v23, v24);
  if (v15)
  {
    uint64_t v28 = objc_msgSend_valueID(v15, v26, v27);
    int isEncrypted = objc_msgSend_isEncrypted(v28, v29, v30);

    v22 &= isEncrypted;
    int v32 = 1;
  }
  else
  {
    int v32 = v25;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v34 = v13;
  objc_msgSend_setRecord_(v34, v35, (uint64_t)v18);
  objc_msgSend_setRecordKey_(v34, v36, (uint64_t)v14);
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend_setMergeableDeltaID_(v34, v37, (uint64_t)v15);
    if ((v22 | v32) == 1)
    {
      long long v230 = v19;
      if (v22
        && (objc_msgSend_wrappedAssetKey(v34, v46, v47),
            id v48 = objc_claimAutoreleasedReturnValue(),
            v48,
            v48))
      {
        long long v228 = a7;
        uint64_t v49 = objc_msgSend_recordPCS(v18, v46, v47);
        uint64_t v50 = [CKDWrappingContext alloc];
        uint64_t v53 = objc_msgSend_recordID(v18, v51, v52);
        uint64_t v56 = objc_msgSend_signature(v34, v54, v55);
        int v59 = objc_msgSend_referenceSignature(v34, v57, v58);
        uint64_t v61 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v50, v60, (uint64_t)v53, v14, v15, v56, v59);

        uint64_t v64 = objc_msgSend_pcsManager(self, v62, v63);
        uint64_t v67 = objc_msgSend_wrappedAssetKey(v34, v65, v66);
        id v234 = 0;
        long long v69 = objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v64, v68, (uint64_t)v67, v49, v61, &v234);
        id v44 = v234;
        objc_msgSend_setAssetKey_(v34, v70, (uint64_t)v69);

        long long v73 = objc_msgSend_assetKey(v34, v71, v72);

        if (!v73)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          long long v74 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v241 = v34;
            __int16 v242 = 2112;
            id v243 = v44;
            _os_log_debug_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_DEBUG, "Couldn't unwrap asset key for asset %@: %@. Wrapping a new asset key and re-saving the asset.", buf, 0x16u);
          }
          objc_msgSend_setWrappedAssetKey_(v34, v75, 0);
          objc_msgSend_setAssetKey_(v34, v76, 0);
          objc_msgSend_setUploaded_(v34, v77, 0);
          objc_msgSend_setUploadReceipt_(v34, v78, 0);
          objc_msgSend_setUploadReceiptExpiration_(v34, v79, v80, 0.0);
        }

        a7 = v228;
      }
      else
      {
        if (v32)
        {
          id v95 = objc_msgSend_clearAssetKey(v34, v46, v47);

          if (v95)
          {
            uint64_t v96 = objc_msgSend_clearAssetKey(v34, v46, v47);
            objc_msgSend_setAssetKey_(v34, v97, (uint64_t)v96);
          }
        }
        id v44 = 0;
      }
      uint64_t v98 = objc_msgSend_assetKey(v34, v46, v47);

      if (!v98)
      {
        uint64_t v99 = a7;

        id v102 = objc_msgSend_assetUUIDToExpectedProperties(self, v100, v101);
        uint64_t v105 = objc_msgSend_UUID(v34, v103, v104);
        __int16 v107 = objc_msgSend_objectForKeyedSubscript_(v102, v106, (uint64_t)v105);
        uint64_t v110 = objc_msgSend_assetKey(v107, v108, v109);

        if (v110)
        {
          objc_msgSend_setAssetKey_(v34, v111, (uint64_t)v110);
          id v44 = 0;
          v115 = v99;
        }
        else
        {
          uint64_t v162 = objc_msgSend_container(v230, v111, v112);
          uint64_t v165 = objc_msgSend_options(v162, v163, v164);
          uint64_t v168 = objc_msgSend_mmcsEncryptionSupport(v165, v166, v167);

          v115 = v99;
          if (v168 == 1) {
            goto LABEL_66;
          }
          if (v168 == 2) {
            goto LABEL_65;
          }
          if (v168 != 3)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              goto LABEL_95;
            }
            while (1)
            {
              id v202 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                uint64_t v205 = v202;
                id v208 = objc_msgSend_container(v230, v206, v207);
                id v211 = objc_msgSend_options(v208, v209, v210);
                int v214 = objc_msgSend_mmcsEncryptionSupport(v211, v212, v213);
                *(_DWORD *)buf = 67109120;
                LODWORD(v241) = v214;
                _os_log_error_impl(&dword_1C4CFF000, v205, OS_LOG_TYPE_ERROR, "Unexpected MMCSEncryptionSupportValue of 0x%x", buf, 8u);
              }
              uint64_t v215 = NSString;
              uint64_t v216 = objc_msgSend_container(v230, v203, v204);
              long long v219 = objc_msgSend_options(v216, v217, v218);
              uint64_t v222 = objc_msgSend_mmcsEncryptionSupport(v219, v220, v221);
              long long v224 = objc_msgSend_stringWithFormat_(v215, v223, @"Unexpected MMCSEncryptionSupportValue of 0x%x", v222);

              objc_msgSend_UTF8String(v224, v225, v226);
              _os_crash();
              __break(1u);
LABEL_95:
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
          }
          if (objc_msgSend_useMMCSEncryptionV2(v34, v169, v170))
          {
LABEL_65:
            long long v233 = 0;
            id v171 = objc_msgSend_assetKeyWithType_error_(CKDMMCS, v169, 1, &v233);
            v172 = v233;
          }
          else
          {
LABEL_66:
            long long v232 = 0;
            id v171 = objc_msgSend_assetKeyWithType_error_(CKDMMCS, v169, 0, &v232);
            v172 = v232;
          }
          id v44 = v172;
          objc_msgSend_setAssetKey_(v34, v173, (uint64_t)v171);
        }
        v174 = objc_msgSend_assetKey(v34, v113, v114);

        if (!v174 || v44)
        {
          if (v115) {
            id *v115 = v44;
          }
          uint64_t v19 = v230;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v188 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v241 = v44;
            _os_log_error_impl(&dword_1C4CFF000, v188, OS_LOG_TYPE_ERROR, "Couldn't create an asset key: %@", buf, 0xCu);
          }
          BOOL v45 = 0;
LABEL_85:

          goto LABEL_88;
        }
        uint64_t v177 = objc_msgSend_assetUUIDToExpectedProperties(self, v175, v176);
        char v180 = objc_msgSend_UUID(v34, v178, v179);
        v182 = objc_msgSend_objectForKeyedSubscript_(v177, v181, (uint64_t)v180);
        v185 = objc_msgSend_referenceSignature(v182, v183, v184);

        if (v185)
        {
          objc_msgSend_setReferenceSignature_(v34, v186, (uint64_t)v185);
        }
        else
        {
          v189 = objc_msgSend_assetKey(v34, v186, v187);
          v191 = objc_msgSend_referenceSignatureFromAssetKey_(CKDMMCS, v190, (uint64_t)v189);
          objc_msgSend_setReferenceSignature_(v34, v192, (uint64_t)v191);
        }
        id v44 = 0;
      }
      uint64_t v19 = v230;
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v92 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v241 = v34;
        _os_log_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_INFO, "Skipping unwrapping of asset key for %@ because encryption is disabled", buf, 0xCu);
      }
      id v44 = 0;
    }
    if (!objc_msgSend_uploaded(v34, v93, v94))
    {
      BOOL v45 = 1;
      goto LABEL_88;
    }
    if (!objc_msgSend_paddedFileSize(v34, v193, v194))
    {
      BOOL v45 = 0;
      goto LABEL_88;
    }
    uint64_t v110 = objc_msgSend_uploadReceipt(v34, v195, v196);
    BOOL v45 = v110 == 0;
    goto LABEL_85;
  }
  if (!objc_msgSend_isReference(v34, v37, v38))
  {
    if (v22)
    {
      uint64_t v227 = objc_msgSend_recordPCS(v18, v39, v40);
      id v83 = objc_msgSend_assets(v34, v81, v82);
      long long v229 = a7;
      if (objc_msgSend_count(v83, v84, v85))
      {
        id v88 = objc_msgSend_assets(v34, v86, v87);
        uint64_t v91 = objc_msgSend_firstObject(v88, v89, v90);
      }
      else
      {
        uint64_t v91 = 0;
      }

      objc_msgSend_wrappedAssetKey(v91, v131, v132);
      id v44 = (id)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        long long v231 = v19;
        v134 = [CKDWrappingContext alloc];
        v137 = objc_msgSend_recordID(v18, v135, v136);
        uint64_t v140 = objc_msgSend_signature(v91, v138, v139);
        v143 = objc_msgSend_referenceSignature(v91, v141, v142);
        uint64_t v145 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v134, v144, (uint64_t)v137, v14, 0, v140, v143);

        id v148 = objc_msgSend_pcsManager(self, v146, v147);
        uint64_t v151 = objc_msgSend_wrappedAssetKey(v91, v149, v150);
        id v235 = 0;
        uint64_t v152 = (void *)v145;
        char v154 = objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v148, v153, (uint64_t)v151, v227, v145, &v235);
        id v44 = v235;
        objc_msgSend_setAssetKey_(v91, v155, (uint64_t)v154);

        v158 = objc_msgSend_assetKey(v91, v156, v157);

        a7 = v229;
        if (!v158)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v159 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v241 = v91;
            __int16 v242 = 2112;
            id v243 = v44;
            _os_log_debug_impl(&dword_1C4CFF000, v159, OS_LOG_TYPE_DEBUG, "Couldn't unwrap asset key for the package manifest asset %@: %@", buf, 0x16u);
          }
          objc_msgSend_setAssets_(v34, v160, 0);
        }

        uint64_t v19 = v231;
      }
      objc_msgSend_setRecordPCS_(v34, v133, v227);
    }
    else
    {
      if (!v32)
      {
        id v44 = 0;
LABEL_60:
        uint64_t v161 = objc_msgSend_assets(v34, v39, v40);
        BOOL v45 = v161 == 0;

        goto LABEL_88;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v39, *MEMORY[0x1E4F19DD8], 1017, @"Packages not supported with clear asset encryption.");
      id v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a7 && v44)
    {
      id v44 = v44;
      *a7 = v44;
    }
    goto LABEL_60;
  }
  id v41 = objc_msgSend_error(self, v39, v40);

  if (a7 && v41)
  {
    objc_msgSend_error(self, v42, v43);
    id v44 = 0;
    BOOL v45 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v116 = v19;
    long long v238 = 0u;
    long long v239 = 0u;
    long long v236 = 0u;
    long long v237 = 0u;
    uint64_t v117 = objc_msgSend_assets(v34, v42, v43);
    uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v118, (uint64_t)&v236, v244, 16);
    if (v119)
    {
      uint64_t v121 = v119;
      uint64_t v122 = *(void *)v237;
      do
      {
        for (uint64_t i = 0; i != v121; ++i)
        {
          if (*(void *)v237 != v122) {
            objc_enumerationMutation(v117);
          }
          uint64_t v124 = *(void **)(*((void *)&v236 + 1) + 8 * i);
          objc_msgSend_setRecord_(v124, v120, (uint64_t)v18);
          objc_msgSend_setRecordKey_(v124, v125, (uint64_t)v14);
        }
        uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v120, (uint64_t)&v236, v244, 16);
      }
      while (v121);
    }

    uint64_t v128 = objc_msgSend_assets(v34, v126, v127);
    BOOL v45 = objc_msgSend_count(v128, v129, v130) != 0;

    id v44 = 0;
    uint64_t v19 = v116;
  }
LABEL_88:

  return v45;
}

- (void)prepareStreamingAsset:(id)a3 forUploadWithRecord:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = objc_msgSend_operation(self, v8, v9);
  id v13 = objc_msgSend_recordID(v7, v11, v12);
  id v16 = objc_msgSend_zoneID(v13, v14, v15);
  uint64_t v19 = objc_msgSend_ownerName(v16, v17, v18);
  int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x1E4F19C08]);

  if (isEqualToString)
  {
    uint64_t v24 = objc_msgSend_container(v10, v22, v23);
    uint64_t v27 = objc_msgSend_containerScopedUserID(v24, v25, v26);
    objc_msgSend_setOwner_(v6, v28, (uint64_t)v27);
  }
  else
  {
    uint64_t v24 = objc_msgSend_recordID(v7, v22, v23);
    uint64_t v27 = objc_msgSend_zoneID(v24, v29, v30);
    uint64_t v33 = objc_msgSend_ownerName(v27, v31, v32);
    objc_msgSend_setOwner_(v6, v34, (uint64_t)v33);
  }
  uint64_t v37 = objc_msgSend_referenceSignature(v6, v35, v36);

  if (!v37)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v40 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v51 = 138412290;
      id v52 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Generating new reference signature for streaming asset %@", (uint8_t *)&v51, 0xCu);
    }
    uint64_t v43 = objc_msgSend_signatureForStreamingAsset(MEMORY[0x1E4F1A3B8], v41, v42);
    objc_msgSend_setReferenceSignature_(v6, v44, (uint64_t)v43);
  }
  BOOL v45 = objc_msgSend_fileSignature(v6, v38, v39);

  if (!v45)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v46 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v51 = 138412290;
      id v52 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEBUG, "Generating new file signature for streaming asset %@", (uint8_t *)&v51, 0xCu);
    }
    uint64_t v49 = objc_msgSend_signatureForStreamingAsset(MEMORY[0x1E4F1A3B8], v47, v48);
    objc_msgSend_setFileSignature_(v6, v50, (uint64_t)v49);
  }
}

- (void)prepareForSaveWithCompletionHandler:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(void))a3;
  if (objc_msgSend_state(self, v6, v7) != 5)
  {
    id v60 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1680, @"%s called on handler %@ but it isn't in the state %s", "-[CKDModifyRecordHandler prepareForSaveWithCompletionHandler:]", self, "CKDModifyRecordHandlerStateNeedRecordPrepareForUpload");
  }
  if (objc_msgSend_isDelete(self, v8, v9)) {
    goto LABEL_21;
  }
  id v14 = objc_msgSend_record(self, v10, v11);
  if (!v14)
  {
    id v62 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, self, @"CKDModifyRecordHandler.m", 1685, @"Lost a record: %@", self);
  }
  uint64_t v15 = objc_msgSend_operation(self, v12, v13);
  if (objc_msgSend_savePolicy(v15, v16, v17) == 2)
  {
    if ((objc_msgSend_hasEncryptedData(v14, v18, v19) & 1) == 0)
    {
LABEL_8:
      int v22 = 1;
      goto LABEL_15;
    }
  }
  else if (!objc_msgSend_hasModifiedEncryptedData(v14, v18, v19))
  {
    goto LABEL_8;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v23 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v25 = v23;
    uint64_t v28 = objc_msgSend_recordID(v14, v26, v27);
    *(_DWORD *)buf = 138412290;
    uint64_t v65 = v28;
    _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_INFO, "Record %@ has encrypted data. Wrapping that data now...", buf, 0xCu);
  }
  int v22 = objc_msgSend__wrapEncryptedDataOnRecord_(self, v24, (uint64_t)v14);
LABEL_15:
  if (objc_msgSend_databaseScope(v15, v20, v21) == 2)
  {
    uint64_t v31 = objc_msgSend_container(v15, v29, v30);
    id v34 = objc_msgSend_entitlements(v31, v32, v33);
    int hasNonLegacyShareURLEntitlement = objc_msgSend_hasNonLegacyShareURLEntitlement(v34, v35, v36);

    uint64_t v40 = objc_msgSend_container(v15, v38, v39);
    uint64_t v43 = objc_msgSend_account(v40, v41, v42);
    uint64_t v46 = v43;
    if (hasNonLegacyShareURLEntitlement) {
      objc_msgSend_sharingURLHostname(v43, v44, v45);
    }
    else {
    uint64_t v47 = objc_msgSend_displayedHostname(v43, v44, v45);
    }
    objc_msgSend_setDisplayedHostname_(v14, v48, (uint64_t)v47);
  }
  if (!v22)
  {
    objc_msgSend_setState_(self, v10, 12);
    uint64_t v49 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v50 = *MEMORY[0x1E4F19DD8];
    uint64_t v53 = objc_msgSend_record(self, v51, v52);
    uint64_t v56 = objc_msgSend_recordID(v53, v54, v55);
    uint64_t v58 = objc_msgSend_errorWithDomain_code_format_(v49, v57, v50, 5001, @"Couldn't encrypt data on record %@", v56);
    objc_msgSend_setError_(self, v59, (uint64_t)v58);

    goto LABEL_23;
  }
LABEL_21:
  objc_msgSend_setState_(self, v10, 6);
LABEL_23:
  v5[2](v5);
}

- (BOOL)_wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 forField:(id)a5 recordID:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v14 = a6;
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v15 = objc_msgSend_operation(self, v12, v13);
    uint64_t v18 = objc_msgSend_container(v15, v16, v17);
    uint64_t v21 = objc_msgSend_deviceContext(v18, v19, v20);
    uint64_t v24 = objc_msgSend_testDeviceReference(v21, v22, v23);
    if (v24)
    {
      uint64_t v26 = (void *)v24;
      int isEqualToString = objc_msgSend_isEqualToString_(v11, v25, @"EEEEEEEEEENCRYPTION_BREAKER");

      if (isEqualToString)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v28 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          int v45 = 138543362;
          id v46 = v11;
          _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Creating bad encrypted data for the field %{public}@. Let's hope you know what you're doing!", (uint8_t *)&v45, 0xCu);
        }
        uint64_t v30 = objc_msgSend_dataUsingEncoding_(@"🐔🐔🐔", v29, 4);
        objc_msgSend_setEncryptedData_(v10, v31, (uint64_t)v30);

        BOOL v32 = 1;
        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  uint64_t v33 = objc_msgSend_data(v10, v12, v13);

  if (v33)
  {
    id v34 = [CKDWrappingContext alloc];
    uint64_t v36 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v34, v35, (uint64_t)v14, v11, 0, 0, 0);
    uint64_t v39 = objc_msgSend_pcsManager(self, v37, v38);
    id v41 = objc_msgSend_wrapEncryptedData_withPCS_inContext_(v39, v40, (uint64_t)v10, a4, v36);

    BOOL v32 = v41 == 0;
    if (v41)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v42 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        int v45 = 138543618;
        id v46 = v11;
        __int16 v47 = 2112;
        uint64_t v48 = v41;
        _os_log_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_INFO, "Warn: Couldn't wrap encrypte data for field %{public}@: %@", (uint8_t *)&v45, 0x16u);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v43 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v45 = 138543362;
      id v46 = v11;
      _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "Warn: Can't wrap a nil encrypted data for field %{public}@", (uint8_t *)&v45, 0xCu);
    }
    BOOL v32 = 0;
  }
LABEL_22:

  return v32;
}

- (void)_pretendToWrapEncryptedDataForRecordValueStore:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = objc_msgSend_allKeys(v3, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v40, v45, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v41;
    id v34 = v6;
    id v35 = v3;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = objc_msgSend_rawValueForKey_(v3, v9, *(void *)(*((void *)&v40 + 1) + 8 * i), v34, v35);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_data(v13, v14, v15);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEncryptedData_(v13, v17, (uint64_t)v16);
LABEL_8:

          goto LABEL_20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (objc_msgSend_count(v13, v18, v19))
          {
            int v22 = objc_msgSend_firstObject(v13, v20, v21);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v16 = v13;
              uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v24, (uint64_t)&v36, v44, 16);
              if (v25)
              {
                uint64_t v28 = v25;
                uint64_t v29 = *(void *)v37;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v37 != v29) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v31 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                    BOOL v32 = objc_msgSend_data(v31, v26, v27);
                    objc_msgSend_setEncryptedData_(v31, v33, (uint64_t)v32);
                  }
                  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v26, (uint64_t)&v36, v44, 16);
                }
                while (v28);
                id v6 = v34;
                id v3 = v35;
              }
              goto LABEL_8;
            }
          }
        }
LABEL_20:
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v40, v45, 16);
    }
    while (v10);
  }
}

- (BOOL)_wrapEncryptedDataForRecordValueStore:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  objc_msgSend_allKeys(v5, v6, v7);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v50, v55, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v51;
    int v13 = 1;
    uint64_t v40 = *(void *)v51;
    do
    {
      uint64_t v14 = 0;
      uint64_t v41 = v11;
      do
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v50 + 1) + 8 * v14);
        id v16 = objc_msgSend_rawValueForKey_(v5, v10, v15, v40);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = objc_msgSend_recordID(v5, v17, v18);
          int v21 = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v20, (uint64_t)v16, a4, v15, v19);

          v13 &= v21;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v16, v22, v23))
          {
            uint64_t v43 = v14;
            uint64_t v26 = objc_msgSend_firstObject(v16, v24, v25);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              long long v48 = 0u;
              long long v49 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v42 = v16;
              id v28 = v16;
              uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v46, v54, 16);
              if (v30)
              {
                uint64_t v33 = v30;
                uint64_t v34 = *(void *)v47;
                do
                {
                  for (uint64_t i = 0; i != v33; ++i)
                  {
                    if (*(void *)v47 != v34) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v36 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                    long long v37 = objc_msgSend_recordID(v5, v31, v32);
                    LODWORD(v36) = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v38, v36, a4, v15, v37);

                    v13 &= v36;
                  }
                  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v46, v54, 16);
                }
                while (v33);
              }

              uint64_t v12 = v40;
              uint64_t v11 = v41;
              id v16 = v42;
              uint64_t v14 = v43;
            }
            else
            {
              uint64_t v14 = v43;
            }
          }
        }

        ++v14;
      }
      while (v14 != v11);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v50, v55, 16);
    }
    while (v11);
  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13 & 1;
}

- (BOOL)_encryptMergeableDeltasInRecordValueStore:(id)a3 shareProtection:(_OpaquePCSShareProtection *)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_operation(self, v7, v8);
  uint64_t v12 = objc_msgSend_container(v9, v10, v11);
  uint64_t v15 = objc_msgSend_options(v12, v13, v14);
  objc_msgSend_encryptMergeableValueMetadata(v15, v16, v17);

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  objc_msgSend_allKeys(v6, v18, v19);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v109, v120, 16);
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v110;
    char v94 = 1;
    uint64_t v83 = *(void *)v110;
    id v84 = v6;
    do
    {
      uint64_t v25 = 0;
      uint64_t v85 = v23;
      do
      {
        if (*(void *)v110 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = objc_msgSend_rawValueForKey_(v6, v22, *(void *)(*((void *)&v109 + 1) + 8 * v25));
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v87 = v26;
          uint64_t v88 = v25;
          id v27 = v26;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v89 = v27;
          uint64_t v30 = objc_msgSend_deltasToSave(v27, v28, v29);
          uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v105, v119, 16);
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v106;
            do
            {
              uint64_t v35 = 0;
              do
              {
                if (*(void *)v106 != v34) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v36 = *(void **)(*((void *)&v105 + 1) + 8 * v35);
                long long v37 = objc_alloc_init(CKDKeyEnvelopeContext);
                objc_msgSend_setShareProtection_(v37, v38, (uint64_t)a4);
                objc_msgSend_encryptMetadataTernary(v36, v39, v40);
                uint64_t v41 = CKBoolFromCKTernaryWithDefault();
                objc_msgSend_setEncryptMergeableValueMetadata_(v37, v42, v41);
                id v104 = 0;
                char v44 = objc_msgSend_encryptWithContext_error_(v36, v43, (uint64_t)v37, &v104);
                id v45 = v104;
                if ((v44 & 1) == 0)
                {
                  if (*MEMORY[0x1E4F1A550] != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  long long v46 = (void *)*MEMORY[0x1E4F1A500];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
                  {
                    long long v47 = v46;
                    objc_msgSend_valueID(v36, v48, v49);
                    v51 = uint64_t v50 = v34;
                    *(_DWORD *)buf = 138412546;
                    uint64_t v116 = v51;
                    __int16 v117 = 2112;
                    id v118 = v45;
                    _os_log_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_INFO, "Failed to encrypt mergeable delta %@, with error: %@", buf, 0x16u);

                    uint64_t v34 = v50;
                  }
                  char v94 = 0;
                }

                ++v35;
              }
              while (v33 != v35);
              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v52, (uint64_t)&v105, v119, 16);
            }
            while (v33);
          }

          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          objc_msgSend_pendingReplacementRequests(v89, v53, v54);
          id v90 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v55, (uint64_t)&v100, v114, 16);
          if (v92)
          {
            uint64_t v91 = *(void *)v101;
            do
            {
              uint64_t v58 = 0;
              do
              {
                if (*(void *)v101 != v91) {
                  objc_enumerationMutation(v90);
                }
                uint64_t v93 = v58;
                int v59 = *(void **)(*((void *)&v100 + 1) + 8 * v58);
                long long v96 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                id v60 = objc_msgSend_replacementDeltas(v59, v56, v57);
                uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v96, v113, 16);
                if (v62)
                {
                  uint64_t v63 = v62;
                  uint64_t v64 = *(void *)v97;
                  do
                  {
                    uint64_t v65 = 0;
                    do
                    {
                      if (*(void *)v97 != v64) {
                        objc_enumerationMutation(v60);
                      }
                      uint64_t v66 = *(void **)(*((void *)&v96 + 1) + 8 * v65);
                      uint64_t v67 = objc_alloc_init(CKDKeyEnvelopeContext);
                      objc_msgSend_setShareProtection_(v67, v68, (uint64_t)a4);
                      objc_msgSend_encryptMetadataTernary(v66, v69, v70);
                      uint64_t v71 = CKBoolFromCKTernaryWithDefault();
                      objc_msgSend_setEncryptMergeableValueMetadata_(v67, v72, v71);
                      id v95 = 0;
                      char v74 = objc_msgSend_encryptWithContext_error_(v66, v73, (uint64_t)v67, &v95);
                      id v75 = v95;
                      if ((v74 & 1) == 0)
                      {
                        if (*MEMORY[0x1E4F1A550] != -1) {
                          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                        }
                        uint64_t v76 = (void *)*MEMORY[0x1E4F1A500];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
                        {
                          uint64_t v77 = v76;
                          uint64_t v80 = objc_msgSend_valueID(v66, v78, v79);
                          *(_DWORD *)buf = 138412546;
                          uint64_t v116 = v80;
                          __int16 v117 = 2112;
                          id v118 = v75;
                          _os_log_impl(&dword_1C4CFF000, v77, OS_LOG_TYPE_INFO, "Failed to encrypt mergeable delta %@, with error: %@", buf, 0x16u);
                        }
                        char v94 = 0;
                      }

                      ++v65;
                    }
                    while (v63 != v65);
                    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v81, (uint64_t)&v96, v113, 16);
                  }
                  while (v63);
                }

                uint64_t v58 = v93 + 1;
              }
              while (v93 + 1 != v92);
              uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v56, (uint64_t)&v100, v114, 16);
            }
            while (v92);
          }

          uint64_t v24 = v83;
          id v6 = v84;
          uint64_t v23 = v85;
          uint64_t v26 = v87;
          uint64_t v25 = v88;
        }

        ++v25;
      }
      while (v25 != v23);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v109, v120, 16);
    }
    while (v23);
  }
  else
  {
    char v94 = 1;
  }

  return v94 & 1;
}

- (BOOL)_wrapEncryptedDataOnRecord:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_operation(self, v5, v6);
  char v10 = objc_msgSend_useEncryption(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_recordPCS(v4, v11, v12);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = objc_msgSend_valueStore(v4, v14, v15);
      int v19 = objc_msgSend__wrapEncryptedDataForRecordValueStore_withPCS_(self, v18, (uint64_t)v17, v16);

      int v22 = objc_msgSend_encryptedValueStore(v4, v20, v21);
      int v24 = objc_msgSend__wrapEncryptedDataForRecordValueStore_withPCS_(self, v23, (uint64_t)v22, v16);

      id v27 = objc_msgSend_encryptedValueStore(v4, v25, v26);
      int v29 = objc_msgSend__encryptMergeableDeltasInRecordValueStore_shareProtection_(self, v28, (uint64_t)v27, v16);

      int v30 = v29 & v24 & v19;
      uint64_t v33 = objc_msgSend_record(self, v31, v32);
      uint64_t v36 = objc_msgSend_chainPrivateKey(v33, v34, v35);
      if (v36)
      {
        long long v39 = (void *)v36;
        uint64_t v40 = objc_msgSend_record(self, v37, v38);
        uint64_t v43 = objc_msgSend_chainPrivateKey(v40, v41, v42);
        uint64_t v44 = *MEMORY[0x1E4F1A580];
        long long v47 = objc_msgSend_recordID(v4, v45, v46);
        LODWORD(v44) = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v48, (uint64_t)v43, v16, v44, v47);

        if (!v44) {
          int v30 = 0;
        }
      }
      else
      {
      }
      uint64_t v66 = objc_msgSend_record(self, v49, v50);
      uint64_t v69 = objc_msgSend_mutableEncryptedPSK(v66, v67, v68);
      if (v69)
      {
        uint64_t v72 = (void *)v69;
        long long v73 = objc_msgSend_record(self, v70, v71);
        uint64_t v76 = objc_msgSend_mutableEncryptedPSK(v73, v74, v75);
        uint64_t v77 = *MEMORY[0x1E4F1A5D0];
        uint64_t v80 = objc_msgSend_recordID(v4, v78, v79);
        LODWORD(v77) = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(self, v81, (uint64_t)v76, v16, v77, v80);

        if (!v77) {
          int v30 = 0;
        }
      }
      else
      {
      }
      id v84 = objc_msgSend_recordID(v4, v82, v83);
      uint64_t v87 = objc_msgSend_recordName(v84, v85, v86);
      int isEqualToString = objc_msgSend_isEqualToString_(v87, v88, *MEMORY[0x1E4F19D48]);

      BOOL v60 = v30 != 0;
      if (isEqualToString)
      {
        int v121 = v30;
        uint64_t v124 = v16;
        uint64_t v125 = v4;
        uint64_t v92 = self;
        uint64_t v123 = objc_msgSend_record(self, v90, v91);
        objc_msgSend_oneTimeURLMetadatasByParticipantID(v123, v93, v94);
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        uint64_t v122 = v129 = 0u;
        long long v97 = objc_msgSend_allValues(v122, v95, v96);
        uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v98, (uint64_t)&v126, v132, 16);
        if (v99)
        {
          uint64_t v102 = v99;
          uint64_t v103 = *(void *)v127;
          uint64_t v104 = *MEMORY[0x1E4F1A5C8];
          while (2)
          {
            for (uint64_t i = 0; i != v102; ++i)
            {
              if (*(void *)v127 != v103) {
                objc_enumerationMutation(v97);
              }
              long long v106 = *(void **)(*((void *)&v126 + 1) + 8 * i);
              uint64_t v107 = objc_msgSend_encryptedOneTimeFullToken(v106, v100, v101);
              if (v107)
              {
                long long v108 = (void *)v107;
                long long v109 = objc_msgSend_encryptedOneTimeFullToken(v106, v100, v101);
                long long v112 = objc_msgSend_recordID(v125, v110, v111);
                char v114 = objc_msgSend__wrapEncryptedData_withPCS_forField_recordID_(v92, v113, (uint64_t)v109, v124, v104, v112);

                if ((v114 & 1) == 0)
                {

                  goto LABEL_36;
                }
              }
            }
            uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v100, (uint64_t)&v126, v132, 16);
            if (v102) {
              continue;
            }
            break;
          }
        }

        if (v121)
        {
          __int16 v117 = v122;
          uint64_t v119 = v123;
          if (objc_msgSend_count(v122, v115, v116)) {
            objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v123, v118, (uint64_t)v122);
          }
          BOOL v60 = 1;
          id v4 = v125;
        }
        else
        {
LABEL_36:
          BOOL v60 = 0;
          id v4 = v125;
          __int16 v117 = v122;
          uint64_t v119 = v123;
        }
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v61 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v62 = v61;
        uint64_t v65 = objc_msgSend_recordID(v4, v63, v64);
        *(_DWORD *)buf = 138412290;
        char v131 = v65;
        _os_log_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_INFO, "Warn: Couldn't get a record PCS for record %@, but it has encrypted data set on it", buf, 0xCu);
      }
      BOOL v60 = 0;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v51 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_INFO, "Skipping wrapping of encrypted data because encryption is disabled", buf, 2u);
    }
    uint64_t v54 = objc_msgSend_valueStore(v4, v52, v53);
    objc_msgSend__pretendToWrapEncryptedDataForRecordValueStore_(self, v55, (uint64_t)v54);

    uint64_t v58 = objc_msgSend_encryptedValueStore(v4, v56, v57);
    objc_msgSend__pretendToWrapEncryptedDataForRecordValueStore_(self, v59, (uint64_t)v58);

    BOOL v60 = 1;
  }

  return v60;
}

- (void)savePCSDataToCache
{
  id v4 = objc_msgSend_record(self, a2, v2);
  uint64_t v7 = objc_msgSend_protectionData(v4, v5, v6);
  char v10 = objc_msgSend_recordPCSData(self, v8, v9);
  objc_msgSend_setPcsData_(v10, v11, (uint64_t)v7);

  uint64_t v14 = objc_msgSend_record(self, v12, v13);
  uint64_t v17 = objc_msgSend_protectionEtag(v14, v15, v16);
  uint64_t v20 = objc_msgSend_recordPCSData(self, v18, v19);
  objc_msgSend_setEtag_(v20, v21, (uint64_t)v17);

  objc_msgSend_operation(self, v22, v23);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = objc_msgSend_recordPCSData(self, v24, v25);
  int v29 = objc_msgSend_recordID(self, v27, v28);
  objc_msgSend_setPCSData_forFetchedRecordID_(v31, v30, (uint64_t)v26, v29);
}

- (void)setServerRecord:(id)a3
{
  id v4 = (CKRecord *)a3;
  uint64_t v7 = objc_msgSend_baseToken(v4, v5, v6);

  if (v7)
  {
    char v10 = objc_msgSend_baseToken(v4, v8, v9);
    uint64_t v13 = objc_msgSend_record(self, v11, v12);
    objc_msgSend_setBaseToken_(v13, v14, (uint64_t)v10);
  }
  else
  {
    uint64_t v15 = objc_msgSend_record(self, v8, v9);
    uint64_t v18 = objc_msgSend_baseToken(v15, v16, v17);

    if (!v18) {
      goto LABEL_6;
    }
    char v10 = objc_msgSend_record(self, v19, v20);
    uint64_t v13 = objc_msgSend_baseToken(v10, v21, v22);
    objc_msgSend_setBaseToken_(v4, v23, (uint64_t)v13);
  }

LABEL_6:
  int v24 = objc_msgSend_routingKey(v4, v19, v20);

  if (v24)
  {
    id v27 = objc_msgSend_routingKey(v4, v25, v26);
    int v30 = objc_msgSend_record(self, v28, v29);
    objc_msgSend_setRoutingKey_(v30, v31, (uint64_t)v27);
  }
  else
  {
    uint64_t v32 = objc_msgSend_record(self, v25, v26);
    uint64_t v35 = objc_msgSend_routingKey(v32, v33, v34);

    if (!v35) {
      goto LABEL_11;
    }
    id v27 = objc_msgSend_record(self, v36, v37);
    int v30 = objc_msgSend_routingKey(v27, v38, v39);
    objc_msgSend_setRoutingKey_(v4, v40, (uint64_t)v30);
  }

LABEL_11:
  uint64_t v41 = objc_msgSend_displayedHostname(v4, v36, v37);

  if (v41)
  {
    uint64_t v44 = objc_msgSend_displayedHostname(v4, v42, v43);
    long long v47 = objc_msgSend_record(self, v45, v46);
    objc_msgSend_setDisplayedHostname_(v47, v48, (uint64_t)v44);
  }
  else
  {
    uint64_t v49 = objc_msgSend_record(self, v42, v43);
    long long v52 = objc_msgSend_displayedHostname(v49, v50, v51);

    if (!v52) {
      goto LABEL_16;
    }
    uint64_t v44 = objc_msgSend_record(self, v53, v54);
    long long v47 = objc_msgSend_displayedHostname(v44, v55, v56);
    objc_msgSend_setDisplayedHostname_(v4, v57, (uint64_t)v47);
  }

LABEL_16:
  uint64_t v58 = objc_msgSend_record(self, v53, v54);
  uint64_t v61 = objc_msgSend_mutableEncryptedPSK(v58, v59, v60);

  if (v61)
  {
    uint64_t v64 = objc_msgSend_record(self, v62, v63);
    uint64_t v67 = objc_msgSend_mutableEncryptedPSK(v64, v65, v66);
    uint64_t v70 = objc_msgSend_data(v67, v68, v69);

    if (!v70) {
      goto LABEL_22;
    }
    id v71 = objc_alloc(MEMORY[0x1E4F19FA0]);
    char v74 = objc_msgSend_record(self, v72, v73);
    uint64_t v77 = objc_msgSend_mutableEncryptedPSK(v74, v75, v76);
    uint64_t v80 = objc_msgSend_data(v77, v78, v79);
    uint64_t v82 = objc_msgSend_initWithData_(v71, v81, (uint64_t)v80);
    objc_msgSend_setMutableEncryptedPSK_(v4, v83, (uint64_t)v82);
  }
  else
  {
    id v84 = objc_msgSend_mutableEncryptedPSK(v4, v62, v63);
    uint64_t v87 = objc_msgSend_data(v84, v85, v86);

    if (!v87) {
      goto LABEL_22;
    }
    id v88 = objc_alloc(MEMORY[0x1E4F19FA0]);
    char v74 = objc_msgSend_mutableEncryptedPSK(v4, v89, v90);
    uint64_t v77 = objc_msgSend_data(v74, v91, v92);
    uint64_t v80 = objc_msgSend_initWithData_(v88, v93, (uint64_t)v77);
    uint64_t v82 = objc_msgSend_record(self, v94, v95);
    objc_msgSend_setMutableEncryptedPSK_(v82, v96, (uint64_t)v80);
  }

LABEL_22:
  serverRecord = self->_serverRecord;
  self->_serverRecord = v4;
}

- (void)_clearRecordProtectionDataForRecord
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_record(self, a2, v2);
  uint64_t v151 = objc_msgSend_operation(self, v5, v6);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v146 = v7;
    v149 = objc_msgSend_recordID(v4, v147, v148);
    *(_DWORD *)buf = 138412290;
    char v180 = v149;
    _os_log_debug_impl(&dword_1C4CFF000, v146, OS_LOG_TYPE_DEBUG, "Clearing protection data for record %@", buf, 0xCu);
  }
  char v10 = objc_msgSend_recordID(v4, v8, v9);
  objc_msgSend_setPCSData_forFetchedRecordID_(v151, v11, 0, v10);

  uint64_t v14 = objc_msgSend_recordID(v4, v12, v13);
  uint64_t v17 = objc_msgSend_zoneID(v14, v15, v16);
  objc_msgSend_setPCSData_forFetchedZoneID_(v151, v18, 0, v17);

  uint64_t v21 = objc_msgSend_share(v4, v19, v20);
  int v24 = objc_msgSend_recordID(v21, v22, v23);
  objc_msgSend_setPCSData_forFetchedShareID_(v151, v25, 0, v24);

  id v26 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v27 = *MEMORY[0x1E4F19D48];
  int v30 = objc_msgSend_recordID(v4, v28, v29);
  uint64_t v33 = objc_msgSend_zoneID(v30, v31, v32);
  uint64_t v35 = objc_msgSend_initWithRecordName_zoneID_(v26, v34, v27, v33);

  uint64_t v150 = (void *)v35;
  objc_msgSend_setPCSData_forFetchedShareID_(v151, v36, 0, v35);
  objc_msgSend_setProtectionData_(v4, v37, 0);
  objc_msgSend_setProtectionEtag_(v4, v38, 0);
  objc_msgSend_setPreviousProtectionEtag_(v4, v39, 0);
  objc_msgSend_setZoneProtectionEtag_(v4, v40, 0);
  objc_msgSend_setShareEtag_(v4, v41, 0);
  objc_msgSend_setRecordPCSData_(self, v42, 0);
  objc_msgSend_setRecordPCS_(v4, v43, 0);
  objc_msgSend_setChainParentPublicKeyID_(v4, v44, 0);
  objc_msgSend_setChainPrivateKey_(v4, v45, 0);
  objc_msgSend_setChainProtectionInfo_(v4, v46, 0);
  uint64_t v49 = objc_msgSend_savePolicy(v151, v47, v48);
  long long v52 = objc_msgSend_valueStore(v4, v50, v51);
  uint64_t v55 = v52;
  if (v49 == 2) {
    objc_msgSend_allKeys(v52, v53, v54);
  }
  else {
  uint64_t v56 = objc_msgSend_changedKeys(v52, v53, v54);
  }

  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v57 = v56;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v170, v178, 16);
  v153 = v4;
  if (v59)
  {
    uint64_t v62 = v59;
    uint64_t v63 = *(void *)v171;
    id v152 = v57;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v171 != v63) {
          objc_enumerationMutation(v57);
        }
        uint64_t v65 = *(void *)(*((void *)&v170 + 1) + 8 * i);
        uint64_t v66 = objc_msgSend_valueStore(v4, v60, v61);
        uint64_t v68 = objc_msgSend_rawValueForKey_(v66, v67, v65);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v69 = v68;
          objc_msgSend_setAssetKey_(v69, v70, 0);
          objc_msgSend_setWrappedAssetKey_(v69, v71, 0);
          objc_msgSend_setClearAssetKey_(v69, v72, 0);
          objc_msgSend_setReferenceSignature_(v69, v73, 0);
          objc_msgSend_setUploadReceipt_(v69, v74, 0);
          objc_msgSend_setUploadReceiptExpiration_(v69, v75, v76, 0.0);
          objc_msgSend_setUploaded_(v69, v77, 0);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_setEncryptedData_(v68, v78, 0);
            goto LABEL_39;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v69 = v68;
            uint64_t v81 = objc_msgSend_firstObject(v69, v79, v80);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              long long v168 = 0u;
              long long v169 = 0u;
              long long v166 = 0u;
              long long v167 = 0u;
              id v85 = v69;
              uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v166, v177, 16);
              if (v87)
              {
                uint64_t v89 = v87;
                uint64_t v90 = *(void *)v167;
                do
                {
                  for (uint64_t j = 0; j != v89; ++j)
                  {
                    if (*(void *)v167 != v90) {
                      objc_enumerationMutation(v85);
                    }
                    uint64_t v92 = *(void **)(*((void *)&v166 + 1) + 8 * j);
                    objc_msgSend_setAssetKey_(v92, v88, 0);
                    objc_msgSend_setWrappedAssetKey_(v92, v93, 0);
                    objc_msgSend_setClearAssetKey_(v92, v94, 0);
                    objc_msgSend_setReferenceSignature_(v92, v95, 0);
                    objc_msgSend_setUploadReceipt_(v92, v96, 0);
                    objc_msgSend_setUploadReceiptExpiration_(v92, v97, v98, 0.0);
                    objc_msgSend_setUploaded_(v92, v99, 0);
                  }
                  uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v166, v177, 16);
                }
                while (v89);
              }
LABEL_37:

              id v57 = v152;
              id v4 = v153;
              goto LABEL_38;
            }
            uint64_t v102 = objc_msgSend_firstObject(v69, v83, v84);
            objc_opt_class();
            char v103 = objc_opt_isKindOfClass();

            if (v103)
            {
              long long v164 = 0u;
              long long v165 = 0u;
              long long v162 = 0u;
              long long v163 = 0u;
              id v104 = v69;
              uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v162, v176, 16);
              if (v106)
              {
                uint64_t v108 = v106;
                uint64_t v109 = *(void *)v163;
                do
                {
                  for (uint64_t k = 0; k != v108; ++k)
                  {
                    if (*(void *)v163 != v109) {
                      objc_enumerationMutation(v104);
                    }
                    objc_msgSend_setEncryptedData_(*(void **)(*((void *)&v162 + 1) + 8 * k), v107, 0);
                  }
                  uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v162, v176, 16);
                }
                while (v108);
              }
              goto LABEL_37;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_39;
            }
            id v69 = v68;
            objc_msgSend_setRecordPCS_(v69, v100, 0);
            objc_msgSend_setAssets_(v69, v101, 0);
          }
        }
LABEL_38:

LABEL_39:
      }
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v170, v178, 16);
    }
    while (v62);
  }

  uint64_t v113 = objc_msgSend_savePolicy(v151, v111, v112);
  uint64_t v116 = objc_msgSend_encryptedValueStore(v4, v114, v115);
  uint64_t v119 = v116;
  if (v113 == 2) {
    objc_msgSend_allKeys(v116, v117, v118);
  }
  else {
  uint64_t v120 = objc_msgSend_changedKeys(v116, v117, v118);
  }

  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v121 = v120;
  uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v158, v175, 16);
  if (v123)
  {
    uint64_t v126 = v123;
    uint64_t v127 = *(void *)v159;
    do
    {
      for (uint64_t m = 0; m != v126; ++m)
      {
        if (*(void *)v159 != v127) {
          objc_enumerationMutation(v121);
        }
        uint64_t v129 = *(void *)(*((void *)&v158 + 1) + 8 * m);
        uint64_t v130 = objc_msgSend_encryptedValueStore(v4, v124, v125);
        uint64_t v132 = objc_msgSend_rawValueForKey_(v130, v131, v129);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_setEncryptedData_(v132, v133, 0);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v134 = v132;
            v137 = objc_msgSend_firstObject(v134, v135, v136);
            objc_opt_class();
            char v138 = objc_opt_isKindOfClass();

            if (v138)
            {
              long long v156 = 0u;
              long long v157 = 0u;
              long long v154 = 0u;
              long long v155 = 0u;
              id v139 = v134;
              uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v140, (uint64_t)&v154, v174, 16);
              if (v141)
              {
                uint64_t v143 = v141;
                uint64_t v144 = *(void *)v155;
                do
                {
                  for (uint64_t n = 0; n != v143; ++n)
                  {
                    if (*(void *)v155 != v144) {
                      objc_enumerationMutation(v139);
                    }
                    objc_msgSend_setEncryptedData_(*(void **)(*((void *)&v154 + 1) + 8 * n), v142, 0);
                  }
                  uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v142, (uint64_t)&v154, v174, 16);
                }
                while (v143);
              }

              id v4 = v153;
            }
          }
        }
      }
      uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v158, v175, 16);
    }
    while (v126);
  }
}

- (CKDModifyRecordsOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (CKDModifyRecordsOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (void)setRecordID:(id)a3
{
}

- (OS_dispatch_group)pcsGroup
{
  return self->_pcsGroup;
}

- (void)setPcsGroup:(id)a3
{
}

- (CKDRecordPCSData)recordPCSData
{
  return self->_recordPCSData;
}

- (void)setRecordPCSData:(id)a3
{
}

- (CKDSharePCSData)sharePCSData
{
  return self->_sharePCSData;
}

- (void)setSharePCSData:(id)a3
{
}

- (CKRecord)serverRecord
{
  return self->_serverRecord;
}

- (BOOL)isDelete
{
  return self->_isDelete;
}

- (void)setIsDelete:(BOOL)a3
{
  self->_isDelete = a3;
}

- (void)setEtag:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableDictionary)rereferencedAssetArrayByFieldname
{
  return self->_rereferencedAssetArrayByFieldname;
}

- (void)setRereferencedAssetArrayByFieldname:(id)a3
{
}

- (CKDProgressTracker)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
}

- (int64_t)batchRank
{
  return self->_batchRank;
}

- (void)setBatchRank:(int64_t)a3
{
  self->_batchRanuint64_t k = a3;
}

- (int)saveAttempts
{
  return self->_saveAttempts;
}

- (void)setSaveAttempts:(int)a3
{
  self->_saveAttempts = a3;
}

- (BOOL)saveCompletionBlockCalled
{
  return self->_saveCompletionBlockCalled;
}

- (void)setSaveCompletionBlockCalled:(BOOL)a3
{
  self->_saveCompletionBlockCalled = a3;
}

- (BOOL)needsRefetch
{
  return self->_needsRefetch;
}

- (void)setNeedsRefetch:(BOOL)a3
{
  self->_needsRefetch = a3;
}

- (CKDZonePCSData)sharedZonePCSData
{
  return self->_sharedZonePCSData;
}

- (void)setSharedZonePCSData:(id)a3
{
}

- (BOOL)didAttemptZoneWideShareKeyRoll
{
  return self->_didAttemptZoneWideShareKeyRoll;
}

- (void)setDidAttemptZoneWideShareKeyRoll:(BOOL)a3
{
  self->_didAttemptZoneWideShareKeyRoll = a3;
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
}

- (BOOL)didRollRecordPCSMasterKey
{
  return self->_didRollRecordPCSMasterKey;
}

- (void)setDidRollRecordPCSMasterKey:(BOOL)a3
{
  self->_didRollRecordPCSMasterKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_sharedZonePCSData, 0);
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_rereferencedAssetArrayByFieldname, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_sharePCSData, 0);
  objc_storeStrong((id *)&self->_recordPCSData, 0);
  objc_storeStrong((id *)&self->_pcsGroup, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_destroyWeak((id *)&self->_operation);
}

@end