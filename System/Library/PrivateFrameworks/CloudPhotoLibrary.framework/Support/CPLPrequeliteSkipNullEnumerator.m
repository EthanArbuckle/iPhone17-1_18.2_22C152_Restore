@interface CPLPrequeliteSkipNullEnumerator
- (CPLPrequeliteSkipNullEnumerator)initWithEnumerator:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation CPLPrequeliteSkipNullEnumerator

- (CPLPrequeliteSkipNullEnumerator)initWithEnumerator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPrequeliteSkipNullEnumerator;
  v6 = [(CPLPrequeliteSkipNullEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enumerator, a3);
  }

  return v7;
}

- (void)dealloc
{
  itemPtr = self->_itemPtr;
  if (itemPtr) {
    free(itemPtr);
  }
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteSkipNullEnumerator;
  [(CPLPrequeliteSkipNullEnumerator *)&v4 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v9 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_enumerator, "countByEnumeratingWithState:objects:count:");
  if (v9)
  {
    unint64_t v10 = (unint64_t)v9;
    while (1)
    {
      var1 = a3->var1;
      itemPtr = a4;
      if (var1 != a4)
      {
        itemPtr = self->_itemPtr;
        if (v10 > self->_sizeOfItemPtr)
        {
          if (itemPtr) {
            v13 = (id *)malloc_type_realloc(self->_itemPtr, 8 * v10, 0x80040B8603338uLL);
          }
          else {
            v13 = (id *)malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
          }
          itemPtr = v13;
          self->_sizeOfItemPtr = v10;
          self->_itemPtr = v13;
        }
      }
      id v14 = +[NSNull null];
      unint64_t v15 = 0;
      unint64_t v16 = 0;
      unint64_t v17 = v10;
      do
      {
        id v18 = a3->var1[v16];
        if (v18 == v14)
        {
          --v17;
        }
        else
        {
          if (var1 != a4 || v15 < v16) {
            itemPtr[v15] = v18;
          }
          ++v15;
        }
        ++v16;
      }
      while (v10 != v16);

      if (v17) {
        break;
      }
      unint64_t v10 = (unint64_t)[(NSFastEnumeration *)self->_enumerator countByEnumeratingWithState:a3 objects:a4 count:a5];
      if (!v10) {
        goto LABEL_21;
      }
    }
  }
  else
  {
    itemPtr = 0;
LABEL_21:
    unint64_t v17 = 0;
  }
  a3->var1 = itemPtr;
  return v17;
}

- (void).cxx_destruct
{
}

@end