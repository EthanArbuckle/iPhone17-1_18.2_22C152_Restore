@interface SODNSSRVQuery
- (SODNSSRVQuery)init;
- (id)lookupSRVWithQuery:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5;
- (void)lookupHost:(id)a3 port:(id)a4 bundleIdentifier:(id)a5 auditTokenData:(id)a6 completion:(id)a7;
- (void)lookupSRVWithQuery:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 completion:(id)a6;
@end

@implementation SODNSSRVQuery

- (SODNSSRVQuery)init
{
  v3.receiver = self;
  v3.super_class = (Class)SODNSSRVQuery;
  return [(SODNSSRVQuery *)&v3 init];
}

- (id)lookupSRVWithQuery:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  id v38 = (id)objc_opt_new();
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  dispatch_group_t v32 = dispatch_group_create();
  nw_parameters_t v10 = nw_parameters_create();
  if (v8 && ([v8 isEqualToString:&stru_26D3372C0] & 1) == 0)
  {
    v11 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:]();
    }

    [v8 UTF8String];
    nw_parameters_set_source_application_by_bundle_id();
  }
  memset(v26, 0, sizeof(v26));
  if (v9 && [MEMORY[0x263F25290] auditTokenFromData:v9 auditToken:v26])
  {
    v12 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SONetworkIdentity evaluateVPNPath:]();
    }

    nw_parameters_set_source_application();
  }
  id v13 = v7;
  [v13 UTF8String];
  srv = (void *)nw_endpoint_create_srv();
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v16 = nw_path_evaluator_copy_path();
  v17 = v16;
  if (v16 && nw_path_get_status(v16) == nw_path_status_satisfied)
  {
    v18 = (void *)nw_resolver_create_with_path();
    dispatch_group_enter((dispatch_group_t)v28[5]);
    v19 = dispatch_get_global_queue(0, 0);
    id v25 = v18;
    nw_resolver_set_update_handler();
  }
  v20 = v28[5];
  dispatch_time_t v21 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v20, v21) >= 1)
  {
    v22 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:]();
    }
  }
  id v23 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __68__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2) {
    goto LABEL_4;
  }
  if (a2 == 2)
  {
    nw_array_apply();
LABEL_4:
    nw_resolver_cancel();
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

uint64_t __68__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = a3;
  id v5 = objc_opt_new();
  v6 = [NSString stringWithCString:nw_endpoint_get_hostname(v4) encoding:4];
  if ([v6 hasSuffix:@"."])
  {
    uint64_t v7 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

    v6 = (void *)v7;
  }
  [v5 setHost:v6];
  [v5 setPort:nw_endpoint_get_port(v4)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];

  return 1;
}

- (void)lookupSRVWithQuery:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__2;
  v27[4] = __Block_byref_object_dispose__2;
  id v28 = (id)objc_opt_new();
  id v13 = SO_LOG_SODNSSRVQuery();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:]();
  }

  nw_parameters_t v14 = nw_parameters_create();
  if (v10 && ([v10 isEqualToString:&stru_26D3372C0] & 1) == 0)
  {
    v15 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:]();
    }

    [v10 UTF8String];
    nw_parameters_set_source_application_by_bundle_id();
  }
  memset(v26, 0, sizeof(v26));
  if (v11 && [MEMORY[0x263F25290] auditTokenFromData:v11 auditToken:v26])
  {
    v16 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:]();
    }

    nw_parameters_set_source_application();
  }
  id v17 = v9;
  [v17 UTF8String];
  srv = (void *)nw_endpoint_create_srv();
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v20 = nw_path_evaluator_copy_path();
  dispatch_time_t v21 = v20;
  if (v20 && nw_path_get_status(v20) == nw_path_status_satisfied)
  {
    v22 = (void *)nw_resolver_create_with_path();
    id v23 = dispatch_get_global_queue(0, 0);
    id v24 = v22;
    id v25 = v12;
    nw_resolver_set_update_handler();
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }

  _Block_object_dispose(v27, 8);
}

void __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    uint64_t v7 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1();
    }

    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    nw_array_apply();
    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
    v6();
  }
}

uint64_t __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = a3;
  id v5 = objc_opt_new();
  v6 = [NSString stringWithCString:nw_endpoint_get_hostname(v4) encoding:4];
  if ([v6 hasSuffix:@"."])
  {
    uint64_t v7 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

    v6 = (void *)v7;
  }
  [v5 setHost:v6];
  [v5 setPort:nw_endpoint_get_port(v4)];
  id v8 = SO_LOG_SODNSSRVQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1();
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  return 1;
}

- (void)lookupHost:(id)a3 port:(id)a4 bundleIdentifier:(id)a5 auditTokenData:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__2;
  v33[4] = __Block_byref_object_dispose__2;
  id v34 = (id)objc_opt_new();
  v16 = SO_LOG_SODNSSRVQuery();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[SODNSSRVQuery lookupHost:port:bundleIdentifier:auditTokenData:completion:]();
  }

  nw_parameters_t v17 = nw_parameters_create();
  if (v13 && ([v13 isEqualToString:&stru_26D3372C0] & 1) == 0)
  {
    v18 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:]();
    }

    [v13 UTF8String];
    nw_parameters_set_source_application_by_bundle_id();
  }
  memset(v32, 0, sizeof(v32));
  if (v14 && [MEMORY[0x263F25290] auditTokenFromData:v14 auditToken:v32])
  {
    v19 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[SODNSSRVQuery lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:]();
    }

    nw_parameters_set_source_application();
  }
  id v20 = v11;
  dispatch_time_t v21 = (const char *)[v20 UTF8String];
  id v22 = v12;
  nw_endpoint_t host = nw_endpoint_create_host(v21, (const char *)[v22 UTF8String]);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  id v25 = nw_path_evaluator_copy_path();
  v26 = v25;
  if (v25 && nw_path_get_status(v25) == nw_path_status_satisfied)
  {
    id v29 = v14;
    uint64_t v27 = (void *)nw_resolver_create_with_path();
    id v28 = dispatch_get_global_queue(0, 0);
    id v30 = v27;
    id v31 = v15;
    nw_resolver_set_update_handler();

    id v14 = v29;
  }
  else
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }

  _Block_object_dispose(v33, 8);
}

void __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    uint64_t v7 = SO_LOG_SODNSSRVQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1();
    }

    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    nw_array_apply();
    nw_resolver_cancel();
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
    v6();
  }
}

uint64_t __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 description];
  id v5 = SO_LOG_SODNSSRVQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1();
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  return 1;
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "timeout waiting for srv data, proceeding", v2, v3, v4, v5, v6);
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "Using bundleIdentifier %{public}@", v2, v3, v4, v5, v6);
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Using audit token", v2, v3, v4, v5, v6);
}

- (void)lookupSRVWithQuery:bundleIdentifier:auditTokenData:completion:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "Starting SRV query: %@", v2, v3, v4, v5, v6);
}

void __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "error receiving srv data", v2, v3, v4, v5, v6);
}

void __79__SODNSSRVQuery_lookupSRVWithQuery_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "adding result: %@", v2, v3, v4, v5, v6);
}

- (void)lookupHost:port:bundleIdentifier:auditTokenData:completion:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "Starting host query: %@", v2, v3, v4, v5, v6);
}

void __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "error receiving dns data", v2, v3, v4, v5, v6);
}

void __76__SODNSSRVQuery_lookupHost_port_bundleIdentifier_auditTokenData_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "adding result: %@", v2, v3, v4, v5, v6);
}

@end