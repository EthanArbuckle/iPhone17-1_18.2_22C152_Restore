@interface CKDFetchUserPrivacySettingsOperation
- (CKDFetchUserPrivacySettingsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (id)activityCreate;
- (int)operationType;
- (int64_t)discoverable;
- (void)_handleRetrievedPrivacySettings:(id)a3;
- (void)main;
- (void)setDiscoverable:(int64_t)a3;
@end

@implementation CKDFetchUserPrivacySettingsOperation

- (CKDFetchUserPrivacySettingsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKDFetchUserPrivacySettingsOperation;
  return [(CKDOperation *)&v5 initWithOperationInfo:a3 container:a4];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/get-user-privacy-settings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleRetrievedPrivacySettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  objc_super v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_INFO, "Found user privacy settings %@", (uint8_t *)&v12, 0xCu);
  }
  if (objc_msgSend_hasDiscoverable(v4, v6, v7))
  {
    if (objc_msgSend_discoverable(v4, v8, v9)) {
      objc_msgSend_setDiscoverable_(self, v10, 1);
    }
    else {
      objc_msgSend_setDiscoverable_(self, v10, 2);
    }
  }
  else
  {
    objc_msgSend_setDiscoverable_(self, v8, 0);
  }
  objc_msgSend_finishWithError_(self, v11, 0);
}

- (int)operationType
{
  return 402;
}

- (void)main
{
  v3 = [CKDFetchUserPrivacySettingsURLRequest alloc];
  objc_super v5 = objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1C4FF202C;
  v15 = &unk_1E64F0170;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)&v12);
  objc_msgSend_setRequest_(self, v7, (uint64_t)v5, v12, v13, v14, v15);
  v10 = objc_msgSend_container(self, v8, v9);
  objc_msgSend_performRequest_(v10, v11, (uint64_t)v5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (int64_t)discoverable
{
  return self->_discoverable;
}

- (void)setDiscoverable:(int64_t)a3
{
  self->_discoverable = a3;
}

@end