@interface MCSectionBasedTableViewController
- (MCSectionBasedTableView)sectionBasedTableView;
- (NSArray)sectionControllers;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)defaultView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_registerCellClass;
- (void)loadView;
- (void)setSectionBasedTableView:(id)a3;
- (void)setSectionControllers:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCSectionBasedTableViewController

- (void)loadView
{
  id v6 = [(MCSectionBasedTableViewController *)self defaultView];
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  objc_msgSend(v6, "setFrame:");

  [(MCSectionBasedTableViewController *)self setView:v6];
  [(MCSectionBasedTableViewController *)self setSectionBasedTableView:v6];
  v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v5 = [(MCSectionBasedTableViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (id)defaultView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCSectionBasedTableViewController;
  [(MCSectionBasedTableViewController *)&v7 viewDidLoad];
  [(MCSectionBasedTableViewController *)self _registerCellClass];
  v3 = [(MCSectionBasedTableViewController *)self sectionBasedTableView];
  v4 = [v3 tableView];
  [v4 setDelegate:self];

  v5 = [(MCSectionBasedTableViewController *)self sectionBasedTableView];
  id v6 = [v5 tableView];
  [v6 setDataSource:self];
}

- (void)_registerCellClass
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(MCSectionBasedTableViewController *)self sectionControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        v9 = [(MCSectionBasedTableViewController *)self sectionBasedTableView];
        v10 = [v9 tableView];
        [v8 registerCellClassWithTableView:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v11 = [(MCSectionBasedTableViewController *)self sectionBasedTableView];
  v12 = [v11 tableView];
  [v12 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"sectionHeader"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(MCSectionBasedTableViewController *)self sectionControllers];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(MCSectionBasedTableViewController *)self sectionControllers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a4];
  int64_t v7 = [v6 numberOfRows];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MCSectionBasedTableViewController *)self sectionControllers];
  int64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v5 row];

  v9 = [v7 cellForRowAtIndex:v8];

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return (id)objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"sectionHeader", a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MCSectionBasedTableViewController *)self sectionControllers];
  int64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v5 row];

  [v7 heightForRowAtIndex:v8];
  double v10 = v9;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(MCSectionBasedTableViewController *)self sectionControllers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a4];
  [v6 heightForHeader];
  double v8 = v7;

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(MCSectionBasedTableViewController *)self sectionControllers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a4];
  double v7 = [v6 titleForHeader];

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 50.0;
}

- (NSArray)sectionControllers
{
  return self->_sectionControllers;
}

- (void)setSectionControllers:(id)a3
{
}

- (MCSectionBasedTableView)sectionBasedTableView
{
  return self->_sectionBasedTableView;
}

- (void)setSectionBasedTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionBasedTableView, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
}

@end