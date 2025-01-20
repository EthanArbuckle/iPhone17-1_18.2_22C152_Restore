@interface AIDAMutableServiceContext
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAaSignInFlowControllerDelegate:(id)a3;
- (void)setAaSignOutFlowControllerDelegate:(id)a3;
- (void)setAuthenticationResults:(id)a3;
- (void)setCdpUiProvider:(id)a3;
- (void)setOperationUIPermissions:(int64_t)a3;
- (void)setShouldForceOperation:(BOOL)a3;
- (void)setSignInContexts:(id)a3;
- (void)setSignOutContexts:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AIDAMutableServiceContext

- (void)setAuthenticationResults:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->super._authenticationResults, a3);
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EE08]];
  v7 = _AIDALogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      -[AIDAMutableServiceContext setAuthenticationResults:]((uint64_t)v6, v7);
    }
  }
  else if (v8)
  {
    -[AIDAMutableServiceContext setAuthenticationResults:](v7);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v6;
  }
  else {
    v9 = 0;
  }
  v10 = (NSMutableDictionary *)[v9 mutableCopy];
  telemetryTimeSeries = self->super.__telemetryTimeSeries;
  self->super.__telemetryTimeSeries = v10;
}

- (void)setShouldForceOperation:(BOOL)a3
{
  self->super._shouldForceOperation = a3;
}

- (void)setOperationUIPermissions:(int64_t)a3
{
  self->super._operationUIPermissions = a3;
}

- (void)setSignInContexts:(id)a3
{
}

- (void)setSignOutContexts:(id)a3
{
}

- (void)setAaSignInFlowControllerDelegate:(id)a3
{
  v4 = (AASignInFlowControllerDelegate *)a3;
  id v5 = (void *)[(NSDictionary *)self->super._signInContexts mutableCopy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = v7;

  [v9 setObject:v4 forKeyedSubscript:@"com.apple.AppleID.Service.Cloud"];
  [(AIDAMutableServiceContext *)self setSignInContexts:v9];
  aaSignInFlowControllerDelegate = self->super._aaSignInFlowControllerDelegate;
  self->super._aaSignInFlowControllerDelegate = v4;
}

- (void)setAaSignOutFlowControllerDelegate:(id)a3
{
  v4 = (AASignOutFlowControllerDelegate *)a3;
  id v5 = (void *)[(NSDictionary *)self->super._signOutContexts mutableCopy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = v7;

  [v9 setObject:v4 forKeyedSubscript:@"com.apple.AppleID.Service.Cloud"];
  [(AIDAMutableServiceContext *)self setSignOutContexts:v9];
  aaSignOutFlowControllerDelegate = self->super._aaSignOutFlowControllerDelegate;
  self->super._aaSignOutFlowControllerDelegate = v4;
}

- (void)setCdpUiProvider:(id)a3
{
}

- (void)setViewController:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAuthenticationResults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD36A000, log, OS_LOG_TYPE_DEBUG, "AIDAMutableServiceContext cannot extract time series", v1, 2u);
}

- (void)setAuthenticationResults:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DD36A000, a2, OS_LOG_TYPE_DEBUG, "AIDAMutableServiceContext extracted time series from auth results: %@", (uint8_t *)&v2, 0xCu);
}

@end