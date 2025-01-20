@interface DMCProfileViewController
- (BOOL)_delegateCanPoll;
- (BOOL)_delegateCanRemove;
- (BOOL)_delegateCanUpdate;
- (BOOL)_isSectionPopulated:(int64_t)a3;
- (BOOL)_profileContainsDeclarationsPayload;
- (BOOL)_profileContainsMDMPayload;
- (BOOL)_profileContainsPayloadClass:(Class)a3;
- (BOOL)_shouldShowRemoveButton;
- (BOOL)_shouldShowUpdateButton;
- (BOOL)_showManagedPayloads;
- (BOOL)installComplete;
- (BOOL)profileRemovable;
- (DMCProfileUIDataProvider)profileUIDataProvider;
- (DMCProfileViewController)initWithMDMProfileForRMAccount;
- (DMCProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4;
- (DMCProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4 profileUIDataProvider:(id)a5;
- (DMCProfileViewControllerDelegate)profileViewControllerDelegate;
- (DMCProfileViewModel)UIProfile;
- (RMConfigurationsSpecifierProvider)rmSpecifierProvider;
- (RMConfigurationsSpecifierProvider)rmSpecifierProviderUserScope;
- (double)_heightForHeaderFooterInSection:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_emptyViewForHeaderFooter;
- (id)_tableView:(id)a3 buttonForRowAtIndexPath:(id)a4 text:(id)a5 color:(id)a6;
- (id)_tableView:(id)a3 elevatedPayloadCellForRowAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 profileCellForRowAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 profileMoreDetailsCellForRowAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 removeButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)_profileDetailsModeForElevatedPayloadAtIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)profileViewMode;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_profileExpiryForProfile:(id)a3;
- (unint64_t)installProfileSource;
- (unint64_t)profileExpiry;
- (unint64_t)rmConfigurationsCount;
- (unint64_t)rmConfigurationsCountUserScope;
- (void)_poll;
- (void)_removeProfile;
- (void)_rmConfigsChanged:(id)a3;
- (void)_setup;
- (void)_setupRMConfigurationsUI;
- (void)_tableChanged:(id)a3;
- (void)_updateProfile;
- (void)setInstallComplete:(BOOL)a3;
- (void)setInstallProfileSource:(unint64_t)a3;
- (void)setProfile:(id)a3;
- (void)setProfileExpiry:(unint64_t)a3;
- (void)setProfileRemovable:(BOOL)a3;
- (void)setProfileUIDataProvider:(id)a3;
- (void)setProfileViewControllerDelegate:(id)a3;
- (void)setProfileViewMode:(int64_t)a3;
- (void)setRmConfigurationsCount:(unint64_t)a3;
- (void)setRmConfigurationsCountUserScope:(unint64_t)a3;
- (void)setRmSpecifierProvider:(id)a3;
- (void)setRmSpecifierProviderUserScope:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCProfileViewController

- (DMCProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [(DMCProfileViewController *)self initWithProfile:v6 viewMode:a4 profileUIDataProvider:v7];

  return v8;
}

- (DMCProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4 profileUIDataProvider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DMCProfileViewController;
  v10 = [(DMCProfileTableViewController *)&v13 initWithStyle:2];
  v11 = v10;
  if (v10)
  {
    v10->_profileViewMode = a4;
    objc_storeStrong((id *)&v10->_profileUIDataProvider, a5);
    [(DMCProfileViewController *)v11 _setup];
    [(DMCProfileViewController *)v11 setProfile:v8];
  }

  return v11;
}

- (DMCProfileViewController)initWithMDMProfileForRMAccount
{
  v3 = (DMCProfileUIDataProvider *)objc_opt_new();
  profileUIDataProvider = self->_profileUIDataProvider;
  self->_profileUIDataProvider = v3;

  v5 = [(DMCProfileUIDataProvider *)self->_profileUIDataProvider installedMDMProfileIdentifier];
  id v6 = [(DMCProfileUIDataProvider *)self->_profileUIDataProvider installedProfileWithIdentifier:v5];
  v7 = [(DMCProfileViewController *)self initWithProfile:v6 viewMode:0 profileUIDataProvider:self->_profileUIDataProvider];

  return v7;
}

- (void)_setup
{
  v14.receiver = self;
  v14.super_class = (Class)DMCProfileViewController;
  [(DMCProfileTableViewController *)&v14 updateExtendedLayoutIncludesOpaqueBars];
  [(DMCProfileViewController *)self setEdgesForExtendedLayout:15];
  v3 = [(DMCProfileViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[DMCProfileSummaryCell cellIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  id v6 = [(DMCProfileViewController *)self tableView];
  uint64_t v7 = objc_opt_class();
  id v8 = +[DMCProfileDetailsSummaryCell cellIdentifier];
  [v6 registerClass:v7 forCellReuseIdentifier:v8];

  id v9 = [(DMCProfileViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMCUIProfileMoreDetailsCellID"];

  v10 = [(DMCProfileViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMCUIElevatedPayloadCellID"];

  v11 = [(DMCProfileViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMCUIButtonCellID"];

  v13.receiver = self;
  v13.super_class = (Class)DMCProfileViewController;
  [(DMCProfileTableViewController *)&v13 reloadTableOnContentSizeCategoryChange];
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__tableChanged_ name:@"kMCUIProfileDidChangeNotification" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCProfileViewController;
  [(DMCProfileViewController *)&v6 viewWillAppear:a3];
  uint64_t v4 = [(DMCProfileViewController *)self rmSpecifierProvider];
  [v4 reloadSpecifiers];

  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    v5 = [(DMCProfileViewController *)self rmSpecifierProviderUserScope];
    [v5 reloadSpecifiers];
  }
}

- (void)_tableChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__DMCProfileViewController__tableChanged___block_invoke;
  v3[3] = &unk_2645E9398;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __42__DMCProfileViewController__tableChanged___block_invoke(uint64_t a1)
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

- (void)_rmConfigsChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__DMCProfileViewController__rmConfigsChanged___block_invoke;
  v3[3] = &unk_2645E9398;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__DMCProfileViewController__rmConfigsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [WeakRetained rmSpecifierProvider];
    v2 = [v1 specifiers];
    objc_msgSend(WeakRetained, "setRmConfigurationsCount:", objc_msgSend(v2, "count"));

    if ([MEMORY[0x263F38BA0] isSharediPad])
    {
      id v3 = [WeakRetained rmSpecifierProviderUserScope];
      id v4 = [v3 specifiers];
      objc_msgSend(WeakRetained, "setRmConfigurationsCountUserScope:", objc_msgSend(v4, "count"));
    }
    v5 = [WeakRetained tableView];
    [v5 reloadData];
  }
}

- (void)setProfile:(id)a3
{
  id v19 = a3;
  id v4 = [(DMCProfileViewModel *)self->_UIProfile profile];

  v5 = v19;
  if (v4 != v19)
  {
    objc_super v6 = [[DMCProfileViewModel alloc] initWithProfile:v19 managedPayloads:[(DMCProfileViewController *)self _showManagedPayloads] profileUIDataProvider:self->_profileUIDataProvider];
    UIProfile = self->_UIProfile;
    self->_UIProfile = v6;

    [(DMCProfileViewController *)self setProfileExpiry:[(DMCProfileViewController *)self _profileExpiryForProfile:v19]];
    id v8 = self->_UIProfile;
    if (v8 && [(DMCProfileViewModel *)v8 isMDMProfile]) {
      int v9 = [(DMCProfileUIDataProvider *)self->_profileUIDataProvider isProvisionallyEnrolled];
    }
    else {
      int v9 = 0;
    }
    v10 = [v19 installOptions];
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F53DB8]];
    int v12 = [v11 BOOLValue];

    if ([v19 isLocked])
    {
      objc_super v13 = [v19 removalPasscode];
      objc_super v14 = v13;
      int v15 = v9 ^ 1;
      if (v13) {
        int v15 = 0;
      }
      if ((v15 | v12))
      {

LABEL_15:
        uint64_t v16 = 0;
        goto LABEL_16;
      }
      char v17 = [MEMORY[0x263F38BA0] isSharediPad];

      if (v17) {
        goto LABEL_15;
      }
    }
    else if (v12 & 1) != 0 || ([MEMORY[0x263F38BA0] isSharediPad])
    {
      goto LABEL_15;
    }
    uint64_t v16 = 1;
LABEL_16:
    [(DMCProfileViewController *)self setProfileRemovable:v16];
    [(DMCProfileViewController *)self _setupRMConfigurationsUI];
    v18 = [(DMCProfileViewController *)self tableView];
    [v18 reloadData];

    v5 = v19;
  }
}

- (void)setProfileViewMode:(int64_t)a3
{
  if (self->_profileViewMode != a3)
  {
    self->_profileViewMode = a3;
    [(DMCProfileViewModel *)self->_UIProfile setShowManagedPayloads:[(DMCProfileViewController *)self _showManagedPayloads]];
    id v4 = [(DMCProfileViewController *)self tableView];
    [v4 reloadData];
  }
}

- (BOOL)_showManagedPayloads
{
  return self->_profileViewMode != 1;
}

- (unint64_t)_profileExpiryForProfile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 expiryDate];
  if (v4
    && [v3 isManagedByProfileService]
    && (v5 = (void *)MEMORY[0x263EFF910],
        id v6 = v4,
        [v5 date],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v6 compare:v7],
        v6,
        v7,
        v8 != 1))
  {
    v11 = [v3 unmodifiedExpiryDate];
    if (v11
      && ([MEMORY[0x263EFF910] date],
          int v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v11 compare:v12],
          v12,
          v13 == 1))
    {
      unint64_t v9 = 1;
    }
    else
    {
      unint64_t v9 = 2;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_delegateCanRemove
{
  v2 = [(DMCProfileViewController *)self profileViewControllerDelegate];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_shouldShowRemoveButton
{
  BOOL v3 = [(DMCProfileViewController *)self _delegateCanRemove];
  if (!v3) {
    return v3;
  }
  int64_t v4 = [(DMCProfileViewController *)self profileViewMode];
  if (v4 == 1)
  {
    if ([(DMCProfileViewController *)self installProfileSource] == 1
      || [(DMCProfileViewController *)self installProfileSource] == 2)
    {
      LOBYTE(v3) = ![(DMCProfileViewController *)self installComplete];
      return v3;
    }
LABEL_10:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (v4 != 2) {
    goto LABEL_10;
  }
  LOBYTE(v3) = [(DMCProfileViewController *)self profileRemovable];
  return v3;
}

- (void)_removeProfile
{
  if ([(DMCProfileViewController *)self _delegateCanRemove])
  {
    BOOL v3 = [(DMCProfileViewController *)self UIProfile];
    int64_t v4 = [v3 profile];
    v5 = [v4 identifier];
    NSLog(&cfstr_Dmcprofileview_1.isa, v5);

    id v6 = [(DMCProfileViewController *)self profileViewControllerDelegate];
    [v6 profileViewControllerDidSelectRemoveProfile:self];
  }
}

- (BOOL)_delegateCanUpdate
{
  BOOL v3 = [(DMCProfileViewController *)self profileViewControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && ([(DMCProfileViewController *)self profileViewControllerDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 profileViewControllerHideUpdateProfile:self],
        v5,
        (v6 & 1) != 0))
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v8 = [(DMCProfileViewController *)self profileViewControllerDelegate];
    char v7 = objc_opt_respondsToSelector();
  }
  return v7 & 1;
}

- (BOOL)_shouldShowUpdateButton
{
  LODWORD(v3) = [(DMCProfileViewController *)self _delegateCanUpdate];
  if (v3)
  {
    unint64_t v3 = [(DMCProfileViewController *)self profileExpiry];
    if (v3) {
      LOBYTE(v3) = [(DMCProfileViewController *)self profileViewMode] == 2;
    }
  }
  return v3;
}

- (void)_updateProfile
{
  if ([(DMCProfileViewController *)self _delegateCanUpdate])
  {
    unint64_t v3 = [(DMCProfileViewController *)self UIProfile];
    char v4 = [v3 profile];
    v5 = [v4 identifier];
    NSLog(&cfstr_Dmcprofileview_2.isa, v5);

    id v6 = [(DMCProfileViewController *)self profileViewControllerDelegate];
    [v6 profileViewControllerDidSelectUpdateProfile:self];
  }
}

- (BOOL)_delegateCanPoll
{
  unint64_t v3 = [(DMCProfileViewController *)self profileViewControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && ([(DMCProfileViewController *)self profileViewControllerDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 profileViewControllerShouldDisplayPoll:self],
        v5,
        !v6))
  {
    char v8 = 0;
  }
  else
  {
    char v7 = [(DMCProfileViewController *)self profileViewControllerDelegate];
    char v8 = objc_opt_respondsToSelector();
  }
  return v8 & 1;
}

- (void)_poll
{
  if ([(DMCProfileViewController *)self _delegateCanPoll])
  {
    unint64_t v3 = [(DMCProfileViewController *)self UIProfile];
    char v4 = [v3 profile];
    v5 = [v4 identifier];
    NSLog(&cfstr_Dmcprofileview_3.isa, v5);

    id v6 = [(DMCProfileViewController *)self profileViewControllerDelegate];
    [v6 profileViewControllerDidSelectPoll:self];
  }
}

- (BOOL)_profileContainsPayloadClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = [(DMCProfileViewModel *)self->_UIProfile profile];
  char v4 = [v3 payloads];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_profileContainsMDMPayload
{
  uint64_t v3 = objc_opt_class();
  return [(DMCProfileViewController *)self _profileContainsPayloadClass:v3];
}

- (BOOL)_profileContainsDeclarationsPayload
{
  uint64_t v3 = objc_opt_class();
  return [(DMCProfileViewController *)self _profileContainsPayloadClass:v3];
}

- (void)_setupRMConfigurationsUI
{
  if (self->_profileViewMode != 1
    && ([(DMCProfileViewController *)self _profileContainsMDMPayload]
     || [(DMCProfileViewController *)self _profileContainsDeclarationsPayload]))
  {
    uint64_t v3 = [(DMCProfileViewModel *)self->_UIProfile profile];
    id v15 = [v3 identifier];

    char v4 = [(DMCProfileUIDataProvider *)self->_profileUIDataProvider rmSpecifierProviderForProfileIdentifier:v15 scope:1];
    rmSpecifierProvider = self->_rmSpecifierProvider;
    self->_rmSpecifierProvider = v4;

    uint64_t v6 = self->_rmSpecifierProvider;
    if (v6)
    {
      uint64_t v7 = [(RMConfigurationsSpecifierProvider *)v6 specifiers];
      self->_rmConfigurationsCount = [v7 count];

      char v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 addObserver:self selector:sel__rmConfigsChanged_ name:@"RMConfigurationsSpecifiersDidChangeNotification" object:0];
    }
    if ([MEMORY[0x263F38BA0] isSharediPad])
    {
      BOOL v9 = [(DMCProfileUIDataProvider *)self->_profileUIDataProvider rmSpecifierProviderForProfileIdentifier:v15 scope:0];
      rmSpecifierProviderUserScope = self->_rmSpecifierProviderUserScope;
      self->_rmSpecifierProviderUserScope = v9;

      long long v11 = self->_rmSpecifierProviderUserScope;
      if (v11)
      {
        long long v12 = [(RMConfigurationsSpecifierProvider *)v11 specifiers];
        self->_rmConfigurationsCountUserScope = [v12 count];
      }
    }
  }
  else
  {
    long long v13 = self->_rmSpecifierProvider;
    self->_rmSpecifierProvider = 0;

    long long v14 = self->_rmSpecifierProviderUserScope;
    self->_rmSpecifierProviderUserScope = 0;

    self->_rmConfigurationsCount = 0;
    self->_rmConfigurationsCountUserScope = 0;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = [(DMCProfileViewController *)self UIProfile];
    char v8 = [v7 elevatedPayloadTypes];
    uint64_t v10 = [v8 count];
    if ([(DMCProfileViewController *)self rmConfigurationsCount]) {
      ++v10;
    }
    if ([(DMCProfileViewController *)self rmConfigurationsCountUserScope]) {
      int64_t v9 = v10 + 1;
    }
    else {
      int64_t v9 = v10;
    }
  }
  else
  {
    if (a4)
    {
      int64_t v9 = [(DMCProfileViewController *)self _isSectionPopulated:a4];
      goto LABEL_13;
    }
    uint64_t v7 = [(DMCProfileViewController *)self UIProfile];
    char v8 = [v7 moreDetailsSections];
    if ([v8 count]) {
      int64_t v9 = 3;
    }
    else {
      int64_t v9 = 2;
    }
  }

LABEL_13:
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 section])
  {
    case 0:
      uint64_t v8 = [(DMCProfileViewController *)self _tableView:v6 profileCellForRowAtIndexPath:v7];
      goto LABEL_9;
    case 1:
      uint64_t v8 = [(DMCProfileViewController *)self _tableView:v6 elevatedPayloadCellForRowAtIndexPath:v7];
      goto LABEL_9;
    case 2:
      int64_t v9 = @"DMC_POLL_HRN_TITLE";
      goto LABEL_7;
    case 3:
      int64_t v9 = @"DMC_UPDATE_PROFILE_TITLE";
LABEL_7:
      uint64_t v10 = DMCEnrollmentLocalizedString(v9);
      long long v11 = [MEMORY[0x263F1C550] systemBlueColor];
      long long v12 = [(DMCProfileViewController *)self _tableView:v6 buttonForRowAtIndexPath:v7 text:v10 color:v11];

      goto LABEL_10;
    case 4:
      uint64_t v8 = [(DMCProfileViewController *)self _tableView:v6 removeButtonForRowAtIndexPath:v7];
      goto LABEL_9;
    default:
      NSLog(&cfstr_Dmcprofileview_4.isa, v7);
      uint64_t v8 = objc_opt_new();
LABEL_9:
      long long v12 = (void *)v8;
LABEL_10:

      return v12;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  switch([v6 section])
  {
    case 0:
      if ([v6 row] == 2)
      {
        id v7 = [DMCProfileDetailsViewController alloc];
        uint64_t v8 = [(DMCProfileViewController *)self UIProfile];
        uint64_t v9 = [(DMCProfileDetailsViewController *)v7 initWithProfileViewModel:v8 mode:0];
        goto LABEL_13;
      }
      goto LABEL_16;
    case 1:
      uint64_t v10 = [(DMCProfileViewController *)self _profileDetailsModeForElevatedPayloadAtIndexPath:v6];
      if (v10 == 7)
      {
        if (![MEMORY[0x263F38BA0] isSharediPad]) {
          goto LABEL_16;
        }
        uint64_t v16 = [DMCRMConfigurationsViewController alloc];
        uint64_t v8 = [(DMCProfileViewController *)self rmSpecifierProviderUserScope];
        long long v13 = v16;
        long long v14 = v8;
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v11 = v10;
        if (v10 != 6)
        {
          v18 = [DMCProfileDetailsViewController alloc];
          id v19 = [(DMCProfileViewController *)self UIProfile];
          char v17 = [(DMCProfileDetailsViewController *)v18 initWithProfileViewModel:v19 mode:v11];

          goto LABEL_15;
        }
        long long v12 = [DMCRMConfigurationsViewController alloc];
        uint64_t v8 = [(DMCProfileViewController *)self rmSpecifierProvider];
        long long v13 = v12;
        long long v14 = v8;
        uint64_t v15 = 1;
      }
      uint64_t v9 = [(DMCRMConfigurationsViewController *)v13 initWithRMConfigurationsSpecifierProvider:v14 scope:v15];
LABEL_13:
      char v17 = (DMCProfileDetailsViewController *)v9;

LABEL_15:
      [(DMCProfileTableViewController *)self presentViewController:v17];

LABEL_16:
      [v20 deselectRowAtIndexPath:v6 animated:1];

      return;
    case 2:
      [(DMCProfileViewController *)self _poll];
      goto LABEL_16;
    case 3:
      [(DMCProfileViewController *)self _updateProfile];
      goto LABEL_16;
    case 4:
      [(DMCProfileViewController *)self _removeProfile];
      goto LABEL_16;
    default:
      goto LABEL_16;
  }
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  [(DMCProfileViewController *)self _heightForHeaderFooterInSection:a4];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  [(DMCProfileViewController *)self _heightForHeaderFooterInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  [(DMCProfileViewController *)self _heightForHeaderFooterInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  [(DMCProfileViewController *)self _heightForHeaderFooterInSection:a4];
  return result;
}

- (double)_heightForHeaderFooterInSection:(int64_t)a3
{
  BOOL v3 = [(DMCProfileViewController *)self _isSectionPopulated:a3];
  double result = *MEMORY[0x263F1D600];
  if (!v3) {
    return 2.22507386e-308;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(DMCProfileViewController *)self _isSectionPopulated:a4])
  {
    v10.receiver = self;
    v10.super_class = (Class)DMCProfileViewController;
    uint64_t v7 = [(DMCProfileViewController *)&v10 tableView:v6 viewForHeaderInSection:a4];
  }
  else
  {
    uint64_t v7 = [(DMCProfileViewController *)self _emptyViewForHeaderFooter];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(DMCProfileViewController *)self _isSectionPopulated:a4])
  {
    v10.receiver = self;
    v10.super_class = (Class)DMCProfileViewController;
    uint64_t v7 = [(DMCProfileViewController *)&v10 tableView:v6 viewForFooterInSection:a4];
  }
  else
  {
    uint64_t v7 = [(DMCProfileViewController *)self _emptyViewForHeaderFooter];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (id)_emptyViewForHeaderFooter
{
  id v2 = objc_alloc(MEMORY[0x263F1CB60]);
  BOOL v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  char v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];

  return v3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return &stru_26D435FC0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v5 = 0;
    return v5;
  }
  unint64_t v8 = [(DMCProfileViewController *)self profileExpiry];
  if (v8 == 1)
  {
    BOOL v9 = [(DMCProfileViewController *)self _delegateCanUpdate];
    objc_super v10 = @"DMC_PROFILE_EXPIRING_CERT";
    uint64_t v11 = @"DMC_PROFILE_EXPIRING_CERT_REENROLL";
  }
  else
  {
    if (v8 != 2)
    {
      uint64_t v5 = 0;
      goto LABEL_14;
    }
    BOOL v9 = [(DMCProfileViewController *)self _delegateCanUpdate];
    objc_super v10 = @"DMC_PROFILE_EXPIRED";
    uint64_t v11 = @"DMC_PROFILE_EXPIRED_REENROLL";
  }
  if (v9) {
    long long v12 = v11;
  }
  else {
    long long v12 = v10;
  }
  uint64_t v5 = DMCEnrollmentLocalizedString(v12);
LABEL_14:
  return v5;
}

- (BOOL)_isSectionPopulated:(int64_t)a3
{
  BOOL v4 = 1;
  switch(a3)
  {
    case 0:
      return v4;
    case 1:
      uint64_t v5 = [(DMCProfileViewController *)self UIProfile];
      id v6 = [v5 elevatedPayloadTypes];
      if (![v6 count]
        && ![(DMCProfileViewController *)self rmConfigurationsCount])
      {
        BOOL v4 = [(DMCProfileViewController *)self rmConfigurationsCountUserScope] != 0;
      }

      return v4;
    case 2:
      return [(DMCProfileViewController *)self _shouldShowPollButton];
    case 3:
      return [(DMCProfileViewController *)self _shouldShowUpdateButton];
    case 4:
      return [(DMCProfileViewController *)self _shouldShowRemoveButton];
    default:
      return 0;
  }
}

- (int)_profileDetailsModeForElevatedPayloadAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMCProfileViewController *)self UIProfile];
  id v6 = [v5 elevatedPayloadTypes];

  uint64_t v7 = [v4 row];
  if (v7 == [v6 count])
  {
    if ([(DMCProfileViewController *)self rmConfigurationsCount]) {
      int v8 = 6;
    }
    else {
      int v8 = 7;
    }
  }
  else
  {
    uint64_t v9 = [v4 row];
    if (v9 == [v6 count] + 1)
    {
      int v8 = 7;
    }
    else
    {
      objc_super v10 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      uint64_t v11 = [v10 integerValue];

      if ((unint64_t)(v11 - 1) >= 4)
      {
        NSLog(&cfstr_Dmcprofileview_5.isa, v11);
        int v8 = 0;
      }
      else
      {
        int v8 = v11 + 1;
      }
    }
  }

  return v8;
}

- (id)_tableView:(id)a3 profileCellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  switch(v8)
  {
    case 2:
      uint64_t v13 = [(DMCProfileViewController *)self _tableView:v6 profileMoreDetailsCellForRowAtIndexPath:v7];
      break;
    case 1:
      long long v14 = +[DMCProfileDetailsSummaryCell cellIdentifier];
      objc_super v10 = [v6 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7];

      uint64_t v11 = [(DMCProfileViewController *)self UIProfile];
      [v10 setProfileViewModel:v11];
      goto LABEL_7;
    case 0:
      uint64_t v9 = +[DMCProfileSummaryCell cellIdentifier];
      objc_super v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];

      uint64_t v11 = [(DMCProfileViewController *)self UIProfile];
      long long v12 = [v11 profile];
      [v10 setProfile:v12];

LABEL_7:
      goto LABEL_10;
    default:
      NSLog(&cfstr_Dmcprofileview_6.isa, v7);
      uint64_t v13 = objc_opt_new();
      break;
  }
  objc_super v10 = (void *)v13;
LABEL_10:

  return v10;
}

- (id)_tableView:(id)a3 profileMoreDetailsCellForRowAtIndexPath:(id)a4
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"kMCUIProfileMoreDetailsCellID" forIndexPath:a4];
  uint64_t v5 = DMCEnrollmentLocalizedString(@"DMC_MORE_DETAILS_TITLE");
  id v6 = [v4 textLabel];
  [v6 setText:v5];

  [v4 setAccessoryType:1];
  return v4;
}

- (id)_tableView:(id)a3 elevatedPayloadCellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"kMCUIElevatedPayloadCellID" forIndexPath:v6];
  uint64_t v8 = [(DMCProfileViewController *)self _profileDetailsModeForElevatedPayloadAtIndexPath:v6];
  switch((int)v8)
  {
    case 2:
      uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_ACCOUNTS");
      objc_super v10 = [(DMCProfileViewController *)self UIProfile];
      uint64_t v11 = [v10 numberOfAccounts];
      goto LABEL_7;
    case 3:
      uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_APPS");
      objc_super v10 = [(DMCProfileViewController *)self UIProfile];
      uint64_t v11 = [v10 numberOfManagedApps];
      goto LABEL_7;
    case 4:
      uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_BOOKS");
      objc_super v10 = [(DMCProfileViewController *)self UIProfile];
      uint64_t v11 = [v10 numberOfManagedBooks];
      goto LABEL_7;
    case 5:
      uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_PROFILE_DETAILS_RESTRICTIONS");
      objc_super v10 = [(DMCProfileViewController *)self UIProfile];
      uint64_t v11 = [v10 numberOfRestrictions];
LABEL_7:
      unint64_t v13 = v11;

      goto LABEL_14;
    case 6:
      if ([MEMORY[0x263F38BA0] isSharediPad]) {
        long long v14 = @"DMC_DEVICE_CONFIGURATIONS_TITLE";
      }
      else {
        long long v14 = @"DMC_CONFIGURATIONS_TITLE";
      }
      uint64_t v9 = DMCEnrollmentLocalizedString(v14);
      unint64_t v15 = [(DMCProfileViewController *)self rmConfigurationsCount];
      goto LABEL_13;
    case 7:
      uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_USER_CONFIGURATIONS_TITLE");
      unint64_t v15 = [(DMCProfileViewController *)self rmConfigurationsCountUserScope];
LABEL_13:
      unint64_t v13 = v15;
LABEL_14:
      uint64_t v16 = [v7 textLabel];
      [v16 setText:v9];

      char v17 = [v7 textLabel];
      [v17 setTextAlignment:4];

      v18 = (void *)MEMORY[0x263F08A30];
      id v19 = [NSNumber numberWithInteger:v13];
      id v20 = [v18 localizedStringFromNumber:v19 numberStyle:0];
      v21 = [v7 detailTextLabel];
      [v21 setText:v20];

      [v7 setAccessoryType:1];
      id v12 = v7;

      break;
    default:
      NSLog(&cfstr_Dmcprofileview_7.isa, v8, v6);
      id v12 = (id)objc_opt_new();
      break;
  }

  return v12;
}

- (id)_tableView:(id)a3 buttonForRowAtIndexPath:(id)a4 text:(id)a5 color:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  uint64_t v11 = [a3 dequeueReusableCellWithIdentifier:@"kMCUIButtonCellID" forIndexPath:a4];
  id v12 = [v11 textLabel];
  [v12 setText:v10];

  unint64_t v13 = [v11 textLabel];
  [v13 setTextAlignment:1];

  long long v14 = [v11 textLabel];
  [v14 setTextColor:v9];

  return v11;
}

- (id)_tableView:(id)a3 removeButtonForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(DMCProfileViewController *)self profileViewMode] == 2)
  {
    uint64_t v8 = [(DMCProfileViewController *)self UIProfile];
    int v9 = [v8 isMDMProfile];

    if (v9)
    {
      if ([(DMCProfileUIDataProvider *)self->_profileUIDataProvider isProvisionallyEnrolled])id v10 = @"DMC_MDM_LEAVE_REMOTE_MANAGEMENT"; {
      else
      }
        id v10 = @"DMC_MDM_REMOVE_TITLE";
    }
    else
    {
      id v10 = @"DMC_PROFILE_REMOVE_TITLE";
    }
  }
  else
  {
    id v10 = @"DMC_PROFILE_REMOVE_UNINSTALLED_TITLE";
  }
  uint64_t v11 = DMCEnrollmentLocalizedString(v10);
  id v12 = [MEMORY[0x263F1C550] DMCProfileRedColor];
  unint64_t v13 = [(DMCProfileViewController *)self _tableView:v7 buttonForRowAtIndexPath:v6 text:v11 color:v12];

  return v13;
}

- (DMCProfileViewModel)UIProfile
{
  return self->_UIProfile;
}

- (int64_t)profileViewMode
{
  return self->_profileViewMode;
}

- (unint64_t)installProfileSource
{
  return self->_installProfileSource;
}

- (void)setInstallProfileSource:(unint64_t)a3
{
  self->_installProfileSource = a3;
}

- (BOOL)installComplete
{
  return self->_installComplete;
}

- (void)setInstallComplete:(BOOL)a3
{
  self->_installComplete = a3;
}

- (DMCProfileViewControllerDelegate)profileViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileViewControllerDelegate);
  return (DMCProfileViewControllerDelegate *)WeakRetained;
}

- (void)setProfileViewControllerDelegate:(id)a3
{
}

- (BOOL)profileRemovable
{
  return self->_profileRemovable;
}

- (void)setProfileRemovable:(BOOL)a3
{
  self->_profileRemovable = a3;
}

- (unint64_t)profileExpiry
{
  return self->_profileExpiry;
}

- (void)setProfileExpiry:(unint64_t)a3
{
  self->_profileExpiry = a3;
}

- (RMConfigurationsSpecifierProvider)rmSpecifierProvider
{
  return self->_rmSpecifierProvider;
}

- (void)setRmSpecifierProvider:(id)a3
{
}

- (unint64_t)rmConfigurationsCount
{
  return self->_rmConfigurationsCount;
}

- (void)setRmConfigurationsCount:(unint64_t)a3
{
  self->_rmConfigurationsCount = a3;
}

- (RMConfigurationsSpecifierProvider)rmSpecifierProviderUserScope
{
  return self->_rmSpecifierProviderUserScope;
}

- (void)setRmSpecifierProviderUserScope:(id)a3
{
}

- (unint64_t)rmConfigurationsCountUserScope
{
  return self->_rmConfigurationsCountUserScope;
}

- (void)setRmConfigurationsCountUserScope:(unint64_t)a3
{
  self->_rmConfigurationsCountUserScope = a3;
}

- (DMCProfileUIDataProvider)profileUIDataProvider
{
  return self->_profileUIDataProvider;
}

- (void)setProfileUIDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, 0);
  objc_storeStrong((id *)&self->_rmSpecifierProviderUserScope, 0);
  objc_storeStrong((id *)&self->_rmSpecifierProvider, 0);
  objc_destroyWeak((id *)&self->_profileViewControllerDelegate);
  objc_storeStrong((id *)&self->_UIProfile, 0);
}

@end