@interface CKDShareAccessRequestURLRequest
- (CKDShareAccessRequestURLRequest)initWithOperation:(id)a3 shareMetadatasToRequestAccess:(id)a4;
- (NSArray)shareMetadatasToRequestAccess;
- (NSMutableDictionary)shareMetadataByRequestID;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)shareAccessRequestedBlock;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setShareAccessRequestedBlock:(id)a3;
- (void)setShareMetadataByRequestID:(id)a3;
- (void)setShareMetadatasToRequestAccess:(id)a3;
@end

@implementation CKDShareAccessRequestURLRequest

- (CKDShareAccessRequestURLRequest)initWithOperation:(id)a3 shareMetadatasToRequestAccess:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDShareAccessRequestURLRequest;
  v8 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_shareMetadatasToRequestAccess, a4);
    uint64_t v10 = objc_opt_new();
    shareMetadataByRequestID = v9->_shareMetadataByRequestID;
    v9->_shareMetadataByRequestID = (NSMutableDictionary *)v10;
  }
  return v9;
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v43 = (id)objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  objc_msgSend_shareMetadatasToRequestAccess(self, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v44, v48, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_operationType(self, v7, v8);
        v15 = objc_msgSend_operationRequestWithType_(self, v14, v13);
        v16 = objc_opt_new();
        objc_msgSend_setShareAccessRequest_(v15, v17, (uint64_t)v16);
        v20 = objc_msgSend_routingKey(v12, v18, v19);
        objc_msgSend_setRoutingKey_(v16, v21, (uint64_t)v20);

        v24 = objc_msgSend_shortTokenHash(v12, v22, v23);
        objc_msgSend_setShortTokenHash_(v16, v25, (uint64_t)v24);

        v28 = objc_msgSend_userInformationRequestAccess(v12, v26, v27);
        objc_msgSend_setUserInformationRequestAccess_(v16, v29, (uint64_t)v28);

        v32 = objc_msgSend_shareMetadataByRequestID(self, v30, v31);
        v35 = objc_msgSend_request(v15, v33, v34);
        v38 = objc_msgSend_operationUUID(v35, v36, v37);
        objc_msgSend_setObject_forKeyedSubscript_(v32, v39, (uint64_t)v12, v38);

        objc_msgSend_addObject_(v43, v40, (uint64_t)v15);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v44, v48, 16);
    }
    while (v9);
  }

  return v43;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_shareMetadataByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_shareAccessRequestedBlock(self, v16, v17);

  if (v18)
  {
    objc_msgSend_shareAccessRequestedBlock(self, v19, v20);
    v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_shareURL(v15, v22, v23);
    uint64_t v27 = objc_msgSend_result(v4, v25, v26);
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

  uint64_t v17 = objc_msgSend_shareAccessRequestedBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_shareAccessRequestedBlock(self, v18, v19);
    uint64_t v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_shareURL(v14, v21, v22);
    uint64_t v26 = objc_msgSend_result(v27, v24, v25);
    ((void (**)(void, void *, void *))v20)[2](v20, v23, v26);
  }
}

- (id)shareAccessRequestedBlock
{
  return self->_shareAccessRequestedBlock;
}

- (void)setShareAccessRequestedBlock:(id)a3
{
}

- (NSArray)shareMetadatasToRequestAccess
{
  return self->_shareMetadatasToRequestAccess;
}

- (void)setShareMetadatasToRequestAccess:(id)a3
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
  objc_storeStrong((id *)&self->_shareMetadatasToRequestAccess, 0);
  objc_storeStrong(&self->_shareAccessRequestedBlock, 0);
}

@end