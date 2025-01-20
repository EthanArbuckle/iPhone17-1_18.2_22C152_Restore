@interface NSCFTimer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)retainWeakReference;
- (NSCFTimer)init;
- (NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8;
- (NSCFTimer)retain;
- (id)fireDate;
- (id)userInfo;
- (unint64_t)hash;
- (void)fire;
- (void)setFireDate:(id)a3;
@end

@implementation NSCFTimer

+ (id)allocWithZone:(_NSZone *)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__NSCFTimer_allocWithZone___block_invoke;
  v4[3] = &unk_1E51F71D0;
  v4[4] = a1;
  if (qword_1EB1ED828 != -1) {
    dispatch_once(&qword_1EB1ED828, v4);
  }
  return (id)_MergedGlobals_122;
}

- (NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v14 = malloc_default_zone();
  v15 = malloc_type_zone_calloc(v14, 1uLL, 0x20uLL, 0xC2E5A2B2uLL);
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
  return (NSCFTimer *)CFRunLoopTimerCreate(0, v17, v18, 0, 0, (CFRunLoopTimerCallBack)__NSFireTimer, &v20);
}

id __27__NSCFTimer_allocWithZone___block_invoke(uint64_t a1)
{
  id result = NSAllocateObject(*(Class *)(a1 + 32), 0, 0);
  _MergedGlobals_122 = (uint64_t)result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (unint64_t)hash
{
  return MEMORY[0x1F40D8EB0](self, a2);
}

- (NSCFTimer)retain
{
  return (NSCFTimer *)MEMORY[0x1F40D8EC0](self, a2);
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (BOOL)isValid
{
  return CFRunLoopTimerIsValid((CFRunLoopTimerRef)self) != 0;
}

- (id)fireDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  double NextFireDate = CFRunLoopTimerGetNextFireDate((CFRunLoopTimerRef)self);

  return (id)[v2 dateWithTimeIntervalSinceReferenceDate:NextFireDate];
}

- (void)setFireDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)self, v4);
}

- (id)userInfo
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(&v3, 0, sizeof(v3));
  CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v3);
  return (id)*((void *)v3.info + 3);
}

- (void)fire
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(NSCFTimer *)self isValid])
  {
    CFRunLoopTimerContext v3 = self;
    memset(&v5, 0, sizeof(v5));
    CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v5);
    __NSFireTimer(self, (uint64_t)v5.info);
    [(NSCFTimer *)self timeInterval];
    if (v4 == 0.0) {
      [(NSCFTimer *)self invalidate];
    }
  }
}

- (NSCFTimer)init
{
  return 0;
}

@end