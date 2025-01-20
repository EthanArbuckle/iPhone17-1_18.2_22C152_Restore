@interface CPSDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (CPSDataSource)init;
- (NSIndexPath)firstItemIndexPath;
- (UITableView)tableView;
- (id)cellConfigureBlock;
- (id)cellCreateBlock;
- (id)indexPathForItemWithIdentifier:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowAnimation;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)deleteSectionsAtIndexes:(id)a3;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)insertSectionsAtIndexes:(id)a3;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)reloadData;
- (void)reloadItemsAtIndexPaths:(id)a3;
- (void)setCellConfigureBlock:(id)a3;
- (void)setCellCreateBlock:(id)a3;
- (void)setRowAnimation:(int64_t)a3;
- (void)setTableView:(id)a3;
@end

@implementation CPSDataSource

- (CPSDataSource)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSDataSource;
  v4 = [(CPSDataSource *)&v5 init];
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4) {
    v7->_rowAnimation = 5;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)setTableView:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_tableView, location[0]);
  if (location[0]) {
    [location[0] setDataSource:v4];
  }
  objc_storeStrong(location, 0);
}

- (id)itemAtIndexPath:(id)a3
{
  SEL v6 = self;
  SEL v5 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  [(CPSDataSource *)v6 doesNotRecognizeSelector:v5];
  objc_storeStrong(&location, 0);
  return 0;
}

- (int64_t)numberOfSections
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (NSIndexPath)firstItemIndexPath
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v4 = [(CPSDataSource *)v6 numberOfSections];
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = [(CPSDataSource *)v8 numberOfItemsInSection:a4];
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = [(CPSDataSource *)v14 itemAtIndexPath:v12];
  v7 = (uint64_t (**)(id, id, id, id))[(CPSDataSource *)v14 cellCreateBlock];
  id v10 = (id)v7[2](v7, v11, v12, location[0]);

  id v8 = [(CPSDataSource *)v14 cellConfigureBlock];
  if (v8)
  {
    int64_t v6 = (void (**)(id, id, id, id))[(CPSDataSource *)v14 cellConfigureBlock];
    v6[2](v6, v10, v11, v12);
  }
  id v5 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  id v6 = self;
  SEL v5 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  [(CPSDataSource *)v6 doesNotRecognizeSelector:v5];
  objc_storeStrong(&location, 0);
  return 0;
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSDataSource *)v5 tableView];
  [(UITableView *)v3 insertRowsAtIndexPaths:location[0] withRowAnimation:[(CPSDataSource *)v5 rowAnimation]];

  objc_storeStrong(location, 0);
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSDataSource *)v5 tableView];
  [(UITableView *)v3 deleteRowsAtIndexPaths:location[0] withRowAnimation:[(CPSDataSource *)v5 rowAnimation]];

  objc_storeStrong(location, 0);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSDataSource *)v5 tableView];
  [(UITableView *)v3 reloadRowsAtIndexPaths:location[0] withRowAnimation:[(CPSDataSource *)v5 rowAnimation]];

  objc_storeStrong(location, 0);
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  SEL v5 = [(CPSDataSource *)v8 tableView];
  [(UITableView *)v5 moveRowAtIndexPath:location[0] toIndexPath:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSectionsAtIndexes:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSDataSource *)v5 tableView];
  [(UITableView *)v3 insertSections:location[0] withRowAnimation:[(CPSDataSource *)v5 rowAnimation]];

  objc_storeStrong(location, 0);
}

- (void)deleteSectionsAtIndexes:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSDataSource *)v5 tableView];
  [(UITableView *)v3 deleteSections:location[0] withRowAnimation:[(CPSDataSource *)v5 rowAnimation]];

  objc_storeStrong(location, 0);
}

- (void)reloadData
{
  v2 = [(CPSDataSource *)self tableView];
  [(UITableView *)v2 reloadData];
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (int64_t)rowAnimation
{
  return self->_rowAnimation;
}

- (void)setRowAnimation:(int64_t)a3
{
  self->_rowAnimation = a3;
}

- (id)cellConfigureBlock
{
  return self->_cellConfigureBlock;
}

- (void)setCellConfigureBlock:(id)a3
{
}

- (id)cellCreateBlock
{
  return self->_cellCreateBlock;
}

- (void)setCellCreateBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end