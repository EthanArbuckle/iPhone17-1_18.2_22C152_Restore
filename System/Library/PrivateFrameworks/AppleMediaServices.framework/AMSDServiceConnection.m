@interface AMSDServiceConnection
+ (NSString)machServiceName;
- (AMSDServiceConnection)initWithConnection:(id)a3;
- (NSMutableSet)retainer;
- (NSString)logKey;
- (NSXPCConnection)remoteConnection;
- (void)_provideService:(id)a3 delegate:(id)a4 withReply:(id)a5;
- (void)dealloc;
- (void)getAccountCachedServerDataServiceProxyWithReplyHandler:(id)a3;
- (void)getAccountSignOutServiceProxyWithReplyHandler:(id)a3;
- (void)getCookieServiceProxyWithReplyHandler:(id)a3;
- (void)getDeviceMessengerServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4;
- (void)getDismissQRDialogServiceProxyWithReplyHandler:(id)a3;
- (void)getFraudReportServiceProxyWithReplyHandler:(id)a3;
- (void)getKeychainServiceProxyWithReplyHandler:(id)a3;
- (void)getPaymentConfirmationServiceProxyWithReplyHandler:(id)a3;
- (void)getPaymentValidationServiceProxyWithReplyHandler:(id)a3;
- (void)getPurchaseServiceProxyWithReplyHandler:(id)a3;
- (void)getPushNotificationServiceProxyWithReplyHandler:(id)a3;
- (void)getSecurityServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4;
- (void)setLogKey:(id)a3;
- (void)setRemoteConnection:(id)a3;
- (void)setRetainer:(id)a3;
@end

@implementation AMSDServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainer, 0);
  objc_storeStrong((id *)&self->_remoteConnection, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

- (void)dealloc
{
  v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@: deallocated", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)AMSDServiceConnection;
  [(AMSDServiceConnection *)&v6 dealloc];
}

- (void)getAccountCachedServerDataServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSDAccountCachedServerDataService);
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getCookieServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDCookieService sharedService];
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)_provideService:(id)a3 delegate:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = objc_opt_class();
  v12 = [(AMSDServiceConnection *)self remoteConnection];
  LOBYTE(v11) = [(id)v11 isConnectionEntitled:v12];

  if (v11)
  {
    v13 = 0;
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_opt_class();
      v21 = [(AMSDServiceConnection *)self logKey];
      int v24 = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No service found", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v22 = AMSError();

    v13 = (void *)v22;
    if (v22) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = objc_opt_class();
    v17 = [(AMSDServiceConnection *)self logKey];
    int v24 = 138543874;
    uint64_t v25 = v16;
    __int16 v26 = 2114;
    v27 = v17;
    __int16 v28 = 2114;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Not entitled for service: %{public}@", (uint8_t *)&v24, 0x20u);
  }
  v13 = AMSError();
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  if (v13)
  {
LABEL_4:
    v10[2](v10, 0, v13);
    goto LABEL_18;
  }
LABEL_15:
  if (v9)
  {
    v23 = [(AMSDServiceConnection *)self retainer];
    [v23 addObject:v9];
  }
  ((void (**)(id, id, void *))v10)[2](v10, v8, 0);
LABEL_18:
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setLogKey:(id)a3
{
}

- (AMSDServiceConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSDServiceConnection;
  objc_super v6 = [(AMSDServiceConnection *)&v13 init];
  if (v6)
  {
    uint64_t v7 = AMSLogKey();
    logKey = v6->_logKey;
    v6->_logKey = (NSString *)v7;

    objc_storeStrong((id *)&v6->_remoteConnection, a3);
    id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    retainer = v6->_retainer;
    v6->_retainer = v9;

    uint64_t v11 = +[AMSDaemonConnectionInterface interface];
    [v5 setExportedInterface:v11];

    [v5 setExportedObject:v6];
  }

  return v6;
}

+ (NSString)machServiceName
{
  return (NSString *)@"com.apple.xpc.amsaccountsd";
}

- (void)getDeviceMessengerServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = +[AMSDDeviceMessengerService sharedService];
  if (v8) {
    [v7 addDelegate:v8];
  }
  [(AMSDServiceConnection *)self _provideService:v7 delegate:v8 withReply:v6];
}

- (void)getDismissQRDialogServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDDismissQRDialogService sharedService];
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getFraudReportServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSDFraudReportService);
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getKeychainServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSDKeychainService);
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getPaymentConfirmationServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDPaymentViewService sharedService];
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getPaymentValidationServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDPaymentValidationService sharedService];
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getPurchaseServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSDPurchaseService);
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getPushNotificationServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDPushService sharedService];
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (void)getSecurityServiceProxyWithDelegate:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(AMSDSecurityService);
  if (v8) {
    [(AMSDSecurityService *)v7 setDelegate:v8];
  }
  [(AMSDServiceConnection *)self _provideService:v7 delegate:v8 withReply:v6];
}

- (void)getAccountSignOutServiceProxyWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSDAccountSignOutService);
  [(AMSDServiceConnection *)self _provideService:v5 delegate:0 withReply:v4];
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setRemoteConnection:(id)a3
{
}

- (NSMutableSet)retainer
{
  return self->_retainer;
}

- (void)setRetainer:(id)a3
{
}

@end