@interface JavaNioServerSocketChannelImpl_ServerSocketAdapter
+ (const)__metadata;
- (JavaNioServerSocketChannelImpl_ServerSocketAdapter)initWithJavaNioServerSocketChannelImpl:(id)a3;
- (id)accept;
- (id)getChannel;
- (id)getFD$;
- (id)implAcceptWithJavaNioSocketChannelImpl:(id)a3;
- (void)__javaClone;
- (void)close;
@end

@implementation JavaNioServerSocketChannelImpl_ServerSocketAdapter

- (JavaNioServerSocketChannelImpl_ServerSocketAdapter)initWithJavaNioServerSocketChannelImpl:(id)a3
{
  return self;
}

- (id)accept
{
  if (![(JavaNetServerSocket *)self isBound]) {
    goto LABEL_8;
  }
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  id v4 = [Weak accept];
  if (!v4)
  {
LABEL_8:
    v6 = new_JavaNioChannelsIllegalBlockingModeException_init();
    objc_exception_throw(v6);
  }
  return [v4 socket];
}

- (id)implAcceptWithJavaNioSocketChannelImpl:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 socket];
  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)JavaNioServerSocketChannelImpl_ServerSocketAdapter;
  [(JavaNetServerSocket *)&v7 implAcceptWithJavaNetSocket:v5];
  if (!v5) {
    JreThrowNullPointerException();
  }
  objc_msgSend(a3, "onAcceptWithJavaNetInetSocketAddress:withBoolean:", new_JavaNetInetSocketAddress_initWithJavaNetInetAddress_withInt_(objc_msgSend(v5, "getInetAddress"), objc_msgSend(v5, "getPort")), 0);
  objc_sync_exit(self);
  return v5;
}

- (id)getChannel
{
  return objc_loadWeak((id *)&self->channelImpl_);
}

- (void)close
{
  p_channelImpl = &self->channelImpl_;
  id Weak = objc_loadWeak((id *)&self->channelImpl_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaNioServerSocketChannelImpl_ServerSocketAdapter;
  [(JavaNetServerSocket *)&v6 close];
  id v5 = objc_loadWeak((id *)p_channelImpl);
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ([v5 isOpen]) {
    [objc_loadWeak((id *)p_channelImpl) close];
  }
  objc_sync_exit(Weak);
}

- (id)getFD$
{
  v4.receiver = self;
  v4.super_class = (Class)JavaNioServerSocketChannelImpl_ServerSocketAdapter;
  id v2 = [(JavaNetServerSocket *)&v4 getImpl$];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getFD$];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioServerSocketChannelImpl_ServerSocketAdapter;
  [(JavaNioServerSocketChannelImpl_ServerSocketAdapter *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004018E0;
}

- (void).cxx_destruct
{
}

@end