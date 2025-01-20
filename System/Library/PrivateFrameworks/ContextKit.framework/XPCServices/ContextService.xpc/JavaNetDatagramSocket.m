@interface JavaNetDatagramSocket
+ (const)__metadata;
+ (void)setDatagramSocketImplFactoryWithJavaNetDatagramSocketImplFactory:(id)a3;
- (BOOL)getBroadcast;
- (BOOL)getReuseAddress;
- (BOOL)isBound;
- (BOOL)isClosed;
- (BOOL)isConnected;
- (BOOL)isMulticastSocket;
- (JavaNetDatagramSocket)init;
- (JavaNetDatagramSocket)initWithInt:(int)a3;
- (JavaNetDatagramSocket)initWithInt:(int)a3 withJavaNetInetAddress:(id)a4;
- (JavaNetDatagramSocket)initWithJavaNetDatagramSocketImpl:(id)a3;
- (JavaNetDatagramSocket)initWithJavaNetSocketAddress:(id)a3;
- (id)ensureBound;
- (id)getChannel;
- (id)getFileDescriptor$;
- (id)getInetAddress;
- (id)getLocalAddress;
- (id)getLocalSocketAddress;
- (id)getRemoteSocketAddress;
- (int)getLocalPort;
- (int)getPort;
- (int)getReceiveBufferSize;
- (int)getSendBufferSize;
- (int)getSoTimeout;
- (int)getTrafficClass;
- (void)bindWithJavaNetSocketAddress:(id)a3;
- (void)checkOpen;
- (void)checkPortWithInt:(int)a3;
- (void)close;
- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)connectWithJavaNetSocketAddress:(id)a3;
- (void)createSocketWithInt:(int)a3 withJavaNetInetAddress:(id)a4;
- (void)dealloc;
- (void)disconnect;
- (void)onBindWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)onClose;
- (void)onConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)onDisconnect;
- (void)receiveWithJavaNetDatagramPacket:(id)a3;
- (void)sendWithJavaNetDatagramPacket:(id)a3;
- (void)setBroadcastWithBoolean:(BOOL)a3;
- (void)setNetworkInterfaceWithJavaNetNetworkInterface:(id)a3;
- (void)setReceiveBufferSizeWithInt:(int)a3;
- (void)setReuseAddressWithBoolean:(BOOL)a3;
- (void)setSendBufferSizeWithInt:(int)a3;
- (void)setSoTimeoutWithInt:(int)a3;
- (void)setTrafficClassWithInt:(int)a3;
@end

@implementation JavaNetDatagramSocket

- (JavaNetDatagramSocket)init
{
  return self;
}

- (JavaNetDatagramSocket)initWithInt:(int)a3
{
  return self;
}

- (JavaNetDatagramSocket)initWithInt:(int)a3 withJavaNetInetAddress:(id)a4
{
  return self;
}

- (void)checkPortWithInt:(int)a3
{
  sub_100159298(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)close
{
  self->isClosed_ = 1;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl close];
}

- (void)onClose
{
  self->isClosed_ = 1;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl onClose];
}

- (void)disconnect
{
  if (![(JavaNetDatagramSocket *)self isClosed] && [(JavaNetDatagramSocket *)self isConnected])
  {
    impl = self->impl_;
    if (!impl) {
      JreThrowNullPointerException();
    }
    [(JavaNetDatagramSocketImpl *)impl disconnect];
    JreStrongAssign((id *)&self->address_, 0);
    self->port_ = -1;
    self->isConnected_ = 0;
  }
}

- (void)onDisconnect
{
  JreStrongAssign((id *)&self->address_, 0);
  self->port_ = -1;
  self->isConnected_ = 0;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl onDisconnect];
}

- (void)createSocketWithInt:(int)a3 withJavaNetInetAddress:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  if (JavaNetDatagramSocket_factory_) {
    uint64_t v7 = (JavaNetPlainDatagramSocketImpl *)[(id)JavaNetDatagramSocket_factory_ createDatagramSocketImpl];
  }
  else {
    uint64_t v7 = new_JavaNetPlainDatagramSocketImpl_init();
  }
  JreStrongAssign((id *)&self->impl_, v7);
  [(JavaNetDatagramSocketImpl *)self->impl_ create];
  [(JavaNetDatagramSocketImpl *)self->impl_ bindWithInt:v5 withJavaNetInetAddress:a4];
  self->isBound_ = 1;
  objc_sync_exit(self);
}

- (id)getInetAddress
{
  return self->address_;
}

- (id)getLocalAddress
{
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return LibcoreIoIoBridge_getSocketLocalAddressWithJavaIoFileDescriptor_((uint64_t)impl->fd_);
}

- (int)getLocalPort
{
  if ([(JavaNetDatagramSocket *)self isClosed]) {
    return -1;
  }
  int result = [(JavaNetDatagramSocket *)self isBound];
  if (result)
  {
    impl = self->impl_;
    if (!impl) {
      JreThrowNullPointerException();
    }
    return [(JavaNetDatagramSocketImpl *)impl getLocalPort];
  }
  return result;
}

- (int)getPort
{
  return self->port_;
}

- (BOOL)isMulticastSocket
{
  return 0;
}

- (int)getReceiveBufferSize
{
  objc_sync_enter(self);
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl
    || (id v4 = [(JavaNetDatagramSocketImpl *)impl getOptionWithInt:4098], objc_opt_class(), !v4))
  {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = [v4 intValue];
  objc_sync_exit(self);
  return v5;
}

- (int)getSendBufferSize
{
  objc_sync_enter(self);
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl
    || (id v4 = [(JavaNetDatagramSocketImpl *)impl getOptionWithInt:4097], objc_opt_class(), !v4))
  {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = [v4 intValue];
  objc_sync_exit(self);
  return v5;
}

- (int)getSoTimeout
{
  objc_sync_enter(self);
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl
    || (id v4 = [(JavaNetDatagramSocketImpl *)impl getOptionWithInt:4102], objc_opt_class(), !v4))
  {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = [v4 intValue];
  objc_sync_exit(self);
  return v5;
}

- (void)receiveWithJavaNetDatagramPacket:(id)a3
{
  objc_sync_enter(self);
  [(JavaNetDatagramSocket *)self checkOpen];
  -[JavaNetDatagramSocket ensureBound]_0((uint64_t)self);
  if (!a3)
  {
    uint64_t v7 = new_JavaLangNullPointerException_initWithNSString_(@"pack == null");
    goto LABEL_10;
  }
  pendingConnectException = self->pendingConnectException_;
  if (pendingConnectException)
  {
    uint64_t v7 = new_JavaNetSocketException_initWithNSString_withJavaLangThrowable_(@"Pending connect failure", (uint64_t)pendingConnectException);
LABEL_10:
    objc_exception_throw(v7);
  }
  [a3 resetLengthForReceive];
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl receiveWithJavaNetDatagramPacket:a3];
  objc_sync_exit(self);
}

- (id)ensureBound
{
  id result = [(id)a1 isBound];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 8);
    if (!v3) {
      JreThrowNullPointerException();
    }
    if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id result = [v3 bindWithInt:0 withJavaNetInetAddress:JavaNetInet4Address_ANY_];
    *(unsigned char *)(a1 + 28) = 1;
  }
  return result;
}

- (void)sendWithJavaNetDatagramPacket:(id)a3
{
  [(JavaNetDatagramSocket *)self checkOpen];
  -[JavaNetDatagramSocket ensureBound]_0((uint64_t)self);
  if (!a3) {
    goto LABEL_15;
  }
  id v5 = [a3 getAddress];
  if (self->address_)
  {
    if (v5)
    {
      if (![(JavaNetInetAddress *)self->address_ isEqual:v5]
        || (int port = self->port_, port != [a3 getPort]))
      {
        uint64_t v7 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Packet address mismatch with connected address");
        goto LABEL_9;
      }
    }
    else
    {
      [a3 setAddressWithJavaNetInetAddress:self->address_];
      [a3 setPortWithInt:self->port_];
    }
  }
  else if (!v5)
  {
    uint64_t v7 = new_JavaLangNullPointerException_initWithNSString_(@"Destination address is null");
LABEL_9:
    objc_exception_throw(v7);
  }
  impl = self->impl_;
  if (!impl) {
LABEL_15:
  }
    JreThrowNullPointerException();
  [(JavaNetDatagramSocketImpl *)impl sendWithJavaNetDatagramPacket:a3];
}

- (void)setNetworkInterfaceWithJavaNetNetworkInterface:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = new_JavaLangNullPointerException_initWithNSString_(@"netInterface == null");
    objc_exception_throw(v6);
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_ || (impl = self->impl_) == 0) {
    JreThrowNullPointerException();
  }
  objc_msgSend((id)LibcoreIoLibcore_os_, "setsockoptIfreqWithJavaIoFileDescriptor:withInt:withInt:withNSString:", impl->fd_, 0xFFFFLL, 25, objc_msgSend(a3, "getName"));
}

- (void)setSendBufferSizeWithInt:(int)a3
{
  objc_sync_enter(self);
  if (a3 <= 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"size < 1");
    objc_exception_throw(v6);
  }
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl setOptionWithInt:4097 withId:JavaLangInteger_valueOfWithInt_(a3)];
  objc_sync_exit(self);
}

- (void)setReceiveBufferSizeWithInt:(int)a3
{
  objc_sync_enter(self);
  if (a3 <= 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"size < 1");
    objc_exception_throw(v6);
  }
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl setOptionWithInt:4098 withId:JavaLangInteger_valueOfWithInt_(a3)];
  objc_sync_exit(self);
}

- (void)setSoTimeoutWithInt:(int)a3
{
  objc_sync_enter(self);
  if (a3 < 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"timeout < 0");
    objc_exception_throw(v6);
  }
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl setOptionWithInt:4102 withId:JavaLangInteger_valueOfWithInt_(a3)];
  objc_sync_exit(self);
}

+ (void)setDatagramSocketImplFactoryWithJavaNetDatagramSocketImplFactory:(id)a3
{
}

- (JavaNetDatagramSocket)initWithJavaNetDatagramSocketImpl:(id)a3
{
  return self;
}

- (JavaNetDatagramSocket)initWithJavaNetSocketAddress:(id)a3
{
  return self;
}

- (void)checkOpen
{
  if ([(JavaNetDatagramSocket *)self isClosed])
  {
    v2 = new_JavaNetSocketException_initWithNSString_(@"Socket is closed");
    objc_exception_throw(v2);
  }
}

- (void)bindWithJavaNetSocketAddress:(id)a3
{
  [(JavaNetDatagramSocket *)self checkOpen];
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      id v5 = [a3 getAddress];
      if (v5)
      {
        uint64_t v6 = (uint64_t)v5;
        id v7 = [a3 getPort];
        sub_100159298((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
        goto LABEL_9;
      }
      [a3 getHostName];
      CFStringRef v32 = JreStrcat("$$", v25, v26, v27, v28, v29, v30, v31, @"Host is unresolved: ");
      v24 = new_JavaNetSocketException_initWithNSString_((uint64_t)v32);
    }
    else
    {
      [a3 getClass];
      CFStringRef v23 = JreStrcat("$@", v16, v17, v18, v19, v20, v21, v22, @"Local address not an InetSocketAddress: ");
      v24 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v23);
    }
    objc_exception_throw(v24);
  }
  if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v7 = 0;
  uint64_t v6 = JavaNetInet4Address_ANY_;
LABEL_9:
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl bindWithInt:v7 withJavaNetInetAddress:v6];
  self->isBound_ = 1;
}

- (void)onBindWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  self->isBound_ = 1;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl onBindWithJavaNetInetAddress:a3 withInt:*(void *)&a4];
}

- (void)connectWithJavaNetSocketAddress:(id)a3
{
  if (!a3)
  {
    CFStringRef v8 = @"peer == null";
LABEL_13:
    uint64_t v16 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v8);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a3 getClass];
    CFStringRef v8 = JreStrcat("$@", v9, v10, v11, v12, v13, v14, v15, @"peer not an InetSocketAddress: ");
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (![a3 getAddress])
  {
    [a3 getHostName];
    CFStringRef v24 = JreStrcat("$$", v17, v18, v19, v20, v21, v22, v23, @"Host is unresolved: ");
    uint64_t v16 = new_JavaNetSocketException_initWithNSString_((uint64_t)v24);
LABEL_15:
    objc_exception_throw(v16);
  }
  id lock = self->lock_;
  objc_sync_enter(lock);
  [(JavaNetDatagramSocket *)self checkOpen];
  -[JavaNetDatagramSocket ensureBound]_0((uint64_t)self);
  JreStrongAssign((id *)&self->address_, [a3 getAddress]);
  id v6 = [a3 getPort];
  self->port_ = (int)v6;
  self->isConnected_ = 1;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl connectWithJavaNetInetAddress:self->address_ withInt:v6];
  objc_sync_exit(lock);
}

- (void)onConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  self->isConnected_ = 1;
  JreStrongAssign((id *)&self->address_, a3);
  self->port_ = v4;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetDatagramSocketImpl *)impl onConnectWithJavaNetInetAddress:a3 withInt:v4];
}

- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  if (!a3)
  {
    uint64_t v4 = new_JavaLangIllegalArgumentException_initWithNSString_(@"address == null");
    objc_exception_throw(v4);
  }
  [(JavaNetDatagramSocket *)self connectWithJavaNetSocketAddress:new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_(a3, a4)];
}

- (BOOL)isBound
{
  return self->isBound_;
}

- (BOOL)isConnected
{
  return self->isConnected_;
}

- (id)getRemoteSocketAddress
{
  if (![(JavaNetDatagramSocket *)self isConnected]) {
    return 0;
  }
  uint64_t v3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_([(JavaNetDatagramSocket *)self getInetAddress], [(JavaNetDatagramSocket *)self getPort]);
  return v3;
}

- (id)getLocalSocketAddress
{
  if ([(JavaNetDatagramSocket *)self isClosed] || ![(JavaNetDatagramSocket *)self isBound]) {
    return 0;
  }
  uint64_t v3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_([(JavaNetDatagramSocket *)self getLocalAddress], [(JavaNetDatagramSocket *)self getLocalPort]);
  return v3;
}

- (void)setReuseAddressWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
  [(JavaNetDatagramSocketImpl *)impl setOptionWithInt:4 withId:v6];
}

- (BOOL)getReuseAddress
{
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl
    || (id v4 = [(JavaNetDatagramSocketImpl *)impl getOptionWithInt:4], objc_opt_class(), !v4))
  {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (void)setBroadcastWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
  [(JavaNetDatagramSocketImpl *)impl setOptionWithInt:32 withId:v6];
}

- (BOOL)getBroadcast
{
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl
    || (id v4 = [(JavaNetDatagramSocketImpl *)impl getOptionWithInt:32], objc_opt_class(), !v4))
  {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (void)setTrafficClassWithInt:(int)a3
{
  [(JavaNetDatagramSocket *)self checkOpen];
  if (a3 >= 0x100)
  {
    CFStringRef v14 = JreStrcat("$I", v5, v6, v7, v8, v9, v10, v11, @"Value doesn't fit in an unsigned byte: ");
    uint64_t v15 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v14);
    objc_exception_throw(v15);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v13 = JavaLangInteger_valueOfWithInt_(a3);
  [(JavaNetDatagramSocketImpl *)impl setOptionWithInt:3 withId:v13];
}

- (int)getTrafficClass
{
  [(JavaNetDatagramSocket *)self checkOpen];
  impl = self->impl_;
  if (!impl
    || (id v4 = [(JavaNetDatagramSocketImpl *)impl getOptionWithInt:3], objc_opt_class(), !v4))
  {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 intValue];
}

- (BOOL)isClosed
{
  return self->isClosed_;
}

- (id)getChannel
{
  return 0;
}

- (id)getFileDescriptor$
{
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return impl->fd_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetDatagramSocket;
  [(JavaNetDatagramSocket *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100434E88;
}

@end