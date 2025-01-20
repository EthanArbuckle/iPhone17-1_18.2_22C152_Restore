@interface FTPasswordManager
+ (id)_loginUserNotificationForService:(id)a3 user:(id)a4 isForBadPassword:(BOOL)a5 showForgetPassword:(BOOL)a6 shouldRememberPassword:(BOOL)a7;
+ (id)sharedInstance;
- (BOOL)_shouldForceSilentOnlyAuthForUsername:(id)a3 serviceIdentifier:(id)a4;
- (BOOL)_usernameHasCorrespondingIdMSAccount:(id)a3;
- (BOOL)isAuthTokenReceiptTime:(double)a3 withinGracePeriod:(double)a4;
- (BOOL)supportsAuthTokenRequests;
- (FTPasswordManager)init;
- (FTPasswordManager)initWithUserNotificationCenter:(id)a3;
- (double)authTokenGracePeriod;
- (id)_accountBasedOnProfileID:(id)a3 orUsername:(id)a4 inStore:(id)a5;
- (id)_accountOptionsDictForRenewCredentialsForService:(id)a3 username:(id)a4 shouldFailIfNotSilent:(BOOL)a5;
- (id)_accountWithProfileID:(id)a3 username:(id)a4 inStore:(id)a5;
- (id)_accountWithProfileIDMatchingUser:(id)a3 inStore:(id)a4;
- (id)_accountWithUsername:(id)a3 inStore:(id)a4;
- (id)_accountWithUsernameAlias:(id)a3 inStore:(id)a4;
- (id)_credentialForAccount:(id)a3;
- (id)_findAccountOfType:(id)a3 InStore:(id)a4 withCriteria:(id)a5;
- (id)_findGameCenterAccountInStore:(id)a3 withCriteria:(id)a4;
- (id)_findIDSAccountInStore:(id)a3 withCriteria:(id)a4;
- (id)_findIDSAccountsInStore:(id)a3 withCriteria:(id)a4;
- (id)_gameCenterAccountWithUsername:(id)a3;
- (id)_keychainAuthTokenForUsername:(id)a3 service:(id)a4;
- (id)_keychainPasswordForUsername:(id)a3 service:(id)a4;
- (id)_profileIDForUsername:(id)a3 inStore:(id)a4;
- (id)acAccountWithProfileID:(id)a3 username:(id)a4 accountStore:(id)a5;
- (id)gameCenterPropertiesFromAccountWithUsername:(id)a3;
- (id)profileIDForACAccount:(id)a3;
- (void)_renewCredentialsIfPossibleForAccount:(id)a3 username:(id)a4 inServiceIdentifier:(id)a5 originalInServiceIdentifier:(id)a6 serviceName:(id)a7 failIfNotSilent:(BOOL)a8 renewHandler:(id)a9 shortCircuitCompletionBlock:(id)a10;
- (void)_setKeychainAuthToken:(id)a3 forUsername:(id)a4 service:(id)a5;
- (void)_setKeychainPassword:(id)a3 forUsername:(id)a4 service:(id)a5;
- (void)_updateStatus:(id)a3 onAccount:(id)a4;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)cancelRequestID:(id)a3 serviceIdentifier:(id)a4;
- (void)cleanUpAccountsBasedOnInUseUsernamesBlock:(id)a3 profileIDBlock:(id)a4 completionBlock:(id)a5;
- (void)cleanUpAccountsWithUsername:(id)a3 orProfileID:(id)a4 basedOnInUseUsernames:(id)a5 profileIDs:(id)a6 completionBlock:(id)a7;
- (void)fetchAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 outRequestID:(id *)a6 completionBlock:(id)a7;
- (void)fetchPasswordForProfileID:(id)a3 username:(id)a4 service:(id)a5 outRequestID:(id *)a6 completionBlock:(id)a7;
- (void)performCleanUpWithCompletion:(id)a3;
- (void)removeAuthTokenAllowingGracePeriodForProfileID:(id)a3 username:(id)a4;
- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 failIfNotSilent:(BOOL)a8 outRequestID:(id *)a9 completionBlock:(id)a10;
- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 forceRenewal:(BOOL)a8 failIfNotSilent:(BOOL)a9 outRequestID:(id *)a10 completionBlock:(id)a11;
- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 outRequestID:(id *)a8 completionBlock:(id)a9;
- (void)requestPasswordForUsername:(id)a3 service:(id)a4 badPassword:(BOOL)a5 showForgotPassword:(BOOL)a6 shouldRememberPassword:(BOOL)a7 outRequestID:(id *)a8 completionBlock:(id)a9;
- (void)setAccountStatus:(id)a3 forProfileID:(id)a4 username:(id)a5 service:(id)a6;
- (void)setAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 authToken:(id)a6 selfHandle:(id)a7 accountStatus:(id)a8 outRequestID:(id *)a9 completionBlock:(id)a10;
- (void)setAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 authToken:(id)a6 selfHandle:(id)a7 outRequestID:(id *)a8 completionBlock:(id)a9;
- (void)setHandlesForProfileID:(id)a3 username:(id)a4 service:(id)a5 handles:(id)a6;
- (void)setPasswordForProfileID:(id)a3 username:(id)a4 service:(id)a5 password:(id)a6 outRequestID:(id *)a7 completionBlock:(id)a8;
- (void)updatePreviousUsername:(id)a3 toNewUsername:(id)a4;
@end

@implementation FTPasswordManager

+ (id)sharedInstance
{
  if (qword_1EB47C8D8 != -1) {
    dispatch_once(&qword_1EB47C8D8, &unk_1EFE079A0);
  }
  v2 = (void *)qword_1EB47C890;

  return v2;
}

- (FTPasswordManager)init
{
  v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C418], a2, v2);
  v6 = (FTPasswordManager *)objc_msgSend_initWithUserNotificationCenter_(self, v5, (uint64_t)v4);

  return v6;
}

- (FTPasswordManager)initWithUserNotificationCenter:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FTPasswordManager;
  v6 = [(FTPasswordManager *)&v17 init];
  if (v6)
  {
    id v7 = objc_alloc((Class)MEMORY[0x1AD0D4F50](@"ACMonitoredAccountStore", @"Accounts"));
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = sub_1A7BF1AEC();
    v10 = sub_1A7BF1B40();
    v12 = objc_msgSend_setWithObjects_(v8, v11, (uint64_t)v9, v10, 0);
    uint64_t v14 = objc_msgSend_initWithAccountTypes_delegate_(v7, v13, (uint64_t)v12, v6);
    accountStore = v6->_accountStore;
    v6->_accountStore = (ACAccountStore *)v14;

    objc_storeStrong((id *)&v6->_userNotificationCenter, a3);
  }

  return v6;
}

- (BOOL)supportsAuthTokenRequests
{
  return 1;
}

- (void)_setKeychainPassword:(id)a3 forUsername:(id)a4 service:(id)a5
{
}

- (id)_keychainPasswordForUsername:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  IMGetKeychainPassword();
  id v7 = 0;
  if (!objc_msgSend_length(v7, v8, v9))
  {
    v10 = IMGenerateLoginID();
    v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1A7BFF30C();
    }

    IMGetKeychainPassword();
    id v14 = v7;

    id v7 = v14;
  }

  return v7;
}

- (void)_setKeychainAuthToken:(id)a3 forUsername:(id)a4 service:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  IMCanonicalFormForEmail();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  IMSetKeychainAuthToken();
}

- (id)_keychainAuthTokenForUsername:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = IMCanonicalFormForEmail();
  IMGetKeychainAuthToken();
  id v8 = 0;
  if (!objc_msgSend_length(v8, v9, v10))
  {
    v11 = IMGenerateLoginID();
    id v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1A7BFF30C();
    }

    IMGetKeychainAuthToken();
    id v15 = v8;

    id v8 = v15;
  }

  return v8;
}

- (id)_findAccountOfType:(id)a3 InStore:(id)a4 withCriteria:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = (uint64_t (**)(id, void *))a5;
  if (v8)
  {
    if (!v7)
    {
      sub_1A7BF1AEC();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(v8, v9, (uint64_t)v7);
    objc_msgSend_accountsWithAccountType_(v8, v12, (uint64_t)v11);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v55, v61, 16);
    if (v14)
    {
      uint64_t v17 = v14;
      v50 = v11;
      id v51 = v8;
      id v52 = v7;
      uint64_t v18 = *(void *)v56;
      v19 = (char *)(v10 + 2);
      unint64_t v20 = 0x1E4F6C000uLL;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v23 = objc_msgSend_registration(*(void **)(v20 + 952), v15, v16);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v22;
            _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "Account: %@", buf, 0xCu);
          }

          v26 = objc_msgSend_registration(*(void **)(v20 + 952), v24, v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v29 = objc_msgSend_username(v22, v27, v28);
            *(_DWORD *)buf = 138412290;
            v60 = v29;
            _os_log_impl(&dword_1A7BC0000, v26, OS_LOG_TYPE_DEFAULT, "            username: %@", buf, 0xCu);
          }
          v32 = objc_msgSend_registration(*(void **)(v20 + 952), v30, v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = sub_1A7BF221C(v22);
            *(_DWORD *)buf = 138412290;
            v60 = v33;
            _os_log_impl(&dword_1A7BC0000, v32, OS_LOG_TYPE_DEFAULT, "          profile ID: %@", buf, 0xCu);
          }
          v36 = objc_msgSend_registration(*(void **)(v20 + 952), v34, v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = sub_1A7BF23B0(v22);
            sub_1A7BF22E4(v37);
            v54 = v22;
            unint64_t v38 = v20;
            v39 = v10;
            uint64_t v40 = v17;
            v41 = v19;
            v43 = uint64_t v42 = v18;
            *(_DWORD *)buf = 138412290;
            v60 = v43;
            _os_log_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEFAULT, "               token: %@", buf, 0xCu);

            uint64_t v18 = v42;
            v19 = v41;
            uint64_t v17 = v40;
            uint64_t v10 = v39;
            unint64_t v20 = v38;
            v22 = v54;
          }

          v46 = objc_msgSend_registration(*(void **)(v20 + 952), v44, v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = sub_1A7BF2428(v22);
            *(_DWORD *)buf = 138412290;
            v60 = v47;
            _os_log_impl(&dword_1A7BC0000, v46, OS_LOG_TYPE_DEFAULT, "vetted email handles: %@", buf, 0xCu);
          }
          if (v10[2](v10, v22))
          {
            id v48 = v22;
            goto LABEL_24;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v55, v61, 16);
        if (v17) {
          continue;
        }
        break;
      }
      id v48 = 0;
LABEL_24:
      id v8 = v51;
      id v7 = v52;
      v11 = v50;
    }
    else
    {
      id v48 = 0;
    }
  }
  else
  {
    id v48 = 0;
  }

  return v48;
}

- (id)_findIDSAccountsInStore:(id)a3 withCriteria:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (unsigned int (**)(id, void *))a4;
  if (v5)
  {
    v49 = sub_1A7BF1AEC();
    uint64_t v8 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(v5, v7, (uint64_t)v49);
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10);
    id v50 = v5;
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    id v48 = (void *)v8;
    objc_msgSend_accountsWithAccountType_(v5, v11, v8);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v54, v60, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v55;
      uint64_t v18 = (char *)(v6 + 2);
      unint64_t v19 = 0x1E4F6C000uLL;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v22 = objc_msgSend_registration(*(void **)(v19 + 952), v14, v15);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v21;
            _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "Account: %@", buf, 0xCu);
          }

          uint64_t v25 = objc_msgSend_registration(*(void **)(v19 + 952), v23, v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = objc_msgSend_username(v21, v26, v27);
            *(_DWORD *)buf = 138412290;
            v59 = v28;
            _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "            username: %@", buf, 0xCu);
          }
          uint64_t v31 = objc_msgSend_registration(*(void **)(v19 + 952), v29, v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = sub_1A7BF221C(v21);
            *(_DWORD *)buf = 138412290;
            v59 = v32;
            _os_log_impl(&dword_1A7BC0000, v31, OS_LOG_TYPE_DEFAULT, "          profile ID: %@", buf, 0xCu);
          }
          uint64_t v35 = objc_msgSend_registration(*(void **)(v19 + 952), v33, v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = sub_1A7BF23B0(v21);
            sub_1A7BF22E4(v36);
            v53 = v21;
            unint64_t v37 = v19;
            unint64_t v38 = v6;
            uint64_t v39 = v16;
            uint64_t v40 = v18;
            uint64_t v42 = v41 = v17;
            *(_DWORD *)buf = 138412290;
            v59 = v42;
            _os_log_impl(&dword_1A7BC0000, v35, OS_LOG_TYPE_DEFAULT, "               token: %@", buf, 0xCu);

            uint64_t v17 = v41;
            uint64_t v18 = v40;
            uint64_t v16 = v39;
            id v6 = v38;
            unint64_t v19 = v37;
            v21 = v53;
          }

          uint64_t v45 = objc_msgSend_registration(*(void **)(v19 + 952), v43, v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = sub_1A7BF2428(v21);
            *(_DWORD *)buf = 138412290;
            v59 = v46;
            _os_log_impl(&dword_1A7BC0000, v45, OS_LOG_TYPE_DEFAULT, "vetted email handles: %@", buf, 0xCu);
          }
          if (v6[2](v6, v21)) {
            objc_msgSend_addObject_(v51, v14, (uint64_t)v21);
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v54, v60, 16);
      }
      while (v16);
    }

    id v5 = v50;
  }
  else
  {
    id v51 = 0;
  }

  return v51;
}

- (id)_findIDSAccountInStore:(id)a3 withCriteria:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sub_1A7BF1AEC();
  uint64_t v10 = objc_msgSend__findAccountOfType_InStore_withCriteria_(self, v9, (uint64_t)v8, v7, v6);

  return v10;
}

- (id)_findGameCenterAccountInStore:(id)a3 withCriteria:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sub_1A7BF1B40();
  uint64_t v10 = objc_msgSend__findAccountOfType_InStore_withCriteria_(self, v9, (uint64_t)v8, v7, v6);

  return v10;
}

- (id)_accountWithUsername:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A7BF2C08;
  v11[3] = &unk_1E5D1B370;
  id v12 = v6;
  id v7 = v6;
  uint64_t v9 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v8, (uint64_t)a4, v11);

  return v9;
}

- (id)_gameCenterAccountWithUsername:(id)a3
{
  id v4 = a3;
  accountStore = self->_accountStore;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A7BF2E90;
  v10[3] = &unk_1E5D1B370;
  id v11 = v4;
  id v6 = v4;
  uint64_t v8 = objc_msgSend__findGameCenterAccountInStore_withCriteria_(self, v7, (uint64_t)accountStore, v10);

  return v8;
}

- (id)gameCenterPropertiesFromAccountWithUsername:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412290;
    uint64_t v31 = v4;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Fetching GS account for username %@", (uint8_t *)&v30, 0xCu);
  }

  uint64_t v9 = objc_msgSend__gameCenterAccountWithUsername_(self, v8, (uint64_t)v4);
  id v12 = v9;
  if (v9)
  {
    uint64_t v13 = objc_msgSend_valueForKey_(v9, v10, @"_properties");
    uint64_t v14 = v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    uint64_t v16 = v15;

    unint64_t v20 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      uint64_t v31 = v16;
      _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "Properties on found account: %@", (uint8_t *)&v30, 0xCu);
    }

    id v21 = objc_alloc(MEMORY[0x1E4F6B468]);
    v23 = objc_msgSend_objectForKey_(v16, v22, *MEMORY[0x1E4F6AC10]);
    uint64_t v25 = objc_msgSend_objectForKey_(v16, v24, *MEMORY[0x1E4F6AC20]);
    uint64_t v27 = objc_msgSend_objectForKey_(v16, v26, *MEMORY[0x1E4F6AC18]);
    UpdatedDate = objc_msgSend_initWithAssociationID_sharingState_lastUpdatedDate_(v21, v28, (uint64_t)v23, v25, v27);
  }
  else
  {
    uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      uint64_t v31 = v4;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Found no GameCenter account for username %@", (uint8_t *)&v30, 0xCu);
    }
    UpdatedDate = 0;
  }

  return UpdatedDate;
}

- (id)_accountWithUsernameAlias:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A7BF32AC;
  v19[3] = &unk_1E5D1B370;
  id v8 = v6;
  id v20 = v8;
  uint64_t v10 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v9, (uint64_t)v7, v19);
  if (!v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1A7BF348C;
    v17[3] = &unk_1E5D1B370;
    id v11 = v8;
    id v18 = v11;
    uint64_t v10 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v12, (uint64_t)v7, v17);
    if (!v10)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1A7BF350C;
      v15[3] = &unk_1E5D1B370;
      id v16 = v11;
      uint64_t v10 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v13, (uint64_t)v7, v15);
    }
  }

  return v10;
}

- (id)_profileIDForUsername:(id)a3 inStore:(id)a4
{
  id v4 = objc_msgSend__accountWithUsername_inStore_(self, a2, (uint64_t)a3, a4);
  id v5 = v4;
  if (v4)
  {
    id v6 = sub_1A7BF221C(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_accountWithProfileID:(id)a3 username:(id)a4 inStore:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v8;
    _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Searching for profileID %@", buf, 0xCu);
  }

  if (!v8) {
    goto LABEL_17;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1A7BF3968;
  v43[3] = &unk_1E5D1B370;
  id v16 = v8;
  uint64_t v44 = v16;
  uint64_t v18 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v17, (uint64_t)v10, v43);
  if (v18)
  {
    id v21 = (void *)v18;
    v22 = v44;
LABEL_20:

    goto LABEL_21;
  }
  v23 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v19, v20);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "Didn't find an authenticated account with a DSID; attempting to fall back to an unauthenticated match that has a password",
      buf,
      2u);
  }

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1A7BF3A04;
  v41[3] = &unk_1E5D1B370;
  uint64_t v24 = v16;
  uint64_t v42 = v24;
  id v21 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v25, (uint64_t)v10, v41);
  if (!v21)
  {
    uint64_t v28 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v26, v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v28, OS_LOG_TYPE_DEFAULT, "Didn't find a DISD match with a password; attempting to fall back to an unauthenticated DISD and username match",
        buf,
        2u);
    }

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1A7BF3AC0;
    v38[3] = &unk_1E5D1B398;
    v29 = v24;
    uint64_t v39 = v29;
    id v40 = v9;
    id v21 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v30, (uint64_t)v10, v38);
    if (!v21)
    {
      v33 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v31, v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v33, OS_LOG_TYPE_DEFAULT, "Didn't find an unauthenticated DISD and username match; attempting to fall back to an unauthenticated DSID match",
          buf,
          2u);
      }

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = sub_1A7BF3B5C;
      v36[3] = &unk_1E5D1B370;
      unint64_t v37 = v29;
      id v21 = objc_msgSend__findIDSAccountInStore_withCriteria_(self, v34, (uint64_t)v10, v36);
    }
  }

  if (!v21)
  {
LABEL_17:
    v22 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "Didn't find a DSID match!", buf, 2u);
    }
    id v21 = 0;
    goto LABEL_20;
  }
LABEL_21:

  return v21;
}

- (id)_accountWithProfileIDMatchingUser:(id)a3 inStore:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend__profileIDForUsername_inStore_(self, v8, (uint64_t)v6, v7);
  uint64_t v13 = objc_msgSend__accountWithProfileID_username_inStore_(self, v10, (uint64_t)v9, v6, v7);
  if (!v13)
  {
    uint64_t v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't match based on any known DSID of %@; attempting to fall back to a username match",
        (uint8_t *)&v24,
        0xCu);
    }

    uint64_t v13 = objc_msgSend__accountWithUsername_inStore_(self, v15, (uint64_t)v6, v7);
    if (!v13)
    {
      uint64_t v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v16, v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        id v25 = v6;
        _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't find a username match for %@; attempting to search aliases of known accounts",
          (uint8_t *)&v24,
          0xCu);
      }

      uint64_t v13 = objc_msgSend__accountWithUsernameAlias_inStore_(self, v19, (uint64_t)v6, v7);
      if (!v13)
      {
        v22 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v20, v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "Didn't find any matching account!", (uint8_t *)&v24, 2u);
        }

        uint64_t v13 = 0;
      }
    }
  }

  return v13;
}

- (id)_accountBasedOnProfileID:(id)a3 orUsername:(id)a4 inStore:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = objc_msgSend__accountWithProfileID_username_inStore_(self, v11, (uint64_t)v8, v9, v10);
  uint64_t v15 = v12;
  if (v12)
  {
    id v16 = v12;
  }
  else
  {
    uint64_t v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Didn't find profileID %@; attempting to use username %@",
        (uint8_t *)&v21,
        0x16u);
    }

    objc_msgSend__accountWithProfileIDMatchingUser_inStore_(self, v18, (uint64_t)v9, v10);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v19 = v16;

  return v19;
}

- (void)updatePreviousUsername:(id)a3 toNewUsername:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Updating username on accounts { previousUsername: %@, newUsername: %@ }", buf, 0x16u);
  }

  id v11 = sub_1A7BF1AEC();
  accountStore = self->_accountStore;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1A7BF409C;
  v17[3] = &unk_1E5D1B410;
  void v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v20 = v11;
  id v13 = v11;
  id v14 = v7;
  id v15 = v6;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v16, (uint64_t)v13, v17);
}

- (BOOL)_shouldForceSilentOnlyAuthForUsername:(id)a3 serviceIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = v7;
  if (v7)
  {
    int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"com.apple.private.alloy.itunes");
    int v12 = 0;
    if (v6 && isEqualToString) {
      int v12 = objc_msgSend__usernameHasCorrespondingIdMSAccount_(self, v8, (uint64_t)v6) ^ 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  id v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"NO";
    int v16 = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    if (v12) {
      id v14 = @"YES";
    }
    id v19 = v10;
    __int16 v20 = 2112;
    int v21 = v14;
    _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Determined if we should force silent-only auth { username: %@, serviceIdentifier: %@, shouldForceSilentAuth: %@ }", (uint8_t *)&v16, 0x20u);
  }

  return v12;
}

- (BOOL)_usernameHasCorrespondingIdMSAccount:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v4;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Checking if username has a corresponding IdMS ACAccount instance { username: %@ }", buf, 0xCu);
  }

  accountStore = self->_accountStore;
  if (qword_1E9739510 != -1) {
    dispatch_once(&qword_1E9739510, &unk_1EFE076E0);
  }
  uint64_t v42 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v8, qword_1E97394E8);
  objc_msgSend_accountsWithAccountType_(self->_accountStore, v10, (uint64_t)v42);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v51, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v11);
        }
        id v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        __int16 v20 = objc_msgSend_username(v19, v14, v15);
        int isEqualToString = objc_msgSend_isEqualToString_(v20, v21, (uint64_t)v4);

        uint64_t v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v23, v24);
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (isEqualToString)
        {
          if (v26)
          {
            unint64_t v37 = objc_msgSend_identifier(v19, v27, v28);
            id v40 = objc_msgSend_username(v19, v38, v39);
            *(_DWORD *)buf = 138412546;
            id v48 = v37;
            __int16 v49 = 2112;
            id v50 = v40;
            _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "IdMS ACAccount instance matches { accountID: %@, accountUsername: %@ }", buf, 0x16u);
          }
          BOOL v36 = 1;
          uint64_t v35 = v11;
          goto LABEL_21;
        }
        if (v26)
        {
          v29 = objc_msgSend_identifier(v19, v27, v28);
          uint64_t v32 = objc_msgSend_username(v19, v30, v31);
          *(_DWORD *)buf = 138412546;
          id v48 = v29;
          __int16 v49 = 2112;
          id v50 = v32;
          _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "IdMS ACAccount instance does not match { accountID: %@, accountUsername: %@ }", buf, 0x16u);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v51, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }

  uint64_t v35 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v33, v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v4;
    _os_log_impl(&dword_1A7BC0000, v35, OS_LOG_TYPE_DEFAULT, "Unable to find a corresponding IdMS ACAccount instance { username: %@ }", buf, 0xCu);
  }
  BOOL v36 = 0;
LABEL_21:

  return v36;
}

- (void)performCleanUpWithCompletion:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Performing clean-up on accounts", buf, 2u);
  }

  id v8 = sub_1A7BF1AEC();
  accountStore = self->_accountStore;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A7BF4B4C;
  v13[3] = &unk_1E5D1B460;
  id v14 = v8;
  id v15 = v4;
  v13[4] = self;
  id v10 = v8;
  id v11 = v4;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v12, (uint64_t)v10, v13);
}

- (void)cleanUpAccountsWithUsername:(id)a3 orProfileID:(id)a4 basedOnInUseUsernames:(id)a5 profileIDs:(id)a6 completionBlock:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v17, v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v37 = v12;
    __int16 v38 = 2112;
    id v39 = v13;
    __int16 v40 = 2112;
    id v41 = v14;
    __int16 v42 = 2112;
    id v43 = v15;
    _os_log_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEFAULT, "Cleaning up accounts {username: %@, profileID: %@, inUseUsernames: %@, inUseProfileIDs: %@ }", buf, 0x2Au);
  }

  __int16 v20 = sub_1A7BF1AEC();
  accountStore = self->_accountStore;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1A7BF5348;
  v29[3] = &unk_1E5D1B4B0;
  v29[4] = self;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v34 = v20;
  id v35 = v16;
  id v33 = v15;
  id v22 = v20;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v13;
  id v27 = v12;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v28, (uint64_t)v22, v29);
}

- (void)cleanUpAccountsBasedOnInUseUsernamesBlock:(id)a3 profileIDBlock:(id)a4 completionBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)MEMORY[0x1AD0D56D0](v8);
    id v15 = (void *)MEMORY[0x1AD0D56D0](v9);
    *(_DWORD *)buf = 138412546;
    v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Begin cleaning up unused accounts { usernameBlock : %@, profileIDBlock : %@ }", buf, 0x16u);
  }
  id v16 = sub_1A7BF1AEC();
  accountStore = self->_accountStore;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1A7BF5D28;
  v23[3] = &unk_1E5D1B500;
  id v25 = v8;
  id v26 = v9;
  id v27 = v10;
  v23[4] = self;
  id v24 = v16;
  id v18 = v16;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  objc_msgSend_accountTypeWithIdentifier_completion_(accountStore, v22, (uint64_t)v18, v23);
}

- (void)fetchPasswordForProfileID:(id)a3 username:(id)a4 service:(id)a5 outRequestID:(id *)a6 completionBlock:(id)a7
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v86 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v88 = _os_activity_create(&dword_1A7BC0000, "Password manager fetch password", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v88, &state);
  uint64_t v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v90 = v86;
    __int16 v91 = 2112;
    id v92 = v12;
    __int16 v93 = 2112;
    id v94 = v13;
    _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Fetching password for profileID: %@ username: %@ service: %@", buf, 0x20u);
  }

  v85 = (void (**)(void, void, void, void, void, void, void, void, void))objc_msgSend_copy(v14, v18, v19);
  id v20 = sub_1A7BF6DB8(v13);

  id v24 = objc_msgSend_stringGUID(NSString, v21, v22);
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    id v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v27 = self->_runningQueries;
    self->_runningQueries = v26;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v23, (uint64_t)v24);
  if (a6) {
    *a6 = v24;
  }
  if (objc_msgSend_isEqualToString_(v20, v28, *MEMORY[0x1E4F6B2E8]))
  {
    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v29, (uint64_t)v86, v12, self->_accountStore);
    uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend__credentialForAccount_(self, v30, (uint64_t)v32);
      v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_1A7BF221C(v32);
      id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_1A7BF6E90(v32, v34, v35);
      BOOL v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend_password(v83, v37, v38);
      sub_1A7BF6F54(v32);
      id v41 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v39, v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v32;
        _os_log_impl(&dword_1A7BC0000, v41, OS_LOG_TYPE_DEFAULT, "  Found account: %@", buf, 0xCu);
      }

      uint64_t v44 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v42, v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v83;
        _os_log_impl(&dword_1A7BC0000, v44, OS_LOG_TYPE_DEFAULT, "  Credential: %@", buf, 0xCu);
      }

      uint64_t v47 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v45, v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        id v50 = objc_msgSend_accountType(v32, v48, v49);
        objc_msgSend_identifier(v50, v51, v52);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v53;
        _os_log_impl(&dword_1A7BC0000, v47, OS_LOG_TYPE_DEFAULT, "         => Type: %@", buf, 0xCu);
      }
      long long v56 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v54, v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_username(v32, v57, v58);
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v59;
        _os_log_impl(&dword_1A7BC0000, v56, OS_LOG_TYPE_DEFAULT, "     => Username: %@", buf, 0xCu);
      }
      uint64_t v62 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v60, v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v65 = objc_msgSend_password(v83, v63, v64);
        v66 = @"YES";
        if (!v65) {
          v66 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v90 = v66;
        _os_log_impl(&dword_1A7BC0000, v62, OS_LOG_TYPE_DEFAULT, "     => Password: %@", buf, 0xCu);
      }
      v69 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v67, v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v72 = objc_msgSend_token(v83, v70, v71);
        sub_1A7BF22E4(v72);
        v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v73;
        _os_log_impl(&dword_1A7BC0000, v69, OS_LOG_TYPE_DEFAULT, "   => Auth Token: %@", buf, 0xCu);
      }
      v76 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v74, v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v33;
        _os_log_impl(&dword_1A7BC0000, v76, OS_LOG_TYPE_DEFAULT, "   => Profile ID: %@", buf, 0xCu);
      }

      v79 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v77, v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v36;
        _os_log_impl(&dword_1A7BC0000, v79, OS_LOG_TYPE_DEFAULT, "      => Self ID: %@", buf, 0xCu);
      }
    }
    else
    {
      v81 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v30, v31);
      v83 = (__CFString *)v81;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v81, OS_LOG_TYPE_DEFAULT, "Did not find an account to use! No password fetched.", buf, 2u);
      }
      id v33 = 0;
      BOOL v36 = 0;
      v84 = 0;
    }
  }
  else
  {
    v84 = objc_msgSend__keychainPasswordForUsername_service_(self, v29, (uint64_t)v12, v20);
    id v33 = 0;
    BOOL v36 = 0;
  }
  if (objc_msgSend_containsObject_(self->_runningQueries, v80, (uint64_t)v24))
  {
    if (v85) {
      ((void (**)(void, void *, id, void *, __CFString *, __CFString *, void *, void, void))v85)[2](v85, v24, v12, v20, v33, v36, v84, 0, 0);
    }
    objc_msgSend_removeObject_(self->_runningQueries, v82, (uint64_t)v24);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)fetchAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 outRequestID:(id *)a6 completionBlock:(id)a7
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v141 = a3;
  id v142 = a4;
  id v12 = a5;
  id v13 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v145 = _os_activity_create(&dword_1A7BC0000, "Password manager fetch auth token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v145, &state);
  uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v147 = v141;
    __int16 v148 = 2112;
    id v149 = v142;
    __int16 v150 = 2112;
    id v151 = v12;
    _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Fetching auth token for profileID: %@ username: %@ service: %@", buf, 0x20u);
  }

  v139 = (void (**)(void, void, void, void, void, void, void, void, void))objc_msgSend_copy(v13, v17, v18);
  v140 = sub_1A7BF6DB8(v12);

  uint64_t v22 = objc_msgSend_stringGUID(NSString, v19, v20);
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    id v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v25 = self->_runningQueries;
    self->_runningQueries = v24;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v21, (uint64_t)v22);
  if (a6) {
    *a6 = v22;
  }
  p_cachedAuthTokenInfo = (void **)&self->_cachedAuthTokenInfo;
  cachedAuthTokenInfo = self->_cachedAuthTokenInfo;
  if (cachedAuthTokenInfo
    && (objc_msgSend_profileID(cachedAuthTokenInfo, v26, v27),
        __int16 v30 = objc_claimAutoreleasedReturnValue(),
        int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v30, v31, (uint64_t)v141),
        v30,
        isEqualToIgnoringCase))
  {
    v138 = objc_msgSend_profileID(*p_cachedAuthTokenInfo, v26, v33);
    BOOL v36 = objc_msgSend_selfID(*p_cachedAuthTokenInfo, v34, v35);
    v137 = objc_msgSend_token(*p_cachedAuthTokenInfo, v37, v38);
    objc_msgSend_alertInfo(*p_cachedAuthTokenInfo, v39, v40);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_status(*p_cachedAuthTokenInfo, v42, v43);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v45, v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = *p_cachedAuthTokenInfo;
      *(_DWORD *)buf = 138412290;
      id v147 = v48;
      _os_log_impl(&dword_1A7BC0000, v47, OS_LOG_TYPE_DEFAULT, "  Found cached account info: %@", buf, 0xCu);
    }

    id v51 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v49, v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v52 = sub_1A7BF22E4(v137);
      *(_DWORD *)buf = 138412290;
      id v147 = v52;
      _os_log_impl(&dword_1A7BC0000, v51, OS_LOG_TYPE_DEFAULT, "   => Auth Token: %@", buf, 0xCu);
    }
    uint64_t v55 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v53, v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v147 = v138;
      _os_log_impl(&dword_1A7BC0000, v55, OS_LOG_TYPE_DEFAULT, "   => Profile ID: %@", buf, 0xCu);
    }

    uint64_t v58 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v56, v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v147 = v36;
      _os_log_impl(&dword_1A7BC0000, v58, OS_LOG_TYPE_DEFAULT, "      => Self ID: %@", buf, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v140, v26, *MEMORY[0x1E4F6B2E8]))
    {
      v137 = objc_msgSend__keychainAuthTokenForUsername_service_(self, v59, (uint64_t)v142, v140);
      v138 = 0;
      BOOL v36 = 0;
      id v41 = 0;
      id v44 = 0;
      goto LABEL_53;
    }
    uint64_t v58 = objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v59, (uint64_t)v141, v142, self->_accountStore);
    if (v58)
    {
      v136 = objc_msgSend__credentialForAccount_(self, v60, (uint64_t)v58);
      v138 = sub_1A7BF221C(v58);
      BOOL v36 = sub_1A7BF6E90(v58, v62, v63);
      v137 = objc_msgSend_token(v136, v64, v65);
      uint64_t v68 = objc_msgSend_accountProperties(v58, v66, v67);
      v135 = objc_msgSend_objectForKey_(v68, v69, *MEMORY[0x1E4F6AC38]);

      if (objc_msgSend_integerValue(v135, v70, v71) == 5100 || objc_msgSend_integerValue(v135, v72, v73) == 5103)
      {
        id v44 = v135;
        v76 = objc_msgSend_accountProperties(v58, v74, v75);
        uint64_t v78 = objc_msgSend_objectForKey_(v76, v77, @"alert");

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v41 = v78;
        }
        else {
          id v41 = 0;
        }
      }
      else
      {
        id v41 = 0;
        id v44 = 0;
      }
      v81 = objc_alloc_init(_FTPasswordManagerCachedAuthTokenInfo);
      objc_msgSend_setProfileID_(v81, v82, (uint64_t)v138);
      objc_msgSend_setSelfID_(v81, v83, (uint64_t)v36);
      objc_msgSend_setToken_(v81, v84, (uint64_t)v137);
      objc_msgSend_setAlertInfo_(v81, v85, (uint64_t)v41);
      objc_msgSend_setStatus_(v81, v86, (uint64_t)v44);
      objc_storeStrong((id *)&self->_cachedAuthTokenInfo, v81);
      sub_1A7BF6F54(v58);
      accountStore = self->_accountStore;
      id v143 = 0;
      objc_msgSend_registerSynchronouslyWithError_(accountStore, v88, (uint64_t)&v143);
      id v134 = v143;
      __int16 v91 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v89, v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v147 = v134;
        _os_log_impl(&dword_1A7BC0000, v91, OS_LOG_TYPE_DEFAULT, "  Monitor error: %@", buf, 0xCu);
      }

      id v94 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v92, v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v147 = v58;
        _os_log_impl(&dword_1A7BC0000, v94, OS_LOG_TYPE_DEFAULT, "  Found account: %@", buf, 0xCu);
      }

      v97 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v95, v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v147 = v136;
        _os_log_impl(&dword_1A7BC0000, v97, OS_LOG_TYPE_DEFAULT, "  Credential: %@", buf, 0xCu);
      }

      v100 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v98, v99);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        v103 = objc_msgSend_accountType(v58, v101, v102);
        v106 = objc_msgSend_identifier(v103, v104, v105);
        *(_DWORD *)buf = 138412290;
        id v147 = v106;
        _os_log_impl(&dword_1A7BC0000, v100, OS_LOG_TYPE_DEFAULT, "         => Type: %@", buf, 0xCu);
      }
      v109 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v107, v108);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        v112 = objc_msgSend_username(v58, v110, v111);
        *(_DWORD *)buf = 138412290;
        id v147 = v112;
        _os_log_impl(&dword_1A7BC0000, v109, OS_LOG_TYPE_DEFAULT, "     => Username: %@", buf, 0xCu);
      }
      v115 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v113, v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        v118 = objc_msgSend_password(v136, v116, v117);
        v119 = @"YES";
        if (!v118) {
          v119 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        id v147 = v119;
        _os_log_impl(&dword_1A7BC0000, v115, OS_LOG_TYPE_DEFAULT, "     => Password: %@", buf, 0xCu);
      }
      v122 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v120, v121);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        v125 = objc_msgSend_token(v136, v123, v124);
        v126 = sub_1A7BF22E4(v125);
        *(_DWORD *)buf = 138412290;
        id v147 = v126;
        _os_log_impl(&dword_1A7BC0000, v122, OS_LOG_TYPE_DEFAULT, "   => Auth Token: %@", buf, 0xCu);
      }
      v129 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v127, v128);
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v147 = v138;
        _os_log_impl(&dword_1A7BC0000, v129, OS_LOG_TYPE_DEFAULT, "   => Profile ID: %@", buf, 0xCu);
      }

      v132 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v130, v131);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v147 = v36;
        _os_log_impl(&dword_1A7BC0000, v132, OS_LOG_TYPE_DEFAULT, "      => Self ID: %@", buf, 0xCu);
      }
    }
    else
    {
      v80 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v60, v61);
      v136 = v80;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v80, OS_LOG_TYPE_DEFAULT, "Did not find an account to use! No auth token fetched.", buf, 2u);
      }
      v137 = 0;
      v138 = 0;
      BOOL v36 = 0;
      id v41 = 0;
      id v44 = 0;
    }
  }
LABEL_53:
  if (objc_msgSend_containsObject_(self->_runningQueries, v79, (uint64_t)v22))
  {
    if (v139) {
      ((void (**)(void, void *, id, void *, void *, void *, void *, id, id))v139)[2](v139, v22, v142, v140, v138, v36, v137, v41, v44);
    }
    objc_msgSend_removeObject_(self->_runningQueries, v133, (uint64_t)v22);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (id)_credentialForAccount:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = 0;
  uint64_t v6 = 0;
  char v7 = 1;
  int v8 = 1;
  do
  {
    char v9 = v7;
    id v10 = v6;

    accountStore = self->_accountStore;
    id v17 = 0;
    uint64_t v6 = objc_msgSend_credentialForAccount_error_(accountStore, v12, (uint64_t)v4, &v17);
    id v5 = v17;

    if (!v5) {
      break;
    }
    uint64_t v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v5;
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 1024;
      int v25 = 2;
      _os_log_error_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_ERROR, "Credential for account: %@  failed with error: %@ {attemptCount: %d, kAttemptLimit: %d}", buf, 0x22u);
    }

    char v7 = 0;
    int v8 = 2;
  }
  while ((v9 & 1) != 0);

  return v6;
}

- (void)requestPasswordForUsername:(id)a3 service:(id)a4 badPassword:(BOOL)a5 showForgotPassword:(BOOL)a6 shouldRememberPassword:(BOOL)a7 outRequestID:(id *)a8 completionBlock:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v46 = _os_activity_create(&dword_1A7BC0000, "Password manager request password", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v46, &state);
  __int16 v20 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v15;
    __int16 v48 = 2112;
    id v49 = v16;
    _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "Requesting password for username: %@  service: %@", buf, 0x16u);
  }

  int v23 = objc_msgSend_copy(v17, v21, v22);
  uint64_t v27 = objc_msgSend_stringGUID(NSString, v24, v25);
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    __int16 v30 = self->_runningQueries;
    self->_runningQueries = v29;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v26, (uint64_t)v27);
  if (a8) {
    *a8 = v27;
  }
  uint64_t v32 = objc_msgSend__loginUserNotificationForService_user_isForBadPassword_showForgetPassword_shouldRememberPassword_(FTPasswordManager, v31, (uint64_t)v16, v15, v12, v11, v10);
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  userNotificationCenter = self->_userNotificationCenter;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1A7BF7F84;
  v39[3] = &unk_1E5D1B528;
  objc_copyWeak(&v44, (id *)buf);
  id v34 = v27;
  id v40 = v34;
  id v35 = v15;
  id v41 = v35;
  id v36 = v16;
  id v42 = v36;
  id v37 = v23;
  id v43 = v37;
  objc_msgSend_addUserNotification_listener_completionHandler_(userNotificationCenter, v38, (uint64_t)v32, 0, v39);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 outRequestID:(id *)a8 completionBlock:(id)a9
{
}

- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 failIfNotSilent:(BOOL)a8 outRequestID:(id *)a9 completionBlock:(id)a10
{
}

- (void)requestAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 badPassword:(BOOL)a6 showForgotPassword:(BOOL)a7 forceRenewal:(BOOL)a8 failIfNotSilent:(BOOL)a9 outRequestID:(id *)a10 completionBlock:(id)a11
{
  BOOL v11 = a8;
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v15 = (__CFString *)a3;
  id v16 = (__CFString *)a4;
  id v17 = a5;
  id v18 = a11;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v127 = _os_activity_create(&dword_1A7BC0000, "Password manager request auth token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v127, &state);
  id v21 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v19, v20);
  BOOL v98 = v11;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = @"NO";
    *(_DWORD *)buf = 138413058;
    v129 = v15;
    if (a9) {
      uint64_t v22 = @"YES";
    }
    __int16 v130 = 2112;
    uint64_t v131 = v16;
    __int16 v132 = 2112;
    id v133 = v17;
    __int16 v134 = 2112;
    v135 = v22;
    _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, "Requesting auth token for profileID: %@ username: %@ service: %@ failIfNotSilent: %@", buf, 0x2Au);
  }

  uint64_t v102 = _UIStringForIDSRegistrationServiceType();
  uint64_t v25 = objc_msgSend_copy(v18, v23, v24);

  id v26 = v17;
  uint64_t v27 = sub_1A7BF6DB8(v26);
  v101 = v26;

  uint64_t v31 = objc_msgSend_stringGUID(NSString, v28, v29);
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    uint64_t v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v34 = self->_runningQueries;
    self->_runningQueries = v33;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v30, (uint64_t)v31);
  if (a10) {
    *a10 = v31;
  }
  accountStore = self->_accountStore;
  id v36 = sub_1A7BF1AEC();
  v100 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v37, (uint64_t)v36);

  objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v38, (uint64_t)v15, v16, self->_accountStore);
  id v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    id v40 = objc_alloc((Class)MEMORY[0x1AD0D4F50](@"ACAccount", @"Accounts"));
    id v39 = (__CFString *)objc_msgSend_initWithAccountType_(v40, v41, (uint64_t)v100);
    id v44 = objc_msgSend__stripFZIDPrefix(v16, v42, v43);
    objc_msgSend_setUsername_(v39, v45, (uint64_t)v44);

    __int16 v48 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v46, v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v129 = v39;
      _os_log_impl(&dword_1A7BC0000, v48, OS_LOG_TYPE_DEFAULT, "No account found, created new account: %@", buf, 0xCu);
    }

    id v51 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v49, v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v51, OS_LOG_TYPE_DEFAULT, "Adding and saving account", buf, 2u);
    }

    uint64_t v52 = self->_accountStore;
    id v125 = 0;
    int v54 = objc_msgSend_saveVerifiedAccount_error_(v52, v53, (uint64_t)v39, &v125);
    uint64_t v55 = (__CFString *)v125;
    uint64_t v58 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v56, v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = @"NO";
      if (v54) {
        v59 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v129 = v59;
      __int16 v130 = 2112;
      uint64_t v131 = v55;
      _os_log_impl(&dword_1A7BC0000, v58, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v55)
    {
      uint64_t v62 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v60, v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF5B8();
      }
    }
  }
  sub_1A7BF6F54(v39);
  if (self->_cachedAuthTokenInfo)
  {
    uint64_t v65 = sub_1A7BF221C(v39);
    uint64_t v68 = objc_msgSend_profileID(self->_cachedAuthTokenInfo, v66, v67);
    int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v65, v69, (uint64_t)v68);
  }
  else
  {
    int isEqualToIgnoringCase = 0;
  }
  uint64_t v71 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v63, v64);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    v72 = @"NO";
    if (isEqualToIgnoringCase) {
      v72 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v129 = v72;
    __int16 v130 = 2112;
    uint64_t v131 = v39;
    _os_log_impl(&dword_1A7BC0000, v71, OS_LOG_TYPE_DEFAULT, "Getting new auth token {shouldClearAccountCache: %@, account: %@}", buf, 0x16u);
  }

  v97 = objc_msgSend__credentialForAccount_(self, v73, (uint64_t)v39);
  v76 = objc_msgSend_password(v97, v74, v75);
  BOOL v79 = objc_msgSend_length(v76, v77, v78) == 0;

  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = sub_1A7BF8B34;
  v122[3] = &unk_1E5D1B550;
  char v124 = isEqualToIgnoringCase;
  v122[4] = self;
  id v96 = v25;
  id v123 = v96;
  v80 = (void *)MEMORY[0x1AD0D56D0](v122);
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = sub_1A7BF8C74;
  v114[3] = &unk_1E5D1B5C8;
  v81 = v15;
  v115 = v81;
  v82 = v39;
  v116 = v82;
  v83 = v16;
  uint64_t v117 = v83;
  id v84 = v27;
  id v118 = v84;
  v119 = self;
  id v85 = v31;
  id v120 = v85;
  id v86 = v80;
  id v121 = v86;
  v87 = (void *)MEMORY[0x1AD0D56D0](v114);
  id v90 = v87;
  if (v79 || v98)
  {
    objc_msgSend__renewCredentialsIfPossibleForAccount_username_inServiceIdentifier_originalInServiceIdentifier_serviceName_failIfNotSilent_renewHandler_shortCircuitCompletionBlock_(self, v88, (uint64_t)v82, v83, v84, v101, v102, a9, v87, v86);
  }
  else
  {
    uint64_t v99 = objc_msgSend_copy(v87, v88, v89);

    uint64_t v93 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v91, v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v129 = v82;
      _os_log_impl(&dword_1A7BC0000, v93, OS_LOG_TYPE_DEFAULT, "Requesting verification for account: %@", buf, 0xCu);
    }

    id v94 = self->_accountStore;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = sub_1A7BF92D4;
    v103[3] = &unk_1E5D1B668;
    v104 = v83;
    id v105 = v84;
    v106 = v82;
    v107 = self;
    id v108 = v85;
    id v111 = v86;
    id v109 = v102;
    id v110 = v101;
    BOOL v113 = a9;
    id v90 = v99;
    id v112 = v90;
    objc_msgSend_verifyCredentialsForAccount_withHandler_(v94, v95, (uint64_t)v106, v103);
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_renewCredentialsIfPossibleForAccount:(id)a3 username:(id)a4 inServiceIdentifier:(id)a5 originalInServiceIdentifier:(id)a6 serviceName:(id)a7 failIfNotSilent:(BOOL)a8 renewHandler:(id)a9 shortCircuitCompletionBlock:(id)a10
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v45 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v21 = objc_msgSend_accountPropertyForKey_(v14, v20, *MEMORY[0x1E4F6AC38]);
  uint64_t v24 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v22, v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_msgSend_accountProperties(v14, v25, v26);
    *(_DWORD *)buf = 138412802;
    id v47 = v14;
    __int16 v48 = 2112;
    id v49 = v21;
    __int16 v50 = 2112;
    id v51 = v27;
    _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, "Checking the current status of the account {foundAccount: %@, status: %@, properties: %@}", buf, 0x20u);
  }
  if (v21 && (objc_msgSend_integerValue(v21, v28, v29) == 5100 || objc_msgSend_integerValue(v21, v28, v29) == 5103))
  {
    __int16 v30 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v28, v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v30, OS_LOG_TYPE_DEFAULT, "Not requesting renewal for a Managed AppleID account", buf, 2u);
    }

    uint64_t v31 = v45;
    if (v19)
    {
      BYTE2(v42) = 0;
      LOWORD(v42) = 256;
      (*((void (**)(id, void, id, id, void, void, void, void, void *, int))v19 + 2))(v19, 0, v45, v15, 0, 0, 0, 0, v21, v42);
    }
  }
  else
  {
    uint64_t v32 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v28, v29);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v14;
      __int16 v48 = 2112;
      id v49 = v17;
      _os_log_impl(&dword_1A7BC0000, v32, OS_LOG_TYPE_DEFAULT, "Requesting renewal for account: %@  service: %@", buf, 0x16u);
    }

    if (a8)
    {
      uint64_t shouldForceSilentOnlyAuthForUsername_serviceIdentifier = 1;
    }
    else
    {
      id v36 = objc_msgSend_username(v14, v33, v34);
      uint64_t shouldForceSilentOnlyAuthForUsername_serviceIdentifier = objc_msgSend__shouldForceSilentOnlyAuthForUsername_serviceIdentifier_(self, v37, (uint64_t)v36, v16);
    }
    uint64_t v38 = objc_msgSend_username(v14, v33, v34);
    id v40 = objc_msgSend__accountOptionsDictForRenewCredentialsForService_username_shouldFailIfNotSilent_(self, v39, (uint64_t)v17, v38, shouldForceSilentOnlyAuthForUsername_serviceIdentifier);

    IDSAuthenticationDelegateUpdateTimeOfLastRequestPost();
    objc_msgSend_renewCredentialsForAccount_options_completion_(self->_accountStore, v41, (uint64_t)v14, v40, v18);

    uint64_t v31 = v45;
  }
}

- (void)setPasswordForProfileID:(id)a3 username:(id)a4 service:(id)a5 password:(id)a6 outRequestID:(id *)a7 completionBlock:(id)a8
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v81 = (__CFString *)a3;
  id v14 = a4;
  id v15 = a5;
  id v82 = a6;
  id v16 = a8;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v85 = _os_activity_create(&dword_1A7BC0000, "Password manager set password", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v85, &state);
  id v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v17, v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v87 = v81;
    __int16 v88 = 2112;
    id v89 = v14;
    __int16 v90 = 2112;
    id v91 = v15;
    _os_log_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEFAULT, "Setting password for profileID: %@ username: %@ service: %@", buf, 0x20u);
  }

  uint64_t v20 = sub_1A7BF6DB8(v15);

  uint64_t v23 = (void (**)(void, void, void, void, void))objc_msgSend_copy(v16, v21, v22);
  uint64_t v27 = objc_msgSend_stringGUID(NSString, v24, v25);
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    uint64_t v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    __int16 v30 = self->_runningQueries;
    self->_runningQueries = v29;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v26, (uint64_t)v27);
  if (a7) {
    *a7 = v27;
  }
  if (objc_msgSend_isEqualToString_(v20, v31, *MEMORY[0x1E4F6B2E8]))
  {
    accountStore = self->_accountStore;
    uint64_t v34 = sub_1A7BF1AEC();
    v80 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v35, (uint64_t)v34);

    objc_msgSend__accountWithUsername_inStore_(self, v36, (uint64_t)v14, self->_accountStore);
    id v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      id v40 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v37, v38);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412290;
      v87 = v39;
      id v41 = "Using account: %@";
    }
    else
    {
      id v42 = objc_alloc((Class)MEMORY[0x1AD0D4F50](@"ACAccount", @"Accounts"));
      id v39 = (__CFString *)objc_msgSend_initWithAccountType_(v42, v43, (uint64_t)v80);
      uint64_t v46 = objc_msgSend__stripFZIDPrefix(v14, v44, v45);
      objc_msgSend_setUsername_(v39, v47, (uint64_t)v46);

      id v40 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v48, v49);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412290;
      v87 = v39;
      id v41 = "No account found, created new account: %@";
    }
    _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
LABEL_16:

    objc_msgSend__credentialForAccount_(self, v50, (uint64_t)v39);
    id v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    sub_1A7BF6F54(v39);
    if (v51)
    {
      objc_msgSend_setPassword_(v51, v52, (uint64_t)v82);
      uint64_t v55 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v53, v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v51;
        long long v56 = "Updated credential: %@";
LABEL_21:
        _os_log_impl(&dword_1A7BC0000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v57 = (void *)MEMORY[0x1AD0D4F50](@"ACAccountCredential", @"Accounts");
      objc_msgSend_credentialWithPassword_(v57, v58, (uint64_t)v82);
      id v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v55 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v59, v60);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v51;
        long long v56 = "Creating credential: %@";
        goto LABEL_21;
      }
    }

    uint64_t v63 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v61, v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
      sub_1A7BFF9A8();
    }

    objc_msgSend_setCredential_(v39, v64, (uint64_t)v51);
    objc_msgSend_setAccountProperty_forKey_(v39, v65, 0, *MEMORY[0x1E4F6AC38]);
    uint64_t v68 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v66, v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v68, OS_LOG_TYPE_DEFAULT, "Saving account", buf, 2u);
    }

    v69 = self->_accountStore;
    id v83 = 0;
    uint64_t v71 = objc_msgSend_saveVerifiedAccount_error_(v69, v70, (uint64_t)v39, &v83);
    id v72 = v83;
    uint64_t v75 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v73, v74);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = @"NO";
      if (v71) {
        v76 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v87 = v76;
      __int16 v88 = 2112;
      id v89 = v72;
      _os_log_impl(&dword_1A7BC0000, v75, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v72)
    {
      BOOL v79 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v77, v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF5B8();
      }
    }
    if (v23) {
      ((void (**)(void, void *, id, void *, uint64_t))v23)[2](v23, v27, v14, v20, v71);
    }
    objc_msgSend_removeObject_(self->_runningQueries, v77, (uint64_t)v27);

    goto LABEL_37;
  }
  objc_msgSend__setKeychainPassword_forUsername_service_(self, v32, (uint64_t)v82, v14, v20);
  if (v23) {
    ((void (**)(void, void *, id, void *, uint64_t))v23)[2](v23, v27, v14, v20, 1);
  }
LABEL_37:

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)setAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 authToken:(id)a6 selfHandle:(id)a7 outRequestID:(id *)a8 completionBlock:(id)a9
{
}

- (BOOL)isAuthTokenReceiptTime:(double)a3 withinGracePeriod:(double)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, v4);
  double v10 = v9;
  double v11 = v9 - a3;
  BOOL v12 = v9 - a3 < a4 && v9 > a3;
  id v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"NO";
    int v16 = 138413314;
    if (v12) {
      id v14 = @"YES";
    }
    id v17 = v14;
    __int16 v18 = 2048;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = a4;
    __int16 v22 = 2048;
    double v23 = v10;
    __int16 v24 = 2048;
    double v25 = v11;
    _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Checked auth token receipt date against grace period {isAuthTokenWithinGracePeriod: %@, authTokenReceiptTime: %f, gracePeriod: %f, now: %f, delta: %f}", (uint8_t *)&v16, 0x34u);
  }

  return v12;
}

- (double)authTokenGracePeriod
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, 0);
  uint64_t v4 = objc_msgSend_objectForKey_(v2, v3, @"ds-session-token-grace-period");

  if (v4)
  {
    objc_msgSend_doubleValue(v4, v5, v6);
    double v8 = v7;
  }
  else
  {
    double v8 = 6.0;
  }

  return v8;
}

- (void)removeAuthTokenAllowingGracePeriodForProfileID:(id)a3 username:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v67 = v6;
    __int16 v68 = 2112;
    id v69 = v7;
    _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Removing auth token using grace period for profileID: %@ username: %@", buf, 0x16u);
  }

  BOOL v12 = objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v11, (uint64_t)v6, v7, self->_accountStore);
  id v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v12;
      _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_DEFAULT, "Using account: %@", buf, 0xCu);
    }

    __int16 v18 = objc_msgSend_accountPropertyForKey_(v12, v17, *MEMORY[0x1E4F6AC58]);
    id v15 = v18;
    if (v18
      && (objc_msgSend_doubleValue(v18, v19, v20),
          double v22 = v21,
          objc_msgSend_authTokenGracePeriod(self, v23, v24),
          (objc_msgSend_isAuthTokenReceiptTime_withinGracePeriod_(self, v25, v26, v22, v27) & 1) != 0))
    {
      uint64_t v28 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v19, v20);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v15;
        _os_log_impl(&dword_1A7BC0000, v28, OS_LOG_TYPE_DEFAULT, "Auth token receipt date falls within grace period -- skipping removal {authTokenReceiptTime: %@}", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v29 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v19, v20);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v15;
        _os_log_impl(&dword_1A7BC0000, v29, OS_LOG_TYPE_DEFAULT, "Auth token receipt date falls outside of grace period -- removing auth token {authTokenReceiptTime: %@}", buf, 0xCu);
      }

      uint64_t v31 = objc_msgSend__credentialForAccount_(self, v30, (uint64_t)v12);
      if (!v31) {
        uint64_t v31 = objc_alloc_init((Class)MEMORY[0x1AD0D4F50](@"ACAccountCredential", @"Accounts"));
      }
      uint64_t v28 = v31;
      objc_msgSend_setToken_(v31, v32, 0);
      if (self->_cachedAuthTokenInfo)
      {
        id v35 = sub_1A7BF221C(v12);
        uint64_t v38 = objc_msgSend_profileID(self->_cachedAuthTokenInfo, v36, v37);
        int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v35, v39, (uint64_t)v38);

        if (isEqualToIgnoringCase)
        {
          cachedAuthTokenInfo = self->_cachedAuthTokenInfo;
          self->_cachedAuthTokenInfo = 0;
        }
      }
      id v42 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v33, v34);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v28;
        _os_log_impl(&dword_1A7BC0000, v42, OS_LOG_TYPE_DEFAULT, "Updating credential %@", buf, 0xCu);
      }

      objc_msgSend_setCredential_(v12, v43, (uint64_t)v28);
      objc_msgSend_setAuthenticated_(v12, v44, 0);
      id v47 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v45, v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v12;
        _os_log_impl(&dword_1A7BC0000, v47, OS_LOG_TYPE_DEFAULT, "Saving account: %@", buf, 0xCu);
      }

      __int16 v50 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v48, v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_isAuthenticated(v12, v51, v52)) {
          v53 = @"YES";
        }
        else {
          v53 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        id v67 = v53;
        _os_log_impl(&dword_1A7BC0000, v50, OS_LOG_TYPE_DEFAULT, "      Authenticated: %@", buf, 0xCu);
      }

      accountStore = self->_accountStore;
      id v65 = 0;
      int v56 = objc_msgSend_saveVerifiedAccount_error_(accountStore, v55, (uint64_t)v12, &v65);
      id v57 = v65;
      uint64_t v60 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v58, v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = @"YES";
        if (!v56) {
          uint64_t v61 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        id v67 = v61;
        __int16 v68 = 2112;
        id v69 = v57;
        _os_log_impl(&dword_1A7BC0000, v60, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
      }

      if (v57)
      {
        uint64_t v64 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v62, v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          sub_1A7BFF5B8();
        }
      }
    }
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_DEFAULT, "No account found for auth token removal -- ignoring request", buf, 2u);
  }
}

- (void)setAuthTokenForProfileID:(id)a3 username:(id)a4 service:(id)a5 authToken:(id)a6 selfHandle:(id)a7 accountStatus:(id)a8 outRequestID:(id *)a9 completionBlock:(id)a10
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  v119 = (__CFString *)a3;
  id v16 = a4;
  id v17 = a5;
  id v118 = a6;
  uint64_t v117 = (__CFString *)a7;
  id v116 = a8;
  id v18 = a10;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v122 = _os_activity_create(&dword_1A7BC0000, "Password manager set auth token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v122, &state);
  double v21 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v19, v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    char v124 = v119;
    __int16 v125 = 2112;
    id v126 = v16;
    __int16 v127 = 2112;
    id v128 = v17;
    __int16 v129 = 2112;
    id v130 = v118;
    _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, "Setting auth token for profileID: %@ username: %@ service: %@  (%@)", buf, 0x2Au);
  }

  double v22 = sub_1A7BF6DB8(v17);

  double v25 = (void (**)(void, void, void, void, void))objc_msgSend_copy(v18, v23, v24);
  uint64_t v29 = objc_msgSend_stringGUID(NSString, v26, v27);
  runningQueries = self->_runningQueries;
  if (!runningQueries)
  {
    uint64_t v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v32 = self->_runningQueries;
    self->_runningQueries = v31;

    runningQueries = self->_runningQueries;
  }
  objc_msgSend_addObject_(runningQueries, v28, (uint64_t)v29);
  if (a9) {
    *a9 = v29;
  }
  if (objc_msgSend_isEqualToString_(v22, v33, *MEMORY[0x1E4F6B2E8]))
  {
    accountStore = self->_accountStore;
    id v36 = sub_1A7BF1AEC();
    v115 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v37, (uint64_t)v36);

    objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v38, (uint64_t)v119, v16, self->_accountStore);
    id v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      id v42 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v39, v40);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v124 = v41;
        uint64_t v43 = "Using account: %@";
LABEL_15:
        _os_log_impl(&dword_1A7BC0000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
      }
    }
    else
    {
      id v44 = objc_alloc((Class)MEMORY[0x1AD0D4F50](@"ACAccount", @"Accounts"));
      id v41 = (__CFString *)objc_msgSend_initWithAccountType_(v44, v45, (uint64_t)v115);
      __int16 v48 = objc_msgSend__stripFZIDPrefix(v16, v46, v47);
      objc_msgSend_setUsername_(v41, v49, (uint64_t)v48);

      id v42 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v50, v51);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v124 = v41;
        uint64_t v43 = "No account found, created new account: %@";
        goto LABEL_15;
      }
    }

    sub_1A7BF6F54(v41);
    objc_msgSend__credentialForAccount_(self, v52, (uint64_t)v41);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = v53;
    if (v53)
    {
      objc_msgSend_setToken_(v53, v54, (uint64_t)v118);
    }
    else
    {
      uint64_t v55 = (__CFString *)objc_alloc_init((Class)MEMORY[0x1AD0D4F50](@"ACAccountCredential", @"Accounts"));
      objc_msgSend_setToken_(v55, v57, (uint64_t)v118);
    }
    objc_msgSend__updateStatus_onAccount_(self, v56, (uint64_t)v116, v41);
    if (self->_cachedAuthTokenInfo)
    {
      uint64_t v60 = sub_1A7BF221C(v41);
      uint64_t v63 = objc_msgSend_profileID(self->_cachedAuthTokenInfo, v61, v62);
      int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v60, v64, (uint64_t)v63);

      if (isEqualToIgnoringCase)
      {
        cachedAuthTokenInfo = self->_cachedAuthTokenInfo;
        self->_cachedAuthTokenInfo = 0;
      }
    }
    id v67 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v58, v59);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v124 = v55;
      _os_log_impl(&dword_1A7BC0000, v67, OS_LOG_TYPE_DEFAULT, "Updating credential %@", buf, 0xCu);
    }

    uint64_t v70 = objc_msgSend_length(v118, v68, v69);
    objc_msgSend_setCredential_(v41, v71, (uint64_t)v55);
    objc_msgSend_setAuthenticated_(v41, v72, v70 != 0);
    if (v70)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v73, v74);
      v76 = v75;
      BOOL v79 = objc_msgSend_numberWithDouble_(NSNumber, v77, v78);
      objc_msgSend_setAccountProperty_forKey_(v41, v80, (uint64_t)v79, *MEMORY[0x1E4F6AC58]);

      id v83 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v81, v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        char v124 = v76;
        _os_log_impl(&dword_1A7BC0000, v83, OS_LOG_TYPE_DEFAULT, "Updated auth token receipt time {receiptTime: %f}", buf, 0xCu);
      }
    }
    if (objc_msgSend_length(v119, v73, v74))
    {
      id v86 = sub_1A7BF221C(v41);
      if ((objc_msgSend_isEqualToIgnoringCase_(v86, v87, (uint64_t)v119) & 1) == 0)
      {
        __int16 v90 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v88, v89);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          char v124 = v119;
          _os_log_impl(&dword_1A7BC0000, v90, OS_LOG_TYPE_DEFAULT, "Setting profile ID on account: %@", buf, 0xCu);
        }

        objc_msgSend_setAccountProperty_forKey_(v41, v91, (uint64_t)v119, @"profile-id");
      }
    }
    if (objc_msgSend_length(v117, v84, v85))
    {
      id v94 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v92, v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v124 = v117;
        _os_log_impl(&dword_1A7BC0000, v94, OS_LOG_TYPE_DEFAULT, "Setting self handle on account: %@", buf, 0xCu);
      }

      objc_msgSend_setAccountProperty_forKey_(v41, v95, (uint64_t)v117, @"self-handle");
    }
    id v96 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v92, v93);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v124 = v41;
      _os_log_impl(&dword_1A7BC0000, v96, OS_LOG_TYPE_DEFAULT, "Saving account: %@", buf, 0xCu);
    }

    uint64_t v99 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v97, v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      int isAuthenticated = objc_msgSend_isAuthenticated(v41, v100, v101);
      v103 = @"NO";
      if (isAuthenticated) {
        v103 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      char v124 = v103;
      _os_log_impl(&dword_1A7BC0000, v99, OS_LOG_TYPE_DEFAULT, "      Authenticated: %@", buf, 0xCu);
    }

    v104 = self->_accountStore;
    id v120 = 0;
    uint64_t v106 = objc_msgSend_saveVerifiedAccount_error_(v104, v105, (uint64_t)v41, &v120);
    id v107 = v120;
    id v110 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v108, v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      id v111 = @"NO";
      if (v106) {
        id v111 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      char v124 = v111;
      __int16 v125 = 2112;
      id v126 = v107;
      _os_log_impl(&dword_1A7BC0000, v110, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v107)
    {
      uint64_t v114 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v112, v113);
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF5B8();
      }
    }
    if (v25) {
      ((void (**)(void, void *, id, void *, uint64_t))v25)[2](v25, v29, v16, v22, v106);
    }
    objc_msgSend_removeObject_(self->_runningQueries, v112, (uint64_t)v29);

    goto LABEL_55;
  }
  objc_msgSend__setKeychainAuthToken_forUsername_service_(self, v34, (uint64_t)v118, v16, v22);
  if (v25) {
    ((void (**)(void, void *, id, void *, uint64_t))v25)[2](v25, v29, v16, v22, 1);
  }
LABEL_55:

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_updateStatus:(id)a3 onAccount:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    uint64_t v7 = objc_msgSend_integerValue(v10, (const char *)v10, v5);
    if (v7 == 5103 || v7 == 5100)
    {
      objc_msgSend_setAccountProperty_forKey_(v6, v8, (uint64_t)v10, *MEMORY[0x1E4F6AC38]);
    }
    else if (!v7)
    {
      objc_msgSend_setAccountProperty_forKey_(v6, v8, 0, *MEMORY[0x1E4F6AC38]);
      objc_msgSend_setAccountProperty_forKey_(v6, v9, 0, *MEMORY[0x1E4F6AC28]);
    }
  }
}

- (void)setAccountStatus:(id)a3 forProfileID:(id)a4 username:(id)a5 service:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  id v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v52 = v11;
    __int16 v53 = 2112;
    id v54 = v12;
    __int16 v55 = 2112;
    id v56 = v13;
    __int16 v57 = 2112;
    id v58 = v10;
    _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Setting account status {profileID: %@, username: %@, service: %@, accountStatus: %@}", buf, 0x2Au);
  }

  id v17 = sub_1A7BF6DB8(v13);

  if (objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E4F6B2E8]))
  {
    accountStore = self->_accountStore;
    uint64_t v20 = sub_1A7BF1AEC();
    double v22 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v21, (uint64_t)v20);

    uint64_t v24 = objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v23, (uint64_t)v11, v12, self->_accountStore);
    if (v24)
    {
      uint64_t v27 = (__CFString *)v24;
      uint64_t v28 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v25, v26);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v27;
        uint64_t v29 = "Using account: %@";
LABEL_9:
        _os_log_impl(&dword_1A7BC0000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      }
    }
    else
    {
      id v30 = objc_alloc((Class)MEMORY[0x1AD0D4F50](@"ACAccount", @"Accounts"));
      uint64_t v27 = (__CFString *)objc_msgSend_initWithAccountType_(v30, v31, (uint64_t)v22);
      uint64_t v34 = objc_msgSend__stripFZIDPrefix(v12, v32, v33);
      objc_msgSend_setUsername_(v27, v35, (uint64_t)v34);

      uint64_t v28 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v36, v37);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v27;
        uint64_t v29 = "No account found, created new account: %@";
        goto LABEL_9;
      }
    }

    sub_1A7BF6F54(v27);
    objc_msgSend__updateStatus_onAccount_(self, v38, (uint64_t)v10, v27);
    id v39 = self->_accountStore;
    id v50 = 0;
    int v41 = objc_msgSend_saveVerifiedAccount_error_(v39, v40, (uint64_t)v27, &v50);
    id v42 = v50;
    uint64_t v45 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v43, v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = @"NO";
      if (v41) {
        uint64_t v46 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v52 = v46;
      __int16 v53 = 2112;
      id v54 = v42;
      _os_log_impl(&dword_1A7BC0000, v45, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v42)
    {
      uint64_t v49 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v47, v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
        sub_1A7BFFA10();
      }
    }
  }
}

- (void)setHandlesForProfileID:(id)a3 username:(id)a4 service:(id)a5 handles:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v52 = v10;
    __int16 v53 = 2112;
    id v54 = v11;
    __int16 v55 = 2112;
    id v56 = v12;
    __int16 v57 = 2112;
    id v58 = v13;
    _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Setting handles dictionary for profileID: %@ username: %@ service: %@  (%@)", buf, 0x2Au);
  }

  id v17 = sub_1A7BF6DB8(v12);

  if (objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E4F6B2E8]))
  {
    accountStore = self->_accountStore;
    uint64_t v20 = sub_1A7BF1AEC();
    double v22 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(accountStore, v21, (uint64_t)v20);

    uint64_t v24 = objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v23, (uint64_t)v10, v11, self->_accountStore);
    if (v24)
    {
      uint64_t v27 = (__CFString *)v24;
      uint64_t v28 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v25, v26);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v27;
        uint64_t v29 = "Using account: %@";
LABEL_9:
        _os_log_impl(&dword_1A7BC0000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      }
    }
    else
    {
      id v30 = objc_alloc((Class)MEMORY[0x1AD0D4F50](@"ACAccount", @"Accounts"));
      uint64_t v27 = (__CFString *)objc_msgSend_initWithAccountType_(v30, v31, (uint64_t)v22);
      uint64_t v34 = objc_msgSend__stripFZIDPrefix(v11, v32, v33);
      objc_msgSend_setUsername_(v27, v35, (uint64_t)v34);

      uint64_t v28 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v36, v37);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v27;
        uint64_t v29 = "No account found, created new account: %@";
        goto LABEL_9;
      }
    }

    sub_1A7BF6F54(v27);
    objc_msgSend_setAccountProperty_forKey_(v27, v38, (uint64_t)v13, @"handles");
    id v39 = self->_accountStore;
    id v50 = 0;
    int v41 = objc_msgSend_saveVerifiedAccount_error_(v39, v40, (uint64_t)v27, &v50);
    id v42 = v50;
    uint64_t v45 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v43, v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = @"NO";
      if (v41) {
        uint64_t v46 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v52 = v46;
      __int16 v53 = 2112;
      id v54 = v42;
      _os_log_impl(&dword_1A7BC0000, v45, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", buf, 0x16u);
    }

    if (v42)
    {
      uint64_t v49 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v47, v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF5B8();
      }
    }
  }
}

- (id)_accountOptionsDictForRenewCredentialsForService:(id)a3 username:(id)a4 shouldFailIfNotSilent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  id v12 = objc_msgSend_bundleForClass_(v8, v11, v10);
  if (objc_msgSend_isEqualToString_(v7, v13, @"iMessage"))
  {
    id v17 = (id)*MEMORY[0x1E4F6C830];
    id v18 = @"iMessage";
    uint64_t v19 = 4;
    goto LABEL_11;
  }
  if ((objc_msgSend_isEqualToIgnoringCase_(v7, v14, @"FaceTime") & 1) != 0
    || objc_msgSend_isEqualToIgnoringCase_(v7, v20, @"Calling"))
  {
    id v17 = (id)*MEMORY[0x1E4F6C440];
    id v18 = @"FaceTime";
    uint64_t v19 = 5;
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(v7, v21, @"iTunes"))
  {
    uint64_t v19 = 2;
  }
  else
  {
    id v18 = @"iCloud";
    uint64_t v19 = 1;
    if (objc_msgSend_isEqualToString_(v7, v15, @"iCloud"))
    {
      id v17 = 0;
      goto LABEL_11;
    }
  }
  id v17 = 0;
  id v18 = @"account services";
LABEL_11:
  double v22 = (void *)MEMORY[0x1E4F6C320];
  double v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v15, v16);
  uint64_t v26 = objc_msgSend_model(v23, v24, v25);
  uint64_t v28 = objc_msgSend_marketingNameForModel_(v22, v27, (uint64_t)v26);

  id v30 = objc_msgSend_stringWithFormat_(NSString, v29, @"Enter the password for your Apple Account to continue using %@ on this %@:\n%%@", v18, v28);
  uint64_t v31 = IMLocalizedStringFromTableInBundle();
  uint64_t v33 = objc_msgSend_stringWithFormat_(NSString, v32, (uint64_t)v31, v9);

  uint64_t v34 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (qword_1E97394E0 != -1) {
    dispatch_once(&qword_1E97394E0, &unk_1EFE07700);
  }
  CFDictionarySetValue(v34, (const void *)qword_1E9739508, MEMORY[0x1E4F1CC38]);
  id v35 = v33;
  if (v35)
  {
    if (qword_1E9739528 != -1) {
      dispatch_once(&qword_1E9739528, &unk_1EFE07720);
    }
    CFDictionarySetValue(v34, (const void *)qword_1E9739500, v35);
  }

  uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v36, v19);
  if (v37)
  {
    if (qword_1E9739518 != -1) {
      dispatch_once(&qword_1E9739518, &unk_1EFE07740);
    }
    CFDictionarySetValue(v34, (const void *)qword_1E97394F0, v37);
  }

  id v38 = v17;
  if (v38)
  {
    if (qword_1E9739520 != -1) {
      dispatch_once(&qword_1E9739520, &unk_1EFE07760);
    }
    CFDictionarySetValue(v34, (const void *)qword_1E97394F8, v38);
  }

  if (v5)
  {
    if (qword_1E97395B0 != -1) {
      dispatch_once(&qword_1E97395B0, &unk_1EFE07780);
    }
    id v39 = (__CFString *)qword_1E97395B8;
  }
  else
  {
    id v39 = @"AARenewShouldPostFollowUp";
  }
  CFDictionarySetValue(v34, v39, MEMORY[0x1E4F1CC38]);
  id v42 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v40, v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = v34;
    _os_log_impl(&dword_1A7BC0000, v42, OS_LOG_TYPE_DEFAULT, "Verification Options Dictionary Contains: %@", buf, 0xCu);
  }

  return v34;
}

- (void)cancelRequestID:(id)a3 serviceIdentifier:(id)a4
{
  id v14 = a3;
  id v8 = a4;
  if (!v14
    || (objc_msgSend_removeObject_(self->_runningQueries, v6, (uint64_t)v14),
        objc_msgSend_count(self->_runningQueries, v9, v10)))
  {
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  runningQueries = self->_runningQueries;
  self->_runningQueries = 0;

  if (v8)
  {
LABEL_4:
    id v11 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C418], v6, v7);
    objc_msgSend_removeNotificationsForServiceIdentifier_(v11, v12, (uint64_t)v8);
  }
LABEL_5:
}

+ (id)_loginUserNotificationForService:(id)a3 user:(id)a4 isForBadPassword:(BOOL)a5 showForgetPassword:(BOOL)a6 shouldRememberPassword:(BOOL)a7
{
  BOOL v7 = a5;
  id v9 = a3;
  id v67 = a4;
  if (objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x1E4F6B2E8]))
  {
    id v13 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
    uint64_t v17 = IMLocalizedStringFromTableInBundle();

    id v9 = (id)v17;
  }
  id v18 = objc_msgSend_stringByRemovingWhitespace(v67, v11, v12);
  uint64_t v21 = objc_msgSend_length(v18, v19, v20);

  if (qword_1E97395C0 != -1) {
    dispatch_once(&qword_1E97395C0, &unk_1EFE077A0);
  }
  id v22 = (id)qword_1E97395C8;
  if (v21)
  {
    double v23 = IMLocalizedStringFromTableInBundle();
    uint64_t v24 = IMLocalizedStringFromTableInBundle();
    uint64_t v25 = IMLocalizedStringFromTableInBundle();
    uint64_t v26 = IMLocalizedStringFromTableInBundle();

    uint64_t v29 = objc_msgSend_stringWithFormat_(NSString, v27, (uint64_t)v23, v9);
    id v30 = v67;
    if (!v67) {
      id v30 = v9;
    }
    uint64_t v31 = objc_msgSend_stringWithFormat_(NSString, v28, @"%@", v30);
    uint64_t v33 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v32, (uint64_t)&stru_1EFE07F40, 0);
    uint64_t v34 = (void *)v24;
    id v36 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v35, v24, 0);
    uint64_t v58 = v26;
    v66 = (void *)v25;
    uint64_t v57 = v25;
    uint64_t v37 = (void *)v26;
    id v38 = (void *)v31;
    id v65 = (void *)v29;
    uint64_t v40 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1CA60], v39, v29, *MEMORY[0x1E4F6C308], v31, *MEMORY[0x1E4F6C2E8], v33, *MEMORY[0x1E4F6C300], v36, *MEMORY[0x1E4F6C2F8], v57, *MEMORY[0x1E4F6C2D8], v58, *MEMORY[0x1E4F6C2C8], 0, *MEMORY[0x1E4F6C2E0], 0, 0);
    uint64_t v41 = 0x10000;
  }
  else
  {
    uint64_t v61 = IMLocalizedStringFromTableInBundle();
    uint64_t v42 = IMLocalizedStringFromTableInBundle();
    uint64_t v59 = (void *)v42;
    v66 = IMLocalizedStringFromTableInBundle();
    uint64_t v64 = IMLocalizedStringFromTableInBundle();
    id v65 = IMLocalizedStringFromTableInBundle();
    uint64_t v63 = IMLocalizedStringFromTableInBundle();
    uint64_t v33 = IMLocalizedStringFromTableInBundle();
    id v36 = IMLocalizedStringFromTableInBundle();
    uint64_t v43 = IMLocalizedStringFromTableInBundle();
    uint64_t v62 = (void *)v43;

    uint64_t v60 = objc_msgSend_stringWithFormat_(NSString, v44, v61, v9);
    if (v7) {
      objc_msgSend_stringWithFormat_(NSString, v45, (uint64_t)v36, v9);
    }
    else {
    uint64_t v46 = objc_msgSend_stringWithFormat_(NSString, v45, v43, v9);
    }
    uint64_t v48 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v47, (uint64_t)v67, &stru_1EFE07F40, 0);
    id v50 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v49, v42, v66, 0);
    uint64_t v52 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v51, (uint64_t)v33, 0);
    id v38 = (void *)v63;
    uint64_t v37 = (void *)v64;
    objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1CA60], v53, (uint64_t)v60, *MEMORY[0x1E4F6C308], v46, *MEMORY[0x1E4F6C2E8], v48, *MEMORY[0x1E4F6C300], v50, *MEMORY[0x1E4F6C2F8], v52, *MEMORY[0x1E4F6C2D0], v64, *MEMORY[0x1E4F6C2D8], v63, *MEMORY[0x1E4F6C2C8], 0, *MEMORY[0x1E4F6C2F0], 0,
      *MEMORY[0x1E4F6C2E0],
      0,
    uint64_t v40 = 0);

    uint64_t v34 = v59;
    double v23 = (void *)v61;

    uint64_t v41 = 0x20000;
  }

  __int16 v55 = objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_(MEMORY[0x1E4F6C410], v54, @"__ksPasswordPromptUserNotificationIdentifier", 3, v41, v40, 0.0);

  return v55;
}

- (id)acAccountWithProfileID:(id)a3 username:(id)a4 accountStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_length(v8, v11, v12);
  if (v10 && v13)
  {
    uint64_t v16 = objc_msgSend__accountBasedOnProfileID_orUsername_inStore_(self, v14, (uint64_t)v8, v9, v10);
  }
  else
  {
    uint64_t v17 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v14, v15);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFFA88(v17);
    }

    uint64_t v16 = 0;
  }

  return v16;
}

- (id)profileIDForACAccount:(id)a3
{
  if (a3)
  {
    v3 = sub_1A7BF221C(a3);
    id v6 = objc_msgSend__stripFZIDPrefix(v3, v4, v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = im_primary_queue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A7BFCA68;
  v7[3] = &unk_1E5D1AEC0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)accountCredentialChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = im_primary_queue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A7BFCBAC;
  v7[3] = &unk_1E5D1AEC0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAuthTokenInfo, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_runningQueries, 0);
}

@end