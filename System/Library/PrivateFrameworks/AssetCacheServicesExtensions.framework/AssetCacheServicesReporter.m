@interface AssetCacheServicesReporter
- (AssetCacheServicesReporter)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (AssetCacheServicesReporterDelegate)weakDelegate;
- (BOOL)doRanges:(id)a3 containAddress:(id)a4;
- (NSMutableDictionary)results;
- (NSMutableSet)allServerHostPorts;
- (OS_dispatch_queue)weakDelegateQueue;
- (OS_os_log)logHandle;
- (id)keyPath:(id)a3 byAppendingKey:(id)a4;
- (id)locateServersWithOptions:(id)a3;
- (id)prettyRanges:(id)a3;
- (id)serverSortInfoForHostPort:(id)a3 rank:(id)a4;
- (id)sortedHostPorts:(id)a3;
- (id)sortedHostPorts:(id)a3 usingSortInfo:(id)a4;
- (void)didFinishWithResults:(id)a3;
- (void)didGatherResults:(id)a3 forKeyPath:(id)a4;
- (void)reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:(id)a3;
- (void)reportCachedServersWithKeyPath:(id)a3;
- (void)reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:(id)a3;
- (void)reportFreshServersWithKeyPath:(id)a3;
- (void)reportMightHaveWithKeyPath:(id)a3;
- (void)reportPublicIPAddress;
- (void)reportPublicIPAddressRangesWithKeyPath:(id)a3 andFavoredServerRangesWithKeyPath:(id)a4 generateOptions:(id)a5;
- (void)reportReachability;
- (void)reportServersWithKeyPath:(id)a3 generateOptions:(id)a4;
- (void)setAllServerHostPorts:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setResults:(id)a3;
- (void)setWeakDelegate:(id)a3;
- (void)setWeakDelegateQueue:(id)a3;
- (void)start;
- (void)willStartGatheringResultsForKeyPath:(id)a3;
@end

@implementation AssetCacheServicesReporter

- (AssetCacheServicesReporter)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AssetCacheServicesReporter;
  v8 = [(AssetCacheServicesReporter *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(AssetCacheServicesReporter *)v8 setWeakDelegate:v6];
    [(AssetCacheServicesReporter *)v9 setWeakDelegateQueue:v7];
    os_log_t v10 = os_log_create("com.apple.AssetCacheServices", "Extensions");
    [(AssetCacheServicesReporter *)v9 setLogHandle:v10];
  }
  return v9;
}

- (void)start
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(AssetCacheServicesReporter *)self setResults:v3];

  v4 = [MEMORY[0x263EFF9C0] set];
  [(AssetCacheServicesReporter *)self setAllServerHostPorts:v4];

  v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__AssetCacheServicesReporter_start__block_invoke;
  block[3] = &unk_264C9DAD8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __35__AssetCacheServicesReporter_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reportPublicIPAddress];
  [*(id *)(a1 + 32) reportMightHaveWithKeyPath:&stru_26E96AD30];
  [*(id *)(a1 + 32) reportCachedServersWithKeyPath:&stru_26E96AD30];
  [*(id *)(a1 + 32) reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:&stru_26E96AD30];
  [*(id *)(a1 + 32) reportFreshServersWithKeyPath:&stru_26E96AD30];
  [*(id *)(a1 + 32) reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:&stru_26E96AD30];
  [*(id *)(a1 + 32) reportReachability];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 results];
  [v2 didFinishWithResults:v3];
}

- (id)prettyRanges:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v22)
  {
    v5 = @"first";
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v6;
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v24 = v7;
        uint64_t v8 = [v24 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v24);
              }
              objc_super v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v13 = [v12 objectForKey:v5];
              if (v13) {
                v14 = (__CFString *)v13;
              }
              else {
                v14 = @"unknown";
              }
              uint64_t v15 = [v12 objectForKey:@"last"];
              if (v15) {
                v16 = (__CFString *)v15;
              }
              else {
                v16 = @"unknown";
              }
              if ([(__CFString *)v14 isEqualToString:v16])
              {
                [v4 addObject:v14];
              }
              else
              {
                [NSString stringWithFormat:@"%@-%@", v14, v16];
                v18 = v17 = v5;
                [v4 addObject:v18];

                v5 = v17;
              }
            }
            uint64_t v9 = [v24 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v22);
  }

  return v4;
}

- (BOOL)doRanges:(id)a3 containAddress:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unsigned int v66 = 0;
  unint64_t v64 = 0;
  unint64_t v65 = 0;
  id v6 = a4;
  int v7 = inet_pton(2, (const char *)[v6 UTF8String], &v66);
  if (v7 == 1 || inet_pton(30, (const char *)[v6 UTF8String], &v64) == 1)
  {
    id v46 = v6;
    id v47 = v5;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v5;
    uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    char v8 = 0;
    if (!v50) {
      goto LABEL_67;
    }
    uint64_t v49 = *(void *)v61;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v61 != v49) {
        objc_enumerationMutation(obj);
      }
      uint64_t v51 = v9;
      uint64_t v10 = *(void **)(*((void *)&v60 + 1) + 8 * v9);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v57 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            uint64_t v17 = objc_msgSend(v16, "objectForKey:", @"first", v46, v47);
            if (v17) {
              v18 = (__CFString *)v17;
            }
            else {
              v18 = @"unknown";
            }
            uint64_t v19 = [v16 objectForKey:@"last"];
            if (v19) {
              v20 = (__CFString *)v19;
            }
            else {
              v20 = @"unknown";
            }
            uint64_t v21 = [(__CFString *)v18 rangeOfString:@":"];
            if (v7 == 1 && v21 == 0x7FFFFFFFFFFFFFFFLL)
            {
              LODWORD(v54) = 0;
              LODWORD(v52) = 0;
              if (inet_pton(2, (const char *)[(__CFString *)v18 UTF8String], &v54) == 1
                && inet_pton(2, (const char *)[(__CFString *)v20 UTF8String], &v52) == 1)
              {
                unsigned int v22 = bswap32(v54);
                unsigned int v23 = bswap32(v52);
                BOOL v24 = v22 >= v23;
                BOOL v25 = v22 > v23;
                BOOL v26 = !v24;
                if (v25 - v26 <= 0)
                {
                  unsigned int v27 = bswap32(v54);
                  unsigned int v28 = bswap32(v66);
                  BOOL v24 = v27 >= v28;
                  BOOL v29 = v27 > v28;
                  BOOL v30 = !v24;
                  if (v29 - v30 <= 0)
                  {
                    unsigned int v31 = bswap32(v66);
                    unsigned int v32 = bswap32(v52);
                    BOOL v24 = v31 >= v32;
                    BOOL v33 = v31 > v32;
                    int v34 = !v24;
                    int v35 = v33 - v34;
LABEL_59:
                    if (v35 < 1) {
                      char v8 = 1;
                    }
                  }
                }
              }
            }
            else if (v7 != 1 && v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v54 = 0;
              unint64_t v55 = 0;
              unint64_t v52 = 0;
              unint64_t v53 = 0;
              if (inet_pton(30, (const char *)[(__CFString *)v18 UTF8String], &v54) == 1&& inet_pton(30, (const char *)[(__CFString *)objc_retainAutorelease(v20) UTF8String], &v52) == 1)
              {
                unint64_t v36 = bswap64(v54);
                unint64_t v37 = bswap64(v52);
                if (v36 == v37 && (unint64_t v36 = bswap64(v55), v37 = bswap64(v53), v36 == v37)) {
                  int v38 = 0;
                }
                else {
                  int v38 = v36 < v37 ? -1 : 1;
                }
                if (v38 <= 0)
                {
                  unint64_t v39 = bswap64(v54);
                  unint64_t v40 = bswap64(v64);
                  if (v39 == v40 && (unint64_t v39 = bswap64(v55), v40 = bswap64(v65), v39 == v40)) {
                    int v41 = 0;
                  }
                  else {
                    int v41 = v39 < v40 ? -1 : 1;
                  }
                  if (v41 <= 0)
                  {
                    unint64_t v42 = bswap64(v64);
                    unint64_t v43 = bswap64(v52);
                    if (v42 == v43 && (unint64_t v42 = bswap64(v65), v43 = bswap64(v53), v42 == v43))
                    {
                      int v35 = 0;
                    }
                    else if (v42 < v43)
                    {
                      int v35 = -1;
                    }
                    else
                    {
                      int v35 = 1;
                    }
                    goto LABEL_59;
                  }
                }
              }
            }

            if (v8) {
              goto LABEL_64;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v67 count:16];
        }
        while (v13);
      }
LABEL_64:

      if (v8) {
        break;
      }
      uint64_t v9 = v51 + 1;
      if (v51 + 1 == v50)
      {
        uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (!v50)
        {
LABEL_67:

          BOOL v44 = v8 & 1;
          goto LABEL_69;
        }
        goto LABEL_5;
      }
    }

    BOOL v44 = 1;
LABEL_69:
    id v6 = v46;
    id v5 = v47;
  }
  else
  {
    BOOL v44 = 0;
  }

  return v44;
}

- (id)sortedHostPorts:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[AssetCacheServicesReporter serverSortInfoForHostPort:rank:](self, "serverSortInfoForHostPort:rank:", v11, 0, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [(AssetCacheServicesReporter *)self sortedHostPorts:v6 usingSortInfo:v5];

  return v13;
}

- (void)reportPublicIPAddress
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  v2 = @"https://serverstatus.apple.com/services/internetaccess/v1/my_external_ip";
  _os_log_debug_impl(&dword_236089000, log, OS_LOG_TYPE_DEBUG, "sending GET to %@", (uint8_t *)&v1, 0xCu);
}

void __51__AssetCacheServicesReporter_reportPublicIPAddress__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    unsigned int v31 = @"https://serverstatus.apple.com/services/internetaccess/v1/my_external_ip";
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_debug_impl(&dword_236089000, v10, OS_LOG_TYPE_DEBUG, "response from %@: %@; error=%@; data=%@", buf, 0x2Au);
  }

  if (v9)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = v9;
    id v13 = *(id *)(v11 + 40);
    *(void *)(v11 + 40) = v12;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    uint64_t v18 = [v13 statusCode];
    if (!v7 || v18 != 200 || (unint64_t)[v7 length] > 0x400) {
      goto LABEL_5;
    }
    id v29 = 0;
    uint64_t v19 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v29];
    id v20 = v29;
    uint64_t v21 = v20;
    if (v20)
    {
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      id v23 = v20;
      BOOL v24 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v23;
    }
    else
    {
      if (!v19) {
        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_20;
      }
      BOOL v25 = [v19 objectForKey:@"status"];
      int v26 = [v25 isEqual:@"Success"];

      if (!v26) {
        goto LABEL_20;
      }
      uint64_t v27 = [v19 objectForKey:@"ip"];
      uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
      BOOL v24 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;
    }

LABEL_20:
    goto LABEL_5;
  }
LABEL_6:
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    [v14 setObject:*(void *)(a1 + 40) forKey:@"url"];
    if (v7) {
      [v14 setObject:v7 forKey:@"data"];
    }
    if (v8) {
      [v14 setObject:v8 forKey:@"response"];
    }
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1011 userInfo:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  [*(id *)(a1 + 56) invalidateAndCancel];
}

- (void)reportMightHaveWithKeyPath:(id)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AssetCacheServicesReporter *)self keyPath:v4 byAppendingKey:@"might have"];
  [(AssetCacheServicesReporter *)self willStartGatheringResultsForKeyPath:v5];
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  id v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = *MEMORY[0x263F281D8];
  v35[0] = *MEMORY[0x263F281A0];
  v35[1] = v7;
  uint64_t v8 = *MEMORY[0x263EFFB40];
  v36[0] = *MEMORY[0x263EFFB38];
  v36[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  uint64_t v10 = dispatch_get_global_queue(0, 0);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke;
  id v23 = &unk_264C9DB28;
  uint64_t v11 = v6;
  BOOL v24 = v11;
  ACSMightCurrentNetworkHaveCachingServer();

  dispatch_time_t v12 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08438], 60, 0, v20, 3221225472, __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke, &unk_264C9DB28, v11, &v31, &v25);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = (void *)v26[5];
    if (v14)
    {
      uint64_t v15 = objc_msgSend(v14, "domain", v20, 3221225472, __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke, &unk_264C9DB28, v11, &v31, &v25);
      if ([v15 isEqualToString:*MEMORY[0x263F08438]])
      {
        BOOL v16 = [(id)v26[5] code] == 60;

        if (v16)
        {
          id v13 = [MEMORY[0x263EFF9D0] null];
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    long long v17 = (void *)v26[5];
    if (v17)
    {
      id v13 = v17;
    }
    else
    {
      id v13 = [NSNumber numberWithBool:*((unsigned __int8 *)v32 + 24)];
    }
  }
LABEL_11:
  uint64_t v18 = v13;
  -[AssetCacheServicesReporter didGatherResults:forKeyPath:](self, "didGatherResults:forKeyPath:", v13, v5, v20, v21, v22, v23);
  uint64_t v19 = [(AssetCacheServicesReporter *)self results];
  [v19 setValue:v18 forKeyPath:v5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

intptr_t __57__AssetCacheServicesReporter_reportMightHaveWithKeyPath___block_invoke(void *a1, int a2, CFTypeRef cf)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2 != 0;
  if (cf)
  {
    CFRetain(cf);
    uint64_t v5 = *(void *)(a1[6] + 8);
    dispatch_semaphore_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = cf;
  }
  uint64_t v7 = a1[4];
  return dispatch_semaphore_signal(v7);
}

- (void)reportCachedServersWithKeyPath:(id)a3
{
  id v6 = [(AssetCacheServicesReporter *)self keyPath:a3 byAppendingKey:@"saved servers"];
  id v4 = [(AssetCacheServicesReporter *)self results];
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setValue:v5 forKeyPath:v6];

  [(AssetCacheServicesReporter *)self reportServersWithKeyPath:v6 generateOptions:&__block_literal_global];
}

id __61__AssetCacheServicesReporter_reportCachedServersWithKeyPath___block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F281D8];
  v4[0] = *MEMORY[0x263F281A0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263EFFB40];
  v5[0] = *MEMORY[0x263EFFB38];
  v5[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)reportFreshServersWithKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AssetCacheServicesReporter *)self keyPath:v4 byAppendingKey:@"refreshed servers"];
  id v6 = [(AssetCacheServicesReporter *)self results];
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v6 setValue:v7 forKeyPath:v5];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__AssetCacheServicesReporter_reportFreshServersWithKeyPath___block_invoke;
  v8[3] = &unk_264C9DB70;
  v8[4] = v9;
  [(AssetCacheServicesReporter *)self reportServersWithKeyPath:v5 generateOptions:v8];
  _Block_object_dispose(v9, 8);
}

id __60__AssetCacheServicesReporter_reportFreshServersWithKeyPath___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 0;
    uint64_t v4 = *MEMORY[0x263F281A8];
    v5[0] = *MEMORY[0x263EFFB40];
    v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA78];
  }
  return v2;
}

- (void)reportServersWithKeyPath:(id)a3 generateOptions:(id)a4
{
  v118[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id))a4;
  uint64_t v8 = [(AssetCacheServicesReporter *)self keyPath:v6 byAppendingKey:@"personal caching"];
  [(AssetCacheServicesReporter *)self willStartGatheringResultsForKeyPath:v8];
  id v9 = v7[2](v7);
  char v10 = (void *)[v9 mutableCopy];

  uint64_t v117 = *MEMORY[0x263F281C0];
  uint64_t v11 = v117;
  uint64_t v115 = *MEMORY[0x263F281D0];
  uint64_t v84 = v115;
  uint64_t v116 = *MEMORY[0x263EFFB40];
  uint64_t v12 = v116;
  id v13 = [NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
  v118[0] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v118 forKeys:&v117 count:1];
  [v10 addEntriesFromDictionary:v14];

  v83 = [(AssetCacheServicesReporter *)self locateServersWithOptions:v10];
  [(AssetCacheServicesReporter *)self didGatherResults:v83 forKeyPath:v8];
  uint64_t v15 = [(AssetCacheServicesReporter *)self results];
  v78 = (void *)v8;
  [v15 setValue:v83 forKeyPath:v8];

  uint64_t v16 = [(AssetCacheServicesReporter *)self keyPath:v6 byAppendingKey:@"personal caching and import"];
  [(AssetCacheServicesReporter *)self willStartGatheringResultsForKeyPath:v16];
  long long v17 = v7[2](v7);
  uint64_t v18 = (void *)[v17 mutableCopy];

  uint64_t v113 = v11;
  v111[0] = *MEMORY[0x263F281C8];
  v111[1] = v84;
  v112[0] = v12;
  v112[1] = v12;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
  v114 = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  [v18 addEntriesFromDictionary:v20];

  v76 = v18;
  uint64_t v21 = [(AssetCacheServicesReporter *)self locateServersWithOptions:v18];
  [(AssetCacheServicesReporter *)self didGatherResults:v21 forKeyPath:v16];
  uint64_t v22 = [(AssetCacheServicesReporter *)self results];
  v82 = (void *)v21;
  v77 = (void *)v16;
  [v22 setValue:v21 forKeyPath:v16];

  uint64_t v23 = [(AssetCacheServicesReporter *)self keyPath:v6 byAppendingKey:@"shared caching"];
  [(AssetCacheServicesReporter *)self willStartGatheringResultsForKeyPath:v23];
  v79 = v7;
  BOOL v24 = v7[2](v7);
  uint64_t v25 = [(AssetCacheServicesReporter *)self locateServersWithOptions:v24];

  [(AssetCacheServicesReporter *)self didGatherResults:v25 forKeyPath:v23];
  int v26 = [(AssetCacheServicesReporter *)self results];
  v81 = (void *)v25;
  v75 = (void *)v23;
  [v26 setValue:v25 forKeyPath:v23];

  v80 = v6;
  v74 = [(AssetCacheServicesReporter *)self keyPath:v6 byAppendingKey:@"all servers"];
  -[AssetCacheServicesReporter willStartGatheringResultsForKeyPath:](self, "willStartGatheringResultsForKeyPath:");
  uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v28 = v83;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v102 objects:v110 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v103;
      uint64_t v32 = *MEMORY[0x263F281B0];
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v103 != v31) {
            objc_enumerationMutation(v28);
          }
          char v34 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          id v35 = [v34 objectForKey:v32];
          [v27 setObject:v34 forKey:v35];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v102 objects:v110 count:16];
      }
      while (v30);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v36 = v82;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v98 objects:v109 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v99;
      uint64_t v40 = *MEMORY[0x263F281B0];
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v99 != v39) {
            objc_enumerationMutation(v36);
          }
          unint64_t v42 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          unint64_t v43 = [v42 objectForKey:v40];
          [v27 setObject:v42 forKey:v43];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v98 objects:v109 count:16];
      }
      while (v38);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v44 = v81;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v94 objects:v108 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v95;
      uint64_t v48 = *MEMORY[0x263F281B0];
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v95 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v50 = *(void **)(*((void *)&v94 + 1) + 8 * k);
          uint64_t v51 = [v50 objectForKey:v48];
          [v27 setObject:v50 forKey:v51];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v94 objects:v108 count:16];
      }
      while (v46);
    }
  }
  v85 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  unint64_t v52 = [v27 allKeys];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v90 objects:v107 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v91;
    uint64_t v56 = *MEMORY[0x263F281B8];
    do
    {
      for (uint64_t m = 0; m != v54; ++m)
      {
        if (*(void *)v91 != v55) {
          objc_enumerationMutation(v52);
        }
        uint64_t v58 = *(void *)(*((void *)&v90 + 1) + 8 * m);
        long long v59 = [v27 objectForKey:v58];
        long long v60 = [v59 objectForKey:v56];

        long long v61 = [(AssetCacheServicesReporter *)self serverSortInfoForHostPort:v58 rank:v60];
        if (v61) {
          [v85 setObject:v61 forKey:v58];
        }
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v90 objects:v107 count:16];
    }
    while (v54);
  }

  long long v62 = [v27 allKeys];
  long long v63 = [(AssetCacheServicesReporter *)self sortedHostPorts:v62 usingSortInfo:v85];

  unint64_t v64 = [MEMORY[0x263EFF980] array];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v65 = v63;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v86 objects:v106 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v87;
    do
    {
      for (uint64_t n = 0; n != v67; ++n)
      {
        if (*(void *)v87 != v68) {
          objc_enumerationMutation(v65);
        }
        uint64_t v70 = *(void *)(*((void *)&v86 + 1) + 8 * n);
        v71 = [v27 objectForKey:v70];
        [v64 addObject:v71];

        v72 = [(AssetCacheServicesReporter *)self allServerHostPorts];
        [v72 addObject:v70];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v86 objects:v106 count:16];
    }
    while (v67);
  }

  [(AssetCacheServicesReporter *)self didGatherResults:v64 forKeyPath:v74];
  v73 = [(AssetCacheServicesReporter *)self results];
  [v73 setValue:v64 forKeyPath:v74];
}

- (id)locateServersWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  id v28 = __Block_byref_object_dispose_;
  id v29 = (id)MEMORY[0x263EFFA68];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  id v6 = v4;
  _ACSLocateAllCachingServers();

  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
LABEL_3:
    id v9 = (void *)v25[5];
    v25[5] = v8;
    goto LABEL_11;
  }
  char v10 = (void *)v19[5];
  if (v10)
  {
    uint64_t v11 = [v10 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F08438]])
    {
      uint64_t v12 = [(id)v19[5] code];

      if (v12 == 60)
      {
        uint64_t v8 = [MEMORY[0x263EFF9D0] null];
        goto LABEL_3;
      }
    }
    else
    {
    }
  }
  id v13 = (void *)v19[5];
  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v14 = v25;
  id v15 = v13;
  id v9 = (void *)v14[5];
  v14[5] = (uint64_t)v15;
LABEL_11:

LABEL_12:
  id v16 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

intptr_t __55__AssetCacheServicesReporter_locateServersWithOptions___block_invoke(void *a1, CFTypeRef cf, CFTypeRef a3)
{
  if (cf)
  {
    CFRetain(cf);
    uint64_t v6 = *(void *)(a1[5] + 8);
    dispatch_time_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = cf;
  }
  if (a3)
  {
    CFRetain(a3);
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = a3;
  }
  char v10 = a1[4];
  return dispatch_semaphore_signal(v10);
}

- (void)reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:(id)a3
{
  id v4 = a3;
  id v6 = [(AssetCacheServicesReporter *)self keyPath:v4 byAppendingKey:@"saved public IP address ranges"];
  uint64_t v5 = [(AssetCacheServicesReporter *)self keyPath:v4 byAppendingKey:@"saved favored server ranges"];

  [(AssetCacheServicesReporter *)self reportPublicIPAddressRangesWithKeyPath:v6 andFavoredServerRangesWithKeyPath:v5 generateOptions:&__block_literal_global_107];
}

uint64_t __97__AssetCacheServicesReporter_reportCachedPublicIPAddressRangesAndFavoredServerRangesWithKeyPath___block_invoke()
{
  return MEMORY[0x263EFFA78];
}

- (void)reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath:(id)a3
{
  id v4 = a3;
  id v6 = [(AssetCacheServicesReporter *)self keyPath:v4 byAppendingKey:@"refreshed public IP address ranges"];
  uint64_t v5 = [(AssetCacheServicesReporter *)self keyPath:v4 byAppendingKey:@"refreshed favored server ranges"];

  [(AssetCacheServicesReporter *)self reportPublicIPAddressRangesWithKeyPath:v6 andFavoredServerRangesWithKeyPath:v5 generateOptions:&__block_literal_global_109];
}

uint64_t __96__AssetCacheServicesReporter_reportFreshPublicIPAddressRangesAndFavoredServerRangesWithKeyPath___block_invoke()
{
  return MEMORY[0x263EFFA78];
}

- (void)reportPublicIPAddressRangesWithKeyPath:(id)a3 andFavoredServerRangesWithKeyPath:(id)a4 generateOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(void))a5;
  [(AssetCacheServicesReporter *)self willStartGatheringResultsForKeyPath:v8];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy_;
  uint64_t v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = v10[2](v10);
  id v13 = dispatch_get_global_queue(0, 0);
  uint64_t v14 = v11;
  _ACSIntrospect();

  dispatch_time_t v15 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v14, v15))
  {
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
    id v17 = v16;
  }
  else
  {
    uint64_t v18 = (void *)v24[5];
    if (v18)
    {
      id v17 = v18;
      uint64_t v19 = v24;
    }
    else
    {
      id v17 = (id)v36[5];
      uint64_t v19 = v30;
    }
    id v16 = (void *)v19[5];
  }
  id v20 = v16;
  [(AssetCacheServicesReporter *)self didGatherResults:v17 forKeyPath:v8];
  uint64_t v21 = [(AssetCacheServicesReporter *)self results];
  [v21 setValue:v17 forKeyPath:v8];

  [(AssetCacheServicesReporter *)self willStartGatheringResultsForKeyPath:v9];
  [(AssetCacheServicesReporter *)self didGatherResults:v20 forKeyPath:v9];
  uint64_t v22 = [(AssetCacheServicesReporter *)self results];
  [v22 setValue:v20 forKeyPath:v9];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

intptr_t __119__AssetCacheServicesReporter_reportPublicIPAddressRangesWithKeyPath_andFavoredServerRangesWithKeyPath_generateOptions___block_invoke(void *a1, CFDictionaryRef theDict, CFTypeRef cf)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F28198]);
    if (Value)
    {
      dispatch_time_t v7 = Value;
      CFRetain(Value);
      uint64_t v8 = *(void *)(a1[5] + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    char v10 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F28190]);
    if (v10)
    {
      dispatch_semaphore_t v11 = v10;
      CFRetain(v10);
      uint64_t v12 = *(void *)(a1[6] + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
  if (cf)
  {
    CFRetain(cf);
    uint64_t v14 = *(void *)(a1[7] + 8);
    dispatch_time_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = cf;
  }
  id v16 = a1[4];
  return dispatch_semaphore_signal(v16);
}

- (void)reportReachability
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 allServerHostPorts];
  int v4 = 134217984;
  uint64_t v5 = [v3 count];
  _os_log_debug_impl(&dword_236089000, a2, OS_LOG_TYPE_DEBUG, "checking reachability of %ld server(s)", (uint8_t *)&v4, 0xCu);
}

void __48__AssetCacheServicesReporter_reportReachability__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  char v10 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138413058;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl(&dword_236089000, v10, OS_LOG_TYPE_DEBUG, "response from %@: %@; error=%@; data=%@",
      (uint8_t *)&v12,
      0x2Au);
  }

  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] == 200) {
      [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (id)keyPath:(id)a3 byAppendingKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = [v6 length];

  if (v8) {
    [v7 appendString:@"."];
  }
  [v7 appendString:v5];

  return v7;
}

- (void)willStartGatheringResultsForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(AssetCacheServicesReporter *)self weakDelegate];
  uint64_t v6 = [(AssetCacheServicesReporter *)self weakDelegateQueue];
  id v7 = v6;
  if (v5 && v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__AssetCacheServicesReporter_willStartGatheringResultsForKeyPath___block_invoke;
    block[3] = &unk_264C9DC10;
    id v9 = v5;
    char v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __66__AssetCacheServicesReporter_willStartGatheringResultsForKeyPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reporter:*(void *)(a1 + 40) willStartGatheringResultsForKeyPath:*(void *)(a1 + 48)];
}

- (void)didGatherResults:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AssetCacheServicesReporter *)self weakDelegate];
  uint64_t v9 = [(AssetCacheServicesReporter *)self weakDelegateQueue];
  char v10 = v9;
  if (v8 && v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__AssetCacheServicesReporter_didGatherResults_forKeyPath___block_invoke;
    v11[3] = &unk_264C9DC38;
    id v12 = v8;
    uint64_t v13 = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v10, v11);
  }
}

uint64_t __58__AssetCacheServicesReporter_didGatherResults_forKeyPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reporter:*(void *)(a1 + 40) didGatherResults:*(void *)(a1 + 48) forKeyPath:*(void *)(a1 + 56)];
}

- (void)didFinishWithResults:(id)a3
{
  id v4 = a3;
  id v5 = [(AssetCacheServicesReporter *)self weakDelegate];
  uint64_t v6 = [(AssetCacheServicesReporter *)self weakDelegateQueue];
  id v7 = v6;
  if (v5 && v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__AssetCacheServicesReporter_didFinishWithResults___block_invoke;
    block[3] = &unk_264C9DC10;
    id v9 = v5;
    char v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
}

uint64_t __51__AssetCacheServicesReporter_didFinishWithResults___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reporter:*(void *)(a1 + 40) didFinishWithResults:*(void *)(a1 + 48)];
}

- (id)serverSortInfoForHostPort:(id)a3 rank:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 rangeOfString:@":" options:4];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    id v14 = [v6 substringToIndex:v8];
    id v15 = [v6 substringFromIndex:v12 + v13];
    int v29 = 0;
    v28[0] = 0;
    v28[1] = 0;
    if ([(__CFString *)v14 isEqualToString:@"localhost"])
    {

      id v14 = @"127.0.0.1";
    }
    char v10 = v14;
    if (inet_pton(2, (const char *)[v10 UTF8String], &v29) == 1)
    {
      __int16 v16 = (void *)MEMORY[0x263EFF8F8];
      id v17 = &v29;
      uint64_t v18 = 4;
    }
    else
    {
      if (![v10 hasPrefix:@"["]
        || ![v10 hasSuffix:@"]"]
        || (-[NSObject substringWithRange:](v10, "substringWithRange:", 1, [v10 length] - 2),
            id v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = inet_pton(30, (const char *)[v25 UTF8String], v28),
            v25,
            v26 != 1))
      {
        id v19 = [(AssetCacheServicesReporter *)self logHandle];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v6;
          __int16 v34 = 2112;
          uint64_t v35 = v10;
          _os_log_impl(&dword_236089000, v19, OS_LOG_TYPE_DEFAULT, "Server \"%@\" has bad address: %@", buf, 0x16u);
        }
        id v11 = 0;
        goto LABEL_20;
      }
      __int16 v16 = (void *)MEMORY[0x263EFF8F8];
      id v17 = (int *)v28;
      uint64_t v18 = 16;
    }
    id v19 = [v16 dataWithBytes:v17 length:v18];
    if (!v19)
    {
      id v11 = 0;
      goto LABEL_22;
    }
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)objc_msgSend(v15, "intValue"));
    uint64_t v21 = (void *)v20;
    uint64_t v22 = &unk_26E96B1C0;
    if (v7) {
      uint64_t v22 = v7;
    }
    v30[0] = @"rank";
    v30[1] = @"host";
    v31[0] = v22;
    v31[1] = v19;
    v30[2] = @"port";
    v31[2] = v20;
    uint64_t v23 = NSDictionary;
    id v24 = v22;
    id v11 = [v23 dictionaryWithObjects:v31 forKeys:v30 count:3];

LABEL_20:
LABEL_22:

    goto LABEL_23;
  }
  char v10 = [(AssetCacheServicesReporter *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    _os_log_impl(&dword_236089000, v10, OS_LOG_TYPE_DEFAULT, "Server \"%@\" in bad format", buf, 0xCu);
  }
  id v11 = 0;
LABEL_23:

  return v11;
}

- (id)sortedHostPorts:(id)a3 usingSortInfo:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__AssetCacheServicesReporter_sortedHostPorts_usingSortInfo___block_invoke;
  void v9[3] = &unk_264C9DC60;
  id v10 = v5;
  id v6 = v5;
  id v7 = [a3 sortedArrayUsingComparator:v9];

  return v7;
}

uint64_t __60__AssetCacheServicesReporter_sortedHostPorts_usingSortInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 objectForKey:@"rank"];
  id v10 = [v8 objectForKey:@"rank"];
  uint64_t v11 = [v9 compare:v10];
  if (!v11)
  {
    uint64_t v12 = [v7 objectForKey:@"host"];
    uint64_t v13 = [v8 objectForKey:@"host"];
    unint64_t v14 = [v12 length];
    if (v14 < [v13 length])
    {
LABEL_3:
      uint64_t v11 = -1;
LABEL_8:

      goto LABEL_9;
    }
    unint64_t v15 = [v12 length];
    if (v15 <= [v13 length])
    {
      id v16 = v12;
      int v17 = memcmp((const void *)[v16 bytes], (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v16, "length"));
      if (v17 < 0) {
        goto LABEL_3;
      }
      if (!v17)
      {
        id v19 = [v7 objectForKey:@"port"];
        uint64_t v20 = [v8 objectForKey:@"port"];
        uint64_t v11 = [v19 compare:v20];

        goto LABEL_8;
      }
    }
    uint64_t v11 = 1;
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

- (AssetCacheServicesReporterDelegate)weakDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDelegate);
  return (AssetCacheServicesReporterDelegate *)WeakRetained;
}

- (void)setWeakDelegate:(id)a3
{
}

- (OS_dispatch_queue)weakDelegateQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDelegateQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setWeakDelegateQueue:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (NSMutableDictionary)results
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResults:(id)a3
{
}

- (NSMutableSet)allServerHostPorts
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllServerHostPorts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allServerHostPorts, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_destroyWeak((id *)&self->_weakDelegateQueue);
  objc_destroyWeak((id *)&self->_weakDelegate);
}

@end