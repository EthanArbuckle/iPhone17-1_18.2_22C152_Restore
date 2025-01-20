@interface IAPStackshot
+ (id)sharedInstance;
- (IAPStackshot)init;
- (id)startTimer:(double)a3 withInfo:(id)a4;
- (void)_saveStackshot:(id)a3;
- (void)_stackshotThread;
- (void)endTimer:(id)a3;
@end

@implementation IAPStackshot

+ (id)sharedInstance
{
  if (qword_10013BB48 != -1) {
    dispatch_once(&qword_10013BB48, &stru_100121D78);
  }
  return (id)qword_10013BB40;
}

- (IAPStackshot)init
{
  v4.receiver = self;
  v4.super_class = (Class)IAPStackshot;
  result = [(IAPStackshot *)&v4 init];
  v3 = result;
  if (!result) {
    return v3;
  }
  if ((((_BYTE)result + 16) & 3) == 0)
  {
    result->_timerID = 0;
    +[NSThread detachNewThreadSelector:"_stackshotThread" toTarget:result withObject:0];
    return v3;
  }
  __break(0x5516u);
  return result;
}

- (id)startTimer:(double)a3 withInfo:(id)a4
{
  if ((((unint64_t)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*((void *)self + 1))
    {
      v5 = (id *)self;
      id v6 = objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3), self, "_saveStackshot:", a4, 0, 0.0);
      [v5[1] addTimer:v6 forMode:NSDefaultRunLoopMode];
    }
    else
    {
      NSLog(@"ERROR - %s:%s - %d no run loop", a2, a4, a3, "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPStackshot.m", "-[IAPStackshot startTimer:withInfo:]", 53);
      id v6 = 0;
    }
    return v6;
  }
  return self;
}

- (void)endTimer:(id)a3
{
}

- (void)_stackshotThread
{
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  id v3 = objc_alloc_init((Class)NSPort);
  uint64_t v4 = +[NSRunLoop currentRunLoop];
  p_stackshotRunLoop = &self->_stackshotRunLoop;
  if ((p_stackshotRunLoop & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    *p_stackshotRunLoop = v4;
    [(NSRunLoop *)v4 addPort:v3 forMode:NSDefaultRunLoopMode];

    NSLog(@"_stackshotThread started (%hhx)", *p_stackshotRunLoop);
    CFRunLoopRun();
    NSLog(@"_stackshotThread ended (%hhx)", *p_stackshotRunLoop);
  }
}

- (void)_saveStackshot:(id)a3
{
  if (((unint64_t)&self->_stackshotRunLoop & 7) != 0) {
    __break(0x5516u);
  }
  else {
    NSLog(@"saveStackshot(%hhx): %@", self->_stackshotRunLoop, [a3 userInfo]);
  }
}

@end