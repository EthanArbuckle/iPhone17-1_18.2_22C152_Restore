@interface BRProcessMonitor
- (BOOL)_isProcessForeground:(id)a3 bundleID:(id)a4;
- (id)_bundleIDForPID:(int)a3;
- (id)initForProcessID:(int)a3 observer:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BRProcessMonitor

- (BOOL)_isProcessForeground:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_isProcessForeground_bundleID__onceToken != -1) {
    dispatch_once(&_isProcessForeground_bundleID__onceToken, &__block_literal_global_8);
  }
  char v7 = [(id)_isProcessForeground_bundleID__EXTENSION_BUNDLE_IDS containsObject:v6];
  int v8 = [v5 taskState];
  if (v8 == 4) {
    char v9 = v7;
  }
  else {
    char v9 = 0;
  }
  if ((v7 & 1) == 0 && v8 == 4)
  {
    v10 = [v5 endowmentNamespaces];
    char v9 = [v10 containsObject:@"com.apple.frontboard.visibility"];
  }
  return v9;
}

uint64_t __50__BRProcessMonitor__isProcessForeground_bundleID___block_invoke()
{
  _isProcessForeground_bundleID__EXTENSION_BUNDLE_IDS = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF1331A8];

  return MEMORY[0x1F41817F8]();
}

- (id)_bundleIDForPID:(int)a3
{
  v3 = (void *)MEMORY[0x1E4F963E8];
  v4 = (void *)MEMORY[0x1E4F96430];
  id v5 = [MEMORY[0x1E4F96478] targetWithPid:*(void *)&a3];
  id v6 = [v4 predicateMatchingTarget:v5];
  char v7 = [v3 handleForPredicate:v6 error:0];

  int v8 = [v7 bundle];
  char v9 = [v8 identifier];

  return v9;
}

- (id)initForProcessID:(int)a3 observer:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BRProcessMonitor;
  char v7 = [(BRProcessMonitor *)&v24 init];
  if (!v7) {
    goto LABEL_4;
  }
  objc_initWeak(&location, v6);
  int v8 = [(BRProcessMonitor *)v7 _bundleIDForPID:v4];
  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4F96418];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__BRProcessMonitor_initForProcessID_observer___block_invoke;
    v18[3] = &unk_1E59AE100;
    int v22 = v4;
    id v10 = v8;
    id v19 = v10;
    objc_copyWeak(&v21, &location);
    v11 = v7;
    v20 = v11;
    uint64_t v12 = [v9 monitorWithConfiguration:v18];
    id monitor = v11->_monitor;
    v11->_id monitor = (id)v12;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
LABEL_4:
    v14 = v7;
    goto LABEL_8;
  }
  v15 = brc_bread_crumbs((uint64_t)"-[BRProcessMonitor initForProcessID:observer:]", 55);
  v16 = brc_default_log(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRProcessMonitor initForProcessID:observer:]((uint64_t)v15, v4, v16);
  }

  objc_destroyWeak(&location);
  v14 = 0;
LABEL_8:

  return v14;
}

void __46__BRProcessMonitor_initForProcessID_observer___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs((uint64_t)"-[BRProcessMonitor initForProcessID:observer:]_block_invoke", 59);
  id v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __46__BRProcessMonitor_initForProcessID_observer___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  id v6 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:*(void *)(a1 + 32)];
  v14[0] = v6;
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  [v3 setPredicates:v7];
  int v8 = [MEMORY[0x1E4F96448] descriptor];
  [v8 setValues:1];
  [v8 setEndowmentNamespaces:&unk_1EF1331C0];
  [v3 setStateDescriptor:v8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__BRProcessMonitor_initForProcessID_observer___block_invoke_23;
  v9[3] = &unk_1E59AE0D8;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  int v13 = *(_DWORD *)(a1 + 56);
  [v3 setUpdateHandler:v9];

  objc_destroyWeak(&v12);
}

void __46__BRProcessMonitor_initForProcessID_observer___block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v7 = [v5 state];
    uint64_t v8 = [*(id *)(a1 + 32) _isProcessForeground:v7 bundleID:*(void *)(a1 + 40)];
    char v9 = brc_bread_crumbs((uint64_t)"-[BRProcessMonitor initForProcessID:observer:]_block_invoke", 71);
    id v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = *(_DWORD *)(a1 + 56);
      int v13 = 138413314;
      uint64_t v14 = v11;
      __int16 v15 = 1024;
      int v16 = v12;
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      int v22 = v9;
      _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Received an update handler for bundleID = %@, pid = %d, isForeground = %d, update = %@%@", (uint8_t *)&v13, 0x2Cu);
    }

    [WeakRetained process:*(unsigned int *)(a1 + 56) didBecomeForeground:v8];
  }
}

- (void)invalidate
{
  [self->_monitor invalidate];
  id monitor = self->_monitor;
  self->_id monitor = 0;
}

- (void)dealloc
{
  [(BRProcessMonitor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BRProcessMonitor;
  [(BRProcessMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

- (void)initForProcessID:(os_log_t)log observer:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] There is no bundleID for the provided pid %d%@", (uint8_t *)v3, 0x12u);
}

void __46__BRProcessMonitor_initForProcessID_observer___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] creating monitor for %d with bundleID = %@%@", (uint8_t *)v5, 0x1Cu);
}

@end