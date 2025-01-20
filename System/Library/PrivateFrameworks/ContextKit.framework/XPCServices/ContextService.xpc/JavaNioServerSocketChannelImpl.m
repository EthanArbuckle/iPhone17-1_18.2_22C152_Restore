@interface JavaNioServerSocketChannelImpl
+ (const)__metadata;
- (BOOL)shouldThrowSocketTimeoutExceptionFromAcceptWithJavaNetSocketTimeoutException:(id)a3;
- (JavaNioServerSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)accept;
- (id)bindWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
- (id)getFD;
- (id)getLocalAddress;
- (id)getOptionWithJavaNetSocketOption:(id)a3;
- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4;
- (id)socket;
- (id)supportedOptions;
- (void)dealloc;
- (void)implCloseSelectableChannel;
- (void)implConfigureBlockingWithBoolean:(BOOL)a3;
@end

@implementation JavaNioServerSocketChannelImpl

- (JavaNioServerSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (id)socket
{
  return *(id *)((char *)&self->super.super.blockingLock_ + 7);
}

- (id)bindWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    v9 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_11;
  }
  v7 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v7) {
    JreThrowNullPointerException();
  }
  if ([v7 isBound])
  {
    v9 = new_JavaNioChannelsAlreadyBoundException_init();
    goto LABEL_11;
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = new_JavaNioChannelsUnsupportedAddressTypeException_init();
LABEL_11:
      objc_exception_throw(v9);
    }
  }
  [*(id *)((char *)&self->super.super.blockingLock_ + 7) bindWithJavaNetSocketAddress:a3 withInt:v4];
  return self;
}

- (id)getLocalAddress
{
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    uint64_t v4 = new_JavaNioChannelsClosedChannelException_init();
    objc_exception_throw(v4);
  }
  v3 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 getLocalSocketAddress];
}

- (id)getOptionWithJavaNetSocketOption:(id)a3
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v5 = (void *)JavaNetStandardSocketOptions_SERVER_SOCKET_OPTIONS_;
  return JavaNioNioUtils_getSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_(self, v5, a3);
}

- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  JavaNioNioUtils_setSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_withId_(self, (void *)JavaNetStandardSocketOptions_SERVER_SOCKET_OPTIONS_, a3, (uint64_t)a4);
  return self;
}

- (id)supportedOptions
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaNetStandardSocketOptions_SERVER_SOCKET_OPTIONS_;
}

- (id)accept
{
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    v7 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_10;
  }
  v3 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  if (([v3 isBound] & 1) == 0)
  {
    v7 = new_JavaNioChannelsNotYetBoundException_init();
LABEL_10:
    objc_exception_throw(v7);
  }
  uint64_t v4 = new_JavaNioSocketChannelImpl_initWithJavaNioChannelsSpiSelectorProvider_withBoolean_((uint64_t)[(JavaNioChannelsSpiAbstractSelectableChannel *)self provider], 0);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
  v5 = *(JavaNioServerSocketChannelImpl_ServerSocketAdapter **)((char *)&self->socket_ + 7);
  objc_sync_enter(v5);
  [*(id *)((char *)&self->super.super.blockingLock_ + 7) implAcceptWithJavaNioSocketChannelImpl:v4];
  objc_sync_exit(v5);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:[(JavaNioSocketChannelImpl *)v4 isConnected]];
  if ([(JavaNioSocketChannelImpl *)v4 isConnected]) {
    return v4;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldThrowSocketTimeoutExceptionFromAcceptWithJavaNetSocketTimeoutException:(id)a3
{
  return sub_10016EA9C(self, a3);
}

- (void)implConfigureBlockingWithBoolean:(BOOL)a3
{
  v3 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  BOOL v4 = a3;
  id v5 = [v3 getFD$];
  LibcoreIoIoUtils_setBlockingWithJavaIoFileDescriptor_withBoolean_((uint64_t)v5, v4);
}

- (void)implCloseSelectableChannel
{
  objc_sync_enter(self);
  v3 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  if (([v3 isClosed] & 1) == 0) {
    [*(id *)((char *)&self->super.super.blockingLock_ + 7) close];
  }
  objc_sync_exit(self);
}

- (id)getFD
{
  v2 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getFD$];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioServerSocketChannelImpl;
  [(JavaNioChannelsSpiAbstractSelectableChannel *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100401718;
}

@end