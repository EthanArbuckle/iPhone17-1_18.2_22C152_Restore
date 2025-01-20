@interface _PasscodeEmbeddedRemoteViewControllerHost
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (void)endEditing;
- (void)passcodeVerificationFinished:(id)a3;
- (void)setContext:(id)a3;
- (void)startEditing;
@end

@implementation _PasscodeEmbeddedRemoteViewControllerHost

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1) {
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)exportedInterface_interface;
  return v2;
}

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1) {
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_100);
  }
  v2 = (void *)serviceViewControllerInterface_interface;
  return v2;
}

- (void)passcodeVerificationFinished:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[_PasscodeEmbeddedRemoteViewControllerHost passcodeVerificationFinished:]";
    _os_log_impl(&dword_214463000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[_PasscodeEmbeddedRemoteViewControllerHost passcodeVerificationFinished:]();
  }
}

- (void)setContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_103];
  [v5 setContext:v4];
}

- (void)startEditing
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_105];
  [v2 startEditing];
}

- (void)endEditing
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:&__block_literal_global_107];
  [v2 endEditing];
}

- (void)passcodeVerificationFinished:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214463000, &_os_log_internal, v0, "Passcode verification failed (%@).", v1, v2, v3, v4, v5);
}

@end