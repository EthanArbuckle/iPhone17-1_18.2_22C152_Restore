@interface JavaNioDatagramChannelImpl
+ (const)__metadata;
- (BOOL)isConnected;
- (JavaNioDatagramChannelImpl)init;
- (JavaNioDatagramChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)bindWithJavaNetSocketAddress:(id)a3;
- (id)checkOpen;
- (id)checkOpenConnected;
- (id)connectWithJavaNetSocketAddress:(id)a3;
- (id)disconnect;
- (id)getFD;
- (id)getLocalAddress;
- (id)getOptionWithJavaNetSocketOption:(id)a3;
- (id)receiveDirectImplWithJavaNioByteBuffer:(id)a3 withBoolean:(BOOL)a4;
- (id)receiveImplWithJavaNioByteBuffer:(id)a3 withBoolean:(BOOL)a4;
- (id)receiveWithJavaNioByteBuffer:(id)a3;
- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4;
- (id)socket;
- (id)supportedOptions;
- (int)readImplWithJavaNioByteBuffer:(id)a3;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int)sendWithJavaNioByteBuffer:(id)a3 withJavaNetSocketAddress:(id)a4;
- (int)writeImplWithJavaNioByteBuffer:(id)a3;
- (int)writeWithJavaNioByteBuffer:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)checkNotNullWithJavaNioByteBuffer:(id)a3;
- (void)dealloc;
- (void)implCloseSelectableChannel;
- (void)implConfigureBlockingWithBoolean:(BOOL)a3;
- (void)onBindWithBoolean:(BOOL)a3;
- (void)onConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (void)onDisconnectWithBoolean:(BOOL)a3;
@end

@implementation JavaNioDatagramChannelImpl

- (JavaNioDatagramChannelImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (JavaNioDatagramChannelImpl)init
{
  uint64_t v3 = JavaNioChannelsSpiSelectorProvider_provider();
  JavaNioChannelsDatagramChannel_initWithJavaNioChannelsSpiSelectorProvider_(self, v3);
  HIBYTE(self->localAddress_) = 0;
  self->connected_ = 0;
  JreStrongAssignAndConsume((id *)((char *)&self->localPort_ + 7), objc_alloc((Class)NSObject));
  JreStrongAssignAndConsume((id *)((char *)&self->readLock_ + 7), objc_alloc((Class)NSObject));
  v4 = new_JavaIoFileDescriptor_init();
  JreStrongAssignAndConsume((id *)(&self->isBound_ + 6), v4);
  v5 = new_JavaNetInetSocketAddress_initWithInt_(0);
  JreStrongAssignAndConsume((id *)((char *)&self->super.super.blockingLock_ + 7), v5);
  return self;
}

- (id)socket
{
  objc_sync_enter(self);
  uint64_t v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (!v3)
  {
    v4 = new_JavaNetPlainDatagramSocketImpl_initWithJavaIoFileDescriptor_withInt_(*(void **)(&self->isBound_ + 6), *(_DWORD *)((char *)&self->socket_ + 7));
    v5 = [JavaNioDatagramChannelImpl_DatagramSocketAdapter alloc];
    sub_10017BD70((id *)&v5->super.super.isa, v4, (uint64_t)self);
    JreStrongAssignAndConsume((id *)((char *)&self->fd_ + 7), v5);
    uint64_t v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  }
  objc_sync_exit(self);
  return v3;
}

- (id)bindWithJavaNetSocketAddress:(id)a3
{
  objc_sync_enter(self);
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (self->connected_)
  {
    v5 = new_JavaNioChannelsAlreadyBoundException_init();
LABEL_13:
    objc_exception_throw(v5);
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = new_JavaNioChannelsUnsupportedAddressTypeException_init();
      goto LABEL_13;
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
  LibcoreIoIoBridge_bindWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_(*(void *)(&self->isBound_ + 6), (JavaNetInet6Address *)[a3 getAddress], (uint64_t)objc_msgSend(a3, "getPort"));
  [(JavaNioDatagramChannelImpl *)self onBindWithBoolean:1];
  objc_sync_exit(self);
  return self;
}

- (id)checkOpen
{
  id result = [a1 isOpen];
  if ((result & 1) == 0)
  {
    v2 = new_JavaNioChannelsClosedChannelException_init();
    objc_exception_throw(v2);
  }
  return result;
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
  id v5 = [(id)LibcoreIoLibcore_os_ getsocknameWithJavaIoFileDescriptor:*(void *)(&self->isBound_ + 6)];
  self->connected_ = 1;
  objc_opt_class();
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)((char *)&self->connectAddress_ + 7), [v5 getAddress]);
  id v6 = [v5 getPort];
  *(_DWORD *)((char *)&self->socket_ + 7) = v6;
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
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (self->connected_) {
    BOOL v3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_(*(void **)((char *)&self->connectAddress_ + 7), *(_DWORD *)((char *)&self->socket_ + 7));
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(self);
  return v3;
}

- (id)getOptionWithJavaNetSocketOption:(id)a3
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v5 = (void *)JavaNetStandardSocketOptions_DATAGRAM_SOCKET_OPTIONS_;
  return JavaNioNioUtils_getSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_(self, v5, a3);
}

- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  JavaNioNioUtils_setSocketOptionWithJavaNioFileDescriptorChannel_withJavaUtilSet_withJavaNetSocketOption_withId_(self, (void *)JavaNetStandardSocketOptions_DATAGRAM_SOCKET_OPTIONS_, a3, (uint64_t)a4);
  return self;
}

- (id)supportedOptions
{
  if ((atomic_load_explicit(JavaNetStandardSocketOptions__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaNetStandardSocketOptions_DATAGRAM_SOCKET_OPTIONS_;
}

- (BOOL)isConnected
{
  objc_sync_enter(self);
  char localAddress_high = HIBYTE(self->localAddress_);
  objc_sync_exit(self);
  return localAddress_high;
}

- (id)connectWithJavaNetSocketAddress:(id)a3
{
  objc_sync_enter(self);
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (HIBYTE(self->localAddress_))
  {
    v10 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v10);
  }
  id v5 = JavaNioSocketChannelImpl_validateAddressWithJavaNetSocketAddress_(a3);
  id v6 = v5;
  if (!v5) {
    JreThrowNullPointerException();
  }
  id v7 = [v5 getAddress];
  id v8 = [v6 getPort];
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
  LibcoreIoIoBridge_connectWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_(*(void *)(&self->isBound_ + 6), (uint64_t)v7, (uint64_t)v8);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:1];
  if (!self->connected_) {
    [(JavaNioDatagramChannelImpl *)self onBindWithBoolean:1];
  }
  [(JavaNioDatagramChannelImpl *)self onConnectWithJavaNetInetAddress:v7 withInt:v8 withBoolean:1];
  objc_sync_exit(self);
  return self;
}

- (void)onConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  HIBYTE(self->localAddress_) = 1;
  uint64_t v9 = (id *)((char *)&self->super.super.blockingLock_ + 7);
  v10 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_(a3, a4);
  JreStrongAssignAndConsume(v9, v10);
  if (v5)
  {
    v11 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
    if (v11)
    {
      [v11 onConnectWithJavaNetInetAddress:a3 withInt:v6];
    }
  }
}

- (id)disconnect
{
  objc_sync_enter(self);
  if ([(JavaNioDatagramChannelImpl *)self isConnected]
    && [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    [(JavaNioDatagramChannelImpl *)self onDisconnectWithBoolean:1];
    if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    BOOL v3 = (void *)LibcoreIoLibcore_os_;
    if (!LibcoreIoLibcore_os_) {
      JreThrowNullPointerException();
    }
    uint64_t v4 = *(void *)(&self->isBound_ + 6);
    if ((atomic_load_explicit(JavaNetInetAddress__initialized, memory_order_acquire) & 1) == 0)
    {
      uint64_t v6 = v4;
      id v7 = v3;
      objc_opt_class();
      uint64_t v4 = v6;
      BOOL v3 = v7;
    }
    objc_msgSend(v3, "connectWithJavaIoFileDescriptor:withJavaNetInetAddress:withInt:", v4, JavaNetInetAddress_UNSPECIFIED_, 0, v6, v7);
  }
  objc_sync_exit(self);
  return self;
}

- (void)onDisconnectWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  HIBYTE(self->localAddress_) = 0;
  JreStrongAssign((id *)((char *)&self->super.super.blockingLock_ + 7), 0);
  if (v3)
  {
    BOOL v5 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
    if (v5)
    {
      if ([v5 isConnected])
      {
        uint64_t v6 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
        [v6 onDisconnect];
      }
    }
  }
}

- (id)receiveWithJavaNioByteBuffer:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 checkWritable];
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  if (!self->connected_) {
    return 0;
  }
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
  BOOL v5 = *(void **)((char *)&self->localPort_ + 7);
  objc_sync_enter(v5);
  char v6 = [(JavaNioChannelsSpiAbstractSelectableChannel *)self isBlocking];
  if ([a3 isDirect]) {
    id v7 = sub_10017B15C((uint64_t)self, a3, v6);
  }
  else {
    id v7 = sub_10017AF90((uint64_t)self, a3, v6);
  }
  id v8 = v7;
  objc_sync_exit(v5);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:v8 != 0];
  return v8;
}

- (id)receiveImplWithJavaNioByteBuffer:(id)a3 withBoolean:(BOOL)a4
{
  return sub_10017AF90((uint64_t)self, a3, a4);
}

- (id)receiveDirectImplWithJavaNioByteBuffer:(id)a3 withBoolean:(BOOL)a4
{
  return sub_10017B15C((uint64_t)self, a3, a4);
}

- (int)sendWithJavaNioByteBuffer:(id)a3 withJavaNetSocketAddress:(id)a4
{
  sub_10017B4A4((uint64_t)a3);
  -[JavaNioDatagramChannelImpl checkOpen]_0(self);
  objc_opt_class();
  if (!a4) {
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (![a4 getAddress])
  {
    v20 = new_JavaIoIOException_init();
    goto LABEL_18;
  }
  if (![(JavaNioDatagramChannelImpl *)self isConnected]) {
    goto LABEL_7;
  }
  id v7 = *(id *)((char *)&self->super.super.blockingLock_ + 7);
  if (!v7) {
LABEL_15:
  }
    JreThrowNullPointerException();
  if (([v7 isEqual:a4] & 1) == 0)
  {
    CFStringRef v21 = JreStrcat("$@$@", v8, v9, v10, v11, v12, v13, v14, @"Connected to ");
    v20 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v21);
LABEL_18:
    objc_exception_throw(v20);
  }
LABEL_7:
  v15 = *(id *)((char *)&self->readLock_ + 7);
  objc_sync_enter(v15);
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self begin];
  if (!a3) {
    JreThrowNullPointerException();
  }
  unsigned int v16 = [a3 position];
  int v17 = LibcoreIoIoBridge_sendtoWithJavaIoFileDescriptor_withJavaNioByteBuffer_withInt_withJavaNetInetAddress_withInt_(*(void *)(&self->isBound_ + 6), a3, 0, (uint64_t)[a4 getAddress], (uint64_t)objc_msgSend(a4, "getPort"));
  int v18 = v17;
  if (v17 >= 1) {
    [a3 positionWithInt:v17 + v16];
  }
  if (!self->connected_) {
    [(JavaNioDatagramChannelImpl *)self onBindWithBoolean:1];
  }
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self endWithBoolean:v18 >= 0];
  objc_sync_exit(v15);
  return v18;
}

- (int)readWithJavaNioByteBuffer:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 checkWritable];
  -[JavaNioDatagramChannelImpl checkOpenConnected]_0(self);
  if ([a3 hasRemaining])
  {
    if (([a3 isDirect] & 1) != 0 || objc_msgSend(a3, "hasArray"))
    {
      LODWORD(self) = sub_10017B5FC((uint64_t)self, (uint64_t)a3);
      if ((int)self >= 1) {
        objc_msgSend(a3, "positionWithInt:", objc_msgSend(a3, "position") + self);
      }
    }
    else
    {
      char v6 = +[IOSByteArray arrayWithLength:](IOSByteArray, "arrayWithLength:", (int)[a3 remaining]);
      id v7 = JavaNioByteBuffer_wrapWithByteArray_(v6);
      self = (JavaNioDatagramChannelImpl *)sub_10017B5FC((uint64_t)self, (uint64_t)v7);
      if ((int)self >= 1) {
        [a3 putWithByteArray:v6 withInt:0 withInt:self];
      }
    }
  }
  else
  {
    LODWORD(self) = 0;
  }
  return (int)self;
}

- (id)checkOpenConnected
{
  -[JavaNioDatagramChannelImpl checkOpen]_0(a1);
  id result = [a1 isConnected];
  if ((result & 1) == 0)
  {
    BOOL v3 = new_JavaNioChannelsNotYetConnectedException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_18;
  }
  int v6 = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaNioDatagramChannelImpl checkOpenConnected]_0(self);
  unsigned int v9 = JavaNioFileChannelImpl_calculateTotalRemainingWithJavaNioByteBufferArray_withInt_withInt_withBoolean_((uint64_t)a3, v6, a5, 1);
  if (!v9) {
    return 0;
  }
  int v17 = JavaNioByteBuffer_allocateWithInt_(v9, v10, v11, v12, v13, v14, v15, v16);
  int v18 = sub_10017B5FC((uint64_t)self, (uint64_t)v17);
  if (!v17) {
    goto LABEL_18;
  }
  int v19 = v18;
  id v20 = [(JavaNioByteBuffer *)v17 array];
  if (v19 >= 1)
  {
    id v21 = v20;
    int v22 = v19;
    while (1)
    {
      uint64_t v23 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v23) {
        IOSArray_throwOutOfBoundsWithMsg(v23, v6);
      }
      v24 = (void *)*((void *)a3 + v6 + 3);
      if (!v24) {
        break;
      }
      uint64_t v25 = JavaLangMath_minWithInt_withInt_((uint64_t)[v24 remaining], v22);
      uint64_t v26 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v26) {
        IOSArray_throwOutOfBoundsWithMsg(v26, v6);
      }
      v27 = (void *)*((void *)a3 + v6 + 3);
      if (!v27) {
        break;
      }
      [v27 putWithByteArray:v21 withInt:(v19 - v22) withInt:v25];
      ++v6;
      v22 -= v25;
      if (v22 <= 0) {
        return v19;
      }
    }
LABEL_18:
    JreThrowNullPointerException();
  }
  return v19;
}

- (int)readImplWithJavaNioByteBuffer:(id)a3
{
  return sub_10017B5FC((uint64_t)self, (uint64_t)a3);
}

- (int)writeWithJavaNioByteBuffer:(id)a3
{
  sub_10017B4A4((uint64_t)a3);
  -[JavaNioDatagramChannelImpl checkOpenConnected]_0(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (![a3 hasRemaining]) {
    return 0;
  }
  int v5 = sub_10017B8EC((uint64_t)self, a3);
  if (v5 >= 1) {
    objc_msgSend(a3, "positionWithInt:", objc_msgSend(a3, "position") + v5);
  }
  return v5;
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_23;
  }
  int v6 = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaNioDatagramChannelImpl checkOpenConnected]_0(self);
  unsigned int v9 = JavaNioFileChannelImpl_calculateTotalRemainingWithJavaNioByteBufferArray_withInt_withInt_withBoolean_((uint64_t)a3, v6, a5, 0);
  if (!v9) {
    return 0;
  }
  int v17 = JavaNioByteBuffer_allocateWithInt_(v9, v10, v11, v12, v13, v14, v15, v16);
  int v18 = v17;
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
      uint64_t v23 = (void *)*((void *)a3 + v20 + 3);
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
  id v27 = sub_10017B8EC((uint64_t)self, v18);
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
  return sub_10017B8EC((uint64_t)self, a3);
}

- (void)implCloseSelectableChannel
{
  objc_sync_enter(self);
  [(JavaNioDatagramChannelImpl *)self onDisconnectWithBoolean:1];
  LibcoreIoIoBridge_closeSocketWithJavaIoFileDescriptor_(*(void **)(&self->isBound_ + 6));
  BOOL v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (v3 && ([v3 isClosed] & 1) == 0) {
    [*(id *)((char *)&self->fd_ + 7) onClose];
  }
  objc_sync_exit(self);
}

- (void)implConfigureBlockingWithBoolean:(BOOL)a3
{
}

- (void)checkNotNullWithJavaNioByteBuffer:(id)a3
{
}

- (id)getFD
{
  return *(id *)(&self->isBound_ + 6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioDatagramChannelImpl;
  [(JavaNioChannelsSpiAbstractSelectableChannel *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004058F8;
}

@end