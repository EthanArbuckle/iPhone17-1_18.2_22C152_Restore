@interface CPSPagingTripPreviewsCardView
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showMoreRoutes;
- (CPSAlternateRoutesView)alternateRoutesView;
- (CPSPagingControlView)pageControl;
- (CPSPagingTripPreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5;
- (CPSRouteOverviewView)overviewView;
- (NSLayoutConstraint)alternateRoutesHeightConstraint;
- (NSLayoutConstraint)contentBottomConstraint;
- (NSLayoutConstraint)contentTopConstraint;
- (NSLayoutConstraint)toggleRoutesButtonHeightConstraint;
- (NSMutableDictionary)estimatesForTripIdentifiers;
- (UIButton)moreRoutesButton;
- (id)_linearFocusItems;
- (id)preferredFocusEnvironments;
- (void)_setOverviewCollapsed:(BOOL)a3;
- (void)_toggleMoreRoutesButtonPressed:(id)a3;
- (void)_updateButtonColors;
- (void)alternateRoutesView:(id)a3 didSelectRouteChoice:(id)a4;
- (void)pagingControlView:(id)a3 didSelectPageIndex:(unint64_t)a4;
- (void)setAlternateRoutesHeightConstraint:(id)a3;
- (void)setContentBottomConstraint:(id)a3;
- (void)setContentTopConstraint:(id)a3;
- (void)setSelectedRouteChoice:(id)a3;
- (void)setSelectedTrip:(id)a3;
- (void)setShowMoreRoutes:(BOOL)a3;
- (void)setToggleRoutesButtonHeightConstraint:(id)a3;
- (void)updateEstimates:(id)a3 forTripIdentifier:(id)a4;
@end

@implementation CPSPagingTripPreviewsCardView

- (CPSPagingTripPreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5
{
  v160[3] = *MEMORY[0x263EF8340];
  id v149 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v147 = 0;
  objc_storeStrong(&v147, a4);
  id v146 = 0;
  objc_storeStrong(&v146, a5);
  id v5 = v149;
  id v149 = 0;
  v145.receiver = v5;
  v145.super_class = (Class)CPSPagingTripPreviewsCardView;
  id v149 = [(CPSTripPreviewsCardView *)&v145 initWithTripDelegate:location[0] trips:v147 textConfiguration:v146];
  objc_storeStrong(&v149, v149);
  if (v149)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = (void *)*((void *)v149 + 60);
    *((void *)v149 + 60) = v6;

    id v127 = (id)[v149 containerView];
    id v144 = (id)[v127 topAnchor];

    if ((unint64_t)[v147 count] > 1)
    {
      id v143 = objc_alloc_init(CPSPagingControlView);
      objc_msgSend(v143, "setPageCount:", objc_msgSend(v147, "count"));
      [v143 setPagingDelegate:v149];
      id v115 = (id)[v149 containerView];
      [v115 addSubview:v143];

      objc_storeStrong((id *)v149 + 61, v143);
      id v116 = (id)[v143 topAnchor];
      id v142 = (id)[v116 constraintEqualToAnchor:v144 constant:6.0];

      v117 = (void *)MEMORY[0x263F08938];
      v160[0] = v142;
      id v126 = (id)[v143 leadingAnchor];
      id v125 = (id)[v149 containerView];
      id v124 = (id)[v125 leadingAnchor];
      id v123 = (id)objc_msgSend(v126, "constraintEqualToAnchor:");
      v160[1] = v123;
      id v122 = (id)[v143 trailingAnchor];
      id v121 = (id)[v149 containerView];
      id v120 = (id)[v121 trailingAnchor];
      id v119 = (id)objc_msgSend(v122, "constraintEqualToAnchor:");
      v160[2] = v119;
      id v118 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v160 count:3];
      objc_msgSend(v117, "activateConstraints:");

      [v149 setContentTopConstraint:v142];
      id v8 = (id)[v143 bottomAnchor];
      id v9 = v144;
      id v144 = v8;

      objc_storeStrong(&v142, 0);
      objc_storeStrong(&v143, 0);
    }
    id v141 = objc_alloc_init(CPSRouteOverviewView);
    objc_storeStrong((id *)v149 + 62, v141);
    id v110 = (id)[v149 containerView];
    [v110 addSubview:v141];

    id v113 = (id)[v141 topAnchor];
    id v111 = v144;
    id v112 = (id)[v149 pageControl];
    id v140 = (id)[v113 constraintEqualToAnchor:v111 constant:0.0];

    id v10 = (id)[v149 contentTopConstraint];
    BOOL v114 = v10 != 0;

    if (!v114) {
      [v149 setContentTopConstraint:v140];
    }
    v81 = (void *)MEMORY[0x263F08938];
    id v90 = (id)[v141 leadingAnchor];
    id v89 = (id)[v149 containerView];
    id v88 = (id)[v89 leadingAnchor];
    id v87 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
    v159[0] = v87;
    id v86 = (id)[v141 trailingAnchor];
    id v85 = (id)[v149 containerView];
    id v84 = (id)[v85 trailingAnchor];
    id v83 = (id)objc_msgSend(v86, "constraintEqualToAnchor:");
    v159[1] = v83;
    v159[2] = v140;
    id v82 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v159);
    objc_msgSend(v81, "activateConstraints:");

    id v11 = (id)[v141 bottomAnchor];
    id v12 = v144;
    id v144 = v11;

    id v139 = objc_alloc_init(CPSAlternateRoutesView);
    [v139 setSelectionDelegate:v149];
    objc_storeStrong((id *)v149 + 63, v139);
    [v139 setClipsToBounds:1];
    id v91 = (id)[v149 containerView];
    [v91 addSubview:v139];

    id v92 = v149;
    id v94 = (id)[v139 heightAnchor];
    id v93 = (id)[v94 constraintEqualToConstant:0.0];
    objc_msgSend(v92, "setAlternateRoutesHeightConstraint:");

    v95 = (void *)MEMORY[0x263F08938];
    id v105 = (id)[v139 leadingAnchor];
    id v104 = (id)[v149 containerView];
    id v103 = (id)[v104 leadingAnchor];
    id v102 = (id)objc_msgSend(v105, "constraintEqualToAnchor:");
    v158[0] = v102;
    id v101 = (id)[v139 trailingAnchor];
    id v100 = (id)[v149 containerView];
    id v99 = (id)[v100 trailingAnchor];
    id v98 = (id)objc_msgSend(v101, "constraintEqualToAnchor:");
    v158[1] = v98;
    id v97 = (id)[v149 alternateRoutesHeightConstraint];
    v158[2] = v97;
    id v96 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:3];
    objc_msgSend(v95, "activateConstraints:");

    id v106 = v144;
    id v107 = (id)[v139 topAnchor];
    id v138 = (id)objc_msgSend(v106, "constraintEqualToAnchor:");

    [v149 setContentBottomConstraint:v138];
    [v149 addConstraint:v138];
    id v13 = (id)[v139 bottomAnchor];
    id v14 = v144;
    id v144 = v13;

    id v137 = (id)[MEMORY[0x263F1C488] buttonWithType:0];
    [v137 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [v137 setContentHuggingPriority:1 forAxis:v15];
    id v108 = (id)[v149 textConfiguration];
    id v109 = (id)[v108 additionalRoutesButtonTitle];
    char v134 = 0;
    if (v109)
    {
      id v16 = v109;
    }
    else
    {
      id v135 = CPSLocalizedStringForKey(@"MORE_ROUTES");
      char v134 = 1;
      id v16 = v135;
    }
    id v136 = v16;
    if (v134) {

    }
    id v133 = (id)[MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D340]];
    id v22 = objc_alloc(MEMORY[0x263F086A0]);
    id v21 = v136;
    v29 = (void *)MEMORY[0x263F1C238];
    v156[0] = *MEMORY[0x263F1C238];
    v157[0] = v133;
    v30 = (void *)MEMORY[0x263F1C240];
    v156[1] = *MEMORY[0x263F1C240];
    id v24 = (id)[MEMORY[0x263F1C550] systemCyanColor];
    v157[1] = v24;
    id v23 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v157, v156);
    id v132 = (id)objc_msgSend(v22, "initWithString:attributes:", v21);

    objc_msgSend(v137, "setAttributedTitle:forState:", v132);
    id v26 = objc_alloc(MEMORY[0x263F086A0]);
    id v25 = v136;
    v154[0] = *v29;
    v155[0] = v133;
    v154[1] = *v30;
    id v28 = (id)[MEMORY[0x263F1C550] labelColor];
    v155[1] = v28;
    id v27 = (id)[NSDictionary dictionaryWithObjects:v155 forKeys:v154 count:2];
    id v131 = (id)objc_msgSend(v26, "initWithString:attributes:", v25);

    [v137 setAttributedTitle:v131 forState:8];
    id v32 = objc_alloc(MEMORY[0x263F086A0]);
    id v31 = v136;
    v152[0] = *v29;
    v153[0] = v133;
    v152[1] = *v30;
    id v34 = (id)[MEMORY[0x263F1C550] labelColor];
    v153[1] = v34;
    id v33 = (id)[NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:2];
    id v130 = (id)objc_msgSend(v32, "initWithString:attributes:", v31);

    [v137 setAttributedTitle:v130 forState:1];
    [v137 setContentHorizontalAlignment:0];
    [v137 setOpaque:1];
    [v137 addTarget:v149 action:sel__toggleMoreRoutesButtonPressed_ forControlEvents:0x2000];
    objc_storeStrong((id *)v149 + 64, v137);
    id v35 = (id)[v149 containerView];
    [v35 addSubview:*((void *)v149 + 64)];

    [*((id *)v149 + 64) setClipsToBounds:1];
    id v36 = v149;
    id v38 = (id)[*((id *)v149 + 64) heightAnchor];
    id v37 = (id)objc_msgSend(v38, "constraintEqualToConstant:");
    objc_msgSend(v36, "setToggleRoutesButtonHeightConstraint:");

    v39 = (void *)MEMORY[0x263F08938];
    id v51 = (id)[*((id *)v149 + 64) leadingAnchor];
    id v50 = (id)[v149 containerView];
    id v49 = (id)[v50 leadingAnchor];
    id v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
    v151[0] = v48;
    id v47 = (id)[*((id *)v149 + 64) trailingAnchor];
    id v46 = (id)[v149 containerView];
    id v45 = (id)[v46 trailingAnchor];
    id v44 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
    v151[1] = v44;
    id v43 = (id)[*((id *)v149 + 64) topAnchor];
    id v42 = (id)objc_msgSend(v43, "constraintEqualToAnchor:constant:", v144);
    v151[2] = v42;
    id v41 = (id)[v149 toggleRoutesButtonHeightConstraint];
    v151[3] = v41;
    id v40 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:4];
    objc_msgSend(v39, "activateConstraints:");

    id v52 = (id)[*((id *)v149 + 64) layer];
    [v52 setCornerRadius:6.0];

    id v53 = (id)[*((id *)v149 + 64) layer];
    [v53 setCornerCurve:*MEMORY[0x263F15A20]];

    [*((id *)v149 + 64) setClipsToBounds:1];
    id v17 = (id)[*((id *)v149 + 64) bottomAnchor];
    id v18 = v144;
    id v144 = v17;

    [v149 setupGoButton];
    id v55 = (id)[v149 containerView];
    id v54 = (id)[v149 goButton];
    objc_msgSend(v55, "addSubview:");

    v56 = (void *)MEMORY[0x263F08938];
    id v78 = (id)[v149 goButton];
    id v77 = (id)[v78 leadingAnchor];
    id v76 = (id)[v149 containerView];
    id v75 = (id)[v76 leadingAnchor];
    id v74 = (id)objc_msgSend(v77, "constraintEqualToAnchor:");
    v150[0] = v74;
    id v73 = (id)[v149 goButton];
    id v72 = (id)[v73 trailingAnchor];
    id v71 = (id)[v149 containerView];
    id v70 = (id)[v71 trailingAnchor];
    id v69 = (id)objc_msgSend(v72, "constraintEqualToAnchor:");
    v150[1] = v69;
    id v68 = (id)[v149 goButton];
    id v67 = (id)[v68 topAnchor];
    id v66 = (id)[v67 constraintEqualToAnchor:v144 constant:2.0];
    v150[2] = v66;
    id v65 = (id)[v149 goButton];
    id v64 = (id)[v65 heightAnchor];
    id v63 = (id)[v64 constraintEqualToConstant:29.0];
    v150[3] = v63;
    id v62 = (id)[v149 goButton];
    id v61 = (id)[v62 bottomAnchor];
    id v60 = (id)[v149 containerView];
    id v59 = (id)[v60 bottomAnchor];
    id v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v150[4] = v58;
    id v57 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:5];
    objc_msgSend(v56, "activateConstraints:");

    [v149 _updateButtonColors];
    id v79 = v149;
    id v80 = (id)[v147 firstObject];
    objc_msgSend(v79, "setSelectedTrip:");

    objc_storeStrong(&v130, 0);
    objc_storeStrong(&v131, 0);
    objc_storeStrong(&v132, 0);
    objc_storeStrong(&v133, 0);
    objc_storeStrong(&v136, 0);
    objc_storeStrong(&v137, 0);
    objc_storeStrong(&v138, 0);
    objc_storeStrong(&v139, 0);
    objc_storeStrong(&v140, 0);
    objc_storeStrong(&v141, 0);
    objc_storeStrong(&v144, 0);
  }
  v20 = (CPSPagingTripPreviewsCardView *)v149;
  objc_storeStrong(&v146, 0);
  objc_storeStrong(&v147, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v149, 0);
  return v20;
}

- (void)_updateButtonColors
{
  id v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)CPSPagingTripPreviewsCardView;
  [(CPSTripPreviewsCardView *)&v10 _updateButtonColors];
  v3 = [(CPSPagingTripPreviewsCardView *)v12 moreRoutesButton];
  id v2 = (id)[MEMORY[0x263F1C550] systemCyanColor];
  -[UIButton cps_setBackgroundColor:forState:](v3, "cps_setBackgroundColor:forState:");

  id v6 = [(CPSPagingTripPreviewsCardView *)v12 moreRoutesButton];
  id v5 = (id)[MEMORY[0x263F1C550] systemCyanColor];
  id v4 = (id)[v5 colorWithAlphaComponent:0.12];
  -[UIButton cps_setBackgroundColor:forState:](v6, "cps_setBackgroundColor:forState:");

  id v9 = [(CPSPagingTripPreviewsCardView *)v12 moreRoutesButton];
  id v8 = (id)[MEMORY[0x263F1C550] systemCyanColor];
  id v7 = (id)[v8 colorWithAlphaComponent:0.8];
  -[UIButton cps_setBackgroundColor:forState:](v9, "cps_setBackgroundColor:forState:");
}

- (void)setSelectedTrip:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28.receiver = v30;
  v28.super_class = (Class)CPSPagingTripPreviewsCardView;
  [(CPSTripPreviewsCardView *)&v28 setSelectedTrip:location[0]];
  id v22 = [(CPSPagingTripPreviewsCardView *)v30 pageControl];
  id v21 = [(CPSTripPreviewsCardView *)v30 trips];
  [(CPSPagingControlView *)v22 setPageIndex:[(NSArray *)v21 indexOfObject:location[0]]];

  id v23 = [(CPSPagingTripPreviewsCardView *)v30 overviewView];
  [(CPSRouteOverviewView *)v23 setRepresentedTrip:location[0]];

  id v27 = (id)[location[0] routeChoices];
  id v26 = 0;
  id v25 = [(CPSPagingTripPreviewsCardView *)v30 alternateRoutesView];
  if ((unint64_t)[v27 count] <= 1)
  {
    SEL v11 = [(CPSPagingTripPreviewsCardView *)v30 moreRoutesButton];
    [(UIButton *)v11 setHidden:1];

    [v25 setHidden:1];
    double v15 = [(CPSPagingTripPreviewsCardView *)v30 overviewView];
    id v14 = (id)[(CPSRouteOverviewView *)v15 bottomAnchor];
    id v13 = [(CPSTripPreviewsCardView *)v30 goButton];
    id v12 = (id)[(UIButton *)v13 topAnchor];
    id v5 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    id v6 = v26;
    id v26 = v5;
  }
  else
  {
    id v16 = [(CPSPagingTripPreviewsCardView *)v30 moreRoutesButton];
    [(UIButton *)v16 setHidden:0];

    [v25 setHidden:0];
    [v25 setIndexForSelectedRoute:0];
    id v17 = (id)[location[0] routeChoices];
    objc_msgSend(v25, "setAvailableRouteChoices:");

    v20 = [(CPSPagingTripPreviewsCardView *)v30 overviewView];
    id v19 = (id)[(CPSRouteOverviewView *)v20 bottomAnchor];
    id v18 = (id)[v25 topAnchor];
    id v3 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    id v4 = v26;
    id v26 = v3;
  }
  id v8 = [(CPSPagingTripPreviewsCardView *)v30 contentBottomConstraint];
  [(NSLayoutConstraint *)v8 setActive:0];

  [(CPSPagingTripPreviewsCardView *)v30 setContentBottomConstraint:v26];
  [(CPSPagingTripPreviewsCardView *)v30 addConstraint:v26];
  objc_super v10 = [(CPSPagingTripPreviewsCardView *)v30 estimatesForTripIdentifiers];
  id v9 = (id)[location[0] identifier];
  id v24 = (id)-[NSMutableDictionary objectForKey:](v10, "objectForKey:");

  if (v24)
  {
    id v7 = [(CPSPagingTripPreviewsCardView *)v30 overviewView];
    [(CPSRouteOverviewView *)v7 setCurrentTravelEstimates:v24];
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_setOverviewCollapsed:(BOOL)a3
{
  id v61 = self;
  SEL v60 = a2;
  BOOL v59 = a3;
  double v58 = 0.0;
  double v57 = 0.0;
  double v56 = 0.0;
  id v55 = 0;
  double v54 = 0.0;
  id v53 = [(CPSPagingTripPreviewsCardView *)self alternateRoutesView];
  if (v59)
  {
    id v23 = [(CPSPagingTripPreviewsCardView *)v61 overviewView];
    [(CPSRouteOverviewView *)v23 frame];
    v52[9] = v3;
    v52[10] = v4;
    v52[11] = v5;
    v52[12] = v6;
    double MaxY = UIRectGetMaxY(*(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
    [(CPSPagingTripPreviewsCardView *)v61 bounds];
    v52[5] = v7;
    v52[6] = v8;
    v52[7] = v9;
    v52[8] = v10;
    double v25 = MaxY - UIRectGetMinY(*(double *)&v7, *(double *)&v8);

    v52[13] = *(id *)&v25;
    id v26 = [(CPSPagingTripPreviewsCardView *)v61 contentTopConstraint];
    [(NSLayoutConstraint *)v26 constant];
    double v58 = v11 - v25;

    double v57 = v25 + 1.0;
    id v27 = [(CPSPagingTripPreviewsCardView *)v61 toggleRoutesButtonHeightConstraint];
    [(NSLayoutConstraint *)v27 constant];
    double v54 = v12;

    double v56 = v25 + 1.0;
    id v55 = 0;
    v29 = [(CPSPagingTripPreviewsCardView *)v61 pageControl];
    objc_super v28 = [(CPSPagingControlView *)v29 previousButton];
    [(UIButton *)v28 setEnabled:0];

    id v31 = [(CPSPagingTripPreviewsCardView *)v61 pageControl];
    v30 = [(CPSPagingControlView *)v31 nextButton];
    [(UIButton *)v30 setEnabled:0];
  }
  else
  {
    id v13 = [(CPSPagingTripPreviewsCardView *)v61 pageControl];
    double v14 = 6.0;
    if (!v13) {
      double v14 = 0.0;
    }
    double v58 = v14;

    double v57 = 0.0;
    double v56 = 0.0;
    [(CPSAlternateRoutesView *)v53 bounds];
    v52[1] = v15;
    v52[2] = v16;
    v52[3] = v17;
    v52[4] = v18;
    id v55 = v18;
    id v22 = [(CPSPagingTripPreviewsCardView *)v61 pageControl];
    [(CPSPagingControlView *)v22 enablePageControlsIfNecessary];

    v52[0] = [(CPSPagingTripPreviewsCardView *)v61 moreRoutesButton];
    [v52[0] setEnabled:1];
    double v54 = 29.0;
    objc_storeStrong(v52, 0);
  }
  id v19 = [(CPSAlternateRoutesView *)v53 bottomConstraint];
  [(NSLayoutConstraint *)v19 setConstant:v56];

  [(CPSPagingTripPreviewsCardView *)v61 layoutIfNeeded];
  v20 = (void *)MEMORY[0x263F1CB60];
  uint64_t v45 = MEMORY[0x263EF8330];
  int v46 = -1073741824;
  int v47 = 0;
  id v48 = __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke;
  id v49 = &unk_2648A57C8;
  id v50 = v61;
  v51[1] = *(id *)&v58;
  v51[2] = *(id *)&v57;
  v51[0] = v53;
  v51[3] = v55;
  v51[4] = *(id *)&v54;
  uint64_t v39 = MEMORY[0x263EF8330];
  int v40 = -1073741824;
  int v41 = 0;
  id v42 = __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_2;
  id v43 = &unk_2648A3B90;
  id v44 = v61;
  [v20 animateWithDuration:&v45 animations:&v39 completion:0.3];
  id v21 = (void *)MEMORY[0x263F1CB60];
  uint64_t v32 = MEMORY[0x263EF8330];
  int v33 = -1073741824;
  int v34 = 0;
  id v35 = __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_3;
  id v36 = &unk_2648A4748;
  BOOL v38 = v59;
  id v37 = v61;
  [v21 performWithoutAnimation:&v32];
  objc_storeStrong((id *)&v37, 0);
  objc_storeStrong((id *)&v44, 0);
  objc_storeStrong(v51, 0);
  objc_storeStrong((id *)&v50, 0);
  objc_storeStrong((id *)&v53, 0);
}

uint64_t __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) contentTopConstraint];
  [v2 setConstant:*(double *)(a1 + 48)];

  id v3 = (id)[*(id *)(a1 + 32) alternateRoutesHeightConstraint];
  [v3 setConstant:*(double *)(a1 + 56)];

  id v4 = (id)[*(id *)(a1 + 40) bottomConstraint];
  [v4 setConstant:*(double *)(a1 + 64)];

  id v5 = (id)[*(id *)(a1 + 32) toggleRoutesButtonHeightConstraint];
  [v5 setConstant:*(double *)(a1 + 72)];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_3(uint64_t a1)
{
  v35[2] = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = 0;
  if (*(unsigned char *)(a1 + 40))
  {
    id v17 = (id)[*(id *)(a1 + 32) textConfiguration];
    id v18 = (id)[v17 overviewButtonTitle];
    char v27 = 0;
    if (v18)
    {
      objc_storeStrong(location, v18);
    }
    else
    {
      id v28 = CPSLocalizedStringForKey(@"OVERVIEW");
      char v27 = 1;
      objc_storeStrong(location, v28);
    }
    if (v27) {
  }
    }
  else
  {
    id v15 = (id)[*(id *)(a1 + 32) textConfiguration];
    id v16 = (id)[v15 additionalRoutesButtonTitle];
    char v25 = 0;
    if (v16)
    {
      objc_storeStrong(location, v16);
    }
    else
    {
      id v26 = CPSLocalizedStringForKey(@"MORE_ROUTES");
      char v25 = 1;
      objc_storeStrong(location, v26);
    }
    if (v25) {
  }
    }
  id v24 = (id)[*(id *)(a1 + 32) moreRoutesButton];
  id v23 = (id)[MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D340]];
  id v2 = objc_alloc(MEMORY[0x263F086A0]);
  id v1 = location[0];
  id v9 = (void *)MEMORY[0x263F1C238];
  v34[0] = *MEMORY[0x263F1C238];
  v35[0] = v23;
  objc_super v10 = (void *)MEMORY[0x263F1C240];
  v34[1] = *MEMORY[0x263F1C240];
  id v4 = (id)[MEMORY[0x263F1C550] systemCyanColor];
  v35[1] = v4;
  id v3 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34);
  id v22 = (id)objc_msgSend(v2, "initWithString:attributes:", v1);

  [v24 setAttributedTitle:v22 forState:0];
  id v6 = objc_alloc(MEMORY[0x263F086A0]);
  id v5 = location[0];
  v32[0] = *v9;
  v33[0] = v23;
  v32[1] = *v10;
  id v8 = (id)[MEMORY[0x263F1C550] labelColor];
  v33[1] = v8;
  id v7 = (id)[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v21 = (id)objc_msgSend(v6, "initWithString:attributes:", v5);

  [v24 setAttributedTitle:v21 forState:8];
  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  id v11 = location[0];
  v30[0] = *v9;
  v31[0] = v23;
  v30[1] = *v10;
  id v14 = (id)[MEMORY[0x263F1C550] labelColor];
  v31[1] = v14;
  id v13 = (id)[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v20 = (id)objc_msgSend(v12, "initWithString:attributes:", v11);

  [v24 setAttributedTitle:v20 forState:1];
  [v24 layoutIfNeeded];
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)_toggleMoreRoutesButtonPressed:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSPagingTripPreviewsCardView *)v4 setShowMoreRoutes:![(CPSPagingTripPreviewsCardView *)v4 showMoreRoutes]];
  [(CPSPagingTripPreviewsCardView *)v4 _setOverviewCollapsed:[(CPSPagingTripPreviewsCardView *)v4 showMoreRoutes]];
  objc_storeStrong(location, 0);
}

- (void)setSelectedRouteChoice:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSPagingTripPreviewsCardView;
  [(CPSTripPreviewsCardView *)&v6 setSelectedRouteChoice:location[0]];
  id v5 = [(CPSPagingTripPreviewsCardView *)v8 overviewView];
  id v4 = (id)[location[0] additionalInformationVariants];
  id v3 = (id)[v4 firstObject];
  [(CPSRouteOverviewView *)v5 setRouteNote:"setRouteNote:"];

  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forTripIdentifier:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v10.receiver = v13;
  v10.super_class = (Class)CPSPagingTripPreviewsCardView;
  [(CPSTripPreviewsCardView *)&v10 updateEstimates:location[0] forTripIdentifier:v11];
  objc_super v6 = [(CPSPagingTripPreviewsCardView *)v13 estimatesForTripIdentifiers];
  [(NSMutableDictionary *)v6 setObject:location[0] forKey:v11];

  id v8 = [(CPSTripPreviewsCardView *)v13 selectedTrip];
  id v7 = (id)[(CPTrip *)v8 identifier];
  char v9 = [v7 isEqual:v11];

  if (v9)
  {
    id v4 = [(CPSPagingTripPreviewsCardView *)v13 overviewView];
    [(CPSRouteOverviewView *)v4 setCurrentTravelEstimates:location[0]];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)alternateRoutesView:(id)a3 didSelectRouteChoice:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSPagingTripPreviewsCardView *)v7 setSelectedRouteChoice:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)pagingControlView:(id)a3 didSelectPageIndex:(unint64_t)a4
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = v9;
  id v7 = [(CPSTripPreviewsCardView *)v9 trips];
  id v6 = [(NSArray *)v7 objectAtIndex:a4];
  -[CPSPagingTripPreviewsCardView setSelectedTrip:](v5, "setSelectedTrip:");

  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x263EF8340];
  id v6 = self;
  location[1] = (id)a2;
  location[0] = [(CPSTripPreviewsCardView *)self goButton];
  if ([(CPSPagingTripPreviewsCardView *)v6 showMoreRoutes])
  {
    id v4 = [(CPSPagingTripPreviewsCardView *)v6 alternateRoutesView];
    v9[0] = v4;
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else if (location[0])
  {
    id v8 = location[0];
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v7 = MEMORY[0x263EFFA68];
  }
  objc_storeStrong(location, 0);
  id v2 = v7;

  return v2;
}

- (id)_linearFocusItems
{
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v10 = [(CPSPagingTripPreviewsCardView *)v16 pageControl];

  if (v10)
  {
    char v9 = [(CPSPagingTripPreviewsCardView *)v16 pageControl];
    id v8 = [(CPSPagingControlView *)v9 _linearFocusItems];
    objc_msgSend(v15[0], "addObjectsFromArray:");
  }
  id v14 = [(CPSPagingTripPreviewsCardView *)v16 alternateRoutesView];
  if (v14 && [(CPSPagingTripPreviewsCardView *)v16 showMoreRoutes])
  {
    id v7 = (id)[v14 _linearFocusItems];
    objc_msgSend(v15[0], "addObjectsFromArray:");
  }
  id v5 = [(CPSPagingTripPreviewsCardView *)v16 moreRoutesButton];
  char v12 = 0;
  LOBYTE(v6) = 0;
  if ([(UIButton *)v5 isEnabled])
  {
    id v13 = [(CPSPagingTripPreviewsCardView *)v16 moreRoutesButton];
    char v12 = 1;
    int v6 = [(UIButton *)v13 isHidden] ^ 1;
  }
  if (v12) {

  }
  if (v6)
  {
    id v4 = [(CPSPagingTripPreviewsCardView *)v16 moreRoutesButton];
    objc_msgSend(v15[0], "addObject:");
  }
  id location = [(CPSTripPreviewsCardView *)v16 goButton];
  if (location && ([location isHidden] & 1) == 0) {
    [v15[0] addObject:location];
  }
  id v3 = v15[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);

  return v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] nextFocusedView];
  id v4 = [(CPSPagingTripPreviewsCardView *)v8 alternateRoutesView];
  char v6 = objc_msgSend(v5, "isDescendantOfView:");

  if (v6) {
    char v9 = [(CPSPagingTripPreviewsCardView *)v8 showMoreRoutes];
  }
  else {
    char v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (NSMutableDictionary)estimatesForTripIdentifiers
{
  return self->_estimatesForTripIdentifiers;
}

- (CPSPagingControlView)pageControl
{
  return self->_pageControl;
}

- (CPSRouteOverviewView)overviewView
{
  return self->_overviewView;
}

- (CPSAlternateRoutesView)alternateRoutesView
{
  return self->_alternateRoutesView;
}

- (UIButton)moreRoutesButton
{
  return self->_moreRoutesButton;
}

- (BOOL)showMoreRoutes
{
  return self->_showMoreRoutes;
}

- (void)setShowMoreRoutes:(BOOL)a3
{
  self->_showMoreRoutes = a3;
}

- (NSLayoutConstraint)contentTopConstraint
{
  return self->_contentTopConstraint;
}

- (void)setContentTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentBottomConstraint
{
  return self->_contentBottomConstraint;
}

- (void)setContentBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)alternateRoutesHeightConstraint
{
  return self->_alternateRoutesHeightConstraint;
}

- (void)setAlternateRoutesHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)toggleRoutesButtonHeightConstraint
{
  return self->_toggleRoutesButtonHeightConstraint;
}

- (void)setToggleRoutesButtonHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end