@interface JavaUtilConcurrentAtomicAtomicLong
+ (BOOL)VMSupportsCS8;
+ (const)__metadata;
+ (void)initialize;
- (BOOL)compareAndSetWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (BOOL)weakCompareAndSetWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (JavaUtilConcurrentAtomicAtomicLong)initWithLong:(int64_t)a3;
- (NSString)description;
- (double)doubleValue;
- (float)floatValue;
- (int)intValue;
- (int64_t)addAndGetWithLong:(int64_t)a3;
- (int64_t)decrementAndGet;
- (int64_t)get;
- (int64_t)getAndAddWithLong:(int64_t)a3;
- (int64_t)getAndDecrement;
- (int64_t)getAndIncrement;
- (int64_t)getAndSetWithLong:(int64_t)a3;
- (int64_t)incrementAndGet;
- (int64_t)longLongValue;
- (void)lazySetWithLong:(int64_t)a3;
- (void)setWithLong:(int64_t)a3;
@end

@implementation JavaUtilConcurrentAtomicAtomicLong

+ (BOOL)VMSupportsCS8
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilConcurrentAtomicAtomicLong__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return 1;
  }
}

- (JavaUtilConcurrentAtomicAtomicLong)initWithLong:(int64_t)a3
{
  return self;
}

- (int64_t)get
{
  return atomic_load((unint64_t *)&self->value_);
}

- (void)setWithLong:(int64_t)a3
{
}

- (void)lazySetWithLong:(int64_t)a3
{
}

- (int64_t)getAndSetWithLong:(int64_t)a3
{
  return atomic_exchange(&self->value_, a3);
}

- (BOOL)compareAndSetWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  int64_t v4 = a3;
  atomic_compare_exchange_strong(&self->value_, (unint64_t *)&v4, a4);
  return v4 == a3;
}

- (BOOL)weakCompareAndSetWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  int64_t v4 = a3;
  atomic_compare_exchange_strong_explicit(&self->value_, (unint64_t *)&v4, a4, memory_order_relaxed, memory_order_relaxed);
  return v4 == a3;
}

- (int64_t)getAndIncrement
{
  return atomic_fetch_add(&self->value_, 1uLL);
}

- (int64_t)getAndDecrement
{
  return atomic_fetch_add(&self->value_, 0xFFFFFFFFFFFFFFFFLL);
}

- (int64_t)getAndAddWithLong:(int64_t)a3
{
  return atomic_fetch_add(&self->value_, a3);
}

- (int64_t)incrementAndGet
{
  return atomic_fetch_add(&self->value_, 1uLL) + 1;
}

- (int64_t)decrementAndGet
{
  return atomic_fetch_add(&self->value_, 0xFFFFFFFFFFFFFFFFLL) - 1;
}

- (int64_t)addAndGetWithLong:(int64_t)a3
{
  return atomic_fetch_add(&self->value_, a3) + a3;
}

- (NSString)description
{
  uint64_t v2 = atomic_load((unint64_t *)&self->value_);
  return (NSString *)JavaLangLong_toStringWithLong_(v2);
}

- (int)intValue
{
  return atomic_load((unint64_t *)&self->value_);
}

- (int64_t)longLongValue
{
  return atomic_load((unint64_t *)&self->value_);
}

- (float)floatValue
{
  return (float)(uint64_t)atomic_load((unint64_t *)&self->value_);
}

- (double)doubleValue
{
  return (double)(uint64_t)atomic_load((unint64_t *)&self->value_);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilConcurrentAtomicAtomicLong__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    JavaUtilConcurrentAtomicAtomicLong_VM_SUPPORTS_LONG_CAS_ = 1;
    }
    atomic_store(1u, (unsigned __int8 *)&JavaUtilConcurrentAtomicAtomicLong__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047A568;
}

@end