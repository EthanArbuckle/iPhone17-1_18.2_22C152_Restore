@interface _EXHostViewControllerConfiguration
- (BOOL)beginHostingImmediately;
- (BOOL)retryOnHostingFailure;
- (NSString)sceneIdentifier;
- (_EXExtensionIdentity)extensionIdentity;
- (_EXExtensionInstanceIdentifier)instanceIdentifier;
- (_EXExtensionRepresenting)extension;
- (_EXHostViewControllerConfiguration)init;
- (_EXHostViewControllerConfiguration)initWithExtension:(id)a3;
- (_EXHostViewControllerConfiguration)initWithExtension:(id)a3 role:(id)a4;
- (_EXHostViewControllerConfiguration)initWithExtensionIdentity:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sizeBridgingOptions;
- (void)setBeginHostingImmediately:(BOOL)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionIdentity:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setRetryOnHostingFailure:(BOOL)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSizeBridgingOptions:(int64_t)a3;
@end

@implementation _EXHostViewControllerConfiguration

- (_EXHostViewControllerConfiguration)init
{
  uint64_t v2 = *MEMORY[0x263F04E28];
  v9.receiver = self;
  v9.super_class = (Class)_EXHostViewControllerConfiguration;
  v3 = [(_EXHostViewControllerSessionConfiguration *)&v9 initWithSceneIdentifier:v2];
  v4 = v3;
  if (v3)
  {
    extensionIdentity = v3->_extensionIdentity;
    v3->_extensionIdentity = 0;

    instanceIdentifier = v4->_instanceIdentifier;
    v4->_instanceIdentifier = 0;

    v7 = [MEMORY[0x263F04DB8] sharedInstance];
    v4->_beginHostingImmediately = [v7 startUIHostingSessionImmediately];

    v4->_sizeBridgingOptions = -1;
    v4->_retryOnHostingFailure = 0;
  }
  return v4;
}

- (_EXHostViewControllerConfiguration)initWithExtensionIdentity:(id)a3
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F04E28];
  v12.receiver = self;
  v12.super_class = (Class)_EXHostViewControllerConfiguration;
  v7 = [(_EXHostViewControllerSessionConfiguration *)&v12 initWithSceneIdentifier:v6];
  if (v7)
  {
    if (([v5 presentsUserInterface] & 1) == 0)
    {
      v8 = _EXDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[_EXHostViewControllerConfiguration initWithExtensionIdentity:]();
      }
    }
    objc_storeStrong((id *)&v7->_extensionIdentity, a3);
    instanceIdentifier = v7->_instanceIdentifier;
    v7->_instanceIdentifier = 0;

    v10 = [MEMORY[0x263F04DB8] sharedInstance];
    v7->_beginHostingImmediately = [v10 startUIHostingSessionImmediately];

    v7->_sizeBridgingOptions = -1;
    v7->_retryOnHostingFailure = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_EXHostViewControllerConfiguration;
  id v4 = [(_EXHostViewControllerSessionConfiguration *)&v6 copyWithZone:a3];
  [v4 setExtensionIdentity:self->_extensionIdentity];
  [v4 setInstanceIdentifier:self->_instanceIdentifier];
  [v4 setBeginHostingImmediately:self->_beginHostingImmediately];
  [v4 setSizeBridgingOptions:self->_sizeBridgingOptions];
  [v4 setRetryOnHostingFailure:self->_retryOnHostingFailure];
  return v4;
}

- (void)setExtensionIdentity:(id)a3
{
  id v4 = a3;
  if (([v4 presentsUserInterface] & 1) == 0)
  {
    id v5 = _EXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_EXHostViewControllerConfiguration setExtensionIdentity:]();
    }
  }
  extensionIdentity = self->_extensionIdentity;
  self->_extensionIdentity = (_EXExtensionIdentity *)v4;
}

- (NSString)sceneIdentifier
{
  v4.receiver = self;
  v4.super_class = (Class)_EXHostViewControllerConfiguration;
  uint64_t v2 = [(_EXHostViewControllerSessionConfiguration *)&v4 sceneIdentifier];

  return (NSString *)v2;
}

- (void)setSceneIdentifier:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_EXHostViewControllerConfiguration;
  [(_EXHostViewControllerSessionConfiguration *)&v3 setSceneIdentifier:a3];
}

- (_EXHostViewControllerConfiguration)initWithExtension:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_EXHostViewControllerConfiguration *)self initWithExtensionIdentity:v4];

    return v5;
  }
  else
  {
    v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[_EXHostViewControllerConfiguration initWithExtension:]();
    }

    __break(1u);
  }
  return result;
}

- (_EXHostViewControllerConfiguration)initWithExtension:(id)a3 role:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(_EXHostViewControllerConfiguration *)self initWithExtensionIdentity:v6];
    objc_super v9 = v8;
    if (v8) {
      [(_EXHostViewControllerConfiguration *)v8 setSceneIdentifier:v7];
    }

    return v9;
  }
  else
  {
    v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[_EXHostViewControllerConfiguration initWithExtension:role:]();
    }

    __break(1u);
  }
  return result;
}

- (void)setExtension:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_EXHostViewControllerConfiguration *)self setExtensionIdentity:v5];
  }
  else
  {
    id v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[_EXHostViewControllerConfiguration setExtension:]();
    }

    __break(1u);
  }
}

- (_EXExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (_EXExtensionInstanceIdentifier)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (BOOL)beginHostingImmediately
{
  return self->_beginHostingImmediately;
}

- (void)setBeginHostingImmediately:(BOOL)a3
{
  self->_beginHostingImmediately = a3;
}

- (int64_t)sizeBridgingOptions
{
  return self->_sizeBridgingOptions;
}

- (void)setSizeBridgingOptions:(int64_t)a3
{
  self->_sizeBridgingOptions = a3;
}

- (BOOL)retryOnHostingFailure
{
  return self->_retryOnHostingFailure;
}

- (void)setRetryOnHostingFailure:(BOOL)a3
{
  self->_retryOnHostingFailure = a3;
}

- (_EXExtensionRepresenting)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);

  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

- (void)initWithExtensionIdentity:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = "extensionIdentity.presentsUserInterface";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_0();
  int v4 = 34;
  _os_log_fault_impl(&dword_2156DD000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Extension point does not support user interface", (uint8_t *)&v1, 0x1Cu);
}

- (void)setExtensionIdentity:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = "extensionIdentity.presentsUserInterface";
  __int16 v3 = 2080;
  int v1 = 136315650;
  OUTLINED_FUNCTION_0();
  int v4 = 62;
  _os_log_fault_impl(&dword_2156DD000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Extension point does not support user interface", (uint8_t *)&v1, 0x1Cu);
}

- (void)initWithExtension:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2156DD000, v0, v1, "%s - %s:%d: Invalid extension class %@", v2, v3, v4, v5, 2u);
}

- (void)initWithExtension:role:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2156DD000, v0, v1, "%s - %s:%d: Invalid extension class %@", v2, v3, v4, v5, 2u);
}

- (void)setExtension:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2156DD000, v0, v1, "%s - %s:%d: Invalid extension class %@", v2, v3, v4, v5, 2u);
}

@end