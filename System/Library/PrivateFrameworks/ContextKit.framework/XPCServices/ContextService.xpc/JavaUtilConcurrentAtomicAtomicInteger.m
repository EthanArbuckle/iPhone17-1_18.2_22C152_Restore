@interface JavaUtilConcurrentAtomicAtomicInteger
+ (const)__metadata;
- (BOOL)compareAndSetWithInt:(int)a3 withInt:(int)a4;
- (BOOL)weakCompareAndSetWithInt:(int)a3 withInt:(int)a4;
- (JavaUtilConcurrentAtomicAtomicInteger)initWithInt:(int)a3;
- (NSString)description;
- (double)doubleValue;
- (float)floatValue;
- (int)addAndGetWithInt:(int)a3;
- (int)decrementAndGet;
- (int)get;
- (int)getAndAddWithInt:(int)a3;
- (int)getAndDecrement;
- (int)getAndIncrement;
- (int)getAndSetWithInt:(int)a3;
- (int)incrementAndGet;
- (int)intValue;
- (int64_t)longLongValue;
- (void)lazySetWithInt:(int)a3;
- (void)setWithInt:(int)a3;
@end

@implementation JavaUtilConcurrentAtomicAtomicInteger

- (JavaUtilConcurrentAtomicAtomicInteger)initWithInt:(int)a3
{
  return self;
}

- (int)get
{
  return atomic_load((unsigned int *)&self->value_);
}

- (void)setWithInt:(int)a3
{
}

- (void)lazySetWithInt:(int)a3
{
}

- (int)getAndSetWithInt:(int)a3
{
  return atomic_exchange(&self->value_, a3);
}

- (BOOL)compareAndSetWithInt:(int)a3 withInt:(int)a4
{
  int v4 = a3;
  atomic_compare_exchange_strong(&self->value_, (unsigned int *)&v4, a4);
  return v4 == a3;
}

- (BOOL)weakCompareAndSetWithInt:(int)a3 withInt:(int)a4
{
  int v4 = a3;
  atomic_compare_exchange_strong_explicit(&self->value_, (unsigned int *)&v4, a4, memory_order_relaxed, memory_order_relaxed);
  return v4 == a3;
}

- (int)getAndIncrement
{
  return atomic_fetch_add(&self->value_, 1u);
}

- (int)getAndDecrement
{
  return atomic_fetch_add(&self->value_, 0xFFFFFFFF);
}

- (int)getAndAddWithInt:(int)a3
{
  return atomic_fetch_add(&self->value_, a3);
}

- (int)incrementAndGet
{
  return atomic_fetch_add(&self->value_, 1u) + 1;
}

- (int)decrementAndGet
{
  return atomic_fetch_add(&self->value_, 0xFFFFFFFF) - 1;
}

- (int)addAndGetWithInt:(int)a3
{
  return atomic_fetch_add(&self->value_, a3) + a3;
}

- (NSString)description
{
  unsigned int v2 = atomic_load((unsigned int *)&self->value_);
  return JavaLangInteger_toStringWithInt_(v2);
}

- (int)intValue
{
  return atomic_load((unsigned int *)&self->value_);
}

- (int64_t)longLongValue
{
  return (int)atomic_load((unsigned int *)&self->value_);
}

- (float)floatValue
{
  return (float)(int)atomic_load((unsigned int *)&self->value_);
}

- (double)doubleValue
{
  return (double)(int)atomic_load((unsigned int *)&self->value_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040A8F0;
}

@end