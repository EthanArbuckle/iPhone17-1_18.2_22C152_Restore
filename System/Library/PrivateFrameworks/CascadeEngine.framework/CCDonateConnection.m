@interface CCDonateConnection
- (BOOL)isAlive;
- (BOOL)isXPC;
- (CCDifferentialUpdater)updater;
- (CCDonateConnection)init;
- (CCDonateConnection)initWithRequestManager:(id)a3 xpcConnection:(id)a4;
- (CCDonateRequest)request;
- (CCDonateRequestManager)requestManager;
- (CCSet)set;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (id)openStreamCompletion;
- (void)_cleanupDonation:(int64_t)a3;
- (void)_cleanupRequestState;
- (void)abortSetDonation;
- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5;
- (void)attributionFunction;
- (void)beginSetDonationWithItemType:(unsigned __int16)a3 remoteDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8;
- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)mergeDelta:(id)a3 completion:(id)a4;
- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4;
- (void)resume;
- (void)setAttributionFunction:(void *)a3;
- (void)setOpenStreamCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestManager:(id)a3;
- (void)setSet:(id)a3;
- (void)setUpdater:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)timeout;
@end

@implementation CCDonateConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong(&self->_openStreamCompletion, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

- (CCDonateConnection)initWithRequestManager:(id)a3 xpcConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CCDonateConnection;
  v9 = [(CCDonateConnection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestManager, a3);
    objc_storeWeak((id *)&v10->_xpcConnection, v8);
    id openStreamCompletion = v10->_openStreamCompletion;
    v10->_id openStreamCompletion = 0;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("DonateConnection", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;
  }
  return v10;
}

- (void)beginSetDonationWithItemType:(unsigned __int16)a3 remoteDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  uint64_t v12 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = (void *)MEMORY[0x24C5B0C10](a8);
  id openStreamCompletion = self->_openStreamCompletion;
  self->_id openStreamCompletion = v17;

  v19 = CCTypeIdentifierRegistryBridge();
  v20 = [v19 setIdentifierForItemType:v12];

  if (v20)
  {
    id v41 = 0;
    v21 = [MEMORY[0x263F31798] descriptorsFromEncodedString:v15 error:&v41];
    id v22 = v41;
    if (!v21)
    {
      v33 = __biome_log_for_category();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[CCDonateConnection beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:]();
      }

      (*((void (**)(void))self->_openStreamCompletion + 2))();
      goto LABEL_19;
    }
    id v36 = v16;
    id v37 = v14;
    v23 = (void *)[objc_alloc(MEMORY[0x263F29E98]) initWithType:4 name:v20 descriptors:v21 options:0];
    requestManager = self->_requestManager;
    id v39 = v22;
    id v40 = 0;
    v25 = [(CCDonateRequestManager *)requestManager requestAccess:&v40 forResource:v23 withMode:3 error:&v39];
    id v35 = v40;
    id v26 = v39;

    if (!v25 || v26)
    {
      v34 = __biome_log_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CCDonateConnection beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:]();
      }
    }
    else
    {
      id v38 = 0;
      v27 = [MEMORY[0x263F31770] setFromResourceSpecifier:v23 inContainer:v25 error:&v38];
      id v26 = v38;
      set = self->_set;
      self->_set = v27;

      v29 = self->_set;
      if (v29)
      {
        v30 = [(CCSet *)v29 personaIdentifier];
        v31 = [[CCDonateRequest alloc] initWithConnection:self manager:self->_requestManager itemType:v12 encodedDescriptors:v15 personaIdentifier:v30 version:a6 validity:v36 remoteDevice:v37 accessAssertion:v35];
        objc_storeWeak((id *)&self->_request, v31);
        [(CCDonateRequestManager *)self->_requestManager submitRequest:v31];

LABEL_18:
        id v22 = v26;
        id v16 = v36;
        id v14 = v37;
LABEL_19:

        goto LABEL_20;
      }
      v34 = __biome_log_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CCDonateConnection beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:].cold.4();
      }
    }

    (*((void (**)(void))self->_openStreamCompletion + 2))();
    goto LABEL_18;
  }
  v32 = __biome_log_for_category();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    -[CCDonateConnection beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:](v12);
  }

  (*((void (**)(void))self->_openStreamCompletion + 2))();
LABEL_20:
}

- (BOOL)isXPC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)resume
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_249B69000, v2, v3, "Rejecting request %@ after updater failed to be initialized", v4, v5, v6, v7, v8);
}

- (BOOL)isAlive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__CCDonateConnection_isAlive__block_invoke;
  v5[3] = &unk_265277EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x24C5B0A20]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  if (WeakRetained)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void (**)(void *))(v4 + 56);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke_2;
    v8[3] = &unk_265277EC8;
    uint64_t v6 = (void *)a1[5];
    uint64_t v10 = a1[6];
    v8[4] = v4;
    id v9 = v6;
    v5(v8);
  }
  else
  {
    uint64_t v7 = a1[5];
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 11);
    }
  }
}

void __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x24C5B0A20]();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void (**)(void *))(v4 + 56);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke_2;
    v7[3] = &unk_265277EF0;
    v7[4] = v4;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    v5(v7);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 11);
    }
  }
}

uint64_t __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) addItemsWithContents:*(void *)(a1 + 40) metaContents:*(void *)(a1 + 48)])
  {
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    char v3 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    [*(id *)(a1 + 32) _cleanupDonation:3];
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    char v3 = *(uint64_t (**)(void))(result + 16);
  }
  return v3();
}

uint64_t __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 40) finish:*(_DWORD *)(a1 + 48) & 1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v4 = WeakRetained;
  if (v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 3;
  }
  if (v2) {
    uint64_t v6 = 7;
  }
  else {
    uint64_t v6 = 11;
  }
  [WeakRetained terminateWithType:v5];

  uint64_t v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    id v9 = CCDonateServiceResponseDescription();
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_249B69000, v7, OS_LOG_TYPE_DEFAULT, "Completing request %@ with response %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) _cleanupRequestState];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v6);
  }
  return result;
}

- (void)_cleanupRequestState
{
  objc_storeWeak((id *)&self->_request, 0);
  updater = self->_updater;
  self->_updater = 0;

  set = self->_set;
  self->_set = 0;
}

void __29__CCDonateConnection_isAlive__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = WeakRetained != 0;
}

- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke;
  block[3] = &unk_265277EC8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke;
  v15[3] = &unk_265277EF0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

- (CCDonateConnection)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

uint64_t __28__CCDonateConnection_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDonation:3];
}

uint64_t __28__CCDonateConnection_resume__block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDonation:3];
}

- (void)timeout
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__CCDonateConnection_timeout__block_invoke;
  block[3] = &unk_265277CC0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__CCDonateConnection_timeout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDonation:4];
}

- (void)abortSetDonation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CCDonateConnection_abortSetDonation__block_invoke;
  block[3] = &unk_265277CC0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__CCDonateConnection_abortSetDonation__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x24C5B0A20]();
  [*(id *)(a1 + 32) _cleanupDonation:1];
}

- (void)_cleanupDonation:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);

  if (WeakRetained)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained((id *)&self->_request);
      id v8 = CCDonateRequestTerminationTypeDescription(a3);
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_249B69000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up request %@ with termination type %@", (uint8_t *)&v13, 0x16u);
    }
    [(CCDifferentialUpdater *)self->_updater abort];
    id v9 = objc_loadWeakRetained((id *)&self->_request);
    [v9 terminateWithType:a3];

    [(CCDonateConnection *)self _cleanupRequestState];
  }
  p_xpcConnection = &self->_xpcConnection;
  id v11 = objc_loadWeakRetained((id *)p_xpcConnection);

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_xpcConnection);
    [v12 invalidate];
  }
}

- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke;
  block[3] = &unk_265277F18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x24C5B0A20]();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void (**)(void *))(v4 + 56);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke_2;
    v7[3] = &unk_265277F18;
    v7[4] = v4;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    v5(v7);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 11);
    }
  }
}

uint64_t __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) isIncremental]
    && [*(id *)(*(void *)(a1 + 32) + 40) removeSourceItemIdentifier:*(void *)(a1 + 40)])
  {
    uint64_t result = *(void *)(a1 + 48);
    if (!result) {
      return result;
    }
    char v3 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    [*(id *)(a1 + 32) _cleanupDonation:3];
    uint64_t result = *(void *)(a1 + 48);
    if (!result) {
      return result;
    }
    char v3 = *(uint64_t (**)(void))(result + 16);
  }
  return v3();
}

- (void)mergeDelta:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CCDonateConnection_mergeDelta_completion___block_invoke;
  block[3] = &unk_265277F40;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __44__CCDonateConnection_mergeDelta_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void (**)(void *))(v3 + 56);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__CCDonateConnection_mergeDelta_completion___block_invoke_2;
    v7[3] = &unk_265277F40;
    v7[4] = v3;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    v4(v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

void __44__CCDonateConnection_mergeDelta_completion___block_invoke_2(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x263F29E98]);
  uint64_t v3 = (void *)[v2 initWithType:5 name:*MEMORY[0x263F29E08] descriptors:MEMORY[0x263EFFA68] options:1];
  uint64_t v4 = *(void **)(a1[4] + 8);
  id v14 = 0;
  id v15 = 0;
  uint64_t v5 = [v4 requestAccess:&v15 forResource:v3 withMode:1 error:&v14];
  id v6 = v15;
  id v7 = v14;
  id v8 = v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44__CCDonateConnection_mergeDelta_completion___block_invoke_2_cold_1();
    }

    uint64_t v11 = a1[6];
LABEL_11:
    if (v11)
    {
      id v13 = *(void (**)(void))(v11 + 16);
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  int v12 = [*(id *)(a1[4] + 40) mergeDelta:a1[5]];
  uint64_t v11 = a1[6];
  if (!v12) {
    goto LABEL_11;
  }
  if (v11)
  {
    id v13 = *(void (**)(void))(v11 + 16);
LABEL_13:
    v13();
  }
LABEL_14:
}

- (CCDonateRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (CCDonateRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (CCDonateRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (id)openStreamCompletion
{
  return self->_openStreamCompletion;
}

- (void)setOpenStreamCompletion:(id)a3
{
}

- (CCDifferentialUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
}

- (CCSet)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (void)attributionFunction
{
  return self->_attributionFunction;
}

- (void)setAttributionFunction:(void *)a3
{
  self->_attributionFunction = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)beginSetDonationWithItemType:(unsigned __int16)a1 remoteDevice:encodedDescriptors:version:validity:completion:.cold.1(unsigned __int16 a1)
{
  id v2 = CCTypeIdentifierRegistryBridge();
  uint64_t v3 = [v2 descriptionForTypeIdentifier:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_249B69000, v4, v5, "Invalid itemType: %@", v6, v7, v8, v9, v10);
}

- (void)beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Invalid descriptors: %@", v2, v3, v4, v5, v6);
}

- (void)beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_249B69000, v1, OS_LOG_TYPE_ERROR, "Failed to obtain write access for resource: %@, error: %@", v2, 0x16u);
}

- (void)beginSetDonationWithItemType:remoteDevice:encodedDescriptors:version:validity:completion:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to resolve set: %@", v2, v3, v4, v5, v6);
}

void __44__CCDonateConnection_mergeDelta_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to obtain read only access for mergeable deltas resource %@", v2, v3, v4, v5, v6);
}

@end