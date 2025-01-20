@interface HUAddPeopleViewController
+ (void)presentAddPersonOrAlertForHH2Upgrade:(id)a3 withHome:(id)a4 viewContext:(unint64_t)a5 delegate:(id)a6 presentationDelegate:(id)a7;
- (BOOL)_shouldCheckIDSCapabilities;
- (BOOL)_shouldCheckRestrictedGuestIDSCapability;
- (BOOL)addressBookAccessDenied;
- (BOOL)requiresPresentingViewControllerDismissal;
- (BOOL)showingAutoCompleteResults;
- (HFContactController)contactsController;
- (HMHome)home;
- (HUAddPeopleViewController)initWithCoder:(id)a3;
- (HUAddPeopleViewController)initWithHome:(id)a3;
- (HUAddPeopleViewController)initWithHome:(id)a3 viewContext:(unint64_t)a4;
- (HUAddPeopleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HUAddPeopleViewControllerDelegate)delegate;
- (HUPresentationDelegate)presentationDelegate;
- (IDSBatchIDQueryController)statusQueryController;
- (MFComposeRecipientTextView)composeView;
- (MFContactsSearchManager)searchManager;
- (NSArray)autoCompleteResults;
- (NSArray)constraints;
- (NSArray)familyMembersNotInHome;
- (NSLayoutConstraint)composeViewBottomConstraint;
- (NSMutableArray)additionalAutoCompleteResults;
- (NSNumber)lastSearchID;
- (NSString)unatomizedAddress;
- (NSTimer)statusQueryDebounceTimer;
- (UIActivityIndicatorView)spinner;
- (UIColor)effectiveTintColor;
- (UITableView)tableView;
- (UIView)separatorView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)IDSDestinationForRecipient:(id)a3;
- (id)_getIDSServiceName;
- (id)composeRecipientForAddress:(id)a3;
- (id)recipientsWithStatusPassingTest:(id)a3;
- (id)requiredKeyDescriptors;
- (id)rightBarButtonTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tintColorForRecipient:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)state;
- (unint64_t)viewContext;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)cancelButtonPressed:(id)a3;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)contactController:(id)a3 didFinishDownloadingFamilyMemberAvatar:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)finishedSearchingForAutocompleteResults;
- (void)handleStatusQueryResults:(id)a3;
- (void)lookupIDSDestinations:(id)a3;
- (void)lookupVisibleRecipients;
- (void)scheduleDelayedLookupVisibleRecipients;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendButtonPressed:(id)a3;
- (void)sendInvites;
- (void)setAdditionalAutoCompleteResults:(id)a3;
- (void)setAddressBookAccessDenied:(BOOL)a3;
- (void)setAutoCompleteResults:(id)a3;
- (void)setComposeView:(id)a3;
- (void)setComposeViewBottomConstraint:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContactsController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectiveTintColor:(id)a3;
- (void)setFamilyMembersNotInHome:(id)a3;
- (void)setHome:(id)a3;
- (void)setLastSearchID:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setSearchManager:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setShowingAutoCompleteResults:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStatusQueryController:(id)a3;
- (void)setStatusQueryDebounceTimer:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUnatomizedAddress:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateStateDependentUI;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUAddPeopleViewController

- (HUAddPeopleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddPeopleViewController.m", 98, @"%s is unavailable; use %@ instead",
    "-[HUAddPeopleViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUAddPeopleViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddPeopleViewController.m", 103, @"%s is unavailable; use %@ instead",
    "-[HUAddPeopleViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUAddPeopleViewController)initWithHome:(id)a3 viewContext:(unint64_t)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUAddPeopleViewController;
  v8 = [(HUAddPeopleViewController *)&v20 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_viewContext = a4;
    id v10 = objc_alloc(MEMORY[0x1E4F69088]);
    v11 = [(HUAddPeopleViewController *)v9 requiredKeyDescriptors];
    uint64_t v12 = [v10 initWithKeyDescriptors:v11];
    contactsController = v9->_contactsController;
    v9->_contactsController = (HFContactController *)v12;

    [(HFContactController *)v9->_contactsController setDelegate:v9];
    familyMembersNotInHome = v9->_familyMembersNotInHome;
    v9->_familyMembersNotInHome = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_initWeak(&location, v9);
    v15 = v9->_contactsController;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke;
    v17[3] = &unk_1E6386408;
    objc_copyWeak(&v18, &location);
    [(HFContactController *)v15 fetchFamilyMembersWithCompletion:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  v6 = [v5 users];

  id v7 = [WeakRetained home];
  v8 = [v7 outgoingInvitations];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_2;
  v16[3] = &unk_1E638AAE0;
  id v9 = WeakRetained;
  id v17 = v9;
  id v10 = v6;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  uint64_t v12 = objc_msgSend(v3, "na_filter:", v16);

  [v9 setFamilyMembersNotInHome:v12];
  if ([v9 isViewLoaded])
  {
    v13 = [v9 familyMembersNotInHome];
    if (![v13 count])
    {
LABEL_5:

      goto LABEL_6;
    }
    char v14 = [v9 showingAutoCompleteResults];

    if ((v14 & 1) == 0)
    {
      v13 = [v9 tableView];
      v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [v13 insertSections:v15 withRowAnimation:3];

      goto LABEL_5;
    }
  }
LABEL_6:
}

uint64_t __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 appleID];
  v5 = [*(id *)(a1 + 32) home];
  v6 = [v5 currentUser];
  id v7 = [v6 userID];
  char v8 = [v4 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_3;
    v16[3] = &unk_1E63858F0;
    id v11 = v3;
    id v17 = v11;
    if (objc_msgSend(v10, "na_any:", v16))
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v12 = *(void **)(a1 + 48);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_4;
      v14[3] = &unk_1E638AAB8;
      id v15 = v11;
      uint64_t v9 = objc_msgSend(v12, "na_any:", v14) ^ 1;
    }
  }

  return v9;
}

uint64_t __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 appleID];
  v5 = [v3 userID];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

uint64_t __54__HUAddPeopleViewController_initWithHome_viewContext___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 appleID];
  v5 = [v3 invitee];

  uint64_t v6 = [v5 userID];
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

- (HUAddPeopleViewController)initWithHome:(id)a3
{
  return [(HUAddPeopleViewController *)self initWithHome:a3 viewContext:0];
}

+ (void)presentAddPersonOrAlertForHH2Upgrade:(id)a3 withHome:(id)a4 viewContext:(unint64_t)a5 delegate:(id)a6 presentationDelegate:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = [[HUAddPeopleViewController alloc] initWithHome:v12 viewContext:a5];
  [(HUAddPeopleViewController *)v15 setDelegate:v14];

  [(HUAddPeopleViewController *)v15 setPresentationDelegate:v13];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v15];
  [v16 setModalPresentationStyle:2];
  id v17 = v16;
  id v18 = v17;
  if (objc_msgSend(v12, "hf_canUpdateToHH2"))
  {
    id v19 = objc_msgSend(v12, "hf_residentDevicesAddedToHome");
    uint64_t v20 = [v19 count];

    id v18 = v17;
    if (v20)
    {
      v21 = (void *)MEMORY[0x1E4F42728];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __117__HUAddPeopleViewController_presentAddPersonOrAlertForHH2Upgrade_withHome_viewContext_delegate_presentationDelegate___block_invoke;
      v22[3] = &unk_1E638AB08;
      id v23 = v12;
      id v24 = v11;
      id v25 = v17;
      id v18 = objc_msgSend(v21, "hu_alertControllerForAddingPersonWithCompletionHandler:", v22);
    }
  }
  [v11 presentViewController:v18 animated:1 completion:0];
}

void __117__HUAddPeopleViewController_presentAddPersonOrAlertForHH2Upgrade_withHome_viewContext_delegate_presentationDelegate___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    id v3 = NSString;
    v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    [v3 stringWithFormat:@"com.apple.HOME-PRIVATE://homepodSoftwareUpdate?homeId=%@", v4];
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    v5 = [MEMORY[0x1E4F69378] sharedInstance];
    uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    id v7 = (id)[v5 openURL:v6];
  }
  else
  {
    char v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    [v8 presentViewController:v9 animated:1 completion:0];
  }
}

- (void)dealloc
{
  [(NSTimer *)self->_statusQueryDebounceTimer invalidate];
  [(IDSBatchIDQueryController *)self->_statusQueryController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HUAddPeopleViewController;
  [(HUAddPeopleViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v55[3] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)HUAddPeopleViewController;
  [(HUAddPeopleViewController *)&v54 viewDidLoad];
  objc_super v3 = _HULocalizedStringWithDefaultValue(@"HUPeopleAddPeople", @"HUPeopleAddPeople", 1);
  [(HUAddPeopleViewController *)self setTitle:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F350D0]);
  [(HUAddPeopleViewController *)self setComposeView:v4];

  v5 = [MEMORY[0x1E4F428B8] labelColor];
  uint64_t v6 = [(HUAddPeopleViewController *)self composeView];
  [v6 setTypingTextColor:v5];

  id v7 = _HULocalizedStringWithDefaultValue(@"HUPeopleRecipientToLabel", @"HUPeopleRecipientToLabel", 1);
  char v8 = [(HUAddPeopleViewController *)self composeView];
  [v8 setLabel:v7];

  uint64_t v9 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v10 = [(HUAddPeopleViewController *)self composeView];
  [v10 setBackgroundColor:v9];

  id v11 = [(HUAddPeopleViewController *)self composeView];
  [v11 setSeparatorHidden:1];

  id v12 = [(HUAddPeopleViewController *)self composeView];
  [v12 setDelegate:self];

  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v13 = [(HUAddPeopleViewController *)self composeView];
    [v13 setShowsAddButtonWhenExpanded:0];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(HUAddPeopleViewController *)self setSeparatorView:v14];

  id v15 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
  v16 = [(HUAddPeopleViewController *)self separatorView];
  [v16 setBackgroundColor:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F42E98]);
  id v18 = objc_msgSend(v17, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUAddPeopleViewController *)self setTableView:v18];

  id v19 = [(HUAddPeopleViewController *)self tableView];
  [v19 setEstimatedRowHeight:55.0];

  uint64_t v20 = [(HUAddPeopleViewController *)self tableView];
  [v20 setSectionHeaderTopPadding:0.0];

  v21 = [(HUAddPeopleViewController *)self tableView];
  [v21 setDelegate:self];

  v22 = [(HUAddPeopleViewController *)self tableView];
  [v22 setDataSource:self];

  id v23 = [(HUAddPeopleViewController *)self view];
  id v24 = [(HUAddPeopleViewController *)self composeView];
  v55[0] = v24;
  id v25 = [(HUAddPeopleViewController *)self separatorView];
  v55[1] = v25;
  v26 = [(HUAddPeopleViewController *)self tableView];
  v55[2] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
  objc_msgSend(v23, "naui_addAutoLayoutSubviews:", v27);

  v28 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v29 = [(HUAddPeopleViewController *)self view];
  [v29 setBackgroundColor:v28];

  v30 = [(HUAddPeopleViewController *)self navigationController];
  v31 = [v30 viewControllers];
  v32 = [v31 objectAtIndexedSubscript:0];
  LODWORD(v26) = [v32 isEqual:self];

  if (v26)
  {
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
    v34 = [(HUAddPeopleViewController *)self navigationItem];
    [v34 setLeftBarButtonItem:v33];

    v35 = [(HUAddPeopleViewController *)self navigationItem];
    v36 = [v35 leftBarButtonItem];
    [v36 setAccessibilityIdentifier:@"Home.Users.AddPeople.NavigationBar.CancelButton"];
  }
  else
  {
    v35 = [(HUAddPeopleViewController *)self navigationItem];
    [v35 setLeftBarButtonItem:0];
  }

  id v37 = objc_alloc(MEMORY[0x1E4F427C0]);
  v38 = [(HUAddPeopleViewController *)self rightBarButtonTitle];
  v39 = (void *)[v37 initWithTitle:v38 style:2 target:self action:sel_sendButtonPressed_];
  v40 = [(HUAddPeopleViewController *)self navigationItem];
  [v40 setRightBarButtonItem:v39];

  v41 = [(HUAddPeopleViewController *)self navigationItem];
  v42 = [v41 rightBarButtonItem];
  [v42 setAccessibilityIdentifier:@"Home.Users.AddPeople.NavigationBar.NextDoneButton"];

  v43 = [(HUAddPeopleViewController *)self tableView];
  uint64_t v44 = objc_opt_class();
  v45 = +[HUAddPeopleTableHeaderFooterView identifier];
  [v43 registerClass:v44 forHeaderFooterViewReuseIdentifier:v45];

  v46 = [(HUAddPeopleViewController *)self tableView];
  uint64_t v47 = objc_opt_class();
  v48 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v48);
  [v46 registerClass:v47 forCellReuseIdentifier:v49];

  v50 = [(HUAddPeopleViewController *)self tableView];
  uint64_t v51 = objc_opt_class();
  v52 = [MEMORY[0x1E4F35120] identifier];
  [v50 registerClass:v51 forCellReuseIdentifier:v52];

  [(HUAddPeopleViewController *)self updateStateDependentUI];
  v53 = [(HUAddPeopleViewController *)self view];
  [v53 setNeedsUpdateConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[HUAddPeopleViewController viewDidAppear:]";
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s)", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)HUAddPeopleViewController;
  [(HUAddPeopleViewController *)&v9 viewDidAppear:v3];
  uint64_t v6 = [(HUAddPeopleViewController *)self composeView];
  [v6 becomeFirstResponder];

  id v7 = [(HUAddPeopleViewController *)self view];
  char v8 = [v7 tintColor];
  [(HUAddPeopleViewController *)self setEffectiveTintColor:v8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[HUAddPeopleViewController viewWillDisappear:]";
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s)", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)HUAddPeopleViewController;
  [(HUAddPeopleViewController *)&v8 viewWillDisappear:v3];
  uint64_t v6 = [(HUAddPeopleViewController *)self composeView];
  id v7 = [v6 textView];
  [v7 resignFirstResponder];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(HUAddPeopleViewController *)self composeView];
  v5 = [v4 textView];
  [v5 resignFirstResponder];

  id v6 = [(HUAddPeopleViewController *)self statusQueryDebounceTimer];
  [v6 invalidate];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(HUAddPeopleViewController *)self scheduleDelayedLookupVisibleRecipients];
  }
}

- (void)updateViewConstraints
{
  BOOL v3 = [(HUAddPeopleViewController *)self constraints];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(HUAddPeopleViewController *)self composeView];
    id v6 = [v5 leadingAnchor];
    id v7 = [(HUAddPeopleViewController *)self view];
    objc_super v8 = [v7 leadingAnchor];
    objc_super v9 = [v6 constraintEqualToAnchor:v8];
    [v4 addObject:v9];

    id v10 = [(HUAddPeopleViewController *)self composeView];
    uint64_t v11 = [v10 trailingAnchor];
    uint64_t v12 = [(HUAddPeopleViewController *)self view];
    id v13 = [v12 trailingAnchor];
    id v14 = [v11 constraintEqualToAnchor:v13];
    [v4 addObject:v14];

    id v15 = [(HUAddPeopleViewController *)self separatorView];
    v16 = [v15 leadingAnchor];
    id v17 = [(HUAddPeopleViewController *)self view];
    id v18 = [v17 leadingAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18];
    [v4 addObject:v19];

    uint64_t v20 = [(HUAddPeopleViewController *)self separatorView];
    v21 = [v20 trailingAnchor];
    v22 = [(HUAddPeopleViewController *)self view];
    id v23 = [v22 trailingAnchor];
    id v24 = [v21 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    id v25 = [(HUAddPeopleViewController *)self tableView];
    v26 = [v25 leadingAnchor];
    v27 = [(HUAddPeopleViewController *)self view];
    v28 = [v27 leadingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v4 addObject:v29];

    v30 = [(HUAddPeopleViewController *)self tableView];
    v31 = [v30 trailingAnchor];
    v32 = [(HUAddPeopleViewController *)self view];
    v33 = [v32 trailingAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    [v4 addObject:v34];

    v35 = [(HUAddPeopleViewController *)self composeView];
    v36 = [v35 topAnchor];
    id v37 = [(HUAddPeopleViewController *)self view];
    v38 = [v37 safeAreaLayoutGuide];
    v39 = [v38 topAnchor];
    v40 = [v36 constraintEqualToAnchor:v39];
    [v4 addObject:v40];

    v41 = [(HUAddPeopleViewController *)self composeView];
    v42 = [v41 bottomAnchor];
    v43 = [(HUAddPeopleViewController *)self separatorView];
    uint64_t v44 = [v43 topAnchor];
    v45 = [v42 constraintEqualToAnchor:v44];
    [v4 addObject:v45];

    v46 = [(HUAddPeopleViewController *)self composeView];
    uint64_t v47 = [v46 heightAnchor];
    [MEMORY[0x1E4F350D0] preferredHeight];
    v48 = objc_msgSend(v47, "constraintEqualToConstant:");
    [(HUAddPeopleViewController *)self setComposeViewBottomConstraint:v48];

    v49 = [(HUAddPeopleViewController *)self composeViewBottomConstraint];
    [v4 addObject:v49];

    v50 = [(HUAddPeopleViewController *)self separatorView];
    uint64_t v51 = [v50 bottomAnchor];
    v52 = [(HUAddPeopleViewController *)self tableView];
    v53 = [v52 topAnchor];
    objc_super v54 = [v51 constraintEqualToAnchor:v53];
    [v4 addObject:v54];

    v55 = [(HUAddPeopleViewController *)self separatorView];
    v56 = [v55 heightAnchor];
    v57 = [MEMORY[0x1E4F42D90] mainScreen];
    [v57 scale];
    v59 = [v56 constraintEqualToConstant:1.0 / v58];
    [v4 addObject:v59];

    v60 = [(HUAddPeopleViewController *)self tableView];
    v61 = [v60 bottomAnchor];
    v62 = [(HUAddPeopleViewController *)self view];
    v63 = [v62 bottomAnchor];
    v64 = [v61 constraintEqualToAnchor:v63];
    [v4 addObject:v64];

    [(HUAddPeopleViewController *)self setConstraints:v4];
    v65 = (void *)MEMORY[0x1E4F28DC8];
    v66 = [(HUAddPeopleViewController *)self constraints];
    [v65 activateConstraints:v66];
  }
  v67.receiver = self;
  v67.super_class = (Class)HUAddPeopleViewController;
  [(HUAddPeopleViewController *)&v67 updateViewConstraints];
}

- (void)cancelButtonPressed:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[HUAddPeopleViewController cancelButtonPressed:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'cancel' button %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [(HUAddPeopleViewController *)self presentationDelegate];
  id v7 = (id)[v6 finishPresentation:self animated:1];

  objc_super v8 = [(HUAddPeopleViewController *)self delegate];

  if (v8)
  {
    objc_super v9 = [(HUAddPeopleViewController *)self delegate];
    [v9 addPeopleViewControllerDidCancel:self];
  }
}

- (void)sendButtonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    objc_super v8 = "-[HUAddPeopleViewController sendButtonPressed:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'send' button %@", (uint8_t *)&v7, 0x16u);
  }

  if ([(HUAddPeopleViewController *)self state]) {
    NSLog(&cfstr_SendButtonNotD.isa);
  }
  [(HUAddPeopleViewController *)self setUnatomizedAddress:0];
  id v6 = [(HUAddPeopleViewController *)self composeView];
  [v6 finishEnteringRecipient];

  [(HUAddPeopleViewController *)self sendInvites];
}

- (void)setState:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"invited";
      if (a3 == 1) {
        id v6 = @"send requested";
      }
      if (!a3) {
        id v6 = @"composing";
      }
      int v7 = 136315394;
      objc_super v8 = "-[HUAddPeopleViewController setState:]";
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) State is now \"%@\"", (uint8_t *)&v7, 0x16u);
    }

    [(HUAddPeopleViewController *)self updateStateDependentUI];
  }
}

- (MFContactsSearchManager)searchManager
{
  if (!self->_searchManager && ![(HUAddPeopleViewController *)self addressBookAccessDenied])
  {
    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) <= 1) {
      [(HUAddPeopleViewController *)self setAddressBookAccessDenied:1];
    }
    if ([(HUAddPeopleViewController *)self addressBookAccessDenied])
    {
      BOOL v3 = 0;
      goto LABEL_9;
    }
    id v4 = (MFContactsSearchManager *)[objc_alloc(MEMORY[0x1E4F350D8]) initWithAutocompleteSearchType:0];
    searchManager = self->_searchManager;
    self->_searchManager = v4;
  }
  BOOL v3 = self->_searchManager;
LABEL_9:

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults]) {
    return 1;
  }
  v5 = [(HUAddPeopleViewController *)self familyMembersNotInHome];
  int64_t v4 = [v5 count] != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults]) {
    [(HUAddPeopleViewController *)self autoCompleteResults];
  }
  else {
  v5 = [(HUAddPeopleViewController *)self familyMembersNotInHome];
  }
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults])
  {
    objc_super v8 = [MEMORY[0x1E4F35120] identifier];
    __int16 v9 = [v7 dequeueReusableCellWithIdentifier:v8];

    id v10 = [(HUAddPeopleViewController *)self autoCompleteResults];
    uint64_t v11 = [v6 row];

    __int16 v12 = [v10 objectAtIndexedSubscript:v11];
    [v9 setRecipient:v12];

    [v9 setShouldDimIrrelevantInformation:0];
    id v13 = [v9 recipient];
    uint64_t v14 = [(HUAddPeopleViewController *)self tintColorForRecipient:v13];
    [v9 setTintColor:v14 animated:0];

    id v15 = [MEMORY[0x1E4F428B8] clearColor];
    [v9 setBackgroundColor:v15];
  }
  else
  {
    v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    __int16 v9 = [v7 dequeueReusableCellWithIdentifier:v17];

    id v18 = [(HUAddPeopleViewController *)self familyMembersNotInHome];
    uint64_t v19 = [v6 row];

    uint64_t v20 = [v18 objectAtIndexedSubscript:v19];

    v21 = [(HUAddPeopleViewController *)self contactsController];
    v22 = [v20 dsid];
    id v23 = [v21 contactForFamilyMemberWithDsid:v22];

    id v24 = NSString;
    id v25 = [v20 firstName];
    v26 = [v20 lastName];
    id v15 = objc_msgSend(v24, "hf_formattedPersonNameForFirstName:lastName:", v25, v26);

    v27 = [v20 appleID];
    LODWORD(v26) = objc_msgSend(v27, "hf_isEmail");

    if (v26)
    {
      v28 = [v20 appleID];
    }
    else
    {
      v28 = 0;
    }
    [v9 setTitleText:v15];
    [v9 setDescriptionText:v28];
    [v9 setContact:v23];
    v29 = [v23 imageData];

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E4F42A80];
      v31 = [v23 imageData];
      v32 = [v30 imageWithData:v31];
      [v9 setPhoto:v32];
    }
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (![(HUAddPeopleViewController *)self showingAutoCompleteResults]) {
    return *MEMORY[0x1E4F43D18];
  }
  int64_t v4 = (void *)MEMORY[0x1E4F35120];

  [v4 height];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults]) {
    return 0.0;
  }

  +[HUAddPeopleTableHeaderFooterView preferredHeight];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  if (![(HUAddPeopleViewController *)self showingAutoCompleteResults])
  {
    id v18 = [(HUAddPeopleViewController *)self familyMembersNotInHome];
    uint64_t v19 = [v6 row];

    uint64_t v20 = [v18 objectAtIndexedSubscript:v19];

    v21 = [(HUAddPeopleViewController *)self contactsController];
    v22 = [v20 dsid];
    id v23 = [v21 contactForFamilyMemberWithDsid:v22];

    id v24 = [v23 emailAddresses];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      v26 = [v23 emailAddresses];
      v27 = [v26 firstObject];
      v28 = [v27 value];
      uint64_t v29 = 0;
    }
    else
    {
      v26 = [v23 phoneNumbers];
      v27 = [v26 firstObject];
      v30 = [v27 value];
      v28 = [v30 stringValue];

      uint64_t v29 = 1;
    }

    __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F350C8]) initWithContact:v23 address:v28 kind:v29];
    goto LABEL_8;
  }
  id v7 = [(HUAddPeopleViewController *)self autoCompleteResults];
  uint64_t v8 = [v6 row];

  __int16 v9 = [v7 objectAtIndexedSubscript:v8];

  id v10 = [(HUAddPeopleViewController *)self contactsController];
  uint64_t v11 = [(HUAddPeopleViewController *)self IDSDestinationForRecipient:v9];
  uint64_t v12 = [v10 statusForDestination:v11];

  if (v12 != 4)
  {
LABEL_8:
    v31 = [(HUAddPeopleViewController *)self composeView];
    [v31 addRecipient:v9];

    id v13 = [(HUAddPeopleViewController *)self composeView];
    [v13 clearText];
    goto LABEL_9;
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 40);
  uint64_t v14 = [MEMORY[0x1E4F69110] sharedHandler];
  uint64_t v15 = *MEMORY[0x1E4F68760];
  uint64_t v32 = *MEMORY[0x1E4F68420];
  v16 = [v9 address];
  v33[0] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  [v14 handleError:v13 operationType:v15 options:v17 retryBlock:0 cancelBlock:0];

LABEL_9:
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v14 = a4;
  id v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:11.0 weight:*MEMORY[0x1E4F43908]];
  uint64_t v8 = [v14 textLabel];
  [v8 setFont:v7];

  __int16 v9 = [(HUAddPeopleViewController *)self familyMembersNotInHome];
  uint64_t v10 = [v9 count];
  if (a5 || !v10) {
    uint64_t v11 = @"HUPeopleTableSectionContacts";
  }
  else {
    uint64_t v11 = @"HUPeopleTableSectionFamily";
  }
  uint64_t v12 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
  id v13 = [v14 textLabel];
  [v13 setText:v12];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(HUAddPeopleViewController *)self tableView:v6 numberOfRowsInSection:a4])
  {
    id v7 = +[HUAddPeopleTableHeaderFooterView identifier];
    uint64_t v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v7];

    __int16 v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    uint64_t v10 = [v8 textLabel];
    [v10 setFont:v9];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v15 = a4;
  v5 = [(HUAddPeopleViewController *)self statusQueryDebounceTimer];
  [v5 invalidate];

  if ([v15 length])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    [(HUAddPeopleViewController *)self setAdditionalAutoCompleteResults:v6];

    id v7 = [(HUAddPeopleViewController *)self lastSearchID];

    if (v7)
    {
      uint64_t v8 = [(HUAddPeopleViewController *)self searchManager];
      __int16 v9 = [(HUAddPeopleViewController *)self lastSearchID];
      [v8 cancelTaskWithID:v9];
    }
    uint64_t v10 = [(HUAddPeopleViewController *)self searchManager];
    uint64_t v11 = [v10 searchForText:v15 withAutocompleteFetchContext:0 consumer:self];
    [(HUAddPeopleViewController *)self setLastSearchID:v11];
  }
  else
  {
    uint64_t v12 = [(HUAddPeopleViewController *)self lastSearchID];

    if (v12)
    {
      id v13 = [(HUAddPeopleViewController *)self searchManager];
      id v14 = [(HUAddPeopleViewController *)self lastSearchID];
      [v13 cancelTaskWithID:v14];
    }
    [(HUAddPeopleViewController *)self setShowingAutoCompleteResults:0];
    uint64_t v10 = [(HUAddPeopleViewController *)self tableView];
    [v10 reloadData];
  }

  [(HUAddPeopleViewController *)self updateStateDependentUI];
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5 = a4;
  [(HUAddPeopleViewController *)self updateStateDependentUI];
  id v6 = [(HUAddPeopleViewController *)self tintColorForRecipient:v5];
  id v7 = [(HUAddPeopleViewController *)self composeView];
  uint64_t v8 = [v7 atomViewForRecipient:v5];

  [v8 setTintColor:v6];
  __int16 v9 = [(HUAddPeopleViewController *)self statusQueryDebounceTimer];
  [v9 invalidate];

  [(HUAddPeopleViewController *)self lookupVisibleRecipients];
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  [a3 removeRecipient:a4];

  [(HUAddPeopleViewController *)self updateStateDependentUI];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F28B88];
  id v8 = a4;
  __int16 v9 = [v7 whitespaceCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

  if (![v10 length]) {
    goto LABEL_4;
  }
  uint64_t v11 = [(HUAddPeopleViewController *)self composeRecipientForAddress:v10];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = [(HUAddPeopleViewController *)self composeView];
    [v13 addRecipient:v12];

LABEL_4:
    [(HUAddPeopleViewController *)self setUnatomizedAddress:0];
    [v6 clearText];
    goto LABEL_8;
  }
  id v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v10;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Found unatomized address \"%@\"", (uint8_t *)&v15, 0xCu);
  }

  [(HUAddPeopleViewController *)self setUnatomizedAddress:v10];
LABEL_8:
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  id v5 = [(HUAddPeopleViewController *)self composeViewBottomConstraint];
  [v5 setConstant:height];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BB80]);
  id v5 = _HULocalizedStringWithDefaultValue(@"HUPeopleAddPeoplePickerPrompt", @"HUPeopleAddPeoplePickerPrompt", 1);
  [v4 setPrompt:v5];

  [v4 setDelegate:self];
  [v4 setAllowsCancel:1];
  [v4 setAllowsEditing:0];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"emailAddresses.@count > 0"];
  [v4 setPredicateForEnablingContact:v6];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"emailAddresses.@count == 1"];
  [v4 setPredicateForSelectionOfContact:v7];

  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"property == 'emailAddresses'"];
  [v4 setPredicateForSelectionOfProperty:v8];

  uint64_t v9 = *MEMORY[0x1E4F1AEE0];
  v12[0] = *MEMORY[0x1E4F1ADC8];
  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v4 setDisplayedPropertyKeys:v10];

  [v4 setModalPresentationStyle:2];
  uint64_t v11 = [(HUAddPeopleViewController *)self navigationController];
  [v11 presentViewController:v4 animated:1 completion:0];
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v3 = [(HUAddPeopleViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)contactController:(id)a3 didFinishDownloadingFamilyMemberAvatar:(id)a4
{
  id v16 = a4;
  if (![(HUAddPeopleViewController *)self showingAutoCompleteResults])
  {
    id v5 = [(HUAddPeopleViewController *)self familyMembersNotInHome];
    uint64_t v6 = [v5 indexOfObject:v16];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(HUAddPeopleViewController *)self tableView];
      id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:0];
      uint64_t v9 = [v7 cellForRowAtIndexPath:v8];

      uint64_t v10 = [(HUAddPeopleViewController *)self contactsController];
      uint64_t v11 = [v16 dsid];
      uint64_t v12 = [v10 contactForFamilyMemberWithDsid:v11];

      id v13 = (void *)MEMORY[0x1E4F42A80];
      id v14 = [v12 imageData];
      int v15 = [v13 imageWithData:v14];
      [v9 setPhoto:v15];
    }
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = [(HUAddPeopleViewController *)self composeView];
  [(HUAddPeopleViewController *)self composeRecipientViewDidFinishPickingRecipient:v4];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 emailAddresses];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [v5 emailAddresses];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v9 value];
    uint64_t v11 = 0;
  }
  else
  {
    id v8 = [v5 phoneNumbers];
    uint64_t v9 = [v8 firstObject];
    uint64_t v12 = [v9 value];
    uint64_t v10 = [v12 stringValue];

    uint64_t v11 = 1;
  }

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F350C8]) initWithContact:v5 address:v10 kind:v11];
  id v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Adding new recipient \"%@\" from contact %@", (uint8_t *)&v17, 0x16u);
  }

  int v15 = [(HUAddPeopleViewController *)self composeView];
  [v15 addRecipient:v13];

  id v16 = [(HUAddPeopleViewController *)self composeView];
  [(HUAddPeopleViewController *)self composeRecipientViewDidFinishPickingRecipient:v16];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 contact];
  uint64_t v7 = [v5 key];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v8)
  {
    uint64_t v9 = [v6 emailAddresses];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 value];
    uint64_t v12 = 0;
LABEL_5:

    goto LABEL_7;
  }
  id v13 = [v5 key];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v14)
  {
    uint64_t v9 = [v6 phoneNumbers];
    uint64_t v10 = [v9 firstObject];
    int v15 = [v10 value];
    uint64_t v11 = [v15 stringValue];

    uint64_t v12 = 1;
    goto LABEL_5;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 5;
LABEL_7:
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F350C8]) initWithContact:v6 address:v11 kind:v12];
  int v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Adding new recipient \"%@\" from contact %@", (uint8_t *)&v20, 0x16u);
  }

  id v18 = [(HUAddPeopleViewController *)self composeView];
  [v18 addRecipient:v16];

  __int16 v19 = [(HUAddPeopleViewController *)self composeView];
  [(HUAddPeopleViewController *)self composeRecipientViewDidFinishPickingRecipient:v19];
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HUAddPeopleViewController *)self lastSearchID];
  int v9 = [v7 isEqualToNumber:v8];

  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__HUAddPeopleViewController_consumeAutocompleteSearchResults_taskID___block_invoke;
    void v12[3] = &unk_1E638AB30;
    v12[4] = self;
    uint64_t v10 = objc_msgSend(v6, "na_filter:", v12);
    uint64_t v11 = [(HUAddPeopleViewController *)self additionalAutoCompleteResults];
    [v11 addObjectsFromArray:v10];

    [(HUAddPeopleViewController *)self setShowingAutoCompleteResults:1];
  }
}

uint64_t __69__HUAddPeopleViewController_consumeAutocompleteSearchResults_taskID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isGroup])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 address];
    id v6 = [*(id *)(a1 + 32) home];
    id v7 = [v6 currentUser];
    int v8 = [v7 userID];
    uint64_t v4 = [v5 isEqualToString:v8] ^ 1;
  }
  return v4;
}

- (void)finishedSearchingForAutocompleteResults
{
  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults]
    && ([(HUAddPeopleViewController *)self additionalAutoCompleteResults],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    id v5 = [(HUAddPeopleViewController *)self additionalAutoCompleteResults];
    id v6 = (void *)[v5 copy];
    [(HUAddPeopleViewController *)self setAutoCompleteResults:v6];

    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(HUAddPeopleViewController *)self setShowingAutoCompleteResults:v7];
  int v8 = [(HUAddPeopleViewController *)self tableView];
  [v8 reloadData];

  [(HUAddPeopleViewController *)self scheduleDelayedLookupVisibleRecipients];
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    int v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ Received IDS update for destinations: %@", buf, 0x20u);
  }
  if ([(HUAddPeopleViewController *)self _shouldCheckIDSCapabilities])
  {
    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      int v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Checking IDS capabilities...", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F6AB38] sharedInstance];
    int v14 = [v8 allKeys];
    int v15 = [(HUAddPeopleViewController *)self _getIDSServiceName];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
    v16[3] = &unk_1E638AB80;
    void v16[4] = self;
    SEL v18 = a2;
    id v17 = v8;
    [v13 currentRemoteDevicesForDestinations:v14 service:v15 listenerID:@"HomeUI" queue:MEMORY[0x1E4F14428] completionBlock:v16];
  }
  else
  {
    [(HUAddPeopleViewController *)self handleStatusQueryResults:v8];
  }
}

void __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v27 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Received IDS fetch result for current remote devices: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  id v29 = (id)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__14;
  SEL v18 = __Block_byref_object_dispose__14;
  id v19 = (id)objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke_160;
  v13[3] = &unk_1E638AB58;
  v13[4] = *(void *)(a1 + 32);
  v13[5] = &v14;
  uint64_t v7 = *(void *)(a1 + 48);
  v13[6] = buf;
  v13[7] = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v11 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)int v20 = 138412802;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Finished IDS capability checks. Updated destinations to status mapping : %@", v20, 0x20u);
  }
  uint64_t v12 = [*(id *)(a1 + 32) contactsController];
  [v12 restrictedGuestIDSCapabilityUpdated:v15[5]];

  [*(id *)(a1 + 32) handleStatusQueryResults:*(void *)(*(void *)&buf[8] + 40)];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(buf, 8);
}

void __92__HUAddPeopleViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _shouldCheckRestrictedGuestIDSCapability])
  {
    uint64_t v7 = [NSNumber numberWithBool:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v7 forKeyedSubscript:v5];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      uint64_t v12 = *MEMORY[0x1E4F6A950];
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "capabilities", (void)v20);
          uint64_t v15 = [v14 valueForCapability:v12];

          if (v15 == 1)
          {
            id v19 = [NSNumber numberWithBool:1];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v19 forKeyedSubscript:v5];

            goto LABEL_14;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      SEL v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@: %@ RG IDS capability check not passed. Updating status to INVALID for destination : %@", buf, 0x20u);
    }
    id v8 = [NSNumber numberWithUnsignedInt:2];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v8 forKeyedSubscript:v5];
LABEL_14:
  }
}

- (void)handleStatusQueryResults:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v35 = self;
    __int16 v36 = 2112;
    id v37 = v7;
    __int16 v38 = 2112;
    id v39 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Will handle status query results for destinations: %@", buf, 0x20u);
  }
  id v8 = [(HUAddPeopleViewController *)self contactsController];
  v27 = v5;
  [v8 entriesUpdated:v5];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [(HUAddPeopleViewController *)self composeView];
  uint64_t v10 = [v9 recipients];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = [(HUAddPeopleViewController *)self IDSDestinationForRecipient:v15];
        uint64_t v17 = [(HUAddPeopleViewController *)self contactsController];
        uint64_t v18 = [v17 statusForDestination:v16];

        id v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = [MEMORY[0x1E4F69088] stringForRecipientStatus:v18];
          *(_DWORD *)buf = 138412546;
          v35 = v16;
          __int16 v36 = 2112;
          id v37 = v20;
          _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Status of destination \"%@\" is \"%@\"", buf, 0x16u);
        }
        long long v21 = [(HUAddPeopleViewController *)self tintColorForRecipient:v15];
        long long v22 = [(HUAddPeopleViewController *)self composeView];
        long long v23 = [v22 atomViewForRecipient:v15];
        [v23 setTintColor:v21];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults])
  {
    __int16 v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "Updating search results...", buf, 2u);
    }

    uint64_t v25 = [(HUAddPeopleViewController *)self tableView];
    __int16 v26 = [v25 indexPathsForVisibleRows];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__HUAddPeopleViewController_handleStatusQueryResults___block_invoke;
    v28[3] = &unk_1E638ABA8;
    v28[4] = self;
    [v26 enumerateObjectsUsingBlock:v28];
  }
  if ([(HUAddPeopleViewController *)self state] == 1) {
    [(HUAddPeopleViewController *)self sendInvites];
  }
}

void __54__HUAddPeopleViewController_handleStatusQueryResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 tableView];
  id v10 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v10 recipient];

    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v10 recipient];
      uint64_t v9 = [v7 tintColorForRecipient:v8];
      [v10 setTintColor:v9 animated:1];
    }
  }
}

- (id)tintColorForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAddPeopleViewController *)self contactsController];
  id v6 = [(HUAddPeopleViewController *)self IDSDestinationForRecipient:v4];

  uint64_t v7 = [v5 statusForDestination:v6];
  if (v7 == 3) {
    [(HUAddPeopleViewController *)self effectiveTintColor];
  }
  else {
  id v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }

  return v8;
}

- (void)updateStateDependentUI
{
  unint64_t v3 = [(HUAddPeopleViewController *)self state];
  id v4 = [(HUAddPeopleViewController *)self spinner];
  id v5 = v4;
  if (!v3)
  {

    if (v5)
    {
      uint64_t v18 = [(HUAddPeopleViewController *)self spinner];
      [v18 stopAnimating];

      [(HUAddPeopleViewController *)self setSpinner:0];
      id v19 = objc_alloc(MEMORY[0x1E4F427C0]);
      long long v20 = [(HUAddPeopleViewController *)self rightBarButtonTitle];
      long long v21 = (void *)[v19 initWithTitle:v20 style:2 target:self action:sel_sendButtonPressed_];
      long long v22 = [(HUAddPeopleViewController *)self navigationItem];
      [v22 setRightBarButtonItem:v21];
    }
    long long v23 = [(HUAddPeopleViewController *)self composeView];
    __int16 v24 = [v23 textView];
    uint64_t v25 = [v24 text];
    __int16 v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v27 = [v25 stringByRemovingCharactersFromSet:v26];
    BOOL v28 = [v27 length] != 0;
    long long v29 = [(HUAddPeopleViewController *)self navigationItem];
    long long v30 = [v29 rightBarButtonItem];
    [v30 setEnabled:v28];

    long long v31 = [(HUAddPeopleViewController *)self navigationItem];
    long long v32 = [v31 leftBarButtonItem];
    [v32 setEnabled:1];

    v33 = [(HUAddPeopleViewController *)self tableView];
    [v33 setAllowsSelection:1];

    v34 = [(HUAddPeopleViewController *)self composeView];
    v35 = [v34 addButton];
    [v35 setEnabled:1];

    id v36 = [(HUAddPeopleViewController *)self composeView];
    [v36 setUserInteractionEnabled:1];
    goto LABEL_9;
  }

  if (!v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [(HUAddPeopleViewController *)self setSpinner:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v8 = [(HUAddPeopleViewController *)self spinner];
    uint64_t v9 = (void *)[v7 initWithCustomView:v8];
    id v10 = [(HUAddPeopleViewController *)self navigationItem];
    [v10 setRightBarButtonItem:v9];

    uint64_t v11 = [(HUAddPeopleViewController *)self spinner];
    [v11 startAnimating];
  }
  uint64_t v12 = [(HUAddPeopleViewController *)self tableView];
  [v12 setAllowsSelection:0];

  uint64_t v13 = [(HUAddPeopleViewController *)self composeView];
  uint64_t v14 = [v13 addButton];
  [v14 setEnabled:0];

  uint64_t v15 = [(HUAddPeopleViewController *)self composeView];
  [v15 setUserInteractionEnabled:0];

  uint64_t v16 = [(HUAddPeopleViewController *)self composeView];
  [v16 resignFirstResponder];

  if ([(HUAddPeopleViewController *)self state] >= 2)
  {
    id v36 = [(HUAddPeopleViewController *)self navigationItem];
    uint64_t v17 = [v36 leftBarButtonItem];
    [v17 setEnabled:0];

LABEL_9:
  }
}

- (id)rightBarButtonTitle
{
  if ([(HUAddPeopleViewController *)self viewContext]) {
    v2 = @"HUAddRestrictedGuest_NextButton";
  }
  else {
    v2 = @"HUPeopleSendInvite";
  }
  unint64_t v3 = _HULocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)requiredKeyDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1BB38] descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)IDSDestinationForRecipient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 uncommentedAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 address];
  }
  id v7 = v6;

  id v8 = IMStripFormattingFromAddress();
  if ([v3 kind] == 1)
  {
    uint64_t v9 = IDSCopyIDForPhoneNumber();
  }
  else
  {
    if ([v3 kind]) {
      goto LABEL_9;
    }
    uint64_t v9 = MEMORY[0x1C1897B50](v8);
  }
  id v10 = (void *)v9;

  id v8 = v10;
LABEL_9:

  return v8;
}

- (id)composeRecipientForAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAddPeopleViewController *)self requiredKeyDescriptors];
  if (!objc_msgSend(v4, "hf_isPhoneNumber"))
  {
    if (!objc_msgSend(v4, "hf_isEmail")) {
      goto LABEL_7;
    }
    id v6 = [MEMORY[0x1E4F69088] contactForEmailAddress:v4 keyDescriptors:v5];
    uint64_t v7 = 0;
    if (!v6) {
      goto LABEL_7;
    }
LABEL_6:
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F350C8]) initWithContact:v6 address:v4 kind:v7];

    goto LABEL_8;
  }
  id v6 = [MEMORY[0x1E4F69088] contactForPhoneNumber:v4 keyDescriptors:v5];
  uint64_t v7 = 1;
  if (v6) {
    goto LABEL_6;
  }
LABEL_7:
  id v8 = 0;
LABEL_8:

  return v8;
}

- (void)scheduleDelayedLookupVisibleRecipients
{
  id v3 = [(HUAddPeopleViewController *)self statusQueryDebounceTimer];
  [v3 invalidate];

  id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_lookupVisibleRecipients selector:0 userInfo:0 repeats:0.5];
  [(HUAddPeopleViewController *)self setStatusQueryDebounceTimer:v4];
}

- (void)lookupVisibleRecipients
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = [(HUAddPeopleViewController *)self composeView];
  id v5 = [v4 recipients];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(HUAddPeopleViewController *)self IDSDestinationForRecipient:*(void *)(*((void *)&v30 + 1) + 8 * v9)];
        if (v10)
        {
          uint64_t v11 = [(HUAddPeopleViewController *)self contactsController];
          uint64_t v12 = [v11 statusForDestination:v10];

          if (!v12) {
            objc_msgSend(v3, "na_safeAddObject:", v10);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  if ([(HUAddPeopleViewController *)self showingAutoCompleteResults])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = [(HUAddPeopleViewController *)self tableView];
    uint64_t v14 = [v13 indexPathsForVisibleRows];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * v18);
          long long v20 = [(HUAddPeopleViewController *)self autoCompleteResults];
          long long v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));

          long long v22 = [(HUAddPeopleViewController *)self IDSDestinationForRecipient:v21];
          if (v22)
          {
            long long v23 = [(HUAddPeopleViewController *)self contactsController];
            uint64_t v24 = [v23 statusForDestination:v22];

            if (!v24) {
              objc_msgSend(v3, "na_safeAddObject:", v22);
            }
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }
  }
  if ([v3 count])
  {
    uint64_t v25 = [v3 allObjects];
    [(HUAddPeopleViewController *)self lookupIDSDestinations:v25];
  }
}

- (void)lookupIDSDestinations:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUAddPeopleViewController *)self statusQueryController];

  if (v5)
  {
    uint64_t v6 = [(HUAddPeopleViewController *)self statusQueryController];
    [v6 invalidate];
  }
  uint64_t v7 = [(HUAddPeopleViewController *)self contactsController];
  [v7 markDestinationsPending:v4];

  uint64_t v8 = [(HUAddPeopleViewController *)self _getIDSServiceName];
  uint64_t v9 = [(HUAddPeopleViewController *)self contactsController];
  id v10 = [v9 pendingDestinations];

  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    long long v20 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Performing IDS lookup with service name %@ for destination(s): %@. allPendingDestinations = %@", (uint8_t *)&v15, 0x20u);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F6AAD8]);
  uint64_t v13 = (void *)[v12 initWithService:v8 delegate:self queue:MEMORY[0x1E4F14428]];
  [(HUAddPeopleViewController *)self setStatusQueryController:v13];

  uint64_t v14 = [(HUAddPeopleViewController *)self statusQueryController];
  [v14 setDestinations:v10];
}

- (id)recipientsWithStatusPassingTest:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, uint64_t))a3;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(HUAddPeopleViewController *)self composeView];
  uint64_t v6 = [v5 recipients];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [(HUAddPeopleViewController *)self contactsController];
        uint64_t v13 = [(HUAddPeopleViewController *)self IDSDestinationForRecipient:v11];
        uint64_t v14 = [v12 statusForDestination:v13];

        if (v4[2](v4, v14)) {
          [v18 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v18 count]) {
    int v15 = v18;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (void)sendInvites
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  [(HUAddPeopleViewController *)self setState:1];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUAddPeopleViewController *)self composeView];
    id v5 = [v4 recipients];
    *(_DWORD *)buf = 138412290;
    v60 = v5;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to send invitation(s) to recipients: %@", buf, 0xCu);
  }
  uint64_t v6 = [(HUAddPeopleViewController *)self recipientsWithStatusPassingTest:&__block_literal_global_112];
  uint64_t v7 = [(HUAddPeopleViewController *)self composeView];
  uint64_t v8 = [v7 recipients];
  BOOL v9 = [v8 count] == 0;

  if (v9)
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Failing send due to invalid recipients", buf, 2u);
    }

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 40);
    uint64_t v14 = [MEMORY[0x1E4F69110] sharedHandler];
    [v14 handleError:v13 operationType:*MEMORY[0x1E4F68768] options:0 retryBlock:0 cancelBlock:0];

    [(HUAddPeopleViewController *)self setState:0];
  }
  else if ([v6 count])
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v6;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "Failing send due to invalid recipient(s): %@", buf, 0xCu);
    }

    if ([(HUAddPeopleViewController *)self _shouldCheckRestrictedGuestIDSCapability])
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_180;
      v54[3] = &unk_1E638AB30;
      v54[4] = self;
      if (objc_msgSend(v6, "na_any:", v54)) {
        uint64_t v11 = 84;
      }
      else {
        uint64_t v11 = 40;
      }
    }
    else
    {
      uint64_t v11 = 40;
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", v11);
    long long v20 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v57 = *MEMORY[0x1E4F68420];
    long long v21 = [v6 firstObject];
    long long v22 = [v21 address];
    double v58 = v22;
    long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    [v20 handleError:v13 operationType:*MEMORY[0x1E4F68760] options:v23 retryBlock:0 cancelBlock:0];

    [(HUAddPeopleViewController *)self setState:0];
  }
  else
  {
    int v15 = [(HUAddPeopleViewController *)self unatomizedAddress];

    if (v15)
    {
      id v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v41 = [(HUAddPeopleViewController *)self unatomizedAddress];
        *(_DWORD *)buf = 138412290;
        v60 = v41;
        _os_log_error_impl(&dword_1BE345000, v16, OS_LOG_TYPE_ERROR, "Failing send due to invalid address: %@", buf, 0xCu);
      }
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 40);
      __int16 v17 = [MEMORY[0x1E4F69110] sharedHandler];
      uint64_t v55 = *MEMORY[0x1E4F68420];
      id v18 = [(HUAddPeopleViewController *)self unatomizedAddress];
      v56 = v18;
      long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      [v17 handleError:v13 operationType:*MEMORY[0x1E4F68760] options:v19 retryBlock:0 cancelBlock:0];

      [(HUAddPeopleViewController *)self setState:0];
    }
    else
    {
      uint64_t v13 = [(HUAddPeopleViewController *)self recipientsWithStatusPassingTest:&__block_literal_global_183_0];
      if ([v13 count])
      {
        uint64_t v24 = HFLogForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v13;
          _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "Delaying send due to pending lookups: %@", buf, 0xCu);
        }
      }
      else
      {
        [(HUAddPeopleViewController *)self setState:2];
        uint64_t v25 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        long long v26 = [(HUAddPeopleViewController *)self composeView];
        long long v27 = [v26 recipients];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_184;
        v52[3] = &unk_1E638ABF0;
        uint64_t v24 = v25;
        v53 = v24;
        long long v28 = objc_msgSend(v27, "na_map:", v52);

        if ([(HUAddPeopleViewController *)self viewContext] == 1)
        {
          long long v29 = [(HUAddPeopleViewController *)self delegate];
          char v30 = objc_opt_respondsToSelector();

          if (v30)
          {
            long long v31 = [(HUAddPeopleViewController *)self delegate];
            [v31 didSelectPeopleForInvite:self inviteeAddresses:v28];
          }
          [(HUAddPeopleViewController *)self setRequiresPresentingViewControllerDismissal:0];
          long long v32 = [(HUAddPeopleViewController *)self presentationDelegate];
          id v33 = (id)[v32 finishPresentation:self animated:1];
        }
        else
        {
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2;
          v51[3] = &unk_1E6389F30;
          v51[4] = self;
          v34 = objc_msgSend(v28, "na_map:", v51);
          v35 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v34];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_196;
          v48[3] = &unk_1E6388C28;
          id v36 = v28;
          id v49 = v36;
          v50 = self;
          id v37 = [v35 flatMap:v48];

          objc_initWeak((id *)buf, self);
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2_205;
          v46[3] = &unk_1E638AC40;
          objc_copyWeak(&v47, (id *)buf);
          id v38 = (id)[v37 addCompletionBlock:v46];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_3;
          v44[3] = &unk_1E6386708;
          id v45 = v36;
          id v39 = (id)[v37 addFailureBlock:v44];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_4;
          v42[3] = &unk_1E6386408;
          objc_copyWeak(&v43, (id *)buf);
          id v40 = (id)[v37 addSuccessBlock:v42];
          objc_destroyWeak(&v43);

          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
}

BOOL __40__HUAddPeopleViewController_sendInvites__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 2;
}

uint64_t __40__HUAddPeopleViewController_sendInvites__block_invoke_180(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 contactsController];
  uint64_t v6 = [*(id *)(a1 + 32) IDSDestinationForRecipient:v4];

  uint64_t v7 = [v5 hasRestrictedGuestIDSCapabilityForDestination:v6] ^ 1;
  return v7;
}

BOOL __40__HUAddPeopleViewController_sendInvites__block_invoke_181(uint64_t a1, uint64_t a2)
{
  return a2 == 1;
}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_184(uint64_t a1, void *a2)
{
  id v3 = [a2 address];
  id v4 = [*(id *)(a1 + 32) invertedSet];
  id v5 = [v3 stringByRemovingCharactersFromSet:v4];

  return v5;
}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 outgoingInvitations];

  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v3;
    __int16 v31 = 2112;
    long long v32 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_INFO, "Attempting to remove existing invitations that match address %@. Invitations: %@", buf, 0x16u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [v12 invitee];
        uint64_t v14 = [v13 userID];
        char v15 = [v3 isEqualToString:v14];

        if (v15)
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_189;
          v23[3] = &unk_1E6385090;
          v23[4] = v12;
          __int16 v17 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v23];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2_191;
          v22[3] = &unk_1E6386708;
          void v22[4] = v12;
          id v18 = [v17 addFailureBlock:v22];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_193;
          v20[3] = &unk_1E6387DC8;
          id v21 = v3;
          id v16 = [v18 addSuccessBlock:v20];

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

uint64_t __40__HUAddPeopleViewController_sendInvites__block_invoke_189(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelInviteWithCompletionHandler:a2];
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_2_191(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Removing existing invitation failed: %@ invitation: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_193(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_INFO, "Successfully removed existing invitation for %@", (uint8_t *)&v4, 0xCu);
  }
}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_196(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HUAddPeopleViewController_sendInvites__block_invoke_2_197;
  v7[3] = &unk_1E638AC18;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v5 = [v2 futureWithCompletionHandlerAdapterBlock:v7];

  return v5;
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_2_197(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Sending invitation(s) to address(es): %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_201);
  id v7 = [*(id *)(a1 + 40) home];
  [v7 inviteUsersWithInviteInformation:v6 completionHandler:v3];
}

id __40__HUAddPeopleViewController_sendInvites__block_invoke_198(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2EBB8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithUser:v3 administrator:0 remoteAccess:1];

  return v4;
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_2_205(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:0];
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_3(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 count];
  uint64_t v6 = (id *)MEMORY[0x1E4F68760];
  if (v5 != 1) {
    uint64_t v6 = (id *)MEMORY[0x1E4F68768];
  }
  id v7 = (void *)MEMORY[0x1E4F69110];
  id v8 = *v6;
  uint64_t v9 = [v7 sharedHandler];
  uint64_t v12 = *MEMORY[0x1E4F68420];
  uint64_t v10 = [*(id *)(a1 + 32) firstObject];
  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v9 handleError:v4 operationType:v8 options:v11 retryBlock:0 cancelBlock:0];
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __40__HUAddPeopleViewController_sendInvites__block_invoke_5;
    char v15 = &unk_1E6387408;
    id v16 = WeakRetained;
    id v6 = v3;
    id v17 = v6;
    [v5 dispatchHomeObserverMessage:&v12 sender:0];

    id v7 = objc_msgSend(WeakRetained, "delegate", v12, v13, v14, v15, v16);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [WeakRetained delegate];
      [v9 addPeopleViewController:WeakRetained didSendInvitations:v6];
    }
  }
  [WeakRetained setRequiresPresentingViewControllerDismissal:1];
  uint64_t v10 = [WeakRetained presentationDelegate];
  id v11 = (id)[v10 finishPresentation:WeakRetained animated:1];
}

void __40__HUAddPeopleViewController_sendInvites__block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateStateForOutgoingInvitations:*(void *)(a1 + 40)];
  }
}

- (BOOL)_shouldCheckRestrictedGuestIDSCapability
{
  return [(HUAddPeopleViewController *)self viewContext] == 1;
}

- (BOOL)_shouldCheckIDSCapabilities
{
  return [(HUAddPeopleViewController *)self viewContext] == 1;
}

- (id)_getIDSServiceName
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v3 = [v2 homeManager];
  int v4 = [v3 hasOptedToHH2];

  if (v4) {
    return @"com.apple.private.alloy.home.invite";
  }
  else {
    return @"com.apple.private.alloy.willow";
  }
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->requiresPresentingViewControllerDismissal = a3;
}

- (HUAddPeopleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAddPeopleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)viewContext
{
  return self->_viewContext;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (MFComposeRecipientTextView)composeView
{
  return self->_composeView;
}

- (void)setComposeView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSLayoutConstraint)composeViewBottomConstraint
{
  return self->_composeViewBottomConstraint;
}

- (void)setComposeViewBottomConstraint:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIColor)effectiveTintColor
{
  return self->_effectiveTintColor;
}

- (void)setEffectiveTintColor:(id)a3
{
}

- (BOOL)addressBookAccessDenied
{
  return self->_addressBookAccessDenied;
}

- (void)setAddressBookAccessDenied:(BOOL)a3
{
  self->_addressBookAccessDenied = a3;
}

- (HFContactController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
}

- (void)setSearchManager:(id)a3
{
}

- (NSNumber)lastSearchID
{
  return self->_lastSearchID;
}

- (void)setLastSearchID:(id)a3
{
}

- (BOOL)showingAutoCompleteResults
{
  return self->_showingAutoCompleteResults;
}

- (void)setShowingAutoCompleteResults:(BOOL)a3
{
  self->_showingAutoCompleteResults = a3;
}

- (NSArray)autoCompleteResults
{
  return self->_autoCompleteResults;
}

- (void)setAutoCompleteResults:(id)a3
{
}

- (NSMutableArray)additionalAutoCompleteResults
{
  return self->_additionalAutoCompleteResults;
}

- (void)setAdditionalAutoCompleteResults:(id)a3
{
}

- (NSArray)familyMembersNotInHome
{
  return self->_familyMembersNotInHome;
}

- (void)setFamilyMembersNotInHome:(id)a3
{
}

- (NSString)unatomizedAddress
{
  return self->_unatomizedAddress;
}

- (void)setUnatomizedAddress:(id)a3
{
}

- (NSTimer)statusQueryDebounceTimer
{
  return self->_statusQueryDebounceTimer;
}

- (void)setStatusQueryDebounceTimer:(id)a3
{
}

- (IDSBatchIDQueryController)statusQueryController
{
  return self->_statusQueryController;
}

- (void)setStatusQueryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusQueryController, 0);
  objc_storeStrong((id *)&self->_statusQueryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_unatomizedAddress, 0);
  objc_storeStrong((id *)&self->_familyMembersNotInHome, 0);
  objc_storeStrong((id *)&self->_additionalAutoCompleteResults, 0);
  objc_storeStrong((id *)&self->_autoCompleteResults, 0);
  objc_storeStrong((id *)&self->_lastSearchID, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong((id *)&self->_effectiveTintColor, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_composeViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_composeView, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end