@interface CPLMapEnumerator
- (CPLMapEnumerator)initWithEnumerator:(id)a3;
- (CPLMapEnumerator)initWithEnumerator:(id)a3 map:(id)a4;
- (id)mapBlock;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation CPLMapEnumerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mapBlock, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (id)mapBlock
{
  return self->_mapBlock;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  while (1)
  {
    a3->var1 = a4;
    uint64_t v9 = [(NSFastEnumeration *)self->_enumerator countByEnumeratingWithState:a3 objects:a4 count:a5];
    if (!v9) {
      break;
    }
    unint64_t v10 = v9;
    var1 = a3->var1;
    itemsPtr = a4;
    if (var1 != a4)
    {
      itemsPtr = self->_itemsPtr;
      if (!itemsPtr)
      {
        self->_previousItemsPtrLength = v10;
        itemsPtr = malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
        goto LABEL_7;
      }
      if (v10 > self->_previousItemsPtrLength)
      {
        self->_previousItemsPtrLength = v10;
        itemsPtr = malloc_type_realloc(itemsPtr, 8 * v10, 0x80040B8603338uLL);
LABEL_7:
        self->_itemsPtr = (id *)itemsPtr;
      }
    }
    a3->var1 = (id *)itemsPtr;
    if (self->_previousResultValuesLength < v10)
    {
      self->_previousResultValuesLength = v10;
      resultValues = self->_resultValues;
      if (resultValues)
      {
        if (self->_previousResultValuesCount)
        {
          unint64_t v14 = 0;
          do
          {
            v15 = self->_resultValues;
            id v16 = v15[v14];
            v15[v14] = 0;

            ++v14;
          }
          while (v14 < self->_previousResultValuesCount);
          resultValues = self->_resultValues;
        }
        free(resultValues);
        self->_resultValues = (id *)malloc_type_calloc(v10, 8uLL, 0x80040B8603338uLL);
        self->_previousResultValuesCount = 0;
      }
      else
      {
        self->_resultValues = (id *)malloc_type_calloc(v10, 8uLL, 0x80040B8603338uLL);
      }
    }
    unint64_t v17 = 0;
    if (v10 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v10;
    }
    do
    {
      v19 = (*((void (**)(void))self->_mapBlock + 2))();
      if (v19)
      {
        objc_storeStrong(&self->_resultValues[v17], v19);
        a3->var1[v17++] = v19;
      }

      ++var1;
      --v18;
    }
    while (v18);
    if (v17) {
      goto LABEL_25;
    }
  }
  unint64_t v17 = 0;
LABEL_25:
  if (v17 < self->_previousResultValuesCount)
  {
    unint64_t v20 = v17;
    do
    {
      v21 = self->_resultValues;
      id v22 = v21[v20];
      v21[v20] = 0;

      ++v20;
    }
    while (v20 < self->_previousResultValuesCount);
  }
  self->_previousResultValuesCount = v17;
  return v17;
}

- (void)dealloc
{
  if (self->_previousResultValuesCount)
  {
    unint64_t v3 = 0;
    do
    {
      resultValues = self->_resultValues;
      id v5 = resultValues[v3];
      resultValues[v3] = 0;

      ++v3;
    }
    while (v3 < self->_previousResultValuesCount);
  }
  v6 = self->_resultValues;
  if (v6) {
    free(v6);
  }
  itemsPtr = self->_itemsPtr;
  if (itemsPtr) {
    free(itemsPtr);
  }
  v8.receiver = self;
  v8.super_class = (Class)CPLMapEnumerator;
  [(CPLMapEnumerator *)&v8 dealloc];
}

- (CPLMapEnumerator)initWithEnumerator:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = a3;
  v6 = [v4 null];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__CPLMapEnumerator_initWithEnumerator___block_invoke;
  v10[3] = &unk_1E60A7E68;
  id v11 = v6;
  id v7 = v6;
  objc_super v8 = [(CPLMapEnumerator *)self initWithEnumerator:v5 map:v10];

  return v8;
}

id __39__CPLMapEnumerator_initWithEnumerator___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return a2;
  }
}

- (CPLMapEnumerator)initWithEnumerator:(id)a3 map:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLMapEnumerator;
  uint64_t v9 = [(CPLMapEnumerator *)&v14 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    uint64_t v11 = [v8 copy];
    id mapBlock = v10->_mapBlock;
    v10->_id mapBlock = (id)v11;
  }
  return v10;
}

@end