@interface HAP2AccessoryServerDiscoveryBonjour
+ (id)new;
- (BOOL)isDiscovering;
- (HAP2AccessoryServerDiscoveryBonjour)init;
- (HAP2AccessoryServerDiscoveryBonjour)initWithLocalDomainAndServiceType:(id)a3;
- (HAP2AccessoryServerDiscoveryBonjour)initWithServiceType:(id)a3 domain:(id)a4;
- (HAP2AccessoryServerDiscoveryDelegate)delegate;
- (HAP2PropertyLock)propertyLock;
- (NSMutableArray)browseResults;
- (NSString)domain;
- (NSString)type;
- (OS_dispatch_queue)workQueue;
- (OS_nw_browser)browser;
- (void)_handleBrowseResults:(id)a3;
- (void)_handleBrowseResultsChange:(id)a3 current:(id)a4 batchComplete:(BOOL)a5;
- (void)_handleStateChange:(int)a3 error:(id)a4;
- (void)_startBrowser;
- (void)_startDiscovering;
- (void)_stopBrowser;
- (void)_stopDiscovering;
- (void)dealloc;
- (void)reconfirmAccessory:(id)a3;
- (void)setBrowseResults:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscovering:(BOOL)a3;
- (void)startDiscovering;
- (void)stopDiscovering;
@end

@implementation HAP2AccessoryServerDiscoveryBonjour

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseResults, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_browser, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBrowseResults:(id)a3
{
}

- (NSMutableArray)browseResults
{
  return self->_browseResults;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)type
{
  return self->_type;
}

- (void)_handleBrowseResults:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HAP2AccessoryServerDiscoveryBonjour *)self delegate];
  if (v6)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__11854;
    v26 = __Block_byref_object_dispose__11855;
    id v27 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__11854;
    v20 = __Block_byref_object_dispose__11855;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke;
    v15[3] = &unk_1E69F21A8;
    v15[4] = &v22;
    v15[5] = &v16;
    [v4 enumerateObjectsUsingBlock:v15];
    if ([(id)v17[5] count] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)v17[5];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_52;
      v12[3] = &unk_1E69F21D0;
      id v13 = v6;
      v14 = self;
      [v7 enumerateKeysAndObjectsUsingBlock:v12];
    }
    v8 = (void *)v23[5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_2;
    v9[3] = &unk_1E69F21D0;
    id v10 = v6;
    v11 = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
}

void __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 currentResult];

  if (v4)
  {
    v5 = [v3 currentResult];
    v6 = accessoryInfoForBrowseResult(v5);

    if (v6) {
      goto LABEL_5;
    }
  }
  v7 = [v3 previousResult];

  if (v7)
  {
    v8 = [v3 previousResult];
    v6 = accessoryInfoForBrowseResult(v8);

    if (v6)
    {
LABEL_5:
      v9 = [v6 deviceID];
      if (([v3 changes] & 2) != 0 || (objc_msgSend(v3, "changes") & 0x20) != 0)
      {
        v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        if (!v15)
        {
          uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
          uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
          uint64_t v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;

          v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        }
        [v15 setObject:v6 forKeyedSubscript:v9];
        uint64_t v14 = a1 + 40;
      }
      else
      {
        if (([v3 changes] & 4) == 0)
        {
LABEL_15:

          goto LABEL_20;
        }
        id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (!v10)
        {
          uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
          id v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        }
        [v10 setObject:v6 forKeyedSubscript:v9];
        uint64_t v14 = a1 + 32;
      }
      [*(id *)(*(void *)(*(void *)v14 + 8) + 40) setObject:0 forKeyedSubscript:v9];
      goto LABEL_15;
    }
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v19 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    v20 = v19;
    id v21 = [v3 previousResult];
    uint64_t v22 = [v3 currentResult];
    int v23 = 138412546;
    uint64_t v24 = v21;
    __int16 v25 = 2112;
    v26 = v22;
    _os_log_error_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "Failed to parse previous and current browse results: previous = %@, current = %@", (uint8_t *)&v23, 0x16u);
  }
LABEL_20:
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_52(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) discovery:*(void *)(a1 + 40) didLoseAccessory:a3 error:0];
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) discovery:*(void *)(a1 + 40) didDiscoverAccessory:a3];
}

- (void)_handleBrowseResultsChange:(id)a3 current:(id)a4 batchComplete:(BOOL)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  v9 = a4;
  id v10 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if ([(HAP2AccessoryServerDiscoveryBonjour *)self isDiscovering])
  {
    nw_browse_result_change_t changes = nw_browse_result_get_changes(v8, v9);
    if (changes)
    {
      if (changes)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v19 = hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEBUG, "Ignoring identical results", buf, 2u);
        }
      }
      else
      {
        uint64_t v12 = [[HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple alloc] initWithPreviousResult:v8 currentResult:v9 changes:changes];
        if (a5)
        {
          id v13 = [(HAP2AccessoryServerDiscoveryBonjour *)self browseResults];

          if (v13)
          {
            uint64_t v14 = [(HAP2AccessoryServerDiscoveryBonjour *)self browseResults];
            [v14 addObject:v12];

            v15 = [(HAP2AccessoryServerDiscoveryBonjour *)self browseResults];
            uint64_t v16 = (void *)[v15 copy];

            [(HAP2AccessoryServerDiscoveryBonjour *)self setBrowseResults:0];
          }
          else
          {
            int v23 = v12;
            uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
          }
          [(HAP2AccessoryServerDiscoveryBonjour *)self _handleBrowseResults:v16];
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          v20 = hap2Log_browser;
          if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEBUG, "Batching changes", buf, 2u);
          }
          id v21 = [(HAP2AccessoryServerDiscoveryBonjour *)self browseResults];

          if (!v21)
          {
            uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
            [(HAP2AccessoryServerDiscoveryBonjour *)self setBrowseResults:v22];
          }
          uint64_t v16 = [(HAP2AccessoryServerDiscoveryBonjour *)self browseResults];
          [v16 addObject:v12];
        }
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v18 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v25 = v8;
        __int16 v26 = 2112;
        uint64_t v27 = v9;
        _os_log_error_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "Failed to compare results: previous = %@ current = %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v25 = v9;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "Ignoring result change while not discovering: %@", buf, 0xCu);
    }
  }
}

- (void)_handleStateChange:(int)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(HAP2AccessoryServerDiscoveryBonjour *)self isDiscovering];
  v9 = [(HAP2AccessoryServerDiscoveryBonjour *)self delegate];
  if (a3 == 1)
  {
    if (v8)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v10 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "Received redundant ready message", (uint8_t *)&v24, 2u);
      }
      goto LABEL_33;
    }
    [(HAP2AccessoryServerDiscoveryBonjour *)self setDiscovering:1];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v15 = (void *)hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      uint64_t v17 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
      int v24 = 138412290;
      __int16 v25 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "Now discovering services with type '%@'", (uint8_t *)&v24, 0xCu);
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = v9;
      v19 = self;
      id v20 = 0;
LABEL_32:
      [v18 discovery:v19 didStartDiscoveringWithError:v20];
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  [(HAP2AccessoryServerDiscoveryBonjour *)self setDiscovering:0];
  if (a3 == 3)
  {
    if (!v8) {
      goto LABEL_33;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v21 = (void *)hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    id v13 = v21;
    uint64_t v14 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
    int v24 = 138412290;
    __int16 v25 = v14;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "No longer discovering services with type '%@'", (uint8_t *)&v24, 0xCu);
    goto LABEL_25;
  }
  if (a3 != 2) {
    goto LABEL_33;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v11 = (void *)hap2Log_browser;
  BOOL v12 = os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (!v12) {
      goto LABEL_26;
    }
    id v13 = v11;
    uint64_t v14 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
    int v24 = 138412546;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "Browser failed while discovering services with type '%@': %@", (uint8_t *)&v24, 0x16u);
LABEL_25:

LABEL_26:
    if (objc_opt_respondsToSelector()) {
      [v9 discovery:self didStopDiscoveringWithError:v6];
    }
    goto LABEL_33;
  }
  if (v12)
  {
    uint64_t v22 = v11;
    int v23 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
    int v24 = 138412546;
    __int16 v25 = v23;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "Browser failed to start discovering services with type '%@': %@", (uint8_t *)&v24, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = v9;
    v19 = self;
    id v20 = v6;
    goto LABEL_32;
  }
LABEL_33:
}

- (void)_stopBrowser
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v3);

  browser = [(HAP2AccessoryServerDiscoveryBonjour *)self browser];
  if (browser)
  {
    [(HAP2AccessoryServerDiscoveryBonjour *)self setBrowser:0];
    nw_browser_cancel(browser);
  }
}

- (void)_startBrowser
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HAP2AccessoryServerDiscoveryBonjour *)self browser];

  if (!v4)
  {
    id v5 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
    id v6 = (const char *)[v5 UTF8String];
    id v7 = [(HAP2AccessoryServerDiscoveryBonjour *)self domain];
    bonjour_service = nw_browse_descriptor_create_bonjour_service(v6, (const char *)[v7 UTF8String]);

    nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
    v9 = nw_browser_create(bonjour_service, 0);
    id v10 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
    nw_browser_set_queue(v9, v10);

    objc_initWeak(&location, self);
    state_changed_handler[0] = MEMORY[0x1E4F143A8];
    state_changed_handler[1] = 3221225472;
    state_changed_handler[2] = __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke;
    state_changed_handler[3] = &unk_1E69F2158;
    objc_copyWeak(&v19, &location);
    uint64_t v11 = v9;
    uint64_t v18 = v11;
    nw_browser_set_state_changed_handler(v11, state_changed_handler);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke_2;
    v15 = &unk_1E69F2180;
    objc_copyWeak(&v16, &location);
    nw_browser_set_browse_results_changed_handler(v11, &v12);
    -[HAP2AccessoryServerDiscoveryBonjour setBrowser:](self, "setBrowser:", v11, v12, v13, v14, v15);
    nw_browser_start(v11);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  error = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (error) {
    CFErrorRef v6 = nw_error_copy_cf_error(error);
  }
  else {
    CFErrorRef v6 = 0;
  }
  [WeakRetained _handleStateChange:a2 error:v6];

  if (a2 == 3)
  {
    nw_browser_set_browse_results_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
    nw_browser_set_state_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
  }
}

void __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  CFErrorRef v6 = (id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleBrowseResultsChange:v8 current:v7 batchComplete:a4];
}

- (void)_stopDiscovering
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    CFErrorRef v6 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "Stopping discovery of services with type '%@'", (uint8_t *)&v7, 0xCu);
  }
  [(HAP2AccessoryServerDiscoveryBonjour *)self _stopBrowser];
}

- (void)_startDiscovering
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    CFErrorRef v6 = [(HAP2AccessoryServerDiscoveryBonjour *)self type];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "Starting to discover services with type '%@'", (uint8_t *)&v7, 0xCu);
  }
  [(HAP2AccessoryServerDiscoveryBonjour *)self _startBrowser];
}

- (void)reconfirmAccessory:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  int v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)stopDiscovering
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HAP2AccessoryServerDiscoveryBonjour_stopDiscovering__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __54__HAP2AccessoryServerDiscoveryBonjour_stopDiscovering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopDiscovering];
}

- (void)startDiscovering
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HAP2AccessoryServerDiscoveryBonjour_startDiscovering__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__HAP2AccessoryServerDiscoveryBonjour_startDiscovering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDiscovering];
}

- (void)setBrowser:(id)a3
{
  id v4 = (OS_nw_browser *)a3;
  id v5 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v5);

  browser = self->_browser;
  self->_browser = v4;
}

- (OS_nw_browser)browser
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self workQueue];
  dispatch_assert_queue_V2(v3);

  browser = self->_browser;

  return browser;
}

- (void)setDiscovering:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServerDiscoveryBonjour *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HAP2AccessoryServerDiscoveryBonjour_setDiscovering___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performWritingBlock:v6];
}

uint64_t __54__HAP2AccessoryServerDiscoveryBonjour_setDiscovering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isDiscovering
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self propertyLock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HAP2AccessoryServerDiscoveryBonjour_isDiscovering__block_invoke;
  v5[3] = &unk_1E69F44F0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performReadingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __52__HAP2AccessoryServerDiscoveryBonjour_isDiscovering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerDiscoveryBonjour *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HAP2AccessoryServerDiscoveryBonjour_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __51__HAP2AccessoryServerDiscoveryBonjour_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerDiscoveryDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11854;
  uint64_t v11 = __Block_byref_object_dispose__11855;
  id v12 = 0;
  id v3 = [(HAP2AccessoryServerDiscoveryBonjour *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HAP2AccessoryServerDiscoveryBonjour_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerDiscoveryDelegate *)v4;
}

uint64_t __47__HAP2AccessoryServerDiscoveryBonjour_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  browser = self->_browser;
  if (browser)
  {
    self->_browser = 0;
    id v4 = browser;

    nw_browser_cancel(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerDiscoveryBonjour;
  [(HAP2AccessoryServerDiscoveryBonjour *)&v5 dealloc];
}

- (HAP2AccessoryServerDiscoveryBonjour)initWithLocalDomainAndServiceType:(id)a3
{
  return [(HAP2AccessoryServerDiscoveryBonjour *)self initWithServiceType:a3 domain:@"local."];
}

- (HAP2AccessoryServerDiscoveryBonjour)initWithServiceType:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerDiscoveryBonjour;
  uint64_t v9 = [(HAP2AccessoryServerDiscoveryBonjour *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = (const char *)HAPDispatchQueueName(v9, @"workQueue");
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServerDiscoveryBonjour.propertyLock"];
    propertyLock = v10->_propertyLock;
    v10->_propertyLock = (HAP2PropertyLock *)v15;

    objc_storeStrong((id *)&v10->_type, a3);
    objc_storeStrong((id *)&v10->_domain, a4);
  }

  return v10;
}

- (HAP2AccessoryServerDiscoveryBonjour)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end