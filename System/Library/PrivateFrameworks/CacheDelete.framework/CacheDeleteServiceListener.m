@interface CacheDeleteServiceListener
+ (id)cacheDeleteServiceListener:(id)a3 options:(id)a4;
- (BOOL)anonymous;
- (BOOL)legacyCallbacks;
- (CacheDeleteServiceInfo)serviceInfo;
- (CacheDeleteServiceListener)initWithName:(id)a3 options:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (id)callback;
- (id)cancel;
- (id)notify;
- (id)periodic;
- (id)purge;
- (id)purgeable;
- (void)serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)serviceCancelPurge:(id)a3;
- (void)serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePing:(id)a3;
- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)setCallback:(id)a3;
- (void)setCancel:(id)a3;
- (void)setNotify:(id)a3;
- (void)setNotifyCallback:(id)a3;
- (void)setPeriodic:(id)a3;
- (void)setPurge:(id)a3;
- (void)setPurgeable:(id)a3;
- (void)setPurgeable:(id)a3 purge:(id)a4 cancel:(id)a5 periodic:(id)a6 notify:(id)a7 callback:(id)a8 entitlements:(id)a9;
- (void)setQueue:(id)a3;
@end

@implementation CacheDeleteServiceListener

- (void)servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[v8 mutableCopy];
  v11 = [v10 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v12 = +[CacheDeleteVolume validateVolumeAtPath:v11];

  if (!v12) {
    goto LABEL_8;
  }
  [v10 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v13 = [v8 objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"];
  int v14 = evaluateBoolProperty(v13);

  dispatch_qos_class_t v15 = v14 ? QOS_CLASS_UTILITY : QOS_CLASS_BACKGROUND;
  if (![(CacheDeleteServiceListener *)self legacyCallbacks]
    || (getRootVolume(),
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v12 isEqualToString:v16],
        v16,
        (v17 & 1) != 0))
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __63__CacheDeleteServiceListener_servicePurgeable_info_replyBlock___block_invoke;
    v23 = &unk_1E5C51C18;
    v24 = self;
    id v25 = v10;
    int v27 = a3;
    id v26 = v9;
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, &v20);
    v19 = [(CacheDeleteServiceListener *)self queue];
    dispatch_async(v19, v18);
  }
  else
  {
LABEL_8:
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)legacyCallbacks
{
  return self->_legacyCallbacks;
}

- (void)setPurgeable:(id)a3 purge:(id)a4 cancel:(id)a5 periodic:(id)a6 notify:(id)a7 callback:(id)a8 entitlements:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = [(CacheDeleteServiceListener *)self queue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __94__CacheDeleteServiceListener_setPurgeable_purge_cancel_periodic_notify_callback_entitlements___block_invoke;
  v30[3] = &unk_1E5C51BF0;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  v30[4] = self;
  id v31 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_sync(v22, v30);
}

+ (id)cacheDeleteServiceListener:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    v7 = [[CacheDeleteServiceListener alloc] initWithName:v6 options:v5];

    id v8 = (void *)cacheDeleteServiceListener_options__listener;
    cacheDeleteServiceListener_options__listener = (uint64_t)v7;
  }
  id v9 = (void *)cacheDeleteServiceListener_options__listener;
  return v9;
}

- (CacheDeleteServiceListener)initWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_LEGACY_CALLBACK"];
  id v9 = [v7 objectForKeyedSubscript:@"ANON"];
  v10 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_SERVICE_INFO"];

  serviceInfo = self->_serviceInfo;
  self->_serviceInfo = v10;

  if (self->_serviceInfo)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [(CacheDeleteServiceInfo *)self->_serviceInfo extensionContext];

      if (v12)
      {
        v13 = [(CacheDeleteServiceInfo *)self->_serviceInfo extensionContext];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

LABEL_16:
        id v16 = 0;
        goto LABEL_17;
      }
    }
  }
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_anonymous = [v9 BOOLValue];
    }
  }
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_legacyCallbacks = [v8 BOOLValue];
    }
  }
  if (!self->_anonymous)
  {
    char isKindOfClass = 0;
    goto LABEL_16;
  }
  id v15 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_DEFAULT, "USING ANON Listener", buf, 2u);
  }

  id v16 = [MEMORY[0x1E4F29290] anonymousListener];
  char isKindOfClass = 0;
LABEL_17:
  v28.receiver = self;
  v28.super_class = (Class)CacheDeleteServiceListener;
  id v17 = [(CacheDeleteListener *)&v28 initWithName:v6 listener:v16 protocol:&unk_1EFB32F28 exportedObj:self isExtension:isKindOfClass & 1];
  id v18 = v17;
  if (v17)
  {
    id v19 = "";
    if (v17->_anonymous)
    {
      uint64_t v20 = [v16 endpoint];
      endpoint = v18->_endpoint;
      v18->_endpoint = (NSXPCListenerEndpoint *)v20;

      if (v18->_anonymous) {
        id v19 = "_ANON";
      }
    }
    v22 = [NSString stringWithFormat:@"cache_delete.listener.%@%s", v6, v19];
    id v23 = (const char *)[v22 UTF8String];
    id v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
    [(CacheDeleteServiceListener *)v18 setQueue:v25];

    id v26 = v18;
  }
  else
  {
    v22 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_ERROR, "super initWithName failed.", buf, 2u);
    }
  }

  return v18;
}

- (void)setQueue:(id)a3
{
}

uint64_t __94__CacheDeleteServiceListener_setPurgeable_purge_cancel_periodic_notify_callback_entitlements___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requiredEntitlements];
  [v2 removeAllObjects];

  [*(id *)(a1 + 32) setPurgeable:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setPurge:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setCancel:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setPeriodic:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) setNotify:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setCallback:*(void *)(a1 + 88)];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 addRequiredEntitlement:v4];
}

- (void)setPurgeable:(id)a3
{
}

- (void)setPurge:(id)a3
{
}

- (void)setPeriodic:(id)a3
{
}

- (void)setNotify:(id)a3
{
}

- (void)setCancel:(id)a3
{
}

- (void)setCallback:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 72, 1);
}

void __63__CacheDeleteServiceListener_servicePurgeable_info_replyBlock___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) purgeable];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 32) purgeable];
    uint64_t v4 = (void *)(*((uint64_t (**)(id, void, void))v14 + 2))(v14, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) callback];

    if (v5)
    {
      id v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

      id v16 = @"CACHE_DELETE_PURGEABLE_OPERATION";
      uint64_t v17 = *(void *)(a1 + 40);
      id v18 = @"CACHE_DELETE_OPERATIONS";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v19[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

      id v9 = [*(id *)(a1 + 32) callback];
      v10 = (void *)((uint64_t (**)(void, void *))v9)[2](v9, v8);

      uint64_t v11 = *(void *)(a1 + 48);
      v12 = [v10 objectForKeyedSubscript:@"CACHE_DELETE_PURGEABLE_OPERATION"];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
    else
    {
      v13 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_INFO, "purgeable callback is NULL", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (id)purgeable
{
  return self->_purgeable;
}

- (id)callback
{
  return self->_callback;
}

- (void)servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)[a4 mutableCopy];
  v10 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v11 = +[CacheDeleteVolume validateVolumeAtPath:v10];

  v12 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_QOS"];
  v13 = evaluateNumberProperty(v12);

  if (v11
    && (([v9 setObject:v11 forKeyedSubscript:@"CACHE_DELETE_VOLUME"],
         ![(CacheDeleteServiceListener *)self legacyCallbacks])
     || (getRootVolume(),
         id v14 = objc_claimAutoreleasedReturnValue(),
         char v15 = [v11 isEqualToString:v14],
         v14,
         (v15 & 1) != 0)))
  {
    if (v13) {
      dispatch_qos_class_t v16 = [v13 unsignedIntValue];
    }
    else {
      dispatch_qos_class_t v16 = QOS_CLASS_UTILITY;
    }
    uint64_t v17 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      dispatch_qos_class_t v29 = v16;
      _os_log_impl(&dword_1A63D1000, v17, OS_LOG_TYPE_DEFAULT, "servicePurge QOS: %u", buf, 8u);
    }

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __59__CacheDeleteServiceListener_servicePurge_info_replyBlock___block_invoke;
    id v23 = &unk_1E5C51C18;
    id v24 = self;
    id v25 = v9;
    int v27 = a3;
    id v26 = v8;
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, &v20);
    id v19 = [(CacheDeleteServiceListener *)self queue];
    dispatch_async(v19, v18);
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __59__CacheDeleteServiceListener_servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) purge];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 32) purge];
    uint64_t v4 = (void *)(*((uint64_t (**)(id, void, void))v14 + 2))(v14, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) callback];

    if (v5)
    {
      id v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

      dispatch_qos_class_t v16 = @"CACHE_DELETE_PURGE_OPERATION";
      uint64_t v17 = *(void *)(a1 + 40);
      dispatch_block_t v18 = @"CACHE_DELETE_OPERATIONS";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v19[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

      id v9 = [*(id *)(a1 + 32) callback];
      v10 = (void *)((uint64_t (**)(void, void *))v9)[2](v9, v8);

      uint64_t v11 = *(void *)(a1 + 48);
      v12 = [v10 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_OPERATION"];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
    else
    {
      v13 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_INFO, "purge callback is NULL", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)serviceCancelPurge:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEFAULT, "serviceCancelPurge", buf, 2u);
  }

  cancel = (void (**)(void))self->_cancel;
  if (cancel)
  {
    cancel[2]();
  }
  else
  {
    callback = (void (**)(id, void *))self->_callback;
    if (callback)
    {
      callback[2](callback, &unk_1EFB2F198);
    }
    else
    {
      id v8 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_error_impl(&dword_1A63D1000, v8, OS_LOG_TYPE_ERROR, "cancel callback is NULL", v11, 2u);
      }
    }
  }
  v4[2](v4);

  id v9 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_DEFAULT, "serviceCancelPurge end", v10, 2u);
  }
}

- (void)servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  dispatch_qos_class_t v16 = __62__CacheDeleteServiceListener_servicePeriodic_info_replyBlock___block_invoke;
  uint64_t v17 = &unk_1E5C51C18;
  dispatch_block_t v18 = self;
  id v19 = v8;
  int v21 = a3;
  id v20 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v14);
  v13 = [(CacheDeleteServiceListener *)self queue];
  dispatch_async(v13, v12);
}

void __62__CacheDeleteServiceListener_servicePeriodic_info_replyBlock___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) periodic];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 periodic];
    id v5 = (const void *)v4[2](v4, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));

    if (v5) {
      CFRelease(v5);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
  else
  {
    id v7 = [v3 callback];

    if (v7)
    {
      id v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
      id v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
      [v8 setObject:v9 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

      v22 = v8;
      id v23 = @"CACHE_DELETE_OPERATIONS";
      int v21 = @"CACHE_DELETE_PERIODIC_OPERATION";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v24[0] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

      dispatch_block_t v12 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v18[0] = 67109378;
        v18[1] = 229;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_debug_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_DEBUG, "[%d] FRAMEWORK operation: %@", (uint8_t *)v18, 0x12u);
      }

      v13 = [*(id *)(a1 + 32) callback];
      uint64_t v14 = (void *)((uint64_t (**)(void, void *))v13)[2](v13, v11);

      uint64_t v15 = *(void *)(a1 + 48);
      dispatch_qos_class_t v16 = [v14 objectForKeyedSubscript:@"CACHE_DELETE_PERIODIC_OPERATION"];
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
    }
    else
    {
      uint64_t v17 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl(&dword_1A63D1000, v17, OS_LOG_TYPE_INFO, "periodic callback is NULL", (uint8_t *)v18, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)servicePing:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  uint64_t v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "PING", v5, 2u);
  }

  v3[2](v3);
}

- (void)serviceNotify:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v9 = dispatch_queue_attr_make_initially_inactive(v8);
  id v10 = dispatch_queue_create("com.apple.cache_delete_notify", v9);

  id v11 = [(CacheDeleteServiceListener *)self queue];
  dispatch_set_target_queue(v10, v11);

  dispatch_activate(v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CacheDeleteServiceListener_serviceNotify_replyBlock___block_invoke;
  block[3] = &unk_1E5C51C40;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v10, block);
}

uint64_t __55__CacheDeleteServiceListener_serviceNotify_replyBlock___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) notify];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 notify];
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 40));
  }
  else
  {
    id v5 = [v3 callback];

    if (v5)
    {
      id v13 = @"CACHE_DELETE_NOTIFICATION_OPERATION";
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = @"CACHE_DELETE_OPERATIONS";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      v16[0] = v6;
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

      id v7 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 67109378;
        LODWORD(v12[0]) = 263;
        WORD2(v12[0]) = 2112;
        *(void *)((char *)v12 + 6) = v4;
        _os_log_debug_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEBUG, "[%d] FRAMEWORK operation: %@", (uint8_t *)&v11, 0x12u);
      }

      id v8 = [*(id *)(a1 + 32) callback];
      v8[2](v8, v4);
    }
    else
    {
      uint64_t v4 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 138412290;
        v12[0] = v10;
        _os_log_error_impl(&dword_1A63D1000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "notify callback is NULL for %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setNotifyCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(CacheDeleteServiceListener *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CacheDeleteServiceListener_setNotifyCallback___block_invoke;
  v7[3] = &unk_1E5C514F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __48__CacheDeleteServiceListener_setNotifyCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNotify:*(void *)(a1 + 40)];
}

- (void)serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CacheDeleteServiceListener *)self callback];

  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_QOS"];
    uint64_t v10 = evaluateNumberProperty(v9);

    if (v10) {
      dispatch_qos_class_t v11 = [v10 unsignedIntValue];
    }
    else {
      dispatch_qos_class_t v11 = QOS_CLASS_BACKGROUND;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke;
    block[3] = &unk_1E5C51C40;
    id v19 = v7;
    block[4] = self;
    id v18 = v6;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    id v13 = [(CacheDeleteServiceListener *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke_2;
    v15[3] = &unk_1E5C51C68;
    id v16 = v12;
    id v14 = v12;
    dispatch_async(v13, v15);
  }
}

void __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) callback];
  uint64_t v3 = (void *)v4[2](v4, *(void *)(a1 + 40));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t __57__CacheDeleteServiceListener_serviceCallback_replyBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (CacheDeleteServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (id)purge
{
  return self->_purge;
}

- (id)periodic
{
  return self->_periodic;
}

- (id)cancel
{
  return self->_cancel;
}

- (id)notify
{
  return self->_notify;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong(&self->_notify, 0);
  objc_storeStrong(&self->_cancel, 0);
  objc_storeStrong(&self->_periodic, 0);
  objc_storeStrong(&self->_purge, 0);
  objc_storeStrong(&self->_purgeable, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end