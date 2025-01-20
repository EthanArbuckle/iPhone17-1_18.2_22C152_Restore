@interface ACDPairedDeviceAccountCache
+ (ACDPairedDeviceAccountCache)sharedInstance;
- (ACDPairedDeviceAccountCache)init;
- (void)_didFetchAccounts:(id)a3 error:(id)a4;
- (void)accountsFromRemoteDeviceProxy:(id)a3 ignoreCache:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)invalidate;
@end

@implementation ACDPairedDeviceAccountCache

+ (ACDPairedDeviceAccountCache)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return (ACDPairedDeviceAccountCache *)v2;
}

uint64_t __45__ACDPairedDeviceAccountCache_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(ACDPairedDeviceAccountCache);

  return MEMORY[0x270F9A758]();
}

- (ACDPairedDeviceAccountCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)ACDPairedDeviceAccountCache;
  v2 = [(ACDPairedDeviceAccountCache *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_accountsIsValid = 0;
    accounts = v2->_accounts;
    v2->_accounts = 0;

    completions = v3->_completions;
    v3->_completions = 0;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accounts.ACDPairedDeviceAccountCache", v7);
    synchronizationQueue = v3->_synchronizationQueue;
    v3->_synchronizationQueue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (void)accountsFromRemoteDeviceProxy:(id)a3 ignoreCache:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  synchronizationQueue = self->_synchronizationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__ACDPairedDeviceAccountCache_accountsFromRemoteDeviceProxy_ignoreCache_options_completion___block_invoke;
  block[3] = &unk_264321B78;
  BOOL v21 = a4;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(synchronizationQueue, block);
}

void __92__ACDPairedDeviceAccountCache_accountsFromRemoteDeviceProxy_ignoreCache_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)];
    v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
    int v18 = 138413058;
    id v19 = v3;
    __int16 v20 = 2112;
    BOOL v21 = v4;
    __int16 v22 = 2112;
    v23 = v5;
    __int16 v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEFAULT, "\"_accountsIsValid %@ ignoreCache %@ _accounts.count %@ _completions.count %@\"", (uint8_t *)&v18, 0x2Au);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 16) && !*(unsigned char *)(a1 + 64))
  {
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(uint64_t, void, void))(v17 + 16))(v17, *(void *)(v7 + 24), 0);
    }
  }
  else
  {
    dispatch_queue_t v8 = *(void **)(v7 + 32);
    if (v8)
    {
      v9 = _Block_copy(*(const void **)(a1 + 56));
      [v8 addObject:v9];
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 32);
      *(void *)(v11 + 32) = v10;

      v13 = *(const void **)(a1 + 56);
      if (v13)
      {
        id v14 = *(void **)(*(void *)(a1 + 32) + 32);
        id v15 = _Block_copy(v13);
        [v14 addObject:v15];
      }
      id v16 = _ACDLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEFAULT, "\"will fetch from remote device\"", (uint8_t *)&v18, 2u);
      }

      [*(id *)(a1 + 40) sendCommand:*MEMORY[0x263EFB190] withAccount:0 options:*(void *)(a1 + 48) completion:&__block_literal_global_7_0];
    }
  }
}

void __92__ACDPairedDeviceAccountCache_accountsFromRemoteDeviceProxy_ignoreCache_options_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v5 = a4;
  v6 = +[ACDPairedDeviceAccountCache sharedInstance];
  [v6 _didFetchAccounts:v7 error:v5];
}

- (void)_didFetchAccounts:(id)a3 error:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "\"fetched accounts.count %@ error %@\"", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__7;
  v31 = __Block_byref_object_dispose__7;
  id v32 = 0;
  synchronizationQueue = self->_synchronizationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ACDPairedDeviceAccountCache__didFetchAccounts_error___block_invoke;
  block[3] = &unk_264320CA0;
  block[4] = self;
  id v11 = v6;
  id v24 = v11;
  v25 = buf;
  dispatch_sync(synchronizationQueue, block);
  id v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "count"));
    *(_DWORD *)v27 = 138412290;
    v28 = v13;
    _os_log_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEFAULT, "\"calling %@ completions\"", v27, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v19 + 1) + 8 * v17);
        if (v18) {
          (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v11, v7);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v15);
  }

  _Block_object_dispose(buf, 8);
}

void __55__ACDPairedDeviceAccountCache__didFetchAccounts_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40) != 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)invalidate
{
  synchronizationQueue = self->_synchronizationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ACDPairedDeviceAccountCache_invalidate__block_invoke;
  block[3] = &unk_264320CF0;
  block[4] = self;
  dispatch_async(synchronizationQueue, block);
}

void __41__ACDPairedDeviceAccountCache_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEFAULT, "\"will invalidate\"", v5, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
}

@end