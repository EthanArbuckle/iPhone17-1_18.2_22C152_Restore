@interface SPDeviceConnection
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedDeviceConnection;
- (NSHashTable)observers;
- (NSXPCConnection)serverConnection;
- (OS_dispatch_queue)connectionQueue;
- (SPDeviceConnection)init;
- (SPDeviceConnectionDelegate)delegate;
- (id)connectionProxy:(id)a3 caller:(const char *)a4;
- (id)localeForUserNotification;
- (int64_t)appInstallStateForAppConduitInstallState:(int64_t)a3;
- (void)_enumerateObserversSafely:(id)a3;
- (void)activeComplicationsForPairedDevice:(id)a3 completion:(id)a4;
- (void)activeComplicationsWithCompletion:(id)a3;
- (void)activeComplicationsWithErrorCompletion:(id)a3;
- (void)addObserver:(id)a3;
- (void)cancelPendingInstallations;
- (void)createXPCConnectionIfNecessary;
- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4;
- (void)fetchInfoForApplicationWithBundleID:(id)a3 completion:(id)a4;
- (void)fetchInfoForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchInstalledApplicationsForPairedDevice:(id)a3 completion:(id)a4;
- (void)fetchInstalledApplicationsWithCompletion:(id)a3;
- (void)fetchInstalledApplicationsWithErrorCompletion:(id)a3;
- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withCompletion:(id)a4;
- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withErrorCompletion:(id)a4;
- (void)fetchInstalledComplicationsForPairedDevice:(id)a3 completion:(id)a4;
- (void)fetchInstalledComplicationsWithCompletion:(id)a3;
- (void)fetchInstalledComplicationsWithErrorCompletion:(id)a3;
- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4;
- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5;
- (void)fetchProvisioningProfilesForPairedDevice:(id)a3 completion:(id)a4;
- (void)fetchProvisioningProfilesWithCompletion:(id)a3;
- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4;
- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4;
- (void)getAlwaysInstallForPairedDevice:(id)a3 completion:(id)a4;
- (void)getAlwaysInstallWithCompletion:(id)a3;
- (void)hideUserNotification;
- (void)installAllApplications;
- (void)installApplication:(id)a3 completion:(id)a4;
- (void)installApplication:(id)a3 completionWithError:(id)a4;
- (void)installApplication:(id)a3 onPairedDevice:(id)a4 completion:(id)a5;
- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completion:(id)a5;
- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completionWithError:(id)a5;
- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completion:(id)a6;
- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completionWithError:(id)a6;
- (void)installProvisioningProfileWithURL:(id)a3 completion:(id)a4;
- (void)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 completion:(id)a5;
- (void)invalidateXPCConnection;
- (void)localeForUserNotification;
- (void)removeApplication:(id)a3 completion:(id)a4;
- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4;
- (void)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5;
- (void)setAlwaysInstall:(id)a3;
- (void)setAlwaysInstall:(id)a3 forDevice:(id)a4;
- (void)setConnectionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)showUserNotification:(int64_t)a3 applicationName:(id)a4 extensionBundleID:(id)a5;
- (void)showUserNotification:(int64_t)a3 bundleID:(id)a4;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 completion:(id)a5;
- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 forPairedDevice:(id)a5 completion:(id)a6;
- (void)wakeExtensionForWatchApp:(id)a3;
@end

@implementation SPDeviceConnection

+ (id)sharedDeviceConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SPDeviceConnection_sharedDeviceConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDeviceConnection_onceToken != -1) {
    dispatch_once(&sharedDeviceConnection_onceToken, block);
  }
  v2 = (void *)sharedDeviceConnection___sharedDeviceConnection;

  return v2;
}

void __44__SPDeviceConnection_sharedDeviceConnection__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___SPDeviceConnection;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedDeviceConnection___sharedDeviceConnection;
  sharedDeviceConnection___sharedDeviceConnection = v1;

  v3 = [(id)sharedDeviceConnection___sharedDeviceConnection connectionQueue];
  dispatch_sync(v3, &__block_literal_global_3);
}

uint64_t __44__SPDeviceConnection_sharedDeviceConnection__block_invoke_2()
{
  return [(id)sharedDeviceConnection___sharedDeviceConnection createXPCConnectionIfNecessary];
}

- (SPDeviceConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)SPDeviceConnection;
  v2 = [(SPDeviceConnection *)&v8 init];
  uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  observers = v2->_observers;
  v2->_observers = (NSHashTable *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.WatchKit.connectionQueue", 0);
  connectionQueue = v2->_connectionQueue;
  v2->_connectionQueue = (OS_dispatch_queue *)v5;

  return v2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)createXPCConnectionIfNecessary
{
  uint64_t v3 = [(SPDeviceConnection *)self serverConnection];

  if (!v3)
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.companionappd" options:4096];
    [(SPDeviceConnection *)self setServerConnection:v4];

    dispatch_queue_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D322C60];
    v6 = [(SPDeviceConnection *)self serverConnection];
    [v6 setRemoteObjectInterface:v5];

    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D321D88];
    objc_super v8 = [(SPDeviceConnection *)self serverConnection];
    [v8 setExportedInterface:v7];

    v9 = [(SPDeviceConnection *)self serverConnection];
    [v9 setExportedObject:self];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke;
    v15[3] = &unk_264599930;
    objc_copyWeak(&v16, &location);
    v10 = [(SPDeviceConnection *)self serverConnection];
    [v10 setInterruptionHandler:v15];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke_80;
    v13[3] = &unk_264599930;
    objc_copyWeak(&v14, &location);
    v11 = [(SPDeviceConnection *)self serverConnection];
    [v11 setInvalidationHandler:v13];

    v12 = [(SPDeviceConnection *)self serverConnection];
    [v12 resume];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    dispatch_queue_t v5 = "-[SPDeviceConnection createXPCConnectionIfNecessary]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 124;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: SPDeviceConnection, createXPCConnection, interruptionHandler", (uint8_t *)&v4, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateXPCConnection];
}

void __52__SPDeviceConnection_createXPCConnectionIfNecessary__block_invoke_80(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    dispatch_queue_t v5 = "-[SPDeviceConnection createXPCConnectionIfNecessary]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 129;
    _os_log_impl(&dword_2211F3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: SPDeviceConnection, createXPCConnection, invalidationHandler", (uint8_t *)&v4, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateXPCConnection];
}

- (void)invalidateXPCConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SPDeviceConnection_invalidateXPCConnection__block_invoke;
  block[3] = &unk_264598C20;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __45__SPDeviceConnection_invalidateXPCConnection__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serverConnection];
  [v2 invalidate];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setServerConnection:0];
}

- (id)connectionProxy:(id)a3 caller:(const char *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  connectionQueue = self->_connectionQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__SPDeviceConnection_connectionProxy_caller___block_invoke;
  v11[3] = &unk_264599980;
  v13 = &v15;
  id v14 = a4;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(connectionQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __45__SPDeviceConnection_connectionProxy_caller___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) createXPCConnectionIfNecessary];
  v2 = [*(id *)(a1 + 32) serverConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2;
  v8[3] = &unk_264599958;
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  v8[4] = v3;
  id v9 = v4;
  uint64_t v5 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 32) invalidateXPCConnection];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchInstalledApplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__SPDeviceConnection_fetchInstalledApplicationsWithCompletion___block_invoke;
  v6[3] = &unk_2645999A8;
  id v7 = v4;
  id v5 = v4;
  [(SPDeviceConnection *)self fetchInstalledApplicationsWithErrorCompletion:v6];
}

uint64_t __63__SPDeviceConnection_fetchInstalledApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInstalledApplicationsWithErrorCompletion:(id)a3
{
}

- (void)fetchInstalledApplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchInstalledApplicationsForPairedDevice:v7 completion:v6];
}

- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__SPDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withCompletion___block_invoke;
  v8[3] = &unk_2645999A8;
  id v9 = v6;
  id v7 = v6;
  [(SPDeviceConnection *)self fetchInstalledCompatibleApplicationsWithDevice:a3 withErrorCompletion:v8];
}

uint64_t __84__SPDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withErrorCompletion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchInstalledCompatibleApplicationsWithDevice:v7 withErrorCompletion:v6];
}

- (void)fetchInstalledComplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SPDeviceConnection_fetchInstalledComplicationsWithCompletion___block_invoke;
  v6[3] = &unk_2645999A8;
  id v7 = v4;
  id v5 = v4;
  [(SPDeviceConnection *)self fetchInstalledComplicationsWithErrorCompletion:v6];
}

uint64_t __64__SPDeviceConnection_fetchInstalledComplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInstalledComplicationsWithErrorCompletion:(id)a3
{
}

- (void)fetchInstalledComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchInstalledComplicationsForPairedDevice:v7 completion:v6];
}

- (void)activeComplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SPDeviceConnection_activeComplicationsWithCompletion___block_invoke;
  v6[3] = &unk_2645999D0;
  id v7 = v4;
  id v5 = v4;
  [(SPDeviceConnection *)self activeComplicationsWithErrorCompletion:v6];
}

uint64_t __56__SPDeviceConnection_activeComplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activeComplicationsWithErrorCompletion:(id)a3
{
}

- (void)activeComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 activeComplicationsForPairedDevice:v7 completion:v6];
}

- (void)installAllApplications
{
  id v2 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  [v2 installAllApplications];
}

- (void)cancelPendingInstallations
{
  id v2 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  [v2 cancelPendingInstallations];
}

- (void)installApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__SPDeviceConnection_installApplication_completion___block_invoke;
  v11[3] = &unk_2645999F8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 installApplication:v10 onPairedDevice:0 completion:v11];
}

void __52__SPDeviceConnection_installApplication_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__SPDeviceConnection_installApplication_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 40) appInstallStateForAppConduitInstallState:a2]);
}

- (void)installApplication:(id)a3 completionWithError:(id)a4
{
}

- (void)installApplication:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F24EB0];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 sharedDeviceConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__SPDeviceConnection_installApplication_onPairedDevice_completion___block_invoke;
  v14[3] = &unk_264599A20;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v12 installApplication:v11 onPairedDevice:v10 completion:v14];
}

void __67__SPDeviceConnection_installApplication_onPairedDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [v5 appInstallStateForAppConduitInstallState:a2], v6);
}

- (void)removeApplication:(id)a3 completion:(id)a4
{
}

- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F24EB0];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 sharedDeviceConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__SPDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke;
  v14[3] = &unk_264599A48;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v12 removeApplication:v11 fromPairedDevice:v10 completion:v14];
}

uint64_t __68__SPDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) appInstallStateForAppConduitInstallState:a2];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchApplicationWithContainingApplicationBundleID:v7 completion:v6];
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 completion:(id)a4
{
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  id v7 = (void *)MEMORY[0x263F24EB0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedDeviceConnection];
  [v11 fetchInfoForApplicationWithBundleID:v10 forPairedDevice:v9 completion:v8];
}

- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:v7 completion:v6];
}

- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchWatchAppBundleIDForCompanionAppBundleID:v7 completion:v6];
}

- (void)setAlwaysInstall:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F24EB0];
  id v4 = a3;
  id v5 = [v3 sharedDeviceConnection];
  [v5 setAlwaysInstall:v4];
}

- (void)setAlwaysInstall:(id)a3 forDevice:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 setAlwaysInstall:v7 forDevice:v6];
}

- (void)getAlwaysInstallWithCompletion:(id)a3
{
}

- (void)getAlwaysInstallForPairedDevice:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 getAlwaysInstallForPairedDevice:v7 completion:v6];
}

- (void)showUserNotification:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_88, "-[SPDeviceConnection showUserNotification:bundleID:]");
    [v7 showUserNotification:a3 applicationName:v6];
  }
  else
  {
    id v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPDeviceConnection showUserNotification:bundleID:]();
    }
  }
}

- (void)showUserNotification:(int64_t)a3 applicationName:(id)a4 extensionBundleID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_90, "-[SPDeviceConnection showUserNotification:applicationName:extensionBundleID:]");
    id v11 = v10;
    if (v9)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __77__SPDeviceConnection_showUserNotification_applicationName_extensionBundleID___block_invoke_2;
      v12[3] = &unk_264599A90;
      id v13 = v9;
      id v11 = v11;
      id v14 = v11;
      int64_t v16 = a3;
      id v15 = v8;
      [v11 fetchInstalledApplicationsWithCompletion:v12];
    }
    else
    {
      [v10 showUserNotification:a3 applicationName:v8];
    }
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SPDeviceConnection showUserNotification:applicationName:extensionBundleID:]();
    }
  }
}

void __77__SPDeviceConnection_showUserNotification_applicationName_extensionBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        id v9 = [v8 objectForKeyedSubscript:@"SPPluginBundleIdKey"];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

        if (v10) {
          [*(id *)(a1 + 40) showUserNotification:*(void *)(a1 + 56) applicationName:*(void *)(a1 + 48)];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)hideUserNotification
{
  -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_96, "-[SPDeviceConnection hideUserNotification]");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 hideUserNotification];
}

- (id)localeForUserNotification
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  id v2 = (void *)getNRPairedDeviceRegistryClass_softClass_0;
  uint64_t v24 = getNRPairedDeviceRegistryClass_softClass_0;
  if (!getNRPairedDeviceRegistryClass_softClass_0)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getNRPairedDeviceRegistryClass_block_invoke_0;
    v19 = &unk_264598A90;
    id v20 = &v21;
    __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)&v16);
    id v2 = (void *)v22[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v21, 8);
  uint64_t v4 = [v3 sharedInstance];
  uint64_t v5 = [v4 getDevices];
  uint64_t v6 = [v5 firstObject];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v7 = (void *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  uint64_t v24 = getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr;
  if (!getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getNRDevicePropertyCurrentUserLocaleSymbolLoc_block_invoke;
    v19 = &unk_264598A90;
    id v20 = &v21;
    id v8 = (void *)NanoRegistryLibrary_0();
    id v9 = dlsym(v8, "NRDevicePropertyCurrentUserLocale");
    *(void *)(v20[1] + 24) = v9;
    getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr = *(void *)(v20[1] + 24);
    uint64_t v7 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v7) {
    -[SPDeviceConnection localeForUserNotification]();
  }
  int v10 = [v6 valueForProperty:*v7];
  long long v11 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v10];
  long long v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263EFF960] currentLocale];
  }
  long long v14 = v13;

  return v14;
}

- (void)wakeExtensionForWatchApp:(id)a3
{
  id v4 = a3;
  -[SPDeviceConnection connectionProxy:caller:](self, "connectionProxy:caller:", &__block_literal_global_99, "-[SPDeviceConnection wakeExtensionForWatchApp:]");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 wakeExtensionForWatchApp:v4];
}

- (void)addObserver:(id)a3
{
  id v3 = (void *)MEMORY[0x263F24EB0];
  id v4 = a3;
  id v5 = [v3 sharedDeviceConnection];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v3 = (void *)MEMORY[0x263F24EB0];
  id v4 = a3;
  id v5 = [v3 sharedDeviceConnection];
  [v5 removeObserver:v4];
}

- (void)_enumerateObserversSafely:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = (void *)MEMORY[0x263F24EB0];
  id v11 = a4;
  long long v12 = [v10 sharedDeviceConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke;
  v15[3] = &unk_2645999F8;
  uint64_t v17 = self;
  id v18 = v9;
  id v16 = v8;
  id v13 = v9;
  id v14 = v8;
  [v12 installApplication:v14 withProvisioningProfiles:v11 onPairedDevice:0 completion:v15];
}

void __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 40) appInstallStateForAppConduitInstallState:a2]);
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  long long v12 = (void *)MEMORY[0x263F24EB0];
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [v12 sharedDeviceConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke;
  v18[3] = &unk_2645999F8;
  id v20 = self;
  id v21 = v11;
  id v19 = v10;
  id v16 = v11;
  id v17 = v10;
  [v15 installApplication:v17 withProvisioningProfiles:v14 onPairedDevice:v13 completion:v18];
}

void __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 40) appInstallStateForAppConduitInstallState:a2]);
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completionWithError:(id)a5
{
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completionWithError:(id)a6
{
  id v10 = a6;
  id v11 = (void *)MEMORY[0x263F24EB0];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v11 sharedDeviceConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __101__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completionWithError___block_invoke;
  v17[3] = &unk_264599A20;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  [v15 installApplication:v14 withProvisioningProfiles:v13 onPairedDevice:v12 completion:v17];
}

void __101__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completionWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [v5 appInstallStateForAppConduitInstallState:a2], v6);
}

- (void)installProvisioningProfileWithURL:(id)a3 completion:(id)a4
{
}

- (void)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F24EB0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedDeviceConnection];
  [v11 installProvisioningProfileWithURL:v10 onPairedDevice:v9 completion:v8];
}

- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4
{
}

- (void)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F24EB0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedDeviceConnection];
  [v11 removeProvisioningProfileWithID:v10 fromPairedDevice:v9 completion:v8];
}

- (void)fetchProvisioningProfilesWithCompletion:(id)a3
{
}

- (void)fetchProvisioningProfilesForPairedDevice:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F24EB0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDeviceConnection];
  [v8 fetchProvisioningProfilesForPairedDevice:v7 completion:v6];
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4
{
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  id v7 = (void *)MEMORY[0x263F24EB0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedDeviceConnection];
  [v11 fetchProvisioningProfilesForApplicationWithBundleID:v10 forPairedDevice:v9 completion:v8];
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 completion:(id)a5
{
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 forPairedDevice:(id)a5 completion:(id)a6
{
  id v9 = (void *)MEMORY[0x263F24EB0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 sharedDeviceConnection];
  [v14 updatePreferencesForApplicationWithIdentifier:v13 preferences:v12 forPairedDevice:v11 completion:v10];
}

- (int64_t)appInstallStateForAppConduitInstallState:(int64_t)a3
{
  int64_t v3 = a3;
  if ((unint64_t)a3 >= 0xF)
  {
    uint64_t v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SPDeviceConnection appInstallStateForAppConduitInstallState:]();
    }

    return 0;
  }
  return v3;
}

- (SPDeviceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPDeviceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServerConnection:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __45__SPDeviceConnection_connectionProxy_caller___block_invoke_2_cold_1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s - error: %{public}@", v2);
}

void __52__SPDeviceConnection_installApplication_completion___block_invoke_cold_1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: installApplication for %{public}@, failed with: %{public}@", v2);
}

- (void)showUserNotification:bundleID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)int64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v3[7] = 373;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_2211F3000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%d: SPDeviceConnection, nil application name for notification %d", (uint8_t *)v3, 0x18u);
}

- (void)showUserNotification:applicationName:extensionBundleID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)int64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v3[7] = 382;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_2211F3000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%d: SPDeviceConnection, nil application name for notification %d", (uint8_t *)v3, 0x18u);
}

- (void)localeForUserNotification
{
  __int16 v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyCurrentUserLocale(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SPDeviceConnection.m", 53, @"%s", dlerror());

  __break(1u);
}

void __77__SPDeviceConnection_installApplication_withProvisioningProfiles_completion___block_invoke_cold_1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: installApplication for %{public}@, withProfiles, failed with: %{public}@", v2);
}

void __92__SPDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke_cold_1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: installApplication for %{public}@, withProfiles, failed with: %{public}@", v2);
}

- (void)appInstallStateForAppConduitInstallState:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)int v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v2[7] = 568;
  v2[9] = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_2211F3000, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to map ACXApplicationInstallState : %ld, returning SPApplicationInstallStateError", (uint8_t *)v2, 0x1Cu);
}

@end