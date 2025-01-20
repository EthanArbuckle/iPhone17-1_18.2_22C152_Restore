@interface BCSQueryChopper
- (id)_chopItemIdentifiersToFetchFromURL:(int)a3 isBloomFilterCached:;
- (uint64_t)_indexOfItemIdentifierInfo:(void *)a3 inItemIdentifierInfos:;
- (void)_returnHighestPriorityLinkItemWithItemIdentifiersToFetch:(void *)a3 fetchedItems:(void *)a4 fetchedErrors:(void *)a5 metric:(void *)a6 completion:;
- (void)initWithMetricFactory:(void *)a1;
- (void)queryChopperDelegate:(id)a3 fetchLinkItemModelWithURL:(id)a4 isBloomFilterCached:(BOOL)a5 forClientBundleID:(id)a6 metric:(id)a7 completion:(id)a8;
- (void)queryChopperDelegate:(id)a3 isBusinessRegisteredForURL:(id)a4 isBloomFilterCached:(BOOL)a5 forClientBundleID:(id)a6 metric:(id)a7 completion:(id)a8;
@end

@implementation BCSQueryChopper

- (void)initWithMetricFactory:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BCSQueryChopper;
    id v5 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
      dispatch_queue_t v7 = dispatch_queue_create((const char *)[@"com.apple.businesschatservice.querychopper.serialqueue" UTF8String], v6);
      v8 = (void *)a1[1];
      a1[1] = v7;
    }
  }

  return a1;
}

- (void)queryChopperDelegate:(id)a3 fetchLinkItemModelWithURL:(id)a4 isBloomFilterCached:(BOOL)a5 forClientBundleID:(id)a6 metric:(id)a7 completion:(id)a8
{
  BOOL v11 = a5;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v36 = a6;
  id v37 = a7;
  id v16 = a8;
  v17 = ABSLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached"
                                    ":forClientBundleID:metric:completion:]";
    _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v16)
  {
    v35 = -[BCSQueryChopper _chopItemIdentifiersToFetchFromURL:isBloomFilterCached:]((uint64_t)self, v15, v11);
    if ([v35 count])
    {
      dispatch_group_t v18 = dispatch_group_create();
      v19 = objc_opt_new();
      v20 = objc_opt_new();
      v21 = objc_opt_new();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x2020000000;
      char v59 = 0;
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke;
      v45[3] = &unk_264249AD8;
      dispatch_group_t group = v18;
      dispatch_group_t v46 = group;
      v47 = self;
      id v48 = v36;
      id v34 = v14;
      id v49 = v14;
      id v22 = v35;
      id v50 = v22;
      id v23 = v19;
      id v51 = v23;
      id v24 = v20;
      id v52 = v24;
      id v25 = v21;
      id v53 = v25;
      p_long long buf = &buf;
      id v26 = v37;
      id v54 = v26;
      id v27 = v16;
      id v55 = v27;
      [v22 enumerateObjectsUsingBlock:v45];
      id v28 = v15;
      if (self) {
        serialDispatchQueue = self->_serialDispatchQueue;
      }
      else {
        serialDispatchQueue = 0;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_9;
      block[3] = &unk_264249B00;
      v44 = &buf;
      block[4] = self;
      id v39 = v22;
      id v40 = v24;
      id v41 = v25;
      id v42 = v26;
      id v43 = v27;
      id v30 = v25;
      id v31 = v24;
      dispatch_group_notify(group, serialDispatchQueue, block);

      id v14 = v34;
      id v15 = v28;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v32 = ABSLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCa"
                                        "ched:forClientBundleID:metric:completion:]";
        _os_log_impl(&dword_2154F4000, v32, OS_LOG_TYPE_DEFAULT, "%s No items to fetch, bailing...", (uint8_t *)&buf, 0xCu);
      }

      [v37 setSuccessfulChop:-1];
      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
}

- (id)_chopItemIdentifiersToFetchFromURL:(int)a3 isBloomFilterCached:
{
  v51[1] = *MEMORY[0x263EF8340];
  id v41 = a2;
  if (a1)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v39 = (void *)[v41 copy];
    id v40 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v39);
    if (v40)
    {
      v6 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v40, 1);
      [v5 addObject:v6];
    }
    dispatch_queue_t v7 = [v39 host];
    uint64_t v8 = [v7 length];

    if (v8 && a3)
    {
      id v37 = -[NSURL URLByDeletingFragment](v41);
      v35 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v37 resolvingAgainstBaseURL:0];
      v9 = [v35 queryItems];
      v32 = [v9 firstObject];

      if (v32)
      {
        v51[0] = v32;
        objc_super v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
        [v35 setQueryItems:v10];

        BOOL v11 = v35;
      }
      else
      {
        BOOL v11 = v35;
        [v35 setQueryItems:0];
      }
      id v30 = [v11 URL];
      id v34 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v30);
      if (v34)
      {
        v12 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v34, 2);
        objc_msgSend(v5, "addObject:", v12, v30);
      }
      id v36 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v37 resolvingAgainstBaseURL:0];
      [v36 setQueryItems:0];
      v38 = [v36 URL];
      v33 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v38);
      if (v33)
      {
        v13 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v33, 3);
        [v5 addObject:v13];
      }
      id v14 = objc_msgSend(v38, "lastPathComponent", v30);
      if ([v14 length])
      {
        id v15 = v38;
        do
        {
          id v16 = [v15 lastPathComponent];

          v17 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v15);
          if (v17)
          {
            if ([v16 isEqualToString:@"/"]) {
              int64_t v18 = 5;
            }
            else {
              int64_t v18 = 4;
            }
            v19 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v17, v18);
            [v5 addObject:v19];
          }
          v20 = [v15 absoluteString];
          unint64_t v21 = [v20 length];

          id v22 = [v15 URLByDeletingLastPathComponent];

          id v23 = [v22 absoluteString];
          unint64_t v24 = [v23 length];

          if (![v16 length]) {
            break;
          }
          int v25 = [v16 isEqualToString:@"/"];
          int v26 = v24 > v21 ? 1 : v25;
          id v14 = v16;
          id v15 = v22;
        }
        while (v26 != 1);
      }
      else
      {
        id v16 = v14;
      }
    }
    id v27 = v5;
    uint64_t v45 = 0;
    dispatch_group_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    id v48 = __Block_byref_object_copy__4;
    id v49 = __Block_byref_object_dispose__4;
    id v50 = (id)objc_opt_new();
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__4;
    v43[4] = __Block_byref_object_dispose__4;
    id v44 = (id)objc_opt_new();
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __61__BCSQueryChopper__removeLinkItemDuplicatesInOrderFromArray___block_invoke;
    v42[3] = &unk_264249C40;
    v42[4] = v43;
    v42[5] = &v45;
    [v27 enumerateObjectsUsingBlock:v42];
    id v28 = (void *)[(id)v46[5] copy];
    _Block_object_dispose(v43, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    id v4 = (void *)v4[2];
  }
  id v5 = v4;
  v6 = [v5 measurementFactory];
  if (v3) {
    dispatch_queue_t v7 = (void *)v3[1];
  }
  else {
    dispatch_queue_t v7 = 0;
  }
  id v8 = v7;
  v9 = [v6 businessLinkChoppedFetchTimingMeasurementForItemIdentifier:v8];

  [v9 begin];
  objc_super v10 = [BCSQuery alloc];
  if (v3) {
    uint64_t v11 = v3[1];
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = [(BCSQuery *)v10 initWithItemIdentifier:v11 clientBundleId:*(void *)(a1 + 48) shardType:2];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2;
  v19[3] = &unk_264249AB0;
  uint64_t v13 = *(void *)(a1 + 40);
  id v20 = v9;
  uint64_t v21 = v13;
  id v22 = v3;
  id v14 = *(void **)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v24 = *(id *)(a1 + 72);
  id v25 = *(id *)(a1 + 80);
  id v15 = *(id *)(a1 + 88);
  uint64_t v16 = *(void *)(a1 + 112);
  id v26 = v15;
  uint64_t v30 = v16;
  id v27 = *(id *)(a1 + 96);
  id v29 = *(id *)(a1 + 104);
  id v28 = *(id *)(a1 + 32);
  v17 = v3;
  id v18 = v9;
  [v14 fetchItemWithQuery:v12 completion:v19];
}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) end];
  uint64_t v7 = -[BCSQueryChopper _indexOfItemIdentifierInfo:inItemIdentifierInfos:](*(void *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromBOOL();
    *(_DWORD *)long long buf = 136315906;
    v32 = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metric:"
          "completion:]_block_invoke_2";
    __int16 v33 = 2114;
    id v34 = v9;
    __int16 v35 = 2048;
    uint64_t v36 = v7;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - chop attempt found item: %{public}@ - itemPriority:%ld - error:%@", buf, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    uint64_t v11 = *(NSObject **)(v10 + 8);
  }
  else {
    uint64_t v11 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_3;
  block[3] = &unk_264249A88;
  id v18 = v5;
  id v19 = *(id *)(a1 + 64);
  uint64_t v30 = v7;
  id v20 = *(id *)(a1 + 72);
  id v21 = v6;
  id v12 = *(id *)(a1 + 80);
  uint64_t v29 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = *(void **)(a1 + 48);
  id v22 = v12;
  uint64_t v23 = v13;
  id v24 = v14;
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 88);
  id v28 = *(id *)(a1 + 104);
  id v27 = *(id *)(a1 + 96);
  id v15 = v6;
  id v16 = v5;
  dispatch_async(v11, block);
}

- (uint64_t)_indexOfItemIdentifierInfo:(void *)a3 inItemIdentifierInfos:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__BCSQueryChopper__indexOfItemIdentifierInfo_inItemIdentifierInfos___block_invoke;
    v9[3] = &unk_264249BC8;
    id v10 = v5;
    uint64_t v11 = &v12;
    [v6 enumerateObjectsUsingBlock:v9];
    a1 = v13[3];
    if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = ABSLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        v17 = "-[BCSQueryChopper _indexOfItemIdentifierInfo:inItemIdentifierInfos:]";
        _os_log_error_impl(&dword_2154F4000, v7, OS_LOG_TYPE_ERROR, "%s - Index of item identifier not found", buf, 0xCu);
      }

      a1 = 0;
    }

    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 128)];
  if (v3)
  {
    [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v4];

    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
  }
  else
  {
    [v2 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v4];

    id v5 = *(void **)(a1 + 48);
    id v6 = [MEMORY[0x263EFF9D0] null];
    [v5 addObject:v6];
  }
  uint64_t v7 = *(void **)(a1 + 64);
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:");
    if (!v3) {
      goto LABEL_23;
    }
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9D0] null];
    [v7 addObject:v8];

    if (!v3) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)) {
    goto LABEL_23;
  }
  uint64_t v9 = *(void *)(a1 + 72);
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 88);
  id v12 = *(id *)(a1 + 80);
  id v13 = v10;
  id v14 = v11;
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v15 = -[BCSQueryChopper _indexOfItemIdentifierInfo:inItemIdentifierInfos:](v9, v12, v14);
  if (!v15)
  {

LABEL_20:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 1;
    uint64_t v23 = ABSLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315138;
      id v25 = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metri"
            "c:completion:]_block_invoke";
      _os_log_impl(&dword_2154F4000, v23, OS_LOG_TYPE_DEFAULT, "%s - all higher priority items queries have returned from server, return early", (uint8_t *)&v24, 0xCu);
    }

    -[BCSQueryChopper _returnHighestPriorityLinkItemWithItemIdentifiersToFetch:fetchedItems:fetchedErrors:metric:completion:](*(void *)(a1 + 72), *(void **)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 64), *(void **)(a1 + 96), *(void **)(a1 + 112));
    goto LABEL_23;
  }
  unint64_t v16 = v15;
  v17 = [NSNumber numberWithUnsignedInteger:0];
  uint64_t v18 = [v13 objectForKeyedSubscript:v17];

  if (!v18)
  {
LABEL_17:

    goto LABEL_23;
  }
  uint64_t v19 = 1;
  while (v16 != v19)
  {
    id v20 = [NSNumber numberWithUnsignedInteger:v19];
    id v21 = [v13 objectForKeyedSubscript:v20];

    ++v19;
    if (!v21)
    {
      unint64_t v22 = v19 - 1;
      goto LABEL_19;
    }
  }
  unint64_t v22 = v16;
LABEL_19:

  if (v22 >= v16) {
    goto LABEL_20;
  }
LABEL_23:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

- (void)_returnHighestPriorityLinkItemWithItemIdentifiersToFetch:(void *)a3 fetchedItems:(void *)a4 fetchedErrors:(void *)a5 metric:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    if ([v11 count])
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      char v24 = 0;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke;
      v16[3] = &unk_264249C18;
      id v17 = v12;
      id v18 = v14;
      id v21 = v15;
      unint64_t v22 = v23;
      id v19 = v11;
      id v20 = v13;
      [v19 enumerateObjectsUsingBlock:v16];

      _Block_object_dispose(v23, 8);
    }
    else
    {
      [v14 setSuccessfulChop:-1];
      (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
    }
  }
}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(a1 + 80) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    uint64_t v3 = ABSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metric"
           ":completion:]_block_invoke";
      _os_log_impl(&dword_2154F4000, v3, OS_LOG_TYPE_DEFAULT, "%s - All remote queries have finished, return", (uint8_t *)&v4, 0xCu);
    }

    -[BCSQueryChopper _returnHighestPriorityLinkItemWithItemIdentifiersToFetch:fetchedItems:fetchedErrors:metric:completion:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72));
  }
}

- (void)queryChopperDelegate:(id)a3 isBusinessRegisteredForURL:(id)a4 isBloomFilterCached:(BOOL)a5 forClientBundleID:(id)a6 metric:(id)a7 completion:(id)a8
{
  BOOL v11 = a5;
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v41 = a4;
  id v39 = a6;
  id v40 = a7;
  id v14 = a8;
  id v15 = ABSLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCache"
                                    "d:forClientBundleID:metric:completion:]";
    _os_log_impl(&dword_2154F4000, v15, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (!v14) {
    goto LABEL_27;
  }
  id v42 = -[BCSQueryChopper _chopItemIdentifiersToFetchFromURL:isBloomFilterCached:]((uint64_t)self, v41, v11);
  if (![v42 count])
  {
    uint64_t v36 = ABSLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCac"
                                      "hed:forClientBundleID:metric:completion:]";
      _os_log_impl(&dword_2154F4000, v36, OS_LOG_TYPE_DEFAULT, "%s No items to check, bailing...", (uint8_t *)&buf, 0xCu);
    }

    [v40 setSuccessfulChop:-1];
    (*((void (**)(id, void, void, void))v14 + 2))(v14, 0, 0, 0);
    goto LABEL_26;
  }
  dispatch_group_t v37 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__4;
  v86 = __Block_byref_object_dispose__4;
  id v87 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  char v79 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__4;
  v75 = __Block_byref_object_dispose__4;
  id v76 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__4;
  v69 = __Block_byref_object_dispose__4;
  id v70 = 0;
  if (!MEMORY[0x2166BD6C0]("-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric:completion:]"))goto LABEL_20; {
  uint64_t v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  }
  id v17 = (void *)v72[5];
  v72[5] = v16;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v18 = v42;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v82 count:16];
  if (!v19) {
    goto LABEL_19;
  }
  uint64_t v20 = *(void *)v62;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v62 != v20) {
        objc_enumerationMutation(v18);
      }
      uint64_t v22 = *(void *)(*((void *)&v61 + 1) + 8 * v21);
      uint64_t v23 = (void *)v72[5];
      if (v22)
      {
        id v24 = *(id *)(v22 + 8);
        id v25 = v24;
        if (v24)
        {
          uint64_t v26 = (void *)*((void *)v24 + 2);
          goto LABEL_14;
        }
      }
      else
      {
        id v25 = 0;
      }
      uint64_t v26 = 0;
LABEL_14:
      id v27 = v26;
      id v28 = [v27 absoluteString];
      [v23 addObject:v28];

      ++v21;
    }
    while (v19 != v21);
    uint64_t v29 = [v18 countByEnumeratingWithState:&v61 objects:v82 count:16];
    uint64_t v19 = v29;
  }
  while (v29);
LABEL_19:

  uint64_t v30 = v72[5];
  v80 = @"BCSBusinessQueryServiceChoppedURLs";
  uint64_t v81 = v30;
  uint64_t v31 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
  v32 = (void *)v66[5];
  v66[5] = v31;

LABEL_20:
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke;
  v49[3] = &unk_264249B78;
  __int16 v33 = v37;
  id v50 = v33;
  id v51 = v39;
  id v52 = v38;
  id v53 = self;
  v56 = v77;
  v57 = v78;
  id v34 = v40;
  id v54 = v34;
  uint64_t v58 = &v71;
  id v35 = v14;
  id v55 = v35;
  char v59 = &v65;
  p_long long buf = &buf;
  [v42 enumerateObjectsUsingBlock:v49];
  if (self) {
    self = (BCSQueryChopper *)self->_serialDispatchQueue;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2_17;
  block[3] = &unk_264249BA0;
  dispatch_group_t v46 = v78;
  id v44 = v34;
  id v45 = v35;
  uint64_t v47 = &v65;
  id v48 = &buf;
  dispatch_group_notify(v33, &self->super, block);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(&buf, 8);

LABEL_26:
LABEL_27:
}

void __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v6 = [BCSQuery alloc];
  if (v5) {
    uint64_t v7 = v5[1];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [(BCSQuery *)v6 initWithItemIdentifier:v7 clientBundleId:*(void *)(a1 + 40) shardType:2];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2;
  v12[3] = &unk_264249B50;
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = *(void **)(a1 + 64);
  v12[4] = *(void *)(a1 + 56);
  long long v17 = *(_OWORD *)(a1 + 80);
  id v13 = v10;
  id v14 = v5;
  uint64_t v18 = *(void *)(a1 + 96);
  uint64_t v20 = a3;
  id v16 = *(id *)(a1 + 72);
  long long v19 = *(_OWORD *)(a1 + 104);
  id v15 = *(id *)(a1 + 32);
  BOOL v11 = v5;
  [v9 fetchIsBusinessRegisteredWithQuery:v8 completion:v12];
}

void __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [a2 hasBusiness];
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromBOOL();
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)long long buf = 136315906;
    id v27 = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric"
          ":completion:]_block_invoke_2";
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - chop attempt isBusinessRegistered: %{public}@ - attemptCount:%ld - error:%@", buf, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    BOOL v11 = *(NSObject **)(v10 + 8);
  }
  else {
    BOOL v11 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_11;
  block[3] = &unk_264249B28;
  char v25 = v6;
  uint64_t v21 = *(void *)(a1 + 80);
  id v16 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 88);
  id v17 = v12;
  uint64_t v22 = v13;
  uint64_t v24 = *(void *)(a1 + 112);
  id v20 = *(id *)(a1 + 64);
  id v18 = v5;
  long long v23 = *(_OWORD *)(a1 + 96);
  id v19 = *(id *)(a1 + 56);
  id v14 = v5;
  dispatch_async(v11, block);
}

void __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_11(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 112))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 16);
    }
    else {
      uint64_t v3 = 0;
    }
    [*(id *)(a1 + 32) setSuccessfulChop:v3];
    if (MEMORY[0x2166BD6C0]("-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric:completion:]_block_invoke"))
    {
      int v4 = NSString;
      id v5 = *(void **)(a1 + 40);
      if (v5)
      {
        id v5 = (void *)v5[1];
        if (v5) {
          id v5 = (void *)v5[2];
        }
      }
      char v6 = v5;
      uint64_t v7 = [v6 absoluteString];
      id v8 = [v4 stringWithFormat:@"%@ (REGISTERED)", v7];

      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) replaceObjectAtIndex:*(void *)(a1 + 104) withObject:v8];
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v9();
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 48);
    if (v10) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v10);
    }
    BOOL v11 = *(NSObject **)(a1 + 56);
    dispatch_group_leave(v11);
  }
}

uint64_t __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2_17(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    uint64_t v3 = ABSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metri"
           "c:completion:]_block_invoke_2";
      _os_log_impl(&dword_2154F4000, v3, OS_LOG_TYPE_DEFAULT, "%s - All queries have finished, return", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(v2 + 32) setSuccessfulChop:-1];
    return (*(uint64_t (**)(void))(*(void *)(v2 + 40) + 16))();
  }
  return result;
}

void __68__BCSQueryChopper__indexOfItemIdentifierInfo_inItemIdentifierInfos___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = a2;
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[1];
  }
  id v12 = v7;
  if (v7) {
    uint64_t v9 = v7[1];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v8;
  int v11 = [v10 matchesItemIdentifying:v9];

  if (v11)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke_2;
  v12[3] = &unk_264249BF0;
  id v13 = v7;
  id v8 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = a4;
  uint64_t v21 = a3;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v11 = v7;
  [v8 enumerateObjectsUsingBlock:v12];
}

void __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v20 = a2;
  id v7 = [MEMORY[0x263EFF9D0] null];

  if (v7 != v20)
  {
    id v8 = [v20 linkURL];
    id v9 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v8);

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 8);
    }
    else {
      id v11 = 0;
    }
    if ([v11 matchesItemIdentifying:v9])
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        uint64_t v13 = *(void *)(v12 + 16);
      }
      else {
        uint64_t v13 = 0;
      }
      [*(id *)(a1 + 40) setSuccessfulChop:v13];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      id v14 = *(unsigned char **)(a1 + 88);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      *a4 = 1;
      *id v14 = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t v15 = *(void *)(a1 + 96);
    if (v15 == [*(id *)(a1 + 48) count] - 1 && objc_msgSend(*(id *)(a1 + 56), "count") - 1 == a3)
    {
      id v16 = [*(id *)(a1 + 64) objectAtIndex:a3];
      [*(id *)(a1 + 40) setSuccessfulChop:-1];
      uint64_t v17 = *(void *)(a1 + 72);
      id v18 = [MEMORY[0x263EFF9D0] null];
      if (v16 == v18) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v16;
      }
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v19);

      *a4 = 1;
      **(unsigned char **)(a1 + 88) = 1;
    }
  }
}

void __61__BCSQueryChopper__removeLinkItemDuplicatesInOrderFromArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v13 = v3;
  if (v3)
  {
    id v5 = (id *)v3[1];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = (void *)[v5[1] copy];
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = 0;
LABEL_4:
  id v8 = [v4 objectForKeyedSubscript:v7];

  if (!v8) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
  }
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v13)
  {
    uint64_t v10 = (id *)v13[1];
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = (void *)[v10[1] copy];
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = 0;
LABEL_9:
  [v9 setObject:MEMORY[0x263EFFA88] forKey:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricFactory, 0);

  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
}

@end