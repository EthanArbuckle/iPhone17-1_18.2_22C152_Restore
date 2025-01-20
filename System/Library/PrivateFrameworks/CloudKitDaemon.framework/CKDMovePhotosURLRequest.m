@interface CKDMovePhotosURLRequest
- (BOOL)atomic;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (CKDMovePhotosURLRequest)initWithOperation:(id)a3 moveChanges:(id)a4 sourceDatabaseScope:(int64_t)a5 atomic:(BOOL)a6;
- (NSArray)moveChanges;
- (NSMutableDictionary)recordByRequestID;
- (NSMutableDictionary)recordIDByRequestID;
- (id)generateRequestOperations;
- (id)recordIDsUsedInZones:(id)a3;
- (id)recordPostedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (int)isolationLevel;
- (int64_t)sourceDatabaseScope;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAtomic:(BOOL)a3;
- (void)setMoveChanges:(id)a3;
- (void)setRecordByRequestID:(id)a3;
- (void)setRecordIDByRequestID:(id)a3;
- (void)setRecordPostedBlock:(id)a3;
- (void)setSourceDatabaseScope:(int64_t)a3;
@end

@implementation CKDMovePhotosURLRequest

- (CKDMovePhotosURLRequest)initWithOperation:(id)a3 moveChanges:(id)a4 sourceDatabaseScope:(int64_t)a5 atomic:(BOOL)a6
{
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CKDMovePhotosURLRequest;
  v12 = [(CKDURLRequest *)&v19 initWithOperation:a3];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_moveChanges, a4);
    v13->_sourceDatabaseScope = a5;
    v13->_atomic = a6;
    uint64_t v14 = objc_opt_new();
    recordIDByRequestID = v13->_recordIDByRequestID;
    v13->_recordIDByRequestID = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    recordByRequestID = v13->_recordByRequestID;
    v13->_recordByRequestID = (NSMutableDictionary *)v16;
  }
  return v13;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CKDMovePhotosURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v22 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_moveChanges(self, v6, v7, v22.receiver, v22.super_class);
  id v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"moveChanges");
  v15 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v18 = objc_msgSend_sourceDatabaseScope(self, v16, v17);
  v20 = objc_msgSend_numberWithInteger_(v15, v19, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, (uint64_t)v20, @"sourceDatabaseScope");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_moveChanges(self, v5, v6);
  v9 = objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1F2044AB0);

  v12 = objc_msgSend_moveChanges(self, v10, v11);
  uint64_t v14 = objc_msgSend_CKCompactMap_(v12, v13, (uint64_t)&unk_1F2044AD0);
  uint64_t v16 = objc_msgSend_CKCompactMap_(v14, v15, (uint64_t)&unk_1F2044AF0);

  objc_msgSend_setModifyRecordIDs_(v4, v17, (uint64_t)v16);
  objc_msgSend_setDeleteRecordIDs_(v4, v18, (uint64_t)v9);
  v19.receiver = self;
  v19.super_class = (Class)CKDMovePhotosURLRequest;
  [(CKDURLRequest *)&v19 fillOutRequestProperties:v4];
}

- (id)recordIDsUsedInZones:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  objc_msgSend_moveChanges(self, v6, v7);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v42, v46, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_sourceRecordID(v15, v10, v11);
        objc_super v19 = objc_msgSend_zoneID(v16, v17, v18);
        int v21 = objc_msgSend_containsObject_(v4, v20, (uint64_t)v19);

        if (v21)
        {
          v24 = objc_msgSend_sourceRecordID(v15, v22, v23);
          objc_msgSend_addObject_(v5, v25, (uint64_t)v24);
        }
        v26 = objc_msgSend_destinationRecord(v15, v22, v23);
        v29 = objc_msgSend_recordID(v26, v27, v28);
        v32 = objc_msgSend_zoneID(v29, v30, v31);
        int v34 = objc_msgSend_containsObject_(v4, v33, (uint64_t)v32);

        if (v34)
        {
          v35 = objc_msgSend_destinationRecord(v15, v10, v11);
          v38 = objc_msgSend_recordID(v35, v36, v37);
          objc_msgSend_addObject_(v5, v39, (uint64_t)v38);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v42, v46, 16);
    }
    while (v12);
  }

  return v5;
}

- (id)zoneIDsToLock
{
  v3 = objc_msgSend_moveChanges(self, a2, v2);
  v5 = objc_msgSend_CKFlatMap_(v3, v4, (uint64_t)&unk_1F2044B10);

  uint64_t v7 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v6, (uint64_t)v5);
  uint64_t v10 = objc_msgSend_allObjects(v7, v8, v9);

  return v10;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
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
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v162 = (id)objc_opt_new();
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  objc_msgSend_moveChanges(self, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v165, v169, 16);
  if (v164)
  {
    uint64_t v163 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v164; ++i)
      {
        if (*(void *)v166 != v163) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v165 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend_destinationRecord(v9, v6, v7);
        uint64_t v13 = objc_msgSend_operationType(self, v11, v12);
        v15 = objc_msgSend_operationRequestWithType_(self, v14, v13);
        uint64_t v16 = objc_opt_new();
        objc_msgSend_setRecordMoveRequest_(v15, v17, (uint64_t)v16);

        v20 = objc_msgSend_recordMoveRequest(v15, v18, v19);
        uint64_t v21 = 1;
        objc_msgSend_setMerge_(v20, v22, 1);

        v25 = objc_msgSend_translator(self, v23, v24);
        uint64_t v28 = objc_msgSend_sourceRecordID(v9, v26, v27);
        v30 = objc_msgSend_pRecordIdentifierFromRecordID_(v25, v29, (uint64_t)v28);
        v33 = objc_msgSend_recordMoveRequest(v15, v31, v32);
        objc_msgSend_setOriginId_(v33, v34, (uint64_t)v30);

        unint64_t v37 = objc_msgSend_sourceDatabaseScope(self, v35, v36);
        if (v37 <= 4) {
          uint64_t v21 = dword_1C5080878[v37];
        }
        v40 = objc_msgSend_recordMoveRequest(v15, v38, v39);
        long long v43 = objc_msgSend_originId(v40, v41, v42);
        v46 = objc_msgSend_zoneIdentifier(v43, v44, v45);
        objc_msgSend_setDatabaseType_(v46, v47, v21);

        v50 = objc_msgSend_sourceRecordChangeTag(v9, v48, v49);
        v53 = objc_msgSend_recordMoveRequest(v15, v51, v52);
        objc_msgSend_setOriginEtag_(v53, v54, (uint64_t)v50);

        v57 = objc_msgSend_translator(self, v55, v56);
        v59 = objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v57, v58, (uint64_t)v10, 1, 0, 0);
        v62 = objc_msgSend_recordMoveRequest(v15, v60, v61);
        objc_msgSend_setDestinationRecord_(v62, v63, (uint64_t)v59);

        v66 = objc_msgSend_etag(v10, v64, v65);
        v69 = objc_msgSend_recordMoveRequest(v15, v67, v68);
        objc_msgSend_setDestinationEtag_(v69, v70, (uint64_t)v66);

        LODWORD(v66) = objc_msgSend_isKnownToServer(v10, v71, v72);
        v75 = objc_msgSend_recordMoveRequest(v15, v73, v74);
        v77 = v75;
        if (v66) {
          objc_msgSend_setSemantics_(v75, v76, 2);
        }
        else {
          objc_msgSend_setSemantics_(v75, v76, 1);
        }

        v80 = objc_msgSend_previousProtectionEtag(v10, v78, v79);
        v83 = objc_msgSend_recordMoveRequest(v15, v81, v82);
        objc_msgSend_setDestinationRecordProtectionInfoTag_(v83, v84, (uint64_t)v80);

        if (objc_msgSend_databaseScope(self, v85, v86) == 2 || objc_msgSend_databaseScope(self, v87, v88) == 3)
        {
          v89 = objc_msgSend_zoneProtectionEtag(v10, v87, v88);
          v92 = objc_msgSend_recordMoveRequest(v15, v90, v91);
          objc_msgSend_setDestinationZoneProtectionInfoTag_(v92, v93, (uint64_t)v89);
        }
        if (*MEMORY[0x1E4F1A4E0])
        {
          v94 = objc_msgSend_unitTestOverrides(self, v87, v88);
          v96 = objc_msgSend_objectForKeyedSubscript_(v94, v95, @"NoRecordProtectionInfoOnSaves");

          if (v96)
          {
            v97 = objc_msgSend_recordMoveRequest(v15, v87, v88);
            v100 = objc_msgSend_destinationRecord(v97, v98, v99);
            objc_msgSend_setProtectionInfo_(v100, v101, 0);
          }
        }
        v102 = objc_msgSend_recordMoveRequest(v15, v87, v88);
        v105 = objc_msgSend_destinationRecord(v102, v103, v104);

        if (v105)
        {
          objc_msgSend_addObject_(v162, v106, (uint64_t)v15);
          v109 = objc_msgSend_recordByRequestID(self, v107, v108);
          v112 = objc_msgSend_request(v15, v110, v111);
          v115 = objc_msgSend_operationUUID(v112, v113, v114);
          objc_msgSend_setObject_forKeyedSubscript_(v109, v116, (uint64_t)v10, v115);

          v119 = objc_msgSend_recordID(v10, v117, v118);
          objc_msgSend_recordIDByRequestID(self, v120, v121);
          v122 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
          v125 = objc_msgSend_request(v15, v123, v124);
          v128 = objc_msgSend_operationUUID(v125, v126, v127);
          objc_msgSend_setObject_forKeyedSubscript_(v122, v129, (uint64_t)v119, v128);
        }
        else
        {
          v119 = objc_opt_new();
          objc_msgSend_setCode_(v119, v130, 3);
          v131 = objc_opt_new();
          objc_msgSend_setError_(v119, v132, (uint64_t)v131);

          v133 = objc_opt_new();
          v136 = objc_msgSend_error(v119, v134, v135);
          objc_msgSend_setClientError_(v136, v137, (uint64_t)v133);

          v140 = objc_msgSend_error(v119, v138, v139);
          v143 = objc_msgSend_clientError(v140, v141, v142);
          objc_msgSend_setType_(v143, v144, 7);

          v147 = objc_msgSend_error(v119, v145, v146);
          objc_msgSend_setErrorKey_(v147, v148, @"Invalid values in record");

          v151 = objc_msgSend_error(v119, v149, v150);
          objc_msgSend_setErrorDescription_(v151, v152, @"The record could not be encoded because it has invalid values");

          v155 = objc_msgSend_recordPostedBlock(self, v153, v154);

          if (!v155) {
            goto LABEL_22;
          }
          objc_msgSend_recordPostedBlock(self, v156, v157);
          v122 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
          v125 = objc_msgSend_recordID(v10, v158, v159);
          ((void (**)(void, void *, void *, void, void, void))v122)[2](v122, v119, v125, 0, 0, 0);
        }

LABEL_22:
      }
      uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v165, v169, 16);
    }
    while (v164);
  }

  return v162;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  if (objc_msgSend_hasRecordMoveResponse(v4, v16, v17))
  {
    v20 = objc_msgSend_result(v4, v18, v19);
    uint64_t v23 = objc_msgSend_error(v20, v21, v22);
    v26 = objc_msgSend_clientError(v23, v24, v25);
    v29 = objc_msgSend_oplockFailure(v26, v27, v28);
    uint64_t v32 = objc_msgSend_recordForOplockFailure(v29, v30, v31);

    uint64_t v150 = (void *)v32;
    if (v32)
    {
      v35 = objc_msgSend_translator(self, v33, v34);
      v38 = objc_msgSend_zoneID(v15, v36, v37);
      v41 = objc_msgSend_anonymousCKUserID(v38, v39, v40);
      id v153 = 0;
      uint64_t v43 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v35, v42, v32, v41, &v153);
      id v44 = v153;

      id v149 = v44;
      if (v43 || !v44)
      {
        v148 = (void *)v43;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v45 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v155 = v44;
          _os_log_error_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_ERROR, "Invalid data from server in response to moveRecords request: %@", buf, 0xCu);
        }
        v148 = 0;
      }
    }
    else
    {
      v148 = 0;
      id v149 = 0;
    }
    v54 = objc_msgSend_translator(self, v33, v34);
    v57 = objc_msgSend_recordMoveResponse(v4, v55, v56);
    v60 = objc_msgSend_movedRecord(v57, v58, v59);
    v63 = objc_msgSend_zoneID(v15, v61, v62);
    v66 = objc_msgSend_anonymousCKUserID(v63, v64, v65);
    id v152 = 0;
    uint64_t v68 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v54, v67, (uint64_t)v60, v66, &v152);
    id v69 = v152;

    v71 = (os_log_t *)MEMORY[0x1E4F1A530];
    v147 = (void *)v68;
    if (v69)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v72 = *v71;
      if (os_log_type_enabled(*v71, OS_LOG_TYPE_ERROR))
      {
        v73 = v72;
        v76 = objc_msgSend_requestUUID(self, v74, v75);
        *(_DWORD *)buf = 138543618;
        id v155 = v76;
        __int16 v156 = 2112;
        id v157 = v69;
        _os_log_error_impl(&dword_1C4CFF000, v73, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Error parsing destination server record returned for save: %@\"", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend_updateShareIDCacheWithRecord_(self, v70, v68);
    }

    uint64_t v79 = objc_msgSend_translator(self, v77, v78);
    uint64_t v82 = objc_msgSend_recordMoveResponse(v4, v80, v81);
    v85 = objc_msgSend_moveMarker(v82, v83, v84);
    uint64_t v88 = objc_msgSend_zoneID(v15, v86, v87);
    uint64_t v91 = objc_msgSend_anonymousCKUserID(v88, v89, v90);
    id v151 = 0;
    v93 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v79, v92, (uint64_t)v85, v91, &v151);
    id v94 = v151;

    if (v94)
    {
      v96 = v148;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v97 = v147;
      v98 = (os_log_t *)MEMORY[0x1E4F1A530];
      uint64_t v99 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
      {
        v102 = v99;
        objc_msgSend_requestUUID(self, v103, v104);
        v106 = v105 = v98;
        *(_DWORD *)buf = 138543618;
        id v155 = v106;
        __int16 v156 = 2112;
        id v157 = v94;
        _os_log_error_impl(&dword_1C4CFF000, v102, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Error parsing move marker server record returned for save: %@\"", buf, 0x16u);

        v98 = v105;
      }
    }
    else
    {
      objc_msgSend_updateShareIDCacheWithRecord_(self, v95, (uint64_t)v93);
      v97 = v147;
      v96 = v148;
      v98 = (os_log_t *)MEMORY[0x1E4F1A530];
    }
    v107 = objc_msgSend_fakeResponseOperationResultByItemID(self, v100, v101);

    if (v107)
    {
      v110 = objc_msgSend_fakeResponseOperationResultByItemID(self, v108, v109);
      v112 = objc_msgSend_objectForKeyedSubscript_(v110, v111, (uint64_t)v15);

      if (v112)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v113 = *v98;
        if (os_log_type_enabled(*v98, OS_LOG_TYPE_ERROR))
        {
          v143 = v113;
          uint64_t v146 = objc_msgSend_requestUUID(self, v144, v145);
          *(_DWORD *)buf = 138543618;
          id v155 = v146;
          __int16 v156 = 2114;
          id v157 = v15;
          _os_log_error_impl(&dword_1C4CFF000, v143, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for item id %{public}@\"", buf, 0x16u);
        }
        objc_msgSend_setResult_(v4, v114, (uint64_t)v112);
      }
    }
    v115 = objc_msgSend_container(self, v108, v109);
    uint64_t v118 = objc_msgSend_entitlements(v115, v116, v117);
    uint64_t hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v118, v119, v120);
    objc_msgSend_setSerializeProtectionData_(v97, v122, hasProtectionDataEntitlement);

    v125 = objc_msgSend_container(self, v123, v124);
    v128 = objc_msgSend_entitlements(v125, v126, v127);
    uint64_t v131 = objc_msgSend_hasProtectionDataEntitlement(v128, v129, v130);
    objc_msgSend_setSerializeProtectionData_(v93, v132, v131);

    uint64_t v135 = objc_msgSend_recordPostedBlock(self, v133, v134);

    if (v135)
    {
      objc_msgSend_recordPostedBlock(self, v136, v137);
      v138 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend_result(v4, v139, v140);
      ((void (**)(void, void *, void *, void *, void *, void *))v138)[2](v138, v141, v15, v97, v96, v93);
    }
    v53 = v149;
  }
  else
  {
    v46 = objc_msgSend_recordPostedBlock(self, v18, v19);

    if (v46)
    {
      objc_msgSend_recordPostedBlock(self, v47, v48);
      uint64_t v49 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v52 = objc_msgSend_result(v4, v50, v51);
      ((void (**)(void, void *, void *, void, void, void))v49)[2](v49, v52, v15, 0, 0, 0);
    }
    v53 = 0;
  }

  return v53;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_result(v4, v16, v17);
  uint64_t v21 = objc_msgSend_error(v18, v19, v20);
  uint64_t v24 = objc_msgSend_clientError(v21, v22, v23);
  uint64_t v27 = objc_msgSend_oplockFailure(v24, v25, v26);
  v30 = objc_msgSend_recordForOplockFailure(v27, v28, v29);

  if (v30)
  {
    v33 = objc_msgSend_translator(self, v31, v32);
    uint64_t v36 = objc_msgSend_zoneID(v15, v34, v35);
    uint64_t v39 = objc_msgSend_anonymousCKUserID(v36, v37, v38);
    id v51 = 0;
    v41 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v33, v40, (uint64_t)v30, v39, &v51);
    id v42 = v51;

    if (!v41 && v42)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v43 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v42;
        _os_log_error_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_ERROR, "Invalid data from server in response to moveRecords request: %@", buf, 0xCu);
      }
    }
  }
  id v44 = objc_msgSend_recordPostedBlock(self, v31, v32);

  if (v44)
  {
    objc_msgSend_recordPostedBlock(self, v45, v46);
    uint64_t v47 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_result(v4, v48, v49);
    ((void (**)(void, void *, void *, void, void, void))v47)[2](v47, v50, v15, 0, 0, 0);
  }
}

- (id)recordPostedBlock
{
  return self->_recordPostedBlock;
}

- (void)setRecordPostedBlock:(id)a3
{
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (void)setSourceDatabaseScope:(int64_t)a3
{
  self->_sourceDatabaseScope = a3;
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordByRequestID, 0);
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_moveChanges, 0);
  objc_storeStrong(&self->_recordPostedBlock, 0);
}

@end