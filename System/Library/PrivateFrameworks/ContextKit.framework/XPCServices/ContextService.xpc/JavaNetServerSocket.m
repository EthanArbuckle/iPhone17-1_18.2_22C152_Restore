@interface JavaNetServerSocket
+ (const)__metadata;
+ (void)setSocketFactoryWithJavaNetSocketImplFactory:(id)a3;
- (BOOL)getReuseAddress;
- (BOOL)isBound;
- (BOOL)isClosed;
- (JavaNetServerSocket)init;
- (JavaNetServerSocket)initWithInt:(int)a3;
- (JavaNetServerSocket)initWithInt:(int)a3 withInt:(int)a4;
- (JavaNetServerSocket)initWithInt:(int)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5;
- (NSString)description;
- (id)accept;
- (id)checkOpen;
- (id)getChannel;
- (id)getImpl$;
- (id)getInetAddress;
- (id)getLocalSocketAddress;
- (int)getLocalPort;
- (int)getReceiveBufferSize;
- (int)getSoTimeout;
- (void)bindWithJavaNetSocketAddress:(id)a3;
- (void)bindWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
- (void)checkListenWithInt:(int)a3;
- (void)close;
- (void)dealloc;
- (void)implAcceptWithJavaNetSocket:(id)a3;
- (void)setReceiveBufferSizeWithInt:(int)a3;
- (void)setReuseAddressWithBoolean:(BOOL)a3;
- (void)setSoTimeoutWithInt:(int)a3;
@end

@implementation JavaNetServerSocket

- (id)getImpl$
{
  return self->impl_;
}

- (JavaNetServerSocket)init
{
  return self;
}

- (JavaNetServerSocket)initWithInt:(int)a3
{
  JavaNetServerSocket_initWithInt_((id *)&self->super.isa, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

- (JavaNetServerSocket)initWithInt:(int)a3 withInt:(int)a4
{
  JavaNetServerSocket_initWithInt_withInt_((id *)&self->super.isa, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (JavaNetServerSocket)initWithInt:(int)a3 withInt:(int)a4 withJavaNetInetAddress:(id)a5
{
  JavaNetServerSocket_initWithInt_withInt_withJavaNetInetAddress_((id *)&self->super.isa, *(uint64_t *)&a3, *(uint64_t *)&a4, (uint64_t)a5, (uint64_t)a5, v5, v6, v7);
  return self;
}

- (id)accept
{
  -[JavaNetServerSocket checkOpen]_0(self);
  if (![(JavaNetServerSocket *)self isBound])
  {
    uint64_t v5 = new_JavaNetSocketException_initWithNSString_(@"Socket is not bound");
    objc_exception_throw(v5);
  }
  uint64_t v3 = new_JavaNetSocket_init();
  sub_10020C204(self, v3);
  return v3;
}

- (id)checkOpen
{
  id result = [a1 isClosed];
  if (result)
  {
    v2 = new_JavaNetSocketException_initWithNSString_(@"Socket is closed");
    objc_exception_throw(v2);
  }
  return result;
}

- (void)checkListenWithInt:(int)a3
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
  [(JavaNetSocketImpl *)impl close];
}

- (id)getInetAddress
{
  if ([(JavaNetServerSocket *)self isBound]) {
    return self->localAddress_;
  }
  else {
    return 0;
  }
}

- (int)getLocalPort
{
  if (![(JavaNetServerSocket *)self isBound]) {
    return -1;
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetSocketImpl *)impl getLocalPort];
}

- (int)getSoTimeout
{
  objc_sync_enter(self);
  -[JavaNetServerSocket checkOpen]_0(self);
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

- (void)implAcceptWithJavaNetSocket:(id)a3
{
}

+ (void)setSocketFactoryWithJavaNetSocketImplFactory:(id)a3
{
}

- (void)setSoTimeoutWithInt:(int)a3
{
  objc_sync_enter(self);
  -[JavaNetServerSocket checkOpen]_0(self);
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

- (NSString)description
{
  uint64_t v3 = new_JavaLangStringBuilder_initWithInt_(0x40u);
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"ServerSocket["];
  if ([(JavaNetServerSocket *)self isBound])
  {
    id v4 = [(JavaLangStringBuilder *)v3 appendWithNSString:@"addr="];
    if (!v4) {
      goto LABEL_16;
    }
    int v5 = v4;
    id v6 = [(JavaNetServerSocket *)self getInetAddress];
    if (!v6
      || (id v7 = objc_msgSend(v5, "appendWithNSString:", objc_msgSend(v6, "getHostName"))) == 0
      || (id v8 = [v7 appendWithNSString:@"/"]) == 0
      || (v9 = v8, (id v10 = [(JavaNetServerSocket *)self getInetAddress]) == 0)
      || (id v11 = objc_msgSend(v9, "appendWithNSString:", objc_msgSend(v10, "getHostAddress"))) == 0
      || (id v12 = [v11 appendWithNSString:@",port=0,localport="]) == 0
      || (v13 = (JavaLangStringBuilder *)objc_msgSend(v12, "appendWithInt:", -[JavaNetServerSocket getLocalPort](self, "getLocalPort"))) == 0)
    {
LABEL_16:
      JreThrowNullPointerException();
    }
    CFStringRef v14 = @"]";
  }
  else
  {
    CFStringRef v14 = @"unbound]";
    v13 = v3;
  }
  id v15 = [(JavaLangStringBuilder *)v13 appendWithNSString:v14];
  if (!v15) {
    goto LABEL_16;
  }
  return (NSString *)[v15 description];
}

- (void)bindWithJavaNetSocketAddress:(id)a3
{
}

- (void)bindWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
  -[JavaNetServerSocket checkOpen]_0(self);
  if ([(JavaNetServerSocket *)self isBound])
  {
    id v12 = new_JavaNetBindException_initWithNSString_(@"Socket is already bound");
    goto LABEL_22;
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
      id v7 = [a3 getAddress];
      if (v7)
      {
        uint64_t v8 = (uint64_t)v7;
        id v9 = [a3 getPort];
        goto LABEL_10;
      }
      [a3 getHostName];
      CFStringRef v28 = JreStrcat("$$", v21, v22, v23, v24, v25, v26, v27, @"Host is unresolved: ");
      id v12 = new_JavaNetSocketException_initWithNSString_((uint64_t)v28);
    }
    else
    {
      [a3 getClass];
      CFStringRef v20 = JreStrcat("$@", v13, v14, v15, v16, v17, v18, v19, @"Local address not an InetSocketAddress: ");
      id v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v20);
    }
LABEL_22:
    objc_exception_throw(v12);
  }
  if ((atomic_load_explicit(JavaNetInet4Address__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v9 = 0;
  uint64_t v8 = JavaNetInet4Address_ANY_;
LABEL_10:
  objc_sync_enter(self);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  [(JavaNetSocketImpl *)impl bindWithJavaNetInetAddress:v8 withInt:v9];
  sub_10020C0E0((uint64_t)self);
  if (a4 <= 0) {
    uint64_t v11 = 50;
  }
  else {
    uint64_t v11 = a4;
  }
  [(JavaNetSocketImpl *)self->impl_ listenWithInt:v11];
  objc_sync_exit(self);
}

- (id)getLocalSocketAddress
{
  if (![(JavaNetServerSocket *)self isBound]) {
    return 0;
  }
  uint64_t v3 = new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_(self->localAddress_, [(JavaNetServerSocket *)self getLocalPort]);
  return v3;
}

- (BOOL)isBound
{
  return self->isBound_;
}

- (BOOL)isClosed
{
  return self->isClosed_;
}

- (void)setReuseAddressWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  -[JavaNetServerSocket checkOpen]_0(self);
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangBoolean_valueOfWithBoolean_(v3);
  [(JavaNetSocketImpl *)impl setOptionWithInt:4 withId:v6];
}

- (BOOL)getReuseAddress
{
  -[JavaNetServerSocket checkOpen]_0(self);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 BOOLeanValue];
}

- (void)setReceiveBufferSizeWithInt:(int)a3
{
  -[JavaNetServerSocket checkOpen]_0(self);
  if (a3 <= 0)
  {
    id v7 = new_JavaLangIllegalArgumentException_initWithNSString_(@"size < 1");
    objc_exception_throw(v7);
  }
  impl = self->impl_;
  if (!impl) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = JavaLangInteger_valueOfWithInt_(a3);
  [(JavaNetSocketImpl *)impl setOptionWithInt:4098 withId:v6];
}

- (int)getReceiveBufferSize
{
  -[JavaNetServerSocket checkOpen]_0(self);
  impl = self->impl_;
  if (!impl || (id v4 = [(JavaNetSocketImpl *)impl getOptionWithInt:4098], objc_opt_class(), !v4)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [v4 intValue];
}

- (id)getChannel
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetServerSocket;
  [(JavaNetServerSocket *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100445960;
}

@end