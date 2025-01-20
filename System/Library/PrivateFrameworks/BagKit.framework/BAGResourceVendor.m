@interface BAGResourceVendor
- (BAGResourceVendor)initWithQueue:(id)a3;
- (BAGResourceVendor)initWithQueue:(id)a3 daemonController:(id)a4;
- (IDSXPCDaemonController)daemonController;
- (NSMutableDictionary)updateBlocksByOptions;
- (NSUUID)vendorID;
- (OS_dispatch_queue)queue;
- (void)_calloutToBlocksForOptions:(id)a3 withResource:(id)a4 andContext:(id)a5;
- (void)_handleInterruption;
- (void)_performCancelForOptions:(id)a3;
- (void)_performFetchForOptions:(id)a3;
- (void)dealloc;
- (void)resourceUpdated:(id)a3 forOptions:(id)a4 withContext:(id)a5;
- (void)setDaemonController:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUpdateBlocksByOptions:(id)a3;
- (void)setVendorID:(id)a3;
- (void)stopTrackingResourceForOptions:(id)a3;
- (void)trackResourceForOptions:(id)a3 updateBlock:(id)a4;
@end

@implementation BAGResourceVendor

- (BAGResourceVendor)initWithQueue:(id)a3 daemonController:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BAGResourceVendor.m", 32, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"BAGResourceVendor.m", 33, @"Invalid parameter not satisfying: %@", @"daemonController" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)BAGResourceVendor;
  v11 = [(BAGResourceVendor *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v12->_daemonController, a4);
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    vendorID = v12->_vendorID;
    v12->_vendorID = (NSUUID *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updateBlocksByOptions = v12->_updateBlocksByOptions;
    v12->_updateBlocksByOptions = v15;

    v17 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v12->_vendorID;
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_223162000, v17, OS_LOG_TYPE_DEFAULT, "Init vendor %@", buf, 0xCu);
    }
  }
  return v12;
}

- (BAGResourceVendor)initWithQueue:(id)a3
{
  v4 = (void *)MEMORY[0x263F4A0F0];
  id v5 = a3;
  v6 = [v4 weakSharedInstance];
  v7 = [(BAGResourceVendor *)self initWithQueue:v5 daemonController:v6];

  return v7;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = +[BAGLog resourceVending];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(BAGResourceVendor *)self vendorID];
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_223162000, v3, OS_LOG_TYPE_DEFAULT, "Dealloced vendor %@", buf, 0xCu);
  }
  [(IDSXPCDaemonController *)self->_daemonController removeInterruptionHandlerForTarget:self];
  v5.receiver = self;
  v5.super_class = (Class)BAGResourceVendor;
  [(BAGResourceVendor *)&v5 dealloc];
}

- (void)trackResourceForOptions:(id)a3 updateBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BAGResourceVendor *, void, BAGResourceUpdateContext *))a4;
  if (!v8)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BAGResourceVendor.m", 58, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];
  }
  id v9 = +[BAGLog resourceVending];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(BAGResourceVendor *)self vendorID];
    *(_DWORD *)buf = 138412546;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_223162000, v9, OS_LOG_TYPE_DEFAULT, "%@ Requested fetch for options %@", buf, 0x16u);
  }
  if (v7)
  {
    v11 = [(BAGResourceVendor *)self updateBlocksByOptions];
    v12 = [v11 objectForKeyedSubscript:v7];

    uint64_t v13 = (void *)MEMORY[0x223CB0120](v8);
    v14 = [(BAGResourceVendor *)self updateBlocksByOptions];
    [v14 setObject:v13 forKeyedSubscript:v7];

    if (v12)
    {
      v15 = [MEMORY[0x263F087E8] errorWithDomain:@"BAGResourceVendorErrorDomain" code:2 userInfo:0];
      v16 = [[BAGResourceUpdateContext alloc] initWithLoadState:0 error:v15];
      ((void (**)(void, BAGResourceVendor *, void, BAGResourceUpdateContext *))v12)[2](v12, self, 0, v16);
    }
    [(BAGResourceVendor *)self _performFetchForOptions:v7];
    goto LABEL_11;
  }
  if (v8)
  {
    v12 = [MEMORY[0x263F087E8] errorWithDomain:@"BAGResourceVendorErrorDomain" code:1 userInfo:0];
    v17 = [[BAGResourceUpdateContext alloc] initWithLoadState:0 error:v12];
    v8[2](v8, self, 0, v17);

LABEL_11:
  }
}

- (void)stopTrackingResourceForOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = +[BAGLog resourceVending];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(BAGResourceVendor *)self vendorID];
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_223162000, v5, OS_LOG_TYPE_DEFAULT, "%@ Canceled fetch for options %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
  {
    id v7 = [(BAGResourceVendor *)self updateBlocksByOptions];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];

    if (v8)
    {
      id v9 = [(BAGResourceVendor *)self updateBlocksByOptions];
      [v9 setObject:0 forKeyedSubscript:v4];

      [(BAGResourceVendor *)self _performCancelForOptions:v4];
    }
  }
}

- (void)resourceUpdated:(id)a3 forOptions:(id)a4 withContext:(id)a5
{
}

- (void)_handleInterruption
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 vendorID];
  int v4 = 138412290;
  objc_super v5 = v3;
  _os_log_error_impl(&dword_223162000, a2, OS_LOG_TYPE_ERROR, "%@ XPC connection interrupted. Requesting bags", (uint8_t *)&v4, 0xCu);
}

- (void)_performFetchForOptions:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__BAGResourceVendor__performFetchForOptions___block_invoke;
  v11[3] = &unk_264699FE0;
  objc_copyWeak(&v12, &location);
  [(IDSXPCDaemonController *)daemonController addInterruptionHandler:v11 forTarget:self];
  uint64_t v6 = self->_daemonController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__BAGResourceVendor__performFetchForOptions___block_invoke_27;
  v8[3] = &unk_26469A030;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [(IDSXPCDaemonController *)v6 performTask:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleInterruption];
  }
  else
  {
    v3 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __45__BAGResourceVendor__performFetchForOptions___block_invoke_cold_1(v3);
    }
  }
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __45__BAGResourceVendor__performFetchForOptions___block_invoke_28;
    v20 = &unk_26469A008;
    objc_copyWeak(&v22, (id *)(a1 + 40));
    id v21 = *(id *)(a1 + 32);
    objc_super v5 = [v3 bagKitCollaboratorWithErrorHandler:&v17];
    uint64_t v6 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [WeakRetained vendorID];
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      _os_log_impl(&dword_223162000, v6, OS_LOG_TYPE_DEFAULT, "%@ Performing fetch for options %@", buf, 0x16u);
    }
    id v9 = [WeakRetained vendorID];
    [v5 setupBagKitClient:WeakRetained withUUID:v9 forOptions:*(void *)(a1 + 32)];

    objc_destroyWeak(&v22);
  }
  else
  {
    id v10 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __45__BAGResourceVendor__performFetchForOptions___block_invoke_27_cold_1(a1, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_28(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[BAGLog resourceVending];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__BAGResourceVendor__performFetchForOptions___block_invoke_28_cold_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v15 = *MEMORY[0x263F08608];
      v16[0] = v3;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"BAGResourceVendorErrorDomain" code:0 userInfo:v12];
    uint64_t v14 = [[BAGResourceUpdateContext alloc] initWithLoadState:0 error:v13];
    [WeakRetained _calloutToBlocksForOptions:*(void *)(a1 + 32) withResource:0 andContext:v14];
  }
  else
  {
    uint64_t v12 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __45__BAGResourceVendor__performFetchForOptions___block_invoke_28_cold_1(a1, (uint64_t)v3, v12);
    }
  }
}

- (void)_performCancelForOptions:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BAGResourceVendor__performCancelForOptions___block_invoke;
  v7[3] = &unk_26469A030;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(IDSXPCDaemonController *)daemonController performTask:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__BAGResourceVendor__performCancelForOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 bagKitCollaboratorWithErrorHandler:&__block_literal_global];
    id v6 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [WeakRetained vendorID];
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_223162000, v6, OS_LOG_TYPE_DEFAULT, "%@ Performing cancel for options %@", (uint8_t *)&v16, 0x16u);
    }
    id v9 = [WeakRetained vendorID];
    [v5 cancelBagKitClientWithUUID:v9 forOptions:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = +[BAGLog resourceVending];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__BAGResourceVendor__performCancelForOptions___block_invoke_cold_1(a1, v5, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __46__BAGResourceVendor__performCancelForOptions___block_invoke_32(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[BAGLog resourceVending];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__BAGResourceVendor__performFetchForOptions___block_invoke_28_cold_2((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_calloutToBlocksForOptions:(id)a3 withResource:(id)a4 andContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BAGResourceVendor *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__BAGResourceVendor__calloutToBlocksForOptions_withResource_andContext___block_invoke;
  v15[3] = &unk_26469A078;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __72__BAGResourceVendor__calloutToBlocksForOptions_withResource_andContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = +[BAGLog resourceVending];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) vendorID];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v9 = 138413058;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_223162000, v2, OS_LOG_TYPE_DEFAULT, "%@ Calling out to update blocks for { options : %@, context : %@, resource : %@ }", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = [*(id *)(a1 + 32) updateBlocksByOptions];
  id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v8) {
    v8[2](v8, *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 48));
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
}

- (NSMutableDictionary)updateBlocksByOptions
{
  return self->_updateBlocksByOptions;
}

- (void)setUpdateBlocksByOptions:(id)a3
{
}

- (NSUUID)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_updateBlocksByOptions, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_223162000, log, OS_LOG_TYPE_ERROR, "Self dealloced. Not handling interruption.", v1, 2u);
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_27_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_28_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_223162000, log, OS_LOG_TYPE_ERROR, "Self dealloced. Not performing collaborator error update { options: %@, error: %@ }", (uint8_t *)&v4, 0x16u);
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_28_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__BAGResourceVendor__performCancelForOptions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end