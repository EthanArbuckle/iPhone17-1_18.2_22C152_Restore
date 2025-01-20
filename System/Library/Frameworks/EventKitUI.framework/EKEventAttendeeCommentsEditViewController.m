@interface EKEventAttendeeCommentsEditViewController
- (BOOL)_canEditAnyParticipantComment;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (EKEventAttendeeCommentsEditViewController)initWithEKEvent:(id)a3;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel;
- (void)_createTableData;
- (void)_done:(id)a3;
- (void)_edit;
- (void)_localeChanged;
- (void)_popViewControllerAnimated:(BOOL)a3;
- (void)_transitionTableViewOutOfEditingMode;
- (void)setNavigationDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation EKEventAttendeeCommentsEditViewController

- (EKEventAttendeeCommentsEditViewController)initWithEKEvent:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKEventAttendeeCommentsEditViewController;
  v6 = [(EKEventAttendeeCommentsEditViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    headerDateFormatter = v7->_headerDateFormatter;
    v7->_headerDateFormatter = v8;

    [(NSDateFormatter *)v7->_headerDateFormatter setTimeStyle:0];
    [(NSDateFormatter *)v7->_headerDateFormatter setDateStyle:2];
    [(NSDateFormatter *)v7->_headerDateFormatter setDoesRelativeDateFormatting:1];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__localeChanged name:*MEMORY[0x1E4F57AB0] object:0];

    [(EKEventAttendeeCommentsEditViewController *)v7 _createTableData];
  }

  return v7;
}

- (void)_createTableData
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  tableData = self->_tableData;
  self->_tableData = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v29 = CUIKCalendar();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(EKEvent *)self->_event attendees];
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v11 = [v10 comment];
        objc_super v12 = [MEMORY[0x1E4F57BA8] stringWithAutoCommentRemoved:v11];

        if ([v12 length])
        {
          v13 = [v10 commentLastModifiedDate];

          if (v13)
          {
            v14 = [v10 commentLastModifiedDate];
            v15 = [v29 startOfDayForDate:v14];

            v16 = [v5 objectForKeyedSubscript:v15];
            if (!v16)
            {
              v16 = [MEMORY[0x1E4F1CA48] array];
              [v5 setObject:v16 forKeyedSubscript:v15];
            }
            [v16 addObject:v10];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1C9C8] distantPast];
            v15 = [v5 objectForKeyedSubscript:v17];

            if (!v15)
            {
              v15 = [MEMORY[0x1E4F1CA48] array];
              v18 = [MEMORY[0x1E4F1C9C8] distantPast];
              [v5 setObject:v15 forKeyedSubscript:v18];
            }
            [v15 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  v19 = [v5 allKeys];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:0 ascending:0];
  v40 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v22 = [v19 sortedArrayUsingDescriptors:v21];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        [v28 sortUsingComparator:&__block_literal_global_42];
        [(NSMutableArray *)self->_tableData addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }
}

uint64_t __61__EKEventAttendeeCommentsEditViewController__createTableData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 commentLastModifiedDate];
  uint64_t v7 = [v5 commentLastModifiedDate];
  uint64_t v8 = (void *)v7;
  if (!(v6 | v7) || (uint64_t v9 = [(id)v7 compare:v6]) == 0)
  {
    v10 = [MEMORY[0x1E4F57B28] displayNameForIdentity:v4];
    v11 = [MEMORY[0x1E4F57B28] displayNameForIdentity:v5];
    uint64_t v9 = [v10 caseInsensitiveCompare:v11];
  }
  return v9;
}

- (void)viewDidLoad
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)EKEventAttendeeCommentsEditViewController;
  [(EKEventAttendeeCommentsEditViewController *)&v30 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  uint64_t v6 = [(EKEventAttendeeCommentsEditViewController *)self view];
  [v6 addSubview:self->_tableView];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v28 = [(UITableView *)self->_tableView leadingAnchor];
  v29 = [(EKEventAttendeeCommentsEditViewController *)self view];
  v27 = [v29 leadingAnchor];
  uint64_t v26 = [v28 constraintEqualToAnchor:v27];
  v31[0] = v26;
  uint64_t v24 = [(UITableView *)self->_tableView trailingAnchor];
  uint64_t v25 = [(EKEventAttendeeCommentsEditViewController *)self view];
  id v23 = [v25 trailingAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v31[1] = v21;
  uint64_t v7 = [(UITableView *)self->_tableView topAnchor];
  uint64_t v8 = [(EKEventAttendeeCommentsEditViewController *)self view];
  uint64_t v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v31[2] = v10;
  v11 = [(UITableView *)self->_tableView bottomAnchor];
  objc_super v12 = [(EKEventAttendeeCommentsEditViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v31[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v22 activateConstraints:v15];

  if ([(EKEventAttendeeCommentsEditViewController *)self _canEditAnyParticipantComment])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__edit];
    v17 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
    [v17 setRightBarButtonItem:v16];
  }
  v18 = EventKitUIBundle();
  v19 = [v18 localizedStringForKey:@"Comments" value:&stru_1F0CC2140 table:0];
  v20 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
  [v20 setTitle:v19];
}

- (void)_localeChanged
{
  [(EKEventAttendeeCommentsEditViewController *)self _createTableData];
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)_edit
{
  [(UITableView *)self->_tableView setEditing:1 animated:1];
  [(UITableView *)self->_tableView beginUpdates];
  [(UITableView *)self->_tableView endUpdates];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  id v4 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v6 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel];
  id v5 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v6];
}

- (void)_done:(id)a3
{
  id v4 = a3;
  if ([(EKEvent *)self->_event hasChanges])
  {
    id v5 = [(UIResponder *)self EKUI_editor];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__EKEventAttendeeCommentsEditViewController__done___block_invoke;
    aBlock[3] = &unk_1E6089FA8;
    id v6 = v5;
    id v21 = v6;
    v22 = self;
    uint64_t v7 = _Block_copy(aBlock);
    if ([(EKEvent *)self->_event isOrWasPartOfRecurringSeries])
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__14;
      v18 = __Block_byref_object_dispose__14;
      id v19 = 0;
      event = self->_event;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__EKEventAttendeeCommentsEditViewController__done___block_invoke_37;
      v11[3] = &unk_1E6089FD0;
      v11[4] = self;
      id v12 = v7;
      v13 = &v14;
      uint64_t v9 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:0 viewController:self barButtonItem:v4 forEvent:event withCompletionHandler:v11];
      v10 = (void *)v15[5];
      v15[5] = v9;

      _Block_object_dispose(&v14, 8);
    }
    else
    {
      (*((void (**)(void *, EKEvent *, void))v7 + 2))(v7, self->_event, 0);
      [(EKEventAttendeeCommentsEditViewController *)self _transitionTableViewOutOfEditingMode];
      if (![(UITableView *)self->_tableView numberOfSections]) {
        [(EKEventAttendeeCommentsEditViewController *)self _popViewControllerAnimated:1];
      }
    }
  }
  else
  {
    [(EKEventAttendeeCommentsEditViewController *)self _transitionTableViewOutOfEditingMode];
  }
}

uint64_t __51__EKEventAttendeeCommentsEditViewController__done___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) saveEvent:*(void *)(*(void *)(a1 + 40) + 976) span:a3 error:0];
}

uint64_t __51__EKEventAttendeeCommentsEditViewController__done___block_invoke_37(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) >= 3)
  {
    uint64_t v2 = result;
    (*(void (**)(void))(*(void *)(result + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(v2 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    [*(id *)(v2 + 32) _transitionTableViewOutOfEditingMode];
    result = [*(id *)(*(void *)(v2 + 32) + 984) numberOfSections];
    if (!result)
    {
      id v5 = *(void **)(v2 + 32);
      return [v5 _popViewControllerAnimated:1];
    }
  }
  return result;
}

- (void)_transitionTableViewOutOfEditingMode
{
  [(UITableView *)self->_tableView setEditing:0 animated:1];
  [(UITableView *)self->_tableView beginUpdates];
  [(UITableView *)self->_tableView endUpdates];
  if ([(EKEventAttendeeCommentsEditViewController *)self _canEditAnyParticipantComment])
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__edit];
    id v4 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
    [v4 setRightBarButtonItem:v3];
  }
  else
  {
    uint64_t v3 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
    [v3 setRightBarButtonItem:0];
  }

  id v5 = [(EKEventAttendeeCommentsEditViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:0];
}

- (void)_cancel
{
  if ([(EKEvent *)self->_event hasChanges])
  {
    [(EKEvent *)self->_event rollback];
    [(EKEventAttendeeCommentsEditViewController *)self _createTableData];
    [(UITableView *)self->_tableView reloadData];
  }

  [(EKEventAttendeeCommentsEditViewController *)self _transitionTableViewOutOfEditingMode];
}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(EKEventAttendeeCommentsEditViewController *)self navigationDelegate];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(EKEventAttendeeCommentsEditViewController *)self navigationController];
  }
  id v8 = v7;

  if (objc_opt_respondsToSelector()) {
    [v8 popViewControllerAnimated:v3];
  }
}

- (BOOL)_canEditAnyParticipantComment
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(EKEvent *)self->_event isEditable])
  {
    if (([(EKEvent *)self->_event allowsClearingCommentsAsOrganizer] & 1) != 0
      || ([MEMORY[0x1E4F57C00] sharedPreferences],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v4) = [v3 forceAllowClearComments],
          v3,
          v4))
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v5 = self->_tableData;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            long long v16 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            id v4 = v10;
            uint64_t v11 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v17;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v17 != v13) {
                    objc_enumerationMutation(v4);
                  }
                  if ([*(id *)(*((void *)&v16 + 1) + 8 * j) participantType] == 2)
                  {

                    LOBYTE(v4) = 0;
                    goto LABEL_23;
                  }
                }
                uint64_t v12 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
          LOBYTE(v4) = 1;
        }
        while (v7);
      }
      else
      {
        LOBYTE(v4) = 1;
      }
LABEL_23:
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_tableData count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_tableData objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  tableData = self->_tableData;
  id v5 = a4;
  uint64_t v6 = -[NSMutableArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v5 row];

  uint64_t v8 = [v6 objectAtIndexedSubscript:v7];

  uint64_t v9 = [[EKAttendeeCommentsTableViewCell alloc] initWithParticipant:v8];

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__EKEventAttendeeCommentsEditViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  v11[3] = &unk_1E6087548;
  v11[4] = self;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [v9 performBatchUpdates:v11 completion:&__block_literal_global_47];
}

void __92__EKEventAttendeeCommentsEditViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "section"));
  BOOL v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));

  [v3 setComment:0];
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "section"));
  objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  id v5 = *(void **)(a1 + 48);
  v9[0] = *(void *)(a1 + 40);
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v5 deleteRowsAtIndexPaths:v6 withRowAnimation:100];

  if (![v4 count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    id v7 = *(void **)(a1 + 48);
    id v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    [v7 deleteSections:v8 withRowAnimation:100];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  tableData = self->_tableData;
  id v6 = a4;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", [v6 section]);
  uint64_t v8 = [v6 row];

  id v9 = [v7 objectAtIndexedSubscript:v8];

  if ([v9 participantType] == 2) {
    char v10 = 0;
  }
  else {
    char v10 = [(EKEvent *)self->_event isEditable];
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(NSMutableArray *)self->_tableData objectAtIndexedSubscript:a4];
  id v6 = [v5 objectAtIndexedSubscript:0];

  id v7 = [v6 commentLastModifiedDate];

  if (v7)
  {
    headerDateFormatter = self->_headerDateFormatter;
    id v9 = [v6 commentLastModifiedDate];
    char v10 = [(NSDateFormatter *)headerDateFormatter stringFromDate:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [a3 isEditing];
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  return (EKUIViewControllerNavigationDelegate *)WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_headerDateFormatter, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end