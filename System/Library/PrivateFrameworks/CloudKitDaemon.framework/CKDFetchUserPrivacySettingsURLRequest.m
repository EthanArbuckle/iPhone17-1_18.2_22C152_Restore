@interface CKDFetchUserPrivacySettingsURLRequest
- (CKDPUserPrivacySettings)userPrivacySettings;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (int64_t)databaseScope;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setUserPrivacySettings:(id)a3;
@end

@implementation CKDFetchUserPrivacySettingsURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchUserPrivacySettingsURLRequest;
  [(CKDURLRequest *)&v3 fillOutEquivalencyPropertiesBuilder:a3];
}

- (int64_t)databaseScope
{
  return 1;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  objc_super v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setUserPrivacySettingsRetrieveRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  objc_msgSend_setUserPrivacySettings_(self, v5, 0);
  if (objc_msgSend_hasUserPrivacySettingsRetrieveResponse(v4, v6, v7))
  {
    v10 = objc_msgSend_userPrivacySettingsRetrieveResponse(v4, v8, v9);
    int hasUserPrivacySettings = objc_msgSend_hasUserPrivacySettings(v10, v11, v12);

    if (hasUserPrivacySettings)
    {
      v16 = objc_msgSend_userPrivacySettingsRetrieveResponse(v4, v14, v15);
      v19 = objc_msgSend_userPrivacySettings(v16, v17, v18);
      objc_msgSend_setUserPrivacySettings_(self, v20, (uint64_t)v19);
    }
  }

  return 0;
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end