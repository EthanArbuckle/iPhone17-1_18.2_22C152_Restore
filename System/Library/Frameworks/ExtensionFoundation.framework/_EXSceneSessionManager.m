@interface _EXSceneSessionManager
+ (id)sharedInstance;
- (NSMutableDictionary)_sessions;
- (id)_init;
- (id)sessionForIdentifier:(id)a3;
- (id)sessions;
- (void)addSession:(id)a3;
- (void)removeSessionForIdentifier:(id)a3;
@end

@implementation _EXSceneSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)_EXSceneSessionManager;
  v2 = [(_EXSceneSessionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sessions = v2->__sessions;
    v2->__sessions = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  sessions = self->__sessions;
  objc_super v6 = [v4 identifier];
  [(NSMutableDictionary *)sessions setObject:v4 forKey:v6];

  v7 = _EXDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_EXSceneSessionManager addSession:]();
  }
}

- (id)sessionForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(NSMutableDictionary *)self->__sessions objectForKey:v4];

  return v5;
}

- (void)removeSessionForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSMutableDictionary *)self->__sessions removeObjectForKey:v4];
  v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_EXSceneSessionManager removeSessionForIdentifier:]();
  }
}

- (id)sessions
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  sessions = self->__sessions;

  return (id)[(NSMutableDictionary *)sessions allValues];
}

- (NSMutableDictionary)_sessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)addSession:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "%{public}@ Added session: %{public}@");
}

- (void)removeSessionForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "%{public}@ removed session with identifier: %{public}@");
}

@end