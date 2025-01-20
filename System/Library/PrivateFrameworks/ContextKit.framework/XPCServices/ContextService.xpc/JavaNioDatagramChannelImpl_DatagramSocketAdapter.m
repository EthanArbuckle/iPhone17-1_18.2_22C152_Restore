@interface JavaNioDatagramChannelImpl_DatagramSocketAdapter
+ (const)__metadata;
- (JavaNioDatagramChannelImpl_DatagramSocketAdapter)initWithJavaNetDatagramSocketImpl:(id)a3 withJavaNioDatagramChannelImpl:(id)a4;
- (id)getChannel;
- (void)__javaClone;
- (void)bindWithJavaNetSocketAddress:(id)a3;
- (void)close;
- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (void)connectWithJavaNetSocketAddress:(id)a3;
- (void)disconnect;
- (void)receiveWithJavaNetDatagramPacket:(id)a3;
- (void)sendWithJavaNetDatagramPacket:(id)a3;
@end

@implementation JavaNioDatagramChannelImpl_DatagramSocketAdapter

- (JavaNioDatagramChannelImpl_DatagramSocketAdapter)initWithJavaNetDatagramSocketImpl:(id)a3 withJavaNioDatagramChannelImpl:(id)a4
{
  return self;
}

- (id)getChannel
{
  return objc_loadWeak((id *)&self->channelImpl_);
}

- (void)bindWithJavaNetSocketAddress:(id)a3
{
  p_channelImpl = &self->channelImpl_;
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  if ([Weak isConnected])
  {
    v7 = new_JavaNioChannelsAlreadyConnectedException_init();
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNetDatagramSocket *)&v8 bindWithJavaNetSocketAddress:a3];
  [objc_loadWeak((id *)p_channelImpl) onBindWithBoolean:0];
}

- (void)connectWithJavaNetSocketAddress:(id)a3
{
  if ([(JavaNetDatagramSocket *)self isConnected])
  {
    v7 = new_JavaLangIllegalStateException_initWithNSString_(@"Socket is already connected.");
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNetDatagramSocket *)&v8 connectWithJavaNetSocketAddress:a3];
  p_channelImpl = &self->channelImpl_;
  id Weak = objc_loadWeak((id *)p_channelImpl);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  [Weak onBindWithBoolean:0];
  objc_opt_class();
  if (!a3)
  {
    objc_loadWeak((id *)p_channelImpl);
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  objc_msgSend(objc_loadWeak((id *)p_channelImpl), "onConnectWithJavaNetInetAddress:withInt:withBoolean:", objc_msgSend(a3, "getAddress"), objc_msgSend(a3, "getPort"), 0);
}

- (void)connectWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
}

- (void)receiveWithJavaNetDatagramPacket:(id)a3
{
  p_channelImpl = &self->channelImpl_;
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  if (([Weak isBlocking] & 1) == 0)
  {
    objc_super v8 = new_JavaNioChannelsIllegalBlockingModeException_init();
    objc_exception_throw(v8);
  }
  unsigned __int8 v7 = [(JavaNetDatagramSocket *)self isBound];
  v9.receiver = self;
  v9.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNetDatagramSocket *)&v9 receiveWithJavaNetDatagramPacket:a3];
  if ((v7 & 1) == 0) {
    [objc_loadWeak((id *)p_channelImpl) onBindWithBoolean:0];
  }
}

- (void)sendWithJavaNetDatagramPacket:(id)a3
{
  p_channelImpl = &self->channelImpl_;
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  if (([Weak isBlocking] & 1) == 0)
  {
    objc_super v8 = new_JavaNioChannelsIllegalBlockingModeException_init();
    objc_exception_throw(v8);
  }
  unsigned __int8 v7 = [(JavaNetDatagramSocket *)self isBound];
  v9.receiver = self;
  v9.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNetDatagramSocket *)&v9 sendWithJavaNetDatagramPacket:a3];
  if ((v7 & 1) == 0) {
    [objc_loadWeak((id *)p_channelImpl) onBindWithBoolean:0];
  }
}

- (void)close
{
  p_channelImpl = &self->channelImpl_;
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNetDatagramSocket *)&v6 close];
  id v5 = objc_loadWeak((id *)p_channelImpl);
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ([v5 isOpen]) {
    [objc_loadWeak((id *)p_channelImpl) close];
  }
  objc_sync_exit(Weak);
}

- (void)disconnect
{
  v4.receiver = self;
  v4.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNetDatagramSocket *)&v4 disconnect];
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  [Weak onDisconnectWithBoolean:0];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioDatagramChannelImpl_DatagramSocketAdapter;
  [(JavaNioDatagramChannelImpl_DatagramSocketAdapter *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100405B50;
}

- (void).cxx_destruct
{
}

@end