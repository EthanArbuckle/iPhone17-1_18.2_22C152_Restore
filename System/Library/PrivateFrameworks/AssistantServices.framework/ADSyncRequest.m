@interface ADSyncRequest
- (ADSyncRequest)init;
- (BOOL)timedout;
- (NSUUID)uuid;
- (id)syncChunkHandler;
- (void)dealloc;
- (void)invalidateTimer;
- (void)setSyncChunkHandler:(id)a3;
- (void)startTimerOnQueue:(id)a3 withTimeoutHandler:(id)a4;
@end

@implementation ADSyncRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncChunkHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setSyncChunkHandler:(id)a3
{
}

- (id)syncChunkHandler
{
  return self->_syncChunkHandler;
}

- (BOOL)timedout
{
  return self->_timedout;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)invalidateTimer
{
  [(AFWatchdogTimer *)self->_timer cancel];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)startTimerOnQueue:(id)a3 withTimeoutHandler:(id)a4
{
  id v6 = a4;
  self->_timedout = 0;
  id v7 = a3;
  id v8 = objc_alloc((Class)AFWatchdogTimer);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10008C130;
  v15 = &unk_10050E188;
  v16 = self;
  id v17 = v6;
  id v9 = v6;
  v10 = (AFWatchdogTimer *)[v8 initWithTimeoutInterval:v7 onQueue:&v12 timeoutHandler:60.0];

  timer = self->_timer;
  self->_timer = v10;

  [(AFWatchdogTimer *)self->_timer start];
}

- (void)dealloc
{
  [(ADSyncRequest *)self invalidateTimer];
  v3.receiver = self;
  v3.super_class = (Class)ADSyncRequest;
  [(ADSyncRequest *)&v3 dealloc];
}

- (ADSyncRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADSyncRequest;
  v2 = [(ADSyncRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v2->_timedout = 0;
  }
  return v2;
}

@end