@interface FSResourceManager
- (FSResourceManager)init;
- (NSMutableDictionary)resourceTasks;
- (NSMutableDictionary)resources;
- (id)getResource:(id)a3;
- (id)getResources;
- (id)getTaskUUIDs:(id)a3;
- (int)getResourceState:(id)a3;
- (void)addResource:(id)a3;
- (void)addTaskUUID:(id)a3 resource:(id)a4;
- (void)removeResource:(id)a3;
- (void)removeTaskUUID:(id)a3;
- (void)setResourceTasks:(id)a3;
- (void)setResources:(id)a3;
- (void)updateResource:(id)a3;
@end

@implementation FSResourceManager

- (FSResourceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)FSResourceManager;
  v2 = [(FSResourceManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    resourceTasks = v2->_resourceTasks;
    v2->_resourceTasks = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    resources = v2->_resources;
    v2->_resources = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)removeResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSResourceManager removeResource:](v4);
  }

  v6 = [v4 getResourceID];
  if (v6)
  {
    [(NSMutableDictionary *)self->_resourceTasks removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_resources removeObjectForKey:v6];
  }
}

- (void)removeTaskUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_resourceTasks;
  objc_sync_enter(v5);
  resourceTasks = self->_resourceTasks;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__FSResourceManager_removeTaskUUID___block_invoke;
  v8[3] = &unk_26530B828;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)resourceTasks enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

void __36__FSResourceManager_removeTaskUUID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  id v9 = (uint64_t *)(a1 + 32);
  if ([v8 containsObject:v10])
  {
    v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __36__FSResourceManager_removeTaskUUID___block_invoke_cold_1((uint64_t)v7, v9, v11);
    }

    [v8 removeObject:*v9];
    *a4 = 1;
  }
}

- (id)getResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_resources objectForKey:v4];
  v6 = fskit_std_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[FSResourceManager getResource:]();
    }
  }
  else if (v7)
  {
    -[FSResourceManager getResource:]();
  }

  return v5;
}

- (int)getResourceState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_resources objectForKey:v4];
  v6 = fskit_std_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[FSResourceManager getResourceState:]();
    }

    int v8 = [v5 state];
  }
  else
  {
    if (v7) {
      -[FSResourceManager getResourceState:]();
    }

    int v8 = 0;
  }

  return v8;
}

- (id)getResources
{
  v2 = (void *)[(NSMutableDictionary *)self->_resources copy];
  return v2;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSResourceManager addResource:](v4);
  }

  resources = self->_resources;
  BOOL v7 = [v4 getResourceID];
  int v8 = [(NSMutableDictionary *)resources objectForKey:v7];

  if (v8)
  {
    id v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FSResourceManager addResource:](v4);
    }
  }
  else
  {
    uint64_t v10 = self->_resources;
    id v9 = [v4 getResourceID];
    [(NSMutableDictionary *)v10 setObject:v4 forKey:v9];
  }
}

- (void)updateResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 getResourceID];
  v6 = fskit_std_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[FSResourceManager updateResource:](v4);
    }

    resources = self->_resources;
    id v9 = [v4 getResourceID];
    [(NSMutableDictionary *)resources setObject:v4 forKey:v9];

    v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FSResourceManager updateResource:](v4);
    }
  }
  else if (v7)
  {
    -[FSResourceManager updateResource:](v6);
  }
}

- (void)addTaskUUID:(id)a3 resource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSResourceManager addTaskUUID:resource:](v7, (uint64_t)v6, v8);
  }

  resourceTasks = self->_resourceTasks;
  uint64_t v10 = [v7 getResourceID];
  v11 = [(NSMutableDictionary *)resourceTasks objectForKey:v10];

  if (!v11)
  {
    v12 = self->_resourceTasks;
    v13 = objc_opt_new();
    v14 = [v7 getResourceID];
    [(NSMutableDictionary *)v12 setObject:v13 forKey:v14];

    v15 = self->_resourceTasks;
    v16 = [v7 getResourceID];
    v11 = [(NSMutableDictionary *)v15 objectForKey:v16];
  }
  [v11 addObject:v6];
}

- (id)getTaskUUIDs:(id)a3
{
  resourceTasks = self->_resourceTasks;
  id v4 = [a3 getResourceID];
  uint64_t v5 = [(NSMutableDictionary *)resourceTasks objectForKey:v4];

  return v5;
}

- (NSMutableDictionary)resourceTasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResourceTasks:(id)a3
{
}

- (NSMutableDictionary)resources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourceTasks, 0);
}

- (void)removeResource:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:start:%@", v4, v5, v6, v7, 2u);
}

void __36__FSResourceManager_removeTaskUUID___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[FSResourceManager removeTaskUUID:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_24DDB2000, log, OS_LOG_TYPE_DEBUG, "%s:found:%@:%@", (uint8_t *)&v4, 0x20u);
}

- (void)getResource:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:not_found:%@", (uint8_t *)v2);
}

- (void)getResource:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:found:%@", (uint8_t *)v2);
}

- (void)getResourceState:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:not_found:%@", (uint8_t *)v2);
}

- (void)getResourceState:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:found:%@", (uint8_t *)v2);
}

- (void)addResource:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s: Resource %@, already exists", v4, v5, v6, v7, 2u);
}

- (void)addResource:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:start:%@", v4, v5, v6, v7, 2u);
}

- (void)updateResource:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[FSResourceManager updateResource:]";
  _os_log_debug_impl(&dword_24DDB2000, log, OS_LOG_TYPE_DEBUG, "%s:error: resourceID is nil", (uint8_t *)&v1, 0xCu);
}

- (void)updateResource:(void *)a1 .cold.2(void *a1)
{
  int v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:end:%@", v4, v5, v6, v7, 2u);
}

- (void)updateResource:(void *)a1 .cold.3(void *a1)
{
  int v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:start:%@", v4, v5, v6, v7, 2u);
}

- (void)addTaskUUID:(NSObject *)a3 resource:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 getResourceID];
  v7[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_24DDB2000, a3, OS_LOG_TYPE_DEBUG, "%s:%@: Adding task (%@)", (uint8_t *)v7, 0x20u);
}

@end