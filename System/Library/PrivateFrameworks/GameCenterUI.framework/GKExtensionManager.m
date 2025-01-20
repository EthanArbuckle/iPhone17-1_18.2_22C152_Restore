@interface GKExtensionManager
- (BOOL)needToLoadExtension;
- (GKExtensionHostViewController)extensionHostViewController;
- (GKExtensionManager)initWithExtensionBundleIdentifer:(id)a3 host:(id)a4;
- (NSString)extensionIdentifier;
- (OS_dispatch_queue)stateQueue;
- (int64_t)extensionLoadState;
- (void)extensionDidTerminateWithError:(id)a3;
- (void)instantiateViewControllerWithHost:(id)a3 handler:(id)a4;
- (void)setExtensionHostViewController:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setExtensionLoadState:(int64_t)a3;
- (void)setStateQueue:(id)a3;
@end

@implementation GKExtensionManager

- (GKExtensionManager)initWithExtensionBundleIdentifer:(id)a3 host:(id)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKExtensionManager;
  v6 = [(GKExtensionManager *)&v9 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.gamecenter.extension_state_queue", MEMORY[0x1E4F14430]);
    [(GKExtensionManager *)v6 setStateQueue:v7];

    [(GKExtensionManager *)v6 setExtensionIdentifier:v5];
  }

  return v6;
}

- (void)instantiateViewControllerWithHost:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(GKExtensionManager *)self setExtensionLoadState:1];
  v8 = (void *)MEMORY[0x1E4F636D8];
  objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKExtensionManager.m", 57, "-[GKExtensionManager instantiateViewControllerWithHost:handler:]");
  v10 = [v8 dispatchGroupWithName:v9];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke;
  v20[3] = &unk_1E5F62F28;
  v20[4] = self;
  id v11 = v10;
  id v21 = v11;
  [v11 perform:v20];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3;
  v15[3] = &unk_1E5F63FF0;
  id v16 = v11;
  v17 = self;
  id v18 = v6;
  id v19 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v11;
  [v14 notifyOnMainQueueWithBlock:v15];
}

void __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = (void *)MEMORY[0x1E4F28C70];
  id v5 = [*(id *)(a1 + 32) extensionIdentifier];
  id v11 = 0;
  id v6 = [v4 _gkExtensionWithIdentifier:v5 error:&v11];
  id v7 = v11;

  if (v7)
  {
    [*(id *)(a1 + 40) setError:v7];
    v3[2](v3);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_2;
    v8[3] = &unk_1E5F64DA0;
    id v9 = *(id *)(a1 + 40);
    v10 = v3;
    [v6 instantiateViewControllerWithInputItems:0 connectionHandler:v8];
  }
}

uint64_t __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 setError:a4];
  [*(id *)(a1 + 32) setResult:v7];

  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

void __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3(uint64_t a1)
{
  v2 = (void **)(a1 + 32);
  v3 = [*(id *)(a1 + 32) error];

  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    id v5 = (void *)*MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3_cold_1(v2, v5);
    }
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = 0;
  }
  else
  {
    v8 = [*v2 result];

    if (!v8) {
      goto LABEL_10;
    }
    id v9 = [*(id *)(a1 + 32) result];
    [*(id *)(a1 + 40) setExtensionHostViewController:v9];

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 40) extensionHostViewController];
    [v11 setHostViewController:v10];

    id v12 = *(void **)(a1 + 40);
    id v13 = [v12 extensionHostViewController];
    [v13 setDelegate:v12];

    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = 2;
  }
  [v6 setExtensionLoadState:v7];
LABEL_10:
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14)
  {
    v15 = [*v2 result];
    id v16 = [*v2 error];
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);
  }
}

- (int64_t)extensionLoadState
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(GKExtensionManager *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__GKExtensionManager_extensionLoadState__block_invoke;
  v6[3] = &unk_1E5F64DC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__GKExtensionManager_extensionLoadState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setExtensionLoadState:(int64_t)a3
{
  id v5 = [(GKExtensionManager *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__GKExtensionManager_setExtensionLoadState___block_invoke;
  v6[3] = &unk_1E5F64DF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __44__GKExtensionManager_setExtensionLoadState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 8) = *(void *)(result + 40);
  return result;
}

- (BOOL)needToLoadExtension
{
  return [(GKExtensionManager *)self extensionLoadState] == 0;
}

- (void)extensionDidTerminateWithError:(id)a3
{
  [(GKExtensionManager *)self setExtensionLoadState:0];

  [(GKExtensionManager *)self setExtensionHostViewController:0];
}

- (GKExtensionHostViewController)extensionHostViewController
{
  return self->_extensionHostViewController;
}

- (void)setExtensionHostViewController:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);

  objc_storeStrong((id *)&self->_extensionHostViewController, 0);
}

void __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3_cold_1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *a1;
  v3 = a2;
  int64_t v4 = [v2 error];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1AF250000, v3, OS_LOG_TYPE_ERROR, "Error instantiating remote view controller: %@", (uint8_t *)&v5, 0xCu);
}

@end