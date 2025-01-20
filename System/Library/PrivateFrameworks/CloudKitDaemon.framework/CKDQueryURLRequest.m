@interface CKDQueryURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)isFullZoneRequest;
- (BOOL)requestGETPreAuth;
- (BOOL)requiresCKAnonymousUserIDs;
- (BOOL)shouldFetchAssetContent;
- (CKDQueryURLRequest)initWithOperation:(id)a3 query:(id)a4 cursor:(id)a5 limit:(unint64_t)a6 requestedFields:(id)a7 zoneID:(id)a8;
- (CKQuery)query;
- (CKRecordZoneID)zoneID;
- (NSArray)requestedFields;
- (NSData)cursor;
- (NSData)resultsCursor;
- (NSMutableArray)queryResponses;
- (NSMutableArray)recordResponses;
- (NSSet)desiredAssetKeys;
- (id)generateRequestOperations;
- (id)recordsParsedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (unint64_t)limit;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidComplete;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setCursor:(id)a3;
- (void)setDesiredAssetKeys:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setQuery:(id)a3;
- (void)setQueryResponses:(id)a3;
- (void)setRecordResponses:(id)a3;
- (void)setRecordsParsedBlock:(id)a3;
- (void)setRequestedFields:(id)a3;
- (void)setResultsCursor:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKDQueryURLRequest

- (CKDQueryURLRequest)initWithOperation:(id)a3 query:(id)a4 cursor:(id)a5 limit:(unint64_t)a6 requestedFields:(id)a7 zoneID:(id)a8
{
  id v28 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CKDQueryURLRequest;
  v20 = [(CKDURLRequest *)&v29 initWithOperation:a3];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19);
    queryResponses = v20->_queryResponses;
    v20->_queryResponses = (NSMutableArray *)v21;

    objc_storeStrong((id *)&v20->_query, a4);
    objc_storeStrong((id *)&v20->_cursor, a5);
    v20->_limit = a6;
    objc_storeStrong((id *)&v20->_requestedFields, a7);
    objc_storeStrong((id *)&v20->_zoneID, a8);
    v20->_shouldFetchAssetContent = 1;
    uint64_t v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v23, v24);
    recordResponses = v20->_recordResponses;
    v20->_recordResponses = (NSMutableArray *)v25;
  }
  return v20;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKDQueryURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v17 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_query(self, v5, v6, v17.receiver, v17.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"query");

  v11 = objc_msgSend_cursor(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"cursor");

  id v15 = objc_msgSend_zoneID(self, v13, v14);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, @"zoneID");
}

- (void)fillOutRequestProperties:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneID(self, v5, v6);
  v9 = (void *)v7;
  if (v7)
  {
    v13[0] = v7;
    uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v13, 1);
    objc_msgSend_setFetchRecordZoneIDs_(v4, v11, (uint64_t)v10);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKDQueryURLRequest;
  [(CKDURLRequest *)&v12 fillOutRequestProperties:v4];
}

- (BOOL)isFullZoneRequest
{
  return 1;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (BOOL)requestGETPreAuth
{
  id v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  if (objc_msgSend_usePreauth(v4, v5, v6)) {
    BOOL shouldFetchAssetContent = self->_shouldFetchAssetContent;
  }
  else {
    BOOL shouldFetchAssetContent = 0;
  }

  return shouldFetchAssetContent;
}

- (id)zoneIDsToLock
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_zoneID(self, a2, v2);

  if (v4)
  {
    uint64_t v7 = objc_msgSend_zoneID(self, v5, v6);
    v11[0] = v7;
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v11, 1);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  v8.receiver = self;
  v8.super_class = (Class)CKDQueryURLRequest;
  if (![(CKDURLRequest *)&v8 requiresCKAnonymousUserIDs]) {
    return 0;
  }
  v5 = objc_msgSend_zoneID(self, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)generateRequestOperations
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  BOOL v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  if (!objc_msgSend_requiresCKAnonymousUserIDs(self, v7, v8))
  {
LABEL_4:
    id v28 = objc_opt_new();
    objc_msgSend_setQueryRetrieveRequest_(v6, v29, (uint64_t)v28);

    v32 = objc_msgSend_query(self, v30, v31);

    if (v32)
    {
      v35 = objc_msgSend_translator(self, v33, v34);
      v38 = objc_msgSend_query(self, v36, v37);
      id v188 = 0;
      v40 = objc_msgSend_pQueryFromQuery_error_(v35, v39, (uint64_t)v38, &v188);
      id v41 = v188;
      v44 = objc_msgSend_queryRetrieveRequest(v6, v42, v43);
      objc_msgSend_setQuery_(v44, v45, (uint64_t)v40);

      if (v41)
      {
        objc_msgSend_finishWithError_(self, v46, (uint64_t)v41);

        v48 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_41;
      }
    }
    else
    {
      v49 = objc_msgSend_cursor(self, v33, v34);

      if (v49)
      {
        v50 = objc_msgSend_cursor(self, v46, v47);
        v53 = objc_msgSend_queryRetrieveRequest(v6, v51, v52);
        objc_msgSend_setContinuationMarker_(v53, v54, (uint64_t)v50);
      }
    }
    v55 = objc_msgSend_zoneID(self, v46, v47);

    if (v55)
    {
      v58 = objc_msgSend_translator(self, v56, v57);
      v61 = objc_msgSend_zoneID(self, v59, v60);
      v63 = objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v58, v62, (uint64_t)v61);
      v66 = objc_msgSend_queryRetrieveRequest(v6, v64, v65);
      objc_msgSend_setZoneIdentifier_(v66, v67, (uint64_t)v63);
    }
    v68 = objc_msgSend_requestedFields(self, v56, v57);

    if (v68)
    {
      v71 = objc_opt_new();
      v74 = objc_msgSend_queryRetrieveRequest(v6, v72, v73);
      objc_msgSend_setRequestedFields_(v74, v75, (uint64_t)v71);

      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      v78 = objc_msgSend_requestedFields(self, v76, v77);
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v184, v191, 16);
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v185;
        do
        {
          for (uint64_t i = 0; i != v81; ++i)
          {
            if (*(void *)v185 != v82) {
              objc_enumerationMutation(v78);
            }
            uint64_t v84 = *(void *)(*((void *)&v184 + 1) + 8 * i);
            v85 = objc_opt_new();
            objc_msgSend_setName_(v85, v86, v84);
            v89 = objc_msgSend_queryRetrieveRequest(v6, v87, v88);
            v92 = objc_msgSend_requestedFields(v89, v90, v91);
            objc_msgSend_addFields_(v92, v93, (uint64_t)v85);
          }
          uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v94, (uint64_t)&v184, v191, 16);
        }
        while (v81);
      }
    }
    if (objc_msgSend_limit(self, v69, v70))
    {
      unint64_t v97 = objc_msgSend_limit(self, v95, v96);
      if (v97 >= 0xFFFFFFFF) {
        uint64_t v100 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v100 = v97;
      }
      v101 = objc_msgSend_queryRetrieveRequest(v6, v98, v99);
      objc_msgSend_setLimit_(v101, v102, v100);
    }
    v103 = objc_msgSend_desiredAssetKeys(self, v95, v96);
    uint64_t v106 = objc_msgSend_count(v103, v104, v105);

    if (v106)
    {
      v109 = objc_opt_new();
      v112 = objc_msgSend_queryRetrieveRequest(v6, v110, v111);
      objc_msgSend_setAssetsToDownload_(v112, v113, (uint64_t)v109);

      v114 = objc_opt_new();
      v117 = objc_msgSend_queryRetrieveRequest(v6, v115, v116);
      v120 = objc_msgSend_assetsToDownload(v117, v118, v119);
      objc_msgSend_setAssetFields_(v120, v121, (uint64_t)v114);

      long long v182 = 0u;
      long long v183 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      v124 = objc_msgSend_desiredAssetKeys(self, v122, v123);
      uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v180, v190, 16);
      if (v126)
      {
        uint64_t v127 = v126;
        uint64_t v128 = *(void *)v181;
        do
        {
          for (uint64_t j = 0; j != v127; ++j)
          {
            if (*(void *)v181 != v128) {
              objc_enumerationMutation(v124);
            }
            uint64_t v130 = *(void *)(*((void *)&v180 + 1) + 8 * j);
            v131 = objc_opt_new();
            objc_msgSend_setName_(v131, v132, v130);
            v135 = objc_msgSend_queryRetrieveRequest(v6, v133, v134);
            v138 = objc_msgSend_assetsToDownload(v135, v136, v137);
            v141 = objc_msgSend_assetFields(v138, v139, v140);
            objc_msgSend_addFields_(v141, v142, (uint64_t)v131);
          }
          uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v143, (uint64_t)&v180, v190, 16);
        }
        while (v127);
      }
    }
    else
    {
      if (!objc_msgSend_shouldFetchAssetContent(self, v107, v108))
      {
LABEL_40:
        v189 = v6;
        v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v164, (uint64_t)&v189, 1);
        goto LABEL_41;
      }
      v165 = objc_opt_new();
      v168 = objc_msgSend_queryRetrieveRequest(v6, v166, v167);
      objc_msgSend_setAssetsToDownload_(v168, v169, (uint64_t)v165);

      uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v170, v171);
      v124 = objc_msgSend_queryRetrieveRequest(v6, v173, v174);
      v177 = objc_msgSend_assetsToDownload(v124, v175, v176);
      objc_msgSend_setAllAssets_(v177, v178, AssetContent);
    }
    goto LABEL_40;
  }
  v11 = objc_msgSend_zoneID(self, v9, v10);
  uint64_t v14 = objc_msgSend_anonymousCKUserID(v11, v12, v13);

  if (v14)
  {
    objc_super v17 = objc_msgSend_zoneID(self, v15, v16);
    v20 = objc_msgSend_anonymousCKUserID(v17, v18, v19);
    v23 = objc_msgSend_CKDPIdentifier_User(v20, v21, v22);
    v26 = objc_msgSend_request(v6, v24, v25);
    objc_msgSend_setAnonymousCKUserID_(v26, v27, (uint64_t)v23);

    goto LABEL_4;
  }
  v144 = objc_opt_new();
  v145 = NSString;
  v148 = objc_msgSend_zoneID(self, v146, v147);
  v150 = objc_msgSend_stringWithFormat_(v145, v149, @"An anonymousCKUserID is required to query in zone %@ in the shared database when using anonymous to server share participants", v148);

  objc_msgSend_setObject_forKeyedSubscript_(v144, v151, (uint64_t)v150, *MEMORY[0x1E4F28568]);
  v154 = objc_msgSend_operation(self, v152, v153);
  v157 = objc_msgSend_topmostParentOperation(v154, v155, v156);

  v161 = objc_msgSend_operationID(v157, v158, v159);
  if (v161) {
    objc_msgSend_setObject_forKeyedSubscript_(v144, v160, (uint64_t)v161, *MEMORY[0x1E4F19C50]);
  }
  v162 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v160, *MEMORY[0x1E4F19DD8], 5015, v144);
  objc_msgSend_finishWithError_(self, v163, (uint64_t)v162);

  v48 = 0;
LABEL_41:

  return v48;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_hasQueryRetrieveResponse(v4, v5, v6))
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v86 = v4;
    v9 = objc_msgSend_queryRetrieveResponse(v4, v7, v8);
    objc_super v12 = objc_msgSend_queryResults(v9, v10, v11);

    obuint64_t j = v12;
    uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v94, v100, 16);
    id v14 = 0;
    if (v90)
    {
      uint64_t v89 = *(void *)v95;
      uint64_t v88 = self;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v95 != v89) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v94 + 1) + 8 * v15);
          objc_super v17 = (void *)MEMORY[0x1C8789E70]();
          uint64_t v91 = v17;
          if (objc_msgSend_hasRecord(v16, v18, v19))
          {
            uint64_t v22 = objc_msgSend_translator(self, v20, v21);
            uint64_t v25 = objc_msgSend_record(v16, v23, v24);
            id v28 = objc_msgSend_zoneID(self, v26, v27);
            objc_msgSend_anonymousCKUserID(v28, v29, v30);
            v32 = uint64_t v31 = self;
            id v93 = v14;
            uint64_t v34 = objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v22, v33, (uint64_t)v25, v32, &v93);
            id v35 = v93;

            if (!v34)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              self = v88;
              objc_super v17 = v91;
              v58 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                v61 = v58;
                v64 = objc_msgSend_record(v16, v62, v63);
                v67 = objc_msgSend_recordIdentifier(v64, v65, v66);
                *(_DWORD *)buf = 138543362;
                uint64_t v99 = v67;
                _os_log_error_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_ERROR, "Invalid data in server protobuf, ignoring record. Offending record: %{public}@", buf, 0xCu);

                objc_super v17 = v91;
              }
              id v14 = v35;
              goto LABEL_26;
            }
            objc_msgSend_updateShareIDCacheWithRecord_(v31, v36, (uint64_t)v34);
            self = v31;
            objc_super v17 = v91;
          }
          else
          {
            uint64_t v34 = 0;
            id v35 = v14;
          }
          if (!objc_msgSend_hasIdentifier(v16, v20, v21))
          {
            v50 = 0;
            id v14 = v35;
            goto LABEL_15;
          }
          v39 = objc_msgSend_translator(self, v37, v38);
          v42 = objc_msgSend_identifier(v16, v40, v41);
          v45 = objc_msgSend_zoneID(self, v43, v44);
          v48 = objc_msgSend_anonymousCKUserID(v45, v46, v47);
          id v92 = v35;
          v50 = objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v39, v49, (uint64_t)v42, v48, &v92);
          id v14 = v92;

          if (v50)
          {
            self = v88;
            objc_super v17 = v91;
LABEL_15:
            v51 = [CKDRecordResponse alloc];
            v54 = objc_msgSend_etag(v16, v52, v53);
            v56 = objc_msgSend_initWithRecordID_record_etag_(v51, v55, (uint64_t)v50, v34, v54);

            objc_msgSend_addObject_(self->_recordResponses, v57, (uint64_t)v56);
            goto LABEL_26;
          }
          objc_super v17 = v91;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          self = v88;
          v59 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            v68 = v59;
            v71 = objc_msgSend_identifier(v16, v69, v70);
            *(_DWORD *)buf = 138543362;
            uint64_t v99 = v71;
            _os_log_error_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_ERROR, "Invalid data in server protobuf, ignoring record. Offending identifier: %{public}@", buf, 0xCu);
          }
LABEL_26:
          ++v15;
        }
        while (v90 != v15);
        uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v60, (uint64_t)&v94, v100, 16);
      }
      while (v90);
    }

    id v4 = v86;
    v74 = objc_msgSend_queryRetrieveResponse(v86, v72, v73);
    int hasContinuationMarker = objc_msgSend_hasContinuationMarker(v74, v75, v76);

    if (hasContinuationMarker)
    {
      uint64_t v80 = objc_msgSend_queryRetrieveResponse(v86, v78, v79);
      v83 = objc_msgSend_continuationMarker(v80, v81, v82);
      objc_msgSend_setResultsCursor_(self, v84, (uint64_t)v83);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_result(v4, v5, v6);
  uint64_t v10 = objc_msgSend_error(v7, v8, v9);
  if ((objc_msgSend_hasClientError(v10, v11, v12) & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v15 = objc_msgSend_result(v4, v13, v14);
  v18 = objc_msgSend_error(v15, v16, v17);
  uint64_t v21 = objc_msgSend_clientError(v18, v19, v20);
  int v24 = objc_msgSend_type(v21, v22, v23);

  if (v24 != 4)
  {
LABEL_6:
    v47.receiver = self;
    v47.super_class = (Class)CKDQueryURLRequest;
    [(CKDURLRequest *)&v47 requestDidParseNodeFailure:v4];
    goto LABEL_9;
  }
  uint64_t v27 = objc_msgSend_result(v4, v25, v26);
  uint64_t v30 = objc_msgSend_error(v27, v28, v29);
  int hasErrorDescription = objc_msgSend_hasErrorDescription(v30, v31, v32);

  if (hasErrorDescription)
  {
    uint64_t v48 = *MEMORY[0x1E4F28568];
    v36 = objc_msgSend_result(v4, v34, v35);
    v39 = objc_msgSend_error(v36, v37, v38);
    v42 = objc_msgSend_errorDescription(v39, v40, v41);
    v49[0] = v42;
    uint64_t v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v43, (uint64_t)v49, &v48, 1);
  }
  else
  {
    uint64_t v44 = 0;
  }
  v45 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v34, *MEMORY[0x1E4F19DD8], 1009, v44);
  objc_msgSend_finishWithError_(self, v46, (uint64_t)v45);

LABEL_9:
}

- (void)requestDidComplete
{
  v3 = (void *)MEMORY[0x1C8789E70](self, a2);
  uint64_t v6 = objc_msgSend_recordsParsedBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_recordsParsedBlock(self, v7, v8);
    uint64_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, NSMutableArray *))v9)[2](v9, self->_recordResponses);
  }
}

- (NSMutableArray)queryResponses
{
  return self->_queryResponses;
}

- (void)setQueryResponses:(id)a3
{
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSData)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (NSArray)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_BOOL shouldFetchAssetContent = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
}

- (id)recordsParsedBlock
{
  return self->_recordsParsedBlock;
}

- (void)setRecordsParsedBlock:(id)a3
{
}

- (NSData)resultsCursor
{
  return self->_resultsCursor;
}

- (void)setResultsCursor:(id)a3
{
}

- (NSMutableArray)recordResponses
{
  return self->_recordResponses;
}

- (void)setRecordResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordResponses, 0);
  objc_storeStrong((id *)&self->_resultsCursor, 0);
  objc_storeStrong(&self->_recordsParsedBlock, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryResponses, 0);
}

@end