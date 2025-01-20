@interface NSThread(MKAdditions)
+ (id)_mapkit_networkIOThread;
+ (void)_mapkit_runThread:()MKAdditions;
@end

@implementation NSThread(MKAdditions)

+ (id)_mapkit_networkIOThread
{
  pthread_once(&_initNetworkIOThread, (void (*)(void))initNetworkIOThread);
  v0 = (void *)qword_1EB315E98;

  return v0;
}

+ (void)_mapkit_runThread:()MKAdditions
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x18C139870]();
  v5 = [MEMORY[0x1E4F29060] currentThread];
  [v5 setName:v3];
  [MEMORY[0x1E4F29060] setThreadPriority:0.0];
  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  Current = CFRunLoopGetCurrent();
  memset(&v12, 0, sizeof(v12));
  v8 = CFRunLoopSourceCreate(0, 0, &v12);
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v8, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRelease(v8);
  if (v5 == (void *)qword_1EB315E98)
  {
    v10 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    objc_msgSend(MEMORY[0x1E4F1CAC0], "set_mapkit_networkIORunLoop:", v10);
    pthread_mutex_lock(&stru_1EB315F10);
    pthread_cond_signal(&stru_1EB315EE0);
    pthread_mutex_unlock(&stru_1EB315F10);
  }
  do
    [v6 timeIntervalSinceReferenceDate];
  while (CFRunLoopRunInMode(v9, v11, 0) != kCFRunLoopRunStopped);
}

@end