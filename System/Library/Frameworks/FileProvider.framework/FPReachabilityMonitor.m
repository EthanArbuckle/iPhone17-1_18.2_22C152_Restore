@interface FPReachabilityMonitor
+ (BOOL)isNetworkReachableForFlags:(unsigned int)a3;
+ (id)_notifAccountStore;
+ (id)sharedReachabilityMonitor;
+ (unsigned)getReachabilityFlagsByCheckingNetwork;
- (BOOL)_isCellularAllowedForBR;
- (BOOL)isNetworkReachableForBundle:(id)a3;
- (FPReachabilityMonitor)init;
- (unsigned)reachabilityFlags;
- (void)_accountDidChange;
- (void)_isCellularAllowedForBR;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setReachabilityFlags:(unsigned int)a3;
@end

@implementation FPReachabilityMonitor

- (BOOL)isNetworkReachableForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FPReachabilityMonitor_isNetworkReachableForBundle___block_invoke;
  block[3] = &unk_1E5AF5650;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __40__FPReachabilityMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

+ (id)sharedReachabilityMonitor
{
  if (sharedReachabilityMonitor_onceToken != -1) {
    dispatch_once(&sharedReachabilityMonitor_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)sharedReachabilityMonitor_monitor;

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__FPReachabilityMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FPReachabilityMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E5AF0748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)setReachabilityFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_reachabilityFlags = v3;
  uint64_t v5 = [(id)objc_opt_class() isNetworkReachableForFlags:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_reachabilityObservers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "reachabilityMonitor:didChangeReachabilityFlagsTo:", self, v3, (void)v12);
        }
        objc_msgSend(v11, "reachabilityMonitor:didChangeReachabilityStatusTo:", self, v5, (void)v12);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

uint64_t __53__FPReachabilityMonitor_isNetworkReachableForBundle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(*(void *)(a1 + 32) + 24);
  if (![*(id *)(a1 + 40) isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"]|| (uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_isCellularAllowedForBR"), (result & 1) != 0)|| (v2 & 0x40000) == 0)
  {
    uint64_t result = [(id)objc_opt_class() isNetworkReachableForFlags:v2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

uint64_t __37__FPReachabilityMonitor_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) reachabilityMonitor:*(void *)(a1 + 32) didChangeReachabilityFlagsTo:*(unsigned int *)(*(void *)(a1 + 32) + 24)];
  }
  uint64_t v2 = [(id)objc_opt_class() isNetworkReachableForFlags:*(unsigned int *)(*(void *)(a1 + 32) + 24)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 reachabilityMonitor:v4 didChangeReachabilityStatusTo:v2];
}

+ (BOOL)isNetworkReachableForFlags:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    if ((a3 & 4) != 0 && ((a3 & 0x28) == 0 || (a3 & 0x10) != 0)) {
      return (a3 >> 18) & 1;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isCellularAllowedForBR
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  isCellularEnabledForDocumentsAndData = self->_isCellularEnabledForDocumentsAndData;
  if (!isCellularEnabledForDocumentsAndData)
  {
    uint64_t section = __fp_create_section();
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(FPReachabilityMonitor *)(uint64_t)&section _isCellularAllowedForBR];
    }

    uint64_t v11 = [MEMORY[0x1E4F179C8] defaultStore];
    long long v12 = objc_msgSend(v11, "aa_primaryAppleAccount");
    uint64_t v13 = objc_msgSend(v12, "aa_useCellularForDataclass:", *MEMORY[0x1E4F17B38]);
    long long v14 = [NSNumber numberWithBool:v13];
    long long v15 = self->_isCellularEnabledForDocumentsAndData;
    self->_isCellularEnabledForDocumentsAndData = v14;

    v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      [(FPReachabilityMonitor *)v13 _isCellularAllowedForBR];
    }

    __fp_leave_section_Debug((uint64_t)&section);
    isCellularEnabledForDocumentsAndData = self->_isCellularEnabledForDocumentsAndData;
  }
  return [(NSNumber *)isCellularEnabledForDocumentsAndData BOOLValue];
}

uint64_t __29__FPReachabilityMonitor_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _isCellularAllowedForBR];
}

uint64_t __43__FPReachabilityMonitor__notifAccountStore__block_invoke()
{
  _notifAccountStore_notifAccountStore = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__FPReachabilityMonitor_sharedReachabilityMonitor__block_invoke()
{
  sharedReachabilityMonitor_monitor = objc_alloc_init(FPReachabilityMonitor);

  return MEMORY[0x1F41817F8]();
}

- (FPReachabilityMonitor)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)FPReachabilityMonitor;
  BOOL v3 = [(FPReachabilityMonitor *)&v26 init];
  uint64_t v4 = (uint64_t)v3;
  if (v3)
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v3;
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.reachability", v7);
    uint64_t v9 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v8;

    *(_DWORD *)(v4 + 24) = [(id)objc_opt_class() getReachabilityFlagsByCheckingNetwork];
    uint64_t v10 = SCNetworkReachabilityCreateWithName(0, "apple.com");
    *(void *)(v4 + 16) = v10;
    if (!v10
      || !SCNetworkReachabilitySetCallback(v10, (SCNetworkReachabilityCallBack)fp_reachability_callback, &context)
      || !SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(v4 + 16), *(dispatch_queue_t *)(v4 + 32)))
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v4 file:@"FPReachabilityMonitor.m" lineNumber:147 description:@"UNREACHABLE: unable to hook into the reachability subsystem"];
    }
    long long v12 = [(id)objc_opt_class() _notifAccountStore];
    id location = 0;
    objc_initWeak(&location, (id)v4);
    v27[0] = 0;
    if (!AppleAccountLibraryCore_frameworkLibrary)
    {
      v27[1] = MEMORY[0x1E4F143A8];
      v27[2] = 3221225472;
      v27[3] = __AppleAccountLibraryCore_block_invoke;
      v27[4] = &__block_descriptor_40_e5_v8__0l;
      v27[5] = v27;
      long long v28 = xmmword_1E5AF5FE0;
      uint64_t v29 = 0;
      AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (AppleAccountLibraryCore_frameworkLibrary)
    {
      uint64_t v13 = (void *)v27[0];
      if (!v27[0])
      {
LABEL_10:
        long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        long long v15 = [MEMORY[0x1E4F28F08] mainQueue];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __29__FPReachabilityMonitor_init__block_invoke;
        v22[3] = &unk_1E5AF5FC0;
        objc_copyWeak(&v23, &location);
        uint64_t v16 = [v14 addObserverForName:*MEMORY[0x1E4F178D8] object:v12 queue:v15 usingBlock:v22];
        uint64_t v17 = *(void **)(v4 + 40);
        *(void *)(v4 + 40) = v16;

        uint64_t v18 = *(NSObject **)(v4 + 32);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __29__FPReachabilityMonitor_init__block_invoke_2;
        block[3] = &unk_1E5AF0FF0;
        id v21 = (id)v4;
        dispatch_async(v18, block);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

        return (FPReachabilityMonitor *)v4;
      }
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v12 = [NSString stringWithUTF8String:"void *AppleAccountLibrary(void)"];
      objc_msgSend((id)v4, "handleFailureInFunction:file:lineNumber:description:", v12, @"FPReachabilityMonitor.m", 17, @"%s", v27[0]);

      __break(1u);
    }
    free(v13);
    goto LABEL_10;
  }
  return (FPReachabilityMonitor *)v4;
}

+ (unsigned)getReachabilityFlagsByCheckingNetwork
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  SCNetworkReachabilityFlags flags = 0;
  *(void *)&address.sa_data[6] = 0;
  *(void *)&address.sa_len = 528;
  uint64_t v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &address);
  if (v2)
  {
    BOOL v3 = v2;
    if (!SCNetworkReachabilityGetFlags(v2, &flags)) {
      SCNetworkReachabilityFlags flags = 0;
    }
    CFRelease(v3);
    LODWORD(v2) = flags;
  }
  return v2;
}

+ (id)_notifAccountStore
{
  if (_notifAccountStore_onceToken != -1) {
    dispatch_once(&_notifAccountStore_onceToken, &__block_literal_global_18_1);
  }
  uint64_t v2 = (void *)_notifAccountStore_notifAccountStore;

  return v2;
}

void __29__FPReachabilityMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accountDidChange];
}

- (void)dealloc
{
  CFRelease(self->_reachabilityRef);
  v3.receiver = self;
  v3.super_class = (Class)FPReachabilityMonitor;
  [(FPReachabilityMonitor *)&v3 dealloc];
}

- (void)_accountDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FPReachabilityMonitor__accountDidChange__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __42__FPReachabilityMonitor__accountDidChange__block_invoke(uint64_t a1)
{
  uint64_t section = __fp_create_section();
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_2((uint64_t)&section, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_1(v9);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = 0;

  __fp_leave_section_Debug((uint64_t)&section);
}

- (void)invalidate
{
}

- (unsigned)reachabilityFlags
{
  return self->_reachabilityFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isCellularEnabledForDocumentsAndData, 0);
  objc_storeStrong((id *)&self->_accountDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_reachabilityObservers, 0);
}

void __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing refresh of cellular switch", v1, 2u);
}

void __42__FPReachabilityMonitor__accountDidChange__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isCellularAllowedForBR
{
}

@end