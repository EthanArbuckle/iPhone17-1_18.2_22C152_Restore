@interface AXTwiceCompanionAirplayReceiver
+ (id)sharedInstance;
- (APRKStreamRenderer)streamRenderer;
- (AXTwiceCompanionAirplayReceiverDelegate)delegate;
- (id)_init;
- (id)start;
- (void)cleanup;
- (void)dealloc;
- (void)didChangeStreamRendererModeTo:(unint64_t)a3 forRenderer:(id)a4;
- (void)didStartStreamingWithRenderer:(id)a3;
- (void)didStopStreamingWithRenderer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStreamRenderer:(id)a3;
- (void)shouldHideGlobalPasscode;
- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4;
@end

@implementation AXTwiceCompanionAirplayReceiver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__Shared;

  return v2;
}

uint64_t __49__AXTwiceCompanionAirplayReceiver_sharedInstance__block_invoke()
{
  sharedInstance__Shared = [[AXTwiceCompanionAirplayReceiver alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)start
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[AXTwiceCompanionAirplayReceiver start]";
    _os_log_impl(&dword_22C04B000, v3, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v7, 0xCu);
  }

  v4 = [getAPRKStreamRenderingManagerClass() sharedInstance];
  [v4 setDelegate:self];
  [v4 setAssistedModeEnabled:1];
  [v4 setEnableMixingMediaAudio:1];
  [v4 setOptimizeAudioRenderingLatency:1];
  [v4 startReceiverServer];
  v5 = [v4 assistedInfoForAWDL];

  return v5;
}

- (void)cleanup
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[AXTwiceCompanionAirplayReceiver cleanup]";
    _os_log_impl(&dword_22C04B000, v2, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v4, 0xCu);
  }

  v3 = [getAPRKStreamRenderingManagerClass() sharedInstance];
  [v3 setAssistedModeEnabled:0];
  [v3 stopReceiverServer];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AXTwiceCompanionAirplayReceiver;
  return [(AXTwiceCompanionAirplayReceiver *)&v3 init];
}

- (void)dealloc
{
  [(AXTwiceCompanionAirplayReceiver *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)AXTwiceCompanionAirplayReceiver;
  [(AXTwiceCompanionAirplayReceiver *)&v3 dealloc];
}

- (void)didChangeStreamRendererModeTo:(unint64_t)a3 forRenderer:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 uniqueID];
    int v13 = 136315394;
    v14 = "-[AXTwiceCompanionAirplayReceiver didChangeStreamRendererModeTo:forRenderer:]";
    __int16 v15 = 2112;
    uint64_t v16 = (uint64_t)v7;
    _os_log_impl(&dword_22C04B000, v6, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v13, 0x16u);
  }
  v8 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 streamRendererMode];
    int v13 = 136315394;
    v14 = "-[AXTwiceCompanionAirplayReceiver didChangeStreamRendererModeTo:forRenderer:]";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_impl(&dword_22C04B000, v8, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %lu", (uint8_t *)&v13, 0x16u);
  }

  v10 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];
  v11 = [v10 mirroringLayer];

  if (v11)
  {
    v12 = [(AXTwiceCompanionAirplayReceiver *)self delegate];
    [v12 airplayDidStartStreamingWithMirroringLayer:v11];
  }
}

- (void)didStartStreamingWithRenderer:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uniqueID];
    int v17 = 136315394;
    v18 = "-[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:]";
    __int16 v19 = 2112;
    uint64_t v20 = (uint64_t)v6;
    _os_log_impl(&dword_22C04B000, v5, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v17, 0x16u);
  }
  int v7 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 streamRendererMode];
    int v17 = 136315394;
    v18 = "-[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:]";
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl(&dword_22C04B000, v7, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %lu", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v9 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];

  if (v9)
  {
    v10 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];
    [v10 stop];

    v11 = AXLogTwiceRemoteScreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:](self, v4);
    }
  }
  [(AXTwiceCompanionAirplayReceiver *)self setStreamRenderer:v4];
  v12 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];
  [v12 setDelegate:self];

  int v13 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];
  v14 = [v13 mirroringLayer];

  if (v14)
  {
    __int16 v15 = AXLogTwiceRemoteScreen();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:]";
      __int16 v19 = 2112;
      uint64_t v20 = (uint64_t)v14;
      _os_log_impl(&dword_22C04B000, v15, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v16 = [(AXTwiceCompanionAirplayReceiver *)self delegate];
    [v16 airplayDidStartStreamingWithMirroringLayer:v14];
  }
}

- (void)didStopStreamingWithRenderer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uniqueID];
    int v10 = 136315394;
    v11 = "-[AXTwiceCompanionAirplayReceiver didStopStreamingWithRenderer:]";
    __int16 v12 = 2112;
    int v13 = v6;
    _os_log_impl(&dword_22C04B000, v5, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v10, 0x16u);
  }
  int v7 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];

  if (v7)
  {
    id v8 = [(AXTwiceCompanionAirplayReceiver *)self streamRenderer];

    if (v8 == v4)
    {
      [(AXTwiceCompanionAirplayReceiver *)self setStreamRenderer:0];
      uint64_t v9 = [(AXTwiceCompanionAirplayReceiver *)self delegate];
      [v9 airplayDidStopStreaming];
    }
    else
    {
      uint64_t v9 = AXLogTwiceRemoteScreen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXTwiceCompanionAirplayReceiver didStopStreamingWithRenderer:](self, v4);
      }
    }
  }
}

- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[AXTwiceCompanionAirplayReceiver shouldShowGlobalPasscodeWithString:withClientName:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_22C04B000, v5, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)shouldHideGlobalPasscode
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = AXLogTwiceRemoteScreen();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[AXTwiceCompanionAirplayReceiver shouldHideGlobalPasscode]";
    _os_log_impl(&dword_22C04B000, v2, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v3, 0xCu);
  }
}

- (AXTwiceCompanionAirplayReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXTwiceCompanionAirplayReceiverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (APRKStreamRenderer)streamRenderer
{
  return self->_streamRenderer;
}

- (void)setStreamRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamRenderer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didStartStreamingWithRenderer:(void *)a1 .cold.1(void *a1, void *a2)
{
  int v3 = [a1 streamRenderer];
  [v3 streamRendererMode];
  [a2 streamRendererMode];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22C04B000, v4, v5, "[TWICE] Stop %lu before assigning %lu", v6, v7, v8, v9, v10);
}

- (void)didStopStreamingWithRenderer:(void *)a1 .cold.1(void *a1, void *a2)
{
  int v3 = [a1 streamRenderer];
  [v3 streamRendererMode];
  [a2 streamRendererMode];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22C04B000, v4, v5, "[TWICE] mismatch renderer %lu - %lu", v6, v7, v8, v9, v10);
}

@end