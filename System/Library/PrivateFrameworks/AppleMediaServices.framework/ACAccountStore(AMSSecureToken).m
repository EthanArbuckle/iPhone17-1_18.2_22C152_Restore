@interface ACAccountStore(AMSSecureToken)
+ (CFTypeRef)_baseQueryDictionaryForIdentifier:()AMSSecureToken numValues:;
+ (id)_secureTokenForIdentifier:()AMSSecureToken error:;
- (id)ams_secureTokenForAccount:()AMSSecureToken;
- (uint64_t)ams_setSecureToken:()AMSSecureToken forAccount:error:;
@end

@implementation ACAccountStore(AMSSecureToken)

+ (CFTypeRef)_baseQueryDictionaryForIdentifier:()AMSSecureToken numValues:
{
  keys[5] = *(void **)MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4F3B550];
  keys[0] = *(void **)MEMORY[0x1E4F3B5C0];
  keys[1] = v4;
  values[0] = a3;
  values[1] = @"apple";
  v5 = (void *)*MEMORY[0x1E4F1CFD0];
  v6 = (void *)*MEMORY[0x1E4F3B850];
  keys[2] = *(void **)MEMORY[0x1E4F3BD08];
  keys[3] = v6;
  values[2] = v5;
  values[3] = @"com.apple.itunesstored.token";
  keys[4] = *(void **)MEMORY[0x1E4F3B978];
  values[4] = *(void **)MEMORY[0x1E4F3B988];
  if (a4) {
    *a4 = 5;
  }
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 5, 0, 0);
  return CFAutorelease(v7);
}

+ (id)_secureTokenForIdentifier:()AMSSecureToken error:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 length])
  {
    v12 = 0;
    goto LABEL_35;
  }
  uint64_t v39 = 0;
  CFDictionaryRef v7 = (const __CFDictionary *)[a1 _baseQueryDictionaryForIdentifier:v6 numValues:&v39];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v39 + 1, v7);
  CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  uint64_t v9 = SecItemCopyMatching(MutableCopy, &result);
  v10 = (void *)result;
  if (v9 == -25300)
  {
    v13 = +[AMSLogConfig sharedAccountsConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = AMSLogKey();
      v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        a1 = AMSLogKey();
        [v16 stringWithFormat:@"%@: [%@] ", v18, a1];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      v19 = };
      *(_DWORD *)buf = 138543618;
      v43 = v19;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@We don't have a secure token stored for %{public}@.", buf, 0x16u);
      if (v15)
      {

        v19 = a1;
      }
    }
    goto LABEL_33;
  }
  uint64_t v11 = v9;
  if (v9)
  {
    v20 = +[AMSLogConfig sharedAccountsConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = AMSLogKey();
      v23 = NSString;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = v24;
      if (v22)
      {
        uint64_t v37 = AMSLogKey();
        [v23 stringWithFormat:@"%@: [%@] ", v25, v37];
      }
      else
      {
        [v23 stringWithFormat:@"%@: ", v24];
      v26 = };
      *(_DWORD *)buf = 138543874;
      v43 = v26;
      __int16 v44 = 2114;
      id v45 = v6;
      __int16 v46 = 1024;
      int v47 = v11;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the secure token (X-Token) for %{public}@. error = %d", buf, 0x1Cu);
      if (v22)
      {

        v26 = (void *)v37;
      }
    }
    if (a4)
    {
      v40 = @"AMSKeychainErrorCode";
      v34 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
      v41 = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      AMSCustomError(@"AMSErrorDomain", 7, @"Secure Token Not Found", @"Encountered an error querying the keychain.", v35, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_33:
    v12 = 0;
    goto LABEL_34;
  }
  if (![(id)result length])
  {
    v27 = +[AMSLogConfig sharedAccountsConfig];
    if (!v27)
    {
      v27 = +[AMSLogConfig sharedConfig];
    }
    v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = AMSLogKey();
      v30 = NSString;
      uint64_t v31 = objc_opt_class();
      uint64_t v32 = v31;
      if (v29)
      {
        a1 = AMSLogKey();
        [v30 stringWithFormat:@"%@: [%@] ", v32, a1];
      }
      else
      {
        [v30 stringWithFormat:@"%@: ", v31];
      v33 = };
      *(_DWORD *)buf = 138543618;
      v43 = v33;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@Secure token query succeeded but no data was returned. identifier = %{public}@", buf, 0x16u);
      if (v29)
      {

        v33 = a1;
      }
    }
    if (a4)
    {
      AMSError(0, @"Unknown Keychain Error", @"The keychain operation succeeded but returned no data.", 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v12 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
LABEL_34:
  CFRelease(MutableCopy);

LABEL_35:
  return v12;
}

- (id)ams_secureTokenForAccount:()AMSSecureToken
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFDictionaryRef v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    CFDictionaryRef v7 = +[AMSLogConfig sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = AMSLogKey();
    v10 = NSString;
    uint64_t v11 = a1;
    uint64_t v12 = objc_opt_class();
    if (v9)
    {
      v13 = AMSLogKey();
      uint64_t v3 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: [%@] %@ ", v12, v13, v3];
    }
    else
    {
      v13 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    v15 = AMSHashIfNeeded(v6);
    *(_DWORD *)buf = 138543618;
    v51 = v14;
    __int16 v52 = 2114;
    v53 = v15;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching secure token for account: %{public}@", buf, 0x16u);
    if (v9)
    {

      v14 = (void *)v3;
    }

    a1 = v11;
  }

  v16 = (void *)MEMORY[0x1E4F179C8];
  uint64_t v17 = [v6 identifier];
  id v49 = 0;
  uint64_t v18 = [v16 _secureTokenForIdentifier:v17 error:&v49];
  id v19 = v49;

  if (v18) {
    goto LABEL_29;
  }
  if (v19)
  {
    v20 = +[AMSLogConfig sharedAccountsConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = a2;
      uint64_t v23 = AMSLogKey();
      v43 = NSString;
      int v47 = a1;
      uint64_t v24 = objc_opt_class();
      id v45 = (void *)v23;
      if (v23)
      {
        uint64_t v25 = AMSLogKey();
        a2 = v22;
        uint64_t v42 = NSStringFromSelector(v22);
        __int16 v44 = (void *)v25;
        [v43 stringWithFormat:@"%@: [%@] %@ ", v24, v25, v42];
      }
      else
      {
        a2 = v22;
        __int16 v44 = NSStringFromSelector(v22);
        [v43 stringWithFormat:@"%@: %@ ", v24, v44];
      v26 = };
      v27 = AMSHashIfNeeded(v6);
      v28 = AMSLogableError(v19);
      *(_DWORD *)buf = 138543874;
      v51 = v26;
      __int16 v52 = 2114;
      v53 = v27;
      __int16 v54 = 2114;
      v55 = v28;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error fetching secure token. account = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v45)
      {

        v26 = (void *)v42;
      }

      a1 = v47;
    }
  }
  if (objc_msgSend(v6, "ams_isiCloudAccount")
    && (objc_msgSend(a1, "ams_iTunesAccountForAccount:", v6), (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = (void *)v29;
    uint64_t v31 = +[AMSLogConfig sharedAccountsConfig];
    if (!v31)
    {
      uint64_t v31 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = AMSLogKey();
      v34 = NSString;
      uint64_t v48 = a1;
      uint64_t v35 = objc_opt_class();
      __int16 v46 = (void *)v33;
      if (v33)
      {
        v36 = AMSLogKey();
        __int16 v44 = NSStringFromSelector(a2);
        [v34 stringWithFormat:@"%@: [%@] %@ ", v35, v36, v44];
      }
      else
      {
        v36 = NSStringFromSelector(a2);
        [v34 stringWithFormat:@"%@: %@ ", v35, v36];
      uint64_t v37 = };
      v40 = AMSHashIfNeeded(v6);
      v41 = AMSHashIfNeeded(v30);
      *(_DWORD *)buf = 138543874;
      v51 = v37;
      __int16 v52 = 2114;
      v53 = v40;
      __int16 v54 = 2114;
      v55 = v41;
      _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_INFO, "%{public}@Found iTunes account for iCloud account, fetching secure token. account = %{public}@ | iTunesAccount = %{public}@", buf, 0x20u);
      if (v46)
      {

        uint64_t v37 = v44;
      }

      a1 = v48;
    }

    objc_msgSend(a1, "ams_secureTokenForAccount:", v30);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_29:
    id v38 = v18;
  }

  return v38;
}

- (uint64_t)ams_setSecureToken:()AMSSecureToken forAccount:error:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = [v11 length];

  if (!v12) {
    goto LABEL_25;
  }
  uint64_t v13 = +[AMSLogConfig sharedAccountsConfig];
  v14 = (void *)v13;
  if (v9)
  {
    if (!v13)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v56 = a5;
      v16 = AMSLogKey();
      uint64_t v17 = NSString;
      uint64_t v18 = objc_opt_class();
      if (v16)
      {
        id v19 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        [v17 stringWithFormat:@"%@: [%@] %@ ", v18, v19, a2];
      }
      else
      {
        id v19 = NSStringFromSelector(a2);
        [v17 stringWithFormat:@"%@: %@ ", v18, v19];
      v20 = };
      uint64_t v23 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543618;
      v61 = v20;
      __int16 v62 = 2114;
      v63 = v23;
      uint64_t v24 = "%{public}@Setting secure token for account: %{public}@";
LABEL_17:
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
      if (v16)
      {

        v20 = (void *)a2;
      }

      a5 = v56;
    }
  }
  else
  {
    if (!v13)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v56 = a5;
      v16 = AMSLogKey();
      v21 = NSString;
      uint64_t v22 = objc_opt_class();
      if (v16)
      {
        id v19 = AMSLogKey();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        [v21 stringWithFormat:@"%@: [%@] %@ ", v22, v19, a2];
      }
      else
      {
        id v19 = NSStringFromSelector(a2);
        [v21 stringWithFormat:@"%@: %@ ", v22, v19];
      v20 = };
      uint64_t v23 = AMSHashIfNeeded(v10);
      *(_DWORD *)buf = 138543618;
      v61 = v20;
      __int16 v62 = 2114;
      v63 = v23;
      uint64_t v24 = "%{public}@Deleting secure token for account: %{public}@";
      goto LABEL_17;
    }
  }

  uint64_t v59 = 0;
  uint64_t v25 = objc_opt_class();
  v26 = [v10 identifier];
  CFDictionaryRef v27 = (const __CFDictionary *)[v25 _baseQueryDictionaryForIdentifier:v26 numValues:&v59];

  if (v9)
  {
    v28 = [v9 dataUsingEncoding:4];
    uint64_t v29 = objc_msgSend(a1, "ams_secureTokenForAccount:", v10);
    v30 = v29;
    if (v29)
    {
      if ([v29 isEqualToString:v9])
      {
        uint64_t v31 = 0;
        goto LABEL_47;
      }
      v40 = +[AMSLogConfig sharedAccountsConfig];
      if (!v40)
      {
        v40 = +[AMSLogConfig sharedConfig];
      }
      v41 = [v40 OSLogObject];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v58 = a5;
        uint64_t v42 = AMSLogKey();
        v43 = NSString;
        uint64_t v44 = objc_opt_class();
        uint64_t v45 = v44;
        if (v42)
        {
          uint64_t v55 = AMSLogKey();
          [v43 stringWithFormat:@"%@: [%@] ", v45, v55];
        }
        else
        {
          [v43 stringWithFormat:@"%@: ", v44];
        __int16 v46 = };
        v50 = AMSHashIfNeeded(v10);
        *(_DWORD *)buf = 138543618;
        v61 = v46;
        __int16 v62 = 2114;
        v63 = v50;
        _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Updating an existing secure token. account = %{public}@.", buf, 0x16u);
        if (v42)
        {

          __int16 v46 = (void *)v55;
        }

        a5 = v58;
      }

      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B578]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v28);
      uint64_t v49 = SecItemUpdate(v27, Mutable);
    }
    else
    {
      uint64_t v33 = +[AMSLogConfig sharedAccountsConfig];
      if (!v33)
      {
        uint64_t v33 = +[AMSLogConfig sharedConfig];
      }
      v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v57 = a5;
        uint64_t v35 = AMSLogKey();
        v36 = NSString;
        uint64_t v37 = objc_opt_class();
        uint64_t v38 = v37;
        if (v35)
        {
          uint64_t v55 = AMSLogKey();
          [v36 stringWithFormat:@"%@: [%@] ", v38, v55];
        }
        else
        {
          [v36 stringWithFormat:@"%@: ", v37];
        uint64_t v39 = };
        int v47 = AMSHashIfNeeded(v10);
        *(_DWORD *)buf = 138543618;
        v61 = v39;
        __int16 v62 = 2114;
        v63 = v47;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Adding a new secure token to keychain. account = %{public}@", buf, 0x16u);
        if (v35)
        {

          uint64_t v39 = (void *)v55;
        }

        a5 = v57;
      }

      Mutable = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v59 + 2, v27);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B578]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v28);
      uint64_t v49 = SecItemAdd(Mutable, 0);
    }
    uint64_t v31 = v49;
    CFRelease(Mutable);
LABEL_47:

    if (v31) {
      goto LABEL_48;
    }
LABEL_25:
    uint64_t v32 = 1;
    goto LABEL_51;
  }
  uint64_t v31 = SecItemDelete(v27);
  if (!v31) {
    goto LABEL_25;
  }
LABEL_48:
  v51 = NSString;
  __int16 v52 = [v10 identifier];
  v53 = [v51 stringWithFormat:@"Failed to set the secure token for %@. err = %d", v52, v31];

  if (a5)
  {
    AMSError(104, @"Failed to Set Secure Token", v53, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v32 = 0;
LABEL_51:

  return v32;
}

@end