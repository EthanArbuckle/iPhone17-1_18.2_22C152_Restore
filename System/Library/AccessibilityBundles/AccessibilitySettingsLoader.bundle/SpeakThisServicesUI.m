@interface SpeakThisServicesUI
+ (void)disableSpeakThisServices;
+ (void)enableSpeakThisServices;
- (SpeakThisServicesUI)init;
- (void)_handleSpeakThisEnabledStatusDidChangeNotification:(id)a3;
- (void)_kbFrameWillChange:(id)a3;
- (void)_registerForKBFrameNotifications;
- (void)_unregisterForKBFrameNotifications;
@end

@implementation SpeakThisServicesUI

+ (void)enableSpeakThisServices
{
  if (!_SharedSpeakThisServicesUI)
  {
    _SharedSpeakThisServicesUI = objc_alloc_init(SpeakThisServicesUI);
    MEMORY[0x270F9A758]();
  }
}

- (SpeakThisServicesUI)init
{
  v5.receiver = self;
  v5.super_class = (Class)SpeakThisServicesUI;
  v2 = [(SpeakThisServicesUI *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleSpeakThisEnabledStatusDidChangeNotification_ name:*MEMORY[0x263F8B398] object:0];

    [(SpeakThisServicesUI *)v2 _handleSpeakThisEnabledStatusDidChangeNotification:0];
  }
  return v2;
}

- (void)_unregisterForKBFrameNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D478] object:0];
}

- (void)_handleSpeakThisEnabledStatusDidChangeNotification:(id)a3
{
  if (_AXSSpeakThisEnabled())
  {
    [(SpeakThisServicesUI *)self _registerForKBFrameNotifications];
  }
  else
  {
    [(SpeakThisServicesUI *)self _unregisterForKBFrameNotifications];
  }
}

+ (void)disableSpeakThisServices
{
  v2 = (void *)_SharedSpeakThisServicesUI;
  _SharedSpeakThisServicesUI = 0;
}

- (void)_registerForKBFrameNotifications
{
  if (_AXSSpeakThisEnabled())
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__kbFrameWillChange_ name:*MEMORY[0x263F1D478] object:0];
  }
  else
  {
    [(SpeakThisServicesUI *)self _unregisterForKBFrameNotifications];
  }
}

- (void)_kbFrameWillChange:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [getSpeakThisServicesClass() sharedInstance];
  objc_super v5 = [getSpeakThisServicesClass() speakThisMessageKeyKBFrame];
  v14 = v5;
  v6 = [v3 userInfo];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
  [v7 CGRectValue];
  v8 = NSStringFromCGRect(v18);
  v17[0] = v8;
  uint64_t v15 = *MEMORY[0x263F1D3F0];
  v9 = [v3 userInfo];
  v10 = [v9 objectForKeyedSubscript:v15];
  v17[1] = v10;
  uint64_t v16 = *MEMORY[0x263F1D3F8];
  v11 = [v3 userInfo];

  v12 = [v11 objectForKeyedSubscript:v16];
  v17[2] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v14 count:3];
  [v4 keyboardFrameWillUpdate:v13 errorHandler:&__block_literal_global_3];
}

void __42__SpeakThisServicesUI__kbFrameWillChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = AXLogSpeakScreen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__SpeakThisServicesUI__kbFrameWillChange___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

void __42__SpeakThisServicesUI__kbFrameWillChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24016D000, a2, OS_LOG_TYPE_ERROR, "Error updating keyboard frame: %@", (uint8_t *)&v2, 0xCu);
}

@end