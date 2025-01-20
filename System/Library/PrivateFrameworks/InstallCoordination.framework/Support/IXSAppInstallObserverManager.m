@interface IXSAppInstallObserverManager
+ (id)sharedInstance;
- (IXSAppInstallObserverManager)init;
- (NSHashTable)clientConnections;
- (NSMutableDictionary)clientToObserverEndpointMap;
- (NSMutableDictionary)clientToObserverServiceNameMap;
- (NSMutableDictionary)listenerRespondsToMap;
- (NSMutableDictionary)serviceRespondsToMap;
- (NSMutableDictionary)serviceToConnectionMap;
- (NSURL)saveURL;
- (OS_dispatch_queue)internalQueue;
- (id)_onQueue_connectionForObserverEndpoint:(id)a3;
- (id)_onQueue_connectionForServiceName:(id)a3;
- (void)_callHandlerForClientConnections:(id)a3;
- (void)_messageInterestedServicesForClientIDs:(id)a3 forMethod:(unint64_t)a4 callMethodOnProxy:(id)a5;
- (void)_onQueue_callRemoteObjectProxyForServiceEndpoint:(id)a3 errorHandler:(id)a4 callHandler:(id)a5;
- (void)_onQueue_callRemoteObjectProxyForServiceName:(id)a3 errorHandler:(id)a4 callHandler:(id)a5;
- (void)_saveMapping;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forRecordPromise:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forRecordPromise:(id)a4;
- (void)coordinatorShouldBeginPostProcessing:(id)a3 forRecordPromise:(id)a4;
- (void)coordinatorShouldBeginRestoringUserData:(id)a3;
- (void)coordinatorShouldPause:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)coordinatorShouldResume:(id)a3;
- (void)promise:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)promiseDidCompleteSuccessfully:(id)a3;
- (void)registerClientConnection:(id)a3;
- (void)registerListenerEndpoint:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)registerMachServiceName:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)shouldPrioritizeAppWithIdentity:(id)a3 forClientIDs:(id)a4;
- (void)unregisterClientConnection:(id)a3;
@end

@implementation IXSAppInstallObserverManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A328;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109E58 != -1) {
    dispatch_once(&qword_100109E58, block);
  }
  v2 = (void *)qword_100109E50;

  return v2;
}

- (NSURL)saveURL
{
  v2 = +[IXGlobalConfiguration sharedInstance];
  v3 = [v2 dataDirectoryAbortingOnError];

  v4 = [v3 URLByAppendingPathComponent:@"ObserverRegistry.plist" isDirectory:0];

  return (NSURL *)v4;
}

- (IXSAppInstallObserverManager)init
{
  v78.receiver = self;
  v78.super_class = (Class)IXSAppInstallObserverManager;
  v2 = [(IXSAppInstallObserverManager *)&v78 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordinationd.AppInstallObserverManager", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = [(IXSAppInstallObserverManager *)v2 saveURL];
    id v77 = 0;
    v7 = +[NSData dataWithContentsOfURL:v6 options:3 error:&v77];
    id v8 = v77;

    if (!v7)
    {
      v16 = 0;
      v24 = 0;
      goto LABEL_29;
    }
    id v76 = v8;
    id v9 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v7 error:&v76];
    id v10 = v76;

    if (!v9)
    {
      v24 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10008F224(v2);
      }
      v14 = 0;
      v16 = 0;
      goto LABEL_24;
    }
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v9 decodeObjectOfClasses:v14 forKey:@"ClientObserverMap"];
    if (v15)
    {
      v16 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = objc_opt_class();
        if (sub_100082C9C(v16, v17, v18, v19, 0))
        {
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = objc_opt_class();
          v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v21, objc_opt_class(), 0);

          uint64_t v23 = [v9 decodeObjectOfClasses:v22 forKey:@"RespondsToMap"];
          if (v23)
          {
            v24 = v23;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = objc_opt_class();
              uint64_t v26 = objc_opt_class();
              if (sub_100082ED8(v24, v25, v26)) {
                goto LABEL_25;
              }
              v27 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                sub_10008F428(v27, v28, v29, v30, v31, v32, v33, v34);
              }
            }
            else
            {
              v27 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                sub_10008F4A0(v27, v69, v70, v71, v72, v73, v74, v75);
              }
            }
          }
          else
          {
            v24 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_10008F378(v2, v9);
            }
          }
          v14 = v22;
LABEL_24:

          v24 = 0;
          v22 = v14;
LABEL_25:
          [v9 finishDecoding];

          if (v16 && v24)
          {
            v50 = [v16 mutableCopy];
            clientToObserverServiceNameMap = v2->_clientToObserverServiceNameMap;
            v2->_clientToObserverServiceNameMap = v50;

            v52 = [v24 mutableCopy];
            serviceRespondsToMap = v2->_serviceRespondsToMap;
            v2->_serviceRespondsToMap = v52;

            [(NSMutableDictionary *)v2->_clientToObserverServiceNameMap enumerateKeysAndObjectsUsingBlock:&stru_1000E9868];
            [(NSMutableDictionary *)v2->_serviceRespondsToMap enumerateKeysAndObjectsUsingBlock:&stru_1000E98A8];
LABEL_30:
            uint64_t v60 = objc_opt_new();
            serviceToConnectionMap = v2->_serviceToConnectionMap;
            v2->_serviceToConnectionMap = (NSMutableDictionary *)v60;

            uint64_t v62 = objc_opt_new();
            clientToObserverEndpointMap = v2->_clientToObserverEndpointMap;
            v2->_clientToObserverEndpointMap = (NSMutableDictionary *)v62;

            uint64_t v64 = objc_opt_new();
            listenerRespondsToMap = v2->_listenerRespondsToMap;
            v2->_listenerRespondsToMap = (NSMutableDictionary *)v64;

            uint64_t v66 = +[NSHashTable weakObjectsHashTable];
            clientConnections = v2->_clientConnections;
            v2->_clientConnections = (NSHashTable *)v66;

            return v2;
          }
          id v8 = v10;
LABEL_29:
          uint64_t v54 = objc_opt_new();
          v55 = v2->_clientToObserverServiceNameMap;
          v2->_clientToObserverServiceNameMap = (NSMutableDictionary *)v54;

          uint64_t v56 = objc_opt_new();
          v57 = v2->_serviceRespondsToMap;
          v2->_serviceRespondsToMap = (NSMutableDictionary *)v56;

          v58 = +[IXFileManager defaultManager];
          v59 = [(IXSAppInstallObserverManager *)v2 saveURL];
          [v58 removeItemAtURL:v59 error:0];

          id v10 = v8;
          goto LABEL_30;
        }
        v35 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10008F518(v35, v43, v44, v45, v46, v47, v48, v49);
        }
      }
      else
      {
        v35 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10008F590(v35, v36, v37, v38, v39, v40, v41, v42);
        }
      }

      v24 = v16;
    }
    else
    {
      v24 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10008F2C8(v2, v9);
      }
    }
    v16 = 0;
    goto LABEL_24;
  }
  return v2;
}

- (void)_saveMapping
{
  id v3 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  dispatch_queue_t v4 = [(IXSAppInstallObserverManager *)self clientToObserverServiceNameMap];
  [v3 encodeObject:v4 forKey:@"ClientObserverMap"];

  v5 = [(IXSAppInstallObserverManager *)self serviceRespondsToMap];
  [v3 encodeObject:v5 forKey:@"RespondsToMap"];

  v6 = [v3 encodedData];

  if (v6)
  {
    v7 = [(IXSAppInstallObserverManager *)self saveURL];
    id v13 = 0;
    unsigned __int8 v8 = [v6 writeToURL:v7 options:268435457 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      id v10 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(IXSAppInstallObserverManager *)self saveURL];
        uint64_t v12 = [v11 path];
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = "-[IXSAppInstallObserverManager _saveMapping]";
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to write observer map to %@ : %@", buf, 0x20u);
      }
    }
  }
}

- (void)registerMachServiceName:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IXSAppInstallObserverManager *)self internalQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B19C;
  v13[3] = &unk_1000E9408;
  id v14 = v9;
  uint64_t v15 = self;
  id v16 = v8;
  unint64_t v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

- (void)registerListenerEndpoint:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IXSAppInstallObserverManager *)self internalQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B4B0;
  v13[3] = &unk_1000E9408;
  id v14 = v9;
  uint64_t v15 = self;
  id v16 = v8;
  unint64_t v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

- (void)registerClientConnection:(id)a3
{
  id v4 = a3;
  v5 = [(IXSAppInstallObserverManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B750;
  v7[3] = &unk_1000E8E08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)unregisterClientConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(IXSAppInstallObserverManager *)self internalQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002B8E8;
    v6[3] = &unk_1000E8E08;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (id)_onQueue_connectionForServiceName:(id)a3
{
  id v4 = a3;
  v5 = [(IXSAppInstallObserverManager *)self serviceToConnectionMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v4 options:4096];
    if (v7)
    {
      id v8 = v7;
      id v9 = +[IXAppInstallObserverProtocolInterface interface];
      [v8 setRemoteObjectInterface:v9];

      objc_initWeak((id *)location, v8);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10002BCC8;
      v19[3] = &unk_1000E98D0;
      id v10 = v4;
      id v20 = v10;
      objc_copyWeak(&v21, (id *)location);
      [v8 setInterruptionHandler:v19];
      objc_initWeak(&from, self);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002BDA4;
      v15[3] = &unk_1000E98D0;
      id v11 = v10;
      id v16 = v11;
      objc_copyWeak(&v17, &from);
      [v8 setInvalidationHandler:v15];
      [v8 resume];
      id v12 = [(IXSAppInstallObserverManager *)self serviceToConnectionMap];
      [v12 setObject:v8 forKeyedSubscript:v11];

      id v13 = v8;
      objc_destroyWeak(&v17);

      objc_destroyWeak(&from);
      objc_destroyWeak(&v21);

      objc_destroyWeak((id *)location);
      id v6 = v13;
    }
    else
    {
      id v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "-[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]";
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Failed to create NSXPCConnection for service %@", location, 0x16u);
      }
      id v6 = 0;
    }
  }

  return v6;
}

- (void)_onQueue_callRemoteObjectProxyForServiceName:(id)a3 errorHandler:(id)a4 callHandler:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = [(IXSAppInstallObserverManager *)self _onQueue_connectionForServiceName:a3];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  if (v11)
  {
    v8[2](v8, v11);
  }
  else
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      id v14 = "-[IXSAppInstallObserverManager _onQueue_callRemoteObjectProxyForServiceName:errorHandler:callHandler:]";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to get proxy for connection %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (id)_onQueue_connectionForObserverEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v3];
  if (v4)
  {
    v5 = +[IXAppInstallObserverProtocolInterface interface];
    [v4 setRemoteObjectInterface:v5];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002C288;
    v15[3] = &unk_1000E8FA8;
    id v6 = v3;
    id v16 = v6;
    [v4 setInterruptionHandler:v15];
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_10002C350;
    int v13 = &unk_1000E8FA8;
    id v14 = v6;
    [v4 setInvalidationHandler:&v10];
    objc_msgSend(v4, "resume", v10, v11, v12, v13);
    id v7 = v4;

    id v8 = v16;
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to create NSXPCConnection for endpoint %@", buf, 0x16u);
    }
  }

  return v4;
}

- (void)_onQueue_callRemoteObjectProxyForServiceEndpoint:(id)a3 errorHandler:(id)a4 callHandler:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = [(IXSAppInstallObserverManager *)self _onQueue_connectionForObserverEndpoint:a3];
  uint64_t v11 = [v10 remoteObjectProxyWithErrorHandler:v9];

  if (v11)
  {
    v8[2](v8, v11);
  }
  else
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      id v14 = "-[IXSAppInstallObserverManager _onQueue_callRemoteObjectProxyForServiceEndpoint:errorHandler:callHandler:]";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to get proxy for connection %@", (uint8_t *)&v13, 0x16u);
    }
  }
  [v10 invalidate];
}

- (void)_messageInterestedServicesForClientIDs:(id)a3 forMethod:(unint64_t)a4 callMethodOnProxy:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IXSAppInstallObserverManager *)self internalQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C5D0;
  v13[3] = &unk_1000E9920;
  id v14 = v8;
  __int16 v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

- (void)_callHandlerForClientConnections:(id)a3
{
  id v4 = a3;
  v5 = [(IXSAppInstallObserverManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002CE64;
  v7[3] = &unk_1000E9948;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)coordinatorShouldPrioritize:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 creator]);
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 appAssetPromiseDRI]);
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D0F4;
  v12[3] = &unk_1000E9970;
  id v13 = v4;
  id v8 = v4;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v7 forMethod:1 callMethodOnProxy:v12];

  [v8 uniqueIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D158;
  v10[3] = &unk_1000E9998;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v11;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v10];
}

- (void)shouldPrioritizeAppWithIdentity:(id)a3 forClientIDs:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002D27C;
  v11[3] = &unk_1000E9970;
  id v6 = a3;
  id v12 = v6;
  id v7 = a4;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v7 forMethod:128 callMethodOnProxy:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D2E0;
  v9[3] = &unk_1000E9970;
  id v10 = v6;
  id v8 = v6;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v7 forMethod:0x2000 callMethodOnProxy:v9];
}

- (void)coordinatorShouldResume:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 creator]);
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 appAssetPromiseDRI]);
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D47C;
  v12[3] = &unk_1000E9970;
  id v13 = v4;
  id v8 = v4;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v7 forMethod:2 callMethodOnProxy:v12];

  [v8 uniqueIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D4E0;
  v10[3] = &unk_1000E9998;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v11;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v10];
}

- (void)coordinatorShouldPause:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 creator]);
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 appAssetPromiseDRI]);
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D67C;
  v12[3] = &unk_1000E9970;
  id v13 = v4;
  id v8 = v4;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v7 forMethod:4 callMethodOnProxy:v12];

  [v8 uniqueIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D6E0;
  v10[3] = &unk_1000E9998;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v11;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v10];
}

- (void)coordinator:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 creator]);
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 appAssetPromiseDRI]);
  id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002D880;
  v15[3] = &unk_1000E99C0;
  id v16 = v6;
  unint64_t v17 = a4;
  id v10 = v6;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v9 forMethod:8 callMethodOnProxy:v15];

  [v10 uniqueIdentifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002D8F4;
  v12[3] = &unk_1000E99E8;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v14 = a4;
  id v11 = v13;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v12];
}

- (void)coordinatorShouldBeginRestoringUserData:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 creator]);
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000F4BB0, v5, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002DA68;
  v11[3] = &unk_1000E9970;
  id v12 = v4;
  id v7 = v4;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v6 forMethod:256 callMethodOnProxy:v11];

  [v7 uniqueIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DACC;
  v9[3] = &unk_1000E9998;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v10;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v9];
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 creator]);
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 appAssetPromiseDRI]);
  id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002DCA4;
  v18[3] = &unk_1000E9A10;
  id v19 = v6;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v10 forMethod:2064 callMethodOnProxy:v18];

  [v12 uniqueIdentifier];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002DD18;
  v15[3] = &unk_1000E9A38;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v11;
  id v13 = v11;
  id v14 = v16;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v15];
}

- (void)coordinatorShouldBeginPostProcessing:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 creator]);
  id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, &off_1000F4BC8, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002DED4;
  v17[3] = &unk_1000E9A10;
  id v18 = v6;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v9 forMethod:0x4000 callMethodOnProxy:v17];

  [v11 uniqueIdentifier];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002DF48;
  v14[3] = &unk_1000E9A38;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v10;
  id v12 = v10;
  id v13 = v15;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v14];
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 creator]);
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 appAssetPromiseDRI]);
  id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002E120;
  v18[3] = &unk_1000E9A10;
  id v19 = v6;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v10 forMethod:4128 callMethodOnProxy:v18];

  [v12 uniqueIdentifier];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002E194;
  v15[3] = &unk_1000E9A38;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v11;
  id v13 = v11;
  id v14 = v16;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v15];
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 creator]);
  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 appAssetPromiseDRI]);
  id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, 0);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002E37C;
  v21[3] = &unk_1000E9A60;
  id v22 = v8;
  id v13 = v9;
  id v23 = v13;
  unint64_t v24 = a5;
  id v14 = v8;
  [(IXSAppInstallObserverManager *)self _messageInterestedServicesForClientIDs:v12 forMethod:64 callMethodOnProxy:v21];

  [v14 uniqueIdentifier];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002E3F0;
  v17[3] = &unk_1000E9A88;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v13;
  unint64_t v20 = a5;
  id v15 = v13;
  id v16 = v18;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v17];
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  [a3 uniqueIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002E4BC;
  v11[3] = &unk_1000E9AB0;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v13 = a4;
  unint64_t v14 = a5;
  double v15 = a6;
  id v10 = v12;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v11];
}

- (void)promiseDidCompleteSuccessfully:(id)a3
{
  [a3 uniqueIdentifier];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002E570;
  v5[3] = &unk_1000E9998;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v5];
}

- (void)promise:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a4;
  [a3 uniqueIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002E64C;
  v11[3] = &unk_1000E9A88;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v8;
  unint64_t v14 = a5;
  id v9 = v8;
  id v10 = v12;
  [(IXSAppInstallObserverManager *)self _callHandlerForClientConnections:v11];
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)clientToObserverServiceNameMap
{
  return self->_clientToObserverServiceNameMap;
}

- (NSMutableDictionary)serviceRespondsToMap
{
  return self->_serviceRespondsToMap;
}

- (NSMutableDictionary)serviceToConnectionMap
{
  return self->_serviceToConnectionMap;
}

- (NSMutableDictionary)clientToObserverEndpointMap
{
  return self->_clientToObserverEndpointMap;
}

- (NSMutableDictionary)listenerRespondsToMap
{
  return self->_listenerRespondsToMap;
}

- (NSHashTable)clientConnections
{
  return self->_clientConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listenerRespondsToMap, 0);
  objc_storeStrong((id *)&self->_clientToObserverEndpointMap, 0);
  objc_storeStrong((id *)&self->_serviceToConnectionMap, 0);
  objc_storeStrong((id *)&self->_serviceRespondsToMap, 0);
  objc_storeStrong((id *)&self->_clientToObserverServiceNameMap, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end