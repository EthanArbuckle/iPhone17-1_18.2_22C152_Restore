@interface BSAtomicFlag
- (BOOL)getFlag;
- (BOOL)setFlag:(BOOL)a3;
- (BSAtomicFlag)init;
- (BSAtomicFlag)initWithFlag:(BOOL)a3;
- (id)description;
@end

@implementation BSAtomicFlag

- (BOOL)getFlag
{
  int v2 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_flag, (unsigned __int8 *)&v2, v2, memory_order_relaxed, memory_order_relaxed);
  return v2 == 1;
}

- (BOOL)setFlag:(BOOL)a3
{
  BOOL v3 = !a3;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_flag, (unsigned __int8 *)&v3, a3, memory_order_relaxed, memory_order_relaxed);
  return v3 == !a3;
}

- (BSAtomicFlag)init
{
  return [(BSAtomicFlag *)self initWithFlag:0];
}

- (BSAtomicFlag)initWithFlag:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BSAtomicFlag;
  result = [(BSAtomicFlag *)&v5 init];
  if (result) {
    atomic_store(a3, (unsigned __int8 *)&result->_flag);
  }
  return result;
}

- (id)description
{
  BOOL v3 = +[BSDescriptionBuilder builderWithObject:self];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __27__BSAtomicFlag_description__block_invoke;
  v11 = &unk_1E54456B8;
  id v4 = v3;
  id v12 = v4;
  v13 = self;
  id v5 = (id)[v4 modifyProem:&v8];
  v6 = objc_msgSend(v4, "build", v8, v9, v10, v11);

  return v6;
}

id __27__BSAtomicFlag_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "getFlag"), 0);
}

@end