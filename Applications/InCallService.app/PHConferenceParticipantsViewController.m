@interface PHConferenceParticipantsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isShowingMultiwayParticipants;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSMutableArray)conferenceParticipantCalls;
- (NSMutableArray)remoteParticipantHandles;
- (PHConferenceParticipantsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITableView)conferenceTable;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)callStatusChanged:(id)a3;
- (void)conferenceParticipantCellRequestedEndCall:(id)a3;
- (void)conferenceParticipantCellRequestedTakeCallPrivate:(id)a3;
- (void)dealloc;
- (void)dismissAfterPrivate;
- (void)dismissConferenceView;
- (void)handleCallModelChangedNotification:(id)a3;
- (void)loadView;
- (void)removeCall:(id)a3;
- (void)setConferenceParticipantCalls:(id)a3;
- (void)setConferenceTable:(id)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setShowingMultiwayParticipants:(BOOL)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHConferenceParticipantsViewController

- (PHConferenceParticipantsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PHConferenceParticipantsViewController;
  v4 = [(PHConferenceParticipantsViewController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"callStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v5 addObserver:v4 selector:"handleCallModelChangedNotification:" name:TUCallModelChangedNotification object:0];
    uint64_t v6 = +[NSMutableArray array];
    conferenceParticipantCalls = v4->_conferenceParticipantCalls;
    v4->_conferenceParticipantCalls = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableArray array];
    remoteParticipantHandles = v4->_remoteParticipantHandles;
    v4->_remoteParticipantHandles = (NSMutableArray *)v8;
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHConferenceParticipantsViewController;
  [(PHConferenceParticipantsViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [objc_alloc((Class)UIView) initWithFrame:v5, v7, v9, v11];
  [(PHConferenceParticipantsViewController *)self setView:v12];

  v13 = +[UIColor clearColor];
  v14 = [(PHConferenceParticipantsViewController *)self view];
  [v14 setBackgroundColor:v13];

  v15 = [(PHConferenceParticipantsViewController *)self view];
  [v15 setOpaque:0];

  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"CONFERENCE" value:&stru_1002D6110 table:@"InCallService"];
  v18 = [(PHConferenceParticipantsViewController *)self navigationItem];
  [v18 setTitle:v17];

  v19 = [(PHConferenceParticipantsViewController *)self view];
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = [(PHConferenceParticipantsViewController *)self navigationController];
  v29 = [v28 navigationBar];
  [v29 frame];
  double v31 = v30;
  v32 = [UIApp statusBar];
  [v32 defaultHeight];
  double v34 = v31 + v33;

  id v35 = [objc_alloc((Class)UITableView) initWithFrame:v21, v23 + v34, v25, v27 - v34];
  [(PHConferenceParticipantsViewController *)self setConferenceTable:v35];

  [(UITableView *)self->_conferenceTable setDataSource:self];
  [(UITableView *)self->_conferenceTable setDelegate:self];
  conferenceTable = self->_conferenceTable;
  v37 = +[UIColor clearColor];
  [(UITableView *)conferenceTable setBackgroundColor:v37];

  [(UITableView *)self->_conferenceTable setSeparatorStyle:0];
  [(UITableView *)self->_conferenceTable setRowHeight:100.0];
  [(UITableView *)self->_conferenceTable setOpaque:0];
  [(UITableView *)self->_conferenceTable setBounces:0];
  [(UITableView *)self->_conferenceTable setDelaysContentTouches:0];
  [(UITableView *)self->_conferenceTable setCanCancelContentTouches:0];
  [(UITableView *)self->_conferenceTable setRowHeight:UITableViewAutomaticDimension];
  id v38 = [(PHConferenceParticipantsViewController *)self view];
  [v38 addSubview:self->_conferenceTable];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PHConferenceParticipantsViewController;
  [(PHConferenceParticipantsViewController *)&v15 viewWillAppear:a3];
  double v4 = +[TUCallCenter sharedInstance];
  double v5 = [v4 frontmostCall];
  unsigned int v6 = [v5 isConversation];

  double v7 = +[TUCallCenter sharedInstance];
  double v8 = v7;
  if (v6)
  {
    double v9 = [v7 frontmostCall];
    double v10 = [v9 remoteParticipantHandles];
    double v11 = [v10 allObjects];
    id v12 = [v11 mutableCopy];
    [(PHConferenceParticipantsViewController *)self setRemoteParticipantHandles:v12];

    [(PHConferenceParticipantsViewController *)self setShowingMultiwayParticipants:1];
  }
  else
  {
    v13 = [v7 conferenceParticipantCalls];
    id v14 = [v13 mutableCopy];
    [(PHConferenceParticipantsViewController *)self setConferenceParticipantCalls:v14];
  }
}

- (void)dismissConferenceView
{
  id v3 = [(PHConferenceParticipantsViewController *)self navigationController];
  id v2 = [v3 popToRootViewControllerAnimated:1];
}

- (void)callStatusChanged:(id)a3
{
  double v4 = [a3 object];
  if ([v4 status] == 6)
  {
    double v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      double v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call was disconnected, we'll remove that call and pop %@", (uint8_t *)&v9, 0xCu);
    }

    [(PHConferenceParticipantsViewController *)self removeCall:v4];
  }
  else
  {
    unsigned int v6 = [v4 status];
    double v7 = sub_1000D5130();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6 == 4)
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saw an incoming call, we'll pop", (uint8_t *)&v9, 2u);
      }

      [(PHConferenceParticipantsViewController *)self dismissConferenceView];
    }
    else
    {
      if (v8)
      {
        int v9 = 138412290;
        double v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saw a call change but won't do anything with it: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)handleCallModelChangedNotification:(id)a3
{
  id v4 = a3;
  double v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  unsigned int v6 = [v4 object];
  if (v6)
  {
    double v7 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
    id v8 = [v7 indexOfObject:v6];

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int v9 = sub_1000D5130();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping table row reload, did not find a call in the conference participants list that matches (%@).", buf, 0xCu);
      }
    }
    else
    {
      int v9 = [(PHConferenceParticipantsViewController *)self conferenceTable];
      double v10 = +[NSIndexPath indexPathForRow:v8 inSection:0];
      id v12 = v10;
      double v11 = +[NSArray arrayWithObjects:&v12 count:1];
      [v9 reloadRowsAtIndexPaths:v11 withRowAnimation:0];
    }
  }
}

- (void)removeCall:(id)a3
{
  id v4 = a3;
  double v5 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
  id v6 = [v5 indexOfObject:v4];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
    [v7 removeObjectAtIndex:v6];

    id v8 = +[NSIndexPath indexPathForRow:v6 inSection:0];
    int v9 = [(PHConferenceParticipantsViewController *)self conferenceTable];
    objc_super v15 = v8;
    double v10 = +[NSArray arrayWithObjects:&v15 count:1];
    [v9 deleteRowsAtIndexPaths:v10 withRowAnimation:2];

    double v11 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
    id v12 = [v11 count];

    if ((unint64_t)v12 <= 1)
    {
      dispatch_time_t v13 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000881D0;
      block[3] = &unk_1002CD518;
      block[4] = self;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(PHConferenceParticipantsViewController *)self isShowingMultiwayParticipants])
  {
    [(PHConferenceParticipantsViewController *)self remoteParticipantHandles];
  }
  else
  {
    [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
  double v5 = };
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(PHConferenceParticipantCell);
  [(PHConferenceParticipantCell *)v6 setSelectionStyle:0];
  [(PHConferenceParticipantCell *)v6 setDelegate:self];
  if ([(PHConferenceParticipantsViewController *)self isShowingMultiwayParticipants])
  {
    double v7 = [(PHConferenceParticipantsViewController *)self remoteParticipantHandles];
    id v8 = [v5 row];

    int v9 = [v7 objectAtIndexedSubscript:v8];

    [(PHConferenceParticipantCell *)v6 setRepresentedHandle:v9];
    [(PHConferenceParticipantCell *)v6 setPrivateButtonHidden:1];
    [(PHConferenceParticipantCell *)v6 setEndButtonHidden:1];
  }
  else
  {
    double v10 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
    id v11 = [v5 row];

    int v9 = [v10 objectAtIndexedSubscript:v11];

    [(PHConferenceParticipantCell *)v6 setRepresentedCall:v9];
    id v12 = [v9 provider];
    dispatch_time_t v13 = [v12 prioritizedSenderIdentities];
    id v14 = [v13 count];

    if ((unint64_t)v14 >= 2)
    {
      objc_super v15 = [v9 localSenderIdentity];
      v16 = [v15 localizedShortName];
      [(PHConferenceParticipantCell *)v6 setLocalizedSenderIdentity:v16];
    }
    v17 = [v9 model];
    if ([v17 supportsUngrouping])
    {
      v18 = +[TUCallCenter sharedInstance];
      v19 = [v18 currentCallGroups];
      -[PHConferenceParticipantCell setPrivateButtonEnabled:](v6, "setPrivateButtonEnabled:", [v19 count] == (id)1);
    }
    else
    {
      [(PHConferenceParticipantCell *)v6 setPrivateButtonEnabled:0];
    }
  }

  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 95.0;
}

- (void)conferenceParticipantCellRequestedEndCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHConferenceParticipantsViewController *)self conferenceTable];
  id v6 = [v5 indexPathForCell:v4];

  double v7 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
  id v8 = [v7 objectAtIndex:[v6 row]];

  int v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "End call requested for %@", (uint8_t *)&v11, 0xCu);
  }

  double v10 = +[TUCallCenter sharedInstance];
  [v10 disconnectCall:v8];
}

- (void)conferenceParticipantCellRequestedTakeCallPrivate:(id)a3
{
  conferenceTable = self->_conferenceTable;
  id v5 = a3;
  id v6 = [(UITableView *)conferenceTable visibleCells];
  id v7 = [v6 mutableCopy];

  [v7 removeObject:v5];
  [v7 makeObjectsPerformSelector:"makeHeld"];
  id v8 = [(UITableView *)self->_conferenceTable indexPathForCell:v5];

  int v9 = [(PHConferenceParticipantsViewController *)self conferenceParticipantCalls];
  double v10 = [v9 objectAtIndex:[v8 row]];

  int v11 = +[TUCallCenter sharedInstance];
  [v11 ungroupCall:v10];

  id v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Take call private requested for %@", (uint8_t *)&v13, 0xCu);
  }

  [UIApp setIgnoresInteractionEvents:1];
  [(PHConferenceParticipantsViewController *)self performSelector:"dismissAfterPrivate" withObject:0 afterDelay:0.5];
}

- (void)dismissAfterPrivate
{
  [UIApp setIgnoresInteractionEvents:0];
  id v4 = [(PHConferenceParticipantsViewController *)self navigationController];
  id v3 = [v4 popToRootViewControllerAnimated:1];
}

- (NSMutableArray)conferenceParticipantCalls
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConferenceParticipantCalls:(id)a3
{
}

- (NSMutableArray)remoteParticipantHandles
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (UITableView)conferenceTable
{
  return (UITableView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConferenceTable:(id)a3
{
}

- (BOOL)isShowingMultiwayParticipants
{
  return self->_showingMultiwayParticipants;
}

- (void)setShowingMultiwayParticipants:(BOOL)a3
{
  self->_showingMultiwayParticipants = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceTable, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);

  objc_storeStrong((id *)&self->_conferenceParticipantCalls, 0);
}

@end