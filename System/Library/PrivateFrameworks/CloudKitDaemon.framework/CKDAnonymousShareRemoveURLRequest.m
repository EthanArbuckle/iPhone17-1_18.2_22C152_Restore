@interface CKDAnonymousShareRemoveURLRequest
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDAnonymousShareRemoveURLRequest)initWithOperation:(id)a3 encryptedAnonymousSharesToRemove:(id)a4;
- (NSDictionary)encryptedAnonymousSharesToRemove;
- (NSMutableDictionary)encryptedAnonymousShareHashToRemoveByRequestID;
- (id)anonymousShareRemovedBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setAnonymousShareRemovedBlock:(id)a3;
- (void)setEncryptedAnonymousShareHashToRemoveByRequestID:(id)a3;
- (void)setEncryptedAnonymousSharesToRemove:(id)a3;
@end

@implementation CKDAnonymousShareRemoveURLRequest

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (CKDAnonymousShareRemoveURLRequest)initWithOperation:(id)a3 encryptedAnonymousSharesToRemove:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDAnonymousShareRemoveURLRequest;
  v8 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_encryptedAnonymousSharesToRemove, a4);
    uint64_t v10 = objc_opt_new();
    encryptedAnonymousShareHashToRemoveByRequestID = v9->_encryptedAnonymousShareHashToRemoveByRequestID;
    v9->_encryptedAnonymousShareHashToRemoveByRequestID = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDAnonymousShareRemoveURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_encryptedAnonymousSharesToRemove(self, v6, v7, v15.receiver, v15.super_class);
  v11 = objc_msgSend_allKeys(v8, v9, v10);
  objc_super v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"hashes");
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
  v5 = objc_msgSend_encryptedAnonymousSharesToRemove(self, v3, v4);
  v8 = objc_msgSend_allKeys(v5, v6, v7);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v8;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v46, v50, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_operationType(self, v11, v12);
        v19 = objc_msgSend_operationRequestWithType_(self, v18, v17);
        v20 = objc_opt_new();
        objc_msgSend_setAnonymousShareRemoveRequest_(v19, v21, (uint64_t)v20);

        v24 = objc_msgSend_anonymousShareRemoveRequest(v19, v22, v23);
        objc_msgSend_setAnonymousShareTupleHash_(v24, v25, v16);
        v28 = objc_msgSend_encryptedAnonymousSharesToRemove(self, v26, v27);
        v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, v16);
        objc_msgSend_setEncryptedShareTuple_(v24, v31, (uint64_t)v30);

        v34 = objc_msgSend_encryptedAnonymousShareHashToRemoveByRequestID(self, v32, v33);
        v37 = objc_msgSend_request(v19, v35, v36);
        v40 = objc_msgSend_operationUUID(v37, v38, v39);
        objc_msgSend_setObject_forKeyedSubscript_(v34, v41, v16, v40);

        objc_msgSend_addObject_(v45, v42, (uint64_t)v19);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v46, v50, 16);
    }
    while (v13);
  }

  return v45;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_encryptedAnonymousShareHashToRemoveByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  objc_super v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  v18 = objc_msgSend_anonymousShareRemovedBlock(self, v16, v17);

  if (v18)
  {
    objc_msgSend_anonymousShareRemovedBlock(self, v19, v20);
    v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_result(v4, v22, v23);
    ((void (**)(void, void *, void *))v21)[2](v21, v15, v24);
  }
  return 0;
}

- (id)anonymousShareRemovedBlock
{
  return self->_anonymousShareRemovedBlock;
}

- (void)setAnonymousShareRemovedBlock:(id)a3
{
}

- (NSDictionary)encryptedAnonymousSharesToRemove
{
  return self->_encryptedAnonymousSharesToRemove;
}

- (void)setEncryptedAnonymousSharesToRemove:(id)a3
{
}

- (NSMutableDictionary)encryptedAnonymousShareHashToRemoveByRequestID
{
  return self->_encryptedAnonymousShareHashToRemoveByRequestID;
}

- (void)setEncryptedAnonymousShareHashToRemoveByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedAnonymousShareHashToRemoveByRequestID, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, 0);
  objc_storeStrong(&self->_anonymousShareRemovedBlock, 0);
}

@end