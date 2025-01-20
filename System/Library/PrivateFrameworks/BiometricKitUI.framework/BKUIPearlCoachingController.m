@interface BKUIPearlCoachingController
- (BKUIButtonTray)buttonTray;
- (BKUIPearlCoachingControllerDelegate)delegate;
- (BKUIPearlCoachingDeviceView)deviceView;
- (BKUIPearlInstructionView)instructionView;
- (BOOL)didOrientationChange;
- (BOOL)inBuddy;
- (BOOL)inSheet;
- (BOOL)isDeviceFlat;
- (BOOL)isDisplayZoomEnabled;
- (BOOL)needsToShow;
- (BOOL)resetDeviceView;
- (UIButton)escapeHatchButton;
- (UIScrollView)scrollview;
- (UIView)scrollContentView;
- (int64_t)orientation;
- (void)deviceOrientationChanged;
- (void)escapeHatchButtonPressed:(id)a3;
- (void)handleRotation;
- (void)setButtonTray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceView:(id)a3;
- (void)setEscapeHatchButton:(id)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setInSheet:(BOOL)a3;
- (void)setInstructionView:(id)a3;
- (void)setIsDisplayZoomEnabled:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setScrollContentView:(id)a3;
- (void)setScrollview:(id)a3;
- (void)stopCoachingAnimation;
- (void)updateInstructionText;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKUIPearlCoachingController

- (void)viewDidLoad
{
  v180[5] = *MEMORY[0x1E4F143B8];
  v175.receiver = self;
  v175.super_class = (Class)BKUIPearlCoachingController;
  [(BKUIPearlCoachingController *)&v175 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F42DB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(BKUIPearlCoachingController *)self setScrollview:v8];

  v9 = [(BKUIPearlCoachingController *)self scrollview];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v12 = [(BKUIPearlCoachingController *)self scrollview];
  objc_msgSend(v12, "setContentSize:", v10, v11);

  v13 = [(BKUIPearlCoachingController *)self scrollview];
  [v13 setIndicatorStyle:2];

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  [(BKUIPearlCoachingController *)self setScrollContentView:v14];

  v15 = [(BKUIPearlCoachingController *)self scrollContentView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(BKUIPearlCoachingController *)self scrollview];
  v17 = [(BKUIPearlCoachingController *)self scrollContentView];
  [v16 addSubview:v17];

  v137 = (void *)MEMORY[0x1E4F28DC8];
  v173 = [(BKUIPearlCoachingController *)self scrollContentView];
  v165 = [v173 topAnchor];
  v169 = [(BKUIPearlCoachingController *)self scrollview];
  v161 = [v169 topAnchor];
  v158 = [v165 constraintEqualToAnchor:v161];
  v180[0] = v158;
  v155 = [(BKUIPearlCoachingController *)self scrollContentView];
  v149 = [v155 bottomAnchor];
  v152 = [(BKUIPearlCoachingController *)self scrollview];
  v146 = [v152 bottomAnchor];
  v143 = [v149 constraintEqualToAnchor:v146];
  v180[1] = v143;
  v140 = [(BKUIPearlCoachingController *)self scrollContentView];
  v131 = [v140 widthAnchor];
  v134 = [(BKUIPearlCoachingController *)self scrollview];
  v129 = [v134 widthAnchor];
  v127 = [v131 constraintEqualToAnchor:v129];
  v180[2] = v127;
  v125 = [(BKUIPearlCoachingController *)self scrollContentView];
  v123 = [v125 centerXAnchor];
  v18 = [(BKUIPearlCoachingController *)self scrollview];
  v19 = [v18 centerXAnchor];
  v20 = [v123 constraintEqualToAnchor:v19];
  v180[3] = v20;
  v21 = [(BKUIPearlCoachingController *)self scrollContentView];
  v22 = [v21 heightAnchor];
  v23 = [(BKUIPearlCoachingController *)self scrollview];
  v24 = [v23 heightAnchor];
  v25 = [v22 constraintGreaterThanOrEqualToAnchor:v24];
  v180[4] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:5];
  [v137 activateConstraints:v26];

  v27 = [(BKUIPearlCoachingController *)self view];
  v28 = [(BKUIPearlCoachingController *)self scrollview];
  [v27 addSubview:v28];

  v29 = [MEMORY[0x1E4F428B8] blackColor];
  v30 = [(BKUIPearlCoachingController *)self view];
  [v30 setBackgroundColor:v29];

  id v31 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  v32 = [(BKUIPearlCoachingController *)self view];
  [v32 addSubview:v31];

  v170 = (void *)MEMORY[0x1E4F28DC8];
  v174 = v31;
  v33 = [v31 topAnchor];
  v34 = [(BKUIPearlCoachingController *)self view];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v179[0] = v36;
  v37 = [v31 heightAnchor];
  v38 = [(BKUIPearlCoachingController *)self view];
  v39 = [v38 heightAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 multiplier:0.41];
  v179[1] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
  [v170 activateConstraints:v41];

  v42 = [[BKUIPearlCoachingDeviceView alloc] initWithSheetLayout:[(BKUIPearlCoachingController *)self inSheet]];
  [(BKUIPearlCoachingController *)self setDeviceView:v42];

  BOOL v43 = [(BKUIPearlCoachingController *)self isDisplayZoomEnabled];
  v44 = [(BKUIPearlCoachingController *)self deviceView];
  [v44 setIsDisplayZoomEnabled:v43];

  v45 = [(BKUIPearlCoachingController *)self deviceView];
  [v45 setAlpha:0.0];

  v46 = [(BKUIPearlCoachingController *)self deviceView];
  [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

  v47 = [(BKUIPearlCoachingController *)self view];
  v48 = [(BKUIPearlCoachingController *)self deviceView];
  [v47 addSubview:v48];

  v49 = [(BKUIPearlCoachingController *)self deviceView];
  v50 = [MEMORY[0x1E4F428B8] redColor];
  id v51 = (id)objc_msgSend(v49, "bkui_debugBorder:withWidth:", v50, 1);

  v52 = [(BKUIPearlCoachingController *)self deviceView];
  v53 = [v52 centerXAnchor];
  v54 = [(BKUIPearlCoachingController *)self view];
  v55 = [v54 centerXAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  v57 = [(BKUIPearlCoachingController *)self deviceView];
  v58 = [v57 centerYAnchor];
  v59 = [v174 bottomAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [BKUIButtonTray alloc];
  v62 = [(BKUIPearlCoachingController *)self parentViewController];
  [v62 preferredContentSize];
  v64 = -[BKUIButtonTray initWithFrame:](v61, "initWithFrame:", 0.0, 0.0, v63, 0.0);
  [(BKUIPearlCoachingController *)self setButtonTray:v64];

  v65 = [(BKUIPearlCoachingController *)self buttonTray];
  [v65 setTranslatesAutoresizingMaskIntoConstraints:0];

  v66 = [(BKUIPearlCoachingController *)self buttonTray];
  v67 = [v66 bottomLinkButton];
  [(BKUIPearlCoachingController *)self setEscapeHatchButton:v67];

  v68 = [(BKUIPearlCoachingController *)self escapeHatchButton];
  v69 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v70 = [v69 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_1F4081468 table:@"Pearl-j3xx"];
  [v68 setTitle:v70 forState:0];

  v71 = [(BKUIPearlCoachingController *)self escapeHatchButton];
  [v71 addTarget:self action:sel_escapeHatchButtonPressed_ forControlEvents:0x2000];

  uint64_t v72 = [(BKUIPearlCoachingController *)self inBuddy] ^ 1;
  v73 = [(BKUIPearlCoachingController *)self escapeHatchButton];
  [v73 setHidden:v72];

  v74 = objc_alloc_init(BKUIPearlInstructionView);
  [(BKUIPearlCoachingController *)self setInstructionView:v74];

  v75 = [(BKUIPearlCoachingController *)self instructionView];
  [v75 setTranslatesAutoresizingMaskIntoConstraints:0];

  v76 = [(BKUIPearlCoachingController *)self instructionView];
  [v76 setDarkMode:1];

  v77 = [(BKUIPearlCoachingController *)self instructionView];
  LODWORD(v78) = 1148846080;
  [v77 setContentCompressionResistancePriority:1 forAxis:v78];

  v79 = [(BKUIPearlCoachingController *)self scrollContentView];
  v80 = [(BKUIPearlCoachingController *)self buttonTray];
  [v79 addSubview:v80];

  v81 = [(BKUIPearlCoachingController *)self scrollContentView];
  v82 = [(BKUIPearlCoachingController *)self instructionView];
  [v81 addSubview:v82];

  v126 = (void *)MEMORY[0x1E4F28DC8];
  v171 = [(BKUIPearlCoachingController *)self instructionView];
  v162 = [v171 topAnchor];
  v166 = [(BKUIPearlCoachingController *)self scrollContentView];
  v159 = [v166 topAnchor];
  v156 = [v162 constraintEqualToAnchor:v159];
  v178[0] = v156;
  v153 = [(BKUIPearlCoachingController *)self instructionView];
  v147 = [v153 leadingAnchor];
  v150 = [(BKUIPearlCoachingController *)self view];
  v144 = [v150 leadingAnchor];
  v141 = [v147 constraintEqualToAnchor:v144];
  v178[1] = v141;
  v138 = [(BKUIPearlCoachingController *)self instructionView];
  v132 = [v138 trailingAnchor];
  v135 = [(BKUIPearlCoachingController *)self view];
  v130 = [v135 trailingAnchor];
  v128 = [v132 constraintEqualToAnchor:v130];
  v178[2] = v128;
  v124 = [(BKUIPearlCoachingController *)self instructionView];
  v121 = [v124 bottomAnchor];
  v122 = [(BKUIPearlCoachingController *)self buttonTray];
  v120 = [v122 topAnchor];
  v119 = [v121 constraintEqualToAnchor:v120 constant:45.0];
  v178[3] = v119;
  v118 = [(BKUIPearlCoachingController *)self buttonTray];
  v116 = [v118 leadingAnchor];
  v117 = [(BKUIPearlCoachingController *)self view];
  v115 = [v117 leadingAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v178[4] = v114;
  v113 = [(BKUIPearlCoachingController *)self buttonTray];
  v112 = [v113 trailingAnchor];
  v83 = [(BKUIPearlCoachingController *)self view];
  v84 = [v83 trailingAnchor];
  v85 = [v112 constraintEqualToAnchor:v84];
  v178[5] = v85;
  v86 = [(BKUIPearlCoachingController *)self buttonTray];
  v87 = [v86 bottomAnchor];
  v88 = [(BKUIPearlCoachingController *)self scrollContentView];
  v89 = [v88 bottomAnchor];
  v90 = [v87 constraintEqualToAnchor:v89];
  v178[6] = v90;
  v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:7];
  [v126 activateConstraints:v91];

  id v92 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v92 setTranslatesAutoresizingMaskIntoConstraints:0];
  v93 = [(BKUIPearlCoachingController *)self view];
  [v93 addSubview:v92];

  v163 = (void *)MEMORY[0x1E4F28DC8];
  v167 = [v92 topAnchor];
  v94 = [(BKUIPearlCoachingController *)self view];
  v95 = [v94 topAnchor];
  v96 = [v167 constraintEqualToAnchor:v95];
  v177[0] = v96;
  v97 = v92;
  v172 = v92;
  v98 = [v92 heightAnchor];
  v99 = [(BKUIPearlCoachingController *)self view];
  v100 = [v99 heightAnchor];
  v101 = [v98 constraintEqualToAnchor:v100 multiplier:0.75];
  v177[1] = v101;
  v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:2];
  [v163 activateConstraints:v102];

  v139 = (void *)MEMORY[0x1E4F28DC8];
  v168 = [(BKUIPearlCoachingController *)self scrollview];
  v164 = [v168 topAnchor];
  v160 = [v97 bottomAnchor];
  v157 = [v164 constraintEqualToAnchor:v160];
  v176[0] = v157;
  v154 = [(BKUIPearlCoachingController *)self scrollview];
  v148 = [v154 leadingAnchor];
  v151 = [(BKUIPearlCoachingController *)self view];
  v145 = [v151 leadingAnchor];
  v142 = [v148 constraintEqualToAnchor:v145];
  v176[1] = v142;
  v136 = [(BKUIPearlCoachingController *)self scrollview];
  v133 = [v136 trailingAnchor];
  v103 = [(BKUIPearlCoachingController *)self view];
  v104 = [v103 trailingAnchor];
  v105 = [v133 constraintEqualToAnchor:v104];
  v176[2] = v105;
  v106 = [(BKUIPearlCoachingController *)self scrollview];
  v107 = [v106 bottomAnchor];
  v108 = [(BKUIPearlCoachingController *)self view];
  v109 = [v108 bottomAnchor];
  v110 = [v107 constraintEqualToAnchor:v109];
  v176[3] = v110;
  v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:4];
  [v139 activateConstraints:v111];

  [(BKUIPearlCoachingController *)self updateInstructionText];
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
  BOOL v3 = !a3;
  id v4 = [(BKUIPearlCoachingController *)self escapeHatchButton];
  [v4 setHidden:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlCoachingController;
  [(BKUIPearlCoachingController *)&v5 viewWillAppear:a3];
  [(BKUIPearlCoachingController *)self resetDeviceView];
  id v4 = [(BKUIPearlCoachingController *)self deviceView];
  [v4 setAlpha:1.0];
}

- (void)stopCoachingAnimation
{
  id v2 = [(BKUIPearlCoachingController *)self deviceView];
  [v2 stopAnimation];
}

- (void)deviceOrientationChanged
{
  BOOL v3 = [(BKUIPearlCoachingController *)self needsToShow];
  id v4 = [(BKUIPearlCoachingController *)self deviceView];
  [v4 alpha];
  double v6 = v5;

  if (v3)
  {
    if (v6 == 1.0) {
      double v7 = 0.5;
    }
    else {
      double v7 = 0.899999976;
    }
    [(BKUIPearlCoachingController *)self resetDeviceView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke;
    v10[3] = &unk_1E6EA20C0;
    v10[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke_2;
    v9[3] = &unk_1E6EA2108;
    v9[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v10 options:v9 animations:v7 completion:0.300000012];
  }
  else
  {
    id v8 = [(BKUIPearlCoachingController *)self deviceView];
    [v8 setAlpha:0.0];
  }
}

void __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) deviceView];
  [v1 setAlpha:1.0];
}

void __55__BKUIPearlCoachingController_deviceOrientationChanged__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceView];
  objc_msgSend(v2, "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));

  id v3 = [*(id *)(a1 + 32) deviceView];
  [v3 startAnimation];
}

- (BOOL)resetDeviceView
{
  BOOL v3 = [(BKUIPearlCoachingController *)self didOrientationChange];
  if (v3)
  {
    id v4 = [(BKUIPearlCoachingController *)self deviceView];
    [v4 setAlpha:0.0];

    double v5 = [(BKUIPearlCoachingController *)self deviceView];
    objc_msgSend(v5, "setOrientation:", -[BKUIPearlCoachingController orientation](self, "orientation"));

    [(BKUIPearlCoachingController *)self updateInstructionText];
  }
  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)BKUIPearlCoachingController;
  id v7 = a4;
  -[BKUIPearlCoachingController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  BOOL v8 = [(BKUIPearlCoachingController *)self resetDeviceView];
  BOOL v9 = [(BKUIPearlCoachingController *)self needsToShow];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E6EA2130;
  BOOL v14 = v8;
  BOOL v15 = v9;
  v13[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E6EA2130;
  BOOL v11 = v8;
  BOOL v12 = v9;
  v10[4] = self;
  [v7 animateAlongsideTransition:v13 completion:v10];
}

void __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    id v1 = [*(id *)(a1 + 32) deviceView];
    [v1 setAlpha:1.0];
  }
}

void __82__BKUIPearlCoachingController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    id v1 = [*(id *)(a1 + 32) deviceView];
    [v1 startAnimation];
  }
}

- (void)handleRotation
{
  BOOL v3 = [(BKUIPearlCoachingController *)self resetDeviceView];
  BOOL v4 = [(BKUIPearlCoachingController *)self needsToShow];
  if (v3 && v4)
  {
    id v5 = [(BKUIPearlCoachingController *)self deviceView];
    [v5 startAnimation];
  }
}

- (void)escapeHatchButtonPressed:(id)a3
{
  BOOL v4 = _BKUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Skipped coaching", v6, 2u);
  }

  id v5 = [(BKUIPearlCoachingController *)self delegate];
  [v5 coachingSkipped];
}

- (BOOL)needsToShow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 4;
  uint64_t v4 = MGGetProductType();
  uint64_t v5 = v4;
  if (v4 > 2619317133)
  {
    if (v4 != 2619317134)
    {
      uint64_t v6 = 3241053352;
      goto LABEL_6;
    }
LABEL_7:
    LODWORD(v3) = [(BKUIPearlCoachingController *)self orientation] != v3;
    goto LABEL_8;
  }
  if (v4 == 555503454) {
    goto LABEL_7;
  }
  uint64_t v6 = 2487868872;
LABEL_6:
  if (v4 == v6) {
    goto LABEL_7;
  }
  uint64_t v3 = 1;
  if ([(BKUIPearlCoachingController *)self orientation] == 1) {
    goto LABEL_7;
  }
LABEL_8:
  id v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218752;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = v3;
    __int16 v13 = 2048;
    int64_t v14 = [(BKUIPearlCoachingController *)self orientation];
    __int16 v15 = 1024;
    BOOL v16 = [(BKUIPearlCoachingController *)self isDeviceFlat];
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "Coaching controller needs to show: model: %ld, %i, orientation: %li, flat: %i", (uint8_t *)&v9, 0x22u);
  }

  return v3;
}

- (void)updateInstructionText
{
  uint64_t v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134) {
      goto LABEL_7;
    }
    uint64_t v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454) {
      goto LABEL_7;
    }
    uint64_t v4 = 2487868872;
  }
  if (v3 != v4)
  {
    int64_t v13 = [(BKUIPearlCoachingController *)self orientation];
    int64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    __int16 v15 = v14;
    int v12 = @"Pearl-j3xx";
    if (v13 == 2)
    {
      id v19 = [v14 localizedStringForKey:@"ROTATE_GENERAL" value:&stru_1F4081468 table:@"Pearl-j3xx"];

      BOOL v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v9 = v8;
      uint64_t v10 = @"ROTATE_TO_PORTRAIT_UPSIDE_DOWN_DETAIL";
    }
    else
    {
      id v19 = [v14 localizedStringForKey:@"ROTATE_TO_PORTRAIT" value:&stru_1F4081468 table:@"Pearl-j3xx"];

      BOOL v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v9 = v8;
      uint64_t v10 = @"ROTATE_TO_PORTRAIT_DETAIL";
    }
    goto LABEL_13;
  }
LABEL_7:
  int64_t v5 = [(BKUIPearlCoachingController *)self orientation];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v5 == 3)
  {
    id v19 = [v6 localizedStringForKey:@"ROTATE_GENERAL" value:&stru_1F4081468 table:@"Pearl-j3xx"];

    BOOL v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v9 = v8;
    uint64_t v10 = @"ROTATE_TO_LANDSCAPE_UPSIDE_DOWN_DETAIL";
    __int16 v11 = @"Pearl-Landscape";
    goto LABEL_14;
  }
  int v12 = @"Pearl-Landscape";
  id v19 = [v6 localizedStringForKey:@"ROTATE_TO_LANDSCAPE" value:&stru_1F4081468 table:@"Pearl-Landscape"];

  BOOL v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v9 = v8;
  uint64_t v10 = @"ROTATE_TO_LANDSCAPE_DETAIL";
LABEL_13:
  __int16 v11 = v12;
LABEL_14:
  BOOL v16 = [v8 localizedStringForKey:v10 value:&stru_1F4081468 table:v11];

  uint64_t v17 = [(BKUIPearlCoachingController *)self instructionView];
  [v17 setInstruction:v19];

  v18 = [(BKUIPearlCoachingController *)self instructionView];
  [v18 setDetail:v16];
}

- (BOOL)didOrientationChange
{
  int64_t v3 = [(BKUIPearlCoachingController *)self orientation];
  uint64_t v4 = [(BKUIPearlCoachingController *)self deviceView];
  LOBYTE(v3) = v3 != [v4 orientation];

  return v3;
}

- (BOOL)isDeviceFlat
{
  return (unint64_t)([MEMORY[0x1E4F42948] currentDeviceOrientationAllowingAmbiguous:0] - 5) < 2;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (BOOL)isDisplayZoomEnabled
{
  return self->_isDisplayZoomEnabled;
}

- (void)setIsDisplayZoomEnabled:(BOOL)a3
{
  self->_isDisplayZoomEnabled = a3;
}

- (BKUIPearlCoachingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIPearlCoachingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKUIPearlCoachingDeviceView)deviceView
{
  return self->_deviceView;
}

- (void)setDeviceView:(id)a3
{
}

- (BKUIPearlInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
}

- (UIButton)escapeHatchButton
{
  return self->_escapeHatchButton;
}

- (void)setEscapeHatchButton:(id)a3
{
}

- (BKUIButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
}

- (UIScrollView)scrollview
{
  return self->_scrollview;
}

- (void)setScrollview:(id)a3
{
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_scrollview, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_escapeHatchButton, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_deviceView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end