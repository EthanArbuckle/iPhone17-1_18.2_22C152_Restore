@interface __NSArrayReverseEnumerator
- (__NSArrayReverseEnumerator)initWithObject:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSArrayReverseEnumerator

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSArrayReverseEnumerator;
  [(__NSArrayReverseEnumerator *)&v3 dealloc];
}

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

- (__NSArrayReverseEnumerator)initWithObject:(id)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  v6.receiver = self;
  v6.super_class = (Class)__NSArrayReverseEnumerator;
  uint64_t v4 = [(__NSArrayReverseEnumerator *)&v6 init];
  if (v4)
  {
    v4->_id obj = a3;
    v4->_unint64_t idx = [a3 count];
  }
  return v4;
}

@end