@interface CDMDAGBaseService
+ (BOOL)isAssetRequired;
+ (BOOL)isEnabled;
+ (id)getAssetFactorToFoldersMapping;
+ (id)getCDMServiceAssetConfig;
+ (id)xpcActivitySupported;
+ (id)xpcEventStreamsSupported;
+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5;
+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6;
- (BOOL)isSetupRerunNeededForRequest:(id)a3;
- (CDMDAGBaseService)initWithConfig:(id)a3;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)supportedCommands;
- (void)_handleSetupRequest:(id)a3 withCallback:(id)a4;
- (void)_handleWarmupRequest:(id)a3 withCallback:(id)a4;
- (void)handleCommand:(id)a3 withCallback:(id)a4;
@end

@implementation CDMDAGBaseService

- (CDMDAGBaseService)initWithConfig:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDMDAGBaseService;
  return [(CDMBaseService *)&v4 initWithConfig:a3];
}

- (id)supportedCommands
{
  v3 = (void *)MEMORY[0x263EFF9C0];
  objc_super v4 = [(CDMDAGBaseService *)self handleRequestCommandTypeNames];
  v5 = [v3 setWithSet:v4];

  if (objc_opt_respondsToSelector())
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v5 addObject:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v5 addObject:v9];
  }
  v13.receiver = self;
  v13.super_class = (Class)CDMDAGBaseService;
  v10 = [(CDMBaseService *)&v13 supportedCommands];
  v11 = [v10 setByAddingObjectsFromSet:v5];

  return v11;
}

+ (id)getCDMServiceAssetConfig
{
  return 0;
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)handleCommand:(id)a3 withCallback:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 commandName];
    *(_DWORD *)buf = 136315394;
    v12 = "-[CDMDAGBaseService handleCommand:withCallback:]";
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CDMDAGBaseService *)self _handleSetupRequest:v6 withCallback:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CDMDAGBaseService *)self _handleWarmupRequest:v6 withCallback:v7];
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CDMDAGBaseService;
      [(CDMBaseService *)&v10 handleCommand:v6 withCallback:v7];
    }
  }
}

- (void)_handleSetupRequest:(id)a3 withCallback:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (([(id)objc_opt_class() isEnabled] & 1) == 0)
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(CDMBaseService *)self serviceName];
      *(_DWORD *)buf = 136315394;
      v37 = "-[CDMDAGBaseService _handleSetupRequest:withCallback:]";
      __int16 v38 = 2112;
      v39 = v29;
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Skipping handleSetupRequest as this service is DISABLED: %@", buf, 0x16u);
    }
    self->super._serviceState = 4;
    uint64_t v12 = [(CDMBaseService *)self createSetupResponseCommand];
    goto LABEL_8;
  }
  if (self->super._serviceState != 2) {
    goto LABEL_10;
  }
  setupLanguageCode = self->_setupLanguageCode;
  v9 = [v6 dynamicConfig];
  objc_super v10 = [v9 languageCode];
  if (setupLanguageCode != v10)
  {

    goto LABEL_10;
  }
  v14 = [v6 dynamicConfig];
  BOOL v15 = [(CDMDAGBaseService *)self isSetupRerunNeededForRequest:v14];

  if (!v15)
  {
    v28 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = [(CDMBaseService *)self serviceName];
      *(_DWORD *)buf = 136315394;
      v37 = "-[CDMDAGBaseService _handleSetupRequest:withCallback:]";
      __int16 v38 = 2112;
      v39 = v30;
      _os_log_debug_impl(&dword_2263A0000, v28, OS_LOG_TYPE_DEBUG, "%s Skipping handleSetupRequest as this service already in READY state, locale does not change, and the service does not need re-setup: %@", buf, 0x16u);
    }
    uint64_t v12 = [(CDMBaseService *)self createSetupResponseCommand];
LABEL_8:
    __int16 v13 = (void *)v12;
    v7[2](v7, v12, 0);

    goto LABEL_17;
  }
LABEL_10:
  v16 = CDMOSLoggerForCategory(4);
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  v18 = CDMOSLoggerForCategory(4);
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = [(CDMBaseService *)self serviceName];
    *(_DWORD *)buf = 138543362;
    v37 = v20;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "DAGServiceSetup", "%{public}@ setup", buf, 0xCu);
  }
  v21 = [v6 dynamicConfig];
  v22 = [v21 languageCode];
  v23 = self->_setupLanguageCode;
  self->_setupLanguageCode = v22;

  v24 = [v6 dynamicConfig];
  currentConfig = self->_currentConfig;
  self->_currentConfig = v24;

  objc_initWeak((id *)buf, self);
  objc_initWeak(location, v7);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __54__CDMDAGBaseService__handleSetupRequest_withCallback___block_invoke;
  v31[3] = &unk_2647A5010;
  objc_copyWeak(&v33, (id *)buf);
  id v32 = v6;
  objc_copyWeak(&v34, location);
  +[CDMExceptionUtils runWrappingCppExceptions:v31];
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)buf);
  v26 = CDMOSLoggerForCategory(4);
  v27 = v26;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v27, OS_SIGNPOST_INTERVAL_END, v17, "DAGServiceSetup", "", buf, 2u);
  }

LABEL_17:
}

void __55__CDMDAGBaseService__handleWarmupRequest_withCallback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) warmup:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_handleWarmupRequest:(id)a3 withCallback:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() isEnabled] & 1) == 0)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v16 = [(CDMBaseService *)self serviceName];
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMDAGBaseService _handleWarmupRequest:withCallback:]";
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Skipping handleWarmupRequest as this service is DISABLED: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  if (self->super._serviceState == 4)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [(CDMBaseService *)self serviceName];
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMDAGBaseService _handleWarmupRequest:withCallback:]";
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping handleWarmupRequest as this service is in failed setup state: %@", buf, 0x16u);
    }
LABEL_7:

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_15;
  }
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v11 = (id)CDMLogContext;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    __int16 v13 = [(CDMBaseService *)self serviceName];
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DAGServiceWarmup", "%{public}@ warmup", buf, 0xCu);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__CDMDAGBaseService__handleWarmupRequest_withCallback___block_invoke;
  v17[3] = &unk_2647A5038;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  +[CDMExceptionUtils runWrappingCppExceptions:v17];

  v14 = (id)CDMLogContext;
  BOOL v15 = v14;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v15, OS_SIGNPOST_INTERVAL_END, v10, "DAGServiceWarmup", "", buf, 2u);
  }

LABEL_15:
}

+ (id)xpcEventStreamsSupported
{
  return (id)[MEMORY[0x263EFFA08] set];
}

+ (id)xpcActivitySupported
{
  return (id)[MEMORY[0x263EFFA08] set];
}

void __54__CDMDAGBaseService__handleSetupRequest_withCallback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [WeakRetained setup:*(void *)(a1 + 32)];

  if (v7)
  {
    v3 = (id *)(a1 + 48);
    id v4 = objc_loadWeakRetained(v3);

    if (v4)
    {
      v5 = (void (**)(id, id, void *))objc_loadWeakRetained(v3);
      id v6 = [v7 cmdError];
      v5[2](v5, v7, v6);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_setupLanguageCode, 0);
}

- (id)handleRequestCommandTypeNames
{
  return 0;
}

- (id)setup:(id)a3
{
  return 0;
}

- (BOOL)isSetupRerunNeededForRequest:(id)a3
{
  return ![(CDMDynamicConfig *)self->_currentConfig isEqualWithoutSandboxId:a3];
}

- (id)handle:(id)a3
{
  return 0;
}

+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    os_signpost_id_t v10 = "+[CDMDAGBaseService handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: handleXPCEvent called on a service that does not implement this method.", (uint8_t *)&v9, 0xCu);
  }

  [a1 doesNotRecognizeSelector:a2];
}

+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "+[CDMDAGBaseService handleXPCActivity:withAssets:withSelfMetadata:]";
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: handleXPCActivity called on a service that does not implement this method.", (uint8_t *)&v8, 0xCu);
  }

  [a1 doesNotRecognizeSelector:a2];
}

+ (id)getAssetFactorToFoldersMapping
{
  return 0;
}

+ (BOOL)isAssetRequired
{
  return 1;
}

@end