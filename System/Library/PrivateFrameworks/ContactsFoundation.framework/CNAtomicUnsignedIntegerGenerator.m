@interface CNAtomicUnsignedIntegerGenerator
- (CNAtomicUnsignedIntegerGenerator)init;
- (id)description;
- (unint64_t)nextUnsignedInteger;
@end

@implementation CNAtomicUnsignedIntegerGenerator

- (unint64_t)nextUnsignedInteger
{
  return atomic_fetch_add_explicit(&self->_n, 1uLL, memory_order_relaxed);
}

- (CNAtomicUnsignedIntegerGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNAtomicUnsignedIntegerGenerator;
  v2 = [(CNAtomicUnsignedIntegerGenerator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unint64_t *)&v2->_n);
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  atomic_fetch_or_explicit(&self->_n, 0, memory_order_relaxed);
  id v4 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"n");
  v5 = [v3 build];

  return v5;
}

@end