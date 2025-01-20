@interface BLTRemoteGlobalSettingsSyncServer
+ (id)remoteGlobalSettingsSyncServerWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4;
+ (id)remoteGlobalSettingsSyncServerWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4 initialSyncCompletion:(id)a5;
- (BLTRemoteGlobalSettingsSyncServer)initWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4 initialSyncCompletion:(id)a5;
- (BLTRemoteGlobalSettingsSyncServerLocalEndpoint)localEndpoint;
- (BLTRemoteGlobalSettingsSyncServerRemoteEndpoint)remoteEndpoint;
- (void)checkAndThenSendGlobalSettings:(id)a3;
- (void)observer:(id)a3 updateGlobalSettings:(id)a4;
- (void)sendInitialChangsetWithCompletion:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setRemoteEndpoint:(id)a3;
- (void)updateLocalSettingsWithProvider:(id)a3;
@end

@implementation BLTRemoteGlobalSettingsSyncServer

- (BLTRemoteGlobalSettingsSyncServer)initWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4 initialSyncCompletion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLTRemoteGlobalSettingsSyncServer;
  v11 = [(BLTRemoteGlobalSettingsSyncServer *)&v17 init];
  v12 = v11;
  if (v11)
  {
    [(BLTRemoteGlobalSettingsSyncServer *)v11 setLocalEndpoint:v8];
    [(BLTRemoteGlobalSettingsSyncServer *)v12 setRemoteEndpoint:v9];
    [(BLTRemoteGlobalSettingsSyncServer *)v12 sendInitialChangsetWithCompletion:v10];
    v13 = blt_global_settings_sync_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(BLTRemoteGlobalSettingsSyncServer *)v12 localEndpoint];
      v15 = [(BLTRemoteGlobalSettingsSyncServer *)v12 remoteEndpoint];
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_222F4C000, v13, OS_LOG_TYPE_DEFAULT, "%@ initWithLocalEndpoint: %@ remoteEndpoint: %@", buf, 0x20u);
    }
  }

  return v12;
}

+ (id)remoteGlobalSettingsSyncServerWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4 initialSyncCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithLocalEndpoint:v10 remoteEndpoint:v9 initialSyncCompletion:v8];

  return v11;
}

+ (id)remoteGlobalSettingsSyncServerWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithLocalEndpoint:v7 remoteEndpoint:v6 initialSyncCompletion:0];

  return v8;
}

- (void)updateLocalSettingsWithProvider:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:v4];
  id v6 = [(BLTRemoteGlobalSettingsSyncServer *)self localEndpoint];
  id v7 = +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:v6];

  int v8 = [v5 isEqual:v7];
  id v9 = blt_global_settings_sync_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v12 = 138412802;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      objc_super v17 = v5;
      _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ updateLocalSettingsWithProvider: %@ remoteChangeSet: %@ NOT UPDATING", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      int v12 = 138412802;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      objc_super v17 = v5;
      _os_log_impl(&dword_222F4C000, v9, OS_LOG_TYPE_DEFAULT, "%@ updateLocalSettingsWithProvider: %@ remoteChangeSet: %@ UPDATING", (uint8_t *)&v12, 0x20u);
    }

    v11 = [(BLTRemoteGlobalSettingsSyncServer *)self localEndpoint];
    objc_msgSend(v11, "setEffectiveGlobalScheduledDeliverySetting:", objc_msgSend(v5, "globalScheduledDeliverySetting"));

    id v9 = [(BLTRemoteGlobalSettingsSyncServer *)self localEndpoint];
    -[NSObject setEffectiveGlobalSummarizationSetting:](v9, "setEffectiveGlobalSummarizationSetting:", [v5 globalSummarizationSetting]);
  }
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    BOOL v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ observer: %@ updateGlobalSettings: %@ UPDATING", (uint8_t *)&v9, 0x20u);
  }

  [(BLTRemoteGlobalSettingsSyncServer *)self checkAndThenSendGlobalSettings:v7];
}

- (void)sendInitialChangsetWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v11 = self;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ sendInitialChangsetWithCompletion", buf, 0xCu);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke;
  v8[3] = &unk_264684118;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (uint64_t *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) localEndpoint];
  id v4 = +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:v3];

  uint64_t v5 = [v4 globalScheduledDeliverySetting];
  id v6 = blt_global_settings_sync_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *v2;
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "%@ sendInitialChangsetWithCompletion: %@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = [*(id *)(a1 + 32) remoteEndpoint];
    [v9 remoteGlobalSettingsSyncServer:*(void *)(a1 + 32) sendChangeset:v4];

    [v4 sendSuccess];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke_cold_1(v2, (uint64_t)v4, v7);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)checkAndThenSendGlobalSettings:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:a3];
  char v5 = [v4 needsSend];
  id v6 = blt_global_settings_sync_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ checkAndThenSendGlobalSettings: %@ - sending", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v8 = [(BLTRemoteGlobalSettingsSyncServer *)self remoteEndpoint];
    [v8 remoteGlobalSettingsSyncServer:self sendChangeset:v4];

    [v4 sendSuccess];
  }
  else
  {
    if (v7)
    {
      int v9 = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ checkAndThenSendGlobalSettings: %@ - not sending", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BLTRemoteGlobalSettingsSyncServerRemoteEndpoint)remoteEndpoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteEndpoint);
  return (BLTRemoteGlobalSettingsSyncServerRemoteEndpoint *)WeakRetained;
}

- (void)setRemoteEndpoint:(id)a3
{
}

- (BLTRemoteGlobalSettingsSyncServerLocalEndpoint)localEndpoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localEndpoint);
  return (BLTRemoteGlobalSettingsSyncServerLocalEndpoint *)WeakRetained;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localEndpoint);
  objc_destroyWeak((id *)&self->_remoteEndpoint);
}

void __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "%@ not sending DEFAULT received from BB: %@", (uint8_t *)&v4, 0x16u);
}

@end