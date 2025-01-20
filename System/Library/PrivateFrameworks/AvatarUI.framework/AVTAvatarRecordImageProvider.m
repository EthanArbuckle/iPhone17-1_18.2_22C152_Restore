@interface AVTAvatarRecordImageProvider
- (AVTAvatarRecordImageProvider)init;
- (AVTAvatarRecordImageProvider)initWithBackingProvider:(id)a3;
- (_AVTAvatarRecordImageProvider)backingProvider;
- (id)imageForRecord:(id)a3 scope:(id)a4;
- (id)imageForRecord:(id)a3 scope:(id)a4 usingService:(BOOL)a5;
- (void)imageForRecord:(id)a3 scope:(id)a4 handler:(id)a5;
@end

@implementation AVTAvatarRecordImageProvider

- (_AVTAvatarRecordImageProvider)backingProvider
{
  return self->_backingProvider;
}

- (id)imageForRecord:(id)a3 scope:(id)a4
{
  return [(AVTAvatarRecordImageProvider *)self imageForRecord:a3 scope:a4 usingService:0];
}

id __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke_2;
  v21 = &unk_263FF25C8;
  v6 = *(void **)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = v6;
  id v24 = *(id *)(a1 + 48);
  v7 = (void *)MEMORY[0x210530210](&v18);
  v8 = [*(id *)(a1 + 32) peristentCache];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  if (a3)
  {
    v11 = 0;
  }
  else
  {
    v11 = [*(id *)(a1 + 32) workQueue];
  }
  uint64_t v12 = [*(id *)(a1 + 32) renderingScheduler];
  v13 = (void *)v12;
  if (a3)
  {
    v14 = +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v8, v10, v9, 0, v7, v11, v12, 0, v5, v18, v19, v20, v21, v22, v23);
    v11 = v13;
  }
  else
  {
    v15 = [*(id *)(a1 + 32) callbackQueue];
    v14 = +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v8, v10, v9, 0, v7, v11, v13, v15, v5, v18, v19, v20, v21, v22, v23);
  }
  v16 = (void *)MEMORY[0x210530210](v14);

  return v16;
}

id __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke_2(id *a1)
{
  v2 = [a1[4] logger];
  v3 = [a1[5] identifier];
  [a1[6] size];
  objc_msgSend(v2, "logRenderingRecord:size:", v3);

  id v4 = a1[5];
  id v5 = [a1[4] environment];
  v6 = [v5 editorCoreModel];
  v7 = +[AVTAvatarConfiguration configurationForRecord:v4 coreModel:v6];

  v8 = [a1[4] configurationRenderer];
  uint64_t v9 = [v8 imageForAvatarConfiguration:v7 scope:a1[6]];

  return v9;
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) peristentCache];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [*(id *)(a1 + 32) volatileCache];

    if ([*(id *)(a1 + 32) allowPreFlight])
    {
      v8 = [*(id *)(a1 + 40) puppetName];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2;
      v44[3] = &unk_263FF25C8;
      id v45 = *(id *)(a1 + 48);
      id v46 = *(id *)(a1 + 40);
      id v47 = v8;
      id v9 = v8;
      uint64_t v10 = (void *)MEMORY[0x210530210](v44);
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v6 = (id)v7;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_3;
    v34[3] = &unk_263FF2618;
    objc_copyWeak(&v42, &location);
    id v6 = v6;
    id v35 = v6;
    id v36 = *(id *)(a1 + 56);
    id v37 = *(id *)(a1 + 48);
    id v40 = v5;
    id v41 = v10;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v38 = v11;
    uint64_t v39 = v12;
    v13 = (void *)MEMORY[0x210530210](v34);
    v14 = [*(id *)(a1 + 32) renderingScheduler];
    [v14 scheduleTask:v13];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  else
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2_18;
    v29[3] = &unk_263FF2640;
    v15 = *(void **)(a1 + 40);
    v29[4] = *(void *)(a1 + 32);
    id v30 = v15;
    id v31 = *(id *)(a1 + 48);
    id v32 = *(id *)(a1 + 64);
    char v33 = *(unsigned char *)(a1 + 72);
    v16 = (void *)MEMORY[0x210530210](v29);
    v28 = v10;
    if (!*(unsigned char *)(a1 + 73))
    {
      v17 = objc_alloc_init(AVTPassThroughResourceCache);

      id v6 = v17;
    }
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    char v20 = a3;
    if (a3)
    {
      id v21 = v5;
      uint64_t v22 = 0;
    }
    else
    {
      id v21 = v5;
      uint64_t v22 = [*(id *)(a1 + 32) workQueue];
    }
    id v23 = [*(id *)(a1 + 32) renderingScheduler];
    if (v20)
    {
      id v24 = 0;
    }
    else
    {
      id v24 = [*(id *)(a1 + 32) callbackQueue];
    }
    uint64_t v25 = v19;
    uint64_t v10 = v28;
    v13 = +[AVTResourceCacheSupport resourceFromCache:v6 forItem:v18 scope:v25 preflightCacheMissHandler:v28 cacheMissHandler:v16 cacheMissQueue:v22 taskScheduler:v23 callbackQueue:v24 resourceHandler:v21];
    if (v20)
    {
      uint64_t v22 = v23;
    }
    else
    {
    }
    id v5 = v21;
  }
  v26 = (void *)MEMORY[0x210530210](v13);

  return v26;
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) isEditable]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [v2 adaptedFramingModeForObjectType:v3];
  id v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v9 = *MEMORY[0x263F295D0];
    v10[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x263F29640] thumbnailForAnimojiNamed:*(void *)(a1 + 48) options:v6];

  return v7;
}

void __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v3 = [*(id *)(a1 + 32) resourceForItem:*(void *)(a1 + 40) scope:*(void *)(a1 + 48)];
  if (v3
    || (uint64_t v5 = *(void *)(a1 + 80)) != 0
    && ((*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 40), *(void *)(a1 + 48)),
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_4;
    v13 = &unk_263FF0140;
    id v14 = WeakRetained;
    id v15 = *(id *)(a1 + 56);
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    id v16 = v6;
    uint64_t v17 = v7;
    v8 = (void *)MEMORY[0x210530210](&v10);
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "resourceForItem:scope:cacheMissHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), v8, v10, v11, v12, v13, v14);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) logger];
  v8 = [*(id *)(a1 + 40) description];
  [v7 logGeneratingImageInServiceForRecord:v8];

  uint64_t v9 = [*(id *)(a1 + 32) environment];
  uint64_t v10 = [v9 remoteRenderer];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16;
  id v30 = __Block_byref_object_dispose__16;
  id v31 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_15;
  id v23 = &unk_263FF1188;
  uint64_t v25 = &v26;
  id v14 = v11;
  id v24 = v14;
  [v10 getSnapshotAndCacheForAvatarRecord:v12 scope:v13 withReply:&v20];
  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v14, v15))
  {
    id v16 = objc_msgSend(*(id *)(a1 + 56), "logger", v20, v21, v22, v23);
    uint64_t v17 = [*(id *)(a1 + 40) description];
    [v16 logTimedOutWaitingForSnapshotInService:v17];
  }
  id v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_15(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2_18(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [*(id *)(a1 + 48) size];
  objc_msgSend(v2, "logRenderingRecord:size:", v3);

  id v4 = *(id *)(a1 + 56);
  if (!v4)
  {
    id v4 = [MEMORY[0x263F29730] avatarForRecord:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) avatarRenderer];
  id v6 = [v5 imageForAvatar:v4 scope:*(void *)(a1 + 48) usingService:*(unsigned __int8 *)(a1 + 64)];

  if (!v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) logger];
    [v7 logNilImageReturnedFromAVTAvatarRecordImageProvider];
  }
  return v6;
}

- (AVTAvatarRecordImageProvider)init
{
  uint64_t v3 = +[AVTUIEnvironment defaultEnvironment];
  id v4 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v3];
  id v5 = [(AVTAvatarRecordImageProvider *)self initWithBackingProvider:v4];

  return v5;
}

- (AVTAvatarRecordImageProvider)initWithBackingProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarRecordImageProvider;
  id v6 = [(AVTAvatarRecordImageProvider *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingProvider, a3);
  }

  return v7;
}

- (id)imageForRecord:(id)a3 scope:(id)a4 usingService:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AVTAvatarRecordImageProvider *)self backingProvider];
  dispatch_semaphore_t v11 = [v10 providerForRecord:v8 scope:v9 usingService:v5];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__19;
  uint64_t v20 = __Block_byref_object_dispose__19;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__AVTAvatarRecordImageProvider_imageForRecord_scope_usingService___block_invoke;
  v15[3] = &unk_263FF2DE8;
  v15[4] = &v16;
  id v12 = (id)((uint64_t (**)(void, void *, uint64_t))v11)[2](v11, v15, 1);
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __66__AVTAvatarRecordImageProvider_imageForRecord_scope_usingService___block_invoke(uint64_t a1, void *a2)
{
}

- (void)imageForRecord:(id)a3 scope:(id)a4 handler:(id)a5
{
  id v13 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(AVTAvatarRecordImageProvider *)self backingProvider];
  dispatch_semaphore_t v11 = [v10 providerForRecord:v9 scope:v8];

  id v12 = (id)((uint64_t (**)(void, id, void))v11)[2](v11, v13, 0);
}

- (void).cxx_destruct
{
}

@end