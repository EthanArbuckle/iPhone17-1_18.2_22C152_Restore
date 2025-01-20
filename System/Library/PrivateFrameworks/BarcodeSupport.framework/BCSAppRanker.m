@interface BCSAppRanker
+ (id)bundleIdentifierOfLastUsedAppForURL:(id)a3;
+ (id)orderApps:(id)a3 forLastUsedApp:(id)a4;
+ (void)setLastUsedApp:(id)a3 forURL:(id)a4;
@end

@implementation BCSAppRanker

+ (id)orderApps:(id)a3 forLastUsedApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] <= 1 || !v6) {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSAppRanker: Found last used app for scanned URL", buf, 2u);
  }
  v7 = [v5 firstObject];
  v8 = [v7 bundleIdentifier];
  int v9 = [v6 isEqualToString:v8];

  if (!v9)
  {
    *(void *)buf = 0;
    v20 = buf;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __41__BCSAppRanker_orderApps_forLastUsedApp___block_invoke;
    v16 = &unk_26468B2B8;
    id v17 = v6;
    v18 = buf;
    uint64_t v12 = [v5 indexOfObjectPassingTest:&v13];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = v5;
    }
    else
    {
      id v10 = (id)objc_msgSend(v5, "mutableCopy", v13, v14, v15, v16);
      [v10 removeObjectAtIndex:v12];
      [v10 insertObject:*((void *)v20 + 5) atIndex:0];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
LABEL_6:
    id v10 = v5;
  }

  return v10;
}

uint64_t __41__BCSAppRanker_orderApps_forLastUsedApp___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v8 = *(void **)(a1 + 32);
  int v9 = [v7 bundleIdentifier];
  uint64_t v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

  return v10;
}

+ (void)setLastUsedApp:(id)a3 forURL:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  id v6 = [v5 host];
  if (objc_msgSend(v5, "_bcs_isUPIURL"))
  {
    uint64_t v7 = [v5 scheme];

    v8 = @"schemesToLastUsedApps";
    id v6 = (void *)v7;
  }
  else
  {
    v8 = @"hostsToLastUsedApps";
  }
  if ([v6 length])
  {
    int v9 = objc_msgSend(MEMORY[0x263EFFA40], "bcs_barcodeSupportDefaults");
    uint64_t v10 = [v9 valueForKey:v8];
    id v11 = [v10 objectForKeyedSubscript:v6];
    if (v11 != v14 && ([v11 isEqualToString:v14] & 1) == 0)
    {
      if (v10)
      {
        uint64_t v12 = (void *)[v10 mutableCopy];
      }
      else
      {
        uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v13 = v12;
      if (v14) {
        [v12 setObject:v14 forKeyedSubscript:v6];
      }
      else {
        [v12 removeObjectForKey:v6];
      }
      [v9 setObject:v13 forKey:v8];
      [v9 synchronize];
    }
  }
}

+ (id)bundleIdentifierOfLastUsedAppForURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 host];
  if (objc_msgSend(v3, "_bcs_isUPIURL"))
  {
    uint64_t v5 = [v3 scheme];

    id v6 = @"schemesToLastUsedApps";
    v4 = (void *)v5;
  }
  else
  {
    id v6 = @"hostsToLastUsedApps";
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA40], "bcs_barcodeSupportDefaults");
  v8 = [v7 valueForKey:v6];

  if (v8 && [v4 length])
  {
    int v9 = [v8 objectForKeyedSubscript:v4];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

@end