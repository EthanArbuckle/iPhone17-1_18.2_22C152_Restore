@interface BMAccessDaemon
+ (BOOL)isAgent;
- (BMAccessDaemon)initWithQueue:(id)a3 delegate:(id)a4;
- (BMAccessServiceListener)legacyAccessService;
- (BMAccessServiceListener)systemAccessService;
- (BMAccessServiceListener)userAccessService;
- (OS_dispatch_queue)queue;
@end

@implementation BMAccessDaemon

- (BMAccessDaemon)initWithQueue:(id)a3 delegate:(id)a4
{
  v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(v7);
  v18.receiver = self;
  v18.super_class = (Class)BMAccessDaemon;
  v9 = [(BMAccessDaemon *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = [[BMAccessServiceListener alloc] initLegacyWithQueue:v7];
    legacyAccessService = v10->_legacyAccessService;
    v10->_legacyAccessService = v11;

    v13 = [[BMAccessServiceListener alloc] initWithDomain:0 queue:v7 delegate:v8];
    userAccessService = v10->_userAccessService;
    v10->_userAccessService = v13;

    v15 = [[BMAccessServiceListener alloc] initWithDomain:1 queue:v7 delegate:v8];
    systemAccessService = v10->_systemAccessService;
    v10->_systemAccessService = v15;

    [(BMAccessServiceListener *)v10->_legacyAccessService activate];
    [(BMAccessServiceListener *)v10->_userAccessService activate];
    [(BMAccessServiceListener *)v10->_systemAccessService activate];
  }

  return v10;
}

+ (BOOL)isAgent
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMAccessServiceListener)legacyAccessService
{
  return self->_legacyAccessService;
}

- (BMAccessServiceListener)userAccessService
{
  return self->_userAccessService;
}

- (BMAccessServiceListener)systemAccessService
{
  return self->_systemAccessService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAccessService, 0);
  objc_storeStrong((id *)&self->_userAccessService, 0);
  objc_storeStrong((id *)&self->_legacyAccessService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end