@interface CSFallbackAudioSessionReleaseProvidingProxy
- (CSClientXPCConnection)xpcConnection;
- (CSFallbackAudioSessionReleaseProvidingProxy)initWithXPCConnection:(id)a3;
- (void)_handleDeactivateAudioSessionRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSFallbackAudioSessionReleaseProvidingProxy

- (void).cxx_destruct
{
}

- (void)setXpcConnection:(id)a3
{
}

- (CSClientXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (CSClientXPCConnection *)WeakRetained;
}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  connection = (_xpc_connection_s *)a4;
  id v9 = a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL(reply, "result", a5);
  if (v9)
  {
    id v11 = [v9 domain];
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v9 code]);
  }
  xpc_connection_send_message(connection, reply);
}

- (void)_handleDeactivateAudioSessionRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  int64_t int64 = xpc_dictionary_get_int64(a4, "option");
  id v11 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  v12 = [v11 fetchFallbackAudioSessionReleaseProvider];

  if (v12)
  {
    id v16 = 0;
    id v13 = [v12 fallbackDeactivateAudioSession:int64 error:&v16];
    id v14 = v16;
    [(CSFallbackAudioSessionReleaseProvidingProxy *)self _sendReply:v9 client:v8 result:v13 error:v14];
  }
  else
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSFallbackAudioSessionReleaseProvidingProxy _handleDeactivateAudioSessionRequestMessage:messageBody:client:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s CSFallbackAudioSessionReleaseProvider is nil from CSSpeechManager", buf, 0xCu);
    }
    [(CSFallbackAudioSessionReleaseProvidingProxy *)self _sendReply:v9 client:v8 result:0 error:0];
  }
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  if (int64 == 1)
  {
    [(CSFallbackAudioSessionReleaseProvidingProxy *)self _handleDeactivateAudioSessionRequestMessage:v8 messageBody:v9 client:v10];
  }
  else
  {
    int64_t v12 = int64;
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[CSFallbackAudioSessionReleaseProvidingProxy handleXPCMessage:messageBody:client:]";
      __int16 v16 = 2048;
      int64_t v17 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Cannot handle unexpected message type : %lld", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (CSFallbackAudioSessionReleaseProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSFallbackAudioSessionReleaseProvidingProxy;
  v5 = [(CSFallbackAudioSessionReleaseProvidingProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CSFallbackAudioSessionReleaseProvidingProxy *)v5 setXpcConnection:v4];
  }

  return v6;
}

@end