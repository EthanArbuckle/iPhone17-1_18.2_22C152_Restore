@interface IXSRevertManager
+ (void)revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5;
- (IXSRevertManager)init;
- (IXSTerminationAssertion)terminationAssertion;
- (OS_dispatch_queue)internalQueue;
- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4;
- (void)_revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)setInternalQueue:(id)a3;
- (void)setTerminationAssertion:(id)a3;
@end

@implementation IXSRevertManager

- (IXSRevertManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IXSRevertManager;
  v2 = [(IXSRevertManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordination.revertManager", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setTerminationAssertion:(id)a3
{
  v5 = (IXSTerminationAssertion *)a3;
  v6 = [(IXSRevertManager *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  terminationAssertion = self->_terminationAssertion;
  if (v5 && terminationAssertion == v5)
  {
    v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10008B228();
    }
  }
  else
  {
    if (terminationAssertion) {
      [(IXSTerminationAssertion *)terminationAssertion invalidate];
    }
    objc_storeStrong((id *)&self->_terminationAssertion, a3);
  }
}

- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = [v5 bundleID];
  objc_super v7 = +[NSString stringWithFormat:@"IX terminating appIdentity for reverting %@", v5];

  v8 = [IXSTerminationAssertion alloc];
  v9 = +[NSSet setWithObject:v6];
  id v16 = 0;
  id v10 = [(IXSTerminationAssertion *)v8 initForBundleIDs:v9 description:v7 terminationResistance:50 error:&v16];
  id v11 = v16;

  if (v10)
  {
    id v15 = v11;
    unsigned __int8 v12 = [v10 acquireAssertion:&v15];
    id v13 = v15;

    if (v12) {
      goto LABEL_7;
    }
    [v10 invalidate];

    if (a4) {
      goto LABEL_4;
    }
  }
  else
  {
    id v13 = v11;
    if (a4)
    {
LABEL_4:
      id v13 = v13;
      id v10 = 0;
      *a4 = v13;
      goto LABEL_7;
    }
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (void)_revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  +[IXSCoordinatorManager sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000073E0;
  v12[3] = &unk_1000E8FD0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v15 = self;
  id v16 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v13;
  [v11 performCreationBlockingOperation:v12];
}

+ (void)revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(IXSRevertManager);
  [(IXSRevertManager *)v10 _revertAppWithIdentity:v9 forClientWithName:v8 completion:v7];
}

- (void)dealloc
{
  v3 = [(IXSRevertManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000078B8;
  block[3] = &unk_1000E8FA8;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)IXSRevertManager;
  [(IXSRevertManager *)&v4 dealloc];
}

- (IXSTerminationAssertion)terminationAssertion
{
  return self->_terminationAssertion;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_terminationAssertion, 0);
}

@end