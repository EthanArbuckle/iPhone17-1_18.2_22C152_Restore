@interface FBSApplicationDataStoreRepositoryClient
- (BOOL)_isChangeInFlightForPrefetchedKey:(id)a3 application:(id)a4;
- (BOOL)prefetchedObjectIfAvailableForKey:(id)a3 application:(id)a4 outObject:(id *)a5;
- (FBSApplicationDataStoreRepositoryClient)init;
- (id)_allPrefetchedChangesInFlightForApplication:(id)a3;
- (id)_observers;
- (id)availableDataStores;
- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4;
- (id)objectForKey:(id)a3 forApplication:(id)a4;
- (void)_calloutQueue_handleStoreInvalidated:(id)a3;
- (void)_calloutQueue_handleValueChanged:(id)a3;
- (void)_sendMessageType:(int)a3 withMessage:(id)a4 withReplyHandler:(id)a5 waitForReply:(BOOL)a6;
- (void)_sendPrefetchedKeys:(id)a3 withCompletion:(id)a4;
- (void)_setChangeInFlight:(BOOL)a3 forPrefetchedKey:(id)a4 application:(id)a5;
- (void)_setPrefetchedObjectIfNecessary:(id)a3 forKey:(id)a4 application:(id)a5;
- (void)addObserver:(id)a3;
- (void)addPrefetchedKeys:(id)a3;
- (void)fireCompletion:(id)a3 error:(id)a4;
- (void)handleMessage:(id)a3 withType:(int64_t)a4;
- (void)invalidate;
- (void)removeAllObjectsForApplication:(id)a3 withCompletion:(id)a4;
- (void)removeObjectForKey:(id)a3 forApplication:(id)a4 withCompletion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removePrefetchedKeys:(id)a3 withCompletion:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5 withCompletion:(id)a6;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation FBSApplicationDataStoreRepositoryClient

- (FBSApplicationDataStoreRepositoryClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)FBSApplicationDataStoreRepositoryClient;
  v2 = [(FBSServiceFacilityClient *)&v13 initWithConfigurator:&__block_literal_global_3];
  v3 = v2;
  if (v2)
  {
    v2->_prefetchedDataLock._os_unfair_lock_opaque = 0;
    v4 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    prefetchedKeys = v3->_prefetchedKeys;
    v3->_prefetchedKeys = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    prefetchedKeyValues = v3->_prefetchedKeyValues;
    v3->_prefetchedKeyValues = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingChangesToPrefetchedKeys = v3->_pendingChangesToPrefetchedKeys;
    v3->_pendingChangesToPrefetchedKeys = v8;

    v3->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;
  }
  return v3;
}

void __47__FBSApplicationDataStoreRepositoryClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[FBSServiceFacilityClient defaultShellEndpoint];
  [v2 setEndpoint:v3];

  [v2 setIdentifier:@"com.apple.frontboardservices.applicationdatastore"];
  id v4 = [off_1E58F4580 userInitiated];
  [v2 setServiceQuality:v4];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)FBSApplicationDataStoreRepositoryClient;
  [(FBSServiceFacilityClient *)&v2 invalidate];
}

- (void)addPrefetchedKeys:(id)a3
{
  p_prefetchedDataLock = &self->_prefetchedDataLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_prefetchedDataLock);
  os_unfair_lock_lock(p_prefetchedDataLock);
  [(NSCountedSet *)self->_prefetchedKeys addObjectsFromArray:v5];

  id v6 = [(NSCountedSet *)self->_prefetchedKeys allObjects];
  os_unfair_lock_unlock(p_prefetchedDataLock);
  [(FBSApplicationDataStoreRepositoryClient *)self _sendPrefetchedKeys:v6 withCompletion:0];
}

- (void)removePrefetchedKeys:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NSCountedSet removeObject:](self->_prefetchedKeys, "removeObject:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_super v13 = [(NSCountedSet *)self->_prefetchedKeys allObjects];
  os_unfair_lock_unlock(&self->_prefetchedDataLock);
  [(FBSApplicationDataStoreRepositoryClient *)self _sendPrefetchedKeys:v13 withCompletion:v7];
}

- (void)_sendPrefetchedKeys:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke;
  v13[3] = &unk_1E58F5278;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_2;
  v11[3] = &unk_1E58F52C8;
  v11[4] = self;
  id v12 = v7;
  BOOL v8 = v7 == 0;
  id v9 = v7;
  id v10 = v6;
  [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:7 withMessage:v13 withReplyHandler:v11 waitForReply:v8];
}

void __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke()
{
}

void __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_2()
{
}

void __78__FBSApplicationDataStoreRepositoryClient__sendPrefetchedKeys_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = *(void **)(*(void *)(a1 + 32) + 96);
      id v7 = (void *)[v5 mutableCopy];
      [v6 setObject:v7 forKey:v8];
    }
  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__FBSApplicationDataStoreRepositoryClient_synchronizeWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58F52C8;
  v7[4] = self;
  id v8 = v4;
  BOOL v5 = v4 == 0;
  id v6 = v4;
  [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:0 withMessage:&__block_literal_global_12 withReplyHandler:v7 waitForReply:v5];
}

uint64_t __69__FBSApplicationDataStoreRepositoryClient_synchronizeWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fireCompletion:*(void *)(a1 + 40) error:0];
}

- (id)availableDataStores
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__1;
  id v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__FBSApplicationDataStoreRepositoryClient_availableDataStores__block_invoke_2;
  v4[3] = &unk_1E58F5310;
  v4[4] = &v5;
  [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:1 withMessage:&__block_literal_global_14 withReplyHandler:v4 waitForReply:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __62__FBSApplicationDataStoreRepositoryClient_availableDataStores__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BSDeserializeCFValueFromXPCDictionaryWithKey();
  }
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:].cold.4();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v9)
  {
    long long v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationDataStoreRepositoryClient migrateIdentifier:toIdentifier:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke;
  v19[3] = &unk_1E58F5338;
  id v10 = v8;
  id v20 = v10;
  id v11 = v9;
  id v21 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke_2;
  v18[3] = &unk_1E58F5310;
  v18[4] = &v22;
  [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:2 withMessage:v19 withReplyHandler:v18 waitForReply:1];
  id v12 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, "appID", (const char *)[v4 UTF8String]);
  xpc_dictionary_set_string(xdict, "appID2", (const char *)[*(id *)(a1 + 40) UTF8String]);
}

void __74__FBSApplicationDataStoreRepositoryClient_migrateIdentifier_toIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_opt_class();
    BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  }
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4101 userInfo:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1;
    uint64_t v24 = __Block_byref_object_dispose__1;
    id v25 = 0;
    id obj = 0;
    BOOL v10 = [(FBSApplicationDataStoreRepositoryClient *)self prefetchedObjectIfAvailableForKey:v6 application:v7 outObject:&obj];
    objc_storeStrong(&v25, obj);
    if (!v10)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke;
      v16[3] = &unk_1E58F5338;
      id v17 = v6;
      id v18 = v8;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke_2;
      v12[3] = &unk_1E58F5360;
      long long v15 = &v20;
      v12[4] = self;
      id v13 = v17;
      id v14 = v18;
      [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:3 withMessage:v16 withReplyHandler:v12 waitForReply:1];
    }
    id v9 = (id)v21[5];
    _Block_object_dispose(&v20, 8);
  }

  return v9;
}

void __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, "key", (const char *)[v4 UTF8String]);
  xpc_dictionary_set_string(xdict, "appID", (const char *)[*(id *)(a1 + 40) UTF8String]);
}

uint64_t __71__FBSApplicationDataStoreRepositoryClient_objectForKey_forApplication___block_invoke_2(void *a1, uint64_t a2)
{
  if (a2) {
    BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
  }
  uint64_t v3 = a1[6];
  uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];

  return [v5 _setPrefetchedObjectIfNecessary:v4 forKey:v6 application:v3];
}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11 && v12)
  {
    if (v10)
    {
      [(FBSApplicationDataStoreRepositoryClient *)self _setPrefetchedObjectIfNecessary:v10 forKey:v11 application:v12];
      [(FBSApplicationDataStoreRepositoryClient *)self _setChangeInFlight:1 forPrefetchedKey:v11 application:v12];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke;
      v18[3] = &unk_1E58F5388;
      id v19 = v11;
      id v20 = v10;
      id v21 = v12;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke_2;
      v14[3] = &unk_1E58F53B0;
      v14[4] = self;
      id v15 = v19;
      id v16 = v21;
      id v17 = v13;
      [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:4 withMessage:v18 withReplyHandler:v14 waitForReply:0];
    }
    else
    {
      [(FBSApplicationDataStoreRepositoryClient *)self removeObjectForKey:v11 forApplication:v12 withCompletion:v13];
    }
  }
  else
  {
    [(FBSApplicationDataStoreRepositoryClient *)self fireCompletion:v13 error:0];
  }
}

void __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __90__FBSApplicationDataStoreRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setChangeInFlight:0 forPrefetchedKey:*(void *)(a1 + 40) application:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 fireCompletion:v3 error:0];
}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    [(FBSApplicationDataStoreRepositoryClient *)self _setPrefetchedObjectIfNecessary:0 forKey:v8 application:v9];
    [(FBSApplicationDataStoreRepositoryClient *)self _setChangeInFlight:1 forPrefetchedKey:v8 application:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke;
    v15[3] = &unk_1E58F5338;
    id v16 = v8;
    id v17 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke_2;
    v11[3] = &unk_1E58F53B0;
    v11[4] = self;
    id v12 = v16;
    id v13 = v17;
    id v14 = v10;
    [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:5 withMessage:v15 withReplyHandler:v11 waitForReply:0];
  }
  else
  {
    [(FBSApplicationDataStoreRepositoryClient *)self fireCompletion:v10 error:0];
  }
}

void __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, "key", (const char *)[v4 UTF8String]);
  xpc_dictionary_set_string(xdict, "appID", (const char *)[*(id *)(a1 + 40) UTF8String]);
}

uint64_t __92__FBSApplicationDataStoreRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setChangeInFlight:0 forPrefetchedKey:*(void *)(a1 + 40) application:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 fireCompletion:v3 error:0];
}

- (void)removeAllObjectsForApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke;
    v10[3] = &unk_1E58F5278;
    id v11 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke_2;
    v8[3] = &unk_1E58F52C8;
    v8[4] = self;
    id v9 = v7;
    [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:6 withMessage:v10 withReplyHandler:v8 waitForReply:0];
  }
  else
  {
    [(FBSApplicationDataStoreRepositoryClient *)self fireCompletion:v7 error:0];
  }
}

void __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, "appID", (const char *)[v3 UTF8String]);
}

uint64_t __89__FBSApplicationDataStoreRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fireCompletion:*(void *)(a1 + 40) error:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  if (![(NSHashTable *)self->_observers count]) {
    [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:8 withMessage:&__block_literal_global_30 withReplyHandler:0 waitForReply:0];
  }
  [(NSHashTable *)self->_observers addObject:v4];
  os_unfair_lock_unlock(&self->_observersLock);
}

void __55__FBSApplicationDataStoreRepositoryClient_addObserver___block_invoke(int a1, xpc_object_t xdict)
{
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  if (![(NSHashTable *)self->_observers count]) {
    [(FBSApplicationDataStoreRepositoryClient *)self _sendMessageType:8 withMessage:&__block_literal_global_32 withReplyHandler:0 waitForReply:0];
  }

  os_unfair_lock_unlock(p_observersLock);
}

void __58__FBSApplicationDataStoreRepositoryClient_removeObserver___block_invoke(int a1, xpc_object_t xdict)
{
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 10)
  {
    id v8 = v6;
    id v6 = (id)[(FBSApplicationDataStoreRepositoryClient *)self _calloutQueue_handleStoreInvalidated:v6];
  }
  else
  {
    if (a4 != 9) {
      goto LABEL_6;
    }
    id v8 = v6;
    id v6 = (id)[(FBSApplicationDataStoreRepositoryClient *)self _calloutQueue_handleValueChanged:v6];
  }
  id v7 = v8;
LABEL_6:

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_calloutQueue_handleValueChanged:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 payload];
  [NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "key")];
  objc_claimAutoreleasedReturnValue();
  BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
}

- (void)_setChangeInFlight:(BOOL)a3 forPrefetchedKey:(id)a4 application:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_pendingChangesToPrefetchedKeys objectForKey:v8];
  id v10 = (void *)v9;
  if (v6 && !v9)
  {
    id v10 = [MEMORY[0x1E4F28BD0] set];
    [(NSMutableDictionary *)self->_pendingChangesToPrefetchedKeys setObject:v10 forKey:v8];
  }
  if (v6)
  {
    [v10 addObject:v11];
  }
  else
  {
    [v10 removeObject:v11];
    if (v10 && ![v10 count]) {
      [(NSMutableDictionary *)self->_pendingChangesToPrefetchedKeys removeObjectForKey:v8];
    }
  }
  os_unfair_lock_unlock(&self->_prefetchedDataLock);
}

- (BOOL)_isChangeInFlightForPrefetchedKey:(id)a3 application:(id)a4
{
  p_prefetchedDataLock = &self->_prefetchedDataLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_prefetchedDataLock);
  os_unfair_lock_lock(p_prefetchedDataLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_pendingChangesToPrefetchedKeys objectForKey:v7];

  LOBYTE(v7) = [v9 containsObject:v8];
  os_unfair_lock_unlock(p_prefetchedDataLock);
  return (char)v7;
}

- (id)_allPrefetchedChangesInFlightForApplication:(id)a3
{
  p_prefetchedDataLock = &self->_prefetchedDataLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_prefetchedDataLock);
  os_unfair_lock_lock(p_prefetchedDataLock);
  BOOL v6 = [(NSMutableDictionary *)self->_pendingChangesToPrefetchedKeys objectForKey:v5];

  os_unfair_lock_unlock(p_prefetchedDataLock);

  return v6;
}

- (void)_calloutQueue_handleStoreInvalidated:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = [a3 payload];
  uint64_t v4 = [NSString stringWithUTF8String:xpc_dictionary_get_string(v16, "appID")];
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  id v5 = [(NSMutableDictionary *)self->_prefetchedKeyValues objectForKey:v4];
  BOOL v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(NSMutableDictionary *)self->_pendingChangesToPrefetchedKeys objectForKey:v4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__FBSApplicationDataStoreRepositoryClient__calloutQueue_handleStoreInvalidated___block_invoke;
  v21[3] = &unk_1E58F53D8;
  id v15 = v5;
  id v22 = v15;
  id v8 = v6;
  id v23 = v8;
  [v7 enumerateObjectsUsingBlock:v21];
  [(NSMutableDictionary *)self->_prefetchedKeyValues setObject:v8 forKey:v4];
  os_unfair_lock_unlock(&self->_prefetchedDataLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [(FBSApplicationDataStoreRepositoryClient *)self _observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v14 applicationDataStoreRepositoryClient:self storeInvalidatedForApplication:v4];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v11);
  }
}

void __80__FBSApplicationDataStoreRepositoryClient__calloutQueue_handleStoreInvalidated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKey:];
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKey:v4];
  }
}

- (void)_setPrefetchedObjectIfNecessary:(id)a3 forKey:(id)a4 application:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  if ([(NSCountedSet *)self->_prefetchedKeys countForObject:v8])
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_prefetchedKeyValues objectForKey:v9];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_prefetchedKeyValues setObject:v10 forKey:v9];
    }
    if (v11) {
      [v10 setObject:v11 forKey:v8];
    }
    else {
      [v10 removeObjectForKey:v8];
    }
  }
  os_unfair_lock_unlock(&self->_prefetchedDataLock);
}

- (BOOL)prefetchedObjectIfAvailableForKey:(id)a3 application:(id)a4 outObject:(id *)a5
{
  id v8 = a3;
  p_prefetchedDataLock = &self->_prefetchedDataLock;
  id v10 = a4;
  os_unfair_lock_assert_not_owner(&self->_prefetchedDataLock);
  os_unfair_lock_lock(&self->_prefetchedDataLock);
  id v11 = [(NSMutableDictionary *)self->_prefetchedKeyValues objectForKey:v10];

  if (v11)
  {
    uint64_t v12 = [v11 objectForKey:v8];
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
    uint64_t v12 = 0;
  }
  if ([(NSCountedSet *)self->_prefetchedKeys countForObject:v8]) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13;
  }
  id v15 = [MEMORY[0x1E4F1CA98] null];
  if ([v12 isEqual:v15]) {
    id v16 = 0;
  }
  else {
    id v16 = v12;
  }
  id v17 = v16;

  os_unfair_lock_unlock(p_prefetchedDataLock);
  if (a5)
  {
    if (v14) {
      long long v18 = v17;
    }
    else {
      long long v18 = 0;
    }
    *a5 = v18;
  }

  return v14;
}

- (id)_observers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(p_observersLock);
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  os_unfair_lock_unlock(p_observersLock);

  return v4;
}

- (void)_sendMessageType:(int)a3 withMessage:(id)a4 withReplyHandler:(id)a5 waitForReply:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke;
  v17[3] = &unk_1E58F5400;
  id v18 = v10;
  id v12 = v10;
  BOOL v13 = +[FBSXPCMessage messageWithPacker:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2;
  v15[3] = &unk_1E58F5428;
  id v16 = v11;
  id v14 = v11;
  [(FBSServiceFacilityClient *)self sendMessage:v13 withType:a3 replyHandler:v15 waitForReply:v6 timeout:0.0];
}

uint64_t __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__FBSApplicationDataStoreRepositoryClient__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 payload];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)fireCompletion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FBSServiceFacilityClient *)self calloutQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__FBSApplicationDataStoreRepositoryClient_fireCompletion_error___block_invoke;
    v9[3] = &unk_1E58F5450;
    id v11 = v6;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __64__FBSApplicationDataStoreRepositoryClient_fireCompletion_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingChangesToPrefetchedKeys, 0);
  objc_storeStrong((id *)&self->_prefetchedKeyValues, 0);

  objc_storeStrong((id *)&self->_prefetchedKeys, 0);
}

- (void)migrateIdentifier:toIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateIdentifier:toIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateIdentifier:toIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)migrateIdentifier:toIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end