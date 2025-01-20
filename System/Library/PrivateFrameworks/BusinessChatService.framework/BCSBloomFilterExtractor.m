@interface BCSBloomFilterExtractor
- (void)extractShardsURLsFromBloomFilterURL:(id)a3 completion:(id)a4;
- (void)extractShardsURLsFromFilterShardURL:(id)a3 domainShardURL:(id)a4 completion:(id)a5;
@end

@implementation BCSBloomFilterExtractor

- (void)extractShardsURLsFromBloomFilterURL:(id)a3 completion:(id)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = ABSLogCommon();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  v9 = ABSLogCommon();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2154F4000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Unzip Megashard", (const char *)&unk_215579135, buf, 2u);
  }

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke;
  v29[3] = &unk_264248AC8;
  os_signpost_id_t v31 = v8;
  id v11 = v6;
  id v30 = v11;
  v12 = (void (**)(void, void, void))MEMORY[0x2166BDB40](v29);
  v13 = +[BCSPathProvider sharedInstance];
  v14 = [v13 tempURL];

  if (v14)
  {
    v15 = NSString;
    v16 = [MEMORY[0x263F08C38] UUID];
    v17 = [v16 UUIDString];
    v18 = [v15 stringWithFormat:@"%@_%@", @"bloom_filter", v17];

    v19 = [v14 URLByAppendingPathComponent:v18];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_12;
    v26[3] = &unk_264248B18;
    v28 = v12;
    id v20 = v19;
    id v27 = v20;
    v21 = (void *)MEMORY[0x2166BDB40](v26);
    v22 = ABSLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v20;
      _os_log_debug_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEBUG, "Unzipping megashard to %@", buf, 0xCu);
    }

    id v23 = objc_alloc(MEMORY[0x263F4A828]);
    v24 = (void *)[v23 initWithInputURL:v5 outputURL:v20 identifier:0 operation:1 completionBlock:v21 queue:MEMORY[0x263EF83A0]];
    [v24 start];
  }
  else
  {
    uint64_t v34 = *MEMORY[0x263F08320];
    v35[0] = @"Failed get temp directory";
    v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v18 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:100 userInfo:v25];

    ((void (**)(void, void, void *))v12)[2](v12, 0, v18);
  }
}

void __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = ABSLogCommon();
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2154F4000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Unzip Megashard", (const char *)&unk_215579135, v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_12(uint64_t a1, void *a2)
{
  v34[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 cleanup];
  if ([v3 didErrorOccur])
  {
    uint64_t v33 = *MEMORY[0x263F08320];
    v34[0] = @"Failed to unzip the megashard";
    v4 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v5 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__1;
    v28 = __Block_byref_object_dispose__1;
    id v29 = 0;
    id v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = *(void *)(a1 + 32);
    os_signpost_id_t v8 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263EFF6A8]];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_18;
    v23[3] = &unk_264248AF0;
    v23[4] = &v24;
    os_signpost_id_t v9 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:0 errorHandler:v23];

    if (v25[5])
    {
      v10 = ABSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2154F4000, v10, OS_LOG_TYPE_ERROR, "Error enumerating the unzipped shards on disk", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v11 = [MEMORY[0x263EFF980] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v19;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(v11, "addObject:", *(void *)(*((void *)&v18 + 1) + 8 * v15++), (void)v18);
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v32 count:16];
        }
        while (v13);
      }

      if ([v11 count])
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        uint64_t v30 = *MEMORY[0x263F08320];
        os_signpost_id_t v31 = @"No shards in the unzipped megashard";
        v16 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 userInfo:v16];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    _Block_object_dispose(&v24, 8);
  }
}

uint64_t __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_18(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (void)extractShardsURLsFromFilterShardURL:(id)a3 domainShardURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke;
    v11[3] = &unk_264248B68;
    id v12 = v8;
    id v15 = v10;
    id v13 = v9;
    uint64_t v14 = self;
    [(BCSBloomFilterExtractor *)self extractShardsURLsFromBloomFilterURL:v12 completion:v11];
  }
}

void __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(void *)(a1 + 32))
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_7:
    v7();
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_7;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke_2;
  v10[3] = &unk_264248B40;
  id v9 = *(void **)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v11 = v5;
  [v9 extractShardsURLsFromBloomFilterURL:v8 completion:v10];

LABEL_8:
}

uint64_t __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

@end