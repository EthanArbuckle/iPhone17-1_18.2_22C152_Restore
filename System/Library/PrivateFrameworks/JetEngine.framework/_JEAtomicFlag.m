@interface _JEAtomicFlag
- (BOOL)compareWithValue:(BOOL)a3 andExchangeWithValue:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (_JEAtomicFlag)init;
- (_JEAtomicFlag)initWithInitialValue:(BOOL)a3;
- (id)description;
- (uint64_t)currentValue;
- (uint64_t)setCurrentValue:(uint64_t)result;
- (unint64_t)hash;
@end

@implementation _JEAtomicFlag

- (uint64_t)currentValue
{
  if (result)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(result + 8));
    return v1 & 1;
  }
  return result;
}

- (_JEAtomicFlag)initWithInitialValue:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_JEAtomicFlag;
  result = [(_JEAtomicFlag *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (BOOL)compareWithValue:(BOOL)a3 andExchangeWithValue:(BOOL)a4
{
  BOOL v4 = a3;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_value, (unsigned __int8 *)&v4, a4);
  return v4 == a3;
}

- (uint64_t)setCurrentValue:(uint64_t)result
{
  if (result) {
    atomic_store(a2, (unsigned __int8 *)(result + 8));
  }
  return result;
}

- (_JEAtomicFlag)init
{
  return 0;
}

- (unint64_t)hash
{
  if (self)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(self + 8));
    return v2 & 1;
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (unsigned __int8 *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self)
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_value);
      char v6 = v5 & 1;
    }
    else
    {
      char v6 = 0;
    }
    unsigned __int8 v7 = atomic_load(v4 + 8);
    char v8 = v6 ^ ((v7 & 1) == 0);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  BOOL v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = (void *)v5;
  unsigned __int8 v7 = @"NO";
  if (self)
  {
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_value);
    if (v8) {
      unsigned __int8 v7 = @"YES";
    }
  }
  v9 = (void *)[v3 initWithFormat:@"<%@:%p; %@>", v5, self, v7];

  return v9;
}

@end