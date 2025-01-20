@interface DDSMobileAssetv2QueryAdapter
+ (id)maAssetQueryForddsAssetQuery:(id)a3 compatiblilityVersion:(int64_t)a4 platformVersion:(id)a5 internalInstall:(BOOL)a6;
+ (id)stringFromInteger:(unint64_t)a3;
@end

@implementation DDSMobileAssetv2QueryAdapter

void __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 anyObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v10 = QueryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_4();
    }
    goto LABEL_17;
  }
  if ([v6 count] == 1)
  {
    v9 = [v6 allObjects];
    v10 = [v9 firstObject];

    int v11 = [v10 isEqualToString:&stru_1F3FA8828];
    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      if ([v12 addKeyValueNull:v5])
      {
        v13 = QueryLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    else if ([v12 addKeyValuePair:v5 with:v10])
    {
      v13 = QueryLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_13:
      }
        +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:]();
LABEL_14:
    }
LABEL_17:

    goto LABEL_18;
  }
  if ((unint64_t)[v6 count] < 2)
  {
    v10 = QueryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_3((uint64_t)v5, v10);
    }
    goto LABEL_17;
  }
  v14 = *(void **)(a1 + 32);
  v15 = [v6 allObjects];
  v16 = (void *)[v15 mutableCopy];
  [v14 addKeyValueArray:v5 with:v16];

LABEL_18:
}

+ (id)maAssetQueryForddsAssetQuery:(id)a3 compatiblilityVersion:(int64_t)a4 platformVersion:(id)a5 internalInstall:(BOOL)a6
{
  BOOL v6 = a6;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F77FB8]);
  v12 = [v9 assetType];
  v13 = (void *)[v11 initWithType:v12];

  [v13 setDoNotBlockBeforeFirstUnlock:1];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v13, sel_setDoNotBlockOnNetworkStatus_, 1);
    v14 = QueryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:](v14);
    }
  }
  else
  {
    v14 = QueryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: The version of DataDeliveryServices in this build does not set doNotBlockOnNetworkStatusSetter=YES, possibly resulting in hangs.", buf, 2u);
    }
  }

  v15 = [v9 filter];
  v16 = [v15 filters];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke;
  v32 = &unk_1E6E39FF8;
  id v17 = v13;
  id v33 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:&v29];

  if (a4 >= 1)
  {
    v18 = objc_msgSend((id)objc_opt_class(), "stringFromInteger:", a4, v29, v30, v31, v32);
    uint64_t v19 = *MEMORY[0x1E4F77F18];
    if ([v17 addKeyValuePair:*MEMORY[0x1E4F77F18] with:v18])
    {
      v20 = QueryLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:]();
      }
    }
    if (v6)
    {
      v21 = [(id)objc_opt_class() stringFromInteger:a4];
      if ([v17 addKeyValuePair:v19 with:v21])
      {
        v22 = QueryLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:]();
        }
      }
    }
  }
  if (v10)
  {
    v39[0] = v10;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    v24 = (void *)[v23 mutableCopy];
    uint64_t v25 = [v17 addKeyValueArray:@"_SupportedPlatforms" with:v24];

    if (v25)
    {
      v26 = QueryLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v34 = v10;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        *(_DWORD *)buf = 138543618;
        v36 = @"_SupportedPlatforms";
        __int16 v37 = 2114;
        v38 = v28;
        _os_log_error_impl(&dword_1E41D6000, v26, OS_LOG_TYPE_ERROR, "Unexpected failure adding key (%{public}@)/value (%{public}@) pair", buf, 0x16u);
      }
    }
  }

  return v17;
}

+ (id)stringFromInteger:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
}

+ (void)maAssetQueryForddsAssetQuery:compatiblilityVersion:platformVersion:internalInstall:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1E41D6000, v0, v1, "Unexpected failure adding key (%{public}@)/value (%{public}@) pair");
}

+ (void)maAssetQueryForddsAssetQuery:(os_log_t)log compatiblilityVersion:platformVersion:internalInstall:.cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1E41D6000, log, OS_LOG_TYPE_DEBUG, "Setting setDoNotBlockOnNetworkStatus to YES", v1, 2u);
}

void __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "No values specified for key (%{public}@)", (uint8_t *)&v2, 0xCu);
}

void __115__DDSMobileAssetv2QueryAdapter_maAssetQueryForddsAssetQuery_compatiblilityVersion_platformVersion_internalInstall___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEBUG, "Skipping key: %{public}@ values: %{public}@ (is this the region dict? that's handled elsewhere)", v1, 0x16u);
}

@end