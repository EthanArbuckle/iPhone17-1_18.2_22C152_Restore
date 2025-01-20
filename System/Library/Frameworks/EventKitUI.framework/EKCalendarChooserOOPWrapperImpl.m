@interface EKCalendarChooserOOPWrapperImpl
+ (id)hideAllString;
+ (id)showAllString;
- (BOOL)allSelected;
- (BOOL)allowsPullToRefresh;
- (BOOL)disableCalendarEditing;
- (BOOL)disableCalendarsUnselectedByFocus;
- (BOOL)hasAccountThatCanCreateCalendars;
- (BOOL)hasInProcessNavBar;
- (BOOL)onlyShowUnmanagedAccounts;
- (BOOL)showAccountStatus;
- (BOOL)showDetailAccessories;
- (BOOL)showsCancelButton;
- (BOOL)showsCompletedRemindersSetting;
- (BOOL)showsDeclinedEventsSetting;
- (BOOL)showsDoneButton;
- (CGSize)preferredContentSize;
- (EKAbstractCalendarEditor)presentedEditor;
- (EKCalendar)selectedCalendar;
- (EKCalendarChooserDelegate)delegate;
- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 eventStore:(id)a6;
- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11;
- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 eventStore:(id)a5;
- (EKEventStore)eventStore;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (NSSet)collapsedSectionIdentifiers;
- (NSSet)selectedCalendars;
- (UIBarButtonItem)showAllButton;
- (UIView)safeAreaCaulk;
- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)vc;
- (id)centeredCalendar;
- (id)navigationController;
- (id)navigationItem;
- (id)sourceForSelectedIdentity;
- (id)toolbarItems;
- (int)explanatoryTextMode;
- (int64_t)chooserMode;
- (int64_t)displayStyle;
- (int64_t)selectionStyle;
- (unint64_t)entityType;
- (void)_commonAddCalendarButtonPressed:(id)a3;
- (void)_layoutNavToolbarControls;
- (void)_selectAllCalendarsAndNotify:(BOOL)a3;
- (void)addCalendarButtonPressed:(id)a3;
- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)remoteCalendarChooserSelectionChanged:(id)a3 allSelected:(BOOL)a4;
- (void)setAllSelected:(BOOL)a3;
- (void)setAllowsPullToRefresh:(BOOL)a3;
- (void)setChooserMode:(int64_t)a3;
- (void)setCollapsedSectionIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableCalendarEditing:(BOOL)a3;
- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3;
- (void)setExplanatoryTextMode:(int)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3;
- (void)setPresentedEditor:(id)a3;
- (void)setSafeAreaCaulk:(id)a3;
- (void)setSelectedCalendar:(id)a3;
- (void)setSelectedCalendars:(id)a3;
- (void)setShowAccountStatus:(BOOL)a3;
- (void)setShowAllButton:(id)a3;
- (void)setShowDetailAccessories:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsDeclinedEventsSetting:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setToolbarItems:(id)a3;
- (void)setToolbarItems:(id)a3 animated:(BOOL)a4;
- (void)setVc:(id)a3;
- (void)showAllButtonPressed;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKCalendarChooserOOPWrapperImpl

- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)EKCalendarChooserOOPWrapperImpl;
  v21 = [(EKCalendarChooserOOPWrapperImpl *)&v31 init];
  if (v21)
  {
    v22 = [[_TtC10EventKitUI24EKCalendarChooserOOPImpl alloc] initWithEventStore:v19];
    [(EKCalendarChooserOOPWrapperImpl *)v21 setVc:v22];

    v23 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v23 setSelectionStyle:a3];

    v24 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v24 setDisplayStyle:a4];

    v25 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v25 setEntityType:a5];

    objc_storeStrong((id *)&v21->_event, a6);
    v26 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v26 setLimitedToSource:v20];

    v27 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v27 setShowIdentityChooser:a9];

    v28 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v28 setShowDelegateSetupCell:a10];

    v29 = [(EKCalendarChooserOOPWrapperImpl *)v21 vc];
    [v29 setShowAccountStatus:a11];
  }
  return v21;
}

- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 eventStore:(id)a6
{
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[EKCalendarChooserOOPWrapperImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, a5, 0, a6, 0, v7);
}

- (EKCalendarChooserOOPWrapperImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 eventStore:(id)a5
{
  BYTE2(v6) = 0;
  LOWORD(v6) = 0;
  return -[EKCalendarChooserOOPWrapperImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, 0, 0, a5, 0, v6);
}

- (void)viewDidLoad
{
  v42[4] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)EKCalendarChooserOOPWrapperImpl;
  [(EKCalendarChooserOOPWrapperImpl *)&v41 viewDidLoad];
  v3 = EventKitUIBundle();
  v40 = [v3 localizedStringForKey:@"Calendars" value:&stru_1F0CC2140 table:0];

  [(EKCalendarChooserOOPWrapperImpl *)self setTitle:v40];
  v4 = [(EKCalendarChooserOOPWrapperImpl *)self parentViewController];
  [v4 setTitle:v40];

  id v39 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v39 setBackgroundColor:v5];

  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(EKCalendarChooserOOPWrapperImpl *)self setSafeAreaCaulk:v39];
  uint64_t v6 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [(EKCalendarChooserOOPWrapperImpl *)self addChildViewController:v6];

  uint64_t v7 = [(EKCalendarChooserOOPWrapperImpl *)self view];
  v8 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  v9 = [v8 view];
  [v7 addSubview:v9];

  v10 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v10 didMoveToParentViewController:self];

  v11 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  v12 = [v11 view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  v37 = [v38 view];
  v35 = [v37 leadingAnchor];
  v36 = [(EKCalendarChooserOOPWrapperImpl *)self view];
  v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v42[0] = v33;
  v32 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  objc_super v31 = [v32 view];
  v29 = [v31 topAnchor];
  v30 = [(EKCalendarChooserOOPWrapperImpl *)self view];
  v28 = [v30 topAnchor];
  v26 = [v29 constraintEqualToAnchor:v28];
  v42[1] = v26;
  v25 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  v24 = [v25 view];
  v23 = [v24 trailingAnchor];
  v13 = [(EKCalendarChooserOOPWrapperImpl *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [v23 constraintEqualToAnchor:v14];
  v42[2] = v15;
  v16 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  v17 = [v16 view];
  id v18 = [v17 bottomAnchor];
  id v19 = [(EKCalendarChooserOOPWrapperImpl *)self view];
  id v20 = [v19 bottomAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v42[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [v27 activateConstraints:v22];
}

- (void)viewWillAppear:(BOOL)a3
{
  v43[4] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)EKCalendarChooserOOPWrapperImpl;
  [(EKCalendarChooserOOPWrapperImpl *)&v42 viewWillAppear:a3];
  v4 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
  uint64_t v5 = [v4 view];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
  uint64_t v8 = [v7 toolbar];
  if (!v8)
  {

    goto LABEL_6;
  }
  v9 = (void *)v8;
  v10 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
  v11 = [v10 toolbar];
  v12 = [v11 superview];

  if (v12)
  {
    v13 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    v14 = [v13 view];
    v15 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
    [v14 addSubview:v15];

    v30 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v41 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
    id v39 = [v41 topAnchor];
    v40 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    v38 = [v40 toolbar];
    v37 = [v38 bottomAnchor];
    v36 = [v39 constraintEqualToAnchor:v37];
    v43[0] = v36;
    v35 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
    v33 = [v35 rightAnchor];
    v34 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    v32 = [v34 view];
    objc_super v31 = [v32 rightAnchor];
    v29 = [v33 constraintEqualToAnchor:v31];
    v43[1] = v29;
    v28 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
    v26 = [v28 bottomAnchor];
    v27 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    v25 = [v27 view];
    v16 = [v25 bottomAnchor];
    v17 = [v26 constraintEqualToAnchor:v16];
    v43[2] = v17;
    id v18 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
    id v19 = [v18 leftAnchor];
    id v20 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    v21 = [v20 view];
    v22 = [v21 leftAnchor];
    v23 = [v19 constraintEqualToAnchor:v22];
    v43[3] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
    [v30 activateConstraints:v24];

    v4 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
    [v4 setHidden:1];
LABEL_6:
  }
  [(EKCalendarChooserOOPWrapperImpl *)self _layoutNavToolbarControls];
}

- (CGSize)preferredContentSize
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)hasInProcessNavBar
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
  double v3 = [v2 navigationController];

  if (v3) {
    int v4 = [v3 isNavigationBarHidden] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)hasAccountThatCanCreateCalendars
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  uint64_t v4 = [v3 limitedToSource];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
    double v7 = [v6 limitedToSource];
    int v8 = [v7 isWritable];

    if (!v8)
    {
      LOBYTE(v9) = 0;
      return v9;
    }
  }
  else
  {
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = [(EKCalendarChooserOOPWrapperImpl *)self eventStore];
  v11 = [v10 sources];

  uint64_t v9 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v11);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v14 supportsCalendarCreation] && objc_msgSend(v14, "sourceType") != 4)
        {
          LOBYTE(v9) = 1;
          goto LABEL_16;
        }
      }
      uint64_t v9 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v9;
}

- (void)_layoutNavToolbarControls
{
  id v35 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  if ([(EKCalendarChooserOOPWrapperImpl *)self showsCancelButton])
  {
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [v35 addObject:v3];
  }
  if ([(EKCalendarChooserOOPWrapperImpl *)self showsDoneButton])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
    [v35 addObject:v4];
  }
  if ([v35 count])
  {
    double v5 = [v35 lastObject];
    double v6 = [(EKCalendarChooserOOPWrapperImpl *)self navigationItem];
    [v6 setRightBarButtonItem:v5];

    [v35 removeLastObject];
  }
  if ([v35 count])
  {
    double v7 = [v35 lastObject];
    int v8 = [(EKCalendarChooserOOPWrapperImpl *)self navigationItem];
    [v8 setLeftBarButtonItem:v7];

    [v35 removeLastObject];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:0] == 3
    && ![(EKCalendarChooserOOPWrapperImpl *)self disableCalendarEditing]
    && [(EKCalendarChooserOOPWrapperImpl *)self hasAccountThatCanCreateCalendars])
  {
    addCalendarButton = self->_addCalendarButton;
    if (!addCalendarButton)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v12 = EventKitUIBundle();
      v13 = [v12 localizedStringForKey:@"Add Calendar" value:&stru_1F0CC2140 table:0];
      v14 = (UIBarButtonItem *)[v11 initWithTitle:v13 style:0 target:self action:sel_addCalendarButtonPressed_];
      v15 = self->_addCalendarButton;
      self->_addCalendarButton = v14;

      addCalendarButton = self->_addCalendarButton;
    }
    [v9 addObject:addCalendarButton];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    [v9 addObject:v16];
  }
  if (([MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:0] > 2
     || [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:1] >= 3)
    && [(EKCalendarChooserOOPWrapperImpl *)self selectionStyle] == 1)
  {
    if (![v9 count])
    {
      long long v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      [v9 addObject:v17];
    }
    long long v18 = [(id)objc_opt_class() showAllString];
    long long v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v18 style:0 target:self action:sel_showAllButtonPressed];
    [(EKCalendarChooserOOPWrapperImpl *)self setShowAllButton:v19];

    id v20 = [(EKCalendarChooserOOPWrapperImpl *)self showAllButton];
    [v9 addObject:v20];

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    v22 = [(id)objc_opt_class() showAllString];
    v23 = [(id)objc_opt_class() hideAllString];
    v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, 0);
    v25 = [(EKCalendarChooserOOPWrapperImpl *)self showAllButton];
    [v25 setPossibleTitles:v24];
  }
  uint64_t v26 = [v9 count];
  v27 = [(EKCalendarChooserOOPWrapperImpl *)self safeAreaCaulk];
  v28 = v27;
  if (v26)
  {
    [v27 setHidden:0];

    v29 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    [v29 setToolbarHidden:0];

    v30 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    objc_super v31 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    v32 = [v31 toolbar];
    [v32 setBackgroundColor:v30];

    [(EKCalendarChooserOOPWrapperImpl *)self setToolbarItems:v9 animated:1];
    v33 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
    LODWORD(v31) = [v33 conformsToProtocol:&unk_1F0DA0E68];

    if (!v31) {
      goto LABEL_26;
    }
    v34 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
    [v34 calendarChooserUpdatedToolbarItems];
  }
  else
  {
    [v27 setHidden:1];

    v34 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    [v34 setToolbarHidden:1];
  }

LABEL_26:
}

+ (id)showAllString
{
  v2 = EventKitUIBundle();
  double v3 = [v2 localizedStringForKey:@"Show All" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)hideAllString
{
  v2 = EventKitUIBundle();
  double v3 = [v2 localizedStringForKey:@"Hide All" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)setAllSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allSelected = a3;
  double v5 = objc_opt_class();
  if (v3) {
    [v5 hideAllString];
  }
  else {
  id v7 = [v5 showAllString];
  }
  double v6 = [(EKCalendarChooserOOPWrapperImpl *)self showAllButton];
  [v6 setTitle:v7];
}

- (void)remoteCalendarChooserSelectionChanged:(id)a3 allSelected:(BOOL)a4
{
}

- (void)cancel:(id)a3
{
  uint64_t v4 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
      int v8 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
      [v9 calendarChooserDidCancel:v8];
    }
  }
}

- (void)done:(id)a3
{
  uint64_t v4 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
      int v8 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
      [v9 calendarChooserDidFinish:v8];
    }
  }
}

- (void)addCalendarButtonPressed:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [EKCalendarEditor alloc];
  double v5 = [(EKCalendarChooserOOPWrapperImpl *)self eventStore];
  unint64_t v6 = [(EKCalendarChooserOOPWrapperImpl *)self entityType];
  char v7 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int v8 = [v7 limitedToSource];
  id v9 = [(EKCalendarEditor *)v4 initWithCalendar:0 eventStore:v5 entityType:v6 limitedToSource:v8];

  [(EKAbstractCalendarEditor *)v9 setDelegate:self];
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = v9;

  [(EKCalendarChooserOOPWrapperImpl *)self _commonAddCalendarButtonPressed:v11];
}

- (void)_commonAddCalendarButtonPressed:(id)a3
{
  id v10 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_presentedEditor];
  if ([(EKCalendarChooserOOPWrapperImpl *)self displayStyle] == 1000)
  {
    [v4 setModalPresentationStyle:7];
    [v4 _setClipUnderlapWhileTransitioning:1];
    double v5 = [v4 popoverPresentationController];
    [v5 setBarButtonItem:v10];
  }
  else
  {
    double v5 = [(EKCalendarChooserOOPWrapperImpl *)self view];
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
    {
      unint64_t v6 = [(EKCalendarChooserOOPWrapperImpl *)self view];
      BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

      if (!IsRegular) {
        goto LABEL_7;
      }
      [v4 setModalPresentationStyle:6];
      double v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      int v8 = [v4 view];
      [v8 setBackgroundColor:v5];
    }
  }

LABEL_7:
  id v9 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
  [v9 presentViewController:v4 animated:1 completion:0];
}

- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4
{
  double v5 = (EKAbstractCalendarEditor *)a3;
  if (self->_presentedEditor == v5)
  {
    self->_presentedEditor = 0;
    char v7 = v5;

    unint64_t v6 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    double v5 = v7;
  }
}

- (EKEventStore)eventStore
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  BOOL v3 = [v2 eventStore];

  return (EKEventStore *)v3;
}

- (int64_t)displayStyle
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int64_t v3 = [v2 displayStyle];

  return v3;
}

- (unint64_t)entityType
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  unint64_t v3 = [v2 entityType];

  return v3;
}

- (int64_t)selectionStyle
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int64_t v3 = [v2 selectionStyle];

  return v3;
}

- (EKCalendarChooserDelegate)delegate
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int64_t v3 = [v2 delegate];

  return (EKCalendarChooserDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v5 setDelegate:v4];
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  self->_showsCancelButton = a3;
}

- (NSSet)selectedCalendars
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int64_t v3 = [v2 selectedCalendars];

  return (NSSet *)v3;
}

- (void)setSelectedCalendars:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v5 setSelectedCalendars:v4];
}

- (BOOL)disableCalendarEditing
{
  return self->_disableCalendarEditing;
}

- (void)setDisableCalendarEditing:(BOOL)a3
{
  self->_disableCalendarEditing = a3;
}

- (void)showAllButtonPressed
{
  [(EKCalendarChooserOOPWrapperImpl *)self setAllSelected:!self->_allSelected];

  [(EKCalendarChooserOOPWrapperImpl *)self _selectAllCalendarsAndNotify:1];
}

- (void)_selectAllCalendarsAndNotify:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      unint64_t v6 = [(EKCalendarChooserOOPWrapperImpl *)self delegate];
      char v7 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
      [v6 calendarChooserSelectionDidChange:v7];
    }
  }
  id v8 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v8 toggleAllCalendars];
}

- (BOOL)showDetailAccessories
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  char v3 = [v2 showDetailAccessories];

  return v3;
}

- (void)setShowDetailAccessories:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setShowDetailAccessories:v3];
}

- (int64_t)chooserMode
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int64_t v3 = [v2 chooserMode];

  return v3;
}

- (void)setChooserMode:(int64_t)a3
{
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setChooserMode:a3];
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  char v3 = [v2 disableCalendarsUnselectedByFocus];

  return v3;
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setDisableCalendarsUnselectedByFocus:v3];
}

- (BOOL)allowsPullToRefresh
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  char v3 = [v2 allowsPullToRefresh];

  return v3;
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setAllowsPullToRefresh:v3];
}

- (EKCalendar)selectedCalendar
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  BOOL v3 = [v2 selectedCalendar];

  return (EKCalendar *)v3;
}

- (void)setSelectedCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v5 setSelectedCalendar:v4];
}

- (BOOL)showsDeclinedEventsSetting
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  char v3 = [v2 showsDeclinedEventsSetting];

  return v3;
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setShowsDeclinedEventsSetting:v3];
}

- (BOOL)showsCompletedRemindersSetting
{
  return 0;
}

- (int)explanatoryTextMode
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  int v3 = [v2 explanatoryTextMode];

  return v3;
}

- (void)setExplanatoryTextMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setExplanatoryTextMode:v3];
}

- (BOOL)showAccountStatus
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  char v3 = [v2 showAccountStatus];

  return v3;
}

- (void)setShowAccountStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setShowAccountStatus:v3];
}

- (BOOL)onlyShowUnmanagedAccounts
{
  v2 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  char v3 = [v2 onlyShowUnmanagedAccounts];

  return v3;
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKCalendarChooserOOPWrapperImpl *)self vc];
  [v4 setOnlyShowUnmanagedAccounts:v3];
}

- (id)centeredCalendar
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F254C0]);

  return v2;
}

- (id)sourceForSelectedIdentity
{
  return 0;
}

- (void)setToolbarItems:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
  [v5 setToolbarItems:v4];
}

- (id)toolbarItems
{
  id v2 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
  BOOL v3 = [v2 toolbarItems];

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
  [v7 setToolbarItems:v6 animated:v4];
}

- (id)navigationItem
{
  id v2 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
  BOOL v3 = [v2 navigationItem];

  return v3;
}

- (id)navigationController
{
  id v2 = [(EKCalendarChooserOOPWrapperImpl *)self _ekCalendarChooser];
  BOOL v3 = [v2 navigationController];

  return v3;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  p_navigationDelegate = &self->_navigationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    id v5 = [(EKCalendarChooserOOPWrapperImpl *)self navigationController];
  }

  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (NSSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
}

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
}

- (UIBarButtonItem)showAllButton
{
  return self->_showAllButton;
}

- (void)setShowAllButton:(id)a3
{
}

- (EKAbstractCalendarEditor)presentedEditor
{
  return self->_presentedEditor;
}

- (void)setPresentedEditor:(id)a3
{
}

- (BOOL)allSelected
{
  return self->_allSelected;
}

- (UIView)safeAreaCaulk
{
  return self->_safeAreaCaulk;
}

- (void)setSafeAreaCaulk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeAreaCaulk, 0);
  objc_storeStrong((id *)&self->_presentedEditor, 0);
  objc_storeStrong((id *)&self->_showAllButton, 0);
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_addCalendarButton, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end