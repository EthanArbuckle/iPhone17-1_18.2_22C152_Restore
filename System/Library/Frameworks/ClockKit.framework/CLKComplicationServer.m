@interface CLKComplicationServer
+ (CLKComplicationServer)sharedInstance;
- (BOOL)_shouldAllowComplication:(id)a3;
- (CLKComplicationServer)init;
- (CLKComplicationServer)initWithClientIdentifier:(id)a3;
- (NSArray)activeComplications;
- (NSDate)earliestTimeTravelDate;
- (NSDate)latestTimeTravelDate;
- (id)_init;
- (id)serverProxy;
- (void)_checkinWithServer;
- (void)_complicationServiceDidStart;
- (void)_createConnection;
- (void)_createDataSourceIfNecessary;
- (void)_init;
- (void)dealloc;
- (void)extendTimelineForComplication:(CLKComplication *)complication;
- (void)getAlwaysOnTemplateForComplication:(id)a3 withHandler:(id)a4;
- (void)getComplicationDescriptorsWithHandler:(id)a3;
- (void)getCurrentTimelineEntryForComplication:(id)a3 withHandler:(id)a4;
- (void)getLocalizableSampleTemplateForComplication:(id)a3 withHandler:(id)a4;
- (void)getNextRequestedUpdateDateWithHandler:(id)a3;
- (void)getPrivacyBehaviorForComplication:(id)a3 withHandler:(id)a4;
- (void)getSupportedTimeTravelDirectionsForComplication:(id)a3 withHandler:(id)a4;
- (void)getTimelineAnimationBehaviorForComplication:(id)a3 withHandler:(id)a4;
- (void)getTimelineEndDateForComplication:(id)a3 withHandler:(id)a4;
- (void)getTimelineEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6;
- (void)getWidgetMigrationConfigurationFrom:(id)a3 withHandler:(id)a4;
- (void)handleSharedComplicationDescriptors:(id)a3;
- (void)notifyDebugTimeoutWithCharging:(BOOL)a3;
- (void)reloadComplicationDescriptors;
- (void)reloadTimelineForComplication:(CLKComplication *)complication;
- (void)requestedUpdateBudgetExhausted;
- (void)requestedUpdateDidBegin;
- (void)setActiveComplications:(id)a3;
@end

@implementation CLKComplicationServer

+ (CLKComplicationServer)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CLKComplicationServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance___sharedServer_0;

  return (CLKComplicationServer *)v2;
}

uint64_t __39__CLKComplicationServer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = sharedInstance___sharedServer_0;
  sharedInstance___sharedServer_0 = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (CLKComplicationServer)init
{
  return 0;
}

- (CLKComplicationServer)initWithClientIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer initWithClientIdentifier: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = [(id)objc_opt_class() sharedInstance];

  return v6;
}

- (id)_init
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)CLKComplicationServer;
  uint64_t v2 = [(CLKComplicationServer *)&v24 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v4 = [v3 bundleIdentifier];
    clientIdentifier = v2->_clientIdentifier;
    v2->_clientIdentifier = (NSString *)v4;

    v6 = [v3 objectForInfoDictionaryKey:@"CLKComplicationPrincipalClass"];
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    Class v7 = NSClassFromString(v6);
    int v8 = v7;
    if (v7 && [(objc_class *)v7 conformsToProtocol:&unk_26CCE5F38])
    {
      id v9 = CLKLoggingObjectForDomain(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_21C599000, v9, OS_LOG_TYPE_DEFAULT, "Principal class %@ conforms to correct protocol", buf, 0xCu);
      }

      v2->_dataSourceClass = v8;
      objc_initWeak((id *)buf, v2);
      v2->_restartNotificationToken = -1;
      uint64_t v10 = (const char *)[@"com.apple.ClockKit.complicationservicedidstart" UTF8String];
      id v11 = MEMORY[0x263EF83A0];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __30__CLKComplicationServer__init__block_invoke;
      handler[3] = &unk_26440E5E0;
      objc_copyWeak(&v23, (id *)buf);
      uint32_t v12 = notify_register_dispatch(v10, &v2->_restartNotificationToken, MEMORY[0x263EF83A0], handler);

      if (v12)
      {
        v13 = CLKLoggingObjectForDomain(1);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(CLKComplicationServer *)v12 _init];
        }
      }
      v14 = CLKLoggingObjectForDomain(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21C599000, v14, OS_LOG_TYPE_DEFAULT, "creating complication server connection", v21, 2u);
      }

      [(CLKComplicationServer *)v2 _createConnection];
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      NSLog(&cfstr_MissingOrInval.isa, v6);
      v15 = CLKLoggingObjectForDomain(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_21C599000, v15, OS_LOG_TYPE_DEFAULT, "missing or invalid principal class (%@)", buf, 0xCu);
      }

      v16 = CLKLoggingObjectForDomain(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C599000, v16, OS_LOG_TYPE_DEFAULT, "not creating complication server connection", buf, 2u);
      }
    }
    v17 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.ClockKit.timelineFinalization", v17);
    templateFinalizationQueue = v2->_templateFinalizationQueue;
    v2->_templateFinalizationQueue = (OS_dispatch_queue *)v18;
  }
  return v2;
}

void __30__CLKComplicationServer__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _complicationServiceDidStart];
}

- (void)dealloc
{
  int restartNotificationToken = self->_restartNotificationToken;
  if (restartNotificationToken != -1) {
    notify_cancel(restartNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLKComplicationServer;
  [(CLKComplicationServer *)&v4 dealloc];
}

- (id)serverProxy
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  objc_super v4 = [(NSXPCConnection *)self->_serverConnection remoteObjectProxy];
  os_unfair_lock_unlock(p_connectionLock);

  return v4;
}

- (void)reloadTimelineForComplication:(CLKComplication *)complication
{
  objc_super v4 = complication;
  id v5 = [(CLKComplicationServer *)self serverProxy];
  [v5 reloadTimelineForComplication:v4];
}

- (void)extendTimelineForComplication:(CLKComplication *)complication
{
  objc_super v4 = complication;
  id v5 = [(CLKComplicationServer *)self serverProxy];
  [v5 extendTimelineForComplication:v4];
}

- (void)reloadComplicationDescriptors
{
  id v2 = [(CLKComplicationServer *)self serverProxy];
  [v2 reloadComplicationDescriptors];
}

- (NSArray)activeComplications
{
  return [(NSSet *)self->_activeComplications allObjects];
}

- (NSDate)earliestTimeTravelDate
{
  id v2 = +[CLKDate complicationDate];
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  objc_super v4 = [v3 dateByAddingUnit:16 value:-1 toDate:v2 options:0];
  id v5 = [v3 startOfDayForDate:v4];

  return (NSDate *)v5;
}

- (NSDate)latestTimeTravelDate
{
  id v2 = +[CLKDate complicationDate];
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  objc_super v4 = [v3 dateByAddingUnit:16 value:2 toDate:v2 options:0];
  id v5 = [v3 startOfDayForDate:v4];

  return (NSDate *)v5;
}

- (void)_createConnection
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_serverConnection)
  {
    objc_super v4 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      serverConnection = self->_serverConnection;
      *(_DWORD *)buf = 138412290;
      v17 = serverConnection;
      _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating existing server connection (%@) while trying to create a new one", buf, 0xCu);
    }

    [(NSXPCConnection *)self->_serverConnection invalidate];
    v6 = self->_serverConnection;
    self->_serverConnection = 0;
  }
  Class v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ClockKit.complicationserver" options:4096];
  int v8 = self->_serverConnection;
  self->_serverConnection = v7;

  objc_initWeak((id *)buf, self);
  id v9 = self->_serverConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__CLKComplicationServer__createConnection__block_invoke;
  v14[3] = &unk_26440DAC8;
  objc_copyWeak(&v15, (id *)buf);
  [(NSXPCConnection *)v9 setInterruptionHandler:v14];
  [(NSXPCConnection *)self->_serverConnection setInvalidationHandler:&__block_literal_global_19];
  uint64_t v10 = self->_serverConnection;
  id v11 = CLKComplicationServerInterface();
  [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

  uint32_t v12 = self->_serverConnection;
  v13 = CLKComplicationClientInterface();
  [(NSXPCConnection *)v12 setExportedInterface:v13];

  [(NSXPCConnection *)self->_serverConnection setExportedObject:self];
  [(NSXPCConnection *)self->_serverConnection resume];
  os_unfair_lock_unlock(p_connectionLock);
  [(CLKComplicationServer *)self _checkinWithServer];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __42__CLKComplicationServer__createConnection__block_invoke(uint64_t a1)
{
  id v2 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_21C599000, v2, OS_LOG_TYPE_DEFAULT, "Complication server connection interrupted. Will attempt to reconnect.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkinWithServer];
}

void __42__CLKComplicationServer__createConnection__block_invoke_91()
{
  v0 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __42__CLKComplicationServer__createConnection__block_invoke_91_cold_1();
  }
}

- (void)_complicationServiceDidStart
{
  v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_21C599000, v3, OS_LOG_TYPE_DEFAULT, "Complication server restarted. Reconnecting", v4, 2u);
  }

  [(CLKComplicationServer *)self _createConnection];
}

- (void)_checkinWithServer
{
  id v6 = [(CLKComplicationServer *)self serverProxy];
  clientIdentifier = self->_clientIdentifier;
  objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 bundlePath];
  [v6 checkinWithClientIdentifier:clientIdentifier bundlePath:v5];
}

- (void)_createDataSourceIfNecessary
{
}

- (BOOL)_shouldAllowComplication:(id)a3
{
  return 1;
}

- (void)setActiveComplications:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFFA08] set];
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CLKComplicationServer_setActiveComplications___block_invoke;
  v6[3] = &unk_26440E608;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __48__CLKComplicationServer_setActiveComplications___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(a1 + 32) + 40) isEqualToSet:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
    if ([*(id *)(*(void *)(a1 + 32) + 40) count]) {
      [*(id *)(a1 + 32) _createDataSourceIfNecessary];
    }
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"CLKComplicationServerActiveComplicationsDidChangeNotification" object:0];

    v3 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_21C599000, v3, OS_LOG_TYPE_DEFAULT, "Set active complications to %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)getSupportedTimeTravelDirectionsForComplication:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke;
  block[3] = &unk_26440ED88;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke_2;
  v5[3] = &unk_26440ED60;
  id v6 = *(id *)(a1 + 48);
  id v2 = (void (**)(void))MEMORY[0x21D4AACC0](v5);
  if (([*(id *)(a1 + 32) _shouldAllowComplication:*(void *)(a1 + 40)] & 1) != 0
    && (uint64_t v3 = *(void *)(a1 + 32), *(unsigned char *)(v3 + 56)))
  {
    uint64_t v4 = CLKComplicationTimeTravelDirectionsAssertionBlock(*(void **)(a1 + 48), v2, *(unsigned __int8 *)(v3 + 69), @"-[CLKComplicationDataSource getSupportedTimeTravelDirectionsForComplication:withHandler:]");
    [*(id *)(*(void *)(a1 + 32) + 32) getSupportedTimeTravelDirectionsForComplication:*(void *)(a1 + 40) withHandler:v4];
  }
  else
  {
    v2[2](v2);
  }
}

uint64_t __85__CLKComplicationServer_getSupportedTimeTravelDirectionsForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTimelineEndDateForComplication:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke;
  block[3] = &unk_26440EE00;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_2;
  v15[3] = &unk_26440EDD8;
  id v2 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v2;
  id v17 = *(id *)(a1 + 48);
  uint64_t v3 = (void *)MEMORY[0x21D4AACC0](v15);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_4;
  v13 = &unk_26440ED60;
  id v4 = v3;
  id v14 = v4;
  int v5 = (void (**)(void))MEMORY[0x21D4AACC0](&v10);
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowComplication:", *(void *)(a1 + 40), v10, v11, v12, v13) & 1) != 0
    && (uint64_t v6 = *(void *)(a1 + 32), *(unsigned char *)(v6 + 58)))
  {
    id v7 = *(void **)(v6 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = CLKDateHandlerAssertionBlock(v4, v5, *(unsigned __int8 *)(v6 + 69), @"-[CLKComplicationDataSource getTimelineEndDateForComplication:withHandler:]");
    [v7 getTimelineEndDateForComplication:v8 withHandler:v9];
  }
  else
  {
    v5[2](v5);
  }
}

void __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 || (id v2 = *(unsigned char **)(a1 + 32), !v2[56]))
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_3;
    v5[3] = &unk_26440EDB0;
    uint64_t v3 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    [v2 getSupportedTimeTravelDirectionsForComplication:v3 withHandler:v5];
  }
}

void __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = [MEMORY[0x263EFF910] distantFuture];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0);
  }
}

uint64_t __71__CLKComplicationServer_getTimelineEndDateForComplication_withHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPrivacyBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke;
  block[3] = &unk_26440ED88;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke_2;
  v7[3] = &unk_26440ED60;
  id v8 = *(id *)(a1 + 48);
  uint64_t v2 = (void (**)(void))MEMORY[0x21D4AACC0](v7);
  if (([*(id *)(a1 + 32) _shouldAllowComplication:*(void *)(a1 + 40)] & 1) != 0
    && (uint64_t v3 = *(void *)(a1 + 32), *(unsigned char *)(v3 + 59)))
  {
    uint64_t v4 = *(void **)(v3 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = CLKComplicationPrivacyBehaviorAssertionBlock(*(void **)(a1 + 48), v2, *(unsigned __int8 *)(v3 + 69), @"-[CLKComplicationDataSource getPrivacyBehaviorForComplication:withHandler:]");
    [v4 getPrivacyBehaviorForComplication:v5 withHandler:v6];
  }
  else
  {
    v2[2](v2);
  }
}

uint64_t __71__CLKComplicationServer_getPrivacyBehaviorForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTimelineAnimationBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke;
  block[3] = &unk_26440ED88;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_2;
  v7[3] = &unk_26440ED60;
  id v8 = *(id *)(a1 + 48);
  uint64_t v2 = (void (**)(void))MEMORY[0x21D4AACC0](v7);
  if (([*(id *)(a1 + 32) _shouldAllowComplication:*(void *)(a1 + 40)] & 1) != 0
    && (uint64_t v3 = *(void *)(a1 + 32), *(unsigned char *)(v3 + 60)))
  {
    uint64_t v4 = *(void **)(v3 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = CLKComplicationTimelineAnimationBehaviorBlock(*(void **)(a1 + 48), v2, *(unsigned __int8 *)(v3 + 69), @"-[CLKComplicationDataSource getTimelineAnimationBehaviorForComplication:withHandler:]");
    [v4 getTimelineAnimationBehaviorForComplication:v5 withHandler:v6];
  }
  else
  {
    v2[2](v2);
  }
}

uint64_t __81__CLKComplicationServer_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAlwaysOnTemplateForComplication:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke;
  v11[3] = &unk_26440EE50;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke(id *a1)
{
  [a1[4] _createDataSourceIfNecessary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_2;
  v10[3] = &unk_26440ED60;
  id v11 = a1[6];
  uint64_t v2 = (void (**)(void))MEMORY[0x21D4AACC0](v10);
  if (([a1[4] _shouldAllowComplication:a1[5]] & 1) != 0 && *((unsigned char *)a1[4] + 70))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_3;
    v7[3] = &unk_26440EE28;
    id v8 = a1[5];
    long long v6 = *((_OWORD *)a1 + 3);
    id v3 = (id)v6;
    long long v9 = v6;
    uint64_t v4 = (void *)MEMORY[0x21D4AACC0](v7);
    uint64_t v5 = CLKComplicationTemplateAssertionBlock(v4, v2, *((unsigned __int8 *)a1[4] + 69), @"-[CLKComplicationDataSource getAlwaysOnTemplateForComplication:withHandler:]");
    [*((id *)a1[4] + 4) getAlwaysOnTemplateForComplication:a1[5] withHandler:v5];
  }
  else
  {
    v2[2](v2);
  }
}

uint64_t __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__CLKComplicationServer_getAlwaysOnTemplateForComplication_withHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = _ValidateTemplate(v6, [*(id *)(a1 + 32) family]);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = [v6 finalizedCopy];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)getCurrentTimelineEntryForComplication:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getCurrentTimelineEntryForComplication:withHandler:", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke;
  block[3] = &unk_26440EE00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke(id *a1)
{
  [a1[4] _createDataSourceIfNecessary];
  if ([a1[4] _shouldAllowComplication:a1[5]])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_2;
    v6[3] = &unk_26440DA30;
    id v7 = a1[5];
    id v8 = a1[6];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_3;
    v4[3] = &unk_26440ED60;
    id v5 = a1[6];
    uint64_t v2 = CLKComplicationTimelineEntryAssertionBlock(v6, v4, *((unsigned __int8 *)a1[4] + 69), @"-[CLKComplicationDataSource getCurrentTimelineEntryForComplication:withHandler:]");
    [*((id *)a1[4] + 4) getCurrentTimelineEntryForComplication:a1[5] withHandler:v2];
  }
  else
  {
    int v3 = (void (*)(void))*((void *)a1[6] + 2);
    v3();
  }
}

void __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = _ValidateEntry(v6, [*(id *)(a1 + 32) family]);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = [v6 finalizedCopy];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

uint64_t __76__CLKComplicationServer_getCurrentTimelineEntryForComplication_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTimelineEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  SEL v14 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C599000, v14, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getTimelineEntriesForComplication:afterDate:limit:withHandler:", buf, 2u);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke;
  v18[3] = &unk_26440EEF0;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  unint64_t v22 = a5;
  SEL v23 = a2;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(MEMORY[0x263EF83A0], v18);
}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_2;
  v16[3] = &unk_26440ED60;
  id v17 = *(id *)(a1 + 56);
  uint64_t v2 = (void (**)(void))MEMORY[0x21D4AACC0](v16);
  if (([*(id *)(a1 + 32) _shouldAllowComplication:*(void *)(a1 + 40)] & 1) != 0
    && *(unsigned char *)(*(void *)(a1 + 32) + 61))
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3;
    v9[3] = &unk_26440EEC8;
    id v10 = *(id *)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = *(void **)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v11 = v3;
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v14 = v5;
    uint64_t v15 = v6;
    id v7 = v4;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v7;
    id v8 = CLKComplicationTimelineEntryArrayAssertionBlock(v9, v2, *(unsigned __int8 *)(v12 + 69), @"-[CLKComplicationDataSource getTimelineEntriesForComplication:afterDate:limit:withHandler:]");
    [*(id *)(*(void *)(a1 + 32) + 32) getTimelineEntriesForComplication:*(void *)(a1 + 40) afterDate:*(void *)(a1 + 48) limit:*(void *)(a1 + 64) withHandler:v8];
  }
  else
  {
    v2[2](v2);
  }
}

uint64_t __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_4;
  v11[3] = &unk_26440EEA0;
  id v4 = v3;
  id v12 = v4;
  id v13 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v14 = v5;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  id v15 = v6;
  id v9 = (void (**)(void))MEMORY[0x21D4AACC0](v11);
  if (CLKIsBeingDebugged())
  {
    id v10 = CLKLoggingObjectForDomain(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3_cold_1();
    }

    v9[2](v9);
  }
  else
  {
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 48) + 80), v9);
  }
}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (_ValidateEntries(*(void **)(a1 + 32), [*(id *)(a1 + 40) family]))
  {
    uint64_t v2 = *(void **)(v1 + 48);
    unint64_t v3 = *(void *)(v1 + 64);
    id v4 = *(const char **)(v1 + 72);
    id v5 = *(id *)(v1 + 32);
    id v6 = v2;
    if (v5)
    {
      uint64_t v34 = v1;
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = ___FinalizedEntriesFilteredByDateAndCount_block_invoke;
      v45[3] = &unk_26440EFE0;
      char v47 = 0;
      id v33 = v6;
      id v7 = v6;
      id v46 = v7;
      v32 = [v5 indexesOfObjectsPassingTest:v45];
      uint64_t v8 = objc_msgSend(v5, "objectsAtIndexes:");
      uint64_t v9 = [v5 count];
      uint64_t v10 = v9 - [v8 count];
      if (v10 >= 1)
      {
        id v11 = CLKLoggingObjectForDomain(3);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = NSStringFromSelector(v4);
          id v13 = [NSNumber numberWithInteger:v10];
          *(_DWORD *)buf = 138413058;
          v49 = v12;
          __int16 v50 = 2112;
          v51 = v13;
          __int16 v52 = 2112;
          v53 = @"before start";
          __int16 v54 = 2112;
          id v55 = v7;
          _os_log_impl(&dword_21C599000, v11, OS_LOG_TYPE_DEFAULT, "%@ -- invalid entries returned. (%@ entries %@ date %@).  Excess entries will be discarded.", buf, 0x2Au);
        }
      }
      id v14 = v8;

      unint64_t v15 = [v14 count];
      uint64_t v16 = v14;
      if (v15 > v3)
      {
        unint64_t v17 = v15;
        uint64_t v18 = CLKLoggingObjectForDomain(3);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = NSStringFromSelector(v4);
          id v20 = [NSNumber numberWithUnsignedInteger:v17];
          id v21 = [NSNumber numberWithUnsignedInteger:v3];
          *(_DWORD *)buf = 138412802;
          v49 = v19;
          __int16 v50 = 2112;
          v51 = v20;
          __int16 v52 = 2112;
          v53 = v21;
          _os_log_impl(&dword_21C599000, v18, OS_LOG_TYPE_DEFAULT, "%@ -- too many entries provided (%@; limit = %@). Excess entries will be discarded.",
            buf,
            0x20u);
        }
        uint64_t v16 = objc_msgSend(v14, "subarrayWithRange:", 0, v3);
      }
      unint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "array", v14);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v23 = v16;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:buf count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v42;
        uint64_t v27 = MEMORY[0x263EF83A0];
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            v29 = *(void **)(*((void *)&v41 + 1) + 8 * v28);
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v30 = [v29 finalizedCopy];
              [v22 addObject:v30];
            }
            else
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = ___FinalizedEntriesFilteredByDateAndCount_block_invoke_220;
              block[3] = &unk_26440E608;
              id v39 = v22;
              v40 = v29;
              dispatch_sync(v27, block);
              v30 = v39;
            }

            ++v28;
          }
          while (v25 != v28);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:buf count:16];
        }
        while (v25);
      }

      id v6 = v33;
      uint64_t v1 = v34;
    }
    else
    {
      unint64_t v22 = 0;
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    (*(void (**)(void))(*(void *)(v1 + 56) + 16))();
  }
  else
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_5;
    v35[3] = &unk_26440EE78;
    id v37 = *(id *)(v1 + 56);
    id v36 = v22;
    dispatch_async(MEMORY[0x263EF83A0], v35);
  }
}

uint64_t __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getNextRequestedUpdateDateWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__CLKComplicationServer_getNextRequestedUpdateDateWithHandler___block_invoke;
  v6[3] = &unk_26440EF18;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __63__CLKComplicationServer_getNextRequestedUpdateDateWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 63))
  {
    unint64_t v3 = *(void **)(v2 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 getNextRequestedUpdateDateWithHandler:v4];
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
}

- (void)requestedUpdateDidBegin
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CLKComplicationServer_requestedUpdateDidBegin__block_invoke;
  block[3] = &unk_26440E580;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__CLKComplicationServer_requestedUpdateDidBegin__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 64))
  {
    uint64_t v4 = *(void **)(v3 + 32);
    return [v4 requestedUpdateDidBegin];
  }
  return result;
}

- (void)requestedUpdateBudgetExhausted
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CLKComplicationServer_requestedUpdateBudgetExhausted__block_invoke;
  block[3] = &unk_26440E580;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__CLKComplicationServer_requestedUpdateBudgetExhausted__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 65))
  {
    uint64_t v4 = *(void **)(v3 + 32);
    return [v4 requestedUpdateBudgetExhausted];
  }
  return result;
}

- (void)getLocalizableSampleTemplateForComplication:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke;
  v11[3] = &unk_26440EE50;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke(id *a1)
{
  [a1[4] _createDataSourceIfNecessary];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2;
  v17[3] = &unk_26440ED60;
  id v18 = a1[6];
  uint64_t v2 = (void (**)(void))MEMORY[0x21D4AACC0](v17);
  if (([a1[4] _shouldAllowComplication:a1[5]] & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v3 = a1[4];
  if (!v3[68])
  {
    if (v3[66])
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_144;
      v11[3] = &unk_26440EE28;
      id v12 = a1[5];
      long long v10 = *((_OWORD *)a1 + 3);
      id v7 = (id)v10;
      long long v13 = v10;
      id v8 = CLKComplicationTemplateAssertionBlock(v11, v2, 0, @"-[CLKComplicationDataSource getPlaceholderTemplateForComplication:withHandler:]");
      [*((id *)a1[4] + 4) getPlaceholderTemplateForComplication:a1[5] withHandler:v8];

      id v6 = v12;
      goto LABEL_6;
    }
LABEL_7:
    v2[2](v2);
    goto LABEL_8;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140;
  v14[3] = &unk_26440EE28;
  id v15 = a1[5];
  long long v9 = *((_OWORD *)a1 + 3);
  id v4 = (id)v9;
  long long v16 = v9;
  id v5 = CLKComplicationTemplateAssertionBlock(v14, v2, *((unsigned __int8 *)a1[4] + 69), @"-[CLKComplicationDataSource getLocalizableSampleTemplateForComplication:withHandler:]");
  [*((id *)a1[4] + 4) getLocalizableSampleTemplateForComplication:a1[5] withHandler:v5];

  id v6 = v15;
LABEL_6:

LABEL_8:
}

uint64_t __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_3(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  int v12 = _ValidateTemplate(v3, [*(id *)(a1 + 32) family]);
  long long v13 = CLKLoggingObjectForDomain(1);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    id v23 = [v3 finalizedCopy];
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
  }
  else
  {
    if (v14) {
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_144(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_3(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  int v12 = _ValidateTemplate(v3, [*(id *)(a1 + 32) family]);
  long long v13 = CLKLoggingObjectForDomain(1);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    id v23 = [v3 finalizedCopy];
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
  }
  else
  {
    if (v14) {
      __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_1(v13, v15, v16, v17, v18, v19, v20, v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getComplicationDescriptorsWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C599000, v6, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getComplicationDescriptorsWithHandler:", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke;
  v12[3] = &unk_26440EF40;
  id v13 = v5;
  SEL v14 = a2;
  id v7 = v5;
  uint64_t v8 = (void *)MEMORY[0x21D4AACC0](v12);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke_150;
  v10[3] = &unk_26440EF18;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 count];
  if (v4 >= 0x33)
  {
    unint64_t v5 = v4;
    uint64_t v6 = CLKLoggingObjectForDomain(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
      *(_DWORD *)buf = 138412802;
      id v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = &unk_26CCDC0E8;
      _os_log_impl(&dword_21C599000, v6, OS_LOG_TYPE_DEFAULT, "%@ -- too many complication descriptors provided (%@; limit = %@). Excess descriptors will be discarded.",
        buf,
        0x20u);
    }
    uint64_t v9 = objc_msgSend(v3, "subarrayWithRange:", 0, 50);

    id v3 = (id)v9;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14++), "validate", (void)v17);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = (void *)[v10 copy];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
}

void __63__CLKComplicationServer_getComplicationDescriptorsWithHandler___block_invoke_150(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 71))
  {
    id v3 = *(void **)(v2 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 getComplicationDescriptorsWithHandler:v4];
  }
  else
  {
    unint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v6 = [v5 objectForInfoDictionaryKey:@"CLKComplicationSupportedFamilies"];
    id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          uint64_t v18 = 0;
          if (CLKComplicationFamilyFromString(v13, &v18))
          {
            uint64_t v14 = [NSNumber numberWithInteger:v18];
            [v7 addObject:v14];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [[CLKComplicationDescriptor alloc] initWithIdentifier:@"CLKDefaultComplicationIdentifier" displayName:&stru_26CCC52F8 supportedFamilies:v7];
    id v23 = v16;
    long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);
  }
}

- (void)handleSharedComplicationDescriptors:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__CLKComplicationServer_handleSharedComplicationDescriptors___block_invoke;
  v6[3] = &unk_26440E608;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __61__CLKComplicationServer_handleSharedComplicationDescriptors___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 72))
  {
    id v4 = *(void **)(v3 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 handleSharedComplicationDescriptors:v5];
  }
  return result;
}

- (void)notifyDebugTimeoutWithCharging:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = CLKLoggingObjectForDomain(7);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      -[CLKComplicationServer notifyDebugTimeoutWithCharging:]();
    }
  }
  else if (v5)
  {
    -[CLKComplicationServer notifyDebugTimeoutWithCharging:]();
  }
}

- (void)getWidgetMigrationConfigurationFrom:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CLKLoggingObjectForDomain(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, "CLKComplicationServer: -getWidgetMigrationConfigurationFrom:withHandler:", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke;
  block[3] = &unk_26440ED88;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createDataSourceIfNecessary];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2;
  v20[3] = &unk_26440ED60;
  id v21 = *(id *)(a1 + 48);
  uint64_t v2 = (void (**)(void))MEMORY[0x21D4AACC0](v20);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 73))
  {
    id v4 = [*(id *)(v3 + 32) widgetMigrator];
    BOOL v5 = CLKLoggingObjectForDomain(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_2();
    }

    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    long long v17 = __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_157;
    uint64_t v18 = &unk_26440EF68;
    id v19 = *(id *)(a1 + 48);
    id v6 = CLKComplicationWidgetMigrationConfigurationAssertionBlock(&v15, v2, 0, @"-[CLKComplicationServer getWidgetMigrationConfigurationFrom:withHandler:]");
    objc_msgSend(v4, "getWidgetConfigurationFrom:completionHandler:", *(void *)(a1 + 40), v6, v15, v16, v17, v18);
  }
  else
  {
    id v7 = CLKLoggingObjectForDomain(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    v2[2](v2);
  }
}

uint64_t __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CLKLoggingObjectForDomain(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = CLKLoggingObjectForDomain(3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_157_cold_2();
    }

    uint64_t v13 = [v3 _internalCopy];
  }
  else
  {
    if (v5) {
      __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_157_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v13 = 0;
    uint64_t v3 = v4;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateFinalizationQueue, 0);
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)_init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "complication server failed to register for restart notifications: %d", (uint8_t *)v2, 8u);
}

void __42__CLKComplicationServer__createConnection__block_invoke_91_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21C599000, v0, v1, "Complication server connection invalidated. You may lack the entitlement to look up the mach service, or there may have been an encoding error. Did the client invalidate the connection intentionally?", v2, v3, v4, v5, v6);
}

void __87__CLKComplicationServer_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21C599000, v0, v1, "Validating complication timeline entries synchronously because the debugger is attached. In a live environment, this will be asynchronous", v2, v3, v4, v5, v6);
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__CLKComplicationServer_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_140_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)notifyDebugTimeoutWithCharging:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21C599000, v0, v1, "Active CLKComplicationDataSource query timed out - this will be ignored because the process is being debugged on power, but in a production environment this may result in your complication no longer updating", v2, v3, v4, v5, v6);
}

- (void)notifyDebugTimeoutWithCharging:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21C599000, v0, v1, "Active CLKComplicationDataSource query timed out! Too many timeouts will deny your app future complication updates until it is foregrounded.", v2, v3, v4, v5, v6);
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[CLKComplicationServer getWidgetMigrationConfigurationFrom:withHandler:]_block_invoke";
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21C599000, v0, OS_LOG_TYPE_DEBUG, "%s asking widget migrator for widget migration configuration: %@", (uint8_t *)&v1, 0x16u);
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_157_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CLKComplicationServer_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_157_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[CLKComplicationServer getWidgetMigrationConfigurationFrom:withHandler:]_block_invoke";
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21C599000, v0, OS_LOG_TYPE_DEBUG, "%s calling handler with widget migration configuration: %@", (uint8_t *)&v1, 0x16u);
}

@end