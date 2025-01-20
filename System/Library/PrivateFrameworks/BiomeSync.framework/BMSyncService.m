@interface BMSyncService
- (BOOL)triggerCloudKitSyncWithError:(id *)a3;
- (BOOL)triggerRapportSyncWithDeviceIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)triggerRapportSyncWithError:(id *)a3;
- (id)cascadeRapportSyncWithErrors:(id *)a3;
- (id)cloudKitSyncWithErrors:(id *)a3;
- (id)connection;
- (id)peerInformationWithError:(id *)a3;
- (id)rapportSyncWithErrors:(id *)a3;
- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4;
- (id)remoteDevicesWithError:(id *)a3;
- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4;
- (void)remoteDevicesWithReply:(id)a3;
- (void)triggerCloudKitSyncWithReply:(id)a3;
- (void)triggerRapportSyncWithReply:(id)a3;
@end

@implementation BMSyncService

- (id)connection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.biomesyncd.sync" options:0];
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAD0E90];
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:sel_remoteDevicesForAccount_reply_ argumentIndex:0 ofReply:1];

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v3 setClasses:v11 forSelector:sel_triggerRapportSyncWithReply_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v3 setClasses:v14 forSelector:sel_triggerRapportSyncDeviceIdentifiers_reply_ argumentIndex:0 ofReply:0];

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  [v3 setClasses:v18 forSelector:sel_triggerRapportSyncDeviceIdentifiers_reply_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  [v3 setClasses:v22 forSelector:sel_triggerCloudKitSyncWithReply_ argumentIndex:0 ofReply:1];

  v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  [v3 setClasses:v26 forSelector:sel_rapportSyncWithReply_ argumentIndex:1 ofReply:1];

  v27 = (void *)MEMORY[0x263EFFA08];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  [v3 setClasses:v30 forSelector:sel_cascadeRapportSyncWithReply_ argumentIndex:1 ofReply:1];

  v31 = (void *)MEMORY[0x263EFFA08];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  [v3 setClasses:v34 forSelector:sel_cloudKitSyncWithReply_ argumentIndex:1 ofReply:1];

  v35 = (void *)MEMORY[0x263EFFA08];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
  [v3 setClasses:v38 forSelector:sel_peerInformationWithReply_ argumentIndex:1 ofReply:1];

  [v2 setRemoteObjectInterface:v3];
  v39 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAD0930];
  [v2 setExportedInterface:v39];

  [v2 setExportedObject:self];
  objc_initWeak(&location, v2);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __27__BMSyncService_connection__block_invoke;
  v42[3] = &unk_2647DB768;
  objc_copyWeak(&v43, &location);
  [v2 setInvalidationHandler:v42];
  [v2 setInterruptionHandler:&__block_literal_global];
  [v2 resume];
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  return v2;
}

void __27__BMSyncService_connection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained _xpcConnection];
    v4 = (char *)xpc_connection_copy_invalidation_reason();

    uint64_t v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = "<unknown>";
      if (v4) {
        uint64_t v6 = v4;
      }
      int v7 = 136446210;
      v8 = v6;
      _os_log_impl(&dword_226C9F000, v5, OS_LOG_TYPE_INFO, "BMSyncService: connection invalidated with reason %{public}s", (uint8_t *)&v7, 0xCu);
    }

    free(v4);
  }
}

void __27__BMSyncService_connection__block_invoke_30()
{
  v0 = __biome_log_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_226C9F000, v0, OS_LOG_TYPE_INFO, "BMSyncService: connection interrupted", v1, 2u);
  }
}

- (void)remoteDevicesWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A666D90]();
  uint64_t v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__BMSyncService_remoteDevicesWithReply___block_invoke;
  v13[3] = &unk_2647DB7B0;
  id v7 = v4;
  id v14 = v7;
  objc_copyWeak(&v15, &location);
  v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__BMSyncService_remoteDevicesWithReply___block_invoke_2;
  v10[3] = &unk_2647DB7D8;
  id v9 = v7;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [v8 remoteDevicesForAccount:0 reply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __40__BMSyncService_remoteDevicesWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, MEMORY[0x263EFFA68], a2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __40__BMSyncService_remoteDevicesWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x22A666D90]();
  id v9 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke;
  v16[3] = &unk_2647DB7B0;
  id v10 = v7;
  id v17 = v10;
  objc_copyWeak(&v18, &location);
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke_2;
  v13[3] = &unk_2647DB7D8;
  id v12 = v10;
  id v14 = v12;
  objc_copyWeak(&v15, &location);
  [v11 remoteDevicesForAccount:v6 reply:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, MEMORY[0x263EFFA68], a2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (void)triggerRapportSyncWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A666D90]();
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__BMSyncService_triggerRapportSyncWithReply___block_invoke;
  v13[3] = &unk_2647DB7B0;
  id v7 = v4;
  id v14 = v7;
  objc_copyWeak(&v15, &location);
  v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__BMSyncService_triggerRapportSyncWithReply___block_invoke_2;
  v10[3] = &unk_2647DB7B0;
  id v9 = v7;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [v8 triggerRapportSyncWithReply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __45__BMSyncService_triggerRapportSyncWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __45__BMSyncService_triggerRapportSyncWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (void)triggerCloudKitSyncWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A666D90]();
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke;
  v13[3] = &unk_2647DB7B0;
  id v7 = v4;
  id v14 = v7;
  objc_copyWeak(&v15, &location);
  v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke_2;
  v10[3] = &unk_2647DB7B0;
  id v9 = v7;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [v8 triggerCloudKitSyncWithReply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (id)remoteDevicesWithError:(id *)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__BMSyncService_remoteDevicesWithError___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v16;
  objc_copyWeak(&v14, &location);
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__BMSyncService_remoteDevicesWithError___block_invoke_2;
  v11[3] = &unk_2647DB828;
  v11[4] = &v22;
  v11[5] = &v16;
  objc_copyWeak(&v12, &location);
  [v7 remoteDevicesForAccount:0 reply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  if (a3)
  {
    v8 = (void *)v17[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __40__BMSyncService_remoteDevicesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __40__BMSyncService_remoteDevicesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate];
}

- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v7 = (void *)MEMORY[0x22A666D90]();
  v8 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__BMSyncService_remoteDevicesForAccount_error___block_invoke;
  v15[3] = &unk_2647DB800;
  v15[4] = &v18;
  objc_copyWeak(&v16, &location);
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__BMSyncService_remoteDevicesForAccount_error___block_invoke_2;
  v13[3] = &unk_2647DB828;
  void v13[4] = &v24;
  void v13[5] = &v18;
  objc_copyWeak(&v14, &location);
  [v9 remoteDevicesForAccount:v6 reply:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  if (a4)
  {
    uint64_t v10 = (void *)v19[5];
    if (v10) {
      *a4 = v10;
    }
  }
  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __47__BMSyncService_remoteDevicesForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __47__BMSyncService_remoteDevicesForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate];
}

- (BOOL)triggerRapportSyncWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__BMSyncService_triggerRapportSyncWithError___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v16;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__BMSyncService_triggerRapportSyncWithError___block_invoke_2;
  v11[3] = &unk_2647DB800;
  v11[4] = &v16;
  objc_copyWeak(&v12, &location);
  [v7 triggerRapportSyncWithReply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  v8 = (void *)v17[5];
  if (a3 && v8)
  {
    *a3 = v8;
    v8 = (void *)v17[5];
  }
  BOOL v9 = v8 == 0;
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __45__BMSyncService_triggerRapportSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __45__BMSyncService_triggerRapportSyncWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (BOOL)triggerRapportSyncWithDeviceIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v7 = (void *)MEMORY[0x22A666D90]();
  v8 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke;
  v15[3] = &unk_2647DB800;
  v15[4] = &v18;
  objc_copyWeak(&v16, &location);
  BOOL v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke_2;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v18;
  objc_copyWeak(&v14, &location);
  [v9 triggerRapportSyncDeviceIdentifiers:v6 reply:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  uint64_t v10 = (void *)v19[5];
  if (a4 && v10)
  {
    *a4 = v10;
    uint64_t v10 = (void *)v19[5];
  }
  BOOL v11 = v10 == 0;
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (BOOL)triggerCloudKitSyncWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v16;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke_2;
  v11[3] = &unk_2647DB800;
  v11[4] = &v16;
  objc_copyWeak(&v12, &location);
  [v7 triggerCloudKitSyncWithReply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  v8 = (void *)v17[5];
  if (a3 && v8)
  {
    *a3 = v8;
    v8 = (void *)v17[5];
  }
  BOOL v9 = v8 == 0;
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (id)rapportSyncWithErrors:(id *)a3
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = (id)MEMORY[0x263EFFA68];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__BMSyncService_rapportSyncWithErrors___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v16;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__BMSyncService_rapportSyncWithErrors___block_invoke_2;
  v11[3] = &unk_2647DB850;
  v11[4] = &v22;
  void v11[5] = &v16;
  objc_copyWeak(&v12, &location);
  [v7 rapportSyncWithReply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  if (a3)
  {
    v8 = (void *)v17[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __39__BMSyncService_rapportSyncWithErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a2;
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v9 count:1];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", v9, v10);
}

void __39__BMSyncService_rapportSyncWithErrors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate];
}

- (id)cascadeRapportSyncWithErrors:(id *)a3
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = (id)MEMORY[0x263EFFA68];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v16;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke_2;
  v11[3] = &unk_2647DB850;
  v11[4] = &v22;
  void v11[5] = &v16;
  objc_copyWeak(&v12, &location);
  [v7 cascadeRapportSyncWithReply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  if (a3)
  {
    v8 = (void *)v17[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a2;
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v9 count:1];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", v9, v10);
}

void __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate];
}

- (id)cloudKitSyncWithErrors:(id *)a3
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = (id)MEMORY[0x263EFFA68];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__BMSyncService_cloudKitSyncWithErrors___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v16;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__BMSyncService_cloudKitSyncWithErrors___block_invoke_2;
  v11[3] = &unk_2647DB850;
  v11[4] = &v22;
  void v11[5] = &v16;
  objc_copyWeak(&v12, &location);
  [v7 cloudKitSyncWithReply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  if (a3)
  {
    v8 = (void *)v17[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __40__BMSyncService_cloudKitSyncWithErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a2;
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v9 count:1];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", v9, v10);
}

void __40__BMSyncService_cloudKitSyncWithErrors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate];
}

- (id)peerInformationWithError:(id *)a3
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v5 = (void *)MEMORY[0x22A666D90](self, a2);
  id v6 = [(BMSyncService *)self connection];
  objc_initWeak(&location, v6);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__BMSyncService_peerInformationWithError___block_invoke;
  v13[3] = &unk_2647DB800;
  void v13[4] = &v22;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__BMSyncService_peerInformationWithError___block_invoke_2;
  v11[3] = &unk_2647DB828;
  v11[4] = &v16;
  void v11[5] = &v22;
  objc_copyWeak(&v12, &location);
  [v7 peerInformationWithReply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  if (a3)
  {
    v8 = (void *)v23[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

void __42__BMSyncService_peerInformationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __42__BMSyncService_peerInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate];
}

@end