@interface CSAttendingUsecaseProxy
- (CSAttendingAnnounceHandler)announceHandler;
- (CSAttendingService)usecaseController;
- (CSAttendingServiceDelegate)delegate;
- (CSAttendingServiceDelegate)listenerDelegate;
- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy;
- (CSAttendingUsecaseManager)usecaseManager;
- (CSAttendingUsecaseProxy)initWithConnection:(id)a3 usecaseManager:(id)a4 attendingStatesProvidingProxy:(id)a5;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)errorHandler;
- (void)_invokeHandler;
- (void)attendingStoppedWithReason:(int64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)setAnnounceHandler:(id)a3;
- (void)setAttendingStatesProvidingProxy:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setListenerDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUsecaseController:(id)a3;
- (void)setUsecaseManager:(id)a3;
- (void)setupConnectionErrorHandler:(id)a3;
- (void)setupListenerDelegate:(id)a3;
- (void)speechStartDetectedWithEventInfo:(id)a3;
- (void)startAttendingWithOptions:(id)a3 completion:(id)a4;
- (void)stopAttendingWithReason:(int64_t)a3;
@end

@implementation CSAttendingUsecaseProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendingStatesProvidingProxy, 0);
  objc_storeStrong((id *)&self->_announceHandler, 0);
  objc_storeStrong((id *)&self->_listenerDelegate, 0);
  objc_storeStrong((id *)&self->_usecaseController, 0);
  objc_destroyWeak((id *)&self->_usecaseManager);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAttendingStatesProvidingProxy:(id)a3
{
}

- (CSAttendingStatesProvidingProxy)attendingStatesProvidingProxy
{
  return self->_attendingStatesProvidingProxy;
}

- (void)setAnnounceHandler:(id)a3
{
}

- (CSAttendingAnnounceHandler)announceHandler
{
  return self->_announceHandler;
}

- (void)setListenerDelegate:(id)a3
{
}

- (CSAttendingServiceDelegate)listenerDelegate
{
  return self->_listenerDelegate;
}

- (void)setUsecaseController:(id)a3
{
}

- (CSAttendingService)usecaseController
{
  return self->_usecaseController;
}

- (void)setUsecaseManager:(id)a3
{
}

- (CSAttendingUsecaseManager)usecaseManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usecaseManager);
  return (CSAttendingUsecaseManager *)WeakRetained;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
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

- (void)setDelegate:(id)a3
{
}

- (CSAttendingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttendingServiceDelegate *)WeakRetained;
}

- (void)speechStartDetectedWithEventInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012688;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attendingStoppedWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012804;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000129A0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAttendingWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012A58;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)startAttendingWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BD4;
  block[3] = &unk_100253280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[CSAttendingUsecaseProxy dealloc]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc: %@", buf, 0x16u);
  }
  usecaseController = self->_usecaseController;
  self->_usecaseController = 0;

  [(CSAttendingAnnounceHandler *)self->_announceHandler setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)CSAttendingUsecaseProxy;
  [(CSAttendingUsecaseProxy *)&v5 dealloc];
}

- (void)_invokeHandler
{
  errorHandler = (void (**)(id, SEL))self->_errorHandler;
  if (errorHandler)
  {
    errorHandler[2](errorHandler, a2);
    id v4 = self->_errorHandler;
    self->_errorHandler = 0;
  }
}

- (void)setupConnectionErrorHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000131B8;
  block[3] = &unk_1002535D8;
  block[4] = self;
  id v6 = v4;
  id v18 = v6;
  dispatch_async(queue, block);
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_connection);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000131FC;
  v12[3] = &unk_1002529E0;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [(NSXPCConnection *)connection setInterruptionHandler:v12];
  __int16 v8 = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001339C;
  v9[3] = &unk_1002529E0;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  [(NSXPCConnection *)v8 setInvalidationHandler:v9];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)setupListenerDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001364C;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttendingUsecaseProxy)initWithConnection:(id)a3 usecaseManager:(id)a4 attendingStatesProvidingProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSAttendingUsecaseProxy;
  id v12 = [(CSAttendingUsecaseProxy *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeWeak((id *)&v13->_usecaseManager, v10);
    id v14 = objc_alloc_init(CSAttendingAnnounceHandler);
    announceHandler = v13->_announceHandler;
    v13->_announceHandler = v14;

    objc_storeStrong((id *)&v13->_attendingStatesProvidingProxy, a5);
    uint64_t v16 = +[CSUtils getSerialQueue:@"CSAttendingUsecaseProxy Queue" qualityOfService:33];
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    id v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSAttendingUsecaseProxy initWithConnection:usecaseManager:attendingStatesProvidingProxy:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v13;
}

@end