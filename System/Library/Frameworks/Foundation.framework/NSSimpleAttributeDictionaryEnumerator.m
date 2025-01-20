@interface NSSimpleAttributeDictionaryEnumerator
- (NSSimpleAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation NSSimpleAttributeDictionaryEnumerator

- (NSSimpleAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSSimpleAttributeDictionaryEnumerator;
  v4 = [(NSSimpleAttributeDictionaryEnumerator *)&v6 init];
  if (v4)
  {
    v4->dictionary = (NSSimpleAttributeDictionary *)a3;
    v4->nextElement = 0;
  }
  return v4;
}

- (id)nextObject
{
  unint64_t nextElement = self->nextElement;
  dictionary = self->dictionary;
  if (nextElement == dictionary->numElements) {
    return 0;
  }
  self->unint64_t nextElement = nextElement + 1;
  return dictionary->elements[nextElement].key;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSSimpleAttributeDictionaryEnumerator;
  [(NSSimpleAttributeDictionaryEnumerator *)&v3 dealloc];
}

@end