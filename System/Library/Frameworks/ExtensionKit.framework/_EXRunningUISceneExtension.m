@interface _EXRunningUISceneExtension
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (NSXPCListener)internalListener;
- (_EXRunningUISceneExtension)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int)startWithArguments:(const char *)a3 count:(int)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)setInternalListener:(id)a3;
@end

@implementation _EXRunningUISceneExtension

- (_EXRunningUISceneExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXRunningUISceneExtension;
  return [(_EXRunningUISceneExtension *)&v3 init];
}

- (int)startWithArguments:(const char *)a3 count:(int)a4
{
  v35.receiver = self;
  v35.super_class = (Class)_EXRunningUISceneExtension;
  int result = [(_EXRunningExtension *)&v35 _startWithArguments:a3 count:*(void *)&a4];
  if (!result)
  {
    val = self;
    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUISceneExtension startWithArguments:count:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    objc_initWeak(&location, val);
    v14 = (void *)MEMORY[0x263F2B9D8];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __55___EXRunningUISceneExtension_startWithArguments_count___block_invoke;
    v32[3] = &unk_264258760;
    objc_copyWeak(&v33, &location);
    [v14 listenerWithConfigurator:v32];
    [(id)objc_claimAutoreleasedReturnValue() activate];
    v15 = _EXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUISceneExtension startWithArguments:count:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    [(_EXRunningUIExtension *)val checkIn];
    v23 = _EXDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningUISceneExtension startWithArguments:count:](v23, v24, v25, v26, v27, v28, v29, v30);
    }

    int result = [MEMORY[0x263F2B9F8] activateXPCService];
    __break(1u);
  }
  return result;
}

- (NSXPCListener)internalListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInternalListener:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  objc_super v3 = _EXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningUISceneExtension(UIApplicationDelegate) applicationWillResignActive:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  objc_super v3 = _EXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningUISceneExtension(UIApplicationDelegate) applicationDidBecomeActive:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = _EXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningUISceneExtension(UIApplicationDelegate) application:configurationForConnectingSceneSession:options:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v17 = _EXDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningUISceneExtension(UIApplicationDelegate) application:configurationForConnectingSceneSession:options:](v7, v17);
  }

  uint64_t v18 = [_EXFBSSceneSession alloc];
  uint64_t v19 = [(_EXRunningExtension *)self extension];
  uint64_t v20 = [(_EXSceneSession *)v18 initWithExtension:v19];

  uint64_t v21 = [v7 _fbsScene];
  [(_EXFBSSceneSession *)v20 connectWithFBSScene:v21];

  if (application_configurationForConnectingSceneSession_options__onceToken[0] != -1) {
    dispatch_once(application_configurationForConnectingSceneSession_options__onceToken, &__block_literal_global_3);
  }
  uint64_t v22 = [v8 configuration];

  [v22 setDelegateClass:0];

  return v22;
}

- (void)startWithArguments:(uint64_t)a3 count:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startWithArguments:(uint64_t)a3 count:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startWithArguments:(uint64_t)a3 count:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end