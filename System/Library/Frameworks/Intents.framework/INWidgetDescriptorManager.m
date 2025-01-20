@interface INWidgetDescriptorManager
+ (id)sharedManager;
- (INWidgetDescriptorManager)init;
- (NSSet)widgetDescriptors;
- (void)_notifyCompletionHandlersWithWidgetDescriptors:(id)a3;
- (void)_startObservingDescriptors;
- (void)dealloc;
- (void)descriptorsDidChangeForDescriptorProvider:(id)a3;
- (void)getDescriptorForIntent:(id)a3 completionHandler:(id)a4;
- (void)getDescriptorsWithCompletionHandler:(id)a3;
- (void)setWidgetDescriptors:(id)a3;
@end

@implementation INWidgetDescriptorManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDescriptors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)setWidgetDescriptors:(id)a3
{
}

- (NSSet)widgetDescriptors
{
  return self->_widgetDescriptors;
}

- (void)_notifyCompletionHandlersWithWidgetDescriptors:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__INWidgetDescriptorManager__notifyCompletionHandlersWithWidgetDescriptors___block_invoke;
  v7[3] = &unk_1E551F790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __76__INWidgetDescriptorManager__notifyCompletionHandlersWithWidgetDescriptors___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) cancel];
  v2 = *(unsigned char **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "setWidgetDescriptors:");
  }
  else {
    v2[16] = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = objc_msgSend(*(id *)(a1 + 32), "widgetDescriptors", (void)v11);
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

- (void)_startObservingDescriptors
{
  self->_observing = 1;
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer) {
    [(INWatchdogTimer *)watchdogTimer cancel];
  }
  uint64_t v4 = [INWatchdogTimer alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__INWidgetDescriptorManager__startObservingDescriptors__block_invoke;
  v14[3] = &unk_1E55208F8;
  v14[4] = self;
  uint64_t v5 = [(INWatchdogTimer *)v4 initWithTimeoutInterval:v14 timeoutHandler:10.0];
  uint64_t v6 = self->_watchdogTimer;
  self->_watchdogTimer = v5;

  [(INWatchdogTimer *)self->_watchdogTimer start];
  provider = self->_provider;
  if (provider) {
    [(CHSWidgetDescriptorProvider *)provider removeObserver:self];
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v8 = (void *)getCHSWidgetDescriptorProviderClass_softClass;
  uint64_t v19 = getCHSWidgetDescriptorProviderClass_softClass;
  if (!getCHSWidgetDescriptorProviderClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getCHSWidgetDescriptorProviderClass_block_invoke;
    v15[3] = &unk_1E5520EB8;
    v15[4] = &v16;
    __getCHSWidgetDescriptorProviderClass_block_invoke((uint64_t)v15);
    uint64_t v8 = (void *)v17[3];
  }
  v9 = v8;
  _Block_object_dispose(&v16, 8);
  v10 = (CHSWidgetDescriptorProvider *)objc_alloc_init(v9);
  long long v11 = self->_provider;
  self->_provider = v10;

  [(CHSWidgetDescriptorProvider *)self->_provider addObserver:self];
  long long v12 = [(CHSWidgetDescriptorProvider *)self->_provider descriptors];
  uint64_t v13 = [v12 count];

  if (v13) {
    [(INWidgetDescriptorManager *)self descriptorsDidChangeForDescriptorProvider:self->_provider];
  }
}

uint64_t __55__INWidgetDescriptorManager__startObservingDescriptors__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _notifyCompletionHandlersWithWidgetDescriptors:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return result;
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 descriptors];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v23 = self;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v4;
    uint64_t v8 = [v4 descriptors];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v13, "supportedSizeClasses", v23) & 8) != 0)
          {
            uint64_t v14 = 3;
          }
          else if (([v13 supportedSizeClasses] & 4) != 0)
          {
            uint64_t v14 = 2;
          }
          else
          {
            uint64_t v14 = 1;
          }
          v15 = [v13 intentType];

          if (v15)
          {
            uint64_t v16 = [v13 intentType];
            v17 = [v16 componentsSeparatedByString:@"."];
            uint64_t v18 = [v17 lastObject];

            uint64_t v19 = [INWidgetDescriptor alloc];
            v20 = [v13 extensionBundleIdentifier];
            v21 = [v13 kind];
            v22 = [(INWidgetDescriptor *)v19 initWithExtensionBundleIdentifier:v20 kind:v21 intentClassName:v18 preferredSizeClass:v14];
            [v7 addObject:v22];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    [(INWidgetDescriptorManager *)v23 _notifyCompletionHandlersWithWidgetDescriptors:v7];
    id v4 = v24;
  }
  else
  {
    [(INWidgetDescriptorManager *)self _notifyCompletionHandlersWithWidgetDescriptors:0];
  }
}

- (void)dealloc
{
  [(CHSWidgetDescriptorProvider *)self->_provider removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)INWidgetDescriptorManager;
  [(INWidgetDescriptorManager *)&v3 dealloc];
}

- (INWidgetDescriptorManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)INWidgetDescriptorManager;
  v2 = [(INWidgetDescriptorManager *)&v11 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("INWidgetDescriptorManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    widgetDescriptors = v2->_widgetDescriptors;
    v2->_widgetDescriptors = (NSSet *)v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v8;
  }
  return v2;
}

- (void)getDescriptorForIntent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__INWidgetDescriptorManager_getDescriptorForIntent_completionHandler___block_invoke;
  v10[3] = &unk_1E551F768;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(INWidgetDescriptorManager *)self getDescriptorsWithCompletionHandler:v10];
}

void __70__INWidgetDescriptorManager_getDescriptorForIntent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "supportsIntent:", *(void *)(a1 + 32), (void)v8))
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

- (void)getDescriptorsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__INWidgetDescriptorManager_getDescriptorsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E551F740;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

unsigned char *__65__INWidgetDescriptorManager_getDescriptorsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) widgetDescriptors];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) widgetDescriptors];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v5 = (void *)MEMORY[0x192F984C0](*(void *)(a1 + 40));
    [v6 addObject:v5];
  }

  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[16])
  {
    return (unsigned char *)[result _startObservingDescriptors];
  }
  return result;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_123553 != -1) {
    dispatch_once(&sharedManager_onceToken_123553, &__block_literal_global_123554);
  }
  v2 = (void *)sharedManager_sharedManager_123555;

  return v2;
}

uint64_t __42__INWidgetDescriptorManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(INWidgetDescriptorManager);
  uint64_t v1 = sharedManager_sharedManager_123555;
  sharedManager_sharedManager_123555 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end