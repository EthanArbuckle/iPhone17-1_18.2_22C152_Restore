@interface SMDSSource
+ (void)initialize;
- (NSString)name;
- (SMDSSource)init;
- (SMSafetyMonitorManager)safetyMonitorManager;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)setSafetyMonitorManager:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation SMDSSource

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_9230 = (uint64_t)os_log_create("com.apple.SafetyMonitorSeparation", "SMDSSource");
    _objc_release_x1();
  }
}

- (SMDSSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)SMDSSource;
  v2 = [(SMDSSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SMSafetyMonitorManager defaultManager];
    safetyMonitorManager = v2->_safetyMonitorManager;
    v2->_safetyMonitorManager = (SMSafetyMonitorManager *)v3;
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)DSSourceNameZelkova;
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = qword_9230;
  if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Fetching shared resources.", buf, 2u);
  }
  objc_super v6 = [(SMDSSource *)self safetyMonitorManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1934;
  v8[3] = &unk_4180;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchCurrentSessionStateWithHandler:v8];
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = qword_9230;
  if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Stopping sharing via stopAllSharingWithCompletion.", buf, 2u);
  }
  objc_super v6 = [(SMDSSource *)self safetyMonitorManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_21D4;
  v8[3] = &unk_41D0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchCurrentSessionStateWithHandler:v8];
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  objc_super v6 = qword_9230;
  if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Stopping sharing via stopSharing.", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2594;
  v8[3] = &unk_41A8;
  id v9 = v5;
  id v7 = v5;
  [(SMDSSource *)self stopAllSharingWithCompletion:v8];
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v5 = a4;
  objc_super v6 = qword_9230;
  if (os_log_type_enabled((os_log_t)qword_9230, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Stopping sharing via stopSharingWithParticipant.", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2684;
  v8[3] = &unk_41A8;
  id v9 = v5;
  id v7 = v5;
  [(SMDSSource *)self stopAllSharingWithCompletion:v8];
}

- (SMSafetyMonitorManager)safetyMonitorManager
{
  return self->_safetyMonitorManager;
}

- (void)setSafetyMonitorManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end