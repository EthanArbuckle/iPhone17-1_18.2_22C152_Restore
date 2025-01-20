@interface _SFAccountTableViewController
- (BOOL)_hasMarkedText;
- (BOOL)_shouldShowDeleteContextMenuItemForSavedAccount:(id)a3;
- (BOOL)_shouldShowToolbarWhenSearching;
- (BOOL)shouldSuppressAccountManagerLockedView;
- (NSString)searchPattern;
- (NSString)searchQuery;
- (UISearchController)searchController;
- (_ASPasswordManagerIconController)iconController;
- (_SFAccountTableViewController)initWithSiteMetadataManager:(id)a3 configuration:(id)a4;
- (id)_allSharedCredentialGroupsMenuForSavedAccount:(id)a3;
- (id)_contextMenuForSavedAccountAtIndexPath:(id)a3;
- (id)iconControllerForAccountDetailViewController:(id)a3;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)positionForBar:(id)a3;
- (void)_applicationDidEnterBackground;
- (void)_applicationWillTerminate;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_shareSavedAccount:(id)a3 authenticationContext:(id)a4 modalPresentationSourceView:(id)a5;
- (void)_shareSavedAccount:(id)a3 modalPresentationSourceView:(id)a4;
- (void)_updateIconForDomain:(id)a3 forCell:(id)a4;
- (void)dealloc;
- (void)iconDidUpdateForDomain:(id)a3 iconController:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconController:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation _SFAccountTableViewController

- (_SFAccountTableViewController)initWithSiteMetadataManager:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFAccountTableViewController;
  v8 = [(_SFAccountTableViewController *)&v18 initWithStyle:+[_SFAccountManagerAppearanceValues preferencesTableViewStyle]];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a4);
    uint64_t v10 = [MEMORY[0x1E4F28BD0] set];
    visibleDomains = v9->_visibleDomains;
    v9->_visibleDomains = (NSCountedSet *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F18B30]) initWithMetadataManager:v6];
    iconController = v9->_iconController;
    v9->_iconController = (_ASPasswordManagerIconController *)v12;

    [(_ASPasswordManagerIconController *)v9->_iconController setDelegate:v9];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v9 selector:sel__applicationWillTerminate name:*MEMORY[0x1E4FB2740] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v9 selector:sel__applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];

    v16 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(_ASPasswordManagerIconController *)self->_iconController prepareForApplicationTermination];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2740] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2E90] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_SFAccountTableViewController;
  [(_SFAccountTableViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)_SFAccountTableViewController;
  [(_SFAccountTableViewController *)&v14 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];

  if ([(_SFAccountTableConfiguration *)self->_configuration shouldShowSearchBar])
  {
    objc_super v4 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
    searchController = self->_searchController;
    self->_searchController = v4;

    [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
    [(UISearchController *)self->_searchController setDelegate:self];
    id v6 = self->_searchController;
    id v7 = [(_SFAccountTableViewController *)self navigationItem];
    [v7 setSearchController:v6];

    v8 = [(_SFAccountTableViewController *)self navigationItem];
    [v8 setHidesSearchBarWhenScrolling:0];

    v9 = [(UISearchController *)self->_searchController searchBar];
    [v9 setDelegate:self];
    [v9 setAutocapitalizationType:0];
    [v9 setAutocorrectionType:1];
    [v9 setAccessibilityIdentifier:@"Passwords List Search Bar"];
  }
  uint64_t v10 = [(_SFAccountTableViewController *)self navigationItem];
  [v10 setPreferredSearchBarPlacement:2];

  v11 = [(_SFAccountTableViewController *)self navigationItem];
  [v11 setStyle:0];

  BOOL v12 = [(_SFAccountTableConfiguration *)self->_configuration shouldConfigureMultipleSelectionDuringEditing];
  v13 = [(_SFAccountTableViewController *)self tableView];
  [v13 setAllowsMultipleSelectionDuringEditing:v12];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAccountTableViewController;
  [(_SFAccountTableViewController *)&v4 viewDidAppear:a3];
  [(_ASPasswordManagerIconController *)self->_iconController performMaintenanceWork];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAccountTableViewController;
  [(_SFAccountTableViewController *)&v4 viewDidDisappear:a3];
  [(_ASPasswordManagerIconController *)self->_iconController clearIconFetchingState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFAccountTableViewController;
  [(_SFAccountTableViewController *)&v5 viewWillAppear:a3];
  if ([(UISearchController *)self->_searchController isActive])
  {
    if ([(_SFAccountTableViewController *)self _shouldShowToolbarWhenSearching])
    {
      objc_super v4 = [(_SFAccountTableViewController *)self navigationController];
      [v4 setToolbarHidden:0 animated:0];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  objc_super v5 = [(_SFAccountTableViewController *)self navigationController];
  [v5 setToolbarHidden:1 animated:v3];

  [(_ASPasswordManagerIconController *)self->_iconController performMaintenanceWork];
}

- (void)_applicationWillTerminate
{
}

- (void)_applicationDidEnterBackground
{
}

- (void)_sceneDidEnterBackground:(id)a3
{
  objc_super v4 = [a3 object];
  objc_super v5 = [(_SFAccountTableViewController *)self viewIfLoaded];
  objc_super v6 = [v5 window];
  id v7 = [v6 windowScene];

  if (v4 == v7)
  {
    v8 = [(_SFAccountTableViewController *)self navigationController];
    id v10 = [v8 visibleViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v10 presentingViewController];
      [v9 dismissViewControllerAnimated:0 completion:0];
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController setEditing:animated:](&v8, sel_setEditing_animated_);
  if (![(_SFAccountTableConfiguration *)self->_configuration shouldConfigureMultipleSelectionDuringEditing])
  {
    id v7 = [(UISearchController *)self->_searchController searchBar];
    [v7 _setEnabled:!v5 animated:v4];
  }
}

- (NSString)searchQuery
{
  v2 = [(UISearchController *)self->_searchController searchBar];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSearchQuery:(id)a3
{
  searchController = self->_searchController;
  id v4 = a3;
  id v5 = [(UISearchController *)searchController searchBar];
  [v5 setText:v4];
}

- (BOOL)_hasMarkedText
{
  v2 = [(UISearchController *)self->_searchController searchBar];
  BOOL v3 = [v2 searchField];
  id v4 = [v3 markedTextRange];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_shareSavedAccount:(id)a3 modalPresentationSourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [[_SFAirDropAccountSharingAuthenticationContext alloc] initWithSavedAccount:v6];
  self->_isOneTimeSharingAccount = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke;
  v12[3] = &unk_1E5C720D0;
  v12[4] = self;
  id v13 = v6;
  objc_super v14 = v8;
  id v15 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  +[_SFSettingsAuthentication authenticateForSettings:v10 allowAuthenticationReuse:0 completionHandler:v12];
}

- (void)_shareSavedAccount:(id)a3 authenticationContext:(id)a4 modalPresentationSourceView:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([a4 hasBeenAuthenticated])
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F98258]) initWithSavedPassword:v8];
    id v11 = objc_alloc(MEMORY[0x1E4F42718]);
    BOOL v12 = [v10 urlRepresentationForAirDrop];
    v21[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    objc_super v14 = (void *)[v11 initWithActivityItems:v13 applicationActivities:0];

    uint64_t v20 = *MEMORY[0x1E4F43590];
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v14 setIncludedActivityTypes:v15];

    [v14 setExcludedActivityCategories:3];
    [v14 setModalPresentationStyle:7];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102___SFAccountTableViewController__shareSavedAccount_authenticationContext_modalPresentationSourceView___block_invoke;
    v17[3] = &unk_1E5C720F8;
    id v18 = v8;
    v19 = self;
    [v14 setCompletionWithItemsHandler:v17];
    v16 = [v14 popoverPresentationController];
    [v16 setPermittedArrowDirections:1];
    [v9 bounds];
    objc_msgSend(v16, "setSourceRect:");
    [v16 setSourceView:v9];
    [(_SFAccountTableViewController *)self presentViewController:v14 animated:1 completion:0];
  }
}

- (BOOL)_shouldShowToolbarWhenSearching
{
  return 1;
}

- (id)_allSharedCredentialGroupsMenuForSavedAccount:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v32 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  unsigned int v5 = [v4 isSavedInPersonalKeychain];
  v28 = _WBSLocalizedString();
  id v6 = (void *)MEMORY[0x1E4FB13F0];
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person"];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke;
  v42[3] = &unk_1E5C72120;
  objc_copyWeak(&v44, &location);
  char v45 = v5;
  id v8 = v4;
  id v43 = v8;
  v29 = [v6 actionWithTitle:v28 image:v7 identifier:0 handler:v42];

  [v29 setState:v5];
  if ((v5 & 1) != 0
    || ([MEMORY[0x1E4F98DF8] sharedStore],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 _canMoveSavedAccount:v8 toGroupWithID:*MEMORY[0x1E4F992E0]],
        v9,
        (v10 & 1) == 0))
  {
    [v29 setAttributes:1];
  }
  [v32 addObject:v29];
  id v11 = [MEMORY[0x1E4F98C48] sharedProvider];
  BOOL v12 = [v11 cachedGroups];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v13)
  {
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v16 = [v8 sharedGroupID];
        v17 = [v15 groupID];
        unsigned int v18 = [v16 isEqualToString:v17];

        v19 = (void *)MEMORY[0x1E4FB13F0];
        uint64_t v20 = [v15 displayName];
        v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2"];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke_2;
        v33[3] = &unk_1E5C72148;
        objc_copyWeak(&v36, &location);
        char v37 = v18;
        id v22 = v8;
        id v34 = v22;
        v35 = v15;
        v23 = [v19 actionWithTitle:v20 image:v21 identifier:0 handler:v33];

        [v23 setState:v18];
        if ((v18 & 1) != 0
          || ([MEMORY[0x1E4F98DF8] sharedStore],
              v24 = objc_claimAutoreleasedReturnValue(),
              [v15 groupID],
              v25 = objc_claimAutoreleasedReturnValue(),
              char v26 = [v24 _canMoveSavedAccount:v22 toGroupWithID:v25],
              v25,
              v24,
              (v26 & 1) == 0))
        {
          [v23 setAttributes:1];
        }
        [v32 addObject:v23];

        objc_destroyWeak(&v36);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v13);
  }

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

  return v32;
}

- (id)_contextMenuForSavedAccountAtIndexPath:(id)a3
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(_SFAccountTableViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    v56 = [v6 savedAccount];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = _WBSLocalizedString();
    char v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke;
    v76[3] = &unk_1E5C72170;
    id v11 = v6;
    id v77 = v11;
    BOOL v12 = [v8 actionWithTitle:v9 image:v10 identifier:0 handler:v76];
    [v7 addObject:v12];

    if ([v56 credentialTypes])
    {
      uint64_t v13 = (void *)MEMORY[0x1E4FB13F0];
      objc_super v14 = _WBSLocalizedString();
      id v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_2;
      v74[3] = &unk_1E5C72170;
      id v75 = v11;
      v16 = [v13 actionWithTitle:v14 image:v15 identifier:0 handler:v74];
      [v7 addObject:v16];
    }
    if (objc_msgSend(v11, "safari_hasOneTimeCodeGenerator"))
    {
      v17 = (void *)MEMORY[0x1E4FB13F0];
      unsigned int v18 = _WBSLocalizedString();
      v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_3;
      v72[3] = &unk_1E5C72170;
      id v73 = v11;
      uint64_t v20 = [v17 actionWithTitle:v18 image:v19 identifier:0 handler:v72];
      [v7 addObject:v20];
    }
    if (objc_msgSend(v11, "safari_hasWebsite"))
    {
      v21 = (void *)MEMORY[0x1E4FB13F0];
      id v22 = _WBSLocalizedString();
      v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_4;
      v70[3] = &unk_1E5C72170;
      id v71 = v11;
      v24 = [v21 actionWithTitle:v22 image:v23 identifier:0 handler:v70];
      [v7 addObject:v24];
    }
    v25 = [MEMORY[0x1E4F1CA48] array];
    if ([MEMORY[0x1E4F98AF8] isOngoingCredentialSharingEnabled]
      && -[_SFAccountTableConfiguration supportsOngoingCredentialSharing](self->_configuration, "supportsOngoingCredentialSharing")&& [v56 canUserEditSavedAccount]&& objc_msgSend(v56, "isCurrentUserOriginalContributor"))
    {
      v55 = [MEMORY[0x1E4F1CA48] array];
      char v26 = (void *)MEMORY[0x1E4FB16B8];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_5;
      v67[3] = &unk_1E5C72198;
      objc_copyWeak(&v69, &location);
      id v27 = v56;
      id v68 = v27;
      v28 = [v26 elementWithUncachedProvider:v67];
      [v55 addObject:v28];

      v29 = (void *)MEMORY[0x1E4FB1970];
      v30 = (void *)MEMORY[0x1E4FB13F0];
      v54 = _WBSLocalizedString();
      v53 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle"];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_6;
      v64[3] = &unk_1E5C721C0;
      v52 = &v66;
      objc_copyWeak(&v66, &location);
      id v65 = v27;
      uint64_t v31 = [v30 actionWithTitle:v54 image:v53 identifier:0 handler:v64];
      v80[0] = v31;
      id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
      v33 = [v29 menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v32];
      [v55 addObject:v33];

      id v34 = (void *)MEMORY[0x1E4FB1970];
      v35 = _WBSLocalizedString();
      id v36 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2"];
      char v37 = [v34 menuWithTitle:v35 image:v36 identifier:0 options:0 children:v55];
      [v25 addObject:v37];

      objc_destroyWeak(&v66);
      objc_destroyWeak(&v69);
    }
    if ([(_SFAccountTableConfiguration *)self->_configuration supportsShare]
      && [v56 isOneTimeSharable])
    {
      long long v38 = (void *)MEMORY[0x1E4FB13F0];
      long long v39 = _WBSLocalizedString();
      long long v40 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_7;
      v60[3] = &unk_1E5C721E8;
      objc_copyWeak(&v63, &location);
      id v61 = v56;
      id v62 = v11;
      long long v41 = [v38 actionWithTitle:v39 image:v40 identifier:0 handler:v60];
      [v25 addObject:v41];

      objc_destroyWeak(&v63);
    }
    if ([v25 count])
    {
      v42 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v25];
      [v7 addObject:v42];
    }
    if ([(_SFAccountTableViewController *)self _shouldShowDeleteContextMenuItemForSavedAccount:v56])
    {
      id v43 = (void *)MEMORY[0x1E4FB13F0];
      id v44 = _WBSLocalizedString();
      char v45 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_8;
      v57[3] = &unk_1E5C721C0;
      objc_copyWeak(&v59, &location);
      id v58 = v4;
      v46 = [v43 actionWithTitle:v44 image:v45 identifier:0 handler:v57];

      [v46 setAttributes:2];
      v47 = (void *)MEMORY[0x1E4FB1970];
      v79 = v46;
      uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      v49 = [v47 menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v48];
      [v7 addObject:v49];

      objc_destroyWeak(&v59);
    }
    v50 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EFB97EB8 children:v7];

    objc_destroyWeak(&location);
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (BOOL)_shouldShowDeleteContextMenuItemForSavedAccount:(id)a3
{
  id v4 = a3;
  if (![(_SFAccountTableConfiguration *)self->_configuration supportsDelete]
    || -[_SFAccountTableConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields")|| [v4 isRecentlyDeleted]&& !objc_msgSend(v4, "isCurrentUserOriginalContributor"))
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [v4 canUserEditSavedAccount];
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a4;
  int v6 = [v11 conformsToProtocol:&unk_1EFC4F958];
  id v7 = v11;
  if (v6)
  {
    id v8 = v11;
    id v9 = [v8 savedAccount];
    char v10 = [v9 highLevelDomain];

    if (v10)
    {
      [(_SFAccountTableViewController *)self _updateIconForDomain:v10 forCell:v8];
      [(NSCountedSet *)self->_visibleDomains addObject:v10];
    }

    id v7 = v11;
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v10;
  if (isKindOfClass)
  {
    id v8 = [v10 savedAccount];
    id v9 = [v8 highLevelDomain];

    if (v9) {
      [(NSCountedSet *)self->_visibleDomains removeObject:v9];
    }

    id v7 = v10;
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 cellForRowAtIndexPath:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v10 = [v7 isEditing];

    if ((v10 & 1) == 0)
    {
      objc_initWeak(&location, self);
      id v11 = (void *)MEMORY[0x1E4FB1678];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __91___SFAccountTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      v14[3] = &unk_1E5C72210;
      objc_copyWeak(&v16, &location);
      id v15 = v8;
      BOOL v12 = [v11 configurationWithIdentifier:v15 previewProvider:0 actionProvider:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = [a4 identifier];
  [(_SFAccountTableViewController *)self tableView:v7 didSelectRowAtIndexPath:v8];
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  if (![(_SFAccountTableViewController *)self _hasMarkedText])
  {
    id v5 = [(UISearchController *)self->_searchController searchBar];
    [v5 _setEnabled:0 animated:1];
  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v4 = [(UISearchController *)self->_searchController searchBar];
  [v4 _setEnabled:1 animated:0];
}

- (void)iconDidUpdateForDomain:(id)a3 iconController:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2117;
    id v13 = v5;
    _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Icon did update; domain=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71___SFAccountTableViewController_iconDidUpdateForDomain_iconController___block_invoke;
  v8[3] = &unk_1E5C72238;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

- (void)_updateIconForDomain:(id)a3 forCell:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(_ASPasswordManagerIconController *)self->_iconController iconForDomain:v18];
  if (!v7) {
    goto LABEL_8;
  }
  id v8 = v7;
  [v7 size];
  double v10 = v9;
  double v12 = v11;
  [MEMORY[0x1E4F18B30] tableViewIconSize];
  BOOL v15 = v10 == v14 && v12 == v13;
  if (v15
    || (id v16 = (void *)MEMORY[0x1E4F98BC8],
        [MEMORY[0x1E4F18B30] tableViewIconSize],
        objc_msgSend(v16, "resizedImage:withSize:", v8),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v8,
        (id v8 = (void *)v17) != 0))
  {
    [v6 setIcon:v8];
  }
  else
  {
LABEL_8:
    id v8 = [(_ASPasswordManagerIconController *)self->_iconController backgroundColorForDomain:v18];
    [v6 showPlaceholderImageForDomain:v18 backgroundColor:v8];
  }
}

- (id)iconControllerForAccountDetailViewController:(id)a3
{
  return self->_iconController;
}

- (void)willPresentSearchController:(id)a3
{
  if ([(_SFAccountTableViewController *)self _shouldShowToolbarWhenSearching])
  {
    id v4 = [(_SFAccountTableViewController *)self navigationController];
    [v4 setToolbarHidden:0 animated:1];
  }
}

- (void)willDismissSearchController:(id)a3
{
  id v3 = [(_SFAccountTableViewController *)self navigationController];
  [v3 setToolbarHidden:1 animated:1];
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  double v11 = [v4 text];

  id v5 = v11;
  searchPattern = self->_searchPattern;
  if (!searchPattern)
  {
    uint64_t v7 = [(NSString *)v11 length];
    id v5 = v11;
    if (!v7) {
      goto LABEL_7;
    }
    searchPattern = self->_searchPattern;
  }
  if (v5 != searchPattern)
  {
    BOOL v8 = -[NSString isEqualToString:](v5, "isEqualToString:");
    id v5 = v11;
    if (!v8)
    {
      double v9 = (NSString *)[(NSString *)v11 copy];
      double v10 = self->_searchPattern;
      self->_searchPattern = v9;

      [(_SFAccountTableViewController *)self searchPatternDidUpdate];
      id v5 = v11;
    }
  }
LABEL_7:
}

- (BOOL)shouldSuppressAccountManagerLockedView
{
  return self->_isOneTimeSharingAccount;
}

- (NSString)searchPattern
{
  return self->_searchPattern;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (_ASPasswordManagerIconController)iconController
{
  return self->_iconController;
}

- (void)setIconController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_visibleDomains, 0);
}

@end