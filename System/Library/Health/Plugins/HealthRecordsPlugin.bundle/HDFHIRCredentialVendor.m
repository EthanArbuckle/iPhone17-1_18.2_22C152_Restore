@interface HDFHIRCredentialVendor
- (BOOL)_queue_hasInFlightRefreshTask;
- (HDFHIRCredentialResult)currentResult;
- (HDFHIRCredentialVendor)init;
- (HDFHIRCredentialVendor)initWithCredential:(id)a3;
- (HDFHIRCredentialVendorDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)credentialResultDidUpdateHandler;
- (void)_queue_dispatchResult:(id)a3 clientCompletion:(id)a4;
- (void)_queue_enqueueRefreshForResult:(id)a3 clientCompletion:(id)a4;
- (void)_queue_fetchOrRefreshCredentialWithClientCompletion:(id)a3;
- (void)_queue_handleDelegateRefreshCompletionForInitialResult:(id)a3 refreshResult:(id)a4;
- (void)_queue_performRefreshRequestTaskForResult:(id)a3;
- (void)_queue_releaseDelegate;
- (void)_queue_retainDelegate;
- (void)_setCurrentResultSync:(id)a3;
- (void)fetchOrRefreshCredentialWithCompletion:(id)a3;
- (void)setCredentialResultDidUpdateHandler:(id)a3;
- (void)setCurrentResult:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDFHIRCredentialVendor

- (HDFHIRCredentialVendor)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIRCredentialVendor)initWithCredential:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDFHIRCredentialVendor;
  v5 = [(HDFHIRCredentialVendor *)&v15 init];
  if (v5)
  {
    uint64_t v6 = HKCreateConcurrentDispatchQueue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = HKCreateSerialDispatchQueue();
    credentialResultQueue = v5->_credentialResultQueue;
    v5->_credentialResultQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v12 = [[HDFHIRCredentialResult alloc] _initWithCredential:v4 authResponse:0];
    currentResult = v5->_currentResult;
    v5->_currentResult = v12;
  }
  return v5;
}

- (void)fetchOrRefreshCredentialWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1ABAC;
  v7[3] = &unk_111E90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_fetchOrRefreshCredentialWithClientCompletion:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(HDFHIRCredentialVendor *)self _queue_retainDelegate];
  id v6 = [(HDFHIRCredentialVendor *)self currentResult];
  if ([v6 shouldRefresh]) {
    [(HDFHIRCredentialVendor *)self _queue_enqueueRefreshForResult:v6 clientCompletion:v5];
  }
  else {
    [(HDFHIRCredentialVendor *)self _queue_dispatchResult:v6 clientCompletion:v5];
  }

  [(HDFHIRCredentialVendor *)self _queue_releaseDelegate];
}

- (void)_queue_dispatchResult:(id)a3 clientCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1AD2C;
  v11[3] = &unk_112278;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(clientQueue, v11);
}

- (BOOL)_queue_hasInFlightRefreshTask
{
  return self->_hasInFlightRefreshTask;
}

- (void)_queue_enqueueRefreshForResult:(id)a3 clientCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(HDFHIRCredentialVendor *)self _queue_hasInFlightRefreshTask]) {
    [(HDFHIRCredentialVendor *)self _queue_performRefreshRequestTaskForResult:v6];
  }
  id v8 = self->_inFlightRefreshResultPromise;
  inFlightRefreshCompletionGroup = self->_inFlightRefreshCompletionGroup;
  clientQueue = self->_clientQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1AE6C;
  v13[3] = &unk_112278;
  v14 = v8;
  id v15 = v7;
  v11 = v8;
  id v12 = v7;
  dispatch_group_notify(inFlightRefreshCompletionGroup, clientQueue, v13);
}

- (void)_queue_performRefreshRequestTaskForResult:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HDFHIRCredentialVendor *)self _queue_hasInFlightRefreshTask])
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDFHIRCredentialVendor.m", 145, @"Invalid parameter not satisfying: %@", @"![self _queue_hasInFlightRefreshTask]" object file lineNumber description];
  }
  if (!self->_strongDelegate)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDFHIRCredentialVendor.m", 146, @"Invalid parameter not satisfying: %@", @"_strongDelegate != nil" object file lineNumber description];
  }
  self->_hasInFlightRefreshTask = 1;
  id v6 = objc_alloc_init(_HDFHIRCredentialResultPromise);
  inFlightRefreshResultPromise = self->_inFlightRefreshResultPromise;
  self->_inFlightRefreshResultPromise = v6;

  id v8 = (OS_dispatch_group *)dispatch_group_create();
  inFlightRefreshCompletionGroup = self->_inFlightRefreshCompletionGroup;
  self->_inFlightRefreshCompletionGroup = v8;

  dispatch_group_enter((dispatch_group_t)self->_inFlightRefreshCompletionGroup);
  strongDelegate = self->_strongDelegate;
  v11 = [v5 credential];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1B070;
  v15[3] = &unk_1122C8;
  v15[4] = self;
  id v16 = v5;
  id v12 = v5;
  [(HDFHIRCredentialVendorDelegate *)strongDelegate credentialVendor:self refreshCredential:v11 completion:v15];
}

- (void)_queue_handleDelegateRefreshCompletionForInitialResult:(id)a3 refreshResult:(id)a4
{
  id v23 = a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = [v23 authResponse];

  if (v9)
  {
    id v10 = [v23 authResponse];
    uint64_t v11 = [v8 _resultWithAuthResponse:v10];
  }
  else
  {
    id v12 = [v23 error];

    if (!v12)
    {
      v22 = +[NSAssertionHandler currentHandler];
      [v22 handleFailureInMethod:a2, self, @"HDFHIRCredentialVendor.m", 172, @"Invalid parameter not satisfying: %@", @"refreshResult.error != nil" object file lineNumber description];
    }
    id v10 = [v23 error];
    uint64_t v11 = [v8 _resultWithRefreshError:v10];
  }
  id v13 = (void *)v11;

  [(HDFHIRCredentialVendor *)self _setCurrentResultSync:v13];
  v14 = [(HDFHIRCredentialVendor *)self credentialResultDidUpdateHandler];
  if (v14)
  {
    id v15 = [v23 endStates];
    id v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = [objc_alloc((Class)HKFHIRRequestTaskEndStates) initWithEndStates:&__NSArray0__struct];
    }
    v18 = v17;

    ((void (**)(void, void *, void *))v14)[2](v14, v13, v18);
  }
  [(_HDFHIRCredentialResultPromise *)self->_inFlightRefreshResultPromise fulfillWithResult:v13];
  inFlightRefreshResultPromise = self->_inFlightRefreshResultPromise;
  self->_inFlightRefreshResultPromise = 0;

  inFlightRefreshCompletionGroup = self->_inFlightRefreshCompletionGroup;
  self->_inFlightRefreshCompletionGroup = 0;
  v21 = inFlightRefreshCompletionGroup;

  self->_hasInFlightRefreshTask = 0;
  dispatch_group_leave(v21);
}

- (void)_queue_retainDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_strongDelegateRetainCount)
  {
    id v4 = [(HDFHIRCredentialVendor *)self delegate];
    strongDelegate = self->_strongDelegate;
    self->_strongDelegate = v4;

    if (!self->_strongDelegate)
    {
      id v6 = +[NSAssertionHandler currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"HDFHIRCredentialVendor.m" lineNumber:199 description:@"missing delegate"];
    }
  }
  ++self->_strongDelegateRetainCount;
}

- (void)_queue_releaseDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t strongDelegateRetainCount = self->_strongDelegateRetainCount;
  if (!strongDelegateRetainCount)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HDFHIRCredentialVendor.m" lineNumber:208 description:@"overrelease"];

    unint64_t strongDelegateRetainCount = self->_strongDelegateRetainCount;
  }
  unint64_t v5 = strongDelegateRetainCount - 1;
  self->_unint64_t strongDelegateRetainCount = v5;
  if (!v5)
  {
    strongDelegate = self->_strongDelegate;
    self->_strongDelegate = 0;
  }
}

- (HDFHIRCredentialResult)currentResult
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_credentialResultQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1B57C;
  uint64_t v11 = sub_1B58C;
  id v12 = 0;
  credentialResultQueue = self->_credentialResultQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1B594;
  v6[3] = &unk_1122F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(credentialResultQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HDFHIRCredentialResult *)v4;
}

- (void)setCurrentResult:(id)a3
{
  id v4 = a3;
  credentialResultQueue = self->_credentialResultQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B640;
  v7[3] = &unk_112318;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(credentialResultQueue, v7);
}

- (void)_setCurrentResultSync:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_credentialResultQueue);
  credentialResultQueue = self->_credentialResultQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B6F8;
  v7[3] = &unk_112318;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(credentialResultQueue, v7);
}

- (id)credentialResultDidUpdateHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCredentialResultDidUpdateHandler:(id)a3
{
}

- (HDFHIRCredentialVendorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDFHIRCredentialVendorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_credentialResultDidUpdateHandler, 0);
  objc_storeStrong((id *)&self->_inFlightRefreshCompletionGroup, 0);
  objc_storeStrong((id *)&self->_inFlightRefreshResultPromise, 0);
  objc_storeStrong((id *)&self->_credentialResultQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);

  objc_storeStrong((id *)&self->_currentResult, 0);
}

@end