@interface JavaNioSelectionKeyImpl
+ (const)__metadata;
- (BOOL)isConnected;
- (JavaNioSelectionKeyImpl)initWithJavaNioChannelsSpiAbstractSelectableChannel:(id)a3 withInt:(int)a4 withId:(id)a5 withJavaNioSelectorImpl:(id)a6;
- (id)channel;
- (id)checkValid;
- (id)interestOpsWithInt:(int)a3;
- (id)selector;
- (int)interestOps;
- (int)interestOpsNoCheck;
- (int)readyOps;
- (void)dealloc;
- (void)setReadyOpsWithInt:(int)a3;
@end

@implementation JavaNioSelectionKeyImpl

- (JavaNioSelectionKeyImpl)initWithJavaNioChannelsSpiAbstractSelectableChannel:(id)a3 withInt:(int)a4 withId:(id)a5 withJavaNioSelectorImpl:(id)a6
{
  return self;
}

- (id)channel
{
  return *(id *)(&self->super.isValid_ + 1);
}

- (int)interestOps
{
  -[JavaNioSelectionKeyImpl checkValid]_0(self);
  uint64_t v3 = *(void *)((char *)&self->interestOps_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  v4 = *(void **)(v3 + 40);
  objc_sync_enter(v4);
  int v5 = *(_DWORD *)((char *)&self->channel_ + 1);
  objc_sync_exit(v4);
  return v5;
}

- (id)checkValid
{
  id result = [a1 isValid];
  if ((result & 1) == 0)
  {
    v2 = new_JavaNioChannelsCancelledKeyException_init();
    objc_exception_throw(v2);
  }
  return result;
}

- (int)interestOpsNoCheck
{
  uint64_t v2 = *(void *)((char *)&self->interestOps_ + 1);
  if (!v2) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = self;
  v4 = *(void **)(v2 + 40);
  objc_sync_enter(v4);
  LODWORD(v3) = *(_DWORD *)((char *)&v3->channel_ + 1);
  objc_sync_exit(v4);
  return (int)v3;
}

- (id)interestOpsWithInt:(int)a3
{
  -[JavaNioSelectionKeyImpl checkValid]_0(self);
  id v5 = [(JavaNioSelectionKeyImpl *)self channel];
  if (!v5) {
    goto LABEL_5;
  }
  if ((a3 & ~[v5 validOps]) != 0)
  {
    v9 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v9);
  }
  uint64_t v6 = *(void *)((char *)&self->interestOps_ + 1);
  if (!v6) {
LABEL_5:
  }
    JreThrowNullPointerException();
  v7 = *(void **)(v6 + 40);
  objc_sync_enter(v7);
  *(_DWORD *)((char *)&self->channel_ + 1) = a3;
  objc_sync_exit(v7);
  return self;
}

- (int)readyOps
{
  return *(_DWORD *)((char *)&self->channel_ + 5);
}

- (id)selector
{
  return *(id *)((char *)&self->interestOps_ + 1);
}

- (void)setReadyOpsWithInt:(int)a3
{
  *(_DWORD *)((char *)&self->channel_ + 5) = *(_DWORD *)((unsigned char *)&self->channel_ + 1) & a3;
}

- (BOOL)isConnected
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  uint64_t v3 = *(void **)(&self->super.isValid_ + 1);
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v3 isConnected];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSelectionKeyImpl;
  [(JavaNioChannelsSelectionKey *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100481A60;
}

@end