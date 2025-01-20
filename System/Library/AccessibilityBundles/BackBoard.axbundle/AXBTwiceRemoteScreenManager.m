@interface AXBTwiceRemoteScreenManager
+ (void)initializeMonitor;
- (BOOL)started;
- (void)setStarted:(BOOL)a3;
- (void)setTwiceRemoteScreenEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBTwiceRemoteScreenManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_13 != -1) {
    dispatch_once(&initializeMonitor_onceToken_13, &__block_literal_global_22);
  }
}

void __48__AXBTwiceRemoteScreenManager_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBTwiceRemoteScreenManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

  [(id)_sharedManager updateSettings];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v2 = *MEMORY[0x263F8B3D0];
  v3 = [MEMORY[0x263F08A48] mainQueue];
  id v4 = (id)[v5 addObserverForName:v2 object:0 queue:v3 usingBlock:&__block_literal_global_270_5];
}

uint64_t __48__AXBTwiceRemoteScreenManager_initializeMonitor__block_invoke_2()
{
  return [(id)_sharedManager updateSettings];
}

- (void)setTwiceRemoteScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (([(id)_sharedManager started] & 1) != 0 || v3)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v6 = (uint64_t (*)(uint64_t))getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr;
    v21 = getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr;
    if (!getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v23 = __getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_block_invoke;
      v24 = &unk_26510B818;
      v25 = &v18;
      v7 = (void *)AXWatchRemoteScreenServicesLibrary();
      v8 = dlsym(v7, "AXWatchRemoteScreenIsTwiceFeatureOn");
      *(void *)(v25[1] + 24) = v8;
      getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
      v6 = (uint64_t (*)(uint64_t))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v6) {
      -[AXBTwiceRemoteScreenManager setTwiceRemoteScreenEnabled:]();
    }
    char v10 = v6(v9);
    v11 = AXLogTwiceRemoteScreen();
    id v4 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v3;
        _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_DEFAULT, "[TWICE] Twice monitor - enable: %ld", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend((id)_sharedManager, "setStarted:", 1, v18);
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      v12 = (void (*)(uint64_t))getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr;
      v21 = getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr;
      if (!getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v23 = __getAXTwiceRemoteScreenServiceObjcSymbolLoc_block_invoke;
        v24 = &unk_26510B818;
        v25 = &v18;
        v13 = (void *)AXWatchRemoteScreenServicesLibrary();
        v14 = dlsym(v13, "AXTwiceRemoteScreenServiceObjc");
        *(void *)(v25[1] + 24) = v14;
        getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
        v12 = (void (*)(uint64_t))v19[3];
      }
      _Block_object_dispose(&v18, 8);
      if (!v12) {
        -[AXBTwiceRemoteScreenManager setTwiceRemoteScreenEnabled:]();
      }
      id v4 = v12(v15);
      -[NSObject npsSetTwiceEnabled:](v4, "npsSetTwiceEnabled:", v3, v18);
      if (v3) {
        char v16 = [v4 startTwiceRemoteScreen];
      }
      else {
        char v16 = [v4 stopTwiceRemoteScreen];
      }
      if ((v16 & 1) == 0)
      {
        v17 = AXLogTwiceRemoteScreen();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[AXBTwiceRemoteScreenManager setTwiceRemoteScreenEnabled:](v17);
        }
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      id v5 = "[TWICE] Feature flag is off";
      goto LABEL_18;
    }
  }
  else
  {
    id v4 = AXLogTwiceRemoteScreen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      id v5 = "[TWICE] Avoid loading AXWatchRemoteScreenServices library";
LABEL_18:
      _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&buf, 2u);
    }
  }
}

- (void)updateSettings
{
  uint64_t v2 = (void *)_sharedManager;
  BOOL v3 = _AXSTwiceRemoteScreenEnabled() != 0;

  [v2 setTwiceRemoteScreenEnabled:v3];
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void)setTwiceRemoteScreenEnabled:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL AXWatchRemoteScreenIsTwiceFeatureOn_Soft(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBTwiceRemoteScreenManager.m", 17, @"%s", dlerror());

  __break(1u);
}

- (void)setTwiceRemoteScreenEnabled:.cold.2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"id<AXWatchRemoteScreenServiceProtocolObjc> AXTwiceRemoteScreenServiceObjc_Soft(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBTwiceRemoteScreenManager.m", 16, @"%s", dlerror());

  __break(1u);
}

- (void)setTwiceRemoteScreenEnabled:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241F5C000, log, OS_LOG_TYPE_ERROR, "[TWICE] Error toggling Twice", v1, 2u);
}

@end