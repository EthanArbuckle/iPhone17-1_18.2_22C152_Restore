@interface JavaLangRuntime
+ (const)__metadata;
+ (id)getRuntime;
+ (void)initialize;
- (BOOL)removeShutdownHookWithJavaLangThread:(id)a3;
- (JavaLangRuntime)init;
- (int)availableProcessors;
- (int64_t)freeMemory;
- (int64_t)maxMemory;
- (int64_t)totalMemory;
- (void)addShutdownHookWithJavaLangThread:(id)a3;
- (void)dealloc;
- (void)exitWithInt:(int)a3;
- (void)haltWithInt:(int)a3;
- (void)registerShutdownHooks;
- (void)runShutdownHooks;
@end

@implementation JavaLangRuntime

- (JavaLangRuntime)init
{
  return self;
}

+ (id)getRuntime
{
  if ((atomic_load_explicit(JavaLangRuntime__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100561250;
}

- (int)availableProcessors
{
  return [+[NSProcessInfo processInfo] processorCount];
}

- (void)exitWithInt:(int)a3
{
}

- (void)haltWithInt:(int)a3
{
}

- (int64_t)maxMemory
{
  v2 = +[NSProcessInfo processInfo];
  return [(NSProcessInfo *)v2 physicalMemory];
}

- (int64_t)totalMemory
{
  uint64_t v5 = 0;
  memset(task_info_out, 0, sizeof(task_info_out));
  mach_msg_type_number_t task_info_outCnt = 40;
  if (task_info(mach_task_self_, 0x12u, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  else {
    return *(void *)&task_info_out[3];
  }
}

- (int64_t)freeMemory
{
  mach_port_t v2 = mach_host_self();
  mach_msg_type_number_t host_info_outCnt = 15;
  vm_size_t v5 = 0;
  memset(v4, 0, 60);
  host_page_size(v2, &v5);
  host_statistics(v2, 2, (host_info_t)v4, &host_info_outCnt);
  return v5 * LODWORD(v4[0]);
}

- (void)addShutdownHookWithJavaLangThread:(id)a3
{
  if (!self->shutdownHooks_)
  {
    v7 = new_JavaLangIllegalStateException_initWithNSString_(@"shutdown in progress");
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_9;
  }
  if ([a3 isAlive])
  {
    CFStringRef v8 = @"hook already started";
LABEL_13:
    v7 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v8);
LABEL_14:
    objc_exception_throw(v7);
  }
  shutdownHooks = self->shutdownHooks_;
  if (!shutdownHooks) {
LABEL_9:
  }
    JreThrowNullPointerException();
  if ([(JavaUtilList *)shutdownHooks containsWithId:a3])
  {
    CFStringRef v8 = @"hook previously added";
    goto LABEL_13;
  }
  v6 = self->shutdownHooks_;
  [(JavaUtilList *)v6 addWithId:a3];
}

- (BOOL)removeShutdownHookWithJavaLangThread:(id)a3
{
  shutdownHooks = self->shutdownHooks_;
  if (!shutdownHooks) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)shutdownHooks removeWithId:a3];
}

- (void)runShutdownHooks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  p_shutdownHooks = &self->shutdownHooks_;
  shutdownHooks = self->shutdownHooks_;
  if (!shutdownHooks) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v4 = [(JavaUtilList *)self->shutdownHooks_ countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(shutdownHooks);
        }
        CFStringRef v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (!v8) {
          goto LABEL_11;
        }
        objc_msgSend(v8, "start", (void)v9);
      }
      id v5 = [(JavaUtilList *)shutdownHooks countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  JreStrongAssign((id *)p_shutdownHooks, 0);
}

- (void)registerShutdownHooks
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100257888;
  v2[3] = &unk_100407B30;
  v2[4] = self;
  atexit_b(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangRuntime;
  [(JavaLangRuntime *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    mach_port_t v2 = [JavaLangRuntime alloc];
    sub_100257334((uint64_t)v2);
    JreStrongAssignAndConsume((id *)&qword_100561250, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangRuntime__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100468018;
}

@end