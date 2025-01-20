@interface ASCAdLockupView
+ (double)topContentViewSpacing;
- (ASCAdLockupPresenter)adLockupPresenter;
- (ASCAdLockupView)initWithCoder:(id)a3;
- (ASCAdLockupView)initWithFrame:(CGRect)a3;
- (ASCAdLockupViewDelegate)delegate;
- (ASCAdTransparencyContainerView)adTransparencyContainer;
- (ASCAppearMetricsPresenter)metricsPresenter;
- (ASCGradientBackgroundView)gradientBackgroundView;
- (ASCLockup)lockup;
- (ASCLockupContentView)contentView;
- (ASCLockupMediaPresenter)lockupMediaPresenter;
- (ASCLockupMediaView)mediaView;
- (ASCLockupPresenter)lockupPresenter;
- (ASCLockupRequest)request;
- (ASCLockupViewGroup)group;
- (ASCMaterialBackgroundView)materialBackgroundView;
- (ASCOfferPresenter)offerPresenter;
- (BOOL)accessibilityActivate;
- (BOOL)automaticallyGeneratesAppearMetrics;
- (BOOL)automaticallyPresentsProductDetails;
- (BOOL)isAccessibilityElement;
- (BOOL)isAdMarkerHidden;
- (BOOL)isHighlighted;
- (BOOL)isLargeSizeClass;
- (BOOL)isVideoLoopingEnabled;
- (BOOL)isVideoMuted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityAdvertisement;
- (NSString)accessibilityUserRating;
- (NSString)description;
- (NSString)storeSheetHostBundleID;
- (NSString)storeSheetUsageContext;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIViewController)presentingViewController;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)appearMetricsActivity;
- (id)context;
- (id)metricsActivityForPresentingProductDetails;
- (id)metricsParametersForPresentingProductDetails;
- (id)metricsParametersFromMetricsActivity:(id)a3;
- (id)offerTheme;
- (unint64_t)accessibilityTraits;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutAdContentView;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)lockupMediaPresenterDidBeginScreenshotsFetchRequest;
- (void)lockupMediaPresenterDidCancelScreenshotsFetchRequest;
- (void)lockupMediaPresenterDidFinishScreenshotsFetchRequest;
- (void)lockupMediaPresenterVideoStateDidChange:(int64_t)a3;
- (void)lockupPresenterDidBeginRequest;
- (void)lockupPresenterDidFailRequestWithError:(id)a3;
- (void)lockupPresenterDidFinishRequest;
- (void)offerPresenterDidObserveChangeToState:(id)a3;
- (void)offerPresenterPreprocessOffer:(id)a3 inState:(id)a4 completionBlock:(id)a5;
- (void)offerPresenterWillPerformActionOfOffer:(id)a3 inState:(id)a4 withActivity:(id *)a5 inContext:(id *)a6 withPaymentSheetView:(id)a7;
- (void)performAdTransparencyAction;
- (void)performLockupAction;
- (void)performOfferAction;
- (void)presentProductDetailsViewController;
- (void)presentingViewController;
- (void)setAdMarkerHidden:(BOOL)a3;
- (void)setAdTransparencyButtonHidden:(BOOL)a3;
- (void)setAppearMetricsActivity:(id)a3;
- (void)setAutomaticallyGeneratesAppearMetrics:(BOOL)a3;
- (void)setAutomaticallyPresentsProductDetails:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeveloperName:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLockup:(id)a3;
- (void)setOfferTheme:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStoreSheetHostBundleID:(id)a3;
- (void)setStoreSheetUsageContext:(id)a3;
- (void)setVideoLoopingEnabled:(BOOL)a3;
- (void)setVideoMuted:(BOOL)a3;
- (void)updateLayoutMarginsForContext:(id)a3;
- (void)updateVisibility:(int64_t)a3;
@end

@implementation ASCAdLockupView

- (NSString)accessibilityAdvertisement
{
  return (NSString *)ASCLocalizedString(@"AX_IAD_PRIVACY_MARKER_BUTTON_TITLE", a2);
}

- (NSString)accessibilityUserRating
{
  v3 = NSString;
  v4 = ASCLocalizedFormatString(@"AX_USER_RATINGS");
  v5 = [(ASCAdLockupView *)self lockup];
  v6 = [v5 productRatingBadge];
  v7 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)ASCAdLockupView;
  unint64_t v3 = *MEMORY[0x1E4FB2540] | [(ASCAdLockupView *)&v8 accessibilityTraits];
  v4 = [(ASCAdLockupView *)self contentView];
  int v5 = [v4 isEnabled];

  uint64_t v6 = *MEMORY[0x1E4FB2578];
  if (v5) {
    uint64_t v6 = 0;
  }
  return v3 | v6;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(ASCAdLockupView *)self contentView];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
  int v5 = [(ASCAdLockupView *)self accessibilityAdvertisement];
  [v4 addObject:v5];

  uint64_t v6 = [v3 headingLabelIfLoaded];

  if (v6)
  {
    v7 = [v3 headingLabelIfLoaded];
    [v4 addObject:v7];
  }
  objc_super v8 = [v3 titleLabel];
  [v4 addObject:v8];

  v9 = [v3 subtitleLabel];
  [v4 addObject:v9];

  v10 = [v3 offerStatusLabelIfLoaded];

  if (v10)
  {
    v11 = [v3 offerStatusLabelIfLoaded];
    [v4 addObject:v11];
  }
  v12 = ASCAXLabelForElements(v4);

  return v12;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ASCAdLockupView *)self accessibilityAdvertisement];
  v4 = [(ASCAdLockupView *)self adTransparencyContainer];
  int v5 = [v4 adTransparencyButton];
  [v5 setAccessibilityLabel:v3];

  uint64_t v6 = *MEMORY[0x1E4FB2540];
  v7 = [(ASCAdLockupView *)self adTransparencyContainer];
  objc_super v8 = [v7 adTransparencyButton];
  [v8 setAccessibilityTraits:v6];

  v9 = [(ASCAdLockupView *)self adTransparencyContainer];
  v10 = [v9 adTransparencyButton];
  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v8[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ASCAdLockupView *)self contentView];
  v4 = [v3 offerButton];
  v8[0] = v4;
  int v5 = [(ASCAdLockupView *)self mediaView];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(ASCAdLockupView *)self contentView];
  int v4 = [v3 isEnabled];

  if (!v4) {
    return 0;
  }
  int v5 = [(ASCAdLockupView *)self contentView];
  [v5 sendActionsForControlEvents:64];

  return [(ASCAdLockupView *)self automaticallyPresentsProductDetails];
}

- (id)accessibilityIdentifier
{
  unint64_t v3 = [(ASCAdLockupView *)self lockup];
  int v4 = [v3 id];
  int v5 = [v4 stringValue];

  uint64_t v6 = NSString;
  if (v5)
  {
    v7 = [(ASCAdLockupView *)self lockup];
    objc_super v8 = [v7 id];
    v9 = [v8 stringValue];
    v10 = [v6 stringWithFormat:@"AdLockup[id=%@]", v9];
    v11 = ASCAXIdentifierWithSuffix((uint64_t)v10);
  }
  else
  {
    v7 = [NSString stringWithFormat:@"AdLockup"];
    v11 = ASCAXIdentifierWithSuffix((uint64_t)v7);
  }

  return v11;
}

- (ASCAdLockupView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v40[1] = *MEMORY[0x1E4F143B8];
  +[ASCEligibility assertCurrentProcessEligibility]();
  v39.receiver = self;
  v39.super_class = (Class)ASCAdLockupView;
  objc_super v8 = -[ASCAdLockupView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_automaticallyPresentsProductDetails = 1;
    v10 = [ASCLockupContentView alloc];
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = -[ASCLockupContentView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    contentView = v9->_contentView;
    v9->_contentView = (ASCLockupContentView *)v15;

    v17 = [[ASCOfferPresenter alloc] initWithView:v9->_contentView];
    offerPresenter = v9->_offerPresenter;
    v9->_offerPresenter = v17;

    v19 = [[ASCAppearMetricsPresenter alloc] initWithView:v9];
    metricsPresenter = v9->_metricsPresenter;
    v9->_metricsPresenter = v19;

    v21 = [[ASCLockupPresenter alloc] initWithView:v9->_contentView offerPresenter:v9->_offerPresenter metricsPresenter:v9->_metricsPresenter];
    lockupPresenter = v9->_lockupPresenter;
    v9->_lockupPresenter = v21;

    v23 = [[ASCAdLockupPresenter alloc] initWithView:v9 lockupPresenter:v9->_lockupPresenter];
    adLockupPresenter = v9->_adLockupPresenter;
    v9->_adLockupPresenter = v23;

    v25 = -[ASCAdTransparencyContainerView initWithFrame:]([ASCAdTransparencyContainerView alloc], "initWithFrame:", v11, v12, v13, v14);
    adTransparencyContainer = v9->_adTransparencyContainer;
    v9->_adTransparencyContainer = v25;

    v27 = -[ASCLockupMediaView initWithFrame:]([ASCLockupMediaView alloc], "initWithFrame:", v11, v12, v13, v14);
    mediaView = v9->_mediaView;
    v9->_mediaView = v27;

    v29 = [[ASCLockupMediaPresenter alloc] initWithView:v9->_mediaView lockupPresenter:v9->_lockupPresenter];
    lockupMediaPresenter = v9->_lockupMediaPresenter;
    v9->_lockupMediaPresenter = v29;

    [(ASCLockupPresenter *)v9->_lockupPresenter setObserver:v9];
    [(ASCOfferPresenter *)v9->_offerPresenter setObserver:v9];
    [(ASCLockupMediaPresenter *)v9->_lockupMediaPresenter setObserver:v9];
    -[ASCAdLockupView setLayoutMargins:](v9, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCAdLockupView *)v9 setInsetsLayoutMarginsFromSafeArea:0];
    v31 = +[ASCSemanticColor tint]();
    [(ASCAdLockupView *)v9 setTintColor:v31];

    [(ASCAdLockupView *)v9 addSubview:v9->_mediaView];
    [(ASCAdLockupView *)v9 addSubview:v9->_adTransparencyContainer];
    [(ASCAdLockupView *)v9 addSubview:v9->_contentView];
    [(ASCAdTransparencyContainerView *)v9->_adTransparencyContainer setHidden:1];
    v32 = +[ASCOfferTheme adTheme];
    [(ASCLockupContentView *)v9->_contentView setOfferTheme:v32];

    [(ASCLockupContentView *)v9->_contentView setLockupSize:0x1F1E043F8];
    [(ASCLockupContentView *)v9->_contentView addOfferTarget:v9 action:sel_performOfferAction];
    [(ASCAdTransparencyContainerView *)v9->_adTransparencyContainer addAdTransparencyTarget:v9 action:sel_performAdTransparencyAction];
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v9 action:sel_performLockupAction];
    tapGestureRecognizer = v9->_tapGestureRecognizer;
    v9->_tapGestureRecognizer = (UITapGestureRecognizer *)v33;

    [(UITapGestureRecognizer *)v9->_tapGestureRecognizer setDelegate:v9];
    [(ASCAdLockupView *)v9 addGestureRecognizer:v9->_tapGestureRecognizer];
    [(ASCLockupMediaView *)v9->_mediaView addTarget:v9 action:sel_performLockupAction forControlEvents:64];
    v35 = self;
    v40[0] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    id v37 = (id)[(ASCAdLockupView *)v9 registerForTraitChanges:v36 withAction:sel_setNeedsLayout];
  }
  return v9;
}

- (ASCAdLockupView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (double)topContentViewSpacing
{
  return 15.0;
}

- (BOOL)isLargeSizeClass
{
  [(ASCAdLockupView *)self bounds];
  return v2 > 726.0;
}

- (UIViewController)presentingViewController
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ASCAdLockupView *)self delegate];
  int v4 = [v3 presentingViewControllerForAdLockupView:self];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [(ASCAdLockupView *)self window];
    id v5 = [v6 rootViewController];

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Lockup view %@ is presenting from root view controller", (uint8_t *)&v9, 0xCu);
      }
      id v7 = v5;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[ASCAdLockupView presentingViewController]((uint64_t)self);
    }
  }

  return (UIViewController *)v5;
}

- (void)setAdMarkerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_adMarkerHidden = a3;
  id v5 = [(ASCAdLockupView *)self adTransparencyContainer];
  [v5 setHidden:v3];

  uint64_t v6 = [(ASCAdLockupView *)self request];
  id v7 = [v6 context];
  [(ASCAdLockupView *)self updateLayoutMarginsForContext:v7];

  [(ASCAdLockupView *)self setNeedsLayout];

  [(ASCAdLockupView *)self invalidateIntrinsicContentSize];
}

- (ASCLockup)lockup
{
  double v2 = [(ASCAdLockupView *)self lockupPresenter];
  BOOL v3 = [v2 lockup];

  return (ASCLockup *)v3;
}

- (void)setLockup:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAdLockupView *)self lockupPresenter];
  [v5 setLockup:v4];
}

- (ASCLockupViewGroup)group
{
  double v2 = [(ASCAdLockupView *)self lockupPresenter];
  BOOL v3 = [v2 group];

  return (ASCLockupViewGroup *)v3;
}

- (void)setGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAdLockupView *)self lockupPresenter];
  [v5 setGroup:v4];
}

- (ASCLockupRequest)request
{
  double v2 = [(ASCAdLockupView *)self lockupPresenter];
  BOOL v3 = [v2 request];

  return (ASCLockupRequest *)v3;
}

- (void)setRequest:(id)a3
{
  id v39 = a3;
  id v4 = [(ASCAdLockupView *)self request];
  id v5 = [v4 context];

  uint64_t v6 = [v39 context];
  uint64_t v7 = [(ASCAdLockupView *)self mediaView];
  [(id)v7 setContext:v6];

  objc_super v8 = [v39 context];
  LOBYTE(v7) = [v8 isEqualToString:v5];

  if ((v7 & 1) == 0)
  {
    int v9 = [v39 context];
    [(ASCAdLockupView *)self updateLayoutMarginsForContext:v9];
  }
  v10 = [v39 context];
  int IsAdMaterialContext = ASCLockupContextIsAdMaterialContext(v10);

  if (IsAdMaterialContext)
  {
    double v12 = [(ASCAdLockupView *)self materialBackgroundView];

    if (!v12)
    {
      double v13 = [ASCMaterialBackgroundView alloc];
      double v14 = -[ASCMaterialBackgroundView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      materialBackgroundView = self->_materialBackgroundView;
      self->_materialBackgroundView = v14;

      v16 = self->_materialBackgroundView;
      v17 = [(ASCAdLockupView *)self lockupMediaPresenter];
      [v17 setBackgroundView:v16];

      [(ASCAdLockupView *)self insertSubview:self->_materialBackgroundView atIndex:0];
    }
    v18 = [(ASCAdLockupView *)self adTransparencyContainer];
    [v18 setBackgroundHidden:1];

    v19 = [(ASCAdLockupView *)self materialBackgroundView];
    [v19 setHidden:0];

    v20 = [(ASCAdLockupView *)self gradientBackgroundView];
    [v20 setHidden:1];

    uint64_t v21 = +[ASCStaticLockupTheme adTheme];
LABEL_11:
    uint64_t v33 = (void *)v21;
    v34 = [(ASCAdLockupView *)self contentView];
    [v34 setLockupTheme:v33];

    goto LABEL_13;
  }
  v22 = [v39 context];
  int IsAdGridContext = ASCLockupContextIsAdGridContext(v22);

  if (IsAdGridContext)
  {
    v24 = [(ASCAdLockupView *)self gradientBackgroundView];

    if (!v24)
    {
      v25 = [ASCGradientBackgroundView alloc];
      v26 = -[ASCGradientBackgroundView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      gradientBackgroundView = self->_gradientBackgroundView;
      self->_gradientBackgroundView = v26;

      v28 = self->_gradientBackgroundView;
      v29 = [(ASCAdLockupView *)self mediaView];
      [(ASCAdLockupView *)self insertSubview:v28 aboveSubview:v29];
    }
    v30 = [(ASCAdLockupView *)self adTransparencyContainer];
    [v30 setBackgroundHidden:0];

    v31 = [(ASCAdLockupView *)self materialBackgroundView];
    [v31 setHidden:1];

    v32 = [(ASCAdLockupView *)self gradientBackgroundView];
    [v32 setHidden:0];

    uint64_t v21 = +[ASCStaticLockupTheme adWhiteTheme];
    goto LABEL_11;
  }
  v35 = [(ASCAdLockupView *)self adTransparencyContainer];
  [v35 setBackgroundHidden:1];

  v36 = [(ASCAdLockupView *)self materialBackgroundView];
  [v36 setHidden:1];

  id v37 = [(ASCAdLockupView *)self gradientBackgroundView];
  [v37 setHidden:1];

  uint64_t v33 = [(ASCAdLockupView *)self contentView];
  [v33 setLockupTheme:0];
LABEL_13:

  v38 = [(ASCAdLockupView *)self lockupPresenter];
  [v38 setRequest:v39];
}

- (id)context
{
  double v2 = [(ASCAdLockupView *)self request];
  BOOL v3 = [v2 context];

  return v3;
}

- (void)setAdTransparencyButtonHidden:(BOOL)a3
{
  uint64_t v4 = [(ASCAdLockupView *)self isAdMarkerHidden] | a3;
  id v5 = [(ASCAdLockupView *)self adTransparencyContainer];
  [v5 setHidden:v4];

  [(ASCAdLockupView *)self setNeedsLayout];
}

- (void)setDeveloperName:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAdLockupView *)self adTransparencyContainer];
  [v5 setDeveloperName:v4];
}

- (void)setDelegate:(id)a3
{
  id v20 = a3;
  objc_storeWeak((id *)&self->_delegate, v20);
  id v4 = v20;
  if (v20)
  {
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFDF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 64;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFBF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 128;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFF7F | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 256;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFEFF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 512;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFDFF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 1024;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFBFF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 2048;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xF7FF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 4096;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xEFFF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 0x2000;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xDFFF | v17;
    BOOL v18 = (objc_opt_respondsToSelector() & 1) == 0;
    id v4 = v20;
    if (v18) {
      __int16 v19 = 0;
    }
    else {
      __int16 v19 = 0x4000;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xBFFF | v19;
  }
  else
  {
    *(_WORD *)&self->_delegateRespondsTo &= 0x8000u;
  }
}

- (BOOL)isHighlighted
{
  double v2 = [(ASCAdLockupView *)self contentView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCAdLockupView *)self contentView];
  [v4 setHighlighted:v3];
}

- (BOOL)automaticallyGeneratesAppearMetrics
{
  double v2 = [(ASCAdLockupView *)self metricsPresenter];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setAutomaticallyGeneratesAppearMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCAdLockupView *)self metricsPresenter];
  [v4 setEnabled:v3];
}

- (id)appearMetricsActivity
{
  double v2 = [(ASCAdLockupView *)self metricsPresenter];
  BOOL v3 = [v2 activity];

  return v3;
}

- (void)setAppearMetricsActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAdLockupView *)self metricsPresenter];
  [v5 setActivity:v4];
}

- (id)offerTheme
{
  double v2 = [(ASCAdLockupView *)self contentView];
  BOOL v3 = [v2 offerTheme];

  return v3;
}

- (void)setOfferTheme:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAdLockupView *)self contentView];
  [v5 setOfferTheme:v4];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ASCAdLockupView;
  [(ASCAdLockupView *)&v3 layoutMarginsDidChange];
  [(ASCAdLockupView *)self setNeedsLayout];
  [(ASCAdLockupView *)self invalidateIntrinsicContentSize];
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView setLayoutMargins:](&v6, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  id v4 = [(ASCAdLockupView *)self request];
  id v5 = [v4 context];
  [(ASCAdLockupView *)self updateLayoutMarginsForContext:v5];
}

- (void)updateLayoutMarginsForContext:(id)a3
{
  id v4 = a3;
  [(ASCAdLockupView *)self layoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (![(ASCAdLockupView *)self isAdMarkerHidden]) {
    double v6 = 0.0;
  }
  int IsAdGridContext = ASCLockupContextIsAdGridContext(v4);

  if (!IsAdGridContext) {
    double v10 = 0.0;
  }
  [(ASCAdLockupView *)self layoutMargins];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(ASCAdLockupView *)self contentView];
  objc_msgSend(v20, "setLayoutMargins:", v6, v8, v10, v12);

  id v21 = [(ASCAdLockupView *)self mediaView];
  objc_msgSend(v21, "setLayoutMargins:", 0.0, v15, v17, v19);
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCAdLockupView;
  [(ASCAdLockupView *)&v5 setHidden:a3];
  id v4 = [(ASCAdLockupView *)self metricsPresenter];
  [v4 viewDidSetHidden];
}

- (void)updateVisibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3) {
      return;
    }
    id v4 = [(ASCAdLockupView *)self mediaView];
    objc_super v3 = [v4 videoView];
    [v3 playVideo];
  }
  else
  {
    id v4 = [(ASCAdLockupView *)self mediaView];
    objc_super v3 = [v4 videoView];
    [v3 pauseVideo];
  }
}

- (BOOL)isVideoLoopingEnabled
{
  double v2 = [(ASCAdLockupView *)self mediaView];
  char v3 = [v2 isVideoLoopingEnabled];

  return v3;
}

- (void)setVideoLoopingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCAdLockupView *)self mediaView];
  [v4 setVideoLoopingEnabled:v3];
}

- (BOOL)isVideoMuted
{
  double v2 = [(ASCAdLockupView *)self mediaView];
  char v3 = [v2 isVideoMuted];

  return v3;
}

- (void)setVideoMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCAdLockupView *)self mediaView];
  [v4 setVideoMuted:v3];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)ASCAdLockupView;
  [(ASCAdLockupView *)&v4 didMoveToWindow];
  BOOL v3 = [(ASCAdLockupView *)self metricsPresenter];
  [v3 viewDidMoveToWindow];
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCAdLockupView;
  [(ASCAdLockupView *)&v4 invalidateIntrinsicContentSize];
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained adLockupViewDidInvalidateIntrinsicContentSize:self];
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(ASCAdLockupView *)self contentView];
  [(ASCAdLockupView *)self bounds];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;

  double v10 = [(ASCAdLockupView *)self mediaView];
  [v10 intrinsicContentSize];
  double v12 = v11;

  if (v12 > 2.22044605e-16)
  {
    self;
    double v12 = v12 + 10.0;
  }
  double v13 = v9 + v12;
  if (![(ASCAdLockupView *)self isAdMarkerHidden])
  {
    [(ASCAdLockupView *)self layoutMargins];
    double v15 = v14;
    +[ASCAdLockupView topContentViewSpacing];
    double v13 = v13 + v15 + v16;
    if (![(ASCAdLockupView *)self isLargeSizeClass])
    {
      double v17 = [(ASCAdLockupView *)self adTransparencyContainer];
      [(ASCAdLockupView *)self bounds];
      objc_msgSend(v17, "sizeThatFits:", v18, v19);
      double v21 = v20;

      double v13 = v13 + v21;
    }
  }
  double v22 = v7;
  double v23 = v13;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(ASCAdLockupView *)self contentView];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(ASCAdLockupView *)self mediaView];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;

  if (v13 > 2.22044605e-16)
  {
    self;
    double v13 = v13 + 10.0;
  }
  double v14 = v10 + v13;
  if (![(ASCAdLockupView *)self isAdMarkerHidden])
  {
    [(ASCAdLockupView *)self layoutMargins];
    double v16 = v15;
    +[ASCAdLockupView topContentViewSpacing];
    double v14 = v14 + v16 + v17;
    if (![(ASCAdLockupView *)self isLargeSizeClass])
    {
      double v18 = [(ASCAdLockupView *)self adTransparencyContainer];
      [(ASCAdLockupView *)self bounds];
      objc_msgSend(v18, "sizeThatFits:", v19, v20);
      double v22 = v21;

      double v14 = v14 + v22;
    }
  }
  double v23 = v8;
  double v24 = v14;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)layoutAdContentView
{
  [(ASCAdLockupView *)self bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  IsEmptCGFloat y = CGRectIsEmpty(v21);
  double v8 = [(ASCAdLockupView *)self contentView];
  id v19 = v8;
  if (IsEmpty)
  {
    double v9 = x;
    double v10 = y;
    double v11 = width;
    double v12 = height;
  }
  else
  {
    objc_msgSend(v8, "sizeThatFits:", width, height);
    double v14 = v13;
    double v16 = v15;

    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    if (vabdd_f64(CGRectGetWidth(v22), v14) > 1.0
      || (v23.origin.CGFloat x = x,
          v23.origin.CGFloat y = y,
          v23.size.double width = width,
          v23.size.double height = height,
          vabdd_f64(CGRectGetHeight(v23), v16) > 1.0))
    {
      if (layoutAdContentView_onceToken != -1) {
        dispatch_once(&layoutAdContentView_onceToken, &__block_literal_global_0);
      }
    }
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    CGFloat MinX = CGRectGetMinX(v24);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    double v18 = floor(CGRectGetMidY(v25) + v16 * -0.5);
    double v8 = [(ASCAdLockupView *)self contentView];
    id v19 = v8;
    double v9 = MinX;
    double v10 = v18;
    double v11 = v14;
    double v12 = v16;
  }
  objc_msgSend(v8, "setFrame:", v9, v10, v11, v12);
}

void __38__ASCAdLockupView_layoutAdContentView__block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v0 = 136446210;
    v1 = "-[ASCAdLockupView layoutAdContentView]_block_invoke";
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** %{public}s: Frame size does not match intrinsicContentSize, break on _ASCLockupView_incorrectFrameSize to debug", (uint8_t *)&v0, 0xCu);
  }
}

- (void)layoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)ASCAdLockupView;
  [(ASCAdLockupView *)&v61 layoutSubviews];
  [(ASCAdLockupView *)self layoutAdContentView];
  [(ASCAdLockupView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v60 = v5;
  if ([(ASCAdLockupView *)self isAdMarkerHidden])
  {
    double v11 = v4;
    double v12 = 0.0;
  }
  else
  {
    double v13 = [(ASCAdLockupView *)self adTransparencyContainer];
    double v58 = v10;
    objc_msgSend(v13, "sizeThatFits:", v8, v10);
    double v15 = v14;

    [(ASCAdLockupView *)self layoutMargins];
    double v17 = v8 * 0.5 - v16;
    if ([(ASCAdLockupView *)self isLargeSizeClass])
    {
      double v18 = [(ASCAdLockupView *)self contentView];
      id v19 = [v18 lockupSize];
      double v20 = [(ASCAdLockupView *)self traitCollection];
      double v21 = ASCLockupViewSizeGetIconSize(v19, [v20 horizontalSizeClass]) * 0.5;

      double v17 = v17 - (v21 + 15.0);
    }
    [(ASCAdLockupView *)self layoutMargins];
    double v23 = v22;
    [(ASCAdLockupView *)self layoutMargins];
    double v25 = v24;
    v26 = [(UIView *)self asc_layoutTraitEnvironment];
    double v27 = v15;
    CGFloat v56 = v15;
    double v11 = v4;
    +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v26, v23, v25, v17, v27, v4, v6, v8, v58);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v36 = [(ASCAdLockupView *)self adTransparencyContainer];
    objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

    if ([(ASCAdLockupView *)self isLargeSizeClass])
    {
      [(ASCAdLockupView *)self layoutMargins];
    }
    else
    {
      v62.origin.CGFloat x = v23;
      v62.origin.CGFloat y = v25;
      v62.size.double width = v55;
      v62.size.double height = v56;
      double MaxY = CGRectGetMaxY(v62);
    }
    double v38 = MaxY;
    +[ASCAdLockupView topContentViewSpacing];
    double v12 = v38 + v39;
    double v10 = v58;
  }
  v40 = [(ASCAdLockupView *)self contentView];
  objc_msgSend(v40, "sizeThatFits:", v8, v10);
  double v59 = v41;
  double v43 = v42;

  v44 = [(ASCAdLockupView *)self request];
  v45 = [v44 context];
  int IsAdGridContext = ASCLockupContextIsAdGridContext(v45);

  if (IsAdGridContext)
  {
    v63.origin.CGFloat x = v11;
    double v47 = v60;
    v63.origin.CGFloat y = v60;
    v63.size.double width = v8;
    v63.size.double height = v10;
    double v12 = CGRectGetMaxY(v63) - v43;
    double v48 = 0.0;
    double v57 = v10;
  }
  else
  {
    self;
    double v49 = v10 - v43 + -10.0;
    if (v49 < 0.0) {
      double v49 = 0.0;
    }
    double v57 = v49;
    double v48 = v12 + v43 + 10.0;
    double v47 = v60;
  }
  v50 = [(ASCAdLockupView *)self contentView];
  objc_msgSend(v50, "setFrame:", 0.0, v12, v59, v43);

  v51 = [(ASCAdLockupView *)self mediaView];
  objc_msgSend(v51, "setFrame:", 0.0, v48, v8, v57);

  v52 = [(ASCAdLockupView *)self materialBackgroundView];
  objc_msgSend(v52, "setFrame:", v11, v47, v8, v10);

  v53 = [(ASCAdLockupView *)self gradientBackgroundView];
  objc_msgSend(v53, "setFrame:", v11, v47, v8, v10);

  v54 = [(ASCAdLockupView *)self lockupMediaPresenter];
  [v54 viewDidLayoutSubviews];
}

- (NSString)description
{
  double v3 = [[ASCDescriber alloc] initWithObject:self];
  double v4 = [(ASCAdLockupView *)self adTransparencyContainer];
  [(ASCDescriber *)v3 addObject:v4 withName:@"adTransparencyContainer"];

  double v5 = [(ASCAdLockupView *)self contentView];
  [(ASCDescriber *)v3 addObject:v5 withName:@"contentView"];

  double v6 = [(ASCAdLockupView *)self mediaView];
  [(ASCDescriber *)v3 addObject:v6 withName:@"mediaView"];

  double v7 = [(ASCAdLockupView *)self offerPresenter];
  [(ASCDescriber *)v3 addObject:v7 withName:@"offerPresenter"];

  double v8 = [(ASCAdLockupView *)self lockupPresenter];
  [(ASCDescriber *)v3 addObject:v8 withName:@"lockupPresenter"];

  double v9 = [(ASCAdLockupView *)self adLockupPresenter];
  [(ASCDescriber *)v3 addObject:v9 withName:@"adLockupPresenter"];

  double v10 = [(ASCAdLockupView *)self lockupMediaPresenter];
  [(ASCDescriber *)v3 addObject:v10 withName:@"lockupMediaPresenter"];

  double v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden"));
  [(ASCDescriber *)v3 addObject:v11 withName:@"adMarkerHidden"];

  double v12 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v12;
}

- (void)presentProductDetailsViewController
{
  double v3 = [(ASCAdLockupView *)self lockup];
  if (v3)
  {
    double v4 = [(ASCAdLockupView *)self metricsParametersForPresentingProductDetails];
    double v5 = [(ASCAdLockupView *)self presentingViewController];
    if (v5)
    {
      double v6 = [ASCLockupProductDetails alloc];
      double v7 = [(ASCAdLockupView *)self storeSheetHostBundleID];
      double v8 = [(ASCAdLockupView *)self storeSheetUsageContext];
      double v9 = [(ASCLockupProductDetails *)v6 initWithLockup:v3 storeSheetHostBundleID:v7 storeSheetUsageContext:v8 parameters:v4];

      objc_initWeak(&location, self);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      double v13 = __54__ASCAdLockupView_presentProductDetailsViewController__block_invoke;
      double v14 = &unk_1E645D678;
      objc_copyWeak(&v15, &location);
      [(ASCLockupProductDetails *)v9 presentFromViewController:v5 animated:1 completion:&v11];
      double v10 = [(ASCAdLockupView *)self metricsPresenter];
      [v10 viewDidAction];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __54__ASCAdLockupView_presentProductDetailsViewController__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((WeakRetained[204] & 0x80) != 0 && a3)
  {
    double v7 = WeakRetained;
    double v6 = [WeakRetained delegate];
    [v6 adLockupView:v7 didPresentProductDetails:a2];

    id WeakRetained = v7;
  }
}

- (void)performLockupAction
{
  double v3 = [(ASCAdLockupView *)self lockupPresenter];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__ASCAdLockupView_performLockupAction__block_invoke;
  v4[3] = &unk_1E645D6A0;
  v4[4] = self;
  [v3 retryRequestIfNeeded:v4];
}

uint64_t __38__ASCAdLockupView_performLockupAction__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    CGSize result = [*(id *)(result + 32) automaticallyPresentsProductDetails];
    if (result)
    {
      double v3 = *(void **)(v2 + 32);
      return [v3 presentProductDetailsViewController];
    }
  }
  return result;
}

- (void)performOfferAction
{
  id v2 = [(ASCAdLockupView *)self offerPresenter];
  [v2 performOfferAction];
}

- (void)performAdTransparencyAction
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x200) != 0)
  {
    id v3 = [(ASCAdLockupView *)self delegate];
    [v3 adLockupViewDidSelectAdMarker:self];
  }
}

- (id)metricsActivityForPresentingProductDetails
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x10) != 0)
  {
    double v4 = [(ASCAdLockupView *)self delegate];
    double v5 = [(ASCAdLockupView *)self offerPresenter];
    double v6 = [v5 mostRecentAppState];
    id v2 = [v4 metricsActivityForPresentingProductDetailsOfAdLockupView:self inState:v6];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)metricsParametersFromMetricsActivity:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 fields];
  double v4 = [v3 objectForKeyedSubscript:@"redirectUrlParameters"];

  if (v4)
  {
    double v5 = [@"https://?" stringByAppendingString:v4];
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v5];
    double v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v8 = objc_msgSend(v6, "queryItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          double v14 = [v13 value];
          id v15 = [v13 name];
          [v7 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)metricsParametersForPresentingProductDetails
{
  id v3 = [(ASCAdLockupView *)self metricsActivityForPresentingProductDetails];
  double v4 = [(ASCAdLockupView *)self metricsParametersFromMetricsActivity:v3];

  return v4;
}

- (void)lockupPresenterDidBeginRequest
{
  if (*(_WORD *)&self->_delegateRespondsTo)
  {
    id v3 = [(ASCAdLockupView *)self delegate];
    [v3 adLockupViewDidBeginRequest:self];
  }
}

- (void)lockupPresenterDidFinishRequest
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 2) != 0)
  {
    id v3 = [(ASCAdLockupView *)self delegate];
    [v3 adLockupViewDidFinishRequest:self];
  }
}

- (void)lockupPresenterDidFailRequestWithError:(id)a3
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 4) != 0)
  {
    id v4 = a3;
    id v5 = [(ASCAdLockupView *)self delegate];
    [v5 adLockupView:self didFailRequestWithError:v4];
  }
}

- (void)offerPresenterDidObserveChangeToState:(id)a3
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 8) != 0)
  {
    id v4 = a3;
    id v5 = [(ASCAdLockupView *)self delegate];
    [v5 adLockupView:self appStateDidChange:v4];
  }
}

- (void)offerPresenterWillPerformActionOfOffer:(id)a3 inState:(id)a4 withActivity:(id *)a5 inContext:(id *)a6 withPaymentSheetView:(id)a7
{
  id v16 = a3;
  id v11 = a4;
  id v12 = a7;
  __int16 delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  if ((delegateRespondsTo & 0x20) != 0)
  {
    double v14 = [(ASCAdLockupView *)self delegate];
    *a5 = [v14 metricsActivityForAdLockupView:self toPerformActionOfOffer:v16 inState:v11];

    __int16 delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  }
  if ((delegateRespondsTo & 0x100) != 0)
  {
    id v15 = [(ASCAdLockupView *)self delegate];
    [v15 adLockupView:self didSelectOfferWithState:v11];
  }
}

- (void)offerPresenterPreprocessOffer:(id)a3 inState:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x2000) != 0)
  {
    id v12 = [(ASCAdLockupView *)self delegate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __73__ASCAdLockupView_offerPresenterPreprocessOffer_inState_completionBlock___block_invoke;
    v13[3] = &unk_1E645D6C8;
    id v14 = v11;
    [v12 adLockupView:self preprocessOffer:v8 inState:v9 completionBlock:v13];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __73__ASCAdLockupView_offerPresenterPreprocessOffer_inState_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)lockupMediaPresenterDidBeginScreenshotsFetchRequest
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x400) != 0)
  {
    id v3 = [(ASCAdLockupView *)self delegate];
    [v3 adLockupViewDidBeginScreenshotsFetchRequest:self];
  }
}

- (void)lockupMediaPresenterDidCancelScreenshotsFetchRequest
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x800) != 0)
  {
    id v3 = [(ASCAdLockupView *)self delegate];
    [v3 adLockupViewDidCancelScreenshotsFetchRequest:self];
  }
}

- (void)lockupMediaPresenterDidFinishScreenshotsFetchRequest
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x1000) != 0)
  {
    id v3 = [(ASCAdLockupView *)self delegate];
    [v3 adLockupViewDidFinishScreenshotsFetchRequest:self];
  }
}

- (void)lockupMediaPresenterVideoStateDidChange:(int64_t)a3
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x4000) != 0)
  {
    id v5 = [(ASCAdLockupView *)self delegate];
    [v5 adLockupView:self videoStateDidChange:a3];
  }
}

- (ASCAdLockupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCAdLockupViewDelegate *)WeakRetained;
}

- (BOOL)automaticallyPresentsProductDetails
{
  return self->_automaticallyPresentsProductDetails;
}

- (void)setAutomaticallyPresentsProductDetails:(BOOL)a3
{
  self->_automaticallyPresentsProductDetails = a3;
}

- (BOOL)isAdMarkerHidden
{
  return self->_adMarkerHidden;
}

- (ASCAdTransparencyContainerView)adTransparencyContainer
{
  return self->_adTransparencyContainer;
}

- (ASCLockupContentView)contentView
{
  return self->_contentView;
}

- (ASCLockupMediaView)mediaView
{
  return self->_mediaView;
}

- (ASCMaterialBackgroundView)materialBackgroundView
{
  return self->_materialBackgroundView;
}

- (ASCGradientBackgroundView)gradientBackgroundView
{
  return self->_gradientBackgroundView;
}

- (ASCOfferPresenter)offerPresenter
{
  return self->_offerPresenter;
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCLockupPresenter)lockupPresenter
{
  return self->_lockupPresenter;
}

- (ASCAdLockupPresenter)adLockupPresenter
{
  return self->_adLockupPresenter;
}

- (ASCLockupMediaPresenter)lockupMediaPresenter
{
  return self->_lockupMediaPresenter;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (void)setStoreSheetHostBundleID:(id)a3
{
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (void)setStoreSheetUsageContext:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);
  objc_storeStrong((id *)&self->_lockupMediaPresenter, 0);
  objc_storeStrong((id *)&self->_adLockupPresenter, 0);
  objc_storeStrong((id *)&self->_lockupPresenter, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
  objc_storeStrong((id *)&self->_offerPresenter, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
  objc_storeStrong((id *)&self->_materialBackgroundView, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_adTransparencyContainer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)presentingViewController
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Lockup view %@ could not find view controller to present from.", (uint8_t *)&v1, 0xCu);
}

@end