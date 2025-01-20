@interface ACCCarPlay
+ (id)sharedManager;
- (NSXPCConnection)xpcConnection;
- (id)_init;
- (void)carPlayAppLinksStateForCertSerial:(id)a3 withReply:(id)a4;
- (void)carPlayIconStateForCertSerial:(id)a3 andAppCategories:(unint64_t)a4 withReply:(id)a5;
- (void)carPlaySendConnectionTimeEvent:(int64_t)a3 connectionType:(int64_t)a4 eventTime:(id)a5;
- (void)carPlayStartSessionForConnectionID:(unsigned int)a3 properties:(id)a4;
- (void)filterMatchingDigitalCarKeys:(id)a3 forAccessory:(id)a4 withCompletionHandler:(id)a5;
- (void)isCarPlayPairedWithCertSerial:(id)a3 withReply:(id)a4;
- (void)isWirelessCarPlayAllowedForCertSerial:(id)a3 withReply:(id)a4;
- (void)setXpcConnection:(id)a3;
@end

@implementation ACCCarPlay

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __27__ACCCarPlay_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedInstance;

  return v2;
}

uint64_t __27__ACCCarPlay_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

- (id)_init
{
  init_logging();
  v8.receiver = self;
  v8.super_class = (Class)ACCCarPlay;
  v3 = [(ACCCarPlay *)&v8 init];
  if (v3)
  {
    v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.coreaccessories.ACCCarPlayService"];
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = v4;

    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ACCCarPlayServiceProtocol];
    [(NSXPCConnection *)v3->_xpcConnection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v3->_xpcConnection resume];
  }
  return v3;
}

- (void)isCarPlayPairedWithCertSerial:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(ACCCarPlay *)self xpcConnection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke;
  v14[3] = &unk_100008340;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_22;
  v12[3] = &unk_100008368;
  id v13 = v9;
  id v11 = v9;
  [v10 isCarPlayPairedWithCertSerial:v7 withReply:v12];
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(void (**)(void))(v1 + 16);
    v2();
  }
  else
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 7;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      id v5 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    else
    {
      id v5 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_22_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)isWirelessCarPlayAllowedForCertSerial:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ACCCarPlay *)self xpcConnection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke;
  v14[3] = &unk_100008340;
  id v9 = v6;
  id v15 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_24;
  v12[3] = &unk_100008368;
  id v13 = v9;
  id v11 = v9;
  [v10 isWirelessCarPlayAllowedForCertSerial:v7 withReply:v12];
}

void __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(void (**)(void))(v1 + 16);
    v2();
  }
  else
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 7;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      id v5 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    else
    {
      id v5 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_24_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)carPlayAppLinksStateForCertSerial:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ACCCarPlay *)self xpcConnection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke;
  v14[3] = &unk_100008340;
  id v9 = v6;
  id v15 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_25;
  v12[3] = &unk_100008390;
  id v13 = v9;
  id v11 = v9;
  [v10 carPlayAppLinksStateForCertSerial:v7 withReply:v12];
}

void __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    id v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_25(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(void (**)(void))(v1 + 16);
    v2();
  }
  else
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 7;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      id v5 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    else
    {
      id v5 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_25_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)carPlayIconStateForCertSerial:(id)a3 andAppCategories:(unint64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(ACCCarPlay *)self xpcConnection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke;
  v16[3] = &unk_100008340;
  id v11 = v8;
  id v17 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_27;
  v14[3] = &unk_1000083B8;
  id v15 = v11;
  id v13 = v11;
  [v12 carPlayIconStateForCertSerial:v9 andAppCategories:a4 withReply:v14];
}

void __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    uint64_t v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    uint64_t v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 7;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      uint64_t v7 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    else
    {
      uint64_t v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_27_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)carPlayStartSessionForConnectionID:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = [(ACCCarPlay *)self xpcConnection];
  uint64_t v7 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v7 carPlayStartSessionForConnectionID:v4 properties:v6 withReply:&__block_literal_global_32];
}

void __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    BOOL v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }
}

void __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke_29(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (!a2)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 7;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      uint64_t v7 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    else
    {
      uint64_t v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke_29_cold_1();
    }
  }
}

- (void)filterMatchingDigitalCarKeys:(id)a3 forAccessory:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(ACCCarPlay *)self xpcConnection];
  uint64_t v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_34];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_35;
  v14[3] = &unk_100008480;
  id v15 = v8;
  id v13 = v8;
  [v12 filterMatchingDigitalCarKeys:v10 forAccessory:v9 withReply:v14];
}

void __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    BOOL v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }
}

void __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 7;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      id v9 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    else
    {
      id v9 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_35_cold_1();
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
  }
}

- (void)carPlaySendConnectionTimeEvent:(int64_t)a3 connectionType:(int64_t)a4 eventTime:(id)a5
{
  id v8 = a5;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 7;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    uint64_t v11 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  else
  {
    uint64_t v11 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [v8 timeIntervalSinceReferenceDate];
    int v15 = 134218754;
    int64_t v16 = a3;
    __int16 v17 = 2048;
    int64_t v18 = a4;
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CarPlay Connection Event: %ld, %ld, %f, %@", (uint8_t *)&v15, 0x2Au);
  }

  id v13 = [(ACCCarPlay *)self xpcConnection];
  uint64_t v14 = [v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_38];

  [v14 carPlaySendConnectionTimeEvent:a3 connectionType:a4 eventTime:v8 withReply:&__block_literal_global_41];
}

void __70__ACCCarPlay_carPlaySendConnectionTimeEvent_connectionType_eventTime___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();
  }
}

void __70__ACCCarPlay_carPlaySendConnectionTimeEvent_connectionType_eventTime___block_invoke_39(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (!a2)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 7;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2();
      }
      BOOL v7 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    else
    {
      BOOL v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__ACCCarPlay_carPlaySendConnectionTimeEvent_connectionType_eventTime___block_invoke_39_cold_1();
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "can't invoke remote object %@", v2, v3, v4, v5, v6);
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_22_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_24_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_25_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "failed to call ACCCarPlayService %@", v2, v3, v4, v5, v6);
}

void __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "call to ACCCarPlayService failed: %@", v2, v3, v4, v5, v6);
}

void __70__ACCCarPlay_carPlaySendConnectionTimeEvent_connectionType_eventTime___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "failed to send CarPlay Connect event %@", v2, v3, v4, v5, v6);
}

@end