@interface MapsIPCRoutingInterface
- (BOOL)dismissNavigationSafetyAlert;
- (void)endNavigationWithCompletion:(id)a3;
- (void)loadDirections:(id)a3 completion:(id)a4;
- (void)loadDirectionsWithMessage:(id)a3 completion:(id)a4;
- (void)startPreparedNavigation:(id)a3 completion:(id)a4;
@end

@implementation MapsIPCRoutingInterface

- (BOOL)dismissNavigationSafetyAlert
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  messagingQueue = self->super._messagingQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_876C;
  v5[3] = &unk_309F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)messagingQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadDirections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface loadDirections:completion:", v8, v9, v10, v11, v12, v13, v19[0]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_89B4;
  v22[3] = &unk_30A40;
  id v23 = v7;
  id v14 = v7;
  v15 = objc_retainBlock(v22);
  messagingQueue = self->super._messagingQueue;
  v19[0] = (uint64_t)_NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = (uint64_t)sub_8A74;
  v19[3] = (uint64_t)&unk_30B08;
  id v20 = v6;
  id v21 = v15;
  v19[4] = (uint64_t)self;
  id v17 = v6;
  v18 = v15;
  dispatch_async((dispatch_queue_t)messagingQueue, v19);
}

- (void)startPreparedNavigation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface startPreparedNavigation:completion:", v8, v9, v10, v11, v12, v13, v19[0]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_90DC;
  v22[3] = &unk_30B30;
  id v23 = v7;
  id v14 = v7;
  v15 = objc_retainBlock(v22);
  messagingQueue = self->super._messagingQueue;
  v19[0] = (uint64_t)_NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = (uint64_t)sub_919C;
  v19[3] = (uint64_t)&unk_30B08;
  id v20 = v6;
  id v21 = v15;
  v19[4] = (uint64_t)self;
  id v17 = v6;
  v18 = v15;
  dispatch_async((dispatch_queue_t)messagingQueue, v19);
}

- (void)loadDirectionsWithMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messagingQueue = self->super._messagingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_967C;
  block[3] = &unk_30B08;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)messagingQueue, block);
}

- (void)endNavigationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(_MapsIPCInterface *)self canReceiveMessages])
  {
    messagingQueue = self->super._messagingQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_9B18;
    v10[3] = &unk_30BA8;
    v10[4] = self;
    id v11 = v4;
    id v6 = v4;
    dispatch_async((dispatch_queue_t)messagingQueue, v10);
  }
  else
  {
    id v7 = objc_alloc_init(IPCNavigationActionReply);
    [(IPCNavigationActionReply *)v7 setSuccess:0];
    [(IPCNavigationActionReply *)v7 setNavigationActionError:1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9B04;
    block[3] = &unk_30A18;
    id v13 = v7;
    id v14 = v4;
    uint64_t v8 = v7;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

@end