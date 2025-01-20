@interface _NSConstantDictionaryEnumerator
- (_NSConstantDictionaryEnumerator)initWithFirstKeyPointer:(id *)a3 capacity:(unint64_t)a4;
- (id)allObjects;
- (id)nextObject;
@end

@implementation _NSConstantDictionaryEnumerator

- (_NSConstantDictionaryEnumerator)initWithFirstKeyPointer:(id *)a3 capacity:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_NSConstantDictionaryEnumerator;
  result = [(_NSConstantDictionaryEnumerator *)&v7 init];
  if (result)
  {
    result->currentKey = a3;
    result->capacity = a4;
    result->keyIndex = 0;
  }
  return result;
}

- (id)allObjects
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(_NSConstantDictionaryEnumerator *)self nextObject];
  if (v4)
  {
    id v5 = v4;
    do
    {
      [v3 addObject:v5];
      id v5 = [(_NSConstantDictionaryEnumerator *)self nextObject];
    }
    while (v5);
  }
  return v3;
}

- (id)nextObject
{
  unint64_t keyIndex = self->keyIndex;
  if (keyIndex >= self->capacity) {
    return 0;
  }
  id v3 = self->currentKey + 2;
  unint64_t v4 = keyIndex + 1;
  do
  {
    id v5 = *(v3 - 2);
    self->currentKey = v3;
    self->unint64_t keyIndex = v4;
    v3 += 2;
  }
  while (v4++ < self->capacity && v5 == 0);
  return v5;
}

@end