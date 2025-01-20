@interface SOAsynchronousLDAPOperation
- (BOOL)requireTLSForLDAP;
- (NSString)bundleIdentifier;
- (NSString)host;
- (NSString)realm;
- (SOAsynchronousLDAPOperation)initWithRealm:(id)a3 andHost:(id)a4 andPort:(unsigned __int16)a5 andBundleIdentifier:(id)a6 andRequireTLSForLDAP:(BOOL)a7 andCompletion:(id)a8;
- (id)completion;
- (unsigned)port;
- (void)main;
- (void)setBundleIdentifier:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setHost:(id)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setRealm:(id)a3;
- (void)setRequireTLSForLDAP:(BOOL)a3;
@end

@implementation SOAsynchronousLDAPOperation

- (SOAsynchronousLDAPOperation)initWithRealm:(id)a3 andHost:(id)a4 andPort:(unsigned __int16)a5 andBundleIdentifier:(id)a6 andRequireTLSForLDAP:(BOOL)a7 andCompletion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SOAsynchronousLDAPOperation;
  v18 = [(SOAsynchronousOperation *)&v21 init];
  v19 = v18;
  if (v18)
  {
    [(SOAsynchronousLDAPOperation *)v18 setRealm:v14];
    [(SOAsynchronousLDAPOperation *)v19 setHost:v15];
    [(SOAsynchronousLDAPOperation *)v19 setPort:v11];
    [(SOAsynchronousLDAPOperation *)v19 setCompletion:v17];
    [(SOAsynchronousLDAPOperation *)v19 setBundleIdentifier:v16];
    [(SOAsynchronousLDAPOperation *)v19 setRequireTLSForLDAP:v9];
  }

  return v19;
}

- (void)main
{
  v1 = [a1 host];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Start of ldap operation for host: %{public}@", v4, v5, v6, v7, v8);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = SO_LOG_SOAsynchronousLDAPOperation();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v7) {
      __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_1(a1);
    }

    uint8_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__SOAsynchronousLDAPOperation_main__block_invoke_8;
    v13[3] = &unk_2645A23A0;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = v10;
    uint64_t v15 = v11;
    [v10 queryforBaseDN:&stru_26D3372C0 andScope:0 andAttributes:&unk_26D33C1B8 withFilter:v9 completion:v13];
  }
  else
  {
    if (v7) {
      __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_2(a1);
    }

    v12 = [*(id *)(a1 + 32) completion];
    v12[2](v12, 0, 0);

    [*(id *)(a1 + 40) disconnect];
    [*(id *)(a1 + 32) finish];
  }
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) disconnect];
  if (a2)
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"netlogon"];
    id v10 = [v9 firstObject];
    uint64_t v11 = [v10 base64EncodedStringWithOptions:32];
    v12 = SO_LOG_SOAsynchronousLDAPOperation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __35__SOAsynchronousLDAPOperation_main__block_invoke_8_cold_2();
    }

    v13 = +[SONetLogonParser parseNetLoginUsingData:v10];
    id v14 = [NSNumber numberWithShort:8];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    id v16 = SO_LOG_SOAsynchronousLDAPOperation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __35__SOAsynchronousLDAPOperation_main__block_invoke_8_cold_1();
    }

    id v17 = [*(id *)(a1 + 40) completion];
    ((void (**)(void, uint64_t, void *))v17)[2](v17, 1, v15);
  }
  else
  {
    v18 = SO_LOG_SOAsynchronousLDAPOperation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __35__SOAsynchronousLDAPOperation_main__block_invoke_8_cold_3(a1);
    }

    uint64_t v9 = [*(id *)(a1 + 40) completion];
    v9[2](v9, 0, 0);
  }

  [*(id *)(a1 + 40) finish];
}

- (id)completion
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (BOOL)requireTLSForLDAP
{
  return self->_requireTLSForLDAP;
}

- (void)setRequireTLSForLDAP:(BOOL)a3
{
  self->_requireTLSForLDAP = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong(&self->_completion, 0);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) host];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "connected to host: %{public}@", v4, v5, v6, v7, v8);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) host];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_221304000, v2, v3, "error with ldap connection for host: %@, %@", v4, v5, v6, v7, v8);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_8_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_221304000, v0, OS_LOG_TYPE_DEBUG, "netlogon response: %{public}@", v1, 0xCu);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_8_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_221304000, v0, OS_LOG_TYPE_DEBUG, "response from ldap: %{public}@", v1, 0xCu);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_8_cold_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) host];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_221304000, v2, v3, "error with netlogon ping for host: %{public}@, %{public}@", v4, v5, v6, v7, v8);
}

@end