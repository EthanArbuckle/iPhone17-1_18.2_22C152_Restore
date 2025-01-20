@interface JavaNetPlainDatagramSocketImpl
+ (const)__metadata;
+ (id)makeGroupReqWithJavaNetInetAddress:(id)a3 withJavaNetNetworkInterface:(id)a4;
- (JavaNetPlainDatagramSocketImpl)init;
- (JavaNetPlainDatagramSocketImpl)initWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
- (char)getTTL;
- (id)getOptionWithInt:(int)a3;
- (int)getTimeToLive;
- (int)peekDataWithJavaNetDatagramPacket:(id)a3;
- (int)peekWithJavaNetInetAddress:(id)a3;
- (void)bindWithInt:(int)a3 withJavaNetInetAddress:(id)a4;
- (void)close;
- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)create;
- (void)dealloc;
- (void)disconnect;
- (void)doRecvWithJavaNetDatagramPacket:(id)a3 withInt:(int)a4;
- (void)joinGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4;
- (void)joinWithJavaNetInetAddress:(id)a3;
- (void)leaveGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4;
- (void)leaveWithJavaNetInetAddress:(id)a3;
- (void)receiveWithJavaNetDatagramPacket:(id)a3;
- (void)sendWithJavaNetDatagramPacket:(id)a3;
- (void)setOptionWithInt:(int)a3 withId:(id)a4;
- (void)setTTLWithByte:(char)a3;
- (void)setTimeToLiveWithInt:(int)a3;
- (void)updatePacketRecvAddressWithJavaNetDatagramPacket:(id)a3;
@end

@implementation JavaNetPlainDatagramSocketImpl

- (JavaNetPlainDatagramSocketImpl)initWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaNetPlainDatagramSocketImpl)init
{
  return self;
}

- (void)bindWithInt:(int)a3 withJavaNetInetAddress:(id)a4
{
  unsigned int SocketLocalPortWithJavaIoFileDescriptor = a3;
  LibcoreIoIoBridge_bindWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_((uint64_t)self->super.fd_, (JavaNetInet6Address *)a4, *(uint64_t *)&a3);
  if (!SocketLocalPortWithJavaIoFileDescriptor) {
    unsigned int SocketLocalPortWithJavaIoFileDescriptor = LibcoreIoIoBridge_getSocketLocalPortWithJavaIoFileDescriptor_((uint64_t)self->super.fd_);
  }
  self->super.localPort_ = SocketLocalPortWithJavaIoFileDescriptor;
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [(JavaNetPlainDatagramSocketImpl *)self setOptionWithInt:32 withId:JavaLangBoolean_TRUE__];
}

- (void)close
{
  objc_sync_enter(self);
  v3 = *(void **)&self->isNativeConnected_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 close];
  LibcoreIoIoBridge_closeSocketWithJavaIoFileDescriptor_(self->super.fd_);
  objc_sync_exit(self);
}

- (void)create
{
  p_fd = &self->super.fd_;
  id v3 = LibcoreIoIoBridge_socketWithBoolean_(0);
  JreStrongAssign((id *)p_fd, v3);
}

- (void)dealloc
{
  id v3 = *(void **)&self->isNativeConnected_;
  if (v3) {
    [v3 warnIfOpen];
  }
  [(JavaNetPlainDatagramSocketImpl *)self close];

  v4.receiver = self;
  v4.super_class = (Class)JavaNetPlainDatagramSocketImpl;
  [(JavaNetDatagramSocketImpl *)&v4 dealloc];
}

- (id)getOptionWithInt:(int)a3
{
  return LibcoreIoIoBridge_getSocketOptionWithJavaIoFileDescriptor_withInt_((uint64_t)self->super.fd_, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (int)getTimeToLive
{
  id v2 = [(JavaNetPlainDatagramSocketImpl *)self getOptionWithInt:17];
  objc_opt_class();
  if (!v2) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v2 intValue];
}

- (char)getTTL
{
  return [(JavaNetPlainDatagramSocketImpl *)self getTimeToLive];
}

+ (id)makeGroupReqWithJavaNetInetAddress:(id)a3 withJavaNetNetworkInterface:(id)a4
{
  return sub_10029D768(a3, a4);
}

- (void)joinWithJavaNetInetAddress:(id)a3
{
  uint64_t v4 = new_LibcoreIoStructGroupReq_initWithInt_withJavaNetInetAddress_(0, a3);
  [(JavaNetPlainDatagramSocketImpl *)self setOptionWithInt:19 withId:v4];
}

- (void)joinGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    uint64_t v7 = sub_10029D768([a3 getAddress], a4);
    [(JavaNetPlainDatagramSocketImpl *)self setOptionWithInt:19 withId:v7];
  }
}

- (void)leaveWithJavaNetInetAddress:(id)a3
{
  uint64_t v4 = new_LibcoreIoStructGroupReq_initWithInt_withJavaNetInetAddress_(0, a3);
  [(JavaNetPlainDatagramSocketImpl *)self setOptionWithInt:20 withId:v4];
}

- (void)leaveGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    uint64_t v7 = sub_10029D768([a3 getAddress], a4);
    [(JavaNetPlainDatagramSocketImpl *)self setOptionWithInt:20 withId:v7];
  }
}

- (int)peekWithJavaNetInetAddress:(id)a3
{
  if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = new_JavaNetDatagramPacket_initWithByteArray_withInt_(LibcoreUtilEmptyArray_BYTE_, 0);
  unsigned int v6 = [(JavaNetPlainDatagramSocketImpl *)self peekDataWithJavaNetDatagramPacket:v5];
  if (!a3 || (int v7 = v6, (v8 = [(JavaNetDatagramPacket *)v5 getAddress]) == 0)) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)a3 + 1, [v8 getAddress]);
  return v7;
}

- (void)doRecvWithJavaNetDatagramPacket:(id)a3 withInt:(int)a4
{
}

- (void)receiveWithJavaNetDatagramPacket:(id)a3
{
}

- (int)peekDataWithJavaNetDatagramPacket:(id)a3
{
  sub_10029DA60((uint64_t)self, a3, 2);
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 getPort];
}

- (void)sendWithJavaNetDatagramPacket:(id)a3
{
  uint64_t v5 = (unsigned __int8 *)(&self->super.localPort_ + 1);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->super.localPort_ + 4);
  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    if (!a3) {
      goto LABEL_13;
    }
    int v7 = [a3 getPort];
  }
  unsigned __int8 v8 = atomic_load(v5);
  if ((v8 & 1) == 0)
  {
    if (a3)
    {
      id v9 = [a3 getAddress];
      goto LABEL_10;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_13;
  }
  id v9 = 0;
LABEL_10:
  fd = self->super.fd_;
  id v11 = [a3 getData];
  id v12 = [a3 getOffset];
  id v13 = [a3 getLength];
  LibcoreIoIoBridge_sendtoWithJavaIoFileDescriptor_withByteArray_withInt_withInt_withInt_withJavaNetInetAddress_withInt_((uint64_t)fd, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, 0, (uint64_t)v9, v7);
}

- (void)setOptionWithInt:(int)a3 withId:(id)a4
{
  LibcoreIoIoBridge_setSocketOptionWithJavaIoFileDescriptor_withInt_withId_((uint64_t)self->super.fd_, *(uint64_t *)&a3, a4, (uint64_t)a4, v4, v5, v6, v7);
}

- (void)setTimeToLiveWithInt:(int)a3
{
  uint64_t v4 = JavaLangInteger_valueOfWithInt_(a3);
  [(JavaNetPlainDatagramSocketImpl *)self setOptionWithInt:17 withId:v4];
}

- (void)setTTLWithByte:(char)a3
{
}

- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  LibcoreIoIoBridge_connectWithJavaIoFileDescriptor_withJavaNetInetAddress_withInt_((uint64_t)self->super.fd_, (uint64_t)a3, *(uint64_t *)&a4);
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v7 = JavaNetInetAddress_getByAddressWithByteArray_([a3 getAddress]);
  JreStrongAssign((id *)&self->guard_, v7);
  LODWORD(self->connectedAddress_) = a4;
  atomic_store(1u, (unsigned __int8 *)&self->super.localPort_ + 4);
}

- (void)disconnect
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = (void *)LibcoreIoLibcore_os_;
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  fd = self->super.fd_;
  if ((atomic_load_explicit(JavaNetInetAddress__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  [v3 connectWithJavaIoFileDescriptor:fd withJavaNetInetAddress:JavaNetInetAddress_UNSPECIFIED_ withInt:0];
  LODWORD(self->connectedAddress_) = -1;
  JreStrongAssign((id *)&self->guard_, 0);
  atomic_store(0, (unsigned __int8 *)&self->super.localPort_ + 4);
}

- (void)updatePacketRecvAddressWithJavaNetDatagramPacket:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 setAddressWithJavaNetInetAddress:self->guard_];
  uint64_t connectedAddress_low = LODWORD(self->connectedAddress_);
  [a3 setPortWithInt:connectedAddress_low];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048A1D0;
}

@end