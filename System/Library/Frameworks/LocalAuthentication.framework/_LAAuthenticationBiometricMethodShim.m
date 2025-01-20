@interface _LAAuthenticationBiometricMethodShim
+ (_LAAuthenticationBiometricMethodShim)sharedInstance;
- (LAAuthenticationBiometricMethod)biometricMethod;
- (LAAuthenticationBiometricMethodState)biometricMethodState;
- (LAAuthenticationMethodResult)biometricMethodResult;
- (_LAAuthenticationBiometricMethodShim)init;
- (void)authenticationMethod:(id)a3 didAuthenticateWithResult:(id)a4;
- (void)authenticationMethod:(id)a3 didChangeState:(id)a4;
- (void)authenticationMethod:(id)a3 didStartWithState:(id)a4;
- (void)init;
@end

@implementation _LAAuthenticationBiometricMethodShim

+ (_LAAuthenticationBiometricMethodShim)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_shim;

  return (_LAAuthenticationBiometricMethodShim *)v2;
}

- (_LAAuthenticationBiometricMethodShim)init
{
  v12.receiver = self;
  v12.super_class = (Class)_LAAuthenticationBiometricMethodShim;
  v2 = [(_LAAuthenticationBiometricMethodShim *)&v12 init];
  if (v2)
  {
    v3 = [[LAAuthenticationBiometricMethodConfiguration alloc] initWithAutoRetry:1 avoidUsingFaceIDCamera:0 allowedUsers:0 authenticationContext:0];
    v4 = [[LAAuthenticationBiometricMethod alloc] initWithConfiguration:v3];
    biometricMethod = v2->_biometricMethod;
    v2->_biometricMethod = v4;

    v6 = [(_LAAuthenticationBiometricMethodShim *)v2 biometricMethod];
    [v6 addObserver:v2];

    v7 = [(_LAAuthenticationBiometricMethodShim *)v2 biometricMethod];
    char v8 = [v7 start];

    if ((v8 & 1) == 0)
    {
      v9 = v2->_biometricMethod;
      v2->_biometricMethod = 0;
    }
    v10 = +[_LABKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(_LAAuthenticationBiometricMethodShim *)v2 init];
    }
  }
  return v2;
}

- (void)authenticationMethod:(id)a3 didStartWithState:(id)a4
{
  id v6 = a3;
  v7 = (LAAuthenticationBiometricMethodState *)a4;
  char v8 = +[_LABKLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LAAuthenticationBiometricMethodShim authenticationMethod:didStartWithState:]();
  }

  biometricMethodState = self->_biometricMethodState;
  self->_biometricMethodState = v7;
}

- (void)authenticationMethod:(id)a3 didChangeState:(id)a4
{
  id v6 = a3;
  v7 = (LAAuthenticationBiometricMethodState *)a4;
  char v8 = +[_LABKLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LAAuthenticationBiometricMethodShim authenticationMethod:didChangeState:]();
  }

  v9 = NSStringFromSelector(sel_biometricMethodState);
  [(_LAAuthenticationBiometricMethodShim *)self willChangeValueForKey:v9];

  biometricMethodState = self->_biometricMethodState;
  self->_biometricMethodState = v7;
  v11 = v7;

  objc_super v12 = NSStringFromSelector(sel_biometricMethodState);

  [(_LAAuthenticationBiometricMethodShim *)self didChangeValueForKey:v12];
}

- (void)authenticationMethod:(id)a3 didAuthenticateWithResult:(id)a4
{
  id v6 = a3;
  v7 = (LAAuthenticationMethodResult *)a4;
  char v8 = +[_LABKLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LAAuthenticationBiometricMethodShim authenticationMethod:didAuthenticateWithResult:]();
  }

  v9 = NSStringFromSelector(sel_biometricMethodResult);
  [(_LAAuthenticationBiometricMethodShim *)self willChangeValueForKey:v9];

  biometricMethodResult = self->_biometricMethodResult;
  self->_biometricMethodResult = v7;
  v11 = v7;

  objc_super v12 = NSStringFromSelector(sel_biometricMethodResult);

  [(_LAAuthenticationBiometricMethodShim *)self didChangeValueForKey:v12];
}

- (LAAuthenticationBiometricMethod)biometricMethod
{
  return self->_biometricMethod;
}

- (LAAuthenticationBiometricMethodState)biometricMethodState
{
  return (LAAuthenticationBiometricMethodState *)objc_getProperty(self, a2, 16, 1);
}

- (LAAuthenticationMethodResult)biometricMethodResult
{
  return (LAAuthenticationMethodResult *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricMethodResult, 0);
  objc_storeStrong((id *)&self->_biometricMethodState, 0);

  objc_storeStrong((id *)&self->_biometricMethod, 0);
}

- (void)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [a1 biometricMethod];
  int v5 = 138412546;
  id v6 = a1;
  __int16 v7 = 2112;
  char v8 = v4;
  _os_log_debug_impl(&dword_1BED06000, a2, OS_LOG_TYPE_DEBUG, "%@ init, method=%@", (uint8_t *)&v5, 0x16u);
}

- (void)authenticationMethod:didStartWithState:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1BED06000, v0, v1, "%@ didStartWithState:%@");
}

- (void)authenticationMethod:didChangeState:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1BED06000, v0, v1, "%@ didChangeState:%@");
}

- (void)authenticationMethod:didAuthenticateWithResult:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1BED06000, v0, v1, "%@ didAuthenticateWithResult:%@");
}

@end