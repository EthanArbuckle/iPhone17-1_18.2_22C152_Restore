@interface ASRelationshipFinalizationStore
- (ASRelationshipFinalizationStore)initWithCloudType:(unint64_t)a3 contactsManager:(id)a4 clientQueue:(id)a5;
- (id)_placeholderForContactUUID:(id)a3;
- (id)allFinalizedFriendUUIDs;
- (void)_updatePlaceholder:(id)a3 contactUUID:(id)a4;
- (void)addFinalizedFriendUUIDs:(id)a3;
- (void)insertPlaceholderForEventTypes:(id)a3 contactUUID:(id)a4;
- (void)performBlockWaitingOnInviteFinalizationForContactUUID:(id)a3 block:(id)a4;
- (void)removeAllFinalizedFriendUUIDs;
- (void)removePlaceholderWithContactUUID:(id)a3 shouldNotify:(BOOL)a4;
@end

@implementation ASRelationshipFinalizationStore

- (ASRelationshipFinalizationStore)initWithCloudType:(unint64_t)a3 contactsManager:(id)a4 clientQueue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASRelationshipFinalizationStore;
  v11 = [(ASRelationshipFinalizationStore *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientQueue, a5);
    v12->_cloudType = a3;
    objc_storeStrong((id *)&v12->_contactsManager, a4);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    finalizedFriendUUIDs = v12->_finalizedFriendUUIDs;
    v12->_finalizedFriendUUIDs = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    placeholderFriendshipFinalizedTokens = v12->_placeholderFriendshipFinalizedTokens;
    v12->_placeholderFriendshipFinalizedTokens = v15;

    v12->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)insertPlaceholderForEventTypes:(id)a3 contactUUID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASRelationshipFinalizationStore *)self _placeholderForContactUUID:v7];
  id v9 = (os_log_t *)MEMORY[0x263F23AE0];
  if (v8)
  {
    ASLoggingInitialize();
    os_log_t v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = [v8 token];
      *(_DWORD *)buf = 138412290;
      id v37 = v12;
      _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "RelationshipManager found existing placeholder began token for this contact: %@", buf, 0xCu);
    }
    ASLoggingInitialize();
    v13 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "RelationshipManager removing placeholder contact to avoid orphaning the token", buf, 2u);
    }
    v14 = [v8 token];
    ASRemovePlaceholderForToken((uint64_t)v14, self->_contactsManager);
  }
  v15 = ASContactPreferringPlaceholderForUUID(v7, self->_contactsManager);
  ASLoggingInitialize();
  v16 = *v9;
  if (v15)
  {
    v28 = v8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v7;
      _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "RelationshipManager inserting placeholder contact: %@", buf, 0xCu);
    }
    id v29 = v7;
    v17 = [v15 relationshipStorage];
    objc_super v18 = [v17 relationshipForCloudType:self->_cloudType];
    v19 = [v17 remoteRelationshipForCloudType:self->_cloudType];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v30 = v6;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          objc_msgSend(v18, "insertEventWithType:", (unsigned __int16)objc_msgSend(v25, "integerValue"));
          objc_msgSend(v19, "insertEventWithType:", (unsigned __int16)objc_msgSend(v25, "integerValue"));
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v22);
    }

    [v17 setLegacyRelationship:v18];
    [v17 setLegacyRemoteRelationship:v19];
    [v15 setRelationshipStorage:v17];
    v26 = [(ASContactsManager *)self->_contactsManager savePlaceholderContact:v15];
    v27 = [[ASRelationshipBeganPlaceholder alloc] initWithToken:v26];
    id v7 = v29;
    [(ASRelationshipFinalizationStore *)self _updatePlaceholder:v27 contactUUID:v29];

    id v6 = v30;
    v8 = v28;
  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[ASRelationshipFinalizationStore insertPlaceholderForEventTypes:contactUUID:]((uint64_t)v7, v16);
  }
}

- (void)removePlaceholderWithContactUUID:(id)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(ASRelationshipFinalizationStore *)self _placeholderForContactUUID:v6];
  ASLoggingInitialize();
  v8 = (os_log_t *)MEMORY[0x263F23AE0];
  id v9 = *MEMORY[0x263F23AE0];
  os_log_t v10 = *MEMORY[0x263F23AE0];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Removing relationship began placeholder: %@", buf, 0xCu);
    }
    contactsManager = self->_contactsManager;
    v12 = [v7 token];
    [(ASContactsManager *)contactsManager removePlaceholderContactWithToken:v12];

    [(ASRelationshipFinalizationStore *)self _updatePlaceholder:0 contactUUID:v6];
    if (v4)
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__ASRelationshipFinalizationStore_removePlaceholderWithContactUUID_shouldNotify___block_invoke;
      block[3] = &unk_2652157F0;
      id v16 = v7;
      dispatch_async(clientQueue, block);
    }
    else
    {
      ASLoggingInitialize();
      os_log_t v14 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
        -[ASRelationshipFinalizationStore removePlaceholderWithContactUUID:shouldNotify:](v14, v7);
      }
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[ASRelationshipFinalizationStore removePlaceholderWithContactUUID:shouldNotify:]((uint64_t)v6, v9);
  }
}

void __81__ASRelationshipFinalizationStore_removePlaceholderWithContactUUID_shouldNotify___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  v2 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    BOOL v4 = v2;
    v5 = [v3 blocksWaitingOnSuccess];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v5 count];
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Friendship finalization success, executing %ld blocks waiting on success", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "blocksWaitingOnSuccess", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)performBlockWaitingOnInviteFinalizationForContactUUID:(id)a3 block:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ASRelationshipFinalizationStore *)self _placeholderForContactUUID:v6];
  if (v8)
  {
    ASLoggingInitialize();
    uint64_t v9 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager friendship is still finalizing, holding this action until complete for contact: %@", buf, 0xCu);
    }
    [v8 registerBlockWaitingOnSuccess:v7];
  }
  else
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__ASRelationshipFinalizationStore_performBlockWaitingOnInviteFinalizationForContactUUID_block___block_invoke;
    block[3] = &unk_2652157A0;
    id v12 = v7;
    dispatch_async(clientQueue, block);
  }
}

uint64_t __95__ASRelationshipFinalizationStore_performBlockWaitingOnInviteFinalizationForContactUUID_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_placeholderForContactUUID:(id)a3
{
  p_unfairLock = &self->_unfairLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unfairLock);
  id v6 = [(NSMutableDictionary *)self->_placeholderFriendshipFinalizedTokens objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_unfairLock);
  return v6;
}

- (void)_updatePlaceholder:(id)a3 contactUUID:(id)a4
{
  p_unfairLock = &self->_unfairLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_unfairLock);
  [(NSMutableDictionary *)self->_placeholderFriendshipFinalizedTokens setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_unfairLock);
}

- (void)addFinalizedFriendUUIDs:(id)a3
{
  p_unfairLock = &self->_unfairLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unfairLock);
  [(NSMutableArray *)self->_finalizedFriendUUIDs addObject:v5];

  os_unfair_lock_unlock(p_unfairLock);
}

- (id)allFinalizedFriendUUIDs
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  BOOL v4 = (void *)[(NSMutableArray *)self->_finalizedFriendUUIDs copy];
  os_unfair_lock_unlock(p_unfairLock);
  return v4;
}

- (void)removeAllFinalizedFriendUUIDs
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  BOOL v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  finalizedFriendUUIDs = self->_finalizedFriendUUIDs;
  self->_finalizedFriendUUIDs = v4;

  os_unfair_lock_unlock(p_unfairLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderFriendshipFinalizedTokens, 0);
  objc_storeStrong((id *)&self->_finalizedFriendUUIDs, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (void)insertPlaceholderForEventTypes:(uint64_t)a1 contactUUID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "RelationshipManager failed to find contact: %@", (uint8_t *)&v2, 0xCu);
}

- (void)removePlaceholderWithContactUUID:(uint64_t)a1 shouldNotify:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "No existing relationship began placeholder for contact: %@", (uint8_t *)&v2, 0xCu);
}

- (void)removePlaceholderWithContactUUID:(void *)a1 shouldNotify:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 blocksWaitingOnSuccess];
  int v5 = 134217984;
  uint64_t v6 = [v4 count];
  _os_log_error_impl(&dword_2474C9000, v3, OS_LOG_TYPE_ERROR, "Friendship finalization failed, not executing %ld blocks waiting on success", (uint8_t *)&v5, 0xCu);
}

@end