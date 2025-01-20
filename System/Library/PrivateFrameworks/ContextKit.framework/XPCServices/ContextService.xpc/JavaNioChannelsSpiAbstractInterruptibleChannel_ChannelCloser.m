@interface JavaNioChannelsSpiAbstractInterruptibleChannel_ChannelCloser
+ (const)__metadata;
- (JavaNioChannelsSpiAbstractInterruptibleChannel_ChannelCloser)initWithJavaNioChannelsSpiAbstractInterruptibleChannel:(id)a3;
- (void)__javaClone;
- (void)run;
@end

@implementation JavaNioChannelsSpiAbstractInterruptibleChannel_ChannelCloser

- (void)run
{
  v2 = &self->this$0_;
  atomic_store(1u, (unsigned __int8 *)objc_loadWeak((id *)&self->this$0_) + 8);
  Weak = (unsigned __int8 *)objc_loadWeak((id *)v2);
  sub_100256E38(Weak);
}

- (JavaNioChannelsSpiAbstractInterruptibleChannel_ChannelCloser)initWithJavaNioChannelsSpiAbstractInterruptibleChannel:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSpiAbstractInterruptibleChannel_ChannelCloser;
  [(JavaNioChannelsSpiAbstractInterruptibleChannel_ChannelCloser *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004677B0;
}

- (void).cxx_destruct
{
}

@end