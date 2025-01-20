@interface CKDResetUserPrivacySettingsOperation
+ (int64_t)isPredominatelyDownload;
- (BOOL)shouldCheckAppVersion;
- (id)activityCreate;
- (int)operationType;
- (void)main;
@end

@implementation CKDResetUserPrivacySettingsOperation

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/reset-user-privacy-settings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
  v3 = [CKDResetUserPrivacySettingsURLRequest alloc];
  v5 = objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = sub_1C4EF9DBC;
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

- (int)operationType
{
  return 404;
}

@end