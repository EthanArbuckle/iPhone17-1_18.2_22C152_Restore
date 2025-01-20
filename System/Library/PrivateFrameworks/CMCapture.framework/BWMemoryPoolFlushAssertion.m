@interface BWMemoryPoolFlushAssertion
- (void)dealloc;
- (void)initWithIdentifier:(void *)a3 pool:;
@end

@implementation BWMemoryPoolFlushAssertion

- (void)initWithIdentifier:(void *)a3 pool:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)BWMemoryPoolFlushAssertion;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  if (v5)
  {
    uint64_t v6 = [a2 copy];
    v5[1] = a3;
    v5[2] = v6;
    [a3 _addFlushAssertion];
  }
  return v5;
}

- (void)dealloc
{
  [(BWMemoryPool *)self->_pool _removeFlushAssertion];

  v3.receiver = self;
  v3.super_class = (Class)BWMemoryPoolFlushAssertion;
  [(BWMemoryPoolFlushAssertion *)&v3 dealloc];
}

@end