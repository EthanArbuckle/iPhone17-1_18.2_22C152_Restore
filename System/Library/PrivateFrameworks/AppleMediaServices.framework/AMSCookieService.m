@interface AMSCookieService
+ (AMSCookieService)sharedService;
+ (BOOL)_currentUserIsSystemSetupUser;
+ (BOOL)_isEntitledForDirectCookieAccess;
- (AMSCookieService)init;
- (BOOL)_useInMemoryCacheForAccount:(id)a3;
- (BOOL)isObservingNotifications;
- (NSCache)inMemoryStorage;
- (id)_cachedCookiePropertiesForAccount:(id)a3;
- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5;
- (id)getCookiePropertiesForAccount:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)inMemoryStorageLock;
- (void)_cacheCookieProperties:(id)a3 forAccount:(id)a4;
- (void)_registerForCookieChangeNotifications;
- (void)_unregisterFromCookieChangeNotifications;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)clearCookiePropertyCache;
- (void)clearCookiePropertyCacheForAccount:(id)a3;
- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3;
- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4;
- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5;
- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4;
- (void)setIsObservingNotifications:(BOOL)a3;
- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6;
@end

@implementation AMSCookieService

- (id)_cachedCookiePropertiesForAccount:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  v4 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = AMSLogKey();
    v7 = NSString;
    uint64_t v8 = objc_opt_class();
    if (v6)
    {
      v9 = AMSLogKey();
      v10 = NSStringFromSelector(a2);
      v11 = [v7 stringWithFormat:@"%@: [%@] %@ ", v8, v9, v10];
    }
    else
    {
      v9 = NSStringFromSelector(a2);
      v11 = [v7 stringWithFormat:@"%@: %@ ", v8, v9];
      v10 = v11;
    }
    v12 = [v43 identifier];
    v13 = AMSHashIfNeeded(v12);
    *(_DWORD *)buf = 138543618;
    v46 = v11;
    __int16 v47 = 2114;
    uint64_t v48 = (uint64_t)v13;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Reading in-memory-cached cookies for account with identifier: %{public}@", buf, 0x16u);

    if (v6) {
  }
    }

  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__AMSCookieService__cachedCookiePropertiesForAccount___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  aBlock[4] = self;
  v41 = (void (**)(void))_Block_copy(aBlock);
  v14 = [(AMSCookieService *)self inMemoryStorage];
  v15 = [v43 identifier];
  id v42 = [v14 objectForKey:v15];

  if ([v42 count])
  {
    v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = AMSLogKey();
      v19 = NSString;
      uint64_t v20 = objc_opt_class();
      if (v18)
      {
        uint64_t v21 = AMSLogKey();
        v22 = NSStringFromSelector(a2);
        v23 = [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, v22];
      }
      else
      {
        uint64_t v21 = NSStringFromSelector(a2);
        v23 = [v19 stringWithFormat:@"%@: %@ ", v20, v21];
        v22 = v23;
      }
      uint64_t v30 = [v42 count];
      v31 = [v43 identifier];
      v32 = AMSHashIfNeeded(v31);
      v33 = (void *)v18;
      v34 = (void *)v21;
      v35 = v33;
      BOOL v36 = v33 == 0;
      *(_DWORD *)buf = 138543874;
      v46 = v23;
      __int16 v47 = 2048;
      uint64_t v48 = v30;
      __int16 v49 = 2114;
      v50 = v32;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Found %lu cookies for account with identifier: %{public}@", buf, 0x20u);

      if (!v36) {
    }
      }
  }
  else
  {
    v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v24 = AMSLogKey();
      v25 = NSString;
      uint64_t v26 = objc_opt_class();
      if (v24)
      {
        v27 = AMSLogKey();
        v28 = NSStringFromSelector(a2);
        v29 = [v25 stringWithFormat:@"%@: [%@] %@ ", v26, v27, v28];
      }
      else
      {
        v27 = NSStringFromSelector(a2);
        v29 = [v25 stringWithFormat:@"%@: %@ ", v26, v27];
        v28 = v29;
      }
      v37 = [v43 identifier];
      v38 = AMSHashIfNeeded(v37);
      *(_DWORD *)buf = 138543618;
      v46 = v29;
      __int16 v47 = 2114;
      uint64_t v48 = (uint64_t)v38;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Did not find any cached cookies for account with identifier: %{public}@.", buf, 0x16u);

      if (v24) {
    }
      }
  }

  v41[2]();
  return v42;
}

- (NSCache)inMemoryStorage
{
  return (NSCache *)objc_getProperty(self, a2, 16, 1);
}

void __54__AMSCookieService__cachedCookiePropertiesForAccount___block_invoke(uint64_t a1)
{
}

uint64_t __33__AMSCookieService_sharedService__block_invoke()
{
  qword_1EB38D758 = objc_alloc_init(AMSCookieService);
  return MEMORY[0x1F41817F8]();
}

- (AMSCookieService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSCookieService;
  v2 = [(AMSCookieService *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    inMemoryStorage = v2->_inMemoryStorage;
    v2->_inMemoryStorage = v3;

    [(NSCache *)v2->_inMemoryStorage setDelegate:v2];
    [(NSCache *)v2->_inMemoryStorage setName:@"AMSCookieService.inMemoryCache"];
    v2->_inMemoryStorageLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

void __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (AMSCookieService)sharedService
{
  if (_MergedGlobals_93 != -1) {
    dispatch_once(&_MergedGlobals_93, &__block_literal_global_34);
  }
  v2 = (void *)qword_1EB38D758;
  return (AMSCookieService *)v2;
}

- (id)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v6
    || ([(AMSCookieService *)self _cachedCookiePropertiesForAccount:v9],
        (id v10 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v95 = 0;
    v96 = (id *)&v95;
    uint64_t v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__23;
    v99 = __Block_byref_object_dispose__23;
    id v100 = 0;
    if ([(id)objc_opt_class() _isEntitledForDirectCookieAccess])
    {
      Class v11 = NSClassFromString(&cfstr_Amsdcookieserv.isa);
      if (objc_opt_respondsToSelector())
      {
        v12 = [(objc_class *)v11 performSelector:sel_sharedService];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v106 = __Block_byref_object_copy__23;
        v107 = __Block_byref_object_dispose__23;
        id v108 = 0;
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke;
        v94[3] = &unk_1E55A15C0;
        v94[4] = buf;
        v94[5] = &v95;
        [v12 getCookiePropertiesForAccount:v9 cookieDatabaseOnly:v6 withCompletion:v94];
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          if (+[AMSUnitTests isRunningUnitTests])
          {
            v13 = +[AMSLogConfig sharedAccountsCookiesConfig];
            if (!v13)
            {
              v13 = +[AMSLogConfig sharedConfig];
            }
            v14 = [v13 OSLogObject];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = AMSLogKey();
              v16 = NSString;
              uint64_t v17 = objc_opt_class();
              if (v15)
              {
                uint64_t v18 = AMSLogKey();
                v19 = NSStringFromSelector(a2);
                uint64_t v20 = [v16 stringWithFormat:@"%@: [%@] %@ ", v17, v18, v19];
              }
              else
              {
                uint64_t v18 = NSStringFromSelector(a2);
                uint64_t v20 = [v16 stringWithFormat:@"%@: %@ ", v17, v18];
                v19 = v20;
              }
              v77 = AMSLogableError(*(void **)(*(void *)&buf[8] + 40));
              *(_DWORD *)v101 = 138543618;
              v102 = v20;
              __int16 v103 = 2114;
              v104 = v77;
              _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookies. error = %{public}@", v101, 0x16u);
              if (v15) {
            }
              }
            v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v60 = +[AMSLogConfig sharedAccountsCookiesConfig];
            [v59 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v60 userInfo:0];
          }
          else
          {
            v59 = +[AMSLogConfig sharedAccountsCookiesConfig];
            if (!v59)
            {
              v59 = +[AMSLogConfig sharedConfig];
            }
            v60 = [v59 OSLogObject];
            if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
            {
              v61 = AMSLogKey();
              v62 = NSString;
              uint64_t v63 = objc_opt_class();
              if (v61)
              {
                v64 = AMSLogKey();
                v65 = NSStringFromSelector(a2);
                v66 = [v62 stringWithFormat:@"%@: [%@] %@ ", v63, v64, v65];
              }
              else
              {
                v64 = NSStringFromSelector(a2);
                v66 = [v62 stringWithFormat:@"%@: %@ ", v63, v64];
                v65 = v66;
              }
              v78 = AMSLogableError(*(void **)(*(void *)&buf[8] + 40));
              *(_DWORD *)v101 = 138543618;
              v102 = v66;
              __int16 v103 = 2114;
              v104 = v78;
              _os_log_impl(&dword_18D554000, v60, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookies. error = %{public}@", v101, 0x16u);
              if (v61) {
            }
              }
          }

          if (a5) {
            *a5 = *(id *)(*(void *)&buf[8] + 40);
          }
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        if (+[AMSUnitTests isRunningUnitTests])
        {
          v33 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v33)
          {
            v33 = +[AMSLogConfig sharedConfig];
          }
          v34 = [v33 OSLogObject];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = AMSLogKey();
            BOOL v36 = NSString;
            uint64_t v37 = objc_opt_class();
            if (v35)
            {
              v38 = AMSLogKey();
              NSStringFromSelector(a2);
              a2 = (SEL)objc_claimAutoreleasedReturnValue();
              [v36 stringWithFormat:@"%@: [%@] %@ ", v37, v38, a2];
            }
            else
            {
              v38 = NSStringFromSelector(a2);
              [v36 stringWithFormat:@"%@: %@ ", v37, v38];
            v39 = };
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v39;
            _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
            if (v35)
            {

              v39 = (void *)a2;
            }
          }
          v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v41 = +[AMSLogConfig sharedAccountsCookiesConfig];
          [v40 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v41 userInfo:0];
        }
        else
        {
          v40 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v40)
          {
            v40 = +[AMSLogConfig sharedConfig];
          }
          v41 = [v40 OSLogObject];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            id v42 = AMSLogKey();
            id v43 = NSString;
            uint64_t v44 = objc_opt_class();
            if (v42)
            {
              v45 = AMSLogKey();
              NSStringFromSelector(a2);
              a2 = (SEL)objc_claimAutoreleasedReturnValue();
              [v43 stringWithFormat:@"%@: [%@] %@ ", v44, v45, a2];
            }
            else
            {
              v45 = NSStringFromSelector(a2);
              [v43 stringWithFormat:@"%@: %@ ", v44, v45];
            v46 = };
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v46;
            _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
            if (v42)
            {

              v46 = (void *)a2;
            }
          }
        }

        if (a5)
        {
          AMSError(0, @"Method Not Found", @"Either cookie service class is Nil or it does not respond to +sharedService.", 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else if ([(AMSCookieService *)self _useInMemoryCacheForAccount:v9])
    {
      uint64_t v21 = [(AMSCookieService *)self _cachedCookiePropertiesForAccount:v9];
      v22 = (void *)v21;
      if (v21) {
        v23 = (void *)v21;
      }
      else {
        v23 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong(v96 + 5, v23);
    }
    else
    {
      v24 = objc_alloc_init(AMSDaemonConnection);
      id v93 = 0;
      v91 = [(AMSDaemonConnection *)v24 cookieServiceProxySyncWithError:&v93];
      id v25 = v93;
      if (v25)
      {
        uint64_t v26 = v25;
        if (+[AMSUnitTests isRunningUnitTests])
        {
          v27 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v27)
          {
            v27 = +[AMSLogConfig sharedConfig];
          }
          v28 = [v27 OSLogObject];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v87 = AMSLogKey();
            v29 = NSString;
            if (v87)
            {
              uint64_t v30 = objc_opt_class();
              v83 = AMSLogKey();
              v31 = NSStringFromSelector(a2);
              v32 = [v29 stringWithFormat:@"%@: [%@] %@ ", v30, v83, v31];
            }
            else
            {
              uint64_t v73 = objc_opt_class();
              v83 = NSStringFromSelector(a2);
              v32 = [v29 stringWithFormat:@"%@: %@ ", v73, v83];
              v31 = v32;
            }
            v74 = AMSLogableError(v26);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v32;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v74;
            _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
            if (v87) {
          }
            }
          v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v54 = +[AMSLogConfig sharedAccountsCookiesConfig];
          [v53 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v54 userInfo:0];
        }
        else
        {
          v53 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v53)
          {
            v53 = +[AMSLogConfig sharedConfig];
          }
          v54 = [v53 OSLogObject];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            v89 = AMSLogKey();
            v55 = NSString;
            if (v89)
            {
              uint64_t v56 = objc_opt_class();
              v85 = AMSLogKey();
              v57 = NSStringFromSelector(a2);
              v58 = [v55 stringWithFormat:@"%@: [%@] %@ ", v56, v85, v57];
            }
            else
            {
              uint64_t v75 = objc_opt_class();
              v85 = NSStringFromSelector(a2);
              v58 = [v55 stringWithFormat:@"%@: %@ ", v75, v85];
              v57 = v58;
            }
            v76 = AMSLogableError(v26);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v58;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v76;
            _os_log_impl(&dword_18D554000, v54, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
            if (v89) {
          }
            }
        }

        if (a5) {
          *a5 = v26;
        }

        id v10 = 0;
        goto LABEL_109;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v106 = __Block_byref_object_copy__23;
      v107 = __Block_byref_object_dispose__23;
      id v108 = 0;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke_35;
      v92[3] = &unk_1E55A15C0;
      v92[4] = buf;
      v92[5] = &v95;
      [v91 getCookiePropertiesForAccount:v9 cookieDatabaseOnly:v6 withCompletion:v92];

      if (*(void *)(*(void *)&buf[8] + 40))
      {
        if (+[AMSUnitTests isRunningUnitTests])
        {
          __int16 v47 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v47)
          {
            __int16 v47 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v48 = [v47 OSLogObject];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v88 = AMSLogKey();
            __int16 v49 = NSString;
            uint64_t v50 = objc_opt_class();
            if (v88)
            {
              v84 = AMSLogKey();
              uint64_t v51 = NSStringFromSelector(a2);
              v52 = [v49 stringWithFormat:@"%@: [%@] %@ ", v50, v84, v51];
            }
            else
            {
              v84 = NSStringFromSelector(a2);
              v52 = [v49 stringWithFormat:@"%@: %@ ", v50, v84];
              uint64_t v51 = v52;
            }
            v79 = AMSLogableError(*(void **)(*(void *)&buf[8] + 40));
            *(_DWORD *)v101 = 138543618;
            v102 = v52;
            __int16 v103 = 2114;
            v104 = v79;
            _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", v101, 0x16u);
            if (v88) {
          }
            }
          v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v68 = +[AMSLogConfig sharedAccountsCookiesConfig];
          [v67 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v68 userInfo:0];
        }
        else
        {
          v67 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v67)
          {
            v67 = +[AMSLogConfig sharedConfig];
          }
          v68 = [v67 OSLogObject];
          if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
          {
            v90 = AMSLogKey();
            v69 = NSString;
            uint64_t v70 = objc_opt_class();
            if (v90)
            {
              v86 = AMSLogKey();
              v71 = NSStringFromSelector(a2);
              v72 = [v69 stringWithFormat:@"%@: [%@] %@ ", v70, v86, v71];
            }
            else
            {
              v86 = NSStringFromSelector(a2);
              v72 = [v69 stringWithFormat:@"%@: %@ ", v70, v86];
              v71 = v72;
            }
            v80 = AMSLogableError(*(void **)(*(void *)&buf[8] + 40));
            *(_DWORD *)v101 = 138543618;
            v102 = v72;
            __int16 v103 = 2114;
            v104 = v80;
            _os_log_impl(&dword_18D554000, v68, OS_LOG_TYPE_FAULT, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", v101, 0x16u);
            if (v90) {
          }
            }
        }

        if (a5) {
          *a5 = *(id *)(*(void *)&buf[8] + 40);
        }
      }
      if (!v6)
      {
        id v81 = v96[5];
        if (v81) {
          [(AMSCookieService *)self _cacheCookieProperties:v81 forAccount:v9];
        }
        else {
          [(AMSCookieService *)self clearCookiePropertyCacheForAccount:v9];
        }
      }
      _Block_object_dispose(buf, 8);
    }
    id v10 = v96[5];
LABEL_109:
    _Block_object_dispose(&v95, 8);
  }
  return v10;
}

- (void)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 forAccount:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void))a6;
  if ([(id)objc_opt_class() _isEntitledForDirectCookieAccess])
  {
    Class v14 = NSClassFromString(&cfstr_Amsdcookieserv.isa);
    NSSelectorFromString(&cfstr_Sharedservice.isa);
    if (objc_opt_respondsToSelector())
    {
      v15 = [(objc_class *)v14 performSelector:sel_sharedService];
      [v15 updateCookiesWithCookiePropertiesToAdd:v10 cookiePropertiesToRemove:v11 forAccount:v12 withCompletion:v13];
LABEL_12:
    }
  }
  else
  {
    if ([(AMSCookieService *)self _useInMemoryCacheForAccount:v12])
    {
      os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
      os_unfair_lock_lock(&self->_inMemoryStorageLock);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke;
      aBlock[3] = &unk_1E559EA90;
      aBlock[4] = self;
      v15 = (void (**)(void))_Block_copy(aBlock);
      v16 = [(AMSCookieService *)self inMemoryStorage];
      uint64_t v17 = [v12 identifier];
      uint64_t v18 = [v16 objectForKey:v17];
      id v19 = (id)[v18 mutableCopy];

      if (!v19) {
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      [v19 addObjectsFromArray:v10];
      [v19 removeObjectsInArray:v11];
      if ([v19 count])
      {
        uint64_t v20 = [(AMSCookieService *)self inMemoryStorage];
        uint64_t v21 = (void *)[v19 copy];
        v22 = [v12 identifier];
        [v20 setObject:v21 forKey:v22];
      }
      else
      {
        uint64_t v20 = [(AMSCookieService *)self inMemoryStorage];
        uint64_t v21 = [v12 identifier];
        [v20 removeObjectForKey:v21];
      }

      v13[2](v13, 1, 0);
      v15[2](v15);
      goto LABEL_12;
    }
    [(AMSCookieService *)self clearCookiePropertyCacheForAccount:v12];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    BOOL v36 = __Block_byref_object_copy__23;
    uint64_t v37 = __Block_byref_object_dispose__23;
    v38 = objc_alloc_init(AMSDaemonConnection);
    v23 = [(id)v34[5] cookieServiceProxy];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_2;
    v29[3] = &unk_1E55A15E8;
    id v30 = v10;
    id v31 = v11;
    id v32 = v12;
    v24 = [v23 thenWithBlock:v29];
    id v25 = [v24 binaryPromiseAdapter];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_3;
    v26[3] = &unk_1E55A1610;
    v28 = &v33;
    v27 = v13;
    [v25 resultWithCompletion:v26];

    _Block_object_dispose(&v33, 8);
  }
}

- (BOOL)_useInMemoryCacheForAccount:(id)a3
{
  id v3 = a3;
  if (([(id)objc_opt_class() _currentUserIsSystemSetupUser] & 1) != 0
    || +[AMSUnitTests isRunningUnitTests])
  {
    char v4 = 1;
  }
  else
  {
    char v4 = objc_msgSend(v3, "ams_isEphemeralAccount");
  }

  return v4;
}

+ (BOOL)_isEntitledForDirectCookieAccess
{
  v2 = +[AMSProcessInfo currentProcess];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.amsaccountsd"];

  return v4;
}

+ (BOOL)_currentUserIsSystemSetupUser
{
  return 0;
}

- (void)clearCookiePropertyCacheForAccount:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  BOOL v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      id v10 = AMSLogKey();
      id v11 = NSStringFromSelector(a2);
      id v3 = [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v11];
    }
    else
    {
      id v10 = NSStringFromSelector(a2);
      id v3 = [v8 stringWithFormat:@"%@: %@ ", v9, v10];
      id v11 = v3;
    }
    id v12 = [v46 identifier];
    v13 = AMSHashIfNeeded(v12);
    *(_DWORD *)buf = 138543618;
    __int16 v49 = v3;
    __int16 v50 = 2114;
    uint64_t v51 = v13;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Clearing cookie cache for account with identifier: %{public}@", buf, 0x16u);

    if (v7) {
  }
    }

  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__AMSCookieService_clearCookiePropertyCacheForAccount___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  aBlock[4] = self;
  Class v14 = (void (**)(void))_Block_copy(aBlock);
  v15 = [(AMSCookieService *)self inMemoryStorage];
  [v15 setDelegate:0];

  v16 = [(AMSCookieService *)self inMemoryStorage];
  uint64_t v17 = [v46 identifier];
  [v16 removeObjectForKey:v17];

  uint64_t v18 = [(AMSCookieService *)self inMemoryStorage];
  [v18 setDelegate:self];

  id v19 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v19)
  {
    id v19 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = AMSLogKey();
    v22 = NSString;
    uint64_t v23 = objc_opt_class();
    if (v21)
    {
      v24 = AMSLogKey();
      id v3 = NSStringFromSelector(a2);
      [v22 stringWithFormat:@"%@: [%@] %@ ", v23, v24, v3];
    }
    else
    {
      v24 = NSStringFromSelector(a2);
      [v22 stringWithFormat:@"%@: %@ ", v23, v24];
    id v25 = };
    *(_DWORD *)buf = 138543362;
    __int16 v49 = v25;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Account entries removed from cache.", buf, 0xCu);
    if (v21)
    {

      id v25 = v3;
    }
  }
  uint64_t v26 = [(AMSCookieService *)self inMemoryStorage];
  v27 = [v26 allObjects];
  BOOL v28 = [v27 count] == 0;

  if (v28)
  {
    uint64_t v37 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v37)
    {
      uint64_t v37 = +[AMSLogConfig sharedConfig];
    }
    v38 = [v37 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v39 = AMSLogKey();
      v40 = NSString;
      if (v39)
      {
        uint64_t v41 = objc_opt_class();
        id v42 = AMSLogKey();
        uint64_t v43 = NSStringFromSelector(a2);
        [v40 stringWithFormat:@"%@: [%@] %@ ", v41, v42, v43];
      }
      else
      {
        uint64_t v43 = objc_opt_class();
        id v42 = NSStringFromSelector(a2);
        [v40 stringWithFormat:@"%@: %@ ", v43, v42];
      uint64_t v44 = };
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v44;
      _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Cache is now empty. Unregistering from cookie change notifications.", buf, 0xCu);
      if (v39)
      {

        uint64_t v44 = (void *)v43;
      }
    }
    [(AMSCookieService *)self _unregisterFromCookieChangeNotifications];
  }
  else
  {
    v29 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v29)
    {
      v29 = +[AMSLogConfig sharedConfig];
    }
    id v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      id v31 = AMSLogKey();
      id v32 = NSString;
      if (v31)
      {
        uint64_t v33 = objc_opt_class();
        v34 = AMSLogKey();
        uint64_t v35 = NSStringFromSelector(a2);
        [v32 stringWithFormat:@"%@: [%@] %@ ", v33, v34, v35];
      }
      else
      {
        uint64_t v35 = objc_opt_class();
        v34 = NSStringFromSelector(a2);
        [v32 stringWithFormat:@"%@: %@ ", v35, v34];
      BOOL v36 = };
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v36;
      _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Cache is not empty. Not unregistering from cookie change notifications.", buf, 0xCu);
      if (v31)
      {

        BOOL v36 = (void *)v35;
      }
    }
  }
  v14[2](v14);
}

void __55__AMSCookieService_clearCookiePropertyCacheForAccount___block_invoke(uint64_t a1)
{
}

void __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  void *v7 = v9;
}

- (void)clearCookiePropertyCache
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  BOOL v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      id v10 = AMSLogKey();
      uint64_t v2 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v2];
    }
    else
    {
      id v10 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    id v11 = };
    *(_DWORD *)buf = 138543362;
    id v25 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Clearing cookie cache.", buf, 0xCu);
    if (v7)
    {

      id v11 = (void *)v2;
    }
  }
  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__AMSCookieService_clearCookiePropertyCache__block_invoke;
  aBlock[3] = &unk_1E559EA90;
  aBlock[4] = self;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  v13 = [(AMSCookieService *)self inMemoryStorage];
  [v13 setDelegate:0];

  Class v14 = [(AMSCookieService *)self inMemoryStorage];
  [v14 removeAllObjects];

  v15 = [(AMSCookieService *)self inMemoryStorage];
  [v15 setDelegate:self];

  v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v16)
  {
    v16 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = AMSLogKey();
    id v19 = NSString;
    uint64_t v20 = objc_opt_class();
    if (v18)
    {
      uint64_t v21 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, a2];
    }
    else
    {
      uint64_t v21 = NSStringFromSelector(a2);
      [v19 stringWithFormat:@"%@: %@ ", v20, v21];
    v22 = };
    *(_DWORD *)buf = 138543362;
    id v25 = v22;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Cache cleared. Unregistering from cookie change notifications.", buf, 0xCu);
    if (v18)
    {

      v22 = (void *)a2;
    }
  }
  [(AMSCookieService *)self _unregisterFromCookieChangeNotifications];
  v12[2](v12);
}

- (void)_unregisterFromCookieChangeNotifications
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  BOOL v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      id v10 = AMSLogKey();
      uint64_t v2 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v2];
    }
    else
    {
      id v10 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    id v11 = };
    *(_DWORD *)buf = 138543362;
    BOOL v28 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Unregistering from cookie change notifications.", buf, 0xCu);
    if (v7)
    {

      id v11 = (void *)v2;
    }
  }
  os_unfair_lock_assert_owner(&self->_inMemoryStorageLock);
  if ([(AMSCookieService *)self isObservingNotifications])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.AppleMediaServices.cookieschanged", 0);
    v13 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    Class v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = AMSLogKey();
      v16 = NSString;
      uint64_t v17 = objc_opt_class();
      if (v15)
      {
        uint64_t v18 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        [v16 stringWithFormat:@"%@: [%@] %@ ", v17, v18, a2];
      }
      else
      {
        uint64_t v18 = NSStringFromSelector(a2);
        [v16 stringWithFormat:@"%@: %@ ", v17, v18];
      id v19 = };
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Unregistered from cookie change notifications.", buf, 0xCu);
      if (v15)
      {

        id v19 = (void *)a2;
      }
    }
    [(AMSCookieService *)self setIsObservingNotifications:0];
  }
  else
  {
    uint64_t v20 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = AMSLogKey();
      uint64_t v23 = NSString;
      uint64_t v24 = objc_opt_class();
      if (v22)
      {
        id v25 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        [v23 stringWithFormat:@"%@: [%@] %@ ", v24, v25, a2];
      }
      else
      {
        id v25 = NSStringFromSelector(a2);
        [v23 stringWithFormat:@"%@: %@ ", v24, v25];
      uint64_t v26 = };
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v26;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEBUG, "%{public}@We weren’t registered, nothing to do.", buf, 0xCu);
      if (v22)
      {

        uint64_t v26 = (void *)a2;
      }
    }
  }
}

- (void)_registerForCookieChangeNotifications
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  BOOL v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      id v10 = AMSLogKey();
      uint64_t v2 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v2];
    }
    else
    {
      id v10 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    id v11 = };
    *(_DWORD *)buf = 138543362;
    BOOL v28 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Registering for cookie change notifications.", buf, 0xCu);
    if (v7)
    {

      id v11 = (void *)v2;
    }
  }
  os_unfair_lock_assert_owner(&self->_inMemoryStorageLock);
  if ([(AMSCookieService *)self isObservingNotifications])
  {
    id v12 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      Class v14 = AMSLogKey();
      v15 = NSString;
      uint64_t v16 = objc_opt_class();
      if (v14)
      {
        uint64_t v17 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        [v15 stringWithFormat:@"%@: [%@] %@ ", v16, v17, a2];
      }
      else
      {
        uint64_t v17 = NSStringFromSelector(a2);
        [v15 stringWithFormat:@"%@: %@ ", v16, v17];
      uint64_t v18 = };
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v18;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEBUG, "%{public}@We’re already registered, nothing to do.", buf, 0xCu);
      if (v14)
      {

        uint64_t v18 = (void *)a2;
      }
    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)HandleCookiesChangedNotification, @"com.apple.AppleMediaServices.cookieschanged", 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v20 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = AMSLogKey();
      uint64_t v23 = NSString;
      uint64_t v24 = objc_opt_class();
      if (v22)
      {
        id v25 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        [v23 stringWithFormat:@"%@: [%@] %@ ", v24, v25, a2];
      }
      else
      {
        id v25 = NSStringFromSelector(a2);
        [v23 stringWithFormat:@"%@: %@ ", v24, v25];
      uint64_t v26 = };
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v26;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Registered for cookie change notifications.", buf, 0xCu);
      if (v22)
      {

        uint64_t v26 = (void *)a2;
      }
    }
    [(AMSCookieService *)self setIsObservingNotifications:1];
  }
}

- (void)_cacheCookieProperties:(id)a3 forAccount:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a4;
  BOOL v6 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v6)
  {
    BOOL v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = AMSLogKey();
    uint64_t v9 = NSString;
    uint64_t v10 = objc_opt_class();
    if (v8)
    {
      id v11 = AMSLogKey();
      id v12 = NSStringFromSelector(a2);
      v13 = [v9 stringWithFormat:@"%@: [%@] %@ ", v10, v11, v12];
    }
    else
    {
      id v11 = NSStringFromSelector(a2);
      v13 = [v9 stringWithFormat:@"%@: %@ ", v10, v11];
      id v12 = v13;
    }
    Class v14 = [v35 identifier];
    v15 = AMSHashIfNeeded(v14);
    *(_DWORD *)buf = 138543618;
    v38 = v13;
    __int16 v39 = 2114;
    v40 = v15;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Caching cookies for account with identifier: %{public}@", buf, 0x16u);

    if (v8) {
  }
    }

  os_unfair_lock_assert_not_owner(&self->_inMemoryStorageLock);
  os_unfair_lock_lock(&self->_inMemoryStorageLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__AMSCookieService__cacheCookieProperties_forAccount___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  aBlock[4] = self;
  uint64_t v16 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v17 = [(AMSCookieService *)self inMemoryStorage];
  uint64_t v18 = [v35 identifier];
  [v17 setObject:v34 forKey:v18];

  id v19 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v19)
  {
    id v19 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = AMSLogKey();
    v22 = NSString;
    uint64_t v23 = objc_opt_class();
    if (v21)
    {
      uint64_t v24 = AMSLogKey();
      uint64_t v18 = NSStringFromSelector(a2);
      [v22 stringWithFormat:@"%@: [%@] %@ ", v23, v24, v18];
    }
    else
    {
      uint64_t v24 = NSStringFromSelector(a2);
      [v22 stringWithFormat:@"%@: %@ ", v23, v24];
    id v25 = };
    *(_DWORD *)buf = 138543362;
    v38 = v25;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Account cookies added to cache.", buf, 0xCu);
    if (v21)
    {

      id v25 = v18;
    }
  }
  if (![(AMSCookieService *)self isObservingNotifications])
  {
    uint64_t v26 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v26)
    {
      uint64_t v26 = +[AMSLogConfig sharedConfig];
    }
    v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      BOOL v28 = AMSLogKey();
      uint64_t v29 = NSString;
      uint64_t v30 = objc_opt_class();
      if (v28)
      {
        id v31 = AMSLogKey();
        uint64_t v18 = NSStringFromSelector(a2);
        [v29 stringWithFormat:@"%@: [%@] %@ ", v30, v31, v18];
      }
      else
      {
        id v31 = NSStringFromSelector(a2);
        [v29 stringWithFormat:@"%@: %@ ", v30, v31];
      id v32 = };
      *(_DWORD *)buf = 138543362;
      v38 = v32;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEBUG, "%{public}@We were not previously observing cookie change notifications, registering for them.", buf, 0xCu);
      if (v28)
      {

        id v32 = v18;
      }
    }
    [(AMSCookieService *)self _registerForCookieChangeNotifications];
  }
  v16[2](v16);
}

- (BOOL)isObservingNotifications
{
  return self->_isObservingNotifications;
}

void __54__AMSCookieService__cacheCookieProperties_forAccount___block_invoke(uint64_t a1)
{
}

- (void)setIsObservingNotifications:(BOOL)a3
{
  self->_isObservingNotifications = a3;
}

void __44__AMSCookieService_clearCookiePropertyCache__block_invoke(uint64_t a1)
{
}

id __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_alloc_init(AMSBinaryPromise);
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = [(AMSBinaryPromise *)v4 completionHandlerAdapter];
  [v3 updateCookiesWithCookiePropertiesToAdd:v5 cookiePropertiesToRemove:v6 forAccount:v7 withCompletion:v8];

  uint64_t v9 = [(AMSBinaryPromise *)v4 promiseAdapter];

  return v9;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      uint64_t v10 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, a2];
    }
    else
    {
      uint64_t v10 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    id v11 = };
    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@In-memory cache is evicting an object.", buf, 0xCu);
    if (v7)
    {

      id v11 = (void *)a2;
    }
  }
}

- (void)clearDanglingCookieDatabasesWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void, id))a3;
  Class v5 = NSClassFromString(&cfstr_Amsdcookieserv.isa);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(objc_class *)v5 performSelector:sel_sharedService];
    [(AMSDaemonConnection *)v6 clearDanglingCookieDatabasesWithCompletion:v4];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(AMSDaemonConnection);
    id v35 = 0;
    uint64_t v7 = [(AMSDaemonConnection *)v6 cookieServiceProxySyncWithError:&v35];
    id v8 = v35;
    if (v8)
    {
      BOOL v9 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v10 = +[AMSLogConfig sharedAccountsCookiesConfig];
      id v11 = (void *)v10;
      if (v9)
      {
        if (!v10)
        {
          id v11 = +[AMSLogConfig sharedConfig];
        }
        id v12 = [v11 OSLogObject];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = AMSLogKey();
          uint64_t v14 = NSString;
          uint64_t v15 = objc_opt_class();
          if (v13)
          {
            AMSLogKey();
            uint64_t v30 = v14;
            uint64_t v17 = v16 = v13;
            uint64_t v32 = NSStringFromSelector(a2);
            uint64_t v33 = (void *)v17;
            uint64_t v28 = v17;
            v13 = v16;
            [v30 stringWithFormat:@"%@: [%@] %@ ", v15, v28, v32];
          }
          else
          {
            uint64_t v33 = NSStringFromSelector(a2);
            [v14 stringWithFormat:@"%@: %@ ", v15, v33];
          uint64_t v18 = };
          uint64_t v26 = AMSLogableError(v8);
          *(_DWORD *)buf = 138543618;
          uint64_t v37 = v18;
          __int16 v38 = 2114;
          __int16 v39 = v26;
          _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v13)
          {

            uint64_t v18 = (void *)v32;
          }
        }
        id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v19 = +[AMSLogConfig sharedAccountsCookiesConfig];
        [v11 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v19 userInfo:0];
      }
      else
      {
        if (!v10)
        {
          id v11 = +[AMSLogConfig sharedConfig];
        }
        id v19 = [v11 OSLogObject];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          uint64_t v20 = AMSLogKey();
          uint64_t v21 = NSString;
          uint64_t v22 = objc_opt_class();
          if (v20)
          {
            AMSLogKey();
            id v31 = v21;
            v24 = uint64_t v23 = v20;
            uint64_t v32 = NSStringFromSelector(a2);
            id v34 = (void *)v24;
            uint64_t v29 = v24;
            uint64_t v20 = v23;
            [v31 stringWithFormat:@"%@: [%@] %@ ", v22, v29, v32];
          }
          else
          {
            id v34 = NSStringFromSelector(a2);
            [v21 stringWithFormat:@"%@: %@ ", v22, v34];
          id v25 = };
          v27 = AMSLogableError(v8);
          *(_DWORD *)buf = 138543618;
          uint64_t v37 = v25;
          __int16 v38 = 2114;
          __int16 v39 = v27;
          _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v20)
          {

            id v25 = (void *)v32;
          }
        }
      }

      v4[2](v4, 0, v8);
    }
    else
    {
      [v7 clearDanglingCookieDatabasesWithCompletion:v4];
    }
  }
}

- (void)getCookieDatabasePathForAccount:(id)a3 withCompletion:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() _isEntitledForDirectCookieAccess])
  {
    Class v8 = NSClassFromString(&cfstr_Amsdcookieserv.isa);
    if (objc_opt_respondsToSelector())
    {
      BOOL v9 = [(objc_class *)v8 performSelector:sel_sharedService];
      if (v9)
      {
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke;
        v68[3] = &unk_1E55A1570;
        v68[4] = self;
        SEL v70 = a2;
        id v69 = v7;
        [(AMSDaemonConnection *)v9 getCookieDatabasePathForAccount:v62 withCompletion:v68];
      }
      else
      {
        uint64_t v41 = +[AMSUnitTests isRunningUnitTests];
        uint64_t v42 = +[AMSLogConfig sharedAccountsCookiesConfig];
        uint64_t v43 = (void *)v42;
        if (v41)
        {
          if (!v42)
          {
            uint64_t v43 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v44 = [v43 OSLogObject];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = AMSLogKey();
            id v46 = NSString;
            uint64_t v47 = objc_opt_class();
            if (v45)
            {
              uint64_t v48 = AMSLogKey();
              uint64_t v41 = NSStringFromSelector(a2);
              [v46 stringWithFormat:@"%@: [%@] %@ ", v47, v48, v41];
            }
            else
            {
              uint64_t v48 = NSStringFromSelector(a2);
              [v46 stringWithFormat:@"%@: %@ ", v47, v48];
            __int16 v49 = };
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v49;
            _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service.", buf, 0xCu);
            if (v45)
            {

              __int16 v49 = (void *)v41;
            }
          }
          uint64_t v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
          __int16 v50 = +[AMSLogConfig sharedAccountsCookiesConfig];
          [v43 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v50 userInfo:0];
        }
        else
        {
          if (!v42)
          {
            uint64_t v43 = +[AMSLogConfig sharedConfig];
          }
          __int16 v50 = [v43 OSLogObject];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            uint64_t v51 = AMSLogKey();
            uint64_t v52 = NSString;
            uint64_t v53 = objc_opt_class();
            if (v51)
            {
              v54 = AMSLogKey();
              uint64_t v41 = NSStringFromSelector(a2);
              [v52 stringWithFormat:@"%@: [%@] %@ ", v53, v54, v41];
            }
            else
            {
              v54 = NSStringFromSelector(a2);
              [v52 stringWithFormat:@"%@: %@ ", v53, v54];
            v55 = };
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v55;
            _os_log_impl(&dword_18D554000, v50, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service.", buf, 0xCu);
            if (v51)
            {

              v55 = (void *)v41;
            }
          }
        }

        v58 = AMSError(0, 0, 0, 0);
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v58);

        BOOL v9 = 0;
      }
    }
    else
    {
      uint64_t v20 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v21 = +[AMSLogConfig sharedAccountsCookiesConfig];
      uint64_t v22 = (void *)v21;
      if (v20)
      {
        if (!v21)
        {
          uint64_t v22 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v23 = [v22 OSLogObject];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = AMSLogKey();
          id v25 = NSString;
          uint64_t v26 = objc_opt_class();
          if (v24)
          {
            v27 = AMSLogKey();
            uint64_t v20 = NSStringFromSelector(a2);
            [v25 stringWithFormat:@"%@: [%@] %@ ", v26, v27, v20];
          }
          else
          {
            v27 = NSStringFromSelector(a2);
            [v25 stringWithFormat:@"%@: %@ ", v26, v27];
          uint64_t v28 = };
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v28;
          _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
          if (v24)
          {

            uint64_t v28 = (void *)v20;
          }
        }
        uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v35 = +[AMSLogConfig sharedAccountsCookiesConfig];
        [v22 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v35 userInfo:0];
      }
      else
      {
        if (!v21)
        {
          uint64_t v22 = +[AMSLogConfig sharedConfig];
        }
        id v35 = [v22 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          BOOL v36 = AMSLogKey();
          uint64_t v37 = NSString;
          uint64_t v38 = objc_opt_class();
          if (v36)
          {
            __int16 v39 = AMSLogKey();
            uint64_t v20 = NSStringFromSelector(a2);
            [v37 stringWithFormat:@"%@: [%@] %@ ", v38, v39, v20];
          }
          else
          {
            __int16 v39 = NSStringFromSelector(a2);
            [v37 stringWithFormat:@"%@: %@ ", v38, v39];
          uint64_t v40 = };
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v40;
          _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, does not respond to sharedService selector", buf, 0xCu);
          if (v36)
          {

            uint64_t v40 = (void *)v20;
          }
        }
      }

      AMSError(0, @"Method Not Found", @"Either cookie service class is Nil or it does not respond to +sharedService.", 0);
      BOOL v9 = (AMSDaemonConnection *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, AMSDaemonConnection *))v7 + 2))(v7, 0, v9);
    }
  }
  else
  {
    BOOL v9 = objc_alloc_init(AMSDaemonConnection);
    id v67 = 0;
    v61 = [(AMSDaemonConnection *)v9 cookieServiceProxySyncWithError:&v67];
    id v10 = v67;
    if (v10)
    {
      BOOL v11 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v12 = +[AMSLogConfig sharedAccountsCookiesConfig];
      v13 = (void *)v12;
      if (v11)
      {
        if (!v12)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v14 = [v13 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v59 = AMSLogKey();
          uint64_t v15 = NSString;
          uint64_t v16 = objc_opt_class();
          if (v59)
          {
            uint64_t v17 = AMSLogKey();
            uint64_t v18 = NSStringFromSelector(a2);
            id v19 = [v15 stringWithFormat:@"%@: [%@] %@ ", v16, v17, v18];
          }
          else
          {
            uint64_t v17 = NSStringFromSelector(a2);
            id v19 = [v15 stringWithFormat:@"%@: %@ ", v16, v17];
            uint64_t v18 = v19;
          }
          uint64_t v56 = AMSLogableError(v10);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v56;
          _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v59) {
        }
          }
        v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v29 = +[AMSLogConfig sharedAccountsCookiesConfig];
        [v13 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v29 userInfo:0];
      }
      else
      {
        if (!v12)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v29 = [v13 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          v60 = AMSLogKey();
          uint64_t v30 = NSString;
          uint64_t v31 = objc_opt_class();
          if (v60)
          {
            uint64_t v32 = AMSLogKey();
            uint64_t v33 = NSStringFromSelector(a2);
            id v34 = [v30 stringWithFormat:@"%@: [%@] %@ ", v31, v32, v33];
          }
          else
          {
            uint64_t v32 = NSStringFromSelector(a2);
            id v34 = [v30 stringWithFormat:@"%@: %@ ", v31, v32];
            uint64_t v33 = v34;
          }
          v57 = AMSLogableError(v10);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v57;
          _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_FAULT, "%{public}@Failed to get XPC proxy object for cookie service. error = %{public}@", buf, 0x16u);
          if (v60) {
        }
          }
      }

      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v72 = __Block_byref_object_copy__23;
      uint64_t v73 = __Block_byref_object_dispose__23;
      id v74 = 0;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke_33;
      v63[3] = &unk_1E55A1598;
      v65 = buf;
      SEL v66 = a2;
      v63[4] = self;
      id v64 = v7;
      [v61 getCookieDatabasePathForAccount:v62 withCompletion:v63];

      _Block_object_dispose(buf, 8);
    }
  }
}

void __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = +[AMSUnitTests isRunningUnitTests];
    Class v8 = off_1E559C000;
    uint64_t v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
    id v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      BOOL v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = AMSLogKey();
        v13 = NSString;
        uint64_t v14 = objc_opt_class();
        if (v12)
        {
          uint64_t v15 = AMSLogKey();
          uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 48));
          [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, v25];
        }
        else
        {
          uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
          [v13 stringWithFormat:@"%@: %@ ", v14, v15];
        uint64_t v16 = };
        uint64_t v23 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v23;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookie database path. error = %{public}@", buf, 0x16u);
        if (v12)
        {

          uint64_t v16 = (void *)v25;
        }
      }
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v17 = +[AMSLogConfig sharedAccountsCookiesConfig];
      [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v17 userInfo:0];
    }
    else
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v10 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = AMSLogKey();
        id v19 = NSString;
        uint64_t v20 = objc_opt_class();
        if (v18)
        {
          uint64_t v21 = AMSLogKey();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          Class v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, v8];
        }
        else
        {
          uint64_t v21 = NSStringFromSelector(*(SEL *)(a1 + 48));
          [v19 stringWithFormat:@"%@: %@ ", v20, v21];
        uint64_t v22 = };
        uint64_t v24 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2114;
        uint64_t v29 = v24;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct cookie access, Failed to retrieve cookie database path. error = %{public}@", buf, 0x16u);
        if (v18)
        {

          uint64_t v22 = v8;
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__AMSCookieService_getCookieDatabasePathForAccount_withCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v7 = +[AMSUnitTests isRunningUnitTests];
    Class v8 = off_1E559C000;
    uint64_t v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
    id v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      BOOL v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = AMSLogKey();
        v13 = NSString;
        uint64_t v14 = objc_opt_class();
        if (v12)
        {
          uint64_t v15 = AMSLogKey();
          uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 56));
          [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, v25];
        }
        else
        {
          uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
          [v13 stringWithFormat:@"%@: %@ ", v14, v15];
        uint64_t v16 = };
        uint64_t v23 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v23;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", buf, 0x16u);
        if (v12)
        {

          uint64_t v16 = (void *)v25;
        }
      }
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v17 = +[AMSLogConfig sharedAccountsCookiesConfig];
      [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v17 userInfo:0];
    }
    else
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v10 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = AMSLogKey();
        id v19 = NSString;
        uint64_t v20 = objc_opt_class();
        if (v18)
        {
          uint64_t v21 = AMSLogKey();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          Class v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, v8];
        }
        else
        {
          uint64_t v21 = NSStringFromSelector(*(SEL *)(a1 + 56));
          [v19 stringWithFormat:@"%@: %@ ", v20, v21];
        uint64_t v22 = };
        uint64_t v24 = AMSLogableError(v6);
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2114;
        uint64_t v29 = v24;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_FAULT, "%{public}@Failed to get cookies from cookie service over XPC. error = %{public}@", buf, 0x16u);
        if (v18)
        {

          uint64_t v22 = v8;
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getCookiePropertiesForAccount:(id)a3 withCompletion:(id)a4
{
}

- (void)getCookiePropertiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v11 = 0;
  Class v8 = (void (**)(id, void *, id))a5;
  uint64_t v9 = [(AMSCookieService *)self getCookiePropertiesForAccount:a3 cookieDatabaseOnly:v5 error:&v11];
  id v10 = v11;
  v8[2](v8, v9, v10);
}

- (id)getCookiePropertiesForAccount:(id)a3 error:(id *)a4
{
  return [(AMSCookieService *)self getCookiePropertiesForAccount:a3 cookieDatabaseOnly:0 error:a4];
}

void __75__AMSCookieService_getCookiePropertiesForAccount_cookieDatabaseOnly_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    Class v8 = v5;
  }
  else
  {
    BOOL v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    Class v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  void *v7 = v9;
}

void __110__AMSCookieService_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_forAccount_withCompletion___block_invoke(uint64_t a1)
{
}

- (os_unfair_lock_s)inMemoryStorageLock
{
  return self->_inMemoryStorageLock;
}

- (void).cxx_destruct
{
}

@end