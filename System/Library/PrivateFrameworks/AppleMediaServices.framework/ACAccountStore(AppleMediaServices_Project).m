@interface ACAccountStore(AppleMediaServices_Project)
+ (id)_ams_newAccountStore;
+ (id)ams_sharedAccountStoreForProcessInfo:()AppleMediaServices_Project;
+ (uint64_t)_ams_defaultAccountStore;
- (AMSMutableBinaryPromise)ams_saveAccount:()AppleMediaServices_Project withOptions:;
- (AMSMutablePromise)_ams_fetchAccountTypeWithAccountTypeIdenfitier:()AppleMediaServices_Project;
- (AMSMutablePromise)_ams_fetchAccountWithIdentifier:()AppleMediaServices_Project;
- (AMSMutablePromise)_ams_fetchAccountsWithAccountType:()AppleMediaServices_Project options:;
- (BOOL)ams_isAccountNew:()AppleMediaServices_Project;
- (BOOL)ams_saveVerifiedAccount:()AppleMediaServices_Project withOptions:error:;
- (id)_ams_accountTypeWithAccountTypeIdentifier:()AppleMediaServices_Project error:;
- (id)_ams_accountWithIdentifier:()AppleMediaServices_Project error:;
- (id)_ams_accountsWithAccountType:()AppleMediaServices_Project options:error:;
- (id)_ams_accountsWithAccountTypeIdentifier:()AppleMediaServices_Project options:error:;
- (id)_ams_fetchAccountsWithAccountTypeIdentifier:()AppleMediaServices_Project options:;
- (id)_ams_localiTunesAccount;
- (id)_ams_localiTunesAccountForAccountMediaType:()AppleMediaServices_Project updateStorefront:;
- (id)_ams_localiTunesAccountForAccountType:()AppleMediaServices_Project shouldUpdateStorefront:;
- (id)ams_accountIsBackingAccountForActiveiCloudAccount:()AppleMediaServices_Project;
- (id)ams_demoAccount;
- (id)ams_fetchDemoAccount;
- (id)ams_localiTunesAccountForAccountMediaType:()AppleMediaServices_Project error:;
- (id)ams_localiTunesAccountForAccountType:()AppleMediaServices_Project error:;
- (id)ams_regulatoryAccount;
- (void)_ams_saveAccount:()AppleMediaServices_Project withOptions:sync:completion:;
@end

@implementation ACAccountStore(AppleMediaServices_Project)

- (id)_ams_localiTunesAccountForAccountType:()AppleMediaServices_Project shouldUpdateStorefront:
{
  id v6 = a3;
  v7 = [a1 _fetchLocaliTunesAccountForAccountType:v6 shouldUpdateStorefront:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountType_shouldUpdateStorefront___block_invoke;
  v11[3] = &unk_1E559E7C0;
  v11[4] = a1;
  id v12 = v6;
  char v13 = a4;
  id v8 = v6;
  v9 = [v7 catchWithBlock:v11];

  return v9;
}

+ (uint64_t)_ams_defaultAccountStore
{
  return [MEMORY[0x1E4F179C8] defaultStore];
}

- (id)_ams_localiTunesAccountForAccountMediaType:()AppleMediaServices_Project updateStorefront:
{
  id v6 = objc_msgSend(a1, "_accountTypeForMediaType:");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__ACAccountStore_AppleMediaServices_Project___ams_localiTunesAccountForAccountMediaType_updateStorefront___block_invoke;
  v9[3] = &unk_1E559E748;
  v9[4] = a1;
  char v10 = a4;
  v7 = [v6 thenWithBlock:v9];

  return v7;
}

- (id)_ams_accountsWithAccountTypeIdentifier:()AppleMediaServices_Project options:error:
{
  return AMSAccountsWithAccountTypeIdentifier(a1, a3, a4, a5);
}

- (AMSMutablePromise)_ams_fetchAccountTypeWithAccountTypeIdenfitier:()AppleMediaServices_Project
{
  return AMSFetchAccountTypeWithAccountTypeIdenfitier(a1, a3);
}

+ (id)ams_sharedAccountStoreForProcessInfo:()AppleMediaServices_Project
{
  v4 = [a3 accountMediaType];
  v5 = objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:", v4);

  return v5;
}

- (id)ams_localiTunesAccountForAccountMediaType:()AppleMediaServices_Project error:
{
  id v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "ams_accountTypeIdentifierForMediaType:", v6);

  id v8 = AMSAccountTypeWithAccountTypeIdentifier(a1, v7, 0);
  v9 = objc_msgSend(a1, "ams_localiTunesAccountForAccountType:error:", v8, a4);

  return v9;
}

- (id)ams_localiTunesAccountForAccountType:()AppleMediaServices_Project error:
{
  id v6 = a3;
  id v17 = 0;
  v7 = [a1 _fetchLocalAccountForAccountType:v6 error:&v17];
  id v8 = v17;
  id v9 = v8;
  if (!v7)
  {
    if (objc_msgSend(v8, "ams_hasDomain:code:", @"AMSErrorDomain", 7))
    {
      id v16 = 0;
      int v10 = [a1 _createLocaliTunesAccountForAccountType:v6 error:&v16];
      id v11 = v16;
      id v12 = v11;
      if (v10)
      {
        id v15 = v9;
        v7 = [a1 _fetchLocalAccountForAccountType:v6 error:&v15];
        id v13 = v15;

        if (v7)
        {
LABEL_5:
          id v9 = v13;
LABEL_15:

          goto LABEL_16;
        }
        if (!a4)
        {
          v7 = 0;
          goto LABEL_5;
        }
        id v9 = v13;
      }
      else
      {
        if (!a4)
        {
          v7 = 0;
          goto LABEL_15;
        }
        id v13 = v11;
      }
      v7 = 0;
      *a4 = v13;
      goto LABEL_15;
    }
    if (a4)
    {
      id v9 = v9;
      v7 = 0;
      *a4 = v9;
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_16:

  return v7;
}

- (id)_ams_localiTunesAccount
{
  v1 = a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "ams_mediaType");
  id v14 = 0;
  v3 = objc_msgSend(v1, "ams_localiTunesAccountForAccountMediaType:error:", v2, &v14);
  id v4 = v14;

  if (!v3)
  {
    v5 = +[AMSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = AMSLogKey();
      id v8 = NSString;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = v9;
      if (v7)
      {
        v1 = AMSLogKey();
        [v8 stringWithFormat:@"%@: [%@] ", v10, v1];
      }
      else
      {
        [v8 stringWithFormat:@"%@: ", v9];
      id v11 = };
      id v12 = AMSLogableError(v4);
      *(_DWORD *)buf = 138543618;
      id v16 = v11;
      __int16 v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create/fetch the local account. error = %{public}@", buf, 0x16u);
      if (v7)
      {

        id v11 = v1;
      }
    }
  }

  return v3;
}

- (id)ams_accountIsBackingAccountForActiveiCloudAccount:()AppleMediaServices_Project
{
  id v4 = a3;
  if (objc_msgSend(v4, "ams_isiTunesAccount"))
  {
    v5 = objc_msgSend(a1, "ams_fetchActiveiCloudAccount");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__ACAccountStore_AppleMediaServices_Project__ams_accountIsBackingAccountForActiveiCloudAccount___block_invoke;
    v8[3] = &unk_1E559E6B0;
    id v9 = v4;
    id v6 = [v5 continueWithBlock:v8];
  }
  else
  {
    v5 = AMSError(2, @"Invalid Account", @"This method is only available for iTunes accounts", 0);
    id v6 = +[AMSPromise promiseWithError:v5];
  }

  return v6;
}

- (id)ams_demoAccount
{
  v1 = objc_msgSend(a1, "ams_iTunesAccounts");
  v2 = objc_msgSend(v1, "ams_firstObjectPassingTest:", &__block_literal_global_249);

  return v2;
}

- (id)ams_fetchDemoAccount
{
  v1 = objc_msgSend(a1, "ams_fetchiTunesAccounts");
  v2 = [v1 thenWithBlock:&__block_literal_global_251];

  return v2;
}

- (id)ams_regulatoryAccount
{
  v1 = objc_msgSend(a1, "ams_iTunesAccounts");
  v2 = objc_msgSend(v1, "ams_firstObjectPassingTest:", &__block_literal_global_256);

  return v2;
}

- (BOOL)ams_isAccountNew:()AppleMediaServices_Project
{
  id v4 = [a3 identifier];
  v5 = objc_msgSend(a1, "_ams_accountWithIdentifier:error:", v4, 0);
  BOOL v6 = v5 == 0;

  return v6;
}

- (AMSMutableBinaryPromise)ams_saveAccount:()AppleMediaServices_Project withOptions:
{
  id v6 = a3;
  v7 = objc_alloc_init(AMSMutableBinaryPromise);
  id v8 = [(AMSBinaryPromise *)v7 completionHandlerAdapter];
  objc_msgSend(a1, "_ams_saveAccount:withOptions:sync:completion:", v6, a4, 0, v8);

  return v7;
}

- (BOOL)ams_saveVerifiedAccount:()AppleMediaServices_Project withOptions:error:
{
  id v8 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  __int16 v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__ACAccountStore_AppleMediaServices_Project__ams_saveVerifiedAccount_withOptions_error___block_invoke;
  v12[3] = &unk_1E559E770;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(a1, "_ams_saveAccount:withOptions:sync:completion:", v8, a4, 1, v12);
  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a5 && !*((unsigned char *)v20 + 24))
  {
    *a5 = (id) v14[5];
    int v9 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)_ams_saveAccount:()AppleMediaServices_Project withOptions:sync:completion:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if ((a4 & 2) != 0 && a5)
  {
    id v12 = @"Failed to save account";
    uint64_t v13 = @"Cannot synchronously save an account with verification";
LABEL_24:
    uint64_t v26 = 2;
LABEL_25:
    v32 = AMSError(v26, v12, v13, 0);
    v11[2](v11, 0, v32);
    goto LABEL_26;
  }
  if (!v10)
  {
    v27 = +[AMSLogConfig sharedAccountsConfig];
    if (!v27)
    {
      v27 = +[AMSLogConfig sharedConfig];
    }
    v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_opt_class();
      v30 = AMSLogKey();
      v31 = AMSHashIfNeeded(0);
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v29;
      __int16 v47 = 2114;
      v48 = v30;
      __int16 v49 = 2114;
      unint64_t v50 = (unint64_t)v31;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to save a nil account. account = %{public}@", buf, 0x20u);
    }
    id v12 = @"Saving Nil Account";
    uint64_t v13 = @"You cannot save a nil account.";
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "ams_isEphemeralAccount"))
  {
    id v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      __int16 v17 = AMSLogKey();
      id v18 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v16;
      __int16 v47 = 2114;
      v48 = v17;
      __int16 v49 = 2114;
      unint64_t v50 = (unint64_t)v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to save an ephemeral account. account = %{public}@", buf, 0x20u);
    }
    uint64_t v19 = AMSError(2, @"Saving Ephemeral Account", @"You cannot save an ephemeral account.", 0);
    v11[2](v11, 0, v19);
  }
  if (objc_msgSend(a1, "ams_isAccountNew:", v10))
  {
    char v20 = objc_msgSend(v10, "ams_isLocalAccount");
    if ((a4 & 1) == 0 && (v20 & 1) == 0)
    {
      uint64_t v21 = +[AMSLogConfig sharedAccountsConfig];
      if (!v21)
      {
        uint64_t v21 = +[AMSLogConfig sharedConfig];
      }
      char v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_opt_class();
        v24 = AMSLogKey();
        v25 = AMSHashIfNeeded(v10);
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v23;
        __int16 v47 = 2114;
        v48 = v24;
        __int16 v49 = 2114;
        unint64_t v50 = (unint64_t)v25;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to save a new account instead of using AMSAuthenticateTask. account = %{public}@", buf, 0x20u);
      }
      id v12 = @"Saving New Account";
      uint64_t v13 = @"Use AMSAuthenticateTask to add a new account to the system.";
      uint64_t v26 = 105;
      goto LABEL_25;
    }
    if ((v20 & 1) == 0)
    {
      v33 = +[AMSLogConfig sharedAccountsConfig];
      if (!v33)
      {
        v33 = +[AMSLogConfig sharedConfig];
      }
      v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = objc_opt_class();
        v36 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v35;
        __int16 v47 = 2114;
        v48 = v36;
        __int16 v49 = 2048;
        unint64_t v50 = a4;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saving a new account. options = %ld", buf, 0x20u);
      }
    }
  }
  if (([v10 isDirty] & 1) == 0)
  {
    v39 = +[AMSLogConfig sharedAccountsConfig];
    if (!v39)
    {
      v39 = +[AMSLogConfig sharedConfig];
    }
    v40 = [v39 OSLogObject];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = objc_opt_class();
      v42 = AMSLogKey();
      v43 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v41;
      __int16 v47 = 2114;
      v48 = v42;
      __int16 v49 = 2114;
      unint64_t v50 = (unint64_t)v43;
      _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_DEBUG, "%{public}@ [%{public}@] Someone attempted to save an unmodified account. account = %{public}@", buf, 0x20u);
    }
    id v12 = @"Saving Unmodified Account";
    uint64_t v13 = @"You attempted to save an unmodified account.";
    uint64_t v26 = 102;
    goto LABEL_25;
  }
  if (a5)
  {
    id v44 = 0;
    uint64_t v37 = [a1 _saveVerifiedAccount:v10 error:&v44];
    id v38 = v44;
    v11[2](v11, v37, v38);

    goto LABEL_27;
  }
  v32 = [a1 _saveAccount:v10 verifyCredentials:(a4 >> 1) & 1];
  [v32 addFinishBlock:v11];
LABEL_26:

LABEL_27:
}

- (id)_ams_accountTypeWithAccountTypeIdentifier:()AppleMediaServices_Project error:
{
  return AMSAccountTypeWithAccountTypeIdentifier(a1, a3, a4);
}

- (id)_ams_accountsWithAccountType:()AppleMediaServices_Project options:error:
{
  return AMSAccountsWithAccountType(a1, a3, a4, a5);
}

- (id)_ams_accountWithIdentifier:()AppleMediaServices_Project error:
{
  return AMSAccountWithIdentifier(a1, a3, a4);
}

- (AMSMutablePromise)_ams_fetchAccountWithIdentifier:()AppleMediaServices_Project
{
  return AMSFetchAccountWithIdentifier(a1, a3);
}

- (AMSMutablePromise)_ams_fetchAccountsWithAccountType:()AppleMediaServices_Project options:
{
  return AMSFetchAccountsWithAccountType(a1, a3, a4);
}

- (id)_ams_fetchAccountsWithAccountTypeIdentifier:()AppleMediaServices_Project options:
{
  return AMSFetchAccountsWithAccountTypeIdentifier(a1, a3, a4);
}

+ (id)_ams_newAccountStore
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  return v0;
}

@end