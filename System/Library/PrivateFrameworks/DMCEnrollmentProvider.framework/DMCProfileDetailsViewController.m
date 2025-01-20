@interface DMCProfileDetailsViewController
- (BOOL)shouldShowWarningText;
- (BOOL)showTitleIfOnlyOneSection;
- (BOOL)viewControllerCanPop;
- (DMCProfileDetailsViewController)initWithProfileViewModel:(id)a3;
- (DMCProfileDetailsViewController)initWithProfileViewModel:(id)a3 mode:(int)a4;
- (DMCProfileViewModel)profileViewModel;
- (NSArray)sections;
- (NSString)tableTitle;
- (double)tableViewBottomInset;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonTapped:(id)a3;
- (void)_profileChanged:(id)a3;
- (void)_reloadTable:(id)a3;
- (void)_setup;
- (void)_updateStateForCurrentMode;
- (void)dealloc;
- (void)reloadSectionArray;
- (void)setMode:(int)a3;
- (void)setProfileDetailsMode:(int)a3;
- (void)setProfileViewModel:(id)a3;
- (void)setProfileViewModel:(id)a3 mode:(int)a4;
- (void)setSections:(id)a3;
- (void)setShouldShowWarningText:(BOOL)a3;
- (void)setShowTitleIfOnlyOneSection:(BOOL)a3;
- (void)setTableTitle:(id)a3;
- (void)setTableViewBottomInset:(double)a3;
- (void)setViewControllerCanPop:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DMCProfileDetailsViewController

- (DMCProfileDetailsViewController)initWithProfileViewModel:(id)a3
{
  return [(DMCProfileDetailsViewController *)self initWithProfileViewModel:a3 mode:0];
}

- (DMCProfileDetailsViewController)initWithProfileViewModel:(id)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMCProfileDetailsViewController;
  v7 = [(DMCProfileTableViewController *)&v10 initWithStyle:2];
  v8 = v7;
  if (v7)
  {
    [(DMCProfileDetailsViewController *)v7 _setup];
    [(DMCProfileDetailsViewController *)v8 setProfileViewModel:v6 mode:v4];
  }

  return v8;
}

- (void)_setup
{
  self->_showTitleIfOnlyOneSection = 1;
  v3 = [(DMCProfileDetailsViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[DMCProfileDetailsCell cellIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  id v6 = [(DMCProfileDetailsViewController *)self tableView];
  uint64_t v7 = objc_opt_class();
  v8 = +[DMCProfileInfoTextCell cellIdentifier];
  [v6 registerClass:v7 forCellReuseIdentifier:v8];

  v9 = [(DMCProfileDetailsViewController *)self tableView];
  uint64_t v10 = objc_opt_class();
  v11 = +[DMCProfileTitleTextCell cellIdentifier];
  [v9 registerClass:v10 forCellReuseIdentifier:v11];

  v15.receiver = self;
  v15.super_class = (Class)DMCProfileDetailsViewController;
  [(DMCProfileTableViewController *)&v15 updateExtendedLayoutIncludesOpaqueBars];
  v14.receiver = self;
  v14.super_class = (Class)DMCProfileDetailsViewController;
  [(DMCProfileTableViewController *)&v14 reloadTableOnContentSizeCategoryChange];
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__profileChanged_ name:@"kMCUIProfileDidChangeNotification" object:0];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__reloadTable_ name:@"kMCUIBridgeIconLoadedNotification" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCProfileDetailsViewController;
  [(DMCProfileDetailsViewController *)&v6 viewWillAppear:a3];
  uint64_t v4 = [(DMCProfileDetailsViewController *)self tableView];
  [v4 layoutIfNeeded];

  v5 = [(DMCProfileDetailsViewController *)self tableView];
  [v5 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMCProfileDetailsViewController;
  [(DMCProfileDetailsViewController *)&v9 viewDidAppear:a3];
  [(DMCProfileDetailsViewController *)self setViewControllerCanPop:1];
  uint64_t v4 = [(DMCProfileDetailsViewController *)self sections];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__DMCProfileDetailsViewController_viewDidAppear___block_invoke;
    v6[3] = &unk_2645E9398;
    objc_copyWeak(&v7, &location);
    dispatch_async(MEMORY[0x263EF83A0], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__DMCProfileDetailsViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained navigationController];
    id v3 = (id)[v2 popViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMCProfileDetailsViewController;
  [(DMCProfileDetailsViewController *)&v4 viewWillDisappear:a3];
  [(DMCProfileDetailsViewController *)self setViewControllerCanPop:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileDetailsViewController;
  [(DMCProfileTableViewController *)&v4 dealloc];
}

- (void)_profileChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__DMCProfileDetailsViewController__profileChanged___block_invoke;
  v3[3] = &unk_2645E9398;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __51__DMCProfileDetailsViewController__profileChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained reloadSectionArray];
    v2 = [v7 sections];
    uint64_t v3 = [v2 count];

    if (v3)
    {
      id v4 = [v7 tableView];
      [v4 reloadData];
    }
    else
    {
      if (![v7 viewControllerCanPop]) {
        goto LABEL_7;
      }
      id v4 = [v7 navigationController];
      id v5 = (id)[v4 popViewControllerAnimated:1];
    }
  }
LABEL_7:
  return MEMORY[0x270F9A758]();
}

- (void)_reloadTable:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__DMCProfileDetailsViewController__reloadTable___block_invoke;
  v3[3] = &unk_2645E9398;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__DMCProfileDetailsViewController__reloadTable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained tableView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

- (void)setProfileDetailsMode:(int)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(DMCProfileDetailsViewController *)self _updateStateForCurrentMode];
  }
}

- (void)setProfileViewModel:(id)a3
{
  id v5 = (DMCProfileViewModel *)a3;
  p_profileViewModel = &self->_profileViewModel;
  if (self->_profileViewModel != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_profileViewModel, a3);
    p_profileViewModel = (DMCProfileViewModel **)[(DMCProfileDetailsViewController *)self _updateStateForCurrentMode];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_profileViewModel, v5);
}

- (void)setProfileViewModel:(id)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(DMCProfileDetailsViewController *)self setProfileViewModel:a3];
  [(DMCProfileDetailsViewController *)self setProfileDetailsMode:v4];
}

- (void)setTableViewBottomInset:(double)a3
{
  if (self->_tableViewBottomInset != a3)
  {
    self->_double tableViewBottomInset = a3;
    uint64_t v4 = [(DMCProfileDetailsViewController *)self tableView];
    [v4 contentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    double tableViewBottomInset = self->_tableViewBottomInset;
    id v12 = [(DMCProfileDetailsViewController *)self tableView];
    objc_msgSend(v12, "setContentInset:", v6, v8, tableViewBottomInset, v10);
  }
}

- (void)reloadSectionArray
{
  switch(self->_mode)
  {
    case 0:
      id v3 = [(DMCProfileDetailsViewController *)self profileViewModel];
      uint64_t v4 = [v3 moreDetailsSections];
      goto LABEL_8;
    case 1:
      double v5 = [(DMCProfileDetailsViewController *)self profileViewModel];
      double v6 = [v5 byodInfoSections];
      double v7 = (void *)[v6 mutableCopy];

      double v8 = [(DMCProfileDetailsViewController *)self profileViewModel];
      double v9 = [v8 moreDetailsSections];
      [v7 addObjectsFromArray:v9];

      double v10 = (NSArray *)[v7 copy];
      sections = self->_sections;
      self->_sections = v10;

      break;
    case 2:
      id v3 = [(DMCProfileDetailsViewController *)self profileViewModel];
      uint64_t v4 = [v3 accountSections];
      goto LABEL_8;
    case 3:
      id v3 = [(DMCProfileDetailsViewController *)self profileViewModel];
      uint64_t v4 = [v3 managedAppSections];
      goto LABEL_8;
    case 4:
      id v3 = [(DMCProfileDetailsViewController *)self profileViewModel];
      uint64_t v4 = [v3 managedBookSections];
      goto LABEL_8;
    case 5:
      id v3 = [(DMCProfileDetailsViewController *)self profileViewModel];
      uint64_t v4 = [v3 restrictionSections];
LABEL_8:
      id v12 = self->_sections;
      self->_sections = v4;

      break;
    case 6:
      uint64_t v13 = 6;
      goto LABEL_11;
    case 7:
      uint64_t v13 = 7;
LABEL_11:
      NSLog(&cfstr_Dmcprofiledeta_0.isa, a2, v13);
      break;
    default:
      break;
  }
  id v14 = [(DMCProfileDetailsViewController *)self tableView];
  [v14 reloadData];
}

- (void)_updateStateForCurrentMode
{
  switch(self->_mode)
  {
    case 0:
      id v3 = [(DMCProfileDetailsViewController *)self profileViewModel];
      uint64_t v4 = [v3 profile];
      double v5 = [v4 friendlyName];
      double v6 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v6 setTitle:v5];

      double v7 = [(DMCProfileDetailsViewController *)self profileViewModel];
      double v8 = [v7 moreDetailsSections];
      sections = self->_sections;
      self->_sections = v8;

      self->_showTitleIfOnlyOneSection = 1;
      break;
    case 1:
      double v10 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v10 setTitle:0];

      id v11 = objc_alloc(MEMORY[0x263F1C468]);
      id v12 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_DONE");
      uint64_t v13 = (void *)[v11 initWithTitle:v12 style:2 target:self action:sel__doneButtonTapped_];

      id v14 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v14 setRightBarButtonItem:v13];

      objc_super v15 = [(DMCProfileDetailsViewController *)self profileViewModel];
      v16 = [v15 moreDetailsSections];
      v17 = self->_sections;
      self->_sections = v16;

      self->_showTitleIfOnlyOneSection = 1;
      self->_shouldShowWarningText = 1;

      break;
    case 2:
      v18 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_ACCOUNTS");
      v19 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v19 setTitle:v18];

      v20 = [(DMCProfileDetailsViewController *)self profileViewModel];
      v21 = [v20 accountSections];
      goto LABEL_8;
    case 3:
      v22 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_APPS");
      v23 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v23 setTitle:v22];

      v20 = [(DMCProfileDetailsViewController *)self profileViewModel];
      v21 = [v20 managedAppSections];
      goto LABEL_8;
    case 4:
      v24 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_BOOKS");
      v25 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v25 setTitle:v24];

      v20 = [(DMCProfileDetailsViewController *)self profileViewModel];
      v21 = [v20 managedBookSections];
      goto LABEL_8;
    case 5:
      v26 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_RESTRICTIONS");
      v27 = [(DMCProfileDetailsViewController *)self navigationItem];
      [v27 setTitle:v26];

      v20 = [(DMCProfileDetailsViewController *)self profileViewModel];
      v21 = [v20 restrictionSections];
LABEL_8:
      v28 = self->_sections;
      self->_sections = v21;

      self->_showTitleIfOnlyOneSection = 0;
      break;
    case 6:
      uint64_t v29 = 6;
      goto LABEL_11;
    case 7:
      uint64_t v29 = 7;
LABEL_11:
      NSLog(&cfstr_Dmcprofiledeta_1.isa, a2, v29);
      break;
    default:
      break;
  }
  id v30 = [(DMCProfileDetailsViewController *)self tableView];
  [v30 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v4 = [(DMCProfileDetailsViewController *)self sections];
  int64_t v5 = [v4 count];
  double v6 = [(DMCProfileDetailsViewController *)self tableTitle];
  if ([v6 length]) {
    ++v5;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v6 = [(DMCProfileDetailsViewController *)self tableTitle];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if (!a4) {
      goto LABEL_13;
    }
    --a4;
  }
  double v8 = [(DMCProfileDetailsViewController *)self sections];
  if (a4 >= (unint64_t)[v8 count]) {
    goto LABEL_11;
  }
  if ([(DMCProfileDetailsViewController *)self showTitleIfOnlyOneSection])
  {

LABEL_8:
    id v11 = [(DMCProfileDetailsViewController *)self sections];
    double v8 = [v11 objectAtIndex:a4];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      a4 = [v8 sectionTitle];
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    a4 = 0;
    goto LABEL_12;
  }
  double v9 = [(DMCProfileDetailsViewController *)self sections];
  unint64_t v10 = [v9 count];

  if (v10 >= 2) {
    goto LABEL_8;
  }
  a4 = 0;
LABEL_13:
  return (id)a4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  double v6 = [(DMCProfileDetailsViewController *)self tableTitle];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if (!a4) {
      goto LABEL_12;
    }
    --a4;
  }
  double v8 = [(DMCProfileDetailsViewController *)self sections];
  if (a4 >= (unint64_t)[v8 count]) {
    goto LABEL_9;
  }
  BOOL v9 = [(DMCProfileDetailsViewController *)self shouldShowWarningText];

  if (v9)
  {
    unint64_t v10 = [(DMCProfileDetailsViewController *)self sections];
    double v8 = [v10 objectAtIndex:a4];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      a4 = [v8 sectionFooter];
LABEL_10:

      goto LABEL_12;
    }
LABEL_9:
    a4 = 0;
    goto LABEL_10;
  }
  a4 = 0;
LABEL_12:
  return (id)a4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v6 = [(DMCProfileDetailsViewController *)self tableTitle];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if (!a4) {
      return 1;
    }
    --a4;
  }
  double v8 = [(DMCProfileDetailsViewController *)self sections];
  unint64_t v9 = [v8 count];

  if (a4 >= v9) {
    return 0;
  }
  unint64_t v10 = [(DMCProfileDetailsViewController *)self sections];
  id v11 = [v10 objectAtIndex:a4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v11 payloadViewModels];
    int64_t v13 = [v12 count];
  }
  else
  {
    objc_opt_class();
    int64_t v13 = objc_opt_isKindOfClass() & 1;
  }

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(DMCProfileDetailsViewController *)self tableTitle];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
LABEL_4:
    unint64_t v11 = [v7 section];
    id v12 = [(DMCProfileDetailsViewController *)self sections];
    unint64_t v13 = [v12 count];

    if (v11 < v13)
    {
      id v14 = [(DMCProfileDetailsViewController *)self sections];
      objc_super v15 = [v14 objectAtIndex:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = +[DMCProfileDetailsCell cellIdentifier];
        v17 = [v6 dequeueReusableCellWithIdentifier:v16 forIndexPath:v7];

        id v18 = [v15 payloadViewModels];
        v19 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row"));
        [v17 setDetails:v19];
LABEL_15:

        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = +[DMCProfileInfoTextCell cellIdentifier];
        v17 = [v6 dequeueReusableCellWithIdentifier:v21 forIndexPath:v7];

        id v18 = v15;
        v22 = [v18 sectionAttributedText];
        uint64_t v23 = [v22 length];

        if (v23)
        {
          v24 = [v18 sectionAttributedText];
          [v17 setAttributedText:v24];
        }
        else
        {
          v24 = [v18 sectionText];
          [v17 setText:v24];
        }

        [v17 setUserInteractionEnabled:0];
        v19 = [v6 backgroundColor];
        [v17 setBackgroundColor:v19];
        goto LABEL_15;
      }
    }
    v26.receiver = self;
    v26.super_class = (Class)DMCProfileDetailsViewController;
    v17 = [(DMCProfileDetailsViewController *)&v26 tableView:v6 cellForRowAtIndexPath:v7];
    goto LABEL_17;
  }
  if ([v7 section])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section") - 1);

    id v7 = (id)v10;
    goto LABEL_4;
  }
  v20 = +[DMCProfileTitleTextCell cellIdentifier];
  v17 = [v6 dequeueReusableCellWithIdentifier:v20 forIndexPath:v7];

  objc_super v15 = [(DMCProfileDetailsViewController *)self tableTitle];
  [v17 setText:v15];
LABEL_16:

LABEL_17:
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v39 = a4;
  int64_t v5 = [(DMCProfileDetailsViewController *)self tableTitle];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    if (![v39 section]) {
      goto LABEL_27;
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v39, "row"), objc_msgSend(v39, "section") - 1);

    double v8 = (void *)v7;
  }
  else
  {
    double v8 = v39;
  }
  id v39 = v8;
  unint64_t v9 = [v8 section];
  uint64_t v10 = [(DMCProfileDetailsViewController *)self sections];
  unint64_t v11 = [v10 count];

  if (v9 < v11)
  {
    id v12 = [(DMCProfileDetailsViewController *)self sections];
    unint64_t v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v39, "section"));

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    id v14 = [v13 payloadViewModels];
    objc_super v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v39, "row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = v15;
      v17 = v16;
      if (!v16) {
        goto LABEL_25;
      }
      if ([(__CFString *)v16 isCertificate]
        && ([(__CFString *)v17 certificateProperties],
            id v18 = objc_claimAutoreleasedReturnValue(),
            v18,
            v18))
      {
        v19 = [DMCCertificateDetailsViewController alloc];
        v20 = [(__CFString *)v17 certificateProperties];
        v21 = [(DMCCertificateDetailsViewController *)v19 initWithCertificateProperties:v20];

        v22 = [(__CFString *)v17 friendlyName];
        uint64_t v23 = [(DMCPayloadDetailsViewController *)v21 navigationItem];
        [v23 setTitle:v22];
      }
      else
      {
        if ([(__CFString *)v17 isManagedAppPayload])
        {
          v25 = [DMCManagedMediaViewController alloc];
          v22 = [(DMCProfileDetailsViewController *)self profileViewModel];
          uint64_t v23 = [(__CFString *)v17 managedApp];
          uint64_t v26 = [(DMCManagedMediaViewController *)v25 initWithProfileViewModel:v22 managedApp:v23];
        }
        else
        {
          if (![(__CFString *)v17 isManagedBookPayload])
          {
            if (![(__CFString *)v17 hasDetails]) {
              goto LABEL_25;
            }
            v21 = [[DMCPayloadDetailsViewController alloc] initWithPayloadViewModel:v17];
            if (!v21) {
              goto LABEL_25;
            }
            goto LABEL_24;
          }
          v27 = [DMCManagedMediaViewController alloc];
          v22 = [(DMCProfileDetailsViewController *)self profileViewModel];
          uint64_t v23 = [(__CFString *)v17 managedBook];
          uint64_t v26 = [(DMCManagedMediaViewController *)v27 initWithProfileViewModel:v22 managedBook:v23];
        }
        v21 = (DMCPayloadDetailsViewController *)v26;
      }
    }
    else
    {
      if (!v15)
      {
        v17 = 0;
        goto LABEL_25;
      }
      v21 = [[DMCCertificateDetailsViewController alloc] initWithCertificate:v15];
      v17 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)v15);
      if (v17)
      {
        v24 = [(DMCPayloadDetailsViewController *)v21 navigationItem];
        [v24 setTitle:v17];

        CFRelease(v17);
        v17 = 0;
        if (!v21) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
    }
    if (v21)
    {
LABEL_24:
      v28 = [(DMCPayloadDetailsViewController *)v21 tableView];
      [v28 contentInset];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;

      [(DMCProfileDetailsViewController *)self tableViewBottomInset];
      double v36 = v35;
      v37 = [(DMCPayloadDetailsViewController *)v21 tableView];
      objc_msgSend(v37, "setContentInset:", v30, v32, v36, v34);

      v38 = [(DMCProfileDetailsViewController *)self navigationController];
      [v38 pushViewController:v21 animated:1];
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:
}

- (void)_doneButtonTapped:(id)a3
{
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (double)tableViewBottomInset
{
  return self->_tableViewBottomInset;
}

- (NSString)tableTitle
{
  return self->_tableTitle;
}

- (void)setTableTitle:(id)a3
{
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (BOOL)showTitleIfOnlyOneSection
{
  return self->_showTitleIfOnlyOneSection;
}

- (void)setShowTitleIfOnlyOneSection:(BOOL)a3
{
  self->_showTitleIfOnlyOneSection = a3;
}

- (BOOL)viewControllerCanPop
{
  return self->_viewControllerCanPop;
}

- (void)setViewControllerCanPop:(BOOL)a3
{
  self->_viewControllerCanPop = a3;
}

- (BOOL)shouldShowWarningText
{
  return self->_shouldShowWarningText;
}

- (void)setShouldShowWarningText:(BOOL)a3
{
  self->_shouldShowWarningText = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_profileViewModel, 0);
  objc_storeStrong((id *)&self->_tableTitle, 0);
}

@end