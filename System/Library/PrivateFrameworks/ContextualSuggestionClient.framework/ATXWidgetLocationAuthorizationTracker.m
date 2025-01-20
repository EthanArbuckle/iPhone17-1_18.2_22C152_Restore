@interface ATXWidgetLocationAuthorizationTracker
- (ATXWidgetLocationAuthorizationTracker)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4;
- (BOOL)isContainerAuthorizedForWidgetUpdates;
- (BOOL)widgetWantsLocation;
- (void)isContainerAuthorizedForWidgetUpdates;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)widgetWantsLocation;
@end

@implementation ATXWidgetLocationAuthorizationTracker

- (ATXWidgetLocationAuthorizationTracker)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXWidgetLocationAuthorizationTracker;
  v8 = [(ATXWidgetLocationAuthorizationTracker *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    extensionBundleIdentifier = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    containerBundleIdentifier = v8->_containerBundleIdentifier;
    v8->_containerBundleIdentifier = (NSString *)v11;

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v17;
  }
  return v8;
}

- (BOOL)isContainerAuthorizedForWidgetUpdates
{
  p_containerBundleIdentifier = (uint64_t *)&self->_containerBundleIdentifier;
  if (self->_containerBundleIdentifier)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    dispatch_queue_t v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke;
    block[3] = &unk_26528E4E0;
    block[4] = self;
    block[5] = &v13;
    dispatch_sync(queue, block);
    v5 = (void *)v14[5];
    if (v5)
    {
      char v6 = [v5 BOOLValue];
    }
    else
    {
      if ([MEMORY[0x263F61E38] waitForSemaphore:self->_sem timeoutSeconds:1.0] == 1)
      {
        v8 = __atxlog_handle_default();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(ATXWidgetLocationAuthorizationTracker *)p_containerBundleIdentifier isContainerAuthorizedForWidgetUpdates];
        }

        BOOL v7 = 0;
        goto LABEL_11;
      }
      uint64_t v9 = self->_queue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke_15;
      v11[3] = &unk_26528E508;
      v11[4] = self;
      v11[5] = &v13;
      dispatch_sync(v9, v11);
      char v6 = [(id)v14[5] BOOLValue];
    }
    BOOL v7 = v6;
LABEL_11:
    _Block_object_dispose(&v13, 8);

    return v7;
  }
  return 1;
}

uint64_t __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    if (*(void *)(v2 + 48)) {
      return result;
    }
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = *(void *)(v1 + 32);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *(void *)(*(void *)(v1 + 32) + 48) = [objc_alloc(MEMORY[0x263F00A60]) initWithEffectiveBundleIdentifier:*(void *)(*(void *)(v1 + 32) + 16) delegate:*(void *)(v1 + 32) onQueue:*(void *)(*(void *)(v1 + 32) + 24)];
  }
  return MEMORY[0x270F9A758]();
}

void __78__ATXWidgetLocationAuthorizationTracker_isContainerAuthorizedForWidgetUpdates__block_invoke_15(uint64_t a1)
{
}

- (BOOL)widgetWantsLocation
{
  p_extensionBundleIdentifier = (uint64_t *)&self->_extensionBundleIdentifier;
  if (ATXBundleIdIsSpecialWidgetExtensionBundleId()) {
    return 0;
  }
  uint64_t v4 = (void *)MEMORY[0x24C5D0000]();
  id v5 = objc_alloc(MEMORY[0x263F01858]);
  uint64_t v6 = *p_extensionBundleIdentifier;
  id v12 = 0;
  BOOL v7 = (void *)[v5 initWithBundleIdentifier:v6 error:&v12];
  id v8 = v12;
  if (v8)
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ATXWidgetLocationAuthorizationTracker *)p_extensionBundleIdentifier widgetWantsLocation];
    }
    char v3 = 0;
  }
  else
  {
    uint64_t v9 = [v7 infoDictionary];
    v10 = [v9 objectForKey:@"NSWidgetWantsLocation" ofClass:objc_opt_class()];
    char v3 = [v10 BOOLValue];
  }
  return v3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = NSNumber;
  uint64_t v7 = [v5 isAuthorizedForWidgetUpdates];

  id v8 = [v6 numberWithBool:v7];
  queue_authorizedForWidgetUpdates = self->_queue_authorizedForWidgetUpdates;
  self->_queue_authorizedForWidgetUpdates = v8;

  sem = self->_sem;
  dispatch_semaphore_signal(sem);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_queue_authorizedForWidgetUpdates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (void)isContainerAuthorizedForWidgetUpdates
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[ATXWidgetLocationAuthorizationTracker isContainerAuthorizedForWidgetUpdates]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_24A77B000, a2, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for location auth delegate callback for bundle id: %@", (uint8_t *)&v3, 0x16u);
}

- (void)widgetWantsLocation
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24A77B000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetLocationAuthorizationTracker: could not access LSApplicationExtensionRecord for extension bundle id %@", (uint8_t *)&v3, 0xCu);
}

@end