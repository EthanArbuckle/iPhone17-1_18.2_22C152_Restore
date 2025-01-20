@interface ContactsServiceDelegate
+ (id)os_log;
- (BOOL)isClientAuthorizedAccessForConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CNScheduler)highPriorityWorkQueue;
- (CNScheduler)workQueue;
- (CNTCC)tccServices;
- (ContactsServiceDelegate)init;
- (ContactsServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 highPrioritySchedulerProvider:(id)a5 tccServices:(id)a6;
- (id)bundleIdentifierForConnection:(id)a3;
- (id)serviceProvider;
@end

@implementation ContactsServiceDelegate

+ (id)os_log
{
  if (qword_10002CB58 != -1) {
    dispatch_once(&qword_10002CB58, &stru_100025228);
  }
  v2 = (void *)qword_10002CB60;

  return v2;
}

- (ContactsServiceDelegate)init
{
  v3 = +[CNSchedulerProvider providerWithBackgroundConcurrencyLimit:3];
  v4 = +[CNSchedulerProvider providerWithBackgroundConcurrencyLimit:3];
  v5 = +[CNTCCFactory defaultTCC];
  v6 = [(ContactsServiceDelegate *)self initWithServiceProvider:&stru_100025268 schedulerProvider:v3 highPrioritySchedulerProvider:v4 tccServices:v5];

  return v6;
}

- (ContactsServiceDelegate)initWithServiceProvider:(id)a3 schedulerProvider:(id)a4 highPrioritySchedulerProvider:(id)a5 tccServices:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ContactsServiceDelegate;
  v14 = [(ContactsServiceDelegate *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v11 backgroundScheduler];
    workQueue = v14->_workQueue;
    v14->_workQueue = (CNScheduler *)v15;

    uint64_t v17 = [v12 backgroundScheduler];
    highPriorityWorkQueue = v14->_highPriorityWorkQueue;
    v14->_highPriorityWorkQueue = (CNScheduler *)v17;

    id v19 = [v10 copy];
    id serviceProvider = v14->_serviceProvider;
    v14->_id serviceProvider = v19;

    objc_storeStrong((id *)&v14->_tccServices, a6);
    v21 = v14;
  }

  return v14;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 serviceName];
  v7 = [(ContactsServiceDelegate *)self bundleIdentifierForConnection:v5];
  v8 = +[CNXPCDataMapper serviceProtocolInterface];
  [v5 setExportedInterface:v8];
  BOOL v9 = [(ContactsServiceDelegate *)self isClientAuthorizedAccessForConnection:v5];
  if (v9)
  {
    id v10 = [(ContactsServiceDelegate *)self serviceProvider];
    id v11 = [(ContactsServiceDelegate *)self workQueue];
    id v12 = [(ContactsServiceDelegate *)self highPriorityWorkQueue];
    id v13 = ((void (**)(void, void *, void *, id))v10)[2](v10, v11, v12, v5);

    [v5 setExportedObject:v13];
    [v5 resume];
    v14 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      v18 = v6;
      __int16 v19 = 2114;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: Accepted [%{public}@, %{public}@]", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      v18 = v6;
      __int16 v19 = 2114;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: Not authorized [%{public}@, %{public}@]", (uint8_t *)&v17, 0x16u);
    }

    [v5 invalidate];
  }

  return v9;
}

- (id)bundleIdentifierForConnection:(id)a3
{
  if (a3) {
    [a3 auditToken];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  v3 = +[CNAuditToken auditToken:v6];
  v4 = +[CNAuditTokenUtilities bundleIdentifierForAuditToken:v3];

  return v4;
}

- (BOOL)isClientAuthorizedAccessForConnection:(id)a3
{
  id v4 = a3;
  if (+[CNContactProviderSupportManager isConnectionForContactProvider:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    v6 = +[CNAuditToken auditToken:v20];
    v7 = [(ContactsServiceDelegate *)self tccServices];
    unint64_t v8 = (unint64_t)[v7 checkAuthorizationStatusOfAuditToken:v6 assumedIdentity:0];

    if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      BOOL v5 = 1;
    }
    else
    {
      BOOL v9 = +[CNEnvironment currentEnvironment];
      id v10 = [v9 entitlementVerifier];
      if (v4) {
        [v4 auditToken];
      }
      else {
        memset(v19, 0, sizeof(v19));
      }
      uint64_t v11 = CNEntitlementNameTCCUncoupledProcess;
      uint64_t v21 = CNEntitlementNameTCCUncoupledProcess;
      id v12 = +[NSArray arrayWithObjects:&v21 count:1];
      id v18 = 0;
      id v13 = [v10 valuesForAuditToken:v19 forEntitlements:v12 error:&v18];
      id v14 = v18;

      if (v14)
      {
        uint64_t v15 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100016E28((uint64_t)v14, v15);
        }
      }
      v16 = [v13 objectForKey:v11];
      BOOL v5 = v16 != 0;
    }
  }

  return v5;
}

- (id)serviceProvider
{
  return self->_serviceProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNScheduler)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (CNTCC)tccServices
{
  return self->_tccServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccServices, 0);
  objc_storeStrong((id *)&self->_highPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong(&self->_serviceProvider, 0);
}

@end