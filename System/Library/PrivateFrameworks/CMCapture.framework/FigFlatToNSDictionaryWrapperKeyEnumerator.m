@interface FigFlatToNSDictionaryWrapperKeyEnumerator
- (FigFlatToNSDictionaryWrapperKeyEnumerator)initWithFlatDictionary:(OpaqueFigFlatDictionary *)a3;
- (id)allObjects;
- (id)nextObject;
- (void)dealloc;
@end

@implementation FigFlatToNSDictionaryWrapperKeyEnumerator

- (FigFlatToNSDictionaryWrapperKeyEnumerator)initWithFlatDictionary:(OpaqueFigFlatDictionary *)a3
{
  if (!a3) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)FigFlatToNSDictionaryWrapperKeyEnumerator;
  v4 = [(FigFlatToNSDictionaryWrapperKeyEnumerator *)&v11 init];
  if (v4)
  {
    int CountOfKeysWithValues = FigFlatDictionaryGetCountOfKeysWithValues((uint64_t)a3, v5);
    v4->_int keysCount = CountOfKeysWithValues;
    v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_malloc(8 * CountOfKeysWithValues, 0x2004093837F09uLL);
    v4->_keys = v7;
    int keysCount = v4->_keysCount;
    if (FigFlatDictionaryGetKeysWithValues((uint64_t)a3, (uint64_t)v7, (unsigned int *)&keysCount, v8)
      && v4->_keysCount == keysCount)
    {
      v4->_counter = 0;
      return v4;
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  keys = self->_keys;
  if (keys) {
    free(keys);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigFlatToNSDictionaryWrapperKeyEnumerator;
  [(FigFlatToNSDictionaryWrapperKeyEnumerator *)&v4 dealloc];
}

- (id)allObjects
{
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  for (int i = self->_counter; i < self->_keysCount; self->_counter = i)
  {
    [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%s", FigFlatDictionaryKeyGetIdentifier((uint64_t)self->_keys[i]))];
    int i = self->_counter + 1;
  }
  return v3;
}

- (id)nextObject
{
  uint64_t counter = self->_counter;
  if ((int)counter >= self->_keysCount) {
    return 0;
  }
  v3 = self->_keys[counter];
  self->_uint64_t counter = counter + 1;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s", FigFlatDictionaryKeyGetIdentifier((uint64_t)v3));
}

@end