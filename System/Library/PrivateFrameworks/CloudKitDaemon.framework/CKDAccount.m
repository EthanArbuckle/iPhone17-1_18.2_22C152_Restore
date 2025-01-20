@interface CKDAccount
+ (id)globalAuthTokenQueue;
- (BOOL)_userCloudDBURLisInCarryPartition;
- (BOOL)haveWarnedAboutServerPreferredPushEnvironment;
- (BOOL)isCarryAccount;
- (BOOL)isDataclassEnabled:(id)a3;
- (BOOL)isDataclassEnabledForCellular:(id)a3;
- (BOOL)isPrimaryAccount;
- (BOOL)isPrimaryEmailVerified;
- (BOOL)isValidTestAccount;
- (CKDAccount)initWithAccountID:(id)a3;
- (CKDAccount)initWithAltDSID:(id)a3;
- (CKDBackingAccount)backingAccount;
- (NSPersonNameComponents)fullName;
- (NSString)accountID;
- (NSString)altDSID;
- (NSString)displayedHostname;
- (NSString)dsid;
- (NSString)formattedUsername;
- (NSString)lastFailediCloudAuthToken;
- (NSString)personaIdentifier;
- (NSString)primaryEmail;
- (NSString)serverPreferredPushEnvironment;
- (NSString)sharingURLHostname;
- (NSString)username;
- (NSURL)privateCloudDBURL;
- (NSURL)privateCodeServiceURL;
- (NSURL)privateDeviceServiceURL;
- (NSURL)privateMetricsServiceURL;
- (NSURL)privateShareServiceURL;
- (OS_dispatch_queue)authTokenCallbackQueue;
- (OS_dispatch_queue)authTokenQueue;
- (id)_lockedCloudKitAuthTokenWithContainer:(id)a3 error:(id *)a4;
- (id)_lockediCloudAuthTokenWithContainer:(id)a3 error:(id *)a4;
- (id)cloudKitAuthTokenWithContainer:(id)a3 error:(id *)a4;
- (id)description;
- (id)iCloudAuthTokenWithContainer:(id)a3 error:(id *)a4;
- (id)initAnonymousAccount;
- (id)initExplicitCredentialsAccountWithAccountOverrideInfo:(id)a3;
- (id)initInternal;
- (id)initMockAccountWithTestAccount:(id)a3 testDevice:(id)a4;
- (id)initPrimaryAccount;
- (int64_t)accountType;
- (int64_t)lastKnownDeviceCount;
- (void)_lockedRenewTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 tokenFetchBlock:(id)a6 completionHandler:(id)a7;
- (void)cloudKitAuthTokenWithContainer:(id)a3 completionHandler:(id)a4;
- (void)iCloudAuthTokenWithContainer:(id)a3 completionHandler:(id)a4;
- (void)renewCloudKitAuthTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 failedToken:(id)a6 completionHandler:(id)a7;
- (void)renewiCloudAuthTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 failedToken:(id)a6 completionHandler:(id)a7;
- (void)setAuthTokenCallbackQueue:(id)a3;
- (void)setHaveWarnedAboutServerPreferredPushEnvironment:(BOOL)a3;
- (void)setLastFailediCloudAuthToken:(id)a3;
- (void)updateAccountPropertiesAndSaveAccountWithCompletionHandler:(id)a3;
- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 container:(id)a6 completionHandler:(id)a7;
@end

@implementation CKDAccount

- (id)_lockedCloudKitAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v9 = objc_msgSend_authTokenQueue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v12 = objc_msgSend_backingAccount(self, v10, v11);
  if (!v12
    || (v15 = (void *)v12,
        char canAuthWithCloudKit = objc_msgSend_canAuthWithCloudKit(v6, v13, v14),
        v15,
        (canAuthWithCloudKit & 1) == 0))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v30 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "No backing account, so not returning an auth token.";
    goto LABEL_21;
  }
  if ((objc_msgSend_canAccessAccount(v6, v17, v18) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v30 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "No access to existing account, so not returning an auth token.";
LABEL_21:
    _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, v31, buf, 2u);
LABEL_22:
    id v24 = 0;
    v23 = 0;
    goto LABEL_23;
  }
  v21 = objc_msgSend_backingAccount(self, v19, v20);
  id v33 = 0;
  v23 = objc_msgSend_cloudKitAuthTokenWithError_(v21, v22, (uint64_t)&v33);
  id v24 = v33;

  if (v23 && objc_msgSend_containsObject_((void *)qword_1EBBCFB18, v25, (uint64_t)v23))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v23;
      _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Found token: %@ in failedTokenCache.", buf, 0xCu);
    }
    uint64_t v28 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 2011, @"Got a CloudKit auth token that has already failed a previous auth attempt");

    id v24 = (id)v28;
  }
  if (v24)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v29 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      if (!a4) {
        goto LABEL_23;
      }
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    id v35 = v24;
    _os_log_error_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_ERROR, "Error getting CloudKit auth token: %@", buf, 0xCu);
    if (a4)
    {
LABEL_16:
      id v24 = v24;
      *a4 = v24;
    }
  }
LABEL_23:

  return v23;
}

- (id)_lockediCloudAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v9 = objc_msgSend_authTokenQueue(self, v7, v8);
  dispatch_assert_queue_V2(v9);

  uint64_t v12 = objc_msgSend_backingAccount(self, v10, v11);
  if (!v12
    || (v15 = (void *)v12,
        char canAuthWithCloudKit = objc_msgSend_canAuthWithCloudKit(v6, v13, v14),
        v15,
        (canAuthWithCloudKit & 1) == 0))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "No backing account, so not returning an auth token.";
    goto LABEL_10;
  }
  if (objc_msgSend_canAccessAccount(v6, v17, v18))
  {
    v21 = objc_msgSend_backingAccount(self, v19, v20);
    id v35 = 0;
    v23 = objc_msgSend_iCloudAuthTokenWithError_(v21, v22, (uint64_t)&v35);
    id v24 = v35;

    if (v24) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v27 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    uint64_t v28 = "No access to existing account, so not returning an auth token.";
LABEL_10:
    _os_log_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
  }
LABEL_11:
  v23 = 0;
LABEL_12:
  v29 = objc_msgSend_lastFailediCloudAuthToken(self, v25, v26);
  int isEqualToString = objc_msgSend_isEqualToString_(v23, v30, (uint64_t)v29);

  if (!isEqualToString)
  {
    id v24 = 0;
    goto LABEL_20;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19DD8], 2011, @"Got an iCloud auth token that has already failed a previous auth attempt");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v24) {
    goto LABEL_20;
  }
LABEL_14:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v33 = *MEMORY[0x1E4F1A500];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  *(_DWORD *)buf = 138412290;
  id v37 = v24;
  _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Error getting iCloud auth token: %@", buf, 0xCu);
  if (a4)
  {
LABEL_18:
    id v24 = v24;
    *a4 = v24;
  }
LABEL_20:

  return v23;
}

- (NSString)lastFailediCloudAuthToken
{
  return self->_lastFailediCloudAuthToken;
}

- (id)cloudKitAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1C4E2E5D8;
  v27 = sub_1C4E2E5E8;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1C4E2E5D8;
  v21 = sub_1C4E2E5E8;
  id v22 = 0;
  v9 = objc_msgSend_authTokenQueue(self, v7, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4D0290C;
  v13[3] = &unk_1E64F3F08;
  v15 = &v23;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  v16 = &v17;
  dispatch_sync(v9, v13);

  if (a4) {
    *a4 = (id) v18[5];
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (OS_dispatch_queue)authTokenQueue
{
  uint64_t v2 = objc_opt_class();
  return (OS_dispatch_queue *)MEMORY[0x1F4181798](v2, sel_globalAuthTokenQueue, v3);
}

+ (id)globalAuthTokenQueue
{
  if (qword_1EBBCFC60 != -1) {
    dispatch_once(&qword_1EBBCFC60, &unk_1F2043450);
  }
  uint64_t v2 = (void *)qword_1EBBCFC58;
  return v2;
}

- (NSString)accountID
{
  if (objc_msgSend_accountType(self, a2, v2) == 1)
  {
    id v6 = @"AnonymousAccount";
  }
  else
  {
    v7 = objc_msgSend_backingAccount(self, v4, v5);
    objc_msgSend_identifier(v7, v8, v9);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (id)initPrimaryAccount
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  inited = objc_msgSend_initInternal(self, a2, v2);
  if (!inited)
  {
LABEL_7:
    id v14 = inited;
    goto LABEL_13;
  }
  uint64_t v6 = objc_msgSend_primaryAccount(CKDBackingAccount, v3, v4);
  v7 = (void *)inited[2];
  inited[2] = v6;

  uint64_t v8 = (void *)*MEMORY[0x1E4F1A548];
  if (inited[2])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v8);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      v13 = objc_msgSend_accountID(inited, v11, v12);
      int v17 = 138412290;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Created primary backing account with ID \"%@\"", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v8);
  }
  v15 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v17) = 0;
    _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Could not create primary backing account", (uint8_t *)&v17, 2u);
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)initAnonymousAccount
{
  inited = objc_msgSend_initInternal(self, a2, v2);
  if (inited)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v4 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_INFO, "Created anonymous account", v6, 2u);
    }
  }
  return inited;
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)CKDAccount;
  uint64_t v2 = [(CKDAccount *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cloudkit.account.authCallbackQueue", v3);
    authTokenCallbackQueue = v2->_authTokenCallbackQueue;
    v2->_authTokenCallbackQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (BOOL)_userCloudDBURLisInCarryPartition
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  uint64_t v5 = objc_msgSend_accountPropertiesForDataclass_(v3, v4, *MEMORY[0x1E4F17A78]);
  objc_super v7 = objc_msgSend_objectForKey_(v5, v6, @"url");

  if (v7) {
    BOOL v9 = objc_msgSend_rangeOfString_options_(v7, v8, @"p9(7|8)-ckdatabase", 1025) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailediCloudAuthToken, 0);
  objc_storeStrong((id *)&self->_authTokenCallbackQueue, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
}

- (BOOL)isPrimaryAccount
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  char isPrimaryAccount = objc_msgSend_isPrimaryAccount(v3, v4, v5);

  return isPrimaryAccount;
}

- (int64_t)accountType
{
  dispatch_queue_t v4 = objc_msgSend_backingAccount(self, a2, v2);

  if (!v4) {
    return 1;
  }
  objc_super v7 = objc_msgSend_backingAccount(self, v5, v6);
  int64_t v10 = objc_msgSend_accountType(v7, v8, v9);

  return v10;
}

- (CKDBackingAccount)backingAccount
{
  return self->_backingAccount;
}

- (BOOL)isCarryAccount
{
  return ((uint64_t (*)(CKDAccount *, char *))MEMORY[0x1F4181798])(self, sel__userCloudDBURLisInCarryPartition);
}

- (id)iCloudAuthTokenWithContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1C4E2E5D8;
  v27 = sub_1C4E2E5E8;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1C4E2E5D8;
  v21 = sub_1C4E2E5E8;
  id v22 = 0;
  uint64_t v9 = objc_msgSend_authTokenQueue(self, v7, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4D02894;
  v13[3] = &unk_1E64F3F08;
  v15 = &v23;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  v16 = &v17;
  dispatch_sync(v9, v13);

  if (a4) {
    *a4 = (id) v18[5];
  }
  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (CKDAccount)initWithAccountID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  inited = objc_msgSend_initInternal(self, v5, v6);
  if (!inited)
  {
LABEL_7:
    uint64_t v17 = inited;
    goto LABEL_13;
  }
  uint64_t v9 = objc_msgSend_accountWithIdentifier_(CKDBackingAccount, v7, (uint64_t)v4);
  id v10 = (void *)inited[2];
  inited[2] = v9;

  id v11 = (void *)*MEMORY[0x1E4F1A548];
  if (inited[2])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      v16 = objc_msgSend_accountID(inited, v14, v15);
      int v20 = 138412290;
      id v21 = v16;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Created backing account with ID \"%@\"", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v11);
  }
  uint64_t v18 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Could not create backing account with ID \"%@\"", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v17 = 0;
LABEL_13:

  return v17;
}

- (CKDAccount)initWithAltDSID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  inited = objc_msgSend_initInternal(self, v5, v6);
  if (!inited)
  {
LABEL_7:
    uint64_t v17 = inited;
    goto LABEL_13;
  }
  uint64_t v9 = objc_msgSend_accountWithAltDSID_(CKDBackingAccount, v7, (uint64_t)v4);
  id v10 = (void *)inited[2];
  inited[2] = v9;

  id v11 = (void *)*MEMORY[0x1E4F1A548];
  if (inited[2])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      v16 = objc_msgSend_altDSID(inited, v14, v15);
      int v20 = 138412290;
      id v21 = v16;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Created backing account with altDSID \"%@\"", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v11);
  }
  uint64_t v18 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Could not create backing account with altDSID \"%@\"", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v17 = 0;
LABEL_13:

  return v17;
}

- (id)initExplicitCredentialsAccountWithAccountOverrideInfo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  inited = objc_msgSend_initInternal(self, v5, v6);
  if (!inited)
  {
LABEL_7:
    v32 = inited;
    goto LABEL_13;
  }
  id v10 = objc_msgSend_email(v4, v7, v8);
  v13 = objc_msgSend_password(v4, v11, v12);
  v16 = objc_msgSend_recoveryKey(v4, v14, v15);
  uint64_t v19 = objc_msgSend_accountPropertyOverrides(v4, v17, v18);
  uint64_t v22 = objc_msgSend_overridesByDataclass(v4, v20, v21);
  uint64_t v24 = objc_msgSend_explicitCredentialsAccountWithEmail_password_recoveryKey_propertyOverrides_overridesByDataclass_(CKDBackingAccount, v23, (uint64_t)v10, v13, v16, v19, v22);
  uint64_t v25 = (void *)inited[2];
  inited[2] = v24;

  uint64_t v26 = (void *)*MEMORY[0x1E4F1A548];
  if (inited[2])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v26);
    }
    v27 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      id v28 = v27;
      v31 = objc_msgSend_accountID(inited, v29, v30);
      int v35 = 138412546;
      id v36 = v4;
      __int16 v37 = 2112;
      uint64_t v38 = v31;
      _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, "Created fake backing account with account override info \"%@\" and ID \"%@\"", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v26);
  }
  id v33 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    int v35 = 138412290;
    id v36 = v4;
    _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Could not create fake backing account with account override info \"%@\"", (uint8_t *)&v35, 0xCu);
  }
  v32 = 0;
LABEL_13:

  return v32;
}

- (id)initMockAccountWithTestAccount:(id)a3 testDevice:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  inited = objc_msgSend_initInternal(self, v8, v9);
  if (!inited)
  {
LABEL_7:
    v16 = inited;
    goto LABEL_13;
  }
  uint64_t v12 = objc_msgSend_mockAccountWithTestAccount_testDevice_(CKDBackingAccount, v10, (uint64_t)v6, v7);
  v13 = (void *)inited[2];
  inited[2] = v12;

  id v14 = (void *)*MEMORY[0x1E4F1A548];
  if (inited[2])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v14);
    }
    uint64_t v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Created mock backing account with test account \"%@\", testDevice \"%@\"", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v14);
  }
  uint64_t v17 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "Could not create mock backing account with test account \"%@\", test device \"%@\"", (uint8_t *)&v19, 0x16u);
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (NSPersonNameComponents)fullName
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_fullName(v3, v4, v5);

  return (NSPersonNameComponents *)v6;
}

- (NSString)primaryEmail
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_primaryEmail(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)username
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_username(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)formattedUsername
{
  id v4 = objc_msgSend_username(self, a2, v2);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_formattedUsernameFromUsername_(MEMORY[0x1E4F4F0E0], v3, (uint64_t)v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)personaIdentifier
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_personaIdentifier(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)displayedHostname
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_displayedHostname(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)serverPreferredPushEnvironment
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_backingAccount(self, a2, v2);
  id v7 = objc_msgSend_serverPreferredPushEnvironment(v4, v5, v6);

  if (!objc_msgSend_length(v7, v8, v9))
  {
    uint64_t v12 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v10, v11);
    int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v12, v13, v14);

    if (isAppleInternalInstall && (objc_msgSend_haveWarnedAboutServerPreferredPushEnvironment(self, v16, v17) & 1) == 0)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v18 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        id v20 = v18;
        uint64_t v23 = objc_msgSend_backingAccount(self, v21, v22);
        int v26 = 138412290;
        v27 = v23;
        _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Warn: Couldn't determine server preferred push environment from backing account %@", (uint8_t *)&v26, 0xCu);
      }
      objc_msgSend_setHaveWarnedAboutServerPreferredPushEnvironment_(self, v19, 1);
    }
    id v24 = (id)*MEMORY[0x1E4F4E1D0];

    id v7 = v24;
  }
  return (NSString *)v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_backingAccount(self, v6, v7);
  uint64_t v11 = objc_msgSend_primaryEmail(v8, v9, v10);
  uint64_t v14 = objc_msgSend_accountID(self, v12, v13);
  v16 = objc_msgSend_stringWithFormat_(v3, v15, @"<%@ %p> (\"%@\" Account ID: %@)", v5, self, v11, v14);

  return v16;
}

- (BOOL)isPrimaryEmailVerified
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  char isPrimaryEmailVerified = objc_msgSend_isPrimaryEmailVerified(v3, v4, v5);

  return isPrimaryEmailVerified;
}

- (BOOL)isDataclassEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_backingAccount(self, v5, v6);
  char isDataclassEnabled = objc_msgSend_isDataclassEnabled_(v7, v8, (uint64_t)v4);

  return isDataclassEnabled;
}

- (BOOL)isDataclassEnabledForCellular:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_backingAccount(self, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_backingAccount(self, v8, v9);
    char isDataclassEnabledForCellular = objc_msgSend_isDataclassEnabledForCellular_(v10, v11, (uint64_t)v4);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "No backing account, so allowing cellular access from account perspective.", v15, 2u);
    }
    char isDataclassEnabledForCellular = 1;
  }

  return isDataclassEnabledForCellular;
}

- (NSString)dsid
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_dsid(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)altDSID
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_altDSID(v3, v4, v5);

  return (NSString *)v6;
}

- (void)updateAccountPropertiesAndSaveAccountWithCompletionHandler:(id)a3
{
  id v12 = a3;
  uint64_t v6 = objc_msgSend_backingAccount(self, v4, v5);

  if (v6)
  {
    uint64_t v9 = objc_msgSend_backingAccount(self, v7, v8);
    objc_msgSend_updateAccountPropertiesAndSaveAccount_(v9, v10, (uint64_t)v12);
  }
  else
  {
    uint64_t v11 = v12;
    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 1002, @"Can't update account properties because we have no account");
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v9);
  }

  uint64_t v11 = v12;
LABEL_6:
}

- (void)_lockedRenewTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 tokenFetchBlock:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, id *))a6;
  id v14 = a7;
  uint64_t v17 = objc_msgSend_authTokenQueue(self, v15, v16);
  dispatch_assert_queue_V2(v17);

  id v112 = 0;
  uint64_t v18 = v13[2](v13, &v112);
  id v21 = v112;
  if (!v21 && v18 && !v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = v22;
      uint64_t v28 = objc_msgSend_accountID(self, v26, v27);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_INFO, "The CloudKit auth token for account %@ has changed since the last one we attempted. Trying again with the new token.", (uint8_t *)&buf, 0xCu);
    }
    v29 = objc_msgSend_authTokenCallbackQueue(self, v23, v24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E2E588;
    block[3] = &unk_1E64F0A80;
    id v111 = v14;
    dispatch_async(v29, block);

    id v21 = 0;
    uint64_t v30 = &v111;
    goto LABEL_42;
  }
  v31 = objc_msgSend_backingAccount(self, v19, v20);
  int isAccountSuspended = objc_msgSend_isAccountSuspended(v31, v32, v33);

  if (isAccountSuspended)
  {
    __int16 v37 = objc_msgSend_backingAccount(self, v35, v36);
    int canSuspendedAccountRenewCredentials = objc_msgSend_canSuspendedAccountRenewCredentials(v37, v38, v39);

    if (((canSuspendedAccountRenewCredentials | v10) & 1) == 0)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v71 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_INFO, "Account is suspended and we did attempt a renewal recently. Rate limiting this renewal request", (uint8_t *)&buf, 2u);
      }
      if (!v21)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v72, *MEMORY[0x1E4F19DD8], 1004, @"Can't renew our auth token since account is suspended and renewal is rate limited");
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v14)
      {
        v74 = objc_msgSend_authTokenCallbackQueue(self, v72, v73);
        v75 = v107;
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = sub_1C4E2E5A8;
        v107[3] = &unk_1E64F0790;
        id v109 = v14;
        id v21 = v21;
        id v108 = v21;
        dispatch_async(v74, v107);

LABEL_41:
        uint64_t v30 = (void **)(v75 + 5);
LABEL_42:
        v50 = *v30;
LABEL_56:

        goto LABEL_57;
      }
      goto LABEL_57;
    }
    if (objc_msgSend_canAccessAccount(v12, v41, v42))
    {
      v45 = objc_msgSend_backingAccount(self, v43, v44);
      objc_msgSend_noteSuspendedAccountRenewalDate(v45, v46, v47);

LABEL_14:
      v48 = objc_opt_new();
      v50 = v48;
      if (v91) {
        objc_msgSend_setObject_forKeyedSubscript_(v48, v49, (uint64_t)v91, *MEMORY[0x1E4F17A18]);
      }
      if (v10) {
        objc_msgSend_setObject_forKeyedSubscript_(v50, v49, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F17A40]);
      }
      dispatch_semaphore_t v90 = dispatch_semaphore_create(0);
      uint64_t v100 = 0;
      v101 = &v100;
      uint64_t v102 = 0x2020000000;
      char v103 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v122 = 0x3032000000;
      v123 = sub_1C4E2E5D8;
      v124 = sub_1C4E2E5E8;
      id v125 = 0;
      v53 = objc_msgSend_backingAccount(self, v51, v52);

      if (v53)
      {
        v56 = objc_msgSend_backingAccount(self, v54, v55);
        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = sub_1C4E2E5F0;
        v96[3] = &unk_1E64F3E90;
        v98 = &v100;
        p_long long buf = &buf;
        v57 = v90;
        v97 = v57;
        objc_msgSend_renewAuthTokenWithOptions_completionHandler_(v56, v58, (uint64_t)v50, v96);

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v59 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v62 = objc_msgSend_accountID(self, v60, v61);
          *(_DWORD *)v113 = 138412290;
          uint64_t v114 = (uint64_t)v62;
          _os_log_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_INFO, "Waiting on a credential renewal for account %@", v113, 0xCu);
        }
        dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
        v63 = v97;
      }
      else
      {
        *((unsigned char *)v101 + 24) = 0;
        uint64_t v77 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v54, *MEMORY[0x1E4F19DD8], 1002, @"Can't renew credentials because we don't have an account");
        v63 = *(NSObject **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v77;
      }

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v78 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        uint64_t v81 = objc_msgSend_accountID(self, v79, v80);
        v82 = (void *)v81;
        v83 = &stru_1F2044F30;
        if (*((unsigned char *)v101 + 24)) {
          v84 = &stru_1F2044F30;
        }
        else {
          v84 = @"un";
        }
        v85 = *(__CFString **)(*((void *)&buf + 1) + 40);
        v86 = @" Error was ";
        if (!v85) {
          v86 = &stru_1F2044F30;
        }
        *(_DWORD *)v113 = 138413058;
        if (v85) {
          v83 = v85;
        }
        uint64_t v114 = v81;
        __int16 v115 = 2114;
        v116 = v84;
        __int16 v117 = 2114;
        v118 = v86;
        __int16 v119 = 2112;
        v120 = v83;
        _os_log_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_INFO, "Credential renewal for account %@ finished %{public}@successfully.%{public}@%@", v113, 0x2Au);
      }
      v89 = objc_msgSend_authTokenCallbackQueue(self, v87, v88);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = sub_1C4E2E660;
      v92[3] = &unk_1E64F2AF8;
      id v93 = v14;
      v94 = &v100;
      v95 = &buf;
      dispatch_async(v89, v92);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v100, 8);

      goto LABEL_56;
    }
  }
  else if (objc_msgSend_canAccessAccount(v12, v35, v36))
  {
    goto LABEL_14;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v64 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    v67 = v64;
    v70 = objc_msgSend_accountID(self, v68, v69);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v70;
    _os_log_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_INFO, "Can't access the account with ID %@, so failing this auth token renew request", (uint8_t *)&buf, 0xCu);
  }
  if (v21)
  {
    if (!v14) {
      goto LABEL_57;
    }
    goto LABEL_40;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v65, *MEMORY[0x1E4F19DD8], 2011, @"Can't renew our auth token since we don't have access to the account");
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
LABEL_40:
    v76 = objc_msgSend_authTokenCallbackQueue(self, v65, v66);
    v75 = v104;
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = sub_1C4E2E5C0;
    v104[3] = &unk_1E64F0790;
    id v106 = v14;
    id v21 = v21;
    id v105 = v21;
    dispatch_async(v76, v104);

    goto LABEL_41;
  }
LABEL_57:
}

- (void)renewCloudKitAuthTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 failedToken:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  uint64_t v18 = objc_msgSend_authTokenQueue(self, v16, v17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E2E800;
  block[3] = &unk_1E64F3EE0;
  objc_copyWeak(&v28, &location);
  BOOL v29 = a4;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v18, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)cloudKitAuthTokenWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    BOOL v10 = objc_msgSend_authTokenQueue(self, v8, v9);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E2ECA0;
    block[3] = &unk_1E64F24A0;
    objc_copyWeak(&v15, &location);
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)renewiCloudAuthTokenWithReason:(id)a3 shouldForce:(BOOL)a4 container:(id)a5 failedToken:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  uint64_t v18 = objc_msgSend_authTokenQueue(self, v16, v17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E2EF30;
  block[3] = &unk_1E64F3EE0;
  objc_copyWeak(&v28, &location);
  BOOL v29 = a4;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v18, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)iCloudAuthTokenWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    BOOL v10 = objc_msgSend_authTokenQueue(self, v8, v9);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E2F260;
    block[3] = &unk_1E64F24A0;
    objc_copyWeak(&v15, &location);
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (NSURL)privateCloudDBURL
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_privateCloudDBURL(v3, v4, v5);

  return (NSURL *)v6;
}

- (NSURL)privateShareServiceURL
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_privateShareServiceURL(v3, v4, v5);

  return (NSURL *)v6;
}

- (NSURL)privateDeviceServiceURL
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_privateDeviceServiceURL(v3, v4, v5);

  return (NSURL *)v6;
}

- (NSURL)privateCodeServiceURL
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_privateCodeServiceURL(v3, v4, v5);

  return (NSURL *)v6;
}

- (NSURL)privateMetricsServiceURL
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_privateMetricsServiceURL(v3, v4, v5);

  return (NSURL *)v6;
}

- (void)validateVettingToken:(id)a3 vettingEmail:(id)a4 vettingPhone:(id)a5 container:(id)a6 completionHandler:(id)a7
{
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  if (objc_msgSend_canAccessAccount(a6, v15, v16))
  {
    id v19 = objc_msgSend_backingAccount(self, v17, v18);
    objc_msgSend_validateVettingToken_vettingEmail_vettingPhone_completionHandler_(v19, v20, (uint64_t)v21, v12, v13, v14);
  }
  else
  {
    if (!v14) {
      goto LABEL_6;
    }
    id v19 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 2011, @"Can't reauth since we don't have access to the account");
    v14[2](v14, 0, v19);
  }

LABEL_6:
}

- (NSString)sharingURLHostname
{
  uint64_t v3 = objc_msgSend_backingAccount(self, a2, v2);
  id v6 = objc_msgSend_sharingURLHostname(v3, v4, v5);

  return (NSString *)v6;
}

- (int64_t)lastKnownDeviceCount
{
  id v4 = objc_msgSend_backingAccount(self, a2, v2);

  if (v4)
  {
    id v7 = objc_msgSend_backingAccount(self, v5, v6);
    int64_t KnownDeviceCount = objc_msgSend_lastKnownDeviceCount(v7, v8, v9);

    return KnownDeviceCount;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v13 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "No backing account, assuming single device", v13, 2u);
    }
    return 1;
  }
}

- (BOOL)isValidTestAccount
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_backingAccount(self, a2, v2);
  uint64_t v6 = objc_msgSend_iCloudAuthTokenWithError_(v4, v5, 0);

  if (v6)
  {
    uint64_t v9 = objc_msgSend_backingAccount(self, v7, v8);
    uint64_t v11 = objc_msgSend_cloudKitAuthTokenWithError_(v9, v10, 0);

    if (!v11)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v31 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        int v53 = 138412290;
        v54 = self;
        _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "Account %@ is not valid because it has no iCloud auth token", (uint8_t *)&v53, 0xCu);
      }
      BOOL v30 = 0;
      goto LABEL_31;
    }
    id v14 = objc_msgSend_backingAccount(self, v12, v13);
    uint64_t v16 = objc_msgSend_accountPropertiesForDataclass_(v14, v15, @"com.apple.Dataclass.Account");
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"iCloudEnv");

    if ((!v18 || objc_msgSend_isEqualToString_(v18, v19, @"PROD"))
      && (objc_msgSend_isCarryAccount(self, v19, v20) & 1) == 0)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v32 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = v32;
        v45 = objc_msgSend_backingAccount(self, v43, v44);
        uint64_t v47 = objc_msgSend_accountPropertiesForDataclass_(v45, v46, *MEMORY[0x1E4F17A78]);
        v50 = objc_msgSend_backingAccount(self, v48, v49);
        uint64_t v52 = objc_msgSend_accountPropertiesForDataclass_(v50, v51, @"com.apple.Dataclass.Account");
        int v53 = 138412802;
        v54 = self;
        __int16 v55 = 2112;
        v56 = v47;
        __int16 v57 = 2112;
        v58 = v52;
        _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Account %@ is not valid because it is a non-carry prod account according to these property sets: %@ %@", (uint8_t *)&v53, 0x20u);
      }
      goto LABEL_26;
    }
    id v21 = objc_msgSend_backingAccount(self, v19, v20);
    int isAccountSuspended = objc_msgSend_isAccountSuspended(v21, v22, v23);

    if (isAccountSuspended)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v27 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      int v53 = 138412290;
      v54 = self;
      id v28 = "Account %@ is not valid because it's marked as suspended";
    }
    else
    {
      uint64_t v33 = objc_msgSend_backingAccount(self, v25, v26);
      v34 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0
        || (objc_msgSend_backingAccount(self, v36, v37),
            uint64_t v38 = objc_claimAutoreleasedReturnValue(),
            char v40 = objc_msgSend_credentialsAreValidForAccount_(CKDPCSIdentityManager, v39, (uint64_t)v38),
            v38,
            (v40 & 1) != 0))
      {
        BOOL v30 = 1;
        goto LABEL_30;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v27 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        BOOL v30 = 0;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      int v53 = 138412290;
      v54 = self;
      id v28 = "Account %@ is not valid because it can't get Stingray identities via PCS";
    }
    _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v53, 0xCu);
    goto LABEL_26;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v29 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    int v53 = 138412290;
    v54 = self;
    _os_log_error_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_ERROR, "Account %@ is not valid because it has no iCloud auth token", (uint8_t *)&v53, 0xCu);
  }
  BOOL v30 = 0;
LABEL_32:

  return v30;
}

- (BOOL)haveWarnedAboutServerPreferredPushEnvironment
{
  return self->_haveWarnedAboutServerPreferredPushEnvironment;
}

- (void)setHaveWarnedAboutServerPreferredPushEnvironment:(BOOL)a3
{
  self->_haveWarnedAboutServerPreferredPushEnvironment = a3;
}

- (OS_dispatch_queue)authTokenCallbackQueue
{
  return self->_authTokenCallbackQueue;
}

- (void)setAuthTokenCallbackQueue:(id)a3
{
}

- (void)setLastFailediCloudAuthToken:(id)a3
{
}

@end