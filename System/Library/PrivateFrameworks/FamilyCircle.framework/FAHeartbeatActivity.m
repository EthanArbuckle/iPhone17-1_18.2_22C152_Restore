@interface FAHeartbeatActivity
- (BOOL)_checkAndDeferActivityIfNeeded:(id)a3;
- (FAHeartbeatActivity)initWithQueueProvider:(id)a3;
- (id)_familyGrandSlamSignerWithAccountStore:(id)a3;
- (id)_grandSlamAccountForAccountStore:(id)a3;
- (id)_grandSlamSignerWithAccountStore:(id)a3;
- (id)_primaryAccount;
- (void)_performHeartbeatCheckinForActivity:(id)a3 completion:(id)a4;
- (void)checkin;
- (void)performHeartbeatCheckinWithCompletion:(id)a3;
- (void)scheduleWithCompletionHandler:(id)a3;
- (void)unregister;
@end

@implementation FAHeartbeatActivity

- (FAHeartbeatActivity)initWithQueueProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAHeartbeatActivity;
  v6 = [(FAHeartbeatActivity *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queueProvider, a3);
    v7->_timeInterval = XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  return v7;
}

- (void)checkin
{
}

- (void)performHeartbeatCheckinWithCompletion:(id)a3
{
}

- (void)_performHeartbeatCheckinForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing heartbeat operation!", buf, 2u);
  }

  if ([(FAHeartbeatActivity *)self _checkAndDeferActivityIfNeeded:v6])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    objc_super v9 = +[ACAccountStore defaultStore];
    v10 = objc_alloc_init(FADeviceInfo);
    v11 = [FANetworkService alloc];
    v12 = objc_msgSend(v9, "aa_primaryAppleAccount");
    v13 = objc_opt_new();
    v14 = +[AAURLSession sharedSession];
    v15 = [(FANetworkService *)v11 initWithAccount:v12 deviceInfo:v10 urlProvider:v13 urlSession:v14];

    v16 = +[ACAccountStore defaultStore];
    v17 = [FAHeartbeatOperation alloc];
    v18 = [(FAHeartbeatActivity *)self _grandSlamSignerWithAccountStore:v16];
    v19 = [(FAHeartbeatActivity *)self _familyGrandSlamSignerWithAccountStore:v16];
    v20 = [(FAHeartbeatOperation *)v17 initWithNetworkService:v15 grandSlamSigner:v18 familyGrandSlamSigner:v19];

    if ([(FAHeartbeatActivity *)self _checkAndDeferActivityIfNeeded:v6])
    {
      if (v7) {
        v7[2](v7, 0);
      }
    }
    else
    {
      v21 = [(FAHeartbeatOperation *)v20 fetchHeartbeatData];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000D65C;
      v22[3] = &unk_10004D8E0;
      v22[4] = self;
      id v23 = v6;
      v24 = v7;
      [v21 onComplete:v22];
    }
  }
}

- (BOOL)_checkAndDeferActivityIfNeeded:(id)a3
{
  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3 && xpc_activity_should_defer(v3))
  {
    BOOL v5 = xpc_activity_set_state(v4, 3);
    id v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Family heartbeat activity deferred with status: %d", (uint8_t *)v8, 8u);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_primaryAccount
{
  v2 = +[ACAccountStore defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (id)_grandSlamAccountForAccountStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FAHeartbeatActivity *)self _primaryAccount];
  id v6 = objc_msgSend(v4, "aa_grandSlamAccountForiCloudAccount:", v5);

  return v6;
}

- (id)_grandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAGrandSlamSigner);
  id v6 = [(FAHeartbeatActivity *)self _grandSlamAccountForAccountStore:v4];
  id v7 = [v5 initWithAccountStore:v4 grandSlamAccount:v6 appTokenID:AAGrandSlamAppTokenIDiCloudSettings];

  return v7;
}

- (id)_familyGrandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAGrandSlamSigner);
  id v6 = [(FAHeartbeatActivity *)self _grandSlamAccountForAccountStore:v4];
  id v7 = [v5 initWithAccountStore:v4 grandSlamAccount:v6 appTokenID:AAGrandSlamAppTokenIDFamilySharing];

  [v7 setHeaderFieldKey:AAFamilyGrandSlamTokenHeaderKey];
  return v7;
}

- (void).cxx_destruct
{
}

- (void)scheduleWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100006CB4(&qword_10005E7B8);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10005EE90;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10005E7D0;
  v12[5] = v11;
  v13 = self;
  sub_100033A4C((uint64_t)v7, (uint64_t)&unk_10005E7D8, (uint64_t)v12);
  swift_release();
}

- (void)unregister
{
  v2 = self;
  sub_100030470(v3);
  sub_100025FD0(v3, v3[3]);
  dispatch thunk of BackgroundTaskScheduler.unregister()();
  sub_100026F54((uint64_t)v3);
}

@end