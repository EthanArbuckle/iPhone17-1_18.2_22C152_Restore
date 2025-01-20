@interface IDSBlockRetryHandler
- (IDSBlockRetryHandler)initWithQueue:(id)a3 backoffProvider:(id)a4 block:(id)a5;
- (OS_dispatch_queue)queue;
- (id)_isFinishedBlock;
- (id)backoffProvider;
- (id)block;
- (id)scheduledBlock;
- (int64_t)attempts;
- (void)_deferToQueue:(id)a3 after:(double)a4 block:(id)a5;
- (void)_run;
- (void)dealloc;
- (void)setAttempts:(int64_t)a3;
- (void)setBackoffProvider:(id)a3;
- (void)setBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScheduledBlock:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation IDSBlockRetryHandler

- (IDSBlockRetryHandler)initWithQueue:(id)a3 backoffProvider:(id)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IDSBlockRetryHandler;
  v12 = [(IDSBlockRetryHandler *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    id v14 = objc_retainBlock(v10);
    id backoffProvider = v13->_backoffProvider;
    v13->_id backoffProvider = v14;

    id v16 = objc_retainBlock(v11);
    id block = v13->_block;
    v13->_id block = v16;

    v13->_attempts = 0;
  }

  return v13;
}

- (void)dealloc
{
  id scheduledBlock = self->_scheduledBlock;
  if (scheduledBlock) {
    dispatch_block_cancel(scheduledBlock);
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSBlockRetryHandler;
  [(IDSBlockRetryHandler *)&v4 dealloc];
}

- (void)start
{
  [(IDSBlockRetryHandler *)self stop];
  [(IDSBlockRetryHandler *)self setAttempts:0];

  [(IDSBlockRetryHandler *)self _run];
}

- (void)stop
{
  id scheduledBlock = self->_scheduledBlock;
  if (scheduledBlock)
  {
    dispatch_block_cancel(scheduledBlock);
    id v4 = self->_scheduledBlock;
    self->_id scheduledBlock = 0;
  }
}

- (void)_run
{
  int64_t v3 = [(IDSBlockRetryHandler *)self attempts];
  [(IDSBlockRetryHandler *)self setAttempts:(char *)[(IDSBlockRetryHandler *)self attempts] + 1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CB724;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v5 = v4;
  if (v3)
  {
    [(IDSBlockRetryHandler *)self setScheduledBlock:v4];
    v6 = [(IDSBlockRetryHandler *)self backoffProvider];
    double v7 = v6[2](v6, [(IDSBlockRetryHandler *)self attempts]);
    v8 = [(IDSBlockRetryHandler *)self queue];
    [(IDSBlockRetryHandler *)self _deferToQueue:v8 after:v5 block:v7];
  }
  else
  {
    (*((void (**)(dispatch_block_t))v4 + 2))(v4);
  }
}

- (void)_deferToQueue:(id)a3 after:(double)a4 block:(id)a5
{
  int64_t v6 = (uint64_t)(a4 * 1000000000.0);
  id v7 = a5;
  queue = a3;
  dispatch_time_t v8 = dispatch_time(0, v6);
  dispatch_after(v8, queue, v7);
}

- (id)_isFinishedBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002CB8E0;
  v4[3] = &unk_100987F48;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)backoffProvider
{
  return self->_backoffProvider;
}

- (void)setBackoffProvider:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (int64_t)attempts
{
  return self->_attempts;
}

- (void)setAttempts:(int64_t)a3
{
  self->_attempts = a3;
}

- (id)scheduledBlock
{
  return self->_scheduledBlock;
}

- (void)setScheduledBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scheduledBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_backoffProvider, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end