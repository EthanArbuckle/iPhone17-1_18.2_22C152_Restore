@interface BMTableUpsertSubscriber
- (BMFlexibleSimpleKeyValueStorage)keyValueStore;
- (BMTableStore)store;
- (BMTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4;
- (BMTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4 keyValueStore:(id)a5;
- (BOOL)tableSetupComplete;
- (BPSPublisher)publisher;
- (BPSSubscription)subscription;
- (NSError)tableSetupError;
- (NSString)identifier;
- (NSString)tableName;
- (id)newBookmark;
- (int64_t)receiveInput:(id)a3;
- (os_unfair_lock_s)lock;
- (void)cancel;
- (void)completeWithError:(id)a3;
- (void)handleInput:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestNextEvents;
- (void)setPublisher:(id)a3;
- (void)setSubscription:(id)a3;
- (void)setTableSetupComplete:(BOOL)a3;
- (void)setTableSetupError:(id)a3;
- (void)subscribeTo:(id)a3;
@end

@implementation BMTableUpsertSubscriber

- (BMTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4 keyValueStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BMTableUpsertSubscriber;
  v12 = [(BMTableUpsertSubscriber *)&v22 init];
  if (v12)
  {
    v13 = +[BiomeFlexibleStorageDirectory directoryForPrivateTable];
    v14 = +[BiomeFlexibleStorageDirectory privateDBPathWithIdentifier:v10 directory:v13 create:1];
    v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
    v16 = [[BMTableStore alloc] initWithURL:v15];
    store = v12->_store;
    v12->_store = v16;

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_tableName, a3);
    tableSetupError = v12->_tableSetupError;
    v12->_tableSetupError = 0;

    uint64_t v19 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v12->_keyValueStore, a5);
  }

  return v12;
}

- (BMTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4
{
  return [(BMTableUpsertSubscriber *)self initWithTableName:a3 identifier:a4 keyValueStore:0];
}

- (void)cancel
{
  p_lock = &self->_lock;
  v4 = self;
  os_unfair_lock_lock(p_lock);
  v3 = [(BMTableUpsertSubscriber *)v4 store];
  [v3 closeDB];

  os_unfair_lock_unlock(p_lock);
  [(BMTableUpsertSubscriber *)v4 setSubscription:0];
}

- (void)receiveCompletion:(id)a3
{
  id v10 = self;
  os_unfair_lock_lock(&v10->_lock);
  v3 = [(BMTableUpsertSubscriber *)v10 store];
  [v3 closeDB];

  os_unfair_lock_unlock(&v10->_lock);
  v4 = [(BMTableUpsertSubscriber *)v10 store];

  if (v4)
  {
    v5 = [(BMTableUpsertSubscriber *)v10 subscription];
    int v6 = [v5 conformsToProtocol:&unk_1F11F5510];

    if (v6)
    {
      id v7 = [(BMTableUpsertSubscriber *)v10 newBookmark];
      v8 = [(BMTableUpsertSubscriber *)v10 keyValueStore];
      id v9 = [(BMTableUpsertSubscriber *)v10 identifier];
      [v8 insertValue:v7 forKey:v9];
    }
  }
  [(BMTableUpsertSubscriber *)v10 setSubscription:0];
}

- (id)newBookmark
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMTableUpsertSubscriber *)self subscription];
  v26[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 conformsToProtocol:&unk_1F11F5510])
        {
          uint64_t v11 = [v10 newBookmark];
          if (v11) {
            goto LABEL_13;
          }
        }
        else
        {
          v12 = __biome_log_for_category();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v10;
            _os_log_error_impl(&dword_1B87BE000, v12, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }
        }
        uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
LABEL_13:
        v13 = (void *)v11;
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  id v14 = objc_alloc(MEMORY[0x1E4F501D8]);
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = (void *)[v14 initWithValue:0 upstreams:v4 name:v16];

  return v17;
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  id v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v4;
    uint64_t v7 = [v6 rows];
    if (![(BMTableUpsertSubscriber *)v5 tableSetupComplete])
    {
      uint64_t v8 = [(BMTableUpsertSubscriber *)v5 tableSetupError];

      if (!v8)
      {
        id v9 = [(BMTableUpsertSubscriber *)v5 store];
        id v10 = [(BMTableUpsertSubscriber *)v5 tableName];
        id v21 = 0;
        char v11 = [v9 addTable:v6 named:v10 error:&v21];
        id v12 = v21;
        v5->_tableSetupComplete = v11;

        if (v12)
        {
          [(BMTableUpsertSubscriber *)v5 setTableSetupError:v12];
          v13 = __biome_log_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[BMTableUpsertSubscriber receiveInput:](v5, v13);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BMTableUpsertSubscriber receiveInput:](v6);
    }
    uint64_t v7 = 0;
  }

  if ([(BMTableUpsertSubscriber *)v5 tableSetupComplete])
  {
    id v14 = [(BMTableUpsertSubscriber *)v5 store];
    id v20 = 0;
    char v15 = [v14 upsertRows:v7 error:&v20];
    id v16 = v20;

    if ((v15 & 1) == 0)
    {
      v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[BMTableUpsertSubscriber receiveInput:]();
      }
    }
  }
  os_unfair_lock_unlock(&v5->_lock);
  int64_t v18 = *MEMORY[0x1E4F501C0];

  return v18;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  [(BMTableUpsertSubscriber *)self setSubscription:v4];
  [v4 requestDemand:*MEMORY[0x1E4F501C8]];
}

- (void)subscribeTo:(id)a3
{
  [(BMTableUpsertSubscriber *)self setPublisher:a3];
  id v4 = [(BMTableUpsertSubscriber *)self publisher];
  id v5 = [v4 startWithSubscriber:self];

  if (v5) {
    [(BMTableUpsertSubscriber *)self completeWithError:v5];
  }
  else {
    [(BMTableUpsertSubscriber *)self requestNextEvents];
  }
}

- (void)handleInput:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 rows];
    if (![(BMTableUpsertSubscriber *)self tableSetupComplete])
    {
      uint64_t v7 = [(BMTableUpsertSubscriber *)self tableSetupError];

      if (!v7)
      {
        uint64_t v8 = [(BMTableUpsertSubscriber *)self store];
        id v9 = [(BMTableUpsertSubscriber *)self tableName];
        id v18 = 0;
        char v10 = [v8 addTable:v5 named:v9 error:&v18];
        id v11 = v18;
        self->_tableSetupComplete = v10;

        if (v11)
        {
          [(BMTableUpsertSubscriber *)self setTableSetupError:v11];
          id v12 = __biome_log_for_category();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[BMTableUpsertSubscriber receiveInput:](self, v12);
          }
        }
      }
    }
  }
  else
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BMTableUpsertSubscriber receiveInput:](v5);
    }
    uint64_t v6 = 0;
  }

  if ([(BMTableUpsertSubscriber *)self tableSetupComplete])
  {
    v13 = [(BMTableUpsertSubscriber *)self store];
    id v17 = 0;
    char v14 = [v13 upsertRows:v6 error:&v17];
    id v15 = v17;

    if ((v14 & 1) == 0)
    {
      id v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[BMTableUpsertSubscriber receiveInput:]();
      }
    }
  }
}

- (void)requestNextEvents
{
  v3 = [(BMTableUpsertSubscriber *)self publisher];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    do
    {
      [(BMTableUpsertSubscriber *)self handleInput:v4];
      id v5 = [(BMTableUpsertSubscriber *)self publisher];
      uint64_t v6 = [v5 nextEvent];

      id v4 = (void *)v6;
    }
    while (v6);
  }
  uint64_t v7 = [(BMTableUpsertSubscriber *)self publisher];
  int v8 = [v7 completed];

  if (v8)
  {
    [(BMTableUpsertSubscriber *)self completeWithError:0];
  }
}

- (void)completeWithError:(id)a3
{
  id v4 = [(BMTableUpsertSubscriber *)self store];
  [v4 closeDB];

  id v5 = [(BMTableUpsertSubscriber *)self store];

  if (v5)
  {
    uint64_t v6 = [(BMTableUpsertSubscriber *)self publisher];
    int v7 = [v6 conformsToProtocol:&unk_1F11F5748];

    if (v7)
    {
      int v8 = [(BMTableUpsertSubscriber *)self publisher];
      id v9 = [v8 bookmarkNode];

      if (v9)
      {
        char v10 = [(BMTableUpsertSubscriber *)self keyValueStore];
        id v11 = [(BMTableUpsertSubscriber *)self identifier];
        [v10 insertValue:v9 forKey:v11];
      }
    }
  }
  [(BMTableUpsertSubscriber *)self setPublisher:0];
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BMTableStore)store
{
  return self->_store;
}

- (BOOL)tableSetupComplete
{
  return self->_tableSetupComplete;
}

- (void)setTableSetupComplete:(BOOL)a3
{
  self->_tableSetupComplete = a3;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  self->_subscription = (BPSSubscription *)a3;
}

- (NSError)tableSetupError
{
  return self->_tableSetupError;
}

- (void)setTableSetupError:(id)a3
{
}

- (BMFlexibleSimpleKeyValueStorage)keyValueStore
{
  return self->_keyValueStore;
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_tableSetupError, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

- (void)receiveInput:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1B87BE000, v0, v1, "Error inserting rows in upsert subscriber: %@", v2);
}

- (void)receiveInput:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 tableSetupError];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1B87BE000, a2, v4, "Error setting up table in upsert subscriber: %@", v5);
}

- (void)receiveInput:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B87BE000, log, OS_LOG_TYPE_FAULT, "BMTableUpsertSubscriber: Expecting a BMTable.", v1, 2u);
}

@end