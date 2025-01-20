@interface CSClientXPCConnection
- (BOOL)_getAudioProvideWithContext:(id)a3 streamClientType:(unint64_t)a4;
- (CSAudioAlertProvidingProxy)audioAlertProvidingProxy;
- (CSAudioMeterProvidingProxy)audioMeterProvidingProxy;
- (CSAudioMetricProvidingProxy)audioMetricProvidingProxy;
- (CSAudioSessionInfoProvidingProxy)audioSessionInfoProvidingProxy;
- (CSAudioSessionProvidingProxy)audioSessionProvidingProxy;
- (CSAudioStreamProvidingProxy)audioStreamProvidingProxy;
- (CSClientXPCConnection)initWithConnection:(id)a3;
- (CSClientXPCConnectionDelegate)delegate;
- (CSFallbackAudioSessionReleaseProvidingProxy)fallbackAudioSessionProvidingProxy;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (unint64_t)clientType;
- (void)_handleAudioProvidingMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAudioProvidingRequestTypeSwitchMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleClientError:(id)a3 client:(id)a4;
- (void)_handleClientEvent:(id)a3;
- (void)_handleClientMessage:(id)a3 client:(id)a4;
- (void)_handlePingPongMessage:(id)a3 client:(id)a4;
- (void)_handleSetXPCClientTypeMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_notifyXPCDisconnectionToProxies;
- (void)_notifyXPCDisconnectionToProxy:(id)a3;
- (void)activateConnection;
- (void)sendMessageToClient:(id)a3;
- (void)setAudioAlertProvidingProxy:(id)a3;
- (void)setAudioMeterProvidingProxy:(id)a3;
- (void)setAudioMetricProvidingProxy:(id)a3;
- (void)setAudioSessionInfoProvidingProxy:(id)a3;
- (void)setAudioSessionProvidingProxy:(id)a3;
- (void)setAudioStreamProvidingProxy:(id)a3;
- (void)setClientType:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackAudioSessionProvidingProxy:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSClientXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioMetricProvidingProxy, 0);
  objc_storeStrong((id *)&self->_audioMeterProvidingProxy, 0);
  objc_storeStrong((id *)&self->_audioAlertProvidingProxy, 0);
  objc_storeStrong((id *)&self->_audioStreamProvidingProxy, 0);
  objc_storeStrong((id *)&self->_audioSessionInfoProvidingProxy, 0);
  objc_storeStrong((id *)&self->_fallbackAudioSessionProvidingProxy, 0);
  objc_storeStrong((id *)&self->_audioSessionProvidingProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setAudioMetricProvidingProxy:(id)a3
{
}

- (CSAudioMetricProvidingProxy)audioMetricProvidingProxy
{
  return self->_audioMetricProvidingProxy;
}

- (void)setAudioMeterProvidingProxy:(id)a3
{
}

- (CSAudioMeterProvidingProxy)audioMeterProvidingProxy
{
  return self->_audioMeterProvidingProxy;
}

- (void)setAudioAlertProvidingProxy:(id)a3
{
}

- (CSAudioAlertProvidingProxy)audioAlertProvidingProxy
{
  return self->_audioAlertProvidingProxy;
}

- (void)setAudioStreamProvidingProxy:(id)a3
{
}

- (CSAudioStreamProvidingProxy)audioStreamProvidingProxy
{
  return self->_audioStreamProvidingProxy;
}

- (void)setAudioSessionInfoProvidingProxy:(id)a3
{
}

- (CSAudioSessionInfoProvidingProxy)audioSessionInfoProvidingProxy
{
  return self->_audioSessionInfoProvidingProxy;
}

- (void)setFallbackAudioSessionProvidingProxy:(id)a3
{
}

- (CSFallbackAudioSessionReleaseProvidingProxy)fallbackAudioSessionProvidingProxy
{
  return self->_fallbackAudioSessionProvidingProxy;
}

- (void)setAudioSessionProvidingProxy:(id)a3
{
}

- (CSAudioSessionProvidingProxy)audioSessionProvidingProxy
{
  return self->_audioSessionProvidingProxy;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSClientXPCConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSClientXPCConnectionDelegate *)WeakRetained;
}

- (void)_handlePingPongMessage:(id)a3 client:(id)a4
{
  id v5 = a3;
  v6 = (_xpc_connection_s *)a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[CSClientXPCConnection _handlePingPongMessage:client:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Handing PingPong message", (uint8_t *)&v9, 0xCu);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  xpc_dictionary_set_BOOL(reply, "result", 1);
  xpc_connection_send_message(v6, reply);
}

- (void)_notifyXPCDisconnectionToProxy:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if (objc_opt_respondsToSelector()) {
      [v5 CSClientXPCConnectionReceivedClientError:self clientError:0 client:0];
    }
  }
  _objc_release_x2();
}

- (void)_notifyXPCDisconnectionToProxies
{
  if ((id)[(CSClientXPCConnection *)self clientType] == (id)1)
  {
    [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxy:self->_audioSessionProvidingProxy];
    [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxy:self->_audioStreamProvidingProxy];
    [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxy:self->_audioAlertProvidingProxy];
    [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxy:self->_audioMeterProvidingProxy];
    [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxy:self->_audioMetricProvidingProxy];
  }
  if ((id)[(CSClientXPCConnection *)self clientType] == (id)2)
  {
    audioSessionInfoProvidingProxy = self->_audioSessionInfoProvidingProxy;
    [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxy:audioSessionInfoProvidingProxy];
  }
}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (v6 == &_xpc_error_connection_invalid || v6 == &_xpc_error_connection_interrupted)
    {
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315394;
        v20 = "-[CSClientXPCConnection _handleClientError:client:]";
        __int16 v21 = 2050;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Client %{public}p connection disconnected, noticing xpc listener", (uint8_t *)&v19, 0x16u);
      }
      [(CSClientXPCConnection *)self _notifyXPCDisconnectionToProxies];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v12 = WeakRetained;
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v15 CSClientXPCConnectionReceivedClientError:self clientError:v6 client:v8];
        }
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
      v17 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        v20 = "-[CSClientXPCConnection _handleClientError:client:]";
        __int16 v21 = 2082;
        v22 = string;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (void)_handleSetXPCClientTypeMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    int64_t int64 = xpc_dictionary_get_int64(v9, "xpcClientType");
    int v13 = int64;
    self->_clientType = int64;
    char v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      v17 = "-[CSClientXPCConnection _handleSetXPCClientTypeMessage:messageBody:client:]";
      __int16 v18 = 1026;
      int v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Setting XPCClientType to %{public}d", (uint8_t *)&v16, 0x12u);
    }
  }
  else
  {
    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[CSClientXPCConnection _handleSetXPCClientTypeMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Cannot handle audio providing message", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_handleAudioProvidingRequestTypeSwitchMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a4;
  id v9 = (_xpc_connection_s *)a5;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  v11 = xpc_dictionary_get_dictionary(v8, "context");
  if (v11)
  {
    uint64_t int64 = xpc_dictionary_get_uint64(v8, "clientType");
    id v13 = [objc_alloc((Class)CSAudioRecordContext) initWithXPCObject:v11];
    xpc_dictionary_set_BOOL(reply, "result", [(CSClientXPCConnection *)self _getAudioProvideWithContext:v13 streamClientType:uint64]);
  }
  else
  {
    char v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      int v16 = "-[CSClientXPCConnection _handleAudioProvidingRequestTypeSwitchMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Unable to handle audio providing switch message : context is nil", (uint8_t *)&v15, 0xCu);
    }
    xpc_dictionary_set_BOOL(reply, "result", 0);
  }
  xpc_connection_send_message(v9, reply);
}

- (void)_handleAudioProvidingMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8 || !v9 || !v10)
  {
    char v14 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136315138;
    v20 = "-[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]";
    int v15 = "%s Cannot handle audio providing message";
    int v16 = v14;
    uint32_t v17 = 12;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, v17);
    goto LABEL_11;
  }
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    v20 = "-[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]";
    __int16 v21 = 2050;
    int64_t v22 = int64;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Audio Providing Request Message has arrived : %{public}lld", (uint8_t *)&v19, 0x16u);
  }
  if (int64 != 1)
  {
    __int16 v18 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v19 = 136315394;
    v20 = "-[CSClientXPCConnection _handleAudioProvidingMessage:messageBody:client:]";
    __int16 v21 = 2050;
    int64_t v22 = int64;
    int v15 = "%s Unexpected XPC Metric providing request : %{public}lld";
    int v16 = v18;
    uint32_t v17 = 22;
    goto LABEL_13;
  }
  [(CSClientXPCConnection *)self _handleAudioProvidingRequestTypeSwitchMessage:v8 messageBody:v9 client:v11];
LABEL_11:
}

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "type");
    id v10 = xpc_dictionary_get_dictionary(v6, "body");
    switch(int64)
    {
      case 1:
        [(CSClientXPCConnection *)self _handlePingPongMessage:v6 client:v8];
        break;
      case 2:
        audioSessionProvidingProxy = self->_audioSessionProvidingProxy;
        goto LABEL_21;
      case 4:
        audioSessionProvidingProxy = self->_audioStreamProvidingProxy;
        goto LABEL_21;
      case 6:
        audioSessionProvidingProxy = self->_audioAlertProvidingProxy;
        goto LABEL_21;
      case 8:
        audioSessionProvidingProxy = self->_audioMeterProvidingProxy;
        goto LABEL_21;
      case 9:
        audioSessionProvidingProxy = self->_audioMetricProvidingProxy;
        goto LABEL_21;
      case 10:
        audioSessionProvidingProxy = self->_audioSessionInfoProvidingProxy;
        goto LABEL_21;
      case 13:
        [(CSClientXPCConnection *)self _handleAudioProvidingMessage:v6 messageBody:v10 client:v8];
        break;
      case 14:
        audioStreamProvidingProxy = self->_audioStreamProvidingProxy;
        if (audioStreamProvidingProxy
          && ([(CSAudioStreamProvidingProxy *)audioStreamProvidingProxy audioStreamProviding],
              int v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          int v16 = [(CSAudioStreamProvidingProxy *)self->_audioStreamProvidingProxy audioStreamProviding];
          uint64_t v17 = (uint64_t)[v16 audioStreamId];
        }
        else
        {
          uint64_t v17 = 1;
        }
        __int16 v18 = objc_alloc_init(CSAudioTimeConversionProvidingProxy);
        [(CSAudioTimeConversionProvidingProxy *)v18 handleXPCMessage:v6 messageBody:v10 client:v8 audioStreamHandleId:v17];

        break;
      case 15:
        [(CSClientXPCConnection *)self _handleSetXPCClientTypeMessage:v6 messageBody:v10 client:v8];
        break;
      case 17:
        audioSessionProvidingProxy = self->_fallbackAudioSessionProvidingProxy;
LABEL_21:
        [audioSessionProvidingProxy handleXPCMessage:v6 messageBody:v10 client:v8];
        break;
      default:
        id v13 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136315394;
          v20 = "-[CSClientXPCConnection _handleClientMessage:client:]";
          __int16 v21 = 2050;
          int64_t v22 = int64;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unexpected message type : %{public}lld", (uint8_t *)&v19, 0x16u);
        }
        break;
    }
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      v20 = "-[CSClientXPCConnection _handleClientMessage:client:]";
      __int16 v21 = 2050;
      int64_t v22 = (int64_t)v6;
      __int16 v23 = 2050;
      v24 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s message = %{public}p, client = %{public}p, cannot handle message", (uint8_t *)&v19, 0x20u);
    }
  }
}

- (void)_handleClientEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_connection)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      [(CSClientXPCConnection *)self _handleClientMessage:v5 client:self->_connection];
      goto LABEL_12;
    }
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      [(CSClientXPCConnection *)self _handleClientError:v5 client:self->_connection];
      goto LABEL_12;
    }
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      char v14 = "-[CSClientXPCConnection _handleClientEvent:]";
      id v8 = "%s ignore unknown types of message";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v13 = 136315650;
      char v14 = "-[CSClientXPCConnection _handleClientEvent:]";
      __int16 v15 = 2050;
      int v16 = v5;
      __int16 v17 = 2050;
      __int16 v18 = connection;
      id v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      id v9 = v11;
      uint32_t v10 = 32;
      goto LABEL_9;
    }
  }
LABEL_12:
}

- (void)sendMessageToClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CSClientXPCConnection *)self queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100142D18;
    v7[3] = &unk_100253B08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v10 = "-[CSClientXPCConnection sendMessageToClient:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Cannot send nil message", buf, 0xCu);
    }
  }
}

- (void)activateConnection
{
  objc_initWeak(&location, self);
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100142F0C;
  v4[3] = &unk_100252DA8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_getAudioProvideWithContext:(id)a3 streamClientType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CSAudioSessionProvidingProxy *)self->_audioSessionProvidingProxy audioSessionProvider];
  [v7 setAudioSessionDelegate:0];

  id v8 = [(CSAudioAlertProvidingProxy *)self->_audioAlertProvidingProxy audioAlertProvider];
  [v8 setAudioAlertDelegate:0];

  id v9 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  uint32_t v10 = [v9 audioProviderWithContext:v6 error:0];

  if (v10)
  {
    id v11 = v10;
    [v11 setAudioSessionDelegate:self->_audioSessionProvidingProxy];
    [(CSAudioSessionProvidingProxy *)self->_audioSessionProvidingProxy setAudioSessionProvider:v11];
    [(CSAudioSessionProvidingProxy *)self->_audioSessionProvidingProxy setStreamClientType:a4];
    id v12 = v11;
    [(CSAudioStreamProvidingProxy *)self->_audioStreamProvidingProxy setAudioStreamProvidingForProxy:v12];
    [(CSAudioStreamProvidingProxy *)self->_audioStreamProvidingProxy setInitialContext:v6];
    [(CSAudioStreamProvidingProxy *)self->_audioStreamProvidingProxy setTriggerInfoProviding:v12];
    [(CSAudioStreamProvidingProxy *)self->_audioStreamProvidingProxy setStreamClientType:a4];
    id v13 = v12;
    [v13 setAudioAlertDelegate:self->_audioAlertProvidingProxy];
    [(CSAudioAlertProvidingProxy *)self->_audioAlertProvidingProxy setAudioAlertProvider:v13];
    [(CSAudioAlertProvidingProxy *)self->_audioAlertProvidingProxy setStreamClientType:a4];
    id v14 = v13;
    [(CSAudioMeterProvidingProxy *)self->_audioMeterProvidingProxy setAudioMeterProvider:v14];
    [(CSAudioMeterProvidingProxy *)self->_audioMeterProvidingProxy setStreamClientType:a4];
    [(CSAudioMetricProvidingProxy *)self->_audioMetricProvidingProxy setAudioMetricProvider:v14];
    [(CSAudioMetricProvidingProxy *)self->_audioMetricProvidingProxy setStreamClientType:a4];
  }
  return v10 != 0;
}

- (CSClientXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSClientXPCConnection;
  id v6 = [(CSClientXPCConnection *)&v28 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("corespeechd xpc connection client queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint32_t v10 = v7->_queue;
    id v11 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v10, v11);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
    id v12 = [[CSAudioSessionProvidingProxy alloc] initWithXPCConnection:v7];
    audioSessionProvidingProxy = v7->_audioSessionProvidingProxy;
    v7->_audioSessionProvidingProxy = v12;

    id v14 = [[CSFallbackAudioSessionReleaseProvidingProxy alloc] initWithXPCConnection:v7];
    fallbackAudioSessionProvidingProxy = v7->_fallbackAudioSessionProvidingProxy;
    v7->_fallbackAudioSessionProvidingProxy = v14;

    int v16 = [[CSAudioStreamProvidingProxy alloc] initWithXPCConnection:v7];
    audioStreamProvidingProxy = v7->_audioStreamProvidingProxy;
    v7->_audioStreamProvidingProxy = v16;

    __int16 v18 = [[CSAudioAlertProvidingProxy alloc] initWithXPCConnection:v7];
    audioAlertProvidingProxy = v7->_audioAlertProvidingProxy;
    v7->_audioAlertProvidingProxy = v18;

    v20 = [[CSAudioMeterProvidingProxy alloc] initWithXPCConnection:v7];
    audioMeterProvidingProxy = v7->_audioMeterProvidingProxy;
    v7->_audioMeterProvidingProxy = v20;

    int64_t v22 = [[CSAudioMetricProvidingProxy alloc] initWithXPCConnection:v7];
    audioMetricProvidingProxy = v7->_audioMetricProvidingProxy;
    v7->_audioMetricProvidingProxy = v22;

    v24 = +[CSAudioSessionInfoProvider sharedInstance];
    v25 = [[CSAudioSessionInfoProvidingProxy alloc] initWithXPCConnection:v7];
    audioSessionInfoProvidingProxy = v7->_audioSessionInfoProvidingProxy;
    v7->_audioSessionInfoProvidingProxy = v25;

    [v24 registerObserver:v7->_audioSessionInfoProvidingProxy];
    [(CSAudioSessionInfoProvidingProxy *)v7->_audioSessionInfoProvidingProxy setAudioSessionInfoProvider:v24];
  }
  return v7;
}

@end