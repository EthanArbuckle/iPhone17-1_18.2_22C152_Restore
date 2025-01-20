@interface DBInCallWidgetViewController
- (BOOL)_shouldUseMultilineTitleButton;
- (BOOL)entireWidgetFocusable;
- (BOOL)invalidated;
- (CADisplayLink)callTimeDisplayLink;
- (CGSize)lastViewSize;
- (DBInCallWidgetAppIconButton)appIconButton;
- (DBInCallWidgetAvatarView)avatarButton;
- (DBInCallWidgetButton)endCallButton;
- (DBInCallWidgetButton)muteButton;
- (DBInCallWidgetMultiwayTitleButton)multiwayTitleButton;
- (NSArray)constraints;
- (NSArray)tallMultiwayOnlyConstraints;
- (NSArray)tallNonMultiwayConstraints;
- (TUCall)currentCall;
- (UIFocusContainerGuide)bottomFocusContainerGuide;
- (UIFocusContainerGuide)multiwayLabelFocusContainerGuide;
- (UIFocusContainerGuide)topFocusContainerGuide;
- (UILabel)callTimeLabel;
- (UILabel)contactNameLabel;
- (UILayoutGuide)bottomRowGuide;
- (UILayoutGuide)labelContainerGuide;
- (UILayoutGuide)leftButtonGuide;
- (UILayoutGuide)midBottomGuide;
- (UILayoutGuide)midButtonGuide;
- (UILayoutGuide)midTopRowGuide;
- (UILayoutGuide)rightButtonGuide;
- (UILayoutGuide)topRowGuide;
- (id)_displayNameForCall:(id)a3;
- (id)linearFocusItems;
- (unint64_t)widgetStyle;
- (void)_displayLinkFired:(id)a3;
- (void)_updateUIForCallState;
- (void)buttonTapped:(id)a3;
- (void)dealloc;
- (void)handleCallStatusChanged;
- (void)invalidate;
- (void)setAppIconButton:(id)a3;
- (void)setAvatarButton:(id)a3;
- (void)setBottomFocusContainerGuide:(id)a3;
- (void)setBottomRowGuide:(id)a3;
- (void)setCallTimeDisplayLink:(id)a3;
- (void)setCallTimeLabel:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContactNameLabel:(id)a3;
- (void)setCurrentCall:(id)a3;
- (void)setEndCallButton:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLabelContainerGuide:(id)a3;
- (void)setLastViewSize:(CGSize)a3;
- (void)setLeftButtonGuide:(id)a3;
- (void)setMidBottomGuide:(id)a3;
- (void)setMidButtonGuide:(id)a3;
- (void)setMidTopRowGuide:(id)a3;
- (void)setMultiwayLabelFocusContainerGuide:(id)a3;
- (void)setMultiwayTitleButton:(id)a3;
- (void)setMuteButton:(id)a3;
- (void)setRightButtonGuide:(id)a3;
- (void)setTallMultiwayOnlyConstraints:(id)a3;
- (void)setTallNonMultiwayConstraints:(id)a3;
- (void)setTopFocusContainerGuide:(id)a3;
- (void)setTopRowGuide:(id)a3;
- (void)setWidgetStyle:(unint64_t)a3;
- (void)setupConstraints;
- (void)updateLabelsForCurrentStyle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)widgetViewTapped;
@end

@implementation DBInCallWidgetViewController

- (void)dealloc
{
  v3 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DBInCallWidgetViewController;
  [(DBInCallWidgetViewController *)&v4 dealloc];
}

- (void)handleCallStatusChanged
{
  v3 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v5 = [v3 displayedAudioAndVideoCalls];

  if ((unint64_t)[v5 count] < 2)
  {
    objc_super v4 = [v5 firstObject];
    goto LABEL_5;
  }
  objc_super v4 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &__block_literal_global_9);
  if (v4) {
LABEL_5:
  }
    [(DBInCallWidgetViewController *)self setCurrentCall:v4];

  [(DBInCallWidgetViewController *)self _updateUIForCallState];
}

uint64_t __55__DBInCallWidgetViewController_handleCallStatusChanged__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOnHold] ^ 1;
}

- (void)viewDidLoad
{
  v62.receiver = self;
  v62.super_class = (Class)DBInCallWidgetViewController;
  [(DBInCallWidgetViewController *)&v62 viewDidLoad];
  v3 = [(DBInCallWidgetViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CARAppTodayInCallViewWidget"];

  objc_super v4 = [MEMORY[0x263F7E1A0] sharedInstance];
  v61 = [v4 displayedAudioAndVideoCalls];

  id v5 = [v61 firstObject];
  currentCall = self->_currentCall;
  self->_currentCall = v5;

  v60 = [MEMORY[0x263F08A00] defaultCenter];
  [v60 addObserver:self selector:sel__muteStateChanged_ name:*MEMORY[0x263F7E340] object:0];
  self->_lastViewSize = (CGSize)*MEMORY[0x263F001B0];
  [(DBInCallWidgetViewController *)self setWidgetStyle:0];
  v59 = objc_alloc_init(DBInCallWidgetAvatarView);
  [(DBInCallWidgetAvatarView *)v59 addTarget:self action:sel_buttonTapped_ forControlEvents:0x2000];
  v7 = [(DBWidgetViewController *)self contentView];
  [v7 addSubview:v59];

  [(DBInCallWidgetViewController *)self setAvatarButton:v59];
  v8 = [(DBInCallWidgetViewController *)self avatarButton];
  [v8 setAccessibilityIdentifier:@"AvatarButton"];

  v9 = [DBInCallWidgetAppIconButton alloc];
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = -[DBInCallWidgetAppIconButton initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
  [(DBInCallWidgetAppIconButton *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DBInCallWidgetAppIconButton *)v14 addTarget:self action:sel_buttonTapped_ forControlEvents:0x2000];
  v15 = [(DBWidgetViewController *)self contentView];
  [v15 addSubview:v14];

  [(DBInCallWidgetViewController *)self setAppIconButton:v14];
  v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [MEMORY[0x263F825C8] labelColor];
  [v16 setTextColor:v17];

  [v16 setTextAlignment:1];
  v18 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83588] variant:1280];
  [v16 setFont:v18];

  [v16 setAdjustsFontForContentSizeCategory:1];
  [v16 setNumberOfLines:1];
  v19 = [(DBWidgetViewController *)self contentView];
  [v19 addSubview:v16];

  [(DBInCallWidgetViewController *)self setContactNameLabel:v16];
  v20 = [(DBInCallWidgetViewController *)self contactNameLabel];
  [v20 setAccessibilityIdentifier:@"ContactName"];

  v21 = -[DBInCallWidgetMultiwayTitleButton initWithFrame:]([DBInCallWidgetMultiwayTitleButton alloc], "initWithFrame:", v10, v11, v12, v13);
  [(DBInCallWidgetMultiwayTitleButton *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DBInCallWidgetMultiwayTitleButton *)v21 addTarget:self action:sel_buttonTapped_ forControlEvents:0x2000];
  v22 = [(DBWidgetViewController *)self contentView];
  [v22 addSubview:v21];

  [(DBInCallWidgetViewController *)self setMultiwayTitleButton:v21];
  v23 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
  [v23 setAccessibilityIdentifier:@"MultiwayTitle"];

  v24 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
  [v24 setTextColor:v25];

  [v24 setTextAlignment:1];
  v26 = [MEMORY[0x263F81708] monospacedDigitSystemFontOfSize:12.0 weight:*MEMORY[0x263F81838]];
  [v24 setFont:v26];

  [v24 setAdjustsFontForContentSizeCategory:1];
  [v24 setNumberOfLines:1];
  v27 = [(DBWidgetViewController *)self contentView];
  [v27 addSubview:v24];

  [(DBInCallWidgetViewController *)self setCallTimeLabel:v24];
  v28 = [(DBInCallWidgetViewController *)self callTimeLabel];
  [v28 setAccessibilityIdentifier:@"CallTime"];

  v29 = [[DBInCallWidgetButton alloc] initWithButtonType:1];
  [(DBInCallWidgetButton *)v29 addTarget:self action:sel_buttonTapped_ forControlEvents:0x2000];
  v30 = [(DBWidgetViewController *)self contentView];
  [v30 addSubview:v29];

  [(DBInCallWidgetViewController *)self setMuteButton:v29];
  v31 = [(DBInCallWidgetViewController *)self muteButton];
  [v31 setAccessibilityIdentifier:@"MuteButton"];

  v32 = [[DBInCallWidgetButton alloc] initWithButtonType:0];
  [(DBInCallWidgetButton *)v32 addTarget:self action:sel_buttonTapped_ forControlEvents:0x2000];
  v33 = [(DBWidgetViewController *)self contentView];
  [v33 addSubview:v32];

  [(DBInCallWidgetViewController *)self setEndCallButton:v32];
  v34 = [(DBInCallWidgetViewController *)self endCallButton];
  [v34 setAccessibilityIdentifier:@"EndCallButton"];

  v35 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setLeftButtonGuide:v35];

  v36 = [(DBWidgetViewController *)self contentView];
  v37 = [(DBInCallWidgetViewController *)self leftButtonGuide];
  [v36 addLayoutGuide:v37];

  v38 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setMidButtonGuide:v38];

  v39 = [(DBWidgetViewController *)self contentView];
  v40 = [(DBInCallWidgetViewController *)self midButtonGuide];
  [v39 addLayoutGuide:v40];

  v41 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setRightButtonGuide:v41];

  v42 = [(DBWidgetViewController *)self contentView];
  v43 = [(DBInCallWidgetViewController *)self rightButtonGuide];
  [v42 addLayoutGuide:v43];

  v44 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setLabelContainerGuide:v44];

  v45 = [(DBWidgetViewController *)self contentView];
  v46 = [(DBInCallWidgetViewController *)self labelContainerGuide];
  [v45 addLayoutGuide:v46];

  v47 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setTopRowGuide:v47];

  v48 = [(DBWidgetViewController *)self contentView];
  v49 = [(DBInCallWidgetViewController *)self topRowGuide];
  [v48 addLayoutGuide:v49];

  v50 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setMidTopRowGuide:v50];

  v51 = [(DBWidgetViewController *)self contentView];
  v52 = [(DBInCallWidgetViewController *)self midTopRowGuide];
  [v51 addLayoutGuide:v52];

  v53 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setMidBottomGuide:v53];

  v54 = [(DBWidgetViewController *)self contentView];
  v55 = [(DBInCallWidgetViewController *)self midBottomGuide];
  [v54 addLayoutGuide:v55];

  v56 = objc_opt_new();
  [(DBInCallWidgetViewController *)self setBottomRowGuide:v56];

  v57 = [(DBWidgetViewController *)self contentView];
  v58 = [(DBInCallWidgetViewController *)self bottomRowGuide];
  [v57 addLayoutGuide:v58];

  [(DBInCallWidgetViewController *)self setupConstraints];
  [(DBInCallWidgetViewController *)self handleCallStatusChanged];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)DBInCallWidgetViewController;
  [(DBInCallWidgetViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(DBWidgetViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 != *MEMORY[0x263F001B0] || v7 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(DBInCallWidgetViewController *)self lastViewSize];
    BOOL v11 = v10 == v5 && v9 == v7;
    if (!v11 && ![(DBWidgetViewController *)self isHidden])
    {
      -[DBInCallWidgetViewController setLastViewSize:](self, "setLastViewSize:", v5, v7);
      if (v7 >= 136.0)
      {
        uint64_t v12 = 4;
      }
      else if (v5 >= 265.0)
      {
        uint64_t v12 = 3;
      }
      else if (v5 < 212.0)
      {
        uint64_t v12 = 1;
      }
      else
      {
        uint64_t v12 = 2;
      }
      [(DBInCallWidgetViewController *)self setWidgetStyle:v12];
      [(DBInCallWidgetViewController *)self setupConstraints];
      [(DBInCallWidgetViewController *)self updateLabelsForCurrentStyle];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBInCallWidgetViewController;
  [(DBInCallWidgetViewController *)&v4 viewDidAppear:a3];
  [(DBInCallWidgetViewController *)self _updateUIForCallState];
}

- (void)setupConstraints
{
  v353 = [(DBInCallWidgetViewController *)self avatarButton];
  v3 = [(DBInCallWidgetViewController *)self appIconButton];
  objc_super v4 = [(DBInCallWidgetViewController *)self contactNameLabel];
  double v5 = [(DBInCallWidgetViewController *)self callTimeLabel];
  double v6 = [(DBInCallWidgetViewController *)self muteButton];
  double v7 = [(DBInCallWidgetViewController *)self endCallButton];
  v348 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
  v344 = [(DBInCallWidgetViewController *)self leftButtonGuide];
  v345 = [(DBInCallWidgetViewController *)self midButtonGuide];
  v343 = [(DBInCallWidgetViewController *)self rightButtonGuide];
  v342 = [(DBInCallWidgetViewController *)self labelContainerGuide];
  v8 = [(DBInCallWidgetViewController *)self topRowGuide];
  v341 = [(DBInCallWidgetViewController *)self midTopRowGuide];
  v340 = [(DBInCallWidgetViewController *)self midBottomGuide];
  v352 = [(DBInCallWidgetViewController *)self bottomRowGuide];
  [v353 setTranslatesAutoresizingMaskIntoConstraints:0];
  v350 = v4;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v351 = v6;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v349 = v7;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = [(DBInCallWidgetViewController *)self constraints];

  unint64_t v10 = 0x263F08000uLL;
  if (v9)
  {
    BOOL v11 = (void *)MEMORY[0x263F08938];
    uint64_t v12 = [(DBInCallWidgetViewController *)self constraints];
    [v11 deactivateConstraints:v12];

    [(DBInCallWidgetViewController *)self setConstraints:0];
  }
  objc_super v13 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];

  if (v13)
  {
    v14 = [(DBWidgetViewController *)self contentView];
    v15 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];
    [v14 removeLayoutGuide:v15];

    [(DBInCallWidgetViewController *)self setTopFocusContainerGuide:0];
  }
  v16 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];

  if (v16)
  {
    v17 = [(DBWidgetViewController *)self contentView];
    v18 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];
    [v17 removeLayoutGuide:v18];

    [(DBInCallWidgetViewController *)self setBottomFocusContainerGuide:0];
  }
  v19 = [(DBInCallWidgetViewController *)self multiwayLabelFocusContainerGuide];

  if (v19)
  {
    v20 = [(DBWidgetViewController *)self contentView];
    v21 = [(DBInCallWidgetViewController *)self multiwayLabelFocusContainerGuide];
    [v20 removeLayoutGuide:v21];

    [(DBInCallWidgetViewController *)self setMultiwayLabelFocusContainerGuide:0];
  }
  v22 = objc_opt_new();
  unint64_t v23 = [(DBInCallWidgetViewController *)self widgetStyle];
  if (v23 == 4)
  {
    v24 = objc_opt_new();
    v339 = objc_opt_new();
    v25 = [v8 leadingAnchor];
    [(DBWidgetViewController *)self contentView];
    v27 = v26 = v5;
    v28 = [v27 leadingAnchor];
    [v25 constraintEqualToAnchor:v28];
    v30 = v29 = v8;
    [v24 addObject:v30];

    v31 = [v29 trailingAnchor];
    v32 = [(DBWidgetViewController *)self contentView];
    v33 = [v32 trailingAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    [v24 addObject:v34];

    v35 = [v29 topAnchor];
    v36 = [(DBWidgetViewController *)self contentView];
    v37 = [v36 topAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    [v24 addObject:v38];

    v336 = v29;
    v39 = [v29 heightAnchor];
    v40 = [v352 heightAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 multiplier:1.0];
    [v24 addObject:v41];

    v42 = [v353 centerXAnchor];
    v43 = [(DBWidgetViewController *)self contentView];
    v44 = [v43 centerXAnchor];
    v45 = [v42 constraintEqualToAnchor:v44];
    [v24 addObject:v45];

    v46 = [v353 topAnchor];
    v47 = [(DBInCallWidgetViewController *)self topRowGuide];
    v48 = [v47 bottomAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:4.0];
    [v24 addObject:v49];

    [v3 setHidden:1];
    v50 = [v341 leadingAnchor];
    v51 = [(DBWidgetViewController *)self contentView];
    v52 = [v51 leadingAnchor];
    v53 = [v50 constraintEqualToAnchor:v52];
    [v22 addObject:v53];

    v54 = [v341 trailingAnchor];
    v55 = [(DBWidgetViewController *)self contentView];
    v56 = [v55 trailingAnchor];
    v57 = [v54 constraintEqualToAnchor:v56];
    [v22 addObject:v57];

    v58 = [v341 heightAnchor];
    v59 = [v352 heightAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 multiplier:1.0];
    [v22 addObject:v60];

    v61 = [v341 topAnchor];
    objc_super v62 = [v353 bottomAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    [v24 addObject:v63];

    v64 = [v341 topAnchor];
    v65 = [(DBWidgetViewController *)self contentView];
    v66 = [v65 topAnchor];
    v67 = [v64 constraintEqualToAnchor:v66];
    [v339 addObject:v67];

    v68 = [v342 leadingAnchor];
    v69 = [(DBWidgetViewController *)self contentView];
    v70 = [v69 leadingAnchor];
    v71 = [v68 constraintEqualToAnchor:v70 constant:12.0];
    [v22 addObject:v71];

    v72 = [v342 trailingAnchor];
    v73 = [(DBWidgetViewController *)self contentView];
    v74 = [v73 trailingAnchor];
    v75 = [v72 constraintEqualToAnchor:v74 constant:-12.0];
    [v22 addObject:v75];

    v76 = [v342 topAnchor];
    v77 = [v341 bottomAnchor];
    v78 = [v76 constraintEqualToAnchor:v77];
    [v22 addObject:v78];

    v79 = [v350 leadingAnchor];
    v80 = [v342 leadingAnchor];
    v81 = [v79 constraintEqualToAnchor:v80];
    [v24 addObject:v81];

    v82 = [v350 trailingAnchor];
    v83 = [v342 trailingAnchor];
    v84 = [v82 constraintEqualToAnchor:v83];
    [v24 addObject:v84];

    v85 = [v350 topAnchor];
    v86 = [v342 topAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    [v24 addObject:v87];

    [v350 setHidden:0];
    v88 = [v26 leadingAnchor];
    v89 = [v342 leadingAnchor];
    v90 = [v88 constraintEqualToAnchor:v89];
    [v22 addObject:v90];

    v91 = [v26 trailingAnchor];
    v92 = [v342 trailingAnchor];
    v93 = [v91 constraintEqualToAnchor:v92];
    [v22 addObject:v93];

    v94 = [v26 bottomAnchor];
    v95 = [v342 bottomAnchor];
    v96 = [v94 constraintEqualToAnchor:v95];
    [v22 addObject:v96];

    v97 = [v26 firstBaselineAnchor];
    v98 = [v350 lastBaselineAnchor];
    v99 = [v97 constraintEqualToAnchor:v98 constant:14.0];
    [v22 addObject:v99];

    v100 = [v26 firstBaselineAnchor];
    v101 = [v348 bottomAnchor];
    v102 = [v100 constraintEqualToAnchor:v101 constant:14.0];
    [v22 addObject:v102];

    v338 = v26;
    [v26 setHidden:0];
    v103 = [v348 leadingAnchor];
    v104 = [v342 leadingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    [v339 addObject:v105];

    v106 = [v348 trailingAnchor];
    v107 = [v342 trailingAnchor];
    v108 = [v106 constraintEqualToAnchor:v107];
    [v339 addObject:v108];

    v109 = [v348 topAnchor];
    v110 = [v342 topAnchor];
    v111 = [v109 constraintEqualToSystemSpacingBelowAnchor:v110 multiplier:1.0];
    [v339 addObject:v111];

    v112 = [v340 leadingAnchor];
    v113 = [(DBWidgetViewController *)self contentView];
    v114 = [v113 leadingAnchor];
    v115 = [v112 constraintEqualToAnchor:v114];
    [v22 addObject:v115];

    v116 = [v340 trailingAnchor];
    v117 = [(DBWidgetViewController *)self contentView];
    v118 = [v117 trailingAnchor];
    v119 = [v116 constraintEqualToAnchor:v118];
    [v22 addObject:v119];

    v120 = [v340 topAnchor];
    v121 = [v342 bottomAnchor];
    v122 = [v120 constraintEqualToAnchor:v121];
    [v22 addObject:v122];

    v123 = [v340 heightAnchor];
    v124 = [v352 heightAnchor];
    v125 = [v123 constraintEqualToAnchor:v124 multiplier:1.0];
    [v22 addObject:v125];

    v126 = [v344 leadingAnchor];
    v127 = [(DBWidgetViewController *)self contentView];
    v128 = [v127 leadingAnchor];
    v129 = [v126 constraintEqualToAnchor:v128];
    [v22 addObject:v129];

    v130 = [v344 trailingAnchor];
    v131 = [v351 leadingAnchor];
    v132 = [v130 constraintEqualToAnchor:v131 constant:4.0];
    [v22 addObject:v132];

    v133 = [v344 topAnchor];
    v134 = [v351 topAnchor];
    v135 = [v133 constraintEqualToAnchor:v134];
    [v22 addObject:v135];

    v136 = [v344 bottomAnchor];
    v137 = [v351 bottomAnchor];
    v138 = [v136 constraintEqualToAnchor:v137];
    [v22 addObject:v138];

    v139 = [v351 topAnchor];
    v140 = [v340 bottomAnchor];
    v141 = [v139 constraintEqualToAnchor:v140];
    [v22 addObject:v141];

    v142 = [v351 trailingAnchor];
    v143 = [v345 leadingAnchor];
    v144 = [v142 constraintEqualToAnchor:v143 constant:4.0];
    [v22 addObject:v144];

    [v351 setHidden:0];
    v145 = [v345 trailingAnchor];
    v146 = [v349 leadingAnchor];
    v147 = [v145 constraintEqualToAnchor:v146 constant:4.0];
    [v22 addObject:v147];

    v148 = [v345 widthAnchor];
    v149 = [v344 widthAnchor];
    v150 = [v148 constraintEqualToAnchor:v149];
    [v22 addObject:v150];

    v151 = [v345 topAnchor];
    v152 = [v344 topAnchor];
    v153 = [v151 constraintEqualToAnchor:v152];
    [v22 addObject:v153];

    v154 = [v345 bottomAnchor];
    v155 = [v344 bottomAnchor];
    v156 = [v154 constraintEqualToAnchor:v155];
    [v22 addObject:v156];

    v157 = [v349 bottomAnchor];
    v158 = [v351 bottomAnchor];
    v159 = [v157 constraintEqualToAnchor:v158];
    [v22 addObject:v159];

    v160 = [v349 trailingAnchor];
    v161 = [v343 leadingAnchor];
    v162 = [v160 constraintEqualToAnchor:v161 constant:4.0];
    [v22 addObject:v162];

    [v349 setHidden:0];
    v163 = [v343 trailingAnchor];
    v164 = [(DBWidgetViewController *)self contentView];
    v165 = [v164 trailingAnchor];
    v166 = [v163 constraintEqualToAnchor:v165];
    [v22 addObject:v166];

    v167 = [v343 widthAnchor];
    v168 = [v344 widthAnchor];
    v169 = [v167 constraintEqualToAnchor:v168];
    [v22 addObject:v169];

    v170 = [v343 topAnchor];
    v171 = [v344 topAnchor];
    v172 = [v170 constraintEqualToAnchor:v171];
    [v22 addObject:v172];

    v173 = [v343 bottomAnchor];
    v174 = [v344 bottomAnchor];
    v175 = [v173 constraintEqualToAnchor:v174];
    [v22 addObject:v175];

    v176 = [v352 leadingAnchor];
    v177 = [(DBWidgetViewController *)self contentView];
    v178 = [v177 leadingAnchor];
    v179 = [v176 constraintEqualToAnchor:v178];
    [v22 addObject:v179];

    v180 = [v352 trailingAnchor];
    v181 = [(DBWidgetViewController *)self contentView];
    v182 = [v181 trailingAnchor];
    v183 = [v180 constraintEqualToAnchor:v182];
    [v22 addObject:v183];

    v184 = [v352 topAnchor];
    v185 = v3;
    v186 = [v351 bottomAnchor];
    v187 = [v184 constraintEqualToAnchor:v186];
    [v22 addObject:v187];

    v188 = [v352 bottomAnchor];
    v189 = [(DBWidgetViewController *)self contentView];
    v190 = [v189 bottomAnchor];
    v191 = [v188 constraintEqualToAnchor:v190 constant:-4.0];
    [v22 addObject:v191];

    [(DBInCallWidgetViewController *)self setTallNonMultiwayConstraints:v24];
    [(DBInCallWidgetViewController *)self setTallMultiwayOnlyConstraints:v339];
    [v22 addObjectsFromArray:v24];
    v192 = [(DBInCallWidgetViewController *)self traitCollection];
    uint64_t v193 = [v192 primaryInteractionModel];

    if (v193 == 8)
    {
      v194 = objc_opt_new();
      [(DBInCallWidgetViewController *)self setTopFocusContainerGuide:v194];

      v195 = [(DBWidgetViewController *)self contentView];
      v196 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];
      [v195 addLayoutGuide:v196];

      v197 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];
      v198 = [v197 leadingAnchor];
      v199 = [(DBWidgetViewController *)self contentView];
      v200 = [v199 leadingAnchor];
      v201 = [v198 constraintEqualToAnchor:v200];
      [v22 addObject:v201];

      v202 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];
      v203 = [v202 trailingAnchor];
      v204 = [(DBWidgetViewController *)self contentView];
      v205 = [v204 trailingAnchor];
      v206 = [v203 constraintEqualToAnchor:v205];
      [v22 addObject:v206];

      v207 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];
      v208 = [v207 topAnchor];
      v209 = [v353 topAnchor];
      v210 = [v208 constraintEqualToAnchor:v209];
      [v22 addObject:v210];

      v211 = [(DBInCallWidgetViewController *)self topFocusContainerGuide];
      v212 = [v211 bottomAnchor];
      v213 = [v353 bottomAnchor];
      v214 = [v212 constraintEqualToAnchor:v213];
      [v22 addObject:v214];

      v215 = objc_opt_new();
      [(DBInCallWidgetViewController *)self setBottomFocusContainerGuide:v215];

      v216 = [(DBWidgetViewController *)self contentView];
      v217 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];
      [v216 addLayoutGuide:v217];

      v218 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];
      v219 = [v218 leadingAnchor];
      v220 = [(DBWidgetViewController *)self contentView];
      v221 = [v220 leadingAnchor];
      v222 = [v219 constraintEqualToAnchor:v221];
      [v22 addObject:v222];

      v223 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];
      v224 = [v223 trailingAnchor];
      v225 = [(DBWidgetViewController *)self contentView];
      v226 = [v225 trailingAnchor];
      v227 = [v224 constraintEqualToAnchor:v226];
      [v22 addObject:v227];

      v228 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];
      v229 = [v228 topAnchor];
      v230 = [v351 topAnchor];
      v231 = [v229 constraintEqualToAnchor:v230];
      [v22 addObject:v231];

      v232 = [(DBInCallWidgetViewController *)self bottomFocusContainerGuide];
      v233 = [v232 bottomAnchor];
      v234 = [v351 bottomAnchor];
      v235 = [v233 constraintEqualToAnchor:v234];
      [v22 addObject:v235];

      v185 = v3;
    }

    v8 = v336;
    double v5 = v338;
    v236 = v345;
    v237 = v341;
    goto LABEL_20;
  }
  unint64_t v238 = v23;
  if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v337 = v8;
    v239 = [v353 leadingAnchor];
    v240 = [(DBWidgetViewController *)self contentView];
    v241 = [v240 leadingAnchor];
    v242 = [v239 constraintEqualToAnchor:v241 constant:9.0];
    [v22 addObject:v242];

    v243 = [v353 centerYAnchor];
    v244 = [(DBWidgetViewController *)self contentView];
    v245 = [v244 centerYAnchor];
    v246 = [v243 constraintEqualToAnchor:v245];
    [v22 addObject:v246];

    [v353 setHidden:0];
    v247 = [v3 leadingAnchor];
    v248 = [v353 leadingAnchor];
    v249 = [v247 constraintEqualToAnchor:v248];
    [v22 addObject:v249];

    v250 = [v3 trailingAnchor];
    v251 = [v353 trailingAnchor];
    v252 = [v250 constraintEqualToAnchor:v251 constant:-1.0];
    [v22 addObject:v252];

    v253 = [v3 topAnchor];
    v254 = [v353 topAnchor];
    v255 = [v253 constraintEqualToAnchor:v254];
    [v22 addObject:v255];

    v256 = [v3 bottomAnchor];
    v257 = [v353 bottomAnchor];
    v258 = [v256 constraintEqualToAnchor:v257 constant:-1.0];
    [v22 addObject:v258];

    v346 = v3;
    [v3 setHidden:0];
    if (v238 == 3)
    {
      v259 = [v350 firstBaselineAnchor];
      v260 = [v353 topAnchor];
      v261 = [v259 constraintEqualToAnchor:v260 constant:21.0];
      [v22 addObject:v261];

      v262 = [v350 leadingAnchor];
      v263 = [v353 trailingAnchor];
      v264 = [v262 constraintEqualToAnchor:v263 constant:3.0];
      [v22 addObject:v264];

      v265 = [v350 trailingAnchor];
      v266 = [v6 leadingAnchor];
      v267 = [v265 constraintEqualToAnchor:v266 constant:-4.0];
      [v22 addObject:v267];

      [v350 setHidden:0];
      [v348 setHidden:1];
      v268 = v5;
      v269 = [v5 firstBaselineAnchor];
      v270 = [v350 lastBaselineAnchor];
      v271 = [v269 constraintEqualToAnchor:v270 constant:17.0];
      [v22 addObject:v271];

      v272 = [v5 leadingAnchor];
      v273 = [v350 leadingAnchor];
      v274 = [v272 constraintEqualToAnchor:v273];
      [v22 addObject:v274];

      v275 = [v5 trailingAnchor];
      v276 = [v350 trailingAnchor];
      [v275 constraintEqualToAnchor:v276];
    }
    else
    {
      [v350 setHidden:1];
      [v348 setHidden:1];
      v268 = v5;
      v313 = [v5 centerYAnchor];
      v314 = [(DBWidgetViewController *)self contentView];
      v315 = [v314 centerYAnchor];
      v316 = [v313 constraintEqualToAnchor:v315];
      [v22 addObject:v316];

      v317 = [v5 leadingAnchor];
      v318 = [v353 trailingAnchor];
      v319 = [v317 constraintEqualToAnchor:v318 constant:3.0];
      [v22 addObject:v319];

      v275 = [v5 trailingAnchor];
      v276 = [v6 leadingAnchor];
      [v275 constraintEqualToAnchor:v276 constant:-4.0];
    v320 = };
    v237 = v341;
    [v22 addObject:v320];

    [v268 setHidden:0];
    v321 = [v349 leadingAnchor];
    v322 = [v6 trailingAnchor];
    v323 = [v321 constraintEqualToAnchor:v322 constant:5.0];
    [v22 addObject:v323];

    v324 = [v6 centerYAnchor];
    v325 = [(DBWidgetViewController *)self contentView];
    v326 = [v325 centerYAnchor];
    v327 = [v324 constraintEqualToAnchor:v326];
    [v22 addObject:v327];

    [v6 setHidden:0];
    v328 = [(DBWidgetViewController *)self contentView];
    v329 = [v328 trailingAnchor];
    v330 = [v349 trailingAnchor];
    v331 = [v329 constraintEqualToAnchor:v330 constant:9.0];
    [v22 addObject:v331];

    v332 = [v349 centerYAnchor];
    v333 = [(DBWidgetViewController *)self contentView];
    v334 = [v333 centerYAnchor];
    v335 = [v332 constraintEqualToAnchor:v334];
    [v22 addObject:v335];

    [v349 setHidden:0];
    v236 = v345;
    v185 = v346;
    double v5 = v268;
    v8 = v337;
LABEL_20:
    unint64_t v10 = 0x263F08000uLL;
    goto LABEL_21;
  }
  v236 = v345;
  v185 = v3;
  v237 = v341;
  if (v23 == 1)
  {
    v277 = [v353 leadingAnchor];
    [(DBWidgetViewController *)self contentView];
    v278 = v347 = v185;
    v279 = [v278 leadingAnchor];
    v280 = [v277 constraintEqualToAnchor:v279 constant:9.0];
    [v22 addObject:v280];

    v281 = [v353 centerYAnchor];
    v282 = [(DBWidgetViewController *)self contentView];
    v283 = [v282 centerYAnchor];
    v284 = [v281 constraintEqualToAnchor:v283];
    [v22 addObject:v284];

    [v353 setHidden:0];
    v285 = [v347 leadingAnchor];
    v286 = [v353 leadingAnchor];
    v287 = [v285 constraintEqualToAnchor:v286];
    [v22 addObject:v287];

    v288 = [v347 trailingAnchor];
    v289 = [v353 trailingAnchor];
    v290 = [v288 constraintEqualToAnchor:v289 constant:-1.0];
    [v22 addObject:v290];

    v291 = [v347 topAnchor];
    v292 = [v353 topAnchor];
    v293 = [v291 constraintEqualToAnchor:v292];
    [v22 addObject:v293];

    v294 = [v347 bottomAnchor];
    v295 = [v353 bottomAnchor];
    v296 = [v294 constraintEqualToAnchor:v295 constant:-1.0];
    [v22 addObject:v296];

    [v347 setHidden:0];
    [v350 setHidden:1];
    [v348 setHidden:1];
    [v5 setHidden:1];
    v297 = [v6 centerXAnchor];
    v298 = [(DBWidgetViewController *)self contentView];
    v299 = [v298 centerXAnchor];
    v300 = [v297 constraintEqualToAnchor:v299];
    [v22 addObject:v300];

    v301 = [v6 centerYAnchor];
    v302 = [(DBWidgetViewController *)self contentView];
    v303 = [v302 centerYAnchor];
    v304 = [v301 constraintEqualToAnchor:v303];
    [v22 addObject:v304];

    [v6 setHidden:0];
    v305 = [(DBWidgetViewController *)self contentView];
    v306 = [v305 trailingAnchor];
    v307 = [v349 trailingAnchor];
    v308 = [v306 constraintEqualToAnchor:v307 constant:9.0];
    [v22 addObject:v308];

    v309 = [v349 centerYAnchor];
    v310 = [(DBWidgetViewController *)self contentView];
    v311 = [v310 centerYAnchor];
    v312 = [v309 constraintEqualToAnchor:v311];
    [v22 addObject:v312];

    unint64_t v10 = 0x263F08000;
    v185 = v347;

    v236 = v345;
    [v349 setHidden:0];
  }
LABEL_21:
  [*(id *)(v10 + 2360) activateConstraints:v22];
  [(DBInCallWidgetViewController *)self setConstraints:v22];
}

- (void)updateLabelsForCurrentStyle
{
  BOOL v3 = [(DBInCallWidgetViewController *)self _shouldUseMultilineTitleButton];
  if ([(DBInCallWidgetViewController *)self widgetStyle] == 4)
  {
    objc_super v4 = [(DBInCallWidgetViewController *)self contactNameLabel];
    [v4 setTextAlignment:1];

    double v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83588] variant:1280];
    double v6 = [(DBInCallWidgetViewController *)self contactNameLabel];
    [v6 setFont:v5];

    double v7 = [(DBInCallWidgetViewController *)self callTimeLabel];
    [v7 setTextAlignment:1];

    v8 = [(DBInCallWidgetViewController *)self contactNameLabel];
    [v8 setHidden:v3];

    double v9 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
    [v9 setHidden:v3 ^ 1];

    unint64_t v10 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
    uint64_t v11 = [v10 isHidden] ^ 1;
    uint64_t v12 = [(DBInCallWidgetViewController *)self avatarButton];
    [v12 setHidden:v11];

    if (v3)
    {
      id v22 = [(DBInCallWidgetViewController *)self tallMultiwayOnlyConstraints];
      [(DBInCallWidgetViewController *)self tallNonMultiwayConstraints];
    }
    else
    {
      id v22 = [(DBInCallWidgetViewController *)self tallNonMultiwayConstraints];
      [(DBInCallWidgetViewController *)self tallMultiwayOnlyConstraints];
    v19 = };
    [MEMORY[0x263F08938] deactivateConstraints:v19];
    [MEMORY[0x263F08938] activateConstraints:v22];
    v20 = [(DBInCallWidgetViewController *)self constraints];
    v21 = (void *)[v20 mutableCopy];

    [v21 removeObjectsInArray:v19];
    [v21 addObjectsFromArray:v22];
    [(DBInCallWidgetViewController *)self setConstraints:v21];
  }
  else
  {
    objc_super v13 = [(DBInCallWidgetViewController *)self appIconButton];
    [v13 setHidden:v3 ^ 1];

    v14 = [(DBInCallWidgetViewController *)self avatarButton];
    [v14 setHidden:v3];

    v15 = [(DBInCallWidgetViewController *)self contactNameLabel];
    [v15 setTextAlignment:4];

    v16 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1280];
    v17 = [(DBInCallWidgetViewController *)self contactNameLabel];
    [v17 setFont:v16];

    if ([(DBInCallWidgetViewController *)self widgetStyle] == 3) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = 1;
    }
    id v22 = [(DBInCallWidgetViewController *)self callTimeLabel];
    [v22 setTextAlignment:v18];
  }
}

- (void)buttonTapped:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DBInCallWidgetViewController *)self avatarButton];

  if (v5 == v4)
  {
    uint64_t v12 = DBLogForCategory(2uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v20) = 0;
    objc_super v13 = "In-call widget avatar button selected";
LABEL_15:
    _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 2u);
    goto LABEL_16;
  }
  id v6 = [(DBInCallWidgetViewController *)self appIconButton];

  if (v6 == v4)
  {
    uint64_t v12 = DBLogForCategory(2uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v20) = 0;
    objc_super v13 = "In-call widget app icon button selected";
    goto LABEL_15;
  }
  id v7 = [(DBInCallWidgetViewController *)self multiwayTitleButton];

  if (v7 == v4)
  {
    uint64_t v12 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      objc_super v13 = "In-call widget multiway title button selected";
      goto LABEL_15;
    }
LABEL_16:

    [(DBInCallWidgetViewController *)self widgetViewTapped];
    goto LABEL_17;
  }
  id v8 = [(DBInCallWidgetViewController *)self muteButton];

  if (v8 == v4)
  {
    v14 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "In-call widget mute button selected", (uint8_t *)&v20, 2u);
    }

    v15 = [(DBInCallWidgetViewController *)self currentCall];
    int v16 = [v15 isUplinkMuted];

    v17 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = @"Muting";
      if (v16) {
        uint64_t v18 = @"Unmuting";
      }
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_INFO, "%@ current call", (uint8_t *)&v20, 0xCu);
    }

    v19 = [(DBInCallWidgetViewController *)self currentCall];
    [v19 setUplinkMuted:v16 ^ 1u];

    [(DBInCallWidgetViewController *)self _updateUIForCallState];
  }
  else
  {
    id v9 = [(DBInCallWidgetViewController *)self endCallButton];

    if (v9 == v4)
    {
      unint64_t v10 = DBLogForCategory(2uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "In-call widget end call button selected", (uint8_t *)&v20, 2u);
      }

      uint64_t v11 = [MEMORY[0x263F7E1A0] sharedInstance];
      [v11 disconnectCurrentCallAndActivateHeld];
    }
  }
LABEL_17:
}

- (id)linearFocusItems
{
  v19[3] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(DBInCallWidgetViewController *)self widgetStyle];
  if (v3 - 1 >= 2)
  {
    if (v3 != 4)
    {
      id v6 = [(DBInCallWidgetViewController *)self view];
      v15 = v6;
      objc_super v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
      goto LABEL_11;
    }
    uint64_t v11 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
    int v12 = [v11 isHidden];

    if (v12)
    {
      id v6 = [(DBInCallWidgetViewController *)self avatarButton];
      v19[0] = v6;
      id v7 = [(DBInCallWidgetViewController *)self muteButton];
      v19[1] = v7;
      id v8 = [(DBInCallWidgetViewController *)self endCallButton];
      v19[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v10 = v19;
    }
    else
    {
      id v6 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
      v18[0] = v6;
      id v7 = [(DBInCallWidgetViewController *)self muteButton];
      v18[1] = v7;
      id v8 = [(DBInCallWidgetViewController *)self endCallButton];
      v18[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v10 = v18;
    }
  }
  else
  {
    id v4 = [(DBInCallWidgetViewController *)self appIconButton];
    int v5 = [v4 isHidden];

    if (v5)
    {
      id v6 = [(DBInCallWidgetViewController *)self avatarButton];
      v17[0] = v6;
      id v7 = [(DBInCallWidgetViewController *)self muteButton];
      v17[1] = v7;
      id v8 = [(DBInCallWidgetViewController *)self endCallButton];
      v17[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v10 = v17;
    }
    else
    {
      id v6 = [(DBInCallWidgetViewController *)self appIconButton];
      v16[0] = v6;
      id v7 = [(DBInCallWidgetViewController *)self muteButton];
      v16[1] = v7;
      id v8 = [(DBInCallWidgetViewController *)self endCallButton];
      v16[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v10 = v16;
    }
  }
  objc_super v13 = [v9 arrayWithObjects:v10 count:3];

LABEL_11:
  return v13;
}

- (BOOL)entireWidgetFocusable
{
  return 0;
}

- (void)widgetViewTapped
{
  unint64_t v3 = +[DBApplicationController sharedInstance];
  id v4 = [v3 inCallServiceApplication];

  if (v4)
  {
    int v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting activation of InCallService", v9, 2u);
    }

    id v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
    [(DBMutableWorkspaceStateChangeRequest *)v6 activateStackedApplication:v4];
    id v7 = [(DBWidgetViewController *)self environment];
    id v8 = [v7 workspace];
    [v8 requestStateChange:v6];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DBInCallWidgetViewController;
  -[DBWidgetViewController setHidden:](&v12, sel_setHidden_);
  if (v3)
  {
    int v5 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
    [v5 invalidate];

    [(DBInCallWidgetViewController *)self setCallTimeDisplayLink:0];
  }
  BOOL v6 = !v3;
  id v7 = [(DBInCallWidgetViewController *)self avatarButton];
  [v7 setUserInteractionEnabled:v6];

  id v8 = [(DBInCallWidgetViewController *)self appIconButton];
  [v8 setUserInteractionEnabled:v6];

  id v9 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
  [v9 setUserInteractionEnabled:v6];

  unint64_t v10 = [(DBInCallWidgetViewController *)self muteButton];
  [v10 setUserInteractionEnabled:v6];

  uint64_t v11 = [(DBInCallWidgetViewController *)self endCallButton];
  [v11 setUserInteractionEnabled:v6];
}

- (void)invalidate
{
  BOOL v3 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
  [v3 invalidate];

  [(DBInCallWidgetViewController *)self setCallTimeDisplayLink:0];
  [(DBInCallWidgetViewController *)self setInvalidated:1];
}

- (BOOL)_shouldUseMultilineTitleButton
{
  BOOL v3 = [(DBInCallWidgetViewController *)self currentCall];
  int v4 = [v3 isConferenced];

  if (!v4)
  {
    id v9 = [(DBInCallWidgetViewController *)self currentCall];
    int v10 = [v9 isConversation];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F7E1A0] sharedInstance];
      objc_super v12 = [(DBInCallWidgetViewController *)self currentCall];
      int v5 = [v11 activeConversationForCall:v12];

      if (![v5 isOneToOneModeEnabled])
      {
        v17 = DBLogForCategory(2uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_22D6F0000, v17, OS_LOG_TYPE_INFO, "Using multiline label for multiway FaceTime call.", v21, 2u);
        }

        goto LABEL_17;
      }
    }
    objc_super v13 = [(DBInCallWidgetViewController *)self currentCall];
    v14 = [v13 contactIdentifiers];
    v15 = [v14 firstObject];

    int v5 = DBLogForCategory(2uLL);
    BOOL v16 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v16)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_INFO, "Not using multiline label for call.", v19, 2u);
      }
      BOOL v6 = 0;
      goto LABEL_18;
    }
    if (v16)
    {
      *(_WORD *)buf = 0;
      id v7 = "Using multiline label because call has no stored contact identifier.";
      BOOL v6 = 1;
      id v8 = buf;
      goto LABEL_13;
    }
LABEL_17:
    BOOL v6 = 1;
    goto LABEL_18;
  }
  int v5 = DBLogForCategory(2uLL);
  BOOL v6 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = 0;
    id v7 = "Using multiline label for multiway telephony call.";
    id v8 = (uint8_t *)&v22;
LABEL_13:
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_INFO, v7, v8, 2u);
  }
LABEL_18:

  return v6;
}

- (void)_updateUIForCallState
{
  BOOL v3 = [(DBInCallWidgetViewController *)self currentCall];
  int v4 = [(DBInCallWidgetViewController *)self avatarButton];
  [v4 setCurrentCall:v3];

  int v5 = [(DBInCallWidgetViewController *)self currentCall];
  BOOL v6 = [v5 provider];
  id v7 = [v6 displayAppBundleIdentifier];
  id v8 = [(DBInCallWidgetViewController *)self appIconButton];
  [v8 setApplicationBundleIdentifier:v7];

  id v9 = [(DBInCallWidgetViewController *)self currentCall];
  uint64_t v10 = [v9 isUplinkMuted];

  uint64_t v11 = [(DBInCallWidgetViewController *)self muteButton];
  [v11 setSelected:v10];

  objc_super v12 = [(DBInCallWidgetViewController *)self currentCall];
  id v42 = [(DBInCallWidgetViewController *)self _displayNameForCall:v12];

  objc_super v13 = [(DBInCallWidgetViewController *)self contactNameLabel];
  [v13 setText:v42];

  v14 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
  v15 = [v14 multilineTitleLabel];
  [v15 setText:v42];

  BOOL v16 = [(DBInCallWidgetViewController *)self _shouldUseMultilineTitleButton];
  if ([(DBInCallWidgetViewController *)self widgetStyle] == 4)
  {
    v17 = [(DBInCallWidgetViewController *)self contactNameLabel];
    [v17 setHidden:v16];

    uint64_t v18 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
    [v18 setHidden:v16 ^ 1];

    v19 = [(DBInCallWidgetViewController *)self multiwayTitleButton];
    uint64_t v20 = [v19 isHidden] ^ 1;
    v21 = [(DBInCallWidgetViewController *)self avatarButton];
    [v21 setHidden:v20];

    if (v16)
    {
      __int16 v22 = [(DBInCallWidgetViewController *)self tallMultiwayOnlyConstraints];
      [(DBInCallWidgetViewController *)self tallNonMultiwayConstraints];
    }
    else
    {
      __int16 v22 = [(DBInCallWidgetViewController *)self tallNonMultiwayConstraints];
      [(DBInCallWidgetViewController *)self tallMultiwayOnlyConstraints];
    v24 = };
    [MEMORY[0x263F08938] deactivateConstraints:v24];
    [MEMORY[0x263F08938] activateConstraints:v22];
    v25 = [(DBInCallWidgetViewController *)self constraints];
    v26 = (void *)[v25 mutableCopy];

    [v26 removeObjectsInArray:v24];
    [v26 addObjectsFromArray:v22];
    [(DBInCallWidgetViewController *)self setConstraints:v26];
  }
  else
  {
    unint64_t v23 = [(DBInCallWidgetViewController *)self appIconButton];
    [v23 setHidden:v16 ^ 1];

    __int16 v22 = [(DBInCallWidgetViewController *)self avatarButton];
    [v22 setHidden:v16];
  }

  uint64_t v27 = [(DBInCallWidgetViewController *)self currentCall];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
    if (v29)
    {
    }
    else
    {
      BOOL v30 = [(DBInCallWidgetViewController *)self invalidated];

      if (!v30)
      {
        v35 = [(DBInCallWidgetViewController *)self view];
        v36 = [v35 window];
        v37 = [v36 screen];
        v38 = [v37 displayLinkWithTarget:self selector:sel__displayLinkFired_];
        [(DBInCallWidgetViewController *)self setCallTimeDisplayLink:v38];

        v39 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
        [v39 setPreferredFramesPerSecond:1];

        v40 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
        v41 = [MEMORY[0x263EFF9F0] mainRunLoop];
        [v40 addToRunLoop:v41 forMode:*MEMORY[0x263EFF588]];

        goto LABEL_16;
      }
    }
  }
  v31 = [(DBInCallWidgetViewController *)self currentCall];
  if (v31)
  {
  }
  else
  {
    v32 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];

    if (v32)
    {
      v33 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
      [v33 setPaused:1];

      v34 = [(DBInCallWidgetViewController *)self callTimeDisplayLink];
      [v34 invalidate];

      [(DBInCallWidgetViewController *)self setCallTimeDisplayLink:0];
    }
  }
LABEL_16:
}

- (id)_displayNameForCall:(id)a3
{
  id v3 = a3;
  if ([v3 isConversation])
  {
    int v4 = [MEMORY[0x263F7E1A0] sharedInstance];
    int v5 = [v4 activeConversationForCall:v3];

    BOOL v6 = [v5 displayName];
  }
  else if ([v3 isConferenced])
  {
    id v7 = [MEMORY[0x263F7E1A0] sharedInstance];
    id v8 = [v7 conferenceParticipantCalls];

    unint64_t v9 = [v8 count];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    uint64_t v11 = v10;
    if (v9 >= 3) {
      objc_super v12 = @"PHONE_WIDGET_CALL_TITLE_%@_%@_AND_OTHERS";
    }
    else {
      objc_super v12 = @"PHONE_WIDGET_CALL_TITLE_%@_AND_%@";
    }
    objc_super v13 = [v10 localizedStringForKey:v12 value:&stru_26E13A820 table:@"CarPlayApp"];

    if ((unint64_t)[v8 count] < 2)
    {
      BOOL v6 = [v3 displayName];
    }
    else
    {
      v14 = NSString;
      v15 = [v8 objectAtIndexedSubscript:0];
      BOOL v16 = [v15 displayFirstName];
      v17 = [v8 objectAtIndexedSubscript:1];
      uint64_t v18 = [v17 displayFirstName];
      BOOL v6 = objc_msgSend(v14, "stringWithFormat:", v13, v16, v18);
    }
  }
  else
  {
    BOOL v6 = [v3 displayName];
  }

  return v6;
}

- (void)_displayLinkFired:(id)a3
{
  int v4 = [(DBInCallWidgetViewController *)self currentCall];
  int v5 = [v4 isOnHold];

  if (v5)
  {
    id v9 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    BOOL v6 = [v9 localizedStringForKey:@"PHONE_WIDGET_HOLD" value:&stru_26E13A820 table:@"CarPlayApp"];
  }
  else
  {
    id v7 = [(DBInCallWidgetViewController *)self currentCall];
    id v9 = [v7 callDurationString];

    if ([v9 length]) {
      goto LABEL_6;
    }
    BOOL v6 = @" ";
  }

  id v9 = v6;
LABEL_6:
  id v8 = [(DBInCallWidgetViewController *)self callTimeLabel];
  [v8 setText:v9];
}

- (TUCall)currentCall
{
  return self->_currentCall;
}

- (void)setCurrentCall:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)tallMultiwayOnlyConstraints
{
  return self->_tallMultiwayOnlyConstraints;
}

- (void)setTallMultiwayOnlyConstraints:(id)a3
{
}

- (NSArray)tallNonMultiwayConstraints
{
  return self->_tallNonMultiwayConstraints;
}

- (void)setTallNonMultiwayConstraints:(id)a3
{
}

- (unint64_t)widgetStyle
{
  return self->_widgetStyle;
}

- (void)setWidgetStyle:(unint64_t)a3
{
  self->_widgetStyle = a3;
}

- (CGSize)lastViewSize
{
  double width = self->_lastViewSize.width;
  double height = self->_lastViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastViewSize:(CGSize)a3
{
  self->_lastViewSize = a3;
}

- (DBInCallWidgetAvatarView)avatarButton
{
  return self->_avatarButton;
}

- (void)setAvatarButton:(id)a3
{
}

- (DBInCallWidgetAppIconButton)appIconButton
{
  return self->_appIconButton;
}

- (void)setAppIconButton:(id)a3
{
}

- (UILabel)contactNameLabel
{
  return self->_contactNameLabel;
}

- (void)setContactNameLabel:(id)a3
{
}

- (UILabel)callTimeLabel
{
  return self->_callTimeLabel;
}

- (void)setCallTimeLabel:(id)a3
{
}

- (DBInCallWidgetMultiwayTitleButton)multiwayTitleButton
{
  return self->_multiwayTitleButton;
}

- (void)setMultiwayTitleButton:(id)a3
{
}

- (DBInCallWidgetButton)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
{
}

- (DBInCallWidgetButton)endCallButton
{
  return self->_endCallButton;
}

- (void)setEndCallButton:(id)a3
{
}

- (UIFocusContainerGuide)topFocusContainerGuide
{
  return self->_topFocusContainerGuide;
}

- (void)setTopFocusContainerGuide:(id)a3
{
}

- (UIFocusContainerGuide)bottomFocusContainerGuide
{
  return self->_bottomFocusContainerGuide;
}

- (void)setBottomFocusContainerGuide:(id)a3
{
}

- (UIFocusContainerGuide)multiwayLabelFocusContainerGuide
{
  return self->_multiwayLabelFocusContainerGuide;
}

- (void)setMultiwayLabelFocusContainerGuide:(id)a3
{
}

- (UILayoutGuide)leftButtonGuide
{
  return self->_leftButtonGuide;
}

- (void)setLeftButtonGuide:(id)a3
{
}

- (UILayoutGuide)midButtonGuide
{
  return self->_midButtonGuide;
}

- (void)setMidButtonGuide:(id)a3
{
}

- (UILayoutGuide)rightButtonGuide
{
  return self->_rightButtonGuide;
}

- (void)setRightButtonGuide:(id)a3
{
}

- (UILayoutGuide)labelContainerGuide
{
  return self->_labelContainerGuide;
}

- (void)setLabelContainerGuide:(id)a3
{
}

- (UILayoutGuide)topRowGuide
{
  return self->_topRowGuide;
}

- (void)setTopRowGuide:(id)a3
{
}

- (UILayoutGuide)midTopRowGuide
{
  return self->_midTopRowGuide;
}

- (void)setMidTopRowGuide:(id)a3
{
}

- (UILayoutGuide)midBottomGuide
{
  return self->_midBottomGuide;
}

- (void)setMidBottomGuide:(id)a3
{
}

- (UILayoutGuide)bottomRowGuide
{
  return self->_bottomRowGuide;
}

- (void)setBottomRowGuide:(id)a3
{
}

- (CADisplayLink)callTimeDisplayLink
{
  return self->_callTimeDisplayLink;
}

- (void)setCallTimeDisplayLink:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callTimeDisplayLink, 0);
  objc_storeStrong((id *)&self->_bottomRowGuide, 0);
  objc_storeStrong((id *)&self->_midBottomGuide, 0);
  objc_storeStrong((id *)&self->_midTopRowGuide, 0);
  objc_storeStrong((id *)&self->_topRowGuide, 0);
  objc_storeStrong((id *)&self->_labelContainerGuide, 0);
  objc_storeStrong((id *)&self->_rightButtonGuide, 0);
  objc_storeStrong((id *)&self->_midButtonGuide, 0);
  objc_storeStrong((id *)&self->_leftButtonGuide, 0);
  objc_storeStrong((id *)&self->_multiwayLabelFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_bottomFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_topFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_endCallButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_multiwayTitleButton, 0);
  objc_storeStrong((id *)&self->_callTimeLabel, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_appIconButton, 0);
  objc_storeStrong((id *)&self->_avatarButton, 0);
  objc_storeStrong((id *)&self->_tallNonMultiwayConstraints, 0);
  objc_storeStrong((id *)&self->_tallMultiwayOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_currentCall, 0);
}

@end