@interface JavaNioChannelsSpiAbstractSelector_WakeUpTask
+ (const)__metadata;
- (JavaNioChannelsSpiAbstractSelector_WakeUpTask)initWithJavaNioChannelsSpiAbstractSelector:(id)a3;
- (void)__javaClone;
- (void)run;
@end

@implementation JavaNioChannelsSpiAbstractSelector_WakeUpTask

- (void)run
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak wakeup];
}

- (JavaNioChannelsSpiAbstractSelector_WakeUpTask)initWithJavaNioChannelsSpiAbstractSelector:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSpiAbstractSelector_WakeUpTask;
  [(JavaNioChannelsSpiAbstractSelector_WakeUpTask *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100462A80;
}

- (void).cxx_destruct
{
}

@end