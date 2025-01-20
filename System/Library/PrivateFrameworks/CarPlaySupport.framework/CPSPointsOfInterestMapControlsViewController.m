@interface CPSPointsOfInterestMapControlsViewController
- (CPSEntityMapButton)centerButton;
- (CPSEntityMapButton)panButton;
- (CPSEntityMapButton)zoomInButton;
- (CPSEntityMapButton)zoomOutButton;
- (CPSPointsOfInterestMapControlsViewController)initWithMapDelegate:(id)a3;
- (CPSPointsOfInterestMapDelegate)mapDelegate;
- (id)_linearFocusItems;
- (void)centerPressed:(id)a3;
- (void)didSelectButton:(id)a3;
- (void)panPressed:(id)a3;
- (void)setCenterButton:(id)a3;
- (void)setMapDelegate:(id)a3;
- (void)setPanButton:(id)a3;
- (void)setZoomInButton:(id)a3;
- (void)setZoomOutButton:(id)a3;
- (void)setupViews;
- (void)viewDidLoad;
- (void)zoomInPressed:(id)a3;
- (void)zoomOutPressed:(id)a3;
@end

@implementation CPSPointsOfInterestMapControlsViewController

- (CPSPointsOfInterestMapControlsViewController)initWithMapDelegate:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CPSPointsOfInterestMapControlsViewController;
  v8 = -[CPSPointsOfInterestMapControlsViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0);
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeWeak((id *)&v8->_mapDelegate, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestMapControlsViewController;
  [(CPSPointsOfInterestMapControlsViewController *)&v2 viewDidLoad];
  [(CPSPointsOfInterestMapControlsViewController *)v4 setupViews];
}

- (void)setupViews
{
  v156[1] = *MEMORY[0x263EF8340];
  v147 = self;
  v146[1] = (id)a2;
  SEL v3 = +[CPSEntityMapButton buttonWithEntityMapButtonType:3];
  -[CPSPointsOfInterestMapControlsViewController setPanButton:](v147, "setPanButton:");

  v4 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  [(CPSEntityMapButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  [(CPSButton *)v5 setDelegate:v147];

  id v8 = (id)CPUILocalizedStringForKey();
  v156[0] = v8;
  id v7 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v156);
  objc_super v6 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  [(CPSEntityMapButton *)v6 setAccessibilityUserInputLabels:v7];

  id v10 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  v9 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  objc_msgSend(v10, "addSubview:");

  v11 = +[CPSEntityMapButton buttonWithEntityMapButtonType:1];
  -[CPSPointsOfInterestMapControlsViewController setZoomInButton:](v147, "setZoomInButton:");

  v12 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  [(CPSEntityMapButton *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  [(CPSButton *)v13 setDelegate:v147];

  id v16 = (id)CPUILocalizedStringForKey();
  id v155 = v16;
  id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v155 count:1];
  v14 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  [(CPSEntityMapButton *)v14 setAccessibilityUserInputLabels:v15];

  id v18 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  v17 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  objc_msgSend(v18, "addSubview:");

  v19 = +[CPSEntityMapButton buttonWithEntityMapButtonType:2];
  -[CPSPointsOfInterestMapControlsViewController setZoomOutButton:](v147, "setZoomOutButton:");

  v20 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  [(CPSEntityMapButton *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  [(CPSButton *)v21 setDelegate:v147];

  id v24 = (id)CPUILocalizedStringForKey();
  id v154 = v24;
  id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:1];
  v22 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  [(CPSEntityMapButton *)v22 setAccessibilityUserInputLabels:v23];

  id v26 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  v25 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  objc_msgSend(v26, "addSubview:");

  v27 = +[CPSEntityMapButton buttonWithEntityMapButtonType:](CPSEntityMapButton, "buttonWithEntityMapButtonType:");
  -[CPSPointsOfInterestMapControlsViewController setCenterButton:](v147, "setCenterButton:");

  v28 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  [(CPSEntityMapButton *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v31 = (id)CPUILocalizedStringForKey();
  id v153 = v31;
  id v30 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v153 count:1];
  v29 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  [(CPSEntityMapButton *)v29 setAccessibilityUserInputLabels:v30];

  v32 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  [(CPSButton *)v32 setDelegate:v147];

  id v34 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  v33 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  objc_msgSend(v34, "addSubview:");

  id v2 = objc_alloc(MEMORY[0x263F1CB60]);
  v146[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v146[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v35 = (id)[MEMORY[0x263F1C550] _carSystemQuaternaryColor];
  objc_msgSend(v146[0], "setBackgroundColor:");

  id v36 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  [v36 addSubview:v146[0]];

  id v145 = (id)objc_opt_new();
  v57 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v56 = (id)[(CPSEntityMapButton *)v57 bottomAnchor];
  id v55 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v54 = (id)[v55 safeAreaLayoutGuide];
  id v53 = (id)[v54 bottomAnchor];
  id v52 = (id)objc_msgSend(v56, "constraintEqualToAnchor:");
  v152[0] = v52;
  v51 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v50 = (id)[(CPSEntityMapButton *)v51 leadingAnchor];
  id v49 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v48 = (id)[v49 safeAreaLayoutGuide];
  id v47 = (id)[v48 leadingAnchor];
  id v46 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v152[1] = v46;
  v45 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v44 = (id)[(CPSEntityMapButton *)v45 trailingAnchor];
  id v43 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v42 = (id)[v43 safeAreaLayoutGuide];
  id v41 = (id)[v42 trailingAnchor];
  id v40 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
  v152[2] = v40;
  v39 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v38 = (id)[(CPSEntityMapButton *)v39 heightAnchor];
  id v37 = (id)objc_msgSend(v38, "constraintEqualToConstant:");
  v152[3] = v37;
  id v144 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:4];

  v77 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  id v76 = (id)[(CPSEntityMapButton *)v77 bottomAnchor];
  v75 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v74 = (id)[(CPSEntityMapButton *)v75 topAnchor];
  id v73 = (id)objc_msgSend(v76, "constraintEqualToAnchor:");
  v151[0] = v73;
  v72 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  id v71 = (id)[(CPSEntityMapButton *)v72 leadingAnchor];
  id v70 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v69 = (id)[v70 safeAreaLayoutGuide];
  id v68 = (id)[v69 leadingAnchor];
  id v67 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
  v151[1] = v67;
  v66 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  id v65 = (id)[(CPSEntityMapButton *)v66 trailingAnchor];
  id v64 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v63 = (id)[v64 safeAreaLayoutGuide];
  id v62 = (id)[v63 trailingAnchor];
  id v61 = (id)objc_msgSend(v65, "constraintEqualToAnchor:");
  v151[2] = v61;
  v60 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  id v59 = (id)[(CPSEntityMapButton *)v60 heightAnchor];
  id v58 = (id)[v59 constraintEqualToConstant:34.5];
  v151[3] = v58;
  id v143 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:4];

  id v78 = v145;
  id v95 = (id)[v146[0] leftAnchor];
  v94 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v93 = (id)[(CPSEntityMapButton *)v94 leftAnchor];
  id v92 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
  v150[0] = v92;
  id v91 = (id)[v146[0] rightAnchor];
  v90 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v89 = (id)[(CPSEntityMapButton *)v90 rightAnchor];
  id v88 = (id)objc_msgSend(v91, "constraintEqualToAnchor:");
  v150[1] = v88;
  id v87 = (id)[v146[0] topAnchor];
  v86 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  id v85 = (id)[(CPSEntityMapButton *)v86 bottomAnchor];
  id v84 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", -0.5);
  v150[2] = v84;
  id v83 = (id)[v146[0] bottomAnchor];
  v82 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomOutButton];
  id v81 = (id)[(CPSEntityMapButton *)v82 topAnchor];
  id v80 = (id)objc_msgSend(v83, "constraintEqualToAnchor:constant:", 0.5);
  v150[3] = v80;
  id v79 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];
  objc_msgSend(v78, "addObjectsFromArray:");

  v117 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  id v116 = (id)[(CPSEntityMapButton *)v117 bottomAnchor];
  v115 = [(CPSPointsOfInterestMapControlsViewController *)v147 zoomInButton];
  id v114 = (id)[(CPSEntityMapButton *)v115 topAnchor];
  id v113 = (id)objc_msgSend(v116, "constraintEqualToAnchor:constant:", -8.0);
  v149[0] = v113;
  v112 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  id v111 = (id)[(CPSEntityMapButton *)v112 leadingAnchor];
  id v110 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v109 = (id)[v110 safeAreaLayoutGuide];
  id v108 = (id)[v109 leadingAnchor];
  id v107 = (id)objc_msgSend(v111, "constraintEqualToAnchor:");
  v149[1] = v107;
  v106 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  id v105 = (id)[(CPSEntityMapButton *)v106 trailingAnchor];
  id v104 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v103 = (id)[v104 safeAreaLayoutGuide];
  id v102 = (id)[v103 trailingAnchor];
  id v101 = (id)objc_msgSend(v105, "constraintEqualToAnchor:");
  v149[2] = v101;
  v100 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  id v99 = (id)[(CPSEntityMapButton *)v100 heightAnchor];
  v98 = [(CPSPointsOfInterestMapControlsViewController *)v147 panButton];
  id v97 = (id)[(CPSEntityMapButton *)v98 widthAnchor];
  id v96 = (id)objc_msgSend(v99, "constraintEqualToAnchor:");
  v149[3] = v96;
  id v142 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:4];

  v140 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  id v139 = (id)[(CPSEntityMapButton *)v140 topAnchor];
  id v138 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v137 = (id)[v138 safeAreaLayoutGuide];
  id v136 = (id)[v137 topAnchor];
  id v135 = (id)objc_msgSend(v139, "constraintEqualToAnchor:");
  v148[0] = v135;
  v134 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  id v133 = (id)[(CPSEntityMapButton *)v134 trailingAnchor];
  id v132 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v131 = (id)[v132 safeAreaLayoutGuide];
  id v130 = (id)[v131 trailingAnchor];
  id v129 = (id)objc_msgSend(v133, "constraintEqualToAnchor:");
  v148[1] = v129;
  v128 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  id v127 = (id)[(CPSEntityMapButton *)v128 leadingAnchor];
  id v126 = (id)[(CPSPointsOfInterestMapControlsViewController *)v147 view];
  id v125 = (id)[v126 safeAreaLayoutGuide];
  id v124 = (id)[v125 leadingAnchor];
  id v123 = (id)objc_msgSend(v127, "constraintEqualToAnchor:");
  v148[2] = v123;
  v122 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  id v121 = (id)[(CPSEntityMapButton *)v122 heightAnchor];
  v120 = [(CPSPointsOfInterestMapControlsViewController *)v147 centerButton];
  id v119 = (id)[(CPSEntityMapButton *)v120 widthAnchor];
  id v118 = (id)objc_msgSend(v121, "constraintEqualToAnchor:multiplier:", 1.0);
  v148[3] = v118;
  id v141 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:4];

  [v145 addObjectsFromArray:v144];
  [v145 addObjectsFromArray:v143];
  [v145 addObjectsFromArray:v142];
  [v145 addObjectsFromArray:v141];
  [MEMORY[0x263F08938] activateConstraints:v145];
  objc_storeStrong(&v141, 0);
  objc_storeStrong(&v142, 0);
  objc_storeStrong(&v143, 0);
  objc_storeStrong(&v144, 0);
  objc_storeStrong(&v145, 0);
  objc_storeStrong(v146, 0);
}

- (void)zoomInPressed:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSPointsOfInterestMapControlsViewController *)v7 mapDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    SEL v3 = [(CPSPointsOfInterestMapControlsViewController *)v7 mapDelegate];
    [(CPSPointsOfInterestMapDelegate *)v3 zoomIn];
  }
  objc_storeStrong(location, 0);
}

- (void)zoomOutPressed:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSPointsOfInterestMapControlsViewController *)v7 mapDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    SEL v3 = [(CPSPointsOfInterestMapControlsViewController *)v7 mapDelegate];
    [(CPSPointsOfInterestMapDelegate *)v3 zoomOut];
  }
  objc_storeStrong(location, 0);
}

- (void)panPressed:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v5 = [(CPSPointsOfInterestMapControlsViewController *)v14 mapDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    SEL v3 = [(CPSPointsOfInterestMapControlsViewController *)v14 mapDelegate];
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = __59__CPSPointsOfInterestMapControlsViewController_panPressed___block_invoke;
    v11 = &unk_2648A3BE0;
    v12 = v14;
    [(CPSPointsOfInterestMapDelegate *)v3 beginPanningWithCompletion:&v7];

    v4 = [(CPSPointsOfInterestMapControlsViewController *)v14 panButton];
    [(CPSEntityMapButton *)v4 setAlpha:0.0];

    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(location, 0);
}

void __59__CPSPointsOfInterestMapControlsViewController_panPressed___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) panButton];
  [v1 setAlpha:1.0];
}

- (void)centerPressed:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSPointsOfInterestMapControlsViewController *)v7 mapDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    SEL v3 = [(CPSPointsOfInterestMapControlsViewController *)v7 mapDelegate];
    [(CPSPointsOfInterestMapDelegate *)v3 centerMap];
  }
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (CPSEntityMapButton *)location[0];
  SEL v3 = [(CPSPointsOfInterestMapControlsViewController *)v16 zoomInButton];
  BOOL v14 = v13 != v3;

  if (v14)
  {
    v11 = (CPSEntityMapButton *)location[0];
    v4 = [(CPSPointsOfInterestMapControlsViewController *)v16 zoomOutButton];
    BOOL v12 = v11 != v4;

    if (v12)
    {
      int v9 = (CPSEntityMapButton *)location[0];
      char v5 = [(CPSPointsOfInterestMapControlsViewController *)v16 panButton];
      BOOL v10 = v9 != v5;

      if (v10)
      {
        uint64_t v7 = (CPSEntityMapButton *)location[0];
        char v6 = [(CPSPointsOfInterestMapControlsViewController *)v16 centerButton];
        BOOL v8 = v7 != v6;

        if (!v8) {
          [(CPSPointsOfInterestMapControlsViewController *)v16 centerPressed:location[0]];
        }
      }
      else
      {
        [(CPSPointsOfInterestMapControlsViewController *)v16 panPressed:location[0]];
      }
    }
    else
    {
      [(CPSPointsOfInterestMapControlsViewController *)v16 zoomOutPressed:location[0]];
    }
  }
  else
  {
    [(CPSPointsOfInterestMapControlsViewController *)v16 zoomInPressed:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)_linearFocusItems
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v10 = [(CPSPointsOfInterestMapControlsViewController *)v13 panButton];
  [(CPSEntityMapButton *)v10 alpha];
  BOOL v11 = v2 != 1.0;

  if (!v11)
  {
    int v9 = [(CPSPointsOfInterestMapControlsViewController *)v13 panButton];
    objc_msgSend(v12[0], "addObject:");
  }
  BOOL v8 = [(CPSPointsOfInterestMapControlsViewController *)v13 zoomInButton];

  if (v8)
  {
    uint64_t v7 = [(CPSPointsOfInterestMapControlsViewController *)v13 zoomInButton];
    objc_msgSend(v12[0], "addObject:");
  }
  char v6 = [(CPSPointsOfInterestMapControlsViewController *)v13 zoomOutButton];

  if (v6)
  {
    char v5 = [(CPSPointsOfInterestMapControlsViewController *)v13 zoomOutButton];
    objc_msgSend(v12[0], "addObject:");
  }
  id v4 = v12[0];
  objc_storeStrong(v12, 0);

  return v4;
}

- (CPSPointsOfInterestMapDelegate)mapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapDelegate);

  return (CPSPointsOfInterestMapDelegate *)WeakRetained;
}

- (void)setMapDelegate:(id)a3
{
}

- (CPSEntityMapButton)zoomInButton
{
  return self->_zoomInButton;
}

- (void)setZoomInButton:(id)a3
{
}

- (CPSEntityMapButton)zoomOutButton
{
  return self->_zoomOutButton;
}

- (void)setZoomOutButton:(id)a3
{
}

- (CPSEntityMapButton)panButton
{
  return self->_panButton;
}

- (void)setPanButton:(id)a3
{
}

- (CPSEntityMapButton)centerButton
{
  return self->_centerButton;
}

- (void)setCenterButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end