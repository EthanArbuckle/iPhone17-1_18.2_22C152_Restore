@interface _EXNSExtensionShimScene
- (BOOL)shouldAcceptConnection:(id)a3;
- (NSExtensionContext)context;
- (_EXNSExtensionShimScene)init;
- (id)makePrincipalObjectForExtension:(id)a3;
- (void)connectToSession:(id)a3;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation _EXNSExtensionShimScene

- (_EXNSExtensionShimScene)init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXNSExtensionShimScene;
  return [(_EXNSExtensionShimScene *)&v3 init];
}

- (void)dealloc
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
}

- (id)makePrincipalObjectForExtension:(id)a3
{
  uint64_t v3 = [a3 configuration];
  uint64_t v4 = (objc_class *)[v3 principalClass];

  id v5 = objc_alloc_init(v4);

  return v5;
}

- (void)connectToSession:(id)a3
{
  id v13 = a3;
  uint64_t v4 = +[_EXRunningExtension sharedInstance];
  id v5 = [v4 extension];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionShimScene connectToSession:].cold.4();
    }

    __break(1u);
    goto LABEL_13;
  }
  uint64_t v6 = [(_EXNSExtensionShimScene *)self makePrincipalObjectForExtension:v5];
  uint64_t v7 = +[_EXNSExtensionContextShimImplementation makeContextWithSceneSession:v13];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionShimScene connectToSession:]();
    }
    goto LABEL_19;
  }
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionShimScene connectToSession:]();
    }
    goto LABEL_19;
  }
  v9 = [MEMORY[0x1E4F292B0] _sharedExtensionContextVendor];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionShimScene connectToSession:]();
    }
LABEL_19:

    __break(1u);
    return;
  }
  [v9 _addExtensionContext:v7];
  [(_EXNSExtensionShimScene *)self setContext:v7];
  v10 = [v7 internalImplementation];
  objc_msgSend(v10, "set__principalObject:", v6);
  if ([v6 conformsToProtocol:&unk_1EE2EFA90]) {
    [v6 beginRequestWithExtensionContext:v7];
  }
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(_EXNSExtensionShimScene *)self context];
  int v6 = [v5 conformsToProtocol:&unk_1EE2E56C0];

  if (v6)
  {
    uint64_t v7 = [(_EXNSExtensionShimScene *)self context];
    char v8 = [v7 shouldAcceptXPCConnection:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSExtensionContext)context
{
  return (NSExtensionContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)connectToSession:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
}

- (void)connectToSession:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
}

- (void)connectToSession:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
}

- (void)connectToSession:.cold.4()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_1(&dword_191F29000, v2, v3, "%s - %s:%d: Unexpected extension class '%@'", v4, v5, v6, v7, 2u);
}

@end