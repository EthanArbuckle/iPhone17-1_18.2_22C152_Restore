@interface HUQuickControlContainerView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_isDisambiguationButtonVisible;
- (BOOL)_isPhoneCallStatusUpdateTimerActive;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldShowControlView;
- (BOOL)_shouldShowDisambiguationButtonForUserActivities:(id)a3 disambiguationContext:(id)a4;
- (BOOL)_useCompactHeightLayout;
- (BOOL)controlViewSupportsTransformTransition;
- (BOOL)hasActivePhoneCall;
- (BOOL)isDisambiguationButtonAnimating;
- (BOOL)isExternallyAnimating;
- (BOOL)shouldShowActiveControl;
- (BOOL)shouldShowDetailsButton;
- (CGAffineTransform)_controlHostTransform;
- (CGAffineTransform)_controlHostTransformForPresentationProgress:(SEL)a3;
- (CGAffineTransform)_disambiguationButtonHiddenTransform;
- (CGAffineTransform)sourceViewTransformForPresentationProgress:(SEL)a3;
- (CGPoint)_controlHostCenter;
- (CGPoint)_controlHostCenterForPresentationProgress:(double)a3;
- (CGRect)presentedControlFrame;
- (CGRect)sourceRect;
- (CGSize)_presentedControlHostSize;
- (HUControlHostView)controlHostView;
- (HUQuickControlAuxiliaryHostView)auxiliaryHostView;
- (HUQuickControlButtonRowView)buttonRowView;
- (HUQuickControlContainerView)initWithFrame:(CGRect)a3 delegate:(id)a4 sourceRect:(CGRect)a5;
- (HUQuickControlContainerViewDelegate)delegate;
- (HUQuickControlSummaryView)summaryView;
- (NSArray)contentConstraints;
- (NSArray)maxHeightConstraints;
- (NSAttributedString)disambiguationButtonPrimaryText;
- (NSLayoutConstraint)compactControlBottomConstraint;
- (NSLayoutConstraint)controlHostViewTopConstraintToView;
- (NSLayoutConstraint)disambiguationButtonHeightConstraint;
- (NSLayoutConstraint)disambiguationButtonTopConstraint;
- (NSOrderedSet)currentUserActivities;
- (NSString)disambiguationButtonSecondaryText;
- (OS_dispatch_source)phoneCallStatusUpdateTimer;
- (PCActivity)lastActivity;
- (PCDisambiguationContext)currentDisambiguationContext;
- (PLPillControl)disambiguationButton;
- (UIButton)detailsButton;
- (UIImageView)disambiguationButtonLeadingImageView;
- (UILayoutGuide)cardViewLayoutGuide;
- (UILayoutGuide)contentToAuxiliarySpacingLayoutGuide;
- (UILayoutGuide)controlViewLayoutGuide;
- (UILayoutGuide)controlViewPreferredFrameLayoutGuide;
- (UILayoutGuide)standardViewportFromParentGuide;
- (UILayoutGuide)topToSummarySpacingLayoutGuide;
- (UIView)activeControlView;
- (double)_disambiguationButtonPreferredHeight;
- (double)chromeTransitionProgress;
- (double)controlTransitionProgress;
- (double)initialSourceViewScale;
- (unint64_t)edgesForExtendedLayout;
- (void)_configureCardViewLayoutGuideConstraints:(id)a3;
- (void)_configureControlViewLayoutGuideConstraints:(id)a3;
- (void)_configureDisambiguationButtonConstraints:(id)a3;
- (void)_configureDisambiguationForActivities:(id)a3 disambiguationContext:(id)a4;
- (void)_configureRegularHeightConstraints:(id)a3;
- (void)_detailsButtonTapped:(id)a3;
- (void)_disambiguationButtonTapped:(id)a3;
- (void)_disambiguationButtonTouchDown:(id)a3;
- (void)_disambiguationButtonTouchUp:(id)a3;
- (void)_invalidatePhoneCallStatusUpdateTimer;
- (void)_startPhoneCallStatusUpdateTimer;
- (void)_updateCompactControlBottomConstraint;
- (void)_updateDetailsButtonVisibility;
- (void)_updateDisambiguationButtonVisible:(BOOL)a3;
- (void)_updateLayoutMargins;
- (void)dealloc;
- (void)didUpdateActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5;
- (void)externalAnimationsBegan;
- (void)externalAnimationsEnded;
- (void)hideAuxiliaryView;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setActiveControlView:(id)a3;
- (void)setAuxiliaryHostView:(id)a3;
- (void)setButtonRowView:(id)a3;
- (void)setCardViewLayoutGuide:(id)a3;
- (void)setChromeTransitionProgress:(double)a3;
- (void)setCompactControlBottomConstraint:(id)a3;
- (void)setContentConstraints:(id)a3;
- (void)setContentToAuxiliarySpacingLayoutGuide:(id)a3;
- (void)setControlHostView:(id)a3;
- (void)setControlHostViewTopConstraintToView:(id)a3;
- (void)setControlTransitionProgress:(double)a3;
- (void)setControlViewLayoutGuide:(id)a3;
- (void)setControlViewPreferredFrameLayoutGuide:(id)a3;
- (void)setControlViewSupportsTransformTransition:(BOOL)a3;
- (void)setCurrentDisambiguationContext:(id)a3;
- (void)setCurrentUserActivities:(id)a3;
- (void)setDetailsButton:(id)a3;
- (void)setDisambiguationButton:(id)a3;
- (void)setDisambiguationButtonHeightConstraint:(id)a3;
- (void)setDisambiguationButtonLeadingImageView:(id)a3;
- (void)setDisambiguationButtonPrimaryText:(id)a3;
- (void)setDisambiguationButtonSecondaryText:(id)a3;
- (void)setDisambiguationButtonTopConstraint:(id)a3;
- (void)setEdgesForExtendedLayout:(unint64_t)a3;
- (void)setHasActivePhoneCall:(BOOL)a3;
- (void)setInitialSourceViewScale:(double)a3;
- (void)setIsDisambiguationButtonAnimating:(BOOL)a3;
- (void)setLastActivity:(id)a3;
- (void)setMaxHeightConstraints:(id)a3;
- (void)setPhoneCallStatusUpdateTimer:(id)a3;
- (void)setShouldShowActiveControl:(BOOL)a3;
- (void)setShouldShowDetailsButton:(BOOL)a3;
- (void)setStandardViewportFromParentGuide:(id)a3;
- (void)setSummaryView:(id)a3;
- (void)setTopToSummarySpacingLayoutGuide:(id)a3;
- (void)showAuxiliaryView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)willMoveToWindow:(id)a3;
@end

@implementation HUQuickControlContainerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlContainerView)initWithFrame:(CGRect)a3 delegate:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  id v14 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HUQuickControlContainerView;
  v15 = -[HUQuickControlContainerView initWithFrame:](&v54, sel_initWithFrame_, v12, v11, v10, v9);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    v16->_sourceRect.origin.CGFloat x = x;
    v16->_sourceRect.origin.CGFloat y = y;
    v16->_sourceRect.size.CGFloat width = width;
    v16->_sourceRect.size.CGFloat height = height;
    v16->_shouldShowDetailsButton = 1;
    v16->_shouldShowActiveControl = 1;
    if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
    {
      v16->_isExternallyAnimating = 1;
      v17 = [MEMORY[0x1E4F69430] sharedInstance];
      [v17 addObserver:v16];
      id v18 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v19 = [v17 lastDisambiguationContext];
      v20 = [v19 leadingImage];
      uint64_t v21 = [v18 initWithImage:v20];
      disambiguationButtonLeadingImageView = v16->_disambiguationButtonLeadingImageView;
      v16->_disambiguationButtonLeadingImageView = (UIImageView *)v21;

      -[UIImageView setFrame:](v16->_disambiguationButtonLeadingImageView, "setFrame:", 0.0, 0.0, 34.0, 34.0);
      [(UIImageView *)v16->_disambiguationButtonLeadingImageView setContentMode:4];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F91448]) initWithLeadingAccessoryView:v16->_disambiguationButtonLeadingImageView trailingAccessoryView:0];
      disambiguationButton = v16->_disambiguationButton;
      v16->_disambiguationButton = (PLPillControl *)v23;

      [(PLPillControl *)v16->_disambiguationButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v25 = v16->_disambiguationButton;
      v26 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [(PLPillControl *)v25 setBackgroundColor:v26];

      [(PLPillControl *)v16->_disambiguationButton setAlpha:0.0];
      v27 = v16->_disambiguationButton;
      [(HUQuickControlContainerView *)v16 _disambiguationButtonHiddenTransform];
      [(PLPillControl *)v27 setTransform:&v53];
      [(PLPillControl *)v16->_disambiguationButton setOpaque:1];
      [(PLPillControl *)v16->_disambiguationButton addTarget:v16 action:sel__disambiguationButtonTapped_ forControlEvents:64];
      [(PLPillControl *)v16->_disambiguationButton addTarget:v16 action:sel__disambiguationButtonTouchDown_ forControlEvents:1];
      [(PLPillControl *)v16->_disambiguationButton addTarget:v16 action:sel__disambiguationButtonTouchUp_ forControlEvents:128];
      [(PLPillControl *)v16->_disambiguationButton addTarget:v16 action:sel__disambiguationButtonTouchUp_ forControlEvents:256];
      [(PLPillControl *)v16->_disambiguationButton addTarget:v16 action:sel__disambiguationButtonTouchUp_ forControlEvents:32];
      [(PLPillControl *)v16->_disambiguationButton setOverrideUserInterfaceStyle:1];
      [(HUQuickControlContainerView *)v16 addSubview:v16->_disambiguationButton];
    }
    v28 = [HUControlHostView alloc];
    v29 = [(HUQuickControlContainerView *)v16 activeControlView];
    v30 = [(HUControlHostView *)v28 initWithControlView:v29];
    [(HUQuickControlContainerView *)v16 setControlHostView:v30];

    v31 = [(HUQuickControlContainerView *)v16 controlHostView];
    [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

    v32 = [(HUQuickControlContainerView *)v16 controlHostView];
    [(HUQuickControlContainerView *)v16 addSubview:v32];

    v33 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(HUQuickControlContainerView *)v16 setDetailsButton:v33];

    v34 = [(HUQuickControlContainerView *)v16 detailsButton];
    v35 = HUImageNamed(@"card-settings");
    [v34 setImage:v35 forState:0];

    v36 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v37 = [(HUQuickControlContainerView *)v16 detailsButton];
    [v37 setTintColor:v36];

    v38 = [(HUQuickControlContainerView *)v16 detailsButton];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [(HUQuickControlContainerView *)v16 detailsButton];
    [v39 setAlpha:1.0];

    v40 = [(HUQuickControlContainerView *)v16 detailsButton];
    [v40 addTarget:v16 action:sel__detailsButtonTapped_ forControlEvents:64];

    v41 = [(HUQuickControlContainerView *)v16 detailsButton];
    [(HUQuickControlContainerView *)v16 addSubview:v41];

    id v42 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    [(HUQuickControlContainerView *)v16 setControlViewLayoutGuide:v42];

    v43 = [(HUQuickControlContainerView *)v16 controlViewLayoutGuide];
    [v43 setIdentifier:@"HUControlViewLayoutGuide"];

    v44 = [(HUQuickControlContainerView *)v16 controlViewLayoutGuide];
    [(HUQuickControlContainerView *)v16 addLayoutGuide:v44];

    id v45 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    [(HUQuickControlContainerView *)v16 setCardViewLayoutGuide:v45];

    v46 = [(HUQuickControlContainerView *)v16 cardViewLayoutGuide];
    [v46 setIdentifier:@"HUCardViewLayoutGuide"];

    v47 = [(HUQuickControlContainerView *)v16 cardViewLayoutGuide];
    [(HUQuickControlContainerView *)v16 addLayoutGuide:v47];

    id v48 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    [(HUQuickControlContainerView *)v16 setControlViewPreferredFrameLayoutGuide:v48];

    v49 = [(HUQuickControlContainerView *)v16 controlViewPreferredFrameLayoutGuide];
    [v49 setIdentifier:@"HUControlViewPreferredFrameLayoutGuide"];

    v50 = [(HUQuickControlContainerView *)v16 controlViewPreferredFrameLayoutGuide];
    [(HUQuickControlContainerView *)v16 addLayoutGuide:v50];

    v51 = [(HUQuickControlContainerView *)v16 layer];
    [v51 setAllowsGroupBlending:0];

    [(HUQuickControlContainerView *)v16 _updateLayoutMargins];
  }

  return v16;
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config]) {
    [(HUQuickControlContainerView *)self _invalidatePhoneCallStatusUpdateTimer];
  }
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlContainerView;
  [(HUQuickControlContainerView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlContainerView;
  [(HUQuickControlContainerView *)&v8 layoutSubviews];
  objc_super v3 = [(HUQuickControlContainerView *)self disambiguationButton];
  v4 = [v3 layer];
  [v4 setCornerRadius:8.0];

  v5 = [(PLPillControl *)self->_disambiguationButton layer];
  LODWORD(v6) = 1036831949;
  [v5 setShadowOpacity:v6];
  objc_msgSend(v5, "setShadowOffset:", 0.0, 10.0);
  id v7 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  objc_msgSend(v5, "setShadowColor:", objc_msgSend(v7, "CGColor"));

  [v5 setShadowRadius:12.0];
  [v5 setShadowPathIsBounds:1];
  if ([(HUQuickControlContainerView *)self isDisambiguationButtonAnimating])
  {
    [(HUQuickControlContainerView *)self frame];
    -[HUQuickControlContainerView setFrame:](self, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (void)setEdgesForExtendedLayout:(unint64_t)a3
{
  if (self->_edgesForExtendedLayout != a3)
  {
    self->_edgesForExtendedLayout = a3;
    [(HUQuickControlContainerView *)self _updateLayoutMargins];
  }
}

- (void)setShouldShowActiveControl:(BOOL)a3
{
  if (self->_shouldShowActiveControl != a3)
  {
    self->_shouldShowActiveControl = a3;
    BOOL v4 = !a3;
    v5 = [(HUQuickControlContainerView *)self controlHostView];
    [v5 setHidden:v4];

    [(HUQuickControlContainerView *)self setNeedsUpdateConstraints];
    [(HUQuickControlContainerView *)self setNeedsLayout];
  }
}

- (BOOL)_shouldShowControlView
{
  if (![(HUQuickControlContainerView *)self shouldShowActiveControl]) {
    return 0;
  }
  objc_super v3 = [(HUQuickControlContainerView *)self activeControlView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setActiveControlView:(id)a3
{
  id v7 = a3;
  id v5 = [(HUQuickControlContainerView *)self activeControlView];

  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_activeControlView, a3);
    double v6 = [(HUQuickControlContainerView *)self controlHostView];
    [v6 setControlView:v7];

    [(HUQuickControlContainerView *)self setNeedsUpdateConstraints];
  }
}

- (void)setInitialSourceViewScale:(double)a3
{
  self->_initialSourceViewScale = a3;
  [(HUQuickControlContainerView *)self setNeedsLayout];
}

- (void)setShouldShowDetailsButton:(BOOL)a3
{
  if (self->_shouldShowDetailsButton != a3)
  {
    self->_shouldShowDetailsButton = a3;
    [(HUQuickControlContainerView *)self _updateDetailsButtonVisibility];
  }
}

- (void)setControlTransitionProgress:(double)a3
{
  self->_controlTransitionProgress = a3;
}

- (void)setChromeTransitionProgress:(double)a3
{
  self->_chromeTransitionProgress = a3;
  id v5 = [(HUQuickControlContainerView *)self summaryView];
  [v5 setAlpha:a3];

  double v6 = [(HUQuickControlContainerView *)self auxiliaryHostView];
  [v6 setAlpha:a3];

  [(HUQuickControlContainerView *)self setAlpha:a3];
}

- (void)setStandardViewportFromParentGuide:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_standardViewportFromParentGuide, a3);
  [(HUQuickControlContainerView *)self setNeedsUpdateConstraints];
  double v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    standardViewportFromParentGuide = self->_standardViewportFromParentGuide;
    int v8 = 138412290;
    double v9 = standardViewportFromParentGuide;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Setting _standardViewportFromParentGuide = %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_detailsButtonTapped:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2080;
    double v9 = "-[HUQuickControlContainerView _detailsButtonTapped:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped details button", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [(HUQuickControlContainerView *)self delegate];
  [v5 detailsButtonPressedInContainerView:self];
}

- (void)showAuxiliaryView:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlContainerView *)self auxiliaryHostView];
  [v5 setAuxiliaryView:v4];

  [(HUQuickControlContainerView *)self _updateCompactControlBottomConstraint];
}

- (void)hideAuxiliaryView
{
  objc_super v3 = [(HUQuickControlContainerView *)self buttonRowView];
  id v4 = [(HUQuickControlContainerView *)self auxiliaryHostView];
  [v4 setAuxiliaryView:v3];

  [(HUQuickControlContainerView *)self _updateCompactControlBottomConstraint];
}

- (void)externalAnimationsBegan
{
  self->_isExternallyAnimating = 1;
}

- (void)externalAnimationsEnded
{
  if ([(HUQuickControlContainerView *)self isExternallyAnimating])
  {
    self->_isExternallyAnimating = 0;
    if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
    {
      if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
      {
        objc_super v3 = HFLogForCategory();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v9 = 0;
          _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Disambiguation button external animations ended", v9, 2u);
        }

        id v4 = [(HUQuickControlContainerView *)self currentUserActivities];
        id v5 = [(HUQuickControlContainerView *)self currentDisambiguationContext];
        [(HUQuickControlContainerView *)self _configureDisambiguationForActivities:v4 disambiguationContext:v5];

        int v6 = [(HUQuickControlContainerView *)self currentUserActivities];
        id v7 = [(HUQuickControlContainerView *)self currentDisambiguationContext];
        BOOL v8 = [(HUQuickControlContainerView *)self _shouldShowDisambiguationButtonForUserActivities:v6 disambiguationContext:v7];

        [(HUQuickControlContainerView *)self _updateDisambiguationButtonVisible:v8];
        [(HUQuickControlContainerView *)self setNeedsLayout];
      }
    }
  }
}

- (void)_updateDetailsButtonVisibility
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__HUQuickControlContainerView__updateDetailsButtonVisibility__block_invoke;
  v2[3] = &unk_1E6386018;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.25];
}

void __61__HUQuickControlContainerView__updateDetailsButtonVisibility__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldShowDetailsButton]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) detailsButton];
  [v3 setAlpha:v2];
}

- (void)_disambiguationButtonTapped:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F69430], "sharedInstance", a3);
  id v5 = [(HUQuickControlContainerView *)self currentDisambiguationContext];
  [v4 userTappedDisambiguationButtonForContext:v5];

  int v6 = [(HUQuickControlContainerView *)self disambiguationButton];
  [v6 setHighlighted:1];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HUQuickControlContainerView__disambiguationButtonTapped___block_invoke;
  v7[3] = &unk_1E6386018;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:0.25];
}

void __59__HUQuickControlContainerView__disambiguationButtonTapped___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) disambiguationButton];
  [v1 setHighlighted:0];
}

- (void)_disambiguationButtonTouchDown:(id)a3
{
  id v3 = [(HUQuickControlContainerView *)self disambiguationButton];
  [v3 setHighlighted:1];
}

- (void)_disambiguationButtonTouchUp:(id)a3
{
  id v3 = [(HUQuickControlContainerView *)self disambiguationButton];
  [v3 setHighlighted:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlContainerView;
  id v4 = a3;
  [(HUQuickControlContainerView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(HUQuickControlContainerView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  uint64_t v7 = [v4 verticalSizeClass];

  if (v6 != v7)
  {
    [(HUQuickControlContainerView *)self setNeedsUpdateConstraints];
    [(HUQuickControlContainerView *)self setNeedsLayout];
  }
}

- (BOOL)_useCompactHeightLayout
{
  double v2 = [(HUQuickControlContainerView *)self traitCollection];
  BOOL v3 = [v2 verticalSizeClass] == 1;

  return v3;
}

- (void)layoutMarginsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlContainerView;
  [(HUQuickControlContainerView *)&v8 layoutMarginsDidChange];
  [(HUQuickControlContainerView *)self layoutMargins];
  double v4 = v3;
  [(HUQuickControlContainerView *)self layoutMargins];
  double v6 = v5;
  uint64_t v7 = [(HUQuickControlContainerView *)self controlHostView];
  objc_msgSend(v7, "setLayoutMargins:", 0.0, v4, 0.0, v6);
}

- (void)_updateLayoutMargins
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HUQuickControlContainerView__updateLayoutMargins__block_invoke;
  aBlock[3] = &unk_1E63895D8;
  aBlock[4] = self;
  double v3 = (double (**)(void *, uint64_t))_Block_copy(aBlock);
  double v4 = v3[2](v3, 1);
  double v5 = v3[2](v3, 2);
  double v6 = v3[2](v3, 4);
  -[HUQuickControlContainerView setLayoutMargins:](self, "setLayoutMargins:", v4, v5, v6, v3[2](v3, 8));
  [(HUQuickControlContainerView *)self setEdgesInsettingLayoutMarginsFromSafeArea:~[(HUQuickControlContainerView *)self edgesForExtendedLayout] & 0xF];
}

double __51__HUQuickControlContainerView__updateLayoutMargins__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) edgesForExtendedLayout];
  double result = 34.0;
  if ((a2 & ~v3) != 0) {
    return 20.0;
  }
  return result;
}

- (CGAffineTransform)_controlHostTransformForPresentationProgress:(SEL)a3
{
  double result = (CGAffineTransform *)[(HUQuickControlContainerView *)self _presentedControlHostSize];
  double v10 = v9;
  double v11 = v8;
  if (v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    uint64_t v24 = MEMORY[0x1E4F1DAB8];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v25;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v24 + 32);
  }
  else
  {
    [(HUQuickControlContainerView *)self sourceRect];
    double v14 = v13;
    [(HUQuickControlContainerView *)self initialSourceViewScale];
    double v16 = v15 * v14 / v10;
    [(HUQuickControlContainerView *)self sourceRect];
    double v18 = v17;
    [(HUQuickControlContainerView *)self initialSourceViewScale];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HUQuickControlContainerView__controlHostTransformForPresentationProgress___block_invoke;
    aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
    *(double *)&aBlock[4] = a4;
    double v20 = v19 * v18 / v11;
    uint64_t v21 = (double (**)(double))_Block_copy(aBlock);
    CGFloat v22 = v21[2](v16);
    CGFloat v23 = ((double (*)(double (**)(double), double))v21[2])(v21, v20);
    CGAffineTransformMakeScale(retstr, v22, v23);
  }
  return result;
}

double __76__HUQuickControlContainerView__controlHostTransformForPresentationProgress___block_invoke(uint64_t a1, double a2)
{
  return 1.0 - (1.0 - a2) * (1.0 - *(double *)(a1 + 32));
}

- (CGAffineTransform)_controlHostTransform
{
  [(HUQuickControlContainerView *)self controlTransitionProgress];

  return -[HUQuickControlContainerView _controlHostTransformForPresentationProgress:](self, "_controlHostTransformForPresentationProgress:");
}

- (CGPoint)_controlHostCenter
{
  [(HUQuickControlContainerView *)self controlTransitionProgress];

  -[HUQuickControlContainerView _controlHostCenterForPresentationProgress:](self, "_controlHostCenterForPresentationProgress:");
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)_controlHostCenterForPresentationProgress:(double)a3
{
  [(HUQuickControlContainerView *)self sourceRect];
  UIRectGetCenter();
  double v6 = v5;
  double v8 = v7;
  [(HUQuickControlContainerView *)self sourceRect];
  UIRectGetCenter();
  double v10 = v9;
  double v12 = v11;
  double v13 = [(HUQuickControlContainerView *)self superview];
  double v14 = [v13 window];
  [v14 bounds];
  double v16 = v15;
  double v30 = v17;

  [(HUQuickControlContainerView *)self _presentedControlHostSize];
  double v19 = v18;
  double v21 = v20;
  CGFloat v22 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  double v24 = v19 * 0.5;
  if (v23)
  {
    if (v10 - v24 >= 0.0)
    {
      if (v10 + v24 <= v16) {
        goto LABEL_8;
      }
      double v24 = v16 - v24;
      double v25 = -20.0;
    }
    else
    {
      double v25 = 20.0;
    }
    double v10 = v24 + v25;
LABEL_8:
    double v26 = v21 * 0.5;
    if (v12 - v21 * 0.5 >= 0.0)
    {
      if (v12 + v26 <= v30)
      {
LABEL_13:
        double v24 = v10;
        goto LABEL_14;
      }
      double v26 = v30 - v26;
      double v27 = -60.0;
    }
    else
    {
      double v27 = 60.0;
    }
    double v12 = v26 + v27;
    goto LABEL_13;
  }
  double v12 = v21 * 0.5;
LABEL_14:
  double v28 = v6 + (v24 - v6) * a3;
  double v29 = v8 + (v12 - v8) * a3;
  result.CGFloat y = v29;
  result.CGFloat x = v28;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  double v4 = [a3 screen];
  [v4 bounds];
  double v6 = HURoundToScreenScale(v5 * 0.78);

  double v7 = [(HUQuickControlContainerView *)self maxHeightConstraints];

  if (v7)
  {
    double v8 = [(HUQuickControlContainerView *)self maxHeightConstraints];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__HUQuickControlContainerView_willMoveToWindow___block_invoke;
    v18[3] = &__block_descriptor_40_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
    *(double *)&v18[4] = v6;
    [v8 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    double v9 = [(HUQuickControlContainerView *)self controlViewPreferredFrameLayoutGuide];
    double v10 = [v9 heightAnchor];
    double v11 = [v10 constraintLessThanOrEqualToConstant:v6];

    LODWORD(v12) = 1144750080;
    [v11 setPriority:v12];
    [v17 addObject:v11];
    double v13 = [(HUQuickControlContainerView *)self controlHostView];
    double v14 = [v13 heightAnchor];
    double v15 = [v14 constraintLessThanOrEqualToConstant:v6];

    LODWORD(v16) = 1144750080;
    [v15 setPriority:v16];
    [v17 addObject:v15];
    [MEMORY[0x1E4F28DC8] activateConstraints:v17];
    [(HUQuickControlContainerView *)self setMaxHeightConstraints:v17];
  }
}

uint64_t __48__HUQuickControlContainerView_willMoveToWindow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setConstant:*(double *)(a1 + 32)];
}

- (void)updateConstraints
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = [(HUQuickControlContainerView *)self contentConstraints];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1E4F28DC8];
    double v6 = [(HUQuickControlContainerView *)self contentConstraints];
    [v5 deactivateConstraints:v6];
  }
  double v7 = [MEMORY[0x1E4F1CA48] array];
  [(HUQuickControlContainerView *)self _configureRegularHeightConstraints:v7];
  [MEMORY[0x1E4F28DC8] activateConstraints:v7];
  [(HUQuickControlContainerView *)self setContentConstraints:v7];
  double v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    double v12 = v9;
    __int16 v13 = 2112;
    double v14 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@ Added and activated constraints = %@", buf, 0x16u);
  }
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlContainerView;
  [(HUQuickControlContainerView *)&v10 updateConstraints];
}

- (void)_configureRegularHeightConstraints:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [(HUQuickControlContainerView *)self controlViewPreferredFrameLayoutGuide];
  double v7 = [v6 centerYAnchor];
  double v8 = [(HUQuickControlContainerView *)self controlHostView];
  double v9 = [v8 centerYAnchor];
  objc_super v10 = [v7 constraintEqualToAnchor:v9];
  [v5 addObject:v10];

  double v11 = [(HUQuickControlContainerView *)self controlHostView];
  [v11 setRequiresWellDefinedSize:1];

  double v12 = [(HUQuickControlContainerView *)self heightAnchor];
  __int16 v13 = [(HUQuickControlContainerView *)self standardViewportFromParentGuide];
  double v14 = [v13 heightAnchor];
  uint64_t v15 = [v12 constraintGreaterThanOrEqualToAnchor:v14];

  [v5 addObject:v15];
  double v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = NSStringFromSelector(a2);
    double v18 = [(HUQuickControlContainerView *)self standardViewportFromParentGuide];
    double v19 = [v18 heightAnchor];
    int v60 = 138412802;
    v61 = v17;
    __int16 v62 = 2112;
    v63 = v15;
    __int16 v64 = 2112;
    v65 = v19;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@ totalHeightFromParent = %@, self.standardViewportFromParentGuide.heightAnchor = %@", (uint8_t *)&v60, 0x20u);
  }
  double v20 = [(HUQuickControlContainerView *)self controlHostView];
  double v21 = [v20 bottomAnchor];
  CGFloat v22 = [(HUQuickControlContainerView *)self detailsButton];
  uint64_t v23 = [v22 topAnchor];
  double v24 = [v21 constraintEqualToAnchor:v23 constant:-5.0];
  [v5 addObject:v24];

  double v25 = [(HUQuickControlContainerView *)self detailsButton];
  double v26 = [v25 bottomAnchor];
  double v27 = [(HUQuickControlContainerView *)self bottomAnchor];
  double v28 = [v26 constraintEqualToAnchor:v27 constant:-20.0];
  [v5 addObject:v28];

  double v29 = [(HUQuickControlContainerView *)self controlHostView];
  double v30 = [v29 widthAnchor];
  v31 = [(HUQuickControlContainerView *)self widthAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v5 addObject:v32];

  v33 = [(HUQuickControlContainerView *)self controlHostView];
  v34 = [v33 centerXAnchor];
  v35 = [(HUQuickControlContainerView *)self centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v5 addObject:v36];

  v37 = [(HUQuickControlContainerView *)self controlViewPreferredFrameLayoutGuide];
  v38 = [v37 widthAnchor];
  v39 = [(HUQuickControlContainerView *)self layoutMarginsGuide];
  v40 = [v39 widthAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v5 addObject:v41];

  id v42 = [(HUQuickControlContainerView *)self controlViewPreferredFrameLayoutGuide];
  v43 = [v42 centerXAnchor];
  v44 = [(HUQuickControlContainerView *)self centerXAnchor];
  id v45 = [v43 constraintEqualToAnchor:v44];
  [v5 addObject:v45];

  v46 = [(HUQuickControlContainerView *)self detailsButton];
  v47 = [v46 trailingAnchor];
  id v48 = [(HUQuickControlContainerView *)self trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:-25.0];
  [v5 addObject:v49];

  v50 = [(HUQuickControlContainerView *)self detailsButton];
  v51 = [v50 widthAnchor];
  v52 = [v51 constraintEqualToConstant:40.0];
  [v5 addObject:v52];

  uint64_t v53 = [(HUQuickControlContainerView *)self detailsButton];
  objc_super v54 = [v53 heightAnchor];
  v55 = [v54 constraintEqualToConstant:40.0];
  [v5 addObject:v55];

  [(HUQuickControlContainerView *)self _configureControlViewLayoutGuideConstraints:v5];
  [(HUQuickControlContainerView *)self _configureCardViewLayoutGuideConstraints:v5];
  if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
    || ![MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    v56 = [(HUQuickControlContainerView *)self controlHostView];
    v57 = [v56 topAnchor];
    v58 = [(HUQuickControlContainerView *)self topAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    [v5 addObject:v59];
  }
  else
  {
    [(HUQuickControlContainerView *)self _configureDisambiguationButtonConstraints:v5];
  }
}

- (void)_configureControlViewLayoutGuideConstraints:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = a3;
  id v8 = [(HUQuickControlContainerView *)self controlViewLayoutGuide];
  double v6 = [(HUQuickControlContainerView *)self controlHostView];
  double v7 = objc_msgSend(v4, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v8, v6);
  [v5 addObjectsFromArray:v7];
}

- (void)_configureCardViewLayoutGuideConstraints:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = a3;
  id v7 = [(HUQuickControlContainerView *)self cardViewLayoutGuide];
  double v6 = objc_msgSend(v4, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v7, self);
  [v5 addObjectsFromArray:v6];
}

- (void)_updateCompactControlBottomConstraint
{
  double v3 = [(HUQuickControlContainerView *)self compactControlBottomConstraint];
  [v3 setActive:0];

  if ([(HUQuickControlContainerView *)self _useCompactHeightLayout]
    && [(HUQuickControlContainerView *)self _shouldShowControlView])
  {
    double v4 = [(HUQuickControlContainerView *)self auxiliaryHostView];
    id v5 = [v4 auxiliaryView];
    int v6 = [v5 hasCenteredContent];

    id v7 = [(HUQuickControlContainerView *)self controlHostView];
    id v8 = [v7 bottomAnchor];
    if (v6)
    {
      double v9 = [(HUQuickControlContainerView *)self auxiliaryHostView];
      objc_super v10 = [v9 topAnchor];
      [v8 constraintEqualToAnchor:v10 constant:-20.0];
    }
    else
    {
      double v9 = [(HUQuickControlContainerView *)self layoutMarginsGuide];
      objc_super v10 = [v9 bottomAnchor];
      [v8 constraintEqualToAnchor:v10];
    double v11 = };
    [(HUQuickControlContainerView *)self setCompactControlBottomConstraint:v11];

    id v12 = [(HUQuickControlContainerView *)self compactControlBottomConstraint];
    [v12 setActive:1];
  }
  else
  {
    [(HUQuickControlContainerView *)self setCompactControlBottomConstraint:0];
  }
}

- (void)_configureDisambiguationButtonConstraints:(id)a3
{
  id v4 = a3;
  controlHostViewTopConstraintToView = self->_controlHostViewTopConstraintToView;
  id v30 = v4;
  if (!controlHostViewTopConstraintToView)
  {
    int v6 = [(HUQuickControlContainerView *)self controlHostView];
    id v7 = [v6 topAnchor];
    id v8 = [(HUQuickControlContainerView *)self topAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
    objc_super v10 = self->_controlHostViewTopConstraintToView;
    self->_controlHostViewTopConstraintToView = v9;

    id v4 = v30;
    controlHostViewTopConstraintToView = self->_controlHostViewTopConstraintToView;
  }
  [v4 addObject:controlHostViewTopConstraintToView];
  disambiguationButtonTopConstraint = self->_disambiguationButtonTopConstraint;
  if (!disambiguationButtonTopConstraint)
  {
    id v12 = [(HUQuickControlContainerView *)self disambiguationButton];
    __int16 v13 = [v12 topAnchor];
    double v14 = [(HUQuickControlContainerView *)self topAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14 constant:12.0];
    double v16 = self->_disambiguationButtonTopConstraint;
    self->_disambiguationButtonTopConstraint = v15;

    disambiguationButtonTopConstraint = self->_disambiguationButtonTopConstraint;
  }
  [v30 addObject:disambiguationButtonTopConstraint];
  disambiguationButtonHeightConstraint = self->_disambiguationButtonHeightConstraint;
  if (!disambiguationButtonHeightConstraint)
  {
    double v18 = [(HUQuickControlContainerView *)self disambiguationButton];
    double v19 = [v18 heightAnchor];
    double v20 = [v19 constraintGreaterThanOrEqualToConstant:50.0];
    double v21 = self->_disambiguationButtonHeightConstraint;
    self->_disambiguationButtonHeightConstraint = v20;

    disambiguationButtonHeightConstraint = self->_disambiguationButtonHeightConstraint;
  }
  [v30 addObject:disambiguationButtonHeightConstraint];
  CGFloat v22 = [(HUQuickControlContainerView *)self disambiguationButton];
  uint64_t v23 = [v22 leadingAnchor];
  double v24 = [(HUQuickControlContainerView *)self leadingAnchor];
  double v25 = [v23 constraintEqualToAnchor:v24 constant:40.0];
  [v30 addObject:v25];

  double v26 = [(HUQuickControlContainerView *)self disambiguationButton];
  double v27 = [v26 trailingAnchor];
  double v28 = [(HUQuickControlContainerView *)self trailingAnchor];
  double v29 = [v27 constraintEqualToAnchor:v28 constant:-40.0];
  [v30 addObject:v29];
}

- (CGRect)presentedControlFrame
{
  [(HUQuickControlContainerView *)self _controlHostCenterForPresentationProgress:1.0];
  double v4 = v3;
  double v6 = v5;
  [(HUQuickControlContainerView *)self _presentedControlHostSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGSize)_presentedControlHostSize
{
  double v2 = [(HUQuickControlContainerView *)self cardViewLayoutGuide];
  [v2 layoutFrame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGAffineTransform)sourceViewTransformForPresentationProgress:(SEL)a3
{
  [(HUQuickControlContainerView *)self updateConstraintsIfNeeded];
  [(HUQuickControlContainerView *)self layoutIfNeeded];
  [(HUQuickControlContainerView *)self _controlHostCenterForPresentationProgress:a4];
  double v8 = v7;
  double v10 = v9;
  [(HUQuickControlContainerView *)self sourceRect];
  UIRectGetCenter();
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, v8 - v11, v10 - v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__HUQuickControlContainerView_sourceViewTransformForPresentationProgress___block_invoke;
  v21[3] = &unk_1E6389640;
  v21[4] = self;
  double v13 = __74__HUQuickControlContainerView_sourceViewTransformForPresentationProgress___block_invoke((uint64_t)v21);
  [(HUQuickControlContainerView *)self sourceRect];
  double v15 = v13 / v14;
  [(HUQuickControlContainerView *)self initialSourceViewScale];
  double v17 = v16;
  [(HUQuickControlContainerView *)self initialSourceViewScale];
  CGAffineTransform v20 = v22;
  return CGAffineTransformScale(retstr, &v20, v17 + (v15 - v18) * a4, v17 + (v15 - v18) * a4);
}

double __74__HUQuickControlContainerView_sourceViewTransformForPresentationProgress___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldShowControlView]
    && [*(id *)(a1 + 32) controlViewSupportsTransformTransition])
  {
    double v2 = [*(id *)(a1 + 32) activeControlView];
    [*(id *)(a1 + 32) _presentedControlHostSize];
    objc_msgSend(v2, "systemLayoutSizeFittingSize:");
    double v4 = v3;
  }
  else
  {
    [*(id *)(a1 + 32) sourceRect];
    double v4 = v5 + v5;
    [*(id *)(a1 + 32) sourceRect];
  }
  return v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 hasPrefix:@"fillColor"] & 1) != 0
    || ([v4 hasPrefix:@"compositingFilter"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlContainerView;
    BOOL v5 = [(HUQuickControlContainerView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_configureDisambiguationForActivities:(id)a3 disambiguationContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ([(HUQuickControlContainerView *)self _shouldShowDisambiguationButtonForUserActivities:a3 disambiguationContext:v8])
  {
    double v9 = [v8 titleText];
    uint64_t v10 = [v8 subtitleText];
    double v11 = (void *)v10;
    if (v9)
    {
      id v4 = [(HUQuickControlContainerView *)self disambiguationButtonPrimaryText];
      if (([v9 isEqualToAttributedString:v4] & 1) == 0)
      {

LABEL_15:
        id v4 = [MEMORY[0x1E4F1CA48] array];
        double v16 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithAttributedText:v9 style:5];
        [v4 addObject:v16];
        if (v11) {
          double v17 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithText:v11 style:2];
        }
        else {
          double v17 = 0;
        }
        objc_msgSend(v4, "na_safeAddObject:", v17);
        [(HUQuickControlContainerView *)self setDisambiguationButtonPrimaryText:v9];
        [(HUQuickControlContainerView *)self setDisambiguationButtonSecondaryText:v11];
        double v18 = [(HUQuickControlContainerView *)self disambiguationButton];
        double v19 = (void *)[v4 copy];
        [v18 setCenterContentItems:v19 animated:1];

        goto LABEL_19;
      }
      if (!v11)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else if (!v10)
    {
LABEL_20:
      CGAffineTransform v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double v21 = NSStringFromSelector(a2);
        CGAffineTransform v22 = [(HUQuickControlContainerView *)self disambiguationButton];
        uint64_t v23 = [v22 centerContentItems];
        int v29 = 138412546;
        id v30 = v21;
        __int16 v31 = 2112;
        v32 = v23;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@  self.disambiguationButton.CenterContentItems = %@", (uint8_t *)&v29, 0x16u);
      }
      double v24 = [(HUQuickControlContainerView *)self disambiguationButtonLeadingImageView];
      double v25 = [v8 leadingImage];
      [v24 setImage:v25];

      double v26 = HFLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        double v27 = NSStringFromSelector(a2);
        double v28 = [(HUQuickControlContainerView *)self disambiguationButtonLeadingImageView];
        int v29 = 138412546;
        id v30 = v27;
        __int16 v31 = 2112;
        v32 = v28;
        _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@  self.disambiguationButtonLeadingImageView = %@", (uint8_t *)&v29, 0x16u);
      }
      if ([(HUQuickControlContainerView *)self _isPhoneCallStatusUpdateTimerActive]&& ![(HUQuickControlContainerView *)self hasActivePhoneCall])
      {
        [(HUQuickControlContainerView *)self _invalidatePhoneCallStatusUpdateTimer];
      }
      else if (![(HUQuickControlContainerView *)self _isPhoneCallStatusUpdateTimerActive]&& [(HUQuickControlContainerView *)self hasActivePhoneCall])
      {
        [(HUQuickControlContainerView *)self _startPhoneCallStatusUpdateTimer];
      }

      goto LABEL_31;
    }
    double v14 = [(HUQuickControlContainerView *)self disambiguationButtonSecondaryText];
    char v15 = [v11 isEqualToString:v14];

    if (v9) {
    if (v15)
    }
      goto LABEL_20;
    goto LABEL_15;
  }
  double v12 = [(HUQuickControlContainerView *)self disambiguationButton];
  [v12 setCenterContentItems:MEMORY[0x1E4F1CBF0]];

  double v13 = [(HUQuickControlContainerView *)self disambiguationButtonLeadingImageView];
  [v13 setImage:0];

  if ([(HUQuickControlContainerView *)self _isPhoneCallStatusUpdateTimerActive]
    && ![(HUQuickControlContainerView *)self hasActivePhoneCall])
  {
    [(HUQuickControlContainerView *)self _invalidatePhoneCallStatusUpdateTimer];
  }
LABEL_31:
}

- (BOOL)_shouldShowDisambiguationButtonForUserActivities:(id)a3 disambiguationContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [v6 activity];
  if (v7) {
    BOOL v8 = [v6 interactionDirection] != 0;
  }
  else {
    BOOL v8 = 0;
  }

  double v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 activity];
    int v12 = 138412802;
    id v13 = v5;
    __int16 v14 = 2112;
    char v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 interactionDirection];
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Activities = %@, disambiguationContext.activitCGFloat y = [%@] interactionDirection = [%ld]", (uint8_t *)&v12, 0x20u);
  }
  return v8;
}

- (BOOL)_isDisambiguationButtonVisible
{
  double v2 = [(HUQuickControlContainerView *)self disambiguationButton];
  [v2 alpha];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)_updateDisambiguationButtonVisible:(BOOL)a3
{
  int v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = [(HUQuickControlContainerView *)self _isDisambiguationButtonVisible];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [(HUQuickControlContainerView *)self disambiguationButton];
    *(_DWORD *)buf = 138412802;
    double v19 = v7;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 1024;
    int v23 = v3;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Disambiguation button %@ current display mode %{BOOL}d, requested display mode %{BOOL}d", buf, 0x18u);
  }
  if (v5 != v3)
  {
    BOOL v8 = [(HUQuickControlContainerView *)self isExternallyAnimating];
    double v9 = HFLogForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        double v11 = [(HUQuickControlContainerView *)self disambiguationButton];
        *(_DWORD *)buf = 138412546;
        double v19 = v11;
        __int16 v20 = 1024;
        int v21 = v5;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Disambiguation button %@ display updates paused for external animation (current display mode %{BOOL}d)", buf, 0x12u);
      }
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Calling layoutIfNeeded", buf, 2u);
      }

      [(HUQuickControlContainerView *)self layoutIfNeeded];
      [(HUQuickControlContainerView *)self setIsDisambiguationButtonAnimating:1];
      objc_initWeak((id *)buf, self);
      int v12 = (void *)MEMORY[0x1E4F42FF0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke;
      v15[3] = &unk_1E6389668;
      objc_copyWeak(&v16, (id *)buf);
      char v17 = v3;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke_69;
      v13[3] = &unk_1E6385520;
      objc_copyWeak(&v14, (id *)buf);
      [v12 animateWithDuration:0 delay:v15 usingSpringWithDamping:v13 initialSpringVelocity:0.75 options:0.0 animations:0.73333 completion:0.0];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 40))
  {
    [WeakRetained _disambiguationButtonPreferredHeight];
    double v5 = v4 + 12.0;
  }
  else
  {
    double v5 = 0.0;
  }
  id v6 = [v3 controlHostViewTopConstraintToView];
  [v6 setConstant:v5];

  if (*(unsigned char *)(a1 + 40))
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v14 = *MEMORY[0x1E4F1DAB8];
    long long v15 = v7;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else if (v3)
  {
    [v3 _disambiguationButtonHiddenTransform];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  BOOL v8 = [v3 disambiguationButton];
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  [v8 setTransform:v13];

  if (*(unsigned char *)(a1 + 40)) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  BOOL v10 = [v3 disambiguationButton];
  [v10 setAlpha:v9];

  double v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Calling layoutIfNeeded inside animateWithDuration", v12, 2u);
  }

  [v3 layoutIfNeeded];
}

void __66__HUQuickControlContainerView__updateDisambiguationButtonVisible___block_invoke_69(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsDisambiguationButtonAnimating:0];
  double v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [WeakRetained disambiguationButton];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 1024;
    int v8 = [WeakRetained _isDisambiguationButtonVisible];
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Disambiguation button %@ updated to display mode %{BOOL}d", (uint8_t *)&v5, 0x12u);
  }
  double v4 = [WeakRetained delegate];
  [v4 contentDidUpdateInContainerView:WeakRetained];
}

- (CGAffineTransform)_disambiguationButtonHiddenTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, 0.6, 0.6);
  [(HUQuickControlContainerView *)self _disambiguationButtonPreferredHeight];
  long long v6 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v9.c = v6;
  *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGSize result = CGAffineTransformTranslate(&v10, &v9, 0.0, v5 * -0.6 * 0.5);
  long long v8 = *(_OWORD *)&v10.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v10.a;
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v10.tx;
  return result;
}

- (double)_disambiguationButtonPreferredHeight
{
  int v3 = [(HUQuickControlContainerView *)self disambiguationButton];
  double v4 = [(HUQuickControlContainerView *)self disambiguationButton];
  [v4 bounds];
  objc_msgSend(v3, "sizeThatFits:", v5, 1.79769313e308);
  double v7 = v6;

  double result = 50.0;
  if (v7 >= 50.0) {
    return v7;
  }
  return result;
}

- (void)_startPhoneCallStatusUpdateTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  [(HUQuickControlContainerView *)self setPhoneCallStatusUpdateTimer:v4];

  dispatch_time_t v5 = dispatch_time(0, 0);
  objc_initWeak(&location, self);
  double v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v15 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@ Starting Phone Call Status Update Timer", buf, 0xCu);
  }
  long long v8 = [(HUQuickControlContainerView *)self phoneCallStatusUpdateTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __63__HUQuickControlContainerView__startPhoneCallStatusUpdateTimer__block_invoke;
  handler[3] = &unk_1E6386BC0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  dispatch_source_set_event_handler(v8, handler);

  CGAffineTransform v9 = [(HUQuickControlContainerView *)self phoneCallStatusUpdateTimer];
  dispatch_source_set_timer(v9, v5, 0x3B9ACA00uLL, 0);

  CGAffineTransform v10 = [(HUQuickControlContainerView *)self phoneCallStatusUpdateTimer];
  dispatch_resume(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __63__HUQuickControlContainerView__startPhoneCallStatusUpdateTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412290;
    long long v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Now Updating Phone Call Status...", (uint8_t *)&v7, 0xCu);
  }
  dispatch_time_t v5 = [WeakRetained currentUserActivities];
  double v6 = [WeakRetained currentDisambiguationContext];
  [WeakRetained _configureDisambiguationForActivities:v5 disambiguationContext:v6];
}

- (void)_invalidatePhoneCallStatusUpdateTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    long long v8 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ Cancelling Phone Call Status Update Timer", (uint8_t *)&v7, 0xCu);
  }
  if ([(HUQuickControlContainerView *)self _isPhoneCallStatusUpdateTimerActive])
  {
    double v6 = [(HUQuickControlContainerView *)self phoneCallStatusUpdateTimer];
    dispatch_source_cancel(v6);
  }
  [(HUQuickControlContainerView *)self setPhoneCallStatusUpdateTimer:0];
}

- (BOOL)_isPhoneCallStatusUpdateTimerActive
{
  int v3 = [(HUQuickControlContainerView *)self phoneCallStatusUpdateTimer];
  if (v3)
  {
    dispatch_source_t v4 = [(HUQuickControlContainerView *)self phoneCallStatusUpdateTimer];
    BOOL v5 = dispatch_source_testcancel(v4) == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)didUpdateActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [(HUQuickControlContainerView *)self currentDisambiguationContext];
  id v13 = [v12 activity];
  long long v14 = [v11 activity];
  int v15 = [v13 isEqual:v14];

  uint64_t v16 = HFLogForCategory();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      uint64_t v18 = [v11 activity];
      int v23 = 138412290;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "NOT Updating summary view for PCActivitCGFloat y = [%@]", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    if (v17)
    {
      double v19 = NSStringFromSelector(a2);
      int v23 = 138413058;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@ didUpdateActivities = %@ forProxControlID = %@ disambiguationContext = %@", (uint8_t *)&v23, 0x2Au);
    }
    __int16 v20 = [v11 activity];
    if (v20)
    {
      int v21 = [v11 activity];
      -[HUQuickControlContainerView setHasActivePhoneCall:](self, "setHasActivePhoneCall:", [v21 pcactivityType] == 0);
    }
    else
    {
      [(HUQuickControlContainerView *)self setHasActivePhoneCall:0];
    }

    [(HUQuickControlContainerView *)self setCurrentDisambiguationContext:v11];
    [(HUQuickControlContainerView *)self setCurrentUserActivities:v9];
    [(HUQuickControlContainerView *)self _configureDisambiguationForActivities:v9 disambiguationContext:v11];
    [(HUQuickControlContainerView *)self _updateDisambiguationButtonVisible:[(HUQuickControlContainerView *)self _shouldShowDisambiguationButtonForUserActivities:v9 disambiguationContext:v11]];
    __int16 v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "Calling setNeedsLayout inside didUpdateActivities", (uint8_t *)&v23, 2u);
    }

    [(HUQuickControlContainerView *)self setNeedsLayout];
  }
}

- (double)controlTransitionProgress
{
  return self->_controlTransitionProgress;
}

- (double)chromeTransitionProgress
{
  return self->_chromeTransitionProgress;
}

- (double)initialSourceViewScale
{
  return self->_initialSourceViewScale;
}

- (BOOL)shouldShowActiveControl
{
  return self->_shouldShowActiveControl;
}

- (BOOL)shouldShowDetailsButton
{
  return self->_shouldShowDetailsButton;
}

- (unint64_t)edgesForExtendedLayout
{
  return self->_edgesForExtendedLayout;
}

- (UIView)activeControlView
{
  return self->_activeControlView;
}

- (UILayoutGuide)controlViewPreferredFrameLayoutGuide
{
  return self->_controlViewPreferredFrameLayoutGuide;
}

- (void)setControlViewPreferredFrameLayoutGuide:(id)a3
{
}

- (UILayoutGuide)standardViewportFromParentGuide
{
  return self->_standardViewportFromParentGuide;
}

- (BOOL)controlViewSupportsTransformTransition
{
  return self->_controlViewSupportsTransformTransition;
}

- (void)setControlViewSupportsTransformTransition:(BOOL)a3
{
  self->_controlViewSupportsTransformTransition = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (HUQuickControlSummaryView)summaryView
{
  return self->_summaryView;
}

- (void)setSummaryView:(id)a3
{
}

- (HUQuickControlContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlContainerViewDelegate *)WeakRetained;
}

- (HUControlHostView)controlHostView
{
  return self->_controlHostView;
}

- (void)setControlHostView:(id)a3
{
}

- (UILayoutGuide)controlViewLayoutGuide
{
  return self->_controlViewLayoutGuide;
}

- (void)setControlViewLayoutGuide:(id)a3
{
}

- (UILayoutGuide)cardViewLayoutGuide
{
  return self->_cardViewLayoutGuide;
}

- (void)setCardViewLayoutGuide:(id)a3
{
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
}

- (NSArray)maxHeightConstraints
{
  return self->_maxHeightConstraints;
}

- (void)setMaxHeightConstraints:(id)a3
{
}

- (NSLayoutConstraint)compactControlBottomConstraint
{
  return self->_compactControlBottomConstraint;
}

- (void)setCompactControlBottomConstraint:(id)a3
{
}

- (HUQuickControlAuxiliaryHostView)auxiliaryHostView
{
  return self->_auxiliaryHostView;
}

- (void)setAuxiliaryHostView:(id)a3
{
}

- (HUQuickControlButtonRowView)buttonRowView
{
  return self->_buttonRowView;
}

- (void)setButtonRowView:(id)a3
{
}

- (UIButton)detailsButton
{
  return self->_detailsButton;
}

- (void)setDetailsButton:(id)a3
{
}

- (UILayoutGuide)contentToAuxiliarySpacingLayoutGuide
{
  return self->_contentToAuxiliarySpacingLayoutGuide;
}

- (void)setContentToAuxiliarySpacingLayoutGuide:(id)a3
{
}

- (UILayoutGuide)topToSummarySpacingLayoutGuide
{
  return self->_topToSummarySpacingLayoutGuide;
}

- (void)setTopToSummarySpacingLayoutGuide:(id)a3
{
}

- (BOOL)isExternallyAnimating
{
  return self->_isExternallyAnimating;
}

- (PLPillControl)disambiguationButton
{
  return self->_disambiguationButton;
}

- (void)setDisambiguationButton:(id)a3
{
}

- (BOOL)isDisambiguationButtonAnimating
{
  return self->_isDisambiguationButtonAnimating;
}

- (void)setIsDisambiguationButtonAnimating:(BOOL)a3
{
  self->_isDisambiguationButtonAnimating = a3;
}

- (NSAttributedString)disambiguationButtonPrimaryText
{
  return self->_disambiguationButtonPrimaryText;
}

- (void)setDisambiguationButtonPrimaryText:(id)a3
{
}

- (NSString)disambiguationButtonSecondaryText
{
  return self->_disambiguationButtonSecondaryText;
}

- (void)setDisambiguationButtonSecondaryText:(id)a3
{
}

- (UIImageView)disambiguationButtonLeadingImageView
{
  return self->_disambiguationButtonLeadingImageView;
}

- (void)setDisambiguationButtonLeadingImageView:(id)a3
{
}

- (NSLayoutConstraint)disambiguationButtonHeightConstraint
{
  return self->_disambiguationButtonHeightConstraint;
}

- (void)setDisambiguationButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)disambiguationButtonTopConstraint
{
  return self->_disambiguationButtonTopConstraint;
}

- (void)setDisambiguationButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)controlHostViewTopConstraintToView
{
  return self->_controlHostViewTopConstraintToView;
}

- (void)setControlHostViewTopConstraintToView:(id)a3
{
}

- (PCDisambiguationContext)currentDisambiguationContext
{
  return self->_currentDisambiguationContext;
}

- (void)setCurrentDisambiguationContext:(id)a3
{
}

- (NSOrderedSet)currentUserActivities
{
  return self->_currentUserActivities;
}

- (void)setCurrentUserActivities:(id)a3
{
}

- (BOOL)hasActivePhoneCall
{
  return self->_hasActivePhoneCall;
}

- (void)setHasActivePhoneCall:(BOOL)a3
{
  self->_hasActivePhoneCall = a3;
}

- (OS_dispatch_source)phoneCallStatusUpdateTimer
{
  return self->_phoneCallStatusUpdateTimer;
}

- (void)setPhoneCallStatusUpdateTimer:(id)a3
{
}

- (PCActivity)lastActivity
{
  return self->_lastActivity;
}

- (void)setLastActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_phoneCallStatusUpdateTimer, 0);
  objc_storeStrong((id *)&self->_currentUserActivities, 0);
  objc_storeStrong((id *)&self->_currentDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_controlHostViewTopConstraintToView, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonLeadingImageView, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonSecondaryText, 0);
  objc_storeStrong((id *)&self->_disambiguationButtonPrimaryText, 0);
  objc_storeStrong((id *)&self->_disambiguationButton, 0);
  objc_storeStrong((id *)&self->_topToSummarySpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentToAuxiliarySpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_buttonRowView, 0);
  objc_storeStrong((id *)&self->_auxiliaryHostView, 0);
  objc_storeStrong((id *)&self->_compactControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_maxHeightConstraints, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_cardViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_controlViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_controlHostView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_standardViewportFromParentGuide, 0);
  objc_storeStrong((id *)&self->_controlViewPreferredFrameLayoutGuide, 0);

  objc_storeStrong((id *)&self->_activeControlView, 0);
}

@end