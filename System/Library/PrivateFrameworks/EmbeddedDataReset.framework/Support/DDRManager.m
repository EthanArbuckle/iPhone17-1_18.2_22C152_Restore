@interface DDRManager
- (BOOL)disallowProximitySetup;
- (DDRLayoutManager)layoutManager;
- (DDRManagerDelegate)delegate;
- (DDRUIPresenter)uiPresenter;
- (NSArray)exclusionPaths;
- (NSString)reason;
- (NSXPCConnection)dataResetWorkerConnection;
- (OS_dispatch_queue)queue;
- (int64_t)mode;
- (void)_obliterateAndBrickDevice:(BOOL)a3;
- (void)doObliterateWithType:(__CFString *)a3 showingProgress:(BOOL)a4 options:(id)a5;
- (void)finishResetOfMode:(int64_t)a3 withError:(id)a4;
- (void)resetConnection;
- (void)resetDataWithRequest:(id)a3 completion:(id)a4;
- (void)resetWithMode:(int64_t)a3 didUpdateWithProgress:(double)a4;
- (void)resetWithModeDidBegin:(int64_t)a3;
- (void)setDataResetWorkerConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisallowProximitySetup:(BOOL)a3;
- (void)setExclusionPaths:(id)a3;
- (void)setLayoutManager:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setReason:(id)a3;
- (void)setUiPresenter:(id)a3;
@end

@implementation DDRManager

- (DDRUIPresenter)uiPresenter
{
  uiPresenter = self->_uiPresenter;
  if (!uiPresenter)
  {
    v4 = objc_alloc_init(DDRUIPresenter);
    v5 = self->_uiPresenter;
    self->_uiPresenter = v4;

    uiPresenter = self->_uiPresenter;
  }
  return uiPresenter;
}

- (DDRLayoutManager)layoutManager
{
  layoutManager = self->_layoutManager;
  if (!layoutManager)
  {
    v4 = objc_alloc_init(DDRLayoutManager);
    v5 = self->_layoutManager;
    self->_layoutManager = v4;

    layoutManager = self->_layoutManager;
  }
  return layoutManager;
}

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (!queue)
  {
    v4 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

- (NSXPCConnection)dataResetWorkerConnection
{
  dataResetWorkerConnection = self->_dataResetWorkerConnection;
  if (!dataResetWorkerConnection)
  {
    v4 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "create data reset worker xpc", (uint8_t *)buf, 2u);
    }

    v5 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.devicedatareset.devicedataresetxpcserviceworker"];
    v6 = self->_dataResetWorkerConnection;
    self->_dataResetWorkerConnection = v5;

    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRWorkerServerProtocol];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    [v7 setClasses:v10 forSelector:"resetDataWithRequest:completion:" argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->_dataResetWorkerConnection setRemoteObjectInterface:v7];
    [(NSXPCConnection *)self->_dataResetWorkerConnection setExportedObject:self];
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDRWorkerClientProtocol];
    [(NSXPCConnection *)self->_dataResetWorkerConnection setExportedInterface:v11];

    objc_initWeak(buf, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003284;
    v16[3] = &unk_1000084D0;
    objc_copyWeak(&v17, buf);
    [(NSXPCConnection *)self->_dataResetWorkerConnection setInterruptionHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003308;
    v14[3] = &unk_1000084D0;
    objc_copyWeak(&v15, buf);
    [(NSXPCConnection *)self->_dataResetWorkerConnection setInvalidationHandler:v14];
    [(NSXPCConnection *)self->_dataResetWorkerConnection resume];
    v12 = [(NSXPCConnection *)self->_dataResetWorkerConnection remoteObjectProxy];
    [v12 setObserving:1];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);

    dataResetWorkerConnection = self->_dataResetWorkerConnection;
  }
  return dataResetWorkerConnection;
}

- (void)resetConnection
{
  v3 = sub_100002D9C(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notifying clients of failed reset in devicedataresetd", v5, 2u);
  }

  dataResetWorkerConnection = self->_dataResetWorkerConnection;
  self->_dataResetWorkerConnection = 0;
}

- (void)resetDataWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[DDRManager setMode:](self, "setMode:", [v6 mode]);
  uint64_t v8 = [(DDRManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000034F4;
  block[3] = &unk_100008548;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)finishResetOfMode:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = sub_100002D9C(2uLL);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100004868((uint64_t)v6, v8);
    }

    uint64_t v8 = [(DDRManager *)self layoutManager];
    [v8 stopLayout];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finishing data reset.", buf, 2u);
  }

  if (a3 > 3)
  {
    [(DDRManager *)self _obliterateAndBrickDevice:a3 == 5];
    id v10 = [(DDRManager *)self delegate];
    [v10 resetWithModeDidFinish:a3 error:v6];

    id v9 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "resetWithMode did finish", v11, 2u);
    }
  }
  else
  {
    id v9 = [(DDRManager *)self delegate];
    [v9 resetWithModeDidFinish:a3 error:v6];
  }
}

- (void)_obliterateAndBrickDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [(DDRManager *)self reason];

  if (v6)
  {
    id v7 = [(DDRManager *)self reason];
    [v5 setObject:v7 forKeyedSubscript:kObliterationMessageKey];

    uint64_t v8 = +[NSNumber numberWithBool:[(DDRManager *)self disallowProximitySetup]];
    [v5 setObject:v8 forKeyedSubscript:kObliterationManagedDeviceWipeKey];

    id v9 = [(DDRManager *)self exclusionPaths];
    [v5 setObject:v9 forKeyedSubscript:kObliterationExclusionPathsKey];
  }
  uint64_t v10 = kObliterationTypeWipeAndBrick;
  uint64_t v11 = kObliterateDataPartition;
  id v12 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling doObliterateWithType", v14, 2u);
  }
  if (v3) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v11;
  }

  [(DDRManager *)self doObliterateWithType:v13 showingProgress:1 options:v5];
}

- (void)doObliterateWithType:(__CFString *)a3 showingProgress:(BOOL)a4 options:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v7];

  [v8 setObject:a3 forKeyedSubscript:kObliterationTypeKey];
  id v9 = +[NSNumber numberWithBool:v5];
  [v8 setObject:v9 forKeyedSubscript:kDisplayProgressBarKey];

  uint64_t v10 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Making call to MobileObliterate", v11, 2u);
  }

  Mobile_Obliterate();
}

- (void)resetWithMode:(int64_t)a3 didUpdateWithProgress:(double)a4
{
  id v6 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Update progress:%lf", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(DDRManager *)self uiPresenter];
  [v7 setProgress:a4];
}

- (void)resetWithModeDidBegin:(int64_t)a3
{
  BOOL v5 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Data reset manager calling delegate resetWithModeDidBegin", v7, 2u);
  }

  id v6 = [(DDRManager *)self delegate];
  [v6 resetWithModeDidBegin:a3];
}

- (DDRManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDRManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataResetWorkerConnection:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setUiPresenter:(id)a3
{
}

- (void)setLayoutManager:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)disallowProximitySetup
{
  return self->_disallowProximitySetup;
}

- (void)setDisallowProximitySetup:(BOOL)a3
{
  self->_disallowProximitySetup = a3;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void)setExclusionPaths:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_uiPresenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataResetWorkerConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end