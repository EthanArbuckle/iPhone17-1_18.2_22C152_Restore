@interface XAMLocalAuthenticationProvider
- (id)_makeAuthorizationContext;
- (id)authorizationWithError:(id *)a3;
- (id)localizedAuthorizationReason;
- (void)requestAuthorizationWithReply:(id)a3;
@end

@implementation XAMLocalAuthenticationProvider

- (id)localizedAuthorizationReason
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Authorize UI Automation Prompt" value:@"Enable UI Automation" table:0];

  return v3;
}

- (id)_makeAuthorizationContext
{
  v2 = objc_opt_new();
  v3 = XAMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23C1A0000, v3, OS_LOG_TYPE_DEFAULT, "Setting context caller name to XCTest", v5, 2u);
  }

  [v2 setOptionCallerName:@"XCTest"];
  return v2;
}

- (void)requestAuthorizationWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(XAMLocalAuthenticationProvider *)self _makeAuthorizationContext];
  v6 = [(XAMLocalAuthenticationProvider *)self localizedAuthorizationReason];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__XAMLocalAuthenticationProvider_requestAuthorizationWithReply___block_invoke;
  v9[3] = &unk_264E36880;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  [v7 evaluatePolicy:2 localizedReason:v6 reply:v9];
}

uint64_t __64__XAMLocalAuthenticationProvider_requestAuthorizationWithReply___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (id)authorizationWithError:(id *)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v5 = [(XAMLocalAuthenticationProvider *)self _makeAuthorizationContext];
  v15 = &unk_26EFDBA10;
  v6 = [(XAMLocalAuthenticationProvider *)self localizedAuthorizationReason];
  v16[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v8 = [v5 evaluatePolicy:2 options:v7 error:a3];

  v9 = XAMLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_23C1A0000, v9, OS_LOG_TYPE_DEFAULT, "Sync evaluate policy returned %{public}@", (uint8_t *)&v13, 0xCu);
  }

  if (v8) {
    id v10 = v5;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end