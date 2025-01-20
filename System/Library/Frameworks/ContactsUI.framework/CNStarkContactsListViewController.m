@interface CNStarkContactsListViewController
+ (id)collectionViewLayoutWithFloatingHeaderViews:(BOOL)a3 contactListStyleApplier:(id)a4 directionalLayoutMargins:(id)a5 hasNoContacts:(id)a6;
+ (id)makeContactsDisplayedProperties;
- (AIMLExperimentationAnalyticsManager)analyticsManager;
- (AVExternalDevice)externalDevice;
- (BOOL)canManageDuplicateContacts;
- (BOOL)deviceIsEnrolledInDirectActionExperiment;
- (BOOL)hadScrollAccessoryAtLastHeaderViewUpdate;
- (BOOL)isSiriDirectActionTextExperimentGroup;
- (BOOL)limitedUI;
- (BOOL)shouldShowDuplicateBannerView;
- (CNContactListCollectionView)contactListTableView;
- (CNStarkContactsListViewController)init;
- (CNStarkContactsListViewController)initWithCollectionViewLayout:(id)a3;
- (CNStarkContactsListViewController)initWithDataSource:(id)a3 searchable:(BOOL)a4 environment:(id)a5 shouldUseLargeTitle:(BOOL)a6;
- (CNStarkNoContentBannerView)overlayView;
- (CNStarkUtilities)utilities;
- (NSArray)displayedContactProperties;
- (NSDirectionalEdgeInsets)viewDirectionalLayoutMargins;
- (TRIClient)trialClient;
- (UIView)siriHeaderView;
- (double)headerViewWidthForSize:(CGSize)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contactListStyleApplier;
- (id)createCollectionView;
- (void)contactDataSourceDidChange:(id)a3;
- (void)contactListViewController:(id)a3 didSelectContact:(id)a4;
- (void)contactListViewController:(id)a3 didSelectContact:(id)a4 shouldScrollToContact:(BOOL)a5;
- (void)dealloc;
- (void)handleSiriHeaderViewTap:(id)a3;
- (void)postMessageOverlayIfNecessary;
- (void)refreshTableViewHeaderWithSize:(CGSize)a3;
- (void)sendSiriExperimentTriggerLoggingIfEligible;
- (void)setAnalyticsManager:(id)a3;
- (void)setContactListTableView:(id)a3;
- (void)setDisplayedContactProperties:(id)a3;
- (void)setExternalDevice:(id)a3;
- (void)setHadScrollAccessoryAtLastHeaderViewUpdate:(BOOL)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setSiriHeaderView:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setUtilities:(id)a3;
- (void)setupDataSource;
- (void)showContactListTableView;
- (void)showOverlayView;
- (void)updateLimitedUI;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNStarkContactsListViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_siriHeaderView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_contactListTableView, 0);

  objc_storeStrong((id *)&self->_displayedContactProperties, 0);
}

- (void)setHadScrollAccessoryAtLastHeaderViewUpdate:(BOOL)a3
{
  self->_hadScrollAccessoryAtLastHeaderViewUpdate = a3;
}

- (BOOL)hadScrollAccessoryAtLastHeaderViewUpdate
{
  return self->_hadScrollAccessoryAtLastHeaderViewUpdate;
}

- (void)setUtilities:(id)a3
{
}

- (CNStarkUtilities)utilities
{
  return self->_utilities;
}

- (void)setTrialClient:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (AIMLExperimentationAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setExternalDevice:(id)a3
{
}

- (AVExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (void)setSiriHeaderView:(id)a3
{
}

- (UIView)siriHeaderView
{
  return self->_siriHeaderView;
}

- (void)setOverlayView:(id)a3
{
}

- (CNStarkNoContentBannerView)overlayView
{
  return self->_overlayView;
}

- (void)setContactListTableView:(id)a3
{
}

- (CNContactListCollectionView)contactListTableView
{
  return self->_contactListTableView;
}

- (void)setDisplayedContactProperties:(id)a3
{
}

- (NSArray)displayedContactProperties
{
  return self->_displayedContactProperties;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4 shouldScrollToContact:(BOOL)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(CNContactListViewController *)self dataSource];
  v8 = [v7 store];
  v9 = [v6 identifier];

  v10 = +[CNStarkCardViewController descriptorForRequiredKeys];
  v21[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v18 = 0;
  v12 = [v8 unifiedContactWithIdentifier:v9 keysToFetch:v11 error:&v18];
  id v13 = v18;

  if (v13)
  {
    v14 = CNUILogContactCard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_fault_impl(&dword_18B625000, v14, OS_LOG_TYPE_FAULT, "Failed to refetch contact for CNStarkCardViewController, %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = [CNStarkCardViewController alloc];
    v16 = [(CNStarkContactsListViewController *)self displayedContactProperties];
    v14 = [(CNStarkCardViewController *)v15 initWithContact:v12 displayedContactProperties:v16];

    v17 = [(CNStarkContactsListViewController *)self navigationController];
    [v17 pushViewController:v14 animated:1];
  }
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4
{
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNStarkContactsListViewController;
  v4 = [(CNContactListViewController *)&v7 collectionView:a3 cellForItemAtIndexPath:a4];
  v5 = [MEMORY[0x1E4FB1498] listPlainCellConfiguration];
  [v4 setBackgroundConfiguration:v5];

  return v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"CNContactListLayoutHeaderIdentifier"])
  {
    v19.receiver = self;
    v19.super_class = (Class)CNStarkContactsListViewController;
    id v11 = [(CNContactListViewController *)&v19 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }
  else
  {
    objc_opt_class();
    v18.receiver = self;
    v18.super_class = (Class)CNStarkContactsListViewController;
    v12 = [(CNContactListViewController *)&v18 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v11 = v13;

    if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]])
    {
      v14 = [MEMORY[0x1E4FB1498] clearConfiguration];
      v15 = [(CNStarkContactsListViewController *)self view];
      v16 = [v15 backgroundColor];
      [v14 setBackgroundColor:v16];

      [v11 setBackgroundConfiguration:v14];
    }
  }

  return v11;
}

- (BOOL)canManageDuplicateContacts
{
  return 0;
}

- (BOOL)shouldShowDuplicateBannerView
{
  return 0;
}

- (id)contactListStyleApplier
{
  return 0;
}

- (void)showContactListTableView
{
  v3 = [(CNStarkContactsListViewController *)self view];
  v4 = [(CNStarkContactsListViewController *)self contactListTableView];

  if (v3 != v4)
  {
    v5 = [(CNStarkContactsListViewController *)self contactListTableView];
    [(CNStarkContactsListViewController *)self setCollectionView:v5];

    id v6 = [(CNStarkContactsListViewController *)self contactListTableView];
    [(CNStarkContactsListViewController *)self setView:v6];

    objc_super v7 = [(CNContactListViewController *)self dataSource];
    id v8 = [v7 contacts];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v11 = [(CNStarkContactsListViewController *)self collectionView];
      id v10 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [v11 scrollToItemAtIndexPath:v10 atScrollPosition:2 animated:0];
    }
  }
}

- (void)showOverlayView
{
  v3 = [(CNStarkContactsListViewController *)self view];
  v4 = [(CNStarkContactsListViewController *)self overlayView];

  if (v3 != v4)
  {
    id v5 = [(CNStarkContactsListViewController *)self overlayView];
    [(CNStarkContactsListViewController *)self setView:v5];
  }
}

- (void)postMessageOverlayIfNecessary
{
  if ([(CNStarkContactsListViewController *)self limitedUI]
    && (CNContactsUIBundle(),
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 localizedStringForKey:@"CONTACTS_ACCESS_LIMITED" value:&stru_1ED8AC728 table:@"Localized"], id v13 = (id)objc_claimAutoreleasedReturnValue(), v3, v13))
  {
    v4 = [(CNStarkContactsListViewController *)self overlayView];

    if (!v4)
    {
      id v5 = [CNStarkNoContentBannerView alloc];
      id v6 = -[CNStarkNoContentBannerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CNStarkContactsListViewController *)self setOverlayView:v6];
    }
    objc_super v7 = [(CNStarkContactsListViewController *)self overlayView];
    [v7 setTitleString:v13];

    id v8 = [(CNStarkContactsListViewController *)self overlayView];
    [v8 setSiriButtonEnabled:1];

    [(CNStarkContactsListViewController *)self showOverlayView];
  }
  else
  {
    uint64_t v9 = [(CNContactListViewController *)self dataSource];
    id v10 = [v9 contacts];
    BOOL v11 = [v10 count] == 0;
    v12 = [(CNContactListViewController *)self listHeaderView];
    [v12 setHidden:v11];

    [(CNStarkContactsListViewController *)self showContactListTableView];
  }
}

- (void)handleSiriHeaderViewTap:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = getkAssistantDirectActionEventKey[0]();
  objc_super v7 = v3;
  v8[0] = &unk_1ED915758;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = (void *)[objc_alloc((Class)getSiriDirectActionContextClass[0]()) initWithPayload:v4];
  id v6 = objc_alloc_init((Class)getSiriDirectActionSourceClass[0]());
  [v6 activateWithContext:v5];
}

- (double)headerViewWidthForSize:(CGSize)a3
{
  double width = a3.width;
  [(CNStarkContactsListViewController *)self viewDirectionalLayoutMargins];
  return width - v4 - v5;
}

- (BOOL)isSiriDirectActionTextExperimentGroup
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[CNStarkUtilities vehicleHasBuiltInMic]
    && +[CNStarkUtilities siriLanguageMatchesSystemLanguage])
  {
    [(TRIClient *)self->_trialClient refresh];
    v3 = [(TRIClient *)self->_trialClient levelForFactor:@"isHSSiriActionButtonPhone" withNamespaceName:@"SIRI_CARPLAY_JARVIS"];
    double v4 = CNUILogStarkSiriExperiment();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [v3 BOOLeanValue];
      id v6 = @"FALSE";
      if (v5) {
        id v6 = @"TRUE";
      }
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_INFO, "#ABStarkExperiment The user is in the experimental group: %@", (uint8_t *)&v9, 0xCu);
    }

    char v7 = [v3 BOOLeanValue];
  }
  else
  {
    v3 = CNUILogStarkSiriExperiment();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "#ABStarkExperiment This vehicle or device isn't eligible for the experiment", (uint8_t *)&v9, 2u);
    }
    char v7 = 0;
  }

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactsListViewController;
  [(CNContactListViewController *)&v5 viewDidLayoutSubviews];
  if (![(CNStarkContactsListViewController *)self hadScrollAccessoryAtLastHeaderViewUpdate])
  {
    v3 = [(CNStarkContactsListViewController *)self contactListTableView];
    double v4 = [v3 accessoryViewAtEdge:1];

    if (v4) {
      [(CNContactListViewController *)self refreshTableViewHeaderIfVisible];
    }
  }
}

- (void)refreshTableViewHeaderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v85[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(CNStarkContactsListViewController *)self siriHeaderView];

  if (v6)
  {
    char v7 = [(CNStarkContactsListViewController *)self siriHeaderView];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    -[CNStarkContactsListViewController headerViewWidthForSize:](self, "headerViewWidthForSize:", width, height);
    double v15 = v14;
    v16 = [(CNStarkContactsListViewController *)self siriHeaderView];
    objc_msgSend(v16, "setFrame:", v9, v11, v15, v13);
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v16 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v16 frame];
    double v19 = v18;
    double v21 = v20;
    double v22 = *MEMORY[0x1E4FB2F20];
    -[CNStarkContactsListViewController headerViewWidthForSize:](self, "headerViewWidthForSize:", width, height);
    objc_msgSend(v16, "setFrame:", v19, v21, v23, v22);
    BOOL v24 = [(CNStarkContactsListViewController *)self isSiriDirectActionTextExperimentGroup];
    v25 = CNContactsUIBundle();
    v26 = v25;
    if (v24) {
      v27 = @"HEY_SIRI_MAKE_A_CALL";
    }
    else {
      v27 = @"ASK_SIRI_TO_MAKE_CALL";
    }
    uint64_t v28 = [v25 localizedStringForKey:v27 value:&stru_1ED8AC728 table:@"Localized"];

    v29 = (void *)MEMORY[0x1E4FB1830];
    v30 = +[CNUIFontRepository carPlaySymbolImageFont];
    uint64_t v31 = [v29 configurationWithFont:v30 scale:3];

    v83 = (void *)v31;
    v82 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"siri" withConfiguration:v31];
    v32 = [[CNStarkHeaderPlatterView alloc] initWithLabelText:v28 accessoryImage:v82];
    [(CNStarkHeaderPlatterView *)v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v16 addSubview:v32];
    [v16 setUserInteractionEnabled:1];
    [v16 setIsAccessibilityElement:1];
    [v16 setAccessibilityTraits:*MEMORY[0x1E4FB2540]];
    if (v28)
    {
      v85[0] = v28;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
      [v16 setAccessibilityUserInputLabels:v33];
    }
    v81 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleSiriHeaderViewTap_];
    [v16 addGestureRecognizer:v81];
    v80 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleSiriHeaderViewTap_];
    [v80 setAllowedPressTypes:&unk_1ED915AA0];
    [v16 addGestureRecognizer:v80];
    v73 = (void *)MEMORY[0x1E4F28DC8];
    v79 = [(CNStarkHeaderPlatterView *)v32 leftAnchor];
    v78 = [v16 leftAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v84[0] = v77;
    v75 = [(CNStarkHeaderPlatterView *)v32 rightAnchor];
    v74 = [v16 rightAnchor];
    v72 = [v75 constraintEqualToAnchor:v74];
    v84[1] = v72;
    v34 = [(CNStarkHeaderPlatterView *)v32 topAnchor];
    v35 = [v16 topAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v84[2] = v36;
    v37 = [(CNStarkHeaderPlatterView *)v32 bottomAnchor];
    [v16 bottomAnchor];
    v38 = v76 = (void *)v28;
    v39 = [v37 constraintEqualToAnchor:v38];
    v84[3] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
    [v73 activateConstraints:v40];

    [(CNStarkContactsListViewController *)self setSiriHeaderView:v16];
  }

  v41 = [(CNStarkContactsListViewController *)self siriHeaderView];
  [v41 frame];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

  [(CNStarkContactsListViewController *)self viewDirectionalLayoutMargins];
  double v49 = v48;
  double v51 = v50;
  v52 = [(CNStarkContactsListViewController *)self traitCollection];
  uint64_t v53 = [v52 layoutDirection];

  v54 = [(CNStarkContactsListViewController *)self view];
  [v54 safeAreaInsets];
  double v56 = v55;

  if (v53 == 1) {
    double v57 = v51;
  }
  else {
    double v57 = v49;
  }
  double v58 = v57 - v56;
  v59 = [(CNStarkContactsListViewController *)self siriHeaderView];
  objc_msgSend(v59, "setFrame:", v58, v43, v45, v47);

  v60 = [(CNStarkContactsListViewController *)self contactListTableView];
  v61 = [v60 accessoryViewAtEdge:1];

  [(CNStarkContactsListViewController *)self setHadScrollAccessoryAtLastHeaderViewUpdate:v61 != 0];
  v62 = [(CNContactListViewController *)self listHeaderView];
  v63 = [v62 superview];

  if (v63)
  {
    objc_opt_class();
    v64 = [(CNContactListViewController *)self listHeaderView];
    v65 = [v64 superview];
    v66 = [v65 superview];
    if (objc_opt_isKindOfClass()) {
      v67 = v66;
    }
    else {
      v67 = 0;
    }
    id v68 = v67;

    if (v68)
    {
      v69 = [(CNStarkContactsListViewController *)self siriHeaderView];
      [v68 setHeaderView:v69];
    }
    v70 = [(CNStarkContactsListViewController *)self collectionView];
    v71 = [v70 collectionViewLayout];
    [v71 invalidateLayout];
  }
  else
  {
    id v68 = [(CNStarkContactsListViewController *)self siriHeaderView];
    [(CNContactListViewController *)self setListHeaderView:v68];
  }
}

- (void)contactDataSourceDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactsListViewController;
  [(CNContactListViewController *)&v4 contactDataSourceDidChange:a3];
  [(CNStarkContactsListViewController *)self postMessageOverlayIfNecessary];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__CNStarkContactsListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E5497FB0;
  v4[4] = self;
  CGSize v5 = a3;
  [a4 animateAlongsideTransition:v4 completion:0];
}

uint64_t __88__CNStarkContactsListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshTableViewHeaderWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)deviceIsEnrolledInDirectActionExperiment
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(TRIClient *)self->_trialClient refresh];
  v3 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:@"SIRI_CARPLAY_JARVIS"];
  objc_super v4 = CNUILogStarkSiriExperiment();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CGSize v5 = @"TRUE";
    if (!v3) {
      CGSize v5 = @"FALSE";
    }
    int v9 = 138412290;
    double v10 = v5;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_INFO, "#ABStarkExperiment The device is enrolled in an experiment with namespace SIRI_CARPLAY_JARVIS: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v3)
  {
    id v6 = [v3 experimentId];
    char v7 = [v6 isEqualToString:@"65dfd24b12edf62098adc714"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)sendSiriExperimentTriggerLoggingIfEligible
{
  if (+[CNStarkUtilities vehicleHasBuiltInMic]
    && +[CNStarkUtilities siriLanguageMatchesSystemLanguage]&& [(CNStarkContactsListViewController *)self deviceIsEnrolledInDirectActionExperiment])
  {
    v3 = CNUILogStarkSiriExperiment();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "#ABStarkExperiment User is in Jarvis Car. Emitting Trigger Logging...", v7, 2u);
    }

    analyticsManager = self->_analyticsManager;
    CGSize v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"acf17e91-9c40-4d2b-825f-d74e75f3707c"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [(AIMLExperimentationAnalyticsManager *)analyticsManager emitTriggerForCodePathID:v5 withNamespace:@"SIRI_CARPLAY_JARVIS" requestID:v6 completionHandler:&__block_literal_global_20957];
  }
}

void __79__CNStarkContactsListViewController_sendSiriExperimentTriggerLoggingIfEligible__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = CNUILogStarkSiriExperiment();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_18B625000, v2, OS_LOG_TYPE_ERROR, "#ABStarkExperiment trigger logging failed", v3, 2u);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactsListViewController;
  [(CNContactListViewController *)&v4 viewWillAppear:a3];
  [(CNStarkContactsListViewController *)self updateLimitedUI];
  [(CNStarkContactsListViewController *)self sendSiriExperimentTriggerLoggingIfEligible];
  [(CNStarkContactsListViewController *)self postMessageOverlayIfNecessary];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactsListViewController;
  [(CNContactListViewController *)&v5 viewDidLoad];
  v3 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
  objc_super v4 = [(CNStarkContactsListViewController *)self collectionView];
  [v4 setBackgroundColor:v3];
}

- (void)setLimitedUI:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__CNStarkContactsListViewController_setLimitedUI___block_invoke;
  v3[3] = &unk_1E5499510;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __50__CNStarkContactsListViewController_setLimitedUI___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1376) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) postMessageOverlayIfNecessary];
}

- (void)updateLimitedUI
{
  id v5 = [(CNStarkContactsListViewController *)self externalDevice];
  if ([v5 limitedUI])
  {
    v3 = [(CNStarkContactsListViewController *)self externalDevice];
    BOOL v4 = [v3 limitedUIElements];
    -[CNStarkContactsListViewController setLimitedUI:](self, "setLimitedUI:", [v4 containsObject:*MEMORY[0x1E4F15A30]]);
  }
  else
  {
    [(CNStarkContactsListViewController *)self setLimitedUI:0];
  }
}

- (NSDirectionalEdgeInsets)viewDirectionalLayoutMargins
{
  if ([(CNStarkContactsListViewController *)self isViewLoaded])
  {
    v3 = [(CNStarkContactsListViewController *)self view];
    [v3 directionalLayoutMargins];
    double v5 = v4;
    double v7 = v6;
    double v32 = v9;
    double v33 = v8;

    uint64_t v10 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
    uint64_t v11 = [MEMORY[0x1E4F16508] currentCarPlayExternalDevice];
    int v12 = [v11 rightHandDrive];

    if (v12)
    {
      if (v10 == 1) {
        double v13 = &v32;
      }
      else {
        double v13 = &v33;
      }
    }
    else if (v10 == 1)
    {
      v16 = [(CNStarkContactsListViewController *)self contactListTableView];
      id v17 = [v16 accessoryViewAtEdge:1];

      objc_opt_class();
      double v13 = &v33;
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 desiredAccessoryEdge] == 1) {
        double v13 = &v32;
      }
    }
    else
    {
      double v13 = &v32;
    }
    *double v13 = *v13 + 44.0;
    double v18 = [(CNStarkContactsListViewController *)self view];
    [v18 safeAreaInsets];
    double v20 = v19;
    double v22 = v21;

    double v23 = [(CNStarkContactsListViewController *)self view];
    [v23 bounds];
    double v15 = v32;
    double v14 = v33;
    double v25 = v24 - v33 - v32 - v20 - v22;

    double v26 = round((v25 + -480.0) * 0.25);
    if (v25 > 480.0 && v26 > 12.0)
    {
      double v14 = v14 + v26;
      double v15 = v15 + v26;
    }
  }
  else
  {
    double v5 = *MEMORY[0x1E4FB12A8];
    double v14 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v15 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  }
  double v28 = v5;
  double v29 = v14;
  double v30 = v7;
  double v31 = v15;
  result.trailing = v31;
  result.bottom = v30;
  result.leading = v29;
  result.top = v28;
  return result;
}

- (id)createCollectionView
{
  v3 = [CNContactListCollectionView alloc];
  double v4 = objc_opt_class();
  double v5 = [(CNStarkContactsListViewController *)self contactListStyleApplier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__CNStarkContactsListViewController_createCollectionView__block_invoke;
  v11[3] = &unk_1E5497F60;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CNStarkContactsListViewController_createCollectionView__block_invoke_2;
  v10[3] = &unk_1E5497F88;
  v10[4] = self;
  double v6 = [v4 collectionViewLayoutWithFloatingHeaderViews:1 contactListStyleApplier:v5 directionalLayoutMargins:v11 hasNoContacts:v10];
  double v7 = -[CNContactListCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNStarkContactsListViewController *)self setContactListTableView:v7];

  double v8 = [(CNStarkContactsListViewController *)self contactListTableView];

  return v8;
}

uint64_t __57__CNStarkContactsListViewController_createCollectionView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewDirectionalLayoutMargins];
}

uint64_t __57__CNStarkContactsListViewController_createCollectionView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasNoContacts];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F15A28] object:self->_externalDevice];

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactsListViewController;
  [(CNContactListViewController *)&v4 dealloc];
}

- (CNStarkContactsListViewController)initWithDataSource:(id)a3 searchable:(BOOL)a4 environment:(id)a5 shouldUseLargeTitle:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactsListViewController;
  double v6 = [(CNContactListViewController *)&v8 initWithDataSource:a3 searchable:0 environment:a5 shouldUseLargeTitle:a6];
  [(CNContactListViewController *)v6 setIsHandlingSearch:0];

  return v6;
}

- (void)setupDataSource
{
  v3 = [CNContactStoreDataSource alloc];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  double v6 = [(CNContactStoreDataSource *)v3 initWithStore:v4];

  if (objc_opt_respondsToSelector())
  {
    double v5 = [(CNContactListViewController *)self contactFormatter];
    [(CNContactStoreDataSource *)v6 setContactFormatter:v5];
  }
  [(CNContactListViewController *)self setDataSource:v6];
}

- (CNStarkContactsListViewController)initWithCollectionViewLayout:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CNStarkContactsListViewController;
  v3 = [(CNContactListViewController *)&v19 initWithCollectionViewLayout:a3];
  id v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__CNStarkContactsListViewController_initWithCollectionViewLayout___block_invoke;
    block[3] = &unk_1E549B488;
    double v5 = v3;
    double v18 = v5;
    if (initWithCollectionViewLayout__cn_once_token_8 != -1) {
      dispatch_once(&initWithCollectionViewLayout__cn_once_token_8, block);
    }
    double v6 = v18;
    id v7 = (id)initWithCollectionViewLayout__cn_once_object_8;

    [(CNStarkContactsListViewController *)v5 setDisplayedContactProperties:v7];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    [v8 setStyle:0];
    [v8 setEmphasizesPrimaryNameComponent:1];
    [v8 setFallbackStyle:-1];
    [(CNContactListViewController *)v5 setContactFormatter:v8];
    [(CNContactListViewController *)v5 setShouldDisplayCount:0];
    [(CNContactListViewController *)v5 setDelegate:v5];
    [(CNContactListViewController *)v5 setShouldDisplayEmergencyContacts:0];
    [(CNStarkContactsListViewController *)v5 setupDataSource];
    uint64_t v9 = [MEMORY[0x1E4F16508] currentCarPlayExternalDevice];
    externalDevice = v5->_externalDevice;
    v5->_externalDevice = (AVExternalDevice *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v5 selector:sel_limitedUINotification_ name:*MEMORY[0x1E4F15A28] object:v5->_externalDevice];

    int v12 = (AIMLExperimentationAnalyticsManager *)objc_alloc_init(MEMORY[0x1E4F472D0]);
    analyticsManager = v5->_analyticsManager;
    v5->_analyticsManager = v12;

    uint64_t v14 = [MEMORY[0x1E4FB0098] clientWithIdentifier:331];
    trialClient = v5->_trialClient;
    v5->_trialClient = (TRIClient *)v14;
  }
  return v4;
}

void __66__CNStarkContactsListViewController_initWithCollectionViewLayout___block_invoke()
{
  uint64_t v0 = [(id)objc_opt_class() makeContactsDisplayedProperties];
  v1 = (void *)initWithCollectionViewLayout__cn_once_object_8;
  initWithCollectionViewLayout__cn_once_object_8 = v0;
}

- (CNStarkContactsListViewController)init
{
  v3 = +[CNContactListViewController collectionViewLayout];
  id v4 = [(CNStarkContactsListViewController *)self initWithCollectionViewLayout:v3];

  return v4;
}

+ (id)collectionViewLayoutWithFloatingHeaderViews:(BOOL)a3 contactListStyleApplier:(id)a4 directionalLayoutMargins:(id)a5 hasNoContacts:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  [v8 setHeaderMode:1];
  [v8 setHeaderTopPadding:8.0];
  uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v9];

  id v10 = objc_alloc(MEMORY[0x1E4FB1580]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke;
  v22[3] = &unk_1E5497F38;
  BOOL v25 = a3;
  id v23 = v8;
  id v24 = v7;
  id v11 = v7;
  id v12 = v8;
  double v13 = (void *)[v10 initWithSectionProvider:v22];
  uint64_t v14 = (void *)MEMORY[0x1E4FB1338];
  double v15 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v16 = [MEMORY[0x1E4FB1308] estimatedDimension:0.0];
  id v17 = [v14 sizeWithWidthDimension:v15 heightDimension:v16];

  double v18 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v17 elementKind:@"CNContactListLayoutHeaderIdentifier" alignment:2];
  objc_super v19 = [v13 configuration];
  v26[0] = v18;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v19 setBoundarySupplementaryItems:v20];

  [v13 setConfiguration:v19];

  return v13;
}

id __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];
  double v5 = [v4 boundarySupplementaryItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke_2;
  v10[3] = &__block_descriptor_33_e53__16__0__NSCollectionLayoutBoundarySupplementaryItem_8l;
  char v11 = *(unsigned char *)(a1 + 48);
  double v6 = objc_msgSend(v5, "_cn_map:", v10);
  [v4 setBoundarySupplementaryItems:v6];

  [v4 contentInsets];
  double v8 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v4 setContentInsets:v8];

  return v4;
}

id __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPinToVisibleBounds:*(unsigned __int8 *)(a1 + 32)];

  return v3;
}

+ (id)makeContactsDisplayedProperties
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(Class)getGEOCountryConfigurationClass[0]() sharedConfiguration];
  int v3 = [v2 currentCountrySupportsCarIntegration];

  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F1AF10];
    uint64_t v11 = *MEMORY[0x1E4F1AEE0];
    uint64_t v12 = v4;
    double v5 = (void *)MEMORY[0x1E4F1C978];
    double v6 = &v11;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F1AEE0];
    double v5 = (void *)MEMORY[0x1E4F1C978];
    double v6 = &v10;
    uint64_t v7 = 1;
  }
  double v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12);

  return v8;
}

@end