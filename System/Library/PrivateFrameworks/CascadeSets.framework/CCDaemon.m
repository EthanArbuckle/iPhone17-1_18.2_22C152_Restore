@interface CCDaemon
+ (void)registerXPCActivities;
+ (void)resetRootDirectoryIfNecessary;
- (CCDaemon)initWithQueue:(id)a3;
@end

@implementation CCDaemon

- (CCDaemon)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCDaemon;
  v6 = [(CCDaemon *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = [[CCSetChangeRelayServer alloc] initWithQueue:v5];
    relayServer = v7->_relayServer;
    v7->_relayServer = v8;
  }
  [(CCSetChangeRelayServer *)v7->_relayServer activate];
  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEFAULT, "Initialized CCDaemon", v12, 2u);
  }

  return v7;
}

+ (void)registerXPCActivities
{
}

void __33__CCDaemon_registerXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_249B92000, v3, OS_LOG_TYPE_DEFAULT, "running activity \"com.apple.cascade.database-maintenance\"", v5, 2u);
    }

    v4 = (void *)[objc_alloc(MEMORY[0x263F29EA8]) initWithActivity:v2 activityName:@"com.apple.cascade.database-maintenance"];
    +[CCAdminXPCClient triggerMaintenanceActivity:v4 completion:&__block_literal_global_8];
  }
}

void __33__CCDaemon_registerXPCActivities__block_invoke_5()
{
  v0 = __biome_log_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_249B92000, v0, OS_LOG_TYPE_DEFAULT, "finished running activity \"com.apple.cascade.database-maintenance\"", v1, 2u);
  }
}

+ (void)resetRootDirectoryIfNecessary
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Cannot invoke resetRootDirectoryIfNecessary from non-primary daemon: %@", (uint8_t *)&v2, 0xCu);
}

void __41__CCDaemon_resetRootDirectoryIfNecessary__block_invoke()
{
  v0 = __biome_log_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_249B92000, v0, OS_LOG_TYPE_DEFAULT, "Finished removing the root directory", v1, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayServer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end