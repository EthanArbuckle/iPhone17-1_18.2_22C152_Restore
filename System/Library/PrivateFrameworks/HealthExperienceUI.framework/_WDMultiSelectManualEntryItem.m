@interface _WDMultiSelectManualEntryItem
- (NSArray)titles;
- (id)generateValue;
- (id)tableViewCells;
- (int64_t)selectedIndex;
- (void)cellForItemTapped:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setTitles:(id)a3;
@end

@implementation _WDMultiSelectManualEntryItem

- (id)tableViewCells
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  tableViewCells = self->_tableViewCells;
  if (!tableViewCells)
  {
    uint64_t v22 = 40;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = self->_titles;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      uint64_t v8 = *MEMORY[0x1E4FB28C8];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
          v11 = [(WDAddDataManualEntryItem *)self _createUITableViewCell];
          v12 = [v11 textLabel];
          [v12 setText:v10];

          v13 = [v11 textLabel];
          v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v8);
          [v13 setFont:v14];

          v15 = [v10 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
          v28[0] = @"AddData.ValueCell";
          v28[1] = v15;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
          v17 = HKUIJoinStringsForAutomationIdentifier();
          [v11 setAccessibilityIdentifier:v17];

          [v4 addObject:v11];
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v6);
    }

    v18 = *(Class *)((char *)&self->super.super.isa + v22);
    *(Class *)((char *)&self->super.super.isa + v22) = (Class)v4;
    id v19 = v4;

    v20 = [*(id *)((char *)&self->super.super.isa + v22) objectAtIndexedSubscript:self->_selectedIndex];

    [v20 setAccessoryType:3];
    tableViewCells = *(NSArray **)((char *)&self->super.super.isa + v22);
  }
  return tableViewCells;
}

- (void)cellForItemTapped:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_tableViewCells;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 == v4)
        {
          id v10 = v4;
          uint64_t v11 = 3;
        }
        else
        {
          uint64_t v11 = 0;
        }
        objc_msgSend(v10, "setAccessoryType:", v11, (void)v12);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(WDAddDataManualEntryItem *)self _didUpdateValue];
}

- (id)generateValue
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  tableViewCells = self->_tableViewCells;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___WDMultiSelectManualEntryItem_generateValue__block_invoke;
  v5[3] = &unk_1E5E7CC98;
  v5[4] = &v6;
  [(NSArray *)tableViewCells enumerateObjectsUsingBlock:v5];
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7[3]];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_tableViewCells, 0);
}

@end