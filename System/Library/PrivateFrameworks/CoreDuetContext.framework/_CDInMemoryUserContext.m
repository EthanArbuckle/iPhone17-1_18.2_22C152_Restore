@interface _CDInMemoryUserContext
+ (id)userContext;
- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5;
- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4;
- (BOOL)evaluatePredicate:(id)a3;
- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3;
- (BOOL)hasMultiDeviceRegistrations;
- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4;
- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4;
- (BOOL)unsafe_hasMultiDeviceRegistrations;
- (NSMutableArray)pendingAllDeviceRegistrations;
- (NSMutableDictionary)contexts;
- (NSString)localDeviceID;
- (OS_dispatch_queue)syncQueue;
- (_CDInMemoryContext)userContext;
- (_CDInMemoryUserContext)init;
- (id)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6;
- (id)allDeviceIDs;
- (id)allDevices;
- (id)contextForDeviceWithDeviceID:(id)a3;
- (id)contextForKeyPath:(id)a3;
- (id)description;
- (id)deviceWithDeviceID:(id)a3 fromDevices:(id)a4;
- (id)lastModifiedDateForContextualKeyPath:(id)a3;
- (id)localContext;
- (id)namedDeviceIDsFromPredicate:(id)a3;
- (id)objectForContextualKeyPath:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)propertiesForContextualKeyPath:(id)a3;
- (id)remoteDeviceIDs;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 removedObjects:(id *)a5;
- (id)setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4;
- (id)unsafe_contextForDeviceWithDeviceID:(id)a3;
- (id)unsafe_multiDeviceRegistrations;
- (id)unsafe_multiDeviceRegistrationsByDeviceID;
- (id)unsafe_remoteDeviceIDs;
- (id)unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:(id)a3;
- (id)unsafe_remoteDevices;
- (id)unsafe_remoteDevicesByDeviceIDForRemoteUserContextProxySourceDeviceUUID:(id)a3;
- (id)unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:(id)a3;
- (id)unsafe_remoteUserContextProxySourceDeviceUUIDs;
- (id)valuesForKeyPaths:(id)a3;
- (id)valuesForKeyPaths:(id)a3 inContextsMatchingPredicate:(id)a4;
- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4;
- (void)deregisterCallback:(id)a3;
- (void)registerCallback:(id)a3;
- (void)setContextValue:(id)a3 forContextualKeyPath:(id)a4;
- (void)setContexts:(id)a3;
- (void)setLocalDeviceID:(id)a3;
- (void)setPendingAllDeviceRegistrations:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setUserContext:(id)a3;
- (void)unsafe_remoteUserContextProxySourceDeviceUUIDs;
@end

@implementation _CDInMemoryUserContext

- (id)unsafe_contextForDeviceWithDeviceID:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isEqualToString:self->_localDeviceID];
  contexts = self->_contexts;
  if (v5)
  {
    v7 = [(NSMutableDictionary *)contexts objectForKeyedSubscript:self->_localDeviceID];
  }
  else
  {
    v7 = [(NSMutableDictionary *)contexts objectForKeyedSubscript:v4];
    if (!v7)
    {
      v7 = +[_CDInMemoryContext contextWithDeviceID:v4];
      [(NSMutableDictionary *)self->_contexts setObject:v7 forKeyedSubscript:v4];
    }
  }

  return v7;
}

- (id)propertiesForContextualKeyPath:(id)a3
{
  id v4 = a3;
  int v5 = [(_CDInMemoryUserContext *)self contextForKeyPath:v4];
  v6 = [v5 propertiesForContextualKeyPath:v4];

  return v6;
}

- (id)contextForKeyPath:(id)a3
{
  id v4 = a3;
  if ([v4 isUserCentric])
  {
    int v5 = self->_userContext;
  }
  else
  {
    v6 = [v4 deviceID];
    int v5 = [(_CDInMemoryUserContext *)self contextForDeviceWithDeviceID:v6];
  }
  return v5;
}

- (id)contextForDeviceWithDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___CDInMemoryUserContext_contextForDeviceWithDeviceID___block_invoke;
  block[3] = &unk_1E56094B8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_CDInMemoryUserContext *)self contextForKeyPath:v6];
  v9 = [v8 setObject:v7 returningMetadataForContextualKeyPath:v6];

  return v9;
}

- (id)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(_CDInMemoryUserContext *)self contextForKeyPath:v10];
  uint64_t v14 = [v13 addObjects:v12 andRemoveObjects:v11 fromArrayAtKeyPath:v10 valueDidChange:a6];

  return v14;
}

- (void)deregisterCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 deviceSet];
  if (v5 != 1)
  {
    if (v5) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (![v4 isMultiDeviceRegistration])
  {
LABEL_7:
    id v10 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:self->_localDeviceID];
    [v10 deregisterCallback:v4];

    goto LABEL_10;
  }
  id v6 = [v4 predicate];
  id v7 = [(_CDInMemoryUserContext *)self namedDeviceIDsFromPredicate:v6];

  v8 = [(_CDInMemoryUserContext *)self allDevices];
  if ([v7 count])
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(_CDInMemoryUserContext *)self allDeviceIDs];
  }
  id v11 = v9;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___CDInMemoryUserContext_deregisterCallback___block_invoke;
  block[3] = &unk_1E5609640;
  id v17 = v9;
  id v18 = v7;
  id v19 = v4;
  v20 = self;
  id v21 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v11;
  dispatch_sync(syncQueue, block);

LABEL_10:
}

- (_CDInMemoryUserContext)init
{
  v16.receiver = self;
  v16.super_class = (Class)_CDInMemoryUserContext;
  v2 = [(_CDInMemoryUserContext *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CDUserContext.ramglobalcontext", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    contexts = v2->_contexts;
    v2->_contexts = (NSMutableDictionary *)v5;

    uint64_t v7 = +[_CDInMemoryContext contextWithDeviceID:v2->_localDeviceID];
    userContext = v2->_userContext;
    v2->_userContext = (_CDInMemoryContext *)v7;

    id v9 = +[_CDDevice localDevice];
    uint64_t v10 = [v9 deviceID];
    localDeviceID = v2->_localDeviceID;
    v2->_localDeviceID = (NSString *)v10;

    id v12 = +[_CDInMemoryContext contextWithDeviceID:v2->_localDeviceID];
    [(NSMutableDictionary *)v2->_contexts setObject:v12 forKeyedSubscript:v2->_localDeviceID];
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    pendingAllDeviceRegistrations = v2->_pendingAllDeviceRegistrations;
    v2->_pendingAllDeviceRegistrations = (NSMutableArray *)v13;
  }
  return v2;
}

+ (id)userContext
{
  v2 = objc_alloc_init(_CDInMemoryUserContext);
  return v2;
}

- (id)localContext
{
  return (id)[(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:self->_localDeviceID];
}

- (id)valuesForKeyPaths:(id)a3 inContextsMatchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  syncQueue = self->_syncQueue;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __72___CDInMemoryUserContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke;
  id v18 = &unk_1E56095A0;
  id v19 = self;
  id v20 = v7;
  id v21 = v6;
  id v22 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(syncQueue, &v15);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v10, v15, v16, v17, v18, v19);

  return v13;
}

- (id)valuesForKeyPaths:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = -[_CDInMemoryUserContext propertiesForContextualKeyPath:](self, "propertiesForContextualKeyPath:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v5 copy];
  return v13;
}

- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_CDInMemoryUserContext *)self contextForKeyPath:v4];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 hasKnowledgeOfContextualKeyPath:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)objectForContextualKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_CDInMemoryUserContext *)self contextForKeyPath:v4];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 objectForContextualKeyPath:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_CDInMemoryUserContext *)self contextForKeyPath:v4];
  id v6 = [v5 lastModifiedDateForContextualKeyPath:v4];

  return v6;
}

- (void)setContextValue:(id)a3 forContextualKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDInMemoryUserContext *)self contextForKeyPath:v6];
  [v8 setContextValue:v7 forContextualKeyPath:v6];
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 removedObjects:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_CDInMemoryUserContext *)self contextForKeyPath:v8];
  uint64_t v11 = [v10 removeObjectsMatchingPredicate:v9 fromArrayAtKeyPath:v8 removedObjects:a5];

  return v11;
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDInMemoryUserContext *)self contextForKeyPath:v6];
  id v9 = [v8 setObject:v7 returningMetadataForContextualKeyPath:v6];

  return v9 != 0;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDInMemoryUserContext *)self contextForKeyPath:v6];
  char v9 = [v8 addObjects:v7 toArrayAtKeyPath:v6];

  return v9;
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDInMemoryUserContext *)self contextForKeyPath:v6];
  char v9 = [v8 removeObjects:v7 fromArrayAtKeyPath:v6];

  return v9;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDInMemoryUserContext *)self contextForKeyPath:v6];
  char v9 = [v8 removeObjectsMatchingPredicate:v7 fromArrayAtKeyPath:v6];

  return v9;
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(_CDInMemoryUserContext *)self contextForKeyPath:v8];
  char v12 = [v11 addObjects:v10 andRemoveObjects:v9 fromArrayAtKeyPath:v8];

  return v12;
}

- (id)allDevices
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36___CDInMemoryUserContext_allDevices__block_invoke;
  v8[3] = &unk_1E56091D8;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(syncQueue, v8);
  id v6 = v5;

  return v6;
}

- (id)allDeviceIDs
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:3];
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38___CDInMemoryUserContext_allDeviceIDs__block_invoke;
  v8[3] = &unk_1E56091D8;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(syncQueue, v8);
  id v6 = v5;

  return v6;
}

- (id)remoteDeviceIDs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41___CDInMemoryUserContext_remoteDeviceIDs__block_invoke;
  v5[3] = &unk_1E5609618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)deviceWithDeviceID:(id)a3 fromDevices:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "deviceID", (void)v14);
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)unsafe_remoteDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v4 = [(_CDInMemoryUserContext *)self unsafe_remoteUserContextProxySourceDeviceUUIDs];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [(_CDInMemoryUserContext *)self unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:v9];
          if ([v10 count]) {
            [v3 addObjectsFromArray:v10];
          }
        }
        else
        {
          id v10 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v9;
            _os_log_error_impl(&dword_18EC9B000, v10, OS_LOG_TYPE_ERROR, "Invalid object in remote user context proxy source device array: %@", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)unsafe_remoteDeviceIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  id v4 = [(_CDInMemoryUserContext *)self unsafe_remoteUserContextProxySourceDeviceUUIDs];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [(_CDInMemoryUserContext *)self unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:v9];
          if ([v10 count]) {
            [v3 unionSet:v10];
          }
        }
        else
        {
          id v10 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v9;
            _os_log_error_impl(&dword_18EC9B000, v10, OS_LOG_TYPE_ERROR, "Invalid object in remote user context proxy source device array: %@", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  long long v16 = v4;
  uint64_t v6 = [(_CDInMemoryUserContext *)self unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = [(_CDInMemoryUserContext *)self unsafe_contextForDeviceWithDeviceID:v11];
        long long v13 = [v12 device];
        if (v13)
        {
          [v5 addObject:v13];
        }
        else
        {
          long long v14 = [MEMORY[0x1E4F5B418] mdcsChannel];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v22 = v11;
            _os_log_error_impl(&dword_18EC9B000, v14, OS_LOG_TYPE_ERROR, "Missing device for device %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  contexts = self->_contexts;
  localDeviceID = self->_localDeviceID;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)contexts objectForKeyedSubscript:localDeviceID];
  uint64_t v7 = +[_CDContextQueries keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:v5];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v6 setObject:0 forKeyedSubscript:v7];
      uint64_t v9 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_CDInMemoryUserContext unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:]();
      }
    }
  }

  return v8;
}

- (id)unsafe_remoteDevicesByDeviceIDForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v6 = [(_CDInMemoryUserContext *)self unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = [v11 deviceID];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)unsafe_remoteUserContextProxySourceDeviceUUIDs
{
  v2 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:self->_localDeviceID];
  id v3 = +[_CDContextQueries keyPathForMDCSProxies];
  id v4 = [v2 objectForKeyedSubscript:v3];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      [v2 setObject:0 forKeyedSubscript:v3];
      id v5 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[_CDInMemoryUserContext unsafe_remoteUserContextProxySourceDeviceUUIDs]();
      }

      id v4 = 0;
    }
  }

  return v4;
}

- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_CDContextQueries keyPathForMDCSProxies];
  v17[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [(_CDInMemoryUserContext *)self addObjects:v9 toArrayAtKeyPath:v8];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke;
  block[3] = &unk_1E56091B0;
  id v14 = v6;
  long long v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(syncQueue, block);
}

- (id)namedDeviceIDsFromPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "keyPaths", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) deviceID];
        id v12 = v11;
        if (v11 && ([v11 isEqualToString:self->_localDeviceID] & 1) == 0)
        {
          [v5 addObject:v12];
        }
        else
        {

          id v5 = 0;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count]) {
      goto LABEL_18;
    }
    long long v13 = v5;
    id v5 = 0;
  }
  else
  {
    long long v13 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_CDInMemoryUserContext namedDeviceIDsFromPredicate:](v4, v13);
    }
  }

LABEL_18:
  return v5;
}

- (void)registerCallback:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [v4 predicate];
  id v6 = [v5 keyPaths];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    LOBYTE(v9) = 0;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        if (v9) {
          int v9 = 1;
        }
        else {
          int v9 = [*(id *)(*((void *)&v29 + 1) + 8 * i) isUserCentric];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);

    if (v9)
    {
      [(_CDInMemoryContext *)self->_userContext registerCallback:v4];
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v12 = [v4 deviceSet];
  if (v12 != 1)
  {
    if (v12) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  if (![v4 isMultiDeviceRegistration])
  {
LABEL_20:
    long long v17 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:self->_localDeviceID];
    [v17 registerCallback:v4];

    goto LABEL_23;
  }
  long long v13 = [v4 predicate];
  id v14 = [(_CDInMemoryUserContext *)self namedDeviceIDsFromPredicate:v13];

  long long v15 = [(_CDInMemoryUserContext *)self allDevices];
  if ([v14 count])
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [(_CDInMemoryUserContext *)self allDeviceIDs];
  }
  long long v18 = v16;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CDInMemoryUserContext_registerCallback___block_invoke;
  block[3] = &unk_1E5609640;
  id v24 = v16;
  id v25 = v14;
  id v26 = v4;
  v27 = self;
  id v28 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v18;
  dispatch_sync(syncQueue, block);

LABEL_23:
}

- (BOOL)hasMultiDeviceRegistrations
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___CDInMemoryUserContext_hasMultiDeviceRegistrations__block_invoke;
  v5[3] = &unk_1E5609618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)unsafe_hasMultiDeviceRegistrations
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v3 = self->_contexts;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v19 = 0;
    uint64_t v6 = *(void *)v26;
    uint64_t v7 = off_1E5609000;
    id v20 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        char v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v9 isEqualToString:self->_localDeviceID] & 1) == 0)
        {
          uint64_t v10 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 allRegistrations];
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            id v12 = v11;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              long long v15 = v7;
              uint64_t v16 = *(void *)v22;
              while (2)
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v22 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  if ([*(id *)(*((void *)&v21 + 1) + 8 * j) isMultiDeviceRegistration])
                  {
                    char v19 = 1;
                    goto LABEL_18;
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
LABEL_18:
              uint64_t v7 = v15;
              char v3 = v20;
            }
          }
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    char v19 = 0;
  }

  return v19 & 1;
}

- (id)unsafe_multiDeviceRegistrations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(_CDInMemoryUserContext *)self unsafe_multiDeviceRegistrationsByDeviceID];
  char v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 2 * objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 allObjects];

  return v10;
}

- (id)unsafe_multiDeviceRegistrationsByDeviceID
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_contexts, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_contexts;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEqualToString:", self->_localDeviceID, (void)v13) & 1) == 0)
        {
          uint64_t v10 = [(NSMutableDictionary *)self->_contexts objectForKeyedSubscript:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 allRegistrations];
            if ([v11 count]) {
              [v3 setObject:v11 forKeyedSubscript:v9];
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)evaluatePredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v4, "keyPaths", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(_CDInMemoryUserContext *)self propertiesForContextualKeyPath:v10];
        [v5 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  long long v12 = [v4 predicate];
  char v13 = [v12 evaluateWithObject:v5 substitutionVariables:&unk_1EDDE0B88];

  return v13;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_CDInMemoryUserContext *)self contextForKeyPath:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForContextualKeyPath:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  char v3 = [MEMORY[0x1E4F28E78] string];
  syncQueue = self->_syncQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __37___CDInMemoryUserContext_description__block_invoke;
  id v11 = &unk_1E56091D8;
  id v12 = v3;
  char v13 = self;
  id v5 = v3;
  dispatch_sync(syncQueue, &v8);
  uint64_t v6 = objc_msgSend(NSString, "stringWithString:", v5, v8, v9, v10, v11);

  return v6;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (NSMutableArray)pendingAllDeviceRegistrations
{
  return self->_pendingAllDeviceRegistrations;
}

- (void)setPendingAllDeviceRegistrations:(id)a3
{
}

- (_CDInMemoryContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceID, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_pendingAllDeviceRegistrations, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (void)unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18EC9B000, v1, OS_LOG_TYPE_ERROR, "Invalid object at %{public}@: %@", v2, 0x16u);
}

- (void)unsafe_remoteUserContextProxySourceDeviceUUIDs
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_ERROR, "Invalid object at %{public}@", v1, 0xCu);
}

- (void)namedDeviceIDsFromPredicate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 keyPaths];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_ERROR, "Multi-device predicates are not yet supported: %@", v4, 0xCu);
}

- (void)evaluatePredicate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18EC9B000, v0, OS_LOG_TYPE_FAULT, "Invalid predicate: %@", v1, 0xCu);
}

@end