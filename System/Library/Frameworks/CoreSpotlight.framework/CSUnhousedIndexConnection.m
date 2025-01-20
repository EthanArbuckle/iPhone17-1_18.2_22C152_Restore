@interface CSUnhousedIndexConnection
+ (id)connectionUUID:(id)a3;
+ (id)serviceName;
+ (id)unhousedIndexConnectionForToken:(id)a3;
+ (void)removeUnhousedIndexConnectionForToken:(id)a3;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
@end

@implementation CSUnhousedIndexConnection

+ (void)removeUnhousedIndexConnectionForToken:(id)a3
{
  id v4 = a3;
  id v3 = (id)sUnhousedConnections;
  objc_sync_enter(v3);
  [(id)sUnhousedConnections removeObjectForKey:v4];
  objc_sync_exit(v3);
}

+ (id)unhousedIndexConnectionForToken:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[CSUnhousedIndexConnection unhousedIndexConnectionForToken:]();
  }

  if (unhousedIndexConnectionForToken__onceToken != -1) {
    dispatch_once(&unhousedIndexConnectionForToken__onceToken, &__block_literal_global_675);
  }
  id v6 = (id)sUnhousedConnections;
  objc_sync_enter(v6);
  v7 = [(id)sUnhousedConnections objectForKey:v4];
  if (!v7)
  {
    v8 = [a1 connectionUUID:v4];
    v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_18D0E3000, v9, OS_LOG_TYPE_DEFAULT, "CSUnhousedIndexConnection uuid: %@", (uint8_t *)&v13, 0xCu);
    }

    id v10 = objc_alloc((Class)objc_opt_class());
    v11 = [a1 serviceName];
    v7 = (void *)[v10 initWithServiceName:v11 machService:1 uuid:v8];

    [(id)sUnhousedConnections setObject:v7 forKey:v4];
  }
  objc_sync_exit(v6);

  return v7;
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (xpc_dictionary_get_int64(v6, "ee"))
  {
    v7[2](v7, 0);
  }
  else if (xpc_dictionary_get_int64(v6, "re"))
  {
    ((void (**)(id, id))v7)[2](v7, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSUnhousedIndexConnection;
    [(CSIndexConnection *)&v8 sendMessageAsync:v6 completion:v7];
  }
}

uint64_t __61__CSUnhousedIndexConnection_unhousedIndexConnectionForToken___block_invoke()
{
  sUnhousedConnections = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];

  return MEMORY[0x1F41817F8]();
}

+ (id)connectionUUID:(id)a3
{
  return 0;
}

+ (id)serviceName
{
  return 0;
}

+ (void)unhousedIndexConnectionForToken:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "~~~ Finding unhousedIndexConnectionForToken: %@", v2, v3, v4, v5, v6);
}

@end