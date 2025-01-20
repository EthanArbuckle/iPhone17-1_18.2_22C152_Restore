@interface WFExtensionEnumerator
- (NSSet)supportedApplicationRecords;
- (NSString)extensionPointIdentifier;
- (WFExtensionEnumerator)initWithExtensionPointIdentifier:(id)a3;
- (void)dealloc;
- (void)enumerateExtensions;
@end

@implementation WFExtensionEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedApplicationRecords, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (NSSet)supportedApplicationRecords
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__56097;
  v10 = __Block_byref_object_dispose__56098;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__WFExtensionEnumerator_supportedApplicationRecords__block_invoke;
  v5[3] = &unk_264E5EEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __52__WFExtensionEnumerator_supportedApplicationRecords__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[4];
  if (!v3)
  {
    [v2 enumerateExtensions];
    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

- (void)enumerateExtensions
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x263F018B0]);
  v5 = [(WFExtensionEnumerator *)self extensionPointIdentifier];
  id v44 = 0;
  uint64_t v6 = (void *)[v4 initWithIdentifier:v5 platform:dyld_get_active_platform() error:&v44];
  id v7 = v44;

  if (v6)
  {
    v35 = self;
    v36 = v3;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = [MEMORY[0x263F01858] enumeratorWithExtensionPointRecord:v6 options:0];
    uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (!v8) {
      goto LABEL_36;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x23ECE6170]();
        v14 = [v12 containingBundleRecord];
        if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v14 = getWFActionsLogObject();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
            goto LABEL_19;
          }
          v20 = [v12 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          v47 = "-[WFExtensionEnumerator enumerateExtensions]";
          __int16 v48 = 2114;
          v49 = v20;
          v21 = v14;
          v22 = "%s Extension record with bundle identifier %{public}@ is not contained in an app bundle (containingBundl"
                "eRecord == nil), skipping";
          uint32_t v23 = 22;
LABEL_17:
          _os_log_impl(&dword_23C364000, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
          goto LABEL_18;
        }
        v15 = [v14 bundleIdentifier];

        if (!v15)
        {
          v20 = getWFActionsLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v21 = v20;
            v22 = "%s App record does not have bundle identifier, skipping";
LABEL_27:
            uint32_t v23 = 12;
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_19;
        }
        if (([v14 wf_isAvailableInContext:0] & 1) == 0)
        {
          v20 = getWFActionsLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v24 = [v14 bundleIdentifier];
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            __int16 v48 = 2114;
            v49 = v24;
            _os_log_impl(&dword_23C364000, v20, OS_LOG_TYPE_INFO, "%s App record with bundle identifier %{public}@ is not user-facing, skipping", buf, 0x16u);
          }
          goto LABEL_18;
        }
        v16 = [v12 bundleIdentifier];

        if (!v16)
        {
          v20 = getWFActionsLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            v21 = v20;
            v22 = "%s Extension record does not have bundle identifier, skipping";
            goto LABEL_27;
          }
          goto LABEL_18;
        }
        v17 = (void *)MEMORY[0x263F08800];
        v18 = [v12 bundleIdentifier];
        id v39 = v7;
        v19 = [v17 extensionWithIdentifier:v18 error:&v39];
        id v37 = v39;

        if (!v19)
        {
          v25 = getWFActionsLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = [v12 bundleIdentifier];
            *(_DWORD *)buf = 136315650;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            __int16 v48 = 2114;
            v49 = v26;
            __int16 v50 = 2114;
            id v51 = v37;
            v27 = v25;
            os_log_type_t v28 = OS_LOG_TYPE_ERROR;
            v29 = "%s Failed to create NSExtension for extension record with bundle identifier %{public}@: %{public}@";
            uint32_t v30 = 32;
            goto LABEL_32;
          }
LABEL_33:

          goto LABEL_34;
        }
        if (([v19 optedIn] & 1) == 0)
        {
          v25 = getWFActionsLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = [v12 bundleIdentifier];
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFExtensionEnumerator enumerateExtensions]";
            __int16 v48 = 2114;
            v49 = v26;
            v27 = v25;
            os_log_type_t v28 = OS_LOG_TYPE_INFO;
            v29 = "%s Extension with bundle identifier %{public}@ not opted in by the user, skipping";
            uint32_t v30 = 22;
LABEL_32:
            _os_log_impl(&dword_23C364000, v27, v28, v29, buf, v30);
          }
          goto LABEL_33;
        }
        [v36 addObject:v14];
LABEL_34:

        id v7 = v37;
LABEL_19:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      uint64_t v9 = v31;
      if (!v31)
      {
LABEL_36:

        id v3 = v36;
        uint64_t v32 = [v36 copy];
        p_super = &v35->_supportedApplicationRecords->super;
        v35->_supportedApplicationRecords = (NSSet *)v32;
        goto LABEL_39;
      }
    }
  }
  p_super = getWFActionsLogObject();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    v34 = [(WFExtensionEnumerator *)self extensionPointIdentifier];
    *(_DWORD *)buf = 136315650;
    v47 = "-[WFExtensionEnumerator enumerateExtensions]";
    __int16 v48 = 2114;
    v49 = v34;
    __int16 v50 = 2114;
    id v51 = v7;
    _os_log_impl(&dword_23C364000, p_super, OS_LOG_TYPE_ERROR, "%s Failed to create extension point record for %{public}@: %{public}@", buf, 0x20u);
  }
LABEL_39:
}

- (void)dealloc
{
  notify_cancel(self->_pkToken);
  notify_cancel(self->_lsToken);
  v3.receiver = self;
  v3.super_class = (Class)WFExtensionEnumerator;
  [(WFExtensionEnumerator *)&v3 dealloc];
}

- (WFExtensionEnumerator)initWithExtensionPointIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFExtensionEnumerator.m", 32, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFExtensionEnumerator;
  id v6 = [(WFExtensionEnumerator *)&v20 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    uint64_t v8 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.shortcuts.WFExtensionEnumerator.queue", 0);
    uint64_t v10 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.shortcuts.WFExtensionEnumerator.notificationQueue", 0);
    v12 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v11;

    objc_initWeak(&location, v6);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke;
    aBlock[3] = &unk_264E5EE98;
    objc_copyWeak(&v18, &location);
    v13 = _Block_copy(aBlock);
    notify_register_dispatch((const char *)[(id)*MEMORY[0x263F017F8] UTF8String], (int *)v6 + 6, *((dispatch_queue_t *)v6 + 1), v13);
    notify_register_dispatch("com.apple.pluginkit.annotation-change", (int *)v6 + 7, *((dispatch_queue_t *)v6 + 1), v13);
    id v14 = v6;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (WFExtensionEnumerator *)v6;
}

void __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained[4];
  WeakRetained[4] = 0;

  objc_super v3 = WeakRetained[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke_2;
  block[3] = &unk_264E5EE70;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_async(v3, block);
}

void __58__WFExtensionEnumerator_initWithExtensionPointIdentifier___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFExtensionEnumeratorSupportedExtensionsChanged" object:*(void *)(a1 + 32)];
}

@end