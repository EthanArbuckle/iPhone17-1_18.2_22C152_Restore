@interface ASCLockupView
- (ASCAppearMetricsPresenter)metricsPresenter;
- (ASCLockup)lockup;
- (ASCLockupContentView)contentView;
- (ASCLockupPresenter)lockupPresenter;
- (ASCLockupProductDetails)lockupProductDetails;
- (ASCLockupRequest)request;
- (ASCLockupView)initWithCoder:(id)a3;
- (ASCLockupView)initWithFrame:(CGRect)a3;
- (ASCLockupViewDelegate)delegate;
- (ASCLockupViewGroup)group;
- (ASCMetricsActivity)appearMetricsActivity;
- (ASCOfferPresenter)offerPresenter;
- (ASCOfferTheme)offerTheme;
- (BOOL)accessibilityActivate;
- (BOOL)automaticallyGeneratesAppearMetrics;
- (BOOL)automaticallyPresentsProductDetails;
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (BOOL)showsPlaceholderContent;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (NSString)lockupSize;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSString)storeSheetHostBundleID;
- (NSString)storeSheetUsageContext;
- (UIViewController)presentingViewController;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)preferredProductDetailsPresentationContext;
- (unint64_t)accessibilityTraits;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutContentView;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)lockupPresenterDidBeginRequest;
- (void)lockupPresenterDidFailRequestWithError:(id)a3;
- (void)lockupPresenterDidFinishRequest;
- (void)offerPresenterDidObserveChangeToState:(id)a3;
- (void)offerPresenterPreprocessOffer:(id)a3 inState:(id)a4 completionBlock:(id)a5;
- (void)offerPresenterWillPerformActionOfOffer:(id)a3 inState:(id)a4 withActivity:(id *)a5 inContext:(id *)a6 withPaymentSheetView:(id)a7;
- (void)performLockupAction;
- (void)presentProductDetailsViewController;
- (void)presentingViewController;
- (void)productDetailsUserDidInteractWithApp:(id)a3 interactionType:(id)a4;
- (void)setAppearMetricsActivity:(id)a3;
- (void)setAutomaticallyGeneratesAppearMetrics:(BOOL)a3;
- (void)setAutomaticallyPresentsProductDetails:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLockup:(id)a3;
- (void)setLockupProductDetails:(id)a3;
- (void)setLockupSize:(id)a3;
- (void)setOfferTheme:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setRequest:(id)a3;
- (void)setShowsPlaceholderContent:(BOOL)a3;
- (void)setStoreSheetHostBundleID:(id)a3;
- (void)setStoreSheetUsageContext:(id)a3;
- (void)setViewRenderSpanProvider:(id)a3;
@end

@implementation ASCLockupView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)ASCLockupView;
  unint64_t v3 = *MEMORY[0x1E4FB2540] | [(ASCLockupView *)&v8 accessibilityTraits];
  v4 = [(ASCLockupView *)self contentView];
  int v5 = [v4 isEnabled];

  uint64_t v6 = *MEMORY[0x1E4FB2578];
  if (v5) {
    uint64_t v6 = 0;
  }
  return v3 | v6;
}

- (id)accessibilityLabel
{
  v2 = [(ASCLockupView *)self contentView];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  if ([v2 isOfferButtonOnlyLockup])
  {
    uint64_t v4 = [v2 offerButton];
LABEL_7:
    v10 = (void *)v4;
    [v3 addObject:v4];

    goto LABEL_8;
  }
  int v5 = [v2 headingLabelIfLoaded];

  if (v5)
  {
    uint64_t v6 = [v2 headingLabelIfLoaded];
    [v3 addObject:v6];
  }
  v7 = [v2 titleLabel];
  [v3 addObject:v7];

  objc_super v8 = [v2 subtitleLabel];
  [v3 addObject:v8];

  v9 = [v2 offerStatusLabelIfLoaded];

  if (v9)
  {
    uint64_t v4 = [v2 offerStatusLabelIfLoaded];
    goto LABEL_7;
  }
LABEL_8:
  v11 = ASCAXLabelForElements(v3);

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ASCLockupView *)self contentView];
  if ([v3 isOfferButtonOnlyLockup])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v5 = [(ASCLockupView *)self contentView];
    uint64_t v6 = [v5 offerButton];
    v8[0] = v6;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }

  return v4;
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(ASCLockupView *)self contentView];
  int v4 = [v3 isEnabled];

  if (!v4) {
    return 0;
  }
  int v5 = [(ASCLockupView *)self contentView];
  int v6 = [v5 isOfferButtonOnlyLockup];

  v7 = [(ASCLockupView *)self contentView];
  objc_super v8 = v7;
  if (v6)
  {
    v9 = [v7 offerButton];
    [v9 sendActionsForControlEvents:64];

    return 1;
  }
  else
  {
    [v7 sendActionsForControlEvents:64];

    return [(ASCLockupView *)self automaticallyPresentsProductDetails];
  }
}

- (id)accessibilityIdentifier
{
  unint64_t v3 = [(ASCLockupView *)self lockup];
  int v4 = [v3 id];
  int v5 = [v4 stringValue];

  int v6 = NSString;
  if (v5)
  {
    v7 = [(ASCLockupView *)self lockup];
    objc_super v8 = [v7 id];
    v9 = [v8 stringValue];
    v10 = [v6 stringWithFormat:@"Lockup[id=%@]", v9];
    v11 = ASCAXIdentifierWithSuffix((uint64_t)v10);
  }
  else
  {
    v7 = [NSString stringWithFormat:@"Lockup"];
    v11 = ASCAXIdentifierWithSuffix((uint64_t)v7);
  }

  return v11;
}

- (ASCLockupView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v22.receiver = self;
  v22.super_class = (Class)ASCLockupView;
  objc_super v8 = -[ASCLockupView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_automaticallyPresentsProductDetails = 1;
    v10 = [ASCLockupContentView alloc];
    uint64_t v11 = -[ASCLockupContentView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    contentView = v9->_contentView;
    v9->_contentView = (ASCLockupContentView *)v11;

    v13 = [[ASCOfferPresenter alloc] initWithView:v9->_contentView];
    offerPresenter = v9->_offerPresenter;
    v9->_offerPresenter = v13;

    v15 = [[ASCAppearMetricsPresenter alloc] initWithView:v9];
    metricsPresenter = v9->_metricsPresenter;
    v9->_metricsPresenter = v15;

    v17 = [[ASCCustomLockupContentProvider alloc] initWithLockupView:v9];
    v18 = [[ASCLockupPresenter alloc] initWithView:v9->_contentView customContentProvider:v17 offerPresenter:v9->_offerPresenter metricsPresenter:v9->_metricsPresenter];
    lockupPresenter = v9->_lockupPresenter;
    v9->_lockupPresenter = v18;

    [(ASCLockupPresenter *)v9->_lockupPresenter setObserver:v9];
    [(ASCOfferPresenter *)v9->_offerPresenter setObserver:v9];
    -[ASCLockupView setLayoutMargins:](v9, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCLockupView *)v9 setInsetsLayoutMarginsFromSafeArea:0];
    v20 = +[ASCSemanticColor tint]();
    [(ASCLockupView *)v9 setTintColor:v20];

    [(ASCLockupContentView *)v9->_contentView addOfferTarget:v9->_offerPresenter action:sel_performOfferAction];
    [(ASCLockupContentView *)v9->_contentView addTarget:v9 action:sel_performLockupAction forControlEvents:64];
    [(ASCLockupView *)v9 addSubview:v9->_contentView];
  }
  return v9;
}

- (ASCLockupView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (UIViewController)presentingViewController
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ASCLockupView *)self delegate];
  int v4 = [v3 presentingViewControllerForLockupView:self];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    int v6 = [(ASCLockupView *)self window];
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
      -[ASCLockupView presentingViewController]();
    }
  }

  return (UIViewController *)v5;
}

- (NSString)lockupSize
{
  v2 = [(ASCLockupView *)self contentView];
  unint64_t v3 = [v2 lockupSize];

  return (NSString *)v3;
}

- (void)setLockupSize:(id)a3
{
  id v7 = a3;
  if ((+[ASCEligibility currentClientIsEligibleToUseLockupViewSize:]((uint64_t)ASCEligibility, v7) & 1) == 0)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Current process is not eligible to use %@ lockup view size", v7];
    id v6 = objc_alloc(MEMORY[0x1E4F1CA00]);
    objc_exception_throw((id)[v6 initWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:0]);
  }
  int v4 = [(ASCLockupView *)self contentView];
  [v4 setLockupSize:v7];

  [(ASCLockupView *)self setNeedsLayout];
}

- (ASCLockup)lockup
{
  v2 = [(ASCLockupView *)self lockupPresenter];
  unint64_t v3 = [v2 lockup];

  return (ASCLockup *)v3;
}

- (void)setLockup:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupView *)self lockupPresenter];
  [v5 setLockup:v4];
}

- (ASCLockupViewGroup)group
{
  v2 = [(ASCLockupView *)self lockupPresenter];
  unint64_t v3 = [v2 group];

  return (ASCLockupViewGroup *)v3;
}

- (void)setGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupView *)self lockupPresenter];
  [v5 setGroup:v4];
}

- (ASCLockupRequest)request
{
  v2 = [(ASCLockupView *)self lockupPresenter];
  unint64_t v3 = [v2 request];

  return (ASCLockupRequest *)v3;
}

- (void)setRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  int IsWebBrowserContext = ASCLockupContextIsWebBrowserContext(v5, v6);

  if (IsWebBrowserContext)
  {
    objc_super v8 = +[ASCStaticLockupTheme webBrowserTheme];
    int v9 = [(ASCLockupView *)self contentView];
    [v9 setLockupTheme:v8];
  }
  else
  {
    objc_super v8 = [(ASCLockupView *)self contentView];
    [v8 setLockupTheme:0];
  }

  id v10 = [(ASCLockupView *)self lockupPresenter];
  [v10 setRequest:v4];
}

- (void)setDelegate:(id)a3
{
  id v17 = a3;
  objc_storeWeak((id *)&self->_delegate, v17);
  id v4 = v17;
  if (v17)
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
    BOOL v15 = (objc_opt_respondsToSelector() & 1) == 0;
    id v4 = v17;
    if (v15) {
      __int16 v16 = 0;
    }
    else {
      __int16 v16 = 2048;
    }
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xF7FF | v16;
  }
  else
  {
    *(_WORD *)&self->_delegateRespondsTo &= 0xF000u;
  }
}

- (BOOL)isHighlighted
{
  v2 = [(ASCLockupView *)self contentView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCLockupView *)self contentView];
  [v4 setHighlighted:v3];
}

- (BOOL)automaticallyGeneratesAppearMetrics
{
  v2 = [(ASCLockupView *)self metricsPresenter];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setAutomaticallyGeneratesAppearMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCLockupView *)self metricsPresenter];
  [v4 setEnabled:v3];
}

- (ASCMetricsActivity)appearMetricsActivity
{
  v2 = [(ASCLockupView *)self metricsPresenter];
  BOOL v3 = [v2 activity];

  return (ASCMetricsActivity *)v3;
}

- (void)setAppearMetricsActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupView *)self metricsPresenter];
  [v5 setActivity:v4];
}

- (ASCOfferTheme)offerTheme
{
  v2 = [(ASCLockupView *)self contentView];
  BOOL v3 = [v2 offerTheme];

  return (ASCOfferTheme *)v3;
}

- (void)setOfferTheme:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupView *)self contentView];
  [v5 setOfferTheme:v4];
}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCLockupView *)self lockupPresenter];
  [v4 setShowsPlaceholderContent:v3];
}

- (BOOL)showsPlaceholderContent
{
  v2 = [(ASCLockupView *)self lockupPresenter];
  char v3 = [v2 showsPlaceholderContent];

  return v3;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ASCLockupView;
  [(ASCLockupView *)&v3 layoutMarginsDidChange];
  [(ASCLockupView *)self setNeedsLayout];
  [(ASCLockupView *)self invalidateIntrinsicContentSize];
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  __int16 v8 = [(ASCLockupView *)self contentView];
  objc_msgSend(v8, "setLayoutMargins:", top, left, bottom, right);

  v9.receiver = self;
  v9.super_class = (Class)ASCLockupView;
  -[ASCLockupView setLayoutMargins:](&v9, sel_setLayoutMargins_, top, left, bottom, right);
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCLockupView;
  [(ASCLockupView *)&v5 setHidden:a3];
  id v4 = [(ASCLockupView *)self metricsPresenter];
  [v4 viewDidSetHidden];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)ASCLockupView;
  [(ASCLockupView *)&v4 didMoveToWindow];
  objc_super v3 = [(ASCLockupView *)self metricsPresenter];
  [v3 viewDidMoveToWindow];
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCLockupView;
  [(ASCLockupView *)&v4 invalidateIntrinsicContentSize];
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained lockupViewDidInvalidateIntrinsicContentSize:self];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(ASCLockupView *)self contentView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(ASCLockupView *)self contentView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutContentView
{
  [(ASCLockupView *)self bounds];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  IsEmptCGFloat y = CGRectIsEmpty(v22);
  double v8 = [(ASCLockupView *)self contentView];
  double v9 = v8;
  if (IsEmpty)
  {
    double v10 = x;
    double v11 = y;
    double v12 = width;
    double v13 = height;
  }
  else
  {
    objc_msgSend(v8, "sizeThatFits:", width, height);
    double v15 = v14;
    double v17 = v16;

    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    if (vabdd_f64(CGRectGetWidth(v23), v15) > 1.0
      || (v24.origin.CGFloat x = x,
          v24.origin.CGFloat y = y,
          v24.size.double width = width,
          v24.size.double height = height,
          vabdd_f64(CGRectGetHeight(v24), v17) > 1.0))
    {
      if (layoutContentView_onceToken[0] != -1) {
        dispatch_once(layoutContentView_onceToken, &__block_literal_global_12);
      }
    }
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    CGFloat MinX = CGRectGetMinX(v25);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double v19 = floor(CGRectGetMidY(v26) + v17 * -0.5);
    double v8 = [(ASCLockupView *)self contentView];
    double v9 = v8;
    double v10 = MinX;
    double v11 = v19;
    double v12 = v15;
    double v13 = v17;
  }
  objc_msgSend(v8, "setFrame:", v10, v11, v12, v13);

  id v20 = [(ASCLockupView *)self contentView];
  [v20 layoutSubviews];
}

void __34__ASCLockupView_layoutContentView__block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v0 = 136446210;
    v1 = "-[ASCLockupView layoutContentView]_block_invoke";
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** %{public}s: Frame size does not match intrinsicContentSize, break on _ASCLockupView_incorrectFrameSize to debug", (uint8_t *)&v0, 0xCu);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ASCLockupView;
  [(ASCLockupView *)&v3 layoutSubviews];
  [(ASCLockupView *)self layoutContentView];
}

- (NSString)description
{
  objc_super v3 = [[ASCDescriber alloc] initWithObject:self];
  double v4 = [(ASCLockupView *)self contentView];
  [(ASCDescriber *)v3 addObject:v4 withName:@"contentView"];

  double v5 = [(ASCLockupView *)self offerPresenter];
  [(ASCDescriber *)v3 addObject:v5 withName:@"offerPresenter"];

  double v6 = [(ASCLockupView *)self lockupPresenter];
  [(ASCDescriber *)v3 addObject:v6 withName:@"lockupPresenter"];

  double v7 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v7;
}

- (id)preferredProductDetailsPresentationContext
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x100) != 0)
  {
    double v4 = [(ASCLockupView *)self delegate];
    uint64_t v2 = [v4 productDetailsPresentationContextForLockupView:self];
  }
  else
  {
    uint64_t v2 = +[ASCLockupProductDetailsPresentationContext defaultPresentationContext];
  }

  return v2;
}

- (void)presentProductDetailsViewController
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1C2B8D000, MEMORY[0x1E4F14500], v0, "Product details presentation context is %@", v1, v2, v3, v4, v5);
}

- (void)performLockupAction
{
  uint64_t v3 = [(ASCLockupView *)self lockupPresenter];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__ASCLockupView_performLockupAction__block_invoke;
  v4[3] = &unk_1E645D6A0;
  v4[4] = self;
  [v3 retryRequestIfNeeded:v4];
}

void __36__ASCLockupView_performLockupAction__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if ([*(id *)(a1 + 32) automaticallyPresentsProductDetails]
      && ([*(id *)(a1 + 32) offerPresenter],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          int v4 = [v3 viewAppForAppDistributionOffer],
          v3,
          v4))
    {
      id v6 = [*(id *)(a1 + 32) metricsPresenter];
      [v6 viewDidAction];
    }
    else if ([*(id *)(a1 + 32) automaticallyPresentsProductDetails])
    {
      uint8_t v5 = *(void **)(a1 + 32);
      [v5 presentProductDetailsViewController];
    }
  }
}

- (void)lockupPresenterDidBeginRequest
{
  if (*(_WORD *)&self->_delegateRespondsTo)
  {
    id v3 = [(ASCLockupView *)self delegate];
    [v3 lockupViewDidBeginRequest:self];
  }
}

- (void)lockupPresenterDidFinishRequest
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 2) != 0)
  {
    id v3 = [(ASCLockupView *)self delegate];
    [v3 lockupViewDidFinishRequest:self];
  }
}

- (void)lockupPresenterDidFailRequestWithError:(id)a3
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 4) != 0)
  {
    id v4 = a3;
    id v5 = [(ASCLockupView *)self delegate];
    [v5 lockupView:self didFailRequestWithError:v4];
  }
}

- (void)offerPresenterDidObserveChangeToState:(id)a3
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 8) != 0)
  {
    id v4 = a3;
    id v5 = [(ASCLockupView *)self delegate];
    [v5 lockupView:self appStateDidChange:v4];
  }
}

- (void)offerPresenterWillPerformActionOfOffer:(id)a3 inState:(id)a4 withActivity:(id *)a5 inContext:(id *)a6 withPaymentSheetView:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  __int16 delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  if ((delegateRespondsTo & 0x10) != 0)
  {
    double v16 = [(ASCLockupView *)self delegate];
    *a5 = [v16 metricsActivityForLockupView:self toPerformActionOfOffer:v12];

    __int16 delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  }
  if ((delegateRespondsTo & 0x20) != 0)
  {
    v21 = [(ASCLockupView *)self delegate];
    v18 = [v21 lockupViewPerformAdAttributionForState:v13];
    uint64_t v17 = 4 * (v18 != 0);

    if ((*(_WORD *)&self->_delegateRespondsTo & 0x80) != 0) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v17 = 0;
    v18 = 0;
    if ((delegateRespondsTo & 0x80) != 0)
    {
LABEL_5:
      double v19 = [(ASCLockupView *)self delegate];
      uint64_t v20 = [v19 lockupViewShouldSupportDSIDLessInstalls:self];

      goto LABEL_8;
    }
  }
  uint64_t v20 = 0;
LABEL_8:
  id v22 = *a6;
  CGRect v23 = [(ASCLockupView *)self presentingSceneIdentifier];
  CGRect v24 = [(ASCLockupView *)self presentingSceneBundleIdentifier];
  *a6 = [v22 offerContextWithPresentingSceneIdentifier:v23 presentingSceneBundleIdentifier:v24 externalDeepLinkURL:v18];

  id v25 = [*a6 offerContextByAddingFlags:v17];
  *a6 = v25;
  *a6 = [v25 offerContextByAddingFlags:v20];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[ASCLockupView offerPresenterWillPerformActionOfOffer:inState:withActivity:inContext:withPaymentSheetView:]((uint64_t)a6, v26, v27, v28, v29, v30, v31, v32);
  }
}

- (void)offerPresenterPreprocessOffer:(id)a3 inState:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x200) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[ASCLockupView offerPresenterPreprocessOffer:inState:completionBlock:]();
    }
    id v12 = [(ASCLockupView *)self delegate];
    [v12 lockupView:self preprocessOffer:v8 inState:v9 completionBlock:v11];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (NSString)presentingSceneIdentifier
{
  presentingSceneIdentifier = self->_presentingSceneIdentifier;
  if (presentingSceneIdentifier)
  {
    id v3 = presentingSceneIdentifier;
  }
  else
  {
    id v4 = [(ASCLockupView *)self window];
    id v5 = [v4 windowScene];
    id v3 = [v5 _sceneIdentifier];
  }

  return v3;
}

- (NSString)presentingSceneBundleIdentifier
{
  presentingSceneBundleIdentifier = self->_presentingSceneBundleIdentifier;
  if (presentingSceneBundleIdentifier)
  {
    id v3 = presentingSceneBundleIdentifier;
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "asc_realMainBundle");
    id v3 = [v4 bundleIdentifier];
  }

  return v3;
}

- (void)productDetailsUserDidInteractWithApp:(id)a3 interactionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x800) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[ASCLockupView productDetailsUserDidInteractWithApp:interactionType:]();
    }
    id v8 = [(ASCLockupView *)self delegate];
    [v8 productDetailsUserDidInteractWithApp:self interactionType:v7];
  }
  if ([v7 isEqualToString:@"dismissed"]) {
    [(ASCLockupView *)self setLockupProductDetails:0];
  }
}

- (ASCLockupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCLockupViewDelegate *)WeakRetained;
}

- (BOOL)automaticallyPresentsProductDetails
{
  return self->_automaticallyPresentsProductDetails;
}

- (void)setAutomaticallyPresentsProductDetails:(BOOL)a3
{
  self->_automaticallyPresentsProductDetails = a3;
}

- (ASCLockupContentView)contentView
{
  return self->_contentView;
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

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (ASCLockupProductDetails)lockupProductDetails
{
  return self->_lockupProductDetails;
}

- (void)setLockupProductDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupProductDetails, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);
  objc_storeStrong((id *)&self->_lockupPresenter, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
  objc_storeStrong((id *)&self->_offerPresenter, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setViewRenderSpanProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupView *)self lockupPresenter];
  [v5 setViewRenderSpanProvider:v4];
}

- (void)presentingViewController
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Lockup view %@ could not find view controller to present from.", v0, 0xCu);
}

- (void)offerPresenterWillPerformActionOfOffer:(uint64_t)a3 inState:(uint64_t)a4 withActivity:(uint64_t)a5 inContext:(uint64_t)a6 withPaymentSheetView:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)offerPresenterPreprocessOffer:inState:completionBlock:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2112;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Requesting delegate to preprocess offer: %@, in state: %@", v1, 0x16u);
}

- (void)productDetailsUserDidInteractWithApp:interactionType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1C2B8D000, MEMORY[0x1E4F14500], v0, "Product details user did interact with app: %@", v1, v2, v3, v4, v5);
}

@end