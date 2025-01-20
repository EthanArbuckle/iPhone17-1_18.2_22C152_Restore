@interface JavaNioSocketChannelImpl
+ (const)__metadata;
+ (id)validateAddressWithJavaNetSocketAddress:(id)a3;
- (BOOL)connectWithJavaNetSocketAddress:(id)a3;
- (BOOL)finishConnect;
- (BOOL)isConnected;
- (BOOL)isConnectionPending;
- (BOOL)isEINPROGRESSWithJavaIoIOException:(id)a3;
- (JavaNioSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (JavaNioSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3 withBoolean:(BOOL)a4;
- (JavaNioSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3 withJavaIoFileDescriptor:(id)a4;
- (id)bindWithJavaNetSocketAddress:(id)a3;
- (id)getFD;
- (id)getLocalAddress;
- (id)getOptionWithJavaNetSocketOption:(id)a3;
- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4;
- (id)socket;
- (id)supportedOptions;
- (int)readImplWithJavaNioByteBuffer:(id)a3;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int)writeImplWithJavaNioByteBuffer:(id)a3;
- (int)writeWithJavaNioByteBuffer:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (uint64_t)checkOpenConnected;
- (uint64_t)checkUnconnected;
- (void)dealloc;
- (void)implCloseSelectableChannel;
- (void)implConfigureBlockingWithBoolean:(BOOL)a3;
- (void)onAcceptWithJavaNetInetSocketAddress:(id)a3 withBoolean:(BOOL)a4;
- (void)onBindWithBoolean:(BOOL)a3;
- (void)onConnectStatusChangedWithJavaNetInetSocketAddress:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
@end

@implementation JavaNioSocketChannelImpl

- (JavaNioSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (JavaNioSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (JavaNioSocketChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3 withJavaIoFileDescriptor:(id)a4
{
  return self;
}

- (id)socket
{
  objc_sync_enter(self);
  v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (!v3)
  {
    v4 = *(JavaNioSocketChannelImpl_SocketAdapter **)((char *)&self->socket_ + 7);
    if (v4)
    {
      id v5 = [v4 getAddress];
      int v6 = [*(id *)((char *)&self->socket_ + 7) getPort];
    }
    else
    {
      int v6 = 0;
      id v5 = 0;
    }
    v7 = new_JavaNetPlainSocketImpl_initWithJavaIoFileDescriptor_withInt_withJavaNetInetAddress_withInt_(*(void **)((char *)&self->super.super.blockingLock_ + 7), *(_DWORD *)((char *)&self->localAddress_ + 7), v5, v6);
    v8 = [JavaNioSocketChannelImpl_SocketAdapter alloc];
    sub_1001F4D98((id *)&v8->super.super.isa, v7, (uint64_t)self);
    JreStrongAssignAndConsume((id *)((char *)&self->fd_ + 7), v8);
    v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  }
  objc_sync_exit(self);
  return v3;
}

- (id)bindWithJavaNetSocketAddress:(id)a3
{
  objc_sync_enter(self);
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    int v6 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_15;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->status_ + 3);
  if (v5)
  {
    int v6 = new_JavaNioChannelsAlreadyBoundException_init();
LABEL_15:
    objc_exception_throw(v6);
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v6 = new_JavaNioChannelsUnsupportedAddressTypeException_init();
      goto LABEL_15;
    }
  }
  else
  {
    if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    a3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_((void *)JavaNetInet4Address_ANY_, 0);
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  LibcoreIoIoBridge_bindWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_(*(uint64_t *)((char *)&self->super.super.blockingLock_ + 7), (JavaNetInet6Address *)[a3 getAddress], (uint64_t)objc_msgSend(a3, "getPort"));
  [(JavaNioSocketChannelImpl *)self onBindWithBoolean:1];
  objc_sync_exit(self);
  return self;
}

- (void)onBindWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  id v5 = [(id)LibcoreIoLibcore_os_ getsocknameWithJavaIoFileDescriptor:*(id *)((char *)&self->super.super.blockingLock_ + 7)];
  atomic_store(1u, (unsigned __int8 *)&self->status_ + 3);
  objc_opt_class();
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)((char *)&self->connectAddress_ + 7), [v5 getAddress]);
  id v6 = [v5 getPort];
  *(_DWORD *)((char *)&self->localAddress_ + 7) = v6;
  if (v3)
  {
    id v7 = v6;
    v8 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
    if (v8)
    {
      uint64_t v9 = *(uint64_t *)((char *)&self->connectAddress_ + 7);
      [v8 onBindWithJavaNetInetAddress:v9 withInt:v7];
    }
  }
}

- (id)getLocalAddress
{
  objc_sync_enter(self);
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    id v6 = new_JavaNioChannelsClosedChannelException_init();
    objc_exception_throw(v6);
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->status_ + 3);
  if (v3) {
    v4 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_(*(void **)((char *)&self->connectAddress_ + 7), *(_DWORD *)((char *)&self->localAddress_ + 7));
  }
  else {
    v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

- (id)getOptionWithJavaNetSocketOption:(id)a3
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v5 = (void *)JavaNetStandardSocketOptions_SOCKET_OPTIONS_;
  return JavaNioNioUtils_getSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_(self, v5, a3);
}

- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  JavaNioNioUtils_setSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_withId_(self, (void *)JavaNetStandardSocketOptions_SOCKET_OPTIONS_, a3, (uint64_t)a4);
  return self;
}

- (id)supportedOptions
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaNetStandardSocketOptions_SOCKET_OPTIONS_;
}

- (BOOL)isConnected
{
  objc_sync_enter(self);
  BOOL v3 = *(int *)((char *)&self->localPort_ + 3) == 2;
  objc_sync_exit(self);
  return v3;
}

- (BOOL)isConnectionPending
{
  objc_sync_enter(self);
  BOOL v3 = *(int *)((char *)&self->localPort_ + 3) == 1;
  objc_sync_exit(self);
  return v3;
}

- (BOOL)connectWithJavaNetSocketAddress:(id)a3
{
  -[JavaNioSocketChannelImpl checkUnconnected]_0((uint64_t)self);
  JavaNioSocketChannelImpl_validateAddressWithJavaNetSocketAddress_(a3);
  if (!a3 || (LocalHost = [a3 getAddress], id v6 = objc_msgSend(a3, "getPort"), !LocalHost)) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = (uint64_t)v6;
  if ([LocalHost isAnyLocalAddress]) {
    id LocalHost = (id)JavaNetInetAddress_getLocalHost();
  }
  unsigned int v8 = [(JavaNioChannelsSpiAbstractSelectableChannel *)self isBlocking];
  if (v8) {
    [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
  }
  LibcoreIoIoBridge_connectWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_(*(uint64_t *)((char *)&self->super.super.blockingLock_ + 7), (uint64_t)LocalHost, v7);
  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  if (v8) {
    -[JavaNioChannelsSpiAbstractInterruptibleChannel endWithBoolean:](self, "endWithBoolean:");
  }
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->status_ + 3);
  if ((v10 & 1) == 0) {
    [(JavaNioSocketChannelImpl *)self onBindWithBoolean:1];
  }
  [(JavaNioSocketChannelImpl *)self onConnectStatusChangedWithJavaNetInetSocketAddress:a3 withInt:v9 withBoolean:1];
  return *(int *)((char *)&self->localPort_ + 3) == 2;
}

- (uint64_t)checkUnconnected
{
  objc_sync_enter((id)a1);
  if (([(id)a1 isOpen] & 1) == 0)
  {
    v4 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_10;
  }
  int v2 = *(_DWORD *)(a1 + 91);
  if (v2 == 1)
  {
    v4 = new_JavaNioChannelsConnectionPendingException_init();
    goto LABEL_10;
  }
  if (v2 == 2)
  {
    v4 = new_JavaNioChannelsAlreadyConnectedException_init();
LABEL_10:
    objc_exception_throw(v4);
  }
  return objc_sync_exit((id)a1);
}

- (void)onConnectStatusChangedWithJavaNetInetSocketAddress:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  *(int *)((char *)&self->localPort_ + 3) = a4;
  unsigned int v8 = (id *)((char *)&self->socket_ + 7);
  JreStrongAssign((id *)((char *)&self->socket_ + 7), a3);
  if (a4 == 2 && v5)
  {
    uint64_t v9 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
    if (v9)
    {
      if (!*v8) {
        JreThrowNullPointerException();
      }
      id v10 = [*v8 getAddress];
      id v11 = [*v8 getPort];
      [v9 onConnectWithJavaNetInetAddress:v10 withInt:v11];
    }
  }
}

- (BOOL)isEINPROGRESSWithJavaIoIOException:(id)a3
{
  return sub_1001F4004(self, a3);
}

- (BOOL)finishConnect
{
  objc_sync_enter(self);
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    uint64_t v9 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_16;
  }
  int v3 = *(int *)((char *)&self->localPort_ + 3);
  if ((v3 - 1) >= 2)
  {
    uint64_t v9 = new_JavaNioChannelsNoConnectionPendingException_init();
LABEL_16:
    objc_exception_throw(v9);
  }
  objc_sync_exit(self);
  if (v3 == 2)
  {
    LOBYTE(isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt) = 1;
  }
  else
  {
    [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
    BOOL v5 = *(JavaNioSocketChannelImpl_SocketAdapter **)((char *)&self->socket_ + 7);
    if (!v5) {
      JreThrowNullPointerException();
    }
    uint64_t isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt = LibcoreIoIoBridge_isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt_(*(void **)((char *)&self->super.super.blockingLock_ + 7), (uint64_t)[v5 getAddress], (uint64_t)objc_msgSend(*(id *)((char *)&self->socket_ + 7), "getPort"), 0, 0);
    [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt];
    objc_sync_enter(self);
    if (isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt)
    {
      *(int *)((char *)&self->localPort_ + 3) = 2;
      id v6 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
      if (v6)
      {
        uint64_t v7 = *(JavaNioSocketChannelImpl_SocketAdapter **)((char *)&self->socket_ + 7);
        if (!v7) {
          JreThrowNullPointerException();
        }
        objc_msgSend(v6, "onConnectWithJavaNetInetAddress:withInt:", objc_msgSend(v7, "getAddress"), objc_msgSend(*(id *)((char *)&self->socket_ + 7), "getPort"));
      }
    }
    objc_sync_exit(self);
  }
  return isConnectedWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_withInt_withInt;
}

- (int)readWithJavaNioByteBuffer:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 checkWritable];
  -[JavaNioSocketChannelImpl checkOpenConnected]_0(self);
  int result = [a3 hasRemaining];
  if (result)
  {
    return sub_1001F446C((uint64_t)self, a3);
  }
  return result;
}

- (uint64_t)checkOpenConnected
{
  objc_sync_enter(a1);
  if (([a1 isOpen] & 1) == 0)
  {
    int v3 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_8;
  }
  if (([a1 isConnected] & 1) == 0)
  {
    int v3 = new_JavaNioChannelsNotYetConnectedException_init();
LABEL_8:
    objc_exception_throw(v3);
  }
  return objc_sync_exit(a1);
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_18;
  }
  int v6 = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaNioSocketChannelImpl checkOpenConnected]_0(self);
  int v9 = JavaNioFileChannelImpl_calculateTotalRemainingWithJavaNioByteBufferArray_withInt_withInt_withBoolean_((uint64_t)a3, v6, a5, 1);
  if (!v9) {
    return 0;
  }
  id v10 = +[IOSByteArray arrayWithLength:v9];
  id v11 = JavaNioByteBuffer_wrapWithByteArray_(v10);
  int v12 = sub_1001F446C((uint64_t)self, v11);
  if (!v11) {
    goto LABEL_18;
  }
  int v13 = v12;
  [(JavaNioBuffer *)v11 flip];
  if (v13 >= 1)
  {
    int v14 = v13;
    while (1)
    {
      uint64_t v15 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v6);
      }
      v16 = (void *)*((void *)a3 + v6 + 3);
      if (!v16) {
        break;
      }
      uint64_t v17 = JavaLangMath_minWithInt_withInt_((uint64_t)[v16 remaining], v14);
      uint64_t v18 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v18) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v6);
      }
      v19 = (void *)*((void *)a3 + v6 + 3);
      if (!v19) {
        break;
      }
      [v19 putWithByteArray:v10 withInt:(v13 - v14) withInt:v17];
      ++v6;
      v14 -= v17;
      if (v14 <= 0) {
        return v13;
      }
    }
LABEL_18:
    JreThrowNullPointerException();
  }
  return v13;
}

- (int)readImplWithJavaNioByteBuffer:(id)a3
{
  return sub_1001F446C((uint64_t)self, a3);
}

- (int)writeWithJavaNioByteBuffer:(id)a3
{
  if (!a3)
  {
    int v6 = new_JavaLangNullPointerException_initWithNSString_(@"src == null");
    objc_exception_throw(v6);
  }
  -[JavaNioSocketChannelImpl checkOpenConnected]_0(self);
  int result = [a3 hasRemaining];
  if (result)
  {
    return sub_1001F479C((uint64_t)self, a3);
  }
  return result;
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_23;
  }
  int v6 = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaNioSocketChannelImpl checkOpenConnected]_0(self);
  unsigned int v9 = JavaNioFileChannelImpl_calculateTotalRemainingWithJavaNioByteBufferArray_withInt_withInt_withBoolean_((uint64_t)a3, v6, a5, 0);
  if (!v9) {
    return 0;
  }
  uint64_t v17 = JavaNioByteBuffer_allocateWithInt_(v9, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = v17;
  int v19 = a5 + v6;
  if (a5 + v6 > v6)
  {
    uint64_t v20 = v6;
    uint64_t v21 = v19;
    while (1)
    {
      uint64_t v22 = *((unsigned int *)a3 + 2);
      if (v20 < 0 || v20 >= (int)v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v20);
      }
      v23 = (void *)*((void *)a3 + v20 + 3);
      if (!v23) {
        break;
      }
      id v24 = [*((id *)a3 + v20 + 3) position];
      if (!v18) {
        break;
      }
      id v25 = v24;
      [(JavaNioByteBuffer *)v18 putWithJavaNioByteBuffer:v23];
      [v23 positionWithInt:v25];
      if (v21 == ++v20) {
        goto LABEL_14;
      }
    }
LABEL_23:
    JreThrowNullPointerException();
  }
  if (!v17) {
    goto LABEL_23;
  }
LABEL_14:
  [(JavaNioBuffer *)v18 flip];
  id v27 = sub_1001F479C((uint64_t)self, v18);
  int v28 = (int)v27;
  if ((int)v27 >= 1)
  {
    uint64_t v29 = (uint64_t)v27;
    while (1)
    {
      uint64_t v30 = v6;
      uint64_t v31 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v31) {
        IOSArray_throwOutOfBoundsWithMsg(v31, v6);
      }
      v32 = (void *)*((void *)a3 + v6 + 3);
      if (!v32) {
        break;
      }
      int v33 = JavaLangMath_minWithInt_withInt_(v29, (int)[*((id *)a3 + v30 + 3) remaining]);
      objc_msgSend(v32, "positionWithInt:", objc_msgSend(v32, "position") + v33);
      int v6 = v30 + 1;
      uint64_t v29 = (v29 - v33);
      if ((int)v29 <= 0) {
        return v28;
      }
    }
    goto LABEL_23;
  }
  return v28;
}

- (int)writeImplWithJavaNioByteBuffer:(id)a3
{
  return sub_1001F479C((uint64_t)self, a3);
}

+ (id)validateAddressWithJavaNetSocketAddress:(id)a3
{
  return JavaNioSocketChannelImpl_validateAddressWithJavaNetSocketAddress_(a3);
}

- (void)implCloseSelectableChannel
{
  objc_sync_enter(self);
  if (*(int *)((char *)&self->localPort_ + 3) != 3)
  {
    *(int *)((char *)&self->localPort_ + 3) = 3;
    LibcoreIoIoBridge_closeSocketWithJavaIoFileDescriptor_(*(void **)((char *)&self->super.super.blockingLock_ + 7));
    int v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
    if (v3)
    {
      if (([v3 isClosed] & 1) == 0) {
        [*(id *)((char *)&self->fd_ + 7) onClose];
      }
    }
  }
  objc_sync_exit(self);
}

- (void)implConfigureBlockingWithBoolean:(BOOL)a3
{
}

- (id)getFD
{
  return *(id *)((char *)&self->super.super.blockingLock_ + 7);
}

- (void)onAcceptWithJavaNetInetSocketAddress:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  [(JavaNioSocketChannelImpl *)self onBindWithBoolean:a4];
  [(JavaNioSocketChannelImpl *)self onConnectStatusChangedWithJavaNetInetSocketAddress:a3 withInt:2 withBoolean:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSocketChannelImpl;
  [(JavaNioChannelsSpiAbstractSelectableChannel *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043AE78;
}

@end