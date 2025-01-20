@interface ADPostSiriEngagementService
- (ADPostSiriEngagementService)init;
- (ActivityDispatcher)_getActivityDispatcher;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)setActivityDispatcher:(id)a3;
@end

@implementation ADPostSiriEngagementService

- (void).cxx_destruct
{
}

- (void)setActivityDispatcher:(id)a3
{
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADPostSiriEngagementService runMaintenanceWorkWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Run service maintenance for PSE collection", buf, 0xCu);
  }
  v6 = [(ADPostSiriEngagementService *)self _getActivityDispatcher];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10028C46C;
  v8[3] = &unk_10050D440;
  id v9 = v4;
  id v7 = v4;
  [v6 runCollectorsDefinedInParameters:&stru_10050F7D8 completion:v8];
}

- (ActivityDispatcher)_getActivityDispatcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028C5F0;
  block[3] = &unk_10050E138;
  block[4] = self;
  if (qword_1005860C8 != -1) {
    dispatch_once(&qword_1005860C8, block);
  }
  return self->_activityDispatcher;
}

- (ADPostSiriEngagementService)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADPostSiriEngagementService;
  v2 = [(ADPostSiriEngagementService *)&v6 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    [(ADService *)v2 setIdentifier:v4];
  }
  return v2;
}

@end