@interface _PFResultObjectKeyEnumerator
- (_PFResultObjectKeyEnumerator)initWithArray:(const void *)a3 forTarget:(id)a4 withReferenceValues:(unint64_t *)a5 andRange:(_NSRange)a6;
- (id)nextObject;
- (void)dealloc;
@end

@implementation _PFResultObjectKeyEnumerator

- (_PFResultObjectKeyEnumerator)initWithArray:(const void *)a3 forTarget:(id)a4 withReferenceValues:(unint64_t *)a5 andRange:(_NSRange)a6
{
  int64_t length = a6.length;
  NSUInteger location = a6.location;
  v14.receiver = self;
  v14.super_class = (Class)_PFResultObjectKeyEnumerator;
  v11 = [(_PFResultObjectKeyEnumerator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_range.NSUInteger location = location;
    v11->_range.int64_t length = length;
    if (length <= 0)
    {
      v11->_target = 0;
      v11->_keys = 0;
      v11->_referenceItems = 0;
    }
    else
    {
      v11->_target = a4;
      v12->_keys = a3;
      v12->_referenceItems = a5;
    }
    v12->_index = location;
  }
  return v12;
}

- (void)dealloc
{
  if (self)
  {
    self->_keys = 0;
    self->_referenceItems = 0;

    self->_target = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_PFResultObjectKeyEnumerator;
  [(_PFResultObjectKeyEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  keys = self->_keys;
  if (!keys) {
    return 0;
  }
  p_range = &self->_range;
  do
  {
    unint64_t index = self->_index;
    if (self->_referenceItems[index]) {
      v6 = (void *)keys[index];
    }
    else {
      v6 = 0;
    }
    unint64_t v7 = index + 1;
    self->_unint64_t index = v7;
    if (v7 == p_range->length + p_range->location)
    {
      if (v6) {
        id v8 = v6;
      }
      self->_keys = 0;
      self->_referenceItems = 0;

      self->_target = 0;
      keys = self->_keys;
    }
  }
  while (keys && !v6);
  return v6;
}

@end