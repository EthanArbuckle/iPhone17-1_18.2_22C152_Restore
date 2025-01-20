@interface CSVoiceIdXPCConnection
- (CSVoiceIdXPCConnection)initWithConnection:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)_handleClientError:(id)a3 client:(id)a4;
- (void)_handleClientEvent:(id)a3;
- (void)_handleClientMessage:(id)a3 client:(id)a4;
- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6;
- (void)activateConnection;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSVoiceIdXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
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

- (void)_handleClientError:(id)a3 client:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 136315650;
    v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    __int16 v18 = 2114;
    v19 = v5;
    __int16 v20 = 2114;
    v21 = v7;
    v9 = "%s Received error %{public}@ from client %{public}@";
    id v11 = v10;
    uint32_t v12 = 32;
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v16, v12);
    goto LABEL_13;
  }
  if (v5 == (char *)&_xpc_error_connection_invalid || v5 == (char *)&_xpc_error_connection_interrupted)
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 136315394;
    v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    __int16 v18 = 2050;
    v19 = (const char *)v7;
    v9 = "%s Client %{public}p connection disconnected, noticing xpc listener";
    goto LABEL_15;
  }
  string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
  v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    __int16 v18 = 2082;
    v19 = string;
    v9 = "%s connection error: %{public}s";
LABEL_15:
    id v11 = v14;
    uint32_t v12 = 22;
    goto LABEL_16;
  }
LABEL_13:
}

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "type");
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
      __int16 v47 = 2050;
      uint64_t v48 = int64;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s MessageType = %{public}lld", buf, 0x16u);
    }
    if (int64 == 2)
    {
      id v11 = xpc_dictionary_get_dictionary(v6, "body");
      uint32_t v12 = v11;
      if (v11)
      {
        v13 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v11, "utterancePath")];
        v14 = xpc_dictionary_get_dictionary(v12, "voiceTriggerEventInfo");
        if (v14)
        {
          v35 = v13;
          id v15 = objc_alloc((Class)NSDictionary);
          int v16 = objc_msgSend(v15, "_cs_initWithXPCObject:", v14);

          v17 = xpc_dictionary_get_dictionary(v12, "otherCtxt");
          if (v17)
          {
            id v18 = objc_alloc((Class)NSDictionary);
            v19 = objc_msgSend(v18, "_cs_initWithXPCObject:", v17);

            uint64_t v20 = xpc_dictionary_get_value(v12, "recordDeviceInfo");
            v34 = (void *)v20;
            if (v20)
            {
              id v32 = [objc_alloc((Class)CSFAudioRecordDeviceInfo) initWithXPCObject:v20];
              uint64_t v21 = xpc_dictionary_get_value(v12, "audioRecordCtx");
              v33 = (void *)v21;
              if (v21)
              {
                id v31 = [objc_alloc((Class)CSAudioRecordContext) initWithXPCObject:v21];
                v22 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                  __int16 v47 = 2050;
                  uint64_t v48 = 2;
                  __int16 v49 = 2114;
                  v50 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Received msg of type %{public}lld for utt %{public}@", buf, 0x20u);
                }
                v23 = v32;
                if (+[CSUtils platformSupportsImplicitUttAddition])
                {
                  v30 = +[CSVoiceTriggerAssetHandler sharedHandler];
                  v36[0] = _NSConcreteStackBlock;
                  v36[1] = 3221225472;
                  v36[2] = sub_1000DFA18;
                  v36[3] = &unk_100251290;
                  id v37 = v35;
                  id v38 = v32;
                  id v39 = v31;
                  id v40 = v16;
                  id v41 = v19;
                  v42 = self;
                  id v43 = v6;
                  id v44 = v8;
                  [v30 getVoiceTriggerAssetWithEndpointId:0 completion:v36];
                }
              }
              else
              {
                v29 = CSLogContextFacilityCoreSpeech;
                v23 = v32;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Null audio context", buf, 0xCu);
                }
              }
            }
            else
            {
              v28 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Null deviceInfo", buf, 0xCu);
              }
            }
          }
          else
          {
            v27 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Null Ctx", buf, 0xCu);
            }
          }

          v13 = v35;
        }
        else
        {
          v26 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Null VTEI", buf, 0xCu);
          }
        }
      }
      else
      {
        v25 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Null msg body", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v46 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
      __int16 v47 = 2050;
      uint64_t v48 = (uint64_t)v6;
      __int16 v49 = 2050;
      v50 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s message = %{public}p, client = %{public}p, cannot handle message", buf, 0x20u);
    }
  }
}

- (void)_handleClientEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_connection)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      [(CSVoiceIdXPCConnection *)self _handleClientMessage:v5 client:self->_connection];
      goto LABEL_12;
    }
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      [(CSVoiceIdXPCConnection *)self _handleClientError:v5 client:self->_connection];
      goto LABEL_12;
    }
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      v14 = "-[CSVoiceIdXPCConnection _handleClientEvent:]";
      v8 = "%s ignore unknown types of message";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    id v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v13 = 136315650;
      v14 = "-[CSVoiceIdXPCConnection _handleClientEvent:]";
      __int16 v15 = 2050;
      int v16 = v5;
      __int16 v17 = 2050;
      id v18 = connection;
      v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      v9 = v11;
      uint32_t v10 = 32;
      goto LABEL_9;
    }
  }
LABEL_12:
}

- (void)activateConnection
{
  objc_initWeak(&location, self);
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E0060;
  v4[3] = &unk_100252DA8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CSVoiceIdXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSVoiceIdXPCConnection;
  id v6 = [(CSVoiceIdXPCConnection *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("corespeechd speaker xpc connection client queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint32_t v10 = v7->_queue;
    id v11 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v10, v11);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
    uint32_t v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[CSVoiceIdXPCConnection initWithConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Created VoiceIdXpc connection", buf, 0xCu);
    }
  }

  return v7;
}

@end