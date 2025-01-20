@interface DBNowPlayingWidgetViewController
+ (NSOperationQueue)nowPlayingQueue;
- (BOOL)_isArtworkVisuallyIdenticalForCatalog:(id)a3 andCatalog:(id)a4;
- (BOOL)_isFocusUI;
- (BOOL)_showsBackButton;
- (BOOL)_showsPlayAndNextButtons;
- (BOOL)_showsProgressView;
- (BOOL)_showsTertiaryLabel;
- (BOOL)_showsTextLabels;
- (BOOL)entireWidgetFocusable;
- (BOOL)iOSOwnsMainAudio;
- (BOOL)seeking;
- (BOOL)showArtworkBorder;
- (CAFNowPlayingManager)carNowPlayingManager;
- (CGSize)lastViewSize;
- (CPUINowPlayingSnapshot)lastSnapshot;
- (CPUIProgressView)progressView;
- (DBNowPlayingFocusHighlightButton)backTransportButton;
- (DBNowPlayingFocusHighlightButton)nextTransportButton;
- (DBNowPlayingFocusHighlightButton)playTransportButton;
- (DBNowPlayingObserver)nowPlayingObserver;
- (DBNowPlayingProviding)currentDataSource;
- (DBWidgetFocusRingView)focusRingView;
- (MPArtworkCatalog)currentCatalog;
- (MPArtworkCatalog)nextCatalog;
- (MPArtworkCatalog)previousCatalog;
- (NSArray)layoutGuides;
- (NSArray)widgetConstraints;
- (NSLayoutConstraint)artworkHorizontalConstraint;
- (NSTimer)spinnerTimer;
- (UIActivityIndicatorView)spinner;
- (UIButton)artworkButton;
- (UIEdgeInsets)_imageInsetsForTransportButton:(unint64_t)a3;
- (UIFocusContainerGuide)controlsContainerGuide;
- (UIFocusContainerGuide)focusContainerGuide;
- (UIImage)currentArtwork;
- (UIImage)nextArtwork;
- (UIImage)previousArtwork;
- (UILabel)subtitleLabel;
- (UILabel)tertiaryLabel;
- (UILabel)titleLabel;
- (UILongPressGestureRecognizer)backLongPressRecognizer;
- (UILongPressGestureRecognizer)nextLongPressRecognizer;
- (UIStackView)labelStackView;
- (UIStackView)titleStackView;
- (_TtC9DashBoard16DBMulticastLabel)multicastLabel;
- (double)_heightForArtwork;
- (id)_nowPlayingPlaceholderImage;
- (id)linearFocusItems;
- (int64_t)heldAction;
- (unint64_t)_widgetStyle;
- (void)_cancelHeldAction:(id)a3;
- (void)_carDidTakeMainAudio;
- (void)_iOSDidTakeMainAudio;
- (void)_processArtworks;
- (void)_processArtworksFor:(id)a3 songType:(unint64_t)a4;
- (void)_processLabelsForCurrentlyPlayingSong;
- (void)_processPlaybackControlsForCurrentlyPlayingSong;
- (void)_reloadNowPlayingUpdatingLayout:(BOOL)a3;
- (void)_removeMulticastBadge;
- (void)_resetArtworkAndCatalogForSongType:(unint64_t)a3;
- (void)_respondToHeldAction;
- (void)_reuseCatalog:(id)a3 withArtwork:(id)a4 compareWithCatalog:(id)a5 forSongType:(unint64_t)a6;
- (void)_sendAction:(int64_t)a3 withState:(int64_t)a4;
- (void)_sendHeldAction;
- (void)_setCurrentArtwork:(id)a3 withCatalog:(id)a4;
- (void)_setNotPlaying;
- (void)_setSpinnerVisible:(BOOL)a3;
- (void)_setupPlaceholderArtwork;
- (void)_setupTransportControls;
- (void)_updateAppearanceForWallpaper;
- (void)_updateArtworkBorder;
- (void)_updateArtworkConstraints;
- (void)_updateAudioOwnership;
- (void)_updateButton:(id)a3 withType:(unint64_t)a4 variant:(id)a5;
- (void)_updateProgressView;
- (void)albumArtButtonTapped:(id)a3;
- (void)backButtonLongPress:(id)a3;
- (void)backButtonTouchDown:(id)a3;
- (void)backButtonTouchUp:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)invalidateConstraints;
- (void)nextButtonLongPress:(id)a3;
- (void)nextButtonTouchDown:(id)a3;
- (void)nextButtonTouchUp:(id)a3;
- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4;
- (void)nowPlayingObserver:(id)a3 didChangeNowPlayingApplication:(id)a4;
- (void)playPauseButtonTouchDown:(id)a3;
- (void)playPauseButtonTouchUp:(id)a3;
- (void)setArtworkButton:(id)a3;
- (void)setArtworkHorizontalConstraint:(id)a3;
- (void)setBackLongPressRecognizer:(id)a3;
- (void)setBackTransportButton:(id)a3;
- (void)setCarNowPlayingManager:(id)a3;
- (void)setControlsContainerGuide:(id)a3;
- (void)setCurrentArtwork:(id)a3;
- (void)setCurrentCatalog:(id)a3;
- (void)setCurrentDataSource:(id)a3;
- (void)setFocusContainerGuide:(id)a3;
- (void)setFocusRingView:(id)a3;
- (void)setHeldAction:(int64_t)a3;
- (void)setIOSOwnsMainAudio:(BOOL)a3;
- (void)setLabelStackView:(id)a3;
- (void)setLastSnapshot:(id)a3;
- (void)setLastViewSize:(CGSize)a3;
- (void)setLayoutGuides:(id)a3;
- (void)setMulticastLabel:(id)a3;
- (void)setNextArtwork:(id)a3;
- (void)setNextCatalog:(id)a3;
- (void)setNextLongPressRecognizer:(id)a3;
- (void)setNextTransportButton:(id)a3;
- (void)setNowPlayingObserver:(id)a3;
- (void)setPlayTransportButton:(id)a3;
- (void)setPreviousArtwork:(id)a3;
- (void)setPreviousCatalog:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setShowArtworkBorder:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerTimer:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTertiaryLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleStackView:(id)a3;
- (void)setWidgetConstraints:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAppearanceForWallpaper;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)widgetViewTapped;
@end

@implementation DBNowPlayingWidgetViewController

+ (NSOperationQueue)nowPlayingQueue
{
  if (nowPlayingQueue_onceToken != -1) {
    dispatch_once(&nowPlayingQueue_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)nowPlayingQueue___queue;
  return (NSOperationQueue *)v2;
}

uint64_t __51__DBNowPlayingWidgetViewController_nowPlayingQueue__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)nowPlayingQueue___queue;
  nowPlayingQueue___queue = v0;

  [(id)nowPlayingQueue___queue setName:@"Now Playing Queue"];
  [(id)nowPlayingQueue___queue setMaxConcurrentOperationCount:1];
  v2 = (void *)nowPlayingQueue___queue;
  return [v2 setQualityOfService:25];
}

- (void)viewDidLoad
{
  v142[4] = *MEMORY[0x263EF8340];
  v141.receiver = self;
  v141.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBNowPlayingWidgetViewController *)&v141 viewDidLoad];
  v3 = [(DBNowPlayingWidgetViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CARAppTodayNowPlayingViewWidget"];

  self->_lastViewSize = (CGSize)*MEMORY[0x263F001B0];
  v4 = [DBNowPlayingObserver alloc];
  v5 = [(DBWidgetViewController *)self environment];
  v6 = [v5 environmentConfiguration];
  v7 = [(DBNowPlayingObserver *)v4 initWithEnvironmentConfiguration:v6];
  nowPlayingObserver = self->_nowPlayingObserver;
  self->_nowPlayingObserver = v7;

  v9 = [(DBNowPlayingWidgetViewController *)self nowPlayingObserver];
  [v9 setDelegate:self];

  v10 = [DBWidgetFocusRingView alloc];
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  obj = -[DBWidgetFocusRingView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x263F001A8], v12, v13, v14);
  [(DBWidgetFocusRingView *)obj setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DBWidgetFocusRingView *)obj setHidden:1];
  objc_storeStrong((id *)&self->_focusRingView, obj);
  v15 = [(DBWidgetViewController *)self contentView];
  [v15 addSubview:obj];

  v16 = [MEMORY[0x263F824E8] buttonWithType:0];
  artworkButton = self->_artworkButton;
  self->_artworkButton = v16;

  v18 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  objc_msgSend(v18, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);

  v19 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v19 setContentMode:1];

  v20 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v21 = [v20 imageView];
  [v21 setContentMode:1];

  v22 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v23 addTarget:self action:sel_albumArtButtonTapped_ forControlEvents:64];

  v24 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v24 setAccessibilityIdentifier:@"CARNowPlayingWidgetArtworkButton"];

  v25 = (DBNowPlayingFocusHighlightButton *)objc_opt_new();
  playTransportButton = self->_playTransportButton;
  self->_playTransportButton = v25;

  v27 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v28 setAdjustsImageWhenDisabled:1];

  v29 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  objc_msgSend(v29, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);

  v30 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v30 addTarget:self action:sel_playPauseButtonTouchDown_ forControlEvents:1];

  v31 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v31 addTarget:self action:sel_playPauseButtonTouchUp_ forControlEvents:64];

  v32 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v32 addTarget:self action:sel__cancelHeldAction_ forControlEvents:384];

  v33 = (DBNowPlayingFocusHighlightButton *)objc_opt_new();
  nextTransportButton = self->_nextTransportButton;
  self->_nextTransportButton = v33;

  v35 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v36 setAdjustsImageWhenDisabled:1];

  v37 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v37 setContentMode:1];

  v38 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  objc_msgSend(v38, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);

  v39 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v39 addTarget:self action:sel_nextButtonTouchDown_ forControlEvents:1];

  v40 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v40 addTarget:self action:sel_nextButtonTouchUp_ forControlEvents:64];

  v41 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v41 addTarget:self action:sel__cancelHeldAction_ forControlEvents:384];

  v42 = (DBNowPlayingFocusHighlightButton *)objc_opt_new();
  backTransportButton = self->_backTransportButton;
  self->_backTransportButton = v42;

  v44 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

  v45 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  objc_msgSend(v45, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);

  v46 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v46 setContentMode:1];

  v47 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v47 setAdjustsImageWhenDisabled:1];

  v48 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v48 addTarget:self action:sel_backButtonTouchDown_ forControlEvents:1];

  v49 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v49 addTarget:self action:sel_backButtonTouchUp_ forControlEvents:64];

  v50 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v50 addTarget:self action:sel__cancelHeldAction_ forControlEvents:384];

  v51 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_backButtonLongPress_];
  [(DBNowPlayingWidgetViewController *)self setBackLongPressRecognizer:v51];

  v52 = [(DBNowPlayingWidgetViewController *)self backLongPressRecognizer];
  [v52 setAllowedPressTypes:&unk_26E17EF18];

  v53 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  v54 = [(DBNowPlayingWidgetViewController *)self backLongPressRecognizer];
  [v53 addGestureRecognizer:v54];

  v55 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_nextButtonLongPress_];
  [(DBNowPlayingWidgetViewController *)self setNextLongPressRecognizer:v55];

  v56 = [(DBNowPlayingWidgetViewController *)self nextLongPressRecognizer];
  [v56 setAllowedPressTypes:&unk_26E17EF30];

  v57 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  v58 = [(DBNowPlayingWidgetViewController *)self nextLongPressRecognizer];
  [v57 addGestureRecognizer:v58];

  v59 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x263F82BF8]), "initWithFrame:", v11, v12, v13, v14);
  titleStackView = self->_titleStackView;
  self->_titleStackView = v59;

  [(UIStackView *)self->_titleStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_titleStackView setAxis:0];
  [(UIStackView *)self->_titleStackView setDistribution:2];
  [(UIStackView *)self->_titleStackView setAlignment:3];
  [(UIStackView *)self->_titleStackView setSpacing:4.0];
  v61 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v11, v12, v13, v14);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v61;

  v63 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v63 setTranslatesAutoresizingMaskIntoConstraints:0];

  v64 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  v65 = [MEMORY[0x263F81708] systemFontOfSize:16.0 weight:*MEMORY[0x263F81840]];
  [v64 setFont:v65];

  v66 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  v67 = [MEMORY[0x263F825C8] labelColor];
  [v66 setTextColor:v67];

  v68 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v68 setTextAlignment:1];

  v69 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v69 setNumberOfLines:1];

  v70 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  LODWORD(v71) = 1132068864;
  [v70 setContentCompressionResistancePriority:0 forAxis:v71];

  v72 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  LODWORD(v73) = 1148846080;
  [v72 setContentHuggingPriority:0 forAxis:v73];

  v74 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v74 setAccessibilityIdentifier:@"CARNowPlayingTitle"];

  v75 = [(DBNowPlayingWidgetViewController *)self titleStackView];
  v76 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v75 addArrangedSubview:v76];

  v77 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v11, v12, v13, v14);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v77;

  v79 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v79 setTranslatesAutoresizingMaskIntoConstraints:0];

  v80 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  v81 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81838]];
  [v80 setFont:v81];

  v82 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  v83 = [MEMORY[0x263F825C8] labelColor];
  [v82 setTextColor:v83];

  v84 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v84 setTextAlignment:1];

  v85 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v85 setNumberOfLines:1];

  v86 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v86 setAccessibilityIdentifier:@"CARNowPlayingSubtitle"];

  v87 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v11, v12, v13, v14);
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v87;

  v89 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v89 setTranslatesAutoresizingMaskIntoConstraints:0];

  v90 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  v91 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  v92 = [v91 font];
  [v90 setFont:v92];

  v93 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  v94 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  [v93 setTextColor:v94];

  v95 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v95 setTextAlignment:1];

  v96 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v96 setNumberOfLines:1];

  v97 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v97 setAccessibilityIdentifier:@"CARNowPlayingTertiaryLabel"];

  [(DBNowPlayingWidgetViewController *)self _setupTransportControls];
  [(DBNowPlayingWidgetViewController *)self _setNotPlaying];
  [(DBNowPlayingWidgetViewController *)self _processPlaybackControlsForCurrentlyPlayingSong];
  [(DBNowPlayingWidgetViewController *)self _updateAppearanceForWallpaper];
  v120 = (void *)MEMORY[0x263F08938];
  v136 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  v133 = [v136 leftAnchor];
  v135 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v134 = [v135 imageView];
  v132 = [v134 leftAnchor];
  v131 = [v133 constraintEqualToAnchor:v132 constant:-4.0];
  v142[0] = v131;
  v130 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  v127 = [v130 rightAnchor];
  v129 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v128 = [v129 imageView];
  v126 = [v128 rightAnchor];
  v125 = [v127 constraintEqualToAnchor:v126 constant:4.0];
  v142[1] = v125;
  v124 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  v121 = [v124 topAnchor];
  v123 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v122 = [v123 imageView];
  v98 = [v122 topAnchor];
  v99 = [v121 constraintEqualToAnchor:v98 constant:-4.0];
  v142[2] = v99;
  v100 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  v101 = [v100 bottomAnchor];
  v102 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v103 = [v102 imageView];
  v104 = [v103 bottomAnchor];
  v105 = [v101 constraintEqualToAnchor:v104 constant:4.0];
  v142[3] = v105;
  v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:4];
  [v120 activateConstraints:v106];

  v107 = [MEMORY[0x263F313A0] sharedManager];
  [v107 addNowPlayingObserver:self];
  v108 = [(DBWidgetViewController *)self contentView];
  v109 = [v108 layer];
  [v109 setCreatesCompositingGroup:0];

  v110 = [(DBWidgetViewController *)self contentView];
  v111 = [v110 layer];
  [v111 setAllowsGroupBlending:0];

  v112 = [(DBWidgetViewController *)self environment];
  v113 = [v112 environmentConfiguration];
  LODWORD(v111) = [v113 isVehicleDataSession];

  if (v111)
  {
    objc_initWeak(location, self);
    id v114 = objc_alloc(MEMORY[0x263F30B78]);
    v138[0] = MEMORY[0x263EF8330];
    v138[1] = 3221225472;
    v138[2] = __47__DBNowPlayingWidgetViewController_viewDidLoad__block_invoke;
    v138[3] = &unk_2649B58C0;
    objc_copyWeak(&v139, location);
    v115 = (CAFNowPlayingManager *)[v114 initWithObserver:v138];
    carNowPlayingManager = self->_carNowPlayingManager;
    self->_carNowPlayingManager = v115;

    v117 = [MEMORY[0x263F08A00] defaultCenter];
    [v117 addObserver:self selector:sel__carDidTakeMainAudio name:*MEMORY[0x263F30D90] object:0];

    v118 = [MEMORY[0x263F08A00] defaultCenter];
    [v118 addObserver:self selector:sel__iOSDidTakeMainAudio name:*MEMORY[0x263F30DD0] object:0];

    objc_destroyWeak(&v139);
    objc_destroyWeak(location);
  }
  else
  {
    v119 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_22D6F0000, v119, OS_LOG_TYPE_DEFAULT, "Not a vehicle data session.", (uint8_t *)location, 2u);
    }
  }
  [(DBNowPlayingWidgetViewController *)self _updateAudioOwnership];
}

void __47__DBNowPlayingWidgetViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadNowPlayingUpdatingLayout:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F313A0] sharedManager];
  [v3 removeNowPlayingObserver:self];

  [(CAFNowPlayingManager *)self->_carNowPlayingManager invalidate];
  v4.receiver = self;
  v4.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBNowPlayingWidgetViewController *)&v4 dealloc];
}

- (UIEdgeInsets)_imageInsetsForTransportButton:(unint64_t)a3
{
  v3 = (double *)MEMORY[0x263F834E8];
  objc_super v4 = (double *)(MEMORY[0x263F834E8] + 16);
  v5 = (double *)(MEMORY[0x263F834E8] + 8);
  v6 = (double *)(MEMORY[0x263F834E8] + 24);
  v7 = (double *)((char *)&unk_22D86EF08 + 8 * a3);
  v8 = (double *)((char *)&unk_22D86EF78 + 8 * a3);
  v9 = (double *)((char *)&unk_22D86EF40 + 8 * a3);
  if ((0x6Bu >> a3)) {
    v10 = (double *)((char *)&unk_22D86EF78 + 8 * a3);
  }
  else {
    v10 = (double *)(MEMORY[0x263F834E8] + 24);
  }
  if (((0x6Bu >> a3) & 1) == 0)
  {
    v7 = (double *)MEMORY[0x263F834E8];
    v8 = (double *)(MEMORY[0x263F834E8] + 8);
    v9 = (double *)(MEMORY[0x263F834E8] + 16);
  }
  if (a3 <= 6)
  {
    v6 = v10;
    v3 = v7;
    v5 = v8;
    objc_super v4 = v9;
  }
  double v11 = *v4;
  double v12 = *v5;
  double v13 = *v3;
  double v14 = *v6;
  result.right = v14;
  result.bottom = v11;
  result.left = v12;
  result.top = v13;
  return result;
}

- (double)_heightForArtwork
{
  v3 = [(DBWidgetViewController *)self contentView];
  [v3 frame];
  double Height = CGRectGetHeight(v18);

  if (Height < 1.0) {
    return 40.0;
  }
  if ([(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio])
  {
    v5 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    v6 = [v5 song];

    if (!v6) {
      return 40.0;
    }
  }
  if ([(DBNowPlayingWidgetViewController *)self _widgetStyle] != 2) {
    return 40.0;
  }
  v7 = [(DBWidgetViewController *)self environment];
  v8 = [v7 environmentConfiguration];
  if ([v8 isVehicleDataSession])
  {
    BOOL v9 = [(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio];

    if (!v9) {
      return Height + -4.0 + -8.0 + -56.0;
    }
  }
  else
  {
  }
  double v11 = Height + -18.0;
  if (Height < 200.0) {
    double v11 = Height;
  }
  double v12 = v11 + -76.0;
  BOOL v13 = [(DBNowPlayingWidgetViewController *)self _showsProgressView];
  double v14 = v12 + -3.0;
  if (!v13) {
    double v14 = v12;
  }
  double v15 = v14 + -12.0;
  BOOL v16 = [(DBNowPlayingWidgetViewController *)self _isFocusUI];
  double v17 = v15 + -4.0;
  if (!v16) {
    double v17 = v15;
  }
  return floor(v17);
}

- (BOOL)_showsProgressView
{
  LODWORD(v3) = [(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio];
  if (v3)
  {
    uint64_t v3 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    if (v3)
    {
      objc_super v4 = (void *)v3;
      v5 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v6 = v5;
      if (v5)
      {
        [v5 durationSnapshot];

        if ((_BYTE)v13) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v10 = 0u;
      }
      v7 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v8 = [v7 song];

      if (v8)
      {
        LOBYTE(v3) = [(DBNowPlayingWidgetViewController *)self _showsTextLabels];
        return v3;
      }
LABEL_9:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_showsTextLabels
{
  uint64_t v3 = [(DBWidgetViewController *)self environment];
  objc_super v4 = [v3 environmentConfiguration];
  if ([v4 isVehicleDataSession])
  {
    BOOL v5 = [(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio];

    if (!v5) {
      return 1;
    }
  }
  else
  {
  }
  if ([(DBNowPlayingWidgetViewController *)self _widgetStyle] == 2) {
    return 1;
  }
  v7 = [(DBWidgetViewController *)self contentView];
  [v7 frame];
  if (CGRectGetHeight(v10) >= 100.0)
  {
    v8 = [(DBWidgetViewController *)self contentView];
    [v8 frame];
    BOOL v6 = CGRectGetWidth(v11) >= 160.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_showsPlayAndNextButtons
{
  uint64_t v3 = [(DBWidgetViewController *)self environment];
  objc_super v4 = [v3 environmentConfiguration];
  if ([v4 isVehicleDataSession])
  {
    BOOL v5 = [(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio];

    if (!v5) {
      return 0;
    }
  }
  else
  {
  }
  return 1;
}

- (BOOL)_showsBackButton
{
  uint64_t v3 = [(DBWidgetViewController *)self environment];
  objc_super v4 = [v3 environmentConfiguration];
  if ([v4 isVehicleDataSession])
  {
    BOOL v5 = [(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio];

    if (!v5) {
      return 0;
    }
  }
  else
  {
  }
  if ([(DBNowPlayingWidgetViewController *)self _widgetStyle] == 2
    || [(DBNowPlayingWidgetViewController *)self _showsTextLabels])
  {
    return 1;
  }
  v7 = [(DBWidgetViewController *)self contentView];
  [v7 frame];
  BOOL v6 = CGRectGetWidth(v9) >= 200.0;

  return v6;
}

- (BOOL)_showsTertiaryLabel
{
  uint64_t v3 = [(DBWidgetViewController *)self environment];
  objc_super v4 = [v3 environmentConfiguration];
  if ([v4 isVehicleDataSession]) {
    BOOL v5 = ![(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_setSpinnerVisible:(BOOL)a3
{
  uint64_t v3 = a3;
  v37[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v5 = [(DBNowPlayingWidgetViewController *)self spinner];

    if (!v5)
    {
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:21];
      [(DBNowPlayingWidgetViewController *)self setSpinner:v6];

      v7 = [(DBNowPlayingWidgetViewController *)self spinner];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    unsigned int v35 = v3;
    v8 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Showing spinner.", buf, 2u);
    }

    CGRect v9 = [MEMORY[0x263F825C8] labelColor];
    CGRect v10 = [(DBNowPlayingWidgetViewController *)self spinner];
    [v10 setColor:v9];

    CGRect v11 = [(DBWidgetViewController *)self contentView];
    long long v12 = [(DBNowPlayingWidgetViewController *)self spinner];
    [v11 addSubview:v12];

    v32 = (void *)MEMORY[0x263F08938];
    v34 = [(DBNowPlayingWidgetViewController *)self spinner];
    v33 = [v34 centerXAnchor];
    uint64_t v13 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    double v14 = [v13 centerXAnchor];
    double v15 = [v33 constraintEqualToAnchor:v14];
    v37[0] = v15;
    BOOL v16 = [(DBNowPlayingWidgetViewController *)self spinner];
    double v17 = [v16 centerYAnchor];
    CGRect v18 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v19 = [v18 centerYAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v37[1] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    [v32 activateConstraints:v21];

    v22 = [(DBNowPlayingWidgetViewController *)self spinner];
    [v22 startAnimating];

    uint64_t v3 = v35;
  }
  else
  {
    v23 = [(DBNowPlayingWidgetViewController *)self spinnerTimer];

    if (v23)
    {
      v24 = DBLogForCategory(0xAuLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v24, OS_LOG_TYPE_DEFAULT, "Invalidating spinner timer.", buf, 2u);
      }

      v25 = [(DBNowPlayingWidgetViewController *)self spinnerTimer];
      [v25 invalidate];

      [(DBNowPlayingWidgetViewController *)self setSpinnerTimer:0];
    }
    v26 = [(DBNowPlayingWidgetViewController *)self spinner];

    v27 = DBLogForCategory(0xAuLL);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Hiding spinner.", buf, 2u);
      }

      v29 = [(DBNowPlayingWidgetViewController *)self spinner];
      [v29 stopAnimating];

      v30 = [(DBNowPlayingWidgetViewController *)self spinner];
      [v30 removeFromSuperview];

      [(DBNowPlayingWidgetViewController *)self setSpinner:0];
    }
    else
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Spinner already hidden.", buf, 2u);
      }
    }
  }
  v31 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v31 setHidden:v3];
}

- (BOOL)_isFocusUI
{
  v2 = [(DBWidgetViewController *)self contentView];
  uint64_t v3 = [v2 window];
  objc_super v4 = [v3 windowScene];

  BOOL v5 = [v4 focusSystem];
  LOBYTE(v2) = v5 != 0;

  return (char)v2;
}

- (unint64_t)_widgetStyle
{
  if (![(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio])
  {
    uint64_t v3 = [(DBWidgetViewController *)self environment];
    objc_super v4 = [v3 environmentConfiguration];
    if ([v4 isVehicleDataSession])
    {
      BOOL v5 = [(DBWidgetViewController *)self contentView];
      [v5 frame];
      double Height = CGRectGetHeight(v10);

      if (Height >= 100.0) {
        return 2;
      }
    }
    else
    {
    }
  }
  v8 = [(DBWidgetViewController *)self contentView];
  [v8 frame];
  double v9 = CGRectGetHeight(v11);

  if (v9 < 135.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_updateButton:(id)a3 withType:(unint64_t)a4 variant:(id)a5
{
  id v28 = a3;
  id v8 = a5;
  double v9 = [(DBNowPlayingWidgetViewController *)self traitCollection];
  CGRect v10 = CPUIImageForTransportButton();

  CGRect v11 = [(DBNowPlayingWidgetViewController *)self traitCollection];
  long long v12 = CPUIHighlightedImageForTransportButton();

  [(DBNowPlayingWidgetViewController *)self _imageInsetsForTransportButton:a4];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if ([(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio]
    || ([(DBWidgetViewController *)self environment],
        v21 = objc_claimAutoreleasedReturnValue(),
        [v21 environmentConfiguration],
        v22 = objc_claimAutoreleasedReturnValue(),
        char v23 = [v22 isVehicleDataSession],
        v22,
        v21,
        (v23 & 1) == 0))
  {
    id v25 = [(DBNowPlayingWidgetViewController *)self playTransportButton];

    v26 = v28;
    if (v25 != v28) {
      goto LABEL_7;
    }
    uint64_t v24 = 1;
  }
  else
  {
    uint64_t v24 = 0;
  }
  [v28 setEnabled:v24];
  v26 = v28;
LABEL_7:
  objc_msgSend(v26, "setImageEdgeInsets:", v14, v16, v18, v20);
  [v28 setImage:v10 forState:0];
  [v28 setImage:v12 forState:1];
  v27 = [v28 imageView];
  [v27 setContentsPosition:0];
}

- (void)_setupTransportControls
{
  v435[3] = *MEMORY[0x263EF8340];
  BOOL v3 = [(DBNowPlayingWidgetViewController *)self _showsProgressView];
  BOOL v4 = [(DBNowPlayingWidgetViewController *)self _showsTextLabels];
  BOOL v5 = [(DBNowPlayingWidgetViewController *)self _showsBackButton];
  BOOL v6 = [(DBNowPlayingWidgetViewController *)self _showsPlayAndNextButtons];
  BOOL v7 = [(DBNowPlayingWidgetViewController *)self _showsTertiaryLabel];
  unint64_t v8 = [(DBNowPlayingWidgetViewController *)self _widgetStyle];
  v419 = [MEMORY[0x263EFF980] array];
  [(DBNowPlayingWidgetViewController *)self invalidateConstraints];
  double v9 = [(DBNowPlayingWidgetViewController *)self labelStackView];
  CGRect v10 = [v9 arrangedSubviews];
  objc_msgSend(v10, "bs_each:", &__block_literal_global_216);

  CGRect v11 = [(DBNowPlayingWidgetViewController *)self labelStackView];
  [v11 removeFromSuperview];

  progressView = self->_progressView;
  if (v3)
  {
    if (!progressView)
    {
      id v13 = objc_alloc(MEMORY[0x263F313B8]);
      double v14 = (CPUIProgressView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      double v15 = self->_progressView;
      self->_progressView = v14;

      [(CPUIProgressView *)self->_progressView setShowsProgressLabels:0];
      [(CPUIProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(DBNowPlayingWidgetViewController *)self _updateProgressView];
    }
    double v16 = [(DBWidgetViewController *)self contentView];
    [v16 addSubview:self->_progressView];

    double v17 = self->_progressView;
    lastSnapshot = self->_lastSnapshot;
    if (lastSnapshot)
    {
      [(CPUINowPlayingSnapshot *)lastSnapshot durationSnapshot];
    }
    else
    {
      uint64_t v422 = 0;
      memset(v421, 0, sizeof(v421));
    }
    [(CPUIProgressView *)v17 setDurationSnapshot:v421];
  }
  else
  {
    [(CPUIProgressView *)progressView removeFromSuperview];
  }
  double v19 = [(DBWidgetViewController *)self contentView];
  double v20 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v19 addSubview:v20];

  v21 = [(DBWidgetViewController *)self contentView];
  v22 = [(DBNowPlayingWidgetViewController *)self titleStackView];
  [v21 addSubview:v22];

  char v23 = [(DBWidgetViewController *)self contentView];
  uint64_t v24 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v23 addSubview:v24];

  if (v7)
  {
    id v25 = [(DBWidgetViewController *)self contentView];
    v26 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [v25 addSubview:v26];
  }
  else
  {
    id v25 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [v25 removeFromSuperview];
  }

  if ([MEMORY[0x263F82E00] _isInAnimationBlock])
  {
    v420[0] = MEMORY[0x263EF8330];
    v420[1] = 3221225472;
    v420[2] = __59__DBNowPlayingWidgetViewController__setupTransportControls__block_invoke_2;
    v420[3] = &unk_2649B3E90;
    v420[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v420];
    v27 = [(DBNowPlayingWidgetViewController *)self titleLabel];
    [v27 setAlpha:1.0];

    id v28 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [v28 setAlpha:1.0];

    v29 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [v29 setAlpha:1.0];
  }
  v30 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];

  if (!v30)
  {
    v31 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F82740]);
    focusContainerGuide = self->_focusContainerGuide;
    self->_focusContainerGuide = v31;
  }
  BOOL v410 = v7;
  int v417 = v5 || v6;
  v33 = [(DBWidgetViewController *)self contentView];
  v34 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];
  [v33 addLayoutGuide:v34];

  unsigned int v35 = [(DBNowPlayingWidgetViewController *)self controlsContainerGuide];

  if (!v35)
  {
    v36 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x263F82740]);
    controlsContainerGuide = self->_controlsContainerGuide;
    self->_controlsContainerGuide = v36;
  }
  v38 = [(DBWidgetViewController *)self contentView];
  v39 = [(DBNowPlayingWidgetViewController *)self controlsContainerGuide];
  [v38 addLayoutGuide:v39];

  [(DBNowPlayingWidgetViewController *)self _updateArtworkConstraints];
  BOOL v408 = v4;
  unint64_t v389 = v8;
  BOOL v391 = v6;
  BOOL v414 = v5;
  BOOL v381 = v3;
  if (v8 == 2)
  {
    v403 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v393 = [v403 centerXAnchor];
    v398 = [(DBWidgetViewController *)self contentView];
    v385 = [v398 centerXAnchor];
    v374 = [v393 constraintEqualToAnchor:v385];
    v435[0] = v374;
    v368 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v361 = [v368 leadingAnchor];
    v40 = [(DBWidgetViewController *)self contentView];
    v41 = [v40 leadingAnchor];
    v42 = [v361 constraintGreaterThanOrEqualToAnchor:v41 constant:12.0];
    v435[1] = v42;
    v43 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    v44 = [v43 topAnchor];
    v45 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v46 = [v45 bottomAnchor];
    v47 = [v44 constraintEqualToAnchor:v46 constant:2.0];
    v435[2] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v435 count:3];
    [v419 addObjectsFromArray:v48];

    if (v410)
    {
      v411 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
      v399 = [v411 topAnchor];
      v404 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
      v394 = [v404 bottomAnchor];
      v386 = [v399 constraintEqualToAnchor:v394];
      v434[0] = v386;
      v375 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
      v362 = [v375 leadingAnchor];
      v369 = [(DBWidgetViewController *)self contentView];
      v356 = [v369 leadingAnchor];
      v351 = [v362 constraintEqualToAnchor:v356];
      v434[1] = v351;
      v346 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
      v336 = [v346 trailingAnchor];
      v341 = [(DBWidgetViewController *)self contentView];
      v331 = [v341 trailingAnchor];
      v326 = [v336 constraintEqualToAnchor:v331];
      v434[2] = v326;
      v322 = [(DBNowPlayingWidgetViewController *)self titleStackView];
      v316 = [v322 trailingAnchor];
      v319 = [(DBWidgetViewController *)self contentView];
      v313 = [v319 trailingAnchor];
      v310 = [v316 constraintLessThanOrEqualToAnchor:v313 constant:-12.0];
      v434[3] = v310;
      v307 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
      v304 = [v307 leadingAnchor];
      v49 = [(DBWidgetViewController *)self contentView];
      v50 = [v49 leadingAnchor];
      v51 = [v304 constraintEqualToAnchor:v50];
      v434[4] = v51;
      v52 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
      v53 = [v52 trailingAnchor];
      v54 = [(DBWidgetViewController *)self contentView];
      v55 = [v54 trailingAnchor];
      v56 = [v53 constraintEqualToAnchor:v55];
      v434[5] = v56;
      v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v434 count:6];
      [v419 addObjectsFromArray:v57];
    }
    v58 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v59 = [v58 topAnchor];
    v60 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    v61 = [v60 bottomAnchor];
    double v62 = 4.0;
    goto LABEL_22;
  }
  if (v417)
  {
    if (v4)
    {
      v64 = [(DBNowPlayingWidgetViewController *)self titleStackView];
      v65 = [v64 leadingAnchor];
      v66 = [(DBNowPlayingWidgetViewController *)self artworkButton];
      v67 = [v66 trailingAnchor];
      v68 = [v65 constraintEqualToAnchor:v67 constant:8.0];
      [v419 addObject:v68];

      v69 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v70 = [v69 song];

      double v71 = [(DBNowPlayingWidgetViewController *)self titleStackView];
      v58 = v71;
      if (v70)
      {
        v59 = [v71 topAnchor];
        v60 = [(DBNowPlayingWidgetViewController *)self artworkButton];
        v61 = [v60 topAnchor];
        double v62 = 2.0;
LABEL_22:
        uint64_t v63 = [v59 constraintEqualToAnchor:v61 constant:v62];
LABEL_23:
        v412 = (void *)v63;
        goto LABEL_35;
      }
      v59 = [v71 centerYAnchor];
      v60 = [(DBNowPlayingWidgetViewController *)self artworkButton];
      uint64_t v80 = [v60 centerYAnchor];
    }
    else
    {
      v78 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v79 = [v78 song];

      v58 = [(DBNowPlayingWidgetViewController *)self titleStackView];
      v59 = [v58 topAnchor];
      if (v79 || v8 != 1)
      {
        v60 = [(DBWidgetViewController *)self contentView];
        v61 = [v60 topAnchor];
        double v62 = 8.0;
        goto LABEL_22;
      }
      v60 = [(DBNowPlayingWidgetViewController *)self artworkButton];
      uint64_t v80 = [v60 topAnchor];
    }
    v61 = (void *)v80;
    uint64_t v63 = [v59 constraintEqualToAnchor:v80];
    goto LABEL_23;
  }
  labelStackView = self->_labelStackView;
  if (labelStackView)
  {
    double v73 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    [(UIStackView *)labelStackView addArrangedSubview:v73];

    v74 = self->_labelStackView;
    v75 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [(UIStackView *)v74 addArrangedSubview:v75];

    v76 = self->_labelStackView;
    v77 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [(UIStackView *)v76 addArrangedSubview:v77];
  }
  else
  {
    id v81 = objc_alloc(MEMORY[0x263F82BF8]);
    v82 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v433[0] = v82;
    v83 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    v433[1] = v83;
    v84 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    v433[2] = v84;
    v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v433 count:3];
    v86 = (UIStackView *)[v81 initWithArrangedSubviews:v85];
    v87 = self->_labelStackView;
    self->_labelStackView = v86;

    [(UIStackView *)self->_labelStackView setAxis:1];
    [(UIStackView *)self->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_labelStackView setAlignment:1];
    [(UIStackView *)self->_labelStackView setDistribution:2];
    [(UIStackView *)self->_labelStackView setSpacing:0.0];
  }
  v88 = [(DBWidgetViewController *)self contentView];
  [v88 addSubview:self->_labelStackView];

  v58 = [(UIStackView *)self->_labelStackView centerYAnchor];
  v59 = [(DBWidgetViewController *)self contentView];
  v60 = [v59 centerYAnchor];
  v61 = [v58 constraintEqualToAnchor:v60];
  v432[0] = v61;
  v405 = [(UIStackView *)self->_labelStackView trailingAnchor];
  v413 = [(DBWidgetViewController *)self contentView];
  v400 = [v413 trailingAnchor];
  v395 = [v405 constraintLessThanOrEqualToAnchor:v400 constant:-12.0];
  v432[1] = v395;
  v89 = [(UIStackView *)self->_labelStackView leadingAnchor];
  v90 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v91 = [v90 trailingAnchor];
  v92 = [v89 constraintEqualToAnchor:v91 constant:8.0];
  v432[2] = v92;
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v432 count:3];
  [v419 addObjectsFromArray:v93];

  v412 = 0;
LABEL_35:

  v94 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v95 = [v94 heightAnchor];
  [(DBNowPlayingWidgetViewController *)self _heightForArtwork];
  v96 = objc_msgSend(v95, "constraintEqualToConstant:");
  v431[0] = v96;
  v97 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v98 = [v97 widthAnchor];
  v99 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v100 = [v99 heightAnchor];
  v101 = [v98 constraintEqualToAnchor:v100];
  v431[1] = v101;
  v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:v431 count:2];
  [v419 addObjectsFromArray:v102];

  if (v417)
  {
    v406 = [(DBNowPlayingWidgetViewController *)self controlsContainerGuide];
    v396 = [v406 leftAnchor];
    v401 = [(DBWidgetViewController *)self contentView];
    v387 = [v401 leftAnchor];
    v376 = [v396 constraintEqualToAnchor:v387];
    v430[0] = v376;
    v370 = [(DBNowPlayingWidgetViewController *)self controlsContainerGuide];
    v357 = [v370 rightAnchor];
    v363 = [(DBWidgetViewController *)self contentView];
    v352 = [v363 rightAnchor];
    v347 = [v357 constraintEqualToAnchor:v352];
    v430[1] = v347;
    v342 = [(DBNowPlayingWidgetViewController *)self controlsContainerGuide];
    v332 = [v342 topAnchor];
    v337 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v327 = [v337 topAnchor];
    v323 = [v332 constraintEqualToAnchor:v327];
    v430[2] = v323;
    v320 = [(DBNowPlayingWidgetViewController *)self controlsContainerGuide];
    v314 = [v320 bottomAnchor];
    v317 = [(DBWidgetViewController *)self contentView];
    v311 = [v317 bottomAnchor];
    v308 = [v314 constraintEqualToAnchor:v311];
    v430[3] = v308;
    v305 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];
    v300 = [v305 leftAnchor];
    v302 = [(DBWidgetViewController *)self contentView];
    v298 = [v302 leftAnchor];
    v296 = [v300 constraintEqualToAnchor:v298];
    v430[4] = v296;
    v294 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];
    v290 = [v294 topAnchor];
    v292 = [(DBWidgetViewController *)self contentView];
    v288 = [v292 topAnchor];
    v286 = [v290 constraintEqualToAnchor:v288];
    v430[5] = v286;
    v284 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];
    v280 = [v284 rightAnchor];
    v282 = [(DBWidgetViewController *)self contentView];
    v278 = [v282 rightAnchor];
    v276 = [v280 constraintEqualToAnchor:v278];
    v430[6] = v276;
    v274 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];
    v270 = [v274 bottomAnchor];
    v272 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    v268 = [v272 bottomAnchor];
    v266 = [v270 constraintEqualToAnchor:v268];
    v430[7] = v266;
    v264 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v262 = [v264 heightAnchor];
    v260 = [v262 constraintGreaterThanOrEqualToConstant:32.0];
    v430[8] = v260;
    v258 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v256 = [v258 heightAnchor];
    v254 = [v256 constraintLessThanOrEqualToConstant:40.0];
    v430[9] = v254;
    v252 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v248 = [v252 widthAnchor];
    v250 = [(DBWidgetViewController *)self contentView];
    v246 = [v250 widthAnchor];
    v244 = [v248 constraintLessThanOrEqualToAnchor:v246 multiplier:0.25];
    v430[10] = v244;
    v242 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v240 = [v242 widthAnchor];
    v238 = [v240 constraintGreaterThanOrEqualToConstant:40.0];
    v430[11] = v238;
    v236 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v232 = [v236 trailingAnchor];
    v234 = [(DBWidgetViewController *)self contentView];
    v230 = [v234 trailingAnchor];
    v229 = [v232 constraintEqualToAnchor:v230 constant:-12.0];
    v430[12] = v229;
    v228 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    v226 = [v228 leadingAnchor];
    v227 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v225 = [v227 leadingAnchor];
    v224 = [v226 constraintEqualToAnchor:v225];
    v430[13] = v224;
    v223 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    v222 = [v223 trailingAnchor];
    v103 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v104 = [v103 trailingAnchor];
    v105 = [v222 constraintEqualToAnchor:v104];
    v430[14] = v105;
    v106 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    v107 = [v106 topAnchor];
    v108 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    v109 = [v108 bottomAnchor];
    v110 = [v107 constraintEqualToAnchor:v109 constant:2.0];
    v430[15] = v110;
    v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:v430 count:16];
    [v419 addObjectsFromArray:v111];
  }
  if (v412) {
    objc_msgSend(v419, "addObject:");
  }
  BOOL v112 = v391;
  if (v414)
  {
    v113 = [(DBWidgetViewController *)self contentView];
    id v114 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
    [v113 addSubview:v114];
  }
  else
  {
    v113 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
    [v113 removeFromSuperview];
  }

  if (v391)
  {
    v115 = [(DBWidgetViewController *)self contentView];
    v116 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    [v115 addSubview:v116];

    v117 = [(DBWidgetViewController *)self contentView];
    v118 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    [v117 addSubview:v118];
  }
  else
  {
    v119 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    [v119 removeFromSuperview];

    v117 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    [v117 removeFromSuperview];
  }

  id v407 = objc_alloc_init(MEMORY[0x263F82908]);
  id v120 = objc_alloc_init(MEMORY[0x263F82908]);
  id v121 = objc_alloc_init(MEMORY[0x263F82908]);
  id v122 = objc_alloc_init(MEMORY[0x263F82908]);
  v123 = [(DBWidgetViewController *)self contentView];
  [v123 addLayoutGuide:v407];

  v124 = [(DBWidgetViewController *)self contentView];
  [v124 addLayoutGuide:v121];

  v125 = [(DBWidgetViewController *)self contentView];
  [v125 addLayoutGuide:v120];

  v126 = [(DBWidgetViewController *)self contentView];
  [v126 addLayoutGuide:v122];

  v127 = [(DBNowPlayingWidgetViewController *)self focusContainerGuide];
  v429[0] = v127;
  v429[1] = v407;
  v388 = v120;
  v429[2] = v120;
  v402 = v121;
  v429[3] = v121;
  v397 = v122;
  v429[4] = v122;
  unint64_t v128 = 0x263EFF000uLL;
  v129 = [MEMORY[0x263EFF8C0] arrayWithObjects:v429 count:5];
  layoutGuides = self->_layoutGuides;
  self->_layoutGuides = v129;

  if (!v381)
  {
    if (v389 == 1) {
      char v144 = v417;
    }
    else {
      char v144 = 1;
    }
    BOOL v143 = v408;
    char v145 = v408 & v144;
    v146 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    v140 = v146;
    if (v145)
    {
      objc_super v141 = [v146 topAnchor];
      v131 = [(DBWidgetViewController *)self contentView];
      v132 = [v131 topAnchor];
      [v141 constraintEqualToAnchor:v132 constant:8.0];
    }
    else
    {
      objc_super v141 = [v146 centerYAnchor];
      v131 = [(DBWidgetViewController *)self contentView];
      v132 = [v131 centerYAnchor];
      [v141 constraintEqualToAnchor:v132];
    v133 = };
    [v419 addObject:v133];
    BOOL v142 = v414;
LABEL_57:

    if (v143) {
      goto LABEL_58;
    }
LABEL_61:
    v161 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v162 = [v161 centerYAnchor];
    v163 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    v164 = [v163 centerYAnchor];
    v165 = [v162 constraintEqualToAnchor:v164];
    [v419 addObject:v165];
    goto LABEL_62;
  }
  if (v389 == 2)
  {
    v371 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    v353 = [v371 topAnchor];
    v131 = [(DBWidgetViewController *)self contentView];
    v132 = [v131 topAnchor];
    v133 = [v353 constraintEqualToAnchor:v132 constant:8.0];
    v428[0] = v133;
    v377 = [(CPUIProgressView *)self->_progressView bottomAnchor];
    v382 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v364 = [v382 topAnchor];
    v358 = [v377 constraintEqualToAnchor:v364 constant:-4.0];
    v428[1] = v358;
    v343 = [(CPUIProgressView *)self->_progressView leftAnchor];
    v348 = [(DBWidgetViewController *)self contentView];
    v338 = [v348 leftAnchor];
    v333 = [v343 constraintEqualToAnchor:v338 constant:12.0];
    v428[2] = v333;
    v328 = [(CPUIProgressView *)self->_progressView rightAnchor];
    v134 = [(DBWidgetViewController *)self contentView];
    v135 = [v134 rightAnchor];
    v136 = [v328 constraintEqualToAnchor:v135 constant:-12.0];
    v428[3] = v136;
    v137 = [(CPUIProgressView *)self->_progressView heightAnchor];
    v138 = [v137 constraintEqualToConstant:3.0];
    v428[4] = v138;
    id v139 = [MEMORY[0x263EFF8C0] arrayWithObjects:v428 count:5];
    [v419 addObjectsFromArray:v139];

    BOOL v112 = v391;
    v140 = v371;

    objc_super v141 = v353;
    BOOL v142 = v414;

    unint64_t v128 = 0x263EFF000;
    BOOL v143 = v408;

    goto LABEL_57;
  }
  BOOL v142 = v414;
  if (!v408) {
    goto LABEL_61;
  }
  v383 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  v372 = [v383 topAnchor];
  v378 = [(DBWidgetViewController *)self contentView];
  v365 = [v378 topAnchor];
  v359 = [v372 constraintEqualToAnchor:v365 constant:8.0];
  v427[0] = v359;
  v349 = [(CPUIProgressView *)self->_progressView bottomAnchor];
  v354 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  v344 = [v354 topAnchor];
  v339 = [v349 constraintEqualToAnchor:v344 constant:-4.0];
  v427[1] = v339;
  v329 = [(CPUIProgressView *)self->_progressView leftAnchor];
  v334 = [(DBWidgetViewController *)self contentView];
  v324 = [v334 leftAnchor];
  v147 = [v329 constraintEqualToAnchor:v324 constant:12.0];
  v427[2] = v147;
  v148 = [(CPUIProgressView *)self->_progressView rightAnchor];
  v149 = [(DBWidgetViewController *)self contentView];
  v150 = [v149 rightAnchor];
  v151 = [v148 constraintEqualToAnchor:v150 constant:-12.0];
  v427[3] = v151;
  v152 = [(CPUIProgressView *)self->_progressView heightAnchor];
  v153 = [v152 constraintEqualToConstant:3.0];
  v427[4] = v153;
  v154 = [MEMORY[0x263EFF8C0] arrayWithObjects:v427 count:5];
  [v419 addObjectsFromArray:v154];

  BOOL v142 = v414;
  unint64_t v128 = 0x263EFF000;

  BOOL v112 = v391;
LABEL_58:
  if (v112)
  {
    v155 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    v156 = [v155 bottomAnchor];
    v157 = [(DBWidgetViewController *)self contentView];
    v158 = [v157 bottomAnchor];
    v159 = [v156 constraintEqualToAnchor:v158 constant:-4.0];
    v426 = v159;
    v160 = [*(id *)(v128 + 2240) arrayWithObjects:&v426 count:1];
    [v419 addObjectsFromArray:v160];

    if (v389 == 2)
    {
      v161 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
      v162 = [v161 centerXAnchor];
      v163 = [(DBWidgetViewController *)self contentView];
      v164 = [v163 centerXAnchor];
      v165 = [v162 constraintEqualToAnchor:v164];
      v425 = v165;
      v166 = [*(id *)(v128 + 2240) arrayWithObjects:&v425 count:1];
      [v419 addObjectsFromArray:v166];

LABEL_62:
    }
  }
  v167 = v407;
  if (v417)
  {
    v168 = [(DBNowPlayingWidgetViewController *)self view];
    uint64_t v169 = [v168 effectiveUserInterfaceLayoutDirection];

    if (v169 == 1)
    {
      v418 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
      if (v142)
      {
        v392 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
LABEL_72:
        v415 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
        v170 = [v415 widthAnchor];
        v171 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        uint64_t v172 = [v171 widthAnchor];
        v390 = v170;
        uint64_t v173 = [v170 constraintEqualToAnchor:v172];
        v423[0] = v173;
        v174 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
        v175 = [v174 heightAnchor];
        v360 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        v355 = [v360 heightAnchor];
        v350 = objc_msgSend(v175, "constraintEqualToAnchor:");
        v423[1] = v350;
        v176 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
        v177 = [v176 widthAnchor];
        v335 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        [v335 widthAnchor];
        v330 = v340 = v177;
        uint64_t v178 = objc_msgSend(v177, "constraintEqualToAnchor:");
        v423[2] = v178;
        v321 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
        uint64_t v179 = [v321 heightAnchor];
        v273 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        uint64_t v180 = [v273 heightAnchor];
        v318 = (void *)v179;
        v181 = (void *)v179;
        uint64_t v182 = v180;
        uint64_t v269 = [v181 constraintEqualToAnchor:v180];
        v423[3] = v269;
        v183 = [v407 leadingAnchor];
        v380 = (void *)v172;
        v384 = v171;
        v373 = v174;
        v379 = (void *)v173;
        v366 = v175;
        v345 = v176;
        v325 = (void *)v178;
        v271 = (void *)v182;
        if (v408)
        {
          v267 = [(DBWidgetViewController *)self contentView];
          [v267 leadingAnchor];
        }
        else
        {
          v267 = [(DBNowPlayingWidgetViewController *)self artworkButton];
          [v267 trailingAnchor];
        }
        v409 = v315 = v183;
        v295 = [v183 constraintEqualToAnchor:v409];
        v423[4] = v295;
        v283 = [v407 trailingAnchor];
        v306 = [v418 leadingAnchor];
        v312 = [v283 constraintEqualToAnchor:v306];
        v423[5] = v312;
        v207 = [v402 leadingAnchor];
        [v418 trailingAnchor];
        v303 = v309 = v207;
        uint64_t v263 = objc_msgSend(v207, "constraintEqualToAnchor:");
        v423[6] = v263;
        v208 = [v402 trailingAnchor];
        v299 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        [v299 leadingAnchor];
        v297 = v301 = v208;
        v293 = objc_msgSend(v208, "constraintEqualToAnchor:");
        v423[7] = v293;
        v209 = [v397 leadingAnchor];
        v289 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        [v289 trailingAnchor];
        v287 = v291 = v209;
        v285 = objc_msgSend(v209, "constraintEqualToAnchor:");
        v423[8] = v285;
        v210 = [v397 trailingAnchor];
        v279 = [v392 leadingAnchor];
        v281 = v210;
        v277 = objc_msgSend(v210, "constraintEqualToAnchor:");
        v423[9] = v277;
        v211 = [v388 leadingAnchor];
        v265 = [v392 trailingAnchor];
        v275 = v211;
        v261 = [v211 constraintEqualToAnchor:v265];
        v423[10] = v261;
        v257 = [v388 trailingAnchor];
        v259 = [(DBWidgetViewController *)self contentView];
        v255 = [v259 trailingAnchor];
        v253 = [v257 constraintEqualToAnchor:v255];
        v423[11] = v253;
        v251 = [v407 widthAnchor];
        v249 = [v402 widthAnchor];
        v247 = [v251 constraintEqualToAnchor:v249];
        v423[12] = v247;
        v245 = [v402 widthAnchor];
        v243 = [v397 widthAnchor];
        v241 = [v245 constraintEqualToAnchor:v243];
        v423[13] = v241;
        v239 = [v397 widthAnchor];
        v237 = [v388 widthAnchor];
        v235 = [v239 constraintEqualToAnchor:v237];
        v423[14] = v235;
        v233 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
        v231 = [v233 centerYAnchor];
        v212 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        v213 = [v212 centerYAnchor];
        v214 = [v231 constraintEqualToAnchor:v213];
        v423[15] = v214;
        v215 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
        v216 = [v215 centerYAnchor];
        v217 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
        v218 = [v217 centerYAnchor];
        v219 = [v216 constraintEqualToAnchor:v218];
        v423[16] = v219;
        v220 = [MEMORY[0x263EFF8C0] arrayWithObjects:v423 count:17];
        [v419 addObjectsFromArray:v220];

        v167 = v407;
        v198 = (void *)v263;

        unint64_t v128 = 0x263EFF000uLL;
        v202 = v415;
        v206 = v366;
        v190 = v271;
        v189 = v273;
        v193 = v267;
        v191 = (void *)v269;
        goto LABEL_77;
      }
      v392 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    }
    else
    {
      if (v142) {
        [(DBNowPlayingWidgetViewController *)self backTransportButton];
      }
      else {
      v418 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
      }
      v392 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
      if (v142) {
        goto LABEL_72;
      }
    }
    v416 = [v407 leadingAnchor];
    v390 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    v384 = [v390 trailingAnchor];
    v380 = objc_msgSend(v416, "constraintEqualToAnchor:");
    v424[0] = v380;
    v184 = [v407 trailingAnchor];
    v373 = [v418 leadingAnchor];
    v379 = v184;
    uint64_t v367 = objc_msgSend(v184, "constraintEqualToAnchor:");
    v424[1] = v367;
    v185 = [v402 leadingAnchor];
    v355 = [v418 trailingAnchor];
    v360 = v185;
    v350 = objc_msgSend(v185, "constraintEqualToAnchor:");
    v424[2] = v350;
    v186 = [v402 trailingAnchor];
    v340 = [v392 leadingAnchor];
    v345 = v186;
    v335 = objc_msgSend(v186, "constraintEqualToAnchor:");
    v424[3] = v335;
    v187 = [v397 leadingAnchor];
    v325 = [v392 trailingAnchor];
    v330 = v187;
    v321 = objc_msgSend(v187, "constraintEqualToAnchor:");
    v424[4] = v321;
    v188 = [v397 trailingAnchor];
    v189 = [(DBWidgetViewController *)self contentView];
    v190 = [v189 trailingAnchor];
    v318 = v188;
    v191 = [v188 constraintEqualToAnchor:v190];
    v424[5] = v191;
    v192 = [v407 widthAnchor];
    v193 = [v402 widthAnchor];
    v315 = v192;
    v409 = [v192 constraintEqualToAnchor:v193];
    v424[6] = v409;
    v194 = [v402 widthAnchor];
    [v397 widthAnchor];
    v283 = v295 = v194;
    v306 = objc_msgSend(v194, "constraintEqualToAnchor:");
    v424[7] = v306;
    v312 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    uint64_t v195 = [v312 heightAnchor];
    v303 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    uint64_t v196 = [v303 heightAnchor];
    v309 = (void *)v195;
    v197 = (void *)v195;
    v198 = (void *)v196;
    v301 = [v197 constraintEqualToAnchor:v196];
    v424[8] = v301;
    v299 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    uint64_t v199 = [v299 widthAnchor];
    v293 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    uint64_t v200 = [v293 widthAnchor];
    v297 = (void *)v199;
    v201 = (void *)v199;
    v202 = v416;
    v291 = (void *)v200;
    v289 = objc_msgSend(v201, "constraintEqualToAnchor:");
    v424[9] = v289;
    v287 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    uint64_t v203 = [v287 centerYAnchor];
    v281 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    uint64_t v204 = [v281 centerYAnchor];
    v285 = (void *)v203;
    v205 = (void *)v203;
    v206 = (void *)v367;
    v279 = (void *)v204;
    v277 = objc_msgSend(v205, "constraintEqualToAnchor:");
    v424[10] = v277;
    v275 = [*(id *)(v128 + 2240) arrayWithObjects:v424 count:11];
    objc_msgSend(v419, "addObjectsFromArray:");
LABEL_77:
  }
  v221 = [*(id *)(v128 + 2240) arrayWithArray:v419];
  [(DBNowPlayingWidgetViewController *)self setWidgetConstraints:v221];

  [MEMORY[0x263F08938] activateConstraints:v419];
}

uint64_t __59__DBNowPlayingWidgetViewController__setupTransportControls__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

void __59__DBNowPlayingWidgetViewController__setupTransportControls__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) titleLabel];
  [v2 setAlpha:0.0];

  BOOL v3 = [*(id *)(a1 + 32) subtitleLabel];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) tertiaryLabel];
  [v4 setAlpha:0.0];
}

- (void)_updateAppearanceForWallpaper
{
  BOOL v3 = [(DBWidgetViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  BOOL v5 = [v4 wallpaperPreferences];
  id v12 = [v5 currentWallpaper];

  BOOL v6 = [v12 traits];
  if ([v6 supportsDashboardPlatterMaterials]) {
    [MEMORY[0x263F825C8] _carSystemPrimaryColor];
  }
  else {
  BOOL v7 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  }

  unint64_t v8 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  [v8 setRingColor:v7];

  double v9 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [v9 setTintColor:v7];

  CGRect v10 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v10 setTintColor:v7];

  CGRect v11 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v11 setTintColor:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBNowPlayingWidgetViewController *)&v12 viewDidAppear:a3];
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI])
  {
    id v4 = [MEMORY[0x263F825C8] labelColor];
    BOOL v5 = [v4 colorWithAlphaComponent:0.300000012];

    BOOL v6 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
    [v6 setTintColor:v5];

    BOOL v7 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
    [v7 setTintColor:v5];

    unint64_t v8 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    [v8 setTintColor:v5];
  }
  double v9 = [(DBWidgetViewController *)self environment];
  CGRect v10 = [v9 environmentConfiguration];
  CGRect v11 = [v10 analytics];
  [v11 dashboardAudioWidgetDidChangeToBundleIdentifier:*MEMORY[0x263F31298]];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBNowPlayingWidgetViewController *)&v13 viewDidLayoutSubviews];
  BOOL v3 = [(DBWidgetViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 != *MEMORY[0x263F001B0] || v7 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(DBNowPlayingWidgetViewController *)self lastViewSize];
    BOOL v11 = v10 == v5 && v9 == v7;
    if (!v11 || ![(NSArray *)self->_widgetConstraints count])
    {
      -[DBNowPlayingWidgetViewController setLastViewSize:](self, "setLastViewSize:", v5, v7);
      [(DBNowPlayingWidgetViewController *)self _setupTransportControls];
      [(DBNowPlayingWidgetViewController *)self _processPlaybackControlsForCurrentlyPlayingSong];
      objc_super v12 = [(DBWidgetViewController *)self contentView];
      [v12 layoutIfNeeded];

      [(DBNowPlayingWidgetViewController *)self _processArtworks];
      [(DBNowPlayingWidgetViewController *)self _processLabelsForCurrentlyPlayingSong];
      [(DBNowPlayingWidgetViewController *)self _updateArtworkConstraints];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBNowPlayingWidgetViewController *)&v4 traitCollectionDidChange:a3];
  [(DBNowPlayingWidgetViewController *)self _updateArtworkBorder];
  [(DBNowPlayingWidgetViewController *)self _updateProgressView];
}

- (BOOL)entireWidgetFocusable
{
  return 0;
}

- (void)invalidateConstraints
{
  BOOL v3 = [(DBNowPlayingWidgetViewController *)self widgetConstraints];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F08938];
    double v5 = [(DBNowPlayingWidgetViewController *)self widgetConstraints];
    [v4 deactivateConstraints:v5];

    [(DBNowPlayingWidgetViewController *)self setWidgetConstraints:0];
  }
  double v6 = [(DBNowPlayingWidgetViewController *)self layoutGuides];

  if (v6)
  {
    double v7 = [(DBNowPlayingWidgetViewController *)self layoutGuides];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__DBNowPlayingWidgetViewController_invalidateConstraints__block_invoke;
    v8[3] = &unk_2649B5908;
    v8[4] = self;
    objc_msgSend(v7, "bs_each:", v8);
  }
}

void __57__DBNowPlayingWidgetViewController_invalidateConstraints__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 contentView];
  [v4 removeLayoutGuide:v3];
}

- (id)linearFocusItems
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  double v5 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  v16[1] = v5;
  double v6 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  v16[2] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  unint64_t v8 = [v3 arrayWithArray:v7];

  double v9 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v10 = [v9 userInterfaceLayoutDirection];

  if (v10 == 1)
  {
    BOOL v11 = objc_msgSend(v8, "bs_reverse");
    uint64_t v12 = [v11 mutableCopy];

    unint64_t v8 = (void *)v12;
  }
  objc_super v13 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v8 insertObject:v13 atIndex:0];

  double v14 = objc_msgSend(v8, "bs_filter:", &__block_literal_global_231);

  return v14;
}

uint64_t __52__DBNowPlayingWidgetViewController_linearFocusItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 superview];
  if (v3) {
    uint64_t v4 = [v2 isEnabled];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  double v6 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  double v7 = [v5 nextFocusedItem];

  BOOL v8 = v6 != v7;
  double v9 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  [v9 setHidden:v8];

  id v10 = [(DBWidgetViewController *)self contentView];
  [v10 setNeedsDisplay];
}

- (void)widgetViewTapped
{
  v4.receiver = self;
  v4.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBWidgetViewController *)&v4 widgetViewTapped];
  id v3 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [(DBNowPlayingWidgetViewController *)self albumArtButtonTapped:v3];
}

- (void)updateAppearanceForWallpaper
{
  v3.receiver = self;
  v3.super_class = (Class)DBNowPlayingWidgetViewController;
  [(DBWidgetViewController *)&v3 updateAppearanceForWallpaper];
  [(DBNowPlayingWidgetViewController *)self _updateAppearanceForWallpaper];
}

- (void)_updateProgressView
{
  objc_super v3 = [(DBNowPlayingWidgetViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  double v6 = (void *)MEMORY[0x263F15D58];
  if (v4 != 2) {
    double v6 = (void *)MEMORY[0x263F15D50];
  }
  id v17 = [MEMORY[0x263F157C8] filterWithType:*v6];
  double v7 = [MEMORY[0x263F825C8] colorWithWhite:v5 alpha:0.5];
  BOOL v8 = [MEMORY[0x263F825C8] colorWithWhite:v5 alpha:0.200000003];
  double v9 = [(DBNowPlayingWidgetViewController *)self progressView];
  [v9 setBarColor:v7];

  id v10 = [(DBNowPlayingWidgetViewController *)self progressView];
  [v10 setTrackColor:v8];

  BOOL v11 = [(DBNowPlayingWidgetViewController *)self progressView];
  uint64_t v12 = [v11 layer];
  [v12 setCompositingFilter:v17];

  objc_super v13 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  double v14 = [v13 layer];
  [v14 setCompositingFilter:v17];

  double v15 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  double v16 = [v15 layer];
  [v16 setCompositingFilter:v17];
}

- (void)albumArtButtonTapped:(id)a3
{
  if ([(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio]
    || ([(DBWidgetViewController *)self environment],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 environmentConfiguration],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isVehicleDataSession],
        v5,
        v4,
        !v6))
  {
    BOOL v8 = [(DBNowPlayingWidgetViewController *)self nowPlayingObserver];
    uint64_t v9 = [v8 nowPlayingLaunchInfoWithSource:5];
  }
  else
  {
    double v7 = +[DBApplicationController sharedInstance];
    BOOL v8 = [v7 radioApplication];

    uint64_t v9 = +[DBApplicationLaunchInfo launchInfoForApplication:v8];
  }
  id v10 = (void *)v9;

  if (v10)
  {
    BOOL v11 = [(DBWidgetViewController *)self environment];
    uint64_t v12 = +[DBEvent eventWithType:4 context:v10];
    [v11 handleEvent:v12];

    objc_super v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"CARNowPlayingWidgetInteractionNotification" object:&unk_26E17EBD0];
  }
  else
  {
    objc_super v13 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "No available now playing app for dashboard.", v14, 2u);
    }
  }
}

- (void)_sendAction:(int64_t)a3 withState:(int64_t)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        v21 = 0;
        goto LABEL_40;
      }
      double v7 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      uint64_t v8 = [v7 state];

      if (v8 == 2)
      {
        uint64_t v9 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
        int v10 = [v9 showsStopButton];

        BOOL v11 = DBLogForCategory(0xAuLL);
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Sending stop action.", buf, 2u);
          }

          objc_super v13 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
          double v14 = v13;
          uint64_t v15 = 0;
        }
        else
        {
          if (v12)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Sending pause action.", buf, 2u);
          }

          objc_super v13 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
          double v14 = v13;
          uint64_t v15 = 2;
        }
        v21 = [v13 commandWithType:v15];

        [(DBNowPlayingWidgetViewController *)self _setSpinnerVisible:0];
        goto LABEL_39;
      }
      uint64_t v24 = DBLogForCategory(0xAuLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v24, OS_LOG_TYPE_DEFAULT, "Sending play action.", buf, 2u);
      }

      id v25 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v26 = v25;
      uint64_t v27 = 1;
      goto LABEL_38;
    }
    double v20 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "Sending next action.", buf, 2u);
    }

    if (a4 != 2)
    {
      if (a4 == 1)
      {
        id v17 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
        double v18 = v17;
        uint64_t v19 = 7;
        goto LABEL_19;
      }
      goto LABEL_30;
    }
    if (![(DBNowPlayingWidgetViewController *)self seeking])
    {
LABEL_30:
      v31 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v32 = [v31 jumpForwardInterval];

      id v25 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      v26 = v25;
      if (v32) {
        uint64_t v27 = 5;
      }
      else {
        uint64_t v27 = 3;
      }
LABEL_38:
      v21 = [v25 commandWithType:v27];

      goto LABEL_39;
    }
LABEL_28:
    v30 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    v21 = [v30 commandWithType:9];

    v22 = self;
    uint64_t v23 = 0;
    goto LABEL_29;
  }
  double v16 = DBLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Sending back action.", buf, 2u);
  }

  if (a4 == 2)
  {
    if ([(DBNowPlayingWidgetViewController *)self seeking]) {
      goto LABEL_28;
    }
LABEL_25:
    id v28 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    v29 = [v28 jumpBackInterval];

    id v25 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    v26 = v25;
    if (v29) {
      uint64_t v27 = 6;
    }
    else {
      uint64_t v27 = 4;
    }
    goto LABEL_38;
  }
  if (a4 != 1) {
    goto LABEL_25;
  }
  id v17 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
  double v18 = v17;
  uint64_t v19 = 8;
LABEL_19:
  v21 = [v17 commandWithType:v19];

  v22 = self;
  uint64_t v23 = 1;
LABEL_29:
  [(DBNowPlayingWidgetViewController *)v22 setSeeking:v23];
LABEL_39:
  [(DBNowPlayingWidgetViewController *)self _setSpinnerVisible:0];
LABEL_40:
  if ((unint64_t)a3 >= 2) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
  v34 = [MEMORY[0x263F08A00] defaultCenter];
  unsigned int v35 = [NSNumber numberWithUnsignedInteger:v33];
  [v34 postNotificationName:@"CARNowPlayingWidgetInteractionNotification" object:v35];

  v36 = DBLogForCategory(0xAuLL);
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v37)
    {
      *(_DWORD *)buf = 138412290;
      v45 = v21;
      _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "Performing Now Playing change request: %@", buf, 0xCu);
    }

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __58__DBNowPlayingWidgetViewController__sendAction_withState___block_invoke;
    v43[3] = &unk_2649B5950;
    v43[4] = self;
    v38 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v43 block:2.0];
    [(DBNowPlayingWidgetViewController *)self setSpinnerTimer:v38];

    v39 = [MEMORY[0x263F313A0] sharedManager];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __58__DBNowPlayingWidgetViewController__sendAction_withState___block_invoke_2;
    v42[3] = &unk_2649B5830;
    v42[4] = self;
    [v39 performCommandRequest:v21 completion:v42];
  }
  else
  {
    if (v37)
    {
      v40 = [NSNumber numberWithInteger:a3];
      v41 = [NSNumber numberWithInteger:a4];
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      __int16 v46 = 2114;
      v47 = v41;
      _os_log_impl(&dword_22D6F0000, v36, OS_LOG_TYPE_DEFAULT, "Unable to generate a playback command for action %{public}@ state %{public}@", buf, 0x16u);
    }
  }
}

void __58__DBNowPlayingWidgetViewController__sendAction_withState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) spinnerTimer];
  int v3 = [v2 isValid];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _setSpinnerVisible:1];
  }
}

void __58__DBNowPlayingWidgetViewController__sendAction_withState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DBLogForCategory(0xAuLL);
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__DBNowPlayingWidgetViewController__sendAction_withState___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 32) _setSpinnerVisible:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Change request performed successfully.", v12, 2u);
    }
  }
}

- (void)_cancelHeldAction:(id)a3
{
  id v4 = a3;
  double v5 = DBLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling held action.", v9, 2u);
  }

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__respondToHeldAction object:0];
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:0];
  }
  if ([(DBNowPlayingWidgetViewController *)self seeking])
  {
    uint64_t v6 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    uint64_t v7 = [v6 commandWithType:9];

    uint64_t v8 = [MEMORY[0x263F313A0] sharedManager];
    [v8 performCommandRequest:v7 completion:0];

    [(DBNowPlayingWidgetViewController *)self setSeeking:0];
  }
  self->_heldAction = -1;
}

- (void)_respondToHeldAction
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  int64_t v3 = [(DBNowPlayingWidgetViewController *)self heldAction];
  [(DBNowPlayingWidgetViewController *)self _sendAction:v3 withState:1];
}

- (void)_sendHeldAction
{
  self->_heldAction = -1;
}

- (void)playPauseButtonTouchDown:(id)a3
{
  id v4 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:1];
  }
}

- (void)playPauseButtonTouchUp:(id)a3
{
  id v4 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:0];
  }
  [(DBNowPlayingWidgetViewController *)self _sendAction:2 withState:2];
}

- (void)backButtonTouchDown:(id)a3
{
  id v4 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:1];
  }
  self->_heldAction = 0;
  [(DBNowPlayingWidgetViewController *)self performSelector:sel__respondToHeldAction withObject:0 afterDelay:0.5];
}

- (void)backButtonTouchUp:(id)a3
{
  id v4 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:0];
  }
  [(DBNowPlayingWidgetViewController *)self _sendHeldAction];
}

- (void)backButtonLongPress:(id)a3
{
  id v6 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI])
  {
    id v4 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
    [v4 setSelected:1];
  }
  if ([v6 state] == 1)
  {
    uint64_t v5 = 1;
  }
  else
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__respondToHeldAction object:0];
    uint64_t v5 = 2;
  }
  [(DBNowPlayingWidgetViewController *)self _sendAction:0 withState:v5];
}

- (void)nextButtonTouchDown:(id)a3
{
  id v4 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:1];
  }
  self->_heldAction = 1;
  [(DBNowPlayingWidgetViewController *)self performSelector:sel__respondToHeldAction withObject:0 afterDelay:0.5];
}

- (void)nextButtonTouchUp:(id)a3
{
  id v4 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI]) {
    [v4 setSelected:0];
  }
  [(DBNowPlayingWidgetViewController *)self _sendHeldAction];
}

- (void)nextButtonLongPress:(id)a3
{
  id v6 = a3;
  if (![(DBNowPlayingWidgetViewController *)self _isFocusUI])
  {
    id v4 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
    [v4 setSelected:1];
  }
  if ([v6 state] == 1)
  {
    uint64_t v5 = 1;
  }
  else
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__respondToHeldAction object:0];
    uint64_t v5 = 2;
  }
  [(DBNowPlayingWidgetViewController *)self _sendAction:1 withState:v5];
}

- (id)_nowPlayingPlaceholderImage
{
  int64_t v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  uint64_t v5 = [(DBNowPlayingWidgetViewController *)self traitCollection];
  id v6 = [v3 imageNamed:@"NowPlayingPlaceholder" inBundle:v4 compatibleWithTraitCollection:v5];

  return v6;
}

- (void)setShowArtworkBorder:(BOOL)a3
{
  if (self->_showArtworkBorder != a3)
  {
    self->_showArtworkBorder = a3;
    [(DBNowPlayingWidgetViewController *)self _updateArtworkBorder];
  }
}

- (void)_updateArtworkBorder
{
  BOOL v3 = [(DBNowPlayingWidgetViewController *)self showArtworkBorder];
  id v4 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  uint64_t v5 = [v4 imageView];
  id v6 = [v5 layer];
  uint64_t v7 = v6;
  if (v3)
  {
    [v6 setCornerRadius:8.0];

    uint64_t v8 = *MEMORY[0x263F15A20];
    uint64_t v9 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    uint64_t v10 = [v9 imageView];
    uint64_t v11 = [v10 layer];
    [v11 setCornerCurve:v8];

    BOOL v12 = [(DBNowPlayingWidgetViewController *)self traitCollection];
    uint64_t v13 = [v12 userInterfaceStyle];

    if (v13 != 1) {
      return;
    }
    double v14 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    uint64_t v15 = [v14 imageView];
    double v16 = [v15 layer];
    [v16 setBorderWidth:0.5];

    id v30 = [MEMORY[0x263F825C8] blackColor];
    id v17 = [v30 colorWithAlphaComponent:0.0700000003];
    uint64_t v18 = [v17 CGColor];
    uint64_t v19 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    double v20 = [v19 imageView];
    v21 = [v20 layer];
    [v21 setBorderColor:v18];
  }
  else
  {
    [v6 setCornerRadius:6.0];

    uint64_t v22 = *MEMORY[0x263F15A10];
    uint64_t v23 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    uint64_t v24 = [v23 imageView];
    id v25 = [v24 layer];
    [v25 setCornerCurve:v22];

    v26 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    uint64_t v27 = [v26 imageView];
    id v28 = [v27 layer];
    [v28 setBorderWidth:0.0];

    id v30 = [MEMORY[0x263F825C8] clearColor];
    uint64_t v29 = [v30 CGColor];
    id v17 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    uint64_t v19 = [v17 imageView];
    double v20 = [v19 layer];
    [v20 setBorderColor:v29];
  }
}

- (void)_setNotPlaying
{
  BOOL v3 = DBLogForCategory(0xAuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Setting not-playing state.", v19, 2u);
  }

  [(DBNowPlayingWidgetViewController *)self _setupPlaceholderArtwork];
  id v4 = [(DBNowPlayingWidgetViewController *)self multicastLabel];

  if (v4)
  {
    uint64_t v5 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    id v6 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    [v5 removeArrangedSubview:v6];

    uint64_t v7 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    [v7 removeFromSuperview];

    [(DBNowPlayingWidgetViewController *)self setMulticastLabel:0];
  }
  uint64_t v8 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v8 setNumberOfLines:2];

  uint64_t v9 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  if ([(DBNowPlayingWidgetViewController *)self _showsTextLabels])
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    uint64_t v11 = [v10 localizedStringForKey:@"NOW_PLAYING_NOT_PLAYING" value:&stru_26E13A820 table:@"CarPlayApp"];
    [v9 setText:v11];
  }
  else
  {
    [v9 setText:0];
  }

  BOOL v12 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v12 setText:0];

  uint64_t v13 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v13 setText:0];

  [(DBNowPlayingWidgetViewController *)self setCurrentArtwork:0];
  [(DBNowPlayingWidgetViewController *)self setCurrentCatalog:0];
  double v14 = [(DBNowPlayingWidgetViewController *)self playTransportButton];
  [(DBNowPlayingWidgetViewController *)self _updateButton:v14 withType:2 variant:0];

  uint64_t v15 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [(DBNowPlayingWidgetViewController *)self _updateButton:v15 withType:5 variant:0];

  double v16 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [(DBNowPlayingWidgetViewController *)self _updateButton:v16 withType:0 variant:0];

  id v17 = [(DBNowPlayingWidgetViewController *)self backTransportButton];
  [v17 setEnabled:0];

  uint64_t v18 = [(DBNowPlayingWidgetViewController *)self nextTransportButton];
  [v18 setEnabled:0];

  [(DBNowPlayingWidgetViewController *)self _updateArtworkConstraints];
  [(DBNowPlayingWidgetViewController *)self _setupTransportControls];
}

- (void)_processArtworks
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio]
    || ([(DBWidgetViewController *)self environment],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 environmentConfiguration],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isVehicleDataSession],
        v4,
        v3,
        !v5))
  {
    uint64_t v15 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    double v16 = [MEMORY[0x263F825C8] clearColor];
    [v15 setBackgroundColor:v16];

    id v17 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    [v17 _setContinuousCornerRadius:0.0];

    uint64_t v18 = [(DBNowPlayingWidgetViewController *)self artworkButton];
    [v18 setTintColor:0];

    uint64_t v19 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    double v20 = [v19 song];
    [(DBNowPlayingWidgetViewController *)self _processArtworksFor:v20 songType:1];

    v21 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    uint64_t v22 = [v21 nextSong];
    [(DBNowPlayingWidgetViewController *)self _processArtworksFor:v22 songType:2];

    id v30 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    uint64_t v23 = [v30 previousSong];
    [(DBNowPlayingWidgetViewController *)self _processArtworksFor:v23 songType:0];
  }
  else
  {
    [(UIButton *)self->_artworkButton clearArtworkCatalogs];
    [(DBNowPlayingWidgetViewController *)self _heightForArtwork];
    double v7 = v6;
    uint64_t v8 = [(DBNowPlayingWidgetViewController *)self view];
    uint64_t v9 = [v8 window];
    [v9 contentScaleFactor];
    if (v10 <= 2.0)
    {
      double v14 = v7 + v7;
    }
    else
    {
      uint64_t v11 = [(DBNowPlayingWidgetViewController *)self view];
      BOOL v12 = [v11 window];
      [v12 contentScaleFactor];
      double v14 = v7 * v13;
    }
    objc_opt_class();
    id v24 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
    if (v24 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    v26 = (void *)[v25 copy];
    if (v26)
    {
      uint64_t v27 = [(id)objc_opt_class() nowPlayingQueue];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __52__DBNowPlayingWidgetViewController__processArtworks__block_invoke;
      v31[3] = &unk_2649B4138;
      double v34 = v14;
      v32 = v26;
      uint64_t v33 = self;
      [v27 addOperationWithBlock:v31];

      id v28 = v32;
    }
    else
    {
      id v28 = DBLogForCategory(0xAuLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
        *(_DWORD *)buf = 138412290;
        v36 = v29;
        _os_log_impl(&dword_22D6F0000, v28, OS_LOG_TYPE_DEFAULT, "Unable to copy snapshot as CAFNowPlayingSnapshot: %@", buf, 0xCu);
      }
    }
  }
}

void __52__DBNowPlayingWidgetViewController__processArtworks__block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) traitCollection];
  int v5 = [v3 artworkImageWithMaxDimension:v4 inTraitCollection:v2];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__DBNowPlayingWidgetViewController__processArtworks__block_invoke_2;
  v7[3] = &unk_2649B3D30;
  v7[4] = *(void *)(a1 + 40);
  id v8 = v5;
  id v6 = v5;
  dispatch_sync(MEMORY[0x263EF83A0], v7);
}

void __52__DBNowPlayingWidgetViewController__processArtworks__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) iOSOwnsMainAudio])
  {
    double v2 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEFAULT, "iOS owns main audio; not updating artwork from car.",
        (uint8_t *)&v10,
        2u);
    }
LABEL_8:

    return;
  }
  if (*(void *)(a1 + 40))
  {
    BOOL v3 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Received car artwork image %@", (uint8_t *)&v10, 0xCu);
    }

    int v5 = [*(id *)(a1 + 32) focusRingView];
    [v5 setCornerRadius:8.0];

    [*(id *)(a1 + 32) setShowArtworkBorder:0];
    id v6 = [*(id *)(a1 + 32) artworkButton];
    [v6 setImage:*(void *)(a1 + 40) forState:0];

    double v7 = [*(id *)(a1 + 32) artworkButton];
    [v7 _setContinuousCornerRadius:6.0];

    double v2 = [*(id *)(a1 + 32) artworkButton];
    id v8 = [MEMORY[0x263F825C8] labelColor];
    [v2 setTintColor:v8];

    goto LABEL_8;
  }
  uint64_t v9 = *(void **)(a1 + 32);
  [v9 _setupPlaceholderArtwork];
}

- (void)_processArtworksFor:(id)a3 songType:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    id v8 = [v6 artworkCatalog];
    if (a4 == 1)
    {
      uint64_t v9 = self->_currentCatalog;
      if (v8)
      {
        int v10 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Reuse catalogs/artworks for current song, if possible", buf, 2u);
        }

        uint64_t v33 = self->_currentCatalog;
        uint64_t v11 = self->_currentArtwork;
        if (self->_nextArtwork
          && self->_nextCatalog
          && objc_msgSend(v8, "isArtworkVisuallyIdenticalToCatalog:"))
        {
          uint64_t v12 = DBLogForCategory(0xAuLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v7;
            _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Using cached next artwork for current song: %@.", buf, 0xCu);
          }

          uint64_t v13 = [(DBNowPlayingWidgetViewController *)self nextArtwork];
        }
        else
        {
          if (!self->_previousArtwork
            || !self->_previousCatalog
            || !objc_msgSend(v8, "isArtworkVisuallyIdenticalToCatalog:"))
          {
            int v18 = 0;
            goto LABEL_27;
          }
          double v16 = DBLogForCategory(0xAuLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v7;
            _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_DEFAULT, "Using cached previous artwork for current song: %@.", buf, 0xCu);
          }

          uint64_t v13 = [(DBNowPlayingWidgetViewController *)self previousArtwork];
        }
        id v17 = (void *)v13;
        [(DBNowPlayingWidgetViewController *)self _setCurrentArtwork:v13 withCatalog:v8];

        int v18 = 1;
LABEL_27:
        uint64_t v19 = [(CPUINowPlayingSnapshot *)self->_lastSnapshot previousSong];
        double v20 = [v19 artworkCatalog];
        [(DBNowPlayingWidgetViewController *)self _reuseCatalog:v33 withArtwork:v11 compareWithCatalog:v20 forSongType:0];

        v21 = [(CPUINowPlayingSnapshot *)self->_lastSnapshot nextSong];
        uint64_t v22 = [v21 artworkCatalog];
        [(DBNowPlayingWidgetViewController *)self _reuseCatalog:v33 withArtwork:v11 compareWithCatalog:v22 forSongType:2];

        if (v18)
        {
          uint64_t v23 = DBLogForCategory(0xAuLL);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D6F0000, v23, OS_LOG_TYPE_DEFAULT, "Has set current artwork", buf, 2u);
          }

LABEL_42:
          goto LABEL_43;
        }

LABEL_32:
        if (v9 && ([v8 isArtworkVisuallyIdenticalToCatalog:v9] & 1) != 0)
        {
          id v24 = DBLogForCategory(0xAuLL);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v8;
            __int16 v39 = 2112;
            v40 = v9;
            _os_log_impl(&dword_22D6F0000, v24, OS_LOG_TYPE_DEFAULT, "No need to fetch artwork for catalog: %@, with catalog to update: %@", buf, 0x16u);
          }
        }
        else
        {
          BOOL v25 = a4 == 1;
          v26 = [(DBWidgetViewController *)self environment];
          uint64_t v27 = [v26 environmentConfiguration];
          [v27 screenScale];
          objc_msgSend(v8, "setDestinationScale:");

          [(DBNowPlayingWidgetViewController *)self _heightForArtwork];
          double v29 = v28;
          objc_msgSend(v8, "setFittingSize:", v28, v28);
          if (v25)
          {
            [(UIButton *)self->_artworkButton clearArtworkCatalogs];
            [(DBNowPlayingWidgetViewController *)self _setupPlaceholderArtwork];
          }
          id v30 = DBLogForCategory(0xAuLL);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = [NSNumber numberWithDouble:v29];
            v32 = [v7 title];
            *(_DWORD *)buf = 138412546;
            v38 = v31;
            __int16 v39 = 2112;
            v40 = v32;
            _os_log_impl(&dword_22D6F0000, v30, OS_LOG_TYPE_DEFAULT, "Fetching artwork with size: %@, for song: %@", buf, 0x16u);
          }
          objc_initWeak((id *)buf, self);
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __65__DBNowPlayingWidgetViewController__processArtworksFor_songType___block_invoke;
          v34[3] = &unk_2649B59A0;
          objc_copyWeak(&v36, (id *)buf);
          id v35 = v7;
          [v8 requestImageWithCompletion:v34];

          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_42;
      }
    }
    else
    {
      double v14 = &OBJC_IVAR___DBNowPlayingWidgetViewController__nextCatalog;
      if (!a4) {
        double v14 = &OBJC_IVAR___DBNowPlayingWidgetViewController__previousCatalog;
      }
      uint64_t v9 = (MPArtworkCatalog *)*(id *)((char *)&self->super.super.super.super.isa + *v14);
      if (v8) {
        goto LABEL_32;
      }
    }
    uint64_t v15 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, "No available artwork catalog for current song: %@.", buf, 0xCu);
    }

    [(DBNowPlayingWidgetViewController *)self _resetArtworkAndCatalogForSongType:a4];
    goto LABEL_42;
  }
  [(DBNowPlayingWidgetViewController *)self _resetArtworkAndCatalogForSongType:a4];
LABEL_43:
}

void __65__DBNowPlayingWidgetViewController__processArtworksFor_songType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__DBNowPlayingWidgetViewController__processArtworksFor_songType___block_invoke_2;
  block[3] = &unk_2649B5978;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __65__DBNowPlayingWidgetViewController__processArtworksFor_songType___block_invoke_2(id *a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [a1[4] artworkCatalog];
  id v4 = [WeakRetained lastSnapshot];
  int v5 = [v4 song];
  id v6 = [v5 artworkCatalog];
  int v7 = [WeakRetained _isArtworkVisuallyIdenticalForCatalog:v3 andCatalog:v6];

  id v8 = [a1[4] artworkCatalog];
  uint64_t v9 = [WeakRetained lastSnapshot];
  int v10 = [v9 previousSong];
  uint64_t v11 = [v10 artworkCatalog];
  int v12 = [WeakRetained _isArtworkVisuallyIdenticalForCatalog:v8 andCatalog:v11];

  uint64_t v13 = [a1[4] artworkCatalog];
  double v14 = [WeakRetained lastSnapshot];
  uint64_t v15 = [v14 nextSong];
  double v16 = [v15 artworkCatalog];
  int v17 = [WeakRetained _isArtworkVisuallyIdenticalForCatalog:v13 andCatalog:v16];

  if (v7 & 1) != 0 || (v17 & 1) != 0 || (v12)
  {
    id v26 = a1[5];
    uint64_t v27 = DBLogForCategory(0xAuLL);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        id v29 = a1[4];
        int v52 = 138412546;
        id v53 = v26;
        __int16 v54 = 2112;
        v55 = v29;
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "Received artwork %@ for item %@", (uint8_t *)&v52, 0x16u);
      }

      [v26 size];
      double v31 = v30;
      [v26 size];
      double v33 = v32;
      double v34 = 1.0;
      if (v33 > 1.0) {
        [v26 size];
      }
      if (v31 / v34 <= 0.980000019 || v31 / v34 >= 1.01999998)
      {
        id v35 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          [v26 size];
          uint64_t v37 = v36;
          [v26 size];
          int v52 = 134218240;
          id v53 = v37;
          __int16 v54 = 2048;
          v55 = v38;
          _os_log_impl(&dword_22D6F0000, v35, OS_LOG_TYPE_DEFAULT, "Setting corner radius to artwork image with size: (%f, %f)", (uint8_t *)&v52, 0x16u);
        }

        uint64_t v39 = [v26 imageWithRoundedCornersOfRadius:6.0];

        id v26 = (id)v39;
      }
      if (v7)
      {
        v40 = [a1[4] artworkCatalog];
        uint64_t v41 = [WeakRetained currentCatalog];
        char v42 = [v40 isArtworkVisuallyIdenticalToCatalog:v41];

        if ((v42 & 1) == 0)
        {
          v43 = DBLogForCategory(0xAuLL);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v52) = 0;
            _os_log_impl(&dword_22D6F0000, v43, OS_LOG_TYPE_DEFAULT, "Updating current artwork", (uint8_t *)&v52, 2u);
          }

          v44 = [a1[4] artworkCatalog];
          [WeakRetained _setCurrentArtwork:v26 withCatalog:v44];
        }
      }
      if (v17)
      {
        v45 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v52) = 0;
          _os_log_impl(&dword_22D6F0000, v45, OS_LOG_TYPE_DEFAULT, "Caching next artwork", (uint8_t *)&v52, 2u);
        }

        __int16 v46 = [a1[4] artworkCatalog];
        [WeakRetained setNextCatalog:v46];

        [WeakRetained setNextArtwork:v26];
      }
      v47 = DBLogForCategory(0xAuLL);
      BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v48)
        {
          LOWORD(v52) = 0;
          _os_log_impl(&dword_22D6F0000, v47, OS_LOG_TYPE_DEFAULT, "Caching previous artwork", (uint8_t *)&v52, 2u);
        }

        v49 = [a1[4] artworkCatalog];
        [WeakRetained setPreviousCatalog:v49];

        [WeakRetained setPreviousArtwork:v26];
      }
      else
      {
        if (v48)
        {
          int v52 = 138412290;
          id v53 = v26;
          _os_log_impl(&dword_22D6F0000, v47, OS_LOG_TYPE_DEFAULT, "Nothing to do for artwork %@", (uint8_t *)&v52, 0xCu);
        }
      }
    }
    else
    {
      if (v28)
      {
        id v50 = a1[4];
        int v52 = 138412290;
        id v53 = v50;
        _os_log_impl(&dword_22D6F0000, v27, OS_LOG_TYPE_DEFAULT, "No artwork for item %@.", (uint8_t *)&v52, 0xCu);
      }

      if (v7)
      {
        v51 = [WeakRetained artworkButton];
        [v51 clearArtworkCatalogs];

        [WeakRetained _setupPlaceholderArtwork];
        [WeakRetained setCurrentCatalog:0];
      }
    }
  }
  else
  {
    int v18 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = a1[4];
      double v20 = [WeakRetained lastSnapshot];
      v21 = [v20 previousSong];
      uint64_t v22 = [WeakRetained lastSnapshot];
      uint64_t v23 = [v22 song];
      id v24 = [WeakRetained lastSnapshot];
      BOOL v25 = [v24 nextSong];
      int v52 = 138413058;
      id v53 = v19;
      __int16 v54 = 2112;
      v55 = v21;
      __int16 v56 = 2112;
      v57 = v23;
      __int16 v58 = 2112;
      v59 = v25;
      _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "Failed to load artwork for playing item %@.\nPrevious song: %@.\nCurrent song: %@.\nNext song: %@.", (uint8_t *)&v52, 0x2Au);
    }
  }
}

- (void)_resetArtworkAndCatalogForSongType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = DBLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = a3;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Reset artwork and catalog for song type: %lu", (uint8_t *)&v11, 0xCu);
  }

  if (a3)
  {
    if (a3 == 1)
    {
      [(UIButton *)self->_artworkButton clearArtworkCatalogs];
      [(DBNowPlayingWidgetViewController *)self _setupPlaceholderArtwork];
      int v7 = &OBJC_IVAR___DBNowPlayingWidgetViewController__currentCatalog;
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      nextCatalog = self->_nextCatalog;
      self->_nextCatalog = 0;

      int v7 = &OBJC_IVAR___DBNowPlayingWidgetViewController__nextArtwork;
    }
  }
  else
  {
    previousCatalog = self->_previousCatalog;
    self->_previousCatalog = 0;

    int v7 = &OBJC_IVAR___DBNowPlayingWidgetViewController__previousArtwork;
  }
  uint64_t v9 = *v7;
  int v10 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = 0;
}

- (BOOL)_isArtworkVisuallyIdenticalForCatalog:(id)a3 andCatalog:(id)a4
{
  if (a3 && a4) {
    return [a3 isArtworkVisuallyIdenticalToCatalog:a4];
  }
  else {
    return 0;
  }
}

- (void)_setCurrentArtwork:(id)a3 withCatalog:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  [v8 setCornerRadius:8.0];

  [(DBNowPlayingWidgetViewController *)self setShowArtworkBorder:0];
  [(DBNowPlayingWidgetViewController *)self setCurrentCatalog:v6];

  [(DBNowPlayingWidgetViewController *)self setCurrentArtwork:v7];
  id v9 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v9 setImage:v7 forState:0];
}

- (void)_reuseCatalog:(id)a3 withArtwork:(id)a4 compareWithCatalog:(id)a5 forSongType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = v12;
  if (v11 && v12 && a5 && [v11 isArtworkVisuallyIdenticalToCatalog:a5])
  {
    switch(a6)
    {
      case 2uLL:
        double v14 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v17 = 0;
          _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Reuse artwork/catalog for next song", v17, 2u);
        }
        uint64_t v15 = &OBJC_IVAR___DBNowPlayingWidgetViewController__nextArtwork;
        double v16 = &OBJC_IVAR___DBNowPlayingWidgetViewController__nextCatalog;
        goto LABEL_17;
      case 1uLL:
        double v14 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v18 = 0;
          _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Reuse artwork/catalog for current song", v18, 2u);
        }
        uint64_t v15 = &OBJC_IVAR___DBNowPlayingWidgetViewController__currentArtwork;
        double v16 = &OBJC_IVAR___DBNowPlayingWidgetViewController__currentCatalog;
        goto LABEL_17;
      case 0uLL:
        double v14 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Reuse artwork/catalog for previous song", buf, 2u);
        }
        uint64_t v15 = &OBJC_IVAR___DBNowPlayingWidgetViewController__previousArtwork;
        double v16 = &OBJC_IVAR___DBNowPlayingWidgetViewController__previousCatalog;
LABEL_17:

        objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *v16), a3);
        objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *v15), a4);
        break;
    }
  }
}

- (void)_setupPlaceholderArtwork
{
  id v3 = DBLogForCategory(0xAuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Setup placeholder artwork", v7, 2u);
  }

  id v4 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  int v5 = [(DBNowPlayingWidgetViewController *)self _nowPlayingPlaceholderImage];
  [v4 setImage:v5 forState:0];

  [(DBNowPlayingWidgetViewController *)self setShowArtworkBorder:1];
  id v6 = [(DBNowPlayingWidgetViewController *)self focusRingView];
  [v6 setCornerRadius:11.0];
}

- (void)_updateArtworkConstraints
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = [(DBNowPlayingWidgetViewController *)self artworkHorizontalConstraint];
  [v3 setActive:0];

  unint64_t v4 = [(DBNowPlayingWidgetViewController *)self _widgetStyle];
  int v5 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  id v6 = v5;
  if (v4 == 2)
  {
    id v7 = [v5 centerXAnchor];
    id v8 = [(DBWidgetViewController *)self contentView];
    id v9 = [v8 centerXAnchor];
    [v7 constraintEqualToAnchor:v9];
  }
  else
  {
    id v7 = [v5 leadingAnchor];
    id v8 = [(DBWidgetViewController *)self contentView];
    id v9 = [v8 leadingAnchor];
    [v7 constraintEqualToAnchor:v9 constant:12.0];
  }
  int v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  artworkHorizontalConstraint = self->_artworkHorizontalConstraint;
  self->_artworkHorizontalConstraint = v10;

  id v12 = (void *)MEMORY[0x263F08938];
  uint64_t v13 = [(DBNowPlayingWidgetViewController *)self artworkHorizontalConstraint];
  v15[0] = v13;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v12 activateConstraints:v14];
}

- (void)_processLabelsForCurrentlyPlayingSong
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  if ([(DBNowPlayingWidgetViewController *)self _showsProgressView])
  {
    id v3 = [(DBNowPlayingWidgetViewController *)self progressView];
    unint64_t v4 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    int v5 = v4;
    if (v4)
    {
      [v4 durationSnapshot];
    }
    else
    {
      uint64_t v80 = 0;
      memset(v79, 0, sizeof(v79));
    }
    [v3 setDurationSnapshot:v79];
  }
  if (![(DBNowPlayingWidgetViewController *)self _showsTextLabels])
  {
    uint64_t v37 = [(DBNowPlayingWidgetViewController *)self titleLabel];
    [v37 setText:0];

    v38 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [v38 setText:0];

    id v12 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [v12 setText:0];
    goto LABEL_51;
  }
  id v6 = [(DBWidgetViewController *)self contentView];
  [v6 frame];
  if (CGRectGetHeight(v86) < 200.0) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  id v8 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v8 setNumberOfLines:v7];

  id v9 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v9 setNumberOfLines:1];

  int v10 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v10 setNumberOfLines:1];

  id v11 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
  id v12 = [v11 title];

  uint64_t v13 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
  double v14 = [v13 artist];

  uint64_t v15 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
  double v16 = [v15 album];

  [(DBNowPlayingWidgetViewController *)self _removeMulticastBadge];
  if ([(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio]
    || ([(DBWidgetViewController *)self environment],
        int v17 = objc_claimAutoreleasedReturnValue(),
        [v17 environmentConfiguration],
        int v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isVehicleDataSession],
        v18,
        v17,
        !v19))
  {
    uint64_t v39 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
      uint64_t v41 = [v40 song];
      *(_DWORD *)buf = 138412290;
      v82 = v41;
      _os_log_impl(&dword_22D6F0000, v39, OS_LOG_TYPE_DEFAULT, "Updating labels for current song %@", buf, 0xCu);
    }
    id v35 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
    uint64_t v22 = [v35 bundleIdentifier];
  }
  else
  {
    double v20 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
      *(_DWORD *)buf = 138412290;
      v82 = v21;
      _os_log_impl(&dword_22D6F0000, v20, OS_LOG_TYPE_DEFAULT, "Updating labels for current now playing %@", buf, 0xCu);
    }
    uint64_t v22 = @"com.apple.CarRadio";
    uint64_t v23 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
    uint64_t v24 = [v23 multicast];

    if (!v24) {
      goto LABEL_21;
    }
    BOOL v25 = [_TtC9DashBoard16DBMulticastLabel alloc];
    id v26 = NSString;
    uint64_t v27 = [(DBNowPlayingWidgetViewController *)self currentDataSource];
    BOOL v28 = objc_msgSend(v26, "stringWithFormat:", @"%lu", objc_msgSend(v27, "multicast"));
    id v29 = [(DBMulticastLabel *)v25 initWithMulticast:v28];
    [(DBNowPlayingWidgetViewController *)self setMulticastLabel:v29];

    double v30 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v31 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    LODWORD(v32) = 1148846080;
    [v31 setContentCompressionResistancePriority:0 forAxis:v32];

    double v33 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    LODWORD(v34) = 1148846080;
    [v33 setContentHuggingPriority:0 forAxis:v34];

    id v35 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    id v36 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    [v35 addArrangedSubview:v36];
  }
LABEL_21:
  if ([v12 length])
  {
    id v42 = [(DBNowPlayingWidgetViewController *)self titleLabel];
    [v42 setText:v12];
  }
  else
  {
    uint64_t v43 = [(__CFString *)v22 length];
    v44 = DBLogForCategory(0xAuLL);
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (v45)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v44, OS_LOG_TYPE_DEFAULT, "No title available, trying display name.", buf, 2u);
      }

      id v78 = 0;
      __int16 v46 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v22 allowPlaceholder:0 error:&v78];
      id v42 = v78;
      v47 = 0;
      if (v42) {
        goto LABEL_27;
      }
      id v53 = objc_msgSend(v46, "db_localizedCarName");
      __int16 v54 = v53;
      if (v53)
      {
        id v55 = v53;
      }
      else
      {
        id v55 = [v46 localizedName];
      }
      v47 = v55;

      __int16 v56 = [(DBNowPlayingWidgetViewController *)self titleLabel];
      [v56 setText:v47];

      if (![v47 length])
      {
LABEL_27:
        v77 = v46;
        BOOL v48 = DBLogForCategory(0xAuLL);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = [v42 localizedDescription];
          *(_DWORD *)buf = 138412546;
          v82 = v49;
          __int16 v83 = 2112;
          v84 = v22;
          _os_log_impl(&dword_22D6F0000, v48, OS_LOG_TYPE_DEFAULT, "LSApplicationRecord init error: %@ ,bundleIdentifier: %@", buf, 0x16u);
        }
        id v50 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        v51 = [v50 localizedStringForKey:@"NOW_PLAYING_NOT_PLAYING" value:&stru_26E13A820 table:@"CarPlayApp"];
        int v52 = [(DBNowPlayingWidgetViewController *)self titleLabel];
        [v52 setText:v51];

        __int16 v46 = v77;
      }
    }
    else
    {
      if (v45)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v44, OS_LOG_TYPE_DEFAULT, "No available title for current playing item.", buf, 2u);
      }

      id v42 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      __int16 v46 = [v42 localizedStringForKey:@"NOW_PLAYING_NOT_PLAYING" value:&stru_26E13A820 table:@"CarPlayApp"];
      v47 = [(DBNowPlayingWidgetViewController *)self titleLabel];
      [v47 setText:v46];
    }
  }
  if ([v14 length])
  {
    v57 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [v57 setText:v14];
  }
  else
  {
    __int16 v58 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v58, OS_LOG_TYPE_DEFAULT, "No available artist name for current playing item.", buf, 2u);
    }

    v59 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [v59 setText:0];

    v57 = [(DBNowPlayingWidgetViewController *)self titleLabel];
    [v57 setNumberOfLines:2];
  }

  if ([v16 length]
    && [(DBNowPlayingWidgetViewController *)self _showsTertiaryLabel])
  {
    uint64_t v60 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [v60 setText:v16];

    uint64_t v61 = [MEMORY[0x263F825C8] labelColor];
  }
  else
  {
    double v62 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    [v62 setText:0];

    uint64_t v61 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  uint64_t v63 = (void *)v61;
  v64 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v64 setTextColor:v63];

  unint64_t v65 = [(DBNowPlayingWidgetViewController *)self _widgetStyle];
  v66 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  v67 = v66;
  if (v65 == 1)
  {
    [v66 setTextAlignment:0];

    v68 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [v68 setTextAlignment:0];

    v69 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    v70 = v69;
    uint64_t v71 = 0;
  }
  else
  {
    [v66 setTextAlignment:1];

    v72 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
    [v72 setTextAlignment:1];

    v69 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
    v70 = v69;
    uint64_t v71 = 1;
  }
  [v69 setTextAlignment:v71];

  double v73 = [(DBNowPlayingWidgetViewController *)self titleLabel];
  [v73 invalidateIntrinsicContentSize];

  v74 = [(DBNowPlayingWidgetViewController *)self subtitleLabel];
  [v74 invalidateIntrinsicContentSize];

  v75 = [(DBNowPlayingWidgetViewController *)self tertiaryLabel];
  [v75 invalidateIntrinsicContentSize];

  v76 = [(DBWidgetViewController *)self contentView];
  [v76 setNeedsLayout];

LABEL_51:
}

- (void)_processPlaybackControlsForCurrentlyPlayingSong
{
}

- (void)_removeMulticastBadge
{
  id v3 = [(DBNowPlayingWidgetViewController *)self multicastLabel];

  if (v3)
  {
    unint64_t v4 = [(DBNowPlayingWidgetViewController *)self titleStackView];
    int v5 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    [v4 removeArrangedSubview:v5];

    id v6 = [(DBNowPlayingWidgetViewController *)self multicastLabel];
    [v6 removeFromSuperview];

    [(DBNowPlayingWidgetViewController *)self setMulticastLabel:0];
  }
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__DBNowPlayingWidgetViewController_nowPlayingManager_didUpdateSnapshot___block_invoke;
  v7[3] = &unk_2649B3D30;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __72__DBNowPlayingWidgetViewController_nowPlayingManager_didUpdateSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    id v6 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Received an empty player response.", buf, 2u);
    }
    goto LABEL_29;
  }
  double v2 = [*(id *)(a1 + 40) lastSnapshot];
  id v3 = [v2 song];
  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 40) spinner];
    int v5 = v4 != 0;
  }
  else
  {
    int v5 = 1;
  }

  [*(id *)(a1 + 40) _setSpinnerVisible:0];
  [*(id *)(a1 + 40) setLastSnapshot:*(void *)(a1 + 32)];
  if (([*(id *)(a1 + 40) iOSOwnsMainAudio] & 1) != 0
    || ([*(id *)(a1 + 40) environment],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 environmentConfiguration],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isVehicleDataSession],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    [*(id *)(a1 + 40) setCurrentDataSource:*(void *)(a1 + 32)];
    int v10 = [*(id *)(a1 + 32) tracklist];
    id v6 = [v10 playingItemIndexPath];

    id v11 = DBLogForCategory(0xAuLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Received player response without any available now playing item.", buf, 2u);
      }

      [*(id *)(a1 + 40) _setNotPlaying];
      goto LABEL_28;
    }
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Received player response with playing index path %@", buf, 0xCu);
    }

    uint64_t v13 = [*(id *)(a1 + 32) song];

    if (v13)
    {
      double v14 = DBLogForCategory(0xAuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*(id *)(a1 + 32) song];
        *(_DWORD *)buf = 138412290;
        id v26 = v15;
        _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Updating now playing song: %@", buf, 0xCu);
      }
      [*(id *)(a1 + 40) _processArtworks];
      [*(id *)(a1 + 40) _processLabelsForCurrentlyPlayingSong];
      [*(id *)(a1 + 40) _updateArtworkConstraints];
      double v16 = [*(id *)(a1 + 40) progressView];
      int v17 = [v16 superview];

      int v18 = [*(id *)(a1 + 40) _showsProgressView];
      if (v5)
      {
        int v5 = 1;
        if (!v18) {
          goto LABEL_17;
        }
LABEL_23:
        int v19 = [*(id *)(a1 + 40) progressView];
        double v20 = *(void **)(a1 + 32);
        if (v20)
        {
          [v20 durationSnapshot];
        }
        else
        {
          uint64_t v24 = 0;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v21 = 0u;
        }
        [v19 setDurationSnapshot:&v21];

        if ((v5 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_27:
        objc_msgSend(*(id *)(a1 + 40), "_setupTransportControls", v21, v22, v23, v24);
LABEL_28:
        objc_msgSend(*(id *)(a1 + 40), "_processPlaybackControlsForCurrentlyPlayingSong", v21, v22, v23, v24);
LABEL_29:

        return;
      }
      int v5 = (v17 != 0) ^ v18;
      if (v18) {
        goto LABEL_23;
      }
    }
LABEL_17:
    if (!v5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
}

- (void)nowPlayingObserver:(id)a3 didChangeNowPlayingApplication:(id)a4
{
  id v5 = a4;
  id v6 = [v5 bundleIdentifier];
  uint64_t v7 = [(DBNowPlayingWidgetViewController *)self artworkButton];
  [v7 setAccessibilityValue:v6];

  id v9 = [v5 bundleIdentifier];

  id v8 = [(DBNowPlayingWidgetViewController *)self view];
  [v8 setAccessibilityValue:v9];
}

- (void)_updateAudioOwnership
{
  id v3 = [(id)objc_opt_class() nowPlayingQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__DBNowPlayingWidgetViewController__updateAudioOwnership__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

uint64_t __57__DBNowPlayingWidgetViewController__updateAudioOwnership__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) environment];
  id v3 = [v2 environmentConfiguration];
  if ([v3 isVehicleDataSession])
  {
    unint64_t v4 = [*(id *)(a1 + 32) environment];
    id v5 = [v4 environmentConfiguration];
    id v6 = [v5 session];
    int v7 = [v6 carOwnsMainAudio];

    if (v7)
    {
      id v8 = *(void **)(a1 + 32);
      return [v8 _carDidTakeMainAudio];
    }
  }
  else
  {
  }
  int v10 = *(void **)(a1 + 32);
  return [v10 _iOSDidTakeMainAudio];
}

- (void)_carDidTakeMainAudio
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DBNowPlayingWidgetViewController__carDidTakeMainAudio__block_invoke;
  block[3] = &unk_2649B3E90;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__DBNowPlayingWidgetViewController__carDidTakeMainAudio__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) iOSOwnsMainAudio];
  if (result)
  {
    id v3 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Car took main audio", v4, 2u);
    }

    [*(id *)(a1 + 32) setIOSOwnsMainAudio:0];
    return [*(id *)(a1 + 32) _reloadNowPlayingUpdatingLayout:1];
  }
  return result;
}

- (void)_iOSDidTakeMainAudio
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DBNowPlayingWidgetViewController__iOSDidTakeMainAudio__block_invoke;
  block[3] = &unk_2649B3E90;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__DBNowPlayingWidgetViewController__iOSDidTakeMainAudio__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) iOSOwnsMainAudio];
  if ((result & 1) == 0)
  {
    id v3 = DBLogForCategory(0xAuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "iOS took main audio", v4, 2u);
    }

    [*(id *)(a1 + 32) setIOSOwnsMainAudio:1];
    return [*(id *)(a1 + 32) _reloadNowPlayingUpdatingLayout:1];
  }
  return result;
}

- (void)_reloadNowPlayingUpdatingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (![(DBNowPlayingWidgetViewController *)self iOSOwnsMainAudio])
  {
    id v5 = [(DBWidgetViewController *)self environment];
    id v6 = [v5 environmentConfiguration];
    int v7 = [v6 isVehicleDataSession];

    if (v7)
    {
      id v8 = DBLogForCategory(0xAuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [NSNumber numberWithBool:v3];
        int v21 = 138412290;
        long long v22 = v9;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Resolved main audio to car, updating layout: %@", (uint8_t *)&v21, 0xCu);
      }
      int v10 = [(CAFNowPlayingManager *)self->_carNowPlayingManager lastSnapshot];
      [(DBNowPlayingWidgetViewController *)self setCurrentDataSource:v10];
LABEL_16:

      goto LABEL_17;
    }
  }
  id v11 = DBLogForCategory(0xAuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [NSNumber numberWithBool:v3];
    int v21 = 138412290;
    long long v22 = v12;
    _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Resolved main audio to iOS, updating layout: %@", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v13 = [(DBNowPlayingWidgetViewController *)self lastSnapshot];
  if (v13)
  {
    [(DBNowPlayingWidgetViewController *)self setCurrentDataSource:v13];
  }
  else
  {
    double v14 = [MEMORY[0x263F313A0] sharedManager];
    uint64_t v15 = [v14 snapshot];
    [(DBNowPlayingWidgetViewController *)self setCurrentDataSource:v15];
  }
  [(DBNowPlayingWidgetViewController *)self _removeMulticastBadge];
  uint64_t v16 = [(DBNowPlayingWidgetViewController *)self currentArtwork];
  if (v16)
  {
    int v17 = (void *)v16;
    int v18 = [(DBNowPlayingWidgetViewController *)self currentCatalog];

    if (v18)
    {
      int v19 = DBLogForCategory(0xAuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Reapplying iOS artwork", (uint8_t *)&v21, 2u);
      }

      int v10 = [(DBNowPlayingWidgetViewController *)self currentArtwork];
      double v20 = [(DBNowPlayingWidgetViewController *)self currentCatalog];
      [(DBNowPlayingWidgetViewController *)self _setCurrentArtwork:v10 withCatalog:v20];

      goto LABEL_16;
    }
  }
LABEL_17:
  [(DBNowPlayingWidgetViewController *)self _setSpinnerVisible:0];
  [(DBNowPlayingWidgetViewController *)self _processArtworks];
  [(DBNowPlayingWidgetViewController *)self _processLabelsForCurrentlyPlayingSong];
  if (v3)
  {
    [(DBNowPlayingWidgetViewController *)self _updateArtworkConstraints];
    [(DBNowPlayingWidgetViewController *)self _setupTransportControls];
    [(DBNowPlayingWidgetViewController *)self _processPlaybackControlsForCurrentlyPlayingSong];
  }
}

- (UIFocusContainerGuide)focusContainerGuide
{
  return self->_focusContainerGuide;
}

- (void)setFocusContainerGuide:(id)a3
{
}

- (UIFocusContainerGuide)controlsContainerGuide
{
  return self->_controlsContainerGuide;
}

- (void)setControlsContainerGuide:(id)a3
{
}

- (UILongPressGestureRecognizer)backLongPressRecognizer
{
  return self->_backLongPressRecognizer;
}

- (void)setBackLongPressRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)nextLongPressRecognizer
{
  return self->_nextLongPressRecognizer;
}

- (void)setNextLongPressRecognizer:(id)a3
{
}

- (int64_t)heldAction
{
  return self->_heldAction;
}

- (void)setHeldAction:(int64_t)a3
{
  self->_heldAction = a3;
}

- (BOOL)seeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (NSTimer)spinnerTimer
{
  return self->_spinnerTimer;
}

- (void)setSpinnerTimer:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (DBNowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
}

- (CPUINowPlayingSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
}

- (DBNowPlayingProviding)currentDataSource
{
  return self->_currentDataSource;
}

- (void)setCurrentDataSource:(id)a3
{
}

- (BOOL)iOSOwnsMainAudio
{
  return self->_iOSOwnsMainAudio;
}

- (void)setIOSOwnsMainAudio:(BOOL)a3
{
  self->_iOSOwnsMainAudio = a3;
}

- (NSArray)widgetConstraints
{
  return self->_widgetConstraints;
}

- (void)setWidgetConstraints:(id)a3
{
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

- (UIButton)artworkButton
{
  return self->_artworkButton;
}

- (void)setArtworkButton:(id)a3
{
}

- (DBNowPlayingFocusHighlightButton)playTransportButton
{
  return self->_playTransportButton;
}

- (void)setPlayTransportButton:(id)a3
{
}

- (DBNowPlayingFocusHighlightButton)nextTransportButton
{
  return self->_nextTransportButton;
}

- (void)setNextTransportButton:(id)a3
{
}

- (DBWidgetFocusRingView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
}

- (NSArray)layoutGuides
{
  return self->_layoutGuides;
}

- (void)setLayoutGuides:(id)a3
{
}

- (BOOL)showArtworkBorder
{
  return self->_showArtworkBorder;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (DBNowPlayingFocusHighlightButton)backTransportButton
{
  return self->_backTransportButton;
}

- (void)setBackTransportButton:(id)a3
{
}

- (UIStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (_TtC9DashBoard16DBMulticastLabel)multicastLabel
{
  return self->_multicastLabel;
}

- (void)setMulticastLabel:(id)a3
{
}

- (NSLayoutConstraint)artworkHorizontalConstraint
{
  return self->_artworkHorizontalConstraint;
}

- (void)setArtworkHorizontalConstraint:(id)a3
{
}

- (CPUIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
}

- (MPArtworkCatalog)previousCatalog
{
  return self->_previousCatalog;
}

- (void)setPreviousCatalog:(id)a3
{
}

- (UIImage)previousArtwork
{
  return self->_previousArtwork;
}

- (void)setPreviousArtwork:(id)a3
{
}

- (MPArtworkCatalog)currentCatalog
{
  return self->_currentCatalog;
}

- (void)setCurrentCatalog:(id)a3
{
}

- (UIImage)currentArtwork
{
  return self->_currentArtwork;
}

- (void)setCurrentArtwork:(id)a3
{
}

- (MPArtworkCatalog)nextCatalog
{
  return self->_nextCatalog;
}

- (void)setNextCatalog:(id)a3
{
}

- (UIImage)nextArtwork
{
  return self->_nextArtwork;
}

- (void)setNextArtwork:(id)a3
{
}

- (CAFNowPlayingManager)carNowPlayingManager
{
  return self->_carNowPlayingManager;
}

- (void)setCarNowPlayingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carNowPlayingManager, 0);
  objc_storeStrong((id *)&self->_nextArtwork, 0);
  objc_storeStrong((id *)&self->_nextCatalog, 0);
  objc_storeStrong((id *)&self->_currentArtwork, 0);
  objc_storeStrong((id *)&self->_currentCatalog, 0);
  objc_storeStrong((id *)&self->_previousArtwork, 0);
  objc_storeStrong((id *)&self->_previousCatalog, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_artworkHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_multicastLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_backTransportButton, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_focusRingView, 0);
  objc_storeStrong((id *)&self->_nextTransportButton, 0);
  objc_storeStrong((id *)&self->_playTransportButton, 0);
  objc_storeStrong((id *)&self->_artworkButton, 0);
  objc_storeStrong((id *)&self->_widgetConstraints, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_spinnerTimer, 0);
  objc_storeStrong((id *)&self->_nextLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_backLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_controlsContainerGuide, 0);
  objc_storeStrong((id *)&self->_focusContainerGuide, 0);
}

void __58__DBNowPlayingWidgetViewController__sendAction_withState___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end