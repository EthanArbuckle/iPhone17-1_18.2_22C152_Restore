@interface BSAtomicSignal
- (BOOL)hasBeenSignalled;
- (BOOL)signal;
- (BSAtomicSignal)init;
- (id)description;
@end

@implementation BSAtomicSignal

- (BOOL)signal
{
  char v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_flag, (unsigned __int8 *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  return v2 == 0;
}

- (BOOL)hasBeenSignalled
{
  int v2 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_flag, (unsigned __int8 *)&v2, v2, memory_order_relaxed, memory_order_relaxed);
  return v2 == 1;
}

- (BSAtomicSignal)init
{
  v3.receiver = self;
  v3.super_class = (Class)BSAtomicSignal;
  result = [(BSAtomicSignal *)&v3 init];
  if (result) {
    atomic_store(0, (unsigned __int8 *)&result->_flag);
  }
  return result;
}

- (id)description
{
  objc_super v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BSAtomicSignal hasBeenSignalled](self, "hasBeenSignalled"), @"signalled", 1);
  v5 = [v3 build];

  return v5;
}

@end