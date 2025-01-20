@interface ACCVoiceOverServerRemote
- (ACCVoiceOverServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)dealloc;
- (void)initConnection:(id)a3;
- (void)update:(id)a3 cursorInfo:(id)a4;
- (void)update:(id)a3 info:(id)a4;
@end

@implementation ACCVoiceOverServerRemote

- (ACCVoiceOverServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = [v5 hash];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initWithXPCConnection: XPCConnection=%lu", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)ACCVoiceOverServerRemote;
  v9 = [(ACCVoiceOverServerRemote *)&v12 init];
  v10 = v9;
  if (v9)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v9->_XPCConnection, a3);
    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)ACCVoiceOverServerRemote;
  [(ACCVoiceOverServerRemote *)&v4 dealloc];
}

- (void)initConnection:(id)a3
{
  objc_super v4 = (void (**)(id, BOOL))a3;
  id v5 = +[ACCVoiceOverServer sharedServer];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(ACCVoiceOverServerRemote *)self XPCConnection];
    BOOL v7 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v6] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    v10 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client has called initConnection method!", (uint8_t *)v14, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v14, 8u);
  }

  if (v7)
  {
    v13 = +[ACCVoiceOverServer sharedServer];
    [v13 sendUpdatedSubscriberList];
  }
  v4[2](v4, v7);
}

- (void)update:(id)a3 info:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VoiceOver server remote update:info: voiceOverUID %@, updateDict=%@", (uint8_t *)&v19, 0x16u);
  }

  v10 = [v6 objectForKey:@"ACCVoiceOverInformationUpdateSpeakingVolumeKey"];
  v11 = [v6 objectForKey:@"ACCVoiceOverInformationUpdateSpeakingRateKey"];
  id v12 = [v6 objectForKey:@"ACCVoiceOverInformationUpdateEnabledKey"];
  float v13 = 0.0;
  if (v10)
  {
    [v10 floatValue];
    float v15 = v14;
    int v16 = 1;
    if (!v11) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  int v16 = 0;
  float v15 = 0.0;
  if (v11)
  {
LABEL_13:
    [v11 floatValue];
    float v13 = v17;
    v16 |= 2u;
  }
LABEL_14:
  if (v12)
  {
    int v18 = [v12 BOOLValue];
    v16 |= 4u;
  }
  else
  {
    int v18 = 0;
  }
  platform_voiceOver_informationUpdateHandler(v16, v18, v15, v13);
}

- (void)update:(id)a3 cursorInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VoiceOver server remote update:cursorInfo: voiceOverUID %@, updateDict=%@", buf, 0x16u);
  }

  v10 = [v6 objectForKey:@"ACCVoiceOverCursorInformationUpdateLabelKey"];
  v11 = [v6 objectForKey:@"ACCVoiceOverCursorInformationUpdateValueKey"];
  id v12 = [v6 objectForKey:@"ACCVoiceOverCursorInformationUpdateHintKey"];
  float v13 = [v6 objectForKey:@"ACCVoiceOverCursorInformationUpdateTraitsKey"];
  float v14 = v13;
  int v15 = v10 != 0;
  if (v11) {
    v15 |= 2u;
  }
  if (v12) {
    int v16 = v15 | 4;
  }
  else {
    int v16 = v15;
  }
  if (v13)
  {
    id v22 = v10;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v14);
          }
          v19 |= 1 << (char)[*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedShortValue];
        }
        id v18 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }
    else
    {
      uint64_t v19 = 0;
    }
    v16 |= 8u;
    v10 = v22;
  }
  else
  {
    uint64_t v19 = 0;
  }
  platform_voiceOver_cursorInformationUpdateHandler(v16, v10, v11, v12, v19);
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

@end