@interface _CNLazyArrayFastEnumerationSource
- (_CNLazyArrayFastEnumerationSource)initWithFastEnumeration:(id)a3;
- (id)nextObject;
- (void)fillBuffer;
@end

@implementation _CNLazyArrayFastEnumerationSource

- (_CNLazyArrayFastEnumerationSource)initWithFastEnumeration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayFastEnumerationSource;
  v6 = [(_CNLazyArrayFastEnumerationSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fastEnumeration, a3);
    v7->_state.state = 0;
    v7->_firstCall = 1;
    v7->_count = 0;
    v7->_index = 0;
    v7->_mutationsPtrValue = 0;
    v8 = v7;
  }

  return v7;
}

- (id)nextObject
{
  unint64_t count = self->_count;
  if (count == self->_index)
  {
    [(_CNLazyArrayFastEnumerationSource *)self fillBuffer];
    unint64_t count = self->_count;
  }
  if (count) {
    v4 = self->_state.itemsPtr[self->_index++];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)fillBuffer
{
  self->_unint64_t count = [(NSFastEnumeration *)self->_fastEnumeration countByEnumeratingWithState:&self->_state objects:self->_stackbuf count:16];
  if (self->_firstCall)
  {
    int64_t mutationsPtrValue = *self->_state.var0;
  }
  else
  {
    int64_t mutationsPtrValue = self->_mutationsPtrValue;
    if (mutationsPtrValue != *self->_state.var0)
    {
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"mutated while enumerating" userInfo:0];
      objc_exception_throw(v4);
    }
  }
  self->_firstCall = 0;
  self->_int64_t mutationsPtrValue = mutationsPtrValue;
  self->_index = 0;
}

- (void).cxx_destruct
{
}

@end