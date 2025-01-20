@interface IXSPromisedTransferToPath
- (void)_remote_setShouldCopy:(BOOL)a3;
- (void)_remote_setTransferPath:(id)a3;
- (void)_remote_setTryDeltaCopy:(BOOL)a3;
@end

@implementation IXSPromisedTransferToPath

- (void)_remote_setTransferPath:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(IXSDataPromise *)self accessQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037A94;
  v8[3] = &unk_1000E8E08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_100066F24(v6, v8);
}

- (void)_remote_setShouldCopy:(BOOL)a3
{
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037B9C;
  v7[3] = &unk_1000E9800;
  v7[4] = self;
  BOOL v8 = a3;
  sub_100066F24(v6, v7);
}

- (void)_remote_setTryDeltaCopy:(BOOL)a3
{
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037CA8;
  v7[3] = &unk_1000E9800;
  v7[4] = self;
  BOOL v8 = a3;
  sub_100066F24(v6, v7);
}

@end