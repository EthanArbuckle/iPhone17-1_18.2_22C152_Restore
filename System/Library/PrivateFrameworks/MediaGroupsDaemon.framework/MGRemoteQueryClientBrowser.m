@interface MGRemoteQueryClientBrowser
- (BOOL)invalidated;
- (MGRemoteQueryClientBrowser)initWithDelegate:(id)a3 dispatchQueue:(id)a4;
- (MGRemoteQueryClientBrowserDelegate)delegate;
- (NSError)error;
- (NSSet)knownTargets;
- (NSSet)updatedTargets;
- (OS_dispatch_queue)dispatchQueue;
- (OS_nw_browser)browser;
- (id)_prepareBrowseDescriptor;
- (id)_prepareBrowseParameters;
- (id)_targetForBrowseResult:(id)a3;
- (id)description;
- (void)_applyUpdates;
- (void)_handleBrowseChangeFromTarget:(id)a3 toTarget:(id)a4 applyBatch:(BOOL)a5;
- (void)_invalidate;
- (void)_invalidated;
- (void)_prepareBrowserHandlers;
- (void)_startBrowsing;
- (void)dealloc;
- (void)setBrowser:(id)a3;
- (void)setError:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setKnownTargets:(id)a3;
- (void)setUpdatedTargets:(id)a3;
@end

@implementation MGRemoteQueryClientBrowser

- (MGRemoteQueryClientBrowser)initWithDelegate:(id)a3 dispatchQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MGRemoteQueryClientBrowser;
  v8 = [(MGRemoteQueryClientBrowser *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    uint64_t v10 = [MEMORY[0x263EFFA08] set];
    knownTargets = v9->_knownTargets;
    v9->_knownTargets = (NSSet *)v10;

    v12 = [(MGRemoteQueryClientBrowser *)v9 knownTargets];
    uint64_t v13 = [v12 copy];
    updatedTargets = v9->_updatedTargets;
    v9->_updatedTargets = (NSSet *)v13;

    v9->_invalidated = 0;
    error = v9->_error;
    v9->_error = 0;

    v16 = [(MGRemoteQueryClientBrowser *)v9 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__MGRemoteQueryClientBrowser_initWithDelegate_dispatchQueue___block_invoke;
    block[3] = &unk_26485E378;
    v19 = v9;
    dispatch_async(v16, block);
  }
  return v9;
}

uint64_t __61__MGRemoteQueryClientBrowser_initWithDelegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBrowsing];
}

- (void)dealloc
{
  [(MGRemoteQueryClientBrowser *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryClientBrowser;
  [(MGRemoteQueryClientBrowser *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MGRemoteQueryClientBrowser *)self knownTargets];
  id v7 = [(MGRemoteQueryClientBrowser *)self browser];
  BOOL v8 = [(MGRemoteQueryClientBrowser *)self invalidated];
  uint64_t v9 = 78;
  if (v8) {
    uint64_t v9 = 89;
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p, _targets = %@, _browser = %@, _invalidated = %c>", v5, self, v6, v7, v9];

  return v10;
}

- (void)_startBrowsing
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(MGRemoteQueryClientBrowser *)self browser];

  if (v4)
  {
    v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(MGRemoteQueryClientBrowser *)self browser];
      *(_DWORD *)buf = 134218242;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p browser already browsing %@", buf, 0x16u);
    }
LABEL_7:

    return;
  }
  if ([(MGRemoteQueryClientBrowser *)self invalidated])
  {
    v5 = MGLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v12 = self;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p browser invalidated, not starting", buf, 0xCu);
    }
    goto LABEL_7;
  }
  descriptor = [(MGRemoteQueryClientBrowser *)self _prepareBrowseDescriptor];
  id v7 = [(MGRemoteQueryClientBrowser *)self _prepareBrowseParameters];
  BOOL v8 = nw_browser_create(descriptor, v7);
  [(MGRemoteQueryClientBrowser *)self setBrowser:v8];
  uint64_t v9 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  nw_browser_set_queue(v8, v9);

  [(MGRemoteQueryClientBrowser *)self _prepareBrowserHandlers];
  nw_browser_start(v8);
}

- (void)_invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (![(MGRemoteQueryClientBrowser *)self invalidated])
  {
    objc_super v3 = MGLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = self;
      _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p browser invalidating", buf, 0xCu);
    }

    [(MGRemoteQueryClientBrowser *)self setInvalidated:1];
    v4 = [(MGRemoteQueryClientBrowser *)self browser];
    [(MGRemoteQueryClientBrowser *)self setBrowser:0];
    v5 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
    if (v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__MGRemoteQueryClientBrowser__invalidate__block_invoke;
      block[3] = &unk_26485E378;
      id v7 = v4;
      dispatch_async(v5, block);
    }
    else
    {
      [(MGRemoteQueryClientBrowser *)self _invalidated];
    }
  }
}

void __41__MGRemoteQueryClientBrowser__invalidate__block_invoke(uint64_t a1)
{
}

- (void)_invalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = MGLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p browser invalidated", buf, 0xCu);
  }

  v4 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__MGRemoteQueryClientBrowser__invalidated__block_invoke;
  block[3] = &unk_26485E378;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __42__MGRemoteQueryClientBrowser__invalidated__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (v4)
  {
    v2 = *(void **)(a1 + 32);
    objc_super v3 = [v2 error];
    [v4 browser:v2 invalidatedWithError:v3];
  }
}

- (id)_prepareBrowseDescriptor
{
  v2 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v2);

  bonjour_service = nw_browse_descriptor_create_bonjour_service((const char *)[@"_mediagroups._tcp" UTF8String], (const char *)objc_msgSend(@"local.", "UTF8String"));
  nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
  return bonjour_service;
}

- (id)_prepareBrowseParameters
{
  v2 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v2);

  objc_super v3 = nw_parameters_create();
  nw_parameters_prohibit_interface_type(v3, nw_interface_type_cellular);
  nw_parameters_prohibit_interface_type(v3, nw_interface_type_loopback);
  nw_parameters_set_include_peer_to_peer(v3, 0);
  return v3;
}

- (void)_prepareBrowserHandlers
{
  objc_super v3 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = [(MGRemoteQueryClientBrowser *)self browser];
  id v4 = v11[5];
  state_changed_handler[0] = MEMORY[0x263EF8330];
  state_changed_handler[1] = 3221225472;
  state_changed_handler[2] = __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke;
  state_changed_handler[3] = &unk_26485E3A0;
  objc_copyWeak(&v9, &location);
  state_changed_handler[4] = &v10;
  nw_browser_set_state_changed_handler(v4, state_changed_handler);
  v5 = v11[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke_9;
  v6[3] = &unk_26485E3C8;
  objc_copyWeak(&v7, &location);
  nw_browser_set_browse_results_changed_handler(v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  _Block_object_dispose(&v10, 8);

  objc_destroyWeak(&location);
}

void __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (a2 == 3)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    [v7 _invalidated];
  }
  else if (a2 == 2 && WeakRetained)
  {
    uint64_t v8 = MGLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218242;
      __int16 v13 = v7;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p browser failed, error %@", (uint8_t *)&v12, 0x16u);
    }

    CFErrorRef v9 = nw_error_copy_cf_error(v5);
    [v7 setError:v9];
    [v7 _invalidate];
  }
}

void __53__MGRemoteQueryClientBrowser__prepareBrowserHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if (WeakRetained && ([WeakRetained invalidated] & 1) == 0)
  {
    nw_browse_result_change_t changes = nw_browse_result_get_changes(v7, v8);
    if (changes)
    {
      char v14 = 0;
    }
    else
    {
      uint64_t v12 = [v10 _targetForBrowseResult:v7];
      uint64_t v13 = [v10 _targetForBrowseResult:v8];
      char v14 = v12 | v13;
      if (v12 | v13)
      {
        id v15 = (void *)v13;
        if (([(id)v12 isEqual:v13] ^ 1)) {
          goto LABEL_13;
        }
LABEL_9:
        if (!a4)
        {
          uint64_t v16 = MGLogForCategory(6);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            int v17 = 134219266;
            v18 = v10;
            __int16 v19 = 2048;
            nw_browse_result_change_t v20 = changes;
            __int16 v21 = 2112;
            v22 = v7;
            __int16 v23 = 2112;
            v24 = v8;
            __int16 v25 = 2112;
            uint64_t v26 = v12;
            __int16 v27 = 2112;
            v28 = v15;
            _os_log_debug_impl(&dword_229257000, v16, OS_LOG_TYPE_DEBUG, "%p browser disregarding inconsequential change %llu from %@ to %@ for %@ to %@", (uint8_t *)&v17, 0x3Eu);
          }

          goto LABEL_14;
        }
LABEL_13:
        [v10 _handleBrowseChangeFromTarget:v12 toTarget:v15 applyBatch:a4];
LABEL_14:

        goto LABEL_15;
      }
    }
    uint64_t v12 = 0;
    id v15 = 0;
    if (v14) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_15:
}

- (void)_handleBrowseChangeFromTarget:(id)a3 toTarget:(id)a4 applyBatch:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  v11 = [(MGRemoteQueryClientBrowser *)self updatedTargets];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (v8)
  {
    uint64_t v13 = MGLogForCategory(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 134218242;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_debug_impl(&dword_229257000, v13, OS_LOG_TYPE_DEBUG, "%p browser losing target %@", (uint8_t *)&v15, 0x16u);
    }

    [v12 removeObject:v8];
  }
  if (v9)
  {
    char v14 = MGLogForCategory(6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 134218242;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_debug_impl(&dword_229257000, v14, OS_LOG_TYPE_DEBUG, "%p browser adding target %@", (uint8_t *)&v15, 0x16u);
    }

    [v12 addObject:v9];
  }
  [(MGRemoteQueryClientBrowser *)self setUpdatedTargets:v12];
  if (v5) {
    [(MGRemoteQueryClientBrowser *)self _applyUpdates];
  }
}

- (void)_applyUpdates
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryClientBrowser *)self knownTargets];
  BOOL v5 = [(MGRemoteQueryClientBrowser *)self updatedTargets];
  if (([v4 isEqualToSet:v5] & 1) == 0)
  {
    id v6 = (void *)[v5 copy];
    [(MGRemoteQueryClientBrowser *)self setKnownTargets:v6];

    id v7 = [(MGRemoteQueryClientBrowser *)self delegate];
    if (v7)
    {
      id v8 = (void *)[v5 mutableCopy];
      [v8 minusSet:v4];
      id v9 = (void *)[v4 mutableCopy];
      [v9 minusSet:v5];
      uint64_t v10 = MGLogForCategory(6);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v32 = self;
        __int16 v33 = 2048;
        uint64_t v34 = [v8 count];
        __int16 v35 = 2048;
        uint64_t v36 = [v9 count];
        __int16 v37 = 2048;
        uint64_t v38 = [v5 count];
        _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p browser updated, found(%lu) lost(%lu) now(%lu)", buf, 0x2Au);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            [v7 browser:self foundTarget:*(void *)(*((void *)&v25 + 1) + 8 * v15++)];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v13);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v16 = v9;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v22;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v22 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend(v7, "browser:lostTarget:", self, *(void *)(*((void *)&v21 + 1) + 8 * v20++), (void)v21);
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v18);
      }
    }
  }
}

- (id)_targetForBrowseResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(MGRemoteQueryClientBrowser *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (v4 && nw_browse_result_get_interfaces_count(v4))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    enumerator[0] = MEMORY[0x263EF8330];
    enumerator[1] = 3221225472;
    enumerator[2] = __53__MGRemoteQueryClientBrowser__targetForBrowseResult___block_invoke;
    enumerator[3] = &unk_26485E3F0;
    enumerator[4] = &v12;
    nw_browse_result_enumerate_interfaces(v4, enumerator);
    if (*((unsigned char *)v13 + 24))
    {
      id v6 = MGLogForCategory(6);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v4;
        _os_log_debug_impl(&dword_229257000, v6, OS_LOG_TYPE_DEBUG, "%p browser ignoring loopback result %@", buf, 0x16u);
      }
      id v7 = 0;
    }
    else
    {
      id v6 = nw_browse_result_copy_endpoint(v4);
      nw_txt_record_t v8 = nw_browse_result_copy_txt_record_object(v4);
      nw_txt_record_t v9 = v8;
      id v7 = 0;
      if (v6 && v8)
      {
        id v7 = +[MGRemoteQueryClientTarget targetWithEndpoint:v6 txtRecord:v8];
      }
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

BOOL __53__MGRemoteQueryClientBrowser__targetForBrowseResult___block_invoke(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type = nw_interface_get_type(interface);
  if (type == nw_interface_type_loopback) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return type != nw_interface_type_loopback;
}

- (MGRemoteQueryClientBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGRemoteQueryClientBrowserDelegate *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (NSSet)knownTargets
{
  return self->_knownTargets;
}

- (void)setKnownTargets:(id)a3
{
}

- (NSSet)updatedTargets
{
  return self->_updatedTargets;
}

- (void)setUpdatedTargets:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updatedTargets, 0);
  objc_storeStrong((id *)&self->_knownTargets, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end