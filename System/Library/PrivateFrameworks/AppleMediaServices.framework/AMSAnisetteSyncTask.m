@interface AMSAnisetteSyncTask
- (ACAccount)account;
- (AMSAnisetteSyncTask)initWithData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6;
- (AMSBagProtocol)bag;
- (NSData)data;
- (id)performSync;
- (int64_t)type;
@end

@implementation AMSAnisetteSyncTask

- (AMSAnisetteSyncTask)initWithData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSAnisetteSyncTask;
  v14 = [(AMSTask *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    v15->_type = a4;
    objc_storeStrong((id *)&v15->_account, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)performSync
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AMSAnisetteSyncTask_performSync__block_invoke;
  v4[3] = &unk_1E559EDC0;
  v4[4] = self;
  v2 = [(AMSTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

BOOL __34__AMSAnisetteSyncTask_performSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v3 = off_1E559C000;
  v4 = +[AMSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = AMSLogKey();
    uint64_t v9 = [*(id *)(a1 + 32) type];
    v10 = [*(id *)(a1 + 32) account];
    id v11 = objc_msgSend(v10, "ams_DSID");
    id v12 = AMSHashIfNeeded(v11);
    *(_DWORD *)buf = 138544130;
    v66 = v6;
    __int16 v67 = 2114;
    v68 = v8;
    __int16 v69 = 2048;
    uint64_t v70 = v9;
    __int16 v71 = 2114;
    id v72 = v12;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting sync with type: %ld account: %{public}@", buf, 0x2Au);

    v3 = off_1E559C000;
  }

  uint64_t v64 = 0;
  unsigned int v63 = 0;
  uint64_t v62 = 0;
  unsigned int v61 = 0;
  uint64_t v13 = [*(id *)(a1 + 32) type];
  v14 = [*(id *)(a1 + 32) account];
  uint64_t v15 = +[AMSAnisette _accountIDForType:v13 account:v14];

  id v16 = [*(id *)(a1 + 32) data];
  uint64_t v17 = [v16 bytes];
  v18 = [*(id *)(a1 + 32) data];
  tn46gtiuhw(v15, v17, [v18 length], (uint64_t)&v64, (uint64_t)&v63, (uint64_t)&v62, (uint64_t)&v61);
  int v20 = v19;

  if (v20)
  {
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"Sync failed with error code: %ld", v20);
    AMSError(307, @"Anisette Sync Failed", v21, 0);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0;
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v21 = (void *)[v24 initWithBytesNoCopy:v62 length:v61 freeWhenDone:0];
    id v25 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v26 = (void *)[v25 initWithBytesNoCopy:v64 length:v63 freeWhenDone:0];
    v27 = [AMSURLRequestEncoder alloc];
    v28 = [*(id *)(a1 + 32) bag];
    v29 = [(AMSURLRequestEncoder *)v27 initWithBag:v28];

    [(AMSURLRequestEncoder *)v29 setDialogOptions:1];
    [(AMSURLRequestEncoder *)v29 setRequestEncoding:2];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v31 = [v21 base64EncodedStringWithOptions:0];
    [v30 setObject:v31 forKeyedSubscript:@"clientData"];

    v32 = [v26 base64EncodedStringWithOptions:0];
    [v30 setObject:v32 forKeyedSubscript:@"machineId"];

    uint64_t v33 = [*(id *)(a1 + 32) type];
    v34 = [*(id *)(a1 + 32) bag];
    v35 = v34;
    if (v33 == 2)
    {
      v36 = [v34 URLForKey:@"amd-sync-machine"];
    }
    else
    {
      v36 = [v34 URLForKey:@"md-sync-machine"];

      v35 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v15];
      [v30 setObject:v35 forKeyedSubscript:@"dsId"];
    }

    v37 = [(AMSURLRequestEncoder *)v29 requestWithMethod:4 bagURL:v36 parameters:v30];
    id v60 = 0;
    v38 = [v37 resultWithError:&v60];
    id v22 = v60;

    if (v22)
    {
      v39 = 0;
      id v23 = 0;
    }
    else
    {
      v57 = v26;
      v40 = +[AMSURLSession defaultSession];
      v41 = [v40 dataTaskPromiseWithRequest:v38];
      id v59 = 0;
      v39 = [v41 resultWithError:&v59];
      id v22 = v59;

      if (v22)
      {
        id v23 = 0;
        v26 = v57;
      }
      else
      {
        v42 = [v39 object];
        objc_opt_class();
        v26 = v57;
        if (objc_opt_isKindOfClass()) {
          id v43 = v42;
        }
        else {
          id v43 = 0;
        }

        v56 = v43;
        v44 = [v43 objectForKeyedSubscript:@"syncState"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v23 = v44;
        }
        else {
          id v23 = 0;
        }

        id v22 = 0;
      }
    }

    v3 = off_1E559C000;
  }

  if (v64) {
    jk24uiwqrg(v64);
  }
  if (v62) {
    jk24uiwqrg(v62);
  }
  uint64_t v45 = [(__objc2_class *)v3[17] sharedAccountsConfig];
  v46 = (void *)v45;
  if (v22)
  {
    if (!v45)
    {
      v46 = [(__objc2_class *)v3[17] sharedConfig];
    }
    v47 = [v46 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = objc_opt_class();
      id v49 = v48;
      v50 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      v66 = v48;
      __int16 v67 = 2114;
      v68 = v50;
      __int16 v69 = 2112;
      uint64_t v70 = (uint64_t)v23;
      __int16 v71 = 2114;
      id v72 = v22;
      _os_log_impl(&dword_18D554000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Synchronize failed. (state: %@) %{public}@", buf, 0x2Au);
    }
    if (a2) {
      *a2 = v22;
    }
  }
  else
  {
    if (!v45)
    {
      v46 = [(__objc2_class *)v3[17] sharedConfig];
    }
    v51 = [v46 OSLogObject];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = objc_opt_class();
      id v53 = v52;
      v54 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      v66 = v52;
      __int16 v67 = 2114;
      v68 = v54;
      __int16 v69 = 2112;
      uint64_t v70 = (uint64_t)v23;
      _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Synchronize succeeded. (state: %@)", buf, 0x20u);
    }
  }

  return v22 == 0;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end