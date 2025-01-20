@interface FBApplicationDataStoreRepositoryServer
+ (id)sharedInstance;
- (BOOL)shouldAllowClientConnection:(id)a3 withMessage:(id)a4;
- (FBApplicationDataStoreRepository)dataStore;
- (id)_init;
- (id)_prerequisiteMilestones;
- (void)_handleGetAvailableDataStores:(id)a3;
- (void)_handleGetObjectForKey:(id)a3;
- (void)_handleMigrateIdentifier:(id)a3;
- (void)_handleRemoveAllObjects:(id)a3;
- (void)_handleRemoveObjectForKey:(id)a3 context:(id)a4;
- (void)_handleSetChangesInterest:(id)a3 context:(id)a4;
- (void)_handleSetObjectForKey:(id)a3 context:(id)a4;
- (void)_handleSetPrefetchedKeys:(id)a3 context:(id)a4;
- (void)_handleSynchronize:(id)a3;
- (void)applicationDataStoreRepositoryClientContext:(id)a3 repositoryInvalidatedForAppID:(id)a4;
- (void)applicationDataStoreRepositoryClientContext:(id)a3 valueChangedForObject:(id)a4 key:(id)a5 appID:(id)a6;
- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4;
- (void)noteClientDidDisconnect:(id)a3;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)setDataStore:(id)a3;
@end

@implementation FBApplicationDataStoreRepositoryServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) { {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_8);
  }
  }
  v2 = (void *)sharedInstance___shared;

  return v2;
}

void __56__FBApplicationDataStoreRepositoryServer_sharedInstance__block_invoke()
{
  if ([MEMORY[0x1E4F628D8] isServerProcess])
  {
    id v0 = [[FBApplicationDataStoreRepositoryServer alloc] _init];
    v1 = (void *)sharedInstance___shared;
    sharedInstance___shared = (uint64_t)v0;
  }
}

- (id)_init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("FBApplicationDataStoreRepositoryServer", v3);

  v5 = [MEMORY[0x1E4F62AC8] _queueWithSerialDispatchQueue:v4];
  uint64_t v6 = *MEMORY[0x1E4F624F8];
  v14.receiver = self;
  v14.super_class = (Class)FBApplicationDataStoreRepositoryServer;
  v7 = [(FBSServiceFacility *)&v14 initWithIdentifier:v6 queue:v5];
  if (v7)
  {
    v8 = +[FBApplicationDataStoreRepositoryManager sharedInstance];
    uint64_t v9 = [v8 dataStore];
    dataStore = v7->_dataStore;
    v7->_dataStore = (FBApplicationDataStoreRepository *)v9;

    uint64_t v11 = +[FBServiceClientAuthenticator sharedSystemClientAuthenticator];
    connectionAuthenticator = v7->_connectionAuthenticator;
    v7->_connectionAuthenticator = (FBServiceClientAuthenticator *)v11;
  }
  return v7;
}

- (id)_prerequisiteMilestones
{
  return 0;
}

- (BOOL)shouldAllowClientConnection:(id)a3 withMessage:(id)a4
{
  return -[FBServiceClientAuthenticator authenticateClient:](self->_connectionAuthenticator, "authenticateClient:", a3, a4);
}

- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [[FBApplicationDataStoreRepositoryServerClientContext alloc] initWithDataStore:self->_dataStore];
  [(FBApplicationDataStoreRepositoryServerClientContext *)v6 setDelegate:self];
  [v5 setContext:v6];
}

- (void)noteClientDidDisconnect:(id)a3
{
  id v3 = [a3 context];
  [v3 setDelegate:0];
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v9 = a3;
  v8 = [a5 context];
  switch(a4)
  {
    case 0:
      [(FBApplicationDataStoreRepositoryServer *)self _handleSynchronize:v9];
      break;
    case 1:
      [(FBApplicationDataStoreRepositoryServer *)self _handleGetAvailableDataStores:v9];
      break;
    case 2:
      [(FBApplicationDataStoreRepositoryServer *)self _handleMigrateIdentifier:v9];
      break;
    case 3:
      [(FBApplicationDataStoreRepositoryServer *)self _handleGetObjectForKey:v9];
      break;
    case 4:
      [(FBApplicationDataStoreRepositoryServer *)self _handleSetObjectForKey:v9 context:v8];
      break;
    case 5:
      [(FBApplicationDataStoreRepositoryServer *)self _handleRemoveObjectForKey:v9 context:v8];
      break;
    case 6:
      [(FBApplicationDataStoreRepositoryServer *)self _handleRemoveAllObjects:v9];
      break;
    case 7:
      [(FBApplicationDataStoreRepositoryServer *)self _handleSetPrefetchedKeys:v9 context:v8];
      break;
    case 8:
      [(FBApplicationDataStoreRepositoryServer *)self _handleSetChangesInterest:v9 context:v8];
      break;
    default:
      break;
  }
}

- (void)_handleSetPrefetchedKeys:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 payload];
  id v9 = BSDeserializeCFValueFromXPCDictionaryWithKey();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  }
  else
  {
    v10 = 0;
  }
  [v6 setPrefetchedKeys:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__FBApplicationDataStoreRepositoryServer__handleSetPrefetchedKeys_context___block_invoke;
  v12[3] = &unk_1E5C4A330;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [v7 sendReplyMessageWithPacker:v12];
}

void __75__FBApplicationDataStoreRepositoryServer__handleSetPrefetchedKeys_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 40);
  dispatch_queue_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = [v3 allObjects];
  id v6 = [v4 allObjectsForKeys:v5];

  if (v6) { {
    BSSerializeCFValueToXPCDictionaryWithKey();
  }
  }
}

- (void)_handleSetChangesInterest:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  id v6 = [v8 payload];
  BOOL v7 = xpc_dictionary_get_BOOL(v6, (const char *)*MEMORY[0x1E4F62510]);

  [v5 setInterestedInAllChanges:v7];
  [v8 sendReplyMessageWithPacker:&__block_literal_global_11];
}

- (void)_handleSynchronize:(id)a3
{
  dataStore = self->_dataStore;
  id v4 = a3;
  [(FBApplicationDataStoreRepository *)dataStore flushSynchronously];
  [v4 sendReplyMessageWithPacker:&__block_literal_global_13_0];
}

- (void)_handleGetAvailableDataStores:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__FBApplicationDataStoreRepositoryServer__handleGetAvailableDataStores___block_invoke;
  v3[3] = &unk_1E5C497C8;
  v3[4] = self;
  [a3 sendReplyMessageWithPacker:v3];
}

void __72__FBApplicationDataStoreRepositoryServer__handleGetAvailableDataStores___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) applicationIdentifiersWithState];
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1C978] array];
  }
  BSSerializeCFValueToXPCDictionaryWithKey();
}

- (void)_handleMigrateIdentifier:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 payload];
  id v6 = BSDeserializeStringFromXPCDictionaryWithKey();
  uint64_t v7 = BSDeserializeStringFromXPCDictionaryWithKey();
  id v8 = (void *)v7;
  if (v6) { {
    BOOL v9 = v7 == 0;
  }
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = @"Invalid parameters ";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v12 = [v10 errorWithDomain:@"FBApplicationDataStore" code:1 userInfo:v11];
  }
  else
  {
    v12 = [(FBApplicationDataStoreRepository *)self->_dataStore migrateIdentifier:v6 toIdentifier:v7];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__FBApplicationDataStoreRepositoryServer__handleMigrateIdentifier___block_invoke;
  v14[3] = &unk_1E5C497C8;
  id v15 = v12;
  id v13 = v12;
  [v4 sendReplyMessageWithPacker:v14];
}

uint64_t __67__FBApplicationDataStoreRepositoryServer__handleMigrateIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F411A118](*(void *)(a1 + 32), a2, *MEMORY[0x1E4F62538]);
}

- (void)_handleGetObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  id v6 = BSDeserializeStringFromXPCDictionaryWithKey();
  uint64_t v7 = BSDeserializeStringFromXPCDictionaryWithKey();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__FBApplicationDataStoreRepositoryServer__handleGetObjectForKey___block_invoke;
  v10[3] = &unk_1E5C4A358;
  id v11 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = v7;
  id v9 = v6;
  [v4 sendReplyMessageWithPacker:v10];
}

void __65__FBApplicationDataStoreRepositoryServer__handleGetObjectForKey___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (a1[4] && a1[5])
  {
    id v5 = v3;
    id v4 = objc_msgSend(*(id *)(a1[6] + 56), "objectForKey:forApplication:");
    if (v4) { {
      BSSerializeCFValueToXPCDictionaryWithKey();
    }
    }

    id v3 = v5;
  }
}

- (void)_handleSetObjectForKey:(id)a3 context:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__FBApplicationDataStoreRepositoryServer__handleSetObjectForKey_context___block_invoke;
  v7[3] = &unk_1E5C4A330;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 sendReplyMessageWithPacker:v7];
}

void __73__FBApplicationDataStoreRepositoryServer__handleSetObjectForKey_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) payload];
  id v6 = (id)BSCreateDeserializedCFValueFromXPCDictionaryWithKey();

  if (v6)
  {
    id v3 = [*(id *)(a1 + 32) payload];
    id v4 = BSDeserializeStringFromXPCDictionaryWithKey();
    id v5 = BSDeserializeStringFromXPCDictionaryWithKey();
    [*(id *)(*(void *)(a1 + 40) + 56) setObject:v6 forKey:v4 forApplication:v5];
  }
}

- (void)_handleRemoveObjectForKey:(id)a3 context:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__FBApplicationDataStoreRepositoryServer__handleRemoveObjectForKey_context___block_invoke;
  v7[3] = &unk_1E5C4A330;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v6 sendReplyMessageWithPacker:v7];
}

void __76__FBApplicationDataStoreRepositoryServer__handleRemoveObjectForKey_context___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) payload];
  v2 = BSDeserializeStringFromXPCDictionaryWithKey();
  id v3 = BSDeserializeStringFromXPCDictionaryWithKey();
  [*(id *)(*(void *)(a1 + 40) + 56) removeObjectForKey:v2 forApplication:v3];
}

- (void)_handleRemoveAllObjects:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__FBApplicationDataStoreRepositoryServer__handleRemoveAllObjects___block_invoke;
  v6[3] = &unk_1E5C4A330;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 sendReplyMessageWithPacker:v6];
}

void __66__FBApplicationDataStoreRepositoryServer__handleRemoveAllObjects___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) payload];
  BSDeserializeStringFromXPCDictionaryWithKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(*(void *)(a1 + 40) + 56) removeAllObjectsForApplication:v3];
}

- (void)applicationDataStoreRepositoryClientContext:(id)a3 valueChangedForObject:(id)a4 key:(id)a5 appID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a3 clientHandle];
  if (v13)
  {
    objc_super v14 = (void *)MEMORY[0x1E4F62B40];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __118__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_valueChangedForObject_key_appID___block_invoke;
    v17[3] = &unk_1E5C4A358;
    id v18 = v11;
    id v19 = v12;
    id v20 = v10;
    id v15 = [v14 messageWithPacker:v17];
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
    [(FBSServiceFacility *)self sendMessage:v15 withType:9 toClients:v16];
  }
}

void __118__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_valueChangedForObject_key_appID___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62530], (const char *)[*(id *)(a1 + 32) UTF8String]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F62518], (const char *)[*(id *)(a1 + 40) UTF8String]);
  id v3 = *(void **)(a1 + 48);
  id v4 = [MEMORY[0x1E4F1CA98] null];
  LOBYTE(v3) = [v3 isEqual:v4];

  if ((v3 & 1) == 0) { {
    BSSerializeCFValueToXPCDictionaryWithKey();
  }
  }
}

- (void)applicationDataStoreRepositoryClientContext:(id)a3 repositoryInvalidatedForAppID:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientHandle];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F62B40];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __116__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_repositoryInvalidatedForAppID___block_invoke;
    v11[3] = &unk_1E5C497C8;
    id v12 = v6;
    id v9 = [v8 messageWithPacker:v11];
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    [(FBSServiceFacility *)self sendMessage:v9 withType:10 toClients:v10];
  }
}

void __116__FBApplicationDataStoreRepositoryServer_applicationDataStoreRepositoryClientContext_repositoryInvalidatedForAppID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (const char *)*MEMORY[0x1E4F62518];
  id v4 = *(id *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, v3, (const char *)[v4 UTF8String]);
}

- (FBApplicationDataStoreRepository)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end