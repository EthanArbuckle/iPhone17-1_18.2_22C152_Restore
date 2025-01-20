@interface ContextSyncClient
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDeviceTypes:(int64_t)a7;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDeviceTypes:(int64_t)a7 withError:(id *)a8;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDevices:(id)a7 withError:(id *)a8;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDeviceTypes:(int64_t)a7 withError:(id *)a8;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDevices:(id)a7 withError:(id *)a8;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 shouldWake:(BOOL)a5 forDeviceTypes:(int64_t)a6;
- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 shouldWake:(BOOL)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5 withError:(id *)a6;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7;
- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDevices:(id)a6 withError:(id *)a7;
- (ContextSyncClient)initWithClientName:(id)a3;
- (NSString)clientName;
- (NSXPCConnection)connection;
- (void)setClientName:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation ContextSyncClient

- (ContextSyncClient)initWithClientName:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ContextSyncClient;
  v6 = [(ContextSyncClient *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientName, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.biome.ContextSync" options:4096];
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v8;

    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D20BAE8];
    [(NSXPCConnection *)v7->_connection setRemoteObjectInterface:v10];
    [(NSXPCConnection *)v7->_connection resume];
  }
  return v7;
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 shouldWake:(BOOL)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7
{
  return [(ContextSyncClient *)self registerForUpdates:a3 withIdentifier:a4 forUseCase:*MEMORY[0x263F29E20] shouldWake:a5 forDeviceTypes:a6 withError:a7];
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDeviceTypes:(int64_t)a7 withError:(id *)a8
{
  BOOL v9 = a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [NSNumber numberWithBool:v9];
    v19 = [NSNumber numberWithInteger:a7];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_2201A2000, v17, OS_LOG_TYPE_INFO, "Received DSL with shouldWake %@ for devices %@", buf, 0x16u);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v14 useCase:v16 withError:a8])goto LABEL_10; {
  if (!v15)
  }
  {
    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    +[BMDistributedContextUtilities updateDescriptionForError:a8 withErrorCode:5];
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_11;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  connection = self->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke;
  v28[3] = &unk_26455C2B0;
  v28[5] = buf;
  v28[6] = a2;
  v28[4] = &v29;
  v21 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_58;
  v27[3] = &unk_26455C2D8;
  v27[4] = &v29;
  v27[5] = buf;
  [v21 registerForUpdates:v14 withIdentifier:v15 forUseCase:v16 withOptions:v9 forDeviceTypes:a7 withErrorHandler:v27];

  if (!*((unsigned char *)v30 + 24) && *(void *)(*(void *)&buf[8] + 40))
  {
    v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    if (a8) {
      *a8 = *(id *)(*(void *)&buf[8] + 40);
    }
  }
  BOOL v22 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v29, 8);
LABEL_11:

  return v22;
}

void __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_58(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDevices:(id)a7 withError:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v19 = __biome_log_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [NSNumber numberWithBool:v10];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_2201A2000, v19, OS_LOG_TYPE_INFO, "Received DSL with shouldWake %@ for devices %@", buf, 0x16u);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v15 useCase:v17 withError:a8])goto LABEL_10; {
  if (!v16)
  }
  {
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    +[BMDistributedContextUtilities updateDescriptionForError:a8 withErrorCode:5];
LABEL_10:
    BOOL v23 = 0;
    goto LABEL_11;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  connection = self->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke;
  v28[3] = &unk_26455C2B0;
  v28[5] = buf;
  v28[6] = a2;
  v28[4] = &v29;
  BOOL v22 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke_60;
  v27[3] = &unk_26455C2D8;
  v27[4] = &v29;
  v27[5] = buf;
  [v22 registerForUpdates:v15 withIdentifier:v16 forUseCase:v17 withOptions:v10 forDevices:v18 withErrorHandler:v27];

  if (!*((unsigned char *)v30 + 24) && *(void *)(*(void *)&buf[8] + 40))
  {
    v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    if (a8) {
      *a8 = *(id *)(*(void *)&buf[8] + 40);
    }
  }
  BOOL v23 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v29, 8);
LABEL_11:

  return v23;
}

void __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke_60(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 shouldWake:(BOOL)a5 forDeviceTypes:(int64_t)a6
{
  return [(ContextSyncClient *)self registerForUpdates:a3 withIdentifier:a4 forUseCase:*MEMORY[0x263F29E20] shouldWake:a5 forDeviceTypes:a6];
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDeviceTypes:(int64_t)a7
{
  BOOL v8 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [NSNumber numberWithBool:v8];
    id v18 = [NSNumber numberWithInteger:a7];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_2201A2000, v16, OS_LOG_TYPE_INFO, "Received DSL with shouldWake %@ for devices %@", buf, 0x16u);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v13 useCase:v15 withError:0])goto LABEL_9; {
  if (!v14)
  }
  {
    BOOL v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

LABEL_9:
    BOOL v21 = 0;
    goto LABEL_10;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v29 = 0;
  connection = self->_connection;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke;
  v27[3] = &unk_26455C300;
  v27[4] = buf;
  v27[5] = a2;
  v20 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v27];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61;
  v24[3] = &unk_26455C328;
  v26 = buf;
  id v25 = v14;
  [v20 registerForUpdates:v13 withIdentifier:v25 forUseCase:v15 withOptions:v8 forDeviceTypes:a7 withErrorHandler:v24];

  BOOL v21 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_10:

  return v21;
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61_cold_1();
    }
  }
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDeviceTypes:(int64_t)a7 withError:(id *)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [NSNumber numberWithUnsignedInteger:a6];
    v19 = [NSNumber numberWithInteger:a7];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_2201A2000, v17, OS_LOG_TYPE_INFO, "Received DSL with options %@ for device types %@", buf, 0x16u);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v14 useCase:v16 withError:a8])goto LABEL_10; {
  if (!v15)
  }
  {
    BOOL v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    +[BMDistributedContextUtilities updateDescriptionForError:a8 withErrorCode:5];
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_11;
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  connection = self->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke;
  v28[3] = &unk_26455C2B0;
  v28[5] = buf;
  v28[6] = a2;
  v28[4] = &v29;
  BOOL v21 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke_62;
  v27[3] = &unk_26455C2D8;
  v27[4] = &v29;
  v27[5] = buf;
  [v21 registerForUpdates:v14 withIdentifier:v15 forUseCase:v16 withOptions:a6 forDeviceTypes:a7 withErrorHandler:v27];

  if (!*((unsigned char *)v30 + 24) && *(void *)(*(void *)&buf[8] + 40))
  {
    id v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    if (a8) {
      *a8 = *(id *)(*(void *)&buf[8] + 40);
    }
  }
  BOOL v22 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v29, 8);
LABEL_11:

  return v22;
}

void __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke_62(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDevices:(id)a7 withError:(id *)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v19 = __biome_log_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [NSNumber numberWithUnsignedInteger:a6];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_2201A2000, v19, OS_LOG_TYPE_INFO, "Received DSL with options %@ for devices %@", buf, 0x16u);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v15 useCase:v17 withError:a8])goto LABEL_10; {
  if (!v16)
  }
  {
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    +[BMDistributedContextUtilities updateDescriptionForError:a8 withErrorCode:5];
LABEL_10:
    BOOL v23 = 0;
    goto LABEL_11;
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  connection = self->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke;
  v28[3] = &unk_26455C2B0;
  v28[5] = buf;
  v28[6] = a2;
  v28[4] = &v29;
  BOOL v22 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke_63;
  v27[3] = &unk_26455C2D8;
  v27[4] = &v29;
  v27[5] = buf;
  [v22 registerForUpdates:v15 withIdentifier:v16 forUseCase:v17 withOptions:a6 forDevices:v18 withErrorHandler:v27];

  if (!*((unsigned char *)v30 + 24) && *(void *)(*(void *)&buf[8] + 40))
  {
    v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    if (a8) {
      *a8 = *(id *)(*(void *)&buf[8] + 40);
    }
  }
  BOOL v23 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v29, 8);
LABEL_11:

  return v23;
}

void __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke_63(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5 withError:(id *)a6
{
  return [(ContextSyncClient *)self unregisterForUpdates:a3 withIdentifier:a4 forUseCase:*MEMORY[0x263F29E20] forDeviceTypes:a5 withError:a6];
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [NSNumber numberWithInteger:a6];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_2201A2000, v16, OS_LOG_TYPE_INFO, "Client unregistered DSL for devices types %@", (uint8_t *)&buf, 0xCu);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v13 useCase:v15 withError:a7])goto LABEL_10; {
  if (!v14)
  }
  {
    BOOL v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    +[BMDistributedContextUtilities updateDescriptionForError:a7 withErrorCode:5];
LABEL_10:
    BOOL v20 = 0;
    goto LABEL_11;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  char v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  connection = self->_connection;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke;
  v25[3] = &unk_26455C2B0;
  v25[5] = &buf;
  v25[6] = a2;
  v25[4] = &v26;
  v19 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke_64;
  v24[3] = &unk_26455C2D8;
  void v24[4] = &v26;
  v24[5] = &buf;
  [v19 unregisterForUpdates:v13 withIdentifier:v14 forUseCase:v15 forDeviceTypes:a6 withErrorHandler:v24];

  if (!*((unsigned char *)v27 + 24) && *(void *)(*((void *)&buf + 1) + 40))
  {
    BOOL v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*((void *)&buf + 1) + 40) localizedDescription];
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    if (a7) {
      *a7 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }
  BOOL v20 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v26, 8);
LABEL_11:

  return v20;
}

void __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke_64(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDevices:(id)a6 withError:(id *)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_2201A2000, v17, OS_LOG_TYPE_INFO, "Client unregistered DSL for devices types %@", (uint8_t *)&buf, 0xCu);
  }

  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v13 useCase:v15 withError:a7])goto LABEL_10; {
  if (!v14)
  }
  {
    BOOL v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    +[BMDistributedContextUtilities updateDescriptionForError:a7 withErrorCode:5];
LABEL_10:
    BOOL v20 = 0;
    goto LABEL_11;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  char v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  connection = self->_connection;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke;
  v25[3] = &unk_26455C2B0;
  v25[5] = &buf;
  v25[6] = a2;
  v25[4] = &v26;
  v19 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke_65;
  v24[3] = &unk_26455C2D8;
  void v24[4] = &v26;
  v24[5] = &buf;
  [v19 unregisterForUpdates:v13 withIdentifier:v14 forUseCase:v15 forDevices:v16 withErrorHandler:v24];

  if (!*((unsigned char *)v27 + 24) && *(void *)(*((void *)&buf + 1) + 40))
  {
    BOOL v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*((void *)&buf + 1) + 40) localizedDescription];
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

    if (a7) {
      *a7 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }
  BOOL v20 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v26, 8);
LABEL_11:

  return v20;
}

void __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke_65(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5
{
  return [(ContextSyncClient *)self unregisterForUpdates:a3 withIdentifier:a4 forUseCase:*MEMORY[0x263F29E20] forDeviceTypes:a5];
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [NSNumber numberWithInteger:a6];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_2201A2000, v14, OS_LOG_TYPE_INFO, "Client unregistered DSL for devices types %@", (uint8_t *)&buf, 0xCu);
  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:v11 useCase:v13 withError:0])goto LABEL_9; {
  if (!v12)
  }
  {
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:]();
    }

LABEL_9:
    BOOL v18 = 0;
    goto LABEL_10;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  connection = self->_connection;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke;
  v24[3] = &unk_26455C300;
  void v24[4] = &buf;
  v24[5] = a2;
  id v17 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v24];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66;
  v21[3] = &unk_26455C328;
  p_long long buf = &buf;
  id v22 = v12;
  [v17 unregisterForUpdates:v11 withIdentifier:v22 forUseCase:v13 forDeviceTypes:a6 withErrorHandler:v21];

  BOOL v18 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v18;
}

void __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66_cold_1();
    }
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

- (void)registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2201A2000, v0, v1, "Context Sync registration error: No Identifier!", v2, v3, v4, v5, v6);
}

- (void)registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_3(&dword_2201A2000, v3, v4, "Error: %@", v5);
}

void __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = (const char *)OUTLINED_FUNCTION_6(v0);
  uint64_t v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_2201A2000, v3, v4, "%@ Error: %@", v5, v6, v7, v8, v9);
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v1 = NSStringFromSelector(*(SEL *)(v0 + 40));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_2201A2000, v2, v3, "%@ Error: %@", v4, v5, v6, v7, v8);
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_2201A2000, v0, v1, "Error registering %@ error %@");
}

void __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_2201A2000, v0, v1, "Error unregistering %@ error %@");
}

@end