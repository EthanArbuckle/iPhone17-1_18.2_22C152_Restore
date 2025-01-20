@interface SOADSiteDiscovery
- (NSOperationQueue)queue;
- (NSString)realm;
- (SOADSiteDiscovery)initWithRealm:(id)a3;
- (SODNSSRVQuery)dns;
- (void)discoverADInfoUsingSourceAppBundleIdentifier:(id)a3 auditTokenData:(id)a4 requireTLSForLDAP:(BOOL)a5 withCompletion:(id)a6;
- (void)performLDAPPingUsingSite:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 requireTLSForLDAP:(BOOL)a6 inBackground:(BOOL)a7 completion:(id)a8;
- (void)performNetworkConnectionUsingService:(id)a3 orHost:(id)a4 port:(unsigned __int16)a5 inBackground:(BOOL)a6 completion:(id)a7;
- (void)setDns:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRealm:(id)a3;
@end

@implementation SOADSiteDiscovery

- (SOADSiteDiscovery)initWithRealm:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SOADSiteDiscovery;
  v6 = [(SOADSiteDiscovery *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_realm, a3);
    uint64_t v8 = objc_opt_new();
    queue = v7->_queue;
    v7->_queue = (NSOperationQueue *)v8;

    v10 = [NSString stringWithFormat:@"com.apple.appsso.Kerberos.ldap.%@", v5];
    [(NSOperationQueue *)v7->_queue setName:v10];

    [(NSOperationQueue *)v7->_queue setMaxConcurrentOperationCount:1];
    v11 = objc_alloc_init(SODNSSRVQuery);
    dns = v7->_dns;
    v7->_dns = v11;
  }
  return v7;
}

- (void)discoverADInfoUsingSourceAppBundleIdentifier:(id)a3 auditTokenData:(id)a4 requireTLSForLDAP:(BOOL)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[SOADSiteDiscovery discoverADInfoUsingSourceAppBundleIdentifier:auditTokenData:requireTLSForLDAP:withCompletion:](self);
  }

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = 0;
  objc_super v14 = NSString;
  v15 = [(SOADSiteDiscovery *)self realm];
  v16 = [v14 stringWithFormat:@"_ldap._tcp.%@", v15];

  v17 = [(SOADSiteDiscovery *)self dns];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke;
  v20[3] = &unk_2645A22B0;
  v20[4] = self;
  id v18 = v10;
  BOOL v24 = a5;
  id v21 = v18;
  v23 = v25;
  id v19 = v12;
  id v22 = v19;
  [v17 lookupSRVWithQuery:v16 bundleIdentifier:v18 auditTokenData:v11 completion:v20];

  _Block_object_dispose(v25, 8);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_3();
  }

  objc_initWeak(&location, *(id *)(a1 + 32));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v8 = [SOAsynchronousLDAPOperation alloc];
        v9 = [*(id *)(a1 + 32) realm];
        id v10 = [v7 host];
        uint64_t v11 = [v7 port];
        uint64_t v12 = *(void *)(a1 + 40);
        BOOL v13 = *(unsigned char *)(a1 + 64) != 0;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_7;
        v22[3] = &unk_2645A2288;
        uint64_t v14 = *(void *)(a1 + 56);
        v22[4] = v7;
        v22[5] = v14;
        objc_copyWeak(&v23, &location);
        v15 = [(SOAsynchronousLDAPOperation *)v8 initWithRealm:v9 andHost:v10 andPort:v11 andBundleIdentifier:v12 andRequireTLSForLDAP:v13 andCompletion:v22];

        v16 = [*(id *)(a1 + 32) queue];
        [v16 addOperation:v15];

        objc_destroyWeak(&v23);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  v17 = [*(id *)(a1 + 32) queue];
  [v17 waitUntilAllOperationsAreFinished];

  id v18 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_2(v18);
  }

  id v19 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_destroyWeak(&location);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  v7 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_7_cold_1((uint64_t)v6, a1, v7);
  }

  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = [WeakRetained queue];
    [v9 cancelAllOperations];
  }
}

- (void)performLDAPPingUsingSite:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 requireTLSForLDAP:(BOOL)a6 inBackground:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a8;
  id v15 = a4;
  v16 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[SOADSiteDiscovery performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:](self);
  }

  v17 = NSString;
  uint64_t v18 = [(SOADSiteDiscovery *)self realm];
  id v19 = (void *)v18;
  if (v13) {
    [v17 stringWithFormat:@"_ldap._tcp.%@._sites.%@", v13, v18];
  }
  else {
  v20 = [v17 stringWithFormat:@"_ldap._tcp.%@", v18, v30];
  }

  uint64_t v21 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[SOADSiteDiscovery performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:]();
  }

  id v22 = objc_opt_new();
  id v23 = NSString;
  long long v24 = [(SOADSiteDiscovery *)self realm];
  long long v25 = [v23 stringWithFormat:@"(&(DnsDomain=%@)(NtVer=\\06\\00\\00\\00))", v24];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke;
  v31[3] = &unk_2645A2300;
  id v32 = v20;
  id v33 = v22;
  id v34 = v25;
  id v35 = v14;
  id v26 = v14;
  id v27 = v25;
  id v28 = v22;
  id v29 = v20;
  [v28 connectToLDAPService:v29 requireTLSForLDAP:v10 bundleIdentifier:v15 inBackground:v9 completion:v31];
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = SO_LOG_SOADSiteDiscovery();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v7) {
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23;
    v10[3] = &unk_2645A22D8;
    id v11 = v8;
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 32);
    [v11 queryforBaseDN:&stru_26D3372C0 andScope:0 andAttributes:&unk_26D33C1A0 withFilter:v9 completion:v10];
  }
  else
  {
    if (v7) {
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 40) disconnect];
  }
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) disconnect];
  if (a2)
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"netlogon"];
    BOOL v10 = [v9 firstObject];
    id v11 = [v10 base64EncodedStringWithOptions:32];
    id v12 = SO_LOG_SOADSiteDiscovery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23_cold_2();
    }

    id v13 = +[SONetLogonParser parseNetLoginUsingData:v10];
    id v14 = [NSNumber numberWithShort:8];
    id v15 = [v13 objectForKeyedSubscript:v14];

    v16 = SO_LOG_SOADSiteDiscovery();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v17 = SO_LOG_SOADSiteDiscovery();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)performNetworkConnectionUsingService:(id)a3 orHost:(id)a4 port:(unsigned __int16)a5 inBackground:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a7;
  id v13 = v12;
  if (v10 | v11)
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    id v32 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
    if (v8) {
      nw_parameters_set_traffic_class();
    }
    if (v10)
    {
      [ (id) v10 UTF8String];
      srv = nw_endpoint_create_srv();
    }
    else
    {
      [ (id) v11 UTF8String];
      srv = nw_endpoint_create_host_with_numeric_port();
    }
    nw_connection_t v16 = nw_connection_create(srv, secure_tcp);
    v17 = (void *)v28[5];
    v28[5] = (uint64_t)v16;

    uint64_t v18 = v28[5];
    id v19 = dispatch_get_global_queue(0, 0);
    nw_connection_set_queue(v18, v19);

    v20 = v28[5];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke;
    handler[3] = &unk_2645A2328;
    id v23 = v25;
    long long v24 = &v27;
    id v22 = v13;
    nw_connection_set_state_changed_handler(v20, handler);
    nw_connection_start((nw_connection_t)v28[5]);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

void __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke(void *a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  id v6 = SO_LOG_SOADSiteDiscovery();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __96__SOLDAPHelper_connectToLDAPService_requireTLSForLDAP_bundleIdentifier_inBackground_completion___block_invoke_cold_4(a2, v6);
  }

  if (a2 <= 1) {
    goto LABEL_10;
  }
  switch(a2)
  {
    case 3u:
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1[6] + 8) + 40));
      uint64_t v11 = *(void *)(a1[6] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;

      unint64_t v10 = *(void (**)(void))(a1[4] + 16);
      goto LABEL_12;
    case 5u:
      uint64_t v13 = *(void *)(a1[6] + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;

      id v15 = SO_LOG_SOADSiteDiscovery();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_2(v15);
      }

      uint64_t v16 = *(void *)(a1[5] + 8);
      if (!*(unsigned char *)(v16 + 24))
      {
        *(unsigned char *)(v16 + 24) = 1;
        goto LABEL_11;
      }
      break;
    case 4u:
      id v7 = SO_LOG_SOADSiteDiscovery();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_1();
      }

LABEL_10:
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1[6] + 8) + 40));
      uint64_t v8 = *(void *)(a1[6] + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;

LABEL_11:
      unint64_t v10 = *(void (**)(void))(a1[4] + 16);
LABEL_12:
      v10();
      break;
  }
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SODNSSRVQuery)dns
{
  return (SODNSSRVQuery *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dns, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

- (void)discoverADInfoUsingSourceAppBundleIdentifier:(void *)a1 auditTokenData:requireTLSForLDAP:withCompletion:.cold.1(void *a1)
{
  v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Start of discoverADInfoWithCompletion: %{public}@", v4, v5, v6, v7, v8);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "using site code: %@", v2, v3, v4, v5, v6);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "all LDAP operations complete", v1, 2u);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "responses for LDAP: %@", v2, v3, v4, v5, v6);
}

void __114__SOADSiteDiscovery_discoverADInfoUsingSourceAppBundleIdentifier_auditTokenData_requireTLSForLDAP_withCompletion___block_invoke_7_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a2 + 32) host];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_221304000, a3, OS_LOG_TYPE_DEBUG, "received new site code: %@, from server: %@", (uint8_t *)&v6, 0x16u);
}

- (void)performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "Start of ldap operation for service: %{public}@", v2, v3, v4, v5, v6);
}

- (void)performLDAPPingUsingSite:(void *)a1 bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:.cold.2(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Start of performLDAPPingUsingSite: %{public}@", v4, v5, v6, v7, v8);
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "response from service: %{public}@", v2, v3, v4, v5, v6);
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_221304000, v0, v1, "error with ldap connection for service: %@, %@");
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "netlogon response: %{public}@", v2, v3, v4, v5, v6);
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "response from ldap: %{public}@", v2, v3, v4, v5, v6);
}

void __120__SOADSiteDiscovery_performLDAPPingUsingSite_bundleIdentifier_auditTokenData_requireTLSForLDAP_inBackground_completion___block_invoke_23_cold_3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_221304000, v0, v1, "error with netlogon ping for service: %{public}@, %{public}@");
}

void __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "tcp error: %@", v1, 0xCu);
}

void __94__SOADSiteDiscovery_performNetworkConnectionUsingService_orHost_port_inBackground_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "connection cancelled", v1, 2u);
}

@end