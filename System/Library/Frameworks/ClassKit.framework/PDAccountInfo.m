@interface PDAccountInfo
+ (BOOL)isVerifiedMAIDAccount:(id)a3;
+ (id)_cloudDocsContainer;
+ (id)_orgAdminUserRecordID:(id *)a3;
+ (id)_schoolworkUbiquitousContainerURL:(id *)a3;
+ (id)_userRecordID:(id *)a3;
+ (id)accountInfo;
+ (id)stringFromACAccountCredentialRenewResult:(int64_t)a3;
+ (id)tokenForAccount:(id)a3 withAltDSID:(id)a4 forService:(id)a5 fromAccountStore:(id)a6;
+ (void)_fetchOrgAdminUserRecordIDWithCompletion:(id)a3;
+ (void)_fetchUserRecordIDWithCompletion:(id)a3;
+ (void)checkForiCloudDriveInitialSync;
- (id)description;
- (void)_updateOrgAdminUserRecordID;
- (void)_updateUserRecordID;
- (void)updateAuthenticationState:(BOOL)a3 forServiceID:(id)a4 userInteractive:(BOOL)a5;
@end

@implementation PDAccountInfo

+ (id)_schoolworkUbiquitousContainerURL:(id *)a3
{
  if (qword_10023E490 != -1) {
    dispatch_once(&qword_10023E490, &stru_1001F2920);
  }
  v4 = +[NSFileManager defaultManager];
  v5 = [v4 ubiquityIdentityToken];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10023E478);
  v6 = (void *)qword_10023E480;
  if (v5)
  {
    if (qword_10023E480)
    {
LABEL_10:
      id v14 = v6;
      goto LABEL_16;
    }
    CLSLogDebugCurrentPersona();
    v7 = CLSUbiquitousContainerID();
    v8 = +[NSFileManager defaultManager];
    uint64_t v9 = [v8 URLForUbiquityContainerIdentifier:v7];
    v10 = (void *)qword_10023E480;
    qword_10023E480 = v9;

    if (!qword_10023E480)
    {
      uint64_t v11 = +[NSError cls_createErrorWithCode:100, @"Failed to get URLForUbiquityContainerIdentifier:'%@'", v7 format];
      v12 = (void *)qword_10023E488;
      qword_10023E488 = v11;

      CLSInitLog();
      v13 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = qword_10023E488;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_schoolworkUbiquitousContainerURL failed with error: %{public}@", buf, 0xCu);
        if (!a3) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      if (a3) {
LABEL_8:
      }
        *a3 = (id) qword_10023E488;
    }
LABEL_9:

    v6 = (void *)qword_10023E480;
    goto LABEL_10;
  }
  qword_10023E480 = 0;

  uint64_t v15 = +[NSError cls_createErrorWithCode:100 format:@"[[NSFileManager defaultManager] ubiquityIdentityToken] returned nil"];
  v16 = (void *)qword_10023E488;
  qword_10023E488 = v15;

  CLSInitLog();
  v17 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = qword_10023E488;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "_schoolworkUbiquitousContainerURL failed with error: %{public}@", buf, 0xCu);
    if (a3) {
      goto LABEL_13;
    }
  }
  else if (a3)
  {
LABEL_13:
    id v14 = 0;
    *a3 = (id) qword_10023E488;
    goto LABEL_16;
  }
  id v14 = 0;
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10023E478);

  return v14;
}

+ (id)_cloudDocsContainer
{
  return +[CKContainer containerWithIdentifier:@"com.apple.clouddocs"];
}

+ (void)_fetchOrgAdminUserRecordIDWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [a1 _cloudDocsContainer];
  CLSInitLog();
  v6 = CLSLogAuthorization;
  if (os_log_type_enabled(CLSLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "About to fetch ORG admin user recordID", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004188C;
  v8[3] = &unk_1001F2948;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchOrgAdminUserRecordIDWithCompletionHandler:v8];
}

+ (void)_fetchUserRecordIDWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [a1 _cloudDocsContainer];
  CLSInitLog();
  v6 = CLSLogAuthorization;
  if (os_log_type_enabled(CLSLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "About to fetch current user recordID", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100041AB4;
  v8[3] = &unk_1001F2948;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchUserRecordIDWithCompletionHandler:v8];
}

+ (id)_orgAdminUserRecordID:(id *)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000B644;
  v26 = sub_10000B53C;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000B644;
  uint64_t v20 = sub_10000B53C;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100041DD8;
  v12[3] = &unk_1001F2990;
  id v14 = &v16;
  uint64_t v15 = &v22;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &stru_1001F2968);
  id v13 = v5;
  [a1 _fetchOrgAdminUserRecordIDWithCompletion:v12];
  dispatch_time_t v6 = dispatch_time(0, 20000000000);
  if (dispatch_block_wait(v5, v6))
  {
    uint64_t v7 = +[NSError cls_createErrorWithCode:320 description:@"Timed out getting ORG admin user recordID"];
    v8 = (void *)v23[5];
    v23[5] = v7;
  }
  id v9 = (id) v23[5];
  if (a3) {
    *a3 = v9;
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

+ (id)_userRecordID:(id *)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000B644;
  v26 = sub_10000B53C;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000B644;
  uint64_t v20 = sub_10000B53C;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100042074;
  v12[3] = &unk_1001F2990;
  id v14 = &v16;
  uint64_t v15 = &v22;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &stru_1001F29B0);
  id v13 = v5;
  [a1 _fetchUserRecordIDWithCompletion:v12];
  dispatch_time_t v6 = dispatch_time(0, 20000000000);
  if (dispatch_block_wait(v5, v6))
  {
    uint64_t v7 = +[NSError cls_createErrorWithCode:320 description:@"Timed out getting current user recordID"];
    v8 = (void *)v23[5];
    v23[5] = v7;
  }
  id v9 = (id) v23[5];
  if (a3) {
    *a3 = v9;
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

+ (id)stringFromACAccountCredentialRenewResult:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_1001F2BE0 + a3);
  }
}

+ (id)tokenForAccount:(id)a3 withAltDSID:(id)a4 forService:(id)a5 fromAccountStore:(id)a6
{
  id v9 = a5;
  id v17 = 0;
  id v10 = [a6 credentialForAccount:a3 serviceID:v9 error:&v17];
  id v11 = v17;
  v12 = v11;
  if (!a4 || !v10)
  {
    if (!v11) {
      goto LABEL_8;
    }
    CLSInitLog();
    id v14 = CLSLogDefault;
    if (!os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138543362;
    id v19 = v12;
    uint64_t v15 = "credentialForAccount:serviceID error: = %{public}@;";
    goto LABEL_13;
  }
  id v13 = [v10 token];
  if (v13) {
    goto LABEL_9;
  }
  CLSInitLog();
  id v14 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v9;
    uint64_t v15 = "Did not get a service token for service: %{public}@.";
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
  }
LABEL_8:
  id v13 = 0;
LABEL_9:

  return v13;
}

+ (BOOL)isVerifiedMAIDAccount:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "aa_isManagedAppleID")) {
    unsigned __int8 v4 = objc_msgSend(v3, "aa_isPrimaryEmailVerified");
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (void)checkForiCloudDriveInitialSync
{
  CLSUbiquitousContainerID();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  BRRegisterInitialSyncHandlerForContainer();
}

+ (id)accountInfo
{
  id v2 = +[PDUserDefaults sharedDefaults];
  unsigned int v3 = [v2 enableVerboseLogging];

  if (v3) {
    CLSLogDebugCurrentPersona();
  }
  unsigned __int8 v4 = +[ACAccountStore defaultStore];
  char v35 = 0;
  id v34 = 0;
  id v33 = 0;
  +[ACAccountStore cls_getEligibleAccount:&v34 isDataSeparated:&v35 personaUniqueIdentifier:&v33];
  id v5 = v34;
  id v6 = v33;
  id v7 = v33;
  v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      CLSInitLog();
      id v9 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to get a persona for the chosen account.", buf, 2u);
      }
    }
    id v10 = sub_100043254([PDAccountInfo alloc], v5);
    if (([v5 isAuthenticated] & 1) == 0 && v10)
    {
      *(void *)(v10 + 6) = 0x100000001;
      *((_DWORD *)v10 + 5) = 1;
    }
    id v11 = objc_msgSend(v5, "aa_personID");
    id v12 = [v11 copy];
    id v14 = v12;
    if (v10)
    {
      objc_setProperty_nonatomic_copy(v10, v13, v12, 32);

      uint64_t v15 = [v5 identifier];
      objc_storeStrong((id *)v10 + 8, v15);

      objc_storeStrong((id *)v10 + 9, v6);
      *((unsigned char *)v10 + 8) = v35;
      *((unsigned char *)v10 + 9) = [v5 isEnabledForDataclass:ACAccountDataclassUbiquity];
      if (v35)
      {
LABEL_12:
        uint64_t v16 = +[MCProfileConnection sharedConnection];
        unsigned __int8 v17 = [v16 mayOpenFromManagedToUnmanaged];
        if (v10)
        {
          *((unsigned char *)v10 + 10) = v17;
          *((unsigned char *)v10 + 11) = [v16 mayOpenFromUnmanagedToManaged];
        }
        else
        {
          [v16 mayOpenFromUnmanagedToManaged];
        }

        goto LABEL_19;
      }
      v10[5] = 257;
    }
    else
    {

      [v5 identifier];
      [v5 isEnabledForDataclass:ACAccountDataclassUbiquity];
      if (v35) {
        goto LABEL_12;
      }
    }
LABEL_19:
    uint64_t v20 = objc_msgSend(v5, "aa_altDSID");
    id v21 = [v20 copy];

    if (v10) {
      objc_setProperty_nonatomic_copy(v10, v22, v21, 40);
    }
    v23 = objc_msgSend(v4, "aida_accountForAltDSID:", v21);
    id v27 = v10;
    v28 = v23;
    v29 = v21;
    id v30 = v4;
    id v31 = v5;
    id v24 = v21;
    id v25 = v23;
    CLSPerformWithPersona();
    id v19 = v27;

    goto LABEL_22;
  }
  CLSInitLog();
  uint64_t v18 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No valid account found", buf, 2u);
  }
  id v19 = sub_100043254([PDAccountInfo alloc], 0);
LABEL_22:

  return v19;
}

- (void)updateAuthenticationState:(BOOL)a3 forServiceID:(id)a4 userInteractive:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  int v9 = sub_100044208((uint64_t)self, v8);
  if (v8 && ([v8 isEqualToString:@"iCloudDriveServiceName"] & 1) != 0)
  {
    if (v6) {
      int v10 = 2;
    }
    else {
      int v10 = 1;
    }
    if (v9 == v10) {
      goto LABEL_33;
    }
    int v11 = !v6;
  }
  else
  {
    BOOL v12 = sub_1000442BC((BOOL)self);
    if (v6) {
      int v13 = 2;
    }
    else {
      int v13 = 1;
    }
    if (v12) {
      int v10 = v13;
    }
    else {
      int v10 = 0;
    }
    if (v9 == v10) {
      goto LABEL_33;
    }
    int v11 = v10 == 1;
    if (!v8) {
      goto LABEL_28;
    }
  }
  if ([v8 isEqualToString:@"orion"])
  {
    if (self) {
      self->_handoutServiceAuthenticationState = v10;
    }
    if (!v11) {
      goto LABEL_28;
    }
    sub_1000435F8((uint64_t)self, 0);
    goto LABEL_27;
  }
  if (([v8 isEqualToString:@"apple_school_manager"] & 1) == 0
    && ![v8 isEqualToString:@"apple_business_manager"])
  {
    unsigned int v17 = [v8 isEqualToString:@"iCloudDriveServiceName"];
    if (self && v17) {
      self->_iCloudDriveAuthenticationState = v10;
    }
    goto LABEL_28;
  }
  if (self) {
    self->_rosterServiceAuthenticationState = v10;
  }
  if (v11)
  {
    sub_100043608((uint64_t)self, 0);
LABEL_27:
    int v11 = 1;
  }
LABEL_28:
  CLSInitLog();
  id v14 = (void *)CLSLogAuthorization;
  if (os_log_type_enabled(CLSLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    uint64_t v16 = NSStringFromCLSAuthenticationState();
    int v18 = 138412546;
    id v19 = v16;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "updateAuthenticationState new authenticationState:%@ for %@", (uint8_t *)&v18, 0x16u);
  }
  if (v11) {
    sub_100043B90((uint64_t)PDAccountInfo, self, v5);
  }
  +[CLSUtil postNotificationAsync:"com.apple.progressd.accountChanged"];
LABEL_33:
}

- (void)_updateOrgAdminUserRecordID
{
  id v6 = 0;
  unsigned int v3 = +[PDAccountInfo _orgAdminUserRecordID:&v6];
  id v4 = v6;
  id v5 = v6;
  if (self)
  {
    objc_storeStrong((id *)&self->_orgAdminUserRecordID, v3);
    objc_storeStrong((id *)&self->_orgAdminUserFetchError, v4);
  }
}

- (void)_updateUserRecordID
{
  id v6 = 0;
  unsigned int v3 = +[PDAccountInfo _userRecordID:&v6];
  id v4 = v6;
  id v5 = v6;
  if (self)
  {
    objc_storeStrong((id *)&self->_userRecordID, v3);
    objc_storeStrong((id *)&self->_userFetchError, v4);
  }
}

- (id)description
{
  unsigned int v3 = objc_opt_new();
  objc_msgSend(v3, "appendFormat:", @"PDAccountInfo: <%p>\n", self);
  if (self)
  {
    [v3 appendFormat:@"  dsID                              : %@\n", self->_dsID];
    [v3 appendFormat:@"  altDSID                           : %@\n", self->_altDSID];
    [v3 appendFormat:@"  orionToken                        : %@\n", self->_orionToken];
    [v3 appendFormat:@"  axmToken                          : %@\n", self->_axmToken];
    if (self->_isDataSeparatedAccount) {
      id v4 = "YES";
    }
    else {
      id v4 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  isDataSeparatedAccount            : %s\n", v4);
    if ([(ACAccount *)self->_account aa_isManagedAppleID]) {
      id v5 = "YES";
    }
    else {
      id v5 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  isManagedAccount                  : %s\n", v5);
    if (self->_hasUbiquityEnabled) {
      id v6 = "YES";
    }
    else {
      id v6 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  hasUbiquityEnabled                : %s\n", v6);
    [v3 appendFormat:@"  accountIdentifier                 : %@\n", self->_accountIdentifier];
    [v3 appendFormat:@"  personaUniqueIdentifier           : %@\n", self->_personaUniqueIdentifier];
    if (sub_10000C6EC((BOOL)self)) {
      id v7 = "YES";
    }
    else {
      id v7 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  valid                             : %s\n", v7);
    if (sub_1000442BC((BOOL)self)) {
      id v8 = "YES";
    }
    else {
      id v8 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  hasCredentials                    : %s\n", v8);
  }
  else
  {
    [v3 appendFormat:@"  dsID                              : %@\n", 0];
    [v3 appendFormat:@"  altDSID                           : %@\n", 0];
    [v3 appendFormat:@"  orionToken                        : %@\n", 0];
    [v3 appendFormat:@"  axmToken                          : %@\n", 0];
    objc_msgSend(v3, "appendFormat:", @"  isDataSeparatedAccount            : %s\n", "NO");
    objc_msgSend(v3, "appendFormat:", @"  isManagedAccount                  : %s\n", "NO");
    objc_msgSend(v3, "appendFormat:", @"  hasUbiquityEnabled                : %s\n", "NO");
    [v3 appendFormat:@"  accountIdentifier                 : %@\n", 0];
    [v3 appendFormat:@"  personaUniqueIdentifier           : %@\n", 0];
    objc_msgSend(v3, "appendFormat:", @"  valid                             : %s\n", "NO");
    objc_msgSend(v3, "appendFormat:", @"  hasCredentials                    : %s\n", "NO");
  }
  int v9 = NSStringFromCLSAuthenticationState();
  [v3 appendFormat:@"  rosterServiceAuthenticationState  : %@\n", v9];

  int v10 = NSStringFromCLSAuthenticationState();
  [v3 appendFormat:@"  handoutServiceAuthenticationState : %@\n", v10];

  int v11 = NSStringFromCLSAuthenticationState();
  [v3 appendFormat:@"  iCloudDriveAuthenticationState    : %@\n", v11];

  if (self)
  {
    if (self->_hasUbiquityEnabled) {
      BOOL v12 = "YES";
    }
    else {
      BOOL v12 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  hasUbiquityEnabled                : %s\n", v12);
    if (self->_mayOpenFromManagedToUnmanaged) {
      int v13 = "YES";
    }
    else {
      int v13 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  mayOpenFromManagedToUnmanaged     : %s\n", v13);
    if (self->_mayOpenFromUnmanagedToManaged) {
      id v14 = "YES";
    }
    else {
      id v14 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"  mayOpenFromUnmanagedToManaged     : %s\n", v14);
    [v3 appendFormat:@"  schoolworkUbiquitousContainerURL  : %@\n", self->_schoolworkUbiquitousContainerURL];
    [v3 appendFormat:@"  schoolworkUbiquitousContainerError: %@\n", self->_schoolworkUbiquitousContainerError];
    [v3 appendFormat:@"  orgAdminUserRecordID              : %@\n", self->_orgAdminUserRecordID];
    [v3 appendFormat:@"  orgAdminUserFetchError            : %@\n", self->_orgAdminUserFetchError];
    [v3 appendFormat:@"  userRecordID                      : %@\n", self->_userRecordID];
    [v3 appendFormat:@"  userFetchError                    : %@\n", self->_userFetchError];
    [v3 appendFormat:@"  multimediaCacheDirectoryURL       : %@\n", self->_multimediaCacheDirectoryURL];
    multimediaCacheDirectoryURLError = self->_multimediaCacheDirectoryURLError;
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"  hasUbiquityEnabled                : %s\n", "NO");
    objc_msgSend(v3, "appendFormat:", @"  mayOpenFromManagedToUnmanaged     : %s\n", "NO");
    objc_msgSend(v3, "appendFormat:", @"  mayOpenFromUnmanagedToManaged     : %s\n", "NO");
    [v3 appendFormat:@"  schoolworkUbiquitousContainerURL  : %@\n", 0];
    [v3 appendFormat:@"  schoolworkUbiquitousContainerError: %@\n", 0];
    [v3 appendFormat:@"  orgAdminUserRecordID              : %@\n", 0];
    [v3 appendFormat:@"  orgAdminUserFetchError            : %@\n", 0];
    [v3 appendFormat:@"  userRecordID                      : %@\n", 0];
    [v3 appendFormat:@"  userFetchError                    : %@\n", 0];
    [v3 appendFormat:@"  multimediaCacheDirectoryURL       : %@\n", 0];
    multimediaCacheDirectoryURLError = 0;
  }
  [v3 appendFormat:@"  multimediaCacheDirectoryURLError  : %@\n", multimediaCacheDirectoryURLError];
  id v16 = [v3 copy];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURLError, 0);
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_userFetchError, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_orgAdminUserFetchError, 0);
  objc_storeStrong((id *)&self->_orgAdminUserRecordID, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerError, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerURL, 0);
  objc_storeStrong((id *)&self->_personaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_axmToken, 0);
  objc_storeStrong((id *)&self->_orionToken, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsID, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end