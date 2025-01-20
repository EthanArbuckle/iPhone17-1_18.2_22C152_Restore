@interface JavaNioSocketChannelImpl_SocketAdapter
+ (const)__metadata;
- (JavaNioSocketChannelImpl_SocketAdapter)initWithJavaNetPlainSocketImpl:(id)a3 withJavaNioSocketChannelImpl:(id)a4;
- (id)getChannel;
- (id)getFileDescriptor$;
- (id)getInputStream;
- (id)getOutputStream;
- (void)__javaClone;
- (void)bindWithJavaNetSocketAddress:(id)a3;
- (void)close;
- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
@end

@implementation JavaNioSocketChannelImpl_SocketAdapter

- (JavaNioSocketChannelImpl_SocketAdapter)initWithJavaNetPlainSocketImpl:(id)a3 withJavaNioSocketChannelImpl:(id)a4
{
  return self;
}

- (id)getChannel
{
  return objc_loadWeak((id *)&self->channel_);
}

- (void)connectWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_channel = &self->channel_;
  id Weak = objc_loadWeak((id *)&self->channel_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  if (([Weak isBlocking] & 1) == 0)
  {
    v9 = new_JavaNioChannelsIllegalBlockingModeException_init();
    goto LABEL_13;
  }
  if ([(JavaNetSocket *)self isConnected])
  {
    v9 = new_JavaNioChannelsAlreadyConnectedException_init();
LABEL_13:
    objc_exception_throw(v9);
  }
  v11.receiver = self;
  v11.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  [(JavaNetSocket *)&v11 connectWithJavaNetSocketAddress:a3 withInt:v4];
  [objc_loadWeak((id *)p_channel) onBindWithBoolean:0];
  v10.receiver = self;
  v10.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  if ([(JavaNetSocket *)&v10 isConnected])
  {
    objc_opt_class();
    if (a3)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    [objc_loadWeak((id *)p_channel) onConnectStatusChangedWithJavaNetInetSocketAddress:a3 withInt:2 withBoolean:0];
  }
}

- (void)bindWithJavaNetSocketAddress:(id)a3
{
  p_channel = &self->channel_;
  id Weak = objc_loadWeak((id *)&self->channel_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  if ([Weak isConnected])
  {
    v7 = new_JavaNioChannelsAlreadyConnectedException_init();
    goto LABEL_8;
  }
  if (*(_DWORD *)((char *)objc_loadWeak((id *)p_channel) + 91) == 1)
  {
    v7 = new_JavaNioChannelsConnectionPendingException_init();
LABEL_8:
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  [(JavaNetSocket *)&v8 bindWithJavaNetSocketAddress:a3];
  [objc_loadWeak((id *)p_channel) onBindWithBoolean:0];
}

- (void)close
{
  p_channel = &self->channel_;
  id Weak = objc_loadWeak((id *)&self->channel_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  [(JavaNetSocket *)&v6 close];
  id v5 = objc_loadWeak((id *)p_channel);
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ([v5 isOpen]) {
    [objc_loadWeak((id *)p_channel) close];
  }
  objc_sync_exit(Weak);
}

- (id)getOutputStream
{
  v7.receiver = self;
  v7.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  id v3 = [(JavaNetSocket *)&v7 getOutputStream];
  id Weak = objc_loadWeak((id *)&self->channel_);
  id v5 = [JavaNioSocketChannelImpl_BlockingCheckOutputStream alloc];
  JavaIoFilterOutputStream_initWithJavaIoOutputStream_((uint64_t)v5, v3);
  JreStrongAssign((id *)&v5->channel_, Weak);
  return v5;
}

- (id)getInputStream
{
  v7.receiver = self;
  v7.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  id v3 = [(JavaNetSocket *)&v7 getInputStream];
  id Weak = objc_loadWeak((id *)&self->channel_);
  id v5 = [JavaNioSocketChannelImpl_BlockingCheckInputStream alloc];
  JavaIoFilterInputStream_initWithJavaIoInputStream_((uint64_t)v5, v3);
  JreStrongAssign((id *)&v5->channel_, Weak);
  return v5;
}

- (id)getFileDescriptor$
{
  id Weak = objc_loadWeak((id *)&self->socketImpl_);
  if (!Weak) {
    JreThrowNullPointerException();
  }
  return [Weak getFD$];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSocketChannelImpl_SocketAdapter;
  [(JavaNioSocketChannelImpl_SocketAdapter *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043B0D8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->socketImpl_);
  objc_destroyWeak((id *)&self->channel_);
}

@end