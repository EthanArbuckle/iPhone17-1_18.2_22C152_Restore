@interface FUFlightView
- (BOOL)hasFollowupContent:(id)a3;
- (BOOL)highlightCurrentFlightLeg;
- (BOOL)ignoreMapUpdate;
- (BOOL)landscapeMode;
- (BOOL)landscapeModeForTraits:(id)a3;
- (BOOL)mapOnly;
- (BOOL)preservesSuperviewLayoutMargins;
- (BOOL)setFlights:(id)a3 selectedFlight:(int64_t)a4 selectedLeg:(int64_t)a5;
- (BOOL)showInfoPanel;
- (FUFlightViewDelegate)delegate;
- (MKMapView)mapView;
- (NSArray)flights;
- (NSLayoutConstraint)bottomMapConstraint;
- (NSLayoutConstraint)lanscapeConstraint1;
- (NSLayoutConstraint)lanscapeConstraint2;
- (NSLayoutConstraint)lanscapeConstraint3;
- (NSLayoutConstraint)leadingMapConstraint;
- (NSLayoutConstraint)pageContainerHeightConstraint;
- (NSLayoutConstraint)portraitConstraint1;
- (TLKProminenceView)borderLineViewLandscape;
- (TLKProminenceView)borderLineViewPortrait;
- (UIEdgeInsets)mapInsets;
- (UIPageControl)pageControl;
- (UIView)errorView;
- (UIView)loadingView;
- (UIVisualEffectView)backBlurView;
- (id)allLegs;
- (id)arrivalCamera;
- (id)currentFlight;
- (id)currentLeg;
- (id)departureCamera;
- (id)flightCamera;
- (id)flightForLeg:(id)a3;
- (id)infoViewControllerCreate;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)currentFocus;
- (int64_t)selectedFlight;
- (int64_t)selectedLeg;
- (unint64_t)absoluteLegIndex;
- (unint64_t)displayStyle;
- (void)addTrack:(id)a3;
- (void)awakeFromNib;
- (void)changeCurrentPage:(id)a3;
- (void)cleanupView;
- (void)didMoveToWindow;
- (void)fitMap:(BOOL)a3;
- (void)flightInfoView:(id)a3 didUpdateFocus:(int64_t)a4;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)removeMapBackground;
- (void)setAbsoluteIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setBackBlurView:(id)a3;
- (void)setBorderLineViewLandscape:(id)a3;
- (void)setBorderLineViewPortrait:(id)a3;
- (void)setBottomMapConstraint:(id)a3;
- (void)setCurrentFocus:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setErrorView:(id)a3;
- (void)setFlights:(id)a3;
- (void)setHighlightCurrentFlightLeg:(BOOL)a3;
- (void)setIgnoreMapUpdate:(BOOL)a3;
- (void)setLanscapeConstraint1:(id)a3;
- (void)setLanscapeConstraint2:(id)a3;
- (void)setLanscapeConstraint3:(id)a3;
- (void)setLeadingMapConstraint:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setMapInsets:(UIEdgeInsets)a3;
- (void)setMapView:(id)a3;
- (void)setPageContainerHeightConstraint:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPortraitConstraint1:(id)a3;
- (void)setSelectedFlight:(int64_t)a3;
- (void)setSelectedLeg:(int64_t)a3;
- (void)setShowInfoPanel:(BOOL)a3;
- (void)showError;
- (void)showInfo;
- (void)showLoading;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBorderLines;
- (void)updateConstraints;
- (void)updateMapAppearance;
- (void)updateMapArcs;
- (void)updateMapCamera;
- (void)updateOrientationConstraints;
- (void)updatePageControllerScrolling;
@end

@implementation FUFlightView

- (BOOL)mapOnly
{
  v2 = [(FUFlightView *)self borderLineViewPortrait];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)awakeFromNib
{
  v49.receiver = self;
  v49.super_class = (Class)FUFlightView;
  [(FUFlightView *)&v49 awakeFromNib];
  self->_selectedFlight = 0x7FFFFFFFFFFFFFFFLL;
  self->_selectedLeg = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v3 = [(FUFlightView *)self mapView];
  [v3 setPitchEnabled:0];

  v4 = [(FUFlightView *)self mapView];
  [v4 setShowsAttribution:1];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_updateMapAppearance name:*MEMORY[0x263F1D890] object:0];

  [(FUFlightView *)self updateMapAppearance];
  v6 = [(FUFlightView *)self mapView];
  [v6 setAlpha:0.0];

  if ([(FUFlightView *)self mapOnly])
  {
    v7 = [(FUFlightView *)self backBlurView];
    [v7 setAlpha:1.0];
  }
  v8 = [(FUFlightView *)self pageControl];
  [v8 setAlpha:0.0];

  v9 = [(FUFlightView *)self mapView];
  [v9 _setShowsAppleLogo:0];

  v10 = [MEMORY[0x263F086E0] mainBundle];
  v11 = [v10 bundleIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.datadetectors.DDActionsService"];

  if (v12)
  {
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:*MEMORY[0x263F107F0] object:0];
  }
  [(FUFlightView *)self setupStyles];
  self->_landscapeMode = [(FUFlightView *)self landscapeMode];
  if (![(FUFlightView *)self mapOnly])
  {
    v14 = [[FULockSafePageViewController alloc] initWithTransitionStyle:1 navigationOrientation:0 options:0];
    pageViewController = self->_pageViewController;
    self->_pageViewController = &v14->super;

    [(UIPageViewController *)self->_pageViewController setDelegate:self];
    [(UIPageViewController *)self->_pageViewController setDataSource:self];
    v16 = [(UIPageViewController *)self->_pageViewController view];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F1C940]);
    pageViewContainer = self->_pageViewContainer;
    self->_pageViewContainer = v17;
    v19 = v17;

    [(UIScrollView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v19 setScrollEnabled:0];
    [(UIScrollView *)v19 setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v19 setShowsHorizontalScrollIndicator:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);
    v21 = [MEMORY[0x263F1C480] effectWithStyle:10];
    [WeakRetained setEffect:v21];

    v22 = [WeakRetained contentView];
    v23 = [v22 safeAreaLayoutGuide];
    [v22 addSubview:v19];
    v24 = [(UIScrollView *)v19 leadingAnchor];
    v25 = [v23 leadingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIScrollView *)v19 trailingAnchor];
    v28 = [v22 trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [(UIScrollView *)v19 topAnchor];
    v31 = [v23 topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    v33 = [(UIScrollView *)v19 bottomAnchor];
    v34 = [v23 bottomAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UIPageViewController *)self->_pageViewController view];
    [(UIScrollView *)v19 addSubview:v36];
    v37 = [v36 leadingAnchor];
    v38 = [(UIScrollView *)v19 safeAreaLayoutGuide];
    v39 = [v38 leadingAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [v36 widthAnchor];
    v42 = [(UIScrollView *)v19 widthAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v44 = [v36 topAnchor];
    v45 = [(UIScrollView *)v19 topAnchor];

    v46 = [v44 constraintEqualToAnchor:v45];
    [v46 setActive:1];

    v47 = [(FUFlightView *)self borderLineViewLandscape];
    [v47 setProminence:3];

    v48 = [(FUFlightView *)self borderLineViewPortrait];
    [v48 setProminence:3];
  }
}

- (void)setDisplayStyle:(unint64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    [(FUFlightView *)self setupStyles];
  }
}

- (void)updateMapAppearance
{
  id v4 = [MEMORY[0x263F7E398] bestAppearanceForSystem];
  BOOL v3 = [(FUFlightView *)self mapView];
  [v4 overrideAppearanceForView:v3];
}

- (void)removeMapBackground
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!self->_spotlightMode)
  {
    self->_spotlightMode = 1;
    [(FUFlightView *)self updatePageControllerScrolling];
    BOOL v3 = [(FUFlightView *)self backBlurView];
    [v3 setEffect:0];

    id v4 = [(FUFlightView *)self mapView];
    [v4 setScrollEnabled:0];

    v5 = [(FUFlightView *)self mapView];
    [v5 setRotateEnabled:0];

    v6 = [(FUFlightView *)self mapView];
    [v6 setPitchEnabled:0];

    v7 = [(FUFlightView *)self mapView];
    [v7 setZoomEnabled:0];

    [(FUFlightView *)self setNeedsUpdateConstraints];
    [(FUFlightView *)self setNeedsLayout];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = self->_controllers;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "flightInfoView", (void)v14);
          [v13 updateForFollowupContent:self->_spotlightMode];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FUFlightView;
  id v4 = a3;
  [(FUFlightView *)&v11 tlk_updateForAppearance:v4];
  v5 = objc_msgSend(v4, "secondaryColor", v11.receiver, v11.super_class);
  v6 = [(FUFlightView *)self pageControl];
  [v6 setPageIndicatorTintColor:v5];

  v7 = [v4 primaryColor];
  v8 = [(FUFlightView *)self pageControl];
  [v8 setCurrentPageIndicatorTintColor:v7];

  uint64_t v9 = [(FUFlightView *)self pageControl];
  [v4 enableAppearanceForView:v9];

  [(FUFlightView *)self updateOrientationConstraints];
  BOOL v10 = [(FUFlightView *)self landscapeMode];
  if (self->_landscapeMode != v10)
  {
    self->_landscapeMode = v10;
    [(FUFlightView *)self setNeedsUpdateConstraints];
    [(FUFlightView *)self setNeedsLayout];
  }
}

- (BOOL)landscapeModeForTraits:(id)a3
{
  return !self->_spotlightMode && [a3 verticalSizeClass] == 1;
}

- (BOOL)landscapeMode
{
  v2 = self;
  BOOL v3 = [(FUFlightView *)self traitCollection];
  LOBYTE(v2) = [(FUFlightView *)v2 landscapeModeForTraits:v3];

  return (char)v2;
}

- (void)updateBorderLines
{
  if (self->_spotlightMode)
  {
    BOOL v3 = [(FUFlightView *)self borderLineViewLandscape];
    [v3 setHidden:1];

    id v4 = [(FUFlightView *)self borderLineViewPortrait];
    id v8 = v4;
    uint64_t v5 = 1;
  }
  else
  {
    BOOL v6 = [(FUFlightView *)self landscapeMode];
    v7 = [(FUFlightView *)self borderLineViewLandscape];
    [v7 setHidden:v6 ^ 1];

    id v4 = [(FUFlightView *)self borderLineViewPortrait];
    id v8 = v4;
    uint64_t v5 = v6;
  }
  [v4 setHidden:v5];
}

- (void)showLoading
{
  BOOL v3 = [(FUFlightView *)self loadingView];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [(FUFlightView *)self setLoadingView:v4];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);
    BOOL v6 = [WeakRetained contentView];
    [v6 addSubview:v4];

    v7 = [v4 leftAnchor];
    id v8 = [WeakRetained leftAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    [v9 setActive:1];

    BOOL v10 = [v4 rightAnchor];
    objc_super v11 = [WeakRetained rightAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [v4 topAnchor];
    long long v14 = [WeakRetained topAnchor];
    long long v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    long long v16 = [v4 bottomAnchor];
    long long v17 = [WeakRetained bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    [v4 setAlpha:0.0];
    [(FUFlightView *)self setNeedsUpdateConstraints];
  }
  objc_initWeak(&location, self);
  uint64_t v19 = (void *)MEMORY[0x263F1CB60];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __27__FUFlightView_showLoading__block_invoke;
  v20[3] = &unk_264BDD6B0;
  objc_copyWeak(&v21, &location);
  [v19 animateWithDuration:v20 animations:0.2];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __27__FUFlightView_showLoading__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v2 = [WeakRetained[55] view];
    [v2 setAlpha:0.0];

    BOOL v3 = [v8 pageControl];
    [v3 setAlpha:0.0];

    id v4 = [v8 errorView];
    [v4 setAlpha:0.0];

    uint64_t v5 = [v8 loadingView];
    [v5 setAlpha:1.0];

    if ([v8 mapOnly])
    {
      BOOL v6 = [v8 backBlurView];
      [v6 setAlpha:1.0];
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)showError
{
  BOOL v3 = [(FUFlightView *)self errorView];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [(FUFlightView *)self setErrorView:v4];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);
    BOOL v6 = [WeakRetained contentView];
    [v6 addSubview:v4];

    v7 = [v4 leftAnchor];
    id v8 = [WeakRetained leftAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    [v9 setActive:1];

    BOOL v10 = [v4 rightAnchor];
    objc_super v11 = [WeakRetained rightAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [v4 topAnchor];
    long long v14 = [WeakRetained topAnchor];
    long long v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    long long v16 = [v4 bottomAnchor];
    long long v17 = [WeakRetained bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    [v4 setAlpha:0.0];
    [(FUFlightView *)self setNeedsUpdateConstraints];
  }
  objc_initWeak(&location, self);
  uint64_t v19 = (void *)MEMORY[0x263F1CB60];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __25__FUFlightView_showError__block_invoke;
  v20[3] = &unk_264BDD6B0;
  objc_copyWeak(&v21, &location);
  [v19 animateWithDuration:v20 animations:0.2];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __25__FUFlightView_showError__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v2 = [WeakRetained[55] view];
    [v2 setAlpha:0.0];

    BOOL v3 = [v8 pageControl];
    [v3 setAlpha:0.0];

    id v4 = [v8 errorView];
    [v4 setAlpha:1.0];

    uint64_t v5 = [v8 loadingView];
    [v5 setAlpha:0.0];

    if ([v8 mapOnly])
    {
      BOOL v6 = [v8 backBlurView];
      [v6 setAlpha:1.0];
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)showInfo
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F1CB60];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __24__FUFlightView_showInfo__block_invoke;
  v3[3] = &unk_264BDD6B0;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v3 animations:0.2];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __24__FUFlightView_showInfo__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v2 = [WeakRetained[55] view];
    [v2 setAlpha:1.0];

    BOOL v3 = [v8 errorView];
    [v3 setAlpha:0.0];

    id v4 = [v8 loadingView];
    [v4 setAlpha:0.0];

    if ([v8 mapOnly])
    {
      uint64_t v5 = [v8 backBlurView];
      BOOL v6 = v5;
      double v7 = 0.0;
    }
    else
    {
      uint64_t v5 = [v8 pageControl];
      BOOL v6 = v5;
      double v7 = 1.0;
    }
    [v5 setAlpha:v7];

    id WeakRetained = v8;
  }
}

- (void)layoutMarginsDidChange
{
  if (!self->_spotlightMode) {
    [(FUFlightView *)self setNeedsLayout];
  }
}

- (BOOL)preservesSuperviewLayoutMargins
{
  return !self->_spotlightMode;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)FUFlightView;
  [(FUFlightView *)&v22 layoutSubviews];
  if (self->_spotlightMode)
  {
    double v3 = 20.0;
    double v4 = 20.0;
    double v5 = 20.0;
    double v6 = 20.0;
  }
  else
  {
    [(FUFlightView *)self layoutMargins];
    double v3 = v7;
    double v4 = v8;
    double v5 = v9;
    double v6 = v10;
  }
  objc_super v11 = [(FUFlightView *)self mapView];
  objc_msgSend(v11, "_setAttributionInsets:", 0.0, -v4, -v5, 0.0);

  if ([(FUFlightView *)self landscapeMode])
  {
    if (!self->_spotlightMode && ![(FUFlightView *)self mapOnly])
    {
      uint64_t v12 = [(FUFlightView *)self backBlurView];
      [v12 frame];
      double v14 = v13;

      uint64_t v15 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
      double v16 = -0.0;
      if (v15 == 1) {
        double v17 = v14;
      }
      else {
        double v17 = -0.0;
      }
      double v6 = v6 + v17;
      if (v15 != 1) {
        double v16 = v14;
      }
      double v4 = v4 + v16;
    }
  }
  else if (!self->_spotlightMode && ![(FUFlightView *)self mapOnly])
  {
    v18 = [(FUFlightView *)self backBlurView];
    [v18 frame];
    double v20 = v19;

    double v5 = v5 + v20;
  }
  id v21 = [(FUFlightView *)self mapView];
  objc_msgSend(v21, "_setEdgeInsets:", v3, v4, v5, v6);

  [(FUFlightView *)self fitMap:0];
  [(FUFlightView *)self updateBorderLines];
}

- (void)updateConstraints
{
  v19.receiver = self;
  v19.super_class = (Class)FUFlightView;
  [(FUFlightView *)&v19 updateConstraints];
  [(FUFlightView *)self updateOrientationConstraints];
  BOOL v3 = [(FUFlightView *)self landscapeMode];
  BOOL spotlightMode = self->_spotlightMode;
  BOOL v5 = !v3;
  int v6 = self->_spotlightMode && !v3;
  double v7 = [(FUFlightView *)self leadingMapConstraint];
  [v7 setActive:0];

  double v8 = (void *)MEMORY[0x263F08938];
  if (v5 || !spotlightMode)
  {
    double v9 = [(FUFlightView *)self mapView];
    double v10 = [v8 constraintWithItem:self attribute:5 relatedBy:0 toItem:v9 attribute:5 multiplier:1.0 constant:0.0];
    [(FUFlightView *)self setLeadingMapConstraint:v10];
  }
  else
  {
    double v9 = [(FUFlightView *)self backBlurView];
    double v10 = [(FUFlightView *)self mapView];
    objc_super v11 = [v8 constraintWithItem:v9 attribute:6 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:0.0];
    [(FUFlightView *)self setLeadingMapConstraint:v11];
  }
  uint64_t v12 = [(FUFlightView *)self leadingMapConstraint];
  [v12 setActive:1];

  double v13 = [(FUFlightView *)self bottomMapConstraint];
  [v13 setActive:0];

  double v14 = (void *)MEMORY[0x263F08938];
  if (v6)
  {
    uint64_t v15 = [(FUFlightView *)self backBlurView];
    double v16 = [(FUFlightView *)self mapView];
    double v17 = [v14 constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v16 attribute:4 multiplier:1.0 constant:0.0];
    [(FUFlightView *)self setBottomMapConstraint:v17];
  }
  else
  {
    uint64_t v15 = [(FUFlightView *)self mapView];
    double v16 = [v14 constraintWithItem:self attribute:4 relatedBy:0 toItem:v15 attribute:4 multiplier:1.0 constant:0.0];
    [(FUFlightView *)self setBottomMapConstraint:v16];
  }

  v18 = [(FUFlightView *)self bottomMapConstraint];
  [v18 setActive:1];
}

- (void)updateOrientationConstraints
{
  BOOL v3 = [(FUFlightView *)self landscapeMode];
  double v4 = [(FUFlightView *)self lanscapeConstraint1];
  [v4 setActive:v3];

  BOOL v5 = [(FUFlightView *)self lanscapeConstraint2];
  [v5 setActive:v3];

  int v6 = [(FUFlightView *)self lanscapeConstraint3];
  [v6 setActive:v3];

  id v7 = [(FUFlightView *)self portraitConstraint1];
  [v7 setActive:v3 ^ 1];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)FUFlightView;
  [(FUFlightView *)&v3 didMoveToWindow];
  [(FUFlightView *)self tlk_updateWithCurrentAppearance];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FUFlightView;
  [(FUFlightView *)&v10 traitCollectionDidChange:v4];
  [(FUFlightView *)self updateOrientationConstraints];
  [(FUFlightView *)self updateBorderLines];
  BOOL v5 = [(FUFlightView *)self landscapeMode];
  if (v5 != [(FUFlightView *)self landscapeModeForTraits:v4])
  {
    [(FUFlightView *)self setNeedsUpdateConstraints];
    [(FUFlightView *)self setNeedsLayout];
  }
  int v6 = [(FUFlightView *)self traitCollection];
  if ([v6 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_6:
    [(FUFlightView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_7;
  }
  id v7 = [(FUFlightView *)self traitCollection];
  uint64_t v8 = [v7 _vibrancy];
  uint64_t v9 = [v4 _vibrancy];

  if (v8 != v9) {
    goto LABEL_6;
  }
LABEL_7:
}

- (id)currentFlight
{
  unint64_t selectedFlight = self->_selectedFlight;
  if (selectedFlight == 0x7FFFFFFFFFFFFFFFLL
    || ([(FUFlightView *)self flights],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 count],
        v4,
        selectedFlight >= v5))
  {
    id v7 = 0;
  }
  else
  {
    int v6 = [(FUFlightView *)self flights];
    id v7 = [v6 objectAtIndexedSubscript:self->_selectedFlight];
  }

  return v7;
}

- (id)currentLeg
{
  objc_super v3 = [(FUFlightView *)self currentFlight];
  id v4 = v3;
  unint64_t selectedLeg = self->_selectedLeg;
  if (selectedLeg == 0x7FFFFFFFFFFFFFFFLL
    || ([v3 legs],
        int v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        selectedLeg >= v7))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [v4 legs];
    uint64_t v9 = [v8 objectAtIndexedSubscript:self->_selectedLeg];
  }

  return v9;
}

- (void)setHighlightCurrentFlightLeg:(BOOL)a3
{
  self->_highlightCurrentFlightLeg = a3;
  [(FUFlightView *)self updateMapArcs];
}

- (void)setShowInfoPanel:(BOOL)a3
{
  self->_showInfoPanel = a3;
  BOOL v4 = !a3;
  unint64_t v5 = [(FUFlightView *)self backBlurView];
  [v5 setHidden:v4];

  [(FUFlightView *)self updateBorderLines];

  [(FUFlightView *)self setNeedsLayout];
}

- (id)flightForLeg:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v5 = self->_flights;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        objc_super v11 = objc_msgSend(v10, "legs", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (*(id *)(*((void *)&v18 + 1) + 8 * j) == v4)
              {
                id v16 = v10;

                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v16 = 0;
    }
    while (v7);
  }
  else
  {
    id v16 = 0;
  }
LABEL_19:

  return v16;
}

- (unint64_t)absoluteLegIndex
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_super v3 = [(FUFlightView *)self currentLeg];
  if (v3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = self->_flights;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v25;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_super v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          objc_super v11 = [v10 legs];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            uint64_t v15 = v7;
            while (2)
            {
              uint64_t v16 = 0;
              uint64_t v7 = v15 + v13;
              do
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                if (v3 == *(void **)(*((void *)&v20 + 1) + 8 * v16))
                {

                  unint64_t v17 = v15 + v16;
                  goto LABEL_21;
                }
                ++v16;
              }
              while (v13 != v16);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
              uint64_t v15 = v7;
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v19;
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
        unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      while (v6);
    }
    else
    {
      unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_21:
  }
  else
  {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

- (id)allLegs
{
  return self->_allLegs;
}

- (void)setFlights:(id)a3
{
}

- (BOOL)setFlights:(id)a3 selectedFlight:(int64_t)a4 selectedLeg:(int64_t)a5
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v9 = a3;
  objc_super v10 = v9;
  p_flights = &self->_flights;
  if (*(_OWORD *)&self->_flights != __PAIR128__(a4, (unint64_t)v9) || self->_selectedLeg != a5)
  {
    int64_t v80 = a5;
    unint64_t v82 = a4;
    v83 = v9;
    objc_storeStrong((id *)&self->_flights, a3);
    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v14 = 432;
    controllers = self->_controllers;
    self->_controllers = v13;

    id v85 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    obuint64_t j = *p_flights;
    uint64_t v87 = [(NSArray *)obj countByEnumeratingWithState:&v94 objects:v100 count:16];
    if (v87)
    {
      uint64_t v86 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v87; ++i)
        {
          if (*(void *)v95 != v86) {
            objc_enumerationMutation(obj);
          }
          unint64_t v17 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          v88 = objc_msgSend(v17, "legs", v80);
          uint64_t v18 = [v88 count];
          if (v18)
          {
            uint64_t v19 = v18;
            [v85 addObjectsFromArray:v88];
            if (v19 >= 1)
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                long long v21 = [(FUFlightView *)self infoViewControllerCreate];
                [v21 flightInfoView];
                v23 = uint64_t v22 = v14;
                objc_msgSend(v23, "setFlight:legIndex:multiFlights:spotlightMode:", v17, j, -[NSArray count](*p_flights, "count") > 1, self->_spotlightMode);

                long long v24 = [v21 flightInfoView];
                [v24 setDelegate:self];

                uint64_t v14 = v22;
                [*(id *)((char *)&self->super.super.super.isa + v22) addObject:v21];
              }
            }
          }
        }
        uint64_t v87 = [(NSArray *)obj countByEnumeratingWithState:&v94 objects:v100 count:16];
      }
      while (v87);
    }

    objc_storeStrong((id *)&self->_allLegs, v85);
    uint64_t v25 = [(NSArray *)self->_allLegs count];
    double v26 = 0.0;
    if (v25 >= 2)
    {
      if ([(FUFlightView *)self mapOnly]) {
        double v26 = 0.0;
      }
      else {
        double v26 = 1.0;
      }
    }
    long long v27 = [(FUFlightView *)self pageControl];
    [v27 setAlpha:v26];

    objc_super v10 = v83;
    if (!v83) {
      goto LABEL_26;
    }
    if (![v83 count]) {
      goto LABEL_26;
    }
    uint64_t v28 = [v83 firstObject];
    [v28 legs];
    v29 = uint64_t v89 = v14;
    uint64_t v30 = [v29 count];

    uint64_t v31 = v89;
    if (!v30)
    {
LABEL_26:
      [(FUFlightView *)self cleanupView];
LABEL_60:

      BOOL v12 = 1;
      goto LABEL_61;
    }
    self->_highlightCurrentFlightLeg = 1;
    if (v82 == 0x7FFFFFFFFFFFFFFFLL || [v83 count] <= v82)
    {
      if ([v83 count] == 1)
      {
        int64_t v32 = 0;
      }
      else
      {
        int64_t v32 = 0;
        while (1)
        {
          v33 = [v83 objectAtIndexedSubscript:v32];
          unint64_t v34 = v32 + 1;
          v35 = [v83 objectAtIndexedSubscript:v32 + 1];
          v36 = [v33 arrival];
          v37 = [v36 time];
          [v37 timeIntervalSinceNow];
          double v39 = v38;

          v40 = [v35 departure];
          v41 = [v40 time];
          [v41 timeIntervalSinceNow];
          double v43 = v42;

          if (v39 > 0.0) {
            break;
          }
          if (v39 < 0.0) {
            double v39 = -v39;
          }
          if (v43 < 0.0) {
            double v43 = -v43;
          }

          if (v39 >= v43)
          {
            ++v32;
            if (v34 < [v83 count] - 1) {
              continue;
            }
          }
          goto LABEL_39;
        }
      }
LABEL_39:
      self->_unint64_t selectedFlight = v32;
      self->_unint64_t selectedLeg = 0;
    }
    else
    {
      self->_unint64_t selectedFlight = v82;
      if (v81 == 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_unint64_t selectedLeg = 0;
LABEL_41:
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v44 = *(id *)((char *)&self->super.super.super.isa + v31);
        uint64_t v45 = [v44 countByEnumeratingWithState:&v90 objects:v99 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v91;
          double v48 = *MEMORY[0x263F1D490];
          double v49 = *(double *)(MEMORY[0x263F1D490] + 8);
          double v50 = 0.0;
          do
          {
            for (uint64_t k = 0; k != v46; ++k)
            {
              if (*(void *)v91 != v47) {
                objc_enumerationMutation(v44);
              }
              v52 = [*(id *)(*((void *)&v90 + 1) + 8 * k) view];
              LODWORD(v53) = 1132068864;
              LODWORD(v54) = 1144750080;
              objc_msgSend(v52, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v48, v49, v54, v53);
              double v56 = v55;

              if (v50 < v56) {
                double v50 = v56;
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v90 objects:v99 count:16];
          }
          while (v46);
        }
        else
        {
          double v50 = 0.0;
        }

        unint64_t v57 = [(FUFlightView *)self absoluteLegIndex];
        pageViewController = self->_pageViewController;
        v59 = [*(id *)((char *)&self->super.super.super.isa + v89) objectAtIndexedSubscript:v57];
        v98 = v59;
        v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v98 count:1];
        [(UIPageViewController *)pageViewController setViewControllers:v60 direction:0 animated:0 completion:0];

        v61 = [(FUFlightView *)self pageControl];
        [v61 setNumberOfPages:v25];

        [(FUFlightView *)self updatePageControllerScrolling];
        pageControllerHeightConstraint = self->_pageControllerHeightConstraint;
        if (pageControllerHeightConstraint || !self->_pageViewController)
        {
          [(NSLayoutConstraint *)pageControllerHeightConstraint constant];
          if (v63 != v50) {
            [(NSLayoutConstraint *)self->_pageControllerHeightConstraint setConstant:v50];
          }
        }
        else
        {
          v64 = (void *)MEMORY[0x263F08938];
          v65 = [(UIPageViewController *)self->_pageViewController view];
          v66 = [v64 constraintWithItem:v65 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v50];
          v67 = self->_pageControllerHeightConstraint;
          self->_pageControllerHeightConstraint = v66;

          v68 = [(UIPageViewController *)self->_pageViewController view];
          v69 = [v68 superview];
          [v69 addConstraint:self->_pageControllerHeightConstraint];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_pageContainerHeightConstraint);
        id v71 = objc_loadWeakRetained((id *)&self->_backBlurView);
        [v71 safeAreaInsets];
        [WeakRetained setConstant:ceil(v50 + v72)];

        LODWORD(v73) = 1148846080;
        if (!self->_spotlightMode) {
          *(float *)&double v73 = 999.0;
        }
        [WeakRetained setPriority:v73];
        -[UIScrollView setContentSize:](self->_pageViewContainer, "setContentSize:", -1.0, v50);
        -[UIScrollView scrollRectToVisible:animated:](self->_pageViewContainer, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
        [(FUFlightView *)self setAbsoluteIndex:v57 animated:0];

        goto LABEL_60;
      }
      v75 = [v83 objectAtIndexedSubscript:v82];
      v76 = [v75 legs];
      unint64_t v77 = [v76 count];

      if (v77 <= v81)
      {
        v78 = [v83 objectAtIndexedSubscript:v82];
        v79 = [v78 legs];
        self->_unint64_t selectedLeg = [v79 count] - 1;
      }
      else
      {
        self->_unint64_t selectedLeg = v81;
        self->_highlightCurrentFlightLeg = 0;
      }
    }
    uint64_t v31 = v89;
    goto LABEL_41;
  }
  BOOL v12 = 0;
LABEL_61:

  return v12;
}

- (void)updatePageControllerScrolling
{
  objc_super v3 = [(FUFlightView *)self pageControl];
  uint64_t v4 = [v3 numberOfPages];

  uint64_t v5 = [(UIPageViewController *)self->_pageViewController view];
  uint64_t v6 = [v5 subviews];
  uint64_t v7 = [v6 firstObject];
  [v7 setScrollEnabled:v4 > 1];

  [(UIScrollView *)self->_pageViewContainer setScrollEnabled:!self->_spotlightMode];
  BOOL v8 = !self->_spotlightMode;
  pageViewContainer = self->_pageViewContainer;

  [(UIScrollView *)pageViewContainer setShowsVerticalScrollIndicator:v8];
}

- (void)setSelectedLeg:(int64_t)a3
{
  unint64_t selectedFlight = self->_selectedFlight;
  if (selectedFlight != 0x7FFFFFFFFFFFFFFFLL && selectedFlight < [(NSArray *)self->_flights count])
  {
    uint64_t v6 = [(NSArray *)self->_flights objectAtIndexedSubscript:self->_selectedFlight];
    id v9 = [v6 legs];

    if (a3 != 0x7FFFFFFFFFFFFFFFLL && [v9 count] > (unint64_t)a3)
    {
      allLegs = self->_allLegs;
      BOOL v8 = [v9 objectAtIndexedSubscript:a3];
      [(FUFlightView *)self setAbsoluteIndex:[(NSArray *)allLegs indexOfObject:v8] animated:1];
    }
  }
}

- (void)updateMapArcs
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  objc_super v3 = self->_tracks;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [(FUFlightView *)self mapView];
        objc_super v10 = [v8 polyline];
        [v9 removeOverlay:v10];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v5);
  }

  tracks = self->_tracks;
  self->_tracks = 0;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v12 = self->_allLegs;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v18 = objc_msgSend(v17, "departure", (void)v32);
        uint64_t v19 = [v18 airport];

        long long v20 = [v17 arrival];
        long long v21 = [v20 airport];

        if (v19) {
          BOOL v22 = v21 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22)
        {
          [v19 location];
          CLLocationDegrees v24 = v23;
          [v19 location];
          CLLocationCoordinate2D v44 = CLLocationCoordinate2DMake(v24, v25);
          v40[0] = MKMapPointForCoordinate(v44);
          [v21 location];
          CLLocationDegrees v27 = v26;
          [v21 location];
          CLLocationCoordinate2D v45 = CLLocationCoordinate2DMake(v27, v28);
          v40[1] = MKMapPointForCoordinate(v45);
          v29 = objc_opt_new();
          uint64_t v30 = [MEMORY[0x263F108E8] polylineWithPoints:v40 count:2];
          [v29 setPolyline:v30];

          [v29 setLeg:v17];
          uint64_t v31 = [(FUFlightView *)self currentLeg];

          if (v17 == v31) {
            objc_storeStrong((id *)&self->_currentTrack, v29);
          }
          [(FUFlightView *)self addTrack:v29];
        }
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v14);
  }
}

- (void)setAbsoluteIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v43 = a4;
  if ([(NSArray *)self->_allLegs count] > a3)
  {
    self->_unint64_t selectedFlight = 0x7FFFFFFFFFFFFFFFLL;
    self->_unint64_t selectedLeg = 0x7FFFFFFFFFFFFFFFLL;
    if ([(NSArray *)self->_flights count])
    {
      unint64_t v6 = 0;
      uint64_t v7 = 0;
      while (1)
      {
        BOOL v8 = [(NSArray *)self->_flights objectAtIndexedSubscript:v6];
        id v9 = [v8 legs];
        uint64_t v10 = [v9 count];

        if (v10) {
          break;
        }
        uint64_t v12 = v7;
LABEL_10:

        ++v6;
        uint64_t v7 = v12;
        if (v6 >= [(NSArray *)self->_flights count]) {
          return;
        }
      }
      unint64_t v11 = 0;
      uint64_t v12 = v7;
      while (a3 != v12)
      {
        ++v12;
        ++v11;
        uint64_t v13 = [v8 legs];
        unint64_t v14 = [v13 count];

        if (v11 >= v14) {
          goto LABEL_10;
        }
      }
      self->_unint64_t selectedFlight = v6;
      self->_unint64_t selectedLeg = a3 - v7;

      if (!self->_planeTracker)
      {
        uint64_t v15 = +[FUPlaneTrackerAnnotationView defaultAnotation];
        planeTracker = self->_planeTracker;
        self->_planeTracker = v15;

        unint64_t v17 = [(FUFlightView *)self mapView];
        [v17 addAnnotation:self->_planeTracker];
      }
      id v42 = [(FUFlightView *)self currentLeg];
      unint64_t v18 = [v42 status];
      if (v18 >= 4)
      {
        double v21 = 0.0;
        if (v18 != 6) {
          double v21 = -1.0;
        }
        if (v18 - 4 >= 2) {
          double v20 = v21;
        }
        else {
          double v20 = 1.0;
        }
      }
      else
      {
        [v42 currentProgress];
        double v20 = v19;
      }
      BOOL v22 = [v42 departure];
      double v23 = [v22 airport];

      CLLocationDegrees v24 = [v42 arrival];
      CLLocationDegrees v25 = [v24 airport];

      BOOL v28 = v20 >= 0.0 && v23 != 0 && v25 != 0;
      [(FUPlaneTrackerAnnotationView *)self->_planeTracker setShowsPlane:v28];
      if (v28)
      {
        v29 = self->_planeTracker;
        [v23 location];
        double v31 = v30;
        [v23 location];
        double v33 = v32;
        [v25 location];
        double v35 = v34;
        [v25 location];
        [(FUPlaneTrackerAnnotationView *)v29 setStartLatitude:v31 startLongitude:v33 endLatitude:v35 endLongitude:v36];
        [(FUPlaneTrackerAnnotationView *)self->_planeTracker setCurrentProgress:v20];
      }
      [(FUFlightView *)self updateMapArcs];
      [(FUFlightView *)self fitMap:v43];
      long long v37 = [(UIPageViewController *)self->_pageViewController viewControllers];
      long long v38 = [v37 firstObject];
      long long v39 = [v38 flightInfoView];
      [v39 setCurrentFocus:2];

      v40 = [(FUFlightView *)self pageControl];
      [v40 setCurrentPage:a3];

      v41 = [(FUFlightView *)self delegate];
      if (v41 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v41 flightView:self didSelectLeg:self->_selectedLeg ofFlight:self->_selectedFlight];
      }
    }
  }
}

- (void)setMapInsets:(UIEdgeInsets)a3
{
  self->_mapInsets = a3;
  [(FUFlightView *)self fitMap:0];
}

- (void)addTrack:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_tracks)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = (NSMutableArray *)objc_opt_new();
  tracks = self->_tracks;
  self->_tracks = v7;

  id v4 = v9;
  if (v9)
  {
LABEL_3:
    uint64_t v5 = [(FUFlightView *)self mapView];
    unint64_t v6 = [v9 polyline];
    [v5 addOverlay:v6];

    [(NSMutableArray *)self->_tracks addObject:v9];
    id v4 = v9;
  }
LABEL_4:
}

- (void)cleanupView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_planeTracker)
  {
    objc_super v3 = [(FUFlightView *)self mapView];
    [v3 removeAnnotation:self->_planeTracker];

    planeTracker = self->_planeTracker;
    self->_planeTracker = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_tracks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        unint64_t v11 = [(FUFlightView *)self mapView];
        uint64_t v12 = [v10 polyline];
        [v11 removeOverlay:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_tracks removeAllObjects];
  currentTracuint64_t k = self->_currentTrack;
  self->_currentTracuint64_t k = 0;
}

- (id)arrivalCamera
{
  objc_super v3 = (void *)MEMORY[0x263F10940];
  id v4 = [(FUFlightView *)self currentLeg];
  uint64_t v5 = [v4 arrival];
  uint64_t v6 = [v5 airport];
  [v6 location];
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(FUFlightView *)self currentLeg];
  uint64_t v12 = [v11 arrival];
  uint64_t v13 = [v12 airport];
  [v13 location];
  long long v16 = objc_msgSend(v3, "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", v8, v10, v14, v15, 300000.0);

  [v16 setPitch:0.0];

  return v16;
}

- (id)departureCamera
{
  objc_super v3 = (void *)MEMORY[0x263F10940];
  id v4 = [(FUFlightView *)self currentLeg];
  uint64_t v5 = [v4 departure];
  uint64_t v6 = [v5 airport];
  [v6 location];
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(FUFlightView *)self currentLeg];
  uint64_t v12 = [v11 departure];
  uint64_t v13 = [v12 airport];
  [v13 location];
  long long v16 = objc_msgSend(v3, "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", v8, v10, v14, v15, 300000.0);

  [v16 setPitch:0.0];

  return v16;
}

- (id)flightCamera
{
  objc_super v3 = (void *)MEMORY[0x263F10940];
  [(FUPlaneTrackerAnnotationView *)self->_planeTracker currentLocation];
  double v5 = v4;
  double v7 = v6;
  [(FUPlaneTrackerAnnotationView *)self->_planeTracker currentLocation];
  double v10 = objc_msgSend(v3, "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", v5, v7, v8, v9, 30000000.0);
  [v10 setPitch:0.0];

  return v10;
}

- (void)fitMap:(BOOL)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  self->_currentFocus = 2;
  if (!self->_ignoreMapUpdate)
  {
    tracks = self->_tracks;
    if (tracks)
    {
      BOOL v5 = a3;
      if ([(NSMutableArray *)tracks count])
      {
        if (self->_currentTrack && ![(FUFlightView *)self mapOnly])
        {
          double v10 = [(FUFLightTrack *)self->_currentTrack polyline];
          [(NSMutableArray *)v10 boundingMapRect];
          double x = v29;
          double y = v30;
          double v8 = v31;
          double height = v32;
        }
        else
        {
          double x = *MEMORY[0x263F10858];
          double y = *(double *)(MEMORY[0x263F10858] + 8);
          double v8 = *(double *)(MEMORY[0x263F10858] + 16);
          double height = *(double *)(MEMORY[0x263F10858] + 24);
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          double v10 = self->_tracks;
          uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v77 objects:v81 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v78;
            double v74 = *MEMORY[0x263F10860] + *(double *)(MEMORY[0x263F10860] + 16);
            double v75 = y;
            double v76 = x;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v78 != v13) {
                  objc_enumerationMutation(v10);
                }
                double v15 = objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * i), "polyline", *(void *)&v66);
                [v15 boundingMapRect];
                double v17 = v16;
                double v19 = v18;
                double v21 = v20;
                double v23 = v22;

                if (x == v76 && y == v75)
                {
                  double height = v23;
                  double v8 = v21;
                  double y = v19;
                  double x = v17;
                }
                else if (v17 != v76 || v19 != v75)
                {
                  v83.origin.double x = x;
                  v83.origin.double y = y;
                  v83.size.double width = v8;
                  v83.size.double height = height;
                  v90.origin.double x = v17;
                  v90.origin.double y = v19;
                  v90.size.double width = v21;
                  v90.size.double height = v23;
                  MKMapRect v84 = MKMapRectUnion(v83, v90);
                  double rect1_8 = v84.origin.x;
                  double rect1_16 = v84.origin.y;
                  double width = v84.size.width;
                  double rect1 = x;
                  double rect1_24 = v84.size.height;
                  double x = x + v74;
                  v84.origin.double x = x;
                  v84.origin.double y = y;
                  v84.size.double width = v8;
                  v84.size.double height = height;
                  v91.origin.double x = v17;
                  v91.origin.double y = v19;
                  v91.size.double width = v21;
                  v91.size.double height = v23;
                  MKMapRect v85 = MKMapRectUnion(v84, v91);
                  BOOL v25 = v85.size.width < width;
                  if (v85.size.width < width) {
                    double v26 = height;
                  }
                  else {
                    double v26 = rect1_24;
                  }
                  if (v25) {
                    double v27 = v8;
                  }
                  else {
                    double v27 = width;
                  }
                  double v66 = v27;
                  double v28 = rect1_16;
                  if (v25) {
                    double v28 = y;
                  }
                  double rect1_16a = v28;
                  double rect1_24a = v26;
                  if (!v25) {
                    double x = rect1_8;
                  }
                  v92.origin.double x = v17 + v74;
                  v86.origin.double x = rect1;
                  v86.origin.double y = y;
                  v86.size.double width = v8;
                  v86.size.double height = height;
                  v92.origin.double y = v19;
                  v92.size.double width = v21;
                  v92.size.double height = v23;
                  MKMapRect v87 = MKMapRectUnion(v86, v92);
                  double v8 = v66;
                  double y = rect1_16a;
                  double height = rect1_24a;
                  if (v87.size.width < v66)
                  {
                    double height = v87.size.height;
                    double v8 = v87.size.width;
                    double y = v87.origin.y;
                    double x = v87.origin.x;
                  }
                }
              }
              uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v77 objects:v81 count:16];
            }
            while (v12);
          }
        }

        double v33 = [(FUFlightView *)self mapView];
        double v34 = x;
        double v35 = y;
        objc_msgSend(v33, "mapRectThatFits:edgePadding:", x, y, v8, height, 25.0, 20.0, 20.0, 20.0);
        MKCoordinateRegion v89 = MKCoordinateRegionForMapRect(v88);
        double latitude = v89.center.latitude;
        double longitude = v89.center.longitude;
        double latitudeDelta = v89.span.latitudeDelta;
        double longitudeDelta = v89.span.longitudeDelta;

        v40 = [(FUFlightView *)self mapView];
        objc_msgSend(v40, "_zoomLevelForRegion:includeAccessoryPadding:", 0, latitude, longitude, latitudeDelta, longitudeDelta);
        double v42 = v41;
        BOOL v43 = [(FUFlightView *)self mapView];
        [v43 _minimumZoomLevel];
        double v45 = v44;

        if (v42 <= v45)
        {
          [(FUPlaneTrackerAnnotationView *)self->_planeTracker currentLocation];
          double v50 = v49;
          double v51 = -84.0;
          if (v48 >= -84.0) {
            double v51 = v48;
          }
          if (v48 <= 84.0) {
            double v52 = v51;
          }
          else {
            double v52 = 84.0;
          }
          if (!self->_spotlightMode)
          {
            double latitudeDelta = latitudeDelta / 2.5;
            double longitudeDelta = longitudeDelta / 2.5;
          }
          double v53 = [(FUFlightView *)self mapView];
          objc_msgSend(v53, "regionThatFits:", v52, v50, latitudeDelta, longitudeDelta);
          double v55 = v54;
          double v57 = v56;
          double v59 = v58;
          double v61 = v60;

          double v47 = MEMORY[0x237DB8100](v55, v57, v59, v61);
          double v46 = v62;
          double v8 = v63;
          double height = v64;
        }
        else
        {
          double v46 = v35;
          double v47 = v34;
        }
        v65 = [(FUFlightView *)self mapView];
        objc_msgSend(v65, "setVisibleMapRect:edgePadding:animated:", v5, v47, v46, v8, height, 25.0, 20.0, 20.0, 20.0);
      }
    }
  }
}

- (void)updateMapCamera
{
  if (self->_currentFocus == 2) {
    [(FUFlightView *)self fitMap:0];
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F109C8]) initWithOverlay:v5];
    goto LABEL_9;
  }
  id v6 = v5;
  double v7 = (void *)[objc_alloc(MEMORY[0x263F10A10]) initWithPolyline:v6];
  double v8 = [MEMORY[0x263F1C550] orangeColor];
  [v7 setFillColor:v8];
  [v7 setStrokeColor:v8];
  uint64_t v9 = [(FUFLightTrack *)self->_currentTrack polyline];
  if ((id)v9 == v6)
  {

    goto LABEL_7;
  }
  double v10 = (void *)v9;
  BOOL v11 = [(FUFlightView *)self highlightCurrentFlightLeg];

  if (!v11)
  {
LABEL_7:
    [v7 setLineWidth:2.0];
    goto LABEL_8;
  }
  [v7 setLineWidth:1.0];
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E6BB078, &unk_26E6BB088, 0);
  [v7 setLineDashPattern:v12];

LABEL_8:
LABEL_9:

  return v7;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  uint64_t v5 = [(FUFlightView *)self currentLeg];
  if (v5)
  {
    id v6 = (void *)v5;
    double v7 = [(FUFlightView *)self mapView];
    [v7 alpha];
    double v9 = v8;

    if (v9 < 1.0)
    {
      dispatch_time_t v10 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke;
      block[3] = &unk_264BDD588;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke_2;
  v2[3] = &unk_264BDD588;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.4];
}

void __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mapView];
  [v2 setAlpha:1.0];

  if ([*(id *)(a1 + 32) mapOnly])
  {
    id v3 = [*(id *)(a1 + 32) backBlurView];
    [v3 setAlpha:0.0];
  }
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  if (a6)
  {
    double v7 = [a3 viewControllers];
    id v12 = [v7 firstObject];

    allLegs = self->_allLegs;
    double v9 = [v12 flightInfoView];
    dispatch_time_t v10 = [v9 leg];
    uint64_t v11 = [(NSArray *)allLegs indexOfObject:v10];

    [(FUFlightView *)self setAbsoluteIndex:v11 animated:1];
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5 = [(NSMutableArray *)self->_controllers indexOfObject:a4];
  if (v5) {
    BOOL v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [(NSMutableArray *)self->_controllers objectAtIndexedSubscript:v5 - 1];
  }

  return v7;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5 = [(NSMutableArray *)self->_controllers indexOfObject:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v6 = v5 + 1, v5 + 1 >= (unint64_t)[(NSMutableArray *)self->_controllers count]))
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [(NSMutableArray *)self->_controllers objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (void)changeCurrentPage:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = [(FUFlightView *)self pageControl];
  uint64_t v5 = [v4 currentPage];

  allLegs = self->_allLegs;
  double v7 = [(FUFlightView *)self currentLeg];
  uint64_t v8 = [(NSArray *)allLegs indexOfObject:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 != v5)
  {
    pageViewController = self->_pageViewController;
    uint64_t v11 = [(NSMutableArray *)self->_controllers objectAtIndexedSubscript:v5];
    v13[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [(UIPageViewController *)pageViewController setViewControllers:v12 direction:v5 <= v8 animated:1 completion:0];

    [(FUFlightView *)self setAbsoluteIndex:v5 animated:1];
  }
}

- (BOOL)hasFollowupContent:(id)a3
{
  return self->_spotlightMode;
}

- (void)flightInfoView:(id)a3 didUpdateFocus:(int64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v10 = v6;
    double v7 = [(FUFlightView *)self mapView];
    uint64_t v8 = [(FUFlightView *)self departureCamera];
LABEL_7:
    double v9 = (void *)v8;
    [v7 setCamera:v8 animated:1];

    goto LABEL_8;
  }
  if (a4 == 1)
  {
    id v10 = v6;
    double v7 = [(FUFlightView *)self mapView];
    uint64_t v8 = [(FUFlightView *)self arrivalCamera];
    goto LABEL_7;
  }
  if (a4 != 2) {
    goto LABEL_9;
  }
  id v10 = v6;
  [(FUFlightView *)self fitMap:1];
LABEL_8:
  id v6 = v10;
LABEL_9:
}

- (id)infoViewControllerCreate
{
  v2 = [[FUFlightInfoViewController alloc] initWithStyle:self->_displayStyle];

  return v2;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (UIEdgeInsets)mapInsets
{
  double top = self->_mapInsets.top;
  double left = self->_mapInsets.left;
  double bottom = self->_mapInsets.bottom;
  double right = self->_mapInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)ignoreMapUpdate
{
  return self->_ignoreMapUpdate;
}

- (void)setIgnoreMapUpdate:(BOOL)a3
{
  self->_ignoreMapUpdate = a3;
}

- (int64_t)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(int64_t)a3
{
  self->_currentFocus = a3;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (UIVisualEffectView)backBlurView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);

  return (UIVisualEffectView *)WeakRetained;
}

- (void)setBackBlurView:(id)a3
{
}

- (TLKProminenceView)borderLineViewLandscape
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_borderLineViewLandscape);

  return (TLKProminenceView *)WeakRetained;
}

- (void)setBorderLineViewLandscape:(id)a3
{
}

- (TLKProminenceView)borderLineViewPortrait
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_borderLineViewPortrait);

  return (TLKProminenceView *)WeakRetained;
}

- (void)setBorderLineViewPortrait:(id)a3
{
}

- (UIPageControl)pageControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageControl);

  return (UIPageControl *)WeakRetained;
}

- (void)setPageControl:(id)a3
{
}

- (NSLayoutConstraint)pageContainerHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageContainerHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setPageContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)lanscapeConstraint1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lanscapeConstraint1);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLanscapeConstraint1:(id)a3
{
}

- (NSLayoutConstraint)lanscapeConstraint2
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lanscapeConstraint2);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLanscapeConstraint2:(id)a3
{
}

- (NSLayoutConstraint)lanscapeConstraint3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lanscapeConstraint3);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLanscapeConstraint3:(id)a3
{
}

- (NSLayoutConstraint)portraitConstraint1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_portraitConstraint1);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setPortraitConstraint1:(id)a3
{
}

- (UIView)errorView
{
  return (UIView *)objc_getProperty(self, a2, 584, 1);
}

- (void)setErrorView:(id)a3
{
}

- (UIView)loadingView
{
  return (UIView *)objc_getProperty(self, a2, 592, 1);
}

- (void)setLoadingView:(id)a3
{
}

- (NSArray)flights
{
  return self->_flights;
}

- (int64_t)selectedFlight
{
  return self->_selectedFlight;
}

- (void)setSelectedFlight:(int64_t)a3
{
  self->_unint64_t selectedFlight = a3;
}

- (int64_t)selectedLeg
{
  return self->_selectedLeg;
}

- (BOOL)highlightCurrentFlightLeg
{
  return self->_highlightCurrentFlightLeg;
}

- (BOOL)showInfoPanel
{
  return self->_showInfoPanel;
}

- (FUFlightViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FUFlightViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSLayoutConstraint)bottomMapConstraint
{
  return self->_bottomMapConstraint;
}

- (void)setBottomMapConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingMapConstraint
{
  return self->_leadingMapConstraint;
}

- (void)setLeadingMapConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingMapConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMapConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flights, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_destroyWeak((id *)&self->_portraitConstraint1);
  objc_destroyWeak((id *)&self->_lanscapeConstraint3);
  objc_destroyWeak((id *)&self->_lanscapeConstraint2);
  objc_destroyWeak((id *)&self->_lanscapeConstraint1);
  objc_destroyWeak((id *)&self->_pageContainerHeightConstraint);
  objc_destroyWeak((id *)&self->_pageControl);
  objc_destroyWeak((id *)&self->_borderLineViewPortrait);
  objc_destroyWeak((id *)&self->_borderLineViewLandscape);
  objc_destroyWeak((id *)&self->_backBlurView);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_allLegs, 0);
  objc_storeStrong((id *)&self->_pageControllerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewContainer, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_currentTrack, 0);
  objc_storeStrong((id *)&self->_tracks, 0);

  objc_storeStrong((id *)&self->_planeTracker, 0);
}

@end