@interface JavaUtilConcurrentAtomicAtomicReference
+ (const)__metadata;
- (BOOL)compareAndSetWithId:(id)a3 withId:(id)a4;
- (BOOL)weakCompareAndSetWithId:(id)a3 withId:(id)a4;
- (JavaUtilConcurrentAtomicAtomicReference)initWithId:(id)a3;
- (NSString)description;
- (id)get;
- (id)getAndSetWithId:(id)a3;
- (void)__javaClone;
- (void)dealloc;
- (void)lazySetWithId:(id)a3;
- (void)setWithId:(id)a3;
@end

@implementation JavaUtilConcurrentAtomicAtomicReference

- (JavaUtilConcurrentAtomicAtomicReference)initWithId:(id)a3
{
  return self;
}

- (id)get
{
  return (id)atomic_load((unint64_t *)&self->value_);
}

- (void)setWithId:(id)a3
{
}

- (void)lazySetWithId:(id)a3
{
  id v5 = a3;
  v6 = (void *)atomic_exchange_explicit((atomic_ullong *volatile)&self->value_, (unint64_t)a3, memory_order_release);
  id v7 = v6;
}

- (BOOL)compareAndSetWithId:(id)a3 withId:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->value_, (unint64_t *)&v8, (unint64_t)a4);
  BOOL v9 = v8 == a3;
  if (v8 == a3) {
    id v10 = a3;
  }
  else {

  }
  return v9;
}

- (BOOL)weakCompareAndSetWithId:(id)a3 withId:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self->value_, (unint64_t *)&v8, (unint64_t)a4, memory_order_relaxed, memory_order_relaxed);
  BOOL v9 = v8 == a3;
  if (v8 == a3) {
    id v10 = a3;
  }
  else {

  }
  return v9;
}

- (id)getAndSetWithId:(id)a3
{
  id v5 = a3;
  v6 = (void *)atomic_exchange((atomic_ullong *volatile)&self->value_, (unint64_t)a3);
  id v7 = v6;
  return v6;
}

- (NSString)description
{
  v2 = (void *)atomic_load((unint64_t *)&self->value_);
  return (NSString *)NSString_valueOf_(v2);
}

- (void)dealloc
{
  JreReleaseVolatile(&self->value_);
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentAtomicAtomicReference;
  [(JavaUtilConcurrentAtomicAtomicReference *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentAtomicAtomicReference;
  [(JavaUtilConcurrentAtomicAtomicReference *)&v3 __javaClone];
  JreRetainVolatile(&self->value_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047F858;
}

@end