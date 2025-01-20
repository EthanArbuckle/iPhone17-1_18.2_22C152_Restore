@interface CSVoiceIdXPCClient
+ (void)notifyImplicitUtterance:(id)a3 audioDeviceType:(id)a4 audioRecordType:(id)a5 voiceTriggerEventInfo:(id)a6 otherCtxt:(id)a7 completion:(id)a8;
- (CSVoiceIdXPCClient)init;
- (OS_xpc_object)xpcConnection;
- (id)_decodeError:(id)a3;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)_notifyImplicitUtterance:(id)a3 audioDeviceType:(id)a4 audioRecordType:(id)a5 voiceTriggerEventInfo:(id)a6 otherCtxt:(id)a7 completion:(id)a8;
- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSVoiceIdXPCClient

- (void).cxx_destruct
{
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (id)_decodeError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    string = (void *)xpc_dictionary_get_string(v3, "resultErrorDomain");
    if (string)
    {
      int64_t int64 = xpc_dictionary_get_int64(v4, "resultErrorCode");
      v7 = +[NSString stringWithUTF8String:string];
      string = +[NSError errorWithDomain:v7 code:int64 userInfo:0];
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5
{
  xpc_object_t message = a3;
  v8 = (_xpc_connection_s *)a4;
  v9 = (void (**)(id, BOOL, void *))a5;
  if (message && v8)
  {
    xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v8, message);
    v11 = v10;
    if (v10)
    {
      BOOL v12 = xpc_dictionary_get_BOOL(v10, "result");
      v13 = [(CSVoiceIdXPCClient *)self _decodeError:v11];
      if (!v9)
      {
LABEL_6:

        goto LABEL_9;
      }
    }
    else
    {
      v13 = +[NSError errorWithDomain:CSErrorDomain code:1251 userInfo:0];
      BOOL v12 = 0;
      if (!v9) {
        goto LABEL_6;
      }
    }
    v9[2](v9, v12, v13);
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_10;
  }
  v11 = +[NSError errorWithDomain:CSErrorDomain code:1252 userInfo:0];
  v9[2](v9, 0, v11);
LABEL_9:

LABEL_10:
}

- (void)_notifyImplicitUtterance:(id)a3 audioDeviceType:(id)a4 audioRecordType:(id)a5 voiceTriggerEventInfo:(id)a6 otherCtxt:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10013B6D0;
  v39[3] = &unk_100253100;
  id v18 = a8;
  id v40 = v18;
  v19 = objc_retainBlock(v39);
  id v38 = [objc_alloc((Class)NSDictionary) initWithDictionary:v16];
  *(_OWORD *)keys = *(_OWORD *)&off_1002525D0;
  long long v48 = *(_OWORD *)&off_1002525E0;
  v49 = "audioRecordCtx";
  uint64_t v20 = objc_msgSend(v16, "_cs_xpcObject");
  if (!v20)
  {
LABEL_12:
    v34 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(values) = 136315138;
      *(void *)((char *)&values + 4) = "-[CSVoiceIdXPCClient _notifyImplicitUtterance:audioDeviceType:audioRecordType:v"
                                         "oiceTriggerEventInfo:otherCtxt:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s Required values is nil, bailout", (uint8_t *)&values, 0xCu);
      if (!v18) {
        goto LABEL_15;
      }
    }
    else if (!v18)
    {
      goto LABEL_15;
    }
    v35 = +[NSError errorWithDomain:CSErrorDomain code:1253 userInfo:0];
    (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v35);

    goto LABEL_15;
  }
  v21 = (void *)v20;
  uint64_t v22 = objc_msgSend(v17, "_cs_xpcObject");
  if (!v22)
  {
LABEL_11:

    goto LABEL_12;
  }
  v23 = (void *)v22;
  id v36 = v16;
  v24 = v19;
  id v25 = v13;
  uint64_t v26 = [v14 xpcObject];
  if (!v26)
  {

    v19 = v24;
    id v16 = v36;
    goto LABEL_11;
  }
  v27 = (void *)v26;
  v28 = [v15 xpcObject];

  id v13 = v25;
  v19 = v24;
  id v16 = v36;
  if (!v28) {
    goto LABEL_12;
  }
  *(void *)&long long values = xpc_string_create((const char *)[v13 UTF8String]);
  *((void *)&values + 1) = objc_msgSend(v38, "_cs_xpcObject");
  uint64_t v44 = objc_msgSend(v17, "_cs_xpcObject");
  uint64_t v45 = [v14 xpcObject];
  uint64_t v46 = [v15 xpcObject];
  xpc_object_t v29 = xpc_dictionary_create((const char *const *)keys, (xpc_object_t *)&values, 5uLL);
  *(_OWORD *)v42 = *(_OWORD *)off_100252D20;
  v41[0] = xpc_int64_create(2);
  id v30 = v29;
  v41[1] = v30;
  xpc_object_t v31 = xpc_dictionary_create((const char *const *)v42, v41, 2uLL);
  [(CSVoiceIdXPCClient *)self _sendMessage:v31 connection:self->_xpcConnection completion:v19];

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 32; j != -8; j -= 8)

LABEL_15:
}

- (void)_handleListenerError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v13 = 136315138;
    id v14 = "-[CSVoiceIdXPCClient _handleListenerError:]";
    v7 = "%s cannot handle nil error";
LABEL_11:
    v8 = v6;
    uint32_t v9 = 12;
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, v9);
    goto LABEL_13;
  }
  if (v3 == &_xpc_error_connection_invalid || v3 == &_xpc_error_connection_interrupted)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v13 = 136315138;
    id v14 = "-[CSVoiceIdXPCClient _handleListenerError:]";
    v7 = "%s Listener connection disconnected";
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    id v14 = "-[CSVoiceIdXPCClient _handleListenerError:]";
    __int16 v15 = 2082;
    id v16 = string;
    v7 = "%s connection error: %{public}s";
    v8 = v11;
    uint32_t v9 = 22;
    goto LABEL_15;
  }
LABEL_13:
}

- (void)_handleListenerEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      [(CSVoiceIdXPCClient *)self _handleListenerError:v5];
      goto LABEL_9;
    }
    xpc_type_t v7 = type;
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[CSVoiceIdXPCClient _handleListenerEvent:]";
      __int16 v15 = 2114;
      xpc_type_t v16 = v7;
      uint32_t v9 = "%s ignore unknown types of message: %{public}@";
      xpc_object_t v10 = v8;
      uint32_t v11 = 22;
LABEL_7:
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    BOOL v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      id v14 = "-[CSVoiceIdXPCClient _handleListenerEvent:]";
      uint32_t v9 = "%s cannot handle nil event ";
      xpc_object_t v10 = v12;
      uint32_t v11 = 12;
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)dealloc
{
  [(CSVoiceIdXPCClient *)self disconnect];
  v3.receiver = self;
  v3.super_class = (Class)CSVoiceIdXPCClient;
  [(CSVoiceIdXPCClient *)&v3 dealloc];
}

- (void)disconnect
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_cancel(xpcConnection);
    id v4 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)connect
{
  objc_initWeak(&location, self);
  xpcConnection = self->_xpcConnection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013BB50;
  v4[3] = &unk_100252DA8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(xpcConnection, v4);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CSVoiceIdXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceIdXPCClient;
  v2 = [(CSVoiceIdXPCClient *)&v6 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.corespeech.corespeechd.voiceid.xpc", 0, 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = mach_service;
  }
  return v2;
}

+ (void)notifyImplicitUtterance:(id)a3 audioDeviceType:(id)a4 audioRecordType:(id)a5 voiceTriggerEventInfo:(id)a6 otherCtxt:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_alloc_init(CSVoiceIdXPCClient);
  [(CSVoiceIdXPCClient *)v19 connect];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10013BD54;
  v22[3] = &unk_100253150;
  v23 = v19;
  id v24 = v13;
  id v20 = v13;
  v21 = v19;
  [(CSVoiceIdXPCClient *)v21 _notifyImplicitUtterance:v18 audioDeviceType:v17 audioRecordType:v16 voiceTriggerEventInfo:v15 otherCtxt:v14 completion:v22];
}

@end