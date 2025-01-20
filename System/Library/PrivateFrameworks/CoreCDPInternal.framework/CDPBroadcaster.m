@interface CDPBroadcaster
+ (void)_broadcastNotificationName:(id)a3 userInfo:(id)a4;
+ (void)broadcastWalrusStateChangeNotification;
+ (void)broadcastWebAccessStateChangeNotification;
- (CDPBroadcaster)init;
- (NSDistributedNotificationCenter)broadcaster;
- (void)init;
- (void)sendNotification:(id)a3 userInfo:(id)a4;
@end

@implementation CDPBroadcaster

+ (void)broadcastWalrusStateChangeNotification
{
}

+ (void)broadcastWebAccessStateChangeNotification
{
}

- (CDPBroadcaster)init
{
  v10.receiver = self;
  v10.super_class = (Class)CDPBroadcaster;
  v3 = [(CDPBroadcaster *)&v10 init];
  p_isa = (id *)&v3->super.isa;
  if (!v3)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPBroadcaster init](a2);
    }
    goto LABEL_8;
  }

  v5 = [MEMORY[0x263F087C8] defaultCenter];
  if (!v5)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CDPBroadcaster *)(uint64_t)p_isa init];
    }
LABEL_8:

    v7 = 0;
    goto LABEL_9;
  }
  v6 = v5;
  objc_storeStrong(p_isa + 1, v5);

  v7 = p_isa;
LABEL_9:

  return v7;
}

- (void)sendNotification:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CDPBroadcaster *)self broadcaster];
  [v8 postNotificationName:v7 object:0 userInfo:v6 deliverImmediately:1];
}

+ (void)_broadcastNotificationName:(id)a3 userInfo:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (__CFString *)a3;
  id v6 = a4;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Broadcasting notification: %{public}@, with userInfo: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, v6, 0, 1u);
}

- (NSDistributedNotificationCenter)broadcaster
{
  return self->_broadcaster;
}

- (void).cxx_destruct
{
}

- (void)init
{
  id v3 = (id)objc_opt_class();
  v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_218640000, v5, v6, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v7, v8, v9, v10, v11);
}

@end