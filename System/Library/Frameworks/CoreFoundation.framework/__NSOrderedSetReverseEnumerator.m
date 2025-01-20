@interface __NSOrderedSetReverseEnumerator
- (__NSOrderedSetReverseEnumerator)initWithObject:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSOrderedSetReverseEnumerator

- (id)nextObject
{
  id obj = self->_obj;
  if (!obj) {
    return 0;
  }
  unint64_t idx = self->_idx;
  if (!idx)
  {

    self->_id obj = 0;
    return 0;
  }
  self->_unint64_t idx = idx - 1;
  id v5 = self->_obj;

  return (id)objc_msgSend(v5, "objectAtIndex:");
}

- (__NSOrderedSetReverseEnumerator)initWithObject:(id)a3
{
  self->_id obj = a3;
  self->_unint64_t idx = [a3 count];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetReverseEnumerator;
  [(__NSOrderedSetReverseEnumerator *)&v3 dealloc];
}

@end