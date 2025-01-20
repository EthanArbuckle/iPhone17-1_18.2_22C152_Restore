@interface NSHTTPCookie(AMSCookieProperties)
+ (id)ams_cookiesByMergingProperties:()AMSCookieProperties intoProperties:;
+ (uint64_t)ams_cookiesForProperties:()AMSCookieProperties;
+ (uint64_t)ams_propertiesForCookies:()AMSCookieProperties;
+ (uint64_t)ams_propertyXPCClasses;
@end

@implementation NSHTTPCookie(AMSCookieProperties)

+ (uint64_t)ams_cookiesForProperties:()AMSCookieProperties
{
  return objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_148);
}

+ (uint64_t)ams_propertyXPCClasses
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (uint64_t)ams_propertiesForCookies:()AMSCookieProperties
{
  return objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_126);
}

+ (id)ams_cookiesByMergingProperties:()AMSCookieProperties intoProperties:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v52 = v7;
  v9 = objc_msgSend(a1, "ams_cookiesForProperties:", v7);
  v51 = v8;
  v50 = objc_msgSend(a1, "ams_cookiesForProperties:", v8);
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v50];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v9;
  uint64_t v64 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v69;
    v59 = v10;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        v66 = v4;
        if (*(void *)v69 != v63) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __83__NSHTTPCookie_AMSCookieProperties__ams_cookiesByMergingProperties_intoProperties___block_invoke;
        v67[3] = &unk_1E55A8988;
        v67[4] = v12;
        uint64_t v13 = [v10 indexOfObjectPassingTest:v67];
        v14 = v65;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v15)
          {
            v15 = +[AMSLogConfig sharedConfig];
          }
          v16 = [v15 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = AMSLogKey();
            v18 = NSString;
            uint64_t v19 = objc_opt_class();
            uint64_t v20 = v19;
            if (v17)
            {
              uint64_t v61 = AMSLogKey();
              uint64_t v21 = [v18 stringWithFormat:@"%@: [%@] ", v20, v61];
              v60 = (void *)v21;
            }
            else
            {
              uint64_t v21 = [v18 stringWithFormat:@"%@: ", v19];
              v14 = (void *)v21;
            }
            v40 = AMSHashIfNeeded(v12);
            *(_DWORD *)buf = 138543618;
            uint64_t v73 = v21;
            __int16 v74 = 2114;
            v75 = v40;
            _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Added cookie %{public}@ from source into existing.", buf, 0x16u);
            v41 = v14;
            if (v17)
            {

              v41 = (void *)v61;
            }
            v65 = v14;
          }
          [v10 addObject:v12];
          uint64_t v4 = v66;
        }
        else
        {
          uint64_t v22 = v13;
          v23 = [v10 objectAtIndexedSubscript:v13];
          int v24 = objc_msgSend(v12, "ams_shouldReplaceCookie:", v23);
          uint64_t v25 = +[AMSLogConfig sharedAccountsCookiesConfig];
          v26 = (void *)v25;
          if (v24)
          {
            if (!v25)
            {
              v26 = +[AMSLogConfig sharedConfig];
            }
            v27 = [v26 OSLogObject];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = AMSLogKey();
              v29 = NSString;
              uint64_t v30 = objc_opt_class();
              uint64_t v31 = v30;
              v58 = (void *)v28;
              if (v28)
              {
                uint64_t v55 = AMSLogKey();
                uint64_t v32 = [v29 stringWithFormat:@"%@: [%@] ", v31, v55];
                v54 = (void *)v32;
                v33 = v57;
              }
              else
              {
                uint64_t v32 = [v29 stringWithFormat:@"%@: ", v30];
                v33 = (void *)v32;
              }
              v42 = AMSHashIfNeeded(v23);
              v43 = AMSHashIfNeeded(v12);
              *(_DWORD *)buf = 138543874;
              uint64_t v73 = v32;
              __int16 v74 = 2114;
              v75 = v42;
              __int16 v76 = 2114;
              v77 = v43;
              _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing cookie %{public}@ with cookie %{public}@.", buf, 0x20u);
              v57 = v33;
              v44 = v33;
              if (v58)
              {

                v44 = (void *)v55;
              }

              v10 = v59;
            }

            [v10 replaceObjectAtIndex:v22 withObject:v12];
            uint64_t v4 = v66;
          }
          else
          {
            if (!v25)
            {
              v26 = +[AMSLogConfig sharedConfig];
            }
            v34 = [v26 OSLogObject];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = AMSLogKey();
              v36 = NSString;
              uint64_t v37 = objc_opt_class();
              uint64_t v38 = v37;
              if (v35)
              {
                uint64_t v56 = AMSLogKey();
                uint64_t v39 = [v36 stringWithFormat:@"%@: [%@] ", v38, v56];
                v53 = (void *)v39;
                uint64_t v4 = v66;
              }
              else
              {
                uint64_t v39 = [v36 stringWithFormat:@"%@: ", v37];
                uint64_t v4 = (void *)v39;
              }
              v45 = AMSHashIfNeeded(v23);
              v46 = AMSHashIfNeeded(v12);
              *(_DWORD *)buf = 138543874;
              uint64_t v73 = v39;
              __int16 v74 = 2114;
              v75 = v45;
              __int16 v76 = 2114;
              v77 = v46;
              _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Found equivalent cookie %{public}@, but the newer cookie version already exists. Discard this old cookie %{public}@.", buf, 0x20u);
              v47 = v4;
              if (v35)
              {

                v47 = (void *)v56;
              }

              v10 = v59;
            }
            else
            {
              uint64_t v4 = v66;
            }
          }
        }
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v64);
  }

  v48 = (void *)[v10 copy];
  return v48;
}

@end