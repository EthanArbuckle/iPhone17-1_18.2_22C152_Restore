@interface __NSConstantDictionaryEnumerator
- (__NSConstantDictionaryEnumerator)initWithConstantDictionary:(id)a3 enumerateKeys:(BOOL)a4;
- (id)nextObject;
@end

@implementation __NSConstantDictionaryEnumerator

- (__NSConstantDictionaryEnumerator)initWithConstantDictionary:(id)a3 enumerateKeys:(BOOL)a4
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  v7.receiver = self;
  v7.super_class = (Class)__NSConstantDictionaryEnumerator;
  result = [(__NSConstantDictionaryEnumerator *)&v7 init];
  result->_underlyingDictionary = (NSConstantDictionary *)a3;
  result->_currentIndex = 0;
  result->_isForKeys = a4;
  return result;
}

- (id)nextObject
{
  underlyingDictionary = self->_underlyingDictionary;
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex >= underlyingDictionary->_count) {
    return 0;
  }
  if (self->_isForKeys) {
    v4 = &OBJC_IVAR___NSConstantDictionary__keys;
  }
  else {
    v4 = &OBJC_IVAR___NSConstantDictionary__objects;
  }
  v5 = (void *)(*(void **)((char *)&underlyingDictionary->super.super.isa + *v4))[currentIndex];
  self->_unint64_t currentIndex = currentIndex + 1;
  return v5;
}

@end