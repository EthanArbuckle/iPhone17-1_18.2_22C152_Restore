@interface BuddyMultilingualDataSource
- (BOOL)_isEmojiSoleDataItemPostDeletion:(id)a3;
- (BOOL)containsKey:(id)a3;
- (BOOL)dataHasDetailedLabelField;
- (BOOL)dataSourceActionEnabled;
- (BOOL)itemDeleteableAtIndexPath:(id)a3;
- (BOOL)itemReorderableAtIndexPath:(id)a3;
- (BOOL)rowActionableAtIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BuddyMultilingualDataSource)initWithBackingStore:(id)a3 actionText:(id)a4;
- (NSMutableArray)backingStore;
- (NSMutableDictionary)fastIdentifierMap;
- (NSString)actionString;
- (double)consistentRowHeight;
- (double)unifiedRowHeight;
- (id)addToCollectionCellWithTableView:(id)a3;
- (id)combinedStore;
- (id)immutableBackingStore;
- (id)itemForPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)editingStyleForRowAtIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_additionRowForSection:(int64_t)a3;
- (unint64_t)itemEditingOptionsAtIndexPath:(id)a3;
- (unint64_t)rowForInsertionInSection:(unint64_t)a3;
- (void)_sizeConsistentRowHeight;
- (void)recalculateUnifiedRowHeight;
- (void)setActionString:(id)a3;
- (void)setBackingStore:(id)a3;
- (void)setConsistentRowHeight:(double)a3;
- (void)setDataHasDetailedLabelField:(BOOL)a3;
- (void)setDataSourceActionEnabled:(BOOL)a3;
- (void)setFastIdentifierMap:(id)a3;
- (void)tableView:(id)a3 allowAdditionalDataSelection:(BOOL)a4;
- (void)tableView:(id)a3 appendItem:(id)a4 inSection:(unint64_t)a5;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 setBackingStore:(id)a4;
@end

@implementation BuddyMultilingualDataSource

- (BuddyMultilingualDataSource)initWithBackingStore:(id)a3 actionText:(id)a4
{
  id v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  objc_storeStrong(&v36, a4);
  id v5 = v38;
  id v38 = 0;
  v35.receiver = v5;
  v35.super_class = (Class)BuddyMultilingualDataSource;
  v6 = [(BuddyMultilingualDataSource *)&v35 init];
  id v38 = v6;
  objc_storeStrong(&v38, v6);
  if (v6)
  {
    *((CGFloat *)v38 + 5) = UITableViewAutomaticDimension;
    id v7 = objc_alloc((Class)NSMutableArray);
    id v8 = [v7 initWithCapacity:[location[0] count]];
    v9 = (void *)*((void *)v38 + 2);
    *((void *)v38 + 2) = v8;

    id v10 = +[NSMutableDictionary dictionary];
    v11 = (void *)*((void *)v38 + 4);
    *((void *)v38 + 4) = v10;

    id v12 = [v36 copy];
    v13 = (void *)*((void *)v38 + 3);
    *((void *)v38 + 3) = v12;

    *((unsigned char *)v38 + 8) = 1;
    *((unsigned char *)v38 + 9) = 0;
    memset(__b, 0, sizeof(__b));
    id v14 = location[0];
    id v15 = [v14 countByEnumeratingWithState:__b objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)__b[2];
      id v30 = v14;
      uint64_t v29 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v15; ++i)
        {
          if (*(void *)__b[2] != v16) {
            objc_enumerationMutation(v14);
          }
          id v34 = *(id *)(__b[1] + 8 * i);
          memset(v31, 0, sizeof(v31));
          id v18 = v34;
          id v19 = [v18 countByEnumeratingWithState:v31 objects:v39 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v31[2];
            do
            {
              for (unint64_t j = 0; j < (unint64_t)v19; ++j)
              {
                if (*(void *)v31[2] != v20) {
                  objc_enumerationMutation(v18);
                }
                id v32 = *(id *)(v31[1] + 8 * j);
                v22 = (void *)*((void *)v38 + 4);
                id v23 = [v32 identifier];
                id v24 = [v32 identifier];
                [v22 setObject:v23 forKey:v24];

                if ([v32 showDetailText]) {
                  *((unsigned char *)v38 + 9) = 1;
                }
              }
              id v19 = [v18 countByEnumeratingWithState:v31 objects:v39 count:16];
            }
            while (v19);
            id v14 = v30;
            uint64_t v16 = v29;
          }

          v25 = (void *)*((void *)v38 + 2);
          id v26 = [v34 mutableCopy];
          [v25 addObject:v26];
        }
        id v15 = [v14 countByEnumeratingWithState:__b objects:v40 count:16];
      }
      while (v15);
    }
  }
  v27 = (BuddyMultilingualDataSource *)v38;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v38, 0);
  return v27;
}

- (void)tableView:(id)a3 setBackingStore:(id)a4
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  [(NSMutableArray *)v27->_backingStore removeAllObjects];
  [(NSMutableDictionary *)v27->_fastIdentifierMap removeAllObjects];
  memset(__b, 0, sizeof(__b));
  id v6 = v25;
  id v7 = [v6 countByEnumeratingWithState:__b objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)__b[2];
    id v20 = v6;
    uint64_t v19 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v6);
        }
        id v24 = *(id *)(__b[1] + 8 * i);
        memset(v21, 0, sizeof(v21));
        id v10 = v24;
        id v11 = [v10 countByEnumeratingWithState:v21 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v21[2];
          do
          {
            for (unint64_t j = 0; j < (unint64_t)v11; ++j)
            {
              if (*(void *)v21[2] != v12) {
                objc_enumerationMutation(v10);
              }
              id v22 = *(id *)(v21[1] + 8 * j);
              fastIdentifierMap = v27->_fastIdentifierMap;
              id v15 = [v22 identifier];
              id v16 = [v22 identifier];
              [(NSMutableDictionary *)fastIdentifierMap setObject:v15 forKey:v16];

              if ([v22 showDetailText]) {
                v27->_dataHasDetailedLabelField = 1;
              }
            }
            id v11 = [v10 countByEnumeratingWithState:v21 objects:v28 count:16];
          }
          while (v11);
          id v6 = v20;
          uint64_t v8 = v19;
        }

        backingStore = v27->_backingStore;
        id v18 = [v24 mutableCopy];
        [(NSMutableArray *)backingStore addObject:v18];
      }
      id v7 = [v6 countByEnumeratingWithState:__b objects:v29 count:16];
    }
    while (v7);
  }

  [location[0] reloadData];
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v5 = [v21 row];
  id v6 = [(BuddyMultilingualDataSource *)v23 backingStore];
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", [v21 section]);
  id v8 = [v7 count];

  if (v5 == v8)
  {
    id v24 = [(BuddyMultilingualDataSource *)v23 addToCollectionCellWithTableView:location[0]];
    int v20 = 1;
  }
  else
  {
    id v19 = [location[0] dequeueReusableCellWithIdentifier:@"com.purpleBuddy.BuddyMultilingualCell"];
    if (!v19)
    {
      id v19 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"com.purpleBuddy.BuddyMultilingualCell"];
    }
    v9 = [(BuddyMultilingualDataSource *)v23 backingStore];
    id v10 = -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", [v21 section]);
    id v18 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v21, "row"));

    if (![v21 row]) {
      [(BuddyMultilingualDataSource *)v23 _sizeConsistentRowHeight];
    }
    id v11 = [v18 title];
    id v12 = [v19 textLabel];
    [v12 setText:v11];

    id v13 = [v18 detailText];
    id v14 = [v19 detailTextLabel];
    [v14 setText:v13];

    [v19 setSelectionStyle:0];
    id v15 = +[UIColor secondarySystemBackgroundColor];
    [v19 setBackgroundColor:v15];

    id v24 = v19;
    int v20 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v16 = v24;

  return v16;
}

- (id)addToCollectionCellWithTableView:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = [location[0] dequeueReusableCellWithIdentifier:@"com.purpleBuddy.BuddyMultilingual.dataAdditionCell"];
  if (!v15)
  {
    id v15 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"com.purpleBuddy.BuddyMultilingual.dataAdditionCell"];
  }
  v3 = [(BuddyMultilingualDataSource *)v17 actionString];
  id v4 = [v15 textLabel];
  [v4 setText:v3];

  char v13 = 0;
  char v11 = 0;
  if ([(BuddyMultilingualDataSource *)v17 dataSourceActionEnabled])
  {
    id v5 = +[UIColor systemBlueColor];
    id v14 = v5;
    char v13 = 1;
  }
  else
  {
    id v5 = +[UIColor lightGrayColor];
    id v12 = v5;
    char v11 = 1;
  }
  id v6 = [v15 textLabel];
  [v6 setTextColor:v5];

  if (v11) {
  if (v13)
  }

  if ([(BuddyMultilingualDataSource *)v17 dataSourceActionEnabled]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  [v15 setSelectionStyle:v7];
  [v15 setUserInteractionEnabled:[self dataSourceActionEnabled]];
  id v8 = +[UIColor secondarySystemBackgroundColor];
  [v15 setBackgroundColor:v8];

  id v9 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v9 = a4;
  id v5 = [(BuddyMultilingualDataSource *)v11 backingStore];
  id v6 = [(NSMutableArray *)v5 objectAtIndexedSubscript:v9];
  uint64_t v7 = (char *)[v6 count] + 1;

  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMultilingualDataSource *)v7 backingStore];
  id v4 = [(NSMutableArray *)v3 count];

  objc_storeStrong(location, 0);
  return (int64_t)v4;
}

- (BOOL)rowActionableAtIndexPath:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMultilingualDataSource *)v8 backingStore];
  id v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", [location[0] section]);
  id v5 = [v4 count];
  LOBYTE(v5) = v5 == [location[0] row];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v5 = [v11 row];
  id v6 = [(BuddyMultilingualDataSource *)v13 backingStore];
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", [v11 section]);
  BOOL v8 = v5 == [v7 count];
  unsigned __int8 v9 = 0;
  if (!v8) {
    unsigned __int8 v9 = [(BuddyMultilingualDataSource *)v13 itemReorderableAtIndexPath:v11];
  }

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v7 = [v19 row];
  BOOL v8 = [(BuddyMultilingualDataSource *)v22 backingStore];
  id v9 = -[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", [v19 section]);
  id v10 = [v9 count];

  if (v7 < v10)
  {
    id v11 = [(BuddyMultilingualDataSource *)v22 backingStore];
    id v12 = -[NSMutableArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", [v20 section]);
    id v17 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v20, "row"));

    char v13 = [(BuddyMultilingualDataSource *)v22 backingStore];
    id v14 = -[NSMutableArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", [v20 section]);
    [v14 removeObjectAtIndex:[v20 row]];

    id v15 = [(BuddyMultilingualDataSource *)v22 backingStore];
    id v16 = -[NSMutableArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", [v19 section]);
    [v16 insertObject:v17 atIndex:[v19 row]];

    objc_storeStrong(&v17, 0);
    int v18 = 0;
  }
  else
  {
    int v18 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  LOBYTE(a4) = [(BuddyMultilingualDataSource *)v8 itemEditingOptionsAtIndexPath:v6] != 0;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return a4 & 1;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyMultilingualDataSource *)v6 itemEditingOptionsAtIndexPath:location[0]];
  if (v3)
  {
    if ((unint64_t)(v3 - 1) < 3)
    {
      int64_t v7 = 1;
    }
    else if (v3 == (char *)4)
    {
      if ([(BuddyMultilingualDataSource *)v6 dataSourceActionEnabled]) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 0;
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v17 = a4;
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  if (v17 == 1 && [(BuddyMultilingualDataSource *)v19 itemDeleteableAtIndexPath:v16])
  {
    int64_t v7 = [(BuddyMultilingualDataSource *)v19 fastIdentifierMap];
    BOOL v8 = [(BuddyMultilingualDataSource *)v19 backingStore];
    id v9 = -[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", [v16 section]);
    id v10 = [v9 objectAtIndexedSubscript:[v16 row]];
    id v11 = [v10 identifier];
    [(NSMutableDictionary *)v7 removeObjectForKey:v11];

    id v12 = [(BuddyMultilingualDataSource *)v19 backingStore];
    id v13 = -[NSMutableArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", [v16 section]);
    [v13 removeObjectAtIndex:[v16 row]];

    id v14 = location[0];
    id v20 = v16;
    id v15 = +[NSArray arrayWithObjects:&v20 count:1];
    [v14 deleteRowsAtIndexPaths:v15 withRowAnimation:6];

    if (![(BuddyMultilingualDataSource *)v19 dataSourceActionEnabled]) {
      [(BuddyMultilingualDataSource *)v19 tableView:location[0] allowAdditionalDataSelection:1];
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)itemEditingOptionsAtIndexPath:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] row];
  BOOL v14 = v3 == (id)-[BuddyMultilingualDataSource _additionRowForSection:](v16, "_additionRowForSection:", [location[0] section]);
  char v12 = 0;
  char v10 = 0;
  unsigned __int8 v4 = 1;
  if (!v14)
  {
    id v13 = [(BuddyMultilingualDataSource *)v16 backingStore];
    char v12 = 1;
    id v11 = [v13 objectAtIndexedSubscript:[location[0] section]];
    char v10 = 1;
    unsigned __int8 v4 = 1;
    if ((unint64_t)[v11 count] > 1) {
      unsigned __int8 v4 = [(BuddyMultilingualDataSource *)v16 _isEmojiSoleDataItemPostDeletion:location[0]];
    }
  }
  if (v10) {

  }
  if (v12) {
  if (v4)
  }
  {
    if (v14) {
      unint64_t v17 = 4;
    }
    else {
      unint64_t v17 = 0;
    }
    int v9 = 1;
  }
  else
  {
    id v5 = [(BuddyMultilingualDataSource *)v16 backingStore];
    id v6 = -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", [location[0] section]);
    id v8 = [v6 objectAtIndexedSubscript:[location[0] row]];

    unint64_t v17 = (unint64_t)[v8 editingOptions];
    int v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(location, 0);
  return v17;
}

- (void)tableView:(id)a3 appendItem:(id)a4 inSection:(unint64_t)a5
{
  id v26 = self;
  SEL v25 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  unint64_t v22 = a5;
  unint64_t v7 = a5;
  id v8 = [(BuddyMultilingualDataSource *)v26 backingStore];
  BOOL v9 = v7 >= (unint64_t)[(NSMutableArray *)v8 count];

  if (v9)
  {
    char v10 = +[NSAssertionHandler currentHandler];
    SEL v11 = v25;
    char v12 = v26;
    id v13 = [(BuddyMultilingualDataSource *)v26 backingStore];
    [(NSAssertionHandler *)v10 handleFailureInMethod:v11, v12, @"BuddyMultilingualDataSource.m", 204, @"OOB check failed store:%@ section:%lu", v13, v22 object file lineNumber description];
  }
  [location beginUpdates];
  BOOL v14 = [(BuddyMultilingualDataSource *)v26 backingStore];
  id v15 = [(NSMutableArray *)v14 objectAtIndexedSubscript:v22];
  [v15 addObject:v23];

  id v16 = [(BuddyMultilingualDataSource *)v26 fastIdentifierMap];
  id v17 = [v23 identifier];
  id v18 = [v23 identifier];
  [(NSMutableDictionary *)v16 setObject:v17 forKey:v18];

  id v21 = +[NSIndexPath indexPathForRow:[(BuddyMultilingualDataSource *)v26 rowForInsertionInSection:v22] inSection:v22];
  id v19 = location;
  id v27 = v21;
  id v20 = +[NSArray arrayWithObjects:&v27 count:1];
  [v19 insertRowsAtIndexPaths:v20 withRowAnimation:0];

  [location endUpdates];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
}

- (void)tableView:(id)a3 allowAdditionalDataSelection:(BOOL)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 != [(BuddyMultilingualDataSource *)v6 dataSourceActionEnabled])
  {
    [(BuddyMultilingualDataSource *)v6 setDataSourceActionEnabled:a4];
    [location[0] reloadData];
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)rowForInsertionInSection:(unint64_t)a3
{
  id v3 = [(BuddyMultilingualDataSource *)self backingStore];
  id v4 = [(NSMutableArray *)v3 objectAtIndexedSubscript:a3];
  char v9 = 0;
  char v7 = 0;
  if ([v4 count] == (id)1)
  {
    id v5 = 0;
  }
  else
  {
    char v10 = [(BuddyMultilingualDataSource *)self backingStore];
    char v9 = 1;
    id v8 = [(NSMutableArray *)v10 objectAtIndexedSubscript:a3];
    char v7 = 1;
    id v5 = (char *)[v8 count] - 1;
  }
  unint64_t v13 = (unint64_t)v5;
  if (v7) {

  }
  if (v9) {
  return v13;
  }
}

- (id)itemForPath:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMultilingualDataSource *)v8 backingStore];
  id v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", [location[0] section]);
  id v5 = [v4 objectAtIndexedSubscript:[location[0] row]];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)combinedStore
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  v2 = [(BuddyMultilingualDataSource *)v17 backingStore];
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:__b objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(v2);
        }
        id v15 = *(id *)(__b[1] + 8 * i);
        memset(v12, 0, sizeof(v12));
        id v6 = v15;
        id v7 = [v6 countByEnumeratingWithState:v12 objects:v18 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v12[2];
          do
          {
            for (unint64_t j = 0; j < (unint64_t)v7; ++j)
            {
              if (*(void *)v12[2] != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v13 = *(void *)(v12[1] + 8 * j);
              [location[0] addObject:v13];
            }
            id v7 = [v6 countByEnumeratingWithState:v12 objects:v18 count:16];
          }
          while (v7);
        }
      }
      id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:__b objects:v19 count:16];
    }
    while (v3);
  }

  id v10 = [location[0] copy];
  objc_storeStrong(location, 0);

  return v10;
}

- (BOOL)containsKey:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMultilingualDataSource *)v8 fastIdentifierMap];
  id v4 = [(NSMutableDictionary *)v3 objectForKey:location[0]];
  BOOL v5 = v4 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (id)immutableBackingStore
{
  id v15 = self;
  location[1] = (id)a2;
  id v2 = objc_alloc((Class)NSMutableArray);
  id v3 = [(BuddyMultilingualDataSource *)v15 backingStore];
  location[0] = [v2 initWithCapacity:-[NSMutableArray count](v3, "count")];

  memset(__b, 0, sizeof(__b));
  id v4 = [(BuddyMultilingualDataSource *)v15 backingStore];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:__b objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(v4);
        }
        id v13 = *(id *)(__b[1] + 8 * i);
        id v8 = location[0];
        id v9 = [v13 copy];
        [v8 addObject:v9];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:__b objects:v16 count:16];
    }
    while (v5);
  }

  id v10 = [location[0] copy];
  objc_storeStrong(location, 0);

  return v10;
}

- (BOOL)itemReorderableAtIndexPath:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = (-[BuddyMultilingualDataSource itemEditingOptionsAtIndexPath:](v6, "itemEditingOptionsAtIndexPath:", location[0], 0) & 1) == 1;
  objc_storeStrong(location, 0);
  return v3;
}

- (BOOL)itemDeleteableAtIndexPath:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BuddyMultilingualDataSource *)v8 backingStore];
  id v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", [location[0] section]);
  unsigned __int8 v5 = 1;
  if ([v4 count] != (id)1) {
    unsigned __int8 v5 = [(BuddyMultilingualDataSource *)v8 _isEmojiSoleDataItemPostDeletion:location[0]];
  }

  BOOL v9 = (v5 & 1) == 0
    && (-[BuddyMultilingualDataSource itemEditingOptionsAtIndexPath:](v8, "itemEditingOptionsAtIndexPath:", location[0], 0) & 2) == 2;
  objc_storeStrong(location, 0);
  return v9;
}

- (unint64_t)_additionRowForSection:(int64_t)a3
{
  BOOL v3 = [(BuddyMultilingualDataSource *)self backingStore];
  id v4 = [(NSMutableArray *)v3 objectAtIndexedSubscript:a3];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (BOOL)_isEmojiSoleDataItemPostDeletion:(id)a3
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(BuddyMultilingualDataSource *)v30 backingStore];
  id v4 = -[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", [location[0] section]);
  id v5 = [v4 count];

  if (v5 != (id)2) {
    goto LABEL_24;
  }
  uint64_t v6 = [(BuddyMultilingualDataSource *)v30 backingStore];
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", [location[0] section]);
  id v8 = [v7 objectAtIndexedSubscript:0];
  id v9 = [v8 identifier];
  char v27 = 0;
  char v25 = 0;
  char v23 = 0;
  char v21 = 0;
  unsigned __int8 v10 = 1;
  if (([v9 isEqualToString:UIKeyboardInputMode_emoji] & 1) == 0)
  {
    v28 = [(BuddyMultilingualDataSource *)v30 backingStore];
    char v27 = 1;
    id v26 = -[NSMutableArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", [location[0] section]);
    char v25 = 1;
    id v24 = [v26 objectAtIndexedSubscript:1];
    char v23 = 1;
    id v22 = [v24 identifier];
    char v21 = 1;
    unsigned __int8 v10 = [v22 isEqualToString:UIKeyboardInputMode_emoji];
  }
  if (v21) {

  }
  if (v23) {
  if (v25)
  }

  if (v27) {
  char v19 = 0;
  }
  char v17 = 0;
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  if (v10)
  {
    id v20 = [(BuddyMultilingualDataSource *)v30 backingStore];
    char v19 = 1;
    id v18 = -[NSMutableArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", [location[0] section]);
    char v17 = 1;
    id v16 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(location[0], "row"));
    char v15 = 1;
    id v14 = [v16 identifier];
    char v13 = 1;
    char v11 = [v14 isEqualToString:UIKeyboardInputMode_emoji] ^ 1;
  }
  if (v13) {

  }
  if (v15) {
  if (v17)
  }

  if (v19) {
  if (v11)
  }
    char v31 = 1;
  else {
LABEL_24:
  }
    char v31 = 0;
  objc_storeStrong(location, 0);
  return v31 & 1;
}

- (void)recalculateUnifiedRowHeight
{
}

- (double)unifiedRowHeight
{
  [(BuddyMultilingualDataSource *)self consistentRowHeight];
  return result;
}

- (void)_sizeConsistentRowHeight
{
  char v15 = self;
  location[1] = (id)a2;
  id v2 = +[UIApplication sharedApplication];
  BOOL v3 = [(UIApplication *)v2 preferredContentSizeCategory];
  NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraLarge, v3);

  if (v4 == NSOrderedAscending)
  {
    [(BuddyMultilingualDataSource *)v15 setConsistentRowHeight:UITableViewAutomaticDimension];
  }
  else
  {
    [(BuddyMultilingualDataSource *)v15 consistentRowHeight];
    if (v5 == UITableViewAutomaticDimension)
    {
      location[0] = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
      id v6 = [location[0] textLabel];
      [v6 setText:@"SIZING_TEXT"];

      if ([(BuddyMultilingualDataSource *)v15 dataHasDetailedLabelField]) {
        CFStringRef v7 = @"SIZING_DETAIL_TEXT";
      }
      else {
        CFStringRef v7 = 0;
      }
      id v8 = [location[0] detailTextLabel];
      [v8 setText:v7];

      [location[0] layoutIfNeeded];
      [location[0] frame];
      sub_1001EBB3C();
      LODWORD(v9) = 1148846080;
      LODWORD(v10) = 1112014848;
      [location[0] systemLayoutSizeFittingSize:v11 withHorizontalFittingPriority:v12 verticalFittingPriority:v9];
      [(BuddyMultilingualDataSource *)v15 setConsistentRowHeight:v13];
      objc_storeStrong(location, 0);
    }
  }
}

- (NSMutableArray)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (NSString)actionString
{
  return self->_actionString;
}

- (void)setActionString:(id)a3
{
}

- (NSMutableDictionary)fastIdentifierMap
{
  return self->_fastIdentifierMap;
}

- (void)setFastIdentifierMap:(id)a3
{
}

- (BOOL)dataSourceActionEnabled
{
  return self->_dataSourceActionEnabled;
}

- (void)setDataSourceActionEnabled:(BOOL)a3
{
  self->_dataSourceActionEnabled = a3;
}

- (double)consistentRowHeight
{
  return self->_consistentRowHeight;
}

- (void)setConsistentRowHeight:(double)a3
{
  self->_consistentRowHeight = a3;
}

- (BOOL)dataHasDetailedLabelField
{
  return self->_dataHasDetailedLabelField;
}

- (void)setDataHasDetailedLabelField:(BOOL)a3
{
  self->_dataHasDetailedLabelField = a3;
}

- (void).cxx_destruct
{
}

@end