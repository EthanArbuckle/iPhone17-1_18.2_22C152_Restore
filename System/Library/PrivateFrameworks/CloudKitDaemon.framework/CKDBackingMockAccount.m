@interface CKDBackingMockAccount
+ (id)mockAccountWithTestAccount:(id)a3 testDevice:(id)a4;
- (BOOL)isAccountSuspended;
- (BOOL)isDataclassEnabled:(id)a3;
- (BOOL)isDataclassEnabledForCellular:(id)a3;
- (BOOL)isPrimaryEmailVerified;
- (CKDTestAccountProtocol)testAccount;
- (CKDTestDeviceProtocol)testDevice;
- (id)_initMockAccountWithTestAccount:(id)a3 testDevice:(id)a4;
- (id)accountPropertiesForDataclass:(id)a3;
- (id)cloudKitAuthTokenWithError:(id *)a3;
- (id)displayedHostname;
- (id)dsid;
- (id)fullName;
- (id)iCloudAuthTokenWithError:(id *)a3;
- (id)identifier;
- (id)personaIdentifier;
- (id)primaryEmail;
- (id)serverPreferredPushEnvironment;
- (id)sharingURLHostname;
- (id)suspendedAccountIdentifier;
- (int64_t)accountType;
- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4;
- (void)updateAccountPropertiesAndSaveAccountInStore:(id)a3 completionHandler:(id)a4;
- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 completionHandler:(id)a6;
@end

@implementation CKDBackingMockAccount

- (int64_t)accountType
{
  return 3;
}

- (id)_initMockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDBackingMockAccount;
  v9 = [(CKDBackingAccount *)&v12 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testAccount, a3);
    objc_storeStrong(p_isa + 4, a4);
  }

  return p_isa;
}

+ (id)mockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CKCurrentPersonaID();
  v11 = objc_msgSend_accountOverrideInfo(v6, v9, v10);
  v14 = objc_msgSend_accountPropertyOverrides(v11, v12, v13);
  v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, *MEMORY[0x1E4F176E8]);

  if (v8 && (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v8) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v21 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      v25 = objc_msgSend_accountID(v6, v23, v24);
      int v27 = 138412802;
      v28 = v8;
      __int16 v29 = 2112;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "Current persona identifier %@ does not match persona override on requested mock account %@: %@. Not returning an account", (uint8_t *)&v27, 0x20u);
    }
    inited = 0;
  }
  else
  {
    id v18 = objc_alloc((Class)a1);
    inited = objc_msgSend__initMockAccountWithTestAccount_testDevice_(v18, v19, (uint64_t)v6, v7);
  }

  return inited;
}

- (void)updateAccountPropertiesAndSaveAccountInStore:(id)a3 completionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v6 = *MEMORY[0x1E4F19DD8];
  id v7 = a4;
  objc_msgSend_errorWithDomain_code_format_(v5, v8, v6, 1000, @"Mock account was asked to refresh account properties. This is unsupported");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v9);
}

- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 completionHandler:(id)a6
{
  id v7 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v8 = *MEMORY[0x1E4F19DD8];
  id v9 = a6;
  objc_msgSend_errorWithDomain_code_format_(v7, v10, v8, 1000, @"Mock account was asked to validate vetting token. This is unsupported");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a6 + 2))(v9, 0, v11);
}

- (id)dsid
{
  v2 = self;
  objc_sync_enter(v2);
  dsid = v2->_dsid;
  if (!dsid)
  {
    uint64_t v6 = objc_msgSend_testAccount(v2, v3, v4);
    uint64_t v9 = objc_msgSend_dsid(v6, v7, v8);

    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v10, @"%lld", v9);
    objc_super v12 = v2->_dsid;
    v2->_dsid = (NSString *)v11;

    dsid = v2->_dsid;
  }
  uint64_t v13 = dsid;
  objc_sync_exit(v2);

  return v13;
}

- (id)identifier
{
  v3 = objc_msgSend_testAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_globallyUniqueID(v3, v4, v5);

  return v6;
}

- (id)primaryEmail
{
  v3 = objc_msgSend_testAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_email(v3, v4, v5);

  return v6;
}

- (id)serverPreferredPushEnvironment
{
  return (id)*MEMORY[0x1E4F4E1D0];
}

- (id)fullName
{
  v3 = objc_msgSend_testAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_nameComponents(v3, v4, v5);

  return v6;
}

- (id)displayedHostname
{
  return @"MockICloud.com";
}

- (id)sharingURLHostname
{
  return @"mock-icloud.com";
}

- (id)personaIdentifier
{
  v3 = objc_msgSend_testAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_accountOverrideInfo(v3, v4, v5);
  uint64_t v9 = objc_msgSend_accountPropertyOverrides(v6, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x1E4F176E8]);

  return v11;
}

- (id)cloudKitAuthTokenWithError:(id *)a3
{
  uint64_t v5 = objc_msgSend_testDevice(self, a2, (uint64_t)a3);
  char hasValidCredentials = objc_msgSend_hasValidCredentials(v5, v6, v7);

  if ((hasValidCredentials & 1) == 0)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 1002, @"TestDevice is withholding credentials for account");
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend_testAccount(self, v9, v10);
  int v14 = objc_msgSend_needsToVerifyTerms(v11, v12, v13);

  if (v14)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 1004, @"TestAccount is simulating Needs to Verify Terms");
LABEL_7:
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_10;
  }
  id v18 = NSString;
  v19 = objc_msgSend_testAccount(self, v15, v16);
  v22 = objc_msgSend_accountOverrideInfo(v19, v20, v21);
  v25 = objc_msgSend_password(v22, v23, v24);
  v17 = objc_msgSend_stringWithFormat_(v18, v26, @"CKAuthToken-%@-%zu", v25, qword_1EA3D1058);

LABEL_10:
  return v17;
}

- (id)iCloudAuthTokenWithError:(id *)a3
{
  uint64_t v5 = objc_msgSend_testDevice(self, a2, (uint64_t)a3);
  char hasValidCredentials = objc_msgSend_hasValidCredentials(v5, v6, v7);

  if (hasValidCredentials)
  {
    uint64_t v11 = NSString;
    objc_super v12 = objc_msgSend_testAccount(self, v9, v10);
    v15 = objc_msgSend_accountOverrideInfo(v12, v13, v14);
    id v18 = objc_msgSend_password(v15, v16, v17);
    v20 = objc_msgSend_stringWithFormat_(v11, v19, @"ICAuthToken-%@-%zu", v18, qword_1EA3D1058);
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 1002, @"TestDevice is withholding credentials for account");
    v20 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)isPrimaryEmailVerified
{
  return 1;
}

- (id)accountPropertiesForDataclass:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(&unk_1F20AC320, a2, (uint64_t)a3);
}

- (BOOL)isDataclassEnabled:(id)a3
{
  return 1;
}

- (BOOL)isDataclassEnabledForCellular:(id)a3
{
  return 1;
}

- (id)suspendedAccountIdentifier
{
  if ((objc_msgSend_isAccountSuspended(self, a2, v2) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKDBackingMockAccount.m", 174, @"Should only be called for suspended accounts.");
  }
  return (id)objc_msgSend_identifier(self, v5, v6);
}

- (BOOL)isAccountSuspended
{
  uint64_t v4 = objc_msgSend_testAccount(self, a2, v2);
  char v7 = objc_msgSend_needsToVerifyTerms(v4, v5, v6);

  if (v7) {
    return 1;
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDBackingMockAccount;
  return [(CKDBackingAccount *)&v9 isAccountSuspended];
}

- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, BOOL, id))a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v8 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_INFO, "Mock: Re-fetching our auth token", buf, 2u);
  }
  if (objc_msgSend_isAccountSuspended(self, v9, v10))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1004, @"TestAccount is simulating Needs to Verify Terms");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0;
    uint64_t v16 = objc_msgSend_length(0, v14, v15);
  }
  else
  {
    id v21 = 0;
    uint64_t v13 = objc_msgSend_iCloudAuthTokenWithError_(self, v11, (uint64_t)&v21);
    id v12 = v21;
    if (objc_msgSend_length(v13, v17, v18) && !v12) {
      ++qword_1EA3D1058;
    }
    uint64_t v16 = objc_msgSend_length(v13, v19, v20);
  }
  v7[2](v7, v16 != 0, v12);
}

- (CKDTestAccountProtocol)testAccount
{
  return self->_testAccount;
}

- (CKDTestDeviceProtocol)testDevice
{
  return self->_testDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDevice, 0);
  objc_storeStrong((id *)&self->_testAccount, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end