@interface _NSKeyValueReturnedValueConsistencyStats
- (id)currentValue;
- (void)dealloc;
- (void)setCurrentValue:(id)a3;
@end

@implementation _NSKeyValueReturnedValueConsistencyStats

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_weakCurrentValue, 0);

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueReturnedValueConsistencyStats;
  [(_NSKeyValueReturnedValueConsistencyStats *)&v3 dealloc];
}

- (id)currentValue
{
  if (self->_copiedCurrentValue) {
    return self->_copiedCurrentValue;
  }
  else {
    return objc_loadWeak(&self->_weakCurrentValue);
  }
}

- (void)setCurrentValue:(id)a3
{
  id v3 = a3;
  id copiedCurrentValue = self->_copiedCurrentValue;
  if (copiedCurrentValue)
  {
    if (copiedCurrentValue == a3) {
      return;
    }
  }
  else
  {
    id v6 = objc_loadWeak(&self->_weakCurrentValue);
    if (v6)
    {
      id v7 = v6;

      if (v7 == v3) {
        return;
      }
    }
  }

  if ([v3 conformsToProtocol:&unk_1ECABC9F8])
  {
    v8 = (void *)[v3 copy];
    id v3 = 0;
  }
  else
  {
    v8 = 0;
  }
  self->_id copiedCurrentValue = v8;

  objc_storeWeak(&self->_weakCurrentValue, v3);
}

@end