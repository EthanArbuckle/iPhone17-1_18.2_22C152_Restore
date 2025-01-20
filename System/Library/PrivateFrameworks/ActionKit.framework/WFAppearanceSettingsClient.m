@interface WFAppearanceSettingsClient
+ (id)appearanceStream;
+ (id)reversalArbiter;
+ (void)createClientWithCompletionHandler:(id)a3;
+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3;
+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4;
- (UISUserInterfaceStyleMode)styleMode;
- (WFAppearanceSettingsClient)initWithStyleMode:(id)a3;
- (int64_t)currentAppearance;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setAppearance:(int64_t)a3 completionHandler:(id)a4;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFAppearanceSettingsClient

- (void).cxx_destruct
{
}

- (UISUserInterfaceStyleMode)styleMode
{
  return self->_styleMode;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WFAppearanceSettingsClient_setState_completionHandler___block_invoke;
  v8[3] = &unk_264E5A380;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a3;
  id v7 = v6;
  [(WFAppearanceSettingsClient *)self getStateWithCompletionHandler:v8];
}

void __57__WFAppearanceSettingsClient_setState_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F2A0E0]);
    if (a2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    id v11 = (id)[v6 initWithState:v7 reason:0];
    v8 = [(id)objc_opt_class() appearanceStream];
    id v9 = [v8 source];
    [v9 sendEvent:v11];

    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    [*(id *)(a1 + 32) setAppearance:v10 completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)getStateWithCompletionHandler:(id)a3
{
  id v8 = a3;
  int64_t v4 = [(WFAppearanceSettingsClient *)self currentAppearance];
  if (v4 == 2)
  {
    uint64_t v7 = (void (*)(void))*((void *)v8 + 2);
LABEL_7:
    v7();
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    uint64_t v7 = (void (*)(void))*((void *)v8 + 2);
    goto LABEL_7;
  }
  v5 = v8;
  if (v4) {
    goto LABEL_9;
  }
  id v6 = WFSettingsClientError();
  (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v6);

LABEL_8:
  v5 = v8;
LABEL_9:
}

- (int64_t)currentAppearance
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  getUISCurrentUserInterfaceStyleValueClass();
  v2 = objc_opt_new();
  uint64_t v3 = [v2 userInterfaceStyle];
  int64_t v4 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[WFAppearanceSettingsClient currentAppearance]";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_INFO, "%s Retrieved current appearance: %ld", (uint8_t *)&v7, 0x16u);
  }

  if (v3 == 2) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = 2 * (v3 == 1);
  }

  return v5;
}

- (void)setAppearance:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  int v7 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "-[WFAppearanceSettingsClient setAppearance:completionHandler:]";
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Applying device appearance style %ld", (uint8_t *)&v16, 0x16u);
  }

  if (a3)
  {
    id v8 = [(WFAppearanceSettingsClient *)self styleMode];
    uint64_t v9 = [v8 modeValue];
    unsigned int v10 = softLinkUISUserInterfaceStyleModeValueIsAutomatic(v9);

    if (a3 == 1) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    v12 = [(WFAppearanceSettingsClient *)self styleMode];
    v13 = v12;
    if (v10) {
      objc_msgSend(v12, "setOverride:", v11, 1);
    }
    else {
      [v12 setModeValue:v11];
    }

    v6[2](v6, 0);
  }
  else
  {
    v14 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[WFAppearanceSettingsClient setAppearance:completionHandler:]";
      _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_ERROR, "%s Tried to set unknown appearance!", (uint8_t *)&v16, 0xCu);
    }

    v15 = WFSettingsClientError();
    ((void (**)(id, void *))v6)[2](v6, v15);
  }
}

- (WFAppearanceSettingsClient)initWithStyleMode:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFAppearanceSettingsClient.m", 81, @"Invalid parameter not satisfying: %@", @"styleMode" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFAppearanceSettingsClient;
  int v7 = [(WFAppearanceSettingsClient *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_styleMode, a3);
    uint64_t v9 = v8;
  }

  return v8;
}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 reversalArbiter];
  uint64_t v9 = [v7 biomeBookmark];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__WFAppearanceSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_264E5A3D0;
  id v12 = v6;
  id v10 = v6;
  [v8 getReversalStateWithBookmark:v9 completionHandler:v11];
}

void __77__WFAppearanceSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = [a2 state] == 2;
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = [NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v6, 0);
  }
  else
  {
    int64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int64_t v5 = [a1 reversalArbiter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__WFAppearanceSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5A3A8;
  id v8 = v4;
  id v6 = v4;
  [v5 getBookmarkForCurrentStateWithCompletionHandler:v7];
}

void __78__WFAppearanceSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  id v4 = [a1 appearanceStream];
  id v5 = (void *)[v3 initWithBiomeStream:v4];

  return v5;
}

+ (id)appearanceStream
{
  v2 = BiomeLibrary();
  id v3 = [v2 Device];
  id v4 = [v3 Display];
  id v5 = [v4 Appearance];

  return v5;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4 = (Class (__cdecl *)())getUISUserInterfaceStyleModeClass;
  id v5 = (void (**)(id, void *, void))a3;
  id v7 = (id)[objc_alloc(v4()) initWithDelegate:0];
  if (v7)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithStyleMode:v7];
    v5[2](v5, v6, 0);
  }
  else
  {
    uint64_t v6 = WFSettingsClientError();
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v6);
  }
}

@end