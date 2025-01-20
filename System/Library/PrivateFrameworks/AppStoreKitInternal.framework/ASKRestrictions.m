@interface ASKRestrictions
- (ACAccountStore)accountStore;
- (ASKRestrictions)initWithAccountStore:(id)a3;
- (BOOL)hasManagedAppleID;
- (BOOL)isAccountModificationRestricted;
- (BOOL)isAppInstallationAllowed;
- (BOOL)isAppUninstallationAllowed;
- (BOOL)isRunningInStoreDemoMode;
- (OS_dispatch_queue)queue;
- (int64_t)maximumAppContentRating;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)updateRestrictionsAndNotifyIfNeeded;
- (void)updateRestrictionsWithCompletionBlock:(id)a3;
@end

@implementation ASKRestrictions

- (int64_t)maximumAppContentRating
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(ASKRestrictions *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__ASKRestrictions_maximumAppContentRating__block_invoke;
  v6[3] = &unk_1E6DA9020;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isRunningInStoreDemoMode
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ASKRestrictions *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ASKRestrictions_isRunningInStoreDemoMode__block_invoke;
  v5[3] = &unk_1E6DA9020;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isAppInstallationAllowed
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ASKRestrictions *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ASKRestrictions_isAppInstallationAllowed__block_invoke;
  v5[3] = &unk_1E6DA9020;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasManagedAppleID
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ASKRestrictions *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ASKRestrictions_hasManagedAppleID__block_invoke;
  v5[3] = &unk_1E6DA9020;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__ASKRestrictions_isRunningInStoreDemoMode__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 18);
  return result;
}

uint64_t __43__ASKRestrictions_isAppInstallationAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t __42__ASKRestrictions_maximumAppContentRating__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

void __57__ASKRestrictions_updateRestrictionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v21 = [MEMORY[0x1E4F74230] sharedConnection];
  v2 = [v21 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 1000;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 8);
  BOOL v7 = v6 != v4;
  if (v6 != v4) {
    *(void *)(v5 + 8) = v4;
  }
  int v8 = [v21 isOnDeviceAppInstallationAllowed];
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v9 + 16) != v8)
  {
    *(unsigned char *)(v9 + 16) = v8;
    BOOL v7 = 1;
  }
  int v10 = [v21 isAppRemovalAllowed];
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v11 + 17) != v10)
  {
    *(unsigned char *)(v11 + 17) = v10;
    BOOL v7 = 1;
  }
  int v12 = [MEMORY[0x1E4F4DC48] isRunningInStoreDemoMode];
  v13 = *(unsigned char **)(a1 + 32);
  if (v13[18] != v12)
  {
    v13[18] = v12;
    v13 = *(unsigned char **)(a1 + 32);
    BOOL v7 = 1;
  }
  v14 = [v13 accountStore];
  v15 = objc_msgSend(v14, "ams_activeiTunesAccount");
  int v16 = objc_msgSend(v15, "ams_isManagedAppleID");

  uint64_t v17 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v17 + 19) != v16)
  {
    *(unsigned char *)(v17 + 19) = v16;
    BOOL v7 = 1;
  }
  int v18 = [v21 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;
  uint64_t v19 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v19 + 20) != v18)
  {
    *(unsigned char *)(v19 + 20) = v18;
    BOOL v7 = 1;
  }
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(uint64_t, BOOL))(v20 + 16))(v20, v7);
  }
}

- (ASKRestrictions)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASKRestrictions;
  uint64_t v6 = [(ASKRestrictions *)&v15 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("AppStoreKitInternal.ASKRestrictions.queue", MEMORY[0x1E4F14430]);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_accountStore, a3);
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel_updateRestrictionsAndNotifyIfNeeded name:*MEMORY[0x1E4F73EC0] object:0];

    int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel_updateRestrictionsAndNotifyIfNeeded name:*MEMORY[0x1E4FB2730] object:0];

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v12 = *MEMORY[0x1E4F17728];
    v13 = [(ASKRestrictions *)v6 accountStore];
    [v11 addObserver:v6 selector:sel_updateRestrictionsAndNotifyIfNeeded name:v12 object:v13];

    [(ASKRestrictions *)v6 updateRestrictionsWithCompletionBlock:0];
  }

  return v6;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)updateRestrictionsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ASKRestrictions *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ASKRestrictions_updateRestrictionsWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E6DA8D48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __36__ASKRestrictions_hasManagedAppleID__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 19);
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASKRestrictions;
  [(ASKRestrictions *)&v4 dealloc];
}

- (void)updateRestrictionsAndNotifyIfNeeded
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke;
  v2[3] = &unk_1E6DA8FF8;
  v2[4] = self;
  [(ASKRestrictions *)self updateRestrictionsWithCompletionBlock:v2];
}

void __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke_2;
    block[3] = &unk_1E6DA8FD0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __54__ASKRestrictions_updateRestrictionsAndNotifyIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"AppStoreKitInternal.Restrictions.didChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)isAppUninstallationAllowed
{
  id v2 = self;
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ASKRestrictions *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ASKRestrictions_isAppUninstallationAllowed__block_invoke;
  v5[3] = &unk_1E6DA9020;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __45__ASKRestrictions_isAppUninstallationAllowed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (BOOL)isAccountModificationRestricted
{
  id v2 = self;
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ASKRestrictions *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ASKRestrictions_isAccountModificationRestricted__block_invoke;
  v5[3] = &unk_1E6DA9020;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__ASKRestrictions_isAccountModificationRestricted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 20);
  return result;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end