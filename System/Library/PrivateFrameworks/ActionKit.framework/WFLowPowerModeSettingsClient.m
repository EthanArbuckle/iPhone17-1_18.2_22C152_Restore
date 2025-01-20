@interface WFLowPowerModeSettingsClient
+ (id)energyModeStream;
+ (id)reversalArbiter;
+ (void)createClientWithCompletionHandler:(id)a3;
+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3;
+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4;
- (WFLowPowerModeSettingsClient)initWithLowPowerMode:(id)a3;
- (_PMLowPowerMode)lowPowerMode;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFLowPowerModeSettingsClient

- (void).cxx_destruct
{
}

- (_PMLowPowerMode)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFLowPowerModeSettingsClient_setState_completionHandler___block_invoke;
  v8[3] = &unk_264E5A380;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  [(WFLowPowerModeSettingsClient *)self getStateWithCompletionHandler:v8];
}

void __59__WFLowPowerModeSettingsClient_setState_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F2A0E8]);
    if (a2) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    v8 = (void *)[v6 initWithMode:v7 reason:0];
    id v9 = [(id)objc_opt_class() energyModeStream];
    BOOL v10 = [v9 source];
    [v10 sendEvent:v8];

    uint64_t v11 = *(unsigned __int8 *)(a1 + 48);
    v12 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v13 = (void *)getkPMLPMSourceSiriSymbolLoc_ptr;
    uint64_t v33 = getkPMLPMSourceSiriSymbolLoc_ptr;
    if (!getkPMLPMSourceSiriSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkPMLPMSourceSiriSymbolLoc_block_invoke;
      v35 = &unk_264E5EC88;
      v36 = &v30;
      v14 = LowPowerModeLibrary();
      v15 = dlsym(v14, "kPMLPMSourceSiri");
      *(void *)(v36[1] + 24) = v15;
      getkPMLPMSourceSiriSymbolLoc_ptr = *(void *)(v36[1] + 24);
      v13 = (void *)v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v13)
    {
      v28 = [MEMORY[0x263F08690] currentHandler];
      v29 = [NSString stringWithUTF8String:"NSString *getkPMLPMSourceSiri(void)"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"WFLowPowerModeSettingsClient.m", 24, @"%s", dlerror());

      __break(1u);
    }
    if ([v12 setPowerMode:v11 fromSource:*v13])
    {
      v16 = [(id)objc_opt_class() reversalArbiter];
      int v17 = [v16 lastEventEquals:v8];

      if (v17)
      {
        v18 = getWFBundledIntentsLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[WFLowPowerModeSettingsClient setState:completionHandler:]_block_invoke";
          _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_INFO, "%s powerd doesn't seem to be writing to Biome, handling the write ourselves", buf, 0xCu);
        }

        id v19 = objc_alloc(MEMORY[0x263F2A0E8]);
        if (*(unsigned char *)(a1 + 48)) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = 2;
        }
        v21 = (void *)[v19 initWithMode:v20 reason:2];
        v22 = [(id)objc_opt_class() energyModeStream];
        v23 = [v22 source];
        [v23 sendEvent:v21];
      }
      v24 = getWFBundledIntentsLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFLowPowerModeSettingsClient setState:completionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v25;
        _os_log_impl(&dword_23C364000, v24, OS_LOG_TYPE_INFO, "%s Set Low Power Mode state to %d", buf, 0x12u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v26 = *(void *)(a1 + 40);
      v27 = WFSettingsClientError();
      (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
    }
  }
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08AB0];
  v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = [v3 processInfo];
  uint64_t v6 = [v5 isLowPowerModeEnabled];

  uint64_t v7 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[WFLowPowerModeSettingsClient getStateWithCompletionHandler:]";
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Retrieved Low Power Mode state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (WFLowPowerModeSettingsClient)initWithLowPowerMode:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFLowPowerModeSettingsClient.m", 52, @"Invalid parameter not satisfying: %@", @"lowPowerMode" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFLowPowerModeSettingsClient;
  uint64_t v7 = [(WFLowPowerModeSettingsClient *)&v12 init];
  int v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_lowPowerMode, a3);
    id v9 = v8;
  }

  return v8;
}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [a1 reversalArbiter];
  id v9 = [v7 biomeBookmark];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__WFLowPowerModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_264E566D8;
  id v12 = v6;
  id v10 = v6;
  [v8 getReversalStateWithBookmark:v9 completionHandler:v11];
}

void __79__WFLowPowerModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = [a2 mode] == 1;
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = [NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v6, 0);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 reversalArbiter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__WFLowPowerModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5A3A8;
  id v8 = v4;
  id v6 = v4;
  [v5 getBookmarkForCurrentStateWithCompletionHandler:v7];
}

void __80__WFLowPowerModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F86E58]) initWithBiomeBookmark:v5];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

+ (id)reversalArbiter
{
  id v3 = objc_alloc(MEMORY[0x263F86E50]);
  id v4 = [a1 energyModeStream];
  id v5 = (void *)[v3 initWithBiomeStream:v4];

  return v5;
}

+ (id)energyModeStream
{
  v2 = BiomeLibrary();
  id v3 = [v2 Device];
  id v4 = [v3 Power];
  id v5 = [v4 EnergyMode];

  return v5;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)get_PMLowPowerModeClass_softClass;
  uint64_t v13 = get_PMLowPowerModeClass_softClass;
  if (!get_PMLowPowerModeClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __get_PMLowPowerModeClass_block_invoke;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __get_PMLowPowerModeClass_block_invoke((uint64_t)v9);
    id v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [v6 sharedInstance];
  if (v7)
  {
    id v8 = (void *)[objc_alloc((Class)a1) initWithLowPowerMode:v7];
    v4[2](v4, v8, 0);
  }
  else
  {
    id v8 = WFSettingsClientError();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v8);
  }
}

@end