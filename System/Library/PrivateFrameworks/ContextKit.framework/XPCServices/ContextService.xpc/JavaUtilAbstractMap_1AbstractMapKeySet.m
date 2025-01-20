@interface JavaUtilAbstractMap_1AbstractMapKeySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilAbstractMap_1AbstractMapKeySet)initWithJavaUtilAbstractMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
@end

@implementation JavaUtilAbstractMap_1AbstractMapKeySet

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

- (id)iterator
{
  v3 = [JavaUtilAbstractMap_1AbstractMapKeySet__1 alloc];
  sub_10018CD60((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (JavaUtilAbstractMap_1AbstractMapKeySet)initWithJavaUtilAbstractMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilAbstractMap_1AbstractMapKeySet;
  [(JavaUtilAbstractMap_1AbstractMapKeySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040C950;
}

- (void).cxx_destruct
{
}

@end