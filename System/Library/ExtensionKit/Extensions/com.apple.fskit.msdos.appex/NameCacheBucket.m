@interface NameCacheBucket
- (BOOL)removeEntryAtIndex:(unsigned int)a3;
- (NameCacheBucket)init;
- (int)addEntry:(NameCacheEntry_s)a3;
- (unsigned)currCount;
- (unsigned)currSize;
- (void)dealloc;
- (void)setCurrCount:(unsigned int)a3;
- (void)setCurrSize:(unsigned int)a3;
@end

@implementation NameCacheBucket

- (NameCacheBucket)init
{
  v4.receiver = self;
  v4.super_class = (Class)NameCacheBucket;
  v2 = [(NameCacheBucket *)&v4 init];
  if (v2)
  {
    v2->elements = (NameCacheEntry_s *)malloc_type_calloc(0x64uLL, 8uLL, 0x100004000313F17uLL);
    *(void *)&v2->_currCount = 0x6400000000;
  }
  return v2;
}

- (void)dealloc
{
  elements = self->elements;
  if (elements)
  {
    free(elements);
    self->elements = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NameCacheBucket;
  [(NameCacheBucket *)&v4 dealloc];
}

- (int)addEntry:(NameCacheEntry_s)a3
{
  unsigned int currCount = self->_currCount;
  elements = self->elements;
  if (currCount != self->_currSize) {
    goto LABEL_4;
  }
  v7 = (NameCacheEntry_s *)malloc_type_realloc(elements, 8 * ([(NameCacheBucket *)self currSize] + 100), 0x100004000313F17uLL);
  self->elements = v7;
  if (v7)
  {
    elements = v7;
    unsigned int currCount = self->_currCount;
    self->_currSize += 100;
LABEL_4:
    int result = 0;
    self->_unsigned int currCount = currCount + 1;
    elements[currCount] = a3;
    return result;
  }
  return 12;
}

- (BOOL)removeEntryAtIndex:(unsigned int)a3
{
  unint64_t currCount = self->_currCount;
  if (!currCount) {
    return 0;
  }
  elements = self->elements;
  p_var1 = &elements->var1;
  if (elements->var1 != a3)
  {
    unint64_t v6 = 0;
    v8 = &elements[1].var1;
    while (currCount - 1 != v6)
    {
      unsigned int v9 = *v8;
      v8 += 2;
      ++v6;
      if (v9 == a3)
      {
        BOOL v7 = v6 < currCount;
        p_var1 = v8 - 2;
        goto LABEL_8;
      }
    }
    return 0;
  }
  unint64_t v6 = 0;
  BOOL v7 = 1;
LABEL_8:
  unsigned int v10 = currCount - 1;
  if (v10 != v6)
  {
    elements[v6].var0 = elements[v10].var0;
    unsigned int *p_var1 = elements[self->_currCount - 1].var1;
    unsigned int v10 = self->_currCount - 1;
  }
  self->_unint64_t currCount = v10;
  return v7;
}

- (unsigned)currCount
{
  return self->_currCount;
}

- (void)setCurrCount:(unsigned int)a3
{
  self->_unint64_t currCount = a3;
}

- (unsigned)currSize
{
  return self->_currSize;
}

- (void)setCurrSize:(unsigned int)a3
{
  self->_currSize = a3;
}

@end