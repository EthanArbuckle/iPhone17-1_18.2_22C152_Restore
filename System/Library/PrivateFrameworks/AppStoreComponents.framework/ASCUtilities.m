@interface ASCUtilities
+ (ASCUtilities)shared;
+ (void)withSharedUtilities:(id)a3 perform:(id)a4;
- (ASCPendingPromises)pendingPromises;
- (ASCServices)connection;
- (ASCUtilities)initWithConnection:(id)a3;
- (id)openURL:(id)a3;
- (id)restoreAppStore;
- (void)daemonConnectionWasLost:(id)a3;
- (void)dealloc;
@end

@implementation ASCUtilities

+ (ASCUtilities)shared
{
  v2 = (void *)ASCUtilities_testingUtilities;
  if (!ASCUtilities_testingUtilities)
  {
    if (shared_onceToken != -1) {
      dispatch_once(&shared_onceToken, &__block_literal_global_29);
    }
    v2 = (void *)shared_sharedUtilities;
  }
  id v3 = v2;

  return (ASCUtilities *)v3;
}

void __22__ASCUtilities_shared__block_invoke()
{
  v0 = [ASCUtilities alloc];
  id v3 = +[ASCServicesConnection sharedConnection];
  uint64_t v1 = [(ASCUtilities *)v0 initWithConnection:v3];
  v2 = (void *)shared_sharedUtilities;
  shared_sharedUtilities = v1;
}

- (ASCUtilities)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASCUtilities;
  v6 = [(ASCUtilities *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(ASCPendingPromises);
    pendingPromises = v7->_pendingPromises;
    v7->_pendingPromises = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel_daemonConnectionWasLost_ name:0x1F1E052D8 object:v5];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel_daemonConnectionWasLost_ name:0x1F1E052F8 object:v5];
  }
  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCUtilities;
  [(ASCUtilities *)&v4 dealloc];
}

+ (void)withSharedUtilities:(id)a3 perform:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(void))a4;
  id v7 = (id)ASCUtilities_testingUtilities;
  objc_storeStrong((id *)&ASCUtilities_testingUtilities, a3);
  v6[2](v6);
  v8 = (void *)ASCUtilities_testingUtilities;
  ASCUtilities_testingUtilities = (uint64_t)v7;
}

- (void)daemonConnectionWasLost:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"Connection to daemon was lost";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = (void *)[v4 initWithDomain:@"ASCUtilitiesErrorDomain" code:0 userInfo:v5];

  id v7 = [(ASCUtilities *)self pendingPromises];
  [v7 finishAllWithError:v6];
}

- (id)openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCUtilities *)self pendingPromises];
  objc_initWeak(&location, v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  id v7 = [(ASCUtilities *)self connection];
  uint64_t v8 = [v7 utilityService];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __24__ASCUtilities_openURL___block_invoke;
  v17[3] = &unk_1E645EC28;
  objc_copyWeak(&v20, &location);
  id v9 = v6;
  id v18 = v9;
  id v10 = v4;
  id v19 = v10;
  [v8 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __24__ASCUtilities_openURL___block_invoke_3;
  v15[3] = &unk_1E645D738;
  id v11 = v9;
  id v16 = v11;
  [v8 addErrorBlock:v15];
  v12 = v16;
  id v13 = v11;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

void __24__ASCUtilities_openURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addBinaryPromise:*(void *)(a1 + 32)];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__ASCUtilities_openURL___block_invoke_2;
  v7[3] = &unk_1E645D738;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v4 openURL:v6 withReplyHandler:v7];
}

uint64_t __24__ASCUtilities_openURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __24__ASCUtilities_openURL___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)restoreAppStore
{
  id v3 = [(ASCUtilities *)self pendingPromises];
  objc_initWeak(&location, v3);

  id v4 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  id v5 = [(ASCUtilities *)self connection];
  uint64_t v6 = [v5 utilityService];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__ASCUtilities_restoreAppStore__block_invoke;
  v14[3] = &unk_1E645EC50;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v15 = v7;
  [v6 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__ASCUtilities_restoreAppStore__block_invoke_3;
  v12[3] = &unk_1E645D738;
  id v8 = v7;
  id v13 = v8;
  [v6 addErrorBlock:v12];
  id v9 = v13;
  id v10 = v8;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __31__ASCUtilities_restoreAppStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addBinaryPromise:*(void *)(a1 + 32)];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__ASCUtilities_restoreAppStore__block_invoke_2;
  v6[3] = &unk_1E645D738;
  id v7 = *(id *)(a1 + 32);
  [v4 restoreAppStoreWithReplyHandler:v6];
}

uint64_t __31__ASCUtilities_restoreAppStore__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __31__ASCUtilities_restoreAppStore__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCPendingPromises)pendingPromises
{
  return self->_pendingPromises;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPromises, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end