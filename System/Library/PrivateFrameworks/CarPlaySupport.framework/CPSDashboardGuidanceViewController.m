@interface CPSDashboardGuidanceViewController
- (BOOL)_hasContentReady;
- (BOOL)fakesDashboardSupport;
- (CPDashboardButton)fakeDashboardButton;
- (CPDashboardClientInterface)dashboardClient;
- (CPSDashboardManeuversCardView)maneuversCardView;
- (CPSPausedCardView)pausedCardView;
- (NSArray)activeConstraints;
- (NSArray)dashboardButtons;
- (NSArray)spacingGuides;
- (NSLayoutConstraint)shortcutButtonsContainerViewLeadingConstraint;
- (NSLayoutConstraint)shortcutButtonsContainerViewTrailingConstraint;
- (UIView)shortcutButtonsContainerView;
- (void)_animateShortcutContainerViewIn;
- (void)_animateShortcutContainerViewOut;
- (void)_focusHighlightColorChanged:(id)a3;
- (void)_launchApp:(id)a3;
- (void)_setContentReady;
- (void)_setupFakeButtonIfNecessary;
- (void)_transitionFromViews:(id)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)didSelectButton:(id)a3;
- (void)navigator:(id)a3 didEndTrip:(BOOL)a4;
- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6;
- (void)setActiveConstraints:(id)a3;
- (void)setContentReadyIfNecessary;
- (void)setDashboardButtons:(id)a3;
- (void)setDashboardClient:(id)a3;
- (void)setFakeDashboardButton:(id)a3;
- (void)setFakesDashboardSupport:(BOOL)a3;
- (void)setManeuversCardView:(id)a3;
- (void)setPausedCardView:(id)a3;
- (void)setShortCutButtons:(id)a3;
- (void)setShortcutButtonsContainerView:(id)a3;
- (void)setShortcutButtonsContainerViewLeadingConstraint:(id)a3;
- (void)setShortcutButtonsContainerViewTrailingConstraint:(id)a3;
- (void)setSpacingGuides:(id)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CPSDashboardGuidanceViewController

- (void)viewDidLoad
{
  v30[4] = *MEMORY[0x263EF8340];
  v29 = self;
  SEL v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)CPSDashboardGuidanceViewController;
  [(CPSDashboardGuidanceViewController *)&v27 viewDidLoad];
  id v26 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v2 = (id)[(CPSDashboardGuidanceViewController *)v29 view];
  [v2 addSubview:v26];

  objc_storeStrong((id *)&v29->_shortcutButtonsContainerView, v26);
  id v5 = (id)[v26 leadingAnchor];
  id v4 = (id)[(CPSDashboardGuidanceViewController *)v29 view];
  id v3 = (id)[v4 leadingAnchor];
  id v25 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");

  objc_storeStrong((id *)&v29->_shortcutButtonsContainerViewLeadingConstraint, v25);
  id v8 = (id)[v26 trailingAnchor];
  id v7 = (id)[(CPSDashboardGuidanceViewController *)v29 view];
  id v6 = (id)[v7 trailingAnchor];
  id v24 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");

  objc_storeStrong((id *)&v29->_shortcutButtonsContainerViewTrailingConstraint, v24);
  v9 = (void *)MEMORY[0x263F08938];
  id v18 = (id)[(CPSDashboardGuidanceViewController *)v29 view];
  id v17 = (id)[v18 topAnchor];
  id v16 = (id)[v26 topAnchor];
  id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v30[0] = v15;
  id v14 = (id)[(CPSDashboardGuidanceViewController *)v29 view];
  id v13 = (id)[v14 bottomAnchor];
  id v12 = (id)[v26 bottomAnchor];
  id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v30[1] = v11;
  v30[2] = v29->_shortcutButtonsContainerViewLeadingConstraint;
  v30[3] = v29->_shortcutButtonsContainerViewTrailingConstraint;
  id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  objc_msgSend(v9, "activateConstraints:");

  id v23 = (id)[MEMORY[0x263F08A00] defaultCenter];
  v19 = v29;
  uint64_t v20 = *MEMORY[0x263F31410];
  id v22 = (id)[(CPSDashboardGuidanceViewController *)v29 view];
  id v21 = (id)[v22 window];
  objc_msgSend(v23, "addObserver:selector:name:object:", v19, sel__focusHighlightColorChanged_, v20);

  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
}

- (void)setShortCutButtons:(id)a3
{
  v134[4] = *MEMORY[0x263EF8340];
  v127 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v58 = (id)[(CPSDashboardGuidanceViewController *)v127 view];
  [v58 layoutIfNeeded];

  char v125 = 0;
  v56 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
  BOOL v57 = [(UIView *)v56 isHidden];

  BOOL v124 = v57;
  v55 = [(CPSDashboardGuidanceViewController *)v127 dashboardButtons];
  BOOL v54 = 0;
  if ([(NSArray *)v55 count]) {
    BOOL v54 = !v124;
  }

  if (v54)
  {
    char v125 = 1;
    [(CPSDashboardGuidanceViewController *)v127 _animateShortcutContainerViewOut];
  }
  id v123 = (id)objc_opt_new();
  v53 = [(CPSDashboardGuidanceViewController *)v127 dashboardButtons];
  [(NSArray *)v53 enumerateObjectsUsingBlock:&__block_literal_global];

  if ((unint64_t)[location[0] count] > 2)
  {
    uint64_t v129 = 0;
    uint64_t v128 = 2;
    uint64_t v130 = 0;
    uint64_t v131 = 2;
    v122[1] = 0;
    v122[2] = (id)2;
    id v3 = (id)objc_msgSend(location[0], "subarrayWithRange:", 0, 2);
    id v4 = location[0];
    location[0] = v3;
  }
  if ([location[0] count] == 1)
  {
    v52 = [CPSDashboardItemView alloc];
    id v51 = (id)[location[0] firstObject];
    v122[0] = -[CPSDashboardItemView initWithDashboardButton:layoutAxis:](v52, "initWithDashboardButton:layoutAxis:");

    [v122[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v122[0] setDelegate:v127];
    [v123 addObject:v122[0]];
    id v121 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
    [v121 addSubview:v122[0]];
    v50 = (void *)MEMORY[0x263F08938];
    id v49 = (id)[v122[0] centerYAnchor];
    id v48 = (id)[v121 centerYAnchor];
    id v47 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v134[0] = v47;
    id v46 = (id)[v122[0] leadingAnchor];
    id v45 = (id)[v121 leadingAnchor];
    id v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:constant:", 8.0);
    v134[1] = v44;
    id v43 = (id)[v122[0] trailingAnchor];
    id v42 = (id)[v121 trailingAnchor];
    id v41 = (id)objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:constant:", 8.0);
    v134[2] = v41;
    id v40 = (id)[v122[0] heightAnchor];
    id v39 = (id)[v121 heightAnchor];
    id v38 = (id)objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", -16.0);
    v134[3] = v38;
    id v37 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:4];
    objc_msgSend(v50, "activateConstraints:");

    objc_storeStrong(&v121, 0);
    objc_storeStrong(v122, 0);
  }
  else
  {
    v36 = [(CPSDashboardGuidanceViewController *)v127 spacingGuides];
    uint64_t v115 = MEMORY[0x263EF8330];
    int v116 = -1073741824;
    int v117 = 0;
    v118 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2;
    v119 = &unk_2648A3AC8;
    v120 = v127;
    [(NSArray *)v36 enumerateObjectsUsingBlock:&v115];

    id v114 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v35 = i;
      if (v35 > [location[0] count]) {
        break;
      }
      id v112 = objc_alloc_init(MEMORY[0x263F1C778]);
      v34 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
      [(UIView *)v34 addLayoutGuide:v112];

      [v114 addObject:v112];
      objc_storeStrong(&v112, 0);
    }
    [(CPSDashboardGuidanceViewController *)v127 setSpacingGuides:v114];
    id v111 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v110 = (id)[v114 firstObject];
    uint64_t v103 = 0;
    v104 = &v103;
    int v105 = 838860800;
    int v106 = 48;
    v107 = __Block_byref_object_copy_;
    v108 = __Block_byref_object_dispose_;
    v33 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
    v109 = [(UIView *)v33 leadingAnchor];

    uint64_t v96 = 0;
    v97 = &v96;
    int v98 = 838860800;
    int v99 = 48;
    v100 = __Block_byref_object_copy_;
    v101 = __Block_byref_object_dispose_;
    id v102 = 0;
    id v32 = location[0];
    uint64_t v86 = MEMORY[0x263EF8330];
    int v87 = -1073741824;
    int v88 = 0;
    v89 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_29;
    v90 = &unk_2648A3AF0;
    v91 = v127;
    id v92 = v123;
    id v93 = v114;
    v95[1] = &v96;
    id v94 = v111;
    v95[2] = &v103;
    v95[0] = v110;
    [v32 enumerateObjectsUsingBlock:&v86];
    id v85 = (id)[v114 lastObject];
    id v31 = v111;
    id v30 = (id)[(id)v97[5] trailingAnchor];
    v29 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
    SEL v28 = [(UIView *)v29 trailingAnchor];
    id v27 = (id)objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:");
    v133[0] = v27;
    id v26 = (id)[v85 widthAnchor];
    id v25 = (id)[v110 widthAnchor];
    id v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
    v133[1] = v24;
    id v23 = (id)[v85 leadingAnchor];
    id v22 = (id)[v23 constraintEqualToAnchor:v104[5]];
    v133[2] = v22;
    id v21 = (id)[v85 trailingAnchor];
    uint64_t v20 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
    v19 = [(UIView *)v20 trailingAnchor];
    id v18 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v133[3] = v18;
    id v17 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:4];
    objc_msgSend(v31, "addObjectsFromArray:");

    id v16 = [(CPSDashboardGuidanceViewController *)v127 activeConstraints];
    if (v16)
    {
      id v15 = (void *)MEMORY[0x263F08938];
      id v14 = [(CPSDashboardGuidanceViewController *)v127 activeConstraints];
      objc_msgSend(v15, "deactivateConstraints:");
    }
    objc_storeStrong((id *)&v127->_activeConstraints, v111);
    [MEMORY[0x263F08938] activateConstraints:v111];
    objc_storeStrong(&v85, 0);
    objc_storeStrong(v95, 0);
    objc_storeStrong(&v94, 0);
    objc_storeStrong(&v93, 0);
    objc_storeStrong(&v92, 0);
    objc_storeStrong((id *)&v91, 0);
    _Block_object_dispose(&v96, 8);
    objc_storeStrong(&v102, 0);
    _Block_object_dispose(&v103, 8);
    objc_storeStrong((id *)&v109, 0);
    objc_storeStrong(&v110, 0);
    objc_storeStrong(&v111, 0);
    objc_storeStrong(&v114, 0);
    objc_storeStrong((id *)&v120, 0);
  }
  [(CPSDashboardGuidanceViewController *)v127 setDashboardButtons:v123];
  id v13 = (id)[(CPSDashboardGuidanceViewController *)v127 view];
  [v13 layoutIfNeeded];

  uint64_t v80 = 0;
  v81 = &v80;
  int v82 = 0x20000000;
  int v83 = 32;
  char v84 = 1;
  uint64_t v75 = 0;
  v76 = &v75;
  int v77 = 0x20000000;
  int v78 = 32;
  char v79 = 1;
  v68[1] = (id)MEMORY[0x263EF8330];
  int v69 = -1073741824;
  int v70 = 0;
  v71 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2_31;
  v72 = &unk_2648A3B18;
  v73 = &v80;
  v74 = &v75;
  objc_msgSend(v123, "enumerateObjectsUsingBlock:");
  if ((v81[3] & 1) != 0 && (v76[3] & 1) == 0) {
    [v123 enumerateObjectsUsingBlock:&__block_literal_global_33];
  }
  id v12 = objc_opt_class();
  id v11 = (id)[(CPSDashboardGuidanceViewController *)v127 view];
  id v10 = (id)[v11 window];
  v68[0] = CPSSafeCast_0(v12, v10);

  v9 = [(CPSDashboardGuidanceViewController *)v127 dashboardButtons];
  uint64_t v62 = MEMORY[0x263EF8330];
  int v63 = -1073741824;
  int v64 = 0;
  v65 = __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_4;
  v66 = &unk_2648A3B40;
  id v67 = v68[0];
  [(NSArray *)v9 enumerateObjectsUsingBlock:&v62];

  id v8 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
  [(UIView *)v8 setHidden:v124];

  if (v125) {
    [(CPSDashboardGuidanceViewController *)v127 _animateShortcutContainerViewIn];
  }
  char v60 = 0;
  LOBYTE(v7) = 0;
  if (v68[0])
  {
    id v61 = [(CPSDashboardGuidanceViewController *)v127 shortcutButtonsContainerView];
    char v60 = 1;
    int v7 = [v61 isHidden] ^ 1;
  }
  if (v60) {

  }
  if (v7)
  {
    id v6 = v68[0];
    id v5 = [(CPSDashboardGuidanceViewController *)v127 dashboardButtons];
    objc_msgSend(v6, "setFocusableViews:");
  }
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v132, (uint64_t)location[0], (uint64_t)v127);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Set Shortcut Buttons: %@ on view controller: %@", v132, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(CPSDashboardGuidanceViewController *)v127 _setContentReady];
  objc_storeStrong(&v67, 0);
  objc_storeStrong(v68, 0);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v80, 8);
  objc_storeStrong(&v123, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] removeFromSuperview];
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[a1[4] shortcutButtonsContainerView];
  [v3 removeLayoutGuide:location[0]];

  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_29(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v54[2] = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v51 = a3;
  v50[2] = a4;
  v50[1] = (id)a1;
  id v4 = [CPSDashboardItemView alloc];
  v50[0] = [(CPSDashboardItemView *)v4 initWithDashboardButton:location[0] layoutAxis:2];
  [v50[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v50[0] setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v50[0]];
  id v47 = (id)[*(id *)(a1 + 32) shortcutButtonsContainerView];
  [v47 addSubview:v50[0]];

  id v49 = (id)[*(id *)(a1 + 48) objectAtIndex:a3];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v37 = *(void **)(a1 + 56);
    id v44 = (id)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) trailingAnchor];
    id v43 = (id)[v49 centerXAnchor];
    id v42 = (id)objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:");
    v54[0] = v42;
    id v41 = (id)[v50[0] leadingAnchor];
    id v40 = (id)[v49 centerXAnchor];
    id v39 = (id)objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:");
    v54[1] = v39;
    id v38 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
    objc_msgSend(v37, "addObjectsFromArray:");
  }
  else if (!v51)
  {
    id v32 = *(void **)(a1 + 56);
    id v36 = (id)[v50[0] leadingAnchor];
    id v35 = (id)[*(id *)(a1 + 32) shortcutButtonsContainerView];
    id v34 = (id)[v35 leadingAnchor];
    id v33 = (id)objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:");
    objc_msgSend(v32, "addObject:");
  }
  id v8 = *(void **)(a1 + 56);
  id v30 = (id)[v49 leadingAnchor];
  id v29 = (id)[v30 constraintEqualToAnchor:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  v53[0] = v29;
  id v28 = (id)[v49 trailingAnchor];
  id v27 = (id)[v50[0] imageView];
  id v26 = (id)[v27 leadingAnchor];
  id v25 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
  v53[1] = v25;
  id v24 = (id)[v50[0] topAnchor];
  id v23 = (id)[*(id *)(a1 + 32) shortcutButtonsContainerView];
  id v22 = (id)[v23 topAnchor];
  id v21 = (id)objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:");
  v53[2] = v21;
  id v20 = (id)[v50[0] bottomAnchor];
  id v19 = (id)[*(id *)(a1 + 32) shortcutButtonsContainerView];
  id v18 = (id)[v19 bottomAnchor];
  id v17 = (id)objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:");
  v53[3] = v17;
  id v16 = (id)[v50[0] centerYAnchor];
  id v15 = (id)[*(id *)(a1 + 32) shortcutButtonsContainerView];
  id v14 = (id)[v15 centerYAnchor];
  id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v53[4] = v13;
  id v12 = (id)[v49 widthAnchor];
  id v11 = (id)[*(id *)(a1 + 64) widthAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v53[5] = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:6];
  objc_msgSend(v8, "addObjectsFromArray:");

  id v31 = (id)[v50[0] imageView];
  id v5 = (id)[v31 trailingAnchor];
  uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v50[0]);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(v50, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_2_31(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = (id)[location[0] dashboardButton];
  id v8 = (id)[v9 subtitleVariants];
  BOOL v10 = [v8 count] != 0;

  if (!v10)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
  id v4 = (id)[location[0] subtitleLabel];
  char v5 = [v4 isHidden];

  if (v5) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] hideSubtitle];
  objc_storeStrong(location, 0);
}

void __57__CPSDashboardGuidanceViewController_setShortCutButtons___block_invoke_4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[a1[4] focusHighlightColor];
  objc_msgSend(location[0], "setFocusHighlightColor:");

  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = (id)[location[0] identifier];
  if ([(CPSDashboardGuidanceViewController *)v14 fakesDashboardSupport]
    && (id v8 = [(CPSDashboardGuidanceViewController *)v14 fakeDashboardButton],
        id v7 = (id)[(CPDashboardButton *)v8 identifier],
        char v9 = objc_msgSend(v12, "isEqual:"),
        v7,
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v6 = [(CPSDashboardGuidanceViewController *)v14 fakeDashboardButton];
    [(CPDashboardButton *)v6 handlePrimaryAction];

    int v11 = 1;
  }
  else
  {
    id v10 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v14, (uint64_t)v12);
      _os_log_debug_impl(&dword_22B689000, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v15, 0x16u);
    }
    objc_storeStrong(&v10, 0);
    id v4 = [(CPSDashboardGuidanceViewController *)v14 dashboardClient];
    char v5 = [(CPDashboardClientInterface *)v4 conformsToProtocol:&unk_26DF782F0];

    if (v5)
    {
      id v3 = [(CPSDashboardGuidanceViewController *)v14 dashboardClient];
      [(CPDashboardClientInterface *)v3 handleActionForControlIdentifier:v12];
    }
    int v11 = 0;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  v38[2] = *MEMORY[0x263EF8340];
  id v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  [(CPSDashboardGuidanceViewController *)v37 _setContentReady];
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v27 = [(CPSDashboardGuidanceViewController *)v37 maneuversCardView];

  if (v27)
  {
    id v25 = [(CPSDashboardGuidanceViewController *)v37 maneuversCardView];
    objc_msgSend(v34, "addObject:");
  }
  id v24 = [(CPSDashboardGuidanceViewController *)v37 pausedCardView];

  if (v24)
  {
    id v23 = [(CPSDashboardGuidanceViewController *)v37 pausedCardView];
    objc_msgSend(v34, "addObject:");
  }
  BOOL v33 = 0;
  char v31 = 0;
  BOOL v22 = 1;
  if (![v34 count])
  {
    id v32 = [(CPSDashboardGuidanceViewController *)v37 dashboardButtons];
    char v31 = 1;
    BOOL v22 = [(NSArray *)v32 count] != 0;
  }
  if (v31) {

  }
  BOOL v33 = v22;
  -[CPSDashboardGuidanceViewController setManeuversCardView:](v37, "setManeuversCardView:");
  [(CPSDashboardGuidanceViewController *)v37 setPausedCardView:0];
  id v30 = 0;
  if ([location[0] count])
  {
    id v20 = [(CPSDashboardGuidanceViewController *)v37 shortcutButtonsContainerView];
    char v28 = 0;
    LOBYTE(v21) = 0;
    if (v20)
    {
      id v29 = [(CPSDashboardGuidanceViewController *)v37 shortcutButtonsContainerView];
      char v28 = 1;
      int v21 = ![(UIView *)v29 isHidden];
    }
    if (v28) {

    }
    if (v21) {
      [(CPSDashboardGuidanceViewController *)v37 _animateShortcutContainerViewOut];
    }
    id v4 = objc_alloc_init(CPSDashboardManeuversCardView);
    char v5 = v30;
    id v30 = v4;

    id v7 = (id)[MEMORY[0x263F1C550] clearColor];
    -[CPSDashboardManeuversCardView setBackgroundColor:](v30, "setBackgroundColor:");

    [(CPSDashboardManeuversCardView *)v30 setAllowsCustomBackgroundColorForManeuver:0];
    [(CPSDashboardManeuversCardView *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = (id)[(CPSDashboardGuidanceViewController *)v37 view];
    [v8 addSubview:v30];

    objc_storeStrong((id *)&v37->_maneuversCardView, v30);
    [(CPSDashboardManeuversCardView *)v30 showManeuvers:location[0] usingDisplayStyles:v35];
    char v9 = (void *)MEMORY[0x263F08938];
    id v18 = (id)[(CPSDashboardGuidanceViewController *)v37 view];
    id v17 = (id)[v18 topAnchor];
    id v16 = (id)[(CPSDashboardManeuversCardView *)v30 topAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v38[0] = v15;
    id v14 = (id)[(CPSDashboardGuidanceViewController *)v37 view];
    id v13 = (id)[v14 bottomAnchor];
    id v12 = (id)[(CPSDashboardManeuversCardView *)v30 bottomAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v38[1] = v11;
    id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    objc_msgSend(v9, "activateConstraints:");

    id v19 = [(CPSDashboardGuidanceViewController *)v37 maneuversCardView];
    [(CPSDashboardManeuversCardView *)v19 setHidden:0];
  }
  -[CPSDashboardGuidanceViewController _transitionFromViews:inView:animated:](v37, "_transitionFromViews:inView:animated:", v34, v30, v33, &v30);
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  char v5 = [(CPSDashboardGuidanceViewController *)v8 maneuversCardView];
  [(CPSDashboardManeuversCardView *)v5 updateEstimates:location[0] forManeuver:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  v32[2] = *MEMORY[0x263EF8340];
  char v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v29 = a4;
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = 0;
  objc_storeStrong(&v27, a6);
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v24 = [(CPSDashboardGuidanceViewController *)v31 maneuversCardView];

  if (v24)
  {
    id v20 = [(CPSDashboardGuidanceViewController *)v31 maneuversCardView];
    objc_msgSend(v26, "addObject:");
  }
  id v19 = [(CPSDashboardGuidanceViewController *)v31 pausedCardView];

  if (v19)
  {
    id v18 = [(CPSDashboardGuidanceViewController *)v31 pausedCardView];
    objc_msgSend(v26, "addObject:");
  }
  -[CPSDashboardGuidanceViewController setManeuversCardView:](v31, "setManeuversCardView:");
  [(CPSDashboardGuidanceViewController *)v31 setPausedCardView:0];
  id v6 = [CPSPausedCardView alloc];
  id v25 = [(CPSPausedCardView *)v6 initWithReason:v29 title:v28 backgroundColor:0];
  id v7 = (id)[(CPSDashboardGuidanceViewController *)v31 view];
  [v7 addSubview:v25];

  objc_storeStrong((id *)&v31->_pausedCardView, v25);
  id v8 = (void *)MEMORY[0x263F08938];
  id v17 = (id)[(CPSDashboardGuidanceViewController *)v31 view];
  id v16 = (id)[v17 topAnchor];
  id v15 = (id)[(CPSPausedCardView *)v25 topAnchor];
  id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v32[0] = v14;
  id v13 = (id)[(CPSDashboardGuidanceViewController *)v31 view];
  id v12 = (id)[v13 bottomAnchor];
  id v11 = (id)[(CPSPausedCardView *)v25 bottomAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v32[1] = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  objc_msgSend(v8, "activateConstraints:");

  [(CPSDashboardGuidanceViewController *)v31 _animateShortcutContainerViewOut];
  [(CPSDashboardGuidanceViewController *)v31 _transitionFromViews:v26 inView:v25 animated:1];
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = [(CPSDashboardGuidanceViewController *)v12 maneuversCardView];

  if (v8)
  {
    id v6 = [(CPSDashboardGuidanceViewController *)v12 maneuversCardView];
    objc_msgSend(v9, "addObject:");
  }
  char v5 = [(CPSDashboardGuidanceViewController *)v12 pausedCardView];

  if (v5)
  {
    id v4 = [(CPSDashboardGuidanceViewController *)v12 pausedCardView];
    objc_msgSend(v9, "addObject:");
  }
  -[CPSDashboardGuidanceViewController setManeuversCardView:](v12, "setManeuversCardView:");
  [(CPSDashboardGuidanceViewController *)v12 setPausedCardView:0];
  [(CPSDashboardGuidanceViewController *)v12 _transitionFromViews:v9 inView:0 animated:1];
  [(CPSDashboardGuidanceViewController *)v12 _animateShortcutContainerViewIn];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4 animated:(BOOL)a5
{
  v85[2] = *MEMORY[0x263EF8340];
  int v83 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v81 = 0;
  objc_storeStrong(&v81, a4);
  BOOL v80 = a5;
  if (a5)
  {
    id v54 = location[0];
    uint64_t v74 = MEMORY[0x263EF8330];
    int v75 = -1073741824;
    int v76 = 0;
    int v77 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke;
    int v78 = &unk_2648A3BB8;
    char v79 = v83;
    [v54 enumerateObjectsUsingBlock:&v74];
    if (v81)
    {
      id v40 = (id)[v81 leadingAnchor];
      id v39 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
      id v38 = (id)[v39 leadingAnchor];
      id v37 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
      [v37 frame];
      v72[1] = v5;
      v72[2] = v6;
      v72[3] = v7;
      v72[4] = v8;
      id v73 = (id)[v40 constraintEqualToAnchor:v38 constant:*(double *)&v7];

      id v44 = (id)[v81 trailingAnchor];
      id v43 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
      id v42 = (id)[v43 trailingAnchor];
      id v41 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
      [v41 frame];
      v71[1] = v9;
      v71[2] = v10;
      v71[3] = v11;
      v71[4] = v12;
      v72[0] = (id)[v44 constraintEqualToAnchor:v42 constant:*(double *)&v11];

      id v45 = (void *)MEMORY[0x263F08938];
      v85[0] = v73;
      v85[1] = v72[0];
      id v46 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:2];
      objc_msgSend(v45, "activateConstraints:");

      id v47 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
      [v47 layoutIfNeeded];

      [v81 layoutIfNeeded];
      id v48 = (void *)MEMORY[0x263F29BC8];
      id v49 = (id)[MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      v71[0] = (id)objc_msgSend(v48, "settingsWithDuration:timingFunction:", 0.35);

      id v13 = objc_opt_class();
      id v70 = CPSSafeCast_0(v13, v81);
      v50 = objc_opt_class();
      id v52 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
      id v51 = (id)[v52 window];
      id v69 = CPSSafeCast_0(v50, v51);

      char v68 = 0;
      char v53 = 0;
      if (v70) {
        char v53 = [v70 wantsLargeSize];
      }
      char v68 = v53 & 1;
      id v34 = (id)[v69 widgetSizes];
      id v33 = (id)[v34 lastObject];
      [v33 CGSizeValue];
      uint64_t v66 = v14;
      uint64_t v67 = v15;

      char v65 = 0;
      id v35 = (id)[v69 widgetSizes];
      char v63 = 0;
      char v36 = 0;
      if ([v35 count])
      {
        id v64 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
        char v63 = 1;
        [v64 frame];
        v62[1] = v16;
        v62[2] = v17;
        v62[3] = v18;
        v62[4] = v19;
        char v36 = BSFloatGreaterThanOrEqualToFloat();
      }
      if (v63) {

      }
      char v65 = v36 & 1;
      if ((v36 & 1) != (v68 & 1)) {
        [v69 setNeedsLargeSize:v68 & 1 animationSettings:v71[0]];
      }
      objc_msgSend(v73, "setConstant:");
      [v72[0] setConstant:0.0];
      id v32 = (void *)MEMORY[0x263F1CB60];
      [v71[0] duration];
      double v31 = v20;
      uint64_t v57 = MEMORY[0x263EF8330];
      int v58 = -1073741824;
      int v59 = 0;
      char v60 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_4;
      id v61 = &unk_2648A3BE0;
      v62[0] = v83;
      [v32 animateWithDuration:0 delay:&v57 options:&__block_literal_global_88 animations:v31 completion:0.0];
      objc_storeStrong(v62, 0);
      objc_storeStrong(&v69, 0);
      objc_storeStrong(&v70, 0);
      objc_storeStrong(v71, 0);
      objc_storeStrong(v72, 0);
      objc_storeStrong(&v73, 0);
    }
    objc_storeStrong((id *)&v79, 0);
  }
  else if (v81)
  {
    int v21 = (void *)MEMORY[0x263F08938];
    id v30 = (id)[v81 leadingAnchor];
    id v29 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
    id v28 = (id)[v29 leadingAnchor];
    id v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:");
    v84[0] = v27;
    id v26 = (id)[v81 trailingAnchor];
    id v25 = (id)[(CPSDashboardGuidanceViewController *)v83 view];
    id v24 = (id)[v25 trailingAnchor];
    id v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", 0.0);
    v84[1] = v23;
    id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
    objc_msgSend(v21, "activateConstraints:");
  }
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  void v38[3] = a3;
  v38[2] = a4;
  v38[1] = a1;
  v38[0] = (id)[location[0] snapshotViewAfterScreenUpdates:0];
  id v15 = (id)[a1[4] view];
  [v15 addSubview:v38[0]];

  id v16 = v38[0];
  [location[0] frame];
  double v34 = v4;
  double v35 = v5;
  double v36 = v6;
  double v37 = v7;
  objc_msgSend(v16, "setFrame:", v4, v5, v6, v7);
  [location[0] removeFromSuperview];
  [v38[0] frame];
  *((void *)&v32 + 1) = v8;
  *(double *)&long long v33 = v9;
  *((void *)&v33 + 1) = v10;
  *(double *)&long long v32 = v11 - v9;
  id v17 = (void *)MEMORY[0x263F1CB60];
  uint64_t v24 = MEMORY[0x263EF8330];
  int v25 = -1073741824;
  int v26 = 0;
  id v27 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_2;
  id v28 = &unk_2648A3B68;
  id v29 = v38[0];
  long long v30 = v32;
  long long v31 = v33;
  uint64_t v18 = MEMORY[0x263EF8330];
  int v19 = -1073741824;
  int v20 = 0;
  int v21 = __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_3;
  id v22 = &unk_2648A3B90;
  id v23 = v38[0];
  objc_msgSend(v17, "animateWithDuration:animations:completion:", &v24, 0.35);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __75__CPSDashboardGuidanceViewController__transitionFromViews_inView_animated___block_invoke_4(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)_animateShortcutContainerViewOut
{
  v49[4] = *MEMORY[0x263EF8340];
  id v47 = self;
  v46[1] = (id)a2;
  id v28 = objc_opt_class();
  id v30 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
  id v29 = (id)[v30 window];
  v46[0] = CPSSafeCast_0(v28, v29);

  [v46[0] setFocusableViews:MEMORY[0x263EFFA68]];
  long long v31 = [(CPSDashboardGuidanceViewController *)v47 shortcutButtonsContainerView];
  id location = [(UIView *)v31 snapshotViewAfterScreenUpdates:0];

  long long v32 = [(CPSDashboardGuidanceViewController *)v47 shortcutButtonsContainerView];
  [(UIView *)v32 setHidden:1];

  if (location)
  {
    [location setTranslatesAutoresizingMaskIntoConstraints:0];
    id v2 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
    [v2 addSubview:location];

    id v3 = (void *)MEMORY[0x263F08938];
    id v20 = (id)[location trailingAnchor];
    id v19 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
    id v18 = (id)[v19 trailingAnchor];
    id v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v49[0] = v17;
    id v16 = (id)[location topAnchor];
    id v15 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
    id v14 = (id)[v15 topAnchor];
    id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v49[1] = v13;
    id v12 = (id)[location bottomAnchor];
    id v11 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
    id v10 = (id)[v11 bottomAnchor];
    id v9 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v49[2] = v9;
    id v8 = (id)[location widthAnchor];
    id v7 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
    id v6 = (id)[v7 widthAnchor];
    id v5 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
    v49[3] = v5;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
    objc_msgSend(v3, "activateConstraints:");

    [location layoutIfNeeded];
    int v21 = (void *)MEMORY[0x263F08938];
    id v26 = (id)[location trailingAnchor];
    id v25 = (id)[(CPSDashboardGuidanceViewController *)v47 view];
    id v24 = (id)[v25 leadingAnchor];
    id v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
    id v48 = v23;
    id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
    objc_msgSend(v21, "activateConstraints:");

    id v27 = (void *)MEMORY[0x263F1CB60];
    uint64_t v39 = MEMORY[0x263EF8330];
    int v40 = -1073741824;
    int v41 = 0;
    id v42 = __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke;
    id v43 = &unk_2648A3BE0;
    id v44 = v47;
    uint64_t v33 = MEMORY[0x263EF8330];
    int v34 = -1073741824;
    int v35 = 0;
    double v36 = __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke_2;
    double v37 = &unk_2648A3B90;
    id v38 = location;
    objc_msgSend(v27, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v39, &v33, 0.3, 0.0, 0.8);
    objc_storeStrong(&v38, 0);
    objc_storeStrong((id *)&v44, 0);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v46, 0);
}

void __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

uint64_t __70__CPSDashboardGuidanceViewController__animateShortcutContainerViewOut__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_animateShortcutContainerViewIn
{
  long long v31 = self;
  v30[9] = (id)a2;
  id v10 = [(CPSDashboardGuidanceViewController *)self shortcutButtonsContainerView];
  [(UIView *)v10 setHidden:0];

  id v12 = [(CPSDashboardGuidanceViewController *)v31 shortcutButtonsContainerViewLeadingConstraint];
  id v11 = (id)[(CPSDashboardGuidanceViewController *)v31 view];
  [v11 frame];
  void v30[5] = v2;
  v30[6] = v3;
  v30[7] = v4;
  v30[8] = v5;
  [(NSLayoutConstraint *)v12 setConstant:*(double *)&v4 + 8.0];

  id v14 = [(CPSDashboardGuidanceViewController *)v31 shortcutButtonsContainerViewTrailingConstraint];
  id v13 = (id)[(CPSDashboardGuidanceViewController *)v31 view];
  [v13 frame];
  v30[1] = v6;
  v30[2] = v7;
  v30[3] = v8;
  v30[4] = v9;
  [(NSLayoutConstraint *)v14 setConstant:*(double *)&v8 + 8.0];

  id v15 = (id)[(CPSDashboardGuidanceViewController *)v31 view];
  [v15 layoutIfNeeded];

  id v16 = [(CPSDashboardGuidanceViewController *)v31 shortcutButtonsContainerViewLeadingConstraint];
  -[NSLayoutConstraint setConstant:](v16, "setConstant:");

  id v17 = [(CPSDashboardGuidanceViewController *)v31 shortcutButtonsContainerViewTrailingConstraint];
  [(NSLayoutConstraint *)v17 setConstant:0.0];

  id v18 = (void *)MEMORY[0x263F1CB60];
  uint64_t v25 = MEMORY[0x263EF8330];
  int v26 = -1073741824;
  int v27 = 0;
  id v28 = __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke;
  id v29 = &unk_2648A3BE0;
  v30[0] = v31;
  uint64_t v19 = MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke_2;
  id v23 = &unk_2648A3B90;
  id v24 = v31;
  objc_msgSend(v18, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v25, 0.3, 0.0, 0.8);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(v30, 0);
}

void __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __69__CPSDashboardGuidanceViewController__animateShortcutContainerViewIn__block_invoke_2(id *a1, char a2)
{
  id v10 = a1;
  char v9 = a2 & 1;
  v8[1] = a1;
  id v2 = objc_opt_class();
  id v4 = (id)[a1[4] view];
  id v3 = (id)[v4 window];
  v8[0] = CPSSafeCast_0(v2, v3);

  id v6 = v8[0];
  id v7 = (id)[a1[4] dashboardButtons];
  objc_msgSend(v6, "setFocusableViews:");

  objc_storeStrong(v8, 0);
}

- (void)_focusHighlightColorChanged:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_opt_class();
  id v5 = (id)[(CPSDashboardGuidanceViewController *)v15 view];
  id v4 = (id)[v5 window];
  id v13 = CPSSafeCast_0(v3, v4);

  id v6 = [(CPSDashboardGuidanceViewController *)v15 dashboardButtons];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __66__CPSDashboardGuidanceViewController__focusHighlightColorChanged___block_invoke;
  id v11 = &unk_2648A3B40;
  id v12 = v13;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __66__CPSDashboardGuidanceViewController__focusHighlightColorChanged___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[a1[4] focusHighlightColor];
  objc_msgSend(location[0], "setFocusHighlightColor:");

  objc_storeStrong(location, 0);
}

- (void)_setContentReady
{
  id v16 = self;
  v15[1] = (id)a2;
  id v6 = objc_opt_class();
  id v8 = (id)[(CPSDashboardGuidanceViewController *)v16 view];
  id v7 = (id)[v8 window];
  v15[0] = CPSSafeCast_0(v6, v7);

  if (v15[0])
  {
    id location = CarPlaySupportGeneralLogging();
    char v13 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      os_log_type_t type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_22B689000, log, type, "Window exists, setting content ready", v12, 2u);
    }
    objc_storeStrong(&location, 0);
    [v15[0] setContentReady];
  }
  else
  {
    id v11 = CarPlaySupportGeneralLogging();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = v11;
      os_log_type_t v3 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_impl(&dword_22B689000, v2, v3, "Dashboard Window does not exist, pending content ready", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(v15, 0);
}

- (void)viewDidLayoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSDashboardGuidanceViewController;
  [(CPSDashboardGuidanceViewController *)&v2 viewDidLayoutSubviews];
  [(CPSDashboardGuidanceViewController *)v4 setContentReadyIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSDashboardGuidanceViewController;
  [(CPSDashboardGuidanceViewController *)&v3 viewDidAppear:a3];
  [(CPSDashboardGuidanceViewController *)v6 setContentReadyIfNecessary];
}

- (void)setContentReadyIfNecessary
{
  id v7 = self;
  location[1] = (id)a2;
  if ([(CPSDashboardGuidanceViewController *)self _hasContentReady])
  {
    location[0] = CarPlaySupportGeneralLogging();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v5;
      __os_log_helper_16_0_0(v4);
      _os_log_impl(&dword_22B689000, log, type, "Content is ready, sending contentReady to host.", v4, 2u);
    }
    objc_storeStrong(location, 0);
    [(CPSDashboardGuidanceViewController *)v7 _setContentReady];
  }
}

- (BOOL)_hasContentReady
{
  objc_super v3 = [(CPSDashboardGuidanceViewController *)self maneuversCardView];
  char v5 = 0;
  BOOL v4 = 1;
  if (!v3)
  {
    id v6 = [(CPSDashboardGuidanceViewController *)self dashboardButtons];
    char v5 = 1;
    BOOL v4 = v6 != 0;
  }
  if (v5) {

  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  char v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSDashboardGuidanceViewController;
  [(CPSDashboardGuidanceViewController *)&v3 traitCollectionDidChange:location[0]];
  [(CPSDashboardGuidanceViewController *)v5 _setupFakeButtonIfNecessary];
  objc_storeStrong(location, 0);
}

- (void)_setupFakeButtonIfNecessary
{
  v43[2] = *MEMORY[0x263EF8340];
  int v41 = self;
  SEL v40 = a2;
  char v38 = 0;
  BOOL v17 = 0;
  if ([(CPSDashboardGuidanceViewController *)self fakesDashboardSupport])
  {
    uint64_t v39 = [(CPSDashboardGuidanceViewController *)v41 fakeDashboardButton];
    char v38 = 1;
    BOOL v17 = v39 == 0;
  }
  if (v38) {

  }
  if (v17)
  {
    id v13 = (id)[(CPSDashboardGuidanceViewController *)v41 view];
    id v12 = (id)[v13 window];
    id v37 = (id)[v12 windowScene];

    id v14 = objc_opt_class();
    id v16 = (id)[v37 _FBSScene];
    id v15 = (id)[v16 settings];
    id v36 = CPSSafeCast_0(v14, v15);

    if (v36)
    {
      id v35 = (id)[v36 proxiedApplicationBundleIdentifier];
      objc_super v2 = (void *)MEMORY[0x263F1C6B0];
      id v3 = v35;
      id v4 = (id)[(CPSDashboardGuidanceViewController *)v41 traitCollection];
      [v4 displayScale];
      id v34 = (id)objc_msgSend(v2, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 8);

      id v6 = objc_alloc(MEMORY[0x263EFC9E0]);
      v43[0] = @"This is test UI";
      v43[1] = v35;
      id v7 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v43);
      id v5 = v34;
      uint64_t v26 = MEMORY[0x263EF8330];
      int v27 = -1073741824;
      int v28 = 0;
      id v29 = __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke;
      id v30 = &unk_2648A3C28;
      long long v31 = v41;
      id v32 = v35;
      id v33 = (id)[v6 initWithTitleVariants:&unk_26DF06A60 subtitleVariants:v7 image:v5 handler:&v26];

      id v9 = objc_alloc(MEMORY[0x263EFC9E0]);
      id v8 = v34;
      uint64_t v18 = MEMORY[0x263EF8330];
      int v19 = -1073741824;
      int v20 = 0;
      int v21 = __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke_2;
      id v22 = &unk_2648A3C28;
      id v23 = v41;
      id v24 = v35;
      uint64_t v25 = [v9 initWithTitleVariants:&unk_26DF06A78 subtitleVariants:&unk_26DF06A90 image:v8 handler:&v18];
      [(CPSDashboardGuidanceViewController *)v41 setFakeDashboardButton:v33];
      os_log_type_t v10 = v41;
      v42[0] = v33;
      v42[1] = v25;
      id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
      -[CPSDashboardGuidanceViewController setShortCutButtons:](v10, "setShortCutButtons:");

      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong((id *)&v23, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong((id *)&v31, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
}

void __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _launchApp:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0);
}

void __65__CPSDashboardGuidanceViewController__setupFakeButtonIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _launchApp:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0);
}

- (void)_launchApp:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F3F4A0] dashboardService];
  [v3 openApplication:location[0] withOptions:0 completion:&__block_literal_global_120];

  objc_storeStrong(location, 0);
}

void __49__CPSDashboardGuidanceViewController__launchApp___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = 0;
  objc_storeStrong(&v4, a3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setFakesDashboardSupport:(BOOL)a3
{
  if (self->_fakesDashboardSupport != a3)
  {
    self->_fakesDashboardSupport = a3;
    [(CPSDashboardGuidanceViewController *)self _setupFakeButtonIfNecessary];
  }
}

- (CPDashboardClientInterface)dashboardClient
{
  return self->_dashboardClient;
}

- (void)setDashboardClient:(id)a3
{
}

- (BOOL)fakesDashboardSupport
{
  return self->_fakesDashboardSupport;
}

- (NSArray)dashboardButtons
{
  return self->_dashboardButtons;
}

- (void)setDashboardButtons:(id)a3
{
}

- (CPSDashboardManeuversCardView)maneuversCardView
{
  return self->_maneuversCardView;
}

- (void)setManeuversCardView:(id)a3
{
}

- (CPSPausedCardView)pausedCardView
{
  return self->_pausedCardView;
}

- (void)setPausedCardView:(id)a3
{
}

- (CPDashboardButton)fakeDashboardButton
{
  return self->_fakeDashboardButton;
}

- (void)setFakeDashboardButton:(id)a3
{
}

- (UIView)shortcutButtonsContainerView
{
  return self->_shortcutButtonsContainerView;
}

- (void)setShortcutButtonsContainerView:(id)a3
{
}

- (NSLayoutConstraint)shortcutButtonsContainerViewLeadingConstraint
{
  return self->_shortcutButtonsContainerViewLeadingConstraint;
}

- (void)setShortcutButtonsContainerViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)shortcutButtonsContainerViewTrailingConstraint
{
  return self->_shortcutButtonsContainerViewTrailingConstraint;
}

- (void)setShortcutButtonsContainerViewTrailingConstraint:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (NSArray)spacingGuides
{
  return self->_spacingGuides;
}

- (void)setSpacingGuides:(id)a3
{
}

- (void).cxx_destruct
{
}

@end