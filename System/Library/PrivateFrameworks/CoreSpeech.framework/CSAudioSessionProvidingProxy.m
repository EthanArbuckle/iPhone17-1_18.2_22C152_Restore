@interface CSAudioSessionProvidingProxy
- (CSAudioSessionProviding)audioSessionProvider;
- (CSAudioSessionProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (CSManualDuckingHandler)manualDuckingHandler;
- (unint64_t)streamClientType;
- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeActivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeDeactivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeDuckAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeEnableMiniDucking:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleSessionProvidingRequestTypePrewarmMessage:(id)a3 client:(id)a4;
- (void)_handleSessionProvidingRequestTypeSetDuckOthersOption:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendDelegateMessageToClient:(id)a3;
- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6;
- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)audioSessionProviderBeginInterruption:(id)a3;
- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4;
- (void)audioSessionProviderEndInterruption:(id)a3;
- (void)dealloc;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAudioSessionProvider:(id)a3;
- (void)setManualDuckingHandler:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioSessionProvidingProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualDuckingHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_audioSessionProvider, 0);
}

- (void)setManualDuckingHandler:(id)a3
{
}

- (CSManualDuckingHandler)manualDuckingHandler
{
  return self->_manualDuckingHandler;
}

- (void)setStreamClientType:(unint64_t)a3
{
  self->_streamClientType = a3;
}

- (unint64_t)streamClientType
{
  return self->_streamClientType;
}

- (void)setXpcConnection:(id)a3
{
}

- (CSClientXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (CSClientXPCConnection *)WeakRetained;
}

- (void)setAudioSessionProvider:(id)a3
{
}

- (CSAudioSessionProviding)audioSessionProvider
{
  return self->_audioSessionProvider;
}

- (void)_sendDelegateMessageToClient:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_100252D20;
  v9[0] = xpc_int64_create(3);
  id v5 = v4;
  v9[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
  v7 = [(CSAudioSessionProvidingProxy *)self xpcConnection];
  [v7 sendMessageToClient:v6];

  for (uint64_t i = 1; i != -1; --i)
}

- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(11);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_dictionary_set_BOOL(v6, "didChangeContextFlag", a4);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v6];
}

- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4
{
  xpc_object_t v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[CSAudioSessionProvidingProxy audioSessionProvider:providerInvalidated:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  *(void *)buf = "type";
  xpc_object_t values = xpc_int64_create(10);
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)buf, &values, 1uLL);
  xpc_dictionary_set_BOOL(v7, "streamHandleIdInvalidationflag", a4);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v7];
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(9);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v7 = objc_msgSend(v5, "_cs_xpcObject");

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v6];
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(8);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v7 = objc_msgSend(v5, "_cs_xpcObject");

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v6];
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(7);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v7 = objc_msgSend(v5, "_cs_xpcObject");

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v6];
}

- (void)audioSessionProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(6);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v7 = objc_msgSend(v5, "_cs_xpcObject");

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v6];
}

- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  *(_OWORD *)keys = *(_OWORD *)&off_100252A80;
  v8[0] = xpc_int64_create(5);
  v8[1] = xpc_BOOL_create(a4);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v8, 2uLL);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6, v8[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  *(_OWORD *)keys = *(_OWORD *)&off_100252A70;
  v8[0] = xpc_int64_create(1);
  v8[1] = xpc_BOOL_create(a4);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v8, 2uLL);
  -[CSAudioSessionProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6, v8[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)audioSessionProviderEndInterruption:(id)a3
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(4);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v4];
}

- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(3);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  xpc_object_t v7 = objc_msgSend(v5, "_cs_xpcObject");

  xpc_dictionary_set_value(v6, "interruptionContext", v7);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v6];
}

- (void)audioSessionProviderBeginInterruption:(id)a3
{
  keys = "type";
  xpc_object_t values = xpc_int64_create(2);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  [(CSAudioSessionProvidingProxy *)self _sendDelegateMessageToClient:v4];
}

- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6
{
  id v12 = a4;
  v9 = (_xpc_connection_s *)a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a5);
  xpc_dictionary_set_BOOL(reply, "result", a3);
  if (v12)
  {
    id v11 = [v12 domain];
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v12 code]);
  }
  xpc_connection_send_message(v9, reply);
}

- (void)_handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "enableSmartRoutingConsideration");
  xpc_object_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"DISABLE";
    if (v6) {
      CFStringRef v8 = @"ENABLE";
    }
    int v11 = 136315394;
    id v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:messageBody:client:]";
    __int16 v13 = 2114;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Session %{public}@ smart routing consideration", (uint8_t *)&v11, 0x16u);
  }
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    [(CSAudioSessionProviding *)audioSessionProvider enableSmartRoutingConsideration:v6];
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Trying to enable smart routing consideration when audioSessionProvider is nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeEnableMiniDucking:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "enableMiniDucking");
  xpc_object_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"DISABLE";
    if (v6) {
      CFStringRef v8 = @"ENABLE";
    }
    int v11 = 136315394;
    id v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableMiniDucking:messageBody:client:]";
    __int16 v13 = 2114;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Session %{public}@ mini ducking", (uint8_t *)&v11, 0x16u);
  }
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    [(CSAudioSessionProviding *)audioSessionProvider enableMiniDucking:v6];
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeEnableMiniDucking:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Trying to enalbe mini ducking when audioSessionProvider is nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manualDuckingHandler)
  {
    float v11 = xpc_dictionary_get_double(v9, "duckLevel");
    double v12 = xpc_dictionary_get_double(v9, "rampDuration");
    *(float *)&double v13 = v12;
    *(float *)&double v12 = v11;
    [(CSManualDuckingHandler *)self->_manualDuckingHandler duckDefaultOutputAudioDeviceWithDuckedLevel:v12 rampDuration:v13];
  }
  else
  {
    CFStringRef v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Manual ducking handler not supported!", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeDuckAudioDevice:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manualDuckingHandler)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v9, "audioDeviceID");
    float v12 = xpc_dictionary_get_double(v9, "duckLevel");
    double v13 = xpc_dictionary_get_double(v9, "rampDuration");
    *(float *)&double v14 = v13;
    *(float *)&double v13 = v12;
    [(CSManualDuckingHandler *)self->_manualDuckingHandler duckAudioDeviceWithDeviceID:uint64 duckedLevel:v13 rampDuration:v14];
  }
  else
  {
    int v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDuckAudioDevice:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Manual ducking handler not supported!", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeSetDuckOthersOption:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "setDuckOthersOption");
  xpc_object_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    float v11 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeSetDuckOthersOption:messageBody:client:]";
    __int16 v12 = 1026;
    BOOL v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Session set duck others option : %{public}d", (uint8_t *)&v10, 0x12u);
  }
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    [(CSAudioSessionProviding *)audioSessionProvider setDuckOthersOption:v6];
  }
  else
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      float v11 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeSetDuckOthersOption:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Trying to set duck others option when audioSessionProvider is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_handleSessionProvidingRequestTypeDeactivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t int64 = xpc_dictionary_get_int64(a4, "deactivateOption");
  float v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDeactivateMessage:messageBody:client:]";
    __int16 v22 = 1026;
    LODWORD(v23) = int64;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Session activate reason : %{public}u", buf, 0x12u);
  }
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    id v19 = 0;
    id v13 = [(CSAudioSessionProviding *)audioSessionProvider deactivateAudioSession:int64 error:&v19];
    id v14 = v19;
    if ((v13 & 1) == 0)
    {
      int v15 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v17 = v15;
        v18 = [v14 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v21 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeDeactivateMessage:messageBody:client:]";
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Failed to deactivate audio session, error : %{public}@", buf, 0x16u);
      }
    }
    [(CSAudioSessionProvidingProxy *)self _sendReplyMessageWithResult:v13 error:v14 event:v8 client:v9];
    int v16 = +[CSSiriClientBehaviorMonitor sharedInstance];
    [v16 notifyReleaseAudioSession];
  }
  else
  {
    id v14 = +[NSError errorWithDomain:CSErrorDomain code:1351 userInfo:0];
    [(CSAudioSessionProvidingProxy *)self _sendReplyMessageWithResult:0 error:v14 event:v8 client:v9];
  }
}

- (void)_handleSessionProvidingRequestTypeActivateMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int64_t int64 = xpc_dictionary_get_int64(v10, "activateReason");
  int64_t v12 = xpc_dictionary_get_int64(v10, "dynamicAttribute");
  string = (void *)xpc_dictionary_get_string(v10, "dictationRequestBundleId");

  if (string)
  {
    string = +[NSString stringWithUTF8String:string];
  }
  id v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeActivateMessage:messageBody:client:]";
    __int16 v27 = 1026;
    *(_DWORD *)v28 = int64;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = v12;
    __int16 v29 = 2114;
    v30 = string;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Session activate reason : %{public}u, dynamicAttributeType : %{public}u, bundleId: %{public}@", buf, 0x22u);
  }
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    id v24 = 0;
    id v16 = [(CSAudioSessionProviding *)audioSessionProvider activateAudioSessionWithReason:int64 dynamicAttribute:v12 bundleID:string error:&v24];
    id v17 = v24;
    if (v16)
    {
      v18 = +[CSSiriClientBehaviorMonitor sharedInstance];
      [v18 notifyActivateAudioSessionWithReason:int64];
    }
    else
    {
      v21 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = v21;
        v23 = [v17 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v26 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypeActivateMessage:messageBody:client:]";
        __int16 v27 = 2114;
        *(void *)v28 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Failed to activate audio session, error : %{public}@", buf, 0x16u);
      }
    }
    id v19 = self;
    id v20 = v16;
  }
  else
  {
    id v17 = +[NSError errorWithDomain:CSErrorDomain code:1351 userInfo:0];
    id v19 = self;
    id v20 = 0;
  }
  [(CSAudioSessionProvidingProxy *)v19 _sendReplyMessageWithResult:v20 error:v17 event:v8 client:v9];
}

- (void)_handleSessionProvidingRequestTypePrewarmMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  audioSessionProvider = self->_audioSessionProvider;
  if (audioSessionProvider)
  {
    id v16 = 0;
    id v9 = [(CSAudioSessionProviding *)audioSessionProvider prewarmAudioSessionWithError:&v16];
    id v10 = v16;
    if ((v9 & 1) == 0)
    {
      float v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v14 = v11;
        int v15 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioSessionProvidingProxy _handleSessionProvidingRequestTypePrewarmMessage:client:]";
        __int16 v19 = 2114;
        id v20 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to prewarm audio session, error : %{public}@", buf, 0x16u);
      }
    }
    int64_t v12 = self;
    id v13 = v9;
  }
  else
  {
    id v10 = +[NSError errorWithDomain:CSErrorDomain code:1351 userInfo:0];
    int64_t v12 = self;
    id v13 = 0;
  }
  [(CSAudioSessionProvidingProxy *)v12 _sendReplyMessageWithResult:v13 error:v10 event:v6 client:v7];
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  int64_t v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    int v15 = "-[CSAudioSessionProvidingProxy handleXPCMessage:messageBody:client:]";
    __int16 v16 = 2050;
    int64_t v17 = int64;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Session Providing Request Message has arrived : %{public}lld", (uint8_t *)&v14, 0x16u);
  }
  switch(int64)
  {
    case 1:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypePrewarmMessage:v8 client:v10];
      break;
    case 2:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeActivateMessage:v8 messageBody:v9 client:v10];
      break;
    case 3:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeDeactivateMessage:v8 messageBody:v9 client:v10];
      break;
    case 5:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeSetDuckOthersOption:v8 messageBody:v9 client:v10];
      break;
    case 6:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeEnableMiniDucking:v8 messageBody:v9 client:v10];
      break;
    case 7:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeDuckAudioDevice:v8 messageBody:v9 client:v10];
      break;
    case 8:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeDuckDefaultOutputAudioDevice:v8 messageBody:v9 client:v10];
      break;
    case 9:
      [(CSAudioSessionProvidingProxy *)self _handleSessionProvidingRequestTypeEnableSmartRoutingConsideration:v8 messageBody:v9 client:v10];
      break;
    default:
      id v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        int v15 = "-[CSAudioSessionProvidingProxy handleXPCMessage:messageBody:client:]";
        __int16 v16 = 2050;
        int64_t v17 = int64;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unexpected XPC session providing request : %{public}lld", (uint8_t *)&v14, 0x16u);
      }
      break;
  }
}

- (void)dealloc
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAudioSessionProvidingProxy dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioSessionProvidingProxy;
  [(CSAudioSessionProvidingProxy *)&v4 dealloc];
}

- (void)CSClientXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  float v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t streamClientType = self->_streamClientType;
    int v17 = 136315394;
    v18 = "-[CSAudioSessionProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
    __int16 v19 = 1026;
    int v20 = streamClientType;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s CSAudioSessionProvidingProxy has received xpc disconnection _streamClientType : %{public}d", (uint8_t *)&v17, 0x12u);
  }
  if (self->_streamClientType == 1)
  {
    audioSessionProvider = self->_audioSessionProvider;
    if (audioSessionProvider)
    {
      int v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        v18 = "-[CSAudioSessionProvidingProxy CSClientXPCConnectionReceivedClientError:clientError:client:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Trying to release audio stream on CSAudioSessionProvidingProxy", (uint8_t *)&v17, 0xCu);
        audioSessionProvider = self->_audioSessionProvider;
      }
      [(CSAudioSessionProviding *)audioSessionProvider deactivateAudioSession:1 error:0];
    }
    manualDuckingHandler = self->_manualDuckingHandler;
    if (manualDuckingHandler) {
      [(CSManualDuckingHandler *)manualDuckingHandler resetDucking];
    }
  }
  __int16 v16 = self->_audioSessionProvider;
  self->_audioSessionProvider = 0;
}

- (CSAudioSessionProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSAudioSessionProvidingProxy;
  id v5 = [(CSAudioSessionProvidingProxy *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(CSAudioSessionProvidingProxy *)v5 setXpcConnection:v4];
  }

  return v6;
}

@end