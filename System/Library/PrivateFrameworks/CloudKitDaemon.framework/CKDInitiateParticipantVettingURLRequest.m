@interface CKDInitiateParticipantVettingURLRequest
- (CKDInitiateParticipantVettingURLRequest)initWithOperation:(id)a3 shareRecordID:(id)a4 encryptedKey:(id)a5 participantID:(id)a6 baseToken:(id)a7;
- (CKRecordID)shareRecordID;
- (NSData)encryptedKey;
- (NSString)baseToken;
- (NSString)participantID;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)vettingInitiationRequestCompletionBlock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setBaseToken:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setVettingInitiationRequestCompletionBlock:(id)a3;
@end

@implementation CKDInitiateParticipantVettingURLRequest

- (CKDInitiateParticipantVettingURLRequest)initWithOperation:(id)a3 shareRecordID:(id)a4 encryptedKey:(id)a5 participantID:(id)a6 baseToken:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKDInitiateParticipantVettingURLRequest;
  v17 = [(CKDURLRequest *)&v20 initWithOperation:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_shareRecordID, a4);
    objc_storeStrong((id *)&v18->_encryptedKey, a5);
    objc_storeStrong((id *)&v18->_participantID, a6);
    objc_storeStrong((id *)&v18->_baseToken, a7);
  }

  return v18;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDInitiateParticipantVettingURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v13 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_shareRecordID(self, v5, v6, v13.receiver, v13.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"shareRecordID");

  v11 = objc_msgSend_participantID(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"participantID");
}

- (void)fillOutRequestProperties:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_shareRecordID(self, v5, v6);
  v12[0] = v7;
  v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v12, 1);
  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);

  v11.receiver = self;
  v11.super_class = (Class)CKDInitiateParticipantVettingURLRequest;
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
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  uint64_t v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setShareVettingInitiateRequest_(v6, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_translator(self, v9, v10);
  id v14 = objc_msgSend_shareRecordID(self, v12, v13);
  id v16 = objc_msgSend_pShareIdentifierFromRecordID_(v11, v15, (uint64_t)v14);
  v19 = objc_msgSend_shareVettingInitiateRequest(v6, v17, v18);
  objc_msgSend_setShareId_(v19, v20, (uint64_t)v16);

  v23 = objc_msgSend_encryptedKey(self, v21, v22);
  v26 = objc_msgSend_shareVettingInitiateRequest(v6, v24, v25);
  objc_msgSend_setEncryptedKey_(v26, v27, (uint64_t)v23);

  v30 = objc_msgSend_participantID(self, v28, v29);
  v33 = objc_msgSend_shareVettingInitiateRequest(v6, v31, v32);
  objc_msgSend_setParticipantId_(v33, v34, (uint64_t)v30);

  v37 = objc_msgSend_baseToken(self, v35, v36);
  v40 = objc_msgSend_shareVettingInitiateRequest(v6, v38, v39);
  objc_msgSend_setBaseToken_(v40, v41, (uint64_t)v37);

  v45[0] = v6;
  v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v42, (uint64_t)v45, 1);

  return v43;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_vettingInitiationRequestCompletionBlock(self, v5, v6);

  if (v7)
  {
    if (objc_msgSend_hasShareVettingInitiateResponse(v4, v8, v9))
    {
      v12 = objc_msgSend_vettingInitiationRequestCompletionBlock(self, v10, v11);

      if (v12)
      {
        id v15 = objc_msgSend_shareVettingInitiateResponse(v4, v13, v14);
        char hasVettingError = objc_msgSend_hasVettingError(v15, v16, v17);

        objc_msgSend_vettingInitiationRequestCompletionBlock(self, v19, v20);
        v23 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        if (hasVettingError)
        {
          v24 = objc_msgSend_shareVettingInitiateResponse(v4, v21, v22);
          uint64_t v29 = objc_msgSend_vettingError(v24, v25, v26) - 2;
          if (v29 >= 4) {
            uint64_t v30 = 1;
          }
          else {
            uint64_t v30 = v29 + 2;
          }
          v31 = objc_msgSend_result(v4, v27, v28);
          ((void (**)(void, uint64_t, void *))v23)[2](v23, v30, v31);
        }
        else
        {
          v24 = objc_msgSend_result(v4, v21, v22);
          ((void (**)(void, void, void *))v23)[2](v23, 0, v24);
        }
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v32 = objc_msgSend_result(v4, v10, v11);
      int hasError = objc_msgSend_hasError(v32, v33, v34);

      if (hasError)
      {
        objc_msgSend_vettingInitiationRequestCompletionBlock(self, v36, v37);
        v23 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_result(v4, v38, v39);
        ((void (**)(void, uint64_t, void *))v23)[2](v23, -1, v24);
LABEL_12:
      }
    }
  }

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v13 = a3;
  uint64_t v6 = objc_msgSend_vettingInitiationRequestCompletionBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_vettingInitiationRequestCompletionBlock(self, v7, v8);
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_result(v13, v10, v11);
    ((void (**)(void, uint64_t, void *))v9)[2](v9, -1, v12);
  }
}

- (id)vettingInitiationRequestCompletionBlock
{
  return self->_vettingInitiationRequestCompletionBlock;
}

- (void)setVettingInitiationRequestCompletionBlock:(id)a3
{
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong(&self->_vettingInitiationRequestCompletionBlock, 0);
}

@end