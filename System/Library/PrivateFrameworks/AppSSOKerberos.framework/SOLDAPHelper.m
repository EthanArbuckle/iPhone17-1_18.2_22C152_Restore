@interface SOLDAPHelper
- (BOOL)completionCalled;
- (BOOL)isConnected;
- (OS_ldap_connection)ldap;
- (OS_nw_connection)connection;
- (SOLDAPHelper)init;
- (void)connectToLDAPServer:(id)a3 andPort:(unsigned __int16)a4 andBundleIdentifier:(id)a5 andRequireTLSForLDAP:(BOOL)a6 completion:(id)a7;
- (void)connectToLDAPService:(id)a3 requireTLSForLDAP:(BOOL)a4 bundleIdentifier:(id)a5 inBackground:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)disconnect;
- (void)queryforBaseDN:(id)a3 andScope:(int)a4 andAttributes:(id)a5 withFilter:(id)a6 completion:(id)a7;
- (void)setCompletionCalled:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setLdap:(id)a3;
- (void)setupLDAPconnection:(id)a3 andPort:(unsigned __int16)a4 andRequireTLSForLDAP:(BOOL)a5 andBundleIdentifier:(id)a6;
- (void)startLDAPWithCompletion:(id)a3;
- (void)useDigestMD5Auth:(id)a3 andPassword:(id)a4;
- (void)useKerberosAuth:(gss_cred_id_t_desc_struct *)a3 forSPN:(id)a4;
@end

@implementation SOLDAPHelper

- (SOLDAPHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)SOLDAPHelper;
  result = [(SOLDAPHelper *)&v3 init];
  if (result) {
    *(_WORD *)&result->_isConnected = 0;
  }
  return result;
}

- (void)dealloc
{
  if ([(SOLDAPHelper *)self isConnected]) {
    [(SOLDAPHelper *)self disconnect];
  }
  v3.receiver = self;
  v3.super_class = (Class)SOLDAPHelper;
  [(SOLDAPHelper *)&v3 dealloc];
}

- (void)setupLDAPconnection:(id)a3 andPort:(unsigned __int16)a4 andRequireTLSForLDAP:(BOOL)a5 andBundleIdentifier:(id)a6
{
  BOOL v7 = a5;
  int v8 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v12 = [(SOLDAPHelper *)self ldap];

  if (!v12)
  {
    v13 = SO_LOG_SOLDAPHelper();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v10;
      __int16 v18 = 1024;
      int v19 = v8;
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_debug_impl(&dword_221304000, v13, OS_LOG_TYPE_DEBUG, "setting up ldap connection: %@, %d, %{public}@", buf, 0x1Cu);
    }

    v14 = (void *)ldap_connection_create_with_hostname();
    if (v7)
    {
      v15 = SO_LOG_SOLDAPHelper();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[SOLDAPHelper setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:]();
      }

      ldap_connection_set_tls();
    }
    if (v11 && ([v11 isEqualToString:&stru_26D3372C0] & 1) == 0)
    {
      [v11 UTF8String];
      ldap_connection_set_source_application_by_bundle();
    }
    ldap_connection_set_disconnect_handler();
    [(SOLDAPHelper *)self setLdap:v14];
  }
}

uint64_t __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = SO_LOG_SOLDAPHelper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) setIsConnected:0];
}

- (void)connectToLDAPServer:(id)a3 andPort:(unsigned __int16)a4 andBundleIdentifier:(id)a5 andRequireTLSForLDAP:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = a4;
  id v15 = a3;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, __CFString *))a7;
  v14 = [(SOLDAPHelper *)self ldap];

  if (v14)
  {
    v13[2](v13, 1, @"Already connected to server");
  }
  else
  {
    [(SOLDAPHelper *)self setupLDAPconnection:v15 andPort:v10 andRequireTLSForLDAP:v8 andBundleIdentifier:v12];
    [(SOLDAPHelper *)self connectToLDAPWithCompletion:v13];
  }
}

- (void)connectToLDAPService:(id)a3 requireTLSForLDAP:(BOOL)a4 bundleIdentifier:(id)a5 inBackground:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  v14 = (void (**)(id, void, __CFString *))a7;
  [(SOLDAPHelper *)self setCompletionCalled:0];
  id v15 = [(SOLDAPHelper *)self ldap];

  if (v15)
  {
    v14[2](v14, 0, @"There is already an ldap connection");
  }
  else
  {
    v16 = SO_LOG_SOLDAPHelper();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SOLDAPHelper connectToLDAPService:requireTLSForLDAP:bundleIdentifier:inBackground:completion:]((uint64_t)v12, (uint64_t)v13, v16);
    }

    [v12 UTF8String];
    srv = nw_endpoint_create_srv();
    legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
    if (v8) {
      nw_parameters_set_traffic_class();
    }
    if (v13 && ([v13 isEqualToString:&stru_26D3372C0] & 1) == 0)
    {
      [v13 UTF8String];
      nw_parameters_set_source_application_by_bundle_id();
    }
    nw_connection_t v19 = nw_connection_create(srv, legacy_tcp_socket);
    [(SOLDAPHelper *)self setConnection:v19];

    __int16 v20 = [(SOLDAPHelper *)self connection];
    id v21 = dispatch_get_global_queue(0, 0);
    nw_connection_set_queue(v20, v21);

    uint64_t v22 = [(SOLDAPHelper *)self connection];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke;
    v27 = &unk_2645A21E8;
    v28 = self;
    v30 = v14;
    BOOL v31 = a4;
    id v29 = v13;
    nw_connection_set_state_changed_handler(v22, &v24);

    v23 = [(SOLDAPHelper *)self connection];
    nw_connection_start(v23);
  }
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  v6 = SO_LOG_SOLDAPHelper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_4(a2, v6);
  }

  if (a2 > 1)
  {
    switch(a2)
    {
      case 3u:
        v14 = [*(id *)(a1 + 32) connection];
        uint64_t v10 = nw_connection_copy_connected_remote_endpoint();

        id v15 = nw_endpoint_copy_parent_endpoint();
        nw_endpoint_type_t type = nw_endpoint_get_type(v15);
        if (v15)
        {
          while (type != (nw_endpoint_type_url|nw_endpoint_type_address))
          {
            id v17 = v10;
            uint64_t v10 = v15;

            id v15 = nw_endpoint_copy_parent_endpoint();
            if (!v15) {
              break;
            }
            nw_endpoint_type_t type = nw_endpoint_get_type(v15);
          }
        }
        nw_connection_t v19 = [NSString stringWithCString:nw_endpoint_get_hostname(v10) encoding:4];
        __int16 v20 = [*(id *)(a1 + 32) connection];
        int connected_socket = nw_connection_get_connected_socket();

        if (connected_socket == -1
          || (!*(unsigned char *)(a1 + 56)
            ? (uint64_t v22 = ldap_connection_create_with_socket())
            : (uint64_t v22 = ldap_connection_create_with_socket_and_hostname()),
              (v23 = (void *)v22) == 0))
        {
          nw_endpoint_get_port(v10);
          v23 = (void *)ldap_connection_create_with_hostname();
        }
        if (*(unsigned char *)(a1 + 56))
        {
          uint64_t v24 = SO_LOG_SOLDAPHelper();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[SOLDAPHelper setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:]();
          }

          ldap_connection_set_tls();
        }
        uint64_t v25 = *(void **)(a1 + 40);
        if (v25 && ([v25 isEqualToString:&stru_26D3372C0] & 1) == 0)
        {
          [*(id *)(a1 + 40) UTF8String];
          ldap_connection_set_source_application_by_bundle();
        }
        ldap_connection_set_disconnect_handler();
        [*(id *)(a1 + 32) setLdap:v23];
        [*(id *)(a1 + 32) startLDAPWithCompletion:*(void *)(a1 + 48)];

        goto LABEL_40;
      case 5u:
        [*(id *)(a1 + 32) setConnection:0];
        __int16 v18 = SO_LOG_SOLDAPHelper();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_3();
        }

        if (([*(id *)(a1 + 32) completionCalled] & 1) == 0)
        {
          [*(id *)(a1 + 32) setCompletionCalled:1];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        break;
      case 4u:
        id v11 = SO_LOG_SOLDAPHelper();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_1((uint64_t)v5, v11);
        }

        id v12 = [*(id *)(a1 + 32) connection];

        if (v12)
        {
          id v13 = [*(id *)(a1 + 32) connection];
          nw_connection_cancel(v13);

          [*(id *)(a1 + 32) setConnection:0];
        }
        if (([*(id *)(a1 + 32) completionCalled] & 1) == 0)
        {
          [*(id *)(a1 + 32) setCompletionCalled:1];
          uint64_t v9 = *(void *)(a1 + 48);
          [NSString stringWithFormat:@"Failed to connect to server: %@", v5];
          goto LABEL_8;
        }
        break;
    }
  }
  else
  {
    BOOL v7 = [*(id *)(a1 + 32) connection];

    if (v7)
    {
      BOOL v8 = [*(id *)(a1 + 32) connection];
      nw_connection_cancel(v8);

      [*(id *)(a1 + 32) setConnection:0];
    }
    if (([*(id *)(a1 + 32) completionCalled] & 1) == 0)
    {
      [*(id *)(a1 + 32) setCompletionCalled:1];
      uint64_t v9 = *(void *)(a1 + 48);
      [NSString stringWithFormat:@"Waiting for connection: %@", v5];
      uint64_t v10 = LABEL_8:;
      (*(void (**)(uint64_t, void, NSObject *))(v9 + 16))(v9, 0, v10);
LABEL_40:
    }
  }
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_16(uint64_t a1)
{
  v2 = SO_LOG_SOLDAPHelper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setIsConnected:0];
  objc_super v3 = [*(id *)(a1 + 32) connection];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) connection];
    nw_connection_cancel(v4);

    [*(id *)(a1 + 32) setConnection:0];
  }
}

- (void)startLDAPWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = SO_LOG_SOLDAPHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOLDAPHelper startLDAPWithCompletion:]();
  }

  v6 = [(SOLDAPHelper *)self ldap];
  id v7 = v4;
  ldap_connection_start();
}

void __40__SOLDAPHelper_startLDAPWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (a4 == 10003)
  {
    id v7 = SO_LOG_SOLDAPHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__SOLDAPHelper_startLDAPWithCompletion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to connect to server: %d", 10003);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

    goto LABEL_8;
  }
  if (a4)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to connect to server: %d", a4);
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

LABEL_8:
    [*(id *)(a1 + 32) setIsConnected:0];
    [*(id *)(a1 + 32) setCompletionCalled:1];
    [*(id *)(a1 + 32) setLdap:0];
    goto LABEL_9;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setIsConnected:1];
  [*(id *)(a1 + 32) setCompletionCalled:1];
LABEL_9:
}

- (void)queryforBaseDN:(id)a3 andScope:(int)a4 andAttributes:(id)a5 withFilter:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [(SOLDAPHelper *)self ldap];
  id v19 = v11;
  id v16 = v19;
  id v17 = (void *)ldap_connection_query_create();

  if (!v17)
  {
    __int16 v18 = SO_LOG_SOLDAPHelper();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SOLDAPHelper queryforBaseDN:andScope:andAttributes:withFilter:completion:]();
    }

    (*((void (**)(id, void, __CFString *, void))v16 + 2))(v16, 0, @"LDAP Failed to create query", 0);
  }
}

void __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = SO_LOG_SOLDAPHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke_cold_1();
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (void *)[a3 copy];
  (*(void (**)(uint64_t, uint64_t, __CFString *, void *))(v6 + 16))(v6, 1, &stru_26D3372C0, v7);
}

void __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke_29(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v5 = (id)ldap_operation_copy_error_string();
    id v4 = [NSString stringWithFormat:@"LDAP Connection Error: %@", v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)disconnect
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "LDAP disconnecting received", v2, v3, v4, v5, v6);
}

- (void)useDigestMD5Auth:(id)a3 andPassword:(id)a4
{
  uint8_t v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 dictionary];
  [v10 setValue:v8 forKey:*MEMORY[0x263F27750]];

  [v10 setValue:v7 forKey:*MEMORY[0x263F27748]];
  uint64_t v9 = [(SOLDAPHelper *)self ldap];
  ldap_connection_add_credential();
}

- (void)useKerberosAuth:(gss_cred_id_t_desc_struct *)a3 forSPN:(id)a4
{
  CFErrorRef error = 0;
  gss_name_t v6 = GSSCreateName(a4, MEMORY[0x263F08DF8], &error);
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setValue:a3 forKey:*MEMORY[0x263F27738]];
  [v7 setValue:v6 forKey:*MEMORY[0x263F27740]];
  id v8 = [(SOLDAPHelper *)self ldap];
  ldap_connection_add_credential();
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (OS_ldap_connection)ldap
{
  return self->_ldap;
}

- (void)setLdap:(id)a3
{
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)completionCalled
{
  return self->_completionCalled;
}

- (void)setCompletionCalled:(BOOL)a3
{
  self->_completionCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_ldap, 0);
}

- (void)setupLDAPconnection:andPort:andRequireTLSForLDAP:andBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "LDAP TLS support is enabled", v2, v3, v4, v5, v6);
}

void __85__SOLDAPHelper_setupLDAPconnection_andPort_andRequireTLSForLDAP_andBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "LDAP closed connection to server", v2, v3, v4, v5, v6);
}

- (void)connectToLDAPService:(os_log_t)log requireTLSForLDAP:bundleIdentifier:inBackground:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "setting up ldap connection: %@, %{public}@", (uint8_t *)&v3, 0x16u);
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221304000, a2, OS_LOG_TYPE_ERROR, "tcp error: %@", (uint8_t *)&v2, 0xCu);
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "connection closed or cancelled", v2, v3, v4, v5, v6);
}

void __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "tcp state: %u", (uint8_t *)v2, 8u);
}

- (void)startLDAPWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Connecting to server", v2, v3, v4, v5, v6);
}

void __40__SOLDAPHelper_startLDAPWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "Failed to negotiate a TLS connection with the LDAP server", v1, 2u);
}

- (void)queryforBaseDN:andScope:andAttributes:withFilter:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "Failed to create LDAP query", v1, 2u);
}

void __76__SOLDAPHelper_queryforBaseDN_andScope_andAttributes_withFilter_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Query Response received", v2, v3, v4, v5, v6);
}

@end