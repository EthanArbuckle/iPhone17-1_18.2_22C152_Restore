@interface _EXUISceneSession
- (UIViewController)viewController;
- (_EXExtensionRootViewController)rootViewController;
- (_EXPromise)initializationPromise;
- (_EXUISceneSession)initWithExtension:(id)a3;
- (id)makeConfigurationWithParameters:(id)a3;
- (id)makeConnectionResponse;
- (id)makeSceneWithError:(id *)a3;
- (void)connectToScene:(id)a3;
- (void)setInitializationPromise:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _EXUISceneSession

- (_EXUISceneSession)initWithExtension:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EXUISceneSession;
  v5 = [(_EXSceneSession *)&v15 initWithExtension:v4];
  if (!v5)
  {
LABEL_10:

    return v5;
  }
  v6 = [v4 internalRep];
  char v7 = [v6 presentsUserInterface];

  if (v7)
  {
    v8 = _EXSignpostLog();
    if ([(_EXSceneSession *)v5 signpost] && os_signpost_enabled(v8))
    {
      v9 = v8;
      uint64_t v10 = [(_EXSceneSession *)v5 signpost];
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)v14 = 0;
        }
      }
    }
    goto LABEL_10;
  }
  v13 = _EXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[_EXUISceneSession initWithExtension:]();
  }

  __break(1u);
  return result;
}

- (void)setRootViewController:(id)a3
{
  v5 = (_EXExtensionRootViewController *)a3;
  if (self->_rootViewController == v5)
  {
LABEL_6:
    goto _objc_release_x1;
  }
  v9 = v5;
  objc_storeStrong((id *)&self->_rootViewController, a3);
  v6 = [(_EXSceneSession *)self scene];
  if (objc_opt_respondsToSelector())
  {
    char v7 = [v6 viewController];
    if (!v7)
    {
      char v7 = [(_EXUISceneSession *)self viewController];
    }
    [(_EXExtensionRootViewController *)v9 setContentViewController:v7];

    goto LABEL_6;
  }
  v8 = _EXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[_EXUISceneSession setRootViewController:]();
  }

  __break(1u);
_objc_release_x1:
  MEMORY[0x270F9A758]();
}

- (id)makeConfigurationWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [(_EXSceneSession *)self extension];
  v6 = [v5 internalRep];
  char v7 = [v6 configurationWithParameters:v4];

  return v7;
}

- (id)makeSceneWithError:(id *)a3
{
  v5 = [(_EXSceneSession *)self extension];
  int v6 = [v5 hasSwiftEntryPoint];

  if (!v6)
  {
    v8 = [(_EXSceneSession *)self configuration];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (class_conformsToProtocol((Class)[v8 sceneClass], (Protocol *)&unk_26C665DD8))
      {
        v14.receiver = self;
        v14.super_class = (Class)_EXUISceneSession;
        uint64_t v10 = [(_EXSceneSession *)&v14 makeSceneWithError:a3];
        if ([v10 conformsToProtocol:&unk_26C665DD8]) {
          goto LABEL_7;
        }
        goto LABEL_17;
      }
      v13 = _EXDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[_EXUISceneSession makeSceneWithError:](v8);
      }
    }
    else
    {
      v13 = _EXDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[_EXUISceneSession makeSceneWithError:].cold.4((uint64_t)v8, v13);
      }
    }

    __break(1u);
LABEL_17:
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_EXUISceneSession makeSceneWithError:]();
    }
    goto LABEL_19;
  }
  char v7 = +[_EXRunningUIExtension sharedInstance];
  v8 = [v7 sceneFactory];

  if (!v8)
  {
    v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_EXUISceneSession makeSceneWithError:]();
    }
LABEL_19:

    __break(1u);
    return result;
  }
  v9 = [(_EXSceneSession *)self configuration];
  uint64_t v10 = [v8 makeSceneWithConfiguration:v9];

LABEL_7:

  return v10;
}

- (void)connectToScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXUISceneSession;
  [(_EXSceneSession *)&v10 connectToScene:v4];
  if (![v4 conformsToProtocol:&unk_26C665DD8]) {
    goto LABEL_5;
  }
  v5 = [v4 viewController];

  if (v5) {
    goto LABEL_5;
  }
  int v6 = [(_EXSceneSession *)self configuration];
  char v7 = (objc_class *)[v6 viewControllerClass];
  if (v7)
  {
    id v8 = objc_alloc_init(v7);
    [v4 setViewController:v8];

LABEL_5:
    return;
  }
  v9 = _EXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[_EXUISceneSession connectToScene:](v9);
  }

  __break(1u);
}

- (id)makeConnectionResponse
{
  v4.receiver = self;
  v4.super_class = (Class)_EXUISceneSession;
  v2 = [(_EXSceneSession *)&v4 makeConnectionResponse];

  return v2;
}

- (_EXExtensionRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (_EXPromise)initializationPromise
{
  return (_EXPromise *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInitializationPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationPromise, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

- (void)initWithExtension:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = "extension.internalRep.presentsUserInterface";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_0();
  int v4 = 53;
  _os_log_fault_impl(&dword_2156DD000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Extension point does not support user interface", (uint8_t *)&v1, 0x1Cu);
}

- (void)setRootViewController:.cold.1()
{
  os_log_t v0 = NSStringFromProtocol((Protocol *)&unk_26C665DD8);
  char v7 = NSStringFromProtocol((Protocol *)&unk_26C67A678);
}

- (void)makeSceneWithError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = "sceneFactory";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_0();
  int v4 = 106;
  _os_log_fault_impl(&dword_2156DD000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected nil scene factory", (uint8_t *)&v1, 0x1Cu);
}

- (void)makeSceneWithError:.cold.2()
{
  os_log_t v0 = NSStringFromProtocol((Protocol *)&unk_26C665DD8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
}

- (void)makeSceneWithError:(void *)a1 .cold.3(void *a1)
{
  [a1 sceneClass];
  uint64_t v1 = NSStringFromProtocol((Protocol *)&unk_26C665DD8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
}

- (void)makeSceneWithError:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v8[0] = 136316162;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  v8[6] = 113;
  __int16 v9 = 2112;
  objc_super v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  _os_log_fault_impl(&dword_2156DD000, a2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected configuration class '%@' expected '%@'", (uint8_t *)v8, 0x30u);
}

- (void)connectToScene:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromClass(0);
  v4[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  v4[6] = 131;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_fault_impl(&dword_2156DD000, a1, OS_LOG_TYPE_FAULT, "%s - %s:%d: Failed to find view controller class '%@'", (uint8_t *)v4, 0x26u);
}

@end