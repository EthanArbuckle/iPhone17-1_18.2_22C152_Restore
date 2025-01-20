@interface EDVIPManager
+ (OS_os_log)log;
+ (id)_contactDescriptors;
- (BOOL)_isVIPForContact:(id)a3 orAddresses:(id)a4;
- (BOOL)hasVIPs;
- (BOOL)isVIPAddress:(id)a3;
- (CNContactStore)contactStore;
- (EAEmailAddressSet)allVIPEmailAddresses;
- (EDAccountsProvider)accountsProvider;
- (EDVIPManager)initWithDirectoryURL:(id)a3 accountsProvider:(id)a4 delegate:(id)a5;
- (EDVIPManager)initWithDirectoryURL:(id)a3 keyValueStore:(id)a4 accountsProvider:(id)a5 contactStore:(id)a6 delegate:(id)a7;
- (EDVIPManagerDelegate)delegate;
- (NSSet)allVIPs;
- (NSURL)plistURL;
- (NSUbiquitousKeyValueStore)keyValueStore;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)operationQueue;
- (id)_allVIPEmailAddresses;
- (id)_cloudKeyForIdentifier:(id)a3;
- (id)_contactForName:(id)a3 emailAddresses:(id)a4;
- (id)_contactFromContacts:(id)a3 matchingMostAddresses:(id)a4;
- (id)_partiallyRedactedVIPDictionary:(id)a3;
- (id)_serializedData;
- (id)_validatedCloudVIPFromStore:(id)a3 withCloudKey:(id)a4;
- (id)_vipsDictionary;
- (id)allVIPWaitForResult;
- (id)vipWithIdentifier:(id)a3;
- (void)_accountsChanged:(id)a3;
- (void)_initializeKVSStore;
- (void)_keyValueStoreChanged:(id)a3;
- (void)_loadVIPs;
- (void)_mergeVIPs;
- (void)_removeVIPsWithIdentifiers:(id)a3;
- (void)_saveVIPs;
- (void)_saveVIPsLocally;
- (void)_serializedData;
- (void)_synchronizeKVStore;
- (void)_updateCloudWithLocal;
- (void)_updateLocalWithCloud:(id)a3 refresh:(BOOL)a4;
- (void)dealloc;
- (void)gatherStatisticsWithVIPCount:(unint64_t)a3;
- (void)getAllVIPsWithCompletion:(id)a3;
- (void)removeVIPsWithEmailAddresses:(id)a3;
- (void)removeVIPsWithIdentifiers:(id)a3;
- (void)saveVIPs:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyValueStore:(id)a3;
@end

@implementation EDVIPManager

- (BOOL)isVIPAddress:(id)a3
{
  id v4 = a3;
  v5 = [(EDVIPManager *)self allVIPEmailAddresses];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (EAEmailAddressSet)allVIPEmailAddresses
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__48;
  v13 = __Block_byref_object_dispose__48;
  id v14 = 0;
  v3 = [(EDVIPManager *)self operationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__EDVIPManager_allVIPEmailAddresses__block_invoke;
  v8[3] = &unk_1E6C00A68;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_barrier_sync(v3, v8);

  id v4 = (void *)v10[5];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F605B8]);
  }
  char v6 = v5;
  _Block_object_dispose(&v9, 8);

  return (EAEmailAddressSet *)v6;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

void __36__EDVIPManager_allVIPEmailAddresses__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allVIPEmailAddresses];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_allVIPEmailAddresses
{
  cachedEmailAddresses = self->_cachedEmailAddresses;
  if (!cachedEmailAddresses)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F605B8]);
    vipsByIdentifier = self->_vipsByIdentifier;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__EDVIPManager__allVIPEmailAddresses__block_invoke;
    v11[3] = &unk_1E6C07970;
    id v6 = v4;
    id v12 = v6;
    [(NSMutableDictionary *)vipsByIdentifier enumerateKeysAndObjectsUsingBlock:v11];
    v7 = (EAEmailAddressSet *)[v6 copy];
    v8 = self->_cachedEmailAddresses;
    self->_cachedEmailAddresses = v7;

    cachedEmailAddresses = self->_cachedEmailAddresses;
  }
  uint64_t v9 = (void *)[(EAEmailAddressSet *)cachedEmailAddresses copy];

  return v9;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__EDVIPManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_101 != -1) {
    dispatch_once(&log_onceToken_101, block);
  }
  uint64_t v2 = (void *)log_log_101;

  return (OS_os_log *)v2;
}

void __19__EDVIPManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)log_log_101;
  log_log_101 = (uint64_t)v1;
}

- (EDVIPManager)initWithDirectoryURL:(id)a3 accountsProvider:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F29130] additionalStoreWithIdentifier:@"com.apple.mail.vipsenders"];
  id v12 = [(EDVIPManager *)self initWithDirectoryURL:v8 keyValueStore:v11 accountsProvider:v9 contactStore:0 delegate:v10];

  return v12;
}

- (EDVIPManager)initWithDirectoryURL:(id)a3 keyValueStore:(id)a4 accountsProvider:(id)a5 contactStore:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)EDVIPManager;
  v17 = [(EDVIPManager *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 URLByAppendingPathComponent:@"VIPs.plist" isDirectory:0];
    plistURL = v17->_plistURL;
    v17->_plistURL = (NSURL *)v18;

    objc_storeStrong((id *)&v17->_keyValueStore, a4);
    objc_storeStrong((id *)&v17->_contactStore, a6);
    objc_storeStrong((id *)&v17->_accountsProvider, a5);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.email.edvipmanager", MEMORY[0x1E4F14430]);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.email.edvipmanager.notifications", v22);
    notificationQueue = v17->_notificationQueue;
    v17->_notificationQueue = (OS_dispatch_queue *)v23;

    v17->_initializeLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v17->_delegate, v16);
    if (v14 && ![v14 hasActiveAccounts])
    {
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 addObserver:v17 selector:sel__accountsChanged_ name:*MEMORY[0x1E4F60630] object:0];
    }
    else
    {
      [(EDVIPManager *)v17 _initializeKVSStore];
    }
  }

  return v17;
}

- (void)_initializeKVSStore
{
  p_initializeLock = &self->_initializeLock;
  os_unfair_lock_lock(&self->_initializeLock);
  if (!self->_initialized)
  {
    self->_initialized = 1;
    operationQueue = self->_operationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__EDVIPManager__initializeKVSStore__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    block[4] = self;
    dispatch_barrier_async(operationQueue, block);
    if (self->_keyValueStore)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel__keyValueStoreChanged_ name:*MEMORY[0x1E4F28A30] object:self->_keyValueStore];
    }
  }
  os_unfair_lock_unlock(p_initializeLock);
}

void __35__EDVIPManager__initializeKVSStore__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadVIPs];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[6])
  {
    [v2 _synchronizeKVStore];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 48) dictionaryRepresentation];
    id v4 = +[EDVIPManager log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = @"com.apple.mail.vipsenders";
      __int16 v11 = 2048;
      uint64_t v12 = [v3 count];
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "registering for VIP kvstore at: %@\nnumber of VIPs in current store: %lu", (uint8_t *)&v9, 0x16u);
    }

    id v5 = +[EDVIPManager log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(a1 + 32) _partiallyRedactedVIPDictionary:v3];
      __35__EDVIPManager__initializeKVSStore__block_invoke_cold_1(v6, (uint8_t *)&v9, v5);
    }

    v7 = *(void **)(a1 + 32);
    id v8 = [v3 allKeys];
    [v7 _updateLocalWithCloud:v8 refresh:1];

    objc_msgSend(*(id *)(a1 + 32), "gatherStatisticsWithVIPCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
  }
}

- (id)_partiallyRedactedVIPDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke;
  v7[3] = &unk_1E6C03E08;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke_2;
    v9[3] = &unk_1E6C00D98;
    id v8 = v7;
    id v10 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
  }
}

void __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:@"a"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [MEMORY[0x1E4F60E00] partiallyRedactedStringFromArray:v5];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
LABEL_7:

      goto LABEL_10;
    }
  }
  if ([v7 isEqualToString:@"n"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v5];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
      goto LABEL_7;
    }
  }
  if ([v7 isEqualToString:@"v"]) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
LABEL_10:
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EDVIPManager;
  [(EDVIPManager *)&v4 dealloc];
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_super v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (BOOL)hasVIPs
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(EDVIPManager *)self operationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__EDVIPManager_hasVIPs__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __23__EDVIPManager_hasVIPs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (id)vipWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__48;
  id v16 = __Block_byref_object_dispose__48;
  id v17 = 0;
  id v5 = [(EDVIPManager *)self operationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EDVIPManager_vipWithIdentifier___block_invoke;
  block[3] = &unk_1E6C00A40;
  id v10 = v4;
  __int16 v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __34__EDVIPManager_vipWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSSet)allVIPs
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__48;
  uint64_t v13 = __Block_byref_object_dispose__48;
  id v14 = 0;
  uint64_t v3 = [(EDVIPManager *)self operationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__EDVIPManager_allVIPs__block_invoke;
  v8[3] = &unk_1E6C00A68;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  id v4 = (void *)v10[5];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  return (NSSet *)v6;
}

void __23__EDVIPManager_allVIPs__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v3 = objc_msgSend(v2, "initWithArray:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)getAllVIPsWithCompletion:(id)a3
{
  id v5 = a3;
  [(EDVIPManager *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDVIPManager getAllVIPsWithCompletion:]", "EDVIPManager.m", 175, "0");
}

void __37__EDVIPManager__allVIPEmailAddresses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 emailAddresses];
  objc_msgSend(v3, "unionSet:");
}

- (id)allVIPWaitForResult
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__48;
  uint64_t v11 = __Block_byref_object_dispose__48;
  id v12 = 0;
  uint64_t v3 = [(EDVIPManager *)self operationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__EDVIPManager_allVIPWaitForResult__block_invoke;
  v6[3] = &unk_1E6C00A68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__EDVIPManager_allVIPWaitForResult__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v3 = objc_msgSend(v2, "initWithArray:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)saveVIPs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(EDVIPManager *)self keyValueStore];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EDVIPManager.m" lineNumber:215 description:@"Modification of VIPs only supported when syncing is enabled"];
  }
  uint64_t v7 = +[EDVIPManager log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "save VIPs with count %lu", buf, 0xCu);
  }

  uint64_t v8 = [(EDVIPManager *)self operationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__EDVIPManager_saveVIPs___block_invoke;
  v11[3] = &unk_1E6BFFAF0;
  id v12 = v5;
  uint64_t v13 = self;
  id v9 = v5;
  dispatch_barrier_async(v8, v11);
}

void __25__EDVIPManager_saveVIPs___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v43 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v2)
  {
    uint64_t v41 = *(void *)v52;
    do
    {
      uint64_t v42 = v2;
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v44 = objc_msgSend(v4, "name", v39);
        id v5 = [v4 emailAddresses];
        id v6 = [v4 identifier];
        uint64_t v7 = [*(id *)(*(void *)(v43 + 40) + 8) objectForKeyedSubscript:v6];
        uint64_t v8 = v7;
        if (v7)
        {
          id v9 = [v7 name];
          char v10 = [v9 isEqualToString:v44];

          if (v10) {
            uint64_t v11 = 0;
          }
          else {
            uint64_t v11 = v44;
          }
          dispatch_queue_t v20 = [v8 emailAddresses];
          char v21 = [v5 isSubsetOfSet:v20];

          if (v21)
          {
            uint64_t v12 = 0;
          }
          else
          {
            v22 = [v8 emailAddresses];
            uint64_t v12 = [v22 mutableCopy];

            [(id)v12 unionSet:v5];
          }
          if (!(v11 | v12)) {
            goto LABEL_35;
          }
          if (v11)
          {
            id v23 = (id)v11;
          }
          else
          {
            id v23 = [v8 name];
          }
          uint64_t v13 = v23;
          if (v12)
          {
            id v24 = (id)v12;
          }
          else
          {
            id v24 = [v8 emailAddresses];
          }
          v25 = v24;
          v26 = (void *)[objc_alloc(MEMORY[0x1E4F60518]) initWithIdentifier:v6 name:v13 emailAddresses:v24];
          [v39 addObject:v26];
        }
        else
        {
          uint64_t v11 = [*(id *)(v43 + 40) _contactForName:v44 emailAddresses:v5];
          if ([*(id *)(v43 + 40) _isVIPForContact:v11 orAddresses:v5]) {
            goto LABEL_36;
          }
          uint64_t v12 = v44;
          uint64_t v13 = (void *)[v5 mutableCopy];
          if (v11)
          {
            id v14 = [MEMORY[0x1E4F1B910] stringFromContact:v11 style:0];
            uint64_t v15 = v14;
            if (v14)
            {
              id v16 = v14;

              uint64_t v12 = (uint64_t)v16;
            }
            id v17 = [(id)v11 emailAddresses];
            uint64_t v18 = [v17 valueForKey:@"value"];

            if ([v18 count]) {
              [v13 addObjectsFromArray:v18];
            }
          }
          if (![v13 count]) {
            goto LABEL_34;
          }
          if (v12)
          {
            id v19 = (id)v12;
          }
          else
          {
            id v19 = [v13 anyObject];
          }
          v25 = v19;
          v26 = (void *)[objc_alloc(MEMORY[0x1E4F60518]) initWithIdentifier:v6 name:v19 emailAddresses:v13];
          [v39 addObject:v26];
        }

LABEL_34:
LABEL_35:

LABEL_36:
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v2);
  }

  objc_super v27 = +[EDVIPManager log];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [v39 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v57 = v28;
    _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "save new VIPs with count %lu", buf, 0xCu);
  }

  if ([v39 count])
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F605B8]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v30 = v39;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v35 = *(void **)(*(void *)(v43 + 40) + 8);
          v36 = objc_msgSend(v34, "identifier", v39);
          [v35 setObject:v34 forKeyedSubscript:v36];

          v37 = [v34 emailAddresses];
          [v29 unionSet:v37];
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v31);
    }

    [*(id *)(*(void *)(v43 + 40) + 16) unionSet:v29];
    [*(id *)(v43 + 40) _saveVIPs];
    v38 = [*(id *)(v43 + 40) notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__EDVIPManager_saveVIPs___block_invoke_60;
    block[3] = &unk_1E6BFFAF0;
    block[4] = *(void *)(v43 + 40);
    id v46 = v30;
    dispatch_async(v38, block);
  }
}

void __25__EDVIPManager_saveVIPs___block_invoke_60(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F601D8];
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:*MEMORY[0x1E4F601C8] object:v4 userInfo:v5];
}

- (BOOL)_isVIPForContact:(id)a3 orAddresses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EDVIPManager *)self _allVIPEmailAddresses];
  if ([v7 intersectsSet:v8])
  {
    char v9 = 1;
  }
  else
  {
    char v10 = [v6 emailAddresses];
    uint64_t v11 = [v10 valueForKey:@"value"];

    if ([v11 count])
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F605B8]) initWithArray:v11];
      char v9 = [v12 intersectsSet:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  id v5 = a3;
  id v6 = [(EDVIPManager *)self keyValueStore];

  if (!v6)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EDVIPManager.m" lineNumber:308 description:@"Modification of VIPs only supported when syncing is enabled"];
  }
  id v7 = [(EDVIPManager *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__EDVIPManager_removeVIPsWithIdentifiers___block_invoke;
  v10[3] = &unk_1E6BFFAF0;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_barrier_async(v7, v10);
}

uint64_t __42__EDVIPManager_removeVIPsWithIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVIPsWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  id v5 = a3;
  id v6 = [(EDVIPManager *)self keyValueStore];

  if (!v6)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EDVIPManager.m" lineNumber:315 description:@"Modification of VIPs only supported when syncing is enabled"];
  }
  id v7 = [(EDVIPManager *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke;
  v10[3] = &unk_1E6BFFAF0;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  dispatch_barrier_async(v7, v10);
}

void __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke_2;
  v4[3] = &unk_1E6C07998;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 keysOfEntriesPassingTest:v4];
  [*(id *)(a1 + 32) _removeVIPsWithIdentifiers:v3];
}

uint64_t __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 emailAddresses];
  uint64_t v5 = [v4 intersectsSet:*(void *)(a1 + 32)];

  return v5;
}

- (void)_removeVIPsWithIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EDVIPManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "remove VIPs with identifiers %@", buf, 0xCu);
  }

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(NSMutableDictionary *)self->_vipsByIdentifier objectForKeyedSubscript:v11];
        if (v12) {
          [v6 addObject:v12];
        }
        [(NSMutableDictionary *)self->_vipsByIdentifier removeObjectForKey:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  cachedEmailAddresses = self->_cachedEmailAddresses;
  self->_cachedEmailAddresses = 0;

  [(EDVIPManager *)self _saveVIPs];
  id v14 = [(EDVIPManager *)self notificationQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__EDVIPManager__removeVIPsWithIdentifiers___block_invoke;
  v16[3] = &unk_1E6BFFAF0;
  v16[4] = self;
  id v17 = v6;
  id v15 = v6;
  dispatch_async(v14, v16);
}

void __43__EDVIPManager__removeVIPsWithIdentifiers___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4F601D0];
  v7[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:*MEMORY[0x1E4F601C8] object:v4 userInfo:v5];
}

- (void)_loadVIPs
{
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  vipsByIdentifier = self->_vipsByIdentifier;
  self->_vipsByIdentifier = v3;

  uint64_t v5 = [(EDVIPManager *)self _vipsDictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__EDVIPManager__loadVIPs__block_invoke;
  v6[3] = &unk_1E6C03E08;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __25__EDVIPManager__loadVIPs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Name"];
  id v7 = [v5 objectForKeyedSubscript:@"EmailAddresses"];
  id v8 = objc_alloc(MEMORY[0x1E4F60518]);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F605B8]) initWithArray:v7];
  char v10 = (void *)[v8 initWithIdentifier:v11 name:v6 emailAddresses:v9];

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v10 forKeyedSubscript:v11];
}

- (id)_vipsDictionary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v4 = [(EDVIPManager *)self plistURL];
  id v5 = (void *)[v3 initWithContentsOfURL:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_saveVIPs
{
  [(EDVIPManager *)self _saveVIPsLocally];

  [(EDVIPManager *)self _updateCloudWithLocal];
}

- (void)_saveVIPsLocally
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to write serialized entries: %{public}@", buf, 0xCu);
}

- (id)_serializedData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  vipsByIdentifier = self->_vipsByIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __31__EDVIPManager__serializedData__block_invoke;
  v13[3] = &unk_1E6C07970;
  id v5 = v3;
  id v14 = v5;
  [(NSMutableDictionary *)vipsByIdentifier enumerateKeysAndObjectsUsingBlock:v13];
  id v12 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    id v8 = +[EDVIPManager log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 count];
      char v10 = objc_msgSend(v7, "ef_publicDescription");
      [(EDVIPManager *)v10 _serializedData];
    }
  }

  return v6;
}

void __31__EDVIPManager__serializedData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 name];
  if (v7)
  {
    v14[0] = @"Name";
    id v8 = [v6 name];
    v14[1] = @"EmailAddresses";
    v15[0] = v8;
    uint64_t v9 = [v6 emailAddresses];
    char v10 = [v9 allObjects];
    v15[1] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  else
  {
    id v12 = @"EmailAddresses";
    id v8 = [v6 emailAddresses];
    uint64_t v9 = [v8 allObjects];
    uint64_t v13 = v9;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }

  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v5];
}

- (void)_updateCloudWithLocal
{
}

void __37__EDVIPManager__updateCloudWithLocal__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  id v5 = [*(id *)(a1 + 32) _cloudKeyForIdentifier:a2];
  [*(id *)(a1 + 40) removeObject:v5];
  id v6 = [*(id *)(a1 + 32) _validatedCloudVIPFromStore:*(void *)(a1 + 48) withCloudKey:v5];
  id v7 = [v17 name];
  id v8 = [v17 emailAddresses];
  if (v6)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"n"];
    int v10 = [v7 isEqualToString:v9];
    id v11 = objc_alloc(MEMORY[0x1E4F605B8]);
    id v12 = [v6 objectForKeyedSubscript:@"a"];
    uint64_t v13 = (void *)[v11 initWithArray:v12];

    if ([v8 isEqualToSet:v13] & v10) {
      id v14 = 0;
    }
    else {
      id v14 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
    }

    if (!v14) {
      goto LABEL_13;
    }
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (!v14) {
      goto LABEL_13;
    }
  }
  if (v7) {
    [v14 setObject:v7 forKeyedSubscript:@"n"];
  }
  if (v8)
  {
    id v15 = [v8 allObjects];
    uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];
    [v14 setObject:v16 forKeyedSubscript:@"a"];
  }
  [v14 setObject:&unk_1F35BB3C0 forKeyedSubscript:@"v"];
  [*(id *)(a1 + 48) setDictionary:v14 forKey:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_13:
}

- (void)_keyValueStoreChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(EDVIPManager *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __38__EDVIPManager__keyValueStoreChanged___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __38__EDVIPManager__keyValueStoreChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A20]];
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A28]];
  id v5 = +[EDVIPManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    uint64_t v16 = v3;
    __int16 v17 = 2048;
    uint64_t v18 = [v4 count];
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "VIP kvstore changed, reason: %{public}@\n%lu keys changed", (uint8_t *)&v15, 0x16u);
  }

  id v6 = +[EDVIPManager log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __38__EDVIPManager__keyValueStoreChanged___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = [v3 integerValue];
  uint64_t v14 = 0;
  switch(v13)
  {
    case 0:
    case 2:
      goto LABEL_8;
    case 1:
      [*(id *)(a1 + 40) _mergeVIPs];
      break;
    case 3:
      uint64_t v14 = 1;
LABEL_8:
      [*(id *)(a1 + 40) _updateLocalWithCloud:v4 refresh:v14];
      break;
    default:
      break;
  }
}

- (void)_synchronizeKVStore
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to synchronize KV Store", v1, 2u);
}

- (void)_updateLocalWithCloud:(id)a3 refresh:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v6 = +[EDVIPManager log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_vipsByIdentifier count];
    *(_DWORD *)buf = 134217984;
    uint64_t v89 = v7;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "local store has %lu VIPs before updating from cloud", buf, 0xCu);
  }
  v70 = self;

  uint64_t v8 = +[EDVIPManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[EDVIPManager _updateLocalWithCloud:refresh:]((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
  }

  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v16 = [(NSMutableDictionary *)self->_vipsByIdentifier allKeys];
    id v66 = (id)[v15 initWithArray:v16];
  }
  else
  {
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  v65 = [(EDVIPManager *)self keyValueStore];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v63;
  uint64_t v17 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v17)
  {
    uint64_t v68 = *(void *)v83;
    do
    {
      uint64_t v69 = v17;
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v83 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        if ([v19 hasPrefix:@"VIP_"])
        {
          long long v20 = objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:options:range:", @"VIP_", &stru_1F3583658, 8, 0, objc_msgSend(v19, "length"));
          long long v21 = [(EDVIPManager *)v70 _validatedCloudVIPFromStore:v65 withCloudKey:v19];
          v22 = v21;
          if (v21)
          {
            id v23 = [v21 objectForKeyedSubscript:@"n"];
            id v24 = objc_alloc(MEMORY[0x1E4F605B8]);
            uint64_t v25 = [v22 objectForKeyedSubscript:@"a"];
            v26 = (void *)[v24 initWithArray:v25];

            objc_super v27 = [(NSMutableDictionary *)v70->_vipsByIdentifier objectForKeyedSubscript:v20];
            uint64_t v28 = v27;
            if (v27)
            {
              id v29 = [v27 name];
              id v30 = v29;
              if (v23 && ([v29 isEqualToString:v23] & 1) == 0)
              {
                id v36 = v23;

                int v31 = 1;
                id v30 = v36;
              }
              else
              {
                int v31 = 0;
              }
              uint64_t v32 = [v28 emailAddresses];
              if ([v26 count] && (objc_msgSend(v26, "isSubsetOfSet:", v32) & 1) == 0)
              {
                v37 = (void *)[v32 mutableCopy];
                [v37 unionSet:v26];

                uint64_t v32 = v37;
              }
              else if (!v31)
              {
                v35 = 0;
                goto LABEL_33;
              }
              v35 = (void *)[objc_alloc(MEMORY[0x1E4F60518]) initWithIdentifier:v20 name:v30 emailAddresses:v32];
            }
            else
            {
              id v30 = (void *)[v26 mutableCopy];
              uint64_t v32 = [(EDVIPManager *)v70 _contactForName:v23 emailAddresses:v26];
              v33 = [v32 emailAddresses];
              v34 = [v33 valueForKey:@"value"];

              if ([v34 count]) {
                [v30 addObjectsFromArray:v34];
              }
              if ([v30 count]) {
                v35 = (void *)[objc_alloc(MEMORY[0x1E4F60518]) initWithIdentifier:v20 name:v23 emailAddresses:v30];
              }
              else {
                v35 = 0;
              }
            }
LABEL_33:

            if (v35) {
              [v64 setObject:v35 forKeyedSubscript:v20];
            }
            [v66 removeObject:v20];
          }
          else
          {
            [v66 addObject:v20];
          }

          continue;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
    }
    while (v17);
  }

  p_isa = (id *)&v70->super.isa;
  if ([v64 count] || objc_msgSend(v66, "count"))
  {
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke;
    v79[3] = &unk_1E6C079E8;
    v79[4] = v70;
    id v42 = v39;
    id v80 = v42;
    id v43 = v41;
    id v81 = v43;
    [v64 enumerateKeysAndObjectsUsingBlock:v79];
    [(EAEmailAddressSet *)v70->_cachedEmailAddresses unionSet:v43];
    if ([v66 count])
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v44 = v66;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v86 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v76 != v46) {
              objc_enumerationMutation(v44);
            }
            uint64_t v48 = *(void *)(*((void *)&v75 + 1) + 8 * j);
            long long v49 = [(NSMutableDictionary *)v70->_vipsByIdentifier objectForKeyedSubscript:v48];
            if (v49) {
              [v40 addObject:v49];
            }
            [(NSMutableDictionary *)v70->_vipsByIdentifier removeObjectForKey:v48];
          }
          uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v86 count:16];
        }
        while (v45);
      }

      cachedEmailAddresses = v70->_cachedEmailAddresses;
      v70->_cachedEmailAddresses = 0;

      p_isa = (id *)&v70->super.isa;
    }
    [p_isa _saveVIPsLocally];
    long long v51 = [p_isa notificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke_2;
    block[3] = &unk_1E6BFF7A8;
    id v72 = v42;
    id v73 = v40;
    v74 = p_isa;
    id v52 = v40;
    id v53 = v42;
    dispatch_async(v51, block);

    p_isa = (id *)&v70->super.isa;
  }
  long long v54 = +[EDVIPManager log];
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = [p_isa[1] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v89 = v55;
    _os_log_impl(&dword_1DB39C000, v54, OS_LOG_TYPE_DEFAULT, "local store has %lu VIPs after updating from cloud", buf, 0xCu);
  }

  v56 = +[EDVIPManager log];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    -[EDVIPManager _updateLocalWithCloud:refresh:]((uint64_t)v70, v56, v57, v58, v59, v60, v61, v62);
  }
}

void __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:v8];
  [*(id *)(a1 + 40) addObject:v5];
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = [v5 emailAddresses];
  [v6 unionSet:v7];
}

void __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke_2(void *a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F601D0];
  v6[0] = *MEMORY[0x1E4F601D8];
  v6[1] = v2;
  uint64_t v3 = a1[5];
  v7[0] = a1[4];
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F601C8] object:a1[6] userInfo:v4];
}

- (void)_mergeVIPs
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 8);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "merge VIPs from cloud: %@ and local: %@", (uint8_t *)&v4, 0x16u);
}

void __26__EDVIPManager__mergeVIPs__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 hasPrefix:@"VIP_"])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"a"];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = [a1[4] objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          uint64_t v12 = v11;
          if (v11)
          {
            [v11 addObject:v5];
          }
          else
          {
            uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v5, 0);
            objc_msgSend(a1[4], "setObject:forKeyedSubscript:");
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v6 objectForKeyedSubscript:@"n"];
    if (v13)
    {
      [a1[5] setObject:v5 forKeyedSubscript:v13];
      uint64_t v14 = [MEMORY[0x1E4F5A470] componentsFromString:v13];
      id v15 = [v14 givenName];
      uint64_t v16 = [v14 familyName];
      uint64_t v17 = (void *)v16;
      if (v15 && v16)
      {
        uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@ %@", v15, v16];
        [a1[6] setObject:v5 forKeyedSubscript:v18];
      }
    }
  }
}

void __26__EDVIPManager__mergeVIPs__block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v44 = a2;
  id v42 = a3;
  uint64_t v58 = [v42 name];
  uint64_t v45 = [v42 emailAddresses];
  uint64_t v46 = [a1[4] _cloudKeyForIdentifier:v44];
  id v5 = objc_msgSend(a1[4], "_validatedCloudVIPFromStore:withCloudKey:", a1[5]);
  id v43 = v5;
  if (v5)
  {
    id v6 = (void *)[v5 mutableCopy];
    goto LABEL_74;
  }
  uint64_t v7 = [MEMORY[0x1E4F5A470] componentsFromString:v58];
  uint64_t v8 = [v7 givenName];
  uint64_t v49 = v8;
  uint64_t v51 = [v7 familyName];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v10 = v45;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [a1[6] objectForKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * i)];
        if (v14) {
          [v9 unionSet:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [v9 count];
  if (v15)
  {
    if (v15 == 1)
    {
      id v16 = [v9 anyObject];
      goto LABEL_70;
    }
    unint64_t v56 = [v10 count];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = v9;
    uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v18)
    {
      id v52 = 0;
      id v53 = 0;
      id v47 = 0;
      uint64_t v48 = 0;
      unint64_t v60 = 0;
      uint64_t v55 = *(void *)v63;
      BOOL v54 = (v8 | v51) != 0;
LABEL_21:
      uint64_t v57 = v18;
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v63 != v55) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v62 + 1) + 8 * v19);
        uint64_t v61 = [a1[5] dictionaryForKey:v20];
        if (v54)
        {
          long long v21 = [v61 objectForKeyedSubscript:@"n"];
          uint64_t v59 = [MEMORY[0x1E4F5A470] componentsFromString:v21];

          long long v22 = [v59 givenName];
          id v23 = [v59 familyName];
          if (v58 && ([v21 isEqualToString:v58] & 1) != 0)
          {
            id v16 = v20;

            v33 = v48;
            uint64_t v7 = v59;
            if (v16) {
              goto LABEL_68;
            }
            goto LABEL_59;
          }
          if (v8) {
            LODWORD(v8) = [v22 isEqualToString:v8];
          }
          if (v51)
          {
            int v24 = objc_msgSend(v23, "isEqualToString:");
            if ((v8 & v24) == 1 && v47 == 0)
            {
              id v47 = v20;
              int v24 = 1;
            }
          }
          else
          {
            int v24 = 0;
          }
          if (v52) {
            int v26 = 0;
          }
          else {
            int v26 = v8;
          }
          if (v26 == 1) {
            id v52 = v20;
          }
          if (v53) {
            int v27 = 0;
          }
          else {
            int v27 = v24;
          }
          uint64_t v8 = v49;
          if (v27 == 1) {
            id v53 = v20;
          }

          uint64_t v7 = v59;
        }
        if (v60 < v56)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F1CA80]);
          id v29 = [v61 objectForKeyedSubscript:@"a"];
          id v30 = (void *)[v28 initWithArray:v29];

          [v30 intersectSet:v10];
          unint64_t v31 = [v30 count];
          if (v31 > v60)
          {
            id v32 = v20;

            uint64_t v48 = v32;
            unint64_t v60 = v31;
          }
        }
        if (v57 == ++v19)
        {
          uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v18) {
            goto LABEL_21;
          }
          goto LABEL_58;
        }
      }
    }
    id v52 = 0;
    id v53 = 0;
    id v47 = 0;
    uint64_t v48 = 0;
    unint64_t v60 = 0;
LABEL_58:

    v33 = v48;
LABEL_59:
    if (v47)
    {
      id v16 = v47;
      id v47 = v16;
    }
    else
    {
      if (v60 == v56)
      {
        id v34 = v33;
        v33 = v34;
        id v47 = 0;
      }
      else
      {
        if (v53)
        {
          id v16 = v53;
          id v47 = 0;
          id v53 = v16;
          goto LABEL_68;
        }
        if (v52)
        {
          id v16 = v52;
          id v47 = 0;
          id v52 = v16;
          id v53 = 0;
          goto LABEL_68;
        }
        id v34 = v33;
        v33 = v34;
        id v47 = 0;
        id v52 = 0;
        id v53 = 0;
      }
      id v16 = v34;
    }
LABEL_68:

    uint64_t v17 = v52;
    goto LABEL_69;
  }
  id v16 = [a1[7] objectForKeyedSubscript:v58];
  if (!v16 && v8 && v51)
  {
    uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"%@ %@", v8, v51];
    id v16 = [a1[8] objectForKeyedSubscript:v17];
LABEL_69:
  }
LABEL_70:
  if (v16)
  {
    id v35 = v16;

    id v36 = [a1[5] dictionaryForKey:v35];
    id v6 = (void *)[v36 mutableCopy];

    uint64_t v46 = v35;
  }
  else
  {
    id v6 = 0;
  }

LABEL_74:
  if (!v6)
  {
    if (v58) {
      id v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v58, @"n", 0);
    }
    else {
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v6 = v37;
  }
  v38 = [v6 objectForKeyedSubscript:@"a"];
  id v39 = (void *)[v45 mutableCopy];
  [v39 addObjectsFromArray:v38];
  id v40 = [v39 allObjects];
  id v41 = [v40 sortedArrayUsingSelector:sel_compare_];
  [v6 setObject:v41 forKeyedSubscript:@"a"];

  [v6 setObject:&unk_1F35BB3C0 forKeyedSubscript:@"v"];
  [a1[5] setDictionary:v6 forKey:v46];
}

- (id)_cloudKeyForIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    int v4 = [@"VIP_" stringByAppendingString:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)_validatedCloudVIPFromStore:(id)a3 withCloudKey:(id)a4
{
  int v4 = [a3 dictionaryForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"n"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v6 = v4;
      int v4 = 0;
    }
    else
    {
      id v6 = [v4 objectForKeyedSubscript:@"a"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_90];
        uint64_t v8 = [v7 count];
        if (v8)
        {
          if (v8 == [v6 count])
          {
            id v9 = 0;
          }
          else
          {
            id v10 = (void *)[v6 mutableCopy];
            [v10 removeObjectsAtIndexes:v7];
            id v9 = (void *)[v4 mutableCopy];
            [v9 setObject:v10 forKeyedSubscript:@"a"];

            int v4 = v10;
          }

          int v4 = v9;
        }
      }
      else
      {
        uint64_t v7 = v4;
        int v4 = 0;
      }
    }
  }
  else
  {
    id v5 = v4;
    int v4 = 0;
  }

  return v4;
}

BOOL __57__EDVIPManager__validatedCloudVIPFromStore_withCloudKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_accountsChanged:(id)a3
{
  if ([(EDAccountsProvider *)self->_accountsProvider hasActiveAccounts])
  {
    int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F60630] object:0];

    [(EDVIPManager *)self _initializeKVSStore];
  }
}

- (id)_contactForName:(id)a3 emailAddresses:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v33 = a4;
  id v6 = [(EDVIPManager *)self contactStore];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v33;
  uint64_t v8 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:*(void *)(*((void *)&v47 + 1) + 8 * i)];
        uint64_t v12 = [(id)objc_opt_class() _contactDescriptors];
        uint64_t v13 = [v6 unifiedContactsMatchingPredicate:v11 keysToFetch:v12 error:0];
        [v7 addObjectsFromArray:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [v7 count];
  if (v14 == 1)
  {
    id v18 = [v7 firstObject];
    goto LABEL_46;
  }
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v35];
    id v16 = [(id)objc_opt_class() _contactDescriptors];
    uint64_t v17 = [v6 unifiedContactsMatchingPredicate:v15 keysToFetch:v16 error:0];
    [v7 addObjectsFromArray:v17];

    if ([v7 count])
    {
      id v18 = [v7 firstObject];
    }
    else
    {
      id v18 = 0;
    }
    goto LABEL_45;
  }
  uint64_t v15 = [MEMORY[0x1E4F5A470] componentsFromString:v35];
  v38 = v15;
  uint64_t v39 = [v15 givenName];
  uint64_t v19 = [v15 familyName];
  if (v39 | v19)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v34 = v7;
    uint64_t v20 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v20)
    {
      id v40 = 0;
      id v41 = 0;
      uint64_t v37 = *(void *)v44;
LABEL_16:
      uint64_t v36 = v20;
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
        id v23 = [0 givenName];
        int v24 = [0 familyName];
        int v25 = [v23 isEqualToString:v39];
        uint64_t v26 = v19;
        int v27 = [v24 isEqualToString:v19];
        if (v25 & v27) {
          break;
        }
        if (v41) {
          int v28 = 0;
        }
        else {
          int v28 = v25;
        }
        if (v28 == 1) {
          id v41 = v22;
        }
        if (v40) {
          int v29 = 0;
        }
        else {
          int v29 = v27;
        }
        if (v29 == 1) {
          id v40 = v22;
        }

        uint64_t v15 = v38;
        uint64_t v19 = v26;

        if (v36 == ++v21)
        {
          uint64_t v20 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v20) {
            goto LABEL_16;
          }
          goto LABEL_37;
        }
      }
      id v18 = v22;

      uint64_t v15 = v38;
      uint64_t v19 = v26;

      id v30 = v40;
      if (v18) {
        goto LABEL_42;
      }
    }
    else
    {
      id v40 = 0;
      id v41 = 0;
LABEL_37:

      id v30 = v40;
    }
    unint64_t v31 = v30;
    if (v30) {
      goto LABEL_41;
    }
    id v30 = v41;
    if (v41)
    {
      unint64_t v31 = 0;
LABEL_41:
      id v18 = v30;
      id v30 = v31;
LABEL_42:

      goto LABEL_44;
    }
  }
  id v18 = [(EDVIPManager *)self _contactFromContacts:v7 matchingMostAddresses:obj];
LABEL_44:

LABEL_45:
LABEL_46:

  return v18;
}

- (id)_contactFromContacts:(id)a3 matchingMostAddresses:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = [v6 count];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7)
  {

LABEL_16:
    uint64_t v8 = [obj firstObject];
    goto LABEL_17;
  }
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      id v13 = objc_alloc(MEMORY[0x1E4F605B8]);
      uint64_t v14 = [v12 emailAddresses];
      uint64_t v15 = [v14 valueForKey:@"value"];
      id v16 = (void *)[v13 initWithArray:v15];

      [v16 intersectSet:v6];
      unint64_t v17 = [v16 count];
      if (v17 > v9)
      {
        id v18 = v12;

        if (v17 == v20)
        {

          uint64_t v8 = v18;
          goto LABEL_13;
        }
        uint64_t v8 = v18;
        unint64_t v9 = v17;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_13:

  if (!v8) {
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

+ (id)_contactDescriptors
{
  if (_contactDescriptors_onceToken != -1) {
    dispatch_once(&_contactDescriptors_onceToken, &__block_literal_global_78);
  }
  id v2 = (void *)_contactDescriptors_descriptors;

  return v2;
}

void __35__EDVIPManager__contactDescriptors__block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v1 = *MEMORY[0x1E4F1ADF0];
  v5[0] = v0;
  v5[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADC8];
  v5[2] = *MEMORY[0x1E4F1ADE0];
  v5[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  int v4 = (void *)_contactDescriptors_descriptors;
  _contactDescriptors_descriptors = v3;
}

- (void)gatherStatisticsWithVIPCount:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_v12__0B8l;
  aBlock[4] = a3;
  int v4 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_4;
    void v7[3] = &unk_1E6C07AE0;
    id v8 = v4;
    [v6 vipManager:self hasVIPNotificationsEnabledWithCompletion:v7];
  }
  else
  {
    (*((void (**)(void *, void))v4 + 2))(v4, 0);
  }
}

void __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke(uint64_t a1, char a2)
{
  int v4 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_2;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  [v4 performBlock:v5];
}

uint64_t __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_2()
{
  return AnalyticsSendEventLazy();
}

id __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_3(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"vipCount";
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v6[1] = @"notificationsEnabled";
  v7[0] = v2;
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[1] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

uint64_t __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (EDVIPManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDVIPManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (NSUbiquitousKeyValueStore)keyValueStore
{
  return self->_keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedEmailAddresses, 0);

  objc_storeStrong((id *)&self->_vipsByIdentifier, 0);
}

void __35__EDVIPManager__initializeKVSStore__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = @"com.apple.mail.vipsenders";
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "%@: current store contents: %{public}@", buf, 0x16u);
}

- (void)_serializedData
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to serialize %lu entries: %{public}@", buf, 0x16u);
}

void __38__EDVIPManager__keyValueStoreChanged___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateLocalWithCloud:(uint64_t)a3 refresh:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateLocalWithCloud:(uint64_t)a3 refresh:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end