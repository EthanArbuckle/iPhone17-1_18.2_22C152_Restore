@interface JavaUtilTreeMap_NavigableSubMap
+ (const)__metadata;
- (JavaUtilTreeMap_NavigableSubMap)initWithJavaUtilTreeMap:(id)a3 withId:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5 withId:(id)a6 withJavaUtilTreeMap_BoundEnum:(id)a7;
- (id)entrySet;
- (id)readResolve;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_NavigableSubMap

- (JavaUtilTreeMap_NavigableSubMap)initWithJavaUtilTreeMap:(id)a3 withId:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5 withId:(id)a6 withJavaUtilTreeMap_BoundEnum:(id)a7
{
  return self;
}

- (id)entrySet
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)readResolve
{
  if (self->fromStart_)
  {
    v3 = &qword_100563F20;
    if (atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire)) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  BOOL loInclusive = self->loInclusive_;
  unsigned __int8 explicit = atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire);
  if (loInclusive) {
    v3 = JavaUtilTreeMap_BoundEnum_values_;
  }
  else {
    v3 = &qword_100563F18;
  }
  if ((explicit & 1) == 0) {
LABEL_12:
  }
    objc_opt_class();
LABEL_3:
  v4 = (void *)*v3;
  if (self->toEnd_)
  {
    v5 = &qword_100563F20;
    if (atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire)) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL hiInclusive = self->hiInclusive_;
    unsigned __int8 v16 = atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire);
    if (hiInclusive) {
      v5 = JavaUtilTreeMap_BoundEnum_values_;
    }
    else {
      v5 = &qword_100563F18;
    }
    if (v16) {
      goto LABEL_5;
    }
  }
  objc_opt_class();
LABEL_5:
  v6 = (void *)*v5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  m = self->m_;
  id lo = self->lo_;
  id hi = self->hi_;
  v11 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v11, m, (isKindOfClass & 1) == 0, lo, v4, hi, v6);
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_NavigableSubMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100438E58;
}

@end