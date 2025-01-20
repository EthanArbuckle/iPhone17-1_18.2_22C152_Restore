@interface SGList
- (BOOL)addItem:(id)a3;
- (BOOL)removeItem:(id)a3;
- (NSMutableArray)array;
- (SGList)init;
- (SGListDelegate)delegate;
- (id)comparator;
- (id)itemAtIndex:(unint64_t)a3;
- (id)items;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfItem:(id)a3;
- (void)removeAllItems;
- (void)setArray:(id)a3;
- (void)setComparator:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SGList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setArray:(id)a3
{
}

- (NSMutableArray)array
{
  return self->_array;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setDelegate:(id)a3
{
}

- (SGListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SGListDelegate *)WeakRetained;
}

- (void)setComparator:(id)a3
{
  id v4 = a3;
  if (self->_comparator != v4)
  {
    id v10 = v4;
    v5 = _Block_copy(v4);
    id comparator = self->_comparator;
    self->_id comparator = v5;

    v7 = [(SGList *)self comparator];

    id v4 = v10;
    if (v7)
    {
      array = self->_array;
      v9 = [(SGList *)self comparator];
      [(NSMutableArray *)array sortUsingComparator:v9];

      id v4 = v10;
    }
  }
}

- (id)items
{
  return self->_array;
}

- (unint64_t)indexOfItem:(id)a3
{
  return [(NSMutableArray *)self->_array indexOfObject:a3];
}

- (id)itemAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_array objectAtIndex:a3];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_array objectAtIndex:a3];
}

- (void)removeAllItems
{
  v3 = (void *)[(NSMutableArray *)self->_array copy];
  [(NSMutableArray *)self->_array removeAllObjects];
  if ([v3 count])
  {
    id v4 = [(SGList *)self delegate];

    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __24__SGList_removeAllItems__block_invoke;
      v5[3] = &unk_1E612E728;
      v5[4] = self;
      [v3 enumerateObjectsWithOptions:2 usingBlock:v5];
    }
  }
}

void __24__SGList_removeAllItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 delegate];
  [v7 list:*(void *)(a1 + 32) didRemoveItem:v6 atIndex:a3];
}

- (BOOL)removeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_array indexOfObjectIdenticalTo:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_array removeObjectAtIndex:v5];
    id v6 = [(SGList *)self delegate];
    [v6 list:self didRemoveItem:v4 atIndex:v5];
  }
  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)addItem:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableArray *)self->_array containsObject:v4];
  if ((v5 & 1) == 0)
  {
    [(NSMutableArray *)self->_array addObject:v4];
    id v6 = [(SGList *)self comparator];

    if (v6)
    {
      array = self->_array;
      v8 = [(SGList *)self comparator];
      [(NSMutableArray *)array sortUsingComparator:v8];
    }
    uint64_t v9 = [(NSMutableArray *)self->_array indexOfObject:v4];
    id v10 = [(SGList *)self delegate];
    [v10 list:self didAddItem:v4 atIndex:v9];
  }
  return v5 ^ 1;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_array count];
}

- (SGList)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGList;
  v2 = [(SGList *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SGList *)v2 setArray:v3];
  }
  return v2;
}

@end