@interface ACCAssistiveTouchFeaturePlugin
- (ACCAssistiveTouchProvider)assistiveTouchProvider;
- (BOOL)isRunning;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)assistiveTouchQueue;
- (void)_assistiveTouchToggled:(id)a3;
- (void)_startAssistiveTouch:(id)a3;
- (void)_stopAssistiveTouch:(id)a3;
- (void)assistiveTouch:(id)a3 setEnabled:(BOOL)a4;
- (void)initPlugin;
- (void)setAssistiveTouchProvider:(id)a3;
- (void)setAssistiveTouchQueue:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCAssistiveTouchFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCAssistiveTouchFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCAssistiveTouchFeaturePlugin *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (void)initPlugin
{
  init_logging();
  assistiveTouchProvider = self->_assistiveTouchProvider;
  self->_assistiveTouchProvider = 0;

  [(ACCAssistiveTouchFeaturePlugin *)self setIsRunning:0];
}

- (void)startPlugin
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226A4F000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)stopPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCAssistiveTouchFeaturePlugin startPlugin]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226A4F000, v5, OS_LOG_TYPE_DEFAULT, "Stopping AssistiveTouch feature plugin...", buf, 2u);
  }

  [(ACCAssistiveTouchFeaturePlugin *)self setIsRunning:0];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCAssistiveTouchFeaturePlugin startPlugin]();
    }
    BOOL v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_226A4F000, v6, OS_LOG_TYPE_INFO, "assistiveTouch Removing all observers...", v11, 2u);
  }

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self];

  assistiveTouchProvider = self->_assistiveTouchProvider;
  self->_assistiveTouchProvider = 0;

  assistiveTouchQueue = self->_assistiveTouchQueue;
  self->_assistiveTouchQueue = 0;
}

- (void)assistiveTouch:(id)a3 setEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCAssistiveTouchFeaturePlugin startPlugin]();
    }
    v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_226A4F000, v9, OS_LOG_TYPE_INFO, "assistiveTouchSetEnabled: enable=%d", (uint8_t *)v10, 8u);
  }

  if (v4) {
    [(ACCAssistiveTouchFeaturePlugin *)self _startAssistiveTouch:v6];
  }
  else {
    [(ACCAssistiveTouchFeaturePlugin *)self _stopAssistiveTouch:v6];
  }
}

- (void)_assistiveTouchToggled:(id)a3
{
  assistiveTouchQueue = self->_assistiveTouchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke;
  block[3] = &unk_2647C20D0;
  block[4] = self;
  dispatch_async(assistiveTouchQueue, block);
}

uint64_t __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke(uint64_t a1)
{
  int v2 = _AXSAssistiveTouchEnabled();
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCAssistiveTouchFeaturePlugin startPlugin]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke_cold_1(v2 != 0, v5);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) notifyAssistiveTouchEnabledState:v2 != 0];
}

- (void)_startAssistiveTouch:(id)a3
{
}

void __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke()
{
  int v0 = _AXSAssistiveTouchHardwareEnabled();
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects <= 0;
  }
  else {
    BOOL v1 = 1;
  }
  int v2 = !v1;
  if (v0)
  {
    if (v2)
    {
      BOOL v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCAssistiveTouchFeaturePlugin startPlugin]();
      }
      BOOL v3 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_3();
    }
  }
  else
  {
    if (v2)
    {
      id v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCAssistiveTouchFeaturePlugin startPlugin]();
      }
      id v4 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_1();
    }

    _AXSAssistiveTouchSetHardwareEnabled();
  }
}

- (void)_stopAssistiveTouch:(id)a3
{
}

void __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke()
{
  int v0 = _AXSAssistiveTouchHardwareEnabled();
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects <= 0;
  }
  else {
    BOOL v1 = 1;
  }
  int v2 = !v1;
  if (v0)
  {
    if (v2)
    {
      BOOL v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCAssistiveTouchFeaturePlugin startPlugin]();
      }
      BOOL v3 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_3();
    }

    _AXSAssistiveTouchSetHardwareEnabled();
  }
  else
  {
    if (v2)
    {
      id v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCAssistiveTouchFeaturePlugin startPlugin]();
      }
      id v4 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_1();
    }
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCAssistiveTouchProvider)assistiveTouchProvider
{
  return (ACCAssistiveTouchProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssistiveTouchProvider:(id)a3
{
}

- (OS_dispatch_queue)assistiveTouchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssistiveTouchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistiveTouchQueue, 0);
  objc_storeStrong((id *)&self->_assistiveTouchProvider, 0);
}

void __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_226A4F000, a2, OS_LOG_TYPE_DEBUG, "assistiveTouch notifyEnabledState: enabled=%d", (uint8_t *)v2, 8u);
}

void __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226A4F000, v0, v1, "assistiveTouch _AXSAssistiveTouchSetHardwareEnabled(true)", v2, v3, v4, v5, v6);
}

void __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226A4F000, v0, v1, "assistiveTouchHardware already enabled!", v2, v3, v4, v5, v6);
}

void __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226A4F000, v0, v1, "assistiveTouchHardware already disabled!", v2, v3, v4, v5, v6);
}

void __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226A4F000, v0, v1, "assistiveTouch _AXSAssistiveTouchSetHardwareEnabled(false)", v2, v3, v4, v5, v6);
}

@end