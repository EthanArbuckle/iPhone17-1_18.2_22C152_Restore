@interface ACAccountStore(AppleMediaServices)
+ (id)_multiUserTokenForIdentifier:()AppleMediaServices;
+ (id)ams_accountTypeIdentifierForMediaType:()AppleMediaServices;
+ (id)ams_sharedAccountStoreForClient:()AppleMediaServices;
+ (id)ams_sharedAccountStoreForMediaType:()AppleMediaServices;
+ (uint64_t)_isAccountsCachingEnabled;
+ (uint64_t)ams_sharedAccountStore;
- (AMSBinaryPromise)ams_setiTunesAccount:()AppleMediaServices forHomeWithIdentifier:;
- (AMSMutableBinaryPromise)_saveAccount:()AppleMediaServices verifyCredentials:;
- (AMSMutablePromise)_iTunesAccountsForAccountType:()AppleMediaServices;
- (AMSMutablePromise)ams_fetchActiveiCloudAccount;
- (AMSPromise)ams_mediaAccountForHomeWithIdentifier:()AppleMediaServices;
- (id)_accountTypeForMediaType:()AppleMediaServices;
- (id)_addGlobalCookiesForResponse:()AppleMediaServices;
- (id)_addUserCookiesForResponse:()AppleMediaServices account:;
- (id)_correspondingAccountWithAccountTypeIdentifier:()AppleMediaServices forAccount:;
- (id)_createLocaliTunesAccountForAccountType:()AppleMediaServices;
- (id)_fetchLocalAccountForAccountType:()AppleMediaServices error:;
- (id)_fetchLocaliTunesAccountForAccountType:()AppleMediaServices shouldUpdateStorefront:;
- (id)_updateStorefrontInLocalAccount:()AppleMediaServices;
- (id)ams_accountWithAltDSID:()AppleMediaServices DSID:username:accountTypeIdentifier:;
- (id)ams_activeiTunesAccount;
- (id)ams_activeiTunesAccountForMediaType:()AppleMediaServices;
- (id)ams_addCookiesForResponse:()AppleMediaServices account:;
- (id)ams_addCookiesForResult:()AppleMediaServices account:;
- (id)ams_cookiesForURL:()AppleMediaServices;
- (id)ams_cookiesForURL:()AppleMediaServices bag:;
- (id)ams_fetchGrandSlamTokenForAccount:()AppleMediaServices withIdentifier:;
- (id)ams_fetchGrandSlamTokenForAccount:()AppleMediaServices withIdentifier:error:;
- (id)ams_fetchLocaliTunesAccount;
- (id)ams_iTunesAccountForAccount:()AppleMediaServices forMediaType:createIfNeeded:;
- (id)ams_iTunesAccountForHomeWithIdentifier:()AppleMediaServices error:;
- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices;
- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices DSID:username:;
- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices DSID:username:forMediaType:;
- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices forMediaType:;
- (id)ams_iTunesAccountWithDSID:()AppleMediaServices;
- (id)ams_iTunesAccountWithDSID:()AppleMediaServices forMediaType:;
- (id)ams_iTunesAccountWithHomeUserID:()AppleMediaServices;
- (id)ams_iTunesAccountWithUsername:()AppleMediaServices;
- (id)ams_iTunesAccountWithUsername:()AppleMediaServices forMediaType:;
- (id)ams_iTunesAccounts;
- (id)ams_iTunesAccountsForMediaType:()AppleMediaServices;
- (id)ams_iTunesAccountsForMediaTypes:()AppleMediaServices;
- (id)ams_iTunesSandboxAccounts;
- (id)ams_localiTunesAccount;
- (id)ams_mediaType;
- (uint64_t)_createLocaliTunesAccountForAccountType:()AppleMediaServices error:;
- (uint64_t)_saveVerifiedAccount:()AppleMediaServices error:;
- (uint64_t)ams_IDMSAccountForAccount:()AppleMediaServices;
- (uint64_t)ams_IDSAccountForAccount:()AppleMediaServices;
- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices account:error:;
- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices request:account:error:;
- (uint64_t)ams_addCookiesForResult:()AppleMediaServices account:error:;
- (uint64_t)ams_fetchiTunesAccounts;
- (uint64_t)ams_fetchiTunesSandboxAccounts;
- (uint64_t)ams_iCloudAccountForAccount:()AppleMediaServices;
- (uint64_t)ams_iTunesAccountForAccount:()AppleMediaServices;
- (uint64_t)ams_iTunesAccountForHomeWithIdentifier:()AppleMediaServices;
- (uint64_t)ams_iTunesAccountWithHomeUserIdentifier:()AppleMediaServices;
- (uint64_t)ams_iTunesAccountsWithHomeUserIdentifiers;
- (uint64_t)ams_localiTunesAccountForAccountMediaType:()AppleMediaServices;
- (uint64_t)ams_localiTunesAccountForAccountType:()AppleMediaServices;
- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices error:;
- (uint64_t)ams_saveAccount:()AppleMediaServices;
- (uint64_t)ams_saveAccount:()AppleMediaServices verifyCredentials:;
- (uint64_t)ams_saveVerifiedAccount:()AppleMediaServices error:;
- (void)_newLocalAccountWithAccountType:()AppleMediaServices;
- (void)ams_isActiveAccountCombined;
@end

@implementation ACAccountStore(AppleMediaServices)

- (id)_fetchLocaliTunesAccountForAccountType:()AppleMediaServices shouldUpdateStorefront:
{
  v6 = AMSiTunesAccountsForAccountType(a1, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__ACAccountStore_AppleMediaServices___fetchLocaliTunesAccountForAccountType_shouldUpdateStorefront___block_invoke;
  v9[3] = &unk_1E559E720;
  char v10 = a4;
  v9[4] = a1;
  v7 = [v6 thenWithBlock:v9];

  return v7;
}

+ (id)ams_sharedAccountStoreForMediaType:()AppleMediaServices
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[AMSProcessInfo defaultMediaTypeForCurrentProcess];
  }
  if (([v4 isEqualToString:AMSAccountMediaTypeAppStoreBeta] & 1) != 0
    || ([v4 isEqualToString:AMSAccountMediaTypeAppStoreSandbox] & 1) != 0)
  {
    if (v4)
    {
      v5 = +[AMSAccountStoreCache accountStoreForMediaType:v4];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v5 = objc_msgSend(a1, "_ams_defaultAccountStore");
LABEL_9:
  return v5;
}

+ (uint64_t)ams_sharedAccountStore
{
  return objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:", 0);
}

- (uint64_t)ams_IDMSAccountForAccount:()AppleMediaServices
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F177E0] forAccount:a3];
}

- (id)_correspondingAccountWithAccountTypeIdentifier:()AppleMediaServices forAccount:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 accountType];
  v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:v6];

  if (v10)
  {
    id v11 = v7;
  }
  else
  {
    v12 = objc_msgSend(v7, "ams_altDSID");
    v13 = objc_msgSend(v7, "ams_DSID");
    v14 = [v7 username];
    objc_msgSend(a1, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v12, v13, v14, v6);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v15 = +[AMSLogConfig sharedAccountsConfig];
      if (!v15)
      {
        v15 = +[AMSLogConfig sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = objc_opt_class();
        v18 = [v7 hashedDescription];
        int v20 = 138543874;
        uint64_t v21 = v17;
        __int16 v22 = 2114;
        id v23 = v6;
        __int16 v24 = 2114;
        v25 = v18;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find a corresponding account. accountTypeIdentifier = %{public}@ | account = %{public}@", (uint8_t *)&v20, 0x20u);
      }
      id v11 = 0;
    }
  }

  return v11;
}

- (id)ams_fetchLocaliTunesAccount
{
  v2 = objc_msgSend(a1, "ams_mediaType");
  v3 = objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:", v2);

  return v3;
}

- (uint64_t)ams_localiTunesAccountForAccountMediaType:()AppleMediaServices
{
  return objc_msgSend(a1, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", a3, 0);
}

- (id)ams_accountWithAltDSID:()AppleMediaServices DSID:username:accountTypeIdentifier:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v26 = 0;
  v13 = objc_msgSend(a1, "_ams_accountsWithAccountTypeIdentifier:options:error:", a6, 1, &v26);
  id v14 = v26;
  if (v13)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __97__ACAccountStore_AppleMediaServices__ams_accountWithAltDSID_DSID_username_accountTypeIdentifier___block_invoke;
    v22[3] = &unk_1E559E4D8;
    id v23 = v10;
    id v24 = v11;
    id v25 = v12;
    v15 = objc_msgSend(v13, "ams_firstObjectPassingTest:", v22);

    v16 = v23;
  }
  else
  {
    v16 = +[AMSLogConfig sharedAccountsConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      v19 = AMSLogKey();
      int v20 = AMSLogableError(v14);
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      v30 = v19;
      __int16 v31 = 2114;
      id v32 = v11;
      __int16 v33 = 2114;
      v34 = v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch account with DSID %{public}@: %{public}@", buf, 0x2Au);
    }
    v15 = 0;
  }

  return v15;
}

- (id)_accountTypeForMediaType:()AppleMediaServices
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "ams_accountTypeIdentifierForMediaType:", v4);

  id v6 = objc_msgSend(a1, "_ams_fetchAccountTypeWithAccountTypeIdenfitier:", v5);

  return v6;
}

- (id)ams_activeiTunesAccount
{
  v2 = objc_msgSend(a1, "ams_mediaType");
  if ([v2 isEqualToString:AMSAccountMediaTypeAppStoreBeta])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

    v5 = objc_msgSend(v4, "ams_altDSID");
    id v6 = objc_msgSend(v4, "ams_DSID");
    id v7 = [v4 username];
    v8 = objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:", v5, v6, v7);
  }
  else
  {
    v9 = objc_msgSend(a1, "ams_iTunesAccounts");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__ACAccountStore_AppleMediaServices__ams_activeiTunesAccount__block_invoke;
    v11[3] = &unk_1E559E490;
    id v12 = v2;
    v8 = objc_msgSend(v9, "ams_firstObjectPassingTest:", v11);
  }
  return v8;
}

- (id)ams_iTunesAccounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v3 = objc_msgSend(a1, "ams_mediaType");
  id v4 = objc_msgSend(v2, "ams_accountTypeIdentifierForMediaType:", v3);

  id v15 = 0;
  v5 = objc_msgSend(a1, "_ams_accountsWithAccountTypeIdentifier:options:error:", v4, 1, &v15);
  id v6 = v15;
  id v7 = v5;
  if (!v5)
  {
    v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch the iTunes accounts. error = %{public}@", buf, 0x16u);
    }
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = v7;

  return v13;
}

- (id)ams_mediaType
{
  return +[AMSAccountStoreCache mediaTypeForAccountStore:a1];
}

+ (id)ams_accountTypeIdentifierForMediaType:()AppleMediaServices
{
  return AMSAccountTypeIdentifierForMediaType(a3);
}

- (id)_updateStorefrontInLocalAccount:()AppleMediaServices
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "ams_isLocalAccount"))
  {
    v5 = objc_msgSend(a1, "ams_mediaType");
    if (v5)
    {
      id v6 = objc_msgSend(a1, "ams_activeiTunesAccountForMediaType:", v5);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__ACAccountStore_AppleMediaServices___updateStorefrontInLocalAccount___block_invoke;
      v27[3] = &unk_1E559E500;
      id v7 = v4;
      id v28 = v7;
      __int16 v29 = a1;
      v8 = [v6 thenWithBlock:v27];

      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      id v23 = __70__ACAccountStore_AppleMediaServices___updateStorefrontInLocalAccount___block_invoke_144;
      id v24 = &unk_1E559E7E8;
      id v25 = a1;
      id v26 = v7;
      [v8 addErrorBlock:&v21];
      v9 = objc_msgSend(v8, "binaryPromiseAdapter", v21, v22, v23, v24, v25);

      id v10 = v28;
    }
    else
    {
      v16 = +[AMSLogConfig sharedAccountsConfig];
      if (!v16)
      {
        v16 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        v19 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v18;
        __int16 v32 = 2114;
        __int16 v33 = v19;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch media type for storefront sync.", buf, 0x16u);
      }
      id v10 = AMSError(0, @"Aborted attempt to sync storefront to local account", @"Failed to fetch the mediaType for the provided account", 0);
      v9 = +[AMSBinaryPromise promiseWithError:v10];
    }
  }
  else
  {
    id v11 = +[AMSLogConfig sharedAccountsConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSLogKey();
      id v15 = AMSHashIfNeeded(v4);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      __int16 v33 = v14;
      __int16 v34 = 2114;
      uint64_t v35 = v15;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Storefront sync attempted on a non-local account. account = %{public}@", buf, 0x20u);
    }
    v5 = AMSError(2, @"Aborted attempt to sync storefront to local account", @"The provided account is not a local account", 0);
    v9 = +[AMSBinaryPromise promiseWithError:v5];
  }

  return v9;
}

- (id)ams_activeiTunesAccountForMediaType:()AppleMediaServices
{
  id v4 = a3;
  if ([v4 isEqualToString:AMSAccountMediaTypeAppStoreBeta])
  {
    objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke;
    v12[3] = &unk_1E559E500;
    v12[4] = a1;
    id v13 = v4;
    id v7 = v4;
    v8 = [v6 thenWithBlock:v12];
  }
  else
  {
    id v6 = objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", v4);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__ACAccountStore_AppleMediaServices__ams_activeiTunesAccountForMediaType___block_invoke_2;
    v10[3] = &unk_1E559E528;
    id v11 = v4;
    id v5 = v4;
    v8 = [v6 thenWithBlock:v10];
    id v7 = v11;
  }

  return v8;
}

- (id)ams_iTunesAccountsForMediaType:()AppleMediaServices
{
  return AMSiTunesAccountsForMediaType(a1, a3);
}

- (id)ams_addCookiesForResponse:()AppleMediaServices account:
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    if (!v7
      || ([a1 _addUserCookiesForResponse:v6 account:v7],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v8 addObject:v9],
          v9,
          (objc_msgSend(v7, "ams_isEphemeralAccount") & 1) == 0))
    {
      id v10 = [a1 _addGlobalCookiesForResponse:v6];
      [v8 addObject:v10];
    }
    uint64_t v11 = +[AMSBinaryPromise promiseWithAll:v8];
  }
  else
  {
    v8 = AMSError(2, @"Expected non-nil response", 0, 0);
    uint64_t v11 = +[AMSBinaryPromise promiseWithError:v8];
  }
  id v12 = (void *)v11;

  return v12;
}

- (id)_addUserCookiesForResponse:()AppleMediaServices account:
{
  if (a3 && a4)
  {
    id v4 = objc_msgSend(a4, "ams_asynchronouslyAddCookiesForResponse:");
  }
  else
  {
    id v5 = AMSError(2, @"Expected response and account to be non-nil", 0, 0);
    id v4 = +[AMSBinaryPromise promiseWithError:v5];
  }
  return v4;
}

- (id)_addGlobalCookiesForResponse:()AppleMediaServices
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(a1, "ams_mediaType");
    id v6 = objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:", v5);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__ACAccountStore_AppleMediaServices___addGlobalCookiesForResponse___block_invoke;
    v11[3] = &unk_1E559E6B0;
    id v12 = v4;
    id v7 = [v6 continueWithBlock:v11];
    v8 = [v7 binaryPromiseAdapter];
  }
  else
  {
    v9 = AMSError(2, @"Expected response to be non-nil", 0, 0);
    v8 = +[AMSBinaryPromise promiseWithError:v9];
  }
  return v8;
}

- (uint64_t)ams_localiTunesAccountForAccountType:()AppleMediaServices
{
  return objc_msgSend(a1, "_ams_localiTunesAccountForAccountType:shouldUpdateStorefront:", a3, 0);
}

- (id)_fetchLocalAccountForAccountType:()AppleMediaServices error:
{
  id v12 = 0;
  id v5 = AMSAccountsWithAccountType(a1, a3, 1, &v12);
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v5, "ams_firstObjectPassingTest:", &__block_literal_global_134);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a4)
    {
      AMSError(7, @"Local Account Not Found", @"The local account doesn't exist.", 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v9;
}

- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices error:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(a1, "ams_alliTunesAccounts", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    LODWORD(v11) = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = v11 & objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "ams_removeCookiesMatchingProperties:error:", v6, a4);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (AMSPromise)ams_mediaAccountForHomeWithIdentifier:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSPromise);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __76__ACAccountStore_AppleMediaServices__ams_mediaAccountForHomeWithIdentifier___block_invoke;
  id v13 = &unk_1E559E7E8;
  uint64_t v14 = a1;
  id v15 = v4;
  id v6 = v4;
  [(AMSPromise *)v5 addErrorBlock:&v10];
  id v7 = +[AMSMultiUserService proxyObject];
  uint64_t v8 = [(AMSPromise *)v5 completionHandlerAdapter];
  [v7 iTunesAccountForHomeWithIdentifier:v6 completion:v8];

  return v5;
}

- (void)ams_isActiveAccountCombined
{
  v2 = objc_msgSend(a1, "ams_activeiCloudAccount");
  v3 = objc_msgSend(a1, "ams_activeiTunesAccount");
  id v4 = objc_msgSend(v2, "ams_DSID");
  if (v4)
  {
    id v5 = objc_msgSend(v3, "ams_DSID");

    if (v5)
    {
      id v6 = objc_msgSend(v2, "ams_DSID");
      id v7 = objc_msgSend(v3, "ams_DSID");
      id v4 = (void *)[v6 isEqualToNumber:v7];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)ams_iTunesAccountWithDSID:()AppleMediaServices
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(a1, "ams_iTunesAccounts");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID___block_invoke;
    v8[3] = &unk_1E559E490;
    id v9 = v4;
    id v6 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)ams_localiTunesAccount
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v3 = objc_msgSend(a1, "ams_mediaType");
  id v4 = objc_msgSend(v2, "ams_accountTypeIdentifierForMediaType:", v3);

  if (v4)
  {
    id v29 = 0;
    id v5 = objc_msgSend(a1, "_ams_accountsWithAccountTypeIdentifier:options:error:", v4, 1, &v29);
    id v6 = v29;
    if (v5)
    {
      id v7 = [v5 ams_firstObjectPassingTest:&__block_literal_global_0];
      if (v7)
      {
        id v8 = v7;
        id v9 = v8;
      }
      else
      {
        uint64_t v18 = objc_msgSend(a1, "ams_mediaType");
        uint64_t v19 = objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:", v18);
        id v28 = v6;
        uint64_t v20 = [v19 resultWithError:&v28];
        id v21 = v28;

        if (!v20)
        {
          uint64_t v22 = +[AMSLogConfig sharedAccountsConfig];
          if (!v22)
          {
            uint64_t v22 = +[AMSLogConfig sharedConfig];
          }
          id v23 = [v22 OSLogObject];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = objc_opt_class();
            id v25 = AMSLogKey();
            id v26 = AMSLogableError(v21);
            *(_DWORD *)buf = 138543874;
            uint64_t v31 = v24;
            __int16 v32 = 2114;
            __int16 v33 = v25;
            __int16 v34 = 2114;
            uint64_t v35 = v26;
            _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create/fetch the local account. error = %{public}@", buf, 0x20u);
          }
        }
        id v8 = v20;
        id v9 = v8;
        id v6 = v21;
      }
      id v13 = v8;
    }
    else
    {
      id v9 = +[AMSLogConfig sharedAccountsConfig];
      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v9 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        long long v16 = AMSLogKey();
        long long v17 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v15;
        __int16 v32 = 2114;
        __int16 v33 = v16;
        __int16 v34 = 2114;
        uint64_t v35 = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create/fetch the local account. error = %{public}@", buf, 0x20u);
      }
      id v13 = 0;
    }
  }
  else
  {
    id v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v6 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      id v12 = objc_msgSend(a1, "ams_mediaType");
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v10;
      __int16 v32 = 2114;
      __int16 v33 = v11;
      __int16 v34 = 2114;
      uint64_t v35 = v12;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create/fetch the local account. Invalid media type. mediaType = %{public}@", buf, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

+ (id)ams_sharedAccountStoreForClient:()AppleMediaServices
{
  id v4 = [a3 accountMediaType];
  id v5 = objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:", v4);

  return v5;
}

- (uint64_t)ams_fetchiTunesAccounts
{
  return objc_msgSend(a1, "_ams_fetchAccountsWithAccountTypeIdentifier:options:", *MEMORY[0x1E4F17890], 1);
}

- (uint64_t)ams_fetchiTunesSandboxAccounts
{
  return objc_msgSend(a1, "_ams_fetchAccountsWithAccountTypeIdentifier:options:", *MEMORY[0x1E4F17898], 1);
}

- (AMSMutablePromise)ams_fetchActiveiCloudAccount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = AMSLogKey();
    id v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      uint64_t v10 = AMSLogKey();
      uint64_t v2 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v2];
    }
    else
    {
      uint64_t v10 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    uint64_t v11 = };
    *(_DWORD *)buf = 138543362;
    id v21 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Fetching active iCloud account", buf, 0xCu);
    if (v7)
    {

      uint64_t v11 = (void *)v2;
    }
  }
  id v12 = objc_alloc_init(AMSMutablePromise);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__ACAccountStore_AppleMediaServices__ams_fetchActiveiCloudAccount__block_invoke;
  v17[3] = &unk_1E559E550;
  v17[4] = a1;
  uint64_t v19 = a2;
  id v13 = v12;
  uint64_t v18 = v13;
  objc_msgSend(a1, "aa_primaryAppleAccountWithCompletion:", v17);
  uint64_t v14 = v18;
  uint64_t v15 = v13;

  return v15;
}

- (id)ams_fetchGrandSlamTokenForAccount:()AppleMediaServices withIdentifier:error:
{
  id v6 = objc_msgSend(a1, "ams_fetchGrandSlamTokenForAccount:withIdentifier:");
  id v7 = [v6 resultWithError:a5];

  return v7;
}

- (id)ams_fetchGrandSlamTokenForAccount:()AppleMediaServices withIdentifier:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "ams_altDSID");
  uint64_t v9 = objc_msgSend(a1, "aida_accountForAltDSID:", v8);

  if (!v9)
  {
    uint64_t v14 = AMSHashIfNeeded(v6);
    id v21 = AMSErrorWithFormat(7, @"AIDA Account Missing", @"There's no AIDA account matching %@.", v16, v17, v18, v19, v20, (uint64_t)v14);
    uint64_t v22 = +[AMSPromise promiseWithError:v21];

    goto LABEL_9;
  }
  uint64_t v10 = (void *)MEMORY[0x192FA47D0]();
  id v31 = 0;
  uint64_t v11 = [a1 credentialForAccount:v9 serviceID:v7 error:&v31];
  id v12 = v31;
  id v13 = [v11 token];
  uint64_t v14 = (void *)[v13 copy];

  if (v12)
  {
    uint64_t v15 = +[AMSPromise promiseWithError:v12];
  }
  else
  {
    if (!v14)
    {
      v30 = AMSHashIfNeeded(v6);
      id v29 = AMSErrorWithFormat(7, @"GrandSlam Token Missing", @"There's no GrandSlam token (%@) for %@.", v24, v25, v26, v27, v28, (uint64_t)v7);
      uint64_t v22 = +[AMSPromise promiseWithError:v29];

      goto LABEL_8;
    }
    uint64_t v15 = +[AMSPromise promiseWithResult:v14];
  }
  uint64_t v22 = (void *)v15;
LABEL_8:

LABEL_9:
  return v22;
}

- (id)ams_cookiesForURL:()AppleMediaServices
{
  v3 = objc_msgSend(a1, "ams_cookiesForURL:bag:", a3, 0);
  id v4 = [v3 resultWithError:0];

  return v4;
}

- (id)ams_cookiesForURL:()AppleMediaServices bag:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(a1, "ams_fetchLocaliTunesAccount");
  uint64_t v9 = objc_msgSend(a1, "ams_mediaType");
  uint64_t v10 = objc_msgSend(a1, "ams_activeiTunesAccountForMediaType:", v9);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke;
  aBlock[3] = &unk_1E559E500;
  id v22 = v6;
  id v23 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = _Block_copy(aBlock);
  uint64_t v14 = [v8 thenWithBlock:v13];
  uint64_t v15 = [v10 thenWithBlock:v13];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__ACAccountStore_AppleMediaServices__ams_cookiesForURL_bag___block_invoke_2;
  v19[3] = &unk_1E559E528;
  id v20 = v15;
  id v16 = v15;
  uint64_t v17 = [v14 thenWithBlock:v19];

  return v17;
}

- (uint64_t)ams_iCloudAccountForAccount:()AppleMediaServices
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F17750] forAccount:a3];
}

- (uint64_t)ams_IDSAccountForAccount:()AppleMediaServices
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F17808] forAccount:a3];
}

- (uint64_t)ams_iTunesAccountForAccount:()AppleMediaServices
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F17890] forAccount:a3];
}

- (id)ams_iTunesAccountForAccount:()AppleMediaServices forMediaType:createIfNeeded:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[AMSLogConfig sharedAccountsConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = AMSLogKey();
    id v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v14;
    if (v12)
    {
      uint64_t v5 = AMSLogKey();
      [v13 stringWithFormat:@"%@: [%@] ", v15, v5];
    }
    else
    {
      [v13 stringWithFormat:@"%@: ", v14];
    id v16 = };
    uint64_t v17 = AMSHashIfNeeded(v8);
    uint64_t v18 = AMSHashIfNeeded(v9);
    uint64_t v19 = (void *)v18;
    id v20 = @"false";
    *(_DWORD *)buf = 138544130;
    v39 = v16;
    if (a5) {
      id v20 = @"true";
    }
    __int16 v40 = 2114;
    v41 = v17;
    __int16 v42 = 2114;
    uint64_t v43 = v18;
    __int16 v44 = 2114;
    v45 = v20;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Searching for iTunes account for account: %{public}@ | mediaType = %{public}@ | createIfNeeded = %{public}@", buf, 0x2Au);
    if (v12)
    {

      id v16 = (void *)v5;
    }
  }
  if (objc_msgSend(v8, "ams_isiTunesAccount"))
  {
    id v21 = +[AMSLogConfig sharedAccountsConfig];
    if (!v21)
    {
      id v21 = +[AMSLogConfig sharedConfig];
    }
    id v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v23 = AMSLogKey();
      uint64_t v24 = NSString;
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = v25;
      if (v23)
      {
        a1 = AMSLogKey();
        [v24 stringWithFormat:@"%@: [%@] ", v26, a1];
      }
      else
      {
        [v24 stringWithFormat:@"%@: ", v25];
      uint64_t v27 = };
      __int16 v33 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      v39 = v27;
      __int16 v40 = 2114;
      v41 = v33;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEBUG, "%{public}@The account is already an iTunes account, returning. account = %{public}@", buf, 0x16u);
      if (v23)
      {

        uint64_t v27 = a1;
      }
    }
    id v32 = +[AMSPromise promiseWithResult:v8];
  }
  else
  {
    uint64_t v28 = objc_msgSend(v8, "ams_altDSID");
    id v29 = objc_msgSend(v8, "ams_DSID");
    v30 = [v8 username];
    id v31 = objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:DSID:username:forMediaType:", v28, v29, v30, v9);

    if (a5)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountForAccount_forMediaType_createIfNeeded___block_invoke;
      v36[3] = &unk_1E559E5C8;
      v36[4] = a1;
      id v37 = v8;
      id v32 = [v31 catchWithBlock:v36];
    }
    else
    {
      id v32 = v31;
    }
  }
  return v32;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "ams_iTunesAccounts");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID___block_invoke;
  v9[3] = &unk_1E559E490;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v9);

  return v7;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices forMediaType:
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", a4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_forMediaType___block_invoke;
  v11[3] = &unk_1E559E528;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 thenWithBlock:v11];

  return v9;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices DSID:username:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:", v8);
    if (!v9) {
      goto LABEL_7;
    }
  }
  else
  {
    id v11 = 0;
    if (!v9) {
      goto LABEL_7;
    }
  }
  if (!v11)
  {
    id v11 = objc_msgSend(a1, "ams_iTunesAccountWithDSID:", v9);
  }
LABEL_7:
  if (v10 && !v11)
  {
    id v11 = objc_msgSend(a1, "ams_iTunesAccountWithUsername:", v10);
  }

  return v11;
}

- (id)ams_iTunesAccountWithAltDSID:()AppleMediaServices DSID:username:forMediaType:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", a6);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithAltDSID_DSID_username_forMediaType___block_invoke;
  v19[3] = &unk_1E559E5F0;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  uint64_t v17 = [v13 thenWithBlock:v19];

  return v17;
}

- (id)ams_iTunesAccountWithDSID:()AppleMediaServices forMediaType:
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", a4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithDSID_forMediaType___block_invoke;
  v11[3] = &unk_1E559E528;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 thenWithBlock:v11];

  return v9;
}

- (id)ams_iTunesAccountWithUsername:()AppleMediaServices
{
  id v4 = a3;
  if ([v4 isEqualToString:@"local"])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_msgSend(a1, "ams_iTunesAccounts");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername___block_invoke;
    v8[3] = &unk_1E559E490;
    id v9 = v4;
    uint64_t v5 = objc_msgSend(v6, "ams_firstObjectPassingTest:", v8);
  }
  return v5;
}

- (id)ams_iTunesAccountWithUsername:()AppleMediaServices forMediaType:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"local"])
  {
    id v8 = AMSError(7, @"Account Not Found", @"Could not find an account with the local username for this media type.", 0);
    id v9 = +[AMSPromise promiseWithError:v8];
  }
  else
  {
    id v8 = objc_msgSend(a1, "ams_iTunesAccountsForMediaType:", v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__ACAccountStore_AppleMediaServices__ams_iTunesAccountWithUsername_forMediaType___block_invoke;
    v11[3] = &unk_1E559E528;
    id v12 = v6;
    id v9 = [v8 thenWithBlock:v11];
  }
  return v9;
}

- (id)ams_iTunesAccountsForMediaTypes:()AppleMediaServices
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke;
  v11[3] = &unk_1E559E618;
  void v11[4] = a1;
  id v4 = objc_msgSend(a3, "ams_mapWithTransform:", v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__ACAccountStore_AppleMediaServices__ams_iTunesAccountsForMediaTypes___block_invoke_2;
  v10[3] = &unk_1E559E640;
  void v10[4] = a1;
  uint64_t v5 = objc_msgSend(v4, "ams_mapWithTransform:", v10);
  id v6 = [v5 allObjects];
  id v7 = +[AMSPromise promiseWithAll:v6];
  id v8 = [v7 thenWithBlock:&__block_literal_global_99];

  return v8;
}

- (uint64_t)ams_saveAccount:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_saveAccount:verifyCredentials:", a3, 0);
}

- (uint64_t)ams_saveAccount:()AppleMediaServices verifyCredentials:
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  return objc_msgSend(a1, "ams_saveAccount:withOptions:", a3, v4);
}

- (uint64_t)ams_saveVerifiedAccount:()AppleMediaServices error:
{
  return objc_msgSend(a1, "ams_saveVerifiedAccount:withOptions:error:", a3, 0, a4);
}

- (AMSBinaryPromise)ams_setiTunesAccount:()AppleMediaServices forHomeWithIdentifier:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AMSBinaryPromise);
  id v9 = +[AMSMultiUserService proxyObjectAsync];
  id v10 = [(AMSBinaryPromise *)v8 completionHandlerAdapter];
  [v9 setiTunesAccount:v6 forHomeWithIdentifier:v7 completion:v10];

  objc_initWeak(&location, a1);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__ACAccountStore_AppleMediaServices__ams_setiTunesAccount_forHomeWithIdentifier___block_invoke;
  v14[3] = &unk_1E559E688;
  objc_copyWeak(&v17, &location);
  id v11 = v6;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  [(AMSBinaryPromise *)v8 addErrorBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

- (id)ams_addCookiesForResult:()AppleMediaServices account:
{
  id v6 = a4;
  id v7 = [a3 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;

    if (v8)
    {
      id v9 = objc_msgSend(a1, "ams_addCookiesForResponse:account:", v8, v6);
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v10 = AMSError(2, @"Invalid Parameter", @"The AMSURLResult didn't contain a NSHTTPURLResponse.", 0);
  id v9 = +[AMSBinaryPromise promiseWithError:v10];

  id v8 = 0;
LABEL_6:

  return v9;
}

- (id)_createLocaliTunesAccountForAccountType:()AppleMediaServices
{
  uint64_t v2 = objc_msgSend(a1, "_newLocalAccountWithAccountType:");
  v3 = objc_msgSend(a1, "ams_saveAccount:", v2);
  uint64_t v4 = [v3 catchWithBlock:&__block_literal_global_123];

  return v4;
}

- (uint64_t)_createLocaliTunesAccountForAccountType:()AppleMediaServices error:
{
  id v6 = objc_msgSend(a1, "_newLocalAccountWithAccountType:");
  id v12 = 0;
  char v7 = objc_msgSend(a1, "ams_saveVerifiedAccount:withOptions:error:", v6, 0, &v12);
  id v8 = v12;
  id v9 = v8;
  if (v7 & 1) != 0 || (objc_msgSend(v8, "ams_hasDomain:code:", *MEMORY[0x1E4F178F0], 5))
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v10;
}

- (void)_newLocalAccountWithAccountType:()AppleMediaServices
{
  v3 = (objc_class *)MEMORY[0x1E4F179B0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithAccountType:v4];

  [v5 setActive:0];
  [v5 setUsername:@"local"];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:0x1EDCA8708];
  return v5;
}

- (AMSMutablePromise)_iTunesAccountsForAccountType:()AppleMediaServices
{
  return AMSiTunesAccountsForAccountType(a1, a3);
}

- (AMSMutableBinaryPromise)_saveAccount:()AppleMediaServices verifyCredentials:
{
  return AMSSaveAccount(a1, a3, a4);
}

- (uint64_t)_saveVerifiedAccount:()AppleMediaServices error:
{
  return AMSSaveVerifiedAccount(a1, a3, a4);
}

+ (id)_multiUserTokenForIdentifier:()AppleMediaServices
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length])
  {
    id v9 = 0;
    goto LABEL_19;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"com.apple.applemediaservices.multiuser");
  uint64_t v5 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD08], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], @"com.apple.AppleMediaServices.multiUser.token");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], v5);
  CFTypeRef result = 0;
  OSStatus v6 = SecItemCopyMatching(Mutable, &result);
  char v7 = (void *)result;
  if (v6 == -25300)
  {
    id v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] No multi-user token stored for %{public}@.", buf, 0x20u);
    }
    goto LABEL_17;
  }
  OSStatus v8 = v6;
  if (v6 || ![(id)result length])
  {
    uint64_t v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v21 = v12;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2114;
      id v25 = v3;
      __int16 v26 = 1024;
      OSStatus v27 = v8;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the multi-user token for %{public}@. error = %d", buf, 0x26u);
    }
LABEL_17:
    id v9 = 0;
    goto LABEL_18;
  }
  id v9 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
LABEL_18:
  CFRelease(Mutable);

LABEL_19:
  return v9;
}

+ (uint64_t)_isAccountsCachingEnabled
{
  return _os_feature_enabled_impl();
}

- (uint64_t)ams_iTunesAccountForHomeWithIdentifier:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_iTunesAccountForHomeWithIdentifier:error:", a3, 0);
}

- (id)ams_iTunesAccountForHomeWithIdentifier:()AppleMediaServices error:
{
  uint64_t v5 = objc_msgSend(a1, "ams_mediaAccountForHomeWithIdentifier:");
  OSStatus v6 = [v5 resultWithError:a4];

  return v6;
}

- (uint64_t)ams_iTunesAccountsWithHomeUserIdentifiers
{
  return MEMORY[0x1E4F1CBF0];
}

- (id)ams_iTunesAccountWithHomeUserID:()AppleMediaServices
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  OSStatus v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  char v7 = objc_msgSend(a1, "ams_iTunesAccountWithHomeUserIdentifier:", v6);

  return v7;
}

- (uint64_t)ams_iTunesAccountWithHomeUserIdentifier:()AppleMediaServices
{
  return 0;
}

- (id)ams_iTunesSandboxAccounts
{
  v0 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeAppStoreSandbox);
  v1 = objc_msgSend(v0, "ams_iTunesAccounts");

  return v1;
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices account:error:
{
  OSStatus v6 = objc_msgSend(a1, "ams_addCookiesForResponse:account:");
  uint64_t v7 = [v6 resultWithError:a5];

  return v7;
}

- (uint64_t)ams_addCookiesForResult:()AppleMediaServices account:error:
{
  OSStatus v6 = objc_msgSend(a1, "ams_addCookiesForResult:account:");
  uint64_t v7 = [v6 resultWithError:a5];

  return v7;
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices request:account:error:
{
  uint64_t v7 = objc_msgSend(a1, "ams_addCookiesForResponse:account:", a3, a5);
  uint64_t v8 = [v7 resultWithError:a6];

  return v8;
}

@end