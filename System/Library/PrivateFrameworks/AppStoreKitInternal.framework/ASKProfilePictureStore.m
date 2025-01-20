@interface ASKProfilePictureStore
+ (ASKProfilePictureStore)sharedStore;
- (AAUIProfilePictureStore)profilePictureStore;
- (ACAccountStore)accountStore;
- (ASKProfilePictureStore)init;
- (BOOL)hasRequestedImages;
- (NSString)primaryAccountFullName;
- (NSString)primaryAccountName;
- (NSString)storeAccountFullName;
- (NSString)storeAccountName;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)notificationQueue;
- (id)_profilePictureForFamilyMember:(id)a3 withProfilePictureStore:(id)a4 usingMonogrammer:(id)a5;
- (void)_markAsHasRequestedImages;
- (void)appleAccountsDidChange:(id)a3;
- (void)configureProfilePictureStoreAndNotifyIfNeeded;
- (void)dealloc;
- (void)notifyIfNeeded;
- (void)profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter:(double)a3 completion:(id)a4;
- (void)profilePictureStoreDidChange:(id)a3;
- (void)profilePictureWithMonogramFallbackForFamilyMembers:(id)a3 pictureDiameter:(double)a4 completion:(id)a5;
- (void)setAccessQueue:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setHasRequestedImages:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setPrimaryAccountFullName:(id)a3;
- (void)setPrimaryAccountName:(id)a3;
- (void)setProfilePictureStore:(id)a3;
- (void)setStoreAccountFullName:(id)a3;
- (void)setStoreAccountName:(id)a3;
- (void)storeAccountsDidChange:(id)a3;
@end

@implementation ASKProfilePictureStore

uint64_t __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __30__ASKProfilePictureStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained configureProfilePictureStoreAndNotifyIfNeeded];
}

void __37__ASKProfilePictureStore_sharedStore__block_invoke()
{
  v0 = objc_alloc_init(ASKProfilePictureStore);
  v1 = (void *)sharedStore_instance;
  sharedStore_instance = (uint64_t)v0;
}

- (ASKProfilePictureStore)init
{
  v19.receiver = self;
  v19.super_class = (Class)ASKProfilePictureStore;
  v2 = [(ASKProfilePictureStore *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AppStoreKitInternal.ASKProfilePictureStore.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("AppStoreKitInternal.ASKProfilePictureStore.notificationQueue", MEMORY[0x1E4F14430]);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = *MEMORY[0x1E4F17728];
    [v9 addObserver:v2 selector:sel_appleAccountsDidChange_ name:*MEMORY[0x1E4F17728] object:v2->_accountStore];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    [v11 addObserver:v2 selector:sel_storeAccountsDidChange_ name:v10 object:v12];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_profilePictureStoreDidChange_ name:*MEMORY[0x1E4F4C060] object:0];

    objc_initWeak(&location, v2);
    v14 = [(ASKProfilePictureStore *)v2 accessQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__ASKProfilePictureStore_init__block_invoke;
    v16[3] = &unk_1E6DA8AF8;
    objc_copyWeak(&v17, &location);
    dispatch_async(v14, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)configureProfilePictureStoreAndNotifyIfNeeded
{
  dispatch_queue_t v3 = [(ASKProfilePictureStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(ASKProfilePictureStore *)self accountStore];
  objc_msgSend(v4, "aa_primaryAppleAccount");
  id v42 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v5 = [v42 username];
  v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
  v8 = [v7 username];

  v9 = [(ASKProfilePictureStore *)self primaryAccountName];
  uint64_t v10 = [v9 length];
  if (v10 == [v5 length])
  {
    int v11 = 0;
  }
  else
  {
    v12 = [(ASKProfilePictureStore *)self primaryAccountName];
    int v11 = [v12 isEqualToString:v5] ^ 1;
  }
  v13 = [(ASKProfilePictureStore *)self storeAccountName];
  uint64_t v14 = [v13 length];
  if (v14 == [v8 length])
  {
    HIDWORD(v39) = 0;
  }
  else
  {
    v15 = [(ASKProfilePictureStore *)self storeAccountName];
    HIDWORD(v39) = [v15 isEqualToString:v8] ^ 1;
  }
  if ([v5 length]) {
    LODWORD(v39) = [v8 length] != 0;
  }
  else {
    LODWORD(v39) = 0;
  }
  v16 = objc_msgSend(v42, "userFullName", v39);
  id v17 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v18 = objc_msgSend(v17, "ams_activeiTunesAccount");
  objc_super v19 = [v18 userFullName];

  v20 = [(ASKProfilePictureStore *)self primaryAccountFullName];
  uint64_t v21 = [v20 length];
  if (v21 == [v16 length])
  {
    int v22 = 0;
  }
  else
  {
    v23 = [(ASKProfilePictureStore *)self primaryAccountFullName];
    int v22 = [v23 isEqualToString:v16] ^ 1;
  }
  v24 = [(ASKProfilePictureStore *)self storeAccountFullName];
  uint64_t v25 = [v24 length];
  if (v25 == [v19 length])
  {
    int v26 = 0;
  }
  else
  {
    v27 = [(ASKProfilePictureStore *)self storeAccountFullName];
    int v26 = [v27 isEqualToString:v19] ^ 1;
  }
  int v28 = v11 | v22;
  if ([v8 caseInsensitiveCompare:v5]) {
    BOOL v29 = [v19 caseInsensitiveCompare:v16] != 0;
  }
  else {
    BOOL v29 = 0;
  }
  [(ASKProfilePictureStore *)self setPrimaryAccountFullName:v16];
  [(ASKProfilePictureStore *)self setStoreAccountFullName:v19];
  v30 = [(ASKProfilePictureStore *)self profilePictureStore];

  BOOL v31 = v30 == 0;
  if (!v40) {
    BOOL v31 = v30 != 0;
  }
  int v32 = v28 | v41 | v26;
  if ((v32 & 1) != 0 || v31)
  {
    [(ASKProfilePictureStore *)self setPrimaryAccountName:v5];
    [(ASKProfilePictureStore *)self setStoreAccountName:v8];
    if ((v40 ^ 1 | v29))
    {
      [(ASKProfilePictureStore *)self setProfilePictureStore:0];
      if (!v32) {
        goto LABEL_28;
      }
    }
    else
    {
      v33 = [(ASKProfilePictureStore *)self accountStore];
      v34 = objc_msgSend(v33, "aida_accountForiCloudAccount:", v42);

      id v35 = objc_alloc(MEMORY[0x1E4F4C068]);
      v36 = [(ASKProfilePictureStore *)self accountStore];
      v37 = (void *)[v35 initWithAppleAccount:v42 grandSlamAccount:v34 accountStore:v36];
      [(ASKProfilePictureStore *)self setProfilePictureStore:v37];

      v38 = [(ASKProfilePictureStore *)self profilePictureStore];
      [v38 setMonogramType:0];

      if (!v32) {
        goto LABEL_28;
      }
    }
    [(ASKProfilePictureStore *)self notifyIfNeeded];
  }
LABEL_28:
}

void __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _markAsHasRequestedImages];
  dispatch_queue_t v3 = [WeakRetained profilePictureStore];

  if (v3)
  {
    double v4 = *(double *)(a1 + 48);
    dispatch_queue_t v5 = [WeakRetained profilePictureStore];
    [v5 setPictureDiameter:v4];

    v6 = [WeakRetained profilePictureStore];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_2;
    v10[3] = &unk_1E6DA8B48;
    v7 = &v11;
    id v11 = *(id *)(a1 + 32);
    [v6 profilePictureForAccountOwnerWithCompletion:v10];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_4;
    v8[3] = &unk_1E6DA8B70;
    v7 = &v9;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

- (AAUIProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)_markAsHasRequestedImages
{
  if (![(ASKProfilePictureStore *)self hasRequestedImages])
  {
    [(ASKProfilePictureStore *)self setHasRequestedImages:1];
  }
}

- (BOOL)hasRequestedImages
{
  return self->_hasRequestedImages;
}

- (void)profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter:(double)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = [(ASKProfilePictureStore *)self accessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke;
  v9[3] = &unk_1E6DA8B98;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSString)storeAccountName
{
  return self->_storeAccountName;
}

- (NSString)storeAccountFullName
{
  return self->_storeAccountFullName;
}

- (void)setStoreAccountFullName:(id)a3
{
}

- (void)setPrimaryAccountFullName:(id)a3
{
}

- (void)setHasRequestedImages:(BOOL)a3
{
  self->_hasRequestedImages = a3;
}

- (NSString)primaryAccountName
{
  return self->_primaryAccountName;
}

- (NSString)primaryAccountFullName
{
  return self->_primaryAccountFullName;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

+ (ASKProfilePictureStore)sharedStore
{
  if (sharedStore_onceToken[0] != -1) {
    dispatch_once(sharedStore_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedStore_instance;
  return (ASKProfilePictureStore *)v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASKProfilePictureStore;
  [(ASKProfilePictureStore *)&v4 dealloc];
}

- (void)notifyIfNeeded
{
  dispatch_queue_t v3 = [(ASKProfilePictureStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if ([(ASKProfilePictureStore *)self hasRequestedImages])
  {
    objc_initWeak(&location, self);
    objc_super v4 = [(ASKProfilePictureStore *)self notificationQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke;
    v5[3] = &unk_1E6DA8AF8;
    objc_copyWeak(&v6, &location);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASKProfilePictureStoreDidChange" object:WeakRetained];
}

- (void)appleAccountsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke;
  v6[3] = &unk_1E6DA8AF8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  [WeakRetained setAccountStore:v1];

  [WeakRetained setProfilePictureStore:0];
  [WeakRetained configureProfilePictureStoreAndNotifyIfNeeded];
}

- (void)storeAccountsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke;
  v6[3] = &unk_1E6DA8AF8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained configureProfilePictureStoreAndNotifyIfNeeded];
}

- (void)profilePictureStoreDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke;
  v6[3] = &unk_1E6DA8AF8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyIfNeeded];
}

void __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_3;
  v6[3] = &unk_1E6DA8B20;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __106__ASKProfilePictureStore_profilePictureForAccountOwnerWithMonogramFallbackWithPictureDiameter_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)profilePictureWithMonogramFallbackForFamilyMembers:(id)a3 pictureDiameter:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(ASKProfilePictureStore *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke;
  block[3] = &unk_1E6DA8BC0;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = *(double *)(a1 + 56);
  id v4 = [WeakRetained profilePictureStore];
  [v4 setPictureDiameter:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1BBE8]) initWithStyle:0 diameter:*(double *)(a1 + 56)];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = a1;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v12 isCurrentSignedInUser])
        {
          v13 = [WeakRetained profilePictureStore];
          id v14 = [v13 profilePictureForAccountOwnerWithoutMonogramFallback];

          if (v14) {
            goto LABEL_9;
          }
        }
        id v15 = [WeakRetained profilePictureStore];
        id v14 = [WeakRetained _profilePictureForFamilyMember:v12 withProfilePictureStore:v15 usingMonogrammer:v6];

        if (v14)
        {
LABEL_9:
          v16 = [v12 iTunesDSID];

          if (v16)
          {
            id v17 = [v12 iTunesDSID];
            [v5 setObject:v14 forKeyedSubscript:v17];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  [WeakRetained _markAsHasRequestedImages];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke_2;
  block[3] = &unk_1E6DA8B20;
  id v18 = *(id *)(v20 + 40);
  id v22 = v5;
  id v23 = v18;
  id v19 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __104__ASKProfilePictureStore_profilePictureWithMonogramFallbackForFamilyMembers_pictureDiameter_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_profilePictureForFamilyMember:(id)a3 withProfilePictureStore:(id)a4 usingMonogrammer:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F4BFB8];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  id v12 = [v7 firstName];
  [v11 setFirstName:v12];

  v13 = [v7 lastName];
  [v11 setLastName:v13];

  id v14 = [v7 iCloudDSID];
  [v11 setPersonID:v14];

  id v15 = [v7 iCloudUsername];
  [v11 setAppleID:v15];

  v16 = [v10 profilePictureForFamilyMember:v11];

  if (v8 && !v16)
  {
    id v17 = [v7 firstName];
    id v18 = [v7 lastName];
    v16 = [v8 monogramForPersonWithFirstName:v17 lastName:v18];
  }
  return v16;
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void)setAccountStore:(id)a3
{
}

- (void)setProfilePictureStore:(id)a3
{
}

- (void)setPrimaryAccountName:(id)a3
{
}

- (void)setStoreAccountName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccountFullName, 0);
  objc_storeStrong((id *)&self->_primaryAccountFullName, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_primaryAccountName, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end