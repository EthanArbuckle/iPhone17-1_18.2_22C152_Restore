@interface AXBLiveCaptionsManager
+ (void)initializeMonitor;
- (void)setLiveCaptionsEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBLiveCaptionsManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_6 != -1) {
    dispatch_once(&initializeMonitor_onceToken_6, &__block_literal_global_12);
  }
}

void __43__AXBLiveCaptionsManager_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBLiveCaptionsManager);
  v1 = (void *)_SharedManager_3;
  _SharedManager_3 = (uint64_t)v0;

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F8B2F0];
  v4 = [MEMORY[0x263F08A48] mainQueue];
  id v5 = (id)[v2 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_270_3];

  dispatch_time_t v6 = dispatch_time(0, 6000000000);
  v7 = MEMORY[0x263EF83A0];

  dispatch_after(v6, v7, &__block_literal_global_272_0);
}

uint64_t __43__AXBLiveCaptionsManager_initializeMonitor__block_invoke_2()
{
  return [(id)_SharedManager_3 updateSettings];
}

uint64_t __43__AXBLiveCaptionsManager_initializeMonitor__block_invoke_3()
{
  return [(id)_SharedManager_3 updateSettings];
}

- (void)updateSettings
{
  v2 = (void *)_SharedManager_3;
  BOOL v3 = _AXSLiveTranscriptionEnabled() != 0;

  [v2 setLiveCaptionsEnabled:v3];
}

- (void)setLiveCaptionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v4 = _os_feature_enabled_impl();
  id v5 = AXLogLiveTranscription();
  dispatch_time_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [NSNumber numberWithBool:v3];
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "LiveCaptions monitor asked to enable LiveCaptions: %@", buf, 0xCu);
    }
    int v8 = AXHasCapability();
    id LiveCaptionsServicesClass = getLiveCaptionsServicesClass();
    if (v3 && v8)
    {
      uint64_t v13 = 0;
      v10 = (id *)&v13;
      [LiveCaptionsServicesClass startLiveCaptionsAndReturnError:&v13];
    }
    else
    {
      uint64_t v12 = 0;
      v10 = (id *)&v12;
      [LiveCaptionsServicesClass stopLiveCaptionsAndReturnError:&v12];
    }
    dispatch_time_t v6 = *v10;
    if (v6)
    {
      v11 = AXLogLiveTranscription();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AXBLiveCaptionsManager setLiveCaptionsEnabled:]((uint64_t)v6, v11);
      }
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_INFO, "Asked to enable/disable LiveCaptions integrated with LiveSpeech but feature flag is off, so no", buf, 2u);
  }
}

- (void)setLiveCaptionsEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Error toggling LiveCaptions: %@", (uint8_t *)&v2, 0xCu);
}

@end