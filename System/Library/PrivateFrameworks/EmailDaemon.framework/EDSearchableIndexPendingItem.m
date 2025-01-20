@interface EDSearchableIndexPendingItem
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPreprocessing;
- (EDIndexableItem)referenceItem;
- (EDSearchableIndexPendingItem)initWithItem:(id)a3;
- (NSMutableArray)items;
- (NSString)identifier;
- (int64_t)compare:(id)a3;
- (unint64_t)estimatedSizeInBytes;
- (unint64_t)hash;
- (void)addItem:(id)a3;
- (void)addPendingItem:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation EDSearchableIndexPendingItem

- (NSMutableArray)items
{
  return self->_items;
}

- (unint64_t)estimatedSizeInBytes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(EDSearchableIndexPendingItem *)self items];
  unint64_t v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 += [*(id *)(*((void *)&v8 + 1) + 8 * v6++) estimatedSizeInBytes];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceItem, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (EDSearchableIndexPendingItem)initWithItem:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDSearchableIndexPendingItem;
  uint64_t v6 = [(EDSearchableIndexPendingItem *)&v13 init];
  if (v6)
  {
    v7 = [v5 identifier];
    uint64_t v8 = [v7 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
    items = v6->_items;
    v6->_items = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v6->_referenceItem, a3);
  }

  return v6;
}

- (void)addItem:(id)a3
{
  id v12 = a3;
  id v5 = [v12 identifier];
  uint64_t v6 = [(EDSearchableIndexPendingItem *)self identifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexPendingItem.m" lineNumber:30 description:@"Additional items added to a pending item must have the same identifier"];
  }
  [(NSMutableArray *)self->_items ef_insertObject:v12 usingComparator:&__block_literal_global_72 allowDuplicates:0];
  uint64_t v8 = [(NSMutableArray *)self->_items sortedArrayUsingComparator:&__block_literal_global_8];
  long long v9 = [v8 firstObject];
  referenceItem = self->_referenceItem;
  self->_referenceItem = v9;
}

uint64_t __40__EDSearchableIndexPendingItem_addItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int64_t v6 = +[EDSearchableIndexItem indexingPriorityByIndexingType:](EDSearchableIndexItem, "indexingPriorityByIndexingType:", [v4 indexingType]);
  int64_t v7 = +[EDSearchableIndexItem indexingPriorityByIndexingType:](EDSearchableIndexItem, "indexingPriorityByIndexingType:", [v5 indexingType]);
  if (v7 >= v6)
  {
    if (v7 <= v6)
    {
      unint64_t v9 = [v4 itemInstantiationTime];
      unint64_t v10 = [v5 itemInstantiationTime];
      if (v10 <= v9) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = -1;
      }
      if (v10 < v9) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v11;
      }
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t __40__EDSearchableIndexPendingItem_addItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return EDIndexableItemCompare(a2, a3);
}

- (void)addPendingItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(a3, "items", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [(EDSearchableIndexPendingItem *)self addItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDSearchableIndexPendingItem *)self referenceItem];
  uint64_t v6 = [v4 referenceItem];
  int64_t v7 = EDIndexableItemCompare(v5, v6);

  return v7;
}

- (BOOL)requiresPreprocessing
{
  v2 = [(EDSearchableIndexPendingItem *)self items];
  char v3 = objc_msgSend(v2, "ef_any:", &__block_literal_global_11_0);

  return v3;
}

uint64_t __53__EDSearchableIndexPendingItem_requiresPreprocessing__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresPreprocessing];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(EDSearchableIndexPendingItem *)self identifier];
    int64_t v7 = [v5 identifier];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(EDSearchableIndexPendingItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setItems:(id)a3
{
}

- (EDIndexableItem)referenceItem
{
  return self->_referenceItem;
}

@end