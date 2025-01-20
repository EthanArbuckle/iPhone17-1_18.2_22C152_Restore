@interface BBSettingsGateway
+ (id)clientInterface;
+ (id)serverInterface;
- (BBSettingsGateway)init;
- (BBSettingsGateway)initWithQueue:(id)a3;
- (id)_ensureBBServerSettingsConnection;
- (id)_ensureSettingsPersistenceConnection;
- (id)_settingsConnection;
- (id)activeSectionInfo;
- (id)allActiveSectionIDs;
- (id)allEffectiveSectionInfo;
- (id)allSectionIDs;
- (id)allSectionInfo;
- (id)effectiveGlobalScheduledDeliveryTimes;
- (id)effectiveSectionInfoForSectionID:(id)a3;
- (id)effectiveSectionInfoForSectionIDs:(id)a3;
- (id)sectionInfoForSectionID:(id)a3;
- (id)sectionInfoForSectionIDs:(id)a3;
- (int64_t)effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)effectiveGlobalAnnounceHeadphonesSetting;
- (int64_t)effectiveGlobalAnnounceSetting;
- (int64_t)effectiveGlobalContentPreviewsSetting;
- (int64_t)effectiveGlobalHighlightsSetting;
- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting;
- (int64_t)effectiveGlobalScheduledDeliverySetting;
- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (int64_t)effectiveGlobalSpokenNotificationSetting;
- (int64_t)effectiveGlobalSummarizationSetting;
- (void)_resetBBServerSettingsConnection;
- (void)_resetSettingsPersistenceConnection;
- (void)dealloc;
- (void)getEffectiveGlobalAnnounceCarPlaySettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalAnnounceSettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalContentPreviewsSettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalHighlightsSettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalScheduledDeliverySettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalScheduledDeliveryTimesWithCompletion:(id)a3;
- (void)getEffectiveGlobalSpokenNotificationSettingWithCompletion:(id)a3;
- (void)getEffectiveGlobalSummarizationSettingWithCompletion:(id)a3;
- (void)getEffectiveSectionInfoForSectionID:(id)a3 withCompletion:(id)a4;
- (void)getEffectiveSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4;
- (void)getSectionInfoForActiveSectionsWithCompletion:(id)a3;
- (void)getSectionInfoForSectionID:(id)a3 withCompletion:(id)a4;
- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4;
- (void)getSectionInfoWithCompletion:(id)a3;
- (void)invalidate;
- (void)refreshAnnounceSettings;
- (void)refreshGlobalSettings;
- (void)refreshSectionInfo;
- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3;
- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3;
- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3;
- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3;
- (void)setEffectiveGlobalSpokenNotificationSetting:(int64_t)a3;
- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withCompletion:(id)a5;
- (void)updateSectionInfoForSectionID:(id)a3 withHandler:(id)a4;
@end

@implementation BBSettingsGateway

- (id)sectionInfoForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested section info (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    v6 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_177];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_178;
    v11[3] = &unk_264296C00;
    v11[4] = &v13;
    [v7 sectionInfoForSectionID:v4 effective:0 withHandler:v11];
  }
  else
  {
    v6 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_180];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_181;
    v10[3] = &unk_264296C28;
    v10[4] = &v13;
    [v7 getSectionInfoForSectionID:v4 withHandler:v10];
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)effectiveSectionInfoForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested effective section info (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    v6 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_158];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_159;
    v11[3] = &unk_264296C00;
    v11[4] = &v13;
    [v7 sectionInfoForSectionID:v4 effective:1 withHandler:v11];
  }
  else
  {
    v6 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_162];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_163;
    v10[3] = &unk_264296C28;
    v10[4] = &v13;
    [v7 getEffectiveSectionInfoForSectionID:v4 withHandler:v10];
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_ensureBBServerSettingsConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
  return self->_connectionQueue_bbServerConnection;
}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
    int v8 = 134217984;
    BOOL v9 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got effective section info [ result: %ld ]", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.bulletinboard.settingsconnection" options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;

    BOOL v5 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = [(id)objc_opt_class() serverInterface];
    [v5 setRemoteObjectInterface:v6];

    v7 = *(void **)(*(void *)(a1 + 32) + 8);
    int v8 = [(id)objc_opt_class() clientInterface];
    [v7 setExportedInterface:v8];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
    [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:&__block_literal_global_119];
    objc_initWeak(&location, *(id *)(a1 + 32));
    BOOL v9 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke_120;
    uint64_t v15 = &unk_264295FE0;
    objc_copyWeak(&v16, &location);
    [v9 setInvalidationHandler:&v12];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "resume", v12, v13, v14, v15);
    uint64_t v10 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_217675000, v10, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: Created BBServer connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_181(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
    int v8 = 134217984;
    BOOL v9 = v5;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Got section infos [ result: %ld ]", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken_0 != -1) {
    dispatch_once(&clientInterface_onceToken_0, &__block_literal_global_7);
  }
  uint64_t v2 = (void *)clientInterface___interface_0;
  return v2;
}

uint64_t __36__BBSettingsGateway_clientInterface__block_invoke()
{
  clientInterface___interface_0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7B6610];
  return MEMORY[0x270F9A758]();
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_43);
  }
  uint64_t v2 = (void *)serverInterface___interface;
  return v2;
}

void __36__BBSettingsGateway_serverInterface__block_invoke()
{
  v61[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7B1820];
  v1 = (void *)serverInterface___interface;
  serverInterface___interface = v0;

  uint64_t v2 = (void *)serverInterface___interface;
  id v3 = (void *)MEMORY[0x263EFFA08];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
  BOOL v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_getSectionInfoWithHandler_ argumentIndex:0 ofReply:1];

  uint64_t v6 = (void *)serverInterface___interface;
  v7 = (void *)MEMORY[0x263EFFA08];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  BOOL v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_getEffectiveSectionInfoWithHandler_ argumentIndex:0 ofReply:1];

  uint64_t v10 = (void *)serverInterface___interface;
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v59 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
  uint64_t v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_getSectionInfoForSectionID_withHandler_ argumentIndex:0 ofReply:1];

  v14 = (void *)serverInterface___interface;
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v58 = objc_opt_class();
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
  v17 = [v15 setWithArray:v16];
  [v14 setClasses:v17 forSelector:sel_getEffectiveSectionInfoForSectionID_withHandler_ argumentIndex:0 ofReply:1];

  id v18 = (void *)serverInterface___interface;
  uint64_t v19 = (void *)MEMORY[0x263EFFA08];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
  v21 = [v19 setWithArray:v20];
  [v18 setClasses:v21 forSelector:sel_getSectionInfoForSectionIDs_withHandler_ argumentIndex:0 ofReply:0];

  v22 = (void *)serverInterface___interface;
  v23 = (void *)MEMORY[0x263EFFA08];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  v25 = [v23 setWithArray:v24];
  [v22 setClasses:v25 forSelector:sel_getSectionInfoForSectionIDs_withHandler_ argumentIndex:0 ofReply:1];

  v26 = (void *)serverInterface___interface;
  v27 = (void *)MEMORY[0x263EFFA08];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  v29 = [v27 setWithArray:v28];
  [v26 setClasses:v29 forSelector:sel_getEffectiveSectionInfoForSectionIDs_withHandler_ argumentIndex:0 ofReply:1];

  v30 = (void *)serverInterface___interface;
  v31 = (void *)MEMORY[0x263EFFA08];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  v33 = [v31 setWithArray:v32];
  [v30 setClasses:v33 forSelector:sel_getSectionInfoForActiveSectionsWithHandler_ argumentIndex:0 ofReply:1];

  v34 = (void *)serverInterface___interface;
  v35 = (void *)MEMORY[0x263EFFA08];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
  v37 = [v35 setWithArray:v36];
  [v34 setClasses:v37 forSelector:sel_getActiveSectionIDsWithHandler_ argumentIndex:0 ofReply:1];

  v38 = (void *)serverInterface___interface;
  v39 = (void *)MEMORY[0x263EFFA08];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  v41 = [v39 setWithArray:v40];
  [v38 setClasses:v41 forSelector:sel_getSectionIDsWithHandler_ argumentIndex:0 ofReply:1];

  v42 = (void *)serverInterface___interface;
  v43 = (void *)MEMORY[0x263EFFA08];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
  v45 = [v43 setWithArray:v44];
  [v42 setClasses:v45 forSelector:sel_getEffectiveGlobalScheduledDeliveryTimesWithHandler_ argumentIndex:0 ofReply:1];

  v46 = (void *)serverInterface___interface;
  v47 = (void *)MEMORY[0x263EFFA08];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
  v49 = [v47 setWithArray:v48];
  [v46 setClasses:v49 forSelector:sel_setEffectiveGlobalScheduledDeliveryTimes_withHandler_ argumentIndex:0 ofReply:0];
}

- (BBSettingsGateway)init
{
  return [(BBSettingsGateway *)self initWithQueue:MEMORY[0x263EF83A0]];
}

- (BBSettingsGateway)initWithQueue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBSettingsGateway;
  BOOL v5 = [(BBSettingsGateway *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = (id)MEMORY[0x263EF83A0];
      id v6 = MEMORY[0x263EF83A0];
    }
    objc_storeStrong((id *)&v5->_queue, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.bulletinboard.BBSettingsGateway.connectionQueue", 0);
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v7;
  }
  return v5;
}

- (void)dealloc
{
  [(BBSettingsGateway *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBSettingsGateway;
  [(BBSettingsGateway *)&v3 dealloc];
}

- (void)invalidate
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__BBSettingsGateway_invalidate__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __31__BBSettingsGateway_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 invalidate];
}

- (id)_settingsConnection
{
  if (BBRefactorEnabled()) {
    [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
  }
  else {
  objc_super v3 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
  }
  return v3;
}

void __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke_2()
{
  uint64_t v0 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "BBServer connection interrupted", v1, 2u);
  }
}

void __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke_120(uint64_t a1)
{
  uint64_t v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBServer connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetBBServerSettingsConnection];
}

- (id)_ensureSettingsPersistenceConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
  return self->_connectionQueue_unServerConnection;
}

void __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v3 = [v2 initWithMachServiceName:*MEMORY[0x263F84350] options:0];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    dispatch_queue_t v7 = [MEMORY[0x263F842F0] serverInterface];
    [v6 setRemoteObjectInterface:v7];

    int v8 = *(void **)(*(void *)(a1 + 32) + 16);
    BOOL v9 = [MEMORY[0x263F842F0] clientInterface];
    [v8 setExportedInterface:v9];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&__block_literal_global_123];
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_super v10 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke_124;
    id v16 = &unk_264295FE0;
    objc_copyWeak(&v17, &location);
    [v10 setInvalidationHandler:&v13];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v13, v14, v15, v16);
    uint64_t v11 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v12;
      _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: Created usernotificationsd connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke_2()
{
  uint64_t v0 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: usernotificationsd connection interrupted", v1, 2u);
  }
}

void __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke_124(uint64_t a1)
{
  id v2 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: usernotificationsd connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetSettingsPersistenceConnection];
}

- (void)_resetBBServerSettingsConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__BBSettingsGateway__resetBBServerSettingsConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __53__BBSettingsGateway__resetBBServerSettingsConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)_resetSettingsPersistenceConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BBSettingsGateway__resetSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __56__BBSettingsGateway__resetSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (id)allEffectiveSectionInfo
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  uint64_t v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Getting all effective section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    uint64_t v4 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    BOOL v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_127];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_128;
    v9[3] = &unk_2642969B0;
    v9[4] = &v11;
    [v5 allSortedSectionInfos:1 withHandler:v9];
  }
  else
  {
    uint64_t v4 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    BOOL v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_132];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_133;
    v8[3] = &unk_2642969B0;
    v8[4] = &v11;
    [v5 getEffectiveSectionInfoWithHandler:v8];
  }

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_128(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    int v11 = 134218242;
    uint64_t v12 = [v5 count];
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld effective section infos [ error: %{public}@ ]", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)allSectionInfo
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  uint64_t v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Getting all section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    uint64_t v4 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_135];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__BBSettingsGateway_allSectionInfo__block_invoke_136;
    v9[3] = &unk_2642969B0;
    v9[4] = &v11;
    [v5 allSortedSectionInfos:0 withHandler:v9];
  }
  else
  {
    uint64_t v4 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_138];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__BBSettingsGateway_allSectionInfo__block_invoke_139;
    v8[3] = &unk_2642969B0;
    v8[4] = &v11;
    [v5 getSectionInfoWithHandler:v8];
  }

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __35__BBSettingsGateway_allSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __35__BBSettingsGateway_allSectionInfo__block_invoke_136(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __35__BBSettingsGateway_allSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __35__BBSettingsGateway_allSectionInfo__block_invoke_2_cold_1();
  }
}

void __35__BBSettingsGateway_allSectionInfo__block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    int v11 = 134218242;
    uint64_t v12 = [v5 count];
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld section infos [ error: %{public}@ ]", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)getSectionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke;
  v23[3] = &unk_264296B60;
  v23[4] = self;
  id v5 = v4;
  id v24 = v5;
  id v6 = (void *)MEMORY[0x21D44A270](v23);
  dispatch_queue_t v7 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Getting all section infos (async)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    int v8 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_143];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_144;
    v20[3] = &unk_2642960F8;
    objc_super v10 = &v21;
    uint64_t v21 = v6;
    id v11 = v6;
    [v9 allSortedSectionInfos:0 withHandler:v20];
  }
  else
  {
    uint64_t v12 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2_145;
    v18[3] = &unk_264296B88;
    objc_super v10 = &v19;
    id v13 = v6;
    id v19 = v13;
    id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_146;
    v16[3] = &unk_2642960F8;
    id v17 = v13;
    id v15 = v13;
    [v14 getSectionInfoWithHandler:v16];

    int v8 = v17;
  }
}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_141(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_144(uint64_t a1, uint64_t a2)
{
  id v3 = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __35__BBSettingsGateway_allSectionInfo__block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_queue_t v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v9 = 134218242;
    uint64_t v10 = [v5 count];
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld section infos [ error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sectionInfoForSectionIDs:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  id v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    id v6 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    dispatch_queue_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_148];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_149;
    v11[3] = &unk_2642969B0;
    v11[4] = &v13;
    [v7 sectionInfosForSectionIDs:v4 effective:0 withHandler:v11];
  }
  else
  {
    id v6 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    dispatch_queue_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_151];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_152;
    v10[3] = &unk_264296BB0;
    v10[4] = &v13;
    [v7 getSectionInfoForSectionIDs:v4 withHandler:v10];
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_149(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1();
  }
}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld section infos", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_queue_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  v19[3] = &unk_264296B60;
  v19[4] = self;
  id v7 = v6;
  id v20 = v7;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x21D44A270](v19);
  if (BBRefactorEnabled())
  {
    uint64_t v10 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    __int16 v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_154];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_155;
    v17[3] = &unk_2642960F8;
    id v12 = &v18;
    id v18 = v9;
    id v13 = v9;
    [v11 sectionInfosForSectionIDs:v8 effective:0 withHandler:v17];
  }
  else
  {
    uint64_t v10 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    __int16 v11 = [v10 remoteObjectProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2_156;
    v15[3] = &unk_264296BD8;
    id v12 = &v16;
    id v16 = v9;
    id v14 = v9;
    [v11 getSectionInfoForSectionIDs:v8 withHandler:v15];
  }
}

void __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_155(uint64_t a1, uint64_t a2)
{
  id v3 = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2_156(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_159(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfo:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_2_cold_1();
  }
}

- (id)effectiveSectionInfoForSectionIDs:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  id v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested effective section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    id v6 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_166];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_167;
    v11[3] = &unk_2642969B0;
    v11[4] = &v13;
    [v7 sectionInfosForSectionIDs:v4 effective:1 withHandler:v11];
  }
  else
  {
    id v6 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_169];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_170;
    v10[3] = &unk_264296BB0;
    v10[4] = &v13;
    [v7 getEffectiveSectionInfoForSectionIDs:v4 withHandler:v10];
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_167(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_2_cold_1();
  }
}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_170(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld effective section infos", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (void)getEffectiveSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke;
  v19[3] = &unk_264296B60;
  v19[4] = self;
  id v8 = v7;
  id v20 = v8;
  uint64_t v9 = (void *)MEMORY[0x21D44A270](v19);
  if (BBRefactorEnabled())
  {
    uint64_t v10 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    __int16 v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_172];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_173;
    v17[3] = &unk_2642960F8;
    id v18 = v9;
    [v11 allSortedSectionInfos:0 withHandler:v17];

    id v12 = v18;
  }
  else
  {
    uint64_t v13 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v14 = [v13 remoteObjectProxy];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2_174;
    v15[3] = &unk_264296B60;
    void v15[4] = self;
    id v16 = v8;
    [v14 getEffectiveSectionInfoForSectionIDs:v6 withHandler:v15];

    id v12 = v16;
  }
}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_173(uint64_t a1, uint64_t a2)
{
  id v3 = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2_174(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_3_175;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_3_175(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_178(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfo:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1();
  }
}

- (void)getSectionInfoForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (BBRefactorEnabled())
  {
    id v8 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_183];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_184;
    v15[3] = &unk_264296C50;
    uint64_t v10 = &v16;
    void v15[4] = self;
    id v16 = v6;
    id v11 = v6;
    [v9 sectionInfoForSectionID:v7 effective:0 withHandler:v15];
  }
  else
  {
    id v8 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v9 = [v8 remoteObjectProxy];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_3;
    v13[3] = &unk_264296C78;
    uint64_t v10 = &v14;
    v13[4] = self;
    id v14 = v6;
    id v12 = v6;
    [v9 getSectionInfoForSectionID:v7 withHandler:v13];
  }
}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_184(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[BBUNCoreConversion toBBSectionInfo:*(void *)(a1 + 32) parentSection:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_4;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getEffectiveSectionInfoForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (BBRefactorEnabled())
  {
    id v8 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_186];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_187;
    v15[3] = &unk_264296C50;
    uint64_t v10 = &v16;
    void v15[4] = self;
    id v16 = v6;
    id v11 = v6;
    [v9 sectionInfoForSectionID:v7 effective:1 withHandler:v15];
  }
  else
  {
    id v8 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v9 = [v8 remoteObjectProxy];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_3;
    v13[3] = &unk_264296C78;
    uint64_t v10 = &v14;
    v13[4] = self;
    id v14 = v6;
    id v12 = v6;
    [v9 getEffectiveSectionInfoForSectionID:v7 withHandler:v13];
  }
}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_187(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[BBUNCoreConversion toBBSectionInfo:*(void *)(a1 + 32) parentSection:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_4;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)activeSectionInfo
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  id v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Getting active section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    id v4 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_189];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__BBSettingsGateway_activeSectionInfo__block_invoke_190;
    v9[3] = &unk_2642969B0;
    v9[4] = &v11;
    [v5 allSortedActiveSections:0 withHandler:v9];
  }
  else
  {
    id v4 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_192];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__BBSettingsGateway_activeSectionInfo__block_invoke_193;
    v8[3] = &unk_2642969B0;
    v8[4] = &v11;
    [v5 getSectionInfoForActiveSectionsWithHandler:v8];
  }

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

uint64_t __38__BBSettingsGateway_activeSectionInfo__block_invoke_190(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  return MEMORY[0x270F9A758]();
}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1();
  }
}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke_193(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld section infos", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (id)allActiveSectionIDs
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__6;
  id v12 = __Block_byref_object_dispose__6;
  id v13 = [MEMORY[0x263EFFA08] set];
  id v3 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_195];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_196;
  v7[3] = &unk_264296CA0;
  void v7[4] = &v8;
  [v4 getActiveSectionIDsWithHandler:v7];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_cold_1();
  }
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7 && os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_196_cold_1();
  }
}

- (id)allSectionIDs
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  id v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Getting all section IDs (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    id v4 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_199];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__BBSettingsGateway_allSectionIDs__block_invoke_200;
    v9[3] = &unk_2642969B0;
    v9[4] = &v11;
    [v5 allSectionIDsWithHandler:v9];
  }
  else
  {
    id v4 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_202];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__BBSettingsGateway_allSectionIDs__block_invoke_203;
    v8[3] = &unk_2642969B0;
    v8[4] = &v11;
    [v5 getSectionIDsWithHandler:v8];
  }

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_200(uint64_t a1, void *a2)
{
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __34__BBSettingsGateway_allSectionIDs__block_invoke_2_cold_1();
  }
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    int v11 = 134218242;
    uint64_t v12 = [v5 count];
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_217675000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld section IDs [ error: %{public}@ ]", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)getSectionInfoForActiveSectionsWithCompletion:(id)a3
{
  id v4 = a3;
  if (BBRefactorEnabled())
  {
    id v5 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_205];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_206;
    v12[3] = &unk_264296CC8;
    id v7 = &v13;
    v12[4] = self;
    id v13 = v4;
    id v8 = v4;
    [v6 allSortedActiveSections:0 withHandler:v12];
  }
  else
  {
    id v5 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v6 = [v5 remoteObjectProxy];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_3;
    v10[3] = &unk_264296CC8;
    id v7 = &v11;
    v10[4] = self;
    id v11 = v4;
    id v9 = v4;
    [v6 getSectionInfoForActiveSectionsWithHandler:v10];
  }
}

void __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();
  }
}

void __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_206(uint64_t a1, uint64_t a2)
{
  id v3 = +[BBUNCoreConversion toBBSectionInfos:a2 parentSection:0];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_4;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (BBRefactorEnabled())
  {
    id v11 = +[BBUNCoreConversion toUNCSectionInfo:v8 parentSection:0];
    uint64_t v12 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v13 = [v12 remoteObjectProxy];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke;
    v19[3] = &unk_264296288;
    id v20 = v9;
    id v14 = v9;
    [v13 setSectionInfo:v11 forSectionID:v10 withHandler:v19];
  }
  else
  {
    uint64_t v15 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v16 = [v15 remoteObjectProxy];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke_2;
    v17[3] = &unk_264296288;
    id v18 = v9;
    id v11 = v9;
    [v16 setSectionInfo:v8 forSectionID:v10 withHandler:v17];

    id v14 = v18;
  }
}

uint64_t __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateSectionInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (BBRefactorEnabled())
  {
    id v8 = [(BBSettingsGateway *)self _ensureSettingsPersistenceConnection];
    id v9 = [v8 remoteObjectProxy];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke;
    v23[3] = &unk_264296CF0;
    id v10 = &v26;
    id v25 = v6;
    id v26 = v7;
    id v11 = &v24;
    uint64_t v12 = &v25;
    id v24 = v9;
    id v13 = v6;
    id v14 = v7;
    id v15 = v9;
    [v15 sectionInfoForSectionID:v13 effective:0 withHandler:v23];
  }
  else
  {
    id v16 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
    id v17 = [v16 remoteObjectProxy];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke_3;
    v19[3] = &unk_264296D18;
    id v10 = &v22;
    id v21 = v6;
    id v22 = v7;
    id v11 = &v20;
    uint64_t v12 = &v21;
    id v20 = v17;
    id v18 = v6;
    id v14 = v17;
    id v15 = v7;
    [v14 getSectionInfoForSectionID:v18 withHandler:v19];
  }
}

void __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[6];
  id v4 = +[BBUNCoreConversion toBBSectionInfo:a2 parentSection:0];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = (void *)a1[4];
  id v6 = +[BBUNCoreConversion toUNCSectionInfo:v7 parentSection:0];
  [v5 setSectionInfo:v6 forSectionID:a1[5] withHandler:&__block_literal_global_208];
}

void __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setSectionInfo:v2 forSectionID:*(void *)(a1 + 40)];
}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_210];
  [v4 setEffectiveGlobalContentPreviewsSetting:a3 withHandler:&__block_literal_global_213];
}

void __62__BBSettingsGateway_setEffectiveGlobalContentPreviewsSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __62__BBSettingsGateway_setEffectiveGlobalContentPreviewsSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_215];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_216;
  v6[3] = &unk_264296D40;
  v6[4] = &v7;
  [v3 getEffectiveGlobalContentPreviewsSettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1();
  }
}

void __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_216(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBContentPreviewSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalContentPreviewSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalContentPreviewsSettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalContentPreviewsSettingWithHandler:v8];
}

void __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalSpokenNotificationSetting:(int64_t)a3
{
  unint64_t v4 = BBAnnounceSettingForSpokenNotificationSetting(a3);
  [(BBSettingsGateway *)self setEffectiveGlobalAnnounceSetting:v4];
}

- (int64_t)effectiveGlobalSpokenNotificationSetting
{
  unint64_t v2 = [(BBSettingsGateway *)self effectiveGlobalAnnounceSetting];
  return BBSpokenNotificationSettingForAnnounceSetting(v2);
}

- (void)getEffectiveGlobalSpokenNotificationSettingWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__BBSettingsGateway_getEffectiveGlobalSpokenNotificationSettingWithCompletion___block_invoke;
  v6[3] = &unk_264296DB8;
  id v7 = v4;
  id v5 = v4;
  [(BBSettingsGateway *)self getEffectiveGlobalAnnounceSettingWithCompletion:v6];
}

uint64_t __79__BBSettingsGateway_getEffectiveGlobalSpokenNotificationSettingWithCompletion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = BBSpokenNotificationSettingForAnnounceSetting(a2);
  id v4 = *(uint64_t (**)(uint64_t, unint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_220];
  [v4 setEffectiveGlobalAnnounceSetting:a3 withHandler:&__block_literal_global_223];
}

void __55__BBSettingsGateway_setEffectiveGlobalAnnounceSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __55__BBSettingsGateway_setEffectiveGlobalAnnounceSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  unint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_225];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_226;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalAnnounceSettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_cold_1();
  }
}

void __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_226(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBAnnounceSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalAnnounceSettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalAnnounceSettingWithHandler:v8];
}

void __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_228];
  [v4 setEffectiveGlobalAnnounceHeadphonesSetting:a3 withHandler:&__block_literal_global_231];
}

void __65__BBSettingsGateway_setEffectiveGlobalAnnounceHeadphonesSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __65__BBSettingsGateway_setEffectiveGlobalAnnounceHeadphonesSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  unint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_233];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_234;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1();
  }
}

void __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_234(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBAnnounceSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceHeadphonesSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:v8];
}

void __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_236];
  [v4 setEffectiveGlobalAnnounceCarPlaySetting:a3 withHandler:&__block_literal_global_239];
}

void __62__BBSettingsGateway_setEffectiveGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __62__BBSettingsGateway_setEffectiveGlobalAnnounceCarPlaySetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  unint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_241_0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_242;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalAnnounceCarPlaySettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1();
  }
}

void __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_242(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBAnnounceCarPlaySetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceCarPlaySetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalAnnounceCarPlaySettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalAnnounceCarPlaySettingWithHandler:v8];
}

void __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_244];
  [v4 setEffectiveGlobalScheduledDeliverySetting:a3 withHandler:&__block_literal_global_247];
}

void __64__BBSettingsGateway_setEffectiveGlobalScheduledDeliverySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __64__BBSettingsGateway_setEffectiveGlobalScheduledDeliverySetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  unint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_249];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_250;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalScheduledDeliverySettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1();
  }
}

void __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_250(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBScheduledDeliverySetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliverySetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalScheduledDeliverySettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalScheduledDeliverySettingWithHandler:v8];
}

void __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3
{
  id v4 = a3;
  id v6 = [(BBSettingsGateway *)self _settingsConnection];
  id v5 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_252];
  [v5 setEffectiveGlobalScheduledDeliveryTimes:v4 withHandler:&__block_literal_global_255];
}

void __62__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __62__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryTimes___block_invoke_cold_1();
  }
}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__6;
  id v12 = __Block_byref_object_dispose__6;
  id v13 = [MEMORY[0x263EFF8C0] array];
  unint64_t v3 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_257];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_258;
  v7[3] = &unk_2642969B0;
  void v7[4] = &v8;
  [v4 getEffectiveGlobalScheduledDeliveryTimesWithHandler:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1();
  }
}

void __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_258(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryTimes (sync) [ error: %{public}@ ]", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (void)getEffectiveGlobalScheduledDeliveryTimesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke;
  v8[3] = &unk_264296CC8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalScheduledDeliveryTimesWithHandler:v8];
}

void __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke_2;
  v7[3] = &unk_2642961C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_260];
  [v4 setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:a3 withHandler:&__block_literal_global_263];
}

void __79__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __79__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_265];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_266;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1();
  }
}

void __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_266(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBSystemSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryShowNextSummarySetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:v8];
}

void __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_268];
  [v4 setEffectiveGlobalNotificationListDisplayStyleSetting:a3 withHandler:&__block_literal_global_271];
}

void __75__BBSettingsGateway_setEffectiveGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __75__BBSettingsGateway_setEffectiveGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_273];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_274;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1();
  }
}

void __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_274(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBNotificationListDisplayStyleSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalNotificationListDisplayStyleSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:v8];
}

void __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_276];
  [v4 setEffectiveGlobalSummarizationSetting:a3 withHandler:&__block_literal_global_279];
}

void __60__BBSettingsGateway_setEffectiveGlobalSummarizationSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __60__BBSettingsGateway_setEffectiveGlobalSummarizationSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalSummarizationSetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_281];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_282;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalSummarizationSettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_cold_1();
  }
}

void __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_282(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBSystemSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalSummarizationSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalSummarizationSettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalSummarizationSettingWithHandler:v8];
}

void __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3
{
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  id v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_284];
  [v4 setEffectiveGlobalHighlightsSetting:a3 withHandler:&__block_literal_global_287];
}

void __57__BBSettingsGateway_setEffectiveGlobalHighlightsSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __57__BBSettingsGateway_setEffectiveGlobalHighlightsSetting___block_invoke_cold_1();
  }
}

- (int64_t)effectiveGlobalHighlightsSetting
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v2 = [(BBSettingsGateway *)self _settingsConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_289];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_290;
  v6[3] = &unk_264296D40;
  void v6[4] = &v7;
  [v3 getEffectiveGlobalHighlightsSettingWithHandler:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
    __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_cold_1();
  }
}

void __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_290(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = BBStringFromBBSystemSetting(a2);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalHighlightsSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)getEffectiveGlobalHighlightsSettingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSettingsGateway *)self _settingsConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke;
  v8[3] = &unk_264296D90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getEffectiveGlobalHighlightsSettingWithHandler:v8];
}

void __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke_2;
  v4[3] = &unk_264296D68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)refreshAnnounceSettings
{
  id v3 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
  id v2 = [v3 remoteObjectProxy];
  [v2 refreshAnnounceSettings];
}

- (void)refreshGlobalSettings
{
  id v3 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
  id v2 = [v3 remoteObjectProxy];
  [v2 refreshGlobalSettings];
}

- (void)refreshSectionInfo
{
  id v3 = [(BBSettingsGateway *)self _ensureBBServerSettingsConnection];
  id v2 = [v3 remoteObjectProxy];
  [v2 refreshSectionInfo];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue_unServerConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue_bbServerConnection, 0);
}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting all effective section infos failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __35__BBSettingsGateway_allSectionInfo__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting all section infos failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting requested section infos failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting requested effective section info failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting requested effective section infos failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting all active section IDs failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_196_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Error getting active section IDs: %{public}@", v2, v3, v4, v5, v6);
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting requested all section IDs failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __62__BBSettingsGateway_setEffectiveGlobalContentPreviewsSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Setting effectiveGlobalContentPreviewSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalContentPreviewSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __55__BBSettingsGateway_setEffectiveGlobalAnnounceSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set setEffectiveGlobalAnnounceSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalAnnounceSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __65__BBSettingsGateway_setEffectiveGlobalAnnounceHeadphonesSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set effectiveGlobalAnnounceHeadphonesSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalAnnounceHeadphonesSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __62__BBSettingsGateway_setEffectiveGlobalAnnounceCarPlaySetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set effectiveGlobalAnnounceCarPlaySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalAnnounceCarPlaySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __64__BBSettingsGateway_setEffectiveGlobalScheduledDeliverySetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set effectiveGlobalScheduledDeliverySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalScheduledDeliverySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __62__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryTimes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set effectiveGlobalScheduledDeliveryTimes (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalScheduledDeliveryTimes (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __79__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set effectiveGlobalScheduledDeliveryShowNextSummarySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalScheduledDeliveryShowNextSummarySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __75__BBSettingsGateway_setEffectiveGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set effectiveGlobalNotificationListDisplayStyleSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalNotificationListDisplayStyleSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __60__BBSettingsGateway_setEffectiveGlobalSummarizationSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set setEffectiveGlobalSummarizationSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalSummarizationSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __57__BBSettingsGateway_setEffectiveGlobalHighlightsSetting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Set setEffectiveGlobalHighlightsSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_217675000, v0, v1, "Getting effectiveGlobalHighlightsSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
}

@end