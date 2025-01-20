@interface iFBAFormResponseDraftViewController
- (BOOL)shouldDisplayUnsolicitedFollowup;
- (BOOL)shouldShowStatus;
- (BOOL)suppressUnsolicitedResponse;
- (FBKContentItem)contentItem;
- (FBKFormResponseStub)responseStub;
- (NSArray)sections;
- (NSDateFormatter)dateFormatter;
- (NSObject)contentItemObserver;
- (UIBarButtonItem)editBarButton;
- (iFBAFormResponseDraftViewController)initWithCoder:(id)a3;
- (iFBAResponseDetailHeaderView)headerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureActionsMenu;
- (void)deleteDraft:(id)a3 completion:(id)a4;
- (void)setContentItem:(id)a3;
- (void)setContentItemObserver:(id)a3;
- (void)setEditBarButton:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setSections:(id)a3;
- (void)setSuppressUnsolicitedResponse:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateBarButton;
- (void)updateContent;
- (void)updateHeader;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation iFBAFormResponseDraftViewController

- (iFBAFormResponseDraftViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)iFBAFormResponseDraftViewController;
  v3 = [(iFBAFormResponseDraftViewController *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_suppressUnsolicitedResponse = 0;
    sections = v3->_sections;
    v3->_sections = 0;
  }
  return v4;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)iFBAFormResponseDraftViewController;
  [(iFBAFormResponseDraftViewController *)&v13 viewDidLoad];
  v3 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v3 setEstimatedSectionHeaderHeight:0.0];

  v4 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v4 setEstimatedSectionFooterHeight:0.0];

  [(iFBAFormResponseDraftViewController *)self updateBarButton];
  [(iFBAFormResponseDraftViewController *)self updateHeader];
  v5 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];

  v6 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v6 setEstimatedRowHeight:100.0];

  id v7 = objc_alloc((Class)UIView);
  v8 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v8 frame];
  id v9 = [v7 initWithFrame:0.0, 0.0];

  v10 = +[UIColor separatorColor];
  [v9 setBackgroundColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v11 setTableHeaderView:v9];

  v12 = [(iFBAFormResponseDraftViewController *)self navigationItem];
  [v12 setLargeTitleDisplayMode:2];

  [(iFBAFormResponseDraftViewController *)self configureActionsMenu];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)iFBAFormResponseDraftViewController;
  [(iFBAFormResponseDraftViewController *)&v6 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  v5 = [(iFBAFormResponseDraftViewController *)self contentItemObserver];
  [v4 removeObserver:v5];

  [(iFBAFormResponseDraftViewController *)self hideSpinner];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)iFBAFormResponseDraftViewController;
  [(iFBAFormResponseDraftViewController *)&v5 viewWillAppear:a3];
  v4 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v4 reloadData];
}

- (FBKFormResponseStub)responseStub
{
  v2 = [(iFBAFormResponseDraftViewController *)self contentItem];
  v3 = [v2 formResponseStub];

  return (FBKFormResponseStub *)v3;
}

- (void)setContentItem:(id)a3
{
  id v5 = a3;
  objc_super v6 = +[FBALog appHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 ID];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v7 intValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Viewing Stub Response Item with ID  [%i]", buf, 8u);
  }
  objc_storeStrong((id *)&self->_contentItem, a3);
  v8 = [(iFBAFormResponseDraftViewController *)self contentItemObserver];

  if (v8)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    v10 = [(iFBAFormResponseDraftViewController *)self contentItemObserver];
    [v9 removeObserver:v10];
  }
  objc_initWeak((id *)buf, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000198A0;
  v39[3] = &unk_1000F2688;
  objc_copyWeak(&v40, (id *)buf);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001994C;
  v37[3] = &unk_1000F2BA8;
  v37[4] = self;
  v11 = objc_retainBlock(v39);
  id v38 = v11;
  v12 = objc_retainBlock(v37);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100019A30;
  v33[3] = &unk_1000F2C20;
  v33[4] = self;
  objc_copyWeak(&v36, (id *)buf);
  objc_super v13 = v12;
  id v34 = v13;
  v14 = v11;
  id v35 = v14;
  v15 = objc_retainBlock(v33);
  uint64_t v16 = [(iFBAFormResponseDraftViewController *)self contentItem];
  v17 = [(id)v16 managedObjectContext];
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_100019F1C;
  v29 = &unk_1000F2C48;
  id v18 = v5;
  id v30 = v18;
  objc_copyWeak(&v32, (id *)buf);
  v19 = v15;
  id v31 = v19;
  v20 = [v17 addObjectsDidChangeNotificationObserver:&v26];
  contentItemObserver = self->_contentItemObserver;
  self->_contentItemObserver = v20;

  v22 = [(iFBAFormResponseDraftViewController *)self contentItem];
  LOBYTE(v16) = v22 == 0;

  v23 = v14;
  if ((v16 & 1) == 0)
  {
    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_1000F6658 table:0];
    [(iFBAFormResponseDraftViewController *)self showSpinnerWithStatus:v25 userInteractionEnabled:1];

    [(iFBAFormResponseDraftViewController *)self updateHeader];
    v23 = v19;
  }
  ((void (*)(void))v23[2])();

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);
}

- (BOOL)shouldShowStatus
{
  v2 = [(iFBAFormResponseDraftViewController *)self contentItem];
  BOOL v3 = [v2 itemType] == (id)4;

  return v3;
}

- (void)updateContent
{
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
  BOOL v3 = [(iFBAFormResponseDraftViewController *)self responseStub];

  if (v3)
  {
    v4 = [[FBARDVSection alloc] initWithTitle:0 type:0];
    id v5 = [[FBARDVRow alloc] initWithTitle:0 subtitle:0 object:0];
    objc_super v6 = [(FBARDVSection *)v4 rows];
    [v6 addObject:v5];

    [v8 addObject:v4];
  }
  id v7 = +[NSArray arrayWithArray:v8];
  [(iFBAFormResponseDraftViewController *)self setSections:v7];
}

- (void)setSuppressUnsolicitedResponse:(BOOL)a3
{
  self->_suppressUnsolicitedResponse = a3;
  id v3 = [(iFBAFormResponseDraftViewController *)self tableView];
  [v3 reloadData];
}

- (void)updateBarButton
{
  id v3 = [(iFBAFormResponseDraftViewController *)self contentItem];
  id v4 = [v3 itemType];

  id v6 = [(iFBAFormResponseDraftViewController *)self navigationItem];
  if (v4 == (id)1)
  {
    id v5 = [(iFBAFormResponseDraftViewController *)self editBarButton];
    [v6 setRightBarButtonItem:v5];
  }
  else
  {
    [v6 setRightBarButtonItem:0];
  }
}

- (void)updateHeader
{
  id v3 = [(iFBAFormResponseDraftViewController *)self responseStub];

  if (v3)
  {
    id v10 = [(iFBAFormResponseDraftViewController *)self contentItem];
    id v4 = [v10 displayTitle];
    id v5 = [(iFBAFormResponseDraftViewController *)self navigationItem];
    [v5 setTitle:v4];
  }
  else
  {
    id v6 = +[FBALog appHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000A5094(v6);
    }

    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_1000F6658 table:0];
    id v9 = [(iFBAFormResponseDraftViewController *)self navigationItem];
    [v9 setTitle:v8];
  }
}

- (NSDateFormatter)dateFormatter
{
  if (qword_100124008 != -1) {
    dispatch_once(&qword_100124008, &stru_1000F2C68);
  }
  v2 = (void *)qword_100124000;

  return (NSDateFormatter *)v2;
}

- (BOOL)shouldDisplayUnsolicitedFollowup
{
  if ([(iFBAFormResponseDraftViewController *)self suppressUnsolicitedResponse]) {
    return 0;
  }
  id v3 = [(iFBAFormResponseDraftViewController *)self responseStub];
  unsigned int v4 = [v3 isSubmitted];

  if (!v4) {
    return 0;
  }
  id v5 = [(iFBAFormResponseDraftViewController *)self responseStub];
  id v6 = [v5 feedback];
  unsigned __int8 v7 = [v6 allowUnsolicitedFollowup];

  return v7;
}

- (void)configureActionsMenu
{
  id v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(iFBAFormResponseDraftViewController *)self contentItem];
    id v5 = [v4 ID];
    *(_DWORD *)buf = 67109120;
    unsigned int v19 = [v5 intValue];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "edit button tapped for form response [%i]", buf, 8u);
  }
  id v6 = [[_TtC18Feedback_Assistant23FBAActionMenuController alloc] initWithTitle:0 subtitle:0 actions:0];
  unsigned __int8 v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"EDIT_DRAFT" value:@"Edit Draft" table:@"CommonStrings"];
  id v9 = +[UIImage imageNamed:FBKImageNameEditDraft];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A788;
  v17[3] = &unk_1000F2C90;
  v17[4] = self;
  [(FBAActionMenuController *)v6 addActionWithTitle:v8 image:v9 actionHandler:v17];

  id v10 = [_TtC18Feedback_Assistant25FBAActionControllerAction alloc];
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"DELETE_DRAFT" value:@"Delete Draft" table:@"CommonStrings"];
  objc_super v13 = +[UIImage systemImageNamed:FBKSystemImageNameDeleteDraft];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001A7F8;
  v16[3] = &unk_1000F2C90;
  v16[4] = self;
  v14 = [(FBAActionControllerAction *)v10 initWithTitle:v12 image:v13 actionHandler:v16];

  [(FBAActionControllerAction *)v14 setDestructive:1];
  [(FBAActionMenuController *)v6 addAction:v14];
  v15 = [(iFBAFormResponseDraftViewController *)self editBarButton];
  [(FBAActionMenuController *)v6 attachToBarButtonItem:v15];
}

- (void)deleteDraft:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v23 = a3;
  unsigned __int8 v7 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:[(iFBAFormResponseDraftViewController *)self objc_preferredAlertStyle]];
  id v8 = [v7 preferredStyle];
  id v9 = +[NSBundle mainBundle];
  id v10 = v9;
  if (v8 == (id)1)
  {
    v11 = [v9 localizedStringForKey:@"DELETE_DRAFT_PROMPT_SHORT" value:@"Are you sure you want to delete this draft?" table:@"CommonStrings"];
    [v7 setTitle:v11];

    id v9 = +[NSBundle mainBundle];
    id v10 = v9;
    CFStringRef v12 = @"CANNOT_UNDO";
    CFStringRef v13 = @"This cannot be undone.";
  }
  else
  {
    CFStringRef v12 = @"DELETE_DRAFT_PROMPT_LONG";
    CFStringRef v13 = @"Are you sure you want to delete this draft? This cannot be undone.";
  }
  v14 = [v9 localizedStringForKey:v12 value:v13 table:@"CommonStrings"];
  [v7 setMessage:v14];

  v15 = +[NSBundle mainBundle];
  uint64_t v16 = [v15 localizedStringForKey:@"DELETE_DRAFT_PROMPT" value:@"Delete Draft" table:@"CommonStrings"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001AB08;
  v26[3] = &unk_1000F2750;
  v26[4] = self;
  id v17 = v6;
  id v27 = v17;
  id v18 = +[UIAlertAction actionWithTitle:v16 style:2 handler:v26];

  unsigned int v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"CANCEL" value:@"Cancel" table:@"CommonStrings"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001AB9C;
  v24[3] = &unk_1000F2750;
  v24[4] = self;
  id v25 = v17;
  id v21 = v17;
  v22 = +[UIAlertAction actionWithTitle:v20 style:1 handler:v24];

  [v7 addAction:v18];
  [v7 addAction:v22];
  [v23 presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = [(iFBAFormResponseDraftViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:[v8 section]];

  if ([v6 sectionType] == (id)3)
  {
    unsigned __int8 v7 = [(iFBAFormResponseDraftViewController *)self contentItem];
    [(iFBAFormResponseDraftViewController *)self didTapCloseFeedbackWithItem:v7 atIndexPath:v8];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(iFBAFormResponseDraftViewController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(iFBAFormResponseDraftViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  unsigned __int8 v7 = [v6 sectionTitle];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(iFBAFormResponseDraftViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  unsigned __int8 v7 = [v6 rows];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(iFBAFormResponseDraftViewController *)self sections];
  id v9 = [v8 objectAtIndexedSubscript:[v7 section]];

  id v10 = [v9 rows];
  v11 = [v10 objectAtIndexedSubscript:[v7 row]];

  CFStringRef v12 = (char *)[v9 sectionType];
  if ((unint64_t)(v12 - 2) < 2)
  {
    v14 = [v11 object];
    id v10 = [v6 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7];

    CFStringRef v13 = +[iFBAConstants tintColor];
    v15 = [v10 textLabel];
    [v15 setTextColor:v13];

LABEL_6:
    goto LABEL_8;
  }
  if (v12 != (char *)1)
  {
    if (v12) {
      goto LABEL_8;
    }
    id v10 = [v6 dequeueReusableCellWithIdentifier:@"FormResponseDetailCell" forIndexPath:v7];
    CFStringRef v13 = [(iFBAFormResponseDraftViewController *)self contentItem];
    [v10 setContentItem:v13];
    goto LABEL_6;
  }
  uint64_t v16 = +[FBKAttachmentCell reuseIdentifier];
  id v10 = [v6 dequeueReusableCellWithIdentifier:v16 forIndexPath:v7];

  [v10 setSelectionStyle:0];
  id v17 = [v11 title];
  id v18 = [v10 textLabel];
  [v18 setText:v17];

  unsigned int v19 = +[UIColor labelColor];
  v20 = [v10 textLabel];
  [v20 setTextColor:v19];

  [v10 setGatherState:2];
  [v10 setAccessoryType:0];
LABEL_8:

  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B028;
  v4[3] = &unk_1000F2D18;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

- (BOOL)suppressUnsolicitedResponse
{
  return self->_suppressUnsolicitedResponse;
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (iFBAResponseDetailHeaderView)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);

  return (iFBAResponseDetailHeaderView *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (UIBarButtonItem)editBarButton
{
  return self->_editBarButton;
}

- (void)setEditBarButton:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSObject)contentItemObserver
{
  return self->_contentItemObserver;
}

- (void)setContentItemObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemObserver, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_editBarButton, 0);
  objc_destroyWeak((id *)&self->_headerView);

  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end