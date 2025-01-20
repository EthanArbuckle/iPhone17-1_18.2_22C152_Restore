@interface ManagedAppService
- (ManagedAppService)init;
- (void)processITMSServicesRequest:(id)a3 withReplyHandler:(id)a4;
- (void)requestStatusWithReply:(id)a3;
- (void)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4 withReplyHandler:(id)a5;
- (void)submitManifestRequest:(id)a3 withReplyHandler:(id)a4;
- (void)submitVPPRequest:(id)a3 withReplyHandler:(id)a4;
@end

@implementation ManagedAppService

- (ManagedAppService)init
{
  v7.receiver = self;
  v7.super_class = (Class)ManagedAppService;
  v2 = [(ManagedAppService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreDaemon.ManagedAppService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)processITMSServicesRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003296AC;
  v13[3] = &unk_100521DE0;
  id v15 = v6;
  id v16 = v7;
  id v14 = v8;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void)requestStatusWithReply:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100329894;
  v9[3] = &unk_100521698;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  sub_100010948(dispatchQueue, v9);
}

- (void)showVPPInviteForCurrentUser:(id)a3 orgName:(id)a4 withReplyHandler:(id)a5
{
  id v6 = a5;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100329B8C;
  v9[3] = &unk_100521F40;
  id v10 = v6;
  id v8 = v6;
  sub_100010948(dispatchQueue, v9);
}

- (void)submitManifestRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100329CF4;
  v13[3] = &unk_1005221F0;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void)submitVPPRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100329F34;
  v13[3] = &unk_1005221F0;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void).cxx_destruct
{
}

@end