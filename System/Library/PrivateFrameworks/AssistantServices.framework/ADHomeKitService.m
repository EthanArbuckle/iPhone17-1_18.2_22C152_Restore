@interface ADHomeKitService
- (ADHomeKitService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_hmConnection;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)preheatDomain:(id)a3;
- (void)resetExternalResources;
@end

@implementation ADHomeKitService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_hmConnection, 0);
}

- (id)_hmConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  hmConnection = self->_hmConnection;
  if (!hmConnection)
  {
    v4 = (HMClientConnection *)objc_alloc_init((Class)HMClientConnection);
    v5 = self->_hmConnection;
    self->_hmConnection = v4;

    hmConnection = self->_hmConnection;
  }
  return hmConnection;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  targetQueue = self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E82D4;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(targetQueue, block);
}

- (void)resetExternalResources
{
  targetQueue = self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E86AC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)preheatDomain:(id)a3
{
  targetQueue = self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E8740;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)commandsForDomain:(id)a3
{
  if ([a3 isEqualToString:SAHAGroupIdentifier])
  {
    uint64_t v5 = SAHACommandClassIdentifier;
    v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)domains
{
  uint64_t v4 = SAHAGroupIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (ADHomeKitService)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADHomeKitService;
  v2 = [(ADHomeKitService *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    [(ADService *)v2 setIdentifier:v4];

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ADHomeKitServiceTargetQueue", v5);

    targetQueue = v2->_targetQueue;
    v2->_targetQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

@end