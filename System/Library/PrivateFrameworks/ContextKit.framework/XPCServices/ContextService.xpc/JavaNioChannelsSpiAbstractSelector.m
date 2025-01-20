@interface JavaNioChannelsSpiAbstractSelector
+ (const)__metadata;
- (BOOL)isOpen;
- (JavaNioChannelsSpiAbstractSelector)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)cancelledKeys;
- (id)provider;
- (id)register__WithJavaNioChannelsSpiAbstractSelectableChannel:(id)a3 withInt:(int)a4 withId:(id)a5;
- (void)begin;
- (void)cancelWithJavaNioChannelsSelectionKey:(id)a3;
- (void)close;
- (void)dealloc;
- (void)deregisterWithJavaNioChannelsSpiAbstractSelectionKey:(id)a3;
- (void)end;
- (void)implCloseSelector;
@end

@implementation JavaNioChannelsSpiAbstractSelector

- (JavaNioChannelsSpiAbstractSelector)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (void)close
{
  isOpen = self->isOpen_;
  if (!isOpen) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilConcurrentAtomicAtomicBoolean *)isOpen getAndSetWithBoolean:0])
  {
    [(JavaNioChannelsSpiAbstractSelector *)self implCloseSelector];
  }
}

- (void)implCloseSelector
{
}

- (BOOL)isOpen
{
  isOpen = self->isOpen_;
  if (!isOpen) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicBoolean *)isOpen get];
}

- (id)provider
{
  return self->provider_;
}

- (id)cancelledKeys
{
  return self->cancelledKeysSet_;
}

- (id)register__WithJavaNioChannelsSpiAbstractSelectableChannel:(id)a3 withInt:(int)a4 withId:(id)a5
{
  return 0;
}

- (void)deregisterWithJavaNioChannelsSpiAbstractSelectionKey:(id)a3
{
  if (!a3 || (id v4 = [a3 channel], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [v4 deregisterWithJavaNioChannelsSelectionKey:a3];
  *((unsigned char *)a3 + 16) = 0;
}

- (void)begin
{
  v3 = JavaLangThread_currentThread();
  if (!v3) {
    JreThrowNullPointerException();
  }
  wakeupRunnable = self->wakeupRunnable_;
  [(JavaLangThread *)v3 pushInterruptAction$WithJavaLangRunnable:wakeupRunnable];
}

- (void)end
{
  v3 = JavaLangThread_currentThread();
  if (!v3) {
    JreThrowNullPointerException();
  }
  wakeupRunnable = self->wakeupRunnable_;
  [(JavaLangThread *)v3 popInterruptAction$WithJavaLangRunnable:wakeupRunnable];
}

- (void)cancelWithJavaNioChannelsSelectionKey:(id)a3
{
  cancelledKeysSet = self->cancelledKeysSet_;
  objc_sync_enter(cancelledKeysSet);
  v6 = self->cancelledKeysSet_;
  if (!v6) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)v6 addWithId:a3];
  objc_sync_exit(cancelledKeysSet);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSpiAbstractSelector;
  [(JavaNioChannelsSpiAbstractSelector *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100462978;
}

@end