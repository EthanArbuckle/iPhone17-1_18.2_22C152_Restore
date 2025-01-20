@interface _EXNSExtensionUIShimScene
- (BOOL)shouldAcceptConnection:(id)a3;
- (UIViewController)viewController;
- (id)makePrincipalObjectForExtension:(id)a3;
- (void)connectToSession:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _EXNSExtensionUIShimScene

- (id)makePrincipalObjectForExtension:(id)a3
{
  id v3 = a3;
  v4 = [v3 configuration];
  v5 = (objc_class *)[v4 principalClass];

  if (([(objc_class *)v5 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionUIShimScene makePrincipalObjectForExtension:](v5);
    }
    goto LABEL_10;
  }
  id v6 = objc_alloc_init(v5);
  if (!v6)
  {
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionUIShimScene makePrincipalObjectForExtension:]();
    }
LABEL_10:

    __break(1u);
    return result;
  }
  v7 = v6;

  return v7;
}

- (void)connectToSession:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[_EXRunningUIExtension sharedInstance];
    id v6 = [v5 extension];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11.receiver = self;
      v11.super_class = (Class)_EXNSExtensionUIShimScene;
      [(_EXNSExtensionShimScene *)&v11 connectToSession:v4];
      v7 = [(_EXNSExtensionShimScene *)self context];
      v8 = [v7 _principalObject];
      [(_EXNSExtensionUIShimScene *)self setViewController:v8];

      return;
    }
  }
  else
  {
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXNSExtensionUIShimScene connectToSession:]();
    }

    __break(1u);
  }
  v10 = _EXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[_EXNSExtensionUIShimScene connectToSession:]();
  }

  __break(1u);
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4 = a3;
  v5 = [(_EXNSExtensionShimScene *)self context];
  int v6 = [v5 conformsToProtocol:&unk_26C666C90];

  if (v6)
  {
    v7 = [(_EXNSExtensionShimScene *)self context];
    char v8 = [v7 shouldAcceptXPCConnection:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)makePrincipalObjectForExtension:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = "principalObject!=nil";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_0();
  int v4 = 59;
  _os_log_fault_impl(&dword_2156DD000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: The principal object must not be NULL.", (uint8_t *)&v1, 0x1Cu);
}

- (void)makePrincipalObjectForExtension:(objc_class *)a1 .cold.2(objc_class *a1)
{
  int v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2156DD000, v2, v3, "%s - %s:%d: Pricipal object is unexpected class '%@'", v4, v5, v6, v7, 2u);
}

- (void)connectToSession:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  int v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2156DD000, v2, v3, "%s - %s:%d: Unexpected extension class '%@'", v4, v5, v6, v7, 2u);
}

- (void)connectToSession:.cold.2()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  int v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2156DD000, v2, v3, "%s - %s:%d: Unexpected extension class '%@'", v4, v5, v6, v7, 2u);
}

@end