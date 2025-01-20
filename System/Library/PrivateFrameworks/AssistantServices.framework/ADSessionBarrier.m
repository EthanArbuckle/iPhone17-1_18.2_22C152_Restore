@interface ADSessionBarrier
- (ADSessionBarrier)initWithThunk:(id)a3 barrier:(id)a4;
- (BOOL)bufferingAllowedDuringActiveSession;
- (BOOL)isProvisional;
- (BOOL)isRestartable;
- (BOOL)isRetryable;
- (BOOL)siriCore_bufferingAllowedDuringActiveSession;
- (BOOL)siriCore_isProvisional;
- (BOOL)siriCore_isRestartable;
- (BOOL)siriCore_isRetryable;
- (BOOL)siriCore_supportedByLocalSession;
- (BOOL)siriCore_supportedByRemoteLimitedSession;
- (BOOL)supportedByLocalSession;
- (BOOL)supportedByRemoteLimitedSession;
- (NSString)aceId;
- (NSString)refId;
- (id)serializedAceDataError:(id *)a3;
- (id)sessionRequestId;
- (id)siriCore_requestId;
- (id)siriCore_serializedAceDataError:(id *)a3;
- (void)barrierResultReturnedWithSuccess:(BOOL)a3;
- (void)dealloc;
- (void)setAceId:(id)a3;
- (void)siriCore_invokeThunk;
- (void)siriNetwork_invokeThunk;
@end

@implementation ADSessionBarrier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->aceId, 0);
  objc_storeStrong((id *)&self->_barrierQueue, 0);
  objc_storeStrong(&self->_barrierBlock, 0);
  objc_storeStrong(&self->_thunkBlock, 0);
}

- (void)setAceId:(id)a3
{
}

- (NSString)aceId
{
  return self->aceId;
}

- (void)siriNetwork_invokeThunk
{
  thunkBlock = (void (**)(id, ADSessionBarrier *))self->_thunkBlock;
  if (thunkBlock) {
    thunkBlock[2](thunkBlock, self);
  }
}

- (BOOL)supportedByRemoteLimitedSession
{
  return 0;
}

- (BOOL)supportedByLocalSession
{
  return 0;
}

- (id)sessionRequestId
{
  return 0;
}

- (id)serializedAceDataError:(id *)a3
{
  return 0;
}

- (BOOL)isRetryable
{
  return 1;
}

- (BOOL)isRestartable
{
  return 1;
}

- (BOOL)isProvisional
{
  return 0;
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)siriCore_supportedByLocalSession
{
  return 0;
}

- (BOOL)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

- (id)siriCore_requestId
{
  return 0;
}

- (id)siriCore_serializedAceDataError:(id *)a3
{
  return 0;
}

- (BOOL)siriCore_isProvisional
{
  return 0;
}

- (BOOL)siriCore_isRestartable
{
  return 1;
}

- (BOOL)siriCore_isRetryable
{
  return 1;
}

- (BOOL)siriCore_bufferingAllowedDuringActiveSession
{
  return 1;
}

- (NSString)refId
{
  return 0;
}

- (void)siriCore_invokeThunk
{
  thunkBlock = (void (**)(id, ADSessionBarrier *))self->_thunkBlock;
  if (thunkBlock) {
    thunkBlock[2](thunkBlock, self);
  }
}

- (void)barrierResultReturnedWithSuccess:(BOOL)a3
{
  barrierQueue = self->_barrierQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002EF604;
  v4[3] = &unk_10050CD50;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(barrierQueue, v4);
}

- (void)dealloc
{
  barrierBlock = (void (**)(id, void))self->_barrierBlock;
  if (barrierBlock) {
    barrierBlock[2](barrierBlock, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADSessionBarrier;
  [(ADSessionBarrier *)&v4 dealloc];
}

- (ADSessionBarrier)initWithThunk:(id)a3 barrier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ADSessionBarrier;
  v8 = [(ADSessionBarrier *)&v17 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id thunkBlock = v8->_thunkBlock;
    v8->_id thunkBlock = v9;

    id v11 = objc_retainBlock(v7);
    id barrierBlock = v8->_barrierBlock;
    v8->_id barrierBlock = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(0, v13);

    barrierQueue = v8->_barrierQueue;
    v8->_barrierQueue = (OS_dispatch_queue *)v14;
  }
  return v8;
}

@end