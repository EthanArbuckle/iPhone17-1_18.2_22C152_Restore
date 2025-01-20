@interface WDClinicalOnboardingViewController
- (BOOL)_isSimulator;
- (BOOL)couldFetchAdditionalResults;
- (BOOL)definesPresentationContext;
- (BOOL)hasCompletedAtLeastOneFetch;
- (BOOL)hasSearchResults;
- (BOOL)hasSearchTerm;
- (BOOL)locationEnabled;
- (BOOL)searchInFlight;
- (BOOL)showOnlyClinicalSharingCapableProviders;
- (BOOL)showProviderNotFound;
- (BOOL)showingMainSpinner;
- (BOOL)showingNoGeoView;
- (BOOL)showingNoLocations;
- (CGSize)preferredContentSize;
- (HKClinicalAccountStore)accountStore;
- (HKClinicalProviderServiceStore)providerServiceStore;
- (HRProfile)profile;
- (HRUITableViewSectionConfiguration)sectionConfiguration;
- (HRWDSpinnerView)spinnerView;
- (NSArray)alreadyConnectedAccounts;
- (NSArray)searchTerms;
- (NSIndexPath)spinnerIndexPath;
- (NSLayoutConstraint)noContentBottomConstraint;
- (NSLayoutConstraint)noContentTopConstraint;
- (NSMutableDictionary)resultsCache;
- (NSMutableOrderedSet)alreadySharingSearchResults;
- (NSMutableOrderedSet)supportedSearchResults;
- (NSMutableOrderedSet)unsupportedSearchResults;
- (NSSet)alreadyConnectedBrands;
- (NSSet)alreadySharingBrands;
- (NSString)searchQuery;
- (UIView)noContentParentView;
- (UIView)providerNotFoundView;
- (UIViewController)dismissalViewController;
- (WDClinicalGatewayProxy)pendingGatewayProxy;
- (WDClinicalOnboardingNoGeoView)noGeoView;
- (WDClinicalOnboardingViewController)initWithProfile:(id)a3;
- (WDClinicalOnboardingViewController)initWithProfile:(id)a3 gatewayProxy:(id)a4;
- (WDClinicalSampleAccountsLoader)sampleAccountsLoader;
- (_UIContentUnavailableView)noLocationsView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_cacheKeyForSearchQuery:(id)a3;
- (id)_changeEnvironmentMenuElements;
- (id)_createNoContentParentView;
- (id)_createNoGeoView;
- (id)_createNoLocationsView;
- (id)_createSpinnerView;
- (id)_emptyMutableOrderedSet;
- (id)_mutableOrderedSetWithSampleAccountsForQuery:(id)a3;
- (id)_providerNotFoundExplanationMessage;
- (id)accountSearchResultAtIndexPath:(id)a3;
- (id)keyCommands;
- (id)providerSearchResultAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)nextFrom;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginLoadingAlreadyConnectedAccountsIfNecessary;
- (void)_cacheFeaturedBrandLogos;
- (void)_cancelSearch;
- (void)_changeEnvironment:(int64_t)a3;
- (void)_configureDeniedAuthorization;
- (void)_configureLeftNavigationItemAsCancel;
- (void)_configureLocationServices;
- (void)_configureNavigationItems;
- (void)_configureProviderNotFoundView;
- (void)_configureRightNavigationItems;
- (void)_configureSearchController;
- (void)_configureTableViewCells;
- (void)_didFetchResultsForQuery:(id)a3 searchResultsPage:(id)a4 error:(id)a5;
- (void)_disableLocationAwareness;
- (void)_hideNoGeoView;
- (void)_hideNoLocationsView;
- (void)_hideSpinnerView;
- (void)_loadGatewayProxyForDeeplinking:(id)a3;
- (void)_presentError:(id)a3;
- (void)_presentInitialResultsIfNecessary;
- (void)_presentLoginForAlreadyConnectedAccount:(id)a3;
- (void)_proceedWithAlreadyConnectedAccount:(id)a3;
- (void)_requestWhenInUseAuthorizationIfNeeded;
- (void)_resetCacheAndReloadData;
- (void)_resetSearchResults;
- (void)_searchResultsForQuery:(id)a3 from:(int64_t)a4;
- (void)_searchUsingQuery:(id)a3;
- (void)_showNoContentView:(id)a3;
- (void)_showNoGeoView;
- (void)_showNoLocationsViewIfNeeded;
- (void)_showSpinnerView;
- (void)_suggestNewProviders;
- (void)_updateNoContentViewConstraints;
- (void)_updateTableHeaderViewHeight;
- (void)activateSearch:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)dismiss:(id)a3;
- (void)loadView;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)reloadData;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAlreadyConnectedAccounts:(id)a3;
- (void)setAlreadyConnectedBrands:(id)a3;
- (void)setAlreadySharingBrands:(id)a3;
- (void)setAlreadySharingSearchResults:(id)a3;
- (void)setDismissalViewController:(id)a3;
- (void)setHasCompletedAtLeastOneFetch:(BOOL)a3;
- (void)setLocationEnabled:(BOOL)a3;
- (void)setNextFrom:(int64_t)a3;
- (void)setNoContentBottomConstraint:(id)a3;
- (void)setNoContentParentView:(id)a3;
- (void)setNoContentTopConstraint:(id)a3;
- (void)setNoGeoView:(id)a3;
- (void)setNoLocationsView:(id)a3;
- (void)setPendingGatewayProxy:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProviderNotFoundView:(id)a3;
- (void)setSampleAccountsLoader:(id)a3;
- (void)setSearchInFlight:(BOOL)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setSectionConfiguration:(id)a3;
- (void)setShowOnlyClinicalSharingCapableProviders:(BOOL)a3;
- (void)setShowProviderNotFound:(BOOL)a3;
- (void)setSpinnerIndexPath:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setSupportedSearchResults:(id)a3;
- (void)setUnsupportedSearchResults:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation WDClinicalOnboardingViewController

- (WDClinicalOnboardingViewController)initWithProfile:(id)a3
{
  return [(WDClinicalOnboardingViewController *)self initWithProfile:a3 gatewayProxy:0];
}

- (WDClinicalOnboardingViewController)initWithProfile:(id)a3 gatewayProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WDClinicalOnboardingViewController;
  v9 = [(HKTableViewController *)&v22 initWithUsingInsetStyling:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultsCache = v10->_resultsCache;
    v10->_resultsCache = v11;

    searchQuery = v10->_searchQuery;
    v10->_searchQuery = (NSString *)&stru_1F1D9FF30;

    searchTerms = v10->_searchTerms;
    v10->_searchTerms = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v15 = objc_alloc(MEMORY[0x1E4F67760]);
    v16 = [v7 healthStore];
    uint64_t v17 = [v15 initWithHealthStore:v16];
    providerServiceStore = v10->_providerServiceStore;
    v10->_providerServiceStore = (HKClinicalProviderServiceStore *)v17;

    objc_storeStrong((id *)&v10->_pendingGatewayProxy, a4);
    v19 = objc_alloc_init(HRUITableViewSectionConfiguration);
    sectionConfiguration = v10->_sectionConfiguration;
    v10->_sectionConfiguration = v19;
  }
  return v10;
}

- (BOOL)definesPresentationContext
{
  return 1;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)WDClinicalOnboardingViewController;
  [(WDClinicalOnboardingViewController *)&v11 loadView];
  v3 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_TITLE");
  [(WDClinicalOnboardingViewController *)self setTitle:v3];

  v4 = [(WDClinicalOnboardingViewController *)self tableView];
  [v4 _setTopPadding:0.0];

  double v5 = *MEMORY[0x1E4F67908];
  v6 = [(WDClinicalOnboardingViewController *)self tableView];
  objc_msgSend(v6, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);

  id v7 = [(WDClinicalOnboardingViewController *)self tableView];
  [v7 setBackgroundView:0];

  id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v9 = [(WDClinicalOnboardingViewController *)self tableView];
  [v9 setBackgroundColor:v8];

  v10 = [(WDClinicalOnboardingViewController *)self tableView];
  [v10 setKeyboardDismissMode:2];

  [(WDClinicalOnboardingViewController *)self _configureNavigationItems];
  [(WDClinicalOnboardingViewController *)self _configureSearchController];
  [(WDClinicalOnboardingViewController *)self _configureTableViewCells];
  [(WDClinicalOnboardingViewController *)self _cacheFeaturedBrandLogos];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WDClinicalOnboardingViewController;
  [(HKTableViewController *)&v6 viewDidLoad];
  v3 = [(WDClinicalOnboardingViewController *)self pendingGatewayProxy];

  if (v3)
  {
    v4 = [(WDClinicalOnboardingViewController *)self pendingGatewayProxy];
    [(WDClinicalOnboardingViewController *)self _loadGatewayProxyForDeeplinking:v4];
  }
  else
  {
    [(WDClinicalOnboardingViewController *)self _configureLocationServices];
  }
  [(WDClinicalOnboardingViewController *)self setShowProviderNotFound:self->_showProviderNotFound];
  [(WDClinicalOnboardingViewController *)self _beginLoadingAlreadyConnectedAccountsIfNecessary];
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationDidBecomeActive name:*MEMORY[0x1E4FB2628] object:0];
}

- (CGSize)preferredContentSize
{
  [MEMORY[0x1E4F83A70] preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingViewController;
  [(WDClinicalOnboardingViewController *)&v3 didReceiveMemoryWarning];
  if ([(WDClinicalOnboardingViewController *)self _isSimulator]) {
    [(WDClinicalOnboardingViewController *)self setSampleAccountsLoader:0];
  }
}

- (id)_providerNotFoundExplanationMessage
{
  if (self->_showOnlyClinicalSharingCapableProviders) {
    HROsloLocalizedString(@"HEALTH_RECORDS_ONBOARDING_NO_LOCATIONS_FOUND_MESSAGE_SHARING", a2);
  }
  else {
  double v2 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_NO_LOCATIONS_FOUND_MESSAGE_CHR");
  }
  return v2;
}

- (id)keyCommands
{
  v6[2] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_dismiss_];
  objc_super v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"f" modifierFlags:0x100000 action:sel_activateSearch_];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)activateSearch:(id)a3
{
  id v3 = [(UISearchController *)self->_searchController searchBar];
  [v3 becomeFirstResponder];
}

- (void)_configureLeftNavigationItemAsCancel
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismiss_];
  id v3 = [(WDClinicalOnboardingViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:v6];

  v4 = [(WDClinicalOnboardingViewController *)self navigationItem];
  double v5 = [v4 leftBarButtonItem];
  [v5 setAccessibilityIdentifier:@"UIA.Health.ClinicalOnboarding.Navigation.Cancel"];
}

- (void)_configureRightNavigationItems
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F2BE98]],
        v3,
        (v4 & 1) == 0))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__WDClinicalOnboardingViewController__configureRightNavigationItems__block_invoke;
    v17[3] = &unk_1E644A600;
    v17[4] = self;
    double v5 = [MEMORY[0x1E4FB13F0] actionWithTitle:@"Suggest New Provider" image:0 identifier:0 handler:v17];
    HKHealthRecordsCurrentEnvironment();
    id v6 = HKHealthRecordsNameForEnvironment();
    id v7 = (void *)MEMORY[0x1E4FB1970];
    id v8 = [NSString stringWithFormat:@"Environment: %@", v6];
    v9 = [(WDClinicalOnboardingViewController *)self _changeEnvironmentMenuElements];
    v10 = [v7 menuWithTitle:v8 children:v9];

    objc_super v11 = (void *)MEMORY[0x1E4FB1970];
    v18[0] = v5;
    v18[1] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v13 = [v11 menuWithTitle:@"Internal Only Options" children:v12];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Internal" menu:v13];
    id v15 = [(WDClinicalOnboardingViewController *)self navigationItem];
    [v15 setRightBarButtonItem:v14];
  }
  else
  {
    id v16 = [(WDClinicalOnboardingViewController *)self navigationItem];
    [v16 setRightBarButtonItem:0];
  }
}

uint64_t __68__WDClinicalOnboardingViewController__configureRightNavigationItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suggestNewProviders];
}

- (void)_configureNavigationItems
{
  id v3 = [(WDClinicalOnboardingViewController *)self presentingViewController];

  if (v3)
  {
    char v4 = [(WDClinicalOnboardingViewController *)self presentingViewController];
    double v5 = [v4 navigationController];
    id v6 = [v5 navigationBar];
    [v6 setAccessibilityIdentifier:@"UIA.Health.ClinicalOnboarding.Navigation"];

    [(WDClinicalOnboardingViewController *)self _configureLeftNavigationItemAsCancel];
    [(WDClinicalOnboardingViewController *)self _configureRightNavigationItems];
  }
}

- (void)_configureSearchController
{
  id v3 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  searchController = self->_searchController;
  self->_searchController = v3;

  [(UISearchController *)self->_searchController setDelegate:self];
  id v10 = [(UISearchController *)self->_searchController searchBar];
  [v10 setDelegate:self];
  double v5 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_SEARCH_PLACEHOLDER");
  [v10 setPlaceholder:v5];

  id v6 = [v10 searchTextField];
  [v6 setAccessibilityIdentifier:@"UIA.Health.ClinicalOnboarding.SearchBar.SearchText"];

  [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
  [(UISearchController *)self->_searchController setHidesNavigationBarDuringPresentation:1];
  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
  id v7 = self->_searchController;
  id v8 = [(WDClinicalOnboardingViewController *)self navigationItem];
  [v8 setSearchController:v7];

  v9 = [(WDClinicalOnboardingViewController *)self navigationItem];
  [v9 setHidesSearchBarWhenScrolling:0];
}

- (void)_configureTableViewCells
{
  id v3 = [(WDClinicalOnboardingViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"AlreadyConnectedCell"];

  char v4 = [(WDClinicalOnboardingViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"SearchResultCell"];

  id v7 = [(WDClinicalOnboardingViewController *)self tableView];
  uint64_t v5 = objc_opt_class();
  id v6 = +[HRWDSpinnerTableViewCell defaultReuseIdentifier];
  [v7 registerClass:v5 forCellReuseIdentifier:v6];
}

- (void)_cacheFeaturedBrandLogos
{
  id v3 = [(HRProfile *)self->_profile healthRecordsStore];
  double v2 = objc_msgSend(v3, "hk_brandImageManager");
  [v2 cacheFeaturedBrandLogosWithCompletion:&__block_literal_global];
}

void __62__WDClinicalOnboardingViewController__cacheFeaturedBrandLogos__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((a2 & 1) == 0 && [v4 code] != 608)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __62__WDClinicalOnboardingViewController__cacheFeaturedBrandLogos__block_invoke_cold_1();
    }
  }
}

- (void)_loadGatewayProxyForDeeplinking:(id)a3
{
  sectionConfiguration = self->_sectionConfiguration;
  id v5 = a3;
  id v6 = [(HRUITableViewSectionConfiguration *)sectionConfiguration sections];
  if ([v6 count])
  {
  }
  else
  {
    BOOL v7 = [(WDClinicalOnboardingViewController *)self showingNoLocations];

    if (!v7) {
      [(WDClinicalOnboardingViewController *)self _showSpinnerView];
    }
  }
  providerServiceStore = self->_providerServiceStore;
  v9 = [v5 gatewayID];
  id v10 = [v5 batchID];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke;
  v11[3] = &unk_1E644A698;
  v11[4] = self;
  [(HKClinicalProviderServiceStore *)providerServiceStore fetchRemoteGatewayWithExternalID:v9 batchID:v10 completion:v11];
}

void __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2;
  block[3] = &unk_1E644A670;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F67740]);
    id v3 = [*(id *)(a1 + 32) title];
    id v4 = [*(id *)(a1 + 32) subtitle];
    id v5 = [*(id *)(a1 + 32) informationURL];
    id v6 = [*(id *)(a1 + 32) brand];
    v18[0] = *(void *)(a1 + 32);
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v8 = (void *)[v2 initWithExternalID:@"DEEPLINK_FAKEPROVIDEREXTERNALID" title:v3 subtitle:v4 location:0 informationURL:v5 brand:v6 gateways:v7];

    v9 = [WDClinicalProviderDetailsViewController alloc];
    id v10 = [*(id *)(a1 + 48) profile];
    id v11 = [(WDClinicalProviderDetailsViewController *)v9 initWithProfile:v10 provider:v8];

    uint64_t v12 = [*(id *)(a1 + 48) navigationController];
    [v12 pushViewController:v11 animated:1];

    v13 = [*(id *)(a1 + 48) navigationController];
    v14 = [v13 transitionCoordinator];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_382;
    v17[3] = &unk_1E644A648;
    v17[4] = *(void *)(a1 + 48);
    [v14 animateAlongsideTransition:0 completion:v17];
  }
  else
  {
    _HKInitializeLogging();
    id v15 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2_cold_1(a1, v15);
    }
    [*(id *)(a1 + 48) setShowProviderNotFound:1];
    [*(id *)(a1 + 48) setPendingGatewayProxy:0];
  }
  return [*(id *)(a1 + 48) _configureLocationServices];
}

uint64_t __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_382(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPendingGatewayProxy:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_resetCacheAndReloadData
{
  [(NSMutableDictionary *)self->_resultsCache removeAllObjects];
  [(WDClinicalOnboardingViewController *)self _searchUsingQuery:&stru_1F1D9FF30];
}

- (void)reloadData
{
  [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration removeAllSections];
  id v3 = [(WDClinicalOnboardingViewController *)self pendingGatewayProxy];
  if (v3 || [(WDClinicalOnboardingViewController *)self showingMainSpinner]) {
    goto LABEL_16;
  }
  if (![(WDClinicalOnboardingViewController *)self hasCompletedAtLeastOneFetch]) {
    goto LABEL_17;
  }
  if (![(WDClinicalOnboardingViewController *)self hasSearchTerm]) {
    goto LABEL_7;
  }
  if ([(NSMutableOrderedSet *)self->_alreadySharingSearchResults count])
  {
    id v4 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration addSectionWithIdentifier:@"AlreadySharing" firstRowReuseIdentifier:0];
    id v6 = HROsloLocalizedString(@"HEALTH_RECORDS_ONBOARDING_ALREADY_SHARING", v5);
    [v4 setHeaderString:v6];

    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableOrderedSet count](self->_alreadySharingSearchResults, "count"));
    [v4 setEstimatedNumRows:v7];

LABEL_7:
    char v8 = 1;
    goto LABEL_9;
  }
  char v8 = 0;
LABEL_9:
  if ([(NSMutableOrderedSet *)self->_supportedSearchResults count])
  {
    v9 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration addSectionWithIdentifier:@"SupportedLocations" firstRowReuseIdentifier:0];
    id v10 = v9;
    if (v8)
    {
      id v11 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_SEARCH_SUGGESTIONS");
      [v10 setHeaderString:v11];
    }
    else
    {
      [v9 setHeaderString:0];
    }
    uint64_t v12 = [(WDClinicalOnboardingViewController *)self _providerNotFoundExplanationMessage];
    [v10 setFooterString:v12];

    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableOrderedSet count](self->_supportedSearchResults, "count"));
    [v10 setEstimatedNumRows:v13];
  }
  if ([(NSMutableOrderedSet *)self->_unsupportedSearchResults count])
  {
    id v3 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration addSectionWithIdentifier:@"UnsupportedLocations" firstRowReuseIdentifier:0];
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableOrderedSet count](self->_unsupportedSearchResults, "count"));
    [v3 setEstimatedNumRows:v14];

LABEL_16:
  }
LABEL_17:
  id v15 = [(WDClinicalOnboardingViewController *)self tableView];
  [v15 reloadData];
}

- (void)setShowProviderNotFound:(BOOL)a3
{
  self->_showProviderNotFound = a3;
  if ([(WDClinicalOnboardingViewController *)self isViewLoaded])
  {
    if (self->_showProviderNotFound)
    {
      [(WDClinicalOnboardingViewController *)self _configureProviderNotFoundView];
    }
    else
    {
      id v4 = [(WDClinicalOnboardingViewController *)self tableView];
      [v4 setTableHeaderView:0];

      [(WDClinicalOnboardingViewController *)self setProviderNotFoundView:0];
    }
    [(WDClinicalOnboardingViewController *)self _updateTableHeaderViewHeight];
  }
}

- (void)_configureProviderNotFoundView
{
  id v3 = [HRProviderNotFoundView alloc];
  id v4 = -[HRProviderNotFoundView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(WDClinicalOnboardingViewController *)self setProviderNotFoundView:v4];

  id v6 = [(WDClinicalOnboardingViewController *)self providerNotFoundView];
  uint64_t v5 = [(WDClinicalOnboardingViewController *)self tableView];
  [v5 setTableHeaderView:v6];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingViewController;
  [(WDClinicalOnboardingViewController *)&v3 viewDidLayoutSubviews];
  [(WDClinicalOnboardingViewController *)self _updateTableHeaderViewHeight];
}

- (void)_updateTableHeaderViewHeight
{
  objc_super v3 = [(WDClinicalOnboardingViewController *)self providerNotFoundView];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__WDClinicalOnboardingViewController__updateTableHeaderViewHeight__block_invoke;
    v4[3] = &unk_1E644A6C0;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.0];
  }
}

void __66__WDClinicalOnboardingViewController__updateTableHeaderViewHeight__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) providerNotFoundView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;

  v9 = [*(id *)(a1 + 32) providerNotFoundView];
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v11 = v10;

  id v12 = [*(id *)(a1 + 32) providerNotFoundView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v11);
}

- (void)_configureLocationServices
{
  if (!self->_locationManager)
  {
    double v3 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E4F1E600]);
    locationManager = self->_locationManager;
    self->_locationManager = v3;

    double v5 = self->_locationManager;
    [(CLLocationManager *)v5 setDelegate:self];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  int v5 = [v4 authorizationStatus];
  if ((v5 - 1) < 2)
  {
    [(WDClinicalOnboardingViewController *)self _configureDeniedAuthorization];
  }
  else if ((v5 - 3) >= 2)
  {
    if (!v5) {
      [(WDClinicalOnboardingViewController *)self _requestWhenInUseAuthorizationIfNeeded];
    }
  }
  else
  {
    uint64_t v6 = [v4 accuracyAuthorization];
    double v7 = (double *)MEMORY[0x1E4F1E748];
    if (v6) {
      double v7 = (double *)MEMORY[0x1E4F1E730];
    }
    [v4 setDesiredAccuracy:*v7];
    _HKInitializeLogging();
    double v8 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
      -[WDClinicalOnboardingViewController locationManagerDidChangeAuthorization:](v8);
    }
    [v4 startUpdatingLocation];
    v9 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
    if ([v9 count])
    {
    }
    else
    {
      BOOL v10 = [(WDClinicalOnboardingViewController *)self showingNoLocations];

      if (!v10) {
        [(WDClinicalOnboardingViewController *)self _showSpinnerView];
      }
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  double v8 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
    -[WDClinicalOnboardingViewController locationManager:didUpdateLocations:](v8);
  }
  [v6 stopUpdatingLocation];
  v9 = [v7 lastObject];

  location = self->_location;
  self->_location = v9;

  locationManager = self->_locationManager;
  self->_locationManager = 0;

  [(WDClinicalOnboardingViewController *)self setLocationEnabled:1];
  [(WDClinicalOnboardingViewController *)self _presentInitialResultsIfNecessary];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  [a3 stopUpdatingLocation];
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  if ([v6 code] == 1)
  {
    [(WDClinicalOnboardingViewController *)self _configureDeniedAuthorization];
  }
  else
  {
    [(WDClinicalOnboardingViewController *)self _presentInitialResultsIfNecessary];
    uint64_t v8 = [v6 code];
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F38];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v10) {
        -[WDClinicalOnboardingViewController locationManager:didFailWithError:]();
      }
    }
    else if (v10)
    {
      -[WDClinicalOnboardingViewController locationManager:didFailWithError:](v9);
    }
  }
}

- (void)_requestWhenInUseAuthorizationIfNeeded
{
  if (self->_locationManager)
  {
    double v3 = [(WDClinicalOnboardingViewController *)self viewIfLoaded];
    id v4 = [v3 window];

    if (v4)
    {
      locationManager = self->_locationManager;
      [(CLLocationManager *)locationManager requestWhenInUseAuthorization];
    }
  }
}

- (void)_configureDeniedAuthorization
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "user denied location authorization", v1, 2u);
}

- (void)_disableLocationAwareness
{
  location = self->_location;
  self->_location = 0;

  [(WDClinicalOnboardingViewController *)self setLocationEnabled:0];
  id v4 = [(WDClinicalOnboardingViewController *)self resultsCache];
  [v4 setObject:0 forKeyedSubscript:@"DefaultListKey"];
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = [(WDClinicalOnboardingViewController *)self presentingViewController];

  if (v4)
  {
    id v6 = [(WDClinicalOnboardingViewController *)self navigationItem];
    int v5 = [v6 leftBarButtonItem];
    [v5 setHidden:1];
  }
}

- (void)willDismissSearchController:(id)a3
{
  [(WDClinicalOnboardingViewController *)self setSearchQuery:&stru_1F1D9FF30];
  [(WDClinicalOnboardingViewController *)self setSearchTerms:MEMORY[0x1E4F1CBF0]];
  id v4 = [(WDClinicalOnboardingViewController *)self presentingViewController];

  if (v4)
  {
    id v6 = [(WDClinicalOnboardingViewController *)self navigationItem];
    int v5 = [v6 leftBarButtonItem];
    [v5 setHidden:0];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  [(WDClinicalOnboardingViewController *)self _hideNoGeoView];
  int v5 = [v4 searchBar];

  id v6 = [v5 text];

  if ([v6 length])
  {
    [(NSTimer *)self->_searchTimer invalidate];
    double v7 = dbl_1C255A7C0[(unint64_t)[v6 length] > 6];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB00];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke;
    v11[3] = &unk_1E644A6E8;
    v11[4] = self;
    id v12 = v6;
    v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v11 block:v7];
    searchTimer = self->_searchTimer;
    self->_searchTimer = v9;
  }
  else
  {
    [(WDClinicalOnboardingViewController *)self _cancelSearch];
  }
}

void __77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _searchUsingQuery:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke_2;
  block[3] = &unk_1E644A6C0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

unsigned char *__77__WDClinicalOnboardingViewController_updateSearchResultsForSearchController___block_invoke_2(uint64_t a1)
{
  CGSize result = *(unsigned char **)(a1 + 32);
  if (result[1072]) {
    return (unsigned char *)[result setShowProviderNotFound:0];
  }
  return result;
}

- (void)_cancelSearch
{
  [(NSTimer *)self->_searchTimer invalidate];
  searchTimer = self->_searchTimer;
  self->_searchTimer = 0;

  [(WDClinicalOnboardingViewController *)self setAlreadySharingSearchResults:0];
  [(WDClinicalOnboardingViewController *)self setUnsupportedSearchResults:0];
  [(WDClinicalOnboardingViewController *)self setSupportedSearchResults:0];
  id v5 = [(UISearchController *)self->_searchController searchBar];
  id v4 = [v5 text];
  [(WDClinicalOnboardingViewController *)self _searchUsingQuery:v4];
}

- (void)_presentInitialResultsIfNecessary
{
  if (![(WDClinicalOnboardingViewController *)self hasSearchTerm])
  {
    [(WDClinicalOnboardingViewController *)self _searchUsingQuery:&stru_1F1D9FF30];
  }
}

- (void)_searchUsingQuery:(id)a3
{
  id v15 = a3;
  id v4 = [(WDClinicalOnboardingViewController *)self searchQuery];
  if ([v4 length]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v15 length] != 0;
  }

  id v6 = [(WDClinicalOnboardingViewController *)self _cacheKeyForSearchQuery:v15];
  [(WDClinicalOnboardingViewController *)self setSearchQuery:v15];
  double v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v8 = [v15 componentsSeparatedByCharactersInSet:v7];
  [(WDClinicalOnboardingViewController *)self setSearchTerms:v8];

  [(WDClinicalOnboardingViewController *)self _hideSpinnerView];
  if (-[WDClinicalOnboardingViewController locationEnabled](self, "locationEnabled") || [v15 length])
  {
    v9 = [(WDClinicalOnboardingViewController *)self resultsCache];
    BOOL v10 = [v9 objectForKeyedSubscript:v6];

    if (v10)
    {
      double v11 = [v10 objectForKeyedSubscript:@"AlreadySharingKey"];
      [(WDClinicalOnboardingViewController *)self setAlreadySharingSearchResults:v11];

      id v12 = [v10 objectForKeyedSubscript:@"SupportedKey"];
      [(WDClinicalOnboardingViewController *)self setSupportedSearchResults:v12];

      v13 = [v10 objectForKeyedSubscript:@"UnsupportedKey"];
      [(WDClinicalOnboardingViewController *)self setUnsupportedSearchResults:v13];

      v14 = [v10 objectForKeyedSubscript:@"NextFromKey"];
      -[WDClinicalOnboardingViewController setNextFrom:](self, "setNextFrom:", [v14 integerValue]);

      [(WDClinicalOnboardingViewController *)self setSpinnerIndexPath:0];
      [(WDClinicalOnboardingViewController *)self reloadData];
      [(WDClinicalOnboardingViewController *)self _showNoLocationsViewIfNeeded];
    }
    else
    {
      if (v5)
      {
        [(WDClinicalOnboardingViewController *)self _resetSearchResults];
        [(WDClinicalOnboardingViewController *)self reloadData];
      }
      [(WDClinicalOnboardingViewController *)self setNextFrom:0];
      [(WDClinicalOnboardingViewController *)self _searchResultsForQuery:v15 from:0];
    }
  }
  else if ([(WDClinicalOnboardingViewController *)self _isSimulator])
  {
    ++self->_searchesInFlight;
    [(WDClinicalOnboardingViewController *)self _didFetchResultsForQuery:&stru_1F1D9FF30 searchResultsPage:0 error:0];
  }
  else
  {
    [(WDClinicalOnboardingViewController *)self _resetSearchResults];
    if (![(UISearchController *)self->_searchController isActive]) {
      [(WDClinicalOnboardingViewController *)self _showNoGeoView];
    }
    [(WDClinicalOnboardingViewController *)self reloadData];
  }
}

- (void)_searchResultsForQuery:(id)a3 from:(int64_t)a4
{
  id v6 = a3;
  location = self->_location;
  if (location)
  {
    uint64_t v8 = NSNumber;
    [(CLLocation *)location coordinate];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    BOOL v10 = NSNumber;
    [(CLLocation *)self->_location coordinate];
    id v12 = [v10 numberWithDouble:v11];
  }
  else
  {
    id v12 = 0;
    v9 = 0;
  }
  [(HKClinicalProviderServiceStore *)self->_providerServiceStore cancelInFlightSearchQueriesWithCompletion:&__block_literal_global_402];
  if (![(WDClinicalOnboardingViewController *)self hasSearchResults]) {
    [(WDClinicalOnboardingViewController *)self _showSpinnerView];
  }
  ++self->_searchesInFlight;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F67748]) initWithSearchString:v6 latitude:v9 longitude:v12 pageOffset:a4 options:self->_showOnlyClinicalSharingCapableProviders];
  providerServiceStore = self->_providerServiceStore;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_404;
  v16[3] = &unk_1E644A738;
  v16[4] = self;
  id v17 = v6;
  id v15 = v6;
  [(HKClinicalProviderServiceStore *)providerServiceStore fetchRemoteSearchResultsPageForQuery:v13 completion:v16];
}

void __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_cold_1();
    }
  }
}

void __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_404(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_2;
  v10[3] = &unk_1E644A710;
  double v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasCompletedAtLeastOneFetch:1];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _didFetchResultsForQuery:v3 searchResultsPage:v4 error:v5];
}

- (void)_didFetchResultsForQuery:(id)a3 searchResultsPage:(id)a4 error:(id)a5
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  --self->_searchesInFlight;
  [(WDClinicalOnboardingViewController *)self _hideSpinnerView];
  if (v9 || (objc_msgSend(v10, "hk_isUserCanceledError") & 1) == 0)
  {
    id v11 = [(WDClinicalOnboardingViewController *)self _cacheKeyForSearchQuery:v8];
    id v12 = v9;
    if ([(WDClinicalOnboardingViewController *)self _isSimulator])
    {
      [(WDClinicalOnboardingViewController *)self setHasCompletedAtLeastOneFetch:1];
      if (v9) {
        goto LABEL_7;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F67758]);
      id v12 = (id)[v13 initWithSearchResults:MEMORY[0x1E4F1CBF0] from:0 nextFrom:0 size:0];
    }
    if (!v12)
    {
      v21 = [(WDClinicalOnboardingViewController *)self resultsCache];
      [v21 removeObjectForKey:v11];

      [(WDClinicalOnboardingViewController *)self _resetSearchResults];
      [(WDClinicalOnboardingViewController *)self setNextFrom:0];
      [(WDClinicalOnboardingViewController *)self setSpinnerIndexPath:0];
      [(WDClinicalOnboardingViewController *)self reloadData];
      [(WDClinicalOnboardingViewController *)self _showNoLocationsViewIfNeeded];
      if (v10) {
        [(WDClinicalOnboardingViewController *)self _presentError:v10];
      }
      goto LABEL_26;
    }
LABEL_7:
    id v46 = v9;
    v14 = [(WDClinicalOnboardingViewController *)self resultsCache];
    v44 = v11;
    id v15 = [v14 objectForKeyedSubscript:v11];

    id v16 = [v15 objectForKeyedSubscript:@"AlreadySharingKey"];
    if (v16) {
      [v15 objectForKeyedSubscript:@"AlreadySharingKey"];
    }
    else {
    id v17 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
    }
    [(WDClinicalOnboardingViewController *)self setAlreadySharingSearchResults:v17];

    LODWORD(v17) = [(WDClinicalOnboardingViewController *)self _isSimulator];
    uint64_t v18 = [v15 objectForKeyedSubscript:@"SupportedKey"];
    v19 = (void *)v18;
    if (v17)
    {
      if (!v18)
      {
        uint64_t v20 = [(WDClinicalOnboardingViewController *)self _mutableOrderedSetWithSampleAccountsForQuery:v8];
LABEL_18:
        objc_super v22 = (void *)v20;
        [(WDClinicalOnboardingViewController *)self setSupportedSearchResults:v20];

        v23 = [v15 objectForKeyedSubscript:@"UnsupportedKey"];
        if (v23) {
          [v15 objectForKeyedSubscript:@"UnsupportedKey"];
        }
        else {
        v24 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
        }
        [(WDClinicalOnboardingViewController *)self setUnsupportedSearchResults:v24];

        v25 = [v12 searchResults];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke;
        v49[3] = &unk_1E644A760;
        v49[4] = self;
        v26 = objc_msgSend(v25, "hk_filter:", v49);
        v27 = objc_msgSend(v25, "hk_filter:", &__block_literal_global_409);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke_3;
        v48[3] = &unk_1E644A760;
        v48[4] = self;
        v42 = v25;
        uint64_t v28 = objc_msgSend(v25, "hk_filter:", v48);
        v29 = [(WDClinicalOnboardingViewController *)self alreadySharingSearchResults];
        v41 = (void *)v28;
        [v29 addObjectsFromArray:v28];

        id v47 = v8;
        id v45 = v10;
        v43 = v15;
        if ([(NSArray *)self->_alreadyConnectedAccounts count]
          && ![v12 from]
          && ![(WDClinicalOnboardingViewController *)self hasSearchTerm])
        {
          uint64_t v30 = [(NSArray *)self->_alreadyConnectedAccounts arrayByAddingObjectsFromArray:v26];

          v26 = (void *)v30;
        }
        v31 = [(WDClinicalOnboardingViewController *)self supportedSearchResults];
        [v31 addObjectsFromArray:v26];

        v32 = [(WDClinicalOnboardingViewController *)self unsupportedSearchResults];
        [v32 addObjectsFromArray:v27];

        -[WDClinicalOnboardingViewController setNextFrom:](self, "setNextFrom:", [v12 nextFrom]);
        v50[0] = @"AlreadySharingKey";
        v33 = [(WDClinicalOnboardingViewController *)self alreadySharingSearchResults];
        v51[0] = v33;
        v50[1] = @"SupportedKey";
        v34 = [(WDClinicalOnboardingViewController *)self supportedSearchResults];
        v51[1] = v34;
        v50[2] = @"UnsupportedKey";
        v35 = [(WDClinicalOnboardingViewController *)self unsupportedSearchResults];
        v51[2] = v35;
        v50[3] = @"NextFromKey";
        v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "nextFrom"));
        v51[3] = v36;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];
        v38 = v37 = v12;
        v39 = [(WDClinicalOnboardingViewController *)self resultsCache];
        id v11 = v44;
        [v39 setObject:v38 forKeyedSubscript:v44];

        [(WDClinicalOnboardingViewController *)self setSpinnerIndexPath:0];
        [(WDClinicalOnboardingViewController *)self reloadData];
        [(WDClinicalOnboardingViewController *)self _showNoLocationsViewIfNeeded];

        id v9 = v46;
        id v8 = v47;
        id v10 = v45;
LABEL_26:

        goto LABEL_27;
      }
    }
    else if (!v18)
    {
      uint64_t v20 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
      goto LABEL_18;
    }
    uint64_t v20 = [v15 objectForKeyedSubscript:@"SupportedKey"];
    goto LABEL_18;
  }
LABEL_27:
}

uint64_t __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSupported])
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1112);
    uint64_t v5 = [v3 brand];
    if ([v4 containsObject:v5])
    {
      uint64_t v6 = 0;
    }
    else
    {
      double v7 = *(void **)(*(void *)(a1 + 32) + 1104);
      id v8 = [v3 brand];
      uint64_t v6 = [v7 containsObject:v8] ^ 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSupported] ^ 1;
}

uint64_t __87__WDClinicalOnboardingViewController__didFetchResultsForQuery_searchResultsPage_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1112);
  id v3 = [a2 brand];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_cacheKeyForSearchQuery:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"DefaultListKey";
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_resetSearchResults
{
  id v3 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
  [(WDClinicalOnboardingViewController *)self setAlreadySharingSearchResults:v3];

  uint64_t v4 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
  [(WDClinicalOnboardingViewController *)self setSupportedSearchResults:v4];

  id v5 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
  [(WDClinicalOnboardingViewController *)self setUnsupportedSearchResults:v5];
}

- (id)_emptyMutableOrderedSet
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:50];
  return v2;
}

- (id)_mutableOrderedSetWithSampleAccountsForQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(WDClinicalOnboardingViewController *)self _emptyMutableOrderedSet];
  uint64_t v6 = [v4 length];

  if (!v6)
  {
    double v7 = [(WDClinicalOnboardingViewController *)self sampleAccountsLoader];
    id v8 = [v7 sampleAccountsAsSearchResults];

    [v5 addObjectsFromArray:v8];
  }
  return v5;
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4 = a3;
  id v5 = [(WDClinicalOnboardingViewController *)self tableView];

  if (v5 == v4)
  {
    [(WDClinicalOnboardingViewController *)self _updateNoContentViewConstraints];
  }
}

- (void)_updateNoContentViewConstraints
{
  id v3 = [(WDClinicalOnboardingViewController *)self tableView];
  [v3 adjustedContentInset];
  double v5 = v4;
  uint64_t v6 = [(WDClinicalOnboardingViewController *)self tableView];
  [v6 safeAreaInsets];
  double v8 = v5 - v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noContentTopConstraint);
  [WeakRetained setConstant:v8];

  id v16 = [(WDClinicalOnboardingViewController *)self tableView];
  [v16 adjustedContentInset];
  double v11 = v10;
  id v12 = [(WDClinicalOnboardingViewController *)self tableView];
  [v12 safeAreaInsets];
  double v14 = -(v11 - v13);
  id v15 = objc_loadWeakRetained((id *)&self->_noContentBottomConstraint);
  [v15 setConstant:v14];
}

- (id)_createNoContentParentView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setPreservesSuperviewLayoutMargins:1];
  [v2 setClipsToBounds:1];
  return v2;
}

- (void)_showNoContentView:(id)a3
{
  v61[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UIView *)self->_noContentParentView subviews];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];

  if (v4)
  {
    if (self->_noContentParentView)
    {
      -[WDClinicalOnboardingViewController setNoContentParentView:](self, "setNoContentParentView:");
    }
    else
    {
      uint64_t v6 = [(WDClinicalOnboardingViewController *)self _createNoContentParentView];
      [(WDClinicalOnboardingViewController *)self setNoContentParentView:v6];
    }
    [(UIView *)self->_noContentParentView addSubview:v4];
    double v7 = [v4 topAnchor];
    double v8 = [(UIView *)self->_noContentParentView safeAreaLayoutGuide];
    id v9 = [v8 topAnchor];
    double v10 = [v7 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v9 multiplier:1.0];

    v59 = v10;
    [(WDClinicalOnboardingViewController *)self setNoContentTopConstraint:v10];
    double v11 = [v4 bottomAnchor];
    id v12 = [(UIView *)self->_noContentParentView safeAreaLayoutGuide];
    double v13 = [v12 bottomAnchor];
    double v14 = [v11 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v13 multiplier:1.0];

    [v10 priority];
    *(float *)&double v16 = v15 + -1.0;
    [v14 setPriority:v16];
    [(WDClinicalOnboardingViewController *)self setNoContentBottomConstraint:v14];
    [(WDClinicalOnboardingViewController *)self _updateNoContentViewConstraints];
    id v45 = (void *)MEMORY[0x1E4F28DC8];
    v55 = [v4 widthAnchor];
    v53 = [(UIView *)self->_noContentParentView widthAnchor];
    v51 = [v55 constraintLessThanOrEqualToAnchor:v53];
    v61[0] = v51;
    v49 = [v4 centerXAnchor];
    id v47 = [(UIView *)self->_noContentParentView centerXAnchor];
    id v17 = [v49 constraintEqualToAnchor:v47];
    v61[1] = v17;
    uint64_t v18 = [v4 leadingAnchor];
    v19 = [(UIView *)self->_noContentParentView leadingAnchor];
    uint64_t v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
    v61[2] = v20;
    id v58 = v4;
    v21 = [v4 trailingAnchor];
    objc_super v22 = [(UIView *)self->_noContentParentView trailingAnchor];
    v23 = [v21 constraintLessThanOrEqualToAnchor:v22];
    v61[3] = v23;
    v61[4] = v59;
    v57 = v14;
    v61[5] = v14;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
    [v45 activateConstraints:v24];

    v25 = [(UIView *)self->_noContentParentView superview];

    if (!v25)
    {
      v26 = [(WDClinicalOnboardingViewController *)self tableView];
      [v26 addSubview:self->_noContentParentView];

      v41 = (void *)MEMORY[0x1E4F28DC8];
      v54 = [(UIView *)self->_noContentParentView widthAnchor];
      v56 = [(WDClinicalOnboardingViewController *)self tableView];
      v52 = [v56 widthAnchor];
      v50 = [v54 constraintEqualToAnchor:v52];
      v60[0] = v50;
      id v46 = [(UIView *)self->_noContentParentView topAnchor];
      v48 = [(WDClinicalOnboardingViewController *)self tableView];
      v44 = [v48 safeAreaLayoutGuide];
      v43 = [v44 topAnchor];
      v42 = [v46 constraintEqualToAnchor:v43];
      v60[1] = v42;
      v39 = [(UIView *)self->_noContentParentView bottomAnchor];
      id v40 = [(WDClinicalOnboardingViewController *)self tableView];
      v38 = [v40 safeAreaLayoutGuide];
      v37 = [v38 bottomAnchor];
      v27 = [v39 constraintEqualToAnchor:v37];
      v60[2] = v27;
      uint64_t v28 = [(UIView *)self->_noContentParentView leadingAnchor];
      v29 = [(WDClinicalOnboardingViewController *)self tableView];
      uint64_t v30 = [v29 leadingAnchor];
      v31 = [v28 constraintEqualToAnchor:v30];
      v60[3] = v31;
      v32 = [(UIView *)self->_noContentParentView trailingAnchor];
      v33 = [(WDClinicalOnboardingViewController *)self tableView];
      v34 = [v33 trailingAnchor];
      v35 = [v32 constraintEqualToAnchor:v34];
      v60[4] = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:5];
      [v41 activateConstraints:v36];
    }
    id v4 = v58;
  }
  else
  {
    [(UIView *)self->_noContentParentView removeFromSuperview];
  }
}

- (BOOL)showingNoLocations
{
  id v2 = [(_UIContentUnavailableView *)self->_noLocationsView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_createNoLocationsView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB2070]);
  id v4 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_NO_LOCATIONS_FOUND");
  double v5 = objc_msgSend(v3, "initWithFrame:title:style:", v4, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = [(WDClinicalOnboardingViewController *)self _providerNotFoundExplanationMessage];
  [v5 setMessage:v6];

  LODWORD(v7) = 1148846080;
  [v5 setContentCompressionResistancePriority:1 forAxis:v7];
  return v5;
}

- (void)_showNoLocationsViewIfNeeded
{
  if ([(WDClinicalOnboardingViewController *)self hasSearchResults])
  {
    [(WDClinicalOnboardingViewController *)self _hideNoLocationsView];
  }
  else
  {
    id v3 = [(_UIContentUnavailableView *)self->_noLocationsView superview];

    if (!v3)
    {
      if (self->_noLocationsView)
      {
        -[WDClinicalOnboardingViewController setNoLocationsView:](self, "setNoLocationsView:");
      }
      else
      {
        id v4 = [(WDClinicalOnboardingViewController *)self _createNoLocationsView];
        [(WDClinicalOnboardingViewController *)self setNoLocationsView:v4];
      }
      noLocationsView = self->_noLocationsView;
      [(WDClinicalOnboardingViewController *)self _showNoContentView:noLocationsView];
    }
  }
}

- (void)_hideNoLocationsView
{
}

- (BOOL)showingMainSpinner
{
  id v2 = [(HRWDSpinnerView *)self->_spinnerView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_createSpinnerView
{
  id v2 = objc_alloc_init(HRWDSpinnerView);
  [(HRWDSpinnerView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v3 = HRLocalizedString(@"LOADING_NO_ELLIPSIS");
  [(HRWDSpinnerView *)v2 setMessageWhileSpinning:v3];

  id v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1024];
  [(HRWDSpinnerView *)v2 setMessageFont:v4];

  return v2;
}

- (void)_showSpinnerView
{
  BOOL v3 = [(HRWDSpinnerView *)self->_spinnerView superview];

  if (!v3)
  {
    if (self->_spinnerView)
    {
      -[WDClinicalOnboardingViewController setSpinnerView:](self, "setSpinnerView:");
    }
    else
    {
      id v4 = [(WDClinicalOnboardingViewController *)self _createSpinnerView];
      [(WDClinicalOnboardingViewController *)self setSpinnerView:v4];
    }
    [(WDClinicalOnboardingViewController *)self _showNoContentView:self->_spinnerView];
    spinnerView = self->_spinnerView;
    [(HRWDSpinnerView *)spinnerView startSpinner];
  }
}

- (void)_hideSpinnerView
{
  [(HRWDSpinnerView *)self->_spinnerView stopSpinner];
  [(WDClinicalOnboardingViewController *)self _showNoContentView:0];
}

- (BOOL)showingNoGeoView
{
  id v2 = [(WDClinicalOnboardingNoGeoView *)self->_noGeoView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_createNoGeoView
{
  id v2 = objc_alloc_init(WDClinicalOnboardingNoGeoView);
  [(WDClinicalOnboardingNoGeoView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (void)_showNoGeoView
{
  BOOL v3 = [(WDClinicalOnboardingNoGeoView *)self->_noGeoView superview];

  if (!v3)
  {
    if (self->_noGeoView)
    {
      -[WDClinicalOnboardingViewController setNoGeoView:](self, "setNoGeoView:");
    }
    else
    {
      id v4 = [(WDClinicalOnboardingViewController *)self _createNoGeoView];
      [(WDClinicalOnboardingViewController *)self setNoGeoView:v4];
    }
    noGeoView = self->_noGeoView;
    [(WDClinicalOnboardingViewController *)self _showNoContentView:noGeoView];
  }
}

- (void)_hideNoGeoView
{
}

- (BOOL)couldFetchAdditionalResults
{
  return [(WDClinicalOnboardingViewController *)self nextFrom] > 0;
}

- (BOOL)hasSearchTerm
{
  return [(NSString *)self->_searchQuery length] != 0;
}

- (BOOL)hasSearchResults
{
  return [(NSMutableOrderedSet *)self->_supportedSearchResults count]
      || [(WDClinicalOnboardingViewController *)self hasSearchTerm]
      && [(NSMutableOrderedSet *)self->_alreadySharingSearchResults count]
      || [(NSMutableOrderedSet *)self->_unsupportedSearchResults count] != 0;
}

- (BOOL)searchInFlight
{
  return self->_searchesInFlight > 0;
}

- (WDClinicalSampleAccountsLoader)sampleAccountsLoader
{
  sampleAccountsLoader = self->_sampleAccountsLoader;
  if (!sampleAccountsLoader)
  {
    id v4 = [[WDClinicalSampleAccountsLoader alloc] initWithProfile:self->_profile];
    [(WDClinicalOnboardingViewController *)self setSampleAccountsLoader:v4];

    sampleAccountsLoader = self->_sampleAccountsLoader;
  }
  return sampleAccountsLoader;
}

- (BOOL)_isSimulator
{
  return 0;
}

- (void)_beginLoadingAlreadyConnectedAccountsIfNecessary
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0xCu);
}

void __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2;
  block[3] = &unk_1E644A808;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 48);
  objc_copyWeak(&to, (id *)(a1 + 48));
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    BOOL v3 = (id)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id WeakRetained = objc_loadWeakRetained(v2);
      id v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      id v24 = v6;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_1C21A1000, v3, OS_LOG_TYPE_ERROR, "%{public}@: failed fetching all accounts: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG))
    {
      id v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = objc_loadWeakRetained(v2);
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2_cold_1(v12, buf, v9, v10);
      }
    }
    double v13 = objc_msgSend(*(id *)(a1 + 40), "hk_filter:", &__block_literal_global_430);
    BOOL v3 = [v13 sortedArrayUsingComparator:&__block_literal_global_434];

    id v14 = objc_loadWeakRetained(&to);
    [v14 setAlreadyConnectedAccounts:v3];

    float v15 = [v3 hk_mapToSet:&__block_literal_global_437];
    id v16 = objc_loadWeakRetained(&to);
    [v16 setAlreadyConnectedBrands:v15];

    id v17 = objc_msgSend(*(id *)(a1 + 40), "hk_filter:", &__block_literal_global_439);
    uint64_t v18 = objc_msgSend(v17, "hk_map:", &__block_literal_global_441);

    v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
    id v20 = objc_loadWeakRetained(&to);
    [v20 setAlreadySharingBrands:v19];

    id v21 = objc_loadWeakRetained(&to);
    [v21 reloadData];
  }
  objc_destroyWeak(&to);
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_427(uint64_t a1, void *a2)
{
  return [a2 canEnableSharingToProvider];
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2_431(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 title];
  id v6 = [v4 title];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 brand];
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isSharingToProvider];
}

uint64_t __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 brand];
}

- (void)_presentLoginForAlreadyConnectedAccount:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
    [(WDClinicalOnboardingViewController *)v5 _presentLoginForAlreadyConnectedAccount:v4];
  }
  objc_initWeak(&location, self);
  id v6 = [(HRProfile *)self->_profile clinicalSourcesDataProvider];
  profile = self->_profile;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__WDClinicalOnboardingViewController__presentLoginForAlreadyConnectedAccount___block_invoke;
  v9[3] = &unk_1E644A858;
  id v8 = v4;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  [v6 beginReloginSessionForAccount:v8 fromViewController:self profile:profile loginCancelledHandler:0 errorHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __78__WDClinicalOnboardingViewController__presentLoginForAlreadyConnectedAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HRViewControllerFactory shared];
  id v5 = [*(id *)(a1 + 32) gateway];
  id v7 = [v4 makeFailedToOnboardAccountAlertControllerToGateway:v5 error:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentViewController:v7 animated:1 completion:0];
}

- (void)_proceedWithAlreadyConnectedAccount:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
    [(WDClinicalOnboardingViewController *)v5 _proceedWithAlreadyConnectedAccount:v4];
  }
  id v6 = +[OAuthCompletionNotificationUserInfoKeys account];
  id v12 = v6;
  v13[0] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  id v8 = (void *)MEMORY[0x1E4F28EA0];
  id v9 = [MEMORY[0x1E4F28EA0] OAuthCompletionNotification];
  id v10 = [v8 notificationWithName:v9 object:self userInfo:v7];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotification:v10];
}

- (void)dismiss:(id)a3
{
  id v4 = [(WDClinicalOnboardingViewController *)self dismissalViewController];

  if (v4) {
    [(WDClinicalOnboardingViewController *)self dismissalViewController];
  }
  else {
  id v5 = [(WDClinicalOnboardingViewController *)self navigationController];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
    -[WDClinicalOnboardingViewController _presentError:](v5, v4);
  }
  id v6 = HRLocalizedString(@"HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_TITLE");
  id v7 = HRLocalizedString(@"HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_ONBOARDING_SEARCH");
  id v8 = [v4 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v9)
  {
    uint64_t v10 = [v4 code];
    if (v10 == -1009)
    {
      id v11 = @"HEALTH_RECORDS_ERROR_NO_CONNECTION_TO_INTERNET";
      goto LABEL_9;
    }
    if (v10 == -1003 && [MEMORY[0x1E4F2B860] isAppleInternalInstall])
    {
      id v11 = @"HEALTH_RECORDS_ERROR_REQUIRES_INTERNAL_NETWORK";
LABEL_9:
      uint64_t v12 = HRLocalizedString(v11);

      id v7 = (void *)v12;
    }
  }
  double v13 = [(WDClinicalOnboardingViewController *)self presentedViewController];

  if (!v13)
  {
    id v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    float v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = HBXLocalizedString(@"OK");
    id v17 = [v15 actionWithTitle:v16 style:0 handler:0];

    [v14 addAction:v17];
    [(WDClinicalOnboardingViewController *)self presentViewController:v14 animated:1 completion:0];
  }
}

- (void)_suggestNewProviders
{
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Suggest New Providers" message:@"Let the team know which healthcare providers you would like to see supported by filing a Radar." preferredStyle:1];
  id v3 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  id v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"File Radar" style:0 handler:&__block_literal_global_479];
  [v5 addAction:v4];
  [v5 addAction:v3];
  [(WDClinicalOnboardingViewController *)self presentViewController:v5 animated:1 completion:0];
}

void __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToHealthRadarURLForComponent:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", 938492, @"[HealthcareProviderSuggestion] ", @"It would be great to also see support for these healthcare providers:\n1. ", 9, 6, 0, 0, 0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openURL:v1 configuration:0 completionHandler:&__block_literal_global_490];
}

void __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke_2_cold_1();
    }
  }
}

- (id)_changeEnvironmentMenuElements
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 14; ++i)
  {
    id v5 = HKHealthRecordsNameForEnvironment();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__WDClinicalOnboardingViewController__changeEnvironmentMenuElements__block_invoke;
    v9[3] = &unk_1E644A8C0;
    void v9[4] = self;
    v9[5] = i;
    id v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:v5 image:0 identifier:0 handler:v9];
    [v3 addObject:v6];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

uint64_t __68__WDClinicalOnboardingViewController__changeEnvironmentMenuElements__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeEnvironment:*(void *)(a1 + 40)];
}

- (void)_changeEnvironment:(int64_t)a3
{
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    HKHealthRecordsSetEnvironment();
    id v4 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke;
    block[3] = &unk_1E644A6C0;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29038]);
  [v2 setLaunchPath:@"/bin/zsh"];
  [v2 setArguments:&unk_1F1DC21C8];
  id v7 = 0;
  char v3 = [v2 launchAndReturnError:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  [v2 waitUntilExit];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_502;
  void v6[3] = &unk_1E644A6C0;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_502(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetCacheAndReloadData];
  id v2 = *(void **)(a1 + 32);
  return [v2 _configureRightNavigationItems];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  id v7 = [v6 headerString];
  uint64_t v8 = [v7 length];

  if (v8) {
    double v9 = *MEMORY[0x1E4FB2F28];
  }
  else {
    double v9 = 10.0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 headerString];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  spinnerIndexPath = self->_spinnerIndexPath;
  if (spinnerIndexPath && [(NSIndexPath *)spinnerIndexPath section] == a4)
  {
    uint64_t v8 = 0;
  }
  else
  {
    double v9 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a4];
    uint64_t v8 = [v10 footerString];
  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char v3 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  uint64_t v8 = [v7 identifier];
  if (![v8 isEqualToString:@"SupportedLocations"])
  {

    goto LABEL_5;
  }
  BOOL v9 = [(WDClinicalOnboardingViewController *)self couldFetchAdditionalResults];

  if (!v9)
  {
LABEL_5:
    double v13 = [v7 estimatedNumRows];
    int64_t v14 = [v13 integerValue];
    goto LABEL_6;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28D58];
  id v11 = [v7 estimatedNumRows];
  uint64_t v12 = objc_msgSend(v10, "indexPathForRow:inSection:", objc_msgSend(v11, "integerValue"), a4);
  [(WDClinicalOnboardingViewController *)self setSpinnerIndexPath:v12];

  double v13 = [v7 estimatedNumRows];
  int64_t v14 = [v13 integerValue] + 1;
LABEL_6:

  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a4;
  id v7 = [v5 secondarySystemBackgroundColor];
  [v6 setBackgroundColor:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WDClinicalOnboardingViewController *)self spinnerIndexPath];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = +[HRWDSpinnerTableViewCell defaultReuseIdentifier];
    id v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];
  }
  else
  {
    uint64_t v10 = [(WDClinicalOnboardingViewController *)self accountSearchResultAtIndexPath:v7];
    if (v10)
    {
      id v11 = [v6 dequeueReusableCellWithIdentifier:@"AlreadyConnectedCell" forIndexPath:v7];
      [v11 setSelectionStyle:3];
      [v11 setAccessoryType:1];
      uint64_t v12 = [(HRProfile *)self->_profile clinicalSourcesDataProvider];
      [v11 setBrandable:v10 dataProvider:v12];
    }
    else
    {
      double v13 = [(WDClinicalOnboardingViewController *)self providerSearchResultAtIndexPath:v7];
      if (!v13)
      {
        _HKInitializeLogging();
        int64_t v14 = (void *)*MEMORY[0x1E4F29F38];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
          -[WDClinicalOnboardingViewController tableView:cellForRowAtIndexPath:](v14);
        }
      }
      id v11 = [v6 dequeueReusableCellWithIdentifier:@"SearchResultCell" forIndexPath:v7];
      float v15 = [(HRProfile *)self->_profile clinicalSourcesDataProvider];
      [v11 setSearchResult:v13 dataProvider:v15 searchTerms:self->_searchTerms];

      [v11 setSelectionStyle:3];
    }
  }

  return v11;
}

- (id)providerSearchResultAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  id v7 = [v6 identifier];
  if (v7 == @"SupportedLocations"
    || (uint64_t v8 = v7,
        [v6 identifier],
        int v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:@"SupportedLocations"],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    id v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__supportedSearchResults;
LABEL_10:
    id v20 = *(id *)((char *)&self->super.super.super.super.super.isa + *v11);
    goto LABEL_11;
  }
  uint64_t v12 = [v6 identifier];
  if (v12 == @"AlreadySharing"
    || (double v13 = v12,
        [v6 identifier],
        int64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isEqualToString:@"AlreadySharing"],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    id v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__alreadySharingSearchResults;
    goto LABEL_10;
  }
  id v16 = [v6 identifier];
  if (v16 == @"UnsupportedLocations"
    || (id v17 = v16,
        [v6 identifier],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isEqualToString:@"UnsupportedLocations"],
        v18,
        v17,
        v19))
  {
    id v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__unsupportedSearchResults;
    goto LABEL_10;
  }
  id v20 = 0;
LABEL_11:
  unint64_t v21 = [v4 row];
  if (v21 >= [v20 count])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      -[WDClinicalOnboardingViewController providerSearchResultAtIndexPath:]();
    }
    id v23 = 0;
  }
  else
  {
    objc_super v22 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
  }
  return v23;
}

- (id)accountSearchResultAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HRUITableViewSectionConfiguration *)self->_sectionConfiguration sections];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  id v7 = [v6 identifier];
  if (v7 == @"SupportedLocations"
    || (uint64_t v8 = v7,
        [v6 identifier],
        int v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqualToString:@"SupportedLocations"],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    id v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__supportedSearchResults;
LABEL_7:
    id v16 = *(id *)((char *)&self->super.super.super.super.super.isa + *v11);
    goto LABEL_8;
  }
  uint64_t v12 = [v6 identifier];
  if (v12 == @"UnsupportedLocations"
    || (double v13 = v12,
        [v6 identifier],
        int64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqualToString:@"UnsupportedLocations"],
        v14,
        v13,
        v15))
  {
    id v11 = &OBJC_IVAR___WDClinicalOnboardingViewController__unsupportedSearchResults;
    goto LABEL_7;
  }
  id v16 = 0;
LABEL_8:
  unint64_t v17 = [v4 row];
  if (v17 >= [v16 count])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      -[WDClinicalOnboardingViewController providerSearchResultAtIndexPath:]();
    }
    id v19 = 0;
  }
  else
  {
    uint64_t v18 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
  }
  return v19;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 frame];
  double v8 = v6 + v7;
  [v4 contentSize];
  double v10 = v9;

  if (v8 >= v10 - (float)(*MEMORY[0x1E4FB2F30] + *MEMORY[0x1E4FB2F30])
    && [(WDClinicalOnboardingViewController *)self couldFetchAdditionalResults]
    && ![(WDClinicalOnboardingViewController *)self searchInFlight])
  {
    id v11 = [(WDClinicalOnboardingViewController *)self searchQuery];
    [(WDClinicalOnboardingViewController *)self _searchResultsForQuery:v11 from:[(WDClinicalOnboardingViewController *)self nextFrom]];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(WDClinicalOnboardingViewController *)self accountSearchResultAtIndexPath:v5];
  if (v6)
  {
    _HKInitializeLogging();
    double v7 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
      -[WDClinicalOnboardingViewController tableView:didSelectRowAtIndexPath:](v7, (uint64_t)self, v6);
    }
    if ([v6 needsLoginToEnableClinicalSharing])
    {
      [(WDClinicalOnboardingViewController *)self _presentLoginForAlreadyConnectedAccount:v6];
      double v8 = [(WDClinicalOnboardingViewController *)self tableView];
      [v8 deselectRowAtIndexPath:v5 animated:1];
    }
    else
    {
      [(WDClinicalOnboardingViewController *)self _proceedWithAlreadyConnectedAccount:v6];
    }
  }
  else
  {
    double v9 = [(WDClinicalOnboardingViewController *)self providerSearchResultAtIndexPath:v5];
    if (v9)
    {
      if ([(WDClinicalOnboardingViewController *)self _isSimulator])
      {
        double v10 = [(WDClinicalOnboardingViewController *)self sampleAccountsLoader];
        [(HRProfile *)self->_profile setClinicalSampleAccountsLoader:v10];
      }
      _HKInitializeLogging();
      id v11 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
        -[WDClinicalOnboardingViewController tableView:didSelectRowAtIndexPath:](v11);
      }
      uint64_t v12 = [[WDClinicalProviderDetailsViewController alloc] initWithProfile:self->_profile searchResult:v9];
      [(WDClinicalOnboardingViewController *)self showViewController:v12 sender:self];
    }
    else
    {
      _HKInitializeLogging();
      double v13 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        -[WDClinicalOnboardingViewController tableView:didSelectRowAtIndexPath:](v13);
      }
    }
  }
}

- (BOOL)showProviderNotFound
{
  return self->_showProviderNotFound;
}

- (BOOL)showOnlyClinicalSharingCapableProviders
{
  return self->_showOnlyClinicalSharingCapableProviders;
}

- (void)setShowOnlyClinicalSharingCapableProviders:(BOOL)a3
{
  self->_showOnlyClinicalSharingCapableProviders = a3;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (HKClinicalProviderServiceStore)providerServiceStore
{
  return self->_providerServiceStore;
}

- (NSArray)alreadyConnectedAccounts
{
  return self->_alreadyConnectedAccounts;
}

- (void)setAlreadyConnectedAccounts:(id)a3
{
}

- (NSSet)alreadyConnectedBrands
{
  return self->_alreadyConnectedBrands;
}

- (void)setAlreadyConnectedBrands:(id)a3
{
}

- (NSSet)alreadySharingBrands
{
  return self->_alreadySharingBrands;
}

- (void)setAlreadySharingBrands:(id)a3
{
}

- (NSMutableOrderedSet)alreadySharingSearchResults
{
  return self->_alreadySharingSearchResults;
}

- (void)setAlreadySharingSearchResults:(id)a3
{
}

- (NSMutableOrderedSet)supportedSearchResults
{
  return self->_supportedSearchResults;
}

- (void)setSupportedSearchResults:(id)a3
{
}

- (NSMutableOrderedSet)unsupportedSearchResults
{
  return self->_unsupportedSearchResults;
}

- (void)setUnsupportedSearchResults:(id)a3
{
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (NSMutableDictionary)resultsCache
{
  return self->_resultsCache;
}

- (int64_t)nextFrom
{
  return self->_nextFrom;
}

- (void)setNextFrom:(int64_t)a3
{
  self->_nextFrom = a3;
}

- (void)setSearchInFlight:(BOOL)a3
{
  self->_searchInFlight = a3;
}

- (HRUITableViewSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (void)setSectionConfiguration:(id)a3
{
}

- (BOOL)hasCompletedAtLeastOneFetch
{
  return self->_hasCompletedAtLeastOneFetch;
}

- (void)setHasCompletedAtLeastOneFetch:(BOOL)a3
{
  self->_hasCompletedAtLeastOneFetch = a3;
}

- (BOOL)locationEnabled
{
  return self->_locationEnabled;
}

- (void)setLocationEnabled:(BOOL)a3
{
  self->_locationEnabled = a3;
}

- (UIView)noContentParentView
{
  return self->_noContentParentView;
}

- (void)setNoContentParentView:(id)a3
{
}

- (_UIContentUnavailableView)noLocationsView
{
  return self->_noLocationsView;
}

- (void)setNoLocationsView:(id)a3
{
}

- (NSLayoutConstraint)noContentTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noContentTopConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setNoContentTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)noContentBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noContentBottomConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setNoContentBottomConstraint:(id)a3
{
}

- (WDClinicalOnboardingNoGeoView)noGeoView
{
  return self->_noGeoView;
}

- (void)setNoGeoView:(id)a3
{
}

- (UIView)providerNotFoundView
{
  return self->_providerNotFoundView;
}

- (void)setProviderNotFoundView:(id)a3
{
}

- (UIViewController)dismissalViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setDismissalViewController:(id)a3
{
}

- (NSIndexPath)spinnerIndexPath
{
  return self->_spinnerIndexPath;
}

- (void)setSpinnerIndexPath:(id)a3
{
}

- (HRWDSpinnerView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void)setSampleAccountsLoader:(id)a3
{
}

- (WDClinicalGatewayProxy)pendingGatewayProxy
{
  return self->_pendingGatewayProxy;
}

- (void)setPendingGatewayProxy:(id)a3
{
}

- (HKClinicalAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_pendingGatewayProxy, 0);
  objc_storeStrong((id *)&self->_sampleAccountsLoader, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_spinnerIndexPath, 0);
  objc_destroyWeak((id *)&self->_dismissalViewController);
  objc_storeStrong((id *)&self->_providerNotFoundView, 0);
  objc_storeStrong((id *)&self->_noGeoView, 0);
  objc_destroyWeak((id *)&self->_noContentBottomConstraint);
  objc_destroyWeak((id *)&self->_noContentTopConstraint);
  objc_storeStrong((id *)&self->_noLocationsView, 0);
  objc_storeStrong((id *)&self->_noContentParentView, 0);
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_unsupportedSearchResults, 0);
  objc_storeStrong((id *)&self->_supportedSearchResults, 0);
  objc_storeStrong((id *)&self->_alreadySharingSearchResults, 0);
  objc_storeStrong((id *)&self->_alreadySharingBrands, 0);
  objc_storeStrong((id *)&self->_alreadyConnectedBrands, 0);
  objc_storeStrong((id *)&self->_alreadyConnectedAccounts, 0);
  objc_storeStrong((id *)&self->_providerServiceStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchTimer, 0);
}

void __62__WDClinicalOnboardingViewController__cacheFeaturedBrandLogos__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C21A1000, v0, v1, "Failed to cache brand logos: %{public}@", v2, v3, v4, v5, v6);
}

void __70__WDClinicalOnboardingViewController__loadGatewayProxyForDeeplinking___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1C21A1000, v4, v5, "Failed to fetch remote gateway, error: %@", v6, v7, v8, v9, v10);
}

- (void)locationManagerDidChangeAuthorization:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_1C21A1000, v3, v4, "%{public}@ requesting current location", v5, v6, v7, v8, 2u);
}

- (void)locationManager:(void *)a1 didUpdateLocations:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_1C21A1000, v3, v4, "%{public}@ received current location", v5, v6, v7, v8, 2u);
}

- (void)locationManager:(os_log_t)log didFailWithError:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "could not obtain location fix", v1, 2u);
}

- (void)locationManager:didFailWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C21A1000, v0, v1, "could not determine location, error: %{public}@", v2, v3, v4, v5, v6);
}

void __66__WDClinicalOnboardingViewController__searchResultsForQuery_from___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C21A1000, v0, v1, "Unable to cancel in-flight search requests; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __86__WDClinicalOnboardingViewController__beginLoadingAlreadyConnectedAccountsIfNecessary__block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1C21A1000, log, OS_LOG_TYPE_DEBUG, "%{public}@: successfully fetched all accounts", buf, 0xCu);
}

- (void)_presentLoginForAlreadyConnectedAccount:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a3 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(v8, v9, v10, v11, v12, 0x16u);
}

- (void)_proceedWithAlreadyConnectedAccount:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a3 identifier];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1C21A1000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: proceeding with account %{public}@", v8, 0x16u);
}

- (void)_presentError:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1C21A1000, v5, v6, "onboarding search error: %{public}@", v7, v8, v9, v10, v11);
}

void __58__WDClinicalOnboardingViewController__suggestNewProviders__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C21A1000, v0, v1, "Could not open Tap-to-Radar URL %{public}@", v2, v3, v4, v5, v6);
}

void __57__WDClinicalOnboardingViewController__changeEnvironment___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "%{public}@ error killing healthd: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C21A1000, v4, v5, "%{public}@ neither an account nor a provider search result at index path %{public}@, attempting to continue", v6, v7, v8, v9, v10);
}

- (void)providerSearchResultAtIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C21A1000, v0, v1, "indexPath out of bounds: %@", v2, v3, v4, v5, v6);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C21A1000, v4, v5, "%{public}@: tappable search result at %{public}@ is nil", v6, v7, v8, v9, v10);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C21A1000, v4, v5, "%{public}@: showing provider details view controller", v6, v7, v8, v9, v10);
}

- (void)tableView:(void *)a3 didSelectRowAtIndexPath:.cold.3(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v12 = [a3 identifier];
  [a3 needsLoginToEnableClinicalSharing];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(v7, v8, v9, v10, v11, 0x1Cu);
}

@end