@interface APMetricDaemonDelivery
+ (APMetricDaemonDeliverer)daemonDelivery;
+ (BOOL)canShareConnection;
+ (id)machService;
+ (void)setDaemonDelivery:(id)a3;
- (APMetricDaemonDelivery)init;
- (APMetricNotificationRegister)notificationRegistrar;
- (id)remoteObjectInterface;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)extendCollectionClassesForRemoteInterface:(id)a3;
- (void)receivedMetric:(id)a3;
@end

@implementation APMetricDaemonDelivery

- (APMetricDaemonDelivery)init
{
  v6.receiver = self;
  v6.super_class = (Class)APMetricDaemonDelivery;
  v2 = [(APXPCActionRequester *)&v6 init];
  if (v2)
  {
    v3 = (APMetricNotificationRegister *)objc_alloc_init(+[MetricsModuleCommon notificationRegistrarClass]);
    notificationRegistrar = v2->_notificationRegistrar;
    v2->_notificationRegistrar = v3;
  }
  return v2;
}

+ (APMetricDaemonDeliverer)daemonDelivery
{
  if (qword_1EB789AE0 != -1) {
    dispatch_once(&qword_1EB789AE0, &unk_1F2E9CC50);
  }
  v2 = (void *)qword_1EB789AE8;
  return (APMetricDaemonDeliverer *)v2;
}

+ (void)setDaemonDelivery:(id)a3
{
  id v14 = a3;
  v3 = [MEMORY[0x1E4F28F80] processInfo];
  int v4 = [v3 isRunningTests];

  if (v4)
  {
    v5 = &unk_1F2EB2940;
    objc_super v6 = v14;
    if (v14 && (v7 = [v14 conformsToProtocol:v5], objc_super v6 = v14, !v7))
    {
      v10 = NSString;
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromProtocol((Protocol *)v5);
      v9 = [v10 stringWithFormat:@"Class %@ does not implement protocol %@!", v12, v13];

      APSimulateCrash(5, v9, 0);
    }
    else
    {
      id v8 = v6;
      v9 = (void *)qword_1EB789AE8;
      qword_1EB789AE8 = (uint64_t)v8;
    }
  }
}

- (void)receivedMetric:(id)a3
{
  id v4 = a3;
  id v6 = [(APMetricDaemonDelivery *)self notificationRegistrar];
  [v6 receivedMetric:v4];
  v5 = [(APXPCActionRequester *)self remoteObjectProxy];
  [v5 receivedMetric:v4];
}

- (id)remoteObjectInterface
{
  return &unk_1F2EB2940;
}

- (void)extendCollectionClassesForRemoteInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  +[MetricsModuleCommon metricClass];
  objc_msgSend(v3, "setWithObjects:", objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v5 forSelector:sel_receivedMetric_ argumentIndex:0 ofReply:0];
}

- (void)connectionInterrupted
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = APLogForCategory(0x1EuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = (id)objc_opt_class();
    id v3 = v5;
    _os_log_impl(&dword_1D70B2000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Connection from the daemon was interrupted.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)connectionInvalidated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = APLogForCategory(0x1EuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = (id)objc_opt_class();
    id v3 = v5;
    _os_log_impl(&dword_1D70B2000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Connection from the daemon was invalidated.", (uint8_t *)&v4, 0xCu);
  }
}

+ (BOOL)canShareConnection
{
  return 1;
}

+ (id)machService
{
  return @"com.apple.ap.promotedcontent.metrics";
}

- (APMetricNotificationRegister)notificationRegistrar
{
  return self->_notificationRegistrar;
}

- (void).cxx_destruct
{
}

@end