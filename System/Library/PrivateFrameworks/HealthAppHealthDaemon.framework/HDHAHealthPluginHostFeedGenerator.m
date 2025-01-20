@interface HDHAHealthPluginHostFeedGenerator
- (HDHAHealthPluginHostFeedGenerator)init;
- (id)healthAppPluginHost;
- (id)synchronousHealthAppPluginHost;
- (void)handleJournaledSharingEntries:(id)a3;
- (void)invalidateStoreCache;
- (void)runBackgroundGenerationForAllPlugins;
- (void)runBackgroundGenerationForPluginIdentifiers:(id)a3 commitUrgentTransaction:(BOOL)a4 feedItemsOnly:(BOOL)a5;
@end

@implementation HDHAHealthPluginHostFeedGenerator

- (HDHAHealthPluginHostFeedGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDHAHealthPluginHostFeedGenerator;
  v2 = [(HDHAHealthPluginHostFeedGenerator *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(HDHAHealthAppPluginHostConnection);
    pluginHostConnection = v2->_pluginHostConnection;
    v2->_pluginHostConnection = v3;

    v5 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
    orchestrationConnection = v2->_orchestrationConnection;
    v2->_orchestrationConnection = v5;
  }
  return v2;
}

- (void)runBackgroundGenerationForPluginIdentifiers:(id)a3 commitUrgentTransaction:(BOOL)a4 feedItemsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  orchestrationConnection = self->_orchestrationConnection;
  if (v5) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 2;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __119__HDHAHealthPluginHostFeedGenerator_runBackgroundGenerationForPluginIdentifiers_commitUrgentTransaction_feedItemsOnly___block_invoke;
  v12[3] = &unk_265358968;
  id v13 = v8;
  id v11 = v8;
  [(HealthAppHealthDaemonOrchestrationClient *)orchestrationConnection runBackgroundGenerationWithPlugins:v11 commitAsUrgent:v6 generationType:v10 completion:v12];
}

void __119__HDHAHealthPluginHostFeedGenerator_runBackgroundGenerationForPluginIdentifiers_commitUrgentTransaction_feedItemsOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v3 == 0;
    __int16 v7 = 2112;
    uint64_t v8 = v5;
    _os_log_impl(&dword_250D3F000, v4, OS_LOG_TYPE_DEFAULT, "Running background generation success %d for pluginIdentifiers %@", (uint8_t *)v6, 0x12u);
  }
}

- (void)runBackgroundGenerationForAllPlugins
{
}

void __73__HDHAHealthPluginHostFeedGenerator_runBackgroundGenerationForAllPlugins__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2 == 0;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "Running background generation success %d for all plugins", (uint8_t *)v4, 8u);
  }
}

- (void)handleJournaledSharingEntries:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDHAHealthPluginHostFeedGenerator *)self healthAppPluginHost];
  _HKInitializeLogging();
  BOOL v6 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_log_impl(&dword_250D3F000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to handle journaled sharing entries", v7, 2u);
  }
  [v5 handleJournaledSharingEntries:v4 completion:&__block_literal_global_284];
}

void __67__HDHAHealthPluginHostFeedGenerator_handleJournaledSharingEntries___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v5 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_250D3F000, v5, OS_LOG_TYPE_DEFAULT, "Error handling journaled sharing entries %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)invalidateStoreCache
{
  _HKInitializeLogging();
  id v3 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "Wiping Health app store cache", v5, 2u);
  }
  id v4 = [(HDHAHealthPluginHostFeedGenerator *)self synchronousHealthAppPluginHost];
  [v4 invalidateStoreCache];
}

- (id)synchronousHealthAppPluginHost
{
  return [(HDHAHealthAppPluginHostConnection *)self->_pluginHostConnection synchronousProxy];
}

- (id)healthAppPluginHost
{
  return [(HDHAHealthAppPluginHostConnection *)self->_pluginHostConnection proxy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orchestrationConnection, 0);
  objc_storeStrong((id *)&self->_pluginHostConnection, 0);
}

@end