@interface ADDeviceSyncMessageSendingContext
- (ADDeviceSyncMessageSendingContext)initWithQueue:(id)a3 deviceIdentifier:(id)a4 timeoutDuration:(double)a5 completion:(id)a6;
- (void)_addError:(id)a3;
- (void)_beginSendingWithMessageSender:(id)a3;
- (void)_cancelWatchdogTimer;
- (void)_endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5;
- (void)_finalizeWithError:(id)a3;
- (void)_finalizeWithResponseMessage:(id)a3;
- (void)_handleWatchdogTimeout;
- (void)beginSendingWithMessageSender:(id)a3;
- (void)dealloc;
- (void)endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5;
@end

@implementation ADDeviceSyncMessageSendingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_finalizeWithError:(id)a3
{
  id v7 = a3;
  [(ADDeviceSyncMessageSendingContext *)self _cancelWatchdogTimer];
  completion = (void (**)(id, void, id))self->_completion;
  if (completion)
  {
    completion[2](completion, 0, v7);
    id v5 = self->_completion;
    self->_completion = 0;
  }
  errors = self->_errors;
  self->_errors = 0;
}

- (void)_finalizeWithResponseMessage:(id)a3
{
  id v7 = a3;
  [(ADDeviceSyncMessageSendingContext *)self _cancelWatchdogTimer];
  completion = (void (**)(id, id, void))self->_completion;
  if (completion)
  {
    completion[2](completion, v7, 0);
    id v5 = self->_completion;
    self->_completion = 0;
  }
  errors = self->_errors;
  self->_errors = 0;
}

- (void)_addError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_completion)
  {
    errors = self->_errors;
    id v9 = v5;
    if (!errors)
    {
      id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v8 = self->_errors;
      self->_errors = v7;

      errors = self->_errors;
    }
    id v4 = [(NSMutableArray *)errors addObject:v9];
    id v5 = v9;
  }
  _objc_release_x1(v4, v5);
}

- (void)_cancelWatchdogTimer
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    [(AFWatchdogTimer *)watchdogTimer cancel];
    id v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }
}

- (void)_handleWatchdogTimeout
{
  if (self->_completion)
  {
    id v3 = +[AFError errorWithCode:2406 description:@"Message sending timed out." underlyingErrors:self->_errors];
    [(ADDeviceSyncMessageSendingContext *)self _finalizeWithError:v3];
  }
}

- (void)_endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t numberOfActiveMessageSenders = self->_numberOfActiveMessageSenders;
  if (numberOfActiveMessageSenders) {
    self->_unint64_t numberOfActiveMessageSenders = numberOfActiveMessageSenders - 1;
  }
  if (self->_completion)
  {
    [(ADDeviceSyncMessageSendingContext *)self _addError:v9];
    if (v8)
    {
      [(ADDeviceSyncMessageSendingContext *)self _finalizeWithResponseMessage:v8];
    }
    else if (!self->_numberOfActiveMessageSenders)
    {
      v11 = +[AFError errorWithCode:2405 description:@"Message sending failed." underlyingErrors:self->_errors];
      [(ADDeviceSyncMessageSendingContext *)self _finalizeWithError:v11];
    }
  }
}

- (void)_beginSendingWithMessageSender:(id)a3
{
  unint64_t numberOfActiveMessageSenders = self->_numberOfActiveMessageSenders;
  if (!numberOfActiveMessageSenders)
  {
    [(AFWatchdogTimer *)self->_watchdogTimer start];
    unint64_t numberOfActiveMessageSenders = self->_numberOfActiveMessageSenders;
  }
  self->_unint64_t numberOfActiveMessageSenders = numberOfActiveMessageSenders + 1;
}

- (void)endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010F8B0;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)beginSendingWithMessageSender:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010F958;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADDeviceSyncMessageSendingContext)initWithQueue:(id)a3 deviceIdentifier:(id)a4 timeoutDuration:(double)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ADDeviceSyncMessageSendingContext;
  id v14 = [(ADDeviceSyncMessageSendingContext *)&v28 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a3);
    id v16 = (NSString *)[v12 copy];
    deviceIdentifier = v15->_deviceIdentifier;
    v15->_deviceIdentifier = v16;

    id v18 = objc_retainBlock(v13);
    id completion = v15->_completion;
    v15->_id completion = v18;

    if (a5 > 0.0)
    {
      objc_initWeak(&location, v15);
      id v20 = objc_alloc((Class)AFWatchdogTimer);
      queue = v15->_queue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10010FB10;
      v25[3] = &unk_10050B790;
      objc_copyWeak(&v26, &location);
      v22 = (AFWatchdogTimer *)[v20 initWithTimeoutInterval:queue onQueue:v25 timeoutHandler:a5];
      watchdogTimer = v15->_watchdogTimer;
      v15->_watchdogTimer = v22;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v15;
}

- (void)dealloc
{
  if (self->_completion)
  {
    id v3 = +[AFError errorWithCode:2405 description:@"Message sending failed." underlyingErrors:self->_errors];
    [(ADDeviceSyncMessageSendingContext *)self _finalizeWithError:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)ADDeviceSyncMessageSendingContext;
  [(ADDeviceSyncMessageSendingContext *)&v4 dealloc];
}

@end