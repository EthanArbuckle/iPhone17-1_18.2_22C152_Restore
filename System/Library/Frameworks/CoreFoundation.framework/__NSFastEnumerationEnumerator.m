@interface __NSFastEnumerationEnumerator
+ (id)allocWithZone:(_NSZone *)a3;
- (__NSFastEnumerationEnumerator)initWithObject:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSFastEnumerationEnumerator

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSFastEnumerationEnumerator;
  [(__NSFastEnumerationEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  if (self->_index == self->_count)
  {
    p_unint64_t state = &self->_state;
    unint64_t state = self->_state.state;
    self->_unint64_t index = 0;
    unint64_t v5 = [(NSFastEnumeration *)self->_obj countByEnumeratingWithState:&self->_state objects:self->_objects count:16];
    self->_count = v5;
    if (!v5)
    {

      self->_obj = 0;
      id result = 0;
      self->_origObj = 0;
      return result;
    }
    if (state)
    {
      if (self->_mut != *p_state->var0) {
        __NSFastEnumerationMutationHandler((uint64_t)self->_obj);
      }
    }
    else
    {
      self->_mut = *p_state->var0;
    }
  }
  unint64_t index = self->_index;
  itemsPtr = self->_state.itemsPtr;
  self->_unint64_t index = index + 1;
  return itemsPtr[index];
}

- (__NSFastEnumerationEnumerator)initWithObject:(id)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  v6.receiver = self;
  v6.super_class = (Class)__NSFastEnumerationEnumerator;
  uint64_t v4 = [(__NSFastEnumerationEnumerator *)&v6 init];
  if (v4)
  {
    v4->_obj = (NSFastEnumeration *)a3;
    v4->_origObj = a3;
  }
  return v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = (objc_class *)objc_opt_class();

  return __CFAllocateObject(v3, 0x40uLL);
}

@end