@interface CCAdminConnection
- (CCAdminConnection)initWithConnection:(id)a3 writeAccess:(id)a4 accessAssertion:(id)a5;
- (id)_shouldDeferActivityBlock;
- (void)removeSetsRootDirectory:(id)a3;
- (void)startMaintenanceActivity:(id)a3;
@end

@implementation CCAdminConnection

- (CCAdminConnection)initWithConnection:(id)a3 writeAccess:(id)a4 accessAssertion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CCAdminConnection;
  v12 = [(CCAdminConnection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_writeAccess, a4);
    objc_storeStrong((id *)&v13->_accessAssertion, a5);
  }

  return v13;
}

- (id)_shouldDeferActivityBlock
{
  v2 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_1;
  v6[3] = &unk_2652783D0;
  id v7 = v2;
  id v3 = v2;
  v4 = (void *)MEMORY[0x24C5B0C10](v6);

  return v4;
}

void __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

BOOL __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_1(uint64_t a1)
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_2;
  v6[3] = &unk_2652783A8;
  void v6[4] = &v7;
  [v1 shouldDeferCurrentActivity:v6];
  if (*((unsigned char *)v8 + 24))
  {
    id v2 = __biome_log_for_category();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "Admin client has signaled to defer current activity", v5, 2u);
    }

    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)startMaintenanceActivity:(id)a3
{
  id v9 = a3;
  writeAccess = self->_writeAccess;
  v5 = [(CCAdminConnection *)self _shouldDeferActivityBlock];
  int v6 = [(CCDataResourceWriteAccess *)writeAccess performMaintenanceActivity:v5 accessAssertion:self->_accessAssertion];

  uint64_t v7 = v9;
  if (v9)
  {
    if (v6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v8);
    uint64_t v7 = v9;
  }
}

- (void)removeSetsRootDirectory:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = (void (**)(id, uint64_t))a3;
  v4 = [MEMORY[0x263F29E70] legacySetsRootDirectoryURL];
  if (v4)
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    int v6 = [v4 path];
    id v12 = 0;
    int v7 = [v5 removeItemAtPath:v6 error:&v12];
    id v8 = v12;

    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = @"NO";
      if (v7) {
        char v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_249B69000, v9, OS_LOG_TYPE_DEFAULT, "Removed sets root directory URL: %@ success: %@", buf, 0x16u);
    }

    if (v3)
    {
      if (v7) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      v3[2](v3, v11);
    }
  }
  else
  {
    if (v3) {
      v3[2](v3, 2);
    }
    id v8 = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B69000, a2, OS_LOG_TYPE_ERROR, "Failed to check admin client for activity deferral: %@", (uint8_t *)&v2, 0xCu);
}

@end