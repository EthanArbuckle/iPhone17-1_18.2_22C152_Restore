@interface FAActivityManager
- (FAActivityManager)initWithQueueProvider:(id)a3;
- (FAOSUpdatedActivity)osUpdatedActivity;
- (void)checkinXPCActivities;
- (void)handleAccountAddition:(id)a3 completion:(id)a4;
- (void)handleAccountDeletion:(id)a3 completion:(id)a4;
- (void)setOsUpdatedActivity:(id)a3;
@end

@implementation FAActivityManager

- (FAActivityManager)initWithQueueProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FAActivityManager;
  v5 = [(FAActivityManager *)&v15 init];
  if (v5)
  {
    v6 = [[FAHeartbeatActivity alloc] initWithQueueProvider:v4];
    heartbeatActivity = v5->_heartbeatActivity;
    v5->_heartbeatActivity = v6;

    objc_initWeak(&location, v5->_heartbeatActivity);
    id v8 = objc_alloc((Class)FAOSUpdatedActivity);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B524;
    v12[3] = &unk_10004D698;
    objc_copyWeak(&v13, &location);
    v9 = (FAOSUpdatedActivity *)[v8 initWithHeartbeatActivityHandler:v12];
    osUpdatedActivity = v5->_osUpdatedActivity;
    v5->_osUpdatedActivity = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)checkinXPCActivities
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking in XPC activities..", v5, 2u);
  }

  [(FAHeartbeatActivity *)self->_heartbeatActivity checkin];
  id v4 = [(FAActivityManager *)self osUpdatedActivity];
  [v4 checkinWithCompletionHandler:&stru_10004D6D8];
}

- (void)handleAccountAddition:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling account addition.", buf, 2u);
  }

  [(FAActivityManager *)self checkinXPCActivities];
  heartbeatActivity = self->_heartbeatActivity;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B74C;
  v9[3] = &unk_10004D700;
  id v10 = v5;
  id v8 = (void (**)(id, uint64_t))v5;
  [(FAHeartbeatActivity *)heartbeatActivity performHeartbeatCheckinWithCompletion:v9];
  v8[2](v8, 1);
}

- (void)handleAccountDeletion:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling account deletion.", v8, 2u);
  }

  [(FAHeartbeatActivity *)self->_heartbeatActivity unregister];
  v7 = [(FAActivityManager *)self osUpdatedActivity];
  [v7 unregister];

  v5[2](v5, 1);
}

- (FAOSUpdatedActivity)osUpdatedActivity
{
  return self->_osUpdatedActivity;
}

- (void)setOsUpdatedActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osUpdatedActivity, 0);
  objc_storeStrong((id *)&self->_heartbeatActivity, 0);
}

@end