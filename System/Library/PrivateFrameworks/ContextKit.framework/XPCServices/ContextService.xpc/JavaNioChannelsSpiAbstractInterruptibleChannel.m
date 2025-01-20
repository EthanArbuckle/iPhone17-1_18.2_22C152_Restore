@interface JavaNioChannelsSpiAbstractInterruptibleChannel
+ (const)__metadata;
- (BOOL)isOpen;
- (JavaNioChannelsSpiAbstractInterruptibleChannel)init;
- (void)begin;
- (void)dealloc;
- (void)endWithBoolean:(BOOL)a3;
- (void)implCloseChannel;
@end

@implementation JavaNioChannelsSpiAbstractInterruptibleChannel

- (JavaNioChannelsSpiAbstractInterruptibleChannel)init
{
  return self;
}

- (BOOL)isOpen
{
  objc_sync_enter(self);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->closed_);
  BOOL v4 = (v3 & 1) == 0;
  objc_sync_exit(self);
  return v4;
}

- (void)begin
{
  unsigned __int8 v3 = JavaLangThread_currentThread();
  if (!v3) {
    JreThrowNullPointerException();
  }
  interruptAndCloseRunnable = self->interruptAndCloseRunnable_;
  [(JavaLangThread *)v3 pushInterruptAction$WithJavaLangRunnable:interruptAndCloseRunnable];
}

- (void)endWithBoolean:(BOOL)a3
{
  v5 = JavaLangThread_currentThread();
  if (!v5) {
    JreThrowNullPointerException();
  }
  [(JavaLangThread *)v5 popInterruptAction$WithJavaLangRunnable:self->interruptAndCloseRunnable_];
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->interrupted_);
  if (v6)
  {
    atomic_store(0, (unsigned __int8 *)&self->interrupted_);
    v8 = new_JavaNioChannelsClosedByInterruptException_init();
    goto LABEL_9;
  }
  if (!a3)
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->closed_);
    if (v7)
    {
      v8 = (JavaNioChannelsClosedByInterruptException *)new_JavaNioChannelsAsynchronousCloseException_init();
LABEL_9:
      objc_exception_throw(v8);
    }
  }
}

- (void)implCloseChannel
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSpiAbstractInterruptibleChannel;
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004676A8;
}

@end