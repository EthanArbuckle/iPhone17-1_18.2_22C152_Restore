@interface JavaUtilConcurrentLocksAbstractOwnableSynchronizer
+ (const)__metadata;
- (id)getExclusiveOwnerThread;
- (void)dealloc;
- (void)setExclusiveOwnerThreadWithJavaLangThread:(id)a3;
@end

@implementation JavaUtilConcurrentLocksAbstractOwnableSynchronizer

- (void)setExclusiveOwnerThreadWithJavaLangThread:(id)a3
{
}

- (id)getExclusiveOwnerThread
{
  return self->exclusiveOwnerThread_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentLocksAbstractOwnableSynchronizer;
  [(JavaUtilConcurrentLocksAbstractOwnableSynchronizer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100415F90;
}

@end