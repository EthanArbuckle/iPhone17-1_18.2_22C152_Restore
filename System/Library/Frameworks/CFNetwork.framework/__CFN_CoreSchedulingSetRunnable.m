@interface __CFN_CoreSchedulingSetRunnable
+ (void)_run:(id)a3;
- (void)__SITUATIONAL_ABORT__:(void *)a3 reason:;
- (void)dealloc;
@end

@implementation __CFN_CoreSchedulingSetRunnable

+ (void)_run:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  [MEMORY[0x1E4F29060] currentThread];
  if (a3)
  {
    context.version = 0;
    context.info = a3;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E4F1C220];
    context.equal = (Boolean (__cdecl *)(const void *, const void *))MEMORY[0x1E4F1C238];
    context.hash = (CFHashCode (__cdecl *)(const void *))MEMORY[0x1E4F1C240];
    context.schedule = 0;
    context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))_cancel;
    context.perform = (void (__cdecl *)(void *))_perform;
    *((void *)a3 + 6) = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &context);
    v5 = CFRunLoopGetCurrent();
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D418];
    CFRunLoopAddSource(v5, *((CFRunLoopSourceRef *)a3 + 6), (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    *((void *)a3 + 3) = pthread_self();
    if (!*((void *)a3 + 4))
    {
      if (Current)
      {
        *((void *)a3 + 4) = CFRetain(Current);
        v8 = (void (**)(void, void))*((void *)a3 + 2);
        if (v8)
        {
          *((void *)a3 + 2) = 0;
          ((void (**)(void, CFRunLoopRef))v8)[2](v8, Current);
          _Block_release(v8);
        }
        v9 = *((void *)a3 + 1);
        if (v9) {
          v9 = dispatch_semaphore_signal(v9);
        }
        *(void *)&long long v7 = 138413058;
        long long v12 = v7;
        *(void *)&long long v7 = 138412290;
        long long v11 = v7;
        while (1)
        {
          v10 = (void *)MEMORY[0x18531D6D0](v9);
          switch(CFRunLoopRunInMode(v6, 1.79769313e308, 1u))
          {
            case kCFRunLoopRunFinished:
              -[__CFN_CoreSchedulingSetRunnable __SITUATIONAL_ABORT__:reason:](a3, (uint64_t)"runloop went to finished", (void *)[NSString stringWithFormat:@"count = %ld/%ld/%ld/%ld/%ld, source %@", *((void *)a3 + 7), *((void *)a3 + 8), *((void *)a3 + 9), *((void *)a3 + 10), *((void *)a3 + 11), *((void *)a3 + 6), v11, v12]);
            case kCFRunLoopRunStopped:
              ++*((void *)a3 + 8);
              break;
            case kCFRunLoopRunTimedOut:
              ++*((void *)a3 + 9);
              break;
            case kCFRunLoopRunHandledSource:
              ++*((void *)a3 + 10);
              break;
            default:
              break;
          }
        }
      }
      __assert_rtn("-[__CFN_CoreSchedulingSetRunnable startedRunLoop:]", "CoreSchedulingSet.mm", 1257, "rl");
    }
    __assert_rtn("-[__CFN_CoreSchedulingSetRunnable startedRunLoop:]", "CoreSchedulingSet.mm", 1256, "_rl == NULL");
  }
}

- (void)dealloc
{
  sem = self->_sem;
  if (sem)
  {
    dispatch_release(sem);
    self->_sem = 0;
  }
  id setup = self->_setup;
  if (setup)
  {
    _Block_release(setup);
    self->_id setup = 0;
  }
  rl = self->_rl;
  if (rl)
  {
    CFRelease(rl);
    self->_rl = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)__CFN_CoreSchedulingSetRunnable;
  [(__CFN_CoreSchedulingSetRunnable *)&v6 dealloc];
}

- (void)__SITUATIONAL_ABORT__:(void *)a3 reason:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  objc_super v6 = values;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  uint64_t v7 = objc_opt_class();
  values[0] = (void *)_createWrappedStringWithFormat(@"%@ Failure: %s", v7, a2);
  values[1] = (id)[a1 description];
  if (a3)
  {
    *(void *)&long long v34 = a3;
    uint64_t v8 = 3;
  }
  else
  {
    uint64_t v8 = 2;
  }
  v9 = &values[v8];
  NSObject *v9 = (void *)_createWrappedStringWithFormat(@"rl = %@, performCount = %lld", a1[4], a1[5]);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  v9[1] = (void *)_createWrappedStringWithFormat(@"CFRunLoopGetCFRunLoopRef Current = %@", Current);
  uint64_t v11 = *MEMORY[0x1E4F1CB58];
  uint64_t v12 = pthread_mach_thread_np((pthread_t)*MEMORY[0x1E4F1CB58]);
  v9[2] = (void *)_createWrappedStringWithFormat(@"main queue = %p, main thread = %p, main mach thread = %u", MEMORY[0x1E4F14428], v11, v12);
  label = dispatch_queue_get_label(0);
  pthread_t v14 = pthread_self();
  v15 = pthread_self();
  uint64_t v16 = pthread_mach_thread_np(v15);
  CFStringRef WrappedStringWithFormat = _createWrappedStringWithFormat(@"this queue = %s, this thread = %p, this mach thread = %u", label, v14, v16);
  uint64_t v18 = v8 | 4;
  v9[3] = (void *)WrappedStringWithFormat;
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v20 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, v8 | 4, MEMORY[0x1E4F1D510]);
  do
  {
    v21 = *v6++;
    CFRelease(v21);
    --v18;
  }
  while (v18);
  CFStringRef v22 = CFStringCreateByCombiningStrings(v19, v20, @"\nCFNETWORK_ABORT: ");
  CFRelease(v20);
  CFIndex Length = CFStringGetLength(v22);
  CFIndex v24 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v25 = (char *)malloc_type_malloc(v24, 0x80528050uLL);
  CFStringGetCString(v22, v25, v24, 0x8000100u);
  CFRelease(v22);
  pthread_mutex_lock(&sMessagesLock);
  v26 = (void *)qword_1E8F7F578;
  if (qword_1E8F7F578)
  {
    *(void *)buf = 0;
    asprintf((char **)buf, "%s\n--\n%s--\n", (const char *)qword_1E8F7F578, v25);
    qword_1E8F7F578 = *(void *)buf;
    free(v26);
  }
  else
  {
    qword_1E8F7F578 = (uint64_t)strdup(v25);
  }
  pthread_mutex_unlock(&sMessagesLock);
  v27 = strchr(v25, 10);
  int v28 = (int)v27;
  if (!v27) {
    int v28 = v25 + strlen(v25);
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v29 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = v28 - v25;
    __int16 v31 = 2080;
    v32 = v25;
    _os_log_error_impl(&dword_184085000, v29, OS_LOG_TYPE_ERROR, "CoreSchedulingSet Error: %.*s", buf, 0x12u);
  }
  exit(1);
}

@end