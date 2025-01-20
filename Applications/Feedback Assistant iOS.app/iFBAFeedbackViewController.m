@interface iFBAFeedbackViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)fileDownloadInProgress;
- (BOOL)rowShouldPresentAssigneePicker:(id)a3;
- (BOOL)showsAssigneeRow;
- (FBKContentItem)contentItem;
- (FBKFeedbackFollowup)pendingFollowup;
- (FBKLaunchAction)launchAction;
- (NSArray)_filePromiseSortDescriptors;
- (NSArray)modelCache;
- (NSDateFormatter)headerDateFormatter;
- (NSDateFormatter)sectionDateFormatter;
- (NSMutableArray)observerTokens;
- (NSMutableSet)observedUploadTasks;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)feedback;
- (id)filePromiseSortDescriptors;
- (id)localizedErrorStringForMaybeFilePromise:(id)a3 downloadPermission:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)attachmentsBeingDeletedCount;
- (void)_confirmFilePromiseDeletionWithStub:(id)a3 deletionHandler:(id)a4;
- (void)_deleteFilePromise:(id)a3 completionHandler:(id)a4;
- (void)_refreshFeedbackContent;
- (void)_refreshFeedbackContentForced:(BOOL)a3;
- (void)_refreshFeedbackContentWithControl:(id)a3;
- (void)autoLogOutIfNeeded;
- (void)beginFileDownloadForFilePromise:(id)a3;
- (void)configureActionsMenu;
- (void)configureKeyboardShortcuts;
- (void)copyFeedbackID;
- (void)copyFeedbackIDAndTitle;
- (void)dealloc;
- (void)demoteIndividualFeedbackToOriginator;
- (void)handleModelChanges:(id)a3;
- (void)hideAttachmentDeletionSpinner;
- (void)participantController:(id)a3 didSelectParticipant:(id)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)promoteIndividualFeedbackToTeam:(id)a3;
- (void)reloadAppProxy;
- (void)resetObserverTokens;
- (void)setAttachmentsBeingDeletedCount:(unint64_t)a3;
- (void)setContentItem:(id)a3;
- (void)setFileDownloadInProgress:(BOOL)a3;
- (void)setLaunchAction:(id)a3;
- (void)setModelCache:(id)a3;
- (void)setObservedUploadTasks:(id)a3;
- (void)setObserverTokens:(id)a3;
- (void)setPendingFollowup:(id)a3;
- (void)set_filePromiseSortDescriptors:(id)a3;
- (void)showAttachmentDeletionErrorAlert;
- (void)showAttachmentDeletionErrorAlertWithError:(id)a3;
- (void)showAttachmentDeletionSpinner;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)teamPicker:(id)a3 didSelectTeam:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBody;
- (void)updateEverything;
- (void)updateTitleView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation iFBAFeedbackViewController

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)iFBAFeedbackViewController;
  [(iFBAFeedbackViewController *)&v5 viewWillDisappear:a3];
  [(iFBAFeedbackViewController *)self hideSpinner];
  v4 = [(iFBAFeedbackViewController *)self refreshControl];
  [v4 endRefreshing];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)iFBAFeedbackViewController;
  [(iFBAFeedbackViewController *)&v4 viewWillAppear:a3];
  [(iFBAFeedbackViewController *)self setPendingFollowup:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)iFBAFeedbackViewController;
  [(iFBAFeedbackViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)iFBAFeedbackViewController;
  [(iFBAFeedbackViewController *)&v17 viewDidLoad];
  objc_super v3 = [(iFBAFeedbackViewController *)self tableView];
  [v3 setEstimatedSectionHeaderHeight:0.0];

  objc_super v4 = [(iFBAFeedbackViewController *)self tableView];
  [v4 setEstimatedSectionFooterHeight:0.0];

  [(iFBAFeedbackViewController *)self updateTitleView];
  objc_super v5 = [(iFBAFeedbackViewController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];

  v6 = [(iFBAFeedbackViewController *)self tableView];
  [v6 setEstimatedRowHeight:100.0];

  v7 = +[NSMutableArray arrayWithCapacity:2];
  [(iFBAFeedbackViewController *)self setObserverTokens:v7];

  v8 = [(iFBAFeedbackViewController *)self navigationItem];
  [v8 setLargeTitleDisplayMode:2];

  [(iFBAFeedbackViewController *)self traitCollectionDidChange:0];
  id v9 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 3.0];
  v10 = [(iFBAFeedbackViewController *)self tableView];
  [v10 setTableHeaderView:v9];

  id v11 = objc_alloc_init((Class)UIRefreshControl);
  [(iFBAFeedbackViewController *)self setRefreshControl:v11];

  v12 = [(iFBAFeedbackViewController *)self refreshControl];
  [v12 addTarget:self action:"_refreshFeedbackContentWithControl:" forControlEvents:4096];

  [(iFBAFeedbackViewController *)self configureKeyboardShortcuts];
  [(iFBAFeedbackViewController *)self configureActionsMenu];
  v13 = +[FBKAttachmentCell reuseIdentifier];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = +[UINib nibWithNibName:v13 bundle:v14];

  v16 = [(iFBAFeedbackViewController *)self tableView];
  [v16 registerNib:v15 forCellReuseIdentifier:v13];
}

- (void)configureKeyboardShortcuts
{
  id v15 = +[UIKeyCommand keyCommandWithInput:@"R" modifierFlags:0x100000 action:"_refreshFeedbackContentWithControl:"];
  objc_super v3 = +[NSBundle mainBundle];
  uint64_t v4 = FBKCommonStrings;
  objc_super v5 = [v3 localizedStringForKey:@"REFRESH_FEEDBACK" value:&stru_1000F6658 table:FBKCommonStrings];
  [v15 setDiscoverabilityTitle:v5];

  [(iFBAFeedbackViewController *)self addKeyCommand:v15];
  v6 = +[UIKeyCommand keyCommandWithInput:@"R" modifierFlags:1572864 action:"reloadAppProxy"];
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"REFRESH" value:&stru_1000F6658 table:v4];
  [v6 setDiscoverabilityTitle:v8];

  [(iFBAFeedbackViewController *)self addKeyCommand:v6];
  id v9 = +[UIKeyCommand keyCommandWithInput:@"C" modifierFlags:1179648 action:"copyFeedbackID"];
  v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"COPY_FEEDBACK_ID" value:&stru_1000F6658 table:v4];
  [v9 setDiscoverabilityTitle:v11];

  [(iFBAFeedbackViewController *)self addKeyCommand:v9];
  v12 = +[UIKeyCommand keyCommandWithInput:@"C" modifierFlags:1703936 action:"copyFeedbackIDAndTitle"];
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"COPY_ID_AND_TITLE" value:&stru_1000F6658 table:v4];
  [v12 setDiscoverabilityTitle:v14];

  [(iFBAFeedbackViewController *)self addKeyCommand:v12];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [(iFBAFeedbackViewController *)self traitCollection];
  id v5 = [v4 horizontalSizeClass];

  v6 = [(iFBAFeedbackViewController *)self tableView];
  if (v5 == (id)1)
  {
    double v7 = 1.0;
    double v8 = 1.0;
    id v9 = v6;
  }
  else
  {
    id v9 = v6;
    double v7 = 20.0;
    double v8 = 20.0;
  }
  [v6 _setSectionContentInset:0.0 v7:0.0 v8:0.0];
}

- (void)dealloc
{
  [(iFBAFeedbackViewController *)self resetObserverTokens];
  v3.receiver = self;
  v3.super_class = (Class)iFBAFeedbackViewController;
  [(iFBAFeedbackViewController *)&v3 dealloc];
}

- (void)setContentItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_contentItem, a3);
  v6 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:5];
  observedUploadTasks = self->_observedUploadTasks;
  self->_observedUploadTasks = v6;

  if (v5)
  {
    [(iFBAFeedbackViewController *)self updateTitleView];
    [(iFBAFeedbackViewController *)self _refreshFeedbackContent];
  }
  else
  {
    [(iFBAFeedbackViewController *)self updateEverything];
  }
  [(iFBAFeedbackViewController *)self resetObserverTokens];
  objc_initWeak(&location, self);
  double v8 = [(iFBAFeedbackViewController *)self observerTokens];
  id v9 = [(iFBAFeedbackViewController *)self contentItem];
  v10 = [v9 managedObjectContext];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1000464A0;
  id v15 = &unk_1000F24F0;
  objc_copyWeak(&v16, &location);
  id v11 = [v10 addObjectsDidChangeNotificationObserver:&v12];
  [v8 addObject:v11, v12, v13, v14, v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)resetObserverTokens
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(iFBAFeedbackViewController *)self observerTokens];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = +[NSNotificationCenter defaultCenter];
        [v9 removeObserver:v8];

        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10 = [(iFBAFeedbackViewController *)self observerTokens];
  [v10 removeAllObjects];
}

- (void)handleModelChanges:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableSet) initWithCapacity:6];
  uint64_t v6 = [(iFBAFeedbackViewController *)self observedUploadTasks];
  double v7 = [(iFBAFeedbackViewController *)self contentItem];

  if (v7)
  {
    uint64_t v8 = [(iFBAFeedbackViewController *)self contentItem];
    [v5 addObject:v8];
  }
  id v9 = [(iFBAFeedbackViewController *)self contentItem];
  v10 = [v9 feedback];

  if (v10)
  {
    long long v11 = [(iFBAFeedbackViewController *)self contentItem];
    long long v12 = [v11 feedback];
    [v5 addObject:v12];
  }
  long long v13 = [(iFBAFeedbackViewController *)self contentItem];
  long long v14 = [v13 formResponseStub];

  if (v14)
  {
    id v15 = [(iFBAFeedbackViewController *)self contentItem];
    id v16 = [v15 formResponseStub];

    [v5 addObject:v16];
    objc_super v17 = [v16 filePromiseStubs];
    v18 = [v17 allObjects];

    if (v18) {
      [v5 addObjectsFromArray:v18];
    }
  }
  v19 = [(iFBAFeedbackViewController *)self contentItem];
  v20 = [v19 feedback];
  v21 = [v20 feedbackFollowups];

  if (v21)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v22 = [(iFBAFeedbackViewController *)self contentItem];
    v23 = [v22 feedback];
    v24 = [v23 feedbackFollowups];

    id v25 = [v24 countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v75;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v75 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          [v5 addObject:v29];
          v30 = [v29 uploadTask];

          if (v30)
          {
            v31 = [v29 uploadTask];
            [v6 addObject:v31];
          }
          v32 = [v29 filePromises];
          v33 = [v32 allObjects];

          if (v33) {
            [v5 addObjectsFromArray:v33];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v74 objects:v81 count:16];
      }
      while (v26);
    }
  }
  v34 = [(iFBAFeedbackViewController *)self feedback];
  v35 = [v34 contentItem];
  v36 = [v35 formResponse];
  v37 = [v36 uploadTask];

  if (v37)
  {
    v38 = [(iFBAFeedbackViewController *)self feedback];
    v39 = [v38 contentItem];
    v40 = [v39 formResponse];
    v41 = [v40 uploadTask];
    [v6 addObject:v41];
  }
  v42 = [v4 updatedObjects];
  unsigned __int8 v43 = [v42 intersectsSet:v5];

  if (v43)
  {
    unsigned __int8 v44 = 1;
  }
  else
  {
    v45 = [v4 refreshedObjects];
    unsigned __int8 v44 = [v45 intersectsSet:v5];
  }
  v46 = [v4 insertedObjects];
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100046E18;
  v73[3] = &unk_1000F3088;
  v73[4] = self;
  v47 = [v46 ded_selectItemsPassingTest:v73];

  if ([v47 count])
  {
    v48 = +[FBALog appHandle];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [v47 valueForKeyPath:@"ID"];
      *(_DWORD *)buf = 138412290;
      id v80 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "inserted FFUs [%@]", buf, 0xCu);
    }
    unsigned __int8 v44 = 1;
  }
  v50 = [v4 deletedObjects];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100046EC4;
  v72[3] = &unk_1000F3088;
  v72[4] = self;
  v51 = [v50 ded_selectItemsPassingTest:v72];

  if ([v51 count])
  {
    v52 = +[FBALog appHandle];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = [v51 valueForKeyPath:@"ID"];
      *(_DWORD *)buf = 138412290;
      id v80 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "removed FFUs [%@]", buf, 0xCu);
    }
    unsigned __int8 v44 = 1;
  }
  v65 = v51;
  v66 = v47;
  v64 = self;
  objc_opt_class();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v67 = v4;
  v54 = [v4 deletedObjects];
  id v55 = [v54 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v69;
    do
    {
      for (j = 0; j != v56; j = (char *)j + 1)
      {
        if (*(void *)v69 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
        if (objc_opt_isKindOfClass())
        {
          id v60 = v59;
          if ([v6 containsObject:v60])
          {
            v61 = +[FBALog appHandle];
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v62 = [v60 taskIdentifier];
              id v63 = [v62 unsignedLongValue];
              *(_DWORD *)buf = 134217984;
              id v80 = v63;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Deleted upload task [%lu]. Will update view", buf, 0xCu);
            }
            unsigned __int8 v44 = 1;
          }
        }
      }
      id v56 = [v54 countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v56);
  }

  if (v44) {
    [(iFBAFeedbackViewController *)v64 updateEverything];
  }
}

- (id)feedback
{
  v2 = [(iFBAFeedbackViewController *)self contentItem];
  objc_super v3 = [v2 detailedItem];

  return v3;
}

- (void)_refreshFeedbackContent
{
}

- (void)_refreshFeedbackContentWithControl:(id)a3
{
}

- (void)_refreshFeedbackContentForced:(BOOL)a3
{
  BOOL v3 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100047144;
  v13[3] = &unk_1000F2518;
  v13[4] = self;
  id v5 = objc_retainBlock(v13);
  uint64_t v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_1000F6658 table:0];
  [(iFBAFeedbackViewController *)self showSpinnerWithStatus:v7 userInteractionEnabled:1];

  uint64_t v8 = +[FBKData sharedInstance];
  id v9 = [(iFBAFeedbackViewController *)self contentItem];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000474A8;
  v11[3] = &unk_1000F3E18;
  v11[4] = self;
  id v12 = v5;
  v10 = v5;
  [v8 getFeedbackForContentItem:v9 forceRefresh:v3 completion:v11];
}

- (void)autoLogOutIfNeeded
{
  uint64_t v3 = [(iFBAFeedbackViewController *)self launchAction];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(iFBAFeedbackViewController *)self launchAction];
    unsigned int v6 = [v5 isCaptive];

    if (v6)
    {
      double v7 = [(iFBAFeedbackViewController *)self contentItem];
      uint64_t v8 = [v7 formResponse];

      if (v8
        && ([v8 uploadTask], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
      {
        int v10 = 0;
      }
      else
      {
        long long v11 = +[FBALog appHandle];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v8 ID];
          uint64_t v13 = [v12 stringValue];
          long long v14 = (void *)v13;
          if (v13) {
            CFStringRef v15 = (const __CFString *)v13;
          }
          else {
            CFStringRef v15 = @"nil";
          }
          uint64_t v16 = [v8 uploadTask];
          objc_super v17 = (void *)v16;
          if (v16) {
            CFStringRef v18 = (const __CFString *)v16;
          }
          else {
            CFStringRef v18 = @"nil";
          }
          *(_DWORD *)buf = 138543618;
          CFStringRef v40 = v15;
          __int16 v41 = 2114;
          CFStringRef v42 = v18;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Form response [%{public}@] or upload task [%{public}@] is nil, exiting restricted mode.", buf, 0x16u);
        }
        int v10 = 1;
      }
      if ([v8 serverSideIsComplete])
      {
        v19 = +[FBALog appHandle];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Server side has marked FR as complete, exiting restricted mode.", buf, 2u);
        }

        int v10 = 1;
      }
      uint64_t v20 = [v8 uploadTask];
      if (v20
        && (v21 = (void *)v20,
            [v8 uploadTask],
            v22 = objc_claimAutoreleasedReturnValue(),
            id v23 = [v22 localSubmissionStage],
            v22,
            v21,
            v23 == (id)6))
      {
        v24 = +[FBALog appHandle];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v8 uploadTask];
          id v26 = (void *)v25;
          CFStringRef v27 = @"nil";
          if (v25) {
            CFStringRef v27 = (const __CFString *)v25;
          }
          *(_DWORD *)buf = 138543362;
          CFStringRef v40 = v27;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Upload task [%{public}@] completed, exiting restricted mode.", buf, 0xCu);
        }
      }
      else if (!v10)
      {
LABEL_28:

        return;
      }
      [(iFBAFeedbackViewController *)self resetObserverTokens];
      v28 = +[NSBundle mainBundle];
      v29 = [v28 localizedStringForKey:@"UPLOAD_COMPLETE_TITLE" value:@"Upload Complete" table:0];
      v30 = +[NSBundle mainBundle];
      v31 = [v30 localizedStringForKey:@"UPLOAD_COMPLETE_MESSAGE" value:@"Your diagnostics have been sent to Apple." table:0];
      v32 = +[UIAlertController alertControllerWithTitle:v29 message:v31 preferredStyle:1];

      v33 = [(iFBAFeedbackViewController *)self launchAction];
      LOBYTE(v29) = [v33 shouldMakeFBAVisible];

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100047C28;
      v35[3] = &unk_1000F3998;
      id v36 = v32;
      v37 = self;
      char v38 = (char)v29;
      id v34 = v32;
      [(iFBAFeedbackViewController *)self presentViewController:v34 animated:1 completion:v35];
      [(iFBAFeedbackViewController *)self setLaunchAction:0];

      goto LABEL_28;
    }
  }
}

- (void)updateEverything
{
  [(iFBAFeedbackViewController *)self configureActionsMenu];
  [(iFBAFeedbackViewController *)self updateTitleView];
  [(iFBAFeedbackViewController *)self updateBody];
  [(iFBAFeedbackViewController *)self autoLogOutIfNeeded];
  uint64_t v3 = [(iFBAFeedbackViewController *)self tableView];
  [v3 setBackgroundView:0];

  id v4 = [(iFBAFeedbackViewController *)self tableView];
  [v4 reloadData];
}

- (void)updateBody
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  if ([(iFBAFeedbackViewController *)self showsAssigneeRow])
  {
    id v4 = [[Row alloc] initWithType:0];
    id v5 = [(iFBAFeedbackViewController *)self contentItem];
    [(Row *)v4 setObject:v5];

    unsigned int v6 = objc_opt_new();
    v119 = v4;
    double v7 = +[NSArray arrayWithObjects:&v119 count:1];
    [v6 setRows:v7];

    [v3 addObject:v6];
  }
  uint64_t v8 = [(iFBAFeedbackViewController *)self feedback];
  id v9 = [v8 formResponseStub];

  if (v9)
  {
    v92 = v3;
    int v10 = objc_opt_new();
    [v10 setTitle:0];
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    id v12 = [[Row alloc] initWithType:7];
    uint64_t v13 = [(iFBAFeedbackViewController *)self contentItem];
    [(Row *)v12 setObject:v13];

    [v11 addObject:v12];
    long long v14 = [[Row alloc] initWithType:1];
    [v11 addObject:v14];

    CFStringRef v15 = [(iFBAFeedbackViewController *)self feedback];
    uint64_t v16 = [v15 contentItem];
    objc_super v17 = [v16 formResponse];
    CFStringRef v18 = [v17 uploadTask];

    v88 = self;
    if (v18 && [v18 localSubmissionStage] != (id)6)
    {
      v30 = [[Row alloc] initWithType:3];

      v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"Uploading files…" value:&stru_1000F6658 table:0];
      [(Row *)v30 setText:v32];

      v33 = [(iFBAFeedbackViewController *)self feedback];
      id v34 = [v33 contentItem];
      v35 = [v34 formResponse];
      id v36 = [v35 uploadTask];
      [(Row *)v30 setObject:v36];

      [v11 addObject:v30];
      id v12 = v30;
    }
    else
    {
      v97 = v18;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v19 = [(iFBAFeedbackViewController *)self feedback];
      uint64_t v20 = [v19 formResponseStub];
      v21 = [v20 visibleFilePromises];

      id v22 = [v21 countByEnumeratingWithState:&v109 objects:v118 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v110;
        do
        {
          uint64_t v25 = 0;
          id v26 = v12;
          do
          {
            if (*(void *)v110 != v24) {
              objc_enumerationMutation(v21);
            }
            CFStringRef v27 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v25);
            id v12 = [[Row alloc] initWithType:5];

            v28 = [v27 name];
            [(Row *)v12 setText:v28];

            [(Row *)v12 setObject:v27];
            [v11 addObject:v12];
            uint64_t v25 = (char *)v25 + 1;
            id v26 = v12;
          }
          while (v23 != v25);
          id v23 = [v21 countByEnumeratingWithState:&v109 objects:v118 count:16];
        }
        while (v23);
      }

      CFStringRef v18 = v97;
    }
    v37 = +[NSArray arrayWithArray:v11];
    [v10 setRows:v37];

    [v92 addObject:v10];
    char v38 = [(iFBAFeedbackViewController *)v88 feedback];

    if (v38)
    {
      v39 = [(iFBAFeedbackViewController *)v88 feedback];
      CFStringRef v40 = [v39 validFeedbackFollowups];
      __int16 v41 = +[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:1];
      v117 = v41;
      CFStringRef v42 = +[NSArray arrayWithObjects:&v117 count:1];
      unsigned __int8 v43 = [v40 sortedArrayUsingDescriptors:v42];
    }
    else
    {
      unsigned __int8 v43 = &__NSArray0__struct;
    }
    unsigned __int8 v44 = &swift_getEnumCaseMultiPayload_ptr;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v29 = v43;
    id v45 = [v29 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v106;
      uint64_t v87 = FBKSystemImageNameValidationNo;
      v85 = (unsigned int *)&v115;
      uint64_t v86 = FBKSystemImageNameValidationYes;
      uint64_t v90 = *(void *)v106;
      v91 = v29;
      do
      {
        v48 = 0;
        id v93 = v46;
        do
        {
          if (*(void *)v106 != v47) {
            objc_enumerationMutation(v29);
          }
          v49 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v48);
          if (objc_msgSend(v49, "type", v85) != (id)1)
          {
            v50 = objc_opt_new();
            v96 = objc_opt_new();
            id v51 = [objc_alloc((Class)v44[333]) initWithCapacity:3];
            id v52 = [objc_alloc((Class)v44[333]) initWithCapacity:3];
            v53 = [[Row alloc] initWithType:8];
            [(Row *)v53 setObject:v49];
            v95 = v53;
            [v51 addObject:v53];
            v54 = [[Row alloc] initWithType:7];
            [(Row *)v54 setObject:v49];
            v94 = v54;
            [v52 addObject:v54];
            unint64_t v55 = (unint64_t)[v49 type];
            if (v55 <= 7)
            {
              v98 = v50;
              if (((1 << v55) & 0x9D) != 0)
              {
                if ((uint64_t)[v49 textResponsesCount] >= 1)
                {
                  id v56 = [[Row alloc] initWithType:2];
                  [(Row *)v56 setObject:v49];
                  uint64_t v57 = [v49 textResponsesSummary];
                  [(Row *)v56 setText:v57];

                  v50 = v98;
                  [v52 addObject:v56];
                }
                if ([v49 type])
                {
                  v58 = [[Row alloc] initWithType:2];
                  [(Row *)v58 setObject:v49];
                  v59 = [v49 displayText];
                  [(Row *)v58 setText:v59];

                  v50 = v98;
                  [v51 addObject:v58];
                }
                if (([v49 isComplete] & 1) == 0 && objc_msgSend(v49, "type"))
                {
                  id v60 = [[Row alloc] initWithType:4];
                  [(Row *)v60 setObject:v49];
                  [v51 addObject:v60];
                  goto LABEL_47;
                }
                if ([v49 type] == (id)4 || objc_msgSend(v49, "type") == (id)7)
                {
                  id v60 = [v49 validationResponse];
                  if (v60)
                  {
                    v61 = [[Row alloc] initWithType:6];
                    if ([(Row *)v60 isValidated])
                    {
                      v62 = [v49 positiveChoice];
                      uint64_t v63 = v86;
                    }
                    else
                    {
                      v62 = [v49 negativeChoice];
                      uint64_t v63 = v87;
                    }
                    [(Row *)v61 setText:v62];

                    v67 = +[UIImage systemImageNamed:v63];
                    long long v68 = [v67 imageWithRenderingMode:2];
                    [(Row *)v61 setObject:v68];

                    [v52 addObject:v61];
                    unsigned __int8 v44 = &swift_getEnumCaseMultiPayload_ptr;
                  }
                  else
                  {
                    v61 = +[FBALog ffu];
                    if (os_log_type_enabled(&v61->super, OS_LOG_TYPE_ERROR)) {
                      sub_1000A6968(buf, v49, v85, &v61->super);
                    }
                  }

                  v50 = v98;
LABEL_47:
                }
                if ([v49 isUploadingFiles])
                {
                  v64 = [[Row alloc] initWithType:3];
                  long long v69 = [v49 uploadTask];
                  [(Row *)v64 setObject:v69];

                  v66 = v52;
LABEL_50:
                  [v66 addObject:v64];
                }
                else if ([v49 hasVisibleFiles])
                {
                  id v89 = v51;
                  long long v70 = [v49 visibleFilePromises];
                  long long v71 = [(iFBAFeedbackViewController *)v88 filePromiseSortDescriptors];
                  v72 = [v70 sortedArrayUsingDescriptors:v71];

                  long long v103 = 0u;
                  long long v104 = 0u;
                  long long v101 = 0u;
                  long long v102 = 0u;
                  v64 = v72;
                  id v73 = [(Row *)v64 countByEnumeratingWithState:&v101 objects:v113 count:16];
                  if (v73)
                  {
                    id v74 = v73;
                    uint64_t v75 = *(void *)v102;
                    do
                    {
                      for (i = 0; i != v74; i = (char *)i + 1)
                      {
                        if (*(void *)v102 != v75) {
                          objc_enumerationMutation(v64);
                        }
                        long long v77 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                        v78 = [[Row alloc] initWithType:5];
                        v79 = [v77 filename];
                        [(Row *)v78 setText:v79];

                        [(Row *)v78 setObject:v77];
                        [v52 addObject:v78];
                      }
                      id v74 = [(Row *)v64 countByEnumeratingWithState:&v101 objects:v113 count:16];
                    }
                    while (v74);
                  }

                  unsigned __int8 v44 = &swift_getEnumCaseMultiPayload_ptr;
                  v50 = v98;
                  id v51 = v89;
                }
                else
                {
                  v64 = +[FBALog ffu];
                  if (os_log_type_enabled(&v64->super, OS_LOG_TYPE_DEBUG)) {
                    sub_1000A6928(&v99, v100, &v64->super);
                  }
                }
              }
              else if (((1 << v55) & 0x60) != 0)
              {
                v64 = [[Row alloc] initWithType:2];
                v65 = [v49 displayText];
                [(Row *)v64 setText:v65];

                v50 = v98;
                [(Row *)v64 setObject:v49];
                v66 = v51;
                goto LABEL_50;
              }
            }
            [v50 setRows:v51];
            id v80 = [v50 rows];
            id v81 = [v80 count];

            if ((unint64_t)v81 >= 2) {
              [v92 addObject:v50];
            }
            [v96 setRows:v52];
            v82 = [v96 rows];
            id v83 = [v82 count];

            if ((unint64_t)v83 >= 2) {
              [v92 addObject:v96];
            }

            uint64_t v47 = v90;
            v29 = v91;
            id v46 = v93;
          }
          v48 = (char *)v48 + 1;
        }
        while (v48 != v46);
        id v46 = [v29 countByEnumeratingWithState:&v105 objects:v116 count:16];
      }
      while (v46);
    }

    id v3 = v92;
    v84 = +[NSArray arrayWithArray:v92];
    [(iFBAFeedbackViewController *)v88 setModelCache:v84];
  }
  else
  {
    v29 = +[FBALog appHandle];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "deferring rendering until response stub data is available", buf, 2u);
    }
  }
}

- (id)filePromiseSortDescriptors
{
  id v3 = [(iFBAFeedbackViewController *)self _filePromiseSortDescriptors];

  if (!v3)
  {
    id v4 = +[FBKFilePromise displaySortDescriptors];
    [(iFBAFeedbackViewController *)self set_filePromiseSortDescriptors:v4];
  }

  return [(iFBAFeedbackViewController *)self _filePromiseSortDescriptors];
}

- (BOOL)showsAssigneeRow
{
  id v3 = [(iFBAFeedbackViewController *)self contentItem];
  id v4 = [v3 singleTeam];
  if ([v4 teamType])
  {
    id v5 = [(iFBAFeedbackViewController *)self contentItem];
    if ([v5 isOrphaned])
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      double v7 = [(iFBAFeedbackViewController *)self contentItem];
      uint64_t v8 = [v7 assignee];
      id v9 = [(iFBAFeedbackViewController *)self contentItem];
      int v10 = [v9 originator];
      unsigned int v6 = [v8 isEqual:v10] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)updateTitleView
{
  id v5 = [(iFBAFeedbackViewController *)self contentItem];
  id v3 = [v5 feedbackIDString];
  id v4 = [(iFBAFeedbackViewController *)self navigationItem];
  [v4 setTitle:v3];
}

- (NSDateFormatter)sectionDateFormatter
{
  if (qword_100124158[0] != -1) {
    dispatch_once(qword_100124158, &stru_1000F3E38);
  }
  v2 = (void *)qword_100124150;

  return (NSDateFormatter *)v2;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v25 = a3;
  id v5 = [v25 identifier];
  unsigned int v6 = [v5 isEqualToString:@"FBAFollowupResponsePresentation"];
  if (v6)
  {

LABEL_4:
    uint64_t v9 = v6 ^ 1;
    int v10 = [v25 destinationViewController];
    id v11 = [v10 topViewController];
    [v11 setIsUnsolicited:v9];
    id v12 = [(iFBAFeedbackViewController *)self pendingFollowup];
    [v11 setFollowup:v12];

    uint64_t v13 = [(iFBAFeedbackViewController *)self feedback];
    long long v14 = [v13 contentItem];
    [v11 setContentItem:v14];
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  double v7 = [v25 identifier];
  unsigned int v8 = [v7 isEqualToString:@"FBAUnsolicitedFollowupResponsePresentation"];

  if (v8) {
    goto LABEL_4;
  }
  CFStringRef v15 = [v25 identifier];
  unsigned int v16 = [v15 isEqualToString:@"PromoteSingleFeedbackPresentation"];

  if (v16)
  {
    int v10 = [v25 destinationViewController];
    objc_super v17 = [v10 presentationController];
    [v17 setDelegate:self];

    id v11 = [v10 topViewController];
    [v11 setPickerDelegate:self];
    CFStringRef v18 = [(iFBAFeedbackViewController *)self contentItem];
    v19 = [v18 singleTeam];
    [v11 setSelectedTeam:v19];

    uint64_t v13 = [(iFBAFeedbackViewController *)self contentItem];
    long long v14 = [v13 user];
    uint64_t v20 = [v14 activeTeams];
    v21 = +[FBKTeam sortDescriptors];
    id v22 = [v20 sortedArrayUsingDescriptors:v21];
    [v11 setTeams:v22];

    goto LABEL_5;
  }
  id v23 = [v25 identifier];
  unsigned int v24 = [v23 isEqualToString:@"AssignSingleFeedbackPresentation"];

  if (v24)
  {
    int v10 = [v25 destinationViewController];
    id v11 = [v10 topViewController];
    [v11 setParticipantDelegate:self];
    uint64_t v13 = [(iFBAFeedbackViewController *)self contentItem];
    [v11 configureWithContentItem:v13];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)beginFileDownloadForFilePromise:(id)a3
{
  id v4 = a3;
  if (![(iFBAFeedbackViewController *)self fileDownloadInProgress])
  {
    id v5 = [(iFBAFeedbackViewController *)self contentItem];
    id v6 = [v5 canDownloadFiles];

    if (v6 && [v4 downloadState] == (id)2)
    {
      [(iFBAFeedbackViewController *)self setFileDownloadInProgress:1];
      double v7 = +[NSBundle mainBundle];
      unsigned int v8 = [v7 localizedStringForKey:@"FILE_DOWNLOAD_PREPARING" value:&stru_1000F6658 table:FBKCommonStrings];
      [(iFBAFeedbackViewController *)self showSpinnerWithStatus:v8 userInteractionEnabled:0];

      uint64_t v9 = +[FBKData sharedInstance];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100049204;
      v17[3] = &unk_1000F3EC8;
      v17[4] = self;
      [v9 getFileDownloadURLForFilePromise:v4 completion:v17];
    }
    else
    {
      int v10 = +[NSBundle mainBundle];
      uint64_t v11 = FBKCommonStrings;
      id v12 = [v10 localizedStringForKey:@"FILE_DOWNLOAD_UNAVAILABLE_TITLE" value:&stru_1000F6658 table:FBKCommonStrings];
      uint64_t v13 = [(iFBAFeedbackViewController *)self localizedErrorStringForMaybeFilePromise:v4 downloadPermission:v6];
      uint64_t v9 = +[UIAlertController alertControllerWithTitle:v12 message:v13 preferredStyle:1];

      long long v14 = +[NSBundle mainBundle];
      CFStringRef v15 = [v14 localizedStringForKey:@"OK" value:&stru_1000F6658 table:v11];
      unsigned int v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:&stru_1000F3E58];
      [v9 addAction:v16];

      [(iFBAFeedbackViewController *)self presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (id)localizedErrorStringForMaybeFilePromise:(id)a3 downloadPermission:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (a4)
    {
      double v7 = [v5 localizedDownloadErrorString];
      goto LABEL_7;
    }
    unsigned int v8 = +[NSBundle mainBundle];
    uint64_t v9 = v8;
    uint64_t v10 = FBKCommonStrings;
    CFStringRef v11 = @"FILE_DOWNLOAD_UNAVAILABLE_TEAM_FORBIDDEN";
  }
  else
  {
    unsigned int v8 = +[NSBundle mainBundle];
    uint64_t v9 = v8;
    uint64_t v10 = FBKCommonStrings;
    CFStringRef v11 = @"FILE_DOWNLOAD_UNAVAILABLE_MESSAGE";
  }
  double v7 = [v8 localizedStringForKey:v11 value:&stru_1000F6658 table:v10];

LABEL_7:

  return v7;
}

- (void)configureActionsMenu
{
  id v3 = [_TtC18Feedback_Assistant23FBAActionMenuController alloc];
  id v4 = [(iFBAFeedbackViewController *)self contentItem];
  id v5 = [v4 feedbackIDString];
  id v6 = [(FBAActionMenuController *)v3 initWithTitle:v5 subtitle:0 actions:0];

  double v7 = [(iFBAFeedbackViewController *)self contentItem];
  LODWORD(v5) = [v7 allowUnsolicitedFollowup];

  if (v5)
  {
    unsigned int v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"UNSOLICITED_FOLLOWUP_ACTION" value:&stru_1000F6658 table:0];
    uint64_t v10 = +[UIImage systemImageNamed:FBKSystemImageNameAddFollowup];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100049C64;
    v52[3] = &unk_1000F2C90;
    v52[4] = self;
    [(FBAActionMenuController *)v6 addActionWithTitle:v9 image:v10 actionHandler:v52];
  }
  CFStringRef v11 = [(iFBAFeedbackViewController *)self contentItem];
  id v12 = [v11 itemType];

  if (v12 == (id)4)
  {
    uint64_t v13 = +[NSBundle mainBundle];
    long long v14 = [v13 localizedStringForKey:@"COPY_FEEDBACK_ID" value:&stru_1000F6658 table:FBKCommonStrings];
    CFStringRef v15 = +[UIImage systemImageNamed:FBKSystemImageNameCopyFeedbackID];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100049CF0;
    v51[3] = &unk_1000F2C90;
    v51[4] = self;
    [(FBAActionMenuController *)v6 addActionWithTitle:v14 image:v15 actionHandler:v51];
  }
  unsigned int v16 = [(iFBAFeedbackViewController *)self contentItem];
  id v17 = [v16 itemType];

  if (v17 == (id)4)
  {
    CFStringRef v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"COPY_ID_AND_TITLE" value:&stru_1000F6658 table:FBKCommonStrings];
    uint64_t v20 = +[UIImage systemImageNamed:FBKSystemImageNameCopyFeedbackIDAndTitle];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100049CF8;
    v50[3] = &unk_1000F2C90;
    v50[4] = self;
    [(FBAActionMenuController *)v6 addActionWithTitle:v19 image:v20 actionHandler:v50];
  }
  v21 = [(iFBAFeedbackViewController *)self contentItem];
  id v22 = [v21 user];
  unsigned int v23 = [v22 hasManagedTeams];

  if (v23)
  {
    unsigned int v24 = [(iFBAFeedbackViewController *)self contentItem];
    unsigned int v25 = [v24 canPromoteFeedback];

    if (v25)
    {
      id v26 = +[NSBundle mainBundle];
      CFStringRef v27 = [v26 localizedStringForKey:@"PROMOTE_FEEDBACK" value:&stru_1000F6658 table:FBKCommonStrings];
      v28 = +[UIImage systemImageNamed:FBKSystemImageNamePromoteFeedback];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100049D00;
      v49[3] = &unk_1000F2C90;
      v49[4] = self;
      [(FBAActionMenuController *)v6 addActionWithTitle:v27 image:v28 actionHandler:v49];
    }
    v29 = [(iFBAFeedbackViewController *)self contentItem];
    unsigned int v30 = [v29 canDemoteFeedback];

    if (v30)
    {
      v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"DEMOTE_FEEDBACK" value:&stru_1000F6658 table:FBKCommonStrings];
      v33 = +[UIImage imageNamed:FBKImageNameDemoteFeedback];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100049F74;
      v48[3] = &unk_1000F2C90;
      v48[4] = self;
      [(FBAActionMenuController *)v6 addActionWithTitle:v32 image:v33 actionHandler:v48];
    }
    id v34 = [(iFBAFeedbackViewController *)self contentItem];
    unsigned int v35 = [v34 canReassignFeedback];

    if (v35)
    {
      id v36 = +[NSBundle mainBundle];
      v37 = [v36 localizedStringForKey:@"ASSIGN_TO_TEAMMATE" value:&stru_1000F6658 table:FBKCommonStrings];
      char v38 = +[UIImage systemImageNamed:FBKSystemImageNameReassignFeedback];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100049F7C;
      v47[3] = &unk_1000F2C90;
      v47[4] = self;
      [(FBAActionMenuController *)v6 addActionWithTitle:v37 image:v38 actionHandler:v47];
    }
  }
  v39 = [(iFBAFeedbackViewController *)self contentItem];
  unsigned int v40 = [v39 canCloseFeedback];

  if (v40)
  {
    __int16 v41 = +[NSBundle mainBundle];
    CFStringRef v42 = [v41 localizedStringForKey:@"CLOSE_FEEDBACK_BUTTON" value:&stru_1000F6658 table:FBKCommonStrings];
    unsigned __int8 v43 = +[UIImage imageNamed:FBKImageNameCloseFeedback];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100049F94;
    v46[3] = &unk_1000F2C90;
    v46[4] = self;
    [(FBAActionMenuController *)v6 addActionWithTitle:v42 image:v43 actionHandler:v46];
  }
  unsigned __int8 v44 = [(iFBAFeedbackViewController *)self navigationItem];
  id v45 = [v44 rightBarButtonItem];
  [(FBAActionMenuController *)v6 attachToBarButtonItem:v45];
}

- (void)copyFeedbackID
{
  id v5 = +[UIPasteboard generalPasteboard];
  id v3 = [(iFBAFeedbackViewController *)self contentItem];
  id v4 = [v3 feedbackIDString];
  [v5 setString:v4];
}

- (void)copyFeedbackIDAndTitle
{
  id v5 = +[UIPasteboard generalPasteboard];
  id v3 = [(iFBAFeedbackViewController *)self contentItem];
  id v4 = [v3 feedbackIDAndTitleString];
  [v5 setString:v4];
}

- (void)reloadAppProxy
{
  v2 = [(iFBAFeedbackViewController *)self launchAction];
  unsigned __int8 v3 = [v2 isCaptive];

  if ((v3 & 1) == 0)
  {
    id v4 = +[FBADraftManager sharedInstance];
    [v4 reloadApp];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a4;
  id v5 = [(iFBAFeedbackViewController *)self modelCache];
  id v6 = [v5 objectAtIndexedSubscript:[v17 section]];
  double v7 = [v6 rows];
  unsigned int v8 = [v7 objectAtIndexedSubscript:[v17 row]];

  if ([v8 type] == (id)4)
  {
    uint64_t v9 = [v8 object];
    unsigned int v10 = [v9 canRespond];

    if (v10)
    {
      CFStringRef v11 = [v8 object];
      [(iFBAFeedbackViewController *)self setPendingFollowup:v11];

      CFStringRef v12 = @"FBAFollowupResponsePresentation";
      uint64_t v13 = self;
      long long v14 = self;
LABEL_8:
      [(iFBAFeedbackViewController *)v13 performSegueWithIdentifier:v12 sender:v14];
      goto LABEL_9;
    }
  }
  if ([v8 type] == (id)5)
  {
    CFStringRef v15 = [v8 object];
    [(iFBAFeedbackViewController *)self beginFileDownloadForFilePromise:v15];

    goto LABEL_9;
  }
  if ([(iFBAFeedbackViewController *)self rowShouldPresentAssigneePicker:v8])
  {
    CFStringRef v12 = @"AssignSingleFeedbackPresentation";
    uint64_t v13 = self;
    long long v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
  unsigned int v16 = [(iFBAFeedbackViewController *)self tableView];
  [v16 deselectRowAtIndexPath:v17 animated:1];
}

- (BOOL)rowShouldPresentAssigneePicker:(id)a3
{
  id v4 = a3;
  id v5 = [(iFBAFeedbackViewController *)self contentItem];
  unsigned int v6 = [v5 canReassignFeedback];

  if (v6)
  {
    if (![v4 type])
    {
      char isKindOfClass = 1;
      goto LABEL_8;
    }
    if ([v4 type] == (id)7 && !-[iFBAFeedbackViewController showsAssigneeRow](self, "showsAssigneeRow"))
    {
      unsigned int v8 = [v4 object];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      goto LABEL_8;
    }
  }
  char isKindOfClass = 0;
LABEL_8:

  return isKindOfClass & 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unsigned __int8 v3 = [(iFBAFeedbackViewController *)self modelCache];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(iFBAFeedbackViewController *)self modelCache];
  unsigned int v6 = [v5 objectAtIndex:a4];
  double v7 = [v6 rows];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(iFBAFeedbackViewController *)self modelCache];
  unsigned int v6 = [v5 objectAtIndex:a4];

  double v7 = [v6 title];

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(iFBAFeedbackViewController *)self modelCache];
  id v8 = (char *)[v7 count] - 1;

  double v9 = 3.0;
  if (v8 == (char *)a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)iFBAFeedbackViewController;
    [(iFBAFeedbackViewController *)&v12 tableView:v6 heightForFooterInSection:a4];
    double v9 = v10;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 3.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(iFBAFeedbackViewController *)self modelCache];
  double v9 = [v8 objectAtIndex:[v7 section]];

  double v10 = [v9 rows];
  CFStringRef v11 = [v10 objectAtIndex:[v7 row]];

  switch((unint64_t)[v11 type])
  {
    case 0uLL:
    case 7uLL:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"ResponseHeaderCell" forIndexPath:v7];
      uint64_t v12 = [v11 object];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        long long v14 = [v11 object];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unsigned int v16 = [v11 object];
          [v10 configureForFollowup:v16];
          goto LABEL_26;
        }
      }
      uint64_t v21 = [v11 object];
      if (v21)
      {
        id v22 = (void *)v21;
        unsigned int v23 = [v11 object];
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();

        if (v24)
        {
          id v25 = [v11 type];
          unsigned int v16 = [(iFBAFeedbackViewController *)self contentItem];
          if (v25) {
            [v10 configureForContentItem:v16];
          }
          else {
            [v10 configureAssigneeForContentItem:v16];
          }
          goto LABEL_26;
        }
      }
      break;
    case 1uLL:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"FormResponseDetailCell" forIndexPath:v7];
      unsigned int v16 = [(iFBAFeedbackViewController *)self contentItem];
      [v10 setContentItem:v16];
      goto LABEL_26;
    case 2uLL:
    case 0xAuLL:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"PromptOnlyTextCell" forIndexPath:v7];
      id v17 = [v11 text];
      CFStringRef v18 = [v10 promptLabel];
      v19 = [v18 font];
      unsigned int v16 = +[NSMutableAttributedString linkedAttributedFromString:v17 withFont:v19];

      uint64_t v20 = [v10 promptLabel];
      [v20 setAttributedText:v16];

      goto LABEL_26;
    case 3uLL:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"UploadProgressCell" forIndexPath:v7];
      unsigned int v16 = [v11 object];
      [v10 setObservedTask:v16];
      [v10 setSelectionStyle:0];
      [v10 layoutIfNeeded];
      goto LABEL_26;
    case 4uLL:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"RespondActionCell" forIndexPath:v7];
      unsigned int v16 = [v11 object];
      if ([v16 canRespond]) {
        +[iFBAConstants tintColor];
      }
      else {
      __int16 v41 = +[UIColor secondaryLabelColor];
      }
      CFStringRef v42 = [v10 textLabel];
      [v42 setTextColor:v41];

      if ([v16 canRespond]) {
        uint64_t v43 = 3;
      }
      else {
        uint64_t v43 = 0;
      }
      [v10 setSelectionStyle:v43];
      goto LABEL_26;
    case 5uLL:
      id v26 = +[FBKAttachmentCell reuseIdentifier];
      double v10 = [v6 dequeueReusableCellWithIdentifier:v26 forIndexPath:v7];

      id v27 = [objc_alloc((Class)FBKAttachment) initWithCollectorIdentifier:@"ffu-no-collector-id" deviceUUID:@"no-device"];
      [v27 setState:2];
      v28 = [v11 text];
      [v27 setPlaceholderText:v28];

      [v10 setSelectionStyle:3];
      v29 = [v11 object];
      id v30 = [v29 downloadState];
      if (v29 && v30 == (id)3)
      {
        uint64_t v31 = 7;
      }
      else
      {
        uint64_t v31 = 6;
        if (v29 && v30)
        {
          id v45 = +[UIColor labelColor];
          id v46 = [v10 attachmentDisplayName];
          [v46 setTextColor:v45];

          uint64_t v31 = (uint64_t)[v27 state];
        }
      }
      [v27 setState:v31];
      [v27 setAttachmentType:6];
      [v10 setAttachment:v27];
      uint64_t v47 = +[iFBAConstants tintColor];
      v48 = [v10 imageView];
      [v48 setTintColor:v47];

      v49 = [(iFBAFeedbackViewController *)self tableView];
      [v49 separatorInset];
      [v10 updateContentInsetWithValue:v50];

      break;
    case 6uLL:
      v32 = [(iFBAFeedbackViewController *)self tableView];
      double v10 = [v32 dequeueReusableCellWithIdentifier:@"ValidationCell" forIndexPath:v7];

      v33 = [v11 text];
      id v34 = [v10 textLabel];
      [v34 setText:v33];

      unsigned int v35 = +[UIColor labelColor];
      id v36 = [v10 textLabel];
      [v36 setTextColor:v35];

      v37 = [v11 object];
      char v38 = [v10 imageView];
      [v38 setImage:v37];
      goto LABEL_20;
    case 8uLL:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"ResponseHeaderCell" forIndexPath:v7];
      unsigned int v16 = [v11 object];
      [v10 configureForAppleFeedbackWithFollowup:v16];
LABEL_26:

      break;
    case 9uLL:
      v39 = [(iFBAFeedbackViewController *)self tableView];
      double v10 = [v39 dequeueReusableCellWithIdentifier:@"StatusTextCell"];

      v37 = [v11 object];
      char v38 = [v37 attributedStringRepresentation];
      unsigned int v40 = [v10 textLabel];
      [v40 setAttributedText:v38];

LABEL_20:
      [v10 setSelectionStyle:0];
      break;
    default:
      break;
  }

  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004ACE4;
  v4[3] = &unk_1000F2D18;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(iFBAFeedbackViewController *)self modelCache];
  double v9 = [v8 objectAtIndex:[v7 section]];

  double v10 = [v9 rows];
  CFStringRef v11 = [v10 objectAtIndex:[v7 row]];

  if ([v11 type] != (id)5)
  {
    v19 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = [v11 object];
  uint64_t v13 = [(iFBAFeedbackViewController *)self contentItem];
  long long v14 = v13;
  if (!v13)
  {
    uint64_t v20 = +[FBALog appHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000A69E4();
    }

    goto LABEL_9;
  }
  if (![v13 canDeleteFiles])
  {
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  objc_initWeak(&location, self);
  CFStringRef v15 = +[NSBundle mainBundle];
  unsigned int v16 = [v15 localizedStringForKey:@"ATTACHMENT_DELETION_BUTTON_TITLE" value:&stru_1000F6658 table:@"CommonStrings"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004B07C;
  v22[3] = &unk_1000F3100;
  objc_copyWeak(&v24, &location);
  id v23 = v12;
  id v17 = +[UIContextualAction contextualActionWithStyle:1 title:v16 handler:v22];

  id v26 = v17;
  CFStringRef v18 = +[NSArray arrayWithObjects:&v26 count:1];
  v19 = +[UISwipeActionsConfiguration configurationWithActions:v18];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_10:

LABEL_11:

  return v19;
}

- (void)_deleteFilePromise:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(iFBAFeedbackViewController *)self showAttachmentDeletionSpinner];
  id v8 = +[FBKData sharedInstance];
  double v9 = [v7 UUIDString];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004B2FC;
  v11[3] = &unk_1000F3F58;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 deleteFilePromiseWithUUID:v9 object:v7 completion:v11];
}

- (void)_confirmFilePromiseDeletionWithStub:(id)a3 deletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"DELETE_ATTACHMENT_ALERT_TITLE" value:&stru_1000F6658 table:@"CommonStrings"];
  id v10 = +[NSBundle mainBundle];
  CFStringRef v11 = [v10 localizedStringForKey:@"DELETE_ATTACHMENT_ALERT_MESSAGE" value:&stru_1000F6658 table:@"CommonStrings"];
  id v12 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];

  uint64_t v13 = +[NSBundle mainBundle];
  long long v14 = [v13 localizedStringForKey:@"Delete" value:&stru_1000F6658 table:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004B5D0;
  v21[3] = &unk_1000F3880;
  v21[4] = self;
  id v22 = v6;
  id v23 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = +[UIAlertAction actionWithTitle:v14 style:2 handler:v21];

  [v12 addAction:v17];
  CFStringRef v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:0];
  uint64_t v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:&stru_1000F3F78];

  [v12 addAction:v20];
  [(iFBAFeedbackViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)showAttachmentDeletionSpinner
{
  [(iFBAFeedbackViewController *)self setAttachmentsBeingDeletedCount:(char *)[(iFBAFeedbackViewController *)self attachmentsBeingDeletedCount] + 1];
  if ((id)[(iFBAFeedbackViewController *)self attachmentsBeingDeletedCount] == (id)1)
  {
    id v4 = +[NSBundle mainBundle];
    unsigned __int8 v3 = [v4 localizedStringForKey:@"DELETING_ATTACHMENT_STATUS_ELLIPSIS" value:&stru_1000F6658 table:FBKCommonStrings];
    [(iFBAFeedbackViewController *)self showSpinnerWithStatus:v3 userInteractionEnabled:1];
  }
}

- (void)hideAttachmentDeletionSpinner
{
  [(iFBAFeedbackViewController *)self setAttachmentsBeingDeletedCount:(char *)[(iFBAFeedbackViewController *)self attachmentsBeingDeletedCount] - 1];
  [(iFBAFeedbackViewController *)self attachmentsBeingDeletedCount];
  if (![(iFBAFeedbackViewController *)self attachmentsBeingDeletedCount])
  {
    [(iFBAFeedbackViewController *)self hideSpinner];
  }
}

- (void)showAttachmentDeletionErrorAlert
{
}

- (void)showAttachmentDeletionErrorAlertWithError:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:FBKSSeedPortalRequestDetails];
  id v15 = [v5 objectForKeyedSubscript:FBKSSeedPortalRequestDetailMessage];

  if (v15 && [v15 length])
  {
    uint64_t v6 = FBKCommonStrings;
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    uint64_t v6 = FBKCommonStrings;
    uint64_t v8 = [v7 localizedStringForKey:@"UNEXPECTED_SERVER_DATA_ERROR_RECOVERY" value:&stru_1000F6658 table:FBKCommonStrings];

    id v15 = (id)v8;
  }
  double v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"ATTACHMENT_DELETION_ERROR_ALERT_TITLE" value:&stru_1000F6658 table:v6];
  CFStringRef v11 = +[UIAlertController alertControllerWithTitle:v10 message:v15 preferredStyle:1];

  id v12 = +[NSBundle mainBundle];
  uint64_t v13 = [v12 localizedStringForKey:@"OK" value:&stru_1000F6658 table:v6];
  long long v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:0];

  [v11 addAction:v14];
  [(iFBAFeedbackViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)teamPicker:(id)a3 didSelectTeam:(id)a4
{
}

- (void)promoteIndividualFeedbackToTeam:(id)a3
{
  id v4 = a3;
  id v5 = [(iFBAFeedbackViewController *)self contentItem];
  uint64_t v6 = [v5 singleTeam];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = +[FBALog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NO OP: Target team for move is the current team.", buf, 2u);
    }
  }
  else
  {
    double v9 = +[NSBundle mainBundle];
    uint64_t v10 = FBKCommonStrings;
    CFStringRef v11 = [v9 localizedStringForKey:@"PROMOTE_FEEDBACK_ASSIGN_WARNING_SINGLE_TEAM" value:&stru_1000F6658 table:FBKCommonStrings];
    id v12 = [v4 name];
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, 0);
    uint64_t v8 = +[UIAlertController alertControllerWithTitle:0 message:v13 preferredStyle:[(iFBAFeedbackViewController *)self objc_preferredAlertStyle]];

    if ([v8 preferredStyle] == (id)1)
    {
      long long v14 = +[NSBundle mainBundle];
      id v15 = [v14 localizedStringForKey:@"PROMOTE_FEEDBACK_TITLE_SINGLE_TEAM" value:&stru_1000F6658 table:v10];
      id v16 = [(iFBAFeedbackViewController *)self contentItem];
      id v17 = [v16 feedbackIDString];
      CFStringRef v18 = [v4 name];
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v17, v18, 0);
      [v8 setTitle:v19];
    }
    uint64_t v20 = +[NSBundle mainBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"PROMOTE_FEEDBACK" value:&stru_1000F6658 table:v10];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004BDCC;
    v30[3] = &unk_1000F2818;
    v30[4] = self;
    id v31 = v4;
    id v22 = +[UIAlertAction actionWithTitle:v21 style:2 handler:v30];
    [v8 addAction:v22];

    id v23 = +[NSBundle mainBundle];
    id v24 = [v23 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:v10];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004C110;
    v29[3] = &unk_1000F2540;
    v29[4] = self;
    id v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:v29];
    [v8 addAction:v25];

    id v26 = self;
    id v27 = [(iFBAFeedbackViewController *)v26 presentedViewController];

    if (v27)
    {
      uint64_t v28 = [(iFBAFeedbackViewController *)v26 presentedViewController];

      id v26 = (iFBAFeedbackViewController *)v28;
    }
    [(iFBAFeedbackViewController *)v26 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)demoteIndividualFeedbackToOriginator
{
  unsigned __int8 v3 = +[NSBundle mainBundle];
  uint64_t v4 = FBKCommonStrings;
  id v5 = [v3 localizedStringForKey:@"DEMOTE_FEEDBACK_ASSIGN_WARNING" value:&stru_1000F6658 table:FBKCommonStrings];
  uint64_t v6 = [(iFBAFeedbackViewController *)self contentItem];
  unsigned int v7 = [v6 singleTeam];
  uint64_t v8 = [v7 name];
  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8, 0);
  uint64_t v10 = +[UIAlertController alertControllerWithTitle:0 message:v9 preferredStyle:[(iFBAFeedbackViewController *)self objc_preferredAlertStyle]];

  if ([v10 preferredStyle] == (id)1)
  {
    id v27 = +[NSBundle mainBundle];
    CFStringRef v11 = [v27 localizedStringForKey:@"DEMOTE_FEEDBACK_TITLE" value:&stru_1000F6658 table:v4];
    id v12 = [(iFBAFeedbackViewController *)self contentItem];
    uint64_t v13 = [v12 feedbackIDString];
    long long v14 = [(iFBAFeedbackViewController *)self contentItem];
    id v15 = [v14 singleTeam];
    id v16 = [v15 name];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v16, 0);
    [v10 setTitle:v17];
  }
  CFStringRef v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"DEMOTE_FEEDBACK" value:&stru_1000F6658 table:v4];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10004C4BC;
  v29[3] = &unk_1000F2540;
  v29[4] = self;
  uint64_t v20 = +[UIAlertAction actionWithTitle:v19 style:2 handler:v29];
  [v10 addAction:v20];

  uint64_t v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:v4];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004C800;
  v28[3] = &unk_1000F2540;
  v28[4] = self;
  id v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v28];
  [v10 addAction:v23];

  id v24 = self;
  id v25 = [(iFBAFeedbackViewController *)v24 presentedViewController];

  if (v25)
  {
    uint64_t v26 = [(iFBAFeedbackViewController *)v24 presentedViewController];

    id v24 = (iFBAFeedbackViewController *)v26;
  }
  [(iFBAFeedbackViewController *)v24 presentViewController:v10 animated:1 completion:0];
}

- (void)participantController:(id)a3 didSelectParticipant:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(iFBAFeedbackViewController *)self contentItem];
  unsigned int v7 = [v6 assignee];
  unsigned int v8 = [v7 isEqual:v5];

  if (v8)
  {
    double v9 = +[FBALog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(iFBAFeedbackViewController *)self contentItem];
      CFStringRef v11 = [v10 remoteID];
      *(_DWORD *)buf = 134217984;
      id v17 = [v11 unsignedIntegerValue];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tried to assign content item [%lu] to assignee.", buf, 0xCu);
    }
  }
  else
  {
    double v9 = +[FBKData sharedInstance];
    id v12 = [(iFBAFeedbackViewController *)self contentItem];
    id v15 = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:&v15 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004C9E0;
    v14[3] = &unk_1000F35A8;
    v14[4] = self;
    [v9 assignFeedback:v13 toParticipant:v5 completion:v14];
  }
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (void)setLaunchAction:(id)a3
{
}

- (NSDateFormatter)headerDateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 32, 1);
}

- (FBKFeedbackFollowup)pendingFollowup
{
  return (FBKFeedbackFollowup *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingFollowup:(id)a3
{
}

- (NSArray)modelCache
{
  return self->_modelCache;
}

- (void)setModelCache:(id)a3
{
}

- (NSMutableArray)observerTokens
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setObserverTokens:(id)a3
{
}

- (BOOL)fileDownloadInProgress
{
  return self->_fileDownloadInProgress;
}

- (void)setFileDownloadInProgress:(BOOL)a3
{
  self->_fileDownloadInProgress = a3;
}

- (NSMutableSet)observedUploadTasks
{
  return self->_observedUploadTasks;
}

- (void)setObservedUploadTasks:(id)a3
{
}

- (unint64_t)attachmentsBeingDeletedCount
{
  return self->_attachmentsBeingDeletedCount;
}

- (void)setAttachmentsBeingDeletedCount:(unint64_t)a3
{
  self->_attachmentsBeingDeletedCount = a3;
}

- (NSArray)_filePromiseSortDescriptors
{
  return self->__filePromiseSortDescriptors;
}

- (void)set_filePromiseSortDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__filePromiseSortDescriptors, 0);
  objc_storeStrong((id *)&self->_observedUploadTasks, 0);
  objc_storeStrong((id *)&self->_observerTokens, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_pendingFollowup, 0);
  objc_storeStrong((id *)&self->_headerDateFormatter, 0);
  objc_storeStrong((id *)&self->_launchAction, 0);

  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end