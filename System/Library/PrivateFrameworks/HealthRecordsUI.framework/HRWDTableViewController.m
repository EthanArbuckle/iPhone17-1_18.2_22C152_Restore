@interface HRWDTableViewController
+ (id)tableViewSectionClasses;
- (HRProfile)profile;
- (HRWDTableViewController)initWithCoder:(id)a3;
- (HRWDTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HRWDTableViewController)initWithStyle:(int64_t)a3;
- (NSArray)tableSections;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_section:(int64_t)a3;
- (id)_sectionAtIndexPath:(id)a3;
- (id)indexPathForCell:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addObservers;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)pushViewController:(id)a3;
- (void)reloadSection:(unint64_t)a3 animated:(BOOL)a4;
- (void)reloadTable;
- (void)setProfile:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HRWDTableViewController

- (void)_addObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_applicationWillEnterForeground name:*MEMORY[0x1E4FB2730] object:0];
  [v3 addObserver:self selector:sel_applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];
}

- (HRWDTableViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HRWDTableViewController;
  id v3 = [(HRWDTableViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(HRWDTableViewController *)v3 _addObservers];
  }
  return v4;
}

- (HRWDTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HRWDTableViewController;
  v4 = [(HRWDTableViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(HRWDTableViewController *)v4 _addObservers];
  }
  return v5;
}

- (HRWDTableViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HRWDTableViewController;
  id v3 = [(HRWDTableViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HRWDTableViewController *)v3 _addObservers];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HRWDTableViewController;
  [(HRWDTableViewController *)&v4 dealloc];
}

+ (id)tableViewSectionClasses
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HRWDTableViewController;
  -[HRWDTableViewController viewWillAppear:](&v14, sel_viewWillAppear_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_tableSections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "viewWillAppear:", v3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)applicationWillEnterForeground
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_tableSections;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "applicationWillEnterForeground", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)applicationDidEnterBackground
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_tableSections;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "applicationDidEnterBackground", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)viewDidLoad
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HRWDTableViewController;
  [(HKTableViewController *)&v18 viewDidLoad];
  uint64_t v3 = [(HRWDTableViewController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "tableViewSectionClasses", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = (void *)[objc_alloc(*(Class *)(*((void *)&v14 + 1) + 8 * v10)) initWithDelegate:self atSection:v8 + v10];
        [v11 setUpWithTableViewController:self];
        [v4 addObject:v11];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      v8 += v10;
    }
    while (v7);
  }

  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
  tableSections = self->_tableSections;
  self->_tableSections = v12;

  [(HRWDTableViewController *)self reloadTable];
}

- (void)reloadTable
{
  id v2 = [(HRWDTableViewController *)self tableView];
  [v2 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(HRWDTableViewController *)self _section:a4];
  int64_t v5 = [v4 numberOfRows];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HRWDTableViewController *)self _sectionAtIndexPath:v6];
  uint64_t v9 = [v6 row];

  uint64_t v10 = [v8 cellForRow:v9 table:v7];

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_tableSections count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = [(HRWDTableViewController *)self _section:a4];
  int64_t v5 = [v4 titleForHeader];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(HRWDTableViewController *)self _section:a4];
  int64_t v5 = [v4 titleForFooter];

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HRWDTableViewController *)self _sectionAtIndexPath:v5];
  uint64_t v7 = [v5 row];

  [v6 estimatedHeightForRow:v7];
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(HRWDTableViewController *)self _sectionAtIndexPath:v5];
  uint64_t v6 = [v5 row];

  [v7 accessoryButtonTappedForRow:v6];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HRWDTableViewController *)self _sectionAtIndexPath:v5];
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "row"));
  double v8 = [v6 willSelectRow:v7];

  if (v8)
  {
    uint64_t v9 = [v8 integerValue];
    if (v9 == [v5 row]) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(HRWDTableViewController *)self _sectionAtIndexPath:v6];
  uint64_t v9 = [v6 row];
  uint64_t v10 = [v7 cellForRowAtIndexPath:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v12[3] = &unk_1E644ABF8;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v8 didSelectRow:v9 representedByCell:v10 withCompletion:v12];
}

void __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    block[3] = &unk_1E644ABD0;
    uint64_t v4 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v6 = v4;
    char v7 = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __61__HRWDTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 deselectRowAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (id)_section:(int64_t)a3
{
  return [(NSArray *)self->_tableSections objectAtIndexedSubscript:a3];
}

- (id)_sectionAtIndexPath:(id)a3
{
  tableSections = self->_tableSections;
  uint64_t v4 = [a3 section];
  return [(NSArray *)tableSections objectAtIndexedSubscript:v4];
}

- (id)indexPathForCell:(id)a3
{
  id v4 = a3;
  id v5 = [(HRWDTableViewController *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  return v6;
}

- (void)reloadSection:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  if (v7 == v4)
  {
    id v13 = [(HRWDTableViewController *)self tableView];
    uint64_t v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
    [v13 reloadSections:v12 withRowAnimation:5];
  }
  else
  {
    uint64_t v8 = v7;
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v4];
    uint64_t v9 = [(HRWDTableViewController *)self tableView];
    uint64_t v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
    [v9 reloadSections:v10 withRowAnimation:5];

    id v11 = (void *)MEMORY[0x1E4FB1EB0];
    [v11 setAnimationsEnabled:v8];
  }
}

- (void)pushViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(HRWDTableViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (NSArray)tableSections
{
  return self->_tableSections;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_tableSections, 0);
}

@end