@interface CSAudioMeterProvidingProxy
- (CSAudioMeterProviding)audioMeterProvider;
- (CSAudioMeterProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (unint64_t)streamClientType;
- (void)_handleMeterProvidingRequestTypePowerMessage:(id)a3 messageBody:(id)a4 client:(id)a5 powerType:(unint64_t)a6;
- (void)_handleMeterProvidingRequestTypeSetMeteringEnabledMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleMeterProvidingRequestTypeUpdateMetersMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendReplyMessageWithResult:(BOOL)a3 event:(id)a4 client:(id)a5;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAudioMeterProvider:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioMeterProvidingProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_destroyWeak((id *)&self->_audioMeterProvider);
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

- (void)setAudioMeterProvider:(id)a3
{
}

- (CSAudioMeterProviding)audioMeterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioMeterProvider);
  return (CSAudioMeterProviding *)WeakRetained;
}

- (void)_sendReplyMessageWithResult:(BOOL)a3 event:(id)a4 client:(id)a5
{
  v7 = (_xpc_connection_s *)a5;
  xpc_object_t message = xpc_dictionary_create_reply(a4);
  xpc_dictionary_set_BOOL(message, "result", a3);
  xpc_connection_send_message(v7, message);
}

- (void)_handleMeterProvidingRequestTypePowerMessage:(id)a3 messageBody:(id)a4 client:(id)a5 powerType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t uint64 = xpc_dictionary_get_uint64(a4, "channelNumber");
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_100174F2C;
  v28 = &unk_100253B80;
  id v13 = v10;
  id v29 = v13;
  id v14 = v11;
  id v30 = v14;
  v15 = objc_retainBlock(&v25);
  p_audioMeterProvider = &self->_audioMeterProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_audioMeterProvider);

  if (WeakRetained)
  {
    if (a6 == 1)
    {
      id v19 = objc_loadWeakRetained((id *)p_audioMeterProvider);
      objc_msgSend(v19, "averagePowerForChannel:", uint64, v25, v26, v27, v28, v29);
    }
    else
    {
      float v18 = 0.0;
      if (a6)
      {
LABEL_10:
        v23 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "-[CSAudioMeterProvidingProxy _handleMeterProvidingRequestTypePowerMessage:messageBody:client:powerType:]";
          __int16 v33 = 2050;
          double v34 = v18;
          __int16 v35 = 1026;
          int v36 = a6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s power = %{public}f with powerType %{public}u", buf, 0x1Cu);
        }
        v24.n128_f32[0] = v18;
        ((void (*)(void ***, uint64_t, __n128))v15[2])(v15, 1, v24);
        goto LABEL_13;
      }
      id v19 = objc_loadWeakRetained((id *)p_audioMeterProvider);
      objc_msgSend(v19, "peakPowerForChannel:", uint64, v25, v26, v27, v28, v29);
    }
    float v18 = v20;

    goto LABEL_10;
  }
  v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CSAudioMeterProvidingProxy _handleMeterProvidingRequestTypePowerMessage:messageBody:client:powerType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s audioAlertProvider not existing", buf, 0xCu);
  }
  v22.n128_u64[0] = 0;
  ((void (*)(void ***, void, __n128))v15[2])(v15, 0, v22);
LABEL_13:
}

- (void)_handleMeterProvidingRequestTypeUpdateMetersMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  p_audioMeterProvider = &self->_audioMeterProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioMeterProvider);

  v7 = CSLogContextFacilityCoreSpeech;
  if (WeakRetained)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[CSAudioMeterProvidingProxy _handleMeterProvidingRequestTypeUpdateMetersMessage:messageBody:client:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s updateMeters", (uint8_t *)&v9, 0xCu);
    }
    id v8 = objc_loadWeakRetained((id *)p_audioMeterProvider);
    [v8 updateMeters];
  }
  else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    id v10 = "-[CSAudioMeterProvidingProxy _handleMeterProvidingRequestTypeUpdateMetersMessage:messageBody:client:]";
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s audioMeterProvider not existing", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_handleMeterProvidingRequestTypeSetMeteringEnabledMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  BOOL v6 = xpc_dictionary_get_BOOL(a4, "setMeterEnable");
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[CSAudioMeterProvidingProxy _handleMeterProvidingRequestTypeSetMeteringEnabledMessage:messageBody:client:]";
    __int16 v14 = 1026;
    BOOL v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s setMeteringEnabled : %{public}d", (uint8_t *)&v12, 0x12u);
  }
  p_audioMeterProvider = &self->_audioMeterProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_audioMeterProvider);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_audioMeterProvider);
    [v10 setMeteringEnabled:v6];
  }
  else
  {
    id v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[CSAudioMeterProvidingProxy _handleMeterProvidingRequestTypeSetMeteringEnabledMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s audioMeterProvider not existing", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  int v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    float v20 = "-[CSAudioMeterProvidingProxy handleXPCMessage:messageBody:client:]";
    __int16 v21 = 2050;
    int64_t v22 = int64;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Meter Providing Request Message has arrived : %{public}lld", (uint8_t *)&v19, 0x16u);
  }
  switch(int64)
  {
    case 1:
      [(CSAudioMeterProvidingProxy *)self _handleMeterProvidingRequestTypeSetMeteringEnabledMessage:v8 messageBody:v9 client:v10];
      break;
    case 2:
      [(CSAudioMeterProvidingProxy *)self _handleMeterProvidingRequestTypeUpdateMetersMessage:v8 messageBody:v9 client:v10];
      break;
    case 3:
      __int16 v14 = self;
      id v15 = v8;
      id v16 = v9;
      id v17 = v10;
      uint64_t v18 = 0;
      goto LABEL_10;
    case 4:
      __int16 v14 = self;
      id v15 = v8;
      id v16 = v9;
      id v17 = v10;
      uint64_t v18 = 1;
LABEL_10:
      [(CSAudioMeterProvidingProxy *)v14 _handleMeterProvidingRequestTypePowerMessage:v15 messageBody:v16 client:v17 powerType:v18];
      break;
    default:
      id v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136315394;
        float v20 = "-[CSAudioMeterProvidingProxy handleXPCMessage:messageBody:client:]";
        __int16 v21 = 2050;
        int64_t v22 = int64;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unexpected XPC Meter providing request : %{public}lld", (uint8_t *)&v19, 0x16u);
      }
      break;
  }
}

- (CSAudioMeterProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSAudioMeterProvidingProxy;
  v5 = [(CSAudioMeterProvidingProxy *)&v8 init];
  BOOL v6 = v5;
  if (v5) {
    [(CSAudioMeterProvidingProxy *)v5 setXpcConnection:v4];
  }

  return v6;
}

@end