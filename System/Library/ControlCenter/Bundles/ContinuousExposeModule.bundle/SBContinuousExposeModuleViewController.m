@interface SBContinuousExposeModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isScreenJ520OrWider;
- (BOOL)_shouldShowToggleSelected;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (CCUIContentModuleContext)contentModuleContext;
- (CGSize)_stageManagerViewSize;
- (SBContinuousExposeModuleViewController)initWithContinuousExposeController:(id)a3;
- (double)_aggregateModuleHeight;
- (double)_contentHeight;
- (double)_footerHeight;
- (double)_minimumContentHeight;
- (double)_separatorHeight;
- (double)_stageManagerViewScale;
- (double)_titleHeight;
- (double)_titleHeightForWidth:(double)a3;
- (double)_titleWidthForContainerWidth:(double)a3;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (id)_assetPackageDescription;
- (id)_configurationStatus;
- (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4;
- (id)_titleFont;
- (void)_checkboxButtonTapped:(id)a3;
- (void)_contentSizeCategoryDidChange;
- (void)_fadeViewsForExpandedState:(BOOL)a3;
- (void)_footerButtonTapped;
- (void)_layoutCheckboxButtons;
- (void)_layoutContentViewForSize:(CGSize)a3;
- (void)_layoutFooterButtonForSize:(CGSize)a3;
- (void)_layoutFooterSeparatorForSize:(CGSize)a3;
- (void)_layoutGlyphViewForSize:(CGSize)a3;
- (void)_layoutStageManagerView;
- (void)_layoutTitleLabelForSize:(CGSize)a3;
- (void)_layoutTransformViewForSize:(CGSize)a3;
- (void)_layoutViewSubviews;
- (void)_refreshState;
- (void)_setRootViewClipsToBounds:(BOOL)a3;
- (void)_setTitle:(id)a3;
- (void)_setTransformViewClipsToBounds:(BOOL)a3;
- (void)_setView:(id)a3 clipsToBounds:(BOOL)a4;
- (void)_setupStageManagerView;
- (void)_setupTitleLabel;
- (void)_toggleSelected;
- (void)_updateStageManagerView;
- (void)_updateTitle;
- (void)_updateTitleFont;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation SBContinuousExposeModuleViewController

- (SBContinuousExposeModuleViewController)initWithContinuousExposeController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeModuleViewController;
  v6 = [(SBContinuousExposeModuleViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_continuousExposeController, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)SBContinuousExposeModuleViewController;
  [(SBContinuousExposeModuleViewController *)&v41 viewDidLoad];
  [(SBContinuousExposeModuleViewController *)self _refreshState];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CONTROL_CENTER_CONTINUOUS_EXPOSE_TITLE" value:&stru_C400 table:0];
  [(SBContinuousExposeModuleViewController *)self setTitle:v4];

  id v5 = [(SBContinuousExposeModuleViewController *)self view];
  id v6 = objc_alloc((Class)UIView);
  [v5 bounds];
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  transformView = self->_transformView;
  self->_transformView = v7;

  [v5 addSubview:self->_transformView];
  id v9 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = (UILabel *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  [(UIView *)self->_transformView addSubview:self->_titleLabel];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v15 = (UIView *)objc_alloc_init((Class)UIView);
  footerSeparatorView = self->_footerSeparatorView;
  self->_footerSeparatorView = v15;

  [(UIView *)self->_transformView addSubview:self->_footerSeparatorView];
  v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v17;

  [(UIView *)self->_transformView insertSubview:self->_contentView belowSubview:self->_footerSeparatorView];
  v19 = (CCUICAPackageView *)objc_alloc_init((Class)CCUICAPackageView);
  stageManagerView = self->_stageManagerView;
  self->_stageManagerView = v19;

  v21 = self->_stageManagerView;
  v22 = [(SBContinuousExposeModuleViewController *)self _assetPackageDescription];
  [(CCUICAPackageView *)v21 setPackageDescription:v22];

  [(UIView *)self->_contentView addSubview:self->_stageManagerView];
  v23 = -[SBContinuousExposeModuleCheckboxButton initWithSize:]([SBContinuousExposeModuleCheckboxButton alloc], "initWithSize:", 44.0, 44.0);
  showStripButton = self->_showStripButton;
  self->_showStripButton = &v23->super;

  v25 = self->_showStripButton;
  v26 = +[NSBundle bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"CONTROL_CENTER_AX_LABEL_CONTINUOUS_EXPOSE_SHOW_STRIP" value:&stru_C400 table:0];
  [(UIButton *)v25 setAccessibilityLabel:v27];

  [(UIButton *)self->_showStripButton addTarget:self action:"_checkboxButtonTapped:" forControlEvents:64];
  [(UIView *)self->_contentView addSubview:self->_showStripButton];
  v28 = -[SBContinuousExposeModuleCheckboxButton initWithSize:]([SBContinuousExposeModuleCheckboxButton alloc], "initWithSize:", 44.0, 44.0);
  showDockButton = self->_showDockButton;
  self->_showDockButton = &v28->super;

  v30 = self->_showDockButton;
  v31 = +[NSBundle bundleForClass:objc_opt_class()];
  v32 = [v31 localizedStringForKey:@"CONTROL_CENTER_AX_LABEL_CONTINUOUS_EXPOSE_SHOW_DOCK" value:&stru_C400 table:0];
  [(UIButton *)v30 setAccessibilityLabel:v32];

  [(UIButton *)self->_showDockButton addTarget:self action:"_checkboxButtonTapped:" forControlEvents:64];
  [(UIView *)self->_contentView addSubview:self->_showDockButton];
  v33 = objc_alloc_init(SBContinuousExposeModuleFooterButtonView);
  footerButtonView = self->_footerButtonView;
  self->_footerButtonView = v33;

  v35 = self->_footerButtonView;
  [(SBContinuousExposeModuleViewController *)self preferredExpandedContentWidth];
  [(SBContinuousExposeModuleFooterButtonView *)v35 setPreferredMaxLayoutWidth:"setPreferredMaxLayoutWidth:"];
  v36 = self->_footerButtonView;
  v37 = +[NSBundle bundleForClass:objc_opt_class()];
  v38 = [v37 localizedStringForKey:@"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_TURN_OFF" value:&stru_C400 table:0];
  [(SBContinuousExposeModuleFooterButtonView *)v36 setTitle:v38];

  [(SBContinuousExposeModuleFooterButtonView *)self->_footerButtonView addTarget:self action:"_footerButtonTapped" forControlEvents:64];
  [(UIView *)self->_transformView addSubview:self->_footerButtonView];
  [(SBContinuousExposeModuleViewController *)self _contentSizeCategoryDidChange];
  [(SBContinuousExposeModuleViewController *)self _fadeViewsForExpandedState:[(SBContinuousExposeModuleViewController *)self isExpanded]];
  v39 = [(SBContinuousExposeModuleViewController *)self buttonView];
  v40 = [(SBContinuousExposeModuleViewController *)self title];
  [v39 setAccessibilityLabel:v40];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeModuleViewController;
  [(SBContinuousExposeModuleViewController *)&v3 viewWillLayoutSubviews];
  [(SBContinuousExposeModuleViewController *)self _setupTitleLabel];
  [(SBContinuousExposeModuleViewController *)self _setupStageManagerView];
  [(SBContinuousExposeModuleViewController *)self _layoutViewSubviews];
}

- (void)_layoutViewSubviews
{
  objc_super v3 = [(SBContinuousExposeModuleViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[SBContinuousExposeModuleViewController _layoutGlyphViewForSize:](self, "_layoutGlyphViewForSize:", v5, v7);
  [(SBContinuousExposeModuleViewController *)self preferredExpandedContentWidth];
  double v9 = v8;
  [(SBContinuousExposeModuleViewController *)self preferredExpandedContentHeight];
  double v11 = v10;
  -[SBContinuousExposeModuleViewController _layoutTransformViewForSize:](self, "_layoutTransformViewForSize:", v9, v10);
  -[SBContinuousExposeModuleViewController _layoutTitleLabelForSize:](self, "_layoutTitleLabelForSize:", v9, v11);
  -[SBContinuousExposeModuleViewController _layoutContentViewForSize:](self, "_layoutContentViewForSize:", v9, v11);
  -[SBContinuousExposeModuleViewController _layoutFooterSeparatorForSize:](self, "_layoutFooterSeparatorForSize:", v9, v11);
  -[SBContinuousExposeModuleViewController _layoutFooterButtonForSize:](self, "_layoutFooterButtonForSize:", v9, v11);
  id v12 = [(SBContinuousExposeModuleViewController *)self isExpanded];

  [(SBContinuousExposeModuleViewController *)self _fadeViewsForExpandedState:v12];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeModuleViewController;
  id v7 = a4;
  -[SBContinuousExposeModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_656C;
  v8[3] = &unk_C240;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeModuleViewController;
  [(SBContinuousExposeModuleViewController *)&v8 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    double v6 = [(SBContinuousExposeModuleViewController *)self view];
    id v7 = [v6 visualStylingProviderForCategory:1];

    if (v7)
    {
      [v7 automaticallyUpdateView:self->_titleLabel withStyle:1];
      [v7 automaticallyUpdateView:self->_footerSeparatorView withStyle:5];
      [v7 automaticallyUpdateView:self->_showStripButton withStyle:0];
      [v7 automaticallyUpdateView:self->_showDockButton withStyle:0];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeModuleViewController;
  [(SBContinuousExposeModuleViewController *)&v4 viewWillAppear:a3];
  [(SBContinuousExposeModuleViewController *)self _refreshState];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeModuleViewController;
  id v4 = a3;
  [(SBContinuousExposeModuleViewController *)&v8 traitCollectionDidChange:v4];
  double v5 = [(SBContinuousExposeModuleViewController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(SBContinuousExposeModuleViewController *)self _contentSizeCategoryDidChange];
  }
}

- (double)preferredExpandedContentWidth
{
  _CCUIDefaultExpandedContentModuleWidth(self, a2);
  return result;
}

- (double)preferredExpandedContentHeight
{
  [(SBContinuousExposeModuleViewController *)self _aggregateModuleHeight];
  [(SBContinuousExposeModuleViewController *)self preferredExpandedContentWidth];
  objc_super v3 = [(SBContinuousExposeModuleViewController *)self view];
  UIRoundToViewScale();
  double v5 = v4;

  return v5;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeModuleViewController;
  -[SBContinuousExposeModuleViewController willTransitionToExpandedContentMode:](&v7, "willTransitionToExpandedContentMode:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_687C;
  v5[3] = &unk_C268;
  v5[4] = self;
  BOOL v6 = v3;
  +[UIView performWithoutAnimation:v5];
  [(SBContinuousExposeModuleViewController *)self _setRootViewClipsToBounds:v3];
  [(SBContinuousExposeModuleViewController *)self _setTransformViewClipsToBounds:0];
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBContinuousExposeModuleViewController;
  -[SBContinuousExposeModuleViewController didTransitionToExpandedContentMode:](&v5, "didTransitionToExpandedContentMode:");
  if (v3)
  {
    [(SBContinuousExposeModuleViewController *)self _setRootViewClipsToBounds:0];
    [(SBContinuousExposeModuleViewController *)self _setTransformViewClipsToBounds:1];
  }
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return [(SBContinuousExposeModuleController *)self->_continuousExposeController isContinuousExposeEnabled];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
}

- (void)_toggleSelected
{
  unsigned int v3 = [(SBContinuousExposeModuleViewController *)self isSelected];
  uint64_t v4 = v3 ^ 1;
  [(SBContinuousExposeModuleViewController *)self setSelected:v4];
  [(SBContinuousExposeModuleController *)self->_continuousExposeController setContinuousExposeEnabled:v4];
  BOOL v5 = v3 == 0;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  objc_super v7 = @"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_OFF";
  if (v5) {
    objc_super v7 = @"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_ON";
  }
  objc_super v8 = v7;
  objc_super v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v9 localizedStringForKey:v8 value:&stru_C400 table:0];

  double v10 = [(SBContinuousExposeModuleViewController *)self contentModuleContext];
  double v11 = +[CCUIStatusUpdate statusUpdateWithMessage:v12 type:v6];
  [v10 enqueueStatusUpdate:v11];
}

- (BOOL)_shouldShowToggleSelected
{
  return [(SBContinuousExposeModuleController *)self->_continuousExposeController isContinuousExposeEnabled];
}

- (void)_checkboxButtonTapped:(id)a3
{
  uint64_t v4 = (UIButton *)a3;
  uint64_t v5 = [(UIButton *)v4 isSelected] ^ 1;
  if (self->_showStripButton == v4)
  {
    [(SBContinuousExposeModuleController *)self->_continuousExposeController setHideStrip:v5];
  }
  else if (self->_showDockButton == v4)
  {
    [(SBContinuousExposeModuleController *)self->_continuousExposeController setHideDock:v5];
  }
  [(SBContinuousExposeModuleViewController *)self _updateStageManagerView];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6C84;
  v7[3] = &unk_C290;
  v7[4] = self;
  +[UIView animateWithDuration:v7 animations:0.3];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6C8C;
  v6[3] = &unk_C290;
  v6[4] = self;
  +[UIView _animateUsingSpringWithDuration:4 delay:v6 options:0 mass:0.661226 stiffness:0.0 damping:2.0 initialVelocity:350.0 animations:50.0 completion:0.0];
}

- (void)_footerButtonTapped
{
  unsigned int v3 = [(SBContinuousExposeModuleViewController *)self contentModuleContext];
  if (v3)
  {
    [(SBContinuousExposeModuleController *)self->_continuousExposeController setContinuousExposeEnabled:0];
    [v3 dismissModule];
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6D88;
    v5[3] = &unk_C2B8;
    v5[4] = self;
    id v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
  else
  {
    [(SBContinuousExposeModuleViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_updateTitle
{
  id v3 = [(SBContinuousExposeModuleViewController *)self _configurationStatus];
  [(SBContinuousExposeModuleViewController *)self _setTitle:v3];
}

- (void)_setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];
  titleLabel = self->_titleLabel;

  [(UILabel *)titleLabel pl_performCrossFadeIfNecessary];
}

- (id)_configurationStatus
{
  unsigned int v3 = [(SBContinuousExposeModuleController *)self->_continuousExposeController hideStrip];
  unsigned int v4 = [(SBContinuousExposeModuleController *)self->_continuousExposeController hideDock];
  int v5 = v4 ^ 1;
  if (((v3 ^ 1) & 1) != 0 || v5)
  {
    int v7 = v3 | v5;
    if (v3 ^ 1 | v4) {
      CFStringRef v8 = @"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_SHOW_ALL";
    }
    else {
      CFStringRef v8 = @"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_SHOW_DOCK";
    }
    if (v7 == 1) {
      CFStringRef v6 = v8;
    }
    else {
      CFStringRef v6 = @"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_SHOW_STRIP";
    }
  }
  else
  {
    CFStringRef v6 = @"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_SHOW_NONE";
  }
  objc_super v9 = +[NSBundle bundleForClass:objc_opt_class()];
  double v10 = [v9 localizedStringForKey:v6 value:&stru_C400 table:0];

  return v10;
}

- (void)_updateStageManagerView
{
  unsigned int v3 = [(SBContinuousExposeModuleController *)self->_continuousExposeController hideStrip];
  unsigned int v4 = [(SBContinuousExposeModuleController *)self->_continuousExposeController hideDock];
  int v5 = v4 ^ 1;
  if (((v3 ^ 1) & 1) != 0 || v5)
  {
    int v7 = v3 | v5;
    if (v3 ^ 1 | v4) {
      CFStringRef v8 = @"Show Strip, Show Dock";
    }
    else {
      CFStringRef v8 = @"Hide Strip, Show Dock";
    }
    if (v7 == 1) {
      CFStringRef v6 = v8;
    }
    else {
      CFStringRef v6 = @"Show Strip, Hide Dock";
    }
  }
  else
  {
    CFStringRef v6 = @"Hide Strip, Hide Dock";
  }
  stageManagerView = self->_stageManagerView;

  [(CCUICAPackageView *)stageManagerView setStateName:v6];
}

- (id)_assetPackageDescription
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = +[CCUICAPackageDescription descriptionForPackageNamed:@"StageManager" inBundle:v2];

  return v3;
}

- (void)_refreshState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_7158;
  v2[3] = &unk_C290;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_fadeViewsForExpandedState:(BOOL)a3
{
  transformView = self->_transformView;
  if (a3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [(UIView *)transformView setAlpha:v5];
  id v7 = [(SBContinuousExposeModuleViewController *)self buttonView];
  [v7 setAlpha:v6];
}

- (void)_layoutGlyphViewForSize:(CGSize)a3
{
  unsigned int v4 = [(SBContinuousExposeModuleViewController *)self view];
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  if ([(SBContinuousExposeModuleViewController *)self isExpanded])
  {
    [(UIView *)self->_contentView center];
    double v10 = v9;
    double v12 = v11;
    v13 = (char *)[UIApp userInterfaceLayoutDirection];
    double v14 = -30.0;
    if (v13 == (unsigned char *)&dword_0 + 1) {
      double v14 = 30.0;
    }
    double v6 = v10 + v14;
    double v8 = v12 + -40.0;
  }
  v15 = [(SBContinuousExposeModuleViewController *)self buttonView];
  objc_msgSend(v15, "setCenter:", v6, v8);

  if ([(SBContinuousExposeModuleViewController *)self isExpanded]) {
    double v16 = 6.0;
  }
  else {
    double v16 = 1.0;
  }
  v17 = [(SBContinuousExposeModuleViewController *)self buttonView];
  CGAffineTransformMakeScale(&v18, v16, v16);
  [v17 setTransform:&v18];
}

- (void)_layoutTransformViewForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SBContinuousExposeModuleViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if ([(SBContinuousExposeModuleViewController *)self isExpanded])
  {
    transformView = self->_transformView;
    long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v22 = v16;
    long long v23 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v17 = (CGAffineTransform *)&v21;
  }
  else
  {
    v25.origin.x = v8;
    v25.origin.double y = v10;
    v25.size.double width = v12;
    v25.size.double height = v14;
    CGFloat v18 = CGRectGetWidth(v25) / width;
    v26.origin.x = v8;
    v26.origin.double y = v10;
    v26.size.double width = v12;
    v26.size.double height = v14;
    CGFloat v19 = CGRectGetHeight(v26);
    v20 = self->_transformView;
    CGAffineTransformMakeScale(&v24, v18, v19 / height);
    v17 = &v24;
    transformView = v20;
  }
  -[UIView setTransform:](transformView, "setTransform:", v17, v21, v22, v23);
  -[UIView setFrame:](self->_transformView, "setFrame:", v8, v10, v12, v14);
}

- (void)_layoutTitleLabelForSize:(CGSize)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_74B4;
  v3[3] = &unk_C2E0;
  v3[4] = self;
  CGSize v4 = a3;
  +[UIView performWithoutAnimation:v3];
}

- (void)_layoutContentViewForSize:(CGSize)a3
{
  [(SBContinuousExposeModuleViewController *)self _titleHeight];
  [(SBContinuousExposeModuleViewController *)self _contentHeight];
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_contentView, "setFrame:");
  [(SBContinuousExposeModuleViewController *)self _layoutStageManagerView];

  [(SBContinuousExposeModuleViewController *)self _layoutCheckboxButtons];
}

- (void)_layoutStageManagerView
{
  [(UIView *)self->_contentView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CCUICAPackageView *)self->_stageManagerView bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v23.origin.x = v4;
  v23.origin.double y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  double Width = CGRectGetWidth(v23);
  v24.origin.x = v12;
  v24.origin.double y = v14;
  v24.size.double width = v16;
  v24.size.double height = v18;
  double v20 = (Width - CGRectGetWidth(v24)) * 0.5;
  stageManagerView = self->_stageManagerView;

  -[CCUICAPackageView setOrigin:](stageManagerView, "setOrigin:", v20, 0.0);
}

- (void)_layoutCheckboxButtons
{
  [(UIView *)self->_contentView frame];
  CGFloat rect = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(CCUICAPackageView *)self->_stageManagerView frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v18 = (char *)[UIApp userInterfaceLayoutDirection];
  double v19 = 6.0;
  if (v18 == (unsigned char *)&dword_0 + 1)
  {
    v33.origin.x = rect;
    v33.origin.double y = v5;
    v33.size.double width = v7;
    v33.size.double height = v9;
    double v19 = CGRectGetWidth(v33) + -6.0 + -44.0;
  }
  double v29 = v19;
  v34.origin.x = v11;
  v34.origin.double y = v13;
  v34.size.double width = v15;
  v34.size.double height = v17;
  CGFloat v30 = v13;
  double v20 = (CGRectGetMaxY(v34) + -44.0) * 0.5;
  unsigned int v21 = [(SBContinuousExposeModuleController *)self->_continuousExposeController hideDock];
  double v22 = -12.0;
  if (v21) {
    double v22 = 0.0;
  }
  -[UIButton setOrigin:](self->_showStripButton, "setOrigin:", v29, v20 + v22, *(void *)&v29);
  v35.origin.x = rect;
  v35.origin.double y = v5;
  v35.size.double width = v7;
  v35.size.double height = v9;
  double v23 = CGRectGetHeight(v35) + -6.0 + -44.0;
  v36.origin.double y = v30;
  v36.origin.x = v11;
  v36.size.double width = v15;
  v36.size.double height = v17;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.x = rect;
  v37.origin.double y = v5;
  v37.size.double width = v7;
  v37.size.double height = v9;
  double v25 = (MaxY + CGRectGetHeight(v37) + -44.0) * 0.5;
  if (v23 >= v25) {
    double v26 = v25;
  }
  else {
    double v26 = v23;
  }
  showDockButton = self->_showDockButton;
  v38.origin.x = rect;
  v38.origin.double y = v5;
  v38.size.double width = v7;
  v38.size.double height = v9;
  double v28 = (CGRectGetWidth(v38) + -44.0) * 0.5;

  -[UIButton setOrigin:](showDockButton, "setOrigin:", v28, v26);
}

- (void)_layoutFooterButtonForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBContinuousExposeModuleFooterButtonView *)self->_footerButtonView intrinsicContentSize];
  double v7 = v6;
  footerButtonView = self->_footerButtonView;
  double v9 = height - v6;

  -[SBContinuousExposeModuleFooterButtonView setFrame:](footerButtonView, "setFrame:", 0.0, v9, width, v7);
}

- (void)_layoutFooterSeparatorForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBContinuousExposeModuleViewController *)self _footerHeight];
  double v7 = height - v6;
  [(SBContinuousExposeModuleViewController *)self _separatorHeight];
  footerSeparatorView = self->_footerSeparatorView;

  -[UIView setFrame:](footerSeparatorView, "setFrame:", 0.0, v7, width, v8);
}

- (double)_titleWidthForContainerWidth:(double)a3
{
  return a3 + -20.0;
}

- (void)_setView:(id)a3 clipsToBounds:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7A04;
  v6[3] = &unk_C268;
  id v7 = a3;
  BOOL v8 = a4;
  id v5 = v7;
  +[UIView performWithoutAnimation:v6];
}

- (void)_setRootViewClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBContinuousExposeModuleViewController *)self view];
  [(SBContinuousExposeModuleViewController *)self _setView:v5 clipsToBounds:v3];
}

- (void)_setTransformViewClipsToBounds:(BOOL)a3
{
}

- (void)_setupTitleLabel
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_7B78;
  v2[3] = &unk_C290;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_setupStageManagerView
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_7C74;
  v2[3] = &unk_C290;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (double)_separatorHeight
{
  v2 = [(SBContinuousExposeModuleViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];
  double v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    id v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v4 = v6;
  }
  return 1.0 / v4;
}

- (id)_titleFont
{
  v2 = [(SBContinuousExposeModuleViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];

  double v4 = +[UIFont bsui_preferredFontForTextStyle:UIFontTextStyleFootnote hiFontStyle:1 contentSizeCategory:v3];

  return v4;
}

- (id)_preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SBContinuousExposeModuleViewController *)self traitCollection];
  BOOL v8 = [v7 preferredContentSizeCategory];

  double v9 = +[UIFont bsui_preferredFontForTextStyle:v6 hiFontStyle:a4 contentSizeCategory:v8];

  return v9;
}

- (void)_contentSizeCategoryDidChange
{
}

- (void)_updateTitleFont
{
  titleLabel = self->_titleLabel;
  double v4 = [(SBContinuousExposeModuleViewController *)self _titleFont];
  [(UILabel *)titleLabel setFont:v4];

  id v5 = [(SBContinuousExposeModuleViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (double)_titleHeight
{
  BOOL v3 = [(SBContinuousExposeModuleViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v8);

  [(SBContinuousExposeModuleViewController *)self preferredExpandedContentWidth];
  if (Width >= v5) {
    double v5 = Width;
  }

  [(SBContinuousExposeModuleViewController *)self _titleHeightForWidth:v5];
  return result;
}

- (double)_titleHeightForWidth:(double)a3
{
  [(UILabel *)self->_titleLabel frame];
  if (CGRectIsEmpty(v16)) {
    [(SBContinuousExposeModuleViewController *)self _setupTitleLabel];
  }
  titleLabel = self->_titleLabel;
  [(SBContinuousExposeModuleViewController *)self _titleWidthForContainerWidth:a3];
  -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:");
  double v7 = v6;
  [(UILabel *)self->_titleLabel _firstLineBaselineOffsetFromBoundsTop];
  double v9 = v7 - v8;
  [(UILabel *)self->_titleLabel _baselineOffsetFromBottom];
  double v11 = v9 - v10;
  double v12 = [(UILabel *)self->_titleLabel font];
  [v12 _scaledValueForValue:62.0];
  double v14 = v11 + v13;

  return v14;
}

- (double)_contentHeight
{
  [(SBContinuousExposeModuleViewController *)self preferredExpandedContentWidth];
  double v4 = v3;
  [(SBContinuousExposeModuleViewController *)self _titleHeight];
  double v6 = v4 - v5;
  [(SBContinuousExposeModuleViewController *)self _footerHeight];
  double v8 = v6 - v7;
  [(SBContinuousExposeModuleViewController *)self _minimumContentHeight];
  if (v8 >= result) {
    return v8;
  }
  return result;
}

- (double)_minimumContentHeight
{
  [(SBContinuousExposeModuleViewController *)self _stageManagerViewSize];
  return v2 + 44.0 + 6.0;
}

- (CGSize)_stageManagerViewSize
{
  [(SBContinuousExposeModuleViewController *)self _stageManagerViewScale];
  CGAffineTransformMakeScale(&v5, v2, v2);
  float64x2_t v3 = vmlaq_f64(vmulq_f64(*(float64x2_t *)&v5.c, (float64x2_t)vdupq_n_s64(0x4063800000000000uLL)), (float64x2_t)vdupq_n_s64(0x406C000000000000uLL), *(float64x2_t *)&v5.a);
  double v4 = v3.f64[1];
  result.double width = v3.f64[0];
  result.double height = v4;
  return result;
}

- (double)_stageManagerViewScale
{
  unsigned int v2 = [(SBContinuousExposeModuleViewController *)self _isScreenJ520OrWider];
  double result = 0.85;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (BOOL)_isScreenJ520OrWider
{
  unsigned int v2 = +[UIScreen mainScreen];
  [v2 _referenceBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v12.origin.x = v4;
  v12.origin.double y = v6;
  v12.size.double width = v8;
  v12.size.double height = v10;
  return CGRectGetWidth(v12) >= 1024.0;
}

- (double)_footerHeight
{
  [(SBContinuousExposeModuleFooterButtonView *)self->_footerButtonView intrinsicContentSize];
  double v4 = v3;
  char IsZero = BSFloatIsZero();
  double result = 0.0;
  if ((IsZero & 1) == 0)
  {
    [(SBContinuousExposeModuleViewController *)self _separatorHeight];
    return v4 + v7;
  }
  return result;
}

- (double)_aggregateModuleHeight
{
  [(SBContinuousExposeModuleViewController *)self _titleHeight];
  double v4 = v3;
  [(SBContinuousExposeModuleViewController *)self _contentHeight];
  double v6 = v4 + v5;
  [(SBContinuousExposeModuleViewController *)self _footerHeight];
  return v6 + v7;
}

- (CCUIContentModuleContext)contentModuleContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentModuleContext);

  return (CCUIContentModuleContext *)WeakRetained;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentModuleContext);
  objc_storeStrong((id *)&self->_footerButtonView, 0);
  objc_storeStrong((id *)&self->_footerSeparatorView, 0);
  objc_storeStrong((id *)&self->_showDockButton, 0);
  objc_storeStrong((id *)&self->_showStripButton, 0);
  objc_storeStrong((id *)&self->_stageManagerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_continuousExposeController, 0);
}

@end