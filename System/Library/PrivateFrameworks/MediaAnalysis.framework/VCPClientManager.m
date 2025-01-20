@interface VCPClientManager
+ (id)sharedManager;
- (VCPClientManager)init;
- (void)addClientHandler:(id)a3;
- (void)removeClientHandler:(id)a3;
@end

@implementation VCPClientManager

- (VCPClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPClientManager;
  v2 = [(VCPClientManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysisd.VCPClientManager", 0);
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableSet set];
    clientHandlers = v2->_clientHandlers;
    v2->_clientHandlers = (NSMutableSet *)v5;
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_100252410 != -1) {
    dispatch_once(&qword_100252410, &stru_100219D48);
  }
  v2 = (void *)qword_100252408;
  return v2;
}

- (void)addClientHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    managementQueue = self->_managementQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012ED0;
    v7[3] = &unk_100219D00;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(managementQueue, v7);
  }
}

- (void)removeClientHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    managementQueue = self->_managementQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001305C;
    v7[3] = &unk_100219D00;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(managementQueue, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHandlers, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
}

@end