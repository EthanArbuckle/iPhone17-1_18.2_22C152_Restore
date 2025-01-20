@interface AMSMetricsIdentifierStoreConsumerID
+ (id)_accountForAltDSID:(id)a3;
+ (id)_applyExpiryForKey:(id)a3 inNamespace:(id)a4 accountID:(id)a5 bag:(id)a6 at:(id)a7 consumerIDResetInterval:(double)a8;
+ (id)_identifierInfoForKey:(id)a3 storeInfo:(id)a4 inDatabase:(id)a5 setValue:(id)a6 needsToSync:(BOOL *)a7 serverProvidedAt:(id)a8 resetInterval:(double)a9 error:(id *)a10;
+ (id)_identifierStoreInfoForKeys:(id)a3 inDatabase:(id)a4 date:(id)a5 started:(id)a6 updateStarted:(BOOL)a7 needsToSync:(BOOL *)a8 account:(id)a9 clientInfo:(id)a10 domain:(id)a11 resetInterval:(double)a12 error:(id *)a13;
+ (id)_promiseOfSunsetIdentifier:(id)a3 withStartedDate:(id)a4 lastSyncDate:(id)a5 forKey:(id)a6 database:(id)a7 account:(id)a8 clientInfo:(id)a9 domain:(id)a10 resetInterval:(double)a11 consumerIDResetInterval:(double)a12;
+ (id)_sunsetIdentifierInfoForKey:(id)a3 storeInfo:(id)a4 inDatabase:(id)a5 needsToSync:(BOOL *)a6 resetInterval:(double)a7 consumerIDResetInterval:(double)a8 error:(id *)a9;
+ (void)_removeStoreForNamespace:(id)a3 accountID:(id)a4 bag:(id)a5;
+ (void)_setConsumerIdentifier:(id)a3 forKey:(id)a4 inNamespace:(id)a5 accountID:(id)a6 bag:(id)a7 at:(id)a8 serverProvidedAt:(id)a9;
+ (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 forKey:(id)a5 database:(id)a6 account:(id)a7 clientInfo:(id)a8 domain:(id)a9 resetInterval:(double)a10 serverProvidedAt:(id)a11;
@end

@implementation AMSMetricsIdentifierStoreConsumerID

+ (void)_setConsumerIdentifier:(id)a3 forKey:(id)a4 inNamespace:(id)a5 accountID:(id)a6 bag:(id)a7 at:(id)a8 serverProvidedAt:(id)a9
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = [a6 altDSID];
  v22 = +[AMSMetricsIdentifierStoreConsumerID _accountForAltDSID:v21];

  if (v22)
  {
    v23 = +[AMSMetricsIdentifierStore identifierStoreWithAccount:v22 bagNamespace:v17 bag:v18];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke;
    v31[3] = &unk_1E55A48F0;
    id v37 = a1;
    v32 = v15;
    id v33 = v19;
    id v34 = v16;
    id v35 = v22;
    id v36 = v20;
    [v23 addSuccessBlock:v31];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke_2;
    v28[3] = &unk_1E55A4918;
    id v30 = a1;
    id v29 = v17;
    [v23 addErrorBlock:v28];

    v24 = v32;
  }
  else
  {
    id v27 = v20;
    v23 = +[AMSLogConfig sharedMetricsConfig];
    if (!v23)
    {
      v23 = +[AMSLogConfig sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_opt_class();
      v26 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v25;
      __int16 v40 = 2114;
      v41 = v26;
      __int16 v42 = 2114;
      id v43 = v17;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Metrics Identifier Store not updated for namespace \"%{public}@\" because we can't find the account", buf, 0x20u);
    }
    id v20 = v27;
  }
}

void __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[9];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a2;
  id v13 = +[AMSMetricsIdentifierStore _database];
  uint64_t v8 = a1[7];
  v9 = [v7 clientInfo];
  v10 = [v7 domain];
  [v7 resetInterval];
  double v12 = v11;

  [v3 _setIdentifier:v4 withStartedDate:v5 forKey:v6 database:v13 account:v8 clientInfo:v9 domain:v12 resetInterval:v10 serverProvidedAt:a1[8]];
}

void __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedMetricsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = AMSLogableError(v3);
    int v10 = 138544130;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics Identifier Store not found for namespace \"%{public}@\"; error: %{public}@",
      (uint8_t *)&v10,
      0x2Au);
  }
}

+ (void)_removeStoreForNamespace:(id)a3 accountID:(id)a4 bag:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [a4 altDSID];
  uint64_t v11 = +[AMSMetricsIdentifierStoreConsumerID _accountForAltDSID:v10];

  if (v11)
  {
    __int16 v12 = +[AMSMetricsIdentifierStore identifierStoreWithAccount:v11 bagNamespace:v8 bag:v9];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke;
    v19[3] = &unk_1E55A4940;
    id v20 = v11;
    [v12 addSuccessBlock:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke_2;
    v16[3] = &unk_1E55A4918;
    id v18 = a1;
    id v17 = v8;
    [v12 addErrorBlock:v16];

    id v13 = v20;
  }
  else
  {
    __int16 v12 = +[AMSLogConfig sharedMetricsConfig];
    if (!v12)
    {
      __int16 v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      v24 = v15;
      __int16 v25 = 2114;
      id v26 = v8;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Metrics Identifier Store not updated for namespace \"%{public}@\" because we can't find the account", buf, 0x20u);
    }
  }
}

void __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  uint64_t v5 = [v3 clientInfo];

  id v6 = +[AMSMetricsIdentifierStore _generateStoreKeyForAccount:v2 domain:v4 clientInfo:v5];

  +[AMSMetricsIdentifierStore removeIdentifiersForStore:v6];
}

void __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedMetricsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = AMSLogableError(v3);
    int v10 = 138544130;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics Identifier Store not found for namespace \"%{public}@\"; error: %{public}@",
      (uint8_t *)&v10,
      0x2Au);
  }
}

+ (id)_applyExpiryForKey:(id)a3 inNamespace:(id)a4 accountID:(id)a5 bag:(id)a6 at:(id)a7 consumerIDResetInterval:(double)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [v16 altDSID];
  id v20 = +[AMSMetricsIdentifierStoreConsumerID _accountForAltDSID:v19];

  if (v20)
  {
    v21 = +[AMSMetricsIdentifierStore identifierStoreWithAccount:v20 bagNamespace:v15 bag:v17];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __111__AMSMetricsIdentifierStoreConsumerID__applyExpiryForKey_inNamespace_accountID_bag_at_consumerIDResetInterval___block_invoke;
    v35[3] = &unk_1E55A4968;
    id v40 = a1;
    id v36 = v15;
    id v37 = v18;
    id v38 = v14;
    id v39 = v20;
    double v41 = a8;
    id v22 = (id)[v21 continueWithBlock:v35];

    __int16 v23 = v36;
  }
  else
  {
    id v34 = v14;
    __int16 v23 = [NSString stringWithFormat:@"Metrics Identifier Store not updated for namespace \"%@\"", v15];
    id v33 = [NSString stringWithFormat:@"No Account found for %@", v16];
    v24 = AMSError(107, v23, v33, 0);
    __int16 v25 = +[AMSLogConfig sharedMetricsConfig];
    if (!v25)
    {
      __int16 v25 = +[AMSLogConfig sharedConfig];
    }
    id v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_opt_class();
      AMSLogKey();
      v28 = id v31 = v18;
      AMSLogableError(v24);
      id v29 = v32 = v17;
      *(_DWORD *)buf = 138543874;
      uint64_t v43 = v27;
      __int16 v44 = 2114;
      v45 = v28;
      __int16 v46 = 2114;
      v47 = v29;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error: %{public}@", buf, 0x20u);

      id v17 = v32;
      id v18 = v31;
    }

    v21 = +[AMSPromise promiseWithError:v24];

    id v14 = v34;
  }

  return v21;
}

id __111__AMSMetricsIdentifierStoreConsumerID__applyExpiryForKey_inNamespace_accountID_bag_at_consumerIDResetInterval___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      int v10 = AMSLogKey();
      uint64_t v11 = a1[4];
      __int16 v12 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      __int16 v25 = v10;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      id v29 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics Identifier Store not found for namespace \"%{public}@\"; error: %{public}@",
        buf,
        0x2Au);
    }
    id v13 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    id v14 = (void *)a1[8];
    uint64_t v15 = a1[5];
    uint64_t v16 = a1[6];
    id v17 = +[AMSMetricsIdentifierStore _database];
    uint64_t v18 = a1[7];
    id v19 = [v5 clientInfo];
    id v20 = [v5 domain];
    [v5 resetInterval];
    id v13 = objc_msgSend(v14, "_promiseOfSunsetIdentifier:withStartedDate:lastSyncDate:forKey:database:account:clientInfo:domain:resetInterval:consumerIDResetInterval:", &stru_1EDCA7308, v15, 0, v16, v17, v18, v19, v20);
  }
  return v13;
}

+ (id)_accountForAltDSID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v5 = objc_msgSend(v4, "ams_iTunesAccountWithAltDSID:", v3);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = objc_msgSend(v4, "ams_activeiCloudAccount");
    uint64_t v9 = objc_msgSend(v8, "ams_altDSID");
    int v10 = [v9 isEqualToString:v3];

    if (v10)
    {
      uint64_t v11 = objc_msgSend(v4, "ams_iTunesAccountForAccount:", v8);
      __int16 v12 = (void *)v11;
      if (v11) {
        id v13 = (void *)v11;
      }
      else {
        id v13 = v8;
      }
      id v7 = v13;
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

+ (id)_promiseOfSunsetIdentifier:(id)a3 withStartedDate:(id)a4 lastSyncDate:(id)a5 forKey:(id)a6 database:(id)a7 account:(id)a8 clientInfo:(id)a9 domain:(id)a10 resetInterval:(double)a11 consumerIDResetInterval:(double)a12
{
  id v36 = a3;
  id v20 = a4;
  id v35 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  __int16 v26 = +[AMSMetricsIdentifierStore _sharedQueue];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  id v39 = __175__AMSMetricsIdentifierStoreConsumerID__promiseOfSunsetIdentifier_withStartedDate_lastSyncDate_forKey_database_account_clientInfo_domain_resetInterval_consumerIDResetInterval___block_invoke;
  id v40 = &unk_1E55A4990;
  id v27 = v23;
  id v41 = v27;
  id v49 = a1;
  id v28 = v21;
  id v42 = v28;
  id v29 = v22;
  id v43 = v29;
  id v30 = v20;
  id v44 = v30;
  uint64_t v48 = &v52;
  id v31 = v24;
  id v45 = v31;
  id v32 = v25;
  double v50 = a11;
  double v51 = a12;
  id v46 = v32;
  id v47 = 0;
  dispatch_sync(v26, &block);

  if (*((unsigned char *)v53 + 24)) {
    id v33 = +[AMSMetricsIdentifierStore _sync];
  }

  _Block_object_dispose(&v52, 8);
  return 0;
}

void __175__AMSMetricsIdentifierStoreConsumerID__promiseOfSunsetIdentifier_withStartedDate_lastSyncDate_forKey_database_account_clientInfo_domain_resetInterval_consumerIDResetInterval___block_invoke(uint64_t a1)
{
  v69[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 96);
  v69[0] = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(*(void *)(a1 + 88) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  double v11 = *(double *)(a1 + 104);
  id v53 = 0;
  __int16 v12 = [v3 _identifierStoreInfoForKeys:v4 inDatabase:v5 date:v6 started:0 updateStarted:0 needsToSync:v7 account:v11 clientInfo:v8 domain:v9 resetInterval:v10 error:&v53];
  id v13 = v53;

  if (v13 || !v12)
  {
    id v20 = +[AMSLogConfig sharedMetricsConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    __int16 v26 = [v20 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_opt_class();
      id v28 = AMSLogKey();
      id v29 = [*(id *)(a1 + 64) bundleIdentifier];
      uint64_t v30 = *(void *)(a1 + 72);
      id v31 = AMSLogableError(v13);
      *(_DWORD *)buf = 138544642;
      uint64_t v56 = v27;
      __int16 v57 = 2114;
      v58 = v28;
      __int16 v59 = 2112;
      v60 = v2;
      __int16 v61 = 2114;
      v62 = v29;
      __int16 v63 = 2114;
      uint64_t v64 = v30;
      __int16 v65 = 2114;
      v66 = v31;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void **)(a1 + 96);
  uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8) + 24;
  double v18 = *(double *)(a1 + 104);
  double v19 = *(double *)(a1 + 112);
  id v52 = 0;
  id v20 = [v16 _sunsetIdentifierInfoForKey:v14 storeInfo:v12 inDatabase:v15 needsToSync:v17 resetInterval:&v52 consumerIDResetInterval:v18 error:v19];
  id v21 = v52;
  if (!v21)
  {
    if (v20)
    {
      id v32 = [v20 expires];

      if (!v32)
      {
        id v44 = [NSString stringWithFormat:@"Metrics Identifier Store failed to expire Consumer ID"];
        id v45 = [NSString stringWithFormat:@"No error from the store"];
        id v46 = AMSError(0, v44, v45, 0);
        [*(id *)(a1 + 80) finishWithError:v46];

        id v13 = 0;
        goto LABEL_17;
      }
    }
    id v33 = [v20 expires];
    __int16 v26 = [v33 dateByAddingTimeInterval:-*(double *)(a1 + 104)];

    id v34 = *(void **)(a1 + 96);
    uint64_t v54 = *(void *)(a1 + 40);
    id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    uint64_t v36 = *(void *)(a1 + 48);
    uint64_t v37 = *(void *)(a1 + 56);
    uint64_t v38 = *(void *)(*(void *)(a1 + 88) + 8) + 24;
    uint64_t v39 = *(void *)(a1 + 32);
    uint64_t v40 = *(void *)(a1 + 64);
    uint64_t v41 = *(void *)(a1 + 72);
    double v42 = *(double *)(a1 + 104);
    id v51 = 0;
    id v43 = [v34 _identifierStoreInfoForKeys:v35 inDatabase:v36 date:v37 started:v26 updateStarted:1 needsToSync:v38 account:v42 clientInfo:v39 domain:v40 resetInterval:v41 error:&v51];
    id v13 = v51;

    [*(id *)(a1 + 80) finishWithResult:v20];
    goto LABEL_16;
  }
  id v13 = v21;
  id v22 = +[AMSLogConfig sharedMetricsConfig];
  if (!v22)
  {
    id v22 = +[AMSLogConfig sharedConfig];
  }
  id v23 = [v22 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v49 = objc_opt_class();
    double v50 = AMSLogKey();
    id v47 = [*(id *)(a1 + 64) bundleIdentifier];
    uint64_t v48 = *(void *)(a1 + 72);
    id v24 = [*(id *)(a1 + 40) name];
    id v25 = AMSLogableError(v13);
    *(_DWORD *)buf = 138544898;
    uint64_t v56 = v49;
    __int16 v57 = 2114;
    v58 = v50;
    __int16 v59 = 2112;
    v60 = v2;
    __int16 v61 = 2114;
    v62 = v47;
    __int16 v63 = 2114;
    uint64_t v64 = v48;
    __int16 v65 = 2114;
    v66 = v24;
    __int16 v67 = 2114;
    v68 = v25;
    _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sunset identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);
  }
  [*(id *)(a1 + 80) finishWithError:v13];
LABEL_17:
}

+ (id)_sunsetIdentifierInfoForKey:(id)a3 storeInfo:(id)a4 inDatabase:(id)a5 needsToSync:(BOOL *)a6 resetInterval:(double)a7 consumerIDResetInterval:(double)a8 error:(id *)a9
{
  id v16 = a5;
  uint64_t v17 = +[AMSMetricsIdentifierStore _generateIdentifierKey:a3 storeInfo:a4 period:0 resetInterval:a7];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __144__AMSMetricsIdentifierStoreConsumerID__sunsetIdentifierInfoForKey_storeInfo_inDatabase_needsToSync_resetInterval_consumerIDResetInterval_error___block_invoke;
  v20[3] = &__block_descriptor_56_e9_B16__0__8l;
  v20[4] = a1;
  *(double *)&v20[5] = a8;
  v20[6] = a6;
  double v18 = [v16 identifierForKey:v17 updateMaybe:v20 error:a9];

  return v18;
}

BOOL __144__AMSMetricsIdentifierStoreConsumerID__sunsetIdentifierInfoForKey_storeInfo_inDatabase_needsToSync_resetInterval_consumerIDResetInterval_error___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = *a2;
  uint64_t v4 = +[AMSLogConfig sharedMetricsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
    int v18 = 138544130;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    id v23 = v3;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking if we should sunset CID: %{public}@, interval: %{public}@", (uint8_t *)&v18, 0x2Au);
  }
  BOOL v9 = +[AMSMetricsIdentifierCore _shouldUpdateDatabaseFor:v3 consumerIDResetInterval:*(double *)(a1 + 40)];
  if (v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedMetricsConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      int v18 = 138543874;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v13;
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to sunset CID: %{public}@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v14 = [v3 serverProvidedAt];
    uint64_t v15 = [v14 dateByAddingTimeInterval:*(double *)(a1 + 40)];
    [v3 setExpires:v15];

    id v16 = [MEMORY[0x1E4F1C9C8] now];
    [v3 setModified:v16];

    **(unsigned char **)(a1 + 48) |= [v3 crossDeviceSync];
  }

  return v9;
}

+ (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 forKey:(id)a5 database:(id)a6 account:(id)a7 clientInfo:(id)a8 domain:(id)a9 resetInterval:(double)a10 serverProvidedAt:(id)a11
{
  id v35 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  id v25 = +[AMSMetricsIdentifierStore _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __143__AMSMetricsIdentifierStoreConsumerID__setIdentifier_withStartedDate_forKey_database_account_clientInfo_domain_resetInterval_serverProvidedAt___block_invoke;
  block[3] = &unk_1E55A49D8;
  id v26 = v21;
  id v37 = v26;
  id v46 = a1;
  id v27 = v19;
  id v38 = v27;
  id v28 = v20;
  id v39 = v28;
  id v29 = v18;
  id v40 = v29;
  id v45 = &v48;
  id v30 = v22;
  id v41 = v30;
  id v31 = v23;
  id v42 = v31;
  double v47 = a10;
  id v32 = v35;
  id v43 = v32;
  id v33 = v24;
  id v44 = v33;
  dispatch_sync(v25, block);

  if (*((unsigned char *)v49 + 24)) {
    id v34 = +[AMSMetricsIdentifierStore _sync];
  }

  _Block_object_dispose(&v48, 8);
}

void __143__AMSMetricsIdentifierStoreConsumerID__setIdentifier_withStartedDate_forKey_database_account_clientInfo_domain_resetInterval_serverProvidedAt___block_invoke(uint64_t a1)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 104);
  v50[0] = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(*(void *)(a1 + 96) + 8) + 24;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  double v11 = *(double *)(a1 + 112);
  id v35 = 0;
  uint64_t v12 = [v3 _identifierStoreInfoForKeys:v4 inDatabase:v5 date:v6 started:0 updateStarted:1 needsToSync:v7 account:v11 clientInfo:v8 domain:v9 resetInterval:v10 error:&v35];
  id v13 = v35;

  if (v13 || !v12)
  {
    id v21 = +[AMSLogConfig sharedMetricsConfig];
    if (!v21)
    {
      id v21 = +[AMSLogConfig sharedConfig];
    }
    id v22 = [v21 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v23 = objc_opt_class();
    id v24 = AMSLogKey();
    id v25 = [*(id *)(a1 + 64) bundleIdentifier];
    uint64_t v26 = *(void *)(a1 + 72);
    id v27 = AMSLogableError(v13);
    *(_DWORD *)buf = 138544642;
    uint64_t v37 = v23;
    __int16 v38 = 2114;
    id v39 = v24;
    __int16 v40 = 2112;
    id v41 = v2;
    __int16 v42 = 2114;
    id v43 = v25;
    __int16 v44 = 2114;
    uint64_t v45 = v26;
    __int16 v46 = 2114;
    double v47 = v27;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v16 = *(void **)(a1 + 104);
  uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8) + 24;
  uint64_t v18 = *(void *)(a1 + 80);
  uint64_t v19 = *(void *)(a1 + 88);
  double v20 = *(double *)(a1 + 112);
  id v34 = 0;
  id v21 = [v16 _identifierInfoForKey:v14 storeInfo:v12 inDatabase:v15 setValue:v18 needsToSync:v17 serverProvidedAt:v19 resetInterval:v20 error:&v34];
  id v13 = v34;
  if (v13 || !v21)
  {
    id v22 = +[AMSLogConfig sharedMetricsConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    id v24 = [v22 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class();
      id v28 = AMSLogKey();
      id v29 = [*(id *)(a1 + 64) bundleIdentifier];
      uint64_t v32 = *(void *)(a1 + 72);
      id v30 = [*(id *)(a1 + 40) name];
      id v31 = AMSLogableError(v13);
      *(_DWORD *)buf = 138544898;
      uint64_t v37 = v33;
      __int16 v38 = 2114;
      id v39 = v28;
      __int16 v40 = 2112;
      id v41 = v2;
      __int16 v42 = 2114;
      id v43 = v29;
      __int16 v44 = 2114;
      uint64_t v45 = v32;
      __int16 v46 = 2114;
      double v47 = v30;
      __int16 v48 = 2114;
      uint64_t v49 = v31;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);
    }
    goto LABEL_14;
  }
  id v13 = 0;
LABEL_16:
}

+ (id)_identifierInfoForKey:(id)a3 storeInfo:(id)a4 inDatabase:(id)a5 setValue:(id)a6 needsToSync:(BOOL *)a7 serverProvidedAt:(id)a8 resetInterval:(double)a9 error:(id *)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a8;
  id v21 = a5;
  id v22 = +[AMSMetricsIdentifierStore _generateIdentifierKey:v17 storeInfo:v18 period:0 resetInterval:a9];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __140__AMSMetricsIdentifierStoreConsumerID__identifierInfoForKey_storeInfo_inDatabase_setValue_needsToSync_serverProvidedAt_resetInterval_error___block_invoke;
  v30[3] = &unk_1E55A4A00;
  id v31 = v17;
  id v32 = v22;
  id v33 = v18;
  id v34 = v19;
  id v35 = v20;
  id v36 = a1;
  uint64_t v37 = a7;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v22;
  id v27 = v17;
  id v28 = [v21 identifierForKey:v26 updateMaybe:v30 error:a10];

  return v28;
}

uint64_t __140__AMSMetricsIdentifierStoreConsumerID__identifierInfoForKey_storeInfo_inDatabase_setValue_needsToSync_serverProvidedAt_resetInterval_error___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
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
    uint64_t v8 = AMSLogKey();
    int v32 = 138543874;
    uint64_t v33 = v7;
    __int16 v34 = 2114;
    id v35 = v8;
    __int16 v36 = 2114;
    id v37 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found ID in db: %{public}@", (uint8_t *)&v32, 0x20u);
  }
  if (v4 && ![v4 deleted])
  {
    int v16 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_new();

    objc_msgSend(v9, "setCrossDeviceSync:", objc_msgSend(*(id *)(a1 + 32), "crossDeviceSync"));
    [v9 setIdKey:*(void *)(a1 + 40)];
    uint64_t v10 = [*(id *)(a1 + 48) storeUUID];
    [v9 setStoreUUID:v10];

    double v11 = [*(id *)(a1 + 32) name];
    [v9 setName:v11];

    [v9 setValue:*(void *)(a1 + 56)];
    [v9 setServerProvidedAt:*(void *)(a1 + 64)];
    [v9 setExpires:0];
    id v4 = v9;
    *a2 = v4;
    uint64_t v12 = +[AMSLogConfig sharedMetricsConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v32 = 138543874;
      uint64_t v33 = v14;
      __int16 v34 = 2114;
      id v35 = v15;
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Created new ID in db: %{public}@", (uint8_t *)&v32, 0x20u);
    }
    int v16 = 1;
  }
  id v17 = *(void **)(a1 + 56);
  if (v17)
  {
    id v18 = [v4 value];
    char v19 = [v17 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      [v4 setValue:*(void *)(a1 + 56)];
      [v4 setServerProvidedAt:*(void *)(a1 + 64)];
      [v4 setExpires:0];
      id v20 = +[AMSLogConfig sharedMetricsConfig];
      if (!v20)
      {
        id v20 = +[AMSLogConfig sharedConfig];
      }
      id v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        id v23 = AMSLogKey();
        int v32 = 138543874;
        uint64_t v33 = v22;
        __int16 v34 = 2114;
        id v35 = v23;
        __int16 v36 = 2114;
        id v37 = v4;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updated ID value in db: %{public}@", (uint8_t *)&v32, 0x20u);
      }
      int v16 = 1;
    }
  }
  id v24 = [v4 expires];

  if (v24)
  {
    [v4 setExpires:0];
    id v25 = +[AMSLogConfig sharedMetricsConfig];
    if (!v25)
    {
      id v25 = +[AMSLogConfig sharedConfig];
    }
    id v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      id v28 = AMSLogKey();
      int v32 = 138543874;
      uint64_t v33 = v27;
      __int16 v34 = 2114;
      id v35 = v28;
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cleared CID expiry in db: %{public}@", (uint8_t *)&v32, 0x20u);
    }
  }
  else if (!v16)
  {
    uint64_t v30 = 0;
    goto LABEL_28;
  }
  id v29 = [MEMORY[0x1E4F1C9C8] now];
  [v4 setModified:v29];

  **(unsigned char **)(a1 + 80) |= [v4 crossDeviceSync];
  uint64_t v30 = 1;
LABEL_28:

  return v30;
}

+ (id)_identifierStoreInfoForKeys:(id)a3 inDatabase:(id)a4 date:(id)a5 started:(id)a6 updateStarted:(BOOL)a7 needsToSync:(BOOL *)a8 account:(id)a9 clientInfo:(id)a10 domain:(id)a11 resetInterval:(double)a12 error:(id *)a13
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  id v20 = a11;
  id v21 = a9;
  id v22 = a4;
  id v23 = a3;
  id v24 = +[AMSMetricsIdentifierStore _accountIdentifierForAccount:v21];
  id v25 = +[AMSMetricsIdentifierStore _generateStoreKeyForAccount:v21 domain:v20 clientInfo:v19];

  id v26 = objc_msgSend(v23, "ac_firstObjectPassingTest:", &__block_literal_global_93);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __163__AMSMetricsIdentifierStoreConsumerID__identifierStoreInfoForKeys_inDatabase_date_started_updateStarted_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2;
  v38[3] = &unk_1E55A4A28;
  id v44 = v17;
  id v45 = a1;
  id v39 = v24;
  id v40 = v25;
  BOOL v48 = v26 != 0;
  id v41 = v18;
  id v42 = v19;
  double v46 = a12;
  BOOL v49 = a7;
  id v43 = v20;
  double v47 = a8;
  id v27 = v17;
  id v28 = v20;
  id v29 = v19;
  id v30 = v18;
  id v31 = v25;
  id v32 = v24;
  uint64_t v33 = [v22 identifierStoreForKey:v31 updateMaybe:v38 error:a13];

  return v33;
}

uint64_t __163__AMSMetricsIdentifierStoreConsumerID__identifierStoreInfoForKeys_inDatabase_date_started_updateStarted_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 crossDeviceSync];
}

uint64_t __163__AMSMetricsIdentifierStoreConsumerID__identifierStoreInfoForKeys_inDatabase_date_started_updateStarted_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
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
    uint64_t v8 = AMSLogKey();
    int v46 = 138543874;
    uint64_t v47 = v7;
    __int16 v48 = 2114;
    BOOL v49 = v8;
    __int16 v50 = 2114;
    *(void *)char v51 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found ID store in db: %{public}@", (uint8_t *)&v46, 0x20u);
  }
  if (v4 && ![v4 deleted])
  {
    int v16 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_new();

    [v9 setAccount:*(void *)(a1 + 32)];
    [v9 setStoreKey:*(void *)(a1 + 40)];
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    double v11 = [v10 UUIDString];
    [v9 setStoreUUID:v11];

    [v9 setStarted:*(void *)(a1 + 48)];
    id v4 = v9;
    *a2 = v4;
    uint64_t v12 = +[AMSLogConfig sharedMetricsConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v46 = 138543874;
      uint64_t v47 = v14;
      __int16 v48 = 2114;
      BOOL v49 = v15;
      __int16 v50 = 2114;
      *(void *)char v51 = v4;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Created new ID store in db: %{public}@", (uint8_t *)&v46, 0x20u);
    }
    int v16 = 1;
  }
  int v17 = [v4 crossDeviceSync];
  int v18 = *(unsigned __int8 *)(a1 + 104);
  if (v18 != v17)
  {
    [v4 setCrossDeviceSync:v18 != 0];
    id v19 = +[AMSLogConfig sharedMetricsConfig];
    if (!v19)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_opt_class();
      id v22 = AMSLogKey();
      int v23 = *(unsigned __int8 *)(a1 + 104);
      id v24 = [*(id *)(a1 + 56) bundleIdentifier];
      uint64_t v25 = *(void *)(a1 + 64);
      int v46 = 138544386;
      uint64_t v47 = v21;
      __int16 v48 = 2114;
      BOOL v49 = v22;
      __int16 v50 = 1026;
      *(_DWORD *)char v51 = v23;
      *(_WORD *)&v51[4] = 2114;
      *(void *)&v51[6] = v24;
      *(_WORD *)&v51[14] = 2114;
      *(void *)&v51[16] = v25;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store cross device sync (sync: %{public}d, client: %{public}@, domain: %{public}@)", (uint8_t *)&v46, 0x30u);
    }
    int v16 = 1;
  }
  [v4 resetInterval];
  if (v26 == *(double *)(a1 + 88))
  {
    if (!*(unsigned char *)(a1 + 105))
    {
      if (v16) {
        goto LABEL_34;
      }
LABEL_37:
      uint64_t v44 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    objc_msgSend(v4, "setResetInterval:");
    id v27 = +[AMSLogConfig sharedMetricsConfig];
    if (!v27)
    {
      id v27 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = objc_opt_class();
      id v30 = AMSLogKey();
      uint64_t v31 = *(void *)(a1 + 88);
      id v32 = [*(id *)(a1 + 56) bundleIdentifier];
      uint64_t v33 = *(void *)(a1 + 64);
      int v46 = 138544386;
      uint64_t v47 = v29;
      __int16 v48 = 2114;
      BOOL v49 = v30;
      __int16 v50 = 2050;
      *(void *)char v51 = v31;
      *(_WORD *)&v51[8] = 2114;
      *(void *)&v51[10] = v32;
      *(_WORD *)&v51[18] = 2114;
      *(void *)&v51[20] = v33;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store reset interval (interval: %{public}f, client: %{public}@, domain: %{public}@)", (uint8_t *)&v46, 0x34u);
    }
    if (!*(unsigned char *)(a1 + 105)) {
      goto LABEL_34;
    }
    int v16 = 1;
  }
  __int16 v34 = [v4 started];
  id v35 = *(void **)(a1 + 48);

  if (v34 != v35)
  {
    __int16 v36 = +[AMSLogConfig sharedMetricsConfig];
    if (!v36)
    {
      __int16 v36 = +[AMSLogConfig sharedConfig];
    }
    id v37 = [v36 OSLogObject];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = objc_opt_class();
      id v39 = AMSLogKey();
      id v40 = [v4 started];
      uint64_t v41 = *(void *)(a1 + 48);
      id v42 = [*(id *)(a1 + 56) bundleIdentifier];
      uint64_t v43 = *(void *)(a1 + 64);
      int v46 = 138544642;
      uint64_t v47 = v38;
      __int16 v48 = 2114;
      BOOL v49 = v39;
      __int16 v50 = 2114;
      *(void *)char v51 = v40;
      *(_WORD *)&v51[8] = 2114;
      *(void *)&v51[10] = v41;
      *(_WORD *)&v51[18] = 2114;
      *(void *)&v51[20] = v42;
      __int16 v52 = 2114;
      uint64_t v53 = v43;
      _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store started timestamp: %{public}@ to timestamp: %{public}@ (client: %{public}@, domain: %{public}@)", (uint8_t *)&v46, 0x3Eu);
    }
    [v4 setStarted:*(void *)(a1 + 48)];
    goto LABEL_34;
  }
  if (!v16) {
    goto LABEL_37;
  }
LABEL_34:
  [v4 setModified:*(void *)(a1 + 72)];
  **(unsigned char **)(a1 + 96) |= [v4 crossDeviceSync];
  uint64_t v44 = 1;
LABEL_35:

  return v44;
}

@end