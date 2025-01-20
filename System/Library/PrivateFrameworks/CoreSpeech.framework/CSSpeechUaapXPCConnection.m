@interface CSSpeechUaapXPCConnection
- (BOOL)_handleRegisterMultilingualUaapApp:(id)a3 withAssetFiles:(id)a4 error:(id *)a5;
- (BOOL)_handleRegisterUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 error:(id *)a6;
- (CSSpeechUaapXPCConnection)initWithConnection:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_handleClientError:(id)a3;
- (void)_handleClientMessage:(id)a3;
- (void)_handleDatapackUpdate;
- (void)activate;
- (void)setConnection:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSSpeechUaapXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
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

- (void)_handleDatapackUpdate
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSpeechUaapXPCConnection _handleDatapackUpdate]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s UaaP: processing update to main datapack", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = nullsub_6;
  v4[3] = &unk_100253AE0;
  id v5 = (id)os_transaction_create();
  id v3 = v5;
  sub_100060F34(0, 1, v4);
}

- (BOOL)_handleRegisterMultilingualUaapApp:(id)a3 withAssetFiles:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100123748;
  v22 = sub_100123758;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100123760;
  v14[3] = &unk_100252068;
  v16 = &v24;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  v17 = &v18;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];
  if (a5)
  {
    v11 = (void *)v19[5];
    if (v11) {
      *a5 = v11;
    }
  }
  char v12 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (BOOL)_handleRegisterUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (+[CSUtils supportsUnderstandingOnDevice])
  {
    if (!v10)
    {
      id v10 = +[CSUtils getSiriLanguageWithFallback:0];
    }
    char v12 = sub_10005FC54(v9, v10);
    v13 = +[NSFileManager defaultManager];
    [v13 removeItemAtPath:v12 error:0];

    v14 = +[NSFileManager defaultManager];
    id v53 = 0;
    unsigned __int8 v15 = [v14 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v53];
    id v16 = v53;

    if (v15)
    {
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      char v52 = 1;
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x3032000000;
      v46 = sub_100123748;
      v47 = sub_100123758;
      id v48 = 0;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100123DDC;
      v38[3] = &unk_100252040;
      id v39 = v12;
      v41 = &v49;
      id v17 = v9;
      id v40 = v17;
      v42 = &v43;
      [v11 enumerateObjectsUsingBlock:v38];
      if (a6)
      {
        uint64_t v18 = (void *)v44[5];
        if (v18) {
          *a6 = v18;
        }
      }
      if (_os_feature_enabled_impl())
      {
        v19 = (void *)os_transaction_create();
        id v54 = v17;
        uint64_t v20 = +[NSArray arrayWithObjects:&v54 count:1];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = nullsub_7;
        v36[3] = &unk_100253AE0;
        id v35 = v19;
        id v37 = v35;
        id v21 = v20;
        id v22 = v10;
        id v23 = v36;
        uint64_t v24 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "CSSpeechUaapProcessInstall";
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Processing UaaP app-installs", buf, 0xCu);
        }
        v25 = sub_100060444();
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100060498;
        v60 = &unk_100252D38;
        id v61 = v22;
        id v62 = v21;
        id v63 = v25;
        id v64 = v23;
        uint64_t v26 = v25;
        id v27 = v21;
        v28 = v23;
        id v29 = v22;
        dispatch_async(v26, buf);
      }
      BOOL v30 = *((unsigned char *)v50 + 24) != 0;

      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v49, 8);
      goto LABEL_19;
    }
    v31 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSSpeechUaapXPCConnection _handleRegisterUaapApp:forLocale:withAssetFiles:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v60 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Error while creating UaaP asset directory for %@: %@", buf, 0x20u);
      if (!a6) {
        goto LABEL_18;
      }
    }
    else if (!a6)
    {
LABEL_18:
      BOOL v30 = 0;
LABEL_19:

      goto LABEL_20;
    }
    NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
    v32 = +[NSString stringWithFormat:@"Failed to create UaaP asset directory at %@: %@", v12, v16];
    v56 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    *a6 = +[NSError errorWithDomain:@"com.apple.corespeech.uaap" code:2 userInfo:v33];

    goto LABEL_18;
  }
  if (!a6)
  {
    BOOL v30 = 0;
    goto LABEL_21;
  }
  NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
  CFStringRef v58 = @"UaaP is not supported on this device";
  char v12 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  +[NSError errorWithDomain:@"com.apple.corespeech.uaap" code:3 userInfo:v12];
  BOOL v30 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  return v30;
}

- (void)_handleClientMessage:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "messageType");
  if (uint64 - 1 < 2)
  {
    v7 = xpc_dictionary_get_value(v4, "message");
    id v8 = v7;
    if (v7)
    {
      string = xpc_dictionary_get_string(v7, "bundleId");
      if (string)
      {
        id v10 = +[NSString stringWithUTF8String:string];
        id v11 = xpc_dictionary_get_string(v8, "locale");
        if (v11)
        {
          char v12 = +[NSString stringWithUTF8String:v11];
        }
        else
        {
          char v12 = 0;
        }
        xpc_dictionary_get_array(v8, "assetFiles");
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = +[NSMutableArray array];
        if (v15)
        {
          for (size_t i = 0; i < xpc_array_get_count(v15); ++i)
          {
            v28 = +[NSString stringWithUTF8String:xpc_array_get_string(v15, i)];
            [v26 addObject:v28];
          }
        }
        xpc_dictionary_get_remote_connection(v4);
        id v29 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_object_t reply = xpc_dictionary_create_reply(v4);
        id v39 = 0;
        unsigned __int8 v31 = [(CSSpeechUaapXPCConnection *)self _handleRegisterUaapApp:v10 forLocale:v12 withAssetFiles:v26 error:&v39];
        id v32 = v39;
        v33 = v32;
        if ((v31 & 1) == 0)
        {
          id v34 = [v32 domain];
          xpc_dictionary_set_string(reply, "errorDomain", (const char *)[v34 UTF8String]);

          xpc_dictionary_set_int64(reply, "errorCode", (int64_t)[v33 code]);
          id v35 = [v33 localizedDescription];
          xpc_dictionary_set_string(reply, "errorMessage", (const char *)[v35 UTF8String]);
        }
        xpc_connection_send_message(v29, reply);

        goto LABEL_30;
      }
      uint64_t v24 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v24 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
    }
    goto LABEL_31;
  }
  v6 = (const char *)uint64;
  if (uint64 == 3)
  {
    v13 = xpc_dictionary_get_value(v4, "message");
    id v8 = v13;
    if (v13)
    {
      v14 = xpc_dictionary_get_string(v13, "bundleId");
      if (v14)
      {
        id v10 = +[NSString stringWithUTF8String:v14];
        char v12 = xpc_dictionary_get_dictionary(v8, "assetFiles");
        +[NSMutableDictionary dictionary];
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_100124604;
        applier[3] = &unk_100252018;
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v38 = v15;
        xpc_dictionary_apply(v12, applier);
        xpc_dictionary_get_remote_connection(v4);
        id v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_object_t v17 = xpc_dictionary_create_reply(v4);
        id v36 = 0;
        unsigned __int8 v18 = [(CSSpeechUaapXPCConnection *)self _handleRegisterMultilingualUaapApp:v10 withAssetFiles:v15 error:&v36];
        id v19 = v36;
        uint64_t v20 = v19;
        if ((v18 & 1) == 0)
        {
          id v21 = [v19 domain];
          xpc_dictionary_set_string(v17, "errorDomain", (const char *)[v21 UTF8String]);

          xpc_dictionary_set_int64(v17, "errorCode", (int64_t)[v20 code]);
          id v22 = [v20 localizedDescription];
          xpc_dictionary_set_string(v17, "errorMessage", (const char *)[v22 UTF8String]);
        }
        xpc_connection_send_message(v16, v17);

LABEL_30:
        goto LABEL_31;
      }
      uint64_t v24 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
LABEL_34:
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSSpeechUaapXPCConnection _handleClientMessage:]";
      __int16 v42 = 2080;
      uint64_t v43 = "bundleId";
      v25 = "%s UaaP XPC message was malformed (missing %s)";
      goto LABEL_35;
    }
    uint64_t v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSSpeechUaapXPCConnection _handleClientMessage:]";
      __int16 v42 = 2112;
      uint64_t v43 = (const char *)v4;
      v25 = "%s UaaP XPC connection received an invalid message: %@";
LABEL_35:
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x16u);
    }
LABEL_31:

    goto LABEL_32;
  }
  if (uint64 == 4)
  {
    [(CSSpeechUaapXPCConnection *)self _handleDatapackUpdate];
  }
  else
  {
    id v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSSpeechUaapXPCConnection _handleClientMessage:]";
      __int16 v42 = 2048;
      uint64_t v43 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s UaaP XPC connection received an invalid message: %llu", buf, 0x16u);
    }
  }
LABEL_32:
}

- (void)_handleClientError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  if (v4 == &_xpc_error_connection_invalid)
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      char v12 = "-[CSSpeechUaapXPCConnection _handleClientError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCConnection invalidated", (uint8_t *)&v11, 0xCu);
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    goto LABEL_12;
  }
  v6 = CSLogContextFacilityCoreSpeech;
  BOOL v7 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR);
  if (v5 == &_xpc_error_connection_interrupted)
  {
    if (v7)
    {
      int v11 = 136315138;
      char v12 = "-[CSSpeechUaapXPCConnection _handleClientError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCConnection interrupted", (uint8_t *)&v11, 0xCu);
    }
    invalidationHandler = (void (**)(void))self->_interruptionHandler;
LABEL_12:
    invalidationHandler[2]();
    goto LABEL_13;
  }
  if (v7)
  {
    id v8 = v6;
    int v11 = 136315394;
    char v12 = "-[CSSpeechUaapXPCConnection _handleClientError:]";
    __int16 v13 = 2080;
    string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCConnection error: %s", (uint8_t *)&v11, 0x16u);
  }
LABEL_13:
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v4;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v4;
}

- (void)activate
{
  objc_initWeak(&location, self);
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100124A10;
  v4[3] = &unk_100252DA8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CSSpeechUaapXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSpeechUaapXPCConnection;
  v6 = [(CSSpeechUaapXPCConnection *)&v11 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.corespeechd.uaap-connection", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
  }

  return v7;
}

@end