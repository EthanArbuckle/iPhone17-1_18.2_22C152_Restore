@interface AXBHoverTextManager
+ (void)initializeMonitor;
- (void)setHoverTextEnabled:(BOOL)a3 isTyping:(BOOL)a4;
- (void)updateHoverTextSettings;
- (void)updateHoverTypingSettings;
@end

@implementation AXBHoverTextManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_10 != -1) {
    dispatch_once(&initializeMonitor_onceToken_10, &__block_literal_global_19);
  }
}

void __40__AXBHoverTextManager_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBHoverTextManager);
  v1 = (void *)_SharedManager_4;
  _SharedManager_4 = (uint64_t)v0;

  [(id)_SharedManager_4 updateHoverTextSettings];
  [(id)_SharedManager_4 updateHoverTypingSettings];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F8B248];
  v4 = [MEMORY[0x263F08A48] mainQueue];
  id v5 = (id)[v2 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_270_4];

  if (AXHasCapability())
  {
    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F8B288];
    v7 = [MEMORY[0x263F08A48] mainQueue];
    id v8 = (id)[v9 addObserverForName:v6 object:0 queue:v7 usingBlock:&__block_literal_global_275];
  }
}

uint64_t __40__AXBHoverTextManager_initializeMonitor__block_invoke_2()
{
  return [(id)_SharedManager_4 updateHoverTextSettings];
}

uint64_t __40__AXBHoverTextManager_initializeMonitor__block_invoke_3()
{
  return [(id)_SharedManager_4 updateHoverTypingSettings];
}

- (void)setHoverTextEnabled:(BOOL)a3 isTyping:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v6 = _os_feature_enabled_impl();
  v7 = HTLogCommon();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"disable";
      if (v5) {
        id v9 = @"enable";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_241F5C000, v8, OS_LOG_TYPE_DEFAULT, "HoverText monitor asked to %@ HoverText. isTyping = %i", buf, 0x12u);
    }

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v10 = (void (*)(void))getHoverTextObjcSymbolLoc_ptr;
    v23 = getHoverTextObjcSymbolLoc_ptr;
    if (!getHoverTextObjcSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getHoverTextObjcSymbolLoc_block_invoke;
      v25 = &unk_26510B818;
      v26 = &v20;
      __getHoverTextObjcSymbolLoc_block_invoke((uint64_t)buf);
      v10 = (void (*)(void))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v10) {
      -[AXBHoverTextManager setHoverTextEnabled:isTyping:]();
    }
    v11 = v10();
    id v8 = v11;
    if (v5)
    {
      if (v4)
      {
        v19 = 0;
        char v12 = [v11 startHoverTextTypingAndReturnError:&v19];
        v13 = v19;
      }
      else
      {
        v18 = 0;
        char v12 = [v11 startHoverTextAndReturnError:&v18];
        v13 = v18;
      }
    }
    else if (v4)
    {
      v17 = 0;
      char v12 = [v11 stopHoverTextTypingAndReturnError:&v17];
      v13 = v17;
    }
    else
    {
      v16 = 0;
      char v12 = [v11 stopHoverTextAndReturnError:&v16];
      v13 = v16;
    }
    id v14 = v13;
    if ((v12 & 1) == 0)
    {
      v15 = HTLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AXBHoverTextManager setHoverTextEnabled:isTyping:]((uint64_t)v14, v15);
      }
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241F5C000, v8, OS_LOG_TYPE_INFO, "Asked to enable/disable HoverText but feature flag is off, so no", buf, 2u);
  }
}

- (void)updateHoverTextSettings
{
  v2 = (void *)_SharedManager_4;
  BOOL v3 = _AXSHoverTextEnabled() != 0;

  [v2 setHoverTextEnabled:v3 isTyping:0];
}

- (void)updateHoverTypingSettings
{
  v2 = (void *)_SharedManager_4;
  BOOL v3 = _AXSHoverTextTypingEnabled() != 0;

  [v2 setHoverTextEnabled:v3 isTyping:1];
}

- (void)setHoverTextEnabled:isTyping:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"id<HoverTextServiceProtocolObjC> HoverTextObjc_Soft(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBHoverTextManager.m", 25, @"%s", dlerror());

  __break(1u);
}

- (void)setHoverTextEnabled:(uint64_t)a1 isTyping:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Error toggling HoverText: %@", (uint8_t *)&v2, 0xCu);
}

@end