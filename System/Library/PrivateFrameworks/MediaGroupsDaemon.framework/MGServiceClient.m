@interface MGServiceClient
- (BOOL)isEqual:(id)a3;
- (MGServiceClient)initWithConnection:(id)a3;
- (NSDictionary)queries;
- (NSXPCConnection)connection;
- (OS_os_transaction)transaction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)outstandingQueryForIdentifier:(id)a3;
- (unint64_t)hash;
- (void)_withLock:(os_unfair_lock_s *)a1;
- (void)addQuery:(id)a3;
- (void)enumerateQueriesUsingBlock:(id)a3;
- (void)removeQuery:(id)a3;
- (void)setQueries:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MGServiceClient

- (MGServiceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MGServiceClient;
  v6 = [(MGServiceClient *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    queries = v7->_queries;
    v7->_queries = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MGServiceClient *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(MGServiceClient *)self connection];
      v6 = [(MGServiceClient *)v4 connection];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MGServiceClient *)self connection];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MGServiceClient alloc];
  id v5 = [(MGServiceClient *)self connection];
  v6 = [(MGServiceClient *)v4 initWithConnection:v5];

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MGServiceClient *)self connection];
  char v7 = [v3 stringWithFormat:@"<%@: %p, connection = %p>", v5, self, v6];

  return v7;
}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    v2 = a1 + 2;
    unint64_t v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (void)setQueries:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(MGServiceClient *)self queries];
  char v6 = [v4 isEqualToDictionary:v5];

  if ((v6 & 1) == 0)
  {
    char v7 = (NSDictionary *)[v4 copy];
    queries = self->_queries;
    self->_queries = v7;

    NSUInteger v9 = [(NSDictionary *)self->_queries count];
    uint64_t v10 = [(MGServiceClient *)self transaction];
    v11 = (void *)v10;
    if (!v9 || v10)
    {
      if (!v9 && v10) {
        [(MGServiceClient *)self setTransaction:0];
      }
    }
    else
    {
      v12 = [(MGServiceClient *)self connection];
      int v13 = [v12 processIdentifier];

      memset(buffer, 0, sizeof(buffer));
      *((unsigned char *)buffer + proc_name(v13, buffer, 0x40u)) = 0;
      if (LOBYTE(buffer[0])) {
        v14 = (const char *)buffer;
      }
      else {
        v14 = "unknown";
      }
      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.MediaGroups.queries-%s", v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      [v15 UTF8String];
      v16 = (void *)os_transaction_create();
      [(MGServiceClient *)self setTransaction:v16];
    }
  }
}

- (void)addQuery:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__MGServiceClient_addQuery___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);
}

void __28__MGServiceClient_addQuery___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queries];
  id v5 = (id)[v2 mutableCopy];

  unint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 identifier];
  [v5 setObject:v3 forKey:v4];

  [*(id *)(a1 + 32) setQueries:v5];
}

- (void)removeQuery:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__MGServiceClient_removeQuery___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);
}

void __31__MGServiceClient_removeQuery___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queries];
  id v4 = (id)[v2 mutableCopy];

  unint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v4 removeObjectForKey:v3];

  [*(id *)(a1 + 32) setQueries:v4];
}

- (id)outstandingQueryForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  id v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__MGServiceClient_outstandingQueryForIdentifier___block_invoke;
  v8[3] = &unk_26485E4E0;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__MGServiceClient_outstandingQueryForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) queries];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)enumerateQueriesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke;
  v9[3] = &unk_26485E5A8;
  v9[4] = self;
  v9[5] = &v10;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v9);
  id v5 = (void *)v11[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke_2;
  v7[3] = &unk_26485EF78;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];

  _Block_object_dispose(&v10, 8);
}

uint64_t __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) queries];
  return MEMORY[0x270F9A758]();
}

uint64_t __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end