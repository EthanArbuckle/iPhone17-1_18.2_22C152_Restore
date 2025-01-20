@interface _JEAtomicCounter
- (BOOL)isEqual:(id)a3;
- (_JEAtomicCounter)init;
- (_JEAtomicCounter)initWithInitialValue:(int64_t)a3;
- (id)description;
- (int64_t)decrement;
- (int64_t)increment;
- (unint64_t)currentValue;
- (unint64_t)hash;
@end

@implementation _JEAtomicCounter

- (unint64_t)currentValue
{
  if (result) {
    return atomic_load((unint64_t *)(result + 8));
  }
  return result;
}

- (int64_t)decrement
{
  return atomic_fetch_add(&self->_value, 0xFFFFFFFFFFFFFFFFLL);
}

- (_JEAtomicCounter)initWithInitialValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_JEAtomicCounter;
  result = [(_JEAtomicCounter *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (int64_t)increment
{
  return atomic_fetch_add(&self->_value, 1uLL);
}

- (_JEAtomicCounter)init
{
  return 0;
}

- (unint64_t)hash
{
  if (self) {
    return atomic_load((unint64_t *)(self + 8));
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unint64_t *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self) {
      unint64_t v5 = atomic_load((unint64_t *)&self->_value);
    }
    else {
      unint64_t v5 = 0;
    }
    unint64_t v6 = atomic_load(v4 + 1);
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = (void *)v5;
  if (self) {
    unint64_t v7 = atomic_load((unint64_t *)&self->_value);
  }
  else {
    unint64_t v7 = 0;
  }
  v8 = (void *)[v3 initWithFormat:@"<%@:%p; %ld>", v5, self, v7];

  return v8;
}

@end