@interface EKCalendarAccountTableViewController
- (EKCalendar)calendar;
- (EKCalendarAccountTableViewController)initWithCalendar:(id)a3 andStore:(id)a4;
- (EKCalendarAccountTableViewControllerDelegate)delegate;
- (EKEventStore)eventStore;
- (NSMutableArray)accounts;
- (NSString)currentSourceIdentifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)resetBackgroundColor;
- (void)setCalendar:(id)a3;
- (void)setCurrentSourceIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventStore:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation EKCalendarAccountTableViewController

- (EKCalendarAccountTableViewController)initWithCalendar:(id)a3 andStore:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKCalendarAccountTableViewController;
  v8 = [(EKCalendarAccountTableViewController *)&v16 initWithStyle:2];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_eventStore, v7);
    objc_storeWeak((id *)&v9->_calendar, v6);
    objc_initWeak(&location, v9);
    v17[0] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__EKCalendarAccountTableViewController_initWithCalendar_andStore___block_invoke;
    v13[3] = &unk_1E60874F8;
    objc_copyWeak(&v14, &location);
    id v11 = (id)[(EKCalendarAccountTableViewController *)v9 registerForTraitChanges:v10 withHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__EKCalendarAccountTableViewController_initWithCalendar_andStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarAccountTableViewController;
  [(EKCalendarAccountTableViewController *)&v6 loadView];
  v3 = EventKitUIBundle();
  v4 = [v3 localizedStringForKey:@"Accounts - Account Picker" value:@"Accounts" table:0];
  [(EKCalendarAccountTableViewController *)self setTitle:v4];

  v5 = [(EKCalendarAccountTableViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"EKCalendarAccountCell"];

  [(EKCalendarAccountTableViewController *)self resetBackgroundColor];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  id v5 = [(EKCalendarAccountTableViewController *)self tableView];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v4];
}

- (NSMutableArray)accounts
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)accounts_accounts;
  if (!accounts_accounts)
  {
    v4 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    objc_super v6 = objc_msgSend(WeakRetained, "sources", 0);

    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v7) {
      goto LABEL_20;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained((id *)&self->_calendar);
        int v13 = [v12 isSubscribed];

        if (v13)
        {
          if ([v11 isDelegate]) {
            goto LABEL_15;
          }
          id v14 = [v11 constraints];
          if ([v14 supportsSubscribedCalendars])
          {

LABEL_14:
            [v4 addObject:v11];
            goto LABEL_15;
          }
          uint64_t v15 = [v11 sourceType];

          if (v15 == 4) {
            goto LABEL_14;
          }
        }
        else if ([v11 supportsCalendarCreation] {
               && [v11 sourceType] != 4
        }
               && ([v11 isDelegate] & 1) == 0)
        {
          goto LABEL_14;
        }
LABEL_15:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v8 = v16;
      if (!v16)
      {
LABEL_20:

        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
        v18 = (void *)accounts_accounts;
        accounts_accounts = v17;

        BOOL v3 = (void *)accounts_accounts;
        break;
      }
    }
  }

  return (NSMutableArray *)v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(EKCalendarAccountTableViewController *)self accounts];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"EKCalendarAccountCell" forIndexPath:v6];
  uint64_t v8 = [(EKCalendarAccountTableViewController *)self accounts];
  uint64_t v9 = [v6 row];

  uint64_t v10 = [v8 objectAtIndexedSubscript:v9];

  id v11 = CalDisplayedTitleForSourceAsCalendarTarget(v10);
  id v12 = [v7 textLabel];
  [v12 setText:v11];

  int v13 = [(EKCalendarAccountTableViewController *)self currentSourceIdentifier];
  id v14 = [v10 sourceIdentifier];
  LODWORD(v12) = [v13 isEqualToString:v14];

  if (v12) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [v7 setAccessoryType:v15];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(EKCalendarAccountTableViewController *)self accounts];
  uint64_t v7 = [v5 row];

  id v14 = [v6 objectAtIndexedSubscript:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_calendar);
  [WeakRetained setSource:v14];

  id v9 = objc_loadWeakRetained((id *)&self->_calendar);
  objc_msgSend(v9, "setDisplayOrder:", objc_msgSend(v14, "displayOrderForNewCalendar"));

  uint64_t v10 = [v14 sourceIdentifier];
  [(EKCalendarAccountTableViewController *)self setCurrentSourceIdentifier:v10];

  id v11 = [(EKCalendarAccountTableViewController *)self tableView];
  [v11 reloadData];

  id v12 = [(EKCalendarAccountTableViewController *)self delegate];
  LOBYTE(WeakRetained) = objc_opt_respondsToSelector();

  if (WeakRetained)
  {
    int v13 = [(EKCalendarAccountTableViewController *)self delegate];
    [v13 accountTableViewController:self selectedSourceChanged:v14];
  }
}

- (EKCalendarAccountTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKCalendarAccountTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)currentSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setCurrentSourceIdentifier:(id)a3
{
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (void)setEventStore:(id)a3
{
}

- (EKCalendar)calendar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_calendar);

  return (EKCalendar *)WeakRetained;
}

- (void)setCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_calendar);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_currentSourceIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end