@interface WDAddDataManualEntryTableData
- (WDAddDataManualEntryTableData)initWithSections:(id)a3;
- (id)cellForRowAtIndexPath:(id)a3;
- (id)itemForCell:(id)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation WDAddDataManualEntryTableData

- (WDAddDataManualEntryTableData)initWithSections:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDAddDataManualEntryTableData;
  v6 = [(WDAddDataManualEntryTableData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sections, a3);
  }

  return v7;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  v3 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 numberOfCells];

  return v4;
}

- (id)cellForRowAtIndexPath:(id)a3
{
  sections = self->_sections;
  id v4 = a3;
  id v5 = -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", [v4 section]);
  uint64_t v6 = [v4 row];

  v7 = [v5 cellAtIndex:v6];

  return v7;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_sections count];
}

- (id)itemForCell:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_sections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "itemForCell:", v4, (void)v13);
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
}

@end