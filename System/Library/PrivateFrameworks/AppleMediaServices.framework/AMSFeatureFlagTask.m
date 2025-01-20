@interface AMSFeatureFlagTask
+ (BOOL)_cacheResponse:(id)a3 error:(id *)a4;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_cacheDirectory;
+ (id)_cachePath;
+ (id)_deviceClass;
+ (id)cachedRemoteGroups;
+ (id)createBagForSubProfile;
+ (id)lastFetchedDate;
+ (void)_handleDeletedITFEsFromResponse:(id)a3;
+ (void)clearCache;
- (id)_updateRemoteFeatureFlags;
- (id)perform;
@end

@implementation AMSFeatureFlagTask

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__AMSFeatureFlagTask_perform__block_invoke;
  v4[3] = &unk_1E55A2C20;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

id __29__AMSFeatureFlagTask_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _updateRemoteFeatureFlags];
  v4 = [v3 resultWithError:a2];

  return v4;
}

+ (id)lastFetchedDate
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  v2 = (void *)CFPreferencesCopyAppValue(@"lastFetched", @"com.apple.storeservices.itfe");
  return v2;
}

+ (id)cachedRemoteGroups
{
  v2 = [a1 _cachePath];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v2];
    if (v5)
    {
      v6 = +[AMSFeatureFlagGroup groupsFromDomainData:v5 domain:@"AMPFlagRemote"];
      v7 = [v6 allValues];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)clearCache
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _cachePath];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    [v5 removeItemAtPath:v2 error:&v15];
    id v6 = v15;

    uint64_t v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
    v8 = (void *)v7;
    if (v6)
    {
      if (!v7)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      v9 = [v8 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = AMSLogKey();
      v13 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      __int16 v18 = 2114;
      v19 = v12;
      __int16 v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error when clearing server-side feature flag cache: %{public}@", buf, 0x20u);
    }
    else
    {
      if (!v7)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      v9 = [v8 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      v14 = objc_opt_class();
      id v11 = v14;
      v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully cleared server-side feature flag cache", buf, 0x16u);
    }

LABEL_12:
  }
  CFPreferencesSetAppValue(@"lastFetched", 0, @"com.apple.storeservices.itfe");
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
}

- (id)_updateRemoteFeatureFlags
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  int v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    uint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v38 = v5;
    __int16 v39 = 2114;
    v40 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting server-side feature flag caching", buf, 0x16u);
  }
  v8 = +[AMSFeatureFlagTask createBagForSubProfile];
  v9 = [v8 URLForKey:@"featureFlagUrl"];
  v31 = [v9 valuePromise];

  v10 = +[AMSProcessInfo currentProcess];
  id v11 = objc_alloc_init(AMSBagActiveAccountProvider);
  v12 = [v10 accountMediaType];
  v30 = v11;
  v13 = [(AMSBagActiveAccountProvider *)v11 bagStorefrontForAccountMediaType:v12];

  v14 = +[AMSDefaults storefrontSuffixes];
  id v15 = [v10 bundleIdentifier];
  v16 = [v14 objectForKeyedSubscript:v15];

  if ([v16 length] && (objc_msgSend(v13, "containsString:", v16) & 1) == 0)
  {
    uint64_t v17 = [v13 stringByAppendingString:v16];

    v13 = (void *)v17;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v19 = +[AMSDevice operatingSystem];
  [v18 appendFormat:@"os=%@", v19];

  __int16 v20 = +[AMSDevice productVersion];
  [v18 appendFormat:@"&osVersion=%@", v20];

  v21 = [(id)objc_opt_class() _deviceClass];
  [v18 appendFormat:@"&deviceClass=%@", v21];

  if (v13) {
    [v18 appendFormat:@"&storefront=%@", v13];
  }
  uint64_t v22 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v23 = (void *)[v22 mutableCopy];

  [v23 removeCharactersInString:@"+"];
  v24 = [v18 stringByAddingPercentEncodingWithAllowedCharacters:v23];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke;
  v34[3] = &unk_1E55A1068;
  id v35 = v24;
  id v36 = v8;
  id v25 = v8;
  id v26 = v24;
  v27 = [v31 thenWithBlock:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_2;
  v33[3] = &unk_1E55A0F50;
  v33[4] = self;
  [v27 addFinishBlock:v33];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_72;
  v32[3] = &unk_1E559F348;
  v32[4] = self;
  v28 = [v27 thenWithBlock:v32];

  return v28;
}

id __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [NSString stringWithFormat:@"%@?%@", a2, *(void *)(a1 + 32)];
  int v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  v5 = [[AMSURLRequestEncoder alloc] initWithBag:*(void *)(a1 + 40)];
  id v6 = AMSLogKey();
  [(AMSURLRequestEncoder *)v5 setLogUUID:v6];

  uint64_t v7 = [(AMSURLRequestEncoder *)v5 requestWithMethod:2 URL:v4 parameters:0];
  v8 = +[AMSURLSession defaultSession];
  v9 = [v8 dataTaskPromiseWithRequestPromise:v7];

  return v9;
}

void __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = v7;
      v9 = AMSLogKey();
      v10 = AMSLogableError(v3);
      int v12 = 138543874;
      v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error with requesting server-side feature flags: %{public}@", (uint8_t *)&v12, 0x20u);

LABEL_10:
    }
  }
  else
  {
    if (!v4)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_opt_class();
      id v8 = v11;
      v9 = AMSLogKey();
      int v12 = 138543618;
      v13 = v11;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully received feature flag network response", (uint8_t *)&v12, 0x16u);
      goto LABEL_10;
    }
  }
}

id __47__AMSFeatureFlagTask__updateRemoteFeatureFlags__block_invoke_72(uint64_t a1, void *a2)
{
  v2 = [a2 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  id v10 = 0;
  int v4 = [(id)objc_opt_class() _cacheResponse:v3 error:&v10];
  id v5 = v10;
  if (v4)
  {
    id v6 = +[AMSFeatureFlagGroup groupsFromDomainData:v3 domain:@"AMPFlagRemote"];
    uint64_t v7 = [v6 allValues];

    [v7 makeObjectsPerformSelector:sel_activateITFEs];
    [(id)objc_opt_class() _handleDeletedITFEsFromResponse:v3];
    id v8 = +[AMSPromise promiseWithResult:v7];
  }
  else
  {
    id v8 = +[AMSPromise promiseWithError:v5];
  }

  return v8;
}

+ (id)_cacheDirectory
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "ams_cachesDirectory");
  id v3 = [v2 URLByAppendingPathComponent:@"feature-flags" isDirectory:1];

  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  return v3;
}

+ (id)_cachePath
{
  v2 = [a1 _cacheDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"response.plist"];
  int v4 = [v3 path];

  return v4;
}

+ (BOOL)_cacheResponse:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v18];
  id v7 = v18;
  BOOL v8 = v7 == 0;
  if (v7)
  {
    id v9 = v7;
    id v10 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = AMSLogKey();
      v13 = AMSLogableError(v9);
      *(_DWORD *)buf = 138543874;
      id v20 = a1;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error with serializing feature flag response data: %{public}@", buf, 0x20u);

LABEL_11:
    }
  }
  else
  {
    __int16 v14 = [a1 _cachePath];
    id v17 = 0;
    int v15 = [v6 writeToFile:v14 options:1 error:&v17];
    id v9 = v17;

    if (!v15)
    {
      BOOL v8 = 0;
      if (!a4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    CFPreferencesSetAppValue(@"lastFetched", (CFPropertyListRef)[MEMORY[0x1E4F1C9C8] date], @"com.apple.storeservices.itfe");
    CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
    id v10 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      id v20 = a1;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully cached feature flag response to disk", buf, 0x16u);
      goto LABEL_11;
    }
  }

  if (a4) {
LABEL_13:
  }
    *a4 = v9;
LABEL_14:

  return v8;
}

+ (void)_handleDeletedITFEsFromResponse:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSFeatureFlagGroup groupsFromDomainData:a3 domain:@"AMPFlagRemote"];
  int v4 = [v3 allValues];

  id v5 = +[AMSFeatureFlagTask cachedRemoteGroups];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = [MEMORY[0x1E4F1CA80] set];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v37 + 1) + 8 * v12) allITFEs];
          [v6 addObjectsFromArray:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v33 + 1) + 8 * v18) allITFEs];
          [v7 addObjectsFromArray:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v16);
    }

    [v7 minusSet:v6];
    id v20 = +[AMSFeatureFlagITFE _flagGroupITFEs];
    __int16 v21 = +[AMSFeatureFlagITFE fetchCustomFeatures];
    uint64_t v22 = [v7 allObjects];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __54__AMSFeatureFlagTask__handleDeletedITFEsFromResponse___block_invoke;
    v30 = &unk_1E55A2BC8;
    id v31 = v20;
    id v32 = v21;
    id v23 = v21;
    id v24 = v20;
    uint64_t v25 = objc_msgSend(v22, "ams_filterUsingTest:", &v27);
    id v26 = objc_msgSend(v25, "valueForKeyPath:", @"value", v27, v28, v29, v30);

    +[AMSFeatureFlagITFE removeOrphanITFEValues:v26];
  }
}

uint64_t __54__AMSFeatureFlagTask__handleDeletedITFEsFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [v3 value];
    uint64_t v4 = [v5 containsObject:v6] ^ 1;
  }
  return v4;
}

+ (id)_deviceClass
{
  if (+[AMSDevice deviceIsAudioAccessory]) {
    return @"AudioAccessory";
  }
  if (+[AMSDevice deviceIsiPad]
    || +[AMSDevice deviceIsiPadSimulator])
  {
    return @"iPad";
  }
  if (+[AMSDevice deviceIsiPhone]
    || +[AMSDevice deviceIsiPhoneSimulator])
  {
    return @"iPhone";
  }
  if (+[AMSDevice deviceIsiPod]
    || +[AMSDevice deviceIsiPodSimulator])
  {
    return @"iPod";
  }
  return 0;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_106 != -1) {
    dispatch_once(&_MergedGlobals_106, &__block_literal_global_58);
  }
  v2 = (void *)qword_1EB38D8C0;
  return (NSString *)v2;
}

void __35__AMSFeatureFlagTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D8C0;
  qword_1EB38D8C0 = @"AMSFeatureFlag";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D8C8 != -1) {
    dispatch_once(&qword_1EB38D8C8, &__block_literal_global_106);
  }
  v2 = (void *)qword_1EB38D8D0;
  return (NSString *)v2;
}

void __42__AMSFeatureFlagTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D8D0;
  qword_1EB38D8D0 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

@end