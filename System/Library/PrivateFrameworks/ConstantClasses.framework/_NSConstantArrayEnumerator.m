@interface _NSConstantArrayEnumerator
- (_NSConstantArrayEnumerator)initWithArray:(id *)a3 capacity:(unint64_t)a4;
- (id)allObjects;
- (id)nextObject;
@end

@implementation _NSConstantArrayEnumerator

- (_NSConstantArrayEnumerator)initWithArray:(id *)a3 capacity:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_NSConstantArrayEnumerator;
  result = [(_NSConstantArrayEnumerator *)&v7 init];
  if (result)
  {
    result->objects = a3;
    result->capacity = a4;
    result->index = 0;
  }
  return result;
}

- (id)allObjects
{
  unint64_t index = self->index;
  self->unint64_t index = self->capacity;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&self->objects[index] count:self->capacity - index];
}

- (id)nextObject
{
  unint64_t index = self->index;
  if (index >= self->capacity) {
    return 0;
  }
  objects = self->objects;
  self->unint64_t index = index + 1;
  return objects[index];
}

@end