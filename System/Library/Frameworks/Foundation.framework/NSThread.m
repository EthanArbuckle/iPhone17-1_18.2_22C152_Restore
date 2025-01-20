@interface NSThread
+ (BOOL)isDying;
+ (BOOL)isMainThread;
+ (BOOL)isMultiThreaded;
+ (BOOL)setThreadPriority:(double)p;
+ (NSArray)callStackReturnAddresses;
+ (NSArray)callStackSymbols;
+ (NSThread)currentThread;
+ (NSThread)mainThread;
+ (double)threadPriority;
+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument;
+ (void)detachNewThreadWithBlock:(void *)block;
+ (void)exit;
+ (void)sleepForTimeInterval:(NSTimeInterval)ti;
+ (void)sleepUntilDate:(NSDate *)date;
- (BOOL)_setThreadPriority:(double)a3;
- (BOOL)isCancelled;
- (BOOL)isDying;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isMainThread;
- (BOOL)startAndReturnError:(id *)a3;
- (NSMutableDictionary)threadDictionary;
- (NSQualityOfService)qualityOfService;
- (NSString)name;
- (NSThread)init;
- (NSThread)initWithBlock:(void *)block;
- (NSThread)initWithTarget:(id)target selector:(SEL)selector object:(id)argument;
- (NSUInteger)stackSize;
- (double)threadPriority;
- (id)description;
- (id)runLoop;
- (pthread_override_s)_beginQoSOverride:(unsigned int)a3 relativePriority:(int)a4;
- (void)_endQoSOverride:(pthread_override_s *)a3;
- (void)_nq:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setName:(NSString *)name;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setStackSize:(NSUInteger)stackSize;
- (void)start;
@end

@implementation NSThread

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = (unsigned int *)self->_private;
  uint64_t v5 = v4[14];
  v6 = (__CFString *)*((void *)v4 + 6);
  if (!v6)
  {
    int v7 = pthread_main_np();
    v6 = @"main";
    if (v7 != 1) {
      v6 = 0;
    }
  }
  return +[NSString stringWithFormat:@"<%@: %p>{number = %d, name = %@}", v3, self, v5, v6];
}

+ (BOOL)setThreadPriority:(double)p
{
  qos_class_t v4 = qos_class_self();
  if (v4 != QOS_CLASS_DEFAULT && v4)
  {
    double v7 = 0.0;
    if (p >= 0.0) {
      double v7 = p;
    }
    double v8 = v7 * -2.0 * -15.0;
    BOOL v9 = v7 <= 1.0;
    double v10 = 30.0;
    if (v9) {
      double v10 = v8;
    }
    int v11 = vcvtmd_s64_f64(v10);
    if (v11 >= 15) {
      int v11 = 15;
    }
    int v12 = (v11 & ~(v11 >> 31)) - 15;
    qos_class_t v13 = qos_class_self();
    return pthread_set_qos_class_self_np(v13, v12) == 0;
  }
  else
  {
    uint64_t v5 = +[NSThread currentThread];
    return [(NSThread *)v5 _setThreadPriority:p];
  }
}

+ (double)threadPriority
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  qos_class_t v2 = qos_class_self();
  if (v2 != QOS_CLASS_DEFAULT && v2)
  {
    *(void *)__qos_class = 0;
    uint64_t v5 = pthread_self();
    int qos_class_np = pthread_get_qos_class_np(v5, &__qos_class[1], (int *)__qos_class);
    double result = -1.0;
    if (!qos_class_np) {
      return (double)(__qos_class[0] + 15) / 30.0;
    }
  }
  else
  {
    uint64_t v3 = +[NSThread currentThread];
    [(NSThread *)v3 threadPriority];
  }
  return result;
}

- (NSThread)initWithBlock:(void *)block
{
  if (!block)
  {
    double v7 = +[NSString stringWithFormat:@"%@: block targets for threads cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v7 userInfo:0]);
  }
  qos_class_t v4 = _Block_copy(block);
  uint64_t v5 = [(NSThread *)self initWithTarget:v4 selector:sel_invoke object:0];
  _Block_release(v4);
  return v5;
}

- (NSThread)initWithTarget:(id)target selector:(SEL)selector object:(id)argument
{
  if (target && (objc_opt_respondsToSelector() & 1) == 0)
  {
    int v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    qos_class_t v13 = +[NSString stringWithFormat:@"%@: target does not implement selector (%@)", v12, _NSMethodExceptionProem((objc_class *)target, selector)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
  }
  double v10 = [(NSThread *)self init];
  -[_NSThreadData setTarget:]((uint64_t)v10->_private, (uint64_t)target);
  -[_NSThreadData setSelector:]((unint64_t)v10->_private, (uint64_t)selector);
  -[_NSThreadData setArgument:]((void *)v10->_private, (uint64_t)argument);
  return v10;
}

- (void)setName:(NSString *)name
{
  uint64_t v3 = (NSString *)*((void *)self->_private + 6);
  if (v3 != name)
  {

    *((void *)self->_private + 6) = [(NSString *)name copy];
    if (+[NSThread currentThread] == self)
    {
      v6 = (void *)*((void *)self->_private + 6);
      if (v6) {
        double v7 = (const char *)[v6 UTF8String];
      }
      else {
        double v7 = "";
      }
      pthread_setname_np(v7);
    }
  }
}

+ (NSThread)currentThread
{
  if (!_NSIsMultiThreaded && pthread_main_np() != 1)
  {
    _NSIsMultiThreaded = 1;
    objc_msgSend(+[NSNotificationCenter _defaultCenterWithoutCreating](NSNotificationCenter, "_defaultCenterWithoutCreating"), "postNotificationName:object:userInfo:", @"NSWillBecomeMultiThreadedNotification", 0, 0);
  }

  return (NSThread *)_NSThreadGet0(1);
}

- (NSMutableDictionary)threadDictionary
{
  return (NSMutableDictionary *)*((void *)self->_private + 5);
}

- (BOOL)isMainThread
{
  return +[NSThread mainThread] == self;
}

- (NSThread)init
{
  v11[1] = *(sched_param *)MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  *(void *)(v3 + 40) = objc_opt_new();
  *(void *)(v3 + 48) = 0;
  -[_NSThreadData setTarget:](v3, 0);
  -[_NSThreadData setSelector:](v3, 0);
  -[_NSThreadData setArgument:]((void *)v3, 0);
  *(_WORD *)(v3 + 60) = 0;
  *(_DWORD *)(v3 + 56) = atomic_fetch_add(init_seqNum, 1u) + 1;
  *(unsigned char *)(v3 + 62) = 0;
  atomic_store(0, (unsigned __int8 *)(v3 + 63));
  *(void *)(v3 + 64) = 0;
  *(void *)(v3 + 72) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v3 + 152) = _Q0;
  pthread_attr_init((pthread_attr_t *)(v3 + 80));
  pthread_attr_setscope((pthread_attr_t *)(v3 + 80), 1);
  pthread_attr_setdetachstate((pthread_attr_t *)(v3 + 80), 2);
  *(void *)(v3 + 144) = 0;
  self->_private = (id)v3;
  v11[0] = 0;
  if (pthread_attr_getschedparam((const pthread_attr_t *)(v3 + 80), v11))
  {
    double v9 = *(double *)(v3 + 160);
  }
  else
  {
    double v9 = (double)v11[0].sched_priority / 62.0;
    *(double *)(v3 + 160) = v9;
  }
  *(double *)(v3 + 152) = v9;
  return self;
}

+ (NSThread)mainThread
{
  if (!_NSIsMultiThreaded && pthread_main_np() != 1)
  {
    _NSIsMultiThreaded = 1;
    objc_msgSend(+[NSNotificationCenter _defaultCenterWithoutCreating](NSNotificationCenter, "_defaultCenterWithoutCreating"), "postNotificationName:object:userInfo:", @"NSWillBecomeMultiThreadedNotification", 0, 0);
  }

  return (NSThread *)_NSThreadGet0(0);
}

- (void)_nq:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  uint64_t v5 = (void *)*((void *)self->_private + 8);
  if (!v5)
  {
    *((void *)self->_private + 8) = objc_opt_new();
    uint64_t v5 = (void *)*((void *)self->_private + 8);
  }
  [v5 addObject:a3];
  v6 = (__CFRunLoop *)threadRunLoop(*((_opaque_pthread_t **)self->_private + 18));
  if (v6)
  {
    if (!*((void *)self->_private + 9)) {
      *((void *)self->_private + 9) = objc_opt_new();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    if (a3) {
      a3 = (id)*((void *)a3 + 5);
    }
    uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(a3);
          }
          CFStringRef v11 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = (__CFRunLoopSource *)[*((id *)self->_private + 9) objectForKey:v11];
          if (!v12)
          {
            memset(&v13, 0, 72);
            v13.perform = (void (__cdecl *)(void *))__NSThreadPerformPerform;
            v13.info = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
            int v12 = CFRunLoopSourceCreate(v9, 0, &v13);
            *(void *)v13.info = v12;
            CFRunLoopAddSource(v6, v12, v11);
            [*((id *)self->_private + 9) setObject:v12 forKey:v11];
            CFRelease(v12);
          }
          CFRunLoopSourceSignal(v12);
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
    CFRunLoopWakeUp(v6);
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)self->_private;
  if (v3)
  {

    *((void *)self->_private + 6) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSThread;
  [(NSThread *)&v4 dealloc];
}

- (NSQualityOfService)qualityOfService
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (pthread_t *)self->_private;
  NSQualityOfService v4 = *((char *)v3 + 61);
  if (!pthread_equal(v3[18], 0))
  {
    *(void *)__qos_class = 0;
    pthread_get_qos_class_np(*((pthread_t *)self->_private + 18), &__qos_class[1], (int *)__qos_class);
    NSQualityOfService v4 = (unint64_t)__qos_class[1];
  }
  if (v4 == (NSQualityOfServiceUtility|0x4) || v4 == 0) {
    return -1;
  }
  else {
    return v4;
  }
}

- (void)_endQoSOverride:(pthread_override_s *)a3
{
  if (a3) {
    pthread_override_qos_class_end_np(a3);
  }
}

+ (BOOL)isMainThread
{
  return pthread_main_np() == 1;
}

- (NSString)name
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = self->_private;
  double result = (NSString *)*((void *)v3 + 6);
  if (!result)
  {
    if (pthread_getname_np(*((pthread_t *)v3 + 18), v5, 0x12CuLL)) {
      return (NSString *)*((void *)self->_private + 6);
    }
    else {
      return +[NSString stringWithUTF8String:v5];
    }
  }
  return result;
}

- (void)main
{
  qos_class_t v2 = self->_private;
  if (v2 && v2[2] && v2[1])
  {
    id v3 = v2 + 4;
    uint64_t v4 = v2[3];
    unint64_t v5 = atomic_load(v3);
    if (v4 != v5) {
      _NSThreadPoisoned();
    }
    uint64_t v6 = self->_private;
    if (v6)
    {
      uint64_t v7 = (void *)v6[1];
      if (v6[2]) {
        uint64_t v8 = (const char *)v6[2];
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = v6[3];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    objc_msgSend(v7, v8, v9);
  }
}

- (void)start
{
}

+ (NSArray)callStackReturnAddresses
{
  qos_class_t v2 = malloc_type_malloc(0x800uLL, 0x80040B8603338uLL);
  if (v2) {
    thread_stack_async_pcs();
  }
  return (NSArray *)+[_NSCallStackArray arrayWithFrames:v2 count:0 symbols:0];
}

+ (NSArray)callStackSymbols
{
  qos_class_t v2 = malloc_type_malloc(0x800uLL, 0x80040B8603338uLL);
  if (v2) {
    thread_stack_async_pcs();
  }
  return (NSArray *)+[_NSCallStackArray arrayWithFrames:v2 count:0 symbols:1];
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  if (pthread_equal(*((pthread_t *)self->_private + 18), 0))
  {
    if ((unint64_t)(qualityOfService + 1) > 0x22
      || ((1 << (qualityOfService + 1)) & 0x404040401) == 0)
    {
      LOBYTE(qualityOfService) = -1;
    }
    *((void *)self->_private + 19) = *((void *)self->_private + 20);
    *((unsigned char *)self->_private + 61) = qualityOfService;
  }
}

+ (BOOL)isMultiThreaded
{
  return _NSIsMultiThreaded;
}

- (BOOL)startAndReturnError:(id *)a3
{
  char v5 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)self->_private + 63, (unsigned __int8 *)&v5, 0xDu);
  if (v5)
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: attempt to start the thread again", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  uint64_t v6 = (char *)self->_private;
  if (v6[62])
  {
    atomic_store(0xFu, (unsigned __int8 *)v6 + 63);
  }
  else
  {
    if (!_NSIsMultiThreaded)
    {
      _NSIsMultiThreaded = 1;
      [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSWillBecomeMultiThreadedNotification" object:0 userInfo:0];
      uint64_t v6 = (char *)self->_private;
    }
    if (v6[61])
    {
      uint64_t v9 = (pthread_attr_t *)(v6 + 80);
      if (v6[61] == 255) {
        char v10 = 21;
      }
      else {
        char v10 = v6[61];
      }
      pthread_attr_set_qos_class_np(v9, (qos_class_t)v10, 0);
      uint64_t v6 = (char *)self->_private;
    }
    int v11 = pthread_create((pthread_t *)v6 + 18, (const pthread_attr_t *)(v6 + 80), (void *(__cdecl *)(void *))__NSThread__start__, self);
    if (v11)
    {
      int v12 = v11;
      if (a3)
      {
        *a3 = +[NSError errorWithDomain:@"NSPOSIXErrorDomain" code:v11 userInfo:0];
      }
      else
      {
        CFRunLoopSourceContext v13 = _NSOSLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          long long v16 = _NSMethodExceptionProem((objc_class *)self, a2);
          __int16 v17 = 1024;
          int v18 = v12;
          _os_log_error_impl(&dword_181795000, v13, OS_LOG_TYPE_ERROR, "%@: Thread creation failed with error %d", buf, 0x12u);
        }
      }
    }
  }
  return 1;
}

+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument
{
  id v5 = (id)[objc_allocWithZone((Class)NSThread) initWithTarget:target selector:selector object:argument];

  [v5 start];
}

- (double)threadPriority
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!pthread_equal(*((pthread_t *)self->_private + 18), 0))
  {
    mach_msg_type_number_t policy_infoCnt = 1;
    integer_t policy_info = 0;
    BOOLean_t get_default = 0;
    thread_inspect_t v3 = pthread_mach_thread_np(*((pthread_t *)self->_private + 18));
    if (!thread_policy_get(v3, 3u, &policy_info, &policy_infoCnt, &get_default))
    {
      integer_t v4 = policy_info;
      if (policy_info >= 31) {
        integer_t v4 = 31;
      }
      if (v4 <= -31) {
        integer_t v4 = -31;
      }
      *((double *)self->_private + 19) = (double)(v4 + 31) / 62.0;
    }
  }
  return *((double *)self->_private + 19);
}

- (BOOL)_setThreadPriority:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 <= 1.0) {
    double v4 = a3;
  }
  else {
    double v4 = 1.0;
  }
  *((double *)self->_private + 19) = v4;
  if (pthread_equal(*((pthread_t *)self->_private + 18), 0)) {
    *((unsigned char *)self->_private + 61) = 0;
  }
  if (pthread_equal(*((pthread_t *)self->_private + 18), 0))
  {
    pthread_attr_setschedpolicy((pthread_attr_t *)((char *)self->_private + 80), 1);
    *(_DWORD *)v10.__opaque = 0;
    v10.sched_priority = (int)(v4 * 62.0 + 0.5);
    int v5 = pthread_attr_setschedparam((pthread_attr_t *)((char *)self->_private + 80), &v10);
  }
  else
  {
    v10.sched_priority = 1;
    thread_act_t v6 = pthread_mach_thread_np(*((pthread_t *)self->_private + 18));
    thread_policy_set(v6, 1u, (thread_policy_t)&v10, 1u);
    integer_t policy_info = (int)(v4 * 62.0 + 0.5) - 31;
    thread_act_t v7 = pthread_mach_thread_np(*((pthread_t *)self->_private + 18));
    int v5 = thread_policy_set(v7, 3u, &policy_info, 1u);
  }
  return v5 == 0;
}

+ (void)exit
{
}

+ (void)sleepUntilDate:(NSDate *)date
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFGetSystemUptime();
  double v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  [(NSDate *)date timeIntervalSinceReferenceDate];
  double v8 = v7 - Current;
  if (v8 > 0.0)
  {
    double v9 = v5 + v8;
    do
    {
      timespec __rqtp = (timespec)xmmword_18235A300;
      if (v8 < 9.22337204e18)
      {
        double __y = 0.0;
        long double v10 = modf(v8, &__y);
        __rqtp.tv_sec = (uint64_t)__y;
        __rqtp.tv_nsec = (uint64_t)(v10 * 1000000000.0);
      }
      nanosleep(&__rqtp, 0);
      CFGetSystemUptime();
      double v8 = v9 - v11;
    }
    while (v8 > 0.0);
  }
}

+ (void)sleepForTimeInterval:(NSTimeInterval)ti
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFGetSystemUptime();
  if (ti > 0.0)
  {
    double v5 = v4 + ti;
    do
    {
      timespec __rqtp = (timespec)xmmword_18235A300;
      if (ti < 9.22337204e18)
      {
        double __y = 0.0;
        long double v6 = modf(ti, &__y);
        __rqtp.tv_sec = (uint64_t)__y;
        __rqtp.tv_nsec = (uint64_t)(v6 * 1000000000.0);
      }
      nanosleep(&__rqtp, 0);
      CFGetSystemUptime();
      tuint64_t i = v5 - v7;
    }
    while (v5 - v7 > 0.0);
  }
}

- (id)runLoop
{
  if (*((unsigned __int8 *)self->_private + 60) > 1u) {
    return 0;
  }
  _CFAutoreleasePoolPush();
  if (threadRunLoop(*((_opaque_pthread_t **)self->_private + 18))) {
    qos_class_t v2 = (void *)_CFRunLoopGet2();
  }
  else {
    qos_class_t v2 = 0;
  }
  _CFAutoreleasePoolPop();
  return v2;
}

- (BOOL)isDying
{
  return *((unsigned char *)self->_private + 60) != 0;
}

+ (BOOL)isDying
{
  qos_class_t v2 = +[NSThread currentThread];

  return [(NSThread *)v2 isDying];
}

+ (void)detachNewThreadWithBlock:(void *)block
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!block)
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: block targets for threads cannot be nil", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  pthread_t v6 = 0;
  memset(&v7, 0, sizeof(v7));
  pthread_attr_init(&v7);
  pthread_attr_setscope(&v7, 1);
  pthread_attr_setdetachstate(&v7, 2);
  double v4 = _Block_copy(block);
  pthread_create(&v6, &v7, (void *(__cdecl *)(void *))__NSThread__block_start__, v4);
}

- (void)setStackSize:(NSUInteger)stackSize
{
  size_t v3 = stackSize;
  if (stackSize >> 14)
  {
    if (stackSize >= 0x40000000) {
      size_t v3 = 0x40000000;
    }
    if (pthread_attr_setstacksize((pthread_attr_t *)((char *)self->_private + 80), v3)
      && dyld_program_sdk_at_least())
    {
      double v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
      pthread_t v6 = +[NSString stringWithFormat:@"Can't set stack size to %lu (it must be a multiple of the system page size and greater than %d)", v3, 0x4000];
LABEL_9:
      objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    double v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    pthread_t v6 = +[NSString stringWithFormat:@"Can't set stack size to a value lower than %d (requested %lu)", 0x4000, v3];
    goto LABEL_9;
  }
}

- (NSUInteger)stackSize
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  pthread_attr_getstacksize((const pthread_attr_t *)((char *)self->_private + 80), v3);
  return v3[0];
}

- (pthread_override_s)_beginQoSOverride:(unsigned int)a3 relativePriority:(int)a4
{
  uint64_t v7 = *((void *)self->_private + 18);
  if (v7 == pthread_main_thread_np()) {
    return 0;
  }
  uint64_t v8 = (_opaque_pthread_t *)*((void *)self->_private + 18);

  return pthread_override_qos_class_start_np(v8, (qos_class_t)a3, a4);
}

- (BOOL)isExecuting
{
  int v2 = atomic_load((unsigned __int8 *)self->_private + 63);
  return v2 == 14;
}

- (BOOL)isFinished
{
  int v2 = atomic_load((unsigned __int8 *)self->_private + 63);
  return v2 == 15;
}

- (BOOL)isCancelled
{
  return *((unsigned char *)self->_private + 62) != 0;
}

- (void)cancel
{
  if (+[NSThread mainThread] != self) {
    *((unsigned char *)self->_private + 62) = -86;
  }
}

uint64_t ____NSThread__block_start___block_invoke()
{
  return pthread_key_create((pthread_key_t *)&qword_1EB1ED038, (void (__cdecl *)(void *))__NSThread__block_dispose);
}

@end