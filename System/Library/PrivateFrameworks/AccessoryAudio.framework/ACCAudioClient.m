@interface ACCAudioClient
- (ACCAudioClient)initWithDelegate:(id)a3;
- (ACCAudioClientProtocol)delegate;
- (ACCAudioXPCServerProtocol)remoteObject;
- (BOOL)allowBackgroundAudioForClient:(id)a3;
- (BOOL)setDigitalAudioSampleRate:(unsigned int)a3;
- (NSXPCConnection)serverConnection;
- (id)deviceAudioStates;
- (id)supportedDigitalAudioSampleRates;
- (unsigned)supportedDigitalAudioSampleRate:(unsigned int)a3;
- (void)connectToServer;
- (void)dealloc;
- (void)registerForAccessoryDigitalAudioNotifications;
- (void)setDelegate:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)unregisterForAccessoryDigitalAudioNotifications;
@end

@implementation ACCAudioClient

- (ACCAudioClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  init_logging();
  v16.receiver = self;
  v16.super_class = (Class)ACCAudioClient;
  v5 = [(ACCAudioClient *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v6->_serverConnection;
    v6->_serverConnection = 0;

    remoteObject = v6->_remoteObject;
    v6->_remoteObject = 0;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __35__ACCAudioClient_initWithDelegate___block_invoke;
    v13 = &unk_264807E38;
    objc_copyWeak(&v14, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.audio.availability-changed", &v10);
    [(ACCAudioClient *)v6 connectToServer];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __35__ACCAudioClient_initWithDelegate___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_22744B000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained connectToServer];
  }
}

- (void)dealloc
{
  accessoryServer_unregisterAvailabilityChangedHandler();
  v3 = [(ACCAudioClient *)self serverConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ACCAudioClient;
  [(ACCAudioClient *)&v4 dealloc];
}

- (void)connectToServer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22744B000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
}

void __33__ACCAudioClient_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setRemoteObject:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }
}

void __33__ACCAudioClient_connectToServer__block_invoke_63(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRemoteObject:0];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 serverConnection];
  [v4 invalidate];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }
}

void __33__ACCAudioClient_connectToServer__block_invoke_64(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();
  }
}

void __33__ACCAudioClient_connectToServer__block_invoke_66(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [WeakRetained serverConnection];
    [v8 invalidate];
  }
}

- (void)registerForAccessoryDigitalAudioNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AccessoryDigitalAudioNotificationCallBack, @"com.apple.accessories.audio.stateChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unregisterForAccessoryDigitalAudioNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"com.apple.accessories.audio.stateChanged", 0);
}

- (BOOL)setDigitalAudioSampleRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v4 = [(ACCAudioClient *)self serverConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_71];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__ACCAudioClient_setDigitalAudioSampleRate___block_invoke_72;
  v11[3] = &unk_264807EA8;
  v11[4] = &v12;
  [v5 setDigitalAudioSampleRate:v3 withReply:v11];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = *((unsigned __int8 *)v13 + 24);
    *(_DWORD *)buf = 67109120;
    int v17 = v8;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_INFO, "retValue: %d", buf, 8u);
  }

  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __44__ACCAudioClient_setDigitalAudioSampleRate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();
  }
}

uint64_t __44__ACCAudioClient_setDigitalAudioSampleRate___block_invoke_72(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unsigned)supportedDigitalAudioSampleRate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  id v4 = [(ACCAudioClient *)self serverConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_74];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__ACCAudioClient_supportedDigitalAudioSampleRate___block_invoke_75;
  v11[3] = &unk_264807ED0;
  v11[4] = &v12;
  [v5 supportedDigitalAudioSampleRate:v3 withReply:v11];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v6 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = *((_DWORD *)v13 + 6);
    *(_DWORD *)buf = 67109376;
    int v17 = v3;
    __int16 v18 = 1024;
    int v19 = v8;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_INFO, "inputRate: %d, supportedRate: %d", buf, 0xEu);
  }

  unsigned int v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __50__ACCAudioClient_supportedDigitalAudioSampleRate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();
  }
}

uint64_t __50__ACCAudioClient_supportedDigitalAudioSampleRate___block_invoke_75(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)supportedDigitalAudioSampleRates
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v2 = [(ACCAudioClient *)self serverConnection];
  BOOL v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_78];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __50__ACCAudioClient_supportedDigitalAudioSampleRates__block_invoke_79;
  v9[3] = &unk_264807EF8;
  v9[4] = &v10;
  [v3 supportedDigitalAudioSampleRatesWithReply:v9];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v4 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v4 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_22744B000, v4, OS_LOG_TYPE_INFO, "ratesArray: %@", buf, 0xCu);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __50__ACCAudioClient_supportedDigitalAudioSampleRates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();
  }
}

void __50__ACCAudioClient_supportedDigitalAudioSampleRates__block_invoke_79(uint64_t a1, void *a2)
{
}

- (id)deviceAudioStates
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v2 = [(ACCAudioClient *)self serverConnection];
  BOOL v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_82];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __35__ACCAudioClient_deviceAudioStates__block_invoke_83;
  v9[3] = &unk_264807EF8;
  v9[4] = &v10;
  [v3 deviceAudioStatesWithReply:v9];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v4 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v4 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v11[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_22744B000, v4, OS_LOG_TYPE_INFO, "audioStates: %@", buf, 0xCu);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __35__ACCAudioClient_deviceAudioStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();
  }
}

void __35__ACCAudioClient_deviceAudioStates__block_invoke_83(uint64_t a1, void *a2)
{
}

- (BOOL)allowBackgroundAudioForClient:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v5 = [(ACCAudioClient *)self serverConnection];

  if (v5)
  {
    uint64_t v6 = [(ACCAudioClient *)self serverConnection];
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_85];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__ACCAudioClient_allowBackgroundAudioForClient___block_invoke_86;
    v16[3] = &unk_264807F20;
    int v8 = v4;
    uint64_t v17 = v8;
    uint64_t v18 = &v19;
    [v7 allowBackgroundAudioForClient:v8 withReply:v16];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      unsigned int v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      unsigned int v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *((unsigned __int8 *)v20 + 24);
      *(_DWORD *)buf = 67109378;
      int v24 = v12;
      __int16 v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_22744B000, v9, OS_LOG_TYPE_DEFAULT, "allowBackgroundAudio: %d for client %@", buf, 0x12u);
    }

    uint64_t v10 = v17;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      }
      uint64_t v10 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22744B000, v10, OS_LOG_TYPE_DEFAULT, "no server connection when checking background audio state, won't allow background audio!", buf, 2u);
    }
  }

  BOOL v14 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __48__ACCAudioClient_allowBackgroundAudioForClient___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();
  }
}

void __48__ACCAudioClient_allowBackgroundAudioForClient___block_invoke_86(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    uint64_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    uint64_t v10 = v7;
    _os_log_impl(&dword_22744B000, v6, OS_LOG_TYPE_INFO, "allowBackgroundAudioForClient reply: %d for client %@", (uint8_t *)v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (ACCAudioClientProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCAudioClientProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (ACCAudioXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22744B000, v0, v1, "XPC connection error: %@", v2, v3, v4, v5, v6);
}

@end