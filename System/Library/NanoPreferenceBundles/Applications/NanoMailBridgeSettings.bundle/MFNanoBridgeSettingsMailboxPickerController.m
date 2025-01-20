@interface MFNanoBridgeSettingsMailboxPickerController
- (BOOL)selectedMailboxes:(id)a3 containsMailbox:(id)a4;
- (BOOL)toggleAllInboxesForSelectedMailboxes:(id)a3;
- (BOOL)toggleUnifiedMailboxForSelectedMailboxes:(id)a3;
- (BOOL)updateInboxSelectionWithNewMailboxSelection:(id)a3 selectedMailboxes:(id)a4;
- (MFNanoBridgeSettingsMailboxPickerController)init;
- (MFNanoBridgeSettingsMailboxPickerControllerDelegate)delegate;
- (id)_indexPathForMailbox:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_notifyDelegateThatSelectedMailboxesChanged;
- (void)_recreateMailboxes;
- (void)accountMailboxPickerController:(id)a3 didChangeSelectedMailboxes:(id)a4;
- (void)refreshData;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MFNanoBridgeSettingsMailboxPickerController

- (MFNanoBridgeSettingsMailboxPickerController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFNanoBridgeSettingsMailboxPickerController;
  return [(MFNanoBridgeSettingsMailboxPickerController *)&v3 initWithStyle:2];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFNanoBridgeSettingsMailboxPickerController;
  -[MFNanoBridgeSettingsMailboxPickerController viewWillAppear:](&v7, "viewWillAppear:");
  v5 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
  v6 = +[NSIndexPath indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
  [v5 selectRowAtIndexPath:v6 animated:v3 scrollPosition:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MFNanoBridgeSettingsMailboxPickerController;
  [(MFNanoBridgeSettingsMailboxPickerController *)&v6 viewDidLoad];
  BOOL v3 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMailboxCellIdentifier"];

  v4 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"kAccountCellIdentifier"];

  v5 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
  [v5 setSectionFooterHeight:0.0];

  [(MFNanoBridgeSettingsMailboxPickerController *)self setClearsSelectionOnViewWillAppear:0];
  [(MFNanoBridgeSettingsMailboxPickerController *)self refreshData];
}

- (void)refreshData
{
  BOOL v3 = [(NSMutableArray *)self->_selectedMailboxes firstObject];
  uint64_t v30 = [(MFNanoBridgeSettingsMailboxPickerController *)self _indexPathForMailbox:v3];

  v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 reloadCachedAccounts];

  v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  objc_super v6 = [v5 activeAccounts];
  activeAccounts = self->_activeAccounts;
  self->_activeAccounts = v6;

  v8 = [(MFNanoBridgeSettingsMailboxPickerController *)self navigationController];
  v9 = [v8 topViewController];
  currentAccountMailboxPickerController = self->_currentAccountMailboxPickerController;

  if (v9 == currentAccountMailboxPickerController)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v12 = self->_activeAccounts;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "uniqueID", v30);
          v17 = [(MFNanoBridgeSettingsAccountMailboxPickerController *)self->_currentAccountMailboxPickerController account];
          v18 = [v17 uniqueID];
          unsigned __int8 v19 = [v16 isEqualToString:v18];

          if (v19)
          {

            goto LABEL_13;
          }
        }
        id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v20 = [(MFNanoBridgeSettingsMailboxPickerController *)self navigationController];
    id v21 = [v20 popViewControllerAnimated:1];
  }
  else
  {
    v11 = self->_currentAccountMailboxPickerController;
    self->_currentAccountMailboxPickerController = 0;
  }
LABEL_13:
  [(MFNanoBridgeSettingsMailboxPickerController *)self _recreateMailboxes];
  v22 = +[MFNanoBridgeSettingsManager sharedInstance];
  v23 = [v22 includeMailMailboxes];
  v24 = (NSMutableArray *)[v23 mutableCopy];
  selectedMailboxes = self->_selectedMailboxes;
  self->_selectedMailboxes = v24;

  v26 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
  [v26 reloadData];

  v27 = [(NSMutableArray *)self->_selectedMailboxes firstObject];
  v28 = [(MFNanoBridgeSettingsMailboxPickerController *)self _indexPathForMailbox:v27];

  if (v28 && ([v28 isEqual:v31] & 1) == 0)
  {
    v29 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
    [v29 scrollToRowAtIndexPath:v28 atScrollPosition:2 animated:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2 * ([(NSArray *)self->_activeAccounts count] != 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    v8 = &OBJC_IVAR___MFNanoBridgeSettingsMailboxPickerController__mailboxes;
    goto LABEL_5;
  }
  p_activeAccounts = &self->_activeAccounts;
  if ([(NSArray *)self->_activeAccounts count] <= 1)
  {
    v8 = &OBJC_IVAR___MFNanoBridgeSettingsMailboxPickerController__singleAccountMailboxes;
LABEL_5:
    p_activeAccounts = (NSArray **)((char *)self + *v8);
  }
  NSUInteger v9 = [(NSArray *)*p_activeAccounts count];

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 1)
  {
    objc_super v7 = 0;
  }
  else
  {
    NSUInteger v4 = [(NSArray *)self->_activeAccounts count];
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    if (v4 < 2) {
      [v5 localizedStringForKey:@"MAILBOXES_SECTION_TITLE" value:&stru_2CC10 table:@"Main"];
    }
    else {
    objc_super v7 = [v5 localizedStringForKey:@"ACCOUNTS_SECTION_TITLE" value:&stru_2CC10 table:@"Main"];
    }
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v27 = a3;
  id v28 = a4;
  if ([v28 section] && (char *)-[NSArray count](self->_activeAccounts, "count") != (char *)&dword_0 + 1)
  {
    id v29 = [v27 dequeueReusableCellWithIdentifier:@"kAccountCellIdentifier" forIndexPath:v28];
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_activeAccounts, "objectAtIndexedSubscript:", [v28 row]);
    objc_super v7 = [v6 displayName];
    [v29 setTitle:v7];

    v8 = +[NSSet setWithObject:v6];
    NSUInteger v9 = +[MailAccount accountImageForAccounts:v8];
    [v29 setIcon:v9];

    [v29 setLevel:0];
    [v29 setSubtitle:&stru_2CC10];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v10 = self->_selectedMailboxes;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            v16 = [v15 accountUniqueIdentifier];
            v17 = [v6 uniqueID];
            if ([v16 isEqualToString:v17])
            {
              BOOL v18 = [v15 type] == (char *)&dword_4 + 3;

              if (!v18)
              {
                v25 = [v15 displayName];
                [v29 setSubtitle:v25];

                goto LABEL_28;
              }
            }
            else
            {
            }
          }
        }
        id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v11);
    }
LABEL_28:

    [v29 setAccessoryType:1];
  }
  else
  {
    id v29 = [v27 dequeueReusableCellWithIdentifier:@"kMailboxCellIdentifier" forIndexPath:v28];
    if ([v28 section]) {
      -[NSArray objectAtIndexedSubscript:](self->_singleAccountMailboxes, "objectAtIndexedSubscript:", [v28 row]);
    }
    else {
    unsigned __int8 v19 = -[NSArray objectAtIndexedSubscript:](self->_mailboxes, "objectAtIndexedSubscript:", [v28 row]);
    }
    if ([(NSArray *)self->_activeAccounts count] >= 2
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = [v19 accountUniqueIdentifier];
      id v21 = +[MailAccount accountWithUniqueId:v20];
      v22 = [v21 displayName];
      [v29 setTitle:v22];
    }
    else
    {
      v20 = [v19 displayName];
      [v29 setTitle:v20];
    }

    v23 = [v19 icon];
    [v29 setIcon:v23];

    objc_msgSend(v29, "setLevel:", objc_msgSend(v19, "level"));
    [v29 setSubtitle:&stru_2CC10];
    if ([(MFNanoBridgeSettingsMailboxPickerController *)self selectedMailboxes:self->_selectedMailboxes containsMailbox:v19])
    {
      uint64_t v24 = 3;
    }
    else
    {
      uint64_t v24 = 0;
    }
    [v29 setAccessoryType:v24];
  }

  return v29;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] && (char *)-[NSArray count](self->_activeAccounts, "count") != (char *)&dword_0 + 1)
  {
    v8 = [MFNanoBridgeSettingsAccountMailboxPickerController alloc];
    NSUInteger v9 = -[NSArray objectAtIndexedSubscript:](self->_activeAccounts, "objectAtIndexedSubscript:", [v7 row]);
    v10 = [(MFNanoBridgeSettingsAccountMailboxPickerController *)v8 initWithAccount:v9];
    currentAccountMailboxPickerController = self->_currentAccountMailboxPickerController;
    self->_currentAccountMailboxPickerController = v10;

    [(MFNanoBridgeSettingsAccountMailboxPickerController *)self->_currentAccountMailboxPickerController setDelegate:self];
    uint64_t v12 = [(MFNanoBridgeSettingsMailboxPickerController *)self navigationController];
    [v12 pushViewController:self->_currentAccountMailboxPickerController animated:1];
  }
  else
  {
    if ([v7 section]) {
      -[NSArray objectAtIndexedSubscript:](self->_singleAccountMailboxes, "objectAtIndexedSubscript:", [v7 row]);
    }
    else {
    uint64_t v12 = -[NSArray objectAtIndexedSubscript:](self->_mailboxes, "objectAtIndexedSubscript:", [v7 row]);
    }
    id v13 = [v6 cellForRowAtIndexPath:v7];
    unsigned __int8 v14 = [(MFNanoBridgeSettingsMailboxPickerController *)self selectedMailboxes:self->_selectedMailboxes containsMailbox:v12];
    selectedMailboxes = self->_selectedMailboxes;
    if (v14)
    {
      if ((unint64_t)[(NSMutableArray *)selectedMailboxes count] >= 2)
      {
        id v16 = [(NSMutableArray *)self->_selectedMailboxes mutableCopy];
        [v16 removeObject:v12];
        [(MFNanoBridgeSettingsMailboxPickerController *)self updateInboxSelectionWithNewMailboxSelection:v12 selectedMailboxes:v16];
        if ([v16 count])
        {
          [(NSMutableArray *)self->_selectedMailboxes removeObject:v12];
          if (v13)
          {
            [v13 setAccessoryType:0];
            [v13 setSubtitle:&stru_2CC10];
          }
        }
      }
    }
    else
    {
      [(NSMutableArray *)selectedMailboxes addObject:v12];
      if (v13) {
        [v13 setAccessoryType:3];
      }
    }
    if ([(MFNanoBridgeSettingsMailboxPickerController *)self updateInboxSelectionWithNewMailboxSelection:v12 selectedMailboxes:self->_selectedMailboxes])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_13AF0;
      block[3] = &unk_2C830;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    [(MFNanoBridgeSettingsMailboxPickerController *)self _notifyDelegateThatSelectedMailboxesChanged];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

- (void)accountMailboxPickerController:(id)a3 didChangeSelectedMailboxes:(id)a4
{
  id v6 = a4;
  [(NSMutableArray *)self->_selectedMailboxes removeAllObjects];
  [(NSMutableArray *)self->_selectedMailboxes addObjectsFromArray:v6];
  [(MFNanoBridgeSettingsMailboxPickerController *)self toggleUnifiedMailboxForSelectedMailboxes:self->_selectedMailboxes];
  [(MFNanoBridgeSettingsMailboxPickerController *)self _notifyDelegateThatSelectedMailboxesChanged];
  v5 = [(MFNanoBridgeSettingsMailboxPickerController *)self tableView];
  [v5 reloadData];
}

- (void)_recreateMailboxes
{
  BOOL v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  long long v30 = self;
  if ([(NSArray *)self->_activeAccounts count] >= 2)
  {
    NSUInteger v4 = [[MFNanoBridgeSettingsUnifiedMailbox alloc] initWithType:7];
    [(NSArray *)v3 addObject:v4];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v5 = self->_activeAccounts;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v37;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v5);
        }
        NSUInteger v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v10 = [MFNanoBridgeSettingsAccountSpecificMailbox alloc];
        id v11 = [v9 mailboxUidOfType:7 createIfNeeded:0];
        uint64_t v12 = [(MFNanoBridgeSettingsAccountSpecificMailbox *)v10 initWithMailboxUid:v11 account:v9];

        [(NSArray *)v3 addObject:v12];
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }

  id v13 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:1];
  [(NSArray *)v3 addObject:v13];

  unsigned __int8 v14 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:2];
  [(NSArray *)v3 addObject:v14];

  id v15 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:3];
  [(NSArray *)v3 addObject:v15];

  id v16 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:4];
  [(NSArray *)v3 addObject:v16];

  v17 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:6];
  [(NSArray *)v3 addObject:v17];

  BOOL v18 = [[MFNanoBridgeSettingsSharedMailbox alloc] initWithType:7];
  [(NSArray *)v3 addObject:v18];

  long long v31 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  if ((char *)[(NSArray *)self->_activeAccounts count] == (char *)&dword_0 + 1)
  {
    unsigned __int8 v19 = [(NSArray *)self->_activeAccounts objectAtIndexedSubscript:0];
    [v19 allMailboxUidsSortedWithSpecialsAtTopIncludingLocals:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (!v21) {
      goto LABEL_22;
    }
    uint64_t v22 = *(void *)v33;
    while (1)
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        objc_msgSend(v24, "nano_mailbox");
        v25 = (MFNanoBridgeSettingsAccountSpecificMailbox *)objc_claimAutoreleasedReturnValue();
        if (([(MFNanoBridgeSettingsAccountSpecificMailbox *)v25 shouldFilter] & 1) == 0)
        {
          BOOL v26 = [v24 mailboxType] == (char *)&dword_4 + 3;

          if (v26) {
            continue;
          }
          v25 = [[MFNanoBridgeSettingsAccountSpecificMailbox alloc] initWithMailboxUid:v24 account:v19];
          [(NSArray *)v31 addObject:v25];
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (!v21)
      {
LABEL_22:

        break;
      }
    }
  }
  mailboxes = v30->_mailboxes;
  v30->_mailboxes = v3;
  id v28 = v3;

  singleAccountMailboxes = v30->_singleAccountMailboxes;
  v30->_singleAccountMailboxes = v31;
}

- (id)_indexPathForMailbox:(id)a3
{
  id v4 = a3;
  if (v4 && (mailboxes = self->_mailboxes) != 0 && self->_activeAccounts)
  {
    for (unint64_t i = 0; i < [(NSArray *)mailboxes count]; ++i)
    {
      id v7 = [(NSArray *)self->_mailboxes objectAtIndexedSubscript:i];
      if ([v4 isEqual:v7])
      {
        uint64_t v9 = +[NSIndexPath indexPathForRow:i inSection:0];
LABEL_23:
        id v16 = (void *)v9;
        goto LABEL_24;
      }

      mailboxes = self->_mailboxes;
    }
    for (unint64_t j = 0; j < [(NSArray *)self->_singleAccountMailboxes count]; ++j)
    {
      id v7 = [(NSArray *)self->_singleAccountMailboxes objectAtIndexedSubscript:j];
      if ([v4 isEqual:v7])
      {
        uint64_t v9 = +[NSIndexPath indexPathForRow:j inSection:1];
        goto LABEL_23;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    id v7 = v4;
    for (unint64_t k = 0; k < [(NSArray *)self->_activeAccounts count]; ++k)
    {
      id v11 = [(NSArray *)self->_activeAccounts objectAtIndexedSubscript:k];
      uint64_t v12 = [v7 accountUniqueIdentifier];
      id v13 = [v11 uniqueID];
      if ([v12 isEqualToString:v13])
      {
        unsigned __int8 v14 = (char *)[v7 type];

        if (v14 != (unsigned char *)&dword_4 + 3)
        {
          id v16 = +[NSIndexPath indexPathForRow:k inSection:1];

          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    id v16 = 0;
LABEL_24:
  }
  else
  {
LABEL_21:
    id v16 = 0;
  }

  return v16;
}

- (BOOL)selectedMailboxes:(id)a3 containsMailbox:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isEqual:", v6, (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)_notifyDelegateThatSelectedMailboxesChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mailboxPickerController:self didChangeSelectedMailboxes:self->_selectedMailboxes];
}

- (BOOL)updateInboxSelectionWithNewMailboxSelection:(id)a3 selectedMailboxes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v8 = [(MFNanoBridgeSettingsMailboxPickerController *)self toggleAllInboxesForSelectedMailboxes:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v8 = [(MFNanoBridgeSettingsMailboxPickerController *)self toggleUnifiedMailboxForSelectedMailboxes:v7];
  }
  BOOL v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)toggleUnifiedMailboxForSelectedMailboxes:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if (objc_msgSend(v10, "type", (void)v16) == (char *)&dword_4 + 3) {
            ++v6;
          }
        }
        if (v6 == (char *)[(NSArray *)self->_activeAccounts count])
        {
          int v11 = 1;
          goto LABEL_15;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v11 = 0;
LABEL_15:

  long long v12 = [[MFNanoBridgeSettingsUnifiedMailbox alloc] initWithType:7];
  unsigned int v13 = [(MFNanoBridgeSettingsMailboxPickerController *)self selectedMailboxes:v4 containsMailbox:v12];
  if (((v11 ^ 1 | v13) & 1) == 0)
  {
    [v4 addObject:v12];
LABEL_20:
    BOOL v14 = 1;
    goto LABEL_21;
  }
  if (((v11 | v13 ^ 1) & 1) == 0)
  {
    [v4 removeObject:v12];
    goto LABEL_20;
  }
  BOOL v14 = 0;
LABEL_21:

  return v14;
}

- (BOOL)toggleAllInboxesForSelectedMailboxes:(id)a3
{
  id v4 = a3;
  long long v15 = [[MFNanoBridgeSettingsUnifiedMailbox alloc] initWithType:7];
  unsigned int v16 = [(MFNanoBridgeSettingsMailboxPickerController *)self selectedMailboxes:v4 containsMailbox:v15];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_activeAccounts;
  char v6 = 0;
  id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v11 = [v10 mailboxUidOfType:7 createIfNeeded:0];
        if (v11)
        {
          long long v12 = [[MFNanoBridgeSettingsAccountSpecificMailbox alloc] initWithMailboxUid:v11 account:v10];
          unsigned int v13 = [(MFNanoBridgeSettingsMailboxPickerController *)self selectedMailboxes:v4 containsMailbox:v12];
          if ((v16 ^ 1 | v13))
          {
            if (((v16 | v13 ^ 1) & 1) == 0)
            {
              [v4 removeObject:v12];
              goto LABEL_11;
            }
          }
          else
          {
            [v4 addObject:v12];
LABEL_11:
            char v6 = 1;
          }
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v6 & 1;
}

- (MFNanoBridgeSettingsMailboxPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFNanoBridgeSettingsMailboxPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAccountMailboxPickerController, 0);
  objc_storeStrong((id *)&self->_selectedMailboxes, 0);
  objc_storeStrong((id *)&self->_singleAccountMailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);

  objc_storeStrong((id *)&self->_activeAccounts, 0);
}

@end