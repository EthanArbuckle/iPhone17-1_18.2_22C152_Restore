@interface CKDBackingAccount
+ (CKDBackingAccount)accountWithAltDSID:(id)a3;
+ (CKDBackingAccount)accountWithIdentifier:(id)a3;
+ (id)credentialRenewalDatesBySuspendedAccountID;
+ (id)deviceCountQueue;
+ (id)explicitCredentialsAccountWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 propertyOverrides:(id)a6 overridesByDataclass:(id)a7;
+ (id)mockAccountWithTestAccount:(id)a3 testDevice:(id)a4;
+ (id)primaryAccount;
+ (void)deviceCountForAccount:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5;
+ (void)fetchDeviceCountForAccount:(id)a3 completionHandler:(id)a4;
+ (void)registerDeviceCountRefreshActivity;
- (ACAccount)appleAccount;
- (ACAccount)ckAccount;
- (BOOL)canSuspendedAccountRenewCredentials;
- (BOOL)isAccountSuspended;
- (BOOL)isDataclassEnabled:(id)a3;
- (BOOL)isDataclassEnabledForCellular:(id)a3;
- (BOOL)isPrimaryAccount;
- (BOOL)isPrimaryEmailVerified;
- (CKDBackingAccount)init;
- (CKDBackingAccount)initWithAppleAccount:(id)a3;
- (NSPersonNameComponents)fullName;
- (NSString)altDSID;
- (NSString)displayedHostname;
- (NSString)dsid;
- (NSString)identifier;
- (NSString)personaIdentifier;
- (NSString)primaryEmail;
- (NSString)serverPreferredPushEnvironment;
- (NSString)sharingURLHostname;
- (NSString)suspendedAccountIdentifier;
- (NSString)username;
- (NSURL)privateCloudDBURL;
- (NSURL)privateCodeServiceURL;
- (NSURL)privateDeviceServiceURL;
- (NSURL)privateMetricsServiceURL;
- (NSURL)privateShareServiceURL;
- (id)_accountCredentialForAccount:(id)a3 withError:(id *)a4;
- (id)accountPropertiesForDataclass:(id)a3;
- (id)cloudKitAuthTokenWithError:(id *)a3;
- (id)iCloudAuthTokenWithError:(id *)a3;
- (id)privateCodeServiceURLPreferringGateway:(BOOL)a3;
- (id)urlForDataclass:(id)a3;
- (id)urlForDataclass:(id)a3 preferringGateway:(BOOL)a4;
- (int64_t)accountType;
- (int64_t)lastKnownDeviceCount;
- (void)noteSuspendedAccountRenewalDate;
- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4;
- (void)updateAccountPropertiesAndSaveAccount:(id)a3;
- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 completionHandler:(id)a6;
@end

@implementation CKDBackingAccount

+ (id)primaryAccount
{
  v3 = objc_msgSend_sharedAccountStore(CKDAccountStore, a2, v2);
  v6 = objc_msgSend_primaryAccount(v3, v4, v5);

  if (v6)
  {
    v7 = [CKDBackingPlatformAccount alloc];
    v9 = objc_msgSend_initWithAppleAccount_(v7, v8, (uint64_t)v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (CKDBackingAccount)accountWithIdentifier:(id)a3
{
  id v3 = a3;
  v6 = objc_msgSend_sharedAccountStore(CKDAccountStore, v4, v5);
  v8 = objc_msgSend_accountWithIdentifier_(v6, v7, (uint64_t)v3);

  if (v8)
  {
    v9 = [CKDBackingPlatformAccount alloc];
    v11 = objc_msgSend_initWithAppleAccount_(v9, v10, (uint64_t)v8);
  }
  else
  {
    v11 = 0;
  }

  return (CKDBackingAccount *)v11;
}

+ (CKDBackingAccount)accountWithAltDSID:(id)a3
{
  id v3 = a3;
  v6 = objc_msgSend_sharedAccountStore(CKDAccountStore, v4, v5);
  v8 = objc_msgSend_accountWithAltDSID_(v6, v7, (uint64_t)v3);

  if (v8)
  {
    v9 = [CKDBackingPlatformAccount alloc];
    v11 = objc_msgSend_initWithAppleAccount_(v9, v10, (uint64_t)v8);
  }
  else
  {
    v11 = 0;
  }

  return (CKDBackingAccount *)v11;
}

+ (id)explicitCredentialsAccountWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 propertyOverrides:(id)a6 overridesByDataclass:(id)a7
{
  return (id)objc_msgSend_explicitCredentialsAccountWithEmail_password_recoveryKey_propertyOverrides_overridesByDataclass_(CKDBackingExplicitCredentialsAccount, a2, (uint64_t)a3, a4, a5, a6, a7);
}

+ (id)mockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  return (id)objc_msgSend_mockAccountWithTestAccount_testDevice_(CKDBackingMockAccount, a2, (uint64_t)a3, a4);
}

+ (id)credentialRenewalDatesBySuspendedAccountID
{
  if (qword_1EBBD00B0 != -1) {
    dispatch_once(&qword_1EBBD00B0, &unk_1F2044850);
  }
  uint64_t v2 = (void *)qword_1EBBD00A8;
  return v2;
}

- (CKDBackingAccount)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      goto LABEL_7;
    }
    while (1)
    {
      uint64_t v5 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_ERROR, "CKDBackingAccount must be subclassed", buf, 2u);
      }
      v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"CKDBackingAccount must be subclassed");
      objc_msgSend_UTF8String(v7, v8, v9);
      _os_crash();
      __break(1u);
LABEL_7:
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CKDBackingAccount;
  return [(CKDBackingAccount *)&v10 init];
}

- (CKDBackingAccount)initWithAppleAccount:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      goto LABEL_9;
    }
    while (1)
    {
      objc_super v10 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "CKDBackingAccount must be subclassed", buf, 2u);
      }
      v12 = objc_msgSend_stringWithFormat_(NSString, v11, @"CKDBackingAccount must be subclassed");
      objc_msgSend_UTF8String(v12, v13, v14);
      _os_crash();
      __break(1u);
LABEL_9:
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)CKDBackingAccount;
  v7 = [(CKDBackingAccount *)&v15 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_appleAccount, a3);
  }

  return v8;
}

- (ACAccount)ckAccount
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A018]);
  v4 = NSStringFromSelector(a2);
  uint64_t v5 = objc_opt_class();
  id v7 = (id)objc_msgSend_initWithCode_format_(v3, v6, 12, @"%@ must be subclassed in class %@", v4, v5);

  objc_exception_throw(v7);
}

- (NSString)primaryEmail
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_aa_primaryEmail(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)username
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_username(v3, v4, v5);

  return (NSString *)v6;
}

- (BOOL)isPrimaryAccount
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  char isAccountClass = objc_msgSend_aa_isAccountClass_(v3, v4, *MEMORY[0x1E4F4BF38]);

  return isAccountClass;
}

- (NSString)dsid
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_aa_personID(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)altDSID
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_aa_altDSID(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)identifier
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_ck_identifier(v3, v4, v5);

  return (NSString *)v6;
}

- (NSPersonNameComponents)fullName
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v6 = objc_msgSend_appleAccount(self, v4, v5);
  uint64_t v9 = objc_msgSend_aa_firstName(v6, v7, v8);
  objc_msgSend_setGivenName_(v3, v10, (uint64_t)v9);

  v13 = objc_msgSend_appleAccount(self, v11, v12);
  v16 = objc_msgSend_aa_lastName(v13, v14, v15);
  objc_msgSend_setFamilyName_(v3, v17, (uint64_t)v16);

  return (NSPersonNameComponents *)v3;
}

- (NSString)displayedHostname
{
  id v3 = (id)*MEMORY[0x1E4F1A5C0];
  uint64_t v6 = objc_msgSend_appleAccount(self, v4, v5);
  uint64_t v9 = objc_msgSend_aa_regionInfo(v6, v7, v8);
  uint64_t v12 = objc_msgSend_displayedHostname(v9, v10, v11);
  uint64_t v15 = objc_msgSend_lowercaseString(v12, v13, v14);

  if (objc_msgSend_length(v15, v16, v17) && (objc_msgSend_isEqualToString_(v15, v18, *MEMORY[0x1E4F1A5B8]) & 1) == 0)
  {
    id v19 = v15;

    id v3 = v19;
  }

  return (NSString *)v3;
}

- (BOOL)isPrimaryEmailVerified
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  char isPrimaryEmailVerified = objc_msgSend_aa_isPrimaryEmailVerified(v3, v4, v5);

  return isPrimaryEmailVerified;
}

- (BOOL)isDataclassEnabled:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_appleAccount(self, v5, v6);
  char isEnabledForDataclass = objc_msgSend_isEnabledForDataclass_(v7, v8, (uint64_t)v4);

  return isEnabledForDataclass;
}

- (BOOL)isDataclassEnabledForCellular:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_appleAccount(self, v5, v6);
  char v9 = objc_msgSend_aa_useCellularForDataclass_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)_accountCredentialForAccount:(id)a3 withError:(id *)a4
{
  id v8 = a3;
  if (v8)
  {
    if (objc_msgSend_isAccountSuspended(self, v6, v7))
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v12 = *MEMORY[0x1E4F19DD8];
      v13 = objc_msgSend_appleAccount(self, v9, v10);
      v16 = objc_msgSend_ck_identifier(v13, v14, v15);
      v18 = objc_msgSend_errorWithDomain_code_format_(v11, v17, v12, 1004, @"Can't return account credentials for account %@ because the account needs to verify new terms or is in suspended mode.", v16);
    }
    else
    {
      id v28 = 0;
      uint64_t v19 = objc_msgSend_credentialWithError_(v8, v9, (uint64_t)&v28);
      unint64_t v20 = (unint64_t)v28;
      if (v19 | v20)
      {
        v18 = (void *)v20;
        if (!a4) {
          goto LABEL_10;
        }
        goto LABEL_8;
      }
      v23 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v24 = *MEMORY[0x1E4F19DD8];
      v25 = objc_msgSend_ck_identifier(v8, v21, v22);
      v18 = objc_msgSend_errorWithDomain_code_format_(v23, v26, v24, 1002, @"Didn't get account credentials for account %@ with no error", v25);
    }
  }
  else
  {
    v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 1002, @"Can't return account credentials for nil account");
  }
  uint64_t v19 = 0;
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (v18) {
    *a4 = v18;
  }
LABEL_10:

  return (id)v19;
}

- (id)cloudKitAuthTokenWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_ckAccount(self, a2, (uint64_t)a3);
  id v16 = 0;
  uint64_t v7 = objc_msgSend__accountCredentialForAccount_withError_(self, v6, (uint64_t)v5, &v16);
  id v10 = v16;
  if (v7)
  {
    uint64_t v12 = objc_msgSend_token(v7, v8, v9);
    if (!v12)
    {
      uint64_t v13 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1002, @"Couldn't get cloudKitAuthToken from credential");

      id v10 = (id)v13;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v10)
  {
    if (a3) {
      *a3 = v10;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v14 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Error getting cloudKitAuthToken: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (id)iCloudAuthTokenWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_appleAccount(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_aa_authToken(v4, v5, v6);

  if (!v7)
  {
    uint64_t v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 1002, @"Couldn't get iCloudAuthToken from credential");
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v10 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "Error getting iCloudAuthToken: %@", (uint8_t *)&v12, 0xCu);
      if (!a3) {
        goto LABEL_7;
      }
    }
    else if (!a3)
    {
LABEL_7:

      goto LABEL_8;
    }
    *a3 = v9;
    goto LABEL_7;
  }
LABEL_8:
  return v7;
}

- (BOOL)isAccountSuspended
{
  id v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  char isCurrentAppleAccountSuspended = objc_msgSend_isCurrentAppleAccountSuspended(v4, v5, v6);

  id v10 = objc_msgSend_appleAccount(self, v8, v9);
  LOBYTE(v4) = isCurrentAppleAccountSuspended | objc_msgSend_aa_isSuspended(v10, v11, v12);

  return (char)v4;
}

- (NSString)suspendedAccountIdentifier
{
  if ((objc_msgSend_isAccountSuspended(self, a2, v2) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDBackingAccount.m", 263, @"Should only be called for suspended accounts.");
  }
  uint64_t v7 = objc_msgSend_appleAccount(self, v5, v6);
  id v10 = objc_msgSend_ck_identifier(v7, v8, v9);

  return (NSString *)v10;
}

- (BOOL)canSuspendedAccountRenewCredentials
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  objc_msgSend_credentialRenewalDatesBySuspendedAccountID(v3, v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  uint64_t v9 = objc_msgSend_suspendedAccountIdentifier(self, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)v9);
  objc_msgSend_timeIntervalSinceNow(v11, v12, v13);
  double v15 = fabs(v14);
  BOOL v17 = v15 >= 28800.0 || v11 == 0;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v18 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = @" not";
    int v21 = 134218754;
    double v22 = v15;
    if (v17) {
      uint64_t v19 = &stru_1F2044F30;
    }
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    v26 = v11;
    __int16 v27 = 2112;
    id v28 = v19;
    _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "It has been %f s since suspended account %@ last renewal date %@. Can%@ renew credentials", (uint8_t *)&v21, 0x2Au);
  }

  objc_sync_exit(v6);
  return v17;
}

- (void)noteSuspendedAccountRenewalDate
{
  if (objc_msgSend_isAccountSuspended(self, a2, v2))
  {
    id v4 = objc_opt_class();
    objc_msgSend_credentialRenewalDatesBySuspendedAccountID(v4, v5, v6);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    uint64_t v9 = objc_msgSend_suspendedAccountIdentifier(self, v7, v8);
    uint64_t v12 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(obj, v13, (uint64_t)v12, v9);

    objc_sync_exit(obj);
  }
}

- (NSString)serverPreferredPushEnvironment
{
  uint64_t v2 = objc_msgSend_accountPropertiesForDataclass_(self, a2, *MEMORY[0x1E4F17548]);
  id v4 = objc_msgSend_objectForKey_(v2, v3, @"apsEnv");

  return (NSString *)v4;
}

- (int64_t)accountType
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDBackingAccount.m", 300, @"Expected to be overridden in subclass");

  return 0;
}

- (id)accountPropertiesForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_appleAccount(self, v5, v6);
  uint64_t v9 = objc_msgSend_propertiesForDataclass_(v7, v8, (uint64_t)v4);

  return v9;
}

- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend_CKDeepCopy(a3, v7, v8);
  uint64_t v12 = objc_msgSend_sharedAccountStore(CKDAccountStore, v10, v11);
  double v15 = objc_msgSend_accountStore(v12, v13, v14);

  id v18 = objc_msgSend_appleAccount(self, v16, v17);

  uint64_t v19 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v20 = *MEMORY[0x1E4F1A550];
  if (v18 && v15)
  {
    if (v20 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v19);
    }
    int v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Re-fetching our auth token", buf, 2u);
    }
    uint64_t v24 = objc_msgSend_appleAccount(self, v22, v23);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1C4FCC0E0;
    v29[3] = &unk_1E64F18F8;
    id v30 = v6;
    objc_msgSend_renewCredentialsForAccount_options_completion_(v15, v25, (uint64_t)v24, v9, v29);

    v26 = v30;
  }
  else
  {
    if (v20 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v19);
    }
    __int16 v27 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_INFO, "Can't renew auth token because we don't have an account or an account store", buf, 2u);
    }
    v26 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 1002, @"No account exists");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v26);
  }
}

- (void)updateAccountPropertiesAndSaveAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1A018]);
  uint64_t v5 = objc_opt_class();
  id v7 = (id)objc_msgSend_initWithCode_format_(v4, v6, 12, @"This method must be subclassed in class %@", v5);
  objc_exception_throw(v7);
}

- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F4EF60];
  id v13 = a5;
  id v14 = a4;
  id v15 = objc_alloc_init(v12);
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = v13;
  }
  id v17 = v16;
  id v18 = CKLocalizedString();
  objc_msgSend_setTitle_(v15, v19, (uint64_t)v18);

  uint64_t v20 = CKLocalizedString();

  objc_msgSend_setReason_(v15, v21, (uint64_t)v20, v17);
  uint64_t v24 = objc_msgSend_username(self, v22, v23);
  objc_msgSend_setUsername_(v15, v25, (uint64_t)v24);

  objc_msgSend_setIsUsernameEditable_(v15, v26, 0);
  objc_msgSend_setShouldUpdatePersistentServiceTokens_(v15, v27, 1);
  objc_msgSend_setShouldSkipSettingsLaunchAlert_(v15, v28, 1);
  objc_msgSend_setHelpBook_(v15, v29, @"com.apple.machelp");
  objc_msgSend_setHelpAnchor_(v15, v30, @"mchl267b6234");
  objc_msgSend__setOverridesOnVettingContext_(self, v31, (uint64_t)v15);
  id v32 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1C4FCC4DC;
  v37[3] = &unk_1E64F8140;
  id v38 = v32;
  id v39 = v10;
  id v40 = v11;
  id v33 = v11;
  id v34 = v10;
  id v35 = v32;
  objc_msgSend_authenticateWithContext_completion_(v35, v36, (uint64_t)v15, v37);
}

- (id)urlForDataclass:(id)a3 preferringGateway:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v8 = objc_msgSend_accountPropertiesForDataclass_(self, v7, (uint64_t)v6);
  id v10 = v8;
  if (v4) {
    objc_msgSend_CKFirstUrlForKeys_(v8, v9, (uint64_t)&unk_1F20AB8C8);
  }
  else {
  id v11 = objc_msgSend_CKFirstUrlForKeys_(v8, v9, (uint64_t)&unk_1F20AB8E0);
  }
  if (!v11)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Couldn't create url from dataclass %{public}@ with properties %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }

  return v11;
}

- (id)urlForDataclass:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_urlForDataclass_preferringGateway_, a3);
}

- (NSURL)privateCloudDBURL
{
  return (NSURL *)MEMORY[0x1F4181798](self, sel_urlForDataclass_, *MEMORY[0x1E4F17548]);
}

- (NSURL)privateShareServiceURL
{
  return (NSURL *)MEMORY[0x1F4181798](self, sel_urlForDataclass_, *MEMORY[0x1E4F17560]);
}

- (NSURL)privateDeviceServiceURL
{
  return (NSURL *)MEMORY[0x1F4181798](self, sel_urlForDataclass_, *MEMORY[0x1E4F17550]);
}

- (NSURL)privateCodeServiceURL
{
  return (NSURL *)MEMORY[0x1F4181798](self, sel_privateCodeServiceURLPreferringGateway_, 1);
}

- (id)privateCodeServiceURLPreferringGateway:(BOOL)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_urlForDataclass_preferringGateway_, *MEMORY[0x1E4F17540]);
}

- (NSURL)privateMetricsServiceURL
{
  return (NSURL *)MEMORY[0x1F4181798](self, sel_urlForDataclass_, *MEMORY[0x1E4F17558]);
}

- (NSString)sharingURLHostname
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend_accountPropertiesForDataclass_(self, a2, *MEMORY[0x1E4F17560]);
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"cloudSharingURLHostname");
  if (!objc_msgSend_length(v5, v6, v7))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v8 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      int v14 = v3;
      _os_log_error_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_ERROR, "Couldn't get sharing URL host from properties %{public}@. Falling back to legacy hostname.", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v11 = objc_msgSend_displayedHostname(self, v9, v10);

    uint64_t v5 = (void *)v11;
  }

  return (NSString *)v5;
}

- (NSString)personaIdentifier
{
  id v3 = objc_msgSend_appleAccount(self, a2, v2);
  id v6 = objc_msgSend_personaIdentifier(v3, v4, v5);

  return (NSString *)v6;
}

- (int64_t)lastKnownDeviceCount
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  uint64_t v7 = objc_msgSend_deviceCountOverride(v4, v5, v6);

  if (v7)
  {
    int64_t v10 = objc_msgSend_integerValue(v7, v8, v9);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v24[0] = 67109120;
      v24[1] = v10;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Using device count override (%d)", (uint8_t *)v24, 8u);
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_appleAccount(self, v8, v9);
    uint64_t v15 = objc_msgSend_ck_cloudKitAccount(v12, v13, v14);
    id v17 = v15;
    if (v15)
    {
      uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v15, v16, @"deviceCount");
      uint64_t v21 = objc_msgSend_integerValue(v18, v19, v20);

      if (v21 == 1) {
        int64_t v10 = 1;
      }
      else {
        int64_t v10 = 2 * (v21 != 0);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      double v22 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24[0]) = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "No account, returning unknown last known device count", (uint8_t *)v24, 2u);
      }
      int64_t v10 = 0;
    }
  }
  return v10;
}

+ (void)registerDeviceCountRefreshActivity
{
  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_processType(v12, v4, v5) == 2)
  {
  }
  else
  {
    uint64_t v8 = objc_msgSend_currentProcess(CKDDaemonProcess, v6, v7);
    int isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v8, v9, v10);

    if (isSystemInstalledBinary)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4FCCD08;
      block[3] = &unk_1E64F1B50;
      block[4] = a1;
      if (qword_1EBBCFB10 != -1) {
        dispatch_once(&qword_1EBBCFB10, block);
      }
    }
  }
}

+ (id)deviceCountQueue
{
  if (qword_1EBBD00C0 != -1) {
    dispatch_once(&qword_1EBBD00C0, &unk_1F2044870);
  }
  uint64_t v2 = (void *)qword_1EBBD00B8;
  return v2;
}

+ (void)deviceCountForAccount:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = CKCurrentThreadQualityOfService();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FCD4FC;
    block[3] = &unk_1E64F81E0;
    BOOL v21 = a4;
    id v17 = v8;
    uint64_t v19 = v11;
    id v18 = v10;
    id v20 = a1;
    dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    uint64_t v15 = objc_msgSend_deviceCountQueue(a1, v13, v14);
    dispatch_async(v15, v12);
  }
  else
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
  }
}

+ (void)fetchDeviceCountForAccount:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Fetching device list for account: %@", buf, 0xCu);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F4BFA8]);
  uint64_t v10 = objc_msgSend_initWithAccount_(v8, v9, (uint64_t)v5);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4FCDDE8;
  v13[3] = &unk_1E64F8208;
  id v14 = v6;
  id v11 = v6;
  objc_msgSend_performRequestWithHandler_(v10, v12, (uint64_t)v13);
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void).cxx_destruct
{
}

@end