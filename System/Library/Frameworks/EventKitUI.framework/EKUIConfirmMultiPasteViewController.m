@interface EKUIConfirmMultiPasteViewController
- (EKUIConfirmMultiPasteViewController)initWithSearchResult:(id)a3 pasteboardManager:(id)a4 eventStore:(id)a5 dateForPaste:(id)a6;
- (EKUIConfirmMultiPasteViewControllerDelegate)delegate;
- (id)popupMenu:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKUIConfirmMultiPasteViewController

- (EKUIConfirmMultiPasteViewController)initWithSearchResult:(id)a3 pasteboardManager:(id)a4 eventStore:(id)a5 dateForPaste:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)EKUIConfirmMultiPasteViewController;
  v15 = [(EKUIConfirmMultiPasteViewController *)&v30 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchResult, a3);
    objc_storeStrong((id *)&v16->_pasteboardManager, a4);
    objc_storeStrong((id *)&v16->_eventStore, a5);
    uint64_t v17 = [v12 calendarToPasteTo];
    selectedCalendar = v16->_selectedCalendar;
    v16->_selectedCalendar = (EKCalendar *)v17;

    objc_storeStrong((id *)&v16->_dateForPaste, a6);
    v19 = EventKitUIBundle();
    v20 = [v19 localizedStringForKey:@"Paste Multiple Events" value:&stru_1F0CC2140 table:0];
    v21 = [(EKUIConfirmMultiPasteViewController *)v16 navigationItem];
    [v21 setTitle:v20];

    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v16 action:sel__cancel_];
    v23 = [(EKUIConfirmMultiPasteViewController *)v16 navigationItem];
    [v23 setLeftBarButtonItem:v22];

    id v24 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v25 = EventKitUIBundle();
    v26 = [v25 localizedStringForKey:@"Paste - confirmation nav bar button" value:@"Paste" table:0];
    v27 = (void *)[v24 initWithTitle:v26 style:2 target:v16 action:sel__done_];
    v28 = [(EKUIConfirmMultiPasteViewController *)v16 navigationItem];
    [v28 setRightBarButtonItem:v27];
  }
  return v16;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIConfirmMultiPasteViewController;
  [(EKUIConfirmMultiPasteViewController *)&v6 viewWillAppear:a3];
  v4 = [(EKUIConfirmMultiPasteViewController *)self navigationController];
  v5 = [v4 presentationController];
  [v5 setDelegate:self];
}

- (void)viewDidLoad
{
  v52[7] = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)EKUIConfirmMultiPasteViewController;
  [(EKUIConfirmMultiPasteViewController *)&v51 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(EKUIConfirmMultiPasteViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v5;

  v7 = NSString;
  v8 = EventKitUIBundle();
  v9 = [v8 localizedStringForKey:@"paste_x_events_calendar_selection" value:&stru_1F0CC2140 table:0];
  v10 = [(EKAutocompleteSearchResult *)self->_searchResult pasteboardResults];
  id v11 = objc_msgSend(v7, "localizedStringWithFormat:", v9, objc_msgSend(v10, "count"));
  [(UILabel *)self->_descriptionLabel setText:v11];

  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  id v12 = [(EKUIConfirmMultiPasteViewController *)self view];
  [v12 addSubview:self->_descriptionLabel];

  id v13 = (UITableView *)objc_alloc_init(MEMORY[0x1E4FB1D00]);
  tableView = self->_tableView;
  self->_tableView = v13;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v15 = [(EKUIConfirmMultiPasteViewController *)self view];
  [v15 addSubview:self->_tableView];

  v36 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [(UILabel *)self->_descriptionLabel leadingAnchor];
  v50 = [(EKUIConfirmMultiPasteViewController *)self view];
  v48 = [v50 layoutMarginsGuide];
  v47 = [v48 leadingAnchor];
  v46 = [v49 constraintEqualToAnchor:v47];
  v52[0] = v46;
  v44 = [(UILabel *)self->_descriptionLabel trailingAnchor];
  v45 = [(EKUIConfirmMultiPasteViewController *)self view];
  v43 = [v45 layoutMarginsGuide];
  v42 = [v43 trailingAnchor];
  v41 = [v44 constraintEqualToAnchor:v42];
  v52[1] = v41;
  v39 = [(UILabel *)self->_descriptionLabel topAnchor];
  v40 = [(EKUIConfirmMultiPasteViewController *)self view];
  v38 = [v40 layoutMarginsGuide];
  v37 = [v38 topAnchor];
  v35 = [v39 constraintEqualToAnchor:v37];
  v52[2] = v35;
  v33 = [(UITableView *)self->_tableView leadingAnchor];
  v34 = [(EKUIConfirmMultiPasteViewController *)self view];
  v32 = [v34 layoutMarginsGuide];
  v31 = [v32 leadingAnchor];
  objc_super v30 = [v33 constraintEqualToAnchor:v31];
  v52[3] = v30;
  v28 = [(UITableView *)self->_tableView trailingAnchor];
  v29 = [(EKUIConfirmMultiPasteViewController *)self view];
  v27 = [v29 layoutMarginsGuide];
  v26 = [v27 trailingAnchor];
  v16 = [v28 constraintEqualToAnchor:v26];
  v52[4] = v16;
  uint64_t v17 = [(UITableView *)self->_tableView topAnchor];
  v18 = [(UILabel *)self->_descriptionLabel bottomAnchor];
  v19 = [v17 constraintEqualToSystemSpacingBelowAnchor:v18 multiplier:1.0];
  v52[5] = v19;
  v20 = [(UITableView *)self->_tableView bottomAnchor];
  v21 = [(EKUIConfirmMultiPasteViewController *)self view];
  v22 = [v21 layoutMarginsGuide];
  v23 = [v22 bottomAnchor];
  id v24 = [v20 constraintEqualToAnchor:v23];
  v52[6] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];
  [v36 activateConstraints:v25];
}

- (void)_cancel:(id)a3
{
  [(EKUIConfirmMultiPasteViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v4 = [(EKUIConfirmMultiPasteViewController *)self delegate];
  [v4 confirmMultiPasteViewController:self finishedWithCancel:1];
}

- (void)_done:(id)a3
{
  [(CUIKPasteboardManager *)self->_pasteboardManager setCalendarForPaste:self->_selectedCalendar];
  [(CUIKPasteboardManager *)self->_pasteboardManager setDateForPaste:self->_dateForPaste];
  pasteboardManager = self->_pasteboardManager;

  [(CUIKPasteboardManager *)pasteboardManager pasteEventsWithDateMode:0 delegate:self];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  if (EKUICatalyst())
  {
    v10 = [(EKUIConfirmMultiPasteViewController *)self popupMenu:v9];
    [(EKUIPopupTableViewCell *)v8 setPopupMenu:v10];
  }
  else
  {
    id v11 = +[EKUICalendarMenu placeholderMenuForCalendar:self->_selectedCalendar backgroundColor:v9];
    [(EKUIPopupTableViewCell *)v8 setPopupMenu:v11];

    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__20;
    v23[4] = __Block_byref_object_dispose__20;
    id v24 = 0;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__EKUIConfirmMultiPasteViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v18[3] = &unk_1E60887A0;
    objc_copyWeak(&v21, &location);
    v20 = v23;
    id v19 = v9;
    [(EKUIPopupTableViewCell *)v8 setPopupMenuProvider:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(v23, 8);
  }
  id v12 = EventKitUIBundle();
  id v13 = [v12 localizedStringForKey:@"Calendar" value:&stru_1F0CC2140 table:0];
  id v14 = [(EKUIPopupTableViewCell *)v8 textLabel];
  [v14 setText:v13];

  v15 = [MEMORY[0x1E4FB1618] labelColor];
  v16 = [(EKUIPopupTableViewCell *)v8 textLabel];
  [v16 setTextColor:v15];

  return v8;
}

id __71__EKUIConfirmMultiPasteViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [WeakRetained popupMenu:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v7;
}

- (id)popupMenu:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F57B40] calendarsLimitedToSource:0 writability:2 onlyUnmanagedAccounts:0 forEvent:0 entityType:0 inEventStore:self->_eventStore];
  objc_initWeak(&location, self);
  eventStore = self->_eventStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke;
  v11[3] = &unk_1E60887C8;
  objc_copyWeak(&v12, &location);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke_2;
  v9[3] = &unk_1E60887F0;
  objc_copyWeak(&v10, &location);
  id v7 = +[EKUICalendarMenu calendarMenuWithCalendars:v5 eventStore:eventStore backgroundColor:v4 setupActionHandler:v11 selectionHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

void __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained && [v5 isEqual:*((void *)WeakRetained + 127)]) {
    [v8 setState:1];
  }
}

void __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained + 127;
    if (v5[127] != v7)
    {
      objc_storeStrong(v6, a2);
      [v5[123] reloadData];
    }
  }
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4)
  {
    uint64_t v11 = v5;
    uint64_t v12 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __97__EKUIConfirmMultiPasteViewController_pasteboardManager_didFinishPasteWithResult_willOpenEditor___block_invoke;
    v9[3] = &unk_1E6088CA8;
    BOOL v10 = a5;
    void v9[4] = self;
    [(EKUIConfirmMultiPasteViewController *)self dismissViewControllerAnimated:1 completion:v9];
    id v8 = [(EKUIConfirmMultiPasteViewController *)self delegate];
    [v8 confirmMultiPasteViewController:self finishedWithCancel:0];
  }
}

void __97__EKUIConfirmMultiPasteViewController_pasteboardManager_didFinishPasteWithResult_willOpenEditor___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) delegate];
      [v4 attemptDisplayReviewPrompt];
    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [(EKUIConfirmMultiPasteViewController *)self delegate];
  [v4 confirmMultiPasteViewController:self finishedWithCancel:1];
}

- (EKUIConfirmMultiPasteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIConfirmMultiPasteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateForPaste, 0);
  objc_storeStrong((id *)&self->_selectedCalendar, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_pasteboardManager, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end