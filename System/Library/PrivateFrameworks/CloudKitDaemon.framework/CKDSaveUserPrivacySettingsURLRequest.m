@interface CKDSaveUserPrivacySettingsURLRequest
- (BOOL)requiresTokenRegistration;
- (CKDSaveUserPrivacySettingsURLRequest)initWithOperation:(id)a3;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (int64_t)databaseScope;
- (int64_t)discoverableTrinary;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setDiscoverable:(BOOL)a3;
- (void)setDiscoverableTrinary:(int64_t)a3;
@end

@implementation CKDSaveUserPrivacySettingsURLRequest

- (CKDSaveUserPrivacySettingsURLRequest)initWithOperation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKDSaveUserPrivacySettingsURLRequest;
  result = [(CKDURLRequest *)&v4 initWithOperation:a3];
  if (result) {
    result->_discoverableTrinary = -1;
  }
  return result;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKDSaveUserPrivacySettingsURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v12 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v8 = objc_msgSend_discoverableTrinary(self, v6, v7, v12.receiver, v12.super_class);
  v10 = objc_msgSend_numberWithInteger_(v5, v9, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, (uint64_t)v10, @"discoverable");
}

- (void)setDiscoverable:(BOOL)a3
{
  uint64_t v4 = CKTernaryFromBOOL();
  MEMORY[0x1F4181798](self, sel_setDiscoverableTrinary_, v4);
}

- (int64_t)databaseScope
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

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)generateRequestOperations
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  uint64_t v7 = objc_opt_new();
  objc_msgSend_setUserPrivacySettingsUpdateRequest_(v6, v8, (uint64_t)v7);

  v9 = objc_opt_new();
  objc_super v12 = objc_msgSend_userPrivacySettingsUpdateRequest(v6, v10, v11);
  objc_msgSend_setUserPrivacySettings_(v12, v13, (uint64_t)v9);

  if (objc_msgSend_discoverableTrinary(self, v14, v15) != -1)
  {
    objc_msgSend_discoverableTrinary(self, v16, v17);
    uint64_t v18 = CKBoolFromCKTernary();
    v21 = objc_msgSend_userPrivacySettingsUpdateRequest(v6, v19, v20);
    v24 = objc_msgSend_userPrivacySettings(v21, v22, v23);
    objc_msgSend_setDiscoverable_(v24, v25, v18);
  }
  v28[0] = v6;
  v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v28, 1);

  return v26;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  return 0;
}

- (int64_t)discoverableTrinary
{
  return self->_discoverableTrinary;
}

- (void)setDiscoverableTrinary:(int64_t)a3
{
  self->_discoverableTrinary = a3;
}

@end