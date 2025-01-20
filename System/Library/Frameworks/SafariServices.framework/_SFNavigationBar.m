@interface _SFNavigationBar
+ (double)estimatedDefaultHeightForStatusBarHeight:(double)a3;
+ (double)estimatedMinimumHeightForStatusBarHeight:(double)a3;
+ (double)separatorHeight;
+ (int64_t)_metricsCategory;
+ (void)initialize;
- (BOOL)areControlsHidden;
- (BOOL)canBecomeFirstResponder;
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)containsBarItem:(int64_t)a3;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)hasToolbar;
- (BOOL)isBackdropGroupDisabled;
- (BOOL)isExpanded;
- (BOOL)isSendingBarMetricsChangeNotification;
- (BOOL)navigationBarURLButton:(id)a3 canWriteAtLocation:(CGPoint)a4;
- (BOOL)navigationBarURLButton:(id)a3 shouldAllowLongPressAtPoint:(CGPoint)a4;
- (BOOL)navigationBarURLButton:(id)a3 shouldShowMenuForGestureWithRecognizer:(id)a4;
- (BOOL)navigationBarURLButtonIsUsingNarrowLayout:(id)a3;
- (BOOL)navigationBarURLButtonShouldCopy:(id)a3;
- (BOOL)navigationBarURLButtonShouldPaste:(id)a3;
- (BOOL)suppressesBlur;
- (BOOL)textFieldIsEditableForNavigationBarURLButton:(id)a3;
- (BOOL)unifiedFieldShowsProgressView;
- (BOOL)usesFaintSeparator;
- (BOOL)usesNarrowLayout;
- (CGRect)URLOutlineFrameInNavigationBarSpace;
- (CGRect)urlOutlineFrameRelativeToView:(id)a3;
- (CGSize)dismissButtonSize;
- (NSArray)popoverPassthroughViews;
- (NSString)backdropGroupName;
- (SFLockdownStatusBar)lockdownStatusBar;
- (SFNavigationBarItem)item;
- (UIBlurEffect)backdropEffect;
- (UITextField)textField;
- (UIView)inputAccessoryView;
- (_SFBarTheme)theme;
- (_SFNavigationBar)initWithFrame:(CGRect)a3;
- (_SFNavigationBar)initWithFrame:(CGRect)a3 inputMode:(unint64_t)a4;
- (_SFNavigationBarDelegate)delegate;
- (_SFNavigationBarTheme)effectiveTheme;
- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo;
- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo;
- (_SFPopoverSourceInfo)reloadButtonPopoverSourceInfo;
- (char)_navigationBarTrailingButtonWithType:(char *)a1;
- (double)_auxiliaryBarSquishedVerticalOffsetForSquishTransform:(uint64_t)a1;
- (double)_controlsAlpha;
- (double)_defaultHeightExcludingAuxiliaryBar;
- (double)_layoutBounds;
- (double)_privateBrowsingLabelRevealPercent;
- (double)_textFieldTopMargin;
- (double)_urlOutlineOriginY;
- (double)contentUnderStatusBarHeight;
- (double)defaultHeight;
- (double)maximumHeight;
- (double)minimumBackdropHeight;
- (double)minimumHeight;
- (double)placeholderHorizontalInset;
- (double)visualHeight;
- (id)_attributedStringSecurityAnnotation;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_dimmingButtonWithAction:(uint64_t *)val;
- (id)_editingLabelFont;
- (id)_expandedURLLabelParagraphStyle;
- (id)_formatToggleButtonImage;
- (id)_hitTestCandidateViews;
- (id)_mediaStateMuteButtonColor;
- (id)_notSecureAnnotationColor;
- (id)_placeholderText;
- (id)_searchIndicatorColorForSquishTransformFactor:(id *)a1;
- (id)_timingFunctionForAnimation;
- (id)_toolbarForBarItem:(id *)a1;
- (id)_updateToolbarAndCancelButtonAlpha;
- (id)_viewForAccessoryButtonType:(uint64_t)a1;
- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)newTextField;
- (id)popoverSourceInfoForBarItem:(int64_t)a3;
- (id)textForNavigationBarURLButton:(id)a3;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (uint64_t)_adjustLabelRectForLeadingButtonWithDelay:(uint64_t)result;
- (uint64_t)_setHidePlaceholderURLItemsForPencilInput:(uint64_t)result;
- (uint64_t)_shouldUpdateBackdropStyleForTransitionFromItem:(void *)a3 toItem:;
- (uint64_t)_showsPrivateAnnotation;
- (uint64_t)_updateAccessoryButtonsVisibility;
- (uint64_t)_updateButtonMetrics;
- (uint64_t)_updateControlTints;
- (uint64_t)_updateLockViewIfNeeded;
- (uint64_t)_updateProgressViewCornerRadius;
- (uint64_t)_updateSeparatorAlpha;
- (uint64_t)_updateShowsSearchIndicator;
- (uint64_t)_updateTextFieldFrame;
- (uint64_t)_updateTextMetrics;
- (uint64_t)_updateURLOutlineCornerRadius;
- (void)_URLLabelFont;
- (void)_URLTapped:(id)a3;
- (void)_barMetricTraitsDidChange;
- (void)_barMetricsDidChange;
- (void)_cancelButtonTapped:(id)a3;
- (void)_compressedBarTapped;
- (void)_configureNavigationBarTrailingButtonTintedImages;
- (void)_copyNavigationBarURLToPasteboard;
- (void)_customButtonHorizontalPadding;
- (void)_didUpdateEffectiveTheme;
- (void)_dismissButtonTapped:(id)a3;
- (void)_formatToggleButtonTapped:(id)a3;
- (void)_hideAvailabilityLabelAnimated:(uint64_t)a1;
- (void)_lockImageTintColorForSquishTransformFactor:(void *)a1;
- (void)_mediaStateMuteButtonTapped:(id)a3;
- (void)_notSecureGrayColor;
- (void)_notSecureWarningColor;
- (void)_reloadButtonPressed;
- (void)_setUpFormatToggleButtonIfNeeded;
- (void)_stopButtonPressed;
- (void)_transitionFromView:(void *)a3 toView:(int)a4 animated:;
- (void)_updateAccessoryButtonsAlpha;
- (void)_updateAccessoryButtonsArrangement;
- (void)_updateActiveURLLabelAccessory;
- (void)_updateAvailabilityAndPageMenuButtonAnimated:(uint64_t)a1;
- (void)_updateBackdropFrame;
- (void)_updateEffectiveTheme;
- (void)_updateFakeViews;
- (void)_updateFonts;
- (void)_updateFormatButtonAccessories;
- (void)_updateFormatButtonSelected;
- (void)_updateMediaStateMuteButton;
- (void)_updateNavigationBarTrailingButtonType;
- (void)_updatePlaceholderText;
- (void)_updateProgressView;
- (void)_updateProgressViewFillColor;
- (void)_updateSearchIndicator;
- (void)_updateSecurityWarningsVisibility;
- (void)_updateShowsLockIcon;
- (void)_updateTemporarySuppressionOfItemText:(id *)a1;
- (void)_updateText;
- (void)_updateTextColor;
- (void)_viewToInsertProgressBarIn;
- (void)_widthForAccessoryButtonType:(uint64_t)a1;
- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8;
- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4;
- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4;
- (void)clickInteractionDidClickDown:(id)a3;
- (void)dealloc;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)fluidProgressViewDidShowProgress:(id)a3;
- (void)fluidProgressViewWillShowProgress:(id)a3;
- (void)layoutSubviews;
- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4;
- (void)navigationBarItemDidUpdateCustomPlaceholderText:(id)a3;
- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3;
- (void)navigationBarItemDidUpdateOverlayConfiguration:(id)a3;
- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3;
- (void)navigationBarItemDidUpdateShowsReaderButton:(id)a3;
- (void)navigationBarItemDidUpdateShowsTranslationButton:(id)a3;
- (void)navigationBarURLButtonBeginSuppressingPlaceholder:(id)a3;
- (void)navigationBarURLButtonDidReceivePasteCommand:(id)a3;
- (void)navigationBarURLButtonDidRequestFocusForPencilInput:(id)a3 completionHandler:(id)a4;
- (void)navigationBarURLButtonEndSuppressingPlaceholder:(id)a3;
- (void)setBackdropGroupDisabled:(BOOL)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setContentUnderStatusBarHeight:(double)a3;
- (void)setControlsHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissButtonHidden:(BOOL)a3;
- (void)setDismissButtonStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 completionHandler:(id)a4;
- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4;
- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)setHasToolbar:(BOOL)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setItem:(id)a3;
- (void)setLockdownStatusBar:(id)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMinimumBackdropHeight:(double)a3;
- (void)setSuppressesBlur:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)setUnifiedFieldShowsProgressView:(BOOL)a3;
- (void)setUsesFaintSeparator:(BOOL)a3;
- (void)setUsesNarrowLayout:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation _SFNavigationBar

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && initializeConstants_once != -1)
  {
    dispatch_once(&initializeConstants_once, &__block_literal_global_838);
  }
}

- (void)setItem:(id)a3
{
  v5 = (SFNavigationBarItem *)a3;
  v6 = self->_item;
  v7 = v6;
  if (v6 != v5)
  {
    [(SFNavigationBarItem *)v6 removeObserver:self];
    v8 = [(SFNavigationBarItem *)v7 fluidProgressController];
    [v8 unregisterObserver:self->_progressView];

    objc_storeStrong((id *)&self->_item, a3);
    [(SFNavigationBarItem *)v5 addObserver:self];
    v9 = [(SFNavigationBarItem *)v5 fluidProgressController];
    [v9 registerObserver:self->_progressView];

    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __28___SFNavigationBar_setItem___block_invoke;
    v11[3] = &unk_1E5C72350;
    v11[4] = self;
    v12 = v7;
    v13 = v5;
    [v10 performWithoutAnimation:v11];
  }
}

- (void)_updatePlaceholderText
{
  if (a1)
  {
    v1 = (void *)a1[111];
    id v2 = [a1 _placeholderText];
    [v1 setPlaceholder:v2];
  }
}

- (uint64_t)_updateShowsSearchIndicator
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = [*(id *)(result + 864) showsSearchIndicator];
    v3 = *(void **)(v1 + 448);
    if (v2)
    {
      [v3 setFadeOutEdge:1];
      v4 = *(void **)(v1 + 648);
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4FB1838]);
        v6 = *(void **)(v1 + 648);
        *(void *)(v1 + 648) = v5;

        v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
        [*(id *)(v1 + 648) setImage:v7];
        [*(id *)(v1 + 648) setTintAdjustmentMode:1];
        id v8 = objc_alloc_init(MEMORY[0x1E4FB1838]);
        v9 = *(void **)(v1 + 656);
        *(void *)(v1 + 656) = v8;

        [*(id *)(v1 + 656) setImage:v7];
        [*(id *)(v1 + 656) setTintAdjustmentMode:1];

        v4 = *(void **)(v1 + 648);
      }
      v10 = [v4 superview];

      if (!v10)
      {
        [*(id *)(v1 + 432) addSubview:*(void *)(v1 + 648)];
        [*(id *)(v1 + 664) addSubview:*(void *)(v1 + 656)];
        -[_SFNavigationBar _updateSearchIndicator](v1);
      }
    }
    else
    {
      [v3 setFadeOutEdge:0];
      [*(id *)(v1 + 648) removeFromSuperview];
      [*(id *)(v1 + 656) removeFromSuperview];
    }
    -[_SFNavigationBar _updateActiveURLLabelAccessory](v1);
    [(id)v1 setNeedsLayout];
    return -[_SFNavigationBar _updateAccessoryButtonsVisibility](v1);
  }
  return result;
}

- (uint64_t)_updateAccessoryButtonsVisibility
{
  if (result)
  {
    uint64_t v1 = result;
    -[_SFNavigationBar _updateAccessoryButtonsArrangement](result);
    BOOL v2 = ![*(id *)(v1 + 864) showsStopReloadButtons]
      || *(unsigned char *)(v1 + 859)
      || *(unsigned char *)(v1 + 640) != 0;
    [*(id *)(v1 + 744) setHidden:v2];
    [*(id *)(v1 + 736) setHidden:v2];
    if (*(unsigned char *)(v1 + 859)
      || !-[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(void *)(v1 + 720), 2)
      || *(unsigned char *)(v1 + 640))
    {
      uint64_t v3 = 1;
    }
    else
    {
      if (!*(void *)(v1 + 728)) {
        -[_SFNavigationBar _setUpFormatToggleButtonIfNeeded](v1);
      }
      uint64_t v3 = 0;
    }
    v4 = *(void **)(v1 + 728);
    if (v4)
    {
      int v5 = [v4 isHidden] ^ 1;
      v4 = *(void **)(v1 + 728);
    }
    else
    {
      int v5 = 0;
    }
    [v4 setHidden:v3];
    if (*(unsigned char *)(v1 + 859)) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = -[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(void *)(v1 + 720), 3) ^ 1;
    }
    [*(id *)(v1 + 760) setHidden:v6];
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 904));
    if (v5)
    {
      id v8 = WeakRetained;
      if ([*(id *)(v1 + 728) isHidden])
      {
        if (objc_opt_respondsToSelector()) {
          [v8 navigationBarFormatMenuButtonBecameUnavailable:v1];
        }
      }
    }
    return MEMORY[0x1F4181820]();
  }
  return result;
}

- (void)_updateMediaStateMuteButton
{
  if (a1)
  {
    [a1[108] mediaStateIcon];
    _SFImageForMediaStateIcon();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v2 = -[_SFNavigationBar _mediaStateMuteButtonColor](a1);
    uint64_t v3 = [v8 flattenedImageWithColor:v2];
    v4 = [v2 colorWithAlphaComponent:0.2];
    int v5 = [v8 flattenedImageWithColor:v4];

    uint64_t v6 = [a1[95] imageForState:0];
    char v7 = (v3 == 0) ^ (v6 != 0);

    -[_SFNavigationBar _updateAccessoryButtonsVisibility]((uint64_t)a1);
    -[_SFNavigationBar _updateAccessoryButtonsAlpha](a1);
    [a1[95] setImage:v3 forState:0];
    [a1[95] setImage:v5 forState:1];
    if ((v7 & 1) == 0) {
      -[_SFNavigationBar _adjustLabelRectForLeadingButtonWithDelay:]((uint64_t)a1, 0.0);
    }
  }
}

- (void)_updateNavigationBarTrailingButtonType
{
  if (a1)
  {
    -[_SFNavigationBar _updateAccessoryButtonsArrangement](a1);
    uint64_t v2 = *(void *)(a1 + 720);
    uint64_t v3 = v2 ? *(void **)(v2 + 16) : 0;
    v4 = [v3 firstObject];
    uint64_t v5 = [v4 integerValue];

    uint64_t v6 = *(void *)(a1 + 768);
    if (v6 != v5)
    {
      -[_SFNavigationBar _navigationBarTrailingButtonWithType:]((char *)a1, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      char v7 = -[_SFNavigationBar _navigationBarTrailingButtonWithType:]((char *)a1, v5);
      *(void *)(a1 + 768) = v5;
      -[_SFNavigationBar _transitionFromView:toView:animated:]((void *)a1, v8, v7, [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
    }
  }
}

- (void)_updateTextColor
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 864) text];
    uint64_t v3 = [v2 length];

    v4 = [*(id *)(a1 + 880) platterPlaceholderTextColor];
    [(id)a1 setTextFieldPlaceHolderColor:v4];
    [(id)a1 minimumHeight];
    [(id)a1 bounds];
    double v5 = 0.0;
    if (*(void *)(a1 + 808) != 1) {
      SFBarBackgroundAlphaForSquishTransformFactor();
    }
    uint64_t v6 = [*(id *)(a1 + 880) platterTextColorForPlatterAlpha:v5];
    char v7 = (void *)v6;
    if (v3) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = v4;
    }
    id v12 = v8;
    [*(id *)(a1 + 448) setTextColor:v12];
    [*(id *)(a1 + 456) setTextColor:v12];
    [*(id *)(a1 + 472) setTextColor:v12];
    [*(id *)(a1 + 888) setTextColor:v7];
    if ([*(id *)(a1 + 880) tintStyle] == 4) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    v9 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    }
    [*(id *)(a1 + 888) setTintColor:v9];

    objc_msgSend(*(id *)(a1 + 888), "setOverrideUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 880), "platterTextFieldOverrideUserInterfaceStyle"));
    objc_msgSend(*(id *)(a1 + 888), "setKeyboardAppearance:", objc_msgSend(*(id *)(a1 + 880), "platterKeyboardOverrideAppearance"));
    v10 = -[_SFNavigationBar _attributedStringSecurityAnnotation]((id *)a1);
    [*(id *)(a1 + 480) setAttributedText:v10];

    v11 = [*(id *)(a1 + 880) annotationTextColor];
    [*(id *)(a1 + 464) setTextColor:v11];

    [*(id *)(a1 + 448) setEffect:0];
    [*(id *)(a1 + 824) setEffect:0];
    [*(id *)(a1 + 832) setEffect:0];
  }
}

- (void)_updateProgressView
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 688);
    uint64_t v3 = [*(id *)(a1 + 864) fluidProgressStateSource];
    v4 = [v3 progressState];
    [v2 setProgressToCurrentPositionForState:v4];

    -[_SFNavigationBar _updateProgressViewCornerRadius](a1);
    -[_SFNavigationBar _updateProgressViewFillColor](a1);
  }
}

- (void)_updateFormatButtonAccessories
{
  if (a1)
  {
    if ([*(id *)(a1 + 864) hasHiddenElements])
    {
      uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye.slash"];
      [*(id *)(a1 + 728) setSecondaryImage:v2];

      objc_msgSend(MEMORY[0x1E4FB1618], "safari_scribbleThemeColor");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 728) setSecondaryImageColor:v4];
    }
    else
    {
      uint64_t v3 = *(void **)(a1 + 728);
      [v3 setSecondaryImage:0];
    }
  }
}

- (uint64_t)_shouldUpdateBackdropStyleForTransitionFromItem:(void *)a3 toItem:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 859))
    {
      a1 = 0;
    }
    else
    {
      int v7 = [v5 overrideBarStyleForSecurityWarning];
      a1 = v7 ^ [v6 overrideBarStyleForSecurityWarning];
    }
  }

  return a1;
}

- (void)_updateEffectiveTheme
{
  if (a1)
  {
    id obj = +[_SFBarTheme themeWithTheme:*(void *)(a1 + 872)];
    if ([*(id *)(a1 + 864) overrideBarStyleForSecurityWarning])
    {
      uint64_t v2 = [obj fallbackTheme];

      uint64_t v3 = (void *)v2;
    }
    else
    {
      uint64_t v3 = obj;
    }
    id v4 = *(void **)(a1 + 880);
    if (v4 != v3)
    {
      id obja = v3;
      char v5 = [v4 isEqual:v3];
      uint64_t v3 = obja;
      if ((v5 & 1) == 0)
      {
        objc_storeStrong((id *)(a1 + 880), obja);
        -[_SFNavigationBar _didUpdateEffectiveTheme](a1);
        uint64_t v3 = obja;
      }
    }
  }
}

- (void)setUsesNarrowLayout:(BOOL)a3
{
  if (self->_usesNarrowLayout != a3)
  {
    BOOL v3 = a3;
    self->_usesNarrowLayout = a3;
    -[_SFNavigationBar _updateToolbarAndCancelButtonAlpha]((id *)&self->super.super.super.isa);
    char v5 = -[_SFNavigationBar _editingLabelFont]((uint64_t)self);
    double v6 = 1.0;
    if (self->_usesNarrowLayout) {
      double v6 = -[SFNavigationBarMetrics narrowEditingScaleFactor]((uint64_t)self->_barMetrics);
    }
    [(UITextField *)self->_textField setFont:v5];
    [(UILabel *)self->_expandedURLLabel setFont:v5];
    expandedURLLabel = self->_expandedURLLabel;
    CGAffineTransformMakeScale(&v8, 1.0 / v6, 1.0 / v6);
    [(UILabel *)expandedURLLabel setTransform:&v8];
    if (v3) {
      [(UIView *)self->_controlsContainer addSubview:self->_cancelButton];
    }
    else {
      [(UIButton *)self->_cancelButton removeFromSuperview];
    }
    [(_SFNavigationBar *)self _updateText];
    [(_SFNavigationBar *)self setNeedsLayout];
  }
}

- (id)_updateToolbarAndCancelButtonAlpha
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*((unsigned char *)result + 856) || (double v2 = 0.0, !*((unsigned char *)result + 859)))
    {
      [result _controlsAlpha];
      double v2 = v3;
    }
    [v1[71] setAlpha:v2];
    [v1[72] setAlpha:v2];
    if (*((unsigned char *)v1 + 856))
    {
      double v4 = 1.0 - v2;
      if (!*((unsigned char *)v1 + 859)) {
        double v4 = 0.0;
      }
    }
    else
    {
      double v4 = 0.0;
    }
    id v5 = v1[98];
    return (id *)[v5 setAlpha:v4];
  }
  return result;
}

- (id)_editingLabelFont
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 856);
    double v3 = *(void **)(a1 + 632);
    if (v2) {
      -[SFNavigationBarMetrics narrowEditingLabelFont](v3);
    }
    else {
    a1 = -[SFNavigationBarMetrics defaultLabelFont](v3);
    }
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (void)setUnifiedFieldShowsProgressView:(BOOL)a3
{
  if (((!self->_unifiedFieldShowsProgressView ^ a3) & 1) == 0)
  {
    self->_unifiedFieldShowsProgressView = a3;
    -[_SFNavigationBar _updateProgressViewCornerRadius]((uint64_t)self);
    -[_SFNavigationBar _updateProgressViewFillColor]((uint64_t)self);
    if ([(_SFFluidProgressView *)self->_progressView isShowingProgress])
    {
      double v4 = -[_SFNavigationBar _viewToInsertProgressBarIn](self);
      [v4 addSubview:self->_progressView];
    }
    [(_SFNavigationBar *)self setNeedsLayout];
  }
}

- (uint64_t)_updateProgressViewCornerRadius
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 857)) {
      double v2 = -[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(result + 632));
    }
    else {
      double v2 = 0.0;
    }
    double v3 = *(void **)(v1 + 688);
    return [v3 setCornerRadius:v2];
  }
  return result;
}

- (void)_updateProgressViewFillColor
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 857);
    double v3 = *(void **)(a1 + 880);
    if (v2) {
      [v3 platterProgressBarTintColor];
    }
    else {
    id v4 = [v3 progressBarTintColor];
    }
    [*(id *)(a1 + 688) setProgressBarFillColor:v4];
  }
}

- (void)_viewToInsertProgressBarIn
{
  if (a1)
  {
    if (*((unsigned char *)a1 + 857)) {
      a1 = (void *)a1[85];
    }
    a1 = a1;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDismissButtonStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[SFDismissButton style]((uint64_t)self->_dismissButton) != a3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51___SFNavigationBar_setDismissButtonStyle_animated___block_invoke;
    v8[3] = &unk_1E5C722D8;
    v8[4] = self;
    v8[5] = a3;
    int v7 = (void *)MEMORY[0x1AD0C36A0](v8);
    if (v4)
    {
      [(_SFNavigationBar *)self layoutIfNeeded];
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:0];
    }
    else
    {
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
  }
}

- (void)setDismissButtonHidden:(BOOL)a3
{
}

- (CGSize)dismissButtonSize
{
  [(SFDismissButton *)self->_dismissButton bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)_customButtonHorizontalPadding
{
  if (a1 && a1[101] == 1)
  {
    if ([a1 hasToolbar])
    {
      double v2 = [a1 traitCollection];
      [v2 horizontalSizeClass];
      [a1 safeAreaInsets];
    }
  }
}

- (void)setTheme:(id)a3
{
  double v4 = (_SFBarTheme *)a3;
  if (!v4)
  {
    double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    double v6 = [v5 traitCollection];
    if ([v6 userInterfaceStyle] == 2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }

    double v4 = [MEMORY[0x1E4F78548] themeWithBarTintStyle:v7];
  }
  theme = self->_theme;
  if (theme != v4)
  {
    id obj = v4;
    BOOL v9 = [(_SFBarTheme *)theme isEqual:v4];
    double v4 = obj;
    if (!v9)
    {
      objc_storeStrong((id *)&self->_theme, obj);
      -[_SFNavigationBar _updateEffectiveTheme]((uint64_t)self);
      double v4 = obj;
    }
  }
}

- (void)_didUpdateEffectiveTheme
{
  if (a1 && *(void *)(a1 + 680))
  {
    double v2 = [*(id *)(a1 + 880) controlsTintColor];
    [(id)a1 setTintColor:v2];

    int v3 = [*(id *)(a1 + 880) backdropIsDark];
    if (v3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(id)a1 _accessibilitySetInterfaceStyleIntent:v4];
    id v5 = [*(id *)(a1 + 880) URLAccessoryButtonTintColorForInputMode:*(void *)(a1 + 808)];
    [*(id *)(a1 + 728) setGlyphTintColor:v5];
    objc_msgSend(*(id *)(a1 + 728), "setUsesInsetFromBackground:", v3 ^ objc_msgSend(*(id *)(a1 + 880), "platterBackdropIsDark"));
    -[_SFNavigationBarURLButton setTheme:](*(void *)(a1 + 680), *(void **)(a1 + 880));
    [*(id *)(a1 + 736) setTintColor:v5];
    [*(id *)(a1 + 744) setTintColor:v5];
    -[_SFNavigationBar _updateSeparatorAlpha](a1);
    -[_SFNavigationBar _updateTextColor](a1);
    objc_msgSend((id)a1, "_setOverrideUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 880), "overrideUserInterfaceStyle"));
    [*(id *)(a1 + 880) tintStyle];
    [*(id *)(a1 + 464) setHidden:_SFIsPrivateTintStyle() ^ 1];
    [*(id *)(a1 + 880) applyBackdropEffectsToView:*(void *)(a1 + 696)];
    [*(id *)(a1 + 568) setTheme:*(void *)(a1 + 880)];
    [*(id *)(a1 + 576) setTheme:*(void *)(a1 + 880)];
  }
}

- (uint64_t)_updateSeparatorAlpha
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = 0.0;
    if (!*(unsigned char *)(result + 858))
    {
      int v3 = objc_msgSend(*(id *)(result + 880), "backdropIsDark", 0.0);
      double v2 = 1.0;
      if (v3)
      {
        LOBYTE(v2) = *(unsigned char *)(v1 + 862);
        double v2 = (double)*(unint64_t *)&v2;
      }
    }
    uint64_t v4 = *(void **)(v1 + 704);
    return [v4 setAlpha:v2];
  }
  return result;
}

+ (int64_t)_metricsCategory
{
  return 0;
}

+ (double)estimatedDefaultHeightForStatusBarHeight:(double)a3
{
  id v5 = estimatedBarMetrics();
  -[SFNavigationBarMetrics updateForStatusBarHeight:]((uint64_t)v5, a3);
  double v6 = -[SFNavigationBarMetrics barHeightWithBarMetricsCategory:]((uint64_t)v5, [a1 _metricsCategory]);

  return v6;
}

+ (double)estimatedMinimumHeightForStatusBarHeight:(double)a3
{
  uint64_t v4 = estimatedBarMetrics();
  -[SFNavigationBarMetrics updateForStatusBarHeight:]((uint64_t)v4, a3);
  double v5 = -[SFNavigationBarMetrics minimumBarHeight]((uint64_t)v4);

  return v5;
}

- (double)_defaultHeightExcludingAuxiliaryBar
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = *(void *)(a1 + 632);
  uint64_t v2 = [(id)objc_opt_class() _metricsCategory];

  return -[SFNavigationBarMetrics barHeightWithBarMetricsCategory:](v1, v2);
}

- (double)defaultHeight
{
  double v3 = -[_SFNavigationBar _defaultHeightExcludingAuxiliaryBar]((uint64_t)self);
  if (self)
  {
    [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
    if (v4 != 0.0)
    {
      -[SFNavigationBarMetrics urlOutlineHeight]((uint64_t)self->_barMetrics);
      -[_SFNavigationBar _urlOutlineOriginY]((uint64_t)self);
      [(SFLockdownStatusBar *)self->_lockdownStatusBar titleCapHeightInsetFromTop];
      [(SFLockdownStatusBar *)self->_lockdownStatusBar titleBaselineInsetFromBottom];
      -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom]((uint64_t)self->_barMetrics);
      _SFRoundFloatToPixels();
      return v3 + v5;
    }
  }
  return v3;
}

- (double)_urlOutlineOriginY
{
  if (!a1) {
    return 0.0;
  }
  double v2 = -[_SFNavigationBar _layoutBounds](a1);
  double v4 = v3;
  objc_msgSend((id)a1, "bounds", v2);
  double v6 = v5;
  [*(id *)(a1 + 448) urlSize];
  _SFRoundFloatToPixels();
  double v8 = fmax(v6, v4) + v7 + -[SFNavigationBarMetrics urlLabelVerticalOffset](*(void *)(a1 + 632));
  return v8 - -[SFNavigationBarMetrics urlContainerTop](*(void *)(a1 + 632));
}

- (double)minimumHeight
{
  double v3 = -[SFNavigationBarMetrics minimumBarHeight]((uint64_t)self->_barMetrics);
  [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
  if (v4 == 0.0) {
    return v3;
  }
  -[_SFNavigationBar _auxiliaryBarSquishedVerticalOffsetForSquishTransform:]((uint64_t)self);
  [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
  [(SFLockdownStatusBar *)self->_lockdownStatusBar preferredSize];
  [(SFLockdownStatusBar *)self->_lockdownStatusBar titleBaselineInsetFromBottom];
  [(SFLockdownStatusBar *)self->_lockdownStatusBar titleBaselineInsetFromBottom];
  [(_SFNavigationBar *)self defaultHeight];

  _SFRoundFloatToPixels();
  return result;
}

- (double)_auxiliaryBarSquishedVerticalOffsetForSquishTransform:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  -[SFNavigationBarMetrics urlOutlineHeight](*(void *)(a1 + 632));
  -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom](*(void *)(a1 + 632));
  uint64_t v2 = *(void *)(a1 + 632);
  uint64_t v3 = [(id)objc_opt_class() _metricsCategory];
  -[SFNavigationBarMetrics squishHeightQuantizationOffsetWithBarMetricsCategory:](v2, v3);
  [*(id *)(a1 + 952) titleCapHeightInsetFromTop];
  [*(id *)(a1 + 952) titleCapHeightInsetFromTop];

  _SFRoundFloatToPixels();
  return result;
}

- (double)visualHeight
{
  [(_SFNavigationBar *)self bounds];
  return fmax(v2, 0.0);
}

- (id)_dimmingButtonWithAction:(uint64_t *)val
{
  if (val)
  {
    objc_initWeak(&location, val);
    -[SFNavigationBarMetrics urlOutlineHeight](val[79]);
    _SFRoundRectToPixels();
    double v8 = v4;
    double v9 = v5;
    double v10 = v6;
    double v11 = v7;
    if (val[101] == 1)
    {
      id v12 = [MEMORY[0x1E4F78570] buttonWithType:1];
      objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);
    }
    else
    {
      id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F78570]), "initWithFrame:", v4, v5, v6, v7);
    }
    [v12 setNormalImageAlpha:1.0];
    [v12 setHighlightedImageAlpha:0.2];
    [v12 setHighlightAnimationDuration:0.5];
    [v12 setAdjustsImageWhenHighlighted:0];
    [v12 setAdjustsImageWhenDisabled:0];
    [v12 setExclusiveTouch:1];
    [v12 addTarget:val action:a2 forControlEvents:64];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45___SFNavigationBar__dimmingButtonWithAction___block_invoke;
    v14[3] = &unk_1E5C73420;
    objc_copyWeak(&v15, &location);
    [v12 setPointerStyleProvider:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)setHasToolbar:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SFNavigationBar *)self hasToolbar] != a3)
  {
    if (v3)
    {
      double v5 = [[_SFToolbar alloc] initWithPlacement:0];
      leadingToolbar = self->_leadingToolbar;
      self->_leadingToolbar = v5;

      [(_SFToolbar *)self->_leadingToolbar setSuperviewOwningLayout:self];
      [(_SFToolbar *)self->_leadingToolbar setTheme:self->_effectiveTheme];
      double v7 = (SFToolbarContainer *)-[SFToolbarContainer initWithToolbar:]([SFToolbarContainer alloc], self->_leadingToolbar);
      leadingToolbarContainer = self->_leadingToolbarContainer;
      self->_leadingToolbarContainer = v7;

      -[SFToolbarContainer setMinimumWidth:]((uint64_t)self->_leadingToolbarContainer, 9.5);
      -[SFToolbarContainer _setTouchInsets:](self->_leadingToolbarContainer, "_setTouchInsets:", -20.0, 0.0, -20.0, 0.0);
      [(UIView *)self->_controlsContainer addSubview:self->_leadingToolbarContainer];
      double v9 = [[_SFToolbar alloc] initWithPlacement:0];
      trailingToolbar = self->_trailingToolbar;
      self->_trailingToolbar = v9;

      [(_SFToolbar *)self->_trailingToolbar setSuperviewOwningLayout:self];
      [(_SFToolbar *)self->_trailingToolbar setTheme:self->_effectiveTheme];
      double v11 = (SFToolbarContainer *)-[SFToolbarContainer initWithToolbar:]([SFToolbarContainer alloc], self->_trailingToolbar);
      trailingToolbarContainer = self->_trailingToolbarContainer;
      self->_trailingToolbarContainer = v11;

      -[SFToolbarContainer setMinimumWidth:]((uint64_t)self->_trailingToolbarContainer, 9.5);
      -[SFToolbarContainer _setTouchInsets:](self->_trailingToolbarContainer, "_setTouchInsets:", -20.0, 0.0, -20.0, 0.0);
      [(UIView *)self->_controlsContainer addSubview:self->_trailingToolbarContainer];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained navigationBar:self didCreateLeadingToolbar:self->_leadingToolbar trailingToolbar:self->_trailingToolbar];
      }
    }
    else
    {
      [(_SFToolbar *)self->_leadingToolbar removeFromSuperview];
      v14 = self->_leadingToolbar;
      self->_leadingToolbar = 0;

      [(SFToolbarContainer *)self->_leadingToolbarContainer removeFromSuperview];
      id v15 = self->_leadingToolbarContainer;
      self->_leadingToolbarContainer = 0;

      [(_SFToolbar *)self->_trailingToolbar removeFromSuperview];
      v16 = self->_trailingToolbar;
      self->_trailingToolbar = 0;

      [(SFToolbarContainer *)self->_trailingToolbarContainer removeFromSuperview];
      id WeakRetained = self->_trailingToolbarContainer;
      self->_trailingToolbarContainer = 0;
    }

    if (self->_inputMode == 1)
    {
      -[_SFNavigationBar _updateAccessoryButtonsArrangement]((uint64_t)self);
    }
  }
}

- (void)_updateAccessoryButtonsArrangement
{
  if (a1)
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    if ([*(id *)(a1 + 864) showsPageFormatButton])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 904));
      char v3 = objc_opt_respondsToSelector();

      if (v3) {
        [v9 addObject:&unk_1EFBDEA40];
      }
    }
    if ([*(id *)(a1 + 864) mediaStateIcon]) {
      [v9 addObject:&unk_1EFBDEA58];
    }
    double v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    if ([*(id *)(a1 + 864) stopReloadButtonShowsStop]) {
      double v5 = &unk_1EFBDEA70;
    }
    else {
      double v5 = &unk_1EFBDEA88;
    }
    [v4 addObject:v5];
    if (*(void *)(a1 + 808) == 1 && ([(id)a1 hasToolbar] & 1) == 0 && objc_msgSend(v9, "count"))
    {
      double v6 = [v9 lastObject];
      [v4 addObject:v6];

      [v9 removeLastObject];
    }
    double v7 = -[SFNavigationBarAccessoryButtonArrangement initWithLeadingButtonTypes:trailingButtonTypes:]([SFNavigationBarAccessoryButtonArrangement alloc], v9, v4);
    double v8 = *(void **)(a1 + 720);
    *(void *)(a1 + 720) = v7;
  }
}

- (BOOL)hasToolbar
{
  return self->_leadingToolbar != 0;
}

- (void)_updateFonts
{
  if (a1)
  {
    -[_SFNavigationBar _editingLabelFont](a1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    double v2 = -[SFNavigationBarMetrics defaultLabelFont](*(void **)(a1 + 632));
    char v3 = -[_SFNavigationBar _URLLabelFont]((void *)a1);
    [*(id *)(a1 + 888) setFont:v4];
    [*(id *)(a1 + 456) setFont:v4];
    [*(id *)(a1 + 448) setFont:v3];
    [*(id *)(a1 + 464) setFont:v3];
    [*(id *)(a1 + 464) sizeToFit];
    [*(id *)(a1 + 472) setFont:v2];
    [*(id *)(a1 + 480) setFont:v2];
    -[_SFNavigationBar _updateTextMetrics](a1);
    [*(id *)(a1 + 472) sizeToFit];
  }
}

- (void)_URLLabelFont
{
  if (a1)
  {
    uint64_t v2 = a1[101];
    char v3 = (void *)a1[79];
    if (v2 == 1) {
      -[SFNavigationBarMetrics defaultBoldFont](v3);
    }
    else {
    a1 = -[SFNavigationBarMetrics defaultLabelFont](v3);
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)_updateTextMetrics
{
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend(*(id *)(result + 456), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    uint64_t v3 = v2;
    *(void *)(v1 + 488) = v4;
    double result = _SFEqualWithEpsilon();
    if ((result & 1) == 0) {
      *(void *)(v1 + 496) = v3;
    }
  }
  return result;
}

- (uint64_t)_updateButtonMetrics
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 744);
    uint64_t v3 = -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(void **)(result + 632));
    [v2 setPreferredSymbolConfiguration:v3 forImageInState:0];

    uint64_t v4 = *(void **)(v1 + 736);
    double v5 = -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(void **)(v1 + 632));
    [v4 setPreferredSymbolConfiguration:v5 forImageInState:0];

    double v6 = -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(void **)(v1 + 632));
    [*(id *)(v1 + 728) setPreferredSymbolConfiguration:v6];

    double v7 = -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*(void *)(v1 + 632));
    -[SFDismissButton setPreferredTraitCollection:](*(id **)(v1 + 800), v7);

    double v8 = (void *)MEMORY[0x1E4FB1798];
    id v9 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [MEMORY[0x1E4FB1798] labelFontSize];
    double v11 = v10;
    id v12 = -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*(void *)(v1 + 632));
    [v9 scaledValueForValue:v12 compatibleWithTraitCollection:v11];
    v14 = [v8 systemFontOfSize:round(v13)];
    id v15 = [*(id *)(v1 + 784) titleLabel];
    [v15 setFont:v14];

    double result = objc_msgSend(*(id *)(v1 + 784), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    *(void *)(v1 + 792) = v16;
  }
  return result;
}

- (uint64_t)_updateURLOutlineCornerRadius
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = -[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(result + 632));
    uint64_t v3 = *(void *)(v1 + 680);
    if (v3 && *(double *)(v3 + 832) != v2)
    {
      *(double *)(v3 + 832) = v2;
      objc_msgSend(*(id *)(v3 + 768), "_setContinuousCornerRadius:");
    }
    [*(id *)(v1 + 680) _setContinuousCornerRadius:-[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(v1 + 632))];
    return -[_SFNavigationBar _updateProgressViewCornerRadius](v1);
  }
  return result;
}

- (void)_barMetricTraitsDidChange
{
  id v3 = [(_SFNavigationBar *)self traitCollection];
  if (-[SFNavigationBarMetrics updateForTraitCollection:]((uint64_t)self->_barMetrics, v3)) {
    -[_SFNavigationBar _barMetricsDidChange]((uint64_t)self);
  }
}

- (void)_barMetricsDidChange
{
  if (a1)
  {
    *(_OWORD *)(a1 + 600) = *MEMORY[0x1E4F1DB30];
    -[_SFNavigationBar _updateURLOutlineCornerRadius](a1);
    -[_SFNavigationBar _updateFonts](a1);
    [(id)a1 _updateText];
    -[_SFNavigationBar _updateActiveURLLabelAccessory](a1);
    -[_SFNavigationBar _updateControlTints](a1);
    -[_SFNavigationBar _updateButtonMetrics](a1);
    [*(id *)(a1 + 728) setResizableBackgroundCornerRadius:-[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(a1 + 632))];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 904));
    *(unsigned char *)(a1 + 863) = 1;
    id v3 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v3 navigationBarMetricsDidChange:a1];
    }
    *(unsigned char *)(a1 + 863) = 0;
  }
}

- (void)_updateActiveURLLabelAccessory
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = objc_alloc_init(_SFURLLabelAccessoryItem);
    [(_SFURLLabelAccessoryItem *)v2 setView:*(void *)(a1 + 648)];
    [(_SFURLLabelAccessoryItem *)v2 setSpacing:4.0];
    [(_SFURLLabelAccessoryItem *)v2 setSquishedView:*(void *)(a1 + 656)];
    id v3 = objc_alloc_init(_SFURLLabelAccessoryItem);
    [(_SFURLLabelAccessoryItem *)v3 setView:*(void *)(a1 + 848)];
    [(_SFURLLabelAccessoryItem *)v3 setSquishedView:*(void *)(a1 + 840)];
    [(_SFURLLabelAccessoryItem *)v3 setEffectView:*(void *)(a1 + 824)];
    [(_SFURLLabelAccessoryItem *)v3 setSquishedEffectView:*(void *)(a1 + 832)];
    [(_SFURLLabelAccessoryItem *)v3 setSpacing:4.0];
    if ([*(id *)(a1 + 864) showsLockIcon]
      && [*(id *)(a1 + 864) showsSearchIndicator])
    {
      v19[0] = v2;
      v19[1] = v3;
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      double v5 = *(void **)(a1 + 672);
      *(void *)(a1 + 672) = v4;

      [*(id *)(a1 + 848) setHidden:0];
      double v6 = *(void **)(a1 + 648);
      uint64_t v7 = 0;
    }
    else
    {
      if ([*(id *)(a1 + 864) showsLockIcon])
      {
        v18 = v3;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        id v9 = *(void **)(a1 + 672);
        *(void *)(a1 + 672) = v8;

        [*(id *)(a1 + 848) setHidden:0];
        uint64_t v10 = 648;
      }
      else
      {
        if (![*(id *)(a1 + 864) showsSearchIndicator])
        {
          double v13 = objc_alloc_init(_SFURLLabelAccessoryItem);
          [(_SFURLLabelAccessoryItem *)v13 setView:0];
          [(_SFURLLabelAccessoryItem *)v13 setSpacing:0.0];
          uint64_t v16 = v13;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
          id v15 = *(void **)(a1 + 672);
          *(void *)(a1 + 672) = v14;

          [*(id *)(a1 + 648) setHidden:1];
          [*(id *)(a1 + 848) setHidden:1];

          goto LABEL_11;
        }
        v17 = v2;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
        id v12 = *(void **)(a1 + 672);
        *(void *)(a1 + 672) = v11;

        [*(id *)(a1 + 648) setHidden:0];
        uint64_t v10 = 848;
      }
      double v6 = *(void **)(a1 + v10);
      uint64_t v7 = 1;
    }
    [v6 setHidden:v7];
LABEL_11:
  }
}

- (uint64_t)_updateControlTints
{
  if (result)
  {
    uint64_t v1 = result;
    -[_SFNavigationBar _updateTextColor](result);
    -[_SFNavigationBar _updateSearchIndicator](v1);
    double result = [*(id *)(v1 + 864) showsLockIcon];
    if (result)
    {
      *(unsigned char *)(v1 + 816) = 1;
      return -[_SFNavigationBar _updateLockViewIfNeeded](v1);
    }
  }
  return result;
}

- (_SFNavigationBar)initWithFrame:(CGRect)a3 inputMode:(unint64_t)a4
{
  v96.receiver = self;
  v96.super_class = (Class)_SFNavigationBar;
  double v5 = -[_SFNavigationBar initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    v5->_inputMode = a4;
    uint64_t v7 = objc_alloc_init(SFNavigationBarMetrics);
    uint64_t v8 = *(void **)(v6 + 632);
    *(void *)(v6 + 632) = v7;

    [(id)v6 setTheme:0];
    id v9 = [(id)v6 layer];
    [v9 setAllowsGroupOpacity:0];
    [v9 setAllowsGroupBlending:0];
    [(id)v6 setAutoresizingMask:2];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    uint64_t v11 = *(void **)(v6 + 696);
    *(void *)(v6 + 696) = v10;

    uint64_t v12 = 0;
    if (!*(unsigned char *)(v6 + 860)) {
      uint64_t v12 = *(void *)(v6 + 896);
    }
    [*(id *)(v6 + 696) _setGroupName:v12];
    [*(id *)(v6 + 696) setAutoresizingMask:0];
    [(id)v6 addSubview:*(void *)(v6 + 696)];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    uint64_t v14 = *(void **)(v6 + 704);
    *(void *)(v6 + 704) = v13;

    id v15 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineShadowColor");
    [*(id *)(v6 + 704) setBackgroundColor:v15];

    [(id)v6 addSubview:*(void *)(v6 + 704)];
    id v16 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v17 = *(void **)(v6 + 424);
    *(void *)(v6 + 424) = v16;

    [(id)v6 addSubview:*(void *)(v6 + 424)];
    v18 = [*(id *)(v6 + 424) layer];
    [v18 setAllowsGroupOpacity:0];

    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v21 = *(void **)(v6 + 512);
    *(void *)(v6 + 512) = v20;

    id v22 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v23 = *(void **)(v6 + 520);
    *(void *)(v6 + 520) = v22;

    [*(id *)(v6 + 520) setClipsToBounds:1];
    v24 = [*(id *)(v6 + 520) layer];
    [v24 setAllowsGroupBlending:0];

    [*(id *)(v6 + 520) addSubview:*(void *)(v6 + 512)];
    id v25 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v26 = *(void **)(v6 + 440);
    *(void *)(v6 + 440) = v25;

    [*(id *)(v6 + 512) addSubview:*(void *)(v6 + 440)];
    v27 = objc_alloc_init(_SFNavigationBarLabelsContainer);
    v28 = *(void **)(v6 + 432);
    *(void *)(v6 + 432) = v27;

    [*(id *)(v6 + 440) addSubview:*(void *)(v6 + 432)];
    v29 = objc_alloc_init(_SFNavigationBarURLButton);
    v30 = *(void **)(v6 + 680);
    *(void *)(v6 + 680) = v29;

    double v31 = -[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(v6 + 632));
    uint64_t v32 = *(void *)(v6 + 680);
    if (v32
      && (*(double *)(v32 + 832) == v31
       || (*(double *)(v32 + 832) = v31,
           objc_msgSend(*(id *)(v32 + 768), "_setContinuousCornerRadius:"),
           (uint64_t v32 = *(void *)(v6 + 680)) != 0)))
    {
      objc_storeWeak((id *)(v32 + 824), (id)v6);
      v33 = *(void **)(v6 + 680);
    }
    else
    {
      v33 = 0;
    }
    v34 = [v33 layer];
    objc_msgSend(v34, "setAnchorPoint:", 0.5, 0.0);

    [*(id *)(v6 + 680) addTarget:v6 action:sel__URLTapped_ forControlEvents:64];
    [*(id *)(v6 + 680) setAdjustsImageWhenHighlighted:a4 == 0];
    [*(id *)(v6 + 680) _setContinuousCornerRadius:-[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(v6 + 632))];
    [*(id *)(v6 + 424) addSubview:*(void *)(v6 + 680)];
    id v35 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [*(id *)(v6 + 424) bounds];
    uint64_t v36 = objc_msgSend(v35, "initWithFrame:");
    v37 = *(void **)(v6 + 664);
    *(void *)(v6 + 664) = v36;

    [*(id *)(v6 + 664) setAutoresizingMask:18];
    [*(id *)(v6 + 424) addSubview:*(void *)(v6 + 664)];
    uint64_t v38 = [(id)v6 newTextField];
    v39 = *(void **)(v6 + 888);
    *(void *)(v6 + 888) = v38;

    [*(id *)(v6 + 888) setSmartDashesType:1];
    [*(id *)(v6 + 888) setSmartQuotesType:1];
    [*(id *)(v6 + 888) setAutocapitalizationType:0];
    [*(id *)(v6 + 888) setAutocorrectionType:1];
    [*(id *)(v6 + 888) setKeyboardType:10];
    [*(id *)(v6 + 888) setClearButtonMode:3];
    [*(id *)(v6 + 888) setTintAdjustmentMode:1];
    [*(id *)(v6 + 888) setSemanticContentAttribute:3];
    uint64_t v40 = [(id)v6 _placeholderText];
    [*(id *)(v6 + 888) setPlaceholder:v40];
    id v41 = objc_alloc_init(MEMORY[0x1E4F784C0]);
    v42 = *(void **)(v6 + 448);
    *(void *)(v6 + 448) = v41;

    v95 = (void *)v40;
    [*(id *)(v6 + 448) setText:v40];
    v43 = _SFBackdropGroupNameForOwner();
    [*(id *)(v6 + 448) _setGroupName:v43];

    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 448)];
    id v44 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v45 = *(void **)(v6 + 480);
    *(void *)(v6 + 480) = v44;

    v46 = [MEMORY[0x1E4FB1618] clearColor];
    [*(id *)(v6 + 480) setBackgroundColor:v46];

    [*(id *)(v6 + 480) setTextAlignment:0];
    v47 = -[_SFNavigationBar _attributedStringSecurityAnnotation]((id *)v6);
    [*(id *)(v6 + 480) setAttributedText:v47];

    [*(id *)(v6 + 480) setContentMode:9];
    [*(id *)(v6 + 480) setAlpha:0.0];
    id v48 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v49 = *(void **)(v6 + 616);
    *(void *)(v6 + 616) = v48;

    [*(id *)(v6 + 616) setClipsToBounds:1];
    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 616)];
    [*(id *)(v6 + 616) addSubview:*(void *)(v6 + 480)];
    id v50 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v51 = *(void **)(v6 + 464);
    *(void *)(v6 + 464) = v50;

    v52 = _WBSLocalizedString();
    [*(id *)(v6 + 464) setText:v52];

    [*(id *)(v6 + 464) setHidden:1];
    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 464)];
    id v53 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v54 = *(void **)(v6 + 456);
    *(void *)(v6 + 456) = v53;

    v55 = [MEMORY[0x1E4FB1618] clearColor];
    [*(id *)(v6 + 456) setBackgroundColor:v55];

    v56 = [MEMORY[0x1E4FB1618] blackColor];
    [*(id *)(v6 + 456) setTextColor:v56];

    [*(id *)(v6 + 456) setTextAlignment:0];
    [*(id *)(v6 + 456) setAlpha:0.0];
    v57 = [*(id *)(v6 + 456) layer];
    objc_msgSend(v57, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 456)];
    [*(id *)(v6 + 680) addSubview:*(void *)(v6 + 520)];
    id v58 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v59 = *(void **)(v6 + 472);
    *(void *)(v6 + 472) = v58;

    [*(id *)(v6 + 472) setClipsToBounds:1];
    v60 = [MEMORY[0x1E4FB1618] clearColor];
    [*(id *)(v6 + 472) setBackgroundColor:v60];

    [*(id *)(v6 + 472) setTextAlignment:1];
    [*(id *)(v6 + 472) setAlpha:0.0];
    [*(id *)(v6 + 472) setContentMode:9];
    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 472)];
    uint64_t v61 = [objc_alloc(MEMORY[0x1E4F98A60]) initWithPresenter:v6];
    v62 = *(void **)(v6 + 408);
    *(void *)(v6 + 408) = v61;

    id v63 = objc_alloc_init(MEMORY[0x1E4F78588]);
    v64 = *(void **)(v6 + 688);
    *(void *)(v6 + 688) = v63;

    [*(id *)(v6 + 688) setDelegate:v6];
    -[_SFNavigationBar _updateFonts](v6);
    -[_SFNavigationBar _updateTextColor](v6);
    uint64_t v65 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    v66 = *(void **)(v6 + 784);
    *(void *)(v6 + 784) = v65;

    v67 = *(void **)(v6 + 784);
    v68 = _WBSLocalizedString();
    [v67 setTitle:v68 forState:0];

    [*(id *)(v6 + 784) addTarget:v6 action:sel__cancelButtonTapped_ forControlEvents:64];
    v69 = _SFAccessibilityIdentifierForBarItem();
    [*(id *)(v6 + 784) setAccessibilityIdentifier:v69];

    [*(id *)(v6 + 784) setPointerInteractionEnabled:1];
    uint64_t v70 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    v71 = *(void **)(v6 + 760);
    *(void *)(v6 + 760) = v70;

    [*(id *)(v6 + 760) addTarget:v6 action:sel__mediaStateMuteButtonTapped_ forControlEvents:0x2000];
    [*(id *)(v6 + 680) addSubview:*(void *)(v6 + 760)];
    *(void *)(v6 + 768) = 0;
    uint64_t v72 = -[_SFNavigationBar _dimmingButtonWithAction:]((uint64_t *)v6, (uint64_t)sel__reloadButtonPressed);
    v73 = *(void **)(v6 + 744);
    *(void *)(v6 + 744) = v72;

    _SFOnePixel();
    double v75 = v74;
    _SFOnePixel();
    objc_msgSend(*(id *)(v6 + 744), "setImageEdgeInsets:", v75, 0.0, 0.0, v76 + -3.0);
    [*(id *)(v6 + 680) addSubview:*(void *)(v6 + 744)];
    uint64_t v77 = -[_SFNavigationBar _dimmingButtonWithAction:]((uint64_t *)v6, (uint64_t)sel__stopButtonPressed);
    v78 = *(void **)(v6 + 736);
    *(void *)(v6 + 736) = v77;

    v79 = *(void **)(v6 + 736);
    _SFRoundEdgeInsetsToPixels();
    objc_msgSend(v79, "setImageEdgeInsets:");
    v80 = [*(id *)(v6 + 736) layer];
    [v80 setOpacity:0.0];

    [*(id *)(v6 + 680) addSubview:*(void *)(v6 + 736)];
    -[_SFNavigationBar _configureNavigationBarTrailingButtonTintedImages](v6);
    id v81 = objc_alloc_init(MEMORY[0x1E4F78568]);
    v82 = *(void **)(v6 + 416);
    *(void *)(v6 + 416) = v81;

    [*(id *)(v6 + 416) addTarget:v6 action:sel__compressedBarTapped forControlEvents:64];
    [(id)v6 addSubview:*(void *)(v6 + 416)];
    v83 = *(void **)(v6 + 680);
    v84 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v6];
    [v83 addInteraction:v84];

    uint64_t v85 = *(void *)(v6 + 808);
    if (v85 == 1)
    {
      v88 = objc_alloc_init(SFDismissButton);
      v89 = *(void **)(v6 + 800);
      *(void *)(v6 + 800) = v88;

      [*(id *)(v6 + 800) addTarget:v6 action:sel__dismissButtonTapped_ forControlEvents:64];
      [*(id *)(v6 + 800) setPointerInteractionEnabled:1];
      [*(id *)(v6 + 424) insertSubview:*(void *)(v6 + 800) belowSubview:*(void *)(v6 + 680)];
      v86 = v9;
    }
    else
    {
      v86 = v9;
      if (!v85)
      {
        [*(id *)(v6 + 416) setSpringLoaded:1];
        v87 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v6];
        [(id)v6 addInteraction:v87];
      }
    }
    [(id)v6 defaultHeight];
    *(void *)(v6 + 920) = v90;
    [(id)v6 setAccessibilityIdentifier:@"TopBrowserBar"];
    -[_SFNavigationBar _updateButtonMetrics](v6);
    -[_SFNavigationBar _didUpdateEffectiveTheme](v6);
    v91 = +[SFNavigationBarMetrics traitsAffectingBarMetrics]();
    id v92 = (id)[(id)v6 registerForTraitChanges:v91 withTarget:v6 action:sel__barMetricTraitsDidChange];

    id v93 = (id)v6;
  }

  return (_SFNavigationBar *)v6;
}

- (id)_attributedStringSecurityAnnotation
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = _WBSLocalizedString();
    id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v15 = *MEMORY[0x1E4FB12B8];
    uint64_t v4 = v15;
    double v5 = -[_SFNavigationBar _notSecureAnnotationColor](a1);
    v16[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v7 = (void *)[v3 initWithString:v2 attributes:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v13 = v4;
    id v9 = -[_SFNavigationBar _notSecureGrayColor](a1);
    uint64_t v14 = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v11 = (void *)[v8 initWithString:@" —" attributes:v10];

    [v7 appendAttributedString:v11];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_configureNavigationBarTrailingButtonTintedImages
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.clockwise"];
    double v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    [*(id *)(a1 + 744) setImage:v3 forState:0];
    [*(id *)(a1 + 736) setImage:v2 forState:0];
  }
}

- (_SFNavigationBar)initWithFrame:(CGRect)a3
{
  return -[_SFNavigationBar initWithFrame:inputMode:](self, "initWithFrame:inputMode:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SFNavigationBarItem *)self->_item removeObserver:self];
  [(UIButton *)self->_compressedBarButton removeTarget:self action:sel__compressedBarTapped forControlEvents:64];
  URLOutline = self->_URLOutline;
  if (URLOutline) {
    objc_storeWeak((id *)&URLOutline->_delegate, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBar;
  [(_SFNavigationBar *)&v5 dealloc];
}

- (void)_reloadButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarReloadButtonWasTapped:self];
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarFormatMenuButtonStartedInteraction:self];

  return 1;
}

- (void)clickInteractionDidClickDown:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarReaderButtonWasTapped:self];
}

- (void)_stopButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarStopLoadingButtonWasTapped:self];
}

- (void)_compressedBarTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained compressedNavigationBarWasTapped:self];
}

- (void)_URLTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarURLWasTapped:self completionHandler:0];
  }
}

- (void)_formatToggleButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t formatButtonTapAction = self->_formatButtonTapAction;
  if (formatButtonTapAction)
  {
    if (formatButtonTapAction == 2)
    {
      uint64_t v6 = WeakRetained;
      if (objc_opt_respondsToSelector()) {
        [v6 navigationBarTranslateButtonWasTapped:self];
      }
    }
    else if (formatButtonTapAction == 1)
    {
      [WeakRetained navigationBarReaderButtonWasTapped:self];
    }
  }
  else
  {
    uint64_t v7 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v7 navigationBarFormatMenuButtonWasTapped:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)_mediaStateMuteButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarMediaStateMuteButtonWasTapped:self];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarCancelButtonWasTapped:self];
}

- (void)_dismissButtonTapped:(id)a3
{
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXUserInterface();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "Dismiss button tapped", v8, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained navigationBarDoneButtonWasTapped:self];
    }
    else
    {
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXUserInterface();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[_SFNavigationBar _dismissButtonTapped:]();
      }
    }
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_SFNavigationBar _dismissButtonTapped:]();
    }
  }
}

- (double)_controlsAlpha
{
  id v3 = [(SFNavigationBarItem *)self->_item overlayConfiguration];

  if (v3) {
    return 0.0;
  }
  [(_SFNavigationBar *)self minimumHeight];
  double v6 = v5;
  uint64_t v7 = [(_SFNavigationBar *)self bounds];
  v9.n128_f64[0] = fmin(fmax((v8 - v6) / (self->_maximumHeight - v6), 0.0), 1.0);

  MEMORY[0x1F412FA48](v7, v9);
  return result;
}

- (uint64_t)_showsPrivateAnnotation
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 880) tintStyle];
    double result = _SFIsPrivateTintStyle();
    if (result) {
      return [*(id *)(v1 + 864) showsSecurityAnnotation] ^ 1;
    }
  }
  return result;
}

- (double)_privateBrowsingLabelRevealPercent
{
  double v1 = 0.0;
  if (a1 && -[_SFNavigationBar _showsPrivateAnnotation]((uint64_t)a1))
  {
    [a1 minimumHeight];
    double v4 = v3;
    [a1 bounds];
    return 1.0 - fmin(fmax((v5 - v4) / (a1[115] - v4), 0.0), 1.0);
  }
  return v1;
}

- (void)_transitionFromView:(void *)a3 toView:(int)a4 animated:
{
  v46[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v7 = a3;
    double v8 = [a2 layer];
    __n128 v9 = [v8 animationForKey:@"show"];
    [v8 removeAnimationForKey:@"show"];
    id v10 = [v7 layer];

    uint64_t v11 = [v10 animationForKey:@"hide"];
    [v10 removeAnimationForKey:@"hide"];
    [a1 _controlsAlpha];
    double v13 = v12;
    if (a4)
    {
      if (v10) {
        BOOL v14 = v11 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      int v15 = !v14;
      id v16 = (uint64_t *)MEMORY[0x1E4F39D98];
      v17 = (uint64_t *)MEMORY[0x1E4F39FA0];
      if (v9 && v15)
      {
        v18 = (uint64_t *)MEMORY[0x1E4F39D98];
        id v19 = reverseAnimation(v9);
      }
      else
      {
        v21 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
        [v21 setStiffness:300.0];
        [v21 setDamping:400.0];
        v18 = v16;
        uint64_t v22 = *v16;
        [v21 setBeginTimeMode:*v16];
        uint64_t v23 = *v17;
        [v21 setFillMode:*v17];
        [v21 setDuration:0.37];
        [v21 setBeginTime:0.005];
        [v21 setFromValue:&unk_1EFBDEA10];
        [v21 setToValue:&unk_1EFBDEA28];
        v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [v24 setAdditive:1];
        [v24 setBeginTimeMode:v22];
        [v24 setBeginTime:0.0];
        [v24 setFillMode:v23];
        [v24 setDuration:0.375];
        id v25 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
        [v24 setTimingFunction:v25];

        v26 = [NSNumber numberWithDouble:v13];
        [v24 setFromValue:v26];

        [v24 setToValue:&unk_1EFBDEA28];
        id v19 = [MEMORY[0x1E4F39B38] animation];
        v46[0] = v21;
        v46[1] = v24;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
        [v19 setAnimations:v27];

        [v19 setDuration:0.375];
        [v19 setRemovedOnCompletion:1];
        [v19 setFrameInterval:0.0166666667];
      }
      [v8 addAnimation:v19 forKey:@"hide"];

      CATransform3DMakeScale(&v44, 0.0, 0.0, 0.0);
      [v8 setTransform:&v44];
      [v8 setOpacity:0.0];
      if (v9) {
        BOOL v28 = 1;
      }
      else {
        BOOL v28 = v8 == 0;
      }
      if (v28 && v11)
      {
        v29 = reverseAnimation(v11);
      }
      else
      {
        v30 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
        [v30 setStiffness:300.0];
        [v30 setDamping:400.0];
        uint64_t v31 = *v18;
        [v30 setBeginTimeMode:*v18];
        uint64_t v32 = *MEMORY[0x1E4F39FA0];
        [v30 setFillMode:*MEMORY[0x1E4F39FA0]];
        [v30 setDuration:0.91];
        uint64_t v33 = *MEMORY[0x1E4F3A480];
        v34 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
        [v30 setTimingFunction:v34];

        [v30 setBeginTime:0.04];
        [v30 setFromValue:&unk_1EFBDEA28];
        [v30 setToValue:&unk_1EFBDEA10];
        id v35 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [v35 setAdditive:1];
        [v35 setBeginTimeMode:v31];
        [v35 setFillMode:v32];
        [v35 setDuration:0.25];
        uint64_t v36 = [MEMORY[0x1E4F39C10] functionWithName:v33];
        [v35 setTimingFunction:v36];

        [v35 setBeginTime:-0.12];
        v37 = [NSNumber numberWithDouble:-v13];
        [v35 setFromValue:v37];

        [v35 setToValue:&unk_1EFBDEA28];
        v29 = [MEMORY[0x1E4F39B38] animation];
        v45[0] = v30;
        v45[1] = v35;
        uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
        [v29 setAnimations:v38];

        [v29 setDuration:0.95];
        [v29 setRemovedOnCompletion:1];
        [v29 setFrameInterval:0.0166666667];
      }
      [v10 addAnimation:v29 forKey:@"show"];
    }
    else
    {
      CATransform3DMakeScale(&v44, 0.0, 0.0, 0.0);
      [v8 setTransform:&v44];
      [v8 setOpacity:0.0];
    }
    *(float *)&double v20 = v13;
    [v10 setOpacity:v20];
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v43[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v43[5] = v39;
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v43[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v43[7] = v40;
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v43[0] = *MEMORY[0x1E4F39B10];
    v43[1] = v41;
    long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v43[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v43[3] = v42;
    [v10 setTransform:v43];
  }
}

- (void)_setUpFormatToggleButtonIfNeeded
{
  if (a1 && !*(void *)(a1 + 728))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F782F0]);
    double v3 = -[_SFNavigationBar _formatToggleButtonImage]((id *)a1);
    uint64_t v4 = [v2 initWithImage:v3 forInputMode:*(void *)(a1 + 808)];
    double v5 = *(void **)(a1 + 728);
    *(void *)(a1 + 728) = v4;

    [*(id *)(a1 + 728) setMinimumSideMargin:6.0];
    [*(id *)(a1 + 728) setResizableBackgroundCornerRadius:-[SFNavigationBarMetrics urlOutlineCornerRadius](*(void *)(a1 + 632))];
    [*(id *)(a1 + 728) addTarget:a1 action:sel__formatToggleButtonTapped_ forControlEvents:64];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB2030]);
    id v7 = *(void **)(a1 + 752);
    *(void *)(a1 + 752) = v6;

    [*(id *)(a1 + 752) setDelegate:a1];
    [*(id *)(a1 + 728) addInteraction:*(void *)(a1 + 752)];
    [*(id *)(a1 + 728) setAccessibilityIdentifier:@"PageFormatMenuButton"];
    [*(id *)(a1 + 680) addSubview:*(void *)(a1 + 728)];
    [*(id *)(a1 + 728) setHidden:1];
    double v8 = [*(id *)(a1 + 880) URLAccessoryButtonTintColorForInputMode:*(void *)(a1 + 808)];
    [*(id *)(a1 + 728) setGlyphTintColor:v8];

    -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(void **)(a1 + 632));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 728) setPreferredSymbolConfiguration:v9];
  }
}

- (id)_formatToggleButtonImage
{
  if (a1)
  {
    id v2 = a1;
    if (([a1[51] isDisplaying] & 1) != 0
      || ![v2[108] showsSiriReaderPlayingIcon])
    {
      if ([v2[108] showsTranslationIcon]
        && ![v2[108] readerButtonSelected]
        || v2[97] == (id)2)
      {
        a1 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
      }
      else if (([v2[108] readerButtonSelected] & 1) != 0 || v2[97] == (id)1)
      {
        objc_msgSend(MEMORY[0x1E4F782F0], "readerImageWithSummary:usingMulticolorSymbol:", objc_msgSend(v2[51], "cumulativeOptions") & 1, 0);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F782F0], "pageMenuImageWithIntelligence:usingMulticolorSymbol:", (objc_msgSend(v2[51], "cumulativeOptions") & 0x1F) != 0, 0);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      a1 = [MEMORY[0x1E4F782F0] siriReaderPlayingImage];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateAccessoryButtonsAlpha
{
  if (a1)
  {
    [a1 _controlsAlpha];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48___SFNavigationBar__updateAccessoryButtonsAlpha__block_invoke;
    v4[3] = &unk_1E5C73448;
    v4[4] = a1;
    v4[5] = v2;
    double v3 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v4);
    v3[2](v3, 1);
    objc_msgSend(a1[92], "setAlpha:");
    v3[2](v3, 0);
    objc_msgSend(a1[93], "setAlpha:");
    v3[2](v3, 3);
    objc_msgSend(a1[95], "setAlpha:");
    v3[2](v3, 2);
    objc_msgSend(a1[91], "setAlpha:");
  }
}

- (char)_navigationBarTrailingButtonWithType:(char *)a1
{
  if (!a1)
  {
LABEL_7:
    return a1;
  }
  if (!a2)
  {
    double v3 = &OBJC_IVAR____SFNavigationBar__reloadButton;
    goto LABEL_6;
  }
  if (a2 == 1)
  {
    double v3 = &OBJC_IVAR____SFNavigationBar__stopButton;
LABEL_6:
    a1 = (char *)*(id *)&a1[*v3];
    goto LABEL_7;
  }
  a1 = 0;
  return a1;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBar;
  [(_SFNavigationBar *)&v3 tintColorDidChange];
  -[_SFNavigationBar _updateProgressViewFillColor]((uint64_t)self);
}

- (void)fluidProgressViewWillShowProgress:(id)a3
{
  -[_SFNavigationBar _viewToInsertProgressBarIn](self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addSubview:self->_progressView];
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
}

+ (double)separatorHeight
{
  return *(double *)&kSeparatorHeight;
}

- (void)_updateBackdropFrame
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 696) superview];

    if (v2 == (void *)a1)
    {
      [(id)a1 bounds];
      double v4 = v3;
      double v6 = v5;
      double v8 = fmax(*(double *)(a1 + 912), *(double *)(a1 + 928) - v7);
      CGFloat v10 = v9 - v8;
      CGFloat v11 = v7 + v8;
      objc_msgSend(*(id *)(a1 + 696), "setFrame:", v4, v9 - v8, v5, v7 + v8);
      double v12 = *(void **)(a1 + 704);
      v16.origin.x = v4;
      v16.origin.y = v10;
      v16.size.width = v6;
      v16.size.height = v11;
      double MaxY = CGRectGetMaxY(v16);
      double v14 = *(double *)&kSeparatorHeight;
      objc_msgSend(v12, "setFrame:", 0.0, MaxY, v6, v14);
    }
  }
}

- (uint64_t)_updateTextFieldFrame
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 680) bounds];
    double v3 = v2;
    double v5 = v4;
    [*(id *)(v1 + 680) center];
    double v7 = v6;
    double v9 = v8;
    CGFloat v10 = [*(id *)(v1 + 680) layer];
    [v10 anchorPoint];
    double v12 = v11;
    double v14 = v13;

    int v15 = *(void **)(v1 + 888);
    return objc_msgSend(v15, "setFrame:", v7 + 7.0 - v3 * v12, v9 - v5 * v14, v3 + -14.0, v5);
  }
  return result;
}

- (double)_textFieldTopMargin
{
  if (!a1) {
    return 0.0;
  }
  double v2 = [*(id *)(a1 + 888) font];
  [v2 lineHeight];

  objc_msgSend(*(id *)(a1 + 888), "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
  [*(id *)(a1 + 888) bounds];
  [*(id *)(a1 + 888) paddingBottom];

  _SFRoundFloatToPixels();
  return result;
}

- (void)layoutSubviews
{
  uint64_t v422 = *MEMORY[0x1E4F143B8];
  -[_SFNavigationBar _updateBackdropFrame]((uint64_t)self);
  p_uint64_t barMetrics = (uint64_t *)&self->_barMetrics;
  double v358 = -[SFNavigationBarMetrics urlOutlineHeight]((uint64_t)self->_barMetrics);
  double v340 = -[SFNavigationBarMetrics urlContainerTop]((uint64_t)self->_barMetrics);
  -[_SFNavigationBar _customButtonHorizontalPadding](self);
  double v357 = v4;
  int v5 = [(_SFNavigationBar *)self _sf_usesLeftToRightLayout];
  BOOL v366 = [(_SFNavigationBar *)self hasToolbar];
  [(_SFNavigationBar *)self bounds];
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  -[_SFNavigationBar _layoutBounds]((uint64_t)self);
  double v330 = v14;
  double v368 = *(double *)&kSeparatorHeight;
  double contentUnderStatusBarHeight = self->_contentUnderStatusBarHeight;
  double v377 = -[_SFNavigationBar _urlOutlineOriginY]((uint64_t)self);
  [(_SFNavigationBar *)self safeAreaInsets];
  double v16 = v15;
  double v18 = v17;
  double v372 = v9;
  CGFloat v373 = v7;
  v423.origin.CGFloat x = v7;
  v423.origin.double y = v9;
  double obj = v11;
  v423.size.double width = v11;
  double rect = v13;
  v423.size.double height = v13;
  CGRectGetWidth(v423);
  _SFRoundFloatToPixels();
  double v21 = fmax(v16, 20.0);
  p_usesNarrowLayout = &self->_usesNarrowLayout;
  double v23 = fmax(v18, 20.0);
  if (self->_usesNarrowLayout) {
    double v24 = v20;
  }
  else {
    double v24 = v23;
  }
  if (v5) {
    double v25 = v21;
  }
  else {
    double v25 = v20;
  }
  if (v5) {
    double v26 = v20;
  }
  else {
    double v26 = v24;
  }
  if (v5) {
    double v27 = v20;
  }
  else {
    double v27 = v21;
  }
  if (v5) {
    double v28 = v24;
  }
  else {
    double v28 = v20;
  }
  -[SFToolbarContainer setToolbarInsets:](self->_leadingToolbarContainer, v19, 0.0, v25, 0.0, v26);
  v381 = self;
  p_trailingToolbarContainer = &self->_trailingToolbarContainer;
  -[SFToolbarContainer setToolbarInsets:](self->_trailingToolbarContainer, v29, 0.0, v27, 0.0, v28);
  p_leadingToolbarContainer = &self->_leadingToolbarContainer;
  leadingToolbarContainer = self->_leadingToolbarContainer;
  BOOL v31 = *p_usesNarrowLayout;
  uint64_t v32 = -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*p_barMetrics);
  double v33 = -[SFToolbarContainer widthRangeUsingNarrowMetrics:compatibleWithTraitCollection:]((uint64_t)leadingToolbarContainer, v31, v32);

  uint64_t v34 = (uint64_t)*p_trailingToolbarContainer;
  BOOL v35 = *p_usesNarrowLayout;
  uint64_t v36 = -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*p_barMetrics);
  double v37 = -[SFToolbarContainer widthRangeUsingNarrowMetrics:compatibleWithTraitCollection:](v34, v35, v36);
  double v374 = v38;

  BOOL v39 = v366 && v381->_expanded && v381->_usesNarrowLayout;
  dismissButton = v381->_dismissButton;
  if (dismissButton)
  {
    [(SFDismissButton *)dismissButton frame];
    double v41 = v357 + CGRectGetWidth(v424);
  }
  else
  {
    double v41 = 0.0;
  }
  if (v381->_inputMode == 1) {
    goto LABEL_25;
  }
  long long v42 = [(_SFToolbar *)v381->_leadingToolbar items];
  uint64_t v43 = [v42 count];
  CATransform3D v44 = [(_SFToolbar *)v381->_trailingToolbar items];
  uint64_t v45 = [v44 count];

  if (v43 == v45)
  {
LABEL_25:
    double v46 = v37;
    double v47 = fmax(v33 + v41, v37);
    double v48 = v47 + v47;
  }
  else
  {
    double v46 = v37;
    double v48 = v37 + v33 + v41;
  }
  v425.origin.CGFloat x = v7;
  v425.origin.double y = v372;
  v425.size.double width = obj;
  v425.size.double height = rect;
  double v49 = CGRectGetWidth(v425) - v48 + -664.0;
  char v50 = v49 >= 0.0 || v39;
  if ((v50 & 1) == 0)
  {
    v426.origin.CGFloat x = v7;
    v426.origin.double y = v372;
    v426.size.double width = obj;
    v426.size.double height = rect;
    CGRectGetWidth(v426);
  }
  _SFRoundFloatToPixels();
  v418[0] = MEMORY[0x1E4F143A8];
  v418[1] = 3221225472;
  v418[2] = __34___SFNavigationBar_layoutSubviews__block_invoke;
  v418[3] = &__block_descriptor_48_e13_d24__0___dd_8l;
  *(double *)&v418[4] = v33 + v46;
  *(double *)&v418[5] = v49;
  _SFClamp();
  _SFRoundFloatToPixels();
  ((void (*)(void *, double, double))__34___SFNavigationBar_layoutSubviews__block_invoke)(v418, v46, v374);
  v51 = v381->_dismissButton;
  if (v51)
  {
    -[SFDismissButton sizeThatFits:](v51, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v356 = v52;
    double v361 = v53;
    double v363 = v357;
    if ((v5 & 1) == 0)
    {
      v427.origin.double y = v372;
      v427.origin.CGFloat x = v7;
      v427.size.double width = obj;
      v427.size.double height = rect;
      double v363 = CGRectGetWidth(v427) - v356 - v357;
    }
    double v359 = v358 * 0.5 + v377 - v361 * 0.5;
  }
  else
  {
    double v359 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v356 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v361 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v363 = *MEMORY[0x1E4F1DB20];
  }
  [(_SFToolbar *)v381->_leadingToolbar baselineOffsetAdjustment];
  if ((v5 & 1) != 0 || !v381->_dismissButton)
  {
    v429.origin.double y = v372;
    v429.origin.CGFloat x = v7;
    v429.size.double width = obj;
    v429.size.double height = rect;
    CGRectGetMaxX(v429);
  }
  else
  {
    v428.size.double height = v361;
    v428.origin.CGFloat x = v363;
    v428.origin.double y = v359;
    v428.size.double width = v356;
    CGRectGetMinX(v428);
  }
  _SFRoundRectToPixels();
  double v348 = v55;
  double v349 = v54;
  double v342 = v57;
  double v343 = v56;
  if (v5 && v381->_dismissButton)
  {
    v430.size.double height = v361;
    v430.origin.CGFloat x = v363;
    v430.origin.double y = v359;
    v430.size.double width = v356;
    CGRectGetMaxX(v430);
  }
  _SFRoundRectToPixels();
  double v350 = v59;
  double v351 = v58;
  double v344 = v61;
  double v345 = v60;
  -[SFDismissButton setFrame:](v381->_dismissButton, "setFrame:", v363, v359, v356, v361);
  double v62 = 0.0;
  if (!v381->_controlsHidden) {
    double v62 = 1.0;
  }
  [(UIView *)v381->_controlsContainer setAlpha:v62];
  -[UIView setFrame:](v381->_controlsContainer, "setFrame:", v7, v372, obj, rect);
  -[UIButton setFrame:](v381->_compressedBarButton, "setFrame:", v7, v372 - contentUnderStatusBarHeight, obj, rect + contentUnderStatusBarHeight + v368);
  v431.origin.double y = v372;
  v431.origin.CGFloat x = v7;
  v431.size.double width = obj;
  v431.size.double height = rect;
  CGRectGetHeight(v431);
  [(_SFNavigationBar *)v381 minimumHeight];
  [(UIButton *)v381->_compressedBarButton setUserInteractionEnabled:_SFEqualWithEpsilon()];
  id v63 = [(UIImageView *)v381->_lockView superview];

  if (v63) {
    -[_SFNavigationBar _updateLockViewIfNeeded]((uint64_t)v381);
  }
  long long v417 = 0u;
  long long v416 = 0u;
  long long v415 = 0u;
  long long v414 = 0u;
  v64 = v381->_URLAccessoryItems;
  uint64_t v65 = [(NSArray *)v64 countByEnumeratingWithState:&v414 objects:v421 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v415;
    double v67 = *MEMORY[0x1E4F1DB30];
    double v68 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v415 != v66) {
          objc_enumerationMutation(v64);
        }
        uint64_t v70 = *(void **)(*((void *)&v414 + 1) + 8 * i);
        v71 = [v70 view];
        uint64_t v72 = [v71 superview];
        if (v72)
        {
          v73 = [v70 view];
          objc_msgSend(v73, "sizeThatFits:", v67, v68);
          objc_msgSend(v70, "setSize:");
        }
        else
        {
          objc_msgSend(v70, "setSize:", v67, v68);
        }
      }
      uint64_t v65 = [(NSArray *)v64 countByEnumeratingWithState:&v414 objects:v421 count:16];
    }
    while (v65);

    double v74 = v381;
    if (!v381)
    {
      double v380 = 0.0;
      char v354 = 1;
      goto LABEL_62;
    }
  }
  else
  {

    double v74 = v381;
  }
  [(_SFNavigationBar *)v74 minimumHeight];
  double v76 = v75;
  [(_SFNavigationBar *)v381 bounds];
  char v354 = 0;
  double v380 = fmin(fmax((v77 - v76) / (v381->_maximumHeight - v76), 0.0), 1.0);
LABEL_62:
  if (!v39 && v366)
  {
    v432.origin.double y = v372;
    v432.origin.CGFloat x = v7;
    v432.size.double width = obj;
    v432.size.double height = rect;
    CGRectGetWidth(v432);
  }
  _SFRoundFloatToPixels();
  double v79 = v78;
  double v80 = obj - v78;
  double v81 = 0.0;
  double v375 = v80;
  if (v39)
  {
    double v82 = 0.0;
    double v352 = v80;
    double v353 = v79;
  }
  else
  {
    v83 = v381;
    double v82 = 0.0;
    double v352 = v80;
    double v353 = v79;
    if (v381->_inputMode == 1) {
      goto LABEL_73;
    }
    v433.origin.double y = v350;
    v433.origin.CGFloat x = v351;
    v433.size.double height = v344;
    v433.size.double width = v345;
    double MaxX = CGRectGetMaxX(v433);
    v434.origin.double y = v348;
    v434.origin.CGFloat x = v349;
    v434.size.double height = v342;
    v434.size.double width = v343;
    double MinX = CGRectGetMinX(v434);
    if (MaxX - v79 <= 0.0)
    {
      if (v375 - MinX > 0.0)
      {
        _SFInterpolate();
        double v82 = v87;
      }
    }
    else
    {
      _SFInterpolate();
      double v82 = -v86;
    }
    double v352 = v375 - v82;
    double v353 = v79 - v82;
  }
  v83 = v381;
LABEL_73:
  double v88 = 0.0;
  if (!v83->_expanded)
  {
    long long v413 = 0u;
    long long v412 = 0u;
    long long v411 = 0u;
    long long v410 = 0u;
    v89 = v83->_URLAccessoryItems;
    uint64_t v90 = [(NSArray *)v89 countByEnumeratingWithState:&v410 objects:v420 count:16];
    if (v90)
    {
      uint64_t v91 = *(void *)v411;
      do
      {
        for (uint64_t j = 0; j != v90; ++j)
        {
          if (*(void *)v411 != v91) {
            objc_enumerationMutation(v89);
          }
          id v93 = *(void **)(*((void *)&v410 + 1) + 8 * j);
          [v93 size];
          double v95 = v94;
          [v93 spacing];
          double v97 = v96;
          [v93 size];
          double v99 = v98;
          [v93 spacing];
          double v88 = v88 + (v95 + v97) / 0.7;
          double v81 = v81 + v99 + v100;
        }
        uint64_t v90 = [(NSArray *)v89 countByEnumeratingWithState:&v410 objects:v420 count:16];
      }
      while (v90);
    }

    v83 = v381;
  }
  int v101 = [(SFNavigationBarItem *)v83->_item showsSecurityAnnotation];
  uint64_t v102 = (uint64_t)v381;
  p_cachedSecurityAnnotationLabelFittingSize = &v381->_cachedSecurityAnnotationLabelFittingSize;
  BOOL v104 = v381->_cachedSecurityAnnotationLabelFittingSize.width == *MEMORY[0x1E4F1DB30]
      && v381->_cachedSecurityAnnotationLabelFittingSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v104)
  {
    -[UILabel sizeThatFits:](v381->_securityAnnotationLabel, "sizeThatFits:");
    p_cachedSecurityAnnotationLabelFittingSize = &v381->_cachedSecurityAnnotationLabelFittingSize;
    v381->_cachedSecurityAnnotationLabelFittingSize.double width = v105;
    v381->_cachedSecurityAnnotationLabelFittingSize.double height = v106;
    uint64_t v102 = (uint64_t)v381;
  }
  double v107 = 0.0;
  if (v101) {
    double v107 = 4.0;
  }
  double v339 = v107;
  p_double width = &p_cachedSecurityAnnotationLabelFittingSize->width;
  if (!v101) {
    p_cachedSecurityAnnotationLabelFittingSize = (CGSize *)MEMORY[0x1E4F1DB30];
  }
  double width = p_cachedSecurityAnnotationLabelFittingSize->width;
  double height = p_cachedSecurityAnnotationLabelFittingSize->height;
  int v338 = -[_SFNavigationBar _showsPrivateAnnotation](v102);
  double v337 = -[_SFNavigationBar _privateBrowsingLabelRevealPercent]((double *)v381);
  double v108 = 0.0;
  double v109 = 0.0;
  if (v338)
  {
    [(UILabel *)v381->_privateBrowsingLabel bounds];
    double v109 = CGRectGetWidth(v435) + 4.0;
  }
  double v336 = v109;
  double sx = v380 * 0.3 + 0.7;
  double v335 = v339 + width;
  if (v380 < 1.0)
  {
    [(SFURLLabel *)v381->_URLLabel urlSize];
    double v110 = obj * 0.5;
    double v111 = obj * 0.5 - v79;
    double v113 = fmin(v79 + (v111 + 1.0) / 0.7, (v88 + v335 + v336 + v112) * 0.5 + 7.0);
    if (v113 > v111)
    {
      double v114 = (1.0 - sx) * 0.7;
      double v115 = v111 + v114 * (v113 - v111) / (sx * 0.3);
      double v116 = fmax(v82, 0.0);
      double v117 = v116 + v114 * (fmin(v82, 0.0) - v116) / (sx * 0.3);
      double v352 = v110 + v115 - v117;
      double v353 = v110 - v115 - v117;
    }
    double v118 = v110 + (v113 + -7.0 - v88) * -0.7;
    _SFRoundFloatToPixels();
    double v108 = v119 - v118;
  }
  _SFRoundRectToPixels();
  CGFloat v369 = v436.size.width;
  CGFloat x = v436.origin.x;
  double v376 = v436.size.height;
  double y = v436.origin.y;
  double v332 = CGRectGetWidth(v436);
  if (v381->_usesNarrowLayout)
  {
    v120 = v381;
    if (v381->_expanded)
    {
      double v121 = v357 + v381->_cancelButtonIntrinsicWidth;
      if (v5)
      {
LABEL_101:
        double v122 = v330 - v121;
        double cancelButtonIntrinsicWidth = v120->_cancelButtonIntrinsicWidth;
LABEL_109:
        -[UIButton setFrame:](v120->_cancelButton, "setFrame:", v122, y, cancelButtonIntrinsicWidth, v376);
        goto LABEL_110;
      }
    }
    else if (v366)
    {
      p_leadingToolbar = (id *)&v381->_leadingToolbar;
      if (v5) {
        p_leadingToolbar = (id *)&v381->_trailingToolbar;
      }
      v125 = [*p_leadingToolbar items];
      if ([v125 count]) {
        double v121 = v357 + v381->_cancelButtonIntrinsicWidth;
      }
      else {
        double v121 = v79 - v357;
      }

      v120 = v381;
      if (v5) {
        goto LABEL_101;
      }
    }
    else
    {
      double v121 = v79 - v357;
      if (v5) {
        goto LABEL_101;
      }
    }
    double cancelButtonIntrinsicWidth = v120->_cancelButtonIntrinsicWidth;
    double v122 = v121 - cancelButtonIntrinsicWidth;
    goto LABEL_109;
  }
LABEL_110:
  _SFRoundFloatToPixels();
  double v127 = v126;
  memset(&v408, 0, sizeof(v408));
  uint64_t barMetrics = (uint64_t)v381->_barMetrics;
  uint64_t v129 = [(id)objc_opt_class() _metricsCategory];
  -[SFNavigationBarMetrics squishHeightQuantizationOffsetWithBarMetricsCategory:](barMetrics, v129);
  _SFRoundFloatToPixels();
  CGAffineTransformMakeTranslation(&v408, (1.0 - v380) * v108, (1.0 - v380) * (v127 + v340 * -0.7 - v130));
  CGAffineTransform v406 = v408;
  CGAffineTransformScale(&v407, &v406, sx, sx);
  CGAffineTransform v408 = v407;
  CGAffineTransform v409 = v407;
  CGAffineTransform v405 = v407;
  [(_SFNavigationBarURLButton *)v381->_URLOutline setTransform:&v405];
  _SFRoundRectToPixels();
  -[_SFNavigationBarURLButton ss_setUntransformedFrame:](v381->_URLOutline, "ss_setUntransformedFrame:");
  v131 = v381;
  if (v381->_dismissButton)
  {
    [(_SFNavigationBar *)v381 _controlsAlpha];
    -[SFDismissButton setAlpha:](v381->_dismissButton, "setAlpha:");
    v437.size.double height = v361;
    v437.origin.CGFloat x = v363;
    v437.origin.double y = v359;
    v437.size.double width = v356;
    double v132 = v363;
    double v133 = v359;
    if (CGRectGetWidth(v437) != 0.0)
    {
      v438.origin.double y = v372;
      v438.origin.CGFloat x = v373;
      v438.size.double width = obj;
      v438.size.double height = rect;
      double v134 = CGRectGetWidth(v438);
      v439.size.double height = v361;
      v439.origin.CGFloat x = v363;
      v439.origin.double y = v359;
      v439.size.double width = v356;
      double v135 = CGRectGetMinX(v439);
      v440.size.double height = v361;
      v440.origin.CGFloat x = v363;
      v440.origin.double y = v359;
      v440.size.double width = v356;
      double v132 = (v134 * 0.5 - v135) / CGRectGetWidth(v440);
      double v133 = 0.0;
    }
    v136 = [(SFDismissButton *)v381->_dismissButton layer];
    objc_msgSend(v136, "setAnchorPoint:", v132, v133);

    CGAffineTransform v404 = v409;
    [(SFDismissButton *)v381->_dismissButton setTransform:&v404];
    -[SFDismissButton ss_setUntransformedFrame:](v381->_dismissButton, "ss_setUntransformedFrame:", v363, v359, v356, v361);
    v131 = v381;
  }
  if (v366)
  {
    v137 = (id *)p_leadingToolbarContainer;
    if (!v5) {
      v137 = (id *)p_trailingToolbarContainer;
    }
    id v138 = *v137;
    v441.origin.double y = v350;
    v441.origin.CGFloat x = v351;
    v441.size.double height = v344;
    v441.size.double width = v345;
    double v140 = v350;
    double v139 = v351;
    if (CGRectGetWidth(v441) != 0.0)
    {
      v442.origin.double y = v372;
      v442.origin.CGFloat x = v373;
      v442.size.double width = obj;
      v442.size.double height = rect;
      double v141 = CGRectGetWidth(v442);
      v443.origin.double y = v350;
      v443.origin.CGFloat x = v351;
      v443.size.double height = v344;
      v443.size.double width = v345;
      double v142 = CGRectGetMinX(v443);
      v444.origin.double y = v350;
      v444.origin.CGFloat x = v351;
      v444.size.double height = v344;
      v444.size.double width = v345;
      double v139 = (v141 * 0.5 - v142) / CGRectGetWidth(v444);
      double v140 = 0.0;
    }
    v143 = [v138 layer];
    objc_msgSend(v143, "setAnchorPoint:", v139, v140);

    CGAffineTransform v403 = v409;
    [v138 setTransform:&v403];
    objc_msgSend(v138, "ss_setUntransformedFrame:", v351, v350, v345, v344);
    v144 = (id *)p_leadingToolbarContainer;
    if (v5) {
      v144 = (id *)p_trailingToolbarContainer;
    }
    id v145 = *v144;
    v445.origin.double y = v348;
    v445.origin.CGFloat x = v349;
    v445.size.double height = v342;
    v445.size.double width = v343;
    double v147 = v348;
    double v146 = v349;
    if (CGRectGetWidth(v445) != 0.0)
    {
      v446.origin.double y = v372;
      v446.origin.CGFloat x = v373;
      v446.size.double width = obj;
      v446.size.double height = rect;
      double v148 = CGRectGetWidth(v446);
      v447.origin.double y = v348;
      v447.origin.CGFloat x = v349;
      v447.size.double height = v342;
      v447.size.double width = v343;
      double v149 = CGRectGetMinX(v447);
      v448.origin.double y = v348;
      v448.origin.CGFloat x = v349;
      v448.size.double height = v342;
      v448.size.double width = v343;
      double v146 = (v148 * 0.5 - v149) / CGRectGetWidth(v448);
      double v147 = 0.0;
    }
    v150 = [v145 layer];
    objc_msgSend(v150, "setAnchorPoint:", v146, v147);

    CGAffineTransform v402 = v409;
    [v145 setTransform:&v402];
    objc_msgSend(v145, "ss_setUntransformedFrame:", v349, v348, v343, v342);

    v131 = v381;
  }
  double v151 = 0.0;
  if ((v354 & 1) == 0 && v131->_inputMode != 1)
  {
    SFBarBackgroundAlphaForSquishTransformFactor();
    v131 = v381;
  }
  URLOutline = (double *)v131->_URLOutline;
  if (URLOutline && URLOutline[101] != v151)
  {
    URLOutline[101] = v151;
    -[_SFNavigationBarURLButton _updateBackgroundImageAnimated:](URLOutline, 0);
    v131 = v381;
  }
  p_BOOL expanded = &v131->_expanded;
  double v154 = 0.0;
  if (v131->_expanded) {
    double v155 = 0.0;
  }
  else {
    double v155 = 1.0;
  }
  scaleView(v131->_reloadButton, v155);
  if (*p_expanded) {
    double v156 = 0.0;
  }
  else {
    double v156 = 1.0;
  }
  scaleView(v381->_stopButton, v156);
  double v157 = 0.0;
  if (!*p_expanded) {
    double v157 = 1.0;
  }
  scaleView(v381->_mediaStateMuteButton, v157);
  uint64_t v158 = [(_SFNavigationBar *)v381 effectiveUserInterfaceLayoutDirection];
  if (v381->_inputMode == 1)
  {
    if (v366)
    {
      v449.origin.double y = v350;
      v449.origin.CGFloat x = v351;
      v449.size.double height = v344;
      v449.size.double width = v345;
      double v159 = CGRectGetMaxX(v449);
      v450.size.double width = v369;
      v450.origin.CGFloat x = x;
      v450.size.double height = v376;
      v450.origin.double y = y;
      double v154 = v159 - CGRectGetMinX(v450);
    }
    else if (v5)
    {
      v451.size.double height = v361;
      v451.origin.CGFloat x = v363;
      v451.origin.double y = v359;
      v451.size.double width = v356;
      double v154 = v357 + CGRectGetWidth(v451);
    }
  }
  v406.a = 0.0;
  *(void *)&v406.b = &v406;
  *(void *)&v406.c = 0x2020000000;
  v406.d = 0.0;
  uint64_t accessoryButtonArrangement = (uint64_t)v381->_accessoryButtonArrangement;
  v401[0] = MEMORY[0x1E4F143A8];
  v401[1] = 3221225472;
  v401[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_2;
  v401[3] = &unk_1E5C73490;
  v401[4] = v381;
  v401[5] = &v406;
  *(double *)&v401[6] = v154;
  *(double *)&v401[7] = v358;
  -[SFNavigationBarAccessoryButtonArrangement enumerateButtonTypesFromEdge:withLayoutDirection:usingBlock:](accessoryButtonArrangement, 2, v158, v401);
  double v161 = *(double *)(*(void *)&v406.b + 24);
  if (v161 != 0.0)
  {
    unint64_t inputMode = v381->_inputMode;
    if (inputMode) {
      goto LABEL_147;
    }
    *(double *)(*(void *)&v406.b + 24) = fmax(v154 + v161, 0.0);
  }
  unint64_t inputMode = v381->_inputMode;
LABEL_147:
  double v163 = 0.0;
  if (inputMode == 1)
  {
    if (v366)
    {
      v452.origin.double y = v348;
      v452.origin.CGFloat x = v349;
      v452.size.double height = v342;
      v452.size.double width = v343;
      double v164 = CGRectGetMinX(v452);
      v453.size.double width = v369;
      v453.origin.CGFloat x = x;
      v453.size.double height = v376;
      v453.origin.double y = y;
      double v163 = v164 - CGRectGetMaxX(v453);
    }
    else if ((v5 & 1) == 0)
    {
      v454.size.double height = v361;
      v454.origin.CGFloat x = v363;
      v454.origin.double y = v359;
      v454.size.double width = v356;
      double v163 = v357 + CGRectGetWidth(v454);
    }
  }
  uint64_t v397 = 0;
  v398 = (double *)&v397;
  uint64_t v399 = 0x2020000000;
  uint64_t v400 = 0;
  uint64_t v165 = (uint64_t)v381->_accessoryButtonArrangement;
  v396[0] = MEMORY[0x1E4F143A8];
  v396[1] = 3221225472;
  v396[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_3;
  v396[3] = &unk_1E5C734B8;
  *(CGFloat *)&v396[6] = x;
  *(double *)&v396[7] = y;
  *(CGFloat *)&v396[8] = v369;
  *(double *)&v396[9] = v376;
  v396[4] = v381;
  v396[5] = &v397;
  *(double *)&v396[10] = v163;
  *(double *)&v396[11] = v358;
  -[SFNavigationBarAccessoryButtonArrangement enumerateButtonTypesFromEdge:withLayoutDirection:usingBlock:](v165, 8, v158, v396);
  double v166 = v398[3];
  if (v166 != 0.0) {
    v398[3] = fmax(v166 - v163, 0.0);
  }
  [(_SFDimmingButton *)v381->_reloadButton ss_untransformedFrame];
  -[_SFDimmingButton ss_setUntransformedFrame:](v381->_stopButton, "ss_setUntransformedFrame:");
  -[_SFNavigationBar _updateToolbarAndCancelButtonAlpha]((id *)&v381->super.super.super.isa);
  [(_SFNavigationBar *)v381 _controlsAlpha];
  double v168 = v167;
  v395[0] = MEMORY[0x1E4F143A8];
  v395[1] = 3221225472;
  v395[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_4;
  v395[3] = &unk_1E5C724D8;
  v395[4] = v381;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v395];
  if (v381->_unifiedFieldShowsProgressView)
  {
    [(_SFNavigationBarURLButton *)v381->_URLOutline bounds];
    double v170 = v169;
    double v172 = v171;
    double v174 = v173;
    double v176 = v175;
    [(_SFFluidProgressView *)v381->_progressView setAlpha:v168];
  }
  else
  {
    v177 = [(_SFFluidProgressView *)v381->_progressView progressBarFillColor];
    v178 = [MEMORY[0x1E4FB1618] whiteColor];
    double v179 = 0.0;
    if ([v177 isEqual:v178])
    {
      _SFOnePixel();
      double v179 = v180;
    }

    [MEMORY[0x1E4F78588] defaultHeight];
    double v176 = v181;
    v455.origin.double y = v372;
    v455.origin.CGFloat x = v373;
    v455.size.double width = obj;
    v455.size.double height = rect;
    double MaxY = CGRectGetMaxY(v455);
    [(_SFFluidProgressView *)v381->_progressView setAlpha:1.0];
    double v172 = MaxY - v176 - v179;
    double v170 = 0.0;
    double v174 = obj;
  }
  -[_SFFluidProgressView setFrame:](v381->_progressView, "setFrame:", v170, v172, v174, v176);
  double v183 = *(double *)(*(void *)&v406.b + 24);
  double v184 = v398[3];
  -[_SFNavigationBar _updateTextFieldFrame]((uint64_t)v381);
  double v360 = v380 * v183;
  double v362 = v380 * v184;
  if (v381->_expanded)
  {
    id v185 = (id)[(UITextField *)v381->_textField _clearButton];
    v186 = [(SFNavigationBarItem *)v381->_item textWhenExpanded];
    if ([v186 length])
    {
      [(UITextField *)v381->_textField clearButtonRect];
      double v188 = v187 + 8.0;
    }
    else
    {
      double v188 = 0.0;
    }

    uint64_t v192 = [(UITextField *)v381->_textField effectiveUserInterfaceLayoutDirection];
    CGFloat v191 = x;
    if (v192) {
      double v190 = 0.0;
    }
    else {
      double v190 = v188 + 7.0;
    }
    if (v192) {
      double v189 = v188 + 7.0;
    }
    else {
      double v189 = 0.0;
    }
  }
  else
  {
    double v189 = v380 * v183 + 0.0;
    double v190 = v380 * v184 + 0.0;
    CGFloat v191 = x;
  }
  char v193 = v366;
  if (v381->_inputMode != 1) {
    char v193 = 1;
  }
  if ((v193 & 1) == 0)
  {
    [(SFDismissButton *)v381->_dismissButton bounds];
    double v194 = v357 + CGRectGetWidth(v456);
    double v195 = v189 + v194 * v380;
    double v196 = v190 + v194 * v380;
    if (v5) {
      double v189 = v195;
    }
    else {
      double v190 = v196;
    }
  }
  v457.origin.CGFloat x = v191;
  v457.origin.double y = y;
  v457.size.double width = v369;
  v457.size.double height = v376;
  double v197 = CGRectGetWidth(v457);
  v458.origin.CGFloat x = v191;
  v458.origin.double y = y;
  v458.size.double width = v369;
  v458.size.double height = v376;
  double v198 = CGRectGetHeight(v458);
  double v199 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v200 = v197 - v189 - v190;
  -[UIView setFrame:](v381->_URLContainerClipView, "setFrame:", v189, v199, v200, v198);
  v459.size.double width = v369;
  v459.origin.CGFloat x = x;
  v459.size.double height = v376;
  v459.origin.double y = y;
  CGRectGetHeight(v459);
  -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom]((uint64_t)v381->_barMetrics);
  [(SFURLLabel *)v381->_URLLabel baselineOffsetFromBottom];
  [(SFURLLabel *)v381->_URLLabel urlSize];
  _SFRoundFloatToPixels();
  double v202 = v201;
  v460.origin.CGFloat x = v189;
  v460.origin.double y = v199;
  v460.size.double width = v200;
  v460.size.double height = v198;
  double v203 = CGRectGetWidth(v460);
  [(SFURLLabel *)v381->_URLLabel urlSize];
  -[UIView ss_setUntransformedFrame:](v381->_URLContainer, "ss_setUntransformedFrame:", 0.0, v202, v203, v204);
  double v205 = 0.91;
  if (!v381->_controlsHidden) {
    double v205 = 1.0;
  }
  CGAffineTransformMakeScale(&v394, v205, v205);
  URLContainer = v381->_URLContainer;
  CGAffineTransform v393 = v394;
  [(UIView *)URLContainer setTransform:&v393];
  double v207 = rect;
  if (v354)
  {
    double v209 = 0.0;
  }
  else if (v381->_usesNarrowLayout)
  {
    double v208 = -[SFNavigationBarMetrics narrowEditingScaleFactor]((uint64_t)v381->_barMetrics);
    double v207 = rect;
    double v209 = v208;
  }
  else
  {
    double v209 = 1.0;
  }
  v390[0] = MEMORY[0x1E4F143A8];
  v390[1] = 3221225472;
  v390[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_5;
  v390[3] = &unk_1E5C73508;
  char v392 = v5;
  *(double *)&v390[5] = width;
  *(double *)&v390[6] = height;
  *(double *)&v390[7] = v339;
  *(double *)&v390[8] = v337 * v336;
  v390[4] = v381;
  *(CGFloat *)&v390[9] = v373;
  *(double *)&v390[10] = v372;
  *(double *)&v390[11] = obj;
  *(double *)&v390[12] = v207;
  *(double *)&v390[13] = v335 + v337 * v336;
  *(double *)&v390[14] = v81;
  double v355 = v209;
  *(double *)&v390[15] = v209;
  *(double *)&v390[16] = v380;
  CGAffineTransform v391 = v409;
  v364 = (void (**)(void))MEMORY[0x1AD0C36A0](v390);
  v210 = [(UIImageView *)v381->_lockView superview];

  if (v210)
  {
    v211 = -[_SFNavigationBar _lockImageTintColorForSquishTransformFactor:](v381);
    [(UIImageView *)v381->_lockView setTintColor:v211];
    [(UIImageView *)v381->_squishedLockView setTintColor:v211];
  }
  v212 = [(UIImageView *)v381->_searchIndicator superview];

  if (v212)
  {
    v213 = -[_SFNavigationBar _searchIndicatorColorForSquishTransformFactor:]((id *)&v381->super.super.super.isa);
    [(UIImageView *)v381->_searchIndicator setTintColor:v213];
    [(UIImageView *)v381->_squishedSearchIndicator setTintColor:v213];
  }
  uint64_t v214 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v381->_shouldAnimateURLMovement];
  v364[2]();
  [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v214];
  [(UILabel *)v381->_securityAnnotationLabel setHidden:v101 ^ 1u];
  if (v101)
  {
    v215 = v381;
    if (v5)
    {
      double v216 = *MEMORY[0x1E4F1DAD8];
      double v217 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v218 = width;
      double v219 = height;
    }
    else
    {
      [(SFURLLabel *)v381->_URLLabel frame];
      double v218 = width;
      double v219 = height;
      double v216 = CGRectGetWidth(v462) + 4.0;
      double v217 = 0.0;
    }
    double v225 = (v358 - v219) * 0.5;
    -[UIView setFrame:](v381->_securityAnnotationContainer, "setFrame:", v216, v217 - v225, v218, v219 + v358 - v219);
    -[UILabel setFrame:](v381->_securityAnnotationLabel, "setFrame:", 0.0, v225, v218, v219);
  }
  else
  {
    double v220 = *p_width;
    double v221 = p_width[1];
    v215 = v381;
    [(SFURLLabel *)v381->_URLLabel frame];
    double v222 = CGRectGetWidth(v461);
    double v223 = -v220;
    if (!v5) {
      double v223 = v220 + v222;
    }
    -[UIView setFrame:](v381->_securityAnnotationContainer, "setFrame:", v223, 0.0, v220, v221);
    double v224 = -v222 - v220;
    if (v5) {
      double v224 = v220 + v222;
    }
    -[UILabel setFrame:](v381->_securityAnnotationLabel, "setFrame:", v224, 0.0, v220, v221);
  }
  [(UILabel *)v215->_availabilityLabel alpha];
  BOOL v104 = v226 == 0.0;
  double v227 = 0.0;
  if (v104) {
    double v227 = v337;
  }
  [(UILabel *)v215->_privateBrowsingLabel setAlpha:v227];
  if (v338)
  {
    [(SFURLLabel *)v381->_URLLabel urlSize];
    double v229 = v228;
    [(UILabel *)v381->_privateBrowsingLabel bounds];
    double v230 = CGRectGetWidth(v463) * 0.5 + 4.0;
    [(SFURLLabel *)v381->_URLLabel frame];
    if (v5) {
      double v235 = v230 + CGRectGetMaxX(*(CGRect *)&v231);
    }
    else {
      double v235 = CGRectGetMinX(*(CGRect *)&v231) - v230 - v81;
    }
    -[UILabel setPosition:](v381->_privateBrowsingLabel, "setPosition:", v235, v229 * 0.5);
  }
  v236 = v381;
  if (v381->_expanded)
  {
    [(UILabel *)v381->_availabilityLabel setAlpha:0.0];
    [(UILabel *)v381->_availabilityLabel removeFromSuperview];
    v237 = -[_SFNavigationBar _formatToggleButtonImage]((id *)&v381->super.super.super.isa);
    [(SFNavigationBarToggleButton *)v381->_formatToggleButton setImage:v237];

    v236 = v381;
    [(SFNavigationBarToggleButton *)v381->_formatToggleButton setHighlightsBackground:0];
    v381->_int64_t formatButtonTapAction = 0;
    [(SFNavigationBarToggleButton *)v381->_formatToggleButton setAccessibilityIdentifier:@"PageFormatMenuButton"];
  }
  [(SFDismissButton *)v236->_dismissButton frame];
  double v238 = CGRectGetWidth(v464);
  double v239 = v238;
  int v240 = v381->_inputMode != 1 || v366;
  double v241 = v380 * (v357 + v238);
  if (v240) {
    double v241 = 0.0;
  }
  if (v5) {
    double v242 = v241;
  }
  else {
    double v242 = 0.0;
  }
  if (v5) {
    double v243 = 0.0;
  }
  else {
    double v243 = v241;
  }
  [(SFURLLabel *)v381->_URLLabel frame];
  double v244 = CGRectGetWidth(v465);
  if (v354)
  {
    double v255 = 0.0;
  }
  else
  {
    double v245 = v360 + 7.0 + v242;
    double v246 = v352 - v353 - (v362 + 7.0 + v243);
    double v247 = v335 + v337 * v336 + v81 + v244;
    double v248 = (v352 - v353 - v247) * 0.5;
    double v249 = v247 + v248;
    double v250 = v249 - v246;
    BOOL v251 = v249 <= v246;
    double v252 = 0.0;
    if (!v251) {
      double v252 = v250;
    }
    double v253 = v248 - v252;
    double v254 = v245 - v253;
    if (v253 >= v245) {
      double v254 = -0.0;
    }
    double v255 = v253 + v254;
  }
  BOOL expanded = v381->_expanded;
  v257 = [(_SFNavigationBarLabelsContainer *)v381->_labelsContainer layer];
  v258 = v257;
  double v259 = 0.0;
  if (!expanded) {
    double v259 = 1.0;
  }
  objc_msgSend(v257, "setAnchorPoint:", v259, 0.0);

  v466.size.double width = v369;
  v466.origin.CGFloat x = x;
  v466.size.double height = v376;
  v466.origin.double y = y;
  double v260 = CGRectGetWidth(v466);
  [(UIView *)v381->_URLContainerClipView frame];
  double v261 = CGRectGetMinX(v467);
  BOOL v262 = v381->_expanded;
  v263 = [(_SFNavigationBarLabelsContainer *)v381->_labelsContainer layer];
  v264 = v263;
  double v265 = v260 * 0.5 - v261 + -7.0;
  if (v262) {
    double v265 = 0.0;
  }
  [v263 setPosition:v265];

  v468.size.double width = v369;
  v468.origin.CGFloat x = x;
  v468.size.double height = v376;
  v468.origin.double y = y;
  double v266 = CGRectGetWidth(v468);
  [(SFURLLabel *)v381->_URLLabel urlSize];
  double v268 = v267;
  double v269 = fmax(v266 * 0.5 - (v81 + v255), 0.0);
  if (v380 >= 1.0)
  {
    _SFRoundFloatToPixels();
    double v269 = v270;
  }
  -[_SFNavigationBarLabelsContainer setBounds:](v381->_labelsContainer, "setBounds:", 0.0, 0.0, v269, v268);
  char v271 = v366;
  if (v381->_inputMode != 1) {
    char v271 = 1;
  }
  double v272 = *(double *)(*(void *)&v406.b + 24);
  if (v271)
  {
    double v273 = v398[3];
  }
  else
  {
    double v274 = 0.0;
    if (v5) {
      double v275 = v239;
    }
    else {
      double v275 = 0.0;
    }
    double v272 = v275 + v272;
    if (!v5) {
      double v274 = v239;
    }
    double v273 = v274 + v398[3];
  }
  double v276 = fmax(v272, v273);
  [(UILabel *)v381->_availabilityLabel sizeToFit];
  [(UILabel *)v381->_availabilityLabel frame];
  CGFloat v365 = v277;
  CGFloat v367 = v278;
  CGFloat v280 = v279;
  labelsContainer = v381->_labelsContainer;
  [(_SFNavigationBarURLButton *)v381->_URLOutline bounds];
  -[_SFNavigationBarLabelsContainer convertRect:fromView:](labelsContainer, "convertRect:fromView:", v381->_URLOutline);
  CGFloat v282 = v469.origin.x;
  CGFloat v283 = v469.origin.y;
  CGFloat v284 = v469.size.width;
  CGFloat v285 = v469.size.height;
  double MidX = CGRectGetMidX(v469);
  CGFloat v287 = v332 + v276 * -2.0 * v380;
  v470.origin.CGFloat x = v280;
  v470.origin.double y = v365;
  v470.size.double height = v367;
  v470.size.double width = v287;
  double v288 = CGRectGetWidth(v470);
  v471.origin.CGFloat x = v282;
  v471.origin.double y = v283;
  v471.size.double width = v284;
  v471.size.double height = v285;
  CGRectGetMidY(v471);
  v472.origin.CGFloat x = MidX + v288 * -0.5;
  v472.origin.double y = v365;
  v472.size.double height = v367;
  v472.size.double width = v287;
  CGRectGetHeight(v472);
  _SFRoundRectToPixels();
  -[UILabel setFrame:](v381->_availabilityLabel, "setFrame:");
  if (v381->_expanded)
  {
    double v289 = -[_SFNavigationBar _textFieldTopMargin]((uint64_t)v381);
    -[UIView convertPoint:toView:](v381->_labelScalingContainer, "convertPoint:toView:", v381->_textField, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v291 = v290;
    [(UIView *)v381->_labelScalingContainer center];
    double v293 = v289 - v291 + v292;
  }
  else
  {
    double v293 = 0.0;
  }
  -[UIView setPosition:](v381->_labelScalingContainer, "setPosition:", 7.0, v293);
  double v294 = 1.0;
  if (v381->_expanded) {
    double v294 = v355;
  }
  scaleView(v381->_labelScalingContainer, v294);
  if (v381->_fakeTextFieldSelectionView || v381->_fakeClearButton) {
    -[_SFNavigationBar _updateFakeViews]((uint64_t)v381);
  }
  BOOL v295 = [(_SFBarTheme *)v381->_effectiveTheme backdropIsDark];
  if (v295 != [(_SFNavigationBarTheme *)v381->_effectiveTheme platterBackdropIsDark]) {
    -[_SFNavigationBar _updateTextColor]((uint64_t)v381);
  }
  [(SFLockdownStatusBar *)v381->_lockdownStatusBar titleCapHeightInsetFromTop];
  _SFRoundFloatToPixels();
  double v297 = v296;
  v473.size.double width = v369;
  v473.origin.CGFloat x = x;
  v473.size.double height = v376;
  v473.origin.double y = y;
  double v298 = CGRectGetMaxY(v473);
  double v299 = -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom]((uint64_t)v381->_barMetrics);
  v474.origin.double y = v372;
  v474.origin.CGFloat x = v373;
  v474.size.double width = obj;
  v474.size.double height = rect;
  double v300 = CGRectGetWidth(v474);
  if (v354)
  {
    double v302 = 0.0;
  }
  else
  {
    [(SFLockdownStatusBar *)v381->_lockdownStatusBar preferredSize];
    double v302 = v301;
  }
  -[SFLockdownStatusBar ss_setUntransformedFrame:](v381->_lockdownStatusBar, "ss_setUntransformedFrame:", 0.0, v297 + v298 - v299, v300, v302);
  memset(&v408, 0, sizeof(v408));
  double v303 = -[_SFNavigationBar _auxiliaryBarSquishedVerticalOffsetForSquishTransform:]((uint64_t)v381);
  CGAffineTransformMakeTranslation(&v408, 0.0, -v303);
  CGAffineTransform v407 = v408;
  CGAffineTransformScale(&v389, &v407, sx, sx);
  lockdownStatusBar = v381->_lockdownStatusBar;
  CGAffineTransform v388 = v389;
  [(SFLockdownStatusBar *)lockdownStatusBar setTransform:&v388];
  long long v386 = 0u;
  long long v387 = 0u;
  long long v384 = 0u;
  long long v385 = 0u;
  id obja = v381->_URLAccessoryItems;
  uint64_t v305 = [(NSArray *)obja countByEnumeratingWithState:&v384 objects:v419 count:16];
  if (v305)
  {
    uint64_t v306 = *(void *)v385;
    double v307 = *MEMORY[0x1E4F1DB28];
    do
    {
      for (uint64_t k = 0; k != v305; ++k)
      {
        if (*(void *)v385 != v306) {
          objc_enumerationMutation(obja);
        }
        v309 = *(void **)(*((void *)&v384 + 1) + 8 * k);
        v310 = [v309 squishedView];
        uint64_t v311 = [v309 squishedEffectView];
        v312 = (void *)v311;
        if (v311) {
          v313 = (void *)v311;
        }
        else {
          v313 = v310;
        }
        id v314 = v313;
        v315 = [v310 image];
        v316 = [v310 preferredSymbolConfiguration];
        v317 = [v315 imageWithSymbolConfiguration:v316];
        [v317 size];
        double v319 = v318;
        double v321 = v320;

        objc_msgSend(v314, "setBounds:", v307, v199, v319, v321);
        v322 = [v309 view];
        v323 = [v314 superview];
        [v322 center];
        double v325 = v324;
        double v327 = v326;
        v328 = [v322 superview];
        objc_msgSend(v323, "convertPoint:fromView:", v328, v325, v327);
        objc_msgSend(v314, "setCenter:");

        [v314 frame];
        _SFRoundRectToPixels();
        objc_msgSend(v314, "setFrame:");
        if (v312)
        {
          [v312 bounds];
          objc_msgSend(v310, "setFrame:");
        }
      }
      uint64_t v305 = [(NSArray *)obja countByEnumeratingWithState:&v384 objects:v419 count:16];
    }
    while (v305);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v381->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarDidLayoutSubviews:v381];
  }

  _Block_object_dispose(&v397, 8);
  _Block_object_dispose(&v406, 8);
}

- (double)_layoutBounds
{
  if (a1)
  {
    [(id)a1 bounds];
    double v2 = [(id)a1 window];
    double v3 = [v2 windowScene];
    double v4 = [v3 statusBarManager];
    if (([v4 isStatusBarHidden] & 1) == 0 && *(double *)(a1 + 912) != 0.0) {
      _SFDeviceStatusBarHasNonTransparentBackground();
    }

    uint64_t v5 = *(void *)(a1 + 632);
    uint64_t v6 = [(id)objc_opt_class() _metricsCategory];
    -[SFNavigationBarMetrics barHeightWithBarMetricsCategory:](v5, v6);
  }
  return 0.0;
}

- (uint64_t)_updateLockViewIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 816))
    {
      *(unsigned char *)(result + 816) = 0;
      [*(id *)(result + 848) intrinsicContentSize];
      double v3 = v2;
      double v5 = v4;
      uint64_t v6 = -[SFNavigationBarMetrics accessoryImageSymbolConfiguration](*(void **)(v1 + 632));
      [*(id *)(v1 + 848) setPreferredSymbolConfiguration:v6];

      double v7 = -[SFNavigationBarMetrics squishedAccessoryImageSymbolConfiguration](*(void **)(v1 + 632));
      [*(id *)(v1 + 840) setPreferredSymbolConfiguration:v7];

      double result = [*(id *)(v1 + 848) intrinsicContentSize];
      if (v3 != v9 || v5 != v8)
      {
        return [(id)v1 setNeedsLayout];
      }
    }
  }
  return result;
}

- (id)_viewForAccessoryButtonType:(uint64_t)a1
{
  id v4 = 0;
  if (a1 && a2 <= 3) {
    id v4 = *(id *)(a1 + *off_1E5C736B0[a2]);
  }
  return v4;
}

- (void)_widthForAccessoryButtonType:(uint64_t)a1
{
  if (a1)
  {
    if (a2 < 2)
    {
      fmin(-[SFNavigationBarMetrics urlOutlineHeight](*(void *)(a1 + 632)), 44.0);
    }
    else if (a2 == 2)
    {
      if (objc_msgSend(*(id *)(a1 + 864), "hasHiddenElements", 0.0)) {
        [*(id *)(a1 + 728) intrinsicContentSize];
      }
      else {
        [MEMORY[0x1E4F782F0] glyphSize];
      }
    }
    else if (a2 == 3)
    {
      uint64_t v3 = *(void *)(a1 + 632);
      -[SFNavigationBarMetrics urlOutlineHeight](v3);
    }
  }
}

- (void)_lockImageTintColorForSquishTransformFactor:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[110];
    double v3 = 0.0;
    if (a1[101] != 1)
    {
      SFBarBackgroundAlphaForSquishTransformFactor();
      double v3 = v4;
    }
    a1 = [v2 platterTextColorForPlatterAlpha:v3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_searchIndicatorColorForSquishTransformFactor:(id *)a1
{
  if (a1)
  {
    uint64_t v2 = a1;
    double v3 = [a1[108] text];
    uint64_t v4 = [v3 length];

    id v5 = v2[110];
    if (v4)
    {
      double v6 = 0.0;
      if (v2[101] != (id)1) {
        SFBarBackgroundAlphaForSquishTransformFactor();
      }
      a1 = [v5 platterTextColorForPlatterAlpha:v6];
    }
    else
    {
      a1 = [v2[110] platterPlaceholderTextColor];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateFakeViews
{
  if (a1)
  {
    double v2 = *(double *)(a1 + 536);
    double v3 = *(double *)(a1 + 544) - v2;
    [*(id *)(a1 + 456) bounds];
    CGFloat v5 = v4;
    double v6 = *(void **)(a1 + 512);
    [v6 bounds];
    objc_msgSend(v6, "convertRect:toView:", *(void *)(a1 + 456));
    double MaxX = CGRectGetMaxX(v45);
    v46.origin.CGFloat y = 0.0;
    v46.origin.CGFloat x = v2;
    v46.size.CGFloat width = v3;
    v46.size.CGFloat height = v5;
    CGFloat v8 = CGRectGetMaxX(v46);
    double v9 = fmax(MaxX - v2, 0.0);
    if (v8 > MaxX) {
      double v3 = v9;
    }
    id v43 = [*(id *)(a1 + 456) font];
    [v43 ascender];
    double v11 = v10;
    [*(id *)(a1 + 456) _firstLineBaselineFrameOriginY];
    double v13 = v12 - v11 + -1.0;
    [v43 descender];
    double v15 = v11 - v14 + 1.0;
    UIRoundToViewScale();
    objc_msgSend(*(id *)(a1 + 456), "convertRect:toView:", *(void *)(a1 + 680), v2, v13, v3, v16 + v15);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [*(id *)(a1 + 680) bounds];
    v55.origin.CGFloat x = v25;
    v55.origin.CGFloat y = v26;
    v55.size.CGFloat width = v27;
    v55.size.CGFloat height = v28;
    v47.origin.CGFloat x = v18;
    v47.origin.CGFloat y = v20;
    v47.size.CGFloat width = v22;
    v47.size.CGFloat height = v24;
    CGRect v48 = CGRectIntersection(v47, v55);
    CGFloat x = v48.origin.x;
    CGFloat y = v48.origin.y;
    CGFloat width = v48.size.width;
    CGFloat height = v48.size.height;
    if (CGRectIsNull(v48))
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    CGRectGetMinX(v49);
    _SFFloorFloatToPixels();
    double v33 = v50.origin.x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGRectGetMinY(v50);
    _SFFloorFloatToPixels();
    double v35 = v34;
    v51.origin.CGFloat x = v33;
    v51.origin.CGFloat y = v35;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    CGRectGetMaxX(v51);
    _SFFloorFloatToPixels();
    double v37 = v36;
    v52.origin.CGFloat x = v33;
    v52.origin.CGFloat y = v35;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGFloat v38 = v37 - CGRectGetMinX(v52);
    v53.origin.CGFloat x = v33;
    v53.origin.CGFloat y = v35;
    v53.size.CGFloat width = v38;
    v53.size.CGFloat height = height;
    CGRectGetMaxY(v53);
    _SFFloorFloatToPixels();
    double v40 = v39;
    v54.origin.CGFloat x = v33;
    v54.origin.CGFloat y = v35;
    v54.size.CGFloat width = v38;
    v54.size.CGFloat height = height;
    objc_msgSend(*(id *)(a1 + 528), "setFrame:", v33, v35, v38, v40 - CGRectGetMinY(v54));
    id v41 = (id)[*(id *)(a1 + 888) _clearButton];
    long long v42 = *(void **)(a1 + 888);
    [v42 clearButtonRect];
    objc_msgSend(v42, "convertRect:toView:", *(void *)(a1 + 680));
    _SFRoundRectToPixels();
    objc_msgSend(*(id *)(a1 + 552), "ss_setUntransformedFrame:");
  }
}

- (id)_hitTestCandidateViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[_SFNavigationBar _setUpFormatToggleButtonIfNeeded](a1);
    uint64_t v2 = *(void *)(a1 + 760);
    if (*(unsigned char *)(a1 + 856))
    {
      uint64_t v15 = *(void *)(a1 + 728);
      uint64_t v16 = v2;
      uint64_t v3 = *(void *)(a1 + 744);
      uint64_t v17 = *(void *)(a1 + 736);
      uint64_t v18 = v3;
      uint64_t v19 = *(void *)(a1 + 784);
      double v4 = (void *)MEMORY[0x1E4F1C978];
      CGFloat v5 = &v15;
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 728);
      uint64_t v12 = v2;
      uint64_t v7 = *(void *)(a1 + 744);
      uint64_t v13 = *(void *)(a1 + 736);
      uint64_t v14 = v7;
      double v4 = (void *)MEMORY[0x1E4F1C978];
      CGFloat v5 = &v11;
      uint64_t v6 = 4;
    }
    CGFloat v8 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
    double v9 = (void *)[v8 mutableCopy];

    if (*(void *)(a1 + 800)) {
      objc_msgSend(v9, "addObject:");
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  CGFloat v8 = [(_SFNavigationBar *)self layer];
  double v9 = [(_SFNavigationBar *)self layer];
  double v10 = [v9 presentationLayer];
  objc_msgSend(v8, "convertPoint:toLayer:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  v76.receiver = self;
  v76.super_class = (Class)_SFNavigationBar;
  -[_SFNavigationBar hitTest:withEvent:](&v76, sel_hitTest_withEvent_, v7, v12, v14);
  uint64_t v15 = (_SFNavigationBarURLButton *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    uint64_t v18 = 0;
    goto LABEL_31;
  }
  if ([(UIButton *)self->_compressedBarButton isUserInteractionEnabled])
  {
    compressedBarButton = self->_compressedBarButton;
LABEL_4:
    uint64_t v17 = compressedBarButton;
LABEL_30:
    uint64_t v18 = (_SFNavigationBarURLButton *)v17;
    goto LABEL_31;
  }
  if (self->_expanded)
  {
    -[UITextField convertPoint:fromView:](self->_textField, "convertPoint:fromView:", self, v12, v14);
    double v20 = v19;
    double v22 = v21;
    if (-[UITextField pointInside:withEvent:](self->_textField, "pointInside:withEvent:", v7))
    {
      -[UITextField hitTest:withEvent:](self->_textField, "hitTest:withEvent:", v7, v20, v22);
      uint64_t v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (self->_usesNarrowLayout)
    {
      [(UIButton *)self->_cancelButton frame];
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      CGRect v51 = [(UIButton *)self->_cancelButton superview];
      -[_SFNavigationBar convertRect:fromView:](self, "convertRect:fromView:", v51, v44, v46, v48, v50);
      CGFloat v53 = v52;
      CGFloat v55 = v54;
      CGFloat v57 = v56;
      CGFloat v59 = v58;

      if ([(_SFNavigationBar *)self _sf_usesLeftToRightLayout])
      {
        v82.origin.double x = v53;
        v82.origin.double y = v55;
        v82.size.CGFloat width = v57;
        v82.size.CGFloat height = v59;
        if (v12 >= CGRectGetMinX(v82)) {
          goto LABEL_34;
        }
      }
      v83.origin.double x = v53;
      v83.origin.double y = v55;
      v83.size.CGFloat width = v57;
      v83.size.CGFloat height = v59;
      if (v12 <= CGRectGetMaxX(v83))
      {
LABEL_34:
        compressedBarButton = self->_cancelButton;
        goto LABEL_4;
      }
    }
LABEL_29:
    uint64_t v17 = v15;
    goto LABEL_30;
  }
  uint64_t v23 = [(SFNavigationBarItem *)self->_item overlayConfiguration];
  if (v23)
  {
    CGFloat v24 = (void *)v23;
    int v25 = [(_SFNavigationBarURLButton *)v15 isDescendantOfView:self->_URLOutline];

    if (v25) {
      goto LABEL_29;
    }
  }
  CGFloat v26 = -[_SFNavigationBar _hitTestCandidateViews]((uint64_t)self);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    v29 = 0;
    uint64_t v30 = *(void *)v73;
    double v31 = 10.0;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v73 != v30) {
          objc_enumerationMutation(v26);
        }
        double v33 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (v33)
        {
          [*(id *)(*((void *)&v72 + 1) + 8 * i) alpha];
          if (v34 >= 0.01 && ([v33 isHidden] & 1) == 0)
          {
            double v35 = [v33 superview];

            if (v35)
            {
              [v33 bounds];
              objc_msgSend(v33, "convertRect:toView:", self);
              CGFloat v36 = v80.origin.x;
              CGFloat v37 = v80.origin.y;
              CGFloat width = v80.size.width;
              CGFloat height = v80.size.height;
              double v40 = CGRectGetMinX(v80) - v12;
              v81.origin.double x = v36;
              v81.origin.double y = v37;
              v81.size.CGFloat width = width;
              v81.size.CGFloat height = height;
              double v41 = fmax(v40, v12 - CGRectGetMaxX(v81));
              if (v41 < v31)
              {
                long long v42 = v33;

                v29 = v42;
                double v31 = v41;
              }
            }
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v28);
  }
  else
  {
    v29 = 0;
    double v31 = 10.0;
  }
  URLOutline = self->_URLOutline;
  [(_SFNavigationBarURLButton *)URLOutline bounds];
  -[_SFNavigationBarURLButton convertRect:toView:](URLOutline, "convertRect:toView:", self);
  if (!v29)
  {
    CGFloat v66 = v62;
    CGFloat v67 = v63;
    CGFloat v68 = v64;
    CGFloat v69 = v65;
    double v70 = CGRectGetMinX(*(CGRect *)&v62) - v12;
    v84.origin.double x = v66;
    v84.origin.double y = v67;
    v84.size.CGFloat width = v68;
    v84.size.CGFloat height = v69;
    if (fmax(v70, v12 - CGRectGetMaxX(v84)) >= v31) {
      v29 = 0;
    }
    else {
      v29 = self->_URLOutline;
    }
  }
  if (v29) {
    v71 = v29;
  }
  else {
    v71 = v15;
  }
  uint64_t v18 = v71;

LABEL_31:

  return v18;
}

- (id)_expandedURLLabelParagraphStyle
{
  if (a1)
  {
    uint64_t v2 = (void *)_expandedURLLabelParagraphStyle_paragraphStyle;
    if (!_expandedURLLabelParagraphStyle_paragraphStyle)
    {
      uint64_t v3 = [MEMORY[0x1E4FB1380] defaultParagraphStyle];
      uint64_t v4 = [v3 mutableCopy];
      CGFloat v5 = (void *)_expandedURLLabelParagraphStyle_paragraphStyle;
      _expandedURLLabelParagraphStyle_paragraphStyle = v4;

      [(id)_expandedURLLabelParagraphStyle_paragraphStyle setBaseWritingDirection:0];
      [(id)_expandedURLLabelParagraphStyle_paragraphStyle setLineBreakMode:2];
      uint64_t v2 = (void *)_expandedURLLabelParagraphStyle_paragraphStyle;
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateText
{
  v28[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SFNavigationBarItem *)self->_item text];
  uint64_t v4 = [(SFNavigationBarItem *)self->_item textWhenExpanded];
  uint64_t v25 = [(SFNavigationBarItem *)self->_item startIndexOfTextInExpandedText];
  if (![v3 length])
  {
    double v9 = v4;
    double v10 = [(UITextField *)self->_textField placeholder];
    [(SFURLLabel *)self->_URLLabel setText:v10];
    goto LABEL_9;
  }
  [(SFURLLabel *)self->_URLLabel setText:v3];
  if (![(SFNavigationBarItem *)self->_item showsSecurityAnnotation])
  {
    securityAnnotationLabel = self->_securityAnnotationLabel;
    double v8 = 0.0;
    goto LABEL_7;
  }
  [(UILabel *)self->_availabilityLabel alpha];
  if (v5 == 0.0)
  {
    uint64_t v6 = self->_securityAnnotationLabel;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __31___SFNavigationBar__updateText__block_invoke;
    v26[3] = &unk_1E5C724D8;
    v26[4] = self;
    [MEMORY[0x1E4FB1EB0] transitionWithView:v6 duration:5242880 options:v26 animations:0 completion:0.1];
    securityAnnotationLabel = self->_securityAnnotationLabel;
    double v8 = 1.0;
LABEL_7:
    [(UILabel *)securityAnnotationLabel setAlpha:v8];
  }
  double v9 = v4;
  double v10 = v4;
LABEL_9:
  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v10) {
    double v12 = v10;
  }
  else {
    double v12 = &stru_1EFB97EB8;
  }
  v27[0] = *MEMORY[0x1E4FB12D0];
  double v13 = -[_SFNavigationBar _expandedURLLabelParagraphStyle](self);
  v28[0] = v13;
  v27[1] = *MEMORY[0x1E4FB12B0];
  double v14 = [(UILabel *)self->_expandedURLLabel font];
  v28[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v16 = (NSAttributedString *)[v11 initWithString:v12 attributes:v15];
  attributedTextWhenExpanded = self->_attributedTextWhenExpanded;
  self->_attributedTextWhenExpanded = v16;

  [(UILabel *)self->_expandedURLLabel setAttributedText:self->_attributedTextWhenExpanded];
  if ([v3 length])
  {
    if (v25 && v25 != 0x7FFFFFFFFFFFFFFFLL && [v9 length])
    {
      uint64_t v18 = CTLineCreateWithAttributedString((CFAttributedStringRef)self->_attributedTextWhenExpanded);
      if ([v3 characterAtIndex:0] == 8206) {
        CFIndex v19 = v25 + 1;
      }
      else {
        CFIndex v19 = v25;
      }
      OffsetForStringIndedouble x = CTLineGetOffsetForStringIndex(v18, v19, 0);
      if (self->_usesNarrowLayout) {
        double v21 = -[SFNavigationBarMetrics narrowEditingScaleFactor]((uint64_t)self->_barMetrics);
      }
      else {
        double v21 = 1.0;
      }
      self->_offsetOfURLInExpandedURL = OffsetForStringIndex / v21;
      CFRelease(v18);
    }
    else
    {
      self->_offsetOfURLInExpandedURL = 0.0;
    }
  }
  else
  {
    [(_SFNavigationBar *)self placeholderHorizontalInset];
    self->_offsetOfURLInExpandedURL = v22;
  }
  [(UIView *)self->_fakeTextFieldSelectionView removeFromSuperview];
  fakeTextFieldSelectionView = self->_fakeTextFieldSelectionView;
  self->_fakeTextFieldSelectionView = 0;

  [(UIButton *)self->_fakeClearButton removeFromSuperview];
  fakeClearButton = self->_fakeClearButton;
  self->_fakeClearButton = 0;

  -[_SFNavigationBar _updateSearchIndicator]((uint64_t)self);
  -[_SFNavigationBar _updateTextColor]((uint64_t)self);
  -[_SFNavigationBar _updateTextMetrics]((uint64_t)self);
  [(_SFNavigationBar *)self setNeedsLayout];
}

- (void)_updateSearchIndicator
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 648) superview];

    if (v2)
    {
      [*(id *)(a1 + 648) intrinsicContentSize];
      double v4 = v3;
      double v6 = v5;
      id v7 = -[SFNavigationBarMetrics accessoryImageSymbolConfiguration](*(void **)(a1 + 632));
      [*(id *)(a1 + 648) setPreferredSymbolConfiguration:v7];

      double v8 = -[SFNavigationBarMetrics squishedAccessoryImageSymbolConfiguration](*(void **)(a1 + 632));
      [*(id *)(a1 + 656) setPreferredSymbolConfiguration:v8];

      [*(id *)(a1 + 648) intrinsicContentSize];
      if (v4 != v10 || v6 != v9)
      {
        [(id)a1 setNeedsLayout];
      }
    }
  }
}

- (id)_notSecureAnnotationColor
{
  if (a1)
  {
    uint64_t v2 = a1;
    if ([a1[108] hasFocusedSensitiveFieldOnCurrentPage]) {
      -[_SFNavigationBar _notSecureWarningColor](v2);
    }
    else {
      -[_SFNavigationBar _notSecureGrayColor](v2);
    }
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_notSecureGrayColor
{
  if (a1)
  {
    uint64_t v2 = a1;
    double v3 = (void *)a1[110];
    [a1 minimumHeight];
    [v2 bounds];
    double v4 = 0.0;
    if (v2[101] != 1) {
      SFBarBackgroundAlphaForSquishTransformFactor();
    }
    a1 = [v3 annotationTextColorForPlatterAlpha:v4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (v4)
  {
    double v6 = [(SFNavigationBarItem *)self->_item textWhenExpanded];
    uint64_t v7 = [v6 length];

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[_SFNavigationBar setExpanded:textFieldSelectionRange:completionHandler:](self, "setExpanded:textFieldSelectionRange:completionHandler:", v4, v8, v7, v9);
}

- (void)setLockdownStatusBar:(id)a3
{
  double v5 = (SFLockdownStatusBar *)a3;
  p_lockdownStatusBar = &self->_lockdownStatusBar;
  lockdownStatusBar = self->_lockdownStatusBar;
  if (lockdownStatusBar != v5)
  {
    double v10 = v5;
    if (lockdownStatusBar) {
      [(SFLockdownStatusBar *)lockdownStatusBar removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_lockdownStatusBar, a3);
    uint64_t v8 = [(SFLockdownStatusBar *)*p_lockdownStatusBar layer];
    objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.0);

    [(_SFNavigationBar *)self addSubview:*p_lockdownStatusBar];
    [(_SFNavigationBar *)self defaultHeight];
    self->_maximumHeight = v9;
    [(_SFNavigationBar *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4
{
}

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  BOOL v7 = a3;
  id v9 = a5;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke;
  v49[3] = &unk_1E5C72CB0;
  id v10 = v9;
  id v50 = v10;
  uint64_t v11 = MEMORY[0x1AD0C36A0](v49);
  double v12 = (void *)v11;
  if (self->_expanded == v7)
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }
  else
  {
    self->_BOOL expanded = v7;
    LODWORD(v13) = self->_shouldHidePlaceholderURLItemsForPencilInput;
    double v14 = dispatch_group_create();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_2;
    v48[3] = &unk_1E5C724D8;
    v48[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v48];
    dispatch_group_enter(v14);
    uint64_t v15 = (void *)MEMORY[0x1E4FB1EB0];
    if (self->_expanded) {
      double v16 = 0.0;
    }
    else {
      double v16 = 0.1;
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_3;
    v47[3] = &unk_1E5C724D8;
    v47[4] = self;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    void v45[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_4;
    v45[3] = &unk_1E5C73530;
    v45[4] = self;
    uint64_t v17 = v14;
    double v46 = v17;
    [v15 animateWithDuration:50659328 delay:v47 options:v45 animations:0.2 completion:v16];
    dispatch_group_enter(v17);
    uint64_t v18 = (void *)MEMORY[0x1E4FB1EB0];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_5;
    v44[3] = &unk_1E5C724D8;
    v44[4] = self;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_6;
    v42[3] = &unk_1E5C72678;
    CFIndex v19 = v17;
    double v43 = v19;
    [v18 _animateUsingDefaultTimingWithOptions:0 animations:v44 completion:v42];
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(SFNavigationBarItem *)self->_item textWhenExpanded];
      double v13 = v20 = (int)v13;
      uint64_t v21 = [v13 length];

      LOBYTE(v13) = v20;
      if (!v20)
      {
        if (v21)
        {
          dispatch_group_enter(v19);
          double v22 = (void *)MEMORY[0x1E4FB1EB0];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_7;
          v38[3] = &unk_1E5C73558;
          v38[4] = self;
          NSUInteger v40 = location;
          NSUInteger v41 = length;
          uint64_t v23 = v19;
          double v39 = v23;
          [v22 performWithoutAnimation:v38];
          dispatch_group_enter(v23);
          CGFloat v24 = (void *)MEMORY[0x1E4FB1EB0];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_8;
          v37[3] = &unk_1E5C724D8;
          v37[4] = self;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_9;
          v35[3] = &unk_1E5C72678;
          uint64_t v25 = v23;
          CGFloat v36 = v25;
          [v24 _animateWithDuration:50724864 delay:self options:v37 factory:v35 animations:0.2 completion:0.0];
          dispatch_group_enter(v25);
          CGFloat v26 = (void *)MEMORY[0x1E4FB1EB0];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_10;
          v33[3] = &unk_1E5C72238;
          v33[4] = self;
          double v34 = v25;
          [v26 performWithoutAnimation:v33];
        }
      }
    }
    dispatch_group_enter(v19);
    uint64_t v27 = (void *)MEMORY[0x1E4FB1EB0];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_11;
    v32[3] = &unk_1E5C724D8;
    v32[4] = self;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12;
    v29[3] = &unk_1E5C73580;
    char v31 = (char)v13;
    v29[4] = self;
    uint64_t v30 = v19;
    uint64_t v28 = v19;
    [v27 _animateUsingDefaultTimingWithOptions:0 animations:v32 completion:v29];
    dispatch_group_notify(v28, MEMORY[0x1E4F14428], v12);
  }
}

- (void)_updateAvailabilityAndPageMenuButtonAnimated:(uint64_t)a1
{
  if (a1)
  {
    if ([*(id *)(a1 + 408) isDisplaying])
    {
      if (-[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(void *)(a1 + 720), 2)) {
        BOOL v4 = *(unsigned char *)(a1 + 859) == 0;
      }
      else {
        BOOL v4 = 0;
      }
      uint64_t v6 = [*(id *)(a1 + 408) currentOptions];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke;
      v9[3] = &unk_1E5C722B0;
      BOOL v10 = v4;
      v9[4] = a1;
      v9[5] = v6;
      uint64_t v7 = MEMORY[0x1AD0C36A0](v9);
      uint64_t v8 = (void *)v7;
      if (a2) {
        (*(void (**)(uint64_t))(v7 + 16))(v7);
      }
      else {
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
      }
    }
    else
    {
      [*(id *)(a1 + 472) alpha];
      if (v5 == 0.0)
      {
        -[_SFNavigationBar _updateFormatButtonSelected]((id *)a1);
      }
      else
      {
        -[_SFNavigationBar _hideAvailabilityLabelAnimated:](a1, a2);
      }
    }
  }
}

- (uint64_t)_setHidePlaceholderURLItemsForPencilInput:(uint64_t)result
{
  if (result)
  {
    double v3 = (id *)result;
    if (*(unsigned __int8 *)(result + 640) != a2)
    {
      *(unsigned char *)(result + 640) = a2;
      [*(id *)(result + 432) setHidden:a2];
      [v3[111] setClearsPlaceholderOnBeginEditing:a2];
      [v3[108] setTemporarilySuppressText:a2];
      [v3 _updateText];
      -[_SFNavigationBar _updateFakeViews]((uint64_t)v3);
      return -[_SFNavigationBar _updateAccessoryButtonsVisibility]((uint64_t)v3);
    }
  }
  return result;
}

- (void)setControlsHidden:(BOOL)a3
{
  if (self->_controlsHidden != a3)
  {
    self->_controlsHidden = a3;
    -[_SFNavigationBar _updateSeparatorAlpha]((uint64_t)self);
    [(_SFNavigationBar *)self setNeedsLayout];
  }
}

- (void)setMinimumBackdropHeight:(double)a3
{
  if (self->_minimumBackdropHeight != a3)
  {
    self->_minimumBackdropHeight = a3;
    [(_SFNavigationBar *)self setNeedsLayout];
  }
}

- (CGRect)URLOutlineFrameInNavigationBarSpace
{
  [(_SFNavigationBarURLButton *)self->_URLOutline bounds];
  URLOutline = self->_URLOutline;

  -[_SFNavigationBar convertRect:fromView:](self, "convertRect:fromView:", URLOutline);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)urlOutlineFrameRelativeToView:(id)a3
{
  id v4 = a3;
  [(_SFNavigationBar *)self URLOutlineFrameInNavigationBarSpace];
  -[_SFNavigationBar convertRect:toView:](self, "convertRect:toView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_updateShowsLockIcon
{
  int v3 = [(SFNavigationBarItem *)self->_item showsLockIcon];
  lockView = self->_lockView;
  if (v3)
  {
    if (!lockView)
    {
      double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v6 = self->_lockView;
      self->_lockView = v5;

      double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
      [(UIImageView *)self->_lockView setImage:v7];
      [(UIImageView *)self->_lockView setTintAdjustmentMode:1];
      double v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      squishedLockView = self->_squishedLockView;
      self->_squishedLockView = v8;

      [(UIImageView *)self->_squishedLockView setImage:v7];
      [(UIImageView *)self->_squishedLockView setTintAdjustmentMode:1];
      double v10 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
      lockEffectView = self->_lockEffectView;
      self->_lockEffectView = v10;

      double v12 = _SFBackdropGroupNameForOwner();
      [(UIVisualEffectView *)self->_lockEffectView _setGroupName:v12];

      double v13 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
      squishedLockEffectView = self->_squishedLockEffectView;
      self->_squishedLockEffectView = v13;

      double v15 = _SFBackdropGroupNameForOwner();
      [(UIVisualEffectView *)self->_squishedLockEffectView _setGroupName:v15];
    }
    [(_SFNavigationBarLabelsContainer *)self->_labelsContainer addSubview:self->_lockEffectView];
    double v16 = [(UIVisualEffectView *)self->_lockEffectView contentView];
    [v16 addSubview:self->_lockView];

    [(UIView *)self->_squishedURLAccessoryItemsContainer addSubview:self->_squishedLockEffectView];
    uint64_t v17 = [(UIVisualEffectView *)self->_squishedLockEffectView contentView];
    [v17 addSubview:self->_squishedLockView];

    self->_lockViewNeedsUpdate = 1;
  }
  else if (lockView)
  {
    [(UIImageView *)lockView removeFromSuperview];
    [(UIImageView *)self->_squishedLockView removeFromSuperview];
  }
  -[_SFNavigationBar _updateActiveURLLabelAccessory]((uint64_t)self);

  [(_SFNavigationBar *)self setNeedsLayout];
}

- (void)_hideAvailabilityLabelAnimated:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 472) alpha];
    if (v4 != 0.0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke;
      v7[3] = &unk_1E5C724D8;
      v7[4] = a1;
      uint64_t v5 = MEMORY[0x1AD0C36A0](v7);
      double v6 = (void *)v5;
      if (a2) {
        (*(void (**)(uint64_t))(v5 + 16))(v5);
      }
      else {
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
      }
    }
  }
}

- (void)_updateFormatButtonSelected
{
  if (a1)
  {
    if (([a1[108] readerButtonSelected] & 1) != 0
      || ([a1[108] showsTranslationIcon] & 1) != 0)
    {
      uint64_t v2 = 1;
    }
    else
    {
      uint64_t v2 = [a1[108] showsSiriReaderPlayingIcon];
    }
    [a1[91] setSelected:v2];
    int v3 = -[_SFNavigationBar _formatToggleButtonImage](a1);
    [a1[91] setImage:v3];

    -[_SFNavigationBar _updateNavigationBarTrailingButtonType]((uint64_t)a1);
  }
}

- (uint64_t)_adjustLabelRectForLeadingButtonWithDelay:(uint64_t)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __62___SFNavigationBar__adjustLabelRectForLeadingButtonWithDelay___block_invoke;
    v2[3] = &unk_1E5C724D8;
    v2[4] = result;
    return [MEMORY[0x1E4FB1EB0] _animateUsingDefaultDampedSpringWithDelay:50331652 initialSpringVelocity:v2 options:0 animations:a2 completion:0.0];
  }
  return result;
}

- (id)_mediaStateMuteButtonColor
{
  if (a1)
  {
    uint64_t v2 = a1;
    if ([a1[110] backdropIsRed]) {
      [v2[110] URLAccessoryButtonTintColorForInputMode:v2[101]];
    }
    else {
    a1 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateSecurityWarningsVisibility
{
  if ([(SFNavigationBarItem *)self->_item showsSecurityAnnotation]
    && ([(SFNavigationBarItem *)self->_item hasFocusedSensitiveFieldOnCurrentPage] & 1) == 0)
  {
    [(_SFNavigationBar *)self layoutIfNeeded];
    [(_SFNavigationBar *)self setNeedsLayout];
    [(_SFNavigationBar *)self _updateText];
    self->_shouldAnimateURLMovement = 1;
    labelsContainer = self->_labelsContainer;
    if (labelsContainer) {
      labelsContainer->_shouldAnimateBoundsChanges = 1;
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53___SFNavigationBar__updateSecurityWarningsVisibility__block_invoke;
    v5[3] = &unk_1E5C724D8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.35 options:0.0 animations:2.5 completion:0.0];
    self->_shouldAnimateURLMovement = 0;
    double v4 = self->_labelsContainer;
    if (v4) {
      v4->_shouldAnimateBoundsChanges = 0;
    }
  }
  else if ([(SFNavigationBarItem *)self->_item showsSecurityAnnotation])
  {
    [(_SFNavigationBar *)self _updateText];
  }
  else
  {
    [(_SFNavigationBar *)self setNeedsLayout];
  }
}

- (void)setContentUnderStatusBarHeight:(double)a3
{
  if (self->_contentUnderStatusBarHeight != a3)
  {
    self->_double contentUnderStatusBarHeight = a3;
    -[SFNavigationBarMetrics updateForStatusBarHeight:]((uint64_t)self->_barMetrics, a3);
    [(_SFNavigationBar *)self setNeedsLayout];
  }
}

- (void)setSuppressesBlur:(BOOL)a3
{
  if (self->_suppressesBlur != a3)
  {
    self->_suppressesBlur = a3;
    [(UIVisualEffectView *)self->_backdrop setAllowsBlurring:!a3];
    double v4 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(_SFNavigationBar *)a3 setSuppressesBlur:v5];
    }
  }
}

- (void)setUsesFaintSeparator:(BOOL)a3
{
  if (self->_usesFaintSeparator != a3)
  {
    self->_usesFaintSeparator = a3;
    if (a3) {
      objc_msgSend(MEMORY[0x1E4FB1618], "sf_secondaryBarHairlineOutlineColor");
    }
    else {
    double v4 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineShadowColor");
    }
    [(UIView *)self->_separator setBackgroundColor:v4];

    -[_SFNavigationBar _updateSeparatorAlpha]((uint64_t)self);
  }
}

- (void)setBackdropGroupDisabled:(BOOL)a3
{
  if (((!self->_backdropGroupDisabled ^ a3) & 1) == 0)
  {
    self->_backdropGroupDisabled = a3;
    if (a3) {
      backdropGroupName = 0;
    }
    else {
      backdropGroupName = self->_backdropGroupName;
    }
    [(UIVisualEffectView *)self->_backdrop _setGroupName:backdropGroupName];
  }
}

- (void)setBackdropGroupName:(id)a3
{
  double v4 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v4)
  {
    double v10 = v4;
    BOOL v6 = [(NSString *)backdropGroupName isEqualToString:v4];
    double v4 = v10;
    if (!v6)
    {
      double v7 = (NSString *)[(NSString *)v10 copy];
      double v8 = self->_backdropGroupName;
      self->_backdropGroupName = v7;

      if (self->_backdropGroupDisabled) {
        double v9 = 0;
      }
      else {
        double v9 = self->_backdropGroupName;
      }
      [(UIVisualEffectView *)self->_backdrop _setGroupName:v9];
      double v4 = v10;
    }
  }
}

- (void)_notSecureWarningColor
{
  if (a1)
  {
    uint64_t v2 = a1;
    int v3 = (void *)a1[110];
    [a1 minimumHeight];
    [v2 bounds];
    double v4 = 0.0;
    if (v2[101] != 1) {
      SFBarBackgroundAlphaForSquishTransformFactor();
    }
    a1 = [v3 platterWarningTextColorForPlatterAlpha:v4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_placeholderText
{
  uint64_t v2 = [(SFNavigationBarItem *)self->_item customPlaceholderText];
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    _WBSLocalizedString();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v4 = v3;

  return v4;
}

- (id)textForNavigationBarURLButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained navigationBarURLForSharing:self];
  BOOL v6 = objc_msgSend(v5, "safari_userVisibleString");

  return v6;
}

- (BOOL)navigationBarURLButton:(id)a3 shouldShowMenuForGestureWithRecognizer:(id)a4
{
  id v5 = a4;
  if (-[SFNavigationBarAccessoryButtonArrangement containsButtonType:]((uint64_t)self->_accessoryButtonArrangement, 3))
  {
    mediaStateMuteButton = self->_mediaStateMuteButton;
    [v5 locationInView:mediaStateMuteButton];
    int v7 = -[UIButton pointInside:withEvent:](mediaStateMuteButton, "pointInside:withEvent:", 0) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_copyNavigationBarURLToPasteboard
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 904));
    id v5 = [WeakRetained navigationBarURLForSharing:a1];

    id v3 = objc_msgSend(v5, "safari_userVisibleString");
    double v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v4 setString:v3];
  }
}

- (void)navigationBarURLButtonDidReceivePasteCommand:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    BOOL v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65___SFNavigationBar_navigationBarURLButtonDidReceivePasteCommand___block_invoke;
    v7[3] = &unk_1E5C735C8;
    objc_copyWeak(&v9, &location);
    id v8 = WeakRetained;
    objc_msgSend(v6, "safari_bestStringForPastingIntoURLFieldCompletionHandler:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (BOOL)navigationBarURLButtonShouldCopy:(id)a3
{
  id v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained navigationBarURLForSharing:v3];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (BOOL)navigationBarURLButtonShouldPaste:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  char v6 = objc_msgSend(v5, "safari_canPasteAndNavigate");

  return v6;
}

- (BOOL)navigationBarURLButton:(id)a3 shouldAllowLongPressAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = v7;
  if (v7 && *((void *)v7 + 105))
  {
    LOBYTE(v9) = 0;
  }
  else if ([(SFNavigationBarToggleButton *)self->_formatToggleButton isHidden])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    [(SFNavigationBarToggleButton *)self->_formatToggleButton bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    -[SFNavigationBarToggleButton convertPoint:fromView:](self->_formatToggleButton, "convertPoint:fromView:", v8, x, y);
    v21.double x = v18;
    v21.double y = v19;
    v22.origin.double x = v11;
    v22.origin.double y = v13;
    v22.size.CGFloat width = v15;
    v22.size.CGFloat height = v17;
    BOOL v9 = !CGRectContainsPoint(v22, v21);
  }

  return v9;
}

- (void)navigationBarURLButtonDidRequestFocusForPencilInput:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(_SFNavigationBar *)self textField];
    int v8 = [v7 isFirstResponder];
    BOOL v9 = WBS_LOG_CHANNEL_PREFIXPencilInput();
    double v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_SFNavigationBar navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:]();
      }
      v5[2](v5);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[_SFNavigationBar navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:](v10, v7);
      }
      [v7 setText:&stru_1EFB97EB8];
      -[_SFNavigationBar _updateTemporarySuppressionOfItemText:]((id *)&self->super.super.super.isa, 1);
      [WeakRetained navigationBarURLWasTapped:self completionHandler:v5];
    }
  }
  else
  {
    v5[2](v5);
  }
}

- (void)_updateTemporarySuppressionOfItemText:(id *)a1
{
  if (a1)
  {
    [a1[108] setTemporarilySuppressText:a2];
    [a1 _updateText];
    -[_SFNavigationBar _updateFakeViews]((uint64_t)a1);
  }
}

- (void)navigationBarURLButtonBeginSuppressingPlaceholder:(id)a3
{
}

- (void)navigationBarURLButtonEndSuppressingPlaceholder:(id)a3
{
}

- (BOOL)textFieldIsEditableForNavigationBarURLButton:(id)a3
{
  return self->_inputMode == 0;
}

- (BOOL)navigationBarURLButton:(id)a3 canWriteAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  -[_SFNavigationBar _hitTestCandidateViews]((uint64_t)self);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        CGFloat v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", v7, x, y, (void)v17);
        double v14 = objc_msgSend(v13, "hitTest:withEvent:", 0);

        if (v14)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)navigationBarURLButtonIsUsingNarrowLayout:(id)a3
{
  return self->_usesNarrowLayout;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
}

- (id)_timingFunctionForAnimation
{
  LODWORD(v3) = 1036831949;
  LODWORD(v4) = 1044395118;
  LODWORD(v2) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)[MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :v3 :v4 :v5];
}

- (BOOL)canBecomeFirstResponder
{
  double v3 = [(_SFNavigationBar *)self inputAccessoryView];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFNavigationBar;
    BOOL v4 = [(_SFNavigationBar *)&v6 canBecomeFirstResponder];
  }

  return v4;
}

- (id)newTextField
{
  return 0;
}

- (double)placeholderHorizontalInset
{
  return 0.0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  mediaStateMuteButton = self->_mediaStateMuteButton;
  v29[0] = self->_formatToggleButton;
  v29[1] = mediaStateMuteButton;
  stopButton = self->_stopButton;
  v29[2] = self->_reloadButton;
  v29[3] = stopButton;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  uint64_t v9 = (void *)[v8 mutableCopy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    double v14 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        double v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v5, "locationInView:", v16, (void)v23);
        long long v17 = objc_msgSend(v16, "hitTest:withEvent:", 0);

        if (v17)
        {
          id WeakRetained = v10;
          goto LABEL_19;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if ([(UITextField *)self->_textField isFirstResponder])
  {
    double v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    long long v19 = [WeakRetained navigationBarURLForSharing:self];
    if (v19)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ([WeakRetained itemProviderForNavigationBar:self],
            (long long v20 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v19];
      }
      CGPoint v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v20];
      [v21 setLocalObject:v19];
      uint64_t v27 = v21;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    }
    else
    {
      double v14 = (void *)MEMORY[0x1E4F1CBF0];
    }

LABEL_19:
  }

  return v14;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:self->_URLOutline parameters:v6];
  objc_msgSend(v8, "set_springboardParameters:", &unk_1EFBDFC18);

  return v8;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v13[3] = &unk_1E5C72678;
  v13[4] = self;
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1AD0C36A0](v13);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v11[3] = &unk_1E5C72CB0;
  id v7 = v6;
  id v12 = v7;
  [v5 addAnimations:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3;
  v9[3] = &unk_1E5C735F0;
  id v10 = v7;
  id v8 = v7;
  [v5 addCompletion:v9];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [WeakRetained currentContentUUIDForNavigationBar:self];
    [v5 setLocalContext:v7];
  }
  id v8 = [v5 items];
  uint64_t v9 = [v8 firstObject];

  id v10 = [v9 localObject];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53___SFNavigationBar_dragInteraction_sessionWillBegin___block_invoke;
  v12[3] = &unk_1E5C73618;
  id v13 = v10;
  id v11 = v10;
  [v9 setPreviewProvider:v12];
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [WeakRetained dataOwnerForNavigationBar:self];
    if ((unint64_t)(v6 - 1) >= 3) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = v6;
    }
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return [MEMORY[0x1E4F78598] canCreateNavigationIntentForDropSession:a4];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = [v6 localDragSession];

  uint64_t v9 = [v8 localContext];

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = [WeakRetained currentContentUUIDForNavigationBar:self];
    if ([v10 isEqual:v9])
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];

      goto LABEL_7;
    }
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:2];
LABEL_7:

  return v11;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F78598];
  id v6 = a4;
  int64_t v7 = [v5 builder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___SFNavigationBar_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E5C73640;
  v8[4] = self;
  [v7 buildNavigationIntentForDropSession:v6 completionHandler:v8];
}

- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo
{
  double v2 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:self->_formatToggleButton];
  [v2 setProvenance:5];

  return (_SFPopoverSourceInfo *)v2;
}

- (_SFPopoverSourceInfo)reloadButtonPopoverSourceInfo
{
  double v2 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:self->_reloadButton];

  return (_SFPopoverSourceInfo *)v2;
}

- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo
{
  double v2 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:self->_URLOutline];

  return (_SFPopoverSourceInfo *)v2;
}

- (NSArray)popoverPassthroughViews
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObject:self->_textField];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_leadingToolbar);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_trailingToolbar);
  BOOL v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, 3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animateSafariIconLinkFromPoint:inView:", v7, x, y);
}

- (id)_toolbarForBarItem:(id *)a1
{
  if (a1)
  {
    BOOL v4 = a1;
    id v5 = &OBJC_IVAR____SFNavigationBar__leadingToolbar;
    id v6 = [a1[71] barRegistration];
    char v7 = [v6 containsBarItem:a2];

    if ((v7 & 1) != 0
      || (id v5 = &OBJC_IVAR____SFNavigationBar__trailingToolbar,
          [v4[72] barRegistration],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 containsBarItem:a2],
          v8,
          v9))
    {
      a1 = (id *)*(id *)((char *)v4 + *v5);
    }
    else
    {
      a1 = 0;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  long long v20 = -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, a6);
  CGPoint v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "animateLinkImage:fromRect:inView:toBarItem:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, v17, a6, v18, v19, x, y, width, height);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __123___SFNavigationBar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke;
    v22[3] = &unk_1E5C73668;
    id v23 = v18;
    id v24 = v19;
    dispatch_async(MEMORY[0x1E4F14428], v22);
  }
}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  BOOL v4 = -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, a3);
  id v5 = [v4 popoverSourceInfoForBarItem:a3];

  return v5;
}

- (BOOL)containsBarItem:(int64_t)a3
{
  double v3 = -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)navigationBarItemDidUpdateShowsReaderButton:(id)a3
{
}

- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3
{
  self->_cachedSecurityAnnotationLabelFittingSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(_SFNavigationBar *)self _updateSecurityWarningsVisibility];
}

- (void)navigationBarItemDidUpdateCustomPlaceholderText:(id)a3
{
  -[_SFNavigationBar _updatePlaceholderText](self);

  [(_SFNavigationBar *)self _updateText];
}

- (void)navigationBarItemDidUpdateShowsTranslationButton:(id)a3
{
}

- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(WBSContentAvailabilityDisplayController *)self->_availabilityDisplayController resetDisplay];
  }
  -[WBSContentAvailabilityDisplayController updateToContentOptions:](self->_availabilityDisplayController, "updateToContentOptions:", [v6 contentOptions]);
}

- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3
{
  -[_SFNavigationBar _updateFormatButtonAccessories]((uint64_t)self);

  [(_SFNavigationBar *)self setNeedsLayout];
}

- (void)navigationBarItemDidUpdateOverlayConfiguration:(id)a3
{
  BOOL v4 = [a3 overlayConfiguration];
  -[_SFNavigationBarURLButton setOverlayConfiguration:]((uint64_t)self->_URLOutline, v4);

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67___SFNavigationBar_navigationBarItemDidUpdateOverlayConfiguration___block_invoke;
  v5[3] = &unk_1E5C724D8;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v5 completion:0];
}

- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4
{
}

- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 count];
  uint64_t v30 = v6 - 1;
  if (v6 == 1)
  {
LABEL_9:
    id v11 = [v5 lastObject];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = *MEMORY[0x1E4FB12B0];
    unint64_t v9 = 0x1E96D6000uLL;
    unint64_t v10 = 0x1E4F1C000uLL;
    id v31 = v5;
    uint64_t v29 = *MEMORY[0x1E4FB12B0];
    while (1)
    {
      id v11 = objc_msgSend(v5, "objectAtIndexedSubscript:", v7, v29);
      uint64_t v32 = v8;
      uint64_t v12 = *(int *)(v9 + 2048);
      id v13 = [*(id *)((char *)&self->super.super.super.isa + v12) font];
      v33[0] = v13;
      double v14 = [*(id *)(v10 + 2536) dictionaryWithObjects:v33 forKeys:&v32 count:1];

      uint64_t v15 = [v11 count];
      if (!v15) {
        break;
      }
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      while (1)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
        id v19 = [v11 textForOptionsAtIndex:v17];
        CFAttributedStringRef v20 = (const __CFAttributedString *)[v18 initWithString:v19 attributes:v14];

        CGPoint v21 = CTLineCreateWithAttributedString(v20);
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 0);
        CGFloat x = BoundsWithOptions.origin.x;
        CGFloat y = BoundsWithOptions.origin.y;
        CGFloat width = BoundsWithOptions.size.width;
        CGFloat height = BoundsWithOptions.size.height;
        CFRelease(v21);
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        double v26 = CGRectGetWidth(v36);
        [*(id *)((char *)&self->super.super.super.isa + v12) frame];
        double v27 = CGRectGetWidth(v37);

        if (v26 > v27) {
          break;
        }
        if (v16 == ++v17) {
          goto LABEL_10;
        }
      }

      ++v7;
      id v5 = v31;
      uint64_t v8 = v29;
      unint64_t v9 = 0x1E96D6000;
      unint64_t v10 = 0x1E4F1C000;
      if (v7 == v30) {
        goto LABEL_9;
      }
    }
LABEL_10:

    id v5 = v31;
  }

  return v11;
}

- (SFNavigationBarItem)item
{
  return self->_item;
}

- (BOOL)usesNarrowLayout
{
  return self->_usesNarrowLayout;
}

- (BOOL)unifiedFieldShowsProgressView
{
  return self->_unifiedFieldShowsProgressView;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (_SFNavigationBarTheme)effectiveTheme
{
  return self->_effectiveTheme;
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isBackdropGroupDisabled
{
  return self->_backdropGroupDisabled;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (_SFNavigationBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFNavigationBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)contentUnderStatusBarHeight
{
  return self->_contentUnderStatusBarHeight;
}

- (BOOL)suppressesBlur
{
  return self->_suppressesBlur;
}

- (BOOL)usesFaintSeparator
{
  return self->_usesFaintSeparator;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (double)minimumBackdropHeight
{
  return self->_minimumBackdropHeight;
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
}

- (BOOL)isSendingBarMetricsChangeNotification
{
  return self->_sendingBarMetricsChangeNotification;
}

- (UIBlurEffect)backdropEffect
{
  return self->_backdropEffect;
}

- (SFLockdownStatusBar)lockdownStatusBar
{
  return self->_lockdownStatusBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownStatusBar, 0);
  objc_storeStrong((id *)&self->_backdropEffect, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_effectiveTheme, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_squishedLockView, 0);
  objc_storeStrong((id *)&self->_squishedLockEffectView, 0);
  objc_storeStrong((id *)&self->_lockEffectView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_mediaStateMuteButton, 0);
  objc_storeStrong((id *)&self->_formatClickInteraction, 0);
  objc_storeStrong((id *)&self->_reloadButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_formatToggleButton, 0);
  objc_storeStrong((id *)&self->_accessoryButtonArrangement, 0);
  objc_storeStrong((id *)&self->_attributedTextWhenExpanded, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_URLOutline, 0);
  objc_storeStrong((id *)&self->_URLAccessoryItems, 0);
  objc_storeStrong((id *)&self->_squishedURLAccessoryItemsContainer, 0);
  objc_storeStrong((id *)&self->_squishedSearchIndicator, 0);
  objc_storeStrong((id *)&self->_searchIndicator, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_securityAnnotationContainer, 0);
  objc_storeStrong((id *)&self->_trailingToolbarContainer, 0);
  objc_storeStrong((id *)&self->_leadingToolbarContainer, 0);
  objc_storeStrong((id *)&self->_trailingToolbar, 0);
  objc_storeStrong((id *)&self->_leadingToolbar, 0);
  objc_storeStrong((id *)&self->_fakeClearButton, 0);
  objc_storeStrong((id *)&self->_fakeTextFieldSelectionView, 0);
  objc_storeStrong((id *)&self->_URLContainerClipView, 0);
  objc_storeStrong((id *)&self->_URLContainer, 0);
  objc_storeStrong((id *)&self->_securityAnnotationLabel, 0);
  objc_storeStrong((id *)&self->_availabilityLabel, 0);
  objc_storeStrong((id *)&self->_privateBrowsingLabel, 0);
  objc_storeStrong((id *)&self->_expandedURLLabel, 0);
  objc_storeStrong((id *)&self->_URLLabel, 0);
  objc_storeStrong((id *)&self->_labelScalingContainer, 0);
  objc_storeStrong((id *)&self->_labelsContainer, 0);
  objc_storeStrong((id *)&self->_controlsContainer, 0);
  objc_storeStrong((id *)&self->_compressedBarButton, 0);

  objc_storeStrong((id *)&self->_availabilityDisplayController, 0);
}

- (void)_dismissButtonTapped:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "_SFNavigationBarDelegate is nil", v2, v3, v4, v5, v6);
}

- (void)_dismissButtonTapped:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "_SFNavigationBarDelegate didn't implement navigationBarDoneButtonWasTapped", v2, v3, v4, v5, v6);
}

- (void)setSuppressesBlur:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"Disabled";
  if (a1) {
    uint64_t v3 = @"Enabled";
  }
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, a2, a3, "%{public}@ navigation bar blur suppression", (uint8_t *)&v4);
}

- (void)navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Text field is already first responder, so early returning", v2, v3, v4, v5, v6);
}

- (void)navigationBarURLButtonDidRequestFocusForPencilInput:(void *)a1 completionHandler:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 text];
  int v6 = 138739971;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v3, v5, "Clearing text field in order to allow pencil input to have clean slate. Current value of field: '%{sensitive}@'", (uint8_t *)&v6);
}

@end