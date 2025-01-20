@interface AMSOpenURL
+ (BOOL)_openURL:(id)a3 inApp:(id)a4;
+ (BOOL)_openURLWithLaunchServices:(id)a3;
+ (BOOL)_shouldOpenStandardURL:(id)a3 inApp:(id)a4 withLinks:(id)a5;
+ (BOOL)openStandardURL:(id)a3;
+ (id)_modifiedURLFromURL:(id)a3 bundleInfo:(id)a4;
+ (id)openURL:(id)a3 clientInfo:(id)a4 bag:(id)a5;
+ (unint64_t)_openModeForStandardURL:(id)a3 inApp:(id)a4 withLinks:(id)a5;
+ (void)openURL:(id)a3 account:(id)a4 preferredClient:(id)a5;
- (AMSBagProtocol)bag;
- (AMSOpenURL)initWithURL:(id)a3 clientInfo:(id)a4 bag:(id)a5;
- (AMSProcessInfo)clientInfo;
- (BOOL)_openURL:(id)a3 bundleInfo:(id)a4;
- (BOOL)_shouldOpenURL:(id)a3;
- (NSMutableSet)attemptedTargets;
- (NSURL)URL;
- (id)_performOpen;
- (void)setAttemptedTargets:(id)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
@end

@implementation AMSOpenURL

- (AMSOpenURL)initWithURL:(id)a3 clientInfo:(id)a4 bag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSOpenURL;
  v12 = [(AMSOpenURL *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_bag, a5);
    if (v10)
    {
      v14 = (AMSProcessInfo *)v10;
    }
    else
    {
      v14 = +[AMSProcessInfo currentProcess];
    }
    clientInfo = v13->_clientInfo;
    v13->_clientInfo = v14;
  }
  return v13;
}

+ (BOOL)openStandardURL:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    id v10 = AMSLogableURL(v4);
    *(_DWORD *)buf = 138543874;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    v26 = v9;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening URL: %{public}@", buf, 0x20u);
  }
  id v22 = 0;
  id v11 = [MEMORY[0x1E4F22398] appLinksWithURL:v4 limit:1 includeLinksForCurrentApplication:1 error:&v22];
  id v12 = v22;
  v13 = +[AMSProcessInfo currentProcess];
  v14 = [v13 bundleIdentifier];

  v15 = +[AMSLogConfig sharedConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = AMSLogKey();
    v19 = AMSLogableURL(v4);
    *(_DWORD *)buf = 138544642;
    uint64_t v24 = v17;
    __int16 v25 = 2114;
    v26 = v18;
    __int16 v27 = 2114;
    v28 = v19;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v11;
    __int16 v33 = 2114;
    id v34 = v12;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Asking for appLinks for URL: %{public}@ from app %{public}@ returned: %{public}@ with error: %{public}@", buf, 0x3Eu);
  }
  if ([a1 _openModeForStandardURL:v4 inApp:v14 withLinks:v11] == 1
    && ([a1 _openURL:v4 inApp:v14] & 1) != 0)
  {
    char v20 = 1;
  }
  else
  {
    char v20 = [a1 _openURLWithLaunchServices:v4];
  }

  return v20;
}

+ (void)openURL:(id)a3 account:(id)a4 preferredClient:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  uint64_t v8 = +[AMSProcessInfo currentProcess];
  [v8 setProxyAppBundleID:v7];

  id v9 = (id)[a1 openURL:v10 clientInfo:v8 bag:0];
}

+ (id)openURL:(id)a3 clientInfo:(id)a4 bag:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[AMSOpenURL alloc] initWithURL:v9 clientInfo:v8 bag:v7];

  id v11 = [(AMSOpenURL *)v10 _performOpen];

  return v11;
}

- (id)_performOpen
{
  v3 = objc_alloc_init(AMSMutableBinaryPromise);
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__AMSOpenURL__performOpen__block_invoke;
  block[3] = &unk_1E55A22D0;
  id v12 = v4;
  v13 = self;
  v6 = v3;
  v14 = v6;
  id v7 = v4;
  dispatch_async(v5, block);

  id v8 = v14;
  id v9 = v6;

  return v9;
}

void __26__AMSOpenURL__performOpen__block_invoke(void **a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(a1[4]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [a1[5] setAttemptedTargets:v3];

  id v4 = [a1[5] URL];

  if (v4
    || (AMSError(2, @"Open URL Failed", @"No URL to open", 0),
        (id v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [a1[5] clientInfo];
    v6 = [v5 proxyAppBundleID];

    if (v6)
    {
      id v7 = [AMSProcessInfo alloc];
      id v8 = [a1[5] clientInfo];
      id v9 = [v8 proxyAppBundleID];
      id v10 = [(AMSProcessInfo *)v7 initWithBundleIdentifier:v9];

      id v11 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:v10];
    }
    else
    {
      id v11 = 0;
    }
    v13 = a1[5];
    v14 = [v13 URL];
    LOBYTE(v13) = [v13 _openURL:v14 bundleInfo:v11];

    if (v13) {
      goto LABEL_14;
    }
    v15 = [a1[5] clientInfo];

    if (v15)
    {
      v16 = [a1[5] clientInfo];
      uint64_t v17 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:v16];

      v18 = a1[5];
      v19 = [v18 URL];
      LOBYTE(v18) = [v18 _openURL:v19 bundleInfo:v17];

      if (v18) {
        goto LABEL_14;
      }
    }
    char v20 = [a1[5] clientInfo];

    if (v20)
    {
      v21 = [a1[5] clientInfo];
      id v22 = +[AMSMappedBundleInfo bundleInfoForMobileAppStoreWithProcessInfo:v21];

      v23 = a1[5];
      uint64_t v24 = [v23 URL];
      LOBYTE(v23) = [v23 _openURL:v24 bundleInfo:v22];

      if (v23) {
        goto LABEL_14;
      }
    }
    __int16 v25 = a1[5];
    v26 = [v25 URL];
    LODWORD(v25) = [v25 _shouldOpenURL:v26];

    if (v25)
    {
      __int16 v27 = objc_opt_class();
      v28 = [a1[5] URL];
      LODWORD(v27) = [v27 openStandardURL:v28];

      if (v27)
      {
LABEL_14:
        __int16 v29 = a1[6];
        [v29 finishWithSuccess];
        return;
      }
    }
    v30 = [a1[5] URL];
    id v12 = AMSErrorWithFormat(0, @"Open URL Failed", @"Unable to open the given URL: %@", v31, v32, v33, v34, v35, (uint64_t)v30);
  }
  v36 = +[AMSLogConfig sharedConfig];
  if (!v36)
  {
    v36 = +[AMSLogConfig sharedConfig];
  }
  v37 = [v36 OSLogObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    uint64_t v38 = objc_opt_class();
    v39 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v38;
    __int16 v42 = 2114;
    v43 = v39;
    __int16 v44 = 2114;
    v45 = v12;
    _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open URL. %{public}@", buf, 0x20u);
  }
  [a1[6] finishWithError:v12];
}

+ (id)_modifiedURLFromURL:(id)a3 bundleInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v9 = 0;
    goto LABEL_12;
  }
  id v7 = [v5 scheme];
  if ([v7 isEqualToString:@"http"])
  {
    uint64_t v8 = [v6 scheme];
  }
  else
  {
    if (![v7 isEqualToString:@"https"])
    {
      id v10 = 0;
      goto LABEL_10;
    }
    uint64_t v8 = [v6 secureScheme];
  }
  id v10 = (void *)v8;
  if (!v8)
  {
LABEL_10:
    id v9 = 0;
    goto LABEL_11;
  }
  id v11 = [v5 absoluteString];
  id v12 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v7, "length"));
  v13 = [v10 stringByAppendingString:v12];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v13];
LABEL_11:

LABEL_12:
  return v9;
}

- (BOOL)_openURL:(id)a3 bundleInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x192FA47D0]();
  id v9 = [(id)objc_opt_class() _modifiedURLFromURL:v6 bundleInfo:v7];
  id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v11 = [v10 applicationsAvailableForOpeningURL:v9];

  if (v9 && [v11 count]) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  if ([(AMSOpenURL *)self _shouldOpenURL:v12])
  {
    v13 = [(AMSOpenURL *)self attemptedTargets];
    v14 = [v12 absoluteString];
    [v13 addObject:v14];

    char v15 = [(id)objc_opt_class() openStandardURL:v12];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)_shouldOpenURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 absoluteString];
  if ([v5 length])
  {
    id v6 = [(AMSOpenURL *)self attemptedTargets];
    id v7 = [v4 absoluteString];
    int v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)_shouldOpenStandardURL:(id)a3 inApp:(id)a4 withLinks:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a5 firstObject];
  id v10 = (void *)v9;
  BOOL v11 = 0;
  if (!v8 || !v9) {
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  id v12 = [v10 targetApplicationRecord];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  v13 = [v12 bundleIdentifier];
  if (![v8 isEqualToString:v13])
  {

    goto LABEL_12;
  }
  v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  char v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = AMSLogKey();
    v18 = AMSLogableURL(v7);
    int v20 = 138544130;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    v23 = v17;
    __int16 v24 = 2114;
    __int16 v25 = v18;
    __int16 v26 = 2114;
    id v27 = v8;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] URL (%{public}@) is a universal link for the currently open app (%{public}@).", (uint8_t *)&v20, 0x2Au);
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

+ (unint64_t)_openModeForStandardURL:(id)a3 inApp:(id)a4 withLinks:(id)a5
{
  return [a1 _shouldOpenStandardURL:a3 inApp:a4 withLinks:a5];
}

+ (BOOL)_openURLWithLaunchServices:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F626A0];
  v21[0] = *MEMORY[0x1E4F62688];
  v21[1] = v3;
  v22[0] = MEMORY[0x1E4F1CC38];
  v22[1] = MEMORY[0x1E4F1CC38];
  v21[2] = *MEMORY[0x1E4F62658];
  v22[2] = @"AMSOpenURL";
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v8 = [v7 openSensitiveURL:v5 withOptions:v6];

  uint64_t v9 = +[AMSLogConfig sharedConfig];
  id v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      int v20 = v13;
      v14 = "%{public}@: [%{public}@] URL opened successfully.";
LABEL_10:
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    BOOL v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      v13 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2114;
      int v20 = v13;
      v14 = "%{public}@: [%{public}@] URL failed to open.";
      goto LABEL_10;
    }
  }

  return v8;
}

+ (BOOL)_openURL:(id)a3 inApp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[AMSProcessInfo alloc] initWithBundleIdentifier:v6];

  uint64_t v9 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:v8];
  id v10 = [a1 _modifiedURLFromURL:v7 bundleInfo:v9];

  if (v10) {
    char v11 = [a1 _openURLWithLaunchServices:v10];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (NSMutableSet)attemptedTargets
{
  return self->_attemptedTargets;
}

- (void)setAttemptedTargets:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_attemptedTargets, 0);
}

@end