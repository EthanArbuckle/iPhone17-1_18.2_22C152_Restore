@interface ACTrackedXPCConnection
- (ACTrackedXPCConnection)init;
- (void)dealloc;
@end

@implementation ACTrackedXPCConnection

- (ACTrackedXPCConnection)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACTrackedXPCConnection;
  v2 = [(ACTrackedXPCConnection *)&v4 init];
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gOpenConnectionLock);
    __30__ACTrackedXPCConnection_init__block_invoke();
    os_unfair_lock_unlock((os_unfair_lock_t)&gOpenConnectionLock);
  }
  return v2;
}

void __30__ACTrackedXPCConnection_init__block_invoke()
{
  if (++gOpenConnectionCount > gMaxConnectionCount)
  {
    int v0 = _os_feature_enabled_impl();
    v1 = _ACLogSystem();
    v2 = v1;
    if (v0)
    {
      if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
        __30__ACTrackedXPCConnection_init__block_invoke_cold_1(v2);
      }
    }
    else if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      __30__ACTrackedXPCConnection_init__block_invoke_cold_2(v2);
    }

    gMaxConnectionCount *= 2;
  }
}

void __30__ACTrackedXPCConnection_init__block_invoke_cold_2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = gOpenConnectionCount;
  _os_log_error_impl(&dword_1A57C5000, log, OS_LOG_TYPE_ERROR, "\"Exceeded the maximum number of connections (2) to accountsd: %d connections open. Consider switching to +[ACAccountStore defaultStore]\"", (uint8_t *)v1, 8u);
}

- (void)dealloc
{
  os_unfair_lock_lock((os_unfair_lock_t)&gOpenConnectionLock);
  --gOpenConnectionCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&gOpenConnectionLock);
  v3.receiver = self;
  v3.super_class = (Class)ACTrackedXPCConnection;
  [(ACTrackedXPCConnection *)&v3 dealloc];
}

void __30__ACTrackedXPCConnection_init__block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = gOpenConnectionCount;
  _os_log_fault_impl(&dword_1A57C5000, log, OS_LOG_TYPE_FAULT, "Exceeded the maximum number of connections (2) to accountsd: %d connections open. Consider switching to +[ACAccountStore defaultStore]", (uint8_t *)v1, 8u);
}

@end