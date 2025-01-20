@interface AKAppleIDProximityAuthenticationContext
- (AKAppleIDProximityAuthenticationContext)init;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
@end

@implementation AKAppleIDProximityAuthenticationContext

- (AKAppleIDProximityAuthenticationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKAppleIDProximityAuthenticationContext;
  v2 = [(AKAppleIDProximityAuthenticationContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AKAppleIDProximityAuthenticationContext *)v2 set_shouldBroadcastForProximityAuthOnly:1];
  }
  return v3;
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDProximityAuthenticationContext presentBasicLoginUIWithCompletion:](v4);
  }

  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
  (*((void (**)(id, void, void, void, void *))v3 + 2))(v3, 0, 0, 0, v5);
}

- (void)presentBasicLoginUIWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Client is responsible for presenting their own Login UI.", v1, 2u);
}

@end