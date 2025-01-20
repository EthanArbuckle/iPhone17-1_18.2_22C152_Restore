@interface BLTTestServiceServer
+ (id)sharedTestServer;
- (BLTTestServiceServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)clientConnections;
- (NSXPCListener)listener;
- (void)_removeClientConnection:(id)a3;
- (void)addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9;
- (void)clearSectionInfoSentCacheWithCompletion:(id)a3;
- (void)disableStandaloneTestModeWithCompletion:(id)a3;
- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6 completion:(id)a7;
- (void)getStandaloneTestModeEnabledWithCompletion:(id)a3;
- (void)logFaultWithCompletion:(id)a3;
- (void)originalSettingsWithCompletion:(id)a3;
- (void)overriddenSettingsWithCompletion:(id)a3;
- (void)removeSectionID:(id)a3 completion:(id)a4;
- (void)resume;
- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4;
- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4;
- (void)setClientConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)settingOverridesWithCompletion:(id)a3;
- (void)simulateAnalytics:(id)a3 completion:(id)a4;
- (void)spoolSectionInfoWithCompletion:(id)a3;
- (void)willAlertForSectionID:(id)a3 subtype:(int64_t)a4 completion:(id)a5;
@end

@implementation BLTTestServiceServer

+ (id)sharedTestServer
{
  if (sharedTestServer___onceToken != -1) {
    dispatch_once(&sharedTestServer___onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedTestServer___sharedInstance;
  return v2;
}

uint64_t __40__BLTTestServiceServer_sharedTestServer__block_invoke()
{
  sharedTestServer___sharedInstance = objc_alloc_init(BLTTestServiceServer);
  return MEMORY[0x270F9A758]();
}

- (BLTTestServiceServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)BLTTestServiceServer;
  return [(BLTTestServiceServer *)&v3 init];
}

- (void)resume
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  clientConnections = self->_clientConnections;
  self->_clientConnections = v3;

  [(NSXPCListener *)self->_listener invalidate];
  v5 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletindistributor.testservice"];
  listener = self->_listener;
  self->_listener = v5;

  [(NSXPCListener *)self->_listener setDelegate:self];
  v7 = self->_listener;
  [(NSXPCListener *)v7 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D615FC8];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &unk_264684998;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  [v7 setInvalidationHandler:v16];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v13 = &unk_264684998;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [v7 setInterruptionHandler:&v10];
  -[NSMutableArray addObject:](self->_clientConnections, "addObject:", v7, v10, v11, v12, v13);
  [v7 resume];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeClientConnection:v2];
}

void __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeClientConnection:v2];
}

- (void)_removeClientConnection:(id)a3
{
}

- (void)addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a9;
  id v17 = BLTWorkQueue();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke;
  v21[3] = &unk_2646849C0;
  BOOL v27 = a5;
  id v22 = v14;
  id v23 = v15;
  unint64_t v25 = a4;
  int64_t v26 = a7;
  BOOL v28 = a8;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(v17, v21);
}

void __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 73);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke_2;
  v9[3] = &unk_264684828;
  id v10 = *(id *)(a1 + 48);
  [v2 _addBulletin:v4 forFeed:v6 playLightsAndSirens:v3 attachment:v5 attachmentType:v7 alwaysSend:v8 completion:v9];
}

uint64_t __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = BLTWorkQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke;
  v10[3] = &unk_264684118;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke_2;
  v4[3] = &unk_264683CA0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 sendSectionInfoWithSectionID:v3 completion:v4];
}

uint64_t __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = BLTWorkQueue();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke;
  v8[3] = &unk_2646849E8;
  BOOL v10 = a3;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke_2;
  v4[3] = &unk_264683CA0;
  id v5 = *(id *)(a1 + 32);
  [v2 sendAllSectionInfoWithSpool:v3 completion:v4];
}

uint64_t __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)spoolSectionInfoWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke_2;
  v3[3] = &unk_264683CA0;
  id v4 = *(id *)(a1 + 32);
  [v2 spoolSectionInfoWithCompletion:v3];
}

uint64_t __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearSectionInfoSentCacheWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__BLTTestServiceServer_clearSectionInfoSentCacheWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __64__BLTTestServiceServer_clearSectionInfoSentCacheWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  [v2 clearSectionInfoSentCache];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)getStandaloneTestModeEnabledWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BLTTestServiceServer_getStandaloneTestModeEnabledWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __67__BLTTestServiceServer_getStandaloneTestModeEnabledWithCompletion___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = +[BLTBulletinDistributor sharedDistributor];
    [v2 isStandaloneTestModeEnabled];

    id v3 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v3();
  }
  return result;
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __139__BLTTestServiceServer_enableStandaloneTestModeWithMinimumSendDelay_maximumSendDelay_minimumResponseDelay_maximumResponseDelay_completion___block_invoke;
  block[3] = &unk_264684A10;
  unint64_t v17 = a4;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v15 = v11;
  unint64_t v16 = a3;
  id v13 = v11;
  dispatch_async(v12, block);
}

uint64_t __139__BLTTestServiceServer_enableStandaloneTestModeWithMinimumSendDelay_maximumSendDelay_minimumResponseDelay_maximumResponseDelay_completion___block_invoke(void *a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  [v2 enableStandaloneTestModeWithMinimumSendDelay:a1[5] maximumSendDelay:a1[6] minimumResponseDelay:a1[7] maximumResponseDelay:a1[8]];

  uint64_t result = a1[4];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)disableStandaloneTestModeWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__BLTTestServiceServer_disableStandaloneTestModeWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __64__BLTTestServiceServer_disableStandaloneTestModeWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  [v2 disableStandaloneTestMode];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)willAlertForSectionID:(id)a3 subtype:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke;
  block[3] = &unk_264684A38;
  id v14 = v8;
  int64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke(uint64_t a1)
{
  id v2 = +[BLTBulletinDistributor sharedDistributor];
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke_2;
  v5[3] = &unk_264684828;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v2 getWillNanoPresentNotificationForSectionID:v4 subsectionIDs:0 subtype:v3 completion:v5];
}

uint64_t __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)settingOverridesWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BLTTestServiceServer_settingOverridesWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __55__BLTTestServiceServer_settingOverridesWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = +[BLTBulletinDistributor sharedDistributor];
    id v3 = [v2 settingOverrides];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)originalSettingsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BLTTestServiceServer_originalSettingsWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __55__BLTTestServiceServer_originalSettingsWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = +[BLTBulletinDistributor sharedDistributor];
    id v3 = [v2 originalSettings];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)overriddenSettingsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BLTTestServiceServer_overriddenSettingsWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __57__BLTTestServiceServer_overriddenSettingsWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = +[BLTBulletinDistributor sharedDistributor];
    id v3 = [v2 overriddenSettings];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)removeSectionID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = BLTWorkQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__BLTTestServiceServer_removeSectionID_completion___block_invoke;
  v10[3] = &unk_264683C28;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __51__BLTTestServiceServer_removeSectionID_completion___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = +[BLTBulletinDistributor sharedDistributor];
    [v2 removeSectionID:*(void *)(v1 + 32)];

    id v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)logFaultWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke;
  block[3] = &unk_264683CA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke_cold_1(v2);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)simulateAnalytics:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void))a4;
  if ([v9 isEqualToString:@"BLTAnalyticsLogCompanionToGizmoDelay"])
  {
    id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-50.0];
    id v7 = [MEMORY[0x263EFF910] date];
    BLTAnalyticsLogCompanionToGizmoDelay(@"com.apple.test_section_id", @"publisher_match_id", v6, v7, 1);

LABEL_7:
    v5[2](v5, 0);
    goto LABEL_8;
  }
  if ([v9 isEqualToString:@"BLTAnalyticsLogBulletinSize"])
  {
    BLTAnalyticsLogBulletinSize(@"com.apple.test_section_id", 5000000, @"publisher_match_id");
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"BLTAnalyticsLogOutOfOrderMessage"])
  {
    BLTAnalyticsLogOutOfOrderMessage();
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.invalid.analytics.type" code:-1 userInfo:0];
  ((void (**)(id, void *))v5)[2](v5, v8);

LABEL_8:
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_222F4C000, log, OS_LOG_TYPE_FAULT, "Log fault called from test service", v1, 2u);
}

@end