@interface WDAddDataManualEntrySectionData
- (WDAddDataManualEntrySectionData)initWithItems:(id)a3;
- (id)_cells;
- (id)cellAtIndex:(int64_t)a3;
- (id)itemForCell:(id)a3;
- (int64_t)numberOfCells;
@end

@implementation WDAddDataManualEntrySectionData

- (WDAddDataManualEntrySectionData)initWithItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDAddDataManualEntrySectionData;
  v5 = [(WDAddDataManualEntrySectionData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v6;
  }
  return v5;
}

- (id)_cells
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tableViewCells", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)numberOfCells
{
  v2 = [(WDAddDataManualEntrySectionData *)self _cells];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)cellAtIndex:(int64_t)a3
{
  id v4 = [(WDAddDataManualEntrySectionData *)self _cells];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)itemForCell:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_items;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "tableViewCells", (void)v13);
        char v11 = [v10 containsObject:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
}

@end