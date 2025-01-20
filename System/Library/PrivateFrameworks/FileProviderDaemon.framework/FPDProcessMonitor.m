@interface FPDProcessMonitor
- (BOOL)_isProcessForeground:(id)a3;
- (BOOL)isForeground;
- (FPDProcessMonitor)initWithExcludedBundleIDs:(id)a3;
- (FPDProcessMonitorDelegate)delegate;
- (OS_dispatch_queue)notificationQueue;
- (id)_bundleIDForPID:(int)a3;
- (id)description;
- (id)prettyDescription;
- (void)_addPIDToObserve:(int)a3;
- (void)_configureAppMonitor:(id)a3;
- (void)_createMonitor;
- (void)_handleProcessStateUpdate:(id)a3;
- (void)_invalidate;
- (void)_removePIDToObserve:(int)a3;
- (void)_startMonitoringAndSendInitialNotificationForPID:(int)a3;
- (void)_updateMonitoredBundleIDs;
- (void)addPIDToObserve:(int)a3;
- (void)addPIDToObserveSync:(int)a3;
- (void)invalidate;
- (void)process:(int)a3 didBecomeForeground:(BOOL)a4;
- (void)removePIDToObserve:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationQueue:(id)a3;
@end

@implementation FPDProcessMonitor

uint64_t __42__FPDProcessMonitor__configureAppMonitor___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleProcessStateUpdate:*(void *)(a1 + 40)];
}

uint64_t __46__FPDProcessMonitor__updateMonitoredBundleIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureAppMonitor:a2];
}

- (void)_configureAppMonitor:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(NSCountedSet *)self->_bundleIDs allObjects];
  v6 = objc_msgSend(v5, "fp_map:", &__block_literal_global_4);

  [v4 setPredicates:v6];
  v7 = [MEMORY[0x1E4F96448] descriptor];
  if ([v6 count])
  {
    [v7 setValues:1];
    [v7 setEndowmentNamespaces:&unk_1F2EDBB38];
  }
  else
  {
    [v7 setValues:0];
  }
  [v4 setStateDescriptor:v7];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__FPDProcessMonitor__configureAppMonitor___block_invoke_2;
  v8[3] = &unk_1E6A74210;
  objc_copyWeak(&v9, &location);
  [v4 setUpdateHandler:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)_startMonitoringAndSendInitialNotificationForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = (void *)MEMORY[0x1E4F963E8];
  v6 = (void *)MEMORY[0x1E4F96430];
  v7 = objc_msgSend(MEMORY[0x1E4F96478], "targetWithPid:");
  v8 = [v6 predicateMatchingTarget:v7];
  id v10 = [v5 handleForPredicate:v8 error:0];

  id v9 = [v10 currentState];
  [(FPDProcessMonitor *)self process:v3 didBecomeForeground:[(FPDProcessMonitor *)self _isProcessForeground:v9]];
  [(FPDProcessMonitor *)self _updateMonitoredBundleIDs];
}

- (void)_handleProcessStateUpdate:(id)a3
{
  notificationQueue = self->_notificationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(notificationQueue);
  id v8 = [v5 process];
  uint64_t v6 = [v8 pid];
  v7 = [v5 state];

  [(FPDProcessMonitor *)self process:v6 didBecomeForeground:[(FPDProcessMonitor *)self _isProcessForeground:v7]];
}

- (void)process:(int)a3 didBecomeForeground:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  bundleIDForPID = self->_bundleIDForPID;
  id v8 = objc_msgSend(NSNumber, "numberWithInt:");
  id v9 = [(NSMutableDictionary *)bundleIDForPID objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t section = __fp_create_section();
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = @"background";
      *(_DWORD *)buf = 134218754;
      if (v4) {
        v16 = @"foreground";
      }
      uint64_t v19 = section;
      __int16 v20 = 2112;
      v21 = self;
      __int16 v22 = 1024;
      int v23 = a3;
      __int16 v24 = 2112;
      v25 = v16;
      _os_log_debug_impl(&dword_1D744C000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received a notif for %@ that [%d] became %@", buf, 0x26u);
    }

    v11 = self;
    objc_sync_enter(v11);
    int v12 = [(FPDProcessMonitor *)v11 isForeground];
    foregroundBundleIDs = v11->_foregroundBundleIDs;
    if (v4) {
      [(NSMutableSet *)foregroundBundleIDs addObject:v9];
    }
    else {
      [(NSMutableSet *)foregroundBundleIDs removeObject:v9];
    }
    uint64_t v14 = [(FPDProcessMonitor *)v11 isForeground];
    objc_sync_exit(v11);

    if (v12 != v14)
    {
      v15 = [(FPDProcessMonitor *)v11 delegate];
      [v15 processMonitor:v11 didBecomeForeground:v14];
    }
    __fp_leave_section_Debug();
  }
}

- (BOOL)_isProcessForeground:(id)a3
{
  id v3 = a3;
  [v3 taskState];
  if (RBSTaskStateIsRunning())
  {
    BOOL v4 = [v3 endowmentNamespaces];
    char v5 = [v4 containsObject:@"com.apple.frontboard.visibility"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isForeground
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableSet *)v2->_foregroundBundleIDs count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (FPDProcessMonitorDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (FPDProcessMonitorDelegate *)WeakRetained;
}

- (void)_updateMonitoredBundleIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  monitor = self->_monitor;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__FPDProcessMonitor__updateMonitoredBundleIDs__block_invoke;
  v4[3] = &unk_1E6A74238;
  v4[4] = self;
  [(RBSProcessMonitor *)monitor updateConfiguration:v4];
}

- (void)_addPIDToObserve:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  char v5 = [NSNumber numberWithInt:v3];
  if ([(NSCountedSet *)self->_pids countForObject:v5])
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = [(NSMutableDictionary *)self->_bundleIDForPID objectForKeyedSubscript:v5];

    if (v7)
    {
      id v10 = [NSString stringWithFormat:@"[ASSERT] ‼️ state machine is broken"];
      v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[FPDProcessMonitor _addPIDToObserve:]((uint64_t)v10, v11);
      }

      __assert_rtn("-[FPDProcessMonitor _addPIDToObserve:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProcessMonitor.m", 276, (const char *)[v10 UTF8String]);
    }
    uint64_t v8 = [(FPDProcessMonitor *)self _bundleIDForPID:v3];
    if (v8)
    {
      uint64_t v6 = (void *)v8;
      [(NSMutableDictionary *)self->_bundleIDForPID setObject:v8 forKeyedSubscript:v5];
      if (![(NSSet *)self->_excludedBundleIDs containsObject:v6])
      {
        [(NSCountedSet *)self->_bundleIDs addObject:v6];
        [(NSCountedSet *)self->_pids addObject:v5];
        [(FPDProcessMonitor *)self _startMonitoringAndSendInitialNotificationForPID:v3];
        goto LABEL_13;
      }
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FPDProcessMonitor _addPIDToObserve:](v3, v9);
      }
    }
    else
    {
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FPDProcessMonitor _addPIDToObserve:](v3, v9);
      }
      uint64_t v6 = 0;
    }
  }
  [(NSCountedSet *)self->_pids addObject:v5];
LABEL_13:
}

- (void)_removePIDToObserve:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  id v11 = [NSNumber numberWithInt:v3];
  if (!-[NSCountedSet countForObject:](self->_pids, "countForObject:"))
  {
    id v9 = [NSString stringWithFormat:@"[ASSERT] ‼️ removed an object that wasn't observed %@", v11];
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[FPDProcessMonitor _addPIDToObserve:]((uint64_t)v9, v10);
    }

    __assert_rtn("-[FPDProcessMonitor _removePIDToObserve:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProcessMonitor.m", 359, (const char *)[v9 UTF8String]);
  }
  [(NSCountedSet *)self->_pids removeObject:v11];
  if (![(NSCountedSet *)self->_pids countForObject:v11])
  {
    char v5 = [(NSMutableDictionary *)self->_bundleIDForPID objectForKeyedSubscript:v11];
    if (v5)
    {
      [(NSMutableDictionary *)self->_bundleIDForPID setObject:0 forKeyedSubscript:v11];
      [(NSCountedSet *)self->_bundleIDs removeObject:v5];
      if (![(NSCountedSet *)self->_bundleIDs countForObject:v5])
      {
        uint64_t v6 = self;
        objc_sync_enter(v6);
        if ([(NSMutableSet *)v6->_foregroundBundleIDs count])
        {
          [(NSMutableSet *)v6->_foregroundBundleIDs removeObject:v5];
          uint64_t v7 = [(NSMutableSet *)v6->_foregroundBundleIDs count];
          objc_sync_exit(v6);

          [(FPDProcessMonitor *)v6 _stopMonitoringPID:v3];
          if (!v7)
          {
            uint64_t v8 = [(FPDProcessMonitor *)v6 delegate];
            [v8 processMonitor:v6 didBecomeForeground:0];
          }
        }
        else
        {
          objc_sync_exit(v6);

          [(FPDProcessMonitor *)v6 _stopMonitoringPID:v3];
        }
      }
    }
  }
}

- (id)_bundleIDForPID:(int)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F963E8];
  BOOL v4 = (void *)MEMORY[0x1E4F96430];
  char v5 = [MEMORY[0x1E4F96478] targetWithPid:*(void *)&a3];
  uint64_t v6 = [v4 predicateMatchingTarget:v5];
  uint64_t v7 = [v3 handleForPredicate:v6 error:0];

  uint64_t v8 = [v7 currentState];
  id v9 = [v7 bundle];
  id v10 = [v9 identifier];

  return v10;
}

uint64_t __42__FPDProcessMonitor__configureAppMonitor___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:a2];
}

uint64_t __40__FPDProcessMonitor_removePIDToObserve___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePIDToObserve:*(unsigned int *)(a1 + 40)];
}

uint64_t __37__FPDProcessMonitor_addPIDToObserve___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addPIDToObserve:*(unsigned int *)(a1 + 40)];
}

uint64_t __41__FPDProcessMonitor_addPIDToObserveSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addPIDToObserve:*(unsigned int *)(a1 + 40)];
}

void __42__FPDProcessMonitor__configureAppMonitor___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained notificationQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__FPDProcessMonitor__configureAppMonitor___block_invoke_3;
    v9[3] = &unk_1E6A736C0;
    v9[4] = v7;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)removePIDToObserve:(int)a3
{
  if (a3 >= 1)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__FPDProcessMonitor_removePIDToObserve___block_invoke;
    v6[3] = &unk_1E6A74260;
    v6[4] = self;
    int v7 = a3;
    dispatch_sync(notificationQueue, v6);
  }
}

- (void)addPIDToObserve:(int)a3
{
  if (a3 >= 1)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__FPDProcessMonitor_addPIDToObserve___block_invoke;
    v6[3] = &unk_1E6A74260;
    v6[4] = self;
    int v7 = a3;
    dispatch_async(notificationQueue, v6);
  }
}

uint64_t __47__FPDProcessMonitor_initWithExcludedBundleIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createMonitor];
}

uint64_t __35__FPDProcessMonitor__createMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureAppMonitor:a2];
}

- (void)addPIDToObserveSync:(int)a3
{
  if (a3 >= 1)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__FPDProcessMonitor_addPIDToObserveSync___block_invoke;
    v6[3] = &unk_1E6A74260;
    v6[4] = self;
    int v7 = a3;
    dispatch_sync(notificationQueue, v6);
  }
}

- (void)_createMonitor
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__FPDProcessMonitor__createMonitor__block_invoke;
  v5[3] = &unk_1E6A74238;
  v5[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F96418] monitorWithConfiguration:v5];
  monitor = self->_monitor;
  self->_monitor = v3;
}

void __33__FPDProcessMonitor_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "processMonitor:didBecomeForeground:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isForeground"));
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_delegate, v5);

  objc_sync_exit(v4);
  notificationQueue = v4->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDProcessMonitor_setDelegate___block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = v4;
  dispatch_async(notificationQueue, block);
}

- (FPDProcessMonitor)initWithExcludedBundleIDs:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FPDProcessMonitor;
  id v5 = [(FPDProcessMonitor *)&v24 init];
  if (v5)
  {
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.fileproviderd.process-monitor", v6);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundleIDForPID = v5->_bundleIDForPID;
    v5->_bundleIDForPID = v9;

    id v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    pids = v5->_pids;
    v5->_pids = v11;

    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundBundleIDs = v5->_foregroundBundleIDs;
    v5->_foregroundBundleIDs = v15;

    v17 = v5->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__FPDProcessMonitor_initWithExcludedBundleIDs___block_invoke;
    block[3] = &unk_1E6A73FE8;
    v18 = v5;
    int v23 = v18;
    dispatch_async(v17, block);
    uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    excludedBundleIDs = v18->_excludedBundleIDs;
    v18->_excludedBundleIDs = (NSSet *)v19;
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FPDProcessMonitor *)self prettyDescription];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (id)prettyDescription
{
  id v2 = self;
  objc_sync_enter(v2);
  if ([(NSMutableSet *)v2->_foregroundBundleIDs count])
  {
    uint64_t v3 = NSString;
    uint64_t v4 = [(NSMutableSet *)v2->_foregroundBundleIDs allObjects];
    id v5 = [v4 componentsJoinedByString:@", "];
    uint64_t v6 = [v3 stringWithFormat:@"foreground:{%@}", v5];
LABEL_5:
    uint64_t v8 = (__CFString *)v6;

    goto LABEL_6;
  }
  if ([(NSCountedSet *)v2->_bundleIDs count])
  {
    dispatch_queue_t v7 = NSString;
    uint64_t v4 = [(NSCountedSet *)v2->_bundleIDs allObjects];
    id v5 = [v4 componentsJoinedByString:@", "];
    uint64_t v6 = [v7 stringWithFormat:@"observing:{%@}", v5];
    goto LABEL_5;
  }
  uint64_t v8 = @"no process observed";
LABEL_6:
  objc_sync_exit(v2);

  return v8;
}

- (void)_invalidate
{
  [(RBSProcessMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;
}

- (void)invalidate
{
  id v2 = self;
  objc_sync_enter(v2);
  objc_storeWeak((id *)&v2->_delegate, 0);
  objc_sync_exit(v2);

  notificationQueue = v2->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__FPDProcessMonitor_invalidate__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = v2;
  dispatch_sync(notificationQueue, block);
}

uint64_t __31__FPDProcessMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)setNotificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_excludedBundleIDs, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIDs, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDForPID, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)_addPIDToObserve:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] no bundle ID for %d", (uint8_t *)v2, 8u);
}

- (void)_addPIDToObserve:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle is excluded %d", (uint8_t *)v2, 8u);
}

- (void)_addPIDToObserve:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D744C000, a2, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v2, 0xCu);
}

@end