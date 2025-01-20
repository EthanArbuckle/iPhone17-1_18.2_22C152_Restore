@interface MPMutableSectionedCollection
- (id)copyWithZone:(_NSZone *)a3;
- (void)_initializeAsEmptySectionedCollection;
- (void)appendItem:(id)a3;
- (void)appendItems:(id)a3;
- (void)appendSection:(id)a3;
- (void)insertItem:(id)a3 atIndexPath:(id)a4;
- (void)insertSection:(id)a3 atIndex:(int64_t)a4;
- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)moveSectionFromIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)removeAllObjects;
- (void)removeItemAtIndexPath:(id)a3;
- (void)removeSectionAtIndex:(int64_t)a3;
- (void)replaceItemsUsingBlock:(id)a3;
- (void)replaceObjectAtIndexPath:(id)a3 withObject:(id)a4;
- (void)replaceSectionAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceSectionsUsingBlock:(id)a3;
@end

@implementation MPMutableSectionedCollection

- (void)appendSection:(id)a3
{
  id v4 = a3;
  [(MPMutableSectionedCollection *)self insertSection:v4 atIndex:[(MPSectionedCollection *)self numberOfSections]];
}

- (void)insertSection:(id)a3 atIndex:(int64_t)a4
{
  sections = self->super._sections;
  v7 = self->super._sectionedItems;
  v9 = sections;
  [(NSArray *)v9 insertObject:a3 atIndex:a4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(NSArray *)v7 insertObject:v8 atIndex:a4];
}

- (void)appendItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MPSectionedCollection *)self numberOfSections] - 1;
  int64_t v6 = [(MPSectionedCollection *)self numberOfItemsInSection:v5];
  id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:v5];
  [(MPMutableSectionedCollection *)self insertItem:v4 atIndexPath:v7];
}

- (void)insertItem:(id)a3 atIndexPath:(id)a4
{
  int64_t v6 = self->super._sectionedItems;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 section];
  uint64_t v10 = [v7 item];

  id v11 = [(NSArray *)v6 objectAtIndex:v9];

  [v11 insertObject:v8 atIndex:v10];
}

- (void)_initializeAsEmptySectionedCollection
{
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sectionedItems = self->super._sectionedItems;
  self->super._sectionedItems = v3;

  int64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sections = self->super._sections;
  self->super._sections = v5;
}

- (void)replaceItemsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  if ([(NSArray *)self->super._sections count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      unsigned __int8 v13 = 0;
      int64_t v6 = [(NSArray *)self->super._sectionedItems objectAtIndexedSubscript:v5];
      if ([v6 count]) {
        break;
      }
LABEL_9:

      if (++v5 >= [(NSArray *)self->super._sections count]) {
        goto LABEL_12;
      }
    }
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];
      uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:v5];
      uint64_t v10 = v4[2](v4, v8, v9, &v13);

      if (v8 != v10)
      {
        id v11 = [(NSArray *)self->super._sectionedItems objectAtIndexedSubscript:v5];
        [v11 replaceObjectAtIndex:v7 withObject:v10];
      }
      int v12 = v13;

      if (v12) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_9;
      }
    }
  }
LABEL_12:
}

- (void)replaceSectionsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  unsigned __int8 v9 = 0;
  if ([(NSArray *)self->super._sections count])
  {
    unint64_t v5 = 0;
    do
    {
      int64_t v6 = [(NSArray *)self->super._sections objectAtIndexedSubscript:v5];
      uint64_t v7 = v4[2](v4, v6, v5, &v9);
      if (v6 != v7) {
        [(NSArray *)self->super._sections replaceObjectAtIndex:v5 withObject:v7];
      }
      int v8 = v9;

      if (v8) {
        break;
      }
      ++v5;
    }
    while (v5 < [(NSArray *)self->super._sections count]);
  }
}

- (void)removeAllObjects
{
  [(NSArray *)self->super._sections removeAllObjects];
  sectionedItems = self->super._sectionedItems;

  [(NSArray *)sectionedItems removeAllObjects];
}

- (void)appendItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MPMutableSectionedCollection *)self appendItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  v16 = self->super._sectionedItems;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 section];
  uint64_t v9 = [v7 item];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [v6 item];

  long long v12 = [(NSArray *)v16 objectAtIndex:v8];
  unsigned __int8 v13 = v12;
  if (v8 == v10)
  {
    [v12 exchangeObjectAtIndex:v9 withObjectAtIndex:v11];
  }
  else
  {
    uint64_t v14 = [(NSArray *)v16 objectAtIndex:v10];
    v15 = [v13 objectAtIndex:v9];
    [v13 removeObjectAtIndex:v9];
    [v14 insertObject:v15 atIndex:v11];
  }
}

- (void)replaceObjectAtIndexPath:(id)a3 withObject:(id)a4
{
  id v6 = self->super._sectionedItems;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 section];
  uint64_t v10 = [v8 item];

  id v11 = [(NSArray *)v6 objectAtIndex:v9];

  [v11 replaceObjectAtIndex:v10 withObject:v7];
}

- (void)removeItemAtIndexPath:(id)a3
{
  id v4 = self->super._sectionedItems;
  id v5 = a3;
  uint64_t v6 = [v5 section];
  uint64_t v7 = [v5 item];

  id v8 = [(NSArray *)v4 objectAtIndex:v6];

  [v8 removeObjectAtIndex:v7];
}

- (void)replaceSectionAtIndex:(int64_t)a3 withObject:(id)a4
{
}

- (void)moveSectionFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  sections = self->super._sections;
  uint64_t v7 = self->super._sectionedItems;
  id v8 = sections;
  [(NSArray *)v8 exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
  [(NSArray *)v7 exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
}

- (void)removeSectionAtIndex:(int64_t)a3
{
  sections = self->super._sections;
  id v5 = self->super._sectionedItems;
  uint64_t v6 = sections;
  [(NSArray *)v6 removeObjectAtIndex:a3];
  [(NSArray *)v5 removeObjectAtIndex:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MPSectionedCollection);
  if (v4)
  {
    uint64_t v5 = [(NSArray *)self->super._sections copy];
    sections = v4->_sections;
    v4->_sections = (NSArray *)v5;

    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->super._sectionedItems, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = self->super._sectionedItems;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copy", (void)v17);
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    uint64_t v14 = [v7 copy];
    sectionedItems = v4->_sectionedItems;
    v4->_sectionedItems = (NSArray *)v14;
  }
  return v4;
}

@end