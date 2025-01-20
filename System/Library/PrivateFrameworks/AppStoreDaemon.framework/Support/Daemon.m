@interface Daemon
- (Daemon)init;
- (void)_handleMigrationDidFinishNotification:(id)a3;
- (void)dealloc;
@end

@implementation Daemon

- (Daemon)init
{
  v11.receiver = self;
  v11.super_class = (Class)Daemon;
  v2 = [(Daemon *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.Daemon", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    transactionCount = v2->_transactionCount;
    v2->_transactionCount = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionStore = v2->_transactionStore;
    v2->_transactionStore = v8;
  }
  return v2;
}

- (void)dealloc
{
  jetsamSource = self->_jetsamSource;
  if (jetsamSource) {
    dispatch_source_cancel(jetsamSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)Daemon;
  [(Daemon *)&v4 dealloc];
}

- (void)_handleMigrationDidFinishNotification:(id)a3
{
  int v3 = byte_1005B10E8;
  self;
  objc_super v4 = +[NSUserDefaults standardUserDefaults];
  [v4 synchronize];

  v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [v5 stringForKey:@"osVersionStringKey"];

  v7 = (void *)MGCopyAnswer();
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Daemon] Fresh install detected upgrading to %@", (uint8_t *)&v12, 0xCu);
    }
    v10 = +[NSUserDefaults standardUserDefaults];
    [v10 setObject:v7 forKey:@"osVersionStringKey"];
    goto LABEL_11;
  }
  unsigned __int8 v8 = [v6 isEqualToString:v7];
  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      int v12 = 138412546;
      v13 = v6;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Daemon] OS version has updated from %@ to %@", (uint8_t *)&v12, 0x16u);
    }
    objc_super v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setObject:v7 forKey:@"osVersionStringKey"];

    v10 = sub_1001F5C30();
    sub_1001F5E50((uint64_t)v10);
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    int v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Daemon] OS version %@ is current", (uint8_t *)&v12, 0xCu);
  }
LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMetricsMonitor, 0);
  objc_storeStrong((id *)&self->_spotlightIndexMonitor, 0);
  objc_storeStrong((id *)&self->_personalizationDelegate, 0);
  objc_storeStrong((id *)&self->_serviceBroker, 0);
  objc_storeStrong((id *)&self->_transactionStore, 0);
  objc_storeStrong((id *)&self->_transactionCount, 0);
  objc_storeStrong((id *)&self->_storeQueueDelegate, 0);
  objc_storeStrong((id *)&self->_storeQueueListener, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDelegate, 0);
  objc_storeStrong((id *)&self->_softwareUpdateListener, 0);
  objc_storeStrong((id *)&self->_signalSource, 0);
  objc_storeStrong((id *)&self->_requestListener, 0);
  objc_storeStrong((id *)&self->_requestBroker, 0);
  objc_storeStrong((id *)&self->_personalizationStoreService, 0);
  objc_storeStrong((id *)&self->_odrLaunchServicesListener, 0);
  objc_storeStrong((id *)&self->_odrLaunchServicesDelegate, 0);
  objc_storeStrong((id *)&self->_odrFoundationListener, 0);
  objc_storeStrong((id *)&self->_odrFoundationDelegate, 0);
  objc_storeStrong((id *)&self->_odrDevtoolsListener, 0);
  objc_storeStrong((id *)&self->_odrDevtoolsDelegate, 0);
  objc_storeStrong((id *)&self->_odrCtlListener, 0);
  objc_storeStrong((id *)&self->_odrCtlDelegate, 0);
  objc_storeStrong((id *)&self->_odrAppReviewListener, 0);
  objc_storeStrong((id *)&self->_odrAppReviewDelegate, 0);
  objc_storeStrong((id *)&self->_launchServicesObserver, 0);
  objc_storeStrong((id *)&self->_jobManagerListener, 0);
  objc_storeStrong((id *)&self->_jobManagerDelegate, 0);
  objc_storeStrong((id *)&self->_jetsamSource, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end