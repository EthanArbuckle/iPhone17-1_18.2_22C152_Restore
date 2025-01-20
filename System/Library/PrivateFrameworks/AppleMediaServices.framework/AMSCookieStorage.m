@interface AMSCookieStorage
+ (BOOL)updateCookiesWithCookiesToAdd:(id)a3 cookiesToRemove:(id)a4 forAccount:(id)a5 error:(id *)a6;
+ (id)cookiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5;
+ (id)cookiesForAccount:(id)a3 error:(id *)a4;
+ (id)updateCookiesWithCookiesToAdd:(id)a3 cookiesToRemove:(id)a4 forAccount:(id)a5;
@end

@implementation AMSCookieStorage

+ (id)cookiesForAccount:(id)a3 error:(id *)a4
{
  return (id)[a1 cookiesForAccount:a3 cookieDatabaseOnly:0 error:a4];
}

+ (id)cookiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ((objc_msgSend(v8, "ams_isiTunesAccount") & 1) == 0)
  {
    unsigned int v52 = v6;
    v53 = a5;
    uint64_t v9 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v10 = +[AMSLogConfig sharedAccountsCookiesConfig];
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        v11 = +[AMSLogConfig sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = AMSLogKey();
        v14 = NSString;
        uint64_t v15 = objc_opt_class();
        v50 = a2;
        if (v13)
        {
          uint64_t v16 = AMSLogKey();
          uint64_t v47 = NSStringFromSelector(a2);
          v48 = (void *)v16;
          [v14 stringWithFormat:@"%@: [%@] %@ ", v15, v16, v47];
        }
        else
        {
          v48 = NSStringFromSelector(a2);
          [v14 stringWithFormat:@"%@: %@ ", v15, v48];
        v17 = };
        v24 = AMSHashIfNeeded((void *)*MEMORY[0x1E4F17890]);
        v25 = [v8 accountType];
        v26 = [v25 identifier];
        uint64_t v9 = AMSHashIfNeeded(v26);
        *(_DWORD *)buf = 138543874;
        v55 = v17;
        __int16 v56 = 2114;
        v57 = v24;
        __int16 v58 = 2114;
        uint64_t v59 = v9;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v13)
        {

          v17 = (void *)v47;
        }

        a2 = v50;
      }

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v18 = +[AMSLogConfig sharedAccountsCookiesConfig];
      [v11 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v18 userInfo:0];
    }
    else
    {
      if (!v10)
      {
        v11 = +[AMSLogConfig sharedConfig];
      }
      v18 = [v11 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = AMSLogKey();
        v20 = NSString;
        uint64_t v21 = objc_opt_class();
        v51 = a2;
        if (v19)
        {
          uint64_t v22 = AMSLogKey();
          uint64_t v47 = NSStringFromSelector(a2);
          v49 = (void *)v22;
          [v20 stringWithFormat:@"%@: [%@] %@ ", v21, v22, v47];
        }
        else
        {
          v49 = NSStringFromSelector(a2);
          [v20 stringWithFormat:@"%@: %@ ", v21, v49];
        v23 = };
        v27 = AMSHashIfNeeded((void *)*MEMORY[0x1E4F17890]);
        v28 = [v8 accountType];
        v29 = [v28 identifier];
        uint64_t v9 = AMSHashIfNeeded(v29);
        *(_DWORD *)buf = 138543874;
        v55 = v23;
        __int16 v56 = 2114;
        v57 = v27;
        __int16 v58 = 2114;
        uint64_t v59 = v9;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_FAULT, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v19)
        {

          v23 = (void *)v47;
        }

        a2 = v51;
      }
    }

    v30 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v30)
    {
      v30 = +[AMSLogConfig sharedConfig];
    }
    v31 = [v30 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = AMSLogKey();
      v33 = NSString;
      uint64_t v34 = objc_opt_class();
      if (v32)
      {
        v35 = AMSLogKey();
        uint64_t v9 = NSStringFromSelector(a2);
        [v33 stringWithFormat:@"%@: [%@] %@ ", v34, v35, v9];
      }
      else
      {
        v35 = NSStringFromSelector(a2);
        [v33 stringWithFormat:@"%@: %@ ", v34, v35];
      v36 = };
      v37 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      __int16 v56 = 2114;
      v57 = v37;
      _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEBUG, "%{public}@account: %{public}@", buf, 0x16u);
      if (v32)
      {

        v36 = (void *)v9;
      }
    }
    v38 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v39 = objc_msgSend(v38, "ams_iTunesAccountForAccount:", v8);
    v40 = (void *)v39;
    if (v39) {
      v41 = (void *)v39;
    }
    else {
      v41 = v8;
    }
    id v42 = v41;

    id v8 = v42;
    a5 = v53;
    uint64_t v6 = v52;
  }
  v43 = +[AMSCookieService sharedService];
  v44 = [v43 getCookiePropertiesForAccount:v8 cookieDatabaseOnly:v6 error:a5];

  v45 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_cookiesForProperties:", v44);

  return v45;
}

+ (id)updateCookiesWithCookiesToAdd:(id)a3 cookiesToRemove:(id)a4 forAccount:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ((objc_msgSend(v8, "ams_isiTunesAccount") & 1) == 0)
  {
    uint64_t v11 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v12 = +[AMSLogConfig sharedAccountsCookiesConfig];
    v13 = (void *)v12;
    if (v11)
    {
      if (!v12)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = AMSLogKey();
        uint64_t v16 = NSString;
        uint64_t v17 = objc_opt_class();
        __int16 v56 = (void *)v15;
        __int16 v58 = a2;
        if (v15)
        {
          uint64_t v18 = AMSLogKey();
          uint64_t v53 = NSStringFromSelector(a2);
          v54 = (void *)v18;
          [v16 stringWithFormat:@"%@: [%@] %@ ", v17, v18, v53];
        }
        else
        {
          v54 = NSStringFromSelector(a2);
          [v16 stringWithFormat:@"%@: %@ ", v17, v54];
        v19 = };
        v26 = AMSHashIfNeeded((void *)*MEMORY[0x1E4F17890]);
        v27 = [v8 accountType];
        v28 = [v27 identifier];
        uint64_t v11 = AMSHashIfNeeded(v28);
        *(_DWORD *)buf = 138543874;
        v61 = v19;
        __int16 v62 = 2114;
        v63 = v26;
        __int16 v64 = 2114;
        uint64_t v65 = v11;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v56)
        {

          v19 = (void *)v53;
        }

        a2 = v58;
      }

      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v20 = +[AMSLogConfig sharedAccountsCookiesConfig];
      [v13 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v20 userInfo:0];
    }
    else
    {
      if (!v12)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v13 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = AMSLogKey();
        uint64_t v22 = NSString;
        uint64_t v23 = objc_opt_class();
        v57 = (void *)v21;
        uint64_t v59 = a2;
        if (v21)
        {
          uint64_t v24 = AMSLogKey();
          uint64_t v53 = NSStringFromSelector(a2);
          v55 = (void *)v24;
          [v22 stringWithFormat:@"%@: [%@] %@ ", v23, v24, v53];
        }
        else
        {
          v55 = NSStringFromSelector(a2);
          [v22 stringWithFormat:@"%@: %@ ", v23, v55];
        v25 = };
        v29 = AMSHashIfNeeded((void *)*MEMORY[0x1E4F17890]);
        v30 = [v8 accountType];
        v31 = [v30 identifier];
        uint64_t v11 = AMSHashIfNeeded(v31);
        *(_DWORD *)buf = 138543874;
        v61 = v25;
        __int16 v62 = 2114;
        v63 = v29;
        __int16 v64 = 2114;
        uint64_t v65 = v11;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_FAULT, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v57)
        {

          v25 = (void *)v53;
        }

        a2 = v59;
      }
    }

    v32 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v32)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = AMSLogKey();
      v35 = NSString;
      uint64_t v36 = objc_opt_class();
      if (v34)
      {
        uint64_t v37 = AMSLogKey();
        v38 = a2;
        uint64_t v39 = (void *)v37;
        uint64_t v11 = NSStringFromSelector(v38);
        [v35 stringWithFormat:@"%@: [%@] %@ ", v36, v39, v11];
      }
      else
      {
        uint64_t v39 = NSStringFromSelector(a2);
        [v35 stringWithFormat:@"%@: %@ ", v36, v39];
      v40 = };
      v41 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      v61 = v40;
      __int16 v62 = 2114;
      v63 = v41;
      _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_DEBUG, "%{public}@account: %{public}@", buf, 0x16u);
      if (v34)
      {

        v40 = (void *)v11;
      }
    }
    id v42 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v43 = objc_msgSend(v42, "ams_iTunesAccountForAccount:", v8);
    v44 = (void *)v43;
    if (v43) {
      v45 = (void *)v43;
    }
    else {
      v45 = v8;
    }
    id v46 = v45;

    id v8 = v46;
  }
  uint64_t v47 = objc_alloc_init(AMSBinaryPromise);
  v48 = +[AMSCookieService sharedService];
  v49 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_propertiesForCookies:", v10);

  v50 = objc_msgSend(MEMORY[0x1E4F18D28], "ams_propertiesForCookies:", v9);

  v51 = [(AMSBinaryPromise *)v47 completionHandlerAdapter];
  [v48 updateCookiesWithCookiePropertiesToAdd:v49 cookiePropertiesToRemove:v50 forAccount:v8 withCompletion:v51];

  return v47;
}

+ (BOOL)updateCookiesWithCookiesToAdd:(id)a3 cookiesToRemove:(id)a4 forAccount:(id)a5 error:(id *)a6
{
  v7 = [a1 updateCookiesWithCookiesToAdd:a3 cookiesToRemove:a4 forAccount:a5];
  LOBYTE(a6) = [v7 resultWithError:a6];

  return (char)a6;
}

@end