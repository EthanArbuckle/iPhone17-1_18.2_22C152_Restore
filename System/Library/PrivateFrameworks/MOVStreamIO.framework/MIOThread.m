@interface MIOThread
- (MIOThread)init;
- (MIOThread)initWithName:(id)a3 block:(id)a4;
- (OS_os_log)perfLogHandle;
- (void)proceed;
- (void)setPerfLogHandle:(id)a3;
- (void)waitWithTimeout:(double)a3;
@end

@implementation MIOThread

- (MIOThread)init
{
  v6.receiver = self;
  v6.super_class = (Class)MIOThread;
  v2 = [(MIOThread *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    waitSema = v2->_waitSema;
    v2->_waitSema = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (MIOThread)initWithName:(id)a3 block:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIOThread;
  v7 = [(MIOThread *)&v13 initWithBlock:a4];
  v8 = v7;
  if (v7)
  {
    [(MIOThread *)v7 setName:v6];
    id v9 = [NSString stringWithFormat:@"com.apple.mio.thread.%@", v6];
    os_log_t v10 = os_log_create((const char *)[v9 UTF8String], "PointsOfInterest");
    perfLogHandle = v8->_perfLogHandle;
    v8->_perfLogHandle = (OS_os_log *)v10;
  }
  return v8;
}

- (void)waitWithTimeout:(double)a3
{
  waitSema = self->_waitSema;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));

  dispatch_semaphore_wait(waitSema, v4);
}

- (void)proceed
{
}

- (OS_os_log)perfLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPerfLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfLogHandle, 0);

  objc_storeStrong((id *)&self->_waitSema, 0);
}

@end