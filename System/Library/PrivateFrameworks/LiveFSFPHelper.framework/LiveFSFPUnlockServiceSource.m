@interface LiveFSFPUnlockServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LiveFSFPUnlockServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4;
- (NSString)serviceName;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
- (void)unlockWithPassword:(id)a3 saveToKeychain:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation LiveFSFPUnlockServiceSource

- (LiveFSFPUnlockServiceSource)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LiveFSFPUnlockServiceSource;
  v9 = [(LiveFSFPUnlockServiceSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileProviderExtension, a3);
    objc_storeStrong((id *)&v10->_itemIdentifier, a4);
    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:0];
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v11;
  }
  return v10;
}

- (NSString)serviceName
{
  return (NSString *)@"com.apple.filesystems.unlock";
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  v4 = objc_msgSend(MEMORY[0x263F08D88], "anonymousListener", a3);
  [v4 setDelegate:self];
  v5 = [v4 endpoint];
  [v4 resume];
  v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_listeners addObject:v4];
  objc_sync_exit(v6);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E053C38];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  v9 = self;
  objc_sync_enter(v9);
  [(NSHashTable *)v9->_listeners removeObject:v6];
  objc_sync_exit(v9);

  objc_initWeak(&location, v7);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_2649342C0;
  id v10 = v6;
  id v15 = v10;
  [v7 setInvalidationHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_2649342E8;
  objc_copyWeak(&v13, &location);
  [v7 setInterruptionHandler:v12];
  [v7 resume];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return 1;
}

uint64_t __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __66__LiveFSFPUnlockServiceSource_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)unlockWithPassword:(id)a3 saveToKeychain:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = livefs_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22CE49000, v10, OS_LOG_TYPE_INFO, "unlock starting", buf, 2u);
  }

  fileProviderExtension = self->_fileProviderExtension;
  id v18 = 0;
  v12 = [(LiveFSFPExtensionHelper *)fileProviderExtension getVolumeManagerWithError:&v18];
  id v13 = v18;
  if (v12)
  {
    objc_super v14 = [(NSFileProviderExtension *)self->_fileProviderExtension domain];
    id v15 = [v14 identifier];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __83__LiveFSFPUnlockServiceSource_unlockWithPassword_saveToKeychain_completionHandler___block_invoke;
    v16[3] = &unk_2649345B0;
    v16[4] = self;
    id v17 = v9;
    [v12 unlockVolume:v15 password:v8 saveToKeychain:v6 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, id))v9 + 2))(v9, v13);
  }
}

void __83__LiveFSFPUnlockServiceSource_unlockWithPassword_saveToKeychain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) domain];
    BOOL v6 = [v5 identifier];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_22CE49000, v4, OS_LOG_TYPE_INFO, "unlockVolume on domain %@ returning %@", (uint8_t *)&v7, 0x16u);
  }
  if (!v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) refreshVolumeInfo];
    [*(id *)(*(void *)(a1 + 32) + 8) enumerateRootContainer];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderExtension, 0);
}

@end