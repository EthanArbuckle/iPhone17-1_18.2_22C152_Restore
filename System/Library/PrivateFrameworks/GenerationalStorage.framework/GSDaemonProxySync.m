@interface GSDaemonProxySync
+ (id)proxy;
- (GSDaemonProxySync)initWithXPCObject:(id)a3;
- (NSError)error;
- (__CFError)copyCFError;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)result;
- (void)finalize;
- (void)forwardInvocation:(id)a3;
- (void)handleBoolResult:(BOOL)a3 error:(id)a4;
- (void)handleObjResult:(id)a3 error:(id)a4;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation GSDaemonProxySync

- (GSDaemonProxySync)initWithXPCObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      sub_100027B8C();
    }
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000A77C;
    v10[3] = &unk_100040DC8;
    objc_copyWeak(&v11, &location);
    v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
    target = self->_target;
    self->_target = v5;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = (NSError *)[objc_alloc((Class)NSError) initWithDomain:NSCocoaErrorDomain code:4097 userInfo:0];
    error = self->_error;
    self->_error = v7;
  }
  return self;
}

+ (id)proxy
{
  v2 = [GSDaemonProxySync alloc];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10000A2F4;
  id v11 = sub_10000A304;
  id v12 = 0;
  if (qword_10004CEC8 != -1) {
    dispatch_once(&qword_10004CEC8, &stru_100040DE8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADA8;
  block[3] = &unk_100040CF8;
  block[4] = &v7;
  dispatch_sync((dispatch_queue_t)qword_10004CEB0, block);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  id v4 = [(GSDaemonProxySync *)v2 initWithXPCObject:v3];
  return v4;
}

- (void)finalize
{
  v2.receiver = self;
  v2.super_class = (Class)GSDaemonProxySync;
  [(GSDaemonProxySync *)&v2 finalize];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  target = self->_target;
  if (!target) {
    sub_100027BB8();
  }
  id v6 = v4;
  [(GSProtocol *)target forwardInvocation:v4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  target = self->_target;
  if (!target) {
    sub_100027BE4();
  }
  return [(GSProtocol *)target methodSignatureForSelector:a3];
}

- (void)handleBoolResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v9 = v6;
  if (v4) {
    uint64_t v7 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }
  [(GSDaemonProxySync *)self setResult:v7];
  [(GSDaemonProxySync *)self setError:v8];
}

- (void)handleObjResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  [(GSDaemonProxySync *)self setResult:a3];
  [(GSDaemonProxySync *)self setError:v6];
}

- (__CFError)copyCFError
{
  return (__CFError *)objc_claimAutoreleasedReturnValue();
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end