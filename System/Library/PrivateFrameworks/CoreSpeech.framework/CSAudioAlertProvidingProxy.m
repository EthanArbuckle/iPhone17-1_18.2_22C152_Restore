@interface CSAudioAlertProvidingProxy
- (CSAudioAlertProviding)audioAlertProvider;
- (CSAudioAlertProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (unint64_t)streamClientType;
- (void)_handleAlertProvidingRequestTypeAlertStartTimeMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAlertProvidingRequestTypeConfigureAlertBehavior:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAlertProvidingRequestTypePlayAlertSoundMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAlertProvidingRequestTypePlayRecordStartingAlertAndResetEndpointerMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_handleAlertProvidingRequestTypeSetAlertSoundMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendDelegateMessageToClient:(id)a3;
- (void)_sendReplyMessageWithResult:(BOOL)a3 event:(id)a4 client:(id)a5;
- (void)audioAlertProvidingDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAudioAlertProvider:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioAlertProvidingProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_destroyWeak((id *)&self->_audioAlertProvider);
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

- (void)setAudioAlertProvider:(id)a3
{
}

- (CSAudioAlertProviding)audioAlertProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioAlertProvider);
  return (CSAudioAlertProviding *)WeakRetained;
}

- (void)_sendDelegateMessageToClient:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_100252D20;
  v9[0] = xpc_int64_create(7);
  id v5 = v4;
  v9[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
  v7 = [(CSAudioAlertProvidingProxy *)self xpcConnection];
  [v7 sendMessageToClient:v6];

  for (uint64_t i = 1; i != -1; --i)
}

- (void)audioAlertProvidingDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[CSAudioAlertProvidingProxy audioAlertProvidingDidFinishAlertPlayback:ofType:error:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  *(_OWORD *)buf = *(_OWORD *)off_100252D10;
  v14[0] = xpc_int64_create(1);
  v14[1] = xpc_int64_create(a4);
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)buf, v14, 2uLL);
  if (v9)
  {
    objc_msgSend(v9, "domain", v14[0]);
    id v12 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v11, "errorDomain", (const char *)[v12 UTF8String]);

    xpc_dictionary_set_int64(v11, "errorCode", (int64_t)[v9 code]);
  }
  -[CSAudioAlertProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v11, v14[0]);

  for (uint64_t i = 1; i != -1; --i)
}

- (void)_sendReplyMessageWithResult:(BOOL)a3 event:(id)a4 client:(id)a5
{
  v7 = (_xpc_connection_s *)a5;
  xpc_object_t message = xpc_dictionary_create_reply(a4);
  xpc_dictionary_set_BOOL(message, "result", a3);
  xpc_connection_send_message(v7, message);
}

- (void)_handleAlertProvidingRequestTypeConfigureAlertBehavior:(id)a3 messageBody:(id)a4 client:(id)a5
{
  xpc_object_t v6 = xpc_dictionary_get_dictionary(a4, "alertBehavior");
  if (v6)
  {
    id v7 = objc_alloc((Class)NSDictionary);
    id v8 = objc_msgSend(v7, "_cs_initWithXPCObject:", v6);

    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeConfigureAlertBehavior:messageBody:client:]";
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Alert behavior : %{public}@", (uint8_t *)&v15, 0x16u);
    }
    p_audioAlertProvider = &self->_audioAlertProvider;
    id WeakRetained = objc_loadWeakRetained((id *)p_audioAlertProvider);

    if (WeakRetained)
    {
      id v12 = objc_loadWeakRetained((id *)p_audioAlertProvider);
      [v12 configureAlertBehavior:v8];
    }
    else
    {
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315138;
        v16 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeConfigureAlertBehavior:messageBody:client:]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s audioAlertProvider not existing", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeConfigureAlertBehavior:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Invalid alert behavior", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleAlertProvidingRequestTypeAlertStartTimeMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100152344;
  v21 = &unk_100252CF0;
  id v9 = v7;
  id v22 = v9;
  id v10 = v8;
  id v23 = v10;
  xpc_object_t v11 = objc_retainBlock(&v18);
  p_audioAlertProvider = &self->_audioAlertProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_audioAlertProvider);

  if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained((id *)p_audioAlertProvider);
    id v15 = objc_msgSend(v14, "alertStartTime", v18, v19, v20, v21, v22);

    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeAlertStartTimeMessage:messageBody:client:]";
      __int16 v26 = 2050;
      id v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s alertStartTime = %{public}llu", buf, 0x16u);
    }
    ((void (*)(void ***, uint64_t, id))v11[2])(v11, 1, v15);
  }
  else
  {
    __int16 v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeAlertStartTimeMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s audioAlertProvider not existing", buf, 0xCu);
    }
    ((void (*)(void ***, void, void))v11[2])(v11, 0, 0);
  }
}

- (void)_handleAlertProvidingRequestTypePlayRecordStartingAlertAndResetEndpointerMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioAlertProvider);

  if (WeakRetained)
  {
    int64_t int64 = xpc_dictionary_get_int64(v8, "startAlertOverride");
    id v13 = objc_loadWeakRetained((id *)&self->_audioAlertProvider);
    id v14 = [v13 playRecordStartingAlertAndResetEndpointerWithAlertOverride:int64];

    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"NO";
      *(void *)&v18[4] = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypePlayRecordStartingAlertAndResetE"
                           "ndpointerMessage:messageBody:client:]";
      *(_DWORD *)v18 = 136315650;
      if (v14) {
        CFStringRef v16 = @"YES";
      }
      *(_WORD *)&v18[12] = 2048;
      *(void *)&v18[14] = int64;
      __int16 v19 = 2114;
      CFStringRef v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s playRecordStartingAlertAndResetEndpointerWithAlertOverride %lu successful ? %{public}@", v18, 0x20u);
    }
  }
  else
  {
    __int16 v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136315138;
      *(void *)&v18[4] = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypePlayRecordStartingAlertAndResetE"
                           "ndpointerMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s audioAlertProvider not existing", v18, 0xCu);
    }
    id v14 = 0;
  }
  -[CSAudioAlertProvidingProxy _sendReplyMessageWithResult:event:client:](self, "_sendReplyMessageWithResult:event:client:", v14, v10, v9, *(_OWORD *)v18);
}

- (void)_handleAlertProvidingRequestTypePlayAlertSoundMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t int64 = xpc_dictionary_get_int64(a4, "alertType");
  xpc_object_t v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    __int16 v19 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypePlayAlertSoundMessage:messageBody:client:]";
    __int16 v20 = 1026;
    LODWORD(v21) = int64;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s AlertType = %{public}d", (uint8_t *)&v18, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioAlertProvider);

  if (WeakRetained)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_audioAlertProvider);
    id v14 = [v13 playAlertSoundForType:int64];

    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"NO";
      if (v14) {
        CFStringRef v16 = @"YES";
      }
      int v18 = 136315394;
      __int16 v19 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypePlayAlertSoundMessage:messageBody:client:]";
      __int16 v20 = 2114;
      CFStringRef v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Play alert sound successful ? %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    __int16 v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      __int16 v19 = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypePlayAlertSoundMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s audioAlertProvider not existing", (uint8_t *)&v18, 0xCu);
    }
    id v14 = 0;
  }
  [(CSAudioAlertProvidingProxy *)self _sendReplyMessageWithResult:v14 event:v8 client:v9];
}

- (void)_handleAlertProvidingRequestTypeSetAlertSoundMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  string = xpc_dictionary_get_string(v10, "soundPath");
  if (string)
  {
    id v12 = +[NSString stringWithUTF8String:string];
    id v13 = +[NSURL URLWithString:v12];
  }
  else
  {
    id v13 = 0;
  }
  int64_t int64 = xpc_dictionary_get_int64(v10, "alertType");
  BOOL v15 = xpc_dictionary_get_BOOL(v10, "forceSetAlert");

  CFStringRef v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    *(_DWORD *)v24 = 136315906;
    *(void *)&v24[4] = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeSetAlertSoundMessage:messageBody:client:]";
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v13;
    if (v15) {
      CFStringRef v17 = @"YES";
    }
    *(_WORD *)&v24[22] = 1026;
    int v25 = int64;
    __int16 v26 = 2114;
    CFStringRef v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Alert sound url : %{public}@, alertType = %{public}d, force = %{public}@", v24, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioAlertProvider);

  if (WeakRetained)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_audioAlertProvider);
    id v20 = [v19 setAlertSoundFromURL:v13 forType:int64 force:v15];

    CFStringRef v21 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v22 = @"NO";
      if (v20) {
        CFStringRef v22 = @"YES";
      }
      *(_DWORD *)v24 = 136315394;
      *(void *)&v24[4] = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeSetAlertSoundMessage:messageBody:client:]";
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Set alert sound successful ? %{public}@", v24, 0x16u);
    }
  }
  else
  {
    id v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136315138;
      *(void *)&v24[4] = "-[CSAudioAlertProvidingProxy _handleAlertProvidingRequestTypeSetAlertSoundMessage:messageBody:client:]";
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s audioAlertProvider not existing", v24, 0xCu);
    }
    id v20 = 0;
  }
  -[CSAudioAlertProvidingProxy _sendReplyMessageWithResult:event:client:](self, "_sendReplyMessageWithResult:event:client:", v20, v8, v9, *(_OWORD *)v24, *(void *)&v24[16]);
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  id v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    BOOL v15 = "-[CSAudioAlertProvidingProxy handleXPCMessage:messageBody:client:]";
    __int16 v16 = 2050;
    int64_t v17 = int64;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Alert Providing Request Message has arrived : %{public}lld", (uint8_t *)&v14, 0x16u);
  }
  switch(int64)
  {
    case 1:
      [(CSAudioAlertProvidingProxy *)self _handleAlertProvidingRequestTypeSetAlertSoundMessage:v8 messageBody:v9 client:v10];
      break;
    case 2:
      [(CSAudioAlertProvidingProxy *)self _handleAlertProvidingRequestTypePlayAlertSoundMessage:v8 messageBody:v9 client:v10];
      break;
    case 3:
      [(CSAudioAlertProvidingProxy *)self _handleAlertProvidingRequestTypePlayRecordStartingAlertAndResetEndpointerMessage:v8 messageBody:v9 client:v10];
      break;
    case 4:
      [(CSAudioAlertProvidingProxy *)self _handleAlertProvidingRequestTypeAlertStartTimeMessage:v8 messageBody:v9 client:v10];
      break;
    case 5:
      [(CSAudioAlertProvidingProxy *)self _handleAlertProvidingRequestTypeConfigureAlertBehavior:v8 messageBody:v9 client:v10];
      break;
    default:
      id v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        BOOL v15 = "-[CSAudioAlertProvidingProxy handleXPCMessage:messageBody:client:]";
        __int16 v16 = 2050;
        int64_t v17 = int64;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unexpected XPC alert providing request : %{public}lld", (uint8_t *)&v14, 0x16u);
      }
      break;
  }
}

- (CSAudioAlertProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSAudioAlertProvidingProxy;
  id v5 = [(CSAudioAlertProvidingProxy *)&v8 init];
  xpc_object_t v6 = v5;
  if (v5) {
    [(CSAudioAlertProvidingProxy *)v5 setXpcConnection:v4];
  }

  return v6;
}

@end