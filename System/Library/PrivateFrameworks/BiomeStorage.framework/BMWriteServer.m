@interface BMWriteServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation BMWriteServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1AD11E210]();
  v9 = [MEMORY[0x1E4F4FB80] processWithXPCConnection:v7];
  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 executableName];
    int v24 = 138543618;
    v25 = v11;
    __int16 v26 = 1024;
    int v27 = [v9 pid];
    _os_log_impl(&dword_1AD076000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", (uint8_t *)&v24, 0x12u);
  }
  v12 = [MEMORY[0x1E4F4FB38] policyForProcess:v9 connectionFlags:0 useCase:*MEMORY[0x1E4F4FB08]];
  if (([v12 allowsConnectionToWriteService] & 1) == 0)
  {
    __biome_log_for_category();
    v18 = (BMWriteServerExported *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR)) {
      -[BMWriteServer listener:shouldAcceptNewConnection:](v9);
    }
    goto LABEL_13;
  }
  int v13 = [v9 uid];
  if (v13 != getuid())
  {
    __biome_log_for_category();
    v18 = (BMWriteServerExported *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR)) {
      -[BMWriteServer listener:shouldAcceptNewConnection:](v9);
    }
    goto LABEL_13;
  }
  client = self->_client;
  v15 = [v9 identifier];
  v16 = v15;
  if (!client)
  {
    v21 = self->_client;
    self->_client = v15;

    goto LABEL_16;
  }
  BOOL v17 = [(NSString *)client isEqualToString:v15];

  if (v17)
  {
LABEL_16:
    v18 = [[BMWriteServerExported alloc] initWithProcess:v9 accessControlPolicy:v12];
    v22 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F041A7B0];
    [v7 setExportedInterface:v22];

    [v7 setExportedObject:v18];
    v23 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F041A290];
    [v7 setRemoteObjectInterface:v23];

    [v7 resume];
    BOOL v19 = 1;
    goto LABEL_14;
  }
  __biome_log_for_category();
  v18 = (BMWriteServerExported *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR)) {
    -[BMWriteServer listener:shouldAcceptNewConnection:](v9);
  }
LABEL_13:
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (void).cxx_destruct
{
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  v2 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v3, v4, "Refusing connection from %{public}@(%d), client mismatch", v5, v6, v7, v8, v9);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.2(void *a1)
{
  v2 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v3, v4, "Refusing connection from %{public}@(%d), wrong user", v5, v6, v7, v8, v9);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.3(void *a1)
{
  v2 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v3, v4, "Refusing connection from %{public}@(%d), process not properly entitled", v5, v6, v7, v8, v9);
}

@end