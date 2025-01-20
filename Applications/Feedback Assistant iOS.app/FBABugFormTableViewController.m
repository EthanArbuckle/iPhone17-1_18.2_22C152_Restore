@interface FBABugFormTableViewController
- (BOOL)_tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)allowKeyboardDismissalForSnapshot;
- (BOOL)attemptedSubmission;
- (BOOL)hasCandidateStubs;
- (BOOL)hasFileArea;
- (BOOL)hasLoadedFirstDraft;
- (BOOL)isCaptiveModeEnabled;
- (BOOL)isCaptiveModeEnabledForLaunchAction:(id)a3;
- (BOOL)isEstablishingBugSession;
- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6;
- (BOOL)isUpdatingTable;
- (BOOL)shouldDisplayChangeButton;
- (BOOL)shouldHideQuestions;
- (BOOL)shouldShowAttachments;
- (BOOL)shouldShowForm;
- (BOOL)shouldShowFormPicker;
- (BOOL)shouldShowTeamPicker;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)viewHasBecomeVisible;
- (FBABugFormDiffableDataSource)diffableDataSource;
- (FBABugFormTableViewController)initWithCoder:(id)a3;
- (FBKBugFormStub)pendingStub;
- (FBKDeviceDiagnosticsController)devicesController;
- (FBKDraftingController)draftingController;
- (FBKLaunchAction)launchAction;
- (FBKManagedFeedbackObject)pendingFeedbackObject;
- (FBKTeam)pendingTeam;
- (NSDictionary)pendingAttachments;
- (NSDictionary)pendingQandA;
- (NSMutableDictionary)cellHeights;
- (NSPredicate)candidateFormStubsPredicate;
- (NSSet)extensions;
- (NSString)teamPickerRowIdentifier;
- (NSString)topicPickerRowIdentifier;
- (UIBarButtonItem)cancelBarButtonItem;
- (UIBarButtonItem)submitBarButtonItem;
- (UIBarButtonItem)submitButton;
- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)addAttachmentCell;
- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)addAttachmentsController;
- (double)_separatorInset;
- (double)keyboardHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)alertControllerForDismissWithLaunchAction:(id)a3;
- (id)bugForm;
- (id)currentTeam;
- (id)didRefreshFormStubsNotificationObserver;
- (id)formResponse;
- (id)formStub;
- (id)itemFromDraft;
- (id)notificationObserver;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)questionGroupForSection:(int64_t)a3;
- (id)questionsForQuestionGroupInSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 withItemIdentifier:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (unint64_t)cachedCandidateStubsCount;
- (unsigned)whooshSoundID;
- (void)_changeToBugFormStub:(id)a3 force:(BOOL)a4;
- (void)_changeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5;
- (void)_handleLoadingError:(id)a3;
- (void)_hideDevices;
- (void)_reallyChangeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5;
- (void)_resizeAndScrollTableAfterTextChangeInTextView:(id)a3;
- (void)_showFormPickerWithSender:(id)a3;
- (void)_showInternalToolbarIfNeeded;
- (void)_showSpinnerWithStatus:(id)a3 userInteractionEnabled:(BOOL)a4;
- (void)_stopSpinner;
- (void)answerDidChangeForQuestion:(id)a3;
- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4;
- (void)attachmentsAlertDidSelectOption:(id)a3;
- (void)awakeFromNib;
- (void)beginPresubmissionCheck:(id)a3;
- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4;
- (void)bugFormPickerDidCancel:(id)a3;
- (void)checkLegalAndSubmit;
- (void)close;
- (void)closeDraftAndDelete:(BOOL)a3 withError:(id)a4 completion:(id)a5;
- (void)closeWithCompletion:(id)a3;
- (void)closeWithError:(id)a3 completion:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didAddDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4;
- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6;
- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5;
- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4;
- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5;
- (void)didPressChangeBugForm:(id)a3;
- (void)didTapAttachment:(id)a3 indexPath:(id)a4;
- (void)didTapDevice:(id)a3 indexPath:(id)a4;
- (void)dismiss:(id)a3;
- (void)draftingController:(id)a3 madeVisibilityUpdatesWithSnapshotDiff:(id)a4;
- (void)draftingControllerDidBeginLoading:(id)a3;
- (void)draftingControllerDidFinishLoading:(id)a3 withError:(id)a4;
- (void)editorDidDismissForQuestion:(id)a3;
- (void)fillInAnswers;
- (void)hideQuestions;
- (void)keyboardWasShown:(id)a3;
- (void)loadDraft:(id)a3;
- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4;
- (void)loadNewResponseForSurvey:(id)a3 forTeam:(id)a4;
- (void)postAttachFiles:(id)a3;
- (void)preAttachFiles:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)questionVisibilityDidUpdateForDraftingController:(id)a3;
- (void)registerApplicationNotifications;
- (void)registerForKeyboardNotifications;
- (void)saveFormForResigningActive:(id)a3;
- (void)setAddAttachmentCell:(id)a3;
- (void)setAddAttachmentsController:(id)a3;
- (void)setAllowKeyboardDismissalForSnapshot:(BOOL)a3;
- (void)setAttemptedSubmission:(BOOL)a3;
- (void)setCachedCandidateStubsCount:(unint64_t)a3;
- (void)setCancelBarButtonItem:(id)a3;
- (void)setCandidateFormStubsPredicate:(id)a3;
- (void)setCellHeights:(id)a3;
- (void)setDevicesController:(id)a3;
- (void)setDidRefreshFormStubsNotificationObserver:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDraftingController:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setHasLoadedFirstDraft:(BOOL)a3;
- (void)setIsEstablishingBugSession:(BOOL)a3;
- (void)setIsUpdatingTable:(BOOL)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setLaunchAction:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setPendingAttachments:(id)a3;
- (void)setPendingFeedbackObject:(id)a3;
- (void)setPendingQandA:(id)a3;
- (void)setPendingStub:(id)a3;
- (void)setPendingTeam:(id)a3;
- (void)setShouldHideQuestions:(BOOL)a3;
- (void)setSubmitBarButtonItem:(id)a3;
- (void)setSubmitButton:(id)a3;
- (void)setViewHasBecomeVisible:(BOOL)a3;
- (void)setWhooshSoundID:(unsigned int)a3;
- (void)showQuestions;
- (void)showSpinnerWithStatus:(id)a3;
- (void)submit;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)teamPicker:(id)a3 didSelectTeam:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)unregisterApplicationNotifications;
- (void)unregisterForKeyboardNotifications;
- (void)updateCachedCandidateStubsCount;
- (void)updateSubmitButtonState;
- (void)updateTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FBABugFormTableViewController

- (FBABugFormTableViewController)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBABugFormTableViewController;
  v3 = [(FBABugFormTableViewController *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_shouldHideQuestions = 0;
    v3->_attemptedSubmission = 0;
    v5 = (FBKDraftingController *)objc_alloc_init((Class)FBKDraftingController);
    draftingController = v4->_draftingController;
    v4->_draftingController = v5;

    [(FBKDraftingController *)v4->_draftingController setDelegate:v4];
    v4->_isUpdatingTable = 0;
    v4->_allowKeyboardDismissalForSnapshot = 0;
  }
  return v4;
}

- (void)awakeFromNib
{
  v7.receiver = self;
  v7.super_class = (Class)FBABugFormTableViewController;
  [(FBABugFormTableViewController *)&v7 awakeFromNib];
  v3 = [(FBABugFormTableViewController *)self splitViewController];

  if (v3)
  {
    v4 = [(FBABugFormTableViewController *)self splitViewController];
    [v4 setPreferredDisplayMode:2];
  }
  v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    -[FBABugFormTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 414.0, 600.0);
  }
}

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)FBABugFormTableViewController;
  [(FBABugFormTableViewController *)&v43 viewDidLoad];
  v3 = [(FBABugFormTableViewController *)self submitButton];
  [v3 setEnabled:0];

  v4 = [(FBABugFormTableViewController *)self navigationItem];
  v5 = [v4 leftBarButtonItem];
  [v5 setEnabled:0];

  [(FBABugFormTableViewController *)self updateTitle];
  id v6 = objc_alloc((Class)UIBarButtonItem);
  objc_super v7 = +[NSBundle mainBundle];
  objc_super v8 = [v7 localizedStringForKey:@"Back" value:&stru_1000F6658 table:0];
  id v9 = [v6 initWithTitle:v8 style:0 target:0 action:0];
  v10 = [(FBABugFormTableViewController *)self navigationItem];
  [v10 setBackBarButtonItem:v9];

  v11 = [(FBABugFormTableViewController *)self tableView];
  [v11 setRowHeight:UITableViewAutomaticDimension];

  v12 = [(FBABugFormTableViewController *)self tableView];
  [v12 setEstimatedRowHeight:80.0];

  v13 = [(FBABugFormTableViewController *)self tableView];
  [v13 setEstimatedSectionFooterHeight:0.0];

  v14 = [(FBABugFormTableViewController *)self tableView];
  [v14 setSectionFooterHeight:UITableViewAutomaticDimension];

  v15 = [(FBABugFormTableViewController *)self addAttachmentsController];
  v16 = [(FBABugFormTableViewController *)self tableView];
  [v16 setDropDelegate:v15];

  v17 = +[FBADeviceDisplayCell reuseIdentifier];
  v18 = +[NSBundle mainBundle];
  v19 = +[UINib nibWithNibName:v17 bundle:v18];

  v20 = [(FBABugFormTableViewController *)self tableView];
  [v20 registerNib:v19 forCellReuseIdentifier:v17];

  v21 = +[FBKAttachmentCell reuseIdentifier];

  v22 = +[NSBundle mainBundle];
  v23 = +[UINib nibWithNibName:v21 bundle:v22];

  v24 = [(FBABugFormTableViewController *)self tableView];
  [v24 registerNib:v23 forCellReuseIdentifier:v21];

  v25 = [(FBABugFormTableViewController *)self tableView];
  [v25 registerClass:objc_opt_class() forCellReuseIdentifier:@"AddAttachmentsItem"];

  objc_initWeak(&location, self);
  v26 = [FBABugFormDiffableDataSource alloc];
  v27 = [(FBABugFormTableViewController *)self tableView];
  v37 = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472;
  v39 = sub_1000057DC;
  v40 = &unk_1000F2590;
  objc_copyWeak(&v41, &location);
  v28 = [(FBABugFormDiffableDataSource *)v26 initWithTableView:v27 cellProvider:&v37];
  -[FBABugFormTableViewController setDiffableDataSource:](self, "setDiffableDataSource:", v28, v37, v38, v39, v40);

  v29 = [(FBABugFormTableViewController *)self diffableDataSource];
  [v29 setThisViewController:self];

  v30 = [(FBABugFormTableViewController *)self tableView];
  [v30 setDelegate:self];

  MainBundle = CFBundleGetMainBundle();
  CFURLRef v32 = CFBundleCopyResourceURL(MainBundle, @"whoosh", @"caf", 0);
  CFURLRef v33 = v32;
  if (v32)
  {
    if (AudioServicesCreateSystemSoundID(v32, &self->_whooshSoundID)) {
      self->_whooshSoundID = 0;
    }
    CFRelease(v33);
  }
  v34 = [(FBABugFormTableViewController *)self navigationController];
  v35 = [v34 presentationController];
  [v35 setDelegate:self];

  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  [(FBABugFormTableViewController *)self setCellHeights:v36];

  [(FBABugFormTableViewController *)self registerApplicationNotifications];
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FBABugFormTableViewController;
  [(FBABugFormTableViewController *)&v18 viewDidAppear:a3];
  [(FBABugFormTableViewController *)self registerForKeyboardNotifications];
  [(FBABugFormTableViewController *)self setViewHasBecomeVisible:1];
  v4 = [(FBABugFormTableViewController *)self pendingFeedbackObject];

  if (v4)
  {
    v5 = [(FBABugFormTableViewController *)self draftingController];
    id v6 = [(FBABugFormTableViewController *)self pendingFeedbackObject];
    objc_super v7 = [(FBABugFormTableViewController *)self pendingTeam];
    [v5 loadResponseForFeedbackObject:v6 withTeam:v7];

    [(FBABugFormTableViewController *)self setPendingFeedbackObject:0];
    [(FBABugFormTableViewController *)self setPendingTeam:0];
  }
  objc_initWeak(&location, self);
  objc_super v8 = +[NSNotificationCenter defaultCenter];
  id v9 = +[NSOperationQueue mainQueue];
  uint64_t v10 = FBKDEDHelperNeedsDevicePairing;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100005A64;
  v15 = &unk_1000F2660;
  objc_copyWeak(&v16, &location);
  v11 = [v8 addObserverForName:v10 object:0 queue:v9 usingBlock:&v12];
  -[FBABugFormTableViewController setNotificationObserver:](self, "setNotificationObserver:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBABugFormTableViewController;
  [(FBABugFormTableViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FBABugFormTableViewController;
  [(FBABugFormTableViewController *)&v7 viewDidDisappear:a3];
  [(FBABugFormTableViewController *)self unregisterForKeyboardNotifications];
  v4 = +[NSNotificationCenter defaultCenter];
  v5 = [(FBABugFormTableViewController *)self notificationObserver];
  [v4 removeObserver:v5];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:FBKDeviceListDidChangeNotification object:0];
}

- (void)updateTitle
{
  objc_super v3 = [(FBABugFormTableViewController *)self formStub];
  id v8 = [v3 name];

  if (!v8 || ![v8 length])
  {
    v4 = [(FBABugFormTableViewController *)self formResponse];
    v5 = [v4 bugForm];
    uint64_t v6 = [v5 name];

    id v8 = (id)v6;
  }
  objc_super v7 = [(FBABugFormTableViewController *)self navigationItem];
  [v7 setTitle:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FBABugFormTableViewController;
  [(FBABugFormTableViewController *)&v7 viewWillAppear:a3];
  v4 = [(FBABugFormTableViewController *)self tableView];
  v5 = [(FBABugFormTableViewController *)self tableView];
  uint64_t v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:0];
}

- (void)_hideDevices
{
  id v2 = +[FBKDeviceManager sharedInstance];
  [v2 setHidesNotConfiguredDevices:1];
}

- (BOOL)hasCandidateStubs
{
  return [(FBABugFormTableViewController *)self cachedCandidateStubsCount] > 1;
}

- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FBALog appHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 debugDescription];
    uint64_t v10 = [v7 description];
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loading new response with Form [%{public}@], team [%{public}@] ", (uint8_t *)&v12, 0x16u);
  }
  if ([(FBABugFormTableViewController *)self viewHasBecomeVisible])
  {
    v11 = [(FBABugFormTableViewController *)self draftingController];
    [v11 loadNewResponseForBugFormStub:v6 withTeam:v7];
  }
  else
  {
    [(FBABugFormTableViewController *)self setPendingFeedbackObject:v6];
    [(FBABugFormTableViewController *)self setPendingTeam:v7];
  }
}

- (void)loadNewResponseForSurvey:(id)a3 forTeam:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(FBABugFormTableViewController *)self viewHasBecomeVisible])
  {
    id v7 = [(FBABugFormTableViewController *)self draftingController];
    [v7 loadNewResponseForBugForm:v8 withTeam:v6];

    id v6 = v7;
  }
  else
  {
    [(FBABugFormTableViewController *)self setPendingFeedbackObject:v8];
    [(FBABugFormTableViewController *)self setPendingTeam:v6];
  }
}

- (void)loadDraft:(id)a3
{
  id v5 = a3;
  if ([(FBABugFormTableViewController *)self viewHasBecomeVisible])
  {
    v4 = [(FBABugFormTableViewController *)self draftingController];
    [v4 loadFormResponseFromContentItem:v5];
  }
  else
  {
    [(FBABugFormTableViewController *)self setPendingFeedbackObject:v5];
  }
}

- (void)preAttachFiles:(id)a3
{
  id v4 = +[FBKLaunchAction validateURLSchemeFilePathsDictionary:a3];
  [(FBABugFormTableViewController *)self setPendingAttachments:v4];
}

- (void)postAttachFiles:(id)a3
{
  id v4 = a3;
  id v6 = [(FBABugFormTableViewController *)self devicesController];
  id v5 = +[FBKLaunchAction validateURLSchemeFilePathsDictionary:v4];

  [v6 postLaunchAttachLocalFiles:v5];
}

- (void)setLaunchAction:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_launchAction, a3);
  id v5 = [v12 attachments];

  if (v5)
  {
    id v6 = [v12 attachments];
    id v7 = [v6 copy];
    [(FBABugFormTableViewController *)self preAttachFiles:v7];
  }
  id v8 = [v12 questionAnswerPairs];

  if (v8)
  {
    id v9 = [v12 questionAnswerPairs];
    [(FBABugFormTableViewController *)self setPendingQandA:v9];
  }
  uint64_t v10 = [v12 extensions];

  if (v10)
  {
    v11 = [v12 extensions];
    [(FBABugFormTableViewController *)self setExtensions:v11];
  }
}

- (void)close
{
}

- (void)closeWithCompletion:(id)a3
{
}

- (void)closeDraftAndDelete:(BOOL)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(FBABugFormTableViewController *)self formResponse];
  v11 = [v10 ID];
  unsigned int v12 = [v11 intValue];

  uint64_t v13 = +[NSBundle mainBundle];
  uint64_t v14 = FBKCommonStrings;
  v15 = [v13 localizedStringForKey:@"CLOSING_FEEDBACK_EDITOR" value:&stru_1000F6658 table:FBKCommonStrings];
  [(FBABugFormTableViewController *)self showSpinnerWithStatus:v15];

  id v16 = [(FBABugFormTableViewController *)self navigationItem];
  v17 = [v16 rightBarButtonItem];
  [v17 setEnabled:0];

  objc_super v18 = [(FBABugFormTableViewController *)self navigationItem];
  v19 = [v18 leftBarButtonItem];
  [v19 setEnabled:0];

  [(FBABugFormTableViewController *)self setModalInPresentation:1];
  objc_initWeak(&location, self);
  uint64_t v38 = _NSConcreteStackBlock;
  uint64_t v39 = 3221225472;
  v40 = sub_100006AA8;
  id v41 = &unk_1000F26B0;
  unsigned int v44 = v12;
  objc_copyWeak(&v43, &location);
  id v20 = v9;
  id v42 = v20;
  v21 = objc_retainBlock(&v38);
  if (a3)
  {
    v22 = +[FBALog appHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], deleting", buf, 8u);
    }

    v23 = +[NSBundle mainBundle];
    v24 = [v23 localizedStringForKey:@"DELETING_DRAFT" value:&stru_1000F6658 table:v14];
    [(FBABugFormTableViewController *)self showSpinnerWithStatus:v24];

    id v25 = objc_loadWeakRetained(&location);
    v26 = [v25 itemFromDraft];
    LODWORD(v23) = v26 == 0;

    if (v23)
    {
      id v36 = +[FBALog appHandle];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1000A3F74(v36);
      }

      ((void (*)(void ***, void))v21[2])(v21, 0);
    }
    else
    {
      v27 = +[FBKData sharedInstance];
      id v28 = objc_loadWeakRetained(&location);
      v29 = [v28 itemFromDraft];
      [v27 deleteDraftFromContentItem:v29 completion:v21];
    }
    v37 = +[FBALog appHandle];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "will delete all sessions for form response [%i]", buf, 8u);
    }

    v34 = [(FBABugFormTableViewController *)self devicesController];
    [v34 abortAllSessions];
LABEL_19:

    goto LABEL_20;
  }
  if (!v8)
  {
    v31 = +[FBALog appHandle];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], saving", buf, 8u);
    }

    CFURLRef v32 = +[NSBundle mainBundle];
    CFURLRef v33 = [v32 localizedStringForKey:@"SAVING_DRAFT" value:&stru_1000F6658 table:v14];
    [(FBABugFormTableViewController *)self showSpinnerWithStatus:v33];

    v34 = +[FBKData sharedInstance];
    v35 = [(FBABugFormTableViewController *)self formResponse];
    [v34 saveFormResponse:v35 completion:v21];

    goto LABEL_19;
  }
  v30 = +[FBALog appHandle];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v47 = v12;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d] after error, not saving", buf, 8u);
  }

  ((void (*)(void ***, void))v21[2])(v21, 0);
LABEL_20:

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBABugFormTableViewController *)self draftingController];
  -[FBABugFormTableViewController closeDraftAndDelete:withError:completion:](self, "closeDraftAndDelete:withError:completion:", [v8 isDirty] ^ 1, v7, v6);
}

- (id)itemFromDraft
{
  id v2 = [(FBABugFormTableViewController *)self draftingController];
  objc_super v3 = [v2 formResponse];
  id v4 = [v3 contentItem];

  return v4;
}

- (id)formStub
{
  id v2 = [(FBABugFormTableViewController *)self draftingController];
  objc_super v3 = [v2 formStub];

  return v3;
}

- (id)formResponse
{
  id v2 = [(FBABugFormTableViewController *)self draftingController];
  objc_super v3 = [v2 formResponse];

  return v3;
}

- (id)bugForm
{
  id v2 = [(FBABugFormTableViewController *)self formResponse];
  objc_super v3 = [v2 bugForm];

  return v3;
}

- (void)draftingControllerDidBeginLoading:(id)a3
{
  [(FBABugFormTableViewController *)self updateTitle];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"LOADING_DRAFT" value:&stru_1000F6658 table:FBKCommonStrings];
  [(FBABugFormTableViewController *)self showSpinnerWithStatus:v5];

  [(FBABugFormTableViewController *)self setModalInPresentation:1];

  [(FBABugFormTableViewController *)self updateUI:1];
}

- (void)draftingControllerDidFinishLoading:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = +[FBALog appHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(FBABugFormTableViewController *)self formResponse];
    id v8 = [v7 ID];
    *(_DWORD *)buf = 67109120;
    unsigned int v30 = [v8 intValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "finished loading draft for form response [%i]", buf, 8u);
  }
  [(FBABugFormTableViewController *)self setHasLoadedFirstDraft:1];
  [(FBABugFormTableViewController *)self setModalInPresentation:[(FBABugFormTableViewController *)self isCaptiveModeEnabled]];
  [(FBABugFormTableViewController *)self updateUI:0];
  if (v5)
  {
    id v9 = +[FBALog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000A4028(v5);
    }

    [(FBABugFormTableViewController *)self _handleLoadingError:v5];
  }
  else
  {
    uint64_t v10 = [(FBABugFormTableViewController *)self pendingQandA];

    if (v10)
    {
      v11 = +[FBALog currentURLActionActivity];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000072E4;
      block[3] = &unk_1000F2518;
      block[4] = self;
      os_activity_apply(v11, block);
    }
    unsigned int v12 = [(FBABugFormTableViewController *)self bugForm];
    unsigned int v13 = [v12 collectsFiles];

    if (v13)
    {
      id v14 = objc_alloc((Class)FBKDeviceDiagnosticsController);
      v15 = +[FBKDeviceManager sharedInstance];
      id v16 = [(FBABugFormTableViewController *)self formResponse];
      v17 = [(FBABugFormTableViewController *)self pendingAttachments];
      objc_super v18 = [(FBABugFormTableViewController *)self extensions];
      v19 = [(FBABugFormTableViewController *)self formResponse];
      id v20 = [v19 draftDevices];
      id v21 = [v14 initWithDeviceManager:v15 delegate:self filerForm:v16 pendingFileUrls:v17 pendingURLExtensions:v18 draftDeviceIds:v20];
      [(FBABugFormTableViewController *)self setDevicesController:v21];

      [(FBABugFormTableViewController *)self setExtensions:0];
    }
    else
    {
      v22 = +[FBALog appHandle];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = [(FBABugFormTableViewController *)self bugForm];
        v24 = [v23 ID];
        unsigned int v25 = [v24 intValue];
        *(_DWORD *)buf = 67109120;
        unsigned int v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "bug form [%i] does not collect files", buf, 8u);
      }
      [(FBABugFormTableViewController *)self setDevicesController:0];
      [(FBABugFormTableViewController *)self _stopSpinner];
    }
    [(FBABugFormTableViewController *)self updateTitle];
    v26 = [(FBABugFormTableViewController *)self navigationItem];
    v27 = [v26 leftBarButtonItem];
    [v27 setEnabled:1];

    [(FBABugFormTableViewController *)self setAttemptedSubmission:0];
    [(FBABugFormTableViewController *)self updateSubmitButtonState];
    [(FBABugFormTableViewController *)self showQuestions];
    [(FBABugFormTableViewController *)self updateCachedCandidateStubsCount];
  }
}

- (void)_handleLoadingError:(id)a3
{
  id v4 = a3;
  id v5 = [(FBABugFormTableViewController *)self navigationItem];
  id v6 = [v5 leftBarButtonItem];
  [v6 setEnabled:1];

  [(FBABugFormTableViewController *)self _stopSpinner];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"GENERIC_DRAFT_LOAD_ERROR_TITLE" value:&stru_1000F6658 table:0];
  id v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"GENERIC_DRAFT_LOAD_ERROR_MESSAGE" value:&stru_1000F6658 table:0];
  v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  unsigned int v12 = +[NSBundle mainBundle];
  unsigned int v13 = [v12 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000756C;
  v16[3] = &unk_1000F2540;
  v16[4] = self;
  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v16];
  [v11 addAction:v14];

  [(FBABugFormTableViewController *)self presentViewController:v11 animated:1 completion:0];
  v15 = +[FBALog appHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000A40B8(v4);
  }
}

- (void)questionVisibilityDidUpdateForDraftingController:(id)a3
{
}

- (void)draftingController:(id)a3 madeVisibilityUpdatesWithSnapshotDiff:(id)a4
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", objc_msgSend(a4, "containsAnyAdditionsOrRemovals", a3));
  id v5 = [(FBABugFormTableViewController *)self devicesController];
  [v5 reevaluateMatcherPredicates];
}

- (id)questionGroupForSection:(int64_t)a3
{
  id v5 = [(FBABugFormTableViewController *)self diffableDataSource];
  id v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifiers];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  id v9 = [(FBABugFormTableViewController *)self draftingController];
  uint64_t v10 = [v9 questionGroupForSectionIdentifier:v8];

  return v10;
}

- (id)questionsForQuestionGroupInSection:(int64_t)a3
{
  id v5 = [(FBABugFormTableViewController *)self diffableDataSource];
  id v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifiers];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  id v9 = [(FBABugFormTableViewController *)self draftingController];
  uint64_t v10 = [v9 questionsForSectionIdentifier:v8];

  return v10;
}

- (double)_separatorInset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007814;
  block[3] = &unk_1000F2518;
  block[4] = self;
  if (qword_100123F90 != -1) {
    dispatch_once(&qword_100123F90, block);
  }
  return *(double *)&qword_100123F98;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 withItemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(FBABugFormTableViewController *)self diffableDataSource];
  unsigned int v12 = [v11 snapshot];
  unsigned int v13 = [v12 sectionIdentifierForSectionContainingItemIdentifier:v10];

  if (!v13)
  {
    +[NSException raise:@"FBA UI Exception" format:@"Section Identifier is nil, cannot proceed"];
    v15 = 0;
    goto LABEL_68;
  }
  if ([v13 isEqualToString:@"TeamPicker"])
  {
    id v14 = [(FBABugFormTableViewController *)self teamPickerRowIdentifier];
    v15 = [v8 dequeueReusableCellWithIdentifier:v14];

    if (!v15)
    {
      id v16 = [FBADiffableTableViewCell alloc];
      v17 = [(FBABugFormTableViewController *)self teamPickerRowIdentifier];
      v15 = [(FBADiffableTableViewCell *)v16 initWithStyle:3 reuseIdentifier:v17];
    }
    objc_super v18 = [(FBABugFormTableViewController *)self formStub];
    v19 = [v18 teamsMatchingFormID];

    id v20 = [(FBABugFormTableViewController *)self currentTeam];
    -[FBADiffableTableViewCell configureForTeam:disclosesMoreTeams:](v15, "configureForTeam:disclosesMoreTeams:", v20, (unint64_t)[v19 count] > 1);

    goto LABEL_68;
  }
  if ([v13 isEqualToString:@"FormPicker"])
  {
    id v21 = +[FBATopicCell reuseIdentifier];
    v15 = [v8 dequeueReusableCellWithIdentifier:v21 forIndexPath:v9];

    v22 = [(FBABugFormTableViewController *)self formStub];
    [(FBADiffableTableViewCell *)v15 setFormStub:v22];

    [(FBADiffableTableViewCell *)v15 setDisclosesMoreForms:[(FBABugFormTableViewController *)self cachedCandidateStubsCount] > 1];
    goto LABEL_68;
  }
  if ([v13 isEqualToString:@"DeviceAttachmentsSectionType"])
  {
    v23 = [(FBABugFormTableViewController *)self devicesController];
    v24 = [v23 maybeAttachmentWithIdentifier:v10];

    unsigned int v25 = [(FBABugFormTableViewController *)self devicesController];
    v26 = [v25 maybeDeviceWithIdentifier:v10];

    if (v26)
    {
      v27 = +[FBADeviceDisplayCell reuseIdentifier];
      v15 = [v8 dequeueReusableCellWithIdentifier:v27 forIndexPath:v9];

      [(FBADiffableTableViewCell *)v15 updateWithDevice:v26];
      [(FBABugFormTableViewController *)self _separatorInset];
      -[FBADiffableTableViewCell objc_updateWithSeparatorSpacing:](v15, "objc_updateWithSeparatorSpacing:");
LABEL_18:

LABEL_67:
      goto LABEL_68;
    }
    if (v24)
    {
      unsigned int v30 = +[FBKAttachmentCell reuseIdentifier];
      v15 = [v8 dequeueReusableCellWithIdentifier:v30 forIndexPath:v9];

      [(FBADiffableTableViewCell *)v15 setShowsIcon:0];
      [(FBADiffableTableViewCell *)v15 setAttachment:v24];
      [(FBABugFormTableViewController *)self _separatorInset];
      -[FBADiffableTableViewCell objc_updateWithSeparatorSpacing:](v15, "objc_updateWithSeparatorSpacing:");
      [(FBABugFormTableViewController *)self _separatorInset];
      -[FBADiffableTableViewCell updateSuperviewToAttachmentLabelSpacing:](v15, "updateSuperviewToAttachmentLabelSpacing:");
      goto LABEL_18;
    }
    +[NSException raise:@"FBA UI Exception" format:@"Received unexpected diffable object"];
LABEL_20:
    v31 = [(FBABugFormTableViewController *)self draftingController];
    v24 = [v31 visibleQuestionForSectionIdentifier:v13 itemIdentifier:v10];

    CFURLRef v32 = [(FBABugFormTableViewController *)self formResponse];
    CFURLRef v33 = [v24 ID];
    v34 = [v32 answerForQuestionID:v33];

    id v35 = [v24 answerType];
    id v36 = [(FBABugFormTableViewController *)self tableView];
    v130 = v34;
    v131 = v24;
    if (v35 == (id)6)
    {
      v37 = +[FBAInformationCell reuseIdentifier];
      v15 = [v36 dequeueReusableCellWithIdentifier:v37 forIndexPath:v9];

      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v39 = +[FBAQuestionAnswerCell reuseIdentifier];
      v40 = [v36 dequeueReusableCellWithIdentifier:v39 forIndexPath:v9];

      uint64_t v38 = v40;
      [(FBADiffableTableViewCell *)v38 setQuestion:v24];
      [(FBADiffableTableViewCell *)v38 setAnswer:v34];
      [(FBADiffableTableViewCell *)v38 setBugFormEditorDelegate:self];
      [(FBADiffableTableViewCell *)v38 setSelectionStyle:2];
      id v36 = [v24 text];
      id v41 = [(FBADiffableTableViewCell *)v38 questionLabel];
      [v41 setText:v36];

      if (FBKIsInternalInstall())
      {
        id v36 = +[NSUserDefaults standardUserDefaults];
        unsigned int v42 = [v36 BOOLForKey:FBKShowSortOrderForDebugging];

        if (v42)
        {
          v126 = [v24 text];
          [v24 sortOrder];
          v44 = id v43 = v38;
          v45 = [v44 stringValue];
          id v36 = +[NSString stringWithFormat:@"%@ (%@)", v126, v45];
          v46 = [(FBADiffableTableViewCell *)v43 questionLabel];
          [v46 setText:v36];

          uint64_t v38 = v43;
          v24 = v131;
        }
      }
      if (![(FBABugFormTableViewController *)self attemptedSubmission]) {
        goto LABEL_28;
      }
      id v36 = [(FBABugFormTableViewController *)self draftingController];
      unsigned int v47 = [v36 invalidQuestionIDs];
      [v24 ID];
      v49 = v48 = v38;
      unsigned int v50 = [v47 containsObject:v49];

      uint64_t v38 = v48;
      v24 = v131;

      if (v50)
      {
        v51 = v38;
        uint64_t v52 = 1;
      }
      else
      {
LABEL_28:
        v51 = v38;
        uint64_t v52 = 0;
      }
      [(FBADiffableTableViewCell *)v51 setShowError:v52];
      v15 = v38;
      v34 = v130;
    }
    switch((unint64_t)[v24 answerType])
    {
      case 0uLL:
      case 1uLL:
        v53 = v38;
        v127 = v15;
        uint64_t v54 = [v34 value];
        if (v54
          && (v55 = (void *)v54,
              v56 = v34,
              [v34 value],
              v57 = objc_claimAutoreleasedReturnValue(),
              id v58 = [v57 length],
              v57,
              v55,
              v58))
        {
          v59 = [v56 value];
          v60 = [(FBADiffableTableViewCell *)v53 answerTextView];
          [v60 setText:v59];

          v61 = +[UIColor labelColor];
          v62 = [(FBADiffableTableViewCell *)v53 answerTextView];
          [v62 setTextColor:v61];
          v34 = v56;
        }
        else
        {
          uint64_t v67 = [v131 placeholder];
          if (v67
            && (v68 = (void *)v67,
                [v131 placeholder],
                v69 = objc_claimAutoreleasedReturnValue(),
                id v70 = [v69 length],
                v69,
                v68,
                v70))
          {
            v71 = [v131 placeholder];
            v72 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
            v73 = [v71 stringByTrimmingCharactersInSet:v72];
            v74 = [(FBADiffableTableViewCell *)v53 answerTextView];
            [v74 setText:v73];
          }
          else
          {
            v71 = +[NSBundle mainBundle];
            v72 = [v71 localizedStringForKey:@"TEXT_ANSWER_PLACEHOLDER" value:&stru_1000F6658 table:0];
            v73 = [(FBADiffableTableViewCell *)v53 answerTextView];
            [v73 setText:v72];
          }

          v61 = +[UIColor secondaryLabelColor];
          v62 = [(FBADiffableTableViewCell *)v53 answerTextView];
          [v62 setTextColor:v61];
          v34 = v130;
        }

        v101 = [(FBADiffableTableViewCell *)v53 answerTextView];
        [v101 setDelegate:self];

        v102 = [(FBADiffableTableViewCell *)v53 answerTextView];
        v103 = [v102 text];
        v104 = [(FBADiffableTableViewCell *)v53 answerTextView];
        [v104 setAccessibilityIdentifier:v103];

        [(FBADiffableTableViewCell *)v53 hideAccessoryView];
        v15 = v127;
        uint64_t v38 = v53;
        goto LABEL_60;
      case 2uLL:
      case 3uLL:
        v128 = v15;
        v63 = [v24 displayTextForAnswer:v34];
        if (v63)
        {
          v64 = [(FBADiffableTableViewCell *)v38 answerTextView];
          [v64 setText:v63];

          v65 = +[UIColor labelColor];
          v66 = [(FBADiffableTableViewCell *)v38 answerTextView];
          [v66 setTextColor:v65];
        }
        else
        {
          v96 = v24;
          v97 = v38;
          v98 = [v96 allChoices];
          v99 = +[NSPredicate predicateWithFormat:@"isPrompt = YES"];
          v65 = [v98 filteredArrayUsingPredicate:v99];

          if ([v65 count])
          {
            v100 = [v65 firstObject];
            [v100 title];
          }
          else
          {
            v100 = +[NSBundle mainBundle];
            [v100 localizedStringForKey:@"CHOICE_ANSWER_PLACEHOLDER" value:&stru_1000F6658 table:0];
          v107 = };
          v108 = [(FBADiffableTableViewCell *)v97 answerTextView];
          [v108 setText:v107];

          v109 = +[UIColor secondaryLabelColor];
          v110 = [(FBADiffableTableViewCell *)v97 answerTextView];
          [v110 setTextColor:v109];

          v66 = [(FBADiffableTableViewCell *)v97 answerTextView];
          [v66 setDelegate:0];
          uint64_t v38 = v97;
        }

        v111 = [(FBADiffableTableViewCell *)v38 answerTextView];
        [v111 text];
        v113 = v112 = v38;
        v114 = [(FBADiffableTableViewCell *)v112 answerTextView];
        [v114 setAccessibilityIdentifier:v113];

        uint64_t v38 = v112;
        [(FBADiffableTableViewCell *)v112 showAccessoryView];

        v15 = v128;
        v34 = v130;
LABEL_60:
        v24 = v131;
        break;
      case 4uLL:
        v123 = v38;
        v129 = v15;
        uint64_t v75 = [v34 values];
        v76 = v34;
        v124 = v13;
        id v125 = v9;
        if (v75
          && (id v36 = (void *)v75,
              [v34 values],
              v77 = objc_claimAutoreleasedReturnValue(),
              id v78 = [v77 count],
              v77,
              v36,
              v78))
        {
          id v132 = v8;
          v79 = [(FBABugFormTableViewController *)self formResponse];
          v80 = v24;
          v81 = [v24 ID];
          v82 = [v79 answerForQuestionID:v81];

          v83 = [v82 values];
          v84 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v83 count]);

          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          v122 = v82;
          v85 = [v82 values];
          id v86 = [v85 countByEnumeratingWithState:&v133 objects:v137 count:16];
          if (v86)
          {
            id v87 = v86;
            uint64_t v88 = *(void *)v134;
            do
            {
              for (i = 0; i != v87; i = (char *)i + 1)
              {
                if (*(void *)v134 != v88) {
                  objc_enumerationMutation(v85);
                }
                v90 = [v80 displayTextForAnswer:*(void *)(*((void *)&v133 + 1) + 8 * i)];
                v91 = +[NSString stringWithFormat:@"• %@", v90];
                [v84 addObject:v91];
              }
              id v87 = [v85 countByEnumeratingWithState:&v133 objects:v137 count:16];
            }
            while (v87);
          }

          v92 = [v84 componentsJoinedByString:@"\n"];
          uint64_t v38 = v123;
          v93 = [(FBADiffableTableViewCell *)v123 answerTextView];
          [v93 setText:v92];

          v94 = +[UIColor labelColor];
          v95 = [(FBADiffableTableViewCell *)v123 answerTextView];
          [v95 setTextColor:v94];

          v34 = v130;
          id v8 = v132;
          v24 = v80;
          v15 = v129;
        }
        else
        {
          v105 = [v24 placeholder];
          if (v105)
          {
            [v24 placeholder];
          }
          else
          {
            id v36 = +[NSBundle mainBundle];
            [v36 localizedStringForKey:@"CHOICE_ANSWER_PLACEHOLDER" value:&stru_1000F6658 table:0];
          v106 = };
          v34 = v76;
          v115 = [(FBADiffableTableViewCell *)v123 answerTextView];
          [v115 setText:v106];

          v15 = v129;
          if (!v105)
          {

            v106 = v36;
          }

          v116 = +[UIColor secondaryLabelColor];
          v117 = [(FBADiffableTableViewCell *)v123 answerTextView];
          [v117 setTextColor:v116];

          uint64_t v38 = v123;
          v24 = v131;
        }
        v118 = [(FBADiffableTableViewCell *)v38 answerTextView];
        v119 = [v118 text];
        v120 = [(FBADiffableTableViewCell *)v38 answerTextView];
        [v120 setAccessibilityIdentifier:v119];

        [(FBADiffableTableViewCell *)v38 showAccessoryView];
        unsigned int v13 = v124;
        id v9 = v125;
        break;
      case 6uLL:
        [(FBADiffableTableViewCell *)v15 setQuestion:v24];
        break;
      default:
        break;
    }
    [(FBADiffableTableViewCell *)v15 layoutIfNeeded];

    goto LABEL_67;
  }
  if (![v13 isEqualToString:@"AddAttachments"]) {
    goto LABEL_20;
  }
  v15 = [v8 dequeueReusableCellWithIdentifier:@"AddAttachmentsItem" forIndexPath:v9];
  if (+[FBAAddAttachmentsCell supportsMenu])
  {
    id v28 = [(FBABugFormTableViewController *)self addAttachmentsController];
    v29 = [v28 menuForController:self];
    [(FBADiffableTableViewCell *)v15 setMenu:v29];
  }
  [(FBABugFormTableViewController *)self setAddAttachmentCell:v15];
LABEL_68:

  return v15;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBABugFormTableViewController *)self cellHeights];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = UITableViewAutomaticDimension;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v12 = [(FBABugFormTableViewController *)self cellHeights];
  [v8 frame];
  double v10 = v9;

  v11 = +[NSNumber numberWithDouble:v10];
  [v12 setObject:v11 forKey:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBABugFormTableViewController *)self diffableDataSource];
  double v9 = [v8 itemIdentifierForIndexPath:v7];

  double v10 = [(FBABugFormTableViewController *)self diffableDataSource];
  v11 = [v10 snapshot];
  id v12 = [v11 sectionIdentifierForSectionContainingItemIdentifier:v9];

  unsigned int v13 = +[FBALog appHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v9;
    __int16 v50 = 2112;
    v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Did select item with identifier [%@] in section [%@]", buf, 0x16u);
  }

  if ([v12 isEqualToString:@"DeviceAttachmentsSectionType"])
  {
    id v14 = [(FBABugFormTableViewController *)self devicesController];
    v15 = [v14 maybeAttachmentWithIdentifier:v9];

    id v16 = [(FBABugFormTableViewController *)self devicesController];
    v17 = [v16 maybeDeviceWithIdentifier:v9];

    if (v17)
    {
      [(FBABugFormTableViewController *)self didTapDevice:v17 indexPath:v7];
    }
    else if (v15)
    {
      [(FBABugFormTableViewController *)self didTapAttachment:v15 indexPath:v7];
    }
    goto LABEL_27;
  }
  if ([v12 isEqualToString:@"AddAttachments"])
  {
    objc_super v18 = [(FBABugFormTableViewController *)self addAttachmentsController];
    v19 = [(FBABugFormTableViewController *)self addAttachmentCell];
    v15 = [v18 sheetForController:self selectedIndexPath:v7 sender:v19];

    [(FBABugFormTableViewController *)self presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    if (![v12 isEqualToString:@"FormPicker"])
    {
      unsigned int v20 = [v12 isEqualToString:@"TeamPicker"];
      v15 = [v6 cellForRowAtIndexPath:v7];
      if (v20)
      {
        id v21 = [(FBABugFormTableViewController *)self formStub];
        v22 = [v21 teamsMatchingFormID];
        id v23 = [v22 count];

        if ((unint64_t)v23 < 2) {
          goto LABEL_28;
        }
        v17 = +[UIStoryboard storyboardWithName:@"Teams" bundle:0];
        v24 = [v17 instantiateViewControllerWithIdentifier:@"FBATeamPickerController"];
        [v24 setPickerDelegate:self];
        [v24 setShowsDismissButton:1];
        unsigned int v25 = [(FBABugFormTableViewController *)self formStub];
        [v24 setFormStub:v25];

        v26 = [(FBABugFormTableViewController *)self currentTeam];
        [v24 setSelectedTeam:v26];

        id v27 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v24];
        [v27 setModalPresentationStyle:7];
        id v28 = [v27 popoverPresentationController];
        [v28 setSourceView:v15];

        [v15 bounds];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        v37 = [v27 popoverPresentationController];
        [v37 setSourceRect:v30, v32, v34, v36];

        uint64_t v38 = [v27 popoverPresentationController];
        [v38 setPermittedArrowDirections:1];

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100008EB4;
        v45[3] = &unk_1000F26D8;
        id v46 = v6;
        id v47 = v7;
        [(FBABugFormTableViewController *)self presentViewController:v27 animated:1 completion:v45];
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v40 = +[FBALog appHandle];
        v17 = v40;
        if ((isKindOfClass & 1) == 0)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            sub_1000A415C((uint64_t)v9, v17);
          }
          goto LABEL_27;
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v9;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Tapped on Q&A with identifier [%@]", buf, 0xCu);
        }

        if (([v15 hasKeyboardFocus] & 1) == 0)
        {
          id v41 = [(FBABugFormTableViewController *)self tableView];
          [v41 endEditing:1];
        }
        v17 = [v6 cellForRowAtIndexPath:v7];
        unsigned int v42 = [(FBABugFormTableViewController *)self draftingController];
        v24 = [v42 visibleQuestionForSectionIdentifier:v12 itemIdentifier:v9];

        id v43 = (char *)[v24 answerType];
        if ((unint64_t)(v43 - 2) >= 3)
        {
          if ((unint64_t)v43 < 2)
          {
            [v17 beginEditingQuestion];
            unsigned int v44 = [(FBABugFormTableViewController *)self tableView];
            [v44 deselectRowAtIndexPath:v7 animated:1];
          }
        }
        else
        {
          [(FBABugFormTableViewController *)self performSegueWithIdentifier:@"FBABugFormDetailPresentation" sender:v17];
        }
      }

LABEL_27:
      goto LABEL_28;
    }
    v15 = [v6 cellForRowAtIndexPath:v7];
    [(FBABugFormTableViewController *)self didPressChangeBugForm:v15];
  }
LABEL_28:
}

- (BOOL)_tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(FBABugFormTableViewController *)self diffableDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  id v8 = [(FBABugFormTableViewController *)self diffableDataSource];
  double v9 = [v8 snapshot];
  double v10 = [v9 sectionIdentifierForSectionContainingItemIdentifier:v7];

  if ([v10 isEqualToString:@"DeviceAttachmentsSectionType"])
  {
    v11 = [(FBABugFormTableViewController *)self devicesController];
    id v12 = [v11 maybeAttachmentWithIdentifier:v7];

    unsigned int v13 = [(FBABugFormTableViewController *)self devicesController];
    id v14 = v13;
    if (v12)
    {
      if ([v13 canCancelAttachmentCollection:v12])
      {
        unsigned __int8 v15 = 1;
LABEL_11:

        goto LABEL_12;
      }
      v17 = [(FBABugFormTableViewController *)self devicesController];
      unsigned __int8 v15 = [v17 canDeleteAttachment:v12];
    }
    else
    {
      uint64_t v16 = [v13 maybeDeviceWithIdentifier:v7];

      if (!v16)
      {
        unsigned __int8 v15 = 0;
        id v14 = 0;
        goto LABEL_11;
      }
      v17 = [(FBABugFormTableViewController *)self devicesController];
      unsigned __int8 v15 = [v17 canRemoveDevice:v16];
      id v14 = (void *)v16;
    }

    goto LABEL_11;
  }
  unsigned __int8 v15 = 0;
LABEL_12:

  return v15;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)answerDidChangeForQuestion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 shouldHaveChoices];
  id v6 = +[FBALog appHandle];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 role];
      double v9 = [(FBABugFormTableViewController *)self formResponse];
      double v10 = [v4 ID];
      v11 = [v9 answerForQuestionID:v10];
      id v12 = [v11 values];
      unsigned int v13 = [v12 componentsJoinedByString:@","];
      int v18 = 138412546;
      v19 = v8;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Q: [%@] A: [%@]", (uint8_t *)&v18, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_1000A41D4(v4, self, v7);
  }

  [(FBABugFormTableViewController *)self updateUI:0];
  id v14 = [(FBABugFormTableViewController *)self draftingController];
  [v14 validate:0];

  unsigned __int8 v15 = [(FBABugFormTableViewController *)self draftingController];
  [v15 didChangeAnswerToQuestion:v4];

  uint64_t v16 = [(FBABugFormTableViewController *)self draftingController];
  BOOL v17 = ([v16 isDirty] & 1) != 0
     || [(FBABugFormTableViewController *)self isCaptiveModeEnabled];
  [(FBABugFormTableViewController *)self setModalInPresentation:v17];

  [(FBABugFormTableViewController *)self updateSubmitButtonState];
}

- (void)editorDidDismissForQuestion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FBABugFormTableViewController *)self draftingController];
  [v5 identifierForVisibleQuestion:v4 hasAttemptedSubmission:[self attemptedSubmission]];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(FBABugFormTableViewController *)self diffableDataSource];
  id v7 = [v6 indexPathForItemIdentifier:v9];

  id v8 = [(FBABugFormTableViewController *)self tableView];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6
{
}

- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4
{
}

- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5
{
}

- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 0:
      id v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"STARTING_BUG_SESSIONS" value:&stru_1000F6658 table:FBKCommonStrings];
      [(FBABugFormTableViewController *)self _showSpinnerWithStatus:v9 userInteractionEnabled:1];

      break;
    case 1:
      goto LABEL_6;
    case 2:
      double v10 = +[FBALog appHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000A4300(v10);
      }

LABEL_6:
      [(FBABugFormTableViewController *)self _stopSpinner];
      break;
    case 3:
      uint64_t v11 = (uint64_t)[v6 filesBeingAttachedCount];
      id v12 = +[NSBundle mainBundle];
      unsigned int v13 = v12;
      if (v11 < 1)
      {
        unsigned __int8 v15 = [v12 localizedStringForKey:@"COPYING_FILES" value:@"Attaching files" table:0];
      }
      else
      {
        uint64_t v14 = [v12 localizedStringForKey:@"Attaching %d files" value:&stru_1000F6658 table:FBKPluralStrings];

        unsigned __int8 v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v11);
        unsigned int v13 = (void *)v14;
      }

      [(FBABugFormTableViewController *)self _showSpinnerWithStatus:v15 userInteractionEnabled:1];
      break;
    default:
      break;
  }
  [(FBABugFormTableViewController *)self updateSubmitButtonState];
}

- (BOOL)shouldDisplayChangeButton
{
  objc_super v3 = [(FBABugFormTableViewController *)self bugForm];
  id v4 = [v3 role];

  BOOL result = 0;
  if (v4 != (id)1)
  {
    uint64_t v5 = [(FBABugFormTableViewController *)self formResponse];
    if (v5)
    {
      id v6 = (void *)v5;
      unsigned __int8 v7 = [(FBABugFormTableViewController *)self hasCandidateStubs];

      if (v7) {
        return 1;
      }
    }
  }
  return result;
}

- (void)didPressChangeBugForm:(id)a3
{
  id v5 = a3;
  id v4 = [(FBABugFormTableViewController *)self view];
  [v4 endEditing:1];

  if ([(FBABugFormTableViewController *)self shouldDisplayChangeButton]) {
    [(FBABugFormTableViewController *)self _showFormPickerWithSender:v5];
  }
}

- (void)_changeToBugFormStub:(id)a3 force:(BOOL)a4
{
  id v9 = a3;
  id v5 = [(FBABugFormTableViewController *)self currentTeam];
  id v6 = [v5 teamFormStubMatchingFromFormStub:v9];

  if (!v6) {
    id v6 = v9;
  }
  unsigned __int8 v7 = [(FBABugFormTableViewController *)self currentTeam];
  id v8 = [v6 preferredTeamForStubPreferringTeam:v7];
  [(FBABugFormTableViewController *)self _changeToBugFormStub:v6 withTeam:v8 force:1];
}

- (void)_changeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5
{
}

- (void)_reallyChangeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  [(FBABugFormTableViewController *)self setPendingStub:0];
  if (a5) {
    goto LABEL_3;
  }
  double v10 = [(FBABugFormTableViewController *)self bugForm];
  uint64_t v11 = [v10 ID];
  id v12 = [v8 ID];
  unsigned __int8 v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {
LABEL_3:
    uint64_t v14 = [(FBABugFormTableViewController *)self formResponse];
    unsigned __int8 v15 = [v14 ID];
    unsigned int v16 = [v15 intValue];

    [(FBABugFormTableViewController *)self hideQuestions];
    BOOL v17 = +[FBALog appHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = [(FBABugFormTableViewController *)self bugForm];
      v19 = [v18 ID];
      unsigned int v20 = [v19 intValue];
      id v21 = [v8 ID];
      *(_DWORD *)buf = 67109376;
      unsigned int v49 = v20;
      __int16 v50 = 1024;
      unsigned int v51 = [v21 intValue];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Form Swap: changing from form [%i] to form [%i]", buf, 0xEu);
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100009C3C;
    v44[3] = &unk_1000F2728;
    v44[4] = self;
    unsigned int v47 = v16;
    id v45 = v8;
    id v46 = v9;
    v22 = objc_retainBlock(v44);
    id v23 = [(FBABugFormTableViewController *)self draftingController];
    unsigned int v24 = [v23 isDirty];

    if (v24)
    {
      unsigned int v25 = +[NSBundle mainBundle];
      uint64_t v38 = [v25 localizedStringForKey:@"PROMPT_DELETE_DRAFT" value:&stru_1000F6658 table:0];

      v26 = +[UIAlertController alertControllerWithTitle:v38 message:0 preferredStyle:1];
      +[NSBundle mainBundle];
      v27 = id v39 = v9;
      id v28 = [v27 localizedStringForKey:@"DELETE_DRAFT_CHOICE" value:&stru_1000F6658 table:0];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10000A150;
      v42[3] = &unk_1000F2750;
      v42[4] = self;
      double v29 = v22;
      id v43 = v29;
      double v30 = +[UIAlertAction actionWithTitle:v28 style:2 handler:v42];

      [v26 addAction:v30];
      double v31 = +[NSBundle mainBundle];
      double v32 = [v31 localizedStringForKey:@"SAVE_DRAFT_CHOICE" value:&stru_1000F6658 table:0];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10000A240;
      v40[3] = &unk_1000F2750;
      v40[4] = self;
      id v41 = v29;
      double v33 = +[UIAlertAction actionWithTitle:v32 style:0 handler:v40];

      id v9 = v39;
      [v26 addAction:v33];
      [(FBABugFormTableViewController *)self presentViewController:v26 animated:1 completion:0];
    }
    else
    {
      double v34 = +[FBALog appHandle];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        double v35 = [(FBABugFormTableViewController *)self formResponse];
        double v36 = [v35 ID];
        unsigned int v37 = [v36 intValue];
        *(_DWORD *)buf = 67109120;
        unsigned int v49 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "_changeToBugForm, deleting the unused FR %d", buf, 8u);
      }
      ((void (*)(void *, uint64_t))v22[2])(v22, 1);
    }
  }
}

- (void)_showFormPickerWithSender:(id)a3
{
  id v4 = a3;
  id v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing Form Picker from draft view", v13, 2u);
  }

  id v6 = [_TtC18Feedback_Assistant26FBABugFormPickerController alloc];
  unsigned __int8 v7 = [(FBABugFormTableViewController *)self candidateFormStubsPredicate];
  id v8 = [(FBABugFormPickerController *)v6 initWithStubsPredicate:v7];

  [(FBABugFormPickerController *)v8 setPickerDelegate:self];
  id v9 = [(FBABugFormTableViewController *)self formStub];
  [(FBABugFormPickerController *)v8 setCurrentSelection:v9];

  [(FBABugFormPickerController *)v8 setContext:1];
  double v10 = [(FBABugFormTableViewController *)self currentTeam];
  [(FBABugFormPickerController *)v8 setTeam:v10];

  id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [v11 setModalPresentationStyle:7];
  id v12 = [v11 popoverPresentationController];
  [v12 setPermittedArrowDirections:1];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 setBarButtonItem:v4];
    }
    else
    {
      [v12 setSourceView:v4];
      [v4 bounds];
      [v12 setSourceRect:];
    }
  }
  [(FBABugFormTableViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBABugFormTableViewController *)self presentedViewController];
  id v9 = [v6 navigationController];

  if (v8 == v9)
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000A620;
    v10[3] = &unk_1000F2778;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [(FBABugFormTableViewController *)self dismissViewControllerAnimated:1 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)bugFormPickerDidCancel:(id)a3
{
  id v4 = +[FBALog appHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000A4490(v4);
  }

  id v5 = [(FBABugFormTableViewController *)self tableView];
  id v6 = [(FBABugFormTableViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];
}

- (void)teamPicker:(id)a3 didSelectTeam:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A810;
  v9[3] = &unk_1000F2638;
  id v8 = v7;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [(FBABugFormTableViewController *)self dismissViewControllerAnimated:1 completion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)beginPresubmissionCheck:(id)a3
{
  [(FBABugFormTableViewController *)self setAttemptedSubmission:1];
  id v4 = [(FBABugFormTableViewController *)self draftingController];
  unsigned __int8 v5 = [v4 validate:0];

  [(FBABugFormTableViewController *)self updateUI:0];
  id v6 = [(FBABugFormTableViewController *)self submitButton];
  [v6 setEnabled:0];

  id v7 = [(FBABugFormTableViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:0];

  id v9 = [(FBABugFormTableViewController *)self devicesController];
  id v10 = [v9 unreachableDevicesInPlay];

  if ((v5 & 1) == 0)
  {
    [(FBABugFormTableViewController *)self updateSubmitButtonState];
    id v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"MISSING_ANSWERS_TITLE" value:&stru_1000F6658 table:0];
    id v23 = +[NSBundle mainBundle];
    unsigned int v24 = [v23 localizedStringForKey:@"MISSING_ANSWERS_MESSAGE" value:&stru_1000F6658 table:0];
    id v20 = +[UIAlertController alertControllerWithTitle:v22 message:v24 preferredStyle:1];

    unsigned int v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
    id v27 = v26;
    id v28 = 0;
LABEL_7:
    double v29 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, v28, v43, v44, v45, v46, v47);
    [v20 addAction:v29];

    [(FBABugFormTableViewController *)self presentViewController:v20 animated:1 completion:0];
    goto LABEL_8;
  }
  id v11 = [(FBABugFormTableViewController *)self bugForm];
  if (![v11 collectsFiles] || !objc_msgSend(v10, "count"))
  {

LABEL_10:
    double v30 = [(FBABugFormTableViewController *)self bugForm];
    if ([v30 collectsFiles])
    {
      double v31 = [(FBABugFormTableViewController *)self devicesController];
      unsigned int v32 = [v31 hasUnmetRequirementAttachments];

      if (v32)
      {
        double v33 = +[NSBundle mainBundle];
        double v34 = [v33 localizedStringForKey:@"MISSING_REQ_FILES" value:&stru_1000F6658 table:0];
        double v35 = +[NSBundle mainBundle];
        double v36 = [v35 localizedStringForKey:@"MISSING_REQ_FILES_MESSAGE" value:&stru_1000F6658 table:0];
        id v20 = +[UIAlertController alertControllerWithTitle:v34 message:v36 preferredStyle:1];

        unsigned int v37 = +[NSBundle mainBundle];
        uint64_t v38 = [v37 localizedStringForKey:@"GATHER_AND_SUBMIT" value:&stru_1000F6658 table:0];
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10000B988;
        v49[3] = &unk_1000F2540;
        v49[4] = self;
        id v39 = +[UIAlertAction actionWithTitle:v38 style:0 handler:v49];
        [v20 addAction:v39];

        v40 = +[NSBundle mainBundle];
        id v41 = [v40 localizedStringForKey:@"SUBMIT_WO_FILES" value:&stru_1000F6658 table:0];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10000BA80;
        v48[3] = &unk_1000F2540;
        v48[4] = self;
        unsigned int v42 = +[UIAlertAction actionWithTitle:v41 style:0 handler:v48];
        [v20 addAction:v42];

        unsigned int v25 = +[NSBundle mainBundle];
        v26 = [v25 localizedStringForKey:@"BACK_TO_DRAFT" value:&stru_1000F6658 table:0];
        id v43 = _NSConcreteStackBlock;
        uint64_t v44 = 3221225472;
        id v45 = sub_10000BBF8;
        id v46 = &unk_1000F2540;
        unsigned int v47 = self;
        id v28 = &v43;
        id v27 = v26;
        goto LABEL_7;
      }
    }
    else
    {
    }
    [(FBABugFormTableViewController *)self checkLegalAndSubmit];
    goto LABEL_15;
  }
  id v12 = [(FBABugFormTableViewController *)self formResponse];
  unsigned __int8 v13 = [v12 matcherPredicates];
  id v14 = [v13 count];

  if (!v14) {
    goto LABEL_10;
  }
  unsigned __int8 v15 = +[NSBundle mainBundle];
  unsigned int v16 = [v15 localizedStringForKey:@"NOT_REACHABLE_SUBMIT_MESSAGE_NO_DEVICE_NAME" value:&stru_1000F6658 table:0];
  BOOL v17 = +[NSString stringWithFormat:v16];

  os_activity_t v18 = _os_activity_create((void *)&_mh_execute_header, "Submission on non reachable device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AFA4;
  block[3] = &unk_1000F27C8;
  id v51 = v10;
  uint64_t v52 = self;
  id v53 = v17;
  os_activity_t v54 = v18;
  v19 = v18;
  id v20 = v17;
  os_activity_apply(v19, block);

LABEL_8:
LABEL_15:
}

- (void)checkLegalAndSubmit
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:FBKSuppressPrivacyNoticePreferencesKey];

  if (v4)
  {
    [(FBABugFormTableViewController *)self submit];
  }
  else
  {
    unsigned __int8 v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"SUBMISSION_PII_TITLE" value:&stru_1000F6658 table:0];
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"SUBMISSION_PII_MESSAGE" value:&stru_1000F6658 table:0];
    id v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000BFCC;
    v17[3] = &unk_1000F2540;
    v17[4] = self;
    id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v17];
    [v9 addAction:v12];

    unsigned __int8 v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"SUBMIT_BUTTON" value:&stru_1000F6658 table:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C02C;
    v16[3] = &unk_1000F2540;
    v16[4] = self;
    unsigned __int8 v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v16];
    [v9 addAction:v15];

    [(FBABugFormTableViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (void)submit
{
  objc_super v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v4 = [(FBABugFormTableViewController *)self formResponse];
    unsigned __int8 v5 = [v4 ID];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = [v5 intValue];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting submit for FR %d", buf, 8u);
  }
  [(FBABugFormTableViewController *)self unregisterApplicationNotifications];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"SUBMITTING_FEEDBACK" value:&stru_1000F6658 table:FBKCommonStrings];
  [(FBABugFormTableViewController *)self showSpinnerWithStatus:v7];

  id v8 = +[UIApplication sharedApplication];
  id v9 = [(FBABugFormTableViewController *)self formResponse];
  id v10 = [v9 ID];

  *(void *)buf = 0;
  double v34 = buf;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  id v11 = +[UIApplication sharedApplication];
  id v12 = +[NSString stringWithFormat:@"%@", v10];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000C41C;
  v29[3] = &unk_1000F27F0;
  id v13 = v10;
  id v30 = v13;
  id v14 = v8;
  id v31 = v14;
  unsigned int v32 = buf;
  id v15 = [v11 beginBackgroundTaskWithName:v12 expirationHandler:v29];

  *((void *)v34 + 3) = v15;
  unsigned int v16 = [(FBABugFormTableViewController *)self devicesController];
  BOOL v17 = [(FBABugFormTableViewController *)self draftingController];
  [v17 setIsSubmitting:1];

  [(FBABugFormTableViewController *)self setModalInPresentation:1];
  unsigned int v18 = [(FBABugFormTableViewController *)self whooshSoundID];
  v19 = +[FBKData sharedInstance];
  id v20 = [(FBABugFormTableViewController *)self formResponse];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000C498;
  v23[3] = &unk_1000F2890;
  id v21 = v14;
  id v27 = buf;
  id v24 = v21;
  unsigned int v25 = self;
  unsigned int v28 = v18;
  id v22 = v16;
  id v26 = v22;
  [v19 beginSubmissionForFormResponse:v20 withCollector:v22 completion:v23];

  _Block_object_dispose(buf, 8);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  unsigned int v9 = [v8 isEqualToString:@"FBABugFormDetailPresentation"];

  if (v9)
  {
    id v10 = [v6 destinationViewController];
    id v11 = [v10 topViewController];

    id v12 = [v7 question];
    id v13 = [(FBABugFormTableViewController *)self formResponse];
    id v14 = [v12 ID];
    id v15 = [v13 answerForQuestionID:v14];
    [v11 setAnswer:v15];

    [v11 setQuestion:v12];
    [v11 setDelegate:self];
    unsigned int v16 = +[FBALog appHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = [v12 ID];
      v41[0] = 67109120;
      v41[1] = [v17 unsignedIntValue];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "will show choices for question [%u]", (uint8_t *)v41, 8u);
    }
    unsigned int v18 = [(FBABugFormTableViewController *)self traitCollection];
    id v19 = [v18 horizontalSizeClass];
    id v20 = [v6 destinationViewController];
    id v21 = v20;
    if (v19 == (id)1) {
      uint64_t v22 = 4;
    }
    else {
      uint64_t v22 = 7;
    }
    [v20 setModalPresentationStyle:v22];

    id v23 = [v6 destinationViewController];
    [v23 setTransitioningDelegate:self];

    id v24 = [v6 destinationViewController];
    unsigned int v25 = [v24 popoverPresentationController];

    if (v25)
    {
      id v26 = v7;
      id v27 = [v6 destinationViewController];
      unsigned int v28 = [v27 popoverPresentationController];
      [v28 setSourceView:v26];

      [v26 bounds];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      unsigned int v37 = [v6 destinationViewController];
      uint64_t v38 = [v37 popoverPresentationController];
      [v38 setSourceRect:v30, v32, v34, v36];

      id v39 = [v6 destinationViewController];
      v40 = [v39 popoverPresentationController];
      [v40 setPermittedArrowDirections:0];
    }
  }
}

- (void)didTapDevice:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FBALog ded];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000A47C0((uint64_t)v6, v8);
  }

  unsigned int v9 = [(FBABugFormTableViewController *)self tableView];
  [v9 deselectRowAtIndexPath:v7 animated:1];
}

- (void)didTapAttachment:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FBALog appHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v6 displayName];
    int v17 = 138543362;
    unsigned int v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tapped on attachment [%{public}@]", (uint8_t *)&v17, 0xCu);
  }
  id v10 = [(FBABugFormTableViewController *)self view];
  [v10 endEditing:1];

  if ([v6 canStartGathering])
  {
    id v11 = [(FBABugFormTableViewController *)self devicesController];
    id v12 = [(FBABugFormTableViewController *)self formResponse];
    id v13 = [v12 answersDictionary];
    [v11 gatherAttachment:v6 answers:v13];

    [(FBABugFormTableViewController *)self updateUI:0 canDismissKeyboard:1 withCompletion:0];
  }
  else if ([v6 isReadyToDisplayContents])
  {
    id v14 = +[FBALog attachHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v6 displayName];
      int v17 = 138543362;
      unsigned int v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Will show attachment contents for [%{public}@]", (uint8_t *)&v17, 0xCu);
    }
    [(FBABugFormTableViewController *)self presentAttachment:v6 fromIndexPath:v7];
  }
  unsigned int v16 = [(FBABugFormTableViewController *)self tableView];
  [v16 deselectRowAtIndexPath:v7 animated:1];
}

- (void)registerApplicationNotifications
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"saveFormForResigningActive:" name:UIApplicationWillResignActiveNotification object:0];

  objc_initWeak(&location, self);
  unsigned __int8 v4 = +[FBKData sharedInstance];
  unsigned __int8 v5 = [v4 notificationCenter];
  id v6 = +[NSOperationQueue mainQueue];
  uint64_t v7 = FBKDidRefreshFormStubsNotification;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D394;
  v11[3] = &unk_1000F2660;
  objc_copyWeak(&v12, &location);
  id v8 = [v5 addObserverForName:v7 object:0 queue:v6 usingBlock:v11];
  [(FBABugFormTableViewController *)self setDidRefreshFormStubsNotificationObserver:v8];

  unsigned int v9 = +[FBALog appHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Registered for application state notifications", v10, 2u);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)unregisterApplicationNotifications
{
  objc_super v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unregistering for application state notifications", v9, 2u);
  }

  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];

  unsigned __int8 v5 = [(FBABugFormTableViewController *)self didRefreshFormStubsNotificationObserver];

  if (v5)
  {
    id v6 = +[FBKData sharedInstance];
    uint64_t v7 = [v6 notificationCenter];
    id v8 = [(FBABugFormTableViewController *)self didRefreshFormStubsNotificationObserver];
    [v7 removeObserver:v8];
  }
}

- (void)saveFormForResigningActive:(id)a3
{
  unsigned __int8 v4 = _os_activity_create((void *)&_mh_execute_header, "Resign Active Save", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D580;
  block[3] = &unk_1000F2518;
  void block[4] = self;
  os_activity_apply(v4, block);
}

- (void)registerForKeyboardNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"keyboardWasShown:" name:UIKeyboardDidShowNotification object:0];
}

- (void)unregisterForKeyboardNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardDidShowNotification object:0];
}

- (void)keyboardWasShown:(id)a3
{
  id v7 = [a3 userInfo];
  unsigned __int8 v4 = [v7 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  double v6 = v5;

  [(FBABugFormTableViewController *)self setKeyboardHeight:v6];
}

- (id)alertControllerForDismissWithLaunchAction:(id)a3
{
  id v4 = a3;
  double v5 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  double v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"SAVE_DRAFT_CHOICE" value:&stru_1000F6658 table:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DABC;
  v19[3] = &unk_1000F2540;
  v19[4] = self;
  id v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v19];

  LOBYTE(v6) = [v4 isCaptive];
  LOBYTE(v7) = [v4 shouldMakeFBAVisible];
  unsigned int v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"DELETE_DRAFT_CHOICE" value:&stru_1000F6658 table:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000DAD0;
  v16[3] = &unk_1000F28D8;
  char v17 = (char)v6;
  v16[4] = self;
  char v18 = (char)v7;
  id v11 = +[UIAlertAction actionWithTitle:v10 style:2 handler:v16];

  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_1000F6658 table:0];
  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:&stru_1000F2918];

  [v5 addAction:v11];
  if (!v4 || ([v4 isCaptive] & 1) == 0) {
    [v5 addAction:v8];
  }
  [v5 addAction:v14];

  return v5;
}

- (void)dismiss:(id)a3
{
  id v10 = a3;
  id v4 = [(FBABugFormTableViewController *)self draftingController];
  if ([v4 isDirty])
  {

LABEL_4:
    id v7 = [(FBABugFormTableViewController *)self launchAction];
    id v8 = [(FBABugFormTableViewController *)self alertControllerForDismissWithLaunchAction:v7];

    unsigned int v9 = [v8 popoverPresentationController];
    [v9 setBarButtonItem:v10];

    [(FBABugFormTableViewController *)self presentViewController:v8 animated:1 completion:0];
    goto LABEL_6;
  }
  double v5 = [(FBABugFormTableViewController *)self launchAction];
  unsigned int v6 = [v5 isCaptive];

  if (v6) {
    goto LABEL_4;
  }
  [(FBABugFormTableViewController *)self closeDraftAndDelete:1 withError:0 completion:0];
LABEL_6:
}

- (void)hideQuestions
{
  [(FBABugFormTableViewController *)self setShouldHideQuestions:1];

  [(FBABugFormTableViewController *)self updateUI:0];
}

- (void)showQuestions
{
  [(FBABugFormTableViewController *)self setShouldHideQuestions:0];

  [(FBABugFormTableViewController *)self updateUI:0];
}

- (void)_showSpinnerWithStatus:(id)a3 userInteractionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[FBALog appHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(FBABugFormTableViewController *)self formResponse];
    unsigned int v9 = [v8 ID];
    int v10 = 134218242;
    id v11 = [v9 integerValue];
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "feedback editor for form [%li] change to state [%{public}@]", (uint8_t *)&v10, 0x16u);
  }
  [(FBABugFormTableViewController *)self showSpinnerWithStatus:v6 userInteractionEnabled:v4];
}

- (void)showSpinnerWithStatus:(id)a3
{
}

- (void)_stopSpinner
{
  [(FBABugFormTableViewController *)self hideSpinner];

  [(FBABugFormTableViewController *)self _showInternalToolbarIfNeeded];
}

- (void)_showInternalToolbarIfNeeded
{
  id v11 = (id)objc_opt_new();
  if (FBKIsInternalInstall())
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:FBKShowsAutoFillButton];

    if (v4)
    {
      double v5 = [(FBABugFormTableViewController *)self navigationController];
      [v5 setToolbarHidden:0 animated:1];

      id v6 = objc_alloc((Class)UIBarButtonItem);
      id v7 = sub_10002484C(@"Fill in all answers");
      id v8 = [v6 initWithTitle:v7 style:0 target:self action:"fillInAnswers"];

      [v11 addObject:v8];
      id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      [v11 addObject:v9];
    }
    if ([v11 count])
    {
      int v10 = +[NSArray arrayWithArray:v11];
      [(FBABugFormTableViewController *)self setToolbarItems:v10];
    }
  }
}

- (void)updateSubmitButtonState
{
  uint64_t v3 = [(FBABugFormTableViewController *)self devicesController];
  if (!v3) {
    goto LABEL_4;
  }
  unsigned int v4 = (void *)v3;
  double v5 = [(FBABugFormTableViewController *)self devicesController];
  if (![v5 state])
  {

    goto LABEL_7;
  }
  id v6 = [(FBABugFormTableViewController *)self devicesController];
  id v7 = [v6 state];

  if (v7 == (id)3)
  {
LABEL_7:
    __int16 v12 = [(FBABugFormTableViewController *)self submitButton];
    id v14 = v12;
    uint64_t v13 = 0;
    goto LABEL_9;
  }
LABEL_4:
  if (self->_attemptedSubmission)
  {
    id v8 = [(FBABugFormTableViewController *)self draftingController];
    id v9 = [v8 validate:0];
    int v10 = [(FBABugFormTableViewController *)self submitButton];
    [v10 setEnabled:v9];

    id v14 = [(FBABugFormTableViewController *)self navigationItem];
    id v11 = [v14 leftBarButtonItem];
    [v11 setEnabled:1];

    goto LABEL_10;
  }
  __int16 v12 = [(FBABugFormTableViewController *)self submitButton];
  id v14 = v12;
  uint64_t v13 = 1;
LABEL_9:
  [v12 setEnabled:v13];
LABEL_10:
}

- (BOOL)hasFileArea
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(FBABugFormTableViewController *)self bugForm];
  uint64_t v3 = [v2 questionGroups];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isFileCollectionGroup])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)shouldShowFormPicker
{
  id v2 = [(FBABugFormTableViewController *)self formStub];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldShowTeamPicker
{
  BOOL v2 = [(FBABugFormTableViewController *)self shouldShowFormPicker];
  if (v2)
  {
    BOOL v3 = +[FBKData sharedInstance];
    id v4 = [v3 currentUser];
    unsigned __int8 v5 = [v4 hasManagedTeams];

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (NSString)teamPickerRowIdentifier
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = [(FBABugFormTableViewController *)self currentTeam];
  id v6 = [v5 name];
  id v7 = [(FBABugFormTableViewController *)self formStub];
  long long v8 = [v7 teamsMatchingFormID];
  long long v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%@-%i", v4, v6, (unint64_t)[v8 count] > 1);

  return (NSString *)v9;
}

- (NSString)topicPickerRowIdentifier
{
  BOOL v3 = [(FBABugFormTableViewController *)self formStub];
  uint64_t v4 = [v3 name];
  unsigned __int8 v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_1000F6658;
  }
  id v7 = +[NSString stringWithFormat:@"%@-%lu", v6, [(FBABugFormTableViewController *)self cachedCandidateStubsCount]];

  return (NSString *)v7;
}

- (BOOL)shouldShowForm
{
  if ([(FBABugFormTableViewController *)self shouldHideQuestions]) {
    return 0;
  }
  uint64_t v4 = [(FBABugFormTableViewController *)self draftingController];
  if ([v4 isLoading])
  {
    BOOL v3 = 0;
  }
  else
  {
    unsigned __int8 v5 = [(FBABugFormTableViewController *)self formResponse];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (BOOL)shouldShowAttachments
{
  BOOL v3 = [(FBABugFormTableViewController *)self shouldShowForm];
  if (v3)
  {
    uint64_t v4 = [(FBABugFormTableViewController *)self bugForm];
    unsigned __int8 v5 = [v4 collectsFiles];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)addAttachmentsController
{
  addAttachmentsController = self->_addAttachmentsController;
  if (!addAttachmentsController)
  {
    uint64_t v4 = [[_TtC18Feedback_Assistant27FBAAddAttachmentsController alloc] initWithDelegate:self];
    unsigned __int8 v5 = self->_addAttachmentsController;
    self->_addAttachmentsController = v4;

    addAttachmentsController = self->_addAttachmentsController;
  }

  return addAttachmentsController;
}

- (void)updateCachedCandidateStubsCount
{
  BOOL v3 = +[FBKData sharedInstance];
  uint64_t v4 = [v3 currentUser];
  unsigned __int8 v5 = [(FBABugFormTableViewController *)self candidateFormStubsPredicate];
  CFStringRef v6 = [(FBABugFormTableViewController *)self currentTeam];
  id v7 = [v4 bugFormStubsForPickerWithPredicate:v5 team:v6];
  -[FBABugFormTableViewController setCachedCandidateStubsCount:](self, "setCachedCandidateStubsCount:", [v7 count]);

  long long v8 = +[FBALog appHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = [(FBABugFormTableViewController *)self cachedCandidateStubsCount];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Draft has [%lu] candidate stubs", (uint8_t *)&v9, 0xCu);
  }

  [(FBABugFormTableViewController *)self updateUI:0];
}

- (void)fillInAnswers
{
  [(FBABugFormTableViewController *)self setAttemptedSubmission:1];
  id v3 = [(FBABugFormTableViewController *)self draftingController];
  [v3 automaticallyFillInAllAnswers];
}

- (id)currentTeam
{
  BOOL v2 = [(FBABugFormTableViewController *)self itemFromDraft];
  id v3 = [v2 singleTeam];

  return v3;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 superview];
  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 superview];

      uint64_t v4 = (void *)v5;
    }
    while (v5);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setShowError:0];
    [(FBABugFormTableViewController *)self setModalInPresentation:1];
  }
  CFStringRef v6 = [(FBABugFormTableViewController *)self navigationItem];
  id v7 = [v6 leftBarButtonItem];
  [(FBABugFormTableViewController *)self setCancelBarButtonItem:v7];

  long long v8 = [(FBABugFormTableViewController *)self navigationItem];
  int v9 = [v8 rightBarButtonItem];
  [(FBABugFormTableViewController *)self setSubmitBarButtonItem:v9];

  unint64_t v10 = [(FBABugFormTableViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:0 animated:0];

  long long v11 = [(FBABugFormTableViewController *)self navigationItem];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v13 action:"resignFirstResponder"];
  [v11 setRightBarButtonItem:v12 animated:1];

  [(FBABugFormTableViewController *)self _resizeAndScrollTableAfterTextChangeInTextView:v13];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v8 superviewWithClass:objc_opt_class()];
  long long v11 = [v10 question];
  id v12 = [v11 answerType];

  if (!v12)
  {
    if ([v9 isEqualToString:@"\n"])
    {
      BOOL v13 = 0;
      goto LABEL_3;
    }
    if ([v9 containsString:@"\n"])
    {
      uint64_t v15 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

      unsigned int v16 = [v8 beginningOfDocument];
      char v17 = [v8 positionFromPosition:v16 offset:location];
      char v18 = [v8 positionFromPosition:v17 offset:length];
      id v19 = [v8 textRangeFromPosition:v17 toPosition:v18];
      [v8 replaceRange:v19 withText:v15];

      BOOL v13 = 0;
      id v9 = (id)v15;
      goto LABEL_3;
    }
  }
  BOOL v13 = 1;
LABEL_3:

  return v13;
}

- (void)_resizeAndScrollTableAfterTextChangeInTextView:(id)a3
{
  id v4 = a3;
  if ([(FBABugFormTableViewController *)self isUpdatingTable])
  {
    uint64_t v5 = +[FBALog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Is updating table, will resize cell later", (uint8_t *)buf, 2u);
    }

    CFStringRef v6 = +[NSOperationQueue mainQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000EDB0;
    v16[3] = &unk_1000F26D8;
    v16[4] = self;
    id v17 = v4;
    [v6 addOperationWithBlock:v16];
  }
  else
  {
    id v7 = objc_initWeak(buf, self);
    id v8 = [(FBABugFormTableViewController *)self diffableDataSource];
    id v9 = [v8 snapshot];

    id WeakRetained = objc_loadWeakRetained(buf);
    long long v11 = [WeakRetained diffableDataSource];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000EDBC;
    v12[3] = &unk_1000F2638;
    id v13 = v4;
    objc_copyWeak(&v14, buf);
    [v11 applySnapshot:v9 animatingDifferences:0 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v4 = [a3 superview];
  if (v4)
  {
    while (1)
    {
      id v12 = (id)v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v12 superview];

      uint64_t v4 = v5;
      if (!v5) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    id v12 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 endEditingQuestion];
    CFStringRef v6 = [(FBABugFormTableViewController *)self draftingController];
    BOOL v7 = ([v6 isDirty] & 1) != 0
      || [(FBABugFormTableViewController *)self isCaptiveModeEnabled];
    [(FBABugFormTableViewController *)self setModalInPresentation:v7];
  }
  id v8 = [(FBABugFormTableViewController *)self navigationItem];
  id v9 = [(FBABugFormTableViewController *)self cancelBarButtonItem];
  [v8 setLeftBarButtonItem:v9 animated:0];

  unint64_t v10 = [(FBABugFormTableViewController *)self navigationItem];
  long long v11 = [(FBABugFormTableViewController *)self submitBarButtonItem];
  [v10 setRightBarButtonItem:v11 animated:0];

  [(FBABugFormTableViewController *)self setCancelBarButtonItem:0];
  [(FBABugFormTableViewController *)self setSubmitBarButtonItem:0];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    unint64_t v10 = [v9 topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = [v9 topViewController];
      id v13 = [[FBAPartialPresentationController alloc] initWithPresentedViewController:v9 presentingViewController:v8];
      id v14 = +[UIApplication sharedApplication];
      uint64_t v15 = [v14 windows];
      unsigned int v16 = [v15 firstObject];
      [v16 safeAreaInsets];
      double v18 = v17;

      id v19 = [v12 question];
      uint64_t v20 = [v19 text];

      id v21 = [(FBABugFormTableViewController *)self view];
      [v21 bounds];
      double v23 = v22;
      double v25 = v24;
      NSAttributedStringKey v58 = NSFontAttributeName;
      id v26 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
      v59 = v26;
      +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      os_activity_t v54 = self;
      id v27 = v55 = (void *)v20;
      unsigned int v28 = (void *)v20;
      double v29 = v12;
      [v28 boundingRectWithSize:1 options:v27 attributes:0 context:v23];
      double v31 = v30;

      double v32 = [v12 question];
      id v33 = [v32 answerType];

      if (v33 == (id)4)
      {
        double v34 = +[NSBundle mainBundle];
        double v35 = [v34 localizedStringForKey:@"CHECKBOX_FOOTER_TITLE" value:&stru_1000F6658 table:0];

        double v36 = [(FBABugFormTableViewController *)v54 view];
        [v36 bounds];
        double v38 = v37;
        double v40 = v39;
        NSAttributedStringKey v56 = NSFontAttributeName;
        id v41 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        v57 = v41;
        unsigned int v42 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        [v35 boundingRectWithSize:1 options:v42 attributes:0 context:v38];
        double height = v43;
      }
      else
      {
        double height = CGRectZero.size.height;
      }
      id v45 = [v29 tableView];
      [v45 rectForSection:0];
      double v47 = height + v31 + v46;
      v48 = [v29 tableView];
      [v48 estimatedRowHeight];
      double v50 = v47 + v49 * 0.5;
      id v51 = [v9 navigationBar];
      [v51 bounds];
      [(FBAPartialPresentationController *)v13 setHeight:v18 + v50 + v52];

      goto LABEL_9;
    }
  }
  id v13 = 0;
LABEL_9:

  return v13;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v10 = a3;
  uint64_t v5 = [(FBABugFormTableViewController *)self presentedViewController];
  if (v5)
  {
    CFStringRef v6 = (void *)v5;
    id v7 = [(FBABugFormTableViewController *)self traitCollection];
    id v8 = [v7 horizontalSizeClass];
    id v9 = [v10 horizontalSizeClass];

    if (v8 != v9) {
      [(FBABugFormTableViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
}

- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6
{
  BOOL v7 = [(FBABugFormTableViewController *)self hasFileArea];
  if (v7)
  {
    LOBYTE(v7) = [(FBABugFormTableViewController *)self shouldShowForm];
  }
  return v7;
}

- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4
{
  id v6 = a4;
  id v7 = [(FBABugFormTableViewController *)self devicesController];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)attachmentsAlertDidSelectOption:(id)a3
{
  id v3 = [(FBABugFormTableViewController *)self view];
  [v3 endEditing:1];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v4 = +[NSOperationQueue mainQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F5BC;
  v5[3] = &unk_1000F2518;
  v5[4] = self;
  [v4 addOperationWithBlock:v5];
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (BOOL)isCaptiveModeEnabled
{
  BOOL v2 = self;
  id v3 = [(FBABugFormTableViewController *)self launchAction];
  LOBYTE(v2) = [(FBABugFormTableViewController *)v2 isCaptiveModeEnabledForLaunchAction:v3];

  return (char)v2;
}

- (BOOL)isCaptiveModeEnabledForLaunchAction:(id)a3
{
  if (a3) {
    return [a3 isCaptive];
  }
  else {
    return 0;
  }
}

- (NSDictionary)pendingQandA
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingQandA:(id)a3
{
}

- (NSSet)extensions
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensions:(id)a3
{
}

- (NSPredicate)candidateFormStubsPredicate
{
  return self->_candidateFormStubsPredicate;
}

- (void)setCandidateFormStubsPredicate:(id)a3
{
}

- (FBKDraftingController)draftingController
{
  return self->_draftingController;
}

- (void)setDraftingController:(id)a3
{
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (FBKDeviceDiagnosticsController)devicesController
{
  return self->_devicesController;
}

- (void)setDevicesController:(id)a3
{
}

- (UIBarButtonItem)submitButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_submitButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setSubmitButton:(id)a3
{
}

- (BOOL)attemptedSubmission
{
  return self->_attemptedSubmission;
}

- (void)setAttemptedSubmission:(BOOL)a3
{
  self->_attemptedSubmission = a3;
}

- (NSDictionary)pendingAttachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPendingAttachments:(id)a3
{
}

- (unsigned)whooshSoundID
{
  return self->_whooshSoundID;
}

- (void)setWhooshSoundID:(unsigned int)a3
{
  self->_whooshSoundID = a3;
}

- (BOOL)hasLoadedFirstDraft
{
  return self->_hasLoadedFirstDraft;
}

- (void)setHasLoadedFirstDraft:(BOOL)a3
{
  self->_hasLoadedFirstDraft = a3;
}

- (BOOL)isEstablishingBugSession
{
  return self->_isEstablishingBugSession;
}

- (void)setIsEstablishingBugSession:(BOOL)a3
{
  self->_isEstablishingBugSession = a3;
}

- (unint64_t)cachedCandidateStubsCount
{
  return self->_cachedCandidateStubsCount;
}

- (void)setCachedCandidateStubsCount:(unint64_t)a3
{
  self->_cachedCandidateStubsCount = a3;
}

- (id)didRefreshFormStubsNotificationObserver
{
  return self->_didRefreshFormStubsNotificationObserver;
}

- (void)setDidRefreshFormStubsNotificationObserver:(id)a3
{
}

- (BOOL)isUpdatingTable
{
  return self->_isUpdatingTable;
}

- (void)setIsUpdatingTable:(BOOL)a3
{
  self->_isUpdatingTable = a3;
}

- (BOOL)allowKeyboardDismissalForSnapshot
{
  return self->_allowKeyboardDismissalForSnapshot;
}

- (void)setAllowKeyboardDismissalForSnapshot:(BOOL)a3
{
  self->_allowKeyboardDismissalForSnapshot = a3;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (void)setCancelBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)submitBarButtonItem
{
  return self->_submitBarButtonItem;
}

- (void)setSubmitBarButtonItem:(id)a3
{
}

- (BOOL)shouldHideQuestions
{
  return self->_shouldHideQuestions;
}

- (void)setShouldHideQuestions:(BOOL)a3
{
  self->_shouldHideQuestions = a3;
}

- (id)notificationObserver
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setNotificationObserver:(id)a3
{
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (NSMutableDictionary)cellHeights
{
  return self->_cellHeights;
}

- (void)setCellHeights:(id)a3
{
}

- (FBKBugFormStub)pendingStub
{
  return self->_pendingStub;
}

- (void)setPendingStub:(id)a3
{
}

- (FBKManagedFeedbackObject)pendingFeedbackObject
{
  return self->_pendingFeedbackObject;
}

- (void)setPendingFeedbackObject:(id)a3
{
}

- (FBKTeam)pendingTeam
{
  return self->_pendingTeam;
}

- (void)setPendingTeam:(id)a3
{
}

- (BOOL)viewHasBecomeVisible
{
  return self->_viewHasBecomeVisible;
}

- (void)setViewHasBecomeVisible:(BOOL)a3
{
  self->_viewHasBecomeVisible = a3;
}

- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)addAttachmentCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addAttachmentCell);

  return (_TtC18Feedback_Assistant21FBAAddAttachmentsCell *)WeakRetained;
}

- (void)setAddAttachmentCell:(id)a3
{
}

- (FBABugFormDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void)setAddAttachmentsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAttachmentsController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_addAttachmentCell);
  objc_storeStrong((id *)&self->_pendingTeam, 0);
  objc_storeStrong((id *)&self->_pendingFeedbackObject, 0);
  objc_storeStrong((id *)&self->_pendingStub, 0);
  objc_storeStrong((id *)&self->_cellHeights, 0);
  objc_storeStrong(&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_submitBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong(&self->_didRefreshFormStubsNotificationObserver, 0);
  objc_storeStrong((id *)&self->_pendingAttachments, 0);
  objc_destroyWeak((id *)&self->_submitButton);
  objc_storeStrong((id *)&self->_devicesController, 0);
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_draftingController, 0);
  objc_storeStrong((id *)&self->_candidateFormStubsPredicate, 0);
  objc_storeStrong((id *)&self->_extensions, 0);

  objc_storeStrong((id *)&self->_pendingQandA, 0);
}

@end