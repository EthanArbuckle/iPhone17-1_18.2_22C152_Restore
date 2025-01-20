@interface MapsAppRemovalService
- (MapsAppRemovalService)init;
- (NSError)error;
- (OS_dispatch_group)completionGroup;
- (OS_dispatch_queue)isolation;
- (void)_processAppRemovalForAnalytics;
- (void)_processAppRemovalForMapsPushDaemon;
- (void)_processAppRemovalForOfflineData;
- (void)removeAppWithReply:(id)a3;
- (void)setError:(id)a3;
@end

@implementation MapsAppRemovalService

- (MapsAppRemovalService)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsAppRemovalService;
  v2 = [(MapsAppRemovalService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("MapsAppRemovalService", v3, 0);
    isolation = v2->_isolation;
    v2->_isolation = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    completionGroup = v2->_completionGroup;
    v2->_completionGroup = (OS_dispatch_group *)v6;
  }
  return v2;
}

- (void)removeAppWithReply:(id)a3
{
  id v4 = a3;
  v5 = sub_1000025DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting Maps app removal", buf, 2u);
  }

  [(MapsAppRemovalService *)self _processAppRemovalForMapsPushDaemon];
  [(MapsAppRemovalService *)self _processAppRemovalForAnalytics];
  [(MapsAppRemovalService *)self _processAppRemovalForOfflineData];
  dispatch_group_t v6 = [(MapsAppRemovalService *)self completionGroup];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002630;
  v8[3] = &unk_100004168;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)_processAppRemovalForMapsPushDaemon
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting Maps Push Daemon processing for Maps app removal", buf, 2u);
  }

  id v4 = [(MapsAppRemovalService *)self completionGroup];
  dispatch_group_enter(v4);

  v5 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000027B0;
  v6[3] = &unk_1000041B8;
  v6[4] = self;
  [v5 handleMapsApplicationRemoval:v6];
}

- (void)_processAppRemovalForAnalytics
{
  v3 = sub_1000025DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting Analytics processing for Maps app removal", buf, 2u);
  }

  id v4 = [(MapsAppRemovalService *)self completionGroup];
  dispatch_group_enter(v4);

  v5 = [(MapsAppRemovalService *)self isolation];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002ACC;
  v6[3] = &unk_1000041B8;
  v6[4] = self;
  +[GEOAPPortal processMapsDeletionWithCompletionQueue:v5 completion:v6];
}

- (void)_processAppRemovalForOfflineData
{
  v3 = [(MapsAppRemovalService *)self completionGroup];
  dispatch_group_enter(v3);

  id v4 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  v5 = [(MapsAppRemovalService *)self isolation];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002CFC;
  v7[3] = &unk_100004248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v6 fetchAllSubscriptionsWithCallbackQueue:v5 completionHandler:v7];
}

- (OS_dispatch_queue)isolation
{
  return self->_isolation;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end