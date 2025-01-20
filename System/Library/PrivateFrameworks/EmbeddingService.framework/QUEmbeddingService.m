@interface QUEmbeddingService
+ (BOOL)isUnitTested;
+ (id)log;
+ (id)signpostLog;
+ (id)testEmbeddings;
+ (void)setTestEmbeddings:(id)a3;
- (CDMClient)cdmClient;
- (NSLocale)locale;
- (NSString)version;
- (QUEmbeddingService)initWithLocale:(id)a3 version:(id)a4;
- (void)dealloc;
- (void)getEmbeddingForQuery:(id)a3 completionHandler:(id)a4;
- (void)loadWithCompletionHandler:(id)a3;
- (void)setCdmClient:(id)a3;
- (void)setLocale:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation QUEmbeddingService

- (QUEmbeddingService)initWithLocale:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)QUEmbeddingService;
  v9 = [(QUEmbeddingService *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locale, a3);
    uint64_t v11 = [v8 copy];
    version = v10->_version;
    v10->_version = (NSString *)v11;

    v13 = (CDMClient *)objc_alloc_init(MEMORY[0x263F2BFB8]);
    cdmClient = v10->_cdmClient;
    v10->_cdmClient = v13;
  }
  return v10;
}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)gTestEmbeddings;
  if (gTestEmbeddings)
  {
    v6 = [(NSLocale *)self->_locale localeIdentifier];
    id v7 = [v5 objectForKeyedSubscript:v6];

    id v8 = dispatch_get_global_queue(0, 0);
    if (v7)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke;
      block[3] = &unk_265300D80;
      id v23 = v4;
      dispatch_async(v8, block);

      v9 = v23;
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_265300D80;
      id v21 = v4;
      dispatch_async(v8, v20);

      v9 = v21;
    }
  }
  else
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24D19D000, v10, OS_LOG_TYPE_INFO, "[QPNLU] Setting up CDMClient", buf, 2u);
    }

    uint64_t v11 = [(id)objc_opt_class() signpostLog];
    v12 = [(id)objc_opt_class() signpostLog];
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24D19D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CDMClient setup", (const char *)&unk_24D19FF61, buf, 2u);
    }

    version = self->_version;
    cdmClient = self->_cdmClient;
    locale = self->_locale;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_93;
    v17[3] = &unk_265300DA8;
    v17[4] = self;
    id v18 = v4;
    [(CDMClient *)cdmClient setupWithLocale:locale embeddingVersion:version completionHandler:v17];
    v9 = v18;
  }
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__QUEmbeddingService_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;

  return v2;
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__QUEmbeddingService_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;

  return v2;
}

void __25__QUEmbeddingService_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.queryunderstanding", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

void __33__QUEmbeddingService_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.spotlight.QueryParser", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

+ (void)setTestEmbeddings:(id)a3
{
}

+ (id)testEmbeddings
{
  return (id)gTestEmbeddings;
}

+ (BOOL)isUnitTested
{
  if (isUnitTested_onceToken != -1) {
    dispatch_once(&isUnitTested_onceToken, &__block_literal_global);
  }
  return isUnitTested_isUnitTested;
}

void __34__QUEmbeddingService_isUnitTested__block_invoke()
{
  Class v0 = NSClassFromString(&cfstr_Xctestprobe.isa);
  if (v0)
  {
    Class v1 = v0;
    SEL v2 = NSSelectorFromString(&cfstr_Istesting.isa);
    id v4 = [(objc_class *)v1 methodSignatureForSelector:v2];
    id v3 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v4];
    [v3 setSelector:v2];
    [v3 invokeWithTarget:v1];
    [v3 getReturnValue:&isUnitTested_isUnitTested];
  }
}

- (void)dealloc
{
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24D19D000, v3, OS_LOG_TYPE_DEFAULT, "[QPNLU] Deallocating QUEmbeddingService and releasing CDMClient", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)QUEmbeddingService;
  [(QUEmbeddingService *)&v4 dealloc];
}

uint64_t __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"QUEmbeddingServiceTestError" code:-1 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [(id)objc_opt_class() signpostLog];
  v5 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_24D19D000, v4, OS_SIGNPOST_INTERVAL_END, v6, "CDMClient setup", (const char *)&unk_24D19FF61, v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getEmbeddingForQuery:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gTestEmbeddings)
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24D19D000, v8, OS_LOG_TYPE_DEBUG, "Use embedding from test data", buf, 2u);
    }

    v9 = [(id)gTestEmbeddings objectForKeyedSubscript:v6];
    p_super = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke;
    block[3] = &unk_265300DD0;
    uint64_t v11 = &v29;
    v12 = &v28;
    v28 = v9;
    id v29 = v7;
    os_signpost_id_t v13 = v9;
    id v14 = v7;
    dispatch_async(p_super, block);
  }
  else
  {
    v15 = self->_locale;
    objc_super v16 = [(id)objc_opt_class() signpostLog];
    v17 = [(id)objc_opt_class() signpostLog];
    os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, self);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      _os_signpost_emit_with_name_impl(&dword_24D19D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CDMClient getEmbeddingForQuery", "Query = %@", buf, 0xCu);
    }

    cdmClient = self->_cdmClient;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke_95;
    v22[3] = &unk_265300DF8;
    uint64_t v11 = &v26;
    id v26 = v7;
    v12 = &v23;
    id v20 = v6;
    id v23 = v20;
    v24 = v15;
    v25 = self;
    id v21 = v7;
    os_signpost_id_t v13 = v15;
    [(CDMClient *)cdmClient processEmbeddingRequest:v20 completionHandler:v22];
    p_super = &v24->super;
  }
}

uint64_t __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_60;
  }
  id v8 = [MEMORY[0x263EFF980] array];
  v66 = [MEMORY[0x263EFF980] array];
  v65 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v66, "count"));
  v64 = [MEMORY[0x263EFF980] array];
  id v60 = v5;
  v9 = [v5 subwordTokenChain];
  v10 = [MEMORY[0x263F089D8] string];
  uint64_t v11 = [*(id *)(a1 + 32) length];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v61 = v9;
  v12 = [v9 subwordTokens];
  v63 = v8;
  uint64_t v74 = a1;
  uint64_t v70 = [v12 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (!v70)
  {
    id v5 = v60;
LABEL_43:
    v73 = v10;

    goto LABEL_45;
  }
  int64_t v13 = 0;
  char v62 = 0;
  unsigned int v72 = 0;
  int v14 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = *(void *)v77;
  uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
  obuint64_t j = v12;
  do
  {
    for (uint64_t i = 0; i != v70; ++i)
    {
      if (*(void *)v77 != v69) {
        objc_enumerationMutation(obj);
      }
      objc_super v16 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      v17 = [v16 value];
      [v8 addObject:v17];

      if ([v16 tokenIndex] == v14)
      {
        ++v72;
      }
      else
      {
        if (v14 >= 1)
        {
          os_signpost_id_t v18 = (void *)[v10 copy];
          [v66 addObject:v18];

          v19 = [NSNumber numberWithInt:v72];
          [v64 addObject:v19];

          id v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v71, v68);
          [v65 addObject:v20];
        }
        uint64_t v21 = [MEMORY[0x263F089D8] string];

        int v14 = [v16 tokenIndex];
        unsigned int v72 = 1;
        v10 = (void *)v21;
      }
      v22 = [v16 value];
      int v23 = [v22 characterAtIndex:0];
      if (v23 == 9601)
      {
        uint64_t v24 = [v22 substringFromIndex:1];

        v22 = (void *)v24;
      }
      v73 = v10;
      [v10 appendString:v22];
      uint64_t v25 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:locale:", v22, 129, v13, v11 - v13, *(void *)(a1 + 40));
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v27 = v13;
        if ([v22 length] == 1)
        {
          v28 = [MEMORY[0x263F08708] punctuationCharacterSet];
          int v29 = objc_msgSend(v28, "characterIsMember:", objc_msgSend(v22, "characterAtIndex:", 0));

          int64_t v27 = v13;
          if (v29)
          {
            int64_t v27 = v13;
            if (v11 > v13)
            {
              int64_t v27 = v13;
              while (1)
              {
                v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
                int v31 = objc_msgSend(v30, "characterIsMember:", objc_msgSend(*(id *)(v74 + 32), "characterAtIndex:", v27));

                if (!v31) {
                  break;
                }
                if (v11 == ++v27)
                {
                  int64_t v27 = v11;
                  goto LABEL_29;
                }
              }
              v33 = [MEMORY[0x263F08708] punctuationCharacterSet];
              int v34 = objc_msgSend(v33, "characterIsMember:", objc_msgSend(*(id *)(v74 + 32), "characterAtIndex:", v27));

              if (v34)
              {
                uint64_t v26 = 1;
                id v8 = v63;
                a1 = v74;
                goto LABEL_24;
              }
LABEL_29:
              id v8 = v63;
            }
          }
        }
        if ([v22 isEqualToString:@"[CLS]"])
        {
          int64_t v13 = v27;
          a1 = v74;
        }
        else
        {
          a1 = v74;
          if (([v22 isEqualToString:@"[SEP]"] & 1) == 0)
          {
            v35 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v86.location = v13;
              v86.length = v11 - v13;
              v36 = NSStringFromRange(v86);
              *(_DWORD *)buf = 138412546;
              v81 = v22;
              __int16 v82 = 2112;
              v83 = v36;
              _os_log_impl(&dword_24D19D000, v35, OS_LOG_TYPE_DEFAULT, "[QPNLU] Could not find %@ with range %@", buf, 0x16u);
            }
            char v62 = 1;
          }
          int64_t v13 = v27;
        }
      }
      else
      {
        int64_t v27 = v25;
LABEL_24:
        uint64_t v32 = v71;
        if (v23 == 9601) {
          uint64_t v32 = v27;
        }
        int64_t v13 = v26 + v27;
        uint64_t v71 = v32;
        uint64_t v68 = v26 + v27 - v32;
      }
    }
    uint64_t v70 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
  }
  while (v70);

  if (v62)
  {
    v12 = [(id)objc_opt_class() log];
    id v5 = v60;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24D19D000, v12, OS_LOG_TYPE_FAULT, "[QPNLU] Could not find ranges of one or more tokens in the input query string.", buf, 2u);
    }
    goto LABEL_43;
  }
  id v5 = v60;
LABEL_45:
  v37 = [v5 subwordTokenEmbedding];
  v38 = [v37 embeddingTensor];
  id v75 = 0;
  v39 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_26FF786C0 dataType:65568 error:&v75];
  id v7 = v75;
  if ([v38 embeddingDim] == 192
    && (uint64_t v40 = [v38 numToken],
        [v61 subwordTokens],
        v41 = objc_claimAutoreleasedReturnValue(),
        uint64_t v42 = [v41 count] - 2,
        v41,
        v40 == v42))
  {
    for (uint64_t j = 0; j != 5376; ++j)
      [v39 setObject:&unk_26FF786D8 atIndexedSubscript:j];
    uint64_t v44 = [v38 numToken];
    if ([v38 embeddingDim] * v44)
    {
      unint64_t v45 = 0;
      do
      {
        v46 = NSNumber;
        LODWORD(v47) = *(_DWORD *)([v38 values] + 4 * v45);
        v48 = [v46 numberWithFloat:v47];
        [v39 setObject:v48 atIndexedSubscript:v45 + 192];

        ++v45;
        uint64_t v49 = [v38 numToken];
      }
      while ([v38 embeddingDim] * v49 > v45);
    }
  }
  else
  {
    v50 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      v51 = *(void **)(v74 + 32);
      *(_DWORD *)buf = 138412290;
      v81 = v51;
      _os_log_impl(&dword_24D19D000, v50, OS_LOG_TYPE_FAULT, "[QPNLU] Invalid embedding from query: %@", buf, 0xCu);
    }
  }
  v52 = objc_alloc_init(QUEmbeddingOutput);
  [(QUEmbeddingOutput *)v52 setEmbedding:v39];
  v53 = (void *)[v66 copy];
  [(QUEmbeddingOutput *)v52 setTokens:v53];

  v54 = (void *)[v65 copy];
  [(QUEmbeddingOutput *)v52 setTokenRanges:v54];

  v55 = (void *)[v64 copy];
  [(QUEmbeddingOutput *)v52 setSubtokenLenForTokens:v55];

  v56 = objc_msgSend(v63, "subarrayWithRange:", 1, objc_msgSend(v63, "count") - 2);
  [(QUEmbeddingOutput *)v52 setSubtokens:v56];

  v57 = [(id)objc_opt_class() signpostLog];
  v58 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v59 = os_signpost_id_make_with_pointer(v58, *(const void **)(v74 + 48));

  if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24D19D000, v57, OS_SIGNPOST_INTERVAL_END, v59, "CDMClient getEmbeddingForQuery", (const char *)&unk_24D19FF61, buf, 2u);
  }

  (*(void (**)(void))(*(void *)(v74 + 56) + 16))();
LABEL_60:
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (CDMClient)cdmClient
{
  return self->_cdmClient;
}

- (void)setCdmClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmClient, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end