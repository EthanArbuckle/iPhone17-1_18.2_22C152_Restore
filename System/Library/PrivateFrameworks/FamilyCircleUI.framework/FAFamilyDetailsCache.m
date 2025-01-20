@interface FAFamilyDetailsCache
+ (id)sharedCache;
- (unint64_t)pendingInviteCount;
- (void)_fetchPendingInviteCount;
- (void)_setPendingInviteCount:(unint64_t)a3;
- (void)invalidate;
@end

@implementation FAFamilyDetailsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)sharedCache__sharedCache;
  return v2;
}

void __35__FAFamilyDetailsCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(FAFamilyDetailsCache);
  v1 = (void *)sharedCache__sharedCache;
  sharedCache__sharedCache = (uint64_t)v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = (const void *)sharedCache__sharedCache;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v4 = (CFStringRef *)getINFamilyDidChangeNotificationSymbolLoc_ptr_0;
  uint64_t v10 = getINFamilyDidChangeNotificationSymbolLoc_ptr_0;
  if (!getINFamilyDidChangeNotificationSymbolLoc_ptr_0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getINFamilyDidChangeNotificationSymbolLoc_block_invoke_0;
    v6[3] = &unk_264348998;
    v6[4] = &v7;
    __getINFamilyDidChangeNotificationSymbolLoc_block_invoke_0((uint64_t)v6);
    v4 = (CFStringRef *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    v5 = (_Unwind_Exception *)+[FAHomeUISoftLinking getURLScheme]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_FAFamilyDetailsCacheFamilyDidChangeNotificationHandler, *v4, 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isValid = 0;
  obj->_pendingInviteCount = 0;
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_3);
  objc_sync_exit(obj);
}

void __34__FAFamilyDetailsCache_invalidate__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"FAFamilyDetailsCacheDidChangeNotification" object:0];
}

- (unint64_t)pendingInviteCount
{
  v2 = self;
  objc_sync_enter(v2);
  if (!*(_WORD *)&v2->_isValid)
  {
    v2->_isValidating = 1;
    [(FAFamilyDetailsCache *)v2 _fetchPendingInviteCount];
  }
  unint64_t pendingInviteCount = v2->_pendingInviteCount;
  objc_sync_exit(v2);

  return pendingInviteCount;
}

- (void)_fetchPendingInviteCount
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  if (v3)
  {
    v4 = objc_msgSend(v2, "aa_grandSlamAccountForiCloudAccount:", v3);
    id v5 = objc_alloc(MEMORY[0x263F25878]);
    v6 = (void *)[v5 initWithAccountStore:v2 grandSlamAccount:v4 appTokenID:*MEMORY[0x263F256D0]];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F25848]) initWithGrandSlamSigner:v6];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke_2;
    v8[3] = &unk_264349ED0;
    v8[4] = *(void *)(a1 + 32);
    [v7 performRequestWithHandler:v8];
  }
}

void __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 0;
  objc_sync_exit(v8);

  if (v6 && !v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPendingInviteCount:", objc_msgSend(v6, "pendingInviteCount"));
  }
  else
  {
    uint64_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "FAFamilyDetailsCache _fetchPendingInviteCount error %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_setPendingInviteCount:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t pendingInviteCount = obj->_pendingInviteCount;
  obj->_unint64_t pendingInviteCount = a3;
  obj->_isValid = 1;
  if (pendingInviteCount != a3) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_11);
  }
  objc_sync_exit(obj);
}

void __47__FAFamilyDetailsCache__setPendingInviteCount___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"FAFamilyDetailsCacheDidChangeNotification" object:0];
}

@end