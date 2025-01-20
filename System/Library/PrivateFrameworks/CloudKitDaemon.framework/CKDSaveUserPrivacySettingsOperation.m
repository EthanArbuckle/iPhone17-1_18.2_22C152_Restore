@interface CKDSaveUserPrivacySettingsOperation
+ (int64_t)isPredominatelyDownload;
- (BOOL)shouldCheckAppVersion;
- (CKDSaveUserPrivacySettingsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (id)activityCreate;
- (int)operationType;
- (int64_t)discoverable;
- (void)main;
- (void)setDiscoverable:(int64_t)a3;
@end

@implementation CKDSaveUserPrivacySettingsOperation

- (CKDSaveUserPrivacySettingsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDSaveUserPrivacySettingsOperation;
  v9 = [(CKDOperation *)&v11 initWithOperationInfo:v6 container:a4];
  if (v9) {
    v9->_discoverable = objc_msgSend_discoverable(v6, v7, v8);
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/save-user-privacy-settings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  v3 = [CKDSaveUserPrivacySettingsURLRequest alloc];
  v5 = objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  if (objc_msgSend_discoverable(self, v6, v7))
  {
    BOOL v10 = objc_msgSend_discoverable(self, v8, v9) == 1;
    objc_msgSend_setDiscoverable_(v5, v11, v10);
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = sub_1C4FFBBA8;
  v21 = &unk_1E64F0170;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  objc_msgSend_setCompletionBlock_(v5, v12, (uint64_t)&v18);
  objc_msgSend_setRequest_(self, v13, (uint64_t)v5, v18, v19, v20, v21);
  v16 = objc_msgSend_container(self, v14, v15);
  objc_msgSend_performRequest_(v16, v17, (uint64_t)v5);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (int)operationType
{
  return 403;
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