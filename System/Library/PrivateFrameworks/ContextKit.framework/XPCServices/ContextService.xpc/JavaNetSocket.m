@interface JavaNetSocket
+ (const)__metadata;
+ (id)__annotations_initWithJavaNetInetAddress_withInt_withBoolean_;
+ (id)__annotations_initWithNSString_withInt_withBoolean_;
+ (void)setSocketImplFactoryWithJavaNetSocketImplFactory:(id)a3;
- (BOOL)getKeepAlive;
- (BOOL)getOOBInline;
- (BOOL)getReuseAddress;
- (BOOL)getTcpNoDelay;
- (BOOL)isBound;
- (BOOL)isClosed;
- (BOOL)isConnected;
- (BOOL)isInputShutdown;
- (BOOL)isOutputShutdown;
- (JavaNetSocket)init;
- (JavaNetSocket)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (JavaNetSocket)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (JavaNetSocket)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6;
- (JavaNetSocket)initWithJavaNetProxy:(id)a3;
- (JavaNetSocket)initWithJavaNetSocketImpl:(id)a3;
- (JavaNetSocket)initWithNSString:(id)a3 withInt:(int)a4;
- (JavaNetSocket)initWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (JavaNetSocket)initWithNSString:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6;
- (NSString)description;
- (id)cacheLocalAddress;
- (id)getChannel;
- (id)getFileDescriptor$;
- (id)getInetAddress;
- (id)getInputStream;
- (id)getLocalAddress;
- (id)getLocalSocketAddress;
- (id)getOutputStream;
- (id)getRemoteSocketAddress;
- (int)getLocalPort;
- (int)getPort;
- (int)getReceiveBufferSize;
- (int)getSendBufferSize;
- (int)getSoLinger;
- (int)getSoTimeout;
- (int)getTrafficClass;
- (void)accepted;
- (void)bindWithJavaNetSocketAddress:(id)a3;
- (void)checkDestinationWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)checkOpenAndCreateWithBoolean:(BOOL)a3;
- (void)close;
- (void)connectWithJavaNetSocketAddress:(id)a3;
- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
- (void)dealloc;
- (void)onBindWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)onClose;
- (void)onConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)sendUrgentDataWithInt:(int)a3;
- (void)setKeepAliveWithBoolean:(BOOL)a3;
- (void)setOOBInlineWithBoolean:(BOOL)a3;
- (void)setReceiveBufferSizeWithInt:(int)a3;
- (void)setReuseAddressWithBoolean:(BOOL)a3;
- (void)setSendBufferSizeWithInt:(int)a3;
- (void)setSoLingerWithBoolean:(BOOL)a3 withInt:(int)a4;
- (void)setSoTimeoutWithInt:(int)a3;
- (void)setTcpNoDelayWithBoolean:(BOOL)a3;
- (void)setTrafficClassWithInt:(int)a3;
- (void)shutdownInput;
- (void)shutdownOutput;
- (void)startupSocketWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)tryAllAddressesWithNSString:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
@end

@implementation JavaNetSocket

- (JavaNetSocket)init
{
  return self;
}

- (JavaNetSocket)initWithJavaNetProxy:(id)a3
{
  return self;
}

- (void)tryAllAddressesWithNSString:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (JavaNetSocket)initWithNSString:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  JavaNetSocket_init((uint64_t)self);
  sub_100158D54((uint64_t)self, a3, v4, 0, 0, 1);
  return self;
}

- (JavaNetSocket)initWithNSString:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  JavaNetSocket_init((uint64_t)self);
  sub_100158D54((uint64_t)self, a3, v8, (uint64_t)a5, v6, 1);
  return self;
}

- (JavaNetSocket)initWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  JavaNetSocket_init((uint64_t)self);
  sub_100158D54((uint64_t)self, a3, v6, 0, 0, v5);
  return self;
}

- (JavaNetSocket)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaNetSocket)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6
{
  return self;
}

- (JavaNetSocket)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (JavaNetSocket)initWithJavaNetSocketImpl:(id)a3
{
  return self;
}

- (void)checkDestinationWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  sub_100159298(*(uint64_t *)&a4, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (void)close
{
  objc_sync_enter(self);
  *(_WORD *)&self->isConnected_ = 256;
  if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  JreStrongAssign((id *)&self->localAddress_, (void *)JavaNetInet4Address_ANY_);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl close];
  objc_sync_exit(self);
}

- (void)onClose
{
  *(_WORD *)&self->isConnected_ = 256;
  p_localAddress = &self->localAddress_;
  if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  JreStrongAssign((id *)p_localAddress, (void *)JavaNetInet4Address_ANY_);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl onClose];
}

- (id)getInetAddress
{
  if (![(JavaNetSocket *)self isConnected]) {
    return 0;
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetSocketImpl *)impl getInetAddress];
}

- (id)getInputStream
{
  sub_1001594A8((uint64_t)self, 0);
  if ([(JavaNetSocket *)self isInputShutdown])
  {
    uint64_t v5 = new_JavaNetSocketException_initWithNSString_(@"Socket input is shutdown");
    objc_exception_throw(v5);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetSocketImpl *)impl getInputStream];
}

- (BOOL)getKeepAlive
{
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:8], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (id)getLocalAddress
{
  return self->localAddress_;
}

- (int)getLocalPort
{
  if (![(JavaNetSocket *)self isBound]) {
    return -1;
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetSocketImpl *)impl getLocalPort];
}

- (id)getOutputStream
{
  sub_1001594A8((uint64_t)self, 0);
  if ([(JavaNetSocket *)self isOutputShutdown])
  {
    uint64_t v5 = new_JavaNetSocketException_initWithNSString_(@"Socket output is shutdown");
    objc_exception_throw(v5);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetSocketImpl *)impl getOutputStream];
}

- (int)getPort
{
  int result = [(JavaNetSocket *)self isConnected];
  if (result)
  {
    impl = self->impl_;
    if (!impl) {
      JreThrowNullPointerException();
    }
    return [(JavaNetSocketImpl *)impl getPort];
  }
  return result;
}

- (int)getSoLinger
{
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl) {
    goto LABEL_9;
  }
  id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:128];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return -1;
  }
  objc_opt_class();
  if (!v4) {
LABEL_9:
  }
    JreThrowNullPointerException();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 intValue];
}

- (int)getReceiveBufferSize
{
  objc_sync_enter(self);
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4098], objc_opt_class(), !v4)) {
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
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4097], objc_opt_class(), !v4)) {
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
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4102], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = [v4 intValue];
  objc_sync_exit(self);
  return v5;
}

- (BOOL)getTcpNoDelay
{
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:1], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (void)setKeepAliveWithBoolean:(BOOL)a3
{
  if (self->impl_)
  {
    BOOL v3 = a3;
    sub_1001594A8((uint64_t)self, 1);
    impl = self->impl_;
    uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
    [(JavaNetSocketImpl *)impl setOptionWithInt:8 withId:v6];
  }
}

+ (void)setSocketImplFactoryWithJavaNetSocketImplFactory:(id)a3
{
}

- (void)setSendBufferSizeWithInt:(int)a3
{
  objc_sync_enter(self);
  sub_1001594A8((uint64_t)self, 1);
  if (a3 <= 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"size < 1");
    objc_exception_throw(v6);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl setOptionWithInt:4097 withId:JavaLangInteger_valueOfWithInt_(a3)];
  objc_sync_exit(self);
}

- (void)setReceiveBufferSizeWithInt:(int)a3
{
  objc_sync_enter(self);
  sub_1001594A8((uint64_t)self, 1);
  if (a3 <= 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"size < 1");
    objc_exception_throw(v6);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl setOptionWithInt:4098 withId:JavaLangInteger_valueOfWithInt_(a3)];
  objc_sync_exit(self);
}

- (void)setSoLingerWithBoolean:(BOOL)a3 withInt:(int)a4
{
  BOOL v5 = a3;
  sub_1001594A8((uint64_t)self, 1);
  if (a4 < 0 && v5)
  {
    v9 = new_JavaLangIllegalArgumentException_initWithNSString_(@"timeout < 0");
    objc_exception_throw(v9);
  }
  impl = self->impl_;
  if (v5)
  {
    if (impl)
    {
      uint64_t v8 = JavaLangInteger_valueOfWithInt_(a4);
      goto LABEL_10;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!impl) {
    goto LABEL_13;
  }
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v8 = (JavaLangInteger *)JavaLangBoolean_FALSE__;
LABEL_10:
  [(JavaNetSocketImpl *)impl setOptionWithInt:128 withId:v8];
}

- (void)setSoTimeoutWithInt:(int)a3
{
  objc_sync_enter(self);
  sub_1001594A8((uint64_t)self, 1);
  if (a3 < 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"timeout < 0");
    objc_exception_throw(v6);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl setOptionWithInt:4102 withId:JavaLangInteger_valueOfWithInt_(a3)];
  objc_sync_exit(self);
}

- (void)setTcpNoDelayWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
  [(JavaNetSocketImpl *)impl setOptionWithInt:1 withId:v6];
}

- (void)startupSocketWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
  sub_100159EA0((uint64_t)self, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, *(uint64_t *)&a6, a7, a7, v7);
}

- (NSString)description
{
  if (![(JavaNetSocket *)self isConnected]) {
    return (NSString *)@"Socket[unconnected]";
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetSocketImpl *)impl description];
}

- (void)shutdownInput
{
  if ([(JavaNetSocket *)self isInputShutdown])
  {
    id v4 = new_JavaNetSocketException_initWithNSString_(@"Socket input is shutdown");
    objc_exception_throw(v4);
  }
  sub_1001594A8((uint64_t)self, 0);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl shutdownInput];
  self->isInputShutdown_ = 1;
}

- (void)shutdownOutput
{
  if ([(JavaNetSocket *)self isOutputShutdown])
  {
    id v4 = new_JavaNetSocketException_initWithNSString_(@"Socket output is shutdown");
    objc_exception_throw(v4);
  }
  sub_1001594A8((uint64_t)self, 0);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl shutdownOutput];
  self->isOutputShutdown_ = 1;
}

- (void)checkOpenAndCreateWithBoolean:(BOOL)a3
{
}

- (id)getLocalSocketAddress
{
  if (![(JavaNetSocket *)self isBound]) {
    return 0;
  }
  BOOL v3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_([(JavaNetSocket *)self getLocalAddress], [(JavaNetSocket *)self getLocalPort]);
  return v3;
}

- (id)getRemoteSocketAddress
{
  if (![(JavaNetSocket *)self isConnected]) {
    return 0;
  }
  BOOL v3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_([(JavaNetSocket *)self getInetAddress], [(JavaNetSocket *)self getPort]);
  return v3;
}

- (BOOL)isBound
{
  return self->isBound_;
}

- (BOOL)isConnected
{
  return self->isConnected_;
}

- (BOOL)isClosed
{
  return self->isClosed_;
}

- (void)bindWithJavaNetSocketAddress:(id)a3
{
  sub_1001594A8((uint64_t)self, 1);
  if ([(JavaNetSocket *)self isBound])
  {
    v9 = new_JavaNetBindException_initWithNSString_(@"Socket is already bound");
    goto LABEL_19;
  }
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
        goto LABEL_10;
      }
      [a3 getHostName];
      CFStringRef v25 = JreStrcat("$$", v18, v19, v20, v21, v22, v23, v24, @"Host is unresolved: ");
      v9 = new_JavaNetUnknownHostException_initWithNSString_((uint64_t)v25);
    }
    else
    {
      [a3 getClass];
      CFStringRef v17 = JreStrcat("$@", v10, v11, v12, v13, v14, v15, v16, @"Local address not an InetSocketAddress: ");
      v9 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v17);
    }
LABEL_19:
    objc_exception_throw(v9);
  }
  if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v7 = 0;
  uint64_t v6 = JavaNetInet4Address_ANY_;
LABEL_10:
  objc_sync_enter(self);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl bindWithJavaNetInetAddress:v6 withInt:v7];
  self->isBound_ = 1;
  -[JavaNetSocket cacheLocalAddress]_0((uint64_t)self);
  objc_sync_exit(self);
}

- (id)cacheLocalAddress
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (!v1) {
    JreThrowNullPointerException();
  }
  v2 = (id *)(a1 + 40);
  id SocketLocalAddressWithJavaIoFileDescriptor = LibcoreIoIoBridge_getSocketLocalAddressWithJavaIoFileDescriptor_(*(void *)(v1 + 24));
  return JreStrongAssign(v2, SocketLocalAddressWithJavaIoFileDescriptor);
}

- (void)onBindWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  self->isBound_ = 1;
  JreStrongAssign((id *)&self->localAddress_, a3);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl onBindWithJavaNetInetAddress:a3 withInt:v4];
}

- (void)connectWithJavaNetSocketAddress:(id)a3
{
}

- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  sub_1001594A8((uint64_t)self, 1);
  if ((v4 & 0x80000000) != 0)
  {
    CFStringRef v18 = @"timeout < 0";
LABEL_24:
    uint64_t v19 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v18);
    goto LABEL_26;
  }
  if ([(JavaNetSocket *)self isConnected])
  {
    uint64_t v19 = new_JavaNetSocketException_initWithNSString_(@"Already connected");
    goto LABEL_26;
  }
  if (!a3)
  {
    CFStringRef v18 = @"remoteAddr == null";
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a3 getClass];
    CFStringRef v18 = JreStrcat("$@", v20, v21, v22, v23, v24, v25, v26, @"Remote address not an InetSocketAddress: ");
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (![a3 getAddress])
  {
    [a3 getHostName];
    CFStringRef v34 = JreStrcat("$$", v27, v28, v29, v30, v31, v32, v33, @"Host is unresolved: ");
    uint64_t v19 = new_JavaNetUnknownHostException_initWithNSString_((uint64_t)v34);
LABEL_26:
    objc_exception_throw(v19);
  }
  id v7 = [a3 getPort];
  sub_100159298((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  id connectLock = self->connectLock_;
  objc_sync_enter(connectLock);
  if (![(JavaNetSocket *)self isBound])
  {
    if ((sub_10015A028((uint64_t)self) & 1) == 0)
    {
      impl = self->impl_;
      if (!impl) {
        goto LABEL_18;
      }
      if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0)
      {
        v35 = impl;
        objc_opt_class();
        impl = v35;
      }
      [(JavaNetSocketImpl *)impl bindWithJavaNetInetAddress:JavaNetInet4Address_ANY_ withInt:0];
    }
    self->isBound_ = 1;
  }
  CFStringRef v17 = self->impl_;
  if (!v17) {
LABEL_18:
  }
    JreThrowNullPointerException();
  [(JavaNetSocketImpl *)v17 connectWithJavaNetSocketAddress:a3 withInt:v4];
  self->isConnected_ = 1;
  -[JavaNetSocket cacheLocalAddress]_0((uint64_t)self);
  objc_sync_exit(connectLock);
}

- (void)onConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  self->isConnected_ = 1;
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl onConnectWithJavaNetInetAddress:a3 withInt:*(void *)&a4];
}

- (BOOL)isInputShutdown
{
  return self->isInputShutdown_;
}

- (BOOL)isOutputShutdown
{
  return self->isOutputShutdown_;
}

- (void)setReuseAddressWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
  [(JavaNetSocketImpl *)impl setOptionWithInt:4 withId:v6];
}

- (BOOL)getReuseAddress
{
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (void)setOOBInlineWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
  [(JavaNetSocketImpl *)impl setOptionWithInt:4099 withId:v6];
}

- (BOOL)getOOBInline
{
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4099], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (void)setTrafficClassWithInt:(int)a3
{
  sub_1001594A8((uint64_t)self, 1);
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
  [(JavaNetSocketImpl *)impl setOptionWithInt:3 withId:v13];
}

- (int)getTrafficClass
{
  sub_1001594A8((uint64_t)self, 1);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:3], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 intValue];
}

- (void)sendUrgentDataWithInt:(int)a3
{
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl sendUrgentDataWithInt:*(void *)&a3];
}

- (void)accepted
{
  *(_WORD *)&self->isBound_ = 257;
  atomic_store(1u, (unsigned __int8 *)&self->isCreated_);
  -[JavaNetSocket cacheLocalAddress]_0((uint64_t)self);
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
  v3.super_class = (Class)JavaNetSocket;
  [(JavaNetSocket *)&v3 dealloc];
}

+ (id)__annotations_initWithNSString_withInt_withBoolean_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_initWithJavaNetInetAddress_withInt_withBoolean_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F9080;
}

@end