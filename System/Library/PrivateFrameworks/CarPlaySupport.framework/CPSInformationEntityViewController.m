@interface CPSInformationEntityViewController
- (CPSHairlineView)hairlineView;
- (CPSInformationScrollView)scrollView;
- (CPSInformationTemplateButtonsViewController)buttonsViewController;
- (NSArray)centeringGuideConstraints;
- (NSLayoutConstraint)itemStackViewLeadingConstraint;
- (NSLayoutConstraint)itemStackViewWidthConstraint;
- (UILabel)titleLabel;
- (UILayoutGuide)centeringGuide;
- (UIStackView)itemStackView;
- (UIVisualEffectView)visualEffectView;
- (id)informationTemplate;
- (void)_scrollViewAccessoryInsetsDidChange:(id)a3;
- (void)_setHairlineHidden:(BOOL)a3;
- (void)_updateCenteringGuideConstraints;
- (void)_updateHairline;
- (void)_updateItemStackView;
- (void)_updateScrollViewInsets;
- (void)_viewDidLoad;
- (void)didSelectButton:(id)a3;
- (void)scrollViewContentSizeChanged:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setButtonsViewController:(id)a3;
- (void)setCenteringGuide:(id)a3;
- (void)setCenteringGuideConstraints:(id)a3;
- (void)setControl:(id)a3 enabled:(BOOL)a4;
- (void)setHairlineView:(id)a3;
- (void)setItemStackView:(id)a3;
- (void)setItemStackViewLeadingConstraint:(id)a3;
- (void)setItemStackViewWidthConstraint:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)updateWithInformationTemplate:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation CPSInformationEntityViewController

- (id)informationTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_19(v3, v4);

  return v5;
}

- (void)updateWithInformationTemplate:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __68__CPSInformationEntityViewController_updateWithInformationTemplate___block_invoke;
  v8 = &unk_2648A3990;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __68__CPSInformationEntityViewController_updateWithInformationTemplate___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) informationTemplate];
  [v2 updateTemplatePropertiesFromTemplate:*(void *)(a1 + 40)];

  id v5 = (id)[*(id *)(a1 + 32) buttonsViewController];
  id v4 = (id)[*(id *)(a1 + 32) informationTemplate];
  id v3 = (id)[v4 actions];
  objc_msgSend(v5, "setButtons:");

  return [*(id *)(a1 + 32) _updateItemStackView];
}

- (void)viewDidLayoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSInformationEntityViewController;
  [(CPSInformationEntityViewController *)&v2 viewDidLayoutSubviews];
  [(CPSInformationEntityViewController *)v4 _updateScrollViewInsets];
  [(CPSInformationEntityViewController *)v4 _updateHairline];
}

- (void)_viewDidLoad
{
  v140[3] = *MEMORY[0x263EF8340];
  v136 = self;
  SEL v135 = a2;
  v134.receiver = self;
  v134.super_class = (Class)CPSInformationEntityViewController;
  [(CPSBaseTemplateViewController *)&v134 _viewDidLoad];
  id v133 = (id)[(CPSInformationEntityViewController *)v136 view];
  id v113 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  objc_msgSend(v133, "setBackgroundColor:");

  id v132 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v2 = [CPSInformationScrollView alloc];
  v114 = (double *)MEMORY[0x263F001A8];
  v131 = -[CPSInformationScrollView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CPSInformationScrollView *)v131 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSInformationScrollView *)v131 setDelegate:v136];
  [(CPSInformationScrollView *)v131 setScrollviewDelegate:v136];
  [v133 addSubview:v131];
  [(CPSInformationEntityViewController *)v136 setScrollView:v131];
  id v130 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", *v114, v114[1], v114[2], v114[3]);
  [v130 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v130, "setAlignment:");
  [v130 setDistribution:0];
  [v130 setAxis:1];
  [v130 setBaselineRelativeArrangement:1];
  id v115 = [(CPSInformationEntityViewController *)v136 informationTemplate];
  uint64_t v3 = [v115 layout];
  double v4 = 18.0;
  if (v3) {
    double v4 = 6.0;
  }
  [v130 setSpacing:v4];

  [(CPSInformationScrollView *)v131 addSubview:v130];
  [(CPSInformationEntityViewController *)v136 setItemStackView:v130];
  [(CPSInformationEntityViewController *)v136 _updateItemStackView];
  id v116 = (id)[v133 safeAreaLayoutGuide];
  id v129 = (id)[v116 topAnchor];

  id v117 = [(CPSInformationEntityViewController *)v136 informationTemplate];
  id v128 = (id)[v117 title];

  id v118 = (id)[(CPSInformationEntityViewController *)v136 tabBarController];
  if (v118)
  {
    id v127 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v127 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v97 = v127;
    id v98 = (id)[MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D260] variant:1024];
    objc_msgSend(v97, "setFont:");

    id v99 = v127;
    id v100 = (id)[MEMORY[0x263F1C550] labelColor];
    objc_msgSend(v99, "setTextColor:");

    [v127 setText:v128];
    [v133 addSubview:v127];
    [(CPSInformationEntityViewController *)v136 setTitleLabel:v127];
    id v5 = (id)[v127 bottomAnchor];
    id v6 = v129;
    id v129 = v5;

    id v101 = v132;
    id v112 = (id)[v127 leadingAnchor];
    id v111 = (id)[v130 leadingAnchor];
    id v110 = (id)objc_msgSend(v112, "constraintEqualToAnchor:");
    v140[0] = v110;
    id v109 = (id)[v127 trailingAnchor];
    id v108 = (id)[v130 trailingAnchor];
    id v107 = (id)objc_msgSend(v109, "constraintLessThanOrEqualToAnchor:");
    v140[1] = v107;
    id v106 = (id)[v127 topAnchor];
    id v105 = (id)[v133 safeAreaLayoutGuide];
    id v104 = (id)[v105 topAnchor];
    id v103 = (id)objc_msgSend(v106, "constraintEqualToAnchor:");
    v140[2] = v103;
    id v102 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:3];
    objc_msgSend(v101, "addObjectsFromArray:");

    objc_storeStrong(&v127, 0);
  }
  else
  {
    id v96 = (id)[(CPSInformationEntityViewController *)v136 navigationItem];
    [v96 setTitle:v128];
  }
  id v126 = objc_alloc_init(MEMORY[0x263F1C778]);
  id v9 = (id)[(CPSInformationEntityViewController *)v136 view];
  [v9 addLayoutGuide:v126];

  [(CPSInformationEntityViewController *)v136 setCenteringGuide:v126];
  [(CPSInformationEntityViewController *)v136 _updateCenteringGuideConstraints];
  id v10 = (id)[v130 widthAnchor];
  id v125 = (id)[v10 constraintLessThanOrEqualToConstant:376.0];

  LODWORD(v7) = 1148846080;
  [v125 setPriority:v7];
  id v13 = (id)[v130 widthAnchor];
  id v12 = (id)[v133 safeAreaLayoutGuide];
  id v11 = (id)[v12 widthAnchor];
  id v124 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");

  LODWORD(v8) = 1144750080;
  [v124 setPriority:v8];
  id v14 = v132;
  id v48 = (id)[(CPSInformationScrollView *)v131 topAnchor];
  id v47 = (id)[v48 constraintEqualToAnchor:v129 constant:5.0];
  v139[0] = v47;
  id v46 = (id)[(CPSInformationScrollView *)v131 leadingAnchor];
  id v45 = (id)[v133 safeAreaLayoutGuide];
  id v44 = (id)[v45 leadingAnchor];
  id v43 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
  v139[1] = v43;
  id v42 = (id)[(CPSInformationScrollView *)v131 trailingAnchor];
  id v41 = (id)[v133 safeAreaLayoutGuide];
  id v40 = (id)[v41 trailingAnchor];
  id v39 = (id)objc_msgSend(v42, "constraintEqualToAnchor:");
  v139[2] = v39;
  id v38 = (id)[(CPSInformationScrollView *)v131 bottomAnchor];
  id v37 = (id)[v133 bottomAnchor];
  id v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
  v139[3] = v36;
  id v35 = (id)[v130 topAnchor];
  id v34 = (id)[(CPSInformationScrollView *)v131 contentLayoutGuide];
  id v33 = (id)[v34 topAnchor];
  id v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
  v139[4] = v32;
  id v31 = (id)[v130 bottomAnchor];
  id v30 = (id)[(CPSInformationScrollView *)v131 contentLayoutGuide];
  id v29 = (id)[v30 bottomAnchor];
  id v28 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
  v139[5] = v28;
  id v27 = (id)[v130 centerXAnchor];
  v26 = [(CPSInformationEntityViewController *)v136 centeringGuide];
  v25 = [(UILayoutGuide *)v26 centerXAnchor];
  id v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v139[6] = v24;
  id v23 = (id)[v130 leadingAnchor];
  v22 = [(CPSInformationEntityViewController *)v136 centeringGuide];
  v21 = [(UILayoutGuide *)v22 leadingAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", 12.0);
  v139[7] = v20;
  id v19 = (id)[v130 trailingAnchor];
  v18 = [(CPSInformationEntityViewController *)v136 centeringGuide];
  v17 = [(UILayoutGuide *)v18 trailingAnchor];
  id v16 = (id)objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:");
  v139[8] = v16;
  v139[9] = v124;
  v139[10] = v125;
  id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:11];
  objc_msgSend(v14, "addObjectsFromArray:");

  id v123 = objc_alloc_init(MEMORY[0x263F1CB98]);
  [v123 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v50 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v49 = (id)[v50 colorWithAlphaComponent:0.8];
  objc_msgSend(v123, "setBackgroundColor:");

  id v122 = (id)[MEMORY[0x263F1C558] colorEffectSaturate:1.5];
  id v121 = (id)[MEMORY[0x263F1C480] effectWithBlurRadius:10.0];
  id v51 = v123;
  v138[0] = v122;
  v138[1] = v121;
  id v52 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
  objc_msgSend(v51, "setBackgroundEffects:");

  [v133 addSubview:v123];
  [(CPSInformationEntityViewController *)v136 setVisualEffectView:v123];
  id v120 = +[CPSHairlineView grayHairlineViewAlongAxis:0];
  [v120 setHidden:1];
  [v133 addSubview:v120];
  [(CPSInformationEntityViewController *)v136 setHairlineView:v120];
  v53 = [CPSInformationTemplateButtonsViewController alloc];
  id v55 = [(CPSInformationEntityViewController *)v136 informationTemplate];
  id v54 = (id)[v55 actions];
  v119 = -[CPSInformationTemplateButtonsViewController initWithButtons:buttonDelegate:](v53, "initWithButtons:buttonDelegate:");

  id v56 = (id)[(CPSInformationTemplateButtonsViewController *)v119 view];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CPSInformationTemplateButtonsViewController *)v119 willMoveToParentViewController:v136];
  [(CPSInformationEntityViewController *)v136 addChildViewController:v119];
  id v57 = v133;
  id v58 = (id)[(CPSInformationTemplateButtonsViewController *)v119 view];
  objc_msgSend(v57, "addSubview:");

  [(CPSInformationTemplateButtonsViewController *)v119 didMoveToParentViewController:v136];
  [(CPSInformationEntityViewController *)v136 setButtonsViewController:v119];
  id v59 = v132;
  id v95 = (id)[(CPSInformationTemplateButtonsViewController *)v119 view];
  id v94 = (id)[v95 leadingAnchor];
  id v93 = (id)[v130 leadingAnchor];
  id v92 = (id)objc_msgSend(v94, "constraintEqualToAnchor:");
  v137[0] = v92;
  id v91 = (id)[(CPSInformationTemplateButtonsViewController *)v119 view];
  id v90 = (id)[v91 trailingAnchor];
  id v89 = (id)[v130 trailingAnchor];
  id v88 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
  v137[1] = v88;
  id v87 = (id)[(CPSInformationTemplateButtonsViewController *)v119 view];
  id v86 = (id)[v87 bottomAnchor];
  id v85 = (id)[v133 safeAreaLayoutGuide];
  id v84 = (id)[v85 bottomAnchor];
  id v83 = (id)objc_msgSend(v86, "constraintEqualToAnchor:constant:", -12.0);
  v137[2] = v83;
  id v82 = (id)[v123 topAnchor];
  id v81 = (id)[(CPSInformationTemplateButtonsViewController *)v119 view];
  id v80 = (id)[v81 topAnchor];
  id v79 = (id)objc_msgSend(v82, "constraintEqualToAnchor:constant:", -12.0);
  v137[3] = v79;
  id v78 = (id)[v123 bottomAnchor];
  id v77 = (id)[v133 bottomAnchor];
  id v76 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
  v137[4] = v76;
  id v75 = (id)[v123 leftAnchor];
  id v74 = (id)[v133 leftAnchor];
  id v73 = (id)objc_msgSend(v75, "constraintEqualToAnchor:");
  v137[5] = v73;
  id v72 = (id)[v123 rightAnchor];
  id v71 = (id)[v133 rightAnchor];
  id v70 = (id)objc_msgSend(v72, "constraintEqualToAnchor:");
  v137[6] = v70;
  id v69 = (id)[v120 bottomAnchor];
  id v68 = (id)[v123 topAnchor];
  id v67 = (id)objc_msgSend(v69, "constraintEqualToAnchor:");
  v137[7] = v67;
  id v66 = (id)[v120 leftAnchor];
  id v65 = (id)[v123 leftAnchor];
  id v64 = (id)objc_msgSend(v66, "constraintEqualToAnchor:");
  v137[8] = v64;
  id v63 = (id)[v120 rightAnchor];
  id v62 = (id)[v123 rightAnchor];
  id v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
  v137[9] = v61;
  id v60 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:10];
  objc_msgSend(v59, "addObjectsFromArray:");

  [(CPSInformationEntityViewController *)v136 _updateHairline];
  [MEMORY[0x263F08938] activateConstraints:v132];
  objc_storeStrong((id *)&v119, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v123, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(&v126, 0);
  objc_storeStrong(&v128, 0);
  objc_storeStrong(&v129, 0);
  objc_storeStrong(&v130, 0);
  objc_storeStrong((id *)&v131, 0);
  objc_storeStrong(&v132, 0);
  objc_storeStrong(&v133, 0);
}

- (void)didSelectButton:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  id v13 = CPSSafeProtocolCast_3(&unk_26DF78948, location[0]);
  if (v13)
  {
    id v3 = (id)[v13 identifier];
    id v4 = v14;
    id v14 = v3;
  }
  else
  {
    id v5 = objc_opt_class();
    id v12 = CPSSafeCast_19(v5, location[0]);
    id v6 = (id)[v12 identifier];
    id v7 = v14;
    id v14 = v6;

    objc_storeStrong(&v12, 0);
  }
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v16, (uint64_t)v14);
    _os_log_debug_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v17, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v9 = [(CPSBaseTemplateViewController *)v16 templateDelegate];
  char v10 = [(CPTemplateDelegate *)v9 conformsToProtocol:&unk_26DF72840];

  if (v10)
  {
    double v8 = [(CPSBaseTemplateViewController *)v16 templateDelegate];
    [(CPTemplateDelegate *)v8 handleActionForControlIdentifier:v14];
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  v14.receiver = v17;
  v14.super_class = (Class)CPSInformationEntityViewController;
  [(CPSBaseTemplateViewController *)&v14 setControl:location[0] enabled:a4];
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __57__CPSInformationEntityViewController_setControl_enabled___block_invoke;
  char v10 = &unk_2648A4828;
  id v11 = v17;
  id v12 = location[0];
  BOOL v13 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSInformationEntityViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) buttonsViewController];
  [v2 setButtonIdentifier:*(void *)(a1 + 40) enabled:*(unsigned char *)(a1 + 48) & 1];
}

- (void)_updateCenteringGuideConstraints
{
  v36[4] = *MEMORY[0x263EF8340];
  id v35 = self;
  v34[1] = (id)a2;
  id v29 = [(CPSInformationEntityViewController *)self centeringGuideConstraints];

  if (v29)
  {
    id v27 = (void *)MEMORY[0x263F08938];
    id v28 = [(CPSInformationEntityViewController *)v35 centeringGuideConstraints];
    objc_msgSend(v27, "deactivateConstraints:");
  }
  id v23 = (id)[(CPSInformationEntityViewController *)v35 view];
  id v22 = (id)[v23 safeAreaLayoutGuide];
  v34[0] = (id)[v22 leadingAnchor];

  id v25 = (id)[(CPSInformationEntityViewController *)v35 view];
  id v24 = (id)[v25 safeAreaLayoutGuide];
  id v33 = (id)[v24 trailingAnchor];

  v26 = [(CPSInformationEntityViewController *)v35 scrollView];
  id v32 = (id)[(CPSInformationScrollView *)v26 accessoryViewAtEdge:0];

  if (v32)
  {
    id v2 = (id)[v32 trailingAnchor];
    id v3 = v34[0];
    v34[0] = v2;
  }
  v21 = [(CPSInformationEntityViewController *)v35 scrollView];
  id v31 = (id)[(CPSInformationScrollView *)v21 accessoryViewAtEdge:1];

  if (v31)
  {
    id v4 = (id)[v31 leadingAnchor];
    id v5 = v33;
    id v33 = v4;
  }
  id v20 = [(CPSInformationEntityViewController *)v35 centeringGuide];
  id v19 = [(UILayoutGuide *)v20 leadingAnchor];
  id v18 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v19, "constraintEqualToAnchor:constant:", v34[0]);
  v36[0] = v18;
  v17 = [(CPSInformationEntityViewController *)v35 centeringGuide];
  id v16 = [(UILayoutGuide *)v17 trailingAnchor];
  id v15 = (id)[(NSLayoutXAxisAnchor *)v16 constraintEqualToAnchor:v33 constant:0.0];
  v36[1] = v15;
  objc_super v14 = [(CPSInformationEntityViewController *)v35 centeringGuide];
  BOOL v13 = [(UILayoutGuide *)v14 topAnchor];
  id v12 = (id)[(CPSInformationEntityViewController *)v35 view];
  id v11 = (id)[v12 safeAreaLayoutGuide];
  id v10 = (id)[v11 topAnchor];
  id v9 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v13, "constraintEqualToAnchor:");
  v36[2] = v9;
  int v8 = [(CPSInformationEntityViewController *)v35 centeringGuide];
  int v7 = [(UILayoutGuide *)v8 heightAnchor];
  uint64_t v6 = [(NSLayoutDimension *)v7 constraintEqualToConstant:1.0];
  v36[3] = v6;
  id v30 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];

  [(CPSInformationEntityViewController *)v35 setCenteringGuideConstraints:v30];
  [MEMORY[0x263F08938] activateConstraints:v30];
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(v34, 0);
}

- (void)_updateItemStackView
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v33 = self;
  SEL v32 = a2;
  memset(__b, 0, sizeof(__b));
  objc_super v14 = [(CPSInformationEntityViewController *)v33 itemStackView];
  obj = [(UIStackView *)v14 arrangedSubviews];

  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v34 count:16];
  if (v12)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v12;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v31 = *(id *)(__b[1] + 8 * v10);
      int v7 = [(CPSInformationEntityViewController *)v33 itemStackView];
      [(UIStackView *)v7 removeArrangedSubview:v31];

      [v31 removeFromSuperview];
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v6 = [(CPSInformationEntityViewController *)v33 informationTemplate];
  id v4 = (id)[v6 items];
  uint64_t v5 = [v4 count];

  id v29 = (void *)v5;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  v22[0] = 0;
  v22[1] = v22;
  int v23 = 838860800;
  int v24 = 48;
  id v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  id v3 = [(CPSInformationEntityViewController *)v33 informationTemplate];
  id v2 = (id)[v3 items];
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = __58__CPSInformationEntityViewController__updateItemStackView__block_invoke;
  id v19 = &unk_2648A56B8;
  id v20 = v33;
  v21[1] = v22;
  v21[2] = v29;
  v21[0] = v28;
  [v2 enumerateObjectsUsingBlock:&v15];

  [MEMORY[0x263F08938] activateConstraints:v28];
  objc_storeStrong(v21, 0);
  objc_storeStrong((id *)&v20, 0);
  _Block_object_dispose(v22, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
}

void __58__CPSInformationEntityViewController__updateItemStackView__block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  v125[4] = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  unint64_t v119 = a3;
  v118[2] = a4;
  v118[1] = (id)a1;
  v118[0] = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v117 = 0;
    id v95 = (id)[*(id *)(a1 + 32) informationTemplate];
    BOOL v96 = [v95 layout] == 1;

    BOOL v117 = v96;
    id v4 = [CPSRatingView alloc];
    uint64_t v5 = [(CPSRatingView *)v4 initWithInformationItem:location[0] layout:v96];
    id v6 = v118[0];
    v118[0] = v5;

    [v118[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v93 = (id)[*(id *)(a1 + 32) informationTemplate];
  BOOL v94 = [v93 layout] != 0;

  if (v94)
  {
    id v75 = (id)[location[0] title];
    char v108 = 0;
    BOOL v76 = 1;
    if (![v75 length])
    {
      id v109 = (id)[location[0] detail];
      char v108 = 1;
      BOOL v76 = 1;
      if (![v109 length]) {
        BOOL v76 = v118[0] != 0;
      }
    }
    if (v108) {

    }
    if (v76)
    {
      id v107 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [v107 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v106 = 0;
      id v105 = 0;
      id v74 = (id)[location[0] title];

      if (v74)
      {
        id v104 = objc_alloc_init(MEMORY[0x263F1C768]);
        [v104 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v104 setNumberOfLines:2];
        [v104 setAdjustsFontForContentSizeCategory:1];
        [v104 setIsAccessibilityElement:0];
        id v57 = (id)[location[0] title];
        objc_msgSend(v104, "setText:");

        id v103 = (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        [v104 setFont:v103];
        id v58 = v104;
        id v59 = (id)[MEMORY[0x263F1C550] _carSystemSecondaryColor];
        objc_msgSend(v58, "setTextColor:");

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v104);
        objc_storeStrong(&v106, v104);
        [v107 addSubview:v104];
        id v60 = *(void **)(a1 + 40);
        id v73 = (id)[v104 leadingAnchor];
        id v72 = (id)[v107 leadingAnchor];
        id v71 = (id)objc_msgSend(v73, "constraintEqualToAnchor:");
        v125[0] = v71;
        id v70 = (id)[v104 topAnchor];
        id v69 = (id)[v107 topAnchor];
        id v68 = (id)objc_msgSend(v70, "constraintEqualToAnchor:");
        v125[1] = v68;
        id v67 = (id)[v104 lastBaselineAnchor];
        id v66 = (id)[v107 bottomAnchor];
        id v65 = (id)objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:");
        v125[2] = v65;
        id v64 = (id)[v104 trailingAnchor];
        id v63 = (id)[v107 centerXAnchor];
        id v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
        v125[3] = v62;
        id v61 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:4];
        objc_msgSend(v60, "addObjectsFromArray:");

        objc_storeStrong(&v103, 0);
        objc_storeStrong(&v104, 0);
      }
      id v56 = (id)[location[0] detail];

      if (v56)
      {
        id v102 = objc_alloc_init(MEMORY[0x263F1C768]);
        [v102 setTranslatesAutoresizingMaskIntoConstraints:0];
        objc_msgSend(v102, "setNumberOfLines:");
        [v102 setAdjustsFontForContentSizeCategory:1];
        [v102 setIsAccessibilityElement:0];
        id v38 = (id)[*(id *)(a1 + 32) traitCollection];
        if ([v38 layoutDirection]) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = 2;
        }
        [v102 setTextAlignment:v7];

        id v39 = (id)[location[0] detail];
        objc_msgSend(v102, "setText:");

        id v101 = (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        [v102 setFont:v101];
        id v40 = v102;
        id v41 = (id)[MEMORY[0x263F1C550] labelColor];
        objc_msgSend(v40, "setTextColor:");

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v102);
        objc_storeStrong(&v105, v102);
        [v107 addSubview:v102];
        id v42 = *(void **)(a1 + 40);
        id v55 = (id)[v102 leadingAnchor];
        id v54 = (id)[v107 centerXAnchor];
        id v53 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
        v124[0] = v53;
        id v52 = (id)[v102 topAnchor];
        id v51 = (id)[v107 topAnchor];
        id v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
        v124[1] = v50;
        id v49 = (id)[v102 lastBaselineAnchor];
        id v48 = (id)[v107 bottomAnchor];
        id v47 = (id)objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:");
        v124[2] = v47;
        id v46 = (id)[v102 trailingAnchor];
        id v45 = (id)[v107 trailingAnchor];
        id v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
        v124[3] = v44;
        id v43 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v124 count:4];
        objc_msgSend(v42, "addObjectsFromArray:");

        objc_storeStrong(&v101, 0);
        objc_storeStrong(&v102, 0);
      }
      if (v118[0])
      {
        if (!v106 || v105)
        {
          if (v106 && v105)
          {
            id v19 = *(void **)(a1 + 40);
            id v29 = (id)[v118[0] topAnchor];
            id v28 = (id)[v106 bottomAnchor];
            id v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
            v122[0] = v27;
            id v26 = (id)[v118[0] leadingAnchor];
            id v25 = (id)[v107 leadingAnchor];
            id v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
            v122[1] = v24;
            id v23 = (id)[v118[0] bottomAnchor];
            id v22 = (id)[v107 bottomAnchor];
            id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
            v122[2] = v21;
            id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:3];
            objc_msgSend(v19, "addObjectsFromArray:");
          }
          else
          {
            unint64_t v11 = *(void **)(a1 + 40);
            id v18 = (id)[v118[0] centerYAnchor];
            id v17 = (id)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) centerYAnchor];
            id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
            v121[0] = v16;
            id v15 = (id)[v118[0] leadingAnchor];
            id v14 = (id)[v107 leadingAnchor];
            id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
            v121[1] = v13;
            id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:2];
            objc_msgSend(v11, "addObjectsFromArray:");
          }
        }
        else
        {
          id v30 = *(void **)(a1 + 40);
          id v37 = (id)[v118[0] centerYAnchor];
          id v36 = (id)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) centerYAnchor];
          id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
          v123[0] = v35;
          id v34 = (id)[v118[0] trailingAnchor];
          id v33 = (id)[v107 trailingAnchor];
          id v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
          v123[1] = v32;
          id v31 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v123 count:2];
          objc_msgSend(v30, "addObjectsFromArray:");
        }
        [v107 addSubview:v118[0]];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v107);
      id v10 = (id)[*(id *)(a1 + 32) itemStackView];
      [v10 addArrangedSubview:v107];

      if (v119 < *(void *)(a1 + 56) - 1)
      {
        id v8 = (id)[*(id *)(a1 + 32) itemStackView];
        [v8 setCustomSpacing:v107 afterView:10.0];

        id v100 = +[CPSHairlineView grayHairlineViewAlongAxis:0];
        id v9 = (id)[*(id *)(a1 + 32) itemStackView];
        [v9 addArrangedSubview:v100];

        objc_storeStrong(&v100, 0);
      }
      objc_storeStrong(&v105, 0);
      objc_storeStrong(&v106, 0);
      objc_storeStrong(&v107, 0);
    }
  }
  else
  {
    id v91 = (id)[location[0] title];
    char v115 = 0;
    BOOL v92 = 1;
    if (![v91 length])
    {
      id v116 = (id)[location[0] detail];
      char v115 = 1;
      BOOL v92 = 1;
      if (![v116 length]) {
        BOOL v92 = v118[0] != 0;
      }
    }
    if (v115) {

    }
    if (v92)
    {
      id v90 = (id)[location[0] title];

      if (v90)
      {
        id v114 = objc_alloc_init(MEMORY[0x263F1C768]);
        [v114 setNumberOfLines:2];
        [v114 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v114 setAdjustsFontForContentSizeCategory:1];
        [v114 setIsAccessibilityElement:0];
        id v86 = (id)[location[0] title];
        objc_msgSend(v114, "setText:");

        id v113 = (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        [v114 setFont:v113];
        id v87 = v114;
        id v88 = (id)[MEMORY[0x263F1C550] _carSystemSecondaryColor];
        objc_msgSend(v87, "setTextColor:");

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v114);
        id v89 = (id)[*(id *)(a1 + 32) itemStackView];
        [v89 addArrangedSubview:v114];

        objc_storeStrong(&v113, 0);
        objc_storeStrong(&v114, 0);
      }
      id v85 = (id)[location[0] detail];

      if (v85)
      {
        id v112 = objc_alloc_init(MEMORY[0x263F1C768]);
        [v112 setNumberOfLines:2];
        [v112 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v112 setAdjustsFontForContentSizeCategory:1];
        [v112 setIsAccessibilityElement:0];
        id v81 = (id)[location[0] detail];
        objc_msgSend(v112, "setText:");

        id v111 = (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        [v112 setFont:v111];
        id v82 = v112;
        id v83 = (id)[MEMORY[0x263F1C550] labelColor];
        objc_msgSend(v82, "setTextColor:");

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v112);
        id v84 = (id)[*(id *)(a1 + 32) itemStackView];
        [v84 addArrangedSubview:v112];

        objc_storeStrong(&v111, 0);
        objc_storeStrong(&v112, 0);
      }
      if (v118[0])
      {
        id v79 = (id)[*(id *)(a1 + 32) itemStackView];
        [v79 setCustomSpacing:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) afterView:8.0];

        id v80 = (id)[*(id *)(a1 + 32) itemStackView];
        [v80 addArrangedSubview:v118[0]];

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v118[0]);
      }
      if (v119 < *(void *)(a1 + 56) - 1)
      {
        id v77 = (id)[*(id *)(a1 + 32) itemStackView];
        [v77 setCustomSpacing:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) afterView:10.0];

        id v110 = +[CPSHairlineView grayHairlineViewAlongAxis:0];
        id v78 = (id)[*(id *)(a1 + 32) itemStackView];
        [v78 addArrangedSubview:v110];

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v110);
        objc_storeStrong(&v110, 0);
      }
    }
  }
  objc_storeStrong(v118, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateHairline
{
  id v20 = (id)[(CPSInformationEntityViewController *)self view];
  id v19 = [(CPSInformationEntityViewController *)self itemStackView];
  [(UIStackView *)v19 bounds];
  double v29 = v2;
  double v30 = v3;
  double v31 = v4;
  double v32 = v5;
  id v18 = [(CPSInformationEntityViewController *)self itemStackView];
  objc_msgSend(v20, "convertRect:fromView:", v29, v30, v31, v32);
  v33.origin.x = v6;
  v33.origin.y = v7;
  v33.size.width = v8;
  v33.size.height = v9;

  id v23 = (id)[(CPSInformationEntityViewController *)self view];
  id v22 = [(CPSInformationEntityViewController *)self visualEffectView];
  [(UIVisualEffectView *)v22 bounds];
  double v24 = v10;
  double v25 = v11;
  double v26 = v12;
  double v27 = v13;
  id v21 = [(CPSInformationEntityViewController *)self visualEffectView];
  objc_msgSend(v23, "convertRect:fromView:", v24, v25, v26, v27);
  rect2.origin.x = v14;
  rect2.origin.y = v15;
  rect2.size.width = v16;
  rect2.size.height = v17;

  [(CPSInformationEntityViewController *)self _setHairlineHidden:!CGRectIntersectsRect(v33, rect2)];
}

- (void)_setHairlineHidden:(BOOL)a3
{
  CGRect v33 = self;
  SEL v32 = a2;
  BOOL v31 = a3;
  id v30 = [(CPSInformationEntityViewController *)self hairlineView];
  if (!v31 || ([v30 isHidden] & 1) != 0)
  {
    if (!v31 && ([v30 isHidden] & 1) != 0)
    {
      [v30 setHidden:v31];
      [v30 setAlpha:0.0];
      CGFloat v7 = (void *)MEMORY[0x263F1CB60];
      uint64_t v11 = MEMORY[0x263EF8330];
      int v12 = -1073741824;
      int v13 = 0;
      CGFloat v14 = __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_3;
      CGFloat v15 = &unk_2648A3BE0;
      id v16 = v30;
      [v7 animateWithDuration:&v11 animations:&__block_literal_global_15 completion:0.25];
      objc_storeStrong(&v16, 0);
    }
  }
  else
  {
    [v30 setHidden:v31];
    id v29 = +[CPSHairlineView grayHairlineViewAlongAxis:0];
    id v8 = (id)[(CPSInformationEntityViewController *)v33 view];
    [v8 addSubview:v29];

    id v9 = v29;
    [v30 frame];
    v28[1] = v3;
    v28[2] = v4;
    v28[3] = v5;
    v28[4] = v6;
    objc_msgSend(v9, "setFrame:", *(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
    [v29 setAlpha:1.0];
    double v10 = (void *)MEMORY[0x263F1CB60];
    uint64_t v23 = MEMORY[0x263EF8330];
    int v24 = -1073741824;
    int v25 = 0;
    double v26 = __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke;
    double v27 = &unk_2648A3BE0;
    v28[0] = v29;
    uint64_t v17 = MEMORY[0x263EF8330];
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_2;
    id v21 = &unk_2648A3B90;
    id v22 = v29;
    [v10 animateWithDuration:&v23 animations:&v17 completion:0.25];
    objc_storeStrong(&v22, 0);
    objc_storeStrong(v28, 0);
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v30, 0);
}

uint64_t __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

uint64_t __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __57__CPSInformationEntityViewController__setHairlineHidden___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

- (void)scrollViewContentSizeChanged:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v27 = [(CPSInformationEntityViewController *)v58 scrollView];
  [(CPSInformationScrollView *)v27 bounds];
  CGRect v55 = v61;
  double Height = CGRectGetHeight(v61);
  [location[0] contentInset];
  uint64_t v51 = v3;
  uint64_t v52 = v4;
  double v53 = v5;
  uint64_t v54 = v6;
  double v28 = Height - v5;
  [location[0] contentInset];
  double v47 = v7;
  uint64_t v48 = v8;
  uint64_t v49 = v9;
  uint64_t v50 = v10;
  double v29 = v28 - v7;

  double v56 = v29;
  id v30 = [(CPSInformationEntityViewController *)v58 scrollView];
  [(CPSInformationScrollView *)v30 contentSize];
  uint64_t v44 = v11;
  double v45 = v12;
  double v31 = v12;

  double v46 = v31;
  BOOL v43 = v31 > v29;
  memset(__b, 0, sizeof(__b));
  SEL v32 = [(CPSInformationEntityViewController *)v58 scrollView];
  obj = [(CPSInformationScrollView *)v32 focusWaypoints];

  uint64_t v34 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v59 count:16];
  if (v34)
  {
    uint64_t v23 = *(void *)__b[2];
    uint64_t v24 = 0;
    unint64_t v25 = v34;
    while (1)
    {
      uint64_t v22 = v24;
      if (*(void *)__b[2] != v23) {
        objc_enumerationMutation(obj);
      }
      id v42 = *(id *)(__b[1] + 8 * v24);
      [v42 removeFromSuperview];
      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v59 count:16];
        if (!v25) {
          break;
        }
      }
    }
  }

  id v21 = (id)objc_opt_new();
  id v20 = [(CPSInformationEntityViewController *)v58 scrollView];
  [(CPSInformationScrollView *)v20 setFocusWaypoints:v21];

  if (v43)
  {
    double v40 = v56;
    id v39 = [(CPSInformationEntityViewController *)v58 itemStackView];
    double v38 = 0.0;
    do
    {
      if (v38 > v46) {
        break;
      }
      int v13 = [CPSInformationTemplateFocusableView alloc];
      id v37 = -[CPSInformationTemplateFocusableView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      CGRectMake_6();
      objc_msgSend(v37, "setFrame:", v14, v15, v16, v17);
      [v39 addSubview:v37];
      int v19 = [(CPSInformationEntityViewController *)v58 scrollView];
      int v18 = [(CPSInformationScrollView *)v19 focusWaypoints];
      [(NSMutableArray *)v18 addObject:v37];

      BOOL v36 = vabdd_f64(v38, v46) < 0.00000011920929;
      double v38 = CGFloatMin(v38 + v40, v46);
      int v35 = v36 ? 5 : 0;
      objc_storeStrong(&v37, 0);
    }
    while (!v35);
    objc_storeStrong(&v39, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSInformationEntityViewController *)v4 _updateHairline];
  objc_storeStrong(location, 0);
}

- (void)_scrollViewAccessoryInsetsDidChange:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSInformationEntityViewController *)v4 _updateCenteringGuideConstraints];
  [(CPSInformationEntityViewController *)v4 _updateScrollViewInsets];
  objc_storeStrong(location, 0);
}

- (void)_updateScrollViewInsets
{
  id v7 = (id)[(CPSInformationEntityViewController *)self view];
  id v6 = (id)[v7 safeAreaLayoutGuide];
  [v6 layoutFrame];

  uint64_t v10 = [(CPSInformationEntityViewController *)self visualEffectView];
  [(UIVisualEffectView *)v10 frame];
  id v9 = (id)[(CPSInformationEntityViewController *)self view];
  id v8 = (id)[v9 safeAreaLayoutGuide];
  [v8 layoutFrame];

  id v11 = (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  [v11 descender];
  UIEdgeInsetsMake_3();
  double v13 = v2;
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;

  double v12 = [(CPSInformationEntityViewController *)self scrollView];
  -[CPSInformationScrollView setContentInset:](v12, "setContentInset:", v13, v14, v15, v16);
}

- (CPSInformationTemplateButtonsViewController)buttonsViewController
{
  return self->_buttonsViewController;
}

- (void)setButtonsViewController:(id)a3
{
}

- (CPSInformationScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIStackView)itemStackView
{
  return self->_itemStackView;
}

- (void)setItemStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)centeringGuideConstraints
{
  return self->_centeringGuideConstraints;
}

- (void)setCenteringGuideConstraints:(id)a3
{
}

- (UILayoutGuide)centeringGuide
{
  return self->_centeringGuide;
}

- (void)setCenteringGuide:(id)a3
{
}

- (NSLayoutConstraint)itemStackViewLeadingConstraint
{
  return self->_itemStackViewLeadingConstraint;
}

- (void)setItemStackViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)itemStackViewWidthConstraint
{
  return self->_itemStackViewWidthConstraint;
}

- (void)setItemStackViewWidthConstraint:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (CPSHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end