@interface CCUIPerformanceTraceModuleViewController
+ (BOOL)isSupported;
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUIPerformanceTraceModuleViewController)init;
- (double)preferredExpandedContentHeight;
- (id)_getFGSceneIdentifiers;
- (void)_startRecording;
- (void)_stopRecording;
- (void)_updateState:(int)a3;
- (void)artraceSession:(id)a3 didReceiveOutput:(id)a4;
- (void)artraceSessionDidComplete:(id)a3;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)performanceTraceDidComplete:(id)a3 withToken:(id)a4 withError:(id)a5;
- (void)performanceTraceDidStart:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation CCUIPerformanceTraceModuleViewController

- (CCUIPerformanceTraceModuleViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIPerformanceTraceModuleViewController;
  result = [(CCUIPerformanceTraceModuleViewController *)&v3 init];
  if (result) {
    result->state = 0;
  }
  return result;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIPerformanceTraceModuleViewController;
  [(CCUIButtonModuleViewController *)&v5 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"waveform.path.ecg"];
  [(CCUIButtonModuleViewController *)self setGlyphImage:v3];

  v4 = [MEMORY[0x263F1C550] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 0;
}

- (void)artraceSession:(id)a3 didReceiveOutput:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  objc_super v5 = *MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_240698000, v5, OS_LOG_TYPE_DEFAULT, "Performance Trace: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)performanceTraceDidStart:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_240699CEC;
  v6[3] = &unk_2650CE678;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)performanceTraceDidComplete:(id)a3 withToken:(id)a4 withError:(id)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240699DE4;
  block[3] = &unk_2650CE6A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)artraceSessionDidComplete:(id)a3
{
  id v4 = a3;
  if (self->_traceSession)
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_240699F74;
    block[3] = &unk_2650CE678;
    block[4] = self;
    id v12 = v5;
    id v6 = v5;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    traceSession = self->_traceSession;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_24069A01C;
    v8[3] = &unk_2650CE678;
    id v9 = v4;
    v10 = self;
    [(TCArtraceSession *)traceSession displayTraceCompletedAlertWithSessionInfo:v6 completion:v8];
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t state = self->state;
  if (state == 2)
  {
    [(CCUIPerformanceTraceModuleViewController *)self _stopRecording];
  }
  else if (!state)
  {
    [(CCUIPerformanceTraceModuleViewController *)self _startRecording];
  }
}

- (id)_getFGSceneIdentifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  objc_super v3 = (void *)MEMORY[0x263F3F728];
  id v4 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  id v5 = [v3 monitorWithConfiguration:v4];

  id v6 = [v5 currentLayout];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(v6, "elements", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 isUIApplicationElement])
        {
          v13 = [v12 bundleIdentifier];
          [v2 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v5 invalidate];

  return v2;
}

- (void)_startRecording
{
  if (CCSIsInternalInstall())
  {
    objc_super v3 = [(CCUIPerformanceTraceModuleViewController *)self _getFGSceneIdentifiers];
    traceStartScenes = self->_traceStartScenes;
    self->_traceStartScenes = v3;

    if (qword_268C8DE80 != -1) {
      dispatch_once(&qword_268C8DE80, &unk_26F4CF0B8);
    }
    id v5 = (TCArtraceSession *)[objc_alloc((Class) (id) qword_268C8DE78) initWithTraceOptions:&unk_26F4CFA40];
    traceSession = self->_traceSession;
    self->_traceSession = v5;

    [(TCArtraceSession *)self->_traceSession setDelegate:self];
    [(TCArtraceSession *)self->_traceSession startTrace];
    [(CCUIPerformanceTraceModuleViewController *)self _updateState:2];
  }
  else
  {
    [(CCUIPerformanceTraceModuleViewController *)self _updateState:1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_24069A468;
    block[3] = &unk_2650CE6A0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_stopRecording
{
  if (CCSIsInternalInstall())
  {
    if (self->_traceSession)
    {
      [(CCUIPerformanceTraceModuleViewController *)self _updateState:3];
      traceSession = self->_traceSession;
      MEMORY[0x270F9A6D0](traceSession, sel_stopTrace);
    }
  }
  else if (self->_performanceTraceSession)
  {
    [(CCUIPerformanceTraceModuleViewController *)self _updateState:3];
    performanceTraceSession = self->_performanceTraceSession;
    MEMORY[0x270F9A6D0](performanceTraceSession, sel_stopPerformanceTrace);
  }
}

- (void)_updateState:(int)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_performanceTraceSession, 0);
  objc_storeStrong((id *)&self->_traceStartScenes, 0);

  objc_storeStrong((id *)&self->_traceSession, 0);
}

@end