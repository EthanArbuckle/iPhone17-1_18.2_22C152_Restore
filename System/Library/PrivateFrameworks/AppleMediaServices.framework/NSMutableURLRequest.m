@interface NSMutableURLRequest
@end

@implementation NSMutableURLRequest

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = +[AMSUnitTests isRunningUnitTests];
    v8 = off_1E559C000;
    uint64_t v9 = +[AMSLogConfig sharedConfig];
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = AMSLogKey();
        v13 = NSString;
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = v14;
        if (v12)
        {
          uint64_t v34 = AMSLogKey();
          [v13 stringWithFormat:@"%@: [%@] ", v15, v34];
        }
        else
        {
          [v13 stringWithFormat:@"%@: ", v14];
        v16 = };
        v27 = AMSLogableError(v6);
        v28 = [*(id *)(a1 + 32) URL];
        v29 = AMSHashIfNeeded(v28);
        *(_DWORD *)buf = 138543874;
        v36 = v16;
        __int16 v37 = 2114;
        v38 = v27;
        __int16 v39 = 2114;
        v40 = v29;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error when handling account and analytics cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v12)
        {

          v16 = (void *)v34;
        }
      }
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v21 = +[AMSLogConfig sharedConfig];
      [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v21 userInfo:0];
    }
    else
    {
      if (!v9)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v21 = [v10 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = AMSLogKey();
        v23 = NSString;
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = v24;
        if (v22)
        {
          AMSLogKey();
          v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          [v23 stringWithFormat:@"%@: [%@] ", v25, v8];
        }
        else
        {
          [v23 stringWithFormat:@"%@: ", v24];
        v26 = };
        v30 = AMSLogableError(v6);
        v31 = [*(id *)(a1 + 32) URL];
        v32 = AMSHashIfNeeded(v31);
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        __int16 v37 = 2114;
        v38 = v30;
        __int16 v39 = 2114;
        v40 = v32;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error when handling account and analytics cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v22)
        {

          v26 = v8;
        }
      }
    }

    v17 = AMSError(0, @"Unexpected error when handling combined account and analytics cookie-promises.", 0, 0);
    v20 = +[AMSPromise promiseWithError:v17];
  }
  else
  {
    v17 = [v5 objectAtIndexedSubscript:0];
    v18 = [v5 objectAtIndexedSubscript:1];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v19 addEntriesFromDictionary:v18];
    [v19 addEntriesFromDictionary:v17];
    v20 = +[AMSPromise promiseWithResult:v19];
  }
  return v20;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_127(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:1];

  LOBYTE(v3) = [v5 BOOLValue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2;
  v13[3] = &unk_1E55A8B00;
  v13[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v11;
  long long v14 = v11;
  char v15 = *(unsigned char *)(a1 + 56);
  char v16 = (char)v3;
  BOOL v7 = objc_msgSend(v4, "ams_mapWithTransform:", v13);
  v8 = +[AMSPromise promiseWithAll:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_146;
  v12[3] = &unk_1E55A8AB8;
  v12[4] = *(void *)(a1 + 32);
  uint64_t v9 = [v8 continueWithBlock:v12];

  return v9;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      BOOL v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v3 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      v13 = };
      v18 = AMSLogableError(v6);
      id v19 = [*(id *)(a1 + 32) URL];
      v20 = AMSHashIfNeeded(v19);
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      v26 = v18;
      __int16 v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Defaulting to not including analytics cookies since client ID domains couldn't be fetched from bag. This is not an error. This has no functional impact. bag-result = %{public}@ | URL = %{public}@", buf, 0x20u);

      if (v9)
      {

        v13 = (void *)v3;
      }
    }
    v17 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_124;
    v22[3] = &unk_1E559F720;
    v22[4] = *(void *)(a1 + 32);
    long long v14 = objc_msgSend(a2, "ams_firstObjectPassingTest:", v22);
    BOOL v15 = v14 != 0;

    char v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v15];
    v17 = +[AMSPromise promiseWithResult:v16];
  }
  return v17;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = +[AMSUnitTests isRunningUnitTests];
    v8 = off_1E559C000;
    uint64_t v9 = +[AMSLogConfig sharedConfig];
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = AMSLogKey();
        v13 = NSString;
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = v14;
        if (v12)
        {
          uint64_t v40 = AMSLogKey();
          [v13 stringWithFormat:@"%@: [%@] ", v15, v40];
        }
        else
        {
          [v13 stringWithFormat:@"%@: ", v14];
        char v16 = };
        v32 = AMSLogableError(v6);
        v33 = [*(id *)(a1 + 32) URL];
        uint64_t v34 = AMSHashIfNeeded(v33);
        *(_DWORD *)buf = 138543874;
        v47 = v16;
        __int16 v48 = 2114;
        v49 = v32;
        __int16 v50 = 2114;
        v51 = v34;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error when handling combined cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v12)
        {

          char v16 = (void *)v40;
        }
      }
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v26 = +[AMSLogConfig sharedConfig];
      [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v26 userInfo:0];
    }
    else
    {
      if (!v9)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v10 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        __int16 v27 = AMSLogKey();
        v28 = NSString;
        uint64_t v29 = objc_opt_class();
        uint64_t v30 = v29;
        if (v27)
        {
          AMSLogKey();
          v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          [v28 stringWithFormat:@"%@: [%@] ", v30, v8];
        }
        else
        {
          [v28 stringWithFormat:@"%@: ", v29];
        v31 = };
        v35 = AMSLogableError(v6);
        v36 = [*(id *)(a1 + 32) URL];
        __int16 v37 = AMSHashIfNeeded(v36);
        *(_DWORD *)buf = 138543874;
        v47 = v31;
        __int16 v48 = 2114;
        v49 = v35;
        __int16 v50 = 2114;
        v51 = v37;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error when handling combined cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v27)
        {

          v31 = v8;
        }
      }
    }

    AMSError(0, @"Unexpected error when handling combined cookie-promises.", 0, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = +[AMSPromise promiseWithError:v17];
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          [v17 addEntriesFromDictionary:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v20);
    }

    v23 = *(void **)(a1 + 32);
    uint64_t v24 = [v17 allValues];
    objc_msgSend(v23, "_ams_replaceCookies:", v24);

    uint64_t v25 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  v38 = (void *)v25;

  return v38;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = AMSLogKey();
    v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      v10 = AMSLogKey();
      uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v2];
    }
    else
    {
      v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    uint64_t v11 = };
    uint64_t v12 = AMSHashIfNeeded(v4);
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    __int16 v29 = 2114;
    uint64_t v30 = v12;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Creating cookie-promise for account: %{public}@", buf, 0x16u);
    if (v7)
    {

      uint64_t v11 = (void *)v2;
    }
  }
  v13 = [*(id *)(a1 + 32) URL];
  uint64_t v14 = objc_msgSend(v4, "ams_cookiesForURL:bag:cleanupGlobalCookies:", v13, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_128;
  v25[3] = &unk_1E55A8AB8;
  v25[4] = *(void *)(a1 + 32);
  uint64_t v15 = [v14 continueWithBlock:v25];

  if (*(unsigned char *)(a1 + 57))
  {
    char v16 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://xp.apple.com"];
    id v17 = objc_msgSend(v4, "ams_cookiesForURL:bag:", v16, *(void *)(a1 + 40));
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_132;
    v24[3] = &unk_1E55A8AB8;
    v24[4] = *(void *)(a1 + 32);
    id v18 = [v17 continueWithBlock:v24];
  }
  else
  {
    id v18 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }
  v26[0] = v15;
  v26[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  uint64_t v20 = +[AMSPromise promiseWithAll:v19];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_136;
  v23[3] = &unk_1E55A8AB8;
  v23[4] = *(void *)(a1 + 32);
  uint64_t v21 = [v20 continueWithBlock:v23];

  return v21;
}

uint64_t __64__NSMutableURLRequest_AppleMediaServices__ams_addAuthKitHeaders__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_addHeaders:", a2);
}

uint64_t __58__NSMutableURLRequest_AppleMediaServices__ams_addHeaders___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

uint64_t __70__NSMutableURLRequest_AppleMediaServices__ams_modifyRequestWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke_2;
  v6[3] = &unk_1E55A0FA0;
  uint64_t v2 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v3 = a2;
  id v4 = [v2 thenWithBlock:v6];
  id v5 = [v4 binaryPromiseAdapter];
  [v5 addFinishBlock:v3];
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = AMSLogKey();
      uint64_t v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        uint64_t v3 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, v3];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      uint64_t v15 = };
      id v17 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Local account couldn't be fetched for request-cookie addition. error = %{public}@", buf, 0x16u);
      if (v11)
      {

        uint64_t v15 = (void *)v3;
      }
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "ams_isLocalAccount")) {
      id v16 = 0;
    }
    else {
      id v16 = v6;
    }
    objc_msgSend(v8, "ams_addNullableObject:", v16);
  }
  objc_msgSend(v8, "ams_addNullableObject:", *(void *)(a1 + 40));
  id v18 = +[AMSPromise promiseWithResult:v8];

  return v18;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v3 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      id v16 = AMSLogableError(v6);
      id v17 = [*(id *)(a1 + 32) URL];
      id v18 = AMSHashIfNeeded(v17);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2114;
      uint64_t v25 = v18;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch account cookies for request URL. error = %{public}@ | URL = %{public}@", buf, 0x20u);

      if (v9)
      {

        uint64_t v13 = (void *)v3;
      }
    }
    uint64_t v15 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    uint64_t v14 = objc_msgSend(a2, "ams_dictionaryUsingTransform:", &__block_literal_global_153);
    uint64_t v15 = +[AMSPromise promiseWithResult:v14];
  }
  return v15;
}

uint64_t __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_129(uint64_t a1, void *a2)
{
  return [a2 name];
}

AMSPromise *__69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_addHeaders:", a2);
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  return +[AMSPromise promiseWithResult:v2];
}

void __86__NSMutableURLRequest_AppleMediaServices__ams_addBiometricsHeadersForAccount_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 40) setValue:v5 forHTTPHeaderField:v7];
  }
}

uint64_t __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (!v4)
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    id v5 = [*(id *)(a1 + 32) URL];
    id v6 = [v5 host];
    uint64_t v7 = [v6 hasSuffix:v4];
  }
  else
  {
    id v4 = 0;
    uint64_t v7 = 0;
    id v5 = v3;
  }

LABEL_7:
  return v7;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v3 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      id v16 = AMSLogableError(v6);
      id v17 = [*(id *)(a1 + 32) URL];
      id v18 = AMSHashIfNeeded(v17);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2114;
      uint64_t v25 = v18;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch account cookies for metrics base domain. No analytics cookies will be added. error = %{public}@ | URL = %{public}@", buf, 0x20u);

      if (v9)
      {

        uint64_t v13 = (void *)v3;
      }
    }
    uint64_t v15 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    uint64_t v14 = objc_msgSend(a2, "ams_dictionaryUsingTransform:", &__block_literal_global_135);
    uint64_t v15 = +[AMSPromise promiseWithResult:v14];
  }
  return v15;
}

uint64_t __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_133(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __84__NSMutableURLRequest_AppleMediaServices__ams_addSilentEnrollmentHeadersForAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

id __97__NSMutableURLRequest_AppleMediaServices__ams_addXGroupDSIDsWithPrimaryAccount_andGroupAccounts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ams_DSID");
  uint64_t v3 = [v2 stringValue];

  return v3;
}

@end