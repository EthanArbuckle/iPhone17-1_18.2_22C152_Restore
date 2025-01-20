@interface JavaUtilIdentityHashMap_KeySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilIdentityHashMap_KeySet)initWithJavaUtilIdentityHashMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilIdentityHashMap_KeySet

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak containsKeyWithId:a3];
}

- (int)size
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak size];
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (BOOL)removeWithId:(id)a3
{
  v4 = &self->this$0_;
  unsigned int v5 = [objc_loadWeak((id *)&self->this$0_) containsKeyWithId:a3];
  if (v5) {
    [objc_loadWeak((id *)v4) removeWithId:a3];
  }
  return v5;
}

- (id)iterator
{
  v3 = [JavaUtilIdentityHashMap_KeySet__1 alloc];
  id Weak = objc_loadWeak((id *)&self->this$0_);
  unsigned int v5 = [JavaUtilIdentityHashMap_IdentityHashMapIterator alloc];
  JavaUtilIdentityHashMap_IdentityHashMapIterator_initWithJavaUtilMapEntry_Type_withJavaUtilIdentityHashMap_((uint64_t)v5, v3, Weak);
  return v5;
}

- (JavaUtilIdentityHashMap_KeySet)initWithJavaUtilIdentityHashMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap_KeySet;
  [(JavaUtilIdentityHashMap_KeySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100473E98;
}

- (void).cxx_destruct
{
}

@end