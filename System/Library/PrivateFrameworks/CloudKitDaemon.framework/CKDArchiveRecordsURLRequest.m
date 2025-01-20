@interface CKDArchiveRecordsURLRequest
- (CKDArchiveRecordsURLRequest)initWithOperation:(id)a3 recordIDsToArchive:(id)a4;
- (NSMutableDictionary)recordZoneIDByRequestID;
- (NSMutableDictionary)zoneIDToRecordIDs;
- (id)generateRequestOperations;
- (id)recordArchivedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setRecordArchivedBlock:(id)a3;
- (void)setRecordZoneIDByRequestID:(id)a3;
- (void)setZoneIDToRecordIDs:(id)a3;
@end

@implementation CKDArchiveRecordsURLRequest

- (CKDArchiveRecordsURLRequest)initWithOperation:(id)a3 recordIDsToArchive:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CKDArchiveRecordsURLRequest;
  v7 = [(CKDURLRequest *)&v32 initWithOperation:a3];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    zoneIDToRecordIDs = v7->_zoneIDToRecordIDs;
    v7->_zoneIDToRecordIDs = (NSMutableDictionary *)v8;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v27 = v6;
    id v10 = v6;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, v33, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v10);
          }
          v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v19 = objc_msgSend_zoneID(v18, v13, v14);
          v22 = objc_msgSend_objectForKeyedSubscript_(v7->_zoneIDToRecordIDs, v20, (uint64_t)v19);
          if (!v22)
          {
            v22 = objc_opt_new();
            objc_msgSend_setObject_forKeyedSubscript_(v7->_zoneIDToRecordIDs, v23, (uint64_t)v22, v19);
          }
          objc_msgSend_addObject_(v22, v21, (uint64_t)v18);
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, v33, 16);
      }
      while (v15);
    }

    uint64_t v24 = objc_opt_new();
    recordZoneIDByRequestID = v7->_recordZoneIDByRequestID;
    v7->_recordZoneIDByRequestID = (NSMutableDictionary *)v24;

    id v6 = v27;
  }

  return v7;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_zoneIDToRecordIDs(self, v5, v6);
  id v10 = objc_msgSend_allValues(v7, v8, v9);
  uint64_t v12 = objc_msgSend_CKFlatMap_(v10, v11, (uint64_t)&unk_1F20437F0);

  v14.receiver = self;
  v14.super_class = (Class)CKDArchiveRecordsURLRequest;
  [(CKDURLRequest *)&v14 fillOutEquivalencyPropertiesBuilder:v4];
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"recordIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_zoneIDToRecordIDs(self, v5, v6);
  id v10 = objc_msgSend_allValues(v7, v8, v9);
  uint64_t v12 = objc_msgSend_CKFlatMap_(v10, v11, (uint64_t)&unk_1F2043810);

  objc_msgSend_setModifyRecordIDs_(v4, v13, (uint64_t)v12);
  v14.receiver = self;
  v14.super_class = (Class)CKDArchiveRecordsURLRequest;
  [(CKDURLRequest *)&v14 fillOutRequestProperties:v4];
}

- (id)zoneIDsToLock
{
  v3 = objc_msgSend_zoneIDToRecordIDs(self, a2, v2);
  uint64_t v6 = objc_msgSend_allKeys(v3, v4, v5);

  return v6;
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
  id v4 = objc_msgSend_zoneIDToRecordIDs(self, a2, v2);
  v7 = objc_msgSend_allKeys(v4, v5, v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4E8F0F4;
  v11[3] = &unk_1E64F48D8;
  v11[4] = self;
  uint64_t v9 = objc_msgSend_CKMap_(v7, v8, (uint64_t)v11);

  return v9;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_recordZoneIDByRequestID(self, v5, v6);
  id v10 = objc_msgSend_response(v4, v8, v9);
  v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_recordArchivedBlock(self, v16, v17);

  if (v18)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v21 = objc_msgSend_zoneIDToRecordIDs(self, v19, v20, 0);
    v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v15);

    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v37, v41, 16);
    if (v25)
    {
      uint64_t v28 = v25;
      uint64_t v29 = *(void *)v38;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v23);
          }
          uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * v30);
          objc_msgSend_recordArchivedBlock(self, v26, v27);
          objc_super v32 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_result(v4, v33, v34);
          ((void (**)(void, uint64_t, void *))v32)[2](v32, v31, v35);

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v37, v41, 16);
      }
      while (v28);
    }
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_recordZoneIDByRequestID(self, v5, v6);
  id v10 = objc_msgSend_response(v4, v8, v9);
  v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_recordArchivedBlock(self, v16, v17);

  if (v18)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v21 = objc_msgSend_zoneIDToRecordIDs(self, v19, v20, 0);
    v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v15);

    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v36, v40, 16);
    if (v25)
    {
      uint64_t v28 = v25;
      uint64_t v29 = *(void *)v37;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v23);
          }
          uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8 * v30);
          objc_msgSend_recordArchivedBlock(self, v26, v27);
          objc_super v32 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_result(v4, v33, v34);
          ((void (**)(void, uint64_t, void *))v32)[2](v32, v31, v35);

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v36, v40, 16);
      }
      while (v28);
    }
  }
}

- (id)recordArchivedBlock
{
  return self->_recordArchivedBlock;
}

- (void)setRecordArchivedBlock:(id)a3
{
}

- (NSMutableDictionary)zoneIDToRecordIDs
{
  return self->_zoneIDToRecordIDs;
}

- (void)setZoneIDToRecordIDs:(id)a3
{
}

- (NSMutableDictionary)recordZoneIDByRequestID
{
  return self->_recordZoneIDByRequestID;
}

- (void)setRecordZoneIDByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDToRecordIDs, 0);
  objc_storeStrong(&self->_recordArchivedBlock, 0);
}

@end