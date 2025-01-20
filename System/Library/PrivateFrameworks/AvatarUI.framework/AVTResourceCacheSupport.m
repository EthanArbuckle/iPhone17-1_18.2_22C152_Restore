@interface AVTResourceCacheSupport
+ (id)resourceFromCache:(id)a3 forItem:(id)a4 scope:(id)a5 preflightCacheMissHandler:(id)a6 cacheMissHandler:(id)a7 cacheMissQueue:(id)a8 taskScheduler:(id)a9 callbackQueue:(id)a10 resourceHandler:(id)a11;
+ (id)resourceFromCache:(id)a3 forItem:(id)a4 scope:(id)a5 preflightCacheMissHandler:(id)a6 cacheMissWithCompletionHandler:(id)a7 cacheMissQueue:(id)a8 taskScheduler:(id)a9 callbackQueue:(id)a10 resourceHandler:(id)a11;
@end

@implementation AVTResourceCacheSupport

void __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resourceForItem:*(void *)(a1 + 40) scope:*(void *)(a1 + 48) cacheMissHandler:*(void *)(a1 + 64)];
  v3 = *(NSObject **)(a1 + 56);
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2;
    v4[3] = &unk_263FF02C8;
    id v6 = *(id *)(a1 + 72);
    id v5 = v2;
    dispatch_async(v3, v4);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

+ (id)resourceFromCache:(id)a3 forItem:(id)a4 scope:(id)a5 preflightCacheMissHandler:(id)a6 cacheMissHandler:(id)a7 cacheMissQueue:(id)a8 taskScheduler:(id)a9 callbackQueue:(id)a10 resourceHandler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v37 = (void (**)(id, id, id))a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v23 = (void (**)(id, void *))a11;
  v24 = [v16 resourceForItem:v17 scope:v18];
  if (v24)
  {
    v23[2](v23, v24);
    v25 = 0;
  }
  else
  {
    v36 = v21;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke;
    v41[3] = &unk_263FF3010;
    id v42 = v16;
    id v26 = v17;
    id v43 = v26;
    id v27 = v18;
    id v44 = v27;
    id v35 = v19;
    id v46 = v19;
    id v34 = v22;
    id v45 = v22;
    v28 = v23;
    v47 = v28;
    uint64_t v29 = MEMORY[0x210530210](v41);
    v30 = (void *)v29;
    if (v20)
    {
      if (v37)
      {
        v31 = v37[2](v37, v26, v27);
        if (v31) {
          v28[2](v28, v31);
        }
      }
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3;
      v38[3] = &unk_263FF3060;
      id v39 = v20;
      id v40 = v30;
      v32 = (void *)[v38 copy];
      [v36 scheduleTask:v32];
      v25 = (void *)MEMORY[0x210530210](v32);
    }
    else
    {
      (*(void (**)(uint64_t))(v29 + 16))(v29);
      v25 = 0;
    }

    id v19 = v35;
    id v21 = v36;
    id v22 = v34;
  }

  return v25;
}

uint64_t __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4;
  v6[3] = &unk_263FF3038;
  v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

+ (id)resourceFromCache:(id)a3 forItem:(id)a4 scope:(id)a5 preflightCacheMissHandler:(id)a6 cacheMissWithCompletionHandler:(id)a7 cacheMissQueue:(id)a8 taskScheduler:(id)a9 callbackQueue:(id)a10 resourceHandler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = (void (**)(void, id, id))a6;
  id v20 = a7;
  id v21 = a8;
  id v41 = a9;
  id v22 = v16;
  id v23 = a10;
  v24 = (void (**)(id, void *))a11;
  v25 = [v16 resourceForItem:v17 scope:v18];
  id v42 = v23;
  if (v25)
  {
    v24[2](v24, v25);
    id v26 = 0;
    id v27 = v41;
  }
  else
  {
    id v40 = v19;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke;
    v46[3] = &unk_263FF30D8;
    id v39 = v20;
    id v52 = v20;
    v28 = v21;
    id v29 = v17;
    id v47 = v29;
    id v30 = v18;
    id v48 = v30;
    v37 = v22;
    id v49 = v22;
    id v50 = v23;
    v31 = v24;
    v53 = v31;
    v38 = v28;
    id v26 = v28;
    id v51 = v26;
    uint64_t v32 = MEMORY[0x210530210](v46);
    v33 = (void *)v32;
    if (v26)
    {
      if (v40)
      {
        id v34 = v40[2](v40, v29, v30);
        if (v34) {
          v31[2](v31, v34);
        }
      }
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_7;
      v43[3] = &unk_263FF3060;
      id v44 = v26;
      id v45 = v33;
      id v35 = (void *)[v43 copy];
      id v27 = v41;
      [v41 scheduleTask:v35];
      id v26 = (id)MEMORY[0x210530210](v35);
    }
    else
    {
      (*(void (**)(uint64_t))(v32 + 16))(v32);
      id v27 = v41;
    }

    id v20 = v39;
    id v19 = v40;
    id v22 = v37;
    id v21 = v38;
  }

  return v26;
}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2;
  v5[3] = &unk_263FF30B0;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v5);
}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3;
  v10[3] = &unk_263FF27A0;
  id v4 = v3;
  id v11 = v4;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 72);
  id v5 = (void (**)(void))MEMORY[0x210530210](v10);
  id v6 = v5;
  id v7 = *(NSObject **)(a1 + 64);
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_6;
    block[3] = &unk_263FF0A00;
    id v9 = v5;
    dispatch_async(v7, block);
  }
  else
  {
    v5[2](v5);
  }
}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3(uint64_t a1)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4;
  v8[3] = &unk_263FF3088;
  id v9 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x210530210](v8);
  id v3 = (id)[*(id *)(a1 + 40) resourceForItem:*(void *)(a1 + 48) scope:*(void *)(a1 + 56) cacheMissHandler:v2];
  id v4 = *(NSObject **)(a1 + 64);
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_5;
    block[3] = &unk_263FF02C8;
    id v7 = *(id *)(a1 + 72);
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

id __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_8;
  v6[3] = &unk_263FF3038;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

@end