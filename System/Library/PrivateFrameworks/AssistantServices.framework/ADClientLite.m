@interface ADClientLite
- (ADClientLite)initWithListener:(id)a3 connection:(id)a4;
- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4;
- (void)handleRemoteCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6;
@end

@implementation ADClientLite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_listener);
  objc_storeStrong((id *)&self->_outstandingCommandGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_outstandingCommandGroup;
  dispatch_group_enter((dispatch_group_t)v8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100159610;
  v18[3] = &unk_100503BA8;
  v19 = v8;
  id v20 = v7;
  id v9 = v7;
  v10 = v8;
  v11 = objc_retainBlock(v18);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100159678;
  block[3] = &unk_10050E1D8;
  id v16 = v6;
  id v17 = v11;
  block[4] = self;
  id v13 = v6;
  v14 = v11;
  dispatch_async(queue, block);
}

- (void)handleRemoteCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = +[AFPreferences sharedPreferences];
  unsigned __int8 v13 = [v12 assistantIsEnabled];

  v14 = AFSiriLogContextDaemon;
  if (v13)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[ADClientLite handleRemoteCommand:afterCurrentRequest:isOneWay:completion:]";
      __int16 v53 = 2112;
      id v54 = v10;
      __int16 v55 = 1024;
      BOOL v56 = v8;
      __int16 v57 = 1024;
      BOOL v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s command = %@, afterCurrent = %d, isOneWay = %d", buf, 0x22u);
    }
    v15 = +[ADCommandCenter sharedCommandCenter];
    id v16 = [v15 acquireShutdownAssertion];

    id v17 = self->_queue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100159CA8;
    v47[3] = &unk_100503B08;
    v47[4] = self;
    v18 = v10;
    v19 = v17;
    v48 = v19;
    id v50 = v11;
    id v20 = v16;
    id v49 = v20;
    v21 = objc_retainBlock(v47);
    id v22 = objc_alloc((Class)AFThreeArgumentSafetyBlock);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100159DCC;
    v45[3] = &unk_100503B30;
    v23 = v21;
    id v46 = v23;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100159E60;
    v40[3] = &unk_10050CAD0;
    id v24 = [v22 initWithBlock:v45];
    id v41 = v24;
    v42 = self;
    v32 = v18;
    id v25 = v18;
    id v43 = v25;
    BOOL v44 = v8;
    v26 = objc_retainBlock(v40);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100159F4C;
    v33[3] = &unk_100503B80;
    v27 = v19;
    v34 = v27;
    BOOL v38 = v8;
    BOOL v39 = v7;
    id v35 = v25;
    v36 = self;
    id v37 = v24;
    id v28 = v24;
    v29 = objc_retainBlock(v33);
    v30 = v29;
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
      [WeakRetained doClientWork:v30 withTimeoutBlock:v26];
    }
    else
    {
      ((void (*)(void *))v29[2])(v29);
    }

    id v10 = v32;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[ADClientLite handleRemoteCommand:afterCurrentRequest:isOneWay:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Rejecting ClientLite command because Siri is disabled", buf, 0xCu);
    }
    id v20 = +[AFError errorWithCode:18];
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v20);
  }
}

- (ADClientLite)initWithListener:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ADClientLite;
  BOOL v8 = [(ADClientLite *)&v15 init];
  if (v8)
  {
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(0, v9);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    dispatch_group_t v12 = dispatch_group_create();
    outstandingCommandGroup = v8->_outstandingCommandGroup;
    v8->_outstandingCommandGroup = (OS_dispatch_group *)v12;

    objc_storeWeak((id *)&v8->_listener, v6);
    objc_storeWeak((id *)&v8->_connection, v7);
  }

  return v8;
}

@end