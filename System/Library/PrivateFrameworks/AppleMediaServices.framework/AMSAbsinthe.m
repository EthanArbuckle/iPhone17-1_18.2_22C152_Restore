@interface AMSAbsinthe
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_dataToSignFromRequest:(id)a3 bagDefinition:(id)a4;
+ (id)_signingDataFromRequest:(id)a3 buyParams:(id)a4 definitions:(id)a5;
+ (id)createBagForSubProfile;
+ (id)handleResponse:(id)a3 bag:(id)a4;
+ (id)headersForRequest:(id)a3 buyParams:(id)a4 bag:(id)a5;
@end

@implementation AMSAbsinthe

+ (id)headersForRequest:(id)a3 buyParams:(id)a4 bag:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AMSSetLogKeyIfNeeded();
  if (v10)
  {
    v12 = [v10 arrayForKey:@"absinthe-requests"];
    v13 = [v12 valuePromise];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke;
    v22[3] = &unk_1E559E838;
    id v23 = v11;
    id v27 = a1;
    id v24 = v8;
    id v25 = v9;
    id v26 = v10;
    v14 = [v13 continueWithBlock:v22];
  }
  else
  {
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = NSString;
      uint64_t v18 = objc_opt_class();
      if (v11) {
        [v17 stringWithFormat:@"%@: [%@] ", v18, v11];
      }
      else {
      v19 = [v17 stringWithFormat:@"%@: ", v18, v21];
      }
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@No bag provided. Defaulting to skipping Absinthe signing.", buf, 0xCu);
    }
    v14 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }

  return v14;
}

+ (id)_signingDataFromRequest:(id)a3 buyParams:(id)a4 definitions:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v69 = a4;
  id v8 = a5;
  uint64_t v9 = AMSSetLogKeyIfNeeded();
  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  unint64_t v12 = 0x1E4F29000uLL;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSString;
    uint64_t v14 = objc_opt_class();
    if (v9) {
      [v13 stringWithFormat:@"%@: [%@] ", v14, v9];
    }
    else {
    v15 = [v13 stringWithFormat:@"%@: ", v14, v60];
    }
    v16 = AMSLogableURLRequest((uint64_t)v64);
    *(_DWORD *)buf = 138543618;
    v83 = v15;
    __int16 v84 = 2114;
    v85 = v16;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Determining signing data for request %{public}@", buf, 0x16u);

    unint64_t v12 = 0x1E4F29000uLL;
  }
  id v61 = a1;
  v62 = (void *)v9;

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v77;
    id v63 = v17;
    uint64_t v65 = *(void *)v77;
    do
    {
      uint64_t v21 = 0;
      uint64_t v66 = v19;
      do
      {
        if (*(void *)v77 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v76 + 1) + 8 * v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v67 = v22;
          id v23 = [v22 objectForKeyedSubscript:@"criteria"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v24 = v23;
          }
          else {
            id v24 = 0;
          }

          if ([v24 count])
          {
            id v25 = [v24 objectForKeyedSubscript:@"host"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v26 = 0;
              LODWORD(v28) = 1;
              goto LABEL_23;
            }
            id v26 = v25;

            if (v26)
            {
              id v27 = [v64 URL];
              id v25 = [v27 host];

              if (v25) {
                LODWORD(v28) = [v25 hasSuffix:v26];
              }
              else {
                LODWORD(v28) = 0;
              }
LABEL_23:
            }
            else
            {
              LODWORD(v28) = 1;
            }
            v29 = [v24 objectForKeyedSubscript:@"path"];
            objc_opt_class();
            v71 = v26;
            if (objc_opt_isKindOfClass())
            {
              id v30 = v29;

              if (v28 && v30)
              {
                v31 = [v64 URL];
                v29 = [v31 path];

                if (v29) {
                  LODWORD(v28) = [v29 containsString:v30];
                }
                else {
                  LODWORD(v28) = 0;
                }
LABEL_30:
              }
              v70 = v30;
              v32 = [v24 objectForKeyedSubscript:@"buyParams"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v33 = 0;
                goto LABEL_49;
              }
              id v33 = v32;

              if (!v28 || !v33) {
                goto LABEL_50;
              }
              if (![v33 count])
              {
                LODWORD(v28) = 1;
                goto LABEL_50;
              }
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              v32 = [v33 allKeys];
              uint64_t v34 = [v32 countByEnumeratingWithState:&v72 objects:v80 count:16];
              if (!v34)
              {
                LODWORD(v28) = 1;
                goto LABEL_49;
              }
              uint64_t v35 = v34;
              uint64_t v68 = *(void *)v73;
LABEL_37:
              uint64_t v36 = 0;
              while (1)
              {
                if (*(void *)v73 != v68) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void *)(*((void *)&v72 + 1) + 8 * v36);
                v38 = [v33 objectForKeyedSubscript:v37];
                unint64_t v39 = v12;
                objc_opt_class();
                id v40 = (objc_opt_isKindOfClass() & 1) != 0 ? v38 : 0;

                v41 = [v69 parameterForKey:v37];
                v28 = v41;
                if (!v41) {
                  break;
                }
                uint64_t v42 = [v41 rangeOfString:v40 options:1024];

                if (v42 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_70;
                }
                ++v36;
                unint64_t v12 = v39;
                if (v35 == v36)
                {
                  uint64_t v35 = [v32 countByEnumeratingWithState:&v72 objects:v80 count:16];
                  LODWORD(v28) = 1;
                  if (v35) {
                    goto LABEL_37;
                  }
                  id v17 = v63;
LABEL_49:

LABEL_50:
                  v43 = [v24 objectForKeyedSubscript:@"regex"];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    id v44 = 0;
                    goto LABEL_56;
                  }
                  id v44 = v43;

                  if (v28 && v44)
                  {
                    v45 = [v64 URL];
                    v43 = [v45 absoluteString];

                    if (v43) {
                      LODWORD(v28) = [v43 rangeOfString:v44 options:1024] != 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      LODWORD(v28) = 0;
                    }
LABEL_56:
                  }
                  if (!v28)
                  {

                    uint64_t v20 = v65;
                    uint64_t v19 = v66;
                    goto LABEL_59;
                  }
                  v52 = [v61 _dataToSignFromRequest:v64 bagDefinition:v67];

                  v49 = v62;
                  if (!v52)
                  {
                    v47 = +[AMSLogConfig sharedConfig];
                    if (!v47)
                    {
                      v47 = +[AMSLogConfig sharedConfig];
                    }
                    v48 = [v47 OSLogObject];
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
                      v53 = *(void **)(v12 + 24);
                      uint64_t v54 = objc_opt_class();
                      if (v62) {
                        [v53 stringWithFormat:@"%@: [%@] ", v54, v62];
                      }
                      else {
                      v55 = [v53 stringWithFormat:@"%@: ", v54, v60];
                      }
                      *(_DWORD *)buf = 138543362;
                      v83 = v55;
                      v56 = "%{public}@Criteria matches, but no data to sign";
                      v57 = v48;
                      os_log_type_t v58 = OS_LOG_TYPE_ERROR;
LABEL_88:
                      _os_log_impl(&dword_18D554000, v57, v58, v56, buf, 0xCu);
                    }
                    goto LABEL_89;
                  }
                  goto LABEL_90;
                }
              }

LABEL_70:
              id v17 = v63;
              unint64_t v12 = v39;
              goto LABEL_49;
            }
            id v30 = 0;
            goto LABEL_30;
          }
LABEL_59:
        }
        ++v21;
      }
      while (v21 != v19);
      uint64_t v46 = [v17 countByEnumeratingWithState:&v76 objects:v81 count:16];
      uint64_t v19 = v46;
    }
    while (v46);
  }

  v47 = +[AMSLogConfig sharedConfig];
  if (!v47)
  {
    v47 = +[AMSLogConfig sharedConfig];
  }
  v48 = [v47 OSLogObject];
  v49 = v62;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v50 = *(void **)(v12 + 24);
    uint64_t v51 = objc_opt_class();
    if (v62) {
      [v50 stringWithFormat:@"%@: [%@] ", v51, v62];
    }
    else {
    v55 = [v50 stringWithFormat:@"%@: ", v51, v60];
    }
    *(_DWORD *)buf = 138543362;
    v83 = v55;
    v56 = "%{public}@Skipping absinthe";
    v57 = v48;
    os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_88;
  }
LABEL_89:

  v52 = 0;
LABEL_90:

  return v52;
}

+ (id)handleResponse:(id)a3 bag:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    v7 = 0;
    if (v6 && a4)
    {
      id v8 = AMSSetLogKeyIfNeeded();
      uint64_t v9 = objc_msgSend(v6, "ams_valueForHTTPHeaderField:", @"X-Apple-AbsintheAction");
      if (!objc_msgSend(v9, "ams_caseInsensitiveEquals:", @"RP")) {
        goto LABEL_12;
      }
      id v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        uint64_t v16 = objc_opt_class();
        __int16 v17 = 2114;
        uint64_t v18 = v8;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling reprovision action", (uint8_t *)&v15, 0x16u);
      }

      unint64_t v12 = +[AMSAbsintheSession defaultSession];
      int v13 = [v12 clearSession];

      if (v13)
      {
        v7 = +[AMSURLAction retryAction];
        [v7 setReason:@"absinthe"];
        [v7 setRetryIdentifier:0x1EDCA7EA8];
      }
      else
      {
LABEL_12:
        v7 = 0;
      }
    }
  }
  else
  {

    id v6 = 0;
    v7 = 0;
  }

  return v7;
}

id __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      if (v9) {
        [v10 stringWithFormat:@"%@: [%@] ", v11, *(void *)(a1 + 32)];
      }
      else {
      unint64_t v12 = [v10 stringWithFormat:@"%@: ", v11, v22];
      }
      int v13 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2114;
      id v30 = v13;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to load Absinthe requests from bag. Will continue without adding any signing headers. error = %{public}@", buf, 0x16u);
    }
    id v14 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }
  int v15 = [*(id *)(a1 + 64) _signingDataFromRequest:*(void *)(a1 + 40) buyParams:*(void *)(a1 + 48) definitions:v5];
  if (v15)
  {
    uint64_t v16 = +[AMSAbsintheSession defaultSession];
    __int16 v17 = [v16 signData:v15 bag:*(void *)(a1 + 56)];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke_43;
    v23[3] = &unk_1E559E810;
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 64);
    id v24 = v18;
    uint64_t v26 = v19;
    id v25 = *(id *)(a1 + 40);
    uint64_t v20 = [v17 continueWithBlock:v23];
  }
  else
  {
    uint64_t v20 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }

  return v20;
}

id __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    id v6 = objc_msgSend(a3, "ams_sanitizedForSecureCoding");
    uint64_t v7 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      if (v10) {
        [v11 stringWithFormat:@"%@: [%@] ", v12, *(void *)(a1 + 32)];
      }
      else {
      int v13 = [v11 stringWithFormat:@"%@: ", v12, v19];
      }
      id v14 = AMSLogableURLRequest(*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543618;
      id v23 = v13;
      __int16 v24 = 2114;
      id v25 = v14;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Headers generated for request: %{public}@", buf, 0x16u);
    }
    v20[0] = @"X-Apple-AbsintheSignature";
    int v15 = [v5 signature];
    v21[0] = v15;
    v20[1] = @"X-Apple-AbsintheSrv";
    uint64_t v16 = [v5 servKey];
    v21[1] = v16;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v7 = +[AMSPromise promiseWithResult:v6];
  }
  __int16 v17 = (void *)v7;

  return v17;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSAbsinthe";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (id)_dataToSignFromRequest:(id)a3 bagDefinition:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v8 = [v6 objectForKeyedSubscript:@"body"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 BOOLValue])
  {
    uint64_t v9 = [v5 HTTPBody];
    if ([v9 length])
    {
      uint64_t v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
      if (v10) {
        [v7 appendString:v10];
      }
    }
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"cookies"];
  objc_opt_class();
  id v46 = v6;
  id v47 = v5;
  v48 = v8;
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;

    if (v12)
    {
      int v13 = objc_msgSend(v5, "ams_cookies");
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      obuint64_t j = v12;
      uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (!v14) {
        goto LABEL_24;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v60;
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v60 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(id *)(*((void *)&v59 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;

            if (v19) {
              goto LABEL_20;
            }
          }
          else
          {
          }
          id v19 = [NSString stringWithFormat:@"%@", v18];
LABEL_20:
          uint64_t v20 = [v13 objectForKeyedSubscript:v19];
          if (v20) {
            [v7 appendString:v20];
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
        if (!v15)
        {
LABEL_24:

          id v6 = v46;
          goto LABEL_27;
        }
      }
    }
  }
  else
  {
  }
  obuint64_t j = 0;
LABEL_27:
  uint64_t v21 = [v6 objectForKeyedSubscript:@"headers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v21;

    if (v22)
    {
      uint64_t v21 = [v5 allHTTPHeaderFields];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v49 = v22;
      uint64_t v23 = [v49 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (!v23) {
        goto LABEL_43;
      }
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v56;
      while (1)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v49);
          }
          id v27 = *(id *)(*((void *)&v55 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = v27;

            if (v28) {
              goto LABEL_39;
            }
          }
          else
          {
          }
          id v28 = [NSString stringWithFormat:@"%@", v27];
LABEL_39:
          __int16 v29 = [v21 objectForKeyedSubscript:v28];
          if (v29) {
            [v7 appendString:v29];
          }
        }
        uint64_t v24 = [v49 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (!v24)
        {
LABEL_43:

          id v6 = v46;
          id v5 = v47;
          goto LABEL_45;
        }
      }
    }
    id v49 = 0;
  }
  else
  {
    id v49 = 0;
LABEL_45:
  }
  id v30 = [v6 objectForKeyedSubscript:@"params"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v30;

    if (v31)
    {
      v32 = [v5 URL];
      id v30 = objc_msgSend(v32, "ams_parameters");

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v33 = v31;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (!v34) {
        goto LABEL_62;
      }
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v52;
      while (1)
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = *(id *)(*((void *)&v51 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v39 = v38;

            if (v39) {
              goto LABEL_58;
            }
          }
          else
          {
          }
          id v39 = [NSString stringWithFormat:@"%@", v38];
LABEL_58:
          id v40 = [v30 objectForKeyedSubscript:v39];
          if (v40) {
            [v7 appendString:v40];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (!v35)
        {
LABEL_62:

          id v6 = v46;
          id v5 = v47;
          goto LABEL_64;
        }
      }
    }
    id v33 = 0;
  }
  else
  {
    id v33 = 0;
LABEL_64:
  }
  if ([v7 length])
  {
    id v41 = v7;
    uint64_t v42 = (const void *)[v41 cStringUsingEncoding:4];
    v43 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    LODWORD(v41) = [v41 length];
    id v44 = v43;
    CC_SHA256(v42, (CC_LONG)v41, (unsigned __int8 *)[v44 mutableBytes]);
    if ([v44 length]) {
      goto LABEL_69;
    }
  }
  id v44 = 0;
LABEL_69:

  return v44;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

@end