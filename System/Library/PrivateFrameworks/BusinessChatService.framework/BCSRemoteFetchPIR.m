@interface BCSRemoteFetchPIR
- (BCSMetricFactoryProtocol)metricFactory;
- (BCSPIRServerEnvironmentProtocol)environment;
- (CMLKeywordPIRClient)pirClient;
- (OS_dispatch_queue)pirQueue;
- (id)decompressData:(id)a3;
- (id)errorForPIRError:(id)a3;
- (id)initWithEnvironment:(void *)a3 metricFactory:;
- (id)initWithEnvironment:(void *)a3 metricFactory:(void *)a4 queue:;
- (void)fetchDataMatching:(id)a3 timeout:(int64_t)a4 completion:(id)a5;
- (void)fetchDataMatchingBatch:(id)a3 timeout:(int64_t)a4 perItemBlock:(id)a5 completion:(id)a6;
- (void)setMetricFactory:(id)a3;
- (void)setPirClient:(id)a3;
- (void)setPirQueue:(id)a3;
@end

@implementation BCSRemoteFetchPIR

- (id)initWithEnvironment:(void *)a3 metricFactory:
{
  v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.businesschat.calleridresolver.pir", 0);
    v8 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:queue:](v3, v6, v5, v7);

    v3 = v8;
  }
  return v3;
}

- (id)initWithEnvironment:(void *)a3 metricFactory:(void *)a4 queue:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)BCSRemoteFetchPIR;
    v11 = (id *)objc_msgSendSuper2(&v23, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      uint64_t v12 = [v8 secondaryIdentifier];
      if (v12) {
        v13 = (__CFString *)v12;
      }
      else {
        v13 = @"com.apple.businessservicesd";
      }
      id v14 = objc_alloc(MEMORY[0x263F32008]);
      v15 = [a1[1] pirUseCase];
      v16 = (void *)[v14 initWithUseCase:v15 sourceApplicationBundleIdentifier:v13];

      uint64_t v17 = [objc_alloc(MEMORY[0x263F32018]) initWithClientConfig:v16];
      id v18 = a1[3];
      a1[3] = (id)v17;

      objc_storeStrong(a1 + 4, a4);
      v19 = ABSLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v8 pirUseCase];
        int v21 = [v8 pirUsesCompression];
        *(_DWORD *)buf = 138412546;
        v25 = v20;
        __int16 v26 = 1024;
        int v27 = v21;
        _os_log_impl(&dword_2154F4000, v19, OS_LOG_TYPE_DEFAULT, "Fetch from PIR configured for use case '%@', compressed: %d", buf, 0x12u);
      }
    }
  }

  return a1;
}

- (void)fetchDataMatchingBatch:(id)a3 timeout:(int64_t)a4 perItemBlock:(id)a5 completion:(id)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v47 = a3;
  v45 = (uint64_t (**)(id, uint64_t, void, void *))a5;
  v44 = (void (**)(id, void *))a6;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSRemoteFetchPIR fetchDataMatchingBatch:timeout:perItemBlock:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  id v10 = [v47 itemIdentifiers];
  v46 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v11 = [v47 itemIdentifiers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v67;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        v16 = [v47 itemIdentifier];
        char v17 = [v16 conformsToProtocol:&unk_26C62ED28];

        if (v17)
        {
          [v46 addObject:v15];
        }
        else
        {
          id v18 = ABSLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[BCSRemoteFetchPIR fetchDataMatchingBatch:timeout:perItemBlock:completion:]";
            _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "%s - Invalid item identifier (non-PIR identifying)", (uint8_t *)&buf, 0xCu);
          }

          v19 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:1000 errorDescription:@"Invalid item identifier (non-PIR identifying)"];
          if ((v45[2](v45, v15, 0, v19) & 1) == 0)
          {
            v40 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:45 errorDescription:@"Request cancelled by caller (perItem block return NO)"];
            v44[2](v44, v40);

            goto LABEL_29;
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if ([v46 count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v46, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v21 = v46;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v62 objects:v77 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v63 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = [*(id *)(*((void *)&v62 + 1) + 8 * j) pirKey];
          [v20 addObject:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v62 objects:v77 count:16];
      }
      while (v22);
    }

    id v26 = objc_alloc_init(MEMORY[0x263F08958]);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v75 = 0x2020000000;
    char v76 = 0;
    int v27 = [(BCSRemoteFetchPIR *)self metricFactory];
    uint64_t v28 = [v27 measurementFactory];
    v29 = [v47 itemIdentifier];
    v30 = [v28 pirFetchTimingMeasurementForItemIdentifier:v29];

    [v30 begin];
    dispatch_time_t v31 = dispatch_time(0, a4);
    v32 = [(BCSRemoteFetchPIR *)self pirQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke;
    block[3] = &unk_26424A150;
    id v33 = v26;
    id v59 = v33;
    p_long long buf = &buf;
    v34 = v44;
    v60 = v34;
    dispatch_after(v31, v32, block);

    v35 = ABSLogCommon();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v70 = 136315395;
      v71 = "-[BCSRemoteFetchPIR fetchDataMatchingBatch:timeout:perItemBlock:completion:]";
      __int16 v72 = 2113;
      v73 = v20;
      _os_log_impl(&dword_2154F4000, v35, OS_LOG_TYPE_DEFAULT, "%s - fetching data from PIR for keys '%{private}@'", v70, 0x16u);
    }

    v36 = [(BCSRemoteFetchPIR *)self pirQueue];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke_69;
    v48[3] = &unk_26424A1A0;
    id v49 = v30;
    id v50 = v33;
    v57 = &buf;
    v55 = v34;
    id v51 = v21;
    id v52 = v47;
    v56 = v45;
    v53 = self;
    id v54 = v20;
    id v37 = v20;
    id v38 = v33;
    id v39 = v30;
    dispatch_async(v36, v48);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v41 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"No identifiers requested"];
    v44[2](v44, v41);
  }
LABEL_29:
}

void __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    v3 = *(void **)(a1 + 32);
    [v3 unlock];
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
    [*(id *)(a1 + 32) unlock];
    id v4 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:43 errorDescription:@"Timeout waiting for response from PIR"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke_69(uint64_t a1)
{
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke_2;
  v25[3] = &unk_26424A178;
  id v26 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 96);
  id v27 = v2;
  uint64_t v33 = v3;
  id v31 = *(id *)(a1 + 80);
  id v28 = *(id *)(a1 + 48);
  id v29 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 64);
  id v32 = v4;
  uint64_t v30 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x2166BDB40](v25);
  dispatch_queue_t v7 = +[BCSUserDefaults sharedDefaults];
  id v8 = [v7 objectForKey:@"BCSMaxPIRConcurrency"];

  if (v8
    && (+[BCSUserDefaults sharedDefaults],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 integerForKey:@"BCSMaxPIRConcurrency"],
        v9,
        v10 > 1))
  {
    char v17 = ABSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "Concurrent PIR requests ENABLED", buf, 2u);
    }

    id v18 = [*(id *)(a1 + 64) pirClient];
    uint64_t v19 = *(void *)(a1 + 72);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke_85;
    v21[3] = &unk_264248B40;
    v20 = v6;
    v21[4] = *(void *)(a1 + 64);
    id v22 = v20;
    [v18 requestDataByStringKeywords:v19 completionHandler:v21];

    id v14 = v22;
  }
  else
  {
    v11 = ABSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "Concurrent PIR requests DISABLED", buf, 2u);
    }

    uint64_t v12 = [*(id *)(a1 + 64) pirClient];
    uint64_t v13 = *(void *)(a1 + 72);
    id v23 = 0;
    id v14 = [v12 dataByStringKeywords:v13 error:&v23];
    id v15 = v23;

    v16 = [*(id *)(a1 + 64) errorForPIRError:v15];
    ((void (**)(void, void *, void *))v6)[2](v6, v14, v16);
  }
}

void __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  [*(id *)(a1 + 40) lock];
  uint64_t v7 = *(void *)(*(void *)(a1 + 88) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    [*(id *)(a1 + 40) unlock];
    if (![v5 count])
    {
LABEL_30:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_32;
    }
    id v8 = 0;
    char v9 = 1;
    uint64_t v10 = @"com.apple.businessservices";
    uint64_t v30 = *MEMORY[0x263F08320];
    while (1)
    {
      if ((v9 & 1) == 0)
      {
        id v27 = +[BCSError errorWithDomain:v10 code:45 errorDescription:@"Request cancelled by caller (perItem block return NO)"];
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

        goto LABEL_32;
      }
      v11 = [v5 objectAtIndexedSubscript:v8];
      uint64_t v12 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v8];
      if (!v12)
      {
        char v17 = ABSLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v26 = [*(id *)(a1 + 56) itemIdentifiers];
          *(_DWORD *)long long buf = 136315650;
          id v38 = "-[BCSRemoteFetchPIR fetchDataMatchingBatch:timeout:perItemBlock:completion:]_block_invoke_2";
          __int16 v39 = 2048;
          v40 = v8;
          __int16 v41 = 2112;
          v42 = v26;
          _os_log_error_impl(&dword_2154F4000, v17, OS_LOG_TYPE_ERROR, "%s - Unexpectedly invalid index (%lu) in query item identifiers (%@{private})", buf, 0x20u);
        }
        char v9 = 1;
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v21 = ABSLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v38 = "-[BCSRemoteFetchPIR fetchDataMatchingBatch:timeout:perItemBlock:completion:]_block_invoke";
          __int16 v39 = 2112;
          v40 = v11;
          _os_log_error_impl(&dword_2154F4000, v21, OS_LOG_TYPE_ERROR, "%s - Unexpected response data (received %@, expected NSData)", buf, 0x16u);
        }

        uint64_t v33 = v30;
        v34 = @"Invalid response from server";
        id v14 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v15 = v10;
        uint64_t v16 = 100;
        goto LABEL_21;
      }
      char v17 = v11;
      id v18 = [*(id *)(a1 + 64) environment];
      int v19 = [v18 pirUsesCompression];

      if (v19)
      {
        v20 = [*(id *)(a1 + 64) decompressData:v17];
        if (v17)
        {
          char v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
        }
        else
        {
          id v29 = v6;
          id v23 = ABSLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v38 = 0;
            _os_log_error_impl(&dword_2154F4000, v23, OS_LOG_TYPE_ERROR, "Failed to decompress data (%@)!", buf, 0xCu);
          }

          uint64_t v31 = v30;
          id v32 = @"Failed to decompress data";
          v24 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          +[BCSError errorWithDomain:v10 code:100 userInfo:v24];
          v25 = id v28 = v10;

          char v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
          uint64_t v10 = v28;
          id v6 = v29;
        }

        goto LABEL_23;
      }
      id v22 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_22:
      char v9 = v22();
LABEL_23:

      if ((unint64_t)++v8 >= [v5 count]) {
        goto LABEL_30;
      }
    }
    uint64_t v13 = ABSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315395;
      id v38 = "-[BCSRemoteFetchPIR fetchDataMatchingBatch:timeout:perItemBlock:completion:]_block_invoke";
      __int16 v39 = 2113;
      v40 = (char *)v12;
      _os_log_error_impl(&dword_2154F4000, v13, OS_LOG_TYPE_ERROR, "%s - Failed to fetch requested data (received NSNull for %{private}@)", buf, 0x16u);
    }

    uint64_t v35 = v30;
    v36 = @"No matching data found";
    id v14 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v15 = v10;
    uint64_t v16 = 46;
LABEL_21:
    char v17 = +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", v15, v16, v14, v28);

    id v22 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    goto LABEL_22;
  }
  [*(id *)(a1 + 40) unlock];
LABEL_32:
}

void __76__BCSRemoteFetchPIR_fetchDataMatchingBatch_timeout_perItemBlock_completion___block_invoke_85(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorForPIRError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

- (void)fetchDataMatching:(id)a3 timeout:(int64_t)a4 completion:(id)a5
{
  v50[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSRemoteFetchPIR fetchDataMatching:timeout:completion:]";
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v11 = [v8 itemIdentifier];
  char v12 = [v11 conformsToProtocol:&unk_26C62ED28];

  if (v12)
  {
    uint64_t v13 = [v8 itemIdentifier];
    id v14 = objc_alloc_init(MEMORY[0x263F08958]);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    id v15 = [(BCSRemoteFetchPIR *)self metricFactory];
    uint64_t v16 = [v15 measurementFactory];
    char v17 = [v8 itemIdentifier];
    id v18 = [v16 pirFetchTimingMeasurementForItemIdentifier:v17];

    [v18 begin];
    dispatch_time_t v19 = dispatch_time(0, a4);
    v20 = [(BCSRemoteFetchPIR *)self pirQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke;
    block[3] = &unk_26424A150;
    id v21 = v14;
    id v39 = v21;
    p_long long buf = &buf;
    id v22 = v9;
    id v40 = v22;
    dispatch_after(v19, v20, block);

    id v23 = [v13 pirKey];
    v24 = ABSLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 136315395;
      uint64_t v43 = "-[BCSRemoteFetchPIR fetchDataMatching:timeout:completion:]";
      __int16 v44 = 2113;
      v45 = v23;
      _os_log_impl(&dword_2154F4000, v24, OS_LOG_TYPE_DEFAULT, "%s - fetching data from PIR for key '%{private}@'", v42, 0x16u);
    }

    v25 = [(BCSRemoteFetchPIR *)self pirQueue];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_86;
    v31[3] = &unk_26424A218;
    id v32 = v18;
    id v33 = v21;
    id v37 = &buf;
    v34 = self;
    id v35 = v23;
    id v36 = v22;
    id v26 = v23;
    id v27 = v21;
    id v28 = v18;
    dispatch_async(v25, v31);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v29 = ABSLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[BCSRemoteFetchPIR fetchDataMatching:timeout:completion:]";
      _os_log_impl(&dword_2154F4000, v29, OS_LOG_TYPE_DEFAULT, "%s - Invalid item identifier (non-PIR identifying)", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v49 = *MEMORY[0x263F08320];
    v50[0] = @"Invalid item identifier (non-PIR identifying)";
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    uint64_t v13 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:1000 userInfo:v30];

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

void __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) lock];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 unlock];
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
    [*(id *)(a1 + 32) unlock];
    uint64_t v6 = *MEMORY[0x263F08320];
    v7[0] = @"Timeout waiting for response from PIR";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:43 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_86(uint64_t a1)
{
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_2;
  v25[3] = &unk_26424A1C8;
  id v26 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v27 = v2;
  uint64_t v28 = v3;
  long long v20 = *(_OWORD *)(a1 + 64);
  id v4 = (id)v20;
  long long v29 = v20;
  id v5 = (void (**)(void, void, void))MEMORY[0x2166BDB40](v25);
  uint64_t v6 = +[BCSUserDefaults sharedDefaults];
  id v7 = [v6 objectForKey:@"BCSMaxPIRConcurrency"];

  if (v7
    && (+[BCSUserDefaults sharedDefaults],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 integerForKey:@"BCSMaxPIRConcurrency"],
        v8,
        v9 > 1))
  {
    uint64_t v16 = ABSLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2154F4000, v16, OS_LOG_TYPE_DEFAULT, "Concurrent PIR requests ENABLED", buf, 2u);
    }

    char v17 = [*(id *)(a1 + 48) pirClient];
    uint64_t v18 = *(void *)(a1 + 56);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_88;
    v21[3] = &unk_26424A1F0;
    dispatch_time_t v19 = v5;
    v21[4] = *(void *)(a1 + 48);
    id v22 = v19;
    [v17 requestDataByStringKeyword:v18 completionHandler:v21];

    uint64_t v13 = v22;
  }
  else
  {
    uint64_t v10 = ABSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "Concurrent PIR requests DISABLED", buf, 2u);
    }

    v11 = [*(id *)(a1 + 48) pirClient];
    uint64_t v12 = *(void *)(a1 + 56);
    id v23 = 0;
    uint64_t v13 = [v11 dataByStringKeyword:v12 error:&v23];
    id v14 = v23;

    id v15 = [*(id *)(a1 + 48) errorForPIRError:v14];
    ((void (**)(void, void *, void *))v5)[2](v5, v13, v15);
  }
}

void __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) end];
  [*(id *)(a1 + 40) lock];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    [*(id *)(a1 + 40) unlock];
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 1;
    [*(id *)(a1 + 40) unlock];
    id v7 = v11;
    id v8 = [*(id *)(a1 + 48) environment];
    char v9 = [v8 pirUsesCompression];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 48) decompressData:v7];

      id v7 = (id)v10;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_88(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 errorForPIRError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

- (id)decompressData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF990];
    id v4 = a3;
    id v5 = [v3 dataWithLength:0x4000];
    id v6 = (uint8_t *)[v5 mutableBytes];
    size_t v7 = [v5 length];
    id v8 = v4;
    char v9 = (const uint8_t *)[v8 bytes];
    size_t v10 = [v8 length];

    size_t v11 = compression_decode_buffer(v6, v7, v9, v10, 0, COMPRESSION_LZ4_RAW);
    if (v11)
    {
      uint64_t v12 = objc_msgSend(v5, "subdataWithRange:", 0, v11);
    }
    else
    {
      uint64_t v13 = ABSLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        uint64_t v16 = "-[BCSRemoteFetchPIR decompressData:]";
        _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "%s - Failed to unzip", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)errorForPIRError:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x263F08608];
    v9[0] = *MEMORY[0x263F08320];
    v9[1] = v3;
    v10[0] = @"Error fetching data from PIR";
    v10[1] = a3;
    id v4 = NSDictionary;
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];
    size_t v7 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:48 userInfo:v6];
  }
  else
  {
    size_t v7 = 0;
  }

  return v7;
}

- (BCSPIRServerEnvironmentProtocol)environment
{
  return self->_environment;
}

- (BCSMetricFactoryProtocol)metricFactory
{
  return self->_metricFactory;
}

- (void)setMetricFactory:(id)a3
{
}

- (CMLKeywordPIRClient)pirClient
{
  return self->_pirClient;
}

- (void)setPirClient:(id)a3
{
}

- (OS_dispatch_queue)pirQueue
{
  return self->_pirQueue;
}

- (void)setPirQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pirQueue, 0);
  objc_storeStrong((id *)&self->_pirClient, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end