@interface AXBLiveSpeechManager
+ (void)initializeMonitor;
- (void)setLiveSpeechEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBLiveSpeechManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_3 != -1) {
    dispatch_once(&initializeMonitor_onceToken_3, &__block_literal_global_9);
  }
}

void __41__AXBLiveSpeechManager_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBLiveSpeechManager);
  v1 = (void *)_SharedManager_0;
  _SharedManager_0 = (uint64_t)v0;

  if (_AXSLiveSpeechEnabled()) {
    _AXSLiveSpeechSetEnabled();
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v2 = *MEMORY[0x263F8B2E8];
  v3 = [MEMORY[0x263F08A48] mainQueue];
  id v4 = (id)[v5 addObserverForName:v2 object:0 queue:v3 usingBlock:&__block_literal_global_270_1];
}

uint64_t __41__AXBLiveSpeechManager_initializeMonitor__block_invoke_2()
{
  return [(id)_SharedManager_0 updateSettings];
}

- (void)setLiveSpeechEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v5 = _os_feature_enabled_impl();
  v6 = LiveSpeechLogCommon();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_INFO, "Asked to enable/disable LiveSpeech but feature flag is off, so no", buf, 2u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithBool:self->_wasEverEnabled];
    *(_DWORD *)buf = 134218242;
    BOOL v13 = v3;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_DEFAULT, "LiveSpeech monitor asked to enable LiveSpeech: %ld (was ever enabled: %@)", buf, 0x16u);
  }
  if (v3)
  {
    id v11 = 0;
    [getLiveSpeechServicesObjcClass() startLiveSpeechAndReturnError:&v11];
    v7 = v11;
    self->_wasEverEnabled = 1;
    if (!v7) {
      return;
    }
    goto LABEL_11;
  }
  if (self->_wasEverEnabled)
  {
    id v10 = 0;
    [getLiveSpeechServicesObjcClass() stopLiveSpeechAndReturnError:&v10];
    v7 = v10;
    self->_wasEverEnabled = 0;
    if (v7)
    {
LABEL_11:
      v9 = LiveSpeechLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXBLiveSpeechManager setLiveSpeechEnabled:]((uint64_t)v7, v9);
      }

LABEL_14:
    }
  }
}

- (void)updateSettings
{
  uint64_t v2 = (void *)_SharedManager_0;
  BOOL v3 = _AXSLiveSpeechEnabled() != 0;

  [v2 setLiveSpeechEnabled:v3];
}

- (void)setLiveSpeechEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Error toggling LiveSpeech: %@", (uint8_t *)&v2, 0xCu);
}

@end