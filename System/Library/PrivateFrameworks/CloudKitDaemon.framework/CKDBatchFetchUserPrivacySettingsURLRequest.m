@interface CKDBatchFetchUserPrivacySettingsURLRequest
- (BOOL)requiresTokenRegistration;
- (NSArray)containerPrivacySettings;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (int64_t)databaseScope;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setContainerPrivacySettings:(id)a3;
@end

@implementation CKDBatchFetchUserPrivacySettingsURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDBatchFetchUserPrivacySettingsURLRequest;
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

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)generateRequestOperations
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setUserPrivacySettingsBatchLookupRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v4 = objc_msgSend_userPrivacySettingsBatchLookupResponse(a3, a2, (uint64_t)a3);
  v7 = objc_msgSend_containerPrivacySettings(v4, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1C4EFADB8;
  v12[3] = &unk_1E64F5AB0;
  v12[4] = self;
  v9 = objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)v12);
  objc_msgSend_setContainerPrivacySettings_(self, v10, (uint64_t)v9);

  return 0;
}

- (NSArray)containerPrivacySettings
{
  return self->_containerPrivacySettings;
}

- (void)setContainerPrivacySettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end