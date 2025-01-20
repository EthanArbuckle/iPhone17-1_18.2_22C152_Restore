@interface NSConcreteMapTableValueEnumerator
+ (id)enumeratorWithMapTable:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation NSConcreteMapTableValueEnumerator

- (id)nextObject
{
  unint64_t counter = self->counter;
  mapTable = self->mapTable;
  if (counter >= mapTable->capacity) {
    return 0;
  }
  while (1)
  {
    uint64_t v5 = (*((uint64_t (**)(void **, void))mapTable->keys.internalProps + 3))(&mapTable->keys.items[counter], 0);
    uint64_t v6 = (*((uint64_t (**)(void **, void))self->mapTable->values.internalProps + 3))(&self->mapTable->values.items[self->counter], 0);
    v7 = (void *)v6;
    ++self->counter;
    v8 = (void (*)(uint64_t))*((void *)self->mapTable->keys.internalProps + 4);
    if (v5 && v6 != 0) {
      break;
    }
    v8(v5);
    (*((void (**)(void *))self->mapTable->values.internalProps + 4))(v7);
    unint64_t counter = self->counter;
    mapTable = self->mapTable;
    if (counter >= mapTable->capacity) {
      return 0;
    }
  }
  v8(v5);
  (*((void (**)(void *))self->mapTable->values.internalProps + 5))(v7);
  return v7;
}

+ (id)enumeratorWithMapTable:(id)a3
{
  v4 = [NSConcreteMapTableValueEnumerator alloc];
  v4->mapTable = (NSConcreteMapTable *)a3;
  v4->unint64_t counter = 0;

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteMapTableValueEnumerator;
  [(NSConcreteMapTableValueEnumerator *)&v3 dealloc];
}

@end