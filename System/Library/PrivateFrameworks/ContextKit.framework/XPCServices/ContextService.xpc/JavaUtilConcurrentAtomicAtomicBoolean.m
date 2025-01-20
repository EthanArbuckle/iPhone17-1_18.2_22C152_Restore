@interface JavaUtilConcurrentAtomicAtomicBoolean
+ (const)__metadata;
- (BOOL)compareAndSetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
- (BOOL)get;
- (BOOL)getAndSetWithBoolean:(BOOL)a3;
- (BOOL)weakCompareAndSetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
- (JavaUtilConcurrentAtomicAtomicBoolean)initWithBoolean:(BOOL)a3;
- (NSString)description;
- (void)lazySetWithBoolean:(BOOL)a3;
- (void)setWithBoolean:(BOOL)a3;
@end

@implementation JavaUtilConcurrentAtomicAtomicBoolean

- (JavaUtilConcurrentAtomicAtomicBoolean)initWithBoolean:(BOOL)a3
{
  return self;
}

- (BOOL)get
{
  unsigned int v2 = atomic_load((unsigned int *)&self->value_);
  return v2 != 0;
}

- (BOOL)compareAndSetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a3;
  atomic_compare_exchange_strong(&self->value_, (unsigned int *)&v4, a4);
  return v4 == a3;
}

- (BOOL)weakCompareAndSetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a3;
  atomic_compare_exchange_strong_explicit(&self->value_, (unsigned int *)&v4, a4, memory_order_relaxed, memory_order_relaxed);
  return v4 == a3;
}

- (void)setWithBoolean:(BOOL)a3
{
}

- (void)lazySetWithBoolean:(BOOL)a3
{
}

- (BOOL)getAndSetWithBoolean:(BOOL)a3
{
  return atomic_exchange(&self->value_, a3) != 0;
}

- (NSString)description
{
  unsigned int v2 = atomic_load((unsigned int *)&self->value_);
  return (NSString *)JavaLangBoolean_toStringWithBoolean_(v2 != 0);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004562B0;
}

@end