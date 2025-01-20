@interface RPControlCenterAngelProxy
+ (id)sharedInstance;
- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4;
- (RPControlCenterAngelProxy)init;
- (RPControlCenterAngelProxyDelegate)delegate;
- (id)connectionManagerQueue;
- (id)getBSServiceInterface;
- (void)cancelRecordingCountdown;
- (void)countdownInterruptWithStatus:(id)a3;
- (void)hideAndStopRecordingBanner;
- (void)setCountdownState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupConnection;
- (void)showRecordingBanner;
- (void)startRecordingCountdown;
- (void)stopCurrentSession;
- (void)stopRecordingCalled;
@end

@implementation RPControlCenterAngelProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_angelProxy;

  return v2;
}

uint64_t __43__RPControlCenterAngelProxy_sharedInstance__block_invoke()
{
  sharedInstance_angelProxy = objc_alloc_init(RPControlCenterAngelProxy);

  return MEMORY[0x270F9A758]();
}

- (id)connectionManagerQueue
{
  if (connectionManagerQueue_onceToken != -1) {
    dispatch_once(&connectionManagerQueue_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)connectionManagerQueue_connectionQueue;

  return v2;
}

uint64_t __51__RPControlCenterAngelProxy_connectionManagerQueue__block_invoke()
{
  connectionManagerQueue_connectionQueue = (uint64_t)dispatch_queue_create("com.replaykitangel.angelProxyConnectionQueue", 0);

  return MEMORY[0x270F9A758]();
}

- (id)getBSServiceInterface
{
  if (getBSServiceInterface_onceToken != -1) {
    dispatch_once(&getBSServiceInterface_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)getBSServiceInterface___interface;

  return v2;
}

void __50__RPControlCenterAngelProxy_getBSServiceInterface__block_invoke()
{
  id v4 = [MEMORY[0x263F2B9B0] interfaceWithIdentifier:@"com.apple.ReplayKitAngel.session"];
  v0 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26D11F888];
  [v4 setServer:v0];

  v1 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26D11F960];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:0];
  uint64_t v2 = [v4 copy];
  v3 = (void *)getBSServiceInterface___interface;
  getBSServiceInterface___interface = v2;
}

- (RPControlCenterAngelProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterAngelProxy;
  uint64_t v2 = [(RPControlCenterAngelProxy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RPControlCenterAngelProxy *)v2 setupConnection];
  }
  return v3;
}

- (void)setupConnection
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F2B9C0] endpointForMachName:@"com.apple.ReplayKitAngel.mach" service:@"com.apple.ReplayKitAngel.session" instance:0];
  if (v3)
  {
    id v4 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v3];
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__RPControlCenterAngelProxy_setupConnection__block_invoke;
    v7[3] = &unk_26451D6B8;
    v7[4] = self;
    [(BSServiceConnectionClient *)v6 configureConnection:v7];
    [(BSServiceConnectionClient *)self->_connection activate];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPControlCenterAngelProxy setupConnection]";
    __int16 v10 = 1024;
    int v11 = 106;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel endpoint nil", buf, 0x12u);
  }
}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v3 connectionManagerQueue];
  [v4 setTargetQueue:v5];

  v6 = [MEMORY[0x263F2B9F0] userInitiated];
  [v4 setServiceQuality:v6];

  v7 = [*(id *)(a1 + 32) getBSServiceInterface];
  [v4 setInterface:v7];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  [v4 setActivationHandler:&__block_literal_global_86];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__RPControlCenterAngelProxy_setupConnection__block_invoke_87;
  v9[3] = &unk_26451D690;
  v9[4] = *(void *)(a1 + 32);
  [v4 setInterruptionHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__RPControlCenterAngelProxy_setupConnection__block_invoke_94;
  v8[3] = &unk_26451D690;
  v8[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v8];
}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke_2";
    __int16 v5 = 1024;
    int v6 = 79;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activation handler", (uint8_t *)&v3, 0x12u);
  }
}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 82;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Interruption handler", (uint8_t *)&v8, 0x12u);
  }
  [@"com.apple.replayd" UTF8String];
  if (os_variant_allows_internal_security_policies())
  {
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"RPHideStatusBar", @"com.apple.replayd");
    BOOL v5 = v4 != 0;
    if (__RPLogLevel <= 1)
    {
      CFPropertyListRef v6 = v4;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136446722;
        v9 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 90;
        __int16 v12 = 1024;
        BOOL v13 = v6 != 0;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d hideStatusBar=%d", (uint8_t *)&v8, 0x18u);
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v7 && !v5) {
    [v7 replayKitAngelDisconnected];
  }
  [v3 activate];
}

void __44__RPControlCenterAngelProxy_setupConnection__block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPControlCenterAngelProxy setupConnection]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 99;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Invalidation handler", (uint8_t *)&v6, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  [*(id *)(a1 + 32) stopCurrentSession];
}

- (void)startRecordingCountdown
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy startRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 112;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  uint64_t v4 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v7 = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  int v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 startRecordingCountdown];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy startRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 119;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)setCountdownState:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v11 = "-[RPControlCenterAngelProxy setCountdownState:]";
    __int16 v12 = 1024;
    int v13 = 124;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  int v6 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  int v9 = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  __int16 v8 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v7];

  if (v8)
  {
    [v8 setCountdownState:v4];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v11 = "-[RPControlCenterAngelProxy setCountdownState:]";
    __int16 v12 = 1024;
    int v13 = 131;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)cancelRecordingCountdown
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy cancelRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 136;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v7 = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  int v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 cancelRecordingCountdown];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy cancelRecordingCountdown]";
    __int16 v10 = 1024;
    int v11 = 143;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)showRecordingBanner
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy showRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 148;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v7 = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  int v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 showRecordingBanner];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy showRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 155;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)stopRecordingCalled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy stopRecordingCalled]";
    __int16 v10 = 1024;
    int v11 = 160;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v7 = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  int v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 stopRecordingCalled];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy stopRecordingCalled]";
    __int16 v10 = 1024;
    int v11 = 167;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)hideAndStopRecordingBanner
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 172;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v7 = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  int v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 hideAndStopRecordingBanner];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v9 = "-[RPControlCenterAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 179;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPControlCenterAngelProxy showReactionsTipForApplication:bundleID:]";
    __int16 v16 = 1024;
    int v17 = 184;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  int v9 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  int v13 = v9;
  __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  int v11 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v10];

  if (v11)
  {
    [v11 showReactionsTipForApplication:v6 bundleID:v7];
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPControlCenterAngelProxy showReactionsTipForApplication:bundleID:]";
    __int16 v16 = 1024;
    int v17 = 191;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

  return v11 != 0;
}

- (void)stopCurrentSession
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    BOOL v5 = "-[RPControlCenterAngelProxy stopCurrentSession]";
    __int16 v6 = 1024;
    int v7 = 199;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  delegate = self->_delegate;
  if (delegate) {
    [(RPControlCenterAngelProxyDelegate *)delegate stopCurrentSession];
  }
}

- (void)countdownInterruptWithStatus:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[RPControlCenterAngelProxy countdownInterruptWithStatus:]";
    __int16 v8 = 1024;
    int v9 = 208;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  delegate = self->_delegate;
  if (delegate) {
    [(RPControlCenterAngelProxyDelegate *)delegate countdownInterruptWithStatus:v4];
  }
}

- (RPControlCenterAngelProxyDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end