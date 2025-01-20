@interface AMSBagActiveAccountProvider
+ (id)_storefrontPromiseResultForAccountMediaType:(id)a3 account:(id)a4;
- (ACAccount)account;
- (ACAccount)previouslyAccessedAccount;
- (AMSBagActiveAccountProvider)init;
- (BOOL)associatedAccountIsEqualToAccount:(id)a3 forMediaType:(id)a4;
- (NSString)identity;
- (id)_activeAccountInStore:(id)a3 forMediaType:(id)a4;
- (id)_handleFetchedLocalAccount:(id)a3 fetchError:(id)a4 mustContainStorefront:(BOOL)a5 mediaType:(id)a6 error:(id *)a7;
- (id)bagAccountForAccountMediaType:(id)a3;
- (id)bagAccountPromiseForAccountMediaType:(id)a3;
- (id)bagStorefrontForAccountMediaType:(id)a3;
- (id)bagStorefrontPromiseForAccountMediaType:(id)a3;
- (void)_bagAccountForAccountMediaType:(id)a3 mustContainStorefront:(BOOL)a4 sync:(BOOL)a5 completion:(id)a6;
- (void)_localAccountInStore:(id)a3 mediaType:(id)a4 mustContainStorefront:(BOOL)a5 sync:(BOOL)a6 completion:(id)a7;
- (void)setAccount:(id)a3;
- (void)setPreviouslyAccessedAccount:(id)a3;
@end

@implementation AMSBagActiveAccountProvider

uint64_t __66__AMSBagActiveAccountProvider__activeAccountInStore_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isActiveForMediaType:", *(void *)(a1 + 32));
}

- (NSString)identity
{
  return (NSString *)@"active-account";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_previouslyAccessedAccount, 0);
}

- (AMSBagActiveAccountProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSBagActiveAccountProvider;
  result = [(AMSBagActiveAccountProvider *)&v3 init];
  if (result) {
    result->_accountLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)_bagAccountForAccountMediaType:(id)a3 mustContainStorefront:(BOOL)a4 sync:(BOOL)a5 completion:(id)a6
{
  uint64_t v8 = a5;
  BOOL v9 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = (void (**)(id, void *, void))a6;
  if (!v11)
  {
    v13 = +[AMSLogConfig sharedBagConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v39 = v8;
      v15 = AMSLogKey();
      v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        uint64_t v6 = AMSLogKey();
        [v16 stringWithFormat:@"%@: [%@] ", v18, v6];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      v19 = };
      *(_DWORD *)buf = 138543362;
      v42 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@No media type was provided. The default will be used instead.", buf, 0xCu);
      uint64_t v8 = v39;
      if (v15)
      {

        v19 = (void *)v6;
      }
    }
  }
  v20 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", v11);
  v21 = [(AMSBagActiveAccountProvider *)self _activeAccountInStore:v20 forMediaType:v11];
  v22 = v21;
  if (v21) {
    BOOL v23 = !v9;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23)
  {
    v30 = objc_msgSend(v21, "ams_storefrontForMediaType:", v11);

    if (v30) {
      goto LABEL_24;
    }
    v24 = +[AMSLogConfig sharedBagConfig];
    if (!v24)
    {
      v24 = +[AMSLogConfig sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
LABEL_37:

      [(AMSBagActiveAccountProvider *)self _localAccountInStore:v20 mediaType:v11 mustContainStorefront:v9 sync:v8 completion:v12];
      goto LABEL_38;
    }
    unsigned int v40 = v8;
    uint64_t v31 = AMSLogKey();
    v37 = NSString;
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = v32;
    v38 = (void *)v31;
    if (v31)
    {
      uint64_t v35 = AMSLogKey();
      [v37 stringWithFormat:@"%@: [%@] ", v33, v35];
    }
    else
    {
      [v37 stringWithFormat:@"%@: ", v32];
    v29 = };
    *(_DWORD *)buf = 138543618;
    v42 = v29;
    __int16 v43 = 2114;
    id v44 = v11;
    v34 = "%{public}@There’s an active account, but a required storefront is missing. Falling back to the local account. "
          "mediaType = %{public}@";
LABEL_34:
    _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEBUG, v34, buf, 0x16u);
    uint64_t v8 = v40;
    if (v38)
    {

      v29 = (void *)v35;
    }

    goto LABEL_37;
  }
  if (!v21)
  {
    v24 = +[AMSLogConfig sharedBagConfig];
    if (!v24)
    {
      v24 = +[AMSLogConfig sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_37;
    }
    unsigned int v40 = v8;
    uint64_t v26 = AMSLogKey();
    v36 = NSString;
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = v27;
    v38 = (void *)v26;
    if (v26)
    {
      uint64_t v35 = AMSLogKey();
      [v36 stringWithFormat:@"%@: [%@] ", v28, v35];
    }
    else
    {
      [v36 stringWithFormat:@"%@: ", v27];
    v29 = };
    *(_DWORD *)buf = 138543618;
    v42 = v29;
    __int16 v43 = 2114;
    id v44 = v11;
    v34 = "%{public}@There’s no active account. Falling back to the local account. mediaType = %{public}@";
    goto LABEL_34;
  }
LABEL_24:
  [(AMSBagActiveAccountProvider *)self setPreviouslyAccessedAccount:v22];
  v12[2](v12, v22, 0);
LABEL_38:
}

- (id)_activeAccountInStore:(id)a3 forMediaType:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "ams_iTunesAccounts");
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__AMSBagActiveAccountProvider__activeAccountInStore_forMediaType___block_invoke;
    v9[3] = &unk_1E559F720;
    id v10 = v5;
    v7 = objc_msgSend(v6, "ams_firstObjectPassingTest:", v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_localAccountInStore:(id)a3 mediaType:(id)a4 mustContainStorefront:(BOOL)a5 sync:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__AMSBagActiveAccountProvider__localAccountInStore_mediaType_mustContainStorefront_sync_completion___block_invoke;
  aBlock[3] = &unk_1E559F748;
  aBlock[4] = self;
  BOOL v25 = a5;
  id v14 = v12;
  id v23 = v14;
  id v15 = v13;
  id v24 = v15;
  id v16 = a3;
  uint64_t v17 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  uint64_t v18 = objc_msgSend(v16, "ams_mediaType");
  if (v8)
  {
    id v21 = 0;
    uint64_t v19 = objc_msgSend(v16, "ams_localiTunesAccountForAccountMediaType:error:", v18, &v21);

    id v20 = v21;
    v17[2](v17, v19, v20);
    uint64_t v18 = (void *)v19;
  }
  else
  {
    objc_msgSend(v16, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", v18, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    [v20 addFinishBlock:v17];
  }
}

void __100__AMSBagActiveAccountProvider__localAccountInStore_mediaType_mustContainStorefront_sync_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = 0;
  v7 = [v5 _handleFetchedLocalAccount:a2 fetchError:a3 mustContainStorefront:v4 mediaType:v6 error:&v9];
  id v8 = v9;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_handleFetchedLocalAccount:(id)a3 fetchError:(id)a4 mustContainStorefront:(BOOL)a5 mediaType:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    if (!v9
      || (objc_msgSend(v12, "ams_storefrontForMediaType:", v14),
          id v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      id v16 = v12;
      goto LABEL_29;
    }
    id v24 = +[AMSLogConfig sharedBagConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    BOOL v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = AMSLogKey();
      uint64_t v27 = NSString;
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = v28;
      if (v26)
      {
        uint64_t v35 = AMSLogKey();
        [v27 stringWithFormat:@"%@: [%@] ", v29, v35];
      }
      else
      {
        [v27 stringWithFormat:@"%@: ", v28];
      v30 = };
      uint64_t v33 = AMSHashIfNeeded(v12);
      *(_DWORD *)buf = 138543874;
      v37 = v30;
      __int16 v38 = 2114;
      id v39 = v33;
      __int16 v40 = 2114;
      id v41 = v14;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@The local account doesn’t have a storefront. localAccount = %{public}@ | mediaType = %{public}@", buf, 0x20u);
      if (v26)
      {

        v30 = (void *)v35;
      }
    }
    if (a7)
    {
      uint64_t v31 = @"Local account found but has missing storefront";
      uint64_t v32 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v17 = +[AMSLogConfig sharedBagConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = AMSLogKey();
      id v20 = NSString;
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = v21;
      if (v19)
      {
        uint64_t v35 = AMSLogKey();
        [v20 stringWithFormat:@"%@: [%@] ", v22, v35];
      }
      else
      {
        [v20 stringWithFormat:@"%@: ", v21];
      id v23 = };
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      __int16 v38 = 2114;
      id v39 = v14;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to fetch local account. This will prevent initial bag requests from specifying storefront / cookies. mediaType = %{public}@", buf, 0x16u);
      if (v19)
      {

        id v23 = (void *)v35;
      }
    }
    if (a7)
    {
      uint64_t v31 = @"Local account not found";
      uint64_t v32 = v13;
LABEL_27:
      AMSError(7, v31, 0, v32);
      id v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
  }
  id v16 = 0;
LABEL_29:
  [(AMSBagActiveAccountProvider *)self setPreviouslyAccessedAccount:v16];

  return v16;
}

- (void)setPreviouslyAccessedAccount:(id)a3
{
  uint64_t v4 = (ACAccount *)a3;
  os_unfair_lock_lock_with_options();
  previouslyAccessedAccount = self->_previouslyAccessedAccount;
  self->_previouslyAccessedAccount = v4;

  os_unfair_lock_unlock(&self->_accountLock);
}

void __64__AMSBagActiveAccountProvider_bagStorefrontForAccountMediaType___block_invoke(uint64_t a1, void *a2)
{
}

- (id)bagStorefrontForAccountMediaType:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__8;
  id v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__AMSBagActiveAccountProvider_bagStorefrontForAccountMediaType___block_invoke;
  v8[3] = &unk_1E559F6D0;
  v8[4] = &v9;
  [(AMSBagActiveAccountProvider *)self _bagAccountForAccountMediaType:v4 mustContainStorefront:1 sync:1 completion:v8];
  if (v10[5])
  {
    id v5 = +[AMSBagActiveAccountProvider _storefrontPromiseResultForAccountMediaType:account:](AMSBagActiveAccountProvider, "_storefrontPromiseResultForAccountMediaType:account:", v4);
    uint64_t v6 = [v5 result];
  }
  else
  {
    uint64_t v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

id __71__AMSBagActiveAccountProvider_bagStorefrontPromiseForAccountMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[AMSBagActiveAccountProvider _storefrontPromiseResultForAccountMediaType:*(void *)(a1 + 32) account:a2];
  objc_super v3 = +[AMSPromise promiseWithPromiseResult:v2];

  return v3;
}

+ (id)_storefrontPromiseResultForAccountMediaType:(id)a3 account:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(a4, "ams_storefrontForMediaType:", v5);
  if (v6)
  {
    v7 = [[AMSPromiseResult alloc] initWithResult:v6 error:0];
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"Account has no storefront for mediatype %@", v5];
    uint64_t v9 = AMSError(7, @"No storefront found", v8, 0);
    v7 = [[AMSPromiseResult alloc] initWithResult:0 error:v9];
  }
  return v7;
}

- (id)bagAccountPromiseForAccountMediaType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutablePromise);
  uint64_t v6 = [(AMSPromise *)v5 completionHandlerAdapter];
  [(AMSBagActiveAccountProvider *)self _bagAccountForAccountMediaType:v4 mustContainStorefront:0 sync:0 completion:v6];

  return v5;
}

- (id)bagStorefrontPromiseForAccountMediaType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutablePromise);
  uint64_t v6 = [(AMSPromise *)v5 completionHandlerAdapter];
  [(AMSBagActiveAccountProvider *)self _bagAccountForAccountMediaType:v4 mustContainStorefront:1 sync:0 completion:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__AMSBagActiveAccountProvider_bagStorefrontPromiseForAccountMediaType___block_invoke;
  v10[3] = &unk_1E559F6F8;
  id v11 = v4;
  id v7 = v4;
  id v8 = [(AMSMutablePromise *)v5 thenWithBlock:v10];

  return v8;
}

- (ACAccount)previouslyAccessedAccount
{
  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_previouslyAccessedAccount;
  os_unfair_lock_unlock(p_accountLock);
  return v4;
}

- (BOOL)associatedAccountIsEqualToAccount:(id)a3 forMediaType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "ams_isLocalAccount"))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [(AMSBagActiveAccountProvider *)self previouslyAccessedAccount];
    if (v9)
    {
      id v10 = [v6 accountType];
      id v11 = [v10 identifier];
      id v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_accountTypeIdentifierForMediaType:", v7);
      if ([v11 isEqualToString:v12])
      {
        id v13 = [v9 identifier];
        id v14 = [v6 identifier];
        char v8 = [v13 isEqualToString:v14];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (id)bagAccountForAccountMediaType:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__8;
  id v12 = __Block_byref_object_dispose__8;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AMSBagActiveAccountProvider_bagAccountForAccountMediaType___block_invoke;
  v7[3] = &unk_1E559F6D0;
  v7[4] = &v8;
  [(AMSBagActiveAccountProvider *)self _bagAccountForAccountMediaType:v4 mustContainStorefront:0 sync:1 completion:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __61__AMSBagActiveAccountProvider_bagAccountForAccountMediaType___block_invoke(uint64_t a1, void *a2)
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

@end