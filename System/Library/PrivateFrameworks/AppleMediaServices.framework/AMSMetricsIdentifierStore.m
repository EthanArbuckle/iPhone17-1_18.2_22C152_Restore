@interface AMSMetricsIdentifierStore
+ (AMSMetricsIdentifierStore)identifierStoreWithAccount:(id)a3 bagNamespace:(id)a4 bag:(id)a5;
+ (id)_accountIdentifierForAccount:(id)a3;
+ (id)_applyExpiryForKey:(id)a3 inNamespace:(id)a4 accountID:(id)a5 bag:(id)a6 at:(id)a7 consumerIDResetInterval:(double)a8;
+ (id)_database;
+ (id)_generateIdentifierKey:(id)a3 storeInfo:(id)a4 period:(int64_t)a5 resetInterval:(double)a6;
+ (id)_generateStoreKeyForAccount:(id)a3 domain:(id)a4 clientInfo:(id)a5;
+ (id)_identifierStoreInfoForKeys:(id)a3 inDatabase:(id)a4 date:(id)a5 needsToSync:(BOOL *)a6 account:(id)a7 clientInfo:(id)a8 domain:(id)a9 resetInterval:(double)a10 error:(id *)a11;
+ (id)_identifierStoreWithAccount:(id)a3 parameters:(id)a4;
+ (id)_parametersForBag:(id)a3 bagNamespace:(id)a4;
+ (id)_sharedQueue;
+ (id)_sync;
+ (id)identifierForAccount:(id)a3 bag:(id)a4 bagNamespace:(id)a5 keyName:(id)a6;
+ (int64_t)_periodFrom:(double)a3 storeInfoStarted:(id)a4 now:(id)a5;
+ (void)_removeStoreForNamespace:(id)a3 accountID:(id)a4 bag:(id)a5;
+ (void)_setConsumerIdentifier:(id)a3 forKey:(id)a4 inNamespace:(id)a5 accountID:(id)a6 bag:(id)a7 at:(id)a8 serverProvidedAt:(id)a9;
+ (void)cleanupIdentifiers;
+ (void)removeIdentifiersForAccount:(id)a3;
+ (void)removeIdentifiersForStore:(id)a3;
- (ACAccount)account;
- (AMSMetricsIdentifierStore)init;
- (AMSProcessInfo)clientInfo;
- (BOOL)includeAccountMatchStatus;
- (BOOL)isAccountValidForKey:(id)a3 activeItunesAccountDSID:(id *)a4;
- (BOOL)isActiveITunesAccountRequired;
- (NSString)domain;
- (double)resetInterval;
- (id)_generateEventFieldsForKeys:(id)a3 date:(id)a4;
- (id)_identifierInfoForKey:(id)a3 storeInfo:(id)a4 period:(int64_t)a5 inDatabase:(id)a6 date:(id)a7 setValue:(id)a8 lastSyncDate:(id)a9 needsToSync:(BOOL *)a10 error:(id *)a11;
- (id)_identifiersForKeys:(id)a3 currentDate:(id)a4;
- (id)generateEventFieldsForKeys:(id)a3;
- (id)generateEventFieldsForKeys:(id)a3 date:(id)a4;
- (id)identifierForKey:(id)a3;
- (id)identifierIfExistsForKey:(id)a3;
- (void)_generateFutureIdentifiersIfNeededForKeys:(id)a3 storeInfo:(id)a4 afterPeriod:(int64_t)a5 inDatabase:(id)a6 date:(id)a7;
- (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 forKey:(id)a5;
- (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 lastSyncDate:(id)a5 forKey:(id)a6;
- (void)reset;
- (void)setAccount:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDomain:(id)a3;
- (void)setIdentifier:(id)a3 forKey:(id)a4;
- (void)setIncludeAccountMatchStatus:(BOOL)a3;
- (void)setIsActiveITunesAccountRequired:(BOOL)a3;
- (void)setResetInterval:(double)a3;
@end

@implementation AMSMetricsIdentifierStore

id __60__AMSMetricsIdentifierStore__parametersForBag_bagNamespace___block_invoke(uint64_t a1, void *a2)
{
  v8 = [a2 objectForKey:*(void *)(a1 + 32)];
  if (v8)
  {
    v9 = +[AMSPromise promiseWithResult:v8];
  }
  else
  {
    v10 = AMSErrorWithFormat(2, @"Metrics Identifier Store Failure", @"Failed to find metrics identifiers parameters for namespace: %@", v3, v4, v5, v6, v7, *(void *)(a1 + 32));
    v9 = +[AMSPromise promiseWithError:v10];
  }
  return v9;
}

uint64_t __131__AMSMetricsIdentifierStore__identifierStoreInfoForKeys_inDatabase_date_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 crossDeviceSync];
}

+ (id)_accountIdentifierForAccount:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "ams_DSID");
  uint64_t v4 = [v3 stringValue];

  if (!v4 || [(__CFString *)v4 integerValue] <= 0)
  {

    uint64_t v4 = &stru_1EDCA7308;
  }
  return v4;
}

- (void)setIsActiveITunesAccountRequired:(BOOL)a3
{
  self->_isActiveITunesAccountRequired = a3;
}

- (void)setIncludeAccountMatchStatus:(BOOL)a3
{
  self->_includeAccountMatchStatus = a3;
}

uint64_t __131__AMSMetricsIdentifierStore__identifierStoreInfoForKeys_inDatabase_date_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = *a2;
  uint64_t v5 = +[AMSLogConfig sharedMetricsConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    int v37 = 138543874;
    uint64_t v38 = v7;
    __int16 v39 = 2114;
    v40 = v8;
    __int16 v41 = 2114;
    *(void *)v42 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found ID store in db: %{public}@", (uint8_t *)&v37, 0x20u);
  }
  if (v4 && ![v4 deleted])
  {
    int v16 = 0;
  }
  else
  {
    v9 = objc_opt_new();

    [v9 setAccount:*(void *)(a1 + 32)];
    [v9 setStoreKey:*(void *)(a1 + 40)];
    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [v10 UUIDString];
    [v9 setStoreUUID:v11];

    [v9 setStarted:*(void *)(a1 + 48)];
    id v4 = v9;
    *a2 = v4;
    v12 = +[AMSLogConfig sharedMetricsConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      int v37 = 138543874;
      uint64_t v38 = v14;
      __int16 v39 = 2114;
      v40 = v15;
      __int16 v41 = 2114;
      *(void *)v42 = v4;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Created new ID store in db: %{public}@", (uint8_t *)&v37, 0x20u);
    }
    int v16 = 1;
  }
  int v17 = [v4 crossDeviceSync];
  int v18 = *(unsigned __int8 *)(a1 + 96);
  if (v18 != v17)
  {
    [v4 setCrossDeviceSync:v18 != 0];
    v21 = +[AMSLogConfig sharedMetricsConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      int v25 = *(unsigned __int8 *)(a1 + 96);
      v26 = [*(id *)(a1 + 56) bundleIdentifier];
      uint64_t v27 = *(void *)(a1 + 64);
      int v37 = 138544386;
      uint64_t v38 = v23;
      __int16 v39 = 2114;
      v40 = v24;
      __int16 v41 = 1026;
      *(_DWORD *)v42 = v25;
      *(_WORD *)&v42[4] = 2114;
      *(void *)&v42[6] = v26;
      *(_WORD *)&v42[14] = 2114;
      *(void *)&v42[16] = v27;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store cross device sync (sync: %{public}d, client: %{public}@, domain: %{public}@)", (uint8_t *)&v37, 0x30u);
    }
    [v4 resetInterval];
    if (v28 == *(double *)(a1 + 80)) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  [v4 resetInterval];
  if (v19 != *(double *)(a1 + 80))
  {
LABEL_22:
    objc_msgSend(v4, "setResetInterval:");
    v29 = +[AMSLogConfig sharedMetricsConfig];
    if (!v29)
    {
      v29 = +[AMSLogConfig sharedConfig];
    }
    v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = objc_opt_class();
      v32 = AMSLogKey();
      uint64_t v33 = *(void *)(a1 + 80);
      v34 = [*(id *)(a1 + 56) bundleIdentifier];
      uint64_t v35 = *(void *)(a1 + 64);
      int v37 = 138544386;
      uint64_t v38 = v31;
      __int16 v39 = 2114;
      v40 = v32;
      __int16 v41 = 2050;
      *(void *)v42 = v33;
      *(_WORD *)&v42[8] = 2114;
      *(void *)&v42[10] = v34;
      *(_WORD *)&v42[18] = 2114;
      *(void *)&v42[20] = v35;
      _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store reset interval (interval: %{public}f, client: %{public}@, domain: %{public}@)", (uint8_t *)&v37, 0x34u);
    }
    goto LABEL_27;
  }
  if (v16)
  {
LABEL_27:
    [v4 setModified:*(void *)(a1 + 48)];
    **(unsigned char **)(a1 + 88) |= [v4 crossDeviceSync];
    uint64_t v20 = 1;
    goto LABEL_28;
  }
  uint64_t v20 = 0;
LABEL_28:

  return v20;
}

uint64_t __124__AMSMetricsIdentifierStore__identifierInfoForKey_storeInfo_period_inDatabase_date_setValue_lastSyncDate_needsToSync_error___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = *a2;
  uint64_t v5 = +[AMSLogConfig sharedMetricsConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = v7;
    __int16 v60 = 2114;
    v61 = v8;
    __int16 v62 = 2114;
    *(void *)v63 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found ID in db: %{public}@", buf, 0x20u);
  }
  if (!v4
    || ([v4 deleted] & 1) != 0
    || ([v4 expires], (v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = v9, uint64_t v11 = [v9 compare:*(void *)(a1 + 40)], v10, v11 != 1))
  {
    v13 = objc_opt_new();

    objc_msgSend(v13, "setCrossDeviceSync:", objc_msgSend(*(id *)(a1 + 48), "crossDeviceSync"));
    [v13 setIdKey:*(void *)(a1 + 56)];
    [v13 setExpires:*(void *)(a1 + 64)];
    uint64_t v14 = [*(id *)(a1 + 72) storeUUID];
    [v13 setStoreUUID:v14];

    v15 = [*(id *)(a1 + 48) name];
    [v13 setName:v15];

    if (*(void *)(a1 + 80))
    {
      objc_msgSend(v13, "setValue:");
    }
    else
    {
      int v16 = [MEMORY[0x1E4F29128] UUID];
      int v17 = objc_msgSend(v16, "ams_base62String");
      [v13 setValue:v17];
    }
    [v13 setLastSync:*(void *)(a1 + 88)];
    id v4 = v13;
    *a2 = v4;
    int v18 = +[AMSLogConfig sharedMetricsConfig];
    if (!v18)
    {
      int v18 = +[AMSLogConfig sharedConfig];
    }
    double v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v20;
      __int16 v60 = 2114;
      v61 = v21;
      __int16 v62 = 2114;
      *(void *)v63 = v4;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Created new ID in db: %{public}@", buf, 0x20u);
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  v22 = *(void **)(a1 + 80);
  if (v22)
  {
    uint64_t v23 = [v4 value];
    char v24 = [v22 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {
      [v4 setValue:*(void *)(a1 + 80)];
      int v25 = +[AMSLogConfig sharedMetricsConfig];
      if (!v25)
      {
        int v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_opt_class();
        double v28 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v27;
        __int16 v60 = 2114;
        v61 = v28;
        __int16 v62 = 2114;
        *(void *)v63 = v4;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updated ID value in db: %{public}@", buf, 0x20u);
      }
      int v12 = 1;
    }
  }
  v29 = *(void **)(a1 + 88);
  if (v29)
  {
    v30 = [v4 lastSync];
    char v31 = [v29 isEqualToDate:v30];

    if ((v31 & 1) == 0)
    {
      [v4 setLastSync:*(void *)(a1 + 88)];
      int v12 = 1;
    }
  }
  int v32 = [v4 crossDeviceSync];
  if (v32 == [*(id *)(a1 + 48) crossDeviceSync])
  {
    __int16 v41 = (id *)(a1 + 64);
    if (!*(void *)(a1 + 64))
    {
      if (v12) {
        goto LABEL_48;
      }
      goto LABEL_42;
    }
  }
  else
  {
    objc_msgSend(v4, "setCrossDeviceSync:", objc_msgSend(*(id *)(a1 + 48), "crossDeviceSync"));
    uint64_t v33 = +[AMSLogConfig sharedMetricsConfig];
    if (!v33)
    {
      uint64_t v33 = +[AMSLogConfig sharedConfig];
    }
    v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = objc_opt_class();
      v57 = AMSLogKey();
      int v36 = [*(id *)(a1 + 48) crossDeviceSync];
      int v37 = [*(id *)(a1 + 48) name];
      uint64_t v38 = [*(id *)(a1 + 32) clientInfo];
      __int16 v39 = [v38 bundleIdentifier];
      v40 = [*(id *)(a1 + 32) domain];
      *(_DWORD *)buf = 138544642;
      uint64_t v59 = v35;
      __int16 v60 = 2114;
      v61 = v57;
      __int16 v62 = 1026;
      *(_DWORD *)v63 = v36;
      *(_WORD *)&v63[4] = 2114;
      *(void *)&v63[6] = v37;
      __int16 v64 = 2114;
      v65 = v39;
      __int16 v66 = 2114;
      v67 = v40;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier cross device sync (sync: %{public}d, key: %{public}@, client: %{public}@, domain: %{public}@)", buf, 0x3Au);
    }
    __int16 v41 = (id *)(a1 + 64);
    if (!*(void *)(a1 + 64)) {
      goto LABEL_48;
    }
    int v12 = 1;
  }
  uint64_t v42 = [v4 expires];
  if (!v42) {
    goto LABEL_52;
  }
  uint64_t v43 = (void *)v42;
  [*v41 timeIntervalSinceReferenceDate];
  double v45 = v44;
  v46 = [v4 expires];
  [v46 timeIntervalSinceReferenceDate];
  double v48 = v47;

  if (v45 < v48)
  {
LABEL_52:
    v49 = [v4 serverProvidedAt];

    if (!v49)
    {
      [v4 setExpires:*v41];
      v51 = +[AMSLogConfig sharedMetricsConfig];
      if (!v51)
      {
        v51 = +[AMSLogConfig sharedConfig];
      }
      v52 = [v51 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = objc_opt_class();
        v54 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v53;
        __int16 v60 = 2114;
        v61 = v54;
        __int16 v62 = 2114;
        *(void *)v63 = v4;
        _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updated expiry for ID in db: %{public}@", buf, 0x20u);
      }
      goto LABEL_48;
    }
  }
  if (v12)
  {
LABEL_48:
    v55 = [MEMORY[0x1E4F1C9C8] now];
    [v4 setModified:v55];

    **(unsigned char **)(a1 + 96) |= [v4 crossDeviceSync];
    uint64_t v50 = 1;
    goto LABEL_49;
  }
LABEL_42:
  uint64_t v50 = 0;
LABEL_49:

  return v50;
}

+ (id)_generateStoreKeyForAccount:(id)a3 domain:(id)a4 clientInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v11 = objc_msgSend(v7, "ams_DSID");

  if (v11)
  {
    int v12 = objc_msgSend(v7, "ams_DSID");
    [v10 appendFormat:@"%@", v12];
  }
  if (v9)
  {
    id v13 = v9;
  }
  else
  {
    id v13 = +[AMSProcessInfo currentProcess];
  }
  uint64_t v14 = v13;
  v15 = [v13 bundleIdentifier];

  if (v15)
  {
    int v16 = [v14 bundleIdentifier];
    [v10 appendFormat:@"%@", v16];
  }
  if ([v8 length]) {
    [v10 appendFormat:@".%@", v8];
  }
  if (![v10 length])
  {
    int v17 = [MEMORY[0x1E4F28F80] processInfo];
    int v18 = [v17 processName];
    [v10 appendFormat:@"%@", v18];
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)identifierForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v12 count:1];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", v12, v13);

  id v8 = [(AMSMetricsIdentifierStore *)self _identifiersForKeys:v6 currentDate:v7];

  id v9 = [v8 firstObject];
  id v10 = [v9 value];

  return v10;
}

- (id)_identifierInfoForKey:(id)a3 storeInfo:(id)a4 period:(int64_t)a5 inDatabase:(id)a6 date:(id)a7 setValue:(id)a8 lastSyncDate:(id)a9 needsToSync:(BOOL *)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a6;
  [(AMSMetricsIdentifierStore *)self resetInterval];
  if (v22 == 0.0)
  {
    v26 = 0;
    uint64_t v27 = a10;
  }
  else
  {
    uint64_t v23 = [v17 started];
    if (v23)
    {
      char v24 = [v17 started];
      [(AMSMetricsIdentifierStore *)self resetInterval];
      v26 = [v24 dateByAddingTimeInterval:v25 * (double)(a5 + 1)];
    }
    else
    {
      v26 = 0;
    }
    uint64_t v27 = a10;
  }
  double v28 = objc_opt_class();
  [(AMSMetricsIdentifierStore *)self resetInterval];
  v29 = objc_msgSend(v28, "_generateIdentifierKey:storeInfo:period:resetInterval:", v16, v17, a5);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __124__AMSMetricsIdentifierStore__identifierInfoForKey_storeInfo_period_inDatabase_date_setValue_lastSyncDate_needsToSync_error___block_invoke;
  v40[3] = &unk_1E55A4858;
  v40[4] = self;
  id v41 = v18;
  id v42 = v16;
  id v43 = v29;
  id v44 = v26;
  id v45 = v17;
  id v46 = v19;
  id v47 = v20;
  double v48 = v27;
  id v30 = v20;
  id v31 = v19;
  id v32 = v17;
  id v33 = v26;
  id v34 = v29;
  id v35 = v16;
  id v36 = v18;
  int v37 = [v21 identifierForKey:v34 updateMaybe:v40 error:a11];

  return v37;
}

void __61__AMSMetricsIdentifierStore__identifiersForKeys_currentDate___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 32) account];
  uint64_t v54 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:v3];

  id v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) account];
  id v9 = [*(id *)(a1 + 32) clientInfo];
  id v10 = [*(id *)(a1 + 32) domain];
  [*(id *)(a1 + 32) resetInterval];
  id v65 = 0;
  v58 = v2;
  uint64_t v11 = objc_msgSend(v4, "_identifierStoreInfoForKeys:inDatabase:date:needsToSync:account:clientInfo:domain:resetInterval:error:", v7, v2, v5, v6, v8, v9, v10, &v65);
  id v12 = v65;

  if (v12 || !v11)
  {
    id v21 = +[AMSLogConfig sharedMetricsConfig];
    if (!v21)
    {
      id v21 = +[AMSLogConfig sharedConfig];
    }
    id v32 = [v21 OSLogObject];
    id v33 = (void *)v54;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      loga = v32;
      uint64_t v34 = objc_opt_class();
      id v35 = AMSLogKey();
      id v36 = [*(id *)(a1 + 32) clientInfo];
      int v37 = [v36 bundleIdentifier];
      uint64_t v38 = [*(id *)(a1 + 32) domain];
      __int16 v39 = AMSLogableError(v12);
      *(_DWORD *)buf = 138544642;
      uint64_t v67 = v34;
      id v32 = loga;
      __int16 v68 = 2114;
      v69 = v35;
      __int16 v70 = 2112;
      uint64_t v71 = v54;
      __int16 v72 = 2114;
      v73 = v37;
      __int16 v74 = 2114;
      v75 = v38;
      __int16 v76 = 2114;
      v77 = v39;
      _os_log_impl(&dword_18D554000, loga, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);
    }
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    [*(id *)(a1 + 32) resetInterval];
    double v15 = v14;
    v55 = v11;
    id v16 = [v11 started];
    uint64_t v17 = [v13 _periodFrom:v16 storeInfoStarted:*(void *)(a1 + 48) now:v15];

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v80 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = 0;
      uint64_t v22 = *(void *)v62;
      while (2)
      {
        uint64_t v23 = 0;
        char v24 = v21;
        do
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(v18);
          }
          double v25 = *(void **)(*((void *)&v61 + 1) + 8 * v23);
          v26 = *(void **)(a1 + 32);
          id v60 = v24;
          int v27 = [v26 isAccountValidForKey:v25 activeItunesAccountDSID:&v60];
          id v21 = v60;

          if (v27)
          {
            double v28 = *(void **)(a1 + 32);
            uint64_t v29 = *(void *)(a1 + 48);
            uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
            id v59 = 0;
            id v31 = [v28 _identifierInfoForKey:v25 storeInfo:v55 period:v17 inDatabase:v58 date:v29 setValue:0 lastSyncDate:0 needsToSync:v30 error:&v59];
            id v12 = v59;
            if (v12 || !v31)
            {
              v40 = +[AMSLogConfig sharedMetricsConfig];
              if (!v40)
              {
                v40 = +[AMSLogConfig sharedConfig];
              }
              id v41 = [v40 OSLogObject];
              id v33 = (void *)v54;
              uint64_t v11 = v55;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                uint64_t v50 = objc_opt_class();
                uint64_t v53 = AMSLogKey();
                v51 = [*(id *)(a1 + 32) clientInfo];
                double v48 = [v51 bundleIdentifier];
                id v47 = [*(id *)(a1 + 32) domain];
                [v25 name];
                id v42 = v52 = v41;
                v49 = AMSLogableError(v12);
                *(_DWORD *)buf = 138544898;
                uint64_t v67 = v50;
                __int16 v68 = 2114;
                v69 = v53;
                __int16 v70 = 2112;
                uint64_t v71 = v54;
                __int16 v72 = 2114;
                v73 = v48;
                __int16 v74 = 2114;
                v75 = v47;
                __int16 v76 = 2114;
                v77 = v42;
                __int16 v78 = 2114;
                v79 = v49;
                _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

                id v41 = v52;
              }

              id v32 = log;
              goto LABEL_32;
            }
            [log addObject:v31];
          }
          ++v23;
          char v24 = v21;
        }
        while (v20 != v23);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v61 objects:v80 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v21 = 0;
    }

    id v32 = log;
    if ([*(id *)(a1 + 32) includeAccountMatchStatus] && -[NSObject count](log, "count"))
    {
      id v43 = objc_alloc_init(AMSMetricsIdentifierInfo);
      [(AMSMetricsIdentifierInfo *)v43 setName:@"xpAccountsMatch"];
      [(AMSMetricsIdentifierInfo *)v43 setCrossDeviceSync:0];
      id v44 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      int v45 = objc_msgSend(v44, "ams_isActiveAccountCombined");

      if (v45) {
        id v46 = @"true";
      }
      else {
        id v46 = @"false";
      }
      [(AMSMetricsIdentifierInfo *)v43 setValue:v46];
      [log addObject:v43];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), log);
    uint64_t v11 = v55;
    [*(id *)(a1 + 32) _generateFutureIdentifiersIfNeededForKeys:*(void *)(a1 + 40) storeInfo:v55 afterPeriod:v17 inDatabase:v58 date:*(void *)(a1 + 48)];
    id v12 = 0;
    id v33 = (void *)v54;
  }
LABEL_32:
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (ACAccount)account
{
  return self->_account;
}

+ (id)_identifierStoreInfoForKeys:(id)a3 inDatabase:(id)a4 date:(id)a5 needsToSync:(BOOL *)a6 account:(id)a7 clientInfo:(id)a8 domain:(id)a9 resetInterval:(double)a10 error:(id *)a11
{
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:v20];
  char v24 = [a1 _generateStoreKeyForAccount:v20 domain:v19 clientInfo:v18];

  double v25 = objc_msgSend(v22, "ac_firstObjectPassingTest:", &__block_literal_global_55_2);

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __131__AMSMetricsIdentifierStore__identifierStoreInfoForKeys_inDatabase_date_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2;
  v34[3] = &unk_1E55A48C8;
  id v35 = v23;
  id v36 = v24;
  BOOL v43 = v25 != 0;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = a1;
  double v41 = a10;
  id v42 = a6;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = v24;
  id v30 = v23;
  id v31 = [v21 identifierStoreForKey:v29 updateMaybe:v34 error:a11];

  return v31;
}

- (BOOL)isAccountValidForKey:(id)a3 activeItunesAccountDSID:(id *)a4
{
  id v6 = a3;
  if ([(AMSMetricsIdentifierStore *)self isActiveITunesAccountRequired]
    || [v6 isActiveITunesAccountRequired])
  {
    uint64_t v7 = [(AMSMetricsIdentifierStore *)self account];
    id v8 = objc_msgSend(v7, "ams_DSID");

    char v9 = v8 != 0;
    if (v8)
    {
      id v10 = [(AMSMetricsIdentifierStore *)self account];
      if ((objc_msgSend(v10, "ams_isiTunesAccount") & 1) == 0)
      {

        if (!a4) {
          goto LABEL_12;
        }
LABEL_10:
        if (*a4)
        {
          id v13 = *a4;
          goto LABEL_13;
        }
LABEL_12:
        double v14 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        double v15 = objc_msgSend(v14, "ams_activeiTunesAccount");
        objc_msgSend(v15, "ams_DSID");
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!a4)
        {
LABEL_14:
          if (v13) {
            char v9 = [v8 isEqualToNumber:v13];
          }
          else {
            char v9 = 0;
          }

          goto LABEL_18;
        }
LABEL_13:
        id v13 = v13;
        *a4 = v13;
        goto LABEL_14;
      }
      uint64_t v11 = [(AMSMetricsIdentifierStore *)self account];
      char v12 = [v11 isActive];

      if ((v12 & 1) == 0)
      {
        if (!a4) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  char v9 = 1;
LABEL_19:

  return v9;
}

- (BOOL)isActiveITunesAccountRequired
{
  return self->_isActiveITunesAccountRequired;
}

- (NSString)domain
{
  return self->_domain;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

+ (int64_t)_periodFrom:(double)a3 storeInfoStarted:(id)a4 now:(id)a5
{
  if (a3 == 0.0 || a4 == 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    [a5 timeIntervalSinceDate:a4];
    uint64_t v8 = (uint64_t)(v7 / a3);
  }
  return v8 & ~(v8 >> 63);
}

- (BOOL)includeAccountMatchStatus
{
  return self->_includeAccountMatchStatus;
}

- (void)_generateFutureIdentifiersIfNeededForKeys:(id)a3 storeInfo:(id)a4 afterPeriod:(int64_t)a5 inDatabase:(id)a6 date:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(AMSMetricsIdentifierStore *)self resetInterval];
  if (v16 != 0.0)
  {
    id v17 = [v13 started];

    if (v17)
    {
      id v18 = +[AMSMetricsIdentifierStore _sharedQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __109__AMSMetricsIdentifierStore__generateFutureIdentifiersIfNeededForKeys_storeInfo_afterPeriod_inDatabase_date___block_invoke;
      v19[3] = &unk_1E55A4830;
      id v20 = v15;
      id v21 = v13;
      id v22 = self;
      int64_t v25 = a5;
      id v23 = v12;
      id v24 = v14;
      dispatch_async(v18, v19);
    }
  }
}

- (id)_identifiersForKeys:(id)a3 currentDate:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__47;
  id v32 = __Block_byref_object_dispose__47;
  id v33 = 0;
  uint64_t v24 = 0;
  int64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v8 = +[AMSMetricsIdentifierStore _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AMSMetricsIdentifierStore__identifiersForKeys_currentDate___block_invoke;
  block[3] = &unk_1E55A4880;
  block[4] = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  id v22 = &v24;
  id v23 = &v28;
  dispatch_sync(v8, block);

  if (*((unsigned char *)v25 + 24)) {
    id v11 = +[AMSMetricsIdentifierStore _sync];
  }
  id v12 = +[AMSLogConfig sharedMetricsConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = objc_opt_class();
    id v15 = AMSLogKey();
    uint64_t v16 = v29[5];
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = v14;
    __int16 v36 = 2114;
    id v37 = v15;
    __int16 v38 = 2114;
    id v39 = v9;
    __int16 v40 = 2114;
    uint64_t v41 = v16;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] -_identifiersForKeys:currentDate: Providing for keys %{public}@: %{public}@", buf, 0x2Au);
  }
  id v17 = (id)v29[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

+ (id)_sharedQueue
{
  if (qword_1EB38DDF8 != -1) {
    dispatch_once(&qword_1EB38DDF8, &__block_literal_global_81_1);
  }
  id v2 = (void *)qword_1EB38DE00;
  return v2;
}

void __109__AMSMetricsIdentifierStore__generateFutureIdentifiersIfNeededForKeys_storeInfo_afterPeriod_inDatabase_date___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) dateByAddingTimeInterval:604800.0];
  uint64_t v3 = [*(id *)(a1 + 40) started];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;
  [*(id *)(a1 + 48) resetInterval];
  uint64_t v7 = (uint64_t)(v5 / v6);

  if (*(void *)(a1 + 72) + 7 >= (v7 & ~(v7 >> 63))) {
    uint64_t v8 = v7 & ~(v7 >> 63);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 72) + 7;
  }
  if (qword_1EB38DDE8 != -1) {
    dispatch_once(&qword_1EB38DDE8, &__block_literal_global_41_0);
  }
  objc_storeStrong((id *)&_MergedGlobals_131, (id)qword_1EB38DDF0);
  id v9 = (void *)_MergedGlobals_131;
  id v10 = [*(id *)(a1 + 40) storeUUID];
  id v11 = [v9 objectForKey:v10];
  uint64_t v12 = [v11 integerValue];
  if (!v12) {
    uint64_t v12 = *(void *)(a1 + 72);
  }

  if (v8 > v12)
  {
    id v13 = (void *)_MergedGlobals_131;
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    id v15 = [*(id *)(a1 + 40) storeUUID];
    [v13 setObject:v14 forKey:v15];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v33 = v2;
      char v19 = 0;
      uint64_t v20 = *(void *)v38;
      id obj = v16;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v22 crossDeviceSync])
          {
            uint64_t v23 = v8;
            do
            {
              char v36 = 0;
              uint64_t v25 = *(void *)(a1 + 40);
              uint64_t v24 = *(void **)(a1 + 48);
              uint64_t v26 = *(void *)(a1 + 64);
              uint64_t v27 = *(void *)(a1 + 32);
              uint64_t v35 = 0;
              id v28 = (id)[v24 _identifierInfoForKey:v22 storeInfo:v25 period:v23 inDatabase:v26 date:v27 setValue:0 lastSyncDate:0 needsToSync:&v36 error:&v35];
              if (v35) {
                BOOL v29 = 1;
              }
              else {
                BOOL v29 = v36 == 0;
              }
              int v30 = !v29;
              v19 |= v30;
              --v23;
            }
            while (v30 == 1 && v23 > v12);
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v18);

      id v2 = v33;
      if (v19) {
        id v32 = +[AMSMetricsIdentifierStore _sync];
      }
    }
    else
    {
    }
  }
}

+ (id)_generateIdentifierKey:(id)a3 storeInfo:(id)a4 period:(int64_t)a5 resetInterval:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 storeKey];
  uint64_t v12 = [v10 storeUUID];
  if ([v11 isEqual:v12])
  {
    char v13 = [v9 crossDeviceSync];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = NSString;
      id v15 = [v10 storeUUID];
      id v16 = [v9 name];
      [v14 stringWithFormat:@"%@_%@", v15, v16, v20, v21];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v17 = NSString;
  id v15 = [v10 storeUUID];
  id v16 = [v9 name];
  [v17 stringWithFormat:@"%@_%@_%llx_%lx", v15, v16, (uint64_t)a6, a5];
  uint64_t v18 = LABEL_6:;

  return v18;
}

+ (id)_sync
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[AMSLogConfig sharedMetricsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  double v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    double v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    char v19 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] CloudKit Syncing", buf, 0x16u);
  }
  if (qword_1EB38DE08 != -1) {
    dispatch_once(&qword_1EB38DE08, &__block_literal_global_84);
  }
  if (qword_1EB38DE10)
  {
    id v7 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    id v8 = a1;
    objc_sync_enter(v8);
    if (!qword_1EB38DE18)
    {
      id v9 = objc_alloc_init(AMSEngagement);
      uint64_t v10 = [(AMSEngagement *)v9 syncMetricsIdentifiers];
      id v11 = (void *)qword_1EB38DE18;
      qword_1EB38DE18 = v10;

      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      char v13 = [v8 _sharedQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__AMSMetricsIdentifierStore__sync__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v8;
      dispatch_after(v12, v13, block);
    }
    objc_sync_exit(v8);

    id v7 = (id)qword_1EB38DE18;
  }
  return v7;
}

id __75__AMSMetricsIdentifierStore_identifierForAccount_bag_bagNamespace_keyName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 48) _identifierStoreWithAccount:*(void *)(a1 + 32) parameters:v3];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"crossDeviceKeys"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = +[AMSMetricsIdentifierKey keyWithName:crossDeviceSync:](AMSMetricsIdentifierKey, "keyWithName:crossDeviceSync:", *(void *)(a1 + 40), [v6 containsObject:*(void *)(a1 + 40)]);
  id v8 = [v3 objectForKeyedSubscript:@"keysThatRequireActiveITunesAccount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  objc_msgSend(v7, "setIsActiveITunesAccountRequired:", objc_msgSend(v9, "containsObject:", *(void *)(a1 + 40)));
  uint64_t v10 = [v4 identifierForKey:v7];
  id v11 = +[AMSPromise promiseWithResult:v10];

  return v11;
}

id __73__AMSMetricsIdentifierStore_identifierStoreWithAccount_bagNamespace_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 40) _identifierStoreWithAccount:*(void *)(a1 + 32) parameters:a2];
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

+ (id)_identifierStoreWithAccount:(id)a3 parameters:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:@"bundleIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v5 objectForKeyedSubscript:@"domain"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  id v11 = [v5 objectForKeyedSubscript:@"resetInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  char v13 = objc_alloc_init(AMSMetricsIdentifierStore);
  [(AMSMetricsIdentifierStore *)v13 setAccount:v6];

  if (v8)
  {
    uint64_t v14 = [[AMSProcessInfo alloc] initWithBundleIdentifier:v8];
    [(AMSMetricsIdentifierStore *)v13 setClientInfo:v14];
  }
  [(AMSMetricsIdentifierStore *)v13 setDomain:v10];
  -[AMSMetricsIdentifierStore setResetInterval:](v13, "setResetInterval:", (double)[v12 integerValue]);

  return v13;
}

- (void)setClientInfo:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (AMSMetricsIdentifierStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSMetricsIdentifierStore;
  id v2 = [(AMSMetricsIdentifierStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AMSMetricsIdentifierStore _database];
    database = v2->_database;
    v2->_database = (AMSMetricsDatabase *)v3;
  }
  return v2;
}

+ (id)_database
{
  return +[AMSMetricsDatabase sharedDatabaseWithContainerId:@"com.apple.AppleMediaServices.meta"];
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (void)setDomain:(id)a3
{
}

+ (id)identifierForAccount:(id)a3 bag:(id)a4 bagNamespace:(id)a5 keyName:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a1 _parametersForBag:a4 bagNamespace:a5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__AMSMetricsIdentifierStore_identifierForAccount_bag_bagNamespace_keyName___block_invoke;
  v17[3] = &unk_1E55A4748;
  id v19 = v11;
  id v20 = a1;
  id v18 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = [v12 thenWithBlock:v17];

  return v15;
}

+ (AMSMetricsIdentifierStore)identifierStoreWithAccount:(id)a3 bagNamespace:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _parametersForBag:a5 bagNamespace:a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__AMSMetricsIdentifierStore_identifierStoreWithAccount_bagNamespace_bag___block_invoke;
  v13[3] = &unk_1E55A3D40;
  id v14 = v8;
  id v15 = a1;
  id v10 = v8;
  id v11 = [v9 thenWithBlock:v13];

  return (AMSMetricsIdentifierStore *)v11;
}

+ (id)_parametersForBag:(id)a3 bagNamespace:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 dictionaryForKey:@"metrics-identifiers"];
  id v7 = [v6 valuePromise];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__AMSMetricsIdentifierStore__parametersForBag_bagNamespace___block_invoke;
  v11[3] = &unk_1E55A0FA0;
  id v12 = v5;
  id v8 = v5;
  id v9 = [v7 thenWithBlock:v11];

  return v9;
}

- (id)generateEventFieldsForKeys:(id)a3 date:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  [(AMSMetricsIdentifierStore *)self resetInterval];
  if (fabs(v10) > v11 + v11)
  {
    id v12 = +[AMSLogConfig sharedMetricsConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Date is out of bounds, using the current date.", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];

    id v7 = (id)v16;
  }
  uint64_t v17 = [(AMSMetricsIdentifierStore *)self _generateEventFieldsForKeys:v6 date:v7];

  return v17;
}

- (id)generateEventFieldsForKeys:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  id v7 = [(AMSMetricsIdentifierStore *)self _generateEventFieldsForKeys:v5 date:v6];

  return v7;
}

- (id)_generateEventFieldsForKeys:(id)a3 date:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v4 = [(AMSMetricsIdentifierStore *)self _identifiersForKeys:a3 currentDate:a4];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "populateDictionary:", v5, (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t __41__AMSMetricsIdentifierStore__sharedQueue__block_invoke()
{
  qword_1EB38DE00 = (uint64_t)dispatch_queue_create("com.apple.AMSMetricsIdentifierStore", 0);
  return MEMORY[0x1F41817F8]();
}

void __109__AMSMetricsIdentifierStore__generateFutureIdentifiersIfNeededForKeys_storeInfo_afterPeriod_inDatabase_date___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  [v0 setCountLimit:100];
  v1 = (void *)qword_1EB38DDF0;
  qword_1EB38DDF0 = (uint64_t)v0;
}

uint64_t __34__AMSMetricsIdentifierStore__sync__block_invoke()
{
  qword_1EB38DE10 = NSClassFromString(&cfstr_Xctest.isa);
  return MEMORY[0x1F41817F8]();
}

+ (void)cleanupIdentifiers
{
  uint64_t v3 = [a1 _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AMSMetricsIdentifierStore_cleanupIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __47__AMSMetricsIdentifierStore_cleanupIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _database];
  uint64_t v3 = +[AMSLogConfig sharedMetricsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  double v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cleaning up identifiers", buf, 0x16u);
  }
  id v13 = 0;
  [v2 cleanupInvalidIdentifiersWithError:&v13];
  id v7 = v13;
  if (v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedMetricsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      double v11 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cleanup identifiers. %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v12 = (id)[*(id *)(a1 + 32) _sync];
  }
}

+ (void)removeIdentifiersForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _sharedQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__AMSMetricsIdentifierStore_removeIdentifiersForAccount___block_invoke;
  v7[3] = &unk_1E55A1998;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__AMSMetricsIdentifierStore_removeIdentifiersForAccount___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 40) _accountIdentifierForAccount:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) _database];
  id v4 = +[AMSLogConfig sharedMetricsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v2;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing identifiers for account: %@", buf, 0x20u);
  }
  id v15 = 0;
  [v3 removeIdentifiersForAccount:v2 error:&v15];
  id v8 = v15;
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedMetricsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      id v13 = AMSLogableError(v8);
      *(_DWORD *)buf = 138544130;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      __int16 v22 = 2114;
      uint64_t v23 = v13;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove identifiers for account: %@. %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    id v14 = (id)[*(id *)(a1 + 40) _sync];
  }
}

+ (void)removeIdentifiersForStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _sharedQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AMSMetricsIdentifierStore_removeIdentifiersForStore___block_invoke;
  v7[3] = &unk_1E55A1998;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__AMSMetricsIdentifierStore_removeIdentifiersForStore___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 40) _database];
  uint64_t v3 = +[AMSLogConfig sharedMetricsConfig];
  if (!v3)
  {
    uint64_t v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v5;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing identifiers for store: %@", buf, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v17 = 0;
  [v2 removeIdentifiersForStore:v8 error:&v17];
  id v9 = v17;
  if (v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedMetricsConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = AMSLogableError(v9);
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = v15;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove identifiers for store: %@. %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    id v16 = (id)[*(id *)(a1 + 40) _sync];
  }
}

- (void)reset
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = +[AMSMetricsIdentifierStore _sharedQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__AMSMetricsIdentifierStore_reset__block_invoke;
  v6[3] = &unk_1E559F1E0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __34__AMSMetricsIdentifierStore_reset__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  id v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 32) account];
  id v4 = [*(id *)(a1 + 32) domain];
  id v5 = [*(id *)(a1 + 32) clientInfo];
  uint64_t v27 = [v2 _generateStoreKeyForAccount:v3 domain:v4 clientInfo:v5];

  id v6 = [*(id *)(a1 + 32) account];
  id v7 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:v6];

  uint64_t v8 = +[AMSLogConfig sharedMetricsConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = objc_msgSend(v8, "OSLogObject", v27);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    AMSLogKey();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [*(id *)(a1 + 32) clientInfo];
    id v13 = [v12 bundleIdentifier];
    uint64_t v14 = [*(id *)(a1 + 32) domain];
    *(_DWORD *)buf = 138544386;
    uint64_t v38 = v10;
    __int16 v39 = 2114;
    id v40 = v11;
    __int16 v41 = 2112;
    uint64_t v42 = v7;
    __int16 v43 = 2114;
    id v44 = v13;
    __int16 v45 = 2114;
    id v46 = v14;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resetting identifiers (dsid: %@, client: %{public}@, domain: %{public}@)", buf, 0x34u);
  }
  id v15 = *(void **)(*(void *)(a1 + 32) + 8);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __34__AMSMetricsIdentifierStore_reset__block_invoke_30;
  v30[3] = &unk_1E55A4770;
  id v31 = *(id *)(a1 + 40);
  id v32 = &v33;
  id v29 = 0;
  id v16 = (id)[v15 identifierStoreForKey:v28 updateMaybe:v30 error:&v29];
  id v17 = v29;
  if (v17)
  {
    __int16 v18 = +[AMSLogConfig sharedMetricsConfig];
    if (!v18)
    {
      __int16 v18 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      AMSLogKey();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v22 = [*(id *)(a1 + 32) clientInfo];
      uint64_t v23 = [v22 bundleIdentifier];
      __int16 v24 = [*(id *)(a1 + 32) domain];
      uint64_t v25 = AMSLogableError(v17);
      *(_DWORD *)buf = 138544642;
      uint64_t v38 = v20;
      __int16 v39 = 2114;
      id v40 = v21;
      __int16 v41 = 2112;
      uint64_t v42 = v7;
      __int16 v43 = 2114;
      id v44 = v23;
      __int16 v45 = 2114;
      id v46 = v24;
      __int16 v47 = 2114;
      double v48 = v25;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to reset identifiers (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);
    }
  }
  else if (*((unsigned char *)v34 + 24))
  {
    id v26 = +[AMSMetricsIdentifierStore _sync];
  }

  _Block_object_dispose(&v33, 8);
}

BOOL __34__AMSMetricsIdentifierStore_reset__block_invoke_30(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*a2)
  {
    id v4 = (void *)MEMORY[0x1E4F29128];
    id v5 = v2;
    id v6 = [v4 UUID];
    id v7 = [v6 UUIDString];
    [v5 setStoreUUID:v7];

    [v5 setStarted:*(void *)(a1 + 32)];
    [v5 setModified:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v5 crossDeviceSync];
  }
  return v2 != 0;
}

- (void)setIdentifier:(id)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  id v9 = +[AMSLogConfig sharedMetricsConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    int v13 = 138544130;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting identifier: %@ (key: %{public}@)", (uint8_t *)&v13, 0x2Au);
  }
  [(AMSMetricsIdentifierStore *)self _setIdentifier:v6 withStartedDate:v8 lastSyncDate:0 forKey:v7];
}

- (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 forKey:(id)a5
{
  id v8 = a5;
  id v11 = a4;
  id v9 = a3;
  if ([v8 crossDeviceSync]) {
    id v10 = v11;
  }
  else {
    id v10 = 0;
  }
  [(AMSMetricsIdentifierStore *)self _setIdentifier:v9 withStartedDate:v11 lastSyncDate:v10 forKey:v8];
}

- (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 lastSyncDate:(id)a5 forKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v14 = +[AMSMetricsIdentifierStore _sharedQueue];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  __int16 v22 = __80__AMSMetricsIdentifierStore__setIdentifier_withStartedDate_lastSyncDate_forKey___block_invoke;
  uint64_t v23 = &unk_1E55A4798;
  __int16 v24 = self;
  id v15 = v13;
  id v25 = v15;
  id v16 = v11;
  id v26 = v16;
  id v29 = &v30;
  id v17 = v10;
  id v27 = v17;
  id v18 = v12;
  id v28 = v18;
  dispatch_sync(v14, &v20);

  if (*((unsigned char *)v31 + 24)) {
    id v19 = +[AMSMetricsIdentifierStore _sync];
  }

  _Block_object_dispose(&v30, 8);
}

void __80__AMSMetricsIdentifierStore__setIdentifier_withStartedDate_lastSyncDate_forKey___block_invoke(uint64_t a1)
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 32) account];
  uint64_t v42 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:v3];

  id v4 = objc_opt_class();
  v60[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  id v8 = [*(id *)(a1 + 32) account];
  id v9 = [*(id *)(a1 + 32) clientInfo];
  id v10 = [*(id *)(a1 + 32) domain];
  [*(id *)(a1 + 32) resetInterval];
  id v45 = 0;
  id v43 = v2;
  id v11 = objc_msgSend(v4, "_identifierStoreInfoForKeys:inDatabase:date:needsToSync:account:clientInfo:domain:resetInterval:error:", v5, v2, v6, v7, v8, v9, v10, &v45);
  id v12 = v45;

  if (v12 || !v11)
  {
    id v25 = +[AMSLogConfig sharedMetricsConfig];
    if (!v25)
    {
      id v25 = +[AMSLogConfig sharedConfig];
    }
    id v27 = [v25 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_opt_class();
      id v29 = AMSLogKey();
      uint64_t v30 = [*(id *)(a1 + 32) clientInfo];
      id v31 = [v30 bundleIdentifier];
      uint64_t v32 = [*(id *)(a1 + 32) domain];
      char v33 = AMSLogableError(v12);
      *(_DWORD *)buf = 138544642;
      uint64_t v47 = v28;
      __int16 v48 = 2114;
      uint64_t v49 = v29;
      __int16 v50 = 2112;
      id v26 = (void *)v42;
      uint64_t v51 = v42;
      __int16 v52 = 2114;
      uint64_t v53 = v31;
      __int16 v54 = 2114;
      v55 = v32;
      __int16 v56 = 2114;
      v57 = v33;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

      __int16 v24 = v43;
LABEL_17:

      goto LABEL_18;
    }
    __int16 v24 = v2;
LABEL_16:
    id v26 = (void *)v42;
    goto LABEL_17;
  }
  id v13 = objc_opt_class();
  [*(id *)(a1 + 32) resetInterval];
  double v15 = v14;
  id v16 = [v11 started];
  uint64_t v17 = [v13 _periodFrom:v16 storeInfoStarted:*(void *)(a1 + 48) now:v15];

  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
  id v44 = 0;
  __int16 v24 = v43;
  id v25 = [v18 _identifierInfoForKey:v19 storeInfo:v11 period:v17 inDatabase:v43 date:v20 setValue:v21 lastSyncDate:v22 needsToSync:v23 error:&v44];
  id v12 = v44;
  if (v12 || !v25)
  {
    id v27 = +[AMSLogConfig sharedMetricsConfig];
    if (!v27)
    {
      id v27 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v34 = [v27 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = objc_opt_class();
      uint64_t v35 = AMSLogKey();
      __int16 v41 = [*(id *)(a1 + 32) clientInfo];
      char v36 = [v41 bundleIdentifier];
      long long v37 = [*(id *)(a1 + 32) domain];
      uint64_t v38 = [*(id *)(a1 + 40) name];
      __int16 v39 = AMSLogableError(v12);
      *(_DWORD *)buf = 138544898;
      uint64_t v47 = v40;
      __int16 v48 = 2114;
      uint64_t v49 = v35;
      __int16 v50 = 2112;
      uint64_t v51 = v42;
      __int16 v52 = 2114;
      uint64_t v53 = v36;
      __int16 v54 = 2114;
      v55 = v37;
      __int16 v56 = 2114;
      v57 = v38;
      __int16 v58 = 2114;
      id v59 = v39;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

      __int16 v24 = v43;
    }

    goto LABEL_16;
  }
  id v12 = 0;
  id v26 = (void *)v42;
LABEL_18:
}

- (id)identifierIfExistsForKey:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  uint64_t v6 = objc_alloc_init(AMSMutablePromise);
  uint64_t v7 = +[AMSMetricsIdentifierStore _sync];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke;
  v20[3] = &unk_1E559F028;
  id v8 = v6;
  uint64_t v21 = v8;
  [v7 addErrorBlock:v20];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_2;
  v15[3] = &unk_1E55A4808;
  v15[4] = self;
  id v9 = v4;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  uint64_t v19 = v22;
  id v11 = v8;
  id v18 = v11;
  [v7 addFinishBlock:v15];
  id v12 = v18;
  id v13 = v11;

  _Block_object_dispose(v22, 8);
  return v13;
}

uint64_t __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_2(uint64_t a1)
{
  id v2 = +[AMSMetricsIdentifierStore _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_3;
  block[3] = &unk_1E55A47E0;
  uint64_t v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v9 = v5;
  dispatch_async(v2, block);
}

void __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_3(uint64_t a1)
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 32) account];
  v55 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:v3];

  id v4 = objc_opt_class();
  v72[0] = *(void *)(a1 + 40);
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8) + 24;
  id v8 = [*(id *)(a1 + 32) account];
  long long v9 = [*(id *)(a1 + 32) clientInfo];
  id v10 = [*(id *)(a1 + 32) domain];
  [*(id *)(a1 + 32) resetInterval];
  id v57 = 0;
  id v11 = objc_msgSend(v4, "_identifierStoreInfoForKeys:inDatabase:date:needsToSync:account:clientInfo:domain:resetInterval:error:", v5, v2, v6, v7, v8, v9, v10, &v57);
  id v12 = v57;

  __int16 v54 = v11;
  if (v12 || !v11)
  {
    long long v37 = +[AMSLogConfig sharedMetricsConfig];
    if (!v37)
    {
      long long v37 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v38 = [v37 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = AMSLogKey();
      __int16 v41 = [*(id *)(a1 + 32) clientInfo];
      [v41 bundleIdentifier];
      uint64_t v42 = v53 = v2;
      id v43 = [*(id *)(a1 + 32) domain];
      id v44 = AMSLogableError(v12);
      *(_DWORD *)buf = 138544642;
      uint64_t v59 = v39;
      __int16 v60 = 2114;
      long long v61 = v40;
      __int16 v62 = 2112;
      long long v63 = v55;
      __int16 v64 = 2114;
      id v65 = v42;
      __int16 v66 = 2114;
      uint64_t v67 = v43;
      __int16 v68 = 2114;
      v69 = v44;
      _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

      id v2 = v53;
    }

    [*(id *)(a1 + 56) finishWithError:v12];
  }
  else
  {
    id v13 = objc_opt_class();
    [*(id *)(a1 + 32) resetInterval];
    double v15 = v14;
    id v16 = [v11 started];
    uint64_t v17 = [v13 _periodFrom:v16 storeInfoStarted:*(void *)(a1 + 48) now:v15];

    id v18 = objc_opt_class();
    uint64_t v19 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) resetInterval];
    uint64_t v20 = objc_msgSend(v18, "_generateIdentifierKey:storeInfo:period:resetInterval:", v19, v11, v17);
    id v56 = 0;
    uint64_t v21 = [v2 identifierForKey:v20 updateMaybe:&__block_literal_global_92 error:&v56];
    id v12 = v56;
    if (v12)
    {
      uint64_t v22 = +[AMSLogConfig sharedMetricsConfig];
      if (!v22)
      {
        uint64_t v22 = +[AMSLogConfig sharedConfig];
      }
      char v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = objc_opt_class();
        __int16 v24 = AMSLogKey();
        __int16 v50 = [*(id *)(a1 + 32) clientInfo];
        [v50 bundleIdentifier];
        id v25 = v51 = v20;
        id v26 = [*(id *)(a1 + 32) domain];
        id v27 = [*(id *)(a1 + 40) name];
        AMSLogableError(v12);
        uint64_t v28 = v52 = v2;
        *(_DWORD *)buf = 138544898;
        uint64_t v59 = v49;
        __int16 v60 = 2114;
        long long v61 = v24;
        __int16 v62 = 2112;
        long long v63 = v55;
        __int16 v64 = 2114;
        id v65 = v25;
        __int16 v66 = 2114;
        uint64_t v67 = v26;
        __int16 v68 = 2114;
        v69 = v27;
        __int16 v70 = 2114;
        uint64_t v71 = v28;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Database failure while searching for record (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

        uint64_t v20 = v51;
        id v2 = v52;
      }
    }
    uint64_t v29 = +[AMSLogConfig sharedMetricsConfig];
    uint64_t v30 = (void *)v29;
    if (v21)
    {
      if (!v29)
      {
        uint64_t v30 = +[AMSLogConfig sharedConfig];
      }
      id v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = objc_opt_class();
        char v33 = AMSLogKey();
        uint64_t v34 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        uint64_t v59 = v32;
        __int16 v60 = 2114;
        long long v61 = v33;
        __int16 v62 = 2114;
        long long v63 = v34;
        __int16 v64 = 2114;
        id v65 = v21;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] -identifierIfExistsForKey: Providing for key: %{public}@, ID: %{public}@", buf, 0x2Au);
      }
      uint64_t v35 = *(void **)(a1 + 56);
      char v36 = [v21 value];
      [v35 finishWithResult:v36];
    }
    else
    {
      if (!v29)
      {
        uint64_t v30 = +[AMSLogConfig sharedConfig];
      }
      id v45 = [v30 OSLogObject];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v46 = objc_opt_class();
        uint64_t v47 = AMSLogKey();
        __int16 v48 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v46;
        __int16 v60 = 2114;
        long long v61 = v47;
        __int16 v62 = 2114;
        long long v63 = v48;
        _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] -identifierIfExistsForKey: Providing empty string ID for key %{public}@", buf, 0x20u);
      }
      [*(id *)(a1 + 56) finishWithResult:&stru_1EDCA7308];
    }
  }
}

uint64_t __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_35()
{
  return 0;
}

void __34__AMSMetricsIdentifierStore__sync__block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v1 = (void *)qword_1EB38DE18;
  qword_1EB38DE18 = 0;

  objc_sync_exit(obj);
}

+ (void)_setConsumerIdentifier:(id)a3 forKey:(id)a4 inNamespace:(id)a5 accountID:(id)a6 bag:(id)a7 at:(id)a8 serverProvidedAt:(id)a9
{
}

+ (void)_removeStoreForNamespace:(id)a3 accountID:(id)a4 bag:(id)a5
{
}

+ (id)_applyExpiryForKey:(id)a3 inNamespace:(id)a4 accountID:(id)a5 bag:(id)a6 at:(id)a7 consumerIDResetInterval:(double)a8
{
  return +[AMSMetricsIdentifierStoreConsumerID _applyExpiryForKey:a3 inNamespace:a4 accountID:a5 bag:a6 at:a7 consumerIDResetInterval:a8];
}

@end