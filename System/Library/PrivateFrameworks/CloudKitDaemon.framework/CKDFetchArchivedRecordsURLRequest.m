@interface CKDFetchArchivedRecordsURLRequest
- (BOOL)shouldFetchAssetContent;
- (CKDFetchArchivedRecordsURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4 configurationsByRecordZoneID:(id)a5;
- (NSArray)recordZoneIDs;
- (NSDictionary)configurationsByRecordZoneID;
- (NSDictionary)resultsByRecordZoneID;
- (NSDictionary)zoneErrorsByZoneID;
- (NSMutableDictionary)nodeErrorsByZoneID;
- (NSMutableDictionary)requestResultsByRecordZoneID;
- (NSMutableDictionary)zoneIDsByRequestOperationUUID;
- (NSSet)desiredAssetKeys;
- (id)_handleRecords:(id)a3;
- (id)generateRequestOperations;
- (id)recordFetchedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setDesiredAssetKeys:(id)a3;
- (void)setNodeErrorsByZoneID:(id)a3;
- (void)setRecordFetchedBlock:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
- (void)setRequestResultsByRecordZoneID:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
- (void)setZoneIDsByRequestOperationUUID:(id)a3;
@end

@implementation CKDFetchArchivedRecordsURLRequest

- (CKDFetchArchivedRecordsURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4 configurationsByRecordZoneID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKDFetchArchivedRecordsURLRequest;
  v12 = [(CKDURLRequest *)&v22 initWithOperation:a3];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
    recordZoneIDs = v12->_recordZoneIDs;
    v12->_recordZoneIDs = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_configurationsByRecordZoneID, a5);
    uint64_t v15 = objc_opt_new();
    zoneIDsByRequestOperationUUID = v12->_zoneIDsByRequestOperationUUID;
    v12->_zoneIDsByRequestOperationUUID = (NSMutableDictionary *)v15;

    v12->_shouldFetchAssetContent = 1;
    uint64_t v17 = objc_opt_new();
    requestResultsByRecordZoneID = v12->_requestResultsByRecordZoneID;
    v12->_requestResultsByRecordZoneID = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    nodeErrorsByZoneID = v12->_nodeErrorsByZoneID;
    v12->_nodeErrorsByZoneID = (NSMutableDictionary *)v19;
  }
  return v12;
}

- (NSDictionary)zoneErrorsByZoneID
{
  v3 = objc_msgSend_nodeErrorsByZoneID(self, a2, v2);
  v6 = objc_msgSend_copy(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (NSDictionary)resultsByRecordZoneID
{
  v3 = objc_msgSend_requestResultsByRecordZoneID(self, a2, v2);
  v6 = objc_msgSend_copy(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_msgSend_recordZoneIDs(self, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v32, v36, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend_configurationsByRecordZoneID(self, v9, v10, v29);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v14);
        v20 = objc_msgSend_previousServerChangeToken(v17, v18, v19);
        v23 = objc_msgSend_data(v20, v21, v22);

        if (!v23)
        {
          v23 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v24, v25);
        }
        v26 = objc_msgSend_sqliteRepresentation(v14, v24, v25);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v23, v26);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v32, v36, 16);
    }
    while (v11);
  }

  v31.receiver = self;
  v31.super_class = (Class)CKDFetchArchivedRecordsURLRequest;
  [(CKDURLRequest *)&v31 fillOutEquivalencyPropertiesBuilder:v29];
  objc_msgSend_setObject_forKeyedSubscript_(v29, v28, (uint64_t)v4, @"zid->token");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_recordZoneIDs(self, v5, v6);
  objc_msgSend_setFetchRecordZoneIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchArchivedRecordsURLRequest;
  [(CKDURLRequest *)&v9 fillOutRequestProperties:v4];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  id v4 = objc_msgSend_recordZoneIDs(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4F66268;
  v8[3] = &unk_1E64F48D8;
  v8[4] = self;
  uint64_t v6 = objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)_handleRecords:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = a3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v29, v33, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v30;
    uint64_t v27 = *MEMORY[0x1E4F19C40];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1C8789E70]();
        uint64_t v15 = objc_msgSend_recordFetchedBlock(self, v13, v14);

        if (v15)
        {
          v18 = objc_msgSend_translator(self, v16, v17);
          id v28 = v8;
          v20 = objc_msgSend_recordFromPRecord_error_(v18, v19, v11, &v28);
          id v21 = v28;

          if (v20)
          {
            objc_msgSend_recordFetchedBlock(self, v22, v23);
            v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
            ((void (**)(void, void *))v24)[2](v24, v20);
          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, v27, 2006, @"Invalid data received from server");
            v24 = (void (**)(void, void))v21;
            id v21 = (id)objc_claimAutoreleasedReturnValue();
          }

          uint64_t v8 = v21;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v25, (uint64_t)&v29, v33, 16);
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_hasFetchArchivedRecordsResponse(v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v8, v9);
    uint64_t v13 = objc_msgSend_response(v5, v11, v12);
    v16 = objc_msgSend_operationUUID(v13, v14, v15);
    v18 = objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);

    if (!v18)
    {
      v55 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
      v58 = objc_msgSend_response(v5, v56, v57);
      v61 = objc_msgSend_operationUUID(v58, v59, v60);
      v64 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v62, v63);
      v67 = objc_msgSend_allKeys(v64, v65, v66);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v68, (uint64_t)a2, self, @"CKDFetchArchivedRecordsURLRequest.m", 140, @"Got a response for an unknown zone with request operation %@ %@", v61, v67);
    }
    id v21 = objc_msgSend_recordFetchedBlock(self, v19, v20);

    if (v21)
    {
      v24 = objc_msgSend_fetchArchivedRecordsResponse(v5, v22, v23);
      uint64_t v27 = objc_msgSend_records(v24, v25, v26);
      id v21 = objc_msgSend__handleRecords_(self, v28, (uint64_t)v27);

      if (v21) {
        id v29 = v21;
      }
    }
    long long v30 = objc_opt_new();
    long long v33 = objc_msgSend_fetchArchivedRecordsResponse(v5, v31, v32);
    v36 = objc_msgSend_archiveContinuationToken(v33, v34, v35);
    objc_msgSend_setResultServerChangeTokenData_(v30, v37, (uint64_t)v36);

    v40 = objc_msgSend_fetchArchivedRecordsResponse(v5, v38, v39);
    LODWORD(v36) = objc_msgSend_hasStatus(v40, v41, v42);

    if (v36)
    {
      v45 = objc_msgSend_fetchArchivedRecordsResponse(v5, v43, v44);
      int v48 = objc_msgSend_status(v45, v46, v47);

      BOOL v49 = v48 != 2;
    }
    else
    {
      BOOL v49 = 1;
    }
    objc_msgSend_setStatus_(v30, v43, v49);
    v52 = objc_msgSend_requestResultsByRecordZoneID(self, v50, v51);
    objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v30, v18);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_result(v4, v16, v17);
  if (objc_msgSend_code(v18, v19, v20) != 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v21 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v51 = v21;
      v54 = objc_msgSend_error(v18, v52, v53);
      uint64_t v57 = objc_msgSend_errorDescription(v54, v55, v56);
      *(_DWORD *)buf = 138543618;
      v64 = v15;
      __int16 v65 = 2114;
      uint64_t v66 = v57;
      _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "Error fetching archived records in zone %{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v23 = *MEMORY[0x1E4F19DD8];
    uint64_t v24 = sub_1C4E94D98(v18);
    uint64_t v25 = sub_1C4E940D0(self, v18);
    id v28 = objc_msgSend_error(v18, v26, v27);
    long long v31 = objc_msgSend_errorDescription(v28, v29, v30);
    long long v33 = objc_msgSend_errorWithDomain_code_userInfo_format_(v22, v32, v23, v24, v25, @"Error fetching archived records in zone %@: %@", v15, v31);

    if (v15)
    {
      v36 = objc_msgSend_nodeErrorsByZoneID(self, v34, v35);
      objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v33, v15);
    }
    else
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v38 = objc_msgSend_zoneIDsByRequestOperationUUID(self, v34, v35);
      v36 = objc_msgSend_allValues(v38, v39, v40);

      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v41, (uint64_t)&v58, v62, 16);
      if (v42)
      {
        uint64_t v45 = v42;
        uint64_t v46 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(v36);
            }
            uint64_t v48 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            BOOL v49 = objc_msgSend_nodeErrorsByZoneID(self, v43, v44);
            objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v33, v48);
          }
          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v43, (uint64_t)&v58, v62, 16);
        }
        while (v45);
        uint64_t v15 = 0;
      }
    }
  }
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
}

- (NSMutableDictionary)zoneIDsByRequestOperationUUID
{
  return self->_zoneIDsByRequestOperationUUID;
}

- (void)setZoneIDsByRequestOperationUUID:(id)a3
{
}

- (NSMutableDictionary)requestResultsByRecordZoneID
{
  return self->_requestResultsByRecordZoneID;
}

- (void)setRequestResultsByRecordZoneID:(id)a3
{
}

- (NSMutableDictionary)nodeErrorsByZoneID
{
  return self->_nodeErrorsByZoneID;
}

- (void)setNodeErrorsByZoneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_requestResultsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsByRequestOperationUUID, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end