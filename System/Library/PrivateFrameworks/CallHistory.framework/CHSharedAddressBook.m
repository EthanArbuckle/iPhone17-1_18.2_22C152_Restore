@interface CHSharedAddressBook
+ (id)get;
- (CHSharedAddressBook)init;
- (NSMutableDictionary)addressBookCache;
- (id)fetchAddressBookInfoFromCacheForKey:(id)a3;
- (unint64_t)cachedCount;
- (void)cleanUpAddressBookCache_sync;
- (void)dealloc;
- (void)insertAddressBookInfoDictionaryIntoCache:(id)a3;
- (void)insertAddressBookInfoIntoCache:(id)a3 forKey:(id)a4;
- (void)registerForContactsNotifications;
- (void)revertAddressBook:(id)a3;
- (void)sendABChangedNotificationSyncWithUserInfo:(id)a3;
- (void)setAddressBookCache:(id)a3;
@end

@implementation CHSharedAddressBook

+ (id)get
{
  if (get_onceToken != -1) {
    dispatch_once(&get_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)get_instance;
  return v2;
}

uint64_t __26__CHSharedAddressBook_get__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)get_instance;
  get_instance = v0;

  v2 = (void *)get_instance;
  return [v2 registerForContactsNotifications];
}

- (CHSharedAddressBook)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHSharedAddressBook;
  v2 = [(CHSynchronizedLoggable *)&v6 initWithName:"SharedAddressBook"];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addressBookCache = v2->_addressBookCache;
    v2->_addressBookCache = v3;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CHSharedAddressBook;
  [(CHSharedAddressBook *)&v4 dealloc];
}

- (void)registerForContactsNotifications
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__CHSharedAddressBook_registerForContactsNotifications__block_invoke;
  v2[3] = &unk_1E61C74A8;
  v2[4] = self;
  [(CHSynchronizedLoggable *)self execute:v2];
}

void __55__CHSharedAddressBook_registerForContactsNotifications__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_revertAddressBook_ name:*MEMORY[0x1E4F1AF80] object:0];
}

- (void)sendABChangedNotificationSyncWithUserInfo:(id)a3
{
}

- (void)cleanUpAddressBookCache_sync
{
  id v2 = [(CHSharedAddressBook *)self addressBookCache];
  [v2 removeAllObjects];
}

- (void)revertAddressBook:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CHSharedAddressBook_revertAddressBook___block_invoke;
  v3[3] = &unk_1E61C74A8;
  v3[4] = self;
  [(CHSynchronizedLoggable *)self execute:v3];
}

uint64_t __41__CHSharedAddressBook_revertAddressBook___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Contacts changed, so reverting it and clearing our AB cache", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cleanUpAddressBookCache_sync");
  return [*(id *)(a1 + 32) sendABChangedNotificationSyncWithUserInfo:0];
}

- (void)insertAddressBookInfoDictionaryIntoCache:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke;
  v6[3] = &unk_1E61C7568;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v4 = (uint64_t *)(a1 + 32);
  if (v3)
  {
    id v6 = [v2 addressBookCache];
    [v6 addEntriesFromDictionary:*v4];
  }
  else
  {
    id v5 = [v2 logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke_cold_1(v4, v5);
    }
  }
}

- (void)insertAddressBookInfoIntoCache:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke;
  v10[3] = &unk_1E61C7888;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(CHSynchronizedLoggable *)self execute:v10];
}

void __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 48) addressBookCache];
    [v4 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 48) logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke_cold_1(v2, a1, v3);
    }
  }
}

- (id)fetchAddressBookInfoFromCacheForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CHSharedAddressBook_fetchAddressBookInfoFromCacheForKey___block_invoke;
  v8[3] = &unk_1E61C7838;
  v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(CHSynchronizedLoggable *)self executeSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__CHSharedAddressBook_fetchAddressBookInfoFromCacheForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) addressBookCache];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)cachedCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CHSharedAddressBook_cachedCount__block_invoke;
  v4[3] = &unk_1E61C79C8;
  v4[4] = self;
  v4[5] = &v5;
  [(CHSynchronizedLoggable *)self executeSync:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHSharedAddressBook_cachedCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) addressBookCache];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (NSMutableDictionary)addressBookCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAddressBookCache:(id)a3
{
}

- (void).cxx_destruct
{
}

void __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_ERROR, "Cannot insert info %@ into address book cache", (uint8_t *)&v3, 0xCu);
}

void __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Cannot insert %@ for key %@ into address book cache", (uint8_t *)&v5, 0x16u);
}

@end