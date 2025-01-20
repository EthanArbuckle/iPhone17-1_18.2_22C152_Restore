@interface WFTrueToneSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (CBAdaptationClient)adaptationClient;
- (CBClient)brightnessClient;
- (WFTrueToneSettingsClient)initWithBrightnessClient:(id)a3 adaptationClient:(id)a4;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFTrueToneSettingsClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptationClient, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

- (CBClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *))a4;
  v7 = [(WFTrueToneSettingsClient *)self adaptationClient];
  char v8 = [v7 available];

  if ((v8 & 1) == 0)
  {
LABEL_10:
    v13 = WFSettingsClientError();
    v6[2](v6, v13);

    goto LABEL_11;
  }
  v9 = [(WFTrueToneSettingsClient *)self adaptationClient];
  int v10 = [v9 setEnabled:v4];

  v11 = getWFActionsLogObject();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[WFTrueToneSettingsClient setState:completionHandler:]";
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_ERROR, "%s Failed to set True Tone state to: %d", (uint8_t *)&v14, 0x12u);
    }

    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[WFTrueToneSettingsClient setState:completionHandler:]";
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_DEFAULT, "%s Successfully set True Tone state to: %d", (uint8_t *)&v14, 0x12u);
  }

  v6[2](v6, 0);
LABEL_11:
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(WFTrueToneSettingsClient *)self adaptationClient];
  char v6 = [v5 available];

  if (v6)
  {
    v7 = [(WFTrueToneSettingsClient *)self adaptationClient];
    uint64_t v8 = [v7 getEnabled];

    v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "-[WFTrueToneSettingsClient getStateWithCompletionHandler:]";
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_DEFAULT, "%s Current True Tone State: %d", (uint8_t *)&v12, 0x12u);
    }

    v4[2](v4, v8, 0);
  }
  else
  {
    int v10 = getWFActionsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[WFTrueToneSettingsClient getStateWithCompletionHandler:]";
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_ERROR, "%s True Tone is not currently available", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v11 = WFSettingsClientError();
    v4[2](v4, 0, v11);

    BOOL v4 = (void (**)(id, uint64_t, void))v11;
  }
}

- (WFTrueToneSettingsClient)initWithBrightnessClient:(id)a3 adaptationClient:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFTrueToneSettingsClient.m", 133, @"Invalid parameter not satisfying: %@", @"brightnessClient" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  int v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WFTrueToneSettingsClient.m", 134, @"Invalid parameter not satisfying: %@", @"adaptationClient" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFTrueToneSettingsClient;
  uint64_t v11 = [(WFTrueToneSettingsClient *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_brightnessClient, a3);
    objc_storeStrong((id *)&v12->_adaptationClient, a4);
  }

  return v12;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v8 = a3;
  id v4 = objc_alloc_init((Class)getCBClientClass_22998());
  v5 = [v4 adaptationClient];
  if (v5 && ([getCBClientClass_22998() supportsAdaptation] & 1) != 0)
  {
    char v6 = (void *)[objc_alloc((Class)a1) initWithBrightnessClient:v4 adaptationClient:v5];
    v7 = (void (*)(void))v8[2];
  }
  else
  {
    char v6 = WFSettingsClientError();
    v7 = (void (*)(void))v8[2];
  }
  v7();
}

@end