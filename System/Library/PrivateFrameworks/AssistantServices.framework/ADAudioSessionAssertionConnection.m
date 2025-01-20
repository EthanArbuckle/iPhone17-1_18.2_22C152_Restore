@interface ADAudioSessionAssertionConnection
- (ADAudioSessionAssertionConnection)initWithXPCConnection:(id)a3;
- (NSString)description;
- (void)_clearXPCConnection;
- (void)_finalizeWithContext:(id)a3 error:(id)a4;
- (void)_relinquishAssertionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5;
- (void)acquireAudioSessionWithContext:(id)a3 relinquishmentHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)relinquishAudioSessionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5 completion:(id)a6;
@end

@implementation ADAudioSessionAssertionConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relinquishmentHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_clearXPCConnection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int processIdentifier = self->_processIdentifier;
      int v7 = 136315906;
      v8 = "-[ADAudioSessionAssertionConnection _clearXPCConnection]";
      __int16 v9 = 2048;
      v10 = self;
      __int16 v11 = 1024;
      int v12 = processIdentifier;
      __int16 v13 = 2112;
      v14 = xpcConnection;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %p (pid = %d) xpcConnection = %@", (uint8_t *)&v7, 0x26u);
      xpcConnection = self->_xpcConnection;
    }
    [(NSXPCConnection *)xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    v6 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)_relinquishAssertionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  assertion = self->_assertion;
  if (assertion)
  {
    __int16 v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int processIdentifier = self->_processIdentifier;
      int v14 = 136315906;
      v15 = "-[ADAudioSessionAssertionConnection _relinquishAssertionWithContext:error:options:]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 1024;
      int v19 = processIdentifier;
      __int16 v20 = 2112;
      v21 = assertion;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %p (pid = %d) assertion = %@", (uint8_t *)&v14, 0x26u);
      assertion = self->_assertion;
    }
    if (v9) {
      [(AFRelinquishableAssertion *)assertion relinquishWithError:v9 options:a5];
    }
    else {
      [(AFRelinquishableAssertion *)assertion relinquishWithContext:v8 options:a5];
    }
    __int16 v13 = self->_assertion;
    self->_assertion = 0;
  }
}

- (void)_finalizeWithContext:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AFTwoArgumentSafetyBlock *)self->_relinquishmentHandler invokeWithValue:v6 andValue:v7])
  {
    id v8 = AFSiriLogContextDaemon;
    if (v7)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int processIdentifier = self->_processIdentifier;
        int v11 = 136315906;
        int v12 = "-[ADAudioSessionAssertionConnection _finalizeWithContext:error:]";
        __int16 v13 = 2048;
        int v14 = self;
        __int16 v15 = 1024;
        int v16 = processIdentifier;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %p (pid = %d) error = %@", (uint8_t *)&v11, 0x26u);
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = self->_processIdentifier;
      int v11 = 136315906;
      int v12 = "-[ADAudioSessionAssertionConnection _finalizeWithContext:error:]";
      __int16 v13 = 2048;
      int v14 = self;
      __int16 v15 = 1024;
      int v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %p (pid = %d) context = %@", (uint8_t *)&v11, 0x26u);
    }
  }
  [(ADAudioSessionAssertionConnection *)self _clearXPCConnection];
}

- (void)invalidate
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    *(_DWORD *)buf = 136315650;
    id v8 = "-[ADAudioSessionAssertionConnection invalidate]";
    __int16 v9 = 2048;
    int v10 = self;
    __int16 v11 = 1024;
    int v12 = processIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p (pid = %d)", buf, 0x1Cu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A234;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)relinquishAudioSessionWithContext:(id)a3 error:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    __int16 v15 = v13;
    int v16 = AFAssertionRelinquishmentOptionsGetNames();
    *(_DWORD *)buf = 136316418;
    v27 = "-[ADAudioSessionAssertionConnection relinquishAudioSessionWithContext:error:options:completion:]";
    __int16 v28 = 2048;
    v29 = self;
    __int16 v30 = 1024;
    int v31 = processIdentifier;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %p (pid = %d) context = %@, error = %@, options = %@", buf, 0x3Au);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A4C0;
  block[3] = &unk_100509510;
  block[4] = self;
  id v22 = v10;
  id v24 = v12;
  unint64_t v25 = a5;
  id v23 = v11;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(queue, block);
}

- (void)acquireAudioSessionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "-[ADAudioSessionAssertionConnection acquireAudioSessionWithContext:relinquishmentHandler:]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 1024;
    int v21 = processIdentifier;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %p (pid = %d) context = %@", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A724;
  block[3] = &unk_10050E1D8;
  id v14 = v6;
  id v15 = v7;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int processIdentifier = self->_processIdentifier;
    *(_DWORD *)buf = 136315650;
    __int16 v9 = "-[ADAudioSessionAssertionConnection dealloc]";
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = processIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p (pid = %d)", buf, 0x1Cu);
  }
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"%@ Deallocated", self];
  id v6 = +[AFError errorWithCode:41 description:v5];

  [(ADAudioSessionAssertionConnection *)self _relinquishAssertionWithContext:0 error:v6 options:0];
  [(ADAudioSessionAssertionConnection *)self _finalizeWithContext:0 error:v6];

  v7.receiver = self;
  v7.super_class = (Class)ADAudioSessionAssertionConnection;
  [(ADAudioSessionAssertionConnection *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)ADAudioSessionAssertionConnection;
  v4 = [(ADAudioSessionAssertionConnection *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@ {pid = %d}", v4, self->_processIdentifier];

  return (NSString *)v5;
}

- (ADAudioSessionAssertionConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADAudioSessionAssertionConnection;
  id v6 = [(ADAudioSessionAssertionConnection *)&v15 init];
  if (v6)
  {
    objc_super v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    __int16 v9 = AFAudioSessionAssertionGetConnectionWorkloop();
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.assistant.audio-session-assertion.server-connection", v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    v6->_int processIdentifier = [v5 processIdentifier];
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    [(NSXPCConnection *)v6->_xpcConnection _setQueue:v6->_queue];
    __int16 v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int processIdentifier = v6->_processIdentifier;
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[ADAudioSessionAssertionConnection initWithXPCConnection:]";
      __int16 v18 = 2048;
      id v19 = v6;
      __int16 v20 = 1024;
      int v21 = processIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %p (pid = %d)", buf, 0x1Cu);
    }
  }

  return v6;
}

@end