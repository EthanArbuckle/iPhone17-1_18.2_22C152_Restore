@interface JavaUtilEventListenerProxy
+ (const)__metadata;
- (JavaUtilEventListenerProxy)initWithJavaUtilEventListener:(id)a3;
- (id)getListener;
- (void)dealloc;
@end

@implementation JavaUtilEventListenerProxy

- (JavaUtilEventListenerProxy)initWithJavaUtilEventListener:(id)a3
{
  return self;
}

- (id)getListener
{
  return self->listener_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilEventListenerProxy;
  [(JavaUtilEventListenerProxy *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047F3E8;
}

@end