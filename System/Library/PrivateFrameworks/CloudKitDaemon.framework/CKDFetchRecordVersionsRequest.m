@interface CKDFetchRecordVersionsRequest
- (BOOL)isDeleted;
- (BOOL)shouldFetchAssetContent;
- (CKDFetchRecordVersionsRequest)initWithOperation:(id)a3 recordIDs:(id)a4 desiredKeys:(id)a5 minimumVersionETag:(id)a6;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSMutableDictionary)recordIDByRequestID;
- (NSString)minimumVersionETag;
- (id)generateRequestOperations;
- (id)recordIDsUsedInZones:(id)a3;
- (id)recordVersionsFetchedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setMinimumVersionETag:(id)a3;
- (void)setRecordIDByRequestID:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRecordVersionsFetchedBlock:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
@end

@implementation CKDFetchRecordVersionsRequest

- (CKDFetchRecordVersionsRequest)initWithOperation:(id)a3 recordIDs:(id)a4 desiredKeys:(id)a5 minimumVersionETag:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKDFetchRecordVersionsRequest;
  v14 = [(CKDURLRequest *)&v19 initWithOperation:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recordIDs, a4);
    objc_storeStrong((id *)&v15->_desiredKeys, a5);
    objc_storeStrong((id *)&v15->_minimumVersionETag, a6);
    uint64_t v16 = objc_opt_new();
    recordIDByRequestID = v15->_recordIDByRequestID;
    v15->_recordIDByRequestID = (NSMutableDictionary *)v16;

    v15->_shouldFetchAssetContent = 1;
  }

  return v15;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CKDFetchRecordVersionsRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v19 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_recordIDs(self, v6, v7, v19.receiver, v19.super_class);
  id v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  id v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"recordIDs");
  v17 = objc_msgSend_minimumVersionETag(self, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v18, (uint64_t)v17, @"minimumVersionETag");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDs(self, v5, v6);
  objc_msgSend_setFetchRecordIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchRecordVersionsRequest;
  [(CKDURLRequest *)&v9 fillOutRequestProperties:v4];
}

- (id)recordIDsUsedInZones:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_recordIDs(self, v5, v6);
  objc_super v9 = objc_msgSend_recordIDs_filteredByZones_(self, v8, (uint64_t)v7, v4);

  return v9;
}

- (id)zoneIDsToLock
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend_recordIDs(self, v4, v5, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, v24, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v6);
        }
        v15 = objc_msgSend_zoneID(*(void **)(*((void *)&v20 + 1) + 8 * i), v9, v10);
        if (v15) {
          objc_msgSend_addObject_(v3, v14, (uint64_t)v15);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }

  v18 = objc_msgSend_allObjects(v3, v16, v17);

  return v18;
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
  id v4 = objc_msgSend_recordIDs(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4FFAC38;
  v8[3] = &unk_1E64F8750;
  v8[4] = self;
  uint64_t v6 = objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_1C4FFB1B0;
  v47 = sub_1C4FFB1C0;
  id v48 = 0;
  uint64_t v7 = objc_msgSend_recordIDByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  id v13 = objc_msgSend_operationUUID(v10, v11, v12);
  v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  if (objc_msgSend_hasRecordRetrieveVersionsResponse(v4, v16, v17))
  {
    long long v20 = objc_msgSend_recordRetrieveVersionsResponse(v4, v18, v19);
    long long v23 = objc_msgSend_recordVersions(v20, v21, v22);
  }
  else
  {
    long long v23 = 0;
  }
  if (objc_msgSend_count(v23, v18, v19))
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_1C4FFB1C8;
    v42[3] = &unk_1E64F8778;
    v42[4] = self;
    v42[5] = &v43;
    v26 = objc_msgSend_CKCompactMap_(v23, v24, (uint64_t)v42);
  }
  else
  {
    v26 = 0;
  }
  v27 = objc_msgSend_recordVersionsFetchedBlock(self, v24, v25);

  if (v27)
  {
    objc_msgSend_recordVersionsFetchedBlock(self, v28, v29);
    v30 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_recordRetrieveVersionsResponse(v4, v31, v32);
    uint64_t isDeleted = objc_msgSend_isDeleted(v33, v34, v35);
    v39 = objc_msgSend_result(v4, v37, v38);
    ((void (**)(void, void *, uint64_t, void *, void *))v30)[2](v30, v15, isDeleted, v26, v39);
  }
  id v40 = (id)v44[5];

  _Block_object_dispose(&v43, 8);
  return v40;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v24 = a3;
  uint64_t v6 = objc_msgSend_recordIDByRequestID(self, v4, v5);
  uint64_t v9 = objc_msgSend_response(v24, v7, v8);
  uint64_t v12 = objc_msgSend_operationUUID(v9, v10, v11);
  v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);

  uint64_t v17 = objc_msgSend_recordVersionsFetchedBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_recordVersionsFetchedBlock(self, v18, v19);
    long long v20 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    long long v23 = objc_msgSend_result(v24, v21, v22);
    ((void (**)(void, void *, void, void, void *))v20)[2](v20, v14, 0, 0, v23);
  }
}

- (id)recordVersionsFetchedBlock
{
  return self->_recordVersionsFetchedBlock;
}

- (void)setRecordVersionsFetchedBlock:(id)a3
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

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
}

- (NSMutableDictionary)recordIDByRequestID
{
  return self->_recordIDByRequestID;
}

- (void)setRecordIDByRequestID:(id)a3
{
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_uint64_t isDeleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordVersionsFetchedBlock, 0);
}

@end