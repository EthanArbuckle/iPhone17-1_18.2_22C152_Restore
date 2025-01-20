@interface AsynchronousSocketCloseMonitor
+ (void)initialize;
+ (void)signalBlockedThreads:(int)a3;
- (AsynchronousSocketCloseMonitor)initWithFileDescriptor:(int)a3;
- (void)dealloc;
@end

@implementation AsynchronousSocketCloseMonitor

- (AsynchronousSocketCloseMonitor)initWithFileDescriptor:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AsynchronousSocketCloseMonitor;
  v4 = [(AsynchronousSocketCloseMonitor *)&v8 init];
  if (v4)
  {
    pthread_mutex_lock(&stru_10055F868);
    pthread_t v5 = pthread_self();
    v4->mFd = a3;
    uint64_t v6 = qword_100562E90;
    v4->mPrev = 0;
    v4->mNext = (AsynchronousSocketCloseMonitor *)v6;
    v4->mThread = v5;
    if (v6) {
      *(void *)(v6 + 8) = v4;
    }
    qword_100562E90 = (uint64_t)v4;
    pthread_mutex_unlock(&stru_10055F868);
  }
  return v4;
}

- (void)dealloc
{
  pthread_mutex_lock(&stru_10055F868);
  mNext = self->mNext;
  if (mNext) {
    mNext->mPrev = self->mPrev;
  }
  mPrev = self->mPrev;
  if (mPrev) {
    p_mNext = (uint64_t *)&mPrev->mNext;
  }
  else {
    p_mNext = &qword_100562E90;
  }
  uint64_t *p_mNext = (uint64_t)self->mNext;
  pthread_mutex_unlock(&stru_10055F868);
  v6.receiver = self;
  v6.super_class = (Class)AsynchronousSocketCloseMonitor;
  [(AsynchronousSocketCloseMonitor *)&v6 dealloc];
}

+ (void)signalBlockedThreads:(int)a3
{
  pthread_mutex_lock(&stru_10055F868);
  for (uint64_t i = qword_100562E90; i; uint64_t i = *(void *)(i + 16))
  {
    if (*(_DWORD *)(i + 32) == a3) {
      pthread_kill(*(pthread_t *)(i + 24), 31);
    }
  }
  pthread_mutex_unlock(&stru_10055F868);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v4.__sigaction_u.__sa_handler = (void (__cdecl *)(int))nullsub_15;
    *(void *)&v4.sa_mask = 0;
    if (sigaction(31, &v4, 0) == -1)
    {
      v2 = __error();
      v3 = +[NSString stringWithFormat:@"setting blocked thread signal handler failed: %s", strerror(*v2)];
      JavaLangSystem_logEWithNSString_((uint64_t)v3);
    }
  }
}

@end