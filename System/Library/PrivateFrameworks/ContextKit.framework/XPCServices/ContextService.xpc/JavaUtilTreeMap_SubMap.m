@interface JavaUtilTreeMap_SubMap
+ (const)__metadata;
- (JavaUtilTreeMap_SubMap)initWithJavaUtilTreeMap:(id)a3;
- (id)entrySet;
- (id)readResolve;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_SubMap

- (id)entrySet
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)readResolve
{
  BOOL fromStart = self->fromStart_;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v4 = JavaUtilTreeMap_BoundEnum_values_[0];
  uint64_t v5 = qword_100563F20;
  BOOL toEnd = self->toEnd_;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (fromStart) {
    v7 = (void *)v5;
  }
  else {
    v7 = (void *)v4;
  }
  v8 = &qword_100563F18;
  if (toEnd) {
    v8 = &qword_100563F20;
  }
  v9 = (void *)*v8;
  v10 = self->this$0_;
  id fromKey = self->fromKey_;
  id toKey = self->toKey_;
  v13 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v13, v10, 1, fromKey, v7, toKey, v9);
  return v13;
}

- (JavaUtilTreeMap_SubMap)initWithJavaUtilTreeMap:(id)a3
{
  JreStrongAssign((id *)&self->this$0_, a3);
  JavaUtilAbstractMap_init(self, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_SubMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100439290;
}

@end