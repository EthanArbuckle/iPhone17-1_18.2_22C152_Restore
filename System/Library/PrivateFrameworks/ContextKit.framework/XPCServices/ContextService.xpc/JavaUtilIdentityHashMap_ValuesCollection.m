@interface JavaUtilIdentityHashMap_ValuesCollection
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilIdentityHashMap_ValuesCollection)initWithJavaUtilIdentityHashMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilIdentityHashMap_ValuesCollection

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak containsValueWithId:a3];
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

- (id)iterator
{
  v3 = [JavaUtilIdentityHashMap_ValuesCollection__1 alloc];
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v5 = [JavaUtilIdentityHashMap_IdentityHashMapIterator alloc];
  JavaUtilIdentityHashMap_IdentityHashMapIterator_initWithJavaUtilMapEntry_Type_withJavaUtilIdentityHashMap_((uint64_t)v5, v3, Weak);
  return v5;
}

- (BOOL)removeWithId:(id)a3
{
  id v4 = [(JavaUtilIdentityHashMap_ValuesCollection *)self iterator];
  if (!v4) {
    JreThrowNullPointerException();
  }
  v5 = v4;
  while (1)
  {
    unsigned __int8 v6 = [v5 hasNext];
    if ((v6 & 1) == 0) {
      break;
    }
    if ([v5 next] == a3)
    {
      [v5 remove];
      return v6;
    }
  }
  return v6;
}

- (JavaUtilIdentityHashMap_ValuesCollection)initWithJavaUtilIdentityHashMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractCollection_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap_ValuesCollection;
  [(JavaUtilIdentityHashMap_ValuesCollection *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100474140;
}

- (void).cxx_destruct
{
}

@end