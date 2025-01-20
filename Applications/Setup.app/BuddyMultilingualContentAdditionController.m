@interface BuddyMultilingualContentAdditionController
- (BuddyMultilingualContentAdditionController)initWithChoseableDataStore:(id)a3 selectionCallback:(id)a4;
- (NSMutableArray)dataStore;
- (UITableView)tableView;
- (id)selectionCallBack;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDataStore:(id)a3;
- (void)setSelectionCallBack:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMultilingualContentAdditionController

- (BuddyMultilingualContentAdditionController)initWithChoseableDataStore:(id)a3 selectionCallback:(id)a4
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v5 = v22;
  id v22 = 0;
  v19.receiver = v5;
  v19.super_class = (Class)BuddyMultilingualContentAdditionController;
  v6 = [(BuddyMultilingualContentAdditionController *)&v19 initWithNibName:0 bundle:0];
  id v22 = v6;
  objc_storeStrong(&v22, v6);
  if (v6)
  {
    id v7 = [location[0] mutableCopy];
    v8 = (void *)*((void *)v22 + 1);
    *((void *)v22 + 1) = v7;

    id v9 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v10 = (void *)*((void *)v22 + 2);
    *((void *)v22 + 2) = v9;

    [*((id *)v22 + 2) setDelegate:v22];
    [*((id *)v22 + 2) setDataSource:v22];
    id v11 = [v20 copy];
    v12 = (void *)*((void *)v22 + 3);
    *((void *)v22 + 3) = v11;

    id v13 = [v22 view];
    id v14 = [v22 tableView];
    [v13 addSubview:v14];

    [*((id *)v22 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = (void *)*((void *)v22 + 2);
    id v16 = [v22 view];
    [v15 pinToEdges:v16];
  }
  v17 = (BuddyMultilingualContentAdditionController *)v22;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v22, 0);
  return v17;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualContentAdditionController;
  [(BuddyMultilingualContentAdditionController *)&v4 viewWillAppear:a3];
  v3 = [(BuddyMultilingualContentAdditionController *)v7 tableView];
  [(UITableView *)v3 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v5 = [(BuddyMultilingualContentAdditionController *)v9 dataStore];
  id v6 = [(NSMutableArray *)v5 count];

  objc_storeStrong(location, 0);
  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = [location[0] dequeueReusableCellWithIdentifier:@"com.purpleBuddy.BuddyMultilingualAdditionCell"];
  if (!v13)
  {
    id v13 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"com.purpleBuddy.BuddyMultilingualAdditionCell"];
  }
  BOOL v5 = [(BuddyMultilingualContentAdditionController *)v16 dataStore];
  id v12 = -[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", [v14 row]);

  id v6 = [v12 title];
  id v7 = [v13 textLabel];
  [v7 setText:v6];

  id v8 = [v12 detailText];
  id v9 = [v13 detailTextLabel];
  [v9 setText:v8];

  [v13 setSelectionStyle:2];
  id v10 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v5 = [(BuddyMultilingualContentAdditionController *)v13 selectionCallBack];

  if (v5)
  {
    id v6 = [(BuddyMultilingualContentAdditionController *)v13 dataStore];
    id v10 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", [v11 row]);

    id v7 = [(BuddyMultilingualContentAdditionController *)v13 dataStore];
    -[NSMutableArray removeObjectAtIndex:](v7, "removeObjectAtIndex:", [v11 row]);

    id v8 = (void (**)(id, id))[(BuddyMultilingualContentAdditionController *)v13 selectionCallBack];
    v8[2](v8, v10);

    id v9 = [(BuddyMultilingualContentAdditionController *)v13 tableView];
    [(UITableView *)v9 reloadData];

    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (NSMutableArray)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (id)selectionCallBack
{
  return self->_selectionCallBack;
}

- (void)setSelectionCallBack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end