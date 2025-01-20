@interface AccountNotificationPlugin
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation AccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  v10 = [MEMORY[0x263F28120] sharedPluginConfig];
  if (!v10)
  {
    v10 = [MEMORY[0x263F28120] sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138543618;
    *(void *)&v28[4] = objc_opt_class();
    *(_WORD *)&v28[12] = 1026;
    *(_DWORD *)&v28[14] = a4;
    id v12 = *(id *)&v28[4];
    _os_log_impl(&dword_2405F6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Proccessing account change. Change type: %{public}u", v28, 0x12u);
  }
  if (objc_msgSend(v8, "ams_isiTunesAccount")
    && ([v8 isActive] & 1) == 0
    && [v9 isActive])
  {
    v13 = [MEMORY[0x263F28120] sharedPluginConfig];
    if (!v13)
    {
      v13 = [MEMORY[0x263F28120] sharedConfig];
    }
    v14 = objc_msgSend(v13, "OSLogObject", *(_OWORD *)v28, *(void *)&v28[16], v29);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)v28 = 138543362;
      *(void *)&v28[4] = v15;
      id v16 = v15;
      _os_log_impl(&dword_2405F6000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: iTunes account deactivated - resetting requester account", v28, 0xCu);
    }
    v17 = (void *)MEMORY[0x263F28128];
    uint64_t v18 = 1;
LABEL_20:
    [v17 resetAccountWithType:v18];
    goto LABEL_21;
  }
  int v19 = objc_msgSend(v9, "ams_isiCloudAccount", *(void *)v28, *(_OWORD *)&v28[8], v29);
  if (a4 == 3 && v19)
  {
    v20 = [MEMORY[0x263F28120] sharedPluginConfig];
    if (!v20)
    {
      v20 = [MEMORY[0x263F28120] sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      *(_DWORD *)v28 = 138543362;
      *(void *)&v28[4] = v22;
      id v23 = v22;
      _os_log_impl(&dword_2405F6000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: iCloud account deleted - resetting approver account", v28, 0xCu);
    }
    v17 = (void *)MEMORY[0x263F28128];
    uint64_t v18 = 0;
    goto LABEL_20;
  }
  if (((objc_msgSend(v8, "ams_isiTunesAccount") & 1) != 0 || objc_msgSend(v8, "ams_isiCloudAccount"))
    && (a4 == 1 || ([v9 isActive] & 1) == 0 && objc_msgSend(v8, "isActive"))
    && [MEMORY[0x263F28118] retryNotificationRegistration])
  {
    v24 = [MEMORY[0x263F28120] sharedPluginConfig];
    if (!v24)
    {
      v24 = [MEMORY[0x263F28120] sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      *(_DWORD *)v28 = 138543362;
      *(void *)&v28[4] = v26;
      id v27 = v26;
      _os_log_impl(&dword_2405F6000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Restarting APNS Connection due to account change.", v28, 0xCu);
    }
    [MEMORY[0x263F28128] restartAPNSConnection];
  }
LABEL_21:
}

@end