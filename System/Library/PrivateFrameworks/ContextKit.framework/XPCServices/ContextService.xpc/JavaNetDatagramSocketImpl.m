@interface JavaNetDatagramSocketImpl
+ (const)__metadata;
+ (id)__annotations_getTTL;
+ (id)__annotations_setTTLWithByte_;
- (JavaNetDatagramSocketImpl)init;
- (char)getTTL;
- (id)getFileDescriptor;
- (int)getLocalPort;
- (int)getTimeToLive;
- (int)peekDataWithJavaNetDatagramPacket:(id)a3;
- (int)peekWithJavaNetInetAddress:(id)a3;
- (void)bindWithInt:(int)a3 withJavaNetInetAddress:(id)a4;
- (void)close;
- (void)create;
- (void)dealloc;
- (void)joinGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4;
- (void)joinWithJavaNetInetAddress:(id)a3;
- (void)leaveGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4;
- (void)leaveWithJavaNetInetAddress:(id)a3;
- (void)receiveWithJavaNetDatagramPacket:(id)a3;
- (void)sendWithJavaNetDatagramPacket:(id)a3;
- (void)setTTLWithByte:(char)a3;
- (void)setTimeToLiveWithInt:(int)a3;
@end

@implementation JavaNetDatagramSocketImpl

- (JavaNetDatagramSocketImpl)init
{
  self->localPort_ = -1;
  return self;
}

- (void)bindWithInt:(int)a3 withJavaNetInetAddress:(id)a4
{
}

- (void)close
{
}

- (void)create
{
}

- (id)getFileDescriptor
{
  return self->fd_;
}

- (int)getLocalPort
{
  return self->localPort_;
}

- (char)getTTL
{
  return 0;
}

- (int)getTimeToLive
{
  return 0;
}

- (void)joinWithJavaNetInetAddress:(id)a3
{
}

- (void)joinGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4
{
}

- (void)leaveWithJavaNetInetAddress:(id)a3
{
}

- (void)leaveGroupWithJavaNetSocketAddress:(id)a3 withJavaNetNetworkInterface:(id)a4
{
}

- (int)peekWithJavaNetInetAddress:(id)a3
{
  return 0;
}

- (void)receiveWithJavaNetDatagramPacket:(id)a3
{
}

- (void)sendWithJavaNetDatagramPacket:(id)a3
{
}

- (void)setTimeToLiveWithInt:(int)a3
{
}

- (void)setTTLWithByte:(char)a3
{
}

- (int)peekDataWithJavaNetDatagramPacket:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetDatagramSocketImpl;
  [(JavaNetDatagramSocketImpl *)&v3 dealloc];
}

+ (id)__annotations_getTTL
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setTTLWithByte_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044D0F0;
}

@end