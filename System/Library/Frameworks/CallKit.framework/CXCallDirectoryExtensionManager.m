@interface CXCallDirectoryExtensionManager
- (CXCallDirectoryExtensionManager)init;
- (CXCallDirectoryExtensionManagerDelegate)delegate;
- (CXCallDirectoryManager)manager;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (int)storeExtensionsChangedNotifyToken;
- (void)_extensionsChanged;
- (void)beginObservingExtensions;
- (void)dealloc;
- (void)extensionsWithCompletionHandler:(id)a3;
- (void)getLastUpdatedCallDirectoryInfoWithReply:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setEnabled:(BOOL)a3 forExtension:(id)a4 completion:(id)a5;
- (void)setPrioritizedExtensionIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setQueue:(id)a3;
- (void)setStoreExtensionsChangedNotifyToken:(int)a3;
@end

@implementation CXCallDirectoryExtensionManager

- (CXCallDirectoryExtensionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CXCallDirectoryExtensionManager;
  v2 = [(CXCallDirectoryExtensionManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.calldirectoryextensionmanager", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(CXCallDirectoryManager);
    manager = v2->_manager;
    v2->_manager = v5;
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_storeExtensionsChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)CXCallDirectoryExtensionManager;
  [(CXCallDirectoryExtensionManager *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CXCallDirectoryExtensionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CXCallDirectoryExtensionManager_setDelegate_queue___block_invoke;
  block[3] = &unk_1E5CADD08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

uint64_t __53__CXCallDirectoryExtensionManager_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F14428];
  }
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (void)beginObservingExtensions
{
  objc_super v3 = [(CXCallDirectoryExtensionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(int **)(a1 + 32);
  objc_super v3 = [v2 queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke_2;
  v4[3] = &unk_1E5CAE330;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.callkit.calldirectorystore.extensionschanged", v2 + 2, v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _extensionsChanged];
}

- (void)extensionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallDirectoryExtensionManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5CAE5D0;
  id v4 = *(id *)(a1 + 40);
  [v2 getExtensionsWithCompletionHandler:v3];
}

void __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_extensionsChanged
{
  objc_super v3 = [(CXCallDirectoryExtensionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CXCallDirectoryExtensionManager *)self delegateQueue];

  if (v4)
  {
    id v5 = [(CXCallDirectoryExtensionManager *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__CXCallDirectoryExtensionManager__extensionsChanged__block_invoke;
    block[3] = &unk_1E5CADD30;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __53__CXCallDirectoryExtensionManager__extensionsChanged__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 extensionsChangedForCallDirectoryExtensionManager:*(void *)(a1 + 32)];
}

- (void)setPrioritizedExtensionIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "prioritizedExtensionIdentifiers: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(CXCallDirectoryExtensionManager *)self manager];
  [v9 setPrioritizedExtensionIdentifiers:v6 completionHandler:v7];
}

- (void)setEnabled:(BOOL)a3 forExtension:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  switch([v8 state])
  {
    case 1:
    case 2:
      if (v6) {
        goto LABEL_19;
      }
      int v10 = CXDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:](v8);
      }
      uint64_t v11 = 6;
      goto LABEL_16;
    case 3:
      int v10 = CXDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:](v6, v8);
      }
      uint64_t v11 = 7;
      goto LABEL_16;
    case 4:
      if (!v6) {
        goto LABEL_19;
      }
      int v10 = CXDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:](v8);
      }
      uint64_t v11 = 101;
LABEL_16:

      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", v11);
      if (v12)
      {
        id v13 = (void *)v12;
        if (v9) {
          v9[2](v9, v12);
        }
      }
      else
      {
LABEL_19:
        v14 = CXDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          BOOL v22 = v6;
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_impl(&dword_1A6E3A000, v14, OS_LOG_TYPE_DEFAULT, "Setting enabled to %d for extension %@", buf, 0x12u);
        }

        v15 = [(CXCallDirectoryExtensionManager *)self manager];
        v16 = [v8 identifier];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke;
        v17[3] = &unk_1E5CAE5F8;
        id v18 = v8;
        BOOL v20 = v6;
        v19 = v9;
        [v15 setEnabled:v6 forExtensionWithIdentifier:v16 completionHandler:v17];

        id v13 = 0;
      }

      return;
    case 5:
      int v10 = CXDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:](v6, v8);
      }
      uint64_t v11 = 102;
      goto LABEL_16;
    default:
      goto LABEL_19;
  }
}

void __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)getLastUpdatedCallDirectoryInfoWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "getLastUpdatedCallDirectoryInfoWithReply", v7, 2u);
  }

  BOOL v6 = [(CXCallDirectoryExtensionManager *)self manager];
  [v6 getLastUpdatedCallDirectoryInfoWithCompletionHandler:v4];
}

- (CXCallDirectoryManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CXCallDirectoryExtensionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallDirectoryExtensionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (int)storeExtensionsChangedNotifyToken
{
  return self->_storeExtensionsChangedNotifyToken;
}

- (void)setStoreExtensionsChangedNotifyToken:(int)a3
{
  self->_storeExtensionsChangedNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

void __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error getting extensions: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setEnabled:(void *)a1 forExtension:completion:.cold.1(void *a1)
{
  [a1 state];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1A6E3A000, v1, v2, "Not setting enabled to %d since state is %ld", v3, v4, v5, v6, 0);
}

- (void)setEnabled:(uint64_t)a1 forExtension:(void *)a2 completion:.cold.2(uint64_t a1, void *a2)
{
  [a2 state];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1A6E3A000, v2, v3, "Not setting enabled to %d since state is %ld", v4, v5, v6, v7, 0);
}

- (void)setEnabled:(void *)a1 forExtension:completion:.cold.3(void *a1)
{
  [a1 state];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1A6E3A000, v1, v2, "Not setting enabled to %d since state is %ld", v3, v4, v5, v6, 0);
}

void __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  int v7 = *(unsigned __int8 *)(a1 + 48);
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 1024;
  int v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1A6E3A000, a3, OS_LOG_TYPE_ERROR, "Error setting enabled of extension with identifier %@ to %d: %@", (uint8_t *)&v8, 0x1Cu);
}

@end