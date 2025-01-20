@interface ASKStorefrontChangeProvider
- (ACAccount)activeAccount;
- (ACAccount)localAccount;
- (ACAccountStore)accountStore;
- (ASKStorefrontChangeProvider)initWithBlock:(id)a3;
- (BOOL)hasManagedStateChangedFromAccount:(id)a3 toAccount:(id)a4;
- (BOOL)hasStorefrontChangedFromAccount:(id)a3 toAccount:(id)a4;
- (OS_dispatch_queue)notifyQueue;
- (id)block;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setActiveAccount:(id)a3;
- (void)setLocalAccount:(id)a3;
@end

@implementation ASKStorefrontChangeProvider

- (ASKStorefrontChangeProvider)initWithBlock:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ASKStorefrontChangeProvider;
  v5 = [(ASKStorefrontChangeProvider *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    dispatch_queue_t v8 = dispatch_queue_create("ASKStorefrontChangeProvider", 0);
    notifyQueue = v5->_notifyQueue;
    v5->_notifyQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v10;

    v12 = [(ASKStorefrontChangeProvider *)v5 accountStore];
    uint64_t v13 = objc_msgSend(v12, "ams_activeiTunesAccount");
    activeAccount = v5->_activeAccount;
    v5->_activeAccount = (ACAccount *)v13;

    v15 = [(ASKStorefrontChangeProvider *)v5 accountStore];
    v16 = objc_msgSend(v15, "ams_fetchLocaliTunesAccount");

    objc_initWeak(&location, v5);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke;
    v23 = &unk_1E6DA8910;
    objc_copyWeak(&v24, &location);
    [v16 addSuccessBlock:&v20];
    v17 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v20, v21, v22, v23);
    v18 = [(ASKStorefrontChangeProvider *)v5 accountStore];
    [v17 addObserver:v5 selector:sel_accountStoreDidChange_ name:*MEMORY[0x1E4F17728] object:v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

void __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLocalAccount:*(void *)(a1 + 32)];
}

- (void)setLocalAccount:(id)a3
{
}

void __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke_2;
  v5[3] = &unk_1E6DA88E8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F17728];
  v5 = [(ASKStorefrontChangeProvider *)self accountStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)ASKStorefrontChangeProvider;
  [(ASKStorefrontChangeProvider *)&v6 dealloc];
}

- (BOOL)hasStorefrontChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "ams_storefront");
  uint64_t v7 = objc_msgSend(v5, "ams_storefront");

  if (v6 | v7) {
    int v8 = [(id)v6 isEqual:v7] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)hasManagedStateChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 accountPropertyForKey:@"isManagedAppleID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  char v8 = [v7 BOOLValue];
  v9 = [v5 accountPropertyForKey:@"isManagedAppleID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  char v11 = [v10 BOOLValue];
  return v8 ^ v11;
}

- (void)accountStoreDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ASKStorefrontChangeProvider *)self accountStore];
  uint64_t v6 = objc_msgSend(v5, "ams_fetchLocaliTunesAccount");

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke;
  v7[3] = &unk_1E6DA8988;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v6 addSuccessBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_2;
  block[3] = &unk_1E6DA8960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained localAccount];
  id v4 = a1[4];
  id v5 = [WeakRetained activeAccount];
  uint64_t v6 = [WeakRetained accountStore];
  id v7 = objc_msgSend(v6, "ams_activeiTunesAccount");

  uint64_t v8 = [a1[5] notifyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_3;
  block[3] = &unk_1E6DA8938;
  void block[4] = WeakRetained;
  id v14 = v3;
  id v15 = v4;
  id v16 = v5;
  id v17 = v7;
  id v9 = v7;
  id v10 = v5;
  id v11 = v4;
  id v12 = v3;
  dispatch_async(v8, block);

  [WeakRetained setLocalAccount:v11];
  [WeakRetained setActiveAccount:v9];
}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasStorefrontChangedFromAccount:*(void *)(a1 + 40) toAccount:*(void *)(a1 + 48)] & 1) != 0|| objc_msgSend(*(id *)(a1 + 32), "hasManagedStateChangedFromAccount:toAccount:", *(void *)(a1 + 56), *(void *)(a1 + 64)))
  {
    v2 = [*(id *)(a1 + 32) block];
    v2[2]();
  }
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (ACAccount)localAccount
{
  return self->_localAccount;
}

- (ACAccount)activeAccount
{
  return self->_activeAccount;
}

- (void)setActiveAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end