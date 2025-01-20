@interface HDFHIRCredentialedRequestTask
- (HDFHIRCredentialResult)credentialResult;
- (HDFHIRCredentialedRequestTask)initWithCredentialedSession:(id)a3;
- (HDFHIRCredentialedRequestTask)initWithSession:(id)a3;
- (void)_handleError:(id)a3 endState:(id)a4;
- (void)setCredentialResult:(id)a3;
- (void)startTaskWithRequest:(id)a3 completion:(id)a4;
@end

@implementation HDFHIRCredentialedRequestTask

- (HDFHIRCredentialedRequestTask)initWithSession:(id)a3
{
  v4 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (HDFHIRCredentialedRequestTask)initWithCredentialedSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HDFHIRCredentialedRequestTask;
  v3 = [(HDFHIRRequestTask *)&v7 initWithSession:a3];
  if (v3)
  {
    uint64_t v4 = HKCreateSerialDispatchQueue();
    resourceQueue = v3->_resourceQueue;
    v3->_resourceQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)startTaskWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(HDFHIRCredentialedRequestTask *)self credentialResult];

  if (!v9)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"HDFHIRRequestTask.m" lineNumber:194 description:@"Credential result must be set before task start"];
  }
  v11.receiver = self;
  v11.super_class = (Class)HDFHIRCredentialedRequestTask;
  [(HDFHIRRequestTask *)&v11 startTaskWithRequest:v7 completion:v8];
}

- (void)_handleError:(id)a3 endState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDFHIRRequestTask *)self session];
  v9 = [v8 specification];
  unsigned int v10 = [v9 shouldRefreshTokenForCredentialedTaskError:v6];

  if (v10)
  {
    objc_super v11 = [(HDFHIRCredentialedRequestTask *)self credentialResult];
    [v11 invalidate];
  }
  v12.receiver = self;
  v12.super_class = (Class)HDFHIRCredentialedRequestTask;
  [(HDFHIRRequestTask *)&v12 _handleError:v6 endState:v7];
}

- (HDFHIRCredentialResult)credentialResult
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = sub_7DC7C;
  objc_super v11 = sub_7DC8C;
  id v12 = 0;
  resourceQueue = self->_resourceQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7DC94;
  v6[3] = &unk_1122F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(resourceQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HDFHIRCredentialResult *)v4;
}

- (void)setCredentialResult:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDFHIRRequestTask.m", 223, @"Invalid parameter not satisfying: %@", @"credentialResult != nil" object file lineNumber description];
  }
  resourceQueue = self->_resourceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7DDB0;
  block[3] = &unk_112820;
  id v10 = v5;
  SEL v11 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(resourceQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);

  objc_storeStrong((id *)&self->_credentialResult, 0);
}

@end