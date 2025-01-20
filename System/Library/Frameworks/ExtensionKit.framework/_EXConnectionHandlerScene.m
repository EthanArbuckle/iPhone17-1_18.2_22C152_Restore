@interface _EXConnectionHandlerScene
- (BOOL)shouldAcceptConnection:(id)a3;
- (UIViewController)viewController;
- (void)connectToSession:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _EXConnectionHandlerScene

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52___EXConnectionHandlerScene_shouldAcceptConnection___block_invoke;
  block[3] = &unk_2642587C8;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v5 = v4;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  char v6 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)connectToSession:(id)a3
{
  id v13 = a3;
  id v4 = [v13 configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v13 extension];
    char v6 = [v5 internalRep];
    v7 = [v13 role];
    v8 = (objc_class *)[v6 extensionViewControllerClassForSceneRole:v7];

    id v9 = (UIViewController *)objc_alloc_init(v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIViewController *)v9 setSceneConfiguration:v4];
      viewController = self->_viewController;
      self->_viewController = v9;

      return;
    }
  }
  else
  {
    uint64_t v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_EXConnectionHandlerScene connectToSession:]();
    }

    __break(1u);
  }
  v12 = _EXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[_EXConnectionHandlerScene connectToSession:]();
  }

  __break(1u);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)connectToSession:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = 136315906;
  v2 = "[viewController isKindOfClass:_EXExtensionViewController.class]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/Extension/EXConnectionHandlerExtension+UI.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_2();
}

- (void)connectToSession:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = 136315906;
  v2 = "[configuration isKindOfClass:_EXViewControllerSceneConfiguration.class]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/Extension/EXConnectionHandlerExtension+UI.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_2();
}

@end