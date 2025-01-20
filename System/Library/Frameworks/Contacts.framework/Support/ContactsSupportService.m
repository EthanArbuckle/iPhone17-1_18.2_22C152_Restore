@interface ContactsSupportService
- (CNAccessAuthorization)accessAuthorization;
- (CNContactProviderSupportManager)contactProviderManager;
- (CNContactsEnvironment)environment;
- (CNContactsLogger)logger;
- (CNScheduler)workQueue;
- (CNUIImageRemoteBackgroundColorAnalyzer)backgroundColorAnalyzer;
- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4;
- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4 accessAuthorization:(id)a5;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)backgroundColorQueue;
- (void)requestProviderDomainCommand:(id)a3 withReply:(id)a4;
- (void)setBackgroundColorAnalyzer:(id)a3;
@end

@implementation ContactsSupportService

- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  long long v14 = 0u;
  long long v15 = 0u;
  if (v7) {
    [v7 auditToken];
  }
  v13[0] = v14;
  v13[1] = v15;
  v9 = +[CNAuditToken auditToken:v13];
  id v10 = [objc_alloc((Class)CNAccessAuthorization) initWithAuditToken:v9];
  v11 = [(ContactsSupportService *)self initWithWorkQueue:v6 connection:v8 accessAuthorization:v10];

  return v11;
}

- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4 accessAuthorization:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ContactsSupportService;
  v12 = [(ContactsSupportService *)&v25 init];
  if (v12)
  {
    v13 = +[CNContactsEnvironment currentEnvironment];
    objc_storeStrong((id *)&v12->_workQueue, a3);
    long long v14 = [v13 loggerProvider];
    uint64_t v15 = [v14 contactsLogger];
    logger = v12->_logger;
    v12->_logger = (CNContactsLogger *)v15;

    objc_storeStrong((id *)&v12->_environment, v13);
    objc_storeWeak((id *)&v12->_connection, v10);
    objc_storeStrong((id *)&v12->_accessAuthorization, a5);
    if (v10) {
      [v10 auditToken];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    v17 = +[CNAuditToken auditToken:v24];
    v18 = (CNContactProviderSupportManager *)[objc_alloc((Class)CNContactProviderSupportManager) initWithAuditToken:v17];
    contactProviderManager = v12->_contactProviderManager;
    v12->_contactProviderManager = v18;

    dispatch_queue_t v20 = dispatch_queue_create("contactsBackgroundColorQueue", 0);
    backgroundColorQueue = v12->_backgroundColorQueue;
    v12->_backgroundColorQueue = (OS_dispatch_queue *)v20;

    v22 = v12;
  }

  return v12;
}

- (void)requestProviderDomainCommand:(id)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(ContactsSupportService *)self contactProviderManager];
  id v11 = 0;
  id v9 = [v8 requestHostDomainCommand:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (CNAccessAuthorization)accessAuthorization
{
  return self->_accessAuthorization;
}

- (CNContactProviderSupportManager)contactProviderManager
{
  return self->_contactProviderManager;
}

- (OS_dispatch_queue)backgroundColorQueue
{
  return self->_backgroundColorQueue;
}

- (CNUIImageRemoteBackgroundColorAnalyzer)backgroundColorAnalyzer
{
  return self->_backgroundColorAnalyzer;
}

- (void)setBackgroundColorAnalyzer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorAnalyzer, 0);
  objc_storeStrong((id *)&self->_backgroundColorQueue, 0);
  objc_storeStrong((id *)&self->_contactProviderManager, 0);
  objc_storeStrong((id *)&self->_accessAuthorization, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end