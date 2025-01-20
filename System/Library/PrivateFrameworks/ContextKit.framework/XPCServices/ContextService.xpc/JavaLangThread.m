@interface JavaLangThread
+ (BOOL)holdsLockWithId:(id)a3;
+ (JavaLangThread)initializeThreadClass;
+ (const)__metadata;
+ (id)__annotations_countStackFrames;
+ (id)getAllStackTraces;
+ (id)getDefaultUncaughtExceptionHandler;
+ (int)enumerateWithJavaLangThreadArray:(id)a3;
+ (uint64_t)getNextThreadId;
+ (void)initialize;
+ (void)setDefaultUncaughtExceptionHandlerWithJavaLangThread_UncaughtExceptionHandler:(id)a3;
+ (void)sleepWithLong:(int64_t)a3;
+ (void)sleepWithLong:(int64_t)a3 withInt:(int)a4;
- (BOOL)isAlive;
- (BOOL)isDaemon;
- (BOOL)isInterrupted;
- (JavaLangThread)init;
- (JavaLangThread)initWithJavaLangRunnable:(id)a3;
- (JavaLangThread)initWithJavaLangRunnable:(id)a3 withNSString:(id)a4;
- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4;
- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4 withNSString:(id)a5;
- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4 withNSString:(id)a5 withLong:(int64_t)a6;
- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withNSString:(id)a4;
- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5;
- (JavaLangThread)initWithNSString:(id)a3;
- (NSString)description;
- (id)getContextClassLoader;
- (id)getName;
- (id)getStackTrace;
- (id)getState;
- (id)getThreadGroup;
- (id)getUncaughtExceptionHandler;
- (int)countStackFrames;
- (int)getPriority;
- (int64_t)getId;
- (void)__javaClone;
- (void)cancelNativeThread;
- (void)createWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4 withNSString:(id)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7;
- (void)dealloc;
- (void)interrupt;
- (void)joinWithLong:(int64_t)a3;
- (void)joinWithLong:(int64_t)a3 withInt:(int)a4;
- (void)parkForWithLong:(int64_t)a3;
- (void)parkUntilWithLong:(int64_t)a3;
- (void)popInterruptAction$WithJavaLangRunnable:(id)a3;
- (void)pushInterruptAction$WithJavaLangRunnable:(id)a3;
- (void)run;
- (void)run0WithId:(id)a3;
- (void)setContextClassLoaderWithJavaLangClassLoader:(id)a3;
- (void)setDaemonWithBoolean:(BOOL)a3;
- (void)setNameWithNSString:(id)a3;
- (void)setPriority0WithInt:(int)a3;
- (void)setPriorityWithInt:(int)a3;
- (void)setUncaughtExceptionHandlerWithJavaLangThread_UncaughtExceptionHandler:(id)a3;
- (void)start;
- (void)unpark;
- (void)yield0;
@end

@implementation JavaLangThread

- (JavaLangThread)init
{
  return self;
}

- (JavaLangThread)initWithJavaLangRunnable:(id)a3
{
  return self;
}

- (JavaLangThread)initWithJavaLangRunnable:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaLangThread)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4
{
  return self;
}

- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4 withNSString:(id)a5 withLong:(int64_t)a6
{
  return self;
}

- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4 withNSString:(id)a5
{
  return self;
}

- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaLangThread)initWithJavaLangThreadGroup:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  JreStrongAssignAndConsume(&self->vmThread_, objc_alloc((Class)NSObject));
  self->parkState_ = 1;
  JreStrongAssignAndConsume(&self->parkBlocker_, objc_alloc((Class)NSObject));
  v9 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)&self->interruptActions_, v9);
  sub_100286948((uint64_t)self, a3, 0, a4, 0, v5);
  return self;
}

- (void)createWithJavaLangThreadGroup:(id)a3 withJavaLangRunnable:(id)a4 withNSString:(id)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7
{
}

- (void)start
{
  id nsThread = self->nsThread_;
  if ([nsThread isExecuting])
  {
    v4 = [[JavaLangIllegalThreadStateException alloc] initWithNSString:@"This thread was already started!"];
    BOOL v5 = v4;
    objc_exception_throw(v4);
  }
  self->running_ = 1;
  [nsThread start];
}

- (void)run
{
  id v3 = [self->nsThread_ threadDictionary];
  v4 = (JavaLangThread *)[v3 objectForKey:off_10055F748[0]];
  if (v4) {
    BOOL v5 = v4 == self;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v6 = v4;
    [(JavaLangThread *)v6 run];
  }
}

- (void)run0WithId:(id)a3
{
  [(JavaLangThread *)self run];
  interruptActions = self->interruptActions_;
  if (!interruptActions) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)interruptActions clear];
  [self->nsThread_ cancel];
}

- (void)cancelNativeThread
{
}

- (BOOL)isDaemon
{
  return self->isDaemon_;
}

- (void)setDaemonWithBoolean:(BOOL)a3
{
  self->isDaemon_ = a3;
}

+ (int)enumerateWithJavaLangThreadArray:(id)a3
{
  return JavaLangThread_enumerateWithJavaLangThreadArray_((uint64_t)a3);
}

- (int64_t)getId
{
  id v2 = [self->nsThread_ threadDictionary];
  id v3 = [v2 objectForKey:off_10055F750[0]];
  return (int64_t)[v3 longLongValue];
}

- (id)getName
{
  return [self->nsThread_ name];
}

- (void)setNameWithNSString:(id)a3
{
  if (!a3)
  {
    v4 = objc_alloc_init(JavaLangNullPointerException);
    BOOL v5 = v4;
    objc_exception_throw(v4);
  }
  id nsThread = self->nsThread_;
  objc_msgSend(nsThread, "setName:");
}

- (int)getPriority
{
  [self->nsThread_ threadPriority];
  return (int)(v2 * 10.0);
}

- (void)setPriorityWithInt:(int)a3
{
  [(JavaLangThread *)self checkAccess];
  if ((a3 - 11) <= 0xFFFFFFF5)
  {
    v8 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Wrong Thread priority value");
    objc_exception_throw(v8);
  }
  id v5 = [(JavaLangThread *)self getThreadGroup];
  if (!v5) {
    JreThrowNullPointerException();
  }
  v6 = v5;
  if ((int)[v5 getMaxPriority] < a3) {
    a3 = [v6 getMaxPriority];
  }
  id nsThread = self->nsThread_;
  [nsThread setThreadPriority:(double)a3 / 10.0];
}

- (void)setPriority0WithInt:(int)a3
{
}

- (id)getState
{
  if (([self->nsThread_ isCancelled] & 1) != 0
    || [self->nsThread_ isFinished])
  {
    id v3 = &qword_100564AE8;
    if (atomic_load_explicit(JavaLangThread_StateEnum__initialized, memory_order_acquire)) {
      return (id)*v3;
    }
LABEL_9:
    objc_opt_class();
    return (id)*v3;
  }
  unsigned int v5 = [self->nsThread_ isExecuting];
  unsigned __int8 explicit = atomic_load_explicit(JavaLangThread_StateEnum__initialized, memory_order_acquire);
  if (v5) {
    id v3 = &qword_100564AC8;
  }
  else {
    id v3 = &JavaLangThread_StateEnum_values_;
  }
  if ((explicit & 1) == 0) {
    goto LABEL_9;
  }
  return (id)*v3;
}

- (id)getThreadGroup
{
  return objc_loadWeak((id *)&self->threadGroup_);
}

- (id)getStackTrace
{
  double v2 = [new_JavaLangThrowable_init() getStackTrace];
  if (!v2) {
LABEL_19:
  }
    JreThrowNullPointerException();
  id v3 = v2;
  int v4 = v2[2];
  if (v4 < 1)
  {
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    v7 = *(void **)&v3[2 * v5 + 6];
    if (!v7) {
      goto LABEL_19;
    }
    id v8 = [v7 getMethodName];
    if (!v8) {
      goto LABEL_19;
    }
    v9 = v8;
    if (![v8 contains:@"getStackTrace"]) {
      break;
    }
    uint64_t v6 = v5;
LABEL_9:
    if (++v5 >= v3[2]) {
      goto LABEL_13;
    }
  }
  if (([v9 contains:@"mainWithNSStringArray:"] & 1) == 0) {
    goto LABEL_9;
  }
  int v4 = v5;
LABEL_13:
  if (v4 - (int)v6 + 1 >= 0)
  {
    int v10 = v3[2];
    if (v4 + 1 <= v10) {
      uint64_t v11 = (v4 - v6 + 1);
    }
    else {
      uint64_t v11 = (v10 - v6);
    }
    v12 = +[IOSObjectArray arrayWithLength:(int)v11 type:JavaLangStackTraceElement_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v3, v6, v12, 0, v11);
    return v12;
  }
  return v3;
}

- (int)countStackFrames
{
  double v2 = [(JavaLangThread *)self getStackTrace];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[2];
}

- (void)interrupt
{
  id vmThread = self->vmThread_;
  objc_sync_enter(vmThread);
  interruptActions = self->interruptActions_;
  objc_sync_enter(interruptActions);
  uint64_t v5 = self->interruptActions_;
  if (!v5) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v6 = [(JavaUtilList *)v5 size] - 1;
  while ((v6 & 0x80000000) == 0)
  {
    id v7 = [(JavaUtilList *)self->interruptActions_ getWithInt:v6];
    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v6 = (v6 - 1);
    [v7 run];
  }
  objc_sync_exit(interruptActions);
  if (!self->interrupted_)
  {
    self->interrupted_ = 1;
    id blocker = self->blocker_;
    if (blocker)
    {
      objc_sync_enter(self->blocker_);
      [self->blocker_ notify];
      objc_sync_exit(blocker);
    }
  }
  objc_sync_exit(vmThread);
}

- (BOOL)isInterrupted
{
  return self->interrupted_;
}

- (void)joinWithLong:(int64_t)a3
{
  sub_1002873FC(self, a3, 0, v3, v4, v5, v6, v7);
}

- (void)joinWithLong:(int64_t)a3 withInt:(int)a4
{
  sub_1002873FC(self, a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (BOOL)isAlive
{
  id nsThread = self->nsThread_;
  if ([nsThread isExecuting] && !objc_msgSend(nsThread, "isCancelled"))
  {
    LOBYTE(Weak) = 1;
    return (char)Weak;
  }
  if (!self->running_) {
    goto LABEL_6;
  }
  self->running_ = 0;
  id Weak = objc_loadWeak((id *)&self->threadGroup_);
  if (Weak)
  {
    [objc_loadWeak((id *)&self->threadGroup_) removeWithJavaLangThread:self];
    id v5 = objc_loadWeak((id *)&self->threadGroup_);
    objc_storeWeak((id *)&self->threadGroup_, 0);
LABEL_6:
    LOBYTE(Weak) = 0;
  }
  return (char)Weak;
}

+ (void)sleepWithLong:(int64_t)a3
{
}

+ (void)sleepWithLong:(int64_t)a3 withInt:(int)a4
{
}

- (void)yield0
{
}

+ (BOOL)holdsLockWithId:(id)a3
{
  return JavaLangThread_holdsLockWithId_((unint64_t)a3);
}

- (id)getContextClassLoader
{
  id result = self->contextClassLoader_;
  if (!result) {
    return (id)JavaLangClassLoader_getSystemClassLoader();
  }
  return result;
}

- (void)setContextClassLoaderWithJavaLangClassLoader:(id)a3
{
}

- (NSString)description
{
  id v3 = [(JavaLangThread *)self getThreadGroup];
  [(JavaLangThread *)self getName];
  [(JavaLangThread *)self getPriority];
  if (!v3) {
    return (NSString *)JreStrcat("$$CI$", v4, v5, v6, v7, v8, v9, v10, @"Thread[");
  }
  [v3 getName];
  return (NSString *)JreStrcat("$$CIC$C", v11, v12, v13, v14, v15, v16, v17, @"Thread[");
}

- (void)unpark
{
  id vmThread = self->vmThread_;
  objc_sync_enter(vmThread);
  int parkState = self->parkState_;
  if (parkState != 2)
  {
    if (parkState == 1)
    {
      self->parkState_ = 2;
    }
    else
    {
      self->parkState_ = 1;
      if (!vmThread) {
        JreThrowNullPointerException();
      }
      [vmThread notifyAll];
    }
  }
  objc_sync_exit(vmThread);
}

- (void)parkForWithLong:(int64_t)a3
{
  id vmThread = self->vmThread_;
  objc_sync_enter(vmThread);
  int parkState = self->parkState_;
  if (parkState == 1)
  {
    self->parkState_ = 3;
    if (!vmThread) {
      JreThrowNullPointerException();
    }
    [vmThread waitWithLong:a3 / 1000000 withInt:(a3 % 1000000)];
    if (self->parkState_ == 3) {
      self->parkState_ = 1;
    }
  }
  else
  {
    if (parkState != 2)
    {
      uint64_t v7 = new_JavaLangAssertionError_initWithId_(@"shouldn't happen: attempt to repark");
      objc_exception_throw(v7);
    }
    self->parkState_ = 1;
  }
  objc_sync_exit(vmThread);
}

- (void)parkUntilWithLong:(int64_t)a3
{
  id vmThread = self->vmThread_;
  objc_sync_enter(vmThread);
  int64_t v6 = a3 - JavaLangSystem_currentTimeMillis();
  if (v6 <= 0) {
    self->parkState_ = 1;
  }
  else {
    [(JavaLangThread *)self parkForWithLong:1000000 * v6];
  }
  objc_sync_exit(vmThread);
}

+ (id)getDefaultUncaughtExceptionHandler
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangThread__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100562DF8;
}

+ (void)setDefaultUncaughtExceptionHandlerWithJavaLangThread_UncaughtExceptionHandler:(id)a3
{
}

- (id)getUncaughtExceptionHandler
{
  id v2 = [self->nsThread_ threadDictionary];
  id result = [v2 objectForKey:off_10055F758[0]];
  if (!result)
  {
    uint64_t v4 = (char *)[v2 objectForKey:off_10055F760];
    if (v4)
    {
      uint64_t v5 = (id *)(v4 + 72);
      return objc_loadWeak(v5);
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangThread__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      return (id)qword_100562DF8;
    }
  }
  return result;
}

- (void)setUncaughtExceptionHandlerWithJavaLangThread_UncaughtExceptionHandler:(id)a3
{
  id v4 = [self->nsThread_ threadDictionary];
  uint64_t v5 = off_10055F758[0];
  if (a3)
  {
    [v4 setObject:a3 forKey:v5];
  }
  else
  {
    int64_t v6 = off_10055F758[0];
    objc_msgSend(v4, "removeObjectForKey:", v6, v5);
  }
}

- (void)pushInterruptAction$WithJavaLangRunnable:(id)a3
{
  interruptActions = self->interruptActions_;
  objc_sync_enter(interruptActions);
  int64_t v6 = self->interruptActions_;
  if (!v6) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)v6 addWithId:a3];
  objc_sync_exit(interruptActions);
  if (a3 && [(JavaLangThread *)self isInterrupted])
  {
    [a3 run];
  }
}

- (void)popInterruptAction$WithJavaLangRunnable:(id)a3
{
  interruptActions = self->interruptActions_;
  objc_sync_enter(interruptActions);
  int64_t v6 = self->interruptActions_;
  if (!v6) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilList *)v6 removeWithInt:[(JavaUtilList *)v6 size] - 1] != a3)
  {
    CFStringRef v14 = JreStrcat("$@$@", v7, v8, v9, v10, v11, v12, v13, @"Expected ");
    uint64_t v15 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v14);
    objc_exception_throw(v15);
  }
  objc_sync_exit(interruptActions);
}

+ (id)getAllStackTraces
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangThread__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_emptyMap();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangThread;
  [(JavaLangThread *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangThread;
  [(JavaLangThread *)&v3 __javaClone];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100562DF8, [JavaLangThread_SystemUncaughtExceptionHandler alloc]);
    +[JavaLangThread initializeThreadClass]_0();
    atomic_store(1u, (unsigned __int8 *)&JavaLangThread__initialized);
  }
}

+ (id)__annotations_countStackFrames
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047EE28;
}

- (void).cxx_destruct
{
}

+ (JavaLangThread)initializeThreadClass
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangThread__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [+[NSThread currentThread] setName:@"main"];
  if (!qword_100562E00)
  {
    qword_100562E00 = objc_alloc_init(JavaLangThreadGroup);
    v0 = [JavaLangThreadGroup alloc];
    qword_100562E08 = [(JavaLangThreadGroup *)v0 initWithJavaLangThreadGroup:qword_100562E00 withNSString:@"main"];
    id v1 = (id)qword_100562E00;
    id v2 = (id)qword_100562E08;
  }
  objc_super v3 = [JavaLangThread alloc];
  uint64_t v4 = qword_100562E08;
  return [(JavaLangThread *)v3 initWithJavaLangThreadGroup:v4 withNSString:@"main" withBoolean:0];
}

+ (uint64_t)getNextThreadId
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaLangThread__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v0 = (void *)JavaLangThread_class_();
  objc_sync_enter(v0);
  uint64_t v1 = ++qword_10055F768;
  objc_sync_exit(v0);
  return v1;
}

@end