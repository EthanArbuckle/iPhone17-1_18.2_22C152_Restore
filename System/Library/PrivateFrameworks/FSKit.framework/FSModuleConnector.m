@interface FSModuleConnector
- (FSModuleExtension)ourModule;
- (NSXPCConnection)ourConnection;
- (void)activateVolume:(id)a3 resource:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)checkIn:(id)a3 replyHandler:(id)a4;
- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 replyHandler:(id)a7;
- (void)checkWithOptions:(id)a3 connection:(id)a4 taskID:(id)a5 replyHandler:(id)a6;
- (void)deactivateVolume:(id)a3 numericOptions:(unint64_t)a4 replyHandler:(id)a5;
- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 replyHandler:(id)a7;
- (void)formatWithOptions:(id)a3 connection:(id)a4 taskID:(id)a5 replyHandler:(id)a6;
- (void)getLegacyVolumeEndpoint:(id)a3 replyHandler:(id)a4;
- (void)getModuleListenerEndpoint:(id)a3;
- (void)getProgressPortForTask:(id)a3 replyHandler:(id)a4;
- (void)getVolumeEndpoint:(id)a3 replyHandler:(id)a4;
- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
- (void)ping:(id)a3;
- (void)probeResource:(id)a3 replyHandler:(id)a4;
- (void)sendCloseResource:(id)a3;
- (void)sendConfigureUserClient:(id)a3 replyHandler:(id)a4;
- (void)sendIsVolumeUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5;
- (void)sendRevokeResource:(id)a3;
- (void)sendTaskUpdate:(id)a3;
- (void)sendWipeResource:(id)a3 replyHandler:(id)a4;
- (void)setOurConnection:(id)a3;
- (void)setOurModule:(id)a3;
- (void)unloadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
@end

@implementation FSModuleConnector

- (void)sendTaskUpdate:(id)a3
{
  ourConnection = self->_ourConnection;
  if (ourConnection)
  {
    id v4 = a3;
    id v5 = [(NSXPCConnection *)ourConnection remoteObjectProxy];
    [v5 taskStatusUpdate:v4];
  }
}

- (void)sendRevokeResource:(id)a3
{
  id v4 = a3;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleConnector sendRevokeResource:](v4);
  }

  ourConnection = self->_ourConnection;
  if (ourConnection)
  {
    v7 = [(NSXPCConnection *)ourConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2];
    [v7 revokeResource:v4 replyHandler:&__block_literal_global_232];
    v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleConnector sendRevokeResource:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FSModuleConnector sendRevokeResource:](v7, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void __40__FSModuleConnector_sendRevokeResource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__FSModuleConnector_sendRevokeResource___block_invoke_cold_1();
  }
}

void __40__FSModuleConnector_sendRevokeResource___block_invoke_230(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __40__FSModuleConnector_sendRevokeResource___block_invoke_230_cold_1();
    }
  }
}

- (void)sendCloseResource:(id)a3
{
  id v4 = a3;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleConnector sendCloseResource:](v4);
  }

  ourConnection = self->_ourConnection;
  if (ourConnection)
  {
    v7 = [(NSXPCConnection *)ourConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_234];
    [v7 closeResource:v4 replyHandler:&__block_literal_global_237];
    v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleConnector sendCloseResource:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FSModuleConnector sendCloseResource:](v7, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void __39__FSModuleConnector_sendCloseResource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __39__FSModuleConnector_sendCloseResource___block_invoke_cold_1();
  }
}

void __39__FSModuleConnector_sendCloseResource___block_invoke_235(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __39__FSModuleConnector_sendCloseResource___block_invoke_235_cold_1();
    }
  }
}

- (void)sendIsVolumeUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleConnector sendIsVolumeUsed:bundle:replyHandler:]();
  }

  uint64_t v12 = self->_ourConnection;
  if (v12)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke;
    v23[3] = &unk_26530B198;
    id v13 = v10;
    id v24 = v13;
    uint64_t v14 = [(NSXPCConnection *)v12 synchronousRemoteObjectProxyWithErrorHandler:v23];
    [v14 isVolumeIDUsed:v8 bundle:v9 replyHandler:v13];
    uint64_t v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleConnector sendIsVolumeUsed:bundle:replyHandler:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendWipeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleConnector sendWipeResource:replyHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = self->_ourConnection;
  uint64_t v17 = self->_ourModule;
  if (v16)
  {
    if ([(FSModuleExtension *)self->_ourModule delegateConformantFS])
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke;
      v31[3] = &unk_26530B198;
      id v18 = v7;
      id v32 = v18;
      uint64_t v19 = [(NSXPCConnection *)v16 remoteObjectProxyWithErrorHandler:v31];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_238;
      v28[3] = &unk_26530B208;
      v29 = v17;
      id v30 = v18;
      [v19 wipeResource:v6 replyHandler:v28];
      uint64_t v20 = fskit_std_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[FSModuleConnector sendWipeResource:replyHandler:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      uint64_t v19 = fs_errorForPOSIXError(8);
      (*((void (**)(id, void *))v7 + 2))(v7, v19);
    }
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_238(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_238_cold_2(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_238_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendConfigureUserClient:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleConnector sendConfigureUserClient:replyHandler:]();
  }

  uint64_t v9 = self->_ourConnection;
  if (v9)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke;
    v20[3] = &unk_26530B198;
    id v10 = v7;
    id v21 = v10;
    uint64_t v11 = [(NSXPCConnection *)v9 synchronousRemoteObjectProxyWithErrorHandler:v20];
    [v11 configureUserClient:v6 replyHandler:v10];
    uint64_t v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleConnector sendConfigureUserClient:replyHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ping:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleConnector ping:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if ([(FSModuleExtension *)self->_ourModule delegateConformantFS])
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = fs_errorForPOSIXError(8);
  }
  v4[2](v4, v13);
}

- (void)checkIn:(id)a3 replyHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_24DDB2000, v8, OS_LOG_TYPE_DEFAULT, "FSModuleExtension.checkIn:extensionID:%@", buf, 0xCu);
  }

  uint64_t v9 = self->_ourModule;
  objc_sync_enter(v9);
  uint64_t v10 = [(FSModuleExtension *)self->_ourModule instanceID];

  ourModule = self->_ourModule;
  if (!v10)
  {
    [(FSModuleExtension *)ourModule setInstanceID:v6];
    goto LABEL_9;
  }
  uint64_t v12 = [(FSModuleExtension *)ourModule instanceID];
  char v13 = [v12 isEqual:v6];

  if (v13)
  {
LABEL_9:
    uint64_t v16 = 0;
    goto LABEL_10;
  }
  uint64_t v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = [(FSModuleExtension *)self->_ourModule instanceID];
    [(FSModuleConnector *)(uint64_t)v6 checkIn:(uint64_t)buf replyHandler:v14];
  }

  uint64_t v16 = fs_errorForPOSIXError(17);
LABEL_10:
  objc_sync_exit(v9);

  uint64_t v17 = fskit_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = v16;
    _os_log_impl(&dword_24DDB2000, v17, OS_LOG_TYPE_DEFAULT, "FSModuleExtension.checkIn returning %@", (uint8_t *)&v18, 0xCu);
  }

  v7[2](v7, v16);
}

- (void)getLegacyVolumeEndpoint:(id)a3 replyHandler:(id)a4
{
  id v4 = (void (**)(id, void, id))a4;
  fs_errorForPOSIXError(45);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v5);
}

- (void)getVolumeEndpoint:(id)a3 replyHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[FSModuleConnector getVolumeEndpoint:replyHandler:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_24DDB2000, v8, OS_LOG_TYPE_DEFAULT, "%s:start:volID:%@", (uint8_t *)&v16, 0x16u);
  }

  if (v6)
  {
    uint64_t v9 = [(FSModuleExtension *)self->_ourModule volumes];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];

    if (v10)
    {
      uint64_t v11 = [v10 listener];
      uint64_t v12 = [v11 endpoint];

      char v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v10 listener];
        int v16 = 136315906;
        uint64_t v17 = "-[FSModuleConnector getVolumeEndpoint:replyHandler:]";
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = v14;
        __int16 v22 = 2112;
        uint64_t v23 = v12;
        _os_log_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_DEFAULT, "%s:end:found:volID:%@ listener %@ returning ep %@", (uint8_t *)&v16, 0x2Au);
      }
      v7[2](v7, v12, 0);
    }
    else
    {
      uint64_t v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        uint64_t v17 = "-[FSModuleConnector getVolumeEndpoint:replyHandler:]";
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEFAULT, "%s:end:ENOENT:volID:%@", (uint8_t *)&v16, 0x16u);
      }

      uint64_t v12 = fs_errorForPOSIXError(2);
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);
    }
  }
  else
  {
    uint64_t v10 = fs_errorForPOSIXError(5);
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);
  }
}

- (void)probeResource:(id)a3 replyHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(FSModuleExtension *)self->_ourModule supportsBlockOps])
  {
    if ([v6 kind] == 1)
    {
      uint64_t v8 = +[FSResource dynamicCast:v6];
      if (v8)
      {
        uint64_t v9 = fskit_std_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v19 = [v8 fileDescriptor];
          _os_log_impl(&dword_24DDB2000, v9, OS_LOG_TYPE_DEFAULT, "Successful dynamic cast of resource to bd. Got fd %d", buf, 8u);
        }

        [v8 readFirstSectorAndLog];
      }
    }
    uint64_t v10 = [(_EXExtension *)self->_ourModule delegate];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__FSModuleConnector_probeResource_replyHandler___block_invoke;
    aBlock[3] = &unk_26530B230;
    aBlock[4] = self;
    id v11 = v6;
    id v16 = v11;
    id v17 = v7;
    uint64_t v12 = _Block_copy(aBlock);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      char v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[FSModuleConnector probeResource:replyHandler:]();
      }
    }
    [v10 probeResource:v11 replyHandler:v12];
  }
  else
  {
    uint64_t v14 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void __48__FSModuleConnector_probeResource_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_24DDB2000, v7, OS_LOG_TYPE_DEFAULT, "Returning %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) sendCloseResource:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 replyHandler:(id)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v30 = a4;
  id v33 = a5;
  id v34 = a6;
  id v32 = a7;
  uint64_t v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[FSModuleConnector checkResource:options:connection:taskID:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  if ([(FSModuleExtension *)self->_ourModule supportsSimpleMaintenanceOps])
  {
    v29 = [(_EXExtension *)self->_ourModule delegate];
    char v13 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
    uint64_t v14 = self->_ourModule;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke;
    v48[3] = &unk_26530B258;
    v48[4] = self;
    id v15 = v31;
    id v49 = v15;
    [v33 setEarlyCompletedBlock:v48];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_2;
    v46[3] = &unk_26530B198;
    id v16 = v32;
    id v47 = v16;
    [v33 connect:v46];
    id v17 = FSTaskPurposeCheck;
    __int16 v18 = [(FSModuleExtension *)v14 bundleID];
    int v19 = [(FSModuleExtension *)v14 instanceID];
    uint64_t v20 = +[FSTaskDescription taskDescriptionWithID:v34 state:1 purpose:v17 error:0 bundleID:v18 extensionID:v19 resource:v15];

    id v21 = +[FSModuleTask taskWithID:v34 description:v20 progress:v13];
    __int16 v22 = [(FSModuleExtension *)self->_ourModule taskSet];
    objc_sync_enter(v22);
    uint64_t v23 = [(FSModuleExtension *)v14 taskSet];
    [v23 setObject:v21 forKey:v34];

    objc_sync_exit(v22);
    uint64_t v24 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_245;
    block[3] = &unk_26530B2A8;
    id v36 = v20;
    id v45 = v16;
    id v37 = v29;
    id v38 = v15;
    id v39 = v30;
    id v40 = v33;
    id v41 = v34;
    id v42 = v13;
    v43 = v14;
    v44 = self;
    uint64_t v25 = v14;
    id v26 = v13;
    id v27 = v29;
    id v28 = v20;
    dispatch_async(v24, block);
  }
  else
  {
    fs_errorForPOSIXError(45);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v32 + 2))(v32, v27);
  }
}

uint64_t __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRevokeResource:*(void *)(a1 + 40)];
}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "check: encountered connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_245(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_246;
  aBlock[3] = &unk_26530B280;
  id v12 = *(id *)(a1 + 104);
  char v13 = &v19;
  uint64_t v14 = &v15;
  id v3 = _Block_copy(aBlock);
  [*(id *)(a1 + 40) checkResource:*(void *)(a1 + 48) options:*(void *)(a1 + 56) connection:*(void *)(a1 + 64) taskID:*(void *)(a1 + 72) progress:*(void *)(a1 + 80) replyHandler:v3];
  uint64_t v4 = [*(id *)(a1 + 80) totalUnitCount];
  if (v4 > [*(id *)(a1 + 80) completedUnitCount]) {
    objc_msgSend(*(id *)(a1 + 80), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 80), "totalUnitCount"));
  }
  [*(id *)(a1 + 64) completed:0 replyHandler:&__block_literal_global_250];
  if (*((unsigned char *)v16 + 24))
  {
    if (!v20[5])
    {
      uint64_t v5 = [v2 updatedDescriptionInState:3 error:0];

      [*(id *)(a1 + 96) sendTaskUpdate:v5];
      id v2 = (id)v5;
    }
  }
  else
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      [*(id *)(a1 + 88) bundleID];
      objc_claimAutoreleasedReturnValue();
      __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_245_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 104);
    int v8 = fs_errorForPOSIXError(43);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  id v9 = [*(id *)(a1 + 88) taskSet];
  objc_sync_enter(v9);
  uint64_t v10 = [*(id *)(a1 + 88) taskSet];
  [v10 removeObjectForKey:*(void *)(a1 + 72)];

  objc_sync_exit(v9);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_246(void *a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

- (void)checkWithOptions:(id)a3 connection:(id)a4 taskID:(id)a5 replyHandler:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  char v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FSModuleConnector checkWithOptions:connection:taskID:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_DEFAULT, "%s:start", (uint8_t *)&buf, 0xCu);
  }

  if ([(FSModuleExtension *)self->_ourModule supportsSimpleMaintenanceOps])
  {
    uint64_t v14 = [(_EXExtension *)self->_ourModule delegate];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy_;
    v62 = __Block_byref_object_dispose_;
    id v63 = 0;
    uint64_t v15 = self->_ourModule;
    dispatch_group_t v16 = dispatch_group_create();
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke;
    v57[3] = &unk_26530B258;
    v57[4] = self;
    id v37 = v15;
    v58 = v37;
    [v10 setEarlyCompletedBlock:v57];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_2;
    v55[3] = &unk_26530B2D0;
    id v36 = v16;
    v56 = v36;
    [v10 setLateCompletedBlock:v55];
    if (objc_opt_respondsToSelector())
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_253;
      v53[3] = &unk_26530B258;
      v53[4] = self;
      uint64_t v17 = v37;
      v54 = v17;
      [v10 setEarlyCompletedBlock:v53];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_2_254;
      v51[3] = &unk_26530B198;
      id v35 = v12;
      id v52 = v35;
      [v10 connect:v51];
      char v18 = FSTaskPurposeCheck;
      uint64_t v19 = [(FSModuleExtension *)v17 bundleID];
      uint64_t v20 = [(FSModuleExtension *)v17 instanceID];
      uint64_t v21 = +[FSTaskDescription taskDescriptionWithID:v11 state:1 purpose:v18 error:0 bundleID:v19 extensionID:v20 resource:0];

      __int16 v22 = [[FSTask alloc] initWithMessageConnection:v10 taskID:v11];
      uint64_t v23 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_256;
      block[3] = &unk_26530B2F8;
      id v24 = v21;
      id v40 = v24;
      id v41 = v36;
      p_long long buf = &buf;
      id v42 = v14;
      uint64_t v25 = v22;
      v43 = v25;
      id v44 = v38;
      id v45 = v11;
      v46 = v17;
      id v49 = v35;
      id v47 = v10;
      v48 = self;
      dispatch_async(v23, block);
    }
    else
    {
      id v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[FSModuleConnector checkWithOptions:connection:taskID:replyHandler:](v26, v27, v28, v29, v30, v31, v32, v33);
      }

      id v34 = [(FSModuleExtension *)v37 resource];
      [(FSModuleConnector *)self checkResource:v34 options:v38 connection:v10 taskID:v11 replyHandler:v12];

      id v24 = 0;
      uint64_t v25 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v14 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
  }
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) resource];
  [v1 sendRevokeResource:v2];
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_2(uint64_t a1)
{
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_253(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) resource];
  [v1 sendRevokeResource:v2];
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_2_254(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "checkWithOptions: encountered connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __69__FSModuleConnector_checkWithOptions_connection_taskID_replyHandler___block_invoke_256(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 64) parameters];
  id v18 = 0;
  uint64_t v6 = [v3 startCheckWithTask:v4 parameters:v5 error:&v18];
  id v7 = v18;
  uint64_t v8 = *(void *)(*(void *)(a1 + 112) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (v7)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    id v10 = 0;
  }
  else
  {
    id v10 = +[FSModuleTask taskWithID:*(void *)(a1 + 72) description:*(void *)(a1 + 32) progress:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
    id v11 = [*(id *)(a1 + 80) taskSet];
    objc_sync_enter(v11);
    id v12 = [*(id *)(a1 + 80) taskSet];
    [v12 setObject:v10 forKey:*(void *)(a1 + 72)];

    objc_sync_exit(v11);
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  }
  char v13 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  if (v13)
  {
    uint64_t v14 = [v13 totalUnitCount];
    if (v14 > [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) completedUnitCount]) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), "totalUnitCount"));
    }
  }
  [*(id *)(a1 + 88) completed:0 replyHandler:&__block_literal_global_259];
  if (!v7)
  {
    uint64_t v15 = [v2 updatedDescriptionInState:3 error:0];

    [*(id *)(a1 + 96) sendTaskUpdate:v15];
    id v2 = (id)v15;
  }
  dispatch_group_t v16 = [*(id *)(a1 + 80) taskSet];
  objc_sync_enter(v16);
  uint64_t v17 = [*(id *)(a1 + 80) taskSet];
  [v17 removeObjectForKey:*(void *)(a1 + 72)];

  objc_sync_exit(v16);
}

- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = fskit_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_24DDB2000, v17, OS_LOG_TYPE_DEFAULT, "formatResource:options:connection:taskID:reply", buf, 2u);
  }

  if ([(FSModuleExtension *)self->_ourModule supportsSimpleMaintenanceOps])
  {
    id v37 = v13;
    id v34 = [(_EXExtension *)self->_ourModule delegate];
    id v18 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
    uint64_t v19 = self->_ourModule;
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke;
    v52[3] = &unk_26530B258;
    v52[4] = self;
    id v38 = v12;
    id v20 = v12;
    id v53 = v20;
    [v14 setEarlyCompletedBlock:v52];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2;
    v50[3] = &unk_26530B198;
    id v35 = v16;
    id v21 = v16;
    id v51 = v21;
    id v36 = v14;
    [v14 connect:v50];
    __int16 v22 = FSTaskPurposeFormat;
    uint64_t v23 = [(FSModuleExtension *)v19 bundleID];
    id v24 = [(FSModuleExtension *)v19 instanceID];
    uint64_t v25 = +[FSTaskDescription taskDescriptionWithID:v15 state:1 purpose:v22 error:0 bundleID:v23 extensionID:v24 resource:v20];

    id v26 = +[FSModuleTask taskWithID:v15 description:v25 progress:v18];
    uint64_t v27 = [(FSModuleExtension *)self->_ourModule taskSet];
    objc_sync_enter(v27);
    uint64_t v28 = [(FSModuleExtension *)v19 taskSet];
    [v28 setObject:v26 forKey:v15];

    objc_sync_exit(v27);
    uint64_t v29 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_260;
    block[3] = &unk_26530B2A8;
    id v40 = v25;
    id v49 = v21;
    id v41 = v34;
    id v42 = v20;
    id v43 = v37;
    id v44 = v36;
    id v45 = v15;
    id v46 = v18;
    id v47 = v19;
    v48 = self;
    uint64_t v30 = v19;
    id v31 = v18;
    id v32 = v34;
    id v33 = v25;
    dispatch_async(v29, block);

    id v13 = v37;
    id v14 = v36;

    id v12 = v38;
    id v16 = v35;
  }
  else
  {
    fs_errorForPOSIXError(45);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v16 + 2))(v16, v32);
  }
}

uint64_t __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRevokeResource:*(void *)(a1 + 40)];
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "formatResource: encountered on connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_260(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2_261;
  aBlock[3] = &unk_26530B280;
  id v12 = *(id *)(a1 + 104);
  id v13 = &v19;
  id v14 = &v15;
  id v3 = _Block_copy(aBlock);
  [*(id *)(a1 + 40) formatResource:*(void *)(a1 + 48) options:*(void *)(a1 + 56) connection:*(void *)(a1 + 64) taskID:*(void *)(a1 + 72) progress:*(void *)(a1 + 80) replyHandler:v3];
  uint64_t v4 = [*(id *)(a1 + 80) totalUnitCount];
  if (v4 > [*(id *)(a1 + 80) completedUnitCount]) {
    objc_msgSend(*(id *)(a1 + 80), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 80), "totalUnitCount"));
  }
  [*(id *)(a1 + 64) completed:0 replyHandler:&__block_literal_global_263];
  if (*((unsigned char *)v16 + 24))
  {
    if (!v20[5])
    {
      uint64_t v5 = [v2 updatedDescriptionInState:3 error:0];

      [*(id *)(a1 + 96) sendTaskUpdate:v5];
      id v2 = (id)v5;
    }
  }
  else
  {
    uint64_t v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      [*(id *)(a1 + 88) bundleID];
      objc_claimAutoreleasedReturnValue();
      __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_260_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 104);
    uint64_t v8 = fs_errorForPOSIXError(43);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  id v9 = [*(id *)(a1 + 88) taskSet];
  objc_sync_enter(v9);
  id v10 = [*(id *)(a1 + 88) taskSet];
  [v10 removeObjectForKey:*(void *)(a1 + 72)];

  objc_sync_exit(v9);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_2_261(void *a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

- (void)formatWithOptions:(id)a3 connection:(id)a4 taskID:(id)a5 replyHandler:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FSModuleConnector formatWithOptions:connection:taskID:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_DEFAULT, "%s:start", (uint8_t *)&buf, 0xCu);
  }

  if ([(FSModuleExtension *)self->_ourModule supportsSimpleMaintenanceOps])
  {
    id v14 = [(_EXExtension *)self->_ourModule delegate];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy_;
    v62 = __Block_byref_object_dispose_;
    id v63 = 0;
    uint64_t v15 = self->_ourModule;
    dispatch_group_t v16 = dispatch_group_create();
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke;
    v57[3] = &unk_26530B258;
    v57[4] = self;
    id v37 = v15;
    v58 = v37;
    [v10 setEarlyCompletedBlock:v57];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_2;
    v55[3] = &unk_26530B2D0;
    id v36 = v16;
    v56 = v36;
    [v10 setLateCompletedBlock:v55];
    if (objc_opt_respondsToSelector())
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_265;
      v53[3] = &unk_26530B258;
      v53[4] = self;
      uint64_t v17 = v37;
      v54 = v17;
      [v10 setEarlyCompletedBlock:v53];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_2_266;
      v51[3] = &unk_26530B198;
      id v35 = v12;
      id v52 = v35;
      [v10 connect:v51];
      char v18 = FSTaskPurposeFormat;
      uint64_t v19 = [(FSModuleExtension *)v17 bundleID];
      id v20 = [(FSModuleExtension *)v17 instanceID];
      uint64_t v21 = +[FSTaskDescription taskDescriptionWithID:v11 state:1 purpose:v18 error:0 bundleID:v19 extensionID:v20 resource:0];

      __int16 v22 = [[FSTask alloc] initWithMessageConnection:v10 taskID:v11];
      uint64_t v23 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_267;
      block[3] = &unk_26530B2F8;
      id v24 = v21;
      id v40 = v24;
      id v41 = v36;
      p_long long buf = &buf;
      id v42 = v14;
      uint64_t v25 = v22;
      id v43 = v25;
      id v44 = v38;
      id v45 = v11;
      id v46 = v17;
      id v49 = v35;
      id v47 = v10;
      v48 = self;
      dispatch_async(v23, block);
    }
    else
    {
      id v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[FSModuleConnector formatWithOptions:connection:taskID:replyHandler:](v26, v27, v28, v29, v30, v31, v32, v33);
      }

      id v34 = [(FSModuleExtension *)v37 resource];
      [(FSModuleConnector *)self formatResource:v34 options:v38 connection:v10 taskID:v11 replyHandler:v12];

      id v24 = 0;
      uint64_t v25 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v14 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
  }
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) resource];
  [v1 sendRevokeResource:v2];
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_2(uint64_t a1)
{
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_265(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) resource];
  [v1 sendRevokeResource:v2];
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_2_266(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "formatResource: encountered on connect error!", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __70__FSModuleConnector_formatWithOptions_connection_taskID_replyHandler___block_invoke_267(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 64) parameters];
  id v18 = 0;
  uint64_t v6 = [v3 startFormatWithTask:v4 parameters:v5 error:&v18];
  id v7 = v18;
  uint64_t v8 = *(void *)(*(void *)(a1 + 112) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    id v10 = 0;
  }
  else
  {
    id v10 = +[FSModuleTask taskWithID:*(void *)(a1 + 72) description:*(void *)(a1 + 32) progress:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
    id v11 = [*(id *)(a1 + 80) taskSet];
    objc_sync_enter(v11);
    id v12 = [*(id *)(a1 + 80) taskSet];
    [v12 setObject:v10 forKey:*(void *)(a1 + 72)];

    objc_sync_exit(v11);
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  }
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  if (v13)
  {
    uint64_t v14 = [v13 totalUnitCount];
    if (v14 > [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) completedUnitCount]) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), "totalUnitCount"));
    }
  }
  [*(id *)(a1 + 88) completed:0 replyHandler:&__block_literal_global_270];
  if (!v7)
  {
    uint64_t v15 = [v2 updatedDescriptionInState:3 error:0];

    [*(id *)(a1 + 96) sendTaskUpdate:v15];
    id v2 = (id)v15;
  }
  dispatch_group_t v16 = [*(id *)(a1 + 80) taskSet];
  objc_sync_enter(v16);
  uint64_t v17 = [*(id *)(a1 + 80) taskSet];
  [v17 removeObjectForKey:*(void *)(a1 + 72)];

  objc_sync_exit(v16);
}

- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v22 = "-[FSModuleConnector loadResource:options:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v11, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  if ([(FSModuleExtension *)self->_ourModule isNormalFS]
    || [(FSModuleExtension *)self->_ourModule isSimpleFS])
  {
    id v12 = self->_ourModule;
    id v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke;
    block[3] = &unk_26530B3C0;
    dispatch_group_t v16 = v12;
    id v17 = v8;
    id v18 = self;
    id v20 = v10;
    id v19 = v9;
    uint64_t v14 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    fs_errorForPOSIXError(45);
    uint64_t v14 = (FSModuleExtension *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, FSModuleExtension *))v10 + 2))(v10, 0, v14);
  }
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy_;
  id v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if (([*(id *)(a1 + 32) isNormalFS] & 1) != 0
    || [*(id *)(a1 + 32) isSimpleFS])
  {
    if ([*(id *)(a1 + 32) supportsBlockOps])
    {
      id v2 = [*(id *)(a1 + 32) fsMachPort];
      BOOL v3 = v2 == 0;

      if (!v3)
      {
        uint64_t v4 = *(void **)(a1 + 32);
        uint64_t v5 = [v4 fsMachPort];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2;
        v35[3] = &unk_26530B2D0;
        id v36 = *(id *)(a1 + 32);
        [v4 sendConfigureUserClient:v5 replyHandler:v35];
      }
    }
  }
  int v6 = [*(id *)(a1 + 32) isNormalFS];
  id v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    if (![v7 isSimpleFS]) {
      goto LABEL_16;
    }
    id v8 = [*(id *)(a1 + 32) delegate];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_279;
    v27[3] = &unk_26530B398;
    id v28 = *(id *)(a1 + 32);
    v30[1] = &v41;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    v29[0] = v15;
    v29[1] = v16;
    v30[0] = *(id *)(a1 + 64);
    v30[2] = &v37;
    id v11 = _Block_copy(v27);
    id v12 = &v28;
    id v13 = (id *)v29;
    uint64_t v14 = (id *)v30;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = *(void *)(a1 + 40);
      id v18 = [*(id *)(a1 + 56) parameters];
      [v8 loadResource:v17 options:v18 replyHandler:v11];

      goto LABEL_15;
    }
    uint64_t v21 = fs_errorForPOSIXError(45);
    __int16 v22 = (void *)v42[5];
    v42[5] = v21;

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_14:
    *((unsigned char *)v38 + 24) = 1;
    goto LABEL_15;
  }
  id v8 = [v7 delegate];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_271;
  aBlock[3] = &unk_26530B370;
  id v32 = *(id *)(a1 + 32);
  v34[1] = &v41;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v33[0] = v9;
  v33[1] = v10;
  v34[0] = *(id *)(a1 + 64);
  v34[2] = &v37;
  id v11 = _Block_copy(aBlock);
  id v12 = &v32;
  id v13 = (id *)v33;
  uint64_t v14 = (id *)v34;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v19 = fs_errorForPOSIXError(45);
    id v20 = (void *)v42[5];
    v42[5] = v19;

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  [v8 loadResource:*(void *)(a1 + 40) options:*(void *)(a1 + 56) replyHandler:v11];
LABEL_15:

LABEL_16:
  if (!*((unsigned char *)v38 + 24))
  {
    uint64_t v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      [*(id *)(a1 + 32) bundleID];
      objc_claimAutoreleasedReturnValue();
      __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_2();
    }

    uint64_t v24 = *(void *)(a1 + 64);
    uint64_t v25 = fs_errorForPOSIXError(43);
    (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v25);
  }
  if (!v42[5])
  {
    id v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 40) getResourceID];
      objc_claimAutoreleasedReturnValue();
      __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setResource:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) bundleID];
    if (v3)
    {
      int v6 = [v3 description];
    }
    else
    {
      int v6 = 0;
    }
    int v7 = 136315650;
    id v8 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke_2";
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "%s: configureUserClient for FSModule %{public}@ returned error (%@)", (uint8_t *)&v7, 0x20u);
    if (v3) {
  }
    }
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v7 = v5;
  id v8 = 0;
  if (a2 && !v5)
  {
    id v9 = a2;
    uint64_t v10 = objc_opt_new();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_272;
    v17[3] = &unk_26530B348;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 64);
    id v18 = v11;
    uint64_t v21 = v12;
    id v19 = *(id *)(a1 + 40);
    id v8 = v10;
    id v20 = v8;
    [v9 enumerateObjectsUsingBlock:v17];

    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_271_cold_1(a1);
    }
  }
  (*(void (**)(void, id, void *, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v8, v7, v6);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v7;
  id v16 = v7;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_272(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 volumeID];
  uint64_t v6 = [*(id *)(a1 + 32) bundleID];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_3;
  v21[3] = &unk_26530B320;
  uint64_t v7 = *(void *)(a1 + 56);
  v21[4] = &v22;
  v21[5] = v7;
  [v4 sendIsVolumeUsed:v5 bundle:v6 replyHandler:v21];

  if (*((unsigned char *)v23 + 24))
  {
    id v8 = objc_opt_new();
    id v9 = objc_msgSend(v8, "fs_volumeIdentifier");
    [v3 setVolumeID:v9];

    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v3 volumeID];
      id v19 = [*(id *)(a1 + 40) getResourceID];
      id v20 = [v3 volumeID];
      *(_DWORD *)long long buf = 136315906;
      uint64_t v27 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke_2";
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      uint64_t v33 = v20;
      _os_log_error_impl(&dword_24DDB2000, v10, OS_LOG_TYPE_ERROR, "%s: VolumeID (%@) of resource (%@) is being used, using new volumeID (%@) to avoid collision.", buf, 0x2Au);
    }
  }
  id v11 = +[FSModuleVolume volumeWithName:v3 resource:*(void *)(a1 + 40)];
  [v11 setOurExtension:*(void *)(a1 + 32)];
  uint64_t v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_272_cold_1();
  }

  uint64_t v13 = [*(id *)(a1 + 32) volumes];
  uint64_t v14 = [v3 volumeID];
  [v13 setObject:v11 forKey:v14];

  id v15 = [v3 volumeID];
  id v16 = [v3 name];
  uint64_t v17 = +[FSVolumeDescription volumeDescriptionWithID:name:state:](FSVolumeDescription, "volumeDescriptionWithID:name:state:", v15, v16, [v3 state]);

  [*(id *)(a1 + 48) addObject:v17];
  _Block_object_dispose(&v22, 8);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_3(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_279(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    char v40 = v5;
    __int16 v41 = 2112;
    uint64_t v42 = (uint64_t)v6;
    _os_log_impl(&dword_24DDB2000, v7, OS_LOG_TYPE_DEFAULT, "loadResource returned vol %@ and error %@", buf, 0x16u);
  }

  id v8 = 0;
  if (v5 && !v6)
  {
    id v9 = v5;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v9 volumeID];
    uint64_t v12 = [*(id *)(a1 + 32) bundleID];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    void v33[2] = __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_280;
    v33[3] = &unk_26530B320;
    uint64_t v13 = *(void *)(a1 + 64);
    v33[4] = &v34;
    v33[5] = v13;
    [v10 sendIsVolumeUsed:v11 bundle:v12 replyHandler:v33];

    if (*((unsigned char *)v35 + 24))
    {
      uint64_t v14 = objc_opt_new();
      [v9 setVolumeID:v14];

      id v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v9 volumeID];
        uint64_t v17 = [*(id *)(a1 + 40) getResourceID];
        id v18 = [v9 volumeID];
        *(_DWORD *)long long buf = 136315906;
        char v40 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke_2";
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v16;
        __int16 v43 = 2112;
        id v44 = v17;
        __int16 v45 = 2112;
        id v46 = v18;
        _os_log_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEFAULT, "%s: Received a volumeID (%@) of resource (%@) that is already being used by a different container, so we are modifying the volume ID to (%@) to avoid collision.", buf, 0x2Au);
      }
    }
    id v19 = +[FSModuleVolume volumeWithName:v9 resource:*(void *)(a1 + 40)];
    [v19 setOurExtension:*(void *)(a1 + 32)];
    id v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      char v40 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v19;
      _os_log_impl(&dword_24DDB2000, v20, OS_LOG_TYPE_DEFAULT, "%s: Adding volume %@ to module volumes", buf, 0x16u);
    }

    uint64_t v21 = [*(id *)(a1 + 32) volumes];
    uint64_t v22 = [v9 volumeID];
    [v21 setObject:v19 forKey:v22];

    uint64_t v23 = [v9 volumeID];
    uint64_t v24 = [v9 name];
    char v25 = +[FSVolumeDescription volumeDescriptionWithID:name:state:](FSVolumeDescription, "volumeDescriptionWithID:name:state:", v23, v24, [v9 state]);

    id v38 = v25;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    id v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [*(id *)(a1 + 48) ourModule];
      __int16 v28 = [v27 volumes];
      uint64_t v29 = [v28 count];
      *(_DWORD *)long long buf = 136315394;
      char v40 = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
      __int16 v41 = 2048;
      uint64_t v42 = v29;
      _os_log_impl(&dword_24DDB2000, v26, OS_LOG_TYPE_DEFAULT, "%s: module volume now has %lu volumes", buf, 0x16u);
    }
    _Block_object_dispose(&v34, 8);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v6;
  id v32 = v6;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_280(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)unloadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v22 = "-[FSModuleConnector unloadResource:options:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v11, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  if ([(FSModuleExtension *)self->_ourModule isNormalFS]
    || [(FSModuleExtension *)self->_ourModule isSimpleFS])
  {
    uint64_t v12 = self->_ourModule;
    uint64_t v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke;
    block[3] = &unk_26530B3C0;
    id v16 = v12;
    uint64_t v17 = self;
    id v18 = v8;
    id v20 = v10;
    id v19 = v9;
    uint64_t v14 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    fs_errorForPOSIXError(45);
    uint64_t v14 = (FSModuleExtension *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, FSModuleExtension *))v10 + 2))(v10, v14);
  }
}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  char v40 = __Block_byref_object_copy_;
  __int16 v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  char v25 = __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_2;
  id v26 = &unk_26530B3E8;
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 8);
  id v5 = *(void **)(v2 + 16);
  id v27 = v3;
  uint64_t v28 = v4;
  id v29 = v5;
  id v30 = *(id *)(v2 + 32);
  uint64_t v31 = &v37;
  id v32 = &v33;
  id v6 = (void (**)(void *, void))_Block_copy(&v23);
  uint64_t v7 = objc_msgSend(*(id *)v2, "delegate", v23, v24, v25, v26);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    v6[2](v6, 0);
    goto LABEL_8;
  }
  int v9 = [*(id *)(a1 + 32) isNormalFS];
  id v10 = *(void **)(a1 + 32);
  if (v9)
  {
    id v11 = [v10 delegate];
    [v11 unloadResource:*(void *)(a1 + 48) options:*(void *)(a1 + 56) replyHandler:v6];
  }
  else
  {
    if (![v10 isSimpleFS]) {
      goto LABEL_8;
    }
    id v11 = [*(id *)(a1 + 32) delegate];
    [v11 unloadResource:*(void *)(a1 + 48) options:*(void *)(a1 + 56) replyHandler:v6];
  }

LABEL_8:
  if (!*((unsigned char *)v34 + 24))
  {
    uint64_t v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      [*(id *)(a1 + 32) bundleID];
      objc_claimAutoreleasedReturnValue();
      __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_2();
    }

    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = fs_errorForPOSIXError(43);
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  if (!v38[5])
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    [*(id *)(a1 + 32) setResource:0];
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) volumes];
    [v4 removeAllObjects];

    [*(id *)(a1 + 40) sendRevokeResource:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
}

- (void)activateVolume:(id)a3 resource:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v35 = "-[FSModuleConnector activateVolume:resource:options:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  uint64_t v13 = self->_ourModule;
  uint64_t v14 = [(FSModuleExtension *)v13 volumes];
  id v15 = [v14 objectForKeyedSubscript:v9];

  if (v15 && ([v15 volume], uint64_t v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
  {
    uint64_t v17 = [v15 volume];
    uint64_t v18 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke;
    block[3] = &unk_26530B438;
    id v29 = v17;
    id v30 = v10;
    id v31 = v9;
    id v32 = v15;
    id v33 = v11;
    id v19 = v17;
    dispatch_async(v18, block);
  }
  else
  {
    uint64_t v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleConnector activateVolume:resource:options:replyHandler:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    fs_errorForPOSIXError(45);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v11 + 2))(v11, v19);
  }
}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) parameters];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2;
  v4[3] = &unk_26530B410;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 activateWithOptions:v3 replyHandler:v4];
}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_2();
    }

    [*(id *)(a1 + 40) updateRootItem:v5];
  }
  char v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deactivateVolume:(id)a3 numericOptions:(unint64_t)a4 replyHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v29 = "-[FSModuleConnector deactivateVolume:numericOptions:replyHandler:]";
    _os_log_impl(&dword_24DDB2000, v10, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  id v11 = self->_ourModule;
  uint64_t v12 = [(FSModuleExtension *)v11 volumes];
  uint64_t v13 = [v12 objectForKeyedSubscript:v8];

  if (v13 && ([v13 volume], uint64_t v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    id v15 = [v13 volume];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke;
    v24[3] = &unk_26530B460;
    id v25 = v8;
    id v26 = v13;
    id v27 = v9;
    [v15 deactivateWithOptions:a4 replyHandler:v24];
  }
  else
  {
    uint64_t v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleConnector deactivateVolume:numericOptions:replyHandler:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    id v15 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }
}

void __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke_cold_1(a1, v3);
    }
  }
  id v5 = (id)[*(id *)(a1 + 40) stopUsingVolume];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getProgressPortForTask:(id)a3 replyHandler:(id)a4
{
  id v20 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(FSModuleExtension *)self->_ourModule taskSet];
  objc_sync_enter(v7);
  id v8 = [(FSModuleExtension *)self->_ourModule taskSet];
  id v9 = [v8 objectForKey:v20];

  objc_sync_exit(v7);
  if (v9)
  {
    id v10 = v9;
    objc_sync_enter(v10);
    id v11 = [v10 connector];

    if (!v11)
    {
      uint64_t v12 = [v10 taskProgress];
      uint64_t v13 = [v10 taskDescription];
      id v14 = +[FSTaskProgressConnector newForProgress:v12 description:v13];
      [v10 setConnector:v14];
    }
    objc_sync_exit(v10);

    uint64_t v15 = [v10 connector];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      uint64_t v17 = [v10 connector];
      uint64_t v18 = [v17 endpoint];

      if (v18)
      {
        v6[2](v6, v18, 0);
        goto LABEL_10;
      }
    }
    int v19 = 12;
  }
  else
  {
    int v19 = 2;
  }
  uint64_t v18 = fs_errorForPOSIXError(v19);
  ((void (**)(id, void *, void *))v6)[2](v6, 0, v18);
LABEL_10:
}

- (void)getModuleListenerEndpoint:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void))a3;
  id v5 = [(FSModuleExtension *)self->_ourModule secondaryListener];
  id v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_24DDB2000, v6, OS_LOG_TYPE_DEFAULT, "getModuleListenerEndpoint got listener %@", (uint8_t *)&v8, 0xCu);
  }

  if (v5)
  {
    id v7 = [v5 endpoint];
    v4[2](v4, v7, 0);
  }
  else
  {
    id v7 = fs_errorForPOSIXError(12);
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v7);
  }
}

- (FSModuleExtension)ourModule
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOurModule:(id)a3
{
}

- (NSXPCConnection)ourConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOurConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConnection, 0);
  objc_storeStrong((id *)&self->_ourModule, 0);
}

- (void)sendRevokeResource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendRevokeResource:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendRevokeResource:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:start:resource(%@)", v4, v5, v6, v7, 2u);
}

void __40__FSModuleConnector_sendRevokeResource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: remote proxy object error %@", v2, v3, v4, v5, 2u);
}

void __40__FSModuleConnector_sendRevokeResource___block_invoke_230_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: revoked encountered an error (%@)", v2, v3, v4, v5, 2u);
}

- (void)sendCloseResource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendCloseResource:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendCloseResource:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:start:resource(%@)", v4, v5, v6, v7, 2u);
}

void __39__FSModuleConnector_sendCloseResource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: remote proxy object error %@", v2, v3, v4, v5, 2u);
}

void __39__FSModuleConnector_sendCloseResource___block_invoke_235_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: close encountered an error (%@)", v2, v3, v4, v5, 2u);
}

- (void)sendIsVolumeUsed:(uint64_t)a3 bundle:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendIsVolumeUsed:bundle:replyHandler:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s:start:volumeID(%@):bundleID(%@)", v2);
}

void __58__FSModuleConnector_sendIsVolumeUsed_bundle_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: remote proxy object error %@", v2, v3, v4, v5, 2u);
}

- (void)sendWipeResource:(uint64_t)a3 replyHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendWipeResource:(uint64_t)a3 replyHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: remote proxy object error %@", v2, v3, v4, v5, 2u);
}

void __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_238_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s: %{public}@ sendWipeResource done, no errors", v4, v5, v6, v7, 2u);
}

void __51__FSModuleConnector_sendWipeResource_replyHandler___block_invoke_238_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14(&dword_24DDB2000, v2, v3, "%s: %{public}@ sendWipeResource error (%@)!", v4, v5, v6, v7, 2u);
}

- (void)sendConfigureUserClient:(uint64_t)a3 replyHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendConfigureUserClient:replyHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:start:userClient(%@)", (uint8_t *)v2);
}

void __58__FSModuleConnector_sendConfigureUserClient_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: remote proxy object error %@", v2, v3, v4, v5, 2u);
}

- (void)ping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)checkIn:(uint64_t)a3 replyHandler:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4(&dword_24DDB2000, a4, a3, "Attempt to set instance UUID to %@ after already set to %@", (uint8_t *)a3);
}

- (void)probeResource:replyHandler:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_15(&dword_24DDB2000, v1, v2, "Delegate class %@ doesn't support probeResource:replyHandler:", v3, v4, v5, v6, 2u);
}

void __74__FSModuleConnector_checkResource_options_connection_taskID_replyHandler___block_invoke_245_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_7(&dword_24DDB2000, v3, v4, "FSModule %{public}@ check: did NOT call reply()", v5);
}

- (void)checkWithOptions:(uint64_t)a3 connection:(uint64_t)a4 taskID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__FSModuleConnector_formatResource_options_connection_taskID_replyHandler___block_invoke_260_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_7(&dword_24DDB2000, v3, v4, "FSModule %{public}@ formatResource: did NOT call reply()", v5);
}

- (void)formatWithOptions:(uint64_t)a3 connection:(uint64_t)a4 taskID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  *(_DWORD *)uint64_t v1 = 136315394;
  *(void *)(v1 + 4) = "-[FSModuleConnector loadResource:options:replyHandler:]_block_invoke";
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v2;
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v3, (uint64_t)v3, "%s: Setting up the module resource to (%@)", v4);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_7(&dword_24DDB2000, v3, v4, "FSModule %{public}@ loadResource: did NOT call reply()", v5);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_271_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) ourModule];
  uint64_t v2 = [v1 volumes];
  [v2 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v3, v4, "%s: module volume now has %lu volumes", v5, v6, v7, v8, 2u);
}

void __55__FSModuleConnector_loadResource_options_replyHandler___block_invoke_2_272_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s: Adding volume %@ to module volumes", (uint8_t *)v2);
}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__FSModuleConnector_unloadResource_options_replyHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_7(&dword_24DDB2000, v3, v4, "FSModule %{public}@ unloadResource: did NOT call reply()", v5);
}

- (void)activateVolume:(uint64_t)a3 resource:(uint64_t)a4 options:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s: activate volume (%@) reply(nil)", (uint8_t *)v2);
}

void __66__FSModuleConnector_activateVolume_resource_options_replyHandler___block_invoke_2_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s: activate volume (%@) found root item (%@)", v2);
}

- (void)deactivateVolume:(uint64_t)a3 numericOptions:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__FSModuleConnector_deactivateVolume_numericOptions_replyHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 description];
  OUTLINED_FUNCTION_14(&dword_24DDB2000, v2, v3, "%s: deactivate volume (%@) error %@", v4, v5, v6, v7, 2u);
}

@end