@interface WFNightShiftSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (CBBlueLightClient)blueLightClient;
- (WFNightShiftSettingsClient)initWithBlueLightClient:(id)a3;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFNightShiftSettingsClient

- (void).cxx_destruct
{
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void))a4;
  v7 = [(WFNightShiftSettingsClient *)self blueLightClient];
  int v8 = [v7 setEnabled:v4];

  v9 = getWFActionsLogObject();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "-[WFNightShiftSettingsClient setState:completionHandler:]";
      __int16 v14 = 1024;
      BOOL v15 = v4;
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_DEFAULT, "%s Set Night Shift State: %d", (uint8_t *)&v12, 0x12u);
    }

    v6[2](v6, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[WFNightShiftSettingsClient setState:completionHandler:]";
      __int16 v14 = 1024;
      BOOL v15 = v4;
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_ERROR, "%s Failed to set Night Shift state to: %d", (uint8_t *)&v12, 0x12u);
    }

    uint64_t v11 = WFSettingsClientError();
    v6[2](v6, v11);

    v6 = (void (**)(id, void))v11;
  }
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFNightShiftSettingsClient *)self blueLightClient];
  int v6 = [v5 getBlueLightStatus:&v10];

  v7 = getWFActionsLogObject();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v12 = "-[WFNightShiftSettingsClient getStateWithCompletionHandler:]";
      __int16 v13 = 1024;
      int v14 = BYTE1(v10);
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_DEFAULT, "%s Current Night Shift State: %d", buf, 0x12u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, BYTE1(v10), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[WFNightShiftSettingsClient getStateWithCompletionHandler:]";
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch current Night Shift state", buf, 0xCu);
    }

    uint64_t v9 = WFSettingsClientError();
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, v9);

    id v4 = (id)v9;
  }
}

- (WFNightShiftSettingsClient)initWithBlueLightClient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    long long v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFNightShiftSettingsClient.m", 50, @"Invalid parameter not satisfying: %@", @"blueLightClient" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WFNightShiftSettingsClient;
  v7 = [(WFNightShiftSettingsClient *)&v11 init];
  int v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_blueLightClient, a3);
  }

  return v8;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  int v8 = a3;
  id v4 = objc_alloc_init((Class)getCBClientClass());
  v5 = [v4 blueLightClient];
  if (v5 && ([getCBClientClass() supportsBlueLightReduction] & 1) != 0)
  {
    id v6 = (void *)[objc_alloc((Class)a1) initWithBlueLightClient:v5];
    v7 = (void (*)(void))v8[2];
  }
  else
  {
    id v6 = WFSettingsClientError();
    v7 = (void (*)(void))v8[2];
  }
  v7();
}

@end