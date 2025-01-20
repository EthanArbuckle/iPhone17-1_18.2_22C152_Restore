@interface JavaUtilWeakHashMap_ValuesCollection
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilWeakHashMap_ValuesCollection)initWithJavaUtilWeakHashMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilWeakHashMap_ValuesCollection

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

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak containsValueWithId:a3];
}

- (id)iterator
{
  id Weak = (unsigned int *)objc_loadWeak((id *)&self->this$0_);
  v3 = new_JavaUtilWeakHashMap_HashIterator_initWithJavaUtilWeakHashMap_withJavaUtilWeakHashMap_Entry_Type_(Weak, [JavaUtilWeakHashMap_ValuesCollection__1 alloc]);
  return v3;
}

- (JavaUtilWeakHashMap_ValuesCollection)initWithJavaUtilWeakHashMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractCollection_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilWeakHashMap_ValuesCollection;
  [(JavaUtilWeakHashMap_ValuesCollection *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FDFF0;
}

- (void).cxx_destruct
{
}

@end