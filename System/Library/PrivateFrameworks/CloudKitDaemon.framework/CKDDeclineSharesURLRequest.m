@interface CKDDeclineSharesURLRequest
- (CKDDeclineSharesURLRequest)initWithOperation:(id)a3 shareMetadatasToDecline:(id)a4;
- (NSArray)shareMetadatasToDecline;
- (NSMutableDictionary)shareMetadataByRequestID;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)shareDeclinedBlock;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setShareDeclinedBlock:(id)a3;
- (void)setShareMetadataByRequestID:(id)a3;
- (void)setShareMetadatasToDecline:(id)a3;
@end

@implementation CKDDeclineSharesURLRequest

- (CKDDeclineSharesURLRequest)initWithOperation:(id)a3 shareMetadatasToDecline:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDDeclineSharesURLRequest;
  v8 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_shareMetadatasToDecline, a4);
    uint64_t v10 = objc_opt_new();
    shareMetadataByRequestID = v9->_shareMetadataByRequestID;
    v9->_shareMetadataByRequestID = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (id)zoneIDsToLock
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = objc_msgSend_shareMetadatasToDecline(self, v4, v5, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, v27, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v6);
        }
        v14 = objc_msgSend_shareRecordID(*(void **)(*((void *)&v23 + 1) + 8 * i), v9, v10);
        v17 = objc_msgSend_zoneID(v14, v15, v16);

        if (v17) {
          objc_msgSend_addObject_(v3, v18, (uint64_t)v17);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v23, v27, 16);
    }
    while (v11);
  }

  v21 = objc_msgSend_allObjects(v3, v19, v20);

  return v21;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDDeclineSharesURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_msgSend_shareMetadatasToDecline(self, v6, v7, v15.receiver, v15.super_class);
  uint64_t v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  objc_super v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"shareMetadatas");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_shareMetadatasToDecline(self, v5, v6);
  v9 = objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1F2043730);

  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);
  v11.receiver = self;
  v11.super_class = (Class)CKDDeclineSharesURLRequest;
  [(CKDURLRequest *)&v11 fillOutRequestProperties:v4];
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
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v45 = (id)objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  objc_msgSend_shareMetadatasToDecline(self, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v46, v50, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_operationType(self, v7, v8);
        objc_super v15 = objc_msgSend_operationRequestWithType_(self, v14, v13);
        uint64_t v16 = objc_opt_new();
        objc_msgSend_setShareDeclineRequest_(v15, v17, (uint64_t)v16);
        uint64_t v20 = objc_msgSend_translator(self, v18, v19);
        long long v23 = objc_msgSend_shareRecordID(v12, v21, v22);
        long long v25 = objc_msgSend_pShareIdentifierFromRecordID_(v20, v24, (uint64_t)v23);
        objc_msgSend_setShareId_(v16, v26, (uint64_t)v25);

        v29 = objc_msgSend_participantID(v12, v27, v28);

        if (v29)
        {
          v32 = objc_msgSend_participantID(v12, v30, v31);
          objc_msgSend_setParticipantId_(v16, v33, (uint64_t)v32);
        }
        v34 = objc_msgSend_shareMetadataByRequestID(self, v30, v31);
        v37 = objc_msgSend_request(v15, v35, v36);
        v40 = objc_msgSend_operationUUID(v37, v38, v39);
        objc_msgSend_setObject_forKeyedSubscript_(v34, v41, (uint64_t)v12, v40);

        objc_msgSend_addObject_(v45, v42, (uint64_t)v15);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v46, v50, 16);
    }
    while (v9);
  }

  return v45;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_shareMetadataByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  objc_super v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_shareDeclinedBlock(self, v16, v17);

  if (v18)
  {
    objc_msgSend_shareDeclinedBlock(self, v19, v20);
    v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    long long v24 = objc_msgSend_shareURL(v15, v22, v23);
    v27 = objc_msgSend_result(v4, v25, v26);
    ((void (**)(void, void *, void *))v21)[2](v21, v24, v27);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v27 = a3;
  uint64_t v6 = objc_msgSend_shareMetadataByRequestID(self, v4, v5);
  uint64_t v9 = objc_msgSend_response(v27, v7, v8);
  uint64_t v12 = objc_msgSend_operationUUID(v9, v10, v11);
  v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);

  uint64_t v17 = objc_msgSend_shareDeclinedBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_shareDeclinedBlock(self, v18, v19);
    uint64_t v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_shareURL(v14, v21, v22);
    uint64_t v26 = objc_msgSend_result(v27, v24, v25);
    ((void (**)(void, void *, void *))v20)[2](v20, v23, v26);
  }
}

- (id)shareDeclinedBlock
{
  return self->_shareDeclinedBlock;
}

- (void)setShareDeclinedBlock:(id)a3
{
}

- (NSArray)shareMetadatasToDecline
{
  return self->_shareMetadatasToDecline;
}

- (void)setShareMetadatasToDecline:(id)a3
{
}

- (NSMutableDictionary)shareMetadataByRequestID
{
  return self->_shareMetadataByRequestID;
}

- (void)setShareMetadataByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadataByRequestID, 0);
  objc_storeStrong((id *)&self->_shareMetadatasToDecline, 0);
  objc_storeStrong(&self->_shareDeclinedBlock, 0);
}

@end