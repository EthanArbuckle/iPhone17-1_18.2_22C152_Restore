@interface CKDModifyRecordsURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)atomic;
- (BOOL)containsMergeableValues;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (BOOL)oplock;
- (BOOL)sendAllFields;
- (BOOL)sendMergeableDeltas;
- (CKDModifyRecordsURLRequest)initWithOperation:(id)a3 recordsToSave:(id)a4 recordIDsToDelete:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 oplock:(BOOL)a7 sendAllFields:(BOOL)a8 clientChangeTokenData:(id)a9 requestedFieldsByRecordId:(id)a10;
- (NSArray)recordIDsToDelete;
- (NSArray)records;
- (NSArray)userPublicKeys;
- (NSData)clientChangeTokenData;
- (NSDictionary)conflictLosersToResolveByRecordID;
- (NSDictionary)pluginFieldsForRecordDeletesByID;
- (NSDictionary)recordIDsToDeleteToEtags;
- (NSDictionary)recordIDsToDeleteToSigningPCSIdentity;
- (NSDictionary)requestedFieldsByRecordID;
- (NSMutableArray)skippedRecordsWithPurelyMergeableChanges;
- (NSMutableDictionary)mergeableFieldKeyByRequestID;
- (NSMutableDictionary)recordByRequestID;
- (NSMutableDictionary)recordIDByRequestID;
- (NSMutableDictionary)replacementRequestsByRequestID;
- (id)generateMergeableDeltaSaveOperationsForRecord:(id)a3 error:(id *)a4;
- (id)generateRequestOperations;
- (id)mergeableDeltaSavedBlock;
- (id)recordIDsUsedInZones:(id)a3;
- (id)recordPostedBlock;
- (id)replacedDeltasBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5;
- (id)zoneIDsToLock;
- (int)isolationLevel;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidComplete;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAtomic:(BOOL)a3;
- (void)setClientChangeTokenData:(id)a3;
- (void)setConflictLosersToResolveByRecordID:(id)a3;
- (void)setContainsMergeableValues:(BOOL)a3;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
- (void)setMergeableDeltaSavedBlock:(id)a3;
- (void)setMergeableFieldKeyByRequestID:(id)a3;
- (void)setOplock:(BOOL)a3;
- (void)setPluginFieldsForRecordDeletesByID:(id)a3;
- (void)setRecordByRequestID:(id)a3;
- (void)setRecordIDByRequestID:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordIDsToDeleteToEtags:(id)a3;
- (void)setRecordIDsToDeleteToSigningPCSIdentity:(id)a3;
- (void)setRecordPostedBlock:(id)a3;
- (void)setRecords:(id)a3;
- (void)setReplacedDeltasBlock:(id)a3;
- (void)setReplacementRequestsByRequestID:(id)a3;
- (void)setRequestedFieldsByRecordID:(id)a3;
- (void)setSendAllFields:(BOOL)a3;
- (void)setSendMergeableDeltas:(BOOL)a3;
- (void)setSkippedRecordsWithPurelyMergeableChanges:(id)a3;
- (void)setUserPublicKeys:(id)a3;
@end

@implementation CKDModifyRecordsURLRequest

- (CKDModifyRecordsURLRequest)initWithOperation:(id)a3 recordsToSave:(id)a4 recordIDsToDelete:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 oplock:(BOOL)a7 sendAllFields:(BOOL)a8 clientChangeTokenData:(id)a9 requestedFieldsByRecordId:(id)a10
{
  id v17 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a9;
  id v32 = a10;
  v36.receiver = self;
  v36.super_class = (Class)CKDModifyRecordsURLRequest;
  v18 = [(CKDURLRequest *)&v36 initWithOperation:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_records, a4);
    objc_storeStrong((id *)&v19->_recordIDsToDelete, a5);
    objc_storeStrong((id *)&v19->_recordIDsToDeleteToSigningPCSIdentity, a6);
    v19->_oplock = a7;
    v19->_sendAllFields = a8;
    objc_storeStrong((id *)&v19->_clientChangeTokenData, a9);
    objc_storeStrong((id *)&v19->_requestedFieldsByRecordID, a10);
    uint64_t v20 = objc_opt_new();
    recordIDByRequestID = v19->_recordIDByRequestID;
    v19->_recordIDByRequestID = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    recordByRequestID = v19->_recordByRequestID;
    v19->_recordByRequestID = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    mergeableFieldKeyByRequestID = v19->_mergeableFieldKeyByRequestID;
    v19->_mergeableFieldKeyByRequestID = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    replacementRequestsByRequestID = v19->_replacementRequestsByRequestID;
    v19->_replacementRequestsByRequestID = (NSMutableDictionary *)v26;

    v19->_containsMergeableValues = objc_msgSend_CKContains_(v19->_records, v28, (uint64_t)&unk_1F2044B90);
    uint64_t v29 = objc_opt_new();
    skippedRecordsWithPurelyMergeableChanges = v19->_skippedRecordsWithPurelyMergeableChanges;
    v19->_skippedRecordsWithPurelyMergeableChanges = (NSMutableArray *)v29;
  }
  return v19;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CKDModifyRecordsURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v25 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_records(self, v6, v7, v25.receiver, v25.super_class);
  v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"modifyIDs");
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = objc_msgSend_recordIDsToDelete(self, v16, v17);
  v21 = objc_msgSend_ckEquivalencyProperties(v18, v19, v20);
  v23 = objc_msgSend_setWithArray_(v15, v22, (uint64_t)v21);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v24, (uint64_t)v23, @"deleteIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_records(self, v5, v6);
  v9 = objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1F2044BB0);

  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);
  v13 = objc_msgSend_recordIDsToDelete(self, v11, v12);
  objc_msgSend_setDeleteRecordIDs_(v4, v14, (uint64_t)v13);

  v15.receiver = self;
  v15.super_class = (Class)CKDModifyRecordsURLRequest;
  [(CKDURLRequest *)&v15 fillOutRequestProperties:v4];
}

- (id)recordIDsUsedInZones:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDsToDelete(self, v5, v6);
  v9 = objc_msgSend_recordIDs_filteredByZones_(self, v8, (uint64_t)v7, v4);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = objc_msgSend_records(self, v10, v11, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v34, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v21 = objc_msgSend_recordID(v20, v15, v16);
        uint64_t v24 = objc_msgSend_zoneID(v21, v22, v23);
        int v26 = objc_msgSend_containsObject_(v4, v25, (uint64_t)v24);

        if (v26)
        {
          v27 = objc_msgSend_recordID(v20, v15, v16);
          objc_msgSend_addObject_(v9, v28, (uint64_t)v27);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v30, v34, 16);
    }
    while (v17);
  }

  return v9;
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v6 = objc_msgSend_records(self, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v39, v44, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = objc_msgSend_recordID(*(void **)(*((void *)&v39 + 1) + 8 * i), v9, v10);
        uint64_t v17 = objc_msgSend_zoneID(v14, v15, v16);

        if (v17) {
          objc_msgSend_addObject_(v3, v18, (uint64_t)v17);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v39, v44, 16);
    }
    while (v11);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v21 = objc_msgSend_recordIDsToDelete(self, v19, v20, 0);
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v35, v43, 16);
  if (v23)
  {
    uint64_t v26 = v23;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v21);
        }
        long long v30 = objc_msgSend_zoneID(*(void **)(*((void *)&v35 + 1) + 8 * j), v24, v25);
        if (v30) {
          objc_msgSend_addObject_(v3, v29, (uint64_t)v30);
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v35, v43, 16);
    }
    while (v26);
  }

  long long v33 = objc_msgSend_allObjects(v3, v31, v32);

  return v33;
}

- (id)requestOperationClasses
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_records(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  uint64_t v14 = objc_msgSend_recordIDsToDelete(self, v10, v11);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    uint64_t v20 = objc_opt_class();
    objc_msgSend_addObject_(v3, v21, v20);
  }
  if (objc_msgSend_containsMergeableValues(self, v18, v19))
  {
    uint64_t v22 = objc_opt_class();
    objc_msgSend_addObject_(v3, v23, v22);
  }
  return v3;
}

- (int)isolationLevel
{
  if (objc_msgSend_atomic(self, a2, v2)) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)generateRequestOperations
{
  uint64_t v567 = *MEMORY[0x1E4F143B8];
  v511 = objc_opt_new();
  long long v551 = 0u;
  long long v552 = 0u;
  long long v553 = 0u;
  long long v554 = 0u;
  objc_msgSend_records(self, v3, v4);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v521 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v551, v566, 16);
  uint64_t v8 = 0;
  if (v521)
  {
    uint64_t v519 = *(void *)v552;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v552 != v519) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v551 + 1) + 8 * v9);
      if (objc_msgSend_canSkipRecordSaveForMergeables(v10, v6, v7))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v12 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
        {
          v318 = v12;
          objc_msgSend_requestUUID(self, v319, v320);
          v322 = uint64_t v321 = v9;
          v325 = objc_msgSend_recordID(v10, v323, v324);
          *(_DWORD *)buf = 138543618;
          v561 = v322;
          __int16 v562 = 2112;
          v563 = v325;
          _os_log_debug_impl(&dword_1C4CFF000, v318, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Skipping record save due to purely mergeable changes in %@\"", buf, 0x16u);

          uint64_t v9 = v321;
        }
        objc_super v15 = objc_msgSend_skippedRecordsWithPurelyMergeableChanges(self, v13, v14);
        objc_msgSend_addObject_(v15, v16, (uint64_t)v10);
        goto LABEL_82;
      }
      char v525 = v8;
      objc_super v15 = objc_msgSend_operationRequestWithType_(self, v11, 210);
      if (objc_msgSend_requiresCKAnonymousUserIDs(self, v17, v18))
      {
        uint64_t v21 = v9;
        uint64_t v22 = objc_msgSend_recordID(v10, v19, v20);
        uint64_t v25 = objc_msgSend_zoneID(v22, v23, v24);
        v28 = objc_msgSend_anonymousCKUserID(v25, v26, v27);

        if (!v28)
        {
          v467 = objc_opt_new();
          v468 = NSString;
          v471 = objc_msgSend_recordID(v10, v469, v470);
          v473 = objc_msgSend_stringWithFormat_(v468, v472, @"An anonymousCKUserID is required to modify record %@ in the shared database when using anonymous to server share participants", v471);

          objc_msgSend_setObject_forKeyedSubscript_(v467, v474, (uint64_t)v473, *MEMORY[0x1E4F28568]);
          v477 = objc_msgSend_operation(self, v475, v476);
          v480 = objc_msgSend_topmostParentOperation(v477, v478, v479);
          v483 = objc_msgSend_operationID(v480, v481, v482);

          if (v483) {
            objc_msgSend_setObject_forKeyedSubscript_(v467, v484, (uint64_t)v483, *MEMORY[0x1E4F19C50]);
          }
          v485 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v484, *MEMORY[0x1E4F19DD8], 5015, v467);
          objc_msgSend_finishWithError_(self, v486, (uint64_t)v485);

          v487 = obj;
LABEL_132:

          id v506 = 0;
          goto LABEL_133;
        }
        long long v31 = objc_msgSend_recordID(v10, v29, v30);
        id v34 = objc_msgSend_zoneID(v31, v32, v33);
        long long v37 = objc_msgSend_anonymousCKUserID(v34, v35, v36);
        long long v40 = objc_msgSend_CKDPIdentifier_User(v37, v38, v39);
        v43 = objc_msgSend_request(v15, v41, v42);
        objc_msgSend_setAnonymousCKUserID_(v43, v44, (uint64_t)v40);

        uint64_t v9 = v21;
      }
      uint64_t v45 = objc_opt_new();
      objc_msgSend_setRecordSaveRequest_(v15, v46, (uint64_t)v45);

      v49 = objc_msgSend_recordSaveRequest(v15, v47, v48);
      objc_msgSend_setMerge_(v49, v50, 1);

      uint64_t v53 = objc_msgSend_oplock(self, v51, v52);
      uint64_t v56 = objc_msgSend_sendAllFields(self, v54, v55);
      objc_opt_class();
      uint64_t v517 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0 && v53 ^ 1 | v56)
      {
        v59 = objc_msgSend_container(self, v57, v58);
        objc_msgSend_clientSDKVersion(v59, v60, v61);
        int v62 = CKLinkCheckc809671068f5f334951d6b3e996f193c();

        v63 = (void *)*MEMORY[0x1E4F1A548];
        if (v62)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v63);
          }
          v64 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v326 = v64;
            v329 = objc_msgSend_recordID(v10, v327, v328);
            *(_DWORD *)buf = 138412290;
            v561 = v329;
            _os_log_debug_impl(&dword_1C4CFF000, v326, OS_LOG_TYPE_DEBUG, "Enforcing savePolicy isServerRecordUnchanged for CKShare record %@", buf, 0xCu);
          }
          uint64_t v56 = 0;
          LODWORD(v53) = 1;
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], v63);
          }
          v65 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v330 = v65;
            v333 = objc_msgSend_recordID(v10, v331, v332);
            v335 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v334, v53);
            v337 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v336, v56);
            *(_DWORD *)buf = 138412802;
            v561 = v333;
            __int16 v562 = 2112;
            v563 = v335;
            __int16 v564 = 2112;
            v565 = v337;
            _os_log_debug_impl(&dword_1C4CFF000, v330, OS_LOG_TYPE_DEBUG, "Warning: Unsupported savePolicy used when saving CKShare record %@, opLock: %@, sendAllFields: %@", buf, 0x20u);
          }
        }
      }
      v66 = objc_msgSend_translator(self, v57, v58);
      id v550 = 0;
      v68 = objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v66, v67, (uint64_t)v10, v56, &v550, 0);
      id v523 = v550;
      v71 = objc_msgSend_recordSaveRequest(v15, v69, v70);
      objc_msgSend_setRecord_(v71, v72, (uint64_t)v68);

      if (v53)
      {
        v75 = objc_msgSend_etag(v10, v73, v74);
        v78 = objc_msgSend_recordSaveRequest(v15, v76, v77);
        objc_msgSend_setEtag_(v78, v79, (uint64_t)v75);

        LODWORD(v78) = objc_msgSend_isKnownToServer(v10, v80, v81);
        v84 = objc_msgSend_recordSaveRequest(v15, v82, v83);
        v86 = v84;
        if (v78) {
          objc_msgSend_setSaveSemantics_(v84, v85, 1);
        }
        else {
          objc_msgSend_setSaveSemantics_(v84, v85, 2);
        }
      }
      else
      {
        v86 = objc_msgSend_recordSaveRequest(v15, v73, v74);
        objc_msgSend_setSaveSemantics_(v86, v87, 3);
      }

      v90 = objc_msgSend_recordSaveRequest(v15, v88, v89);
      int v93 = objc_msgSend_saveSemantics(v90, v91, v92);

      if (v93 != 2)
      {
        v96 = v10;
        long long v548 = 0u;
        long long v549 = 0u;
        long long v546 = 0u;
        long long v547 = 0u;
        id v97 = v523;
        uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v98, (uint64_t)&v546, v559, 16);
        if (v99)
        {
          uint64_t v102 = v99;
          uint64_t v103 = *(void *)v547;
          do
          {
            for (uint64_t i = 0; i != v102; ++i)
            {
              if (*(void *)v547 != v103) {
                objc_enumerationMutation(v97);
              }
              uint64_t v105 = *(void *)(*((void *)&v546 + 1) + 8 * i);
              v106 = objc_msgSend_recordSaveRequest(v15, v100, v101);
              objc_msgSend_addFieldsToDeleteIfExistOnMerge_(v106, v107, v105);
            }
            uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v100, (uint64_t)&v546, v559, 16);
          }
          while (v102);
        }

        uint64_t v10 = v96;
      }
      v108 = objc_msgSend_conflictLoserEtags(v10, v94, v95);

      if (v108)
      {
        v111 = objc_opt_new();
        v114 = objc_msgSend_recordSaveRequest(v15, v112, v113);
        objc_msgSend_setConflictLoserUpdate_(v114, v115, (uint64_t)v111);

        v118 = objc_msgSend_conflictLoserEtags(v10, v116, v117);
        v121 = objc_msgSend_mutableCopy(v118, v119, v120);
        v124 = objc_msgSend_recordSaveRequest(v15, v122, v123);
        v127 = objc_msgSend_conflictLoserUpdate(v124, v125, v126);
        objc_msgSend_setConflictLoserEtags_(v127, v128, (uint64_t)v121);
      }
      v129 = objc_msgSend_conflictLosersToResolveByRecordID(self, v109, v110);
      v132 = objc_msgSend_recordID(v10, v130, v131);
      v134 = objc_msgSend_objectForKeyedSubscript_(v129, v133, (uint64_t)v132);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v134, v135, v136))
      {
        v137 = objc_msgSend_mutableCopy(v134, v135, v136);
        v140 = objc_msgSend_recordSaveRequest(v15, v138, v139);
        objc_msgSend_setConflictLosersToResolves_(v140, v141, (uint64_t)v137);
      }
      if ((v525 & 1) == 0)
      {
        v142 = objc_msgSend_header(v15, v135, v136);

        if (!v142)
        {
          v145 = objc_opt_new();
          objc_msgSend_setHeader_(v15, v146, (uint64_t)v145);
        }
        v147 = objc_msgSend_clientChangeTokenData(self, v143, v144);
        v150 = objc_msgSend_header(v15, v148, v149);
        objc_msgSend_setClientChangeToken_(v150, v151, (uint64_t)v147);
      }
      v152 = objc_msgSend_requestedFieldsByRecordID(self, v135, v136);
      v155 = objc_msgSend_recordID(v10, v153, v154);
      v157 = objc_msgSend_objectForKeyedSubscript_(v152, v156, (uint64_t)v155);

      if (v157)
      {
        id v515 = v134;
        v526 = v10;
        v160 = objc_opt_new();
        long long v542 = 0u;
        long long v543 = 0u;
        long long v544 = 0u;
        long long v545 = 0u;
        v513 = v157;
        id v161 = v157;
        uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v161, v162, (uint64_t)&v542, v558, 16);
        if (v163)
        {
          uint64_t v164 = v163;
          uint64_t v165 = *(void *)v543;
          do
          {
            for (uint64_t j = 0; j != v164; ++j)
            {
              if (*(void *)v543 != v165) {
                objc_enumerationMutation(v161);
              }
              uint64_t v167 = *(void *)(*((void *)&v542 + 1) + 8 * j);
              v168 = objc_opt_new();
              objc_msgSend_setName_(v168, v169, v167);
              objc_msgSend_addFields_(v160, v170, (uint64_t)v168);
            }
            uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v161, v171, (uint64_t)&v542, v558, 16);
          }
          while (v164);
        }

        v174 = objc_msgSend_recordSaveRequest(v15, v172, v173);
        objc_msgSend_setRequestedFields_(v174, v175, (uint64_t)v160);

        uint64_t v10 = v526;
        v157 = v513;
        v134 = v515;
      }
      v176 = objc_msgSend_recordSaveRequest(v15, v158, v159);
      v179 = objc_msgSend_record(v176, v177, v178);

      if (v179) {
        break;
      }
      v220 = objc_opt_new();
      objc_msgSend_setCode_(v220, v221, 3);
      v222 = objc_opt_new();
      objc_msgSend_setError_(v220, v223, (uint64_t)v222);

      v224 = objc_opt_new();
      v227 = objc_msgSend_error(v220, v225, v226);
      objc_msgSend_setClientError_(v227, v228, (uint64_t)v224);

      v231 = objc_msgSend_error(v220, v229, v230);
      v234 = objc_msgSend_clientError(v231, v232, v233);
      objc_msgSend_setType_(v234, v235, 7);

      v238 = objc_msgSend_error(v220, v236, v237);
      objc_msgSend_setErrorKey_(v238, v239, @"Invalid values in record");

      v242 = objc_msgSend_error(v220, v240, v241);
      objc_msgSend_setErrorDescription_(v242, v243, @"The record could not be encoded because it has invalid values");

      v246 = objc_msgSend_recordPostedBlock(self, v244, v245);

      if (v246)
      {
        objc_msgSend_recordPostedBlock(self, v247, v248);
        v249 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        v252 = objc_msgSend_recordID(v10, v250, v251);
        ((void (**)(void, void *, void, void, void, void *, void, void, void))v249)[2](v249, v252, 0, 0, 0, v220, 0, 0, 0);
LABEL_80:
      }
      uint64_t v9 = v517;

      uint64_t v8 = 1;
LABEL_82:

      if (++v9 == v521)
      {
        uint64_t v521 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v551, v566, 16);
        if (v521) {
          goto LABEL_3;
        }
        goto LABEL_84;
      }
    }
    v182 = objc_msgSend_previousProtectionEtag(v10, v180, v181);
    v185 = objc_msgSend_recordSaveRequest(v15, v183, v184);
    objc_msgSend_setRecordProtectionInfoTag_(v185, v186, (uint64_t)v182);

    if (objc_msgSend_databaseScope(self, v187, v188) == 2 || objc_msgSend_databaseScope(self, v189, v190) == 3)
    {
      v191 = objc_msgSend_zoneProtectionEtag(v10, v189, v190);
      v194 = objc_msgSend_recordSaveRequest(v15, v192, v193);
      objc_msgSend_setZoneProtectionInfoTag_(v194, v195, (uint64_t)v191);

      if (objc_msgSend_hasUpdatedShare(v10, v196, v197))
      {
        v198 = objc_msgSend_shareEtag(v10, v189, v190);
        v201 = objc_msgSend_recordSaveRequest(v15, v199, v200);
        objc_msgSend_setShareEtag_(v201, v202, (uint64_t)v198);

        v203 = objc_opt_new();
        v206 = objc_msgSend_recordSaveRequest(v15, v204, v205);
        objc_msgSend_setShareIDUpdate_(v206, v207, (uint64_t)v203);

        v212 = objc_msgSend_share(v10, v208, v209);
        if (v212)
        {
          v213 = objc_msgSend_translator(self, v210, v211);
          v509 = objc_msgSend_share(v10, v214, v215);
          objc_msgSend_recordID(v509, v216, v217);
          v508 = v510 = v213;
          uint64_t v219 = objc_msgSend_pShareIdentifierFromRecordID_(v213, v218, (uint64_t)v508);
          v507 = (void *)v219;
        }
        else
        {
          uint64_t v219 = 0;
        }
        v253 = objc_msgSend_recordSaveRequest(v15, v210, v211);
        v256 = objc_msgSend_shareIDUpdate(v253, v254, v255);
        objc_msgSend_setShareId_(v256, v257, v219);

        if (v212)
        {
        }
      }
    }
    if (*MEMORY[0x1E4F1A4E0])
    {
      v258 = objc_msgSend_unitTestOverrides(self, v189, v190);
      v260 = objc_msgSend_objectForKeyedSubscript_(v258, v259, @"NoRecordProtectionInfoOnSaves");

      if (v260)
      {
        v263 = objc_msgSend_recordSaveRequest(v15, v261, v262);
        v266 = objc_msgSend_record(v263, v264, v265);
        objc_msgSend_setProtectionInfo_(v266, v267, 0);
      }
      uint64_t v268 = objc_msgSend_pcsKeysToRemove(v10, v261, v262);
      if (v268)
      {
        v270 = (void *)v268;
        if (objc_msgSend_applyPCSKeysToRemoveForTesting(v10, v189, v269))
        {

LABEL_78:
          v277 = objc_msgSend_protectionEtag(v10, v189, v273);
          v280 = objc_msgSend_pcsKeysToRemove(v10, v278, v279);
          objc_msgSend_setEtag_(v280, v281, (uint64_t)v277);

          v527 = objc_msgSend_translator(self, v282, v283);
          v286 = objc_msgSend_pcsKeysToRemove(v10, v284, v285);
          v288 = objc_msgSend_pProtectionInfoKeysToRemoveFromPCSKeysToRemove_(v527, v287, (uint64_t)v286);
          v291 = objc_msgSend_recordSaveRequest(v15, v289, v290);
          objc_msgSend_record(v291, v292, v293);
          v294 = v134;
          v296 = v295 = v157;
          objc_msgSend_setProtectionInfoKeysToRemove_(v296, v297, (uint64_t)v288);

          v157 = v295;
          v134 = v294;

          goto LABEL_79;
        }
        v274 = objc_msgSend_unitTestOverrides(self, v271, v272);
        v276 = objc_msgSend_objectForKeyedSubscript_(v274, v275, @"ApplyPCSKeysToRemoveForTesting");

        if (v276) {
          goto LABEL_78;
        }
      }
    }
LABEL_79:
    objc_msgSend_addObject_(v511, v189, (uint64_t)v15);
    v300 = objc_msgSend_recordByRequestID(self, v298, v299);
    v303 = objc_msgSend_request(v15, v301, v302);
    v306 = objc_msgSend_operationUUID(v303, v304, v305);
    objc_msgSend_setObject_forKeyedSubscript_(v300, v307, (uint64_t)v10, v306);

    v220 = objc_msgSend_recordID(v10, v308, v309);
    objc_msgSend_recordIDByRequestID(self, v310, v311);
    v249 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    v252 = objc_msgSend_request(v15, v312, v313);
    v316 = objc_msgSend_operationUUID(v252, v314, v315);
    objc_msgSend_setObject_forKeyedSubscript_(v249, v317, (uint64_t)v220, v316);

    goto LABEL_80;
  }
LABEL_84:

  if (objc_msgSend_sendMergeableDeltas(self, v338, v339))
  {
    long long v540 = 0u;
    long long v541 = 0u;
    long long v538 = 0u;
    long long v539 = 0u;
    v342 = objc_msgSend_records(self, v340, v341);
    uint64_t v344 = objc_msgSend_countByEnumeratingWithState_objects_count_(v342, v343, (uint64_t)&v538, v557, 16);
    if (v344)
    {
      uint64_t v346 = v344;
      uint64_t v347 = *(void *)v539;
      do
      {
        uint64_t v348 = v8;
        for (uint64_t k = 0; k != v346; ++k)
        {
          if (*(void *)v539 != v347) {
            objc_enumerationMutation(v342);
          }
          uint64_t v350 = *(void *)(*((void *)&v538 + 1) + 8 * k);
          id v537 = 0;
          v351 = objc_msgSend_generateMergeableDeltaSaveOperationsForRecord_error_(self, v345, v350, &v537);
          id v352 = v537;
          if (v351) {
            BOOL v354 = v352 == 0;
          }
          else {
            BOOL v354 = 0;
          }
          if (!v354)
          {
            v505 = v352;
            objc_msgSend_finishWithError_(self, v353, (uint64_t)v352);

            id v506 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_133;
          }
          objc_msgSend_addObjectsFromArray_(v511, v353, (uint64_t)v351);
        }
        uint64_t v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(v342, v345, (uint64_t)&v538, v557, 16);
        uint64_t v8 = v348;
      }
      while (v346);
    }
  }
  long long v535 = 0u;
  long long v536 = 0u;
  long long v533 = 0u;
  long long v534 = 0u;
  objc_msgSend_recordIDsToDelete(self, v340, v341);
  id v516 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v520 = objc_msgSend_countByEnumeratingWithState_objects_count_(v516, v355, (uint64_t)&v533, v556, 16);
  if (v520)
  {
    uint64_t v518 = *(void *)v534;
    uint64_t v514 = *MEMORY[0x1E4F19D48];
    while (2)
    {
      uint64_t v357 = 0;
      do
      {
        if (*(void *)v534 != v518) {
          objc_enumerationMutation(v516);
        }
        v358 = *(void **)(*((void *)&v533 + 1) + 8 * v357);
        v359 = objc_msgSend_operationRequestWithType_(self, v356, 214);
        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v360, v361))
        {
          v364 = objc_msgSend_zoneID(v358, v362, v363);
          v367 = objc_msgSend_anonymousCKUserID(v364, v365, v366);

          if (!v367)
          {
            v488 = objc_opt_new();
            v490 = objc_msgSend_stringWithFormat_(NSString, v489, @"An anonymousCKUserID is required to delete record %@ in the shared database when using anonymous to server share participants", v358);
            objc_msgSend_setObject_forKeyedSubscript_(v488, v491, (uint64_t)v490, *MEMORY[0x1E4F28568]);
            v494 = objc_msgSend_operation(self, v492, v493);
            v497 = objc_msgSend_topmostParentOperation(v494, v495, v496);
            v500 = objc_msgSend_operationID(v497, v498, v499);

            if (v500) {
              objc_msgSend_setObject_forKeyedSubscript_(v488, v501, (uint64_t)v500, *MEMORY[0x1E4F19C50]);
            }
            v502 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v501, *MEMORY[0x1E4F19DD8], 5015, v488);
            objc_msgSend_finishWithError_(self, v503, (uint64_t)v502);

            v487 = v516;
            goto LABEL_132;
          }
          v370 = objc_msgSend_zoneID(v358, v368, v369);
          v373 = objc_msgSend_anonymousCKUserID(v370, v371, v372);
          v376 = objc_msgSend_CKDPIdentifier_User(v373, v374, v375);
          v379 = objc_msgSend_request(v359, v377, v378);
          objc_msgSend_setAnonymousCKUserID_(v379, v380, (uint64_t)v376);
        }
        uint64_t v524 = v357;
        char v528 = v8;
        v381 = objc_opt_new();
        objc_msgSend_setRecordDeleteRequest_(v359, v382, (uint64_t)v381);

        v385 = objc_msgSend_translator(self, v383, v384);
        v387 = objc_msgSend_pRecordIdentifierFromRecordID_(v385, v386, (uint64_t)v358);
        v390 = objc_msgSend_recordDeleteRequest(v359, v388, v389);
        objc_msgSend_setRecordIdentifier_(v390, v391, (uint64_t)v387);

        v394 = objc_msgSend_pluginFieldsForRecordDeletesByID(self, v392, v393);
        v522 = v358;
        v396 = objc_msgSend_objectForKeyedSubscript_(v394, v395, (uint64_t)v358);

        long long v531 = 0u;
        long long v532 = 0u;
        long long v529 = 0u;
        long long v530 = 0u;
        id v397 = v396;
        uint64_t v399 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v398, (uint64_t)&v529, v555, 16);
        if (v399)
        {
          uint64_t v402 = v399;
          uint64_t v403 = *(void *)v530;
          do
          {
            for (uint64_t m = 0; m != v402; ++m)
            {
              if (*(void *)v530 != v403) {
                objc_enumerationMutation(v397);
              }
              uint64_t v405 = *(void *)(*((void *)&v529 + 1) + 8 * m);
              v406 = objc_msgSend_recordDeleteRequest(v359, v400, v401);
              v409 = objc_msgSend_translator(self, v407, v408);
              v411 = objc_msgSend_objectForKeyedSubscript_(v397, v410, v405);
              v413 = objc_msgSend_pFieldWithKey_value_(v409, v412, v405, v411);
              objc_msgSend_addPluginFields_(v406, v414, (uint64_t)v413);
            }
            uint64_t v402 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v400, (uint64_t)&v529, v555, 16);
          }
          while (v402);
        }

        if (objc_msgSend_oplock(self, v415, v416))
        {
          v419 = objc_msgSend_recordIDsToDeleteToEtags(self, v417, v418);
          v421 = objc_msgSend_objectForKeyedSubscript_(v419, v420, (uint64_t)v522);

          if (v421)
          {
            v422 = objc_msgSend_recordIDsToDeleteToEtags(self, v417, v418);
            v424 = objc_msgSend_objectForKeyedSubscript_(v422, v423, (uint64_t)v522);
            v427 = objc_msgSend_recordDeleteRequest(v359, v425, v426);
            objc_msgSend_setEtag_(v427, v428, (uint64_t)v424);
          }
        }
        if ((v528 & 1) == 0)
        {
          v429 = objc_msgSend_header(v359, v417, v418);

          if (!v429)
          {
            v432 = objc_opt_new();
            objc_msgSend_setHeader_(v359, v433, (uint64_t)v432);
          }
          v434 = objc_msgSend_clientChangeTokenData(self, v430, v431);
          v437 = objc_msgSend_header(v359, v435, v436);
          objc_msgSend_setClientChangeToken_(v437, v438, (uint64_t)v434);
        }
        if (objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v417, v418))
        {
          v441 = objc_msgSend_recordName(v522, v439, v440);
          int isEqualToString = objc_msgSend_isEqualToString_(v441, v442, v514);

          if (isEqualToString)
          {
            v445 = objc_msgSend_recordDeleteRequest(v359, v439, v444);
            objc_msgSend_setParticipantKeyLost_(v445, v446, 1);

            v449 = objc_msgSend_userPublicKeys(self, v447, v448);
            v452 = objc_msgSend_mutableCopy(v449, v450, v451);
            v455 = objc_msgSend_recordDeleteRequest(v359, v453, v454);
            objc_msgSend_setPublicKeys_(v455, v456, (uint64_t)v452);
          }
        }
        objc_msgSend_addObject_(v511, v439, (uint64_t)v359);
        v459 = objc_msgSend_recordIDByRequestID(self, v457, v458);
        v462 = objc_msgSend_request(v359, v460, v461);
        v465 = objc_msgSend_operationUUID(v462, v463, v464);
        objc_msgSend_setObject_forKeyedSubscript_(v459, v466, (uint64_t)v522, v465);

        uint64_t v357 = v524 + 1;
        LOBYTE(v8) = 1;
      }
      while (v524 + 1 != v520);
      uint64_t v520 = objc_msgSend_countByEnumeratingWithState_objects_count_(v516, v356, (uint64_t)&v533, v556, 16);
      if (v520) {
        continue;
      }
      break;
    }
  }

  id v506 = v511;
LABEL_133:

  return v506;
}

- (id)generateMergeableDeltaSaveOperationsForRecord:(id)a3 error:(id *)a4
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v186 = (id)objc_opt_new();
  uint64_t v6 = v5;
  uint64_t v7 = objc_opt_new();
  long long v205 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  objc_msgSend_allKeys(v6, v8, v9);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v205, v213, 16);
  uint64_t v190 = v6;
  v191 = self;
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v206;
    uint64_t v174 = *MEMORY[0x1E4F19DD8];
    *(void *)&long long v13 = 138412290;
    long long v172 = v13;
    uint64_t v175 = *(void *)v206;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v176 = v14;
      do
      {
        if (*(void *)v206 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v205 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v6, v12, v17, v172);
        uint64_t v21 = v6;
        uint64_t v22 = v18;
        uint64_t v189 = v17;
        if (v18)
        {
          id v23 = v18;
        }
        else
        {
          objc_msgSend_encryptedValues(v21, v19, v20);
          v25 = uint64_t v24 = v16;
          objc_msgSend_objectForKeyedSubscript_(v25, v26, v17);
          id v23 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v16 = v24;
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v178 = v23;
          id v27 = v23;
          long long v201 = 0u;
          long long v202 = 0u;
          long long v203 = 0u;
          long long v204 = 0u;
          objc_msgSend_deltasToSave(v27, v28, v29);
          id v180 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v30, (uint64_t)&v201, v212, 16);
          uint64_t v179 = v16;
          id v32 = 0;
          if (v188)
          {
            uint64_t v187 = *(void *)v202;
            v192 = v27;
            while (2)
            {
              uint64_t v33 = 0;
              id v34 = v32;
              do
              {
                if (*(void *)v202 != v187) {
                  objc_enumerationMutation(v180);
                }
                uint64_t v35 = *(void *)(*((void *)&v201 + 1) + 8 * v33);
                self = v191;
                uint64_t v36 = objc_msgSend_operationRequestWithType_(v191, v31, 311);
                long long v37 = objc_opt_new();
                long long v40 = objc_msgSend_translator(v191, v38, v39);
                v43 = objc_msgSend_valueID(v192, v41, v42);
                uint64_t v45 = objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v40, v44, (uint64_t)v43);
                objc_msgSend_setIdentifier_(v37, v46, (uint64_t)v45);

                v194 = v37;
                objc_msgSend_setMergeableDeltaSaveRequest_(v36, v47, (uint64_t)v37);
                v50 = objc_msgSend_translator(v191, v48, v49);
                id v200 = v34;
                uint64_t v52 = objc_msgSend_pMergeableDeltaFromDelta_error_(v50, v51, v35, &v200);
                id v32 = v200;

                uint64_t v193 = v52;
                if (*MEMORY[0x1E4F1A4E0])
                {
                  uint64_t v55 = objc_msgSend_unitTestOverrides(v191, v53, v54);
                  v57 = objc_msgSend_objectForKeyedSubscript_(v55, v56, @"FakeErrorDuringMergeableProtoGenerationDeltasToSave");

                  if (v57)
                  {

                    uint64_t v126 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v125, v174, 1000, @"This is a fake error");

                    id v32 = (id)v126;
LABEL_24:
                    uint64_t v15 = v175;
                    if (*MEMORY[0x1E4F1A550] != -1) {
                      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                    }
                    v127 = *MEMORY[0x1E4F1A500];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = v172;
                      id v211 = v32;
                      _os_log_fault_impl(&dword_1C4CFF000, v127, OS_LOG_TYPE_FAULT, "Failed to get data from delta for delta save request with error: %@", buf, 0xCu);
                    }

                    id v27 = v192;
                    goto LABEL_29;
                  }
                  v60 = objc_msgSend_unitTestOverrides(v191, v58, v59);
                  int v62 = objc_msgSend_objectForKeyedSubscript_(v60, v61, @"FakeInvalidMergeableValueID");

                  if (v62)
                  {
                    v183 = objc_msgSend_translator(v191, v53, v63);
                    id v181 = objc_alloc(MEMORY[0x1E4F1A168]);
                    v185 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v64, v65);
                    v182 = objc_msgSend_UUIDString(v185, v66, v67);
                    uint64_t v184 = objc_msgSend_valueID(v192, v68, v69);
                    uint64_t v72 = objc_msgSend_recordID(v184, v70, v71);
                    v75 = objc_msgSend_valueID(v192, v73, v74);
                    v78 = objc_msgSend_key(v75, v76, v77);
                    uint64_t v81 = objc_msgSend_valueID(v192, v79, v80);
                    uint64_t isEncrypted = objc_msgSend_isEncrypted(v81, v82, v83);
                    v85 = (void *)v72;
                    v87 = objc_msgSend_initWithName_recordID_key_encrypted_(v181, v86, (uint64_t)v182, v72, v78, isEncrypted);
                    uint64_t v89 = objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v183, v88, (uint64_t)v87);
                    objc_msgSend_setIdentifier_(v194, v90, (uint64_t)v89);

                    uint64_t v52 = v193;
                    self = v191;
                  }
                }
                if (!v52) {
                  goto LABEL_24;
                }
                objc_msgSend_setDelta_(v194, v53, (uint64_t)v52);
                objc_msgSend_addObject_(v186, v91, (uint64_t)v36);
                v94 = objc_msgSend_recordByRequestID(self, v92, v93);
                id v97 = objc_msgSend_request(v36, v95, v96);
                objc_msgSend_operationUUID(v97, v98, v99);
                v100 = id v34 = v32;
                objc_msgSend_setObject_forKeyedSubscript_(v94, v101, (uint64_t)v190, v100);

                v104 = objc_msgSend_recordID(v190, v102, v103);
                v107 = objc_msgSend_recordIDByRequestID(self, v105, v106);
                uint64_t v110 = objc_msgSend_request(v36, v108, v109);
                uint64_t v113 = objc_msgSend_operationUUID(v110, v111, v112);
                objc_msgSend_setObject_forKeyedSubscript_(v107, v114, (uint64_t)v104, v113);

                uint64_t v117 = objc_msgSend_mergeableFieldKeyByRequestID(self, v115, v116);
                uint64_t v120 = objc_msgSend_request(v36, v118, v119);
                uint64_t v123 = objc_msgSend_operationUUID(v120, v121, v122);
                objc_msgSend_setObject_forKeyedSubscript_(v117, v124, v189, v123);

                id v32 = v34;
                ++v33;
              }
              while (v188 != v33);
              self = v191;
              id v27 = v192;
              uint64_t v15 = v175;
              uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v31, (uint64_t)&v201, v212, 16);
              if (v188) {
                continue;
              }
              break;
            }
          }
LABEL_29:
          id v128 = v32;

          long long v198 = 0u;
          long long v199 = 0u;
          long long v196 = 0u;
          long long v197 = 0u;
          uint64_t v131 = objc_msgSend_pendingReplacementRequests(v27, v129, v130);
          uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v131, v132, (uint64_t)&v196, v209, 16);
          if (v133)
          {
            uint64_t v135 = v133;
            uint64_t v136 = *(void *)v197;
            do
            {
              for (uint64_t i = 0; i != v135; ++i)
              {
                if (*(void *)v197 != v136) {
                  objc_enumerationMutation(v131);
                }
                objc_msgSend_addObject_(v7, v134, *(void *)(*((void *)&v196 + 1) + 8 * i));
              }
              uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v131, v134, (uint64_t)&v196, v209, 16);
            }
            while (v135);
          }

          uint64_t v14 = v176;
          v138 = v27;
          id v23 = v178;
          uint64_t v16 = v179;
          if (v128)
          {

            uint64_t v149 = a4;
            id v143 = v128;
            v140 = obj;
            goto LABEL_54;
          }
        }

        ++v16;
        uint64_t v6 = v190;
      }
      while (v16 != v14);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v205, v213, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v195 = 0;
  v140 = objc_msgSend_requestOperationsForRequest_replaceDeltasRequests_ignoreMissingDeltas_error_(CKDReplaceMergeableDeltasURLRequest, v139, (uint64_t)self, v7, 1, &v195);
  id v143 = v195;
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v144 = objc_msgSend_unitTestOverrides(self, v141, v142);
    v146 = objc_msgSend_objectForKeyedSubscript_(v144, v145, @"FakeErrorDuringMergeableProtoGenerationReplacementDeltas");

    if (v146)
    {

      uint64_t v148 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v147, *MEMORY[0x1E4F19DD8], 1000, @"This is a fake error");

      v140 = 0;
      id v143 = (id)v148;
      goto LABEL_49;
    }
  }
  if (!v140 || (uint64_t v149 = a4, v143))
  {
LABEL_49:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v170 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v211 = v143;
      _os_log_fault_impl(&dword_1C4CFF000, v170, OS_LOG_TYPE_FAULT, "Error generating replacement requests when modifying records: %@", buf, 0xCu);
    }
    v138 = v186;
    uint64_t v149 = a4;
LABEL_54:

    id v186 = 0;
    goto LABEL_55;
  }
  objc_msgSend_addObjectsFromArray_(v186, v141, (uint64_t)v140);
  if (!objc_msgSend_count(v140, v150, v151))
  {
    id v143 = 0;
LABEL_55:
    v153 = v190;
    goto LABEL_56;
  }
  v153 = v190;
  unint64_t v154 = 0;
  do
  {
    v155 = objc_msgSend_objectAtIndexedSubscript_(v140, v152, v154);
    v157 = objc_msgSend_objectAtIndexedSubscript_(v7, v156, v154);
    v160 = objc_msgSend_replacementRequestsByRequestID(self, v158, v159);
    uint64_t v163 = objc_msgSend_request(v155, v161, v162);
    v166 = objc_msgSend_operationUUID(v163, v164, v165);
    objc_msgSend_setObject_forKeyedSubscript_(v160, v167, (uint64_t)v157, v166);

    self = v191;
    ++v154;
  }
  while (v154 < objc_msgSend_count(v140, v168, v169));
  id v143 = 0;
  uint64_t v149 = a4;
LABEL_56:

  if (v149) {
    *uint64_t v149 = v143;
  }

  return v186;
}

- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v92 = a4;
  if ((objc_msgSend_requiresCKAnonymousUserIDs(self, v10, v11) & 1) == 0)
  {
    v87 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v87, v88, (uint64_t)a2, self, @"CKDModifyRecordsURLRequest.m", 444, @"Signature is only required for anonymous to server requests");
  }
  uint64_t v14 = objc_msgSend_recordIDByRequestID(self, v12, v13);
  uint64_t v17 = objc_msgSend_request(v9, v15, v16);
  uint64_t v20 = objc_msgSend_operationUUID(v17, v18, v19);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v14, v21, (uint64_t)v20);

  uint64_t v25 = objc_msgSend_recordByRequestID(self, v23, v24);
  v28 = objc_msgSend_request(v9, v26, v27);
  long long v31 = objc_msgSend_operationUUID(v28, v29, v30);
  uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v25, v32, (uint64_t)v31);

  int v36 = objc_msgSend_hasRecordDeleteRequest(v9, v34, v35);
  uint64_t v39 = (void *)MEMORY[0x1E4F1A550];
  long long v40 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (!v36)
  {
    if (!objc_msgSend_hasRecordSaveRequest(v9, v37, v38))
    {
      id v65 = 0;
LABEL_12:
      if (*v39 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v74 = *v40;
      if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v96 = v22;
        _os_log_error_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_ERROR, "Missing required identity when creating a signature for record %@", buf, 0xCu);
        if (v65)
        {
LABEL_17:
          uint64_t v71 = 0;
          v64 = 0;
          if (!a5) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
      }
      else if (v65)
      {
        goto LABEL_17;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v75, *MEMORY[0x1E4F19DD8], 2006, @"Missing required identity for generating anonymous to server signature");
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v90 = v22;
    v91 = a5;
    uint64_t v54 = (const void *)objc_msgSend_signingPCSIdentity(v33, v72, v73);
    CFRetain(v54);
    id v55 = 0;
    if (v54) {
      goto LABEL_5;
    }
LABEL_10:
    id v65 = v55;
    uint64_t v22 = v90;
    a5 = v91;
    uint64_t v39 = (void *)MEMORY[0x1E4F1A550];
    goto LABEL_12;
  }
  v91 = a5;
  long long v41 = objc_msgSend_container(self, v37, v38);
  objc_msgSend_pcsManager(v41, v42, v43);
  v44 = v40;
  v46 = uint64_t v45 = (uint64_t)v22;
  objc_msgSend_recordIDsToDeleteToSigningPCSIdentity(self, v47, v48);
  v50 = uint64_t v49 = v33;
  v90 = (void *)v45;
  uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v50, v51, v45);
  id v94 = 0;
  uint64_t v54 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v46, v53, (uint64_t)v52, &v94);
  id v55 = v94;

  long long v40 = v44;
  uint64_t v33 = v49;

  if (!v54) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v58 = v40;
  uint64_t v59 = objc_msgSend_container(self, v56, v57, v33);
  int v62 = objc_msgSend_pcsManager(v59, v60, v61);
  id v93 = v55;
  v64 = objc_msgSend_createSignatureWithIdentity_dataToBeSigned_forScope_error_(v62, v63, (uint64_t)v54, v92, 6, &v93);
  id v65 = v93;

  if (!objc_msgSend_length(v64, v66, v67) || v65)
  {
    long long v40 = v58;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v33 = v89;
    uint64_t v22 = v90;
    v78 = *v58;
    a5 = v91;
    if (os_log_type_enabled(*v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v96 = (void *)v54;
      __int16 v97 = 2112;
      id v98 = v65;
      _os_log_error_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_ERROR, "Couldn't generate a request signature with signing identity %{public}@ because we got an error from PCS: %@", buf, 0x16u);
    }
    uint64_t v71 = 0;
  }
  else
  {
    id v68 = objc_alloc(MEMORY[0x1E4F1A470]);
    uint64_t v69 = (void *)PCSIdentityCopyExportedPublicKey();
    uint64_t v71 = objc_msgSend_initWithObject1_object2_(v68, v70, (uint64_t)v69, v64);

    uint64_t v22 = v90;
    a5 = v91;
    uint64_t v33 = v89;
    long long v40 = v58;
  }
  CFRelease(v54);
  uint64_t v39 = (void *)MEMORY[0x1E4F1A550];
  if (a5) {
LABEL_18:
  }
    *a5 = v65;
LABEL_19:
  if (*v39 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v76 = *v40;
  if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
  {
    v79 = v33;
    uint64_t v80 = v76;
    uint64_t v83 = objc_msgSend_v1(v71, v81, v82);
    v86 = objc_msgSend_v2(v71, v84, v85);
    *(_DWORD *)buf = 138412802;
    uint64_t v96 = v83;
    __int16 v97 = 2112;
    id v98 = v86;
    __int16 v99 = 2112;
    id v100 = v92;
    _os_log_debug_impl(&dword_1C4CFF000, v80, OS_LOG_TYPE_DEBUG, "Signature generated. key: %@, signature: %@, data: %@", buf, 0x20u);

    uint64_t v33 = v79;
  }

  return v71;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v216 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_recordIDByRequestID(self, v6, v7);
  uint64_t v11 = objc_msgSend_response(v5, v9, v10);
  uint64_t v14 = objc_msgSend_operationUUID(v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (!objc_msgSend_hasRecordSaveResponse(v5, v17, v18))
  {
    if (objc_msgSend_hasRecordDeleteResponse(v5, v19, v20))
    {
      objc_msgSend_updateShareIDCacheWithDeletedRecordID_(self, v57, (uint64_t)v16);
    }
    else
    {
      if (objc_msgSend_hasMergeableDeltaSaveResponse(v5, v57, v58))
      {
        uint64_t v63 = objc_msgSend_mergeableFieldKeyByRequestID(self, v61, v62);
        v66 = objc_msgSend_response(v5, v64, v65);
        uint64_t v69 = objc_msgSend_operationUUID(v66, v67, v68);
        uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v63, v70, (uint64_t)v69);

        uint64_t v74 = objc_msgSend_mergeableDeltaSavedBlock(self, v72, v73);

        if (v74)
        {
          objc_msgSend_mergeableDeltaSavedBlock(self, v75, v76);
          uint64_t v77 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          uint64_t v80 = objc_msgSend_result(v5, v78, v79);
          ((void (**)(void, void *, void *, void *))v77)[2](v77, v16, v71, v80);
        }
        goto LABEL_46;
      }
      if (objc_msgSend_hasMergeableDeltaReplaceResponse(v5, v61, v62))
      {
        v170 = objc_msgSend_replacementRequestsByRequestID(self, v59, v60);
        uint64_t v173 = objc_msgSend_response(v5, v171, v172);
        uint64_t v176 = objc_msgSend_operationUUID(v173, v174, v175);
        id v178 = objc_msgSend_objectForKeyedSubscript_(v170, v177, (uint64_t)v176);

        if (!v178)
        {
          id v200 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v179, v180);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v200, v201, (uint64_t)a2, self, @"CKDModifyRecordsURLRequest.m", 547, @"Expected non-nil replacement request for response %@", v5);
        }
        id v181 = objc_msgSend_replacedDeltasBlock(self, v179, v180);

        if (v181)
        {
          objc_msgSend_replacedDeltasBlock(self, v182, v183);
          uint64_t v184 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          uint64_t v187 = objc_msgSend_result(v5, v185, v186);
          ((void (**)(void, void *, void *))v184)[2](v184, v178, v187);
        }
        goto LABEL_46;
      }
    }
    uint64_t v188 = objc_msgSend_recordPostedBlock(self, v59, v60);

    if (v188)
    {
      objc_msgSend_recordPostedBlock(self, v189, v190);
      v191 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v194 = objc_msgSend_result(v5, v192, v193);
      ((void (**)(void, void *, void, void, void, void *, void, void, void))v191)[2](v191, v16, 0, 0, 0, v194, 0, 0, 0);
    }
LABEL_46:
    uint64_t v169 = 0;
    goto LABEL_47;
  }
  uint64_t v21 = objc_msgSend_recordByRequestID(self, v19, v20);
  uint64_t v24 = objc_msgSend_response(v5, v22, v23);
  uint64_t v27 = objc_msgSend_operationUUID(v24, v25, v26);
  long long v208 = objc_msgSend_objectForKeyedSubscript_(v21, v28, (uint64_t)v27);

  long long v31 = objc_msgSend_result(v5, v29, v30);
  id v34 = objc_msgSend_error(v31, v32, v33);
  long long v37 = objc_msgSend_clientError(v34, v35, v36);
  long long v40 = objc_msgSend_oplockFailure(v37, v38, v39);
  uint64_t v43 = objc_msgSend_recordForOplockFailure(v40, v41, v42);

  long long v207 = (void *)v43;
  if (v43)
  {
    v46 = objc_msgSend_translator(self, v44, v45);
    uint64_t v49 = objc_msgSend_zoneID(v16, v47, v48);
    uint64_t v52 = objc_msgSend_anonymousCKUserID(v49, v50, v51);
    id v211 = 0;
    uint64_t v54 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v46, v53, (uint64_t)v207, v52, &v211);
    id v55 = v211;

    id v206 = v55;
    if (v54 || !v55)
    {
      long long v204 = (void *)v54;
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v56 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v213 = v55;
        _os_log_error_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_ERROR, "Invalid data from server in response to modifyRecords request: %@", buf, 0xCu);
      }
      long long v204 = 0;
    }
  }
  else
  {
    long long v204 = 0;
    id v206 = 0;
  }
  uint64_t v81 = objc_msgSend_translator(self, v44, v45);
  uint64_t v84 = objc_msgSend_sendAllFields(self, v82, v83);
  id v210 = 0;
  id v86 = (id)objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v81, v85, (uint64_t)v208, v84, 0, &v210);
  id v205 = v210;

  uint64_t v89 = objc_msgSend_translator(self, v87, v88);
  id v92 = objc_msgSend_recordSaveResponse(v5, v90, v91);
  uint64_t v95 = objc_msgSend_serverFields(v92, v93, v94);
  id v98 = objc_msgSend_zoneID(v16, v96, v97);
  uint64_t v101 = objc_msgSend_anonymousCKUserID(v98, v99, v100);
  id v209 = 0;
  uint64_t v103 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v89, v102, (uint64_t)v95, v101, &v209);
  id v104 = v209;

  uint64_t v106 = (os_log_t *)MEMORY[0x1E4F1A530];
  if (v104)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v107 = (void *)v103;
    os_log_t v108 = *v106;
    if (os_log_type_enabled(*v106, OS_LOG_TYPE_DEBUG))
    {
      v111 = v108;
      v114 = objc_msgSend_requestUUID(self, v112, v113);
      *(_DWORD *)buf = 138543618;
      id v213 = v114;
      __int16 v214 = 2112;
      id v215 = v104;
      _os_log_debug_impl(&dword_1C4CFF000, v111, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Error parsing server record returned for save: %@\"", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend_updateShareIDCacheWithRecord_(self, v105, v103);
    v107 = (void *)v103;
  }
  v115 = objc_msgSend_fakeResponseOperationResultByItemID(self, v109, v110);

  if (v115)
  {
    v118 = objc_msgSend_fakeResponseOperationResultByItemID(self, v116, v117);
    uint64_t v120 = objc_msgSend_objectForKeyedSubscript_(v118, v119, (uint64_t)v16);

    if (v120)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v121 = *v106;
      if (os_log_type_enabled(*v106, OS_LOG_TYPE_ERROR))
      {
        long long v196 = v121;
        long long v199 = objc_msgSend_requestUUID(self, v197, v198);
        *(_DWORD *)buf = 138543618;
        id v213 = v199;
        __int16 v214 = 2114;
        id v215 = v16;
        _os_log_error_impl(&dword_1C4CFF000, v196, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for item id %{public}@\"", buf, 0x16u);
      }
      objc_msgSend_setResult_(v5, v122, (uint64_t)v120);
    }
  }
  uint64_t v123 = objc_msgSend_container(self, v116, v117);
  uint64_t v126 = objc_msgSend_entitlements(v123, v124, v125);
  uint64_t hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v126, v127, v128);
  objc_msgSend_setSerializeProtectionData_(v107, v130, hasProtectionDataEntitlement);

  uint64_t v133 = objc_msgSend_recordSaveResponse(v5, v131, v132);
  LODWORD(v126) = objc_msgSend_hasExpirationTime(v133, v134, v135);

  if (v126)
  {
    v138 = objc_msgSend_recordSaveResponse(v5, v136, v137);
    v141 = objc_msgSend_expirationTime(v138, v139, v140);
    objc_msgSend_time(v141, v142, v143);
    double v145 = v144;

    uint64_t v148 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v146, v147, v145);
  }
  else
  {
    uint64_t v148 = 0;
  }
  uint64_t v149 = objc_msgSend_recordPostedBlock(self, v136, v137);

  v152 = v205;
  if (v149)
  {
    objc_msgSend_recordPostedBlock(self, v150, v151);
    v153 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    long long v202 = objc_msgSend_recordSaveResponse(v5, v154, v155);
    v158 = objc_msgSend_etag(v202, v156, v157);
    objc_msgSend_recordSaveResponse(v5, v159, v160);
    id v203 = v104;
    v162 = id v161 = v107;
    uint64_t v165 = objc_msgSend_timeStatistics(v162, v163, v164);
    v168 = objc_msgSend_result(v5, v166, v167);
    ((void (**)(void, void *, void *, void *, void *, void *, id, void *, void *))v153)[2](v153, v16, v158, v165, v148, v168, v205, v204, v161);

    v107 = v161;
    id v104 = v203;

    v152 = v205;
  }

  uint64_t v169 = v206;
LABEL_47:

  return v169;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_mergeableFieldKeyByRequestID(self, v16, v17);
  uint64_t v21 = objc_msgSend_response(v4, v19, v20);
  uint64_t v24 = objc_msgSend_operationUUID(v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v18, v25, (uint64_t)v24);

  uint64_t v29 = objc_msgSend_replacementRequestsByRequestID(self, v27, v28);
  id v32 = objc_msgSend_response(v4, v30, v31);
  uint64_t v35 = objc_msgSend_operationUUID(v32, v33, v34);
  long long v37 = objc_msgSend_objectForKeyedSubscript_(v29, v36, (uint64_t)v35);

  if (v26)
  {
    long long v40 = objc_msgSend_mergeableDeltaSavedBlock(self, v38, v39);

    if (v40)
    {
      objc_msgSend_mergeableDeltaSavedBlock(self, v41, v42);
      uint64_t v43 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_result(v4, v44, v45);
      ((void (**)(void, void *, void *, void *))v43)[2](v43, v15, v26, v46);
LABEL_7:
    }
  }
  else if (v37)
  {
    v47 = objc_msgSend_replacedDeltasBlock(self, v38, v39);

    if (v47)
    {
      objc_msgSend_replacedDeltasBlock(self, v48, v49);
      uint64_t v43 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_result(v4, v50, v51);
      ((void (*)(void (**)(void, void, void, void), void *, void *))v43[2])(v43, v37, v46);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v52 = objc_msgSend_result(v4, v38, v39);
    id v55 = objc_msgSend_error(v52, v53, v54);
    uint64_t v58 = objc_msgSend_clientError(v55, v56, v57);
    uint64_t v61 = objc_msgSend_oplockFailure(v58, v59, v60);
    uint64_t v64 = objc_msgSend_recordForOplockFailure(v61, v62, v63);

    uint64_t v65 = (void *)v64;
    if (v64)
    {
      uint64_t v68 = objc_msgSend_translator(self, v66, v67);
      uint64_t v71 = objc_msgSend_zoneID(v15, v69, v70);
      uint64_t v74 = objc_msgSend_anonymousCKUserID(v71, v72, v73);
      id v86 = v65;
      id v87 = 0;
      uint64_t v76 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v68, v75, (uint64_t)v65, v74, &v87);
      id v77 = v87;

      if (!v76 && v77)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v78 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v89 = v77;
          _os_log_error_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_ERROR, "Invalid data from server in response to modifyRecords request: %@", buf, 0xCu);
        }
      }

      uint64_t v65 = v86;
    }
    else
    {
      uint64_t v76 = 0;
    }
    uint64_t v79 = objc_msgSend_recordPostedBlock(self, v66, v67);

    if (v79)
    {
      objc_msgSend_recordPostedBlock(self, v80, v81);
      uint64_t v82 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v85 = objc_msgSend_result(v4, v83, v84);
      ((void (**)(void, void *, void, void, void, void *, void, void *, void))v82)[2](v82, v15, 0, 0, 0, v85, 0, v76, 0);
    }
  }
}

- (void)requestDidComplete
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  objc_msgSend_skippedRecordsWithPurelyMergeableChanges(self, a2, v2);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v46, v54, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v47;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend_translator(self, v6, v7);
        uint64_t v15 = objc_msgSend_sendAllFields(self, v13, v14);
        id v45 = 0;
        id v17 = (id)objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v12, v16, (uint64_t)v11, v15, 0, &v45);
        id v18 = v45;

        uint64_t v21 = objc_msgSend_recordPostedBlock(self, v19, v20);

        if (v21)
        {
          uint64_t v22 = objc_opt_new();
          objc_msgSend_setCode_(v22, v23, 1);
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v24 = (void *)*MEMORY[0x1E4F1A530];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
          {
            long long v37 = v24;
            long long v40 = objc_msgSend_requestUUID(self, v38, v39);
            uint64_t v43 = objc_msgSend_recordID(v11, v41, v42);
            *(_DWORD *)buf = 138543618;
            uint64_t v51 = v40;
            __int16 v52 = 2112;
            uint64_t v53 = v43;
            _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Will call record save block for skipped record %@\"", buf, 0x16u);
          }
          objc_msgSend_recordPostedBlock(self, v25, v26);
          uint64_t v27 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
          uint64_t v30 = objc_msgSend_recordID(v11, v28, v29);
          uint64_t v33 = objc_msgSend_etag(v11, v31, v32);
          uint64_t v36 = objc_msgSend_expirationDate(v11, v34, v35);
          ((void (**)(void, void *, void *, void, void *, void *, id, void, void))v27)[2](v27, v30, v33, 0, v36, v22, v18, 0, 0);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v46, v54, 16);
    }
    while (v8);
  }
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)sendMergeableDeltas
{
  return self->_sendMergeableDeltas;
}

- (void)setSendMergeableDeltas:(BOOL)a3
{
  self->_sendMergeableDeltas = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (NSArray)userPublicKeys
{
  return self->_userPublicKeys;
}

- (void)setUserPublicKeys:(id)a3
{
}

- (id)recordPostedBlock
{
  return self->_recordPostedBlock;
}

- (void)setRecordPostedBlock:(id)a3
{
}

- (id)mergeableDeltaSavedBlock
{
  return self->_mergeableDeltaSavedBlock;
}

- (void)setMergeableDeltaSavedBlock:(id)a3
{
}

- (id)replacedDeltasBlock
{
  return self->_replacedDeltasBlock;
}

- (void)setReplacedDeltasBlock:(id)a3
{
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (NSDictionary)recordIDsToDeleteToSigningPCSIdentity
{
  return self->_recordIDsToDeleteToSigningPCSIdentity;
}

- (void)setRecordIDsToDeleteToSigningPCSIdentity:(id)a3
{
}

- (BOOL)oplock
{
  return self->_oplock;
}

- (void)setOplock:(BOOL)a3
{
  self->_oplocuint64_t k = a3;
}

- (BOOL)sendAllFields
{
  return self->_sendAllFields;
}

- (void)setSendAllFields:(BOOL)a3
{
  self->_sendAllFields = a3;
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(id)a3
{
}

- (NSDictionary)requestedFieldsByRecordID
{
  return self->_requestedFieldsByRecordID;
}

- (void)setRequestedFieldsByRecordID:(id)a3
{
}

- (NSMutableDictionary)recordIDByRequestID
{
  return self->_recordIDByRequestID;
}

- (void)setRecordIDByRequestID:(id)a3
{
}

- (NSMutableDictionary)recordByRequestID
{
  return self->_recordByRequestID;
}

- (void)setRecordByRequestID:(id)a3
{
}

- (NSMutableDictionary)mergeableFieldKeyByRequestID
{
  return self->_mergeableFieldKeyByRequestID;
}

- (void)setMergeableFieldKeyByRequestID:(id)a3
{
}

- (NSMutableDictionary)replacementRequestsByRequestID
{
  return self->_replacementRequestsByRequestID;
}

- (void)setReplacementRequestsByRequestID:(id)a3
{
}

- (BOOL)containsMergeableValues
{
  return self->_containsMergeableValues;
}

- (void)setContainsMergeableValues:(BOOL)a3
{
  self->_containsMergeableValues = a3;
}

- (NSMutableArray)skippedRecordsWithPurelyMergeableChanges
{
  return self->_skippedRecordsWithPurelyMergeableChanges;
}

- (void)setSkippedRecordsWithPurelyMergeableChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedRecordsWithPurelyMergeableChanges, 0);
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, 0);
  objc_storeStrong((id *)&self->_mergeableFieldKeyByRequestID, 0);
  objc_storeStrong((id *)&self->_recordByRequestID, 0);
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_requestedFieldsByRecordID, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToSigningPCSIdentity, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong(&self->_replacedDeltasBlock, 0);
  objc_storeStrong(&self->_mergeableDeltaSavedBlock, 0);
  objc_storeStrong(&self->_recordPostedBlock, 0);
  objc_storeStrong((id *)&self->_userPublicKeys, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
}

@end