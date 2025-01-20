@interface AMSLogoutTask
+ (void)_performDaemonSignOutTasksForAccountWithID:(id)a3;
+ (void)_resetServerDataCacheForAccountWithDSID:(id)a3;
- (ACAccount)account;
- (AMSLogoutTask)initWithAccount:(id)a3;
- (BOOL)_disableAutomaticDownloadKindsWithError:(id *)a3;
- (BOOL)_disableBookkeeperWithBag:(id)a3 error:(id *)a4;
- (BOOL)_revokeMusicKitUserTokensWithError:(id *)a3;
- (BOOL)_sendLogoutRequestWithBag:(id)a3 error:(id *)a4;
- (ICCloudServiceStatusMonitor)iCloudServiceMonitor;
- (id)logout;
- (void)setICloudServiceMonitor:(id)a3;
@end

@implementation AMSLogoutTask

- (AMSLogoutTask)initWithAccount:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSLogoutTask;
  v6 = [(AMSTask *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v8 = (void *)qword_268C882A0;
    uint64_t v18 = qword_268C882A0;
    if (!qword_268C882A0)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2405597AC;
      v14[3] = &unk_2650C08A8;
      v14[4] = &v15;
      sub_2405597AC((uint64_t)v14);
      v8 = (void *)v16[3];
    }
    v9 = v8;
    _Block_object_dispose(&v15, 8);
    v10 = (ICCloudServiceStatusMonitor *)objc_alloc_init(v9);
    iCloudServiceMonitor = v7->_iCloudServiceMonitor;
    v7->_iCloudServiceMonitor = v10;
  }
  return v7;
}

- (id)logout
{
  v3 = AMSLogKey();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2405583C0;
  v8[3] = &unk_2650C09E8;
  objc_copyWeak(&v11, &location);
  id v4 = v3;
  id v9 = v4;
  v10 = self;
  v6 = objc_msgSend_performBinaryTaskWithBlock_(self, v5, (uint64_t)v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)_revokeMusicKitUserTokensWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], a2, (uint64_t)a3);
  if (!v7)
  {
    v7 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v5, v6);
  }
  v8 = objc_msgSend_OSLogObject(v7, v5, v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = AMSLogKey();
    int v41 = 138543618;
    uint64_t v42 = v9;
    __int16 v43 = 2114;
    v44 = v10;
    _os_log_impl(&dword_24054C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Revoking Music User Tokens", (uint8_t *)&v41, 0x16u);
  }
  objc_super v13 = objc_msgSend_account(self, v11, v12);
  v16 = objc_msgSend_ams_DSID(v13, v14, v15);

  id v17 = objc_alloc_init(MEMORY[0x263F27E10]);
  v20 = objc_msgSend_iCloudServiceMonitor(self, v18, v19);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    v24 = objc_msgSend_iCloudServiceMonitor(self, v22, v23);
    v27 = objc_msgSend_errorOnlyCompletionHandlerAdapter(v17, v25, v26);
    objc_msgSend_revokeMusicKitUserTokensForAccountDSID_withCompletion_(v24, v28, (uint64_t)v16, v27);

    v31 = objc_msgSend_binaryPromiseAdapter(v17, v29, v30);
    char v33 = objc_msgSend_resultWithError_(v31, v32, (uint64_t)a3);
  }
  else
  {
    v36 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v22, v23);
    if (!v36)
    {
      v36 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v34, v35);
    }
    v37 = objc_msgSend_OSLogObject(v36, v34, v35);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = objc_opt_class();
      v39 = AMSLogKey();
      int v41 = 138543618;
      uint64_t v42 = v38;
      __int16 v43 = 2114;
      v44 = v39;
      _os_log_impl(&dword_24054C000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Unable to revoke Music User Tokens missing necessary method in ICCloudServiceStatusMonitor", (uint8_t *)&v41, 0x16u);
    }
    if (a3)
    {
      AMSError();
      char v33 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v33 = 0;
    }
  }

  return v33;
}

- (BOOL)_disableAutomaticDownloadKindsWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], a2, (uint64_t)a3);
  if (!v7)
  {
    v7 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v5, v6);
  }
  v8 = objc_msgSend_OSLogObject(v7, v5, v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = AMSLogKey();
    int v29 = 138543618;
    uint64_t v30 = v9;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_24054C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Disabling automatic download kinds.", (uint8_t *)&v29, 0x16u);
  }
  objc_super v13 = objc_msgSend_createBagForSubProfile(MEMORY[0x263F27B20], v11, v12);
  id v14 = objc_alloc(MEMORY[0x263F27B20]);
  id v17 = objc_msgSend_account(self, v15, v16);
  uint64_t v19 = objc_msgSend_initWithEnabledMediaKinds_account_bag_(v14, v18, MEMORY[0x263EFFA68], v17, v13);

  v22 = objc_msgSend_perform(v19, v20, v21);
  v25 = objc_msgSend_binaryPromiseAdapter(v22, v23, v24);
  char v27 = objc_msgSend_resultWithError_(v25, v26, (uint64_t)a3);

  return v27;
}

- (BOOL)_disableBookkeeperWithBag:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F27CB8];
  id v6 = a3;
  id v11 = objc_msgSend_sharedAccountsNotificationPluginConfig(v5, v7, v8);
  if (!v11)
  {
    id v11 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v9, v10);
  }
  uint64_t v12 = objc_msgSend_OSLogObject(v11, v9, v10);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v13;
    __int16 v43 = 2114;
    v44 = v14;
    _os_log_impl(&dword_24054C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Disabling Bookkeeper.", buf, 0x16u);
  }
  uint64_t v16 = objc_msgSend_URLForKey_(v6, v15, @"push-notification-types/add-push-notification-type-url");
  id v17 = objc_alloc(MEMORY[0x263F27ED8]);
  uint64_t v19 = objc_msgSend_initWithBag_(v17, v18, (uint64_t)v6);

  objc_msgSend_setRequestEncoding_(v19, v20, 2);
  uint64_t v23 = objc_msgSend_deviceGUID(MEMORY[0x263F27BF8], v21, v22, @"guid");
  v40[0] = v23;
  v40[1] = &unk_26F4A4488;
  v39[1] = @"put-parameters";
  v39[2] = @"notification-type";
  v40[2] = @"mzbookkeeper";
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v40, v39, 3);
  char v27 = objc_msgSend_requestWithMethod_bagURL_parameters_(v19, v26, 4, v16, v25);

  uint64_t v30 = objc_msgSend_defaultSession(MEMORY[0x263F27EF0], v28, v29);
  v32 = objc_msgSend_dataTaskPromiseWithRequestPromise_(v30, v31, (uint64_t)v27);
  uint64_t v35 = objc_msgSend_binaryPromiseAdapter(v32, v33, v34);
  char v37 = objc_msgSend_resultWithError_(v35, v36, (uint64_t)a4);

  return v37;
}

- (BOOL)_sendLogoutRequestWithBag:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F27CB8];
  id v7 = a3;
  uint64_t v12 = objc_msgSend_sharedAccountsNotificationPluginConfig(v6, v8, v9);
  if (!v12)
  {
    uint64_t v12 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v10, v11);
  }
  uint64_t v13 = objc_msgSend_OSLogObject(v12, v10, v11);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v55 = v14;
    __int16 v56 = 2114;
    v57 = v15;
    _os_log_impl(&dword_24054C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Sending logout request.", buf, 0x16u);
  }
  id v17 = objc_msgSend_URLForKey_(v7, v16, @"logout-url");
  id v18 = objc_alloc(MEMORY[0x263F27ED8]);
  v20 = objc_msgSend_initWithBag_(v18, v19, (uint64_t)v7);

  objc_msgSend_setRequestEncoding_(v20, v21, 2);
  uint64_t v24 = objc_msgSend_deviceGUID(MEMORY[0x263F27BF8], v22, v23, @"guid");
  v53 = v24;
  uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v53, &v52, 1);
  uint64_t v29 = objc_msgSend_mutableCopy(v26, v27, v28);

  v32 = objc_msgSend_sharedInstance(MEMORY[0x263F27E98], v30, v31);
  uint64_t v35 = objc_msgSend_account(self, v33, v34);
  char v37 = objc_msgSend_subscriptionBagSyncDataForAccount_(v32, v36, (uint64_t)v35);
  objc_msgSend_ams_setNullableObject_forKey_(v29, v38, (uint64_t)v37, @"sbsync");

  v40 = objc_msgSend_requestWithMethod_bagURL_parameters_(v20, v39, 4, v17, v29);
  __int16 v43 = objc_msgSend_defaultSession(MEMORY[0x263F27EF0], v41, v42);
  uint64_t v45 = objc_msgSend_dataTaskPromiseWithRequestPromise_(v43, v44, (uint64_t)v40);
  v48 = objc_msgSend_binaryPromiseAdapter(v45, v46, v47);
  char v50 = objc_msgSend_resultWithError_(v48, v49, (uint64_t)a4);

  return v50;
}

+ (void)_resetServerDataCacheForAccountWithDSID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v4, v5);
  id v9 = (id)v6;
  if (v3)
  {
    if (!v6)
    {
      objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v7, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = objc_msgSend_OSLogObject(v9, v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      _os_log_impl(&dword_24054C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Requesting server data cache teardown", (uint8_t *)&v19, 0x16u);
    }
    id v9 = objc_alloc_init(MEMORY[0x263F27E78]);
    id v14 = (id)objc_msgSend_tearDownCacheForAccountDSID_(v9, v13, (uint64_t)v3);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v7, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v15 = objc_msgSend_OSLogObject(v9, v7, v8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v17;
      _os_log_impl(&dword_24054C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Failed to request server data cache teardown - no dsid on account", (uint8_t *)&v19, 0x16u);
    }
  }

  objc_msgSend_setDidSetUpServerDataCache_(MEMORY[0x263F27BE0], v18, 0);
}

+ (void)_performDaemonSignOutTasksForAccountWithID:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (ICCloudServiceStatusMonitor)iCloudServiceMonitor
{
  return self->_iCloudServiceMonitor;
}

- (void)setICloudServiceMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudServiceMonitor, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end