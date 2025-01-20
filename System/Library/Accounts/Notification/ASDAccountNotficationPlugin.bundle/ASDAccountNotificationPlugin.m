@interface ASDAccountNotificationPlugin
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation ASDAccountNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  if ((objc_msgSend(v9, "ams_isSandboxAccount") & 1) == 0 && (objc_msgSend(v10, "ams_isSandboxAccount") & 1) == 0)
  {
    if (sub_24056C658((uint64_t)ASDAccountNotificationPlugin, v9, v10))
    {
      int v11 = [v9 isActive];
      int v12 = [v10 isActive];
      v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_opt_class();
        id v36 = v14;
        v15 = objc_msgSend(v9, "ams_DSID");
        v16 = objc_msgSend(v10, "ams_DSID");
        *(_DWORD *)buf = 138544386;
        v40 = v14;
        __int16 v41 = 2112;
        v42 = v15;
        __int16 v43 = 1024;
        int v44 = v11;
        __int16 v45 = 2114;
        v46 = v16;
        __int16 v47 = 1024;
        int v48 = v12;
        _os_log_impl(&dword_24056B000, v13, OS_LOG_TYPE_INFO, "[%{public}@] willChangeWithType account: %@ active: %d oldAccount: %{public}@ oldActive: %d", buf, 0x2Cu);
      }
      int v17 = v12 ^ 1;
      if (!v9) {
        int v17 = 1;
      }
      if (v17) {
        char v18 = v9 == 0;
      }
      else {
        char v18 = v11 ^ 1;
      }
      v19 = ASDLogHandleForCategory();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_opt_class();
          id v22 = v21;
          v23 = objc_msgSend(v10, "ams_DSID");
          *(_DWORD *)buf = 138543874;
          v40 = v21;
          __int16 v41 = 2114;
          v42 = v23;
          __int16 v43 = 1024;
          int v44 = a4;
          _os_log_impl(&dword_24056B000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling post signout for account: %{public}@ changeType: %u", buf, 0x1Cu);
        }
        v20 = objc_alloc_init(MEMORY[0x263F25470]);
        dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = sub_24056C70C;
        v37[3] = &unk_2650C1998;
        v37[4] = self;
        v25 = v24;
        v38 = v25;
        [v20 sbsyncIfSubscribedWithAccount:v10 completionBlock:v37];
        dispatch_time_t v26 = dispatch_time(0, 5000000000);
        if (dispatch_semaphore_wait(v25, v26))
        {
          v27 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v34 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v40 = v34;
            id v35 = v34;
            _os_log_error_impl(&dword_24056B000, v27, OS_LOG_TYPE_ERROR, "[%{public}@]: Timed out attempting to sbsync", buf, 0xCu);
          }
        }

        goto LABEL_25;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v32 = objc_opt_class();
        id v29 = v32;
        v30 = objc_msgSend(v10, "ams_DSID");
        *(_DWORD *)buf = 138543874;
        v40 = v32;
        __int16 v41 = 2114;
        v42 = v30;
        __int16 v43 = 1024;
        int v44 = a4;
        v31 = "[%{public}@] Not performing signout sbsync for account: %{public}@ changeType: %u";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v10)
    {
      v20 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v28 = objc_opt_class();
        id v29 = v28;
        v30 = objc_msgSend(v10, "ams_DSID");
        *(_DWORD *)buf = 138543874;
        v40 = v28;
        __int16 v41 = 2114;
        v42 = v30;
        __int16 v43 = 1024;
        int v44 = a4;
        v31 = "[%{public}@] Not processing signout for account: %{public}@ changeType: %u";
LABEL_24:
        _os_log_impl(&dword_24056B000, v20, OS_LOG_TYPE_INFO, v31, buf, 0x1Cu);
      }
LABEL_25:
    }
  }

  return 0;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  v80[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  if ((objc_msgSend(v8, "ams_isSandboxAccount") & 1) == 0 && !objc_msgSend(v9, "ams_isSandboxAccount"))
  {
    if (!sub_24056C658((uint64_t)ASDAccountNotificationPlugin, v8, v9)) {
      goto LABEL_54;
    }
    if (a4 == 2)
    {
      uint64_t v24 = [v9 username];
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = [v8 username];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [v9 username];
          id v29 = [v8 username];
          char v30 = [v28 isEqualToString:v29];

          if (v30) {
            goto LABEL_22;
          }
          v31 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_opt_class();
            id v33 = v32;
            v34 = objc_msgSend(v9, "ams_DSID");
            *(_DWORD *)buf = 138543618;
            v72 = v32;
            __int16 v73 = 2114;
            v74 = v34;
            _os_log_impl(&dword_24056B000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling Apple ID change for account: %{public}@", buf, 0x16u);
          }
          v25 = [MEMORY[0x263F087C8] defaultCenter];
          [v25 postNotificationName:@"com.apple.appstored.ASDAppleIDDidChangeNotification" object:0 userInfo:0 deliverImmediately:1];
        }
      }
    }
LABEL_22:
    int v35 = [v8 isActive];
    int v36 = [v9 isActive];
    int v37 = v36;
    if (a4 == 1) {
      int v38 = v35;
    }
    else {
      int v38 = 0;
    }
    if (a4 == 2) {
      int v39 = v35 & (v36 ^ 1);
    }
    else {
      int v39 = 0;
    }
    int v44 = v38 | v39;
    __int16 v45 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      int v46 = v44;
      int v47 = v37;
      int v48 = objc_opt_class();
      id v68 = v48;
      uint64_t v49 = objc_msgSend(v8, "ams_DSID");
      v50 = objc_msgSend(v9, "ams_DSID");
      *(_DWORD *)buf = 138544386;
      v72 = v48;
      int v37 = v47;
      int v44 = v46;
      __int16 v73 = 2112;
      v74 = v49;
      __int16 v75 = 1024;
      *(_DWORD *)v76 = v35;
      *(_WORD *)&v76[4] = 2114;
      *(void *)&v76[6] = v50;
      __int16 v77 = 1024;
      int v78 = v37;
      _os_log_impl(&dword_24056B000, v45, OS_LOG_TYPE_INFO, "[%{public}@] didChangeWithType account: %@ active: %d oldAccount: %{public}@ oldActive: %d", buf, 0x2Cu);
    }
    if (v44)
    {
      v51 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = objc_opt_class();
        id v53 = v52;
        v54 = objc_msgSend(v8, "ams_DSID");
        *(_DWORD *)buf = 138543618;
        v72 = v52;
        __int16 v73 = 2114;
        v74 = v54;
        _os_log_impl(&dword_24056B000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling iTunes account changed to: %{public}@", buf, 0x16u);
      }
      v55 = objc_msgSend(v8, "ams_DSID");

      if (v55)
      {
        v69[0] = @"DSID";
        v56 = objc_msgSend(v8, "ams_DSID");
        v69[1] = @"active";
        v70[0] = v56;
        v70[1] = MEMORY[0x263EFFA88];
        int v17 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
      }
      else
      {
        int v17 = &unk_26F4A5768;
      }
    }
    else
    {
      if (v8 && ((v37 ^ 1 | v35) & 1) != 0) {
        goto LABEL_54;
      }
      int v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:&unk_26F4A5790];
      v57 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = objc_opt_class();
        id v59 = v58;
        v60 = objc_msgSend(v8, "ams_DSID");
        *(_DWORD *)buf = 138543874;
        v72 = v58;
        __int16 v73 = 2114;
        v74 = v60;
        __int16 v75 = 1024;
        *(_DWORD *)v76 = a4;
        _os_log_impl(&dword_24056B000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling iTunes account change to not active: %{public}@ changeType: %u", buf, 0x1Cu);
      }
      v61 = objc_msgSend(v8, "ams_DSID");

      if (v61)
      {
        v62 = objc_msgSend(v8, "ams_DSID");
        [v17 setObject:v62 forKeyedSubscript:@"DSID"];
      }
      [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"signout"];
    }
    v63 = [MEMORY[0x263F087C8] defaultCenter];
    v64 = v63;
    v65 = @"com.apple.appstored.ASDItunesAccountDidChangeNotification";
LABEL_52:
    [v63 postNotificationName:v65 object:0 userInfo:v17 deliverImmediately:1];

LABEL_53:
    goto LABEL_54;
  }
  if (a4 == 1)
  {
    v40 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v41 = objc_opt_class();
      id v42 = v41;
      __int16 v43 = objc_msgSend(v8, "ams_DSID");
      *(_DWORD *)buf = 138543618;
      v72 = v41;
      __int16 v73 = 2114;
      v74 = v43;
      _os_log_impl(&dword_24056B000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling sandbox account added for account: %{public}@", buf, 0x16u);
    }
    int v17 = [MEMORY[0x263F087C8] defaultCenter];
    [v17 postNotificationName:@"com.apple.appstored.ASDSandboxAccountDidChangeNotification" object:0 userInfo:0 deliverImmediately:1];
    goto LABEL_53;
  }
  if (a4 == 2)
  {
    id v10 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = objc_opt_class();
      id v12 = v11;
      v13 = objc_msgSend(v9, "ams_DSID");
      v14 = objc_msgSend(v8, "ams_DSID");
      *(_DWORD *)buf = 138543874;
      v72 = v11;
      __int16 v73 = 2114;
      v74 = v13;
      __int16 v75 = 2114;
      *(void *)v76 = v14;
      _os_log_impl(&dword_24056B000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling sandbox account modification from account: %{public}@ to new account: %{public}@", buf, 0x20u);
    }
    char v15 = [v8 isActive];
    int v16 = [v9 isActive];
    int v17 = 0;
    if ((v15 & 1) == 0 && v16)
    {
      char v18 = objc_msgSend(v9, "ams_DSID");

      v19 = ASDLogHandleForCategory();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_opt_class();
          id v22 = v21;
          v23 = objc_msgSend(v9, "ams_DSID");
          *(_DWORD *)buf = 138543618;
          v72 = v21;
          __int16 v73 = 2114;
          v74 = v23;
          _os_log_impl(&dword_24056B000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling sandbox account signed out: %{public}@", buf, 0x16u);
        }
        v79 = @"AccountDidChangePreviousActiveDSID";
        v20 = objc_msgSend(v9, "ams_DSID");
        v80[0] = v20;
        int v17 = [NSDictionary dictionaryWithObjects:v80 forKeys:&v79 count:1];
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v66 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v72 = v66;
          id v67 = v66;
          _os_log_error_impl(&dword_24056B000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Sandbox account signed out without a DSID.", buf, 0xCu);
        }
        int v17 = 0;
      }
    }
    v63 = [MEMORY[0x263F087C8] defaultCenter];
    v64 = v63;
    v65 = @"com.apple.appstored.ASDSandboxAccountDidChangeNotification";
    goto LABEL_52;
  }
LABEL_54:
}

@end