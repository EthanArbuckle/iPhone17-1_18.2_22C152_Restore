@interface WDClinicalProviderDetailsViewController
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKClinicalProvider)provider;
- (HKClinicalProviderSearchResult)searchResult;
- (HKClinicalProviderServiceStore)providerServiceStore;
- (HRProfile)profile;
- (HRWDSpinnerView)spinnerView;
- (NSArray)connectedGateways;
- (NSArray)internalOnlyVisibleGateways;
- (NSArray)sections;
- (NSArray)unavailableGateways;
- (NSArray)unconnectedGateways;
- (NSCache)providerCache;
- (NSLayoutConstraint)noContentBottomConstraint;
- (NSLayoutConstraint)noContentTopConstraint;
- (UIView)noContentParentView;
- (WDClinicalProviderDetailsViewController)initWithProfile:(id)a3 provider:(id)a4;
- (WDClinicalProviderDetailsViewController)initWithProfile:(id)a3 searchResult:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_createNoContentParentView;
- (id)_createSpinnerView;
- (id)_filterGatewaysForDisplay:(id)a3;
- (id)_gatewayAtIndexPath:(id)a3;
- (id)_initWithProfile:(id)a3;
- (id)_orderGatewaysForDisplay:(id)a3;
- (id)latestSupportedVersionOfGateway:(id)a3 fromGateways:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)fetchesInFlight;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_computeSections;
- (void)_computeSectionsWithGateways:(id)a3 connectedGateways:(id)a4;
- (void)_fetchDetailsForSearchResult:(id)a3;
- (void)_handleTapForActivateGateway:(id)a3;
- (void)_hideSpinnerView;
- (void)_presentError:(id)a3;
- (void)_presentUnavailableAlertForGatewayTitle:(id)a3;
- (void)_showNoContentView:(id)a3;
- (void)_showSpinnerView;
- (void)_updateNoContentViewConstraints;
- (void)clearLoginBusyIndicator;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)setConnectedGateways:(id)a3;
- (void)setFetchesInFlight:(int64_t)a3;
- (void)setInternalOnlyVisibleGateways:(id)a3;
- (void)setNoContentBottomConstraint:(id)a3;
- (void)setNoContentParentView:(id)a3;
- (void)setNoContentTopConstraint:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderCache:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setSections:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setUnavailableGateways:(id)a3;
- (void)setUnconnectedGateways:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDClinicalProviderDetailsViewController

- (id)_initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [(WDClinicalProviderDetailsViewController *)self initWithStyle:1];
  v6 = v5;
  if (v5)
  {
    [(WDClinicalProviderDetailsViewController *)v5 setProfile:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(WDClinicalProviderDetailsViewController *)v6 setProviderCache:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F67760]);
    v9 = [(WDClinicalProviderDetailsViewController *)v6 profile];
    v10 = [v9 healthStore];
    uint64_t v11 = [v8 initWithHealthStore:v10];
    providerServiceStore = v6->_providerServiceStore;
    v6->_providerServiceStore = (HKClinicalProviderServiceStore *)v11;
  }
  return v6;
}

- (WDClinicalProviderDetailsViewController)initWithProfile:(id)a3 searchResult:(id)a4
{
  id v6 = a4;
  id v7 = [(WDClinicalProviderDetailsViewController *)self _initWithProfile:a3];
  id v8 = v7;
  if (v7) {
    [(WDClinicalProviderDetailsViewController *)v7 setSearchResult:v6];
  }

  return v8;
}

- (WDClinicalProviderDetailsViewController)initWithProfile:(id)a3 provider:(id)a4
{
  id v6 = a4;
  id v7 = [(WDClinicalProviderDetailsViewController *)self _initWithProfile:a3];
  id v8 = v7;
  if (v7) {
    [(WDClinicalProviderDetailsViewController *)v7 setProvider:v6];
  }

  return v8;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)WDClinicalProviderDetailsViewController;
  [(HKTableViewController *)&v24 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v4 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  double v5 = *MEMORY[0x1E4FB2F28];
  id v6 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v6 setRowHeight:v5];

  id v7 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v7 setEstimatedRowHeight:300.0];

  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  v9 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v9 setSeparatorColor:v8];

  v10 = [(WDClinicalProviderDetailsViewController *)self navigationController];
  uint64_t v11 = [v10 navigationBar];
  [v11 setPrefersLargeTitles:0];

  v12 = [(WDClinicalProviderDetailsViewController *)self tableView];
  uint64_t v13 = objc_opt_class();
  v14 = +[WDClinicalLocationCell defaultReuseIdentifier];
  [v12 registerClass:v13 forCellReuseIdentifier:v14];

  v15 = [(WDClinicalProviderDetailsViewController *)self tableView];
  uint64_t v16 = objc_opt_class();
  v17 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v15 registerClass:v16 forCellReuseIdentifier:v17];

  v18 = [(WDClinicalProviderDetailsViewController *)self tableView];
  uint64_t v19 = objc_opt_class();
  v20 = [(id)objc_opt_class() defaultReuseIdentifier];
  [v18 registerClass:v19 forCellReuseIdentifier:v20];

  v21 = +[CHRAnalyticsManager shared];
  v22 = [(WDClinicalProviderDetailsViewController *)self provider];
  v23 = [v22 informationURL];
  [v21 postOnboardingFunnelEventWithStep:3 context:0 gatewayUrl:v23];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WDClinicalProviderDetailsViewController;
  [(WDClinicalProviderDetailsViewController *)&v6 viewWillAppear:a3];
  id v4 = [(WDClinicalProviderDetailsViewController *)self searchResult];

  if (v4)
  {
    double v5 = [(WDClinicalProviderDetailsViewController *)self searchResult];
    [(WDClinicalProviderDetailsViewController *)self _fetchDetailsForSearchResult:v5];
  }
}

- (void)_fetchDetailsForSearchResult:(id)a3
{
  id v4 = a3;
  [(WDClinicalProviderDetailsViewController *)self _showSpinnerView];
  double v5 = [v4 externalID];
  objc_super v6 = [(WDClinicalProviderDetailsViewController *)self providerCache];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = [v7 objectForKeyedSubscript:@"_CacheDateKey"];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:v8];
      double v11 = v10;

      if (v11 <= 180.0)
      {
        v22 = [v7 objectForKeyedSubscript:@"_CacheProviderKey"];
        [(WDClinicalProviderDetailsViewController *)self setProvider:v22];
        [(WDClinicalProviderDetailsViewController *)self _hideSpinnerView];

        goto LABEL_13;
      }
      v12 = [(WDClinicalProviderDetailsViewController *)self providerCache];
      [v12 removeObjectForKey:v5];
    }
  }
  uint64_t v13 = [v4 externalID];
  int v14 = [v13 hasPrefix:*MEMORY[0x1E4F676F0]];

  if (v14)
  {
    v15 = [(HRProfile *)self->_profile clinicalSampleAccountsLoader];
    uint64_t v16 = [v4 externalID];
    id v27 = 0;
    v17 = [v15 providerForSampleDataSearchResultWithExternalID:v16 error:&v27];
    id v18 = v27;

    if (v17)
    {
      [(WDClinicalProviderDetailsViewController *)self setProvider:v17];
      [(WDClinicalProviderDetailsViewController *)self _hideSpinnerView];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke;
      block[3] = &unk_1E644ADD8;
      block[4] = self;
      id v26 = v18;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    [(WDClinicalProviderDetailsViewController *)self setFetchesInFlight:[(WDClinicalProviderDetailsViewController *)self fetchesInFlight] + 1];
    uint64_t v19 = [(WDClinicalProviderDetailsViewController *)self providerServiceStore];
    v20 = [v4 externalID];
    v21 = [v4 batchID];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_2;
    v23[3] = &unk_1E644B678;
    v23[4] = self;
    id v24 = v5;
    [v19 fetchRemoteProviderWithExternalID:v20 batchID:v21 completion:v23];
  }
LABEL_13:
}

uint64_t __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideSpinnerView];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _presentError:v3];
}

void __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_3;
  v10[3] = &unk_1E644A710;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __72__WDClinicalProviderDetailsViewController__fetchDetailsForSearchResult___block_invoke_3(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setFetchesInFlight:", objc_msgSend(*(id *)(a1 + 32), "fetchesInFlight") - 1);
  if (*(void *)(a1 + 40))
  {
    v7[0] = @"_CacheDateKey";
    v2 = [MEMORY[0x1E4F1C9C8] date];
    v7[1] = @"_CacheProviderKey";
    v8[0] = v2;
    v8[1] = *(void *)(a1 + 40);
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

    id v4 = [*(id *)(a1 + 32) providerCache];
    [v4 setObject:v3 forKey:*(void *)(a1 + 56)];

    [*(id *)(a1 + 32) setProvider:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _hideSpinnerView];
  }
  else
  {
    [*(id *)(a1 + 32) setProvider:0];
    if (*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 32) _hideSpinnerView];
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      [v5 _presentError:v6];
    }
  }
}

- (void)_computeSections
{
  uint64_t v3 = [(HKClinicalProvider *)self->_provider gateways];
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "hk_map:", &__block_literal_global_7);
    uint64_t v6 = [(WDClinicalProviderDetailsViewController *)self profile];
    id v7 = [v6 clinicalAccountStore];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2;
    v9[3] = &unk_1E644B6E0;
    id v10 = v5;
    id v11 = self;
    id v12 = v4;
    id v8 = v5;
    [v7 fetchAccountsForGatewaysWithExternalIDs:v8 completion:v9];
  }
}

uint64_t __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke(uint64_t a1, void *a2)
{
  return [a2 externalID];
}

void __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = objc_msgSend(a2, "hk_map:", &__block_literal_global_299);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_300;
    block[3] = &unk_1E644A670;
    id v7 = *(void **)(a1 + 48);
    block[4] = *(void *)(a1 + 40);
    id v11 = v7;
    id v12 = v6;
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_cold_1(a1, v9, (uint64_t)v5);
    }
  }
}

uint64_t __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_296(uint64_t a1, void *a2)
{
  return [a2 gateway];
}

uint64_t __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_300(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeSectionsWithGateways:*(void *)(a1 + 40) connectedGateways:*(void *)(a1 + 48)];
}

- (void)_computeSectionsWithGateways:(id)a3 connectedGateways:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v8 = 0;
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v94 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        if ([v14 status] != 3)
        {
          v15 = [v14 newerSupportedGatewayVersion];

          uint64_t v16 = v8;
          if (!v15)
          {
            if ([v14 status] == 2) {
              uint64_t v16 = v75;
            }
            else {
              uint64_t v16 = v76;
            }
          }
          [v16 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v93 objects:v103 count:16];
    }
    while (v11);
  }

  v17 = [(WDClinicalProviderDetailsViewController *)self _orderGatewaysForDisplay:v7];
  connectedGateways = self->_connectedGateways;
  self->_connectedGateways = v17;

  uint64_t v19 = [v76 arrayByExcludingObjectsInArray:self->_connectedGateways];
  v20 = [(WDClinicalProviderDetailsViewController *)self _filterGatewaysForDisplay:v19];
  v21 = [(WDClinicalProviderDetailsViewController *)self _orderGatewaysForDisplay:v20];
  unconnectedGateways = self->_unconnectedGateways;
  self->_unconnectedGateways = v21;

  v23 = [v75 arrayByExcludingObjectsInArray:self->_connectedGateways];
  id v24 = [(WDClinicalProviderDetailsViewController *)self _orderGatewaysForDisplay:v23];
  unavailableGateways = self->_unavailableGateways;
  self->_unavailableGateways = v24;

  id v26 = [v8 arrayByExcludingObjectsInArray:self->_connectedGateways];
  id v27 = [(WDClinicalProviderDetailsViewController *)self _orderGatewaysForDisplay:v26];
  internalOnlyVisibleGateways = self->_internalOnlyVisibleGateways;
  self->_internalOnlyVisibleGateways = v27;

  NSUInteger v29 = [(NSArray *)self->_connectedGateways count];
  NSUInteger v30 = [(NSArray *)self->_unconnectedGateways count] + v29;
  NSUInteger v31 = v30 + [(NSArray *)self->_unavailableGateways count];
  if (v31 + [(NSArray *)self->_internalOnlyVisibleGateways count])
  {
    uint64_t v73 = 1104;
    uint64_t v74 = 1112;
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v101[0] = v40;
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v101[1] = v41;
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v101[2] = v42;
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v101[3] = v43;
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v101[4] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:5];
    sections = self->_sections;
    self->_sections = v45;

    v47 = [(NSArray *)self->_sections objectAtIndexedSubscript:0];
    v48 = +[WDClinicalLocationCell defaultReuseIdentifier];
    [v47 addObject:v48];

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v49 = self->_connectedGateways;
    uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v89 objects:v100 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v90;
      while (1)
      {
        if (*(void *)v90 != v52) {
          objc_enumerationMutation(v49);
        }
        v53 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 2, v73, v74);
        v54 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
        [v53 addObject:v54];

        if (!--v51)
        {
          uint64_t v51 = [(NSArray *)v49 countByEnumeratingWithState:&v89 objects:v100 count:16];
          if (!v51) {
            break;
          }
        }
      }
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v55 = self->_unconnectedGateways;
    uint64_t v56 = [(NSArray *)v55 countByEnumeratingWithState:&v85 objects:v99 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v86;
      while (1)
      {
        if (*(void *)v86 != v58) {
          objc_enumerationMutation(v55);
        }
        v59 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 1, v73);
        v60 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
        [v59 addObject:v60];

        if (!--v57)
        {
          uint64_t v57 = [(NSArray *)v55 countByEnumeratingWithState:&v85 objects:v99 count:16];
          if (!v57) {
            break;
          }
        }
      }
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v61 = *(id *)((char *)&self->super.super.super.super.super.isa + v73);
    uint64_t v62 = [v61 countByEnumeratingWithState:&v81 objects:v98 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v82;
      while (1)
      {
        if (*(void *)v82 != v64) {
          objc_enumerationMutation(v61);
        }
        v65 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 3, v73);
        v66 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
        [v65 addObject:v66];

        if (!--v63)
        {
          uint64_t v63 = [v61 countByEnumeratingWithState:&v81 objects:v98 count:16];
          if (!v63) {
            break;
          }
        }
      }
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v67 = *(id *)((char *)&self->super.super.super.super.super.isa + v74);
    uint64_t v68 = [v67 countByEnumeratingWithState:&v77 objects:v97 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v78;
      while (1)
      {
        if (*(void *)v78 != v70) {
          objc_enumerationMutation(v67);
        }
        v71 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", 4, v73);
        v72 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
        [v71 addObject:v72];

        if (!--v69)
        {
          uint64_t v69 = [v67 countByEnumeratingWithState:&v77 objects:v97 count:16];
          if (!v69) {
            break;
          }
        }
      }
    }

    v38 = [(WDClinicalProviderDetailsViewController *)self tableView];
    [v38 reloadData];
  }
  else
  {
    self->_noGatewaysFound = 1;
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v102[0] = v32;
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v102[1] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
    v35 = self->_sections;
    self->_sections = v34;

    v36 = [(NSArray *)self->_sections objectAtIndexedSubscript:0];
    v37 = +[WDClinicalLocationCell defaultReuseIdentifier];
    [v36 addObject:v37];

    v38 = [(NSArray *)self->_sections objectAtIndexedSubscript:1];
    v39 = [(id)objc_opt_class() defaultReuseIdentifier];
    [v38 addObject:v39];
  }
}

- (id)_filterGatewaysForDisplay:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[WDClinicalProviderDetailsViewController latestSupportedVersionOfGateway:fromGateways:](self, "latestSupportedVersionOfGateway:fromGateways:", *(void *)(*((void *)&v14 + 1) + 8 * i), v6, (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v5 allObjects];

  return v12;
}

- (id)latestSupportedVersionOfGateway:(id)a3 fromGateways:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = HKProviderServiceMaximumCompatibleAPIVersion();
  if ([v5 minCompatibleAPIVersion] <= v7)
  {
    uint64_t v9 = [v5 newerSupportedGatewayVersion];
    uint64_t v10 = v9;
    if (v9)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __88__WDClinicalProviderDetailsViewController_latestSupportedVersionOfGateway_fromGateways___block_invoke;
      v22[3] = &unk_1E644B708;
      id v11 = v9;
      id v23 = v11;
      uint64_t v12 = objc_msgSend(v6, "hk_firstObjectPassingTest:", v22);
      id v13 = v12;
      if (!v12)
      {
        _HKInitializeLogging();
        long long v14 = (void *)*MEMORY[0x1E4F29F38];
        BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR);
        id v13 = v5;
        if (v15)
        {
          long long v17 = v14;
          id v18 = (objc_class *)objc_opt_class();
          uint64_t v19 = NSStringFromClass(v18);
          v20 = [v11 gatewayID];
          v21 = [v5 externalID];
          *(_DWORD *)buf = 138543874;
          v25 = v19;
          __int16 v26 = 2114;
          id v27 = v20;
          __int16 v28 = 2114;
          NSUInteger v29 = v21;
          _os_log_error_impl(&dword_1C21A1000, v17, OS_LOG_TYPE_ERROR, "%{public}@ got a newer gateway reference (%{public}@) for gateway %{public}@, however it's not been returned from PC", buf, 0x20u);

          id v13 = v5;
        }
      }
      id v8 = v13;
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __88__WDClinicalProviderDetailsViewController_latestSupportedVersionOfGateway_fromGateways___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 gatewayID];
  id v5 = [v3 externalID];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (id)_orderGatewaysForDisplay:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"title" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"subtitle" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
    v9[0] = v4;
    v9[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v3 sortedArrayUsingDescriptors:v6];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)_gatewayAtIndexPath:(id)a3
{
  id v4 = a3;
  switch([v4 section])
  {
    case 1:
      id v5 = [(WDClinicalProviderDetailsViewController *)self unconnectedGateways];
      goto LABEL_7;
    case 2:
      id v5 = [(WDClinicalProviderDetailsViewController *)self connectedGateways];
      goto LABEL_7;
    case 3:
      id v5 = [(WDClinicalProviderDetailsViewController *)self unavailableGateways];
      goto LABEL_7;
    case 4:
      id v5 = [(WDClinicalProviderDetailsViewController *)self internalOnlyVisibleGateways];
LABEL_7:
      uint64_t v7 = v5;
      uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
    -[WDClinicalProviderDetailsViewController _presentError:](v5, v4);
  }
  uint64_t v6 = [(WDClinicalProviderDetailsViewController *)self presentedViewController];

  if (!v6)
  {
    uint64_t v7 = HRLocalizedString(@"HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_ONBOARDING_DETAILS");
    if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
    {
      id v8 = [v4 localizedDescription];
      uint64_t v9 = [v7 stringByAppendingFormat:@"\n\n[Internal Only]\n%@", v8];

      uint64_t v7 = (void *)v9;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4FB1418];
    id v11 = HRLocalizedString(@"HEALTH_RECORDS_PROVIDER_SERVICE_ERROR_TITLE");
    uint64_t v12 = [v10 basicAlertControllerWithTitle:v11 message:v7];

    [(WDClinicalProviderDetailsViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setProvider:(id)a3
{
  id v6 = a3;
  id v5 = [(WDClinicalProviderDetailsViewController *)self provider];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_provider, a3);
    self->_noGatewaysFound = 0;
    [(WDClinicalProviderDetailsViewController *)self _computeSections];
  }
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4 = a3;
  id v5 = [(WDClinicalProviderDetailsViewController *)self tableView];

  if (v5 == v4)
  {
    [(WDClinicalProviderDetailsViewController *)self _updateNoContentViewConstraints];
  }
}

- (void)_updateNoContentViewConstraints
{
  id v3 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v3 adjustedContentInset];
  double v5 = v4;
  id v6 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v6 safeAreaInsets];
  double v8 = v5 - v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noContentTopConstraint);
  [WeakRetained setConstant:v8];

  id v16 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v16 adjustedContentInset];
  double v11 = v10;
  uint64_t v12 = [(WDClinicalProviderDetailsViewController *)self tableView];
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
      -[WDClinicalProviderDetailsViewController setNoContentParentView:](self, "setNoContentParentView:");
    }
    else
    {
      id v6 = [(WDClinicalProviderDetailsViewController *)self _createNoContentParentView];
      [(WDClinicalProviderDetailsViewController *)self setNoContentParentView:v6];
    }
    [(UIView *)self->_noContentParentView addSubview:v4];
    double v7 = [v4 topAnchor];
    double v8 = [(UIView *)self->_noContentParentView safeAreaLayoutGuide];
    uint64_t v9 = [v8 topAnchor];
    double v10 = [v7 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v9 multiplier:1.0];

    v59 = v10;
    [(WDClinicalProviderDetailsViewController *)self setNoContentTopConstraint:v10];
    double v11 = [v4 bottomAnchor];
    uint64_t v12 = [(UIView *)self->_noContentParentView safeAreaLayoutGuide];
    double v13 = [v12 bottomAnchor];
    double v14 = [v11 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v13 multiplier:1.0];

    [v10 priority];
    *(float *)&double v16 = v15 + -1.0;
    [v14 setPriority:v16];
    [(WDClinicalProviderDetailsViewController *)self setNoContentBottomConstraint:v14];
    [(WDClinicalProviderDetailsViewController *)self _updateNoContentViewConstraints];
    v45 = (void *)MEMORY[0x1E4F28DC8];
    v55 = [v4 widthAnchor];
    v53 = [(UIView *)self->_noContentParentView widthAnchor];
    uint64_t v51 = [v55 constraintLessThanOrEqualToAnchor:v53];
    v61[0] = v51;
    v49 = [v4 centerXAnchor];
    v47 = [(UIView *)self->_noContentParentView centerXAnchor];
    long long v17 = [v49 constraintEqualToAnchor:v47];
    v61[1] = v17;
    id v18 = [v4 leadingAnchor];
    uint64_t v19 = [(UIView *)self->_noContentParentView leadingAnchor];
    v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
    v61[2] = v20;
    id v58 = v4;
    v21 = [v4 trailingAnchor];
    v22 = [(UIView *)self->_noContentParentView trailingAnchor];
    id v23 = [v21 constraintLessThanOrEqualToAnchor:v22];
    v61[3] = v23;
    v61[4] = v59;
    uint64_t v57 = v14;
    v61[5] = v14;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
    [v45 activateConstraints:v24];

    v25 = [(UIView *)self->_noContentParentView superview];

    if (!v25)
    {
      __int16 v26 = [(WDClinicalProviderDetailsViewController *)self tableView];
      [v26 addSubview:self->_noContentParentView];

      id v41 = (void *)MEMORY[0x1E4F28DC8];
      v54 = [(UIView *)self->_noContentParentView widthAnchor];
      uint64_t v56 = [(WDClinicalProviderDetailsViewController *)self tableView];
      uint64_t v52 = [v56 widthAnchor];
      uint64_t v50 = [v54 constraintEqualToAnchor:v52];
      v60[0] = v50;
      v46 = [(UIView *)self->_noContentParentView topAnchor];
      v48 = [(WDClinicalProviderDetailsViewController *)self tableView];
      id v44 = [v48 safeAreaLayoutGuide];
      id v43 = [v44 topAnchor];
      id v42 = [v46 constraintEqualToAnchor:v43];
      v60[1] = v42;
      v39 = [(UIView *)self->_noContentParentView bottomAnchor];
      id v40 = [(WDClinicalProviderDetailsViewController *)self tableView];
      v38 = [v40 safeAreaLayoutGuide];
      v37 = [v38 bottomAnchor];
      id v27 = [v39 constraintEqualToAnchor:v37];
      v60[2] = v27;
      __int16 v28 = [(UIView *)self->_noContentParentView leadingAnchor];
      NSUInteger v29 = [(WDClinicalProviderDetailsViewController *)self tableView];
      uint64_t v30 = [v29 leadingAnchor];
      NSUInteger v31 = [v28 constraintEqualToAnchor:v30];
      v60[3] = v31;
      id v32 = [(UIView *)self->_noContentParentView trailingAnchor];
      id v33 = [(WDClinicalProviderDetailsViewController *)self tableView];
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

- (id)_createSpinnerView
{
  id v2 = objc_alloc_init(HRWDSpinnerView);
  [(HRWDSpinnerView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1024];
  [(HRWDSpinnerView *)v2 setMessageFont:v3];

  return v2;
}

- (void)_showSpinnerView
{
  id v3 = [(HRWDSpinnerView *)self->_spinnerView superview];

  if (!v3)
  {
    if (self->_spinnerView)
    {
      -[WDClinicalProviderDetailsViewController setSpinnerView:](self, "setSpinnerView:");
    }
    else
    {
      id v4 = [(WDClinicalProviderDetailsViewController *)self _createSpinnerView];
      [(WDClinicalProviderDetailsViewController *)self setSpinnerView:v4];
    }
    [(WDClinicalProviderDetailsViewController *)self _showNoContentView:self->_spinnerView];
    [(HRWDSpinnerView *)self->_spinnerView startSpinner];
    id v5 = [(WDClinicalProviderDetailsViewController *)self tableView];
    [v5 reloadData];
  }
}

- (void)_hideSpinnerView
{
  [(HRWDSpinnerView *)self->_spinnerView stopSpinner];
  [(WDClinicalProviderDetailsViewController *)self _showNoContentView:0];
  id v3 = [(WDClinicalProviderDetailsViewController *)self tableView];
  [v3 reloadData];
}

- (void)clearLoginBusyIndicator
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(WDClinicalProviderDetailsViewController *)self _hideSpinnerView];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  BOOL v7 = !self->_noGatewaysFound && ([v5 section] == 1 || objc_msgSend(v6, "section") == 4);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!self->_noGatewaysFound)
  {
    BOOL v7 = [a3 cellForRowAtIndexPath:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    double v8 = [(WDClinicalProviderDetailsViewController *)self _gatewayAtIndexPath:v6];
    if (!v8)
    {
      _HKInitializeLogging();
      uint64_t v12 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        -[WDClinicalProviderDetailsViewController tableView:didSelectRowAtIndexPath:](v12);
      }
      goto LABEL_14;
    }
    if ([(NSArray *)self->_unconnectedGateways containsObject:v8]
      || [(NSArray *)self->_internalOnlyVisibleGateways containsObject:v8])
    {
      if (![MEMORY[0x1E4F2B860] isRunningStoreDemoMode])
      {
        double v13 = [v8 externalID];
        int v14 = [v13 hasPrefix:*MEMORY[0x1E4F676E8]];

        if (!v14)
        {
          switch([v8 status])
          {
            case 0:
              _HKInitializeLogging();
              double v16 = *MEMORY[0x1E4F29F38];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
                -[WDClinicalProviderDetailsViewController tableView:didSelectRowAtIndexPath:](v16);
              }
              goto LABEL_20;
            case 1:
LABEL_20:
              [(WDClinicalProviderDetailsViewController *)self _handleTapForActivateGateway:v8];
              break;
            case 2:
              double v10 = [v8 title];
              [(WDClinicalProviderDetailsViewController *)self _presentUnavailableAlertForGatewayTitle:v10];
              goto LABEL_13;
            case 3:
              _HKInitializeLogging();
              long long v17 = *MEMORY[0x1E4F29F38];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
                -[WDClinicalProviderDetailsViewController tableView:didSelectRowAtIndexPath:](v17);
              }
              break;
            default:
              goto LABEL_14;
          }
          goto LABEL_14;
        }
        double v10 = [(HRProfile *)self->_profile clinicalSampleAccountsLoader];
        float v15 = [v8 externalID];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v18[3] = &unk_1E644B730;
        v18[4] = self;
        [v10 loadFirstSampleAccountDataBatchForGatewayWithExternalID:v15 completion:v18];

        goto LABEL_13;
      }
      _HKInitializeLogging();
      uint64_t v9 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
      {
        double v10 = v9;
        *(_DWORD *)buf = 138543362;
        id v20 = (id)objc_opt_class();
        id v11 = v20;
        _os_log_impl(&dword_1C21A1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ running store demo mode, connecting to gateways is not supported", buf, 0xCu);

LABEL_13:
      }
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
}

void __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E644A670;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__WDClinicalProviderDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(void *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v3 = [MEMORY[0x1E4F28EA0] OAuthCompletionNotification];
    uint64_t v4 = a1[5];
    id v5 = +[OAuthCompletionNotificationUserInfoKeys account];
    uint64_t v6 = a1[4];
    double v10 = v5;
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v2 postNotificationName:v3 object:v4 userInfo:v7];
  }
  else
  {
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    [v8 _presentError:v9];
  }
}

- (void)_handleTapForActivateGateway:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    _os_log_impl(&dword_1C21A1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did tap gateway %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  double v10 = [(WDClinicalProviderDetailsViewController *)self profile];
  id v11 = [v10 clinicalSourcesDataProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke;
  v16[3] = &unk_1E644B758;
  objc_copyWeak(&v17, (id *)buf);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke_2;
  v13[3] = &unk_1E644B780;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v4;
  id v14 = v12;
  [v11 beginInitialLoginSessionForGateway:v12 fromViewController:self loginCancelledHandler:v16 errorHandler:v13];

  [(WDClinicalProviderDetailsViewController *)self _showSpinnerView];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearLoginBusyIndicator];
}

void __72__WDClinicalProviderDetailsViewController__handleTapForActivateGateway___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained clearLoginBusyIndicator];

  uint64_t v6 = +[HRViewControllerFactory shared];
  id v8 = [v6 makeFailedToOnboardAccountAlertControllerToGateway:*(void *)(a1 + 32) error:v4];

  id v7 = objc_loadWeakRetained(v3);
  [v7 presentViewController:v8 animated:1 completion:0];
}

- (void)_presentUnavailableAlertForGatewayTitle:(id)a3
{
  id v4 = a3;
  HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_PORTAL_UNAVAILABLE_ALERT_TITLE");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = NSString;
  uint64_t v6 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_PORTAL_%@_UNAVAILABLE_ALERT_MESSAGE");
  id v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);

  id v8 = [MEMORY[0x1E4FB1418] basicAlertControllerWithTitle:v9 message:v7];
  [(WDClinicalProviderDetailsViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(HRWDSpinnerView *)self->_spinnerView superview];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(WDClinicalProviderDetailsViewController *)self sections];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_provider)
  {
    switch(a4)
    {
      case 1:
        if (![(NSArray *)self->_unconnectedGateways count]) {
          goto LABEL_10;
        }
        int64_t v7 = @"HEALTH_RECORDS_ONBOARDING_ACCOUNTS_UNCONNECTED";
        goto LABEL_9;
      case 2:
        if (![(NSArray *)self->_connectedGateways count]) {
          goto LABEL_10;
        }
        int64_t v7 = @"HEALTH_RECORDS_ONBOARDING_ACCOUNTS_CONNECTED";
        goto LABEL_9;
      case 3:
        if (![(NSArray *)self->_unavailableGateways count]) {
          goto LABEL_10;
        }
        int64_t v7 = @"HEALTH_RECORDS_ONBOARDING_ACCOUNTS_UNAVAILABLE";
LABEL_9:
        HRLocalizedString(v7);
        id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        if ([(NSArray *)self->_internalOnlyVisibleGateways count]) {
          id v8 = @"[Internal Only] Other Gateways";
        }
        else {
          id v8 = 0;
        }
        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    id v8 = 0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = *MEMORY[0x1E4FB2F28];
  if (!a4) {
    return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = (void *)a4;
  if (a4)
  {
    id v5 = [(WDClinicalProviderDetailsViewController *)self tableView];
    id v4 = [v5 headerViewForSection:v4];
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WDClinicalProviderDetailsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(WDClinicalProviderDetailsViewController *)self sections];
  int64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  id v9 = [(WDClinicalProviderDetailsViewController *)self tableView];
  double v10 = (void *)v8;
  id v11 = [v9 dequeueReusableCellWithIdentifier:v8 forIndexPath:v5];

  id v12 = [(WDClinicalProviderDetailsViewController *)self profile];
  id v13 = [v12 clinicalSourcesDataProvider];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v11;
    id v15 = [(WDClinicalProviderDetailsViewController *)self provider];
    double v16 = [(WDClinicalProviderDetailsViewController *)self profile];
    id v17 = [v16 clinicalSourcesDataProvider];
    [v14 setProvider:v15 dataProvider:v17];

    id v18 = HKUIJoinStringsForAutomationIdentifier();
    v40[0] = v18;
    v40[1] = @"ProviderName";
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    __int16 v20 = HKUIJoinStringsForAutomationIdentifier();
    uint64_t v21 = [v14 titleLabel];
    [v21 setAccessibilityIdentifier:v20];

    v39[0] = v18;
    v39[1] = @"ProviderDescription";
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    id v23 = HKUIJoinStringsForAutomationIdentifier();
    id v24 = [v14 subtitleLabel];
    [v24 setAccessibilityIdentifier:v23];

    v38[0] = v18;
    v38[1] = @"ProviderLocation";
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    __int16 v26 = HKUIJoinStringsForAutomationIdentifier();
    id v27 = [v14 detailLabel];

    [v27 setAccessibilityIdentifier:v26];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v11;
    NSUInteger v29 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v28 setPillBackgroundColorOverride:v29];

    if ([v5 row] >= 1) {
      [v28 setExtraTopPadding:1];
    }
    if ([v5 section] == 2)
    {
      uint64_t v30 = 1088;
    }
    else
    {
      if ([v5 section] != 3)
      {
        if ([v5 section] == 4) {
          uint64_t v36 = 1112;
        }
        else {
          uint64_t v36 = 1096;
        }
        NSUInteger v31 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v36), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
        id v32 = v28;
        id v33 = v31;
        v34 = v13;
        uint64_t v35 = 0;
        goto LABEL_15;
      }
      uint64_t v30 = 1104;
    }
    NSUInteger v31 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v30), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    id v32 = v28;
    id v33 = v31;
    v34 = v13;
    uint64_t v35 = 1;
LABEL_15:
    [v32 configureWithGateway:v33 dataProvider:v34 connected:v35];
  }
  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 willDisplay];
  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
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

- (HKClinicalProviderSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (int64_t)fetchesInFlight
{
  return self->_fetchesInFlight;
}

- (void)setFetchesInFlight:(int64_t)a3
{
  self->_fetchesInFlight = a3;
}

- (HKClinicalProvider)provider
{
  return self->_provider;
}

- (NSCache)providerCache
{
  return self->_providerCache;
}

- (void)setProviderCache:(id)a3
{
}

- (NSArray)connectedGateways
{
  return self->_connectedGateways;
}

- (void)setConnectedGateways:(id)a3
{
}

- (NSArray)unconnectedGateways
{
  return self->_unconnectedGateways;
}

- (void)setUnconnectedGateways:(id)a3
{
}

- (NSArray)unavailableGateways
{
  return self->_unavailableGateways;
}

- (void)setUnavailableGateways:(id)a3
{
}

- (NSArray)internalOnlyVisibleGateways
{
  return self->_internalOnlyVisibleGateways;
}

- (void)setInternalOnlyVisibleGateways:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HRWDSpinnerView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (UIView)noContentParentView
{
  return self->_noContentParentView;
}

- (void)setNoContentParentView:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noContentBottomConstraint);
  objc_destroyWeak((id *)&self->_noContentTopConstraint);
  objc_storeStrong((id *)&self->_noContentParentView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_internalOnlyVisibleGateways, 0);
  objc_storeStrong((id *)&self->_unavailableGateways, 0);
  objc_storeStrong((id *)&self->_unconnectedGateways, 0);
  objc_storeStrong((id *)&self->_connectedGateways, 0);
  objc_storeStrong((id *)&self->_providerCache, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_providerServiceStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __59__WDClinicalProviderDetailsViewController__computeSections__block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = HKSensitiveLogItem();
  int v6 = 138412546;
  int64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_1C21A1000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch accounts for gateways %@: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_presentError:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_7(&dword_1C21A1000, v5, v6, "onboarding details presenting error with underlying description: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_7(&dword_1C21A1000, v3, v4, "Unable to find gateway for index path: %@", v5, v6, v7, v8, 2u);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "Error: connecting to gateway with Unknown status", v1, 2u);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.3(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "Error: connecting to gateway with Removed status", v1, 2u);
}

@end