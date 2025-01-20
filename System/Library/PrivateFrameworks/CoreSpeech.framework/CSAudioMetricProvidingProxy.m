@interface CSAudioMetricProvidingProxy
- (CSAudioMetricProviding)audioMetricProvider;
- (CSAudioMetricProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (unint64_t)streamClientType;
- (void)_handleMetricProvidingRequestTypeAudioMetricMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAudioMetricProvider:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioMetricProvidingProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_destroyWeak((id *)&self->_audioMetricProvider);
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

- (void)setAudioMetricProvider:(id)a3
{
}

- (CSAudioMetricProviding)audioMetricProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioMetricProvider);
  return (CSAudioMetricProviding *)WeakRetained;
}

- (void)_handleMetricProvidingRequestTypeAudioMetricMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  v7 = (_xpc_connection_s *)a5;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  p_audioMetricProvider = &self->_audioMetricProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_audioMetricProvider);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)p_audioMetricProvider);
    v12 = [v11 audioMetric];

    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      v17 = "-[CSAudioMetricProvidingProxy _handleMetricProvidingRequestTypeAudioMetricMessage:messageBody:client:]";
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s audioMetric = %{public}@", (uint8_t *)&v16, 0x16u);
    }
    xpc_dictionary_set_BOOL(reply, "result", 1);
    v14 = objc_msgSend(v12, "_cs_xpcObject");
    xpc_dictionary_set_value(reply, "audioMetric", v14);
  }
  else
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[CSAudioMetricProvidingProxy _handleMetricProvidingRequestTypeAudioMetricMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s audioMetricProvider not existing", (uint8_t *)&v16, 0xCu);
    }
    xpc_dictionary_set_BOOL(reply, "result", 0);
  }
  xpc_connection_send_message(v7, reply);
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[CSAudioMetricProvidingProxy handleXPCMessage:messageBody:client:]";
    __int16 v16 = 2050;
    int64_t v17 = int64;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Metric Providing Request Message has arrived : %{public}lld", (uint8_t *)&v14, 0x16u);
  }
  if (int64 == 1)
  {
    [(CSAudioMetricProvidingProxy *)self _handleMetricProvidingRequestTypeAudioMetricMessage:v8 messageBody:v9 client:v10];
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[CSAudioMetricProvidingProxy handleXPCMessage:messageBody:client:]";
      __int16 v16 = 2050;
      int64_t v17 = int64;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unexpected XPC Metric providing request : %{public}lld", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (CSAudioMetricProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSAudioMetricProvidingProxy;
  v5 = [(CSAudioMetricProvidingProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CSAudioMetricProvidingProxy *)v5 setXpcConnection:v4];
  }

  return v6;
}

@end