@interface CSUnhousedSearchConnection
+ (id)connectionWithToken:(id)a3;
- (CSUnhousedSearchConnection)initWithToken:(id)a3;
- (NSString)token;
- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5;
- (id)createXPCDictionaryForQuery:(id)a3 queryID:(int64_t)a4 queryContext:(id)a5 needsInitialization:(BOOL)a6;
- (id)defaultIndexPath:(id)a3;
- (id)serviceName;
- (id)uuidForToken:(id)a3;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
- (void)setToken:(id)a3;
@end

@implementation CSUnhousedSearchConnection

+ (id)connectionWithToken:(id)a3
{
  id v5 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __50__CSUnhousedSearchConnection_connectionWithToken___block_invoke;
  v15 = &unk_1E5549528;
  id v6 = v5;
  id v16 = v6;
  id v17 = a1;
  if (connectionWithToken__onceToken != -1) {
    dispatch_once(&connectionWithToken__onceToken, &v12);
  }
  id v7 = (id)connectionWithToken__currentToken;
  objc_sync_enter(v7);
  if ((objc_msgSend(v6, "isEqualToString:", connectionWithToken__currentToken, v12, v13, v14, v15) & 1) == 0)
  {
    objc_storeStrong((id *)&connectionWithToken__currentToken, a3);
    uint64_t v8 = [objc_alloc((Class)objc_opt_class()) initWithToken:v6];
    v9 = (void *)connectionWithToken__connection;
    connectionWithToken__connection = v8;
  }
  objc_sync_exit(v7);

  id v10 = (id)connectionWithToken__connection;
  return v10;
}

uint64_t __50__CSUnhousedSearchConnection_connectionWithToken___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&connectionWithToken__currentToken, *(id *)(a1 + 32));
  connectionWithToken__connection = [objc_alloc((Class)objc_opt_class()) initWithToken:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

- (id)uuidForToken:(id)a3
{
  return 0;
}

- (id)defaultIndexPath:(id)a3
{
  return 0;
}

- (id)serviceName
{
  return 0;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  id v5 = a3;

  return v5;
}

- (CSUnhousedSearchConnection)initWithToken:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CSUnhousedSearchConnection *)self uuidForToken:v4];
  id v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "CSUnhousedSearchConnection uuid: %@", buf, 0xCu);
  }

  id v7 = [(CSUnhousedSearchConnection *)self serviceName];
  v11.receiver = self;
  v11.super_class = (Class)CSUnhousedSearchConnection;
  uint64_t v8 = [(CSXPCConnection *)&v11 initWithServiceName:v7 machService:1 uuid:v5];

  if (v8)
  {
    v9 = objc_opt_new();
    [(CSSearchConnection *)v8 setQueries:v9];

    [(CSUnhousedSearchConnection *)v8 setToken:v4];
  }

  return v8;
}

- (id)createXPCDictionaryForQuery:(id)a3 queryID:(int64_t)a4 queryContext:(id)a5 needsInitialization:(BOOL)a6
{
  BOOL v6 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CSUnhousedSearchConnection;
  uint64_t v8 = -[CSSearchConnection createXPCDictionaryForQuery:queryID:queryContext:needsInitialization:](&v25, sel_createXPCDictionaryForQuery_queryID_queryContext_needsInitialization_, a3, a4, a5);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __99__CSUnhousedSearchConnection_createXPCDictionaryForQuery_queryID_queryContext_needsInitialization___block_invoke;
  v22 = &unk_1E5548FE0;
  v23 = self;
  id v9 = v8;
  id v24 = v9;
  if (createXPCDictionaryForQuery_queryID_queryContext_needsInitialization__onceToken == -1)
  {
    if (!v6) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&createXPCDictionaryForQuery_queryID_queryContext_needsInitialization__onceToken, &v19);
    if (!v6) {
      goto LABEL_6;
    }
  }
  id v10 = [(CSUnhousedSearchConnection *)self token];
  id v11 = [(CSUnhousedSearchConnection *)self defaultIndexPath:v10];
  uint64_t v12 = [v11 UTF8String];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = [(CSXPCConnection *)self connection];
    uint64_t v15 = [(CSUnhousedSearchConnection *)self addExtensionToken:v9 indexPath:v13 connection:v14];

    id v9 = (id)v15;
  }

LABEL_6:
  id v16 = v24;
  id v17 = v9;

  return v17;
}

void __99__CSUnhousedSearchConnection_createXPCDictionaryForQuery_queryID_queryContext_needsInitialization___block_invoke(uint64_t a1)
{
  if (hasInternalCSEntitlement())
  {
    v2 = [*(id *)(a1 + 32) token];

    if (v2)
    {
      v3 = *(void **)(a1 + 40);
      id v4 = [*(id *)(a1 + 32) token];
      xpc_dictionary_set_string(v3, "private-bundle-override", (const char *)[v4 UTF8String]);
    }
  }
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (xpc_dictionary_get_int64(v6, "ee"))
  {
    v7[2](v7, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSUnhousedSearchConnection;
    [(CSSearchConnection *)&v8 sendMessageAsync:v6 completion:v7];
  }
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end