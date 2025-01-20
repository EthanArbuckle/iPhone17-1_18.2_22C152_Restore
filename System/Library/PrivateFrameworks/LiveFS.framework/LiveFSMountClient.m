@interface LiveFSMountClient
+ (id)newClient;
+ (id)newClientForProvider:(id)a3;
- (LiveFSMountClient)initWithProvider:(id)a3;
- (id)allMounts:(id *)a3;
- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8;
- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(unint64_t)a8 options:(id)a9;
- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 on:(id)a6 how:(int)a7;
- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9;
- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(unint64_t)a9 options:(id)a10;
- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(unint64_t)a9 options:(id)a10 auditToken:(id *)a11;
- (id)mountVolume:(id)a3 provider:(id)a4 on:(id)a5 how:(int)a6;
- (id)mounts:(id *)a3;
- (id)setVerboseLevel:(int)a3;
- (id)unmountVolume:(id)a3 how:(int)a4;
- (id)unmountVolumeByID:(unsigned int)a3 how:(int)a4;
- (id)updateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5;
- (int)verboseLevelOrError:(id *)a3;
- (void)dealloc;
- (void)unmountVolumeNamed:(id)a3 providerName:(id)a4 domainError:(id)a5 how:(int)a6 reply:(id)a7;
@end

@implementation LiveFSMountClient

- (LiveFSMountClient)initWithProvider:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LiveFSMountClient;
  v5 = [(LiveFSMountClient *)&v12 init];
  if (v5)
  {
    uint64_t v6 = connectionForServiceURL(@"machp://com.apple.filesystems.fskitd", 0);
    conn = v5->conn;
    v5->conn = (NSXPCConnection *)v6;

    if (!v5->conn)
    {
      v10 = 0;
      goto LABEL_8;
    }
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EE26F30];
    [(NSXPCConnection *)v5->conn setRemoteObjectInterface:v8];

    if (!v4
      || ([(LiveFSMountClient *)v5 fixupConnectionFor:v4],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v5,
          (v5 = (LiveFSMountClient *)v9) != 0))
    {
      [(NSXPCConnection *)v5->conn resume];
    }
  }
  v5 = v5;
  v10 = v5;
LABEL_8:

  return v10;
}

- (void)dealloc
{
  conn = self->conn;
  if (conn)
  {
    [(NSXPCConnection *)conn invalidate];
    id v4 = self->conn;
    self->conn = 0;
  }
  provider = self->provider;
  self->provider = 0;

  helper = self->helper;
  self->helper = 0;

  v7.receiver = self;
  v7.super_class = (Class)LiveFSMountClient;
  [(LiveFSMountClient *)&v7 dealloc];
}

+ (id)newClientForProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithProvider:v4];

  return v5;
}

+ (id)newClient
{
  id v2 = objc_alloc((Class)a1);

  return (id)[v2 initWithProvider:0];
}

- (id)mounts:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  conn = self->conn;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__LiveFSMountClient_mounts___block_invoke;
  v9[3] = &unk_264DC7548;
  v9[4] = &v10;
  v5 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__LiveFSMountClient_mounts___block_invoke_2;
  v8[3] = &unk_264DC7570;
  v8[4] = &v16;
  [v5 listMounts:0 reply:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

void __28__LiveFSMountClient_mounts___block_invoke(uint64_t a1, void *a2)
{
}

void __28__LiveFSMountClient_mounts___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)allMounts:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  conn = self->conn;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__LiveFSMountClient_allMounts___block_invoke;
  v9[3] = &unk_264DC7548;
  v9[4] = &v10;
  v5 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__LiveFSMountClient_allMounts___block_invoke_2;
  v8[3] = &unk_264DC7570;
  v8[4] = &v16;
  [v5 listMounts:1 reply:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

void __31__LiveFSMountClient_allMounts___block_invoke(uint64_t a1, void *a2)
{
}

void __31__LiveFSMountClient_allMounts___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(unint64_t)a8 options:(id)a9
{
  return [(LiveFSMountClient *)self mountVolume:a3 fileSystem:0 displayName:a4 provider:a5 domainError:a6 on:a7 how:a8 options:a9];
}

- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9
{
  return [(LiveFSMountClient *)self mountVolume:a3 fileSystem:a4 displayName:a5 provider:a6 domainError:a7 on:a8 how:a9 options:0];
}

- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(unint64_t)a9 options:(id)a10
{
  id v16 = a3;
  id v29 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  id v22 = v20;
  v23 = v22;
  if (!v22)
  {
    if ([@"com.apple.filesystems.UserFS.FileProvider" isEqualToString:v18])
    {
      v23 = [@"com.apple.filesystems.userfsd" stringByAppendingPathComponent:v16];
    }
    else
    {
      v23 = 0;
    }
  }
  conn = self->conn;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke;
  v31[3] = &unk_264DC7548;
  v31[4] = &v32;
  v25 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v31];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke_2;
  v30[3] = &unk_264DC7548;
  v30[4] = &v32;
  LODWORD(v28) = a9;
  [v25 mountVolume:v16 fileSystem:v29 displayName:v17 provider:v18 domainError:v19 on:v23 how:v28 options:v21 reply:v30];
  id v26 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v26;
}

void __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke(uint64_t a1, void *a2)
{
}

void __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(unint64_t)a9 options:(id)a10 auditToken:(id *)a11
{
  id v31 = a3;
  id v30 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  id v22 = v20;
  v23 = v22;
  if (!v22)
  {
    if ([@"com.apple.filesystems.UserFS.FileProvider" isEqualToString:v18])
    {
      v23 = [@"com.apple.filesystems.userfsd" stringByAppendingPathComponent:v31];
    }
    else
    {
      v23 = 0;
    }
  }
  conn = self->conn;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke;
  v34[3] = &unk_264DC7548;
  v34[4] = &v35;
  v25 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v34];
  long long v26 = *(_OWORD *)&a11->var0[4];
  v33[0] = *(_OWORD *)a11->var0;
  v33[1] = v26;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke_2;
  v32[3] = &unk_264DC7548;
  v32[4] = &v35;
  LODWORD(v29) = a9;
  [v25 mountVolume:v31 fileSystem:v30 displayName:v17 provider:v18 domainError:v19 on:v23 how:v29 options:v21 auditToken:v33 reply:v32];
  id v27 = (id)v36[5];

  _Block_object_dispose(&v35, 8);

  return v27;
}

void __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke(uint64_t a1, void *a2)
{
}

void __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8
{
  return [(LiveFSMountClient *)self mountVolume:a3 displayName:a4 provider:a5 domainError:a6 on:a7 how:a8 options:0];
}

- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 on:(id)a6 how:(int)a7
{
  return [(LiveFSMountClient *)self mountVolume:a3 displayName:a4 provider:a5 domainError:0 on:a6 how:*(void *)&a7];
}

- (id)mountVolume:(id)a3 provider:(id)a4 on:(id)a5 how:(int)a6
{
  return [(LiveFSMountClient *)self mountVolume:a3 displayName:a3 provider:a4 domainError:0 on:a5 how:*(void *)&a6];
}

- (id)unmountVolume:(id)a3 how:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  id v16 = 0;
  conn = self->conn;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__LiveFSMountClient_unmountVolume_how___block_invoke;
  v14[3] = &unk_264DC7548;
  v14[4] = &v17;
  v8 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__LiveFSMountClient_unmountVolume_how___block_invoke_78;
  v13[3] = &unk_264DC7598;
  v13[4] = &v17;
  v13[5] = v15;
  [v8 unmountVolume:v6 how:v4 reply:v13];
  uint64_t v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v18[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v10;
    _os_log_impl(&dword_23AB0B000, v9, OS_LOG_TYPE_INFO, "returning error %@", buf, 0xCu);
  }

  id v11 = (id)v18[5];
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_78_cold_1();
  }
}

- (id)unmountVolumeByID:(unsigned int)a3 how:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  id v15 = 0;
  conn = self->conn;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke;
  v13[3] = &unk_264DC7548;
  v13[4] = &v16;
  id v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke_80;
  v12[3] = &unk_264DC7598;
  v12[4] = &v16;
  v12[5] = v14;
  [v7 unmountVolumeByID:v5 how:v4 reply:v12];
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v17[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v9;
    _os_log_impl(&dword_23AB0B000, v8, OS_LOG_TYPE_INFO, "returning error %@", buf, 0xCu);
  }

  id v10 = (id)v17[5];
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_78_cold_1();
  }
}

- (void)unmountVolumeNamed:(id)a3 providerName:(id)a4 domainError:(id)a5 how:(int)a6 reply:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  conn = self->conn;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke;
  v22[3] = &unk_264DC75C0;
  id v14 = v12;
  id v23 = v14;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_81;
  v20[3] = &unk_264DC75E8;
  id v21 = v14;
  id v19 = v14;
  [v18 unmountVolume:v17 provider:v16 how:v7 domainError:v15 reply:v20];
}

void __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)verboseLevelOrError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  conn = self->conn;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__LiveFSMountClient_verboseLevelOrError___block_invoke;
  v10[3] = &unk_264DC7548;
  v10[4] = &v15;
  uint64_t v5 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__LiveFSMountClient_verboseLevelOrError___block_invoke_2;
  v9[3] = &unk_264DC7610;
  v9[4] = &v11;
  [v5 verboseLevel:v9];
  uint64_t v6 = (void *)v16[5];
  if (v6)
  {
    if (a3) {
      *a3 = v6;
    }
    int v7 = -1;
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    int v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __41__LiveFSMountClient_verboseLevelOrError___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __41__LiveFSMountClient_verboseLevelOrError___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)setVerboseLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  int v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  conn = self->conn;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__LiveFSMountClient_setVerboseLevel___block_invoke;
  v9[3] = &unk_264DC7548;
  v9[4] = &v10;
  uint64_t v5 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__LiveFSMountClient_setVerboseLevel___block_invoke_2;
  v8[3] = &unk_264DC7548;
  v8[4] = &v10;
  [v5 setVerboseLevel:v3 reply:v8];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __37__LiveFSMountClient_setVerboseLevel___block_invoke(uint64_t a1, void *a2)
{
}

void __37__LiveFSMountClient_setVerboseLevel___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)updateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  conn = self->conn;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke;
  v16[3] = &unk_264DC7548;
  v16[4] = &v17;
  uint64_t v12 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke_2;
  v15[3] = &unk_264DC7548;
  v15[4] = &v17;
  [v12 updateErrorStateForVolume:v8 provider:v9 domainError:v10 reply:v15];
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke(uint64_t a1, void *a2)
{
}

void __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->helper, 0);
  objc_storeStrong((id *)&self->provider, 0);

  objc_storeStrong((id *)&self->conn, 0);
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke_78_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_23AB0B000, v0, v1, "mounter returned error %@ for name %@");
}

void __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end