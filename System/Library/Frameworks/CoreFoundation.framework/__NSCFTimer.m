@interface __NSCFTimer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (__NSCFTimer)init;
- (__NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8;
- (id)fireDate;
- (id)userInfo;
- (void)fire;
- (void)setFireDate:(id)a3;
@end

@implementation __NSCFTimer

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)isValid
{
  return CFRunLoopTimerIsValid((CFRunLoopTimerRef)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)fireDate
{
  double NextFireDate = CFRunLoopTimerGetNextFireDate((CFRunLoopTimerRef)self);

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:NextFireDate];
}

- (void)setFireDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)self, v4);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)userInfo
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  memset(&v3, 0, sizeof(v3));
  CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v3);
  return (id)*((void *)v3.info + 3);
}

- (void)fire
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if ([(__NSCFTimer *)self isValid])
  {
    CFRunLoopTimerContext v3 = self;
    memset(&v5, 0, sizeof(v5));
    CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v5);
    __CFFireTimer(self, (uint64_t)v5.info);
    [(__NSCFTimer *)self timeInterval];
    if (v4 == 0.0) {
      [(__NSCFTimer *)self invalidate];
    }
  }
}

- (__NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  v14 = malloc_default_zone();
  v15 = malloc_type_zone_calloc(v14, 1uLL, 0x20uLL, 0x10800406BDE4C18uLL);
  v16 = v15;
  v20.version = 0;
  v20.info = v15;
  v20.retain = (const void *(__cdecl *)(const void *))_timerRetain;
  v20.release = (void (__cdecl *)(const void *))_timerRelease;
  v20.copyDescription = 0;
  if (a4 <= 0.0) {
    a4 = 0.0001;
  }
  *(_DWORD *)v15 = 0;
  v15[1] = a5;
  v16[2] = a6;
  v16[3] = a7;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate", v20.version, v20.info, v20.retain, v20.release, v20.copyDescription, v21);
  double v18 = 0.0;
  if (v8) {
    double v18 = a4;
  }
  return (__NSCFTimer *)CFRunLoopTimerCreate(0, v17, v18, 0, 0, (CFRunLoopTimerCallBack)__CFFireTimer, &v20);
}

- (__NSCFTimer)init
{
  return 0;
}

@end