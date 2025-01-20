@interface CKDBackingPlatformAccount
- (CKDBackingPlatformAccount)initWithAppleAccount:(id)a3;
- (id)ckAccount;
- (int64_t)accountType;
- (void)updateAccountPropertiesAndSaveAccount:(id)a3;
@end

@implementation CKDBackingPlatformAccount

- (CKDBackingPlatformAccount)initWithAppleAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_ck_cloudKitAccount(v4, v5, v6);

  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)CKDBackingPlatformAccount;
    self = [(CKDBackingAccount *)&v11 initWithAppleAccount:v4];
    v8 = self;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_fault_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_FAULT, "There's an iCloud account without a CloudKit Child Account. Ignoring it. %p: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (int64_t)accountType
{
  return 0;
}

- (id)ckAccount
{
  v3 = objc_msgSend_appleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_ck_cloudKitAccount(v3, v4, v5);

  return v6;
}

- (void)updateAccountPropertiesAndSaveAccount:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_sharedAccountStore(CKDAccountStore, v5, v6);
  v10 = objc_msgSend_accountStore(v7, v8, v9);

  id v13 = objc_msgSend_appleAccount(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4FF0E6C;
  v17[3] = &unk_1E64F8628;
  v19 = self;
  id v20 = v4;
  id v18 = v10;
  id v14 = v10;
  id v15 = v4;
  objc_msgSend_aa_updatePropertiesForAppleAccount_completion_(v14, v16, (uint64_t)v13, v17);
}

@end