@interface ContactsSupportServiceDelegate
+ (id)os_log;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CNScheduler)workQueue;
- (CNTCC)tccServices;
- (ContactsSupportServiceDelegate)init;
- (ContactsSupportServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 tccServices:(id)a5;
- (id)serviceProvider;
@end

@implementation ContactsSupportServiceDelegate

+ (id)os_log
{
  if (qword_10002CA48 != -1) {
    dispatch_once(&qword_10002CA48, &stru_100024CF0);
  }
  v2 = (void *)qword_10002CA50;

  return v2;
}

- (ContactsSupportServiceDelegate)init
{
  v3 = +[CNSchedulerProvider providerWithBackgroundConcurrencyLimit:3];
  v4 = +[CNTCCFactory defaultTCC];
  v5 = [(ContactsSupportServiceDelegate *)self initWithServiceProvider:&stru_100024D30 schedulerProvider:v3 tccServices:v4];

  return v5;
}

- (ContactsSupportServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 tccServices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ContactsSupportServiceDelegate;
  v11 = [(ContactsSupportServiceDelegate *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v9 backgroundScheduler];
    workQueue = v11->_workQueue;
    v11->_workQueue = (CNScheduler *)v12;

    id v14 = [v8 copy];
    id serviceProvider = v11->_serviceProvider;
    v11->_id serviceProvider = v14;

    objc_storeStrong((id *)&v11->_tccServices, a5);
    v16 = v11;
  }

  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 serviceName];
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: service name = %@", (uint8_t *)&v13, 0xCu);
  }
  id v8 = +[CNXPCContactsSupport serviceProtocolInterface];
  [v5 setExportedInterface:v8];
  id v9 = [(ContactsSupportServiceDelegate *)self serviceProvider];
  id v10 = [(ContactsSupportServiceDelegate *)self workQueue];
  v11 = ((void (**)(void, void *, id))v9)[2](v9, v10, v5);

  [v5 setExportedObject:v11];
  [v5 resume];

  return 1;
}

- (id)serviceProvider
{
  return self->_serviceProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNTCC)tccServices
{
  return self->_tccServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccServices, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong(&self->_serviceProvider, 0);
}

@end