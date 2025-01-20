@interface JFXPickerCameraSource
+ (JFXPickerCameraSource)sharedInstance;
- (BOOL)isPickerPreviewing;
- (JFXPickerCameraSource)init;
- (NSMutableSet)registeredPickers;
- (OS_dispatch_queue)registeredPickersQueue;
- (PVLivePlayerCameraSource)pickerSource;
- (PVLivePlayerCameraSource)registeredPickersSource;
- (void)registerPickerAsPreviewingWithObject:(id)a3;
- (void)setRegisteredPickers:(id)a3;
- (void)setRegisteredPickersQueue:(id)a3;
- (void)setRegisteredPickersSource:(id)a3;
- (void)unregisterPickerAsPreviewingWithObject:(id)a3;
@end

@implementation JFXPickerCameraSource

+ (JFXPickerCameraSource)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_50);
  }
  v2 = (void *)sharedInstance_s_sharedInstance_2;
  return (JFXPickerCameraSource *)v2;
}

uint64_t __39__JFXPickerCameraSource_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(JFXPickerCameraSource);
  uint64_t v1 = sharedInstance_s_sharedInstance_2;
  sharedInstance_s_sharedInstance_2 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (JFXPickerCameraSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)JFXPickerCameraSource;
  v2 = [(JFXPickerCameraSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    registeredPickers = v2->_registeredPickers;
    v2->_registeredPickers = (NSMutableSet *)v3;

    uint64_t v5 = JFXCreateDispatchQueue(v2, @"registeredPickersQ", MEMORY[0x263EF83A8]);
    registeredPickersQueue = v2->_registeredPickersQueue;
    v2->_registeredPickersQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)registerPickerAsPreviewingWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXPickerCameraSource *)self registeredPickersQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) registeredPickers];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) registeredPickersSource];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F612C8]);
    [*(id *)(a1 + 32) setRegisteredPickersSource:v4];

    uint64_t v5 = JFXLog_DebugPickerPreviewing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke_cold_1(v5);
    }
  }
}

- (void)unregisterPickerAsPreviewingWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXPickerCameraSource *)self registeredPickersQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) registeredPickers];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) registeredPickers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [*(id *)(a1 + 32) setRegisteredPickersSource:0];
    uint64_t v5 = JFXLog_DebugPickerPreviewing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke_cold_1(v5);
    }
  }
}

- (BOOL)isPickerPreviewing
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(JFXPickerCameraSource *)self registeredPickersQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__JFXPickerCameraSource_isPickerPreviewing__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__JFXPickerCameraSource_isPickerPreviewing__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredPickers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

- (PVLivePlayerCameraSource)pickerSource
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__21;
  v11 = __Block_byref_object_dispose__21;
  id v12 = 0;
  uint64_t v3 = [(JFXPickerCameraSource *)self registeredPickersQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__JFXPickerCameraSource_pickerSource__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PVLivePlayerCameraSource *)v4;
}

uint64_t __37__JFXPickerCameraSource_pickerSource__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registeredPickersSource];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (NSMutableSet)registeredPickers
{
  return self->_registeredPickers;
}

- (void)setRegisteredPickers:(id)a3
{
}

- (OS_dispatch_queue)registeredPickersQueue
{
  return self->_registeredPickersQueue;
}

- (void)setRegisteredPickersQueue:(id)a3
{
}

- (PVLivePlayerCameraSource)registeredPickersSource
{
  return self->_registeredPickersSource;
}

- (void)setRegisteredPickersSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPickersSource, 0);
  objc_storeStrong((id *)&self->_registeredPickersQueue, 0);
  objc_storeStrong((id *)&self->_registeredPickers, 0);
}

void __62__JFXPickerCameraSource_registerPickerAsPreviewingWithObject___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "create picker camera source", v1, 2u);
}

void __64__JFXPickerCameraSource_unregisterPickerAsPreviewingWithObject___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "release picker camera source", v1, 2u);
}

@end