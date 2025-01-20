@interface JavaNetPlainSocketImpl
+ (const)__metadata;
- (BOOL)supportsUrgentData;
- (JavaNetPlainSocketImpl)init;
- (JavaNetPlainSocketImpl)initWithJavaIoFileDescriptor:(id)a3;
- (JavaNetPlainSocketImpl)initWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6;
- (JavaNetPlainSocketImpl)initWithJavaNetProxy:(id)a3;
- (JavaNetSocks4Message)socksReadReply;
- (id)getInputStream;
- (id)getOptionWithInt:(int)a3;
- (id)getOutputStream;
- (id)socksBind;
- (int)available;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)acceptWithJavaNetSocketImpl:(id)a3;
- (void)bindWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)close;
- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
- (void)connectWithNSString:(id)a3 withInt:(int)a4;
- (void)createWithBoolean:(BOOL)a3;
- (void)dealloc;
- (void)initLocalPortWithInt:(int)a3;
- (void)initRemoteAddressAndPortWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)listenWithInt:(int)a3;
- (void)sendUrgentDataWithInt:(int)a3;
- (void)setOptionWithInt:(int)a3 withId:(id)a4;
- (void)shutdownInput;
- (void)shutdownOutput;
- (void)socksAccept;
- (void)socksConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)socksRequestConnectionWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)socksSendRequestWithInt:(int)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
- (void)usingSocks;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaNetPlainSocketImpl

- (JavaNetPlainSocketImpl)initWithJavaIoFileDescriptor:(id)a3
{
  return self;
}

- (JavaNetPlainSocketImpl)initWithJavaNetProxy:(id)a3
{
  return self;
}

- (JavaNetPlainSocketImpl)init
{
  v3 = new_JavaIoFileDescriptor_init();
  JavaNetPlainSocketImpl_initWithJavaIoFileDescriptor_((uint64_t)self, v3);
  return self;
}

- (JavaNetPlainSocketImpl)initWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6
{
  return self;
}

- (void)acceptWithJavaNetSocketImpl:(id)a3
{
  if (-[JavaNetPlainSocketImpl usingSocks]_0((uint64_t)self))
  {
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (-[JavaNetPlainSocketImpl socksBind]_0((uint64_t)a3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      JreThrowClassCastException();
    }
    [a3 socksAccept];
  }
  else
  {
    v5 = new_JavaNetInetSocketAddress_init();
    if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_
      || (id v6 = [(id)LibcoreIoLibcore_os_ acceptWithJavaIoFileDescriptor:self->super.fd_ withJavaNetInetSocketAddress:v5], !a3)|| ((v7 = (void *)*((void *)a3 + 3)) != 0 ? (v8 = v6 == 0) : (v8 = 1), v8))
    {
      JreThrowNullPointerException();
    }
    objc_msgSend(v7, "setInt$WithInt:", objc_msgSend(v6, "getInt$"));
    JreStrongAssign((id *)a3 + 1, [(JavaNetInetSocketAddress *)v5 getAddress]);
    *((_DWORD *)a3 + 4) = [(JavaNetInetSocketAddress *)v5 getPort];
    [a3 setOptionWithInt:4102 withId:JavaLangInteger_valueOfWithInt_(0)];
    *((_DWORD *)a3 + 8) = LibcoreIoIoBridge_getSocketLocalPortWithJavaIoFileDescriptor_(*((void *)a3 + 3));
  }
}

- (void)usingSocks
{
  result = *(void **)(a1 + 40);
  if (result)
  {
    id v2 = [result type];
    if ((atomic_load_explicit(JavaNetProxy_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (void *)(v2 == (id)qword_100563D70);
  }
  return result;
}

- (id)socksBind
{
  uint64_t v2 = *(void *)(a1 + 24);
  v3 = sub_100151DDC(a1);
  id v4 = sub_100151D68(a1);
  LibcoreIoIoBridge_connectWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_(v2, (uint64_t)v3, (uint64_t)v4);
  if (!qword_1005607A8)
  {
    v12 = new_JavaNetSocketException_initWithNSString_(@"Invalid SOCKS client");
    goto LABEL_13;
  }
  sub_100152244((void *)a1, 2, (void *)qword_1005607A8, dword_1005607B0);
  v5 = -[JavaNetPlainSocketImpl socksReadReply]_0((void *)a1);
  if (!v5) {
    JreThrowNullPointerException();
  }
  id v6 = v5;
  if ([(JavaNetSocks4Message *)v5 getCommandOrResult] != 90)
  {
    v12 = (JavaNetSocketException *)new_JavaIoIOException_initWithNSString_((uint64_t)[(JavaNetSocks4Message *)v6 getErrorStringWithInt:[(JavaNetSocks4Message *)v6 getCommandOrResult]]);
LABEL_13:
    objc_exception_throw(v12);
  }
  if ([(JavaNetSocks4Message *)v6 getIP])
  {
    v7 = +[IOSByteArray arrayWithLength:4];
    unsigned int v8 = [(JavaNetSocks4Message *)v6 getIP];
    if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    LibcoreIoMemory_pokeIntWithByteArray_withInt_withInt_withJavaNioByteOrder_((uint64_t)v7, 0, v8, JavaNioByteOrder_BIG_ENDIAN__);
    v9 = JavaNetInetAddress_getByAddressWithByteArray_(v7);
    v10 = (id *)(a1 + 8);
  }
  else
  {
    v9 = sub_100151DDC(a1);
    v10 = (id *)(a1 + 8);
  }
  JreStrongAssign(v10, v9);
  id result = (id)[(JavaNetSocks4Message *)v6 getPort];
  *(_DWORD *)(a1 + 32) = result;
  return result;
}

- (void)initLocalPortWithInt:(int)a3
{
  self->super.localport_ = a3;
}

- (void)initRemoteAddressAndPortWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  self->super.port_ = a4;
}

- (int)available
{
  objc_sync_enter(self);
  sub_100151760((uint64_t)self);
  if (*((unsigned char *)&self->super.localport_ + 5)) {
    int v3 = 0;
  }
  else {
    int v3 = LibcoreIoIoBridge_availableWithJavaIoFileDescriptor_((uint64_t)self->super.fd_);
  }
  objc_sync_exit(self);
  return v3;
}

- (void)bindWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  unsigned int SocketLocalPortWithJavaIoFileDescriptor = a4;
  LibcoreIoIoBridge_bindWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_((uint64_t)self->super.fd_, (JavaNetInet6Address *)a3, *(uint64_t *)&a4);
  JreStrongAssign((id *)&self->super.address_, a3);
  if (!SocketLocalPortWithJavaIoFileDescriptor) {
    unsigned int SocketLocalPortWithJavaIoFileDescriptor = LibcoreIoIoBridge_getSocketLocalPortWithJavaIoFileDescriptor_((uint64_t)self->super.fd_);
  }
  self->super.localport_ = SocketLocalPortWithJavaIoFileDescriptor;
}

- (void)close
{
  objc_sync_enter(self);
  proxy = self->proxy_;
  if (!proxy) {
    JreThrowNullPointerException();
  }
  [(JavaNetProxy *)proxy close];
  LibcoreIoIoBridge_closeSocketWithJavaIoFileDescriptor_(self->super.fd_);
  objc_sync_exit(self);
}

- (void)connectWithNSString:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = JavaNetInetAddress_getByNameWithNSString_(a3);
  [(JavaNetPlainSocketImpl *)self connectWithJavaNetInetAddress:v6 withInt:v4];
}

- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
}

- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)createWithBoolean:(BOOL)a3
{
  *((unsigned char *)&self->super.localport_ + 4) = a3;
  p_fd = &self->super.fd_;
  id v4 = LibcoreIoIoBridge_socketWithBoolean_(a3);
  JreStrongAssign((id *)p_fd, v4);
}

- (void)dealloc
{
  proxy = self->proxy_;
  if (proxy) {
    [(JavaNetProxy *)proxy warnIfOpen];
  }
  [(JavaNetPlainSocketImpl *)self close];

  v4.receiver = self;
  v4.super_class = (Class)JavaNetPlainSocketImpl;
  [(JavaNetSocketImpl *)&v4 dealloc];
}

- (id)getInputStream
{
  objc_sync_enter(self);
  sub_100151760((uint64_t)self);
  int v3 = [JavaNetPlainSocketImpl_PlainSocketInputStream alloc];
  JavaIoInputStream_init();
  JreStrongAssign((id *)&v3->socketImpl_, self);
  objc_super v4 = v3;
  objc_sync_exit(self);
  return v4;
}

- (id)getOptionWithInt:(int)a3
{
  return LibcoreIoIoBridge_getSocketOptionWithJavaIoFileDescriptor_withInt_((uint64_t)self->super.fd_, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)getOutputStream
{
  objc_sync_enter(self);
  sub_100151760((uint64_t)self);
  uint64_t v3 = [JavaNetPlainSocketImpl_PlainSocketOutputStream alloc];
  JavaIoOutputStream_init();
  JreStrongAssign((id *)&v3->socketImpl_, self);
  uint64_t v4 = v3;
  objc_sync_exit(self);
  return v4;
}

- (void)listenWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((-[JavaNetPlainSocketImpl usingSocks]_0((uint64_t)self) & 1) == 0)
  {
    if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_) {
      JreThrowNullPointerException();
    }
    [(id)LibcoreIoLibcore_os_ listenWithJavaIoFileDescriptor:self->super.fd_ withInt:v3];
  }
}

- (void)setOptionWithInt:(int)a3 withId:(id)a4
{
  LibcoreIoIoBridge_setSocketOptionWithJavaIoFileDescriptor_withInt_withId_((uint64_t)self->super.fd_, *(uint64_t *)&a3, a4, (uint64_t)a4, v4, v5, v6, v7);
}

- (void)socksConnectWithJavaNetInetAddress:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)socksRequestConnectionWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
}

- (void)socksAccept
{
  uint64_t v2 = -[JavaNetPlainSocketImpl socksReadReply]_0(self);
  if (!v2) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = v2;
  if ([(JavaNetSocks4Message *)v2 getCommandOrResult] != 90)
  {
    uint64_t v4 = new_JavaIoIOException_initWithNSString_((uint64_t)[(JavaNetSocks4Message *)v3 getErrorStringWithInt:[(JavaNetSocks4Message *)v3 getCommandOrResult]]);
    objc_exception_throw(v4);
  }
}

- (JavaNetSocks4Message)socksReadReply
{
  uint64_t v2 = new_JavaNetSocks4Message_init();
  uint64_t v3 = 0;
  while ((int)v3 <= 7)
  {
    id v4 = [a1 getInputStream];
    if (!v4) {
      JreThrowNullPointerException();
    }
    unsigned int v5 = objc_msgSend(v4, "readWithByteArray:withInt:withInt:", -[JavaNetSocks4Message getBytes](v2, "getBytes"), v3, (8 - v3));
    uint64_t v3 = v5 + v3;
    if (v5 == -1) {
      goto LABEL_5;
    }
  }
  if (v3 != 8)
  {
LABEL_5:
    uint64_t v6 = new_JavaNetSocketException_initWithNSString_(@"Malformed reply from SOCKS server");
    objc_exception_throw(v6);
  }
  return v2;
}

- (void)shutdownInput
{
  *((unsigned char *)&self->super.localport_ + 5) = 1;
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ shutdownWithJavaIoFileDescriptor:self->super.fd_ withInt:0];
}

- (void)shutdownOutput
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ shutdownWithJavaIoFileDescriptor:self->super.fd_ withInt:1];
}

- (void)socksSendRequestWithInt:(int)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
}

- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v7 = [a3 getAddress];
  id v8 = [a3 getPort];
  sub_10015197C((uint64_t)self, v7, (uint64_t)v8, a4);
}

- (BOOL)supportsUrgentData
{
  return 1;
}

- (void)sendUrgentDataWithInt:(int)a3
{
  char v6 = a3;
  id v4 = +[IOSByteArray arrayWithBytes:&v6 count:1];
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  LODWORD(v5) = 0;
  [(id)LibcoreIoLibcore_os_ sendtoWithJavaIoFileDescriptor:self->super.fd_ withByteArray:v4 withInt:0 withInt:1 withInt:1 withJavaNetInetAddress:0 withInt:v5];
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_10015249C((uint64_t)self, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F52C0;
}

@end