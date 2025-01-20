@interface __NSConstantArrayEnumerator
- (__NSConstantArrayEnumerator)initWithConstantArray:(id)a3;
- (id)allObjects;
- (id)nextObject;
@end

@implementation __NSConstantArrayEnumerator

- (__NSConstantArrayEnumerator)initWithConstantArray:(id)a3
{
  self->_underlyingArray = (NSConstantArray *)a3;
  return self;
}

- (id)allObjects
{
  v2 = __NSArrayI_new((id *)self->_underlyingArray->_objects, 0, self->_underlyingArray->_count, 0);

  return v2;
}

- (id)nextObject
{
  unint64_t index = self->_index;
  underlyingArray = self->_underlyingArray;
  if (index >= underlyingArray->_count) {
    return 0;
  }
  objects = underlyingArray->_objects;
  self->_unint64_t index = index + 1;
  return (id)objects[index];
}

@end