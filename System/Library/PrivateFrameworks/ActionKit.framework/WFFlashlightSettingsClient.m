@interface WFFlashlightSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (AVFlashlight)flashlight;
- (WFFlashlightSettingsClient)initWithFlashlight:(id)a3;
- (void)toggleWithBrightnessLevel:(float)a3 completionHandler:(id)a4;
- (void)turnOffWithCompletionHandler:(id)a3;
- (void)turnOnWithBrightnessLevel:(float)a3 completionHandler:(id)a4;
@end

@implementation WFFlashlightSettingsClient

- (void).cxx_destruct
{
}

- (AVFlashlight)flashlight
{
  return self->_flashlight;
}

- (void)toggleWithBrightnessLevel:(float)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(WFFlashlightSettingsClient *)self flashlight];
  [v7 flashlightLevel];
  float v9 = v8;

  v10 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = @"off";
    if (v9 > 0.0) {
      v11 = @"on";
    }
    int v13 = 136315394;
    v14 = "-[WFFlashlightSettingsClient toggleWithBrightnessLevel:completionHandler:]";
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_INFO, "%s Flashlight is currently %@", (uint8_t *)&v13, 0x16u);
  }

  if (v9 <= 0.0)
  {
    *(float *)&double v12 = a3;
    [(WFFlashlightSettingsClient *)self turnOnWithBrightnessLevel:v6 completionHandler:v12];
  }
  else
  {
    [(WFFlashlightSettingsClient *)self turnOffWithCompletionHandler:v6];
  }
}

- (void)turnOnWithBrightnessLevel:(float)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 == 0.0) {
    float v5 = 0.01;
  }
  else {
    float v5 = a3;
  }
  id v6 = (void (**)(id, id))a4;
  v7 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "-[WFFlashlightSettingsClient turnOnWithBrightnessLevel:completionHandler:]";
    __int16 v14 = 2048;
    double v15 = v5;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Turning flashlight on to level %f", buf, 0x16u);
  }

  float v8 = [(WFFlashlightSettingsClient *)self flashlight];
  id v11 = 0;
  *(float *)&double v9 = v5;
  [v8 setFlashlightLevel:&v11 withError:v9];
  id v10 = v11;

  v6[2](v6, v10);
}

- (void)turnOffWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  float v5 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v13 = "-[WFFlashlightSettingsClient turnOffWithCompletionHandler:]";
    _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_INFO, "%s Turning flashlight off", buf, 0xCu);
  }

  id v6 = [(WFFlashlightSettingsClient *)self flashlight];
  id v11 = 0;
  int v7 = [v6 setFlashlightLevel:&v11 withError:0.0];
  id v8 = v11;

  id v9 = v8;
  if (v7)
  {
    id v10 = [(WFFlashlightSettingsClient *)self flashlight];
    [v10 turnPowerOff];

    id v9 = 0;
  }
  ((void (**)(id, id))v4)[2](v4, v9);
}

- (WFFlashlightSettingsClient)initWithFlashlight:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFFlashlightSettingsClient.m", 64, @"Invalid parameter not satisfying: %@", @"flashlight" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFFlashlightSettingsClient;
  int v7 = [(WFFlashlightSettingsClient *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_flashlight, a3);
    id v9 = v8;
  }

  return v8;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([getAVFlashlightClass() hasFlashlight])
  {
    getAVFlashlightClass();
    id v5 = (id)objc_opt_new();
    if (v5)
    {
      dispatch_time_t v6 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__WFFlashlightSettingsClient_createClientWithCompletionHandler___block_invoke;
      block[3] = &unk_264E5CB08;
      id v5 = v5;
      id v10 = v5;
      id v11 = v4;
      id v12 = a1;
      dispatch_after(v6, MEMORY[0x263EF83A0], block);
    }
    else
    {
      id v8 = WFSettingsClientError();
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
    }
  }
  else
  {
    int v7 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "+[WFFlashlightSettingsClient createClientWithCompletionHandler:]";
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Device has no flashlight", buf, 0xCu);
    }

    WFSettingsClientError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v5);
  }
}

void __64__WFFlashlightSettingsClient_createClientWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isOverheated])
  {
    v2 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "+[WFFlashlightSettingsClient createClientWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_23C364000, v2, OS_LOG_TYPE_ERROR, "%s Flashlight is overheated", buf, 0xCu);
    }
LABEL_11:

    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = WFSettingsClientError();
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);

    return;
  }
  if (([*(id *)(a1 + 32) isAvailable] & 1) == 0)
  {
    v2 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "+[WFFlashlightSettingsClient createClientWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_23C364000, v2, OS_LOG_TYPE_ERROR, "%s Flashlight is unavailable", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v5 = (id)[objc_alloc(*(Class *)(a1 + 48)) initWithFlashlight:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end