@interface AVSecondScreen
- (AVObservationController)observationController;
- (AVSecondScreen)initWithScene:(id)a3;
- (AVSecondScreenConnection)secondScreenConnection;
- (BOOL)_isWindowSceneAvailable;
- (BOOL)isAvailable;
- (BOOL)isTVOutScreen;
- (CADisplay)debugInfoDisplay;
- (CGRect)sceneBounds;
- (UIScreen)screen;
- (UIWindow)window;
- (UIWindowScene)windowScene;
- (int64_t)state;
- (void)_updatePreferredDisplayCriteria;
- (void)connectWithSecondScreenConnection:(id)a3;
- (void)dealloc;
- (void)setDebugInfoDisplay:(id)a3;
- (void)setSecondScreenConnection:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation AVSecondScreen

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoDisplay, 0);
  objc_storeStrong((id *)&self->_secondScreenConnection, 0);
  objc_destroyWeak((id *)&self->_screen);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_observationController, 0);
}

- (void)setDebugInfoDisplay:(id)a3
{
}

- (CADisplay)debugInfoDisplay
{
  return self->_debugInfoDisplay;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setSecondScreenConnection:(id)a3
{
}

- (AVSecondScreenConnection)secondScreenConnection
{
  return self->_secondScreenConnection;
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  return (UIScreen *)WeakRetained;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (BOOL)isTVOutScreen
{
  return self->_TVOutScreen;
}

- (BOOL)_isWindowSceneAvailable
{
  v3 = [(AVSecondScreen *)self windowScene];
  v4 = [(AVSecondScreen *)self window];
  char v5 = objc_msgSend(v3, "avkit_screenHasWindowsExcludingWindow:", v4) ^ 1;

  return v5;
}

- (void)_updatePreferredDisplayCriteria
{
  v3 = [(AVSecondScreen *)self secondScreenConnection];
  id v8 = [v3 preferredDisplayCriteria];

  unsigned int v4 = [v8 videoDynamicRange] - 1;
  if (v4 > 4) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = qword_1B0721398[v4];
  }
  v6 = [(AVSecondScreen *)self windowScene];
  [v8 refreshRate];
  objc_msgSend(v6, "avkit_setPreferredRefreshRate:HDRMode:", v5, v7);
}

- (CGRect)sceneBounds
{
  v2 = [(AVSecondScreen *)self windowScene];
  v3 = [v2 coordinateSpace];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isAvailable
{
  return [(AVSecondScreen *)self state] != 0;
}

- (void)setState:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    BOOL v5 = [(AVSecondScreen *)self isAvailable];
    double v6 = [(AVSecondScreen *)self window];
    if (v6)
    {
      double v7 = [(AVSecondScreen *)self window];
      int v8 = [v7 isHidden] ^ 1;
    }
    else
    {
      int v8 = 0;
    }

    unint64_t state = self->_state;
    double v10 = _AVLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (state > 2) {
        double v11 = @"Invalid";
      }
      else {
        double v11 = off_1E5FC2670[state];
      }
      if ((unint64_t)a3 > 2) {
        double v12 = @"Invalid";
      }
      else {
        double v12 = off_1E5FC2670[a3];
      }
      int v14 = 136315650;
      double v15 = "-[AVSecondScreen setState:]";
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ -> %@", (uint8_t *)&v14, 0x20u);
    }

    self->_unint64_t state = a3;
    switch(a3)
    {
      case 2:
        double v13 = [(AVSecondScreen *)self secondScreenConnection];
        [v13 connectWithScreen:self active:1];
        goto LABEL_21;
      case 1:
        if (v5) {
          return;
        }
        double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v13 postNotificationName:@"AVSecondScreenConnectionDidBecomePossibleNotification" object:self];
        goto LABEL_21;
      case 0:
        [(AVSecondScreen *)self connectWithSecondScreenConnection:0];
        if (v8)
        {
          double v13 = [(AVSecondScreen *)self windowScene];
          objc_msgSend(v13, "avkit_resetPreferredModeSwitchRequest");
LABEL_21:
        }
        break;
    }
  }
}

- (void)connectWithSecondScreenConnection:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AVSecondScreen *)self secondScreenConnection];

  if (v5 != v4)
  {
    double v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315394;
      v27 = "-[AVSecondScreen connectWithSecondScreenConnection:]";
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v26, 0x16u);
    }

    double v7 = [(AVSecondScreen *)self secondScreenConnection];
    [v7 connectWithScreen:0 active:0];
    int v8 = [v7 debugAssistant];
    [v8 setScene:0];

    [(AVSecondScreen *)self setSecondScreenConnection:v4];
    if (v4)
    {
      if (![(AVSecondScreen *)self isAvailable])
      {
        double v9 = _AVLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v26) = 0;
          _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Attempted to connect with a screen that is not available.", (uint8_t *)&v26, 2u);
        }
      }
      double v10 = [v4 debugAssistant];
      double v11 = [(AVSecondScreen *)self windowScene];
      [v10 setScene:v11];

      [(AVSecondScreen *)self _updatePreferredDisplayCriteria];
      double v12 = [(AVSecondScreen *)self window];

      if (!v12)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1F48]);
        int v14 = [(AVSecondScreen *)self windowScene];
        double v15 = (void *)[v13 initWithWindowScene:v14];
        [(AVSecondScreen *)self setWindow:v15];

        __int16 v16 = _AVLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(AVSecondScreen *)self window];
          __int16 v18 = [(AVSecondScreen *)self window];
          v19 = [v18 screen];
          int v26 = 136315650;
          v27 = "-[AVSecondScreen connectWithSecondScreenConnection:]";
          __int16 v28 = 2048;
          id v29 = v17;
          __int16 v30 = 2112;
          v31 = v19;
          _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "%s Created second window %p on %@", (uint8_t *)&v26, 0x20u);
        }
      }
      uint64_t v20 = [(AVSecondScreen *)self window];
      v21 = [v4 contentViewController];
      [v20 setRootViewController:v21];

      [v4 connectWithScreen:self active:1];
      v22 = [(AVSecondScreen *)self window];
      [v22 setHidden:0];
    }
    else
    {
      v23 = [(AVSecondScreen *)self window];
      [v23 setHidden:1];

      v24 = [(AVSecondScreen *)self window];
      [v24 setRootViewController:0];

      v25 = [(AVSecondScreen *)self window];
      [v25 setWindowScene:0];

      [(AVSecondScreen *)self setWindow:0];
    }
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(AVSecondScreen *)self observationController];
  [v3 stopAllObservation];

  [(AVSecondScreen *)self setState:0];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v7 = "-[AVSecondScreen dealloc]";
    __int16 v8 = 1024;
    int v9 = 159;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVSecondScreen;
  [(AVSecondScreen *)&v5 dealloc];
}

- (AVSecondScreen)initWithScene:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(v4, "avkit_asWindowScene");
  uint64_t v6 = objc_msgSend(v4, "avkit_screenType");

  if ((unint64_t)(v6 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v20.receiver = self;
    v20.super_class = (Class)AVSecondScreen;
    __int16 v8 = [(AVSecondScreen *)&v20 init];
    if (v8)
    {
      int v9 = [v5 screen];
      objc_storeWeak((id *)&v8->_windowScene, v5);
      objc_storeWeak((id *)&v8->_screen, v9);
      v8->_TVOutScreen = v6 == 3;
      if ((unint64_t)[v5 activationState] <= 1
        && (objc_msgSend(v5, "avkit_screenHasWindowsExcludingWindow:", 0) & 1) == 0)
      {
        v8->_unint64_t state = 1;
      }
      uint64_t v10 = [[AVObservationController alloc] initWithOwner:v8];
      observationController = v8->_observationController;
      v8->_observationController = v10;

      double v12 = [(AVSecondScreen *)v8 observationController];
      [v12 startObservingNotificationForName:*MEMORY[0x1E4FB2E80] object:v5 notificationCenter:0 observationHandler:&__block_literal_global_5305];

      id v13 = [(AVSecondScreen *)v8 observationController];
      [v13 startObservingNotificationForName:*MEMORY[0x1E4FB2EA8] object:v5 notificationCenter:0 observationHandler:&__block_literal_global_10_5306];

      int v14 = [(AVSecondScreen *)v8 observationController];
      [v14 startObservingNotificationForName:*MEMORY[0x1E4FB2EB0] object:v5 notificationCenter:0 observationHandler:&__block_literal_global_13_5307];

      double v15 = [(AVSecondScreen *)v8 observationController];
      [v15 startObservingNotificationForName:*MEMORY[0x1E4FB2E90] object:v5 notificationCenter:0 observationHandler:&__block_literal_global_16_5308];

      __int16 v16 = [(AVSecondScreen *)v8 observationController];
      [v16 startObservingNotificationForName:*MEMORY[0x1E4FB2E88] object:v5 notificationCenter:0 observationHandler:&__block_literal_global_19_5309];

      v17 = [(AVSecondScreen *)v8 observationController];
      [v17 startObservingNotificationForName:*MEMORY[0x1E4FB30F0] object:0 notificationCenter:0 observationHandler:&__block_literal_global_24_5310];

      __int16 v18 = [(AVSecondScreen *)v8 observationController];
      [v18 startObservingNotificationForName:@"AVSecondScreenConnectionPreferredDisplayCriteriaDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_27_5311];
    }
    self = v8;
    double v7 = self;
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

void __32__AVSecondScreen_initWithScene___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  objc_super v5 = [a4 object];
  uint64_t v6 = [v8 secondScreenConnection];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    [v8 _updatePreferredDisplayCriteria];
  }
}

void __32__AVSecondScreen_initWithScene___block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    double v12 = "-[AVSecondScreen initWithScene:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = [v5 state];
  if ([v5 _isWindowSceneAvailable])
  {
    if (([v5 isAvailable] & 1) == 0)
    {
      int v9 = [v5 windowScene];
      int v10 = objc_msgSend(v9, "avkit_isForeground");

      if (v10) {
        uint64_t v8 = 1;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [v5 setState:v8];
}

void __32__AVSecondScreen_initWithScene___block_invoke_17(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a2;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[AVSecondScreen initWithScene:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"AVSecondScreenDidDisconnectNotification" object:v6];
}

void __32__AVSecondScreen_initWithScene___block_invoke_14(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a2;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[AVSecondScreen initWithScene:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  [v6 setState:0];
}

void __32__AVSecondScreen_initWithScene___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[AVSecondScreen initWithScene:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  if ([v5 _isWindowSceneAvailable]) {
    [v5 setState:1];
  }
}

void __32__AVSecondScreen_initWithScene___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  int v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    id v11 = "-[AVSecondScreen initWithScene:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 1024;
    int v15 = objc_msgSend(v7, "avkit_isForeground");
    __int16 v16 = 1024;
    int v17 = objc_msgSend(v7, "avkit_screenHasWindowsExcludingWindow:", 0);
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ foreground: %d haswindows: %d", (uint8_t *)&v10, 0x22u);
  }

  if ([v6 _isWindowSceneAvailable]) {
    [v6 setState:1];
  }
}

void __32__AVSecondScreen_initWithScene___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  int v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[AVSecondScreen initWithScene:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v13, 0x16u);
  }

  int v10 = [v6 window];
  if ([v10 isHidden])
  {
  }
  else
  {
    id v11 = [v6 window];
    id v12 = [v11 windowScene];

    if (v12 == v7) {
      [v6 setState:2];
    }
  }
}

@end