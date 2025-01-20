@interface EKCalendarSubscriptionDetailsViewController
- (BOOL)enableDoneInitially;
- (BOOL)isNewCalendar;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (EKCalendarEditItemDelegate)delegate;
- (EKCalendarSubscriptionDetailsViewController)initWithCalendar:(id)a3 store:(id)a4;
- (id)_tableHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int)sectionForCalendarEditItem:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)calendarItemStartedEditing:(id)a3;
- (void)resetBackgroundColor;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation EKCalendarSubscriptionDetailsViewController

- (EKCalendarSubscriptionDetailsViewController)initWithCalendar:(id)a3 store:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)EKCalendarSubscriptionDetailsViewController;
  v7 = [(EKCalendarSubscriptionDetailsViewController *)&v38 initWithStyle:2];
  if (v7)
  {
    v8 = objc_alloc_init(EKCalendarSubscriptionURLEditItem);
    [(EKCalendarSubscriptionURLEditItem *)v8 setEditable:0];
    v26 = objc_alloc_init(EKCalendarRemoveExtraInfoEditItem);
    v41[0] = v8;
    v41[1] = v26;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    v9 = (void *)MEMORY[0x1E4F28F60];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke;
    v35[3] = &unk_1E608AA30;
    id v10 = v27;
    id v36 = v10;
    id v11 = v6;
    id v37 = v11;
    v12 = [v9 predicateWithBlock:v35];
    uint64_t v13 = [v25 filteredArrayUsingPredicate:v12];
    sections = v7->_sections;
    v7->_sections = (NSArray *)v13;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v15 = v7->_sections;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v19 setCalendar:v10 store:v11];
          [v19 setDelegate:v7];
        }
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v16);
    }

    v20 = EventKitUIBundle();
    v21 = [v20 localizedStringForKey:@"Subscription Details" value:&stru_1F0CC2140 table:0];
    [(EKCalendarSubscriptionDetailsViewController *)v7 setTitle:v21];

    objc_initWeak(&location, v7);
    uint64_t v39 = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke_2;
    v28[3] = &unk_1E60874F8;
    objc_copyWeak(&v29, &location);
    id v23 = (id)[(EKCalendarSubscriptionDetailsViewController *)v7 registerForTraitChanges:v22 withHandler:v28];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v7;
}

uint64_t __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke(uint64_t a1, void *a2)
{
  return [a2 configureWithCalendar:*(void *)(a1 + 32) store:*(void *)(a1 + 40)];
}

void __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarSubscriptionDetailsViewController;
  [(EKCalendarSubscriptionDetailsViewController *)&v3 viewDidLoad];
  [(EKCalendarSubscriptionDetailsViewController *)self resetBackgroundColor];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  id v5 = [(EKCalendarSubscriptionDetailsViewController *)self tableView];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarSubscriptionDetailsViewController;
  [(EKCalendarSubscriptionDetailsViewController *)&v6 viewWillAppear:a3];
  v4 = [(EKCalendarSubscriptionDetailsViewController *)self _tableHeaderView];
  id v5 = [(EKCalendarSubscriptionDetailsViewController *)self tableView];
  [v5 setTableHeaderView:v4];
}

- (id)_tableHeaderView
{
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = [EKSubscribedCalendarDescriptionHeader alloc];
    id v5 = [(EKCalendarSubscriptionDetailsViewController *)self tableView];
    [v5 bounds];
    objc_super v6 = [(EKSubscribedCalendarDescriptionHeader *)v4 initWithParentWidth:CGRectGetWidth(v10)];
    v7 = self->_tableHeaderView;
    self->_tableHeaderView = v6;

    tableHeaderView = self->_tableHeaderView;
  }

  return tableHeaderView;
}

- (void)viewWillLayoutSubviews
{
  tableHeaderView = self->_tableHeaderView;
  id v3 = [(EKCalendarSubscriptionDetailsViewController *)self tableView];
  [v3 bounds];
  [(EKSubscribedCalendarDescriptionHeader *)tableHeaderView updateLayoutForWidth:CGRectGetWidth(v5)];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 numberOfSubitems];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  objc_super v6 = -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v5 row];

  v8 = [v6 cellForSubitemAtIndex:v7];

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 headerTitle];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 footerTitle];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v6 section]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 row];

  [v8 calendarEditor:0 didSelectSubitem:v7];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  id v6 = -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v5 row];

  LOBYTE(v5) = [v6 calendarEditor:0 shouldSelectSubitem:v7];
  return (char)v5;
}

- (void)calendarItemStartedEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarSubscriptionDetailsViewController *)self delegate];
  [v5 calendarItemStartedEditing:v4];
}

- (int)sectionForCalendarEditItem:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_sections count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSArray *)self->_sections objectAtIndexedSubscript:v5];

      if (v6 == v4) {
        break;
      }
      if ([(NSArray *)self->_sections count] <= ++v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    LODWORD(v5) = -1;
  }

  return v5;
}

- (BOOL)isNewCalendar
{
  v2 = [(EKCalendarSubscriptionDetailsViewController *)self delegate];
  char v3 = [v2 isNewCalendar];

  return v3;
}

- (BOOL)enableDoneInitially
{
  v2 = [(EKCalendarSubscriptionDetailsViewController *)self delegate];
  char v3 = [v2 enableDoneInitially];

  return v3;
}

- (EKCalendarEditItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKCalendarEditItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_tableHeaderView, 0);
}

@end