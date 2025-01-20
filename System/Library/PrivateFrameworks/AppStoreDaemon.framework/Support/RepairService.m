@interface RepairService
- (RepairService)init;
- (void)refreshKeybagWithReplyHandler:(id)a3;
- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4;
@end

@implementation RepairService

- (RepairService)init
{
  v7.receiver = self;
  v7.super_class = (Class)RepairService;
  v2 = [(RepairService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.RepairService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)repairAppWithOptions:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F18DC;
  block[3] = &unk_1005221F0;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(dispatchQueue, v13);
}

- (void)refreshKeybagWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003F1B1C;
  v10[3] = &unk_100521698;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v10);
  dispatch_async(dispatchQueue, v9);
}

- (void).cxx_destruct
{
}

@end