@interface FCUIFocusEnablementIndicatorSystemApertureElement
- (BOOL)_canShowWhileLocked;
- (BOOL)hasAlertBehavior;
- (BOOL)isActivityEnabled;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (FCActivityDescribing)activityDescription;
- (FCUIFocusEnablementIndicatorSystemApertureElement)initWithActivityDescription:(id)a3 enabled:(BOOL)a4;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (SAAlertHosting)alertHost;
- (SAUILayoutHosting)layoutHost;
- (UIView)leadingView;
- (UIView)minimalView;
- (UIView)trailingView;
- (id)_customLayoutFont;
- (id)_enablementText;
- (id)_primaryColor;
- (id)initForPickerWithActivityDescription:(id)a3 enabled:(BOOL)a4;
- (id)keyColor;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)_configureCustomViewsIfNecessary;
- (void)_layoutCustomActivityButtonInContainerView:(id)a3;
- (void)_layoutCustomTextViewsInContainerView:(id)a3;
- (void)_layoutHuggingObstructionForLabel:(id)a3 x:(double)a4 width:(double)a5 maxLabelHeight:(double)a6;
- (void)_updateOnOffTrailingLabelAnimated:(BOOL)a3;
- (void)_updateTrailingLabel;
- (void)_updateVisualStylingAnimated:(BOOL)a3;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3;
- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3;
- (void)setActivityEnabled:(BOOL)a3;
- (void)setAlertHost:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
@end

@implementation FCUIFocusEnablementIndicatorSystemApertureElement

- (FCUIFocusEnablementIndicatorSystemApertureElement)initWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCUIFocusEnablementIndicatorSystemApertureElement;
  v7 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)&v16 init];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:0];
    activityDescription = v7->_activityDescription;
    v7->_activityDescription = (FCActivityDescribing *)v8;

    v7->_activityEnabled = a4;
    v7->_preferredLayoutMode = 2;
    uint64_t v10 = [MEMORY[0x263F3F3A0] sharedActivityManager];
    activityManager = v7->_activityManager;
    v7->_activityManager = (FCActivityManager *)v10;

    v12 = [MEMORY[0x263F79768] sharedInstanceForEmbeddedDisplay];
    [v12 sensorRegionSize];
    v7->_sensorObstructionHeight = v13;
    [v12 minimumExpandedSize];
    v7->_expandedHeight = v14;
    v7->_isForPickerPresentation = 0;
  }
  return v7;
}

- (id)initForPickerWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  id result = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self initWithActivityDescription:a3 enabled:a4];
  if (result) {
    *((unsigned char *)result + 80) = 1;
  }
  return result;
}

- (void)setActivityEnabled:(BOOL)a3
{
  if (self->_activityEnabled != a3)
  {
    self->_activityEnabled = a3;
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _updateOnOffTrailingLabelAnimated:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];

    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _updateVisualStylingAnimated:1];
    uint64_t v5 = [(UILabel *)self->_activityTitleLabel superview];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v5 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _layoutCustomTextViewsInContainerView:v5];
      uint64_t v6 = v7;
    }
    MEMORY[0x270F9A758](v5, v6);
  }
}

- (NSString)elementIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F79798];
}

- (NSString)clientIdentifier
{
  return (NSString *)@"com.apple.SpringBoard.FocusUI";
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    if (self->_activityEnabled) {
      [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _primaryColor];
    }
    else {
    v4 = objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
    }
    uint64_t v5 = (void *)MEMORY[0x263F82818];
    uint64_t v6 = [MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81838]];
    uint64_t v7 = [v5 configurationWithFont:v6 scale:2];

    uint64_t v8 = (void *)MEMORY[0x263F82818];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v4, 0);
    uint64_t v10 = [v8 configurationWithPaletteColors:v9];
    v11 = [v7 configurationByApplyingConfiguration:v10];

    v12 = (void *)MEMORY[0x263F827E8];
    double v13 = [(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
    double v14 = [v12 _systemImageNamed:v13 withConfiguration:v11];

    v15 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v14];
    objc_super v16 = self->_leadingView;
    self->_leadingView = v15;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  v20[1] = *MEMORY[0x263EF8340];
  if (self->_isForPickerPresentation)
  {
    pickerTrailingView = self->_pickerTrailingView;
    if (!pickerTrailingView)
    {
      v4 = (void *)MEMORY[0x263F82818];
      uint64_t v5 = [MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81838]];
      uint64_t v6 = [v4 configurationWithFont:v5 scale:2];

      uint64_t v7 = (void *)MEMORY[0x263F82818];
      uint64_t v8 = [MEMORY[0x263F825C8] systemWhiteColor];
      v20[0] = v8;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      uint64_t v10 = [v7 configurationWithPaletteColors:v9];
      v11 = [v6 configurationByApplyingConfiguration:v10];

      v12 = [MEMORY[0x263F827E8] _systemImageNamed:@"list.bullet" withConfiguration:v11];
      double v13 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v12];
      double v14 = self->_pickerTrailingView;
      self->_pickerTrailingView = v13;

      pickerTrailingView = self->_pickerTrailingView;
    }
    v15 = pickerTrailingView;
  }
  else
  {
    onOffTrailingTextProvider = self->_onOffTrailingTextProvider;
    if (!onOffTrailingTextProvider)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x263F79770]) initWithText:&stru_26D1B4698 style:4];
      [v17 setTextAlignment:4];
      [v17 setContentContainer:self];
      v18 = self->_onOffTrailingTextProvider;
      self->_onOffTrailingTextProvider = (SBUISystemApertureTextContentProvider *)v17;

      [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _updateOnOffTrailingLabelAnimated:0];
      onOffTrailingTextProvider = self->_onOffTrailingTextProvider;
    }
    v15 = [(SBUISystemApertureTextContentProvider *)onOffTrailingTextProvider providedView];
  }
  return (UIView *)v15;
}

- (UIView)minimalView
{
  if (self->_isForPickerPresentation) {
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self trailingView];
  }
  else {
  v2 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self leadingView];
  }
  return (UIView *)v2;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  CGFloat top = result.top;
  if (a3 == 3)
  {
    CGFloat trailing = a5.trailing;
    CGFloat leading = a5.leading;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "edgeOutsetsForSize:", 1.79769313e308, self->_expandedHeight);
    CGFloat bottom = v10;

    result.CGFloat leading = leading;
    result.CGFloat trailing = trailing;
  }
  else
  {
    CGFloat bottom = result.bottom;
  }
  double v12 = top;
  double v13 = bottom;
  result.CGFloat bottom = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  id v12 = a3;
  if (self->_layoutMode == 3)
  {
    v4 = [(UILabel *)self->_activityTitleLabel superview];

    if (v4)
    {
      [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _layoutCustomActivityButtonInContainerView:v12];
      [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _layoutCustomTextViewsInContainerView:v12];
    }
  }
  uint64_t v5 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self leadingView];
  uint64_t v6 = v5;
  if (self->_layoutMode == 3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  uint64_t v8 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self trailingView];
  v9 = v8;
  if (self->_layoutMode == 3) {
    double v10 = 0.0;
  }
  else {
    double v10 = 1.0;
  }
  [v8 setAlpha:v10];

  v11 = +[FCUIFocusEnablementIndicatorBannerPresentable accessibilityIdentifierForActivityDescription:self->_activityDescription];
  [v12 setAccessibilityIdentifier:v11];
}

- (id)keyColor
{
  if (self->_activityEnabled) {
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _primaryColor];
  }
  else {
  v2 = objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
  }
  return v2;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (self->_layoutMode == 3)
  {
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _configureCustomViewsIfNecessary];
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _updateVisualStylingAnimated:0];
    v9 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
    v17[3] = &unk_264542A78;
    id v18 = v7;
    v19 = self;
    [v9 performWithoutAnimation:v17];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v13[3] = &unk_264543138;
  objc_copyWeak(&v15, &location);
  id v10 = v7;
  id v14 = v10;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_3;
  v11[3] = &unk_264543160;
  objc_copyWeak(&v12, &location);
  [v8 animateAlongsideTransition:v13 completion:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 40) + 48)];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 40) + 56)];
  uint64_t result = [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 40) + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 24))
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "addSubview:");
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (*(void *)(v3 + 32))
  {
    v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "addSubview:");
  }
  return result;
}

void __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained layoutHostContainerViewDidLayoutSubviews:*(void *)(a1 + 32)];
}

uint64_t __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained layoutMode];
    uint64_t v2 = v5;
    if (WeakRetained <= 2)
    {
      [*(id *)(v5 + 48) removeFromSuperview];
      [*(id *)(v5 + 56) removeFromSuperview];
      [*(id *)(v5 + 40) removeFromSuperview];
      uint64_t v2 = v5;
      uint64_t v3 = *(void **)(v5 + 24);
      if (v3)
      {
        [v3 removeFromSuperview];
        uint64_t v2 = v5;
      }
      uint64_t WeakRetained = *(void *)(v2 + 32);
      if (WeakRetained)
      {
        uint64_t WeakRetained = [(id)WeakRetained removeFromSuperview];
        uint64_t v2 = v5;
      }
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v2);
}

- (void)_layoutCustomActivityButtonInContainerView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];
  [v4 bounds];
  double v7 = v6;

  if (v5 == 1) {
    double v8 = v7 + -56.0 + -14.0;
  }
  else {
    double v8 = 14.0;
  }
  [(FCUICAPackageView *)self->_activityIconPackageView setFrame:v8];
  -[UIImageView setFrame:](self->_activityIconImageView, "setFrame:", v8, 14.0, 56.0, 56.0);
  -[UIButton setFrame:](self->_activityIconButton, "setFrame:", v8, 14.0, 56.0, 56.0);
  activityIconButton = self->_activityIconButton;
  [(UIButton *)activityIconButton _setCornerRadius:28.0];
}

- (void)_layoutCustomTextViewsInContainerView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  id v10 = [v4 traitCollection];

  [v10 displayScale];
  v11 = [(UILabel *)self->_activityOnOffLabel font];
  [v11 lineHeight];
  UIFloorToScale();
  double v13 = v12;

  double v14 = v9 - self->_sensorObstructionHeight + -12.0;
  -[UILabel sizeThatFits:](self->_activityOnOffLabel, "sizeThatFits:", v7 + -12.0 - v13 + -84.0, v14);
  BSSizeCeilForScale();
  double v16 = v7 + -12.0 - v13 + -84.0 - v15;
  if (v16 <= 0.0) {
    double v17 = v7 + -12.0 - v13 + -84.0;
  }
  else {
    double v17 = v15;
  }
  if (v16 <= 0.0) {
    double v18 = 0.0;
  }
  else {
    double v18 = v7 + -12.0 - v13 + -84.0 - v15;
  }
  if (v5 == 1) {
    double v19 = v17 + v13 + 12.0;
  }
  else {
    double v19 = 84.0;
  }
  -[FCUIFocusEnablementIndicatorSystemApertureElement _layoutHuggingObstructionForLabel:x:width:maxLabelHeight:](self, "_layoutHuggingObstructionForLabel:x:width:maxLabelHeight:", self->_activityOnOffLabel);
  activityTitleLabel = self->_activityTitleLabel;
  [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _layoutHuggingObstructionForLabel:activityTitleLabel x:v19 width:v18 maxLabelHeight:v14];
}

- (void)_layoutHuggingObstructionForLabel:(id)a3 x:(double)a4 width:(double)a5 maxLabelHeight:(double)a6
{
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  id v11 = a3;
  objc_msgSend(v11, "setFrame:", a4, v9, a5, a6);
  id v10 = [v11 traitCollection];
  [v10 displayScale];

  [v11 _tightBoundingRectOfFirstLine];
  UICeilToScale();
  BSRectRoundForScale();
  objc_msgSend(v11, "setFrame:");
}

- (void)_updateVisualStylingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL activityEnabled = self->_activityEnabled;
  if (self->_activityEnabled)
  {
    id v22 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _primaryColor];
    uint64_t v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 2;
  }
  double v7 = (void *)MEMORY[0x263F82818];
  double v8 = [MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81838]];
  double v9 = [v7 configurationWithFont:v8 scale:2];

  id v10 = (void *)MEMORY[0x263F82818];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v22, 0);
  double v12 = [v10 configurationWithPaletteColors:v11];
  double v13 = [v9 configurationByApplyingConfiguration:v12];

  double v14 = (void *)MEMORY[0x263F827E8];
  double v15 = [(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
  double v16 = [v14 _systemImageNamed:v15 withConfiguration:v13];

  [(UIView *)self->_leadingView setImage:v16];
  double v17 = kFCUIPackageViewStateOn;
  if (activityEnabled)
  {
    BOOL v18 = v3;
  }
  else
  {
    double v17 = &kFCUIPackageViewStateOff;
    BOOL v18 = 0;
  }
  [(FCUICAPackageView *)self->_activityIconPackageView setState:*v17 animated:v18];
  double v19 = [(FCUICAPackageView *)self->_activityIconPackageView superview];
  [v19 setOverrideUserInterfaceStyle:v6];

  [(UIImageView *)self->_activityIconImageView setTintColor:v22];
  if (activityEnabled)
  {
    v20 = [MEMORY[0x263F825C8] whiteColor];
  }
  else
  {
    v21 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _primaryColor];
    v20 = [v21 colorWithAlphaComponent:0.25];
  }
  [(UIButton *)self->_activityIconButton setBackgroundColor:v20];
  [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _updateTrailingLabel];
}

- (void)_updateTrailingLabel
{
  if (self->_activityEnabled) {
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _primaryColor];
  }
  else {
    objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  activityOnOffLabel = self->_activityOnOffLabel;
  id v4 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _enablementText];
  [(UILabel *)activityOnOffLabel setText:v4];

  uint64_t v5 = self->_activityOnOffLabel;
  uint64_t v6 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _customLayoutFont];
  [(UILabel *)v5 setFont:v6];

  [(UILabel *)self->_activityOnOffLabel setTextColor:v7];
}

- (void)_updateOnOffTrailingLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBUISystemApertureTextContentProvider *)self->_onOffTrailingTextProvider providedView];
  int v6 = [v5 _shouldReverseLayoutDirection];

  if (self->_activityEnabled) {
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _primaryColor];
  }
  else {
    objc_msgSend(MEMORY[0x263F825C8], "sbui_inactiveColor");
  }
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = NSString;
  uint64_t v8 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _enablementText];
  double v9 = (void *)v8;
  id v10 = &stru_26D1B4698;
  if (v6) {
    id v11 = @" ";
  }
  else {
    id v11 = &stru_26D1B4698;
  }
  if (!v6) {
    id v10 = @" ";
  }
  double v12 = [v7 stringWithFormat:@"%@%@%@", v8, v11, v10];

  onOffTrailingTextProvider = self->_onOffTrailingTextProvider;
  if (v3)
  {
    [(SBUISystemApertureTextContentProvider *)onOffTrailingTextProvider swapInText:v12 textColor:v14];
  }
  else
  {
    [(SBUISystemApertureTextContentProvider *)onOffTrailingTextProvider setText:v12];
    [(SBUISystemApertureTextContentProvider *)self->_onOffTrailingTextProvider setContentColor:v14];
  }
}

- (void)_configureCustomViewsIfNecessary
{
  BOOL v3 = self->_activityDescription;
  if (!self->_activityTitleLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    activityTitleLabel = self->_activityTitleLabel;
    self->_activityTitleLabel = v4;

    int v6 = self->_activityTitleLabel;
    id v7 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v6 setTextColor:v7];

    uint64_t v8 = self->_activityTitleLabel;
    double v9 = [(FCActivityDescribing *)v3 activityDisplayName];
    [(UILabel *)v8 setText:v9];

    id v10 = self->_activityTitleLabel;
    id v11 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _customLayoutFont];
    [(UILabel *)v10 setFont:v11];
  }
  if (!self->_activityOnOffLabel)
  {
    double v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    activityOnOffLabel = self->_activityOnOffLabel;
    self->_activityOnOffLabel = v12;

    [(UILabel *)self->_activityOnOffLabel setTextAlignment:2];
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)self _updateTrailingLabel];
  }
  if (!self->_activityIconPackageView)
  {
    id v14 = +[FCUICAPackageView packageViewForActivity:v3];
    activityIconPackageView = self->_activityIconPackageView;
    self->_activityIconPackageView = v14;

    [(FCUICAPackageView *)self->_activityIconPackageView setUserInteractionEnabled:0];
    if (!self->_activityIconPackageView && !self->_activityIconImageView)
    {
      double v16 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      activityIconImageView = self->_activityIconImageView;
      self->_activityIconImageView = v16;

      [(UIImageView *)self->_activityIconImageView setContentMode:4];
      [(UIImageView *)self->_activityIconImageView setUserInteractionEnabled:0];
      BOOL v18 = [MEMORY[0x263F82818] configurationWithPointSize:24.0];
      double v19 = (void *)MEMORY[0x263F827E8];
      v20 = [(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
      v21 = [v19 _systemImageNamed:v20 withConfiguration:v18];

      [(UIImageView *)self->_activityIconImageView setImage:v21];
    }
  }
  if (!self->_activityIconButton)
  {
    objc_initWeak(&location, self);
    id v22 = (void *)MEMORY[0x263F823D0];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke;
    v26[3] = &unk_264543188;
    objc_copyWeak(&v28, &location);
    v27 = v3;
    v23 = [v22 actionWithHandler:v26];
    v24 = (UIButton *)objc_alloc_init(MEMORY[0x263F79750]);
    activityIconButton = self->_activityIconButton;
    self->_activityIconButton = v24;

    [(UIButton *)self->_activityIconButton addAction:v23 forControlEvents:64];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)FCUILogSelection;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke_cold_1(v4, v3);
  }
  uint64_t WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained[96] == 0;
    uint64_t v8 = (void *)*((void *)WeakRetained + 2);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = NSString;
    id v11 = [v3 sender];
    double v12 = [v10 stringWithFormat:@"System aperture activity control tapped: %@", v11];
    [v8 setActivity:v9 active:v7 reason:v12];

    *((void *)v6 + 16) = 2;
    id v13 = objc_loadWeakRetained((id *)v6 + 17);
    [v13 preferredLayoutModeDidInvalidateForLayoutSpecifier:v6];
  }
}

- (id)_enablementText
{
  BOOL activityEnabled = self->_activityEnabled;
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (activityEnabled) {
    uint64_t v5 = @"FLANKING_BANNER_ON";
  }
  else {
    uint64_t v5 = @"FLANKING_BANNER_OFF";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_26D1B4698 table:0];

  return v6;
}

- (id)_customLayoutFont
{
  uint64_t v2 = (void *)MEMORY[0x263F82DA0];
  id v3 = SBUISystemApertureDefaultContentSizeCategory();
  id v4 = [v2 traitCollectionWithPreferredContentSizeCategory:v3];

  uint64_t v5 = objc_msgSend(MEMORY[0x263F81708], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 0, v4);

  return v5;
}

- (id)_primaryColor
{
  return (id)objc_msgSend(MEMORY[0x263F825C8], "fcui_colorForActivity:", self->_activityDescription);
}

- (SAAlertHosting)alertHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
  return (SAAlertHosting *)WeakRetained;
}

- (void)setAlertHost:(id)a3
{
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (FCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (BOOL)isActivityEnabled
{
  return self->_activityEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_alertHost);
  objc_storeStrong((id *)&self->_pickerTrailingView, 0);
  objc_storeStrong((id *)&self->_activityOnOffLabel, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIconButton, 0);
  objc_storeStrong((id *)&self->_activityIconPackageView, 0);
  objc_storeStrong((id *)&self->_activityIconImageView, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_onOffTrailingTextProvider, 0);
}

void __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 sender];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_21FEDE000, v3, OS_LOG_TYPE_DEBUG, "System aperture activity control tapped: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end